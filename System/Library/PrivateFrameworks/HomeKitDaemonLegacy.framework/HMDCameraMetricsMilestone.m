@interface HMDCameraMetricsMilestone
- (HMDCameraMetricsMilestone)initWithKey:(id)a3 timestamp:(int64_t)a4;
- (NSString)key;
- (id)attributeDescriptions;
- (int64_t)timestamp;
@end

@implementation HMDCameraMetricsMilestone

- (void).cxx_destruct
{
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDCameraMetricsMilestone *)self key];
  v5 = (void *)[v3 initWithName:@"key" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCameraMetricsMilestone timestamp](self, "timestamp"));
  v8 = (void *)[v6 initWithName:@"timestamp" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDCameraMetricsMilestone)initWithKey:(id)a3 timestamp:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCameraMetricsMilestone;
  v8 = [(HMDCameraMetricsMilestone *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_key, a3);
    v9->_timestamp = a4;
  }

  return v9;
}

@end