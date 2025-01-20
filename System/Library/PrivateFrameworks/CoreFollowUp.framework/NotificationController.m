@interface NotificationController
+ (id)sharedController;
- (NotificationProvider)notificationProvider;
- (double)_timeTilNextActivityForItems:(id)a3;
- (id)_activityCriteriaWithFrequency:(double)a3;
- (id)_itemsWithEligibleNotifications;
- (id)providerForFollowUpItem:(id)a3;
- (id)xpcConnectionForClientWithMachServiceName:(id)a3;
- (void)_deliverNotificationsForItem:(id)a3 forceDelivery:(BOOL)a4;
- (void)_handleActivateActionFromSource:(unint64_t)a3 item:(id)a4;
- (void)_handleExtensionAction:(id)a3 forItem:(id)a4;
- (void)_handleNotificationAction:(id)a3 forItem:(id)a4 activationSource:(unint64_t)a5;
- (void)_monitorUnlockEvents;
- (void)_processFollowUpItemNotificationWithExtension:(id)a3 activatedAction:(id)a4;
- (void)_processPendingItem:(id)a3 completion:(id)a4;
- (void)_processPendingNotifications:(id)a3;
- (void)_registerActivityForItems:(id)a3;
- (void)deliverNotificationsForItem:(id)a3;
- (void)didActivateHSA2LoginNotificationNotification:(id)a3;
- (void)provider:(id)a3 didActivateNotification:(id)a4 forFollowUpItemWithIdentifier:(id)a5 activationSource:(unint64_t)a6;
- (void)provider:(id)a3 didActivateNotificationForFollowUpItemWithIdentifier:(id)a4 activationSource:(unint64_t)a5;
- (void)provider:(id)a3 didClearNotificationsForFollowUpItemsWithIdentifiers:(id)a4 activationSource:(unint64_t)a5;
- (void)provider:(id)a3 didDismissNotificationForFollowUpItemWithIdentifier:(id)a4 activationSource:(unint64_t)a5;
- (void)setNotificationProvider:(id)a3;
- (void)start;
- (void)tearDownNotificationForItem:(id)a3;
- (void)updateNotificationDeliveryDateForItem:(id)a3;
- (void)updateRepeatingActivityState;
@end

@implementation NotificationController

- (void)updateRepeatingActivityState
{
  v3 = [(NotificationController *)self _itemsWithEligibleNotifications];
  if ([v3 count])
  {
    [(NotificationController *)self _registerActivityForItems:v3];
    [(NotificationController *)self _processPendingItem:v3 completion:0];
  }
  else
  {
    v4 = _FLLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unregistering any active activities", v5, 2u);
    }

    xpc_activity_unregister("com.apple.followup.notify");
  }
}

- (id)_itemsWithEligibleNotifications
{
  v3 = +[NSPredicate predicateWithBlock:&stru_10001CC10];
  v4 = [(FLItemStoreDecorator *)self->_itemStoreDecorator itemsMatchingPredicate:v3];

  return v4;
}

+ (id)sharedController
{
  if (qword_100022E98 != -1) {
    dispatch_once(&qword_100022E98, &stru_10001CB80);
  }
  v2 = (void *)qword_100022E90;

  return v2;
}

- (void)start
{
  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting notification controller...", buf, 2u);
  }

  [(NotificationController *)self _monitorUnlockEvents];
  v4 = (void *)os_transaction_create();
  v5 = dispatch_get_global_queue(17, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009B08;
  v7[3] = &unk_10001CBA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_monitorUnlockEvents
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100009BF8;
  handler[3] = &unk_10001CBD0;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
}

- (double)_timeTilNextActivityForItems:(id)a3
{
  id v3 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1000037F0;
  v29 = sub_1000037C8;
  id v30 = 0;
  uint64_t v21 = 0;
  v22 = (double *)&v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000A0B0;
  v16[3] = &unk_10001CC38;
  v16[4] = &v21;
  v16[5] = &v17;
  v16[6] = &v25;
  [v3 enumerateObjectsUsingBlock:v16];
  v4 = (void *)v26[5];
  v5 = v22;
  if (v4)
  {
    double v6 = v22[3];
    if (v6 == 0.0)
    {
LABEL_5:
      [v4 timeIntervalSinceNow];
      v5 = v22;
      *((void *)v22 + 3) = v8;
      goto LABEL_6;
    }
    [v4 timeIntervalSinceNow];
    if (v6 > v7)
    {
      v4 = (void *)v26[5];
      goto LABEL_5;
    }
    v5 = v22;
  }
LABEL_6:
  double v9 = v5[3];
  v10 = +[FLEnvironment currentEnvironment];
  [v10 oneDayTimeInterval];
  if (v9 <= v11)
  {
LABEL_9:

    goto LABEL_10;
  }
  int v12 = *((unsigned __int8 *)v18 + 24);

  if (v12)
  {
    v10 = +[FLEnvironment currentEnvironment];
    [v10 oneDayTimeInterval];
    *((void *)v22 + 3) = v13;
    goto LABEL_9;
  }
LABEL_10:
  double v14 = v22[3];
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (void)_registerActivityForItems:(id)a3
{
  id v4 = a3;
  v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting a repeating activity based on items: %@", buf, 0xCu);
  }

  [(NotificationController *)self _timeTilNextActivityForItems:v4];
  if (v6 <= 0.0)
  {
    double v9 = _FLLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unregistering any active activities", buf, 2u);
    }

    xpc_activity_unregister("com.apple.followup.notify");
  }
  else
  {
    double v7 = -[NotificationController _activityCriteriaWithFrequency:](self, "_activityCriteriaWithFrequency:");
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000A538;
    handler[3] = &unk_10001CBD0;
    handler[4] = self;
    xpc_activity_register("com.apple.followup.notify", v7, handler);

    uint64_t v8 = _FLLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Registered for XPC events", buf, 2u);
    }
  }
}

- (id)_activityCriteriaWithFrequency:(double)a3
{
  id v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scheduling XPC activity with interval %f", (uint8_t *)&v8, 0xCu);
  }

  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  double v6 = (double)XPC_ACTIVITY_INTERVAL_1_DAY;
  if ((double)XPC_ACTIVITY_INTERVAL_1_DAY > a3) {
    double v6 = a3;
  }
  xpc_dictionary_set_int64(v5, XPC_ACTIVITY_INTERVAL, (uint64_t)v6);
  xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);

  return v5;
}

- (void)_processPendingNotifications:(id)a3
{
  itemStoreDecorator = self->_itemStoreDecorator;
  id v5 = a3;
  id v6 = [(FLItemStoreDecorator *)itemStoreDecorator followUpItems];
  [(NotificationController *)self _processPendingItem:v6 completion:v5];
}

- (void)_processPendingItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(id, id))a4;
  int v8 = _FLLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Processing pending notifications...", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000AAF8;
  v10[3] = &unk_10001C860;
  v10[4] = self;
  [v6 enumerateObjectsUsingBlock:v10];
  if (v7) {
    v7[2](v7, [v6 count]);
  }
  double v9 = _FLLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Processed pending notifications...", buf, 2u);
  }
}

- (void)deliverNotificationsForItem:(id)a3
{
}

- (void)_deliverNotificationsForItem:(id)a3 forceDelivery:(BOOL)a4
{
  id v6 = a3;
  double v7 = _FLLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v6 uniqueIdentifier];
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deliverying notification for item with identifier: %@", buf, 0xCu);
  }
  double v9 = [v6 notification];
  if (v9 && ([v6 isExpired] & 1) == 0)
  {
    v10 = [(NotificationController *)self providerForFollowUpItem:v6];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000ACBC;
    v12[3] = &unk_10001CC88;
    BOOL v16 = a4;
    id v13 = v9;
    id v14 = v10;
    id v15 = v6;
    id v11 = v10;
    [v11 shouldUpdateExistingForItem:v15 completionHandler:v12];
  }
  else
  {
    [(NotificationController *)self tearDownNotificationForItem:v6];
  }
}

- (void)tearDownNotificationForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(NotificationController *)self providerForFollowUpItem:v4];
  [v5 tearDownNotificationsForFollowUpItem:v4];
}

- (id)providerForFollowUpItem:(id)a3
{
  return self->_notificationProvider;
}

- (void)provider:(id)a3 didActivateNotification:(id)a4 forFollowUpItemWithIdentifier:(id)a5 activationSource:(unint64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = _FLLogSystem();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v10;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Activated notification for %@ - %@", buf, 0x16u);
    }

    id v13 = [(FLItemStoreDecorator *)self->_itemStoreDecorator itemsMatchingIdentifier:v10];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000AF04;
    v20[3] = &unk_10001CCB0;
    uint64_t v21 = v9;
    v22 = self;
    unint64_t v23 = a6;
    [v13 enumerateObjectsUsingBlock:v20];

    id v12 = v21;
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    sub_100010D5C((uint64_t)self, v12, v14, v15, v16, v17, v18, v19);
  }
}

- (void)provider:(id)a3 didActivateNotificationForFollowUpItemWithIdentifier:(id)a4 activationSource:(unint64_t)a5
{
  id v7 = a4;
  int v8 = _FLLogSystem();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activated notification for %@", buf, 0xCu);
    }

    id v9 = [(FLItemStoreDecorator *)self->_itemStoreDecorator itemsMatchingIdentifier:v7];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000B1D8;
    v16[3] = &unk_10001CCD8;
    v16[4] = self;
    v16[5] = a5;
    [v9 enumerateObjectsUsingBlock:v16];
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_100010D5C((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
  }
}

- (void)_handleActivateActionFromSource:(unint64_t)a3 item:(id)a4
{
  id v12 = a4;
  id v6 = +[FLTelemetryFactory sharedTelemetryController];
  [v6 captureActionForItem:v12 withEvent:2 source:a3];

  id v7 = [v12 notification];
  int v8 = [v7 options];
  unsigned int v9 = [v8 containsObject:FLNotificationOptionExtensionActions];

  uint64_t v10 = [v12 notification];
  uint64_t v11 = [v10 activateAction];
  if (v9) {
    [(NotificationController *)self _handleExtensionAction:v11 forItem:v12];
  }
  else {
    [(NotificationController *)self _handleNotificationAction:v11 forItem:v12 activationSource:a3];
  }
}

- (void)provider:(id)a3 didClearNotificationsForFollowUpItemsWithIdentifiers:(id)a4 activationSource:(unint64_t)a5
{
  id v7 = a4;
  int v8 = _FLLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Clearing notifications for %@", buf, 0xCu);
  }

  unsigned int v9 = [(FLItemStoreDecorator *)self->_itemStoreDecorator itemsMatchingIdentifiers:v7];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000B460;
  v10[3] = &unk_10001CCD8;
  v10[4] = self;
  void v10[5] = a5;
  [v9 enumerateObjectsUsingBlock:v10];
}

- (void)provider:(id)a3 didDismissNotificationForFollowUpItemWithIdentifier:(id)a4 activationSource:(unint64_t)a5
{
  id v7 = a4;
  int v8 = _FLLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dismissing notification: %@", buf, 0xCu);
  }

  unsigned int v9 = [(FLItemStoreDecorator *)self->_itemStoreDecorator itemsMatchingIdentifier:v7];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000B634;
  v10[3] = &unk_10001CCD8;
  v10[4] = self;
  void v10[5] = a5;
  [v9 enumerateObjectsUsingBlock:v10];
}

- (void)_handleNotificationAction:(id)a3 forItem:(id)a4 activationSource:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = _FLLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 uniqueIdentifier];
    *(_DWORD *)buf = 138412546;
    id v26 = v8;
    __int16 v27 = 2112;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Handling notification action %@ for item identifier %@", buf, 0x16u);
  }
  [(NotificationController *)self updateNotificationDeliveryDateForItem:v9];
  uint64_t v12 = [v9 extensionIdentifier];
  if (v12
    && (uint64_t v13 = (void *)v12,
        +[FLEnvironment currentEnvironment],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        unsigned int v15 = [v14 followUpExtensionSupportEnabled],
        v14,
        v13,
        v15))
  {
    uint64_t v16 = (void *)os_transaction_create();
    uint64_t v17 = +[FLHeadlessExtensionLoader sharedExtensionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B8F4;
    block[3] = &unk_10001CD28;
    unint64_t v24 = a5;
    id v20 = v9;
    uint64_t v21 = self;
    id v22 = v8;
    id v23 = v16;
    id v18 = v16;
    dispatch_async(v17, block);
  }
  else if (a5 == 5)
  {
    [(NotificationController *)self _processFollowUpItemNotificationWithExtension:v9 activatedAction:v8];
  }
}

- (void)_handleExtensionAction:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _FLLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 uniqueIdentifier];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling notification action %@ for item identifier %@", buf, 0x16u);
  }
  uint64_t v10 = [v7 notification];
  uint64_t v11 = [v10 options];
  id v12 = [v11 mutableCopy];

  [v12 removeObject:FLNotificationOptionForce];
  uint64_t v13 = [v7 notification];
  [v13 setOptions:v12];

  [(NotificationController *)self updateNotificationDeliveryDateForItem:v7];
  if (v6)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v21 = sub_1000037F0;
    id v22 = sub_1000037C8;
    id v23 = [objc_alloc((Class)FLHeadlessActionHandler) initWithItem:v7];
    uint64_t v14 = (void *)os_transaction_create();
    [v6 setEventSource:1];
    unsigned int v15 = *(void **)(*(void *)&buf[8] + 40);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000BD9C;
    v17[3] = &unk_10001CD50;
    uint64_t v19 = buf;
    id v16 = v14;
    id v18 = v16;
    [v15 handleAction:v6 completion:v17];

    _Block_object_dispose(buf, 8);
  }
}

- (void)_processFollowUpItemNotificationWithExtension:(id)a3 activatedAction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _FLLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_processFollowUpItemNotificationWithExtension: %@ ", (uint8_t *)&v12, 0xCu);
  }

  id v8 = v6;
  if (([v8 _loadActionURL] & 1) == 0)
  {
    id v9 = _FLLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Did not handle action url trying redirect for item: %@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v10 = +[LSApplicationWorkspace defaultWorkspace];
    uint64_t v11 = +[FLTopLevelViewModel redirectURLForItem:v5 withAction:v8];
    [v10 openSensitiveURL:v11 withOptions:0];
  }
}

- (void)updateNotificationDeliveryDateForItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 notification];
  if (v4)
  {
    id v5 = _FLLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting notification target date to now", v8, 2u);
    }

    id v6 = +[NSDate date];
    [v4 setPreviousNotificationActionDate:v6];

    id v7 = +[ItemStore sharedInstance];
    [v7 updateNotificationForFollowUpItem:v3];
  }
}

- (void)didActivateHSA2LoginNotificationNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(NotificationController *)self xpcConnectionForClientWithMachServiceName:@"com.apple.akd.followup"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C118;
  v7[3] = &unk_10001CD78;
  v7[4] = self;
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v7];
  [v6 didActivateHSA2LoginNotification:v4];
}

- (id)xpcConnectionForClientWithMachServiceName:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:v3 options:4096];

  id v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FLFollowUpControllerDelegate];
  [v4 setRemoteObjectInterface:v5];
  [v4 resume];

  return v4;
}

- (NotificationProvider)notificationProvider
{
  return self->_notificationProvider;
}

- (void)setNotificationProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationProvider, 0);

  objc_storeStrong((id *)&self->_itemStoreDecorator, 0);
}

@end