@interface ENLog
+ (OS_os_log)groupContext;
+ (OS_os_log)groupContextCache;
+ (OS_os_log)groupContextDataSource;
+ (OS_os_log)groupID;
+ (OS_os_log)utilities;
@end

@implementation ENLog

+ (OS_os_log)groupContext
{
  if (qword_1EAB21C48 != -1) {
    dispatch_once(&qword_1EAB21C48, &unk_1F38A4300);
  }
  v2 = (void *)qword_1EAB21C40;
  return (OS_os_log *)v2;
}

+ (OS_os_log)groupContextCache
{
  if (qword_1EAB21C58 != -1) {
    dispatch_once(&qword_1EAB21C58, &unk_1F38A4380);
  }
  v2 = (void *)qword_1EAB21C50;
  return (OS_os_log *)v2;
}

+ (OS_os_log)groupContextDataSource
{
  if (qword_1EAB21C68 != -1) {
    dispatch_once(&qword_1EAB21C68, &unk_1F38A43A0);
  }
  v2 = (void *)qword_1EAB21C60;
  return (OS_os_log *)v2;
}

+ (OS_os_log)utilities
{
  if (qword_1EAB21C78 != -1) {
    dispatch_once(&qword_1EAB21C78, &unk_1F38A4340);
  }
  v2 = (void *)qword_1EAB21C70;
  return (OS_os_log *)v2;
}

+ (OS_os_log)groupID
{
  if (qword_1EAB21C88 != -1) {
    dispatch_once(&qword_1EAB21C88, &unk_1F38A4360);
  }
  v2 = (void *)qword_1EAB21C80;
  return (OS_os_log *)v2;
}

@end