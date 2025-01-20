@interface IDSSocketPairEditMessage
- (unsigned)command;
@end

@implementation IDSSocketPairEditMessage

- (unsigned)command
{
  return 44;
}

@end