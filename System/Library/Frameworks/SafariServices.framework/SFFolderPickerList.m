@interface SFFolderPickerList
- (SFFolderPickerList)initWithBookmarkCollection:(id)a3 style:(unint64_t)a4;
- (_SFSyntheticBookmarkProvider)syntheticBookmarkProvider;
- (id)folderListItemsIgnoringIdentifiers:(id)a3;
- (void)_appendChildrenOfFolder:(id)a3 toArray:(id)a4 depth:(unint64_t)a5 ignoringIdentifiers:(id)a6;
- (void)_appendFolderAndChildren:(id)a3 toArray:(id)a4 depth:(unint64_t)a5 ignoringIdentifiers:(id)a6;
- (void)_appendPerTabGroupFavoritesIntoArray:(id)a3;
- (void)setSyntheticBookmarkProvider:(id)a3;
@end

@implementation SFFolderPickerList

- (SFFolderPickerList)initWithBookmarkCollection:(id)a3 style:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFFolderPickerList;
  v8 = [(SFFolderPickerList *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_style = a4;
    objc_storeStrong((id *)&v8->_bookmarkCollection, a3);
    v10 = v9;
  }

  return v9;
}

- (id)folderListItemsIgnoringIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!self->_style)
  {
    v6 = [(WebBookmarkCollection *)self->_bookmarkCollection favoritesFolder];
    [(SFFolderPickerList *)self _appendFolderAndChildren:v6 toArray:v5 depth:0 ignoringIdentifiers:v4];
  }
  [(SFFolderPickerList *)self _appendPerTabGroupFavoritesIntoArray:v5];
  unint64_t style = self->_style;
  v8 = [(WebBookmarkCollection *)self->_bookmarkCollection rootBookmark];
  if (style == 1) {
    [(SFFolderPickerList *)self _appendChildrenOfFolder:v8 toArray:v5 depth:0 ignoringIdentifiers:v4];
  }
  else {
    [(SFFolderPickerList *)self _appendFolderAndChildren:v8 toArray:v5 depth:0 ignoringIdentifiers:v4];
  }

  return v5;
}

- (void)_appendChildrenOfFolder:(id)a3 toArray:(id)a4 depth:(unint64_t)a5 ignoringIdentifiers:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = a4;
  id v10 = a6;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v11 = -[WebBookmarkCollection subfoldersOfID:](self->_bookmarkCollection, "subfoldersOfID:", [a3 identifier]);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
        if (self->_style
          || ([(WebBookmarkCollection *)self->_bookmarkCollection bookmarkIsFavoritesFolder:*(void *)(*((void *)&v20 + 1) + 8 * v15)] & 1) == 0)
        {
          if ([v16 isSyncable])
          {
            if (![v16 isBookmarksMenuFolder]
              || (-[WebBookmarkCollection listWithID:](self->_bookmarkCollection, "listWithID:", [v16 identifier]), v17 = objc_claimAutoreleasedReturnValue(), int v18 = objc_msgSend(v17, "bookmarkCount"), v17, v18))
            {
              [(SFFolderPickerList *)self _appendFolderAndChildren:v16 toArray:v19 depth:a5 ignoringIdentifiers:v10];
            }
          }
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)_appendFolderAndChildren:(id)a3 toArray:(id)a4 depth:(unint64_t)a5 ignoringIdentifiers:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "identifier"));
  char v13 = [v11 containsObject:v12];

  if ((v13 & 1) == 0)
  {
    id v14 = [[_SFFolderPickerItem alloc] _initWithBookmark:v15 syntheticFolder:0 depth:a5];
    [v10 addObject:v14];

    [(SFFolderPickerList *)self _appendChildrenOfFolder:v15 toArray:v10 depth:a5 + 1 ignoringIdentifiers:v11];
  }
}

- (void)_appendPerTabGroupFavoritesIntoArray:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syntheticBookmarkProvider);
  if ([WeakRetained hasNamedTabGroups])
  {
    v6 = [WeakRetained activeTabGroup];
    int v7 = [v6 supportsTabGroupFavorites];
    if (v7)
    {
      v8 = [_SFFolderPickerItem alloc];
      v9 = [WeakRetained syntheticBookmarkFolderForTabGroup:v6 withAttribution:1];
      id v10 = [(_SFFolderPickerItem *)v8 _initWithBookmark:0 syntheticFolder:v9 depth:0];
      [v4 addObject:v10];
    }
    id v11 = [_SFFolderPickerItem alloc];
    uint64_t v12 = [SFSyntheticBookmarkFolder alloc];
    char v13 = _WBSLocalizedString();
    id v14 = [(SFSyntheticBookmarkFolder *)v12 initWithBookmarkList:0 title:v13];
    id v15 = [(_SFFolderPickerItem *)v11 _initWithBookmark:0 syntheticFolder:v14 depth:0];

    [v4 addObject:v15];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v16 = objc_msgSend(WeakRetained, "syntheticBookmarkFoldersIncludingActiveTabGroup:", v7 ^ 1u, 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = [[_SFFolderPickerItem alloc] _initWithBookmark:0 syntheticFolder:*(void *)(*((void *)&v22 + 1) + 8 * i) depth:1];
          [v4 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v18);
    }
  }
}

- (_SFSyntheticBookmarkProvider)syntheticBookmarkProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_syntheticBookmarkProvider);

  return (_SFSyntheticBookmarkProvider *)WeakRetained;
}

- (void)setSyntheticBookmarkProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_syntheticBookmarkProvider);

  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
}

@end