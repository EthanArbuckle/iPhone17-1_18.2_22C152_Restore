@interface IDSXPCPairingInterface
+ (id)interface;
@end

@implementation IDSXPCPairingInterface

+ (id)interface
{
  if (qword_1EB2BD560 != -1) {
    dispatch_once(&qword_1EB2BD560, &unk_1EE246448);
  }
  v2 = (void *)qword_1EB2BD5F8;

  return v2;
}

@end