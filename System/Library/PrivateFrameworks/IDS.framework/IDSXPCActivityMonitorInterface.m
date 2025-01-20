@interface IDSXPCActivityMonitorInterface
+ (id)interface;
@end

@implementation IDSXPCActivityMonitorInterface

+ (id)interface
{
  if (qword_1EB2BD5A0 != -1) {
    dispatch_once(&qword_1EB2BD5A0, &unk_1EE2468C8);
  }
  v2 = (void *)qword_1EB2BD638;

  return v2;
}

@end