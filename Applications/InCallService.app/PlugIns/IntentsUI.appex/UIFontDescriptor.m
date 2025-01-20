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
  if (qword_1000A20C8 != -1) {
    dispatch_once(&qword_1000A20C8, &stru_10008D6E8);
  }
  v2 = (void *)qword_1000A20C0;

  return v2;
}

+ (id)voicemailCaptionRegularFontDescriptor
{
  if (qword_1000A20D8 != -1) {
    dispatch_once(&qword_1000A20D8, &stru_10008D708);
  }
  v2 = (void *)qword_1000A20D0;

  return v2;
}

@end