@interface UITextView(CNContactStyle)
- (void)_cnui_applyContactStyle;
@end

@implementation UITextView(CNContactStyle)

- (void)_cnui_applyContactStyle
{
  objc_msgSend(a1, "_cnui_contactStyle");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v5 textColor];

  if (v2)
  {
    v3 = [v5 textColor];
    [a1 setTextColor:v3];
  }
  if ([v5 keyboardAppearance]) {
    objc_msgSend(a1, "setKeyboardAppearance:", objc_msgSend(v5, "keyboardAppearance"));
  }
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [a1 setBackgroundColor:v4];
}

@end