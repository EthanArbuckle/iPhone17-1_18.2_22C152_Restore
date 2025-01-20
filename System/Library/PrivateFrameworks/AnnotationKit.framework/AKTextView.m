@interface AKTextView
- (AKTextViewKeyCommandDelegate)keyCommandDelegate;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isBlockedAction:(SEL)a3;
- (id)keyCommands;
- (id)textInputTraits;
- (int64_t)maximumNumberOfCharacters;
- (void)handleBackTabCommand:(id)a3;
- (void)handleTabCommand:(id)a3;
- (void)motionEnded:(int64_t)a3 withEvent:(id)a4;
- (void)setKeyCommandDelegate:(id)a3;
- (void)setMaximumNumberOfCharacters:(int64_t)a3;
@end

@implementation AKTextView

- (id)keyCommands
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F1C708] keyCommandWithInput:@"\t" modifierFlags:0 action:sel_handleTabCommand_];
  v6[0] = v2;
  v3 = [MEMORY[0x263F1C708] keyCommandWithInput:@"\t" modifierFlags:0x20000 action:sel_handleBackTabCommand_];
  v6[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

- (void)handleTabCommand:(id)a3
{
  id v3 = [(AKTextView *)self keyCommandDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 handleTabCommand];
  }
}

- (void)handleBackTabCommand:(id)a3
{
  id v3 = [(AKTextView *)self keyCommandDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 handleBackTabCommand];
  }
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v6 = a4;
  if (a3 != 1)
  {
    v8.receiver = self;
    v8.super_class = (Class)AKTextView;
    if ([(AKTextView *)&v8 respondsToSelector:sel_motionEnded_withEvent_])
    {
      v7.receiver = self;
      v7.super_class = (Class)AKTextView;
      [(AKTextView *)&v7 motionEnded:a3 withEvent:v6];
    }
  }
}

- (BOOL)canBecomeFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)AKTextView;
  BOOL v3 = [(AKTextView *)&v5 canBecomeFirstResponder];
  [(AKTextView *)self setAutocorrectionType:sub_237688C78()];
  [(AKTextView *)self setSpellCheckingType:sub_237688C78()];
  return v3;
}

- (id)textInputTraits
{
  v2 = [MEMORY[0x263F1CAA8] defaultTextInputTraits];
  if (sub_237688C78())
  {
    [v2 setShortcutConversionType:1];
    [v2 setDisablePrediction:1];
    [v2 setHidePrediction:1];
  }

  return v2;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ([(AKTextView *)self isBlockedAction:a3])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AKTextView;
    BOOL v7 = [(AKTextView *)&v9 canPerformAction:a3 withSender:v6];
  }

  return v7;
}

- (BOOL)isBlockedAction:(SEL)a3
{
  int v4 = [(AKTextView *)self isFirstResponder];
  if (v4)
  {
    int v4 = sub_237688C78();
    if (v4) {
      LOBYTE(v4) = sel_cut_ == a3 || sel_copy_ == a3 || sel_paste_ == a3;
    }
  }
  return v4;
}

- (int64_t)maximumNumberOfCharacters
{
  return self->_maximumNumberOfCharacters;
}

- (void)setMaximumNumberOfCharacters:(int64_t)a3
{
  self->_maximumNumberOfCharacters = a3;
}

- (AKTextViewKeyCommandDelegate)keyCommandDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyCommandDelegate);

  return (AKTextViewKeyCommandDelegate *)WeakRetained;
}

- (void)setKeyCommandDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end