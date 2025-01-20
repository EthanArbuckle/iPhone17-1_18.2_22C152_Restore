@interface DNUMetricsHandler
- (BOOL)isCandidateAppMetadata:(id)a3;
- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4;
- (BOOL)shouldCollectMetrics;
- (id)logKey;
- (int64_t)appUsageType;
- (void)_recordCrashEventsSinceDate:(id)a3;
- (void)recordDeletedBundleIDs:(id)a3;
- (void)recordInstallEventsForBundleIDs:(id)a3 installType:(unsigned __int8)a4;
- (void)recordSupplementalAppMetricsEvents;
@end

@implementation DNUMetricsHandler

- (int64_t)appUsageType
{
  return 2;
}

- (BOOL)isCandidateAppMetadata:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && (sub_1003A400C(v4) & 1) == 0)
  {
    if (sub_1003A409C(v5))
    {
      v8 = sub_10031CA20();
      id v16 = 0;
      v9 = sub_10031CD70((uint64_t)v8, &v16);
      id v10 = v16;

      if (v10)
      {
        v11 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v13 = [(DNUMetricsHandler *)self logKey];
          *(_DWORD *)buf = 138412546;
          v18 = v13;
          __int16 v19 = 2114;
          id v20 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%@] Error looking up system apps. Error: %{public}@", buf, 0x16u);
        }
        unsigned __int8 v6 = 0;
      }
      else
      {
        v12 = sub_1003A3938(v5);
        unsigned __int8 v6 = [v9 containsObject:v12];

        v11 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v14 = [(DNUMetricsHandler *)self logKey];
          v15 = sub_1003A3938(v5);
          *(_DWORD *)buf = 138412546;
          v18 = v14;
          __int16 v19 = 2114;
          id v20 = v15;
          _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%@] [%{public}@] We have an eligible system app", buf, 0x16u);
        }
      }
    }
    else
    {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 isArcade];
  if (v7)
  {
    v8 = ASDLogHandleForCategory();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_3;
    }
    v15 = [(DNUMetricsHandler *)self logKey];
    id v16 = [v6 bundleID];
    *(_DWORD *)buf = 138412546;
    v22 = v15;
    __int16 v23 = 2114;
    id v24 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%@] [%{public}@] Skipping non candidate app", buf, 0x16u);
LABEL_24:

    goto LABEL_3;
  }
  if (a4)
  {
    unsigned int v10 = 0;
  }
  else
  {
    v11 = sub_10031CA20();
    id v20 = 0;
    v12 = sub_10031CD70((uint64_t)v11, &v20);
    id v13 = v20;

    if (v13)
    {
      v14 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = [(DNUMetricsHandler *)self logKey];
        *(_DWORD *)buf = 138412546;
        v22 = v19;
        __int16 v23 = 2114;
        id v24 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%@] Error looking up system apps. Error: %{public}@", buf, 0x16u);
      }
      unsigned int v10 = 0;
    }
    else
    {
      v14 = [v6 bundleID];
      unsigned int v10 = [v12 containsObject:v14];
    }
  }
  if (([v6 isStoreOriginated] & 1) == 0 && !v10
    || ([v6 isProfileValidated] & 1) != 0
    || [v6 hasMIDBasedSINF] && !objc_msgSend(v6, "isAppClip")
    || ([v6 isInstalled] & 1) == 0 && !objc_msgSend(v6, "isOffloaded"))
  {
    char v9 = 0;
    goto LABEL_22;
  }
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v15 = [(DNUMetricsHandler *)self logKey];
    id v16 = [v6 bundleID];
    v17 = [v6 shortVersionString];
    *(_DWORD *)buf = 138412802;
    v22 = v15;
    __int16 v23 = 2114;
    id v24 = v16;
    __int16 v25 = 2114;
    v26 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%@] [%{public}@] We have an eligible app with version: %{public}@", buf, 0x20u);

    goto LABEL_24;
  }
LABEL_3:
  char v9 = v7 ^ 1;

LABEL_22:
  return v9;
}

- (id)logKey
{
  logKey = self->_logKey;
  if (!logKey)
  {
    id v4 = self->super._baseLogKey;
    v5 = [(LogKey *)v4 prependingCategory:@"DNU"];
    id v6 = self->_logKey;
    self->_logKey = v5;

    logKey = self->_logKey;
  }
  return logKey;
}

- (void)recordSupplementalAppMetricsEvents
{
  v3 = sub_1002E1C14((uint64_t)MetricsCoordinator, 2);
  if (v3)
  {
    [(DNUMetricsHandler *)self _recordCrashEventsSinceDate:v3];
  }
  else
  {
    id v4 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(DNUMetricsHandler *)self logKey];
      int v11 = 138412290;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%@] Skipping due to lack of supplemental date", (uint8_t *)&v11, 0xCu);
    }
  }
  sub_1002E1E70((uint64_t)MetricsCoordinator, 2);
  id v6 = sub_1002E1C14((uint64_t)MetricsCoordinator, 2);

  unsigned int v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = [(DNUMetricsHandler *)self logKey];
    if (v6)
    {
      [v6 timeIntervalSince1970];
      uint64_t v10 = (uint64_t)v9;
    }
    else
    {
      uint64_t v10 = 0;
    }
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%@] Updated supplemental date to: %{time_t}ld", (uint8_t *)&v11, 0x16u);
  }
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
    unsigned int v7 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(DNUMetricsHandler *)self logKey];
      double v9 = [v6 componentsJoinedByString:@", "];
      int v10 = 138412546;
      int v11 = v8;
      __int16 v12 = 2114;
      __int16 v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Skipping unsupported installType apps: [%{public}@]", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)recordDeletedBundleIDs:(id)a3
{
}

- (BOOL)shouldCollectMetrics
{
  v2 = sub_1003DA6D4();
  if ([v2 isHRNMode]) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = sub_10033641C();
  }

  return v3;
}

- (void)_recordCrashEventsSinceDate:(id)a3
{
  uint64_t v4 = [(MetricsHandler *)self getCrashEventsSinceDate:a3];
  v5 = sub_10038F000();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10028DB88;
  v7[3] = &unk_1005228E8;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  [v5 modifyUsingTransaction:v7];
}

- (void).cxx_destruct
{
}

@end