@interface DOCOpenLocationIntent(DOCOpenLocationIntentExtensions)
@end

@implementation DOCOpenLocationIntent(DOCOpenLocationIntentExtensions)

+ (void)intentFromActivity:()DOCOpenLocationIntentExtensions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222E2D000, a2, OS_LOG_TYPE_ERROR, "Unable to get DOCOpenLocationIntent from activity: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)intentFromGenericIntent:()DOCOpenLocationIntentExtensions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222E2D000, a2, OS_LOG_TYPE_ERROR, "Unable create typed intent from intent: %@", (uint8_t *)&v2, 0xCu);
}

@end