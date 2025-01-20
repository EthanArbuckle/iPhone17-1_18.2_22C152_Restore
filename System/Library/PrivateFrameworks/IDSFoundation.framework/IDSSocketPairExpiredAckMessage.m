@interface IDSSocketPairExpiredAckMessage
- (unsigned)command;
@end

@implementation IDSSocketPairExpiredAckMessage

- (unsigned)command
{
  return 37;
}

@end