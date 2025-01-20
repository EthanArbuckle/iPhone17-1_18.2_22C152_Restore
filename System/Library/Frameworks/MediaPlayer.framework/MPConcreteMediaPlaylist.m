@interface MPConcreteMediaPlaylist
+ (BOOL)supportsSecureCoding;
- (BOOL)_allowsEditing;
- (BOOL)beginGeneratingGeniusClusterItemsWithSeedItems:(id)a3 error:(id *)a4;
- (BOOL)existsInLibrary;
- (BOOL)isEqual:(id)a3;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (MPConcreteMediaPlaylist)initWithCoder:(id)a3;
- (MPConcreteMediaPlaylist)initWithProperties:(id)a3 itemsQuery:(id)a4;
- (id)_tokenBinaryIdentifierAsString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)geniusClusterItemsWithCount:(unint64_t)a3 error:(id *)a4;
- (id)items;
- (id)itemsQuery;
- (id)mediaLibrary;
- (id)multiverseIdentifier;
- (id)representativeItem;
- (id)valueForProperty:(id)a3;
- (id)valuesForProperties:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (unint64_t)mediaTypes;
- (void)_enumerateItemPersistentIDsUsingBlock:(id)a3;
- (void)_updateLibraryForPlaylistEdit:(id)a3;
- (void)addItemWithProductID:(id)a3 completionHandler:(id)a4;
- (void)addMediaItems:(id)a3 completionHandler:(id)a4;
- (void)appendItem:(id)a3 completion:(id)a4;
- (void)appendItems:(id)a3 andEntryProperties:(id)a4 completion:(id)a5;
- (void)appendItems:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)endGeneratingGeniusClusterItems;
- (void)moveItemFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 completionBlock:(id)a5;
- (void)populateWithSeedItem:(id)a3 completionBlock:(id)a4;
- (void)populateWithSeedItem:(id)a3 queue:(id)a4 completionBlock:(id)a5;
- (void)removeAllItems;
- (void)removeFirstItem;
- (void)removeItems:(id)a3 atFilteredIndexes:(id)a4 completionBlock:(id)a5;
- (void)replaceItems:(id)a3 completion:(id)a4;
- (void)replaceItemsWithPersistentIDs:(id)a3 andEntryProperties:(id)a4 completion:(id)a5;
- (void)replaceItemsWithPersistentIDs:(id)a3 completion:(id)a4;
- (void)setReactionText:(id)a3 onEntryAtPosition:(unint64_t)a4 completion:(id)a5;
- (void)setValue:(id)a3 forProperty:(id)a4 withCompletionBlock:(id)a5;
- (void)setValuesForProperties:(id)a3 trackList:(id)a4 andEntryProperties:(id)a5 withCompletionBlock:(id)a6;
@end

@implementation MPConcreteMediaPlaylist

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsQuery, 0);
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (BOOL)_allowsEditing
{
  return ([(MPMediaPlaylist *)self playlistAttributes] & 6) == 0;
}

- (void)endGeneratingGeniusClusterItems
{
  if (self->_clusterPlaylist)
  {
    id v4 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
    v3 = [v4 libraryDataProvider];
    [v3 releaseGeniusClusterPlaylist:self->_clusterPlaylist];
    self->_clusterPlaylist = 0;
  }
}

- (id)geniusClusterItemsWithCount:(unint64_t)a3 error:(id *)a4
{
  unint64_t v17 = a3;
  v6 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  v7 = [v6 libraryDataProvider];
  v8 = v7;
  clusterPlaylist = self->_clusterPlaylist;
  if (clusterPlaylist
    && (uint64_t v10 = [v7 generateItemIdentifiersForGeniusClusterPlaylist:clusterPlaylist count:&v17 error:a4], v17))
  {
    v11 = (void *)v10;
    v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v13 = +[MPMediaLibrary defaultMediaLibrary];
    if (v17)
    {
      for (unint64_t i = 0; i < v17; ++i)
      {
        v15 = [v13 itemWithPersistentID:v11[i]];
        if (v15) {
          [v12 addObject:v15];
        }
      }
    }
    free(v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)beginGeneratingGeniusClusterItemsWithSeedItems:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  v8 = [v7 libraryDataProvider];
  v9 = v8;
  if (self->_clusterPlaylist) {
    objc_msgSend(v8, "releaseGeniusClusterPlaylist:");
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v6 count];
    v11 = malloc_type_malloc(8 * [v6 count], 0x100004000313F17uLL);
    if (v10)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        v13 = [v6 objectAtIndex:i];
        v11[i] = [v13 persistentID];
      }
    }
    self->_clusterPlaylist = (void *)[v9 createGeniusClusterPlaylistWithSeedItemIdentifiers:v11 count:v10 error:a4];
    free(v11);
  }
  BOOL v14 = self->_clusterPlaylist != 0;

  return v14;
}

- (void)populateWithSeedItem:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    v9 = MEMORY[0x1E4F14428];
    id v11 = MEMORY[0x1E4F14428];
  }
  v12 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  v13 = [v12 libraryDataProvider];
  if (objc_opt_respondsToSelector())
  {
    BOOL v14 = [(MPConcreteMediaPlaylist *)self valueForProperty:@"playlistPersistentID"];
    uint64_t v15 = [v14 longLongValue];

    v16 = [v8 valueForProperty:@"persistentID"];
    uint64_t v17 = [v16 longLongValue];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __70__MPConcreteMediaPlaylist_populateWithSeedItem_queue_completionBlock___block_invoke;
    v21[3] = &unk_1E57F1588;
    v21[4] = self;
    id v22 = v12;
    id v24 = v10;
    v23 = v9;
    [v13 seedPlaylistWithIdentifier:v15 withItemWithIdentifier:v17 completionBlock:v21];

    v18 = v22;
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__MPConcreteMediaPlaylist_populateWithSeedItem_queue_completionBlock___block_invoke_3;
    block[3] = &unk_1E57FA198;
    id v20 = v10;
    dispatch_async(v9, block);
    v18 = v20;
    goto LABEL_7;
  }
LABEL_8:
}

void __70__MPConcreteMediaPlaylist_populateWithSeedItem_queue_completionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) _updateLibraryForPlaylistEdit:*(void *)(a1 + 40)];
  id v6 = *(void **)(a1 + 56);
  if (v6)
  {
    v7 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__MPConcreteMediaPlaylist_populateWithSeedItem_queue_completionBlock___block_invoke_2;
    block[3] = &unk_1E57F4F58;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __70__MPConcreteMediaPlaylist_populateWithSeedItem_queue_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__MPConcreteMediaPlaylist_populateWithSeedItem_queue_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)populateWithSeedItem:(id)a3 completionBlock:(id)a4
{
}

- (void)setReactionText:(id)a3 onEntryAtPosition:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  char v11 = [v10 libraryDataProvider];
  if (objc_opt_respondsToSelector())
  {
    v12 = [(MPConcreteMediaPlaylist *)self valueForProperty:@"playlistPersistentID"];
    uint64_t v13 = [v12 longLongValue];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__MPConcreteMediaPlaylist_setReactionText_onEntryAtPosition_completion___block_invoke;
    v14[3] = &unk_1E57F1560;
    id v15 = v9;
    [v11 setReactionText:v8 onEntryAtPosition:a4 inPlaylistWithIdentifier:v13 completion:v14];
  }
  else
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

uint64_t __72__MPConcreteMediaPlaylist_setReactionText_onEntryAtPosition_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)moveItemFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  id v10 = [v9 libraryDataProvider];
  if (objc_opt_respondsToSelector())
  {
    char v11 = [(MPConcreteMediaPlaylist *)self valueForProperty:@"playlistPersistentID"];
    uint64_t v12 = [v11 longLongValue];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__MPConcreteMediaPlaylist_moveItemFromIndex_toIndex_completionBlock___block_invoke;
    v13[3] = &unk_1E57F1538;
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    [v10 moveItemFromIndex:a3 toIndex:a4 inPlaylistWithIdentifier:v12 completionBlock:v13];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __69__MPConcreteMediaPlaylist_moveItemFromIndex_toIndex_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLibraryForPlaylistEdit:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeFirstItem
{
  id v4 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  v3 = [v4 libraryDataProvider];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "removeFirstItemFromPlaylistWithIdentifier:", -[MPMediaPlaylist persistentID](self, "persistentID"));
  }
}

- (void)removeAllItems
{
  id v6 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  v3 = [v6 libraryDataProvider];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(MPConcreteMediaPlaylist *)self valueForProperty:@"playlistPersistentID"];
    uint64_t v5 = [v4 longLongValue];

    [v3 removeAllItemsInPlaylistWithIdentifier:v5];
  }
}

- (void)removeItems:(id)a3 atFilteredIndexes:(id)a4 completionBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  id v10 = [v9 libraryDataProvider];
  if (objc_opt_respondsToSelector())
  {
    char v11 = [(MPConcreteMediaPlaylist *)self valueForProperty:@"playlistPersistentID"];
    uint64_t v12 = [v11 longLongValue];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__MPConcreteMediaPlaylist_removeItems_atFilteredIndexes_completionBlock___block_invoke;
    v13[3] = &unk_1E57F1538;
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    [v10 removeItemsAtIndexes:v7 inPlaylistWithIdentifier:v12 completionBlock:v13];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __73__MPConcreteMediaPlaylist_removeItems_atFilteredIndexes_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLibraryForPlaylistEdit:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)addItemWithProductID:(id)a3 completionHandler:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (+[MPMediaLibrary authorizationStatus] == MPMediaLibraryAuthorizationStatusAuthorized)
  {
    uint64_t v8 = [v6 longLongValue];
    if ([(MPConcreteMediaPlaylist *)self _allowsEditing] && v8)
    {
      id v9 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
      id v10 = [v9 libraryDataProvider];
      if (objc_opt_respondsToSelector())
      {
        MPMediaEntityPersistentID v11 = [(MPMediaPlaylist *)self persistentID];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __66__MPConcreteMediaPlaylist_addItemWithProductID_completionHandler___block_invoke;
        v20[3] = &unk_1E57F90A0;
        id v21 = v7;
        objc_msgSend(v10, "sdk_addItemWithOpaqueIdentifier:toPlaylistWithIdentifier:completionBlock:", v6, v11, v20);
        uint64_t v12 = v21;
      }
      else
      {
        if (!v7)
        {
LABEL_21:

          goto LABEL_22;
        }
        id v15 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
        v16 = [v15 localizedStringForKey:@"NOT_SUPPORTED" value:&stru_1EE680640 table:@"MediaPlayer"];

        if (v16)
        {
          uint64_t v22 = *MEMORY[0x1E4F28568];
          v23 = v16;
          uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        }
        else
        {
          uint64_t v12 = 0;
        }
        v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:5 userInfo:v12];
        (*((void (**)(id, void *))v7 + 2))(v7, v19);
      }
LABEL_20:

      goto LABEL_21;
    }
    if (v7)
    {
      id v14 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
      id v10 = [v14 localizedStringForKey:@"NOT_SUPPORTED" value:&stru_1EE680640 table:@"MediaPlayer"];

      if (v10)
      {
        uint64_t v24 = *MEMORY[0x1E4F28568];
        v25 = v10;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      }
      else
      {
        id v9 = 0;
      }
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = 5;
LABEL_19:
      uint64_t v12 = [v17 errorWithDomain:@"MPErrorDomain" code:v18 userInfo:v9];
      (*((void (**)(id, void *))v7 + 2))(v7, v12);
      goto LABEL_20;
    }
  }
  else if (v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
    id v10 = [v13 localizedStringForKey:@"PERMISSION_DENIED" value:&stru_1EE680640 table:@"MediaPlayer"];

    if (v10)
    {
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27[0] = v10;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    }
    else
    {
      id v9 = 0;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = 1;
    goto LABEL_19;
  }
LABEL_22:
}

void __66__MPConcreteMediaPlaylist_addItemWithProductID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    if (v3)
    {
      uint64_t v5 = [v3 domain];
      char v6 = [v5 isEqualToString:@"MPErrorDomain"];

      if ((v6 & 1) == 0)
      {
        id v7 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
        uint64_t v8 = [v7 localizedStringForKey:@"UNKNOWN_ERROR" value:&stru_1EE680640 table:@"MediaPlayer"];

        if (v8)
        {
          uint64_t v11 = *MEMORY[0x1E4F28568];
          v12[0] = v8;
          id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
        }
        else
        {
          id v9 = 0;
        }
        uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:0 userInfo:v9];

        id v4 = (void *)v10;
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)addMediaItems:(id)a3 completionHandler:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (+[MPMediaLibrary authorizationStatus] != MPMediaLibraryAuthorizationStatusAuthorized)
  {
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v8 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
    id v9 = [v8 localizedStringForKey:@"PERMISSION_DENIED" value:&stru_1EE680640 table:@"MediaPlayer"];

    if (v9)
    {
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20[0] = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = 1;
LABEL_17:
    id v14 = [v12 errorWithDomain:@"MPErrorDomain" code:v13 userInfo:v10];
    v7[2](v7, v14);

    goto LABEL_18;
  }
  if (![(MPConcreteMediaPlaylist *)self _allowsEditing])
  {
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v11 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
    id v9 = [v11 localizedStringForKey:@"NOT_SUPPORTED" value:&stru_1EE680640 table:@"MediaPlayer"];

    if (v9)
    {
      uint64_t v17 = *MEMORY[0x1E4F28568];
      uint64_t v18 = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = 5;
    goto LABEL_17;
  }
  if ([v6 count])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__MPConcreteMediaPlaylist_addMediaItems_completionHandler___block_invoke;
    v15[3] = &unk_1E57F3220;
    v15[4] = self;
    v16 = v7;
    [(MPConcreteMediaPlaylist *)self appendItems:v6 completion:v15];
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }
LABEL_18:
}

void __59__MPConcreteMediaPlaylist_addMediaItems_completionHandler___block_invoke(uint64_t a1, int a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = +[MPCloudControllerItemIDList cloudItemIDListForPlaylist:*(void *)(a1 + 32)];
    id v4 = [*(id *)(a1 + 32) mediaLibrary];
    uint64_t v5 = [v4 userIdentity];
    id v6 = +[MPCloudController controllerWithUserIdentity:v5];
    objc_msgSend(v6, "setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler:", 0, v3, objc_msgSend(*(id *)(a1 + 32), "persistentID"), 0);

    uint64_t v7 = *(void *)(a1 + 40);
    if (!v7) {
      return;
    }
    uint64_t v8 = 0;
  }
  else
  {
    if (!*(void *)(a1 + 40)) {
      return;
    }
    id v9 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
    uint64_t v10 = [v9 localizedStringForKey:@"UNKNOWN_ERROR" value:&stru_1EE680640 table:@"MediaPlayer"];

    if (v10)
    {
      uint64_t v12 = *MEMORY[0x1E4F28568];
      v13[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:0 userInfo:v11];

    uint64_t v7 = *(void *)(a1 + 40);
  }
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

- (void)appendItems:(id)a3 andEntryProperties:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  uint64_t v12 = [v11 libraryDataProvider];
  if ([v8 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v13 = [(MPConcreteMediaPlaylist *)self valueForProperty:@"playlistPersistentID"];
    uint64_t v14 = [v13 longLongValue];

    id v15 = [v8 valueForKey:@"persistentID"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __69__MPConcreteMediaPlaylist_appendItems_andEntryProperties_completion___block_invoke;
    v16[3] = &unk_1E57F1538;
    v16[4] = self;
    id v17 = v11;
    id v18 = v10;
    [v12 addItemsWithIdentifiers:v15 andEntryProperties:v9 toPlaylistWithIdentifier:v14 completionBlock:v16];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

uint64_t __69__MPConcreteMediaPlaylist_appendItems_andEntryProperties_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLibraryForPlaylistEdit:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)appendItems:(id)a3 completion:(id)a4
{
}

- (void)appendItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  id v9 = [v8 libraryDataProvider];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v10 = [(MPConcreteMediaPlaylist *)self valueForProperty:@"playlistPersistentID"];
    uint64_t v11 = [v10 longLongValue];

    uint64_t v12 = [v6 persistentID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __49__MPConcreteMediaPlaylist_appendItem_completion___block_invoke;
    v13[3] = &unk_1E57F1538;
    v13[4] = self;
    id v14 = v8;
    id v15 = v7;
    [v9 addItemWithIdentifier:v12 toPlaylistWithIdentifier:v11 completionBlock:v13];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __49__MPConcreteMediaPlaylist_appendItem_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLibraryForPlaylistEdit:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)replaceItemsWithPersistentIDs:(id)a3 andEntryProperties:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  uint64_t v12 = [v11 libraryDataProvider];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v13 = [(MPConcreteMediaPlaylist *)self valueForProperty:@"playlistPersistentID"];
    uint64_t v14 = [v13 longLongValue];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __87__MPConcreteMediaPlaylist_replaceItemsWithPersistentIDs_andEntryProperties_completion___block_invoke;
    v15[3] = &unk_1E57F1538;
    v15[4] = self;
    id v16 = v11;
    id v17 = v10;
    [v12 setItemsWithIdentifiers:v8 andEntryProperties:v9 forPlaylistWithIdentifier:v14 completionBlock:v15];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

uint64_t __87__MPConcreteMediaPlaylist_replaceItemsWithPersistentIDs_andEntryProperties_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLibraryForPlaylistEdit:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)replaceItemsWithPersistentIDs:(id)a3 completion:(id)a4
{
}

- (void)replaceItems:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  id v9 = [v8 libraryDataProvider];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v19 = self;
    id v20 = v9;
    id v10 = [(MPConcreteMediaPlaylist *)self valueForProperty:@"playlistPersistentID"];
    uint64_t v18 = [v10 longLongValue];

    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v16), "valueForProperty:", @"persistentID", v18);
          [v11 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v14);
    }

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __51__MPConcreteMediaPlaylist_replaceItems_completion___block_invoke;
    v21[3] = &unk_1E57F1538;
    v21[4] = v19;
    id v22 = v8;
    id v23 = v7;
    id v9 = v20;
    [v20 setItemsWithIdentifiers:v11 forPlaylistWithIdentifier:v18 completionBlock:v21];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __51__MPConcreteMediaPlaylist_replaceItems_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLibraryForPlaylistEdit:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_updateLibraryForPlaylistEdit:(id)a3
{
}

- (id)valuesForProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  id v7 = (void *)[v4 mutableCopy];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke;
  block[3] = &unk_1E57F62E8;
  id v9 = v4;
  id v35 = v9;
  v36 = self;
  id v10 = v7;
  id v37 = v10;
  id v11 = v6;
  id v38 = v11;
  dispatch_sync(accessQueue, block);
  if ([v10 count])
  {
    id v12 = [v5 libraryDataProvider];

    if (v12)
    {
      uint64_t v28 = 0;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__21447;
      v32 = __Block_byref_object_dispose__21448;
      id v33 = 0;
      uint64_t v13 = self->_accessQueue;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      void v27[2] = __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_2;
      v27[3] = &unk_1E57F9F20;
      v27[4] = self;
      v27[5] = &v28;
      dispatch_sync(v13, v27);
      uint64_t v14 = [(id)v29[5] unsignedLongLongValue];
      uint64_t v15 = [v5 libraryDataProvider];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_3;
      v24[3] = &unk_1E57F1510;
      id v25 = v5;
      long long v26 = self;
      [v15 loadProperties:v10 ofCollectionWithIdentifier:v14 groupingType:6 completionBlock:v24];

      uint64_t v16 = self->_accessQueue;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      void v20[2] = __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_5;
      v20[3] = &unk_1E57FA038;
      id v21 = v10;
      id v22 = self;
      id v23 = v11;
      dispatch_sync(v16, v20);

      _Block_object_dispose(&v28, 8);
    }
  }
  id v17 = v38;
  id v18 = v11;

  return v18;
}

void __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v7 = [*(id *)(*(void *)(a1 + 40) + 96) valueForKey:v6];
        id v8 = [MEMORY[0x1E4F1CA98] null];
        char v9 = [v7 isEqual:v8];

        if ((v9 & 1) == 0)
        {
          if (!v7) {
            goto LABEL_10;
          }
          [*(id *)(a1 + 56) setObject:v7 forKey:v6];
        }
        [*(id *)(a1 + 48) removeObject:v6];
LABEL_10:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
}

void __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKey:@"playlistPersistentID"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:@"seedItems"];
  if ([v4 count])
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = objc_msgSend(*(id *)(a1 + 32), "itemWithPersistentID:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "unsignedLongLongValue"));
          if (v11) {
            [v5 addObject:v11];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    long long v12 = (void *)[v3 mutableCopy];
    [v12 setValue:v5 forKey:@"seedItems"];

    id v3 = v12;
  }
  if ([v3 count])
  {
    uint64_t v13 = *(void *)(a1 + 40);
    long long v14 = *(NSObject **)(v13 + 88);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_4;
    v15[3] = &unk_1E57F9F98;
    v15[4] = v13;
    id v16 = v3;
    dispatch_sync(v14, v15);
  }
}

void __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_5(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 96), "valueForKey:", v7, (void)v11);
        if (v8)
        {
          [*(id *)(a1 + 48) setObject:v8 forKey:v7];
        }
        else
        {
          uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 96);
          uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
          [v9 setObject:v10 forKey:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void __47__MPConcreteMediaPlaylist_valuesForProperties___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 96);
  if (v3)
  {
    [v3 addEntriesFromDictionary:v2];
  }
  else
  {
    uint64_t v4 = [v2 mutableCopy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v4;
  }
}

- (id)valueForProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__21447;
  v43 = __Block_byref_object_dispose__21448;
  id v44 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke;
  block[3] = &unk_1E57F9F48;
  id v38 = &v39;
  void block[4] = self;
  id v7 = v4;
  id v37 = v7;
  dispatch_sync(accessQueue, block);
  if (!v40[5])
  {
    uint64_t v8 = [v5 libraryDataProvider];

    if (v8)
    {
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x3032000000;
      id v33 = __Block_byref_object_copy__21447;
      v34 = __Block_byref_object_dispose__21448;
      id v35 = 0;
      uint64_t v9 = self->_accessQueue;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_2;
      v29[3] = &unk_1E57F9F20;
      v29[4] = self;
      v29[5] = &v30;
      dispatch_sync(v9, v29);
      uint64_t v10 = [(id)v31[5] unsignedLongLongValue];
      long long v11 = [v5 libraryDataProvider];
      long long v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_3;
      v26[3] = &unk_1E57F1510;
      id v27 = v5;
      uint64_t v28 = self;
      [v11 loadProperties:v12 ofCollectionWithIdentifier:v10 groupingType:6 completionBlock:v26];

      long long v13 = self->_accessQueue;
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      id v21 = __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_5;
      uint64_t v22 = &unk_1E57F9F48;
      id v25 = &v39;
      id v23 = self;
      id v24 = v7;
      dispatch_sync(v13, &v19);

      _Block_object_dispose(&v30, 8);
    }
  }
  long long v14 = (void *)v40[5];
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v19, v20, v21, v22, v23);
  if ([v14 isEqual:v15]) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = (void *)v40[5];
  }
  id v17 = v16;

  _Block_object_dispose(&v39, 8);

  return v17;
}

void __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 96) valueForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKey:@"playlistPersistentID"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKey:@"seedItems"];
  if ([v4 count])
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = objc_msgSend(*(id *)(a1 + 32), "itemWithPersistentID:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "unsignedLongLongValue"));
          if (v11) {
            [v5 addObject:v11];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    long long v12 = (void *)[v3 mutableCopy];
    [v12 setValue:v5 forKey:@"seedItems"];

    id v3 = v12;
  }
  if ([v3 count])
  {
    uint64_t v13 = *(void *)(a1 + 40);
    long long v14 = *(NSObject **)(v13 + 88);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_4;
    v15[3] = &unk_1E57F9F98;
    v15[4] = v13;
    id v16 = v3;
    dispatch_sync(v14, v15);
  }
}

void __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_5(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 96) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v5 = *(void **)(a1[4] + 96);
    id v6 = [MEMORY[0x1E4F1CA98] null];
    [v5 setObject:v6 forKey:a1[5]];
  }
}

void __44__MPConcreteMediaPlaylist_valueForProperty___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 96);
  if (v3)
  {
    [v3 addEntriesFromDictionary:v2];
  }
  else
  {
    uint64_t v4 = [v2 mutableCopy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v4;
  }
}

- (void)_enumerateItemPersistentIDsUsingBlock:(id)a3
{
}

- (id)multiverseIdentifier
{
  uint64_t v3 = [(MPConcreteMediaPlaylist *)self mediaLibrary];
  uint64_t v4 = objc_msgSend(v3, "multiverseIdentifierForCollectionWithPersistentID:groupingType:", -[MPMediaPlaylist persistentID](self, "persistentID"), 6);

  return v4;
}

- (unint64_t)mediaTypes
{
  uint64_t v2 = [(MPConcreteMediaPlaylist *)self valueForProperty:@"mediaType"];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (unint64_t)count
{
  return [(MPMediaQuery *)self->_itemsQuery _countOfItems];
}

- (id)representativeItem
{
  uint64_t v2 = [(MPConcreteMediaPlaylist *)self items];
  if ([v2 count])
  {
    unint64_t v3 = [v2 objectAtIndex:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)items
{
  return [(MPMediaQuery *)self->_itemsQuery items];
}

- (void)setValue:(id)a3 forProperty:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  long long v12 = [v11 libraryDataProvider];

  if (objc_opt_respondsToSelector())
  {
    MPMediaEntityPersistentID v13 = [(MPMediaPlaylist *)self persistentID];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__MPConcreteMediaPlaylist_setValue_forProperty_withCompletionBlock___block_invoke;
    v14[3] = &unk_1E57F9C10;
    id v16 = v10;
    void v14[4] = self;
    id v15 = v9;
    [v12 setValue:v8 forProperty:v15 ofPlaylistWithIdentifier:v13 completionBlock:v14];
  }
  else if (v10)
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

void __68__MPConcreteMediaPlaylist_setValue_forProperty_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 88);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__MPConcreteMediaPlaylist_setValue_forProperty_withCompletionBlock___block_invoke_2;
  v5[3] = &unk_1E57F9F98;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  dispatch_sync(v4, v5);
}

uint64_t __68__MPConcreteMediaPlaylist_setValue_forProperty_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t result = [@"isActivePlaylist" isEqualToString:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 96);
    return [v3 removeObjectForKey:@"isActiveGeniusPlaylist"];
  }
  return result;
}

- (void)setValuesForProperties:(id)a3 trackList:(id)a4 andEntryProperties:(id)a5 withCompletionBlock:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  MPMediaEntityPersistentID v13 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  long long v14 = [v13 libraryDataProvider];

  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v14, "setValuesForProperties:trackList:andEntryProperties:ofPlaylistWithIdentifier:completionBlock:", v15, v10, v11, -[MPMediaPlaylist persistentID](self, "persistentID"), v12);
  }
  else if (v12)
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__MPConcreteMediaPlaylist_setValue_forProperty___block_invoke;
  v11[3] = &unk_1E57F14E8;
  MPMediaEntityPersistentID v13 = &v14;
  id v9 = v8;
  id v12 = v9;
  [(MPConcreteMediaPlaylist *)self setValue:v6 forProperty:v7 withCompletionBlock:v11];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

intptr_t __48__MPConcreteMediaPlaylist_setValue_forProperty___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_tokenBinaryIdentifierAsString
{
  uint64_t v3 = (void *)MEMORY[0x1E4F79AB8];
  MPMediaEntityPersistentID v4 = [(MPMediaPlaylist *)self persistentID];
  uint64_t v5 = [(MPConcreteMediaPlaylist *)self mediaLibrary];
  id v6 = [v5 ml3Library];
  id v7 = [v6 libraryUID];
  dispatch_semaphore_t v8 = [v3 URLForEntityWithPersistentID:v4 libraryUID:v7];
  id v9 = [v8 absoluteString];

  return v9;
}

- (BOOL)existsInLibrary
{
  uint64_t v2 = self;
  uint64_t v3 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  LOBYTE(v2) = objc_msgSend(v3, "playlistExistsWithPersistentID:", -[MPMediaPlaylist persistentID](v2, "persistentID"));

  return (char)v2;
}

- (id)mediaLibrary
{
  return [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    [v4 encodeObject:self->_itemsQuery forKey:@"MPQuery"];
    [v4 encodeObject:self->_properties forKey:@"MPProperties"];
  }
}

- (MPConcreteMediaPlaylist)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    v20.receiver = self;
    v20.super_class = (Class)MPConcreteMediaPlaylist;
    uint64_t v5 = [(MPMediaItemCollection *)&v20 initWithItems:0];
    if (v5)
    {
      dispatch_queue_t v6 = dispatch_queue_create("com.apple.MediaPlayer.MPConcreteMediaPlaylist.accessQueue", 0);
      accessQueue = v5->_accessQueue;
      v5->_accessQueue = (OS_dispatch_queue *)v6;

      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPQuery"];
      itemsQuery = v5->_itemsQuery;
      v5->_itemsQuery = (MPMediaQuery *)v8;

      id v10 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
      id v15 = [v4 decodeObjectOfClasses:v14 forKey:@"MPProperties"];
      uint64_t v16 = [v15 mutableCopy];
      properties = v5->_properties;
      v5->_properties = (NSMutableDictionary *)v16;
    }
    self = v5;
    long long v18 = self;
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  properties = self->_properties;
  itemsQuery = self->_itemsQuery;

  return (id)[v4 initWithProperties:properties itemsQuery:itemsQuery];
}

- (unint64_t)hash
{
  return [(MPMediaQuery *)self->_itemsQuery hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (MPMediaQuery *)v4[13];
    if (v5 == self->_itemsQuery) {
      char v6 = 1;
    }
    else {
      char v6 = -[MPMediaQuery isEqual:](v5, "isEqual:");
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)itemsQuery
{
  return self->_itemsQuery;
}

- (MPConcreteMediaPlaylist)initWithProperties:(id)a3 itemsQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MPConcreteMediaPlaylist;
  uint64_t v8 = [(MPMediaItemCollection *)&v16 initWithItems:0];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MediaPlayer.MPConcreteMediaPlaylist.accessQueue", 0);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [v6 mutableCopy];
    properties = v8->_properties;
    v8->_properties = (NSMutableDictionary *)v11;

    uint64_t v13 = [v7 copy];
    itemsQuery = v8->_itemsQuery;
    v8->_itemsQuery = (MPMediaQuery *)v13;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end