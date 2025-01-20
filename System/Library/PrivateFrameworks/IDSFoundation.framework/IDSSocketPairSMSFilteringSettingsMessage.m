@interface IDSSocketPairSMSFilteringSettingsMessage
- (unsigned)command;
@end

@implementation IDSSocketPairSMSFilteringSettingsMessage

- (unsigned)command
{
  return 50;
}

@end