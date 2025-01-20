@interface IDSSocketPairSessionReinitiateMessage
- (unsigned)command;
@end

@implementation IDSSocketPairSessionReinitiateMessage

- (unsigned)command
{
  return 41;
}

@end