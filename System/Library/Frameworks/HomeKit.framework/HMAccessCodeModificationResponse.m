@interface HMAccessCodeModificationResponse
+ (id)responseWithValue:(id)a3 accessory:(id)a4;
- (HMAccessCodeModificationResponse)initWithAccessory:(id)a3 accessoryAccessCode:(id)a4 accessCodeValue:(id)a5 operationType:(int64_t)a6 error:(id)a7;
- (HMAccessCodeValue)accessCodeValue;
- (HMAccessory)accessory;
- (HMAccessoryAccessCode)accessoryAccessCode;
- (NSError)error;
- (int64_t)operationType;
- (void)setAccessCodeValue:(id)a3;
- (void)setAccessoryAccessCode:(id)a3;
- (void)setError:(id)a3;
@end

@implementation HMAccessCodeModificationResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_accessCodeValue, 0);
  objc_storeStrong((id *)&self->_accessoryAccessCode, 0);

  objc_storeStrong((id *)&self->_accessory, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (void)setAccessCodeValue:(id)a3
{
}

- (HMAccessCodeValue)accessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccessoryAccessCode:(id)a3
{
}

- (HMAccessoryAccessCode)accessoryAccessCode
{
  return (HMAccessoryAccessCode *)objc_getProperty(self, a2, 16, 1);
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessCodeModificationResponse)initWithAccessory:(id)a3 accessoryAccessCode:(id)a4 accessCodeValue:(id)a5 operationType:(int64_t)a6 error:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (v13)
  {
    v17 = v16;
    v27.receiver = self;
    v27.super_class = (Class)HMAccessCodeModificationResponse;
    v18 = [(HMAccessCodeModificationResponse *)&v27 init];
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_accessory, a3);
      objc_storeStrong((id *)&v19->_accessoryAccessCode, a4);
      uint64_t v20 = [v15 copy];
      accessCodeValue = v19->_accessCodeValue;
      v19->_accessCodeValue = (HMAccessCodeValue *)v20;

      v19->_operationType = a6;
      objc_storeStrong((id *)&v19->_error, a7);
    }

    return v19;
  }
  else
  {
    v23 = (void *)_HMFPreconditionFailure();
    return (HMAccessCodeModificationResponse *)+[HMAccessCodeModificationResponse responseWithValue:v25 accessory:v26];
  }
}

+ (id)responseWithValue:(id)a3 accessory:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 accessoryAccessCodeValue];
  v8 = +[HMAccessoryAccessCode accessoryAccessCodeWithValue:v7 accessory:v5];

  v9 = [HMAccessCodeModificationResponse alloc];
  v10 = [v6 accessCodeValue];
  uint64_t v11 = [v6 operationType];
  v12 = [v6 error];

  id v13 = [(HMAccessCodeModificationResponse *)v9 initWithAccessory:v5 accessoryAccessCode:v8 accessCodeValue:v10 operationType:v11 error:v12];

  return v13;
}

@end