@interface RMLog
+ (id)accountStatusHandler;
+ (id)accountStatusHandlerCalDAV;
+ (id)accountStatusHandlerCardDAV;
+ (id)accountStatusHandlerExchange;
+ (id)accountStatusHandlerGoogle;
+ (id)accountStatusHandlerLDAP;
+ (id)accountStatusHandlerMail;
+ (id)accountStatusHandlerSubscribedCalendar;
+ (id)accountsNotificationPlugin;
@end

@implementation RMLog

+ (id)accountStatusHandler
{
  if (qword_CF78 != -1) {
    dispatch_once(&qword_CF78, &stru_8270);
  }
  v2 = (void *)qword_CF70;
  return v2;
}

+ (id)accountStatusHandlerCalDAV
{
  if (qword_CF98 != -1) {
    dispatch_once(&qword_CF98, &stru_82B0);
  }
  v2 = (void *)qword_CF90;
  return v2;
}

+ (id)accountStatusHandlerCardDAV
{
  if (qword_CFA8 != -1) {
    dispatch_once(&qword_CFA8, &stru_82D0);
  }
  v2 = (void *)qword_CFA0;
  return v2;
}

+ (id)accountStatusHandlerExchange
{
  if (qword_CFB8 != -1) {
    dispatch_once(&qword_CFB8, &stru_82F0);
  }
  v2 = (void *)qword_CFB0;
  return v2;
}

+ (id)accountStatusHandlerGoogle
{
  if (qword_CFC8 != -1) {
    dispatch_once(&qword_CFC8, &stru_8310);
  }
  v2 = (void *)qword_CFC0;
  return v2;
}

+ (id)accountStatusHandlerLDAP
{
  if (qword_CFD8 != -1) {
    dispatch_once(&qword_CFD8, &stru_8330);
  }
  v2 = (void *)qword_CFD0;
  return v2;
}

+ (id)accountStatusHandlerMail
{
  if (qword_CFE8 != -1) {
    dispatch_once(&qword_CFE8, &stru_8350);
  }
  v2 = (void *)qword_CFE0;
  return v2;
}

+ (id)accountStatusHandlerSubscribedCalendar
{
  if (qword_CFF8 != -1) {
    dispatch_once(&qword_CFF8, &stru_8370);
  }
  v2 = (void *)qword_CFF0;
  return v2;
}

+ (id)accountsNotificationPlugin
{
  if (qword_D008 != -1) {
    dispatch_once(&qword_D008, &stru_8390);
  }
  v2 = (void *)qword_D000;
  return v2;
}

@end