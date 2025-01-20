@interface IDSSocketPairSessionCancelMessage
- (unsigned)command;
@end

@implementation IDSSocketPairSessionCancelMessage

- (unsigned)command
{
  return 11;
}

@end