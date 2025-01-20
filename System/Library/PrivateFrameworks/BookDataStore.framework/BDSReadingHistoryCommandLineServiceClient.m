@interface BDSReadingHistoryCommandLineServiceClient
+ (id)sharedServiceProxy;
- (BDSReadingHistoryCommandLineServiceClient)init;
- (BDSServiceProtocol)serviceProxy;
- (void)backupWithName:(id)a3 completionHandler:(id)a4;
- (void)clearDataWithCompletionHandler:(id)a3;
- (void)clearDate:(id)a3 completionHandler:(id)a4;
- (void)clearTodayWithCompletionHandler:(id)a3;
- (void)incrementWithDate:(id)a3 by:(int64_t)a4 completionHandler:(id)a5;
- (void)listBackupWithCompletionHandler:(id)a3;
- (void)readingHistoryStateInfoWithRangeStart:(id)a3 rangeEnd:(id)a4 currentTime:(id)a5 completionHandler:(id)a6;
- (void)restoreWithName:(id)a3 completionHandler:(id)a4;
- (void)serviceStatusInfoWithCompletionHandler:(id)a3;
@end

@implementation BDSReadingHistoryCommandLineServiceClient

+ (id)sharedServiceProxy
{
  if (qword_26AD776A8 != -1) {
    dispatch_once(&qword_26AD776A8, &unk_26E971250);
  }
  v2 = (void *)qword_26AD77678;
  return v2;
}

- (BDSReadingHistoryCommandLineServiceClient)init
{
  v13.receiver = self;
  v13.super_class = (Class)BDSReadingHistoryCommandLineServiceClient;
  v9 = [(BDSReadingHistoryCommandLineServiceClient *)&v13 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_sharedServiceProxy(BDSReadingHistoryCommandLineServiceClient, v2, v3, v4, v5, v6, v7, v8);
    serviceProxy = v9->_serviceProxy;
    v9->_serviceProxy = (BDSServiceProtocol *)v10;
  }
  return v9;
}

- (void)clearDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryClearDataWithCompletion_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (void)clearDate:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_serviceProxy(self, v8, v9, v10, v11, v12, v13, v14);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryClearDate_withCompletion_(v20, v15, (uint64_t)v7, (uint64_t)v6, v16, v17, v18, v19);
}

- (void)clearTodayWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryClearTodayWithCompletion_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (void)incrementWithDate:(id)a3 by:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  objc_msgSend_serviceProxy(self, v10, v11, v12, v13, v14, v15, v16);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryIncrementWithDate_by_withCompletion_(v21, v17, (uint64_t)v9, a4, (uint64_t)v8, v18, v19, v20);
}

- (void)readingHistoryStateInfoWithRangeStart:(id)a3 rangeEnd:(id)a4 currentTime:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  objc_msgSend_serviceProxy(self, v14, v15, v16, v17, v18, v19, v20);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryReadingHistoryStateInfoWithRangeStart_rangeEnd_currentTime_withCompletion_(v24, v21, (uint64_t)v13, (uint64_t)v12, (uint64_t)v11, (uint64_t)v10, v22, v23);
}

- (void)serviceStatusInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryServiceStatusInfoWithCompletion_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (void)backupWithName:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_serviceProxy(self, v8, v9, v10, v11, v12, v13, v14);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryBackupWithName_completion_(v20, v15, (uint64_t)v7, (uint64_t)v6, v16, v17, v18, v19);
}

- (void)listBackupWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8, v9, v10, v11);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryListBackupWithCompletion_(v18, v12, (uint64_t)v4, v13, v14, v15, v16, v17);
}

- (void)restoreWithName:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_serviceProxy(self, v8, v9, v10, v11, v12, v13, v14);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingHistoryRestoreWithName_completion_(v20, v15, (uint64_t)v7, (uint64_t)v6, v16, v17, v18, v19);
}

- (BDSServiceProtocol)serviceProxy
{
  return self->_serviceProxy;
}

- (void).cxx_destruct
{
}

@end