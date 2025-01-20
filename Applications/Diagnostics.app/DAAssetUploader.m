@interface DAAssetUploader
- (DAAssetUploader)init;
- (NSMapTable)completionMap;
- (void)ASTUploadClientDidCompleteFileUpload:(id)a3;
- (void)setCompletionMap:(id)a3;
- (void)uploadAssets:(id)a3 wtihDeviceIdentity:(id)a4 completion:(id)a5;
@end

@implementation DAAssetUploader

- (DAAssetUploader)init
{
  v6.receiver = self;
  v6.super_class = (Class)DAAssetUploader;
  v2 = [(DAAssetUploader *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable mapTableWithWeakToStrongObjects];
    completionMap = v2->_completionMap;
    v2->_completionMap = (NSMapTable *)v3;
  }
  return v2;
}

- (void)uploadAssets:(id)a3 wtihDeviceIdentity:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v58 = a4;
  v51 = (void (**)(id, void *, void *))a5;
  v8 = [v7 items];
  id v9 = [v8 count];

  if (!v9)
  {
    v10 = +[NSArray array];
    v11 = +[NSError errorWithDomain:DKErrorDomain code:0 userInfo:0];
    v51[2](v51, v10, v11);
  }
  v57 = +[NSMutableArray array];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v50 = v7;
  id obj = [v7 items];
  id v12 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v65;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v65 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        v17 = [v16 extra];
        v18 = [v17 objectForKeyedSubscript:@"name"];

        v19 = [v16 extra];
        v20 = [v19 objectForKeyedSubscript:@"encryptionKey"];

        v21 = [v16 extra];
        v22 = [v21 objectForKeyedSubscript:@"token"];

        v23 = [v16 extra];
        v24 = [v23 objectForKeyedSubscript:@"extraHeaders"];
        v25 = +[NSMutableDictionary dictionaryWithDictionary:v24];

        id v26 = objc_alloc((Class)RepairToolRequestItem);
        v27 = [@"https://genevaut-traffic.corp.apple.com/GenevaTrafficServer/PutAsset/171170.dev.asset.cosmeticInspection/" stringByAppendingString:v18];
        id v28 = [v26 initWithDestination:v27 andEncryptionKey:v20 andToken:v22 andExtraHeaders:v25];
        [v57 addObject:v28];
      }
      id v13 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
    }
    while (v13);
  }

  uint64_t v29 = +[ASTUploadClientFactory repairToolUploadClientWithUploadRequests:v57 andDelegate:self];
  v30 = [(DAAssetUploader *)self completionMap];
  v31 = objc_retainBlock(v51);
  id obja = (id)v29;
  [v30 setObject:v31 forKey:v29];

  v32 = +[NSMutableDictionary dictionary];
  v33 = v58;
  if (v58)
  {
    v34 = [v58 deviceIdentityCert];
    v35 = [v58 deviceIdentityPublicKeyDigest];
    v36 = [v34 base64EncodedStringWithOptions:0];
    [v32 setObject:v36 forKeyedSubscript:@"certString"];

    v37 = [v35 base64EncodedStringWithOptions:0];
    [v32 setObject:v37 forKeyedSubscript:@"pubKeyDigest"];
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v52 = [v50 items];
  id v38 = [v52 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v54 = *(void *)v61;
    do
    {
      for (j = 0; j != v39; j = (char *)j + 1)
      {
        if (*(void *)v61 != v54) {
          objc_enumerationMutation(v52);
        }
        v41 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
        v42 = [v41 extra];
        v43 = [v42 objectForKeyedSubscript:@"name"];

        v44 = +[NSMutableDictionary dictionary];
        [v44 setObject:v43 forKeyedSubscript:@"name"];
        if (v33)
        {
          v45 = [v41 data];
          uint64_t v59 = 0;
          v46 = [v58 signPayload:v45 error:&v59];

          [v44 setObject:v32 forKeyedSubscript:@"cert"];
          v47 = [v32 objectForKeyedSubscript:@"pubKeyDigest"];
          [v44 setObject:v47 forKeyedSubscript:@"pubKeyDigest"];

          v48 = [v46 base64EncodedStringWithOptions:0];
          [v44 setObject:v48 forKeyedSubscript:@"sig"];

          v33 = v58;
        }
        v49 = [v41 data];
        [obja queueUploadWithSourceData:v49 andExtra:v44];
      }
      id v39 = [v52 countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v39);
  }
}

- (void)ASTUploadClientDidCompleteFileUpload:(id)a3
{
  id v8 = a3;
  v4 = [(DAAssetUploader *)self completionMap];
  v5 = [v4 objectForKey:v8];

  if (v5)
  {
    objc_super v6 = [(DAAssetUploader *)self completionMap];
    [v6 removeObjectForKey:v8];

    id v7 = [v8 uploadStatus];
    ((void (**)(void, void *, void))v5)[2](v5, v7, 0);
  }
}

- (NSMapTable)completionMap
{
  return self->_completionMap;
}

- (void)setCompletionMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end