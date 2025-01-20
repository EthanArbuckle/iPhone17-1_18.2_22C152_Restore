@interface NSURLSessionConfiguration
+ (id)_asset_configurationIdentifierUsingProperties:(id)a3;
+ (id)asset_backgroundSessionConfigurationUsingProperties:(id)a3;
+ (id)asset_configurationIdentifierUsingProperties:(id)a3;
+ (id)asset_ephemeralSessionConfigurationUsingProperties:(id)a3;
+ (void)_asset_initializeConnectionPools;
- (void)_asset_setConfigurationDefaults;
- (void)_asset_setConfigurationUsingProperties:(id)a3;
@end

@implementation NSURLSessionConfiguration

+ (id)asset_backgroundSessionConfigurationUsingProperties:(id)a3
{
  id v3 = a3;
  v4 = +[NSUUID UUID];
  v5 = [v4 UUIDString];

  v6 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:v5];
  objc_msgSend(v6, "_asset_setConfigurationDefaults");
  objc_msgSend(v6, "_asset_setConfigurationUsingProperties:", v3);

  return v6;
}

+ (id)asset_ephemeralSessionConfigurationUsingProperties:(id)a3
{
  id v3 = a3;
  v4 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  objc_msgSend(v4, "_asset_setConfigurationDefaults");
  objc_msgSend(v4, "_asset_setConfigurationUsingProperties:", v3);

  objc_msgSend(v4, "set_connectionCachePurgeTimeout:", 1.0);
  objc_msgSend(v4, "set_longLivedConnectionCachePurgeTimeout:", 1.0);
  objc_msgSend(v4, "set_preventsIdleSleepOnceConnected:", 1);

  return v4;
}

+ (id)asset_configurationIdentifierUsingProperties:(id)a3
{
  return _objc_msgSend(a1, "_asset_configurationIdentifierUsingProperties:", a3);
}

+ (id)_asset_configurationIdentifierUsingProperties:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray arrayWithObject:@"com.apple.storekit"];
  v5 = [v3 networkBudgetingIdentifier];

  if (v5)
  {
    v6 = [v3 networkBudgetingIdentifier];
    [v4 addObject:v6];
  }
  v7 = [v3 duetBudgetingIdentifier];

  if (v7)
  {
    v8 = [v3 duetBudgetingIdentifier];
    [v4 addObject:v8];
  }
  if ([v3 enforceATS]) {
    [v4 addObject:@"ats"];
  }
  if ([v3 discretionaryType])
  {
    id v9 = [v3 discretionaryType];
    if (v9 == (id)2)
    {
      CFStringRef v10 = @"discretionary-always";
    }
    else
    {
      if (v9 != (id)1) {
        goto LABEL_13;
      }
      CFStringRef v10 = @"discretionary-inferred";
    }
    [v4 addObject:v10];
  }
LABEL_13:
  if (([v3 allowsExpensiveNetworkAccess] & 1) == 0) {
    [v4 addObject:@"inexpensive"];
  }
  if ([v3 allowsCellularAccess])
  {
    if ([v3 allowsWatchCellularAccess]) {
      goto LABEL_20;
    }
    CFStringRef v11 = @"phone";
  }
  else
  {
    CFStringRef v11 = @"wifi";
  }
  [v4 addObject:v11];
LABEL_20:
  if (([v3 allowsConstrainedNetworkAccess] & 1) == 0) {
    [v4 addObject:@"nolowdata"];
  }
  if ([v3 requiresPowerPluggedIn]) {
    [v4 addObject:@"power"];
  }
  v12 = [v4 componentsJoinedByString:@"."];

  return v12;
}

+ (void)_asset_initializeConnectionPools
{
  if (qword_10039F8E0 != -1) {
    dispatch_once(&qword_10039F8E0, &stru_1003582F0);
  }
}

- (void)_asset_setConfigurationDefaults
{
  [(NSURLSessionConfiguration *)self setHTTPCookieAcceptPolicy:1];
  [(NSURLSessionConfiguration *)self setHTTPShouldSetCookies:0];
  [(NSURLSessionConfiguration *)self setHTTPShouldUsePipelining:1];
  [(NSURLSessionConfiguration *)self setRequestCachePolicy:1];

  [(NSURLSessionConfiguration *)self set_timingDataOptions:69];
}

- (void)_asset_setConfigurationUsingProperties:(id)a3
{
  id v4 = a3;
  v5 = [v4 networkBudgetingIdentifier];
  [(NSURLSessionConfiguration *)self set_sourceApplicationBundleIdentifier:v5];

  v6 = [v4 duetBudgetingIdentifier];
  [(NSURLSessionConfiguration *)self set_sourceApplicationSecondaryIdentifier:v6];

  if ([v4 enforceATS])
  {
    CFStringRef v18 = @"NSAllowsArbitraryLoads";
    v19 = &__kCFBooleanFalse;
    v7 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v17 = 0;
    v8 = +[NSPropertyListSerialization dataWithPropertyList:v7 format:200 options:0 error:&v17];
    id v9 = v17;

    if (v8)
    {
      [(NSURLSessionConfiguration *)self set_atsContext:v8];
    }
    else
    {
      if (qword_10039F948 != -1) {
        dispatch_once(&qword_10039F948, &stru_100358350);
      }
      CFStringRef v10 = (void *)qword_10039F900;
      if (os_log_type_enabled((os_log_t)qword_10039F900, OS_LOG_TYPE_ERROR)) {
        sub_1002C2570(v10, v4, (uint64_t)v9);
      }
    }
  }
  -[NSURLSessionConfiguration set_requiresPowerPluggedIn:](self, "set_requiresPowerPluggedIn:", [v4 requiresPowerPluggedIn]);
  -[NSURLSessionConfiguration setAllowsCellularAccess:](self, "setAllowsCellularAccess:", [v4 allowsCellularAccess]);
  -[NSURLSessionConfiguration setAllowsConstrainedNetworkAccess:](self, "setAllowsConstrainedNetworkAccess:", [v4 allowsConstrainedNetworkAccess]);
  -[NSURLSessionConfiguration setAllowsExpensiveNetworkAccess:](self, "setAllowsExpensiveNetworkAccess:", [v4 allowsExpensiveNetworkAccess]);
  unint64_t v11 = (unint64_t)[v4 discretionaryType];
  if (v11 <= 2)
  {
    unint64_t v12 = v11 & 1;
    [(NSURLSessionConfiguration *)self setDiscretionary:(v11 & 7) == 2];
    [(NSURLSessionConfiguration *)self set_infersDiscretionaryFromOriginatingClient:v12];
  }
  v13 = [v4 protocolClasses];

  if (v13)
  {
    v14 = [v4 protocolClasses];
    [(NSURLSessionConfiguration *)self setProtocolClasses:v14];
  }
  if ([v4 connectionPool])
  {
    +[NSURLSessionConfiguration _asset_initializeConnectionPools];
    id v15 = [v4 connectionPool];
    if (v15 == (id)1)
    {
      CFStringRef v16 = @"com.apple.storekit.connectionPool.apps";
      goto LABEL_18;
    }
    if (v15 == (id)2)
    {
      CFStringRef v16 = @"com.apple.storekit.connectionPool.odr";
LABEL_18:
      [(NSURLSessionConfiguration *)self set_connectionPoolName:v16];
    }
  }
}

@end