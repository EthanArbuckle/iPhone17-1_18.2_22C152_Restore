@interface _MKCompassDirectionImageKey
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSString)headingString;
- (_MKCompassDirectionImageKey)initWithSize:(CGSize)a3 headingString:(id)a4 compassViewStyle:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compassViewStyle;
- (unint64_t)hash;
@end

@implementation _MKCompassDirectionImageKey

- (_MKCompassDirectionImageKey)initWithSize:(CGSize)a3 headingString:(id)a4 compassViewStyle:(int64_t)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_MKCompassDirectionImageKey;
  v11 = [(_MKCompassDirectionImageKey *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_size.CGFloat width = width;
    v11->_size.CGFloat height = height;
    objc_storeStrong((id *)&v11->_headingString, a4);
    v12->_compassViewStyle = a5;
    v13 = v12;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t width = (unint64_t)self->_size.width;
  return width + [(NSString *)self->_headingString characterAtIndex:0] + self->_compassViewStyle;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_MKCompassDirectionImageKey *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      headingString = self->_headingString;
      v7 = [(_MKCompassDirectionImageKey *)v5 headingString];
      if ([(NSString *)headingString isEqual:v7])
      {
        [(_MKCompassDirectionImageKey *)v5 size];
        BOOL v9 = 0;
        if (self->_size.width == v10 && self->_size.height == v8)
        {
          int64_t compassViewStyle = self->_compassViewStyle;
          BOOL v9 = compassViewStyle == [(_MKCompassDirectionImageKey *)v5 compassViewStyle];
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  headingString = self->_headingString;
  int64_t compassViewStyle = self->_compassViewStyle;
  double width = self->_size.width;
  double height = self->_size.height;

  return (id)objc_msgSend(v4, "initWithSize:headingString:compassViewStyle:", headingString, compassViewStyle, width, height);
}

- (NSString)headingString
{
  return self->_headingString;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)compassViewStyle
{
  return self->_compassViewStyle;
}

- (void).cxx_destruct
{
}

@end