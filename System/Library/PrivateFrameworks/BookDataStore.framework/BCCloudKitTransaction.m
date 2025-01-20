@interface BCCloudKitTransaction
+ (id)transactionNameForEntityName:(id)a3;
- (BCCloudKitTransaction)initWithEntityName:(id)a3 delegate:(id)a4;
- (BCCloudKitTransactionDelegate)delegate;
- (BDSOSTransaction)osTransaction;
- (BUCoalescingCallBlock)coalescedNotification;
- (NSString)entityName;
- (OS_dispatch_queue)lifecycleAccessQueue;
- (OS_dispatch_source)transactionLifetime;
- (double)coalescingDelay;
- (double)transactionLifetimeTimout;
- (id)transactionName;
- (int64_t)clientCount;
- (void)clientConnected;
- (void)laq_scheduleTransactionLifetime;
- (void)performWorkWithCompletion:(id)a3;
- (void)setClientCount:(int64_t)a3;
- (void)setCoalescedNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEntityName:(id)a3;
- (void)setLifecycleAccessQueue:(id)a3;
- (void)setOsTransaction:(id)a3;
- (void)setTransactionLifetime:(id)a3;
- (void)signal;
@end

@implementation BCCloudKitTransaction

- (BCCloudKitTransaction)initWithEntityName:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v102.receiver = self;
  v102.super_class = (Class)BCCloudKitTransaction;
  v15 = [(BCCloudKitTransaction *)&v102 init];
  if (v15)
  {
    uint64_t v16 = objc_msgSend_copy(v6, v8, v9, v10, v11, v12, v13, v14);
    entityName = v15->_entityName;
    v15->_entityName = (NSString *)v16;

    objc_storeWeak((id *)&v15->_delegate, v7);
    v18 = [BDSOSTransaction alloc];
    objc_msgSend_transactionName(v15, v19, v20, v21, v22, v23, v24, v25);
    id v26 = objc_claimAutoreleasedReturnValue();
    uint64_t v33 = objc_msgSend_cStringUsingEncoding_(v26, v27, 4, v28, v29, v30, v31, v32);
    uint64_t v40 = objc_msgSend_initWithTransactionName_(v18, v34, v33, v35, v36, v37, v38, v39);
    osTransaction = v15->_osTransaction;
    v15->_osTransaction = (BDSOSTransaction *)v40;

    v49 = objc_msgSend_transactionName(v15, v42, v43, v44, v45, v46, v47, v48);
    v56 = objc_msgSend_stringByAppendingString_(@"com.apple.iBooks.CloudKitTransaction.", v50, (uint64_t)v49, v51, v52, v53, v54, v55);

    id v57 = v56;
    v64 = (const char *)objc_msgSend_cStringUsingEncoding_(v57, v58, 4, v59, v60, v61, v62, v63);
    v65 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v66 = dispatch_queue_create(v64, v65);
    lifecycleAccessQueue = v15->_lifecycleAccessQueue;
    v15->_lifecycleAccessQueue = (OS_dispatch_queue *)v66;

    objc_initWeak(&location, v15);
    id v68 = objc_alloc(MEMORY[0x263F2BA50]);
    v99[0] = MEMORY[0x263EF8330];
    v99[1] = 3221225472;
    v99[2] = sub_2360EDAF0;
    v99[3] = &unk_264CA1608;
    objc_copyWeak(&v100, &location);
    v69 = NSString;
    v70 = (objc_class *)objc_opt_class();
    v71 = NSStringFromClass(v70);
    v78 = objc_msgSend_stringWithFormat_(v69, v72, @"_coalescedNotification in %@", v73, v74, v75, v76, v77, v71);
    uint64_t v82 = objc_msgSend_initWithNotifyBlock_notifyTimeout_blockDescription_notifyTimeoutBlock_(v68, v79, (uint64_t)v99, 10, (uint64_t)v78, (uint64_t)&unk_26E971C70, v80, v81);
    coalescedNotification = v15->_coalescedNotification;
    v15->_coalescedNotification = (BUCoalescingCallBlock *)v82;

    objc_msgSend_coalescingDelay(v15, v84, v85, v86, v87, v88, v89, v90);
    objc_msgSend_setCoalescingDelay_(v15->_coalescedNotification, v91, v92, v93, v94, v95, v96, v97);
    objc_destroyWeak(&v100);
    objc_destroyWeak(&location);
  }
  return v15;
}

+ (id)transactionNameForEntityName:(id)a3
{
  return (id)objc_msgSend_stringByAppendingString_(@"BCCloudKitTransaction-", a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (id)transactionName
{
  uint64_t v3 = objc_opt_class();
  uint64_t v11 = objc_msgSend_entityName(self, v4, v5, v6, v7, v8, v9, v10);
  v18 = objc_msgSend_transactionNameForEntityName_(v3, v12, (uint64_t)v11, v13, v14, v15, v16, v17);

  return v18;
}

- (void)performWorkWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(void))_Block_copy(a3);
  if (v3)
  {
    uint64_t v4 = v3;
    v3[2]();
    uint64_t v3 = v4;
  }
}

- (double)coalescingDelay
{
  return 1.0;
}

- (double)transactionLifetimeTimout
{
  return 5.0;
}

- (void)clientConnected
{
  uint64_t v9 = objc_msgSend_lifecycleAccessQueue(self, a2, v2, v3, v4, v5, v6, v7);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2360EDD7C;
  block[3] = &unk_264CA1428;
  block[4] = self;
  dispatch_async(v9, block);
}

- (void)signal
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend_shared(MEMORY[0x263F2BA58], a2, v2, v3, v4, v5, v6, v7);
  int v17 = objc_msgSend_verboseLoggingEnabled(v9, v10, v11, v12, v13, v14, v15, v16);

  if (v17)
  {
    v18 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = objc_msgSend_transactionName(self, v19, v20, v21, v22, v23, v24, v25);
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = v26;
      _os_log_impl(&dword_2360BC000, v18, OS_LOG_TYPE_DEFAULT, "\"\\\"Transaction signaling for %@\\\"\"", buf, 0xCu);
    }
  }
  objc_initWeak((id *)buf, self);
  v34 = objc_msgSend_coalescedNotification(self, v27, v28, v29, v30, v31, v32, v33);
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = sub_2360EDFB0;
  v41[3] = &unk_264CA1650;
  v41[4] = self;
  objc_copyWeak(&v42, (id *)buf);
  objc_msgSend_signalWithCompletion_(v34, v35, (uint64_t)v41, v36, v37, v38, v39, v40);

  objc_destroyWeak(&v42);
  objc_destroyWeak((id *)buf);
}

- (void)laq_scheduleTransactionLifetime
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend_transactionLifetime(self, a2, v2, v3, v4, v5, v6, v7);

  if (!v9)
  {
    int v17 = objc_msgSend_shared(MEMORY[0x263F2BA58], v10, v11, v12, v13, v14, v15, v16);
    int v25 = objc_msgSend_verboseLoggingEnabled(v17, v18, v19, v20, v21, v22, v23, v24);

    if (v25)
    {
      uint64_t v33 = BDSCloudKitDevelopmentLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v41 = objc_msgSend_transactionName(self, v34, v35, v36, v37, v38, v39, v40);
        *(_DWORD *)buf = 138412290;
        uint64_t v62 = v41;
        _os_log_impl(&dword_2360BC000, v33, OS_LOG_TYPE_DEFAULT, "\"\\\"Transaction scheduletransactionLifetime for %@\\\"\"", buf, 0xCu);
      }
    }
    id v42 = objc_msgSend_lifecycleAccessQueue(self, v26, v27, v28, v29, v30, v31, v32);
    uint64_t v43 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v42);

    dispatch_time_t v44 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v43, v44, 0xFFFFFFFFFFFFFFFFLL, 0xBEBC200uLL);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_2360EE42C;
    handler[3] = &unk_264CA1428;
    handler[4] = self;
    dispatch_source_set_event_handler(v43, handler);
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = sub_2360EE544;
    v59[3] = &unk_264CA1428;
    v59[4] = self;
    dispatch_source_set_cancel_handler(v43, v59);
    objc_msgSend_setTransactionLifetime_(self, v45, (uint64_t)v43, v46, v47, v48, v49, v50);
    v58 = objc_msgSend_transactionLifetime(self, v51, v52, v53, v54, v55, v56, v57);
    dispatch_resume(v58);
  }
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setEntityName:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedNotification
{
  return self->_coalescedNotification;
}

- (void)setCoalescedNotification:(id)a3
{
}

- (BDSOSTransaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
}

- (OS_dispatch_queue)lifecycleAccessQueue
{
  return self->_lifecycleAccessQueue;
}

- (void)setLifecycleAccessQueue:(id)a3
{
}

- (OS_dispatch_source)transactionLifetime
{
  return self->_transactionLifetime;
}

- (void)setTransactionLifetime:(id)a3
{
}

- (BCCloudKitTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BCCloudKitTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)clientCount
{
  return self->_clientCount;
}

- (void)setClientCount:(int64_t)a3
{
  self->_clientCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transactionLifetime, 0);
  objc_storeStrong((id *)&self->_lifecycleAccessQueue, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_coalescedNotification, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
}

@end