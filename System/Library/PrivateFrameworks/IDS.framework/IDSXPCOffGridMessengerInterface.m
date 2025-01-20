@interface IDSXPCOffGridMessengerInterface
+ (id)interface;
@end

@implementation IDSXPCOffGridMessengerInterface

+ (id)interface
{
  if (qword_1EB2BD570 != -1) {
    dispatch_once(&qword_1EB2BD570, &unk_1EE2465A8);
  }
  v2 = (void *)qword_1EB2BD608;

  return v2;
}

@end