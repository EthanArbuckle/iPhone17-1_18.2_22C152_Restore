@interface AMSLong
+ (id)longWithLong:(int64_t)a3;
- (AMSLong)initWithLong:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLong:(id)a3;
- (int64_t)value;
@end

@implementation AMSLong

- (AMSLong)initWithLong:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSLong;
  result = [(AMSLong *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

+ (id)longWithLong:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithLong:a3];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(AMSLong *)self isEqualToLong:v4];

  return v5;
}

- (BOOL)isEqualToLong:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  int64_t v5 = [(AMSLong *)self value];
  uint64_t v6 = [v4 value];

  return v5 == v6;
}

- (int64_t)value
{
  return self->_value;
}

@end