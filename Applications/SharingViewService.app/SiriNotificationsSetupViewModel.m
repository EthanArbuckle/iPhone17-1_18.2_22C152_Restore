@interface SiriNotificationsSetupViewModel
- (BOOL)primaryActionUsesLegacyStyling;
- (BOOL)secondaryActionAvailable;
- (BOOL)secondaryActionUsesLegacyStyling;
- (NSString)dismissActionTitle;
- (NSString)primaryActionTitle;
- (NSString)secondaryActionTitle;
- (NSString)subtitleText;
- (NSString)titleText;
- (UIColor)titleColor;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (UIImage)contentImage;
- (int64_t)dismissActionStyle;
- (int64_t)primaryActionStyle;
- (int64_t)secondaryActionStyle;
- (void)setContentImage:(id)a3;
- (void)setDismissActionStyle:(int64_t)a3;
- (void)setDismissActionTitle:(id)a3;
- (void)setPrimaryActionStyle:(int64_t)a3;
- (void)setPrimaryActionTitle:(id)a3;
- (void)setPrimaryActionUsesLegacyStyling:(BOOL)a3;
- (void)setSecondaryActionAvailable:(BOOL)a3;
- (void)setSecondaryActionStyle:(int64_t)a3;
- (void)setSecondaryActionTitle:(id)a3;
- (void)setSecondaryActionUsesLegacyStyling:(BOOL)a3;
- (void)setSubtitleFont:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation SiriNotificationsSetupViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_secondaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_dismissActionTitle, 0);

  objc_storeStrong((id *)&self->_contentImage, 0);
}

- (void)setTitleText:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleFont:(id)a3
{
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleColor:(id)a3
{
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setSubtitleText:(id)a3
{
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleFont:(id)a3
{
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (void)setSecondaryActionUsesLegacyStyling:(BOOL)a3
{
  self->_secondaryActionUsesLegacyStyling = a3;
}

- (BOOL)secondaryActionUsesLegacyStyling
{
  return self->_secondaryActionUsesLegacyStyling;
}

- (void)setSecondaryActionTitle:(id)a3
{
}

- (NSString)secondaryActionTitle
{
  return self->_secondaryActionTitle;
}

- (void)setSecondaryActionStyle:(int64_t)a3
{
  self->_secondaryActionStyle = a3;
}

- (int64_t)secondaryActionStyle
{
  return self->_secondaryActionStyle;
}

- (void)setSecondaryActionAvailable:(BOOL)a3
{
  self->_secondaryActionAvailable = a3;
}

- (BOOL)secondaryActionAvailable
{
  return self->_secondaryActionAvailable;
}

- (void)setPrimaryActionUsesLegacyStyling:(BOOL)a3
{
  self->_primaryActionUsesLegacyStyling = a3;
}

- (BOOL)primaryActionUsesLegacyStyling
{
  return self->_primaryActionUsesLegacyStyling;
}

- (void)setPrimaryActionTitle:(id)a3
{
}

- (NSString)primaryActionTitle
{
  return self->_primaryActionTitle;
}

- (void)setPrimaryActionStyle:(int64_t)a3
{
  self->_primaryActionStyle = a3;
}

- (int64_t)primaryActionStyle
{
  return self->_primaryActionStyle;
}

- (void)setDismissActionTitle:(id)a3
{
}

- (NSString)dismissActionTitle
{
  return self->_dismissActionTitle;
}

- (void)setDismissActionStyle:(int64_t)a3
{
  self->_dismissActionStyle = a3;
}

- (int64_t)dismissActionStyle
{
  return self->_dismissActionStyle;
}

- (void)setContentImage:(id)a3
{
}

- (UIImage)contentImage
{
  return self->_contentImage;
}

@end