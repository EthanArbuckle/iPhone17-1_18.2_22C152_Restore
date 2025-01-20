@interface MPModelLibraryJoinCollaborationChangeRequestOperation
- (MPModelLibraryJoinCollaborationChangeRequest)request;
- (id)responseHandler;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryJoinCollaborationChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong(&self->_responseHandler, 0);
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibraryJoinCollaborationChangeRequest)request
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = [(MPModelLibraryJoinCollaborationChangeRequest *)self->_request collaborationToJoin];
  v5 = [v4 identifiers];

  v6 = [v5 universalStore];
  v7 = [v6 globalPlaylistID];

  v8 = [(MPModelLibraryJoinCollaborationChangeRequest *)self->_request invitationURL];
  v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(MPModelLibraryJoinCollaborationChangeRequest *)self->_request collaborationToJoin];
    *(_DWORD *)buf = 138543874;
    v18 = self;
    __int16 v19 = 2114;
    v20 = v10;
    __int16 v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ joining collaboration %{public}@ (globalPlaylistID = %{public}@)", buf, 0x20u);
  }
  if (v7) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MPModelLibraryJoinCollaborationChangeRequestOperation.m" lineNumber:29 description:@"Must have a non-nil playlistID and invitation URL"];
  }
  v12 = +[MPCloudController sharedCloudController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__MPModelLibraryJoinCollaborationChangeRequestOperation_execute__block_invoke;
  v15[3] = &unk_1E57F9798;
  v15[4] = self;
  id v16 = v5;
  id v13 = v5;
  [v12 joinCollaborationWithGlobalPlaylistID:v7 invitationURL:v8 completion:v15];
}

void __64__MPModelLibraryJoinCollaborationChangeRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = objc_msgSend(v5, "msv_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v35 = v8;
      __int16 v36 = 2048;
      uint64_t v37 = a2;
      __int16 v38 = 2114;
      v39 = v9;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "%{public}@ finished join collaboration request. new collaboration cloud library ID = %lld error=%{public}@", buf, 0x20u);
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
      uint64_t v35 = v11;
      __int16 v36 = 2048;
      uint64_t v37 = a2;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ finished join collaboration request. new collaboration cloud library ID = %lld", buf, 0x16u);
    }

    v12 = [MPPropertySet alloc];
    v33[0] = @"MPModelPropertyPlaylistName";
    v33[1] = @"MPModelPropertyPlaylistIsCollaborative";
    v33[2] = @"MPModelPropertyPlaylistCollaborationSharingMode";
    v33[3] = @"MPModelPropertyPlaylistCollaborationMode";
    v33[4] = @"MPModelPropertyPlaylistCollaboratorPermissions";
    v33[5] = @"MPModelPropertyPlaylistCollaborationInvitationURL";
    v33[6] = @"MPModelPropertyPlaylistUserEditableComponents";
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:7];
    v31 = @"MPModelRelationshipPlaylistCurator";
    v14 = [MPPropertySet alloc];
    v30[0] = @"MPModelPropertyPersonName";
    v30[1] = @"MPModelPropertyCuratorHandle";
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    id v16 = [(MPPropertySet *)v14 initWithProperties:v15 relationships:MEMORY[0x1E4F1CC08]];
    v32 = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v18 = [(MPPropertySet *)v12 initWithProperties:v13 relationships:v17];

    __int16 v19 = +[MPModelSong kindWithVariants:3];
    v29 = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    __int16 v21 = +[MPModelPlaylistEntry kindWithKinds:v20];

    v22 = +[MPModelPlaylist kindWithVariants:31 playlistEntryKind:v21 options:0];
    uint64_t v23 = objc_alloc_init(MPModelLibraryRequest);
    v24 = [NSString stringWithFormat:@"%@ loading new collaboration", *(void *)(a1 + 32)];
    [(MPModelRequest *)v23 setLabel:v24];

    [(MPModelRequest *)v23 setItemKind:v22];
    [(MPModelRequest *)v23 setItemProperties:v18];
    uint64_t v28 = *(void *)(a1 + 40);
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    [(MPModelLibraryRequest *)v23 setAllowedItemIdentifiers:v25];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __64__MPModelLibraryJoinCollaborationChangeRequestOperation_execute__block_invoke_16;
    v26[3] = &unk_1E57F9770;
    v26[4] = *(void *)(a1 + 32);
    id v27 = 0;
    [(MPModelLibraryRequest *)v23 performWithResponseHandler:v26];
  }
}

void __64__MPModelLibraryJoinCollaborationChangeRequestOperation_execute__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v19 = 138543618;
      uint64_t v20 = v7;
      __int16 v21 = 2114;
      uint64_t v22 = v8;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load new collaboration from library. err=%{public}@", (uint8_t *)&v19, 0x16u);
    }

    v9 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, void, id))v9)[2](v9, 0, v5);
  }
  else
  {
    v9 = [a2 results];
    v10 = [v9 allItems];
    uint64_t v11 = [v10 firstObject];

    if (v11)
    {
      v12 = [*(id *)(*(void *)(a1 + 32) + 280) collaborationToJoin];
      id v13 = [v12 mergeWithObject:v11];

      v14 = [*(id *)(a1 + 32) responseHandler];
      ((void (**)(void, void *, void))v14)[2](v14, v13, 0);
    }
    else
    {
      v15 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        int v19 = 138543362;
        uint64_t v20 = v16;
        _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find new collaboration in library", (uint8_t *)&v19, 0xCu);
      }

      v17 = [*(id *)(a1 + 32) responseHandler];
      v18 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", 4, @"Failed to find new collaboration in library");
      ((void (**)(void, void, void *))v17)[2](v17, 0, v18);
    }
  }

  [*(id *)(a1 + 32) finish];
}

@end