@interface AMSChar
+ (id)charWithChar:(char)a3;
- (AMSChar)initWithChar:(char)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChar:(id)a3;
- (char)value;
@end

@implementation AMSChar

- (AMSChar)initWithChar:(char)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSChar;
  result = [(AMSChar *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

+ (id)charWithChar:(char)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithChar:a3];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(AMSChar *)self isEqualToChar:v4];

  return v5;
}

- (BOOL)isEqualToChar:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  LODWORD(self) = [(AMSChar *)self value];
  int v5 = [v4 value];

  return self == v5;
}

- (char)value
{
  return self->_value;
}

@end