@interface IDSXPCPinnedIdentityInterface
+ (id)interface;
@end

@implementation IDSXPCPinnedIdentityInterface

+ (id)interface
{
  if (qword_1EB2BD558 != -1) {
    dispatch_once(&qword_1EB2BD558, &unk_1EE246428);
  }
  v2 = (void *)qword_1EB2BD5F0;

  return v2;
}

@end