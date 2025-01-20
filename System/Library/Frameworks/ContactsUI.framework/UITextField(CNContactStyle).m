@interface UITextField(CNContactStyle)
- (void)_cnui_applyContactStyle;
@end

@implementation UITextField(CNContactStyle)

- (void)_cnui_applyContactStyle
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "_cnui_contactStyle");
  v3 = [v2 placeholderTextColor];
  v4 = [v2 textColor];

  if (v4)
  {
    if ([a1 isEnabled]) {
      [v2 textColor];
    }
    else {
    v5 = [v2 readOnlyTextColor];
    }
    [a1 setTextColor:v5];
  }
  if ([v2 keyboardAppearance]) {
    objc_msgSend(a1, "setKeyboardAppearance:", objc_msgSend(v2, "keyboardAppearance"));
  }
  if (!v3)
  {
    v3 = [v2 textColor];

    if (v3)
    {
      double v14 = 0.0;
      double v15 = 0.0;
      double v12 = 0.0;
      double v13 = 0.0;
      v6 = [a1 textColor];
      [v6 getRed:&v15 green:&v14 blue:&v13 alpha:&v12];

      v3 = [MEMORY[0x1E4FB1618] colorWithRed:v15 green:v14 blue:v13 alpha:v12 * 0.5];
    }
  }
  v7 = [a1 placeholder];

  if (v7 && v3)
  {
    uint64_t v16 = *MEMORY[0x1E4FB0700];
    v17[0] = v3;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v9 = objc_alloc(MEMORY[0x1E4F28E48]);
    v10 = [a1 placeholder];
    v11 = (void *)[v9 initWithString:v10 attributes:v8];
    [a1 setAttributedPlaceholder:v11];
  }
}

@end