@interface AMSBoolean
+ (BOOL)supportsSecureCoding;
+ (id)BOOLeanWithBool:(BOOL)a3;
- (AMSBoolean)initWithBool:(BOOL)a3;
- (AMSBoolean)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBool:(id)a3;
- (BOOL)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSBoolean

+ (id)BOOLeanWithBool:(BOOL)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithBool:a3];
  return v3;
}

- (AMSBoolean)initWithBool:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSBoolean;
  result = [(AMSBoolean *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (BOOL)value
{
  return self->_value;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(AMSBoolean *)self isEqualToBool:v4];

  return v5;
}

- (BOOL)isEqualToBool:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  LOBYTE(self) = [(AMSBoolean *)self value];
  char v5 = [v4 value];

  return self ^ v5 ^ 1;
}

- (AMSBoolean)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"value"];
  return [(AMSBoolean *)self initWithBool:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSBoolean value](self, "value"), @"value");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end