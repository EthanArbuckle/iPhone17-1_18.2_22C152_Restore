@interface CSAVVoiceTriggerClientManager
+ (id)sharedVoiceTriggerClient;
@end

@implementation CSAVVoiceTriggerClientManager

+ (id)sharedVoiceTriggerClient
{
  return (id)[MEMORY[0x1E4F15508] sharedInstance];
}

@end