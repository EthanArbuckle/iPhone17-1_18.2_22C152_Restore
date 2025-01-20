@interface NSUserDefaults
@end

@implementation NSUserDefaults

uint64_t __38__NSUserDefaults_CEC__cecUserDefaults__block_invoke()
{
  v2[4] = *MEMORY[0x263EF8340];
  cecUserDefaults_cecUserDefaults = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.CoreCEC"];
  v1[0] = @"deferLossOfLink";
  v1[1] = @"analyticsDelay";
  v2[0] = MEMORY[0x263EFFA88];
  v2[1] = &unk_26FEDA9A8;
  v1[2] = @"cecActiveSourceRecentlySentDuration";
  v1[3] = @"powerNotificationDebounceTime";
  v2[2] = &unk_26FEDA9C0;
  v2[3] = &unk_26FEDA9D8;
  return objc_msgSend((id)cecUserDefaults_cecUserDefaults, "registerDefaults:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v2, v1, 4));
}

@end