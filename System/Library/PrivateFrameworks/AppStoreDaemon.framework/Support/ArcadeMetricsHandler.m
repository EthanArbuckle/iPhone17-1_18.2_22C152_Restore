@interface ArcadeMetricsHandler
- (BOOL)isCandidateAppMetadata:(id)a3;
- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4;
- (BOOL)shouldCollectMetrics;
- (id)logKey;
- (int64_t)_arcadeAppCount;
- (int64_t)appUsageType;
- (void)recordDeletedBundleIDs:(id)a3;
- (void)recordInstallEventsForBundleIDs:(id)a3 installType:(unsigned __int8)a4;
@end

@implementation ArcadeMetricsHandler

- (int64_t)appUsageType
{
  return 3;
}

- (BOOL)isCandidateAppMetadata:(id)a3
{
  if (a3) {
    return sub_1003A400C(a3);
  }
  else {
    return 0;
  }
}

- (BOOL)isCandidateAppProxy:(id)a3 isMetadataLookup:(BOOL)a4
{
  id v4 = a3;
  BOOL v5 = [v4 isInstalled] && (objc_msgSend(v4, "isArcade") & 1) != 0;

  return v5;
}

- (void)recordInstallEventsForBundleIDs:(id)a3 installType:(unsigned __int8)a4
{
  id v5 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v6 = +[LSDatabaseContext sharedDatabaseContext];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100261B68;
  v14[3] = &unk_1005240B0;
  id v7 = v5;
  id v15 = v7;
  v16 = self;
  v17 = &v18;
  [v6 accessUsingBlock:v14];

  if (v19[3] >= 1)
  {
    int64_t v8 = [(ArcadeMetricsHandler *)self _arcadeAppCount];
    v9 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(ArcadeMetricsHandler *)self logKey];
      v11 = [v7 componentsJoinedByString:@", "];
      uint64_t v12 = v19[3];
      *(_DWORD *)buf = 138413058;
      v23 = v10;
      __int16 v24 = 2114;
      v25 = v11;
      __int16 v26 = 2048;
      uint64_t v27 = v12;
      __int16 v28 = 2048;
      int64_t v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%@] Apps installed [%{public}@] arcade install count: %ld arcade app count: %ld", buf, 0x2Au);
    }
    if (v8 == v19[3])
    {
      v13 = sub_10037B958();
      sub_10037F494((uint64_t)v13, @"Install", 1, &stru_1005240D0);
    }
  }

  _Block_object_dispose(&v18, 8);
}

- (id)logKey
{
  logKey = self->_logKey;
  if (!logKey)
  {
    id v4 = self->super._baseLogKey;
    id v5 = [(LogKey *)v4 prependingCategory:@"Arcade"];
    v6 = self->_logKey;
    self->_logKey = v5;

    logKey = self->_logKey;
  }
  return logKey;
}

- (void)recordDeletedBundleIDs:(id)a3
{
  id v4 = a3;
  id v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [(ArcadeMetricsHandler *)self logKey];
    id v7 = [v4 componentsJoinedByString:@", "];
    int v8 = 138412546;
    v9 = v6;
    __int16 v10 = 2114;
    v11 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%@] Apps uninstalled: [%{public}@]", (uint8_t *)&v8, 0x16u);
  }
}

- (BOOL)shouldCollectMetrics
{
  v2 = sub_1003DA6D4();
  char v3 = [v2 isHRNMode] ^ 1;

  return v3;
}

- (int64_t)_arcadeAppCount
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100261F20;
  v4[3] = &unk_1005240F8;
  v4[4] = self;
  v4[5] = &v5;
  +[ApplicationProxy enumerateApplicationsOfType:0 usingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void).cxx_destruct
{
}

@end