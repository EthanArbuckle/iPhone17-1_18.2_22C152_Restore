@interface CPLClientCacheRecordView
- (CPLClientCacheRecordView)initWithLocalScopedIdentifier:(id)a3 cloudRecord:(id)a4 idMapping:(id)a5;
- (CPLEngineIDMapping)idMapping;
- (CPLRecordChange)cloudRecord;
- (CPLScopedIdentifier)localScopedIdentifier;
- (Class)recordClass;
- (id)description;
- (id)recordChangeData;
- (id)redactedDescription;
- (id)relatedScopedIdentifier;
- (id)relation;
- (id)secondaryScopedIdentifier;
- (id)sharingRecordChangeData;
- (id)synthesizedRecord;
@end

@implementation CPLClientCacheRecordView

- (id)relation
{
  v3 = [(CPLClientCacheRecordView *)self cloudRecord];
  v4 = [v3 containerScopedIdentifier];
  if (v4)
  {
    char v11 = 0;
    v5 = [(CPLClientCacheRecordView *)self idMapping];
    v6 = [v5 localScopedIdentifierForCloudScopedIdentifier:v4 isFinal:&v11];

    v7 = [v3 relation];
    v8 = (void *)[v7 copy];

    v9 = [v6 identifier];
    [v8 setContainerIdentifier:v9];
  }
  else
  {
    v8 = [v3 relation];
  }

  return v8;
}

- (Class)recordClass
{
  v2 = [(CPLClientCacheRecordView *)self cloudRecord];
  v3 = objc_opt_class();

  return (Class)v3;
}

- (id)secondaryScopedIdentifier
{
  v3 = [(CPLClientCacheRecordView *)self cloudRecord];
  v4 = [v3 secondaryScopedIdentifier];

  if (v4)
  {
    char v8 = 0;
    v5 = [(CPLClientCacheRecordView *)self idMapping];
    v6 = [v5 localScopedIdentifierForCloudScopedIdentifier:v4 isFinal:&v8];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)relatedScopedIdentifier
{
  v3 = [(CPLClientCacheRecordView *)self cloudRecord];
  v4 = [v3 relatedScopedIdentifier];

  if (v4)
  {
    char v8 = 0;
    v5 = [(CPLClientCacheRecordView *)self idMapping];
    v6 = [v5 localScopedIdentifierForCloudScopedIdentifier:v4 isFinal:&v8];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idMapping, 0);
  objc_storeStrong((id *)&self->_cloudRecord, 0);
  objc_storeStrong((id *)&self->_localScopedIdentifier, 0);
}

- (CPLEngineIDMapping)idMapping
{
  return self->_idMapping;
}

- (CPLRecordChange)cloudRecord
{
  return self->_cloudRecord;
}

- (id)sharingRecordChangeData
{
  return 0;
}

- (id)recordChangeData
{
  return 0;
}

- (id)redactedDescription
{
  id v3 = [NSString alloc];
  v4 = [(CPLRecordChange *)self->_cloudRecord redactedDescription];
  v5 = (void *)[v3 initWithFormat:@"%@+idMapping", v4];

  return v5;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"%@+idMapping", self->_cloudRecord];
  return v2;
}

- (id)synthesizedRecord
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  cloudRecord = self->_cloudRecord;
  idMapping = self->_idMapping;
  id v12 = 0;
  v6 = [(CPLRecordChange *)cloudRecord translateToClientChangeUsingIDMapping:idMapping error:&v12];
  id v7 = v12;
  if (!v6)
  {
    if (!_CPLSilentLogging)
    {
      v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v7;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Failed to remap cloud record to local record: %@", buf, 0xCu);
      }
    }
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    char v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStorageViews.m"];
    [v10 handleFailureInMethod:a2, self, v11, 242, @"Failed to remap cloud record to local record: %@", v7 object file lineNumber description];

    abort();
  }
  [v6 setRecordChangeData:0];
  [v6 setSharingRecordChangeData:0];

  return v6;
}

- (CPLScopedIdentifier)localScopedIdentifier
{
  localScopedIdentifier = self->_localScopedIdentifier;
  if (!localScopedIdentifier)
  {
    char v11 = 0;
    idMapping = self->_idMapping;
    v5 = [(CPLRecordChange *)self->_cloudRecord scopedIdentifier];
    v6 = [(CPLEngineIDMapping *)idMapping localScopedIdentifierForCloudScopedIdentifier:v5 isFinal:&v11];
    id v7 = self->_localScopedIdentifier;
    self->_localScopedIdentifier = v6;

    localScopedIdentifier = self->_localScopedIdentifier;
    if (!localScopedIdentifier)
    {
      char v8 = [(CPLRecordChange *)self->_cloudRecord proposedLocalScopedIdentifier];
      v9 = self->_localScopedIdentifier;
      self->_localScopedIdentifier = v8;

      localScopedIdentifier = self->_localScopedIdentifier;
    }
  }
  return localScopedIdentifier;
}

- (CPLClientCacheRecordView)initWithLocalScopedIdentifier:(id)a3 cloudRecord:(id)a4 idMapping:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CPLClientCacheRecordView;
  id v12 = [(CPLClientCacheRecordView *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localScopedIdentifier, a3);
    objc_storeStrong((id *)&v13->_cloudRecord, a4);
    objc_storeStrong((id *)&v13->_idMapping, a5);
  }

  return v13;
}

@end