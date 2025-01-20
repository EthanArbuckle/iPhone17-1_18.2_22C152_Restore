@interface IDSSocketPairRecoverJunkMessage
- (unsigned)command;
@end

@implementation IDSSocketPairRecoverJunkMessage

- (unsigned)command
{
  return 49;
}

@end