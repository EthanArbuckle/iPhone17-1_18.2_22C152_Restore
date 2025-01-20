@interface HMAccessCodeAddRequest
- (HMAccessCodeAddRequest)initWithAccessCodeValue:(id)a3 accessory:(id)a4;
- (HMAccessCodeValue)accessCodeValue;
- (HMAccessory)accessory;
- (id)createAccessCodeAddRequestValue;
@end

@implementation HMAccessCodeAddRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);

  objc_storeStrong((id *)&self->_accessCodeValue, 0);
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_getProperty(self, a2, 16, 1);
}

- (HMAccessCodeValue)accessCodeValue
{
  return (HMAccessCodeValue *)objc_getProperty(self, a2, 8, 1);
}

- (id)createAccessCodeAddRequestValue
{
  v3 = [HMAccessCodeAddRequestValue alloc];
  v4 = [(HMAccessCodeAddRequest *)self accessCodeValue];
  v5 = [(HMAccessCodeAddRequest *)self accessory];
  v6 = [v5 uuid];
  v7 = [(HMAccessCodeAddRequestValue *)v3 initWithAccessCodeValue:v4 accessoryUUID:v6];

  return v7;
}

- (HMAccessCodeAddRequest)initWithAccessCodeValue:(id)a3 accessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMAccessCodeAddRequest;
  v8 = [(HMAccessCodeAddRequest *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    accessCodeValue = v8->_accessCodeValue;
    v8->_accessCodeValue = (HMAccessCodeValue *)v9;

    objc_storeStrong((id *)&v8->_accessory, a4);
  }

  return v8;
}

@end