@interface HDAuthorizationRequestGroup
@end

@implementation HDAuthorizationRequestGroup

void __72___HDAuthorizationRequestGroup_promptIfNecessaryWithTimeout_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C187C0E0]();
  v3 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Authorization session timed out");
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end