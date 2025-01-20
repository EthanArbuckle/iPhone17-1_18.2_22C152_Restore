@interface FATopLevelSettingsSpecifierProvider
- (id)_familyBaseSpecifierWithState:(unint64_t)a3;
- (id)_familySpecifier;
- (id)specifiers;
- (unint64_t)cachePolicy;
@end

@implementation FATopLevelSettingsSpecifierProvider

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([MEMORY[0x263F25820] isMultiUserMode])
  {
    v4 = _FALogSystem();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    __int16 v11 = 0;
    v5 = "Device is in multi-user mode, not showing top level Family specifiers.";
    v6 = (uint8_t *)&v11;
LABEL_9:
    _os_log_impl(&dword_2189F0000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    goto LABEL_10;
  }
  v7 = [(FASettingsSpecifierProvider *)self _appleAccount];

  if (!v7)
  {
    v4 = _FALogSystem();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    __int16 v10 = 0;
    v5 = "User not signed in to AppleAccount, not showing top level Family specifiers.";
    v6 = (uint8_t *)&v10;
    goto LABEL_9;
  }
  v4 = [(FATopLevelSettingsSpecifierProvider *)self _familySpecifier];
  if (v4) {
    [v3 addObject:v4];
  }
LABEL_10:

  v8 = (void *)[v3 copy];
  [(FASettingsSpecifierProvider *)self setSpecifiers:v8];

  return v8;
}

- (id)_familySpecifier
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v4 = [v3 integerForKey:0];

  BOOL v5 = v4 && !self->super._familyCircle && !self->super._didFailToGetFamilyDetails;
  v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "Using cache - %d with state - %lu", (uint8_t *)v9, 0x12u);
  }

  if (self->super._familyCircle || self->super._didFailToGetFamilyDetails)
  {
    if (v5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  [(FASettingsSpecifierProvider *)self _loadFamilyDetailsWithCompletion:0];
  if (!v5) {
LABEL_10:
  }
    uint64_t v4 = [(FASettingsSpecifierProvider *)self _familyState];
LABEL_11:
  v7 = [(FATopLevelSettingsSpecifierProvider *)self _familyBaseSpecifierWithState:v4];
  [v7 setControllerLoadAction:sel__viewFamilySpecifierWasTapped_];
  [v7 setIdentifier:0];
  return v7;
}

- (id)_familyBaseSpecifierWithState:(unint64_t)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F827E8];
  BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v4 imageNamed:@"family" inBundle:v5];

  v7 = (void *)MEMORY[0x263F5FC40];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"FAMILY_TOP_LEVEL_CELL_LABEL" value:&stru_26CA2C800 table:@"Localizable"];
  __int16 v10 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:2 edit:0];

  [v10 setProperty:v6 forKey:*MEMORY[0x263F60140]];
  return v10;
}

- (unint64_t)cachePolicy
{
  return 1;
}

@end