@interface CUTLog
+ (OS_os_log)fileCopier;
+ (OS_os_log)network;
+ (OS_os_log)power;
+ (OS_os_log)utilities;
+ (OS_os_log)weakLink;
+ (OS_os_log)xpc;
@end

@implementation CUTLog

+ (OS_os_log)fileCopier
{
  if (qword_1E95CDF00 != -1) {
    dispatch_once(&qword_1E95CDF00, &unk_1EF6C4260);
  }
  v2 = (void *)qword_1E95CDEF8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)power
{
  if (qword_1E95CDE98 != -1) {
    dispatch_once(&qword_1E95CDE98, &unk_1EF6C43E0);
  }
  v2 = (void *)qword_1E95CDE90;
  return (OS_os_log *)v2;
}

+ (OS_os_log)network
{
  if (qword_1EB272A78 != -1) {
    dispatch_once(&qword_1EB272A78, &unk_1EF6C44A0);
  }
  v2 = (void *)qword_1EB272A70;
  return (OS_os_log *)v2;
}

+ (OS_os_log)weakLink
{
  if (qword_1E95CDE80 != -1) {
    dispatch_once(&qword_1E95CDE80, &unk_1EF6C4320);
  }
  v2 = (void *)qword_1E95CDE88;
  return (OS_os_log *)v2;
}

+ (OS_os_log)xpc
{
  if (qword_1E95CDF10 != -1) {
    dispatch_once(&qword_1E95CDF10, &unk_1EF6C4340);
  }
  v2 = (void *)qword_1E95CDF08;
  return (OS_os_log *)v2;
}

+ (OS_os_log)utilities
{
  if (qword_1E95CDF20 != -1) {
    dispatch_once(&qword_1E95CDF20, &unk_1EF6C4360);
  }
  v2 = (void *)qword_1E95CDF18;
  return (OS_os_log *)v2;
}

@end