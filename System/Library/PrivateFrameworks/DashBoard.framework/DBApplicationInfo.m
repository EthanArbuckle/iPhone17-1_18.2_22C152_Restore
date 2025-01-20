@interface DBApplicationInfo
- (BOOL)isCarInternal;
- (BOOL)isCarPrototype;
- (BOOL)isCertificationApp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstParty;
- (BOOL)isHidden;
- (BOOL)isInstalled;
- (BOOL)isInternal;
- (BOOL)isValid;
- (BOOL)presentsFullScreen;
- (BOOL)requiresBackgroundURLDelivery;
- (BOOL)supportsDashboardNavigation;
- (BOOL)supportsInstrumentClusterNavigation;
- (CRCarPlayAppDeclaration)carPlayDeclaration;
- (NSArray)requiredVehicleAccessories;
- (id)displayName;
- (unint64_t)hash;
- (void)_loadFromRecord:(id)a3;
@end

@implementation DBApplicationInfo

- (void)_loadFromRecord:(id)a3
{
  id v4 = a3;
  if (_loadFromRecord__onceToken != -1) {
    dispatch_once(&_loadFromRecord__onceToken, &__block_literal_global_39);
  }
  v31.receiver = self;
  v31.super_class = (Class)DBApplicationInfo;
  [(DBApplicationInfo *)&v31 _loadFromRecord:v4];
  v5 = [(DBApplicationInfo *)self bundleIdentifier];
  v6 = [v4 infoDictionary];
  v7 = [v6 objectsForKeys:_loadFromRecord____infoKeys];

  v8 = [v4 entitlements];
  v9 = [v8 objectsForKeys:_loadFromRecord____entitlementKeys];

  v10 = [MEMORY[0x263F30E68] declarationForAppRecord:v4];
  carPlayDeclaration = self->_carPlayDeclaration;
  self->_carPlayDeclaration = v10;

  if ((unint64_t)[(DBApplicationInfo *)self type] > 1)
  {
    self->_requiresBackgroundURLDelivery = 0;
  }
  else
  {
    v12 = [v9 objectForKey:@"com.apple.springboard.deliveropenurlusingworkspace" ofClass:objc_opt_class()];
    if ([v12 BOOLValue])
    {
      self->_requiresBackgroundURLDelivery = 1;
    }
    else
    {
      v13 = [v7 objectForKey:@"SBLaunchSuspendedAlways" ofClass:objc_opt_class()];
      self->_requiresBackgroundURLDelivery = [v13 BOOLValue];
    }
  }
  v14 = [v9 objectForKey:@"CARAppHidden" ofClass:objc_opt_class()];
  self->_hidden = [v14 BOOLValue];

  v15 = [v9 objectForKey:@"CARAppInternal" ofClass:objc_opt_class()];
  self->_carInternal = [v15 BOOLValue];

  v16 = [v9 objectForKey:@"CARAppPrototype" ofClass:objc_opt_class()];
  self->_carPrototype = [v16 BOOLValue];

  v17 = [v9 objectForKey:@"CARAppFullScreen" ofClass:objc_opt_class()];
  self->_presentsFullScreen = [v17 BOOLValue];

  v18 = [v9 objectForKey:@"CARAppCertification" ofClass:objc_opt_class()];
  self->_certificationApp = [v18 BOOLValue];

  uint64_t v19 = objc_opt_class();
  v20 = [v9 objectForKey:@"com.apple.private.RequiredVehicleAccessories" ofClass:v19 valuesOfClass:objc_opt_class()];
  requiredVehicleAccessories = self->_requiredVehicleAccessories;
  self->_requiredVehicleAccessories = v20;

  objc_msgSend(v4, "db_localizedCarName");
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  carDisplayName = self->_carDisplayName;
  self->_carDisplayName = v22;

  v24 = [v4 applicationState];
  self->_valid = [v24 isValid];

  v25 = [v4 applicationState];
  self->_installed = [v25 isInstalled];

  v26 = [v7 objectForKey:@"UIApplicationSceneManifest" ofClass:objc_opt_class()];
  v27 = [v26 objectForKey:@"CPSupportsDashboardNavigationScene"];
  if ([v27 BOOLValue] & 1) != 0 || (objc_msgSend(v4, "supportsCarPlayDashboardScene")) {
    char v28 = 1;
  }
  else {
    char v28 = [v5 isEqualToString:@"com.apple.Maps"];
  }
  self->_supportsDashboardNavigation = v28;

  v29 = [v26 objectForKey:@"CPSupportsInstrumentClusterNavigationScene"];
  if ([v29 BOOLValue] & 1) != 0 || (objc_msgSend(v4, "supportsCarPlayInstrumentClusterScene")) {
    char v30 = 1;
  }
  else {
    char v30 = [v5 isEqualToString:@"com.apple.Maps"];
  }
  self->_supportsInstrumentClusterNavigation = v30;
}

void __37__DBApplicationInfo__loadFromRecord___block_invoke()
{
  v8[7] = *MEMORY[0x263EF8340];
  v0 = objc_opt_new();
  [v0 addObject:@"SBLaunchSuspendedAlways"];
  [v0 addObject:@"UIApplicationSceneManifest"];
  v1 = [MEMORY[0x263F30E68] requiredInfoKeys];
  [v0 unionSet:v1];

  uint64_t v2 = [v0 copy];
  v3 = (void *)_loadFromRecord____infoKeys;
  _loadFromRecord____infoKeys = v2;

  id v4 = objc_opt_new();
  v8[0] = @"CARAppFullScreen";
  v8[1] = @"CARAppCertification";
  v8[2] = @"CARAppInternal";
  v8[3] = @"CARAppHidden";
  v8[4] = @"CARAppPrototype";
  v8[5] = @"com.apple.private.RequiredVehicleAccessories";
  v8[6] = @"com.apple.springboard.deliveropenurlusingworkspace";
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:7];
  [v4 addObjectsFromArray:v5];

  v6 = [MEMORY[0x263F30E68] requiredEntitlementKeys];
  [v4 unionSet:v6];

  v7 = (void *)_loadFromRecord____entitlementKeys;
  _loadFromRecord____entitlementKeys = (uint64_t)v4;
}

- (BOOL)isInternal
{
  return [(DBApplicationInfo *)self type] == 0;
}

- (BOOL)isFirstParty
{
  return (unint64_t)[(DBApplicationInfo *)self type] < 2;
}

- (id)displayName
{
  carDisplayName = self->_carDisplayName;
  if (carDisplayName)
  {
    v3 = carDisplayName;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DBApplicationInfo;
    v3 = [(DBApplicationInfo *)&v5 displayName];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v2 = [(DBApplicationInfo *)self bundleIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v5 = [(DBApplicationInfo *)self bundleIdentifier];
    v6 = [v4 bundleIdentifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (CRCarPlayAppDeclaration)carPlayDeclaration
{
  return self->_carPlayDeclaration;
}

- (BOOL)presentsFullScreen
{
  return self->_presentsFullScreen;
}

- (BOOL)supportsDashboardNavigation
{
  return self->_supportsDashboardNavigation;
}

- (BOOL)supportsInstrumentClusterNavigation
{
  return self->_supportsInstrumentClusterNavigation;
}

- (BOOL)requiresBackgroundURLDelivery
{
  return self->_requiresBackgroundURLDelivery;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isCarInternal
{
  return self->_carInternal;
}

- (BOOL)isCarPrototype
{
  return self->_carPrototype;
}

- (BOOL)isInstalled
{
  return self->_installed;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (BOOL)isCertificationApp
{
  return self->_certificationApp;
}

- (NSArray)requiredVehicleAccessories
{
  return self->_requiredVehicleAccessories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredVehicleAccessories, 0);
  objc_storeStrong((id *)&self->_carPlayDeclaration, 0);
  objc_storeStrong((id *)&self->_carDisplayName, 0);
}

@end