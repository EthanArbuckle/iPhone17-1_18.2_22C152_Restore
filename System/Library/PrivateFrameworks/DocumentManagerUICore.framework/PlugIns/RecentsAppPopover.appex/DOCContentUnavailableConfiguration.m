@interface DOCContentUnavailableConfiguration
+ (Class)implClass;
+ (id)emptyConfiguration;
+ (id)emptyExtraProminentConfiguration;
+ (id)emptyProminentConfiguration;
+ (id)loadingConfiguration;
+ (id)searchConfiguration;
- (DOCContentUnavailableButtonProperties)buttonProperties;
- (NSString)secondaryText;
- (NSString)text;
- (UIColor)textColor;
- (UIImage)image;
- (id)asUIKit;
- (id)makeContentView;
- (id)updatedConfigurationForState:(id)a3;
- (void)setImage:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation DOCContentUnavailableConfiguration

+ (Class)implClass
{
  return (Class)objc_opt_class();
}

- (id)asUIKit
{
  return self->super._impl;
}

+ (id)emptyConfiguration
{
  v2 = +[UIContentUnavailableConfiguration emptyConfiguration];
  v3 = [v2 asDOC];

  return v3;
}

+ (id)emptyProminentConfiguration
{
  v2 = +[UIContentUnavailableConfiguration emptyProminentConfiguration];
  v3 = [v2 asDOC];

  return v3;
}

+ (id)emptyExtraProminentConfiguration
{
  v2 = +[UIContentUnavailableConfiguration emptyExtraProminentConfiguration];
  v3 = [v2 asDOC];

  return v3;
}

+ (id)loadingConfiguration
{
  v2 = +[UIContentUnavailableConfiguration loadingConfiguration];
  v3 = [v2 asDOC];

  return v3;
}

+ (id)searchConfiguration
{
  v2 = +[UIContentUnavailableConfiguration searchConfiguration];
  v3 = [v2 asDOC];

  return v3;
}

- (UIImage)image
{
  v2 = [(DOCContentUnavailableConfiguration *)self asUIKit];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(DOCContentUnavailableConfiguration *)self asUIKit];
  [v5 setImage:v4];
}

- (UIColor)textColor
{
  v2 = [(DOCContentUnavailableConfiguration *)self asUIKit];
  v3 = [v2 textProperties];
  id v4 = [v3 color];

  return (UIColor *)v4;
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  id v6 = [(DOCContentUnavailableConfiguration *)self asUIKit];
  id v5 = [v6 textProperties];
  [v5 setColor:v4];
}

- (NSString)text
{
  v2 = [(DOCContentUnavailableConfiguration *)self asUIKit];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(DOCContentUnavailableConfiguration *)self asUIKit];
  [v5 setText:v4];
}

- (NSString)secondaryText
{
  v2 = [(DOCContentUnavailableConfiguration *)self asUIKit];
  v3 = [v2 secondaryText];

  return (NSString *)v3;
}

- (void)setSecondaryText:(id)a3
{
  id v4 = a3;
  id v5 = [(DOCContentUnavailableConfiguration *)self asUIKit];
  [v5 setSecondaryText:v4];
}

- (DOCContentUnavailableButtonProperties)buttonProperties
{
  v2 = [(DOCContentUnavailableConfiguration *)self asUIKit];
  v3 = [v2 buttonProperties];
  id v4 = [v3 asDOC];

  return (DOCContentUnavailableButtonProperties *)v4;
}

- (id)makeContentView
{
  v2 = [(DOCContentUnavailableConfiguration *)self asUIKit];
  v3 = [v2 makeContentView];

  return v3;
}

- (id)updatedConfigurationForState:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(DOCContentUnavailableConfiguration *)self asUIKit];
  v7 = [v6 updatedConfigurationForState:v4];

  v8 = [v5 instanceWrappingImpl:v7];

  return v8;
}

@end