@interface AMSInteger
+ (BOOL)supportsSecureCoding;
+ (id)integerWithInteger:(int64_t)a3;
- (AMSInteger)initWithCoder:(id)a3;
- (AMSInteger)initWithInteger:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInteger:(id)a3;
- (int64_t)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSInteger

- (AMSInteger)initWithInteger:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSInteger;
  result = [(AMSInteger *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

+ (id)integerWithInteger:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithInteger:a3];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(AMSInteger *)self isEqualToInteger:v4];

  return v5;
}

- (BOOL)isEqualToInteger:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  int64_t v5 = [(AMSInteger *)self value];
  uint64_t v6 = [v4 value];

  return v5 == v6;
}

- (int64_t)value
{
  return self->_value;
}

- (AMSInteger)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"value"];
  return [(AMSInteger *)self initWithInteger:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSInteger value](self, "value"), @"value");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end