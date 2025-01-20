@interface HMAccessCodeUpdateRequest
- (HMAccessCodeUpdateRequest)initWithAccessoryAccessCode:(id)a3 updatedAccessCodeValue:(id)a4;
- (HMAccessCodeValue)updatedAccessCodeValue;
- (HMAccessoryAccessCode)accessoryAccessCode;
- (id)createAccessCodeUpdateRequestValue;
@end

@implementation HMAccessCodeUpdateRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedAccessCodeValue, 0);

  objc_storeStrong((id *)&self->_accessoryAccessCode, 0);
}

- (HMAccessCodeValue)updatedAccessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 16, 1);
}

- (HMAccessoryAccessCode)accessoryAccessCode
{
  return (HMAccessoryAccessCode *)objc_getProperty(self, a2, 8, 1);
}

- (id)createAccessCodeUpdateRequestValue
{
  v3 = [HMAccessCodeUpdateRequestValue alloc];
  v4 = [(HMAccessCodeUpdateRequest *)self accessoryAccessCode];
  v5 = [v4 createAccessoryAccessCodeValue];
  v6 = [(HMAccessCodeUpdateRequest *)self updatedAccessCodeValue];
  v7 = [(HMAccessCodeUpdateRequestValue *)v3 initWithAccessoryAccessCodeValue:v5 updatedAccessCodeValue:v6];

  return v7;
}

- (HMAccessCodeUpdateRequest)initWithAccessoryAccessCode:(id)a3 updatedAccessCodeValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMAccessCodeUpdateRequest;
  v9 = [(HMAccessCodeUpdateRequest *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryAccessCode, a3);
    uint64_t v11 = [v8 copy];
    updatedAccessCodeValue = v10->_updatedAccessCodeValue;
    v10->_updatedAccessCodeValue = (HMAccessCodeValue *)v11;
  }
  return v10;
}

@end