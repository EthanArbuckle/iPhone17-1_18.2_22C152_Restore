@interface EMMessageDeliveryResult
+ (BOOL)supportsSecureCoding;
- (EMMessageDeliveryResult)initWithCoder:(id)a3;
- (EMMessageDeliveryResult)initWithStatus:(int64_t)a3 error:(id)a4;
- (NSError)error;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMMessageDeliveryResult

- (EMMessageDeliveryResult)initWithStatus:(int64_t)a3 error:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EMMessageDeliveryResult;
  v8 = [(EMMessageDeliveryResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_status = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageDeliveryResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"EFPropertyKey_status"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_error"];
  id v7 = [(EMMessageDeliveryResult *)self initWithStatus:v5 error:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[EMMessageDeliveryResult status](self, "status"), @"EFPropertyKey_status");
  id v4 = [(EMMessageDeliveryResult *)self error];
  [v5 encodeObject:v4 forKey:@"EFPropertyKey_error"];
}

- (int64_t)status
{
  return self->_status;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end