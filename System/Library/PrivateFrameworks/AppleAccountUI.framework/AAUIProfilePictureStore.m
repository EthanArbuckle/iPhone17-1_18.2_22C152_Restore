@interface AAUIProfilePictureStore
- (AAUIProfilePictureStore)init;
- (AAUIProfilePictureStore)initWithAppleAccount:(id)a3 grandSlamAccount:(id)a4 accountStore:(id)a5;
- (AAUIProfilePictureStore)initWithAppleAccount:(id)a3 grandSlamSigner:(id)a4;
- (AAUIProfilePictureStore)initWithAppleAccount:(id)a3 store:(id)a4;
- (AAUIProfilePictureStore)initWithGrandSlamSigner:(id)a3;
- (BOOL)_contactSyncsWithiCloud:(id)a3 error:(id *)a4;
- (BOOL)_isCachedProfilePictureUpdated:(id)a3;
- (BOOL)_isProfilePictureCachePresent;
- (double)pictureDiameter;
- (id)_contactWithImageDataMatchingFamilyMember:(id)a3 error:(id *)a4;
- (id)_correctlySizedImageFromImage:(id)a3;
- (id)_fallbackProfilePictureForPersonWithFirstName:(id)a3 lastName:(id)a4;
- (id)_familyMemberPersonPicture:(id)a3;
- (id)_getAccountIdentifierForContact:(id)a3 error:(id *)a4;
- (id)_initWithoutAppleAccount;
- (id)_meCardPicture;
- (id)_monogrammedContactImage:(id)a3;
- (id)_monogrammer;
- (id)_profilePictureForFamilyMemberWithoutMonogramFallback:(id)a3;
- (id)_profilePictureForPicture:(id)a3 crop:(BOOL)a4 cropRect:(CGRect)a5 cacheable:(BOOL)a6;
- (id)_readProfilePictureFromCache;
- (id)_sizedProfilePictureWithFallback:(id)a3;
- (id)cacheablePictureForPicture:(id)a3 cropRect:(CGRect)a4;
- (id)monogramForCurrentAccount;
- (id)profilePictureForAccountOwner;
- (id)profilePictureForAccountOwnerWithoutMonogramFallback;
- (id)profilePictureForFamilyMember:(id)a3;
- (id)profilePictureForLocalContact:(id)a3;
- (id)profilePictureForPicture:(id)a3;
- (id)profilePictureForPicture:(id)a3 cropRect:(CGRect)a4;
- (id)renderingScope;
- (int64_t)monogramType;
- (int64_t)pictureStyle;
- (void)_beginObservingContactStoreDidChangeNotifications;
- (void)_contactStoreDidChange:(id)a3;
- (void)_decodeImageAndCropRectForContact:(id)a3 completion:(id)a4;
- (void)_endObservingContactStoreDidChangeNotifications;
- (void)_familyMember:(id)a3 rawImageAndCropRect:(id)a4;
- (void)_fetchAndCacheRawImageAndCropRectWithRequest:(id)a3 personID:(id)a4 completion:(id)a5;
- (void)_fetchProfilePictureForAccountOwnerFromServer:(id)a3 serverCacheTag:(id)a4 completion:(id)a5;
- (void)_fetchProfilePictureForFamilyMemberFromServer:(id)a3 serverCacheTag:(id)a4 completion:(id)a5;
- (void)_fetchProfilePictureSupersetWithRequest:(id)a3 personID:(id)a4 completion:(id)a5;
- (void)_fetchProfilePictureWithRequest:(id)a3 personID:(id)a4 completion:(id)a5;
- (void)_invalidateMonogrammer;
- (void)_meCardPicture;
- (void)_meCardRawImageAndCropRect:(id)a3;
- (void)_saveProfilePictureToCache:(id)a3;
- (void)_saveProfilePictureToCacheIfNeeded:(id)a3;
- (void)_updateServerProfilePictureForAccountOwner:(id)a3 cropRect:(id)a4;
- (void)dealloc;
- (void)fetchImageForAppleAccountPresentation:(id)a3;
- (void)fetchProfilePictureForAccountOwner:(id)a3;
- (void)fetchProfilePictureForFamilyMember:(id)a3 completion:(id)a4;
- (void)fetchProfilePictureFromCacheForAccountOwner:(id)a3;
- (void)fetchRawImageAndCropRectForAccountOwner:(id)a3;
- (void)fetchRawImageAndCropRectForFamilyMember:(id)a3 completion:(id)a4;
- (void)meCardWithVisualIdentity:(id)a3;
- (void)monogramForCurrentAccount;
- (void)profilePictureForAccountOwnerWithCompletion:(id)a3;
- (void)profilePictureForAccountOwnerWithoutMonogramFallback;
- (void)setMonogramType:(int64_t)a3;
- (void)setPictureDiameter:(double)a3;
- (void)setPictureStyle:(int64_t)a3;
- (void)setProfilePictureForAccountOwner:(id)a3 cropRect:(id)a4;
- (void)updateCacheWithPhoto:(id)a3 cropRect:(id)a4 forPersonID:(id)a5;
@end

@implementation AAUIProfilePictureStore

- (void)_invalidateMonogrammer
{
  p_monogrammerLock = &self->_monogrammerLock;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__AAUIProfilePictureStore__invalidateMonogrammer__block_invoke;
  v3[3] = &unk_263F92168;
  v3[4] = self;
  os_unfair_lock_lock(&self->_monogrammerLock);
  __49__AAUIProfilePictureStore__invalidateMonogrammer__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_monogrammerLock);
}

- (AAUIProfilePictureStore)init
{
  v3 = [MEMORY[0x263EFB210] defaultStore];
  v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
  self->_monogrammerLock._os_unfair_lock_opaque = 0;
  if (v4)
  {
    v5 = objc_msgSend(v3, "aa_grandSlamAccountForiCloudAccount:", v4);
    v6 = [(AAUIProfilePictureStore *)self initWithAppleAccount:v4 grandSlamAccount:v5 accountStore:v3];
  }
  else
  {
    v7 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "No primary iCloud account found! Creating AAUIProfilePictureStore without primary account.", v9, 2u);
    }

    v6 = (AAUIProfilePictureStore *)[(AAUIProfilePictureStore *)self _initWithoutAppleAccount];
  }

  return v6;
}

- (id)_initWithoutAppleAccount
{
  v8.receiver = self;
  v8.super_class = (Class)AAUIProfilePictureStore;
  v2 = [(AAUIProfilePictureStore *)&v8 init];
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x263EFEA58]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    networkingQueue = v2->_networkingQueue;
    v2->_networkingQueue = v5;

    v2->_pictureDiameter = 60.0;
    v2->_monogramType = 0;
    [(AAUIProfilePictureStore *)v2 _beginObservingContactStoreDidChangeNotifications];
  }
  return v2;
}

- (void)_beginObservingContactStoreDidChangeNotifications
{
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = [MEMORY[0x263F08A48] mainQueue];
  uint64_t v5 = *MEMORY[0x263EFE118];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__AAUIProfilePictureStore__beginObservingContactStoreDidChangeNotifications__block_invoke;
  v8[3] = &unk_263F92370;
  objc_copyWeak(&v9, &location);
  v6 = [v3 addObserverForName:v5 object:0 queue:v4 usingBlock:v8];
  contactStoreDidChangeObserver = self->_contactStoreDidChangeObserver;
  self->_contactStoreDidChangeObserver = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__AAUIProfilePictureStore__invalidateMonogrammer__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  *(void *)(v1 + 48) = 0;
}

- (void)setPictureDiameter:(double)a3
{
  if (self->_pictureDiameter != a3)
  {
    self->_pictureDiameter = a3;
    [(AAUIProfilePictureStore *)self _invalidateMonogrammer];
  }
}

- (AAUIProfilePictureStore)initWithAppleAccount:(id)a3 grandSlamSigner:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(AAUIProfilePictureStore *)self _initWithoutAppleAccount];
  v10 = (AAUIProfilePictureStore *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    uint64_t v11 = [v8 accountStore];
    accountStore = v10->_accountStore;
    v10->_accountStore = (ACAccountStore *)v11;

    objc_storeStrong((id *)&v10->_grandSlamSigner, a4);
  }

  return v10;
}

- (AAUIProfilePictureStore)initWithAppleAccount:(id)a3 grandSlamAccount:(id)a4 accountStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 accountType];
  v12 = [v11 identifier];
  char v13 = [v12 isEqualToString:*MEMORY[0x263EFAE58]];

  v14 = _AAUIPPSLogSystem();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[AAUIProfilePictureStore initWithAppleAccount:grandSlamAccount:accountStore:]();
    }

    id v16 = objc_alloc(MEMORY[0x263F25878]);
    v17 = (void *)[v16 initWithAccountStore:v10 grandSlamAccount:v9 appTokenID:*MEMORY[0x263F256D0]];
    v18 = [(AAUIProfilePictureStore *)self initWithAppleAccount:v8 grandSlamSigner:v17];
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "Cannot create AAUIProfilePictureStore with a non-iCloud account! Returning default store without account", v20, 2u);
    }

    v18 = (AAUIProfilePictureStore *)[(AAUIProfilePictureStore *)self _initWithoutAppleAccount];
  }

  return v18;
}

- (AAUIProfilePictureStore)initWithAppleAccount:(id)a3 store:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(v6, "aa_grandSlamAccountForiCloudAccount:", v7);
  id v9 = [(AAUIProfilePictureStore *)self initWithAppleAccount:v7 grandSlamAccount:v8 accountStore:v6];

  return v9;
}

- (AAUIProfilePictureStore)initWithGrandSlamSigner:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore initWithGrandSlamSigner:]();
  }

  id v6 = [v4 grandSlamAccount];
  id v7 = objc_msgSend(v6, "aida_alternateDSID");

  id v8 = [v4 accountStore];
  id v9 = objc_msgSend(v8, "aa_appleAccountWithAltDSID:", v7);

  if (!v9)
  {
    id v10 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[AAUIProfilePictureStore initWithGrandSlamSigner:]();
    }

    uint64_t v11 = [v4 grandSlamAccount];
    v12 = objc_msgSend(v11, "aida_dsid");

    char v13 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[AAUIProfilePictureStore initWithGrandSlamSigner:]();
    }

    v14 = [v4 accountStore];
    id v9 = objc_msgSend(v14, "aa_appleAccountWithPersonID:", v12);
  }
  v15 = [(AAUIProfilePictureStore *)self initWithAppleAccount:v9 grandSlamSigner:v4];

  return v15;
}

- (void)dealloc
{
  [(AAUIProfilePictureStore *)self _endObservingContactStoreDidChangeNotifications];
  v3.receiver = self;
  v3.super_class = (Class)AAUIProfilePictureStore;
  [(AAUIProfilePictureStore *)&v3 dealloc];
}

- (int64_t)pictureStyle
{
  return 2 * ([(AAUIProfilePictureStore *)self monogramType] == 1);
}

- (id)_monogrammer
{
  p_monogrammerLock = &self->_monogrammerLock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__AAUIProfilePictureStore__monogrammer__block_invoke;
  v5[3] = &unk_263F92140;
  v5[4] = self;
  os_unfair_lock_lock(&self->_monogrammerLock);
  objc_super v3 = __39__AAUIProfilePictureStore__monogrammer__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_monogrammerLock);
  return v3;
}

id __39__AAUIProfilePictureStore__monogrammer__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 48) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v2 = objc_alloc(MEMORY[0x263EFEBA0]);
    objc_super v3 = [MEMORY[0x263EFEBA8] defaultSettingsWithCacheSize:0 skipContactLookup:1];
    uint64_t v4 = [v2 initWithSettings:v3];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v4;
  }
  id v7 = *(void **)(*(void *)(a1 + 32) + 48);
  return v7;
}

- (void)setMonogramType:(int64_t)a3
{
  if (self->_monogramType != a3)
  {
    self->_monogramType = a3;
    [(AAUIProfilePictureStore *)self _invalidateMonogrammer];
  }
}

- (void)setPictureStyle:(int64_t)a3
{
  [(AAUIProfilePictureStore *)self setMonogramType:a3 == 2];
}

- (id)renderingScope
{
  id v2 = (void *)MEMORY[0x263EFEBB0];
  double pictureDiameter = self->_pictureDiameter;
  uint64_t v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 scale];
  id v6 = objc_msgSend(v2, "scopeWithPointSize:scale:rightToLeft:style:", 1, 0, pictureDiameter, pictureDiameter, v5);

  return v6;
}

- (id)profilePictureForAccountOwner
{
  objc_super v3 = [(AAUIProfilePictureStore *)self profilePictureForAccountOwnerWithoutMonogramFallback];
  uint64_t v4 = [(AAUIProfilePictureStore *)self _sizedProfilePictureWithFallback:v3];

  return v4;
}

- (void)profilePictureForAccountOwnerWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore profilePictureForAccountOwnerWithCompletion:]();
  }

  objc_initWeak(&location, self);
  id v6 = dispatch_get_global_queue(25, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke;
  v8[3] = &unk_263F921E0;
  objc_copyWeak(&v10, &location);
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_super v3 = [*(id *)(*(void *)(a1 + 32) + 8) accountType];
  id v4 = [v3 identifier];
  int v5 = [v4 isEqualToString:*MEMORY[0x263EFAE58]];

  id v6 = _AAUIPPSLogSystem();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_cold_2();
    }

    *(void *)buf = 0;
    v29 = buf;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "aa_personID");
    id v9 = (void *)[v8 copy];

    id v10 = +[AAUIServerSuppliedProfilePictureCache sharedCache];
    double v11 = *(double *)(*(void *)(a1 + 32) + 72);
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_42;
    v23 = &unk_263F921B8;
    v27 = buf;
    id v24 = WeakRetained;
    id v12 = v9;
    id v25 = v12;
    id v26 = *(id *)(a1 + 40);
    char v13 = [v10 profilePictureForPersonID:v12 diameter:&v20 serverFetchBlock:v11];

    if (!v29[24])
    {
      v14 = _AAUIPPSLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_cold_1();
      }

      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = objc_msgSend(WeakRetained, "_sizedProfilePictureWithFallback:", v13, v20, v21, v22, v23, v24, v25);
      (*(void (**)(uint64_t, void *, void))(v15 + 16))(v15, v16, 0);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "User not signed into iCloud, falling back to Me card for profile picture.", buf, 2u);
    }

    v17 = [WeakRetained _meCardPicture];
    uint64_t v18 = *(void *)(a1 + 40);
    v19 = [WeakRetained _sizedProfilePictureWithFallback:v17];
    (*(void (**)(uint64_t, void *, void))(v18 + 16))(v18, v19, 0);
  }
}

void __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_42(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_42_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_43;
  v8[3] = &unk_263F92190;
  id v7 = *(id *)(a1 + 48);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v5 _fetchProfilePictureForAccountOwnerFromServer:v6 serverCacheTag:v3 completion:v8];
}

void __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_43_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) _sizedProfilePictureWithFallback:v6];

  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v5);
}

- (id)_sizedProfilePictureWithFallback:(id)a3
{
  id v4 = a3;
  id v5 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore _sizedProfilePictureWithFallback:]();
  }

  id v6 = v4;
  id v7 = v6;
  if (!v6)
  {
    uint64_t v8 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[AAUIProfilePictureStore _sizedProfilePictureWithFallback:]();
    }

    id v9 = [(ACAccount *)self->_account aa_firstName];
    id v10 = [(ACAccount *)self->_account aa_lastName];
    id v7 = [(AAUIProfilePictureStore *)self _fallbackProfilePictureForPersonWithFirstName:v9 lastName:v10];
  }
  double v11 = [(AAUIProfilePictureStore *)self _correctlySizedImageFromImage:v7];

  return v11;
}

- (id)profilePictureForAccountOwnerWithoutMonogramFallback
{
  id v3 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore profilePictureForAccountOwnerWithoutMonogramFallback]();
  }

  if (![(ACAccount *)self->_account isEnabledForDataclass:*MEMORY[0x263EFB3F0]])goto LABEL_7; {
  id v4 = _AAUIPPSLogSystem();
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore profilePictureForAccountOwnerWithoutMonogramFallback]();
  }

  id v5 = [(AAUIProfilePictureStore *)self _meCardPicture];
  if (!v5)
  {
LABEL_7:
    id v6 = [(ACAccount *)self->_account aa_personID];
    id v7 = (void *)[v6 copy];

    uint64_t v8 = +[AAUIServerSuppliedProfilePictureCache sharedCache];
    double pictureDiameter = self->_pictureDiameter;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __79__AAUIProfilePictureStore_profilePictureForAccountOwnerWithoutMonogramFallback__block_invoke;
    id v16 = &unk_263F92208;
    v17 = self;
    id v18 = v7;
    id v10 = v7;
    id v5 = [v8 profilePictureForPersonID:v10 diameter:&v13 serverFetchBlock:pictureDiameter];
  }
  double v11 = -[AAUIProfilePictureStore _correctlySizedImageFromImage:](self, "_correctlySizedImageFromImage:", v5, v13, v14, v15, v16, v17);
  [(AAUIProfilePictureStore *)self _saveProfilePictureToCacheIfNeeded:v11];

  return v11;
}

uint64_t __79__AAUIProfilePictureStore_profilePictureForAccountOwnerWithoutMonogramFallback__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fetchProfilePictureForAccountOwnerFromServer:*(void *)(a1 + 40) serverCacheTag:a2 completion:0];
}

- (void)fetchProfilePictureForAccountOwner:(id)a3
{
  id v4 = a3;
  id v5 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore fetchProfilePictureForAccountOwner:]();
  }

  objc_initWeak(&location, self);
  id v6 = dispatch_get_global_queue(25, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke;
  v8[3] = &unk_263F92280;
  objc_copyWeak(&v10, &location);
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (![WeakRetained[1] isEnabledForDataclass:*MEMORY[0x263EFB3F0]]) {
    goto LABEL_8;
  }
  id v3 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_3();
  }

  uint64_t v4 = [WeakRetained _meCardPicture];
  if (v4)
  {
    id v5 = (id)v4;
    id v6 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_2();
    }

    id v7 = (void (**)(id, void *, void))a1[5];
    uint64_t v8 = [a1[4] _correctlySizedImageFromImage:v5];
    v7[2](v7, v8, 0);
  }
  else
  {
LABEL_8:
    id v9 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_1();
    }

    id v10 = objc_msgSend(WeakRetained[1], "aa_personID");
    double v11 = (void *)[v10 copy];

    id v12 = +[AAUIServerSuppliedProfilePictureCache sharedCache];
    double v13 = *((double *)a1[4] + 9);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_46;
    v15[3] = &unk_263F92258;
    v15[4] = WeakRetained;
    id v16 = v11;
    id v14 = a1[5];
    id v17 = a1[4];
    id v18 = v14;
    id v5 = v11;
    [v12 profilePictureForPersonID:v5 diameter:v15 completion:v13];
  }
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_46(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    id v9 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_46_cold_1();
    }

    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_47;
    v19[3] = &unk_263F92230;
    v19[4] = v10;
    id v12 = *(id *)(a1 + 56);
    v19[5] = *(void *)(a1 + 48);
    id v20 = v12;
    [v10 _fetchProfilePictureForAccountOwnerFromServer:v11 serverCacheTag:v8 completion:v19];
  }
  else
  {
    if (!v7)
    {
      double v13 = _AAUIPPSLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_46_cold_2();
      }

      id v14 = *(id **)(a1 + 32);
      uint64_t v15 = objc_msgSend(v14[1], "aa_firstName");
      id v16 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "aa_lastName");
      id v7 = [v14 _fallbackProfilePictureForPersonWithFirstName:v15 lastName:v16];
    }
    uint64_t v17 = *(void *)(a1 + 56);
    id v18 = [*(id *)(a1 + 48) _correctlySizedImageFromImage:v7];
    (*(void (**)(uint64_t, void *, void))(v17 + 16))(v17, v18, 0);
  }
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_1();
    }

    id v8 = *(id **)(a1 + 32);
    id v9 = objc_msgSend(v8[1], "aa_firstName");
    id v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "aa_lastName");
    id v5 = [v8 _fallbackProfilePictureForPersonWithFirstName:v9 lastName:v10];
  }
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = [*(id *)(a1 + 40) _correctlySizedImageFromImage:v5];
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v6);
}

- (void)fetchProfilePictureFromCacheForAccountOwner:(id)a3
{
  id v4 = a3;
  id v5 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore fetchProfilePictureFromCacheForAccountOwner:]();
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__AAUIProfilePictureStore_fetchProfilePictureFromCacheForAccountOwner___block_invoke;
  v7[3] = &unk_263F922A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AAUIProfilePictureStore *)self fetchProfilePictureForAccountOwner:v7];
}

void __71__AAUIProfilePictureStore_fetchProfilePictureFromCacheForAccountOwner___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _saveProfilePictureToCacheIfNeeded:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_saveProfilePictureToCache:(id)a3
{
  id v3 = UIImagePNGRepresentation((UIImage *)a3);
  [v3 writeToFile:@"/var/mobile/Library/Caches/com.apple.AppleAccount/cachedProfilePicture.png" atomically:1];
  CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x263F25B08], @"/var/mobile/Library/Caches/com.apple.AppleAccount/cachedProfilePicture.png", @"com.apple.appleaccount.informationcache");
  id v4 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore _saveProfilePictureToCache:]();
  }
}

- (id)_readProfilePictureFromCache
{
  id v2 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:@"/var/mobile/Library/Caches/com.apple.AppleAccount/cachedProfilePicture.png"];
  id v3 = [MEMORY[0x263F827E8] imageWithData:v2];

  return v3;
}

- (BOOL)_isCachedProfilePictureUpdated:(id)a3
{
  id v4 = (UIImage *)a3;
  id v5 = [(AAUIProfilePictureStore *)self _readProfilePictureFromCache];
  id v6 = UIImagePNGRepresentation(v5);
  id v7 = UIImagePNGRepresentation(v4);

  LOBYTE(v4) = [v6 isEqualToData:v7];
  return (char)v4;
}

- (BOOL)_isProfilePictureCachePresent
{
  id v2 = (void *)CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x263F25B08], @"com.apple.appleaccount.informationcache");
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_saveProfilePictureToCacheIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(ACAccount *)self->_account aa_isAccountClass:*MEMORY[0x263F25618]])
  {
    if (![(AAUIProfilePictureStore *)self _isProfilePictureCachePresent])
    {
LABEL_7:
      [(AAUIProfilePictureStore *)self _saveProfilePictureToCache:v4];
      goto LABEL_8;
    }
    if (![(AAUIProfilePictureStore *)self _isCachedProfilePictureUpdated:v4])
    {
      id v5 = _AAUIPPSLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[AAUIProfilePictureStore _saveProfilePictureToCacheIfNeeded:]();
      }

      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)setProfilePictureForAccountOwner:(id)a3 cropRect:(id)a4
{
  id v6 = (UIImage *)a3;
  id v7 = a4;
  id v8 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:]0();
  }

  contactStore = self->_contactStore;
  id v10 = [(ACAccount *)self->_account aa_primaryEmail];
  uint64_t v11 = _AAUIDefaultFetchDescriptors();
  id v39 = 0;
  id v12 = [(CNContactStore *)contactStore unifiedMeContactMatchingEmailAddress:v10 keysToFetch:v11 error:&v39];
  id v13 = v39;

  if (v12)
  {
    id v14 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.9();
    }

    uint64_t v15 = (void *)[v12 mutableCopy];
    id v16 = _AAUIPPSLogSystem();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    id v37 = v13;
    if (v6)
    {
      if (v17) {
        -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.8();
      }

      id v18 = UIImageJPEGRepresentation(v6, 0.8);
      [v15 setImageData:v18];
      if (v7)
      {
        [v7 CGRectValue];
        objc_msgSend(v15, "setCropRect:");
      }
    }
    else
    {
      if (v17) {
        -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.7();
      }

      [v15 setImageData:0];
    }
    [v15 setMemojiMetadata:0];
    id v19 = objc_alloc_init(MEMORY[0x263EFEB48]);
    [v19 updateContact:v15];
    id v20 = self->_contactStore;
    id v38 = 0;
    BOOL v21 = [(CNContactStore *)v20 executeSaveRequest:v19 error:&v38];
    id v22 = v38;
    v23 = _AAUIPPSLogSystem();
    id v24 = v23;
    if (v21)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.5();
      }

      uint64_t v25 = [(AAUIProfilePictureStore *)self _contactSyncsWithiCloud:v12 error:0];
      if (v25)
      {
        id v26 = _AAUIPPSLogSystem();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.4();
        }

        int v27 = 1;
      }
      else
      {
        int v27 = 0;
      }
      id v24 = _AAUIPPSLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:](v25, v24, v28, v29, v30, v31, v32, v33);
      }
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:].cold.6();
      }
      int v27 = 0;
    }
    id v13 = v37;

    if (v27) {
      goto LABEL_33;
    }
  }
  if (![(ACAccount *)self->_account aa_isPrimaryEmailVerified])
  {
LABEL_33:
    v35 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:]();
    }

    v36 = [(ACAccount *)self->_account aa_personID];
    [(AAUIProfilePictureStore *)self updateCacheWithPhoto:v6 cropRect:v7 forPersonID:v36];
  }
  else
  {
    v34 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[AAUIProfilePictureStore setProfilePictureForAccountOwner:cropRect:]();
    }

    [(AAUIProfilePictureStore *)self _updateServerProfilePictureForAccountOwner:v6 cropRect:v7];
  }
}

- (id)profilePictureForFamilyMember:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 appleID];
    id v7 = [v4 firstName];
    id v8 = [v4 lastName];
    int v14 = 138412802;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    BOOL v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore profilePictureForFamilyMember: %@ %@ %@", (uint8_t *)&v14, 0x20u);
  }
  id v9 = [(AAUIProfilePictureStore *)self _profilePictureForFamilyMemberWithoutMonogramFallback:v4];
  if (!v9)
  {
    id v10 = [v4 firstName];
    uint64_t v11 = [v4 lastName];
    id v9 = [(AAUIProfilePictureStore *)self _fallbackProfilePictureForPersonWithFirstName:v10 lastName:v11];
  }
  id v12 = [(AAUIProfilePictureStore *)self _correctlySizedImageFromImage:v9];

  return v12;
}

- (void)fetchProfilePictureForFamilyMember:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 appleID];
    id v10 = [v6 firstName];
    uint64_t v11 = [v6 lastName];
    *(_DWORD *)buf = 138412802;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v11;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore fetchProfilePictureForFamilyMember: %@ %@ %@ completion:", buf, 0x20u);
  }
  if ([(ACAccount *)self->_account isEnabledForDataclass:*MEMORY[0x263EFB3F0]]
    && ([(AAUIProfilePictureStore *)self _familyMemberPersonPicture:v6],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v13 = (void *)v12;
    int v14 = [(AAUIProfilePictureStore *)self _correctlySizedImageFromImage:v12];
    v7[2](v7, v14, 0);
  }
  else
  {
    uint64_t v15 = [v6 personID];
    id v13 = [v15 stringValue];

    __int16 v16 = +[AAUIServerSuppliedProfilePictureCache sharedCache];
    double pictureDiameter = self->_pictureDiameter;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __73__AAUIProfilePictureStore_fetchProfilePictureForFamilyMember_completion___block_invoke;
    v18[3] = &unk_263F922F8;
    v18[4] = self;
    id v19 = v6;
    uint64_t v20 = v7;
    [v16 profilePictureForPersonID:v13 diameter:v18 completion:pictureDiameter];
  }
}

void __73__AAUIProfilePictureStore_fetchProfilePictureForFamilyMember_completion___block_invoke(id *a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    id v10 = a1[4];
    id v9 = a1[5];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __73__AAUIProfilePictureStore_fetchProfilePictureForFamilyMember_completion___block_invoke_2;
    v16[3] = &unk_263F922D0;
    v16[4] = v10;
    id v17 = v9;
    id v18 = a1[6];
    [v10 _fetchProfilePictureForFamilyMemberFromServer:v17 serverCacheTag:v8 completion:v16];
  }
  else
  {
    if (!v7)
    {
      id v11 = a1[4];
      uint64_t v12 = [a1[5] firstName];
      id v13 = [a1[5] lastName];
      id v7 = [v11 _fallbackProfilePictureForPersonWithFirstName:v12 lastName:v13];
    }
    int v14 = (void (**)(id, void *, void))a1[6];
    uint64_t v15 = [a1[4] _correctlySizedImageFromImage:v7];
    v14[2](v14, v15, 0);
  }
}

void __73__AAUIProfilePictureStore_fetchProfilePictureForFamilyMember_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (!v11)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) firstName];
    id v8 = [*(id *)(a1 + 40) lastName];
    id v11 = [v6 _fallbackProfilePictureForPersonWithFirstName:v7 lastName:v8];
  }
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [*(id *)(a1 + 32) _correctlySizedImageFromImage:v11];
  (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v5);
}

- (void)fetchRawImageAndCropRectForAccountOwner:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__AAUIProfilePictureStore_fetchRawImageAndCropRectForAccountOwner___block_invoke;
  aBlock[3] = &unk_263F92048;
  aBlock[4] = self;
  id v5 = v4;
  id v11 = v5;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  if ([(ACAccount *)self->_account isEnabledForDataclass:*MEMORY[0x263EFB3F0]])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __67__AAUIProfilePictureStore_fetchRawImageAndCropRectForAccountOwner___block_invoke_57;
    v7[3] = &unk_263F92320;
    id v8 = v5;
    uint64_t v9 = v6;
    [(AAUIProfilePictureStore *)self _meCardRawImageAndCropRect:v7];
  }
  else
  {
    v6[2](v6);
  }
}

void __67__AAUIProfilePictureStore_fetchRawImageAndCropRectForAccountOwner___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "aa_personID");
  BOOL v3 = (void *)[v2 copy];

  id v4 = +[_AAUIRawImageAndCropRectCache entryForPersonID:v3];
  if ([v4 isValid])
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v4 rawImage];
    [v4 rawCropRect];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F258D8]) initWithAccount:*(void *)(*(void *)(a1 + 32) + 8)];
    id v7 = [v4 serverCacheTag];
    [v6 setServerCacheTag:v7];

    id v8 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Fetching account owner profile picture from server with request %@", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 32) _fetchAndCacheRawImageAndCropRectWithRequest:v6 personID:v3 completion:*(void *)(a1 + 40)];
  }
}

uint64_t __67__AAUIProfilePictureStore_fetchRawImageAndCropRectForAccountOwner___block_invoke_57(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 | a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchRawImageAndCropRectForFamilyMember:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__AAUIProfilePictureStore_fetchRawImageAndCropRectForFamilyMember_completion___block_invoke;
  aBlock[3] = &unk_263F92348;
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  __int16 v16 = self;
  id v17 = v9;
  id v10 = _Block_copy(aBlock);
  if ([(ACAccount *)self->_account isEnabledForDataclass:*MEMORY[0x263EFB3F0]])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __78__AAUIProfilePictureStore_fetchRawImageAndCropRectForFamilyMember_completion___block_invoke_60;
    v11[3] = &unk_263F92320;
    id v12 = v9;
    id v13 = v10;
    [(AAUIProfilePictureStore *)self _familyMember:v8 rawImageAndCropRect:v11];
  }
}

void __78__AAUIProfilePictureStore_fetchRawImageAndCropRectForFamilyMember_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) personID];
  BOOL v3 = [v2 stringValue];

  id v4 = +[_AAUIRawImageAndCropRectCache entryForPersonID:v3];
  if ([v4 isValid])
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [v4 rawImage];
    [v4 rawCropRect];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F3BF30]) initWithGrandSlamSigner:*(void *)(*(void *)(a1 + 40) + 24)];
    id v7 = [*(id *)(a1 + 32) personID];
    [v6 setFamilyMemberDSID:v7];

    id v8 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
    id v9 = objc_msgSend(v8, "ams_activeiTunesAccount");
    [v6 setiTunesAccount:v9];

    id v10 = [v4 serverCacheTag];
    [v6 setServerCacheTag:v10];

    uint64_t v11 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "Fetching family member profile picture from server with request %@", (uint8_t *)&v12, 0xCu);
    }

    [*(id *)(a1 + 40) _fetchAndCacheRawImageAndCropRectWithRequest:v6 personID:v3 completion:*(void *)(a1 + 48)];
  }
}

uint64_t __78__AAUIProfilePictureStore_fetchRawImageAndCropRectForFamilyMember_completion___block_invoke_60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 | a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)profilePictureForLocalContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore profilePictureForLocalContact:]();
  }

  id v6 = [v4 imageData];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F827E8];
    id v8 = [v4 imageData];
    id v9 = [v7 imageWithData:v8];
    [(AAUIProfilePictureStore *)self profilePictureForPicture:v9];
  }
  else
  {
    id v8 = [v4 firstName];
    id v9 = [v4 lastName];
    [(AAUIProfilePictureStore *)self _fallbackProfilePictureForPersonWithFirstName:v8 lastName:v9];
  id v10 = };

  uint64_t v11 = [(AAUIProfilePictureStore *)self _correctlySizedImageFromImage:v10];

  return v11;
}

- (id)monogramForCurrentAccount
{
  BOOL v3 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore monogramForCurrentAccount]();
  }

  id v4 = [(AAUIProfilePictureStore *)self _sizedProfilePictureWithFallback:0];
  return v4;
}

void __76__AAUIProfilePictureStore__beginObservingContactStoreDidChangeNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _contactStoreDidChange:v3];
}

- (void)_contactStoreDidChange:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v4 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore _contactStoreDidChange:]();
  }

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"AAUIProfilePictureStoreDidChange" object:self];
}

- (void)_endObservingContactStoreDidChangeNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_contactStoreDidChangeObserver];
}

- (id)_fallbackProfilePictureForPersonWithFirstName:(id)a3 lastName:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore _fallbackProfilePictureForPersonWithFirstName:lastName:]();
  }

  if (!v6 || !v7) {
    goto LABEL_8;
  }
  id v9 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore _fallbackProfilePictureForPersonWithFirstName:lastName:]();
  }

  id v10 = objc_alloc_init(MEMORY[0x263EFEAF0]);
  [v10 setGivenName:v6];
  [v10 setFamilyName:v7];
  uint64_t v11 = [(AAUIProfilePictureStore *)self _monogrammer];
  v22[0] = v10;
  int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  id v13 = [(AAUIProfilePictureStore *)self renderingScope];
  uint64_t v14 = [v11 avatarImageForContacts:v12 scope:v13];

  if (!v14)
  {
LABEL_8:
    id v15 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_1();
    }

    double v16 = self->_pictureDiameter * 0.5;
    id v17 = [(AAUIProfilePictureStore *)self _monogrammer];
    id v18 = [v17 placeholderImageProvider];
    id v19 = [MEMORY[0x263F82B60] mainScreen];
    [v19 scale];
    uint64_t v14 = objc_msgSend(v18, "imageForSize:scale:style:", 0, v16, v16, v20);
  }
  return v14;
}

- (void)_fetchAndCacheRawImageAndCropRectWithRequest:(id)a3 personID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __92__AAUIProfilePictureStore__fetchAndCacheRawImageAndCropRectWithRequest_personID_completion___block_invoke;
  v10[3] = &unk_263F92398;
  id v11 = v8;
  id v9 = v8;
  [(AAUIProfilePictureStore *)self _fetchProfilePictureSupersetWithRequest:a3 personID:a4 completion:v10];
}

uint64_t __92__AAUIProfilePictureStore__fetchAndCacheRawImageAndCropRectWithRequest_personID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_correctlySizedImageFromImage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 size];
    double v7 = v6;
    [(AAUIProfilePictureStore *)self pictureDiameter];
    if (v7 == v8)
    {
      id v9 = v5;
    }
    else
    {
      double pictureDiameter = self->_pictureDiameter;
      id v11 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", pictureDiameter, pictureDiameter);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __57__AAUIProfilePictureStore__correctlySizedImageFromImage___block_invoke;
      v13[3] = &unk_263F923C0;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      id v14 = v5;
      double v17 = pictureDiameter;
      double v18 = pictureDiameter;
      id v9 = [v11 imageWithActions:v13];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __57__AAUIProfilePictureStore__correctlySizedImageFromImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_fetchProfilePictureForAccountOwnerFromServer:(id)a3 serverCacheTag:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v8 = (objc_class *)MEMORY[0x263F258D8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  int v12 = (void *)[[v8 alloc] initWithAccount:self->_account];
  [v12 setServerCacheTag:v10];

  id v13 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    uint64_t v15 = v12;
    _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "Fetching account owner profile picture from server with request %@", (uint8_t *)&v14, 0xCu);
  }

  [(AAUIProfilePictureStore *)self _fetchProfilePictureWithRequest:v12 personID:v11 completion:v9];
}

- (void)_fetchProfilePictureSupersetWithRequest:(id)a3 personID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__AAUIProfilePictureStore__fetchProfilePictureSupersetWithRequest_personID_completion___block_invoke;
  v14[3] = &unk_263F923E8;
  id v15 = v8;
  uint64_t v16 = self;
  id v17 = v9;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [v13 performRequestWithHandler:v14];
}

void __87__AAUIProfilePictureStore__fetchProfilePictureSupersetWithRequest_personID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  if ([v6 statusCode] == 404)
  {
    id v12 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v39 = 138412290;
      uint64_t v40 = v13;
      _os_log_impl(&dword_209754000, v12, OS_LOG_TYPE_DEFAULT, "Fetch profile picture request %@ response: No photo was found on the server", (uint8_t *)&v39, 0xCu);
    }
    int v14 = 0;
    id v15 = 0;
    uint64_t v16 = 0;
LABEL_12:

    uint64_t v27 = *(void **)(a1 + 40);
    uint64_t v28 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v8, v9, v10, v11);
    [v27 updateCacheWithPhoto:v15 cropRect:v28 forPersonID:*(void *)(a1 + 48)];

    uint64_t v29 = 0;
    uint64_t v30 = 1;
    goto LABEL_26;
  }
  if ([v6 statusCode] == 200)
  {
    id v12 = v6;
    id v17 = [v12 photoData];
    id v18 = _AAUIPPSLogSystem();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        uint64_t v20 = *(void *)(a1 + 32);
        int v39 = 138412290;
        uint64_t v40 = v20;
        _os_log_impl(&dword_209754000, v18, OS_LOG_TYPE_DEFAULT, "Fetch profile picture request %@ response: Success! Status code 200 with image data", (uint8_t *)&v39, 0xCu);
      }

      id v15 = (void *)[objc_alloc(MEMORY[0x263F827E8]) initWithData:v17];
      BOOL v21 = [v12 cropRect];

      if (v21)
      {
        id v22 = [v12 cropRect];
        [v22 CGRectValue];
        double v8 = v23;
        double v9 = v24;
        double v10 = v25;
        double v11 = v26;
      }
      int v14 = objc_msgSend(*(id *)(a1 + 40), "cacheablePictureForPicture:cropRect:", v15, v8, v9, v10, v11);
      uint64_t v16 = [v12 serverCacheTag];

      goto LABEL_12;
    }
    if (v19)
    {
      uint64_t v37 = *(void *)(a1 + 32);
      int v39 = 138412290;
      uint64_t v40 = v37;
      _os_log_impl(&dword_209754000, v18, OS_LOG_TYPE_DEFAULT, "Fetch profile picture request %@ response: Failure. Status code 200, but no image data", (uint8_t *)&v39, 0xCu);
    }

    goto LABEL_23;
  }
  uint64_t v31 = [v6 statusCode];
  id v12 = _AAUIPPSLogSystem();
  BOOL v32 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v31 == 304)
  {
    if (v32)
    {
      uint64_t v33 = *(void *)(a1 + 32);
      int v39 = 138412290;
      uint64_t v40 = v33;
      _os_log_impl(&dword_209754000, v12, OS_LOG_TYPE_DEFAULT, "Fetch profile picture request %@ response: Cache still valid.", (uint8_t *)&v39, 0xCu);
    }
LABEL_23:

    int v14 = 0;
    id v15 = 0;
    uint64_t v16 = 0;
    uint64_t v30 = 0;
    uint64_t v29 = 0;
    goto LABEL_26;
  }
  if (v32)
  {
    uint64_t v34 = *(void *)(a1 + 32);
    v35 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "statusCode"));
    int v39 = 138412546;
    uint64_t v40 = v34;
    __int16 v41 = 2112;
    v42 = v35;
    _os_log_impl(&dword_209754000, v12, OS_LOG_TYPE_DEFAULT, "Fetch profile picture request %@ response: Failure. Status code %@", (uint8_t *)&v39, 0x16u);
  }
  if (v7)
  {
    id v36 = v7;
  }
  else
  {
    id v36 = [v6 error];
  }
  uint64_t v29 = v36;
  int v14 = 0;
  id v15 = 0;
  uint64_t v16 = 0;
  uint64_t v30 = 0;
LABEL_26:
  uint64_t v38 = *(void *)(a1 + 56);
  if (v38) {
    (*(void (**)(uint64_t, uint64_t, void *, void *, void *, void *, double, double, double, double))(v38 + 16))(v38, v30, v14, v15, v16, v29, v8, v9, v10, v11);
  }
}

- (void)_fetchProfilePictureWithRequest:(id)a3 personID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__AAUIProfilePictureStore__fetchProfilePictureWithRequest_personID_completion___block_invoke;
  v10[3] = &unk_263F92398;
  id v11 = v8;
  id v9 = v8;
  [(AAUIProfilePictureStore *)self _fetchProfilePictureSupersetWithRequest:a3 personID:a4 completion:v10];
}

uint64_t __79__AAUIProfilePictureStore__fetchProfilePictureWithRequest_personID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a6);
  }
  return result;
}

- (id)_profilePictureForFamilyMemberWithoutMonogramFallback:(id)a3
{
  id v4 = a3;
  if (![(ACAccount *)self->_account isEnabledForDataclass:*MEMORY[0x263EFB3F0]]|| ([(AAUIProfilePictureStore *)self _familyMemberPersonPicture:v4], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = +[AAUIServerSuppliedProfilePictureCache sharedCache];
    id v7 = [v4 personID];
    id v8 = [v7 stringValue];
    double pictureDiameter = self->_pictureDiameter;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    int v14 = __81__AAUIProfilePictureStore__profilePictureForFamilyMemberWithoutMonogramFallback___block_invoke;
    id v15 = &unk_263F92208;
    uint64_t v16 = self;
    id v17 = v4;
    uint64_t v5 = [v6 profilePictureForPersonID:v8 diameter:&v12 serverFetchBlock:pictureDiameter];
  }
  double v10 = -[AAUIProfilePictureStore _correctlySizedImageFromImage:](self, "_correctlySizedImageFromImage:", v5, v12, v13, v14, v15, v16);

  return v10;
}

uint64_t __81__AAUIProfilePictureStore__profilePictureForFamilyMemberWithoutMonogramFallback___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fetchProfilePictureForFamilyMemberFromServer:*(void *)(a1 + 40) serverCacheTag:a2 completion:0];
}

- (void)_fetchProfilePictureForFamilyMemberFromServer:(id)a3 serverCacheTag:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (objc_class *)MEMORY[0x263F3BF30];
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = (void *)[[v9 alloc] initWithGrandSlamSigner:self->_grandSlamSigner];
  uint64_t v13 = [v8 personID];
  [v12 setFamilyMemberDSID:v13];

  int v14 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  id v15 = objc_msgSend(v14, "ams_activeiTunesAccount");
  [v12 setiTunesAccount:v15];

  [v12 setServerCacheTag:v11];
  uint64_t v16 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    uint64_t v20 = v12;
    _os_log_impl(&dword_209754000, v16, OS_LOG_TYPE_DEFAULT, "Fetching family member profile picture from server with request %@", (uint8_t *)&v19, 0xCu);
  }

  id v17 = [v8 personID];
  id v18 = [v17 stringValue];
  [(AAUIProfilePictureStore *)self _fetchProfilePictureWithRequest:v12 personID:v18 completion:v10];
}

- (id)_meCardPicture
{
  uint64_t v3 = [MEMORY[0x263EFEA58] authorizationStatusForEntityType:0];
  id v4 = _AAUIPPSLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == 3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Fetching me card picture", buf, 2u);
    }

    contactStore = self->_contactStore;
    id v7 = [(ACAccount *)self->_account aa_primaryEmail];
    id v8 = _AAUIDefaultFetchDescriptors();
    id v32 = 0;
    id v9 = [(CNContactStore *)contactStore unifiedMeContactMatchingEmailAddress:v7 keysToFetch:v8 error:&v32];
    id v4 = v32;

    if (v9)
    {
      id v10 = [v9 imageData];

      if (!v10) {
        goto LABEL_26;
      }
      id v11 = _AAUIPPSLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[AAUIProfilePictureStore _meCardPicture].cold.6();
      }

      id v12 = objc_alloc(MEMORY[0x263F827E8]);
      uint64_t v13 = [v9 imageData];
      int v14 = (void *)[v12 initWithData:v13];

      [v9 cropRect];
      BOOL IsEmpty = CGRectIsEmpty(v36);
      uint64_t v16 = _AAUIPPSLogSystem();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
      if (IsEmpty)
      {
        if (v17) {
          -[AAUIProfilePictureStore _meCardPicture].cold.4();
        }

        double v18 = *MEMORY[0x263F001A8];
        double v19 = *(double *)(MEMORY[0x263F001A8] + 8);
        double v20 = *(double *)(MEMORY[0x263F001A8] + 16);
        double v21 = *(double *)(MEMORY[0x263F001A8] + 24);
      }
      else
      {
        if (v17) {
          -[AAUIProfilePictureStore _meCardPicture].cold.5();
        }

        [v9 cropRect];
      }
      id v22 = -[AAUIProfilePictureStore cacheablePictureForPicture:cropRect:](self, "cacheablePictureForPicture:cropRect:", v14, v18, v19, v20, v21);

      if (!v22)
      {
LABEL_26:
        id v22 = [(AAUIProfilePictureStore *)self _monogrammedContactImage:v9];
      }
      double v24 = _AAUIPPSLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        [(AAUIProfilePictureStore *)(uint64_t)v22 _meCardPicture];
      }
    }
    else
    {
      if (v4)
      {
        double v23 = _AAUIPPSLogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[AAUIProfilePictureStore _meCardPicture]();
        }
      }
      double v24 = _AAUIPPSLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[AAUIProfilePictureStore _meCardPicture]();
      }
      id v22 = 0;
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore skipping CNContact lookup because we are not authorized", v34, 2u);
    }
    id v22 = 0;
  }

  return v22;
}

- (void)meCardWithVisualIdentity:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x3032000000;
  double v23 = __Block_byref_object_copy_;
  double v24 = __Block_byref_object_dispose_;
  contactStore = self->_contactStore;
  id v6 = [(ACAccount *)self->_account aa_primaryEmail];
  id v7 = _AAUIDefaultFetchDescriptors();
  id v19 = 0;
  id v8 = [(CNContactStore *)contactStore unifiedMeContactMatchingEmailAddress:v6 keysToFetch:v7 error:&v19];
  id v9 = v19;
  id v25 = v8;

  uint64_t v10 = v21[5];
  BOOL v11 = v10 != 0;
  id v12 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v27 = v10 != 0;
    _os_log_impl(&dword_209754000, v12, OS_LOG_TYPE_DEFAULT, "meCard exists %d", buf, 8u);
  }

  uint64_t v13 = [(id)v21[5] imageData];

  int v14 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v27 = v13 != 0;
    _os_log_impl(&dword_209754000, v14, OS_LOG_TYPE_DEFAULT, "meCard.image exists %d", buf, 8u);
  }

  if (v13)
  {
    v4[2](v4, v21[5]);
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke;
    v15[3] = &unk_263F92438;
    BOOL v18 = v11;
    BOOL v17 = &v20;
    v15[4] = self;
    uint64_t v16 = v4;
    [(AAUIProfilePictureStore *)self fetchRawImageAndCropRectForAccountOwner:v15];
  }
  _Block_object_dispose(&v20, 8);
}

void __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v13 = a2;
  int v14 = a3;
  id v15 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v47.origin.x = a4;
    v47.origin.y = a5;
    v47.size.width = a6;
    v47.size.height = a7;
    uint64_t v16 = NSStringFromCGRect(v47);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v43 = v14;
    _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "RawImageAndCropRect is %@ %@ %@", buf, 0x20u);
  }
  BOOL v17 = (UIImage *)v13;
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  UIImageJPEGRepresentation(v17, 1.0);
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  if (*(unsigned char *)(a1 + 56))
  {
    BOOL v18 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_209754000, v18, OS_LOG_TYPE_DEFAULT, "meCard exists", v40, 2u);
    }

    id v19 = (id)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) mutableCopy];
  }
  else
  {
    uint64_t v20 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_209754000, v20, OS_LOG_TYPE_DEFAULT, "meCard is missing", v40, 2u);
    }

    id v19 = objc_alloc_init(MEMORY[0x263EFEAF0]);
    double v21 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "aa_firstName");
    [v19 setGivenName:v21];

    uint64_t v22 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "aa_lastName");
    [v19 setFamilyName:v22];
  }
  uint64_t v23 = *(void *)(*(void *)&buf[8] + 40);
  double v24 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v40 = 67109120;
    BOOL v41 = v23 != 0;
    _os_log_impl(&dword_209754000, v24, OS_LOG_TYPE_DEFAULT, "raw.image is not nil %d", v40, 8u);
  }

  id v25 = *(void **)(*(void *)&buf[8] + 40);
  uint64_t v26 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) imageData];

  BOOL v27 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v40 = 67109120;
    BOOL v41 = v25 != v26;
    _os_log_impl(&dword_209754000, v27, OS_LOG_TYPE_DEFAULT, "meCard.image is different from rawImage %d", v40, 8u);
  }

  if (v25 != v26 && v23 != 0)
  {
    [v19 setImageData:*(void *)(*(void *)&buf[8] + 40)];
    objc_msgSend(v19, "setCropRect:", a4, a5, a6, a7);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v19);
    uint64_t v28 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) imageData];
      *(_DWORD *)uint64_t v40 = 67109120;
      BOOL v41 = v29 != 0;
      _os_log_impl(&dword_209754000, v28, OS_LOG_TYPE_DEFAULT, "rawimagedata on mutable is not nil %d", v40, 8u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v30 = *(void **)(a1 + 32);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke_71;
    v34[3] = &unk_263F92410;
    uint64_t v38 = buf;
    v35 = v17;
    id v31 = v19;
    uint64_t v33 = *(void **)(a1 + 40);
    uint64_t v32 = *(void *)(a1 + 48);
    id v36 = v31;
    uint64_t v39 = v32;
    id v37 = v33;
    [v30 fetchProfilePictureForAccountOwner:v34];
  }
  _Block_object_dispose(buf, 8);
}

uint64_t __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke_71(uint64_t a1, UIImage *image)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = UIImageJPEGRepresentation(image, 0.8);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke_71_cold_2(a1, v6, v7, v8, v9, v10, v11, v12);
  }

  [*(id *)(a1 + 40) setImageData:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  id v13 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke_71_cold_1(a1 + 56, v13, v14, v15, v16, v17, v18, v19);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
  uint64_t v20 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    double v21 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) imageData];
    v23[0] = 67109120;
    v23[1] = v21 != 0;
    _os_log_impl(&dword_209754000, v20, OS_LOG_TYPE_DEFAULT, "serverimagedata on mutable is not nil %d", (uint8_t *)v23, 8u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_decodeImageAndCropRectForContact:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 imageData];
  if (v7)
  {
    uint64_t v8 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__AAUIProfilePictureStore__decodeImageAndCropRectForContact_completion___block_invoke;
    block[3] = &unk_263F92460;
    id v12 = v6;
    id v10 = v7;
    id v11 = v5;
    dispatch_async(v8, block);
  }
  else
  {
    (*((void (**)(id, void, void, double, double, double, double))v6 + 2))(v6, 0, 0, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  }
}

void __72__AAUIProfilePictureStore__decodeImageAndCropRectForContact_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [MEMORY[0x263F827E8] imageWithData:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) cropRect];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, 0);
}

- (void)_meCardRawImageAndCropRect:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id, double, double, double, double))a3;
  if ([MEMORY[0x263EFEA58] authorizationStatusForEntityType:0] == 3)
  {
    contactStore = self->_contactStore;
    id v6 = [(ACAccount *)self->_account aa_primaryEmail];
    uint64_t v7 = _AAUIDefaultFetchDescriptors();
    id v11 = 0;
    uint64_t v8 = [(CNContactStore *)contactStore unifiedMeContactMatchingEmailAddress:v6 keysToFetch:v7 error:&v11];
    id v9 = v11;

    if (v8) {
      [(AAUIProfilePictureStore *)self _decodeImageAndCropRectForContact:v8 completion:v4];
    }
    else {
      v4[2](v4, 0, v9, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
    }
  }
  else
  {
    id v10 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore skipping CNContact lookup because we are not authorized", buf, 2u);
    }

    v4[2](v4, 0, 0, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  }
}

- (id)_familyMemberPersonPicture:(id)a3
{
  id v10 = 0;
  uint64_t v4 = [(AAUIProfilePictureStore *)self _contactWithImageDataMatchingFamilyMember:a3 error:&v10];
  id v5 = v10;
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = [(AAUIProfilePictureStore *)self _monogrammedContactImage:v4];
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = _AAUIPPSLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AAUIProfilePictureStore _familyMemberPersonPicture:]();
      }
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_familyMember:(id)a3 rawImageAndCropRect:(id)a4
{
  id v9 = 0;
  id v6 = (void (**)(id, void, id, double, double, double, double))a4;
  uint64_t v7 = [(AAUIProfilePictureStore *)self _contactWithImageDataMatchingFamilyMember:a3 error:&v9];
  id v8 = v9;
  [(AAUIProfilePictureStore *)self _decodeImageAndCropRectForContact:v7 completion:v6];
  if (v7) {
    [(AAUIProfilePictureStore *)self _decodeImageAndCropRectForContact:v7 completion:v6];
  }
  else {
    v6[2](v6, 0, v8, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  }
}

- (id)_monogrammedContactImage:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AAUIProfilePictureStore *)self _monogrammer];
  v10[0] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];

  uint64_t v7 = [(AAUIProfilePictureStore *)self renderingScope];
  id v8 = [v5 avatarImageForContacts:v6 scope:v7];

  return v8;
}

- (id)_contactWithImageDataMatchingFamilyMember:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([MEMORY[0x263EFEA58] authorizationStatusForEntityType:0] == 3)
  {
    uint64_t v7 = (void *)MEMORY[0x263EFE9F8];
    id v8 = [v6 appleID];
    id v9 = [v7 predicateForContactsMatchingEmailAddress:v8];

    contactStore = self->_contactStore;
    id v11 = _AAUIDefaultFetchDescriptors();
    id v12 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v9 keysToFetch:v11 error:a4];
    id v13 = [v12 firstObject];
  }
  else
  {
    uint64_t v14 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_209754000, v14, OS_LOG_TYPE_DEFAULT, "AAUIProfilePictureStore skipping CNContact lookup for family member because we are not authorized", v16, 2u);
    }

    id v13 = 0;
  }

  return v13;
}

- (BOOL)_contactSyncsWithiCloud:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore _contactSyncsWithiCloud:error:]();
  }

  if ([v6 isUnified])
  {
    id v8 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[AAUIProfilePictureStore _contactSyncsWithiCloud:error:]();
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = objc_msgSend(v6, "linkedContacts", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([(AAUIProfilePictureStore *)self _contactSyncsWithiCloud:*(void *)(*((void *)&v25 + 1) + 8 * i) error:a4])
          {
            uint64_t v14 = _AAUIPPSLogSystem();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
              -[AAUIProfilePictureStore _contactSyncsWithiCloud:error:]();
            }
            LOBYTE(v23) = 1;
            goto LABEL_24;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    goto LABEL_20;
  }
  id v9 = [(AAUIProfilePictureStore *)self _getAccountIdentifierForContact:v6 error:a4];
  if (v9)
  {
    uint64_t v14 = [(ACAccountStore *)self->_accountStore accountWithIdentifier:v9 error:a4];
    uint64_t v15 = [v14 accountType];
    uint64_t v16 = [v15 identifier];
    uint64_t v17 = *MEMORY[0x263EFAE58];
    char v18 = [v16 isEqualToString:*MEMORY[0x263EFAE58]];

    uint64_t v19 = [v14 parentAccount];
    uint64_t v20 = v19;
    if ((v18 & 1) == 0)
    {
      double v21 = [v19 accountType];
      uint64_t v22 = [v21 identifier];
      int v23 = [v22 isEqualToString:v17];

      if (!v23)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v20 = [v14 parentAccount];
    }
    LOBYTE(v23) = [v20 isEnabledForDataclass:*MEMORY[0x263EFB3F0]];

    goto LABEL_24;
  }
LABEL_20:
  LOBYTE(v23) = 0;
LABEL_25:

  return v23;
}

- (id)_getAccountIdentifierForContact:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x263EFEA80];
  uint64_t v7 = [a3 identifier];
  id v8 = [v6 predicateForContainerOfContactWithIdentifier:v7];

  id v9 = [(CNContactStore *)self->_contactStore containersMatchingPredicate:v8 error:a4];
  uint64_t v10 = [v9 firstObject];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x263EFE9D0];
    uint64_t v12 = [v10 identifier];
    id v13 = [v11 predicateForAccountForContainerWithIdentifier:v12];

    uint64_t v14 = [(CNContactStore *)self->_contactStore accountsMatchingPredicate:v13 error:a4];
    uint64_t v15 = [v14 firstObject];

    if (v15
      && ([v15 externalIdentifierString],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          uint64_t v17 = [v16 length],
          v16,
          v17))
    {
      char v18 = [v15 externalIdentifierString];
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (void)_updateServerProfilePictureForAccountOwner:(id)a3 cropRect:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [[AAUIUpdateMyPhotoRequest alloc] initWithAccount:self->_account photo:v6 cropRect:v7];
  id v9 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Updating account owner profile picture on server to %@ cropRect %@ with request %@", buf, 0x20u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__AAUIProfilePictureStore__updateServerProfilePictureForAccountOwner_cropRect___block_invoke;
  v12[3] = &unk_263F92488;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(AARequest *)v8 performRequestWithHandler:v12];
}

void __79__AAUIProfilePictureStore__updateServerProfilePictureForAccountOwner_cropRect___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 statusCode];
  id v8 = _AAUIPPSLogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == 200)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Update profile picture request %@ response: Success! Status code 200", buf, 0xCu);
    }

    if (_AAUILogGreenTeaEnabled())
    {
      uint64_t v14 = 0;
      _AAUILogGreenTeaWithFormat(@"Uploaded 1 photos with location to Apple ID");
      _AAUILogGreenTeaTransmittingPhotosOrVideos();
    }
    id v10 = (id *)a1[4];
    uint64_t v11 = a1[5];
    uint64_t v12 = a1[6];
    id v8 = objc_msgSend(v10[1], "aa_personID", v14);
    [v10 updateCacheWithPhoto:v11 cropRect:v12 forPersonID:v8];
  }
  else if (v9)
  {
    id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "statusCode"));
    *(_DWORD *)buf = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v13;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Update profile picture request %@ response: Failure. Status code %@", buf, 0x16u);
  }
}

- (void)updateCacheWithPhoto:(id)a3 cropRect:(id)a4 forPersonID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _AAUIPPSLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AAUIProfilePictureStore updateCacheWithPhoto:cropRect:forPersonID:].cold.5();
  }

  if (v10)
  {
    uint64_t v12 = +[AAUIServerSuppliedProfilePictureCache sharedCache];
    id v13 = [v12 serverCacheTagForPersonID:v10 diameter:self->_pictureDiameter];

    uint64_t v14 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[AAUIProfilePictureStore updateCacheWithPhoto:cropRect:forPersonID:].cold.4();
    }

    if (v9)
    {
      [v9 CGRectValue];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
    }
    else
    {
      double v16 = *MEMORY[0x263F001A8];
      double v18 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v20 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v22 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
    int v23 = -[AAUIProfilePictureStore cacheablePictureForPicture:cropRect:](self, "cacheablePictureForPicture:cropRect:", v8, v16, v18, v20, v22);
    uint64_t v24 = +[_AAUIRawImageAndCropRectCacheEntry entryWithRawImage:rawCropRect:serverCacheTag:](_AAUIRawImageAndCropRectCacheEntry, "entryWithRawImage:rawCropRect:serverCacheTag:", v8, v13, v16, v18, v20, v22);
    +[_AAUIRawImageAndCropRectCache setEntry:v24 forPersonID:v10];
    long long v25 = +[AAUIServerSuppliedProfilePictureCache sharedCache];
    int v26 = [v25 updateProfilePicture:v23 didReceiveNewPicture:1 serverCacheTag:v13 forPersonID:v10];

    long long v27 = _AAUIPPSLogSystem();
    long long v28 = v27;
    if (v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[AAUIProfilePictureStore updateCacheWithPhoto:cropRect:forPersonID:]();
      }

      dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_0);
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[AAUIProfilePictureStore updateCacheWithPhoto:cropRect:forPersonID:]();
      }
    }
  }
  else
  {
    id v13 = _AAUIPPSLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AAUIProfilePictureStore updateCacheWithPhoto:cropRect:forPersonID:]();
    }
  }
}

void __69__AAUIProfilePictureStore_updateCacheWithPhoto_cropRect_forPersonID___block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"AAUIProfilePictureStoreDidChange" object:0];
}

- (id)profilePictureForPicture:(id)a3
{
  return -[AAUIProfilePictureStore _profilePictureForPicture:crop:cropRect:cacheable:](self, "_profilePictureForPicture:crop:cropRect:cacheable:", a3, 0, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (id)profilePictureForPicture:(id)a3 cropRect:(CGRect)a4
{
  return -[AAUIProfilePictureStore _profilePictureForPicture:crop:cropRect:cacheable:](self, "_profilePictureForPicture:crop:cropRect:cacheable:", a3, 1, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (id)cacheablePictureForPicture:(id)a3 cropRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  if (CGRectIsEmpty(v20))
  {
    double v10 = *MEMORY[0x263F001A8];
    double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v14 = self;
    id v15 = v9;
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v14 = self;
    id v15 = v9;
    uint64_t v16 = 1;
    double v10 = x;
    double v11 = y;
    double v12 = width;
    double v13 = height;
  }
  double v17 = -[AAUIProfilePictureStore _profilePictureForPicture:crop:cropRect:cacheable:](v14, "_profilePictureForPicture:crop:cropRect:cacheable:", v15, v16, 1, v10, v11, v12, v13);

  return v17;
}

- (id)_profilePictureForPicture:(id)a3 crop:(BOOL)a4 cropRect:(CGRect)a5 cacheable:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v11 = a4;
  id v13 = a3;
  if (v13)
  {
    if (v6)
    {
      uint64_t v14 = +[AAUIServerSuppliedProfilePictureCache sharedCache];
      [v14 pictureDiameter];
      double pictureDiameter = v15;
    }
    else
    {
      double pictureDiameter = self->_pictureDiameter;
    }
    v22.double width = pictureDiameter;
    v22.double height = pictureDiameter;
    UIGraphicsBeginImageContextWithOptions(v22, 0, 0.0);
    double v18 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", 0.0, 0.0, pictureDiameter, pictureDiameter);
    [v18 addClip];
    if (v11)
    {
      uint64_t v19 = objc_msgSend(v13, "imageByCroppingToRect:", x, y, width, height);

      id v13 = (id)v19;
    }
    objc_msgSend(v13, "drawInRect:", 0.0, 0.0, pictureDiameter, pictureDiameter);
    double v17 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (void)fetchImageForAppleAccountPresentation:(id)a3
{
  id v4 = (void (**)(id, id, void, double, double, double, double))a3;
  id v5 = [(AAUIProfilePictureStore *)self profilePictureForAccountOwnerWithoutMonogramFallback];
  v4[2](v4, v5, 0, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
}

- (double)pictureDiameter
{
  return self->_pictureDiameter;
}

- (int64_t)monogramType
{
  return self->_monogramType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkingQueue, 0);
  objc_storeStrong((id *)&self->_monogrammer, 0);
  objc_storeStrong((id *)&self->_contactStoreDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)initWithAppleAccount:grandSlamAccount:accountStore:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[AAUIProfilePictureStore initWithAppleAccount]: AppleAccount exists.", v2, v3, v4, v5, v6);
}

- (void)initWithGrandSlamSigner:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_209754000, v0, v1, "[AAUIProfilePictureStore initWithGrandSlamSigner]: Getting AppleAccount with personID: %@, from Account Store", v2, v3, v4, v5, v6);
}

- (void)initWithGrandSlamSigner:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[AAUIProfilePictureStore initWithGrandSlamSigner]: AppleAccount is nil. Getting the personID from grandSlam Account.", v2, v3, v4, v5, v6);
}

- (void)initWithGrandSlamSigner:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[AAUIProfilePictureStore]: initWithGrandSlamSigner called.", v2, v3, v4, v5, v6);
}

- (void)profilePictureForAccountOwnerWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "profilePictureForAccountOwnerWithCompletion was called.", v2, v3, v4, v5, v6);
}

void __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "iCloud profile picture found in cache.", v2, v3, v4, v5, v6);
}

void __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Signed into iCloud, use profile pic from server.", v2, v3, v4, v5, v6);
}

void __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_42_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "No image found in cache, will fetch from server.", v2, v3, v4, v5, v6);
}

void __71__AAUIProfilePictureStore_profilePictureForAccountOwnerWithCompletion___block_invoke_43_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Image fetched from server.", v2, v3, v4, v5, v6);
}

- (void)_sizedProfilePictureWithFallback:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Profile picture is nil. Falling back...", v2, v3, v4, v5, v6);
}

- (void)_sizedProfilePictureWithFallback:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "_sizedProfilePictureWithFallback was called.", v2, v3, v4, v5, v6);
}

- (void)profilePictureForAccountOwnerWithoutMonogramFallback
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "profilePictureForAccountOwnerWithoutMonogramFallback was called.", v2, v3, v4, v5, v6);
}

- (void)fetchProfilePictureForAccountOwner:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "fetchProfilePictureForAccountOwner was called.", v2, v3, v4, v5, v6);
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "profileImage is nil.", v2, v3, v4, v5, v6);
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "profileImage not nil.", v2, v3, v4, v5, v6);
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Contacts dataclass is enabled.", v2, v3, v4, v5, v6);
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_46_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Performing server fetch for profile picture", v2, v3, v4, v5, v6);
}

void __62__AAUIProfilePictureStore_fetchProfilePictureForAccountOwner___block_invoke_46_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "profileImage is nil. Falling back...", v2, v3, v4, v5, v6);
}

- (void)fetchProfilePictureFromCacheForAccountOwner:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[fetchProfilePictureFromCacheForAccountOwner:] Fetching profile picture for account owner from cache.", v2, v3, v4, v5, v6);
}

- (void)_saveProfilePictureToCache:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Successfully updated user defaults with profile picture cache file path.", v2, v3, v4, v5, v6);
}

- (void)_saveProfilePictureToCacheIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Updating the profile picture cache.", v2, v3, v4, v5, v6);
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[setProfilePictureForAccountOwner:] Manually updating server.", v2, v3, v4, v5, v6);
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[setProfilePictureForAccountOwner:] Contacts was updated using ContactStore on the client which will eventually update the server so we just need to update the two local caches.", v2, v3, v4, v5, v6);
}

- (void)setProfilePictureForAccountOwner:(uint64_t)a3 cropRect:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Contacts pushed to server!", v2, v3, v4, v5, v6);
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[setProfilePictureForAccountOwner:] Successfully updated profile picture for account owner!", v2, v3, v4, v5, v6);
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "[setProfilePictureForAccountOwner:] Failed to save profile picture, error: %@", v2, v3, v4, v5, v6);
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[setProfilePictureForAccountOwner:] picture is nil. Setting imageData to nil.", v2, v3, v4, v5, v6);
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.8()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[setProfilePictureForAccountOwner:] Picture exists", v2, v3, v4, v5, v6);
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.9()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[setProfilePictureForAccountOwner:] Contact exists", v2, v3, v4, v5, v6);
}

- (void)setProfilePictureForAccountOwner:cropRect:.cold.10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_209754000, v0, v1, "[setProfilePictureForAccountOwner:] Updating profile picture for account owner, cropRect: %@", v2, v3, v4, v5, v6);
}

- (void)profilePictureForLocalContact:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "profilePictureForLocalContact was called.", v2, v3, v4, v5, v6);
}

- (void)monogramForCurrentAccount
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "monogramForCurrentAccount was called.", v2, v3, v4, v5, v6);
}

- (void)_contactStoreDidChange:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "_contactStoreDidChange called.", v2, v3, v4, v5, v6);
}

- (void)_fallbackProfilePictureForPersonWithFirstName:lastName:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "First name and last name exists.", v2, v3, v4, v5, v6);
}

- (void)_fallbackProfilePictureForPersonWithFirstName:lastName:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "_fallbackProfilePictureForPersonWithFirstName called.", v2, v3, v4, v5, v6);
}

- (void)_meCardPicture
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Contact imageData is not nil.", v2, v3, v4, v5, v6);
}

void __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke_71_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__AAUIProfilePictureStore_meCardWithVisualIdentity___block_invoke_71_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_familyMemberPersonPicture:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Failed to find contact for family member, error: %@", v2, v3, v4, v5, v6);
}

- (void)_contactSyncsWithiCloud:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_209754000, v0, v1, "[_contactSyncsWithiCloud:] linkedContact %@", v2, v3, v4, v5, v6);
}

- (void)_contactSyncsWithiCloud:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[_contactSyncsWithiCloud:] contact.isUnified is true.", v2, v3, v4, v5, v6);
}

- (void)_contactSyncsWithiCloud:error:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[_contactSyncsWithiCloud:] was called.", v2, v3, v4, v5, v6);
}

- (void)updateCacheWithPhoto:cropRect:forPersonID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_209754000, v0, OS_LOG_TYPE_ERROR, "[AAUIProfilePictureStore updateCacheWithPhoto]: personID is nil. Abort updateCacheWithPhoto", v1, 2u);
}

- (void)updateCacheWithPhoto:cropRect:forPersonID:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[AAUIProfilePictureStore updateCacheWithPhoto]: Cache has changed. Posting a notification.", v2, v3, v4, v5, v6);
}

- (void)updateCacheWithPhoto:cropRect:forPersonID:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_209754000, v0, OS_LOG_TYPE_ERROR, "[AAUIProfilePictureStore updateCacheWithPhoto]: After updating Profile picture on the server successfully, tried updating the cache, but, cache did not update‼️", v1, 2u);
}

- (void)updateCacheWithPhoto:cropRect:forPersonID:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[AAUIProfilePictureStore updateCacheWithPhoto]: profilePictureForPersonID completed.", v2, v3, v4, v5, v6);
}

- (void)updateCacheWithPhoto:cropRect:forPersonID:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "[AAUIProfilePictureStore]: updateCacheWithPhoto was called.", v2, v3, v4, v5, v6);
}

@end