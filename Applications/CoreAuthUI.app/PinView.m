@interface PinView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasText;
- (BOOL)isSecureTextEntry;
- (BOOL)resignFirstResponder;
- (CGRect)_roundRectToPixel:(CGRect)a3;
- (NSString)title;
- (PinView)initWithPinLength:(id)a3 minLength:(id)a4 maxLength:(id)a5 charset:(id)a6;
- (PinViewDelegate)delegate;
- (UIButton)cancelButton;
- (UIViewController)viewController;
- (double)_roundToPixel:(double)a3;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (int64_t)returnKeyType;
- (int64_t)spellCheckingType;
- (void)_activateKeypadView;
- (void)_deactivateKeypadView;
- (void)_dismissKeypad;
- (void)_layoutSubviewsWithKeyboard:(CGRect)a3;
- (void)dealloc;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)keyboardDidShow:(id)a3;
- (void)layoutSubviews;
- (void)pinEntered:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTitle:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation PinView

- (void)setTitle:(id)a3
{
}

- (PinView)initWithPinLength:(id)a3 minLength:(id)a4 maxLength:(id)a5 charset:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v40.receiver = self;
  v40.super_class = (Class)PinView;
  v14 = [(PinView *)&v40 init];
  if (v14)
  {
    +[UIScreen mainScreen];
    id v39 = v13;
    id v15 = v12;
    id v16 = v11;
    v18 = id v17 = v10;
    [v18 scale];
    v14->_scale = v19;

    v20 = +[UIDevice currentDevice];
    unint64_t v21 = (unint64_t)[v20 userInterfaceIdiom];

    v14->_autoKeyboard = (v21 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    uint64_t v22 = objc_opt_new();
    titleLabel = v14->_titleLabel;
    v14->_titleLabel = (UILabel *)v22;

    v24 = v14->_titleLabel;
    v25 = UISystemFontForSize();
    [(UILabel *)v24 setFont:v25];

    [(UILabel *)v14->_titleLabel setOpaque:0];
    [(UILabel *)v14->_titleLabel setBackgroundColor:0];
    [(UILabel *)v14->_titleLabel setTextAlignment:1];
    v26 = v14->_titleLabel;
    v27 = +[UIColor labelColor];
    v28 = v26;
    id v10 = v17;
    id v11 = v16;
    id v12 = v15;
    id v13 = v39;
    [(UILabel *)v28 setTextColor:v27];

    [(UILabel *)v14->_titleLabel setNumberOfLines:0];
    [(PinView *)v14 addSubview:v14->_titleLabel];
    v29 = [[PinField alloc] initWithPinLength:v10 minLength:v11 maxLength:v12 charset:v39];
    pinField = v14->_pinField;
    v14->_pinField = v29;

    [(PinView *)v14 addSubview:v14->_pinField];
    [(PinField *)v14->_pinField setDelegate:v14];
    objc_storeStrong((id *)&v14->_pinMinLength, a4);
    objc_storeStrong((id *)&v14->_pinCharset, a6);
    if (!v14->_autoKeyboard
      || (+[UIDevice currentDevice],
          v31 = objc_claimAutoreleasedReturnValue(),
          unint64_t v32 = (unint64_t)[v31 userInterfaceIdiom],
          v31,
          (v32 & 0xFFFFFFFFFFFFFFFBLL) != 1))
    {
      uint64_t v33 = objc_opt_new();
      dividerLine = v14->_dividerLine;
      v14->_dividerLine = (UIView *)v33;

      v35 = v14->_dividerLine;
      v36 = +[UIColor systemBackgroundColor];
      [(UIView *)v35 setBackgroundColor:v36];

      [(UIView *)v14->_dividerLine setHidden:1];
      [(PinView *)v14 addSubview:v14->_dividerLine];
    }
    if (v14->_autoKeyboard)
    {
      v37 = +[NSNotificationCenter defaultCenter];
      [v37 addObserver:v14 selector:"keyboardDidShow:" name:UIKeyboardDidShowNotification object:0];
    }
    else
    {
      if (UIKeyboardAutomaticIsOnScreen()) {
        UIKeyboardOrderOutAutomaticSkippingAnimation();
      }
      [(PinView *)v14 _activateKeypadView];
    }
  }

  return v14;
}

- (void)dealloc
{
  if (self->_autoKeyboard)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:UIKeyboardDidShowNotification object:0];
  }
  else
  {
    [(PinView *)self _dismissKeypad];
  }
  v4.receiver = self;
  v4.super_class = (Class)PinView;
  [(PinView *)&v4 dealloc];
}

- (void)keyboardDidShow:(id)a3
{
  objc_super v4 = [a3 userInfo];
  v9 = [v4 objectForKey:UIKeyboardFrameEndUserInfoKey];

  if (v9)
  {
    [v9 CGRectValue];
    double x = v11.origin.x;
    double y = v11.origin.y;
    double width = v11.size.width;
    double height = v11.size.height;
    if (!CGRectIsEmpty(v11)) {
      -[PinView _layoutSubviewsWithKeyboard:](self, "_layoutSubviewsWithKeyboard:", x, y, width, height);
    }
  }

  _objc_release_x1();
}

- (void)setCancelButton:(id)a3
{
  objc_super v4 = (UIButton *)a3;
  v5 = v4;
  if (self->_cancelButton) {
    [(UIButton *)v4 removeFromSuperview];
  }
  cancelButton = self->_cancelButton;
  self->_cancelButton = v5;
  v7 = v5;

  [(PinView *)self addSubview:self->_cancelButton];
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)PinView;
  [(PinView *)&v18 layoutSubviews];
  [(PinView *)self bounds];
  double height = v19.size.height;
  if (!CGRectIsEmpty(v19))
  {
    if (self->_keypad)
    {
      double x = self->_keyboardDefaultFrame.origin.x;
      double width = self->_keyboardDefaultFrame.size.width;
      double v6 = self->_keyboardDefaultFrame.size.height;
      v7 = +[UIDevice currentDevice];
      unint64_t v8 = (unint64_t)[v7 userInterfaceIdiom];

      if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        double v6 = 216.0;
        double width = 320.0;
      }
      [(PinView *)self _roundToPixel:height - v6];
      double v10 = v9;
      -[PinKeypad setFrame:](self->_keypad, "setFrame:", x, v9, width, v6);
      if (self->_dividerLine)
      {
        -[PinView _roundRectToPixel:](self, "_roundRectToPixel:", x, v10 + -0.5, width, 0.5);
        -[UIView setFrame:](self->_dividerLine, "setFrame:");
        [(UIView *)self->_dividerLine setHidden:0];
      }
    }
    else
    {
      CGRect v11 = [(PinView *)self keyboardLayoutGuide];
      [v11 layoutFrame];
      double x = v12;
      double v10 = v13;
      double width = v14;
      double v16 = v15;

      double v6 = 285.0;
      if (v16 >= 285.0)
      {
        double v6 = v16;
      }
      else
      {
        [(PinView *)self frame];
        double width = v17;
        double x = 0.0;
        double v10 = 0.0;
      }
    }
    -[PinView _layoutSubviewsWithKeyboard:](self, "_layoutSubviewsWithKeyboard:", x, v10, width, v6);
  }
}

- (void)_layoutSubviewsWithKeyboard:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PinView *)self bounds];
  CGFloat v8 = v22.origin.x;
  CGFloat v9 = v22.origin.y;
  double v10 = v22.size.width;
  double v11 = v22.size.height;
  if (!CGRectIsEmpty(v22))
  {
    double v12 = [(PinView *)self viewController];
    double v13 = [v12 view];
    [v13 safeAreaInsets];
    double v20 = v14;

    cancelButton = self->_cancelButton;
    if (cancelButton)
    {
      [(UIButton *)cancelButton frame];
      -[UIButton setFrame:](self->_cancelButton, "setFrame:", v10 - v16 + -15.0, v20 + 10.0);
    }
    v23.origin.CGFloat x = v8;
    v23.origin.CGFloat y = v9;
    v23.size.CGFloat width = v10;
    v23.size.CGFloat height = v11;
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    CGRect v24 = CGRectIntersection(v23, v25);
    CGRectIsNull(v24);
    [(PinField *)self->_pinField updateLayoutForWidth:v10];
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v10 + -30.0, v11);
    [(PinField *)self->_pinField frame];
    UIRectCenteredXInRect();
    UIRectIntegralWithScale();
    UIRectIntegralWithScale();
    double v18 = v17;
    -[PinField setFrame:](self->_pinField, "setFrame:");
    UIRectCenteredXInRect();
    UIRectIntegralWithScale();
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
    titleLabel = self->_titleLabel;
    [(UILabel *)titleLabel _setLastLineBaselineFrameOriginY:v18 + -30.0];
  }
}

- (double)_roundToPixel:(double)a3
{
  return round(self->_scale * a3) / self->_scale;
}

- (CGRect)_roundRectToPixel:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  [(PinView *)self _roundToPixel:a3.origin.x];
  double v8 = v7;
  [(PinView *)self _roundToPixel:y];
  double v10 = v9;
  [(PinView *)self _roundToPixel:width];
  double v12 = v11;
  [(PinView *)self _roundToPixel:height];
  double v14 = v13;
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  result.size.double height = v14;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return self->_autoKeyboard || self->_keypadActive;
}

- (BOOL)becomeFirstResponder
{
  if (self->_autoKeyboard)
  {
    v5.receiver = self;
    v5.super_class = (Class)PinView;
    return [(PinView *)&v5 becomeFirstResponder];
  }
  if (self->_keypadActive)
  {
    UIKeyboardDisableAutomaticAppearance();
    v4.receiver = self;
    v4.super_class = (Class)PinView;
    if ([(PinView *)&v4 becomeFirstResponder]) {
      return 1;
    }
    UIKeyboardEnableAutomaticAppearance();
  }
  return 0;
}

- (BOOL)resignFirstResponder
{
  unsigned int v3 = [(PinView *)self isFirstResponder];
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PinView;
    unsigned int v3 = [(PinView *)&v6 resignFirstResponder];
    if (v3)
    {
      if (self->_keypadActive) {
        UIKeyboardEnableAutomaticAppearance();
      }
      if (!self->_pinEntered)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained pinCancelled];
      }
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_activateKeypadView
{
  if (!self->_keypadActive)
  {
    keypad = self->_keypad;
    if (!keypad)
    {
      objc_super v4 = [[PinKeypad alloc] initWithDefaultSize];
      objc_super v5 = self->_keypad;
      self->_keypad = v4;

      objc_super v6 = [(PinKeypad *)self->_keypad layer];
      unsigned int v7 = [v6 disableUpdateMask];

      uint64_t v8 = v7 | 0x10;
      double v9 = [(PinKeypad *)self->_keypad layer];
      [v9 setDisableUpdateMask:v8];

      [(PinKeypad *)self->_keypad frame];
      self->_keyboardDefaultFrame.origin.CGFloat x = v10;
      self->_keyboardDefaultFrame.origin.double y = v11;
      self->_keyboardDefaultFrame.size.double width = v12;
      self->_keyboardDefaultFrame.size.double height = v13;
      keypad = self->_keypad;
    }
    [(PinKeypad *)keypad activate];
    self->_keypadActive = 1;
    double v14 = [(PinKeypad *)self->_keypad superview];

    if (!v14)
    {
      double v15 = self->_keypad;
      [(PinView *)self addSubview:v15];
    }
  }
}

- (void)_deactivateKeypadView
{
  if (self->_keypadActive)
  {
    [(PinKeypad *)self->_keypad deactivate];
    self->_keypadActive = 0;
  }
}

- (void)_dismissKeypad
{
  [(PinView *)self _deactivateKeypadView];
  keypad = self->_keypad;
  if (keypad)
  {
    [(PinKeypad *)keypad removeFromSuperview];
    objc_super v4 = self->_keypad;
    self->_keypad = 0;
  }
}

- (void)pinEntered:(id)a3
{
  self->_pinEntered = 1;
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained pinEntered:v4];
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (int64_t)keyboardType
{
  if (!self->_autoKeyboard)
  {
    unsigned int v3 = +[UIDevice currentDevice];
    unint64_t v4 = (unint64_t)[v3 userInterfaceIdiom];

    if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      return 127;
    }
  }
  if ([(NSNumber *)self->_pinCharset unsignedIntValue]) {
    return 1;
  }
  return 4;
}

- (int64_t)keyboardAppearance
{
  v2 = [(PinView *)self traitCollection];
  id v3 = [v2 userInterfaceStyle];

  if (v3 == (id)1000 || v3 == (id)2) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int64_t)returnKeyType
{
  return 9;
}

- (int64_t)autocapitalizationType
{
  if ([(NSNumber *)self->_pinCharset unsignedIntValue] == 2) {
    return 3;
  }
  else {
    return 0;
  }
}

- (BOOL)isSecureTextEntry
{
  return 1;
}

- (BOOL)hasText
{
  v2 = [(PinField *)self->_pinField pinValue];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)insertText:(id)a3
{
}

- (void)deleteBackward
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  self->_viewController = (UIViewController *)a3;
}

- (PinViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PinViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pinCharset, 0);
  objc_storeStrong((id *)&self->_pinMinLength, 0);
  objc_storeStrong((id *)&self->_keypad, 0);
  objc_storeStrong((id *)&self->_dividerLine, 0);
  objc_storeStrong((id *)&self->_pinField, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end