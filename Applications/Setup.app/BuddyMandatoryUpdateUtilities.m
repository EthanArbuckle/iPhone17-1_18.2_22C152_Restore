@interface BuddyMandatoryUpdateUtilities
+ (BOOL)deviceIsFromFactory;
+ (BOOL)hasInformation;
+ (BOOL)isUpdateAllowedOnCellular:(id)a3;
+ (BOOL)isUpdateRequired;
+ (id)_humanReadableOSVersionWithProductVersion:(id)a3 buildVersion:(id)a4;
+ (id)humanReadableCurrentOSVersion;
+ (id)humanReadableOSVersionFromScanOptions:(id)a3;
+ (unint64_t)_mandatoryUpdateInformationFromActivation;
+ (void)removeInformation;
@end

@implementation BuddyMandatoryUpdateUtilities

+ (BOOL)hasInformation
{
  return [_mandatoryUpdateInformationFromActivation:a2:a1] != 0;
}

+ (BOOL)isUpdateRequired
{
  unsigned __int8 v3 = [objc_opt_class() _mandatoryUpdateInformationFromActivation:0 a2];
  if ([(id)objc_opt_class() deviceIsFromFactory]) {
    return (v3 & 1) != 0;
  }
  else {
    return (v3 & 4) != 0;
  }
}

+ (BOOL)isUpdateAllowedOnCellular:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = [sub_10008B31C() userDownloadPolicyForDescriptor:location[0] existingPolicy:0];
  unsigned __int8 v3 = [v8 isDownloadAllowableForCellular];
  char v6 = 0;
  char v4 = 0;
  if (v3)
  {
    v7 = +[NSUserDefaults standardUserDefaults];
    char v6 = 1;
    char v4 = ![(NSUserDefaults *)v7 BOOLForKey:@"MandatoryUpdateRequiresWiFi"];
  }
  char v10 = v4 & 1;
  if (v6) {

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10 & 1;
}

+ (BOOL)deviceIsFromFactory
{
  return +[BYWarranty shouldDisplay] & 1;
}

+ (id)humanReadableCurrentOSVersion
{
  id v7 = a1;
  location[1] = (id)a2;
  location[0] = (id)MGCopyAnswer();
  uint64_t v2 = MGCopyAnswer();
  id v3 = [v7 _humanReadableOSVersionWithProductVersion:location[0] buildVersion:v2];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);

  return v3;
}

+ (id)humanReadableOSVersionFromScanOptions:(id)a3
{
  id v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = [location[0] requestedPMV];
  id v5 = [location[0] requestedBuild];
  id v3 = [v8 _humanReadableOSVersionWithProductVersion:v6 buildVersion:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);

  return v3;
}

+ (id)_humanReadableOSVersionWithProductVersion:(id)a3 buildVersion:(id)a4
{
  id v12 = a1;
  SEL v11 = a2;
  *((void *)&v10 + 1) = 0;
  objc_storeStrong((id *)&v10 + 1, a3);
  *(void *)&long long v10 = 0;
  objc_storeStrong((id *)&v10, a4);
  if (v10 == 0)
  {
    id v5 = +[NSBundle mainBundle];
    v13 = [(NSBundle *)v5 localizedStringForKey:@"UNKNOWN" value:&stru_1002B4E18 table:@"Localizable"];
  }
  else if ((void)v10)
  {
    if (*((void *)&v10 + 1))
    {
      id v6 = +[NSBundle bundleForClass:objc_opt_class()];
      id v7 = [(NSBundle *)v6 localizedStringForKey:@"MANDATORY_UPDATE_INFO_HUMAN_READABLE_VERSION" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
      v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, *((void *)&v10 + 1), (void)v10);
    }
    else
    {
      v13 = (NSString *)(id)v10;
    }
  }
  else
  {
    v13 = (NSString *)*((id *)&v10 + 1);
  }
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v10 + 1, 0);
  id v8 = v13;

  return v8;
}

+ (void)removeInformation
{
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = oslog[0];
    os_log_type_t v3 = v6;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Remove mandatory update information on device...", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  id location = [objc_alloc((Class)sub_10008B864()) initWithDelegate:0 clientType:1];
  [location setMandatorySoftwareUpdateDictionary:0];
  objc_storeStrong(&location, 0);
}

+ (unint64_t)_mandatoryUpdateInformationFromActivation
{
  v19[2] = a1;
  v19[1] = (id)a2;
  id v2 = objc_alloc((Class)sub_10008B864());
  os_log_type_t v3 = dispatch_get_global_queue(0, 0);
  v19[0] = [v2 initWithDelegate:0 queue:v3 clientType:1];

  id location = dispatch_semaphore_create(0);
  uint64_t v13 = 0;
  v14 = &v13;
  int v15 = 0x20000000;
  int v16 = 32;
  uint64_t v17 = 0;
  id v4 = v19[0];
  id v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  long long v10 = sub_10008BAEC;
  SEL v11 = &unk_1002B1D08;
  v12[1] = &v13;
  v12[0] = location;
  [v4 getMandatorySoftwareUpdateDictionary:&v7];
  dispatch_semaphore_wait((dispatch_semaphore_t)location, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v5 = v14[3];
  objc_storeStrong(v12, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v19, 0);
  return v5;
}

@end