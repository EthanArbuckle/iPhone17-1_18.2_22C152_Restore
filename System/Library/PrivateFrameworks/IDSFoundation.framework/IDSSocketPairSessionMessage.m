@interface IDSSocketPairSessionMessage
- (unsigned)command;
@end

@implementation IDSSocketPairSessionMessage

- (unsigned)command
{
  return 12;
}

@end