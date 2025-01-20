@interface MTAccountController
+ (BOOL)iTunesAccountDidChangeForACAccountNotification:(id)a3;
- (ACAccount)_activeAccount;
- (ACAccount)accountOverride;
- (BOOL)activeAccountIsManagedAppleID;
- (BOOL)hasFetchedInitialAccount;
- (BOOL)isPrimaryUserActiveAccount;
- (BOOL)isUserLoggedIn;
- (MTAccountController)init;
- (NSMutableSet)declinedAuthRequests;
- (NSMutableSet)inFlightAuthRequests;
- (id)_activeAccountBlocking;
- (id)activeAccount;
- (id)activeDsid;
- (id)activeEmail;
- (id)activeFullName;
- (id)activeStorefront;
- (id)primaryUser;
- (void)_updateActiveAccount;
- (void)dealloc;
- (void)didChangeStoreAccount:(id)a3;
- (void)fetchActiveAccountWithCompletion:(id)a3;
- (void)setAccountOverride:(id)a3;
- (void)setActiveAccount:(id)a3;
- (void)setDeclinedAuthRequests:(id)a3;
- (void)setHasFetchedInitialAccount:(BOOL)a3;
- (void)setInFlightAuthRequests:(id)a3;
- (void)set_activeAccount:(id)a3;
@end

@implementation MTAccountController

- (MTAccountController)init
{
  v22.receiver = self;
  v22.super_class = (Class)MTAccountController;
  v2 = [(MTAccountController *)&v22 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.podcasts.MTAccountController.accountQueue", 0);
    accountQueue = v2->_accountQueue;
    v2->_accountQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.podcasts.MTAccountController.callbackQueue", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    objc_msgSend__updateActiveAccount(v2, v7, v8, v9, v10);
    uint64_t v11 = objc_opt_new();
    inFlightAuthRequests = v2->_inFlightAuthRequests;
    v2->_inFlightAuthRequests = (NSMutableSet *)v11;

    uint64_t v13 = objc_opt_new();
    declinedAuthRequests = v2->_declinedAuthRequests;
    v2->_declinedAuthRequests = (NSMutableSet *)v13;

    v19 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v15, v16, v17, v18);
    objc_msgSend_addObserver_selector_name_object_(v19, v20, (uint64_t)v2, (uint64_t)sel_didChangeStoreAccount_, *MEMORY[0x263EFB060], 0);
  }
  return v2;
}

- (void)dealloc
{
  v6 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2, v3, v4);
  objc_msgSend_removeObserver_(v6, v7, (uint64_t)self, v8, v9);

  v10.receiver = self;
  v10.super_class = (Class)MTAccountController;
  [(MTAccountController *)&v10 dealloc];
}

- (id)activeAccount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_222EC83B0;
  objc_super v10 = sub_222EC83C0;
  id v11 = 0;
  accountQueue = self->_accountQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_222EC83C8;
  v5[3] = &unk_26467B998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accountQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setActiveAccount:(id)a3
{
  id v4 = a3;
  accountQueue = self->_accountQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_222EC8498;
  v7[3] = &unk_26467B9C0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(accountQueue, v7);
}

- (id)primaryUser
{
  return (id)((uint64_t (*)(MTAccountController *, char *))MEMORY[0x270F9A6D0])(self, sel__activeAccount);
}

- (BOOL)isPrimaryUserActiveAccount
{
  objc_super v10 = objc_msgSend_ams_DSID(self->__activeAccount, a2, v2, v3, v4);
  if (v10)
  {
    id v11 = objc_msgSend_activeDsid(self, v6, v7, v8, v9);
    uint64_t v16 = objc_msgSend_ams_DSID(self->__activeAccount, v12, v13, v14, v15);
    char isEqualToNumber = objc_msgSend_isEqualToNumber_(v11, v17, (uint64_t)v16, v18, v19);
  }
  else
  {
    char isEqualToNumber = 0;
  }

  return isEqualToNumber;
}

- (void)fetchActiveAccountWithCompletion:(id)a3
{
  id v4 = a3;
  accountQueue = self->_accountQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_222EC8684;
  v7[3] = &unk_26467BA10;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accountQueue, v7);
}

- (id)activeDsid
{
  dispatch_queue_t v5 = objc_msgSend_activeAccount(self, a2, v2, v3, v4);
  objc_super v10 = objc_msgSend_ams_DSID(v5, v6, v7, v8, v9);

  return v10;
}

- (id)activeStorefront
{
  dispatch_queue_t v5 = objc_msgSend_activeAccount(self, a2, v2, v3, v4);
  objc_super v10 = objc_msgSend_ams_storefront(v5, v6, v7, v8, v9);

  return v10;
}

- (id)activeEmail
{
  dispatch_queue_t v5 = objc_msgSend_activeAccount(self, a2, v2, v3, v4);
  objc_super v10 = objc_msgSend_username(v5, v6, v7, v8, v9);

  return v10;
}

- (id)activeFullName
{
  dispatch_queue_t v5 = objc_msgSend_activeAccount(self, a2, v2, v3, v4);
  objc_super v10 = objc_msgSend_ams_fullName(v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)isUserLoggedIn
{
  dispatch_queue_t v5 = objc_msgSend_activeAccount(self, a2, v2, v3, v4);
  objc_super v10 = objc_msgSend_ams_DSID(v5, v6, v7, v8, v9);
  BOOL v11 = v10 != 0;

  return v11;
}

- (BOOL)activeAccountIsManagedAppleID
{
  dispatch_queue_t v5 = objc_msgSend_activeAccount(self, a2, v2, v3, v4);
  char isManagedAppleID = objc_msgSend_ams_isManagedAppleID(v5, v6, v7, v8, v9);

  return isManagedAppleID;
}

- (void)didChangeStoreAccount:(id)a3
{
  if (objc_msgSend_iTunesAccountDidChangeForACAccountNotification_(MTAccountController, a2, (uint64_t)a3, v3, v4))
  {
    objc_msgSend__updateActiveAccount(self, v6, v7, v8, v9);
    if (objc_msgSend_isUserLoggedIn(self, v10, v11, v12, v13))
    {
      objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v14, v15, v16, v17);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_postNotificationName_object_(v20, v18, @"MTShouldCheckShowWelcomeNotification", 0, v19);
    }
  }
}

- (id)_activeAccountBlocking
{
  dispatch_queue_t v5 = objc_msgSend_ams_sharedAccountStore(MEMORY[0x263EFB210], a2, v2, v3, v4);
  objc_super v10 = objc_msgSend_ams_activeiTunesAccount(v5, v6, v7, v8, v9);

  return v10;
}

- (void)_updateActiveAccount
{
  id v6 = objc_msgSend_activeDsid(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_stringValue(v6, v7, v8, v9, v10);

  accountQueue = self->_accountQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_222EC8A9C;
  v14[3] = &unk_26467B9C0;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  dispatch_async(accountQueue, v14);
}

+ (BOOL)iTunesAccountDidChangeForACAccountNotification:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_userInfo(v3, v4, v5, v6, v7);
  uint64_t v9 = *MEMORY[0x263EFAF38];
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v8, v10, *MEMORY[0x263EFAF38], v11, v12);
  if (v17)
  {
    uint64_t v18 = objc_msgSend_userInfo(v3, v13, v14, v15, v16);
    objc_super v22 = objc_msgSend_objectForKeyedSubscript_(v18, v19, v9, v20, v21);
    char isEqualToString = objc_msgSend_isEqualToString_(v22, v23, *MEMORY[0x263EFB000], v24, v25);
  }
  else
  {
    char isEqualToString = 1;
  }

  return isEqualToString;
}

- (BOOL)hasFetchedInitialAccount
{
  return self->_hasFetchedInitialAccount;
}

- (void)setHasFetchedInitialAccount:(BOOL)a3
{
  self->_hasFetchedInitialAccount = a3;
}

- (ACAccount)accountOverride
{
  return self->_accountOverride;
}

- (void)setAccountOverride:(id)a3
{
}

- (NSMutableSet)inFlightAuthRequests
{
  return self->_inFlightAuthRequests;
}

- (void)setInFlightAuthRequests:(id)a3
{
}

- (NSMutableSet)declinedAuthRequests
{
  return self->_declinedAuthRequests;
}

- (void)setDeclinedAuthRequests:(id)a3
{
}

- (ACAccount)_activeAccount
{
  return self->__activeAccount;
}

- (void)set_activeAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeAccount, 0);
  objc_storeStrong((id *)&self->_declinedAuthRequests, 0);
  objc_storeStrong((id *)&self->_inFlightAuthRequests, 0);
  objc_storeStrong((id *)&self->_accountOverride, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_accountQueue, 0);
}

@end