@interface AMSNetworkQualityInquiry
+ (AMSNetworkQualityInquiry)sharedInstance;
+ (BOOL)isEntitled;
+ (NSDictionary)lastConnectionReport;
+ (id)reportForTaskTimingData:(id)a3 fromReports:(id)a4;
+ (void)updateLastConnectionReportWithTask:(id)a3;
- (AMSNetworkQualityInquiry)init;
- (BOOL)areKnownNetworksReady;
- (NSMutableArray)knownNetworksReadyHandlers;
- (NSMutableSet)knownNetworks;
- (NWNetworkOfInterestManager)manager;
- (OS_dispatch_queue)queue;
- (id)investigateNetworks;
- (void)dealloc;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)didStopTrackingNOI:(id)a3;
- (void)drainKnownNetworksReadyHandlers;
- (void)performWhenKnownNetworksReady:(id)a3;
- (void)setKnownNetworksReadyHandlers:(id)a3;
@end

@implementation AMSNetworkQualityInquiry

void __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke_56(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSince1970];
  *(void *)(*(void *)(a1 + 32) + 16) = (uint64_t)(v3 * 1000.0);

  [*(id *)(*(void *)(a1 + 32) + 24) finishWithResult:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;
}

uint64_t __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

uint64_t __64__AMSNetworkQualityInquiry_reportForTaskTimingData_fromReports___block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 objectForKeyedSubscript:@"interface"];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (void)updateLastConnectionReportWithTask:(id)a3
{
  id v4 = a3;
  v5 = [a1 sharedInstance];

  if (v5)
  {
    v6 = [v4 _timingData];
    v7 = [a1 sharedInstance];
    v8 = [v7 investigateNetworks];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__AMSNetworkQualityInquiry_updateLastConnectionReportWithTask___block_invoke;
    v10[3] = &unk_1E55A4EA8;
    id v11 = v6;
    id v12 = a1;
    id v9 = v6;
    [v8 addFinishBlock:v10];
  }
}

+ (AMSNetworkQualityInquiry)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AMSNetworkQualityInquiry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB38DE98 != -1) {
    dispatch_once(&qword_1EB38DE98, block);
  }
  v2 = (void *)_MergedGlobals_136;
  return (AMSNetworkQualityInquiry *)v2;
}

- (id)investigateNetworks
{
  double v3 = objc_alloc_init(AMSMutablePromise);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke;
  v8[3] = &unk_1E55A4E58;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(AMSNetworkQualityInquiry *)self performWhenKnownNetworksReady:v8];
  v5 = v9;
  v6 = v4;

  return v6;
}

- (void)drainKnownNetworksReadyHandlers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v3 = [(AMSNetworkQualityInquiry *)self queue];
  dispatch_assert_queue_V2(v3);

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(AMSNetworkQualityInquiry *)self knownNetworksReadyHandlers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(AMSNetworkQualityInquiry *)self setKnownNetworksReadyHandlers:0];
}

void __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  double v3 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v3)
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke_2;
    v33[3] = &unk_1E55A3370;
    id v34 = *(id *)(a1 + 40);
    [v3 addFinishBlock:v33];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSince1970];
    double v6 = v5;

    uint64_t v7 = *(void *)(a1 + 32);
    if (*(void *)(v7 + 8) && (uint64_t)(v6 * 1000.0) - *(void *)(v7 + 16) <= 999)
    {
      objc_msgSend(*(id *)(a1 + 40), "finishWithResult:");
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v9 = [v23 knownNetworks];
      uint64_t v10 = [v9 count];

      long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id obj = [v23 knownNetworks];
      uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            v17 = objc_alloc_init(AMSMutablePromise);
            [v8 addObject:v17];
            v18 = [v23 manager];
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke_3;
            v26[3] = &unk_1E55A4AB8;
            v26[4] = v16;
            id v27 = v11;
            v28 = v17;
            v19 = v17;
            [v18 auditableLinkQualityForNOI:v16 reply:v26];
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
        }
        while (v13);
      }

      v20 = +[AMSPromise promiseWithAll:v8];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke_56;
      v24[3] = &unk_1E55A4E30;
      v24[4] = *(void *)(a1 + 32);
      id v25 = v11;
      id v21 = v11;
      [v20 addFinishBlock:v24];
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    }
  }
}

- (NWNetworkOfInterestManager)manager
{
  return self->_manager;
}

- (void)didStartTrackingNOI:(id)a3
{
  id v4 = a3;
  double v5 = [(AMSNetworkQualityInquiry *)self knownNetworks];
  [v5 addObject:v4];

  if ([(AMSNetworkQualityInquiry *)self areKnownNetworksReady])
  {
    [(AMSNetworkQualityInquiry *)self drainKnownNetworksReadyHandlers];
  }
}

void __58__AMSNetworkQualityInquiry_performWhenKnownNetworksReady___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) areKnownNetworksReady])
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    double v3 = [*(id *)(a1 + 32) knownNetworksReadyHandlers];

    if (!v3)
    {
      id v4 = *(void **)(a1 + 32);
      double v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      [v4 setKnownNetworksReadyHandlers:v5];
    }
    id v8 = [*(id *)(a1 + 32) knownNetworksReadyHandlers];
    double v6 = (void *)[*(id *)(a1 + 40) copy];
    uint64_t v7 = _Block_copy(v6);
    [v8 addObject:v7];
  }
}

- (void)performWhenKnownNetworksReady:(id)a3
{
  id v4 = a3;
  double v5 = [(AMSNetworkQualityInquiry *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__AMSNetworkQualityInquiry_performWhenKnownNetworksReady___block_invoke;
  v7[3] = &unk_1E559EAE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)areKnownNetworksReady
{
  double v3 = [(AMSNetworkQualityInquiry *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(AMSNetworkQualityInquiry *)self knownNetworks];
  LOBYTE(v3) = [v4 count] == 3;

  return (char)v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableSet)knownNetworks
{
  return self->_knownNetworks;
}

- (NSMutableArray)knownNetworksReadyHandlers
{
  return self->_knownNetworksReadyHandlers;
}

- (void)setKnownNetworksReadyHandlers:(id)a3
{
}

void __47__AMSNetworkQualityInquiry_investigateNetworks__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = v5;
  if (v8 && (uint64_t v9 = [v7 interface], (unint64_t)(v9 - 1) <= 2))
  {
    uint64_t v10 = off_1E55A4EC8[v9 - 1];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)v17 = MEMORY[0x1E4F143A8];
    *(void *)&v17[8] = 3221225472;
    *(void *)&v17[16] = __AMSNetworkQualityInquiryReportMake_block_invoke;
    v18 = &unk_1E559F9D8;
    id v12 = v11;
    id v19 = v12;
    [v8 enumerateKeysAndObjectsUsingBlock:v17];
    if (objc_msgSend(v12, "count", *(void *)v17, *(void *)&v17[8], *(void *)&v17[16], v18))
    {
      [v12 setObject:v10 forKeyedSubscript:@"interface"];
      uint64_t v13 = (void *)[v12 copy];
    }
    else
    {
      uint64_t v13 = 0;
    }

    if (v13)
    {
      [*(id *)(a1 + 40) addObject:v13];
    }
  }
  else
  {
  }
  if (v6)
  {
    uint64_t v14 = +[AMSLogConfig sharedConfig];
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)v17 = 138543618;
      *(void *)&v17[4] = v16;
      *(_WORD *)&v17[12] = 2112;
      *(void *)&v17[14] = v6;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "Could not determine link quality for %{public}@, reason: %@", v17, 0x16u);
    }
  }
  [*(id *)(a1 + 48) finishWithResult:MEMORY[0x1E4F1CC38]];
}

uint64_t __63__AMSNetworkQualityInquiry_updateLastConnectionReportWithTask___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    id v4 = [*(id *)(result + 40) reportForTaskTimingData:*(void *)(result + 32) fromReports:a2];
    if (v4)
    {
      id v6 = v4;
      objc_storeStrong((id *)&kLastConnectionReport, v4);
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"AMSLastConnectionReportChangedNotification" object:v6];
    }
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (id)reportForTaskTimingData:(id)a3 fromReports:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 objectForKeyedSubscript:@"_kCFNTimingDataConnectionInterfaceIdentifier"];
  uint64_t v7 = (void *)v6;
  id v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F38BF8]) initWithInterfaceName:v6];
    uint64_t v10 = [v9 type];
    if ((unint64_t)(v10 - 1) > 2)
    {
      id v8 = 0;
    }
    else
    {
      id v11 = off_1E55A4EC8[v10 - 1];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64__AMSNetworkQualityInquiry_reportForTaskTimingData_fromReports___block_invoke;
      v13[3] = &unk_1E55A4E80;
      uint64_t v14 = v11;
      id v8 = objc_msgSend(v5, "ams_firstObjectPassingTest:", v13);
    }
  }

  return v8;
}

void __42__AMSNetworkQualityInquiry_sharedInstance__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = objc_alloc_init(AMSNetworkQualityInquiry);
  v1 = (void *)_MergedGlobals_136;
  _MergedGlobals_136 = (uint64_t)v0;

  if (!_MergedGlobals_136)
  {
    v2 = +[AMSLogConfig sharedConfig];
    if (!v2)
    {
      v2 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v3 = [v2 OSLogObject];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = (id)objc_opt_class();
      id v4 = v6;
      _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: The network quality inquiry failed to initialize.", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (AMSNetworkQualityInquiry)init
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (+[AMSNetworkQualityInquiry isEntitled])
  {
    v15.receiver = self;
    v15.super_class = (Class)AMSNetworkQualityInquiry;
    uint64_t v3 = [(AMSNetworkQualityInquiry *)&v15 init];
    if (v3)
    {
      id v4 = (NWNetworkOfInterestManager *)objc_alloc_init(MEMORY[0x1E4FA91C8]);
      manager = v3->_manager;
      v3->_manager = v4;

      if (!v3->_manager)
      {
        uint64_t v13 = 0;
        goto LABEL_11;
      }
      dispatch_queue_t v6 = dispatch_queue_create("com.apple.AppleMediaServices.NetworkQualityInquiry.queue", 0);
      queue = v3->_queue;
      v3->_queue = (OS_dispatch_queue *)v6;

      [(NWNetworkOfInterestManager *)v3->_manager setQueue:v3->_queue];
      [(NWNetworkOfInterestManager *)v3->_manager setDelegate:v3];
      id v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      knownNetworks = v3->_knownNetworks;
      v3->_knownNetworks = v8;

      [(NWNetworkOfInterestManager *)v3->_manager trackNOIAnyForInterfaceType:2 options:0];
      [(NWNetworkOfInterestManager *)v3->_manager trackNOIAnyForInterfaceType:1 options:0];
      [(NWNetworkOfInterestManager *)v3->_manager trackNOIAnyForInterfaceType:3 options:0];
    }
  }
  else
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = (id)objc_opt_class();
      id v12 = v17;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Missing entitlements to perform network quality inquiry.", buf, 0xCu);
    }
    uint64_t v3 = 0;
  }
  uint64_t v3 = v3;
  uint64_t v13 = v3;
LABEL_11:

  return v13;
}

+ (BOOL)isEntitled
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = [&unk_1EDD019C0 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v2) {
    return 1;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)v15;
  char v5 = 1;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v15 != v4) {
        objc_enumerationMutation(&unk_1EDD019C0);
      }
      CFStringRef v7 = *(const __CFString **)(*((void *)&v14 + 1) + 8 * i);
      id v8 = SecTaskCreateFromSelf(0);
      if (v8)
      {
        uint64_t v9 = v8;
        CFErrorRef error = 0;
        CFTypeRef v10 = SecTaskCopyValueForEntitlement(v8, v7, &error);
        if (error) {
          CFRelease(error);
        }
        BOOL v11 = v10 != 0;
        if (v10) {
          CFRelease(v10);
        }
        CFRelease(v9);
      }
      else
      {
        BOOL v11 = 0;
      }
      v5 &= v11;
    }
    uint64_t v3 = [&unk_1EDD019C0 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v3);
  return v5;
}

- (void)dealloc
{
  [(NWNetworkOfInterestManager *)self->_manager setDelegate:0];
  [(NWNetworkOfInterestManager *)self->_manager destroy];
  v3.receiver = self;
  v3.super_class = (Class)AMSNetworkQualityInquiry;
  [(AMSNetworkQualityInquiry *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownNetworksReadyHandlers, 0);
  objc_storeStrong((id *)&self->_knownNetworks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_currentInvestigation, 0);
  objc_storeStrong((id *)&self->_lastKnownReports, 0);
}

+ (NSDictionary)lastConnectionReport
{
  objc_super v3 = [a1 sharedInstance];

  if (v3)
  {
    uint64_t v9 = 0;
    CFTypeRef v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__52;
    uint64_t v13 = __Block_byref_object_dispose__52;
    id v14 = 0;
    uint64_t v4 = [a1 sharedInstance];
    char v5 = [v4 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__AMSNetworkQualityInquiry_lastConnectionReport__block_invoke;
    block[3] = &unk_1E559EC70;
    block[4] = &v9;
    dispatch_sync(v5, block);

    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v6 = 0;
  }
  return (NSDictionary *)v6;
}

void __48__AMSNetworkQualityInquiry_lastConnectionReport__block_invoke(uint64_t a1)
{
}

- (void)didStopTrackingNOI:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(AMSNetworkQualityInquiry *)self knownNetworks];
  [v5 removeObject:v4];

  id v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  CFStringRef v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138543618;
    CFTypeRef v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: Stopped tracking %@, searching for interface again", (uint8_t *)&v9, 0x16u);
  }

  id v8 = [(AMSNetworkQualityInquiry *)self manager];
  objc_msgSend(v8, "trackNOIAnyForInterfaceType:options:", objc_msgSend(v4, "interface"), 0);
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(AMSNetworkQualityInquiry *)self didStopTrackingNOI:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

@end