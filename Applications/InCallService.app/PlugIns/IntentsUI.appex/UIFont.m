@interface UIFont
+ (id)_thinSystemFontWithDialerCharacteristicsOfSize:(double)a3;
+ (id)phPreferredBoldFontForTextStyle:(id)a3;
+ (id)phPreferredFontForTextStyle:(id)a3;
+ (id)phPreferredItalicFontForTextStyle:(id)a3;
+ (id)phPreferredTightLeadingFontForTextStyle:(id)a3;
+ (id)voicemailCaptionRegularFont;
+ (id)voicemailFootnoteFont;
+ (id)voicemailHeadlineShortFont;
- (UIFont)withCaseSensitiveAttribute;
@end

@implementation UIFont

+ (id)phPreferredFontForTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor phPreferredFontDescriptorForTextStyle:a3];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)phPreferredBoldFontForTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor phPreferredFontDescriptorForTextStyle:a3 addingSymbolicTraits:2];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)phPreferredItalicFontForTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor phPreferredFontDescriptorForTextStyle:a3 addingSymbolicTraits:1];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)phPreferredTightLeadingFontForTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor phPreferredFontDescriptorForTextStyle:a3 addingSymbolicTraits:0x8000];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)_thinSystemFontWithDialerCharacteristicsOfSize:(double)a3
{
  v3 = +[UIFont _thinSystemFontOfSize:a3];
  v4 = [v3 withCaseSensitiveAttribute];

  return v4;
}

+ (id)voicemailFootnoteFont
{
  if (qword_1000A2108 != -1) {
    dispatch_once(&qword_1000A2108, &stru_10008D838);
  }
  v2 = (void *)qword_1000A2100;

  return v2;
}

+ (id)voicemailHeadlineShortFont
{
  if (qword_1000A2118 != -1) {
    dispatch_once(&qword_1000A2118, &stru_10008D858);
  }
  v2 = (void *)qword_1000A2110;

  return v2;
}

+ (id)voicemailCaptionRegularFont
{
  if (qword_1000A2128 != -1) {
    dispatch_once(&qword_1000A2128, &stru_10008D878);
  }
  v2 = (void *)qword_1000A2120;

  return v2;
}

- (UIFont)withCaseSensitiveAttribute
{
  UIFontDescriptorAttributeName v13 = UIFontDescriptorFeatureSettingsAttribute;
  v10[0] = UIFontFeatureTypeIdentifierKey;
  v10[1] = UIFontFeatureSelectorIdentifierKey;
  v11[0] = &off_100090560;
  v11[1] = &off_100090578;
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