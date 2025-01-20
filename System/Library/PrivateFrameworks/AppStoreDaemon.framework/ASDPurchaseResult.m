@interface ASDPurchaseResult
+ (BOOL)supportsSecureCoding;
- (ASDPurchaseResult)initWithCoder:(id)a3;
- (ASDPurchaseResult)initWithSuccess:(BOOL)a3 error:(id)a4;
- (BOOL)success;
- (NSError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDPurchaseResult

- (ASDPurchaseResult)initWithSuccess:(BOOL)a3 error:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASDPurchaseResult;
  v8 = [(ASDPurchaseResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_success = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [(NSError *)self->_error copyWithZone:a3];
  id v7 = (void *)v5[2];
  v5[2] = v6;

  *((unsigned char *)v5 + 8) = self->_success;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurchaseResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDPurchaseResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v5->_success = [v4 decodeBoolForKey:@"success"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  error = self->_error;
  if (error)
  {
    v5 = ASDErrorWithSafeUserInfo(error);
    [v6 encodeObject:v5 forKey:@"error"];
  }
  [v6 encodeBool:self->_success forKey:@"success"];
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end