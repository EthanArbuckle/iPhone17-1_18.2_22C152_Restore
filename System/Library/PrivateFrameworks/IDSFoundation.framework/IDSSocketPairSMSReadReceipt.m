@interface IDSSocketPairSMSReadReceipt
- (unsigned)command;
@end

@implementation IDSSocketPairSMSReadReceipt

- (unsigned)command
{
  return 19;
}

@end