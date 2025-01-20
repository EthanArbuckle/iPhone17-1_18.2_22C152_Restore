@interface FMDACCConnectionInfoFactory
+ (BOOL)isAutomationActive;
+ (id)connectionInfo;
@end

@implementation FMDACCConnectionInfoFactory

+ (BOOL)isAutomationActive
{
  if (qword_100031328 != -1) {
    dispatch_once(&qword_100031328, &stru_100024AE8);
  }
  v2 = sub_100002AA8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_100031320;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMDACCConnectionInfoFactory: isAutomationActive: %d", (uint8_t *)v4, 8u);
  }

  return byte_100031320;
}

+ (id)connectionInfo
{
  if (+[FMDACCConnectionInfoFactory isAutomationActive])
  {
    if (qword_100031338 != -1) {
      dispatch_once(&qword_100031338, &stru_100024B08);
    }
    id v2 = (id)qword_100031330;
  }
  else
  {
    id v2 = +[ACCConnectionInfo sharedInstance];
  }

  return v2;
}

@end