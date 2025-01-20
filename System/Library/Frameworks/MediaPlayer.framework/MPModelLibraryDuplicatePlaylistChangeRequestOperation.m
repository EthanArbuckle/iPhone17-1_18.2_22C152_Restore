@interface MPModelLibraryDuplicatePlaylistChangeRequestOperation
- (MPModelLibraryDuplicatePlaylistChangeRequest)request;
- (id)responseHandler;
- (void)_addPlaylistToCloudLibraryIfNeeded:(id)a3 withProperties:(id)a4 completion:(id)a5;
- (void)_finishWithError:(id)a3 newPlaylist:(id)a4;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryDuplicatePlaylistChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_request, 0);
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

- (MPModelLibraryDuplicatePlaylistChangeRequest)request
{
  return self->_request;
}

- (void)_finishWithError:(id)a3 newPlaylist:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(MPModelLibraryDuplicatePlaylistChangeRequestOperation *)self responseHandler];
  if (v7) {
    ((void (**)(void, uint64_t, id))v7)[2](v7, [v6 persistentID], v8);
  }
  [(MPAsyncOperation *)self finishWithError:v8];
}

- (void)_addPlaylistToCloudLibraryIfNeeded:(id)a3 withProperties:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MPAsyncOperation *)self userIdentity];
  v12 = +[MPCloudController controllerWithUserIdentity:v11];

  if ([v12 isCloudLibraryEnabled])
  {
    v13 = [(MPAsyncOperation *)self userIdentity];
    v14 = +[MPCloudController controllerWithUserIdentity:v13];
    uint64_t v15 = [v8 persistentID];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __118__MPModelLibraryDuplicatePlaylistChangeRequestOperation__addPlaylistToCloudLibraryIfNeeded_withProperties_completion___block_invoke;
    v16[3] = &unk_1E57F4B80;
    id v20 = v10;
    id v17 = v8;
    v18 = self;
    id v19 = v9;
    [v14 createPlaylistWithPersistentID:v15 properties:v19 trackList:0 completionHandler:v16];
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __118__MPModelLibraryDuplicatePlaylistChangeRequestOperation__addPlaylistToCloudLibraryIfNeeded_withProperties_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v4();
  }
  else
  {
    v5 = +[MPCloudControllerItemIDList cloudItemIDListForPlaylist:*(void *)(a1 + 32)];
    id v6 = [*(id *)(a1 + 40) userIdentity];
    v7 = +[MPCloudController controllerWithUserIdentity:v6];
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = [*(id *)(a1 + 32) persistentID];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __118__MPModelLibraryDuplicatePlaylistChangeRequestOperation__addPlaylistToCloudLibraryIfNeeded_withProperties_completion___block_invoke_2;
    v10[3] = &unk_1E57F90A0;
    id v11 = *(id *)(a1 + 56);
    [v7 setPlaylistProperties:v8 trackList:v5 forPlaylistWithPersistentID:v9 completionHandler:v10];
  }
}

uint64_t __118__MPModelLibraryDuplicatePlaylistChangeRequestOperation__addPlaylistToCloudLibraryIfNeeded_withProperties_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)execute
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v27 = [(MPModelLibraryDuplicatePlaylistChangeRequestOperation *)self request];
  v25 = [v27 mediaLibrary];
  v24 = [v27 playlist];
  uint64_t v3 = [v27 playlistPersistentID];
  if (!v3)
  {
    v4 = [v24 identifiers];
    v5 = [v4 library];
    uint64_t v3 = [v5 persistentID];

    if (!v3)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:self file:@"MPModelLibraryDuplicatePlaylistChangeRequestOperation.m" lineNumber:31 description:@"MPModelLibraryDuplicatePlaylistChangeRequest requires either a playlist or persistent ID"];

      uint64_t v3 = 0;
    }
  }
  v26 = [[MPMediaPlaylist alloc] initWithPersistentID:v3];
  id v6 = [(MPMediaPlaylist *)v26 items];
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = [*(id *)(*((void *)&v35 + 1) + 8 * i) persistentID];
        if (v12)
        {
          v13 = [NSNumber numberWithLongLong:v12];
          [v7 addObject:v13];
        }
        else
        {
          v13 = os_log_create("com.apple.amp.mediaplayer", "Default");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v40 = self;
            _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Original playlist has a track without a persistent ID!", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v9);
  }

  v14 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
  uint64_t v15 = [v14 localizedStringForKey:@"PLAYLIST_COPY_TITLE_ADDITION" value:&stru_1EE680640 table:@"MediaPlayer"];

  v16 = [(MPMediaPlaylist *)v26 name];
  id v17 = [v16 stringByAppendingFormat:@" %@", v15];

  v18 = [v25 addPlaylistWithName:v17];
  id v19 = os_log_create("com.apple.amp.mediaplayer", "Default");
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
  if (v18)
  {
    if (v20)
    {
      uint64_t v21 = [v18 persistentID];
      *(_DWORD *)buf = 138543874;
      v40 = self;
      __int16 v41 = 2048;
      uint64_t v42 = v21;
      __int16 v43 = 2114;
      v44 = v17;
      _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Created new playlist with persistent ID %lld: %{public}@", buf, 0x20u);
    }

    objc_initWeak((id *)buf, self);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __64__MPModelLibraryDuplicatePlaylistChangeRequestOperation_execute__block_invoke;
    v29[3] = &unk_1E57F4B58;
    objc_copyWeak(&v34, (id *)buf);
    v29[4] = self;
    id v30 = v18;
    id v31 = v17;
    v32 = v26;
    id v33 = v25;
    [v30 replaceItemsWithPersistentIDs:v7 completion:v29];

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v20)
    {
      *(_DWORD *)buf = 138543362;
      v40 = self;
      _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create playlist", buf, 0xCu);
    }

    v22 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", 0, @"Failed to set track list on new playlist");
    [(MPModelLibraryDuplicatePlaylistChangeRequestOperation *)self _finishWithError:v22 newPlaylist:0];
  }
}

void __64__MPModelLibraryDuplicatePlaylistChangeRequestOperation_execute__block_invoke(uint64_t a1, char a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (a2)
  {
    v5 = [MEMORY[0x1E4F1CA60] dictionary];
    [v5 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"name"];
    id v6 = [*(id *)(a1 + 56) valueForProperty:@"cloudIsVisible"];
    [v5 setObject:v6 forKeyedSubscript:@"cloudIsVisible"];

    v7 = [*(id *)(a1 + 56) valueForProperty:@"cloudIsPublic"];
    [v5 setObject:v7 forKeyedSubscript:@"cloudIsPublic"];

    id v8 = [*(id *)(a1 + 56) valueForProperty:@"coverArtworkRecipe"];
    if ([v8 length]) {
      [v5 setObject:v8 forKeyedSubscript:@"coverArtworkRecipe"];
    }
    uint64_t v9 = [*(id *)(a1 + 56) valueForProperty:@"descriptionInfo"];
    if ([v9 length]) {
      [v5 setObject:v9 forKeyedSubscript:@"descriptionInfo"];
    }
    uint64_t v10 = [*(id *)(a1 + 56) valueForProperty:@"parentPersistentID"];
    if ([v10 longLongValue]) {
      [v5 setObject:v10 forKeyedSubscript:@"parentPersistentID"];
    }
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__MPModelLibraryDuplicatePlaylistChangeRequestOperation_execute__block_invoke_25;
    v16[3] = &unk_1E57FA060;
    id v17 = WeakRetained;
    id v18 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 64);
    id v20 = *(id *)(a1 + 56);
    [v11 _addPlaylistToCloudLibraryIfNeeded:v12 withProperties:v5 completion:v16];
  }
  else
  {
    v13 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v14;
      _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to set track list on new playlist", buf, 0xCu);
    }

    uint64_t v15 = *(void **)(a1 + 32);
    v5 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", 0, @"Failed to set track list on new playlist");
    [v15 _finishWithError:v5 newPlaylist:*(void *)(a1 + 40)];
  }
}

void __64__MPModelLibraryDuplicatePlaylistChangeRequestOperation_execute__block_invoke_25(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _finishWithError:a2 newPlaylist:v4];
  }
  else
  {
    uint64_t v14 = -[MPMediaLibraryArtworkRequest initWithLibrary:identifier:entityType:artworkType:]([MPMediaLibraryArtworkRequest alloc], "initWithLibrary:identifier:entityType:artworkType:", *(void *)(a1 + 48), [*(id *)(a1 + 56) persistentID], 1, 5);
    v5 = [(MPMediaLibraryArtworkRequest *)v14 fetchableArtworkSource];
    if ([v5 intValue] == 100)
    {
      id v6 = +[MPMediaLibraryArtwork availableArtworkWithRequest:v14];
      v7 = v6;
      if (v6)
      {
        id v8 = [v6 originalFileURL];
        uint64_t v9 = v8;
        if (v8)
        {
          uint64_t v10 = *(void **)(a1 + 40);
          id v11 = (void *)MEMORY[0x1E4FB1818];
          uint64_t v12 = [v8 path];
          v13 = [v11 imageWithContentsOfFile:v12];
          [v10 setUserSelectedArtworkImage:v13];
        }
      }
    }
    [*(id *)(a1 + 32) _finishWithError:0 newPlaylist:*(void *)(a1 + 40)];
  }
}

@end