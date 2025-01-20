@interface IDSXPCInternalTestingInterface
+ (id)interface;
@end

@implementation IDSXPCInternalTestingInterface

+ (id)interface
{
  if (qword_1EB2BD538 != -1) {
    dispatch_once(&qword_1EB2BD538, &unk_1EE246208);
  }
  v2 = (void *)qword_1EB2BD5D0;

  return v2;
}

@end