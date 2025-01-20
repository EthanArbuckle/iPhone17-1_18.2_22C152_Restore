@interface AMSFloat
+ (BOOL)supportsSecureCoding;
+ (id)floatWithFloat:(float)a3;
- (AMSFloat)initWithCoder:(id)a3;
- (AMSFloat)initWithFloat:(float)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFloat:(id)a3;
- (float)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSFloat

- (AMSFloat)initWithFloat:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSFloat;
  result = [(AMSFloat *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

+ (id)floatWithFloat:(float)a3
{
  id v4 = objc_alloc((Class)a1);
  *(float *)&double v5 = a3;
  v6 = (void *)[v4 initWithFloat:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(AMSFloat *)self isEqualToFloat:v4];

  return v5;
}

- (BOOL)isEqualToFloat:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  [(AMSFloat *)self value];
  float v6 = v5;
  [v4 value];
  float v8 = v7;

  return v6 == v8;
}

- (float)value
{
  return self->_value;
}

- (AMSFloat)initWithCoder:(id)a3
{
  [a3 decodeFloatForKey:@"value"];
  return -[AMSFloat initWithFloat:](self, "initWithFloat:");
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(AMSFloat *)self value];
  objc_msgSend(v4, "encodeFloat:forKey:", @"value");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end