@interface ComponentSystemBase
- (BOOL)isBetaBuild;
- (BOOL)isGreenTeaDevice;
- (BOOL)isInternalInstall;
- (BOOL)isPresent;
- (BOOL)isProdDevice;
- (BOOL)isSetupAssistantCompleted;
- (id)ECID;
- (id)UDID;
- (id)activationConfigurationInformation;
- (id)buildVersion;
- (id)chipID;
- (id)cpuArchitecture;
- (id)deviceColor;
- (id)deviceType;
- (id)deviceVersion;
- (id)diagnosticsBuild;
- (id)diagnosticsVersion;
- (id)lastEraseDate;
- (id)lastRestoreDate;
- (id)lastUpdateDate;
- (id)localTime;
- (id)marketingName;
- (id)marketingProductNumber;
- (id)marketingVersion;
- (id)modelNumber;
- (id)productClass;
- (id)regulatoryModelNumber;
- (id)rootCreationDate;
- (id)serialNumber;
- (id)setupAssistantCompletionDate;
- (id)setupCompletedDate;
- (id)sikPublicKey;
- (id)storeDemoModeEnabled;
- (id)systemUptime;
- (id)systemVersion;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentSystemBase

- (BOOL)isPresent
{
  return 1;
}

- (void)populateAttributes:(id)a3
{
  id v38 = a3;
  v4 = [(ComponentSystemBase *)self systemUptime];
  v5 = [v4 stringValue];
  [v38 setObject:v5 forKeyedSubscript:@"systemUptime"];

  v6 = [(ComponentSystemBase *)self ECID];
  [v38 setObject:v6 forKeyedSubscript:@"ecid"];

  v7 = [(ComponentSystemBase *)self deviceColor];
  if ([v7 length]) {
    [v38 setObject:v7 forKeyedSubscript:@"deviceColor"];
  }
  v8 = [(ComponentSystemBase *)self deviceType];
  [v38 setObject:v8 forKeyedSubscript:@"deviceType"];

  v9 = [(ComponentSystemBase *)self deviceVersion];
  [v38 setObject:v9 forKeyedSubscript:@"deviceVersion"];

  v10 = [(ComponentSystemBase *)self cpuArchitecture];
  [v38 setObject:v10 forKeyedSubscript:@"cpuArchitecture"];

  v11 = [(ComponentSystemBase *)self UDID];
  [v38 setObject:v11 forKeyedSubscript:@"udid"];

  v12 = [(ComponentSystemBase *)self modelNumber];
  [v38 setObject:v12 forKeyedSubscript:@"modelNumber"];

  v13 = [(ComponentSystemBase *)self regulatoryModelNumber];
  [v38 setObject:v13 forKeyedSubscript:@"regulatoryModelNumber"];

  v14 = [(ComponentSystemBase *)self buildVersion];
  [v38 setObject:v14 forKeyedSubscript:@"systemBuild"];

  v15 = [(ComponentSystemBase *)self diagnosticsBuild];
  [v38 setObject:v15 forKeyedSubscript:@"diagnosticsBuild"];

  v16 = [(ComponentSystemBase *)self systemVersion];
  [v38 setObject:v16 forKeyedSubscript:@"systemVersion"];

  v17 = [(ComponentSystemBase *)self serialNumber];
  [v38 setObject:v17 forKeyedSubscript:@"deviceSerialNumber"];

  v18 = [(ComponentSystemBase *)self serialNumber];
  [v38 setObject:v18 forKeyedSubscript:@"serialNumber"];

  v19 = [(ComponentSystemBase *)self diagnosticsVersion];
  [v38 setObject:v19 forKeyedSubscript:@"diagnosticsVersion"];

  v20 = [(ComponentSystemBase *)self lastRestoreDate];
  [v38 setObject:v20 forKeyedSubscript:@"lastRestoreDate"];

  v21 = [(ComponentSystemBase *)self lastUpdateDate];
  [v38 setObject:v21 forKeyedSubscript:@"lastUpdateDate"];

  v22 = [(ComponentSystemBase *)self lastEraseDate];
  [v38 setObject:v22 forKeyedSubscript:@"lastEraseDate"];

  v23 = [(ComponentSystemBase *)self setupCompletedDate];
  [v38 setObject:v23 forKeyedSubscript:@"setupCompletedDate"];

  v24 = +[NSTimeZone localTimeZone];
  v25 = [v24 name];
  [v38 setObject:v25 forKeyedSubscript:@"localTimeZone"];

  v26 = [(ComponentSystemBase *)self localTime];
  [v38 setObject:v26 forKeyedSubscript:@"localTime"];

  v27 = [(ComponentSystemBase *)self marketingVersion];
  [v38 setObject:v27 forKeyedSubscript:@"marketingVersion"];

  v28 = [(ComponentSystemBase *)self chipID];
  [v38 setObject:v28 forKeyedSubscript:@"chipID"];

  v29 = +[NSNumber numberWithBool:[(ComponentSystemBase *)self isBetaBuild]];
  [v38 setObject:v29 forKeyedSubscript:@"isBetaBuild"];

  v30 = +[NSNumber numberWithBool:[(ComponentSystemBase *)self isInternalInstall]];
  [v38 setObject:v30 forKeyedSubscript:@"isInternalInstall"];

  v31 = +[NSNumber numberWithBool:[(ComponentSystemBase *)self isProdDevice]];
  [v38 setObject:v31 forKeyedSubscript:@"isProdDevice"];

  v32 = +[NSNumber numberWithBool:[(ComponentSystemBase *)self isGreenTeaDevice]];
  [v38 setObject:v32 forKeyedSubscript:@"greenTeaDevice"];

  v33 = +[NSNumber numberWithBool:DiagnosticLogSubmissionEnabled()];
  [v38 setObject:v33 forKeyedSubscript:@"analyticsEnabled"];

  v34 = [(ComponentSystemBase *)self storeDemoModeEnabled];
  [v38 setObject:v34 forKeyedSubscript:@"storeDemoModeEnabled"];

  v35 = [(ComponentSystemBase *)self sikPublicKey];
  [v38 setObject:v35 forKeyedSubscript:@"sik"];

  v36 = [(ComponentSystemBase *)self marketingProductNumber];
  [v38 setObject:v36 forKeyedSubscript:@"marketingProductNumber"];

  v37 = [(ComponentSystemBase *)self activationConfigurationInformation];
  if (v37) {
    [v38 addEntriesFromDictionary:v37];
  }
}

- (id)lastRestoreDate
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[ComponentSystemBase lastRestoreDate]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v3 = +[DSGeneralLogCollector latestUserLog];
  v4 = [v3 restoreDate];
  if (v4)
  {
    v5 = +[DSDateFormatter sharedFormatter];
    v6 = [v5 formatterWithType:0];
    v7 = [v6 stringFromDate:v4];
  }
  else
  {
    v7 = 0;
  }
  v8 = stringOrNull(v7);

  return v8;
}

- (id)lastUpdateDate
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[ComponentSystemBase lastUpdateDate]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v3 = +[DSGeneralLogCollector latestUserLog];
  v4 = [v3 updateDate];
  if (v4)
  {
    v5 = +[DSDateFormatter sharedFormatter];
    v6 = [v5 formatterWithType:0];
    v7 = [v6 stringFromDate:v4];
  }
  else
  {
    v7 = 0;
  }
  v8 = stringOrNull(v7);

  return v8;
}

- (id)lastEraseDate
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[ComponentSystemBase lastEraseDate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  v4 = [(ComponentSystemBase *)self rootCreationDate];
  v5 = stringOrNull(v4);

  return v5;
}

- (id)deviceVersion
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentSystemBase deviceVersion]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  v4 = stringOrNull(v3);

  return v4;
}

- (id)diagnosticsVersion
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[ComponentSystemBase diagnosticsVersion]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v3 = +[NSBundle mainBundle];
  v4 = [v3 infoDictionary];
  v5 = [v4 objectForKeyedSubscript:@"CFBundleShortVersionString"];
  int v6 = stringOrNull(v5);

  return v6;
}

- (id)marketingVersion
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[ComponentSystemBase marketingVersion]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  v3 = (void *)_CFCopySystemVersionDictionary();
  v4 = [v3 objectForKeyedSubscript:_kCFSystemVersionProductVersionKey];
  v5 = stringOrNull(v4);

  return v5;
}

- (id)systemVersion
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ComponentSystemBase systemVersion]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x3032000000;
  int v10 = sub_100032DC4;
  v11 = sub_100032DD4;
  id v12 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100032DDC;
  v7[3] = &unk_100084C98;
  v7[4] = &buf;
  v3 = objc_retainBlock(v7);
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  if (label == dispatch_queue_get_label(0))
  {
    ((void (*)(void *))v3[2])(v3);
  }
  else
  {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
  }
  v5 = stringOrNull(*(void **)(*((void *)&buf + 1) + 40));

  _Block_object_dispose(&buf, 8);

  return v5;
}

- (id)diagnosticsBuild
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[ComponentSystemBase diagnosticsBuild]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v3 = +[NSBundle mainBundle];
  v4 = [v3 infoDictionary];
  v5 = [v4 objectForKeyedSubscript:@"CFBundleVersion"];
  int v6 = stringOrNull(v5);

  return v6;
}

- (id)buildVersion
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentSystemBase buildVersion]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  v4 = stringOrNull(v3);

  return v4;
}

- (id)modelNumber
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentSystemBase modelNumber]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  v4 = stringOrNull(v3);

  return v4;
}

- (id)regulatoryModelNumber
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentSystemBase regulatoryModelNumber]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  v4 = stringOrNull(v3);

  return v4;
}

- (id)UDID
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentSystemBase UDID]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  v4 = stringOrNull(v3);

  return v4;
}

- (id)serialNumber
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentSystemBase serialNumber]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  v4 = stringOrNull(v3);

  return v4;
}

- (id)deviceType
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentSystemBase deviceType]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  v4 = stringOrNull(v3);

  return v4;
}

- (id)cpuArchitecture
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentSystemBase cpuArchitecture]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  v4 = stringOrNull(v3);

  return v4;
}

- (id)deviceColor
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[ComponentSystemBase deviceColor]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  if ([v3 isEqualToString:@"unknown"])
  {

    v3 = 0;
  }

  return v3;
}

- (id)systemUptime
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&buf[4] = "-[ComponentSystemBase systemUptime]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(_OWORD *)long long buf = 0uLL;
  *(void *)int v7 = 0x1500000001;
  size_t v6 = 16;
  if (sysctl(v7, 2u, buf, &v6, 0, 0))
  {
    v3 = &off_1000B7480;
  }
  else
  {
    v5.tv_sec = 0;
    *(void *)&v5.tv_usec = 0;
    gettimeofday(&v5, 0);
    v3 = +[NSNumber numberWithDouble:(double)(unint64_t)(1000000000 * (v5.tv_sec - *(void *)buf)+ 1000 * (v5.tv_usec - (uint64_t)*(int *)&buf[8]))/ 1000000000.0];
  }

  return v3;
}

- (id)ECID
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    size_t v6 = "-[ComponentSystemBase ECID]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v3 = +[NSString stringWithFormat:@"%llx", MGGetSInt64Answer()];

  return v3;
}

- (id)marketingName
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentSystemBase marketingName]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  v4 = stringOrNull(v3);

  return v4;
}

- (id)setupCompletedDate
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[ComponentSystemBase setupCompletedDate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v4 = [(ComponentSystemBase *)self setupAssistantCompletionDate];
  if (v4)
  {
    timeval v5 = +[DSDateFormatter sharedFormatter];
    int v6 = [v5 formatterWithType:0];
    int v7 = [v6 stringFromDate:v4];
  }
  else
  {
    int v7 = 0;
  }
  int v8 = stringOrNull(v7);

  return v8;
}

- (id)productClass
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[ComponentSystemBase productClass]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();

  return v3;
}

- (id)rootCreationDate
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[ComponentSystemBase rootCreationDate]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  if (+[CBSUtilities isCheckerBoardActive])
  {
    v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "lastEraseDate Component ignored on checkerboard", (uint8_t *)&v10, 2u);
    }
    v4 = 0;
  }
  else
  {
    int v5 = +[NSFileManager defaultManager];
    v3 = [v5 attributesOfItemAtPath:@"/private/var/" error:0];

    int v6 = [v3 objectForKey:NSFileCreationDate];
    int v7 = +[DSDateFormatter sharedFormatter];
    int v8 = [v7 formatterWithType:0];
    v4 = [v8 stringFromDate:v6];
  }

  return v4;
}

- (id)localTime
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[ComponentSystemBase localTime]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v3 = +[NSDate date];
  if (!v3)
  {
    v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Current date is nil.", (uint8_t *)&v9, 2u);
    }

    v3 = +[NSDate distantPast];
  }
  int v5 = +[DSDateFormatter sharedFormatter];
  int v6 = [v5 formatterWithType:0];
  int v7 = [v6 stringFromDate:v3];

  return v7;
}

- (id)setupAssistantCompletionDate
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[ComponentSystemBase setupAssistantCompletionDate]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  v3 = (void *)CFPreferencesCopyAppValue(@"SetupLastExit", @"com.apple.purplebuddy");

  return v3;
}

- (BOOL)isSetupAssistantCompleted
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[ComponentSystemBase isSetupAssistantCompleted]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = [(ComponentSystemBase *)self setupAssistantCompletionDate];
  if (v4)
  {
    int v5 = +[NSNull null];
    unsigned int v6 = [v4 isEqual:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)chipID
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[ComponentSystemBase chipID]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v3 = (void *)MGCopyAnswer();
  v4 = numberOrNull(v3);

  return v4;
}

- (BOOL)isBetaBuild
{
  if (qword_1000BE128 != -1) {
    dispatch_once(&qword_1000BE128, &stru_100084CE0);
  }
  return byte_1000BE120;
}

- (BOOL)isInternalInstall
{
  if (qword_1000BE130 != -1) {
    dispatch_once(&qword_1000BE130, &stru_100084D00);
  }
  return byte_1000BE121;
}

- (BOOL)isProdDevice
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[ComponentSystemBase isProdDevice]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  return MGGetBoolAnswer();
}

- (BOOL)isGreenTeaDevice
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[ComponentSystemBase isGreenTeaDevice]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  return MGGetBoolAnswer();
}

- (id)storeDemoModeEnabled
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[ComponentSystemBase storeDemoModeEnabled]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.demo-settings"];
  int v4 = [v3 objectForKey:@"StoreDemoMode"];
  int v5 = v4;
  if (!v4) {
    int v4 = &__kCFBooleanFalse;
  }
  id v6 = v4;

  return v6;
}

- (id)activationConfigurationInformation
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v16 = "-[ComponentSystemBase activationConfigurationInformation]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (!+[CBSUtilities isCheckerBoardActive])
  {
    int v5 = MAECopyActivationRecordWithError();
    id v3 = 0;
    if (v3)
    {
      id v6 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v12 = [v3 description];
        *(_DWORD *)long long buf = 138412290;
        v16 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Could not get activation record with error: %@", buf, 0xCu);
      }
    }
    else
    {
      if (v5)
      {
        int v7 = [v5 objectForKeyedSubscript:@"DeviceConfigurationFlags"];
        unsigned int v8 = [v7 intValue];
        uint64_t v9 = (v8 >> 2) & 1;
        v13[0] = @"demoActivated";
        id v6 = +[NSNumber numberWithBool:(v8 >> 1) & 1];
        v13[1] = @"pointOfSaleActivated";
        v14[0] = v6;
        int v10 = +[NSNumber numberWithBool:v9];
        v14[1] = v10;
        int v4 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

        goto LABEL_13;
      }
      id v6 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error: activation record is NULL", buf, 2u);
      }
    }
    int v7 = 0;
    int v4 = 0;
LABEL_13:

    goto LABEL_14;
  }
  id v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activation configuration is not available in CheckerBoard", buf, 2u);
  }
  int v4 = 0;
LABEL_14:

  return v4;
}

- (id)sikPublicKey
{
  v2 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    CFErrorRef v15 = (CFErrorRef)"-[ComponentSystemBase sikPublicKey]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  CFErrorRef error = 0;
  id v3 = (__SecKey *)SecKeyCopySystemKey();
  if (!v3)
  {
    uint64_t v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      CFErrorRef v15 = error;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to retrieve SIK Key with error: %@", buf, 0xCu);
    }

    CFRelease(error);
    goto LABEL_13;
  }
  int v4 = SecKeyCopyPublicKey(v3);
  if (!v4)
  {
    int v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to retrieve public SIK Key.", buf, 2u);
    }

LABEL_13:
    unsigned int v8 = &stru_1000A3028;
    goto LABEL_18;
  }
  int v5 = v4;
  CFDataRef v6 = SecKeyCopyExternalRepresentation(v4, &error);
  CFRelease(v5);
  if (v6)
  {
    int v7 = [(__CFData *)v6 base64EncodedStringWithOptions:0];
    stringOrNull(v7);
    unsigned int v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      CFErrorRef v15 = error;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to retrieve data for public SIK key with error: %@", buf, 0xCu);
    }

    CFRelease(error);
    unsigned int v8 = &stru_1000A3028;
  }

LABEL_18:

  return v8;
}

- (id)marketingProductNumber
{
  v2 = [(ComponentSystemBase *)self modelNumber];
  if (v2)
  {
    id v3 = (void *)MGCopyAnswer();
    int v4 = stringOrNull(v3);

    if (v4)
    {
      int v5 = [v2 stringByAppendingString:v4];
    }
    else
    {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

@end