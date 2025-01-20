@interface UIFont
+ (id)_thinSystemFontWithDialerCharacteristicsOfSize:(double)a3;
+ (id)phPreferredBoldFontForTextStyle:(id)a3;
+ (id)phPreferredFontForTextStyle:(id)a3;
+ (id)phPreferredItalicFontForTextStyle:(id)a3;
+ (id)phPreferredTightLeadingFontForTextStyle:(id)a3;
+ (id)preferredBoldFontWithTextStyle:(id)a3;
+ (id)preferredCaption1BoldFont;
+ (id)preferredCaption1Font;
+ (id)preferredFontWithTextStyle:(id)a3;
+ (id)preferredItalicFontWithTextStyle:(id)a3;
+ (id)preferredSubheadline1Font;
+ (id)preferredTightLeadingWithForTextStyle:(id)a3;
+ (id)voicemailCaptionRegularFont;
+ (id)voicemailFootnoteFont;
+ (id)voicemailHeadlineShortFont;
- (UIFont)withCaseSensitiveAttribute;
@end

@implementation UIFont

- (UIFont)withCaseSensitiveAttribute
{
  UIFontDescriptorAttributeName v13 = UIFontDescriptorFeatureSettingsAttribute;
  v10[0] = UIFontFeatureTypeIdentifierKey;
  v10[1] = UIFontFeatureSelectorIdentifierKey;
  v11[0] = &off_10028CE30;
  v11[1] = &off_10028CE48;
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

+ (id)preferredCaption1Font
{
  return [a1 preferredFontWithTextStyle:UIFontTextStyleCaption1];
}

+ (id)preferredCaption1BoldFont
{
  return [a1 preferredBoldFontWithTextStyle:UIFontTextStyleCaption1];
}

+ (id)preferredSubheadline1Font
{
  return [a1 preferredFontWithTextStyle:UIFontTextStyleSubheadline1];
}

+ (id)preferredFontWithTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:0 options:1];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)preferredBoldFontWithTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:2 options:1];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)preferredItalicFontWithTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:1 options:1];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)preferredTightLeadingWithForTextStyle:(id)a3
{
  v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:0x8000 options:1];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v5 = [v4 withCaseSensitiveAttribute];

  return v5;
}

+ (id)voicemailFootnoteFont
{
  if (voicemailFootnoteFont_onceToken != -1) {
    dispatch_once(&voicemailFootnoteFont_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)voicemailFootnoteFont_sFont;

  return v2;
}

void __44__UIFont_VoicemailUI__voicemailFootnoteFont__block_invoke(id a1)
{
  id v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  uint64_t v1 = [v3 withCaseSensitiveAttribute];
  v2 = (void *)voicemailFootnoteFont_sFont;
  voicemailFootnoteFont_sFont = v1;
}

+ (id)voicemailHeadlineShortFont
{
  if (voicemailHeadlineShortFont_onceToken != -1) {
    dispatch_once(&voicemailHeadlineShortFont_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)voicemailHeadlineShortFont_sFont;

  return v2;
}

void __49__UIFont_VoicemailUI__voicemailHeadlineShortFont__block_invoke(id a1)
{
  id v3 = +[UIFontDescriptor voicemailHeadlineShortFontDescriptor];
  uint64_t v1 = +[UIFont fontWithDescriptor:v3 size:0.0];
  v2 = (void *)voicemailHeadlineShortFont_sFont;
  voicemailHeadlineShortFont_sFont = v1;
}

+ (id)voicemailCaptionRegularFont
{
  if (voicemailCaptionRegularFont_onceToken != -1) {
    dispatch_once(&voicemailCaptionRegularFont_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)voicemailCaptionRegularFont_sFont;

  return v2;
}

void __50__UIFont_VoicemailUI__voicemailCaptionRegularFont__block_invoke(id a1)
{
  id v4 = +[UIFontDescriptor voicemailCaptionRegularFontDescriptor];
  uint64_t v1 = +[UIFont fontWithDescriptor:v4 size:0.0];
  uint64_t v2 = [v1 withCaseSensitiveAttribute];
  id v3 = (void *)voicemailCaptionRegularFont_sFont;
  voicemailCaptionRegularFont_sFont = v2;
}

@end