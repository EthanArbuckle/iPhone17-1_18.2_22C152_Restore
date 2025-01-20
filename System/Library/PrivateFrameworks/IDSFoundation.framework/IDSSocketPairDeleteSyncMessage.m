@interface IDSSocketPairDeleteSyncMessage
- (unsigned)command;
@end

@implementation IDSSocketPairDeleteSyncMessage

- (unsigned)command
{
  return 51;
}

@end