@interface SKGCurrency
- (BOOL)isEqual:(id)a3;
- (NSString)amount;
- (double)value;
- (id)description;
- (unint64_t)code;
- (void)setAmount:(id)a3;
- (void)setCode:(unint64_t)a3;
- (void)setValue:(double)a3;
@end

@implementation SKGCurrency

- (BOOL)isEqual:(id)a3
{
  v4 = (SKGCurrency *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(SKGCurrency *)self amount];
      v6 = [(SKGCurrency *)v4 amount];
      if ([v5 isEqualToString:v6]
        && ([(SKGCurrency *)self value], double v8 = v7, [(SKGCurrency *)v4 value], v8 == v9)
        && (v10 = [(SKGCurrency *)self code], v10 == (void *)[(SKGCurrency *)v4 code]))
      {
        [(SKGEntity *)self score];
        double v12 = v11;
        [(SKGEntity *)v4 score];
        BOOL v14 = v12 == v13;
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(SKGCurrency *)self amount];
  [(SKGEntity *)self score];
  v6 = +[NSString stringWithFormat:@"<%@: %@ %f", v3, v4, v5];

  return v6;
}

- (NSString)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (unint64_t)code
{
  return self->_code;
}

- (void)setCode:(unint64_t)a3
{
  self->_code = a3;
}

- (void).cxx_destruct
{
}

@end