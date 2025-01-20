@interface AMSUIToastAppearance
- (AMSUIToastAppearance)init;
- (AMSUIToastAppearance)initWithDictionary:(id)a3;
- (UIColor)accessoryButtonColor;
- (UIColor)backgroundColor;
- (UIColor)imageTintColor;
- (UIColor)messageTextColor;
- (UIColor)titleTextColor;
- (UIFont)accessoryButtonFont;
- (UIFont)messageFont;
- (UIFont)titleFont;
- (UIImage)backgroundImage;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (int64_t)iconAnimationPlayCount;
- (int64_t)primaryImageRenderingMode;
- (void)setAccessoryButtonColor:(id)a3;
- (void)setAccessoryButtonFont:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setIconAnimationPlayCount:(int64_t)a3;
- (void)setImageSymbolConfiguration:(id)a3;
- (void)setImageTintColor:(id)a3;
- (void)setMessageFont:(id)a3;
- (void)setMessageTextColor:(id)a3;
- (void)setPrimaryImageRenderingMode:(int64_t)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleTextColor:(id)a3;
@end

@implementation AMSUIToastAppearance

- (AMSUIToastAppearance)init
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIToastAppearance;
  result = [(AMSUIAppearance *)&v3 init];
  if (result)
  {
    result->_iconAnimationPlayCount = -90;
    result->_primaryImageRenderingMode = 0;
  }
  return result;
}

- (AMSUIToastAppearance)initWithDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AMSUIToastAppearance;
  v5 = [(AMSUIAppearance *)&v27 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = +[AMSUIAppearance _accessoryButtonColorWithDictionary:v4];
    accessoryButtonColor = v5->_accessoryButtonColor;
    v5->_accessoryButtonColor = (UIColor *)v6;

    uint64_t v8 = +[AMSUIAppearance _accessoryButtonFontWithDictionary:v4];
    accessoryButtonFont = v5->_accessoryButtonFont;
    v5->_accessoryButtonFont = (UIFont *)v8;

    uint64_t v10 = +[AMSUIAppearance _backgroundColorWithDictionary:v4];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v10;

    uint64_t v12 = +[AMSUIAppearance _backgroundImageWithDictionary:v4];
    backgroundImage = v5->_backgroundImage;
    v5->_backgroundImage = (UIImage *)v12;

    v5->_iconAnimationPlayCount = +[AMSUIAppearance _iconAnimationPlayCount:v4];
    uint64_t v14 = +[AMSUIAppearance _imageSymbolConfigurationWithDictionary:v4];
    imageSymbolConfiguration = v5->_imageSymbolConfiguration;
    v5->_imageSymbolConfiguration = (UIImageSymbolConfiguration *)v14;

    uint64_t v16 = +[AMSUIAppearance _imageTintColorWithDictionary:v4];
    imageTintColor = v5->_imageTintColor;
    v5->_imageTintColor = (UIColor *)v16;

    v5->_primaryImageRenderingMode = +[AMSUIAppearance _primaryImageRenderingModeWithDictionary:v4];
    uint64_t v18 = +[AMSUIAppearance _titleFontWithDictionary:v4];
    titleFont = v5->_titleFont;
    v5->_titleFont = (UIFont *)v18;

    uint64_t v20 = +[AMSUIAppearance _titleTextColorWithDictionary:v4];
    titleTextColor = v5->_titleTextColor;
    v5->_titleTextColor = (UIColor *)v20;

    uint64_t v22 = +[AMSUIAppearance _messageFontWithDictionary:v4];
    messageFont = v5->_messageFont;
    v5->_messageFont = (UIFont *)v22;

    uint64_t v24 = +[AMSUIAppearance _messageTextColorWithDictionary:v4];
    messageTextColor = v5->_messageTextColor;
    v5->_messageTextColor = (UIColor *)v24;
  }
  return v5;
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
  objc_storeStrong((id *)&self->_messageTextColor, 0);
  objc_storeStrong((id *)&self->_messageFont, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryButtonFont, 0);
  objc_storeStrong((id *)&self->_accessoryButtonColor, 0);
}

@end