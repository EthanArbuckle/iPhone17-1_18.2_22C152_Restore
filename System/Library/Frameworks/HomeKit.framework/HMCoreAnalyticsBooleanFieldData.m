@interface HMCoreAnalyticsBooleanFieldData
- (HMCoreAnalyticsBooleanFieldData)initWithName:(id)a3 BOOLValue:(BOOL)a4;
@end

@implementation HMCoreAnalyticsBooleanFieldData

- (HMCoreAnalyticsBooleanFieldData)initWithName:(id)a3 BOOLValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = [NSNumber numberWithBool:v4];
    v13.receiver = self;
    v13.super_class = (Class)HMCoreAnalyticsBooleanFieldData;
    v9 = [(HMCoreAnalyticsFieldData *)&v13 initWithName:v7 value:v8];

    return v9;
  }
  else
  {
    v11 = (HMAccessCodeManager *)_HMFPreconditionFailure();
    [(HMAccessCodeManager *)v11 .cxx_destruct];
  }
  return result;
}

@end