@interface SGXPCResponse1
+ (BOOL)supportsSecureCoding;
+ (id)responseWith:(id)a3;
+ (id)responseWithError:(id)a3;
- (NSSecureCoding)response1;
- (SGXPCResponse1)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setResponse1:(id)a3;
@end

@implementation SGXPCResponse1

- (void).cxx_destruct
{
}

- (void)setResponse1:(id)a3
{
}

- (SGXPCResponse1)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGXPCResponse1;
  v5 = [(SGXPCResponse *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"response1"];
    response1 = v5->_response1;
    v5->_response1 = (NSSecureCoding *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGXPCResponse1;
  id v4 = a3;
  [(SGXPCResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_response1, @"response1", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)responseWith:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_super v5 = (void *)v4[2];
  v4[2] = v3;

  return v4;
}

- (NSSecureCoding)response1
{
  return self->_response1;
}

+ (id)responseWithError:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithError:v4];

  return v5;
}

@end