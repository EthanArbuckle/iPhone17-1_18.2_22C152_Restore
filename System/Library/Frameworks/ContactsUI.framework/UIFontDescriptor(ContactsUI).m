@interface UIFontDescriptor(ContactsUI)
+ (uint64_t)cnui_bodyFontDescriptor;
+ (uint64_t)cnui_footnoteFontDescriptor;
@end

@implementation UIFontDescriptor(ContactsUI)

+ (uint64_t)cnui_footnoteFontDescriptor
{
  return [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0]];
}

+ (uint64_t)cnui_bodyFontDescriptor
{
  return [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
}

@end