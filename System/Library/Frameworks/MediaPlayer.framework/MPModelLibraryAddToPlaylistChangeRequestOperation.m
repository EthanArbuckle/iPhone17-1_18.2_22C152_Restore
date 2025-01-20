@interface MPModelLibraryAddToPlaylistChangeRequestOperation
- (BOOL)_isCloudLibraryEnabled;
- (MPModelLibraryAddToPlaylistChangeRequest)request;
- (id)responseHandler;
- (void)_updateCloudLibraryForPlaylist:(id)a3 withAddedItems:(id)a4 completion:(id)a5;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryAddToPlaylistChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_itemEntryProperties, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibraryAddToPlaylistChangeRequest)request
{
  return self->_request;
}

- (BOOL)_isCloudLibraryEnabled
{
  v2 = [(MPAsyncOperation *)self userIdentity];
  v3 = +[MPCloudController controllerWithUserIdentity:v2];
  char v4 = [v3 isCloudLibraryEnabled];

  return v4;
}

- (void)_updateCloudLibraryForPlaylist:(id)a3 withAddedItems:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v54 = a5;
  v10 = [(MPModelLibraryAddToPlaylistChangeRequest *)self->_request representativeModelObject];
  v11 = [v10 identifiers];
  v12 = [v11 library];
  uint64_t v13 = [v12 persistentID];

  v14 = [v11 personalizedStore];
  uint64_t v15 = [v14 cloudID];

  v16 = [v11 universalStore];
  uint64_t v17 = [v16 purchasedAdamID];
  if (!v17)
  {
    v18 = v10;
    v19 = [v11 universalStore];
    uint64_t v17 = [v19 adamID];
    if (!v17)
    {
      [v11 universalStore];
      uint64_t v51 = v13;
      v21 = id v20 = v9;
      uint64_t v17 = [v21 subscriptionAdamID];

      id v9 = v20;
      uint64_t v13 = v51;
    }

    v10 = v18;
  }
  v52 = v11;

  objc_opt_class();
  LOBYTE(v11) = objc_opt_isKindOfClass();
  v53 = v10;
  if ([v9 count] == 1)
  {
    uint64_t v22 = v13;
    id v48 = v8;
    id v49 = v9;
    v23 = [v9 firstObject];
    uint64_t v24 = [v23 persistentID];
    v25 = [v23 valueForProperty:@"subscriptionStoreItemAdamID"];
    uint64_t v26 = [v25 unsignedLongLongValue];

    if (!v26)
    {
      v27 = [v23 valueForProperty:@"storeItemAdamID"];
      uint64_t v26 = [v27 unsignedLongLongValue];
    }
    v28 = [v23 valueForProperty:@"storeSagaID"];
    uint64_t v29 = [v28 unsignedLongLongValue];

    if (v24) {
      BOOL v30 = v22 == 0;
    }
    else {
      BOOL v30 = 0;
    }
    if (v30) {
      uint64_t v13 = v24;
    }
    else {
      uint64_t v13 = v22;
    }
    if (v15)
    {
      id v9 = v49;
    }
    else
    {
      id v9 = v49;
      if (v29)
      {
        if ([v23 mediaType]) {
          LOBYTE(v11) = 1;
        }
        else {
          v11 = (void *)(((unint64_t)[v23 mediaType] >> 11) & 1);
        }
        uint64_t v15 = v29;
      }
    }
    if (v26) {
      BOOL v31 = v17 == 0;
    }
    else {
      BOOL v31 = 0;
    }
    if (v31) {
      uint64_t v17 = v26;
    }

    id v8 = v48;
  }
  if (self->_isCollaborativePlaylist)
  {
    v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke;
    v63[3] = &unk_1E57F3278;
    id v64 = v32;
    SEL v65 = a2;
    v63[4] = self;
    id v33 = v32;
    [v9 enumerateObjectsUsingBlock:v63];
    v34 = [(MPAsyncOperation *)self userIdentity];
    v35 = +[MPCloudController controllerWithUserIdentity:v34];
    id v36 = v9;
    uint64_t v37 = [v8 persistentID];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_38;
    v61[3] = &unk_1E57F90A0;
    id v62 = v54;
    uint64_t v38 = v37;
    id v9 = v36;
    [v35 editCollaborationWithPersistentID:v38 properties:MEMORY[0x1E4F1CC08] trackEdits:v33 completion:v61];
  }
  else if (((v15 != 0) & v11) == 1)
  {
    v39 = [(MPAsyncOperation *)self userIdentity];
    v40 = +[MPCloudController controllerWithUserIdentity:v39];
    uint64_t v41 = [v8 persistentID];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_39;
    v59[3] = &unk_1E57F90A0;
    id v60 = v54;
    [v40 addItemWithSagaID:v15 toPlaylistWithPersistentID:v41 completionHandler:v59];

    id v33 = v60;
  }
  else
  {
    v42 = [(MPAsyncOperation *)self userIdentity];
    v43 = +[MPCloudController controllerWithUserIdentity:v42];
    if (!v17 || v13)
    {
      v46 = +[MPCloudControllerItemIDList cloudItemIDListForPlaylist:v8];
      uint64_t v47 = [v8 persistentID];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_42;
      v55[3] = &unk_1E57F90A0;
      id v56 = v54;
      [v43 setPlaylistProperties:0 trackList:v46 forPlaylistWithPersistentID:v47 completionHandler:v55];

      id v33 = v56;
    }
    else
    {
      v44 = [(MPModelLibraryAddToPlaylistChangeRequest *)self->_request referralObject];
      uint64_t v45 = [v8 persistentID];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_40;
      v57[3] = &unk_1E57F90A0;
      id v58 = v54;
      [v43 addStoreItemWithAdamID:v17 referralObject:v44 toPlaylistWithPersistentID:v45 completionHandler:v57];

      id v33 = v58;
    }
  }
}

void __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [v5 persistentID];
  v7 = [v5 valueForProperty:@"subscriptionStoreItemAdamID"];
  uint64_t v8 = [v7 unsignedLongLongValue];

  if (v8) {
    goto LABEL_4;
  }
  id v9 = [v5 valueForProperty:@"storeItemAdamID"];
  uint64_t v8 = [v9 unsignedLongLongValue];

  if (v8
    || ([v5 valueForProperty:@"assetStoreItemAdamID"],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v10 unsignedLongLongValue],
        v10,
        v8))
  {
LABEL_4:
    v11 = *(void **)(a1[4] + 288);
    v12 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];

    if (!v13)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], @"MPModelLibraryAddToPlaylistChangeRequestOperation.m", 262, @"No item properties for track with persistent ID %lld", v6);
    }
    v14 = (void *)a1[5];
    uint64_t v15 = (void *)MEMORY[0x1E4FB85D0];
    v16 = [v13 objectForKeyedSubscript:@"entryUniversalIdentifier"];
    uint64_t v17 = [v13 objectForKeyedSubscript:@"entryPositionUniversalIdentifier"];
    v18 = [v15 paramsForAddingTrackWithAdamID:v8 itemUUID:v16 itemPositionUUID:v17 atPosition:2];
    [v14 addObject:v18];
  }
  else
  {
    v19 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = a1[4];
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v20;
      __int16 v24 = 2048;
      uint64_t v25 = v6;
      _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_ERROR, "%{public}@ No adamID for track %lld - skipping adding to collaboration", buf, 0x16u);
    }
  }
}

void __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_msgSend(v3, "msv_description");
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "-editCollaborationWithPersistentID completed. error=%{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "-editCollaborationWithPersistentID completed.", (uint8_t *)&v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_msgSend(v3, "msv_description");
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "-addItemWithSagaID:toPlaylistWithPersistentID:completionHandler: completed. error=%{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "-addItemWithSagaID:toPlaylistWithPersistentID:completionHandler: completed.", (uint8_t *)&v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_msgSend(v3, "msv_description");
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "-addStoreItemWithAdamID:referralObject:toPlaylistWithPersistentID:completionHandler: completed. error=%{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "-addStoreItemWithAdamID:referralObject:toPlaylistWithPersistentID:completionHandler: completed.", (uint8_t *)&v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __110__MPModelLibraryAddToPlaylistChangeRequestOperation__updateCloudLibraryForPlaylist_withAddedItems_completion___block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_msgSend(v3, "msv_description");
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "-setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler: completed. error=%{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEBUG, "-setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler: completed.", (uint8_t *)&v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)execute
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v4 = [v3 qualityOfService];

  id v5 = [(MPModelLibraryAddToPlaylistChangeRequestOperation *)self request];
  uint64_t v6 = [(MPAsyncOperation *)self userIdentity];
  int v7 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v6];

  uint64_t v8 = [v5 playlist];
  uint64_t v9 = [v8 identifiers];
  v10 = [v9 library];
  uint64_t v11 = [v10 persistentID];

  if (v11)
  {
    v12 = [v7 playlistWithPersistentID:v11];
    if ([v8 hasLoadedValueForKey:@"MPModelPropertyPlaylistIsCollaborative"])
    {
      self->_BOOL isCollaborativePlaylist = [v8 isCollaborative];
    }
    else
    {
      uint64_t v13 = [v12 valueForProperty:@"isCollaborative"];
      self->_BOOL isCollaborativePlaylist = [v13 BOOLValue];
    }
    if ([v8 hasLoadedValueForKey:@"MPModelPropertyPlaylistIsOwner"])
    {
      self->_isOwner = [v8 isOwner];
    }
    else
    {
      v14 = [v12 valueForProperty:@"iO"];
      self->_isOwner = [v14 BOOLValue];
    }
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    itemEntryProperties = self->_itemEntryProperties;
    self->_itemEntryProperties = v15;
  }
  else
  {
    v12 = 0;
  }
  uint64_t v17 = os_log_create("com.apple.amp.mediaplayer", "Default_Oversize");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [v5 songResults];
    uint64_t v19 = [v18 totalItemCount];
    BOOL isCollaborativePlaylist = self->_isCollaborativePlaylist;
    *(_DWORD *)buf = 138544130;
    v61 = self;
    __int16 v62 = 2048;
    uint64_t v63 = v19;
    __int16 v64 = 2114;
    SEL v65 = v8;
    __int16 v66 = 1024;
    BOOL v67 = isCollaborativePlaylist;
    _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding %ld items to playlist %{public}@. isCollaborative = %{BOOL}u", buf, 0x26u);
  }
  if (v12)
  {
    v40 = v12;
    uint64_t v38 = v4;
    v21 = [v5 songResults];
    uint64_t v22 = objc_alloc_init(MPMutableSectionedCollection);
    [(MPMutableSectionedCollection *)v22 appendSection:&stru_1EE680640];
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke;
    v54[3] = &unk_1E57F3670;
    id v24 = v7;
    id v55 = v24;
    id v56 = self;
    id v25 = v23;
    id v57 = v25;
    id v26 = v21;
    id v58 = v26;
    v27 = v22;
    v59 = v27;
    [v26 enumerateItemIdentifiersUsingBlock:v54];
    uint64_t v41 = v5;
    v39 = v7;
    if ([(MPSectionedCollection *)v27 totalItemCount] < 1)
    {
      v12 = v40;
      id v36 = v40;
      uint64_t v37 = self->_itemEntryProperties;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_2_27;
      v42[3] = &unk_1E57F3248;
      v42[4] = self;
      BOOL v30 = &v43;
      v32 = &v44;
      id v43 = v25;
      id v44 = v36;
      [v36 appendItems:v43 andEntryProperties:v37 completion:v42];
    }
    else
    {
      v28 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = [(MPSectionedCollection *)v27 totalItemCount];
        *(_DWORD *)buf = 138543618;
        v61 = self;
        __int16 v62 = 2048;
        uint64_t v63 = v29;
        _os_log_impl(&dword_1952E8000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ Importing %ld songs not in the library", buf, 0x16u);
      }

      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_12;
      v47[3] = &unk_1E57F31F8;
      v47[4] = self;
      uint64_t v53 = v38;
      BOOL v30 = &v48;
      id v31 = v5;
      id v48 = v31;
      v32 = (id *)&v49;
      id v49 = v27;
      id v50 = v26;
      id v51 = v24;
      id v52 = v40;
      id v33 = (void (**)(void))MEMORY[0x19971E0F0](v47);
      v34 = [v31 storeImportAllowedHandler];
      if (v34)
      {
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_26;
        v45[3] = &unk_1E57F3220;
        v45[4] = self;
        v46 = v33;
        ((void (**)(void, void *))v34)[2](v34, v45);
      }
      else
      {
        v33[2](v33);
      }

      v12 = v40;
    }

    id v5 = v41;
    int v7 = v39;
  }
  else
  {
    responseHandler = (void (**)(id, void))self->_responseHandler;
    if (responseHandler) {
      responseHandler[2](responseHandler, 0);
    }
    [(MPAsyncOperation *)self finish];
  }
}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v6 library];
  uint64_t v8 = [v7 persistentID];

  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v9 = [*(id *)(a1 + 32) itemWithPersistentID:v8 verifyExistence:0];
  v10 = v9;
  if (!v9
    || ([v9 valueForProperty:@"isInMyLibrary"],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 BOOLValue],
        v11,
        !v12))
  {

LABEL_12:
    v10 = [*(id *)(a1 + 56) itemAtIndexPath:v5];
    [*(id *)(a1 + 64) appendItem:v10];
    goto LABEL_13;
  }
  if (*(unsigned char *)(*(void *)(a1 + 40) + 280))
  {
    uint64_t v13 = [v6 universalStore];
    if ([v13 subscriptionAdamID])
    {
LABEL_8:

      goto LABEL_9;
    }
    v14 = [v6 universalStore];
    if ([v14 adamID])
    {

      goto LABEL_8;
    }
    v21 = [v6 universalStore];
    uint64_t v22 = [v21 assetAdamID];

    if (!v22)
    {
      uint64_t v15 = _MPLogCategoryDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v27 = v23;
        __int16 v28 = 2048;
        uint64_t v29 = v8;
        __int16 v30 = 2114;
        id v31 = v6;
        _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Skipping adding song with persistent ID %lld because a store ID is required. identifiers=%{public}@", buf, 0x20u);
      }
      goto LABEL_10;
    }
  }
LABEL_9:
  [*(id *)(a1 + 48) addObject:v10];
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB85D0], "newIdentifierString", @"entryUniversalIdentifier");
  v24[1] = @"entryPositionUniversalIdentifier";
  v25[0] = v15;
  v16 = (void *)[MEMORY[0x1E4FB85D0] newIdentifierString];
  v25[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  v18 = *(void **)(a1 + 48);
  uint64_t v19 = *(void **)(*(void *)(a1 + 40) + 288);
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count") - 1);
  [v19 setObject:v17 forKeyedSubscript:v20];

LABEL_10:
LABEL_13:
}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_12(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userIdentity];
  id v3 = +[MPCloudController controllerWithUserIdentity:v2];

  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 281))
  {
    uint64_t v5 = [v3 cloudAddToPlaylistBehavior];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 2;
  }
  if (!*(void *)(v4 + 272))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 272);
    *(void *)(v7 + 272) = v6;

    [*(id *)(*(void *)(a1 + 32) + 272) setName:@"com.apple.MediaPlayer.MPModelLibraryAddToPlaylistChangeRequestOperation.operationQueue"];
    [*(id *)(*(void *)(a1 + 32) + 272) setMaxConcurrentOperationCount:1];
    [*(id *)(*(void *)(a1 + 32) + 272) setQualityOfService:*(void *)(a1 + 80)];
  }
  uint64_t v9 = objc_alloc_init(MPModelLibraryImportChangeRequest);
  v10 = [*(id *)(a1 + 40) referralObject];
  [(MPModelLibraryImportChangeRequest *)v9 setReferralObject:v10];

  [(MPModelLibraryImportChangeRequest *)v9 setModelObjects:*(void *)(a1 + 48)];
  [(MPModelLibraryImportChangeRequest *)v9 setShouldLibraryAdd:v5 == 1];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_2;
  uint64_t v17 = &unk_1E57F31D0;
  id v18 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 32);
  id v19 = v11;
  uint64_t v20 = v12;
  id v21 = *(id *)(a1 + 72);
  id v13 = [(MPModelLibraryImportChangeRequest *)v9 newOperationWithResponseHandler:&v14];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 272), "addOperation:", v13, v14, v15, v16, v17);
}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_26(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPModelLibraryAddToPlaylistChangeRequestErrorDomain" code:-6003 userInfo:0];
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = v5[38];
    id v7 = (id)v4;
    if (v6)
    {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
      uint64_t v4 = (uint64_t)v7;
      uint64_t v5 = *(void **)(a1 + 32);
    }
    [v5 finishWithError:v4];
  }
}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_2_27(uint64_t a1, int a2)
{
  if (a2)
  {
    if ([*(id *)(a1 + 32) _isCloudLibraryEnabled]
      && [*(id *)(a1 + 40) count])
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v3 = *(void *)(a1 + 48);
      uint64_t v5 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_3_28;
      v11[3] = &unk_1E57F9B00;
      v11[4] = v5;
      [v5 _updateCloudLibraryForPlaylist:v3 withAddedItems:v4 completion:v11];
      return;
    }
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPModelLibraryAddToPlaylistChangeRequestErrorDomain" code:-6004 userInfo:0];
  }
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = v7[38];
  id v9 = (id)v6;
  if (v8)
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
    uint64_t v6 = (uint64_t)v9;
    id v7 = *(void **)(a1 + 32);
  }
  objc_msgSend(v7, "finishWithError:", v6, v9);
}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_3_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[38];
  id v6 = v3;
  if (v5)
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
    id v3 = v6;
    uint64_t v4 = *(void **)(a1 + 32);
  }
  [v4 finishWithError:v3];
}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = a1;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v41;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v41 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * v7), "identifiers", v29);
        id v9 = [v8 library];
        uint64_t v10 = [v9 persistentID];

        id v11 = [v8 universalStore];
        uint64_t v12 = [v11 subscriptionAdamID];
        if (!v12)
        {
          id v13 = [v8 universalStore];
          uint64_t v12 = [v13 adamID];
        }
        if (v12) {
          BOOL v14 = v10 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14)
        {
          uint64_t v15 = [NSNumber numberWithLongLong:v10];
          v16 = [NSNumber numberWithLongLong:v12];
          [v30 setObject:v15 forKey:v16];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v5);
  }
  uint64_t v17 = v3;

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_3;
  v35[3] = &unk_1E57F35F8;
  id v36 = v30;
  id v19 = *(void **)(v29 + 32);
  id v37 = *(id *)(v29 + 40);
  id v20 = v18;
  uint64_t v21 = *(void *)(v29 + 48);
  id v38 = v20;
  uint64_t v39 = v21;
  id v22 = v30;
  [v19 enumerateItemIdentifiersUsingBlock:v35];
  id v23 = *(id *)(v29 + 56);
  uint64_t v25 = *(void *)(v29 + 48);
  id v24 = *(void **)(v29 + 56);
  uint64_t v26 = *(void *)(v25 + 288);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_19;
  v31[3] = &unk_1E57F31A8;
  v31[4] = v25;
  id v32 = v20;
  id v33 = v23;
  id v34 = v24;
  id v27 = v20;
  id v28 = v23;
  [v34 appendItems:v27 andEntryProperties:v26 completion:v31];
}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 library];
  uint64_t v6 = [v5 persistentID];

  if (v6) {
    goto LABEL_4;
  }
  uint64_t v7 = [v4 universalStore];
  uint64_t v8 = [v7 subscriptionAdamID];

  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = [NSNumber numberWithLongLong:v8];
  id v11 = [v9 objectForKey:v10];
  uint64_t v6 = [v11 longLongValue];

  if (v6) {
    goto LABEL_4;
  }
  uint64_t v12 = [v4 universalStore];
  uint64_t v13 = [v12 adamID];

  BOOL v14 = *(void **)(a1 + 32);
  uint64_t v15 = [NSNumber numberWithLongLong:v13];
  v16 = [v14 objectForKey:v15];
  uint64_t v6 = [v16 longLongValue];

  if (v6)
  {
LABEL_4:
    uint64_t v17 = [*(id *)(a1 + 40) itemWithPersistentID:v6 verifyExistence:0];
    if (v17)
    {
      [*(id *)(a1 + 48) addObject:v17];
      v29[0] = @"entryUniversalIdentifier";
      id v18 = (void *)[MEMORY[0x1E4FB85D0] newIdentifierString];
      v29[1] = @"entryPositionUniversalIdentifier";
      v30[0] = v18;
      id v19 = (void *)[MEMORY[0x1E4FB85D0] newIdentifierString];
      v30[1] = v19;
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
      uint64_t v21 = *(void **)(a1 + 48);
      id v22 = *(void **)(*(void *)(a1 + 56) + 288);
      id v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "count") - 1);
      [v22 setObject:v20 forKeyedSubscript:v23];
    }
  }
  else
  {
    uint64_t v17 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *(void *)(a1 + 56);
      int v25 = 138543618;
      uint64_t v26 = v24;
      __int16 v27 = 2114;
      id v28 = v4;
      _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Failed to re-map song with identifier set %{public}@", (uint8_t *)&v25, 0x16u);
    }
  }
}

uint64_t __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_19(uint64_t a1, int a2)
{
  char v2 = a2;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a2
    && [*(id *)(a1 + 32) _isCloudLibraryEnabled]
    && [*(id *)(a1 + 40) count])
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v6 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_2_20;
    v19[3] = &unk_1E57F9B00;
    v19[4] = v6;
    return [v6 _updateCloudLibraryForPlaylist:v4 withAddedItems:v5 completion:v19];
  }
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8[38])
  {
    if ([*(id *)(a1 + 40) count])
    {
      if (v2)
      {
        if (([*(id *)(a1 + 32) _isCloudLibraryEnabled] & 1) == 0)
        {
          id v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v10 = *(void *)(a1 + 56);
            *(_DWORD *)buf = 138543362;
            uint64_t v21 = v10;
            _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEBUG, "Skipping cloud library update for playlist %{public}@ because cloudLibrary is not enabled", buf, 0xCu);
          }
        }
        id v11 = 0;
        goto LABEL_20;
      }
      v16 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        uint64_t v21 = v17;
        __int16 v22 = 2114;
        uint64_t v23 = v18;
        _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_ERROR, "Failed to add items %{}@ to local database for playlist %{public}@", buf, 0x16u);
      }

      BOOL v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = -6006;
    }
    else
    {
      uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v13;
        _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_ERROR, "Failed to add to playlist %{public}@ because there were no resolvable items to add.", buf, 0xCu);
      }

      BOOL v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = -6005;
    }
    id v11 = [v14 errorWithDomain:@"MPModelLibraryAddToPlaylistChangeRequestErrorDomain" code:v15 userInfo:0];
LABEL_20:
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 304) + 16))();

    uint64_t v8 = *(void **)(a1 + 32);
  }
  return [v8 finish];
}

void __60__MPModelLibraryAddToPlaylistChangeRequestOperation_execute__block_invoke_2_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[38];
  id v6 = v3;
  if (v5)
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
    id v3 = v6;
    uint64_t v4 = *(void **)(a1 + 32);
  }
  [v4 finishWithError:v3];
}

@end