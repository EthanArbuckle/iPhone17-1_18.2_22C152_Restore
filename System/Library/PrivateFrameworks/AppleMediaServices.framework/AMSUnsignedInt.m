@interface AMSUnsignedInt
+ (id)unsignedIntWithUnsignedInt:(unsigned int)a3;
- (AMSUnsignedInt)initWithUnsignedInt:(unsigned int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUnsignedInt:(id)a3;
- (unsigned)value;
@end

@implementation AMSUnsignedInt

- (AMSUnsignedInt)initWithUnsignedInt:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUnsignedInt;
  result = [(AMSUnsignedInt *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

+ (id)unsignedIntWithUnsignedInt:(unsigned int)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithUnsignedInt:*(void *)&a3];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(AMSUnsignedInt *)self isEqualToUnsignedInt:v4];

  return v5;
}

- (BOOL)isEqualToUnsignedInt:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  LODWORD(self) = [(AMSUnsignedInt *)self value];
  int v5 = [v4 value];

  return self == v5;
}

- (unsigned)value
{
  return self->_value;
}

@end