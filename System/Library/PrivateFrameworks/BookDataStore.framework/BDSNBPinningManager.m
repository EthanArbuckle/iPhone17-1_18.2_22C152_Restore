@interface BDSNBPinningManager
- (BDSNBPinningManager)init;
- (BDSServiceProxy)serviceProxy;
- (id)updateReadingNowWithCompletion:(id)a3;
- (id)updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful:(BOOL)a3 completion:(id)a4;
- (id)updateWantToReadWithCompletion:(id)a3;
- (void)audiobookStoreEnabledWithCompletion:(id)a3;
- (void)fetchMostRecentAudiobookWithCompletion:(id)a3;
- (void)setServiceProxy:(id)a3;
- (void)updateBitrateForItemWithAdamID:(id)a3 completion:(id)a4;
@end

@implementation BDSNBPinningManager

- (BDSNBPinningManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)BDSNBPinningManager;
  v2 = [(BDSNBPinningManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(BDSServiceProxy);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v3;
  }
  return v2;
}

- (void)fetchMostRecentAudiobookWithCompletion:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchMostRecentAudiobookWithCompletion_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (id)updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v14 = objc_msgSend_serviceProxy(self, v7, v8, v9, v10, v11, v12, v13);
  v20 = objc_msgSend_updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful_completion_(v14, v15, v4, (uint64_t)v6, v16, v17, v18, v19);

  return v20;
}

- (id)updateWantToReadWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v19 = objc_msgSend_updateWantToReadWithCompletion_(v12, v13, (uint64_t)v4, v14, v15, v16, v17, v18);

  return v19;
}

- (id)updateReadingNowWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v19 = objc_msgSend_updateReadingNowWithCompletion_(v12, v13, (uint64_t)v4, v14, v15, v16, v17, v18);

  return v19;
}

- (void)updateBitrateForItemWithAdamID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_serviceProxy(self, v8, v9, v10, v11, v12, v13, v14);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateBitrateForItemWithAdamID_completion_(v20, v15, (uint64_t)v7, (uint64_t)v6, v16, v17, v18, v19);
}

- (void)audiobookStoreEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_audiobookStoreEnabledWithCompletion_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
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