@interface HMSoftwareUpdateProgress
+ (id)progressFromEvent:(id)a3;
- (HMSoftwareUpdateProgress)initWithPercentageComplete:(float)a3 estimatedTimeRemaining:(double)a4;
- (HMSoftwareUpdateProgress)initWithProtoPayload:(id)a3;
- (double)estimatedTimeRemaining;
- (float)percentageComplete;
- (id)protoPayload;
@end

@implementation HMSoftwareUpdateProgress

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (float)percentageComplete
{
  return self->_percentageComplete;
}

- (HMSoftwareUpdateProgress)initWithProtoPayload:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasPercentageComplete]
    && ([v4 hasEstimatedTimeRemaining] & 1) != 0)
  {
    [v4 percentageComplete];
    int v6 = v5;
    [v4 estimatedTimeRemaining];
    double v8 = v7;
    LODWORD(v7) = v6;
    v9 = [(HMSoftwareUpdateProgress *)self initWithPercentageComplete:v7 estimatedTimeRemaining:v8];
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      [v4 percentageComplete];
      double v15 = v14;
      [v4 estimatedTimeRemaining];
      int v18 = 138543874;
      v19 = v13;
      __int16 v20 = 2048;
      double v21 = v15;
      __int16 v22 = 2048;
      uint64_t v23 = v16;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@HMSoftwareUpdateEventProtoSoftwareUpdateProgress proto payload is missing data. percentageComplete: %f, estimatedTimeRemaining: %f", (uint8_t *)&v18, 0x20u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)protoPayload
{
  v3 = objc_alloc_init(HMSoftwareUpdateEventProtoSoftwareUpdateProgress);
  [(HMSoftwareUpdateProgress *)self percentageComplete];
  -[HMSoftwareUpdateEventProtoSoftwareUpdateProgress setPercentageComplete:](v3, "setPercentageComplete:");
  [(HMSoftwareUpdateProgress *)self estimatedTimeRemaining];
  -[HMSoftwareUpdateEventProtoSoftwareUpdateProgress setEstimatedTimeRemaining:](v3, "setEstimatedTimeRemaining:");

  return v3;
}

- (HMSoftwareUpdateProgress)initWithPercentageComplete:(float)a3 estimatedTimeRemaining:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMSoftwareUpdateProgress;
  result = [(HMSoftwareUpdateProgress *)&v7 init];
  if (result)
  {
    result->_percentageComplete = a3;
    result->_estimatedTimeRemaining = a4;
  }
  return result;
}

+ (id)progressFromEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [HMSoftwareUpdateEventProtoSoftwareUpdateProgress alloc];
  int v6 = [v4 encodedData];
  objc_super v7 = [(HMSoftwareUpdateEventProtoSoftwareUpdateProgress *)v5 initWithData:v6];

  if (v7)
  {
    double v8 = [[HMSoftwareUpdateProgress alloc] initWithProtoPayload:v7];
  }
  else
  {
    v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = a1;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v14 = 138543618;
      double v15 = v12;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HMSoftwareUpdateEventProtoSoftwareUpdateProgress from event: %@", (uint8_t *)&v14, 0x16u);
    }
    double v8 = 0;
  }

  return v8;
}

@end