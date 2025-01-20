@interface HMAccessCodeRemoveRequest
- (HMAccessCodeRemoveRequest)initWithAccessoryAccessCode:(id)a3;
- (HMAccessoryAccessCode)accessoryAccessCode;
- (id)createAccessCodeRemoveRequestValue;
@end

@implementation HMAccessCodeRemoveRequest

- (void).cxx_destruct
{
}

- (HMAccessoryAccessCode)accessoryAccessCode
{
  return (HMAccessoryAccessCode *)objc_getProperty(self, a2, 8, 1);
}

- (id)createAccessCodeRemoveRequestValue
{
  v3 = [HMAccessCodeRemoveRequestValue alloc];
  v4 = [(HMAccessCodeRemoveRequest *)self accessoryAccessCode];
  v5 = [v4 createAccessoryAccessCodeValue];
  v6 = [(HMAccessCodeRemoveRequestValue *)v3 initWithAccessoryAccessCodeValue:v5];

  return v6;
}

- (HMAccessCodeRemoveRequest)initWithAccessoryAccessCode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMAccessCodeRemoveRequest;
  v6 = [(HMAccessCodeRemoveRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accessoryAccessCode, a3);
  }

  return v7;
}

@end