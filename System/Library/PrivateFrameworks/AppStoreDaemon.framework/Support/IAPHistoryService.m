@interface IAPHistoryService
- (void)getAllIAPsForActiveAccountWithReplyHandler:(id)a3;
- (void)getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler:(id)a3;
- (void)getCachedSubscriptionEntitlementsForSegment:(unint64_t)a3 withReplyHandler:(id)a4;
- (void)getIAPsForActiveAccountWithAdamIDs:(id)a3 withReplyHandler:(id)a4;
- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 isBackground:(BOOL)a5 requestingBundleId:(id)a6 withReplyHandler:(id)a7;
- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 requestingBundleId:(id)a5 withReplyHandler:(id)a6;
- (void)refreshIAPsForActiveAccountWithReplyHandler:(id)a3;
- (void)setSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4 segment:(unint64_t)a5;
@end

@implementation IAPHistoryService

- (void)getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[SubscriptionEntitlementsCoordinator sharedInstance];
  sub_100006C3C((uint64_t)v4, v3);
}

- (void)getCachedSubscriptionEntitlementsForSegment:(unint64_t)a3 withReplyHandler:(id)a4
{
  id v5 = a4;
  v6 = sub_100416A38((uint64_t)XPCRequestToken, 0);
  v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    id v10 = v8;
    if (v6) {
      id Property = objc_getProperty(v6, v9, 48, 1);
    }
    else {
      id Property = 0;
    }
    id v12 = Property;
    int v14 = 138412802;
    v15 = v8;
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    __int16 v18 = 2114;
    id v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Handling cached subscription entitlements request for segment: %lu clientID: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  v13 = +[SubscriptionEntitlementsCoordinator sharedInstance];
  sub_100008788((uint64_t)v13, a3, v6, v5);
}

- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 requestingBundleId:(id)a5 withReplyHandler:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = sub_100416A38((uint64_t)XPCRequestToken, a5);
  v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    id v22 = v12;
    if (v10)
    {
      id v14 = objc_getProperty(v10, v13, 56, 1);
      id Property = objc_getProperty(v10, v15, 48, 1);
      v21 = v14;
    }
    else
    {
      id v14 = 0;
      v21 = 0;
      id Property = 0;
    }
    id v17 = Property;
    __int16 v18 = [v10 processInfo];
    id v19 = [v18 bundleIdentifier];
    *(_DWORD *)buf = 138413570;
    v24 = v12;
    __int16 v25 = 2048;
    unint64_t v26 = a3;
    __int16 v27 = 2114;
    id v28 = v14;
    __int16 v29 = 2114;
    id v30 = v17;
    __int16 v31 = 2114;
    v32 = v19;
    __int16 v33 = 1024;
    BOOL v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%@] Handling subscription entitlements request for segment: %lu requestingBundleId: %{public}@ clientID: %{public}@ processInfoID: %{public}@ ignore caches: %{BOOL}d", buf, 0x3Au);
  }
  v20 = +[SubscriptionEntitlementsCoordinator sharedInstance];
  sub_100321A50(v20, a3, v10, v7, 0, 1, v9);
}

- (void)getAllIAPsForActiveAccountWithReplyHandler:(id)a3
{
  id v3 = a3;
  id v4 = sub_100416A38((uint64_t)XPCRequestToken, 0);
  id v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = [v4 processInfo];
    id v9 = [v8 bundleIdentifier];
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v4;
    __int16 v15 = 2114;
    __int16 v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@]: %{public}@ Getting IAPs for active account for client: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = sub_1000109AC();
  sub_100007F68((uint64_t)v10, v4, v3);
}

- (void)getIAPsForActiveAccountWithAdamIDs:(id)a3 withReplyHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100416A38((uint64_t)XPCRequestToken, 0);
  if (v5 && [v5 count])
  {
    v8 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_opt_class();
      id v10 = v9;
      int v11 = [v7 processInfo];
      id v12 = [v11 bundleIdentifier];
      int v19 = 138412802;
      v20 = v9;
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2114;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@]: %{public}@ Getting specific IAPs for active account for client: %{public}@", (uint8_t *)&v19, 0x20u);
    }
    __int16 v13 = sub_1000109AC();
    sub_100370F00((uint64_t)v13, v5, v7, v6);
  }
  else
  {
    id v14 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = objc_opt_class();
      id v16 = v15;
      id v17 = [v7 processInfo];
      __int16 v18 = [v17 bundleIdentifier];
      int v19 = 138412802;
      v20 = v15;
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2114;
      v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@]: %{public}@ Getting IAPs for active account for client: %{public}@", (uint8_t *)&v19, 0x20u);
    }
    __int16 v13 = sub_1000109AC();
    sub_100007F68((uint64_t)v13, v7, v6);
  }
}

- (void)refreshIAPsForActiveAccountWithReplyHandler:(id)a3
{
  id v3 = a3;
  id v4 = sub_100416A38((uint64_t)XPCRequestToken, 0);
  id v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    v8 = [v4 processInfo];
    id v9 = [v8 bundleIdentifier];
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v4;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@]: %{public}@ Refreshing IAPs for active account for client: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  id v10 = sub_1000109AC();
  sub_1000106BC((uint64_t)v10, v4, v3);
}

- (void)setSubscriptionEntitlementsWithDictionary:(id)a3 forAccountID:(id)a4 segment:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = sub_100416A38((uint64_t)XPCRequestToken, 0);
  id v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = objc_opt_class();
    id v12 = v11;
    __int16 v13 = [v9 processInfo];
    id v14 = [v13 bundleIdentifier];
    int v16 = 138413058;
    id v17 = v11;
    __int16 v18 = 2114;
    int v19 = v14;
    __int16 v20 = 2114;
    id v21 = v7;
    __int16 v22 = 2048;
    unint64_t v23 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@]: Setting subscriptions for clientID: %{public}@ accountID: %{public}@ segment: %lu", (uint8_t *)&v16, 0x2Au);
  }
  __int16 v15 = +[SubscriptionEntitlementsCoordinator sharedInstance];
  [v15 setCachedSubscriptionEntitlements:v8 forAccountID:v7 segment:a5];
}

- (void)getSubscriptionEntitlementsForSegment:(unint64_t)a3 ignoreCaches:(BOOL)a4 isBackground:(BOOL)a5 requestingBundleId:(id)a6 withReplyHandler:(id)a7
{
  LODWORD(v8) = a5;
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = sub_100416A38((uint64_t)XPCRequestToken, a6);
  __int16 v13 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = (int)v8;
    id v8 = objc_opt_class();
    id v23 = v8;
    if (v12)
    {
      id v15 = objc_getProperty(v12, v14, 56, 1);
      id Property = objc_getProperty(v12, v16, 48, 1);
      __int16 v22 = v15;
    }
    else
    {
      id v15 = 0;
      __int16 v22 = 0;
      id Property = 0;
    }
    id v18 = Property;
    int v19 = [v12 processInfo];
    __int16 v20 = [v19 bundleIdentifier];
    *(_DWORD *)buf = 138413826;
    unint64_t v26 = v8;
    __int16 v27 = 2048;
    unint64_t v28 = a3;
    __int16 v29 = 2114;
    id v30 = v15;
    __int16 v31 = 2114;
    id v32 = v18;
    __int16 v33 = 2114;
    BOOL v34 = v20;
    __int16 v35 = 1024;
    BOOL v36 = v9;
    __int16 v37 = 1024;
    LOBYTE(v8) = v24;
    int v38 = v24;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@] Handling subscription entitlements request for segment: %lu requestingBundleId: %{public}@ clientID: %{public}@ processInfoID: %{public}@ ignore caches: %{BOOL}d isBackground: %{BOOL}d", buf, 0x40u);
  }
  id v21 = +[SubscriptionEntitlementsCoordinator sharedInstance];
  sub_100321A50(v21, a3, v12, v9, (BOOL)v8, 1, v11);
}

@end