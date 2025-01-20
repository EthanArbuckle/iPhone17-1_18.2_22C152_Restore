@interface IDSSocketPairSMSTextMessage
- (unsigned)command;
@end

@implementation IDSSocketPairSMSTextMessage

- (unsigned)command
{
  return 14;
}

@end