@interface GEOUserAccountInfo
+ (BOOL)hasValidICloudAccountForAddingRatingsAndPhotos;
+ (BOOL)isAccountInfoAvailable;
+ (BOOL)isCurrentICloudAccountChinaBased;
+ (BOOL)isCurrentICloudAccountManaged;
+ (BOOL)isCurrentICloudAccountUnderage;
+ (id)primaryICloudAccount;
+ (id)sharedInstance;
- (BOOL)isCurrentICloudAccountChinaBased;
- (BOOL)isCurrentICloudAccountManaged;
- (BOOL)isCurrentICloudAccountUnderage;
- (GEOUserAccountInfo)init;
- (id)_primaryICloudAccountIsolated;
- (id)primaryICloudAccount;
- (void)_accountStoreDidChange:(id)a3;
@end

@implementation GEOUserAccountInfo

+ (BOOL)hasValidICloudAccountForAddingRatingsAndPhotos
{
  v3 = [a1 sharedInstance];
  if ([v3 isCurrentICloudAccountChinaBased])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = [a1 sharedInstance];
    v6 = [v5 primaryICloudAccount];
    if (v6)
    {
      v7 = [a1 sharedInstance];
      int v4 = [v7 isCurrentICloudAccountUnderage] ^ 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_247 != -1) {
    dispatch_once(&_MergedGlobals_247, &__block_literal_global_98);
  }
  v2 = (void *)qword_1EB29FCA0;

  return v2;
}

- (BOOL)isCurrentICloudAccountChinaBased
{
  if (!AccountsLibraryCore() || !AppleAccountLibraryCore() || !AuthKitLibraryCore()) {
    return 0;
  }
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync();
  BOOL v2 = *((unsigned char *)v5 + 24) != 0;
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __54__GEOUserAccountInfo_isCurrentICloudAccountChinaBased__block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) _primaryICloudAccountIsolated];
  if (v2)
  {
    id v10 = v2;
    v3 = [getAKAccountManagerClass() sharedInstance];
    uint64_t v4 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v4 + 40))
    {
      v5 = objc_msgSend(v10, "aa_altDSID");
      uint64_t v6 = [v3 authKitAccountWithAltDSID:v5 error:0];
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(void **)(v7 + 48);
      *(void *)(v7 + 48) = v6;

      *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
      uint64_t v4 = *(void *)(a1 + 32);
    }
    if (*(void *)(v4 + 48))
    {
      v9 = objc_msgSend(v3, "appleIDCountryCodeForAccount:");
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 isEqualToString:@"CN"];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }

    BOOL v2 = v10;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void __42__GEOUserAccountInfo_primaryICloudAccount__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _primaryICloudAccountIsolated];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_primaryICloudAccountIsolated
{
  geo_assert_isolated();
  if (!self->_accountStore)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    uint64_t v3 = (void *)qword_1EB29FCA8;
    uint64_t v24 = qword_1EB29FCA8;
    if (!qword_1EB29FCA8)
    {
      v16 = (void *)MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __getACAccountStoreClass_block_invoke;
      v19 = &unk_1E53DB3C8;
      v20 = &v21;
      __getACAccountStoreClass_block_invoke((uint64_t)&v16);
      uint64_t v3 = (void *)v22[3];
    }
    uint64_t v4 = v3;
    _Block_object_dispose(&v21, 8);
    v5 = (ACAccountStore *)objc_alloc_init(v4);
    accountStore = self->_accountStore;
    self->_accountStore = v5;

    v16 = 0;
    if (AppleAccountLibraryCore())
    {
      if (v16) {
        free(v16);
      }
      uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2020000000;
      v8 = (void *)qword_1EB29FCB0;
      uint64_t v24 = qword_1EB29FCB0;
      if (!qword_1EB29FCB0)
      {
        v16 = (void *)MEMORY[0x1E4F143A8];
        uint64_t v17 = 3221225472;
        v18 = __getACAccountStoreDidChangeNotificationSymbolLoc_block_invoke;
        v19 = &unk_1E53DB3C8;
        v20 = &v21;
        v9 = (void *)AccountsLibrary();
        id v10 = dlsym(v9, "ACAccountStoreDidChangeNotification");
        *(void *)(v20[1] + 24) = v10;
        qword_1EB29FCB0 = *(void *)(v20[1] + 24);
        v8 = (void *)v22[3];
      }
      _Block_object_dispose(&v21, 8);
      if (v8)
      {
        [v7 addObserver:self selector:sel__accountStoreDidChange_ name:*v8 object:self->_accountStore];

        goto LABEL_11;
      }
      dlerror();
    }
    v15 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v21, 8);
    _Unwind_Resume(v15);
  }
LABEL_11:
  if (!self->_hasCheckedPrimaryAccount)
  {
    v11 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
    primaryICloudAccount = self->_primaryICloudAccount;
    self->_primaryICloudAccount = v11;

    self->_hasCheckedPrimaryAccount = 1;
  }
  v13 = self->_primaryICloudAccount;

  return v13;
}

- (id)primaryICloudAccount
{
  if (AccountsLibraryCore() && AppleAccountLibraryCore())
  {
    uint64_t v4 = 0;
    v5 = &v4;
    uint64_t v6 = 0x3032000000;
    uint64_t v7 = __Block_byref_object_copy__50;
    v8 = __Block_byref_object_dispose__50;
    id v9 = 0;
    geo_isolate_sync();
    id v2 = (id)v5[5];
    _Block_object_dispose(&v4, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

+ (id)primaryICloudAccount
{
  id v2 = [a1 sharedInstance];
  uint64_t v3 = [v2 primaryICloudAccount];

  return v3;
}

void __36__GEOUserAccountInfo_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(GEOUserAccountInfo);
  v1 = (void *)qword_1EB29FCA0;
  qword_1EB29FCA0 = (uint64_t)v0;
}

- (GEOUserAccountInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEOUserAccountInfo;
  id v2 = [(GEOUserAccountInfo *)&v7 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolation = v2->_isolation;
    v2->_isolation = (geo_isolater *)v3;

    v5 = v2;
  }

  return v2;
}

+ (BOOL)isAccountInfoAvailable
{
  return AccountsLibraryCore() != 0;
}

+ (BOOL)isCurrentICloudAccountUnderage
{
  id v2 = [a1 sharedInstance];
  char v3 = [v2 isCurrentICloudAccountUnderage];

  return v3;
}

- (BOOL)isCurrentICloudAccountUnderage
{
  if (!AccountsLibraryCore() || !AppleAccountLibraryCore() || !AuthKitLibraryCore()) {
    return 0;
  }
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync();
  BOOL v2 = *((unsigned char *)v5 + 24) != 0;
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __52__GEOUserAccountInfo_isCurrentICloudAccountUnderage__block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) _primaryICloudAccountIsolated];
  if (v2)
  {
    id v9 = v2;
    char v3 = [getAKAccountManagerClass() sharedInstance];
    uint64_t v4 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v4 + 40))
    {
      v5 = objc_msgSend(v9, "aa_altDSID");
      uint64_t v6 = [v3 authKitAccountWithAltDSID:v5 error:0];
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(void **)(v7 + 48);
      *(void *)(v7 + 48) = v6;

      *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
      uint64_t v4 = *(void *)(a1 + 32);
    }
    if (*(void *)(v4 + 48)) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "userUnderAgeForAccount:");
    }
    else {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }

    BOOL v2 = v9;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

+ (BOOL)isCurrentICloudAccountChinaBased
{
  BOOL v2 = [a1 sharedInstance];
  char v3 = [v2 isCurrentICloudAccountChinaBased];

  return v3;
}

+ (BOOL)isCurrentICloudAccountManaged
{
  BOOL v2 = [a1 sharedInstance];
  char v3 = [v2 isCurrentICloudAccountManaged];

  return v3;
}

- (BOOL)isCurrentICloudAccountManaged
{
  if (!AccountsLibraryCore() || !AppleAccountLibraryCore() || !AuthKitLibraryCore()) {
    return 0;
  }
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  geo_isolate_sync();
  BOOL v2 = *((unsigned char *)v5 + 24) != 0;
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __51__GEOUserAccountInfo_isCurrentICloudAccountManaged__block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) _primaryICloudAccountIsolated];
  if (v2)
  {
    char v3 = v2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "aa_isManagedAppleID");
    BOOL v2 = v3;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)_accountStoreDidChange:(id)a3
{
}

void __45__GEOUserAccountInfo__accountStoreDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
}

void __45__GEOUserAccountInfo__accountStoreDidChange___block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"GEOUserAccountInfoDidChangeNotification" object:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAuthKitAccount, 0);
  objc_storeStrong((id *)&self->_primaryICloudAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->_isolation, 0);
}

@end