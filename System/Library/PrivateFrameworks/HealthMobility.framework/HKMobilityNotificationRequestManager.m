@interface HKMobilityNotificationRequestManager
+ (void)postWalkingSteadinessNotificationWithHealthStore:(id)a3 category:(id)a4 completion:(id)a5;
@end

@implementation HKMobilityNotificationRequestManager

+ (void)postWalkingSteadinessNotificationWithHealthStore:(id)a3 category:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E4F2B068];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 alloc];
  v12 = (void *)[v11 initWithFeatureIdentifier:*MEMORY[0x1E4F29DD8] healthStore:v7 countryCodeSource:0];
  id v22 = 0;
  v13 = [v12 featureStatusWithError:&v22];
  id v14 = v22;
  if (v13)
  {
    v15 = [v13 objectForKeyedSubscript:@"WalkingSteadinessShouldNotShowPregnancyContent"];
    uint64_t v16 = [v15 areAllRequirementsSatisfied];
  }
  else
  {
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x1E4F29F78];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      uint64_t v19 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v19;
      __int16 v25 = 2114;
      id v26 = v14;
      _os_log_impl(&dword_1E0B16000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Unable to get featureStatus. error: %{public}@", buf, 0x16u);
    }
    uint64_t v16 = 1;
  }
  v20 = objc_msgSend(MEMORY[0x1E4F44628], "hkmobility_requestForCategory:shouldHidePregnancyContent:", v10, v16);

  v21 = (void *)[objc_alloc(MEMORY[0x1E4F2B280]) initWithHealthStore:v7];
  [v21 postNotificationWithRequest:v20 completion:v9];
}

@end