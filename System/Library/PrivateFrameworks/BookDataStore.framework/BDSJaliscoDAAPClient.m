@interface BDSJaliscoDAAPClient
+ (BDSJaliscoDAAPClient)sharedClient;
- (BDSJaliscoDAAPClient)init;
- (BDSServiceProxy)serviceProxy;
- (BOOL)familyUpdateInProgress;
- (BOOL)storeAuthenticationRequired;
- (void)deleteItemsWithStoreIDs:(id)a3 completion:(id)a4;
- (void)fetchAllHiddenItemStoreIDsWithCompletion:(id)a3;
- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4;
- (void)resetPurchasedTokenForStoreIDs:(id)a3 completion:(id)a4;
- (void)resetStaleJaliscoDatabaseWithCompletion:(id)a3;
- (void)setFamilyUpdateInProgress:(BOOL)a3;
- (void)setItemHidden:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5;
- (void)setServiceProxy:(id)a3;
- (void)setStoreAuthenticationRequired:(BOOL)a3;
- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5;
- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5;
- (void)updatePolitelyAfterSignIn:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)updatePolitelyAfterSignOut:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5;
@end

@implementation BDSJaliscoDAAPClient

+ (BDSJaliscoDAAPClient)sharedClient
{
  if (qword_26AD76108 != -1) {
    dispatch_once(&qword_26AD76108, &unk_26E9719B0);
  }
  v2 = (void *)qword_26AD76110;
  return (BDSJaliscoDAAPClient *)v2;
}

- (BDSJaliscoDAAPClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)BDSJaliscoDAAPClient;
  v2 = [(BDSJaliscoDAAPClient *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(BDSServiceProxy);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v3;

    v2->_familyUpdateInProgress = 0;
  }
  return v2;
}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  objc_msgSend_serviceProxy(self, v9, v10, v11, v12, v13, v14, v15);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updatePolitely_reason_completion_(v20, v16, v6, a4, (uint64_t)v8, v17, v18, v19);
}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  objc_msgSend_serviceProxy(self, v9, v10, v11, v12, v13, v14, v15);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updatePolitely_reason_completionWithError_(v20, v16, v6, a4, (uint64_t)v8, v17, v18, v19);
}

- (void)updatePolitelyAfterSignOut:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  objc_msgSend_serviceProxy(self, v9, v10, v11, v12, v13, v14, v15);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updatePolitelyAfterSignOut_reason_completion_(v20, v16, v6, a4, (uint64_t)v8, v17, v18, v19);
}

- (void)updatePolitelyAfterSignIn:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  objc_msgSend_serviceProxy(self, v9, v10, v11, v12, v13, v14, v15);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updatePolitelyAfterSignIn_reason_completion_(v20, v16, v6, a4, (uint64_t)v8, v17, v18, v19);
}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  objc_msgSend_setFamilyUpdateInProgress_(self, v9, 1, v10, v11, v12, v13, v14);
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  v31 = sub_2360D78B8;
  v32 = &unk_264CA11A8;
  v33 = self;
  id v34 = v8;
  id v15 = v8;
  v16 = _Block_copy(&v29);
  v24 = objc_msgSend_serviceProxy(self, v17, v18, v19, v20, v21, v22, v23, v29, v30, v31, v32, v33);
  objc_msgSend_updateFamilyPolitely_reason_completion_(v24, v25, v6, a4, (uint64_t)v16, v26, v27, v28);
}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  objc_msgSend_setFamilyUpdateInProgress_(self, v9, 1, v10, v11, v12, v13, v14);
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  v31 = sub_2360D7A08;
  v32 = &unk_264CA10B0;
  v33 = self;
  id v34 = v8;
  id v15 = v8;
  v16 = _Block_copy(&v29);
  v24 = objc_msgSend_serviceProxy(self, v17, v18, v19, v20, v21, v22, v23, v29, v30, v31, v32, v33);
  objc_msgSend_updateFamilyPolitely_reason_completionWithError_(v24, v25, v6, a4, (uint64_t)v16, v26, v27, v28);
}

- (void)setItemHidden:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  objc_msgSend_serviceProxy(self, v10, v11, v12, v13, v14, v15, v16);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setItemHidden_forStoreID_completion_(v21, v17, v6, (uint64_t)v9, (uint64_t)v8, v18, v19, v20);
}

- (void)fetchAllHiddenItemStoreIDsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchAllHiddenItemStoreIDsWithCompletion_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (void)resetPurchasedTokenForStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_serviceProxy(self, v8, v9, v10, v11, v12, v13, v14);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetPurchasedTokenForStoreIDs_completion_(v20, v15, (uint64_t)v7, (uint64_t)v6, v16, v17, v18, v19);
}

- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_serviceProxy(self, v8, v9, v10, v11, v12, v13, v14);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hideItemsWithStoreIDs_completion_(v20, v15, (uint64_t)v7, (uint64_t)v6, v16, v17, v18, v19);
}

- (void)deleteItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_serviceProxy(self, v8, v9, v10, v11, v12, v13, v14);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteItemsWithStoreIDs_completion_(v20, v15, (uint64_t)v7, (uint64_t)v6, v16, v17, v18, v19);
}

- (void)resetStaleJaliscoDatabaseWithCompletion:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetStaleJaliscoDatabaseWithCompletion_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (BOOL)familyUpdateInProgress
{
  return self->_familyUpdateInProgress;
}

- (void)setFamilyUpdateInProgress:(BOOL)a3
{
  self->_familyUpdateInProgress = a3;
}

- (BOOL)storeAuthenticationRequired
{
  return self->_storeAuthenticationRequired;
}

- (void)setStoreAuthenticationRequired:(BOOL)a3
{
  self->_storeAuthenticationRequired = a3;
}

- (BDSServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end