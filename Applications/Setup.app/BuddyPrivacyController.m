@interface BuddyPrivacyController
+ (BOOL)hiddenFromMultiUser;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)initialize;
- (BFFFlowItemDelegate)delegate;
- (BOOL)controllerNeedsToRun;
- (BYPreferencesController)buddyPreferences;
- (ProximitySetupController)proximitySetupController;
- (id)viewController;
- (void)_writeOutCurrentPrivacyVersion;
- (void)controllerDone;
- (void)learnMorePressed:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)viewDidAppear;
@end

@implementation BuddyPrivacyController

+ (void)initialize
{
  id v2 = +[OBCapabilities sharedCapabilities];
  [v2 setPreventURLDataDetection:1];

  id v3 = +[OBCapabilities sharedCapabilities];
  [v3 setPreventOpeningSafari:1];
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupPrivacy;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  id v2 = [(BuddyPrivacyController *)self buddyPreferences];
  char v3 = [(BYPreferencesController *)v2 BOOLForKey:@"PrivacyPresented"] ^ 1;

  return v3 & 1;
}

- (id)viewController
{
  v21 = self;
  location[1] = (id)a2;
  if (!self->_viewController)
  {
    id v2 = [BuddyPrivacySplashController alloc];
    char v3 = [(BuddyPrivacySplashController *)v2 initWithPrivacyIdentifier:BYPrivacyPrivacyPaneIdentifier];
    viewController = v21->_viewController;
    v21->_viewController = (OBPrivacySplashController *)v3;

    objc_initWeak(location, v21);
    v5 = v21->_viewController;
    v14 = _NSConcreteStackBlock;
    int v15 = -1073741824;
    int v16 = 0;
    v17 = sub_10008CFE4;
    v18 = &unk_1002B0CA8;
    objc_copyWeak(&v19, location);
    [(OBPrivacySplashController *)v5 setDismissHandlerForDefaultButton:&v14];
    id v6 = [(OBPrivacySplashController *)v21->_viewController headerView];
    LODWORD(v7) = 1045220557;
    [v6 setTitleHyphenationFactor:v7];

    id v13 = +[OBLinkTrayButton linkButton];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = +[NSBundle mainBundle];
    v9 = [(NSBundle *)v8 localizedStringForKey:@"LEARN_MORE" value:&stru_1002B4E18 table:@"Localizable"];
    [v13 setTitle:v9 forState:0];

    [v13 addTarget:v21 action:"learnMorePressed:" forControlEvents:64];
    id v10 = [(OBPrivacySplashController *)v21->_viewController buttonTray];
    [v10 addButton:v13];

    objc_storeStrong(&v13, 0);
    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  v11 = v21->_viewController;

  return v11;
}

- (void)_writeOutCurrentPrivacyVersion
{
  id v2 = +[OBBundle bundleWithIdentifier:BYPrivacyPrivacyPaneIdentifier];
  id v3 = [(OBBundle *)v2 privacyFlow];
  id v4 = [v3 contentVersion];

  v5 = [(BuddyPrivacyController *)self buddyPreferences];
  [(BYPreferencesController *)v5 setObject:&__kCFBooleanTrue forKey:@"PrivacyPresented"];

  id v6 = [(BuddyPrivacyController *)self buddyPreferences];
  double v7 = +[NSNumber numberWithUnsignedInteger:v4];
  [(BYPreferencesController *)v6 setObject:v7 forKey:@"PrivacyContentVersion"];
}

- (void)controllerDone
{
  [(BuddyPrivacyController *)self _writeOutCurrentPrivacyVersion];
  id v2 = [(BuddyPrivacyController *)self delegate];
  [(BFFFlowItemDelegate *)v2 flowItemDone:self];
}

- (void)viewDidAppear
{
  [(BuddyPrivacyController *)self viewDidAppear];
  id v2 = [(BuddyPrivacyController *)self buddyPreferences];
  [(BYPreferencesController *)v2 setObject:&__kCFBooleanFalse forKey:@"PrivacyPresented"];
}

- (void)learnMorePressed:(id)a3
{
  double v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = +[OBPrivacyPresenter presenterForPrivacyUnifiedAbout];
  id v3 = [(BuddyPrivacyController *)v7 viewController];
  [v5 setPresentingViewController:v3];

  id v4 = [v5 combinedController];
  [v4 setPresentedFromPrivacyPane:1];

  [v5 present];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end