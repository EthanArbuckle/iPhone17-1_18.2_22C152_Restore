@interface ClientInterface
+ (id)_badgeQueue;
+ (id)allApprovedItemsByBundle;
+ (void)_updateBadgeCounts:(BOOL)a3 processTelemetry:(id)a4;
+ (void)refreshBadgesWithItems:(id)a3 forBundleIdentifier:(id)a4;
+ (void)updateBadgeCount:(unint64_t)a3 bundleID:(id)a4;
+ (void)updateBadgeCounts:(BOOL)a3;
- (ClientInterface)initWithXPCConnection:(id)a3;
- (NSString)uniqueIdentifier;
- (id)_predicateForClientIdentifier:(id)a3;
- (id)_telemetryProcessor;
- (id)itemsForClientIdentifier:(id)a3;
- (void)_didChangeFollowUpItems;
- (void)clearNotificationForItem:(id)a3 completion:(id)a4;
- (void)clearPendingFollowUpItemsForClientIdentifier:(id)a3 completion:(id)a4;
- (void)clearPendingFollowUpItemsForClientIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5;
- (void)countOfPendingFollowUpItemsForClientIdentifier:(id)a3 completion:(id)a4;
- (void)didActivateHSA2LoginNotificationNotification:(id)a3;
- (void)pendingFollowUpItemsForClientIdentifier:(id)a3 completion:(id)a4;
- (void)postFollowUpItem:(id)a3 completion:(id)a4;
- (void)postHSA2PasswordResetNotification:(id)a3 completion:(id)a4;
- (void)updateBadgesForTimer;
@end

@implementation ClientInterface

- (void)_didChangeFollowUpItems
{
  v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  v5 = [(ClientInterface *)self _telemetryProcessor];
  +[ClientInterface _updateBadgeCounts:1 processTelemetry:v5];

  v6 = +[NotificationController sharedController];
  [v6 updateRepeatingActivityState];

  notify_post("com.apple.corefollowup.items_changed");
  v7 = self->_transaction;
  self->_transaction = 0;
}

- (void)clearPendingFollowUpItemsForClientIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void))a5;
  v20 = [[FLItemStoreDecorator alloc] initWithClientIdentifier:v8];
  v11 = [(FLItemStoreDecorator *)v20 itemsMatchingIdentifiers:v9];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v17 = [(ClientInterface *)self _telemetryProcessor];
        [v17 processItemRemoval:v16];

        v18 = +[ItemStore sharedInstance];
        [v18 deleteFollowUpItem:v16];

        v19 = +[NotificationController sharedController];
        [v19 tearDownNotificationForItem:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }
  [(ClientInterface *)self _didChangeFollowUpItems];
  if (v10) {
    v10[2](v10, 1, 0);
  }
}

- (id)_telemetryProcessor
{
  id v2 = objc_alloc((Class)FLTelemetryProcessor);
  v3 = +[FLTelemetryFactory sharedTelemetryController];
  id v4 = [v2 initWithController:v3];

  return v4;
}

+ (id)allApprovedItemsByBundle
{
  id v2 = +[ItemStore sharedInstance];
  v3 = [v2 allFollowUpItems];

  id v4 = objc_msgSend(v3, "fl_multiMap:", &stru_10001C8F0);

  return v4;
}

+ (void)_updateBadgeCounts:(BOOL)a3 processTelemetry:(id)a4
{
  id v6 = a4;
  v7 = (void *)os_transaction_create();
  id v8 = +[FLEnvironment currentEnvironment];
  id v9 = [v8 supportedBundleIdentifiers];

  v10 = +[ClientInterface allApprovedItemsByBundle];
  v11 = +[NSMutableSet setWithArray:v9];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100006014;
  v28[3] = &unk_10001C8B0;
  id v20 = v7;
  id v29 = v20;
  id v12 = v11;
  id v30 = v12;
  BOOL v33 = a3;
  id v22 = v9;
  id v31 = v22;
  id v21 = v6;
  id v32 = v21;
  long long v23 = v10;
  [v10 enumerateKeysAndObjectsUsingBlock:v28];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v19 = _FLLogSystem();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v35 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No items found for bundle ID, %@, ensuring badge count is 0", buf, 0xCu);
        }

        objc_msgSend(a1, "refreshBadgesWithItems:forBundleIdentifier:", &__NSArray0__struct, v18, v20);
      }
      id v15 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v15);
  }
}

+ (void)refreshBadgesWithItems:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v6);
          }
          id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (([v13 displayStyle] & 0x10) == 0
            && ![v13 isExpired])
          {
            ++v10;
          }
        }
        id v9 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v10 = 0;
    }
    [a1 updateBadgeCount:v10 bundleID:v7];
  }
  else
  {
    id v14 = _FLLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No bundle identifier, nothing to badge...", buf, 2u);
    }
  }
}

+ (void)updateBadgeCount:(unint64_t)a3 bundleID:(id)a4
{
  id v6 = a4;
  id v7 = _FLLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    __int16 v22 = 2112;
    id v23 = v6;
    id v8 = v19;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Badging (%lu, %@)", buf, 0x20u);
  }
  id v9 = (void *)os_transaction_create();
  uint64_t v10 = [a1 _badgeQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100001BA4;
  v13[3] = &unk_10001C918;
  unint64_t v16 = a3;
  id v17 = a1;
  id v14 = v6;
  id v15 = v9;
  id v11 = v9;
  id v12 = v6;
  dispatch_async(v10, v13);
}

+ (id)_badgeQueue
{
  if (qword_100022E78 != -1) {
    dispatch_once(&qword_100022E78, &stru_10001C838);
  }
  id v2 = (void *)qword_100022E70;

  return v2;
}

- (ClientInterface)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  id v6 = [(ClientInterface *)self init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_conn, a3);
    id v8 = +[NSUUID UUID];
    uint64_t v9 = [v8 UUIDString];
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSString *)v9;
  }
  return v7;
}

- (void)countOfPendingFollowUpItemsForClientIdentifier:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v7 = a4;
    id v8 = [(ClientInterface *)self itemsForClientIdentifier:a3];
    (*((void (**)(id, id, void))a4 + 2))(v7, [v8 count], 0);
  }
}

- (void)postFollowUpItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (v7)
  {
    id v8 = [v6 uniqueIdentifier];

    if (!v8
      || ([v6 clientIdentifier], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
    {
      long long v27 = FLError();
      v7[2](v7, 0, v27);

      goto LABEL_22;
    }
  }
  uint64_t v10 = +[FLEnvironment currentEnvironment];
  unsigned int v11 = [v10 stressMode];

  if (v11)
  {
    id v12 = +[ItemStore sharedInstance];
    id v13 = [v12 insertFollowUpItem:v6];

    if (!v7) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  id v14 = [FLItemStoreDecorator alloc];
  id v15 = [v6 clientIdentifier];
  unint64_t v16 = [(FLItemStoreDecorator *)v14 initWithClientIdentifier:v15];

  id v17 = [v6 uniqueIdentifier];
  long long v18 = [(FLItemStoreDecorator *)v16 itemsMatchingIdentifier:v17];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100005840;
  v29[3] = &unk_10001C860;
  id v19 = v6;
  id v30 = v19;
  [v18 enumerateObjectsUsingBlock:v29];
  __int16 v20 = [v19 notification];
  [v20 recalculateActionDateToAccountForDelay];

  unint64_t v21 = +[ItemStore sharedInstance];
  id v13 = [v21 insertFollowUpItem:v19];

  if (v13)
  {
    if (![v18 count])
    {
      __int16 v22 = _FLLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Inserting a new follow up", (uint8_t *)&v28, 2u);
      }

      id v23 = [(ClientInterface *)self _telemetryProcessor];
      [v23 processItemAddition:v19];
    }
    long long v24 = +[FLApprovedItemsFilter sharedFilter];
    id v25 = [v24 approvalStatusForItem:v19];

    if (!v25) {
      +[FLApprovedItemsDecorator decorateUnknownItem:v19];
    }
    [(ClientInterface *)self _didChangeFollowUpItems];
  }
  else
  {
    long long v26 = _FLLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000106AC((uint64_t)self, v26);
    }
  }
  if (v7) {
LABEL_20:
  }
    ((void (**)(id, id, void *))v7)[2](v7, v13, 0);
LABEL_22:
}

- (void)pendingFollowUpItemsForClientIdentifier:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v7 = a4;
    id v8 = [(ClientInterface *)self itemsForClientIdentifier:a3];
    (*((void (**)(id, id, void))a4 + 2))(v7, v8, 0);
  }
}

- (void)clearPendingFollowUpItemsForClientIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v19 = v6;
  if (v6)
  {
    id v8 = [(ClientInterface *)self itemsForClientIdentifier:v6];
  }
  else
  {
    uint64_t v9 = +[ItemStore sharedInstance];
    id v8 = [v9 safeSelectFollowUpItemsWithUniqueIdentifiers:0];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        unint64_t v16 = [(ClientInterface *)self _telemetryProcessor];
        [v16 processItemRemoval:v15];

        id v17 = +[ItemStore sharedInstance];
        [v17 deleteFollowUpItem:v15];

        long long v18 = +[NotificationController sharedController];
        [v18 tearDownNotificationForItem:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  if ([v10 count]) {
    [(ClientInterface *)self _didChangeFollowUpItems];
  }
  if (v7) {
    v7[2](v7, 1, 0);
  }
}

- (void)clearNotificationForItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = [v5 uniqueIdentifier];

  if (v7)
  {
    id v8 = _FLLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v5 uniqueIdentifier];
      int v18 = 138412290;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Searching for matching item in store, using identifier: %@", (uint8_t *)&v18, 0xCu);
    }
    id v10 = [FLItemStoreDecorator alloc];
    id v11 = [v5 clientIdentifier];
    id v12 = [(FLItemStoreDecorator *)v10 initWithClientIdentifier:v11];

    uint64_t v13 = [v5 uniqueIdentifier];
    id v14 = [(FLItemStoreDecorator *)v12 itemsMatchingIdentifier:v13];

    if ([v14 count])
    {
      uint64_t v15 = +[NotificationController sharedController];
      unint64_t v16 = [v14 firstObject];
      [v15 tearDownNotificationForItem:v16];

      v6[2](v6, 1, 0);
    }
    else
    {
      id v17 = FLError();
      ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v17);
    }
  }
  else
  {
    FLError();
    id v12 = (FLItemStoreDecorator *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, FLItemStoreDecorator *))v6)[2](v6, 0, v12);
  }
}

- (void)updateBadgesForTimer
{
}

- (id)itemsForClientIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _FLSignpostCreate();
  id v5 = _FLSignpostLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000107BC(v4, v5);
  }

  id v6 = [[FLItemStoreDecorator alloc] initWithClientIdentifier:v3];
  id v7 = [(FLItemStoreDecorator *)v6 followUpItems];
  unint64_t Nanoseconds = _FLSignpostGetNanoseconds();
  uint64_t v9 = _FLSignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100010724(Nanoseconds, v4, v9);
  }

  return v7;
}

- (id)_predicateForClientIdentifier:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005FB8;
  v6[3] = &unk_10001C888;
  id v7 = a3;
  id v3 = v7;
  uint64_t v4 = +[NSPredicate predicateWithBlock:v6];

  return v4;
}

+ (void)updateBadgeCounts:(BOOL)a3
{
}

- (void)didActivateHSA2LoginNotificationNotification:(id)a3
{
  id v3 = a3;
  id v4 = +[NotificationController sharedController];
  [v4 didActivateHSA2LoginNotificationNotification:v3];
}

- (void)postHSA2PasswordResetNotification:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = objc_alloc_init((Class)FLFollowUpNotification);
  id v8 = [v7 title];
  [v13 setTitle:v8];

  uint64_t v9 = [v7 informativeText];
  [v13 setInformativeText:v9];

  id v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", FLNotificationOptionNotificationCenter, FLNotificationOptionForce, 0);
  [v13 setOptions:v10];

  id v11 = objc_alloc_init((Class)FLFollowUpItem);
  [v11 setUniqueIdentifier:@"com.apple.authkit.hsa2-password-reset"];
  [v11 setClientIdentifier:@"com.apple.authkit"];
  [v11 setTargetBundleIdentifier:0];
  [v11 setNotification:v13];
  id v12 = [v7 followUpItemUserInfo];

  [v11 setUserInfo:v12];
  [v11 setGroupIdentifier:FLGroupIdentifierAccount];
  [(ClientInterface *)self postFollowUpItem:v11 completion:v6];
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_conn, 0);
}

@end