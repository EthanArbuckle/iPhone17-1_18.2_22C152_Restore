@interface IDSSocketPairProxyOutgoingNiceMessage
- (unsigned)command;
@end

@implementation IDSSocketPairProxyOutgoingNiceMessage

- (unsigned)command
{
  return 25;
}

@end