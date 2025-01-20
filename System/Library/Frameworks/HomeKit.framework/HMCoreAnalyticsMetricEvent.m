@interface HMCoreAnalyticsMetricEvent
- (HMCoreAnalyticsMetricEvent)initWithName:(id)a3;
- (NSError)error;
- (NSString)name;
- (id)eventPayload;
- (void)setError:(id)a3;
@end

@implementation HMCoreAnalyticsMetricEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)eventPayload
{
  v24[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 bundleIdentifier];

  if (!v4)
  {
    v5 = [MEMORY[0x1E4F65540] processInfo];
    v4 = [v5 applicationIdentifier];
  }
  v6 = @"unknown";
  if (v4) {
    v6 = v4;
  }
  v7 = v6;

  v8 = [(HMCoreAnalyticsMetricEvent *)self error];
  v9 = [[HMCoreAnalyticsStringFieldData alloc] initWithName:@"bundleIdentifier" stringValue:v7];

  if (v8)
  {
    v10 = -[HMCoreAnalyticsIntegerFieldData initWithName:integerValue:]([HMCoreAnalyticsIntegerFieldData alloc], "initWithName:integerValue:", @"eventErrorCode", objc_msgSend(v8, "code", v8));
    v11 = [HMCoreAnalyticsStringFieldData alloc];
    v12 = [v8 domain];
    v13 = [(HMCoreAnalyticsStringFieldData *)v11 initWithName:@"eventErrorDomain" stringValue:v12];
  }
  else
  {
    v10 = [[HMCoreAnalyticsFieldData alloc] initWithName:@"eventErrorCode", 0];
    v13 = [[HMCoreAnalyticsFieldData alloc] initWithName:@"eventErrorDomain"];
  }
  v14 = [(HMCoreAnalyticsFieldData *)v10 name];
  v23[0] = v14;
  v15 = [(HMCoreAnalyticsFieldData *)v10 value];
  v24[0] = v15;
  v16 = [(HMCoreAnalyticsFieldData *)v13 name];
  v23[1] = v16;
  v17 = [(HMCoreAnalyticsFieldData *)v13 value];
  v24[1] = v17;
  v18 = [(HMCoreAnalyticsFieldData *)v9 name];
  v23[2] = v18;
  v19 = [(HMCoreAnalyticsFieldData *)v9 value];
  v24[2] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

  return v20;
}

- (HMCoreAnalyticsMetricEvent)initWithName:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMCoreAnalyticsMetricEvent;
    v7 = [(HMCoreAnalyticsMetricEvent *)&v12 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_name, a3);
    }

    return v8;
  }
  else
  {
    v10 = (_HMCameraAudioControl *)_HMFPreconditionFailure();
    return (HMCoreAnalyticsMetricEvent *)[(_HMCameraAudioControl *)v10 volume];
  }
}

@end