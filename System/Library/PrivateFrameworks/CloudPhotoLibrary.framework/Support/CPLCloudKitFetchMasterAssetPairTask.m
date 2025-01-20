@interface CPLCloudKitFetchMasterAssetPairTask
- (CPLCloudKitFetchMasterAssetPairTask)initWithController:(id)a3 scopedIdentifier:(id)a4 cloudKitScope:(id)a5 resourcesFolderURL:(id)a6 completionHandler:(id)a7;
- (CPLCloudKitScope)cloudKitScope;
- (CPLScopedIdentifier)scopedIdentifier;
- (NSURL)resourcesFolderURL;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)completionHandler;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (void)_fetchRecordWithIdentifier:(id)a3 expectedClass:(Class)a4 currentUserRecordID:(id)a5 completionHandler:(id)a6;
- (void)runOperations;
@end

@implementation CPLCloudKitFetchMasterAssetPairTask

- (CPLCloudKitFetchMasterAssetPairTask)initWithController:(id)a3 scopedIdentifier:(id)a4 cloudKitScope:(id)a5 resourcesFolderURL:(id)a6 completionHandler:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CPLCloudKitFetchMasterAssetPairTask;
  v17 = [(CPLCloudKitTransportTask *)&v24 initWithController:a3];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_scopedIdentifier, a4);
    objc_storeStrong((id *)&v18->_cloudKitScope, a5);
    v19 = (NSURL *)[v15 copy];
    resourcesFolderURL = v18->_resourcesFolderURL;
    v18->_resourcesFolderURL = v19;

    id v21 = [v16 copy];
    id completionHandler = v18->_completionHandler;
    v18->_id completionHandler = v21;
  }
  return v18;
}

- (void)_fetchRecordWithIdentifier:(id)a3 expectedClass:(Class)a4 currentUserRecordID:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(CPLCloudKitScope *)self->_cloudKitScope recordIDWithRecordName:v10];
  v27 = v13;
  id v14 = +[NSArray arrayWithObjects:&v27 count:1];
  id v15 = [(CPLCloudKitFetchMasterAssetPairTask *)self cloudKitScope];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10004E978;
  v20[3] = &unk_100277F88;
  id v25 = v12;
  Class v26 = a4;
  id v21 = v13;
  id v22 = v10;
  v23 = self;
  id v24 = v11;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  id v19 = v12;
  [(CPLCloudKitTransportTask *)self fetchRecordsWithIDs:v14 fetchResources:1 inScope:v15 completionHandler:v20];
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004F080;
  v2[3] = &unk_100277DA8;
  v2[4] = self;
  [(CPLCloudKitTransportTask *)self getUserRecordIDFetchIfNecessaryWithCompletionHandler:v2];
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLCloudKitFetchMasterAssetPairTask *)self scopedIdentifier];
  v6 = [v5 scopeIdentifier];
  unsigned int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    v8 = [(CPLCloudKitFetchMasterAssetPairTask *)self cloudKitScope];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  id v4 = a3;
  v5 = [(CPLCloudKitFetchMasterAssetPairTask *)self cloudKitScope];
  v6 = [v5 zoneID];
  unsigned int v7 = [v6 isEqual:v4];

  if (v7)
  {
    v8 = [(CPLCloudKitFetchMasterAssetPairTask *)self scopedIdentifier];
    v9 = [v8 scopeIdentifier];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CPLCloudKitFetchMasterAssetPairTask;
    v9 = [(CPLCloudKitTransportTask *)&v11 scopeIdentifierFromZoneID:v4];
  }

  return v9;
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  id v4 = a3;
  v5 = [v4 zoneID];
  v6 = [(CPLCloudKitFetchMasterAssetPairTask *)self cloudKitScope];
  unsigned int v7 = [v6 zoneID];
  unsigned int v8 = [v5 isEqual:v7];

  if (v8)
  {
    v9 = [(CPLCloudKitFetchMasterAssetPairTask *)self scopedIdentifier];
    id v10 = [v9 scopeIdentifier];
    objc_super v11 = objc_msgSend(v4, "cpl_scopedIdentifierWithScopeIdentifier:", v10);
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

- (CPLScopedIdentifier)scopedIdentifier
{
  return self->_scopedIdentifier;
}

- (CPLCloudKitScope)cloudKitScope
{
  return self->_cloudKitScope;
}

- (NSURL)resourcesFolderURL
{
  return self->_resourcesFolderURL;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_resourcesFolderURL, 0);
  objc_storeStrong((id *)&self->_cloudKitScope, 0);
  objc_storeStrong((id *)&self->_scopedIdentifier, 0);
}

@end