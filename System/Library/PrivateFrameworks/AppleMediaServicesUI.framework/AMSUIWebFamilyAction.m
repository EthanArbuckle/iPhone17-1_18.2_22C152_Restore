@interface AMSUIWebFamilyAction
- (ACAccount)account;
- (AMSUIWebFamilyAction)initWithJSObject:(id)a3 context:(id)a4;
- (id)_dictionaryFromLookupResult:(id)a3;
- (id)runAction;
- (void)setAccount:(id)a3;
@end

@implementation AMSUIWebFamilyAction

- (AMSUIWebFamilyAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebFamilyAction;
  v8 = [(AMSUIWebAction *)&v13 initWithJSObject:v6 context:v7];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"account"];
    uint64_t v10 = [v7 iTunesAccountFromJSAccount:v9];
    account = v8->_account;
    v8->_account = (ACAccount *)v10;
  }
  return v8;
}

- (id)runAction
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebFamilyAction;
  id v3 = [(AMSUIWebAction *)&v18 runAction];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v6;
    __int16 v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing family lookup", buf, 0x16u);
  }
  id v8 = objc_alloc(MEMORY[0x263F27C78]);
  v9 = [(AMSUIWebFamilyAction *)self account];
  uint64_t v10 = [(AMSUIWebAction *)self context];
  v11 = [v10 bag];
  v12 = (void *)[v8 initWithAccount:v9 bag:v11];

  objc_super v13 = AMSLogKey();
  [v12 setLogKey:v13];

  v14 = [v12 performFamilyInfoLookup];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __33__AMSUIWebFamilyAction_runAction__block_invoke;
  v17[3] = &unk_2643E4DA8;
  v17[4] = self;
  v15 = [v14 thenWithBlock:v17];

  return v15;
}

id __33__AMSUIWebFamilyAction_runAction__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)MEMORY[0x263F27E10];
  id v3 = [*(id *)(a1 + 32) _dictionaryFromLookupResult:a2];
  v4 = [v2 promiseWithResult:v3];

  return v4;
}

- (id)_dictionaryFromLookupResult:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isHeadOfHouseholdSharingPayment"));
  v26 = v4;
  [v4 setObject:v5 forKeyedSubscript:@"sharedPaymentMethod"];

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v25 = v3;
  id obj = [v3 familyMembers];
  uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        objc_super v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "isAskToBuyEnabled"));
        [v12 setObject:v13 forKeyedSubscript:@"askToBuyEnabled"];

        v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "isCurrentSignedInUser"));
        [v12 setObject:v14 forKeyedSubscript:@"currentSignedInUser"];

        v15 = [v11 firstName];
        [v12 setObject:v15 forKeyedSubscript:@"firstName"];

        v16 = [v11 iCloudDSID];
        v17 = [v16 stringValue];
        [v12 setObject:v17 forKeyedSubscript:@"iCloudDSID"];

        objc_super v18 = [v11 iCloudUsername];
        [v12 setObject:v18 forKeyedSubscript:@"iCloudUsername"];

        v19 = [v11 iTunesDSID];
        uint64_t v20 = [v19 stringValue];
        [v12 setObject:v20 forKeyedSubscript:@"iTunesDSID"];

        __int16 v21 = [v11 iTunesUsername];
        [v12 setObject:v21 forKeyedSubscript:@"iTunesUsername"];

        v22 = [v11 lastName];
        [v12 setObject:v22 forKeyedSubscript:@"lastName"];

        uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "isSharingPurchases"));
        [v12 setObject:v23 forKeyedSubscript:@"sharingPurchases"];

        [v6 addObject:v12];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }

  [v26 setObject:v6 forKeyedSubscript:@"familyMembers"];
  return v26;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end