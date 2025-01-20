@interface FMDACCConnectionInfoFactory
+ (BOOL)isAutomationActive;
+ (id)connectionInfo;
@end

@implementation FMDACCConnectionInfoFactory

+ (BOOL)isAutomationActive
{
  if (qword_100042E00 != -1) {
    dispatch_once(&qword_100042E00, &stru_1000358E8);
  }
  v2 = sub_100010114();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_100042DF8;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMDACCConnectionInfoFactory: isAutomationActive: %d", (uint8_t *)v4, 8u);
  }

  return byte_100042DF8;
}

+ (id)connectionInfo
{
  if (+[FMDACCConnectionInfoFactory isAutomationActive])
  {
    if (qword_100042E10 != -1) {
      dispatch_once(&qword_100042E10, &stru_100035908);
    }
    id v2 = (id)qword_100042E08;
  }
  else
  {
    id v2 = +[ACCConnectionInfo sharedInstance];
  }

  return v2;
}

@end