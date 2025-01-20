@interface MPModelLibraryRemoveCollaboratorsChangeRequestOperation
- (MPModelLibraryRemoveCollaboratorsChangeRequest)request;
- (id)responseHandler;
- (void)execute;
- (void)setRequest:(id)a3;
- (void)setResponseHandler:(id)a3;
@end

@implementation MPModelLibraryRemoveCollaboratorsChangeRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong(&self->_responseHandler, 0);
}

- (void)setRequest:(id)a3
{
}

- (MPModelLibraryRemoveCollaboratorsChangeRequest)request
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v4 = [(MPModelLibraryRemoveCollaboratorsChangeRequest *)self->_request collaboration];
  v5 = [v4 identifiers];
  v6 = [v5 universalStore];
  v7 = [v6 globalPlaylistID];

  v8 = [v5 library];
  uint64_t v9 = [v8 persistentID];

  v10 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(MPModelLibraryRemoveCollaboratorsChangeRequest *)self->_request socialProfileIDsToRemove];
    v12 = objc_msgSend(v11, "msv_compactDescription");
    *(_DWORD *)buf = 138544130;
    v24 = self;
    __int16 v25 = 2114;
    v26 = v4;
    __int16 v27 = 2114;
    v28 = v7;
    __int16 v29 = 2114;
    v30 = v12;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ removing collaborators from %{public}@ (globalPlaylistID = %{public}@); (%{public}@)",
      buf,
      0x2Au);
  }
  if (!v9
    || (-[MPModelLibraryRemoveCollaboratorsChangeRequest socialProfileIDsToRemove](self->_request, "socialProfileIDsToRemove"), v13 = objc_claimAutoreleasedReturnValue(), uint64_t v14 = [v13 count], v13, !v14))
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"MPModelLibraryRemoveCollaboratorsChangeRequestOperation.m" lineNumber:27 description:@"Must provide a playlist and social profile IDs to remove"];
  }
  v16 = +[MPCloudController sharedCloudController];
  v17 = [(MPModelLibraryRemoveCollaboratorsChangeRequest *)self->_request socialProfileIDsToRemove];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__MPModelLibraryRemoveCollaboratorsChangeRequestOperation_execute__block_invoke;
  v20[3] = &unk_1E57FA0C8;
  v20[4] = self;
  id v21 = v5;
  id v22 = v4;
  id v18 = v4;
  id v19 = v5;
  [v16 removeCollaborators:v17 fromCollaborationWithPersistentID:v9 completion:v20];
}

void __66__MPModelLibraryRemoveCollaboratorsChangeRequestOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = objc_msgSend(v3, "msv_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v6;
      __int16 v28 = 2114;
      __int16 v29 = v7;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "%{public}@ finished remove collaborators request error=%{public}@", buf, 0x16u);
    }
    v8 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, void, id))v8)[2](v8, 0, v3);

    [*(id *)(a1 + 32) finish];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v9;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ finished remove collaborators request", buf, 0xCu);
    }

    v10 = [MPPropertySet alloc];
    v25[0] = @"MPModelPropertyPlaylistName";
    v25[1] = @"MPModelPropertyPlaylistIsCollaborative";
    v25[2] = @"MPModelPropertyPlaylistCollaborationSharingMode";
    v25[3] = @"MPModelPropertyPlaylistCollaborationMode";
    v25[4] = @"MPModelPropertyPlaylistCollaboratorPermissions";
    v25[5] = @"MPModelPropertyPlaylistCollaborationInvitationURL";
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:6];
    v12 = [(MPPropertySet *)v10 initWithProperties:v11 relationships:MEMORY[0x1E4F1CC08]];

    v13 = +[MPModelSong kindWithVariants:3];
    v24 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    v15 = +[MPModelPlaylistEntry kindWithKinds:v14];

    v16 = +[MPModelPlaylist kindWithVariants:31 playlistEntryKind:v15 options:0];
    v17 = objc_alloc_init(MPModelLibraryRequest);
    id v18 = [NSString stringWithFormat:@"%@ loading updated playlist", *(void *)(a1 + 32)];
    [(MPModelRequest *)v17 setLabel:v18];

    [(MPModelRequest *)v17 setItemKind:v16];
    [(MPModelRequest *)v17 setItemProperties:v12];
    uint64_t v23 = *(void *)(a1 + 40);
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [(MPModelLibraryRequest *)v17 setAllowedItemIdentifiers:v19];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __66__MPModelLibraryRemoveCollaboratorsChangeRequestOperation_execute__block_invoke_15;
    v20[3] = &unk_1E57F8D68;
    v20[4] = *(void *)(a1 + 32);
    id v21 = 0;
    id v22 = *(id *)(a1 + 48);
    [(MPModelLibraryRequest *)v17 performWithResponseHandler:v20];
  }
}

void __66__MPModelLibraryRemoveCollaboratorsChangeRequestOperation_execute__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v16 = 138543618;
      uint64_t v17 = v7;
      __int16 v18 = 2114;
      uint64_t v19 = v8;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load new collaboration from library. err=%{public}@", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v9 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, void, id))v9)[2](v9, 0, v5);
  }
  else
  {
    uint64_t v9 = [a2 results];
    v10 = [v9 allItems];
    v11 = [v10 firstObject];

    if (v11)
    {
      v12 = [*(id *)(a1 + 48) mergeWithObject:v11];
      v13 = [*(id *)(a1 + 32) responseHandler];
      v13[2](v13, v12, 0);
    }
    else
    {
      uint64_t v14 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        int v16 = 138543362;
        uint64_t v17 = v15;
        _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find updated playlist in library", (uint8_t *)&v16, 0xCu);
      }

      v12 = [*(id *)(a1 + 32) responseHandler];
      objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", 4, @"Failed to find updated playlist in library");
      v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v13);
    }
  }
  [*(id *)(a1 + 32) finish];
}

@end