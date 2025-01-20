@interface IXSHealthKitDataUninstallAlert
+ (BOOL)healthKitDataSupportedOnDevice;
+ (Class)hkBehaviorClass;
+ (Class)hkHealthStoreClass;
+ (Class)hkSourceStoreClass;
+ (void)healthKitDataPresentForAppWithBundleID:(id)a3 completion:(id)a4;
+ (void)openHealthKitClasses;
+ (void)viewHealthKitDataForAppWithBundleID:(id)a3;
- (IXSHealthKitDataUninstallAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4;
- (id)cancelButtonLabel;
- (id)defaultButtonLabel;
- (id)message;
- (id)title;
- (unint64_t)notificationFlags;
@end

@implementation IXSHealthKitDataUninstallAlert

+ (void)openHealthKitClasses
{
  if (qword_100109F50 != -1) {
    dispatch_once(&qword_100109F50, &stru_1000EACE8);
  }
}

+ (Class)hkHealthStoreClass
{
  +[IXSHealthKitDataUninstallAlert openHealthKitClasses];
  v2 = (void *)qword_100109F68;

  return (Class)v2;
}

+ (Class)hkSourceStoreClass
{
  +[IXSHealthKitDataUninstallAlert openHealthKitClasses];
  v2 = (void *)qword_100109F70;

  return (Class)v2;
}

+ (Class)hkBehaviorClass
{
  +[IXSHealthKitDataUninstallAlert openHealthKitClasses];
  v2 = (void *)qword_100109F78;

  return (Class)v2;
}

+ (BOOL)healthKitDataSupportedOnDevice
{
  if (qword_100109F60 != -1) {
    dispatch_once(&qword_100109F60, &stru_1000EAD08);
  }
  return byte_100109F58;
}

- (IXSHealthKitDataUninstallAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IXSHealthKitDataUninstallAlert;
  v4 = [(IXSUninstallAlert *)&v7 initWithAppRecord:a3 bundleIdentifier:a4 removability:1 deletionIsRestricted:0];
  v5 = v4;
  if (v4)
  {
    [(IXSUninstallAlert *)v4 setTypeDescription:@"HealthKit data"];
    [(IXSUninstallAlert *)v5 setDefaultButtonAppearsDestructive:0];
  }
  return v5;
}

- (id)title
{
  v3 = @"HEALTHKIT_SHOW_DATA_TITLE";
  v4 = [(IXSUninstallAlert *)self localizedStringForKey:@"HEALTHKIT_SHOW_DATA_TITLE" withFormatHint:@"There is data from “%@” saved in Health"];
  if (v4 != @"There is data from “%@” saved in Health")
  {
    v5 = [(IXSUninstallAlert *)self appRecord];
    v6 = [v5 localizedName];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)message
{
  v2 = @"HEALTHKIT_SHOW_DATA_BODY";
  v3 = [(IXSUninstallAlert *)self localizedStringForKey:@"HEALTHKIT_SHOW_DATA_BODY" withFormatHint:@"This data will remain in Health unless you choose to delete it."];
  if (v3 != @"This data will remain in Health unless you choose to delete it.")
  {
    v2 = +[NSString stringWithFormat:v3];
  }

  return v2;
}

- (id)defaultButtonLabel
{
  return [(IXSUninstallAlert *)self localizedStringForKey:@"HEALTHKIT_SHOW_DATA_DISMISS" withFormatHint:@"OK"];
}

- (id)cancelButtonLabel
{
  if ([(id)objc_opt_class() healthKitDataSupportedOnDevice])
  {
    v3 = [(IXSUninstallAlert *)self localizedStringForKey:@"HEALTHKIT_SHOW_DATA_VIEW" withFormatHint:@"View"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (unint64_t)notificationFlags
{
  if ([(id)objc_opt_class() healthKitDataSupportedOnDevice]) {
    return 3;
  }
  else {
    return 35;
  }
}

+ (void)healthKitDataPresentForAppWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  objc_super v7 = (void (**)(id, void))a4;
  if ([@"com.apple.Health" isEqualToString:v6])
  {
LABEL_11:
    v7[2](v7, 0);
    goto LABEL_12;
  }
  v8 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "+[IXSHealthKitDataUninstallAlert healthKitDataPresentForAppWithBundleID:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Checking if HealthKit data is available", buf, 0xCu);
  }

  unsigned int v9 = objc_msgSend(objc_msgSend(a1, "hkHealthStoreClass"), "isHealthDataAvailable");
  v10 = sub_100004B28((uint64_t)off_100109BB8);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315138;
      v18 = "+[IXSHealthKitDataUninstallAlert healthKitDataPresentForAppWithBundleID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: No HealthKit data available on the device", buf, 0xCu);
    }

    goto LABEL_11;
  }
  if (v11)
  {
    *(_DWORD *)buf = 136315138;
    v18 = "+[IXSHealthKitDataUninstallAlert healthKitDataPresentForAppWithBundleID:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Checking if this app has HealthKit data", buf, 0xCu);
  }

  id v12 = objc_alloc_init((Class)[a1 hkHealthStoreClass]);
  id v13 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "hkSourceStoreClass")), "initWithHealthStore:", v12);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000668AC;
  v14[3] = &unk_1000EAD30;
  id v15 = v6;
  v16 = v7;
  [v13 fetchHasSampleWithBundleIdentifier:v15 completion:v14];

LABEL_12:
}

+ (void)viewHealthKitDataForAppWithBundleID:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(objc_msgSend(a1, "hkBehaviorClass"), "sharedBehavior");
  unsigned int v6 = [v5 healthAppHiddenOrNotInstalled];

  if (v6)
  {
    objc_super v7 = +[NSURL URLWithString:@"prefs:root=HEALTH"];
  }
  else
  {
    v8 = +[NSString stringWithFormat:@"x-apple-health://AuthorizationManagement/%@", v4];
    objc_super v7 = +[NSURL URLWithString:v8];
  }
  unsigned int v9 = +[LSApplicationWorkspace defaultWorkspace];
  id v13 = 0;
  unsigned __int8 v10 = [v9 openSensitiveURL:v7 withOptions:0 error:&v13];
  id v11 = v13;

  if ((v10 & 1) == 0)
  {
    id v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v15 = "+[IXSHealthKitDataUninstallAlert viewHealthKitDataForAppWithBundleID:]";
      __int16 v16 = 2112;
      v17 = v7;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Failed to open url at %@: %@", buf, 0x20u);
    }
  }
}

@end