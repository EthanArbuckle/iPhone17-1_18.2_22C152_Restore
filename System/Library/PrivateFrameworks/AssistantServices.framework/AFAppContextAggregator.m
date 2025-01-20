@interface AFAppContextAggregator
- (void)aggregateContextForAppWithBundleIdentifier:(id)a3 contextProvider:(id)a4 completionHandler:(id)a5;
- (void)aggregateContextForAppWithBundleIdentifier:(id)a3 contextProvider:(id)a4 deliveryHandler:(id)a5 completionHandler:(id)a6;
- (void)aggregateContextWithRawOutputForAppWithBundleIdentifier:(id)a3 contextProvider:(id)a4 deliveryHandler:(id)a5 completionHandler:(id)a6;
@end

@implementation AFAppContextAggregator

- (void)aggregateContextForAppWithBundleIdentifier:(id)a3 contextProvider:(id)a4 completionHandler:(id)a5
{
}

- (void)aggregateContextForAppWithBundleIdentifier:(id)a3 contextProvider:(id)a4 deliveryHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __119__AFAppContextAggregator_aggregateContextForAppWithBundleIdentifier_contextProvider_deliveryHandler_completionHandler___block_invoke;
  v12[3] = &unk_1E592B228;
  id v13 = v10;
  id v11 = v10;
  [(AFAppContextAggregator *)self aggregateContextWithRawOutputForAppWithBundleIdentifier:a3 contextProvider:a4 deliveryHandler:a5 completionHandler:v12];
}

uint64_t __119__AFAppContextAggregator_aggregateContextForAppWithBundleIdentifier_contextProvider_deliveryHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)aggregateContextWithRawOutputForAppWithBundleIdentifier:(id)a3 contextProvider:(id)a4 deliveryHandler:(id)a5 completionHandler:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[AFAppContextAggregator aggregateContextWithRawOutputForAppWithBundleIdentifier:contextProvider:deliveryHandl"
          "er:completionHandler:]";
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s Asking for context for %@", buf, 0x16u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __132__AFAppContextAggregator_aggregateContextWithRawOutputForAppWithBundleIdentifier_contextProvider_deliveryHandler_completionHandler___block_invoke;
  v16[3] = &unk_1E592B200;
  id v17 = v9;
  id v18 = v12;
  id v14 = v12;
  id v15 = v9;
  [v10 getAppContextWithDeliveryHandler:v11 completionHandler:v16];
}

void __132__AFAppContextAggregator_aggregateContextWithRawOutputForAppWithBundleIdentifier_contextProvider_deliveryHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v15 = "-[AFAppContextAggregator aggregateContextWithRawOutputForAppWithBundleIdentifier:contextProvider:deliveryHandl"
          "er:completionHandler:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Got context for %@", buf, 0x16u);
  }
  v6 = [v3 _aceValue];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F96540]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F96A80]);
  [v9 setBundleId:*(void *)(a1 + 32)];
  [v8 setAppIdentifyingInfo:v9];
  id v10 = [v8 dictionary];
  [v7 addObject:v10];

  if ([v6 count]) {
    [v7 addObjectsFromArray:v6];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F96A00]);
  id v13 = v7;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  [v11 setOrderedContext:v12];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end