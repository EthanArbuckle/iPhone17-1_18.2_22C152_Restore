@interface IDSXPCReunionSyncInterface
+ (id)interface;
@end

@implementation IDSXPCReunionSyncInterface

+ (id)interface
{
  if (qword_1EB2BD548 != -1) {
    dispatch_once(&qword_1EB2BD548, &unk_1EE246268);
  }
  v2 = (void *)qword_1EB2BD5E0;

  return v2;
}

@end