@interface PKPaletteDictationBarButton
- (PKPaletteDictationBarButton)initWithBarButtonItem:(id)a3;
- (id)_backgroundColor;
- (id)_tintColorForCurrentState;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PKPaletteDictationBarButton

- (PKPaletteDictationBarButton)initWithBarButtonItem:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaletteDictationBarButton;
  v3 = [(PKPaletteBarButton *)&v6 initWithBarButtonItem:a3];
  v4 = v3;
  if (v3) {
    [(PKPaletteDictationBarButton *)v3 setAccessibilityIdentifier:@"Scribble-Dictation-Button"];
  }
  return v4;
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaletteDictationBarButton;
  [(PKPaletteDictationBarButton *)&v11 willMoveToWindow:v4];
  if (v4)
  {
    v5 = [v4 windowScene];
    objc_super v6 = [v5 keyboardSceneDelegate];

    if (objc_opt_respondsToSelector())
    {
      int v7 = [v6 hasActiveKeyboardResponder];
    }
    else
    {
      v8 = [MEMORY[0x1E4FB1900] activeInstance];
      v9 = [v8 inputDelegate];
      int v7 = v9 != 0;
    }
    if (objc_opt_respondsToSelector()) {
      int v10 = [v6 hasNullInputView] ^ 1;
    }
    else {
      int v10 = 1;
    }
    [(PKPaletteButton *)self setEnabled:v7 & v10];
    if (qword_1EB3C5EC8 != -1) {
      dispatch_once(&qword_1EB3C5EC8, &__block_literal_global_23);
    }
    -[PKPaletteButton setSelected:](self, "setSelected:", [ (id) _MergedGlobals_123 isRunning]);
  }
}

- (id)_tintColorForCurrentState
{
  if ([(PKPaletteDictationBarButton *)self isSelected])
  {
    v3 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_paletteBackgroundColor");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteDictationBarButton;
    v3 = [(PKPaletteButton *)&v5 _tintColorForCurrentState];
  }

  return v3;
}

- (id)_backgroundColor
{
  if ([(PKPaletteButton *)self useCompactLayout]
    || ([(PKPaletteDictationBarButton *)self isSelected] & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteDictationBarButton;
    v3 = [(PKPaletteButton *)&v5 _backgroundColor];
  }
  else
  {
    v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }

  return v3;
}

@end