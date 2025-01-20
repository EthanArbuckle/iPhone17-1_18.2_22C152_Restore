@interface IDSSocketPairProxyIncomingNiceMessage
- (unsigned)command;
@end

@implementation IDSSocketPairProxyIncomingNiceMessage

- (unsigned)command
{
  return 26;
}

@end