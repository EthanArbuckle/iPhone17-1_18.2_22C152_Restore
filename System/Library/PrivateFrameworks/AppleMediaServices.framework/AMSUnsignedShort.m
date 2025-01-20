@interface AMSUnsignedShort
+ (id)unsignedShortWithUnsignedShort:(unsigned __int16)a3;
- (AMSUnsignedShort)initWithUnsignedShort:(unsigned __int16)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUnsignedShort:(id)a3;
- (unsigned)value;
@end

@implementation AMSUnsignedShort

- (AMSUnsignedShort)initWithUnsignedShort:(unsigned __int16)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUnsignedShort;
  result = [(AMSUnsignedShort *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

+ (id)unsignedShortWithUnsignedShort:(unsigned __int16)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithUnsignedShort:a3];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(AMSUnsignedShort *)self isEqualToUnsignedShort:v4];

  return v5;
}

- (BOOL)isEqualToUnsignedShort:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  LODWORD(self) = [(AMSUnsignedShort *)self value];
  int v5 = [v4 value];

  return self == v5;
}

- (unsigned)value
{
  return self->_value;
}

@end