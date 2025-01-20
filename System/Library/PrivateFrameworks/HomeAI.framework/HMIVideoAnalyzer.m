@interface HMIVideoAnalyzer
+ (id)allowedClasses;
+ (id)analyzerWithConfiguration:(id)a3 identifier:(id)a4 error:(id *)a5;
+ (id)analyzerWithConfiguration:(id)a3 identifier:(id)a4 remote:(BOOL)a5 error:(id *)a6;
+ (id)analyzerWithOptions:(id)a3 error:(id *)a4;
- (BOOL)encode;
- (BOOL)monitored;
- (HMIAnalysisStateManager)analysisStateManager;
- (HMIHomePersonManager)homePersonManager;
- (HMIVideoAnalyzer)initWithConfiguration:(id)a3 identifier:(id)a4;
- (HMIVideoAnalyzerConfiguration)configuration;
- (HMIVideoAnalyzerDelegate)delegate;
- (HMIVideoAnalyzerMutableReport)report;
- (HMIVideoAnalyzerState)state;
- (NSDictionary)options;
- (NSSet)externalPersonManagers;
- (NSUUID)identifier;
- (double)analysisFPS;
- (double)delay;
- (id)finalizeFragmentResult:(id)a3 homePersonManager:(id)a4 analysisStateManager:(id)a5;
- (id)logIdentifier;
- (unint64_t)status;
- (void)analyzeFragment:(id)a3 configuration:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)finish;
- (void)finishWithCompletionHandler:(id)a3;
- (void)flush;
- (void)flushAsync;
- (void)handleAssetData:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (void)handleMessageWithOptions:(id)a3 completionHandler:(id)a4;
- (void)setAnalysisFPS:(double)a3;
- (void)setAnalysisStateManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEncode:(BOOL)a3;
- (void)setExternalPersonManagers:(id)a3;
- (void)setHomePersonManager:(id)a3;
- (void)setMonitored:(BOOL)a3;
@end

@implementation HMIVideoAnalyzer

+ (id)allowedClasses
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:17];
  v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);

  return v4;
}

+ (id)analyzerWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"configuration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  if (!v9)
  {
    _HMFPreconditionFailure();
LABEL_13:
    uint64_t v15 = (void *)_HMFPreconditionFailure();
    return +[HMIVideoAnalyzer analyzerWithConfiguration:v17 identifier:v18 error:v19];
  }
  uint64_t v10 = [v6 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  if (!v12) {
    goto LABEL_13;
  }
  uint64_t v13 = [a1 analyzerWithConfiguration:v9 identifier:v12 remote:0 error:a4];

  return v13;
}

+ (id)analyzerWithConfiguration:(id)a3 identifier:(id)a4 error:(id *)a5
{
  return (id)[a1 analyzerWithConfiguration:a3 identifier:a4 remote:1 error:a5];
}

+ (id)analyzerWithConfiguration:(id)a3 identifier:(id)a4 remote:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void *)MEMORY[0x22A641C70]();
  id v12 = a1;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_INFO, "%{public}@Creating analyzer with identifier: %@, configuration: %@", buf, 0x20u);
  }
  if (v6)
  {
    uint64_t v15 = [[HMIVideoAnalyzerClient alloc] initWithConfiguration:v9 identifier:v10];
  }
  else
  {
    SEL v16 = +[HMIVideoAnalyzerScheduler sharedInstance];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __70__HMIVideoAnalyzer_analyzerWithConfiguration_identifier_remote_error___block_invoke;
    v18[3] = &unk_26477EC00;
    id v19 = v10;
    uint64_t v15 = [v16 analyzerWithConfiguration:v9 block:v18];
  }
  return v15;
}

HMIVideoAnalyzerServer *__70__HMIVideoAnalyzer_analyzerWithConfiguration_identifier_remote_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[HMIVideoAnalyzerServer alloc] initWithConfiguration:v3 identifier:*(void *)(a1 + 32)];

  return v4;
}

- (HMIVideoAnalyzer)initWithConfiguration:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMIVideoAnalyzer;
  id v9 = [(HMIVideoAnalyzer *)&v20 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
    if ([v7 saveAnalyzerResultsToDisk])
    {
      id v11 = objc_alloc_init(MEMORY[0x263F08790]);
      [v11 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
      id v12 = [MEMORY[0x263EFF910] now];
      uint64_t v13 = [v11 stringFromDate:v12];

      uint64_t v14 = NSString;
      uint64_t v15 = [v8 UUIDString];
      SEL v16 = [v14 stringWithFormat:@"VideoAnalyzerReport %@ %@", v13, v15];

      id v17 = [[HMIVideoAnalyzerMutableReport alloc] initWithName:v16];
      report = v10->_report;
      v10->_report = v17;
    }
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(HMIVideoAnalyzer *)self report];

  if (v3)
  {
    v4 = NSString;
    v5 = [(HMIVideoAnalyzer *)self report];
    BOOL v6 = [v5 name];
    id v7 = [v4 stringWithFormat:@"/tmp/%@.plist", v6];

    id v8 = [(HMIVideoAnalyzer *)self report];
    id v9 = [v8 data];
    [v9 writeToFile:v7 atomically:1];

    id v10 = (void *)MEMORY[0x22A641C70]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      SEL v16 = v13;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_INFO, "%{public}@VideoAnalyzerReport saved (%@)", buf, 0x16u);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)HMIVideoAnalyzer;
  [(HMIVideoAnalyzer *)&v14 dealloc];
}

- (void)handleAssetData:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263EFF940];
  uint64_t v12 = *MEMORY[0x263EFF498];
  uint64_t v13 = NSString;
  objc_super v14 = NSStringFromSelector(a2);
  uint64_t v15 = [v13 stringWithFormat:@"You must override %@ in a subclass", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (void)handleMessageWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263EFF940];
  uint64_t v9 = *MEMORY[0x263EFF498];
  id v10 = NSString;
  id v11 = NSStringFromSelector(a2);
  uint64_t v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (double)delay
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)analyzeFragment:(id)a3 configuration:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [a3 data];
  uint64_t v9 = @"configuration";
  v10[0] = v6;
  id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  [(HMIVideoAnalyzer *)self handleAssetData:v7 withOptions:v8 completionHandler:0];
}

- (void)flush
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)flushAsync
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)finish
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)cancel
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)setAnalysisFPS:(double)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = NSString;
  uint64_t v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)setMonitored:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = NSString;
  uint64_t v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)setEncode:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = NSString;
  uint64_t v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (BOOL)encode
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)monitored
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (double)analysisFPS
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)finalizeFragmentResult:(id)a3 homePersonManager:(id)a4 analysisStateManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = v10;
    uint64_t v12 = +[HMIPreference sharedInstance];
    int v13 = [v12 BOOLPreferenceForKey:@"uploadVideoAnalysisEvent" defaultValue:1];

    if (v9)
    {
      objc_super v14 = [v8 frameResults];
      uint64_t v15 = objc_msgSend(v14, "na_flatMap:", &__block_literal_global_40);

      id v16 = [MEMORY[0x263EFFA08] setWithArray:v15];
      [v9 handleNewFaceEvents:v16];

      if (v13)
      {
        uint64_t v26 = MEMORY[0x263EF8330];
        uint64_t v27 = 3221225472;
        v28 = __82__HMIVideoAnalyzer_finalizeFragmentResult_homePersonManager_analysisStateManager___block_invoke_3;
        v29 = &unk_26477EC28;
        id v30 = v9;
        v31 = self;
        objc_msgSend(v15, "na_each:", &v26);
      }
    }
    +[HMIAnalytics sendEventsForFragmentResult:](HMIAnalytics, "sendEventsForFragmentResult:", v8, v26, v27, v28, v29);
    __int16 v17 = [(HMIVideoAnalyzer *)self report];

    if (v17)
    {
      id v18 = [(HMIVideoAnalyzer *)self report];
      uint64_t v19 = [(HMIVideoAnalyzer *)self identifier];
      objc_super v20 = [v19 UUIDString];
      uint64_t v21 = [v20 substringToIndex:4];
      __int16 v22 = [(HMIVideoAnalyzer *)self identifier];
      id v23 = [v22 UUIDString];
      [v18 appendFragmentResult:v8 forKey:v21 source:v23 redactFrames:0];
    }
    return v8;
  }
  else
  {
    uint64_t v25 = _HMFPreconditionFailure();
    return (id)__82__HMIVideoAnalyzer_finalizeFragmentResult_homePersonManager_analysisStateManager___block_invoke(v25);
  }
}

id __82__HMIVideoAnalyzer_finalizeFragmentResult_homePersonManager_analysisStateManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 events];
  uint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_55_1);
  uint64_t v4 = [v3 allObjects];

  return v4;
}

id __82__HMIVideoAnalyzer_finalizeFragmentResult_homePersonManager_analysisStateManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 face];

    if (v6)
    {
      uint64_t v6 = [v5 face];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __82__HMIVideoAnalyzer_finalizeFragmentResult_homePersonManager_analysisStateManager___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 UUID];
  v5 = [*(id *)(a1 + 40) configuration];
  uint64_t v6 = [v5 camera];
  +[HMIAnalytics videoAnalyzerDidFindFaceEvent:v4 homePersonManagerUUID:v7 camera:v6];
}

- (id)logIdentifier
{
  id v2 = [(HMIVideoAnalyzer *)self identifier];
  uint64_t v3 = [v2 UUIDString];

  return v3;
}

- (HMIVideoAnalyzerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMIVideoAnalyzerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMIHomePersonManager)homePersonManager
{
  return (HMIHomePersonManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHomePersonManager:(id)a3
{
}

- (HMIAnalysisStateManager)analysisStateManager
{
  return (HMIAnalysisStateManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAnalysisStateManager:(id)a3
{
}

- (NSSet)externalPersonManagers
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExternalPersonManagers:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (HMIVideoAnalyzerConfiguration)configuration
{
  return (HMIVideoAnalyzerConfiguration *)objc_getProperty(self, a2, 64, 1);
}

- (HMIVideoAnalyzerState)state
{
  return (HMIVideoAnalyzerState *)objc_getProperty(self, a2, 72, 1);
}

- (HMIVideoAnalyzerMutableReport)report
{
  return (HMIVideoAnalyzerMutableReport *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_externalPersonManagers, 0);
  objc_storeStrong((id *)&self->_analysisStateManager, 0);
  objc_storeStrong((id *)&self->_homePersonManager, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end