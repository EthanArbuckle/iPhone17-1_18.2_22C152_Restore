@interface AMSInt
+ (BOOL)supportsSecureCoding;
+ (id)intWithInt:(int)a3;
- (AMSInt)initWithCoder:(id)a3;
- (AMSInt)initWithInt:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInt:(id)a3;
- (int)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSInt

- (AMSInt)initWithInt:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSInt;
  result = [(AMSInt *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

+ (id)intWithInt:(int)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithInt:*(void *)&a3];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(AMSInt *)self isEqualToInt:v4];

  return v5;
}

- (BOOL)isEqualToInt:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  LODWORD(self) = [(AMSInt *)self value];
  int v5 = [v4 value];

  return self == v5;
}

- (int)value
{
  return self->_value;
}

- (AMSInt)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntForKey:@"value"];
  return [(AMSInt *)self initWithInt:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[AMSInt value](self, "value"), @"value");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end