@interface CPSStorePurchaseResponse
+ (BOOL)supportsSecureCoding;
- (AMSDelegatePurchaseResult)purchaseResult;
- (CPSStorePurchaseResponse)initWithCoder:(id)a3;
- (CPSStorePurchaseResponse)initWithPurchaseResult:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPSStorePurchaseResponse

- (CPSStorePurchaseResponse)initWithPurchaseResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPSStorePurchaseResponse;
  v6 = [(CPSStorePurchaseResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_purchaseResult, a3);
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_purchaseResult withName:@"purchaseResult"];
  id v5 = [v3 build];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSStorePurchaseResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPSStorePurchaseResponse;
  id v5 = [(CPSStorePurchaseResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:getAMSDelegatePurchaseResultClass() forKey:@"purchaseResult"];
    purchaseResult = v5->_purchaseResult;
    v5->_purchaseResult = (AMSDelegatePurchaseResult *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (AMSDelegatePurchaseResult)purchaseResult
{
  return self->_purchaseResult;
}

- (void).cxx_destruct
{
}

@end