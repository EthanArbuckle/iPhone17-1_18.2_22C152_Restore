@interface HKBackgroundObservationExtension
- (HKBackgroundObservationExtension)init;
- (void)backgroundObservationExtensionTimeWillExpire;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)didReceiveUpdateForSampleType:(id)a3 completionHandler:(id)a4;
- (void)init;
@end

@implementation HKBackgroundObservationExtension

- (HKBackgroundObservationExtension)init
{
  v11.receiver = self;
  v11.super_class = (Class)HKBackgroundObservationExtension;
  v2 = [(HKBackgroundObservationExtension *)&v11 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v4, sel_beginRequestWithExtensionContext_);
    if (InstanceMethod != class_getInstanceMethod(v3, sel_beginRequestWithExtensionContext_))
    {
      _HKInitializeLogging();
      v6 = HKLogBackgroundUpdates;
      if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_ERROR)) {
        -[HKBackgroundObservationExtension init](v6);
      }
      v7 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v8 = *MEMORY[0x1E4F1C3A8];
      v9 = NSStringFromClass(v3);
      [v7 raise:v8, @"You have overridden 'beginRequestWithExtensionContext:' on your subclass (%@) - this is not allowed", v9 format];
    }
  }
  return v2;
}

- (void)didReceiveUpdateForSampleType:(id)a3 completionHandler:(id)a4
{
  v7 = (void (**)(void))a4;
  id v8 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"HKBackgroundObservationExtension.m" lineNumber:44 description:@"sample type should be of quantity type"];
  }
  _HKInitializeLogging();
  v10 = HKLogBackgroundUpdates;
  if (os_log_type_enabled((os_log_t)HKLogBackgroundUpdates, OS_LOG_TYPE_DEBUG)) {
    -[HKBackgroundObservationExtension didReceiveUpdateForSampleType:completionHandler:](v10);
  }
  v7[2](v7);
}

- (void)backgroundObservationExtensionTimeWillExpire
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19C023000, log, OS_LOG_TYPE_DEBUG, "HealthKit extension base class received backgroundObservationExtensionTimeWillExpire", v1, 2u);
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v8 = a3;
  v5 = (objc_class *)objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = NSStringFromClass(v5);
    [v6 handleFailureInMethod:a2, self, @"HKBackgroundObservationExtension.m", 57, @"remoteContext of type: %@ is not an instance of %@", v8, v7 object file lineNumber description];
  }
  [v8 setExtensionInstance:self];
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "HealthKit extension was initialized but the developer is hijacking 'beginRequestWithExtensionContext:'", v1, 2u);
}

- (void)didReceiveUpdateForSampleType:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19C023000, log, OS_LOG_TYPE_DEBUG, "HealthKit extension base class received didReceiveUpdateForSampleType:", v1, 2u);
}

@end