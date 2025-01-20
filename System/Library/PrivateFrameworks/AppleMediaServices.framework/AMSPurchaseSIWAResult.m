@interface AMSPurchaseSIWAResult
+ (BOOL)supportsSecureCoding;
- (AMSPurchaseResult)purchaseResult;
- (AMSPurchaseSIWAAuthorizationResult)authorizationResult;
- (AMSPurchaseSIWAResult)initWithCoder:(id)a3;
- (AMSPurchaseSIWAResult)initWithPurchaseResult:(id)a3 authorizationResult:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPurchaseSIWAResult:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSPurchaseSIWAResult

- (AMSPurchaseSIWAResult)initWithPurchaseResult:(id)a3 authorizationResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSPurchaseSIWAResult;
  v9 = [(AMSPurchaseSIWAResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authorizationResult, a4);
    objc_storeStrong((id *)&v10->_purchaseResult, a3);
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(AMSPurchaseSIWAResult *)self purchaseResult];
  uint64_t v4 = [v3 hash];
  v5 = [(AMSPurchaseSIWAResult *)self authorizationResult];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AMSPurchaseSIWAResult *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(AMSPurchaseSIWAResult *)self isEqualToPurchaseSIWAResult:v4];
  }

  return v5;
}

- (BOOL)isEqualToPurchaseSIWAResult:(id)a3
{
  id v7 = a3;
  id v8 = [(AMSPurchaseSIWAResult *)self authorizationResult];
  if (!v8)
  {
    v3 = [v7 authorizationResult];
    if (!v3)
    {
      int v9 = 0;
LABEL_7:
      v11 = [(AMSPurchaseSIWAResult *)self purchaseResult];
      objc_super v12 = [v7 purchaseResult];
      char v10 = [v11 isEqualToPurchaseResult:v12];

      if (!v9) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  uint64_t v4 = [(AMSPurchaseSIWAResult *)self authorizationResult];
  BOOL v5 = [v7 authorizationResult];
  if ([v4 isEqual:v5])
  {
    int v9 = 1;
    goto LABEL_7;
  }
  char v10 = 0;
LABEL_8:

LABEL_9:
  if (!v8) {

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(AMSPurchaseSIWAResult);
  BOOL v5 = [(AMSPurchaseSIWAResult *)self authorizationResult];
  uint64_t v6 = [v5 copy];
  authorizationResult = v4->_authorizationResult;
  v4->_authorizationResult = (AMSPurchaseSIWAAuthorizationResult *)v6;

  id v8 = [(AMSPurchaseSIWAResult *)self purchaseResult];
  uint64_t v9 = [v8 copy];
  purchaseResult = v4->_purchaseResult;
  v4->_purchaseResult = (AMSPurchaseResult *)v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AMSPurchaseSIWAResult *)self authorizationResult];
  [v4 encodeObject:v5 forKey:@"authorizationResult"];

  id v6 = [(AMSPurchaseSIWAResult *)self purchaseResult];
  [v4 encodeObject:v6 forKey:@"purchaseResult"];
}

- (AMSPurchaseSIWAResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSPurchaseSIWAResult;
  BOOL v5 = [(AMSPurchaseSIWAResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationResult"];
    authorizationResult = v5->_authorizationResult;
    v5->_authorizationResult = (AMSPurchaseSIWAAuthorizationResult *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchaseResult"];
    purchaseResult = v5->_purchaseResult;
    v5->_purchaseResult = (AMSPurchaseResult *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSPurchaseResult)purchaseResult
{
  return self->_purchaseResult;
}

- (AMSPurchaseSIWAAuthorizationResult)authorizationResult
{
  return self->_authorizationResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationResult, 0);
  objc_storeStrong((id *)&self->_purchaseResult, 0);
}

@end