@interface CSComplicationLayoutElement
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (CSComplicationLayoutElement)initWithIdentifier:(id)a3 complicationFamily:(unint64_t)a4 size:(CGSize)a5;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)gridWidth;
- (unint64_t)complicationFamily;
- (unint64_t)hash;
@end

@implementation CSComplicationLayoutElement

- (CSComplicationLayoutElement)initWithIdentifier:(id)a3 complicationFamily:(unint64_t)a4 size:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSComplicationLayoutElement;
  v11 = [(CSComplicationLayoutElement *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    v12->_complicationFamily = a4;
    v12->_size.CGFloat width = width;
    v12->_size.CGFloat height = height;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CSComplicationLayoutElement *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      v6 = [(CSComplicationLayoutElement *)v4 identifier];
      if ([(NSString *)identifier isEqualToString:v6]
        && (unint64_t complicationFamily = self->_complicationFamily,
            complicationFamily == [(CSComplicationLayoutElement *)v4 complicationFamily]))
      {
        [(CSComplicationLayoutElement *)v4 size];
        BOOL v10 = self->_size.height == v9 && self->_size.width == v8;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  v4 = [NSNumber numberWithUnsignedInteger:self->_complicationFamily];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [NSNumber numberWithDouble:self->_size.height * self->_size.width];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (int64_t)gridWidth
{
  if ([(CSComplicationLayoutElement *)self complicationFamily]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CSComplicationLayoutElement alloc];
  identifier = self->_identifier;
  unint64_t complicationFamily = self->_complicationFamily;
  double width = self->_size.width;
  double height = self->_size.height;

  return -[CSComplicationLayoutElement initWithIdentifier:complicationFamily:size:](v4, "initWithIdentifier:complicationFamily:size:", identifier, complicationFamily, width, height);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)complicationFamily
{
  return self->_complicationFamily;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end