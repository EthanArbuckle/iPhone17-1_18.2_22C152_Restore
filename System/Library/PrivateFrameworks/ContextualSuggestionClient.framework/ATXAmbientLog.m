@interface ATXAmbientLog
+ (OS_os_log)log;
- (ATXAmbientLog)init;
@end

@implementation ATXAmbientLog

+ (OS_os_log)log
{
  if (qword_26B17B198 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B17B190;
  return (OS_os_log *)v2;
}

- (ATXAmbientLog)init
{
  result = (ATXAmbientLog *)sub_24A7B3798();
  __break(1u);
  return result;
}

@end