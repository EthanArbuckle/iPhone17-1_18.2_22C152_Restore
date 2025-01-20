@interface AMSUnsignedLong
+ (id)unsignedLongWithUnsignedLong:(unint64_t)a3;
- (AMSUnsignedLong)initWithUnsignedLong:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUnsignedLong:(id)a3;
- (unint64_t)value;
@end

@implementation AMSUnsignedLong

- (AMSUnsignedLong)initWithUnsignedLong:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUnsignedLong;
  result = [(AMSUnsignedLong *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

+ (id)unsignedLongWithUnsignedLong:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithUnsignedLong:a3];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(AMSUnsignedLong *)self isEqualToUnsignedLong:v4];

  return v5;
}

- (BOOL)isEqualToUnsignedLong:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  unint64_t v5 = [(AMSUnsignedLong *)self value];
  uint64_t v6 = [v4 value];

  return v5 == v6;
}

- (unint64_t)value
{
  return self->_value;
}

@end