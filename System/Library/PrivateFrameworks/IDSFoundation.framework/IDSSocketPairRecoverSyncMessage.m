@interface IDSSocketPairRecoverSyncMessage
- (unsigned)command;
@end

@implementation IDSSocketPairRecoverSyncMessage

- (unsigned)command
{
  return 45;
}

@end