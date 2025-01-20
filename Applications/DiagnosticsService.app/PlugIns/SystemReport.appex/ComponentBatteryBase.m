@interface ComponentBatteryBase
- (id)generatePowerSourceData;
@end

@implementation ComponentBatteryBase

- (id)generatePowerSourceData
{
  v9[0] = @"serviceBatteryWarning";
  v9[1] = @"serviceBatteryFlags";
  v10[0] = &off_1000B7468;
  v10[1] = &off_1000B7468;
  v9[2] = @"maximumCapacityPercent";
  v10[2] = &off_1000B7468;
  v2 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  int v3 = IOPSCopyPowerSourcesByTypePrecise();
  v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v8 = v3;
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Could not retrieve power sources info. Error code: %03X", buf, 8u);
  }

  id v5 = v2;

  return v5;
}

@end