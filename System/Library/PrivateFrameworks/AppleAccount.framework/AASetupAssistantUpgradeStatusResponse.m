@interface AASetupAssistantUpgradeStatusResponse
- (NSNumber)upgradeStatus;
@end

@implementation AASetupAssistantUpgradeStatusResponse

- (NSNumber)upgradeStatus
{
  v2 = [(AAResponse *)self responseDictionary];
  v3 = [v2 objectForKey:AASetupAssistantUpgradeStatusKey];

  return (NSNumber *)v3;
}

@end