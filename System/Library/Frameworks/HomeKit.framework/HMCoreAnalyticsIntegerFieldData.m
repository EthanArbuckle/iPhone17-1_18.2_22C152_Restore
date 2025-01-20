@interface HMCoreAnalyticsIntegerFieldData
- (HMCoreAnalyticsIntegerFieldData)initWithName:(id)a3 integerValue:(int64_t)a4;
@end

@implementation HMCoreAnalyticsIntegerFieldData

- (HMCoreAnalyticsIntegerFieldData)initWithName:(id)a3 integerValue:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = [NSNumber numberWithInteger:a4];
    v13.receiver = self;
    v13.super_class = (Class)HMCoreAnalyticsIntegerFieldData;
    v9 = [(HMCoreAnalyticsFieldData *)&v13 initWithName:v7 value:v8];

    return v9;
  }
  else
  {
    v11 = (HMHome *)_HMFPreconditionFailure();
    [(HMHome *)v11 .cxx_destruct];
  }
  return result;
}

@end