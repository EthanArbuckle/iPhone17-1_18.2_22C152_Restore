@interface UIFont(MCUI)
+ (id)MCUIBoldTitleFontWithSize:()MCUI;
@end

@implementation UIFont(MCUI)

+ (id)MCUIBoldTitleFontWithSize:()MCUI
{
  v2 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438E0]];
  v3 = (void *)MEMORY[0x1E4F42A30];
  v4 = [v2 fontDescriptorWithSymbolicTraits:2];
  v5 = [v3 fontWithDescriptor:v4 size:a1];

  return v5;
}

@end