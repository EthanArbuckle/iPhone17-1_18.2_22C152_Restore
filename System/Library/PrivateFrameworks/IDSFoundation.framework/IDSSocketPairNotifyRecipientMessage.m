@interface IDSSocketPairNotifyRecipientMessage
- (unsigned)command;
@end

@implementation IDSSocketPairNotifyRecipientMessage

- (unsigned)command
{
  return 48;
}

@end