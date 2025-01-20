@interface AIAudiogramKeyboardToolbar
- (AIAudiogramKeyboardToolbar)initWithFrame:(CGRect)a3 target:(id)a4;
- (UIBarButtonItem)nextItemButton;
- (UIBarButtonItem)previousItemButton;
- (void)setNextItemButton:(id)a3;
- (void)setPreviousItemButton:(id)a3;
@end

@implementation AIAudiogramKeyboardToolbar

- (AIAudiogramKeyboardToolbar)initWithFrame:(CGRect)a3 target:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v29[7] = *MEMORY[0x263EF8340];
  id v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AIAudiogramKeyboardToolbar;
  v10 = -[AIAudiogramKeyboardToolbar initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:10.0];
    v12 = [MEMORY[0x263F824A8] flexibleSpaceItem];
    v13 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v9 action:sel_keyboardDoneTapped];
    id v14 = objc_alloc(MEMORY[0x263F824A8]);
    v15 = [MEMORY[0x263F827E8] systemImageNamed:@"plus.slash.minus"];
    v16 = (void *)[v14 initWithImage:v15 style:0 target:v9 action:sel_keyboardNegationTapped];

    v17 = aiLocString(@"AudiogramIngestionResultsNegateDecibel");
    [v16 setAccessibilityLabel:v17];

    id v18 = objc_alloc(MEMORY[0x263F824A8]);
    v19 = [MEMORY[0x263F827E8] systemImageNamed:@"chevron.up"];
    v20 = (void *)[v18 initWithImage:v19 style:0 target:v9 action:sel_keyboardPreviousTapped];
    [(AIAudiogramKeyboardToolbar *)v10 setPreviousItemButton:v20];

    id v21 = objc_alloc(MEMORY[0x263F824A8]);
    v22 = [MEMORY[0x263F827E8] systemImageNamed:@"chevron.down"];
    v23 = (void *)[v21 initWithImage:v22 style:0 target:v9 action:sel_keyboardNextTapped];
    [(AIAudiogramKeyboardToolbar *)v10 setNextItemButton:v23];

    v24 = [(AIAudiogramKeyboardToolbar *)v10 previousItemButton];
    v29[0] = v24;
    v29[1] = v11;
    v25 = [(AIAudiogramKeyboardToolbar *)v10 nextItemButton];
    v29[2] = v25;
    v29[3] = v11;
    v29[4] = v16;
    v29[5] = v12;
    v29[6] = v13;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:7];
    [(AIAudiogramKeyboardToolbar *)v10 setItems:v26];
  }
  return v10;
}

- (UIBarButtonItem)previousItemButton
{
  return self->_previousItemButton;
}

- (void)setPreviousItemButton:(id)a3
{
}

- (UIBarButtonItem)nextItemButton
{
  return self->_nextItemButton;
}

- (void)setNextItemButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextItemButton, 0);
  objc_storeStrong((id *)&self->_previousItemButton, 0);
}

@end