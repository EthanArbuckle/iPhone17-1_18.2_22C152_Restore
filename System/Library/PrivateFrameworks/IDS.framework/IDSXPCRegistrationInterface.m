@interface IDSXPCRegistrationInterface
+ (id)interface;
@end

@implementation IDSXPCRegistrationInterface

+ (id)interface
{
  if (qword_1EB2BD550 != -1) {
    dispatch_once(&qword_1EB2BD550, &unk_1EE2462C8);
  }
  v2 = (void *)qword_1EB2BD5E8;

  return v2;
}

@end