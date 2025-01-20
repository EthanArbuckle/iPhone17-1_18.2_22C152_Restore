@interface UILabel(CNContactStyle)
- (void)_cnui_applyContactStyle;
- (void)_cnui_applyContactStylePlaceholder;
@end

@implementation UILabel(CNContactStyle)

- (void)_cnui_applyContactStylePlaceholder
{
  v2 = objc_msgSend(a1, "_cnui_contactStyle");
  v3 = [v2 placeholderTextColor];
  if (!v3)
  {
    v3 = [v2 textColor];

    if (v3)
    {
      double v7 = 0.0;
      double v8 = 0.0;
      double v5 = 0.0;
      double v6 = 0.0;
      v4 = [a1 textColor];
      [v4 getRed:&v8 green:&v7 blue:&v6 alpha:&v5];

      v3 = [MEMORY[0x1E4FB1618] colorWithRed:v8 green:v7 blue:v6 alpha:v5 * 0.5];
    }
  }
  [a1 setTextColor:v3];
}

- (void)_cnui_applyContactStyle
{
  objc_msgSend(a1, "_cnui_contactStyle");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v7 textColor];

  if (v2)
  {
    v3 = [v7 textColor];
    [a1 setTextColor:v3];
  }
  v4 = [v7 highlightedTextColor];

  if (v4)
  {
    double v5 = [v7 highlightedTextColor];
    [a1 setHighlightedTextColor:v5];
  }
  double v6 = [MEMORY[0x1E4FB1618] clearColor];
  [a1 setBackgroundColor:v6];
}

@end