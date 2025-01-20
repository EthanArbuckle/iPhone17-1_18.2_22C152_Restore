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
- (MPContactSearchResult)contactSearchResult;
- (NSArray)numberLabelHorizontalConstraints;
- (NSLayoutConstraint)addContactButtonTopConstraint;
- (NSLayoutConstraint)pillViewTopConstraint;
- (PHDialerContactResultButtonView)contactCountButtonView;
- (PHDialerContactResultButtonView)contactResultButtonView;
- (PHHandsetDialerLCDView)initWithFrame:(CGRect)a3 forDialerType:(int)a4;
- (PHLCDViewTextField)numberTextField;
- (TPPillView)pillView;
- (TUFeatureFlags)featureFlags;
- (TUSenderIdentity)selectedSenderIdentity;
- (UIButton)addContactButton;
- (UIButton)contactCountButton;
- (UIButton)contactResultButton;
- (UIButton)searchButton;
- (UILabel)contactLabel;
- (UILayoutGuide)headerLayoutGuide;
- (UITextField)layoutTextField;
- (UIView)separator;
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
- (id)newContactResultButton;
- (id)newSearchButton;
- (id)numberLabelFont;
- (id)resultContact;
- (id)resultContactPhoneNumber;
- (id)text;
- (id)unformattedText;
- (int)dialerType;
- (unint64_t)contactResultCount;
- (void)_makeCalloutVisible:(BOOL)a3;
- (void)_menuDidHide:(id)a3;
- (void)addContactPressed:(id)a3;
- (void)applyLayoutConstraints;
- (void)applyLayoutConstraintsForSmartDialer;
- (void)checkAndUpdateVisibilityForView:(id)a3 shouldInvertVisibility:(BOOL)a4;
- (void)contactCountButtonPressed:(id)a3;
- (void)contactResultPressed:(id)a3;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)deleteCharacter;
- (void)endEditing;
- (void)handleTapGesture:(id)a3;
- (void)hideContactResultsButtons;
- (void)insertStringAtCurrentPosition:(id)a3;
- (void)insertStringAtCurrentPosition:(id)a3 deletingPreviousCharacter:(BOOL)a4;
- (void)paste:(id)a3;
- (void)setAddContactButton:(id)a3;
- (void)setAddContactButtonTopConstraint:(id)a3;
- (void)setContactCountButton:(id)a3;
- (void)setContactCountButtonView:(id)a3;
- (void)setContactLabel:(id)a3;
- (void)setContactResultButton:(id)a3;
- (void)setContactResultButtonView:(id)a3;
- (void)setContactResultCount:(unint64_t)a3;
- (void)setContactSearchResult:(id)a3;
- (void)setContactSearchResults:(id)a3 hasCompleteMatch:(BOOL)a4;
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
- (void)setSeparator:(id)a3;
- (void)setText:(id)a3 needsFormat:(BOOL)a4;
- (void)setText:(id)a3 needsFormat:(BOOL)a4 name:(id)a5 label:(id)a6;
- (void)textField:(id)a3 didPasteString:(id)a4;
- (void)textField:(id)a3 didUpdateString:(id)a4;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateAddAndDeleteButtonForText:(id)a3 name:(id)a4 animated:(BOOL)a5;
- (void)updateAddAndDeleteButtonForText:(id)a3 name:(id)a4 label:(id)a5 suggestion:(BOOL)a6 animated:(BOOL)a7;
- (void)updateContactResultButton;
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
  v90.receiver = self;
  v90.super_class = (Class)PHHandsetDialerLCDView;
  v5 = -[PHHandsetDialerLCDView initWithFrame:](&v90, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
    [(PHLCDViewTextField *)v5->_numberTextField setText:&stru_100285990];
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

    v31 = [(PHHandsetDialerLCDView *)v5 featureFlags];
    unsigned __int8 v32 = [v31 smartDialerEnabled];

    if ((v32 & 1) == 0)
    {
      v33 = [(PHHandsetDialerLCDView *)v5 addContactButton];
      [(PHHandsetDialerLCDView *)v5 addSubview:v33];
    }
    id v34 = objc_alloc_init((Class)UILabel);
    [(PHHandsetDialerLCDView *)v5 setContactLabel:v34];

    v35 = +[UIColor dynamicLabelColor];
    v36 = [(PHHandsetDialerLCDView *)v5 contactLabel];
    [v36 setTextColor:v35];

    v37 = [(PHHandsetDialerLCDView *)v5 contactLabel];
    [v37 setTranslatesAutoresizingMaskIntoConstraints:0];

    v38 = +[UIFont systemFontOfSize:36.0];
    v39 = [(PHHandsetDialerLCDView *)v5 contactLabel];
    [v39 setFont:v38];

    v40 = [(PHHandsetDialerLCDView *)v5 contactLabel];
    [v40 sizeToFit];

    v41 = [(PHHandsetDialerLCDView *)v5 contactLabel];
    [v41 setAlpha:0.0];

    v42 = [(PHHandsetDialerLCDView *)v5 contactLabel];
    [(PHHandsetDialerLCDView *)v5 addSubview:v42];

    v43 = [(PHHandsetDialerLCDView *)v5 featureFlags];
    LODWORD(v39) = [v43 smartDialerEnabled];

    if (v39)
    {
      id v44 = [(PHHandsetDialerLCDView *)v5 newContactResultButton];
      [(PHHandsetDialerLCDView *)v5 setContactResultButton:v44];

      v45 = [(PHHandsetDialerLCDView *)v5 contactResultButton];
      [v45 addTarget:v5 action:"contactResultPressed:" forControlEvents:64];

      v46 = [(PHHandsetDialerLCDView *)v5 contactResultButton];
      [v46 setAlpha:0.0];

      v47 = [(PHHandsetDialerLCDView *)v5 contactResultButton];
      [v47 setShowsLargeContentViewer:1];

      v48 = [(PHHandsetDialerLCDView *)v5 contactResultButton];
      id v49 = objc_alloc_init((Class)UILargeContentViewerInteraction);
      [v48 addInteraction:v49];

      v50 = [(PHHandsetDialerLCDView *)v5 contactResultButton];
      [(PHHandsetDialerLCDView *)v5 addSubview:v50];

      v51 = [[PHDialerContactResultButtonView alloc] initWithType:0];
      [(PHHandsetDialerLCDView *)v5 setContactResultButtonView:v51];

      v52 = [(PHHandsetDialerLCDView *)v5 contactResultButtonView];
      [v52 setUserInteractionEnabled:0];

      v53 = [(PHHandsetDialerLCDView *)v5 contactResultButtonView];
      [v53 sizeToFit];

      v54 = [(PHHandsetDialerLCDView *)v5 contactResultButtonView];
      [v54 setTranslatesAutoresizingMaskIntoConstraints:0];

      v55 = [(PHHandsetDialerLCDView *)v5 contactResultButtonView];
      LODWORD(v56) = 1148846080;
      [v55 setContentHuggingPriority:1 forAxis:v56];

      v57 = [(PHHandsetDialerLCDView *)v5 contactResultButtonView];
      LODWORD(v58) = 1148846080;
      [v57 setContentHuggingPriority:0 forAxis:v58];

      v59 = [(PHHandsetDialerLCDView *)v5 contactResultButton];
      v60 = [(PHHandsetDialerLCDView *)v5 contactResultButtonView];
      [v59 addSubview:v60];

      id v61 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
      [(PHHandsetDialerLCDView *)v5 setSeparator:v61];

      v62 = [(PHHandsetDialerLCDView *)v5 separator];
      [v62 setTranslatesAutoresizingMaskIntoConstraints:0];

      v63 = +[UIColor separatorColor];
      v64 = [(PHHandsetDialerLCDView *)v5 separator];
      [v64 setBackgroundColor:v63];

      v65 = [(PHHandsetDialerLCDView *)v5 separator];
      [v65 setAlpha:0.0];

      v66 = [(PHHandsetDialerLCDView *)v5 separator];
      [(PHHandsetDialerLCDView *)v5 addSubview:v66];

      id v67 = [(PHHandsetDialerLCDView *)v5 newContactResultButton];
      [(PHHandsetDialerLCDView *)v5 setContactCountButton:v67];

      v68 = [(PHHandsetDialerLCDView *)v5 contactCountButton];
      [v68 setAlpha:0.0];

      v69 = [(PHHandsetDialerLCDView *)v5 contactCountButton];
      [v69 setShowsLargeContentViewer:1];

      v70 = [(PHHandsetDialerLCDView *)v5 contactCountButton];
      id v71 = objc_alloc_init((Class)UILargeContentViewerInteraction);
      [v70 addInteraction:v71];

      v72 = [(PHHandsetDialerLCDView *)v5 contactCountButton];
      [(PHHandsetDialerLCDView *)v5 addSubview:v72];

      v73 = [[PHDialerContactResultButtonView alloc] initWithType:1];
      [(PHHandsetDialerLCDView *)v5 setContactCountButtonView:v73];

      v74 = [(PHHandsetDialerLCDView *)v5 contactCountButtonView];
      [v74 setUserInteractionEnabled:0];

      v75 = [(PHHandsetDialerLCDView *)v5 contactCountButtonView];
      [v75 sizeToFit];

      v76 = [(PHHandsetDialerLCDView *)v5 contactCountButtonView];
      [v76 setTranslatesAutoresizingMaskIntoConstraints:0];

      v77 = [(PHHandsetDialerLCDView *)v5 contactCountButtonView];
      LODWORD(v78) = 1148846080;
      [v77 setContentHuggingPriority:1 forAxis:v78];

      v79 = [(PHHandsetDialerLCDView *)v5 contactCountButtonView];
      LODWORD(v80) = 1148846080;
      [v79 setContentHuggingPriority:0 forAxis:v80];

      v81 = [(PHHandsetDialerLCDView *)v5 contactCountButton];
      v82 = [(PHHandsetDialerLCDView *)v5 contactCountButtonView];
      [v81 addSubview:v82];

      v83 = [(PHHandsetDialerLCDView *)v5 featureFlags];
      LODWORD(v82) = [v83 smartDialerExpandedSearchEnabled];

      if (v82)
      {
        id v84 = [(PHHandsetDialerLCDView *)v5 newSearchButton];
        [(PHHandsetDialerLCDView *)v5 setSearchButton:v84];

        v85 = [(PHHandsetDialerLCDView *)v5 searchButton];
        [v85 setAlpha:1.0];

        v86 = [(PHHandsetDialerLCDView *)v5 searchButton];
        [(PHHandsetDialerLCDView *)v5 addSubview:v86];
      }
    }
    id v87 = objc_alloc_init((Class)UILayoutGuide);
    [(PHHandsetDialerLCDView *)v5 setHeaderLayoutGuide:v87];
    v88 = [(PHHandsetDialerLCDView *)v5 headerLayoutGuide];
    [(PHHandsetDialerLCDView *)v5 addLayoutGuide:v88];

    [(PHHandsetDialerLCDView *)v5 applyLayoutConstraints];
  }
  return v5;
}

- (id)menuForPillView:(id)a3
{
  uint64_t v4 = +[SearchMetrics shared];
  [v4 keypadButtonInteractedWithButtonType:4];

  v5 = [(PHHandsetDialerLCDView *)self delegate];
  v6 = [(PHHandsetDialerLCDView *)self selectedSenderIdentity];
  CFStringRef v7 = [v5 senderIdentityMenuForDialerField:self selectedSenderIdentity:v6];

  return v7;
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

- (void)setContactSearchResults:(id)a3 hasCompleteMatch:(BOOL)a4
{
  id v12 = a3;
  id v6 = [(PHHandsetDialerLCDView *)self featureFlags];
  unsigned int v7 = [v6 smartDialerEnabled];

  if (v7)
  {
    if ([v12 count])
    {
      id v8 = [v12 firstObject];
      contactSearchResult = self->_contactSearchResult;
      self->_contactSearchResult = v8;

      BOOL v10 = (char *)[v12 count] - 1;
    }
    else
    {
      v11 = self->_contactSearchResult;
      self->_contactSearchResult = 0;

      BOOL v10 = 0;
    }
    self->_contactResultCount = (unint64_t)v10;
    self->_hasCompleteMatch = a4;
    [(PHHandsetDialerLCDView *)self updateContactResultButton];
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
  int v14 = v13 != 0;
  if (v11)
  {
    id v15 = [(PHHandsetDialerLCDView *)self attributedStringForName:v11 label:v12];
    v16 = [(PHHandsetDialerLCDView *)self contactLabel];
    [v16 setAttributedText:v15];
  }
  id v17 = [(PHHandsetDialerLCDView *)self featureFlags];
  unsigned int v18 = [v17 smartDialerEnabled];

  if (v18)
  {
    id v19 = v12;
    if (v13)
    {
      int v20 = [v11 length] != 0;
      int v21 = !self->_hasCompleteMatch;
    }
    else
    {
      int v20 = 0;
      int v21 = 0;
    }
    int addContactButtonVisible = self->_addContactButtonVisible;
    int deleteButtonVisible = self->_deleteButtonVisible;
    BOOL v44 = deleteButtonVisible != v14;
    int contactLabelButtonVisible = self->_contactLabelButtonVisible;
    v31 = PHDefaultLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v32 = @"NO";
      if (addContactButtonVisible == v21) {
        CFStringRef v33 = @"NO";
      }
      else {
        CFStringRef v33 = @"YES";
      }
      if (deleteButtonVisible == v14) {
        CFStringRef v34 = @"NO";
      }
      else {
        CFStringRef v34 = @"YES";
      }
      *(_DWORD *)buf = 138412802;
      CFStringRef v65 = v33;
      __int16 v66 = 2112;
      CFStringRef v67 = v34;
      if (contactLabelButtonVisible != v20) {
        CFStringRef v32 = @"YES";
      }
      __int16 v68 = 2112;
      CFStringRef v69 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "addContactButtonVisibilityChanged: %@, deleteButtonVisibilityChanged: %@, contactLabelVisibilityChanged: %@", buf, 0x20u);
    }

    BOOL v36 = addContactButtonVisible == v21 && deleteButtonVisible == v14 && contactLabelButtonVisible == v20;
    id v12 = v19;
    if (!v36)
    {
      if ((v20 & 1) != 0 || !self->_contactLabelButtonVisible)
      {
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_111;
        v53[3] = &unk_10027D240;
        BOOL v54 = addContactButtonVisible != v21;
        BOOL v55 = v44;
        BOOL v56 = contactLabelButtonVisible != v20;
        v53[4] = self;
        char v57 = v14;
        v37 = objc_retainBlock(v53);
        +[UIView animateWithDuration:v37 animations:0.150000006];
      }
      else
      {
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke;
        v60[3] = &unk_10027DC38;
        BOOL v61 = addContactButtonVisible != v21;
        BOOL v62 = v44;
        v60[4] = self;
        char v63 = v14;
        v37 = objc_retainBlock(v60);
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_110;
        v58[3] = &unk_10027C838;
        BOOL v59 = contactLabelButtonVisible != v20;
        v58[4] = self;
        v38 = objc_retainBlock(v58);
        +[UIView animateWithDuration:v38 animations:v37 completion:0.150000006];
      }
      self->_int addContactButtonVisible = v21;
      self->_int deleteButtonVisible = v14;
      self->_int contactLabelButtonVisible = v20;
      self->_hasCompleteMatch = 0;
    }
    goto LABEL_45;
  }
  if (self->_addContactButtonVisible && v13 != 0)
  {
    if (v11)
    {
      v23 = [(PHHandsetDialerLCDView *)self addContactButton];
      [v23 alpha];
      double v25 = v24;

      if (v25 >= 0.0)
      {
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_112;
        v52[3] = &unk_10027D268;
        v52[4] = self;
        double v26 = objc_retainBlock(v52);
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_3;
        v51[3] = &unk_10027C670;
        v51[4] = self;
        double v27 = v51;
LABEL_38:
        +[UIView animateWithDuration:v27 animations:v26 completion:0.150000006];
      }
    }
    else
    {
      v39 = [(PHHandsetDialerLCDView *)self contactLabel];
      [v39 alpha];
      double v41 = v40;

      if (v41 >= 0.0)
      {
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_4;
        v50[3] = &unk_10027D268;
        v50[4] = self;
        double v26 = objc_retainBlock(v50);
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_6;
        v49[3] = &unk_10027C670;
        v49[4] = self;
        double v27 = v49;
        goto LABEL_38;
      }
    }
  }
  if (self->_addContactButtonVisible != v14 || self->_deleteButtonVisible != v14)
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_7;
    v45[3] = &unk_10027DC60;
    v45[4] = self;
    char v47 = v14;
    id v46 = v11;
    char v48 = v14;
    v42 = objc_retainBlock(v45);
    v43 = v42;
    if (v7) {
      +[UIView animateWithDuration:v42 animations:0.300000012];
    }
    else {
      ((void (*)(void *))v42[2])(v42);
    }
    self->_int addContactButtonVisible = v14;
    self->_int deleteButtonVisible = v14;
  }
LABEL_45:
}

id __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_2;
  v2[3] = &unk_10027DC10;
  char v3 = *(unsigned char *)(a1 + 40);
  __int16 v4 = *(_WORD *)(a1 + 41);
  v2[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v2 animations:0.150000006];
}

void __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_2(uint64_t a1)
{
  unint64_t v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v3 = @"YES";
    if (*(unsigned char *)(a1 + 40)) {
      CFStringRef v4 = @"YES";
    }
    else {
      CFStringRef v4 = @"NO";
    }
    if (!*(unsigned char *)(a1 + 41)) {
      CFStringRef v3 = @"NO";
    }
    int v10 = 138412546;
    CFStringRef v11 = v4;
    __int16 v12 = 2112;
    CFStringRef v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updating animations for addContactButtonVisibilityChanged: %@, deleteButtonVisibilityChanged: %@", (uint8_t *)&v10, 0x16u);
  }

  id v5 = *(void **)(a1 + 32);
  id v6 = [v5 addContactButton];
  [v5 checkAndUpdateVisibilityForView:v6 shouldInvertVisibility:*(unsigned __int8 *)(a1 + 40)];

  if (*(unsigned char *)(a1 + 41))
  {
    BOOL v7 = [*(id *)(a1 + 32) delegate];
    id v8 = v7;
    double v9 = 1.0;
    if (!*(unsigned char *)(a1 + 42)) {
      double v9 = 0.0;
    }
    [v7 setDeleteButtonAlpha:v9];
  }
}

void __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_110(uint64_t a1)
{
  unint64_t v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 40)) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    int v6 = 138412290;
    CFStringRef v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updating animations for contactLabelVisibilityChanged: %@", (uint8_t *)&v6, 0xCu);
  }

  CFStringRef v4 = *(void **)(a1 + 32);
  id v5 = [v4 contactLabel];
  [v4 checkAndUpdateVisibilityForView:v5 shouldInvertVisibility:*(unsigned __int8 *)(a1 + 40)];
}

void __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_111(uint64_t a1)
{
  unint64_t v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v3 = @"YES";
    if (*(unsigned char *)(a1 + 40)) {
      CFStringRef v4 = @"YES";
    }
    else {
      CFStringRef v4 = @"NO";
    }
    int v5 = *(unsigned __int8 *)(a1 + 42);
    if (*(unsigned char *)(a1 + 41)) {
      CFStringRef v6 = @"YES";
    }
    else {
      CFStringRef v6 = @"NO";
    }
    *(_DWORD *)int v14 = 138412802;
    if (!v5) {
      CFStringRef v3 = @"NO";
    }
    *(void *)&v14[4] = v4;
    __int16 v15 = 2112;
    CFStringRef v16 = v6;
    __int16 v17 = 2112;
    CFStringRef v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updating animations for addContactButtonVisibilityChanged: %@, deleteButtonVisibilityChanged: %@, contactLabelVisibilityChanged: %@", v14, 0x20u);
  }

  CFStringRef v7 = *(void **)(a1 + 32);
  id v8 = [v7 contactLabel];
  [v7 checkAndUpdateVisibilityForView:v8 shouldInvertVisibility:*(unsigned __int8 *)(a1 + 42)];

  double v9 = *(void **)(a1 + 32);
  int v10 = [v9 addContactButton];
  [v9 checkAndUpdateVisibilityForView:v10 shouldInvertVisibility:*(unsigned __int8 *)(a1 + 40)];

  if (*(unsigned char *)(a1 + 41))
  {
    CFStringRef v11 = [*(id *)(a1 + 32) delegate];
    __int16 v12 = v11;
    double v13 = 1.0;
    if (!*(unsigned char *)(a1 + 43)) {
      double v13 = 0.0;
    }
    [v11 setDeleteButtonAlpha:v13, *(void *)v14];
  }
}

id __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_112(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_2_113;
  v2[3] = &unk_10027C670;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v2 animations:0.150000006];
}

void __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_2_113(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contactLabel];
  [v1 setAlpha:1.0];
}

void __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) addContactButton];
  [v1 setAlpha:0.0];
}

id __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_4(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_5;
  v2[3] = &unk_10027C670;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v2 animations:0.150000006];
}

void __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) addContactButton];
  [v1 setAlpha:1.0];
}

void __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_6(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contactLabel];
  [v1 setAlpha:0.0];
}

void __89__PHHandsetDialerLCDView_updateAddAndDeleteButtonForText_name_label_suggestion_animated___block_invoke_7(uint64_t a1)
{
  double v2 = 0.0;
  double v3 = 0.0;
  if (*(unsigned char *)(a1 + 48))
  {
    if (*(void *)(a1 + 40)) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
  }
  CFStringRef v4 = [*(id *)(a1 + 32) contactLabel];
  [v4 setAlpha:v3];

  if (*(unsigned char *)(a1 + 48))
  {
    if (*(void *)(a1 + 40)) {
      double v2 = 0.0;
    }
    else {
      double v2 = 1.0;
    }
  }
  int v5 = [*(id *)(a1 + 32) addContactButton];
  [v5 setAlpha:v2];

  CFStringRef v6 = [*(id *)(a1 + 32) delegate];
  id v8 = v6;
  double v7 = 1.0;
  if (!*(unsigned char *)(a1 + 49)) {
    double v7 = 0.0;
  }
  [v6 setDeleteButtonAlpha:v7];
}

- (void)_makeCalloutVisible:(BOOL)a3
{
  int v3 = a3;
  id v23 = +[UIMenuController sharedMenuController];
  BOOL v5 = [v23 isMenuVisible] == v3;
  CFStringRef v6 = v23;
  if (!v5)
  {
    double v7 = +[NSNotificationCenter defaultCenter];
    if (v3)
    {
      id v8 = [(PHHandsetDialerLCDView *)self featureFlags];
      unsigned int v9 = [v8 smartDialerEnabled];

      double v10 = 25.0;
      if (v9)
      {
        [(PHHandsetDialerLCDView *)self remoteViewControllerLCDOffset];
        double v10 = v11 + 43.0 + 25.0;
      }
      [(PHHandsetDialerLCDView *)self bounds];
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      [(PHHandsetDialerLCDView *)self bounds];
      double v21 = floor(v20 * 0.5);
      if (v10 >= v21) {
        CGFloat v22 = v21;
      }
      else {
        CGFloat v22 = v10;
      }
      v25.origin.x = v13;
      v25.origin.double y = v15;
      v25.size.double width = v17;
      v25.size.double height = v19;
      CGRect v26 = CGRectInset(v25, 0.0, v22);
      [v23 setTargetRect:self inView:v26.origin.x, v26.origin.y, v26.size.width, v26.size.height];
      [v23 setArrowDirection:1];
      [v23 setMenuVisible:1 animated:1];
      [v7 addObserver:self selector:"_menuDidHide:" name:UIMenuControllerDidHideMenuNotification object:0];
    }
    else
    {
      [v23 setMenuVisible:0 animated:1];
      [v7 removeObserver:self name:UIMenuControllerDidHideMenuNotification object:0];
    }

    CFStringRef v6 = v23;
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
        double v7 = objc_claimAutoreleasedReturnValue(),
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
  CFStringRef v4 = [(PHHandsetDialerLCDView *)self text];
  [v5 setString:v4];
}

- (void)paste:(id)a3
{
  CFStringRef v4 = +[UIPasteboard generalPasteboard];
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
  id v8 = [(PHHandsetDialerLCDView *)self featureFlags];
  unsigned int v9 = [v8 smartDialerEnabled];

  if (v9)
  {
    double v10 = +[UIImage tpImageForSymbolType:18 textStyle:UIFontTextStyleTitle2 scale:2 isStaticSize:0];
    [v3 setImage:v10 forState:0];
    [v3 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    [v3 setMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraLarge];
    [v3 setShowsLargeContentViewer:1];
    [v3 setLargeContentImage:v10];
    id v11 = objc_alloc_init((Class)UILargeContentViewerInteraction);
    [v3 addInteraction:v11];
  }
  else
  {
    id v12 = objc_alloc((Class)NSAttributedString);
    CGFloat v13 = +[NSBundle mainBundle];
    double v14 = [v13 localizedStringForKey:@"ADD_NUMBER" value:&stru_100285990 table:@"Dialer"];
    id v15 = [v12 initWithString:v14];
    [v3 setAttributedTitle:v15 forState:0];

    [(PHHandsetDialerLCDView *)self addNumberFontSize];
    double v10 = +[UIFont systemFontOfSize:v16];
    id v11 = [v3 titleLabel];
    [v11 setFont:v10];
  }

  return v3;
}

- (TPPillView)pillView
{
  pillView = self->_pillView;
  if (!pillView)
  {
    id v4 = [objc_alloc((Class)TPPillView) initWithTitle:&stru_100285990 frame:3 CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
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

- (id)newContactResultButton
{
  BOOL v3 = [(PHHandsetDialerLCDView *)self featureFlags];
  unsigned int v4 = [v3 smartDialerEnabled];

  if (!v4) {
    return 0;
  }
  double v5 = +[UIButton buttonWithType:1];
  double v6 = +[UIColor clearColor];
  [v5 setBackgroundColor:v6];

  [v5 setContentEdgeInsets:10.0, 10.0, 10.0, 10.0];
  [v5 setOpaque:0];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v7) = 1144750080;
  [v5 setContentCompressionResistancePriority:0 forAxis:v7];
  [v5 setTitle:&stru_100285990 forState:0];
  [(PHHandsetDialerLCDView *)self addNumberFontSize];
  unsigned int v9 = +[UIFont systemFontOfSize:v8];
  double v10 = [v5 titleLabel];
  [v10 setFont:v9];

  [v5 sizeToFit];
  return v5;
}

- (id)newSearchButton
{
  BOOL v3 = +[UIButton buttonWithType:1];
  unsigned int v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setContentEdgeInsets:10.0, 10.0, 10.0, 10.0];
  [v3 setOpaque:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v5) = 1144750080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v5];
  double v6 = [(PHHandsetDialerLCDView *)self featureFlags];
  LODWORD(v4) = [v6 smartDialerExpandedSearchEnabled];

  if (v4)
  {
    double v7 = +[UIImage systemImageNamed:@"magnifyingglass"];
    [v3 setImage:v7 forState:0];
  }
  float v8 = +[UIColor systemBlueColor];
  [v3 setTintColor:v8];

  [v3 sizeToFit];
  return v3;
}

- (void)applyLayoutConstraints
{
  BOOL v3 = [(PHHandsetDialerLCDView *)self featureFlags];
  unsigned int v4 = [v3 smartDialerEnabled];

  if (v4)
  {
    [(PHHandsetDialerLCDView *)self applyLayoutConstraintsForSmartDialer];
  }
  else
  {
    double v5 = [(PHHandsetDialerLCDView *)self addContactButton];
    [(PHHandsetDialerLCDView *)self addContactButtonTopConstraintConstant];
    double v7 = +[NSLayoutConstraint constraintWithItem:v5 attribute:11 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v6];
    [(PHHandsetDialerLCDView *)self setAddContactButtonTopConstraint:v7];

    float v8 = [(PHHandsetDialerLCDView *)self addContactButtonTopConstraint];
    [(PHHandsetDialerLCDView *)self addConstraint:v8];

    unsigned int v9 = [(PHHandsetDialerLCDView *)self addContactButton];
    double v10 = +[NSLayoutConstraint constraintWithItem:self attribute:4 relatedBy:0 toItem:v9 attribute:11 multiplier:1.0 constant:0.0];
    [(PHHandsetDialerLCDView *)self addConstraint:v10];

    id v11 = [(PHHandsetDialerLCDView *)self addContactButton];
    id v12 = +[NSLayoutConstraint constraintWithItem:v11 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
    [(PHHandsetDialerLCDView *)self addConstraint:v12];

    CGFloat v13 = [(PHHandsetDialerLCDView *)self addContactButton];
    double v14 = [(PHHandsetDialerLCDView *)self layoutTextField];
    [(PHHandsetDialerLCDView *)self spacingBetweenNumberBaselineAndNameBaseline];
    float v16 = +[NSLayoutConstraint constraintWithItem:v13 attribute:11 relatedBy:0 toItem:v14 attribute:11 multiplier:1.0 constant:v15];
    [(PHHandsetDialerLCDView *)self addConstraint:v16];

    CGFloat v17 = [(PHHandsetDialerLCDView *)self addContactButton];
    double v18 = [(PHHandsetDialerLCDView *)self layoutTextField];
    CGFloat v19 = +[NSLayoutConstraint constraintWithItem:v17 attribute:9 relatedBy:0 toItem:v18 attribute:9 multiplier:1.0 constant:0.0];
    [(PHHandsetDialerLCDView *)self addConstraint:v19];

    double v20 = [(PHHandsetDialerLCDView *)self numberTextField];
    double v21 = [(PHHandsetDialerLCDView *)self layoutTextField];
    CGFloat v22 = +[NSLayoutConstraint constraintWithItem:v20 attribute:10 relatedBy:0 toItem:v21 attribute:10 multiplier:1.0 constant:0.0];
    [(PHHandsetDialerLCDView *)self addConstraint:v22];

    id v23 = [(PHHandsetDialerLCDView *)self numberTextField];
    double v24 = [(PHHandsetDialerLCDView *)self layoutTextField];
    CGRect v25 = +[NSLayoutConstraint constraintWithItem:v23 attribute:9 relatedBy:0 toItem:v24 attribute:9 multiplier:1.0 constant:0.0];
    [(PHHandsetDialerLCDView *)self addConstraint:v25];

    CGRect v26 = [(PHHandsetDialerLCDView *)self contactLabel];
    double v27 = [(PHHandsetDialerLCDView *)self addContactButton];
    id v28 = +[NSLayoutConstraint constraintWithItem:v26 attribute:9 relatedBy:0 toItem:v27 attribute:9 multiplier:1.0 constant:0.0];
    [(PHHandsetDialerLCDView *)self addConstraint:v28];

    v29 = [(PHHandsetDialerLCDView *)self contactLabel];
    v30 = [(PHHandsetDialerLCDView *)self addContactButton];
    v31 = +[NSLayoutConstraint constraintWithItem:v29 attribute:12 relatedBy:0 toItem:v30 attribute:12 multiplier:1.0 constant:0.0];
    [(PHHandsetDialerLCDView *)self addConstraint:v31];

    CFStringRef v32 = [(PHHandsetDialerLCDView *)self contactLabel];
    CFStringRef v33 = +[NSLayoutConstraint constraintWithItem:v32 attribute:5 relatedBy:1 toItem:self attribute:5 multiplier:1.0 constant:0.0];
    [(PHHandsetDialerLCDView *)self addConstraint:v33];

    CFStringRef v34 = [(PHHandsetDialerLCDView *)self contactLabel];
    v35 = +[NSLayoutConstraint constraintWithItem:v34 attribute:6 relatedBy:-1 toItem:self attribute:6 multiplier:1.0 constant:0.0];
    [(PHHandsetDialerLCDView *)self addConstraint:v35];

    [(PHHandsetDialerLCDView *)self updateNumberLabelHorizontalConstraints];
  }
}

- (void)applyLayoutConstraintsForSmartDialer
{
  v94 = [(PHHandsetDialerLCDView *)self headerLayoutGuide];
  v92 = [v94 topAnchor];
  v93 = [(PHHandsetDialerLCDView *)self safeAreaLayoutGuide];
  v91 = [v93 topAnchor];
  objc_super v90 = [v92 constraintEqualToAnchor:v91];
  v95[0] = v90;
  v89 = [(PHHandsetDialerLCDView *)self headerLayoutGuide];
  id v87 = [v89 bottomAnchor];
  v88 = [(PHHandsetDialerLCDView *)self numberTextField];
  v86 = [v88 topAnchor];
  [(PHHandsetDialerLCDView *)self addContactButtonContentInsetConstant];
  v85 = [v87 constraintEqualToAnchor:v86 constant:v3 + 5.0];
  v95[1] = v85;
  id v84 = [(PHHandsetDialerLCDView *)self headerLayoutGuide];
  v83 = [v84 leadingAnchor];
  unsigned int v4 = [(PHHandsetDialerLCDView *)self safeAreaLayoutGuide];
  double v5 = [v4 leadingAnchor];
  double v6 = [v83 constraintEqualToAnchor:v5];
  v95[2] = v6;
  double v7 = [(PHHandsetDialerLCDView *)self headerLayoutGuide];
  float v8 = [v7 trailingAnchor];
  unsigned int v9 = [(PHHandsetDialerLCDView *)self safeAreaLayoutGuide];
  double v10 = [v9 trailingAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];
  v95[3] = v11;
  id v12 = +[NSArray arrayWithObjects:v95 count:4];
  +[NSLayoutConstraint activateConstraints:v12];

  CGFloat v13 = [(PHHandsetDialerLCDView *)self layoutTextField];
  double v14 = +[NSLayoutConstraint constraintWithItem:v13 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v14];

  float v15 = [(PHHandsetDialerLCDView *)self numberTextField];
  float v16 = [(PHHandsetDialerLCDView *)self layoutTextField];
  CGFloat v17 = +[NSLayoutConstraint constraintWithItem:v15 attribute:10 relatedBy:0 toItem:v16 attribute:10 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v17];

  double v18 = [(PHHandsetDialerLCDView *)self numberTextField];
  CGFloat v19 = [(PHHandsetDialerLCDView *)self layoutTextField];
  double v20 = +[NSLayoutConstraint constraintWithItem:v18 attribute:9 relatedBy:0 toItem:v19 attribute:9 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v20];

  double v21 = [(PHHandsetDialerLCDView *)self contactResultButton];
  CGFloat v22 = [(PHHandsetDialerLCDView *)self layoutTextField];
  [(PHHandsetDialerLCDView *)self spacingBetweenNumberAndContactResult];
  double v24 = +[NSLayoutConstraint constraintWithItem:v21 attribute:3 relatedBy:0 toItem:v22 attribute:4 multiplier:1.0 constant:v23];
  [(PHHandsetDialerLCDView *)self addConstraint:v24];

  CGRect v25 = [(PHHandsetDialerLCDView *)self contactResultButton];
  CGRect v26 = +[NSLayoutConstraint constraintWithItem:v25 attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v26];

  double v27 = [(PHHandsetDialerLCDView *)self contactResultButton];
  id v28 = +[NSLayoutConstraint constraintWithItem:v27 attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v28];

  v29 = [(PHHandsetDialerLCDView *)self contactResultButtonView];
  v30 = [(PHHandsetDialerLCDView *)self contactResultButton];
  v31 = +[NSLayoutConstraint constraintWithItem:v29 attribute:5 relatedBy:0 toItem:v30 attribute:5 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v31];

  CFStringRef v32 = [(PHHandsetDialerLCDView *)self contactResultButtonView];
  CFStringRef v33 = [(PHHandsetDialerLCDView *)self contactResultButton];
  CFStringRef v34 = +[NSLayoutConstraint constraintWithItem:v32 attribute:6 relatedBy:0 toItem:v33 attribute:6 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v34];

  v35 = [(PHHandsetDialerLCDView *)self contactResultButtonView];
  BOOL v36 = [(PHHandsetDialerLCDView *)self contactResultButton];
  v37 = +[NSLayoutConstraint constraintWithItem:v35 attribute:3 relatedBy:0 toItem:v36 attribute:3 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v37];

  v38 = [(PHHandsetDialerLCDView *)self contactResultButtonView];
  v39 = [(PHHandsetDialerLCDView *)self contactResultButton];
  double v40 = +[NSLayoutConstraint constraintWithItem:v38 attribute:4 relatedBy:0 toItem:v39 attribute:4 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v40];

  double v41 = [(PHHandsetDialerLCDView *)self separator];
  v42 = [(PHHandsetDialerLCDView *)self contactResultButton];
  [(PHHandsetDialerLCDView *)self spacingBetweenContactResultButtons];
  BOOL v44 = +[NSLayoutConstraint constraintWithItem:v41 attribute:3 relatedBy:0 toItem:v42 attribute:4 multiplier:1.0 constant:v43];
  [(PHHandsetDialerLCDView *)self addConstraint:v44];

  v45 = [(PHHandsetDialerLCDView *)self separator];
  id v46 = +[NSLayoutConstraint constraintWithItem:v45 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:1.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v46];

  char v47 = [(PHHandsetDialerLCDView *)self separator];
  char v48 = +[NSLayoutConstraint constraintWithItem:v47 attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:15.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v48];

  id v49 = [(PHHandsetDialerLCDView *)self separator];
  v50 = +[NSLayoutConstraint constraintWithItem:v49 attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:-15.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v50];

  v51 = [(PHHandsetDialerLCDView *)self contactCountButton];
  v52 = [(PHHandsetDialerLCDView *)self separator];
  [(PHHandsetDialerLCDView *)self spacingBetweenContactResultButtons];
  BOOL v54 = +[NSLayoutConstraint constraintWithItem:v51 attribute:3 relatedBy:0 toItem:v52 attribute:4 multiplier:1.0 constant:v53];
  [(PHHandsetDialerLCDView *)self addConstraint:v54];

  BOOL v55 = [(PHHandsetDialerLCDView *)self contactCountButton];
  BOOL v56 = +[NSLayoutConstraint constraintWithItem:self attribute:4 relatedBy:0 toItem:v55 attribute:11 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v56];

  char v57 = [(PHHandsetDialerLCDView *)self contactCountButton];
  double v58 = +[NSLayoutConstraint constraintWithItem:v57 attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v58];

  BOOL v59 = [(PHHandsetDialerLCDView *)self contactCountButton];
  v60 = +[NSLayoutConstraint constraintWithItem:v59 attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v60];

  BOOL v61 = [(PHHandsetDialerLCDView *)self contactCountButtonView];
  BOOL v62 = [(PHHandsetDialerLCDView *)self contactCountButton];
  char v63 = +[NSLayoutConstraint constraintWithItem:v61 attribute:5 relatedBy:0 toItem:v62 attribute:5 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v63];

  v64 = [(PHHandsetDialerLCDView *)self contactCountButtonView];
  CFStringRef v65 = [(PHHandsetDialerLCDView *)self contactCountButton];
  __int16 v66 = +[NSLayoutConstraint constraintWithItem:v64 attribute:6 relatedBy:0 toItem:v65 attribute:6 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v66];

  CFStringRef v67 = [(PHHandsetDialerLCDView *)self contactCountButtonView];
  __int16 v68 = [(PHHandsetDialerLCDView *)self contactCountButton];
  CFStringRef v69 = +[NSLayoutConstraint constraintWithItem:v67 attribute:3 relatedBy:0 toItem:v68 attribute:3 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v69];

  v70 = [(PHHandsetDialerLCDView *)self contactCountButtonView];
  id v71 = [(PHHandsetDialerLCDView *)self contactCountButton];
  v72 = +[NSLayoutConstraint constraintWithItem:v70 attribute:4 relatedBy:0 toItem:v71 attribute:4 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v72];

  v73 = [(PHHandsetDialerLCDView *)self contactLabel];
  v74 = [(PHHandsetDialerLCDView *)self layoutTextField];
  v75 = +[NSLayoutConstraint constraintWithItem:v73 attribute:9 relatedBy:0 toItem:v74 attribute:9 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v75];

  v76 = [(PHHandsetDialerLCDView *)self contactLabel];
  v77 = [(PHHandsetDialerLCDView *)self contactResultButton];
  double v78 = +[NSLayoutConstraint constraintWithItem:v76 attribute:12 relatedBy:0 toItem:v77 attribute:12 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v78];

  v79 = [(PHHandsetDialerLCDView *)self contactLabel];
  double v80 = +[NSLayoutConstraint constraintWithItem:v79 attribute:5 relatedBy:1 toItem:self attribute:5 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v80];

  v81 = [(PHHandsetDialerLCDView *)self contactLabel];
  v82 = +[NSLayoutConstraint constraintWithItem:v81 attribute:6 relatedBy:-1 toItem:self attribute:6 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerLCDView *)self addConstraint:v82];

  [(PHHandsetDialerLCDView *)self updateNumberLabelHorizontalConstraints];
}

- (void)updateNumberLabelHorizontalConstraints
{
  double v3 = [(PHHandsetDialerLCDView *)self numberLabelHorizontalConstraints];

  if (v3)
  {
    unsigned int v4 = [(PHHandsetDialerLCDView *)self numberLabelHorizontalConstraints];
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
      return dbl_100204288[v3];
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

- (void)contactResultPressed:(id)a3
{
  double v4 = [(PHHandsetDialerLCDView *)self featureFlags];
  unsigned int v5 = [v4 smartDialerEnabled];

  if (v5)
  {
    if (self->_contactSearchResult)
    {
      id v6 = [(PHHandsetDialerLCDView *)self resultContact];
      id v20 = +[CNContactFormatter stringFromContact:v6 style:0];

      id v7 = [(PHHandsetDialerLCDView *)self resultContactPhoneNumber];
      char v8 = [v7 value];
      id v9 = [v8 formattedStringValue];
      id v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        CGFloat v13 = [v7 value];
        id v11 = [v13 stringValue];
      }
      double v14 = [v7 label];
      id v12 = +[CNLabeledValue localizedStringForLabel:v14];

      self->_hasCompleteMatch = 1;
    }
    else
    {
      id v20 = 0;
      id v11 = 0;
      id v12 = 0;
    }
    [(PHHandsetDialerLCDView *)self hideContactResultsButtons];
    float v15 = +[SearchMetrics shared];
    uint64_t v16 = [(PHHandsetDialerLCDView *)self unformattedText];
    [v15 logSearchResultInteraction:1 cellType:7 searchLength:[v16 length]];

    [(PHLCDViewTextField *)self->_numberTextField setText:v11];
    [(PHHandsetDialerLCDView *)self setName:v20 numberLabel:v12];
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if (v16)
    {
      id v19 = objc_loadWeakRetained((id *)p_delegate);
      [v19 updateIDSStatus];
    }
  }
}

- (void)contactCountButtonPressed:(id)a3
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

- (id)resultContact
{
  return [(MPContactSearchResult *)self->_contactSearchResult contact];
}

- (id)resultContactPhoneNumber
{
  unint64_t v3 = [(MPContactSearchResult *)self->_contactSearchResult preferredPhoneNumber];
  if (!v3)
  {
    unint64_t v3 = [(MPContactSearchResult *)self->_contactSearchResult preferredPhoneNumber];
    if (!v3)
    {
      id v4 = [(PHHandsetDialerLCDView *)self resultContact];
      unsigned int v5 = [v4 phoneNumbers];
      unint64_t v3 = [v5 firstObject];
    }
  }

  return v3;
}

- (void)hideContactResultsButtons
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __51__PHHandsetDialerLCDView_hideContactResultsButtons__block_invoke;
  v4[3] = &unk_10027C670;
  v4[4] = self;
  unint64_t v3 = objc_retainBlock(v4);
  +[UIView animateWithDuration:v3 animations:0.300000012];
  self->_contactResultButtonVisible = 0;
  self->_contactCountButtonVisible = 0;
}

void __51__PHHandsetDialerLCDView_hideContactResultsButtons__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) contactResultButton];
  [v2 setAlpha:0.0];

  unint64_t v3 = [*(id *)(a1 + 32) contactCountButton];
  [v3 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) separator];
  [v4 setAlpha:0.0];
}

- (void)updateContactResultButton
{
  unint64_t v3 = [(PHHandsetDialerLCDView *)self featureFlags];
  unsigned int v4 = [v3 smartDialerEnabled];

  if (v4)
  {
    [(PHHandsetDialerLCDView *)self setName:0 numberLabel:0];
    if (self->_contactSearchResult)
    {
      unsigned int v5 = [(PHHandsetDialerLCDView *)self resultContact];
      id v6 = +[CNContactFormatter stringFromContact:v5 style:0];

      id v7 = [(PHHandsetDialerLCDView *)self resultContactPhoneNumber];
      char v8 = v7;
      BOOL v9 = v7 != 0;
      if (v7)
      {
        id v10 = [v7 value];
        id v11 = [v10 formattedStringValue];
        id v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          float v15 = [v8 value];
          id v13 = [v15 stringValue];
        }
        uint64_t v16 = [(PHHandsetDialerLCDView *)self text];
        BOOL v36 = [v6 attributedStringToHighlightText:v16 style:1];

        id v17 = v13;
        double v18 = v17;
        if ([v6 length])
        {
          id v19 = TelephonyUIBundle();
          id v20 = [v19 localizedStringForKey:@"COMMA" value:&stru_100285990 table:@"General"];

          if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [(PHDialerContactResultButtonView *)self->_contactResultButtonView semanticContentAttribute]) == (id)1)+[NSString localizedStringWithFormat:@"%@%@", v17, v20]; {
          else
          }
          double v18 = +[NSString localizedStringWithFormat:@"%@%@", v20, v17];
        }
        double v21 = [(PHHandsetDialerLCDView *)self text];
        double v14 = [v18 attributedStringToHighlightText:v21 style:2];
      }
      else
      {
        double v14 = 0;
        BOOL v36 = 0;
      }
    }
    else
    {
      double v14 = 0;
      BOOL v36 = 0;
      BOOL v9 = 0;
    }
    unint64_t contactResultCount = self->_contactResultCount;
    if (contactResultCount)
    {
      float v23 = +[NSBundle mainBundle];
      double v24 = [v23 localizedStringForKey:@"%lu_MORE_CONTACTS" value:&stru_100285990 table:@"Dialer"];
      CGRect v25 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v24, self->_contactResultCount);

      id v26 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v25];
      double v27 = +[UIColor secondaryLabelColor];
      [v26 addAttribute:NSForegroundColorAttributeName value:v27 range:0, [v26 length]];

      if (!v9) {
        goto LABEL_24;
      }
    }
    else
    {
      id v26 = 0;
      if (!v9) {
        goto LABEL_24;
      }
    }
    id v28 = [(MPContactSearchResult *)self->_contactSearchResult matchInfo];
    v29 = [v28 matchedProperties];

    if (v29)
    {
      v30 = [v28 matchedProperties];
      BOOL v31 = +[PHSearchUtilities matchedProperties:v30 contains:CNContactPhoneNumbersKey];
    }
    else
    {
      BOOL v31 = 1;
    }
    contactResultButtonView = self->_contactResultButtonView;
    CFStringRef v33 = [(PHHandsetDialerLCDView *)self text];
    [(PHDialerContactResultButtonView *)contactResultButtonView configureWithPrimaryTitle:v36 secondaryTitle:v14 searchString:v33 isNumberPriority:v31];

LABEL_24:
    if (contactResultCount) {
      [(PHDialerContactResultButtonView *)self->_contactCountButtonView configureWithPrimaryTitle:v26 secondaryTitle:0];
    }
    if (self->_contactResultButtonVisible == v9)
    {
      LODWORD(contactResultCount) = contactResultCount != 0;
      if (self->_contactCountButtonVisible == contactResultCount)
      {
LABEL_33:
        self->_contactResultButtonVisible = v9;
        self->_contactCountButtonVisible = contactResultCount;

        return;
      }
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = __51__PHHandsetDialerLCDView_updateContactResultButton__block_invoke_2;
      v37[3] = &unk_10027C838;
      v37[4] = self;
      char v38 = contactResultCount;
      CFStringRef v34 = v37;
    }
    else
    {
      if (!v9)
      {
        LOBYTE(contactResultCount) = contactResultCount != 0;
        [(PHHandsetDialerLCDView *)self hideContactResultsButtons];
        goto LABEL_33;
      }
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = __51__PHHandsetDialerLCDView_updateContactResultButton__block_invoke;
      v39[3] = &unk_10027C838;
      LOBYTE(contactResultCount) = contactResultCount != 0;
      v39[4] = self;
      char v40 = contactResultCount;
      CFStringRef v34 = v39;
    }
    v35 = objc_retainBlock(v34);
    +[UIView animateWithDuration:v35 animations:0.300000012];

    goto LABEL_33;
  }
}

void __51__PHHandsetDialerLCDView_updateContactResultButton__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) contactResultButton];
  [v2 setAlpha:1.0];

  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  unsigned int v4 = [*(id *)(a1 + 32) contactCountButton];
  [v4 setAlpha:v3];

  if (*(unsigned char *)(a1 + 40)) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  id v6 = [*(id *)(a1 + 32) separator];
  [v6 setAlpha:v5];
}

void __51__PHHandsetDialerLCDView_updateContactResultButton__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  double v3 = [*(id *)(a1 + 32) contactCountButton];
  [v3 setAlpha:v2];

  if (*(unsigned char *)(a1 + 40)) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  id v5 = [*(id *)(a1 + 32) separator];
  [v5 setAlpha:v4];
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
  return (UIButton *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAddContactButton:(id)a3
{
}

- (void)setPillView:(id)a3
{
}

- (UIButton)searchButton
{
  return (UIButton *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSearchButton:(id)a3
{
}

- (UIButton)contactCountButton
{
  return (UIButton *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContactCountButton:(id)a3
{
}

- (UILabel)contactLabel
{
  return (UILabel *)objc_getProperty(self, a2, 56, 1);
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
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
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

- (UIButton)contactResultButton
{
  return (UIButton *)objc_getProperty(self, a2, 128, 1);
}

- (void)setContactResultButton:(id)a3
{
}

- (PHDialerContactResultButtonView)contactResultButtonView
{
  return (PHDialerContactResultButtonView *)objc_getProperty(self, a2, 136, 1);
}

- (void)setContactResultButtonView:(id)a3
{
}

- (PHDialerContactResultButtonView)contactCountButtonView
{
  return (PHDialerContactResultButtonView *)objc_getProperty(self, a2, 144, 1);
}

- (void)setContactCountButtonView:(id)a3
{
}

- (UIView)separator
{
  return (UIView *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSeparator:(id)a3
{
}

- (MPContactSearchResult)contactSearchResult
{
  return self->_contactSearchResult;
}

- (void)setContactSearchResult:(id)a3
{
}

- (unint64_t)contactResultCount
{
  return self->_contactResultCount;
}

- (void)setContactResultCount:(unint64_t)a3
{
  self->_unint64_t contactResultCount = a3;
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
  objc_storeStrong((id *)&self->_contactSearchResult, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_contactCountButtonView, 0);
  objc_storeStrong((id *)&self->_contactResultButtonView, 0);
  objc_storeStrong((id *)&self->_contactResultButton, 0);
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