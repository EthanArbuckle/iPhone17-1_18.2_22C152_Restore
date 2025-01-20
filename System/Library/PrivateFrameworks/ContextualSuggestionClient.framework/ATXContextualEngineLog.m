@interface ATXContextualEngineLog
+ (OS_os_log)oslog;
- (ATXContextualEngineLog)init;
@end

@implementation ATXContextualEngineLog

+ (OS_os_log)oslog
{
  if (qword_26B17AF48 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B17AF40;
  return (OS_os_log *)v2;
}

- (ATXContextualEngineLog)init
{
  result = (ATXContextualEngineLog *)sub_24A7B3798();
  __break(1u);
  return result;
}

@end