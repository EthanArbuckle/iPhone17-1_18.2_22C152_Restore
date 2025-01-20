@interface PHHandsetDialerView
- (BOOL)dialerIsNumericOnly;
- (BOOL)phonePadViewTopShouldConstrainToLCDView;
- (NSLayoutConstraint)addContactButtonTopConstraint;
- (NSLayoutConstraint)callButtonKeypadOffsetConstraint;
- (NSLayoutConstraint)phonePadViewTopConstraint;
- (PHHandsetDialerView)initWithFrame:(CGRect)a3;
- (TPPillView)pillView;
- (TUFeatureFlags)featureFlags;
- (UILayoutGuide)headerLayoutGuide;
- (UIView)deleteButtonXView;
- (double)_keypadToCallButtonYSpacing;
- (double)_remoteViewControllerDialerOffset;
- (double)_yOffsetForAddContactButton;
- (double)_yOffsetForKeypadView;
- (double)callButtonDiameter;
- (double)yOffsetFromKeypadToDialerButtonForExplictLayoutDevices;
- (double)yOffsetFromKeypadToLCDViewForExplicitLayoutDevices;
- (id)deleteButtonImageName;
- (id)deleteButtonXImageView;
- (id)newCallButton;
- (id)newDeleteButton;
- (id)newLCDView;
- (id)newNumberPadView;
- (id)numberPadButtonsForCharacters:(id)a3;
- (void)createConstraints;
- (void)createDeleteButtonX;
- (void)dealloc;
- (void)setAddContactButtonTopConstraint:(id)a3;
- (void)setCallButtonKeypadOffsetConstraint:(id)a3;
- (void)setDeleteButtonAlpha:(double)a3;
- (void)setDeleteButtonXView:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setHeaderLayoutGuide:(id)a3;
- (void)setIsHostedInRemoteViewController:(BOOL)a3;
- (void)setPhonePadViewTopConstraint:(id)a3;
- (void)setPillView:(id)a3;
- (void)updateContraintsForStatusBar;
@end

@implementation PHHandsetDialerView

- (PHHandsetDialerView)initWithFrame:(CGRect)a3
{
  v4 = +[UIScreen mainScreen];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v43.receiver = self;
  v43.super_class = (Class)PHHandsetDialerView;
  v13 = -[PHHandsetDialerView initWithFrame:](&v43, "initWithFrame:", v6, v8, v10, v12);
  if (v13)
  {
    id v14 = objc_alloc_init((Class)TUFeatureFlags);
    [(PHHandsetDialerView *)v13 setFeatureFlags:v14];

    v15 = +[UIColor dynamicBackgroundColor];
    [(PHHandsetDialerView *)v13 setBackgroundColor:v15];

    [(PHHandsetDialerView *)v13 setOpaque:0];
    id v16 = [(PHHandsetDialerView *)v13 newLCDView];
    [(PHAbstractDialerView *)v13 setLcdView:v16];

    v17 = [(PHAbstractDialerView *)v13 lcdView];
    [v17 setDelegate:v13];

    id v18 = [(PHHandsetDialerView *)v13 newNumberPadView];
    [(PHAbstractDialerView *)v13 setPhonePadView:v18];

    id v19 = [(PHHandsetDialerView *)v13 newCallButton];
    [(PHAbstractDialerView *)v13 setCallButton:v19];

    id v20 = [(PHHandsetDialerView *)v13 newDeleteButton];
    [(PHAbstractDialerView *)v13 setDeleteButton:v20];

    v21 = [(PHAbstractDialerView *)v13 deleteButton];
    [v21 setAlpha:0.0];

    v22 = [(PHAbstractDialerView *)v13 phonePadView];
    [(PHHandsetDialerView *)v13 addSubview:v22];

    v23 = [(PHAbstractDialerView *)v13 lcdView];
    [(PHHandsetDialerView *)v13 addSubview:v23];

    v24 = [(PHAbstractDialerView *)v13 callButton];
    [(PHHandsetDialerView *)v13 addSubview:v24];

    v25 = [(PHAbstractDialerView *)v13 deleteButton];
    [(PHHandsetDialerView *)v13 addSubview:v25];

    v26 = [(PHHandsetDialerView *)v13 featureFlags];
    unsigned int v27 = [v26 smartDialerEnabled];

    if (v27)
    {
      v28 = [(PHAbstractDialerView *)v13 addContactButton];
      [(PHHandsetDialerView *)v13 addSubview:v28];

      v29 = [(PHHandsetDialerView *)v13 pillView];
      [(PHHandsetDialerView *)v13 addSubview:v29];
    }
    [(PHHandsetDialerView *)v13 createDeleteButtonX];
    unsigned int v30 = [(PHHandsetDialerView *)v13 phonePadViewTopShouldConstrainToLCDView];
    v31 = [(PHAbstractDialerView *)v13 phonePadView];
    if (v30)
    {
      v32 = [(PHAbstractDialerView *)v13 lcdView];
      [(PHHandsetDialerView *)v13 _yOffsetForKeypadView];
      v34 = +[NSLayoutConstraint constraintWithItem:v31 attribute:3 relatedBy:0 toItem:v32 attribute:4 multiplier:1.0 constant:v33];
      [(PHHandsetDialerView *)v13 setPhonePadViewTopConstraint:v34];
    }
    else
    {
      [(PHHandsetDialerView *)v13 _yOffsetForKeypadView];
      v32 = +[NSLayoutConstraint constraintWithItem:v31 attribute:3 relatedBy:0 toItem:v13 attribute:3 multiplier:1.0 constant:v35];
      [(PHHandsetDialerView *)v13 setPhonePadViewTopConstraint:v32];
    }

    v36 = [(PHHandsetDialerView *)v13 phonePadViewTopConstraint];
    [(PHHandsetDialerView *)v13 addConstraint:v36];

    v37 = [(PHAbstractDialerView *)v13 callButton];
    v38 = [(PHAbstractDialerView *)v13 phonePadView];
    [(PHHandsetDialerView *)v13 _keypadToCallButtonYSpacing];
    v40 = +[NSLayoutConstraint constraintWithItem:v37 attribute:3 relatedBy:0 toItem:v38 attribute:4 multiplier:1.0 constant:v39];
    [(PHHandsetDialerView *)v13 setCallButtonKeypadOffsetConstraint:v40];

    v41 = [(PHHandsetDialerView *)v13 callButtonKeypadOffsetConstraint];
    [(PHHandsetDialerView *)v13 addConstraint:v41];

    [(PHHandsetDialerView *)v13 updateContraintsForStatusBar];
    [(PHHandsetDialerView *)v13 createConstraints];
  }
  return v13;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHHandsetDialerView;
  [(PHAbstractDialerView *)&v4 dealloc];
}

- (void)createConstraints
{
  v3 = [(PHAbstractDialerView *)self lcdView];
  objc_super v4 = +[NSLayoutConstraint constraintWithItem:v3 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerView *)self addConstraint:v4];

  double v5 = [(PHAbstractDialerView *)self callButton];
  double v6 = [(PHAbstractDialerView *)self phonePadView];
  double v7 = +[NSLayoutConstraint constraintWithItem:v5 attribute:9 relatedBy:0 toItem:v6 attribute:9 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerView *)self addConstraint:v7];

  double v8 = [(PHAbstractDialerView *)self phonePadView];
  double v9 = +[NSLayoutConstraint constraintWithItem:v8 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerView *)self addConstraint:v9];

  double v10 = [(PHAbstractDialerView *)self deleteButton];
  double v11 = [(PHAbstractDialerView *)self phonePadView];
  double v12 = [(PHAbstractDialerView *)self phonePadView];
  [v12 bounds];
  id v14 = +[NSLayoutConstraint constraintWithItem:v10 attribute:9 relatedBy:0 toItem:v11 attribute:2 multiplier:1.0 constant:v13 / -6.0 + -2.0];
  [(PHHandsetDialerView *)self addConstraint:v14];

  v15 = [(PHAbstractDialerView *)self deleteButton];
  id v16 = [(PHAbstractDialerView *)self callButton];
  v17 = +[NSLayoutConstraint constraintWithItem:v15 attribute:10 relatedBy:0 toItem:v16 attribute:10 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerView *)self addConstraint:v17];

  id v18 = [(PHAbstractDialerView *)self lcdView];
  id v19 = +[NSLayoutConstraint constraintWithItem:v18 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [(PHHandsetDialerView *)self addConstraint:v19];

  id v20 = [(PHAbstractDialerView *)self lcdView];
  v21 = [v20 widthAnchor];
  v22 = [(PHAbstractDialerView *)self phonePadView];
  [v22 bounds];
  v24 = [v21 constraintEqualToConstant:v23];
  [v24 setActive:1];

  v25 = [(PHHandsetDialerView *)self featureFlags];
  LODWORD(v21) = [v25 smartDialerEnabled];

  if (v21)
  {
    v51 = [(PHAbstractDialerView *)self addContactButton];
    v49 = [v51 topAnchor];
    v50 = [(PHHandsetDialerView *)self headerLayoutGuide];
    v48 = [v50 topAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v52[0] = v47;
    v46 = [(PHAbstractDialerView *)self addContactButton];
    v44 = [v46 bottomAnchor];
    v45 = [(PHHandsetDialerView *)self headerLayoutGuide];
    objc_super v43 = [v45 bottomAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v52[1] = v42;
    v41 = [(PHAbstractDialerView *)self addContactButton];
    double v39 = [v41 trailingAnchor];
    v40 = [(PHHandsetDialerView *)self layoutMarginsGuide];
    v38 = [v40 trailingAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v52[2] = v37;
    v36 = [(PHHandsetDialerView *)self pillView];
    v26 = [v36 leadingAnchor];
    unsigned int v27 = [(PHHandsetDialerView *)self layoutMarginsGuide];
    v28 = [v27 leadingAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    v52[3] = v29;
    unsigned int v30 = [(PHHandsetDialerView *)self pillView];
    v31 = [v30 centerYAnchor];
    v32 = [(PHAbstractDialerView *)self addContactButton];
    double v33 = [v32 centerYAnchor];
    v34 = [v31 constraintEqualToAnchor:v33];
    v52[4] = v34;
    double v35 = +[NSArray arrayWithObjects:v52 count:5];
    +[NSLayoutConstraint activateConstraints:v35];
  }
}

- (BOOL)dialerIsNumericOnly
{
  if (dialerIsNumericOnly_onceToken != -1) {
    dispatch_once(&dialerIsNumericOnly_onceToken, &__block_literal_global_17);
  }
  return dialerIsNumericOnly_isNumericOnly;
}

void __42__PHHandsetDialerView_dialerIsNumericOnly__block_invoke(id a1)
{
  id v3 = +[NSBundle mainBundle];
  v1 = [v3 bundleIdentifier];
  v2 = TUPreferredFaceTimeBundleIdentifier();
  dialerIsNumericOnly_isNumericOnly = [v1 isEqualToString:v2];
}

- (void)updateContraintsForStatusBar
{
  [(PHHandsetDialerView *)self _keypadToCallButtonYSpacing];
  double v4 = v3;
  double v5 = [(PHHandsetDialerView *)self callButtonKeypadOffsetConstraint];
  [v5 setConstant:v4];

  [(PHHandsetDialerView *)self _yOffsetForKeypadView];
  double v7 = v6;
  double v8 = [(PHHandsetDialerView *)self phonePadViewTopConstraint];
  [v8 setConstant:v7];

  [(PHHandsetDialerView *)self _yOffsetForAddContactButton];
  double v10 = v9;
  double v11 = [(PHHandsetDialerView *)self addContactButtonTopConstraint];
  [v11 setConstant:v10];

  id v12 = [(PHAbstractDialerView *)self phonePadView];
  [v12 invalidateIntrinsicContentSize];
}

- (void)setIsHostedInRemoteViewController:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PHHandsetDialerView;
  -[PHAbstractDialerView setIsHostedInRemoteViewController:](&v6, "setIsHostedInRemoteViewController:");
  double v5 = [(PHAbstractDialerView *)self lcdView];
  [v5 setIsHostedInRemoteViewController:v3];

  [(PHHandsetDialerView *)self updateContraintsForStatusBar];
}

- (id)newLCDView
{
  BOOL v3 = [PHHandsetDialerLCDView alloc];
  [(PHHandsetDialerView *)self bounds];
  double v4 = -[PHHandsetDialerLCDView initWithFrame:forDialerType:](v3, "initWithFrame:forDialerType:", 0, 0.0, 0.0);
  [(PHHandsetDialerLCDView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v5 = [(PHHandsetDialerLCDView *)v4 addContactButton];
  [(PHAbstractDialerView *)self setAddContactButton:v5];

  objc_super v6 = [(PHHandsetDialerLCDView *)v4 pillView];
  [(PHHandsetDialerView *)self setPillView:v6];

  double v7 = [(PHHandsetDialerLCDView *)v4 searchButton];
  [(PHAbstractDialerView *)self setSearchButton:v7];

  double v8 = [(PHHandsetDialerLCDView *)v4 contactCountButton];
  [(PHAbstractDialerView *)self setContactCountButton:v8];

  double v9 = [(PHHandsetDialerLCDView *)v4 headerLayoutGuide];
  [(PHHandsetDialerView *)self setHeaderLayoutGuide:v9];

  return v4;
}

- (id)numberPadButtonsForCharacters:(id)a3
{
  id v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __53__PHHandsetDialerView_numberPadButtonsForCharacters___block_invoke;
  v9[3] = &unk_10027DCA8;
  v9[4] = self;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  objc_super v6 = v10;
  id v7 = v5;

  return v7;
}

void __53__PHHandsetDialerView_numberPadButtonsForCharacters___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_super v6 = [PHHandsetDialerNumberPadButton alloc];
  signed int v7 = [v5 intValue];

  uint64_t v8 = v7;
  double v9 = [*(id *)(a1 + 32) traitCollection];
  id v10 = -[PHHandsetDialerNumberPadButton initForCharacter:style:](v6, "initForCharacter:style:", v8, [v9 userInterfaceStyle]);

  [*(id *)(a1 + 40) insertObject:v10 atIndex:a3];
}

- (void)createDeleteButtonX
{
  id v19 = [(PHHandsetDialerView *)self deleteButtonXImageView];
  id v3 = objc_alloc((Class)UIView);
  id v4 = [(PHAbstractDialerView *)self deleteButton];
  [v4 frame];
  double v6 = v5;
  +[PHHandsetDialerNumberPadButton circleBounds];
  double v8 = v6 - (v7 * 0.5 + 2.0);
  double v9 = [(PHAbstractDialerView *)self deleteButton];
  [v9 frame];
  double v11 = v10 * 0.5;
  [v19 frame];
  double v13 = v11 - v12 * 0.5;
  [v19 frame];
  double v15 = v14;
  [v19 frame];
  id v16 = [v3 initWithFrame:v8, v13, v15];
  deleteButtonXView = self->_deleteButtonXView;
  self->_deleteButtonXView = v16;

  [(UIView *)self->_deleteButtonXView setUserInteractionEnabled:0];
  [(UIView *)self->_deleteButtonXView addSubview:v19];
  id v18 = [(PHAbstractDialerView *)self deleteButton];
  [v18 addSubview:self->_deleteButtonXView];
}

- (id)deleteButtonXImageView
{
  id v2 = objc_alloc((Class)UIImageView);
  id v3 = +[UIImage imageNamed:@"keypad-delete-x"];
  id v4 = [v3 imageWithRenderingMode:2];
  id v5 = [v2 initWithImage:v4];

  double v6 = +[UIColor dynamicLabelColor];
  [v5 setTintColor:v6];

  return v5;
}

- (id)deleteButtonImageName
{
  return @"keypad-delete-arrow";
}

- (id)newDeleteButton
{
  id v3 = +[PHHandsetDialerDeleteButton buttonWithType:1];
  id v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setOpaque:0];
  id v5 = +[UIColor dynamicLabelColor];
  [v3 setTintColor:v5];

  [v3 setHighlighted:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v6) = 1144750080;
  [v3 setContentCompressionResistancePriority:0 forAxis:v6];
  double v7 = [(PHHandsetDialerView *)self deleteButtonImageName];
  double v8 = +[UIImage imageNamed:v7];

  [v3 setImage:v8 forState:0];
  +[PHHandsetDialerNumberPadButton circleBounds];
  double v10 = v9 * 0.5;
  [v8 size];
  double v12 = v10 - v11 * 0.5;
  +[PHHandsetDialerNumberPadButton circleBounds];
  double v14 = v13 * 0.5;
  [v8 size];
  double v16 = v14 - v15 * 0.5;
  +[PHHandsetDialerNumberPadButton circleBounds];
  double v18 = v17 * 0.5;
  [v8 size];
  double v20 = v18 - v19 * 0.5;
  +[PHHandsetDialerNumberPadButton circleBounds];
  double v22 = v21 * 0.5;
  [v8 size];
  [v3 setContentEdgeInsets:v12, v16, v20, v22 - v23 * 0.5];
  +[PHHandsetDialerNumberPadButton circleBounds];
  double v25 = v24 * 0.5;
  v26 = [v3 layer];
  [v26 setCornerRadius:v25];

  [v3 sizeToFit];
  return v3;
}

- (void)setDeleteButtonAlpha:(double)a3
{
  id v4 = [(PHAbstractDialerView *)self deleteButton];
  [v4 setAlpha:a3];
}

- (id)newNumberPadView
{
  if ([(PHHandsetDialerView *)self dialerIsNumericOnly]) {
    +[TPDialerNumberPad dialerNumberPadNumericCharacters];
  }
  else {
  id v3 = +[TPDialerNumberPad dialerNumberPadFullCharacters];
  }
  id v4 = objc_alloc((Class)TPDialerNumberPad);
  id v5 = [(PHHandsetDialerView *)self numberPadButtonsForCharacters:v3];
  id v6 = [v4 initWithButtons:v5];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v6;
}

- (id)newCallButton
{
  id v3 = [PHBottomBarButtonConfiguration alloc];
  [(PHHandsetDialerView *)self callButtonDiameter];
  id v4 = -[PHBottomBarButtonConfiguration initWithAction:diameter:callState:](v3, "initWithAction:diameter:callState:", 1, 2);
  id v5 = [[PHBottomBarButton alloc] initWithConfiguration:v4];
  [(PHBottomBarButton *)v5 setTitle:0 forState:0];
  [(PHBottomBarButton *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v5;
}

- (double)callButtonDiameter
{
  +[PHBottomBarButtonConfiguration defaultWidth];
  double v3 = v2;
  if (!+[PHInCallUIUtilities hasMultipleSenderIdentities](PHInCallUIUtilities, "hasMultipleSenderIdentities")|| (+[PHUIConfiguration handsetDialerSpacing] | 2) != 2)
  {
    return v3;
  }

  +[PHHandsetDialerNumberPadButton outerCircleDiameter];
  return result;
}

- (double)_yOffsetForAddContactButton
{
  double v3 = 0.0;
  if (+[PHUIConfiguration requiresSmallScreenConfig]
    && !+[PHInCallUIUtilities hasMultipleSenderIdentities])
  {
    if ([(PHAbstractDialerView *)self isHostedInRemoteViewController]) {
      return 0.0;
    }
    else {
      return 15.0;
    }
  }
  return v3;
}

- (double)_yOffsetForKeypadView
{
  if (+[PHUIConfiguration shouldUseExplicitLayoutDimensions])
  {
    [(PHHandsetDialerView *)self yOffsetFromKeypadToLCDViewForExplicitLayoutDevices];
  }
  else
  {
    double v4 = 84.0;
    switch(+[PHUIConfiguration handsetDialerSpacing])
    {
      case 0uLL:
        +[PHHandsetDialerNumberPadButton verticalPadding];
        double v6 = 17.0;
        goto LABEL_15;
      case 1uLL:
        break;
      case 2uLL:
        if (+[PHInCallUIUtilities hasMultipleSenderIdentities])
        {
          double v4 = 156.0;
        }
        else
        {
          double v4 = 141.0;
        }
        break;
      case 3uLL:
        +[PHHandsetDialerNumberPadButton verticalPadding];
        double v6 = 173.5;
        goto LABEL_15;
      case 4uLL:
        double v4 = 87.5;
        break;
      case 5uLL:
        +[PHHandsetDialerNumberPadButton verticalPadding];
        double v6 = 81.0;
        goto LABEL_15;
      case 6uLL:
        +[PHHandsetDialerNumberPadButton verticalPadding];
        double v6 = 99.0;
LABEL_15:
        double v4 = v6 - v5;
        break;
      default:
        double v4 = 150.0;
        break;
    }
    [(PHHandsetDialerView *)self _remoteViewControllerDialerOffset];
    double v8 = v4 - v7;
    +[PHUIConfiguration yOffsetForSmartDialerLCDView];
    return v8 - v9;
  }
  return result;
}

- (double)_remoteViewControllerDialerOffset
{
  double v2 = 0.0;
  if ([(PHAbstractDialerView *)self isHostedInRemoteViewController])
  {
    unint64_t v3 = +[PHUIConfiguration handsetDialerSpacing];
    if (v3 <= 6) {
      return dbl_100204308[v3];
    }
  }
  return v2;
}

- (double)_keypadToCallButtonYSpacing
{
  if (+[PHUIConfiguration shouldUseExplicitLayoutDimensions])
  {
    [(PHHandsetDialerView *)self yOffsetFromKeypadToDialerButtonForExplictLayoutDevices];
  }
  else
  {
    unint64_t v4 = +[PHUIConfiguration handsetDialerSpacing];
    double result = 7.0;
    switch(v4)
    {
      case 0uLL:
        +[PHHandsetDialerNumberPadButton verticalPadding];
        break;
      case 1uLL:
        return result;
      case 3uLL:
        +[PHHandsetDialerNumberPadButton verticalPadding];
        double v6 = 17.0;
        goto LABEL_12;
      case 5uLL:
        +[PHHandsetDialerNumberPadButton verticalPadding];
        double v6 = 18.0;
LABEL_12:
        double result = v6 - v5;
        break;
      default:
        double result = 8.5;
        break;
    }
  }
  return result;
}

- (double)yOffsetFromKeypadToLCDViewForExplicitLayoutDevices
{
  unint64_t v3 = +[PHUIConfiguration screenSize];
  double result = 3.0;
  switch(v3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      BOOL v5 = ![(PHAbstractDialerView *)self isHostedInRemoteViewController];
      double result = 17.0;
      goto LABEL_9;
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      return 38.0;
    case 4uLL:
    case 9uLL:
      goto LABEL_8;
    default:
      if (v3 != 15 && v3 != 13) {
        return 38.0;
      }
LABEL_8:
      BOOL v5 = ![(PHAbstractDialerView *)self isHostedInRemoteViewController];
      double result = 20.0;
LABEL_9:
      if (!v5) {
        return 12.0;
      }
      return result;
  }
}

- (double)yOffsetFromKeypadToDialerButtonForExplictLayoutDevices
{
  double v2 = 0.0;
  switch(+[PHUIConfiguration screenSize])
  {
    case 0uLL:
      +[PHHandsetDialerNumberPadButton verticalPadding];
      double v4 = 3.5;
      goto LABEL_6;
    case 1uLL:
      +[PHHandsetDialerNumberPadButton verticalPadding];
      double v4 = 8.5;
LABEL_6:
      double v2 = v3 + v4;
      break;
    case 4uLL:
    case 0xAuLL:
    case 0xFuLL:
      double v2 = 18.0;
      break;
    case 9uLL:
    case 0xBuLL:
    case 0xDuLL:
      double v2 = 9.0;
      break;
    case 0xCuLL:
      double v2 = 19.0;
      break;
    case 0xEuLL:
      double v2 = 26.0;
      break;
    default:
      break;
  }
  +[PHHandsetDialerNumberPadButton verticalPadding];
  return v2 - v5;
}

- (BOOL)phonePadViewTopShouldConstrainToLCDView
{
  unint64_t v2 = +[PHUIConfiguration screenSize];
  return (v2 < 0x10) & (0xFE33u >> v2);
}

- (TPPillView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
}

- (NSLayoutConstraint)phonePadViewTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPhonePadViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)addContactButtonTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAddContactButtonTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)callButtonKeypadOffsetConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCallButtonKeypadOffsetConstraint:(id)a3
{
}

- (UIView)deleteButtonXView
{
  return self->_deleteButtonXView;
}

- (void)setDeleteButtonXView:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (UILayoutGuide)headerLayoutGuide
{
  return self->_headerLayoutGuide;
}

- (void)setHeaderLayoutGuide:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_deleteButtonXView, 0);
  objc_storeStrong((id *)&self->_callButtonKeypadOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_addContactButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_phonePadViewTopConstraint, 0);

  objc_storeStrong((id *)&self->_pillView, 0);
}

@end