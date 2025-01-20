@interface IDSXPCBAASignerInterface
+ (id)interface;
@end

@implementation IDSXPCBAASignerInterface

+ (id)interface
{
  if (qword_1EB2BD5B0 != -1) {
    dispatch_once(&qword_1EB2BD5B0, &unk_1EE246948);
  }
  v2 = (void *)qword_1EB2BD648;

  return v2;
}

@end