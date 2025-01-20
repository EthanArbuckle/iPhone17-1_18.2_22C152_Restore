@interface CUIKCalendarSpecialDayData
- (CGColor)cgColor;
- (CUIKCalendarSpecialDayData)init;
- (NSString)locale;
- (UIColor)color;
- (int64_t)dayType;
- (void)setCgColor:(CGColor *)a3;
- (void)setColor:(id)a3;
- (void)setDayType:(int64_t)a3;
- (void)setLocale:(id)a3;
@end

@implementation CUIKCalendarSpecialDayData

- (CUIKCalendarSpecialDayData)init
{
  v3.receiver = self;
  v3.super_class = (Class)CUIKCalendarSpecialDayData;
  result = [(CUIKCalendarSpecialDayData *)&v3 init];
  if (result) {
    result->_dayType = 0;
  }
  return result;
}

- (UIColor)color
{
  v2 = (void *)MEMORY[0x1E4FB1618];
  objc_super v3 = [(CUIKCalendarSpecialDayData *)self cgColor];

  return (UIColor *)[v2 colorWithCGColor:v3];
}

- (void)setColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];

  [(CUIKCalendarSpecialDayData *)self setCgColor:v4];
}

- (int64_t)dayType
{
  return self->_dayType;
}

- (void)setDayType:(int64_t)a3
{
  self->_dayType = a3;
}

- (CGColor)cgColor
{
  return self->_cgColor;
}

- (void)setCgColor:(CGColor *)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (void).cxx_destruct
{
}

@end