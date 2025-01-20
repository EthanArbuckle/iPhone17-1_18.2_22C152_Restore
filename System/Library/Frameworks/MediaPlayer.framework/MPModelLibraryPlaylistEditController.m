@interface MPModelLibraryPlaylistEditController
- (BOOL)addInsertedTracksToLibrary;
- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3;
- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlist:(id)a4;
- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlist:(id)a4 initialTrackList:(id)a5 playlistEntryProperties:(id)a6;
- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlist:(id)a4 playlistEntryProperties:(id)a5;
- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlist:(id)a4 playlistEntryProperties:(id)a5 authorProfile:(id)a6;
- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlistEntryProperties:(id)a4;
- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlistEntryProperties:(id)a4 authorProfile:(id)a5;
- (MPModelPlaylist)parentPlaylist;
- (MPSectionedCollection)currentTrackList;
- (NSNumber)isCuratorPlaylist;
- (NSNumber)isPublicPlaylist;
- (NSNumber)isVisiblePlaylist;
- (NSString)coverArtworkRecipe;
- (NSString)descriptionText;
- (NSString)name;
- (UIImage)userImage;
- (id)_defaultPlaylistEntryPropertySet;
- (id)_initWithLibrary:(id)a3 playlist:(id)a4 initialTrackList:(id)a5 playlistEntryProperties:(id)a6 authorProfile:(id)a7;
- (id)_itemIdentifierForIndexPath:(id)a3 usingExclusiveAccessToken:(id)a4;
- (id)_newDataSourceForModelObjects:(id)a3;
- (id)_sectionIdentifierForItemIdentifier:(id)a3;
- (id)debugDescriptionForItem:(id)a3 inSection:(id)a4;
- (void)_createTrackIdentifierListWithInitialEntries:(id)a3 completion:(id)a4;
- (void)_resolveTrackListWithCompletion:(id)a3;
- (void)appendItem:(id)a3 completion:(id)a4;
- (void)appendItems:(id)a3 completion:(id)a4;
- (void)beginEditingWithCompletion:(id)a3;
- (void)commitWithCompletion:(id)a3;
- (void)insertItem:(id)a3 afterEntry:(id)a4 completion:(id)a5;
- (void)insertItem:(id)a3 atIndexPath:(id)a4 completion:(id)a5;
- (void)insertItemAtStart:(id)a3 completion:(id)a4;
- (void)insertItems:(id)a3 afterEntry:(id)a4 completion:(id)a5;
- (void)insertItems:(id)a3 atIndexPath:(id)a4 completion:(id)a5;
- (void)insertItemsAtStart:(id)a3 completion:(id)a4;
- (void)moveEntry:(id)a3 afterEntry:(id)a4;
- (void)moveEntryToStart:(id)a3;
- (void)moveItemFromIndexPath:(id)a3 toIndexPath:(id)a4;
- (void)removeEntries:(id)a3;
- (void)removeEntry:(id)a3;
- (void)removeItemAtIndexPath:(id)a3;
- (void)sectionedIdentifierList:(id)a3 dataSourceDidChangeItems:(id)a4 inSection:(id)a5;
- (void)setAddInsertedTracksToLibrary:(BOOL)a3;
- (void)setCoverArtworkRecipe:(id)a3;
- (void)setCuratorPlaylist:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setInitialTrackList:(id)a3;
- (void)setName:(id)a3;
- (void)setParentPlaylist:(id)a3;
- (void)setPublicPlaylist:(id)a3;
- (void)setUserImage:(id)a3;
- (void)setVisiblePlaylist:(id)a3;
@end

@implementation MPModelLibraryPlaylistEditController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverArtworkRecipe, 0);
  objc_storeStrong((id *)&self->_curatorPlaylist, 0);
  objc_storeStrong((id *)&self->_visiblePlaylist, 0);
  objc_storeStrong((id *)&self->_publicPlaylist, 0);
  objc_storeStrong((id *)&self->_newUserImage, 0);
  objc_storeStrong((id *)&self->_newParentPlaylist, 0);
  objc_storeStrong((id *)&self->_newDescriptionText, 0);
  objc_storeStrong((id *)&self->_newName, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_authorProfile, 0);
  objc_storeStrong((id *)&self->_playlistEntryProperties, 0);
  objc_storeStrong((id *)&self->_trackIdentifierList, 0);
  objc_storeStrong((id *)&self->_initialDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_initialTrackList, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_playlist, 0);
}

- (void)setAddInsertedTracksToLibrary:(BOOL)a3
{
  self->_addInsertedTracksToLibrary = a3;
}

- (BOOL)addInsertedTracksToLibrary
{
  return self->_addInsertedTracksToLibrary;
}

- (void)_resolveTrackListWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MPModelLibraryPlaylistEditController *)self currentTrackList];
  v6 = objc_alloc_init(MPMutableSectionedCollection);
  [(MPMutableSectionedCollection *)v6 appendSection:&stru_1EE680640];
  v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "totalItemCount"));
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke;
  v18[3] = &unk_1E57F35F8;
  v18[4] = self;
  id v8 = v5;
  id v19 = v8;
  v9 = v6;
  v20 = v9;
  id v10 = v7;
  id v21 = v10;
  [v8 enumerateItemIdentifiersUsingBlock:v18];
  if ([(MPSectionedCollection *)v9 totalItemCount])
  {
    v11 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(MPSectionedCollection *)v9 totalItemCount];
      *(_DWORD *)buf = 138543874;
      v23 = self;
      __int16 v24 = 2048;
      uint64_t v25 = v12;
      __int16 v26 = 2114;
      v27 = v9;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Importing %ld non-library tracks: %{public}@", buf, 0x20u);
    }

    v13 = objc_alloc_init(MPModelLibraryImportChangeRequest);
    [(MPModelLibraryImportChangeRequest *)v13 setReferralObject:self->_playlist];
    [(MPModelLibraryImportChangeRequest *)v13 setModelObjects:v9];
    [(MPModelLibraryImportChangeRequest *)v13 setShouldLibraryAdd:self->_addInsertedTracksToLibrary];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_77;
    v14[3] = &unk_1E57F3698;
    v14[4] = self;
    id v17 = v4;
    id v15 = v8;
    id v16 = v10;
    [(MPModelLibraryImportChangeRequest *)v13 performWithResponseHandler:v14];
  }
  else
  {
    (*((void (**)(id, id, void))v4 + 2))(v4, v8, 0);
  }
}

void __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  v6 = [v5 library];
  uint64_t v7 = [v6 containedPersistentID];

  if (!v7)
  {
    int v9 = 1;
    goto LABEL_8;
  }
  id v8 = [v5 library];
  if ([v8 persistentID])
  {
    int v9 = 0;
  }
  else
  {
    int v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 152);

    if (!v9) {
      goto LABEL_8;
    }
    id v8 = [*(id *)(*(void *)(a1 + 32) + 16) itemWithPersistentID:v7 verifyExistence:0];
    id v10 = [v8 valueForProperty:@"isInMyLibrary"];
    int v9 = [v10 BOOLValue] ^ 1;
  }
LABEL_8:
  v11 = [*(id *)(a1 + 40) itemAtIndexPath:v16];
  uint64_t v12 = v11;
  if (v9)
  {
    v13 = *(void **)(a1 + 48);
    v14 = [v11 anyObject];
    [v13 appendItem:v14];
  }
  else
  {
    id v15 = *(void **)(a1 + 56);
    v14 = [v11 universalIdentifier];
    [v15 setObject:v12 forKey:v14];
  }
}

void __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v8;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed to import non-library tracks. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    int v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_78;
    v24[3] = &unk_1E57F3620;
    id v10 = v9;
    uint64_t v11 = *(void *)(a1 + 32);
    id v25 = v10;
    uint64_t v26 = v11;
    [v5 enumerateObjectsUsingBlock:v24];
    uint64_t v12 = objc_alloc_init(MPMutableSectionedCollection);
    v13 = v12;
    if (*(void *)(*(void *)(a1 + 32) + 8)) {
      v14 = *(__CFString **)(*(void *)(a1 + 32) + 8);
    }
    else {
      v14 = &stru_1EE680640;
    }
    [(MPMutableSectionedCollection *)v12 appendSection:v14];
    id v15 = *(void **)(a1 + 40);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_80;
    v18[3] = &unk_1E57F3670;
    id v19 = v15;
    id v20 = *(id *)(a1 + 48);
    id v21 = v10;
    uint64_t v22 = *(void *)(a1 + 32);
    v23 = v13;
    id v16 = v13;
    id v17 = v10;
    [v19 enumerateItemIdentifiersUsingBlock:v18];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 identifiers];
  id v5 = [v4 universalStore];
  uint64_t v6 = [v5 subscriptionAdamID];
  if (v6)
  {
    uint64_t v7 = v6;

LABEL_4:
    int v9 = *(void **)(a1 + 32);
    id v10 = [NSNumber numberWithLongLong:v7];
    [v9 setObject:v3 forKey:v10];
    goto LABEL_5;
  }
  uint64_t v8 = [v4 universalStore];
  uint64_t v7 = [v8 adamID];

  if (v7) {
    goto LABEL_4;
  }
  id v10 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138543874;
    uint64_t v13 = v11;
    __int16 v14 = 2114;
    id v15 = v3;
    __int16 v16 = 2114;
    id v17 = v4;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Imported non-library track missing store ID. obj=%{public}@, identifiers=%{public}@", (uint8_t *)&v12, 0x20u);
  }
LABEL_5:
}

void __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_80(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) itemAtIndexPath:a2];
  uint64_t v7 = [v6 anyObject];
  uint64_t v8 = [v7 identifiers];

  int v9 = *(void **)(a1 + 40);
  id v10 = [v6 universalIdentifier];
  uint64_t v11 = [v9 objectForKey:v10];

  if (!v11)
  {
    int v12 = [v8 universalStore];
    uint64_t v13 = [v12 subscriptionAdamID];

    if (!v13) {
      goto LABEL_15;
    }
    __int16 v14 = *(void **)(a1 + 48);
    id v15 = NSNumber;
    __int16 v16 = [v8 universalStore];
    id v17 = objc_msgSend(v15, "numberWithLongLong:", objc_msgSend(v16, "subscriptionAdamID"));
    uint64_t v18 = [v14 objectForKeyedSubscript:v17];

    if (!v18)
    {
LABEL_15:
      id v19 = [v8 universalStore];
      uint64_t v20 = [v19 adamID];

      if (!v20) {
        goto LABEL_11;
      }
      id v21 = *(void **)(a1 + 48);
      uint64_t v22 = NSNumber;
      v23 = [v8 universalStore];
      __int16 v24 = objc_msgSend(v22, "numberWithLongLong:", objc_msgSend(v23, "adamID"));
      uint64_t v18 = [v21 objectForKeyedSubscript:v24];

      if (!v18)
      {
LABEL_11:
        uint64_t v11 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 138543874;
          uint64_t v35 = v29;
          __int16 v36 = 2114;
          v37 = v6;
          __int16 v38 = 2114;
          id v39 = v5;
          _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Couldn't match playlist entry to imported objects. entry=%{public}@, identifiers=%{public}@", buf, 0x20u);
        }
        goto LABEL_3;
      }
    }
    id v25 = [MPModelPlaylistEntry alloc];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_81;
    v30[3] = &unk_1E57F3648;
    id v26 = v6;
    uint64_t v27 = *(void *)(a1 + 56);
    id v31 = v26;
    uint64_t v32 = v27;
    id v33 = v18;
    id v28 = v18;
    uint64_t v11 = [(MPModelObject *)v25 initWithIdentifiers:v5 block:v30];

    if (!v11) {
      goto LABEL_4;
    }
  }
  [*(id *)(a1 + 64) appendItem:v11];
LABEL_3:

LABEL_4:
}

void __72__MPModelLibraryPlaylistEditController__resolveTrackListWithCompletion___block_invoke_81(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) universalIdentifier];
  [v3 setUniversalIdentifier:v4];

  id v5 = [*(id *)(a1 + 32) positionUniversalIdentifier];
  [v3 setPositionUniversalIdentifier:v5];

  [v3 setSocialContributor:*(void *)(*(void *)(a1 + 40) + 56)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [*(id *)(a1 + 32) song];
    uint64_t v7 = [v6 mergeWithObject:*(void *)(a1 + 48)];
    [v3 setSong:v7];
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [*(id *)(a1 + 32) tvEpisode];
    uint64_t v7 = [v6 mergeWithObject:*(void *)(a1 + 48)];
    [v3 setTvEpisode:v7];
    goto LABEL_5;
  }
  uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Unsupported model object %{public}@", (uint8_t *)&v10, 0x16u);
  }
LABEL_6:
}

- (id)_defaultPlaylistEntryPropertySet
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v2 = [MPPropertySet alloc];
  v24[0] = @"MPModelPropertyPersonName";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  id v4 = [(MPPropertySet *)v2 initWithProperties:v3 relationships:0];

  id v5 = [MPPropertySet alloc];
  v23[0] = @"MPModelPropertySongTitle";
  v23[1] = @"MPModelPropertySongArtwork";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  id v21 = @"MPModelRelationshipSongArtist";
  uint64_t v22 = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  uint64_t v8 = [(MPPropertySet *)v5 initWithProperties:v6 relationships:v7];

  uint64_t v9 = [MPPropertySet alloc];
  v20[0] = @"MPModelPropertyPersonName";
  v20[1] = @"MPModelPropertySocialPersonHandle";
  v20[2] = @"MPModelPropertySocialPersonArtwork";
  v20[3] = @"MPModelPropertySocialPersonHasLightweightProfile";
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  uint64_t v11 = [(MPPropertySet *)v9 initWithProperties:v10 relationships:0];

  __int16 v12 = [MPPropertySet alloc];
  v19[0] = @"MPModelPropertyPlaylistEntryUniversalIdentifier";
  v19[1] = @"MPModelPropertyPlaylistEntryPositionUniversalIdentifier";
  v19[2] = @"MPModelPropertyPlaylistEntryPosition";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v17[0] = @"MPModelRelationshipPlaylistEntrySong";
  v17[1] = @"MPModelRelationshipPlaylistEntrySocialContributor";
  v18[0] = v8;
  v18[1] = v11;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v15 = [(MPPropertySet *)v12 initWithProperties:v13 relationships:v14];

  return v15;
}

- (id)_sectionIdentifierForItemIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__28132;
  __int16 v16 = __Block_byref_object_dispose__28133;
  id v17 = 0;
  id v5 = [(MPSectionedIdentifierList *)self->_trackIdentifierList allSectionIdentifiers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__MPModelLibraryPlaylistEditController__sectionIdentifierForItemIdentifier___block_invoke;
  v9[3] = &unk_1E57F35C8;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __76__MPModelLibraryPlaylistEditController__sectionIdentifierForItemIdentifier___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (objc_msgSend(*(id *)(a1[4] + 40), "hasItem:inSection:", a1[5]))
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)_newDataSourceForModelObjects:(id)a3
{
  id v5 = a3;
  id v6 = [(MPModelLibraryPlaylistEditController *)self _defaultPlaylistEntryPropertySet];
  id v7 = [v6 propertySetByCombiningWithPropertySet:self->_playlistEntryProperties];

  uint64_t v8 = [v5 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [[MPModelLibraryPlaylistEditTrackDataSource alloc] initWithTrackObjects:v5];
  }
  else
  {
    uint64_t v12 = [v5 firstObject];
    objc_opt_class();
    char v13 = objc_opt_isKindOfClass();

    if (v13)
    {
      uint64_t v14 = [MPModelLibraryPlaylistEditPlaylistDataSource alloc];
      library = self->_library;
      __int16 v16 = [v5 firstObject];
      uint64_t v11 = [(MPModelLibraryPlaylistEditPlaylistDataSource *)v14 initWithLibrary:library playlist:v16 initialTrackList:0 playlistEntryProperties:v7];

      goto LABEL_11;
    }
    id v17 = [v5 firstObject];
    objc_opt_class();
    char v18 = objc_opt_isKindOfClass();

    if (v18)
    {
      id v19 = [v7 relationships];
      uint64_t v20 = [v19 objectForKey:@"MPModelRelationshipPlaylistEntrySong"];

      id v21 = [MPModelLibraryPlaylistEditAlbumDataSource alloc];
      uint64_t v22 = self->_library;
      v23 = [v5 firstObject];
      uint64_t v11 = [(MPModelLibraryPlaylistEditAlbumDataSource *)v21 initWithLibrary:v22 album:v23 trackProperties:v20];

      goto LABEL_11;
    }
    __int16 v24 = [v5 firstObject];
    objc_opt_class();
    char v25 = objc_opt_isKindOfClass();

    if ((v25 & 1) == 0)
    {
      id v26 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v27 = [v5 firstObject];
      [v26 handleFailureInMethod:a2, self, @"MPModelLibraryPlaylistEditController.m", 612, @"Unsupported model object %@", v27 object file lineNumber description];

      uint64_t v11 = 0;
      goto LABEL_11;
    }
    id v10 = [[MPModelLibraryPlaylistEditPlaylistEntryDataSource alloc] initWithPlaylistEntries:v5];
  }
  uint64_t v11 = (MPModelLibraryPlaylistEditPlaylistDataSource *)v10;
LABEL_11:
  [(MPModelLibraryPlaylistEditDataSource *)v11 setAuthorProfile:self->_authorProfile];

  return v11;
}

- (id)_itemIdentifierForIndexPath:(id)a3 usingExclusiveAccessToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 item];
  id v10 = [(MPSectionedIdentifierList *)self->_trackIdentifierList enumeratorWithOptions:0x1000000 startPosition:0 endPosition:0 withExclusiveAccessToken:v8];
  uint64_t v11 = [v10 nextObjectWithExclusiveAccessToken:v8];
  if (!v11) {
    goto LABEL_7;
  }
  uint64_t v12 = 0;
  while ([v11 entryType] != 3)
  {
LABEL_6:
    uint64_t v15 = [v10 nextObjectWithExclusiveAccessToken:v8];

    uint64_t v11 = (void *)v15;
    if (!v15) {
      goto LABEL_7;
    }
  }
  char v13 = [v11 itemResult];
  uint64_t v14 = [v13 itemIdentifier];

  if (v12 != v9)
  {
    ++v12;

    goto LABEL_6;
  }
  if (!v14)
  {
LABEL_7:
    __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MPModelLibraryPlaylistEditController.m", 591, @"Invalid index path %@", v7 object file lineNumber description];

    uint64_t v14 = 0;
  }

  return v14;
}

- (void)_createTrackIdentifierListWithInitialEntries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSMutableDictionary *)self->_dataSources removeAllObjects];
  id v8 = [[MPSectionedIdentifierList alloc] initWithIdentifier:@"MPModelLibraryPlaylistEditControllerLibrarySectionIdentifierName"];
  trackIdentifierList = self->_trackIdentifierList;
  self->_trackIdentifierList = v8;

  [(MPSectionedIdentifierList *)self->_trackIdentifierList setDelegate:self];
  [(MPSectionedIdentifierList *)self->_trackIdentifierList setAnnotationDelegate:self];
  if (self->_playlist)
  {
    id v10 = [(MPModelLibraryPlaylistEditController *)self _defaultPlaylistEntryPropertySet];
    uint64_t v11 = [v10 propertySetByCombiningWithPropertySet:self->_playlistEntryProperties];

    uint64_t v12 = [[MPModelLibraryPlaylistEditPlaylistDataSource alloc] initWithLibrary:self->_library playlist:self->_playlist initialTrackList:v6 playlistEntryProperties:v11];
    char v13 = [(MPModelLibraryPlaylistEditDataSource *)v12 identifier];
    initialDataSourceIdentifier = self->_initialDataSourceIdentifier;
    self->_initialDataSourceIdentifier = v13;

    [(NSMutableDictionary *)self->_dataSources setObject:v12 forKey:self->_initialDataSourceIdentifier];
    objc_initWeak(&location, self);
    __int16 v16 = self->_initialDataSourceIdentifier;
    uint64_t v15 = self->_trackIdentifierList;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __96__MPModelLibraryPlaylistEditController__createTrackIdentifierListWithInitialEntries_completion___block_invoke;
    v17[3] = &unk_1E57F8430;
    objc_copyWeak(&v19, &location);
    id v18 = v7;
    [(MPSectionedIdentifierList *)v15 addDataSourceAtStart:v12 section:v16 completion:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __96__MPModelLibraryPlaylistEditController__createTrackIdentifierListWithInitialEntries_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    id v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543618;
      id v7 = WeakRetained;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to add playlist data source. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidChangeItems:(id)a4 inSection:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Datasource %{public}@ changed - posting notification", (uint8_t *)&v9, 0x16u);
  }

  __int16 v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"MPModelLibraryPlaylistEditControllerDidChangeNotification" object:self];
}

- (id)debugDescriptionForItem:(id)a3 inSection:(id)a4
{
  id v6 = a3;
  id v7 = [(MPModelLibraryPlaylistEditController *)self _sectionIdentifierForItemIdentifier:v6];
  __int16 v8 = [(NSMutableDictionary *)self->_dataSources objectForKeyedSubscript:v7];
  if (!v8)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"MPModelLibraryPlaylistEditController.m", 517, @"No data source for item identifier %@", v6 object file lineNumber description];
  }
  int v9 = [v8 playlistEntriesByIdentifier];
  uint64_t v10 = [v9 objectForKeyedSubscript:v6];
  if ([v10 hasLoadedValueForKey:@"MPModelPropertyPlaylistEntryPositionUniversalIdentifier"])
  {
    __int16 v11 = [v10 positionUniversalIdentifier];
    if (v10) {
      goto LABEL_5;
    }
LABEL_9:
    id v18 = 0;
    goto LABEL_12;
  }
  __int16 v11 = &stru_1EE680640;
  if (!v10) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v12 = [v10 song];
  if (v12
    && (uint64_t v13 = (void *)v12,
        [v10 song],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 hasLoadedValueForKey:@"MPModelPropertySongTitle"],
        v14,
        v13,
        v15))
  {
    __int16 v16 = [v10 song];
    uint64_t v17 = [v16 title];
  }
  else
  {
    __int16 v16 = [v10 anyObject];
    uint64_t v17 = [(id)objc_opt_class() description];
  }
  id v18 = (void *)v17;

LABEL_12:
  id v19 = [NSString stringWithFormat:@"(%@; %@)", v18, v11];

  return v19;
}

- (void)commitWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(MPSectionedIdentifierList *)self->_trackIdentifierList setDelegate:0];
  id v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(MPSectionedIdentifierList *)self->_trackIdentifierList debugDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    int v15 = v7;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Committing playlist with track list: %{public}@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke;
  v9[3] = &unk_1E57F35A0;
  v9[4] = self;
  id v10 = v5;
  SEL v11 = a2;
  id v8 = v5;
  [(MPModelLibraryPlaylistEditController *)self _resolveTrackListWithCompletion:v9];
}

void __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[4];
      *(_DWORD *)buf = 138543618;
      uint64_t v56 = v7;
      __int16 v57 = 2114;
      id v58 = v5;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to resolve track list. err = %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1[4] + 40), "setDelegate:");
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    id v8 = (void *)[a2 mutableCopy];
    int v9 = [MEMORY[0x1E4F1CA60] dictionary];
    id v10 = &unk_195689000;
    if ([*(id *)(a1[4] + 8) isCollaborative])
    {
      SEL v11 = [MEMORY[0x1E4F1C978] array];
      uint64_t v12 = a1[4];
      if (*(void *)(v12 + 32))
      {
        uint64_t v13 = objc_msgSend(*(id *)(v12 + 72), "objectForKeyedSubscript:");
        if (!v13)
        {
          v34 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], *(void *)(a1[4] + 32));
        }
        uint64_t v14 = [v13 playlistEntries];

        SEL v11 = (void *)v14;
      }
      int v15 = [v8 allItems];
      uint64_t v16 = [v11 count];
      uint64_t v17 = [v15 count];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_29;
      v52[3] = &unk_1E57F4E00;
      id v18 = v11;
      id v53 = v18;
      id v19 = v15;
      id v54 = v19;
      uint64_t v20 = +[MPChangeDetails changeDetailsWithPreviousCount:v16 finalCount:v17 isEqualBlock:v52 isUpdatedBlock:&__block_literal_global_28170];
      id v21 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = a1[4];
        v23 = [v20 debugDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v56 = v22;
        __int16 v57 = 2114;
        id v58 = v23;
        _os_log_impl(&dword_1952E8000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ calculated track list changes %{public}@", buf, 0x16u);
      }
      __int16 v24 = [v20 deletedIndexes];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_31;
      v48[3] = &unk_1E57F3550;
      id v49 = v18;
      id v25 = v9;
      uint64_t v26 = a1[4];
      id v50 = v25;
      uint64_t v51 = v26;
      id v27 = v18;
      [v24 enumerateIndexesUsingBlock:v48];

      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_33;
      v43[3] = &unk_1E57F4198;
      uint64_t v47 = a1[6];
      uint64_t v28 = a1[4];
      id v44 = v19;
      uint64_t v45 = v28;
      id v46 = v8;
      id v29 = v19;
      [v20 enumerateMovesUsingBlock:v43];

      id v10 = (void *)&unk_195689000;
    }
    else
    {
      uint64_t v20 = 0;
    }
    id v30 = objc_alloc_init(MPModelLibraryPlaylistEditChangeRequest);
    [(MPModelLibraryPlaylistEditChangeRequest *)v30 setMediaLibrary:*(void *)(a1[4] + 16)];
    [(MPModelLibraryPlaylistEditChangeRequest *)v30 setPlaylistName:*(void *)(a1[4] + 88)];
    [(MPModelLibraryPlaylistEditChangeRequest *)v30 setPlaylistDescription:*(void *)(a1[4] + 96)];
    [(MPModelLibraryPlaylistEditChangeRequest *)v30 setPlaylistUserImage:*(void *)(a1[4] + 112)];
    [(MPModelLibraryPlaylistEditChangeRequest *)v30 setShouldCreatePlaylist:*(void *)(a1[4] + 8) == 0];
    [(MPModelLibraryPlaylistEditChangeRequest *)v30 setPlaylist:*(void *)(a1[4] + 8)];
    [(MPModelLibraryPlaylistEditChangeRequest *)v30 setPlaylistEntries:v8];
    [(MPModelLibraryPlaylistEditChangeRequest *)v30 setPublicPlaylist:*(void *)(a1[4] + 120)];
    [(MPModelLibraryPlaylistEditChangeRequest *)v30 setVisiblePlaylist:*(void *)(a1[4] + 128)];
    [(MPModelLibraryPlaylistEditChangeRequest *)v30 setCuratorPlaylist:*(void *)(a1[4] + 136)];
    [(MPModelLibraryPlaylistEditChangeRequest *)v30 setCoverArtworkRecipe:*(void *)(a1[4] + 144)];
    [(MPModelLibraryPlaylistEditChangeRequest *)v30 setTrackListChanges:v20];
    [(MPModelLibraryPlaylistEditChangeRequest *)v30 setDeletedEntryUUIDs:v9];
    uint64_t v36 = MEMORY[0x1E4F143A8];
    uint64_t v37 = v10[142];
    __int16 v38 = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_2_43;
    id v39 = &unk_1E57F3578;
    id v31 = (void *)a1[5];
    uint64_t v40 = a1[4];
    id v41 = v8;
    id v42 = v31;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = v37;
    v35[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_46;
    v35[3] = &unk_1E57F3FD8;
    v35[4] = a1[4];
    id v32 = v8;
    id v33 = [(MPModelLibraryPlaylistEditChangeRequest *)v30 newOperationWithLocalPersistenceResponseHandler:&v36 completeResponseHandler:v35];
    [*(id *)(a1[4] + 64) addOperation:v33];
  }
}

uint64_t __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_29(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) objectAtIndex:a2];
  id v6 = [*(id *)(a1 + 40) objectAtIndex:a3];
  uint64_t v7 = [v5 universalIdentifier];
  id v8 = [v6 universalIdentifier];
  if (v7 == v8) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = [v7 isEqual:v8];
  }

  return v9;
}

void __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_31(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) objectAtIndex:a2];
  id v5 = [v4 universalIdentifier];
  if (v5)
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:a2];
    [v6 setObject:v5 forKey:v7];
  }
  else
  {
    id v8 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2048;
      uint64_t v13 = a2;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "%{public}@ no UUID for deleted entry at position %lu", (uint8_t *)&v10, 0x16u);
    }
  }
}

void __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_33(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
  if (!v6)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 40), @"MPModelLibraryPlaylistEditController.m", 456, @"No playlist entry at moved index %lu", a3);
  }
  uint64_t v7 = [v6 positionUniversalIdentifier];
  id v8 = (void *)[MEMORY[0x1E4FB85D0] newIdentifierString];
  uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a2;
    __int16 v20 = 2048;
    uint64_t v21 = a3;
    __int16 v22 = 2114;
    v23 = v7;
    __int16 v24 = 2114;
    id v25 = v8;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ updating position UUID for entry moved from %lu --> %lu; %{public}@ --> %{public}@",
      buf,
      0x34u);
  }

  uint64_t v11 = [v6 identifiers];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_38;
  v17[3] = &unk_1E57F4AB8;
  id v18 = v8;
  id v12 = v8;
  uint64_t v13 = (void *)[v6 copyWithIdentifiers:v11 block:v17];

  *(void *)buf = 0;
  *(void *)&buf[8] = a3;
  uint64_t v14 = *(void **)(a1 + 48);
  int v15 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:buf length:2];
  [v14 replaceObjectAtIndexPath:v15 withObject:v13];
}

void __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_2_43(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = objc_msgSend(v5, "msv_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v9;
      __int16 v20 = 2114;
      uint64_t v21 = v10;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Finished committing new playlist error=%{public}@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setDelegate:");
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v11;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished committing new playlist", buf, 0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (!*(void *)(v12 + 8))
    {
      objc_storeStrong((id *)(v12 + 8), a3);
      uint64_t v12 = *(void *)(a1 + 32);
    }
    objc_storeStrong((id *)(v12 + 24), *(id *)(a1 + 40));
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_44;
    v15[3] = &unk_1E57F43B0;
    v15[4] = v13;
    id v17 = *(id *)(a1 + 48);
    id v16 = v6;
    [v13 _createTrackIdentifierListWithInitialEntries:v14 completion:v15];
  }
}

void __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = objc_msgSend(v3, "msv_description");
      int v9 = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Change operation completed error=%{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Change operation completed", (uint8_t *)&v9, 0xCu);
  }
}

void __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = objc_msgSend(v3, "msv_description");
      int v9 = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Reset datasource to updated track list. error=%{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Reset datasource to updated track list.", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_38(uint64_t a1, void *a2)
{
  return [a2 setPositionUniversalIdentifier:*(void *)(a1 + 32)];
}

uint64_t __61__MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke_2()
{
  return 0;
}

- (void)removeEntries:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v20 = self;
    __int16 v21 = 2114;
    id v22 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing entries %{public}@", buf, 0x16u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "universalIdentifier", (void)v14);
        uint64_t v12 = [(MPModelLibraryPlaylistEditController *)self _sectionIdentifierForItemIdentifier:v11];
        [(MPSectionedIdentifierList *)self->_trackIdentifierList removeItem:v11 fromSection:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 postNotificationName:@"MPModelLibraryPlaylistEditControllerDidChangeNotification" object:self];
}

- (void)removeEntry:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing entry %{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v6 = [v4 universalIdentifier];
  uint64_t v7 = [(MPModelLibraryPlaylistEditController *)self _sectionIdentifierForItemIdentifier:v6];
  [(MPSectionedIdentifierList *)self->_trackIdentifierList removeItem:v6 fromSection:v7];
  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"MPModelLibraryPlaylistEditControllerDidChangeNotification" object:self];
}

- (void)moveEntryToStart:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ moving entry to start %{public}@", (uint8_t *)&v9, 0x16u);
  }

  id v6 = [v4 universalIdentifier];
  uint64_t v7 = [(MPModelLibraryPlaylistEditController *)self _sectionIdentifierForItemIdentifier:v6];
  [(MPSectionedIdentifierList *)self->_trackIdentifierList moveItemToStart:v6 fromSection:v7];
  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"MPModelLibraryPlaylistEditControllerDidChangeNotification" object:self];
}

- (void)moveEntry:(id)a3 afterEntry:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543874;
    long long v15 = self;
    __int16 v16 = 2114;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ moving entry %{public}@ after entry %{public}@", (uint8_t *)&v14, 0x20u);
  }

  int v9 = [v6 universalIdentifier];
  uint64_t v10 = [v7 universalIdentifier];
  __int16 v11 = [(MPModelLibraryPlaylistEditController *)self _sectionIdentifierForItemIdentifier:v9];
  id v12 = [(MPModelLibraryPlaylistEditController *)self _sectionIdentifierForItemIdentifier:v10];
  [(MPSectionedIdentifierList *)self->_trackIdentifierList moveItem:v9 fromSection:v11 afterItem:v10 inSection:v12];
  uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 postNotificationName:@"MPModelLibraryPlaylistEditControllerDidChangeNotification" object:self];
}

- (void)removeItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__28132;
  __int16 v16 = __Block_byref_object_dispose__28133;
  id v17 = 0;
  trackIdentifierList = self->_trackIdentifierList;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__MPModelLibraryPlaylistEditController_removeItemAtIndexPath___block_invoke;
  v9[3] = &unk_1E57F6C20;
  __int16 v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [(MPSectionedIdentifierList *)trackIdentifierList performWithExclusiveAccess:v9];
  id v7 = [(MPModelLibraryPlaylistEditController *)self _sectionIdentifierForItemIdentifier:v13[5]];
  [(MPSectionedIdentifierList *)self->_trackIdentifierList removeItem:v13[5] fromSection:v7];
  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"MPModelLibraryPlaylistEditControllerDidChangeNotification" object:self];

  _Block_object_dispose(&v12, 8);
}

void __62__MPModelLibraryPlaylistEditController_removeItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _itemIdentifierForIndexPath:*(void *)(a1 + 40) usingExclusiveAccessToken:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)moveItemFromIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 item];
  if (v8 != [v7 item])
  {
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy__28132;
    uint64_t v28 = __Block_byref_object_dispose__28133;
    id v29 = 0;
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    __int16 v21 = __Block_byref_object_copy__28132;
    id v22 = __Block_byref_object_dispose__28133;
    id v23 = 0;
    trackIdentifierList = self->_trackIdentifierList;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__MPModelLibraryPlaylistEditController_moveItemFromIndexPath_toIndexPath___block_invoke;
    v13[3] = &unk_1E57F3528;
    __int16 v16 = &v24;
    v13[4] = self;
    id v14 = v6;
    id v17 = &v18;
    id v15 = v7;
    [(MPSectionedIdentifierList *)trackIdentifierList performWithExclusiveAccess:v13];
    id v10 = [(MPModelLibraryPlaylistEditController *)self _sectionIdentifierForItemIdentifier:v25[5]];
    __int16 v11 = [(MPModelLibraryPlaylistEditController *)self _sectionIdentifierForItemIdentifier:v19[5]];
    [(MPSectionedIdentifierList *)self->_trackIdentifierList moveItem:v25[5] fromSection:v10 afterItem:v19[5] inSection:v11];
    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"MPModelLibraryPlaylistEditControllerDidChangeNotification" object:self];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
}

void __74__MPModelLibraryPlaylistEditController_moveItemFromIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v3 _itemIdentifierForIndexPath:v4 usingExclusiveAccessToken:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [*(id *)(a1 + 32) _itemIdentifierForIndexPath:*(void *)(a1 + 48) usingExclusiveAccessToken:v5];

  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  __int16 v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (void)insertItems:(id)a3 afterEntry:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v22 = self;
    __int16 v23 = 2114;
    id v24 = v8;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting items %{public}@ after entry %{public}@", buf, 0x20u);
  }

  os_unfair_lock_lock(&self->_lock);
  id v12 = [(MPModelLibraryPlaylistEditController *)self _newDataSourceForModelObjects:v8];
  uint64_t v13 = [v12 identifier];
  [(NSMutableDictionary *)self->_dataSources setObject:v12 forKey:v13];
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak((id *)buf, self);
  id v14 = [v9 universalIdentifier];
  id v15 = [(MPModelLibraryPlaylistEditController *)self _sectionIdentifierForItemIdentifier:v14];
  trackIdentifierList = self->_trackIdentifierList;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __74__MPModelLibraryPlaylistEditController_insertItems_afterEntry_completion___block_invoke;
  v18[3] = &unk_1E57F8430;
  objc_copyWeak(&v20, (id *)buf);
  id v17 = v10;
  id v19 = v17;
  [(MPSectionedIdentifierList *)trackIdentifierList addDataSource:v12 section:v13 afterItem:v14 inSection:v15 completion:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __74__MPModelLibraryPlaylistEditController_insertItems_afterEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543618;
      id v7 = WeakRetained;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to insert items. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)insertItem:(id)a3 afterEntry:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  __int16 v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 arrayWithObjects:&v13 count:1];

  -[MPModelLibraryPlaylistEditController insertItems:afterEntry:completion:](self, "insertItems:afterEntry:completion:", v12, v10, v9, v13, v14);
}

- (void)insertItems:(id)a3 atIndexPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 item])
  {
    os_unfair_lock_lock(&self->_lock);
    id v11 = [(MPModelLibraryPlaylistEditController *)self _newDataSourceForModelObjects:v8];
    id v12 = [v11 identifier];
    [(NSMutableDictionary *)self->_dataSources setObject:v11 forKey:v12];
    os_unfair_lock_unlock(&self->_lock);
    objc_initWeak(&location, self);
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__28132;
    uint64_t v27 = __Block_byref_object_dispose__28133;
    id v28 = 0;
    trackIdentifierList = self->_trackIdentifierList;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__MPModelLibraryPlaylistEditController_insertItems_atIndexPath_completion___block_invoke;
    v20[3] = &unk_1E57F6C20;
    id v22 = &v23;
    void v20[4] = self;
    id v21 = v9;
    [(MPSectionedIdentifierList *)trackIdentifierList performWithExclusiveAccess:v20];
    uint64_t v14 = [(MPModelLibraryPlaylistEditController *)self _sectionIdentifierForItemIdentifier:v24[5]];
    id v15 = self->_trackIdentifierList;
    uint64_t v16 = v24[5];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __75__MPModelLibraryPlaylistEditController_insertItems_atIndexPath_completion___block_invoke_2;
    v17[3] = &unk_1E57F8430;
    objc_copyWeak(&v19, &location);
    id v18 = v10;
    [(MPSectionedIdentifierList *)v15 addDataSource:v11 section:v12 afterItem:v16 inSection:v14 completion:v17];

    objc_destroyWeak(&v19);
    _Block_object_dispose(&v23, 8);

    objc_destroyWeak(&location);
  }
  else
  {
    [(MPModelLibraryPlaylistEditController *)self insertItemsAtStart:v8 completion:v10];
  }
}

void __75__MPModelLibraryPlaylistEditController_insertItems_atIndexPath_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _itemIdentifierForIndexPath:*(void *)(a1 + 40) usingExclusiveAccessToken:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __75__MPModelLibraryPlaylistEditController_insertItems_atIndexPath_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543618;
      id v7 = WeakRetained;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to insert items. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)insertItem:(id)a3 atIndexPath:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  __int16 v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 arrayWithObjects:&v13 count:1];

  -[MPModelLibraryPlaylistEditController insertItems:atIndexPath:completion:](self, "insertItems:atIndexPath:completion:", v12, v10, v9, v13, v14);
}

- (void)insertItemsAtStart:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting items at start %{public}@ ", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  id v9 = [(MPModelLibraryPlaylistEditController *)self _newDataSourceForModelObjects:v6];
  id v10 = [v9 identifier];
  [(NSMutableDictionary *)self->_dataSources setObject:v9 forKey:v10];
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak((id *)buf, self);
  trackIdentifierList = self->_trackIdentifierList;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__MPModelLibraryPlaylistEditController_insertItemsAtStart_completion___block_invoke;
  v13[3] = &unk_1E57F8430;
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v7;
  id v14 = v12;
  [(MPSectionedIdentifierList *)trackIdentifierList addDataSourceAtStart:v9 section:v10 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __70__MPModelLibraryPlaylistEditController_insertItemsAtStart_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543618;
      id v7 = WeakRetained;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to insert items. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)insertItemAtStart:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[MPModelLibraryPlaylistEditController insertItemsAtStart:completion:](self, "insertItemsAtStart:completion:", v9, v7, v10, v11);
}

- (void)appendItems:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ appending items %{public}@ ", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  id v9 = [(MPModelLibraryPlaylistEditController *)self _newDataSourceForModelObjects:v6];
  id v10 = [v9 identifier];
  [(NSMutableDictionary *)self->_dataSources setObject:v9 forKey:v10];
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak((id *)buf, self);
  trackIdentifierList = self->_trackIdentifierList;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__MPModelLibraryPlaylistEditController_appendItems_completion___block_invoke;
  v13[3] = &unk_1E57F8430;
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v7;
  id v14 = v12;
  [(MPSectionedIdentifierList *)trackIdentifierList addDataSourceAtEnd:v9 section:v10 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __63__MPModelLibraryPlaylistEditController_appendItems_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543618;
      id v7 = WeakRetained;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to append items. err=%{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)appendItem:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[MPModelLibraryPlaylistEditController appendItems:completion:](self, "appendItems:completion:", v9, v7, v10, v11);
}

- (MPSectionedCollection)currentTrackList
{
  id v3 = objc_alloc_init(MPMutableSectionedCollection);
  [(MPMutableSectionedCollection *)v3 appendSection:self->_playlist];
  int64_t v4 = [(MPSectionedIdentifierList *)self->_trackIdentifierList itemCount];
  trackIdentifierList = self->_trackIdentifierList;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__MPModelLibraryPlaylistEditController_currentTrackList__block_invoke;
  v10[3] = &unk_1E57F6CE8;
  v10[4] = self;
  int64_t v12 = v4;
  int v6 = v3;
  uint64_t v11 = v6;
  [(MPSectionedIdentifierList *)trackIdentifierList performWithExclusiveAccess:v10];
  id v7 = v11;
  id v8 = v6;

  return v8;
}

void __56__MPModelLibraryPlaylistEditController_currentTrackList__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  int64_t v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*(void *)(a1 + 48)];
  id v5 = *(void **)(*(void *)(a1 + 32) + 72);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __56__MPModelLibraryPlaylistEditController_currentTrackList__block_invoke_2;
  v22[3] = &unk_1E57F34E0;
  id v6 = v4;
  id v23 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v22];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 80));
  id v7 = [*(id *)(*(void *)(a1 + 32) + 40) enumeratorWithOptions:0x1000000 startPosition:0 endPosition:0 withExclusiveAccessToken:v3];
  uint64_t v8 = [v7 nextObjectWithExclusiveAccessToken:v3];
  if (v8)
  {
    id v10 = (void *)v8;
    uint64_t v11 = 0;
    *(void *)&long long v9 = 138543618;
    long long v20 = v9;
    do
    {
      if (objc_msgSend(v10, "entryType", v20) == 3)
      {
        int64_t v12 = [v10 itemResult];
        id v13 = [v12 itemIdentifier];

        id v14 = [v6 objectForKeyedSubscript:v13];
        if (v14)
        {
          os_log_t v15 = v14;
          if (![v14 hasLoadedValueForKey:@"MPModelPropertyPlaylistEntryPosition"]|| v11 != [v15 position])
          {
            uint64_t v16 = [v15 identifiers];
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __56__MPModelLibraryPlaylistEditController_currentTrackList__block_invoke_16;
            v21[3] = &__block_descriptor_40_e30_v16__0__MPModelPlaylistEntry_8l;
            v21[4] = v11;
            uint64_t v17 = [v15 copyWithIdentifiers:v16 block:v21];

            os_log_t v15 = (os_log_t)v17;
          }
          [*(id *)(a1 + 40) appendItem:v15];
          ++v11;
        }
        else
        {
          os_log_t v15 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v18 = *(void *)(a1 + 32);
            *(_DWORD *)buf = v20;
            uint64_t v25 = v18;
            __int16 v26 = 2112;
            uint64_t v27 = v13;
            _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_ERROR, "%{public}@ No playlist entry for identifier '%@' - skipping", buf, 0x16u);
          }
        }
      }
      uint64_t v19 = [v7 nextObjectWithExclusiveAccessToken:v3];

      id v10 = (void *)v19;
    }
    while (v19);
  }
}

void __56__MPModelLibraryPlaylistEditController_currentTrackList__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 playlistEntriesByIdentifier];
  [v3 addEntriesFromDictionary:v4];
}

uint64_t __56__MPModelLibraryPlaylistEditController_currentTrackList__block_invoke_16(uint64_t a1, void *a2)
{
  return [a2 setPosition:*(void *)(a1 + 32)];
}

- (void)setCoverArtworkRecipe:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  coverArtworkRecipe = self->_coverArtworkRecipe;
  self->_coverArtworkRecipe = v4;
}

- (NSString)coverArtworkRecipe
{
  coverArtworkRecipe = self->_coverArtworkRecipe;
  if (coverArtworkRecipe)
  {
    id v3 = coverArtworkRecipe;
  }
  else
  {
    id v3 = [(MPModelPlaylist *)self->_playlist coverArtworkRecipe];
  }

  return v3;
}

- (void)setCuratorPlaylist:(id)a3
{
  id v4 = (NSNumber *)[a3 copy];
  curatorPlaylist = self->_curatorPlaylist;
  self->_curatorPlaylist = v4;
}

- (NSNumber)isCuratorPlaylist
{
  curatorPlaylist = self->_curatorPlaylist;
  if (curatorPlaylist)
  {
    id v3 = curatorPlaylist;
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[MPModelPlaylist isCuratorPlaylist](self->_playlist, "isCuratorPlaylist"));
    id v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)setVisiblePlaylist:(id)a3
{
  id v4 = (NSNumber *)[a3 copy];
  visiblePlaylist = self->_visiblePlaylist;
  self->_visiblePlaylist = v4;
}

- (NSNumber)isVisiblePlaylist
{
  visiblePlaylist = self->_visiblePlaylist;
  if (visiblePlaylist)
  {
    id v3 = visiblePlaylist;
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[MPModelPlaylist isVisiblePlaylist](self->_playlist, "isVisiblePlaylist"));
    id v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)setPublicPlaylist:(id)a3
{
  id v4 = (NSNumber *)[a3 copy];
  publicPlaylist = self->_publicPlaylist;
  self->_publicPlaylist = v4;
}

- (NSNumber)isPublicPlaylist
{
  publicPlaylist = self->_publicPlaylist;
  if (publicPlaylist)
  {
    id v3 = publicPlaylist;
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[MPModelPlaylist isPublicPlaylist](self->_playlist, "isPublicPlaylist"));
    id v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)setUserImage:(id)a3
{
}

- (UIImage)userImage
{
  return self->_newUserImage;
}

- (void)setParentPlaylist:(id)a3
{
}

- (MPModelPlaylist)parentPlaylist
{
  return self->_newParentPlaylist;
}

- (void)setDescriptionText:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  newDescriptionText = self->_newDescriptionText;
  self->_newDescriptionText = v4;
}

- (NSString)descriptionText
{
  newDescriptionText = self->_newDescriptionText;
  if (newDescriptionText)
  {
    id v3 = newDescriptionText;
  }
  else
  {
    id v3 = [(MPModelPlaylist *)self->_playlist descriptionText];
  }

  return v3;
}

- (void)setName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  newName = self->_newName;
  self->_newName = v4;
}

- (NSString)name
{
  newName = self->_newName;
  if (newName)
  {
    id v3 = newName;
  }
  else
  {
    id v3 = [(MPModelPlaylist *)self->_playlist name];
  }

  return v3;
}

- (void)beginEditingWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    playlist = self->_playlist;
    *(_DWORD *)buf = 138543618;
    int64_t v12 = self;
    __int16 v13 = 2114;
    id v14 = playlist;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Begining edit with playlist %{public}@", buf, 0x16u);
  }

  initialTrackList = self->_initialTrackList;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__MPModelLibraryPlaylistEditController_beginEditingWithCompletion___block_invoke;
  v9[3] = &unk_1E57F8500;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(MPModelLibraryPlaylistEditController *)self _createTrackIdentifierListWithInitialEntries:initialTrackList completion:v9];
}

void __67__MPModelLibraryPlaylistEditController_beginEditingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 8);
      id v7 = objc_msgSend(v3, "msv_description");
      int v10 = 138543874;
      uint64_t v11 = v5;
      __int16 v12 = 2114;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Finished loading playlist %{public}@ error=%{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    id v4 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 8);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished loading playlist %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setInitialTrackList:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (MPSectionedCollection *)[a3 copy];
  initialTrackList = self->_initialTrackList;
  self->_initialTrackList = v4;

  uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing_Oversize");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v7 = [(MPSectionedCollection *)self->_initialTrackList totalItemCount];
    int v8 = 138543618;
    uint64_t v9 = self;
    __int16 v10 = 2048;
    int64_t v11 = v7;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting initial tracklist of edit controller with %ld items", (uint8_t *)&v8, 0x16u);
  }
}

- (id)_initWithLibrary:(id)a3 playlist:(id)a4 initialTrackList:(id)a5 playlistEntryProperties:(id)a6 authorProfile:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v32.receiver = self;
  v32.super_class = (Class)MPModelLibraryPlaylistEditController;
  uint64_t v18 = [(MPModelLibraryPlaylistEditController *)&v32 init];
  if (v18)
  {
    uint64_t v19 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v18->_operationQueue;
    v18->_operationQueue = v19;

    [(NSOperationQueue *)v18->_operationQueue setName:@"com.apple.MediaPlayer.MPModelLibraryPlaylistEditController.operationQueue"];
    [(NSOperationQueue *)v18->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v18->_operationQueue setQualityOfService:33];
    objc_storeStrong((id *)&v18->_library, a3);
    uint64_t v21 = [v14 copy];
    playlist = v18->_playlist;
    v18->_playlist = (MPModelPlaylist *)v21;

    uint64_t v23 = [v15 copy];
    initialTrackList = v18->_initialTrackList;
    v18->_initialTrackList = (MPSectionedCollection *)v23;

    if (v16)
    {
      uint64_t v25 = (MPPropertySet *)v16;
    }
    else
    {
      uint64_t v25 = +[MPPropertySet emptyPropertySet];
    }
    playlistEntryProperties = v18->_playlistEntryProperties;
    v18->_playlistEntryProperties = v25;

    uint64_t v27 = [v17 copy];
    authorProfile = v18->_authorProfile;
    v18->_authorProfile = (MPModelSocialPerson *)v27;

    uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    dataSources = v18->_dataSources;
    v18->_dataSources = (NSMutableDictionary *)v29;

    v18->_lock._os_unfair_lock_opaque = 0;
  }

  return v18;
}

- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlist:(id)a4 initialTrackList:(id)a5 playlistEntryProperties:(id)a6
{
  return (MPModelLibraryPlaylistEditController *)[(MPModelLibraryPlaylistEditController *)self _initWithLibrary:a3 playlist:a4 initialTrackList:a5 playlistEntryProperties:a6 authorProfile:0];
}

- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlist:(id)a4 playlistEntryProperties:(id)a5 authorProfile:(id)a6
{
  return (MPModelLibraryPlaylistEditController *)[(MPModelLibraryPlaylistEditController *)self _initWithLibrary:a3 playlist:a4 initialTrackList:0 playlistEntryProperties:a5 authorProfile:a6];
}

- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlist:(id)a4 playlistEntryProperties:(id)a5
{
  return (MPModelLibraryPlaylistEditController *)[(MPModelLibraryPlaylistEditController *)self _initWithLibrary:a3 playlist:a4 initialTrackList:0 playlistEntryProperties:a5 authorProfile:0];
}

- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlist:(id)a4
{
  return (MPModelLibraryPlaylistEditController *)[(MPModelLibraryPlaylistEditController *)self _initWithLibrary:a3 playlist:a4 initialTrackList:0 playlistEntryProperties:0 authorProfile:0];
}

- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlistEntryProperties:(id)a4 authorProfile:(id)a5
{
  return (MPModelLibraryPlaylistEditController *)[(MPModelLibraryPlaylistEditController *)self _initWithLibrary:a3 playlist:0 initialTrackList:0 playlistEntryProperties:a4 authorProfile:a5];
}

- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3 playlistEntryProperties:(id)a4
{
  return (MPModelLibraryPlaylistEditController *)[(MPModelLibraryPlaylistEditController *)self _initWithLibrary:a3 playlist:0 initialTrackList:0 playlistEntryProperties:a4 authorProfile:0];
}

- (MPModelLibraryPlaylistEditController)initWithLibrary:(id)a3
{
  return (MPModelLibraryPlaylistEditController *)[(MPModelLibraryPlaylistEditController *)self _initWithLibrary:a3 playlist:0 initialTrackList:0 playlistEntryProperties:0 authorProfile:0];
}

@end