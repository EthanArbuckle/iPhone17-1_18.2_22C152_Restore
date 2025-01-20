@interface AMSDelegatePurchaseRequest
+ (BOOL)supportsSecureCoding;
- (AMSDelegatePurchaseRequest)initWithCoder:(id)a3;
- (AMSDelegatePurchaseRequest)initWithPurchaseResult:(id)a3 challenge:(id)a4 userAgent:(id)a5;
- (AMSPurchaseResult)purchaseResult;
- (NSString)deviceName;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setPurchaseResult:(id)a3;
@end

@implementation AMSDelegatePurchaseRequest

- (AMSDelegatePurchaseRequest)initWithPurchaseResult:(id)a3 challenge:(id)a4 userAgent:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSDelegatePurchaseRequest;
  v10 = [(AMSDelegateAuthenticateRequest *)&v13 initWithChallenge:a4 userAgent:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_purchaseResult, a3);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMSDelegatePurchaseRequest;
  id v4 = a3;
  [(AMSDelegateAuthenticateRequest *)&v7 encodeWithCoder:v4];
  v5 = [(AMSDelegatePurchaseRequest *)self purchaseResult];
  [v4 encodeObject:v5 forKey:@"pr"];

  v6 = [(AMSDelegatePurchaseRequest *)self deviceName];
  [v4 encodeObject:v6 forKey:@"deviceName"];
}

- (AMSDelegatePurchaseRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSDelegatePurchaseRequest;
  v5 = [(AMSDelegateAuthenticateRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pr"];
    purchaseResult = v5->_purchaseResult;
    v5->_purchaseResult = (AMSPurchaseResult *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (AMSPurchaseResult)purchaseResult
{
  return self->_purchaseResult;
}

- (void)setPurchaseResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseResult, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end