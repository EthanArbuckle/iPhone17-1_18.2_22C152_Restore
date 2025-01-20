@interface FLUserNotificationProvider
- (FLUserNotificationProvider)init;
- (NotificationProviderDelegate)delegate;
- (id)_notificationDeliveryQueue;
- (id)actionsForFollowUpItem:(id)a3;
- (id)createNotificationCenterWithBundleIdentifier:(id)a3;
- (id)getNotificationCenterForBundleIdentifier:(id)a3;
- (id)getNotificationCenterForItem:(id)a3;
- (id)userNotificationRequestForFollowUpItem:(id)a3;
- (void)addCategoryForFollowUpItem:(id)a3;
- (void)postNotificationForFollowUpItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)shouldUpdateExistingForItem:(id)a3 completionHandler:(id)a4;
- (void)start;
- (void)tearDownNotificationsForFollowUpItem:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation FLUserNotificationProvider

- (FLUserNotificationProvider)init
{
  v11.receiver = self;
  v11.super_class = (Class)FLUserNotificationProvider;
  v2 = [(FLUserNotificationProvider *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_noteCentersLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = FLFollowUpPreferencesBundleIdentifier;
    v5 = [(FLUserNotificationProvider *)v2 createNotificationCenterWithBundleIdentifier:FLFollowUpPreferencesBundleIdentifier];
    uint64_t v6 = +[NSMutableDictionary dictionaryWithObject:v5 forKey:v4];
    noteCenters = v3->_noteCenters;
    v3->_noteCenters = (NSMutableDictionary *)v6;

    v8 = objc_alloc_init(FLFoundationNotificationController);
    foundationNotificationController = v3->_foundationNotificationController;
    v3->_foundationNotificationController = v8;
  }
  return v3;
}

- (void)start
{
  v2 = _FLLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "UserNotificationProvider started", v3, 2u);
  }
}

- (id)_notificationDeliveryQueue
{
  if (qword_100022EA8 != -1) {
    dispatch_once(&qword_100022EA8, &stru_10001CD98);
  }
  v2 = (void *)qword_100022EA0;

  return v2;
}

- (void)postNotificationForFollowUpItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  uint64_t v6 = [(FLUserNotificationProvider *)self _notificationDeliveryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C534;
  block[3] = &unk_10001CDE8;
  id v10 = v4;
  objc_super v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)shouldUpdateExistingForItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 notification];
  v9 = [v8 options];
  unsigned int v10 = [v9 containsObject:FLNotificationOptionSpringboardAlert];

  if (v10)
  {
    [(FLFoundationNotificationController *)self->_foundationNotificationController shouldUpdateExistingForItem:v6 completionHandler:v7];
  }
  else
  {
    objc_super v11 = [(FLUserNotificationProvider *)self _notificationDeliveryQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C924;
    block[3] = &unk_10001CE38;
    id v13 = v6;
    v14 = self;
    id v15 = v7;
    dispatch_async(v11, block);
  }
}

- (void)addCategoryForFollowUpItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 categoryIdentifier];

  if (v5)
  {
    id v6 = [v4 categoryIdentifier];
    id v7 = [v4 notification];
    id v8 = [v7 options];
    if ([v8 containsObject:FLNotificationOptionLockscreen])
    {
      v9 = [v4 notification];
      unsigned int v10 = [v9 options];
      unsigned int v11 = [v10 containsObject:FLNotificationOptionKeepOnLockscreen];

      if (v11)
      {
        id v12 = _FLLogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_100010EF8(v4, v12);
        }

        uint64_t v13 = [v6 stringByAppendingString:@"_keepOnLockscreen"];

        uint64_t v14 = 131073;
        id v6 = (void *)v13;
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v14 = 1;
LABEL_9:
    id v15 = [(FLUserNotificationProvider *)self actionsForFollowUpItem:v4];
    v16 = +[UNNotificationCategory categoryWithIdentifier:v6 actions:v15 intentIdentifiers:&__NSArray0__struct options:v14];

    v17 = [(FLUserNotificationProvider *)self getNotificationCenterForItem:v4];
    v18 = [v17 notificationCategories];
    v19 = +[NSMutableSet setWithSet:v18];

    [v19 addObject:v16];
    [v17 setNotificationCategories:v19];
  }
}

- (id)actionsForFollowUpItem:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  v5 = [v3 notification];
  id v6 = [v5 activateAction];
  id v7 = [v6 label];

  if ([v7 length])
  {
    id v8 = +[UNNotificationAction actionWithIdentifier:UNNotificationDefaultActionIdentifier title:v7 options:1];
    [v4 addObject:v8];
  }
  v9 = [v3 notification];
  unsigned int v10 = [v9 clearAction];
  unsigned int v11 = [v10 label];

  if ([v11 length])
  {
    id v12 = +[UNNotificationAction actionWithIdentifier:UNNotificationDismissActionIdentifier title:v11 options:1];
    [v4 addObject:v12];
  }

  return v4;
}

- (void)tearDownNotificationsForFollowUpItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  id v6 = [(FLUserNotificationProvider *)self _notificationDeliveryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D138;
  block[3] = &unk_10001CDE8;
  void block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (id)userNotificationRequestForFollowUpItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 targetBundleIdentifier];
  unsigned __int8 v5 = [v4 isEqualToString:FLFollowUpPreferencesBundleIdentifier];

  if (v5)
  {
    id v6 = [v3 notification];
    id v7 = objc_alloc_init((Class)UNMutableNotificationContent);
    id v8 = [v6 title];
    [v7 setTitle:v8];

    v9 = [v3 _informativeNotificationTextOrDate];
    [v7 setBody:v9];

    id v10 = [v6 subtitleText];
    [v7 setSubtitle:v10];

    id v11 = [v3 categoryIdentifier];
    [v7 setCategoryIdentifier:v11];

    id v12 = [v3 targetBundleIdentifier];
    [v7 setThreadIdentifier:v12];

    [v7 setShouldPreventNotificationDismissalAfterDefaultAction:1];
    objc_msgSend(v7, "setShouldBackgroundDefaultAction:", -[NSObject shouldBackgroundDefaultAction](v6, "shouldBackgroundDefaultAction"));
    if ([v7 shouldBackgroundDefaultAction])
    {
      uint64_t v13 = _FLLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v50 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Suppressing default notification action, will be handled by extension", v50, 2u);
      }
    }
    uint64_t v14 = [v3 expirationDate];

    if (v14)
    {
      id v15 = [v3 _midnightAdjustedDate];
      [v7 setExpirationDate:v15];
    }
    [v7 setShouldSuppressScreenLightUp:1];
    v16 = [v3 notification];
    v17 = [v16 activateAction];

    v18 = [v17 url];

    if (v18)
    {
      v19 = [v17 url];
      [v7 setDefaultActionURL:v19];

      v20 = _FLLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v7 defaultActionURL];
        *(_DWORD *)v50 = 138412290;
        *(void *)&v50[4] = v21;
        v22 = "Using the activate action URL as the default URL: %@";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v22, v50, 0xCu);
      }
    }
    else
    {
      if ([v7 shouldBackgroundDefaultAction])
      {
LABEL_19:
        id v25 = objc_alloc_init((Class)NSMutableDictionary);
        v26 = [v6 activateAction];
        v27 = [v26 identifier];

        if (v27)
        {
          v28 = [v6 activateAction];
          v29 = [v28 identifier];
          [v25 setObject:v29 forKey:UNNotificationDefaultActionIdentifier];
        }
        v30 = [v6 clearAction];
        v31 = [v30 identifier];

        if (v31)
        {
          v32 = [v6 clearAction];
          v33 = [v32 identifier];
          [v25 setObject:v33 forKey:UNNotificationDismissActionIdentifier];
        }
        [v7 setUserInfo:v25];
        v34 = [v6 options];
        unsigned int v35 = [v34 containsObject:FLNotificationOptionBannerAlert];

        uint64_t v36 = v35;
        v37 = [v6 options];
        unsigned int v38 = [v37 containsObject:FLNotificationOptionLockscreen];

        if (v38)
        {
          v36 |= 2uLL;
          uint64_t v39 = [v3 categoryIdentifier];
          if (v39)
          {
            v40 = (void *)v39;
            v41 = [v6 options];
            unsigned int v42 = [v41 containsObject:FLNotificationOptionKeepOnLockscreen];

            if (v42)
            {
              v43 = [v3 categoryIdentifier];
              v44 = [v43 stringByAppendingString:@"_keepOnLockscreen"];
              [v7 setCategoryIdentifier:v44];
            }
          }
        }
        v45 = [v6 options];
        unsigned int v46 = [v45 containsObject:FLNotificationOptionNotificationCenter];

        if (v46) {
          uint64_t v47 = v36 | 4;
        }
        else {
          uint64_t v47 = v36;
        }
        v48 = [v3 uniqueIdentifier];
        v23 = +[UNNotificationRequest requestWithIdentifier:v48 content:v7 trigger:0 destinations:v47];

        goto LABEL_31;
      }
      v24 = +[FLTopLevelViewModel redirectURLForItem:v3 withAction:v17];
      [v7 setDefaultActionURL:v24];

      v20 = _FLLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v7 defaultActionURL];
        *(_DWORD *)v50 = 138412290;
        *(void *)&v50[4] = v21;
        v22 = "No activate action URL specified, default action will use redirect URL: %@";
        goto LABEL_17;
      }
    }

    goto LABEL_19;
  }
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v50 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Target bundle provided identifier is not permitted for notifications, returning nil", v50, 2u);
  }
  v23 = 0;
LABEL_31:

  return v23;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  [(FLFoundationNotificationController *)self->_foundationNotificationController setDelegate:v5];
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  v9 = [(FLUserNotificationProvider *)self delegate];
  id v10 = [v7 notification];
  id v11 = [v10 request];

  id v12 = [v11 content];
  uint64_t v13 = [v12 userInfo];

  uint64_t v14 = [v11 identifier];
  id v15 = _FLLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [v7 actionIdentifier];
    *(_DWORD *)buf = 138412546;
    v26 = v16;
    __int16 v27 = 2112;
    v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Notification response received with id: %@ (uid: %@)", buf, 0x16u);
  }
  v17 = [v7 actionIdentifier];
  if ([v17 isEqualToString:UNNotificationDefaultActionIdentifier])
  {
    v18 = [v7 actionIdentifier];
    v19 = [v13 objectForKeyedSubscript:v18];

    if (v19)
    {
      v20 = [v7 actionIdentifier];
      v21 = [v13 objectForKeyedSubscript:v20];
      [v9 provider:0 didActivateNotification:v21 forFollowUpItemWithIdentifier:v14 activationSource:5];

      goto LABEL_9;
    }
  }
  else
  {
  }
  v22 = [v7 actionIdentifier];
  unsigned int v23 = [v22 isEqualToString:UNNotificationDismissActionIdentifier];

  if (!v23)
  {
    [v9 provider:0 didActivateNotificationForFollowUpItemWithIdentifier:v14 activationSource:5];
    goto LABEL_11;
  }
  v24 = v14;
  v20 = +[NSArray arrayWithObjects:&v24 count:1];
  [v9 provider:0 didClearNotificationsForFollowUpItemsWithIdentifiers:v20 activationSource:5];
LABEL_9:

LABEL_11:
  v8[2](v8);
}

- (id)createNotificationCenterWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating UNUserNotificationCenter for bundle identifier %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:v4];
  [v6 setDelegate:self];
  [v6 setWantsNotificationResponsesDelivered];
  id v7 = +[NSSet set];
  [v6 setNotificationCategories:v7];

  return v6;
}

- (id)getNotificationCenterForBundleIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_noteCentersLock);
  id v5 = [(NSMutableDictionary *)self->_noteCenters objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [(FLUserNotificationProvider *)self createNotificationCenterWithBundleIdentifier:v4];
    [(NSMutableDictionary *)self->_noteCenters setObject:v5 forKey:v4];
  }
  os_unfair_lock_unlock(&self->_noteCentersLock);

  return v5;
}

- (id)getNotificationCenterForItem:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:FLFollowUpNotifyingAppIdKey];

  if (!v5) {
    id v5 = FLFollowUpPreferencesBundleIdentifier;
  }
  if (([v5 isEqualToString:FLFollowUpHomeBundleIdentifier] & 1) != 0
    || [v5 isEqualToString:FLFollowUpPhotosBundleIdentifier])
  {
    id v6 = FLFollowUpiCloudBundleIdentifier;

    id v5 = v6;
  }
  id v7 = +[FLEnvironment currentEnvironment];
  id v8 = [v7 supportedNotifyingAppIds];
  unsigned __int8 v9 = [v8 containsObject:v5];

  if ((v9 & 1) == 0)
  {
    id v10 = _FLLogSystem();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    id v12 = (void *)FLFollowUpPreferencesBundleIdentifier;
    if (v11) {
      sub_100010F90((uint64_t)v5, FLFollowUpPreferencesBundleIdentifier, v10);
    }

    id v13 = v12;
    id v5 = v13;
  }
  uint64_t v14 = [(FLUserNotificationProvider *)self getNotificationCenterForBundleIdentifier:v5];

  return v14;
}

- (NotificationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NotificationProviderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_noteCenters, 0);

  objc_storeStrong((id *)&self->_foundationNotificationController, 0);
}

@end