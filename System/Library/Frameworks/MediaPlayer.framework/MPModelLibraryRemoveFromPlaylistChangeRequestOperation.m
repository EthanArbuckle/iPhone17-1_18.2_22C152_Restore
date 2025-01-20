@interface MPModelLibraryRemoveFromPlaylistChangeRequestOperation
- (MPModelLibraryRemoveFromPlaylistChangeRequest)request;
- (id)responseHandler;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryRemoveFromPlaylistChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong(&self->_responseHandler, 0);
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibraryRemoveFromPlaylistChangeRequest)request
{
  return self->_request;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)execute
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v3 = [(MPModelLibraryRemoveFromPlaylistChangeRequest *)self->_request mediaLibrary];
  v4 = [(MPModelLibraryRemoveFromPlaylistChangeRequest *)self->_request playlist];
  v31 = [v4 identifiers];
  v5 = [v31 library];
  uint64_t v6 = [v5 persistentID];

  v7 = [(MPModelLibraryRemoveFromPlaylistChangeRequest *)self->_request entriesToRemove];
  v8 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v46 = self;
    __int16 v47 = 2114;
    v48 = v4;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ removing tracks from playlist %{public}@", buf, 0x16u);
  }

  if (!v6)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"MPModelLibraryRemoveFromPlaylistChangeRequestOperation.m" lineNumber:29 description:@"Must provide a playlist in the library"];
  }
  v9 = [v3 playlistWithPersistentID:v6];
  uint64_t v30 = v6;
  v33 = self;
  v29 = v9;
  if ([v4 hasLoadedValueForKey:@"MPModelPropertyPlaylistIsCollaborative"])
  {
    int v10 = [v4 isCollaborative];
  }
  else
  {
    v11 = [v9 valueForProperty:@"isCollaborative"];
    int v10 = [v11 BOOLValue];
  }
  v32 = v3;
  v12 = [MEMORY[0x1E4F28E60] indexSet];
  v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        objc_msgSend(v12, "addIndex:", objc_msgSend(v19, "position"));
        if (v10)
        {
          v20 = [v19 universalIdentifier];
          if (!v20)
          {
            [MEMORY[0x1E4F28B00] currentHandler];
            v22 = v27 = v19;
            [v22 handleFailureInMethod:a2, v33, @"MPModelLibraryRemoveFromPlaylistChangeRequestOperation.m", 42, @"No uuid for deleted entry %@", v27 object file lineNumber description];
          }
          v21 = [MEMORY[0x1E4FB85D0] paramsForRemovingTrackWithItemUUID:v20];
          [v13 addObject:v21];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v16);
  }

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __65__MPModelLibraryRemoveFromPlaylistChangeRequestOperation_execute__block_invoke;
  v34[3] = &unk_1E57F79A8;
  v34[4] = v33;
  id v35 = v4;
  char v39 = v10;
  id v36 = v13;
  id v37 = v29;
  uint64_t v38 = v30;
  id v23 = v29;
  id v24 = v13;
  id v25 = v4;
  [v23 removeItems:MEMORY[0x1E4F1CBF0] atFilteredIndexes:v12 completionBlock:v34];
}

void __65__MPModelLibraryRemoveFromPlaylistChangeRequestOperation_execute__block_invoke(uint64_t a1, char a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(a1 + 32) userIdentity];
  v5 = +[MPCloudController controllerWithUserIdentity:v4];
  char v6 = [v5 isCloudLibraryEnabled];

  if ((a2 & 1) == 0)
  {
    v12 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v13;
      __int16 v31 = 2114;
      uint64_t v32 = v14;
      _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to remove track entries from the database for %{public}@", buf, 0x16u);
    }

    uint64_t v15 = [*(id *)(a1 + 32) responseHandler];
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", 0, @"Failed to remove the track entries from the database");
    ((void (**)(void, void *))v15)[2](v15, v16);

    goto LABEL_11;
  }
  if ((v6 & 1) == 0)
  {
    uint64_t v17 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v18;
      __int16 v31 = 2114;
      uint64_t v32 = v19;
      _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Finished removing tracks from %{public}@", buf, 0x16u);
    }

    uint64_t v15 = [*(id *)(a1 + 32) responseHandler];
    v15[2](v15, 0);
LABEL_11:

    [*(id *)(a1 + 32) finish];
    return;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    v7 = [*(id *)(a1 + 32) userIdentity];
    v8 = +[MPCloudController controllerWithUserIdentity:v7];
    uint64_t v9 = *(void *)(a1 + 64);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __65__MPModelLibraryRemoveFromPlaylistChangeRequestOperation_execute__block_invoke_18;
    v27[3] = &unk_1E57FA148;
    int v10 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    v27[4] = *(void *)(a1 + 32);
    id v28 = v10;
    [v8 editCollaborationWithPersistentID:v9 properties:MEMORY[0x1E4F1CC08] trackEdits:v11 completion:v27];
  }
  else
  {
    v20 = +[MPCloudControllerItemIDList cloudItemIDListForPlaylist:*(void *)(a1 + 56)];
    v21 = [*(id *)(a1 + 32) userIdentity];
    v22 = +[MPCloudController controllerWithUserIdentity:v21];
    uint64_t v23 = [*(id *)(a1 + 56) persistentID];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__MPModelLibraryRemoveFromPlaylistChangeRequestOperation_execute__block_invoke_21;
    v25[3] = &unk_1E57FA148;
    id v24 = *(void **)(a1 + 40);
    v25[4] = *(void *)(a1 + 32);
    id v26 = v24;
    [v22 setPlaylistProperties:MEMORY[0x1E4F1CC08] trackList:v20 forPlaylistWithPersistentID:v23 completionHandler:v25];
  }
}

void __65__MPModelLibraryRemoveFromPlaylistChangeRequestOperation_execute__block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      v8 = objc_msgSend(v3, "msv_description");
      int v12 = 138543874;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "%{public}@ finished removing cloud tracks from playlist %{public}@ error=%{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v12 = 138543618;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ finished removing cloud tracks from playlist %{public}@", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v11 = [*(id *)(a1 + 32) responseHandler];
  ((void (**)(void, id))v11)[2](v11, v3);

  [*(id *)(a1 + 32) finish];
}

void __65__MPModelLibraryRemoveFromPlaylistChangeRequestOperation_execute__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      v8 = objc_msgSend(v3, "msv_description");
      int v12 = 138543874;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "%{public}@ finished removing cloud tracks from playlist %{public}@ error=%{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v12 = 138543618;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ finished removing cloud tracks from playlist %{public}@", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v11 = [*(id *)(a1 + 32) responseHandler];
  ((void (**)(void, id))v11)[2](v11, v3);

  [*(id *)(a1 + 32) finish];
}

@end