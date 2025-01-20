@interface HKAxisLabelStyle
+ (HKAxisLabelStyle)labelStyleWithColor:(id)a3 font:(id)a4 horizontalAlignment:(int64_t)a5 verticalAlignment:(int64_t)a6;
+ (HKAxisLabelStyle)labelStyleWithColor:(id)a3 font:(id)a4 horizontalAlignment:(int64_t)a5 verticalAlignment:(int64_t)a6 hyphenationFactor:(id)a7;
+ (HKAxisLabelStyle)labelStyleWithColor:(id)a3 font:(id)a4 horizontalAlignment:(int64_t)a5 verticalAlignment:(int64_t)a6 isSystemSymbol:(BOOL)a7;
+ (HKAxisLabelStyle)labelStyleWithColor:(id)a3 font:(id)a4 horizontalAlignment:(int64_t)a5 verticalAlignment:(int64_t)a6 numberFormatter:(id)a7;
- (BOOL)isSystemSymbol;
- (HKNumberFormatter)numberFormatter;
- (NSNumber)hyphenationFactor;
- (UIColor)textColor;
- (UIFont)font;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)horizontalAlignment;
- (int64_t)verticalAlignment;
- (void)setFont:(id)a3;
- (void)setHorizontalAlignment:(int64_t)a3;
- (void)setHyphenationFactor:(id)a3;
- (void)setIsSystemSymbol:(BOOL)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setVerticalAlignment:(int64_t)a3;
@end

@implementation HKAxisLabelStyle

+ (HKAxisLabelStyle)labelStyleWithColor:(id)a3 font:(id)a4 horizontalAlignment:(int64_t)a5 verticalAlignment:(int64_t)a6
{
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  [v11 setTextColor:v10];

  [v11 setFont:v9];
  [v11 setHorizontalAlignment:a5];
  [v11 setVerticalAlignment:a6];
  [v11 setIsSystemSymbol:0];
  return (HKAxisLabelStyle *)v11;
}

- (void)setVerticalAlignment:(int64_t)a3
{
  self->_verticalAlignment = a3;
}

- (void)setTextColor:(id)a3
{
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  self->_horizontalAlignment = a3;
}

- (void)setFont:(id)a3
{
}

+ (HKAxisLabelStyle)labelStyleWithColor:(id)a3 font:(id)a4 horizontalAlignment:(int64_t)a5 verticalAlignment:(int64_t)a6 hyphenationFactor:(id)a7
{
  id v12 = a7;
  v13 = [a1 labelStyleWithColor:a3 font:a4 horizontalAlignment:a5 verticalAlignment:a6];
  [v13 setHyphenationFactor:v12];

  [v13 setIsSystemSymbol:0];
  return (HKAxisLabelStyle *)v13;
}

- (void)setIsSystemSymbol:(BOOL)a3
{
  self->_isSystemSymbol = a3;
}

- (void)setHyphenationFactor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyphenationFactor, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

+ (HKAxisLabelStyle)labelStyleWithColor:(id)a3 font:(id)a4 horizontalAlignment:(int64_t)a5 verticalAlignment:(int64_t)a6 numberFormatter:(id)a7
{
  id v12 = a7;
  v13 = [a1 labelStyleWithColor:a3 font:a4 horizontalAlignment:a5 verticalAlignment:a6];
  [v13 setNumberFormatter:v12];

  [v13 setIsSystemSymbol:0];
  return (HKAxisLabelStyle *)v13;
}

+ (HKAxisLabelStyle)labelStyleWithColor:(id)a3 font:(id)a4 horizontalAlignment:(int64_t)a5 verticalAlignment:(int64_t)a6 isSystemSymbol:(BOOL)a7
{
  BOOL v7 = a7;
  v8 = [a1 labelStyleWithColor:a3 font:a4 horizontalAlignment:a5 verticalAlignment:a6];
  [v8 setIsSystemSymbol:v7];
  return (HKAxisLabelStyle *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(UIColor *)self->_textColor copy];
  v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(UIFont *)self->_font copy];
  v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  *(void *)(v4 + 32) = self->_horizontalAlignment;
  *(void *)(v4 + 40) = self->_verticalAlignment;
  objc_storeStrong((id *)(v4 + 48), self->_numberFormatter);
  objc_storeStrong((id *)(v4 + 56), self->_hyphenationFactor);
  *(unsigned char *)(v4 + 8) = self->_isSystemSymbol;
  return (id)v4;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFont)font
{
  return self->_font;
}

- (int64_t)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (HKNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
}

- (NSNumber)hyphenationFactor
{
  return self->_hyphenationFactor;
}

- (BOOL)isSystemSymbol
{
  return self->_isSystemSymbol;
}

@end