@interface SRCompactTextRequestField
- (BOOL)_hasText;
- (BOOL)_laysOutContentRightToLeft;
- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged;
- (BOOL)resignFirstResponder;
- (CGRect)_adjustTextOrEditingRect:(CGRect)a3 forBounds:(CGRect)a4;
- (CGRect)_frameForPlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 layingOutContentRightToLeft:(BOOL)a5;
- (CGRect)_placeholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 layingOutContentRightToLeft:(BOOL)a5;
- (CGRect)_textRectForBounds:(CGRect)a3 alignment:(int64_t)a4 layingOutContentRightToLeft:(BOOL)a5;
- (CGRect)clearButtonRectForBounds:(CGRect)a3;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)leftViewRectForBounds:(CGRect)a3;
- (CGRect)placeholderRectForBounds:(CGRect)a3;
- (CGRect)rightViewRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTMaterialView)_backgroundView;
- (NSHashTable)_styledViews;
- (SRCompactTextRequestField)initWithFrame:(CGRect)a3;
- (SRCompactTextRequestSiriSuggestionsButton)_suggestionsButton;
- (SRCompactTextRequestSiriSuggestionsButtonDelegate)buttonDelegate;
- (UIColor)_secondaryTintColor;
- (double)_preferredHeight;
- (id)_borderColorForUserInterfaceStyle:(int64_t)a3;
- (int64_t)_preferredTextAlignment;
- (int64_t)_preferredTextAlignmentForEditing:(BOOL)a3;
- (void)_didBeginEditing:(id)a3;
- (void)_didEndEditing:(id)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_textDidChange:(id)a3;
- (void)_updateBorderVisualStyling;
- (void)_updateStyleForAccessoryView:(id)a3;
- (void)_updateStyleForClearButton;
- (void)_updateStyleForLeftView;
- (void)_updateStyleForPlaceholderView;
- (void)_updateStyleForRightView;
- (void)_updateTextAlignmentForEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateVisualStyling;
- (void)layoutSubviews;
- (void)setButtonDelegate:(id)a3;
- (void)textRequestSuggestionsButton:(id)a3 didEnableSuggestions:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SRCompactTextRequestField

- (SRCompactTextRequestField)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SRCompactTextRequestField;
  v3 = -[SRCompactTextRequestField initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SRCompactTextRequestField *)v3 setLoadKeyboardsForSiriLanguage:1];
    [(SRCompactTextRequestField *)v4 setBorderStyle:0];
    if (+[AFSystemAssistantExperienceStatusManager isSAEEnabled])
    {
      v5 = -[SRCompactTextRequestSiriSuggestionsButton initWithFrame:]([SRCompactTextRequestSiriSuggestionsButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      suggestionsButton = v4->_suggestionsButton;
      v4->_suggestionsButton = v5;

      [(SRCompactTextRequestSiriSuggestionsButton *)v4->_suggestionsButton setDelegate:v4];
      [(SRCompactTextRequestField *)v4 setLeftView:v4->_suggestionsButton];
      [(SRCompactTextRequestField *)v4 setLeftViewMode:3];
    }
    uint64_t v7 = +[MTMaterialView materialViewWithRecipe:19 configuration:1];
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (MTMaterialView *)v7;

    [(MTMaterialView *)v4->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(MTMaterialView *)v4->_backgroundView layer];
    [v9 setBorderWidth:0.300000012];

    [(SRCompactTextRequestField *)v4 _updateBorderVisualStyling];
    [(MTMaterialView *)v4->_backgroundView setAutoresizingMask:18];
    v10 = v4->_backgroundView;
    [(SRCompactTextRequestField *)v4 bounds];
    -[MTMaterialView setFrame:](v10, "setFrame:");
    [(MTMaterialView *)v4->_backgroundView setUserInteractionEnabled:0];
    [(SRCompactTextRequestField *)v4 addSubview:v4->_backgroundView];
    [(SRCompactTextRequestField *)v4 sendSubviewToBack:v4->_backgroundView];
    [(SRCompactTextRequestField *)v4 setReturnKeyType:9];
    [(SRCompactTextRequestField *)v4 setEnablesReturnKeyAutomatically:1];
    [(SRCompactTextRequestField *)v4 setEnablesReturnKeyOnNonWhiteSpaceContent:1];
    [(SRCompactTextRequestField *)v4 setMinimumFontSize:10.0];
    [(SRCompactTextRequestField *)v4 _updateVisualStyling];
    uint64_t v11 = +[NSHashTable weakObjectsHashTable];
    styledViews = v4->_styledViews;
    v4->_styledViews = (NSHashTable *)v11;

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v4 selector:"_didEndEditing:" name:UITextFieldTextDidEndEditingNotification object:v4];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v4 selector:"_didBeginEditing:" name:UITextFieldTextDidBeginEditingNotification object:v4];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v4 selector:"_textDidChange:" name:UITextFieldTextDidChangeNotification object:v4];

    [(SRCompactTextRequestField *)v4 _setContinuousCornerRadius:16.0];
    [(SRCompactTextRequestField *)v4 _updateTextAlignmentForEditing:0 animated:0];
  }
  return v4;
}

- (id)_borderColorForUserInterfaceStyle:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", dbl_1000DC668[a3], 0.08, v3);
    self = (SRCompactTextRequestField *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (void)_updateBorderVisualStyling
{
  uint64_t v3 = [(SRCompactTextRequestField *)self traitCollection];
  id v4 = [v3 userInterfaceStyle];

  v5 = [(SRCompactTextRequestField *)self _borderColorForUserInterfaceStyle:v4];
  v6 = [(SRCompactTextRequestField *)self _backgroundView];
  uint64_t v7 = [v6 layer];

  id v8 = v5;
  objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));
}

- (double)_preferredHeight
{
  v2 = [(SRCompactTextRequestField *)self font];
  [v2 lineHeight];
  double v4 = v3 + 26.0;
  [v2 descender];
  double v6 = fmax(v4 + v5, 48.0);

  return v6;
}

- (UIColor)_secondaryTintColor
{
  return +[UIColor colorWithRed:0.32 green:0.32 blue:0.32 alpha:1.0];
}

- (void)_updateVisualStyling
{
  double v3 = [(SRCompactTextRequestField *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  double v5 = sub_100070E08(v4, UIContentSizeCategorySmall, UIContentSizeCategoryAccessibilityExtraExtraLarge);
  double v6 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v5];

  uint64_t v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3 compatibleWithTraitCollection:v6];
  [(SRCompactTextRequestField *)self setFont:v7];
  id v8 = [(SRCompactTextRequestField *)self _secondaryTintColor];
  v9 = [(SRCompactTextRequestField *)self _clearButton];
  v10 = dispatch_get_global_queue(21, 0);
  objc_super v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_10007181C;
  v20 = &unk_1001436E0;
  id v21 = v8;
  id v22 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, &v17);

  v13 = +[UIColor whiteColor];
  [(SRCompactTextRequestField *)self setTintColor:v13];

  v14 = +[UIColor whiteColor];
  [(SRCompactTextRequestField *)self setTextColor:v14];

  v15 = [(SRCompactTextRequestField *)self _placeholderLabel];
  [v15 setTextColor:v12];
  [(SRCompactTextRequestField *)self _updateStyleForLeftView];
  [(SRCompactTextRequestField *)self _updateStyleForRightView];
  [(SRCompactTextRequestField *)self _updateStyleForClearButton];
  [(SRCompactTextRequestField *)self _updateStyleForPlaceholderView];
  v16 = [(SRCompactTextRequestField *)self layer];
  [v16 setAllowsGroupBlending:0];
}

- (void)_updateStyleForPlaceholderView
{
  id v10 = [(SRCompactTextRequestField *)self _placeholderView];
  double v3 = [(SRCompactTextRequestField *)self _styledViews];
  if (([v3 containsObject:v10] & 1) == 0)
  {
    double v4 = [(SRCompactTextRequestField *)self _backgroundView];
    double v5 = [v4 visualStylingProviderForCategory:1];
    [v5 automaticallyUpdateView:v10 withStyle:1];

    double v6 = [v10 layer];
    uint64_t v7 = +[CAFilter filterWithType:kCAFilterPlusL];
    [v6 setCompositingFilter:v7];

    [v3 addObject:v10];
  }
  uint64_t v8 = objc_opt_class();
  v9 = sub_1000056B4(v8, v10);
  [v9 setAdjustsFontSizeToFitWidth:1];
}

- (void)_updateStyleForAccessoryView:(id)a3
{
  id v9 = a3;
  double v4 = [(SRCompactTextRequestField *)self _styledViews];
  if (([v4 containsObject:v9] & 1) == 0)
  {
    double v5 = [(SRCompactTextRequestField *)self _backgroundView];
    double v6 = [v5 visualStylingProviderForCategory:1];
    [v6 automaticallyUpdateView:v9 withStyle:1];

    uint64_t v7 = [v9 layer];
    uint64_t v8 = +[CAFilter filterWithType:kCAFilterPlusL];
    [v7 setCompositingFilter:v8];

    [v9 setContentMode:1];
    [v4 addObject:v9];
  }
}

- (void)_updateStyleForLeftView
{
  if ((+[AFSystemAssistantExperienceStatusManager isSAEEnabled] & 1) == 0)
  {
    id v3 = [(SRCompactTextRequestField *)self leftView];
    [(SRCompactTextRequestField *)self _updateStyleForAccessoryView:v3];
  }
}

- (void)_updateStyleForRightView
{
  id v3 = [(SRCompactTextRequestField *)self rightView];
  [(SRCompactTextRequestField *)self _updateStyleForAccessoryView:v3];
}

- (void)_updateStyleForClearButton
{
  id v8 = [(SRCompactTextRequestField *)self _clearButton];
  id v3 = [(SRCompactTextRequestField *)self _styledViews];
  if (([v3 containsObject:v8] & 1) == 0)
  {
    double v4 = [(SRCompactTextRequestField *)self _backgroundView];
    double v5 = [v4 visualStylingProviderForCategory:1];
    [v5 automaticallyUpdateView:v8 withStyle:1];

    double v6 = [v8 layer];
    uint64_t v7 = +[CAFilter filterWithType:kCAFilterPlusL];
    [v6 setCompositingFilter:v7];

    [v8 setContentMode:1];
    [v3 addObject:v8];
  }
}

- (int64_t)_preferredTextAlignmentForEditing:(BOOL)a3
{
  if (a3) {
    return 4;
  }
  else {
    return 1;
  }
}

- (int64_t)_preferredTextAlignment
{
  id v3 = [(SRCompactTextRequestField *)self isEditing];

  return [(SRCompactTextRequestField *)self _preferredTextAlignmentForEditing:v3];
}

- (void)_updateTextAlignmentForEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRCompactTextRequestField *)self _preferredTextAlignmentForEditing:a3];
  if (v6 != [(SRCompactTextRequestField *)self textAlignment])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100071ED0;
    v9[3] = &unk_100142DC0;
    v9[4] = self;
    v9[5] = v6;
    uint64_t v7 = objc_retainBlock(v9);
    id v8 = v7;
    if (v4) {
      +[UIView _animateUsingDefaultTimingWithOptions:6 animations:v7 completion:0];
    }
    else {
      ((void (*)(void *))v7[2])(v7);
    }
  }
}

- (BOOL)_hasText
{
  v2 = [(SRCompactTextRequestField *)self text];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (void)_didBeginEditing:(id)a3
{
}

- (void)_textDidChange:(id)a3
{
  if ([(SRCompactTextRequestField *)self _hasText]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 1;
  }

  [(SRCompactTextRequestField *)self setClearButtonMode:v4];
}

- (void)_didEndEditing:(id)a3
{
}

- (BOOL)_laysOutContentRightToLeft
{
  return [(SRCompactTextRequestField *)self semanticContentAttribute] == (id)4;
}

- (CGRect)_placeholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 layingOutContentRightToLeft:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[SRCompactTextRequestField _frameForPlaceholderRectForBounds:alignment:layingOutContentRightToLeft:](self, "_frameForPlaceholderRectForBounds:alignment:layingOutContentRightToLeft:");
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  if (a4 == 1)
  {
    UIRectCenteredXInRectScale();
    double v19 = v18;
    double v13 = v20;
    double v15 = v21;
    double v17 = v22;
  }
  else
  {
    -[SRCompactTextRequestField _textRectForBounds:alignment:layingOutContentRightToLeft:](self, "_textRectForBounds:alignment:layingOutContentRightToLeft:", a4, v5, x, y, width, height);
    CGFloat v27 = v23;
    CGFloat v28 = v24;
    CGFloat v29 = v25;
    CGFloat v30 = v26;
    if (v5)
    {
      double v19 = CGRectGetMaxX(*(CGRect *)&v23) - (v15 + 8.0);
    }
    else
    {
      v31 = [(SRCompactTextRequestField *)self leftView];
      [v31 frame];
      double v33 = v32;
      v38.origin.double x = v27;
      v38.origin.double y = v28;
      v38.size.double width = v29;
      v38.size.double height = v30;
      double v19 = CGRectGetMinX(v38) + v33;
    }
  }
  double v34 = v19;
  double v35 = v13;
  double v36 = v15;
  double v37 = v17;
  result.size.double height = v37;
  result.size.double width = v36;
  result.origin.double y = v35;
  result.origin.double x = v34;
  return result;
}

- (CGRect)_frameForPlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 layingOutContentRightToLeft:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  id v8 = [(SRCompactTextRequestField *)self placeholder];
  NSAttributedStringKey v15 = NSFontAttributeName;
  id v9 = [(SRCompactTextRequestField *)self font];
  double v16 = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  [v8 boundingRectWithSize:0 options:v10 attributes:0 context:width, height];

  UIRectCenteredIntegralRectScale();
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)_textRectForBounds:(CGRect)a3 alignment:(int64_t)a4 layingOutContentRightToLeft:(BOOL)a5
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4 == 1)
  {
    -[SRCompactTextRequestField _frameForPlaceholderRectForBounds:alignment:layingOutContentRightToLeft:](self, "_frameForPlaceholderRectForBounds:alignment:layingOutContentRightToLeft:", 1, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    double v12 = v11;
  }
  else
  {
    double v12 = a3.size.height + -26.0;
    double v13 = a3.size.height + -26.0 + 8.0 + 13.0;
    unsigned int v14 = [(SRCompactTextRequestField *)self _laysOutContentRightToLeft];
    if (v14) {
      double v15 = v13;
    }
    else {
      double v15 = 13.0;
    }
    if (v14) {
      double v16 = 13.0;
    }
    else {
      double v16 = v13;
    }
    double v8 = x + v15;
    double v9 = y + 13.0;
    double v10 = width - (v15 + v16);
  }
  double v17 = v12;
  result.size.double height = v17;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (CGRect)_adjustTextOrEditingRect:(CGRect)a3 forBounds:(CGRect)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v9 = a4.size.height - (a3.origin.y + a3.size.height);
  [(SRCompactTextRequestField *)self bounds];
  double v11 = v10 - y - v9;
  [(SRCompactTextRequestField *)self _padding];
  double v13 = v11 - v12;
  unsigned int v14 = [(SRCompactTextRequestField *)self font];
  [v14 lineHeight];
  double v16 = v13 - v15;

  double v17 = height - v16;
  UIRectCenteredRect();
  double v19 = v18;
  double v20 = [(SRCompactTextRequestField *)self leftView];
  [v20 frame];
  double v22 = x + v21;

  double v23 = v22;
  double v24 = v19;
  double v25 = width;
  double v26 = v17;
  result.size.double height = v26;
  result.size.CGFloat width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = [(SRCompactTextRequestField *)self _preferredTextAlignment];
  BOOL v9 = [(SRCompactTextRequestField *)self _laysOutContentRightToLeft];

  -[SRCompactTextRequestField _placeholderRectForBounds:alignment:layingOutContentRightToLeft:](self, "_placeholderRectForBounds:alignment:layingOutContentRightToLeft:", v8, v9, x, y, width, height);
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  -[SRCompactTextRequestField _textRectForBounds:alignment:layingOutContentRightToLeft:](self, "_textRectForBounds:alignment:layingOutContentRightToLeft:", [(SRCompactTextRequestField *)self _preferredTextAlignment], [(SRCompactTextRequestField *)self _laysOutContentRightToLeft], a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  -[SRCompactTextRequestField _adjustTextOrEditingRect:forBounds:](self, "_adjustTextOrEditingRect:forBounds:");
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  -[SRCompactTextRequestField _textRectForBounds:alignment:layingOutContentRightToLeft:](self, "_textRectForBounds:alignment:layingOutContentRightToLeft:", [(SRCompactTextRequestField *)self _preferredTextAlignment], [(SRCompactTextRequestField *)self _laysOutContentRightToLeft], a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  -[SRCompactTextRequestField _adjustTextOrEditingRect:forBounds:](self, "_adjustTextOrEditingRect:forBounds:");
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SRCompactTextRequestField *)self _laysOutContentRightToLeft];
  UIRectCenteredYInRectScale();
  if ([(SRCompactTextRequestField *)self textAlignment] == (id)1)
  {
    -[SRCompactTextRequestField _placeholderRectForBounds:alignment:layingOutContentRightToLeft:](self, "_placeholderRectForBounds:alignment:layingOutContentRightToLeft:", 1, 0, x, y, width, height);
  }
  else
  {
    double v8 = x;
    double v9 = y;
    double v10 = width;
    double v11 = height;
  }
  double v12 = [(SRCompactTextRequestField *)self leftView];

  if (v12)
  {
    double v13 = [(SRCompactTextRequestField *)self leftView];
    [v13 frame];
  }
  UIRectCenteredYInRectScale();
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SRCompactTextRequestField *)self _laysOutContentRightToLeft];
  UIRectCenteredYInRectScale();
  if ([(SRCompactTextRequestField *)self textAlignment] == (id)1)
  {
    -[SRCompactTextRequestField _placeholderRectForBounds:alignment:layingOutContentRightToLeft:](self, "_placeholderRectForBounds:alignment:layingOutContentRightToLeft:", 1, 1, x, y, width, height);
  }
  else
  {
    double v8 = x;
    double v9 = y;
    double v10 = width;
    double v11 = height;
  }
  CGRectGetMaxX(*(CGRect *)&v8);
  UIRectCenteredYInRectScale();
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(SRCompactTextRequestField *)self _laysOutContentRightToLeft]) {
    -[SRCompactTextRequestField leftViewRectForBounds:](self, "leftViewRectForBounds:", x, y, width, height);
  }
  else {
    -[SRCompactTextRequestField rightViewRectForBounds:](self, "rightViewRectForBounds:", x, y, width, height);
  }
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v8.receiver = self;
  v8.super_class = (Class)SRCompactTextRequestField;
  [(SRCompactTextRequestField *)&v8 intrinsicContentSize];
  double v4 = v3;
  [(SRCompactTextRequestField *)self _preferredHeight];
  double v6 = v5;
  double v7 = v4;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)SRCompactTextRequestField;
  -[SRCompactTextRequestField sizeThatFits:](&v15, "sizeThatFits:", a3.width, a3.height);
  double v6 = v5;
  double v8 = v7;
  [(SRCompactTextRequestField *)self _preferredHeight];
  double v10 = v9;
  if (!sub_100076430(width, v9, v6, v8))
  {
    double v11 = sub_100076444(v6, v8, width, v10);
    double width = sub_10007645C(v11);
    double v10 = v12;
  }
  double v13 = width;
  double v14 = v10;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)SRCompactTextRequestField;
  [(SRCompactTextRequestField *)&v16 layoutSubviews];
  double v3 = [(SRCompactTextRequestField *)self _suggestionsButton];
  [v3 frame];
  double v5 = v4;
  CGFloat v7 = v6;
  suggestionsButton = self->_suggestionsButton;
  [(SRCompactTextRequestField *)self bounds];
  -[SRCompactTextRequestSiriSuggestionsButton sizeThatFits:](suggestionsButton, "sizeThatFits:", v9, v10);
  double v12 = v11;
  double v14 = v13;
  [(SRCompactTextRequestField *)self bounds];
  double Height = CGRectGetHeight(v17);
  v18.origin.double x = v5;
  v18.origin.double y = v7;
  v18.size.double width = v12;
  v18.size.double height = v14;
  [v3 setFrame:v5, (Height - CGRectGetHeight(v18)) * 0.5, v12, v14];
  [(SRCompactTextRequestField *)self _updateVisualStyling];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRCompactTextRequestField;
  -[SRCompactTextRequestField _setContinuousCornerRadius:](&v6, "_setContinuousCornerRadius:");
  double v5 = [(SRCompactTextRequestField *)self _backgroundView];
  [v5 _setContinuousCornerRadius:a3];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SRCompactTextRequestField;
  [(SRCompactTextRequestField *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(SRCompactTextRequestField *)self _updateBorderVisualStyling];
}

- (BOOL)resignFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)SRCompactTextRequestField;
  BOOL v3 = [(SRCompactTextRequestField *)&v5 resignFirstResponder];
  if (v3) {
    [(SRCompactTextRequestField *)self setText:&stru_1001463E0];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRCompactTextRequestField;
  [(SRCompactTextRequestField *)&v12 traitCollectionDidChange:v4];
  objc_super v5 = [(SRCompactTextRequestField *)self _styledViews];
  [v5 removeAllObjects];

  [(SRCompactTextRequestField *)self _updateVisualStyling];
  if (v4)
  {
    objc_super v6 = [v4 preferredContentSizeCategory];
    CGFloat v7 = [(SRCompactTextRequestField *)self traitCollection];
    double v8 = [v7 preferredContentSizeCategory];

    if (v6 != v8)
    {
      double v9 = [(SRCompactTextRequestField *)self traitCollection];
      double v10 = [v9 preferredContentSizeCategory];
      IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v10);

      if (IsAccessibilityCategory) {
        [(SRCompactTextRequestField *)self invalidateIntrinsicContentSize];
      }
    }
  }
}

- (void)textRequestSuggestionsButton:(id)a3 didEnableSuggestions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SRCompactTextRequestField *)self buttonDelegate];
  [v7 textRequestSuggestionsButton:v6 didEnableSuggestions:v4];
}

- (SRCompactTextRequestSiriSuggestionsButtonDelegate)buttonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonDelegate);

  return (SRCompactTextRequestSiriSuggestionsButtonDelegate *)WeakRetained;
}

- (void)setButtonDelegate:(id)a3
{
}

- (MTMaterialView)_backgroundView
{
  return self->_backgroundView;
}

- (SRCompactTextRequestSiriSuggestionsButton)_suggestionsButton
{
  return self->_suggestionsButton;
}

- (NSHashTable)_styledViews
{
  return self->_styledViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styledViews, 0);
  objc_storeStrong((id *)&self->_suggestionsButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_destroyWeak((id *)&self->_buttonDelegate);
}

@end