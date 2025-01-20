@interface IPFeatureManager
+ (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4;
+ (void)scanEventsInMessageUnits:(id)a3 completionHandler:(id)a4;
+ (void)scanEventsInMessageUnits:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5;
+ (void)setEventStoreForTesting:(id)a3;
@end

@implementation IPFeatureManager

+ (void)scanEventsInMessageUnits:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  v9 = objc_alloc_init(IPFeatureMailScanner);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__IPFeatureManager_scanEventsInMessageUnits_synchronously_completionHandler___block_invoke;
  v11[3] = &unk_264722D98;
  id v12 = v7;
  id v10 = v7;
  [(IPFeatureMailScanner *)v9 scanEventsInMessageUnits:v8 synchronously:v5 completionHandler:v11];
}

void __77__IPFeatureManager_scanEventsInMessageUnits_synchronously_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v4 = _IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    v4 = _IPLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = v4;
    v6 = +[IPFeatureScanner descriptionForScanResultType:a3];
    v7[0] = 67109378;
    v7[1] = a3;
    __int16 v8 = 2114;
    v9 = v6;
    _os_log_impl(&dword_225684000, v5, OS_LOG_TYPE_INFO, "Result Type: %d   [%{public}@] #FeatureManager", (uint8_t *)v7, 0x12u);
  }
}

+ (void)scanEventsInMessageUnits:(id)a3 completionHandler:(id)a4
{
}

+ (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(IPFeatureMailScanner);
  __int16 v8 = [(IPFeatureMailScanner *)v7 featuresForTextString:v6 inMessageUnit:v5];

  return v8;
}

+ (void)setEventStoreForTesting:(id)a3
{
}

@end