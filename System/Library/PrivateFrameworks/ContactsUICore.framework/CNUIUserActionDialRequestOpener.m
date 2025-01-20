@interface CNUIUserActionDialRequestOpener
@end

@implementation CNUIUserActionDialRequestOpener

void __66___CNUIUserActionDialRequestOpener_openDialRequest_withScheduler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) callCenter];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 48) errorOnlyCompletionHandlerAdapter];
  [v4 launchAppForDialRequest:v2 completion:v3];
}

id __66___CNUIUserActionDialRequestOpener_openDialRequest_withScheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() errorForUnableToOpenDialRequest:*(void *)(a1 + 40) withUnderlyingError:v3];

  v5 = [MEMORY[0x263F335E0] futureWithError:v4];

  return v5;
}

void __66___CNUIUserActionDialRequestOpener_openDialRequest_withScheduler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __66___CNUIUserActionDialRequestOpener_openDialRequest_withScheduler___block_invoke_3_cold_1((uint64_t)v2, v3);
  }
}

void __66___CNUIUserActionDialRequestOpener_openDialRequest_withScheduler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20B704000, a2, OS_LOG_TYPE_DEBUG, "Failed to open dialRequest: %@", (uint8_t *)&v2, 0xCu);
}

@end