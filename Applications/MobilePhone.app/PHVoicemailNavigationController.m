@interface PHVoicemailNavigationController
+ ($1FF454C5B48E436092D281DABF654916)badge;
+ (id)_telephonyClient;
+ (id)tabBarIconImage;
+ (id)tabBarIconName;
+ (int)tabViewType;
- (BOOL)active;
- (BOOL)isAccountProvisioningRequired;
- (BOOL)previousAccountProvisioningRequired;
- (BOOL)sharedServiceIsSubscribedPreviousValue;
- (BOOL)shouldSnapshot;
- (MPMessageID)queuedMessage;
- (NSMutableArray)observations;
- (PHVoicemailListProtocol)blockedViewController;
- (PHVoicemailListProtocol)inboxViewController;
- (PHVoicemailListProtocol)trashViewController;
- (PHVoicemailNavigationController)init;
- (PHVoicemailNoContentViewController)noContentViewController;
- (UIAlertController)mailboxStorageAlertController;
- (VMAccountProvisioningViewController)accountProvisioningViewController;
- (_TtC11MobilePhone34LiveVoicemailWelcomeViewController)liveVoicemailWelcomeViewController;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (void)_checkMailboxUsage;
- (void)_handleCTIndicatorsVoicemailNotification:(id)a3;
- (void)_handleMessageWaitingStateChanged:(id)a3;
- (void)_handleOnlineStateChanged:(id)a3;
- (void)_handlePhoneActivationChangedNotification:(id)a3;
- (void)_handleVMVoicemailManagerAccountsDidChangeNotification:(id)a3;
- (void)_handleVoicemailSubscriptionStatusChangedNotification:(id)a3;
- (void)_handleVoicemailsChangedNotification:(id)a3;
- (void)_invalidateBadge;
- (void)_updateUIState;
- (void)_updateUIStateForce:(BOOL)a3;
- (void)accountsViewControllerDidFinish:(id)a3;
- (void)addNotificationObservers;
- (void)dealloc;
- (void)didTapContinueWithViewController:(id)a3;
- (void)didTapSettingsWithViewController:(id)a3;
- (void)handleURL:(id)a3;
- (void)playMessageWithID:(id)a3;
- (void)presentOnboardingIfNeeded;
- (void)removeNotificationObservers;
- (void)setAccountProvisioningViewController:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setLiveVoicemailWelcomeViewController:(id)a3;
- (void)setMailboxStorageAlertController:(id)a3;
- (void)setObservations:(id)a3;
- (void)setPreviousAccountProvisioningRequired:(BOOL)a3;
- (void)setQueuedMessage:(id)a3;
- (void)setSharedServiceIsSubscribedPreviousValue:(BOOL)a3;
- (void)showViewController:(id)a3 playingMessage:(id)a4;
- (void)startObservingPreferences;
- (void)stopObservingPreferences;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PHVoicemailNavigationController

+ ($1FF454C5B48E436092D281DABF654916)badge
{
  if (__PHVoicemailNavigationControllerCachedBadgeIsCurrent == 1)
  {
    v2 = PHDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] returning cached value", buf, 2u);
    }
  }
  else
  {
    v4 = objc_opt_new();
    v5 = [v4 UUIDString];

    v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ fetching fresh value on queue with QOS_CLASS_UTILITY", buf, 0xCu);
    }

    v7 = dispatch_get_global_queue(17, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __40__PHVoicemailNavigationController_badge__block_invoke;
    v10[3] = &unk_10027CA40;
    id v11 = v5;
    id v12 = a1;
    v2 = v5;
    dispatch_async(v7, v10);
  }
  unint64_t v9 = *((void *)&__PHVoicemailNavigationControllerCachedBadge + 1);
  uint64_t v8 = __PHVoicemailNavigationControllerCachedBadge;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

double __40__PHVoicemailNavigationController_badge__block_invoke_88(uint64_t a1)
{
  __PHVoicemailNavigationControllerCachedBadgeIsCurrent = 1;
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v3 = *(_OWORD *)(v2 + 32);
  __PHVoicemailNavigationControllerCachedBadge = v3;
  if (*(unsigned __int8 *)(v2 + 32) != *(unsigned __int8 *)(a1 + 48) || *(void *)(v2 + 40) != *(void *)(a1 + 56))
  {
    v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      v6 = PhoneStringForBadgeValue(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      v7 = PhoneStringForBadgeValue(*(void *)(a1 + 48), *(void *)(a1 + 56));
      int v11 = 138543874;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      v14 = v6;
      __int16 v15 = 2114;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ badge is being updated with %{public}@ from %{public}@", (uint8_t *)&v11, 0x20u);
    }
    PhoneBadgeChanged(*(void **)(a1 + 64));
  }
  if (!(_BYTE)__PHVoicemailNavigationControllerCachedBadge)
  {
    uint64_t v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ Zeroing out badge while we wait for the correct answer.", (uint8_t *)&v11, 0xCu);
    }

    *(void *)&long long v3 = PhoneBadgeKnownZero;
    __PHVoicemailNavigationControllerCachedBadge = PhoneBadgeKnownZero;
  }
  return *(double *)&v3;
}

void __40__PHVoicemailNavigationController_badge__block_invoke(uint64_t a1)
{
  uint64_t v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ running on QOS_CLASS_UTILITY", (uint8_t *)&buf, 0xCu);
  }

  long long v38 = __PHVoicemailNavigationControllerCachedBadge;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v44 = 0x3010000000;
  v45 = "";
  long long v46 = PhoneBadgeKnownZero;
  v4 = +[PHApplicationServices sharedInstance];
  uint64_t v5 = [v4 accountManager];

  v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)v39 = 138543362;
    uint64_t v40 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ Retrieved accountManager", v39, 0xCu);
  }

  unsigned int v8 = [v5 isSubscribed];
  uint64_t v9 = PHDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"NO";
    uint64_t v11 = *(void *)(a1 + 32);
    if (v8) {
      CFStringRef v10 = @"YES";
    }
    *(_DWORD *)v39 = 138543618;
    uint64_t v40 = v11;
    __int16 v41 = 2114;
    CFStringRef v42 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ isSubscribed: %{public}@", v39, 0x16u);
  }

  uint64_t v12 = +[PHApplicationServices sharedInstance];
  __int16 v13 = [v12 voicemailController];
  v14 = [v13 audioMessagesPassingTest:&__block_literal_global_82];
  id v15 = [v14 count];
  *(void *)(*((void *)&buf + 1) + 40) = v15;

  v16 = PHDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    v18 = +[NSNumber numberWithUnsignedLongLong:*(void *)(*((void *)&buf + 1) + 40)];
    *(_DWORD *)v39 = 138543618;
    uint64_t v40 = v17;
    __int16 v41 = 2114;
    CFStringRef v42 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ badgeCount: %{public}@", v39, 0x16u);
  }
  if (v8)
  {
    if (([v5 isOnline] & 1) == 0)
    {
      v19 = PHDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)v39 = 138543362;
        uint64_t v40 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ accountManager is offline", v39, 0xCu);
      }

      if ([v5 isMessageWaiting])
      {
        v21 = PHDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = *(void *)(a1 + 32);
          *(_DWORD *)v39 = 138543362;
          uint64_t v40 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ message is waiting, setting unknown badge", v39, 0xCu);
        }

        *(unsigned char *)(*((void *)&buf + 1) + 32) = 0;
      }
    }
    v23 = PHDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      *(_DWORD *)v39 = 138543362;
      uint64_t v40 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ dispatching to main queue", v39, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __40__PHVoicemailNavigationController_badge__block_invoke_84;
    block[3] = &unk_10027D830;
    v35[1] = &buf;
    v25 = (id *)v35;
    v35[0] = *(id *)(a1 + 32);
    long long v36 = v38;
    uint64_t v37 = *(void *)(a1 + 40);
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v26 = PHDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)v39 = 138543362;
      uint64_t v40 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ getSubscriptionInfo from telephony client", v39, 0xCu);
    }

    v28 = [*(id *)(a1 + 40) _telephonyClient];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __40__PHVoicemailNavigationController_badge__block_invoke_85;
    v31[3] = &unk_10027D880;
    id v29 = *(id *)(a1 + 32);
    uint64_t v30 = *(void *)(a1 + 40);
    v32[0] = v29;
    v32[1] = &buf;
    v32[2] = v30;
    long long v33 = v38;
    [v28 getSubscriptionInfo:v31];

    v25 = (id *)v32;
  }

  _Block_object_dispose(&buf, 8);
}

void __40__PHVoicemailNavigationController_badge__block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __40__PHVoicemailNavigationController_badge__block_invoke_85_cold_1();
    }
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v7 = dispatch_group_create();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v21 = v5;
    unsigned int v8 = [v5 subscriptionsInUse];
    id v9 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isSimHidden", v20) & 1) == 0)
          {
            v14 = PHDefaultLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = *(void *)(a1 + 32);
              *(_DWORD *)long long buf = 138543362;
              uint64_t v36 = v15;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ Starting dispatch groups for subscription contexts.", buf, 0xCu);
            }

            dispatch_group_enter(v7);
            v16 = [*(id *)(a1 + 48) _telephonyClient];
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = __40__PHVoicemailNavigationController_badge__block_invoke_86;
            v27[3] = &unk_10027D858;
            id v28 = *(id *)(a1 + 32);
            uint64_t v17 = v7;
            uint64_t v18 = *(void *)(a1 + 40);
            id v29 = v17;
            uint64_t v30 = v18;
            [v16 getVoicemailInfo:v13 completion:v27];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v10);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __40__PHVoicemailNavigationController_badge__block_invoke_88;
    block[3] = &unk_10027D830;
    long long v25 = *(_OWORD *)(a1 + 56);
    long long v22 = *(_OWORD *)(a1 + 32);
    id v19 = (id)v22;
    long long v24 = v22;
    uint64_t v26 = *(void *)(a1 + 48);
    dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, block);

    id v6 = v20;
    id v5 = v21;
  }
}

+ (id)_telephonyClient
{
  if (_telephonyClient_onceToken_0 != -1) {
    dispatch_once(&_telephonyClient_onceToken_0, &__block_literal_global_15);
  }
  uint64_t v2 = (void *)_telephonyClient_staticTelephonyClient_0;

  return v2;
}

BOOL __40__PHVoicemailNavigationController_badge__block_invoke_79(id a1, MPMessage *a2)
{
  uint64_t v2 = a2;
  BOOL v3 = ([(MPMessage *)v2 isRead] & 1) == 0 && [(MPMessage *)v2 folder] == (id)1;

  return v3;
}

void __40__PHVoicemailNavigationController_badge__block_invoke_86(uint64_t a1, int a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a3;
  id v9 = a5;
  id v10 = PHDefaultLog();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __40__PHVoicemailNavigationController_badge__block_invoke_86_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      if (a2) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      int v15 = 138543874;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      CFStringRef v18 = v13;
      __int16 v19 = 1024;
      unsigned int v20 = [v8 intValue];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ Voicemail info returned available=%@, count=%d", (uint8_t *)&v15, 0x1Cu);
    }

    if (a2)
    {
      int v14 = [v8 intValue];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) += v14 & ~(v14 >> 31);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                             + 40) != 0;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (id)tabBarIconName
{
  uint64_t v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"VOICEMAIL" value:&stru_100285990 table:@"General"];

  return v3;
}

+ (id)tabBarIconImage
{
  return +[UIImage systemImageNamed:@"recordingtape"];
}

- (void)_handleVMVoicemailManagerAccountsDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2112;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v7, 0x16u);
  }
  [(PHVoicemailNavigationController *)self _updateUIState];
}

id __89__PHVoicemailNavigationController__handleVoicemailSubscriptionStatusChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling: %@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) _invalidateBadge];
  return [*(id *)(a1 + 32) _updateUIState];
}

id __72__PHVoicemailNavigationController__handleVoicemailsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "_handleVoicemailsChangedNotification: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) _invalidateBadge];
  return [*(id *)(a1 + 40) _updateUIState];
}

- (void)_updateUIState
{
}

- (void)_updateUIStateForce:(BOOL)a3
{
  if ([(PHVoicemailNavigationController *)self isViewLoaded])
  {
    int v5 = PHPreferencesGetValue(@"FakeVoicemailSetup");
    unsigned int v6 = [v5 BOOLValue];

    BOOL v7 = [(PHVoicemailNavigationController *)self isAccountProvisioningRequired];
    __int16 v8 = [(PhoneNavigationController *)self voicemailController];
    uint64_t v9 = [v8 accountManager];
    if ([v9 isSubscribed]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = (uint64_t)[UIApp launchedToTest];
    }

    if ([UIApp hasEnhancedVoicemail])
    {
      char v11 = 0;
      if (a3) {
        goto LABEL_12;
      }
    }
    else
    {
      char v11 = TUCallScreeningEnabled() ^ 1;
      if (a3) {
        goto LABEL_12;
      }
    }
    if (v7 != [(PHVoicemailNavigationController *)self previousAccountProvisioningRequired]|| ((v10 ^ [(PHVoicemailNavigationController *)self sharedServiceIsSubscribedPreviousValue] | v6) & 1) != 0|| TUCallScreeningEnabled())
    {
LABEL_12:
      if (v7 | v6)
      {
        uint64_t v12 = [(PHVoicemailNavigationController *)self viewControllers];
        CFStringRef v13 = [(PHVoicemailNavigationController *)self accountProvisioningViewController];
        unsigned __int8 v14 = [v12 containsObject:v13];

        if ((v14 & 1) == 0)
        {
          [(PHVoicemailNavigationController *)self setAccountProvisioningViewController:0];
          int v15 = [(PHVoicemailNavigationController *)self accountProvisioningViewController];
          id v28 = v15;
          uint64_t v16 = &v28;
LABEL_21:
          long long v22 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 1, v26, v27, v28);
          [(PhoneNavigationController *)self setViewControllers:v22];
        }
      }
      else
      {
        __int16 v17 = [(PhoneNavigationController *)self voicemailController];
        CFStringRef v18 = [v17 accountManager];
        if (([v18 isSubscribed] & 1) != 0
          || ([UIApp launchedToTest] & 1) != 0
          || (TUCallScreeningEnabled() & 1) != 0)
        {
        }
        else
        {

          if ((v11 & 1) == 0)
          {
            v23 = [(PHVoicemailNavigationController *)self viewControllers];
            long long v24 = [(PHVoicemailNavigationController *)self noContentViewController];
            unsigned __int8 v25 = [v23 containsObject:v24];

            if (v25) {
              goto LABEL_22;
            }
            int v15 = [(PHVoicemailNavigationController *)self noContentViewController];
            uint64_t v26 = v15;
            uint64_t v16 = &v26;
            goto LABEL_21;
          }
        }
        __int16 v19 = [(PHVoicemailNavigationController *)self viewControllers];
        unsigned int v20 = [(PHVoicemailNavigationController *)self inboxViewController];
        unsigned __int8 v21 = [v19 containsObject:v20];

        if ((v21 & 1) == 0)
        {
          int v15 = [(PHVoicemailNavigationController *)self inboxViewController];
          uint64_t v27 = v15;
          uint64_t v16 = &v27;
          goto LABEL_21;
        }
      }
LABEL_22:
      [(PHVoicemailNavigationController *)self setPreviousAccountProvisioningRequired:v7];
      [(PHVoicemailNavigationController *)self setSharedServiceIsSubscribedPreviousValue:v10];
    }
  }
}

- (void)_invalidateBadge
{
  __PHVoicemailNavigationControllerCachedBadgeIsCurrent = 0;
  PhoneBadgeChanged(self);
}

- (void)_handleVoicemailsChangedNotification:(id)a3
{
  id v4 = a3;
  TUGuaranteeExecutionOnMainThreadSync();
  int v5 = [(PHVoicemailNavigationController *)self queuedMessage];

  if (v5)
  {
    unsigned int v6 = [(PHVoicemailNavigationController *)self queuedMessage];
    [(PHVoicemailNavigationController *)self setQueuedMessage:0];
    [(PHVoicemailNavigationController *)self playMessageWithID:v6];
  }
}

- (MPMessageID)queuedMessage
{
  return self->_queuedMessage;
}

- (PHVoicemailNavigationController)init
{
  v4.receiver = self;
  v4.super_class = (Class)PHVoicemailNavigationController;
  uint64_t v2 = [(PHVoicemailNavigationController *)&v4 init];
  if (v2)
  {
    +[PhoneViewController initializeIconAndTitle:v2];
    v2->_active = 1;
    [(PHVoicemailNavigationController *)v2 addNotificationObservers];
  }
  return v2;
}

- (void)addNotificationObservers
{
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_handlePhoneActivationChangedNotification:" name:@"PhoneApplicationActivatedNotification" object:0];
  [v6 addObserver:self selector:"_handlePhoneActivationChangedNotification:" name:@"PhoneApplicationDeactivatedNotification" object:0];
  [v6 addObserver:self selector:"_handleVoicemailsChangedNotification:" name:VMVoicemailVoicemailsChangedNotification object:0];
  [v6 addObserver:self selector:"_handleVoicemailsChangedNotification:" name:@"MPVoicemailControllerMessagesDidChangeNotification" object:0];
  [v6 addObserver:self selector:"_handleVoicemailSubscriptionStatusChangedNotification:" name:VMVoicemailSubscriptionStateStatusChangedNotification object:0];
  [v6 addObserver:self selector:"_handleStorageUsageChangedNotification:" name:VMVoicemailManagerStorageUsageChangedNotification object:0];
  [v6 addObserver:self selector:"_handleApplicationResumeNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
  uint64_t v3 = VMVoicemailManagerAccountsDidChangeNotification;
  objc_super v4 = [(PhoneNavigationController *)self voicemailController];
  int v5 = [v4 voicemailManager];
  [v6 addObserver:self selector:"_handleVMVoicemailManagerAccountsDidChangeNotification:" name:v3 object:v5];

  TUAddTelephonyCenterObserver();
}

void __51__PHVoicemailNavigationController__telephonyClient__block_invoke(id a1)
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.mobilephone.voicemail", 0);
  id v1 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:v3];
  uint64_t v2 = (void *)_telephonyClient_staticTelephonyClient_0;
  _telephonyClient_staticTelephonyClient_0 = (uint64_t)v1;
}

- (void)_handleVoicemailSubscriptionStatusChangedNotification:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TUGuaranteeExecutionOnMainThreadSync();
}

- (void)_handlePhoneActivationChangedNotification:(id)a3
{
  id v12 = a3;
  int v5 = [v12 name];
  unsigned int v6 = [v5 isEqualToString:@"PhoneApplicationActivatedNotification"];

  if (v6)
  {
    self->_active = 1;
  }
  else
  {
    BOOL v7 = [v12 name];
    unsigned int v8 = [v7 isEqualToString:@"PhoneApplicationDeactivatedNotification"];

    if (v8)
    {
      uint64_t v9 = +[PHVoicemailPlayerController sharedPlayerController];
      [v9 pause];

      self->_active = 0;
    }
    else
    {
      uint64_t v10 = +[NSString stringWithFormat:@"Received active notification I don't understand: %@", v12];
      NSLog(@"** TUAssertion failure: %@", v10);

      if (_TUAssertShouldCrashApplication())
      {
        char v11 = +[NSAssertionHandler currentHandler];
        [v11 handleFailureInMethod:a2, self, @"PHVoicemailNavigationController.m", 510, @"Received active notification I don't understand: %@", v12 object file lineNumber description];
      }
    }
  }
}

+ (int)tabViewType
{
  return 5;
}

void __40__PHVoicemailNavigationController_badge__block_invoke_84(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 32))
  {
    int v3 = 1;
  }
  else
  {
    id v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ badge is unknown, setting badge to PhoneBadgeKnownZero", (uint8_t *)&v10, 0xCu);
    }

    *(_OWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = PhoneBadgeKnownZero;
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    int v3 = *(unsigned __int8 *)(v2 + 32);
  }
  __PHVoicemailNavigationControllerCachedBadgeIsCurrent = 1;
  __PHVoicemailNavigationControllerCachedBadge = *(_OWORD *)(v2 + 32);
  if (v3 != *(unsigned __int8 *)(a1 + 48) || *(void *)(v2 + 40) != *(void *)(a1 + 56))
  {
    unsigned int v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      unsigned int v8 = PhoneStringForBadgeValue(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      uint64_t v9 = PhoneStringForBadgeValue(*(void *)(a1 + 48), *(void *)(a1 + 56));
      int v10 = 138543874;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      CFStringRef v13 = v8;
      __int16 v14 = 2114;
      int v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "+[VoicemailNavigationController badge] %{public}@ badge is being updated with %{public}@ from %{public}@", (uint8_t *)&v10, 0x20u);
    }
    PhoneBadgeChanged(*(void **)(a1 + 64));
  }
}

- (BOOL)shouldSnapshot
{
  return 1;
}

- (void)dealloc
{
  [(PHVoicemailNavigationController *)self removeNotificationObservers];
  v3.receiver = self;
  v3.super_class = (Class)PHVoicemailNavigationController;
  [(PhoneNavigationController *)&v3 dealloc];
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  +[CATransaction begin];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __67__PHVoicemailNavigationController_popToRootViewControllerAnimated___block_invoke;
  v8[3] = &unk_10027C670;
  v8[4] = self;
  +[CATransaction setCompletionBlock:v8];
  v7.receiver = self;
  v7.super_class = (Class)PHVoicemailNavigationController;
  uint64_t v5 = [(PHVoicemailNavigationController *)&v7 popToRootViewControllerAnimated:v3];
  +[CATransaction commit];

  return v5;
}

void __67__PHVoicemailNavigationController_popToRootViewControllerAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 48);
  if (v3)
  {
    unsigned __int8 v4 = [v3 hasContentToDisplay];
    uint64_t v2 = *(void *)(a1 + 32);
    if ((v4 & 1) == 0)
    {
      uint64_t v5 = *(void **)(v2 + 48);
      *(void *)(v2 + 48) = 0;

      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  if (*(void *)(v2 + 56) && ([*(id *)(v2 + 48) hasContentToDisplay] & 1) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    objc_super v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = 0;
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PHVoicemailNavigationController;
  [(PHVoicemailNavigationController *)&v7 viewDidLoad];
  BOOL v3 = [(PHVoicemailNavigationController *)self navigationBar];
  [v3 setPrefersLargeTitles:1];

  [(PHVoicemailNavigationController *)self _updateUIStateForce:1];
  unsigned __int8 v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"handleApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
  [(PHVoicemailNavigationController *)self _checkMailboxUsage];
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(PHVoicemailNavigationController *)self tabBarItem];
  [v6 setStandardAppearance:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHVoicemailNavigationController;
  [(PHVoicemailNavigationController *)&v8 viewDidAppear:a3];
  unsigned __int8 v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "VoicemailNavigationController viewDidAppear:", v7, 2u);
  }

  uint64_t v5 = createPHPhoneTabBarControllerTabViewDidAppearNotificationInfo(5, self);
  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"PHPhoneTabBarControllerTabViewDidAppearNotification" object:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHVoicemailNavigationController;
  [(PHVoicemailNavigationController *)&v4 viewWillAppear:a3];
  [(PHVoicemailNavigationController *)self presentOnboardingIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHVoicemailNavigationController;
  [(PHVoicemailNavigationController *)&v5 viewWillDisappear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];
}

- (void)presentOnboardingIfNeeded
{
  if (+[LiveVoicemailWelcomeViewController shouldShowVoicemailOnboarding])
  {
    BOOL v3 = [(PHVoicemailNavigationController *)self presentedViewController];
    objc_super v4 = [(PHVoicemailNavigationController *)self liveVoicemailWelcomeViewController];

    if (v3 != v4)
    {
      id v5 = [(PHVoicemailNavigationController *)self liveVoicemailWelcomeViewController];
      [(PhoneNavigationController *)self presentViewController:v5 animated:1 completion:0];
    }
  }
}

- (void)showViewController:(id)a3 playingMessage:(id)a4
{
  id v8 = a4;
  id v6 = [a3 copy];
  [(PhoneNavigationController *)self setViewControllers:v6];

  objc_super v7 = [(PHVoicemailNavigationController *)self topViewController];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 playMessage:v8];
    }
  }
}

- (void)playMessageWithID:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__3;
  v11[4] = __Block_byref_object_dispose__3;
  id v5 = [(PHVoicemailNavigationController *)self inboxViewController];
  id v12 = +[NSMutableArray arrayWithObject:v5];

  id v6 = [(PhoneNavigationController *)self voicemailController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __53__PHVoicemailNavigationController_playMessageWithID___block_invoke;
  v8[3] = &unk_10027D8D0;
  int v10 = v11;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [v6 messageForIdentifier:v7 completionBlock:v8];

  _Block_object_dispose(v11, 8);
}

void __53__PHVoicemailNavigationController_playMessageWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSOperationQueue mainQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __53__PHVoicemailNavigationController_playMessageWithID___block_invoke_2;
  v9[3] = &unk_10027D8A8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v5;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v8;
  long long v12 = v8;
  id v7 = v3;
  [v4 addOperationWithBlock:v9];
}

id __53__PHVoicemailNavigationController_playMessageWithID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if ([v2 folder] == (id)4)
    {
      id v3 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v4 = [*(id *)(a1 + 40) blockedViewController];
    }
    else
    {
      if ([*(id *)(a1 + 32) folder] != (id)2)
      {
LABEL_10:
        id v9 = PHDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(a1 + 32);
          int v11 = 138412290;
          uint64_t v12 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting to play message %@", (uint8_t *)&v11, 0xCu);
        }

        return [*(id *)(a1 + 40) showViewController:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) playingMessage:*(void *)(a1 + 32)];
      }
      id v3 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v4 = [*(id *)(a1 + 40) trashViewController];
    }
    long long v8 = (void *)v4;
    [v3 addObject:v4];

    goto LABEL_10;
  }
  uint64_t v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    int v11 = 138412290;
    uint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Could not find message from ID %@", (uint8_t *)&v11, 0xCu);
  }

  return [*(id *)(a1 + 40) setQueuedMessage:*(void *)(a1 + 48)];
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 voicemailRecordID];
  uint64_t v6 = [v4 voicemailMessageUUID];
  if (v6)
  {
    id v7 = objc_opt_new();
    unsigned __int8 v8 = [v7 callScreeningEnabled];

    if ((v8 & 1) == 0)
    {
      id v9 = PHDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[PHVoicemailNavigationController handleURL:]((uint64_t)v4, v9);
      }
    }
    uint64_t v10 = [[MPMessageID alloc] initWithUuid:v6];
  }
  else
  {
    if (v5 < 1)
    {
LABEL_15:
      __int16 v14 = [(PHVoicemailNavigationController *)self inboxViewController];
      uint64_t v16 = v14;
      int v15 = +[NSArray arrayWithObjects:&v16 count:1];
      [(PHVoicemailNavigationController *)self showViewController:v15 playingMessage:0];

      goto LABEL_16;
    }
    int v11 = objc_opt_new();
    unsigned int v12 = [v11 callScreeningEnabled];

    if (v12)
    {
      CFStringRef v13 = PHDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[PHVoicemailNavigationController handleURL:]((uint64_t)v4, v13);
      }
    }
    uint64_t v10 = [[MPMessageID alloc] initWithValue:v5];
  }
  __int16 v14 = v10;
  if (!v10) {
    goto LABEL_15;
  }
  [(PHVoicemailNavigationController *)self playMessageWithID:v10];
LABEL_16:
}

- (void)_checkMailboxUsage
{
  id v3 = [(PHVoicemailNavigationController *)self mailboxStorageAlertController];
  if (!v3
    || ([(PHVoicemailNavigationController *)self mailboxStorageAlertController],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isBeingPresented],
        v4,
        v3,
        !v5))
  {
    id v7 = [(PhoneNavigationController *)self voicemailController];
    unsigned __int8 v8 = [v7 accountManager];
    id v9 = [v8 storageUsage];

    uint64_t v10 = (void *)kVVLastWarnedUsageDefault;
    uint64_t v6 = PHPreferencesGetValue(kVVLastWarnedUsageDefault);
    int v11 = PHDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v27 = v6;
      __int16 v28 = 2048;
      id v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "_checkMailboxUsage - hasLastWarnedValue = %@, current mailbox usage = %lu", buf, 0x16u);
    }

    if ((unint64_t)v9 >= 0x5A)
    {
      if (!v6 || (unint64_t)v9 > (int)[v6 intValue])
      {
        id v12 = objc_alloc((Class)NSString);
        CFStringRef v13 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        __int16 v14 = [v13 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_CAPACITY_%lu_WARNING" value:&stru_100285990 table:@"Voicemail"];
        id v15 = [v12 initWithFormat:v14, v9];

        uint64_t v16 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        __int16 v17 = [v16 localizedStringForKey:@"WARNING" value:&stru_100285990 table:@"Voicemail"];
        CFStringRef v18 = +[UIAlertController alertControllerWithTitle:v17 message:v15 preferredStyle:1];
        [(PHVoicemailNavigationController *)self setMailboxStorageAlertController:v18];

        objc_initWeak((id *)buf, self);
        __int16 v19 = [(PHVoicemailNavigationController *)self mailboxStorageAlertController];
        unsigned int v20 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
        unsigned __int8 v21 = [v20 localizedStringForKey:@"OK" value:&stru_100285990 table:@"Voicemail"];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = __53__PHVoicemailNavigationController__checkMailboxUsage__block_invoke;
        v24[3] = &unk_10027D8F8;
        v25[1] = v9;
        objc_copyWeak(v25, (id *)buf);
        long long v22 = +[UIAlertAction actionWithTitle:v21 style:0 handler:v24];
        [v19 addAction:v22];

        v23 = [(PHVoicemailNavigationController *)self mailboxStorageAlertController];
        [(PhoneNavigationController *)self presentViewController:v23 animated:1 completion:0];

        objc_destroyWeak(v25);
        objc_destroyWeak((id *)buf);

        goto LABEL_12;
      }
      if ((unint64_t)v9 >= (int)[v6 intValue]) {
        goto LABEL_12;
      }
    }
    PHPreferencesSetValueInDomain(v10, 0, 0);
    goto LABEL_12;
  }
  uint64_t v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_checkMailboxUsage - deferring mailbox usage check, since we're already showing a mailbox alert", buf, 2u);
  }
LABEL_12:
}

void __53__PHVoicemailNavigationController__checkMailboxUsage__block_invoke(uint64_t a1)
{
  id v1 = (id *)a1;
  uint64_t v2 = (void *)kVVLastWarnedUsageDefault;
  id v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  PHPreferencesSetValueInDomain(v2, v3, 0);

  v1 += 4;
  id WeakRetained = objc_loadWeakRetained(v1);
  unsigned int v5 = [WeakRetained mailboxStorageAlertController];
  [v5 dismissViewControllerAnimated:1 completion:0];

  id v6 = objc_loadWeakRetained(v1);
  [v6 setMailboxStorageAlertController:0];

  id v7 = objc_loadWeakRetained(v1);
  [v7 _checkMailboxUsage];
}

- (void)removeNotificationObservers
{
  TURemoveEveryTelephonyCenterObserver();
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)_handleOnlineStateChanged:(id)a3
{
  id v4 = a3;
  unsigned int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_handleOnlineStateChanged: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PHVoicemailNavigationController *)self _invalidateBadge];
}

- (void)_handleMessageWaitingStateChanged:(id)a3
{
  id v4 = a3;
  unsigned int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_handleMessageWaitingStateChanged: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PHVoicemailNavigationController *)self _invalidateBadge];
}

- (void)_handleCTIndicatorsVoicemailNotification:(id)a3
{
  id v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling CT indicators notification by invalidating badge count", v5, 2u);
  }

  [(PHVoicemailNavigationController *)self _invalidateBadge];
}

- (void)accountsViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(PHVoicemailNavigationController *)self accountProvisioningViewController];

  if (v5 == v4)
  {
    [(PHVoicemailNavigationController *)self setAccountProvisioningViewController:0];
    [(PHVoicemailNavigationController *)self _updateUIStateForce:1];
  }
}

- (PHVoicemailListProtocol)inboxViewController
{
  inboxViewController = self->_inboxViewController;
  if (!inboxViewController)
  {
    id v4 = [PHVoicemailInboxListViewController alloc];
    id v5 = [(PhoneNavigationController *)self voicemailController];
    int v6 = [(PHVoicemailInboxListViewController *)v4 initWithNavigationController:self voicemailController:v5];
    id v7 = self->_inboxViewController;
    self->_inboxViewController = v6;

    inboxViewController = self->_inboxViewController;
  }

  return inboxViewController;
}

- (PHVoicemailListProtocol)trashViewController
{
  trashViewController = self->_trashViewController;
  if (!trashViewController)
  {
    id v4 = [PHVoicemailTrashListViewController alloc];
    id v5 = [(PhoneNavigationController *)self voicemailController];
    int v6 = [(MPVoicemailTableViewController *)v4 initWithNavigationController:self voicemailController:v5];
    id v7 = self->_trashViewController;
    self->_trashViewController = v6;

    trashViewController = self->_trashViewController;
  }

  return trashViewController;
}

- (PHVoicemailListProtocol)blockedViewController
{
  blockedViewController = self->_blockedViewController;
  if (!blockedViewController)
  {
    id v4 = [PHVoicemailBlockedListViewController alloc];
    id v5 = [(PhoneNavigationController *)self voicemailController];
    int v6 = [(MPVoicemailTableViewController *)v4 initWithNavigationController:self voicemailController:v5];
    id v7 = self->_blockedViewController;
    self->_blockedViewController = v6;

    blockedViewController = self->_blockedViewController;
  }

  return blockedViewController;
}

- (_TtC11MobilePhone34LiveVoicemailWelcomeViewController)liveVoicemailWelcomeViewController
{
  liveVoicemailWelcomeViewController = self->_liveVoicemailWelcomeViewController;
  if (!liveVoicemailWelcomeViewController)
  {
    id v4 = [[_TtC11MobilePhone34LiveVoicemailWelcomeViewController alloc] initWithDelegate:self];
    id v5 = self->_liveVoicemailWelcomeViewController;
    self->_liveVoicemailWelcomeViewController = v4;

    liveVoicemailWelcomeViewController = self->_liveVoicemailWelcomeViewController;
  }

  return liveVoicemailWelcomeViewController;
}

- (PHVoicemailNoContentViewController)noContentViewController
{
  noContentViewController = self->_noContentViewController;
  if (!noContentViewController)
  {
    id v4 = objc_alloc_init(PHVoicemailNoContentViewController);
    id v5 = self->_noContentViewController;
    self->_noContentViewController = v4;

    noContentViewController = self->_noContentViewController;
  }

  return noContentViewController;
}

- (void)didTapContinueWithViewController:(id)a3
{
}

- (void)didTapSettingsWithViewController:(id)a3
{
}

- (VMAccountProvisioningViewController)accountProvisioningViewController
{
  accountProvisioningViewController = self->_accountProvisioningViewController;
  if (!accountProvisioningViewController)
  {
    id v4 = [VMAccountProvisioningViewController alloc];
    id v5 = [(PhoneNavigationController *)self voicemailController];
    int v6 = [v5 accountManager];
    id v7 = [(VMViewController *)v4 initWithManager:v6];
    unsigned __int8 v8 = self->_accountProvisioningViewController;
    self->_accountProvisioningViewController = v7;

    [(VMAccountsViewController *)self->_accountProvisioningViewController setDelegate:self];
    accountProvisioningViewController = self->_accountProvisioningViewController;
  }

  return accountProvisioningViewController;
}

- (BOOL)previousAccountProvisioningRequired
{
  return self->_previousAccountProvisioningRequired;
}

- (void)setPreviousAccountProvisioningRequired:(BOOL)a3
{
  self->_previousAccountProvisioningRequired = a3;
}

- (void)setAccountProvisioningViewController:(id)a3
{
}

- (UIAlertController)mailboxStorageAlertController
{
  return self->_mailboxStorageAlertController;
}

- (void)setMailboxStorageAlertController:(id)a3
{
}

- (BOOL)sharedServiceIsSubscribedPreviousValue
{
  return self->_sharedServiceIsSubscribedPreviousValue;
}

- (void)setSharedServiceIsSubscribedPreviousValue:(BOOL)a3
{
  self->_sharedServiceIsSubscribedPreviousValue = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void)setQueuedMessage:(id)a3
{
}

- (void)setLiveVoicemailWelcomeViewController:(id)a3
{
}

- (NSMutableArray)observations
{
  return self->_observations;
}

- (void)setObservations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observations, 0);
  objc_storeStrong((id *)&self->_liveVoicemailWelcomeViewController, 0);
  objc_storeStrong((id *)&self->_queuedMessage, 0);
  objc_storeStrong((id *)&self->_mailboxStorageAlertController, 0);
  objc_storeStrong((id *)&self->_accountProvisioningViewController, 0);
  objc_storeStrong((id *)&self->_noContentViewController, 0);
  objc_storeStrong((id *)&self->_blockedViewController, 0);
  objc_storeStrong((id *)&self->_trashViewController, 0);

  objc_storeStrong((id *)&self->_inboxViewController, 0);
}

- (void)startObservingPreferences
{
  uint64_t v2 = self;
  PHVoicemailNavigationController.startObservingPreferences()();
}

- (void)stopObservingPreferences
{
  type metadata accessor for VMAccount(0, (unint64_t *)&lazy cache variable for type metadata for NSMutableArray);
  id v3 = self;
  id v4 = (id)NSArray.init(arrayLiteral:)();
  [(PHVoicemailNavigationController *)v3 setObservations:v4];
}

- (BOOL)isAccountProvisioningRequired
{
  uint64_t v2 = self;
  char v3 = PHVoicemailNavigationController.isAccountProvisioningRequired.getter();

  return v3 & 1;
}

void __40__PHVoicemailNavigationController_badge__block_invoke_85_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "+[VoicemailNavigationController badge] %{public}@ Unable to get subscription information: %@");
}

void __40__PHVoicemailNavigationController_badge__block_invoke_86_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "+[VoicemailNavigationController badge] %{public}@ Unable to get voicemail information: %@");
}

- (void)handleURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Received unsupported vmshow action. URL=%{PUBLIC}@ please clone a radar for originator of URL. Expected format vmshow:?uuid=", (uint8_t *)&v2, 0xCu);
}

- (void)handleURL:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Received unsupported vmshow action. URL=%{PUBLIC}@ please clone a radar for originator of URL. Expected format vmshow:?recordID=", (uint8_t *)&v2, 0xCu);
}

@end