@interface MPModelLibraryEndCollaborationChangeRequestOperation
- (MPModelLibraryEndCollaborationChangeRequest)request;
- (id)responseHandler;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryEndCollaborationChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong(&self->_responseHandler, 0);
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibraryEndCollaborationChangeRequest)request
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = [(MPModelLibraryEndCollaborationChangeRequest *)self->_request collaborationToEnd];
  v5 = [v4 identifiers];

  v6 = [v5 personalizedStore];
  uint64_t v7 = [v6 cloudID];

  v8 = [v5 library];
  uint64_t v9 = [v8 persistentID];

  v10 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(MPModelLibraryEndCollaborationChangeRequest *)self->_request collaborationToEnd];
    *(_DWORD *)buf = 138543874;
    v19 = self;
    __int16 v20 = 2114;
    v21 = v11;
    __int16 v22 = 2048;
    uint64_t v23 = v7;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ ending collaboration %{public}@ (cloudID = %lld)", buf, 0x20u);
  }
  if (!v9)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MPModelLibraryEndCollaborationChangeRequestOperation.m" lineNumber:29 description:@"Must provide a playlist in the library"];
  }
  v12 = +[MPCloudController sharedCloudController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke;
  v15[3] = &unk_1E57F5028;
  v15[4] = self;
  id v16 = v5;
  uint64_t v17 = v9;
  id v13 = v5;
  [v12 endCollaborationWithPersistentID:v9 completion:v15];
}

void __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
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
      uint64_t v36 = v8;
      __int16 v37 = 2048;
      uint64_t v38 = a2;
      __int16 v39 = 2114;
      v40 = v9;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "%{public}@ finished end collaboration request. new playlist cloud library ID = %lld error=%{public}@", buf, 0x20u);
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
      uint64_t v36 = v11;
      __int16 v37 = 2048;
      uint64_t v38 = a2;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ finished end collaboration request. new playlist cloud library ID = %lld", buf, 0x16u);
    }

    v12 = [MPIdentifierSet alloc];
    id v13 = +[MPModelPlaylistKind identityKind];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke_10;
    v29[3] = &unk_1E57F7AD0;
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    id v30 = v14;
    uint64_t v31 = v15;
    id v16 = [(MPIdentifierSet *)v12 initWithSource:@"StartCollaboration" modelKind:v13 block:v29];

    uint64_t v17 = [MPPropertySet alloc];
    v34[0] = @"MPModelPropertyPlaylistName";
    v34[1] = @"MPModelPropertyPlaylistIsCollaborative";
    v34[2] = @"MPModelPropertyPlaylistCollaborationSharingMode";
    v34[3] = @"MPModelPropertyPlaylistCollaborationMode";
    v34[4] = @"MPModelPropertyPlaylistCollaboratorPermissions";
    v34[5] = @"MPModelPropertyPlaylistCollaborationInvitationURL";
    v34[6] = @"MPModelPropertyPlaylistCollaboratorStatus";
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:7];
    v19 = [(MPPropertySet *)v17 initWithProperties:v18 relationships:MEMORY[0x1E4F1CC08]];

    __int16 v20 = +[MPModelSong kindWithVariants:3];
    v33 = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    __int16 v22 = +[MPModelPlaylistEntry kindWithKinds:v21];

    uint64_t v23 = +[MPModelPlaylist kindWithVariants:31 playlistEntryKind:v22 options:0];
    uint64_t v24 = objc_alloc_init(MPModelLibraryRequest);
    v25 = [NSString stringWithFormat:@"%@ loading new collaboration", *(void *)(a1 + 32)];
    [(MPModelRequest *)v24 setLabel:v25];

    [(MPModelRequest *)v24 setItemKind:v23];
    [(MPModelRequest *)v24 setItemProperties:v19];
    v32 = v16;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [(MPModelLibraryRequest *)v24 setAllowedItemIdentifiers:v26];

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke_3;
    v27[3] = &unk_1E57F9770;
    v27[4] = *(void *)(a1 + 32);
    id v28 = 0;
    [(MPModelLibraryRequest *)v24 performWithResponseHandler:v27];
  }
}

void __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke_10(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 library];
  v6 = [v5 databaseID];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke_2;
  v7[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v7[4] = *(void *)(a1 + 40);
  [v4 setLibraryIdentifiersWithDatabaseID:v6 block:v7];
}

void __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
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
      v12 = [*(id *)(*(void *)(a1 + 32) + 280) collaborationToEnd];
      id v13 = [v12 mergeWithObject:v11];

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

      uint64_t v17 = [*(id *)(a1 + 32) responseHandler];
      v18 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", 4, @"Failed to find updated playlist in library");
      ((void (**)(void, void, void *))v17)[2](v17, 0, v18);
    }
  }

  [*(id *)(a1 + 32) finish];
}

uint64_t __63__MPModelLibraryEndCollaborationChangeRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPersistentID:*(void *)(a1 + 32)];
}

@end