@interface CRSUISystemWallpaper
+ (id)_wallpaperInfo;
+ (id)defaultWallpaper;
+ (id)wallpaperWithIdentifier:(id)a3;
+ (id)wallpapers;
- (BOOL)isEqual:(id)a3;
- (CRSUISystemWallpaper)initWithIdentifier:(id)a3;
- (CRSUIWallpaperTraits)traits;
- (NSString)cacheID;
- (NSString)description;
- (NSString)identifier;
- (NSString)systemIdentifier;
- (NSString)thumbnailAssetCatalogName;
- (NSString)wallpaperAssetCatalogName;
- (UIColor)color;
- (id)_imageURLWithCompatibleTraitCollection:(id)a3;
- (id)_thumbnailImageURLWithCompatibleTraitCollection:(id)a3;
- (id)data;
- (id)resolveWallpaper;
@end

@implementation CRSUISystemWallpaper

+ (id)wallpaperWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v4];

  return v5;
}

+ (id)wallpapers
{
  if (wallpapers_onceToken != -1) {
    dispatch_once(&wallpapers_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)wallpapers__systemWallpapers;
  return v2;
}

void __34__CRSUISystemWallpaper_wallpapers__block_invoke()
{
  v12[10] = *MEMORY[0x263EF8340];
  v0 = +[CRSUISystemWallpaper wallpaperWithIdentifier:@"CARWallpaper2024BlueDynamic"];
  v12[0] = v0;
  v1 = +[CRSUISystemWallpaper wallpaperWithIdentifier:@"CARWallpaper2024PurpleDynamic"];
  v12[1] = v1;
  v2 = +[CRSUISystemWallpaper wallpaperWithIdentifier:@"CARWallpaper2024OchreDynamic"];
  v12[2] = v2;
  v3 = +[CRSUISystemWallpaper wallpaperWithIdentifier:@"CARWallpaper2024GrayDynamic"];
  v12[3] = v3;
  id v4 = +[CRSUISystemWallpaper wallpaperWithIdentifier:@"CARWallpaper2023MulticolorDynamic"];
  v12[4] = v4;
  v5 = +[CRSUISystemWallpaper wallpaperWithIdentifier:@"CARWallpaper2022ColorDynamic"];
  v12[5] = v5;
  v6 = +[CRSUISystemWallpaper wallpaperWithIdentifier:@"CARWallpaperWWDC2021MulticolorDynamic"];
  v12[6] = v6;
  v7 = +[CRSUISystemWallpaper wallpaperWithIdentifier:@"CARWallpaperRedBlueDynamic"];
  v12[7] = v7;
  v8 = +[CRSUISystemWallpaper wallpaperWithIdentifier:@"CARWallpaperSolidDynamic"];
  v12[8] = v8;
  v9 = +[CRSUISystemWallpaper wallpaperWithIdentifier:@"CARWallpaperSolidBlack"];
  v12[9] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:10];
  v11 = (void *)wallpapers__systemWallpapers;
  wallpapers__systemWallpapers = v10;
}

+ (id)defaultWallpaper
{
  v2 = +[CRSUISystemWallpaper wallpapers];
  v3 = [v2 firstObject];

  return v3;
}

- (id)resolveWallpaper
{
  v3 = [(CRSUISystemWallpaper *)self wallpaperAssetCatalogName];
  id v4 = [(CRSUISystemWallpaper *)self thumbnailAssetCatalogName];
  v5 = [CRSUIResolvedWallpaper alloc];
  id v12 = v4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__CRSUISystemWallpaper_resolveWallpaper__block_invoke;
  v13[3] = &unk_264307AA8;
  id v14 = v3;
  uint64_t v11 = MEMORY[0x263EF8330];
  id v6 = v4;
  id v7 = v3;
  v8 = [(CRSUISystemWallpaper *)self color];
  v9 = [(CRSUIResolvedWallpaper *)v5 initWithWallpaperInformation:self imageResolver:v13 thumbnailResolver:&v11 statefulPackage:0 color:v8];

  return v9;
}

id __40__CRSUISystemWallpaper_resolveWallpaper__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x263F1C6B0], "crsui_wallpaperImageNamed:compatibleWithTraitCollection:", v2, a2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __40__CRSUISystemWallpaper_resolveWallpaper__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x263F1C6B0], "crsui_imageNamed:compatibleWithTraitCollection:", v2, a2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (UIColor)color
{
  v3 = [(CRSUISystemWallpaper *)self systemIdentifier];
  int v4 = [v3 isEqualToString:@"CARWallpaperSolidDynamic"];

  if (v4)
  {
    v5 = [MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_75];
  }
  else
  {
    id v6 = [(CRSUISystemWallpaper *)self systemIdentifier];
    int v7 = [v6 isEqualToString:@"CARWallpaperSolidBlack"];

    if (v7)
    {
      v5 = [MEMORY[0x263F1C550] blackColor];
    }
    else
    {
      v5 = 0;
    }
  }
  return (UIColor *)v5;
}

id __29__CRSUISystemWallpaper_color__block_invoke(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x263EF8340];
  if ([a2 userInterfaceStyle] == 1)
  {
    uint64_t v2 = [MEMORY[0x263F1C550] tableBackgroundColor];
  }
  else
  {
    v3 = (void *)MEMORY[0x263F1CB00];
    int v4 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceIdiom:3];
    v12[0] = v4;
    v5 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
    v12[1] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
    int v7 = [v3 traitCollectionWithTraitsFromCollections:v6];

    v8 = self;
    v9 = [v7 traitCollectionByReplacingNSIntegerValue:0 forTrait:v8];

    uint64_t v10 = [MEMORY[0x263F1C550] tableBackgroundColor];
    uint64_t v2 = [v10 resolvedColorWithTraitCollection:v9];
  }
  return v2;
}

- (NSString)identifier
{
  return self->_systemIdentifier;
}

- (id)data
{
  id v3 = objc_alloc(MEMORY[0x263F30EA8]);
  int v4 = [(CRSUISystemWallpaper *)self identifier];
  v5 = (void *)[v3 initWithIdentifier:v4];

  return v5;
}

- (NSString)cacheID
{
  id v3 = [(CRSUISystemWallpaper *)self color];
  if (v3) {
    systemIdentifier = 0;
  }
  else {
    systemIdentifier = self->_systemIdentifier;
  }
  v5 = systemIdentifier;

  return v5;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  int v4 = [(CRSUISystemWallpaper *)self identifier];
  [v3 appendString:v4 withName:@"identifier"];

  v5 = [(CRSUISystemWallpaper *)self traits];
  id v6 = (id)[v3 appendObject:v5 withName:@"traits"];

  int v7 = [v3 build];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      int v7 = v6;
    }
    else {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [(CRSUISystemWallpaper *)self data];
    uint64_t v10 = [v8 data];
    char v11 = [v9 isEqual:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (CRSUISystemWallpaper)initWithIdentifier:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[CRSUISystemWallpaper _wallpaperInfo];
  int v7 = [v6 objectForKey:v5];

  if (v7)
  {
    v27.receiver = self;
    v27.super_class = (Class)CRSUISystemWallpaper;
    id v8 = [(CRSUISystemWallpaper *)&v27 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_systemIdentifier, a3);
      v26 = [CRSUIWallpaperTraits alloc];
      uint64_t v10 = [v7 objectForKeyedSubscript:@"dynamicAppearance"];
      unsigned int v25 = [v10 BOOLValue];
      char v11 = [v7 objectForKeyedSubscript:@"dashboardPlatterMaterials"];
      uint64_t v12 = [v11 BOOLValue];
      v13 = [v7 objectForKeyedSubscript:@"iconLabelsBackground"];
      uint64_t v14 = [v13 BOOLValue];
      v15 = [v7 objectForKeyedSubscript:@"hideRoundedCorners"];
      uint64_t v16 = -[CRSUIWallpaperTraits initWithSupportsDynamicAppearance:supportsDashboardPlatterMaterials:iconLabelsRequireBackground:hideRoundedCorners:black:](v26, "initWithSupportsDynamicAppearance:supportsDashboardPlatterMaterials:iconLabelsRequireBackground:hideRoundedCorners:black:", v25, v12, v14, [v15 BOOLValue], -[NSString isEqualToString:](v9->_systemIdentifier, "isEqualToString:", @"CARWallpaperSolidBlack"));
      traits = v9->_traits;
      v9->_traits = (CRSUIWallpaperTraits *)v16;

      uint64_t v18 = [v7 objectForKeyedSubscript:@"wallpaperAssetCatalogName"];
      wallpaperAssetCatalogName = v9->_wallpaperAssetCatalogName;
      v9->_wallpaperAssetCatalogName = (NSString *)v18;

      uint64_t v20 = [v7 objectForKeyedSubscript:@"thumbnailAssetCatalogName"];
      thumbnailAssetCatalogName = v9->_thumbnailAssetCatalogName;
      v9->_thumbnailAssetCatalogName = (NSString *)v20;
    }
    self = v9;
    v22 = self;
  }
  else
  {
    v23 = CRSUILogForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v29 = v5;
      _os_log_impl(&dword_21817A000, v23, OS_LOG_TYPE_DEFAULT, "[CRSUIWallpaperPreferences] Unknown wallpaper: %{public}@", buf, 0xCu);
    }

    v22 = 0;
  }

  return v22;
}

- (id)_imageURLWithCompatibleTraitCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUISystemWallpaper *)self wallpaperAssetCatalogName];

  if (v5)
  {
    uint64_t v6 = [v4 userInterfaceStyle];
    int v7 = @"-Dark";
    if (v6 == 1) {
      int v7 = @"-Light";
    }
    id v8 = v7;
    v9 = [(CRSUISystemWallpaper *)self wallpaperAssetCatalogName];
    uint64_t v10 = [v9 stringByAppendingString:v8];

    char v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarPlayUIServices"];
    uint64_t v12 = [v11 URLForResource:v10 withExtension:@"heic"];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)_thumbnailImageURLWithCompatibleTraitCollection:(id)a3
{
  id v4 = [(CRSUISystemWallpaper *)self thumbnailAssetCatalogName];

  if (v4)
  {
    id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CarPlayUIServices"];
    uint64_t v6 = [(CRSUISystemWallpaper *)self thumbnailAssetCatalogName];
    int v7 = [v5 URLForResource:v6 withExtension:@"heic"];
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

+ (id)_wallpaperInfo
{
  if (_wallpaperInfo_onceToken != -1) {
    dispatch_once(&_wallpaperInfo_onceToken, &__block_literal_global_101);
  }
  uint64_t v2 = (void *)_wallpaperInfo__wallpaperInfo;
  return v2;
}

void __38__CRSUISystemWallpaper__wallpaperInfo__block_invoke()
{
  v35[10] = *MEMORY[0x263EF8340];
  v34[0] = @"CARWallpaper2024BlueDynamic";
  uint64_t v0 = MEMORY[0x263EFFA88];
  v32[0] = @"dynamicAppearance";
  v32[1] = @"dashboardPlatterMaterials";
  v33[0] = MEMORY[0x263EFFA88];
  v33[1] = MEMORY[0x263EFFA88];
  v32[2] = @"iconLabelsBackground";
  v32[3] = @"wallpaperAssetCatalogName";
  v33[2] = MEMORY[0x263EFFA88];
  v33[3] = @"Wallpaper2024Blue";
  v32[4] = @"thumbnailAssetCatalogName";
  v32[5] = @"hideRoundedCorners";
  uint64_t v1 = MEMORY[0x263EFFA80];
  v33[4] = @"WallpaperCell2024Blue";
  v33[5] = MEMORY[0x263EFFA80];
  v13 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:6];
  v35[0] = v13;
  v34[1] = @"CARWallpaper2024PurpleDynamic";
  v30[0] = @"dynamicAppearance";
  v30[1] = @"dashboardPlatterMaterials";
  v31[0] = v0;
  v31[1] = v0;
  v31[2] = v0;
  v31[3] = @"Wallpaper2024Purple";
  v30[2] = @"iconLabelsBackground";
  v30[3] = @"wallpaperAssetCatalogName";
  v30[4] = @"thumbnailAssetCatalogName";
  v30[5] = @"hideRoundedCorners";
  v31[4] = @"WallpaperCell2024Purple";
  v31[5] = v1;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6];
  v35[1] = v12;
  v34[2] = @"CARWallpaper2024OchreDynamic";
  v28[0] = @"dynamicAppearance";
  v28[1] = @"dashboardPlatterMaterials";
  v29[0] = v0;
  v29[1] = v0;
  v29[2] = v0;
  v29[3] = @"Wallpaper2024Ochre";
  v28[2] = @"iconLabelsBackground";
  v28[3] = @"wallpaperAssetCatalogName";
  v28[4] = @"thumbnailAssetCatalogName";
  v28[5] = @"hideRoundedCorners";
  v29[4] = @"WallpaperCell2024Ochre";
  v29[5] = v1;
  char v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];
  v35[2] = v11;
  v34[3] = @"CARWallpaper2024GrayDynamic";
  v26[0] = @"dynamicAppearance";
  v26[1] = @"dashboardPlatterMaterials";
  v27[0] = v0;
  v27[1] = v0;
  v27[2] = v0;
  v27[3] = @"Wallpaper2024Gray";
  v26[2] = @"iconLabelsBackground";
  v26[3] = @"wallpaperAssetCatalogName";
  v26[4] = @"thumbnailAssetCatalogName";
  v26[5] = @"hideRoundedCorners";
  v27[4] = @"WallpaperCell2024Gray";
  v27[5] = v1;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:6];
  v35[3] = v10;
  v34[4] = @"CARWallpaper2023MulticolorDynamic";
  v24[0] = @"dynamicAppearance";
  v24[1] = @"dashboardPlatterMaterials";
  v25[0] = v0;
  v25[1] = v0;
  v25[2] = v0;
  v25[3] = @"Wallpaper2023Multicolor";
  v24[2] = @"iconLabelsBackground";
  v24[3] = @"wallpaperAssetCatalogName";
  v24[4] = @"thumbnailAssetCatalogName";
  v24[5] = @"hideRoundedCorners";
  v25[4] = @"WallpaperCell2023Multicolor";
  v25[5] = v1;
  v9 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:6];
  v35[4] = v9;
  v34[5] = @"CARWallpaper2022ColorDynamic";
  v22[0] = @"dynamicAppearance";
  v22[1] = @"dashboardPlatterMaterials";
  v23[0] = v0;
  v23[1] = v0;
  v23[2] = v0;
  v23[3] = @"Wallpaper2022Color";
  v22[2] = @"iconLabelsBackground";
  v22[3] = @"wallpaperAssetCatalogName";
  v22[4] = @"thumbnailAssetCatalogName";
  v22[5] = @"hideRoundedCorners";
  v23[4] = @"WallpaperCell2022Color";
  v23[5] = v1;
  id v8 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:6];
  v35[5] = v8;
  v34[6] = @"CARWallpaperWWDC2021MulticolorDynamic";
  v20[0] = @"dynamicAppearance";
  v20[1] = @"dashboardPlatterMaterials";
  v21[0] = v0;
  v21[1] = v0;
  v21[2] = v0;
  v21[3] = @"WallpaperWWDC2021Multicolor";
  v20[2] = @"iconLabelsBackground";
  v20[3] = @"wallpaperAssetCatalogName";
  v20[4] = @"thumbnailAssetCatalogName";
  v20[5] = @"hideRoundedCorners";
  v21[4] = @"WallpaperCellWWDC2021Multicolor";
  v21[5] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:6];
  v35[6] = v2;
  v34[7] = @"CARWallpaperRedBlueDynamic";
  v18[0] = @"dynamicAppearance";
  v18[1] = @"dashboardPlatterMaterials";
  v19[0] = v0;
  v19[1] = v0;
  v18[2] = @"iconLabelsBackground";
  v18[3] = @"wallpaperAssetCatalogName";
  v19[2] = v0;
  v19[3] = @"WallpaperRedBlue";
  v18[4] = @"thumbnailAssetCatalogName";
  v18[5] = @"hideRoundedCorners";
  v19[4] = @"WallpaperCellRedBlue";
  v19[5] = v1;
  id v3 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:6];
  v35[7] = v3;
  v34[8] = @"CARWallpaperSolidDynamic";
  v16[0] = @"dynamicAppearance";
  v16[1] = @"dashboardPlatterMaterials";
  v17[0] = v0;
  v17[1] = v1;
  v16[2] = @"iconLabelsBackground";
  v16[3] = @"thumbnailAssetCatalogName";
  v17[2] = v1;
  v17[3] = @"WallpaperCellSolid";
  v16[4] = @"hideRoundedCorners";
  v17[4] = v1;
  id v4 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
  v35[8] = v4;
  v34[9] = @"CARWallpaperSolidBlack";
  v14[0] = @"dynamicAppearance";
  v14[1] = @"dashboardPlatterMaterials";
  v15[0] = v1;
  v15[1] = v1;
  v14[2] = @"iconLabelsBackground";
  v14[3] = @"hideRoundedCorners";
  v15[2] = v1;
  v15[3] = v0;
  id v5 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  v35[9] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:10];
  int v7 = (void *)_wallpaperInfo__wallpaperInfo;
  _wallpaperInfo__wallpaperInfo = v6;
}

- (CRSUIWallpaperTraits)traits
{
  return self->_traits;
}

- (NSString)systemIdentifier
{
  return self->_systemIdentifier;
}

- (NSString)wallpaperAssetCatalogName
{
  return self->_wallpaperAssetCatalogName;
}

- (NSString)thumbnailAssetCatalogName
{
  return self->_thumbnailAssetCatalogName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailAssetCatalogName, 0);
  objc_storeStrong((id *)&self->_wallpaperAssetCatalogName, 0);
  objc_storeStrong((id *)&self->_systemIdentifier, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end