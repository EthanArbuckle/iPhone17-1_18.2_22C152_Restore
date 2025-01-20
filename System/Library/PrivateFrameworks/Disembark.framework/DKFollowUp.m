@interface DKFollowUp
+ (id)_followUpController;
+ (id)_followUpIconName;
+ (void)clearFollowUp;
+ (void)postFollowUp;
@end

@implementation DKFollowUp

+ (void)postFollowUp
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226E9F000, a2, OS_LOG_TYPE_ERROR, "Failed to post follow up: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)clearFollowUp
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226E9F000, a2, OS_LOG_TYPE_ERROR, "Failed to clear follow up: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (id)_followUpController
{
  int v2 = (void *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:@"com.apple.disembarkui"];
  return v2;
}

+ (id)_followUpIconName
{
  int v2 = (void *)MGCopyAnswer();
  uint64_t v3 = [v2 lowercaseString];

  return v3;
}

@end