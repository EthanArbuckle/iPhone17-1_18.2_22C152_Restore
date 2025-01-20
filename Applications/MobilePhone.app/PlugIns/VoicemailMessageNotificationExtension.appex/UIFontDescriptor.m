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
  if (qword_1000695A8 != -1) {
    dispatch_once(&qword_1000695A8, &stru_10005D480);
  }
  v2 = (void *)qword_1000695A0;

  return v2;
}

+ (id)voicemailCaptionRegularFontDescriptor
{
  if (qword_1000695B8 != -1) {
    dispatch_once(&qword_1000695B8, &stru_10005D4A0);
  }
  v2 = (void *)qword_1000695B0;

  return v2;
}

@end