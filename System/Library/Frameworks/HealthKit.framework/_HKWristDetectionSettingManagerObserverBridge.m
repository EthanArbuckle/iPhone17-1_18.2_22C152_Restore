@interface _HKWristDetectionSettingManagerObserverBridge
- (HKObserverBridgeHandle)handle;
- (_HKWristDetectionSettingManagerObserverBridge)initWithHandle:(id)a3;
- (void)wristDetectionSettingManagerDidObserveWristDetectChange:(id)a3;
@end

@implementation _HKWristDetectionSettingManagerObserverBridge

- (_HKWristDetectionSettingManagerObserverBridge)initWithHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKWristDetectionSettingManagerObserverBridge;
  v6 = [(_HKWristDetectionSettingManagerObserverBridge *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_handle, a3);
  }

  return v7;
}

- (void)wristDetectionSettingManagerDidObserveWristDetectChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = (id)objc_opt_class();
    id v6 = v13;
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Observed change in wrist detection setting, notifying observers", (uint8_t *)&v12, 0xCu);
  }
  handle = self->_handle;
  v8 = [MEMORY[0x1E4F1CA98] null];
  objc_super v9 = NSNumber;
  uint64_t v10 = [v4 isWristDetectEnabled];

  v11 = [v9 numberWithBool:v10];
  [(HKObserverBridgeHandle *)handle notifyObserversOfChangeForKey:v8 newValue:v11];
}

- (HKObserverBridgeHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
}

@end