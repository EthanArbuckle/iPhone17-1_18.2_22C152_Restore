@interface IDSSocketPairSessionInvitationMessage
- (unsigned)command;
@end

@implementation IDSSocketPairSessionInvitationMessage

- (unsigned)command
{
  return 8;
}

@end