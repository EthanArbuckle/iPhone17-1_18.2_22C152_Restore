@interface ALAssetsLibraryPrivate
- (ALAssetsLibrary)assetsLibrary;
- (ALAssetsLibraryPrivate)initWithAssetsLibrary:(id)a3;
- (BOOL)isValid;
- (PLPhotoLibrary)photoLibrary;
- (void)dealloc;
- (void)photoLibraryDidChange:(id)a3;
- (void)registerAlbum:(id)a3 assetGroupPrivate:(id)a4;
- (void)setAssetsLibrary:(id)a3;
- (void)setIsValid:(BOOL)a3;
@end

@implementation ALAssetsLibraryPrivate

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setAssetsLibrary:(id)a3
{
  self->_assetsLibrary = (ALAssetsLibrary *)a3;
}

- (ALAssetsLibrary)assetsLibrary
{
  return self->_assetsLibrary;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  [(PLPhotoLibrary *)self->_photoLibrary performBlockAndWait:&__block_literal_global_159];
  [(ALAssetsLibraryPrivate *)self setAssetsLibrary:0];

  self->_assetGroupInternals = 0;
  self->_photoLibrary = 0;

  v3.receiver = self;
  v3.super_class = (Class)ALAssetsLibraryPrivate;
  [(ALAssetsLibraryPrivate *)&v3 dealloc];
}

- (void)registerAlbum:(id)a3 assetGroupPrivate:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    v7 = [(ALAssetsLibraryPrivate *)self photoLibrary];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __58__ALAssetsLibraryPrivate_registerAlbum_assetGroupPrivate___block_invoke;
    v9[3] = &unk_2642B5B98;
    v9[4] = self;
    v9[5] = a3;
    [(PLPhotoLibrary *)v7 performBlockAndWait:v9];
  }
  assetGroupInternals = self->_assetGroupInternals;
  objc_sync_enter(assetGroupInternals);
  [(NSHashTable *)self->_assetGroupInternals addObject:a4];
  objc_sync_exit(assetGroupInternals);
}

uint64_t __58__ALAssetsLibraryPrivate_registerAlbum_assetGroupPrivate___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [*(id *)(a1 + 40) groupURL];
  uint64_t v4 = [*(id *)(a1 + 40) objectID];

  return [v2 setObject:v3 forKey:v4];
}

- (void)photoLibraryDidChange:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[a3 userInfo];
  if (v4)
  {
    v5 = v4;
    v38 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    v39 = (void *)[MEMORY[0x263EFF9C0] set];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v37 = v5;
    v6 = (void *)[v5 objectForKey:@"insertedAssetGroups"];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v58 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = [*(id *)(*((void *)&v57 + 1) + 8 * i) groupURL];
          if (v10) {
            [v39 addObject:v10];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v57 objects:v65 count:16];
      }
      while (v7);
    }
    v11 = (void *)[MEMORY[0x263EFF9C0] set];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v12 = (void *)[v37 objectForKey:@"updatedAssetGroups"];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v53 objects:v64 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v54 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          uint64_t v17 = [v16 groupURL];
          if (v17) {
            [v11 addObject:v17];
          }
          if ([v16 conformsToProtocol:&unk_26C801E60])
          {
            v52[0] = MEMORY[0x263EF8330];
            v52[1] = 3221225472;
            v52[2] = __48__ALAssetsLibraryPrivate_photoLibraryDidChange___block_invoke;
            v52[3] = &unk_2642B5B70;
            v52[4] = v11;
            [v16 enumerateDerivedAlbums:v52];
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v53 objects:v64 count:16];
      }
      while (v13);
    }
    v18 = (void *)[MEMORY[0x263EFF9C0] set];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v19 = (void *)[v37 objectForKey:@"deletedAssetGroups"];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v48 objects:v63 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v49;
      do
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v49 != v21) {
            objc_enumerationMutation(v19);
          }
          v23 = *(void **)(*((void *)&v48 + 1) + 8 * k);
          uint64_t v24 = -[NSMutableDictionary objectForKey:](self->_groupURLSByAlbumOID, "objectForKey:", [v23 objectID]);
          if (v24)
          {
            [v18 addObject:v24];
            -[NSMutableDictionary removeObjectForKey:](self->_groupURLSByAlbumOID, "removeObjectForKey:", [v23 objectID]);
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v48 objects:v63 count:16];
      }
      while (v20);
    }
    v25 = (void *)[MEMORY[0x263EFF9C0] set];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v26 = (void *)[v37 objectForKey:@"updatedAssets"];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v62 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v45;
      do
      {
        for (uint64_t m = 0; m != v27; ++m)
        {
          if (*(void *)v45 != v28) {
            objc_enumerationMutation(v26);
          }
          uint64_t v30 = [*(id *)(*((void *)&v44 + 1) + 8 * m) assetURL];
          if (v30) {
            [v25 addObject:v30];
          }
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v62 count:16];
      }
      while (v27);
    }
    if ([v39 count]) {
      [v38 setObject:v39 forKey:@"ALAssetLibraryInsertedAssetGroupsKey"];
    }
    if ([v11 count]) {
      [v38 setObject:v11 forKey:@"ALAssetLibraryUpdatedAssetGroupsKey"];
    }
    if ([v18 count]) {
      [v38 setObject:v18 forKey:@"ALAssetLibraryDeletedAssetGroupsKey"];
    }
    if ([v25 count]) {
      [v38 setObject:v25 forKey:@"ALAssetLibraryUpdatedAssetsKey"];
    }
    uint64_t v4 = v38;
  }
  v31 = v4;
  if ([v4 count])
  {
    +[ALAssetRepresentationPrivate _clearFileDescriptorQueue];
    if (objc_msgSend((id)objc_msgSend(v31, "objectForKey:", @"ALAssetLibraryUpdatedAssetGroupsKey"), "count"))
    {
      assetGroupInternals = self->_assetGroupInternals;
      objc_sync_enter(assetGroupInternals);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v33 = self->_assetGroupInternals;
      uint64_t v34 = [(NSHashTable *)v33 countByEnumeratingWithState:&v40 objects:v61 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v41;
        do
        {
          for (uint64_t n = 0; n != v34; ++n)
          {
            if (*(void *)v41 != v35) {
              objc_enumerationMutation(v33);
            }
            [*(id *)(*((void *)&v40 + 1) + 8 * n) libraryDidChange];
          }
          uint64_t v34 = [(NSHashTable *)v33 countByEnumeratingWithState:&v40 objects:v61 count:16];
        }
        while (v34);
      }
      objc_sync_exit(assetGroupInternals);
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"ALAssetsLibraryChangedNotification", self->_assetsLibrary, v31);
}

uint64_t __48__ALAssetsLibraryPrivate_photoLibraryDidChange___block_invoke(uint64_t a1, void *a2)
{
  [a2 mappedDataSourceChanged:0 remoteNotificationData:0];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [a2 groupURL];
    if (result)
    {
      uint64_t v5 = result;
      v6 = *(void **)(a1 + 32);
      return [v6 addObject:v5];
    }
  }
  return result;
}

- (PLPhotoLibrary)photoLibrary
{
  objc_sync_enter(self);
  if (!self->_photoLibrary)
  {
    self->_photoLibrary = (PLPhotoLibrary *)+[ALAssetsLibrary _library];
    uint64_t v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel_photoLibraryDidChange_ name:*MEMORY[0x263F5D9E0] object:self->_photoLibrary];
  }
  objc_sync_exit(self);
  return self->_photoLibrary;
}

- (ALAssetsLibraryPrivate)initWithAssetsLibrary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ALAssetsLibraryPrivate;
  uint64_t v4 = [(ALAssetsLibraryPrivate *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    [(ALAssetsLibraryPrivate *)v4 setAssetsLibrary:a3];
    v5->_assetGroupInternals = (NSHashTable *)(id)[MEMORY[0x263F088B0] weakObjectsHashTable];
    v5->_groupURLSByAlbumOID = (NSMutableDictionary *)objc_opt_new();
    v5->_isValid = 1;
  }
  return v5;
}

@end