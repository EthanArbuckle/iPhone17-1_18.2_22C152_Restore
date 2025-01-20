@interface BPSTapToRadarCoordinator
+ (BOOL)openTapToRadarWithInitialMetadata:(id)a3;
+ (id)tapToRadarLaunchURLWithInitialMetadata:(id)a3;
+ (id)tapToRadarUserActivityWithInitialMetadata:(id)a3;
@end

@implementation BPSTapToRadarCoordinator

+ (BOOL)openTapToRadarWithInitialMetadata:(id)a3
{
  v3 = [a1 tapToRadarLaunchURLWithInitialMetadata:a3];
  v4 = [MEMORY[0x263F01880] defaultWorkspace];
  [v4 openURL:v3 configuration:0 completionHandler:&__block_literal_global_5];

  return 1;
}

void __62__BPSTapToRadarCoordinator_openTapToRadarWithInitialMetadata___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = bps_setup_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [v3 localizedDescription];
      int v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_21C513000, v4, OS_LOG_TYPE_DEFAULT, "Error opening tap-to-radar: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

+ (id)tapToRadarLaunchURLWithInitialMetadata:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08BA0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setScheme:@"tap-to-radar"];
  [v5 setHost:@"new"];
  int v6 = [v4 queryItems];

  [v5 setQueryItems:v6];
  v7 = [v5 URL];

  return v7;
}

+ (id)tapToRadarUserActivityWithInitialMetadata:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [a1 tapToRadarLaunchURLWithInitialMetadata:a3];
  id v4 = [v3 absoluteString];
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F018D0]) initWithActivityType:@"com.apple.Bridge.ttr"];
    [v5 setEligibleForSearch:0];
    [v5 setEligibleForHandoff:0];
    [v5 setEligibleForPrediction:0];
    [v5 setEligibleForPublicIndexing:0];
    v9 = @"tap-to-radar";
    v10[0] = v4;
    int v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v5 setUserInfo:v6];
  }
  else
  {
    int v6 = bps_setup_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_21C513000, v6, OS_LOG_TYPE_DEFAULT, "Error: Tried to generate tap-to-radar NSUserActivity but URL string was malformed", v8, 2u);
    }
    id v5 = 0;
  }

  return v5;
}

@end