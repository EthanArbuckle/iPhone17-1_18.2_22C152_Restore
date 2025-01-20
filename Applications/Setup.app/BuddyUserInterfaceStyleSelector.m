@interface BuddyUserInterfaceStyleSelector
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)clearUserInterfaceStyleMode:(id)a3;
+ (void)setUserInterfaceStyleModeValue:(int64_t)a3 presented:(BOOL)a4 buddyPreferences:(id)a5;
- (BFFSettingsManager)settingsManager;
- (BOOL)controllerNeedsToRun;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPreferencesController)buddyPreferences;
- (BuddyUserInterfaceStyleSelector)init;
- (NSLayoutConstraint)leftLabelVerticalConstraint;
- (NSLayoutConstraint)rightLabelVerticalConstraint;
- (NSMutableArray)timeLabelCenterYConstraints;
- (NSMutableArray)timeLabelWidthConstraints;
- (UISUserInterfaceStyleMode)styleMode;
- (_SelectionContentDisplayModel)_contentDisplayModel;
- (id)_darkImageNameForImageName:(id)a3;
- (void)_continuePressed;
- (void)_decorateComposedItemView:(id)a3 displayModel:(_SelectionContentDisplayModel)a4;
- (void)didSelectSegment:(int64_t)a3;
- (void)loadView;
- (void)setBuddyPreferences:(id)a3;
- (void)setLeftLabelVerticalConstraint:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setRightLabelVerticalConstraint:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)setStyleMode:(id)a3;
- (void)setTimeLabelCenterYConstraints:(id)a3;
- (void)setTimeLabelWidthConstraints:(id)a3;
- (void)userInterfaceStyleModeDidChange:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyUserInterfaceStyleSelector

- (BuddyUserInterfaceStyleSelector)init
{
  SEL v14 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"APPEARANCE_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  v5 = +[NSBundle mainBundle];
  id v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"APPEARANCE_DETAIL"];
  v7 = [(NSBundle *)v5 localizedStringForKey:v6 value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v13.receiver = self;
  v13.super_class = (Class)BuddyUserInterfaceStyleSelector;
  id location = [(BuddyUserInterfaceStyleSelector *)&v13 initWithTitle:v4 detailText:v7 symbolName:0];
  objc_storeStrong(&location, location);

  if (location)
  {
    id v8 = objc_alloc((Class)UISUserInterfaceStyleMode);
    id v9 = [v8 initWithDelegate:location];
    v10 = (void *)*((void *)location + 8);
    *((void *)location + 8) = v9;
  }
  v11 = (BuddyUserInterfaceStyleSelector *)location;
  objc_storeStrong(&location, 0);
  return v11;
}

- (void)loadView
{
  v51 = self;
  SEL v50 = a2;
  v49.receiver = self;
  v49.super_class = (Class)BuddyUserInterfaceStyleSelector;
  [(BuddyUserInterfaceStyleSelector *)&v49 loadView];
  id v2 = +[NSMutableArray array];
  [(BuddyUserInterfaceStyleSelector *)v51 setTimeLabelWidthConstraints:v2];

  id v3 = +[NSMutableArray array];
  [(BuddyUserInterfaceStyleSelector *)v51 setTimeLabelCenterYConstraints:v3];

  [(BuddyUserInterfaceStyleSelector *)v51 _contentDisplayModel];
  double v47 = v4;
  double v48 = v5;
  +[BuddyPosedDeviceSelectionView posedDevicesPadding];
  double v46 = v6;
  id v7 = [(BuddyUserInterfaceStyleSelector *)v51 view];
  [v7 directionalLayoutMargins];
  *(void *)&long long v44 = v8;
  *((void *)&v44 + 1) = v9;
  *(void *)&long long v45 = v10;
  *((void *)&v45 + 1) = v11;

  v12 = +[NSBundle mainBundle];
  objc_super v13 = [(NSBundle *)v12 localizedStringForKey:@"APPEARANCE_CHOICE_LIGHT" value:&stru_1002B4E18 table:@"Localizable"];
  id v43 = +[BuddyPosedDeviceSelectionView selectionItemWithImageName:@"Appearance", @"checkmark.circle.fill", 0, v13, v44, v45, v46 symbolName segment text hostViewLayoutMargins posedDevicesPadding];

  SEL v14 = +[NSBundle mainBundle];
  v15 = [(NSBundle *)v14 localizedStringForKey:@"APPEARANCE_CHOICE_DARK" value:&stru_1002B4E18 table:@"Localizable"];
  id v42 = +[BuddyPosedDeviceSelectionView selectionItemWithImageName:@"Appearance-Dark", @"checkmark.circle.fill", 1, v15, v44, v45, v46 symbolName segment text hostViewLayoutMargins posedDevicesPadding];

  v16 = +[NSBundle mainBundle];
  v17 = [(NSBundle *)v16 localizedStringForKey:@"APPEARANCE_CHOICE_AUTO" value:&stru_1002B4E18 table:@"Localizable"];
  id v41 = +[BuddyPosedDeviceSelectionView selectionItemWithImageName:@"Appearance-Auto", @"checkmark.circle.fill", 2, v17, v44, v45, v46 symbolName segment text hostViewLayoutMargins posedDevicesPadding];

  v18 = [[BuddyPosedDeviceSelectionView alloc] initWithLeftView:v43 centerView:v42 rightView:v41];
  [(BuddyPosedDeviceSelectionController *)v51 setSelectionView:v18];

  objc_initWeak(&location, v51);
  v34 = _NSConcreteStackBlock;
  int v35 = -1073741824;
  int v36 = 0;
  v37 = sub_1000F8F90;
  v38 = &unk_1002B2E80;
  objc_copyWeak(&v39, &location);
  [(BuddyPosedDeviceSelectionController *)v51 setSelectionViewHeightChangeBlock:&v34];
  v19 = v51;
  v20 = +[NSBundle mainBundle];
  v21 = [(NSBundle *)v20 localizedStringForKey:@"APPEARANCE_CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v19 addBoldButton:v21 action:"_continuePressed"];

  v22 = v51;
  v23 = [(BuddyPosedDeviceSelectionController *)v51 selectionView];
  v24 = [(BuddyPosedDeviceSelectionView *)v23 leftPosedView];
  v25 = [(BuddyPosedDeviceSelectionItemView *)v24 contentContainer];
  -[BuddyUserInterfaceStyleSelector _decorateComposedItemView:displayModel:](v22, "_decorateComposedItemView:displayModel:", v25, v47, v48);

  v26 = v51;
  v27 = [(BuddyPosedDeviceSelectionController *)v51 selectionView];
  v28 = [(BuddyPosedDeviceSelectionView *)v27 centerPosedView];
  v29 = [(BuddyPosedDeviceSelectionItemView *)v28 contentContainer];
  -[BuddyUserInterfaceStyleSelector _decorateComposedItemView:displayModel:](v26, "_decorateComposedItemView:displayModel:", v29, v47, v48);

  v30 = v51;
  v31 = [(BuddyPosedDeviceSelectionController *)v51 selectionView];
  v32 = [(BuddyPosedDeviceSelectionView *)v31 rightPosedView];
  v33 = [(BuddyPosedDeviceSelectionItemView *)v32 contentContainer];
  -[BuddyUserInterfaceStyleSelector _decorateComposedItemView:displayModel:](v30, "_decorateComposedItemView:displayModel:", v33, v47, v48);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BuddyUserInterfaceStyleSelector;
  [(BuddyPosedDeviceSelectionController *)&v9 viewWillAppear:a3];
  id location = [objc_alloc((Class)UISUserInterfaceStyleMode) initWithDelegate:0];
  id v3 = [location modeValue];
  if (v3 == (id)1)
  {
    uint64_t v7 = 0;
  }
  else if (v3 == (id)2)
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 2;
  }
  double v4 = [(BuddyPosedDeviceSelectionController *)v12 selectionView];
  [(BuddyPosedDeviceSelectionView *)v4 selectSegment:v7];

  double v5 = [(BuddyUserInterfaceStyleSelector *)v12 buddyPreferences];
  [(BYPreferencesController *)v5 setObject:&__kCFBooleanFalse forKey:@"UserInterfaceStyleModePresented"];

  double v6 = [(BuddyUserInterfaceStyleSelector *)v12 paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v6 clearActionForFeature:9];

  objc_storeStrong(&location, 0);
}

+ (void)setUserInterfaceStyleModeValue:(int64_t)a3 presented:(BOOL)a4 buddyPreferences:(id)a5
{
  id v13 = a1;
  SEL v12 = a2;
  int64_t v11 = a3;
  BOOL v10 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  id v5 = [objc_alloc((Class)UISUserInterfaceStyleMode) initWithDelegate:0];
  [v5 setModeValue:v11];
  id v6 = location;
  uint64_t v7 = +[NSNumber numberWithBool:v10];
  [v6 setObject:v7 forKey:@"UserInterfaceStyleModePresented"];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
}

+ (void)clearUserInterfaceStyleMode:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(id)objc_opt_class() setUserInterfaceStyleModeValue:1 presented:0 buddyPreferences:location[0]];
  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRun
{
  id v2 = [(BuddyUserInterfaceStyleSelector *)self buddyPreferences];
  char v3 = [(BYPreferencesController *)v2 BOOLForKey:@"UserInterfaceStyleModePresented"] ^ 1;

  return v3 & 1;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupAppearance;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (void)_decorateComposedItemView:(id)a3 displayModel:(_SelectionContentDisplayModel)a4
{
  _SelectionContentDisplayModel v30 = a4;
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v27 setNumberOfLines:1];
  double v4 = +[UIFont systemFontOfSize:60.5 weight:UIFontWeightMedium];
  [v27 setFont:v4];

  [v27 setAdjustsFontSizeToFitWidth:1];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = +[NSBundle mainBundle];
  id v6 = [(NSBundle *)v5 localizedStringForKey:@"APPEARANCE_CHOICE_POSED_TIME" value:&stru_1002B4E18 table:@"Localizable"];
  [v27 setText:v6];

  [v27 setBaselineAdjustment:1];
  [v27 setTextAlignment:1];
  id v7 = +[UIColor systemWhiteColor];
  [v27 setTextColor:v7];

  [location[0] addSubview:v27];
  id v8 = [v27 widthAnchor];
  double var1 = v30.var1;
  [location[0] bounds];
  v25[2] = v10;
  v25[1] = v11;
  v25[4] = v12;
  v25[3] = v13;
  id v26 = [v8 constraintEqualToConstant:var1 * *(double *)&v12];

  [v26 setActive:1];
  id v14 = [v27 centerXAnchor];
  id v15 = [location[0] centerXAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15 constant:2.0];
  [v16 setActive:1];

  id v17 = [v27 centerYAnchor];
  id v18 = [location[0] centerYAnchor];
  [location[0] bounds];
  v25[0] = [v17 constraintEqualToAnchor:v18 constant:-(v19 * v30.var0) v20, v21, v22, *(void *)&v19];

  [v25[0] setActive:1];
  v23 = [(BuddyUserInterfaceStyleSelector *)v29 timeLabelCenterYConstraints];
  [(NSMutableArray *)v23 addObject:v25[0]];

  v24 = [(BuddyUserInterfaceStyleSelector *)v29 timeLabelWidthConstraints];
  [(NSMutableArray *)v24 addObject:v26];

  objc_storeStrong(v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (_SelectionContentDisplayModel)_contentDisplayModel
{
  id v14 = self;
  SEL v13 = a2;
  double v12 = 0.256222486;
  uint64_t v11 = 0x3FC99999A0000000;
  id location = +[BYDevice currentDevice];
  if ([location type] == (id)1)
  {
    if ([location hasHomeButton])
    {
      double v12 = 0.239999995;
      uint64_t v11 = 0x3FCB851EC0000000;
    }
    else
    {
      double v12 = 0.256229997;
      uint64_t v11 = 0x3FC99999A0000000;
    }
  }
  else
  {
    switch((unint64_t)[location size])
    {
      case 0uLL:
      case 4uLL:
        if ([location mainScreenClass] == 22
          || [location mainScreenClass] == 24
          || [location mainScreenClass] == 25)
        {
          double v12 = 0.263000011;
          uint64_t v11 = 0x3FCCCCCCC0000000;
        }
        else
        {
          double v12 = 0.230000004;
          uint64_t v11 = 0x3FD051EB80000000;
        }
        break;
      case 1uLL:
      case 2uLL:
        double v12 = 0.239999995;
        uint64_t v11 = 0x3FD051EB80000000;
        break;
      case 3uLL:
        double v12 = 0.263000011;
        uint64_t v11 = 0x3FCCCCCCC0000000;
        break;
      case 5uLL:
        double v12 = 0.272000015;
        uint64_t v11 = 0x3FCCCCCCC0000000;
        break;
      case 6uLL:
        id v2 = +[UIScreen mainScreen];
        [(UIScreen *)v2 bounds];
        char v8 = 0;
        BOOL v4 = 0;
        if (v3 >= 414.0)
        {
          objc_super v9 = +[UIScreen mainScreen];
          char v8 = 1;
          [(UIScreen *)v9 bounds];
          BOOL v4 = v5 >= 896.0;
        }
        if (v8) {

        }
        if (v4) {
          double v12 = 0.272000015;
        }
        else {
          double v12 = 0.263000011;
        }
        uint64_t v11 = 0x3FCCCCCCC0000000;
        break;
      default:
        break;
    }
  }
  double v15 = v12 * 1.2;
  double v16 = *(double *)&v11;
  objc_storeStrong(&location, 0);
  double v6 = v15;
  double v7 = v16;
  result.double var1 = v7;
  result.var0 = v6;
  return result;
}

- (id)_darkImageNameForImageName:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] stringByAppendingString:@"_dark"];
  objc_storeStrong(location, 0);

  return v3;
}

- (void)_continuePressed
{
  id v2 = [(BuddyUserInterfaceStyleSelector *)self settingsManager];
  id v3 = [(BuddyUserInterfaceStyleSelector *)self styleMode];
  [(BFFSettingsManager *)v2 setUserInterfaceStyleMode:[(UISUserInterfaceStyleMode *)v3 modeValue]];

  BOOL v4 = [(BuddyUserInterfaceStyleSelector *)self buddyPreferences];
  [(BYPreferencesController *)v4 setObject:&__kCFBooleanTrue forKey:@"UserInterfaceStyleModePresented"];

  double v5 = [(BuddyUserInterfaceStyleSelector *)self paneFeatureAnalyticsManager];
  double v6 = [(BuddyUserInterfaceStyleSelector *)self styleMode];
  double v7 = +[NSNumber numberWithInteger:[(UISUserInterfaceStyleMode *)v6 modeValue]];
  [(BYPaneFeatureAnalyticsManager *)v5 recordActionWithValue:v7 forFeature:9];

  char v8 = [(BuddyWelcomeController *)self delegate];
  [(BFFFlowItemDelegate *)v8 flowItemDone:self nextItemClass:0];
}

- (void)userInterfaceStyleModeDidChange:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v10 = 0;
  char v8 = 0;
  if ([location[0] modeValue] == (id)2)
  {
    id v3 = +[UIColor blackColor];
    id v11 = v3;
    char v10 = 1;
  }
  else
  {
    id v3 = +[UIColor whiteColor];
    id v9 = v3;
    char v8 = 1;
  }
  id v12 = v3;
  if (v8) {

  }
  if (v10) {
  id v4 = [v12 colorWithAlphaComponent:0.96];
  }
  id v7 = (id)BFFPointImageOfColor();

  id v5 = [(BuddyUserInterfaceStyleSelector *)v14 navigationController];
  id v6 = [v5 navigationBar];
  [v6 setBackgroundImage:v7 forBarMetrics:0];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)didSelectSegment:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = [(BuddyUserInterfaceStyleSelector *)self styleMode];
      [(UISUserInterfaceStyleMode *)v4 setModeValue:2];
    }
    else if (a3 == 2)
    {
      id v5 = [(BuddyUserInterfaceStyleSelector *)self styleMode];
      [(UISUserInterfaceStyleMode *)v5 setModeValue:100];
    }
  }
  else
  {
    id v3 = [(BuddyUserInterfaceStyleSelector *)self styleMode];
    [(UISUserInterfaceStyleMode *)v3 setModeValue:1];
  }
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (UISUserInterfaceStyleMode)styleMode
{
  return self->_styleMode;
}

- (void)setStyleMode:(id)a3
{
}

- (NSLayoutConstraint)leftLabelVerticalConstraint
{
  return self->_leftLabelVerticalConstraint;
}

- (void)setLeftLabelVerticalConstraint:(id)a3
{
}

- (NSLayoutConstraint)rightLabelVerticalConstraint
{
  return self->_rightLabelVerticalConstraint;
}

- (void)setRightLabelVerticalConstraint:(id)a3
{
}

- (NSMutableArray)timeLabelCenterYConstraints
{
  return self->_timeLabelCenterYConstraints;
}

- (void)setTimeLabelCenterYConstraints:(id)a3
{
}

- (NSMutableArray)timeLabelWidthConstraints
{
  return self->_timeLabelWidthConstraints;
}

- (void)setTimeLabelWidthConstraints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end