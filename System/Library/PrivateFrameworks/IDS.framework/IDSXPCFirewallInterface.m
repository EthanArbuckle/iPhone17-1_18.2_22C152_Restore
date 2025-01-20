@interface IDSXPCFirewallInterface
+ (id)interface;
@end

@implementation IDSXPCFirewallInterface

+ (id)interface
{
  if (qword_1EB2BD5B8 != -1) {
    dispatch_once(&qword_1EB2BD5B8, &unk_1EE246968);
  }
  v2 = (void *)qword_1EB2BD650;

  return v2;
}

@end