@interface AMSUnsignedInteger
+ (id)unsignedIntegerWithUnsignedInteger:(unint64_t)a3;
- (AMSUnsignedInteger)initWithUnsignedInteger:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUnsignedInteger:(id)a3;
- (unint64_t)value;
@end

@implementation AMSUnsignedInteger

- (AMSUnsignedInteger)initWithUnsignedInteger:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUnsignedInteger;
  result = [(AMSUnsignedInteger *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

+ (id)unsignedIntegerWithUnsignedInteger:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithUnsignedInteger:a3];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(AMSUnsignedInteger *)self isEqualToUnsignedInteger:v4];

  return v5;
}

- (BOOL)isEqualToUnsignedInteger:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  unint64_t v5 = [(AMSUnsignedInteger *)self value];
  uint64_t v6 = [v4 value];

  return v5 == v6;
}

- (unint64_t)value
{
  return self->_value;
}

@end