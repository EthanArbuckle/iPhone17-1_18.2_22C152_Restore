@interface MCUISpecifierProvider
- (BOOL)isSectionPopulated:(id)a3 outIsPlural:(BOOL *)a4;
- (MCUISpecifierProvider)initWithDelegate:(id)a3;
- (MCUISpecifierProviderDelegate)delegate;
- (id)_specifierForProfile:(id)a3 profileInstalled:(BOOL)a4;
- (id)_specifiersForProfiles:(id)a3 singularHeader:(id)a4 pluralHeaader:(id)a5 profilesInstalled:(BOOL)a6;
- (id)specifierWithName:(id)a3 detail:(Class)a4;
- (id)specifiersForInstalledProfiles:(id)a3;
- (id)specifiersForMDMProfiles:(id)a3;
- (id)specifiersForUninstalledProfiles:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MCUISpecifierProvider

- (MCUISpecifierProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MCUISpecifierProvider;
  v5 = [(MCUISpecifierProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (BOOL)isSectionPopulated:(id)a3 outIsPlural:(BOOL *)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5 && [v5 count])
  {
    *a4 = (unint64_t)[v6 count] > 1;
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)specifierWithName:(id)a3 detail:(Class)a4
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:a3 target:self set:0 get:0 detail:a4 cell:1 edit:0];
  v8[0] = *MEMORY[0x1E4F930A8];
  v9[0] = objc_opt_class();
  v8[1] = *MEMORY[0x1E4F93190];
  id v5 = [MEMORY[0x1E4F5E658] gearIcon];
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v4 setProperties:v6];

  return v4;
}

- (id)_specifierForProfile:(id)a3 profileInstalled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [v6 identifier];
  objc_super v8 = [(MCUISpecifierProvider *)self specifierWithName:v7 detail:objc_opt_class()];

  v9 = [v6 friendlyName];
  [v8 setProperty:v9 forKey:*MEMORY[0x1E4F93240]];

  v10 = [v6 organization];
  [v8 setProperty:v10 forKey:*MEMORY[0x1E4F93230]];

  [v8 setProperty:v6 forKey:@"MCUIPSItemKey"];
  v11 = [NSNumber numberWithBool:v4];
  [v8 setProperty:v11 forKey:@"MCUIPSInstalledKey"];

  v12 = [v6 expiryDate];
  if (v12)
  {
    v13 = [v6 expiryDate];
    uint64_t v14 = [v13 DMCProfilePastExpiration];
  }
  else
  {
    uint64_t v14 = 0;
  }

  v15 = [NSNumber numberWithBool:v14];
  [v8 setProperty:v15 forKey:@"MCUIPSExpiredKey"];

  [v8 setControllerLoadAction:sel_loadProfileFromSpecifier_];
  return v8;
}

- (id)_specifiersForProfiles:(id)a3 singularHeader:(id)a4 pluralHeaader:(id)a5 profilesInstalled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v28 = 0;
  if ([(MCUISpecifierProvider *)self isSectionPopulated:v10 outIsPlural:&v28])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count") + 1);
    id v23 = v11;
    if (v28) {
      id v14 = v12;
    }
    else {
      id v14 = v11;
    }
    v15 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:v14];
    [v13 addObject:v15];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = v10;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [(MCUISpecifierProvider *)self _specifierForProfile:*(void *)(*((void *)&v24 + 1) + 8 * i) profileInstalled:v6];
          [v13 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v18);
    }

    id v11 = v23;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)specifiersForMDMProfiles:(id)a3
{
  id v4 = a3;
  id v5 = MCUILocalizedString(@"MOBILE_DEVICE_MANAGEMENT");
  BOOL v6 = MCUILocalizedString(@"MOBILE_DEVICE_MANAGEMENT");
  BOOL v7 = [(MCUISpecifierProvider *)self _specifiersForProfiles:v4 singularHeader:v5 pluralHeaader:v6 profilesInstalled:1];

  return v7;
}

- (id)specifiersForUninstalledProfiles:(id)a3
{
  id v4 = a3;
  id v5 = MCUILocalizedString(@"UNINSTALLED_PROFILE");
  BOOL v6 = MCUILocalizedString(@"UNINSTALLED_PROFILE_PLURAL");
  BOOL v7 = [(MCUISpecifierProvider *)self _specifiersForProfiles:v4 singularHeader:v5 pluralHeaader:v6 profilesInstalled:0];

  return v7;
}

- (id)specifiersForInstalledProfiles:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    BOOL v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_5];
    uint64_t v7 = [v5 filteredArrayUsingPredicate:v6];

    id v5 = (void *)v7;
  }
  objc_super v8 = MCUILocalizedString(@"CONFIGURATION_PROFILE");
  v9 = MCUILocalizedString(@"CONFIGURATION_PROFILE_PLURAL");
  id v10 = [(MCUISpecifierProvider *)self _specifiersForProfiles:v5 singularHeader:v8 pluralHeaader:v9 profilesInstalled:1];

  return v10;
}

uint64_t __56__MCUISpecifierProvider_specifiersForInstalledProfiles___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInstalledByDeclarativeManagement] ^ 1;
}

- (MCUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MCUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end