@interface FixedParameter
- (FixedParameter)initWithIdentifier:(int)a3 value:(float)a4;
- (float)value;
- (id)description;
- (int)identifier;
@end

@implementation FixedParameter

- (FixedParameter)initWithIdentifier:(int)a3 value:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FixedParameter;
  result = [(FixedParameter *)&v7 init];
  if (result)
  {
    result->_identifier = a3;
    result->_value = a4;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ id=%d, val=%f>", objc_opt_class(), self->_identifier, self->_value];
}

- (int)identifier
{
  return self->_identifier;
}

- (float)value
{
  return self->_value;
}

@end