@interface IDSSocketPairSessionEndMessage
- (unsigned)command;
@end

@implementation IDSSocketPairSessionEndMessage

- (unsigned)command
{
  return 13;
}

@end