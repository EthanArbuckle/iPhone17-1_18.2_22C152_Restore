@interface CSNotificationDispatcher
- (BOOL)canReceiveNotificationRequest:(id)a3;
- (BOOL)dismissNotificationInLongLookAnimated:(BOOL)a3;
- (BOOL)interceptsQueueRequest:(id)a3;
- (BOOL)isActive;
- (BOOL)isNotificationContentExtensionVisible:(id)a3;
- (BOOL)isPresentingNotificationInLongLook;
- (BSServiceConnectionEndpoint)endpoint;
- (CSBehavior)activeBehavior;
- (CSCarPlayStatusProviding)carPlayStatusProvider;
- (CSNotificationDestination)listDestination;
- (CSNotificationDestination)modalDestination;
- (NCNotificationDestinationDelegate)delegate;
- (NSString)coverSheetIdentifier;
- (NSString)identifier;
- (SBNCAlertingController)alertingController;
- (id)destination:(id)a3 notificationRequestForUUID:(id)a4;
- (id)destination:(id)a3 settingsForSectionIdentifier:(id)a4;
- (id)notificationSectionSettingsForDestination:(id)a3;
- (id)notificationSystemSettingsForDestination:(id)a3;
- (int64_t)participantState;
- (void)_clearNotificationRequestsFromIncomingSection:(id)a3;
- (void)destination:(id)a3 clearNotificationRequests:(id)a4;
- (void)destination:(id)a3 clearNotificationRequestsFromDate:(id)a4 toDate:(id)a5 inSections:(id)a6;
- (void)destination:(id)a3 clearNotificationRequestsFromIncomingSection:(id)a4;
- (void)destination:(id)a3 clearNotificationRequestsInSections:(id)a4;
- (void)destination:(id)a3 performAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8;
- (void)destination:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotificationRequest:(id)a5 withParameters:(id)a6 completion:(id)a7;
- (void)destination:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)destination:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)destination:(id)a3 setAllowsNotifications:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)destination:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)destination:(id)a3 setDeliverQuietly:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)destination:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7;
- (void)destination:(id)a3 setNotificationSystemSettings:(id)a4;
- (void)destination:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)destination:(id)a3 setSystemScheduledDeliveryEnabled:(BOOL)a4 scheduledDeliveryTimes:(id)a5;
- (void)modifyNotificationRequest:(id)a3;
- (void)notificationsLoadedForSectionIdentifier:(id)a3;
- (void)postNotificationRequest:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setActiveBehavior:(id)a3;
- (void)setAlertingController:(id)a3;
- (void)setBannerDestinationUnavailable:(BOOL)a3 forReason:(id)a4;
- (void)setCarPlayStatusProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListDestination:(id)a3;
- (void)setModalDestination:(id)a3;
- (void)stopAllRealerts;
- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4;
- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4;
- (void)withdrawNotificationRequest:(id)a3;
@end

@implementation CSNotificationDispatcher

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3) {
      v4 = self;
    }
    else {
      v4 = 0;
    }
    v5 = v4;
    id v6 = [(CSNotificationDispatcher *)self modalDestination];
    [v6 setDispatcher:v5];
  }
}

- (void)setBannerDestinationUnavailable:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  bannerDestinationSuppressionReasons = self->_bannerDestinationSuppressionReasons;
  id v10 = v6;
  if (v4)
  {
    if (!bannerDestinationSuppressionReasons)
    {
      v8 = [MEMORY[0x1E4F1CA80] set];
      v9 = self->_bannerDestinationSuppressionReasons;
      self->_bannerDestinationSuppressionReasons = v8;

      id v6 = v10;
      bannerDestinationSuppressionReasons = self->_bannerDestinationSuppressionReasons;
    }
    [(NSMutableSet *)bannerDestinationSuppressionReasons addObject:v6];
  }
  else
  {
    [(NSMutableSet *)bannerDestinationSuppressionReasons removeObject:v6];
  }
}

- (BOOL)isNotificationContentExtensionVisible:(id)a3
{
  id v4 = a3;
  if ([(CSNotificationDispatcher *)self isActive])
  {
    v5 = [(CSNotificationDispatcher *)self listDestination];
    char v6 = [v5 isNotificationContentExtensionVisible:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isPresentingNotificationInLongLook
{
  BOOL v3 = [(CSNotificationDispatcher *)self isActive];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listDestination);
    char v5 = [WeakRetained isPresentingNotificationInLongLook];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)dismissNotificationInLongLookAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CSNotificationDispatcher *)self isActive];
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listDestination);
    char v7 = [WeakRetained dismissNotificationInLongLookAnimated:v3];

    LOBYTE(v5) = v7;
  }
  return v5;
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x1E4FB3858];
}

- (BSServiceConnectionEndpoint)endpoint
{
  return (BSServiceConnectionEndpoint *)MEMORY[0x1F415C338](self, a2);
}

- (BOOL)interceptsQueueRequest:(id)a3
{
  id v4 = a3;
  if (![(CSNotificationDispatcher *)self isActive]) {
    goto LABEL_4;
  }
  BOOL v5 = [(CSNotificationDispatcher *)self activeBehavior];
  uint64_t v6 = [v5 notificationBehavior];

  if (v6 == 3
    || ([(CSNotificationDispatcher *)self activeBehavior],
        char v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 notificationBehavior],
        v7,
        v8 == 2))
  {
LABEL_4:
    LOBYTE(v9) = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_carPlayStatusProvider);
    int v12 = [WeakRetained isCarPlayActiveForNotifications];

    if (v12)
    {
      v13 = [v4 requestDestinations];
      int v9 = [v13 containsObject:*MEMORY[0x1E4FB3850]] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }

  return v9;
}

- (BOOL)canReceiveNotificationRequest:(id)a3
{
  return 1;
}

- (void)postNotificationRequest:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 options];
  int v6 = [v5 requestsFullScreenPresentation];

  if (!v6)
  {
    if (![(CSNotificationDispatcher *)self isActive])
    {
      v18 = [v4 options];
      if ([v18 addToLockScreenWhenUnlocked])
      {
      }
      else
      {
        v28 = [v4 requestDestinations];
        int v29 = [v28 containsObject:*MEMORY[0x1E4FB3868]];

        if (!v29)
        {
          v45 = (void *)*MEMORY[0x1E4FB3750];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
          {
            int v12 = v45;
            v46 = (objc_class *)objc_opt_class();
            v14 = NSStringFromClass(v46);
            v15 = [v4 notificationIdentifier];
            v16 = objc_msgSend(v15, "un_logDigest");
            int v47 = 138543618;
            v48 = v14;
            __int16 v49 = 2114;
            v50 = v16;
            v17 = "Destination %{public}@ ignoring received notification %{public}@";
            goto LABEL_26;
          }
          goto LABEL_27;
        }
      }
    }
    v30 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      v32 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v32);
      v34 = [v4 notificationIdentifier];
      v35 = objc_msgSend(v34, "un_logDigest");
      int v47 = 138543618;
      v48 = v33;
      __int16 v49 = 2114;
      v50 = v35;
      _os_log_impl(&dword_1D839D000, v31, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received notification %{public}@", (uint8_t *)&v47, 0x16u);
    }
    v27 = [(CSNotificationDispatcher *)self listDestination];
    goto LABEL_17;
  }
  char v7 = [(CSNotificationDispatcher *)self activeBehavior];
  uint64_t v8 = [v7 notificationBehavior];

  if (v8 == 2)
  {
    uint64_t v9 = [(NSMutableSet *)self->_bannerDestinationSuppressionReasons count];
    id v10 = (void *)*MEMORY[0x1E4FB3750];
    BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        int v12 = v10;
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = [v4 notificationIdentifier];
        v16 = objc_msgSend(v15, "un_logDigest");
        int v47 = 138543618;
        v48 = v14;
        __int16 v49 = 2114;
        v50 = v16;
        v17 = "Destination %{public}@ ignoring received full screen notification due to temporary notification behavior %{public}@";
LABEL_26:
        _os_log_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v47, 0x16u);

        goto LABEL_27;
      }
      goto LABEL_27;
    }
    if (v11)
    {
      v38 = v10;
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      v41 = [v4 notificationIdentifier];
      v42 = objc_msgSend(v41, "un_logDigest");
      int v47 = 138543618;
      v48 = v40;
      __int16 v49 = 2114;
      v50 = v42;
      _os_log_impl(&dword_1D839D000, v38, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ converting received full screen notification to banner due to temporary notification behavior %{public}@", (uint8_t *)&v47, 0x16u);
    }
    v36 = [MEMORY[0x1E4F42738] sharedApplication];
    v43 = [v36 notificationDispatcher];
    v44 = [v43 bannerDestination];
    [v44 postNotificationRequest:v4];

LABEL_18:
    goto LABEL_27;
  }
  BOOL v19 = [(CSNotificationDispatcher *)self isActive];
  v20 = (void *)*MEMORY[0x1E4FB3750];
  BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      v22 = v20;
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      v25 = [v4 notificationIdentifier];
      v26 = objc_msgSend(v25, "un_logDigest");
      int v47 = 138543618;
      v48 = v24;
      __int16 v49 = 2114;
      v50 = v26;
      _os_log_impl(&dword_1D839D000, v22, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received full screen notification %{public}@", (uint8_t *)&v47, 0x16u);
    }
    v27 = [(CSNotificationDispatcher *)self modalDestination];
LABEL_17:
    v36 = v27;
    [v27 postNotificationRequest:v4];
    goto LABEL_18;
  }
  if (v21)
  {
    int v12 = v20;
    v37 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v37);
    v15 = [v4 notificationIdentifier];
    v16 = objc_msgSend(v15, "un_logDigest");
    int v47 = 138543618;
    v48 = v14;
    __int16 v49 = 2114;
    v50 = v16;
    v17 = "Destination %{public}@ ignoring received full screen notification %{public}@";
    goto LABEL_26;
  }
LABEL_27:
}

- (void)modifyNotificationRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    char v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = [v4 notificationIdentifier];
    id v10 = objc_msgSend(v9, "un_logDigest");
    int v14 = 138543618;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ modifying notification %{public}@", (uint8_t *)&v14, 0x16u);
  }
  BOOL v11 = [v4 options];
  int v12 = [v11 requestsFullScreenPresentation];

  if (v12) {
    [(CSNotificationDispatcher *)self modalDestination];
  }
  else {
  v13 = [(CSNotificationDispatcher *)self listDestination];
  }
  [v13 updateNotificationRequest:v4];
}

- (void)withdrawNotificationRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    char v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = [v4 notificationIdentifier];
    id v10 = objc_msgSend(v9, "un_logDigest");
    int v14 = 138543618;
    v15 = v8;
    __int16 v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ withdrawing notification %{public}@", (uint8_t *)&v14, 0x16u);
  }
  BOOL v11 = [v4 options];
  int v12 = [v11 requestsFullScreenPresentation];

  if (v12) {
    [(CSNotificationDispatcher *)self modalDestination];
  }
  else {
  v13 = [(CSNotificationDispatcher *)self listDestination];
  }
  [v13 withdrawNotificationRequest:v4];
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CSNotificationDispatcher *)self modalDestination];
  [v8 updateNotificationSectionSettings:v7 previousSectionSettings:v6];

  id v9 = [(CSNotificationDispatcher *)self listDestination];
  [v9 updateNotificationSectionSettings:v7 previousSectionSettings:v6];
}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CSNotificationDispatcher *)self modalDestination];
  [v8 updateNotificationSystemSettings:v7 previousSystemSettings:v6];

  id v9 = [(CSNotificationDispatcher *)self listDestination];
  [v9 updateNotificationSystemSettings:v7 previousSystemSettings:v6];
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSNotificationDispatcher *)self listDestination];
  [v5 notificationsLoadedForSectionIdentifier:v4];
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if ([(CSNotificationDispatcher *)self isActive]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)destination:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotificationRequest:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = [(CSNotificationDispatcher *)self delegate];
  [v15 destination:self requestPermissionToExecuteAction:v14 forNotificationRequest:v13 withParameters:v12 completion:v11];
}

- (void)destination:(id)a3 performAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8
{
  BOOL v9 = a6;
  id v13 = a8;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = [(CSNotificationDispatcher *)self delegate];
  [v17 destination:self executeAction:v16 forNotificationRequest:v15 requestAuthentication:v9 withParameters:v14 completion:v13];
}

- (void)destination:(id)a3 clearNotificationRequests:(id)a4
{
  id v5 = a4;
  id v6 = [(CSNotificationDispatcher *)self delegate];
  [v6 destination:self requestsClearingNotificationRequests:v5];
}

- (void)destination:(id)a3 clearNotificationRequestsFromIncomingSection:(id)a4
{
}

- (void)destination:(id)a3 clearNotificationRequestsInSections:(id)a4
{
  id v5 = a4;
  id v6 = [(CSNotificationDispatcher *)self delegate];
  [v6 destination:self requestsClearingNotificationRequestsInSections:v5];
}

- (void)destination:(id)a3 clearNotificationRequestsFromDate:(id)a4 toDate:(id)a5 inSections:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(CSNotificationDispatcher *)self delegate];
  [v12 destination:self requestsClearingNotificationRequestsFromDate:v11 toDate:v10 inSections:v9];
}

- (void)destination:(id)a3 setAllowsNotifications:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v7 = [(CSNotificationDispatcher *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 destination:self setAllowsNotifications:v5 forSectionIdentifier:v8];
  }
}

- (void)destination:(id)a3 setDeliverQuietly:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v7 = [(CSNotificationDispatcher *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 destination:self setDeliverQuietly:v5 forSectionIdentifier:v8];
  }
}

- (void)destination:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  BOOL v9 = a4;
  id v14 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = [(CSNotificationDispatcher *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v13 destination:self setMuted:v9 untilDate:v14 forSectionIdentifier:v11 threadIdentifier:v12];
  }
}

- (void)destination:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v7 = [(CSNotificationDispatcher *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 destination:self setAllowsCriticalAlerts:v5 forSectionIdentifier:v8];
  }
}

- (void)destination:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v7 = [(CSNotificationDispatcher *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 destination:self setAllowsTimeSensitive:v5 forSectionIdentifier:v8];
  }
}

- (void)destination:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v7 = [(CSNotificationDispatcher *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 destination:self setAllowsDirectMessages:v5 forSectionIdentifier:v8];
  }
}

- (void)destination:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v7 = [(CSNotificationDispatcher *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 destination:self setScheduledDelivery:v5 forSectionIdentifier:v8];
  }
}

- (void)destination:(id)a3 setSystemScheduledDeliveryEnabled:(BOOL)a4 scheduledDeliveryTimes:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v7 = [(CSNotificationDispatcher *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 destination:self setSystemScheduledDeliveryEnabled:v5 scheduledDeliveryTimes:v8];
  }
}

- (id)destination:(id)a3 notificationRequestForUUID:(id)a4
{
  id v5 = a4;
  id v6 = [(CSNotificationDispatcher *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 destination:self notificationRequestForUUID:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)destination:(id)a3 settingsForSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(CSNotificationDispatcher *)self delegate];
  id v7 = [v6 notificationSectionSettingsForDestination:self forSectionIdentifier:v5];

  return v7;
}

- (id)notificationSectionSettingsForDestination:(id)a3
{
  id v4 = [(CSNotificationDispatcher *)self delegate];
  id v5 = [v4 notificationSectionSettingsForDestination:self];

  return v5;
}

- (id)notificationSystemSettingsForDestination:(id)a3
{
  id v4 = [(CSNotificationDispatcher *)self delegate];
  id v5 = [v4 notificationSystemSettingsForDestination:self];

  return v5;
}

- (void)destination:(id)a3 setNotificationSystemSettings:(id)a4
{
  id v5 = a4;
  id v6 = [(CSNotificationDispatcher *)self delegate];
  [v6 destination:self setNotificationSystemSettings:v5];
}

- (void)stopAllRealerts
{
  id v2 = [(CSNotificationDispatcher *)self alertingController];
  [v2 killRealerts];
}

- (void)_clearNotificationRequestsFromIncomingSection:(id)a3
{
  id v4 = a3;
  id v6 = [(CSNotificationDispatcher *)self delegate];
  id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FB3860]];
  [v6 destination:self requestsClearingNotificationRequests:v4 fromDestinations:v5];
}

- (BOOL)isActive
{
  return self->_active;
}

- (CSNotificationDestination)modalDestination
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modalDestination);

  return (CSNotificationDestination *)WeakRetained;
}

- (void)setModalDestination:(id)a3
{
}

- (CSNotificationDestination)listDestination
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listDestination);

  return (CSNotificationDestination *)WeakRetained;
}

- (void)setListDestination:(id)a3
{
}

- (CSBehavior)activeBehavior
{
  return self->_activeBehavior;
}

- (void)setActiveBehavior:(id)a3
{
}

- (CSCarPlayStatusProviding)carPlayStatusProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_carPlayStatusProvider);

  return (CSCarPlayStatusProviding *)WeakRetained;
}

- (void)setCarPlayStatusProvider:(id)a3
{
}

- (SBNCAlertingController)alertingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertingController);

  return (SBNCAlertingController *)WeakRetained;
}

- (void)setAlertingController:(id)a3
{
}

- (NCNotificationDestinationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationDestinationDelegate);

  return (NCNotificationDestinationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationDestinationDelegate);
  objc_destroyWeak((id *)&self->_alertingController);
  objc_destroyWeak((id *)&self->_carPlayStatusProvider);
  objc_storeStrong((id *)&self->_activeBehavior, 0);
  objc_destroyWeak((id *)&self->_listDestination);
  objc_destroyWeak((id *)&self->_modalDestination);

  objc_storeStrong((id *)&self->_bannerDestinationSuppressionReasons, 0);
}

@end