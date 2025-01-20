@interface CPLAlbumChange
+ (Class)relatedRecordClass;
- (BOOL)albumSortAscending;
- (BOOL)validateRecordForTracker:(id)a3;
- (NSData)projectData;
- (NSData)projectPreviewImageData;
- (NSString)importedByBundleIdentifier;
- (NSString)name;
- (NSString)parentIdentifier;
- (NSString)projectDocumentType;
- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3;
- (id)parentScopedIdentifier;
- (id)propertiesDescription;
- (id)scopedIdentifiersForMapping;
- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4;
- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4;
- (int64_t)position;
- (unint64_t)albumSortType;
- (unint64_t)albumType;
- (void)setAlbumSortAscending:(BOOL)a3;
- (void)setAlbumSortType:(unint64_t)a3;
- (void)setAlbumType:(unint64_t)a3;
- (void)setImportedByBundleIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setParentIdentifier:(id)a3;
- (void)setParentScopedIdentifier:(id)a3;
- (void)setPosition:(int64_t)a3;
- (void)setProjectData:(id)a3;
- (void)setProjectDocumentType:(id)a3;
- (void)setProjectPreviewImageData:(id)a3;
@end

@implementation CPLAlbumChange

- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLAlbumChange;
  v7 = [(CPLRecordChange *)&v13 translateToClientChangeUsingIDMapping:v6 error:a4];
  if (v7)
  {
    char v12 = 0;
    v8 = [(CPLAlbumChange *)self parentScopedIdentifier];
    if (v8)
    {
      v9 = [v6 localScopedIdentifierForCloudScopedIdentifier:v8 isFinal:&v12];
      if (v9)
      {
        [v7 setParentScopedIdentifier:v9];
      }
      else
      {
        if (a4)
        {
          *a4 = +[CPLErrors invalidClientCacheErrorWithReason:0];
        }
        if (!_CPLSilentLogging)
        {
          v10 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v15 = v8;
            __int16 v16 = 2112;
            v17 = self;
            _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Can't map cloud \"parentScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }
        }
        v7 = 0;
      }
    }
  }

  return v7;
}

- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLAlbumChange;
  v7 = [(CPLRecordChange *)&v13 translateToCloudChangeUsingIDMapping:v6 error:a4];
  if (v7)
  {
    char v12 = 0;
    v8 = [(CPLAlbumChange *)self parentScopedIdentifier];
    if (v8)
    {
      v9 = [v6 cloudScopedIdentifierForLocalScopedIdentifier:v8 isFinal:&v12];
      if (v9)
      {
        [v7 setParentScopedIdentifier:v9];
      }
      else
      {
        if (a4)
        {
          *a4 = +[CPLErrors invalidClientCacheErrorWithReason:0];
        }
        if (!_CPLSilentLogging)
        {
          v10 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v15 = v8;
            __int16 v16 = 2112;
            v17 = self;
            _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Can't map local \"parentScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }
        }
        v7 = 0;
      }
    }
  }

  return v7;
}

- (id)scopedIdentifiersForMapping
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v8.receiver = self;
  v8.super_class = (Class)CPLAlbumChange;
  v4 = [(CPLRecordChange *)&v8 scopedIdentifiersForMapping];
  v5 = (void *)[v3 initWithArray:v4];

  id v6 = [(CPLAlbumChange *)self parentScopedIdentifier];
  if (v6) {
    [v5 addObject:v6];
  }

  return v5;
}

- (BOOL)validateRecordForTracker:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLAlbumChange;
  if ([(CPLRecordChange *)&v10 validateRecordForTracker:v4])
  {
    if ([(CPLRecordChange *)self hasChangeType:2])
    {
      v5 = [(CPLAlbumChange *)self parentScopedIdentifier];
      if (v5 && ([v4 knowsClientRecordWithScopedIdentifier:v5] & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          v7 = __CPLSessionOSLogDomain_15527();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            char v12 = v5;
            __int16 v13 = 2112;
            v14 = self;
            _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "Client pushed an album with missing parent album %@: %@", buf, 0x16u);
          }
        }
        objc_super v8 = [v4 pushChangeTasks];
        [v8 addTask:5 forRecordWithScopedIdentifier:v5];

        BOOL v6 = 0;
      }
      else
      {
        BOOL v6 = 1;
      }
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (Class)relatedRecordClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importedByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_projectPreviewImageData, 0);
  objc_storeStrong((id *)&self->_projectData, 0);
  objc_storeStrong((id *)&self->_projectDocumentType, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setImportedByBundleIdentifier:(id)a3
{
}

- (NSString)importedByBundleIdentifier
{
  return self->_importedByBundleIdentifier;
}

- (void)setProjectPreviewImageData:(id)a3
{
}

- (NSData)projectPreviewImageData
{
  return self->_projectPreviewImageData;
}

- (void)setProjectData:(id)a3
{
}

- (NSData)projectData
{
  return self->_projectData;
}

- (void)setProjectDocumentType:(id)a3
{
}

- (NSString)projectDocumentType
{
  return self->_projectDocumentType;
}

- (void)setAlbumSortAscending:(BOOL)a3
{
  self->_albumSortAscending = a3;
}

- (BOOL)albumSortAscending
{
  return self->_albumSortAscending;
}

- (void)setAlbumSortType:(unint64_t)a3
{
  self->_albumSortType = a3;
}

- (unint64_t)albumSortType
{
  return self->_albumSortType;
}

- (void)setParentIdentifier:(id)a3
{
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setAlbumType:(unint64_t)a3
{
  self->_albumType = a3;
}

- (unint64_t)albumType
{
  return self->_albumType;
}

- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3
{
  if (sel_importedByBundleIdentifier == a3)
  {
    id v3 = &__block_literal_global_23730;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLAlbumChange;
    id v3 = -[CPLRecordChange checkDefaultValueBlockForPropertyWithSelector:](&v5, sel_checkDefaultValueBlockForPropertyWithSelector_);
  }
  return v3;
}

BOOL __64__CPLAlbumChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 importedByBundleIdentifier];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)propertiesDescription
{
  unint64_t v3 = [(CPLAlbumChange *)self albumType];
  if (v3 >= 8) {
    id v4 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"unknown (%lu)", -[CPLAlbumChange albumType](self, "albumType"));
  }
  else {
    id v4 = off_1E60AB8E0[v3];
  }
  objc_super v5 = [(CPLAlbumChange *)self parentIdentifier];
  BOOL v6 = NSString;
  v7 = [(CPLAlbumChange *)self name];
  int64_t v8 = [(CPLAlbumChange *)self position];
  if (v5) {
    [v6 stringWithFormat:@"[%@] title: %@, @%ld in: %@", v4, v7, v8, v5];
  }
  else {
  v9 = [v6 stringWithFormat:@"[%@] title: %@, @%ld", v4, v7, v8, v11];
  }

  return v9;
}

- (void)setParentScopedIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  uint64_t v5 = [v21 scopeIdentifier];
  BOOL v6 = [(CPLRecordChange *)self scopedIdentifier];
  uint64_t v7 = [v6 scopeIdentifier];

  if (v5 && v7)
  {
    char v8 = [(id)v5 isEqual:v7];

    if ((v8 & 1) == 0) {
      goto LABEL_4;
    }
  }
  else
  {

    if (v5 | v7)
    {
LABEL_4:
      if (!_CPLSilentLogging)
      {
        v9 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          objc_super v10 = NSStringFromSelector(a2);
          uint64_t v11 = [(CPLRecordChange *)self scopedIdentifier];
          char v12 = [v11 scopeIdentifier];
          __int16 v13 = [v21 scopeIdentifier];
          *(_DWORD *)buf = 138412802;
          v23 = v10;
          __int16 v24 = 2112;
          v25 = v12;
          __int16 v26 = 2112;
          v27 = v13;
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Invalid call to %@ with mismatched scope: %@ vs. %@", buf, 0x20u);
        }
      }
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLAlbumChange.m"];
      __int16 v16 = NSStringFromSelector(a2);
      v17 = [(CPLRecordChange *)self scopedIdentifier];
      uint64_t v18 = [v17 scopeIdentifier];
      v19 = [v21 scopeIdentifier];
      [v14 handleFailureInMethod:a2, self, v15, 21, @"Invalid call to %@ with mismatched scope: %@ vs. %@", v16, v18, v19 object file lineNumber description];

      abort();
    }
  }
  v20 = [v21 identifier];
  [(CPLAlbumChange *)self setParentIdentifier:v20];
}

- (id)parentScopedIdentifier
{
  unint64_t v3 = [(CPLAlbumChange *)self parentIdentifier];
  if (v3)
  {
    id v4 = [CPLScopedIdentifier alloc];
    uint64_t v5 = [(CPLRecordChange *)self scopedIdentifier];
    id v6 = [(CPLScopedIdentifier *)v4 initRelativeToScopedIdentifier:v5 identifier:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end