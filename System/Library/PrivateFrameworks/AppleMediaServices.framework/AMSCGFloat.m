@interface AMSCGFloat
+ (id)cgFloatWithCGFloat:(double)a3;
- (AMSCGFloat)initWithCGFloat:(double)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCGFloat:(id)a3;
- (double)value;
@end

@implementation AMSCGFloat

- (AMSCGFloat)initWithCGFloat:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSCGFloat;
  result = [(AMSCGFloat *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

+ (id)cgFloatWithCGFloat:(double)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCGFloat:a3];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(AMSCGFloat *)self isEqualToCGFloat:v4];

  return v5;
}

- (BOOL)isEqualToCGFloat:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  [(AMSCGFloat *)self value];
  double v6 = v5;
  [v4 value];
  double v8 = v7;

  return v6 == v8;
}

- (double)value
{
  return self->_value;
}

@end