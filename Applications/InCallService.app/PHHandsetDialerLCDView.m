@interface PHHandsetDialerLCDView
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)highlighted;
- (BOOL)isHostedInRemoteViewController;
- (BOOL)resignFirstResponder;
- (BOOL)shouldInsertStringAtCurrentPosition:(id)a3 deletingPreviousCharacter:(BOOL)a4;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (CGSize)intrinsicContentSize;
- (DialerLCDFieldDelegate)delegate;
- (NSArray)numberLabelHorizontalConstraints;
- (NSLayoutConstraint)addContactButtonTopConstraint;
- (NSLayoutConstraint)pillViewTopConstraint;
- (PHHandsetDialerLCDView)initWithFrame:(CGRect)a3 forDialerType:(int)a4;
- (PHLCDViewTextField)numberTextField;
- (TPPillView)pillView;
- (TUFeatureFlags)featureFlags;
- (TUSenderIdentity)selectedSenderIdentity;
- (UIButton)addContactButton;
- (UIButton)contactCountButton;
- (UIButton)searchButton;
- (UILabel)contactLabel;
- (UILayoutGuide)headerLayoutGuide;
- (UITextField)layoutTextField;
- (double)addContactButtonContentInsetConstant;
- (double)addContactButtonTopConstraintConstant;
- (double)nameAndLabelFontSize;
- (double)numberLabelMaximumFontSize;
- (double)pillViewTopConstraintConstant;
- (double)pillViewTopOffset;
- (double)remoteViewControllerLCDOffset;
- (float)addNumberFontSize;
- (float)numberLabelMinimumFontSize;
- (float)pillViewHiddenOffset;
- (float)spacingBetweenContactResultButtons;
- (float)spacingBetweenNumberAndContactResult;
- (float)spacingBetweenNumberBaselineAndNameBaseline;
- (id)attributedStringForName:(id)a3 label:(id)a4;
- (id)generateNumberLabelHorizontalConstraints;
- (id)menuForPillView:(id)a3;
- (id)newAddContactButton;
- (id)numberLabelFont;
- (id)text;
- (id)unformattedText;
- (int)dialerType;
- (void)_makeCalloutVisible:(BOOL)a3;
- (void)_menuDidHide:(id)a3;
- (void)addContactPressed:(id)a3;
- (void)applyLayoutConstraints;
- (void)checkAndUpdateVisibilityForView:(id)a3 shouldInvertVisibility:(BOOL)a4;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)deleteCharacter;
- (void)endEditing;
- (void)handleTapGesture:(id)a3;
- (void)insertStringAtCurrentPosition:(id)a3;
- (void)insertStringAtCurrentPosition:(id)a3 deletingPreviousCharacter:(BOOL)a4;
- (void)paste:(id)a3;
- (void)setAddContactButton:(id)a3;
- (void)setAddContactButtonTopConstraint:(id)a3;
- (void)setContactCountButton:(id)a3;
- (void)setContactLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDialerType:(int)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setHeaderLayoutGuide:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsHostedInRemoteViewController:(BOOL)a3;
- (void)setLayoutTextField:(id)a3;
- (void)setName:(id)a3 numberLabel:(id)a4;
- (void)setName:(id)a3 numberLabel:(id)a4 suggestion:(BOOL)a5;
- (void)setNumberLabelHorizontalConstraints:(id)a3;
- (void)setNumberTextField:(id)a3;
- (void)setPillView:(id)a3;
- (void)setPillViewTopConstraint:(id)a3;
- (void)setSearchButton:(id)a3;
- (void)setSelectedSenderIdentity:(id)a3;
- (void)setSenderIdentity:(id)a3;
- (void)setText:(id)a3 needsFormat:(BOOL)a4;
- (void)setText:(id)a3 needsFormat:(BOOL)a4 name:(id)a5 label:(id)a6;
- (void)textField:(id)a3 didPasteString:(id)a4;
- (void)textField:(id)a3 didUpdateString:(id)a4;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateAddAndDeleteButtonForText:(id)a3 name:(id)a4 animated:(BOOL)a5;
- (void)updateAddAndDeleteButtonForText:(id)a3 name:(id)a4 label:(id)a5 suggestion:(BOOL)a6 animated:(BOOL)a7;
- (void)updateNumberLabelHorizontalConstraints;
@end

@implementation PHHandsetDialerLCDView

- (double)numberLabelMaximumFontSize
{
  +[PHUIConfiguration dialerLCDFontSize];
  return result;
}

- (float)numberLabelMinimumFontSize
{
  return 25.0;
}

- (float)spacingBetweenNumberBaselineAndNameBaseline
{
  unint64_t v2 = +[PHUIConfiguration screenSize];
  float result = 25.0;
  switch(v2)
  {
    case 0xBuLL:
    case 0xDuLL:
    case 0xFuLL:
      return result;
    case 0xCuLL:
    case 0xEuLL:
      float v4 = 42.0;
      goto LABEL_6;
    default:
      if (v2)
      {
        float v4 = 34.0;
LABEL_6:
        float result = v4;
      }
      else
      {
        float result = 24.0;
      }
      break;
  }
  return result;
}

- (id)numberLabelFont
{
  unint64_t v2 = +[UIFont systemFontOfSize:36.0];
  v3 = [v2 withCaseSensitiveAttribute];

  return v3;
}

- (double)nameAndLabelFontSize
{
  +[PHUIConfiguration dialerLCDLabelFontSize];
  return result;
}

- (float)addNumberFontSize
{
  unint64_t v2 = +[PHUIConfiguration screenSize];
  float result = 18.0;
  if (!v2) {
    return 16.0;
  }
  return result;
}

- (id)generateNumberLabelHorizontalConstraints
{
  CFStringRef v7 = @"numberLabel";
  unint64_t v2 = [(PHHandsetDialerLCDView *)self numberTextField];
  v8 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  float v4 = +[NSString stringWithFormat:@"|[numberLabel]|"];
  v5 = +[NSLayoutConstraint constraintsWithVisualFormat:v4 options:0x10000 metrics:0 views:v3];

  return v5;
}

- (PHHandsetDialerLCDView)initWithFrame:(CGRect)a3 forDialerType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v44.receiver = self;
  v44.super_class = (Class)PHHandsetDialerLCDView;
  v5 = -[PHHandsetDialerLCDView initWithFrame:](&v44, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v5->_featureFlags;
    v5->_featureFlags = v6;

    [(PHHandsetDialerLCDView *)v5 setDialerType:v4];
    v8 = +[UIColor clearColor];
    [(PHHandsetDialerLCDView *)v5 setBackgroundColor:v8];

    if ([(PHHandsetDialerLCDView *)v5 canBecomeFirstResponder]) {
      [(PHHandsetDialerLCDView *)v5 becomeFirstResponder];
    }
    v9 = [PHLCDViewTextField alloc];
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v13 = -[PHLCDViewTextField initWithFrame:](v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    numberTextField = v5->_numberTextField;
    v5->_numberTextField = v13;

    [(PHLCDViewTextField *)v5->_numberTextField setDelegate:v5];
    [(PHLCDViewTextField *)v5->_numberTextField setLcdViewTextFieldDelegate:v5];
    [(PHLCDViewTextField *)v5->_numberTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = +[UIColor clearColor];
    [(PHLCDViewTextField *)v5->_numberTextField setBackgroundColor:v15];

    [(PHLCDViewTextField *)v5->_numberTextField setOpaque:0];
    v16 = +[UIColor dynamicLabelColor];
    [(PHLCDViewTextField *)v5->_numberTextField setTextColor:v16];

    [(PHLCDViewTextField *)v5->_numberTextField setTextAlignment:1];
    v17 = [(PHHandsetDialerLCDView *)v5 numberLabelFont];
    [(PHLCDViewTextField *)v5->_numberTextField setFont:v17];

    [(PHHandsetDialerLCDView *)v5 numberLabelMinimumFontSize];
    [(PHLCDViewTextField *)v5->_numberTextField setMinimumFontSize:v18];
    [(PHLCDViewTextField *)v5->_numberTextField setAdjustsFontSizeToFitWidth:1];
    [(PHLCDViewTextField *)v5->_numberTextField setText:&stru_1002D6110];
    [(PHLCDViewTextField *)v5->_numberTextField sizeToFit];
    LODWORD(v19) = 1144750080;
    [(PHLCDViewTextField *)v5->_numberTextField setContentCompressionResistancePriority:0 forAxis:v19];
    LODWORD(v20) = 1132068864;
    [(PHLCDViewTextField *)v5->_numberTextField setContentHuggingPriority:0 forAxis:v20];
    [(PHHandsetDialerLCDView *)v5 addSubview:v5->_numberTextField];
    id v21 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v5 action:"handleTapGesture:"];
    [(PHHandsetDialerLCDView *)v5 addGestureRecognizer:v21];
    id v22 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v5 action:"handleTapGesture:"];
    [(PHLCDViewTextField *)v5->_numberTextField addGestureRecognizer:v22];
    v23 = -[PHLCDViewTextField initWithFrame:]([PHLCDViewTextField alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    layoutTextField = v5->_layoutTextField;
    v5->_layoutTextField = &v23->super;

    [(UITextField *)v5->_layoutTextField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v5->_layoutTextField setTextAlignment:1];
    v25 = [(PHHandsetDialerLCDView *)v5 numberLabelFont];
    [(UITextField *)v5->_layoutTextField setFont:v25];

    [(UITextField *)v5->_layoutTextField setText:@"M"];
    [(UITextField *)v5->_layoutTextField setHidden:1];
    [(UITextField *)v5->_layoutTextField sizeToFit];
    LODWORD(v26) = 1144750080;
    [(UITextField *)v5->_layoutTextField setContentCompressionResistancePriority:0 forAxis:v26];
    LODWORD(v27) = 1132068864;
    [(UITextField *)v5->_layoutTextField setContentHuggingPriority:0 forAxis:v27];
    [(PHHandsetDialerLCDView *)v5 addSubview:v5->_layoutTextField];
    id v28 = [(PHHandsetDialerLCDView *)v5 newAddContactButton];
    [(PHHandsetDialerLCDView *)v5 setAddContactButton:v28];

    v29 = [(PHHandsetDialerLCDView *)v5 addContactButton];
    [v29 addTarget:v5 action:"addContactPressed:" forEvents:64];

    v30 = [(PHHandsetDialerLCDView *)v5 addContactButton];
    [v30 setAlpha:0.0];

    v31 = [(PHHandsetDialerLCDView *)v5 addContactButton];
    [(PHHandsetDialerLCDView *)v5 addSubview:v31];

    id v32 = objc_alloc_init((Class)UILabel);
    [(PHHandsetDialerLCDView *)v5 setContactLabel:v32];

    v33 = +[UIColor dynamicLabelColor];
    v34 = [(PHHandsetDialerLCDView *)v5 contactLabel];
    [v34 setTextColor:v33];

    v35 = [(PHHandsetDialerLCDView *)v5 contactLabel];
    [v35 setTranslatesAutoresizingMaskIntoConstraints:0];

    v36 = +[UIFont systemFontOfSize:36.0];
    v37 = [(PHHandsetDialerLCDView *)v5 contactLabel];
    [v37 setFont:v36];

    v38 = [(PHHandsetDialerLCDView *)v5 contactLabel];
    [v38 sizeToFit];

    v39 = [(PHHandsetDialerLCDView *)v5 contactLabel];
    [v39 setAlpha:0.0];

    v40 = [(PHHandsetDialerLCDView *)v5 contactLabel];
    [(PHHandsetDialerLCDView *)v5 addSubview:v40];

    id v41 = objc_alloc_init((Class)UILayoutGuide);
    [(PHHandsetDialerLCDView *)v5 setHeaderLayoutGuide:v41];
    v42 = [(PHHandsetDialerLCDView *)v5 headerLayoutGuide];
    [(PHHandsetDialerLCDView *)v5 addLayoutGuide:v42];

    [(PHHandsetDialerLCDView *)v5 applyLayoutConstraints];
  }
  return v5;
}

- (id)menuForPillView:(id)a3
{
  uint64_t v4 = [(PHHandsetDialerLCDView *)self delegate];
  v5 = [(PHHandsetDialerLCDView *)self selectedSenderIdentity];
  v6 = [v4 senderIdentityMenuForDialerField:self selectedSenderIdentity:v5];

  return v6;
}

- (void)setSenderIdentity:(id)a3
{
  id v8 = a3;
  v5 = [(PHHandsetDialerLCDView *)self pillView];
  v6 = v5;
  if (a3)
  {
    [v5 setHidden:0];

    v6 = [v8 localizedShortName];
    CFStringRef v7 = [(PHHandsetDialerLCDView *)self pillView];
    [v7 setBadgeText:v6];
  }
  else
  {
    [v5 setHidden:1];
  }

  [(PHHandsetDialerLCDView *)self setSelectedSenderIdentity:v8];
}

- (CGSize)intrinsicContentSize
{
  unint64_t v2 = +[PHUIConfiguration handsetDialerSize];
  double v3 = 52.0;
  if (v2 != 1) {
    double v3 = 64.0;
  }
  double v4 = 340.0;
  result.double height = v3;
  result.double width = v4;
  return result;
}

- (void)dealloc
{
  double v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHHandsetDialerLCDView;
  [(PHHandsetDialerLCDView *)&v4 dealloc];
}

- (void)endEditing
{
}

- (id)text
{
  unint64_t v2 = [(PHLCDViewTextField *)self->_numberTextField text];
  double v3 = +[NSCharacterSet unicodeDirectionalCharactersSet];
  objc_super v4 = [v2 stringByRemovingCharactersFromSet:v3];

  return v4;
}

- (id)unformattedText
{
  unint64_t v2 = [(PHHandsetDialerLCDView *)self text];
  double v3 = [v2 unformattedNumber];

  return v3;
}

- (void)setText:(id)a3 needsFormat:(BOOL)a4 name:(id)a5 label:(id)a6
{
  numberTextField = self->_numberTextField;
  id v9 = a5;
  id v10 = a3;
  [(PHLCDViewTextField *)numberTextField setText:v10];
  [(PHHandsetDialerLCDView *)self updateAddAndDeleteButtonForText:v10 name:v9 animated:1];
}

- (void)setText:(id)a3 needsFormat:(BOOL)a4
{
}

- (void)deleteCharacter
{
  unsigned __int8 v3 = [(PHLCDViewTextField *)self->_numberTextField isEditing];
  numberTextField = self->_numberTextField;
  if (v3)
  {
    [(PHLCDViewTextField *)numberTextField deleteBackward];
  }
  else
  {
    id v6 = [(PHLCDViewTextField *)numberTextField text];
    v5 = UIFormattedPhoneStringByRemovingFromEnd();
    [(PHLCDViewTextField *)numberTextField setText:v5];
  }
}

- (BOOL)shouldInsertStringAtCurrentPosition:(id)a3 deletingPreviousCharacter:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CFStringRef v7 = +[NSCharacterSet pauseCharacterSet];
  id v8 = [v6 rangeOfCharacterFromSet:v7];

  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v4;
  }
  if (v9) {
    return 1;
  }
  if ([(PHLCDViewTextField *)self->_numberTextField isEditing])
  {
    v11 = +[NSCharacterSet unicodeDirectionalCharactersSet];
    v12 = [(PHLCDViewTextField *)self->_numberTextField text];
    unsigned int v13 = [v11 characterIsMember:[v12 characterAtIndex:0]];

    numberTextField = self->_numberTextField;
    if (v13)
    {
      return (unint64_t)[(PHLCDViewTextField *)numberTextField selectionRange] > 2;
    }
    else
    {
      double v19 = [(PHLCDViewTextField *)numberTextField selectedTextRange];
      double v20 = [v19 start];
      id v21 = [(PHLCDViewTextField *)self->_numberTextField beginningOfDocument];
      BOOL v10 = v20 != v21;
    }
  }
  else
  {
    v15 = [(PHLCDViewTextField *)self->_numberTextField text];
    v16 = +[NSCharacterSet unicodeDirectionalCharactersSet];
    v17 = [v15 stringByTrimmingCharactersInSet:v16];

    float v18 = +[NSCharacterSet starAndOctothorpeCharacterSet];
    BOOL v10 = [v17 rangeOfCharacterFromSet:v18] != 0;
  }
  return v10;
}

- (void)insertStringAtCurrentPosition:(id)a3
{
}

- (void)insertStringAtCurrentPosition:(id)a3 deletingPreviousCharacter:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (-[PHHandsetDialerLCDView shouldInsertStringAtCurrentPosition:deletingPreviousCharacter:](self, "shouldInsertStringAtCurrentPosition:deletingPreviousCharacter:"))
  {
    if ([(PHLCDViewTextField *)self->_numberTextField isEditing])
    {
      if (v4) {
        [(PHLCDViewTextField *)self->_numberTextField deleteBackward];
      }
      numberTextField = self->_numberTextField;
      CFStringRef v7 = [(PHLCDViewTextField *)numberTextField selectedTextRange];
      [(PHLCDViewTextField *)numberTextField replaceRange:v7 withText:v9];
    }
    else
    {
      if (v4) {
        [(PHHandsetDialerLCDView *)self deleteCharacter];
      }
      id v8 = [(PHHandsetDialerLCDView *)self text];
      CFStringRef v7 = [v8 stringByAppendingString:v9];

      [(PHHandsetDialerLCDView *)self setText:v7 needsFormat:!v4];
    }

    [(PHHandsetDialerLCDView *)self _requestMakeCutCopyPasteCalloutVisible:0];
  }
}

- (void)setName:(id)a3 numberLabel:(id)a4
{
}

- (void)setName:(id)a3 numberLabel:(id)a4 suggestion:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PHHandsetDialerLCDView *)self text];
  [(PHHandsetDialerLCDView *)self updateAddAndDeleteButtonForText:v10 name:v9 label:v8 suggestion:v5 animated:1];
}

- (void)updateAddAndDeleteButtonForText:(id)a3 name:(id)a4 animated:(BOOL)a5
{
}

- (id)attributedStringForName:(id)a3 label:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)NSMutableAttributedString);
  id v9 = +[NSString stringWithFormat:@"%@", v7];
  id v10 = [v8 initWithString:v9];

  [(PHHandsetDialerLCDView *)self nameAndLabelFontSize];
  v11 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
  id v12 = [v7 length];

  [v10 addAttribute:NSFontAttributeName value:v11 range:0];
  if (v6)
  {
    id v13 = objc_alloc((Class)NSAttributedString);
    v14 = +[NSString stringWithFormat:@" %@", v6];
    id v15 = [v13 initWithString:v14];
    [v10 appendAttributedString:v15];

    [v11 pointSize];
    v16 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
    objc_msgSend(v10, "addAttribute:value:range:", NSFontAttributeName, v16, (unsigned char *)objc_msgSend(v10, "length") - (unsigned char *)objc_msgSend(v6, "length"), objc_msgSend(v6, "length"));
  }
  id v17 = [v10 copy];

  return v17;
}

- (void)checkAndUpdateVisibilityForView:(id)a3 shouldInvertVisibility:(BOOL)a4
{
  if (a4)
  {
    id v5 = a3;
    [v5 alpha];
    [v5 setAlpha:1.0 - v4];
  }
}

- (void)updateAddAndDeleteButtonForText:(id)a3 name:(id)a4 label:(id)a5 suggestion:(BOOL)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a4;
  id v12 = a5;
  id v13 = [a3 length];
  id v14 = v13;
  BOOL v15 = v13 != 0;
  if (v11)
  {
    v16 = [(PHHandsetDialerLCDView *)self attributedStringForName:v11 label:v12];
    id v17 = [(PHHandsetDialerLCDView *)self contactLabel];
    [v17 setAttributedText:v16];

    p_addContactButtonVisible = &self->_addContactButtonVisible;
    if (self->_addContactButtonVisible && v14 != 0)
    {
      double v20 = [(PHHandsetDialerLCDView *)self addContactButton];
      [v20 alpha];
      double v22 = v21;

      if (v22 >= 0.0)
      {
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100009A44;
        v38[3] = &unk_1002CD540;
        v38[4] = self;
        v23 = objc_retainBlock(v38);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_100009B10;
        v37[3] = &unk_1002CD518;
        v37[4] = self;
        v24 = v37;
LABEL_14:
        +[UIView animateWithDuration:v24 animations:v23 completion:0.150000006];
      }
    }
  }
  else
  {
    p_addContactButtonVisible = &self->_addContactButtonVisible;
    if (self->_addContactButtonVisible && v13 != 0)
    {
      double v26 = [(PHHandsetDialerLCDView *)self contactLabel];
      [v26 alpha];
      double v28 = v27;

      if (v28 >= 0.0)
      {
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100009B58;
        v36[3] = &unk_1002CD540;
        v36[4] = self;
        v23 = objc_retainBlock(v36);
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100009C24;
        v35[3] = &unk_1002CD518;
        v35[4] = self;
        v24 = v35;
        goto LABEL_14;
      }
    }
  }
  if (*p_addContactButtonVisible != v15 || self->_deleteButtonVisible != v15)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100009C6C;
    v31[3] = &unk_1002CD568;
    v31[4] = self;
    BOOL v33 = v15;
    id v32 = v11;
    BOOL v34 = v15;
    v29 = objc_retainBlock(v31);
    v30 = v29;
    if (v7) {
      +[UIView animateWithDuration:v29 animations:0.300000012];
    }
    else {
      ((void (*)(void *))v29[2])(v29);
    }
    BOOL *p_addContactButtonVisible = v15;
    self->_deleteButtonVisible = v15;
  }
}

- (void)_makeCalloutVisible:(BOOL)a3
{
  int v3 = a3;
  id v17 = +[UIMenuController sharedMenuController];
  if ([v17 isMenuVisible] != v3)
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    if (v3)
    {
      [(PHHandsetDialerLCDView *)self bounds];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      [(PHHandsetDialerLCDView *)self bounds];
      double v15 = floor(v14 * 0.5);
      if (v15 <= 25.0) {
        double v16 = v15;
      }
      else {
        double v16 = 25.0;
      }
      v19.origin.x = v7;
      v19.origin.double y = v9;
      v19.size.double width = v11;
      v19.size.double height = v13;
      CGRect v20 = CGRectInset(v19, 0.0, v16);
      [v17 setTargetRect:self inView:v20.origin.x, v20.origin.y, v20.size.width, v20.size.height];
      [v17 setArrowDirection:1];
      [v17 setMenuVisible:1 animated:1];
      [v5 addObserver:self selector:"_menuDidHide:" name:UIMenuControllerDidHideMenuNotification object:0];
    }
    else
    {
      [v17 setMenuVisible:0 animated:1];
      [v5 removeObserver:self name:UIMenuControllerDidHideMenuNotification object:0];
    }
  }
}

- (void)_menuDidHide:(id)a3
{
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)PHHandsetDialerLCDView;
  BOOL v3 = [(PHHandsetDialerLCDView *)&v5 resignFirstResponder];
  if (v3) {
    [(PHHandsetDialerLCDView *)self _makeCalloutVisible:0];
  }
  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("copy:" == a3
    && ([(PHHandsetDialerLCDView *)self text],
        CGFloat v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 length],
        v7,
        !v8))
  {
    BOOL v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PHHandsetDialerLCDView;
    BOOL v9 = [(PHHandsetDialerLCDView *)&v11 canPerformAction:a3 withSender:v6];
  }

  return v9;
}

- (void)copy:(id)a3
{
  id v5 = +[UIPasteboard generalPasteboard];
  double v4 = [(PHHandsetDialerLCDView *)self text];
  [v5 setString:v4];
}

- (void)paste:(id)a3
{
  double v4 = +[UIPasteboard generalPasteboard];
  id v9 = [v4 string];

  id v5 = v9;
  if (v9)
  {
    [(PHHandsetDialerLCDView *)self _makeCalloutVisible:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    id v5 = v9;
    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 dialerField:self stringWasPasted:v9];

      id v5 = v9;
    }
  }
}

- (void)handleTapGesture:(id)a3
{
  id v4 = +[UIMenuController sharedMenuController];
  -[PHHandsetDialerLCDView _makeCalloutVisible:](self, "_makeCalloutVisible:", [v4 isMenuVisible] ^ 1);
}

- (double)addContactButtonContentInsetConstant
{
  unsigned int v2 = +[PHUIConfiguration requiresSmallScreenConfig];
  double result = 10.0;
  if (v2) {
    return 5.0;
  }
  return result;
}

- (id)newAddContactButton
{
  BOOL v3 = +[UIButton buttonWithType:1];
  id v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  [(PHHandsetDialerLCDView *)self addContactButtonContentInsetConstant];
  [v3 setContentEdgeInsets:v5, v5, v5, v5];
  [v3 setOpaque:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v6) = 1144750080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v6];
  char v7 = +[UIColor systemBlueColor];
  [v3 setTintColor:v7];

  [v3 sizeToFit];
  id v8 = objc_alloc((Class)NSAttributedString);
  id v9 = +[NSBundle mainBundle];
  double v10 = [v9 localizedStringForKey:@"ADD_NUMBER" value:&stru_1002D6110 table:@"Dialer"];
  id v11 = [v8 initWithString:v10];
  [v3 setAttributedTitle:v11 forState:0];

  [(PHHandsetDialerLCDView *)self addNumberFontSize];
  CGFloat v13 = +[UIFont systemFontOfSize:v12];
  double v14 = [v3 titleLabel];
  [v14 setFont:v13];

  return v3;
}

- (TPPillView)pillView
{
  pillView = self->_pillView;
  if (!pillView)
  {
    id v4 = [objc_alloc((Class)TPPillView) initWithTitle:&stru_1002D6110 frame:3 CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v4 setDelegate:self];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v5) = 1148846080;
    [v4 setContentHuggingPriority:1 forAxis:v5];
    LODWORD(v6) = 1148846080;
    [v4 setContentHuggingPriority:0 forAxis:v6];
    char v7 = self->_pillView;
    self->_pillView = (TPPillView *)v4;

    pillView = self->_pillView;
  }

  return pillView;
}

- (void)applyLayoutConstraints
{
  BOOL v3 = [(PHHandsetDialerLCDView *)self addContactButton];
  [(PHHandsetDialerLCDView *)self addContactButtonTopConstraintConstant];
  double v5 = +[NSLayoutConstraint constraintWithItem:v3 attribute:11 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v4];
  [(PHHandsetDialerLCDView *)self setAddContactButtonTopConstraint:v5];

  double v6 = [(PHHandsetDialerLCDView *)self addContactButtonTopConstraint];
  [(PHHandsetDialerLCDView *)self addConstraint:v6];

  char v7 = [(PHHandsetDialerLCDView *)self addContactButton];
  id v8 = +[NSLayoutConstraint constraintWithItem:self attribute:4 relatedBy:0 toItem:v7 attribute:11 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v8];

  id v9 = [(PHHandsetDialerLCDView *)self addContactButton];
  double v10 = +[NSLayoutConstraint constraintWithItem:v9 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v10];

  id v11 = [(PHHandsetDialerLCDView *)self addContactButton];
  float v12 = [(PHHandsetDialerLCDView *)self layoutTextField];
  [(PHHandsetDialerLCDView *)self spacingBetweenNumberBaselineAndNameBaseline];
  double v14 = +[NSLayoutConstraint constraintWithItem:v11 attribute:11 relatedBy:0 toItem:v12 attribute:11 multiplier:1.0 constant:v13];
  [(PHHandsetDialerLCDView *)self addConstraint:v14];

  double v15 = [(PHHandsetDialerLCDView *)self addContactButton];
  double v16 = [(PHHandsetDialerLCDView *)self layoutTextField];
  id v17 = +[NSLayoutConstraint constraintWithItem:v15 attribute:9 relatedBy:0 toItem:v16 attribute:9 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v17];

  float v18 = [(PHHandsetDialerLCDView *)self numberTextField];
  CGRect v19 = [(PHHandsetDialerLCDView *)self layoutTextField];
  CGRect v20 = +[NSLayoutConstraint constraintWithItem:v18 attribute:10 relatedBy:0 toItem:v19 attribute:10 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v20];

  double v21 = [(PHHandsetDialerLCDView *)self numberTextField];
  double v22 = [(PHHandsetDialerLCDView *)self layoutTextField];
  v23 = +[NSLayoutConstraint constraintWithItem:v21 attribute:9 relatedBy:0 toItem:v22 attribute:9 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v23];

  v24 = [(PHHandsetDialerLCDView *)self contactLabel];
  v25 = [(PHHandsetDialerLCDView *)self addContactButton];
  double v26 = +[NSLayoutConstraint constraintWithItem:v24 attribute:9 relatedBy:0 toItem:v25 attribute:9 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v26];

  double v27 = [(PHHandsetDialerLCDView *)self contactLabel];
  double v28 = [(PHHandsetDialerLCDView *)self addContactButton];
  v29 = +[NSLayoutConstraint constraintWithItem:v27 attribute:12 relatedBy:0 toItem:v28 attribute:12 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v29];

  v30 = [(PHHandsetDialerLCDView *)self contactLabel];
  v31 = +[NSLayoutConstraint constraintWithItem:v30 attribute:5 relatedBy:1 toItem:self attribute:5 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v31];

  id v32 = [(PHHandsetDialerLCDView *)self contactLabel];
  BOOL v33 = +[NSLayoutConstraint constraintWithItem:v32 attribute:6 relatedBy:-1 toItem:self attribute:6 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v33];

  [(PHHandsetDialerLCDView *)self updateNumberLabelHorizontalConstraints];
}

- (void)updateNumberLabelHorizontalConstraints
{
  BOOL v3 = [(PHHandsetDialerLCDView *)self numberLabelHorizontalConstraints];

  if (v3)
  {
    double v4 = [(PHHandsetDialerLCDView *)self numberLabelHorizontalConstraints];
    [(PHHandsetDialerLCDView *)self removeConstraints:v4];
  }
  double v5 = [(PHHandsetDialerLCDView *)self generateNumberLabelHorizontalConstraints];
  [(PHHandsetDialerLCDView *)self setNumberLabelHorizontalConstraints:v5];

  id v6 = [(PHHandsetDialerLCDView *)self numberLabelHorizontalConstraints];
  [(PHHandsetDialerLCDView *)self addConstraints:v6];
}

- (double)addContactButtonTopConstraintConstant
{
  +[PHUIConfiguration yOffsetForDialerLCDView];
  double v4 = v3;
  [(PHHandsetDialerLCDView *)self pillViewTopOffset];
  double v6 = v4 + v5;
  [(PHHandsetDialerLCDView *)self remoteViewControllerLCDOffset];
  return v6 - v7;
}

- (double)pillViewTopConstraintConstant
{
  double v3 = 0.0;
  if (+[PHInCallUIUtilities hasMultipleSenderIdentities]&& [(PHHandsetDialerLCDView *)self isHostedInRemoteViewController])
  {
    unint64_t v4 = +[PHUIConfiguration screenSize];
    if (v4 > 0xF) {
      return 13.0;
    }
    double v3 = 10.0;
    if (((1 << v4) & 0xA200) == 0)
    {
      if (((1 << v4) & 3) != 0) {
        return 0.0;
      }
      return 13.0;
    }
  }
  return v3;
}

- (float)pillViewHiddenOffset
{
  unsigned int v2 = +[PHInCallUIUtilities hasMultipleSenderIdentities];
  LODWORD(v3) = 30.0;
  if (v2)
  {
    uint64_t v4 = +[PHUIConfiguration screenSize];
    if (v4 <= 8)
    {
      if (v4)
      {
        if (v4 != 1)
        {
LABEL_15:
          LODWORD(v3) = 9.0;
          return *(float *)&v3;
        }
        LODWORD(v3) = 2.0;
      }
      else
      {
        LODWORD(v3) = 0;
      }
    }
    else
    {
      LODWORD(v3) = 6.0;
      if (v4 != 9 && v4 != 13 && v4 != 15) {
        goto LABEL_15;
      }
    }
  }
  return *(float *)&v3;
}

- (float)spacingBetweenNumberAndContactResult
{
  uint64_t v3 = +[PHUIConfiguration screenSize];
  if (v3 <= 8)
  {
    if (v3)
    {
      if (v3 != 1) {
        return 19.0;
      }
      BOOL v7 = ![(PHHandsetDialerLCDView *)self isHostedInRemoteViewController];
      float result = 14.0;
      float v8 = 6.0;
    }
    else
    {
      BOOL v7 = ![(PHHandsetDialerLCDView *)self isHostedInRemoteViewController];
      float result = 2.0;
      float v8 = 0.0;
    }
    if (!v7) {
      return v8;
    }
  }
  else
  {
    float result = 10.0;
    if (v3 != 9 && v3 != 13 && v3 != 15) {
      return 19.0;
    }
  }
  return result;
}

- (float)spacingBetweenContactResultButtons
{
  unint64_t v3 = +[PHUIConfiguration screenSize];
  if (v3 == 1) {
    return 5.0;
  }
  if (v3) {
    return 10.0;
  }
  unsigned int v4 = [(PHHandsetDialerLCDView *)self isHostedInRemoteViewController];
  float result = 5.0;
  if (v4) {
    return 2.0;
  }
  return result;
}

- (double)pillViewTopOffset
{
  unsigned int v2 = +[PHInCallUIUtilities hasMultipleSenderIdentities];
  double result = 0.0;
  if (v2)
  {
    unint64_t v4 = +[PHUIConfiguration handsetDialerSpacing];
    double result = 0.0;
    if (v4 == 2) {
      double result = 25.0;
    }
    if (!v4) {
      return 30.0;
    }
  }
  return result;
}

- (double)remoteViewControllerLCDOffset
{
  double v2 = 0.0;
  if ([(PHHandsetDialerLCDView *)self isHostedInRemoteViewController])
  {
    unint64_t v3 = +[PHUIConfiguration handsetDialerSpacing];
    if (v3 <= 6) {
      return dbl_100284218[v3];
    }
  }
  return v2;
}

- (void)setIsHostedInRemoteViewController:(BOOL)a3
{
  if (self->_isHostedInRemoteViewController != a3)
  {
    self->_isHostedInRemoteViewController = a3;
    [(PHHandsetDialerLCDView *)self addContactButtonTopConstraintConstant];
    double v5 = v4;
    id v6 = [(PHHandsetDialerLCDView *)self addContactButtonTopConstraint];
    [v6 setConstant:v5];
  }
}

- (void)textField:(id)a3 didPasteString:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 dialerField:self stringWasPasted:v6];
    }
  }
  [v10 endEditing:1];
}

- (void)textField:(id)a3 didUpdateString:(id)a4
{
  id v7 = a3;
  double v5 = [(PHHandsetDialerLCDView *)self text];
  id v6 = [v5 length];

  if (!v6) {
    [v7 endEditing:1];
  }
}

- (void)addContactPressed:(id)a3
{
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  unint64_t v3 = [(PHLCDViewTextField *)self->_numberTextField text];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  BOOL v4 = +[UIMenuController sharedMenuController];
  unsigned int v5 = [v4 isMenuVisible];

  if (v5)
  {
    [(PHHandsetDialerLCDView *)self _makeCalloutVisible:0];
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = [(PHHandsetDialerLCDView *)self text];
  [(PHHandsetDialerLCDView *)self setText:v4 needsFormat:1];
}

- (int)dialerType
{
  return self->_dialerType;
}

- (void)setDialerType:(int)a3
{
  self->_dialerType = a3;
}

- (UIButton)addContactButton
{
  return (UIButton *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAddContactButton:(id)a3
{
}

- (void)setPillView:(id)a3
{
}

- (UIButton)searchButton
{
  return (UIButton *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSearchButton:(id)a3
{
}

- (UIButton)contactCountButton
{
  return (UIButton *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContactCountButton:(id)a3
{
}

- (UILabel)contactLabel
{
  return (UILabel *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContactLabel:(id)a3
{
}

- (DialerLCDFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DialerLCDFieldDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (PHLCDViewTextField)numberTextField
{
  return self->_numberTextField;
}

- (void)setNumberTextField:(id)a3
{
}

- (BOOL)isHostedInRemoteViewController
{
  return self->_isHostedInRemoteViewController;
}

- (UILayoutGuide)headerLayoutGuide
{
  return self->_headerLayoutGuide;
}

- (void)setHeaderLayoutGuide:(id)a3
{
}

- (NSArray)numberLabelHorizontalConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNumberLabelHorizontalConstraints:(id)a3
{
}

- (UITextField)layoutTextField
{
  return self->_layoutTextField;
}

- (void)setLayoutTextField:(id)a3
{
}

- (NSLayoutConstraint)addContactButtonTopConstraint
{
  return self->_addContactButtonTopConstraint;
}

- (void)setAddContactButtonTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)pillViewTopConstraint
{
  return self->_pillViewTopConstraint;
}

- (void)setPillViewTopConstraint:(id)a3
{
}

- (TUSenderIdentity)selectedSenderIdentity
{
  return self->_selectedSenderIdentity;
}

- (void)setSelectedSenderIdentity:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_selectedSenderIdentity, 0);
  objc_storeStrong((id *)&self->_pillViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_addContactButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_layoutTextField, 0);
  objc_storeStrong((id *)&self->_numberLabelHorizontalConstraints, 0);
  objc_storeStrong((id *)&self->_headerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_numberTextField, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactLabel, 0);
  objc_storeStrong((id *)&self->_contactCountButton, 0);
  objc_storeStrong((id *)&self->_searchButton, 0);
  objc_storeStrong((id *)&self->_pillView, 0);

  objc_storeStrong((id *)&self->_addContactButton, 0);
}

@end