@interface HMCoreAnalyticsFieldData
- (HMCoreAnalyticsFieldData)initWithName:(id)a3;
- (HMCoreAnalyticsFieldData)initWithName:(id)a3 value:(id)a4;
- (NSObject)value;
- (NSString)name;
@end

@implementation HMCoreAnalyticsFieldData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSObject)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMCoreAnalyticsFieldData)initWithName:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMCoreAnalyticsFieldData *)_HMFPreconditionFailure();
    return [(HMCoreAnalyticsFieldData *)v13 initWithName:v15];
  }
  v16.receiver = self;
  v16.super_class = (Class)HMCoreAnalyticsFieldData;
  v10 = [(HMCoreAnalyticsFieldData *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    objc_storeStrong((id *)&v11->_value, a4);
  }

  return v11;
}

- (HMCoreAnalyticsFieldData)initWithName:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA98];
  id v5 = a3;
  v6 = [v4 null];
  id v7 = [(HMCoreAnalyticsFieldData *)self initWithName:v5 value:v6];

  return v7;
}

@end