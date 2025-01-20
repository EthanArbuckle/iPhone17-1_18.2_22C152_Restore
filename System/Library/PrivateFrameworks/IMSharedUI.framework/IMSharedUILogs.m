@interface IMSharedUILogs
+ (OS_os_log)audio;
+ (OS_os_log)fsm;
+ (OS_os_log)transcript;
+ (OS_os_log)utilities;
@end

@implementation IMSharedUILogs

+ (OS_os_log)transcript
{
  if (qword_267BC0158 != -1) {
    dispatch_once(&qword_267BC0158, &unk_26C919038);
  }
  v2 = (void *)qword_267BC0150;
  return (OS_os_log *)v2;
}

+ (OS_os_log)fsm
{
  if (qword_267BC0168 != -1) {
    dispatch_once(&qword_267BC0168, &unk_26C919058);
  }
  v2 = (void *)qword_267BC0160;
  return (OS_os_log *)v2;
}

+ (OS_os_log)audio
{
  if (qword_267BC0178 != -1) {
    dispatch_once(&qword_267BC0178, &unk_26C919078);
  }
  v2 = (void *)qword_267BC0170;
  return (OS_os_log *)v2;
}

+ (OS_os_log)utilities
{
  if (qword_267BC0188 != -1) {
    dispatch_once(&qword_267BC0188, &unk_26C9190B8);
  }
  v2 = (void *)qword_267BC0180;
  return (OS_os_log *)v2;
}

@end