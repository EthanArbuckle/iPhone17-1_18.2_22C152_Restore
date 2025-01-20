@interface CPLCloudKitCreateSparsePrivateAssetTask
- (CPLCloudKitCreateSparsePrivateAssetTask)initWithController:(id)a3 scope:(id)a4 sharedScope:(id)a5 transportScopeMapping:(id)a6 privateScopedIdentifier:(id)a7 sharedScopedIdentifier:(id)a8 completionHandler:(id)a9;
- (CPLEngineScope)scope;
- (CPLEngineScope)sharedScope;
- (CPLScopedIdentifier)privateScopedIdentifier;
- (CPLScopedIdentifier)sharedScopedIdentifier;
- (void)runOperations;
@end

@implementation CPLCloudKitCreateSparsePrivateAssetTask

- (CPLCloudKitCreateSparsePrivateAssetTask)initWithController:(id)a3 scope:(id)a4 sharedScope:(id)a5 transportScopeMapping:(id)a6 privateScopedIdentifier:(id)a7 sharedScopedIdentifier:(id)a8 completionHandler:(id)a9
{
  id v26 = a4;
  id v25 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)CPLCloudKitCreateSparsePrivateAssetTask;
  v20 = [(CPLCloudKitTransportTask *)&v27 initWithController:a3];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_scope, a4);
    objc_storeStrong((id *)&v21->_sharedScope, a5);
    objc_storeStrong((id *)&v21->_privateScopedIdentifier, a7);
    objc_storeStrong((id *)&v21->_sharedScopedIdentifier, a8);
    id v22 = objc_msgSend(v19, "copy", v25, v26);
    id completionHandler = v21->_completionHandler;
    v21->_id completionHandler = v22;

    [(CPLCloudKitTransportTask *)v21 setTransportScopeMapping:v16];
  }

  return v21;
}

- (void)runOperations
{
  v3 = [(CPLEngineScope *)self->_scope scopeIdentifier];
  v4 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v3];

  v5 = [v4 zoneID];

  if (!v5)
  {
    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    CFStringRef v15 = @"Missing required zone";
LABEL_9:
    v8 = +[CPLErrors cplErrorWithCode:80 description:v15];
    completionHandler[2](completionHandler, v8);
    goto LABEL_14;
  }
  sharedScope = self->_sharedScope;
  if (!sharedScope)
  {
    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    CFStringRef v15 = @"Missing required shared scope";
    goto LABEL_9;
  }
  v7 = [(CPLEngineScope *)sharedScope scopeIdentifier];
  v8 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v7];

  v9 = [v8 zoneID];

  if (v9)
  {
    v10 = [(CPLCloudKitTransportTask *)self controller];
    v11 = [v10 zoneIdentificationForCloudKitScope:v4 engineScope:self->_scope];

    if (v8 && self->_sharedScope)
    {
      v12 = [(CPLCloudKitTransportTask *)self controller];
      v13 = [v12 zoneIdentificationForCloudKitScope:v8 engineScope:self->_sharedScope];
    }
    else
    {
      v13 = 0;
    }
    id v16 = [objc_alloc((Class)CPLRecordTarget) initWithScopedIdentifier:self->_privateScopedIdentifier otherScopedIdentifier:self->_sharedScopedIdentifier targetState:2];
    id v17 = objc_alloc_init((Class)CPLRecordTargetMapping);
    [v17 setTarget:v16 forRecordWithScopedIdentifier:self->_privateScopedIdentifier];
    privateScopedIdentifier = self->_privateScopedIdentifier;
    id v18 = +[NSArray arrayWithObjects:&privateScopedIdentifier count:1];
    [(CPLCloudKitTransportTask *)self updatePrivatePropertiesOnAssetsWithScopedIdentifiers:v18 desiredKeys:&__NSArray0__struct destinationZoneIdentification:v11 sharedZoneIdentification:v13 targetMapping:v17 knownRecords:0 shouldUpdateRecord:&stru_10027A350 updateBlock:&stru_10027A390 completionHandler:self->_completionHandler];
  }
  else
  {
    id v19 = (void (**)(id, void *))self->_completionHandler;
    v11 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required shared zone"];
    v19[2](v19, v11);
  }

LABEL_14:
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLEngineScope)sharedScope
{
  return self->_sharedScope;
}

- (CPLScopedIdentifier)privateScopedIdentifier
{
  return self->_privateScopedIdentifier;
}

- (CPLScopedIdentifier)sharedScopedIdentifier
{
  return self->_sharedScopedIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_privateScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end