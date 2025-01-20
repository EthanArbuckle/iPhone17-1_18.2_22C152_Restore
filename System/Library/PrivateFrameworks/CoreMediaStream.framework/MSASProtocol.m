@interface MSASProtocol
- (BOOL)isShuttingDown;
- (BOOL)responseDict:(id)a3 containsLimitErrorCode:(id)a4 outMaxAllowed:(id *)a5;
- (MSASPConnectionGate)gate;
- (MSASProtocol)initWithPersonID:(id)a3;
- (NSString)headerVersion;
- (NSString)personID;
- (NSString)serverSideConfigVersion;
- (NSURL)baseURL;
- (OS_dispatch_group)pendingConnectionsGroup;
- (OS_dispatch_queue)memberQueue;
- (OS_dispatch_queue)pendingConnectionsQueue;
- (OS_dispatch_queue)workQueue;
- (id)HTTPErrorWithStatusCode:(int64_t)a3;
- (id)_addCommentURLWithBaseURL:(id)a3;
- (id)_albumStateURL;
- (id)_albumSummaryURLWithBaseURL:(id)a3;
- (id)_couldNotReauthorizeError;
- (id)_createAlbumURL;
- (id)_deleteAssetsURLWithBaseURL:(id)a3;
- (id)_deleteCommentURLWithBaseURL:(id)a3;
- (id)_deleteURLWithBaseURL:(id)a3;
- (id)_enableMultipleContributorsURLWithBaseURL:(id)a3;
- (id)_enablePublicAccessURLWithBaseURL:(id)a3;
- (id)_getAlbumURL;
- (id)_getAssetsURLWithBaseURL:(id)a3;
- (id)_getChangesURL;
- (id)_getCommentsURLWithBaseURL:(id)a3;
- (id)_getTokensURLWithBaseURL:(id)a3;
- (id)_getUploadTokensURLWithBaseURL:(id)a3;
- (id)_getVideoURLWithBaseURL:(id)a3;
- (id)_putAssetsURLWithBaseURL:(id)a3;
- (id)_reportSpamURL;
- (id)_serverSideConfigURL;
- (id)_setAlbumStateURL;
- (id)_setAssetStateURL;
- (id)_setCommentPositionURL;
- (id)_shareURL;
- (id)_sharingInfoURLWithBaseURL:(id)a3;
- (id)_subscribeURL;
- (id)_unshareURL;
- (id)_unsubscribeURL;
- (id)_updateAlbumURLWithBaseURL:(id)a3;
- (id)_uploadCompleteURLWithBaseURL:(id)a3;
- (id)_validateInvitationURL;
- (id)errorFromStandardProcessingOnResponse:(id)a3 responseObject:(id)a4 checkServerSideConfigVersion:(BOOL)a5 error:(id)a6 body:(id)a7;
- (id)shutDownError;
- (id)stopHandlerBlock;
- (id)stoppingError;
- (void)_fetchClientOrgKeyAndPersistLocallyForResponseDict:(id)a3 isOwned:(BOOL)a4 completionHandler:(id)a5;
- (void)_prepareHeadersForRequest:(id)a3;
- (void)_sendOneURLRequest:(id)a3 checkServerSideConfigVersion:(BOOL)a4 retryCount:(unint64_t)a5 completionBlock:(id)a6;
- (void)_setClientOrgKeyForRequestBody:(id)a3 clientOrgKey:(id)a4;
- (void)acceptInvitationWithToken:(id)a3 completionBlock:(id)a4;
- (void)addComment:(id)a3 toAssetCollection:(id)a4 inAlbum:(id)a5 albumURLString:(id)a6 completionBlock:(id)a7;
- (void)addSharingRelationships:(id)a3 toAlbum:(id)a4 completionBlock:(id)a5;
- (void)albumSummaryAlbum:(id)a3 albumURLString:(id)a4 resetSync:(BOOL)a5 completionBlock:(id)a6;
- (void)createAlbum:(id)a3 completionBlock:(id)a4;
- (void)deleteAlbum:(id)a3 completionBlock:(id)a4;
- (void)deleteAssetCollections:(id)a3 inAlbum:(id)a4 completionBlock:(id)a5;
- (void)deleteComment:(id)a3 fromAssetCollection:(id)a4 inAlbum:(id)a5 albumURLString:(id)a6 completionBlock:(id)a7;
- (void)getAlbumSyncedStateForAlbum:(id)a3 assetCollectionStateBlock:(id)a4 completionBlock:(id)a5;
- (void)getAlbumURLForAlbumWithGUID:(id)a3 completionBlock:(id)a4;
- (void)getAssetCollections:(id)a3 inAlbum:(id)a4 albumURLString:(id)a5 completionBlock:(id)a6;
- (void)getChangesRootCtag:(id)a3 migrationCtag:(id)a4 completionBlock:(id)a5;
- (void)getCommentChanges:(id)a3 inAlbumWithGUID:(id)a4 withClientOrgKey:(id)a5 albumURLString:(id)a6 completionBlock:(id)a7;
- (void)getServerSideConfigCompletionBlock:(id)a3;
- (void)getSharingInfoForAlbum:(id)a3 albumURLString:(id)a4 completionBlock:(id)a5;
- (void)getTokensForAssets:(id)a3 inAlbum:(id)a4 albumURLString:(id)a5 completionBlock:(id)a6;
- (void)getUploadTokens:(id)a3 forAssetCollectionWithGUID:(id)a4 inAlbumWithGUID:(id)a5 albumURLString:(id)a6 completionBlock:(id)a7;
- (void)getVideoURL:(id)a3 forAssetCollectionWithGUID:(id)a4 inAlbumWithGUID:(id)a5 albumURLString:(id)a6 withClientOrgKey:(id)a7 completionBlock:(id)a8;
- (void)markAsSpamInvitationForAlbum:(id)a3 completionBlock:(id)a4;
- (void)markAsSpamInvitationForToken:(id)a3 completionBlock:(id)a4;
- (void)putAssetCollections:(id)a3 intoAlbum:(id)a4 albumURLString:(id)a5 completionBlock:(id)a6;
- (void)removeSharingRelationships:(id)a3 fromAlbum:(id)a4 completionBlock:(id)a5;
- (void)sendURLRequest:(id)a3 bodyObj:(id)a4 completionBlock:(id)a5;
- (void)sendURLRequest:(id)a3 method:(id)a4 bodyObj:(id)a5 checkServerSideConfigVersion:(BOOL)a6 completionBlock:(id)a7;
- (void)sendUploadCompleteSuccessfulAssetCollections:(id)a3 failedAssetCollections:(id)a4 album:(id)a5 completionBlock:(id)a6;
- (void)setAlbumSyncedState:(id)a3 forAlbum:(id)a4 albumStateCtag:(id)a5 completionBlock:(id)a6;
- (void)setAssetCollectionSyncedState:(id)a3 forAssetCollection:(id)a4 inAlbum:(id)a5 assetCollectionStateCtag:(id)a6 completionBlock:(id)a7;
- (void)setBaseURL:(id)a3;
- (void)setGate:(id)a3;
- (void)setIsShuttingDown:(BOOL)a3;
- (void)setMemberQueue:(id)a3;
- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbum:(id)a4 completionBlock:(id)a5;
- (void)setPendingConnectionsGroup:(id)a3;
- (void)setPendingConnectionsQueue:(id)a3;
- (void)setPublicAccessEnabled:(BOOL)a3 forAlbum:(id)a4 completionBlock:(id)a5;
- (void)setServerSideConfigVersion:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)shutDownCompletionBlock:(id)a3;
- (void)stopCompletionBlock:(id)a3;
- (void)subscribeToAlbum:(id)a3 completionBlock:(id)a4;
- (void)unsubscribeFromAlbum:(id)a3 completionBlock:(id)a4;
- (void)updateAlbum:(id)a3 albumURLString:(id)a4 completionBlock:(id)a5;
- (void)validateInvitationForAlbum:(id)a3 completionBlock:(id)a4;
@end

@implementation MSASProtocol

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_headerVersion, 0);
  objc_storeStrong((id *)&self->_serverSideConfigVersion, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_pendingConnectionsGroup, 0);
  objc_storeStrong((id *)&self->_pendingConnectionsQueue, 0);
  objc_storeStrong((id *)&self->_gate, 0);
}

- (void)setMemberQueue:(id)a3
{
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSString)headerVersion
{
  return self->_headerVersion;
}

- (void)setIsShuttingDown:(BOOL)a3
{
  self->_isShuttingDown = a3;
}

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (void)setServerSideConfigVersion:(id)a3
{
}

- (NSString)serverSideConfigVersion
{
  return self->_serverSideConfigVersion;
}

- (void)setBaseURL:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setPendingConnectionsGroup:(id)a3
{
}

- (OS_dispatch_group)pendingConnectionsGroup
{
  return self->_pendingConnectionsGroup;
}

- (void)setPendingConnectionsQueue:(id)a3
{
}

- (OS_dispatch_queue)pendingConnectionsQueue
{
  return self->_pendingConnectionsQueue;
}

- (void)setGate:(id)a3
{
}

- (MSASPConnectionGate)gate
{
  return self->_gate;
}

- (void)_setClientOrgKeyForRequestBody:(id)a3 clientOrgKey:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  int v6 = _os_feature_enabled_impl();
  if (v5 && v6) {
    [v7 setObject:v5 forKey:@"clientOrgKey"];
  }
}

- (void)_fetchClientOrgKeyAndPersistLocallyForResponseDict:(id)a3 isOwned:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v19 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = [v7 objectForKey:@"dbrMetadataInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v7 objectForKey:@"dbrMetadataInfo"];
  }
  else
  {
    v10 = 0;
  }

  v11 = [v10 objectForKey:@"zoneName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [v10 objectForKey:@"zoneName"];
  }
  else
  {
    v12 = 0;
  }

  v13 = [v10 objectForKey:@"recordId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [v10 objectForKey:@"recordId"];
  }
  else
  {
    v14 = 0;
  }

  v15 = [v10 objectForKey:@"fieldName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [v10 objectForKey:@"fieldName"];
  }
  else
  {
    v16 = 0;
  }

  v17 = [v10 objectForKey:@"ownerCkUserId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [v10 objectForKey:@"ownerCkUserId"];
  }
  else
  {
    v18 = 0;
  }

  if (v12 && v14 && v16)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __93__MSASProtocol__fetchClientOrgKeyAndPersistLocallyForResponseDict_isOwned_completionHandler___block_invoke;
    v20[3] = &unk_1E6C3D870;
    v20[4] = self;
    id v21 = v12;
    id v22 = v8;
    +[MSASCloudKitPlugin fetchClientOrgKeyForRecordID:v14 zoneName:v21 fieldName:v16 ownerUserID:v18 isOwned:v19 completionHandler:v20];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138544130;
      v24 = self;
      __int16 v25 = 2114;
      v26 = v12;
      __int16 v27 = 2114;
      v28 = v14;
      __int16 v29 = 2114;
      v30 = v16;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Missing one of zoneName: %{public}@ recordId: %{public}@ fieldName:%{public}@. Account may not be in DBR.", buf, 0x2Au);
    }
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

void __93__MSASProtocol__fetchClientOrgKeyAndPersistLocallyForResponseDict_isOwned_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Finished retrieving clientOrgKey for zoneName %{public}@. Account is in DBR. Error: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)getAlbumURLForAlbumWithGUID:(id)a3 completionBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F18D50];
  int v9 = [(MSASProtocol *)self _getAlbumURL];
  uint64_t v10 = [v8 requestWithURL:v9];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Retrieving new album URL for album with GUID %{public}@.", buf, 0x16u);
  }
  __int16 v11 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v12 = v11;
  if (v6) {
    [v11 setObject:v6 forKey:@"albumguid"];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__MSASProtocol_getAlbumURLForAlbumWithGUID_completionBlock___block_invoke;
  v14[3] = &unk_1E6C3D790;
  id v15 = v7;
  id v13 = v7;
  [(MSASProtocol *)self sendURLRequest:v10 bodyObj:v12 completionBlock:v14];
}

void __60__MSASProtocol_getAlbumURLForAlbumWithGUID_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    id v7 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;
    uint64_t v10 = [v9 objectForKey:@"albumlocation"];
    objc_opt_class();
    id v7 = 0;
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v9 objectForKey:@"albumlocation"];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getServerSideConfigCompletionBlock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F18D50];
  id v6 = [(MSASProtocol *)self _serverSideConfigURL];
  id v7 = [v5 requestWithURL:v6];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = self;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Refreshing server-side configuration.", buf, 0xCu);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__MSASProtocol_getServerSideConfigCompletionBlock___block_invoke;
  v9[3] = &unk_1E6C3D790;
  id v10 = v4;
  id v8 = v4;
  [(MSASProtocol *)self sendURLRequest:v7 method:@"GET" bodyObj:0 checkServerSideConfigVersion:0 completionBlock:v9];
}

void __51__MSASProtocol_getServerSideConfigCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    id v7 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v6;
    }
    else {
      id v8 = 0;
    }
    id v7 = v8;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAlbumSyncedState:(id)a3 forAlbum:(id)a4 albumStateCtag:(id)a5 completionBlock:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MSASProtocol *)self _setAlbumStateURL];
  id v15 = [MEMORY[0x1E4F18D50] requestWithURL:v14];
  v16 = [MEMORY[0x1E4F1CA60] dictionary];
  v17 = [v11 GUID];

  if (v17)
  {
    __int16 v18 = [v11 GUID];
    [v16 setObject:v18 forKey:@"albumguid"];
  }
  if (v12) {
    [v16 setObject:v12 forKey:@"albumstatectag"];
  }
  if (v10) {
    [v16 setObject:v10 forKey:@"state"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    __int16 v24 = 2114;
    id v25 = v11;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Setting synced state for album %{public}@", buf, 0x16u);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__MSASProtocol_setAlbumSyncedState_forAlbum_albumStateCtag_completionBlock___block_invoke;
  v20[3] = &unk_1E6C3D790;
  id v21 = v13;
  id v19 = v13;
  [(MSASProtocol *)self sendURLRequest:v15 bodyObj:v16 completionBlock:v20];
}

void __76__MSASProtocol_setAlbumSyncedState_forAlbum_albumStateCtag_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    id v7 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v6;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    id v10 = [v9 objectForKey:@"albumstatectag"];
    objc_opt_class();
    id v7 = 0;
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v9 objectForKey:@"albumstatectag"];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAssetCollectionSyncedState:(id)a3 forAssetCollection:(id)a4 inAlbum:(id)a5 assetCollectionStateCtag:(id)a6 completionBlock:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (__CFString *)a6;
  id v16 = a7;
  v17 = [(MSASProtocol *)self _setAssetStateURL];
  __int16 v18 = [MEMORY[0x1E4F18D50] requestWithURL:v17];
  id v19 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v20 = [v14 GUID];

  if (v20)
  {
    id v21 = [v14 GUID];
    [v19 setObject:v21 forKey:@"albumguid"];
  }
  id v22 = [v13 GUID];

  if (v22)
  {
    v23 = [v13 GUID];
    [v19 setObject:v23 forKey:@"assetguid"];
  }
  if (v15) {
    __int16 v24 = v15;
  }
  else {
    __int16 v24 = &stru_1F366BFB8;
  }
  [v19 setObject:v24 forKey:@"assetstatectag"];
  if (v12) {
    [v19 setObject:v12 forKey:@"state"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v29 = self;
    __int16 v30 = 2114;
    id v31 = v13;
    __int16 v32 = 2114;
    id v33 = v14;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Setting synced state for asset collection %{public}@ in album %{public}@", buf, 0x20u);
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __114__MSASProtocol_setAssetCollectionSyncedState_forAssetCollection_inAlbum_assetCollectionStateCtag_completionBlock___block_invoke;
  v26[3] = &unk_1E6C3D790;
  id v27 = v16;
  id v25 = v16;
  [(MSASProtocol *)self sendURLRequest:v18 bodyObj:v19 completionBlock:v26];
}

void __114__MSASProtocol_setAssetCollectionSyncedState_forAssetCollection_inAlbum_assetCollectionStateCtag_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a4;
  id v6 = a3;
  objc_opt_class();
  BOOL v7 = (objc_opt_isKindOfClass() & 1) == 0;
  id v8 = v10;
  if (v7) {
    id v8 = 0;
  }
  id v9 = [v8 objectForKey:@"assetstatectag"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAlbumSyncedStateForAlbum:(id)a3 assetCollectionStateBlock:(id)a4 completionBlock:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSASProtocol *)self _albumStateURL];
  id v12 = [MEMORY[0x1E4F18D50] requestWithURL:v11];
  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  id v14 = [v8 GUID];

  if (v14)
  {
    id v15 = [v8 GUID];
    [v13 setObject:v15 forKey:@"albumguid"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = self;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Getting synced state for album %{public}@.", buf, 0x16u);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__MSASProtocol_getAlbumSyncedStateForAlbum_assetCollectionStateBlock_completionBlock___block_invoke;
  v18[3] = &unk_1E6C3D848;
  id v19 = v9;
  id v20 = v10;
  id v16 = v10;
  id v17 = v9;
  [(MSASProtocol *)self sendURLRequest:v12 bodyObj:v13 completionBlock:v18];
}

void __86__MSASProtocol_getAlbumSyncedStateForAlbum_assetCollectionStateBlock_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    BOOL v7 = 0;
    id v8 = 0;
    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v6;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  id v11 = [v10 objectForKey:@"assetstates"];
  objc_opt_class();
  id v12 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v10 objectForKey:@"assetstates"];
  }
  __int16 v23 = v10;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v18 = [v17 objectForKey:@"assetstatectag"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = [v17 objectForKey:@"assetstatectag"];
          }
          else
          {
            id v19 = 0;
          }

          id v20 = [v17 objectForKey:@"assetguid"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = [v17 objectForKey:@"assetguid"];

            if (v19 && v21)
            {
              id v20 = (void *)[v17 mutableCopy];
              [v20 removeObjectForKey:@"assetstatectag"];
              [v20 removeObjectForKey:@"assetguid"];
              (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
              goto LABEL_22;
            }
          }
          else
          {
            id v21 = 0;
LABEL_22:
          }
          continue;
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  id v22 = [v23 objectForKey:@"albumstatectag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = [v23 objectForKey:@"albumstatectag"];
  }
  else
  {
    BOOL v7 = 0;
  }
  id v5 = 0;

  id v8 = (void *)[v23 mutableCopy];
  [v8 removeObjectForKey:@"assetstates"];
  [v8 removeObjectForKey:@"albumguid"];
  [v8 removeObjectForKey:@"albumstatectag"];

LABEL_30:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getCommentChanges:(id)a3 inAlbumWithGUID:(id)a4 withClientOrgKey:(id)a5 albumURLString:(id)a6 completionBlock:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v15) {
    [MEMORY[0x1E4F1CB10] URLWithString:v15];
  }
  else {
  id v17 = [(MSASProtocol *)self baseURL];
  }
  __int16 v18 = [(MSASProtocol *)self _getCommentsURLWithBaseURL:v17];

  id v19 = [MEMORY[0x1E4F18D50] requestWithURL:v18];
  id v20 = [MEMORY[0x1E4F1CA60] dictionary];
  id v21 = v20;
  if (v13) {
    [v20 setObject:v13 forKey:@"albumguid"];
  }
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v21 clientOrgKey:v14];
  id v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __98__MSASProtocol_getCommentChanges_inAlbumWithGUID_withClientOrgKey_albumURLString_completionBlock___block_invoke;
  v27[3] = &unk_1E6C3D688;
  id v23 = v22;
  id v28 = v23;
  [v12 enumerateKeysAndObjectsUsingBlock:v27];
  if ([v23 count]) {
    [v21 setObject:v23 forKey:@"assets"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v30 = self;
    __int16 v31 = 2114;
    id v32 = v12;
    __int16 v33 = 2114;
    id v34 = v13;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Retrieving comments for asset collections %{public}@ in album %{public}@", buf, 0x20u);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __98__MSASProtocol_getCommentChanges_inAlbumWithGUID_withClientOrgKey_albumURLString_completionBlock___block_invoke_592;
  v25[3] = &unk_1E6C3D820;
  v25[4] = self;
  id v26 = v16;
  id v24 = v16;
  [(MSASProtocol *)self sendURLRequest:v19 bodyObj:v21 completionBlock:v25];
}

void __98__MSASProtocol_getCommentChanges_inAlbumWithGUID_withClientOrgKey_albumURLString_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 intValue];
  id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  [v8 setObject:v5 forKey:@"assetguid"];

  if ((v6 & 0x80000000) == 0)
  {
    BOOL v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v6);
    [v8 setObject:v7 forKey:@"commentposition"];
  }
  [*(id *)(a1 + 32) addObject:v8];
}

void __98__MSASProtocol_getCommentChanges_inAlbumWithGUID_withClientOrgKey_albumURLString_completionBlock___block_invoke_592(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v44 = a2;
  id v7 = a3;
  id v8 = a4;
  v43 = v8;
  if (!v7)
  {
    id v9 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v42 = v10;
    id v11 = [v42 objectForKey:@"assets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v42 objectForKey:@"assets"];
    }

    v46 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = v7;
    uint64_t v12 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (!v12)
    {
LABEL_59:

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id v7 = 0;
      goto LABEL_60;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v60;
    uint64_t v50 = a1;
    uint64_t v45 = *(void *)v60;
LABEL_10:
    uint64_t v15 = 0;
    uint64_t v47 = v13;
    while (1)
    {
      if (*(void *)v60 != v14) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(void **)(*((void *)&v59 + 1) + 8 * v15);
      id v17 = [v16 objectForKey:@"assetguid"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_56;
      }
      uint64_t v18 = [v16 objectForKey:@"assetguid"];

      v51 = (void *)v18;
      if (v18) {
        break;
      }
LABEL_57:
      if (++v15 == v13)
      {
        uint64_t v13 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
        if (!v13) {
          goto LABEL_59;
        }
        goto LABEL_10;
      }
    }
    id v19 = [v16 objectForKey:@"comments"];
    objc_opt_class();
    uint64_t v49 = v15;
    if (objc_opt_isKindOfClass())
    {
      id v20 = [v16 objectForKey:@"comments"];
    }
    else
    {
      id v20 = 0;
    }

    v54 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v55 objects:v67 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v56;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v56 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v55 + 1) + 8 * v25);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v27 = [v26 objectForKey:@"commenttype"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v28 = [v26 objectForKey:@"commenttype"];
            }
            else
            {
              id v28 = 0;
            }

            if (([v28 isEqualToString:@"0"] & 1) != 0
              || [v28 isEqualToString:@"1"])
            {
              long long v29 = +[MSASComment MSASPCommentFromProtocolDictionary:v26];
              if (v29)
              {
                __int16 v30 = objc_alloc_init(MSASCommentChange);
                [(MSASCommentChange *)v30 setComment:v29];
                [v54 addObject:v30];
              }
            }
            else if ([v28 isEqualToString:@"99"])
            {
              __int16 v31 = objc_alloc_init(MSASCommentChange);
              [(MSASCommentChange *)v31 setType:1];
              id v32 = [v26 objectForKey:@"commentposition"];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              if (isKindOfClass)
              {
                id v34 = [v26 objectForKey:@"commentposition"];
                v53 = v34;
              }
              else
              {
                id v34 = 0;
              }
              -[MSASCommentChange setDeletionIndex:](v31, "setDeletionIndex:", [v34 intValue]);
              if (isKindOfClass) {

              }
              [v54 addObject:v31];
            }
            else if ([v28 isEqualToString:@"89"])
            {
              uint64_t v35 = +[MSASComment MSASPCommentFromProtocolDictionary:v26];
              if (v35)
              {
                v36 = objc_alloc_init(MSASCommentChange);
                [(MSASCommentChange *)v36 setComment:v35];
                [(MSASCommentChange *)v36 setType:2];
                v37 = [v26 objectForKey:@"deletedcommentposition"];
                objc_opt_class();
                char v38 = objc_opt_isKindOfClass();
                if (v38)
                {
                  v39 = [v26 objectForKey:@"deletedcommentposition"];
                  v52 = v39;
                }
                else
                {
                  v39 = 0;
                }
                -[MSASCommentChange setDeletionIndex:](v36, "setDeletionIndex:", [v39 intValue]);
                if (v38) {

                }
                [v54 addObject:v36];
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              uint64_t v40 = *(void *)(v50 + 32);
              *(_DWORD *)buf = 138543618;
              uint64_t v64 = v40;
              __int16 v65 = 2114;
              v66 = v28;
              _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unknown comment type: %{public}@. Ignoring", buf, 0x16u);
            }
          }
          ++v25;
        }
        while (v23 != v25);
        uint64_t v41 = [v21 countByEnumeratingWithState:&v55 objects:v67 count:16];
        uint64_t v23 = v41;
      }
      while (v41);
    }

    id v17 = v51;
    [v46 setObject:v54 forKey:v51];

    uint64_t v15 = v49;
    a1 = v50;
    uint64_t v13 = v47;
    uint64_t v14 = v45;
LABEL_56:

    goto LABEL_57;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_60:
}

- (void)validateInvitationForAlbum:(id)a3 completionBlock:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F18D50];
  id v9 = [(MSASProtocol *)self _validateInvitationURL];
  id v10 = [v8 requestWithURL:v9];

  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v12 = [v6 metadataValueForKey:@"phoneInvitationToken"];
  if (v12) {
    [v11 setObject:v12 forKey:@"invitationtoken"];
  }
  uint64_t v13 = [v6 metadataValueForKey:@"name"];
  if (v13) {
    [v11 setObject:v13 forKey:@"albumname"];
  }
  uint64_t v14 = [v6 metadataValueForKey:@"inviterAddress"];
  if (v14) {
    [v11 setObject:v14 forKey:@"idsfromid"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    id v21 = self;
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    __int16 v24 = 2112;
    uint64_t v25 = v13;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Validating invitation token %@ for album %@.", buf, 0x20u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__MSASProtocol_validateInvitationForAlbum_completionBlock___block_invoke;
  v17[3] = &unk_1E6C3D820;
  id v18 = v12;
  id v19 = v7;
  id v15 = v12;
  id v16 = v7;
  [(MSASProtocol *)self sendURLRequest:v10 bodyObj:v11 completionBlock:v17];
}

void __59__MSASProtocol_validateInvitationForAlbum_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v13 = a4;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v13;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    id v8 = [v7 objectForKey:@"isvalid"];
    [v8 BOOLValue];

    id v9 = [v7 objectForKey:@"invitationtoken"];

    if ([*(id *)(a1 + 32) isEqualToString:v9])
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      id v11 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MODEL_INVALID_INVITATION");
      uint64_t v12 = [v10 MSErrorWithDomain:@"MSASModelErrorDomain" code:5 description:v11 underlyingError:0];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)acceptInvitationWithToken:(id)a3 completionBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F18D50];
  id v9 = [(MSASProtocol *)self _subscribeURL];
  id v10 = [v8 requestWithURL:v9];

  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v12 = v11;
  if (v6) {
    [v11 setObject:v6 forKey:@"invitationtoken"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = self;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Accepting invitation using token.", buf, 0xCu);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__MSASProtocol_acceptInvitationWithToken_completionBlock___block_invoke;
  v14[3] = &unk_1E6C3D790;
  id v15 = v7;
  id v13 = v7;
  [(MSASProtocol *)self sendURLRequest:v10 bodyObj:v12 completionBlock:v14];
}

uint64_t __58__MSASProtocol_acceptInvitationWithToken_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)markAsSpamInvitationForToken:(id)a3 completionBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F18D50];
  id v9 = [(MSASProtocol *)self _reportSpamURL];
  id v10 = [v8 requestWithURL:v9];

  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  [v11 setObject:v6 forKeyedSubscript:@"invitationtoken"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = self;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Marking as spam invitation with token %{public}@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__MSASProtocol_markAsSpamInvitationForToken_completionBlock___block_invoke;
  v13[3] = &unk_1E6C3D790;
  id v14 = v7;
  id v12 = v7;
  [(MSASProtocol *)self sendURLRequest:v10 bodyObj:v11 completionBlock:v13];
}

uint64_t __61__MSASProtocol_markAsSpamInvitationForToken_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)markAsSpamInvitationForAlbum:(id)a3 completionBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F18D50];
  id v9 = [(MSASProtocol *)self _reportSpamURL];
  id v10 = [v8 requestWithURL:v9];

  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  id v12 = [v6 GUID];
  [v11 setObject:v12 forKeyedSubscript:@"albumguid"];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v17 = self;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Marking as spam invitation for album %{public}@", buf, 0x16u);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__MSASProtocol_markAsSpamInvitationForAlbum_completionBlock___block_invoke;
  v14[3] = &unk_1E6C3D790;
  id v15 = v7;
  id v13 = v7;
  [(MSASProtocol *)self sendURLRequest:v10 bodyObj:v11 completionBlock:v14];
}

uint64_t __61__MSASProtocol_markAsSpamInvitationForAlbum_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unsubscribeFromAlbum:(id)a3 completionBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F18D50];
  id v9 = [(MSASProtocol *)self _unsubscribeURL];
  id v10 = [v8 requestWithURL:v9];

  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  id v12 = [v6 GUID];

  if (v12)
  {
    id v13 = [v6 GUID];
    [v11 setObject:v13 forKey:@"albumguid"];
  }
  id v14 = [v6 clientOrgKey];
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v11 clientOrgKey:v14];

  id v15 = [v6 ctag];

  if (v15)
  {
    id v16 = [v6 ctag];
    [v11 setObject:v16 forKey:@"albumctag"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Unsubscribing from album %{public}@", buf, 0x16u);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__MSASProtocol_unsubscribeFromAlbum_completionBlock___block_invoke;
  v18[3] = &unk_1E6C3D790;
  id v19 = v7;
  id v17 = v7;
  [(MSASProtocol *)self sendURLRequest:v10 bodyObj:v11 completionBlock:v18];
}

uint64_t __53__MSASProtocol_unsubscribeFromAlbum_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscribeToAlbum:(id)a3 completionBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F18D50];
  id v9 = [(MSASProtocol *)self _subscribeURL];
  id v10 = [v8 requestWithURL:v9];

  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  id v12 = [v6 GUID];

  if (v12)
  {
    id v13 = [v6 GUID];
    [v11 setObject:v13 forKey:@"albumguid"];
  }
  id v14 = [v6 ctag];

  if (v14)
  {
    id v15 = [v6 ctag];
    [v11 setObject:v15 forKey:@"albumctag"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = self;
    __int16 v21 = 2114;
    id v22 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Subscribing to album %{public}@", buf, 0x16u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__MSASProtocol_subscribeToAlbum_completionBlock___block_invoke;
  v17[3] = &unk_1E6C3D820;
  void v17[4] = self;
  id v18 = v7;
  id v16 = v7;
  [(MSASProtocol *)self sendURLRequest:v10 bodyObj:v11 completionBlock:v17];
}

void __49__MSASProtocol_subscribeToAlbum_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v16 = 0;
  int v8 = [v7 responseDict:a4 containsLimitErrorCode:@"4033" outMaxAllowed:&v16];
  id v9 = v16;
  id v10 = v6;
  if (v8)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    id v12 = NSString;
    id v13 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_LIMIT_SUBSCRIPTIONS_P_COUNT");
    id v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "intValue"));
    id v15 = objc_msgSend(v12, "stringWithFormat:", v13, v14);
    id v10 = [v11 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:15 description:v15 underlyingError:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getTokensForAssets:(id)a3 inAlbum:(id)a4 albumURLString:(id)a5 completionBlock:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v32 = a6;
  if (v12) {
    [MEMORY[0x1E4F1CB10] URLWithString:v12];
  }
  else {
  id v13 = [(MSASProtocol *)self baseURL];
  }
  uint64_t v35 = v12;
  uint64_t v14 = [(MSASProtocol *)self _getTokensURLWithBaseURL:v13];

  id v34 = (void *)v14;
  __int16 v33 = [MEMORY[0x1E4F18D50] requestWithURL:v14];
  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v11)
  {
    id v16 = [v11 GUID];
    [v15 setObject:v16 forKey:@"albumguid"];
  }
  id v17 = [v11 clientOrgKey];
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v15 clientOrgKey:v17];

  __int16 v31 = (void *)[v10 mutableCopy];
  id v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v19 = v10;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v25 = [v24 assetCollectionGUID];

        if (v25)
        {
          uint64_t v26 = [v24 assetCollectionGUID];
          [v18 addObject:v26];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v21);
  }

  [v15 setObject:v18 forKey:@"assets"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = [v19 count];
    *(_DWORD *)buf = 138543874;
    v46 = self;
    __int16 v47 = 2048;
    uint64_t v48 = v27;
    __int16 v49 = 2114;
    id v50 = v11;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Getting tokens for %ld assets from album %{public}@", buf, 0x20u);
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __74__MSASProtocol_getTokensForAssets_inAlbum_albumURLString_completionBlock___block_invoke;
  v36[3] = &unk_1E6C3D6E0;
  id v37 = v31;
  char v38 = self;
  id v39 = v11;
  id v40 = v32;
  id v28 = v32;
  id v29 = v11;
  id v30 = v31;
  [(MSASProtocol *)self sendURLRequest:v33 bodyObj:v15 completionBlock:v36];
}

void __74__MSASProtocol_getTokensForAssets_inAlbum_albumURLString_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v6)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v57 != v13) {
            objc_enumerationMutation(v10);
          }
          [v9 setObject:v6 forKey:*(void *)(*((void *)&v56 + 1) + 8 * i)];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v56 objects:v68 count:16];
      }
      while (v12);
    }
    goto LABEL_45;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v7;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;
  id v17 = [v16 objectForKey:@"contenturl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [v16 objectForKey:@"contenturl"];

    if (v18)
    {
      id v19 = [MEMORY[0x1E4F1CB10] URLWithString:v18];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = *(void *)(a1 + 40);
        uint64_t v21 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        uint64_t v63 = v20;
        __int16 v64 = 2114;
        __int16 v65 = v19;
        __int16 v66 = 2114;
        uint64_t v67 = v21;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Using contentURL %{public}@ for album %{public}@", buf, 0x20u);
      }
      goto LABEL_19;
    }
  }
  else
  {

    uint64_t v18 = 0;
  }
  id v19 = 0;
LABEL_19:
  long long v42 = (void *)v18;
  id v43 = v7;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v22 = v16;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v61 count:16];
  id obj = v22;
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v53;
    uint64_t v44 = *(void *)v53;
    uint64_t v45 = v9;
    do
    {
      uint64_t v26 = 0;
      uint64_t v46 = v24;
      do
      {
        if (*(void *)v53 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void **)(*((void *)&v52 + 1) + 8 * v26);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v28 = [obj objectForKey:v27];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v29 = [obj objectForKey:v27];
          }
          else
          {
            id v29 = 0;
          }

          id v30 = [v27 MSHexData];
          uint64_t v31 = [*(id *)(a1 + 32) count];
          if (v31 - 1 >= 0)
          {
            do
            {
              id v32 = [*(id *)(a1 + 32) objectAtIndex:--v31];
              __int16 v33 = [v32 MMCSHash];
              int v34 = [v33 isEqualToData:v30];

              if (v34)
              {
                [v32 setMMCSAccessHeader:v29];
                if (v19) {
                  [v32 setMMCSURL:v19];
                }
                [v8 addObject:v32];
                [*(id *)(a1 + 32) removeObjectAtIndex:v31];
              }
            }
            while (v31 > 0);
          }

          uint64_t v25 = v44;
          id v9 = v45;
          uint64_t v24 = v46;
        }
        ++v26;
      }
      while (v26 != v24);
      id v22 = obj;
      uint64_t v24 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
    }
    while (v24);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v35 = *(id *)(a1 + 32);
  uint64_t v36 = [v35 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v49 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void *)(*((void *)&v48 + 1) + 8 * j);
        long long v41 = [*(id *)(a1 + 40) _couldNotReauthorizeError];
        [v9 setObject:v41 forKey:v40];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v37);
  }

  id v7 = v43;
  id v6 = 0;
  id v10 = obj;
LABEL_45:

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_couldNotReauthorizeError
{
  if (_couldNotReauthorizeError_onceToken != -1) {
    dispatch_once(&_couldNotReauthorizeError_onceToken, &__block_literal_global_573);
  }
  v2 = (void *)_couldNotReauthorizeError_error;
  return v2;
}

void __41__MSASProtocol__couldNotReauthorizeError__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_NOT_REAUTHED");
  uint64_t v1 = [v0 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:11 description:v3];
  v2 = (void *)_couldNotReauthorizeError_error;
  _couldNotReauthorizeError_error = v1;
}

- (void)getAssetCollections:(id)a3 inAlbum:(id)a4 albumURLString:(id)a5 completionBlock:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v34 = a6;
  uint64_t v37 = v12;
  if (v12) {
    [MEMORY[0x1E4F1CB10] URLWithString:v12];
  }
  else {
  uint64_t v13 = [(MSASProtocol *)self baseURL];
  }
  uint64_t v14 = [(MSASProtocol *)self _getAssetsURLWithBaseURL:v13];

  uint64_t v36 = (void *)v14;
  id v35 = [MEMORY[0x1E4F18D50] requestWithURL:v14];
  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  id v16 = [v11 GUID];

  if (v16)
  {
    id v17 = [v11 GUID];
    [v15 setObject:v17 forKey:@"albumguid"];
  }
  uint64_t v18 = [v11 clientOrgKey];
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v15 clientOrgKey:v18];

  id v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v20 = v10;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v26 = [v25 GUID];

        if (v26)
        {
          uint64_t v27 = [v25 GUID];
          [v19 setObject:v25 forKey:v27];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v22);
  }

  id v28 = [v19 allKeys];
  [v15 setObject:v28 forKey:@"assets"];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = [v20 count];
    *(_DWORD *)buf = 138543874;
    long long v49 = self;
    __int16 v50 = 2048;
    uint64_t v51 = v29;
    __int16 v52 = 2114;
    id v53 = v11;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Requesting metadata for %ld photos in album %{public}@.", buf, 0x20u);
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __75__MSASProtocol_getAssetCollections_inAlbum_albumURLString_completionBlock___block_invoke;
  v38[3] = &unk_1E6C3D7E0;
  id v39 = v20;
  id v40 = v19;
  long long v41 = self;
  id v42 = v11;
  id v43 = v34;
  id v30 = v34;
  id v31 = v11;
  id v32 = v19;
  id v33 = v20;
  [(MSASProtocol *)self sendURLRequest:v35 bodyObj:v15 completionBlock:v38];
}

void __75__MSASProtocol_getAssetCollections_inAlbum_albumURLString_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;
  long long v61 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v59 = (void *)a1;
  long long v58 = (void *)[*(id *)(a1 + 32) mutableCopy];
  id v10 = 0;
  if (!v6)
  {
    id v11 = [v9 objectForKey:@"albumctag"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v9 objectForKey:@"albumctag"];
    }
    else
    {
      uint64_t v12 = 0;
    }

    uint64_t v13 = [v9 objectForKey:@"contenturl"];
    objc_opt_class();
    uint64_t v55 = (void *)v12;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v9 objectForKey:@"contenturl"];
    }
    else
    {
      uint64_t v14 = 0;
    }

    long long v54 = (void *)v14;
    id v15 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
    id v16 = [v9 objectForKey:@"contenttokens"];
    objc_opt_class();
    id v57 = v7;
    if (objc_opt_isKindOfClass())
    {
      id v17 = [v9 objectForKey:@"contenttokens"];
    }
    else
    {
      id v17 = 0;
    }

    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id obj = v17;
    uint64_t v19 = [obj countByEnumeratingWithState:&v76 objects:v92 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v77 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v24 = [obj objectForKey:v23];
            uint64_t v25 = [v23 MSHexData];
            [v18 setObject:v24 forKey:v25];
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v76 objects:v92 count:16];
      }
      while (v20);
    }

    uint64_t v26 = [v9 objectForKey:@"assets"];
    objc_opt_class();
    id v56 = v9;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = [v9 objectForKey:@"assets"];
    }
    else
    {
      uint64_t v27 = 0;
    }

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v63 = v27;
    uint64_t v28 = [v63 countByEnumeratingWithState:&v72 objects:v91 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v73;
      uint64_t v60 = *(void *)v73;
      do
      {
        uint64_t v31 = 0;
        uint64_t v62 = v29;
        do
        {
          if (*(void *)v73 != v30) {
            objc_enumerationMutation(v63);
          }
          id v32 = *(void **)(*((void *)&v72 + 1) + 8 * v31);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v33 = [v32 objectForKey:@"assetctag"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v67 = [v32 objectForKey:@"assetctag"];
            }
            else
            {
              uint64_t v67 = 0;
            }

            id v34 = +[MSASAssetCollection MSASPAssetCollectionFromProtocolDictionary:v32];
            id v35 = v34;
            if (v34)
            {
              __int16 v66 = v34;
              [v34 setCtag:v67];
              uint64_t v36 = [v32 objectForKey:@"hascomments"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v37 = [v32 objectForKey:@"hascomments"];
              }
              else
              {
                uint64_t v37 = 0;
              }

              __int16 v64 = v37;
              objc_msgSend(v66, "setHasComments:", (int)objc_msgSend(v37, "intValue") > 0);
              [v61 addObject:v66];
              long long v70 = 0u;
              long long v71 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              uint64_t v38 = [v66 assets];
              uint64_t v39 = [v38 countByEnumeratingWithState:&v68 objects:v90 count:16];
              if (v39)
              {
                uint64_t v40 = v39;
                uint64_t v41 = *(void *)v69;
                do
                {
                  for (uint64_t j = 0; j != v40; ++j)
                  {
                    if (*(void *)v69 != v41) {
                      objc_enumerationMutation(v38);
                    }
                    id v43 = *(void **)(*((void *)&v68 + 1) + 8 * j);
                    [v43 setMMCSURL:v15];
                    long long v44 = [v43 MMCSHash];
                    long long v45 = [v18 objectForKey:v44];
                    [v43 setMMCSAccessHeader:v45];
                  }
                  uint64_t v40 = [v38 countByEnumeratingWithState:&v68 objects:v90 count:16];
                }
                while (v40);
              }

              id v35 = v66;
              long long v46 = [v66 GUID];

              uint64_t v30 = v60;
              if (v46)
              {
                long long v47 = (void *)v59[5];
                long long v48 = [v66 GUID];
                long long v49 = [v47 objectForKey:v48];

                if (v49) {
                  [v58 removeObject:v49];
                }

                id v35 = v66;
              }
            }
            uint64_t v29 = v62;
          }
          ++v31;
        }
        while (v31 != v29);
        uint64_t v29 = [v63 countByEnumeratingWithState:&v72 objects:v91 count:16];
      }
      while (v29);
    }

    id v7 = v57;
    id v6 = 0;
    id v10 = v55;
    id v9 = v56;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v50 = v59[6];
    uint64_t v51 = [v61 count];
    uint64_t v52 = [v58 count];
    uint64_t v53 = v59[7];
    *(_DWORD *)buf = 138544386;
    uint64_t v81 = v50;
    __int16 v82 = 2048;
    uint64_t v83 = v51;
    __int16 v84 = 2048;
    uint64_t v85 = v52;
    __int16 v86 = 2114;
    uint64_t v87 = v53;
    __int16 v88 = 2114;
    id v89 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Finished receiving metadata for %ld assets and skipped %ld assets, in album %{public}@. Error: %{public}@", buf, 0x34u);
  }
  (*(void (**)(void))(v59[8] + 16))();
}

- (void)albumSummaryAlbum:(id)a3 albumURLString:(id)a4 resetSync:(BOOL)a5 completionBlock:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v11) {
    [MEMORY[0x1E4F1CB10] URLWithString:v11];
  }
  else {
  uint64_t v13 = [(MSASProtocol *)self baseURL];
  }
  uint64_t v14 = [(MSASProtocol *)self _albumSummaryURLWithBaseURL:v13];

  id v15 = [MEMORY[0x1E4F18D50] requestWithURL:v14];
  if (a5)
  {
    id v16 = 0;
  }
  else
  {
    if ([v10 useForeignCtag]) {
      [v10 foreignCtag];
    }
    else {
    id v16 = [v10 ctag];
    }
  }
  id v17 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v18 = [v10 GUID];

  if (v18)
  {
    uint64_t v19 = [v10 GUID];
    [v17 setObject:v19 forKey:@"albumguid"];
  }
  if (v16) {
    [v17 setObject:v16 forKey:@"albumctag"];
  }
  uint64_t v20 = [v10 clientOrgKey];
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v17 clientOrgKey:v20];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v30 = self;
    __int16 v31 = 2114;
    id v32 = v10;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Requesting summary of changes for album %{public}@.", buf, 0x16u);
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __75__MSASProtocol_albumSummaryAlbum_albumURLString_resetSync_completionBlock___block_invoke;
  v24[3] = &unk_1E6C3D6E0;
  id v25 = v10;
  id v26 = v16;
  uint64_t v27 = self;
  id v28 = v12;
  id v21 = v12;
  id v22 = v16;
  id v23 = v10;
  [(MSASProtocol *)self sendURLRequest:v15 bodyObj:v17 completionBlock:v24];
}

void __75__MSASProtocol_albumSummaryAlbum_albumURLString_resetSync_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v59 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  uint64_t v60 = v8;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v64 = v9;
  if (v7)
  {
    uint64_t v62 = 0;
    id v63 = 0;
    __int16 v66 = 0;
    goto LABEL_73;
  }
  uint64_t v61 = a1;
  id v63 = +[MSASAlbum albumWithAlbum:*(void *)(a1 + 32)];
  id v10 = [v64 objectForKey:@"albumctag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v62 = [v64 objectForKey:@"albumctag"];
  }
  else
  {
    uint64_t v62 = 0;
  }

  long long v58 = [MEMORY[0x1E4F1CA60] dictionary];
  id v11 = [*(id *)(a1 + 32) metadata];

  if (v11)
  {
    id v12 = [*(id *)(a1 + 32) metadata];
    [v58 addEntriesFromDictionary:v12];
  }
  uint64_t v13 = [v64 objectForKey:@"attributes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v64 objectForKey:@"attributes"];
    id v15 = v58;
    [v58 addEntriesFromDictionary:v14];
  }
  else
  {
    id v15 = v58;
    [v58 addEntriesFromDictionary:0];
  }

  [v63 setMetadata:v15];
  id v16 = [v64 objectForKey:@"publicurl"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [v64 objectForKey:@"publicurl"];
  }
  else
  {
    id v17 = 0;
  }

  uint64_t v55 = v17;
  if ([v17 length]) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  [v63 setPublicURLString:v18];
  if (!_os_feature_enabled_impl())
  {
    HIDWORD(v53) = 0;
    goto LABEL_29;
  }
  uint64_t v19 = [v64 objectForKey:@"requiresretrywithclientorgkey"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v20 = 0;
LABEL_27:
    int v21 = 0;
    goto LABEL_28;
  }
  uint64_t v20 = [v64 objectForKey:@"requiresretrywithclientorgkey"];

  if (!v20 || ([v20 isEqualToString:@"1"] & 1) == 0) {
    goto LABEL_27;
  }
  int v21 = 1;
LABEL_28:
  HIDWORD(v53) = v21;

LABEL_29:
  id v22 = [v64 objectForKey:@"isfamilysharealbum"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v23 = 0;
LABEL_34:
    id v57 = v23;
    uint64_t v24 = 0;
    goto LABEL_35;
  }
  id v57 = [v64 objectForKey:@"isfamilysharealbum"];

  id v23 = v57;
  if (!v57 || ([v57 isEqualToString:@"1"] & 1) == 0) {
    goto LABEL_34;
  }
  uint64_t v24 = 1;
LABEL_35:
  [v63 setIsFamilySharedAlbum:v24];
  id v25 = [v64 objectForKey:@"ctagrespected"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = [v64 objectForKey:@"ctagrespected"];
  }
  else
  {
    id v26 = 0;
  }

  long long v54 = v26;
  BOOL v27 = ([v26 isEqualToString:@"0"] & 1) != 0 || *(void *)(v61 + 40) == 0;
  LODWORD(v53) = v27;
  id v28 = objc_msgSend(v64, "objectForKey:", @"assets", v53);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v29 = [v64 objectForKey:@"assets"];
  }
  else
  {
    uint64_t v29 = 0;
  }

  id v56 = v29;
  if ([v29 count])
  {
    __int16 v66 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v29, "count"));
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = v29;
    uint64_t v30 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v71 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          id v34 = objc_alloc_init(MSASAssetCollectionChange);
          id v35 = [v33 objectForKey:@"assetguid"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v36 = [v33 objectForKey:@"assetguid"];
            [(MSASAssetCollectionChange *)v34 setGUID:v36];
          }
          else
          {
            [(MSASAssetCollectionChange *)v34 setGUID:0];
          }

          uint64_t v37 = [v33 objectForKey:@"assetctag"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v38 = [v33 objectForKey:@"assetctag"];
            [(MSASAssetCollectionChange *)v34 setCtag:v38];
          }
          else
          {
            [(MSASAssetCollectionChange *)v34 setCtag:0];
          }

          uint64_t v39 = [v33 objectForKey:@"delete"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass)
          {
            uint64_t v41 = [v33 objectForKey:@"delete"];
            uint64_t v29 = v41;
          }
          else
          {
            uint64_t v41 = 0;
          }
          -[MSASAssetCollectionChange setWasDeleted:](v34, "setWasDeleted:", [v41 BOOLValue]);
          if (isKindOfClass) {

          }
          [v66 addObject:v34];
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
      }
      while (v30);
    }
  }
  else
  {
    __int16 v66 = 0;
  }
  id v42 = [v64 objectForKey:@"sharinginfochanged"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v43 = [v64 objectForKey:@"sharinginfochanged"];

    if (v43) {
      [v43 isEqualToString:@"1"];
    }
  }
  else
  {

    id v43 = 0;
  }
  if (_os_feature_enabled_impl()
    && ([*(id *)(v61 + 32) clientOrgKey],
        long long v44 = objc_claimAutoreleasedReturnValue(),
        BOOL v45 = v44 == 0,
        v44,
        v45))
  {
    uint64_t v50 = [*(id *)(v61 + 32) useForeignCtag] ^ 1;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    long long v75 = __Block_byref_object_copy__7582;
    *(void *)&long long v76 = __Block_byref_object_dispose__7583;
    *((void *)&v76 + 1) = 0;
    uint64_t v51 = *(void **)(v61 + 48);
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __75__MSASProtocol_albumSummaryAlbum_albumURLString_resetSync_completionBlock___block_invoke_2;
    v67[3] = &unk_1E6C3D7B8;
    long long v69 = buf;
    id v68 = v63;
    [v51 _fetchClientOrgKeyAndPersistLocallyForResponseDict:v64 isOwned:v50 completionHandler:v67];
    id v7 = *(id *)(*(void *)&buf[8] + 40);
    if (v7) {
      id v52 = v7;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v7 = 0;
  }

  a1 = v61;
LABEL_73:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v46 = *(void *)(a1 + 48);
    uint64_t v47 = a1;
    uint64_t v48 = *(void *)(a1 + 32);
    long long v49 = [v7 MSVerboseDescription];
    *(_DWORD *)buf = 138544131;
    *(void *)&uint8_t buf[4] = v46;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v48;
    *(_WORD *)&buf[22] = 2114;
    long long v75 = v49;
    LOWORD(v76) = 2113;
    *(void *)((char *)&v76 + 2) = v64;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Finished retrieving album summary for album %{public}@. Error: %{public}@ Response: %{private}@", buf, 0x2Au);

    a1 = v47;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __75__MSASProtocol_albumSummaryAlbum_albumURLString_resetSync_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  [*(id *)(a1 + 32) setClientOrgKey:v6];
}

- (void)getSharingInfoForAlbum:(id)a3 albumURLString:(id)a4 completionBlock:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9) {
    [MEMORY[0x1E4F1CB10] URLWithString:v9];
  }
  else {
  id v11 = [(MSASProtocol *)self baseURL];
  }
  id v12 = [(MSASProtocol *)self _sharingInfoURLWithBaseURL:v11];

  uint64_t v13 = [MEMORY[0x1E4F18D50] requestWithURL:v12];
  uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  id v15 = [v8 GUID];

  if (v15)
  {
    id v16 = [v8 GUID];
    [v14 setObject:v16 forKey:@"albumguid"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v23 = self;
    __int16 v24 = 2114;
    id v25 = v8;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Requesting sharing relationships for album %{public}@", buf, 0x16u);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__MSASProtocol_getSharingInfoForAlbum_albumURLString_completionBlock___block_invoke;
  v19[3] = &unk_1E6C3D820;
  id v20 = v8;
  id v21 = v10;
  id v17 = v10;
  id v18 = v8;
  [(MSASProtocol *)self sendURLRequest:v13 bodyObj:v14 completionBlock:v19];
}

void __70__MSASProtocol_getSharingInfoForAlbum_albumURLString_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  if (!v6)
  {
    objc_opt_class();
    id v24 = v7;
    if (objc_opt_isKindOfClass()) {
      id v9 = v7;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
    id v11 = [v10 objectForKey:@"sharinginfo"];
    objc_opt_class();
    id v12 = 0;
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v10 objectForKey:@"sharinginfo"];
    }
    id v23 = v10;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v19 = v18;
          }
          else {
            uint64_t v19 = 0;
          }
          id v20 = v19;
          id v21 = +[MSASSharingRelationship MSASPSharingRelationshipFromProtocolDictionary:v20];
          if (v21)
          {
            id v22 = [*(id *)(a1 + 32) GUID];
            [v21 setAlbumGUID:v22];

            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v30 = v21;
              _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Found sharing relationship: %@", buf, 0xCu);
            }
            [v8 addObject:v21];
          }

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v15);
    }

    id v7 = v24;
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getChangesRootCtag:(id)a3 migrationCtag:(id)a4 completionBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F18D50];
  id v12 = [(MSASProtocol *)self _getChangesURL];
  id v13 = [v11 requestWithURL:v12];

  uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v15 = v14;
  if (v8) {
    [v14 setObject:v8 forKey:@"rootctag"];
  }
  int v16 = _os_feature_enabled_impl();
  if (v9 && v16) {
    [v15 setObject:v9 forKey:@"migrationctag"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = self;
    __int16 v25 = 2114;
    id v26 = v8;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Requesting changes since root ctag %{public}@", buf, 0x16u);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__MSASProtocol_getChangesRootCtag_migrationCtag_completionBlock___block_invoke;
  v19[3] = &unk_1E6C3D718;
  id v20 = v8;
  id v21 = self;
  id v22 = v10;
  id v17 = v10;
  id v18 = v8;
  [(MSASProtocol *)self sendURLRequest:v13 bodyObj:v15 completionBlock:v19];
}

void __65__MSASProtocol_getChangesRootCtag_migrationCtag_completionBlock___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = 0;
    v92 = 0;
    id obj = 0;
    __int16 v88 = 0;
    goto LABEL_115;
  }
  id v84 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v9;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  id v13 = [v12 objectForKey:@"rootctag"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v15 = 0;
  if (isKindOfClass)
  {
    uint64_t v15 = [v12 objectForKey:@"rootctag"];
  }
  __int16 v88 = (void *)v15;

  int v16 = [v12 objectForKey:@"ctagrespected"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [v12 objectForKey:@"ctagrespected"];
  }
  else
  {
    id v17 = 0;
  }

  BOOL v18 = ([v17 isEqualToString:@"0"] & 1) != 0 || a1[4] == 0;
  BOOL v89 = v18;
  uint64_t v19 = [v12 objectForKey:@"albums"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = [v12 objectForKey:@"albums"];
  }
  else
  {
    id v20 = 0;
  }

  uint64_t v85 = a1;
  __int16 v86 = v20;
  uint64_t v87 = v12;
  uint64_t v83 = v17;
  if ([v20 count])
  {
    v92 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id obja = v20;
    uint64_t v21 = [obja countByEnumeratingWithState:&v107 objects:v124 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v108;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v108 != v23) {
            objc_enumerationMutation(obja);
          }
          __int16 v25 = *(void **)(*((void *)&v107 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v26 = objc_alloc_init(MSASAlbumChange);
            uint64_t v27 = [v25 objectForKey:@"albumguid"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v28 = [v25 objectForKey:@"albumguid"];
              [(MSASAlbumChange *)v26 setGUID:v28];
            }
            else
            {
              [(MSASAlbumChange *)v26 setGUID:0];
            }

            uint64_t v29 = [v25 objectForKey:@"delete"];
            objc_opt_class();
            char v30 = objc_opt_isKindOfClass();
            if (v30)
            {
              uint64_t v31 = [v25 objectForKey:@"delete"];
              v91 = v31;
            }
            else
            {
              uint64_t v31 = 0;
            }
            -[MSASAlbumChange setWasDeleted:](v26, "setWasDeleted:", [v31 intValue] != 0);
            if (v30) {

            }
            uint64_t v32 = [v25 objectForKey:@"albumlocation"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v33 = [v25 objectForKey:@"albumlocation"];
              [(MSASAlbumChange *)v26 setURLString:v33];
            }
            else
            {
              [(MSASAlbumChange *)v26 setURLString:0];
            }

            id v34 = [v25 objectForKey:@"name"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v35 = [v25 objectForKey:@"name"];
              [(MSASAlbumChange *)v26 setName:v35];
            }
            else
            {
              [(MSASAlbumChange *)v26 setName:0];
            }

            uint64_t v36 = [v25 objectForKey:@"email"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v37 = [v25 objectForKey:@"email"];
              [(MSASAlbumChange *)v26 setOwnerEmail:v37];
            }
            else
            {
              [(MSASAlbumChange *)v26 setOwnerEmail:0];
            }

            uint64_t v38 = [v25 objectForKey:@"personid"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v39 = [v25 objectForKey:@"personid"];
              [(MSASAlbumChange *)v26 setOwnerPersonID:v39];
            }
            else
            {
              [(MSASAlbumChange *)v26 setOwnerPersonID:0];
            }

            uint64_t v40 = [v25 objectForKey:@"firstname"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v41 = [v25 objectForKey:@"firstname"];
              [(MSASAlbumChange *)v26 setOwnerFirstName:v41];
            }
            else
            {
              [(MSASAlbumChange *)v26 setOwnerFirstName:0];
            }

            id v42 = [v25 objectForKey:@"lastname"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v43 = [v25 objectForKey:@"lastname"];
              [(MSASAlbumChange *)v26 setOwnerLastName:v43];
            }
            else
            {
              [(MSASAlbumChange *)v26 setOwnerLastName:0];
            }

            long long v44 = [v25 objectForKey:@"fullname"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              BOOL v45 = [v25 objectForKey:@"fullname"];
              [(MSASAlbumChange *)v26 setOwnerFullName:v45];
            }
            else
            {
              [(MSASAlbumChange *)v26 setOwnerFullName:0];
            }

            uint64_t v46 = +[MSASInvitation MSASPInvitationFromProtocolDictionary:v25];
            [(MSASAlbumChange *)v26 setInvitation:v46];

            [v92 addObject:v26];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v112 = v26;
              _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Album change received: %{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v22 = [obja countByEnumeratingWithState:&v107 objects:v124 count:16];
      }
      while (v22);
    }

    a1 = v85;
  }
  else
  {
    v92 = 0;
  }
  uint64_t v47 = [v12 objectForKey:@"sharinginfochanges"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v48 = [v12 objectForKey:@"sharinginfochanges"];
  }
  else
  {
    uint64_t v48 = 0;
  }

  v90 = v48;
  if ([v48 count])
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v48, "count"));
    id obj = (id)objc_claimAutoreleasedReturnValue();
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v49 = v48;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v103 objects:v123 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v104;
      uint64_t v53 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v104 != v52) {
            objc_enumerationMutation(v49);
          }
          uint64_t v55 = *(MSASAlbumChange **)(*((void *)&v103 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v56 = v55;
          }
          else {
            id v56 = 0;
          }
          id v57 = v56;
          if (v57)
          {
            [obj addObject:v57];
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v112 = v55;
              _os_log_debug_impl(&dword_1DC434000, v53, OS_LOG_TYPE_DEBUG, "Sharing info changed for album GUID: %{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v103 objects:v123 count:16];
      }
      while (v51);
    }

    a1 = v85;
    id v12 = v87;
  }
  else
  {
    id obj = 0;
  }
  long long v58 = [v12 objectForKey:@"albumstatechanges"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v59 = [v12 objectForKey:@"albumstatechanges"];
  }
  else
  {
    id v59 = 0;
  }

  if ([v59 count])
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v59, "count"));
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v60 = v59;
    uint64_t v61 = [v60 countByEnumeratingWithState:&v99 objects:v122 count:16];
    if (v61)
    {
      uint64_t v62 = v61;
      __int16 v82 = v59;
      uint64_t v63 = *(void *)v100;
      id v64 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t k = 0; k != v62; ++k)
        {
          if (*(void *)v100 != v63) {
            objc_enumerationMutation(v60);
          }
          __int16 v66 = *(MSASAlbumChange **)(*((void *)&v99 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v67 = v66;
          }
          else {
            uint64_t v67 = 0;
          }
          id v68 = v67;
          if (v68)
          {
            [v10 addObject:v68];
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v112 = v66;
              _os_log_debug_impl(&dword_1DC434000, v64, OS_LOG_TYPE_DEBUG, "Key-Value info changed for album GUID: %{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v62 = [v60 countByEnumeratingWithState:&v99 objects:v122 count:16];
      }
      while (v62);
LABEL_112:
      a1 = v85;
      id v59 = v82;
    }
    goto LABEL_113;
  }
  if (!v89)
  {
    id v10 = 0;
    goto LABEL_114;
  }
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v59, "count"));
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v60 = v86;
  uint64_t v69 = [v60 countByEnumeratingWithState:&v95 objects:v121 count:16];
  if (v69)
  {
    uint64_t v70 = v69;
    __int16 v82 = v59;
    uint64_t v71 = *(void *)v96;
    long long v72 = MEMORY[0x1E4F14500];
    while (1)
    {
      for (uint64_t m = 0; m != v70; ++m)
      {
        if (*(void *)v96 != v71) {
          objc_enumerationMutation(v60);
        }
        long long v74 = *(void **)(*((void *)&v95 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v75 = [v74 objectForKey:@"albumguid"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v76 = [v74 objectForKey:@"albumguid"];

            if (!v76) {
              continue;
            }
            [v10 addObject:v76];
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v112 = v76;
              _os_log_debug_impl(&dword_1DC434000, v72, OS_LOG_TYPE_DEBUG, "Key-Value info changed for album GUID: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            long long v76 = v75;
          }
        }
      }
      uint64_t v70 = [v60 countByEnumeratingWithState:&v95 objects:v121 count:16];
      if (!v70) {
        goto LABEL_112;
      }
    }
  }
LABEL_113:

LABEL_114:
  id v8 = 0;
  id v7 = v84;

LABEL_115:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    long long v77 = (MSASAlbumChange *)a1[5];
    uint64_t v78 = [v92 count];
    uint64_t v79 = [obj count];
    uint64_t v80 = [v10 count];
    uint64_t v81 = [v8 MSVerboseDescription];
    *(_DWORD *)buf = 138544386;
    v112 = v77;
    __int16 v113 = 2048;
    uint64_t v114 = v78;
    __int16 v115 = 2048;
    uint64_t v116 = v79;
    __int16 v117 = 2048;
    uint64_t v118 = v80;
    __int16 v119 = 2114;
    v120 = v81;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Received changes for %ld albums, sharing info changes for %ld albums, KV changes for %ld albums. Error: %{public}@", buf, 0x34u);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)deleteComment:(id)a3 fromAssetCollection:(id)a4 inAlbum:(id)a5 albumURLString:(id)a6 completionBlock:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v15) {
    [MEMORY[0x1E4F1CB10] URLWithString:v15];
  }
  else {
  id v17 = [(MSASProtocol *)self baseURL];
  }
  BOOL v18 = [(MSASProtocol *)self _deleteCommentURLWithBaseURL:v17];

  uint64_t v19 = [MEMORY[0x1E4F18D50] requestWithURL:v18];
  id v20 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v21 = [v14 GUID];

  if (v21)
  {
    uint64_t v22 = [v14 GUID];
    [v20 setObject:v22 forKey:@"albumguid"];
  }
  uint64_t v23 = [v14 clientOrgKey];
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v20 clientOrgKey:v23];

  id v24 = [v13 GUID];

  if (v24)
  {
    __int16 v25 = [v13 GUID];
    [v20 setObject:v25 forKey:@"assetguid"];
  }
  if (([v12 ID] & 0x80000000) != 0)
  {
    uint64_t v27 = [v12 timestamp];

    if (!v27) {
      goto LABEL_13;
    }
    id v32 = v16;
    long long v28 = NSString;
    id v26 = [v12 timestamp];
    [v26 timeIntervalSinceReferenceDate];
    char v30 = objc_msgSend(v28, "stringWithFormat:", @"%f", v29);
    [v20 setObject:v30 forKey:@"commenttimestamp"];

    id v16 = v32;
  }
  else
  {
    id v26 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v12, "ID"));
    [v20 setObject:v26 forKey:@"commentposition"];
  }

LABEL_13:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = self;
    __int16 v37 = 2114;
    id v38 = v12;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Sending request to delete comment %{public}@", buf, 0x16u);
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __89__MSASProtocol_deleteComment_fromAssetCollection_inAlbum_albumURLString_completionBlock___block_invoke;
  v33[3] = &unk_1E6C3D790;
  id v34 = v16;
  id v31 = v16;
  [(MSASProtocol *)self sendURLRequest:v19 bodyObj:v20 completionBlock:v33];
}

uint64_t __89__MSASProtocol_deleteComment_fromAssetCollection_inAlbum_albumURLString_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteAssetCollections:(id)a3 inAlbum:(id)a4 completionBlock:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v31 = a5;
  id v10 = [v9 URLString];
  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F1CB10];
    id v12 = [v9 URLString];
    uint64_t v13 = [v11 URLWithString:v12];
  }
  else
  {
    uint64_t v13 = [(MSASProtocol *)self baseURL];
  }

  id v14 = (void *)MEMORY[0x1E4F18D50];
  id v32 = (void *)v13;
  id v15 = [(MSASProtocol *)self _deleteAssetsURLWithBaseURL:v13];
  id v16 = [v14 requestWithURL:v15];

  id v17 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v24 = [v23 GUID];

        if (v24)
        {
          __int16 v25 = [v23 GUID];
          [v17 addObject:v25];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v20);
  }

  id v26 = [MEMORY[0x1E4F1CA60] dictionary];
  [v26 setObject:v17 forKey:@"assets"];
  uint64_t v27 = [v9 GUID];

  if (v27)
  {
    long long v28 = [v9 GUID];
    [v26 setObject:v28 forKey:@"albumguid"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = [v17 count];
    *(_DWORD *)buf = 138543618;
    uint64_t v40 = self;
    __int16 v41 = 2048;
    uint64_t v42 = v29;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Sending request to delete %ld photos.", buf, 0x16u);
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __63__MSASProtocol_deleteAssetCollections_inAlbum_completionBlock___block_invoke;
  v33[3] = &unk_1E6C3D790;
  id v34 = v31;
  id v30 = v31;
  [(MSASProtocol *)self sendURLRequest:v16 bodyObj:v26 completionBlock:v33];
}

uint64_t __63__MSASProtocol_deleteAssetCollections_inAlbum_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteAlbum:(id)a3 completionBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 URLString];
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F1CB10];
    id v10 = [v6 URLString];
    id v11 = [v9 URLWithString:v10];
  }
  else
  {
    id v11 = [(MSASProtocol *)self baseURL];
  }

  id v12 = (void *)MEMORY[0x1E4F18D50];
  uint64_t v13 = [(MSASProtocol *)self _deleteURLWithBaseURL:v11];
  id v14 = [v12 requestWithURL:v13];

  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  id v16 = [v6 GUID];

  if (v16)
  {
    id v17 = [v6 GUID];
    [v15 setObject:v17 forKey:@"albumguid"];
  }
  id v18 = [v6 ctag];

  if (v18)
  {
    uint64_t v19 = [v6 ctag];
    [v15 setObject:v19 forKey:@"albumctag"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = self;
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Sending request to delete album %{public}@", buf, 0x16u);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __44__MSASProtocol_deleteAlbum_completionBlock___block_invoke;
  v21[3] = &unk_1E6C3D790;
  id v22 = v7;
  id v20 = v7;
  [(MSASProtocol *)self sendURLRequest:v14 bodyObj:v15 completionBlock:v21];
}

uint64_t __44__MSASProtocol_deleteAlbum_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbum:(id)a4 completionBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 URLString];
  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F1CB10];
    id v12 = [v8 URLString];
    uint64_t v13 = [v11 URLWithString:v12];
  }
  else
  {
    uint64_t v13 = [(MSASProtocol *)self baseURL];
  }

  id v14 = (void *)MEMORY[0x1E4F18D50];
  id v15 = [(MSASProtocol *)self _enableMultipleContributorsURLWithBaseURL:v13];
  id v16 = [v14 requestWithURL:v15];

  id v17 = [MEMORY[0x1E4F1CA60] dictionary];
  id v18 = [v8 GUID];

  if (v18)
  {
    uint64_t v19 = [v8 GUID];
    [v17 setObject:v19 forKey:@"albumguid"];
  }
  id v20 = [v8 clientOrgKey];
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v17 clientOrgKey:v20];

  if (v6) {
    uint64_t v21 = @"1";
  }
  else {
    uint64_t v21 = @"0";
  }
  [v17 setObject:v21 forKey:@"allowcontributions"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__MSASProtocol_setMultipleContributorsEnabled_forAlbum_completionBlock___block_invoke;
  v23[3] = &unk_1E6C3D790;
  id v24 = v9;
  id v22 = v9;
  [(MSASProtocol *)self sendURLRequest:v16 bodyObj:v17 completionBlock:v23];
}

uint64_t __72__MSASProtocol_setMultipleContributorsEnabled_forAlbum_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbum:(id)a4 completionBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 URLString];
  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F1CB10];
    id v12 = [v8 URLString];
    uint64_t v13 = [v11 URLWithString:v12];
  }
  else
  {
    uint64_t v13 = [(MSASProtocol *)self baseURL];
  }

  id v14 = (void *)MEMORY[0x1E4F18D50];
  id v15 = [(MSASProtocol *)self _enablePublicAccessURLWithBaseURL:v13];
  id v16 = [v14 requestWithURL:v15];

  id v17 = [MEMORY[0x1E4F1CA60] dictionary];
  id v18 = [v8 GUID];

  if (v18)
  {
    uint64_t v19 = [v8 GUID];
    [v17 setObject:v19 forKey:@"albumguid"];
  }
  id v20 = [v8 clientOrgKey];
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v17 clientOrgKey:v20];

  if (v6) {
    uint64_t v21 = @"1";
  }
  else {
    uint64_t v21 = @"0";
  }
  [v17 setObject:v21 forKey:@"ispublic"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__MSASProtocol_setPublicAccessEnabled_forAlbum_completionBlock___block_invoke;
  v23[3] = &unk_1E6C3D790;
  id v24 = v9;
  id v22 = v9;
  [(MSASProtocol *)self sendURLRequest:v16 bodyObj:v17 completionBlock:v23];
}

uint64_t __64__MSASProtocol_setPublicAccessEnabled_forAlbum_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addComment:(id)a3 toAssetCollection:(id)a4 inAlbum:(id)a5 albumURLString:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v15) {
    [MEMORY[0x1E4F1CB10] URLWithString:v15];
  }
  else {
  uint64_t v17 = [(MSASProtocol *)self baseURL];
  }
  id v18 = (void *)MEMORY[0x1E4F18D50];
  uint64_t v39 = (void *)v17;
  uint64_t v19 = -[MSASProtocol _addCommentURLWithBaseURL:](self, "_addCommentURLWithBaseURL:");
  id v20 = [v18 requestWithURL:v19];

  uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
  id v22 = [v14 GUID];

  if (v22)
  {
    uint64_t v23 = [v14 GUID];
    [v21 setObject:v23 forKey:@"albumguid"];
  }
  id v24 = [v14 clientOrgKey];
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v21 clientOrgKey:v24];

  __int16 v25 = [v13 GUID];

  if (v25)
  {
    id v26 = [v13 GUID];
    [v21 setObject:v26 forKey:@"assetguid"];
  }
  uint64_t v27 = [v12 timestamp];

  if (v27)
  {
    long long v28 = NSString;
    uint64_t v29 = [v12 timestamp];
    [v29 timeIntervalSinceReferenceDate];
    id v31 = objc_msgSend(v28, "stringWithFormat:", @"%f", v30);
    [v21 setObject:v31 forKey:@"commenttimestamp"];
  }
  if ([v12 isBatchComment]) {
    id v32 = @"1";
  }
  else {
    id v32 = @"0";
  }
  [v21 setObject:v32 forKey:@"isbatchcomment"];
  if ([v12 isLike])
  {
    [v21 setObject:@"1" forKey:@"commenttype"];
    uint64_t v33 = v39;
  }
  else
  {
    [v21 setObject:@"0" forKey:@"commenttype"];
    id v34 = [v12 content];

    uint64_t v33 = v39;
    if (v34)
    {
      long long v35 = [v12 content];
      [v21 setObject:v35 forKey:@"comment"];
    }
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __84__MSASProtocol_addComment_toAssetCollection_inAlbum_albumURLString_completionBlock___block_invoke;
  v40[3] = &unk_1E6C3D6E0;
  v40[4] = self;
  id v41 = v14;
  id v42 = v13;
  id v43 = v16;
  id v36 = v16;
  id v37 = v13;
  id v38 = v14;
  [(MSASProtocol *)self sendURLRequest:v20 bodyObj:v21 completionBlock:v40];
}

void __84__MSASProtocol_addComment_toAssetCollection_inAlbum_albumURLString_completionBlock___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    __int16 v25 = [v9 objectForKey:@"commentposition"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [v10 objectForKey:@"commentposition"];

      if (v11)
      {
        (*(void (**)(void, void, uint64_t))(a1[7] + 16))(a1[7], 0, [v11 intValue]);
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
    }
    uint64_t v26 = a1[7];
    uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
    id v11 = (id)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_COMMENT_NO_INDEX");
    long long v28 = [v27 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:12 description:v11 underlyingError:0];
    (*(void (**)(uint64_t, void *, void))(v26 + 16))(v26, v28, 0);

    goto LABEL_23;
  }
  if ([v8 MSContainsErrorWithDomain:*MEMORY[0x1E4F18F50] code:403])
  {
    id v11 = v8;
    id v12 = (void *)a1[4];
    id v38 = 0;
    int v13 = [v12 responseDict:v10 containsLimitErrorCode:@"4034" outMaxAllowed:&v38];
    id v14 = v38;
    if (v13)
    {
      id v15 = [MEMORY[0x1E4F1CA60] dictionary];
      id v16 = v15;
      uint64_t v17 = a1[5];
      if (v17) {
        [v15 setObject:v17 forKey:@"album"];
      }
      id v36 = v7;
      uint64_t v18 = a1[6];
      if (v18) {
        [v16 setObject:v18 forKey:@"assetCollection"];
      }
      long long v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = NSString;
      id v20 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_LIMIT_COMMENTS_P_COUNT");
      uint64_t v21 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "intValue"));
      id v22 = objc_msgSend(v19, "stringWithFormat:", v20, v21);
      uint64_t v23 = [v35 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:16 description:v22 underlyingError:v11 additionalUserInfo:v16];

      id v11 = (id)v21;
      id v24 = v14;
    }
    else
    {
      uint64_t v29 = (void *)a1[4];
      id v37 = v14;
      int v30 = [v29 responseDict:v10 containsLimitErrorCode:@"4035" outMaxAllowed:&v37];
      id v24 = v37;

      if (!v30)
      {
LABEL_22:
        (*(void (**)(void))(a1[7] + 16))();

        goto LABEL_23;
      }
      id v31 = [MEMORY[0x1E4F1CA60] dictionary];
      id v16 = v31;
      uint64_t v32 = a1[5];
      if (v32) {
        [v31 setObject:v32 forKey:@"album"];
      }
      id v36 = v7;
      uint64_t v33 = a1[6];
      if (v33) {
        [v16 setObject:v33 forKey:@"assetCollection"];
      }
      id v34 = (void *)MEMORY[0x1E4F28C58];
      id v20 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_LIMIT_COMMENT_LENGTH");
      uint64_t v23 = [v34 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:17 description:v20 underlyingError:v11 additionalUserInfo:v16];
    }

    id v11 = (id)v23;
    id v7 = v36;
    goto LABEL_22;
  }
  (*(void (**)(void))(a1[7] + 16))();
LABEL_24:
}

- (void)removeSharingRelationships:(id)a3 fromAlbum:(id)a4 completionBlock:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v28 = a5;
  id v10 = (void *)MEMORY[0x1E4F18D50];
  id v11 = [(MSASProtocol *)self _unshareURL];
  uint64_t v29 = [v10 requestWithURL:v11];

  id v12 = [MEMORY[0x1E4F1CA60] dictionary];
  int v13 = [v9 GUID];

  if (v13)
  {
    id v14 = [v9 GUID];
    [v12 setObject:v14 forKey:@"albumguid"];
  }
  id v15 = [v9 clientOrgKey];
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v12 clientOrgKey:v15];

  id v16 = [v9 ctag];

  if (v16)
  {
    uint64_t v17 = [v9 ctag];
    [v12 setObject:v17 forKey:@"albumctag"];
  }
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v19 = v8;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        __int16 v25 = [v24 GUID];

        if (v25)
        {
          uint64_t v26 = [v24 GUID];
          [v18 addObject:v26];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v21);
  }

  [v12 setObject:v18 forKey:@"invitations"];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __69__MSASProtocol_removeSharingRelationships_fromAlbum_completionBlock___block_invoke;
  v30[3] = &unk_1E6C3D790;
  id v31 = v28;
  id v27 = v28;
  [(MSASProtocol *)self sendURLRequest:v29 bodyObj:v12 completionBlock:v30];
}

uint64_t __69__MSASProtocol_removeSharingRelationships_fromAlbum_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addSharingRelationships:(id)a3 toAlbum:(id)a4 completionBlock:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v36 = a5;
  id v10 = (void *)MEMORY[0x1E4F18D50];
  id v11 = [(MSASProtocol *)self _shareURL];
  uint64_t v40 = [v10 requestWithURL:v11];

  unint64_t v12 = 0x1E4F1C000uLL;
  int v13 = [MEMORY[0x1E4F1CA60] dictionary];
  id v14 = [v9 GUID];

  if (v14)
  {
    id v15 = [v9 GUID];
    [v13 setObject:v15 forKey:@"albumguid"];
  }
  id v16 = [v9 clientOrgKey];
  uint64_t v39 = self;
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v13 clientOrgKey:v16];

  uint64_t v17 = [v9 ctag];

  if (v17)
  {
    uint64_t v18 = [v9 ctag];
    [v13 setObject:v18 forKey:@"albumctag"];
  }
  uint64_t v37 = v9;
  id v38 = v13;
  id v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  id v43 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v8, "count"));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v8;
  uint64_t v45 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v45)
  {
    uint64_t v44 = *(void *)v51;
    id v41 = v19;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v51 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v50 + 1) + 8 * v20);
        uint64_t v22 = [*(id *)(v12 + 2656) dictionary];
        uint64_t v23 = [v21 GUID];
        if (v23)
        {
          [v22 setObject:v23 forKey:@"invitationguid"];
          [v43 addObject:v23];
        }
        id v24 = [v21 phones];
        __int16 v25 = [v21 emails];
        if (v24 && [v24 count]) {
          [v22 setObject:v24 forKey:@"phonenumbers"];
        }
        if (v25 && [v25 count])
        {
          uint64_t v26 = [v25 objectAtIndex:0];
          [v22 setObject:v26 forKey:@"email"];
          if ((unint64_t)[v25 count] >= 2)
          {
            id v27 = [MEMORY[0x1E4F1CA80] setWithArray:v25];
            [v27 removeObject:v26];
            if ([v27 count])
            {
              [v27 allObjects];
              uint64_t v29 = v28 = v12;
              [v22 setObject:v29 forKey:@"alternateemails"];

              unint64_t v12 = v28;
              id v19 = v41;
            }
          }
        }
        else
        {
          uint64_t v26 = [v21 email];
          if (v26) {
            [v22 setObject:v26 forKey:@"email"];
          }
        }

        int v30 = [v21 firstName];
        if (v30) {
          [v22 setObject:v30 forKey:@"firstname"];
        }
        id v31 = [v21 lastName];
        if (v31) {
          [v22 setObject:v31 forKey:@"lastname"];
        }
        long long v32 = [v21 fullName];
        if (v32) {
          [v22 setObject:v32 forKey:@"fullname"];
        }
        [v19 addObject:v22];

        ++v20;
      }
      while (v45 != v20);
      uint64_t v45 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v45);
  }

  [v38 setObject:v19 forKey:@"invitations"];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __64__MSASProtocol_addSharingRelationships_toAlbum_completionBlock___block_invoke;
  v46[3] = &unk_1E6C3D6E0;
  v46[4] = v39;
  id v47 = v37;
  id v48 = v43;
  id v49 = v36;
  id v33 = v36;
  id v34 = v43;
  id v35 = v37;
  [(MSASProtocol *)v39 sendURLRequest:v40 bodyObj:v38 completionBlock:v46];
}

void __64__MSASProtocol_addSharingRelationships_toAlbum_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__7582;
  void v38[4] = __Block_byref_object_dispose__7583;
  id v39 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v20 = v9;
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v21 = v20;
    id v16 = v21;
    if (!v21)
    {
      id v13 = 0;
      id v19 = 0;
LABEL_19:

      id v23 = v13;
      goto LABEL_20;
    }
    uint64_t v22 = [(__CFString *)v21 objectForKey:@"sharinginfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = [(__CFString *)v16 objectForKey:@"sharinginfo"];
    }
    else
    {
      uint64_t v17 = 0;
    }

    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__7582;
    v34[4] = __Block_byref_object_dispose__7583;
    id v35 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __64__MSASProtocol_addSharingRelationships_toAlbum_completionBlock___block_invoke_2;
    v29[3] = &unk_1E6C3D768;
    long long v32 = v34;
    id v30 = *(id *)(a1 + 40);
    id v31 = *(id *)(a1 + 48);
    id v33 = v38;
    [v17 enumerateObjectsUsingBlock:v29];

    _Block_object_dispose(v34, 8);
    id v13 = 0;
    id v19 = 0;
LABEL_18:

    goto LABEL_19;
  }
  if ([v10 MSContainsErrorWithDomain:*MEMORY[0x1E4F18F50] code:403])
  {
    id v11 = *(void **)(a1 + 32);
    id v37 = 0;
    int v12 = [v11 responseDict:v9 containsLimitErrorCode:@"4031" outMaxAllowed:&v37];
    id v13 = v37;
    if (v12)
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      id v15 = NSString;
      id v16 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_LIMIT_SUBSCRIBERS_P_COUNT");
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "intValue"));
      uint64_t v18 = objc_msgSend(v15, "stringWithFormat:", v16, v17);
      id v19 = [v14 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:19 description:v18 underlyingError:v10];

      goto LABEL_18;
    }
    id v24 = *(void **)(a1 + 32);
    id v36 = v13;
    int v25 = [v24 responseDict:v9 containsLimitErrorCode:@"4033" outMaxAllowed:&v36];
    id v23 = v36;

    if (v25)
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
      id v27 = NSString;
      id v16 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_LIMIT_INVITATIONS_P_COUNT");
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v23, "intValue"));
      unint64_t v28 = objc_msgSend(v27, "stringWithFormat:", v16, v17);
      id v19 = [v26 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:20 description:v28 underlyingError:v10];

      id v13 = v23;
      goto LABEL_18;
    }
  }
  else
  {
    id v23 = 0;
  }
  id v19 = v10;
LABEL_20:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  _Block_object_dispose(v38, 8);
}

void __64__MSASProtocol_addSharingRelationships_toAlbum_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  BOOL v6 = [v5 objectForKey:@"sharingtype"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 objectForKey:@"sharingtype"];

    if (v7 && [v7 isEqualToString:@"owned"])
    {
      uint64_t v8 = +[MSASInvitation MSASPInvitationFromProtocolDictionary:v5];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      id v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) fullName];
      if (v11) {
        [*(id *)(a1 + 32) setOwnerFullName:v11];
      }
      int v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) email];
      if (v12) {
        [*(id *)(a1 + 32) setOwnerEmail:v12];
      }

      goto LABEL_33;
    }
  }
  else
  {

    id v7 = 0;
  }
  id v13 = [v5 objectForKey:@"invitationguid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = [v5 objectForKey:@"invitationguid"];

    if (v14 && [*(id *)(a1 + 40) containsObject:v14])
    {
      id v15 = [v5 objectForKey:@"phonenumbers"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = [v5 objectForKey:@"phonenumbers"];

        if (v16)
        {
          id v27 = v14;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v17 = v16;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v29;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v29 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                id v23 = [v22 objectForKey:@"phonenumber"];
                uint64_t v24 = [v22 objectForKey:@"invitationtoken"];
                int v25 = (void *)v24;
                if (v23) {
                  BOOL v26 = v24 == 0;
                }
                else {
                  BOOL v26 = 1;
                }
                if (!v26) {
                  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v24 forKey:v23];
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
            }
            while (v19);
          }

          id v14 = v27;
        }
      }
      else
      {
      }
    }
  }
  else
  {

    id v14 = 0;
  }

LABEL_33:
}

- (void)sendUploadCompleteSuccessfulAssetCollections:(id)a3 failedAssetCollections:(id)a4 album:(id)a5 completionBlock:(id)a6
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v56 = a4;
  id v11 = a5;
  id v58 = a6;
  int v12 = [v11 URLString];
  if (v12)
  {
    id v13 = (void *)MEMORY[0x1E4F1CB10];
    id v14 = [v11 URLString];
    uint64_t v15 = [v13 URLWithString:v14];
  }
  else
  {
    uint64_t v15 = [(MSASProtocol *)self baseURL];
  }
  id v60 = v11;

  id v16 = (void *)MEMORY[0x1E4F18D50];
  id v59 = (void *)v15;
  id v17 = [(MSASProtocol *)self _uploadCompleteURLWithBaseURL:v15];
  id v57 = [v16 requestWithURL:v17];

  uint64_t v63 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v69 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id obj = v10;
  uint64_t v64 = [obj countByEnumeratingWithState:&v82 objects:v94 count:16];
  if (v64)
  {
    uint64_t v62 = *(void *)v83;
    do
    {
      for (id i = 0; i != (id)v64; id i = (char *)i + 1)
      {
        if (*(void *)v83 != v62) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        uint64_t v20 = [v19 metadata];
        uint64_t v21 = [v20 objectForKey:@"pendingUploadGUID"];

        if (v21)
        {
          [v69 setObject:v19 forKey:v21];
          uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
          __int16 v66 = v21;
          [v22 setObject:v21 forKey:@"pendinguploadid"];
          [v22 setObject:@"1" forKey:@"promote"];
          id v23 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v24 = [v19 assets];
          int v25 = objc_msgSend(v23, "arrayWithCapacity:", objc_msgSend(v24, "count"));

          if ([v19 isVideo]) {
            [v22 setObject:@"video" forKey:@"mediaAssetType"];
          }
          id v67 = i;
          if ([v19 isPhotoIris]) {
            [v22 setObject:@"videoCompl" forKey:@"mediaAssetType"];
          }
          __int16 v65 = v22;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v79 = 0u;
          long long v78 = 0u;
          BOOL v26 = [v19 assets];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v78 objects:v93 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v79;
            do
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v79 != v29) {
                  objc_enumerationMutation(v26);
                }
                long long v31 = *(void **)(*((void *)&v78 + 1) + 8 * j);
                long long v32 = [v31 MMCSReceipt];

                if (v32)
                {
                  uint64_t v33 = [MEMORY[0x1E4F1CA60] dictionary];
                  id v34 = [v31 metadataValueForKey:@"MSAssetMetadataFileSize"];
                  id v35 = [v31 MMCSReceipt];
                  [v33 setObject:v35 forKey:@"receipt"];

                  if (v34)
                  {
                    id v36 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v34, "unsignedLongLongValue"), v56);
                    [v33 setObject:v36 forKey:@"size"];
                  }
                  id v37 = [v31 MMCSHash];

                  if (v37)
                  {
                    id v38 = [v31 MMCSHash];
                    id v39 = [v38 MSHexString];
                    [v33 setObject:v39 forKey:@"checksum"];
                  }
                  [v25 addObject:v33];
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v78 objects:v93 count:16];
            }
            while (v28);
          }

          if ([v25 count])
          {
            [v65 setObject:v25 forKey:@"files"];
            [v63 addObject:v65];
          }

          uint64_t v21 = v66;
          id i = v67;
        }
      }
      uint64_t v64 = [obj countByEnumeratingWithState:&v82 objects:v94 count:16];
    }
    while (v64);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v68 = v56;
  uint64_t v40 = [v68 countByEnumeratingWithState:&v74 objects:v92 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v75;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v75 != v42) {
          objc_enumerationMutation(v68);
        }
        uint64_t v44 = *(void **)(*((void *)&v74 + 1) + 8 * k);
        uint64_t v45 = [v44 metadata];
        uint64_t v46 = [v45 objectForKey:@"pendingUploadGUID"];

        if (v46)
        {
          [v69 setObject:v44 forKey:v46];
          id v47 = [MEMORY[0x1E4F1CA60] dictionary];
          [v47 setObject:v46 forKey:@"pendinguploadid"];
          [v47 setObject:@"0" forKey:@"promote"];
          [v63 addObject:v47];
        }
      }
      uint64_t v41 = [v68 countByEnumeratingWithState:&v74 objects:v92 count:16];
    }
    while (v41);
  }

  id v48 = [MEMORY[0x1E4F1CA60] dictionary];
  [v48 setObject:v63 forKey:@"assets"];
  id v49 = [v60 GUID];

  if (v49)
  {
    long long v50 = [v60 GUID];
    [v48 setObject:v50 forKey:@"albumguid"];
  }
  long long v51 = [v60 clientOrgKey];
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v48 clientOrgKey:v51];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v52 = [obj count];
    uint64_t v53 = [v68 count];
    *(_DWORD *)buf = 138543874;
    uint64_t v87 = self;
    __int16 v88 = 2048;
    uint64_t v89 = v52;
    __int16 v90 = 2048;
    uint64_t v91 = v53;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Sending upload complete with %ld successful uploads and %ld failed uploads.", buf, 0x20u);
  }
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __106__MSASProtocol_sendUploadCompleteSuccessfulAssetCollections_failedAssetCollections_album_completionBlock___block_invoke;
  v70[3] = &unk_1E6C3D718;
  id v71 = v69;
  long long v72 = self;
  id v73 = v58;
  id v54 = v58;
  id v55 = v69;
  [(MSASProtocol *)self sendURLRequest:v57 bodyObj:v48 completionBlock:v70];
}

void __106__MSASProtocol_sendUploadCompleteSuccessfulAssetCollections_failedAssetCollections_album_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v68 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!v6)
  {
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v65 = v7;
      id v9 = v7;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v79 objects:v88 count:16];
      if (!v10) {
        goto LABEL_53;
      }
      uint64_t v11 = v10;
      uint64_t v74 = *(void *)v80;
      unint64_t v12 = 0x1E4F29000uLL;
      id v71 = v9;
      uint64_t v72 = a1;
      while (1)
      {
        uint64_t v13 = 0;
        uint64_t v73 = v11;
        do
        {
          if (*(void *)v80 != v74) {
            objc_enumerationMutation(v9);
          }
          id v14 = v8;
          uint64_t v15 = *(void **)(*((void *)&v79 + 1) + 8 * v13);
          if (v15)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v23 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v24 = *(void **)(v12 + 24);
              id v17 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_BAD_FIELD_P_FIELD");
              int v25 = objc_msgSend(v24, "stringWithFormat:", v17, @"pending upload ID");
              BOOL v26 = [v23 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:10 description:v25];

              goto LABEL_47;
            }
          }
          uint64_t v16 = [*(id *)(a1 + 32) objectForKey:v15];
          if (v16)
          {
            id v17 = (__CFString *)v16;
            uint64_t v18 = [v9 objectForKey:v15];
            if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              uint64_t v19 = [v18 objectForKey:@"assetguid"];
              if (v19)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  unint64_t v30 = v12;
                  long long v31 = (void *)MEMORY[0x1E4F28C58];
                  long long v32 = *(void **)(v30 + 24);
                  uint64_t v20 = (void *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_BAD_FIELD_P_FIELD");
                  uint64_t v21 = objc_msgSend(v32, "stringWithFormat:", v20, @"assetguid");
                  BOOL v26 = [v31 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:10 description:v21];
                  goto LABEL_42;
                }
              }
              uint64_t v20 = [v18 objectForKey:@"assetctag"];
              if (v20)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  unint64_t v33 = v12;
                  id v34 = (void *)MEMORY[0x1E4F28C58];
                  id v35 = *(void **)(v33 + 24);
                  uint64_t v21 = (void *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_BAD_FIELD_P_FIELD");
                  uint64_t v36 = objc_msgSend(v35, "stringWithFormat:", v21, @"assetctag");
                  BOOL v26 = [v34 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:10 description:v36];
                  id v37 = (void *)v36;
                  goto LABEL_41;
                }
              }
              uint64_t v21 = [v18 objectForKey:@"success"];
              if (v21)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  id v67 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v44 = *(void **)(v12 + 24);
                  CFStringRef v70 = MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_BAD_FIELD_P_FIELD");
                  uint64_t v45 = objc_msgSend(v44, "stringWithFormat:", v70, @"success");
                  BOOL v26 = [v67 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:10 description:v45];

                  id v37 = (void *)v70;
                  goto LABEL_41;
                }
              }
              int v66 = [v21 intValue];
              uint64_t v22 = [v18 objectForKey:@"assetnumber"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v69 = [v18 objectForKey:@"assetnumber"];
              }
              else
              {
                uint64_t v69 = 0;
              }

              id v38 = [(__CFString *)v17 GUID];
              char v39 = [v38 isEqualToString:v19];

              if (v39)
              {
                if (v66)
                {
                  if (v20) {
                    [(__CFString *)v17 setCtag:v20];
                  }
                  id v37 = v69;
                  if (v69)
                  {
                    -[__CFString setPhotoNumber:](v17, "setPhotoNumber:", [v69 longLongValue]);
                    id v37 = v69;
                  }
                  BOOL v26 = 0;
LABEL_41:

LABEL_42:
LABEL_43:

                  if (v26) {
                    [v14 setObject:v26 forKey:v17];
                  }
                  else {
                    [v68 addObject:v17];
                  }
                  id v9 = v71;
                  a1 = v72;
                  uint64_t v11 = v73;
                  [*(id *)(v72 + 32) removeObjectForKey:v15];
LABEL_47:

                  if (v26)
                  {
                    uint64_t v8 = v14;
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v47 = *(void *)(a1 + 40);
                      *(_DWORD *)buf = 138543618;
                      uint64_t v85 = v47;
                      __int16 v86 = 2114;
                      uint64_t v87 = (uint64_t)v26;
                      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Skipping asset collection in response. Error: %{public}@", buf, 0x16u);
                    }
                  }
                  else
                  {
                    uint64_t v8 = v14;
                  }
                  goto LABEL_51;
                }
                uint64_t v46 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v41 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_COLL_REJECTED");
                uint64_t v42 = v46;
                uint64_t v43 = 8;
              }
              else
              {
                uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v41 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_MISMATCHED_COLLECTION");
                uint64_t v42 = v40;
                uint64_t v43 = 6;
              }
              BOOL v26 = [v42 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:v43 description:v41];

              id v37 = v69;
              goto LABEL_41;
            }
            unint64_t v27 = v12;
            uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v29 = *(void **)(v27 + 24);
            uint64_t v19 = (void *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_BAD_FIELD_P_FIELD");
            uint64_t v20 = objc_msgSend(v29, "stringWithFormat:", v19, v15);
            BOOL v26 = [v28 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:10 description:v20];
            goto LABEL_43;
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v48 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            uint64_t v85 = v48;
            __int16 v86 = 2114;
            uint64_t v87 = (uint64_t)v15;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Ignoring unknown pending upload ID %{public}@", buf, 0x16u);
          }
          BOOL v26 = 0;
LABEL_51:

          ++v13;
          unint64_t v12 = 0x1E4F29000;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v79 objects:v88 count:16];
        if (!v11)
        {
LABEL_53:

          id v6 = 0;
          id v7 = v65;
          goto LABEL_55;
        }
      }
    }
    id v49 = (void *)MEMORY[0x1E4F28C58];
    long long v50 = NSString;
    long long v51 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_BAD_FIELD_P_FIELD");
    uint64_t v52 = objc_msgSend(v50, "stringWithFormat:", v51, @"response body");
    id v6 = [v49 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:10 description:v52];
  }
LABEL_55:
  if ([*(id *)(a1 + 32) count])
  {
    id v53 = v7;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v63 = *(void *)(a1 + 40);
      uint64_t v64 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 138543618;
      uint64_t v85 = v63;
      __int16 v86 = 2048;
      uint64_t v87 = v64;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Found %ld orphaned asset collections.", buf, 0x16u);
    }
    id v54 = (void *)MEMORY[0x1E4F28C58];
    id v55 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_COLL_IGNORED");
    id v56 = [v54 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:9 description:v55];

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v57 = *(id *)(a1 + 32);
    uint64_t v58 = [v57 countByEnumeratingWithState:&v75 objects:v83 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v59; ++i)
        {
          if (*(void *)v76 != v60) {
            objc_enumerationMutation(v57);
          }
          uint64_t v62 = [*(id *)(a1 + 32) objectForKey:*(void *)(*((void *)&v75 + 1) + 8 * i)];
          [v8 setObject:v56 forKey:v62];
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v75 objects:v83 count:16];
      }
      while (v59);
    }

    id v7 = v53;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)responseDict:(id)a3 containsLimitErrorCode:(id)a4 outMaxAllowed:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = [v10 objectForKey:@"code"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      id v14 = [v11 objectForKey:@"code"];

      if (!v14 || ![v14 isEqualToString:v8])
      {
        char isKindOfClass = 0;
        goto LABEL_16;
      }
      uint64_t v15 = [v11 objectForKey:@"maxallowed"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v11 objectForKey:@"maxallowed"];

        if (a5 && v12)
        {
          id v12 = v12;
          *a5 = v12;
        }
      }
      else
      {

        id v12 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }

LABEL_16:
    goto LABEL_17;
  }
  char isKindOfClass = 0;
LABEL_17:

  return isKindOfClass & 1;
}

- (void)getVideoURL:(id)a3 forAssetCollectionWithGUID:(id)a4 inAlbumWithGUID:(id)a5 albumURLString:(id)a6 withClientOrgKey:(id)a7 completionBlock:(id)a8
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v17) {
    [MEMORY[0x1E4F1CB10] URLWithString:v17];
  }
  else {
  uint64_t v20 = [(MSASProtocol *)self baseURL];
  }
  uint64_t v21 = (void *)MEMORY[0x1E4F18D50];
  uint64_t v22 = [(MSASProtocol *)self _getVideoURLWithBaseURL:v20];
  id v23 = [v21 requestWithURL:v22];

  uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v31 = v16;
  [v24 setObject:v16 forKey:@"albumguid"];
  unint64_t v30 = v18;
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v24 clientOrgKey:v18];
  [v24 setObject:v15 forKey:@"assetguid"];
  int v25 = [v14 MMCSHash];
  BOOL v26 = [v25 MSHexString];
  [v24 setObject:v26 forKey:@"checksum"];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v37 = self;
    __int16 v38 = 2114;
    id v39 = v14;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Getting video URL for asset %{public}@.", buf, 0x16u);
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __119__MSASProtocol_getVideoURL_forAssetCollectionWithGUID_inAlbumWithGUID_albumURLString_withClientOrgKey_completionBlock___block_invoke;
  v32[3] = &unk_1E6C3D6E0;
  v32[4] = self;
  id v33 = v15;
  id v34 = v14;
  id v35 = v19;
  id v27 = v19;
  id v28 = v14;
  id v29 = v15;
  [(MSASProtocol *)self sendURLRequest:v23 bodyObj:v24 completionBlock:v32];
}

void __119__MSASProtocol_getVideoURL_forAssetCollectionWithGUID_inAlbumWithGUID_albumURLString_withClientOrgKey_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  uint64_t v67 = 0;
  id v68 = &v67;
  uint64_t v69 = 0x3032000000;
  CFStringRef v70 = __Block_byref_object_copy__7582;
  id v71 = __Block_byref_object_dispose__7583;
  id v11 = v8;
  id v72 = v11;
  if (v11)
  {
    if ([v7 statusCode] == 400)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v12 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        id v74 = v12;
        __int16 v75 = 2114;
        id v76 = v11;
        uint64_t v13 = MEMORY[0x1E4F14500];
        id v14 = "%{public}@: Bad request to server. Error: %{public}@";
LABEL_18:
        uint32_t v28 = 22;
LABEL_19:
        _os_log_error_impl(&dword_1DC434000, v13, OS_LOG_TYPE_ERROR, v14, buf, v28);
      }
    }
    else if ([v7 statusCode] == 404)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v16 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        id v74 = v16;
        __int16 v75 = 2114;
        id v76 = v11;
        uint64_t v13 = MEMORY[0x1E4F14500];
        id v14 = "%{public}@: Album does not exist on server. Error: %{public}@";
        goto LABEL_18;
      }
    }
    else if ([v7 statusCode] == 412)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v27 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        id v74 = v27;
        __int16 v75 = 2114;
        id v76 = v11;
        uint64_t v13 = MEMORY[0x1E4F14500];
        id v14 = "%{public}@: Precondition failed. Error: %{public}@";
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v30 = [v7 statusCode];
      BOOL v31 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v30 == 509)
      {
        if (v31)
        {
          id v57 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          id v74 = v57;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Bandwidth Limit Exceeded", buf, 0xCu);
        }
        long long v32 = (void *)MEMORY[0x1E4F28C58];
        id v33 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_LIMIT_BANDWIDTH");
        uint64_t v34 = [v32 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:21 description:v33 underlyingError:v11];
        id v35 = (void *)v68[5];
        v68[5] = v34;

        goto LABEL_34;
      }
      if (v31)
      {
        *(_DWORD *)buf = 138543362;
        id v74 = v11;
        uint64_t v13 = MEMORY[0x1E4F14500];
        id v14 = "Unknown server error response %{public}@";
        uint32_t v28 = 12;
        goto LABEL_19;
      }
    }
LABEL_34:
    int v25 = 0;
    goto LABEL_49;
  }
  id v15 = [v9 objectForKey:@"assetguid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v60 = [v9 objectForKey:@"assetguid"];
  }
  else
  {
    uint64_t v60 = 0;
  }

  if (([*(id *)(a1 + 40) isEqualToString:v60] & 1) == 0)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    CFStringRef v23 = MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_MISMATCHED_COLLECTION");
    uint64_t v24 = [v22 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:6 description:v23];
    uint64_t v59 = (void *)v23;
    int v25 = 0;
    BOOL v26 = (void *)v68[5];
    v68[5] = v24;
    goto LABEL_48;
  }
  id v17 = [*(id *)(a1 + 48) MMCSHash];
  id v18 = [v17 MSHexString];
  id v19 = [v9 objectForKey:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = [*(id *)(a1 + 48) MMCSHash];
    uint64_t v21 = [v20 MSHexString];
    uint64_t v59 = [v9 objectForKey:v21];
  }
  else
  {
    uint64_t v59 = 0;
  }

  if (v59)
  {
    id v29 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
    if (v29)
    {
      [v10 addObject:v29];
      goto LABEL_38;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v56 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v74 = v56;
      __int16 v75 = 2114;
      id v76 = v59;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unable to create URL with server url string %{public}@", buf, 0x16u);
    }
    uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = NSString;
    uint64_t v42 = (__CFString *)MSCFCopyLocalizedString(@"RROR_SHARING_BAD_FIELD_P_FIELD");
    uint64_t v43 = objc_msgSend(v41, "stringWithFormat:", v42, v59);
    uint64_t v44 = objc_msgSend(*(id *)(a1 + 32), "HTTPErrorWithStatusCode:", objc_msgSend(v7, "statusCode"));
    uint64_t v45 = [v40 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:4 description:v43 underlyingError:v44];
    uint64_t v46 = (void *)v68[5];
    v68[5] = v45;

    id v29 = 0;
  }
  else
  {
    uint64_t v58 = [*(id *)(a1 + 48) MMCSHash];
    uint64_t v36 = [v58 MSHexString];
    id v37 = [v9 objectForKey:v36];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v38 = [*(id *)(a1 + 48) MMCSHash];
      id v39 = [v38 MSHexString];
      id v29 = [v9 objectForKey:v39];
    }
    else
    {
      id v29 = 0;
    }

    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __119__MSASProtocol_getVideoURL_forAssetCollectionWithGUID_inAlbumWithGUID_albumURLString_withClientOrgKey_completionBlock___block_invoke_422;
    v61[3] = &unk_1E6C3D740;
    uint64_t v47 = v10;
    uint64_t v48 = *(void *)(a1 + 32);
    uint64_t v62 = v47;
    uint64_t v63 = v48;
    id v64 = 0;
    int v66 = &v67;
    id v65 = v7;
    [v29 enumerateObjectsUsingBlock:v61];

    uint64_t v42 = v62;
  }

LABEL_38:
  id v49 = [v9 objectForKey:@"url_expiry"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_43;
  }
  BOOL v26 = [v9 objectForKey:@"url_expiry"];

  if (!v26)
  {
LABEL_43:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v55 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v74 = v55;
      __int16 v75 = 2114;
      id v76 = v10;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Server does not return expiry for URLs %{public}@.", buf, 0x16u);
    }
    BOOL v26 = 0;
    goto LABEL_46;
  }
  id v50 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  long long v51 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
  [v50 setLocale:v51];
  [v50 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
  uint64_t v52 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v50 setTimeZone:v52];

  int v25 = [v50 dateFromString:v26];

  if (!v25)
  {
LABEL_46:
    int v25 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1200.0];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v54 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      id v74 = v54;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Setting to expire in 20 minutes.", buf, 0xCu);
    }
  }
LABEL_48:

LABEL_49:
  uint64_t v53 = *(void *)(a1 + 56);
  if (v53) {
    (*(void (**)(uint64_t, uint64_t, void *, void *))(v53 + 16))(v53, v68[5], v10, v25);
  }
  _Block_object_dispose(&v67, 8);
}

void __119__MSASProtocol_getVideoURL_forAssetCollectionWithGUID_inAlbumWithGUID_albumURLString_withClientOrgKey_completionBlock___block_invoke_422(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CB10] URLWithString:a2];
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      uint64_t v17 = v13;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unable to create URL with server url string %{public}@", buf, 0x16u);
    }
    id v4 = (void *)MEMORY[0x1E4F28C58];
    id v5 = NSString;
    id v6 = (__CFString *)MSCFCopyLocalizedString(@"RROR_SHARING_BAD_FIELD_P_FIELD");
    id v7 = objc_msgSend(v5, "stringWithFormat:", v6, *(void *)(a1 + 48));
    id v8 = objc_msgSend(*(id *)(a1 + 40), "HTTPErrorWithStatusCode:", objc_msgSend(*(id *)(a1 + 56), "statusCode"));
    uint64_t v9 = [v4 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:4 description:v7 underlyingError:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (void)getUploadTokens:(id)a3 forAssetCollectionWithGUID:(id)a4 inAlbumWithGUID:(id)a5 albumURLString:(id)a6 completionBlock:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v38 = a4;
  id v37 = a5;
  id v36 = a6;
  id v35 = a7;
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    __int16 v16 = MEMORY[0x1E4F14500];
    uint64_t v17 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(v13);
        }
        id v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v20 = [v19 MMCSAccessHeader];

        if (v20)
        {
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            continue;
          }
          uint64_t v21 = [v19 MMCSAccessHeader];
          *(_DWORD *)buf = 138543874;
          id v49 = self;
          __int16 v50 = 2114;
          uint64_t v51 = (uint64_t)v19;
          __int16 v52 = 2114;
          id v53 = v21;
          _os_log_error_impl(&dword_1DC434000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Requesting MMCS upload token for asset %{public}@ that already has token %{public}@. Ignoring the request.", buf, 0x20u);
          goto LABEL_11;
        }
        uint64_t v22 = [v19 MMCSHash];

        if (v22)
        {
          uint64_t v21 = [v19 MMCSHash];
          CFStringRef v23 = [v21 MSHexString];
          [v12 setObject:v19 forKey:v23];

LABEL_11:
          continue;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v49 = self;
          __int16 v50 = 2114;
          uint64_t v51 = (uint64_t)v19;
          _os_log_error_impl(&dword_1DC434000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Empty MMCS hash for asset %{public}@ requesting upload token. Ignoring the request.", buf, 0x16u);
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v15);
  }

  if ([v12 count])
  {
    uint64_t v24 = v38;
    int v25 = v36;
    if (v36) {
      [MEMORY[0x1E4F1CB10] URLWithString:v36];
    }
    else {
    uint32_t v28 = [(MSASProtocol *)self baseURL];
    }
    id v27 = v37;
    id v29 = (void *)MEMORY[0x1E4F18D50];
    uint64_t v30 = [(MSASProtocol *)self _getUploadTokensURLWithBaseURL:v28];
    BOOL v31 = [v29 requestWithURL:v30];

    long long v32 = [MEMORY[0x1E4F1CA60] dictionary];
    [v32 setObject:v37 forKey:@"albumguid"];
    [v32 setObject:v38 forKey:@"assetguid"];
    id v33 = [v12 allKeys];
    [v32 setObject:v33 forKey:@"checksums"];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = [v13 count];
      *(_DWORD *)buf = 138543874;
      id v49 = self;
      __int16 v50 = 2048;
      uint64_t v51 = v34;
      __int16 v52 = 2114;
      id v53 = v38;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Getting upload tokens for %ld assets of asset collection with GUID %{public}@.", buf, 0x20u);
    }
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __106__MSASProtocol_getUploadTokens_forAssetCollectionWithGUID_inAlbumWithGUID_albumURLString_completionBlock___block_invoke;
    v40[3] = &unk_1E6C3D718;
    id v41 = v12;
    uint64_t v42 = self;
    BOOL v26 = v35;
    id v43 = v35;
    [(MSASProtocol *)self sendURLRequest:v31 bodyObj:v32 completionBlock:v40];
  }
  else
  {
    uint64_t v24 = v38;
    BOOL v26 = v35;
    int v25 = v36;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v49 = self;
      __int16 v50 = 2114;
      uint64_t v51 = (uint64_t)v13;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Assets %{public}@ already have upload tokens. Ignoring the request.", buf, 0x16u);
    }
    (*((void (**)(id, void))v35 + 2))(v35, 0);
    id v27 = v37;
  }
}

void __106__MSASProtocol_getUploadTokens_forAssetCollectionWithGUID_inAlbumWithGUID_albumURLString_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6) {
    goto LABEL_28;
  }
  uint64_t v9 = [v7 objectForKey:@"contenturl"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = [v8 objectForKey:@"contenturl"];

  if (!v10)
  {
LABEL_6:
    id v11 = 0;
    goto LABEL_7;
  }
  id v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
LABEL_7:
  uint64_t v12 = [v8 objectForKey:@"assetguid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v8 objectForKey:@"assetguid"];

    if (v13)
    {
      uint64_t v14 = [v8 objectForKey:@"contenttokens"];
      objc_opt_class();
      uint32_t v28 = v10;
      id v29 = v8;
      id v27 = (void *)v13;
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = objc_msgSend(v8, "objectForKey:", @"contenttokens", v13);
      }
      else
      {
        uint64_t v15 = 0;
      }

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v40 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        id v19 = MEMORY[0x1E4F14500];
        uint64_t v20 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(v16);
            }
            uint64_t v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            CFStringRef v23 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v22, v27);
            if (v23)
            {
              uint64_t v24 = [v16 objectForKey:v22];
              [v23 setMMCSAccessHeader:v24];
              [v23 setMMCSURL:v11];
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                uint64_t v25 = *(void *)(a1 + 40);
                *(_DWORD *)buf = 138543874;
                uint64_t v35 = v25;
                __int16 v36 = 2114;
                id v37 = v24;
                __int16 v38 = 2114;
                id v39 = v23;
                _os_log_error_impl(&dword_1DC434000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Obtained upload token %{public}@ for asset %{public}@.", buf, 0x20u);
              }
            }
            else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              uint64_t v26 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              uint64_t v35 = v26;
              __int16 v36 = 2114;
              id v37 = v22;
              _os_log_error_impl(&dword_1DC434000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Did not find asset matching hash %{public}@ when requesting upload token.", buf, 0x16u);
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v40 count:16];
        }
        while (v18);
      }

      id v8 = v29;
      id v6 = 0;
      uint64_t v10 = v28;
    }
  }
  else
  {
  }
LABEL_28:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)putAssetCollections:(id)a3 intoAlbum:(id)a4 albumURLString:(id)a5 completionBlock:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v33 = v12;
  if (v12) {
    [MEMORY[0x1E4F1CB10] URLWithString:v12];
  }
  else {
  uint64_t v14 = [(MSASProtocol *)self baseURL];
  }
  uint64_t v15 = (void *)MEMORY[0x1E4F18D50];
  long long v32 = (void *)v14;
  id v16 = [(MSASProtocol *)self _putAssetsURLWithBaseURL:v14];
  long long v31 = [v15 requestWithURL:v16];

  uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v18 = [v11 GUID];
  [v17 setObject:v18 forKey:@"albumguid"];

  id v19 = [v11 clientOrgKey];
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v17 clientOrgKey:v19];

  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v21 = v10;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v40 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = [*(id *)(*((void *)&v39 + 1) + 8 * i) MSASPProtocolDictionary];
        [v20 addObject:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v23);
  }

  [v17 setObject:v20 forKey:@"assets"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = [v21 count];
    *(_DWORD *)buf = 138543874;
    long long v44 = self;
    __int16 v45 = 2048;
    uint64_t v46 = v27;
    __int16 v47 = 2114;
    id v48 = v11;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Sending metadata for %ld photos into album %{public}@.", buf, 0x20u);
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __77__MSASProtocol_putAssetCollections_intoAlbum_albumURLString_completionBlock___block_invoke;
  v34[3] = &unk_1E6C3D6E0;
  id v35 = v21;
  __int16 v36 = self;
  id v37 = v11;
  id v38 = v13;
  id v28 = v13;
  id v29 = v11;
  id v30 = v21;
  [(MSASProtocol *)self sendURLRequest:v31 bodyObj:v17 completionBlock:v34];
}

void __77__MSASProtocol_putAssetCollections_intoAlbum_albumURLString_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = a1;
  id v9 = v7;
  id v10 = v6;
  id v11 = (void *)[*(id *)(a1 + 32) mutableCopy];
  long long v104 = [MEMORY[0x1E4F1CA48] array];
  [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v113 = v112 = a1;
  id v102 = v10;
  long long v103 = v11;
  if (!v10)
  {
    uint64_t v25 = [v9 objectForKey:@"contenturl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v26 = [v9 objectForKey:@"contenturl"];

      if (v26)
      {
        id v101 = (id)v26;
        long long v105 = [MEMORY[0x1E4F1CB10] URLWithString:v26];
        goto LABEL_18;
      }
    }
    else
    {
    }
    id v101 = 0;
    long long v105 = 0;
LABEL_18:
    id v35 = [v9 objectForKey:@"assets"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v36 = [v9 objectForKey:@"assets"];

      if (v36)
      {
        id v100 = v9;
        v111 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
        long long v145 = 0u;
        long long v146 = 0u;
        long long v147 = 0u;
        long long v148 = 0u;
        id v37 = *(id *)(a1 + 32);
        uint64_t v38 = [v37 countByEnumeratingWithState:&v145 objects:v163 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v146;
          do
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v146 != v40) {
                objc_enumerationMutation(v37);
              }
              long long v42 = *(void **)(*((void *)&v145 + 1) + 8 * i);
              id v43 = [v42 GUID];
              [v111 setObject:v42 forKey:v43];
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v145 objects:v163 count:16];
          }
          while (v39);
        }

        long long v143 = 0u;
        long long v144 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        id obj = v36;
        uint64_t v109 = [obj countByEnumeratingWithState:&v141 objects:v162 count:16];
        if (v109)
        {
          uint64_t v108 = *(void *)v142;
          do
          {
            for (uint64_t j = 0; j != v109; ++j)
            {
              if (*(void *)v142 != v108) {
                objc_enumerationMutation(obj);
              }
              __int16 v45 = *(void **)(*((void *)&v141 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v110 = j;
                uint64_t v46 = [v45 objectForKey:@"assetguid"];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  __int16 v52 = v46;
                  uint64_t j = v110;
                  goto LABEL_86;
                }
                uint64_t v47 = [v45 objectForKey:@"assetguid"];

                uint64_t j = v110;
                if (!v47) {
                  continue;
                }
                long long v106 = (void *)v47;
                id v48 = [v111 objectForKey:v47];
                if (!v48) {
                  goto LABEL_85;
                }
                id v49 = [v45 objectForKey:@"success"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v50 = [v45 objectForKey:@"success"];
                  int v51 = [v50 intValue];
                }
                else
                {
                  int v51 = [0 intValue];
                }

                __int16 v115 = v48;
                if (v51)
                {
                  id v53 = [v45 objectForKey:@"pendinguploadid"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v54 = [v45 objectForKey:@"pendinguploadid"];

                    uint64_t v55 = v105;
                    if (v54)
                    {
                      [v48 setMetadataValue:v54 forKey:@"pendingUploadGUID"];
                      id v53 = (void *)v54;
                      goto LABEL_48;
                    }
                  }
                  else
                  {
                    uint64_t v55 = v105;
LABEL_48:
                  }
                  long long v139 = 0u;
                  long long v140 = 0u;
                  long long v137 = 0u;
                  long long v138 = 0u;
                  uint64_t v63 = [v48 assets];
                  uint64_t v64 = [v63 countByEnumeratingWithState:&v137 objects:v161 count:16];
                  if (v64)
                  {
                    uint64_t v65 = v64;
                    uint64_t v66 = *(void *)v138;
                    do
                    {
                      for (uint64_t k = 0; k != v65; ++k)
                      {
                        if (*(void *)v138 != v66) {
                          objc_enumerationMutation(v63);
                        }
                        [*(id *)(*((void *)&v137 + 1) + 8 * k) setMMCSURL:v55];
                      }
                      uint64_t v65 = [v63 countByEnumeratingWithState:&v137 objects:v161 count:16];
                    }
                    while (v65);
                  }

                  id v68 = [v45 objectForKey:@"contenttokens"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v69 = [v45 objectForKey:@"contenttokens"];
                  }
                  else
                  {
                    uint64_t v69 = 0;
                  }

                  long long v135 = 0u;
                  long long v136 = 0u;
                  long long v133 = 0u;
                  long long v134 = 0u;
                  id v70 = v69;
                  id v48 = v115;
                  uint64_t v117 = [v70 countByEnumeratingWithState:&v133 objects:v160 count:16];
                  if (v117)
                  {
                    uint64_t v116 = *(void *)v134;
                    id v114 = v70;
                    do
                    {
                      for (uint64_t m = 0; m != v117; ++m)
                      {
                        if (*(void *)v134 != v116) {
                          objc_enumerationMutation(v70);
                        }
                        id v72 = *(void **)(*((void *)&v133 + 1) + 8 * m);
                        uint64_t v73 = [v70 objectForKey:v72];
                        uint64_t v118 = (uint64_t)v72;
                        id v74 = [v72 MSHexData];
                        long long v129 = 0u;
                        long long v130 = 0u;
                        long long v131 = 0u;
                        long long v132 = 0u;
                        __int16 v75 = [v48 assets];
                        uint64_t v76 = [v75 countByEnumeratingWithState:&v129 objects:v159 count:16];
                        if (!v76)
                        {

LABEL_76:
                          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v84 = *(void *)(v112 + 40);
                            *(_DWORD *)buf = 138543618;
                            uint64_t v152 = v84;
                            __int16 v153 = 2114;
                            uint64_t v154 = v118;
                            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not find matching asset for MMCS hash %{public}@.", buf, 0x16u);
                          }
                          goto LABEL_78;
                        }
                        uint64_t v77 = v76;
                        uint64_t v119 = m;
                        char v78 = 0;
                        uint64_t v79 = *(void *)v130;
                        do
                        {
                          for (uint64_t n = 0; n != v77; ++n)
                          {
                            if (*(void *)v130 != v79) {
                              objc_enumerationMutation(v75);
                            }
                            long long v81 = *(void **)(*((void *)&v129 + 1) + 8 * n);
                            long long v82 = [v81 MMCSHash];
                            int v83 = [v82 isEqualToData:v74];

                            if (v83)
                            {
                              [v81 setMMCSAccessHeader:v73];
                              char v78 = 1;
                            }
                          }
                          uint64_t v77 = [v75 countByEnumeratingWithState:&v129 objects:v159 count:16];
                        }
                        while (v77);

                        id v70 = v114;
                        id v48 = v115;
                        uint64_t m = v119;
                        if ((v78 & 1) == 0) {
                          goto LABEL_76;
                        }
LABEL_78:
                      }
                      uint64_t v117 = [v70 countByEnumeratingWithState:&v133 objects:v160 count:16];
                    }
                    while (v117);
                  }

                  [v104 addObject:v48];
                  id v11 = v103;
LABEL_84:

                  [v11 removeObject:v48];
                  uint64_t j = v110;
LABEL_85:

                  __int16 v52 = v106;
LABEL_86:

                  continue;
                }
                id v56 = [v45 objectForKey:@"reason"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v57 = [v45 objectForKey:@"reason"];
                  char v58 = [v57 isEqual:@"ASSET_ALREADY_EXISTS"];

                  if ((v58 & 1) == 0) {
                    goto LABEL_46;
                  }
LABEL_82:
                  __int16 v86 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v60 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_COLL_ALREADY_EXISTS");
                  uint64_t v61 = v86;
                  uint64_t v62 = 7;
                }
                else
                {
                  int v85 = [0 isEqual:@"ASSET_ALREADY_EXISTS"];

                  if (v85) {
                    goto LABEL_82;
                  }
LABEL_46:
                  uint64_t v59 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v60 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_COLL_REJECTED");
                  uint64_t v61 = v59;
                  uint64_t v62 = 8;
                }
                id v70 = [v61 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:v62 description:v60];

                id v48 = v115;
                [v113 setObject:v70 forKey:v115];
                goto LABEL_84;
              }
            }
            uint64_t v109 = [obj countByEnumeratingWithState:&v141 objects:v162 count:16];
          }
          while (v109);
        }

        id v9 = v100;
      }
    }
    else
    {
    }
    if (![v11 count])
    {
      uint64_t v24 = 0;
      goto LABEL_104;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v95 = *(void *)(v112 + 40);
      uint64_t v96 = [v11 count];
      uint64_t v97 = [*(id *)(v112 + 32) count];
      long long v98 = *(void **)(v112 + 48);
      *(_DWORD *)buf = 138544130;
      uint64_t v152 = v95;
      __int16 v153 = 2048;
      uint64_t v154 = v96;
      __int16 v155 = 2048;
      uint64_t v156 = v97;
      __int16 v157 = 2114;
      v158 = v98;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Server did not respond to %ld assets out of %ld in a putasset request into album %{public}@.", buf, 0x2Au);
    }
    uint64_t v87 = (void *)MEMORY[0x1E4F28C58];
    __int16 v88 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_COLL_IGNORED");
    uint64_t v18 = [v87 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:9 description:v88];

    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id v19 = v11;
    uint64_t v24 = (void *)[v19 countByEnumeratingWithState:&v125 objects:v150 count:16];
    if (v24)
    {
      uint64_t v89 = *(void *)v126;
      do
      {
        for (iuint64_t i = 0; ii != v24; iuint64_t i = (char *)ii + 1)
        {
          if (*(void *)v126 != v89) {
            objc_enumerationMutation(v19);
          }
          [v113 setObject:v18 forKey:*(void *)(*((void *)&v125 + 1) + 8 * (void)ii)];
        }
        uint64_t v24 = (void *)[v19 countByEnumeratingWithState:&v125 objects:v150 count:16];
      }
      while (v24);
    }
LABEL_101:

LABEL_104:
    id v15 = v101;
    id v10 = v102;
LABEL_105:
    uint64_t v8 = v112;
    goto LABEL_106;
  }
  if ([v10 MSContainsErrorWithDomain:*MEMORY[0x1E4F18F50] code:403])
  {
    id v12 = *(void **)(a1 + 40);
    id v124 = 0;
    uint64_t v13 = a1;
    int v14 = [v12 responseDict:v9 containsLimitErrorCode:@"4036" outMaxAllowed:&v124];
    id v15 = v124;
    long long v105 = 0;
    if (!v14)
    {
      uint64_t v24 = v10;
      uint64_t v8 = v13;
      goto LABEL_106;
    }
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = NSString;
    uint64_t v18 = (void *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_LIMIT_PHOTOS_P_COUNT");
    id v101 = v15;
    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "intValue"));
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = objc_msgSend(v17, "stringWithFormat:", v18, v19);
    id v21 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v22 = [*(id *)(v13 + 48) GUID];
    uint64_t v23 = objc_msgSend(v21, "dictionaryWithObjectsAndKeys:", v22, @"albumGUID", 0);
    uint64_t v24 = [v16 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:14 description:v20 underlyingError:v10 additionalUserInfo:v23];

    long long v105 = 0;
    goto LABEL_101;
  }
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v15 = v11;
  uint64_t v27 = [v15 countByEnumeratingWithState:&v120 objects:v149 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    id v99 = v9;
    uint64_t v29 = *(void *)v121;
    do
    {
      for (juint64_t j = 0; jj != v28; ++jj)
      {
        if (*(void *)v121 != v29) {
          objc_enumerationMutation(v15);
        }
        uint64_t v31 = *(void *)(*((void *)&v120 + 1) + 8 * jj);
        long long v32 = (void *)MEMORY[0x1E4F28C58];
        long long v33 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_COLL_REJECTED");
        uint64_t v34 = [v32 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:8 description:v33];

        [v113 setObject:v34 forKey:v31];
      }
      uint64_t v28 = [v15 countByEnumeratingWithState:&v120 objects:v149 count:16];
    }
    while (v28);
    long long v105 = 0;
    id v11 = v103;
    uint64_t v24 = v10;
    id v9 = v99;
    goto LABEL_105;
  }
  long long v105 = 0;
  uint64_t v24 = v10;
LABEL_106:

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v91 = *(void *)(v8 + 40);
    uint64_t v92 = [*(id *)(v8 + 32) count];
    uint64_t v93 = *(void *)(v112 + 48);
    v94 = [v24 MSVerboseDescription];
    *(_DWORD *)buf = 138544130;
    uint64_t v152 = v91;
    __int16 v153 = 2048;
    uint64_t v154 = v92;
    uint64_t v8 = v112;
    __int16 v155 = 2114;
    uint64_t v156 = v93;
    __int16 v157 = 2114;
    v158 = v94;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Finished sending metadata for %ld photos into album %{public}@. Error: %{public}@", buf, 0x2Au);

    id v10 = v102;
  }
  (*(void (**)(void))(*(void *)(v8 + 56) + 16))();
}

- (void)updateAlbum:(id)a3 albumURLString:(id)a4 completionBlock:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9) {
    [MEMORY[0x1E4F1CB10] URLWithString:v9];
  }
  else {
  id v11 = [(MSASProtocol *)self baseURL];
  }
  id v12 = (void *)MEMORY[0x1E4F18D50];
  uint64_t v13 = [(MSASProtocol *)self _updateAlbumURLWithBaseURL:v11];
  int v14 = [v12 requestWithURL:v13];

  id v15 = [v8 metadata];
  id v16 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v17 = [v8 GUID];

  if (v17)
  {
    uint64_t v18 = [v8 GUID];
    [v16 setObject:v18 forKey:@"albumguid"];
  }
  id v19 = [v8 clientOrgKey];
  [(MSASProtocol *)self _setClientOrgKeyForRequestBody:v16 clientOrgKey:v19];

  uint64_t v20 = [v8 ctag];

  if (v20)
  {
    id v21 = [v8 ctag];
    [v16 setObject:v21 forKey:@"albumctag"];
  }
  if (v15) {
    [v16 setValue:v15 forKey:@"attributes"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = self;
    __int16 v27 = 2114;
    id v28 = v8;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Updating album %{public}@", buf, 0x16u);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __59__MSASProtocol_updateAlbum_albumURLString_completionBlock___block_invoke;
  v23[3] = &unk_1E6C3D820;
  void v23[4] = self;
  id v24 = v10;
  id v22 = v10;
  [(MSASProtocol *)self sendURLRequest:v14 bodyObj:v16 completionBlock:v23];
}

void __59__MSASProtocol_updateAlbum_albumURLString_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v4 MSVerboseDescription];
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Finished updating album. Error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)createAlbum:(id)a3 completionBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F18D50];
  __int16 v9 = [(MSASProtocol *)self _createAlbumURL];
  id v10 = [v8 requestWithURL:v9];

  uint64_t v11 = [v6 metadata];
  id v12 = [v11 objectForKey:@"name"];
  uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
  int v14 = [v6 GUID];

  if (v14)
  {
    id v15 = [v6 GUID];
    [v13 setObject:v15 forKey:@"albumguid"];
  }
  if (v11) {
    [v13 setValue:v11 forKey:@"attributes"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = self;
    __int16 v26 = 2114;
    id v27 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Creating album %{public}@", buf, 0x16u);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __44__MSASProtocol_createAlbum_completionBlock___block_invoke;
  v19[3] = &unk_1E6C3D6E0;
  id v20 = v6;
  id v21 = v12;
  id v22 = self;
  id v23 = v7;
  id v16 = v7;
  id v17 = v12;
  id v18 = v6;
  [(MSASProtocol *)self sendURLRequest:v10 bodyObj:v13 completionBlock:v19];
}

void __44__MSASProtocol_createAlbum_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__7582;
  v42[4] = __Block_byref_object_dispose__7583;
  id v43 = 0;
  id v10 = v8;
  if (v10)
  {
    uint64_t v11 = v10;
    if (![v10 MSContainsErrorWithDomain:*MEMORY[0x1E4F18F50] code:403])
    {
      id v21 = 0;
      id v22 = v11;
      goto LABEL_20;
    }
    id v12 = *(void **)(a1 + 48);
    id v40 = 0;
    int v13 = [v12 responseDict:v9 containsLimitErrorCode:@"4032" outMaxAllowed:&v40];
    id v14 = v40;
    if (!v13)
    {
      id v21 = 0;
      id v22 = v11;
      goto LABEL_19;
    }
    id v15 = (void *)MEMORY[0x1E4F28C58];
    id v16 = NSString;
    id v17 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_LIMIT_ALBUMS_P_COUNT");
    id v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "intValue"));
    id v19 = objc_msgSend(v16, "stringWithFormat:", v17, v18);
    id v20 = [v15 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:13 description:v19 underlyingError:v11];

    id v21 = 0;
    id v22 = v11;
  }
  else
  {
    id v23 = [v9 objectForKey:@"albumguid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [v9 objectForKey:@"albumguid"];
    }
    else
    {
      id v14 = 0;
    }

    id v24 = [*(id *)(a1 + 32) GUID];
    char v25 = [v14 isEqualToString:v24];

    if (v25)
    {
      __int16 v26 = [v9 objectForKey:@"albumctag"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = [v9 objectForKey:@"albumctag"];
      }
      else
      {
        id v21 = 0;
      }

      if (!_os_feature_enabled_impl()
        || ([*(id *)(a1 + 32) clientOrgKey],
            id v30 = objc_claimAutoreleasedReturnValue(),
            BOOL v31 = v30 == 0,
            v30,
            !v31))
      {
        uint64_t v11 = 0;
        id v22 = 0;
        goto LABEL_19;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v36 = v9;
      }
      else {
        __int16 v36 = 0;
      }
      id v17 = v36;
      uint64_t v37 = [*(id *)(a1 + 32) useForeignCtag] ^ 1;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      __int16 v45 = __Block_byref_object_copy__7582;
      uint64_t v46 = __Block_byref_object_dispose__7583;
      id v47 = 0;
      uint64_t v38 = *(void **)(a1 + 48);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __44__MSASProtocol_createAlbum_completionBlock___block_invoke_2;
      v41[3] = &unk_1E6C3D6B8;
      v41[4] = buf;
      v41[5] = v42;
      [v38 _fetchClientOrgKeyAndPersistLocallyForResponseDict:v17 isOwned:v37 completionHandler:v41];
      id v20 = *(void **)(*(void *)&buf[8] + 40);
      if (v20) {
        id v39 = v20;
      }
      _Block_object_dispose(buf, 8);

      id v22 = 0;
    }
    else
    {
      id v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = NSString;
      id v17 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_CANNOT_CREATE_ALBUM");
      uint64_t v29 = objc_msgSend(v28, "stringWithFormat:", v17, *(void *)(a1 + 40));
      id v22 = [v27 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:5 description:v29];

      id v20 = 0;
      id v21 = 0;
    }
  }

  uint64_t v11 = v20;
LABEL_19:

LABEL_20:
  long long v32 = MEMORY[0x1E4F14500];
  id v33 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    uint64_t v34 = *(void *)(a1 + 48);
    id v35 = [v22 MSVerboseDescription];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v34;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v35;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Finished creating album. Error: %{public}@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  _Block_object_dispose(v42, 8);
}

void __44__MSASProtocol_createAlbum_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_getAlbumURL
{
  v2 = [(MSASProtocol *)self baseURL];
  id v3 = [v2 URLByAppendingPathComponent:@"albumurl"];

  return v3;
}

- (id)_serverSideConfigURL
{
  v2 = [(MSASProtocol *)self baseURL];
  id v3 = [v2 URLByAppendingPathComponent:@"configuration"];

  return v3;
}

- (id)_setAlbumStateURL
{
  v2 = [(MSASProtocol *)self baseURL];
  id v3 = [v2 URLByAppendingPathComponent:@"setalbumstate"];

  return v3;
}

- (id)_setAssetStateURL
{
  v2 = [(MSASProtocol *)self baseURL];
  id v3 = [v2 URLByAppendingPathComponent:@"setassetstate"];

  return v3;
}

- (id)_albumStateURL
{
  v2 = [(MSASProtocol *)self baseURL];
  id v3 = [v2 URLByAppendingPathComponent:@"albumstate"];

  return v3;
}

- (id)_setCommentPositionURL
{
  v2 = [(MSASProtocol *)self baseURL];
  id v3 = [v2 URLByAppendingPathComponent:@"setcommentposition"];

  return v3;
}

- (id)_getCommentsURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"getcomments"];
}

- (id)_reportSpamURL
{
  v2 = [(MSASProtocol *)self baseURL];
  id v3 = [v2 URLByAppendingPathComponent:@"reportspam"];

  return v3;
}

- (id)_unsubscribeURL
{
  v2 = [(MSASProtocol *)self baseURL];
  id v3 = [v2 URLByAppendingPathComponent:@"unsubscribe"];

  return v3;
}

- (id)_subscribeURL
{
  v2 = [(MSASProtocol *)self baseURL];
  id v3 = [v2 URLByAppendingPathComponent:@"subscribe"];

  return v3;
}

- (id)_validateInvitationURL
{
  v2 = [(MSASProtocol *)self baseURL];
  id v3 = [v2 URLByAppendingPathComponent:@"validateinvitation"];

  return v3;
}

- (id)_getTokensURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"gettokens"];
}

- (id)_getAssetsURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"getassets"];
}

- (id)_albumSummaryURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"albumsummary"];
}

- (id)_sharingInfoURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"sharinginfo"];
}

- (id)_getChangesURL
{
  v2 = [(MSASProtocol *)self baseURL];
  id v3 = [v2 URLByAppendingPathComponent:@"getchanges"];

  return v3;
}

- (id)_deleteCommentURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"deletecomment"];
}

- (id)_deleteAssetsURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"deleteassets"];
}

- (id)_deleteURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"deletealbum"];
}

- (id)_enableMultipleContributorsURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"setallowcontributions"];
}

- (id)_enablePublicAccessURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"setalbumpublic"];
}

- (id)_addCommentURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"addcomment"];
}

- (id)_unshareURL
{
  v2 = [(MSASProtocol *)self baseURL];
  id v3 = [v2 URLByAppendingPathComponent:@"unshare"];

  return v3;
}

- (id)_shareURL
{
  v2 = [(MSASProtocol *)self baseURL];
  id v3 = [v2 URLByAppendingPathComponent:@"share"];

  return v3;
}

- (id)_uploadCompleteURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"uploadcomplete"];
}

- (id)_getVideoURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"getvideourl"];
}

- (id)_getUploadTokensURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"getuploadtokens"];
}

- (id)_putAssetsURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"putassets"];
}

- (id)_updateAlbumURLWithBaseURL:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"updatealbum"];
}

- (id)_createAlbumURL
{
  v2 = [(MSASProtocol *)self baseURL];
  id v3 = [v2 URLByAppendingPathComponent:@"createalbum"];

  return v3;
}

- (id)errorFromStandardProcessingOnResponse:(id)a3 responseObject:(id)a4 checkServerSideConfigVersion:(BOOL)a5 error:(id)a6 body:(id)a7
{
  BOOL v9 = a5;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = v14;
  if (!v11)
  {
    id v24 = v13;
    goto LABEL_61;
  }
  id v57 = v14;
  [v11 allHeaderFields];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = (void *)[v16 countByEnumeratingWithState:&v63 objects:v74 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v64;
    while (2)
    {
      for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v64 != v18) {
          objc_enumerationMutation(v16);
        }
        id v20 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        if (![v20 caseInsensitiveCompare:@"Retry-After"])
        {
          id v21 = [v16 objectForKey:v20];
          id v17 = +[MSProtocolUtilities retryAfterDateBasedOnRetryAfterHeaderString:v21];

          goto LABEL_12;
        }
      }
      id v17 = (void *)[v16 countByEnumeratingWithState:&v63 objects:v74 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  id v22 = self;
  if ([v11 statusCode] != 200 && objc_msgSend(v11, "statusCode") != 207)
  {
    id v56 = v17;
    if ([v11 statusCode] == 403)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v28 = [v12 objectForKey:@"code"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = [v12 objectForKey:@"code"];
        }
        else
        {
          id v23 = 0;
        }

        if ((unint64_t)[v23 length] >= 4)
        {
          uint64_t v38 = [v23 substringToIndex:3];
          int v39 = [v38 isEqualToString:@"401"];

          if (v39)
          {
            id v22 = self;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v68 = self;
              _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Visitor authentication has failed. Client must reauth.", buf, 0xCu);
            }
            id v40 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v29 = (void *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_VISITOR_AUTH_FAILURE");
            long long v41 = -[MSASProtocol HTTPErrorWithStatusCode:](self, "HTTPErrorWithStatusCode:", [v11 statusCode]);
            id v24 = [v40 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:18 description:v29 underlyingError:v41];

LABEL_52:
            id v17 = v56;
LABEL_53:

            goto LABEL_54;
          }
        }
      }
    }
    else if ([v11 statusCode] == 426 && _os_feature_enabled_impl())
    {
      id v22 = self;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v68 = self;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Invalid/missing clientOrgKey in request. Client must fetch new clientOrgKey for album.", buf, 0xCu);
      }
      uint64_t v37 = (void *)MEMORY[0x1E4F28C58];
      id v23 = (id)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_INVALID_CLIENTORGKEY");
      uint64_t v29 = -[MSASProtocol HTTPErrorWithStatusCode:](self, "HTTPErrorWithStatusCode:", [v11 statusCode]);
      id v24 = [v37 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:22 description:v23 underlyingError:v29];
      goto LABEL_52;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v55 = [v11 statusCode];
      *(_DWORD *)buf = 138543618;
      id v68 = self;
      __int16 v69 = 2048;
      uint64_t v70 = v55;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Rejecting response code %ld", buf, 0x16u);
    }
    long long v42 = (void *)MEMORY[0x1E4F28C58];
    id v43 = NSString;
    long long v44 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_HTTP_ERROR_P_CODE");
    __int16 v45 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "statusCode"));
    uint64_t v46 = objc_msgSend(v43, "stringWithFormat:", v44, v45);
    id v47 = -[MSASProtocol HTTPErrorWithStatusCode:](self, "HTTPErrorWithStatusCode:", [v11 statusCode]);
    id v23 = [v42 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:4 description:v46 underlyingError:v47];

    id v22 = self;
    uint64_t v48 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = (void *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_CANNOT_CONTINUE");
    id v24 = [v48 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:3 description:v29 underlyingError:v23];
    goto LABEL_52;
  }
  if (v9)
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v23 = v16;
    id v24 = (id)[v23 countByEnumeratingWithState:&v59 objects:v73 count:16];
    if (v24)
    {
      id v56 = v17;
      uint64_t v25 = *(void *)v60;
      while (2)
      {
        for (uint64_t j = 0; j != v24; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v60 != v25) {
            objc_enumerationMutation(v23);
          }
          id v27 = *(void **)(*((void *)&v59 + 1) + 8 * (void)j);
          if (![v27 caseInsensitiveCompare:@"x-apple-mme-sharedstreams-config-version"])
          {
            uint64_t v29 = [v23 objectForKey:v27];
            id v22 = self;
            id v30 = [(MSASProtocol *)self serverSideConfigVersion];
            char v31 = [v30 isEqualToString:v29];

            if ((v31 & 1) == 0)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v68 = self;
                _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Server side config version has changed.", buf, 0xCu);
              }
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                long long v32 = [(MSASProtocol *)self serverSideConfigVersion];
                *(_DWORD *)buf = 138543874;
                id v68 = self;
                __int16 v69 = 2114;
                uint64_t v70 = (uint64_t)v32;
                __int16 v71 = 2114;
                id v72 = v29;
                _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Our version string: %{public}@, server’s version string: %{public}@", buf, 0x20u);
              }
              id v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
              uint64_t v34 = (void *)MEMORY[0x1E4F1C9E8];
              id v35 = [(MSASProtocol *)self personID];
              __int16 v36 = objc_msgSend(v34, "dictionaryWithObjectsAndKeys:", v35, @"personID", 0);
              [v33 postNotificationName:@"MSASPServerSideConfigurationDidChangeNotification" object:self userInfo:v36];
            }
            id v24 = 0;
            goto LABEL_52;
          }
        }
        id v24 = (id)[v23 countByEnumeratingWithState:&v59 objects:v73 count:16];
        if (v24) {
          continue;
        }
        break;
      }
      id v22 = self;
    }
    goto LABEL_53;
  }
  id v24 = 0;
LABEL_54:

  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v49 = [(MSASProtocol *)v22 personID];
      *(_DWORD *)buf = 138543874;
      id v68 = v22;
      __int16 v69 = 2114;
      uint64_t v70 = (uint64_t)v17;
      __int16 v71 = 2112;
      id v72 = v49;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Posting retry-after date of %{public}@ for person ID %@.", buf, 0x20u);
    }
    uint64_t v50 = [MEMORY[0x1E4F1CA60] dictionary];
    int v51 = [(MSASProtocol *)v22 personID];

    if (v51)
    {
      __int16 v52 = [(MSASProtocol *)v22 personID];
      [v50 setObject:v52 forKey:@"personID"];
    }
    [v50 setObject:v17 forKey:@"retryAfterDate"];
    id v53 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v53 postNotificationName:@"MSASPDidReceiveRetryAfterNotification" object:v22 userInfo:v50];
  }
  id v15 = v57;
LABEL_61:

  return v24;
}

- (id)HTTPErrorWithStatusCode:(int64_t)a3
{
  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F18F50];
  uint64_t v6 = NSString;
  id v7 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_HTTP_ERROR_P_CODE");
  id v8 = [NSNumber numberWithInteger:a3];
  BOOL v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8);
  id v10 = [v4 MSErrorWithDomain:v5 code:a3 description:v9];

  return v10;
}

- (void)_prepareHeadersForRequest:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = +[MSProtocolUtilities deviceInfoDictForPersonID:self->_personID];
  [v5 setObject:self->_headerVersion forKey:@"x-apple-mme-sharedstreams-version"];
  id v7 = [v6 objectForKey:@"pushToken"];
  id v8 = v7;
  if (v7)
  {
    BOOL v9 = [v7 MSHexString];
    [v5 setObject:v9 forKey:@"x-apple-mme-sharedstreams-client-token"];
  }
  id v10 = [v6 objectForKey:@"authToken"];
  if (v10)
  {
    id v11 = v8;
    id v12 = v10;
    id v13 = [NSString stringWithFormat:@"%@:%@", self->_personID, v10];
    CFDataRef v14 = [v13 dataUsingEncoding:4];
    id v15 = (__CFString *)MSPCUCreateBase64StringFromData(v14);
    if (v15)
    {
      id v16 = [NSString stringWithFormat:@"X-MobileMe-AuthToken %@", v15];
      [v5 setObject:v16 forKey:@"authorization"];
    }
    id v8 = v11;
    id v10 = v12;
  }
  id v17 = [v6 objectForKey:@"clientInfo"];
  if (v17) {
    [v5 setObject:v17 forKey:@"x-mme-client-info"];
  }
  [v5 setObject:@"text/plist" forKey:@"Content-Type"];
  uint64_t v18 = +[MSProtocolUtilities appleIDSession];
  id v19 = [v18 appleIDHeadersForRequest:v4];

  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __42__MSASProtocol__prepareHeadersForRequest___block_invoke;
  v45[3] = &unk_1E6C3D688;
  id v20 = v5;
  id v46 = v20;
  [v19 enumerateKeysAndObjectsUsingBlock:v45];
  [v4 setAllHTTPHeaderFields:v20];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v21 = [v4 URL];
    *(_DWORD *)buf = 138543618;
    id v49 = self;
    __int16 v50 = 2114;
    int v51 = v21;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Sending request to %{public}@.", buf, 0x16u);
  }
  id v22 = MSASPlatform();
  int v23 = [v22 shouldLogAtLevel:7];

  if (v23)
  {
    __int16 v36 = v19;
    uint64_t v37 = v17;
    uint64_t v38 = v10;
    int v39 = v8;
    id v40 = v4;
    id v24 = [v4 allHTTPHeaderFields];
    uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v26 = v24;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(v26);
          }
          char v31 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if ([v31 compare:@"x-apple-mme-sharedstreams-client-token" options:1]
            && [v31 compare:@"x-apple-mme-streams-client-udid" options:1]
            && [v31 compare:@"authorization" options:1])
          {
            long long v32 = [v26 objectForKey:v31];
          }
          else
          {
            long long v32 = @"[present]";
          }
          [(MSASProtocol *)v25 setObject:v32 forKey:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v28);
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v49 = v25;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Headers: %{public}@", buf, 0xCu);
    }
    id v33 = [NSString alloc];
    id v4 = v40;
    uint64_t v34 = [v40 HTTPBody];
    id v35 = (MSASProtocol *)[v33 initWithData:v34 encoding:4];

    id v17 = v37;
    id v10 = v38;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v49 = v35;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }

    id v8 = v39;
    id v19 = v36;
  }
}

uint64_t __42__MSASProtocol__prepareHeadersForRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

- (void)_sendOneURLRequest:(id)a3 checkServerSideConfigVersion:(BOOL)a4 retryCount:(unint64_t)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(MSASProtocol *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_barrier_sync(v12, block);

  [(MSASProtocol *)self _prepareHeadersForRequest:v10];
  id v13 = (void *)MEMORY[0x1E4F18D80];
  id v14 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_2;
  v17[3] = &unk_1E6C3D648;
  void v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  unint64_t v20 = a5;
  BOOL v21 = a4;
  id v15 = v10;
  id v16 = v11;
  [v13 sendAsynchronousRequest:v15 queue:v14 completionHandler:v17];
}

void __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = +[MSASPConnectionGate gate];
  [*(id *)(a1 + 32) setGate:v2];
}

void __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v7;
  uint64_t v68 = 0;
  __int16 v69 = &v68;
  uint64_t v70 = 0x3032000000;
  __int16 v71 = __Block_byref_object_copy__7582;
  id v72 = __Block_byref_object_dispose__7583;
  id v73 = 0;
  id v11 = [*(id *)(a1 + 32) memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_211;
  block[3] = &unk_1E6C3DA60;
  block[4] = *(void *)(a1 + 32);
  void block[5] = &v68;
  dispatch_barrier_sync(v11, block);

  id v12 = [(id)v69[5] error];

  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v46 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v75 = v46;
      __int16 v76 = 2114;
      uint64_t v77 = (uint64_t)v9;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Transaction terminated with error: %{public}@", buf, 0x16u);
    }
    id v13 = [*(id *)(a1 + 32) workQueue];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_212;
    v64[3] = &unk_1E6C3D5F8;
    id v65 = *(id *)(a1 + 48);
    long long v66 = &v68;
    dispatch_async(v13, v64);
  }
  else
  {
    id v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v47 = *(void **)(a1 + 32);
      uint64_t v48 = [v10 statusCode];
      *(_DWORD *)buf = 138543618;
      uint64_t v75 = v47;
      __int16 v76 = 2048;
      uint64_t v77 = v48;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Received response code %ld", buf, 0x16u);
    }

    id v16 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v49 = *(void **)(a1 + 32);
      __int16 v50 = [v10 allHeaderFields];
      *(_DWORD *)buf = 138543618;
      uint64_t v75 = v49;
      __int16 v76 = 2112;
      uint64_t v77 = (uint64_t)v50;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Headers: %@", buf, 0x16u);
    }
    if ([v8 length])
    {
      id v18 = MSASPlatform();
      int v19 = [v18 shouldLogAtLevel:7];

      if (v19)
      {
        unint64_t v20 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v75 = v20;
          _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    char v63 = 0;
    BOOL v21 = +[MSProtocolUtilities appleIDSession];
    [v21 handleResponse:v10 forRequest:*(void *)(a1 + 40) shouldRetry:&v63];

    if (v63 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v22 = *(void **)(a1 + 32);
      uint64_t v23 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v75 = v22;
      __int16 v76 = 2112;
      uint64_t v77 = v23;
      __int16 v78 = 2112;
      id v79 = v10;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Will retry request %@ with response %@ due to AuthKit error", buf, 0x20u);
    }
    if ([v10 statusCode] == 330)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        id v24 = *(void **)(a1 + 32);
        uint64_t v25 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v75 = v24;
        __int16 v76 = 2112;
        uint64_t v77 = v25;
        __int16 v78 = 2112;
        id v79 = v10;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Will retry request %@ with response %@ due to partition move", buf, 0x20u);
      }
      id v26 = [v10 allHeaderFields];
      uint64_t v27 = [v26 objectForKey:@"X-Apple-MMe-Host"];
      uint64_t v28 = v27;
      if (v27 && [v27 length])
      {
        uint64_t v54 = [*(id *)(a1 + 40) URL];
        id v29 = objc_alloc(MEMORY[0x1E4F1CB10]);
        id v30 = [v54 scheme];
        char v31 = [v54 path];
        id v53 = (void *)[v29 initWithScheme:v30 host:v28 path:v31];

        [*(id *)(a1 + 40) setURL:v53];
        id v32 = objc_alloc(MEMORY[0x1E4F1CB10]);
        id v33 = [v54 scheme];
        uint64_t v34 = (void *)[v32 initWithScheme:v33 host:v28 path:@"/"];

        id v35 = [*(id *)(a1 + 32) personID];
        __int16 v36 = [v34 URLByAppendingPathComponent:v35];
        uint64_t v37 = [v36 URLByAppendingPathComponent:@"sharedstreams"];

        if (v37) {
          [*(id *)(a1 + 32) setBaseURL:v37];
        }
        char v63 = 1;
      }
    }
    if (v63)
    {
      unint64_t v38 = *(void *)(a1 + 56);
      if (v38 > 9)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          int v51 = *(void **)(a1 + 32);
          uint64_t v52 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          uint64_t v75 = v51;
          __int16 v76 = 2112;
          uint64_t v77 = v52;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Exceeded max retry attempts for request %@, giving up", buf, 0x16u);
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int v39 = *(void **)(a1 + 32);
          uint64_t v40 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          uint64_t v75 = v39;
          __int16 v76 = 2112;
          uint64_t v77 = v40;
          _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Retrying request %@", buf, 0x16u);
          unint64_t v38 = *(void *)(a1 + 56);
        }
        [*(id *)(a1 + 32) _sendOneURLRequest:*(void *)(a1 + 40) checkServerSideConfigVersion:*(unsigned __int8 *)(a1 + 64) retryCount:v38 + 1 completionBlock:*(void *)(a1 + 48)];
      }
    }
    else
    {
      if (v8)
      {
        id v62 = 0;
        long long v41 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:&v62];
        id v42 = v62;
        if (v42 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          long long v43 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v75 = v43;
          __int16 v76 = 2114;
          uint64_t v77 = (uint64_t)v42;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Cannot unserialize server's response. Error: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        id v42 = 0;
        long long v41 = 0;
      }
      long long v44 = [*(id *)(a1 + 32) workQueue];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_221;
      v55[3] = &unk_1E6C3D620;
      v55[4] = *(void *)(a1 + 32);
      id v56 = v10;
      id v57 = v41;
      char v61 = *(unsigned char *)(a1 + 64);
      id v58 = v9;
      id v60 = *(id *)(a1 + 48);
      id v59 = v56;
      id v45 = v41;
      dispatch_async(v44, v55);
    }
  }
  _Block_object_dispose(&v68, 8);
}

uint64_t __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_211(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) gate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 setGate:0];
}

void __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_212(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error];
  (*(void (**)(uint64_t, void, id, void))(v1 + 16))(v1, 0, v2, 0);
}

void __91__MSASProtocol__sendOneURLRequest_checkServerSideConfigVersion_retryCount_completionBlock___block_invoke_221(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) errorFromStandardProcessingOnResponse:*(void *)(a1 + 40) responseObject:*(void *)(a1 + 48) checkServerSideConfigVersion:*(unsigned __int8 *)(a1 + 80) error:*(void *)(a1 + 56) body:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
}

- (void)sendURLRequest:(id)a3 method:(id)a4 bodyObj:(id)a5 checkServerSideConfigVersion:(BOOL)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  pendingConnectionsQueue = self->_pendingConnectionsQueue;
  pendingConnectionsGroup = self->_pendingConnectionsGroup;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke;
  v22[3] = &unk_1E6C3D5D0;
  id v25 = v13;
  id v26 = v15;
  v22[4] = self;
  id v23 = v14;
  id v24 = v12;
  BOOL v27 = a6;
  id v18 = v13;
  id v19 = v12;
  id v20 = v14;
  id v21 = v15;
  dispatch_group_async(pendingConnectionsGroup, pendingConnectionsQueue, v22);
}

void __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  id v2 = [*(id *)(a1 + 32) memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke_2;
  block[3] = &unk_1E6C3DA60;
  block[4] = *(void *)(a1 + 32);
  void block[5] = &v24;
  dispatch_sync(v2, block);

  if (!*((unsigned char *)v25 + 24))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      id v20 = 0;
      uint64_t v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:100 options:0 error:&v20];
      id v8 = v20;
      if (v8)
      {
        id v9 = v8;
        id v10 = MEMORY[0x1E4F14500];
        id v11 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          id v16 = [v9 MSVerboseDescription];
          *(_DWORD *)buf = 138543618;
          uint64_t v29 = v15;
          __int16 v30 = 2114;
          char v31 = v16;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Cannot encode object to send to server. Error: %{public}@", buf, 0x16u);
        }
        id v12 = [*(id *)(a1 + 32) workQueue];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke_205;
        v17[3] = &unk_1E6C3DB00;
        id v13 = *(id *)(a1 + 64);
        id v18 = v9;
        id v19 = v13;
        id v14 = v9;
        dispatch_async(v12, v17);

        goto LABEL_5;
      }
      [*(id *)(a1 + 48) setHTTPBody:v6];
    }
    [*(id *)(a1 + 48) setHTTPMethod:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) _sendOneURLRequest:*(void *)(a1 + 48) checkServerSideConfigVersion:*(unsigned __int8 *)(a1 + 72) retryCount:0 completionBlock:*(void *)(a1 + 64)];
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Not making request because we're shutting down.", buf, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) workQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke_203;
  v21[3] = &unk_1E6C3DB00;
  id v5 = *(id *)(a1 + 64);
  void v21[4] = *(void *)(a1 + 32);
  id v22 = v5;
  dispatch_async(v4, v21);

  uint64_t v6 = v22;
LABEL_5:

LABEL_13:
  _Block_object_dispose(&v24, 8);
}

uint64_t __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) gate];
  if (objc_claimAutoreleasedReturnValue()) {
    __assert_rtn("-[MSASProtocol sendURLRequest:method:bodyObj:checkServerSideConfigVersion:completionBlock:]_block_invoke_2", "MSASProtocol.m", 676, "!self.gate");
  }
  uint64_t result = [*(id *)(a1 + 32) isShuttingDown];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke_203(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) shutDownError];
  (*(void (**)(uint64_t, void, id, void))(v1 + 16))(v1, 0, v2, 0);
}

void __91__MSASProtocol_sendURLRequest_method_bodyObj_checkServerSideConfigVersion_completionBlock___block_invoke_205(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  id v5 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_CANNOT_ENCODE");
  id v4 = [v3 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:2 description:v5 underlyingError:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void, void *, void))(v2 + 16))(v2, 0, v4, 0);
}

- (void)sendURLRequest:(id)a3 bodyObj:(id)a4 completionBlock:(id)a5
{
}

- (id)stopHandlerBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__MSASProtocol_stopHandlerBlock__block_invoke;
  v4[3] = &unk_1E6C3D5A8;
  v4[4] = self;
  uint64_t v2 = (void *)MEMORY[0x1E019E5F0](v4, a2);
  return v2;
}

void __32__MSASProtocol_stopHandlerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__MSASProtocol_stopHandlerBlock__block_invoke_2;
  v6[3] = &unk_1E6C3DB28;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_barrier_async(v4, v6);
}

void __32__MSASProtocol_stopHandlerBlock__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) gate];
  [v2 setError:v1];
}

- (void)stopCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASProtocol *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MSASProtocol_stopCompletionBlock___block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_barrier_async(v5, block);

  uint64_t v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__MSASProtocol_stopCompletionBlock___block_invoke_2;
  v8[3] = &unk_1E6C3DB00;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __36__MSASProtocol_stopCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsShuttingDown:1];
  id v3 = [*(id *)(a1 + 32) stoppingError];
  id v2 = [*(id *)(a1 + 32) gate];
  [v2 setError:v3];
}

uint64_t __36__MSASProtocol_stopCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v2, v3);
  [*(id *)(a1 + 32) setIsShuttingDown:0];
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASProtocol *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MSASProtocol_shutDownCompletionBlock___block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_barrier_async(v5, block);

  uint64_t v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__MSASProtocol_shutDownCompletionBlock___block_invoke_2;
  v8[3] = &unk_1E6C3DB00;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __40__MSASProtocol_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsShuttingDown:1];
  id v3 = [*(id *)(a1 + 32) shutDownError];
  id v2 = [*(id *)(a1 + 32) gate];
  [v2 setError:v3];
}

uint64_t __40__MSASProtocol_shutDownCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v2, v3);
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (id)stoppingError
{
  if (stoppingError_onceToken != -1) {
    dispatch_once(&stoppingError_onceToken, &__block_literal_global_193);
  }
  id v2 = (void *)stoppingError_error;
  return v2;
}

void __29__MSASProtocol_stoppingError__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  dispatch_time_t v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_STOPPING");
  uint64_t v1 = [v0 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:1 description:v3];
  id v2 = (void *)stoppingError_error;
  stoppingError_error = v1;
}

- (id)shutDownError
{
  if (shutDownError_onceToken != -1) {
    dispatch_once(&shutDownError_onceToken, &__block_literal_global_7926);
  }
  id v2 = (void *)shutDownError_error;
  return v2;
}

void __29__MSASProtocol_shutDownError__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  dispatch_time_t v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_PROT_SHUTTING_DOWN");
  uint64_t v1 = [v0 MSErrorWithDomain:@"MSASProtocolErrorDomain" code:0 description:v3];
  id v2 = (void *)shutDownError_error;
  shutDownError_error = v1;
}

- (MSASProtocol)initWithPersonID:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MSASProtocol;
  uint64_t v6 = [(MSASProtocol *)&v25 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_personID, a3);
    id v8 = MSASPlatform();
    uint64_t v9 = [v8 baseSharingURLForPersonID:v5];
    baseURL = v7->_baseURL;
    v7->_baseURL = (NSURL *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("MSASProtocol connections queue", 0);
    pendingConnectionsQueue = v7->_pendingConnectionsQueue;
    v7->_pendingConnectionsQueue = (OS_dispatch_queue *)v11;

    dispatch_set_target_queue((dispatch_object_t)v7->_pendingConnectionsQueue, MEMORY[0x1E4F14428]);
    dispatch_queue_t v13 = dispatch_queue_create("MSASProtocol work queue", 0);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("MSASProtocol member queue", MEMORY[0x1E4F14430]);
    memberQueue = v7->_memberQueue;
    v7->_memberQueue = (OS_dispatch_queue *)v15;

    dispatch_group_t v17 = dispatch_group_create();
    pendingConnectionsGroup = v7->_pendingConnectionsGroup;
    v7->_pendingConnectionsGroup = (OS_dispatch_group *)v17;

    id v19 = MSASPlatform();
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      id v21 = MSASPlatform();
      uint64_t v22 = [v21 sharedStreamsProtocolVersionString];
      headerVersiouint64_t n = v7->_headerVersion;
      v7->_headerVersiouint64_t n = (NSString *)v22;
    }
    if (!v7->_headerVersion) {
      v7->_headerVersiouint64_t n = (NSString *)@"6oWcrYvjLx0f";
    }
  }

  return v7;
}

@end