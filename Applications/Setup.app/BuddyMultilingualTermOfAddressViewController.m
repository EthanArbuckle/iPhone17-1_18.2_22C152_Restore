@interface BuddyMultilingualTermOfAddressViewController
+ (BOOL)controllerAffectedByTapFreeSetup;
+ (BOOL)controllerNeedsToRun;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BYAnalyticsManager)analyticsManager;
- (BuddyMultilingualTermOfAddressViewController)init;
- (NSArray)genderBackingStore;
- (OBAnimationController)animationController;
- (OBTrayButton)skipButton;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_selectionSkipped:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGenderBackingStore:(id)a3;
- (void)setSkipButton:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyMultilingualTermOfAddressViewController

- (BuddyMultilingualTermOfAddressViewController)init
{
  id v11 = self;
  v10[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  v10[0] = [(NSBundle *)v2 localizedStringForKey:@"MULTILINGUAL_TERM_OF_ADDRESS_TITLE" value:&stru_1002B4E18 table:@"Localizable"];

  v3 = +[NSBundle mainBundle];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MULTILINGUAL_TERM_OF_ADDRESS_DETAIL_TEXT"];
  id location = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];

  id v5 = v11;
  id v11 = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyMultilingualTermOfAddressViewController;
  id v11 = [(BuddyMultilingualTermOfAddressViewController *)&v8 initWithTitle:v10[0] detailText:location symbolName:0 adoptTableViewScrollView:1];
  v6 = (BuddyMultilingualTermOfAddressViewController *)v11;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

- (void)viewDidLoad
{
  v24 = self;
  SEL v23 = a2;
  v22.receiver = self;
  v22.super_class = (Class)BuddyMultilingualTermOfAddressViewController;
  [(BuddyMultilingualTermOfAddressViewController *)&v22 viewDidLoad];
  id v2 = +[_NSAttributedStringGrammarInflection presetInflections];
  [(BuddyMultilingualTermOfAddressViewController *)v24 setGenderBackingStore:v2];

  id v3 = [(BuddyMultilingualTermOfAddressViewController *)v24 buddy_animationController:@"Language"];
  [(BuddyMultilingualTermOfAddressViewController *)v24 setAnimationController:v3];

  id v4 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(BuddyMultilingualTermOfAddressViewController *)v24 setTableView:v4];

  id v5 = [(BuddyMultilingualTermOfAddressViewController *)v24 tableView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = v24;
  id v7 = [(BuddyMultilingualTermOfAddressViewController *)v24 tableView];
  [v7 setDelegate:v6];

  objc_super v8 = v24;
  id v9 = [(BuddyMultilingualTermOfAddressViewController *)v24 tableView];
  [v9 setDataSource:v8];

  id v10 = [(BuddyMultilingualTermOfAddressViewController *)v24 tableView];
  [v10 setRowHeight:UITableViewAutomaticDimension];

  id v11 = [(BuddyMultilingualTermOfAddressViewController *)v24 tableView];
  [v11 setEstimatedRowHeight:0.0];

  v12 = +[UIColor clearColor];
  id v13 = [(BuddyMultilingualTermOfAddressViewController *)v24 tableView];
  [v13 setBackgroundColor:v12];

  id v14 = +[OBLinkTrayButton linkButton];
  [(BuddyMultilingualTermOfAddressViewController *)v24 setSkipButton:v14];

  v15 = [(BuddyMultilingualTermOfAddressViewController *)v24 skipButton];
  [(OBTrayButton *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(BuddyMultilingualTermOfAddressViewController *)v24 skipButton];
  [(OBTrayButton *)v16 addTarget:v24 action:"_selectionSkipped:" forControlEvents:64];

  v17 = +[NSBundle mainBundle];
  id location = [(NSBundle *)v17 localizedStringForKey:@"SET_UP_LATER_IN_SETTINGS" value:&stru_1002B4E18 table:@"Localizable"];

  v18 = [(BuddyMultilingualTermOfAddressViewController *)v24 skipButton];
  [(OBTrayButton *)v18 setTitle:location forState:0];

  id v19 = [(BuddyMultilingualTermOfAddressViewController *)v24 buttonTray];
  v20 = [(BuddyMultilingualTermOfAddressViewController *)v24 skipButton];
  [v19 addButton:v20];

  objc_storeStrong(&location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMultilingualTermOfAddressViewController;
  [(BuddyMultilingualTermOfAddressViewController *)&v4 viewWillAppear:a3];
  id v3 = [(BuddyMultilingualTermOfAddressViewController *)v7 animationController];
  [(OBAnimationController *)v3 startAnimation];
}

- (void)_selectionSkipped:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc_init((Class)_NSAttributedStringGrammarInflection);
  [v3 _setAsGlobalUserInflection:v3];
  objc_super v4 = [(BuddyMultilingualTermOfAddressViewController *)v7 delegate];
  [(BFFFlowItemDelegate *)v4 flowItemDone:v7];

  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  [location[0] deselectRowAtIndexPath:v8 animated:1];
  id v5 = [(BuddyMultilingualTermOfAddressViewController *)v10 genderBackingStore];
  id v6 = -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", [v8 row]);
  [v6 _setAsGlobalUserInflection];

  id v7 = [(BuddyMultilingualTermOfAddressViewController *)v10 delegate];
  [(BFFFlowItemDelegate *)v7 flowItemDone:v10];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(BuddyMultilingualTermOfAddressViewController *)v9 genderBackingStore];
  NSUInteger v6 = [(NSArray *)v5 count];

  objc_storeStrong(location, 0);
  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = [location[0] dequeueReusableCellWithIdentifier:@"com.apple.setupassistant.ios.termofaddress"];
  id v5 = [(BuddyMultilingualTermOfAddressViewController *)v20 genderBackingStore];
  id v16 = -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", [v18 row]);

  if (!v17)
  {
    id v17 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"com.apple.setupassistant.ios.termofaddress"];
  }
  id v6 = [v16 localizedShortDescription];
  id v7 = [v17 textLabel];
  [v7 setText:v6];

  [v17 setAccessoryType:1];
  id v8 = +[UIColor secondarySystemBackgroundColor];
  [v17 setBackgroundColor:v8];

  id v15 = 0;
  switch((unint64_t)[v16 gender])
  {
    case 1uLL:
      objc_storeStrong(&v15, @"MULTILINGUAL_TERM_OF_ADDRESS_EXEMPLAR_PHRASE_MASCULINE");
      break;
    case 2uLL:
      objc_storeStrong(&v15, @"MULTILINGUAL_TERM_OF_ADDRESS_EXEMPLAR_PHRASE_FEMININE");
      break;
    case 3uLL:
      objc_storeStrong(&v15, @"MULTILINGUAL_TERM_OF_ADDRESS_EXEMPLAR_PHRASE_NEUTER");
      break;
    default:
      break;
  }
  id v9 = +[NSBundle mainBundle];
  id v10 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v15];
  id v11 = [(NSBundle *)v9 localizedStringForKey:v10 value:&stru_1002B4E18 table:@"Localizable"];
  id v12 = [v17 detailTextLabel];
  [v12 setText:v11];

  id v13 = v17;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v13;
}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 1;
}

+ (BOOL)controllerNeedsToRun
{
  unsigned __int8 v2 = +[_NSAttributedStringGrammarInflection canSelectUserInflection];
  char v3 = 0;
  if (v2) {
    char v3 = +[DMCMultiUserModeUtilities shouldSkipLanguageAndLocaleSetupForNewUsers] ^ 1;
  }
  return v3 & 1;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupTermsOfAddress;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (OBTrayButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
}

- (NSArray)genderBackingStore
{
  return self->_genderBackingStore;
}

- (void)setGenderBackingStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end