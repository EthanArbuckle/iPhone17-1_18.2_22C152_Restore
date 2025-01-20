@interface KGUInt64PropertyValue
- (BOOL)isEqual:(id)a3;
- (KGUInt64PropertyValue)initWithValue:(unint64_t)a3;
- (id)kgPropertyValue;
- (unint64_t)dataType;
- (unint64_t)hash;
- (unint64_t)value;
@end

@implementation KGUInt64PropertyValue

- (unint64_t)value
{
  return self->_value;
}

- (unint64_t)hash
{
  v2 = [NSNumber numberWithUnsignedLongLong:self->_value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (KGUInt64PropertyValue *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t value = self->_value;
      BOOL v6 = value == [(KGUInt64PropertyValue *)v4 value];
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
  return (id)[NSNumber numberWithUnsignedLongLong:self->_value];
}

- (unint64_t)dataType
{
  return 1;
}

- (KGUInt64PropertyValue)initWithValue:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)KGUInt64PropertyValue;
  result = [(KGPropertyValue *)&v5 initForSubclasses];
  if (result) {
    result->_unint64_t value = a3;
  }
  return result;
}

@end