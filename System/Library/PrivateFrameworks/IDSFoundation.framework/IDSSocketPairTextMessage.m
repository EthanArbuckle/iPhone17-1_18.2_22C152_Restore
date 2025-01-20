@interface IDSSocketPairTextMessage
- (unsigned)command;
@end

@implementation IDSSocketPairTextMessage

- (unsigned)command
{
  return 27;
}

@end