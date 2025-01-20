@interface SRCompactTextRequestView
- (BOOL)_isShowingCancelButton;
- (BOOL)_laysOutContentRightToLeft;
- (BOOL)_shouldShowCancelButton;
- (BOOL)allowsCancellation;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (SRCompactTextRequestField)_textField;
- (SRCompactTextRequestView)initWithFrame:(CGRect)a3;
- (SRCompactTextRequestViewDelegate)delegate;
- (UIButton)_cancelButton;
- (UIGestureRecognizer)_beginEditingGestureRecognizer;
- (double)_preferredHeight;
- (void)_accessibilityBoldStatusDidChange:(id)a3;
- (void)_beginEditing;
- (void)_beginEditingGestureWasRecognized:(id)a3;
- (void)_cancelButtonWasTapped:(id)a3;
- (void)_setShowingCancelButton:(BOOL)a3;
- (void)_setShowingCancelButton:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateCancelButtonFont;
- (void)layoutSubviews;
- (void)setAllowsCancellation:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)textField:(id)a3 willDismissEditMenuWithAnimator:(id)a4;
- (void)textField:(id)a3 willPresentEditMenuWithAnimator:(id)a4;
- (void)textFieldDidChangeSelection:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)textRequestSuggestionsButton:(id)a3 didEnableSuggestions:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SRCompactTextRequestView

- (SRCompactTextRequestView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)SRCompactTextRequestView;
  v3 = -[SRCompactTextRequestView initWithFrame:](&v23, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[UIButton buttonWithType:0];
    cancelButton = v3->_cancelButton;
    v3->_cancelButton = (UIButton *)v4;

    v6 = v3->_cancelButton;
    v7 = sub_10003D224(@"TYPE_TO_SIRI_CANCEL_BUTTON_TITLE");
    [(UIButton *)v6 setTitle:v7 forState:0];

    [(UIButton *)v3->_cancelButton sizeToFit];
    [(UIButton *)v3->_cancelButton setAlpha:0.0];
    [(UIButton *)v3->_cancelButton addTarget:v3 action:"_cancelButtonWasTapped:" forControlEvents:64];
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v3 selector:"_accessibilityBoldStatusDidChange:" name:UIAccessibilityBoldTextStatusDidChangeNotification object:0];

    [(SRCompactTextRequestView *)v3 addSubview:v3->_cancelButton];
    [(SRCompactTextRequestView *)v3 _updateCancelButtonFont];
    v9 = objc_alloc_init(SRCompactTextRequestField);
    textField = v3->_textField;
    v3->_textField = v9;

    [(SRCompactTextRequestField *)v3->_textField setInlinePredictionType:2];
    [(SRCompactTextRequestField *)v3->_textField setDelegate:v3];
    [(SRCompactTextRequestField *)v3->_textField setButtonDelegate:v3];
    if (+[AFSystemAssistantExperienceStatusManager isSAEEnabled])uint64_t v11 = 13; {
    else
    }
      uint64_t v11 = 1;
    [(SRCompactTextRequestField *)v3->_textField setKeyboardAppearance:v11];
    if (+[AFSystemAssistantExperienceStatusManager isSAEEnabled])v12 = @"TYPE_TO_SIRI_TEXT_PLACEHOLDER_SAE"; {
    else
    }
      v12 = @"TYPE_TO_SIRI_TEXT_PLACEHOLDER";
    v13 = v3->_textField;
    v14 = sub_10003D224(v12);
    [(SRCompactTextRequestField *)v13 setPlaceholder:v14];

    [(SRCompactTextRequestView *)v3 addSubview:v3->_textField];
    v15 = (UIGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v3 action:"_beginEditingGestureWasRecognized:"];
    beginEditingGestureRecognizer = v3->_beginEditingGestureRecognizer;
    v3->_beginEditingGestureRecognizer = v15;

    [(UIGestureRecognizer *)v3->_beginEditingGestureRecognizer setDelegate:v3];
    [(SRCompactTextRequestField *)v3->_textField addGestureRecognizer:v3->_beginEditingGestureRecognizer];
    if (+[AFSystemAssistantExperienceStatusManager isSAEEnabled])
    {
      v17 = [(SRCompactTextRequestField *)v3->_textField inputAssistantItem];
      v18 = +[UIImage _systemImageNamed:@"siri"];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100068D60;
      v21[3] = &unk_1001447E0;
      v22 = v3;
      v19 = +[UIAction actionWithTitle:@"siri" image:v18 identifier:0 handler:v21];
      [v17 _setDictationReplacementAction:v19];
    }
  }
  return v3;
}

- (void)textFieldDidChangeSelection:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = [v5 text];

  [WeakRetained textRequestView:self didChangeTextFieldText:v6];
}

- (void)_beginEditing
{
  v3 = [(SRCompactTextRequestView *)self delegate];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100068ECC;
  v4[3] = &unk_1001444D8;
  v4[4] = self;
  [v3 textRequestView:self requestsKeyboardWithCompletion:v4];
}

- (void)_beginEditingGestureWasRecognized:(id)a3
{
  if ([a3 state] == (id)3)
  {
    [(SRCompactTextRequestView *)self _beginEditing];
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  return 1;
}

- (void)setAllowsCancellation:(BOOL)a3
{
  self->_allowsCancellation = a3 & ~+[AFSystemAssistantExperienceStatusManager isSAEEnabled];
  BOOL v4 = [(SRCompactTextRequestView *)self _shouldShowCancelButton];

  [(SRCompactTextRequestView *)self _setShowingCancelButton:v4];
}

- (BOOL)_shouldShowCancelButton
{
  BOOL v3 = [(SRCompactTextRequestView *)self allowsCancellation];
  if (v3)
  {
    LOBYTE(v3) = [(SRCompactTextRequestView *)self isFirstResponder];
  }
  return v3;
}

- (void)_setShowingCancelButton:(BOOL)a3
{
}

- (void)_setShowingCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showingCancelButton != a3)
  {
    BOOL v4 = a4;
    unsigned int v7 = +[UIView _isInAnimationBlock];
    self->_showingCancelButton = a3;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006912C;
    v11[3] = &unk_100142E88;
    v11[4] = self;
    v8 = objc_retainBlock(v11);
    v9 = v8;
    if (v7) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = !v4;
    }
    if (v10) {
      ((void (*)(void *))v8[2])(v8);
    }
    else {
      +[UIView _animateUsingDefaultTimingWithOptions:6 animations:v8 completion:0];
    }
  }
}

- (void)_cancelButtonWasTapped:(id)a3
{
  BOOL v4 = [(SRCompactTextRequestView *)self _textField];
  [v4 setText:&stru_1001463E0];

  [(SRCompactTextRequestView *)self resignFirstResponder];
}

- (void)_updateCancelButtonFont
{
  BOOL v3 = [(SRCompactTextRequestView *)self traitCollection];
  BOOL v4 = [v3 preferredContentSizeCategory];
  id v5 = sub_100070E08(v4, UIContentSizeCategoryExtraSmall, UIContentSizeCategoryAccessibilityExtraExtraLarge);
  id v9 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v5];

  v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v9];
  unsigned int v7 = [(SRCompactTextRequestView *)self _cancelButton];
  v8 = [v7 titleLabel];
  [v8 setFont:v6];

  [v7 sizeToFit];
}

- (double)_preferredHeight
{
  v2 = [(SRCompactTextRequestView *)self _textField];
  [v2 intrinsicContentSize];
  double v4 = v3;

  return v4;
}

- (void)_accessibilityBoldStatusDidChange:(id)a3
{
  [(SRCompactTextRequestView *)self _updateCancelButtonFont];
  [(SRCompactTextRequestView *)self setNeedsLayout];

  [(SRCompactTextRequestView *)self layoutIfNeeded];
}

- (BOOL)_laysOutContentRightToLeft
{
  return [(SRCompactTextRequestView *)self semanticContentAttribute] == (id)4;
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(SRCompactTextRequestView *)self _textField];
  [v3 intrinsicContentSize];
  double v5 = v4;

  [(SRCompactTextRequestView *)self _preferredHeight];
  double v7 = v6;
  double v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(SRCompactTextRequestView *)self _textField];
  [v6 sizeThatFits:width, height];
  double v8 = v7;

  [(SRCompactTextRequestView *)self _preferredHeight];
  double v10 = v9;
  double v11 = v8;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)SRCompactTextRequestView;
  [(SRCompactTextRequestView *)&v25 layoutSubviews];
  [(SRCompactTextRequestView *)self bounds];
  double v3 = [(SRCompactTextRequestView *)self _textField];
  double v4 = [(SRCompactTextRequestView *)self _cancelButton];
  [(SRCompactTextRequestView *)self safeAreaInsets];
  UIEdgeInsetsAdd();
  [v3 intrinsicContentSize];
  [v4 frame];
  double v6 = v5;
  double y = CGPointZero.y;
  UIRectCenteredIntegralRect();
  CGFloat v21 = v7;
  CGFloat v22 = v8;
  double rect = v9;
  double v20 = v10;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  if ([(SRCompactTextRequestView *)self _isShowingCancelButton])
  {
    if ([(SRCompactTextRequestView *)self _laysOutContentRightToLeft]) {
      double left = v6 + 12.0 + left;
    }
    else {
      double right = v6 + 12.0 + right;
    }
  }
  [v3 setBounds:CGPointZero.x, y, rect - (left + right), v20 - (UIEdgeInsetsZero.top + bottom)];
  UIRectGetCenter();
  [v3 setCenter:];
  [v4 frame];
  v26.origin.x = v21;
  v26.origin.double y = v22;
  v26.size.double width = rect;
  v26.size.double height = v20;
  CGRectGetMidY(v26);
  unsigned int v14 = [(SRCompactTextRequestView *)self _isShowingCancelButton];
  unsigned int v15 = [(SRCompactTextRequestView *)self _laysOutContentRightToLeft];
  if (v14)
  {
    CGFloat v16 = v21;
    CGFloat v17 = v22;
    double v18 = rect;
    double v19 = v20;
    if (!v15)
    {
      CGRectGetMaxX(*(CGRect *)&v16);
      goto LABEL_12;
    }
  }
  else
  {
    CGFloat v16 = v21;
    CGFloat v17 = v22;
    double v18 = rect;
    double v19 = v20;
    if (!v15)
    {
      CGRectGetMaxX(*(CGRect *)&v16);
      goto LABEL_12;
    }
  }
  CGRectGetMinX(*(CGRect *)&v16);
LABEL_12:
  UIRectIntegralWithScale();
  [v4 setBounds:CGPointZero.x, y];
  UIRectGetCenter();
  [v4 setCenter:];
}

- (BOOL)canBecomeFirstResponder
{
  v2 = [(SRCompactTextRequestView *)self _textField];
  unsigned __int8 v3 = [v2 canBecomeFirstResponder];

  return v3;
}

- (BOOL)becomeFirstResponder
{
  return 1;
}

- (BOOL)canResignFirstResponder
{
  v2 = [(SRCompactTextRequestView *)self _textField];
  unsigned __int8 v3 = [v2 canResignFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)SRCompactTextRequestView;
  [(SRCompactTextRequestView *)&v6 resignFirstResponder];
  unsigned __int8 v3 = [(SRCompactTextRequestView *)self _textField];
  unsigned __int8 v4 = [v3 resignFirstResponder];

  return v4;
}

- (BOOL)isFirstResponder
{
  v2 = [(SRCompactTextRequestView *)self _textField];
  unsigned __int8 v3 = [v2 isEditing];

  return v3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(SRCompactTextRequestView *)self _beginEditingGestureRecognizer];

  if (v5 == v4)
  {
    double v7 = [(SRCompactTextRequestView *)self _textField];
    unsigned int v6 = [v7 isEditing] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  if ([(SRCompactTextRequestView *)self allowsCancellation]) {
    [(SRCompactTextRequestView *)self _setShowingCancelButton:1 animated:1];
  }
  id v4 = [(SRCompactTextRequestView *)self delegate];
  [v4 textRequestViewWillBeginEditing:self];

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = [a3 text];
  id v5 = [(SRCompactTextRequestView *)self delegate];
  [v5 textRequestView:self siriRequestCommittedWithText:v4];

  if ((+[AFSystemAssistantExperienceStatusManager isSAEEnabled] & 1) == 0)[(SRCompactTextRequestView *)self resignFirstResponder]; {
  return 1;
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  [(SRCompactTextRequestView *)self _setShowingCancelButton:0 animated:1];
  id v4 = [(SRCompactTextRequestView *)self delegate];
  [v4 textRequestViewDidEndEditing:self];
}

- (void)textField:(id)a3 willPresentEditMenuWithAnimator:(id)a4
{
  id v5 = [(SRCompactTextRequestView *)self delegate];
  [v5 textRequestViewWillBeginTextEditMenuInteraction:self];
}

- (void)textField:(id)a3 willDismissEditMenuWithAnimator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100069B20;
  v8[3] = &unk_100143410;
  objc_copyWeak(&v9, &location);
  [v7 addCompletion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SRCompactTextRequestView;
  [(SRCompactTextRequestView *)&v4 traitCollectionDidChange:a3];
  [(SRCompactTextRequestView *)self _updateCancelButtonFont];
  [(SRCompactTextRequestView *)self setNeedsLayout];
  [(SRCompactTextRequestView *)self layoutIfNeeded];
}

- (void)textRequestSuggestionsButton:(id)a3 didEnableSuggestions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRCompactTextRequestView *)self delegate];
  [v6 textRequestView:self didEnableSuggestions:v4];
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)allowsCancellation
{
  return self->_allowsCancellation;
}

- (SRCompactTextRequestViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SRCompactTextRequestViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)_cancelButton
{
  return self->_cancelButton;
}

- (SRCompactTextRequestField)_textField
{
  return self->_textField;
}

- (BOOL)_isShowingCancelButton
{
  return self->_showingCancelButton;
}

- (UIGestureRecognizer)_beginEditingGestureRecognizer
{
  return self->_beginEditingGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beginEditingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_text, 0);
}

@end