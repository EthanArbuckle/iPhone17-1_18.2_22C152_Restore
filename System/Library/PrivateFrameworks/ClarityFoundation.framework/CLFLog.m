@interface CLFLog
+ (OS_os_log)commonLog;
@end

@implementation CLFLog

+ (OS_os_log)commonLog
{
  return (OS_os_log *)MEMORY[0x270F09588](a1, a2);
}

@end