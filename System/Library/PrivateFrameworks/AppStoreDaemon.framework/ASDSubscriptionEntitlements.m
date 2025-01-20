@interface ASDSubscriptionEntitlements
+ (id)sharedInstance;
- (ASDSubscriptionEntitlements)init;
- (id)_initWithServiceBroker:(id)a3;
- (void)dealloc;
- (void)getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler:(id)a3;
- (void)getCachedSubscriptionEntitlementsForSegment:(unint64_t)a3 withResultHandler:(id)a4;
- (void)getSubscriptionEntitlementsForActiveAccountWithResultAndExpiryHandler:(id)a3;
- (void)getSubscriptionEntitlementsForActiveAccountWithResultHandler:(id)a3;
- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 isBackground:(BOOL)a5 requestingBundleId:(id)a6 withCacheInfoResultHandler:(id)a7;
- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 requestingBundleId:(id)a5 withCacheInfoResultHandler:(id)a6;
- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 withCacheInfoResultHandler:(id)a5;
- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 withResultHandler:(id)a5;
- (void)getSubscriptionEntitlementsIgnoreCaches:(BOOL)a3 forActiveAccountWithResultHandler:(id)a4;
- (void)getSubscriptionEntitlementsIgnoreCaches:(void *)a3 forActiveAccountWithResultAndExpiryHandler:;
- (void)setSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4;
- (void)setSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4 segment:(unint64_t)a5;
@end

@implementation ASDSubscriptionEntitlements

- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 withResultHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __100__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_withResultHandler___block_invoke;
  v10[3] = &unk_1E58B3798;
  id v11 = v8;
  id v9 = v8;
  [(ASDSubscriptionEntitlements *)self getSubscriptionEntitlementsForSegment:a3 ignoreCaches:v5 withCacheInfoResultHandler:v10];
}

- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 withCacheInfoResultHandler:(id)a5
{
}

- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 requestingBundleId:(id)a5 withCacheInfoResultHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  serviceBroker = self->_serviceBroker;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke;
  v15[3] = &unk_1E58B3810;
  id v17 = v11;
  unint64_t v18 = a3;
  BOOL v19 = a4;
  id v16 = v10;
  id v13 = v10;
  id v14 = v11;
  [(ASDServiceBroker *)serviceBroker getIAPHistoryServiceWithCompletionHandler:v15];
}

uint64_t __100__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_withResultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(void *)(a1 + 40));
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ASDSubscriptionEntitlements_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D6470 != -1) {
    dispatch_once(&qword_1EB4D6470, block);
  }
  v2 = (void *)_MergedGlobals_28;
  return v2;
}

void __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_2;
    v15[3] = &unk_1E58B2CB8;
    v6 = &v16;
    id v16 = *(id *)(a1 + 32);
    v7 = [a2 remoteObjectProxyWithErrorHandler:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_4;
    v13[3] = &unk_1E58B3770;
    id v8 = &v14;
    uint64_t v9 = *(void *)(a1 + 40);
    id v14 = *(id *)(a1 + 32);
    [v7 getCachedSubscriptionEntitlementsForSegment:v9 withReplyHandler:v13];
  }
  else
  {
    v7 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_6;
    v10[3] = &unk_1E58B2E18;
    v6 = &v12;
    id v12 = *(id *)(a1 + 32);
    id v8 = &v11;
    id v11 = v5;
    dispatch_async(v7, v10);
  }
}

void __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_2;
    v14[3] = &unk_1E58B2CB8;
    v6 = &v15;
    id v15 = *(id *)(a1 + 32);
    v7 = [a2 remoteObjectProxyWithErrorHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_4;
    v12[3] = &unk_1E58B3770;
    id v8 = &v13;
    id v13 = *(id *)(a1 + 32);
    [v7 getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler:v12];
  }
  else
  {
    v7 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_6;
    v9[3] = &unk_1E58B2E18;
    v6 = &v11;
    id v11 = *(id *)(a1 + 32);
    id v8 = &v10;
    id v10 = v5;
    dispatch_async(v7, v9);
  }
}

void __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_2;
    v17[3] = &unk_1E58B2CB8;
    v6 = &v18;
    id v18 = *(id *)(a1 + 40);
    v7 = [a2 remoteObjectProxyWithErrorHandler:v17];
    uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_4;
    v15[3] = &unk_1E58B3798;
    id v10 = &v16;
    uint64_t v11 = *(void *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    [v7 getSubscriptionEntitlementsForSegment:v11 ignoreCaches:v8 requestingBundleId:v9 withReplyHandler:v15];
  }
  else
  {
    v7 = dispatch_get_global_queue(0, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_6;
    v12[3] = &unk_1E58B2E18;
    v6 = &v14;
    id v14 = *(id *)(a1 + 40);
    id v10 = &v13;
    id v13 = v5;
    dispatch_async(v7, v12);
  }
}

void __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_4(uint64_t a1, void *a2, char a3, char a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  uint64_t v11 = dispatch_get_global_queue(0, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_5;
  v15[3] = &unk_1E58B37E8;
  id v12 = *(id *)(a1 + 32);
  id v17 = v10;
  id v18 = v12;
  char v19 = a3;
  char v20 = a4;
  id v16 = v9;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

uint64_t __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

uint64_t __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

uint64_t __45__ASDSubscriptionEntitlements_sharedInstance__block_invoke(uint64_t a1)
{
  _MergedGlobals_28 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (ASDSubscriptionEntitlements)init
{
  v3 = +[ASDServiceBroker defaultBroker];
  v4 = [(ASDSubscriptionEntitlements *)self _initWithServiceBroker:v3];

  if (v4)
  {
    objc_initWeak(location, v4);
    v4->_newsCacheUpdatedNotificationToken = -1;
    id v5 = dispatch_get_global_queue(21, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __35__ASDSubscriptionEntitlements_init__block_invoke;
    handler[3] = &unk_1E58B36F8;
    objc_copyWeak(&v26, location);
    notify_register_dispatch("com.apple.appstored.NewsSubEntitlementsCacheUpdated", &v4->_newsCacheUpdatedNotificationToken, v5, handler);

    v4->_appStoreCacheUpdatedNotificationToken = -1;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_2;
    v23[3] = &unk_1E58B36F8;
    objc_copyWeak(&v24, location);
    notify_register_dispatch("com.apple.appstored.AppStoreSubEntitlementsCacheUpdated", &v4->_appStoreCacheUpdatedNotificationToken, v5, v23);

    v4->_appStoreArcadeSubscriptionBagUpdatedNotificationToken = -1;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_3;
    v21[3] = &unk_1E58B36F8;
    objc_copyWeak(&v22, location);
    notify_register_dispatch("com.apple.appstored.ASDArcadeSubscriptionBagUpdatedNotification", &v4->_appStoreArcadeSubscriptionBagUpdatedNotificationToken, v5, v21);

    v4->_appStoreArcadeSubscriptionBagUpdatedNotificationToken = -1;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_4;
    v19[3] = &unk_1E58B36F8;
    objc_copyWeak(&v20, location);
    notify_register_dispatch("com.apple.appstored.ASDArcadeSubscriptionBagUpdatedNotification", &v4->_appStoreArcadeSubscriptionBagUpdatedNotificationToken, v5, v19);

    v4->_musicCacheUpdatedNotificationToken = -1;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_5;
    v17[3] = &unk_1E58B36F8;
    objc_copyWeak(&v18, location);
    notify_register_dispatch("com.apple.appstored.MusicSubEntitlementsCacheUpdated", &v4->_musicCacheUpdatedNotificationToken, v5, v17);

    v4->_tvCacheUpdatedNotificationToken = -1;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_6;
    v15[3] = &unk_1E58B36F8;
    objc_copyWeak(&v16, location);
    notify_register_dispatch("com.apple.appstored.TVSubEntitlementsCacheUpdated", &v4->_tvCacheUpdatedNotificationToken, v5, v15);

    v4->_iCloudCacheUpdatedNotificationToken = -1;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_7;
    v13[3] = &unk_1E58B36F8;
    objc_copyWeak(&v14, location);
    notify_register_dispatch("com.apple.appstored.iCloudSubEntitlementsCacheUpdated", &v4->_iCloudCacheUpdatedNotificationToken, v5, v13);

    v4->_podcastCacheUpdatedNotificationToken = -1;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_8;
    v11[3] = &unk_1E58B36F8;
    objc_copyWeak(&v12, location);
    notify_register_dispatch("com.apple.appstored.PodcastSubEntitlementsCacheUpdated", &v4->_podcastCacheUpdatedNotificationToken, v5, v11);

    v4->_activityCacheUpdatedNotificationToken = -1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_9;
    v9[3] = &unk_1E58B36F8;
    objc_copyWeak(&v10, location);
    notify_register_dispatch("com.apple.appstored.ActivitySubEntitlementsCacheUpdated", &v4->_activityCacheUpdatedNotificationToken, v5, v9);

    v4->_hwBundleCacheUpdatedNotificationToken = -1;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__ASDSubscriptionEntitlements_init__block_invoke_10;
    v7[3] = &unk_1E58B36F8;
    objc_copyWeak(&v8, location);
    notify_register_dispatch("com.apple.appstored.HWBundleSubEntitlementsCacheUpdated", &v4->_hwBundleCacheUpdatedNotificationToken, v5, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(location);
  }
  return v4;
}

- (id)_initWithServiceBroker:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDSubscriptionEntitlements;
  v6 = [(ASDSubscriptionEntitlements *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serviceBroker, a3);
  }

  return v7;
}

- (void)getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler:(id)a3
{
  id v4 = a3;
  serviceBroker = self->_serviceBroker;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke;
  v7[3] = &unk_1E58B3888;
  id v8 = v4;
  id v6 = v4;
  [(ASDServiceBroker *)serviceBroker getIAPHistoryServiceWithCompletionHandler:v7];
}

- (void)getCachedSubscriptionEntitlementsForSegment:(unint64_t)a3 withResultHandler:(id)a4
{
  id v6 = a4;
  serviceBroker = self->_serviceBroker;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke;
  v9[3] = &unk_1E58B3860;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [(ASDServiceBroker *)serviceBroker getIAPHistoryServiceWithCompletionHandler:v9];
}

void __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_4(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  objc_super v9 = dispatch_get_global_queue(0, 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_5;
  v13[3] = &unk_1E58B3498;
  id v10 = *(id *)(a1 + 32);
  id v15 = v8;
  id v16 = v10;
  char v17 = a3;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

void __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_4(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  objc_super v9 = dispatch_get_global_queue(0, 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_5;
  v13[3] = &unk_1E58B3498;
  id v10 = *(id *)(a1 + 32);
  id v15 = v8;
  id v16 = v10;
  char v17 = a3;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

void __35__ASDSubscriptionEntitlements_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ASDSubscriptionEntitlementsDidChangeNotification" object:WeakRetained];

  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ASDSubscriptionEntitlementsNewsDidChangeNotification" object:WeakRetained];
}

void __35__ASDSubscriptionEntitlements_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ASDSubscriptionEntitlementsAppStoreDidChangeNotification" object:WeakRetained];
}

void __35__ASDSubscriptionEntitlements_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ASDArcadeSubscriptionBagDidChangeNotification" object:WeakRetained];
}

void __35__ASDSubscriptionEntitlements_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ASDArcadeSubscriptionBagDidChangeNotification" object:WeakRetained];
}

void __35__ASDSubscriptionEntitlements_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ASDSubscriptionEntitlementsMusicDidChangeNotification" object:WeakRetained];
}

void __35__ASDSubscriptionEntitlements_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ASDSubscriptionEntitlementsTVDidChangeNotification" object:WeakRetained];
}

void __35__ASDSubscriptionEntitlements_init__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ASDSubscriptionEntitlementsiCloudDidChangeNotification" object:WeakRetained];
}

void __35__ASDSubscriptionEntitlements_init__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ASDSubscriptionEntitlementsPodcastDidChangeNotification" object:WeakRetained];
}

void __35__ASDSubscriptionEntitlements_init__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ASDSubscriptionEntitlementsActivityDidChangeNotification" object:WeakRetained];
}

void __35__ASDSubscriptionEntitlements_init__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ASDSubscriptionEntitlementsHWBundleDidChangeNotification" object:WeakRetained];
}

- (void)dealloc
{
  notify_cancel(self->_newsCacheUpdatedNotificationToken);
  notify_cancel(self->_appStoreCacheUpdatedNotificationToken);
  notify_cancel(self->_activityCacheUpdatedNotificationToken);
  notify_cancel(self->_musicCacheUpdatedNotificationToken);
  notify_cancel(self->_tvCacheUpdatedNotificationToken);
  notify_cancel(self->_iCloudCacheUpdatedNotificationToken);
  notify_cancel(self->_podcastCacheUpdatedNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)ASDSubscriptionEntitlements;
  [(ASDSubscriptionEntitlements *)&v3 dealloc];
}

- (void)setSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__ASDSubscriptionEntitlements_setSubscriptionEntitlementsWithDictionary_forAccountID___block_invoke;
  v11[3] = &unk_1E58B3720;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(ASDServiceBroker *)serviceBroker getIAPHistoryServiceWithCompletionHandler:v11];
}

void __86__ASDSubscriptionEntitlements_setSubscriptionEntitlementsWithDictionary_forAccountID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error setting subscription entitlements: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v5)
  {
    id v8 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_4];
    [v8 setSubscriptionEntitlementsWithDictionary:*(void *)(a1 + 32) forAccountID:*(void *)(a1 + 40)];
  }
}

void __86__ASDSubscriptionEntitlements_setSubscriptionEntitlementsWithDictionary_forAccountID___block_invoke_42(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    objc_super v3 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "Error getting subscription entitlements remote object proxy: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)setSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4 segment:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (__IsDaemon)
  {
    id v10 = [NSClassFromString(&cfstr_Subscriptionen.isa) sharedInstance];
    [v10 setCachedSubscriptionEntitlements:v8 forAccountID:v9 segment:a5];
  }
  else
  {
    serviceBroker = self->_serviceBroker;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __94__ASDSubscriptionEntitlements_setSubscriptionEntitlementsWithDictionary_forAccountID_segment___block_invoke;
    v12[3] = &unk_1E58B3748;
    id v13 = v8;
    id v14 = v9;
    unint64_t v15 = a5;
    [(ASDServiceBroker *)serviceBroker getIAPHistoryServiceWithCompletionHandler:v12];
  }
}

void __94__ASDSubscriptionEntitlements_setSubscriptionEntitlementsWithDictionary_forAccountID_segment___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_error_impl(&dword_19BF6A000, v7, OS_LOG_TYPE_ERROR, "Error setting subscription entitlements: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v5)
  {
    id v8 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_50];
    [v8 setSubscriptionEntitlementsWithDictionary:a1[4] forAccountID:a1[5] segment:a1[6]];
  }
}

void __94__ASDSubscriptionEntitlements_setSubscriptionEntitlementsWithDictionary_forAccountID_segment___block_invoke_48(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    objc_super v3 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_ERROR, "Error getting subscription entitlements remote object proxy: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)getSubscriptionEntitlementsForActiveAccountWithResultHandler:(id)a3
{
}

- (void)getSubscriptionEntitlementsForActiveAccountWithResultAndExpiryHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __101__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForActiveAccountWithResultAndExpiryHandler___block_invoke;
  v6[3] = &unk_1E58B3770;
  id v7 = v4;
  id v5 = v4;
  -[ASDSubscriptionEntitlements getSubscriptionEntitlementsIgnoreCaches:forActiveAccountWithResultAndExpiryHandler:]((uint64_t)self, 0, v6);
}

void __101__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForActiveAccountWithResultAndExpiryHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  int v9 = dispatch_get_global_queue(0, 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForActiveAccountWithResultAndExpiryHandler___block_invoke_2;
  v13[3] = &unk_1E58B3498;
  id v10 = *(id *)(a1 + 32);
  id v15 = v8;
  id v16 = v10;
  char v17 = a3;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

uint64_t __101__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForActiveAccountWithResultAndExpiryHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

- (void)getSubscriptionEntitlementsIgnoreCaches:(void *)a3 forActiveAccountWithResultAndExpiryHandler:
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a1)
  {
    id v7 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke;
    v8[3] = &unk_1E58B37C0;
    id v9 = v5;
    char v10 = a2;
    [v7 getIAPHistoryServiceWithCompletionHandler:v8];
  }
}

- (void)getSubscriptionEntitlementsIgnoreCaches:(BOOL)a3 forActiveAccountWithResultHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __105__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultHandler___block_invoke;
  v8[3] = &unk_1E58B3770;
  id v9 = v6;
  id v7 = v6;
  -[ASDSubscriptionEntitlements getSubscriptionEntitlementsIgnoreCaches:forActiveAccountWithResultAndExpiryHandler:]((uint64_t)self, a3, v8);
}

void __105__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultHandler___block_invoke_2;
  block[3] = &unk_1E58B3068;
  id v9 = *(id *)(a1 + 32);
  id v14 = v7;
  id v15 = v9;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v8, block);
}

uint64_t __105__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_2;
    v15[3] = &unk_1E58B2CB8;
    id v6 = &v16;
    id v16 = *(id *)(a1 + 32);
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v15];
    uint64_t v8 = *(unsigned __int8 *)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_4;
    v13[3] = &unk_1E58B3798;
    id v9 = &v14;
    id v14 = *(id *)(a1 + 32);
    [v7 getSubscriptionEntitlementsForSegment:0 ignoreCaches:v8 requestingBundleId:0 withReplyHandler:v13];
  }
  else
  {
    id v7 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_6;
    v10[3] = &unk_1E58B2E18;
    id v6 = &v12;
    id v12 = *(id *)(a1 + 32);
    id v9 = &v11;
    id v11 = v5;
    dispatch_async(v7, v10);
  }
}

void __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, char a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(0, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_5;
  v14[3] = &unk_1E58B3498;
  id v11 = *(id *)(a1 + 32);
  id v16 = v9;
  id v17 = v11;
  char v18 = a4;
  id v15 = v8;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v10, v14);
}

uint64_t __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

uint64_t __114__ASDSubscriptionEntitlements_getSubscriptionEntitlementsIgnoreCaches_forActiveAccountWithResultAndExpiryHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

uint64_t __128__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 isBackground:(BOOL)a5 requestingBundleId:(id)a6 withCacheInfoResultHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  serviceBroker = self->_serviceBroker;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __141__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_isBackground_requestingBundleId_withCacheInfoResultHandler___block_invoke;
  v17[3] = &unk_1E58B3838;
  id v19 = v13;
  unint64_t v20 = a3;
  BOOL v21 = a4;
  BOOL v22 = a5;
  id v18 = v12;
  id v15 = v12;
  id v16 = v13;
  [(ASDServiceBroker *)serviceBroker getIAPHistoryServiceWithCompletionHandler:v17];
}

void __141__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_isBackground_requestingBundleId_withCacheInfoResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __141__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_isBackground_requestingBundleId_withCacheInfoResultHandler___block_invoke_2;
    v18[3] = &unk_1E58B2CB8;
    id v6 = &v19;
    id v19 = *(id *)(a1 + 40);
    id v7 = [a2 remoteObjectProxyWithErrorHandler:v18];
    uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 57);
    uint64_t v10 = *(void *)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __141__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_isBackground_requestingBundleId_withCacheInfoResultHandler___block_invoke_4;
    v16[3] = &unk_1E58B3798;
    id v11 = &v17;
    uint64_t v12 = *(void *)(a1 + 48);
    id v17 = *(id *)(a1 + 40);
    [v7 getSubscriptionEntitlementsForSegment:v12 ignoreCaches:v8 isBackground:v9 requestingBundleId:v10 withReplyHandler:v16];
  }
  else
  {
    id v7 = dispatch_get_global_queue(0, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __141__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_isBackground_requestingBundleId_withCacheInfoResultHandler___block_invoke_6;
    v13[3] = &unk_1E58B2E18;
    id v6 = &v15;
    id v15 = *(id *)(a1 + 40);
    id v11 = &v14;
    id v14 = v5;
    dispatch_async(v7, v13);
  }
}

void __141__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_isBackground_requestingBundleId_withCacheInfoResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __141__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_isBackground_requestingBundleId_withCacheInfoResultHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __141__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_isBackground_requestingBundleId_withCacheInfoResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

void __141__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_isBackground_requestingBundleId_withCacheInfoResultHandler___block_invoke_4(uint64_t a1, void *a2, char a3, char a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(0, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __141__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_isBackground_requestingBundleId_withCacheInfoResultHandler___block_invoke_5;
  v15[3] = &unk_1E58B37E8;
  id v12 = *(id *)(a1 + 32);
  id v17 = v10;
  id v18 = v12;
  char v19 = a3;
  char v20 = a4;
  id v16 = v9;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

uint64_t __141__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_isBackground_requestingBundleId_withCacheInfoResultHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(void *)(a1 + 40));
}

uint64_t __141__ASDSubscriptionEntitlements_getSubscriptionEntitlementsForSegment_ignoreCaches_isBackground_requestingBundleId_withCacheInfoResultHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

void __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

uint64_t __93__ASDSubscriptionEntitlements_getCachedSubscriptionEntitlementsForSegment_withResultHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

uint64_t __87__ASDSubscriptionEntitlements_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end