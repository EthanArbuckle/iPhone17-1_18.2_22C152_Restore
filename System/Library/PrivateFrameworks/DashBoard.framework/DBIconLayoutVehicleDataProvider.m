@interface DBIconLayoutVehicleDataProvider
+ (NSDictionary)defaultIconState;
- (BOOL)iconManagerCanBeginIconDrags:(id)a3;
- (BOOL)isEditingAllowedForIconManager:(id)a3;
- (Class)iconManager:(id)a3 folderControllerClassForFolderClass:(Class)a4 proposedClass:(Class)a5;
- (DBIconImageCache)iconImageCache;
- (DBIconLayoutVehicleDataProvider)initWithVehicleID:(id)a3 iconImageCache:(id)a4;
- (DBIconManager)iconManager;
- (DBIconModel)iconModel;
- (NSArray)allApplicationIcons;
- (NSArray)allApps;
- (NSString)vehicleID;
- (id)defaultIconStateForIconManager:(id)a3;
- (int64_t)interfaceOrientationForIconManager:(id)a3;
- (void)getApplicationIconInformationForBundleID:(id)a3 drawBorder:(BOOL)a4 completion:(id)a5;
- (void)getIconStateWithCompletion:(id)a3;
- (void)resetIconState;
- (void)setAllApps:(id)a3;
- (void)setIconImageCache:(id)a3;
- (void)setIconManager:(id)a3;
- (void)setIconModel:(id)a3;
- (void)setIconState:(id)a3;
- (void)setVehicleID:(id)a3;
@end

@implementation DBIconLayoutVehicleDataProvider

- (DBIconLayoutVehicleDataProvider)initWithVehicleID:(id)a3 iconImageCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)DBIconLayoutVehicleDataProvider;
  v9 = [(DBIconLayoutVehicleDataProvider *)&v20 init];
  if (v9)
  {
    v10 = +[DBApplicationController sharedInstance];
    uint64_t v11 = [v10 allApplications];
    allApps = v9->_allApps;
    v9->_allApps = (NSArray *)v11;

    objc_storeStrong((id *)&v9->_vehicleID, a3);
    objc_storeStrong((id *)&v9->_iconImageCache, a4);
    v13 = [[DBIconManager alloc] initWithEnvironment:0];
    iconManager = v9->_iconManager;
    v9->_iconManager = v13;

    [(SBHIconManager *)v9->_iconManager setDelegate:v9];
    v15 = [[DBIconModelStore alloc] initWithVehicleId:v7];
    v16 = [[DBIconModel alloc] initWithStore:v15 carApplicationDataSource:v9];
    iconModel = v9->_iconModel;
    v9->_iconModel = v16;

    v18 = [MEMORY[0x263F82B60] mainScreen];
    [v18 scale];
    [(DBIconModel *)v9->_iconModel setIconImageSize:DBIconImageInfoForScale()];

    [(SBHIconModel *)v9->_iconModel layout];
    [(SBHIconModel *)v9->_iconModel reloadIcons];
    [(SBHIconModel *)v9->_iconModel layout];
    [(SBHIconManager *)v9->_iconManager setIconModel:v9->_iconModel];
  }
  return v9;
}

- (NSArray)allApplicationIcons
{
  v3 = objc_opt_new();
  v4 = [(DBIconLayoutVehicleDataProvider *)self allApps];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__DBIconLayoutVehicleDataProvider_allApplicationIcons__block_invoke;
  v12[3] = &unk_2649B4DE0;
  id v5 = v3;
  id v13 = v5;
  [v4 enumerateObjectsUsingBlock:v12];

  v6 = objc_alloc_init(DBNowPlayingIcon);
  [v5 addObject:v6];
  id v7 = [(DBIconLayoutVehicleDataProvider *)self iconModel];
  int v8 = [v7 showsOEMIcon];

  if (v8)
  {
    v9 = [[DBOEMIcon alloc] initWithSessionConfiguration:0];
    [v5 addObject:v9];
  }
  v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return (NSArray *)v10;
}

void __54__DBIconLayoutVehicleDataProvider_allApplicationIcons__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = +[DBApplicationController sharedInstance];
  id v4 = [v3 calendarApplication];

  if (v4 == v9)
  {
    id v7 = off_2649B2E90;
  }
  else
  {
    id v5 = +[DBApplicationController sharedInstance];
    id v6 = [v5 booksApplication];

    id v7 = off_2649B3110;
    if (v6 == v9) {
      id v7 = off_2649B2E78;
    }
  }
  int v8 = (void *)[objc_alloc(*v7) initWithApplication:v9];
  [*(id *)(a1 + 32) addObject:v8];
}

- (void)getIconStateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  id v5 = [(DBIconLayoutVehicleDataProvider *)self iconModel];
  id v6 = [v5 exportIconLayoutState];

  v4[2](v4, v6, 0);
}

- (void)setIconState:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 hiddenIcons];
  id v6 = objc_msgSend(v5, "bs_map:", &__block_literal_global_24);

  id v7 = [(DBIconLayoutVehicleDataProvider *)self iconModel];
  v12[0] = *MEMORY[0x263F31310];
  int v8 = [v4 iconOrder];

  id v9 = (void *)MEMORY[0x263EFFA68];
  if (v8) {
    v10 = v8;
  }
  else {
    v10 = (void *)MEMORY[0x263EFFA68];
  }
  v12[1] = *MEMORY[0x263F31308];
  v13[0] = v10;
  if (v6) {
    id v9 = v6;
  }
  v13[1] = v9;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v7 importState:v11];
}

uint64_t __48__DBIconLayoutVehicleDataProvider_setIconState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (void)resetIconState
{
  id v2 = [(DBIconLayoutVehicleDataProvider *)self iconModel];
  [v2 resetCurrentIconState];
}

- (void)getApplicationIconInformationForBundleID:(id)a3 drawBorder:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a5;
  v10 = DBLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v8;
    _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_INFO, "ILVDP: Application icon info requested for %@", buf, 0xCu);
  }

  if (![v8 isEqualToString:@"com.apple.mobilecal"]) {
    goto LABEL_22;
  }
  uint64_t v11 = +[DBApplicationController sharedInstance];
  v12 = [v11 calendarApplication];

  id v13 = [(DBLeafIcon *)[DBCalendarLeafIcon alloc] initWithApplication:v12 drawBorder:v6];
  v14 = [MEMORY[0x263F82B60] mainScreen];
  [v14 scale];
  v15 = [(SBIcon *)v13 iconImageWithInfo:DBIconImageInfoForScale()];

  if (!v15)
  {
LABEL_22:
    v16 = [(DBIconLayoutVehicleDataProvider *)self iconImageCache];
    v17 = [(DBIconLayoutVehicleDataProvider *)self vehicleID];
    v15 = [v16 iconImageForBundleIdentifier:v8 inVehicle:v17];

    if (!v15)
    {
      if (([v8 isEqualToString:*MEMORY[0x263F31298]] & 1) != 0
        || ([v8 isEqualToString:*MEMORY[0x263F312A8]] & 1) != 0)
      {
        v15 = 0;
      }
      else
      {
        v18 = [MEMORY[0x263F82B60] mainScreen];
        [v18 scale];
        double v19 = DBIconImageInfoForScale();
        DBIconImageForBundleIdentifierWithInfoAndBorder(v8, v6, v19, v20, v21, v22);
        v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  if ([v8 isEqualToString:*MEMORY[0x263F312B0]]
    || ([v8 isEqualToString:*MEMORY[0x263F31298]] & 1) != 0
    || [v8 isEqualToString:*MEMORY[0x263F312A8]])
  {
    v23 = [NSString stringWithFormat:@"LAUNCHER_NAME-%@", v8];
    v24 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    id v25 = [v24 localizedStringForKey:v23 value:&stru_26E13A820 table:@"CarPlayApp"];
  }
  else
  {
    v23 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v8 allowPlaceholder:0 error:0];
    v29 = objc_msgSend(v23, "db_localizedCarName");
    v24 = v29;
    if (v29)
    {
      id v25 = v29;
      v24 = v25;
    }
    else
    {
      id v25 = [v23 localizedName];
    }
  }
  v26 = v25;

  v27 = (void *)[objc_alloc(MEMORY[0x263F312C0]) initWithBundleIdentifier:v8];
  if (v15)
  {
    v28 = UIImagePNGRepresentation(v15);
    [v27 setIconImageData:v28];

    [(UIImage *)v15 scale];
    objc_msgSend(v27, "setIconImageScale:");
  }
  [v27 setLocalizedDisplayName:v26];
  v9[2](v9, v27, 0);
}

+ (NSDictionary)defaultIconState
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 URLForResource:@"DefaultIconState_CarDisplay" withExtension:@"plist"];
  id v4 = [NSDictionary dictionaryWithContentsOfURL:v3];

  return (NSDictionary *)v4;
}

- (Class)iconManager:(id)a3 folderControllerClassForFolderClass:(Class)a4 proposedClass:(Class)a5
{
  return (Class)objc_opt_class();
}

- (int64_t)interfaceOrientationForIconManager:(id)a3
{
  return 1;
}

- (BOOL)isEditingAllowedForIconManager:(id)a3
{
  return 0;
}

- (BOOL)iconManagerCanBeginIconDrags:(id)a3
{
  return 0;
}

- (id)defaultIconStateForIconManager:(id)a3
{
  v3 = objc_opt_class();
  return (id)[v3 defaultIconState];
}

- (NSString)vehicleID
{
  return self->_vehicleID;
}

- (void)setVehicleID:(id)a3
{
}

- (NSArray)allApps
{
  return self->_allApps;
}

- (void)setAllApps:(id)a3
{
}

- (DBIconManager)iconManager
{
  return self->_iconManager;
}

- (void)setIconManager:(id)a3
{
}

- (DBIconModel)iconModel
{
  return self->_iconModel;
}

- (void)setIconModel:(id)a3
{
}

- (DBIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void)setIconImageCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_allApps, 0);
  objc_storeStrong((id *)&self->_vehicleID, 0);
}

@end