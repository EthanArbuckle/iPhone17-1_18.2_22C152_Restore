@interface IDSSocketPairSessionAcceptMessage
- (unsigned)command;
@end

@implementation IDSSocketPairSessionAcceptMessage

- (unsigned)command
{
  return 9;
}

@end