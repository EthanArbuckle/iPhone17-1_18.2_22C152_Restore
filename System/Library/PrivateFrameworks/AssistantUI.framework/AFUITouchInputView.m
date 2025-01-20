@interface AFUITouchInputView
- (AFUITouchInputViewDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation AFUITouchInputView

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = [(AFUITouchInputView *)self delegate];
  [v5 touchesBeganForInputView:self];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = [(AFUITouchInputView *)self delegate];
  [v5 touchesEndedForInputView:self];
}

- (AFUITouchInputViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AFUITouchInputViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end