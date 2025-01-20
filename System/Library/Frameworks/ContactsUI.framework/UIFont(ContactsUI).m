@interface UIFont(ContactsUI)
+ (id)cnui_bodyFont;
+ (id)cnui_footnoteFont;
@end

@implementation UIFont(ContactsUI)

+ (id)cnui_footnoteFont
{
  v0 = (void *)MEMORY[0x1E4FB08E0];
  v1 = objc_msgSend(MEMORY[0x1E4FB08E8], "cnui_footnoteFontDescriptor");
  v2 = [v0 fontWithDescriptor:v1 size:0.0];

  return v2;
}

+ (id)cnui_bodyFont
{
  v0 = (void *)MEMORY[0x1E4FB08E0];
  v1 = objc_msgSend(MEMORY[0x1E4FB08E8], "cnui_bodyFontDescriptor");
  v2 = [v0 fontWithDescriptor:v1 size:0.0];

  return v2;
}

@end