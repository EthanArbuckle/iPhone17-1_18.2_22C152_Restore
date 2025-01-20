@interface BuddyProximityBackingViewController
- (BFFProximityVisualPairingViewController)visualPairingViewController;
- (BOOL)_largeAXMode;
- (BOOL)isShowingVisualPairing;
- (BOOL)nonUserInitiatedDismissal;
- (BOOL)showPairingStyleToggle;
- (BrightnessSystemClient)brightnessClient;
- (BuddyProximityBackingStringProviding)stringProvider;
- (BuddyProximityBackingViewController)initWithStringProvider:(id)a3;
- (BuddyProximityBackingViewControllerDelegate)delegate;
- (NSLayoutConstraint)heightConstraint;
- (NSString)language;
- (NSString)pairingCode;
- (OBLinkTrayButton)pairingStyleToggleButton;
- (UILabel)pinCodeLabel;
- (UIView)containerView;
- (void)addPairingStyleToggleButtonBelowView:(id)a3;
- (void)pairingStyleToggleTapped:(id)a3;
- (void)prepareForLanguageChange:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setMinimumBrightness:(float)a3;
- (void)setNonUserInitiatedDismissal:(BOOL)a3;
- (void)setPairingCode:(id)a3;
- (void)setPairingStyleToggleButton:(id)a3;
- (void)setPinCodeLabel:(id)a3;
- (void)setShowingVisualPairing:(BOOL)a3;
- (void)setVisualPairingViewController:(id)a3;
- (void)showPairingCode;
- (void)showVisualPairing;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateView;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BuddyProximityBackingViewController

- (BuddyProximityBackingViewController)initWithStringProvider:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v10;
  id v10 = 0;
  v8.receiver = v3;
  v8.super_class = (Class)BuddyProximityBackingViewController;
  id v10 = [(BuddyProximityBackingViewController *)&v8 initWithTitle:&stru_1002B4E18 detailText:0 icon:0];
  objc_storeStrong(&v10, v10);
  if (v10)
  {
    objc_storeStrong((id *)v10 + 10, location[0]);
    *((unsigned char *)v10 + 9) = 1;
    id v4 = objc_alloc_init((Class)BrightnessSystemClient);
    v5 = (void *)*((void *)v10 + 11);
    *((void *)v10 + 11) = v4;
  }
  v6 = (BuddyProximityBackingViewController *)v10;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v10, 0);
  return v6;
}

- (BuddyProximityBackingViewControllerDelegate)delegate
{
  v9 = self;
  oslog[1] = (os_log_t)a2;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v7 = OS_LOG_TYPE_FAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_FAULT))
    {
      id v3 = (objc_class *)objc_opt_class();
      id location = NSStringFromClass(v3);
      sub_10004BB7C((uint64_t)buf, (uint64_t)location);
      _os_log_fault_impl((void *)&_mh_execute_header, oslog[0], v7, "%{public}@ failed to receive a delegate", buf, 0xCu);

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  id v4 = objc_loadWeakRetained((id *)&v9->_delegate);

  return (BuddyProximityBackingViewControllerDelegate *)v4;
}

- (void)viewDidLoad
{
  v37 = self;
  SEL v36 = a2;
  v35.receiver = self;
  v35.super_class = (Class)BuddyProximityBackingViewController;
  [(BuddyProximityBackingViewController *)&v35 viewDidLoad];
  id v2 = [(BuddyProximityBackingViewController *)v37 view];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v3 = objc_alloc_init(BFFProximityVisualPairingViewController);
  [(BuddyProximityBackingViewController *)v37 setVisualPairingViewController:v3];

  id v4 = [(BuddyProximityBackingViewController *)v37 visualPairingViewController];
  id v5 = [(BFFProximityVisualPairingViewController *)v4 view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(BuddyProximityBackingViewController *)v37 setPinCodeLabel:v6];

  os_log_type_t v7 = [(BuddyProximityBackingViewController *)v37 pinCodeLabel];
  [(UILabel *)v7 setNumberOfLines:0];

  id v8 = +[UIColor _labelColor];
  v9 = [(BuddyProximityBackingViewController *)v37 pinCodeLabel];
  [(UILabel *)v9 setTextColor:v8];

  id v10 = +[UIColor _systemBackgroundColor];
  v11 = [(BuddyProximityBackingViewController *)v37 pinCodeLabel];
  [(UILabel *)v11 setBackgroundColor:v10];

  v12 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle0];
  v13 = [(BuddyProximityBackingViewController *)v37 pinCodeLabel];
  [(UILabel *)v13 setFont:v12];

  v14 = [(BuddyProximityBackingViewController *)v37 pinCodeLabel];
  [(UILabel *)v14 setTextAlignment:1];

  v15 = [(BuddyProximityBackingViewController *)v37 pinCodeLabel];
  [(UILabel *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(BuddyProximityBackingViewController *)v37 pinCodeLabel];
  LODWORD(v17) = 1148846080;
  [(UILabel *)v16 setContentHuggingPriority:1 forAxis:v17];

  if ([(BuddyProximityBackingViewController *)v37 isShowingVisualPairing]
    && [(BuddyProximityBackingViewController *)v37 showPairingStyleToggle])
  {
    id location = +[OBLinkTrayButton linkButton];
    [location setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [(BuddyProximityBackingViewController *)v37 stringProvider];
    v19 = [(BuddyProximityBackingViewController *)v37 language];
    id v20 = [(BuddyProximityBackingStringProviding *)v18 textualPairingButtonTitleWithLanguage:v19];
    [location setTitle:v20 forState:0];

    [location addTarget:v37 action:"pairingStyleToggleTapped:" forControlEvents:0x2000];
    [(BuddyProximityBackingViewController *)v37 setPairingStyleToggleButton:location];
    objc_storeStrong(&location, 0);
  }
  id v21 = objc_alloc_init((Class)UIView);
  [(BuddyProximityBackingViewController *)v37 setContainerView:v21];

  v22 = [(BuddyProximityBackingViewController *)v37 containerView];
  [(UIView *)v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v23 = +[UIColor _systemBackgroundColor];
  v24 = [(BuddyProximityBackingViewController *)v37 containerView];
  [(UIView *)v24 setBackgroundColor:v23];

  objc_initWeak(&from, v37);
  v25 = v37;
  v26 = [(BuddyProximityBackingViewController *)v37 containerView];
  v27 = _NSConcreteStackBlock;
  int v28 = -1073741824;
  int v29 = 0;
  v30 = sub_1000E6F48;
  v31 = &unk_1002B2C28;
  objc_copyWeak(v32, &from);
  [(BuddyProximityBackingViewController *)v25 addContentSubView:v26 heightConstraintForLayout:&v27];

  [(BuddyProximityBackingViewController *)v37 updateView];
  objc_destroyWeak(v32);
  objc_destroyWeak(&from);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  id v3 = [(BuddyProximityBackingViewController *)self visualPairingViewController];
  [(BFFProximityVisualPairingViewController *)v3 stop];

  LODWORD(v4) = 0;
  [(BuddyProximityBackingViewController *)v9 setMinimumBrightness:v4];
  if (![(BuddyProximityBackingViewController *)v9 nonUserInitiatedDismissal]
    && ([(BuddyProximityBackingViewController *)v9 isMovingFromParentViewController] & 1) != 0)
  {
    id v5 = [(BuddyProximityBackingViewController *)v9 delegate];
    [(BuddyProximityBackingViewControllerDelegate *)v5 pairingEndedByUser];
  }
  v6.receiver = v9;
  v6.super_class = (Class)BuddyProximityBackingViewController;
  [(BuddyProximityBackingViewController *)&v6 viewDidDisappear:v7];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGSize v8 = a3;
  BOOL v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v5.receiver = v7;
  v5.super_class = (Class)BuddyProximityBackingViewController;
  -[BuddyProximityBackingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, "viewWillTransitionToSize:withTransitionCoordinator:", location[0], v8.width, v8.height);
  id v4 = [(BuddyProximityBackingViewController *)v7 view];
  [v4 setNeedsLayout];

  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)BuddyProximityBackingViewController;
  [(BuddyProximityBackingViewController *)&v3 traitCollectionDidChange:location[0]];
  [(BuddyProximityBackingViewController *)v5 updateView];
  objc_storeStrong(location, 0);
}

- (void)showVisualPairing
{
  -[BuddyProximityBackingViewController setShowingVisualPairing:](self, "setShowingVisualPairing:", 1, a2);
  [(BuddyProximityBackingViewController *)self updateView];
  id v2 = [(BuddyProximityBackingViewController *)self visualPairingViewController];
  [(BFFProximityVisualPairingViewController *)v2 start];
}

- (void)showPairingCode
{
  -[BuddyProximityBackingViewController setShowingVisualPairing:](self, "setShowingVisualPairing:", 0, a2);
  [(BuddyProximityBackingViewController *)self updateView];
  id v2 = [(BuddyProximityBackingViewController *)self visualPairingViewController];
  [(BFFProximityVisualPairingViewController *)v2 stop];
}

- (void)prepareForLanguageChange:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v3 = [(BuddyProximityBackingViewController *)v12 visualPairingViewController];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  BOOL v7 = sub_1000E7450;
  CGSize v8 = &unk_1002B0CD0;
  v9 = v12;
  id v10 = location[0];
  [(BFFProximityVisualPairingViewController *)v3 pairingDidComplete:&v4];

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)updateView
{
  v72 = self;
  v71[1] = (id)a2;
  id v2 = [(BuddyProximityBackingViewController *)self view];
  [v2 layoutIfNeeded];

  objc_super v3 = [(BuddyProximityBackingViewController *)v72 delegate];
  v71[0] = [(BuddyProximityBackingViewControllerDelegate *)v3 deviceClass];

  id v70 = [(BuddyProximityBackingViewController *)v72 language];
  if ([(BuddyProximityBackingViewController *)v72 isShowingVisualPairing])
  {
    LODWORD(v4) = 1140457472;
    [(BuddyProximityBackingViewController *)v72 setMinimumBrightness:v4];
    if ([(BuddyProximityBackingViewController *)v72 _largeAXMode]) {
      [(BuddyProximityBackingViewController *)v72 resetLayoutTo:1];
    }
    else {
      [(BuddyProximityBackingViewController *)v72 resetLayoutTo:2];
    }
    int v5 = [(BuddyProximityBackingViewController *)v72 stringProvider];
    id v69 = [(BuddyProximityBackingStringProviding *)v5 visualTitleWithDeviceClass:v71[0] language:v70];

    int v6 = [(BuddyProximityBackingViewController *)v72 stringProvider];
    id location = [(BuddyProximityBackingStringProviding *)v6 visualDescriptionWithDeviceClass:v71[0] language:v70];

    id v7 = [(BuddyProximityBackingViewController *)v72 headerView];
    [v7 setTitle:v69];

    id v8 = [(BuddyProximityBackingViewController *)v72 headerView];
    [v8 setDetailText:location];

    id v9 = [(BuddyProximityBackingViewController *)v72 headerView];
    [v9 setLanguage:v70];

    id v10 = [(BuddyProximityBackingViewController *)v72 visualPairingViewController];
    v11 = [(BuddyProximityBackingViewController *)v72 pairingCode];
    [(BFFProximityVisualPairingViewController *)v10 setPairingCode:v11];

    v12 = [(BuddyProximityBackingViewController *)v72 pinCodeLabel];
    [(UILabel *)v12 removeFromSuperview];

    v13 = [(BuddyProximityBackingViewController *)v72 containerView];
    v14 = [(BuddyProximityBackingViewController *)v72 visualPairingViewController];
    id v15 = [(BFFProximityVisualPairingViewController *)v14 view];
    [(UIView *)v13 addSubview:v15];

    if ([(BuddyProximityBackingViewController *)v72 showPairingStyleToggle])
    {
      v16 = [(BuddyProximityBackingViewController *)v72 pairingStyleToggleButton];
      double v17 = [(BuddyProximityBackingViewController *)v72 stringProvider];
      id v18 = [(BuddyProximityBackingStringProviding *)v17 textualPairingButtonTitleWithLanguage:v70];
      [(OBLinkTrayButton *)v16 setTitle:v18 forState:0];

      v19 = [(BuddyProximityBackingViewController *)v72 containerView];
      id v20 = [(UIView *)v19 topAnchor];
      id v21 = [(BuddyProximityBackingViewController *)v72 visualPairingViewController];
      id v22 = [(BFFProximityVisualPairingViewController *)v21 view];
      id v23 = [v22 topAnchor];
      id v24 = [(NSLayoutYAxisAnchor *)v20 constraintEqualToAnchor:v23];
      [v24 setActive:1];

      v25 = [(BuddyProximityBackingViewController *)v72 visualPairingViewController];
      id v26 = [(BFFProximityVisualPairingViewController *)v25 view];
      v27 = [(BuddyProximityBackingViewController *)v72 containerView];
      [v26 pinToHorizontalEdges:v27];

      int v28 = [(BuddyProximityBackingViewController *)v72 visualPairingViewController];
      id v29 = [(BFFProximityVisualPairingViewController *)v28 view];
      [(BuddyProximityBackingViewController *)v72 addPairingStyleToggleButtonBelowView:v29];
    }
    else
    {
      v30 = [(BuddyProximityBackingViewController *)v72 visualPairingViewController];
      id v31 = [(BFFProximityVisualPairingViewController *)v30 view];
      v32 = [(BuddyProximityBackingViewController *)v72 containerView];
      [v31 pinToEdges:v32];
    }
    int v67 = 1;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v69, 0);
  }
  else
  {
    LODWORD(v4) = 0;
    [(BuddyProximityBackingViewController *)v72 setMinimumBrightness:v4];
    [(BuddyProximityBackingViewController *)v72 resetLayoutTo:2];
    v33 = [(BuddyProximityBackingViewController *)v72 stringProvider];
    id v66 = [(BuddyProximityBackingStringProviding *)v33 textualTitleWithDeviceClass:v71[0] language:v70];

    v34 = [(BuddyProximityBackingViewController *)v72 stringProvider];
    id v65 = [(BuddyProximityBackingStringProviding *)v34 textualDescriptionWithDeviceClass:v71[0] language:v70];

    id v35 = [(BuddyProximityBackingViewController *)v72 headerView];
    [v35 setTitle:v66];

    id v36 = [(BuddyProximityBackingViewController *)v72 headerView];
    [v36 setDetailText:v65];

    id v37 = [(BuddyProximityBackingViewController *)v72 headerView];
    [v37 setLanguage:v70];

    id v38 = [(BuddyProximityBackingViewController *)v72 headerView];
    LODWORD(v39) = 1045220557;
    [v38 setTitleHyphenationFactor:v39];

    v40 = [(BuddyProximityBackingViewController *)v72 pinCodeLabel];
    v41 = [(BuddyProximityBackingViewController *)v72 pairingCode];
    [(UILabel *)v40 setText:v41];

    v42 = [(BuddyProximityBackingViewController *)v72 visualPairingViewController];
    id v43 = [(BFFProximityVisualPairingViewController *)v42 view];
    [v43 removeFromSuperview];

    v44 = [(BuddyProximityBackingViewController *)v72 containerView];
    v45 = [(BuddyProximityBackingViewController *)v72 pinCodeLabel];
    [(UIView *)v44 addSubview:v45];

    v46 = [(BuddyProximityBackingViewController *)v72 pinCodeLabel];
    v47 = [(BuddyProximityBackingViewController *)v72 containerView];
    [(UILabel *)v46 pinToHorizontalEdges:v47];

    v48 = [(BuddyProximityBackingViewController *)v72 pinCodeLabel];
    id v49 = [(UILabel *)v48 lastBaselineAnchor];
    v50 = [(BuddyProximityBackingViewController *)v72 containerView];
    v51 = [(UIView *)v50 topAnchor];
    char v52 = BFFIsiPad();
    double v53 = 106.0;
    if ((v52 & 1) == 0) {
      double v53 = 96.0;
    }
    id v54 = [v49 constraintEqualToAnchor:v51 constant:v53];
    [v54 setActive:1];

    if ([(BuddyProximityBackingViewController *)v72 showPairingStyleToggle])
    {
      v55 = [(BuddyProximityBackingViewController *)v72 pairingStyleToggleButton];
      v56 = [(BuddyProximityBackingViewController *)v72 stringProvider];
      id v57 = [(BuddyProximityBackingStringProviding *)v56 visualPairingButtonTitleWithLanguage:v70];
      [(OBLinkTrayButton *)v55 setTitle:v57 forState:0];

      v58 = [(BuddyProximityBackingViewController *)v72 pinCodeLabel];
      [(BuddyProximityBackingViewController *)v72 addPairingStyleToggleButtonBelowView:v58];
    }
    else
    {
      v59 = [(BuddyProximityBackingViewController *)v72 containerView];
      v60 = [(UIView *)v59 bottomAnchor];
      v61 = [(BuddyProximityBackingViewController *)v72 pinCodeLabel];
      id v62 = [(UILabel *)v61 bottomAnchor];
      id v63 = [(NSLayoutYAxisAnchor *)v60 constraintGreaterThanOrEqualToAnchor:v62];
      [v63 setActive:1];
    }
    id v64 = [(BuddyProximityBackingViewController *)v72 view];
    [v64 setNeedsLayout];

    objc_storeStrong(&v65, 0);
    objc_storeStrong(&v66, 0);
    int v67 = 0;
  }
  objc_storeStrong(&v70, 0);
  objc_storeStrong(v71, 0);
}

- (void)addPairingStyleToggleButtonBelowView:(id)a3
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v3 = [(BuddyProximityBackingViewController *)v23 pairingStyleToggleButton];
  [(OBLinkTrayButton *)v3 removeFromSuperview];

  double v4 = [(BuddyProximityBackingViewController *)v23 containerView];
  int v5 = [(BuddyProximityBackingViewController *)v23 pairingStyleToggleButton];
  [(UIView *)v4 addSubview:v5];

  int v6 = [(BuddyProximityBackingViewController *)v23 containerView];
  id v20 = [location[0] bottomAnchor];
  id v21 = [(BuddyProximityBackingViewController *)v23 pairingStyleToggleButton];
  id v19 = [(OBLinkTrayButton *)v21 topAnchor];
  id v18 = [v20 constraintEqualToAnchor:];
  v24[0] = v18;
  double v17 = [(BuddyProximityBackingViewController *)v23 containerView];
  v16 = [(UIView *)v17 bottomAnchor];
  id v7 = [(BuddyProximityBackingViewController *)v23 pairingStyleToggleButton];
  id v8 = [(OBLinkTrayButton *)v7 bottomAnchor];
  id v9 = [(NSLayoutYAxisAnchor *)v16 constraintEqualToAnchor:v8];
  v24[1] = v9;
  id v10 = [(BuddyProximityBackingViewController *)v23 containerView];
  v11 = [(UIView *)v10 centerXAnchor];
  v12 = [(BuddyProximityBackingViewController *)v23 pairingStyleToggleButton];
  id v13 = [(OBLinkTrayButton *)v12 centerXAnchor];
  id v14 = [(NSLayoutXAxisAnchor *)v11 constraintEqualToAnchor:v13];
  v24[2] = v14;
  id v15 = +[NSArray arrayWithObjects:v24 count:3];
  [(UIView *)v6 addConstraints:v15];

  objc_storeStrong(location, 0);
}

- (void)setMinimumBrightness:(float)a3
{
  v16 = self;
  SEL v15 = a2;
  float v14 = a3;
  v18[0] = @"nits";
  objc_super v3 = +[NSNumber numberWithFloat:*(double *)&a3];
  v19[0] = v3;
  v18[1] = @"period";
  v19[1] = &off_1002C1A00;
  id location = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)location);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, v11, "Setting brightness to: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  double v4 = [(BuddyProximityBackingViewController *)v16 brightnessClient];
  char v5 = [(BrightnessSystemClient *)v4 setProperty:location forKey:@"MinNits"] ^ 1;

  if (v5)
  {
    os_log_t v10 = (os_log_t)(id)_BYLoggingFacility();
    char v9 = 16;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v6 = v10;
      os_log_type_t v7 = v9;
      sub_10004B24C(v8);
      _os_log_error_impl((void *)&_mh_execute_header, v6, v7, "Failed to set brightness!", (uint8_t *)v8, 2u);
    }
    objc_storeStrong((id *)&v10, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)viewDidLayoutSubviews
{
  int v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddyProximityBackingViewController;
  [(BuddyProximityBackingViewController *)&v4 viewDidLayoutSubviews];
  id v2 = [(BuddyProximityBackingViewController *)v6 visualPairingViewController];
  [(BFFProximityVisualPairingViewController *)v2 stop];

  objc_super v3 = [(BuddyProximityBackingViewController *)v6 visualPairingViewController];
  [(BFFProximityVisualPairingViewController *)v3 start];
}

- (BOOL)_largeAXMode
{
  id v2 = +[UIApplication sharedApplication];
  objc_super v3 = [(UIApplication *)v2 preferredContentSizeCategory];
  BOOL v4 = UIContentSizeCategoryCompareToCategory(UIContentSizeCategoryExtraLarge, v3) == NSOrderedAscending;

  return v4;
}

- (BOOL)showPairingStyleToggle
{
  SEL v15 = self;
  SEL v14 = a2;
  id v2 = [(BuddyProximityBackingViewController *)self stringProvider];
  char v12 = 0;
  char v3 = 1;
  if (objc_opt_respondsToSelector())
  {
    id v13 = [(BuddyProximityBackingViewController *)v15 stringProvider];
    char v12 = 1;
    char v3 = objc_opt_respondsToSelector() ^ 1;
  }
  if (v12) {

  }
  if (v3)
  {
    return 0;
  }
  else
  {
    id v11 = [(BuddyProximityBackingViewController *)v15 language];
    BOOL v4 = [(BuddyProximityBackingViewController *)v15 stringProvider];
    id location = [(BuddyProximityBackingStringProviding *)v4 visualPairingButtonTitleWithLanguage:v11];

    SEL v5 = [(BuddyProximityBackingViewController *)v15 stringProvider];
    id v9 = [(BuddyProximityBackingStringProviding *)v5 textualPairingButtonTitleWithLanguage:v11];

    id v6 = [location length];
    BOOL v7 = 0;
    if (v6) {
      BOOL v7 = [v9 length] != 0;
    }
    BOOL v16 = v7;
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v11, 0);
  }
  return v16;
}

- (void)pairingStyleToggleTapped:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(BuddyProximityBackingViewController *)v4 isShowingVisualPairing]) {
    [(BuddyProximityBackingViewController *)v4 showPairingCode];
  }
  else {
    [(BuddyProximityBackingViewController *)v4 showVisualPairing];
  }
  objc_storeStrong(location, 0);
}

- (NSString)pairingCode
{
  return self->_pairingCode;
}

- (void)setPairingCode:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (BOOL)nonUserInitiatedDismissal
{
  return self->_nonUserInitiatedDismissal;
}

- (void)setNonUserInitiatedDismissal:(BOOL)a3
{
  self->_nonUserInitiatedDismissal = a3;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isShowingVisualPairing
{
  return self->_showingVisualPairing;
}

- (void)setShowingVisualPairing:(BOOL)a3
{
  self->_showingVisualPairing = a3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (BFFProximityVisualPairingViewController)visualPairingViewController
{
  return self->_visualPairingViewController;
}

- (void)setVisualPairingViewController:(id)a3
{
}

- (UILabel)pinCodeLabel
{
  return self->_pinCodeLabel;
}

- (void)setPinCodeLabel:(id)a3
{
}

- (OBLinkTrayButton)pairingStyleToggleButton
{
  return self->_pairingStyleToggleButton;
}

- (void)setPairingStyleToggleButton:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (BuddyProximityBackingStringProviding)stringProvider
{
  return self->_stringProvider;
}

- (BrightnessSystemClient)brightnessClient
{
  return self->_brightnessClient;
}

- (void).cxx_destruct
{
}

@end