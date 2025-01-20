@interface AMSDelegatePurchaseResult
+ (BOOL)supportsSecureCoding;
- (AMSDelegatePurchaseRequest)request;
- (AMSDelegatePurchaseResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation AMSDelegatePurchaseResult

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSDelegatePurchaseResult;
  id v4 = a3;
  [(AMSDelegateAuthenticateResult *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_request, @"rp", v5.receiver, v5.super_class);
}

- (AMSDelegatePurchaseResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDelegatePurchaseResult;
  objc_super v5 = [(AMSDelegateAuthenticateResult *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rp"];
    request = v5->_request;
    v5->_request = (AMSDelegatePurchaseRequest *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSDelegatePurchaseRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end