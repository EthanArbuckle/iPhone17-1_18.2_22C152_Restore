@interface GAXFeatureViewController
+ (GAXFeatureViewController)allocWithZone:(_NSZone *)a3;
- (BOOL)_isUsingAppRestrictions;
- (BOOL)isTouchEnabled;
- (BOOL)shouldDisplayMiniToolbar;
- (GAXFeatureViewControllerDelegate)delegate;
- (GAXStyleProvider)styleProvider;
- (GAXUIServer)userInterfaceServer;
- (NSArray)hardwareFeatureViewsParameters;
- (NSArray)systemFeatureViewsParameters;
- (NSLayoutConstraint)instructionsLabelWidthConstraint;
- (UIButton)optionsButton;
- (UILabel)instructionsLabel;
- (UIOffset)optionsButtonOffset;
- (double)featureViewControllerHeight;
- (double)instructionsLabelHorizontalOffset;
- (id)_viewForPresentingOverlayUserInterface;
- (int64_t)applicationInterfaceOrientation;
- (unint64_t)_numFeatures;
- (unint64_t)supportedInterfaceOrientations;
- (void)_enumerateAppFeatureViewsParametersUsingBlock:(id)a3;
- (void)_enumerateHardwareFeatureViewsParametersUsingBlock:(id)a3;
- (void)_enumerateSystemFeatureViewsParametersUsingBlock:(id)a3;
- (void)_handleTouchUpInside:(id)a3;
- (void)dismissOptionsAnimated:(BOOL)a3;
- (void)loadView;
- (void)presentOptionsAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInstructionsLabel:(id)a3;
- (void)setInstructionsLabelWidthConstraint:(id)a3;
- (void)setOptionsButton:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setUserInterfaceServer:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation GAXFeatureViewController

+ (GAXFeatureViewController)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    GAXUserInterfaceIdiomIsPad();
    v6 = objc_opt_class();
    return (GAXFeatureViewController *)[v6 allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___GAXFeatureViewController;
    return (GAXFeatureViewController *)objc_msgSendSuper2(&v7, "allocWithZone:", a3);
  }
}

- (void)loadView
{
  v3 = [(GAXFeatureViewController *)self styleProvider];
  v4 = +[UIApplication sharedApplication];
  v5 = [v4 preferredContentSizeCategory];
  uint64_t v6 = _UIContentSizeCategoryCompareToContentSizeCategory();

  objc_super v7 = [GAXGroupingView alloc];
  [(GAXFeatureViewController *)self featureViewControllerHeight];
  v9 = -[GAXGroupingView initWithFrame:](v7, "initWithFrame:", 0.0, 0.0, 1.0, v8);
  [(GAXViewController *)self setView:v9];
  id v10 = [objc_alloc((Class)_UIBackdropView) initWithStyle:2030];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(GAXGroupingView *)v9 addSubview:v10];
  v11 = objc_opt_new();
  [v11 setIdentifier:@"safeAreaStrut"];
  [(GAXGroupingView *)v9 addLayoutGuide:v11];
  v12 = objc_opt_new();
  [v12 setIdentifier:@"usableSpaceGuide"];
  [(GAXGroupingView *)v9 addLayoutGuide:v12];
  uint64_t v13 = [v3 featureViewControllerInstructionsFont];
  v119 = GAXLocString(@"HELP_INTEREST_AREA");
  v120 = (void *)v13;
  v14 = +[GAXInterfaceUtilities labelWithText:font:allowMultipleLines:styleProvider:](GAXInterfaceUtilities, "labelWithText:font:allowMultipleLines:styleProvider:");
  if ([(GAXFeatureViewController *)self isTouchEnabled]) {
    double v15 = 1.0;
  }
  else {
    double v15 = 0.0;
  }
  [v14 setAlpha:v15];
  v16 = [v3 featureViewControllerInstructionsColor];
  [v14 setTextColor:v16];

  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(GAXFeatureViewController *)self setInstructionsLabel:v14];
  v123 = v14;
  [(GAXGroupingView *)v9 addSubview:v14];
  v124[0] = NSFontAttributeName;
  v17 = [v3 featureViewControllerOptionsButtonFont];
  v125[0] = v17;
  v124[1] = NSForegroundColorAttributeName;
  uint64_t v18 = [v3 defaultLabelTextColor];
  v19 = (void *)v18;
  v124[2] = NSUnderlineStyleAttributeName;
  v20 = &off_616B8;
  if (v6 == -1) {
    v20 = &off_616D0;
  }
  v125[1] = v18;
  v125[2] = v20;
  uint64_t v21 = +[NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:3];

  id v22 = objc_alloc((Class)NSAttributedString);
  v23 = GAXLocString(@"OPTIONS");
  v118 = (void *)v21;
  id v24 = [v22 initWithString:v23 attributes:v21];

  v25 = +[UIButton buttonWithType:1];
  [(GAXFeatureViewController *)self setOptionsButton:v25];

  v26 = [(GAXFeatureViewController *)self optionsButton];
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

  v27 = [(GAXFeatureViewController *)self optionsButton];
  [v27 addTarget:self action:"_handleTouchUpInside:" forControlEvents:64];

  v28 = [(GAXFeatureViewController *)self optionsButton];
  v117 = v24;
  [v28 setAttributedTitle:v24 forState:0];

  v29 = [(GAXFeatureViewController *)self optionsButton];
  [(GAXGroupingView *)v9 addSubview:v29];

  objc_msgSend(v10, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 4, v9);
  objc_msgSend(v10, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 5, v9);
  objc_msgSend(v10, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 6, v9);
  v121 = v10;
  objc_msgSend(v10, "ax_constrainLayoutAttribute:asEqualToValueOfView:", 3, v9);
  v30 = +[NSMutableArray array];
  v31 = [v11 bottomAnchor];
  v32 = [(GAXGroupingView *)v9 bottomAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  [v30 addObject:v33];

  v34 = [v11 leadingAnchor];
  v35 = [(GAXGroupingView *)v9 leadingAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v30 addObject:v36];

  v37 = [v11 trailingAnchor];
  v38 = [(GAXGroupingView *)v9 trailingAnchor];
  v39 = [v37 constraintEqualToAnchor:v38];
  [v30 addObject:v39];

  v40 = [v12 bottomAnchor];
  v116 = v11;
  v41 = [v11 topAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  [v30 addObject:v42];

  v43 = [v12 topAnchor];
  v44 = [(GAXGroupingView *)v9 topAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [v30 addObject:v45];

  v46 = [v12 leadingAnchor];
  v47 = [(GAXGroupingView *)v9 safeAreaLayoutGuide];
  v48 = [v47 leadingAnchor];
  v49 = [v46 constraintEqualToAnchor:v48];
  [v30 addObject:v49];

  v50 = [v12 trailingAnchor];
  v51 = [(GAXGroupingView *)v9 safeAreaLayoutGuide];
  v52 = [v51 trailingAnchor];
  v53 = [v50 constraintEqualToAnchor:v52];
  [v30 addObject:v53];

  [(GAXFeatureViewController *)self instructionsLabelHorizontalOffset];
  double v55 = v54;
  [(GAXFeatureViewController *)self optionsButtonOffset];
  double v57 = v56;
  v122 = v3;
  [v3 featureViewControllerOptionsButtonTitleHorizontalPadding];
  double v59 = v58;
  [(GAXFeatureViewController *)self optionsButtonOffset];
  double v61 = v60;
  v62 = [(GAXFeatureViewController *)self optionsButton];
  LODWORD(v63) = AXResistAllCompressingAndStretching[0];
  LODWORD(v64) = AXResistAllCompressingAndStretching[1];
  LODWORD(v65) = AXResistAllCompressingAndStretching[2];
  LODWORD(v66) = AXResistAllCompressingAndStretching[3];
  objc_msgSend(v62, "ax_setContentHuggingAndCompressionResistance:", v63, v64, v65, v66);

  if (v6 == -1)
  {
    v85 = [v123 bottomAnchor];
    v86 = [v12 bottomAnchor];
    v87 = [v85 constraintEqualToAnchor:v86];
    [v30 addObject:v87];

    v88 = [v123 leadingAnchor];
    v89 = [(GAXFeatureViewController *)self optionsButton];
    v90 = [v89 trailingAnchor];
    v91 = [v88 constraintEqualToAnchor:v90 constant:v55];
    [v30 addObject:v91];

    v92 = [v123 topAnchor];
    v93 = [v12 topAnchor];
    v94 = [v92 constraintEqualToAnchor:v93];
    [v30 addObject:v94];

    v95 = [v123 centerXAnchor];
    v96 = [v12 centerXAnchor];
    v81 = [v95 constraintEqualToAnchor:v96];

    [(GAXFeatureViewController *)self setInstructionsLabelWidthConstraint:v81];
    [(GAXGroupingView *)v9 addConstraint:v81];
    v97 = [(GAXFeatureViewController *)self optionsButton];
    v98 = [v97 leadingAnchor];
    v99 = [v12 leadingAnchor];
    v100 = [v98 constraintEqualToAnchor:v99 constant:v57 + v59 * 0.5];
    [v30 addObject:v100];

    v101 = [(GAXFeatureViewController *)self optionsButton];
    v102 = [v101 topAnchor];
    v103 = [v12 topAnchor];
    v104 = [v102 constraintEqualToAnchor:v103 constant:v61];
    [v30 addObject:v104];

    v105 = [(GAXFeatureViewController *)self optionsButton];
    v106 = [v105 bottomAnchor];
    v107 = [v12 bottomAnchor];
    v108 = [v106 constraintLessThanOrEqualToAnchor:v107];
    [v30 addObject:v108];

    v82 = [(GAXFeatureViewController *)self optionsButton];
    v83 = [v82 centerYAnchor];
    v84 = [v12 centerYAnchor];
    v109 = [v83 constraintEqualToAnchor:v84];
    [v30 addObject:v109];
  }
  else
  {
    v67 = [v123 topAnchor];
    v68 = [v12 topAnchor];
    v69 = [v67 constraintEqualToAnchor:v68];
    [v30 addObject:v69];

    v70 = [v123 widthAnchor];
    v71 = [v12 widthAnchor];
    v72 = [v70 constraintEqualToAnchor:v71];
    [v30 addObject:v72];

    v73 = [v123 bottomAnchor];
    v74 = [(GAXFeatureViewController *)self optionsButton];
    v75 = [v74 topAnchor];
    v76 = [v73 constraintEqualToAnchor:v75];
    [v30 addObject:v76];

    v77 = [(GAXFeatureViewController *)self optionsButton];
    v78 = [v77 centerXAnchor];
    v79 = [v12 centerXAnchor];
    v80 = [v78 constraintEqualToAnchor:v79];
    [v30 addObject:v80];

    v81 = [(GAXFeatureViewController *)self optionsButton];
    v82 = [v81 bottomAnchor];
    v83 = [v12 bottomAnchor];
    v84 = [v82 constraintEqualToAnchor:v83 constant:-v61];
    [v30 addObject:v84];
  }

  v110 = [v116 topAnchor];
  v111 = [(GAXFeatureViewController *)self view];
  v112 = [v111 safeAreaLayoutGuide];
  v113 = [v112 bottomAnchor];
  v114 = [v110 constraintEqualToAnchor:v113];
  safeAreaStrutHeightConstraint = self->_safeAreaStrutHeightConstraint;
  self->_safeAreaStrutHeightConstraint = v114;

  [v30 addObject:self->_safeAreaStrutHeightConstraint];
  +[NSLayoutConstraint activateConstraints:v30];
}

- (void)viewDidLayoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)GAXFeatureViewController;
  [(GAXFeatureViewController *)&v28 viewDidLayoutSubviews];
  v3 = [(GAXFeatureViewController *)self styleProvider];
  v4 = [(GAXFeatureViewController *)self view];
  v5 = [(GAXFeatureViewController *)self instructionsLabel];
  uint64_t v6 = [v5 font];
  [v5 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(GAXFeatureViewController *)self instructionsLabelHorizontalOffset];
  double v16 = v15;
  v17 = [v5 text];
  [v4 frame];
  double Width = CGRectGetWidth(v29);
  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  double MaxX = CGRectGetMaxX(v30);
  +[GAXInterfaceUtilities labelSizeThatFitsText:constrainedToSize:font:styleProvider:](GAXInterfaceUtilities, "labelSizeThatFitsText:constrainedToSize:font:styleProvider:", v17, v6, v3, v12, 1.79769313e308);
  double v20 = Width - MaxX;
  if (v21 > v14 && v20 != v16)
  {
    v23 = +[UIApplication sharedApplication];
    id v24 = [v23 preferredContentSizeCategory];
    uint64_t v25 = _UIContentSizeCategoryCompareToContentSizeCategory();

    if (v25 == -1)
    {
      v26 = [(GAXFeatureViewController *)self instructionsLabelWidthConstraint];
      [v4 removeConstraint:v26];

      v27 = +[NSLayoutConstraint constraintWithItem:v5 attribute:6 relatedBy:0 toItem:v4 attribute:6 multiplier:1.0 constant:-v16];
      [(GAXFeatureViewController *)self setInstructionsLabelWidthConstraint:v27];
      [v4 addConstraint:v27];
      [v4 layoutIfNeeded];
    }
  }
}

- (double)instructionsLabelHorizontalOffset
{
  v3 = [(GAXFeatureViewController *)self styleProvider];
  if ([(GAXFeatureViewController *)self shouldDisplayMiniToolbar]) {
    [v3 featureViewControllerInstructionsMiniHorizontalOffset];
  }
  else {
    [v3 featureViewControllerInstructionsHorizontalOffset];
  }
  double v5 = v4;

  return v5;
}

- (BOOL)isTouchEnabled
{
  v2 = [(GAXFeatureViewController *)self userInterfaceServer];
  unsigned __int8 v3 = [v2 allowsTouch];

  return v3;
}

- (UIOffset)optionsButtonOffset
{
  unsigned __int8 v3 = [(GAXFeatureViewController *)self styleProvider];
  if ([(GAXFeatureViewController *)self shouldDisplayMiniToolbar]) {
    [v3 featureViewControllerOptionsButtonMiniOffset];
  }
  else {
    [v3 featureViewControllerOptionsButtonOffset];
  }
  double v6 = v4;
  double v7 = v5;

  double v8 = v6;
  double v9 = v7;
  result.vertical = v9;
  result.horizontal = v8;
  return result;
}

- (double)featureViewControllerHeight
{
  unsigned __int8 v3 = [(GAXFeatureViewController *)self styleProvider];
  if ([(GAXFeatureViewController *)self shouldDisplayMiniToolbar]) {
    [v3 featureViewControllerMiniHeight];
  }
  else {
    [v3 featureViewControllerHeight];
  }
  double v5 = v4;

  return v5;
}

- (int64_t)applicationInterfaceOrientation
{
  v2 = +[AXUIDisplayManager sharedDisplayManager];
  id v3 = [v2 activeInterfaceOrientation];

  return (int64_t)v3;
}

- (NSArray)hardwareFeatureViewsParameters
{
  if (qword_6E808 != -1) {
    dispatch_once(&qword_6E808, &stru_5DAE8);
  }
  v2 = (void *)qword_6E800;

  return (NSArray *)v2;
}

- (BOOL)shouldDisplayMiniToolbar
{
  id v3 = [(GAXFeatureViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 shouldDisplayMiniToolbarForController:self];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (NSArray)systemFeatureViewsParameters
{
  if (qword_6E818 != -1) {
    dispatch_once(&qword_6E818, &stru_5DB08);
  }
  v2 = (void *)qword_6E810;

  return (NSArray *)v2;
}

- (void)_handleTouchUpInside:(id)a3
{
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (unint64_t)_numFeatures
{
  id v3 = [(GAXFeatureViewController *)self hardwareFeatureViewsParameters];
  id v4 = [v3 count];
  double v5 = [(GAXFeatureViewController *)self systemFeatureViewsParameters];
  id v6 = [v5 count];
  if ([(GAXFeatureViewController *)self _isUsingAppRestrictions])
  {
    double v7 = [(GAXFeatureViewController *)self userInterfaceServer];
    double v8 = [v7 appRestrictionIdentifiers];
    id v9 = [v8 count];
  }
  else
  {
    id v9 = 0;
  }

  return (unint64_t)v6 + (void)v4 + (unint64_t)v9 + 1;
}

- (void)_enumerateAppFeatureViewsParametersUsingBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(GAXFeatureViewController *)self userInterfaceServer];
  id v6 = [v5 appRestrictionIdentifiers];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_28354;
  v9[3] = &unk_5DB30;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 enumerateObjectsUsingBlock:v9];
}

- (void)_enumerateHardwareFeatureViewsParametersUsingBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(GAXFeatureViewController *)self styleProvider];
  id v6 = [(GAXFeatureViewController *)self userInterfaceServer];
  id v7 = [(GAXFeatureViewController *)self hardwareFeatureViewsParameters];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_28538;
  v11[3] = &unk_5DB58;
  id v12 = v5;
  id v13 = v6;
  id v14 = v4;
  id v8 = v4;
  id v9 = v6;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v11];
}

- (void)_enumerateSystemFeatureViewsParametersUsingBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(GAXFeatureViewController *)self styleProvider];
  id v6 = [(GAXFeatureViewController *)self userInterfaceServer];
  id v7 = [(GAXFeatureViewController *)self systemFeatureViewsParameters];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_28748;
  v11[3] = &unk_5DB58;
  id v12 = v5;
  id v13 = v6;
  id v14 = v4;
  id v8 = v4;
  id v9 = v6;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v11];
}

- (BOOL)_isUsingAppRestrictions
{
  v2 = [(GAXFeatureViewController *)self userInterfaceServer];
  id v3 = [v2 appRestrictionIdentifiers];

  if (v3) {
    BOOL v4 = [v3 count] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_viewForPresentingOverlayUserInterface
{
  id v3 = [(GAXFeatureViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [v3 viewForPresentingOverlayUserInterfaceForFeatureViewController:self];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (GAXFeatureViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GAXFeatureViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GAXStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (GAXUIServer)userInterfaceServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceServer);

  return (GAXUIServer *)WeakRetained;
}

- (void)setUserInterfaceServer:(id)a3
{
}

- (UILabel)instructionsLabel
{
  return self->_instructionsLabel;
}

- (void)setInstructionsLabel:(id)a3
{
}

- (NSLayoutConstraint)instructionsLabelWidthConstraint
{
  return self->_instructionsLabelWidthConstraint;
}

- (void)setInstructionsLabelWidthConstraint:(id)a3
{
}

- (UIButton)optionsButton
{
  return self->_optionsButton;
}

- (void)setOptionsButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsButton, 0);
  objc_storeStrong((id *)&self->_instructionsLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_instructionsLabel, 0);
  objc_destroyWeak((id *)&self->_userInterfaceServer);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_safeAreaStrutHeightConstraint, 0);
}

- (void)dismissOptionsAnimated:(BOOL)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)presentOptionsAnimated:(BOOL)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

@end