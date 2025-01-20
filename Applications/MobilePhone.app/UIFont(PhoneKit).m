@interface UIFont(PhoneKit)
- (UIFont)withCaseSensitiveAttribute;
@end

@implementation UIFont(PhoneKit)

- (UIFont)withCaseSensitiveAttribute
{
  UIFontDescriptorAttributeName v13 = UIFontDescriptorFeatureSettingsAttribute;
  v10[0] = UIFontFeatureTypeIdentifierKey;
  v10[1] = UIFontFeatureSelectorIdentifierKey;
  v11[0] = &off_10028CE00;
  v11[1] = &off_10028CE18;
  v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v12 = v3;
  v4 = +[NSArray arrayWithObjects:&v12 count:1];
  v14 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  v6 = [(UIFont *)self fontDescriptor];
  v7 = [v6 fontDescriptorByAddingAttributes:v5];

  v8 = +[UIFont fontWithDescriptor:v7 size:0.0];

  return (UIFont *)v8;
}

@end