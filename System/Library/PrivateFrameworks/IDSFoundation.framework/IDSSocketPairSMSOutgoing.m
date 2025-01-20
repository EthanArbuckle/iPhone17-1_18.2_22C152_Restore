@interface IDSSocketPairSMSOutgoing
- (unsigned)command;
@end

@implementation IDSSocketPairSMSOutgoing

- (unsigned)command
{
  return 16;
}

@end