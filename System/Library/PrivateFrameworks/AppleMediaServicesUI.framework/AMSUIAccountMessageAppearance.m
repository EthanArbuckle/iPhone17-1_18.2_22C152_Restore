@interface AMSUIAccountMessageAppearance
- (AMSUIAccountMessageAppearance)init;
- (AMSUIAccountMessageAppearance)initWithDictionary:(id)a3;
- (UIColor)accessoryButtonColor;
- (UIColor)backgroundColor;
- (UIColor)footerButtonColor;
- (UIColor)imageTintColor;
- (UIColor)messageTextColor;
- (UIColor)titleTextColor;
- (UIFont)accessoryButtonFont;
- (UIFont)footerButtonFont;
- (UIFont)messageFont;
- (UIFont)titleFont;
- (UIImage)backgroundImage;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (int64_t)_animationStyleWithDictionary:(id)a3;
- (int64_t)iconAnimationPlayCount;
- (int64_t)impressionAnimationStyle;
- (int64_t)primaryImageRenderingMode;
- (unint64_t)imageStyle;
- (void)_setImageStyleWithDictionary:(id)a3;
- (void)setAccessoryButtonColor:(id)a3;
- (void)setAccessoryButtonFont:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setFooterButtonColor:(id)a3;
- (void)setFooterButtonFont:(id)a3;
- (void)setIconAnimationPlayCount:(int64_t)a3;
- (void)setImageStyle:(unint64_t)a3;
- (void)setImageSymbolConfiguration:(id)a3;
- (void)setImageTintColor:(id)a3;
- (void)setImpressionAnimationStyle:(int64_t)a3;
- (void)setMessageFont:(id)a3;
- (void)setMessageTextColor:(id)a3;
- (void)setPrimaryImageRenderingMode:(int64_t)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleTextColor:(id)a3;
@end

@implementation AMSUIAccountMessageAppearance

- (AMSUIAccountMessageAppearance)init
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIAccountMessageAppearance;
  result = [(AMSUIAppearance *)&v3 init];
  if (result)
  {
    result->_iconAnimationPlayCount = -90;
    result->_imageStyle = 0;
    result->_impressionAnimationStyle = -1;
    result->_primaryImageRenderingMode = 0;
  }
  return result;
}

- (AMSUIAccountMessageAppearance)initWithDictionary:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)AMSUIAccountMessageAppearance;
  v5 = [(AMSUIAppearance *)&v31 initWithDictionary:v4];
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

    uint64_t v14 = +[AMSUIAppearance _footerButtonColorWithDictionary:v4];
    footerButtonColor = v5->_footerButtonColor;
    v5->_footerButtonColor = (UIColor *)v14;

    uint64_t v16 = +[AMSUIAppearance _footerButtonFontWithDictionary:v4];
    footerButtonFont = v5->_footerButtonFont;
    v5->_footerButtonFont = (UIFont *)v16;

    v5->_iconAnimationPlayCount = +[AMSUIAppearance _iconAnimationPlayCount:v4];
    uint64_t v18 = +[AMSUIAppearance _imageSymbolConfigurationWithDictionary:v4];
    imageSymbolConfiguration = v5->_imageSymbolConfiguration;
    v5->_imageSymbolConfiguration = (UIImageSymbolConfiguration *)v18;

    uint64_t v20 = +[AMSUIAppearance _imageTintColorWithDictionary:v4];
    imageTintColor = v5->_imageTintColor;
    v5->_imageTintColor = (UIColor *)v20;

    v5->_impressionAnimationStyle = [(AMSUIAccountMessageAppearance *)v5 _animationStyleWithDictionary:v4];
    v5->_primaryImageRenderingMode = +[AMSUIAppearance _primaryImageRenderingModeWithDictionary:v4];
    uint64_t v22 = +[AMSUIAppearance _titleFontWithDictionary:v4];
    titleFont = v5->_titleFont;
    v5->_titleFont = (UIFont *)v22;

    uint64_t v24 = +[AMSUIAppearance _titleTextColorWithDictionary:v4];
    titleTextColor = v5->_titleTextColor;
    v5->_titleTextColor = (UIColor *)v24;

    uint64_t v26 = +[AMSUIAppearance _messageFontWithDictionary:v4];
    messageFont = v5->_messageFont;
    v5->_messageFont = (UIFont *)v26;

    uint64_t v28 = +[AMSUIAppearance _messageTextColorWithDictionary:v4];
    messageTextColor = v5->_messageTextColor;
    v5->_messageTextColor = (UIColor *)v28;

    [(AMSUIAccountMessageAppearance *)v5 _setImageStyleWithDictionary:v4];
  }

  return v5;
}

- (int64_t)_animationStyleWithDictionary:(id)a3
{
  objc_super v3 = +[AMSUIAppearance _impressionAnimationIdentifierWithDictionary:a3];
  id v4 = [&unk_26CC738F8 objectForKeyedSubscript:v3];
  v5 = v4;
  if (v4) {
    int64_t v6 = [v4 integerValue];
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

- (void)_setImageStyleWithDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"imageStyle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v4;
  }
  else {
    id v7 = 0;
  }

  v5 = v7;
  if (v7)
  {
    unint64_t v6 = [v7 unsignedIntValue];
    v5 = v7;
    self->_imageStyle = v6;
  }
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

- (UIColor)footerButtonColor
{
  return self->_footerButtonColor;
}

- (void)setFooterButtonColor:(id)a3
{
}

- (UIFont)footerButtonFont
{
  return self->_footerButtonFont;
}

- (void)setFooterButtonFont:(id)a3
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

- (unint64_t)imageStyle
{
  return self->_imageStyle;
}

- (void)setImageStyle:(unint64_t)a3
{
  self->_imageStyle = a3;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (void)setImageSymbolConfiguration:(id)a3
{
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
}

- (int64_t)impressionAnimationStyle
{
  return self->_impressionAnimationStyle;
}

- (void)setImpressionAnimationStyle:(int64_t)a3
{
  self->_impressionAnimationStyle = a3;
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
  objc_storeStrong((id *)&self->_footerButtonFont, 0);
  objc_storeStrong((id *)&self->_footerButtonColor, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryButtonFont, 0);
  objc_storeStrong((id *)&self->_accessoryButtonColor, 0);
}

@end