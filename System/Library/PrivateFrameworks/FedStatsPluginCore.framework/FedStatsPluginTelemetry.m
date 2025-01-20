@interface FedStatsPluginTelemetry
+ (void)reportPluginForAssetProvider:(id)a3 recipeIdentifier:(id)a4 withError:(id)a5;
+ (void)reportPluginSucceedForAssetProvider:(id)a3 recipeIdentifier:(id)a4;
@end

@implementation FedStatsPluginTelemetry

+ (void)reportPluginSucceedForAssetProvider:(id)a3 recipeIdentifier:(id)a4
{
}

+ (void)reportPluginForAssetProvider:(id)a3 recipeIdentifier:(id)a4 withError:(id)a5
{
  v7 = (void *)MEMORY[0x263F515A0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v7 sharedInstance];
  id v12 = objc_alloc(MEMORY[0x263F515B0]);
  v13 = [v10 experimentIdentifierForRecipe:v9];
  v14 = [v10 deploymentIdentifierForRecipe:v9];
  uint64_t v15 = [v14 intValue];
  v16 = [v10 treatmentIdentifierForRecipe:v9];

  v17 = (void *)[v12 initWithExperimentID:v13 deploymentID:v15 treatmentID:v16];
  v18 = (void *)[objc_alloc(MEMORY[0x263F515A8]) initWithPerformTrialTaskStatus:v8 == 0 error:v8 usePrivateUpload:1];

  id v22 = 0;
  LODWORD(v9) = [v11 addLighthousePluginEvent:v18 identifiers:v17 error:&v22];
  id v19 = v22;
  v20 = v19;
  if (v9 && v19)
  {
    v21 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[FedStatsPluginTelemetry reportPluginForAssetProvider:recipeIdentifier:withError:]((uint64_t)v20, v21);
    }
  }
}

+ (void)reportPluginForAssetProvider:(uint64_t)a1 recipeIdentifier:(NSObject *)a2 withError:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24DF73000, a2, OS_LOG_TYPE_ERROR, "Bitacora donation error: %@", (uint8_t *)&v2, 0xCu);
}

@end