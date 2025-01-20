@interface FMDSFDeviceDiscoveryFactory
+ (BOOL)isAutomationActive;
+ (id)deviceDiscovery;
@end

@implementation FMDSFDeviceDiscoveryFactory

+ (BOOL)isAutomationActive
{
  if (qword_1000133F0 != -1) {
    dispatch_once(&qword_1000133F0, &stru_10000C210);
  }
  v2 = sub_100004888();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_1000133E8;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMDAutomationBluetoothDiscovery: isAutomationActive: %d", (uint8_t *)v4, 8u);
  }

  return byte_1000133E8;
}

+ (id)deviceDiscovery
{
  if (+[FMDSFDeviceDiscoveryFactory isAutomationActive])
  {
    v2 = +[FMDAutomationHelperFactory sharedFactory];
    v3 = (objc_class *)[v2 automationHelperClassWithName:@"FMDAutomationBluetoothDiscovery"];
  }
  else
  {
    v3 = (objc_class *)SFDeviceDiscovery;
  }
  id v4 = objc_alloc_init(v3);

  return v4;
}

@end