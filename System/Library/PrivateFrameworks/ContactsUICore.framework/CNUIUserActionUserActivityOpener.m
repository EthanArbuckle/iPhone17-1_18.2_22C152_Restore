@interface CNUIUserActionUserActivityOpener
@end

@implementation CNUIUserActionUserActivityOpener

void __90___CNUIUserActionUserActivityOpener_openUserActivity_usingBundleIdentifier_withScheduler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) becomeCurrent];
  v2 = [*(id *)(a1 + 40) applicationWorkspace];
  id v7 = [v2 applicationForBundleIdentifier:*(void *)(a1 + 48)];

  v3 = +[CNUIApplicationLaunchOptions defaultOptions];
  v4 = [*(id *)(a1 + 40) applicationWorkspace];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = [*(id *)(a1 + 56) BOOLErrorCompletionHandlerAdapter];
  [v4 openUserActivity:v5 inApplication:v7 options:v3 completionHandler:v6];
}

id __90___CNUIUserActionUserActivityOpener_openUserActivity_usingBundleIdentifier_withScheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [(id)objc_opt_class() errorForUnableToOpenUserActivity:*(void *)(a1 + 40) withUnderlyingError:v3];

  uint64_t v5 = [MEMORY[0x263F335E0] futureWithError:v4];

  return v5;
}

void __90___CNUIUserActionUserActivityOpener_openUserActivity_usingBundleIdentifier_withScheduler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __90___CNUIUserActionUserActivityOpener_openUserActivity_usingBundleIdentifier_withScheduler___block_invoke_3_cold_1((uint64_t)v2, v3);
  }
}

void __90___CNUIUserActionUserActivityOpener_openUserActivity_usingBundleIdentifier_withScheduler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B704000, a2, OS_LOG_TYPE_ERROR, "Failed to open user activity: %@", (uint8_t *)&v2, 0xCu);
}

@end