@interface IDSSocketPairSessionDeclineMessage
- (unsigned)command;
@end

@implementation IDSSocketPairSessionDeclineMessage

- (unsigned)command
{
  return 10;
}

@end