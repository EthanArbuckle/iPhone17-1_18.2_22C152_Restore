@interface MPModelLibraryStartCollaborationChangeRequestOperation
- (MPModelLibraryStartCollaborationChangeRequest)request;
- (id)responseHandler;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryStartCollaborationChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong(&self->_responseHandler, 0);
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibraryStartCollaborationChangeRequest)request
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = [(MPModelLibraryStartCollaborationChangeRequest *)self->_request playlistToConvert];
  v5 = [v4 identifiers];

  v6 = [v5 personalizedStore];
  uint64_t v7 = [v6 cloudID];

  v8 = [v5 library];
  uint64_t v9 = [v8 persistentID];

  v10 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(MPModelLibraryStartCollaborationChangeRequest *)self->_request playlistToConvert];
    *(_DWORD *)buf = 138544130;
    v20 = self;
    __int16 v21 = 2114;
    v22 = v11;
    __int16 v23 = 2048;
    uint64_t v24 = v9;
    __int16 v25 = 2048;
    uint64_t v26 = v7;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting collaboration using %{public}@ (pid=%lld, cloudID = %lld)", buf, 0x2Au);
  }
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"MPModelLibraryStartCollaborationChangeRequestOperation.m" lineNumber:30 description:@"Must provide a playlist in the library"];
  }
  v12 = +[MPCloudController sharedCloudController];
  int64_t v13 = [(MPModelLibraryStartCollaborationChangeRequest *)self->_request collaborationSharingMode];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke;
  v16[3] = &unk_1E57F5028;
  v16[4] = self;
  id v17 = v5;
  uint64_t v18 = v9;
  id v14 = v5;
  [v12 beginCollaborationUsingPlaylistWithPersistentID:v9 sharingMode:v13 completion:v16];
}

void __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = os_log_create("com.apple.amp.mediaplayer", "Default");
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = objc_msgSend(v5, "msv_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v8;
      __int16 v33 = 2048;
      uint64_t v34 = a2;
      __int16 v35 = 2114;
      v36 = v9;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "%{public}@ finished start collaboration request. new collaboration cloud library ID = %lld error=%{public}@", buf, 0x20u);
    }
    v10 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, void, id))v10)[2](v10, 0, v5);

    [*(id *)(a1 + 32) finish];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v11;
      __int16 v33 = 2048;
      uint64_t v34 = a2;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ finished start collaboration request. new collaboration cloud library ID = %lld", buf, 0x16u);
    }

    v12 = [MPIdentifierSet alloc];
    int64_t v13 = +[MPModelPlaylistKind identityKind];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke_10;
    v26[3] = &unk_1E57F7AD0;
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    id v27 = v14;
    uint64_t v28 = v15;
    v16 = [(MPIdentifierSet *)v12 initWithSource:@"StartCollaboration" modelKind:v13 block:v26];

    id v17 = [MPPropertySet alloc];
    v30[0] = @"MPModelPropertyPlaylistArtwork";
    v30[1] = @"MPModelPropertyPlaylistTracksTiledArtwork";
    v30[2] = @"MPModelPropertyPlaylistName";
    v30[3] = @"MPModelPropertyPlaylistIsCollaborative";
    v30[4] = @"MPModelPropertyPlaylistCollaborationSharingMode";
    v30[5] = @"MPModelPropertyPlaylistCollaborationMode";
    v30[6] = @"MPModelPropertyPlaylistCollaboratorPermissions";
    v30[7] = @"MPModelPropertyPlaylistCollaborationInvitationURL";
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:8];
    v19 = [(MPPropertySet *)v17 initWithProperties:v18 relationships:MEMORY[0x1E4F1CC08]];

    v20 = objc_alloc_init(MPModelLibraryRequest);
    __int16 v21 = [NSString stringWithFormat:@"%@ loading new collaboration", *(void *)(a1 + 32)];
    [(MPModelRequest *)v20 setLabel:v21];

    v22 = +[MPModelPlaylistKind identityKind];
    [(MPModelRequest *)v20 setItemKind:v22];

    [(MPModelRequest *)v20 setItemProperties:v19];
    v29 = v16;
    __int16 v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    [(MPModelLibraryRequest *)v20 setAllowedItemIdentifiers:v23];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke_3;
    v24[3] = &unk_1E57F9770;
    v24[4] = *(void *)(a1 + 32);
    id v25 = 0;
    [(MPModelLibraryRequest *)v20 performWithResponseHandler:v24];
  }
}

void __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke_10(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 library];
  v6 = [v5 databaseID];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke_2;
  v7[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v7[4] = *(void *)(a1 + 40);
  [v4 setLibraryIdentifiersWithDatabaseID:v6 block:v7];
}

void __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v19 = 138543618;
      uint64_t v20 = v7;
      __int16 v21 = 2114;
      uint64_t v22 = v8;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load new collaboration from library. err=%{public}@", (uint8_t *)&v19, 0x16u);
    }

    uint64_t v9 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, void, id))v9)[2](v9, 0, v5);
  }
  else
  {
    uint64_t v9 = [a2 results];
    v10 = [v9 allItems];
    uint64_t v11 = [v10 firstObject];

    if (v11)
    {
      v12 = [*(id *)(*(void *)(a1 + 32) + 280) playlistToConvert];
      int64_t v13 = [v12 mergeWithObject:v11];

      id v14 = [*(id *)(a1 + 32) responseHandler];
      ((void (**)(void, void *, void))v14)[2](v14, v13, 0);
    }
    else
    {
      uint64_t v15 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        int v19 = 138543362;
        uint64_t v20 = v16;
        _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find updated playlist in library", (uint8_t *)&v19, 0xCu);
      }

      id v17 = [*(id *)(a1 + 32) responseHandler];
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", 4, @"Failed to find updated playlist in library");
      ((void (**)(void, void, void *))v17)[2](v17, 0, v18);
    }
  }

  [*(id *)(a1 + 32) finish];
}

uint64_t __65__MPModelLibraryStartCollaborationChangeRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPersistentID:*(void *)(a1 + 32)];
}

@end