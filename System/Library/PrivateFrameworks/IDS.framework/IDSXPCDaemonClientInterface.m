@interface IDSXPCDaemonClientInterface
+ (id)interface;
@end

@implementation IDSXPCDaemonClientInterface

+ (id)interface
{
  if (qword_1E92DE2B0 != -1) {
    dispatch_once(&qword_1E92DE2B0, &unk_1EE246FA8);
  }
  v2 = (void *)qword_1E92DE2A8;

  return v2;
}

@end