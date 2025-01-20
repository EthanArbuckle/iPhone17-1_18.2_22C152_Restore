@interface IDSXPCKeyTransparencyInterface
+ (id)interface;
@end

@implementation IDSXPCKeyTransparencyInterface

+ (id)interface
{
  if (qword_1EB2BD540 != -1) {
    dispatch_once(&qword_1EB2BD540, &unk_1EE246248);
  }
  v2 = (void *)qword_1EB2BD5D8;

  return v2;
}

@end