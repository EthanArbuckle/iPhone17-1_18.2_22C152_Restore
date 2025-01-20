@interface IMXPCObject
+ (BOOL)supportsSecureCoding;
+ (_xpc_type_s)type;
- (IMXPCObject)initWithCoder:(id)a3;
- (IMXPCObject)initWithXPCObject:(id)a3;
- (OS_xpc_object)object;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMXPCObject

- (OS_xpc_object)object
{
  return self->_object;
}

- (IMXPCObject)initWithXPCObject:(id)a3
{
  id v5 = a3;
  v6 = [(IMXPCObject *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_object, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (IMXPCObject)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", objc_msgSend((id)objc_opt_class(), "type"), @"_xpcObject");
  }
  else
  {
    id v5 = 0;
  }
  v6 = [(IMXPCObject *)self initWithXPCObject:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (self->_object)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 encodeXPCObject:self->_object forKey:@"_xpcObject"];
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (_xpc_type_s)type
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end