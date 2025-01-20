@interface CNUICoreLogProvider
+ (OS_os_log)actions_os_log;
+ (OS_os_log)color_os_log;
+ (OS_os_log)corerecents_os_log;
+ (OS_os_log)likenesses_os_log;
+ (OS_os_log)static_identity_os_log;
@end

@implementation CNUICoreLogProvider

+ (OS_os_log)actions_os_log
{
  if (qword_10000CF30 != -1) {
    dispatch_once(&qword_10000CF30, &stru_100008550);
  }
  v2 = (void *)qword_10000CF38;
  return (OS_os_log *)v2;
}

+ (OS_os_log)likenesses_os_log
{
  if (qword_10000CF40 != -1) {
    dispatch_once(&qword_10000CF40, &stru_100008570);
  }
  v2 = (void *)qword_10000CF48;
  return (OS_os_log *)v2;
}

+ (OS_os_log)corerecents_os_log
{
  if (qword_10000CF50 != -1) {
    dispatch_once(&qword_10000CF50, &stru_100008590);
  }
  v2 = (void *)qword_10000CF58;
  return (OS_os_log *)v2;
}

+ (OS_os_log)static_identity_os_log
{
  if (qword_10000CF60 != -1) {
    dispatch_once(&qword_10000CF60, &stru_1000085B0);
  }
  v2 = (void *)qword_10000CF68;
  return (OS_os_log *)v2;
}

+ (OS_os_log)color_os_log
{
  if (qword_10000CF70 != -1) {
    dispatch_once(&qword_10000CF70, &stru_1000085D0);
  }
  v2 = (void *)qword_10000CF78;
  return (OS_os_log *)v2;
}

@end