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
  v13.receiver = self;
  v13.super_class = (Class)MTAccountController;
  v2 = [(MTAccountController *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.podcasts.MTAccountController.accountQueue", 0);
    accountQueue = v2->_accountQueue;
    v2->_accountQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.podcasts.MTAccountController.callbackQueue", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    [(MTAccountController *)v2 _updateActiveAccount];
    uint64_t v7 = objc_opt_new();
    inFlightAuthRequests = v2->_inFlightAuthRequests;
    v2->_inFlightAuthRequests = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    declinedAuthRequests = v2->_declinedAuthRequests;
    v2->_declinedAuthRequests = (NSMutableSet *)v9;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"didChangeStoreAccount:" name:ACDAccountStoreDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTAccountController;
  [(MTAccountController *)&v4 dealloc];
}

- (id)activeAccount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100004A90;
  v10 = sub_100004AA0;
  id v11 = 0;
  accountQueue = self->_accountQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004AA8;
  v5[3] = &unk_1000104B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)accountQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setActiveAccount:(id)a3
{
  id v4 = a3;
  accountQueue = self->_accountQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004B78;
  v7[3] = &unk_1000104D8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)accountQueue, v7);
}

- (id)primaryUser
{
  return [(MTAccountController *)self _activeAccount];
}

- (BOOL)isPrimaryUserActiveAccount
{
  id v3 = [(ACAccount *)self->__activeAccount ams_DSID];
  if (v3)
  {
    id v4 = [(MTAccountController *)self activeDsid];
    dispatch_queue_t v5 = [(ACAccount *)self->__activeAccount ams_DSID];
    unsigned __int8 v6 = [v4 isEqualToNumber:v5];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)fetchActiveAccountWithCompletion:(id)a3
{
  id v4 = a3;
  accountQueue = self->_accountQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004D64;
  v7[3] = &unk_100010528;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)accountQueue, v7);
}

- (id)activeDsid
{
  v2 = [(MTAccountController *)self activeAccount];
  id v3 = objc_msgSend(v2, "ams_DSID");

  return v3;
}

- (id)activeStorefront
{
  v2 = [(MTAccountController *)self activeAccount];
  id v3 = objc_msgSend(v2, "ams_storefront");

  return v3;
}

- (id)activeEmail
{
  v2 = [(MTAccountController *)self activeAccount];
  id v3 = [v2 username];

  return v3;
}

- (id)activeFullName
{
  v2 = [(MTAccountController *)self activeAccount];
  id v3 = objc_msgSend(v2, "ams_fullName");

  return v3;
}

- (BOOL)isUserLoggedIn
{
  v2 = [(MTAccountController *)self activeAccount];
  id v3 = objc_msgSend(v2, "ams_DSID");
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)activeAccountIsManagedAppleID
{
  v2 = [(MTAccountController *)self activeAccount];
  unsigned __int8 v3 = objc_msgSend(v2, "ams_isManagedAppleID");

  return v3;
}

- (void)didChangeStoreAccount:(id)a3
{
  if (+[MTAccountController iTunesAccountDidChangeForACAccountNotification:a3])
  {
    [(MTAccountController *)self _updateActiveAccount];
    if ([(MTAccountController *)self isUserLoggedIn])
    {
      id v4 = +[NSNotificationCenter defaultCenter];
      [v4 postNotificationName:@"MTShouldCheckShowWelcomeNotification" object:0];
    }
  }
}

- (id)_activeAccountBlocking
{
  v2 = +[ACAccountStore ams_sharedAccountStore];
  unsigned __int8 v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  return v3;
}

- (void)_updateActiveAccount
{
  unsigned __int8 v3 = [(MTAccountController *)self activeDsid];
  id v4 = [v3 stringValue];

  accountQueue = self->_accountQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000517C;
  v7[3] = &unk_1000104D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)accountQueue, v7);
}

+ (BOOL)iTunesAccountDidChangeForACAccountNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  uint64_t v5 = ACAccountTypeIdentifierKey;
  id v6 = [v4 objectForKeyedSubscript:ACAccountTypeIdentifierKey];
  if (v6)
  {
    uint64_t v7 = [v3 userInfo];
    id v8 = [v7 objectForKeyedSubscript:v5];
    unsigned __int8 v9 = [v8 isEqualToString:ACAccountTypeIdentifieriTunesStore];
  }
  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
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