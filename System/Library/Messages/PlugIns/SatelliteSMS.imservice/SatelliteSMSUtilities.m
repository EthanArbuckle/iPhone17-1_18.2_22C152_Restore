@interface SatelliteSMSUtilities
+ (BOOL)systemSupportsSatelliteSMS;
+ (OS_os_log)logger;
+ (int64_t)smsServiceType;
@end

@implementation SatelliteSMSUtilities

+ (OS_os_log)logger
{
  if (qword_19490[0] != -1) {
    dispatch_once(qword_19490, &stru_14A18);
  }
  v2 = (void *)qword_19488;

  return (OS_os_log *)v2;
}

+ (int64_t)smsServiceType
{
  return 32;
}

+ (BOOL)systemSupportsSatelliteSMS
{
  return sub_DD1C() != 0;
}

@end