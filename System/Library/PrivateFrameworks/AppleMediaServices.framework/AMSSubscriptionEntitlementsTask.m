@interface AMSSubscriptionEntitlementsTask
+ (id)updateCacheForMediaType:(int64_t)a3 account:(id)a4 data:(id)a5;
+ (unint64_t)_segmentForMediaType:(int64_t)a3 error:(id *)a4;
- (AMSSubscriptionEntitlementsTask)initWithMediaType:(int64_t)a3;
- (BOOL)_shouldIgnoreCaches;
- (BOOL)_shouldIgnoreRemoteData;
- (BOOL)extendedCarrierCheck;
- (id)_fetchEntitlementsFromASD;
- (id)_fetchEntitlementsFromIC;
- (id)_queryCachedASDSubscriptionForSegment:(unint64_t)a3 controller:(id)a4 reloadIfNeeded:(BOOL)a5;
- (id)_reloadASDSubscriptionForSegment:(unint64_t)a3 controller:(id)a4;
- (id)_resultFromASDEntitlements:(id)a3;
- (id)_resultFromICResponse:(id)a3;
- (id)performExternalLookup;
- (int64_t)cachePolicy;
- (int64_t)mediaType;
- (void)setCachePolicy:(int64_t)a3;
- (void)setExtendedCarrierCheck:(BOOL)a3;
- (void)setMediaType:(int64_t)a3;
@end

@implementation AMSSubscriptionEntitlementsTask

- (AMSSubscriptionEntitlementsTask)initWithMediaType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSSubscriptionEntitlementsTask;
  result = [(AMSTask *)&v5 init];
  if (result) {
    result->_mediaType = a3;
  }
  return result;
}

- (id)performExternalLookup
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AMSSubscriptionEntitlementsTask_performExternalLookup__block_invoke;
  v5[3] = &unk_1E559EA38;
  v5[4] = self;
  v4.receiver = self;
  v4.super_class = (Class)AMSSubscriptionEntitlementsTask;
  v2 = [(AMSTask *)&v4 performTaskWithPromiseBlock:v5];
  return v2;
}

id __56__AMSSubscriptionEntitlementsTask_performExternalLookup__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mediaType];
  v3 = *(void **)(a1 + 32);
  if (v2 == 2) {
    [v3 _fetchEntitlementsFromIC];
  }
  else {
  objc_super v4 = [v3 _fetchEntitlementsFromASD];
  }
  return v4;
}

+ (id)updateCacheForMediaType:(int64_t)a3 account:(id)a4 data:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ((unint64_t)a3 > 7) {
    goto LABEL_20;
  }
  id v32 = 0;
  uint64_t v10 = [a1 _segmentForMediaType:a3 error:&v32];
  id v11 = v32;
  v12 = off_1E559C000;
  if (v11)
  {
    v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      v13 = +[AMSLogConfig sharedConfig];
    }
    v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      v16 = AMSLogKey();
      *(_DWORD *)buf = 138544130;
      uint64_t v34 = v15;
      __int16 v35 = 2114;
      v36 = v16;
      __int16 v37 = 2048;
      int64_t v38 = a3;
      __int16 v39 = 2114;
      id v40 = v11;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch ASD segment for mediaType: %ld. %{public}@", buf, 0x2Au);
    }
    goto LABEL_8;
  }
  if ([v9 count])
  {
    v24 = +[AMSLogConfig sharedConfig];
    if (!v24)
    {
      v24 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v25 = a3;
    v26 = [v24 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = objc_opt_class();
      v28 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v34 = v27;
      uint64_t v25 = a3;
      v12 = off_1E559C000;
      __int16 v35 = 2114;
      v36 = v28;
      __int16 v37 = 2048;
      int64_t v38 = a3;
      _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Caching ASD entitlement data for mediaType: %ld", buf, 0x20u);
    }
    v29 = [getASDSubscriptionEntitlementsClass() sharedInstance];
    v30 = objc_msgSend(v8, "ams_DSID");
    [v29 setSubscriptionEntitlementsWithDictionary:v9 forAccountID:v30 segment:v10];

    if (v25 == 2) {
      goto LABEL_9;
    }
LABEL_20:
    v23 = +[AMSBinaryPromise promiseWithSuccess];
    goto LABEL_21;
  }
LABEL_8:

LABEL_9:
  v17 = [(__objc2_class *)v12[17] sharedConfig];
  if (!v17)
  {
    v17 = [(__objc2_class *)v12[17] sharedConfig];
  }
  v18 = [v17 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = objc_opt_class();
    v20 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v34 = v19;
    __int16 v35 = 2114;
    v36 = v20;
    __int16 v37 = 2048;
    int64_t v38 = a3;
    _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Reloading entitlement data for mediaType: %ld", buf, 0x20u);
  }
  v21 = [[AMSSubscriptionEntitlementsTask alloc] initWithMediaType:a3];
  [(AMSSubscriptionEntitlementsTask *)v21 setCachePolicy:1];
  v22 = [(AMSSubscriptionEntitlementsTask *)v21 performExternalLookup];
  v23 = [v22 binaryPromiseAdapter];

LABEL_21:
  return v23;
}

- (id)_fetchEntitlementsFromASD
{
  id v10 = 0;
  unint64_t v3 = +[AMSSubscriptionEntitlementsTask _segmentForMediaType:[(AMSSubscriptionEntitlementsTask *)self mediaType] error:&v10];
  id v4 = v10;
  if (v4)
  {
    objc_super v5 = +[AMSPromise promiseWithError:v4];
  }
  else
  {
    v6 = [getASDSubscriptionEntitlementsClass() sharedInstance];
    if ([(AMSSubscriptionEntitlementsTask *)self _shouldIgnoreCaches]) {
      [(AMSSubscriptionEntitlementsTask *)self _reloadASDSubscriptionForSegment:v3 controller:v6];
    }
    else {
    v7 = [(AMSSubscriptionEntitlementsTask *)self _queryCachedASDSubscriptionForSegment:v3 controller:v6 reloadIfNeeded:[(AMSSubscriptionEntitlementsTask *)self _shouldIgnoreRemoteData] ^ 1];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__AMSSubscriptionEntitlementsTask__fetchEntitlementsFromASD__block_invoke;
    v9[3] = &unk_1E559E528;
    v9[4] = self;
    objc_super v5 = [v7 thenWithBlock:v9];
  }
  return v5;
}

id __60__AMSSubscriptionEntitlementsTask__fetchEntitlementsFromASD__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  objc_super v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = AMSLogKey();
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully fetched subscriptions", (uint8_t *)&v11, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) _resultFromASDEntitlements:v3];

  id v9 = +[AMSPromise promiseWithResult:v8];

  return v9;
}

- (id)_fetchEntitlementsFromIC
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(AMSMutablePromise);
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  objc_super v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching Music subscription entitlements", buf, 0x16u);
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  id v8 = (void *)qword_1EB38DFA0;
  uint64_t v30 = qword_1EB38DFA0;
  if (!qword_1EB38DFA0)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getICMusicSubscriptionStatusControllerClass_block_invoke;
    id v32 = &unk_1E559EC70;
    v33 = &v27;
    __getICMusicSubscriptionStatusControllerClass_block_invoke((uint64_t)buf);
    id v8 = (void *)v28[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v27, 8);
  id v10 = [v9 sharedStatusController];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  int v11 = (void *)qword_1EB38DFA8;
  uint64_t v30 = qword_1EB38DFA8;
  if (!qword_1EB38DFA8)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getICStoreRequestContextClass_block_invoke;
    id v32 = &unk_1E559EC70;
    v33 = &v27;
    __getICStoreRequestContextClass_block_invoke((uint64_t)buf);
    int v11 = (void *)v28[3];
  }
  uint64_t v12 = v11;
  _Block_object_dispose(&v27, 8);
  id v13 = [v12 alloc];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  v14 = (void *)qword_1EB38DFB0;
  uint64_t v30 = qword_1EB38DFB0;
  if (!qword_1EB38DFB0)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getICUserIdentityClass_block_invoke;
    id v32 = &unk_1E559EC70;
    v33 = &v27;
    __getICUserIdentityClass_block_invoke((uint64_t)buf);
    v14 = (void *)v28[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v27, 8);
  v16 = [v15 activeAccount];
  v17 = (void *)[v13 initWithIdentity:v16];

  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  v18 = (void *)qword_1EB38DFB8;
  uint64_t v30 = qword_1EB38DFB8;
  if (!qword_1EB38DFB8)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getICMusicSubscriptionStatusRequestClass_block_invoke;
    id v32 = &unk_1E559EC70;
    v33 = &v27;
    __getICMusicSubscriptionStatusRequestClass_block_invoke((uint64_t)buf);
    v18 = (void *)v28[3];
  }
  uint64_t v19 = v18;
  _Block_object_dispose(&v27, 8);
  v20 = (void *)[[v19 alloc] initWithStoreRequestContext:v17];
  [v20 setShouldBypassEnforcementOfPrivacyAcknowledgement:1];
  if ([(AMSSubscriptionEntitlementsTask *)self _shouldIgnoreCaches])
  {
    [v20 setShouldIgnoreCache:1];
  }
  else
  {
    [v20 setAllowsFallbackToExpiredStatus:1];
    [v20 setAllowsFallbackToStatusNeedingReload:1];
    if ([(AMSSubscriptionEntitlementsTask *)self _shouldIgnoreRemoteData]) {
      [v20 setShouldReturnLastKnownStatusOnly:1];
    }
  }
  if ([(AMSSubscriptionEntitlementsTask *)self extendedCarrierCheck])
  {
    [v20 setCarrierBundleProvisioningStyle:2];
    [v20 setReason:1];
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __59__AMSSubscriptionEntitlementsTask__fetchEntitlementsFromIC__block_invoke;
  v25[3] = &unk_1E55A6CC8;
  v25[4] = self;
  v21 = v3;
  v26 = v21;
  [v10 performSubscriptionStatusRequest:v20 withCompletionHandler:v25];
  v22 = v26;
  v23 = v21;

  return v23;
}

void __59__AMSSubscriptionEntitlementsTask__fetchEntitlementsFromIC__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[AMSLogConfig sharedConfig];
  id v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      int v11 = AMSLogKey();
      int v17 = 138543874;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      v20 = v11;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Lookup failed. %{public}@", (uint8_t *)&v17, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithError:v6];
  }
  else
  {
    if (!v7)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [v8 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      v14 = AMSLogKey();
      int v17 = 138543618;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      v20 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Lookup succeeded", (uint8_t *)&v17, 0x16u);
    }
    id v15 = *(void **)(a1 + 40);
    v16 = [*(id *)(a1 + 32) _resultFromICResponse:v5];
    [v15 finishWithResult:v16];
  }
}

- (id)_queryCachedASDSubscriptionForSegment:(unint64_t)a3 controller:(id)a4 reloadIfNeeded:(BOOL)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = objc_alloc_init(AMSMutablePromise);
  uint64_t v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
  }
  int v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v12;
    __int16 v26 = 2114;
    uint64_t v27 = v13;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching ASD cached subscriptions", buf, 0x16u);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __99__AMSSubscriptionEntitlementsTask__queryCachedASDSubscriptionForSegment_controller_reloadIfNeeded___block_invoke;
  v19[3] = &unk_1E55A6CF0;
  BOOL v23 = a5;
  unint64_t v22 = a3;
  v19[4] = self;
  id v20 = v8;
  v14 = v9;
  __int16 v21 = v14;
  id v15 = v8;
  [v15 getCachedSubscriptionEntitlementsForSegment:a3 withResultHandler:v19];
  v16 = v21;
  int v17 = v14;

  return v17;
}

void __99__AMSSubscriptionEntitlementsTask__queryCachedASDSubscriptionForSegment_controller_reloadIfNeeded___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v11 = a2;
  id v7 = a4;
  id v8 = v7;
  if (a3 && *(unsigned char *)(a1 + 64))
  {
    id v9 = [*(id *)(a1 + 32) _reloadASDSubscriptionForSegment:*(void *)(a1 + 56) controller:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) finishWithPromise:v9];
  }
  else
  {
    if (v7)
    {
      [*(id *)(a1 + 48) finishWithError:v7];
      goto LABEL_10;
    }
    uint64_t v10 = *(void **)(a1 + 48);
    if (v11)
    {
      objc_msgSend(v10, "finishWithResult:");
      goto LABEL_10;
    }
    id v9 = AMSError(0, @"Cached Subscription Status Failed", @"Neither a result nor error returned", 0);
    [v10 finishWithError:v9];
  }

LABEL_10:
}

- (id)_reloadASDSubscriptionForSegment:(unint64_t)a3 controller:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(AMSMutablePromise);
  id v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Forcing ASD fetch for subscriptions", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__AMSSubscriptionEntitlementsTask__reloadASDSubscriptionForSegment_controller___block_invoke;
  v13[3] = &unk_1E55A6D18;
  id v11 = v6;
  v14 = v11;
  [v5 getSubscriptionEntitlementsForSegment:a3 ignoreCaches:1 isBackground:1 requestingBundleId:@"com.apple.AppStore" withCacheInfoResultHandler:v13];

  return v11;
}

void __79__AMSSubscriptionEntitlementsTask__reloadASDSubscriptionForSegment_controller___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v10 = a2;
  id v7 = a5;
  if (v7)
  {
    [*(id *)(a1 + 32) finishWithError:v7];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    if (v10)
    {
      objc_msgSend(v8, "finishWithResult:");
    }
    else
    {
      uint64_t v9 = AMSError(0, @"Reload Subscription Status Failed", @"Neither a result nor error returned", 0);
      [v8 finishWithError:v9];
    }
  }
}

- (id)_resultFromASDEntitlements:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v46 = objc_alloc_init(AMSSubscriptionEntitlementsResult);
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v50;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (v6)
        {
          if (v7) {
            goto LABEL_8;
          }
        }
        else
        {
          id v6 = [*(id *)(*((void *)&v49 + 1) + 8 * i) appVersion];
          if (v7) {
            goto LABEL_8;
          }
        }
        id v7 = [v10 appAdamID];
LABEL_8:
        id v11 = objc_alloc_init(AMSSubscriptionEntitlement);
        -[AMSSubscriptionEntitlement setAutoRenewEnabled:](v11, "setAutoRenewEnabled:", [v10 autoRenewEnabled]);
        uint64_t v12 = [v10 expiryDate];
        [(AMSSubscriptionEntitlement *)v11 setExpiration:v12];

        uint64_t v13 = [v10 chargeStoreFrontID];
        [(AMSSubscriptionEntitlement *)v11 setChargeStoreFrontID:v13];

        v14 = [v10 externalSubscriptionID];
        [(AMSSubscriptionEntitlement *)v11 setExternalSubscriptionID:v14];

        id v15 = [v10 familyRank];
        [(AMSSubscriptionEntitlement *)v11 setFamilyRank:v15];

        -[AMSSubscriptionEntitlement setFamilySubscription:](v11, "setFamilySubscription:", [v10 hasFamily]);
        uint64_t v16 = [v10 inAppAdamID];
        [(AMSSubscriptionEntitlement *)v11 setInAppAdamId:v16];

        __int16 v17 = [v10 inAppVersion];
        [(AMSSubscriptionEntitlement *)v11 setInAppVersion:v17];

        uint64_t v18 = [v10 offerID];
        [(AMSSubscriptionEntitlement *)v11 setOfferId:v18];

        uint64_t v19 = [v10 entitlementOriginType];
        [(AMSSubscriptionEntitlement *)v11 setEntitlementOriginType:v19];

        id v20 = [v10 entitlementSourceAdamID];
        [(AMSSubscriptionEntitlement *)v11 setEntitlementSourceAdamId:v20];

        __int16 v21 = [v10 featureAccessTypeID];
        [(AMSSubscriptionEntitlement *)v11 setFeatureAccessTypeId:v21];

        unint64_t v22 = [v10 freeTrialPeriodID];
        [(AMSSubscriptionEntitlement *)v11 setFreeTrialPeriodId:v22];

        BOOL v23 = [v10 poolType];
        [(AMSSubscriptionEntitlement *)v11 setPoolType:v23];

        v24 = [v10 promoScenarioID];
        [(AMSSubscriptionEntitlement *)v11 setPromoScenarioId:v24];

        uint64_t v25 = [v10 startDate];
        [(AMSSubscriptionEntitlement *)v11 setStartDate:v25];

        __int16 v26 = [v10 subscriptionBundleID];
        [(AMSSubscriptionEntitlement *)v11 setSubscriptionBundleId:v26];

        uint64_t v27 = [v10 vendorAdHocOfferID];
        [(AMSSubscriptionEntitlement *)v11 setVendorAdHocOfferId:v27];

        uint64_t v28 = [v10 vendorID];
        [(AMSSubscriptionEntitlement *)v11 setVendorId:v28];

        [(AMSSubscriptionEntitlement *)v11 setPeriod:0];
        -[AMSSubscriptionEntitlement setPeriod:](v11, "setPeriod:", -[AMSSubscriptionEntitlement period](v11, "period") | [v10 isTrialPeriod]);
        if ([v10 isOfferPeriod]) {
          uint64_t v29 = 2;
        }
        else {
          uint64_t v29 = 0;
        }
        [(AMSSubscriptionEntitlement *)v11 setPeriod:[(AMSSubscriptionEntitlement *)v11 period] | v29];
        if ([v10 isInGracePeriod]) {
          uint64_t v30 = 4;
        }
        else {
          uint64_t v30 = 0;
        }
        [(AMSSubscriptionEntitlement *)v11 setPeriod:[(AMSSubscriptionEntitlement *)v11 period] | v30];
        [(AMSSubscriptionEntitlement *)v11 setInFreePeriod:[(AMSSubscriptionEntitlement *)v11 period] & 1];
        v31 = [v10 initialPurchaseTimestamp];
        [v31 doubleValue];
        [(AMSSubscriptionEntitlement *)v11 setInitialPurchaseTimestamp:v32 / 1000.0];

        v33 = [v10 startDate];
        [(AMSSubscriptionEntitlement *)v11 setRenewDate:v33];

        uint64_t v34 = [v10 serviceBeginsTimestamp];
        [v34 doubleValue];
        [(AMSSubscriptionEntitlement *)v11 setServiceBeginsTimestamp:v35 / 1000.0];

        -[AMSSubscriptionEntitlement setPurchaser:](v11, "setPurchaser:", [v10 isPurchaser]);
        [(AMSSubscriptionEntitlement *)v11 setSource:1];
        uint64_t v36 = [v10 expiryDate];

        if (v36)
        {
          __int16 v37 = [MEMORY[0x1E4F1C9C8] now];
          int64_t v38 = [v10 expiryDate];
          uint64_t v36 = [v37 compare:v38] == -1;
        }
        [(AMSSubscriptionEntitlement *)v11 setStatus:v36];
        __int16 v39 = [v10 inAppAdamID];
        id v40 = [v39 stringValue];
        uint64_t v41 = v40;
        if (v40)
        {
          id v42 = v40;
        }
        else
        {
          v43 = [MEMORY[0x1E4F29128] UUID];
          id v42 = [v43 UUIDString];
        }
        [v48 setObject:v11 forKeyedSubscript:v42];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (!v5) {
        goto LABEL_25;
      }
    }
  }
  id v6 = 0;
  id v7 = 0;
LABEL_25:

  [(AMSSubscriptionEntitlementsResult *)v46 setEntitlements:v48];
  [(AMSSubscriptionEntitlementsResult *)v46 setAppAdamId:v7];
  [(AMSSubscriptionEntitlementsResult *)v46 setAppVersion:v6];
  v44 = v46;

  return v44;
}

- (id)_resultFromICResponse:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 subscriptionStatus];
  uint64_t v4 = objc_alloc_init(AMSSubscriptionEntitlementsResult);
  [(AMSSubscriptionEntitlementsResult *)v4 setAppAdamId:0];
  [(AMSSubscriptionEntitlementsResult *)v4 setAppVersion:0];
  uint64_t v5 = [v3 responseDictionary];
  [(AMSSubscriptionEntitlementsResult *)v4 setServerResponse:v5];

  id v6 = objc_alloc_init(AMSSubscriptionEntitlement);
  -[AMSSubscriptionEntitlement setStatus:](v6, "setStatus:", [v3 isMatchEnabled]);
  id v7 = objc_alloc_init(AMSSubscriptionEntitlement);
  -[AMSSubscriptionEntitlement setAutoRenewEnabled:](v7, "setAutoRenewEnabled:", [v3 isAutoRenewEnabled]);
  uint64_t v8 = [v3 expirationDate];
  [(AMSSubscriptionEntitlement *)v7 setExpiration:v8];

  BOOL v9 = [v3 statusType] == 1 && objc_msgSend(v3, "reasonType") == 2;
  [(AMSSubscriptionEntitlement *)v7 setFamilySubscription:v9];
  -[AMSSubscriptionEntitlement setFreeTrialEligible:](v7, "setFreeTrialEligible:", [v3 isEligibleForFreeTrial]);
  -[AMSSubscriptionEntitlement setPurchaser:](v7, "setPurchaser:", [v3 isPurchaser]);
  -[AMSSubscriptionEntitlement setCarrierErrorCode:](v7, "setCarrierErrorCode:", [v3 carrierBundlingErrorCode]);
  id v10 = [v3 cellularOperatorName];
  [(AMSSubscriptionEntitlement *)v7 setCarrierOperatorName:v10];

  id v11 = [v3 sessionIdentifier];
  [(AMSSubscriptionEntitlement *)v7 setCarrierSessionId:v11];

  uint64_t v12 = [v3 phoneNumber];
  [(AMSSubscriptionEntitlement *)v7 setCarrierPhoneNumber:v12];

  uint64_t v13 = [v3 studentExpirationDate];
  [(AMSSubscriptionEntitlement *)v7 setStudentExpirationDate:v13];

  v14 = [v3 initialPurchaseTimestamp];
  [v14 timeIntervalSince1970];
  -[AMSSubscriptionEntitlement setInitialPurchaseTimestamp:](v7, "setInitialPurchaseTimestamp:");

  id v15 = [v3 serviceBeginsTimestamp];
  [v15 timeIntervalSince1970];
  -[AMSSubscriptionEntitlement setServiceBeginsTimestamp:](v7, "setServiceBeginsTimestamp:");

  unint64_t v16 = [v3 carrierBundlingStatusType];
  if (v16 <= 4) {
    [(AMSSubscriptionEntitlement *)v7 setCarrierStatus:dword_18DDF4D30[v16]];
  }
  [(AMSSubscriptionEntitlement *)v7 setPeriod:0];
  -[AMSSubscriptionEntitlement setPeriod:](v7, "setPeriod:", -[AMSSubscriptionEntitlement period](v7, "period") | [v3 isInFreeTrial]);
  -[AMSSubscriptionEntitlement setInFreePeriod:](v7, "setInFreePeriod:", [v3 isInFreePeriod]);
  unint64_t v17 = [v3 sourceType];
  if (v17 <= 2) {
    [(AMSSubscriptionEntitlement *)v7 setSource:v17];
  }
  -[AMSSubscriptionEntitlement setStatus:](v7, "setStatus:", [v3 statusType] == 1);
  v20[0] = @"music-match";
  v20[1] = @"music";
  v21[0] = v6;
  v21[1] = v7;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  [(AMSSubscriptionEntitlementsResult *)v4 setEntitlements:v18];

  return v4;
}

+ (unint64_t)_segmentForMediaType:(int64_t)a3 error:(id *)a4
{
  if ((unint64_t)a3 >= 8)
  {
    if (a4)
    {
      AMSErrorWithFormat(12, @"Entitlements Failure", @"Unhandled segment for mediaType: %ld", (uint64_t)a4, v4, v5, v6, v7, a3);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 1;
  }
  else
  {
    uint64_t v8 = (void *)qword_1E55A6D68[a3];
    return [v8 unsignedLongValue];
  }
}

- (BOOL)_shouldIgnoreCaches
{
  return [(AMSSubscriptionEntitlementsTask *)self cachePolicy] == 1;
}

- (BOOL)_shouldIgnoreRemoteData
{
  return [(AMSSubscriptionEntitlementsTask *)self cachePolicy] == 2;
}

- (int64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(int64_t)a3
{
  self->_cachePolicy = a3;
}

- (BOOL)extendedCarrierCheck
{
  return self->_extendedCarrierCheck;
}

- (void)setExtendedCarrierCheck:(BOOL)a3
{
  self->_extendedCarrierCheck = a3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

@end