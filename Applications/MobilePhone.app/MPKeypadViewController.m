@interface MPKeypadViewController
- (BOOL)_anyContactsExist;
- (BOOL)defaultActionIsFaceTimeAudio;
- (BOOL)isHostedInRemoteViewController;
- (MPContactSearchManager)contactSearchManager;
- (MPKeypadViewController)initWithDialerType:(int)a3;
- (NSCache)IDSstatusCache;
- (TUFeatureFlags)featureFlags;
- (TUMetadataCache)metadataCache;
- (UIContextMenuInteraction)callContextMenuInteraction;
- (id)_IDSStatusCacheKeyForService:(id)a3 withDestination:(id)a4;
- (id)_metadataNameForDialerText;
- (id)_newContactWithPhoneNumber:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)createMenuForAddContactButton;
- (id)pseudoNameStringForDestinationID:(id)a3;
- (id)senderIdentityMenuForDialerView:(id)a3 selectedSenderIdentity:(id)a4;
- (int64_t)_IDSStatusForService:(id)a3 withDestination:(id)a4;
- (void)_addNewContact:(id)a3;
- (void)_clearIDSStatusCache;
- (void)_metadataCacheDidUpdate;
- (void)_updateIDSStatusIfNeededForService:(id)a3 withDestination:(id)a4;
- (void)_updateMetadataCacheIfPossible;
- (void)_updateName;
- (void)_updateNameAndRefreshResult:(BOOL)a3;
- (void)_updateNameFromMetadataCache;
- (void)contactCountButtonPressed:(id)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)contactViewWrapperDidCancel;
- (void)presentSearch;
- (void)providersChangedForProviderManager:(id)a3;
- (void)refreshLocalizedSenderIdentity;
- (void)searchButtonPressed:(id)a3;
- (void)searchFor:(id)a3 shouldRefreshResult:(BOOL)a4 completionHandler:(id)a5;
- (void)setCallContextMenuInteraction:(id)a3;
- (void)setContactSearchManager:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setIDSstatusCache:(id)a3;
- (void)setIsHostedInRemoteViewController:(BOOL)a3;
- (void)setMetadataCache:(id)a3;
- (void)updateIDSStatus;
- (void)updateLocalizedSenderIdentity:(id)a3;
- (void)updateTabBarAppearanceToTransparent:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MPKeypadViewController

- (MPKeypadViewController)initWithDialerType:(int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MPKeypadViewController;
  v3 = [(DialerController *)&v9 initWithDialerType:*(void *)&a3];
  if (v3)
  {
    v4 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v3->_featureFlags;
    v3->_featureFlags = v4;

    v6 = (NSCache *)objc_alloc_init((Class)NSCache);
    IDSstatusCache = v3->_IDSstatusCache;
    v3->_IDSstatusCache = v6;
  }
  return v3;
}

- (void)setMetadataCache:(id)a3
{
}

- (void)updateTabBarAppearanceToTransparent:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = (id)objc_opt_new();
  if (v3) {
    [v6 configureWithTransparentBackground];
  }
  v5 = [(MPKeypadViewController *)self tabBarItem];
  [v5 setStandardAppearance:v6];
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)MPKeypadViewController;
  [(DialerController *)&v33 viewDidLoad];
  id v3 = [objc_alloc((Class)UIContextMenuInteraction) initWithDelegate:self];
  [(MPKeypadViewController *)self setCallContextMenuInteraction:v3];

  v4 = [(DialerController *)self dialerView];
  v5 = [v4 callButton];
  id v6 = [(MPKeypadViewController *)self callContextMenuInteraction];
  [v5 addInteraction:v6];

  if (+[PHDevice isGeminiCapable])
  {
    v7 = [(DialerController *)self callProviderManager];
    [v7 addDelegate:self queue:0];
  }
  v8 = [(DialerController *)self dialerView];
  objc_super v9 = [v8 addContactButton];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v11 = [(DialerController *)self dialerView];
    v12 = [v11 addContactButton];

    objc_initWeak(&location, self);
    [v12 setContextMenuIsPrimary:1];
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    v29 = __37__MPKeypadViewController_viewDidLoad__block_invoke;
    v30 = &unk_10027D290;
    objc_copyWeak(&v31, &location);
    [v12 _setMenuProvider:&v27];
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  v13 = [(MPKeypadViewController *)self featureFlags];
  unsigned int v14 = [v13 smartDialerEnabled];

  if (v14)
  {
    v15 = [(MPKeypadViewController *)self featureFlags];
    unsigned int v16 = [v15 smartDialerExpandedSearchEnabled];

    if (v16)
    {
      v17 = [(DialerController *)self dialerView];
      v18 = [v17 searchButton];
      objc_opt_class();
      char v19 = objc_opt_isKindOfClass();

      if (v19)
      {
        v20 = [(DialerController *)self dialerView];
        v21 = [v20 searchButton];
        [v21 addTarget:self action:"searchButtonPressed:" forControlEvents:64];
      }
    }
    v22 = [(DialerController *)self dialerView];
    v23 = [v22 contactCountButton];
    objc_opt_class();
    char v24 = objc_opt_isKindOfClass();

    if (v24)
    {
      v25 = [(DialerController *)self dialerView];
      v26 = [v25 contactCountButton];
      [v26 addTarget:self action:"contactCountButtonPressed:" forControlEvents:64];
    }
  }
  [(MPKeypadViewController *)self updateTabBarAppearanceToTransparent:1];
}

id __37__MPKeypadViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    v4 = [v3 createMenuForAddContactButton];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MPKeypadViewController viewDidAppear:", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)MPKeypadViewController;
  [(MPKeypadViewController *)&v8 viewDidAppear:v3];
  id v6 = createPHPhoneTabBarControllerTabViewDidAppearNotificationInfo(4, self);
  v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"PHPhoneTabBarControllerTabViewDidAppearNotification" object:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MPKeypadViewController;
  [(DialerController *)&v9 viewWillAppear:a3];
  [(MPKeypadViewController *)self refreshLocalizedSenderIdentity];
  BOOL v4 = [(MPKeypadViewController *)self isHostedInRemoteViewController];
  v5 = [(DialerController *)self dialerView];
  [v5 setIsHostedInRemoteViewController:v4];

  id v6 = [(MPKeypadViewController *)self featureFlags];
  LODWORD(v5) = [v6 smartDialerEnabled];

  if (v5)
  {
    v7 = [(DialerController *)self dialerView];
    objc_super v8 = [v7 lcdView];
    [v8 becomeFirstResponder];

    [(MPKeypadViewController *)self setDefinesPresentationContext:1];
  }
}

- (MPContactSearchManager)contactSearchManager
{
  BOOL v3 = [(MPKeypadViewController *)self featureFlags];
  unsigned int v4 = [v3 smartDialerEnabled];

  if (v4)
  {
    contactSearchManager = self->_contactSearchManager;
    if (!contactSearchManager)
    {
      id v6 = [MPContactSearchManager alloc];
      v7 = [(DialerController *)self contactStore];
      objc_super v8 = [(MPContactSearchManager *)v6 initWithType:1 contactStore:v7];
      objc_super v9 = self->_contactSearchManager;
      self->_contactSearchManager = v8;

      contactSearchManager = self->_contactSearchManager;
    }
    v10 = contactSearchManager;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_anyContactsExist
{
  id v3 = [objc_alloc((Class)CNContactFetchRequest) initWithKeysToFetch:&__NSArray0__struct];
  unsigned int v4 = [(DialerController *)self contactStore];
  uint64_t v7 = 0;
  v5 = [v4 contactCountForFetchRequest:v3 error:&v7];

  LOBYTE(v4) = (uint64_t)[v5 integerValue] > 0;
  return (char)v4;
}

- (id)createMenuForAddContactButton
{
  if (self->super._lookupTimer) {
    [(MPKeypadViewController *)self _updateName];
  }
  id v3 = [(PHAbstractDialerView *)self->super._dialerView lcdView];
  unsigned int v4 = [v3 text];

  v5 = [(DialerController *)self contactResultForPhoneNumber:v4];
  id v6 = [v5 contacts];
  if ([v6 count])
  {

    goto LABEL_5;
  }
  id v16 = [v4 length];

  if (!v16)
  {
LABEL_5:
    id v7 = [v5 contacts];
    uint64_t v8 = [v7 firstObject];
    if (v8)
    {
      objc_super v9 = (void *)v8;
      v10 = [v5 contacts];
      v11 = [v10 firstObject];
      unsigned int v12 = [v11 isSuggested];

      if (!v12)
      {
LABEL_17:
        id v31 = 0;
        goto LABEL_18;
      }
      v13 = [v5 contacts];
      unsigned int v14 = [v13 firstObject];
      id v7 = +[CNContactViewController viewControllerForUnknownContact:v14];

      [v7 setDelegate:self];
      id v15 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
      [(MPKeypadViewController *)self presentViewController:v15 animated:1 completion:0];
    }
LABEL_16:

    goto LABEL_17;
  }
  if (![(MPKeypadViewController *)self _anyContactsExist])
  {
    id v7 = [(MPKeypadViewController *)self _newContactWithPhoneNumber:v4];
    [(MPKeypadViewController *)self _addNewContact:v7];
    goto LABEL_16;
  }
  v17 = [(MPKeypadViewController *)self featureFlags];
  unsigned int v18 = [v17 smartDialerEnabled];
  char v19 = @"person.crop.circle";
  if (v18) {
    char v19 = @"plus";
  }
  v20 = v19;

  v21 = [(MPKeypadViewController *)self featureFlags];
  unsigned int v22 = [v21 smartDialerEnabled];
  v23 = @"person.crop.circle.badge.plus";
  if (v22) {
    v23 = @"person.text.rectangle";
  }
  v34 = v23;

  v40 = +[NSBundle mainBundle];
  v38 = [v40 localizedStringForKey:@"ADD_TO_NEW" value:&stru_100285990 table:@"Dialer"];
  v37 = +[UIImage systemImageNamed:v20];

  v39 = +[NSBundle mainBundle];
  v36 = [v39 localizedStringForKey:@"ADD_TO_NEW" value:&stru_100285990 table:@"Dialer"];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = __55__MPKeypadViewController_createMenuForAddContactButton__block_invoke;
  v42[3] = &unk_10027D2B8;
  v42[4] = self;
  id v43 = v4;
  v35 = +[UIAction actionWithTitle:v38 image:v37 identifier:v36 handler:v42];
  v44[0] = v35;
  char v24 = +[NSBundle mainBundle];
  v25 = [v24 localizedStringForKey:@"ADD_TO_EXISTING" value:&stru_100285990 table:@"Dialer"];
  v26 = +[UIImage systemImageNamed:v34];

  v27 = +[NSBundle mainBundle];
  uint64_t v28 = [v27 localizedStringForKey:@"ADD_TO_EXISTING" value:&stru_100285990 table:@"Dialer"];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = __55__MPKeypadViewController_createMenuForAddContactButton__block_invoke_2;
  v41[3] = &unk_10027D2E0;
  v41[4] = self;
  v29 = +[UIAction actionWithTitle:v25 image:v26 identifier:v28 handler:v41];
  v44[1] = v29;
  v30 = +[NSArray arrayWithObjects:v44 count:2];
  id v31 = +[UIMenu menuWithTitle:&stru_100285990 children:v30];

LABEL_18:
  v32 = +[SearchMetrics shared];
  [v32 keypadButtonInteractedWithButtonType:1];

  return v31;
}

void __55__MPKeypadViewController_createMenuForAddContactButton__block_invoke(uint64_t a1)
{
  v2 = +[SearchMetrics shared];
  [v2 keypadButtonInteractedWithButtonType:2];

  id v3 = *(void **)(a1 + 32);
  id v4 = [v3 _newContactWithPhoneNumber:*(void *)(a1 + 40)];
  [v3 _addNewContact:v4];
}

void __55__MPKeypadViewController_createMenuForAddContactButton__block_invoke_2(uint64_t a1)
{
  v2 = +[SearchMetrics shared];
  [v2 keypadButtonInteractedWithButtonType:3];

  id v4 = objc_alloc_init((Class)CNContactPickerViewController);
  [v4 setAllowsCancel:1];
  [v4 setAutocloses:0];
  [v4 setDelegate:*(void *)(a1 + 32)];
  [v4 setMode:2];
  id v3 = +[NSPredicate predicateWithValue:1];
  [v4 setPredicateForSelectionOfContact:v3];

  [*(id *)(a1 + 32) presentViewController:v4 animated:1 completion:0];
}

- (id)_metadataNameForDialerText
{
  id v3 = [(PHAbstractDialerView *)self->super._dialerView lcdView];
  id v4 = [v3 text];

  if ([v4 length])
  {
    id v5 = objc_alloc((Class)TUMetadataDestinationID);
    id v6 = TUNetworkCountryCode();
    id v7 = [v5 initWithDestinationID:v4 isoCountryCode:v6];

    if (v7)
    {
      uint64_t v8 = [(MPKeypadViewController *)self metadataCache];
      objc_super v9 = [v8 metadataForDestinationID:v7];

      v10 = [v9 metadataForProvider:objc_opt_class()];

      if (v10
        || ([v9 metadataForProvider:objc_opt_class()],
            v11 = objc_claimAutoreleasedReturnValue(),
            v11,
            v11)
        || ([v9 metadataForProvider:objc_opt_class()],
            unsigned int v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            v12))
      {
        unsigned int v12 = [v9 metadataForProvider:objc_opt_class()];
      }
    }
    else
    {
      unsigned int v12 = 0;
    }
  }
  else
  {
    unsigned int v12 = 0;
  }

  return v12;
}

- (void)_metadataCacheDidUpdate
{
  id v4 = [(MPKeypadViewController *)self _metadataNameForDialerText];
  id v3 = [(PHAbstractDialerView *)self->super._dialerView lcdView];
  [v3 setName:v4 numberLabel:0 suggestion:1];
}

- (void)_updateName
{
}

- (void)_updateNameAndRefreshResult:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PHAbstractDialerView *)self->super._dialerView lcdView];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(PHAbstractDialerView *)self->super._dialerView lcdView];
    uint64_t v8 = [v7 text];

    if ([v8 length])
    {
      objc_super v9 = [(MPKeypadViewController *)self featureFlags];
      unsigned int v10 = [v9 smartDialerEnabled];

      if (v10)
      {
        v11 = [v8 unformattedNumberInLatin];
        v23 = _NSConcreteStackBlock;
        uint64_t v24 = 3221225472;
        v25 = __54__MPKeypadViewController__updateNameAndRefreshResult___block_invoke;
        v26 = &unk_10027D330;
        v27 = self;
        id v28 = v8;
        [(MPKeypadViewController *)self searchFor:v11 shouldRefreshResult:v3 completionHandler:&v23];
      }
      else
      {
        id v16 = [(DialerController *)self contactResultForPhoneNumber:v8];
        v17 = [v16 contacts];
        id v18 = [v17 count];

        if (v18)
        {
          char v19 = [v16 localizedName];
          v20 = [v16 contactLabel];
          v21 = [(PHAbstractDialerView *)self->super._dialerView lcdView];
          [v21 setName:v19 numberLabel:v20 suggestion:0];
        }
        else
        {
          unsigned int v22 = [(PHAbstractDialerView *)self->super._dialerView lcdView];
          [v22 setName:0 numberLabel:0 suggestion:0];

          [(MPKeypadViewController *)self _updateNameFromMetadataCache];
        }
      }
      [(MPKeypadViewController *)self updateIDSStatus];
    }
    else
    {
      [(MPKeypadViewController *)self _clearIDSStatusCache];
      unsigned int v12 = [(MPKeypadViewController *)self featureFlags];
      unsigned int v13 = [v12 smartDialerEnabled];

      unsigned int v14 = [(PHAbstractDialerView *)self->super._dialerView lcdView];
      id v15 = v14;
      if (v13) {
        [v14 setContactSearchResults:0 hasCompleteMatch:0];
      }
      else {
        [v14 setName:0 numberLabel:0 suggestion:0];
      }
    }
  }
  [(DialerController *)self _stopLookupTimer];
}

void __54__MPKeypadViewController__updateNameAndRefreshResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__MPKeypadViewController__updateNameAndRefreshResult___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) contactResultForPhoneNumber:*(void *)(a1 + 40)];
    unsigned int v14 = [v7 contacts];
    BOOL v15 = [v14 count] != 0;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __54__MPKeypadViewController__updateNameAndRefreshResult___block_invoke_118;
    block[3] = &unk_10027D308;
    block[4] = *(void *)(a1 + 32);
    id v17 = v5;
    BOOL v18 = v15;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id __54__MPKeypadViewController__updateNameAndRefreshResult___block_invoke_118(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) lcdView];
  [v2 setContactSearchResults:*(void *)(a1 + 40) hasCompleteMatch:*(unsigned __int8 *)(a1 + 48)];

  id result = [*(id *)(a1 + 40) count];
  if (!result && !*(unsigned char *)(a1 + 48))
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 _updateNameFromMetadataCache];
  }
  return result;
}

- (void)_updateNameFromMetadataCache
{
  BOOL v3 = [(PHAbstractDialerView *)self->super._dialerView lcdView];
  id v6 = [v3 text];

  TUNetworkCountryCode();
  if (PNIsValidPhoneNumberForCountry())
  {
    id v4 = [(MPKeypadViewController *)self _metadataNameForDialerText];
    if (v4)
    {
      id v5 = [(PHAbstractDialerView *)self->super._dialerView lcdView];
      [v5 setName:v4 numberLabel:0 suggestion:1];
    }
    else
    {
      [(MPKeypadViewController *)self _updateMetadataCacheIfPossible];
    }
  }
}

- (void)searchFor:(id)a3 shouldRefreshResult:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cancelling previous contact search", buf, 2u);
  }

  uint64_t v11 = +[NSDate date];
  uint64_t v12 = [(MPKeypadViewController *)self contactSearchManager];
  [v12 cancelPreviousSearch];

  uint64_t v13 = [(MPKeypadViewController *)self contactSearchManager];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __74__MPKeypadViewController_searchFor_shouldRefreshResult_completionHandler___block_invoke;
  v17[3] = &unk_10027D358;
  id v19 = v8;
  id v20 = v9;
  id v18 = v11;
  id v14 = v8;
  id v15 = v11;
  id v16 = v9;
  [v13 searchFor:v14 shouldRefreshResult:v6 completionHandler:v17];
}

void __74__MPKeypadViewController_searchFor_shouldRefreshResult_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v7, a3);
  }
  BOOL v6 = +[SearchMetrics shared];
  objc_msgSend(v6, "searchFinishedForController:startTime:searchLength:resultsCount:", 7, *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "length"), objc_msgSend(v7, "count"));
}

- (void)setIsHostedInRemoteViewController:(BOOL)a3
{
  if (self->_isHostedInRemoteViewController != a3)
  {
    BOOL v3 = a3;
    self->_isHostedInRemoteViewController = a3;
    id v4 = [(DialerController *)self dialerView];
    [v4 setIsHostedInRemoteViewController:v3];
  }
}

- (void)refreshLocalizedSenderIdentity
{
  if (+[PHDevice isGeminiCapable])
  {
    BOOL v3 = [(DialerController *)self callProviderManager];
    id v4 = [(DialerController *)self callProviderManager];
    uint64_t v5 = [v4 telephonyProvider];
    BOOL v6 = [v5 identifier];
    id v15 = [v3 providerWithIdentifier:v6];

    id v7 = [v15 prioritizedSenderIdentities];
    id v8 = [v7 count];

    if ((unint64_t)v8 < 2) {
      goto LABEL_6;
    }
    id v9 = [v15 prioritizedSenderIdentities];
    uint64_t v10 = [v9 firstObject];
    uint64_t v11 = [v10 localizedName];
    id v12 = [v11 length];

    if (v12)
    {
      uint64_t v13 = [v15 prioritizedSenderIdentities];
      id v14 = [v13 firstObject];
    }
    else
    {
LABEL_6:
      id v14 = 0;
    }
    [(MPKeypadViewController *)self updateLocalizedSenderIdentity:v14];
  }
}

- (void)updateLocalizedSenderIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating to localizedSenderIdentity %@", (uint8_t *)&v8, 0xCu);
  }

  [(DialerController *)self setSelectedSenderIdentity:v4];
  BOOL v6 = [(DialerController *)self dialerView];
  id v7 = [v6 lcdView];
  [v7 setSenderIdentity:v4];
}

- (void)_updateMetadataCacheIfPossible
{
  BOOL v3 = [(DialerController *)self dialerView];
  id v4 = [v3 lcdView];
  uint64_t v5 = [v4 text];

  if ([v5 length])
  {
    TUNetworkCountryCode();
    if (PNIsValidPhoneNumberForCountry())
    {
      id v6 = objc_alloc((Class)TUMetadataDestinationID);
      id v7 = TUNetworkCountryCode();
      id v8 = [v6 initWithDestinationID:v5 isoCountryCode:v7];

      if (v8)
      {
        objc_initWeak(&location, self);
        id v9 = [(MPKeypadViewController *)self metadataCache];
        id v14 = v8;
        uint64_t v10 = +[NSArray arrayWithObjects:&v14 count:1];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = __56__MPKeypadViewController__updateMetadataCacheIfPossible__block_invoke;
        v11[3] = &unk_10027D380;
        objc_copyWeak(&v12, &location);
        [v9 updateCacheWithDestinationIDs:v10 completion:v11];

        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __56__MPKeypadViewController__updateMetadataCacheIfPossible__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _metadataCacheDidUpdate];
}

- (id)senderIdentityMenuForDialerView:(id)a3 selectedSenderIdentity:(id)a4
{
  id v27 = a4;
  id v4 = [(DialerController *)self callProviderManager];
  uint64_t v5 = [v4 telephonyProvider];

  id v6 = [v5 prioritizedSenderIdentities];
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [v5 prioritizedSenderIdentities];
  id v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v13 = +[NSBundle mainBundle];
        id v14 = [v13 localizedStringForKey:@"KEYPAD_CALL_WITH_SENDER_IDENTITY_%@" value:&stru_100285990 table:@"MPKeypad"];
        id v15 = [v12 localizedName];
        id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);

        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = __81__MPKeypadViewController_senderIdentityMenuForDialerView_selectedSenderIdentity___block_invoke;
        v28[3] = &unk_10027D2B8;
        v28[4] = self;
        v28[5] = v12;
        id v17 = objc_retainBlock(v28);
        id v18 = +[UIAction actionWithTitle:v16 image:0 identifier:0 handler:v17];
        id v19 = [v12 UUID];
        id v20 = [v27 UUID];
        [v18 setState:v19 == v20];

        [v7 addObject:v18];
      }
      id v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }

  v21 = +[NSBundle mainBundle];
  unsigned int v22 = [v21 localizedStringForKey:@"KEYPAD_CALL_WITH_SENDER_IDENTITY_TITLE" value:&stru_100285990 table:@"MPKeypad"];
  v23 = +[UIMenu menuWithTitle:v22 children:v7];

  return v23;
}

id __81__MPKeypadViewController_senderIdentityMenuForDialerView_selectedSenderIdentity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLocalizedSenderIdentity:*(void *)(a1 + 40)];
}

- (void)_addNewContact:(id)a3
{
  id v5 = +[CNContactViewController viewControllerForNewContact:a3];
  [v5 setDelegate:self];
  id v4 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v5];
  [(MPKeypadViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (id)_newContactWithPhoneNumber:(id)a3
{
  id v4 = objc_alloc_init((Class)CNMutableContact);
  id v5 = [(PHAbstractDialerView *)self->super._dialerView lcdView];
  id v6 = [v5 text];
  id v7 = +[CNPhoneNumber phoneNumberWithStringValue:v6];
  id v8 = +[CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMobile value:v7];

  uint64_t v11 = v8;
  id v9 = +[NSArray arrayWithObjects:&v11 count:1];
  [v4 setPhoneNumbers:v9];

  return v4;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v9 = a3;
  [(MPKeypadViewController *)self _updateNameAndRefreshResult:1];
  id v5 = [(MPKeypadViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v9 navigationController];
    id v8 = [v7 popViewControllerAnimated:1];
  }
  else
  {
    [(MPKeypadViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)contactViewWrapperDidCancel
{
}

- (void)contactPickerDidCancel:(id)a3
{
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  dialerView = self->super._dialerView;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(PHAbstractDialerView *)dialerView lcdView];
  uint64_t v10 = [v9 text];
  id v13 = [(MPKeypadViewController *)self _newContactWithPhoneNumber:v10];

  uint64_t v11 = +[CNContactViewController viewControllerForUpdatingContact:v7 withPropertiesFromContact:v13];

  [v11 setDelegate:self];
  id v12 = [v8 navigationController];

  [v12 pushViewController:v11 animated:1];
}

- (BOOL)defaultActionIsFaceTimeAudio
{
  return [UIApp defaultAction] == 2;
}

- (id)pseudoNameStringForDestinationID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)TUMetadataDestinationID);
  id v6 = TUNetworkCountryCode();
  id v7 = [v5 initWithDestinationID:v4 isoCountryCode:v6];

  if (v7)
  {
    id v8 = [(MPKeypadViewController *)self metadataCache];
    id v9 = [v8 metadataForDestinationID:v7];

    uint64_t v10 = [v9 metadataForProvider:objc_opt_class()];

    if (v10
      || ([v9 metadataForProvider:objc_opt_class()],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v11)
      || ([v9 metadataForProvider:objc_opt_class()],
          id v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v12))
    {
      id v12 = [v9 metadataForProvider:objc_opt_class()];
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_IDSStatusCacheKeyForService:(id)a3 withDestination:(id)a4
{
  return +[NSString stringWithFormat:@"%@:%@", a3, a4];
}

- (void)updateIDSStatus
{
  BOOL v3 = [(PHAbstractDialerView *)self->super._dialerView lcdView];
  id v4 = [v3 text];

  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is updating IDS status for text: %@", (uint8_t *)&v8, 0x16u);
  }

  id v6 = (void *)_PNCreateStringByStrippingFormattingAndNotVisiblyAllowable();
  id v7 = TUCopyIDSCanonicalAddressForDestinationID();
  [(MPKeypadViewController *)self _updateIDSStatusIfNeededForService:IDSServiceNameFaceTime withDestination:v7];
}

- (void)_updateIDSStatusIfNeededForService:(id)a3 withDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MPKeypadViewController *)self _IDSStatusCacheKeyForService:v6 withDestination:v7];
  id v9 = [(MPKeypadViewController *)self IDSstatusCache];
  __int16 v10 = [v9 objectForKey:v8];

  if (!v10)
  {
    uint64_t v11 = [(MPKeypadViewController *)self IDSstatusCache];
    id v12 = +[NSNumber numberWithInteger:0];
    [v11 setObject:v12 forKey:v8];

    id v13 = dispatch_get_global_queue(33, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __77__MPKeypadViewController__updateIDSStatusIfNeededForService_withDestination___block_invoke;
    block[3] = &unk_10027D3A8;
    id v16 = v7;
    id v17 = v6;
    id v18 = v13;
    id v19 = self;
    id v20 = v8;
    id v14 = v13;
    dispatch_async(v14, block);
  }
}

void __77__MPKeypadViewController__updateIDSStatusIfNeededForService_withDestination___block_invoke(void *a1)
{
  v2 = +[IDSIDQueryController sharedInstance];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __77__MPKeypadViewController__updateIDSStatusIfNeededForService_withDestination___block_invoke_2;
  v7[3] = &unk_10027CB28;
  uint64_t v5 = a1[6];
  id v6 = (void *)a1[8];
  v7[4] = a1[7];
  id v8 = v6;
  [v2 currentIDStatusForDestination:v3 service:v4 listenerID:@"com.apple.mobilephone.FTCServiceAvailabilityListenerID" queue:v5 completionBlock:v7];
}

void __77__MPKeypadViewController__updateIDSStatusIfNeededForService_withDestination___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) IDSstatusCache];
  uint64_t v5 = [v4 objectForKey:*(void *)(a1 + 40)];

  if (v5)
  {
    id v7 = +[NSNumber numberWithInteger:a2];
    id v6 = [*(id *)(a1 + 32) IDSstatusCache];
    [v6 setObject:v7 forKey:*(void *)(a1 + 40)];
  }
}

- (int64_t)_IDSStatusForService:(id)a3 withDestination:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MPKeypadViewController *)self _updateIDSStatusIfNeededForService:v7 withDestination:v6];
  id v8 = [(MPKeypadViewController *)self _IDSStatusCacheKeyForService:v7 withDestination:v6];

  id v9 = [(MPKeypadViewController *)self IDSstatusCache];
  __int16 v10 = [v9 objectForKey:v8];

  if (!v10)
  {
    __int16 v10 = +[NSNumber numberWithInteger:0];
  }
  id v11 = [v10 integerValue];

  return (int64_t)v11;
}

- (void)_clearIDSStatusCache
{
  id v2 = [(MPKeypadViewController *)self IDSstatusCache];
  [v2 removeAllObjects];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  id v6 = [(MPKeypadViewController *)self callContextMenuInteraction];

  if (v6 == v5)
  {
    id v15 = [(DialerController *)self dialerView];
    id v16 = [v15 lcdView];
    id v17 = [v16 text];

    if (v17)
    {
      id v7 = _PNCreateStringByStrippingFormattingAndNotVisiblyAllowable();
    }
    else
    {
      id v7 = 0;
    }
    id v18 = +[NSMutableArray array];
    if (v7 && [v7 length])
    {
      v60 = v7;
      v62 = TUCopyIDSCanonicalAddressForDestinationID();
      id v19 = TelephonyUIBundle();
      id v20 = +[UIImage tpImageNamed:@"action_call-OrbHW" inBundle:v19];
      v69 = [v20 imageWithRenderingMode:2];

      v21 = TelephonyUIBundle();
      unsigned int v22 = +[UIImage tpImageNamed:@"action_facetime-OrbHW" inBundle:v21];
      v63 = [v22 imageWithRenderingMode:2];

      v23 = [(DialerController *)self callProviderManager];
      uint64_t v24 = [v23 faceTimeProvider];

      v25 = [(DialerController *)self callProviderManager];
      uint64_t v26 = [v25 telephonyProvider];

      id v27 = +[NSMutableArray array];
      id v28 = v27;
      if (v26) {
        [v27 addObject:v26];
      }
      v58 = (void *)v26;
      id v61 = v5;
      if (v24
        && (id)[(MPKeypadViewController *)self _IDSStatusForService:IDSServiceNameFaceTime withDestination:v62] == (id)1)
      {
        [v28 addObject:v24];
      }
      v59 = (void *)v24;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id obj = v28;
      id v29 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v76;
        long long v32 = &_s10Foundation8IndexSetV0B0VSQAAMc_ptr;
        objc_super v33 = &_s10Foundation8IndexSetV0B0VSQAAMc_ptr;
        v65 = v18;
        uint64_t v66 = *(void *)v76;
        v64 = self;
        do
        {
          v34 = 0;
          id v67 = v30;
          do
          {
            if (*(void *)v76 != v31) {
              objc_enumerationMutation(obj);
            }
            v35 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v34);
            if ([v35 isTelephonyProvider])
            {
              v36 = [v32[388] mainBundle];
              v37 = [v36 localizedStringForKey:@"CALL" value:&stru_100285990 table:@"General"];
              v74[0] = _NSConcreteStackBlock;
              v74[1] = 3221225472;
              v74[2] = __80__MPKeypadViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
              v74[3] = &unk_10027D2B8;
              v74[4] = self;
              v74[5] = v35;
              v38 = +[UIAction actionWithTitle:v37 image:v69 identifier:0 handler:v74];

              [v18 addObject:v38];
              goto LABEL_32;
            }
            if ([v35 isFaceTimeProvider])
            {
              v39 = v32;
              unsigned int v40 = +[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls];
              LODWORD(v41) = +[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls];
              v42 = [v39[388] mainBundle];
              id v43 = [v42 localizedStringForKey:@"KEYPAD_FACETIME_AUDIO" value:&stru_100285990 table:@"MPKeypad"];

              v44 = [v39[388] mainBundle];
              v45 = [v44 localizedStringForKey:@"KEYPAD_FACETIME_VIDEO" value:&stru_100285990 table:@"MPKeypad"];

              if (!v40)
              {
                self = v64;
                id v18 = v65;
                if (!v41) {
                  goto LABEL_31;
                }
LABEL_30:
                v72[0] = _NSConcreteStackBlock;
                v72[1] = 3221225472;
                v72[2] = __80__MPKeypadViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
                v72[3] = &unk_10027D2B8;
                v72[4] = self;
                v72[5] = v35;
                v56 = +[UIAction actionWithTitle:v45 image:v63 identifier:0 handler:v72];
                [v18 addObject:v56];

                goto LABEL_31;
              }
            }
            else
            {
              v46 = v33;
              v47 = v33[430];
              v48 = [v32[388] mainBundle];
              v49 = [v48 localizedStringForKey:@"KEYPAD_CALL_PROVIDER_NAME_%@_CALL_TYPE_NAME_AUDIO" value:&stru_100285990 table:@"MPKeypad"];
              [v35 localizedName];
              v51 = v50 = v32;
              id v43 = [v47 stringWithFormat:v49, v51, v58, v59];

              if ([v35 supportsAudioAndVideo])
              {
                v52 = v46[430];
                uint64_t v41 = [v50[388] mainBundle];
                v53 = [(id)v41 localizedStringForKey:@"KEYPAD_CALL_PROVIDER_NAME_%@_CALL_TYPE_NAME_VIDEO" value:&stru_100285990 table:@"MPKeypad"];
                v54 = [v35 localizedName];
                v45 = [v52 stringWithFormat:v53, v54];

                LOBYTE(v41) = 1;
              }
              else
              {
                v45 = 0;
                LOBYTE(v41) = 0;
              }
            }
            v73[0] = _NSConcreteStackBlock;
            v73[1] = 3221225472;
            self = v64;
            v73[2] = __80__MPKeypadViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
            v73[3] = &unk_10027D2B8;
            v73[4] = v64;
            v73[5] = v35;
            v55 = +[UIAction actionWithTitle:v43 image:v69 identifier:0 handler:v73];
            id v18 = v65;
            [v65 addObject:v55];

            if (v41) {
              goto LABEL_30;
            }
LABEL_31:

            uint64_t v31 = v66;
            id v30 = v67;
            long long v32 = &_s10Foundation8IndexSetV0B0VSQAAMc_ptr;
LABEL_32:
            v34 = (char *)v34 + 1;
            objc_super v33 = &_s10Foundation8IndexSetV0B0VSQAAMc_ptr;
          }
          while (v30 != v34);
          id v30 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
        }
        while (v30);
      }

      id v7 = v60;
      id v5 = v61;
    }
    if ([v18 count])
    {
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = __80__MPKeypadViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
      v70[3] = &unk_10027D3D0;
      v70[4] = self;
      id v71 = v18;
      id v14 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v70];
    }
    else
    {
      id v14 = 0;
    }

    goto LABEL_39;
  }
  id v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[MPKeypadViewController contextMenuInteraction:configurationForMenuAtLocation:]((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  }
  id v14 = 0;
LABEL_39:

  return v14;
}

id __80__MPKeypadViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performCallActionForCallProvider:*(void *)(a1 + 40)];
}

id __80__MPKeypadViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performCallActionForCallProvider:*(void *)(a1 + 40) video:0];
}

id __80__MPKeypadViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) performCallActionForCallProvider:*(void *)(a1 + 40) video:1];
}

id __80__MPKeypadViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dialerView];
  uint64_t v3 = [v2 lcdView];
  uint64_t v4 = [v3 text];
  id v5 = +[UIMenu menuWithTitle:v4 children:*(void *)(a1 + 40)];

  return v5;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = [(MPKeypadViewController *)self callContextMenuInteraction];

  if (v6 == v5)
  {
    id v15 = objc_alloc_init((Class)UIPreviewParameters);
    id v16 = [(DialerController *)self dialerView];
    id v17 = [v16 callButton];
    [v17 bounds];
    double v19 = v18;
    id v20 = [(DialerController *)self dialerView];
    v21 = [v20 callButton];
    [v21 bounds];
    unsigned int v22 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v19);
    [v15 setVisiblePath:v22];

    id v23 = objc_alloc((Class)UITargetedPreview);
    uint64_t v24 = [(DialerController *)self dialerView];
    v25 = [v24 callButton];
    id v14 = [v23 initWithView:v25 parameters:v15];
  }
  else
  {
    id v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MPKeypadViewController contextMenuInteraction:previewForHighlightingMenuWithConfiguration:]((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }

    id v14 = 0;
  }

  return v14;
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling providersChangedForProviderManager %@", (uint8_t *)&v6, 0x16u);
  }

  [(MPKeypadViewController *)self refreshLocalizedSenderIdentity];
}

- (void)searchButtonPressed:(id)a3
{
  id v4 = [(MPKeypadViewController *)self featureFlags];
  unsigned int v5 = [v4 smartDialerExpandedSearchEnabled];

  if (v5)
  {
    [(MPKeypadViewController *)self presentSearch];
  }
}

- (void)contactCountButtonPressed:(id)a3
{
  id v4 = [(MPKeypadViewController *)self featureFlags];
  unsigned int v5 = [v4 smartDialerEnabled];

  if (v5)
  {
    [(MPKeypadViewController *)self presentSearch];
    id v9 = +[SearchMetrics shared];
    int v6 = [(PHAbstractDialerView *)self->super._dialerView lcdView];
    id v7 = [v6 text];
    __int16 v8 = [v7 unformattedNumber];
    [v9 logSearchResultInteraction:1 cellType:8 searchLength:[v8 length]];
  }
}

- (void)presentSearch
{
  uint64_t v3 = [(MPKeypadViewController *)self featureFlags];
  unsigned int v4 = [v3 smartDialerEnabled];

  if (v4)
  {
    objc_initWeak(&location, self);
    unsigned int v5 = [MPKeypadSearchViewController alloc];
    uint64_t v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    uint64_t v13 = __39__MPKeypadViewController_presentSearch__block_invoke;
    id v14 = &unk_10027D380;
    objc_copyWeak(&v15, &location);
    int v6 = [(MPKeypadSearchViewController *)v5 initWithOnDismissHandler:&v11];
    id v7 = [(PHAbstractDialerView *)self->super._dialerView lcdView];
    __int16 v8 = [v7 text];
    id v9 = [v8 unformattedNumber];
    [(MPKeypadSearchViewController *)v6 updateSearchText:v9];

    id v10 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
    [v10 setModalPresentationStyle:3];
    [v10 setModalTransitionStyle:2];
    [(MPKeypadViewController *)self presentViewController:v10 animated:1 completion:0];
    [(MPKeypadViewController *)self updateTabBarAppearanceToTransparent:0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __39__MPKeypadViewController_presentSearch__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateTabBarAppearanceToTransparent:1];
    id WeakRetained = v2;
  }
}

- (TUMetadataCache)metadataCache
{
  return self->_metadataCache;
}

- (BOOL)isHostedInRemoteViewController
{
  return self->_isHostedInRemoteViewController;
}

- (NSCache)IDSstatusCache
{
  return self->_IDSstatusCache;
}

- (void)setIDSstatusCache:(id)a3
{
}

- (UIContextMenuInteraction)callContextMenuInteraction
{
  return self->_callContextMenuInteraction;
}

- (void)setCallContextMenuInteraction:(id)a3
{
}

- (void)setContactSearchManager:(id)a3
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
  objc_storeStrong((id *)&self->_contactSearchManager, 0);
  objc_storeStrong((id *)&self->_callContextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_IDSstatusCache, 0);

  objc_storeStrong((id *)&self->_metadataCache, 0);
}

void __54__MPKeypadViewController__updateNameAndRefreshResult___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)contextMenuInteraction:(uint64_t)a3 configurationForMenuAtLocation:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)contextMenuInteraction:(uint64_t)a3 previewForHighlightingMenuWithConfiguration:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end