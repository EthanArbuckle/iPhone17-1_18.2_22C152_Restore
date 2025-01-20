@interface HMDAccessorySettingsControllerDependencyFactory
- (id)createMessageHandlerWithQueue:(id)a3 delegate:(id)a4;
- (id)settingModelForUpdateWithIdentifier:(id)a3 parent:(id)a4 value:(id)a5 configNumber:(id)a6;
- (id)timerWithReason:(int64_t)a3 interval:(double)a4;
- (void)assertWithCondition:(BOOL)a3 message:(id)a4;
@end

@implementation HMDAccessorySettingsControllerDependencyFactory

- (void)assertWithCondition:(BOOL)a3 message:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!a3)
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: %@", buf, 0x16u);
    }
    v11 = [[HMDAssertionLogEvent alloc] initWithReason:@"%@", v6];
    v12 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v12 submitLogEvent:v11];
  }
}

- (id)createMessageHandlerWithQueue:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[HMDAccessorySettingsMessageHandler alloc] initWithQueue:v6 delegate:v5];

  return v7;
}

- (id)settingModelForUpdateWithIdentifier:(id)a3 parent:(id)a4 value:(id)a5 configNumber:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(HMDBackingStoreModelObject *)[HMDAccessorySettingModel alloc] initWithObjectChangeType:2 uuid:v12 parentUUID:v11];

  v14 = encodeRootObject();

  [(HMDAccessorySettingModel *)v13 setValue:v14];
  [(HMDAccessorySettingModel *)v13 setConfigurationVersion:v9];

  return v13;
}

- (id)timerWithReason:(int64_t)a3 interval:(double)a4
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:16 options:a4];
  return v4;
}

@end