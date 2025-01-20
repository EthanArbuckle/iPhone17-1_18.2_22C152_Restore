@interface AMSUnsignedLongLong
+ (id)unsignedLongLongWithUnsignedLongLong:(unint64_t)a3;
- (AMSUnsignedLongLong)initWithUnsignedLongLong:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUnsignedLongLong:(id)a3;
- (unint64_t)value;
@end

@implementation AMSUnsignedLongLong

- (AMSUnsignedLongLong)initWithUnsignedLongLong:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUnsignedLongLong;
  result = [(AMSUnsignedLongLong *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

+ (id)unsignedLongLongWithUnsignedLongLong:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithUnsignedLongLong:a3];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(AMSUnsignedLongLong *)self isEqualToUnsignedLongLong:v4];

  return v5;
}

- (BOOL)isEqualToUnsignedLongLong:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  unint64_t v5 = [(AMSUnsignedLongLong *)self value];
  uint64_t v6 = [v4 value];

  return v5 == v6;
}

- (unint64_t)value
{
  return self->_value;
}

@end