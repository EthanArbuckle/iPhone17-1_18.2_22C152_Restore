@interface HMAccessoryAccessCodeFetchResponse
+ (id)responseWithValue:(id)a3 accessory:(id)a4;
- (HMAccessory)accessory;
- (HMAccessoryAccessCodeFetchResponse)initWithAccessory:(id)a3 accessoryAccessCodes:(id)a4 error:(id)a5;
- (NSArray)accessoryAccessCodes;
- (NSError)error;
- (void)setError:(id)a3;
@end

@implementation HMAccessoryAccessCodeFetchResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_accessoryAccessCodes, 0);

  objc_storeStrong((id *)&self->_accessory, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)accessoryAccessCodes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessoryAccessCodeFetchResponse)initWithAccessory:(id)a3 accessoryAccessCodes:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v12 = v11;
    v20.receiver = self;
    v20.super_class = (Class)HMAccessoryAccessCodeFetchResponse;
    v13 = [(HMAccessoryAccessCodeFetchResponse *)&v20 init];
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_accessory, a3);
      objc_storeStrong((id *)&v14->_accessoryAccessCodes, a4);
      objc_storeStrong((id *)&v14->_error, a5);
    }

    return v14;
  }
  else
  {
    v16 = (void *)_HMFPreconditionFailure();
    return (HMAccessoryAccessCodeFetchResponse *)+[HMAccessoryAccessCodeFetchResponse responseWithValue:v18 accessory:v19];
  }
}

+ (id)responseWithValue:(id)a3 accessory:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 accessoryAccessCodeValues];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__HMAccessoryAccessCodeFetchResponse_responseWithValue_accessory___block_invoke;
  v14[3] = &unk_1E5942BC0;
  id v15 = v5;
  id v8 = v5;
  id v9 = objc_msgSend(v7, "na_map:", v14);

  id v10 = [HMAccessoryAccessCodeFetchResponse alloc];
  id v11 = [v6 error];

  v12 = [(HMAccessoryAccessCodeFetchResponse *)v10 initWithAccessory:v8 accessoryAccessCodes:v9 error:v11];

  return v12;
}

HMAccessoryAccessCode *__66__HMAccessoryAccessCodeFetchResponse_responseWithValue_accessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [HMAccessoryAccessCode alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v3 accessCodeValue];
  v7 = [v3 uniqueIdentifier];
  uint64_t v8 = [v3 hasRestrictions];

  id v9 = [(HMAccessoryAccessCode *)v4 initWithAccessory:v5 accessCodeValue:v6 uniqueIdentifier:v7 hasRestrictions:v8];

  return v9;
}

@end