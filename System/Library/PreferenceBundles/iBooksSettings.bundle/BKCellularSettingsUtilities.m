@interface BKCellularSettingsUtilities
+ (BOOL)_updateCachedNetworkLimitIfNeeded:(id)a3 outUpdatedValue:(unint64_t *)a4;
+ (id)cellularSettingsForCurrentIdentity;
+ (id)formattedNetworkLimitForDownloadKind:(id)a3 runBlockIfNeedsUpdate:(id)a4;
+ (void)loadNetworkLimitForDownloadKind:(id)a3 runBlockIfNeedsUpdate:(id)a4;
@end

@implementation BKCellularSettingsUtilities

+ (id)cellularSettingsForCurrentIdentity
{
  id v2 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
  id v10 = 0;
  v3 = [v2 getCurrentDataSubscriptionContextSync:&v10];
  id v4 = v10;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_F408((uint64_t)v4);
  }
  id v9 = v4;
  v5 = +[BUCellularIdentity identityForSubscription:v3 usingClient:v2 error:&v9];
  id v6 = v9;

  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_F388((uint64_t)v6);
  }
  v7 = +[BUCellularSettings settingsForIdentity:v5];

  return v7;
}

+ (BOOL)_updateCachedNetworkLimitIfNeeded:(id)a3 outUpdatedValue:(unint64_t *)a4
{
  id v5 = a3;
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"LastNetworkLimit", @"com.apple.iBooks", &keyExistsAndHasValidFormat);
  if (!v5) {
    goto LABEL_8;
  }
  id v7 = (id)AppIntegerValue;
  id v8 = [v5 sizeLimitForNetworkType:AMSNetworkTypeCellular];
  unint64_t v9 = (unint64_t)v8;
  if (!keyExistsAndHasValidFormat)
  {
    if (v8) {
      goto LABEL_10;
    }
LABEL_8:
    BOOL v11 = 0;
    goto LABEL_13;
  }
  if (v8 == v7 || v8 == 0) {
    goto LABEL_8;
  }
LABEL_10:
  CFPreferencesSetAppValue(@"LastNetworkLimit", +[NSNumber numberWithUnsignedLongLong:v8], @"com.apple.iBooks");
  if (a4) {
    *a4 = v9;
  }
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

+ (void)loadNetworkLimitForDownloadKind:(id)a3 runBlockIfNeedsUpdate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[BUBag defaultBag];
  unint64_t v9 = +[AMSNetworkConstraints networkConstraintsForMediaType:v7 withBag:v8];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_4A5C;
  v11[3] = &unk_18718;
  id v12 = v6;
  id v13 = a1;
  id v10 = v6;
  [v9 addFinishBlock:v11];
}

+ (id)formattedNetworkLimitForDownloadKind:(id)a3 runBlockIfNeedsUpdate:(id)a4
{
  id v6 = a4;
  Boolean keyExistsAndHasValidFormat = 0;
  id v7 = a3;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"LastNetworkLimit", @"com.apple.iBooks", &keyExistsAndHasValidFormat);
  int v9 = keyExistsAndHasValidFormat;
  id v10 = +[BUBag defaultBag];
  BOOL v11 = [v10 mobileNetworkConstraints];
  if ([v11 isLoaded])
  {
    id v12 = +[AMSNetworkConstraints networkConstraintsForMediaType:v7 withBag:v10];

    id v19 = 0;
    id v13 = [v12 resultWithError:&v19];
    id v14 = v19;
    id v7 = v12;
  }
  else
  {
    [a1 loadNetworkLimitForDownloadKind:v7 runBlockIfNeedsUpdate:v6];
    id v13 = 0;
    id v14 = 0;
  }

  if (!v9) {
    CFIndex AppIntegerValue = 200000000;
  }
  CFIndex v18 = 0;
  if ([a1 _updateCachedNetworkLimitIfNeeded:v13 outUpdatedValue:&v18]) {
    CFIndex v15 = v18;
  }
  else {
    CFIndex v15 = AppIntegerValue;
  }
  v16 = +[NSByteCountFormatter stringFromByteCount:v15 countStyle:2];

  return v16;
}

@end