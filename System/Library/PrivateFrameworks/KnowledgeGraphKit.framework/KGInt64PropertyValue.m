@interface KGInt64PropertyValue
- (BOOL)isEqual:(id)a3;
- (KGInt64PropertyValue)initWithValue:(int64_t)a3;
- (id)kgPropertyValue;
- (int64_t)value;
- (unint64_t)dataType;
- (unint64_t)hash;
@end

@implementation KGInt64PropertyValue

- (int64_t)value
{
  return self->_value;
}

- (unint64_t)hash
{
  v2 = [NSNumber numberWithLongLong:self->_value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (KGInt64PropertyValue *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t value = self->_value;
      BOOL v6 = value == [(KGInt64PropertyValue *)v4 value];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)kgPropertyValue
{
  return (id)[NSNumber numberWithLongLong:self->_value];
}

- (unint64_t)dataType
{
  return 0;
}

- (KGInt64PropertyValue)initWithValue:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)KGInt64PropertyValue;
  result = [(KGPropertyValue *)&v5 initForSubclasses];
  if (result) {
    result->_int64_t value = a3;
  }
  return result;
}

@end