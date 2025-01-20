@interface PHContactsViewController
+ ($1FF454C5B48E436092D281DABF654916)badge;
+ (id)defaultPNGName;
+ (id)tabBarIconName;
+ (int)tabViewType;
+ (int64_t)tabBarSystemItem;
- (BOOL)checkedForFacebookContacts;
- (BOOL)contactNavigationController:(id)a3 canSelectContact:(id)a4;
- (BOOL)contactNavigationController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (BOOL)contactNavigationController:(id)a3 shouldShowCardForContact:(id)a4;
- (BOOL)shouldSaveAndRestoreState;
- (BOOL)shouldSnapshot;
- (BOOL)tabBarControllerShouldSelectViewController:(id)a3;
- (CNContact)savedPerson;
- (CNContactStore)contactStore;
- (CNKCNSharedProfileOnboardingController)onboardingController;
- (PHContactsControllerDelegate)contactsControllerDelegate;
- (PHContactsViewController)initWithContactStore:(id)a3;
- (PHContactsViewController)initWithDataSource:(id)a3;
- (PHContactsViewController)initWithDataSource:(id)a3 allowsLargeTitles:(BOOL)a4;
- (id)tipKitContext;
- (void)_restoreState;
- (void)contactNavigationControllerDidCancel:(id)a3;
- (void)handleURL:(id)a3;
- (void)savedPerson;
- (void)setCheckedForFacebookContacts:(BOOL)a3;
- (void)setContactsControllerDelegate:(id)a3;
- (void)setOnboardingController:(id)a3;
- (void)setSavedPerson:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PHContactsViewController

+ ($1FF454C5B48E436092D281DABF654916)badge
{
  BOOL v2 = 1;
  unint64_t v3 = 0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

+ (int64_t)tabBarSystemItem
{
  return 5;
}

+ (id)tabBarIconName
{
  BOOL v2 = +[NSBundle mainBundle];
  unint64_t v3 = [v2 localizedStringForKey:@"CONTACTS_TITLE" value:&stru_100285990 table:@"General"];

  return v3;
}

- (PHContactsViewController)initWithContactStore:(id)a3
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)CNContactStoreDataSource) initWithStore:v5];
  v7 = [(PHContactsViewController *)self initWithDataSource:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_contactStore, a3);
  }

  return v7;
}

- (PHContactsViewController)initWithDataSource:(id)a3 allowsLargeTitles:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PHContactsViewController;
  v4 = [(PHContactsViewController *)&v7 initWithDataSource:a3 allowsLargeTitles:a4];
  id v5 = v4;
  if (v4)
  {
    [(PHContactsViewController *)v4 setAllowsCardDeletion:1];
    [(PHContactsViewController *)v5 setAllowsCardEditing:1];
    [(PHContactsViewController *)v5 setAllowsContactBlocking:1];
    [(PHContactsViewController *)v5 setDelegate:v5];
    +[PhoneViewController initializeIconAndTitle:v5];
  }
  return v5;
}

- (PHContactsViewController)initWithDataSource:(id)a3
{
  return [(PHContactsViewController *)self initWithDataSource:a3 allowsLargeTitles:1];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PHContactsViewController;
  [(PHContactsViewController *)&v6 viewDidLoad];
  [(PHContactsViewController *)self setDefinesPresentationContext:0];
  unint64_t v3 = [(PHContactsViewController *)self contactListViewController];
  [v3 setShouldDisplayMeContactBanner:1];

  [(PHContactsViewController *)self _restoreState];
  v4 = objc_opt_new();
  id v5 = [(PHContactsViewController *)self tabBarItem];
  [v5 setStandardAppearance:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PHContactsViewController;
  [(PHContactsViewController *)&v13 viewWillAppear:a3];
  id v4 = objc_alloc_init((Class)TUFeatureFlags);
  unsigned int v5 = [v4 nameAndPhotoEnabledC3];

  if (v5)
  {
    objc_super v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Going to present CNKCNSharedProfileOnboardingController on launch", v12, 2u);
    }

    objc_super v7 = [(PHContactsViewController *)self onboardingController];

    if (!v7)
    {
      v8 = objc_opt_new();
      [(PHContactsViewController *)self setOnboardingController:v8];
    }
    v9 = [(PHContactsViewController *)self onboardingController];
    v10 = +[TUCallCenter sharedInstance];
    v11 = [v10 contactStore];
    [v9 presentOnboardingControllerOnLaunchIfNeededFrom:self withContactStore:v11];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PHContactsViewController;
  [(PHContactsViewController *)&v9 viewDidAppear:a3];
  id v4 = +[MPSignpost sharedInstance];
  [v4 contactsTabViewAppeared];

  if (![(PHContactsViewController *)self checkedForFacebookContacts])
  {
    [(PHContactsViewController *)self setCheckedForFacebookContacts:1];
    [(PHContactsViewController *)self checkForFacebookContactsWithDelay:1 allowAlert:0.5];
  }
  unsigned int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHContactsViewController viewDidAppear:", v8, 2u);
  }

  objc_super v6 = createPHPhoneTabBarControllerTabViewDidAppearNotificationInfo(3, self);
  objc_super v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"PHPhoneTabBarControllerTabViewDidAppearNotification" object:v6];
}

+ (int)tabViewType
{
  return 3;
}

- (BOOL)tabBarControllerShouldSelectViewController:(id)a3
{
  id v4 = [a3 selectedViewController];

  if (v4 == self) {
    [(PHContactsViewController *)self showAllContactsList];
  }
  return v4 != self;
}

- (BOOL)shouldSnapshot
{
  BOOL v2 = [(PHContactsViewController *)self contactListViewController];
  char v3 = [v2 isSearching] ^ 1;

  return v3;
}

+ (id)defaultPNGName
{
  return @"Default";
}

- (void)contactNavigationControllerDidCancel:(id)a3
{
  id v4 = [(PHContactsViewController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  uint64_t v5 = [(PHContactsViewController *)self contactsControllerDelegate];
  if (v5)
  {
    objc_super v6 = (void *)v5;
    objc_super v7 = [(PHContactsViewController *)self contactsControllerDelegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(PHContactsViewController *)self contactsControllerDelegate];
      [v9 contactsControllerDidCancel:self];
    }
  }
}

- (BOOL)contactNavigationController:(id)a3 shouldShowCardForContact:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(PHContactsViewController *)self contactsControllerDelegate];
  if (v6
    && (objc_super v7 = (void *)v6,
        [(PHContactsViewController *)self contactsControllerDelegate],
        char v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    v10 = [(PHContactsViewController *)self contactsControllerDelegate];
    unsigned int v11 = [v10 contactsControllerShouldContinueAfterSelectingContact:v5];
  }
  else
  {
    unsigned int v11 = 1;
  }
  if ([(PHContactsViewController *)self shouldSaveAndRestoreState] && v11) {
    [(PHContactsViewController *)self setSavedPerson:v5];
  }

  return v11;
}

- (BOOL)contactNavigationController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  return 1;
}

- (BOOL)contactNavigationController:(id)a3 canSelectContact:(id)a4
{
  return 1;
}

- (BOOL)shouldSaveAndRestoreState
{
  BOOL v2 = PHPreferencesGetValueInDomain(@"ContactsController.SaveAndLoadState", TUBundleIdentifierMobilePhoneApplication);
  char v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (CNContact)savedPerson
{
  char v3 = PHPreferencesGetValueInDomain(@"ContactsController.SavedABUID", TUBundleIdentifierMobilePhoneApplication);
  if (v3)
  {
    unsigned __int8 v4 = [(PHContactsViewController *)self contactStore];
    id v5 = +[CNContactViewController descriptorForRequiredKeys];
    objc_super v13 = v5;
    uint64_t v6 = +[NSArray arrayWithObjects:&v13 count:1];
    id v12 = 0;
    objc_super v7 = [v4 unifiedContactWithIdentifier:v3 keysToFetch:v6 error:&v12];
    id v8 = v12;

    if (v7) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v8 == 0;
    }
    if (!v9)
    {
      v10 = PHDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(PHContactsViewController *)(uint64_t)v8 savedPerson];
      }
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return (CNContact *)v7;
}

- (void)setSavedPerson:(id)a3
{
  id v3 = [a3 identifier];
  PHPreferencesSetValueInDomain(@"ContactsController.SavedABUID", v3, TUBundleIdentifierMobilePhoneApplication);
}

- (void)_restoreState
{
  if ([(PHContactsViewController *)self shouldSaveAndRestoreState])
  {
    id v3 = [(PHContactsViewController *)self savedPerson];

    if (v3)
    {
      id v4 = [(PHContactsViewController *)self savedPerson];
      [(PHContactsViewController *)self showCardForContact:v4 animated:0];
    }
  }
}

- (void)handleURL:(id)a3
{
  id v3 = a3;
  id v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to open URL %@", buf, 0xCu);
  }

  id v5 = v3;
  TUGuaranteeExecutionOnMainThreadSync();
}

void __38__PHContactsViewController_handleURL___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) searchResultIdentifier];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 unsignedIntValue];
    if (v4 != -1)
    {
      id v5 = v4;
      uint64_t v6 = [*(id *)(a1 + 40) dataSource];
      id v7 = [v6 store];
      id v8 = +[CNContact predicateForLegacyIdentifier:v5];
      BOOL v9 = +[CNContactViewController descriptorForRequiredKeys];
      v18 = v9;
      v10 = +[NSArray arrayWithObjects:&v18 count:1];
      id v15 = 0;
      unsigned int v11 = [v7 unifiedContactsMatchingPredicate:v8 keysToFetch:v10 error:&v15];
      id v12 = v15;

      if ([v11 count])
      {
        objc_super v13 = [v11 firstObject];
        v14 = PHDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Presenting contact card for contact %@", buf, 0xCu);
        }

        [*(id *)(a1 + 40) showCardForContact:v13 animated:0];
      }
      else
      {
        if (v11 || !v12 || [v12 code] == (id)200) {
          goto LABEL_8;
        }
        objc_super v13 = PHDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __38__PHContactsViewController_handleURL___block_invoke_cold_1((uint64_t)v12, v13);
        }
      }

LABEL_8:
    }
  }
}

- (id)tipKitContext
{
  return TUTipsPhoneContactsTabContext;
}

- (PHContactsControllerDelegate)contactsControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsControllerDelegate);

  return (PHContactsControllerDelegate *)WeakRetained;
}

- (void)setContactsControllerDelegate:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (BOOL)checkedForFacebookContacts
{
  return self->_checkedForFacebookContacts;
}

- (void)setCheckedForFacebookContacts:(BOOL)a3
{
  self->_checkedForFacebookContacts = a3;
}

- (CNKCNSharedProfileOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (void)setOnboardingController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_destroyWeak((id *)&self->_contactsControllerDelegate);
}

- (void)savedPerson
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to fetch contact with identifier from saved store: %@", (uint8_t *)&v2, 0xCu);
}

void __38__PHContactsViewController_handleURL___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Contact fetch failed with the following error %@", (uint8_t *)&v2, 0xCu);
}

@end