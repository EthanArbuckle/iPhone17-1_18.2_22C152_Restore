@interface _CDContactFavoritesUtilities
+ (id)sharedInstance;
- (_CDContactFavoritesUtilities)init;
- (_PASLock)contactFavorites;
- (id)entriesForContact:(id)a3;
- (id)favoriteContactEntries;
- (void)setContactFavorites:(id)a3;
@end

@implementation _CDContactFavoritesUtilities

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken5_0 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken5_0, &__block_literal_global_57);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_2;
  return v2;
}

- (_CDContactFavoritesUtilities)init
{
  v10.receiver = self;
  v10.super_class = (Class)_CDContactFavoritesUtilities;
  v2 = [(_CDContactFavoritesUtilities *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v4 = objc_alloc((Class)getCNFavoritesClass());
    id v5 = objc_alloc_init((Class)getCNContactStoreClass());
    v6 = (void *)[v4 initWithContactStore:v5];
    uint64_t v7 = [v3 initWithGuardedData:v6];
    contactFavorites = v2->_contactFavorites;
    v2->_contactFavorites = (_PASLock *)v7;
  }
  return v2;
}

- (id)favoriteContactEntries
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__18;
  objc_super v10 = __Block_byref_object_dispose__18;
  id v11 = 0;
  contactFavorites = self->_contactFavorites;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54___CDContactFavoritesUtilities_favoriteContactEntries__block_invoke;
  v5[3] = &unk_1E560FCB8;
  v5[4] = &v6;
  [(_PASLock *)contactFavorites runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)entriesForContact:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  id v17 = 0;
  contactFavorites = self->_contactFavorites;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50___CDContactFavoritesUtilities_entriesForContact___block_invoke;
  v9[3] = &unk_1E560FCE0;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(_PASLock *)contactFavorites runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (_PASLock)contactFavorites
{
  return self->_contactFavorites;
}

- (void)setContactFavorites:(id)a3
{
}

- (void).cxx_destruct
{
}

@end