@interface CPUIButton
+ (id)buttonWithType:(int64_t)a3;
- (CPUIButtonDelegate)cpui_delegate;
- (UITapGestureRecognizer)pressTapRecognizer;
- (UITapGestureRecognizer)touchTapRecognizer;
- (void)_addGestureRecognizers;
- (void)_buttonPressed:(id)a3;
- (void)_buttonTapped:(id)a3;
- (void)didMoveToWindow;
- (void)setCpui_delegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPressTapRecognizer:(id)a3;
- (void)setTouchTapRecognizer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPUIButton

+ (id)buttonWithType:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CPUIButton;
  v3 = objc_msgSendSuper2(&v5, sel_buttonWithType_, a3);
  [v3 _addGestureRecognizers];
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CPUIButton;
  [(CPUIButton *)&v6 traitCollectionDidChange:a3];
  v4 = [(CPUIButton *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 3)
  {
    [(CPUIButton *)self removeAllGestureRecognizers];
    [(CPUIButton *)self _addGestureRecognizers];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CPUIButton;
  [(CPUIButton *)&v3 didMoveToWindow];
  [(CPUIButton *)self removeAllGestureRecognizers];
  [(CPUIButton *)self _addGestureRecognizers];
}

- (void)_addGestureRecognizers
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__buttonPressed_];
  [(CPUIButton *)self setPressTapRecognizer:v3];

  v4 = [(CPUIButton *)self pressTapRecognizer];
  [v4 setAllowedPressTypes:&unk_26DC1F1D8];

  uint64_t v5 = [(CPUIButton *)self pressTapRecognizer];
  objc_msgSend(v5, "setEnabled:", -[CPUIButton isEnabled](self, "isEnabled"));

  objc_super v6 = [(CPUIButton *)self pressTapRecognizer];
  [(CPUIButton *)self addGestureRecognizer:v6];

  v7 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__buttonTapped_];
  [(CPUIButton *)self setTouchTapRecognizer:v7];

  v8 = [(CPUIButton *)self touchTapRecognizer];
  [v8 setAllowedTouchTypes:&unk_26DC1F1F0];

  v9 = [(CPUIButton *)self touchTapRecognizer];
  objc_msgSend(v9, "setEnabled:", -[CPUIButton isEnabled](self, "isEnabled"));

  id v10 = [(CPUIButton *)self touchTapRecognizer];
  [(CPUIButton *)self addGestureRecognizer:v10];
}

- (void)_buttonPressed:(id)a3
{
  v4 = [(CPUIButton *)self cpui_delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CPUIButton *)self cpui_delegate];
    [v6 didSelectButton:self withInteractionModel:2];
  }
}

- (void)_buttonTapped:(id)a3
{
  v4 = [(CPUIButton *)self cpui_delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CPUIButton *)self cpui_delegate];
    [v6 didSelectButton:self withInteractionModel:1];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CPUIButton;
  -[CPUIButton setEnabled:](&v7, sel_setEnabled_);
  char v5 = [(CPUIButton *)self pressTapRecognizer];
  [v5 setEnabled:v3];

  id v6 = [(CPUIButton *)self touchTapRecognizer];
  [v6 setEnabled:v3];
}

- (CPUIButtonDelegate)cpui_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cpui_delegate);
  return (CPUIButtonDelegate *)WeakRetained;
}

- (void)setCpui_delegate:(id)a3
{
}

- (UITapGestureRecognizer)pressTapRecognizer
{
  return self->_pressTapRecognizer;
}

- (void)setPressTapRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)touchTapRecognizer
{
  return self->_touchTapRecognizer;
}

- (void)setTouchTapRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchTapRecognizer, 0);
  objc_storeStrong((id *)&self->_pressTapRecognizer, 0);
  objc_destroyWeak((id *)&self->_cpui_delegate);
}

@end