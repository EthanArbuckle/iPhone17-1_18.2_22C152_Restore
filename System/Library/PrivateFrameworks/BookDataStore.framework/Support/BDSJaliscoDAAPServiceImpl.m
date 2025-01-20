@interface BDSJaliscoDAAPServiceImpl
+ (BDSJaliscoDAAPServiceImpl)sharedClient;
- (BDSJaliscoDAAPServiceImpl)init;
- (BLJaliscoDAAPClient)jaliscoClient;
- (BLJaliscoDAAPClientDelegate)daapClientDelegate;
- (BOOL)storeAuthenticationRequired;
- (void)deleteItemsWithStoreIDs:(id)a3 completion:(id)a4;
- (void)fetchAllHiddenItemStoreIDsWithCompletion:(id)a3;
- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4;
- (void)resetPurchasedTokenForStoreIDs:(id)a3 completion:(id)a4;
- (void)resetStaleJaliscoDatabaseWithCompletion:(id)a3;
- (void)setDaapClientDelegate:(id)a3;
- (void)setItemHidden:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5;
- (void)setJaliscoClient:(id)a3;
- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5;
- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5;
- (void)updatePolitely:(BOOL)a3 uiManager:(id)a4 reason:(int64_t)a5 completion:(id)a6;
- (void)updatePolitelyAfterSignIn:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updatePolitelyAfterSignOut:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
@end

@implementation BDSJaliscoDAAPServiceImpl

- (BDSJaliscoDAAPServiceImpl)init
{
  v8.receiver = self;
  v8.super_class = (Class)BDSJaliscoDAAPServiceImpl;
  v2 = [(BDSJaliscoDAAPServiceImpl *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[BLJaliscoDAAPClient sharedClient];
    jaliscoClient = v2->_jaliscoClient;
    v2->_jaliscoClient = (BLJaliscoDAAPClient *)v3;

    v5 = [(BDSJaliscoDAAPServiceImpl *)v2 jaliscoClient];

    if (!v5)
    {
      v6 = sub_1000063E8();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1001E656C(v6);
      }

      return 0;
    }
  }
  return v2;
}

+ (BDSJaliscoDAAPServiceImpl)sharedClient
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100297560);
  if (!qword_100297558)
  {
    v2 = objc_alloc_init(BDSJaliscoDAAPServiceImpl);
    uint64_t v3 = (void *)qword_100297558;
    qword_100297558 = (uint64_t)v2;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100297560);
  v4 = (void *)qword_100297558;
  return (BDSJaliscoDAAPServiceImpl *)v4;
}

- (BLJaliscoDAAPClientDelegate)daapClientDelegate
{
  v2 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  uint64_t v3 = [v2 delegate];

  return (BLJaliscoDAAPClientDelegate *)v3;
}

- (void)setDaapClientDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  [v5 setDelegate:v4];
}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  [v9 updatePolitely:v6 reason:a4 completionWithError:v8];
}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  [v9 updatePolitely:v6 reason:a4 completion:v8];
}

- (void)updatePolitelyAfterSignOut:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  [v9 updatePolitelyAfterSignOut:v6 reason:a4 completion:v8];
}

- (void)updatePolitelyAfterSignIn:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  [v9 updatePolitelyAfterSignIn:v6 reason:a4 completion:v8];
}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  [v9 updateFamilyPolitely:v6 reason:a4 completion:v8];
}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  [v9 updateFamilyPolitely:v6 reason:a4 completionWithError:v8];
}

- (void)setItemHidden:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  [v10 setItemHidden:v6 forStoreID:v9 completion:v8];
}

- (void)resetPurchasedTokenForStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  [v8 resetPurchasedTokenForStoreIDs:v7 completion:v6];
}

- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  [v8 hideItemsWithStoreIDs:v7 completion:v6];
}

- (void)fetchAllHiddenItemStoreIDsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  [v5 fetchAllHiddenItemStoreIDsWithCompletion:v4];
}

- (void)deleteItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  [v8 deleteItemsWithStoreIDs:v7 completion:v6];
}

- (void)resetStaleJaliscoDatabaseWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  [v5 resetStaleJaliscoDatabaseWithCompletion:v4];
}

- (void)updatePolitely:(BOOL)a3 uiManager:(id)a4 reason:(int64_t)a5 completion:(id)a6
{
  BOOL v7 = a3;
  id v9 = a6;
  id v10 = [(BDSJaliscoDAAPServiceImpl *)self jaliscoClient];
  [v10 updatePolitely:v7 reason:a5 completion:v9];
}

- (BOOL)storeAuthenticationRequired
{
  return self->_storeAuthenticationRequired;
}

- (BLJaliscoDAAPClient)jaliscoClient
{
  return self->_jaliscoClient;
}

- (void)setJaliscoClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end