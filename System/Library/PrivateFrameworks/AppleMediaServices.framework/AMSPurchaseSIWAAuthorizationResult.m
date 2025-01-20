@interface AMSPurchaseSIWAAuthorizationResult
+ (BOOL)supportsSecureCoding;
- (AKAuthorization)authorization;
- (AKCredential)authorizationCredential;
- (AMSPurchaseSIWAAuthorizationResult)initWithAuthorization:(id)a3 error:(id)a4;
- (AMSPurchaseSIWAAuthorizationResult)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPurchaseSIWAAuthorizationResult:(id)a3;
- (NSError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthorization:(id)a3;
- (void)setError:(id)a3;
@end

@implementation AMSPurchaseSIWAAuthorizationResult

- (AMSPurchaseSIWAAuthorizationResult)initWithAuthorization:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSPurchaseSIWAAuthorizationResult;
  v9 = [(AMSPurchaseSIWAAuthorizationResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authorization, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(AMSPurchaseSIWAAuthorizationResult *)self authorization];
  uint64_t v4 = [v3 hash];
  v5 = [(AMSPurchaseSIWAAuthorizationResult *)self error];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AMSPurchaseSIWAAuthorizationResult *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(AMSPurchaseSIWAAuthorizationResult *)self isEqualToPurchaseSIWAAuthorizationResult:v4];
  }

  return v5;
}

- (BOOL)isEqualToPurchaseSIWAAuthorizationResult:(id)a3
{
  id v7 = a3;
  id v8 = [(AMSPurchaseSIWAAuthorizationResult *)self authorization];
  if (!v8)
  {
    v15 = [v7 authorization];
    if (!v15)
    {
      v15 = 0;
      int v9 = 0;
      goto LABEL_7;
    }
  }
  v3 = [(AMSPurchaseSIWAAuthorizationResult *)self authorization];
  uint64_t v4 = [v7 authorization];
  if ([v3 isEqual:v4])
  {
    int v9 = 1;
LABEL_7:
    v11 = [(AMSPurchaseSIWAAuthorizationResult *)self error];
    if (v11 || ([v7 error], (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_super v12 = [(AMSPurchaseSIWAAuthorizationResult *)self error];
      v13 = [v7 error];
      char v10 = [v12 isEqual:v13];

      if (v11) {
        goto LABEL_13;
      }
    }
    else
    {
      char v10 = 1;
    }

LABEL_13:
    if (!v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  char v10 = 0;
LABEL_14:

LABEL_15:
  if (!v8) {

  }
  return v10;
}

- (AKCredential)authorizationCredential
{
  v2 = [(AMSPurchaseSIWAAuthorizationResult *)self authorization];
  v3 = [v2 credential];

  return (AKCredential *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(AMSPurchaseSIWAAuthorizationResult);
  BOOL v5 = [(AMSPurchaseSIWAAuthorizationResult *)self error];
  uint64_t v6 = [v5 copy];
  error = v4->_error;
  v4->_error = (NSError *)v6;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AMSPurchaseSIWAAuthorizationResult *)self authorization];
  [v4 encodeObject:v5 forKey:@"authorizationCredential"];

  id v6 = [(AMSPurchaseSIWAAuthorizationResult *)self error];
  [v4 encodeObject:v6 forKey:@"authorizationError"];
}

- (AMSPurchaseSIWAAuthorizationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSPurchaseSIWAAuthorizationResult;
  BOOL v5 = [(AMSPurchaseSIWAAuthorizationResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationCredential"];
    authorization = v5->_authorization;
    v5->_authorization = (AKAuthorization *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationError"];
    error = v5->_error;
    v5->_error = (NSError *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (AKAuthorization)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end