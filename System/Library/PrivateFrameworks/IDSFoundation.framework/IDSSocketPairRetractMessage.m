@interface IDSSocketPairRetractMessage
- (unsigned)command;
@end

@implementation IDSSocketPairRetractMessage

- (unsigned)command
{
  return 43;
}

@end