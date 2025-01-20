@interface HDMenstrualCyclesPlugin
+ (BOOL)shouldLoadPluginForDaemon:(id)a3;
- (HDMenstrualCyclesPlugin)init;
- (HDMenstrualCyclesPlugin)initWithLocalUserDefaults:(id)a3;
- (NSString)pluginIdentifier;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)stateSyncEntityClasses;
- (id)taskServerClasses;
- (void)handleDatabaseObliteration;
@end

@implementation HDMenstrualCyclesPlugin

- (HDMenstrualCyclesPlugin)init
{
  v3 = objc_msgSend(MEMORY[0x263EFFA40], "hkmc_menstrualCyclesDefaults");
  v4 = [(HDMenstrualCyclesPlugin *)self initWithLocalUserDefaults:v3];

  return v4;
}

- (HDMenstrualCyclesPlugin)initWithLocalUserDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDMenstrualCyclesPlugin;
  v6 = [(HDMenstrualCyclesPlugin *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
  }

  return v7;
}

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F450C8];
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  v3 = [a3 behavior];
  char v4 = [v3 isRealityDevice];

  return v4 ^ 1;
}

- (id)extensionForProfile:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [HDMCProfileExtension alloc];
    v6 = (void *)[objc_alloc(MEMORY[0x263F451E0]) initWithUserDefaults:self->_userDefaults];
    v7 = [(HDMCProfileExtension *)v5 initWithProfile:v4 settingsManager:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (void)handleDatabaseObliteration
{
  v4[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA40];
  v4[0] = *MEMORY[0x263F44FE8];
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  objc_msgSend(v2, "hk_deleteDomainsNamed:", v3);
}

- (id)taskServerClasses
{
  v4[7] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  void v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:7];
  return v2;
}

- (id)stateSyncEntityClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (void).cxx_destruct
{
}

@end