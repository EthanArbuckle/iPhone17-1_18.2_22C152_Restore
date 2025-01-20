@interface AUDeveloperSettingsOverrideController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateDescriptionForSpecifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation AUDeveloperSettingsOverrideController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AUDeveloperSettingsOverrideController;
  [(AUDeveloperSettingsOverrideController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"CUSTOMER_STAGING_OVERRIDE" value:&stru_26DCD2B00 table:@"AUDeveloperSettings"];
  [(AUDeveloperSettingsOverrideController *)self setTitle:v4];
}

- (id)specifiers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = *(Class *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (v3)
  {
    id v4 = v3;
    goto LABEL_14;
  }
  uint64_t v31 = (int)*MEMORY[0x263F5FDB8];
  objc_super v5 = [(AUDeveloperSettingsOverrideController *)v2 loadSpecifiersFromPlistName:@"AUDeveloperSettingsOverride" target:v2];
  uint64_t v6 = [v5 specifierForID:@"SELECT_LOCATION"];
  locationRadioGroup = v2->_locationRadioGroup;
  v2->_locationRadioGroup = (PSSpecifier *)v6;

  uint64_t v8 = [v5 specifierForID:@"CUSTOMER"];
  p_customerSpecifier = &v2->_customerSpecifier;
  customerSpecifier = v2->_customerSpecifier;
  v2->_customerSpecifier = (PSSpecifier *)v8;

  uint64_t v11 = [v5 specifierForID:@"PUBLIC_SEED"];
  publicSeedSpecifier = v2->_publicSeedSpecifier;
  v2->_publicSeedSpecifier = (PSSpecifier *)v11;

  uint64_t v13 = [v5 specifierForID:@"CUSTOMER_STAGING"];
  customerStagingSpecifier = v2->_customerStagingSpecifier;
  v2->_customerStagingSpecifier = (PSSpecifier *)v13;

  uint64_t v15 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  descriptionSpecifier = v2->_descriptionSpecifier;
  v2->_descriptionSpecifier = (PSSpecifier *)v15;

  v17 = [(AUDeveloperSettingsOverrideController *)v2 specifier];
  v18 = [v17 identifier];
  v19 = getInfoForAccessory(v18);
  v20 = (void *)[v19 mutableCopy];

  v21 = [v20 objectForKeyedSubscript:@"fusing"];
  if (AUDeveloperSettingsAccessoryFusingStringToType(v21) == 1)
  {
    v22 = [v20 objectForKeyedSubscript:@"assetLocation"];
    uint64_t v23 = AUDeveloperSettingsURLStringToType(v22);
    switch(v23)
    {
      case 2:
        [(PSSpecifier *)v2->_locationRadioGroup setProperty:*p_customerSpecifier forKey:*MEMORY[0x263F60200]];
        break;
      case 3:
        [(PSSpecifier *)v2->_locationRadioGroup setProperty:v2->_publicSeedSpecifier forKey:*MEMORY[0x263F60200]];
        p_customerSpecifier = &v2->_publicSeedSpecifier;
        break;
      case 6:
        [(PSSpecifier *)v2->_locationRadioGroup setProperty:v2->_customerStagingSpecifier forKey:*MEMORY[0x263F60200]];
        p_customerSpecifier = &v2->_customerStagingSpecifier;
        break;
      default:
        [(PSSpecifier *)v2->_locationRadioGroup setProperty:*p_customerSpecifier forKey:*MEMORY[0x263F60200]];
        v24 = [NSString stringWithUTF8String:AUDeveloperSettingsURLTypeToString(2uLL)];
        [v20 setObject:v24 forKeyedSubscript:@"assetLocation"];

        v25 = +[AUDeveloperSettingsDatabase sharedDatabase];
        v26 = [(AUDeveloperSettingsOverrideController *)v2 specifier];
        v27 = [v26 identifier];
        [v25 addAccessoryWithSerialNumber:v27 info:v20];

        id WeakRetained = objc_loadWeakRetained((id *)((char *)&v2->super.super.super.super.super.isa
                                                  + (int)*MEMORY[0x263F5FE78]));
        [WeakRetained reloadSpecifier:*(Class *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98])];

        goto LABEL_12;
    }
    [(AUDeveloperSettingsOverrideController *)v2 updateDescriptionForSpecifier:*p_customerSpecifier];
LABEL_12:
  }
  [v5 addObject:v2->_descriptionSpecifier];
  v29 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
  [(AUDeveloperSettingsOverrideController *)v2 setSpecifiers:v29];

  id v4 = *(id *)((char *)&v2->super.super.super.super.super.isa + v31);
LABEL_14:
  objc_sync_exit(v2);

  return v4;
}

- (void)updateDescriptionForSpecifier:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F602D0];
  id v5 = a3;
  id v14 = [v5 propertyForKey:v4];
  uint64_t v6 = [v5 propertyForKey:@"description"];
  v7 = [v5 propertyForKey:@"assetURL"];

  uint64_t v8 = [(AUDeveloperSettingsOverrideController *)self specifier];
  v9 = [v8 identifier];
  v10 = getInfoForAccessory(v9);

  uint64_t v11 = [v10 objectForKeyedSubscript:@"assetURLOverride"];

  if (v11)
  {
    v12 = [v10 objectForKeyedSubscript:@"assetURLOverride"];
    uint64_t v13 = [v14 stringByAppendingFormat:@" :\nProfile Asset URL Override\n\nThis resolves to a URL that looks like this :\n%@", v12];
  }
  else
  {
    uint64_t v13 = [NSString stringWithFormat:@"%@ :\n%@\n\nThis resolves to a URL that looks like this :\n%@", v14, v6, v7];
  }
  [(PSSpecifier *)self->_descriptionSpecifier setProperty:v13 forKey:*MEMORY[0x263F600F8]];
  [(AUDeveloperSettingsOverrideController *)self reloadSpecifier:self->_descriptionSpecifier];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AUDeveloperSettingsOverrideController *)self indexForIndexPath:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = [(AUDeveloperSettingsOverrideController *)self specifierAtIndex:v8];
    if (!v9)
    {
LABEL_11:

      goto LABEL_12;
    }
    [(AUDeveloperSettingsOverrideController *)self updateDescriptionForSpecifier:v9];
    v10 = [(AUDeveloperSettingsOverrideController *)self specifier];
    uint64_t v11 = [v10 identifier];
    uint64_t v12 = getInfoForAccessory(v11);
    uint64_t v13 = (void *)[(id)v12 mutableCopy];

    uint64_t v14 = *MEMORY[0x263F60138];
    uint64_t v15 = [v9 propertyForKey:*MEMORY[0x263F60138]];
    LOBYTE(v12) = [v15 isEqual:@"CUSTOMER"];

    if (v12)
    {
      unint64_t v16 = 2;
    }
    else
    {
      v17 = [v9 propertyForKey:v14];
      char v18 = [v17 isEqual:@"PUBLIC_SEED"];

      if (v18)
      {
        unint64_t v16 = 3;
      }
      else
      {
        v19 = [v9 propertyForKey:v14];
        int v20 = [v19 isEqual:@"CUSTOMER_STAGING"];

        if (!v20)
        {
LABEL_10:
          v22 = +[AUDeveloperSettingsDatabase sharedDatabase];
          uint64_t v23 = [(AUDeveloperSettingsOverrideController *)self specifier];
          v24 = [v23 identifier];
          [v22 addAccessoryWithSerialNumber:v24 info:v13];

          id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                                    + (int)*MEMORY[0x263F5FE78]));
          [WeakRetained reloadSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98])];

          v26.receiver = self;
          v26.super_class = (Class)AUDeveloperSettingsOverrideController;
          [(AUDeveloperSettingsOverrideController *)&v26 tableView:v6 didSelectRowAtIndexPath:v7];

          goto LABEL_11;
        }
        unint64_t v16 = 6;
      }
    }
    v21 = [NSString stringWithUTF8String:AUDeveloperSettingsURLTypeToString(v16)];
    [v13 setObject:v21 forKeyedSubscript:@"assetLocation"];

    [(PSSpecifier *)self->_locationRadioGroup setProperty:v9 forKey:*MEMORY[0x263F60200]];
    [(AUDeveloperSettingsOverrideController *)self reloadSpecifier:self->_locationRadioGroup animated:1];
    goto LABEL_10;
  }
LABEL_12:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionSpecifier, 0);
  objc_storeStrong((id *)&self->_customerStagingSpecifier, 0);
  objc_storeStrong((id *)&self->_publicSeedSpecifier, 0);
  objc_storeStrong((id *)&self->_customerSpecifier, 0);
  objc_storeStrong((id *)&self->_locationRadioGroup, 0);
}

@end