@interface AMSDouble
+ (BOOL)supportsSecureCoding;
+ (id)doubleWithDouble:(double)a3;
- (AMSDouble)initWithCoder:(id)a3;
- (AMSDouble)initWithDouble:(double)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDouble:(id)a3;
- (double)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSDouble

- (double)value
{
  return self->_value;
}

+ (id)doubleWithDouble:(double)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDouble:a3];
  return v3;
}

- (AMSDouble)initWithDouble:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSDouble;
  result = [(AMSDouble *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(AMSDouble *)self isEqualToDouble:v4];

  return v5;
}

- (BOOL)isEqualToDouble:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  [(AMSDouble *)self value];
  double v6 = v5;
  [v4 value];
  double v8 = v7;

  return v6 == v8;
}

- (AMSDouble)initWithCoder:(id)a3
{
  [a3 decodeDoubleForKey:@"value"];
  return -[AMSDouble initWithDouble:](self, "initWithDouble:");
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(AMSDouble *)self value];
  objc_msgSend(v4, "encodeDouble:forKey:", @"value");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end