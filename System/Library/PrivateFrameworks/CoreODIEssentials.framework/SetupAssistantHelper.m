@interface SetupAssistantHelper
+ (BOOL)helperBYSetupAssistantNeedsToRun;
@end

@implementation SetupAssistantHelper

+ (BOOL)helperBYSetupAssistantNeedsToRun
{
  return softLinkBYSetupAssistantNeedsToRun();
}

@end