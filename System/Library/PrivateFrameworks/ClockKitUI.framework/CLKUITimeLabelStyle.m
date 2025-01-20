@interface CLKUITimeLabelStyle
- (BOOL)isEqual:(id)a3;
- (CLKFont)designatorFont;
- (CLKFont)fourDigitFont;
- (CLKFont)threeDigitFont;
- (NSDictionary)stringAttributes;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setDesignatorFont:(id)a3;
- (void)setFourDigitFont:(id)a3;
- (void)setStringAttributes:(id)a3;
- (void)setThreeDigitFont:(id)a3;
@end

@implementation CLKUITimeLabelStyle

- (CLKFont)designatorFont
{
  return self->_designatorFont;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLKUITimeLabelStyle *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CLKUITimeLabelStyle *)v4 threeDigitFont];
      if ([v5 isEqual:self->_threeDigitFont])
      {
        v6 = [(CLKUITimeLabelStyle *)v4 fourDigitFont];
        if ([v6 isEqual:self->_fourDigitFont])
        {
          v7 = [(CLKUITimeLabelStyle *)v4 designatorFont];
          if ([v7 isEqual:self->_designatorFont])
          {
            v8 = [(CLKUITimeLabelStyle *)v4 stringAttributes];
            char v9 = CLKEqualObjects();
          }
          else
          {
            char v9 = 0;
          }
        }
        else
        {
          char v9 = 0;
        }
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (CLKFont)threeDigitFont
{
  return self->_threeDigitFont;
}

- (CLKFont)fourDigitFont
{
  return self->_fourDigitFont;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setThreeDigitFont:self->_threeDigitFont];
  [v4 setFourDigitFont:self->_fourDigitFont];
  [v4 setDesignatorFont:self->_designatorFont];
  [v4 setStringAttributes:self->_stringAttributes];
  return v4;
}

- (unint64_t)hash
{
  double v3 = (double)(unint64_t)[(CLKFont *)self->_threeDigitFont hash];
  double v4 = (double)(unint64_t)[(CLKFont *)self->_fourDigitFont hash] * 1000.0 + v3 * 100.0;
  double v5 = v4 + (double)(unint64_t)[(CLKFont *)self->_designatorFont hash] * 10000.0;
  return (unint64_t)(v5
                          + (double)(unint64_t)[(NSDictionary *)self->_stringAttributes hash] * 100000.0);
}

- (void)setThreeDigitFont:(id)a3
{
}

- (void)setFourDigitFont:(id)a3
{
}

- (void)setDesignatorFont:(id)a3
{
}

- (NSDictionary)stringAttributes
{
  return self->_stringAttributes;
}

- (void)setStringAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringAttributes, 0);
  objc_storeStrong((id *)&self->_designatorFont, 0);
  objc_storeStrong((id *)&self->_fourDigitFont, 0);
  objc_storeStrong((id *)&self->_threeDigitFont, 0);
}

@end