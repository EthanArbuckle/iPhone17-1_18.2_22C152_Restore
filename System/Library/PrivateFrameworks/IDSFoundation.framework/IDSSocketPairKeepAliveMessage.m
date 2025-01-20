@interface IDSSocketPairKeepAliveMessage
- (unsigned)command;
@end

@implementation IDSSocketPairKeepAliveMessage

- (unsigned)command
{
  return 2;
}

@end