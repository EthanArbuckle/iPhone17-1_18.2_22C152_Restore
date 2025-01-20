@interface HKWristDetectionSettingDataSource
- (HKWristDetectionSettingDataSource)initWithWristDetectionSettingManager:(id)a3;
- (HKWristDetectionSettingManager)wristDetectionSettingManager;
- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4;
- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4;
@end

@implementation HKWristDetectionSettingDataSource

- (HKWristDetectionSettingDataSource)initWithWristDetectionSettingManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKWristDetectionSettingDataSource;
  v6 = [(HKObserverBridge *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wristDetectionSettingManager, a3);
  }

  return v7;
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v5 = a4;
  v6 = [[_HKWristDetectionSettingManagerObserverBridge alloc] initWithHandle:v5];

  [(HKWristDetectionSettingManager *)self->_wristDetectionSettingManager registerObserver:v6];

  return v6;
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
}

- (HKWristDetectionSettingManager)wristDetectionSettingManager
{
  return self->_wristDetectionSettingManager;
}

- (void).cxx_destruct
{
}

@end