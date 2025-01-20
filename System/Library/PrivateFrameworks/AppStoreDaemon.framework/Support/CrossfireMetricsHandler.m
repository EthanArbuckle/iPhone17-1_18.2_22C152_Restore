@interface CrossfireMetricsHandler
- (BOOL)includeClipDetails;
- (BOOL)isCandidateAppMetadata:(id)a3;
- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4;
- (BOOL)shouldCollectMetrics;
- (CrossfireMetricsHandler)init;
- (id)logKey;
- (int64_t)appUsageType;
- (void)_handleAppDeletion:(id)a3;
- (void)_removeAppUsageSessionForBundleID:(id)a3;
- (void)recordDeletedBundleIDs:(id)a3;
- (void)recordInstallEventsForBundleIDs:(id)a3 installType:(unsigned __int8)a4;
@end

@implementation CrossfireMetricsHandler

- (CrossfireMetricsHandler)init
{
  v4.receiver = self;
  v4.super_class = (Class)CrossfireMetricsHandler;
  v2 = [(CrossfireMetricsHandler *)&v4 init];
  if (v2) {
    v2->_collectingMetrics = sub_1003363D8();
  }
  return v2;
}

- (int64_t)appUsageType
{
  return 1;
}

- (BOOL)includeClipDetails
{
  return 1;
}

- (BOOL)isCandidateAppMetadata:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MetricsHandler *)self shouldEnableSystemAppsForAppUsageType:1];
  if (((sub_1003A4054(v4) & 1) != 0 || self->_collectingMetrics)
    && (sub_1003A409C(v4) ^ 1 | v5) == 1)
  {
    v6 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = [(CrossfireMetricsHandler *)self logKey];
      v10 = sub_1003A3938(v4);
      v11 = sub_1003A40E4(v4);
      int v12 = 138412802;
      v13 = v9;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%@] We have eligible metadata: %{public}@ version: %{public}@", (uint8_t *)&v12, 0x20u);
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (a4) {
    goto LABEL_9;
  }
  if (([v6 isBeta] & 1) == 0 && !self->_collectingMetrics)
  {
LABEL_24:
    BOOL v15 = 0;
    goto LABEL_25;
  }
  if (![(MetricsHandler *)self shouldEnableSystemAppsForAppUsageType:1])
  {
LABEL_9:
    unsigned int v12 = 0;
  }
  else
  {
    v8 = sub_10031CA20();
    id v23 = 0;
    v9 = sub_10031CD70((uint64_t)v8, &v23);
    id v10 = v23;

    if (v10)
    {
      v11 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v20 = [(CrossfireMetricsHandler *)self logKey];
        *(_DWORD *)buf = 138412546;
        v25 = v20;
        __int16 v26 = 2114;
        id v27 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%@] Error looking up system apps. Error: %{public}@", buf, 0x16u);
      }
      unsigned int v12 = 0;
    }
    else
    {
      v13 = [v7 bundleID];
      unsigned int v12 = [v9 containsObject:v13];

      v11 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v21 = [(CrossfireMetricsHandler *)self logKey];
        v22 = [v7 bundleID];
        *(_DWORD *)buf = 138412546;
        v25 = v21;
        __int16 v26 = 2114;
        id v27 = v22;
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%@] [%{public}@] We have an eligible system app ", buf, 0x16u);
      }
    }
  }
  if (([v7 isStoreOriginated] & 1) == 0 && !v12
    || [v7 isProfileValidated] && !objc_msgSend(v7, "isBeta")
    || [v7 hasMIDBasedSINF] && !objc_msgSend(v7, "isAppClip")
    || ([v7 isInstalled] & 1) == 0 && !objc_msgSend(v7, "isOffloaded"))
  {
    goto LABEL_24;
  }
  __int16 v14 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v17 = [(CrossfireMetricsHandler *)self logKey];
    v18 = [v7 bundleID];
    v19 = [v7 shortVersionString];
    *(_DWORD *)buf = 138412802;
    v25 = v17;
    __int16 v26 = 2114;
    id v27 = v18;
    __int16 v28 = 2114;
    v29 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%@] [%{public}@] We have an eligible app with version: %{public}@", buf, 0x20u);
  }
  BOOL v15 = 1;
LABEL_25:

  return v15;
}

- (id)logKey
{
  logKey = self->_logKey;
  if (!logKey)
  {
    id v4 = self->super._baseLogKey;
    unsigned int v5 = [(LogKey *)v4 prependingCategory:@"Crossfire"];
    id v6 = self->_logKey;
    self->_logKey = v5;

    logKey = self->_logKey;
  }
  return logKey;
}

- (void)recordDeletedBundleIDs:(id)a3
{
  id v4 = a3;
  [(MetricsHandler *)self recordAppEventsForBundleIDs:v4 eventType:3 installType:0];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10028B078;
  v5[3] = &unk_100524F78;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

- (void)recordInstallEventsForBundleIDs:(id)a3 installType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  self;
  if (v4 <= 0x13 && ((1 << v4) & 0xF17FE) != 0)
  {
    [(MetricsHandler *)self recordAppEventsForBundleIDs:v6 eventType:1 installType:v4];
  }
  else
  {
    BOOL v7 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(CrossfireMetricsHandler *)self logKey];
      v9 = [v6 componentsJoinedByString:@", "];
      int v10 = 138412546;
      v11 = v8;
      __int16 v12 = 2114;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Skipping unsupported installType apps: [%{public}@]", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (BOOL)shouldCollectMetrics
{
  v2 = sub_1003DA6D4();
  char v3 = [v2 isHRNMode] ^ 1;

  return v3;
}

- (void)_handleAppDeletion:(id)a3
{
  id v4 = a3;
  [(CrossfireMetricsHandler *)self _removeAppUsageSessionForBundleID:v4];
  if (self) {
    currentApps = self->super._currentApps;
  }
  else {
    currentApps = 0;
  }
  id v6 = currentApps;
  BOOL v7 = [(NSDictionary *)v6 objectForKeyedSubscript:v4];

  if (v7 && sub_1003A3FC4(v7))
  {
    v8 = +[NSMutableDictionary dictionary];
    v9 = sub_1003A3F54(v7);
    [v8 setObject:v9 forKeyedSubscript:@"bundle_version"];

    int v10 = [v7 valueForProperty:@"evid"];
    [v8 setObject:v10 forKeyedSubscript:@"evid"];

    v11 = [v7 valueForProperty:@"item_name"];
    [v8 setObject:v11 forKeyedSubscript:@"item_name"];

    __int16 v12 = [v7 valueForProperty:@"short_version"];
    [v8 setObject:v12 forKeyedSubscript:@"short_version"];

    if ([v8 count])
    {
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2020000000;
      uint64_t v31 = 0;
      v13 = sub_10038F000();
      v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      v22 = sub_10028C574;
      id v23 = &unk_100525018;
      id v14 = v4;
      id v24 = v14;
      v25 = self;
      id v15 = v8;
      id v26 = v15;
      id v27 = &v28;
      [v13 modifyUsingTransaction:&v20];

      if (v29[3] >= 1)
      {
        __int16 v16 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = [(CrossfireMetricsHandler *)self logKey];
          id v18 = [v15 count];
          uint64_t v19 = v29[3];
          *(_DWORD *)buf = 138413058;
          v33 = v17;
          __int16 v34 = 2114;
          id v35 = v14;
          __int16 v36 = 2048;
          id v37 = v18;
          __int16 v38 = 2048;
          uint64_t v39 = v19;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%@] [%{public}@] Transferred %ld metadata properties to %ld clip card view event(s)", buf, 0x2Au);
        }
      }

      _Block_object_dispose(&v28, 8);
    }
  }
}

- (void)_removeAppUsageSessionForBundleID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_10038F000();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10028C9B4;
  v7[3] = &unk_1005228E8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 modifyUsingTransaction:v7];
}

- (void).cxx_destruct
{
}

@end