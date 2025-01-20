@interface SFAutomaticPasswordInputView
- (BOOL)allowsSelfSizing;
- (BOOL)shouldAllowSelfSizing;
- (CGSize)intrinsicContentSize;
- (SFAutomaticPasswordInputView)initWithInputViewStyle:(int64_t)a3 keyboardType:(int64_t)a4;
- (SFAutomaticPasswordInputViewDelegate)delegate;
- (SFAutomaticPasswordInputViewSizing)inputViewSizing;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (void)_useStrongPasswordButtonAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInputViewSizing:(id)a3;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)setShouldAllowSelfSizing:(BOOL)a3;
@end

@implementation SFAutomaticPasswordInputView

- (SFAutomaticPasswordInputView)initWithInputViewStyle:(int64_t)a3 keyboardType:(int64_t)a4
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)SFAutomaticPasswordInputView;
  v5 = -[UIInputView initWithFrame:inputViewStyle:](&v26, sel_initWithFrame_inputViewStyle_, a3, 0.0, 0.0, 100.0, 100.0);
  v6 = v5;
  if (v5)
  {
    v5->_keyboardType = a4;
    v7 = [[SFAutomaticPasswordExplanationView alloc] initWithKeyboardType:v5->_keyboardType];
    explanationView = v6->_explanationView;
    v6->_explanationView = v7;

    [(SFAutomaticPasswordExplanationView *)v6->_explanationView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFAutomaticPasswordInputView *)v6 addSubview:v6->_explanationView];
    v9 = [(SFAutomaticPasswordExplanationView *)v6->_explanationView useStrongPasswordButton];
    [v9 addTarget:v6 action:sel__useStrongPasswordButtonAction_ forControlEvents:0x2000];

    v21 = (void *)MEMORY[0x1E4F28DC8];
    v25 = [(SFAutomaticPasswordExplanationView *)v6->_explanationView topAnchor];
    v24 = [(SFAutomaticPasswordInputView *)v6 topAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v27[0] = v23;
    v22 = [(SFAutomaticPasswordExplanationView *)v6->_explanationView leadingAnchor];
    v10 = [(SFAutomaticPasswordInputView *)v6 leadingAnchor];
    v11 = [v22 constraintEqualToAnchor:v10];
    v27[1] = v11;
    v12 = [(SFAutomaticPasswordExplanationView *)v6->_explanationView trailingAnchor];
    v13 = [(SFAutomaticPasswordInputView *)v6 trailingAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v27[2] = v14;
    v15 = [(SFAutomaticPasswordExplanationView *)v6->_explanationView bottomAnchor];
    v16 = [(SFAutomaticPasswordInputView *)v6 bottomAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v27[3] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
    [v21 activateConstraints:v18];

    [(SFAutomaticPasswordInputView *)v6 setAccessibilityIdentifier:@"SFAutomaticPasswordInputView"];
    v19 = v6;
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = [obj inputViewControllerOtherOptionsMenu:self];
    v6 = [(SFAutomaticPasswordExplanationView *)self->_explanationView useOtherPasswordButton];
    [v6 setMenu:v5];

    v7 = [(SFAutomaticPasswordExplanationView *)self->_explanationView useOtherPasswordButton];
    [v7 setShowsMenuAsPrimaryAction:1];
  }
}

- (void)setKeyboardAppearance:(int64_t)a3
{
}

- (int64_t)keyboardAppearance
{
  return [(SFAutomaticPasswordExplanationView *)self->_explanationView keyboardAppearance];
}

- (void)_useStrongPasswordButtonAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained inputViewControllerDidSelectUseStrongPassword:self];
  }
}

- (CGSize)intrinsicContentSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputViewSizing);
  v4 = WeakRetained;
  if (!self->_shouldAllowSelfSizing || WeakRetained == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)SFAutomaticPasswordInputView;
    [(SFAutomaticPasswordInputView *)&v12 intrinsicContentSize];
  }
  else
  {
    [WeakRetained intrinsicContentSizeForInputView:self];
  }
  double v8 = v6;
  double v9 = v7;

  double v10 = v8;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)allowsSelfSizing
{
  return self->_shouldAllowSelfSizing;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (SFAutomaticPasswordInputViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFAutomaticPasswordInputViewDelegate *)WeakRetained;
}

- (SFAutomaticPasswordInputViewSizing)inputViewSizing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputViewSizing);

  return (SFAutomaticPasswordInputViewSizing *)WeakRetained;
}

- (void)setInputViewSizing:(id)a3
{
}

- (BOOL)shouldAllowSelfSizing
{
  return self->_shouldAllowSelfSizing;
}

- (void)setShouldAllowSelfSizing:(BOOL)a3
{
  self->_shouldAllowSelfSizing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputViewSizing);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_explanationView, 0);
}

@end