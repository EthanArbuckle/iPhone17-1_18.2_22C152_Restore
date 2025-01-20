@interface AMSUnsignedChar
+ (id)unsignedCharWithUnsignedChar:(unsigned __int8)a3;
- (AMSUnsignedChar)initWithUnsignedChar:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUnsignedChar:(id)a3;
- (unsigned)value;
@end

@implementation AMSUnsignedChar

- (AMSUnsignedChar)initWithUnsignedChar:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUnsignedChar;
  result = [(AMSUnsignedChar *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

+ (id)unsignedCharWithUnsignedChar:(unsigned __int8)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithUnsignedChar:a3];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(AMSUnsignedChar *)self isEqualToUnsignedChar:v4];

  return v5;
}

- (BOOL)isEqualToUnsignedChar:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  LODWORD(self) = [(AMSUnsignedChar *)self value];
  int v5 = [v4 value];

  return self == v5;
}

- (unsigned)value
{
  return self->_value;
}

@end