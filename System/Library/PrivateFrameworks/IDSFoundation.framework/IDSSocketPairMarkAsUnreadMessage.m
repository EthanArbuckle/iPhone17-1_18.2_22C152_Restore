@interface IDSSocketPairMarkAsUnreadMessage
- (unsigned)command;
@end

@implementation IDSSocketPairMarkAsUnreadMessage

- (unsigned)command
{
  return 46;
}

@end