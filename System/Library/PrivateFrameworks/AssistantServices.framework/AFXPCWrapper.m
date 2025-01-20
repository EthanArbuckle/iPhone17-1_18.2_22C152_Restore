@interface AFXPCWrapper
+ (BOOL)supportsSecureCoding;
- (AFXPCWrapper)initWithCoder:(id)a3;
- (AFXPCWrapper)initWithXPCObject:(id)a3;
- (id)xpcObject;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFXPCWrapper

- (void).cxx_destruct
{
}

- (AFXPCWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F145E8] forKey:@"_xpcObject"];
  }
  else
  {
    v5 = 0;
  }
  v6 = [(AFXPCWrapper *)self initWithXPCObject:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (self->_xpcObject)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 encodeXPCObject:self->_xpcObject forKey:@"_xpcObject"];
    }
  }
}

- (id)xpcObject
{
  return self->_xpcObject;
}

- (AFXPCWrapper)initWithXPCObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFXPCWrapper;
  v6 = [(AFXPCWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_xpcObject, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end