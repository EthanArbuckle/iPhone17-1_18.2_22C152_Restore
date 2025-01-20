@interface MPModelLibraryPlaylistEditDataSource
- (MPModelLibraryPlaylistEditDataSource)initWithIdentifier:(id)a3;
- (MPModelSocialPerson)authorProfile;
- (MPMutableIdentifierListSection)dataSourceSection;
- (NSArray)playlistEntries;
- (NSDictionary)playlistEntriesByIdentifier;
- (NSString)identifier;
- (id)newPlaylistEntryForTrack:(id)a3;
- (void)_reloadWithCompletion:(id)a3;
- (void)loadEntriesWithCompletion:(id)a3;
- (void)reload;
- (void)reloadSection:(id)a3 completion:(id)a4;
- (void)setAuthorProfile:(id)a3;
@end

@implementation MPModelLibraryPlaylistEditDataSource

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSourceSection);
  objc_storeStrong((id *)&self->_playlistEntriesByIdentifier, 0);
  objc_storeStrong((id *)&self->_playlistEntries, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_authorProfile, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (MPMutableIdentifierListSection)dataSourceSection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceSection);

  return (MPMutableIdentifierListSection *)WeakRetained;
}

- (NSDictionary)playlistEntriesByIdentifier
{
  return self->_playlistEntriesByIdentifier;
}

- (NSArray)playlistEntries
{
  return self->_playlistEntries;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setAuthorProfile:(id)a3
{
}

- (MPModelSocialPerson)authorProfile
{
  return self->_authorProfile;
}

- (void)_reloadWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceSection);
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke;
    v6[3] = &unk_1E57F4E98;
    v6[4] = self;
    id v8 = v4;
    id v7 = WeakRetained;
    [(MPModelLibraryPlaylistEditDataSource *)self loadEntriesWithCompletion:v6];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load entries. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_27;
    v13[3] = &unk_1E57F4E70;
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    id v14 = v10;
    uint64_t v15 = v11;
    id v16 = v12;
    id v17 = *(id *)(a1 + 48);
    dispatch_async(v9, v13);
  }
}

void __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_27(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v4 = *(void **)(a1 + 32);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_2;
  v26[3] = &unk_1E57F4DD8;
  id v5 = v3;
  id v27 = v5;
  id v6 = v2;
  id v28 = v6;
  [v4 enumerateObjectsUsingBlock:v26];
  id v7 = os_log_create("com.apple.amp.mediaplayer", "PlaylistEditing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = [v5 count];
    *(_DWORD *)buf = 138543618;
    uint64_t v30 = v8;
    __int16 v31 = 2048;
    uint64_t v32 = v9;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Loaded %ld tracks from data source", buf, 0x16u);
  }

  id v10 = [*(id *)(a1 + 48) itemIdentifiers];
  uint64_t v11 = [v10 count];
  uint64_t v12 = [v5 count];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_32;
  v23[3] = &unk_1E57F4E00;
  id v24 = v10;
  id v13 = v5;
  id v25 = v13;
  id v14 = v10;
  uint64_t v15 = +[MPChangeDetails changeDetailsWithPreviousCount:v11 finalCount:v12 isEqualBlock:v23 isUpdatedBlock:&__block_literal_global_36_33718];
  uint64_t v16 = [v6 copy];
  uint64_t v17 = *(void *)(a1 + 40);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 32), *(id *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_3;
  v21[3] = &unk_1E57F4E48;
  id v22 = v13;
  id v20 = v13;
  [WeakRetained applyChanges:v15 itemLookupBlock:v21];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 universalIdentifier];
  [*(id *)(a1 + 32) addObject:v4];
  [*(id *)(a1 + 40) setObject:v3 forKey:v4];
}

uint64_t __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_32(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) objectAtIndex:a2];
  id v6 = [*(id *)(a1 + 40) objectAtIndex:a3];
  uint64_t v7 = [v5 isEqualToString:v6];

  return v7;
}

uint64_t __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectAtIndex:a2];
}

uint64_t __62__MPModelLibraryPlaylistEditDataSource__reloadWithCompletion___block_invoke_2_34()
{
  return 0;
}

- (void)reloadSection:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_storeWeak((id *)&self->_dataSourceSection, a3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__MPModelLibraryPlaylistEditDataSource_reloadSection_completion___block_invoke;
  v8[3] = &unk_1E57F90A0;
  id v9 = v6;
  id v7 = v6;
  [(MPModelLibraryPlaylistEditDataSource *)self _reloadWithCompletion:v8];
}

uint64_t __65__MPModelLibraryPlaylistEditDataSource_reloadSection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reload
{
}

- (void)loadEntriesWithCompletion:(id)a3
{
  uint64_t v5 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v5 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"MPModelLibraryPlaylistEditDataSource.m", 59, @"Subclass %@ must implement -%@ defined in %@.", v7, v8, @"[MPModelLibraryPlaylistEditDataSource class]" object file lineNumber description];
  }
}

- (id)newPlaylistEntryForTrack:(id)a3
{
  id v5 = a3;
  id v6 = [v5 identifiers];
  id v7 = (void *)[v6 copyWithSource:@"com.apple.MediaPlayer.MPModelLibraryPlaylistEditController" block:&__block_literal_global_33736];
  uint64_t v8 = [MPModelPlaylistEntry alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__MPModelLibraryPlaylistEditDataSource_newPlaylistEntryForTrack___block_invoke_3;
  v12[3] = &unk_1E57F4DB0;
  v12[4] = self;
  id v13 = v5;
  SEL v14 = a2;
  id v9 = v5;
  id v10 = [(MPModelObject *)v8 initWithIdentifiers:v7 block:v12];

  return v10;
}

void __65__MPModelLibraryPlaylistEditDataSource_newPlaylistEntryForTrack___block_invoke_3(void *a1, void *a2)
{
  id v10 = a2;
  id v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];
  id v5 = [v4 lowercaseString];
  [v10 setUniversalIdentifier:v5];

  id v6 = [MEMORY[0x1E4F29128] UUID];
  id v7 = [v6 UUIDString];
  uint64_t v8 = [v7 lowercaseString];
  [v10 setPositionUniversalIdentifier:v8];

  [v10 setSocialContributor:*(void *)(a1[4] + 16)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 setSong:a1[5]];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a1[6], a1[4], @"MPModelLibraryPlaylistEditDataSource.m", 51, @"Unsupported model object type for track %@", a1[5] object file lineNumber description];
  }
}

void __65__MPModelLibraryPlaylistEditDataSource_newPlaylistEntryForTrack___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 library];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 databaseID];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__MPModelLibraryPlaylistEditDataSource_newPlaylistEntryForTrack___block_invoke_2;
    v6[3] = &unk_1E57F96A0;
    id v7 = v4;
    [v2 setLibraryIdentifiersWithDatabaseID:v5 block:v6];
  }
}

void __65__MPModelLibraryPlaylistEditDataSource_newPlaylistEntryForTrack___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setContainedPersistentID:", objc_msgSend(v2, "persistentID"));
  [v3 setPersistentID:0];
}

- (MPModelLibraryPlaylistEditDataSource)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPModelLibraryPlaylistEditDataSource;
  id v6 = [(MPModelLibraryPlaylistEditDataSource *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MediaPlayerFramework.MPModelLibraryPlaylistEditDataSource.serialQueue", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v8;

    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__handleMPMediaLibraryEntitiesAddedOrRemovedNotification_ name:@"MPMediaLibraryEntitiesAddedOrRemovedNotification" object:0];
  }
  return v7;
}

@end