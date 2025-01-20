@interface PosterKitUtilities
+ (BOOL)saveCompoundLayerStack:(id)a3 toWallpaperURL:(id)a4 error:(id *)a5;
+ (BOOL)storeConfiguredPropertiesForPath:(id)a3 configuredProperties:(id)a4 error:(id *)a5;
+ (id)archiver;
+ (id)configurationIdentityWithProvider:(id)a3 identifier:(id)a4 posterUUID:(id)a5 version:(unint64_t)a6 supplement:(unint64_t)a7;
+ (id)configurationWithPath:(id)a3;
+ (id)configuredPropertiesWithTitleStyleConfiguration:(id)a3 renderingConfiguration:(id)a4;
+ (id)discreteColorsContentStyleForColors:(id)a3 vibrant:(BOOL)a4 supportsVariation:(BOOL)a5 variation:(double)a6;
+ (id)gradientContentStyleForColors:(id)a3 gradientType:(unint64_t)a4 locations:(id)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7;
+ (id)loadConfiguredPropertiesFromPosterConfiguration:(id)a3 error:(id *)a4;
+ (id)posterColorWithColor:(CGColor *)a3 preferredStyle:(unint64_t)a4 localizedName:(id)a5;
+ (id)renderingConfigurationWithDepthEffectDisabled:(BOOL)a3 parallaxEnabled:(BOOL)a4;
+ (id)serverPathWithProviderURL:(id)a3 identity:(id)a4;
+ (id)systemTimeFontConfigurationWithTimeFontIdentifier:(id)a3 weight:(double)a4 systemItem:(BOOL)a5;
+ (id)titleStyleConfigurationWithTimeFontConfiguration:(id)a3 preferredTitleAlignment:(unint64_t)a4 preferredTitleLayout:(unint64_t)a5 titleContentStyle:(id)a6 timeNumberingSystem:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11;
+ (id)vibrantMaterialContentStyle;
+ (id)vibrantMonochromeContentStyle;
@end

@implementation PosterKitUtilities

+ (id)archiver
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getPRSPosterArchiverClass_softClass;
  uint64_t v10 = getPRSPosterArchiverClass_softClass;
  if (!getPRSPosterArchiverClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getPRSPosterArchiverClass_block_invoke;
    v6[3] = &unk_1E5FF6880;
    v6[4] = &v7;
    __getPRSPosterArchiverClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  v3 = v2;
  _Block_object_dispose(&v7, 8);
  v4 = (void *)[[v3 alloc] init];
  return v4;
}

+ (id)systemTimeFontConfigurationWithTimeFontIdentifier:(id)a3 weight:(double)a4 systemItem:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v8 = (void *)getPRPosterSystemTimeFontConfigurationClass_softClass;
  uint64_t v16 = getPRPosterSystemTimeFontConfigurationClass_softClass;
  if (!getPRPosterSystemTimeFontConfigurationClass_softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getPRPosterSystemTimeFontConfigurationClass_block_invoke;
    v12[3] = &unk_1E5FF6880;
    v12[4] = &v13;
    __getPRPosterSystemTimeFontConfigurationClass_block_invoke((uint64_t)v12);
    v8 = (void *)v14[3];
  }
  uint64_t v9 = v8;
  _Block_object_dispose(&v13, 8);
  uint64_t v10 = (void *)[[v9 alloc] initWithTimeFontIdentifier:v7 weight:v5 systemItem:a4];

  return v10;
}

+ (id)posterColorWithColor:(CGColor *)a3 preferredStyle:(unint64_t)a4 localizedName:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v8 = (void *)getPRPosterColorClass_softClass;
  uint64_t v18 = getPRPosterColorClass_softClass;
  if (!getPRPosterColorClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getPRPosterColorClass_block_invoke;
    v14[3] = &unk_1E5FF6880;
    v14[4] = &v15;
    __getPRPosterColorClass_block_invoke((uint64_t)v14);
    v8 = (void *)v16[3];
  }
  uint64_t v9 = v8;
  _Block_object_dispose(&v15, 8);
  id v10 = [v9 alloc];
  uint64_t v11 = (void *)[objc_alloc((Class)getUIColorClass()) initWithCGColor:a3];
  v12 = (void *)[v10 initWithColor:v11 preferredStyle:a4 localizedName:v7];

  return v12;
}

+ (id)titleStyleConfigurationWithTimeFontConfiguration:(id)a3 preferredTitleAlignment:(unint64_t)a4 preferredTitleLayout:(unint64_t)a5 titleContentStyle:(id)a6 timeNumberingSystem:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11
{
  BOOL v12 = a8;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a6;
  id v19 = a7;
  id v20 = a11;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  v21 = (void *)getPRPosterTitleStyleConfigurationClass_softClass;
  uint64_t v30 = getPRPosterTitleStyleConfigurationClass_softClass;
  if (!getPRPosterTitleStyleConfigurationClass_softClass)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __getPRPosterTitleStyleConfigurationClass_block_invoke;
    v26[3] = &unk_1E5FF6880;
    v26[4] = &v27;
    __getPRPosterTitleStyleConfigurationClass_block_invoke((uint64_t)v26);
    v21 = (void *)v28[3];
  }
  v22 = v21;
  _Block_object_dispose(&v27, 8);
  LOBYTE(v25) = a10;
  v23 = (void *)[[v22 alloc] initWithTimeFontConfiguration:v17 preferredTitleAlignment:a4 preferredTitleLayout:a5 titleContentStyle:v18 timeNumberingSystem:v19 userConfigured:v12 contentsLuminance:a9 alternateDateEnabled:v25 groupName:v20];

  return v23;
}

+ (id)renderingConfigurationWithDepthEffectDisabled:(BOOL)a3 parallaxEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v6 = (void *)getPRPosterRenderingConfigurationClass_softClass;
  uint64_t v14 = getPRPosterRenderingConfigurationClass_softClass;
  if (!getPRPosterRenderingConfigurationClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getPRPosterRenderingConfigurationClass_block_invoke;
    v10[3] = &unk_1E5FF6880;
    v10[4] = &v11;
    __getPRPosterRenderingConfigurationClass_block_invoke((uint64_t)v10);
    v6 = (void *)v12[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v11, 8);
  v8 = (void *)[[v7 alloc] initWithDepthEffectDisabled:v5 parallaxEnabled:v4];
  return v8;
}

+ (id)configuredPropertiesWithTitleStyleConfiguration:(id)a3 renderingConfiguration:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v7 = (void *)getPRPosterConfiguredPropertiesClass_softClass;
  uint64_t v15 = getPRPosterConfiguredPropertiesClass_softClass;
  if (!getPRPosterConfiguredPropertiesClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getPRPosterConfiguredPropertiesClass_block_invoke;
    v11[3] = &unk_1E5FF6880;
    v11[4] = &v12;
    __getPRPosterConfiguredPropertiesClass_block_invoke((uint64_t)v11);
    id v7 = (void *)v13[3];
  }
  v8 = v7;
  _Block_object_dispose(&v12, 8);
  uint64_t v9 = (void *)[[v8 alloc] initWithTitleStyleConfiguration:v5 focusConfiguration:0 complicationLayout:0 renderingConfiguration:v6 homeScreenConfiguration:0 colorVariationsConfiguration:0 quickActionsConfiguration:0 suggestionMetadata:0 otherMetadata:0 userInfo:0];

  return v9;
}

+ (id)configurationIdentityWithProvider:(id)a3 identifier:(id)a4 posterUUID:(id)a5 version:(unint64_t)a6 supplement:(unint64_t)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2050000000;
  uint64_t v14 = (void *)getPFServerPosterIdentityClass_softClass;
  uint64_t v29 = getPFServerPosterIdentityClass_softClass;
  if (!getPFServerPosterIdentityClass_softClass)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getPFServerPosterIdentityClass_block_invoke;
    v24 = &unk_1E5FF6880;
    uint64_t v25 = &v26;
    __getPFServerPosterIdentityClass_block_invoke((uint64_t)&v21);
    uint64_t v14 = (void *)v27[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v26, 8);
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v16 = (void *)getPRSPosterRoleIncomingCallSymbolLoc_ptr;
  uint64_t v29 = getPRSPosterRoleIncomingCallSymbolLoc_ptr;
  if (!getPRSPosterRoleIncomingCallSymbolLoc_ptr)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getPRSPosterRoleIncomingCallSymbolLoc_block_invoke;
    v24 = &unk_1E5FF6880;
    uint64_t v25 = &v26;
    id v17 = (void *)PosterBoardServicesLibrary();
    id v18 = dlsym(v17, "PRSPosterRoleIncomingCall");
    *(void *)(v25[1] + 24) = v18;
    getPRSPosterRoleIncomingCallSymbolLoc_ptr = *(void *)(v25[1] + 24);
    uint64_t v16 = (void *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v16) {
    +[PosterKitUtilities configurationIdentityWithProvider:identifier:posterUUID:version:supplement:]();
  }
  id v19 = [v15 configurationIdentityWithProvider:v11 identifier:v12 role:*v16 posterUUID:v13 version:a6 supplement:a7];

  return v19;
}

+ (id)serverPathWithProviderURL:(id)a3 identity:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v7 = (void *)getPFServerPosterPathClass_softClass;
  uint64_t v15 = getPFServerPosterPathClass_softClass;
  if (!getPFServerPosterPathClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getPFServerPosterPathClass_block_invoke;
    v11[3] = &unk_1E5FF6880;
    v11[4] = &v12;
    __getPFServerPosterPathClass_block_invoke((uint64_t)v11);
    id v7 = (void *)v13[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v12, 8);
  uint64_t v9 = [v8 pathWithProviderURL:v5 identity:v6];

  return v9;
}

+ (id)configurationWithPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2050000000;
  BOOL v4 = (void *)getPRSPosterConfigurationClass_softClass;
  uint64_t v12 = getPRSPosterConfigurationClass_softClass;
  if (!getPRSPosterConfigurationClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getPRSPosterConfigurationClass_block_invoke;
    v8[3] = &unk_1E5FF6880;
    v8[4] = &v9;
    __getPRSPosterConfigurationClass_block_invoke((uint64_t)v8);
    BOOL v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  id v6 = (void *)[[v5 alloc] initWithPath:v3];

  return v6;
}

+ (BOOL)storeConfiguredPropertiesForPath:(id)a3 configuredProperties:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2050000000;
  uint64_t v9 = (void *)getPRPosterPathUtilitiesClass_softClass;
  uint64_t v17 = getPRPosterPathUtilitiesClass_softClass;
  if (!getPRPosterPathUtilitiesClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getPRPosterPathUtilitiesClass_block_invoke;
    v13[3] = &unk_1E5FF6880;
    v13[4] = &v14;
    __getPRPosterPathUtilitiesClass_block_invoke((uint64_t)v13);
    uint64_t v9 = (void *)v15[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v14, 8);
  char v11 = [v10 storeConfiguredPropertiesForPath:v7 configuredProperties:v8 error:a5];

  return v11;
}

+ (id)loadConfiguredPropertiesFromPosterConfiguration:(id)a3 error:(id *)a4
{
  id v5 = a3;
  PosterKitLibrary();
  id v6 = objc_msgSend(v5, "pr_loadConfiguredPropertiesWithError:", a4);

  return v6;
}

+ (id)discreteColorsContentStyleForColors:(id)a3 vibrant:(BOOL)a4 supportsVariation:(BOOL)a5 variation:(double)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v10 = a3;
  char v11 = objc_msgSend([v9 alloc], "initWithCapacity:", objc_msgSend(v10, "count"));
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __94__PosterKitUtilities_discreteColorsContentStyleForColors_vibrant_supportsVariation_variation___block_invoke;
  id v20 = &unk_1E5FF6858;
  id v21 = v11;
  id v12 = v11;
  [v10 enumerateObjectsUsingBlock:&v17];

  id v13 = objc_alloc((Class)getPRPosterContentDiscreteColorsStyleClass());
  if (v8 && v7)
  {
    uint64_t v14 = objc_msgSend(v13, "initWithVibrantColors:variation:", v12, a6, v17, v18, v19, v20, v21, v22);
  }
  else if (v7 || !v8)
  {
    uint64_t v14 = objc_msgSend(v13, "initWithOpaqueColors:variation:", v12, a6, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    uint64_t v14 = objc_msgSend(v13, "initWithVibrantColors:", v12, v17, v18, v19, v20, v21, v22);
  }
  uint64_t v15 = (void *)v14;

  return v15;
}

void __94__PosterKitUtilities_discreteColorsContentStyleForColors_vibrant_supportsVariation_variation___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)[objc_alloc((Class)getUIColorClass()) initWithCGColor:v3];

  [v2 addObject:v4];
}

+ (id)gradientContentStyleForColors:(id)a3 gradientType:(unint64_t)a4 locations:(id)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double v9 = a6.y;
  double v10 = a6.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __95__PosterKitUtilities_gradientContentStyleForColors_gradientType_locations_startPoint_endPoint___block_invoke;
  v21[3] = &unk_1E5FF6858;
  id v16 = v15;
  id v22 = v16;
  [v13 enumerateObjectsUsingBlock:v21];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2050000000;
  uint64_t v17 = (void *)getPRPosterContentGradientStyleClass_softClass;
  uint64_t v27 = getPRPosterContentGradientStyleClass_softClass;
  if (!getPRPosterContentGradientStyleClass_softClass)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __getPRPosterContentGradientStyleClass_block_invoke;
    v23[3] = &unk_1E5FF6880;
    v23[4] = &v24;
    __getPRPosterContentGradientStyleClass_block_invoke((uint64_t)v23);
    uint64_t v17 = (void *)v25[3];
  }
  uint64_t v18 = v17;
  _Block_object_dispose(&v24, 8);
  id v19 = objc_msgSend([v18 alloc], "initWithColors:gradientType:locations:startPoint:endPoint:", v16, a4, v14, v10, v9, x, y);

  return v19;
}

void __95__PosterKitUtilities_gradientContentStyleForColors_gradientType_locations_startPoint_endPoint___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)[objc_alloc((Class)getUIColorClass()) initWithCGColor:v3];

  [v2 addObject:v4];
}

+ (id)vibrantMaterialContentStyle
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getPRPosterContentVibrantMaterialStyleClass_softClass;
  uint64_t v10 = getPRPosterContentVibrantMaterialStyleClass_softClass;
  if (!getPRPosterContentVibrantMaterialStyleClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getPRPosterContentVibrantMaterialStyleClass_block_invoke;
    v6[3] = &unk_1E5FF6880;
    v6[4] = &v7;
    __getPRPosterContentVibrantMaterialStyleClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = objc_alloc_init(v3);
  return v4;
}

+ (id)vibrantMonochromeContentStyle
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getPRPosterContentVibrantMonochromeStyleClass_softClass;
  uint64_t v10 = getPRPosterContentVibrantMonochromeStyleClass_softClass;
  if (!getPRPosterContentVibrantMonochromeStyleClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getPRPosterContentVibrantMonochromeStyleClass_block_invoke;
    v6[3] = &unk_1E5FF6880;
    v6[4] = &v7;
    __getPRPosterContentVibrantMonochromeStyleClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = objc_alloc_init(v3);
  return v4;
}

+ (BOOL)saveCompoundLayerStack:(id)a3 toWallpaperURL:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2050000000;
  uint64_t v9 = (void *)getPISegmentationLoaderClass_softClass;
  uint64_t v17 = getPISegmentationLoaderClass_softClass;
  if (!getPISegmentationLoaderClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getPISegmentationLoaderClass_block_invoke;
    v13[3] = &unk_1E5FF6880;
    v13[4] = &v14;
    __getPISegmentationLoaderClass_block_invoke((uint64_t)v13);
    uint64_t v9 = (void *)v15[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v14, 8);
  char v11 = [v10 saveSegmentationItem:0 compoundLayerStack:v7 style:0 toWallpaperURL:v8 error:a5];

  return v11;
}

+ (void)configurationIdentityWithProvider:identifier:posterUUID:version:supplement:.cold.1()
{
}

@end