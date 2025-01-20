@interface MPModelLibraryPlaylistEntryReactionChangeRequestOperation
- (MPModelLibraryPlaylistEntryReactionChangeRequest)request;
- (id)responseHandler;
- (void)_finishOperationWithError:(id)a3;
- (void)_performSetReactionRequestForPlaylistWithPlaylist:(id)a3 playlistEntry:(id)a4 reactionText:(id)a5;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryPlaylistEntryReactionChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong(&self->_responseHandler, 0);
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibraryPlaylistEntryReactionChangeRequest)request
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

- (void)_finishOperationWithError:(id)a3
{
  id v5 = a3;
  v4 = [(MPModelLibraryPlaylistEntryReactionChangeRequestOperation *)self responseHandler];
  ((void (**)(void, id))v4)[2](v4, v5);

  [(MPAsyncOperation *)self finishWithError:v5];
}

- (void)_performSetReactionRequestForPlaylistWithPlaylist:(id)a3 playlistEntry:(id)a4 reactionText:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [a3 identifiers];
  v11 = [v10 library];
  uint64_t v12 = [v11 persistentID];

  v13 = [v8 universalIdentifier];
  v14 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v26 = self;
    __int16 v27 = 2048;
    uint64_t v28 = v12;
    __int16 v29 = 2114;
    v30 = v13;
    _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating reaction text on playlist %lld/%{public}@", buf, 0x20u);
  }

  v15 = [(MPAsyncOperation *)self userIdentity];
  v16 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v15];

  v17 = [[MPMediaPlaylist alloc] initWithPersistentID:v12 mediaLibrary:v16];
  uint64_t v18 = [v8 position];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __138__MPModelLibraryPlaylistEntryReactionChangeRequestOperation__performSetReactionRequestForPlaylistWithPlaylist_playlistEntry_reactionText___block_invoke;
  v21[3] = &unk_1E57F7A68;
  v21[4] = self;
  id v22 = v9;
  id v23 = v13;
  uint64_t v24 = v12;
  id v19 = v13;
  id v20 = v9;
  [(MPMediaPlaylist *)v17 setReactionText:v20 onEntryAtPosition:v18 completion:v21];
}

void __138__MPModelLibraryPlaylistEntryReactionChangeRequestOperation__performSetReactionRequestForPlaylistWithPlaylist_playlistEntry_reactionText___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v6 = [*(id *)(a1 + 32) userIdentity];
    v7 = +[MPCloudController controllerWithUserIdentity:v6];

    if ([v7 isCloudLibraryEnabled])
    {
      id v8 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v24 = v9;
        _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sending updating reaction text to cloud library", buf, 0xCu);
      }

      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      if (v10) {
        [MEMORY[0x1E4FB85D0] paramsForSettingReaction:v10 onTrackWithItemUUID:v11];
      }
      else {
      v17 = [MEMORY[0x1E4FB85D0] paramsForUnsettingReaction:v5 onTrackWithItemUUID:v11];
      }
      uint64_t v18 = *(void *)(a1 + 56);
      id v22 = v17;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      [v7 editCollaborationWithPersistentID:v18 properties:MEMORY[0x1E4F1CC08] trackEdits:v19 completion:&__block_literal_global_48184];
    }
    id v20 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v21;
      _os_log_impl(&dword_1952E8000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished updating reaction text", buf, 0xCu);
    }

    v15 = *(void **)(a1 + 32);
    v16 = 0;
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v13;
      _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to update local library with new reaction text", buf, 0xCu);
    }

    v14 = *(void **)(a1 + 32);
    v7 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", 0, @"Failed to update local library with reaction text");
    v15 = v14;
    v16 = v7;
  }
  [v15 _finishOperationWithError:v16];
}

- (void)execute
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v4 = [(MPModelLibraryPlaylistEntryReactionChangeRequest *)self->_request playlist];
  id v5 = [(MPModelLibraryPlaylistEntryReactionChangeRequest *)self->_request playlistEntry];
  v6 = [(MPModelLibraryPlaylistEntryReactionChangeRequest *)self->_request reactionText];
  v7 = [v4 identifiers];
  id v8 = [v7 library];
  uint64_t v9 = [v8 persistentID];

  if (!v9)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"MPModelLibraryPlaylistEntryReactionChangeRequestOperation.m" lineNumber:27 description:@"Must be a playlist in the library"];
  }
  if ([v5 hasLoadedValueForKey:@"MPModelPropertyPlaylistEntryUniversalIdentifier"])
  {
    uint64_t v10 = [v5 universalIdentifier];
  }
  else
  {
    uint64_t v10 = 0;
  }
  if ([v10 length])
  {
    [(MPModelLibraryPlaylistEntryReactionChangeRequestOperation *)self _performSetReactionRequestForPlaylistWithPlaylist:v4 playlistEntry:v5 reactionText:v6];
  }
  else
  {
    v26 = v6;
    uint64_t v11 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = self;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Reloading playlist entry to get required properties", buf, 0xCu);
    }

    uint64_t v12 = +[MPModelSong kindWithVariants:3];
    uint64_t v24 = +[MPPropertySet emptyPropertySet];
    uint64_t v13 = [MPPropertySet alloc];
    v34[0] = @"MPModelPropertyPlaylistEntryUniversalIdentifier";
    v34[1] = @"MPModelPropertyPlaylistEntryPositionUniversalIdentifier";
    v34[2] = @"MPModelPropertyPlaylistEntryPosition";
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
    uint64_t v25 = [(MPPropertySet *)v13 initWithProperties:v14 relationships:0];

    v15 = objc_alloc_init(MPModelLibraryRequest);
    v16 = [NSString stringWithFormat:@"%@ loading track list", self];
    [(MPModelRequest *)v15 setLabel:v16];

    v33 = v12;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    uint64_t v18 = +[MPModelPlaylistEntry kindWithKinds:v17];
    id v19 = +[MPModelPlaylist kindWithPlaylistEntryKind:v18 options:0];
    [(MPModelRequest *)v15 setSectionKind:v19];

    [(MPModelRequest *)v15 setSectionProperties:v24];
    v32 = v12;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    uint64_t v21 = +[MPModelPlaylistEntry kindWithKinds:v20];
    [(MPModelRequest *)v15 setItemKind:v21];

    [(MPModelRequest *)v15 setItemProperties:v25];
    uint64_t v31 = v4;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    [(MPModelLibraryRequest *)v15 setScopedContainers:v22];

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __68__MPModelLibraryPlaylistEntryReactionChangeRequestOperation_execute__block_invoke;
    v27[3] = &unk_1E57F7A40;
    v27[4] = self;
    id v28 = v5;
    id v29 = v4;
    v6 = v26;
    id v30 = v26;
    [(MPModelLibraryRequest *)v15 performWithResponseHandler:v27];
  }
}

void __68__MPModelLibraryPlaylistEntryReactionChangeRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v8 = [a2 results];
    uint64_t v9 = [v8 allItems];
    int v10 = [*(id *)(a1 + 40) hasLoadedValueForKey:@"MPModelPropertyPlaylistEntryPosition"];
    if (v10) {
      uint64_t v11 = [*(id *)(a1 + 40) position];
    }
    else {
      uint64_t v11 = -1;
    }
    uint64_t v12 = [*(id *)(a1 + 40) identifiers];
    uint64_t v13 = [v12 library];
    uint64_t v14 = [v13 persistentID];

    if (v10)
    {
      if ([v9 count] < (unint64_t)(v11 + 1))
      {
        v15 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v22 = v16;
          __int16 v23 = 2048;
          uint64_t v24 = v11;
          _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Couldn't find entry at position %ld", buf, 0x16u);
        }

        v17 = *(void **)(a1 + 32);
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", 0, @"Couldn't find entry to get uuid from");
        [v17 _finishOperationWithError:v18];
        goto LABEL_16;
      }
      uint64_t v19 = [v9 objectAtIndexedSubscript:v11];
    }
    else
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __68__MPModelLibraryPlaylistEntryReactionChangeRequestOperation_execute__block_invoke_21;
      v20[3] = &__block_descriptor_40_e30_B16__0__MPModelPlaylistEntry_8l;
      v20[4] = v14;
      uint64_t v19 = objc_msgSend(v9, "msv_firstWhere:", v20);
    }
    uint64_t v18 = (void *)v19;
    [*(id *)(a1 + 32) _performSetReactionRequestForPlaylistWithPlaylist:*(void *)(a1 + 48) playlistEntry:v19 reactionText:*(void *)(a1 + 56)];
LABEL_16:

    goto LABEL_17;
  }
  v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v7;
    __int16 v23 = 2114;
    uint64_t v24 = (uint64_t)v5;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load playlist entries from library. err=%{public}@", buf, 0x16u);
  }

  [*(id *)(a1 + 32) _finishOperationWithError:v5];
LABEL_17:
}

BOOL __68__MPModelLibraryPlaylistEntryReactionChangeRequestOperation_execute__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [a2 identifiers];
  v4 = [v3 library];
  BOOL v5 = v2 == [v4 persistentID];

  return v5;
}

@end