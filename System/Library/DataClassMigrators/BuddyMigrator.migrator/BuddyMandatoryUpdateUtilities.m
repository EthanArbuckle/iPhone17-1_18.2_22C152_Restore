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
  return [(id)objc_opt_class() _mandatoryUpdateInformationFromActivation] != 0;
}

+ (BOOL)isUpdateRequired
{
  unint64_t v2 = (unint64_t)[(id)objc_opt_class() _mandatoryUpdateInformationFromActivation];
  unsigned int v3 = [(id)objc_opt_class() deviceIsFromFactory];
  uint64_t v4 = 4;
  if (v3) {
    uint64_t v4 = 1;
  }
  return (v4 & v2) != 0;
}

+ (BOOL)isUpdateAllowedOnCellular:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  uint64_t v4 = (void *)qword_27110;
  uint64_t v14 = qword_27110;
  if (!qword_27110)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_A67C;
    v10[3] = &unk_20950;
    v10[4] = &v11;
    sub_A67C((uint64_t)v10);
    uint64_t v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  v6 = [v5 userDownloadPolicyForDescriptor:v3 existingPolicy:0];
  if ([v6 isDownloadAllowableForCellular])
  {
    v7 = +[NSUserDefaults standardUserDefaults];
    unsigned int v8 = [v7 BOOLForKey:@"MandatoryUpdateRequiresWiFi"] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (BOOL)deviceIsFromFactory
{
  return +[BYWarranty shouldDisplay];
}

+ (id)humanReadableCurrentOSVersion
{
  id v3 = (void *)MGCopyAnswer();
  uint64_t v4 = (void *)MGCopyAnswer();
  id v5 = [a1 _humanReadableOSVersionWithProductVersion:v3 buildVersion:v4];

  return v5;
}

+ (id)humanReadableOSVersionFromScanOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestedPMV];
  v6 = [v4 requestedBuild];

  v7 = [a1 _humanReadableOSVersionWithProductVersion:v5 buildVersion:v6];

  return v7;
}

+ (id)_humanReadableOSVersionWithProductVersion:(id)a3 buildVersion:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
    unsigned int v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"UNKNOWN" value:&stru_21638 table:@"Localizable"];
LABEL_6:

    goto LABEL_10;
  }
  if (v6)
  {
    if (v5)
    {
      unsigned int v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v10 = [v8 localizedStringForKey:@"MANDATORY_UPDATE_INFO_HUMAN_READABLE_VERSION" value:&stru_21638 table:@"MandatorySoftwareUpdate"];
      v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v5, v7);

      goto LABEL_6;
    }
    id v11 = (id)v6;
  }
  else
  {
    id v11 = (id)v5;
  }
  v9 = v11;
LABEL_10:

  return v9;
}

+ (void)removeInformation
{
  unint64_t v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Remove mandatory update information on device...", v4, 2u);
  }

  id v3 = [objc_alloc((Class)sub_9FF8()) initWithDelegate:0 clientType:1];
  [v3 setMandatorySoftwareUpdateDictionary:0];
}

+ (unint64_t)_mandatoryUpdateInformationFromActivation
{
  id v2 = objc_alloc((Class)sub_9FF8());
  id v3 = dispatch_get_global_queue(0, 0);
  id v4 = [v2 initWithDelegate:0 queue:v3 clientType:1];

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_A210;
  v8[3] = &unk_20AC0;
  v10 = &v11;
  unint64_t v5 = dispatch_semaphore_create(0);
  v9 = v5;
  [v4 getMandatorySoftwareUpdateDictionary:v8];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end