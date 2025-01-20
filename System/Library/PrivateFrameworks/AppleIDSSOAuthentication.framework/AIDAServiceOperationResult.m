@interface AIDAServiceOperationResult
+ (BOOL)supportsSecureCoding;
- (AIDAServiceOperationResult)initWithCoder:(id)a3;
- (AIDAServiceOperationResult)initWithSuccess:(BOOL)a3 error:(id)a4 type:(id)a5;
- (BOOL)success;
- (NSError)error;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AIDAServiceOperationResult

- (AIDAServiceOperationResult)initWithSuccess:(BOOL)a3 error:(id)a4 type:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AIDAServiceOperationResult;
  v11 = [(AIDAServiceOperationResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_error, a4);
    v12->_success = a3;
    objc_storeStrong((id *)&v12->_type, a5);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [(NSError *)self->_error copy];
  v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  *(unsigned char *)(v4 + 8) = self->_success;
  uint64_t v7 = [(NSString *)self->_type copy];
  v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL success = self->_success;
  id v5 = a3;
  [v5 encodeBool:success forKey:@"_success"];
  [v5 encodeObject:self->_error forKey:@"_error"];
  [v5 encodeObject:self->_type forKey:@"_type"];
}

- (AIDAServiceOperationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AIDAServiceOperationResult *)self init];
  if (v5)
  {
    v5->_BOOL success = [v4 decodeBoolForKey:@"_success"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_type"];
    type = v5->_type;
    v5->_type = (NSString *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(AIDAServiceOperationResult *)self type];
  if ([(AIDAServiceOperationResult *)self success]) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  uint64_t v6 = [(AIDAServiceOperationResult *)self error];
  uint64_t v7 = [v3 stringWithFormat:@"TYPE: %@, SUCCESS: %@, ERROR: %@", v4, v5, v6];

  return v7;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end