@interface VSAccountInfoViewController
- (ASCLockupViewGroup)group;
- (BOOL)isReadyToHandleDeepLinks;
- (NSDictionary)cachedLockupRequests;
- (NSOperationQueue)privateQueue;
- (VSAccount)account;
- (VSAccountInfoViewController)initWithAccount:(id)a3 identityProvider:(id)a4 storage:(id)a5 restrictionsCenter:(id)a6;
- (VSAccountInfoViewController)initWithAccount:(id)a3 storage:(id)a4 restrictionsCenter:(id)a5;
- (VSAccountInfoViewController)initWithCoder:(id)a3;
- (VSAccountInfoViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VSAccountInfoViewControllerDelegate)delegate;
- (VSAppSettingsFacade)facade;
- (VSIdentityProvider)identityProvider;
- (VSOnboardingInfoCenter)onboardingInfoCenter;
- (VSPersistentStorage)storage;
- (VSRestrictionsCenter)restrictionsCenter;
- (VSStateMachine)stateMachine;
- (id)_isAppAllowedAccountAccessWithSpecifier:(id)a3;
- (id)_specifierForAppSettingsViewModel:(id)a3 modifier:(id)a4;
- (id)createAccountFooterSpecifier;
- (id)createAppSpecifiers;
- (id)createDecidedSpecifiers;
- (id)createHeaderSpecifier;
- (id)createLoadingSpecifier;
- (id)createLoadingTitleSpecifier;
- (id)createLockupRequests;
- (id)createSignOutButtonSpecifier;
- (id)loadingSpecifier;
- (id)loadingTitleSpecifier;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_aboutPrivacyLinkTapped:(id)a3;
- (void)_accountUsernameButtonTapped:(id)a3;
- (void)_appsDidChange:(id)a3;
- (void)_revokeVoucher:(id)a3;
- (void)_seeMoreAppsLinkButtonTapped:(id)a3;
- (void)_setAppAllowedAccess:(id)a3 withSpecifier:(id)a4;
- (void)_setIdentityProvider:(id)a3;
- (void)dealloc;
- (void)disableAccountSignOutButton;
- (void)enqueueEvent:(id)a3;
- (void)handleDestination:(id)a3 completion:(id)a4;
- (void)handleRemoveTVProviderDestinationWithCompletion:(id)a3;
- (void)handleSignOutDestinationWithCompletion:(id)a3;
- (void)prefetchLockupRequestsWithCompletionBlock:(id)a3;
- (void)scrollToSignOutButtonWithCompletion:(id)a3;
- (void)scrollToSpecifier:(id)a3 withCompletion:(id)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)setCachedLockupRequests:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFacade:(id)a3;
- (void)setGroup:(id)a3;
- (void)setIdentityProvider:(id)a3;
- (void)setOnboardingInfoCenter:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setReadyToHandleDeepLinks:(BOOL)a3;
- (void)setStateMachine:(id)a3;
- (void)showMVPDIfNeeded;
- (void)transitionToLoadedproviderState;
- (void)transitionToLoadedproviderandappsState;
@end

@implementation VSAccountInfoViewController

- (VSAccountInfoViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The %@ initializer is not available.", v4 format];

  return 0;
}

- (VSAccountInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSAccountInfoViewController)initWithAccount:(id)a3 storage:(id)a4 restrictionsCenter:(id)a5
{
  return [(VSAccountInfoViewController *)self initWithAccount:a3 identityProvider:0 storage:a4 restrictionsCenter:a5];
}

- (VSAccountInfoViewController)initWithAccount:(id)a3 identityProvider:(id)a4 storage:(id)a5 restrictionsCenter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  VSRequireMainThread();
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    +[NSException raise:NSInvalidArgumentException format:@"The storage parameter must not be nil."];
    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  +[NSException raise:NSInvalidArgumentException format:@"The account parameter must not be nil."];
  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  +[NSException raise:NSInvalidArgumentException format:@"The restrictionsCenter parameter must not be nil."];
LABEL_4:
  v32.receiver = self;
  v32.super_class = (Class)VSAccountInfoViewController;
  v15 = [(VSAccountInfoViewController *)&v32 initWithNibName:0 bundle:0];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    objc_storeStrong((id *)&v16->_identityProvider, a4);
    objc_storeStrong((id *)&v16->_storage, a5);
    objc_storeStrong((id *)&v16->_restrictionsCenter, a6);
    v17 = (VSOnboardingInfoCenter *)objc_alloc_init((Class)VSOnboardingInfoCenter);
    onboardingInfoCenter = v16->_onboardingInfoCenter;
    v16->_onboardingInfoCenter = v17;

    v19 = (ASCLockupViewGroup *)[objc_alloc((Class)ASCLockupViewGroup) initWithName:@"VSAccountInfoViewController"];
    group = v16->_group;
    v16->_group = v19;

    v21 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    privateQueue = v16->_privateQueue;
    v16->_privateQueue = v21;

    [(NSOperationQueue *)v16->_privateQueue setName:@"VSAccountInfoViewController"];
    [(NSOperationQueue *)v16->_privateQueue setMaxConcurrentOperationCount:1];
    v23 = (VSStateMachine *)objc_alloc_init((Class)VSStateMachine);
    stateMachine = v16->_stateMachine;
    v16->_stateMachine = v23;

    v25 = v16->_stateMachine;
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    [(VSStateMachine *)v25 setName:v27];

    [(VSStateMachine *)v16->_stateMachine setDelegate:v16];
    [(VSStateMachine *)v16->_stateMachine setDestinationState:@"LoadedProvider" forEvent:@"LoadProvider" inState:@"Empty"];
    [(VSStateMachine *)v16->_stateMachine setDestinationState:@"LoadedProviderAndApps" forEvent:@"AppsDidChange" inState:@"LoadedProvider"];
    [(VSStateMachine *)v16->_stateMachine setIgnoresUnassignedEvents:1];
    [(VSStateMachine *)v16->_stateMachine activateWithState:@"Empty"];
    v28 = (VSAppSettingsFacade *)[objc_alloc((Class)VSAppSettingsFacade) initWithStorage:v13 restrictionsCenter:v14];
    facade = v16->_facade;
    v16->_facade = v28;

    v30 = +[NSNotificationCenter defaultCenter];
    [v30 addObserver:v16 selector:"_appsDidChange:" name:VSAppSettingsFacadeAppsDidChangeNotification object:v16->_facade];
    [(VSAccountInfoViewController *)v16 _setIdentityProvider:v12];
  }
  return v16;
}

- (void)dealloc
{
  VSRequireMainThread();
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:VSAppSettingsFacadeAppsDidChangeNotification object:self->_facade];

  v4.receiver = self;
  v4.super_class = (Class)VSAccountInfoViewController;
  [(VSAccountInfoViewController *)&v4 dealloc];
}

- (void)setIdentityProvider:(id)a3
{
  if (self->_identityProvider != a3) {
    -[VSAccountInfoViewController _setIdentityProvider:](self, "_setIdentityProvider:");
  }
}

- (void)_setIdentityProvider:(id)a3
{
  id v12 = a3;
  objc_storeStrong((id *)&self->_identityProvider, a3);
  v5 = [(VSAccountInfoViewController *)self facade];
  [v5 setIdentityProvider:v12];

  v6 = [v12 displayName];
  v7 = [v6 forceUnwrapObject];

  if (![v7 length])
  {
    v8 = [(VSAccountInfoViewController *)self account];
    v9 = [v8 optionalIdentityProviderDisplayName];
    uint64_t v10 = [v9 forceUnwrapObject];

    v7 = (void *)v10;
  }
  [(VSAccountInfoViewController *)self setTitle:v7];
  if (v12)
  {
    id v11 = [(VSAccountInfoViewController *)self stateMachine];
    [v11 enqueueEvent:@"LoadProvider"];

    [(VSAccountInfoViewController *)self showMVPDIfNeeded];
  }
}

- (void)enqueueEvent:(id)a3
{
  id v4 = a3;
  v5 = [(VSAccountInfoViewController *)self stateMachine];
  unsigned __int8 v6 = [v5 enqueueEvent:v4];

  if ((v6 & 1) == 0)
  {
    [(VSAccountInfoViewController *)self reloadSpecifiers];
    [(VSAccountInfoViewController *)self showMVPDIfNeeded];
  }
}

- (void)_aboutPrivacyLinkTapped:(id)a3
{
  id v4 = [(VSAccountInfoViewController *)self onboardingInfoCenter];
  [v4 presentDetailsFromViewController:self];
}

- (void)_accountUsernameButtonTapped:(id)a3
{
  id v6 = [(VSAccountInfoViewController *)self delegate];
  id v4 = [(VSAccountInfoViewController *)self account];
  v5 = [(VSAccountInfoViewController *)self identityProvider];
  [v6 accountInfoViewController:self didSelectEditAccountForAccount:v4 identityProvider:v5];
}

- (void)_seeMoreAppsLinkButtonTapped:(id)a3
{
  +[VSMetricsManagerObjC recordClickEventWithPage:VSMetricPageSettingsAccountInfo pageType:VSMetricPageTypeSettings target:VSMetricClickTargetFindMoreApps];
  id v4 = [(VSAccountInfoViewController *)self delegate];
  [v4 accountInfoViewControllerWantsMoreApps:self];
}

- (void)showMVPDIfNeeded
{
  id v6 = [(VSAccountInfoViewController *)self delegate];
  if ([v6 accountInfoViewControllerShouldShowMVPDAppInstallPrompt:self])
  {
    v3 = [(VSAccountInfoViewController *)self facade];
    unsigned int v4 = [v3 shouldShowMVPDAppInstallPrompt];

    if (v4)
    {
      v5 = [(VSAccountInfoViewController *)self facade];
      [v5 presentMVPDAppInstallPromptFromViewController:self animated:1 completion:0];

      [v6 accountInfoViewControllerDidShowMVPDAppInstallPrompt];
    }
  }
}

- (void)_appsDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(VSAccountInfoViewController *)self facade];
  id v6 = [v5 appSections];
  v7 = [v6 objectForKeyedSubscript:@"subscribed"];

  v8 = [(VSAccountInfoViewController *)self facade];
  v9 = [v8 appSections];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"available"];

  id v11 = [(VSAccountInfoViewController *)self facade];
  id v12 = [v11 appSections];
  id v13 = [v12 objectForKeyedSubscript:@"upgrade"];

  if (v7 || v13 || v10)
  {
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_3988;
    v14[3] = &unk_14548;
    v14[4] = self;
    [(VSAccountInfoViewController *)self prefetchLockupRequestsWithCompletionBlock:v14];
    objc_destroyWeak(&location);
  }
}

- (id)createLockupRequests
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(VSAccountInfoViewController *)self facade];
  v5 = [v4 appSections];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v5;
  id v19 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v6);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v9 = objc_msgSend(v6, "objectForKeyedSubscript:", v8, v18);
        id v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v21;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)j) adamID];
              v15 = +[ASCLockupRequest tvProviderLockupRequestWithAdamID:v14];
              [v3 addObject:v15];
            }
            id v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v11);
        }
      }
      id v19 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }

  id v16 = [v3 copy];

  return v16;
}

- (void)prefetchLockupRequestsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [(VSAccountInfoViewController *)self group];
  id v6 = [(VSAccountInfoViewController *)self createLockupRequests];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3CD8;
  v8[3] = &unk_14570;
  id v9 = v4;
  id v7 = v4;
  [v5 _cacheLockupsWithRequests:v6 withCompletionBlock:v8];
}

- (void)transitionToLoadedproviderState
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3EB0;
  block[3] = &unk_14598;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)transitionToLoadedproviderandappsState
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3FDC;
  block[3] = &unk_14598;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)createHeaderSpecifier
{
  id v3 = +[PSSpecifier emptyGroupSpecifier];
  [v3 setIdentifier:@"Header"];
  [v3 setProperty:@"VSHeader" forKey:PSIDKey];
  id v4 = +[NSBundle vs_frameworkBundle];
  v5 = [v4 localizedStringForKey:@"AUTHENTICATED_SETTINGS_HEADER_FORMAT" value:0 table:0];

  id v6 = [(VSAccountInfoViewController *)self onboardingInfoCenter];
  id v7 = [v6 localizedButtonTitle];

  uint64_t v8 = [(VSAccountInfoViewController *)self account];
  id v9 = [v8 identityProviderDisplayName];

  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v9);
  id v11 = +[NSString stringWithFormat:@"%@ %@", v10, v7];

  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  [v3 setProperty:v13 forKey:PSFooterCellClassGroupKey];

  [v3 setProperty:v11 forKey:PSFooterHyperlinkViewTitleKey];
  v19.id location = (NSUInteger)[v11 rangeOfString:v7];
  id v14 = NSStringFromRange(v19);
  [v3 setProperty:v14 forKey:PSFooterHyperlinkViewLinkRangeKey];

  v15 = +[NSValue valueWithNonretainedObject:self];
  [v3 setProperty:v15 forKey:PSFooterHyperlinkViewTargetKey];

  id v16 = NSStringFromSelector("_aboutPrivacyLinkTapped:");
  [v3 setProperty:v16 forKey:PSFooterHyperlinkViewActionKey];

  return v3;
}

- (id)createLoadingTitleSpecifier
{
  v2 = VSAppSettingsSectionLocalizedTitle();
  id v3 = +[PSSpecifier groupSpecifierWithName:v2];
  [v3 setIdentifier:@"LoadingTitle"];

  return v3;
}

- (id)loadingTitleSpecifier
{
  id v3 = [(VSAccountInfoViewController *)self specifierForID:@"LoadingTitle"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(VSAccountInfoViewController *)self createLoadingTitleSpecifier];
  }
  id v6 = v5;

  return v6;
}

- (id)createLoadingSpecifier
{
  v2 = +[PSSpecifier preferenceSpecifierNamed:&stru_14D50 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v2 setIdentifier:@"LoadingSpecifier"];
  [v2 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];

  return v2;
}

- (id)loadingSpecifier
{
  id v3 = [(VSAccountInfoViewController *)self specifierForID:@"LoadingSpecifier"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(VSAccountInfoViewController *)self createLoadingSpecifier];
  }
  id v6 = v5;

  return v6;
}

- (id)createDecidedSpecifiers
{
  id v3 = +[NSMutableArray array];
  id v4 = [(VSAccountInfoViewController *)self facade];
  id v5 = [v4 appSections];
  id v6 = [v5 objectForKeyedSubscript:@"decided"];

  if ([v6 count])
  {
    id v16 = VSAppSettingsSectionLocalizedTitle();
    id v7 = +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:");
    [v3 addObject:v7];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [(VSAccountInfoViewController *)self _specifierForAppSettingsViewModel:*(void *)(*((void *)&v17 + 1) + 8 * i) modifier:@"decided"];
          [v3 addObject:v13];
        }
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
  id v14 = [v3 copy];

  return v14;
}

- (id)createAppSpecifiers
{
  id v3 = +[NSMutableArray array];
  id v4 = [(VSAccountInfoViewController *)self facade];
  id v5 = [v4 appSections];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"available"];

  id v7 = [(VSAccountInfoViewController *)self facade];
  id v8 = [v7 appSections];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"subscribed"];

  v36 = (void *)v9;
  v37 = (void *)v6;
  if (v6) {
    id v10 = (void *)v6;
  }
  else {
    id v10 = (void *)v9;
  }
  if (v6) {
    uint64_t v11 = @"available";
  }
  else {
    uint64_t v11 = @"subscribed";
  }
  id v12 = v10;
  id v13 = v11;
  if ([v12 count])
  {
    id v14 = VSAppSettingsSectionLocalizedTitle();
    v15 = +[PSSpecifier groupSpecifierWithName:v14];
    [v3 addObject:v15];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v16 = v12;
    id v17 = v12;
    id v18 = [v17 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v43;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = [(VSAccountInfoViewController *)self _specifierForAppSettingsViewModel:*(void *)(*((void *)&v42 + 1) + 8 * i) modifier:v13];
          [v3 addObject:v22];
        }
        id v19 = [v17 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v19);
    }

    id v12 = v16;
  }
  long long v23 = [(VSAccountInfoViewController *)self facade];
  long long v24 = [v23 appSections];
  long long v25 = [v24 objectForKeyedSubscript:@"upgrade"];

  if ([v25 count])
  {
    id v35 = v12;
    v34 = VSAppSettingsSectionLocalizedTitle();
    long long v26 = +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:");
    [v3 addObject:v26];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v27 = v25;
    id v28 = [v27 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v39;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v39 != v30) {
            objc_enumerationMutation(v27);
          }
          objc_super v32 = [(VSAccountInfoViewController *)self _specifierForAppSettingsViewModel:*(void *)(*((void *)&v38 + 1) + 8 * (void)j) modifier:@"upgrade"];
          [v3 addObject:v32];
        }
        id v29 = [v27 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v29);
    }

    id v12 = v35;
  }

  return v3;
}

- (id)createAccountFooterSpecifier
{
  id v3 = +[PSSpecifier groupSpecifierWithID:@"accountGroup"];
  id v4 = [(VSAccountInfoViewController *)self account];
  id v5 = [v4 identityProviderDisplayName];

  uint64_t v6 = [(VSAccountInfoViewController *)self identityProvider];
  unsigned int v7 = [v6 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];

  if (v7)
  {
    id v8 = [(VSAccountInfoViewController *)self account];
    uint64_t v9 = [v8 username];

    id v10 = [(VSAccountInfoViewController *)self account];
    unsigned __int8 v11 = [v10 isSynchronizable];

    id v12 = +[NSBundle vs_frameworkBundle];
    id v13 = [v12 localizedStringForKey:@"SETTINGS_FOOTER_SYNCHRONIZABLE_NOTE" value:0 table:0];

    if ((v11 & 1) == 0)
    {
      id v14 = +[NSBundle vs_frameworkBundle];
      uint64_t v15 = [v14 localizedStringForKey:@"SETTINGS_FOOTER_NOT_SYNCHRONIZABLE_NOTE_FORMAT" value:0 table:0];

      id v13 = (void *)v15;
    }
    id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v5);
    id v17 = [v9 length];
    id v18 = +[NSBundle vs_frameworkBundle];
    id v19 = v18;
    if (v17)
    {
      uint64_t v20 = [v18 localizedStringForKey:@"SETTINGS_CHANGE_PROVIDER_FOOTER_FORMAT" value:0 table:0];

      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v5, v9, v16);
    }
    else
    {
      uint64_t v20 = [v18 localizedStringForKey:@"SETTINGS_CHANGE_PROVIDER_ANONYMOUS_FOOTER_FORMAT" value:0 table:0];

      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v5, v16, v25);
    long long v23 = };
  }
  else
  {
    long long v21 = +[NSBundle vs_frameworkBundle];
    uint64_t v9 = [v21 localizedStringForKey:@"SETTINGS_CHANGE_PROVIDER_UNSUPPORTED_FOOTER_FORMAT" value:0 table:0];

    id v13 = [(VSAccountInfoViewController *)self account];
    id v16 = [v13 identityProviderDisplayName];
    uint64_t v20 = [(VSAccountInfoViewController *)self account];
    long long v22 = [v20 identityProviderDisplayName];
    long long v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v16, v22);
  }
  [v3 setProperty:v23 forKey:PSFooterTextGroupKey];

  return v3;
}

- (id)createSignOutButtonSpecifier
{
  id v3 = [(VSAccountInfoViewController *)self identityProvider];
  unsigned int v4 = [v3 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];

  id v5 = +[NSBundle vs_frameworkBundle];
  uint64_t v6 = v5;
  if (v4) {
    CFStringRef v7 = @"SIGN_OUT_BUTTON_TITLE";
  }
  else {
    CFStringRef v7 = @"SIGN_OUT_BUTTON_NON_PARTICIPATING_TITLE";
  }
  id v8 = [v5 localizedStringForKey:v7 value:0 table:0];

  uint64_t v9 = +[PSSpecifier deleteButtonSpecifierWithName:v8 target:self action:"_accountUsernameButtonTapped:"];
  [v9 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  [v9 setProperty:@"AccountUsername" forKey:PSIDKey];

  return v9;
}

- (void)disableAccountSignOutButton
{
  v2 = [(VSAccountInfoViewController *)self specifiers];
  id v3 = [v2 specifierForID:@"AccountUsername"];

  [v3 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
}

- (id)_specifierForAppSettingsViewModel:(id)a3 modifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 displayName];
  if ([v8 length])
  {
    uint64_t v9 = +[VSAppInstallCell specifier];
    id v10 = [v6 bundleID];
    unsigned __int8 v11 = +[NSString stringWithFormat:@"app:%@:%@", v7, v10];
    [v9 setProperty:v11 forKey:PSIDKey];

    id v12 = [(VSAccountInfoViewController *)self group];
    [v9 setProperty:v12 forKey:@"VSAppInstallCellLockupGroupKey"];

    id v13 = objc_alloc((Class)ASCAdamID);
    id v14 = [v6 adamID];
    id v15 = [v13 initWithStringValue:v14];

    id v16 = [(VSAccountInfoViewController *)self cachedLockupRequests];
    id v17 = [v16 objectForKeyedSubscript:v15];

    [v9 setProperty:v17 forKey:@"VSAppInstallCellCachedRequestKey"];
    [v9 setProperty:v6 forKey:@"VSAppSettingsViewModel"];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_revokeVoucher:(id)a3
{
  id v3 = [a3 propertyForKey:@"VSAppSettingsViewModel"];
  [v3 revokeVoucher];
}

- (id)_isAppAllowedAccountAccessWithSpecifier:(id)a3
{
  id v3 = [a3 propertyForKey:@"VSAppSettingsViewModel"];
  unsigned int v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 privacyState] == (char *)&dword_0 + 1);

  return v4;
}

- (void)_setAppAllowedAccess:(id)a3 withSpecifier:(id)a4
{
  id v8 = a3;
  id v5 = [a4 propertyForKey:@"VSAppSettingsViewModel"];
  id v6 = (char *)[v5 privacyState];
  if (v6 == (unsigned char *)&dword_0 + 2)
  {
    if ([v8 BOOLValue]) {
      goto LABEL_8;
    }
    uint64_t v7 = 1;
    goto LABEL_7;
  }
  if (v6 == (unsigned char *)&dword_0 + 1 && ([v8 BOOLValue] & 1) != 0)
  {
    uint64_t v7 = 0;
LABEL_7:
    [v5 setAccessGranted:v7];
  }
LABEL_8:
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v4 = [(VSAccountInfoViewController *)self stateMachine];
  id v5 = [v4 currentState];
  id v6 = [v5 forceUnwrapObject];

  if ([v6 isEqualToString:@"Empty"])
  {
    uint64_t v7 = [(VSAccountInfoViewController *)self createHeaderSpecifier];
    [v3 addObject:v7];

    id v8 = [(VSAccountInfoViewController *)self createDecidedSpecifiers];
    [v3 addObjectsFromArray:v8];

    uint64_t v9 = [(VSAccountInfoViewController *)self createLoadingTitleSpecifier];
    [v3 addObject:v9];

    uint64_t v10 = [(VSAccountInfoViewController *)self createLoadingSpecifier];
LABEL_8:
    id v18 = (void *)v10;
    [v3 addObject:v10];

    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"LoadedProvider"])
  {
    unsigned __int8 v11 = [(VSAccountInfoViewController *)self createHeaderSpecifier];
    [v3 addObject:v11];

    id v12 = [(VSAccountInfoViewController *)self createDecidedSpecifiers];
    [v3 addObjectsFromArray:v12];

    id v13 = [(VSAccountInfoViewController *)self createLoadingTitleSpecifier];
    [v3 addObject:v13];

    id v14 = [(VSAccountInfoViewController *)self createLoadingSpecifier];
    [v3 addObject:v14];
LABEL_7:

    id v17 = [(VSAccountInfoViewController *)self createAccountFooterSpecifier];
    [v3 addObject:v17];

    uint64_t v10 = [(VSAccountInfoViewController *)self createSignOutButtonSpecifier];
    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"LoadedProviderAndApps"])
  {
    id v15 = [(VSAccountInfoViewController *)self createHeaderSpecifier];
    [v3 addObject:v15];

    id v16 = [(VSAccountInfoViewController *)self createDecidedSpecifiers];
    [v3 addObjectsFromArray:v16];

    id v14 = [(VSAccountInfoViewController *)self createAppSpecifiers];
    [v3 addObjectsFromArray:v14];
    goto LABEL_7;
  }
LABEL_9:
  id v19 = [v3 copy];
  uint64_t v20 = OBJC_IVAR___PSListController__specifiers;
  long long v21 = *(void **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers] = v19;

  id v22 = *(id *)&self->PSEditableListController_opaque[v20];
  return v22;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)handleDestination:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if ([v8 isEqual:@"signOut"])
  {
    [(VSAccountInfoViewController *)self handleSignOutDestinationWithCompletion:v6];
  }
  else if ([v8 isEqual:@"removeTVProvider"])
  {
    [(VSAccountInfoViewController *)self handleRemoveTVProviderDestinationWithCompletion:v6];
  }
  else
  {
    uint64_t v7 = VSDestinationError();
    v6[2](v6, 0, v7);
  }
}

- (void)handleSignOutDestinationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VSAccountInfoViewController *)self identityProvider];
  unsigned __int8 v6 = [v5 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];

  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_55DC;
    v8[3] = &unk_145C0;
    void v8[4] = self;
    id v9 = v4;
    [(VSAccountInfoViewController *)self scrollToSignOutButtonWithCompletion:v8];
  }
  else
  {
    uint64_t v7 = VSDestinationError();
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
}

- (void)handleRemoveTVProviderDestinationWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = [(VSAccountInfoViewController *)self identityProvider];
  unsigned int v6 = [v5 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];

  if (v6)
  {
    uint64_t v7 = VSDestinationError();
    v4[2](v4, 0, v7);
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_576C;
    v8[3] = &unk_145C0;
    void v8[4] = self;
    id v9 = v4;
    [(VSAccountInfoViewController *)self scrollToSignOutButtonWithCompletion:v8];
  }
}

- (void)scrollToSignOutButtonWithCompletion:(id)a3
{
  unsigned __int8 v11 = (void (**)(id, void, void *))a3;
  id v4 = [(VSAccountInfoViewController *)self specifierForID:@"AccountUsername"];
  uint64_t v5 = PSEnabledKey;
  uint64_t v6 = [v4 propertyForKey:PSEnabledKey];
  if (v6
    && (uint64_t v7 = (void *)v6,
        [v4 propertyForKey:v5],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v8 BOOLValue],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    uint64_t v10 = VSDestinationError();
    v11[2](v11, 0, v10);
  }
  else
  {
    [(VSAccountInfoViewController *)self scrollToSpecifier:v4 withCompletion:v11];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v3 = [(VSAccountInfoViewController *)self table];
  objc_msgSend(v3, "vs_scrollViewDidEndScrollingAnimation");
}

- (void)scrollToSpecifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(VSAccountInfoViewController *)self indexPathForSpecifier:a3];
  if (v7)
  {
    id v8 = [(VSAccountInfoViewController *)self table];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_5A2C;
    v10[3] = &unk_145E8;
    id v11 = v6;
    objc_msgSend(v8, "vs_scrollToIndexPath:atScrollPosition:animated:withCompletion:", v7, 1, 1, v10);
  }
  else
  {
    unsigned __int8 v9 = VSDestinationError();
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v9);
  }
}

- (VSAccount)account
{
  return self->_account;
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (VSPersistentStorage)storage
{
  return self->_storage;
}

- (VSRestrictionsCenter)restrictionsCenter
{
  return self->_restrictionsCenter;
}

- (VSAccountInfoViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VSAccountInfoViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VSAppSettingsFacade)facade
{
  return self->_facade;
}

- (void)setFacade:(id)a3
{
}

- (VSOnboardingInfoCenter)onboardingInfoCenter
{
  return self->_onboardingInfoCenter;
}

- (void)setOnboardingInfoCenter:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (ASCLockupViewGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (VSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (BOOL)isReadyToHandleDeepLinks
{
  return self->_readyToHandleDeepLinks;
}

- (void)setReadyToHandleDeepLinks:(BOOL)a3
{
  self->_readyToHandleDeepLinks = a3;
}

- (NSDictionary)cachedLockupRequests
{
  return self->_cachedLockupRequests;
}

- (void)setCachedLockupRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLockupRequests, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_onboardingInfoCenter, 0);
  objc_storeStrong((id *)&self->_facade, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_restrictionsCenter, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_identityProvider, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end