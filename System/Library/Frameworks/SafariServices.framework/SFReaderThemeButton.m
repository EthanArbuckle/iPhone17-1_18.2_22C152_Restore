@interface SFReaderThemeButton
- (BOOL)canBecomeFocused;
- (id)focusEffect;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation SFReaderThemeButton

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (SFShouldHandleSelectionForPresses())
  {
    [(SFReaderThemeButton *)self sendActionsForControlEvents:0x2000];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFReaderThemeButton;
    [(SFReaderThemeButton *)&v8 pressesBegan:v6 withEvent:v7];
  }
}

- (id)focusEffect
{
  v2 = (void *)MEMORY[0x1E4FB1788];
  v3 = (void *)MEMORY[0x1E4FB14C0];
  [(SFReaderThemeButton *)self bounds];
  v4 = objc_msgSend(v3, "bezierPathWithOvalInRect:");
  v5 = [v2 effectWithPath:v4];

  return v5;
}

@end