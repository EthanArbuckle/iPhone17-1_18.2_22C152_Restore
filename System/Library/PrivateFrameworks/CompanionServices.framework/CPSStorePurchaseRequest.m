@interface CPSStorePurchaseRequest
+ (BOOL)supportsSecureCoding;
- (ACAccount)account;
- (AMSDelegatePurchaseRequest)purchaseRequest;
- (CPSStorePurchaseRequest)initWithCoder:(id)a3;
- (id)description;
- (int64_t)authType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccount:(id)a3;
- (void)setPurchaseRequest:(id)a3;
@end

@implementation CPSStorePurchaseRequest

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_purchaseRequest withName:@"purchaseRequest"];
  id v5 = (id)[v3 appendObject:self->_account withName:@"account"];
  v6 = [v3 build];

  return v6;
}

- (int64_t)authType
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSStorePurchaseRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPSStorePurchaseRequest;
  id v5 = [(CPSAuthenticationRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:getAMSDelegatePurchaseRequestClass() forKey:@"purchaseRequest"];
    purchaseRequest = v5->_purchaseRequest;
    v5->_purchaseRequest = (AMSDelegatePurchaseRequest *)v6;

    v8 = self;
    uint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"account"];
    account = v5->_account;
    v5->_account = (ACAccount *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPSStorePurchaseRequest;
  id v4 = a3;
  [(CPSAuthenticationRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_purchaseRequest, @"purchaseRequest", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_account forKey:@"account"];
}

- (AMSDelegatePurchaseRequest)purchaseRequest
{
  return self->_purchaseRequest;
}

- (void)setPurchaseRequest:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_purchaseRequest, 0);
}

@end