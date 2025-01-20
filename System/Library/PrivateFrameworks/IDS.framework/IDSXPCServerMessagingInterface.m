@interface IDSXPCServerMessagingInterface
+ (id)interface;
@end

@implementation IDSXPCServerMessagingInterface

+ (id)interface
{
  if (qword_1EB2BD5C0 != -1) {
    dispatch_once(&qword_1EB2BD5C0, &unk_1EE2469A8);
  }
  v2 = (void *)qword_1EB2BD658;

  return v2;
}

@end