@interface PDFTextWidgetTextView
- (id)accessibilityLabel;
- (id)accessibilityParent;
- (id)accessibilityTitleUIElement;
- (id)keyCommands;
- (void)autoFillDidInsertWithExplicitInvocationMode:(BOOL)a3;
- (void)handleBackTab;
- (void)handleTab;
@end

@implementation PDFTextWidgetTextView

- (id)keyCommands
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F82890] keyCommandWithInput:@"\t" modifierFlags:0 action:sel_handleTab];
  v6[0] = v2;
  v3 = [MEMORY[0x263F82890] keyCommandWithInput:@"\t" modifierFlags:0x20000 action:sel_handleBackTab];
  v6[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

- (void)handleTab
{
  id v2 = [(PDFTextWidgetTextView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 handleTab];
  }
}

- (void)handleBackTab
{
  id v2 = [(PDFTextWidgetTextView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 handleBackTab];
  }
}

- (void)autoFillDidInsertWithExplicitInvocationMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PDFTextWidgetTextView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 autoFillDidInsertWithExplicitInvocationMode:v3];
  }
}

- (id)accessibilityParent
{
  id v2 = [(PDFTextWidgetTextView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [v2 accessibilityParent];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)accessibilityLabel
{
  id v2 = [(PDFTextWidgetTextView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [v2 accessibilityLabel];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)accessibilityTitleUIElement
{
  id v2 = [(PDFTextWidgetTextView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [v2 accessibilityTitleUIElement];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

@end