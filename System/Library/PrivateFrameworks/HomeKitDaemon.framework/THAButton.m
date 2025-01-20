@interface THAButton
- (BOOL)isEqual:(id)a3;
- (THAButton)initWithType:(unint64_t)a3 identifier:(unsigned __int8)a4;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (unsigned)identifier;
- (void)setIdentifier:(unsigned __int8)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation THAButton

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setIdentifier:(unsigned __int8)a3
{
  self->_identifier = a3;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  unint64_t v3 = [(THAButton *)self type];
  return [(THAButton *)self identifier] | (v3 << 8);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (THAButton *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (v5 && (int v6 = [(THAButton *)self identifier], v6 == [(THAButton *)v5 identifier]))
      {
        unint64_t v7 = [(THAButton *)self type];
        BOOL v8 = v7 == [(THAButton *)v5 type];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Button  identifier: %lu, Type: %lu", -[THAButton identifier](self, "identifier"), -[THAButton type](self, "type")];
}

- (THAButton)initWithType:(unint64_t)a3 identifier:(unsigned __int8)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THAButton;
  result = [(THAButton *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_identifier = a4;
  }
  return result;
}

@end