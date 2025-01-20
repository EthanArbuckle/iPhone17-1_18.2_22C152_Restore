@interface AISChildSetupBiomeEventFactory
+ (id)biomeEventWithIsNewChildAccount:(id)a3 startDate:(id)a4 endDate:(id)a5 completedSetup:(id)a6 lastViewedScreen:(int64_t)a7 appUsage:(id)a8 askToBuy:(id)a9 commSafety:(id)a10 screenDistance:(id)a11 age:(id)a12 flowType:(int64_t)a13;
+ (id)log;
@end

@implementation AISChildSetupBiomeEventFactory

+ (id)log
{
  if (log_onceToken[0] != -1) {
    dispatch_once(log_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)log_log;
  return v2;
}

void __37__AISChildSetupBiomeEventFactory_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.appleidsetup", "biome");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;
}

+ (id)biomeEventWithIsNewChildAccount:(id)a3 startDate:(id)a4 endDate:(id)a5 completedSetup:(id)a6 lastViewedScreen:(int64_t)a7 appUsage:(id)a8 askToBuy:(id)a9 commSafety:(id)a10 screenDistance:(id)a11 age:(id)a12 flowType:(int64_t)a13
{
  id v30 = a12;
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  v26 = +[AISChildSetupBiomeEventFactory log];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    +[AISChildSetupBiomeEventFactory biomeEventWithIsNewChildAccount:startDate:endDate:completedSetup:lastViewedScreen:appUsage:askToBuy:commSafety:screenDistance:age:flowType:](v26);
  }

  LODWORD(v29) = a13;
  v27 = (void *)[objc_alloc(MEMORY[0x263F29FE0]) initWithIsNewChildAccount:v25 startDate:v24 endDate:v23 completedSetup:v22 lastViewedScreen:a7 appUsage:v21 askToBuy:v20 commSafety:v19 screenDistance:v18 age:v30 flowType:v29];

  return v27;
}

+ (void)biomeEventWithIsNewChildAccount:(os_log_t)log startDate:endDate:completedSetup:lastViewedScreen:appUsage:askToBuy:commSafety:screenDistance:age:flowType:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_247F93000, log, OS_LOG_TYPE_DEBUG, "AISChildSetupBiomeEventFactory - Creating BMAppleIDChildSetup biome event", v1, 2u);
}

@end