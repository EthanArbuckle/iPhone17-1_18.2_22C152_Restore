@interface ALAssetsGroupPrivate
- (ALAssetsFilter)assetsFilter;
- (ALAssetsGroupPrivate)initWithAlbum:(id)a3 library:(id)a4;
- (ALAssetsLibrary)library;
- (BOOL)applyHyperionFilter;
- (BOOL)isCloudSharedGroup;
- (BOOL)isValid;
- (NSMutableDictionary)propertyValues;
- (PLAlbumProtocol)album;
- (PLPhotoLibrary)_photoLibrary;
- (id)valueForProperty:(id)a3;
- (int)albumFilter;
- (unint64_t)groupType;
- (void)_performBlockAndWait:(id)a3;
- (void)dealloc;
- (void)populateAssets;
- (void)resetAssets;
- (void)setAlbum:(id)a3;
- (void)setApplyHyperionFilter:(BOOL)a3;
- (void)setAssetsFilter:(id)a3;
- (void)setGroupType:(unint64_t)a3;
- (void)setIsCloudSharedGroup:(BOOL)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setLibrary:(id)a3;
- (void)setPropertyValues:(id)a3;
- (void)setValue:(id)a3 forProperty:(id)a4;
- (void)set_photoLibrary:(id)a3;
- (void)updateAlbumFiltering;
@end

@implementation ALAssetsGroupPrivate

- (void).cxx_destruct
{
}

- (void)setApplyHyperionFilter:(BOOL)a3
{
  self->_applyHyperionFilter = a3;
}

- (BOOL)applyHyperionFilter
{
  return self->_applyHyperionFilter;
}

- (void)setIsCloudSharedGroup:(BOOL)a3
{
  self->_isCloudSharedGroup = a3;
}

- (BOOL)isCloudSharedGroup
{
  return self->_isCloudSharedGroup;
}

- (void)set_photoLibrary:(id)a3
{
}

- (PLPhotoLibrary)_photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPropertyValues:(id)a3
{
}

- (NSMutableDictionary)propertyValues
{
  return self->_propertyValues;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setGroupType:(unint64_t)a3
{
  self->_groupType = a3;
}

- (unint64_t)groupType
{
  return self->_groupType;
}

- (ALAssetsFilter)assetsFilter
{
  return self->_assetsFilter;
}

- (void)setAlbum:(id)a3
{
}

- (PLAlbumProtocol)album
{
  return self->_album;
}

- (void)_performBlockAndWait:(id)a3
{
  v5 = [(ALAssetsGroupPrivate *)self library];
  if (v5)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke;
    v9[3] = &unk_2642B5F28;
    v9[4] = self;
    v9[5] = a3;
    [(ALAssetsLibrary *)v5 _performBlockAndWait:v9];
  }
  else if (_CFExecutableLinkedOnOrAfter())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke_4;
    block[3] = &unk_2642B5F78;
    block[4] = self;
    if (_performBlockAndWait__onceToken_366 != -1) {
      dispatch_once(&_performBlockAndWait__onceToken_366, block);
    }
  }
  else
  {
    objc_sync_enter(self);
    v6 = dispatch_group_create();
    if ([(ALAssetsGroupPrivate *)self _photoLibrary])
    {
      photoLibrary = self->_photoLibrary;
      block[5] = MEMORY[0x263EF8330];
      block[6] = 3221225472;
      block[7] = __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke_3;
      block[8] = &unk_2642B5F50;
      block[9] = self;
      block[10] = a3;
    }
    else
    {
      photoLibrary = (PLPhotoLibrary *)+[ALAssetsLibrary _library];
      self->_photoLibrary = photoLibrary;
      block[11] = MEMORY[0x263EF8330];
      block[12] = 3221225472;
      block[13] = __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke_2;
      block[14] = &unk_2642B5F50;
      block[15] = self;
      block[16] = a3;
    }
    -[PLPhotoLibrary withDispatchGroup:performBlock:](photoLibrary, "withDispatchGroup:performBlock:", v6);
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v6);
    objc_sync_exit(self);
  }
}

uint64_t __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(*(void *)(a1 + 32) + 32));
}

uint64_t __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = (void *)[MEMORY[0x263F5D910] unfilteredAlbum:*(void *)(*(void *)(a1 + 32) + 32)];
    uint64_t v3 = objc_msgSend(MEMORY[0x263F5D910], "filteredAlbum:filter:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "objectWithObjectID:", objc_msgSend(v2, "objectID")), objc_msgSend(*(id *)(a1 + 32), "albumFilter"));
LABEL_5:
    v4 = (void *)v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "objectWithObjectID:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectID"));
    goto LABEL_5;
  }
  NSLog(&cfstr_DonTKnowHowToS.isa, *(void *)(a1 + 32));
  v4 = 0;
LABEL_7:
  v5 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v5 != v4)
  {

    *(void *)(*(void *)(a1 + 32) + 32) = v4;
  }
  v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

uint64_t __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 64), *(void *)(*(void *)(a1 + 32) + 32));
}

void __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  NSLog(&cfstr_InvalidAttempt.isa, v2, *(void *)(a1 + 32));
}

- (ALAssetsLibrary)library
{
  return (ALAssetsLibrary *)objc_loadWeak((id *)&self->_library);
}

- (void)setLibrary:(id)a3
{
}

- (void)setValue:(id)a3 forProperty:(id)a4
{
  propertyValues = self->_propertyValues;
  objc_sync_enter(propertyValues);
  [(NSMutableDictionary *)self->_propertyValues setObject:a3 forKey:a4];

  objc_sync_exit(propertyValues);
}

- (id)valueForProperty:(id)a3
{
  propertyValues = self->_propertyValues;
  objc_sync_enter(propertyValues);
  id v6 = (id)[(NSMutableDictionary *)self->_propertyValues objectForKey:a3];
  objc_sync_exit(propertyValues);
  return v6;
}

- (void)populateAssets
{
  if (!self->_loadedAssets)
  {
    self->_loadedAssets = 1;
    [(ALAssetsGroupPrivate *)self updateAlbumFiltering];
  }
}

- (void)updateAlbumFiltering
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __44__ALAssetsGroupPrivate_updateAlbumFiltering__block_invoke;
  v2[3] = &unk_2642B5F00;
  v2[4] = self;
  [(ALAssetsGroupPrivate *)self _performBlockAndWait:v2];
}

uint64_t __44__ALAssetsGroupPrivate_updateAlbumFiltering__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)MEMORY[0x263F5D910];
    uint64_t v6 = [*(id *)(a1 + 32) albumFilter];
    uint64_t v7 = objc_msgSend(v5, "predicateForAlbumFilter:parameters:photoLibrary:", v6, 0, objc_msgSend(MEMORY[0x263F5D9A0], "systemPhotoLibrary"));
    return [a3 setALAssetsGroupFilterPredicate:v7];
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = objc_msgSend(MEMORY[0x263F5D910], "filteredAlbum:filter:", a3, objc_msgSend(v9, "albumFilter"));
    return [v9 setAlbum:v10];
  }
}

- (void)resetAssets
{
  propertyValues = self->_propertyValues;
  objc_sync_enter(propertyValues);
  [(NSMutableDictionary *)self->_propertyValues removeAllObjects];

  objc_sync_exit(propertyValues);
}

- (int)albumFilter
{
  assetsFilter = self->_assetsFilter;
  int v4 = 9728;
  if (assetsFilter) {
    int v4 = [(ALAssetsFilter *)assetsFilter _filter] | 0x2600;
  }
  BOOL v5 = [(ALAssetsGroupPrivate *)self isCloudSharedGroup];
  int v6 = v4 | 0x80;
  if (!v5) {
    int v6 = v4;
  }
  if (self->_applyHyperionFilter) {
    int v7 = v6 | 0x100;
  }
  else {
    int v7 = v6;
  }
  int v8 = PLIsCloudPhotoLibraryEnabledForCurrentUser();
  int v9 = v7 | 0x800;
  if (!v8) {
    int v9 = v7;
  }
  return v9 | 0x1000;
}

- (void)setAssetsFilter:(id)a3
{
  assetsFilter = self->_assetsFilter;
  if (assetsFilter != a3)
  {

    self->_assetsFilter = (ALAssetsFilter *)a3;
    [(ALAssetsGroupPrivate *)self updateAlbumFiltering];
  }
}

- (void)dealloc
{
  [(ALAssetsGroupPrivate *)self setLibrary:0];
  self->_photoLibrary = 0;

  v3.receiver = self;
  v3.super_class = (Class)ALAssetsGroupPrivate;
  [(ALAssetsGroupPrivate *)&v3 dealloc];
}

- (ALAssetsGroupPrivate)initWithAlbum:(id)a3 library:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ALAssetsGroupPrivate;
  int v6 = [(ALAssetsGroupPrivate *)&v9 init];
  if (v6)
  {
    if (PLIsCloudPhotoLibraryEnabledForCurrentUser()) {
      v6->_applyHyperionFilter = 1;
    }
    [(ALAssetsGroupPrivate *)v6 setAlbum:a3];
    v6->_propertyValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6->_loadedAssets = 0;
    v6->_isValid = 1;
    [(ALAssetsGroupPrivate *)v6 setLibrary:a4];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__ALAssetsGroupPrivate_initWithAlbum_library___block_invoke;
    v8[3] = &unk_2642B5F00;
    v8[4] = v6;
    [(ALAssetsGroupPrivate *)v6 _performBlockAndWait:v8];
  }
  return v6;
}

uint64_t __46__ALAssetsGroupPrivate_initWithAlbum_library___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1 + 32) + 64) = a2;
  uint64_t result = [a3 isCloudSharedAlbum];
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = result;
  return result;
}

@end