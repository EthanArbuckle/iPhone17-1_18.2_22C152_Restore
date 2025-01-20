@interface KGStringPropertyValue
- (BOOL)isEqual:(id)a3;
- (KGStringPropertyValue)initWithValue:(id)a3;
- (NSString)value;
- (id)kgPropertyValue;
- (unint64_t)dataType;
- (unint64_t)hash;
@end

@implementation KGStringPropertyValue

- (void).cxx_destruct
{
}

- (NSString)value
{
  return self->_value;
}

- (unint64_t)hash
{
  return [(NSString *)self->_value hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (KGStringPropertyValue *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      value = self->_value;
      v6 = [(KGStringPropertyValue *)v4 value];
      char v7 = [(NSString *)value isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)kgPropertyValue
{
  return self->_value;
}

- (unint64_t)dataType
{
  return 3;
}

- (KGStringPropertyValue)initWithValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGStringPropertyValue;
  v5 = [(KGPropertyValue *)&v9 initForSubclasses];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    value = v5->_value;
    v5->_value = (NSString *)v6;
  }
  return v5;
}

@end