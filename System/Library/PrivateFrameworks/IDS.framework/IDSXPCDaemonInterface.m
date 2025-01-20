@interface IDSXPCDaemonInterface
+ (id)interface;
@end

@implementation IDSXPCDaemonInterface

+ (id)interface
{
  if (qword_1EB2BD568 != -1) {
    dispatch_once(&qword_1EB2BD568, &unk_1EE246468);
  }
  v2 = (void *)qword_1EB2BD600;

  return v2;
}

@end