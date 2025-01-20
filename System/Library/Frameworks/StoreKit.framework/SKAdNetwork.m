@interface SKAdNetwork
+ (void)endImpression:(SKAdImpression *)impression completionHandler:(void *)completion;
+ (void)registerAppForAdNetworkAttribution;
+ (void)startImpression:(SKAdImpression *)impression completionHandler:(void *)completion;
+ (void)updateConversionValue:(NSInteger)conversionValue;
+ (void)updatePostbackConversionValue:(NSInteger)conversionValue completionHandler:(void *)completion;
+ (void)updatePostbackConversionValue:(NSInteger)fineValue coarseValue:(SKAdNetworkCoarseConversionValue)coarseValue completionHandler:(void *)completion;
+ (void)updatePostbackConversionValue:(NSInteger)fineValue coarseValue:(SKAdNetworkCoarseConversionValue)coarseValue lockWindow:(BOOL)lockWindow completionHandler:(void *)completion;
@end

@implementation SKAdNetwork

+ (void)startImpression:(SKAdImpression *)impression completionHandler:(void *)completion
{
  v6 = completion;
  v7 = impression;
  v8 = objc_opt_new();
  v9 = [(SKAdImpression *)v7 sourceAppStoreItemIdentifier];
  [v8 setObject:v9 forKeyedSubscript:0x1F08A8DC0];

  v10 = [(SKAdImpression *)v7 advertisedAppStoreItemIdentifier];
  [v8 setObject:v10 forKeyedSubscript:0x1F08A8DE0];

  v11 = [(SKAdImpression *)v7 adNetworkIdentifier];
  [v8 setObject:v11 forKeyedSubscript:0x1F08A8E00];

  v12 = [(SKAdImpression *)v7 adCampaignIdentifier];
  [v8 setObject:v12 forKeyedSubscript:0x1F08A8E20];

  v13 = [(SKAdImpression *)v7 sourceIdentifier];
  [v8 setObject:v13 forKeyedSubscript:0x1F08A8E40];

  v14 = [(SKAdImpression *)v7 adImpressionIdentifier];
  [v8 setObject:v14 forKeyedSubscript:0x1F08A8E60];

  v15 = [(SKAdImpression *)v7 signature];
  [v8 setObject:v15 forKeyedSubscript:0x1F08A8E80];

  v16 = [(SKAdImpression *)v7 version];
  [v8 setObject:v16 forKeyedSubscript:0x1F08A8EA0];

  v17 = [(SKAdImpression *)v7 timestamp];

  [v8 setObject:v17 forKeyedSubscript:0x1F08A8EC0];
  [v8 setObject:&unk_1F08C0DA8 forKeyedSubscript:0x1F08A8EE0];
  v18 = +[SKServiceBroker defaultBroker];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __49__SKAdNetwork_startImpression_completionHandler___block_invoke;
  v29[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v29[4] = a1;
  v19 = [v18 storeKitSynchronousServiceWithErrorHandler:v29];

  v20 = _SKAdNetworkGetImpressionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SKAdNetwork_startImpression_completionHandler___block_invoke_34;
  block[3] = &unk_1E5FAA060;
  id v25 = v19;
  id v26 = v8;
  id v27 = v6;
  id v28 = a1;
  id v21 = v6;
  id v22 = v8;
  id v23 = v19;
  dispatch_async(v20, block);
}

void __49__SKAdNetwork_startImpression_completionHandler___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __49__SKAdNetwork_startImpression_completionHandler___block_invoke_cold_1();
  }
}

void __49__SKAdNetwork_startImpression_completionHandler___block_invoke_34(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SKAdNetwork_startImpression_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5FAA038;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v6 = v4;
  [v1 startAdImpressionWithConfig:v2 completionHandler:v5];
}

void __49__SKAdNetwork_startImpression_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _SKANErrorFromNSError((void *)a2);
  if (a2 | v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __49__SKAdNetwork_startImpression_completionHandler___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Started view-through impression", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v4);
  }
}

+ (void)endImpression:(SKAdImpression *)impression completionHandler:(void *)completion
{
  uint64_t v6 = completion;
  int v7 = impression;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [(SKAdImpression *)v7 sourceAppStoreItemIdentifier];
  [v8 setObject:v9 forKeyedSubscript:0x1F08A8DC0];

  v10 = [(SKAdImpression *)v7 advertisedAppStoreItemIdentifier];
  [v8 setObject:v10 forKeyedSubscript:0x1F08A8DE0];

  v11 = [(SKAdImpression *)v7 adNetworkIdentifier];
  [v8 setObject:v11 forKeyedSubscript:0x1F08A8E00];

  v12 = [(SKAdImpression *)v7 adCampaignIdentifier];
  [v8 setObject:v12 forKeyedSubscript:0x1F08A8E20];

  v13 = [(SKAdImpression *)v7 sourceIdentifier];
  [v8 setObject:v13 forKeyedSubscript:0x1F08A8E40];

  v14 = [(SKAdImpression *)v7 adImpressionIdentifier];
  [v8 setObject:v14 forKeyedSubscript:0x1F08A8E60];

  v15 = [(SKAdImpression *)v7 signature];
  [v8 setObject:v15 forKeyedSubscript:0x1F08A8E80];

  v16 = [(SKAdImpression *)v7 version];
  [v8 setObject:v16 forKeyedSubscript:0x1F08A8EA0];

  v17 = [(SKAdImpression *)v7 timestamp];

  [v8 setObject:v17 forKeyedSubscript:0x1F08A8EC0];
  [v8 setObject:&unk_1F08C0DA8 forKeyedSubscript:0x1F08A8EE0];
  v18 = +[SKServiceBroker defaultBroker];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __47__SKAdNetwork_endImpression_completionHandler___block_invoke;
  v29[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v29[4] = a1;
  v19 = [v18 storeKitSynchronousServiceWithErrorHandler:v29];

  v20 = _SKAdNetworkGetImpressionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SKAdNetwork_endImpression_completionHandler___block_invoke_36;
  block[3] = &unk_1E5FAA060;
  id v25 = v19;
  id v26 = v8;
  id v27 = v6;
  id v28 = a1;
  id v21 = v6;
  id v22 = v8;
  id v23 = v19;
  dispatch_async(v20, block);
}

void __47__SKAdNetwork_endImpression_completionHandler___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __47__SKAdNetwork_endImpression_completionHandler___block_invoke_cold_1();
  }
}

void __47__SKAdNetwork_endImpression_completionHandler___block_invoke_36(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SKAdNetwork_endImpression_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5FAA038;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v6 = v4;
  [v1 endAdImpressionWithConfig:v2 completionHandler:v5];
}

void __47__SKAdNetwork_endImpression_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _SKANErrorFromNSError((void *)a2);
  if (a2 | v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __47__SKAdNetwork_endImpression_completionHandler___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Ended view-through impression", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v4);
  }
}

+ (void)registerAppForAdNetworkAttribution
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SKAdNetwork_registerAppForAdNetworkAttribution__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (registerAppForAdNetworkAttribution_onceToken != -1) {
    dispatch_once(&registerAppForAdNetworkAttribution_onceToken, block);
  }
}

void __49__SKAdNetwork_registerAppForAdNetworkAttribution__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[SKServiceBroker defaultBroker];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SKAdNetwork_registerAppForAdNetworkAttribution__block_invoke_2;
  v4[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v4[4] = *(void *)(a1 + 32);
  id v3 = [v2 storeKitServiceWithErrorHandler:v4];

  [v3 registerForInstallAttribution];
}

void __49__SKAdNetwork_registerAppForAdNetworkAttribution__block_invoke_2()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __49__SKAdNetwork_registerAppForAdNetworkAttribution__block_invoke_2_cold_1();
  }
}

+ (void)updateConversionValue:(NSInteger)conversionValue
{
  uint64_t v5 = +[SKServiceBroker defaultBroker];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__SKAdNetwork_updateConversionValue___block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v8[4] = a1;
  uint64_t v6 = [v5 storeKitServiceWithErrorHandler:v8];

  int v7 = [NSNumber numberWithInteger:conversionValue];
  [v6 updateConversionValue:v7];
}

void __37__SKAdNetwork_updateConversionValue___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __37__SKAdNetwork_updateConversionValue___block_invoke_cold_1();
  }
}

+ (void)updatePostbackConversionValue:(NSInteger)conversionValue completionHandler:(void *)completion
{
  uint64_t v6 = completion;
  int v7 = +[SKServiceBroker defaultBroker];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke;
  v17[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v17[4] = a1;
  uint64_t v8 = [v7 storeKitSynchronousServiceWithErrorHandler:v17];

  uint64_t v9 = _SKAdNetworkGetImpressionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_39;
  block[3] = &unk_1E5FAA088;
  NSInteger v15 = conversionValue;
  id v16 = a1;
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  dispatch_async(v9, block);
}

void __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __37__SKAdNetwork_updateConversionValue___block_invoke_cold_1();
  }
}

void __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_39(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5FAA038;
  uint64_t v6 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  [v2 updateConversionValue:v3 completionHandler:v4];
}

void __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = _SKANErrorFromNSError((void *)a2);
  if (a2 | v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_2_cold_1();
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
  }
}

+ (void)updatePostbackConversionValue:(NSInteger)fineValue coarseValue:(SKAdNetworkCoarseConversionValue)coarseValue completionHandler:(void *)completion
{
  uint64_t v8 = coarseValue;
  uint64_t v9 = completion;
  id v10 = +[SKServiceBroker defaultBroker];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__SKAdNetwork_updatePostbackConversionValue_coarseValue_completionHandler___block_invoke;
  v22[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v22[4] = a1;
  id v11 = [v10 storeKitSynchronousServiceWithErrorHandler:v22];

  v12 = _SKAdNetworkGetImpressionQueue();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__SKAdNetwork_updatePostbackConversionValue_coarseValue_completionHandler___block_invoke_40;
  v16[3] = &unk_1E5FAA0B0;
  id v17 = v11;
  v18 = v8;
  NSInteger v20 = fineValue;
  id v21 = a1;
  id v19 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  dispatch_async(v12, v16);
}

void __75__SKAdNetwork_updatePostbackConversionValue_coarseValue_completionHandler___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __37__SKAdNetwork_updateConversionValue___block_invoke_cold_1();
  }
}

void __75__SKAdNetwork_updatePostbackConversionValue_coarseValue_completionHandler___block_invoke_40(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__SKAdNetwork_updatePostbackConversionValue_coarseValue_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5FAA038;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 updateConversionValue:v3 coarseValue:v4 completionHandler:v5];
}

void __75__SKAdNetwork_updatePostbackConversionValue_coarseValue_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = _SKANErrorFromNSError((void *)a2);
  if (a2 | v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_2_cold_1();
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
  }
}

+ (void)updatePostbackConversionValue:(NSInteger)fineValue coarseValue:(SKAdNetworkCoarseConversionValue)coarseValue lockWindow:(BOOL)lockWindow completionHandler:(void *)completion
{
  id v10 = coarseValue;
  id v11 = completion;
  v12 = +[SKServiceBroker defaultBroker];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __86__SKAdNetwork_updatePostbackConversionValue_coarseValue_lockWindow_completionHandler___block_invoke;
  v25[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v25[4] = a1;
  id v13 = [v12 storeKitSynchronousServiceWithErrorHandler:v25];

  id v14 = _SKAdNetworkGetImpressionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__SKAdNetwork_updatePostbackConversionValue_coarseValue_lockWindow_completionHandler___block_invoke_41;
  block[3] = &unk_1E5FAA0D8;
  id v19 = v13;
  NSInteger v20 = v10;
  BOOL v24 = lockWindow;
  NSInteger v22 = fineValue;
  id v23 = a1;
  id v21 = v11;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  dispatch_async(v14, block);
}

void __86__SKAdNetwork_updatePostbackConversionValue_coarseValue_lockWindow_completionHandler___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __37__SKAdNetwork_updateConversionValue___block_invoke_cold_1();
  }
}

void __86__SKAdNetwork_updatePostbackConversionValue_coarseValue_lockWindow_completionHandler___block_invoke_41(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__SKAdNetwork_updatePostbackConversionValue_coarseValue_lockWindow_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5FAA038;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v2 updateConversionValue:v3 coarseValue:v5 lockWindow:v4 completionHandler:v6];
}

void __86__SKAdNetwork_updatePostbackConversionValue_coarseValue_lockWindow_completionHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = _SKANErrorFromNSError((void *)a2);
  if (a2 | v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_2_cold_1();
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
  }
}

void __49__SKAdNetwork_startImpression_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while starting view-through impression: %{public}@", v1, v2, v3, v4, v5);
}

void __49__SKAdNetwork_startImpression_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while starting view-through impression: %{public}@", v1, v2, v3, v4, v5);
}

void __47__SKAdNetwork_endImpression_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while ending view-through impression: %{public}@", v1, v2, v3, v4, v5);
}

void __47__SKAdNetwork_endImpression_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while ending\a view-through impression: %{public}@", v1, v2, v3, v4, v5);
}

void __49__SKAdNetwork_registerAppForAdNetworkAttribution__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while registering SKAdNetwork: %{public}@", v1, v2, v3, v4, v5);
}

void __37__SKAdNetwork_updateConversionValue___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error in remote proxy while updating SKAdNetwork conversion value: %{public}@", v1, v2, v3, v4, v5);
}

void __63__SKAdNetwork_updatePostbackConversionValue_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "%{public}@: Error while updating conversion value: %{public}@", v1, v2, v3, v4, v5);
}

@end