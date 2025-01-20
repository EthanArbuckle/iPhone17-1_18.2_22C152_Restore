@interface UIFont(BaseBoardUIAdditions)
+ (id)bsui_defaultFontForTextStyle:()BaseBoardUIAdditions hiFontStyle:;
+ (id)bsui_preferredFontForTextStyle:()BaseBoardUIAdditions hiFontStyle:;
+ (id)bsui_preferredFontForTextStyle:()BaseBoardUIAdditions hiFontStyle:contentSizeCategory:;
@end

@implementation UIFont(BaseBoardUIAdditions)

+ (id)bsui_defaultFontForTextStyle:()BaseBoardUIAdditions hiFontStyle:
{
  v4 = +[UIFont bsui_defaultFont:forTextStyle:hiFontStyle:contentSizeCategory:](MEMORY[0x1E4F42A30], 1, a3, a4, 0);

  return v4;
}

+ (id)bsui_preferredFontForTextStyle:()BaseBoardUIAdditions hiFontStyle:
{
  v4 = +[UIFont bsui_defaultFont:forTextStyle:hiFontStyle:contentSizeCategory:](MEMORY[0x1E4F42A30], 0, a3, a4, 0);

  return v4;
}

+ (id)bsui_preferredFontForTextStyle:()BaseBoardUIAdditions hiFontStyle:contentSizeCategory:
{
  v5 = +[UIFont bsui_defaultFont:forTextStyle:hiFontStyle:contentSizeCategory:](MEMORY[0x1E4F42A30], 0, a3, a4, a5);

  return v5;
}

@end