@interface SGXPCResponse3
+ (BOOL)supportsSecureCoding;
+ (id)responseWith:(id)a3 also:(id)a4 also:(id)a5;
+ (id)responseWithError:(id)a3;
- (NSSecureCoding)response3;
- (SGXPCResponse3)initWithCoder:(id)a3;
- (id)response1;
- (id)response2;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGXPCResponse3

+ (id)responseWith:(id)a3 also:(id)a4 also:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setResponse1:v9];

  [v10 setResponse2:v8];
  v11 = (void *)v10[4];
  v10[4] = v7;

  return v10;
}

- (SGXPCResponse3)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGXPCResponse3;
  v5 = [(SGXPCResponse2 *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"response3"];
    response3 = v5->_response3;
    v5->_response3 = (NSSecureCoding *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSecureCoding)response3
{
  return self->_response3;
}

- (id)response2
{
  v4.receiver = self;
  v4.super_class = (Class)SGXPCResponse3;
  v2 = [(SGXPCResponse2 *)&v4 response2];

  return v2;
}

- (id)response1
{
  v4.receiver = self;
  v4.super_class = (Class)SGXPCResponse3;
  v2 = [(SGXPCResponse2 *)&v4 response1];

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGXPCResponse3;
  id v4 = a3;
  [(SGXPCResponse2 *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_response3, @"response3", v5.receiver, v5.super_class);
}

+ (id)responseWithError:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithError:v4];

  return v5;
}

@end