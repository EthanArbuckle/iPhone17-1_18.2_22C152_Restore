@interface SGXPCResponse
+ (BOOL)supportsSecureCoding;
+ (id)response;
+ (id)responseWithError:(id)a3;
- (NSError)error;
- (SGXPCResponse)initWithCoder:(id)a3;
- (SGXPCResponse)initWithError:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGXPCResponse

- (void).cxx_destruct
{
}

- (SGXPCResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SGXPCResponse;
  v5 = [(SGXPCResponse *)&v10 init];
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (SGXPCResponse)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGXPCResponse;
  v6 = [(SGXPCResponse *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

+ (id)responseWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithError:v4];

  return v5;
}

+ (id)response
{
  v2 = objc_opt_new();

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end