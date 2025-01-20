@interface BDSReadingGoalsServiceClient
+ (id)sharedServiceProxy;
+ (void)clearLocalCachedDataWithCompletionHandler:(id)a3;
- (BDSReadingGoalsServiceClient)init;
- (BDSServiceProtocol)serviceProxy;
- (id)onRemoteChange;
- (void)_handleOnRemoteChange:(id)a3;
- (void)changeBooksFinishedGoalTo:(int64_t)a3 completionHandler:(id)a4;
- (void)changeDailyGoalTo:(double)a3 completionHandler:(id)a4;
- (void)clearDataWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)setOnRemoteChange:(id)a3;
- (void)stateInfoWithCompletionHandler:(id)a3;
@end

@implementation BDSReadingGoalsServiceClient

+ (id)sharedServiceProxy
{
  if (qword_26AD776B0 != -1) {
    dispatch_once(&qword_26AD776B0, &unk_26E971290);
  }
  v2 = (void *)qword_26AD77680;
  return v2;
}

- (BDSReadingGoalsServiceClient)init
{
  v24.receiver = self;
  v24.super_class = (Class)BDSReadingGoalsServiceClient;
  v9 = [(BDSReadingGoalsServiceClient *)&v24 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_sharedServiceProxy(BDSReadingGoalsServiceClient, v2, v3, v4, v5, v6, v7, v8);
    serviceProxy = v9->_serviceProxy;
    v9->_serviceProxy = (BDSServiceProtocol *)v10;

    v19 = objc_msgSend_defaultCenter(MEMORY[0x263F087C8], v12, v13, v14, v15, v16, v17, v18);
    objc_msgSend_addObserver_selector_name_object_(v19, v20, (uint64_t)v9, (uint64_t)sel__handleOnRemoteChange_, @"com.apple.BDSService.ReadingGoalsService.onRemoteChange", 0, v21, v22);
  }
  return v9;
}

- (void)dealloc
{
  v9 = objc_msgSend_defaultCenter(MEMORY[0x263F087C8], a2, v2, v3, v4, v5, v6, v7);
  objc_msgSend_removeObserver_name_object_(v9, v10, (uint64_t)self, @"com.apple.BDSService.ReadingGoalsService.onRemoteChange", 0, v11, v12, v13);

  v14.receiver = self;
  v14.super_class = (Class)BDSReadingGoalsServiceClient;
  [(BDSReadingGoalsServiceClient *)&v14 dealloc];
}

- (void)changeBooksFinishedGoalTo:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  objc_msgSend_serviceProxy(self, v7, v8, v9, v10, v11, v12, v13);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingGoalsChangeBooksFinishedGoalTo_withCompletion_(v19, v14, a3, (uint64_t)v6, v15, v16, v17, v18);
}

- (void)changeDailyGoalTo:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  objc_msgSend_serviceProxy(self, v7, v8, v9, v10, v11, v12, v13);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingGoalsChangeDailyGoalTo_withCompletion_(v20, v14, (uint64_t)v6, v15, v16, v17, v18, v19, a3);
}

- (void)clearDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingGoalsClearDataWithCompletion_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (void)stateInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingGoalsStateInfoWithCompletion_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

+ (void)clearLocalCachedDataWithCompletionHandler:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedServiceProxy(BDSReadingGoalsServiceClient, v4, v5, v6, v7, v8, v9, v10);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingGoalsClearLocalCachedDataWithCompletion_(v17, v11, (uint64_t)v3, v12, v13, v14, v15, v16);
}

- (void)_handleOnRemoteChange:(id)a3
{
  id v4 = BDSServiceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_2360BC000, v4, OS_LOG_TYPE_DEFAULT, "BDSReadingGoalsServiceClient _handleOnRemoteChange", v14, 2u);
  }

  uint64_t v12 = objc_msgSend_onRemoteChange(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v13 = (void *)v12;
  if (v12) {
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }
}

- (id)onRemoteChange
{
  return self->_onRemoteChange;
}

- (void)setOnRemoteChange:(id)a3
{
}

- (BDSServiceProtocol)serviceProxy
{
  return self->_serviceProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong(&self->_onRemoteChange, 0);
}

@end