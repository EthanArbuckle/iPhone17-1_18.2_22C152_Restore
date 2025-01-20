@interface DMFBeginTransactionRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (id)permittedPlatforms;
- (DMFBeginTransactionRequest)initWithCoder:(id)a3;
- (NSString)name;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
@end

@implementation DMFBeginTransactionRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1F18AB598;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFBeginTransactionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFBeginTransactionRequest;
  v5 = [(CATTaskRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFBeginTransactionRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(DMFBeginTransactionRequest *)self name];
  [v4 encodeObject:v5 forKey:@"name"];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end