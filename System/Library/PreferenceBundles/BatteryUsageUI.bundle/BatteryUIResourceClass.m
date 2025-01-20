@interface BatteryUIResourceClass
+ (BOOL)batteryDataUnavailable;
+ (BOOL)deviceSupportsCPMS;
+ (BOOL)inDemoMode;
+ (BOOL)isBatteryUnverified;
+ (BOOL)isBatteryUnverifiedWithStatus:(int)a3 state:(int)a4;
+ (BOOL)isKnownServiceState:(int)a3;
+ (BOOL)isQMaxUnknown;
+ (double)getMaxWidthOfYAxisLabels;
+ (double)millisecondsFromMachTime:(unint64_t)a3;
+ (id)containerPath;
+ (id)getAuthData;
+ (id)getBatteryData;
+ (id)get_log_handle_bhui;
+ (id)get_log_handle_bui;
+ (id)get_log_handle_bui_graph;
+ (id)localizedStringWithHour:(int)a3;
+ (id)localizedStringWithPercentage:(double)a3;
+ (id)overrideBatteryData:(id)a3 withPath:(id)a4;
+ (id)snapshotFromIOEntry:(unsigned int)a3;
+ (int)genuineBatteryStatus;
+ (int)getBatteryHealthServiceFlags;
+ (int)getBatteryHealthServiceState;
+ (int)getBatteryMaximumCapacityPercentWithError:(id *)a3;
+ (int)getManagementState;
+ (int)getManagementStateWithSync:(BOOL)a3;
+ (void)valueForDefaultKey:(id)a3;
@end

@implementation BatteryUIResourceClass

+ (id)containerPath
{
  if (qword_D7430 != -1) {
    dispatch_once(&qword_D7430, &stru_BF4D8);
  }
  v2 = (void *)qword_D7428;

  return v2;
}

+ (BOOL)inDemoMode
{
  if (qword_D7438 != -1) {
    dispatch_once(&qword_D7438, &stru_BF4F8);
  }
  return byte_D7440;
}

+ (int)getBatteryHealthServiceState
{
  if (+[PLBatteryUIUtilities inDemoMode])
  {
    v2 = +[BatteryUIResourceClass get_log_handle_bhui];
    uint64_t v3 = +[PLBatteryUIUtilities getDefaultValueForKey:@"BUI_DEMO_SVC"];
    if (v3)
    {
      v4 = (void *)v3;
      v5 = v2;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_8E858(v4);
      }

      int v6 = [v4 intValue];
      return v6;
    }
  }
  v7 = (void *)IOPSCopyPowerSourcesByType();
  v8 = v7;
  if (v7
    && [v7 count]
    && ([v8 objectAtIndexedSubscript:0],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 objectForKeyedSubscript:@"Battery Service State"],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    v11 = [v8 objectAtIndexedSubscript:0];
    v12 = [v11 objectForKeyedSubscript:@"Battery Service State"];
    int v6 = [v12 intValue];
  }
  else
  {
    int v6 = -1;
  }

  return v6;
}

+ (int)getBatteryHealthServiceFlags
{
  if (+[PLBatteryUIUtilities inDemoMode])
  {
    v2 = +[BatteryUIResourceClass get_log_handle_bhui];
    uint64_t v3 = +[PLBatteryUIUtilities getDefaultValueForKey:@"BUI_DEMO_SVC_FLAG"];
    if (v3)
    {
      v4 = (void *)v3;
      v5 = v2;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_8E8D0(v4);
      }

      int v6 = [v4 intValue];
      return v6;
    }
  }
  v7 = (void *)IOPSCopyPowerSourcesByType();
  v8 = v7;
  if (v7
    && [v7 count]
    && ([v8 objectAtIndexedSubscript:0],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 objectForKeyedSubscript:@"Battery Service Flags"],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    v11 = [v8 objectAtIndexedSubscript:0];
    v12 = [v11 objectForKeyedSubscript:@"Battery Service Flags"];
    int v6 = [v12 intValue];
  }
  else
  {
    int v6 = 256;
  }

  return v6;
}

+ (BOOL)isQMaxUnknown
{
  unsigned int v3 = [a1 getBatteryHealthServiceState];
  unsigned __int16 v4 = (unsigned __int16)[a1 getBatteryHealthServiceFlags];
  v5 = +[BatteryUIResourceClass get_log_handle_bhui];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_8EA20();
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_8E9B8();
  }
  uint64_t v6 = v4 & 0x2000;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_8E948(v6, v5, v7, v8, v9, v10, v11, v12);
  }
  BOOL v14 = v3 == -1 && v6 != 0;

  return v14;
}

+ (BOOL)isBatteryUnverified
{
  uint64_t v2 = +[BatteryUIResourceClass genuineBatteryStatus];
  uint64_t v3 = +[BatteryUIResourceClass getBatteryHealthServiceState];

  return +[BatteryUIResourceClass isBatteryUnverifiedWithStatus:v2 state:v3];
}

+ (BOOL)isBatteryUnverifiedWithStatus:(int)a3 state:(int)a4
{
  if (a3) {
    BOOL v4 = a4 == 5;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v6 = v4 || a4 == 12;
  return a3 == 2 || v6;
}

+ (int)getBatteryMaximumCapacityPercentWithError:(id *)a3
{
  BOOL v4 = (void *)IOPSCopyPowerSourcesByType();
  v5 = v4;
  if (v4
    && [v4 count]
    && ([v5 objectAtIndexedSubscript:0],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        [v6 objectForKeyedSubscript:@"Maximum Capacity Percent"],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    uint64_t v8 = [v5 objectAtIndexedSubscript:0];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"Maximum Capacity Percent"];
    int v10 = [v9 intValue];
  }
  else
  {
    if (a3)
    {
      *a3 = +[NSError errorWithDomain:@"noBatteryData" code:-1 userInfo:0];
    }
    uint64_t v11 = +[BatteryUIResourceClass get_log_handle_bhui];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_8EA88();
    }

    int v10 = -1;
  }

  return v10;
}

+ (int)genuineBatteryStatus
{
  if (!MGGetBoolAnswer()) {
    return 0;
  }
  uint64_t v2 = +[BatteryUIResourceClass getAuthData];
  uint64_t v3 = v2;
  if (v2
    && ([v2 objectForKey:@"isTrustedForUI"],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = [v3 objectForKey:@"isTrustedForUI"];
    unsigned int v6 = [v5 BOOLValue];

    if (v6) {
      int v7 = 1;
    }
    else {
      int v7 = 2;
    }
  }
  else
  {
    int v7 = -1;
  }

  return v7;
}

+ (id)getAuthData
{
  CFMutableDictionaryRef v2 = IOServiceMatching("IOPMPowerSource");
  CFMutableDictionaryRef v3 = IOServiceMatching("AppleAuthCPRelay");
  CFDictionaryRef v4 = v3;
  if (v3) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (v3) {
      CFRelease(v3);
    }
    if (v2) {
      CFRelease(v2);
    }
  }
  else
  {
    CFDictionarySetValue(v3, @"IOParentMatch", v2);
    CFRelease(v2);
    uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v4);
    if (MatchingService)
    {
      int v7 = +[BatteryUIResourceClass snapshotFromIOEntry:MatchingService];
      goto LABEL_13;
    }
  }
  int v7 = 0;
LABEL_13:

  return v7;
}

+ (id)snapshotFromIOEntry:(unsigned int)a3
{
  CFMutableDictionaryRef properties = 0;
  IORegistryEntryCreateCFProperties(a3, &properties, 0, 0);
  CFMutableDictionaryRef v3 = properties;

  return v3;
}

+ (double)millisecondsFromMachTime:(unint64_t)a3
{
  if (qword_D7448 != -1) {
    dispatch_once(&qword_D7448, &stru_BF518);
  }
  return *(double *)&qword_D7450 * (double)a3 / 1000000.0;
}

+ (id)overrideBatteryData:(id)a3 withPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    int v7 = +[BatteryUIResourceClass get_log_handle_bhui];
    uint64_t v8 = +[NSDictionary dictionaryWithContentsOfFile:v6];
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v9) {
        sub_8EB34((uint64_t)v8, v7);
      }
      id v10 = [v5 mutableCopy];
      uint64_t v11 = [v8 objectForKey:@"Serial"];
      uint64_t v12 = v11;
      if (v11)
      {
        if ([v11 intValue] == -1) {
          [v10 removeObjectForKey:@"Serial"];
        }
        else {
          [v10 setObject:v12 forKeyedSubscript:@"Serial"];
        }
      }
      id v13 = [v10 copy];
    }
    else
    {
      if (v9) {
        sub_8EABC((uint64_t)v6, v7);
      }
      id v13 = v5;
    }
  }
  else
  {
    id v13 = v5;
  }

  return v13;
}

+ (id)getBatteryData
{
  CFDictionaryRef v2 = IOServiceMatching("IOPMPowerSource");
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  if (MatchingService)
  {
    CFDictionaryRef v4 = +[BatteryUIResourceClass snapshotFromIOEntry:MatchingService];
  }
  else
  {
    CFDictionaryRef v4 = 0;
  }
  +[BatteryUIResourceClass containerPath];
  id v5 = (void *)_CFPreferencesCopyValueWithContainer();
  if (v5)
  {
    uint64_t v6 = +[BatteryUIResourceClass overrideBatteryData:v4 withPath:v5];

    CFDictionaryRef v4 = (void *)v6;
  }

  return v4;
}

+ (BOOL)isKnownServiceState:(int)a3
{
  return a3 < 7 || (a3 & 0xFFFFFFFC) == 8 || a3 == 12;
}

+ (BOOL)batteryDataUnavailable
{
  if (!+[BatteryUIResourceClass getManagementState]) {
    return 1;
  }
  uint64_t v2 = +[BatteryUIResourceClass getBatteryHealthServiceState];
  if (+[BatteryUIResourceClass isQMaxUnknown]) {
    return 0;
  }
  unsigned int v4 = +[BatteryUIResourceClass isKnownServiceState:v2];
  BOOL v5 = v2 == -1 || v2 == 7;
  if (!v5
    && v4
    && ((uint64_t v6 = 0,
         +[BatteryUIResourceClass getBatteryMaximumCapacityPercentWithError:&v6], !v6)|| v2 == 5|| v2 == 6|| v2 == 12))
  {
    return +[BatteryUIResourceClass genuineBatteryStatus] == -1;
  }
  else
  {
    return 1;
  }
}

+ (id)get_log_handle_bui_graph
{
  if (qword_D7460 != -1) {
    dispatch_once(&qword_D7460, &stru_BF538);
  }
  uint64_t v2 = (void *)qword_D7458;

  return v2;
}

+ (id)get_log_handle_bui
{
  if (qword_D7470 != -1) {
    dispatch_once(&qword_D7470, &stru_BF558);
  }
  uint64_t v2 = (void *)qword_D7468;

  return v2;
}

+ (id)get_log_handle_bhui
{
  if (qword_D7480 != -1) {
    dispatch_once(&qword_D7480, &stru_BF578);
  }
  uint64_t v2 = (void *)qword_D7478;

  return v2;
}

+ (id)localizedStringWithPercentage:(double)a3
{
  CFMutableDictionaryRef v3 = +[NSNumber numberWithDouble:a3 / 100.0];
  unsigned int v4 = +[NSNumberFormatter localizedStringFromNumber:v3 numberStyle:3];

  return v4;
}

+ (id)localizedStringWithHour:(int)a3
{
  if (qword_D7488 != -1) {
    dispatch_once(&qword_D7488, &stru_BF598);
  }
  unsigned int v4 = [(id)qword_D7490 stringFromTimeInterval:(double)a3 * 3600.0];
  BOOL v5 = [v4 capitalizedString];

  return v5;
}

+ (double)getMaxWidthOfYAxisLabels
{
  uint64_t v2 = +[BatteryUIResourceClass localizedStringWithPercentage:100.0];
  CFMutableDictionaryRef v3 = +[BatteryUIResourceClass localizedStringWithHour:24];
  unsigned int v4 = +[NSMutableDictionary dictionary];
  BOOL v5 = +[UIFont systemFontOfSize:11.0];
  [v4 setObject:v5 forKeyedSubscript:NSFontAttributeName];

  [v2 sizeWithAttributes:v4];
  double v7 = v6;
  [v3 sizeWithAttributes:v4];
  if (v7 < v8) {
    double v7 = v8;
  }

  return v7;
}

+ (int)getManagementStateWithSync:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = +[BatteryUIResourceClass get_log_handle_bhui];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_8EDD4();
  }
  uint64_t state64 = 0;
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      sub_8ED38();
    }
    int out_token = 0;
    if (notify_register_check("com.apple.thermalmonitor.ageAwareMitigationState", &out_token))
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_8ECC4();
      }
LABEL_24:
      int v16 = 0;
      goto LABEL_25;
    }
    uint32_t state = notify_get_state(out_token, &state64);
    notify_cancel(out_token);
    if (state)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_8EC50();
      }
      goto LABEL_24;
    }
    uint64_t v9 = state64;
  }
  else
  {
    if (v5) {
      sub_8EDA0();
    }
    +[BatteryUIResourceClass containerPath];
    double v6 = (void *)_CFPreferencesCopyValueWithContainer();
    if (!v6)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_8ED6C();
      }
      goto LABEL_24;
    }
    double v7 = v6;
    signed int v8 = [v6 intValue];
    uint64_t v9 = v8;
    uint64_t state64 = v8;
  }
  if (v9 - 1 > 2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_8EC1C();
    }
    goto LABEL_24;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_8EBAC((uint64_t)&state64, v4, v10, v11, v12, v13, v14, v15);
  }
  int v16 = state64;
LABEL_25:

  return v16;
}

+ (int)getManagementState
{
  if (+[BatteryUIResourceClass deviceSupportsCPMS]) {
    return 4;
  }
  int result = +[BatteryUIResourceClass getManagementStateWithSync:1];
  if (!result)
  {
    return +[BatteryUIResourceClass getManagementStateWithSync:0];
  }
  return result;
}

+ (BOOL)deviceSupportsCPMS
{
  return +[CPMSAgent isCPMSSupported];
}

+ (void)valueForDefaultKey:(id)a3
{
  id v3 = a3;
  +[BatteryUIResourceClass containerPath];
  unsigned int v4 = (void *)_CFPreferencesCopyValueWithContainer();

  return v4;
}

@end