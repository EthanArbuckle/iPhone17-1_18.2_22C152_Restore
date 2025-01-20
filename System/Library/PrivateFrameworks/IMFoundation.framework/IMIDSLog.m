@interface IMIDSLog
+ (OS_os_log)URLLoading;
+ (OS_os_log)XPC;
+ (OS_os_log)activityMonitor;
+ (OS_os_log)daemon;
+ (OS_os_log)daemon_oversized;
+ (OS_os_log)dataDetector;
+ (OS_os_log)encryption;
+ (OS_os_log)security;
+ (OS_os_log)timer;
@end

@implementation IMIDSLog

+ (OS_os_log)timer
{
  if (qword_1E92DB350 != -1) {
    dispatch_once(&qword_1E92DB350, &unk_1EE230798);
  }
  v2 = (void *)qword_1E92DB358;
  return (OS_os_log *)v2;
}

+ (OS_os_log)daemon_oversized
{
  if (qword_1E92DAD20 != -1) {
    dispatch_once(&qword_1E92DAD20, &unk_1EE231218);
  }
  v2 = (void *)qword_1E92DAD18;
  return (OS_os_log *)v2;
}

+ (OS_os_log)encryption
{
  if (qword_1E92DB3A0 != -1) {
    dispatch_once(&qword_1E92DB3A0, &unk_1EE22FD58);
  }
  v2 = (void *)qword_1E92DB398;
  return (OS_os_log *)v2;
}

+ (OS_os_log)daemon
{
  if (qword_1E92DAE68 != -1) {
    dispatch_once(&qword_1E92DAE68, &unk_1EE230C78);
  }
  v2 = (void *)qword_1E92DAF58;
  return (OS_os_log *)v2;
}

+ (OS_os_log)dataDetector
{
  if (qword_1E92DB2E0 != -1) {
    dispatch_once(&qword_1E92DB2E0, &unk_1EE22FF18);
  }
  v2 = (void *)qword_1E92DB2D8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)activityMonitor
{
  if (qword_1E92DAD10 != -1) {
    dispatch_once(&qword_1E92DAD10, &unk_1EE230218);
  }
  v2 = (void *)qword_1E92DAD08;
  return (OS_os_log *)v2;
}

+ (OS_os_log)security
{
  if (qword_1E92DAFA8 != -1) {
    dispatch_once(&qword_1E92DAFA8, &unk_1EE230498);
  }
  v2 = (void *)qword_1E92DAFC0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)URLLoading
{
  if (qword_1EB273828 != -1) {
    dispatch_once(&qword_1EB273828, &unk_1EE230698);
  }
  v2 = (void *)qword_1EB273820;
  return (OS_os_log *)v2;
}

+ (OS_os_log)XPC
{
  if (qword_1E92DB0C0 != -1) {
    dispatch_once(&qword_1E92DB0C0, &unk_1EE230878);
  }
  v2 = (void *)qword_1E92DB0C8;
  return (OS_os_log *)v2;
}

@end