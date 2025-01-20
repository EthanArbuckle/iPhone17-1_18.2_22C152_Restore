@interface UIFontDescriptor
+ (id)phPreferredFontDescriptorForTextStyle:(id)a3;
+ (id)phPreferredFontDescriptorForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4;
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

@end