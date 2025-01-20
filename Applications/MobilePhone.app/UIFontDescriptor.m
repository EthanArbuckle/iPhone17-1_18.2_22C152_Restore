@interface UIFontDescriptor
+ (id)phPreferredFontDescriptorForTextStyle:(id)a3;
+ (id)phPreferredFontDescriptorForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4;
+ (id)voicemailCaptionRegularFontDescriptor;
+ (id)voicemailHeadlineShortFontDescriptor;
@end

@implementation UIFontDescriptor

+ (id)phPreferredFontDescriptorForTextStyle:(id)a3
{
  return [a1 phPreferredFontDescriptorForTextStyle:a3 addingSymbolicTraits:0];
}

+ (id)phPreferredFontDescriptorForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4
{
  return +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:*(void *)&a4 options:1];
}

+ (id)voicemailHeadlineShortFontDescriptor
{
  if (voicemailHeadlineShortFontDescriptor_onceToken != -1) {
    dispatch_once(&voicemailHeadlineShortFontDescriptor_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)voicemailHeadlineShortFontDescriptor_sFontDescriptor;

  return v2;
}

void __69__UIFontDescriptor_VoicemailUI__voicemailHeadlineShortFontDescriptor__block_invoke(id a1)
{
  uint64_t v1 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline addingSymbolicTraits:0x8000 options:0];
  uint64_t v2 = voicemailHeadlineShortFontDescriptor_sFontDescriptor;
  voicemailHeadlineShortFontDescriptor_sFontDescriptor = v1;

  _objc_release_x1(v1, v2);
}

+ (id)voicemailCaptionRegularFontDescriptor
{
  if (voicemailCaptionRegularFontDescriptor_onceToken != -1) {
    dispatch_once(&voicemailCaptionRegularFontDescriptor_onceToken, &__block_literal_global_42_2);
  }
  uint64_t v2 = (void *)voicemailCaptionRegularFontDescriptor_sFontDescriptor;

  return v2;
}

void __70__UIFontDescriptor_VoicemailUI__voicemailCaptionRegularFontDescriptor__block_invoke(id a1)
{
  uint64_t v1 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCaption2 addingSymbolicTraits:0x8000 options:0];
  uint64_t v2 = voicemailCaptionRegularFontDescriptor_sFontDescriptor;
  voicemailCaptionRegularFontDescriptor_sFontDescriptor = v1;

  _objc_release_x1(v1, v2);
}

@end