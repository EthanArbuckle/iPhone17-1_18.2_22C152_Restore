@interface HKDarwinNotificationDataSource
- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4;
- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4;
@end

@implementation HKDarwinNotificationDataSource

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int out_token = 0;
  id v7 = v5;
  v8 = (const char *)[v7 UTF8String];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __78__HKDarwinNotificationDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke;
  handler[3] = &unk_1E58C8368;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  notify_register_dispatch(v8, &out_token, MEMORY[0x1E4F14428], handler);
  v11 = [NSNumber numberWithInt:out_token];

  return v11;
}

void __78__HKDarwinNotificationDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1CA98] null];
  [v1 notifyObserversOfChangeForKey:v2 newValue:v3];
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = [v5 intValue];
    if (v6 != -1) {
      notify_cancel(v6);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v7 = HKLogInfrastructure();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[HKDarwinNotificationDataSource unregisterBridgedObserver:forKey:]((uint64_t)self, (uint64_t)v5, v7);
    }
  }
}

- (void)unregisterBridgedObserver:(NSObject *)a3 forKey:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = objc_opt_class();
  id v5 = v4;
  int v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138543618;
  id v9 = v4;
  __int16 v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_19C023000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot unregister observer of type %{public}@", (uint8_t *)&v8, 0x16u);
}

@end