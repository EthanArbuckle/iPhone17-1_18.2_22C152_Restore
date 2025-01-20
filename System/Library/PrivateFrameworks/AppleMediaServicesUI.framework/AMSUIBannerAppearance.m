@interface AMSUIBannerAppearance
- (AMSUIBannerAppearance)init;
- (AMSUIBannerAppearance)initWithDictionary:(id)a3;
- (UIColor)accessoryButtonBackgroundColor;
- (UIColor)accessoryButtonColor;
- (UIColor)accessorySecondaryButtonBackgroundColor;
- (UIColor)accessorySecondaryButtonColor;
- (UIColor)backgroundColor;
- (UIColor)imageTintColor;
- (UIColor)messageTextColor;
- (UIColor)separatorColor;
- (UIColor)titleTextColor;
- (UIFont)accessoryButtonFont;
- (UIFont)accessorySecondaryButtonFont;
- (UIFont)messageFont;
- (UIFont)titleFont;
- (UIImage)backgroundImage;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (int64_t)iconAnimationPlayCount;
- (int64_t)primaryImageRenderingMode;
- (void)setAccessoryButtonBackgroundColor:(id)a3;
- (void)setAccessoryButtonColor:(id)a3;
- (void)setAccessoryButtonFont:(id)a3;
- (void)setAccessorySecondaryButtonBackgroundColor:(id)a3;
- (void)setAccessorySecondaryButtonColor:(id)a3;
- (void)setAccessorySecondaryButtonFont:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setIconAnimationPlayCount:(int64_t)a3;
- (void)setImageSymbolConfiguration:(id)a3;
- (void)setImageTintColor:(id)a3;
- (void)setMessageFont:(id)a3;
- (void)setMessageTextColor:(id)a3;
- (void)setPrimaryImageRenderingMode:(int64_t)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleTextColor:(id)a3;
@end

@implementation AMSUIBannerAppearance

- (AMSUIBannerAppearance)init
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIBannerAppearance;
  result = [(AMSUIAppearance *)&v3 init];
  if (result)
  {
    result->_iconAnimationPlayCount = -90;
    result->_primaryImageRenderingMode = 0;
  }
  return result;
}

- (AMSUIBannerAppearance)initWithDictionary:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)AMSUIBannerAppearance;
  v5 = [(AMSUIAppearance *)&v37 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = +[AMSUIAppearance _accessoryButtonColorWithDictionary:v4];
    accessoryButtonColor = v5->_accessoryButtonColor;
    v5->_accessoryButtonColor = (UIColor *)v6;

    uint64_t v8 = +[AMSUIAppearance _accessoryButtonFontWithDictionary:v4];
    accessoryButtonFont = v5->_accessoryButtonFont;
    v5->_accessoryButtonFont = (UIFont *)v8;

    uint64_t v10 = +[AMSUIAppearance _accessoryButtonBackgroundColorWithDictionary:v4];
    accessoryButtonBackgroundColor = v5->_accessoryButtonBackgroundColor;
    v5->_accessoryButtonBackgroundColor = (UIColor *)v10;

    uint64_t v12 = +[AMSUIAppearance _accessorySecondaryButtonBackgroundColorWithDictionary:v4];
    accessorySecondaryButtonBackgroundColor = v5->_accessorySecondaryButtonBackgroundColor;
    v5->_accessorySecondaryButtonBackgroundColor = (UIColor *)v12;

    uint64_t v14 = +[AMSUIAppearance _accessorySecondaryButtonColorWithDictionary:v4];
    accessorySecondaryButtonColor = v5->_accessorySecondaryButtonColor;
    v5->_accessorySecondaryButtonColor = (UIColor *)v14;

    uint64_t v16 = +[AMSUIAppearance _accessorySecondaryButtonFontWithDictionary:v4];
    accessorySecondaryButtonFont = v5->_accessorySecondaryButtonFont;
    v5->_accessorySecondaryButtonFont = (UIFont *)v16;

    uint64_t v18 = +[AMSUIAppearance _backgroundColorWithDictionary:v4];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v18;

    uint64_t v20 = +[AMSUIAppearance _backgroundImageWithDictionary:v4];
    backgroundImage = v5->_backgroundImage;
    v5->_backgroundImage = (UIImage *)v20;

    v5->_iconAnimationPlayCount = +[AMSUIAppearance _iconAnimationPlayCount:v4];
    uint64_t v22 = +[AMSUIAppearance _imageSymbolConfigurationWithDictionary:v4];
    imageSymbolConfiguration = v5->_imageSymbolConfiguration;
    v5->_imageSymbolConfiguration = (UIImageSymbolConfiguration *)v22;

    uint64_t v24 = +[AMSUIAppearance _imageTintColorWithDictionary:v4];
    imageTintColor = v5->_imageTintColor;
    v5->_imageTintColor = (UIColor *)v24;

    uint64_t v26 = +[AMSUIAppearance _messageFontWithDictionary:v4];
    messageFont = v5->_messageFont;
    v5->_messageFont = (UIFont *)v26;

    uint64_t v28 = +[AMSUIAppearance _messageTextColorWithDictionary:v4];
    messageTextColor = v5->_messageTextColor;
    v5->_messageTextColor = (UIColor *)v28;

    v5->_primaryImageRenderingMode = +[AMSUIAppearance _primaryImageRenderingModeWithDictionary:v4];
    uint64_t v30 = +[AMSUIAppearance _separatorColorWithDictionary:v4];
    separatorColor = v5->_separatorColor;
    v5->_separatorColor = (UIColor *)v30;

    uint64_t v32 = +[AMSUIAppearance _titleFontWithDictionary:v4];
    titleFont = v5->_titleFont;
    v5->_titleFont = (UIFont *)v32;

    uint64_t v34 = +[AMSUIAppearance _titleTextColorWithDictionary:v4];
    titleTextColor = v5->_titleTextColor;
    v5->_titleTextColor = (UIColor *)v34;
  }
  return v5;
}

- (UIColor)accessoryButtonBackgroundColor
{
  return self->_accessoryButtonBackgroundColor;
}

- (void)setAccessoryButtonBackgroundColor:(id)a3
{
}

- (UIColor)accessoryButtonColor
{
  return self->_accessoryButtonColor;
}

- (void)setAccessoryButtonColor:(id)a3
{
}

- (UIFont)accessoryButtonFont
{
  return self->_accessoryButtonFont;
}

- (void)setAccessoryButtonFont:(id)a3
{
}

- (UIColor)accessorySecondaryButtonBackgroundColor
{
  return self->_accessorySecondaryButtonBackgroundColor;
}

- (void)setAccessorySecondaryButtonBackgroundColor:(id)a3
{
}

- (UIColor)accessorySecondaryButtonColor
{
  return self->_accessorySecondaryButtonColor;
}

- (void)setAccessorySecondaryButtonColor:(id)a3
{
}

- (UIFont)accessorySecondaryButtonFont
{
  return self->_accessorySecondaryButtonFont;
}

- (void)setAccessorySecondaryButtonFont:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (void)setImageSymbolConfiguration:(id)a3
{
}

- (int64_t)iconAnimationPlayCount
{
  return self->_iconAnimationPlayCount;
}

- (void)setIconAnimationPlayCount:(int64_t)a3
{
  self->_iconAnimationPlayCount = a3;
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
}

- (UIFont)messageFont
{
  return self->_messageFont;
}

- (void)setMessageFont:(id)a3
{
}

- (UIColor)messageTextColor
{
  return self->_messageTextColor;
}

- (void)setMessageTextColor:(id)a3
{
}

- (int64_t)primaryImageRenderingMode
{
  return self->_primaryImageRenderingMode;
}

- (void)setPrimaryImageRenderingMode:(int64_t)a3
{
  self->_primaryImageRenderingMode = a3;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void)setSeparatorColor:(id)a3
{
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_messageTextColor, 0);
  objc_storeStrong((id *)&self->_messageFont, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_accessorySecondaryButtonFont, 0);
  objc_storeStrong((id *)&self->_accessorySecondaryButtonColor, 0);
  objc_storeStrong((id *)&self->_accessorySecondaryButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryButtonFont, 0);
  objc_storeStrong((id *)&self->_accessoryButtonColor, 0);
  objc_storeStrong((id *)&self->_accessoryButtonBackgroundColor, 0);
}

@end