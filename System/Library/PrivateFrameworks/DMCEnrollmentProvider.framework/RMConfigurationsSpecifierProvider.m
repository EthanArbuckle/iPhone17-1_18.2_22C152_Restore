@interface RMConfigurationsSpecifierProvider
- (NSMutableArray)sectionTitles;
- (NSMutableArray)sectionedSpecifiers;
- (RMConfigurationsDataProvider)rmDataProvider;
- (RMConfigurationsSpecifierProvider)initWithAccount:(id)a3 rmDataProvider:(id)a4;
- (id)_iconForSymbol:(signed __int16)a3;
- (id)_isActivatedProfileText:(id)a3;
- (id)_pluginSpecifiers;
- (id)_profileSpecifiers;
- (id)specifiers;
- (id)specifiersReloadedNotificationName;
- (id)tableSectionCellsForSpecifiersInTableView:(id)a3;
- (void)setRmDataProvider:(id)a3;
- (void)setSectionTitles:(id)a3;
- (void)setSectionedSpecifiers:(id)a3;
@end

@implementation RMConfigurationsSpecifierProvider

- (RMConfigurationsSpecifierProvider)initWithAccount:(id)a3 rmDataProvider:(id)a4
{
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F63730];
  v16.receiver = self;
  v16.super_class = (Class)RMConfigurationsSpecifierProvider;
  v9 = [(DMCSpecifierProvider *)&v16 initWithAccount:a3 reloadNotification:v8 isLocalNotification:0 reloadIfMissingRMAccount:1];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rmDataProvider, a4);
    uint64_t v11 = objc_opt_new();
    sectionTitles = v10->_sectionTitles;
    v10->_sectionTitles = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    sectionedSpecifiers = v10->_sectionedSpecifiers;
    v10->_sectionedSpecifiers = (NSMutableArray *)v13;
  }
  return v10;
}

- (id)specifiersReloadedNotificationName
{
  return @"RMConfigurationsSpecifiersDidChangeNotification";
}

- (id)specifiers
{
  v14.receiver = self;
  v14.super_class = (Class)RMConfigurationsSpecifierProvider;
  v3 = [(DMCSpecifierProvider *)&v14 specifiers];

  if (v3)
  {
    v13.receiver = self;
    v13.super_class = (Class)RMConfigurationsSpecifierProvider;
    v4 = [(DMCSpecifierProvider *)&v13 specifiers];
  }
  else
  {
    v5 = objc_opt_new();
    v6 = (NSMutableArray *)objc_opt_new();
    sectionTitles = self->_sectionTitles;
    self->_sectionTitles = v6;

    uint64_t v8 = (NSMutableArray *)objc_opt_new();
    sectionedSpecifiers = self->_sectionedSpecifiers;
    self->_sectionedSpecifiers = v8;

    v10 = [(RMConfigurationsSpecifierProvider *)self _profileSpecifiers];
    [v5 addObjectsFromArray:v10];

    uint64_t v11 = [(RMConfigurationsSpecifierProvider *)self _pluginSpecifiers];
    [v5 addObjectsFromArray:v11];

    v4 = [(DMCSpecifierProvider *)self cachedSpecifiers:v5];
  }
  return v4;
}

- (id)tableSectionCellsForSpecifiersInTableView:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(RMConfigurationsSpecifierProvider *)self specifiers];

  if (v5)
  {
    id v20 = (id)objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = [(RMConfigurationsSpecifierProvider *)self sectionedSpecifiers];
    uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v10 = objc_opt_new();
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v11 = v9;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v22;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v22 != v14) {
                  objc_enumerationMutation(v11);
                }
                objc_super v16 = [(DMCSpecifierProvider *)self cellForSpecifier:*(void *)(*((void *)&v21 + 1) + 8 * j) inTableView:v4];
                [v10 addObject:v16];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v13);
          }

          [v20 addObject:v10];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v20 = (id)MEMORY[0x263EFFA68];
  }

  return v20;
}

- (id)_profileSpecifiers
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v3 = [(RMConfigurationsSpecifierProvider *)self rmDataProvider];
  id v4 = [v3 profileViewModels];

  if ([v4 count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v23 = v4;
    obuint64_t j = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      uint64_t v24 = *MEMORY[0x263F60140];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          int v11 = [v10 isInteractiveProfile];
          uint64_t v12 = objc_opt_class();
          if (v11) {
            uint64_t v13 = sel__isActivatedProfileText_;
          }
          else {
            uint64_t v13 = 0;
          }
          uint64_t v14 = (void *)MEMORY[0x263F5FC40];
          v15 = [v10 title];
          objc_super v16 = [v14 preferenceSpecifierNamed:v15 target:self set:0 get:v13 detail:v12 cell:2 edit:0];

          if ([v10 symbol] == 1)
          {
            v17 = +[DMCIconFactory gearIcon];
            [v16 setProperty:v17 forKey:v24];
          }
          v30[0] = @"RMConfigurationViewModelKey";
          v30[1] = @"RMConfigurationDataProviderKey";
          v31[0] = v10;
          v18 = [(RMConfigurationsSpecifierProvider *)self rmDataProvider];
          v31[1] = v18;
          uint64_t v19 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
          [v16 setUserInfo:v19];

          [v5 addObject:v16];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v7);
    }

    sectionTitles = self->_sectionTitles;
    long long v21 = DMCEnrollmentLocalizedString(@"DMC_CONFIGURATIONS_SECTION_PROFILES");
    [(NSMutableArray *)sectionTitles addObject:v21];

    [(NSMutableArray *)self->_sectionedSpecifiers addObject:v5];
    id v4 = v23;
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (id)_pluginSpecifiers
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = [(RMConfigurationsSpecifierProvider *)self rmDataProvider];
  id v4 = [v3 pluginSectionViewModels];

  if ([v4 count])
  {
    id v29 = (id)objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v26 = v4;
    obuint64_t j = v4;
    uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v30)
    {
      uint64_t v28 = *(void *)v38;
      uint64_t v5 = *MEMORY[0x263F60140];
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v38 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = v6;
          uint64_t v7 = *(void **)(*((void *)&v37 + 1) + 8 * v6);
          uint64_t v8 = (void *)MEMORY[0x263EFF980];
          v9 = [v7 viewModels];
          v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          uint64_t v31 = v7;
          int v11 = [v7 viewModels];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v34 != v14) {
                  objc_enumerationMutation(v11);
                }
                objc_super v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                v17 = (void *)MEMORY[0x263F5FC40];
                v18 = [v16 title];
                uint64_t v19 = [v17 preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

                id v20 = -[RMConfigurationsSpecifierProvider _iconForSymbol:](self, "_iconForSymbol:", [v16 symbol]);
                [v19 setProperty:v20 forKey:v5];

                v41[0] = @"RMConfigurationViewModelKey";
                v41[1] = @"RMConfigurationDataProviderKey";
                v42[0] = v16;
                long long v21 = [(RMConfigurationsSpecifierProvider *)self rmDataProvider];
                v42[1] = v21;
                long long v22 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
                [v19 setUserInfo:v22];

                [v10 addObject:v19];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v43 count:16];
            }
            while (v13);
          }

          [v29 addObjectsFromArray:v10];
          sectionTitles = self->_sectionTitles;
          uint64_t v24 = [v31 heading];
          [(NSMutableArray *)sectionTitles addObject:v24];

          [(NSMutableArray *)self->_sectionedSpecifiers addObject:v10];
          uint64_t v6 = v32 + 1;
        }
        while (v32 + 1 != v30);
        uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
      }
      while (v30);
    }

    id v4 = v26;
  }
  else
  {
    id v29 = (id)MEMORY[0x263EFFA68];
  }

  return v29;
}

- (id)_isActivatedProfileText:(id)a3
{
  v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"RMConfigurationViewModelKey"];
  uint64_t v5 = [v4 value];

  return v5;
}

- (id)_iconForSymbol:(signed __int16)a3
{
  switch(a3)
  {
    case 2:
      v3 = +[DMCIconFactory keyIcon];
      break;
    case 3:
      v3 = +[DMCIconFactory accountIcon];
      break;
    case 4:
      v3 = +[DMCIconFactory appIcon];
      break;
    default:
      v3 = +[DMCIconFactory gearIcon];
      break;
  }
  return v3;
}

- (NSMutableArray)sectionTitles
{
  return self->_sectionTitles;
}

- (void)setSectionTitles:(id)a3
{
}

- (NSMutableArray)sectionedSpecifiers
{
  return self->_sectionedSpecifiers;
}

- (void)setSectionedSpecifiers:(id)a3
{
}

- (RMConfigurationsDataProvider)rmDataProvider
{
  return self->_rmDataProvider;
}

- (void)setRmDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rmDataProvider, 0);
  objc_storeStrong((id *)&self->_sectionedSpecifiers, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
}

@end