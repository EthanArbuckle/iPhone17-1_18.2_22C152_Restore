@interface NCManagerToken
+ (id)tokenWithValue:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (unint64_t)value;
@end

@implementation NCManagerToken

+ (id)tokenWithValue:(unint64_t)a3
{
  v4 = objc_alloc_init((Class)a1);
  v4[1] = a3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NCManagerToken *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_value == v4->_value;
  }

  return v5;
}

- (unint64_t)value
{
  return self->_value;
}

@end