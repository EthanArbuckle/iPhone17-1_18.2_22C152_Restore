@interface CNContactsDaemonLogs
+ (OS_os_log)accounts;
+ (OS_os_log)accountsCleanup;
+ (OS_os_log)backgroundColors;
+ (OS_os_log)backup;
+ (OS_os_log)exchange;
+ (OS_os_log)launchServices;
+ (OS_os_log)persistence;
+ (OS_os_log)purgeHistory;
+ (OS_os_log)settingsDefaultApps;
+ (OS_os_log)synchronizeContactProviders;
+ (OS_os_log)xpc;
@end

@implementation CNContactsDaemonLogs

+ (OS_os_log)xpc
{
  if (qword_10002CA58 != -1) {
    dispatch_once(&qword_10002CA58, &stru_100024D50);
  }
  v2 = (void *)qword_10002CA60;

  return (OS_os_log *)v2;
}

+ (OS_os_log)backup
{
  if (qword_10002CA68 != -1) {
    dispatch_once(&qword_10002CA68, &stru_100024D70);
  }
  v2 = (void *)qword_10002CA70;

  return (OS_os_log *)v2;
}

+ (OS_os_log)purgeHistory
{
  if (qword_10002CA78 != -1) {
    dispatch_once(&qword_10002CA78, &stru_100024D90);
  }
  v2 = (void *)qword_10002CA80;

  return (OS_os_log *)v2;
}

+ (OS_os_log)launchServices
{
  if (qword_10002CA88 != -1) {
    dispatch_once(&qword_10002CA88, &stru_100024DB0);
  }
  v2 = (void *)qword_10002CA90;

  return (OS_os_log *)v2;
}

+ (OS_os_log)persistence
{
  if (qword_10002CA98 != -1) {
    dispatch_once(&qword_10002CA98, &stru_100024DD0);
  }
  v2 = (void *)qword_10002CAA0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)exchange
{
  if (qword_10002CAA8 != -1) {
    dispatch_once(&qword_10002CAA8, &stru_100024DF0);
  }
  v2 = (void *)qword_10002CAB0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)accounts
{
  if (qword_10002CAB8 != -1) {
    dispatch_once(&qword_10002CAB8, &stru_100024E10);
  }
  v2 = (void *)qword_10002CAC0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)accountsCleanup
{
  if (qword_10002CAC8 != -1) {
    dispatch_once(&qword_10002CAC8, &stru_100024E30);
  }
  v2 = (void *)qword_10002CAD0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)synchronizeContactProviders
{
  if (qword_10002CAD8 != -1) {
    dispatch_once(&qword_10002CAD8, &stru_100024E50);
  }
  v2 = (void *)qword_10002CAE0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)backgroundColors
{
  if (qword_10002CAE8 != -1) {
    dispatch_once(&qword_10002CAE8, &stru_100024E70);
  }
  v2 = (void *)qword_10002CAF0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)settingsDefaultApps
{
  if (qword_10002CAF8 != -1) {
    dispatch_once(&qword_10002CAF8, &stru_100024E90);
  }
  v2 = (void *)qword_10002CB00;

  return (OS_os_log *)v2;
}

@end