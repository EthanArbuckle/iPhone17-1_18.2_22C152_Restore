@interface EKUICalendarListContentConfiguration
- (NSString)altCalendarText;
- (NSString)mainText;
- (NSString)mainTextAbbr;
- (NSString)weekNumberText;
- (UIColor)mainTextColor;
- (UIColor)secondaryTextColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)makeContentView;
- (void)setAltCalendarText:(id)a3;
- (void)setMainText:(id)a3;
- (void)setMainTextAbbr:(id)a3;
- (void)setMainTextColor:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)setWeekNumberText:(id)a3;
@end

@implementation EKUICalendarListContentConfiguration

- (id)makeContentView
{
  v3 = objc_alloc_init(EKUICalendarListViewHeaderContentView);
  [(EKUICalendarListViewHeaderContentView *)v3 setConfiguration:self];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EKUICalendarListContentConfiguration;
  return [(EKUICalendarListContentConfiguration *)&v4 copy];
}

- (NSString)mainText
{
  return self->_mainText;
}

- (void)setMainText:(id)a3
{
}

- (NSString)mainTextAbbr
{
  return self->_mainTextAbbr;
}

- (void)setMainTextAbbr:(id)a3
{
}

- (NSString)altCalendarText
{
  return self->_altCalendarText;
}

- (void)setAltCalendarText:(id)a3
{
}

- (NSString)weekNumberText
{
  return self->_weekNumberText;
}

- (void)setWeekNumberText:(id)a3
{
}

- (UIColor)mainTextColor
{
  return self->_mainTextColor;
}

- (void)setMainTextColor:(id)a3
{
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_mainTextColor, 0);
  objc_storeStrong((id *)&self->_weekNumberText, 0);
  objc_storeStrong((id *)&self->_altCalendarText, 0);
  objc_storeStrong((id *)&self->_mainTextAbbr, 0);

  objc_storeStrong((id *)&self->_mainText, 0);
}

@end