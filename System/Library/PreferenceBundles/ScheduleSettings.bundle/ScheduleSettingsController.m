@interface ScheduleSettingsController
- (BOOL)isExcludedAccountType:(id)a3;
- (ScheduleSettingsController)init;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_makeMCCSpecifiers;
- (id)_mccSchedule:(id)a3;
- (id)_specifierForMCCAccount:(id)a3 dataclasses:(id)a4 canPush:(BOOL)a5 canFetch:(BOOL)a6 canManual:(BOOL)a7;
- (id)_specifiersForMCCAccount:(id)a3;
- (id)initForContentSize:(CGSize)a3;
- (id)pushEnabled:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int)styleForAccount:(id)a3 uniqueIdentifier:(id)a4;
- (void)_lowPowerModeChangedNotification:(id)a3;
- (void)_readScheduleSettings;
- (void)_setMCCSchedule:(id)a3 specifier:(id)a4;
- (void)configureFetchDividerCell:(id)a3 atIndexPath:(id)a4;
- (void)dealloc;
- (void)listItemSelected:(id)a3;
- (void)setPollInterval:(id)a3 specifier:(id)a4;
- (void)setPushEnabled:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateRadioGroupText;
@end

@implementation ScheduleSettingsController

- (id)initForContentSize:(CGSize)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ScheduleSettingsController;
  v3 = [(ScheduleSettingsController *)&v6 init];
  if (v3)
  {
    v3->_accountStore = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
    v3->_isLowPowerMode = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AB0], "processInfo"), "isLowPowerModeEnabled");
    v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel__lowPowerModeChangedNotification_ name:*MEMORY[0x263F08450] object:0];
  }
  return v3;
}

- (ScheduleSettingsController)init
{
  return (ScheduleSettingsController *)-[ScheduleSettingsController initForContentSize:](self, "initForContentSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)ScheduleSettingsController;
  [(ScheduleSettingsController *)&v3 dealloc];
}

- (void)_lowPowerModeChangedNotification:(id)a3
{
  self->_isLowPowerMode = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AB0], "processInfo", a3), "isLowPowerModeEnabled");
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__ScheduleSettingsController__lowPowerModeChangedNotification___block_invoke;
  block[3] = &unk_26486FF20;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __63__ScheduleSettingsController__lowPowerModeChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  v5 = (uint64_t *)MEMORY[0x263F600A8];
  if (!v4)
  {
    objc_super v6 = (objc_class *)(id)[(ScheduleSettingsController *)self loadSpecifiersFromPlistName:@"ScheduleSettings" target:self];
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v6;
    if (self->_isLowPowerMode)
    {
      objc_msgSend((id)-[objc_class specifierForID:](v6, "specifierForID:", @"ENABLE_PUSH"), "setProperty:forKey:", &unk_26DDE72A0, *v5);
      v7 = @"LPM_PUSH";
    }
    else
    {
      v7 = @"ENABLE_PUSH_TEXT";
    }
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v7, &stru_26DDE6728, @"ScheduleSettings");
    v9 = (void *)[*(id *)((char *)&self->super.super.super.super.super.isa + v3) specifierForID:@"pushSwitchGroup"];
    uint64_t v10 = *MEMORY[0x263F600F8];
    [v9 setProperty:v8 forKey:*MEMORY[0x263F600F8]];
    LODWORD(v8) = [v8 _isNaturallyRTL];
    v11 = (void *)[*(id *)((char *)&self->super.super.super.super.super.isa + v3) specifierForID:@"pushSwitchGroup"];
    if (v8) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = [NSNumber numberWithInt:v12];
    uint64_t v14 = *MEMORY[0x263F600B8];
    [v11 setProperty:v13 forKey:*MEMORY[0x263F600B8]];
    v15 = (void *)[*(id *)((char *)&self->super.super.super.super.super.isa + v3) specifierForID:@"fetchGroup"];
    objc_msgSend(v15, "setProperty:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"WHEN_NOT_PUSHING_TEXT", &stru_26DDE6728, @"ScheduleSettings"), v10);
    v16 = (void *)[*(id *)((char *)&self->super.super.super.super.super.isa + v3) specifierForID:@"fetchGroup"];
    objc_msgSend(v16, "setProperty:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v12), v14);
    v17 = (void *)[*(id *)((char *)&self->super.super.super.super.super.isa + v3) specifierForID:@"fetchGroup"];
    uint64_t v18 = [NSNumber numberWithInt:v12];
    [v17 setProperty:v18 forKey:*MEMORY[0x263F5FEF0]];
    v19 = (void *)[*(id *)((char *)&self->super.super.super.super.super.isa + v3) mutableCopy];
    uint64_t v20 = objc_msgSend(v19, "indexOfObject:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", @"accountsGroup"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v21 = objc_msgSend(-[ScheduleSettingsController _makeMCCSpecifiers](self, "_makeMCCSpecifiers"), "reverseObjectEnumerator");
    uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = v20 + 1;
      uint64_t v25 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(v21);
          }
          [v19 insertObject:*(void *)(*((void *)&v32 + 1) + 8 * i) atIndex:v24];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v23);
    }

    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v19;
    if (([(ScheduleSettingsController *)self getGroup:&self->_radioGroup row:0 ofSpecifierID:@"radioGroup"] & 1) == 0)NSLog(&cfstr_UnableToFindPo.isa); {
    [(ScheduleSettingsController *)self _readScheduleSettings];
    }
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    v5 = (uint64_t *)MEMORY[0x263F600A8];
    if (self->_isLowPowerMode)
    {
      v27 = (void *)[*(id *)((char *)&self->super.super.super.super.super.isa + v3) specifierForID:@"15_MINUTES"];
      uint64_t v28 = *v5;
      uint64_t v29 = MEMORY[0x263EFFA80];
      [v27 setProperty:MEMORY[0x263EFFA80] forKey:*v5];
      objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", @"30_MINUTES"), "setProperty:forKey:", v29, v28);
      objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", @"60_MINUTES"), "setProperty:forKey:", v29, v28);
      objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", @"AUTOMATICALLY"), "setProperty:forKey:", v29, v28);
      objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "specifierForID:", @"MANUALLY"), "setProperty:forKey:", v29, v28);
      v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    }
  }
  self->_fetchDividerRow = objc_msgSend(v4, "indexOfObject:", objc_msgSend(v4, "specifierForID:", @"FETCH_DIVIDER"));
  v30 = (void *)[*(id *)((char *)&self->super.super.super.super.super.isa + v3) specifierForID:@"FETCH_DIVIDER"];
  [v30 setProperty:MEMORY[0x263EFFA80] forKey:*v5];
  return *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
}

- (id)_makeMCCSpecifiers
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = (void *)[(ACAccountStore *)self->_accountStore allAccountTypes];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v5;
  uint64_t v18 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if (![(ScheduleSettingsController *)self isExcludedAccountType:v7])
        {
          v8 = [(ACAccountStore *)self->_accountStore accountsWithAccountType:v7];
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v20 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * j);
                id v14 = [(ScheduleSettingsController *)self _specifiersForMCCAccount:v13];
                if ([v14 count])
                {
                  [v3 addObjectsFromArray:v14];
                  objc_msgSend(v4, "addObject:", objc_msgSend(v13, "identifier"));
                }
              }
              uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v10);
          }
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }
  [v4 addObject:*MEMORY[0x263F5D438]];
  PCSettingsPurgeDictionariesExceptForCurrent();

  return v3;
}

- (BOOL)isExcludedAccountType:(id)a3
{
  if (isExcludedAccountType__onceToken != -1) {
    dispatch_once(&isExcludedAccountType__onceToken, &__block_literal_global);
  }
  uint64_t v4 = [a3 identifier];
  if (v4)
  {
    v5 = (void *)isExcludedAccountType__excludedAccountTypeIdentifiers;
    uint64_t v6 = [a3 identifier];
    LOBYTE(v4) = [v5 containsObject:v6];
  }
  return v4;
}

uint64_t __52__ScheduleSettingsController_isExcludedAccountType___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t result = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x263EFAF98], 0);
  isExcludedAccountType__excludedAccountTypeIdentifiers = result;
  return result;
}

- (id)_specifiersForMCCAccount:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263EFF980] array];
  if ([a3 parentAccount]) {
    return v5;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = objc_msgSend(a3, "enabledDataclasses", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v8) {
    return v5;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v17;
  while (2)
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
      if (ScheduleSettingsDataclassIsFetchy_onceToken == -1)
      {
        if (!v12) {
          goto LABEL_11;
        }
      }
      else
      {
        dispatch_once(&ScheduleSettingsDataclassIsFetchy_onceToken, &__block_literal_global_193);
        if (!v12) {
          goto LABEL_11;
        }
      }
      if ([(id)ScheduleSettingsDataclassIsFetchy_fetchyDataclassSet containsObject:v12])
      {
        id v14 = (void *)[a3 enabledDataclasses];
        uint64_t v15 = [a3 supportsPush];
        if ([v14 count]) {
          objc_msgSend(v5, "addObject:", -[ScheduleSettingsController _specifierForMCCAccount:dataclasses:canPush:canFetch:canManual:](self, "_specifierForMCCAccount:dataclasses:canPush:canFetch:canManual:", a3, objc_msgSend(v14, "allObjects"), v15, 1, 1));
        }
        return v5;
      }
LABEL_11:
      ++v11;
    }
    while (v9 != v11);
    uint64_t v13 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    uint64_t v9 = v13;
    if (v13) {
      continue;
    }
    return v5;
  }
}

- (id)_specifierForMCCAccount:(id)a3 dataclasses:(id)a4 canPush:(BOOL)a5 canFetch:(BOOL)a6 canManual:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  v19[3] = *MEMORY[0x263EF8340];
  uint64_t v13 = (char *)[MEMORY[0x263F23130] specifierWithStyle:3 account:a3 detailControllerClass:objc_opt_class() presentationStyle:1];
  v19[0] = a4;
  v18[0] = @"ScheduleSettingsDataclassesKey";
  v18[1] = @"ScheduleSettingsAccountUniqueIdentifierKey";
  v18[2] = @"ScheduleSettingsAccountKey";
  v19[1] = [a3 identifier];
  v19[2] = a3;
  objc_msgSend(v13, "setUserInfo:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3));
  [v13 setTarget:self];
  *(void *)&v13[*MEMORY[0x263F5FE28]] = sel__mccSchedule_;
  *(void *)&v13[*MEMORY[0x263F5FE38]] = sel__setMCCSchedule_specifier_;
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v9 && !self->_isLowPowerMode)
  {
    objc_msgSend(v14, "addObject:", objc_msgSend(NSNumber, "numberWithLong:", 0));
    objc_msgSend(v15, "addObject:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PUSH", &stru_26DDE6728, @"ScheduleSettings"));
    if (!v8) {
      goto LABEL_7;
    }
  }
  else if (!v8)
  {
    goto LABEL_7;
  }
  if (!self->_isLowPowerMode)
  {
    objc_msgSend(v14, "addObject:", objc_msgSend(NSNumber, "numberWithLong:", 1));
    objc_msgSend(v15, "addObject:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"FETCH", &stru_26DDE6728, @"ScheduleSettings"));
  }
LABEL_7:
  if (v7 && !self->_isLowPowerMode)
  {
    objc_msgSend(v14, "addObject:", objc_msgSend(NSNumber, "numberWithLong:", 2));
    objc_msgSend(v15, "addObject:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"MANUAL", &stru_26DDE6728, @"ScheduleSettings"));
  }
  if (self->_isLowPowerMode)
  {
    objc_msgSend(v14, "addObject:", objc_msgSend(NSNumber, "numberWithLong:", 2));
    objc_msgSend(v15, "addObject:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"LOW_POWER", &stru_26DDE6728, @"ScheduleSettings"));
  }
  [v13 setValues:v14 titles:v15];
  if (self->_isLowPowerMode) {
    long long v16 = &unk_26DDE72A0;
  }
  else {
    long long v16 = &unk_26DDE72B8;
  }
  [v13 setProperty:v16 forKey:*MEMORY[0x263F600A8]];

  return v13;
}

- (int)styleForAccount:(id)a3 uniqueIdentifier:(id)a4
{
  if (!a4) {
    return [a3 supportsPush] ^ 1;
  }
  int result = _PCSettingsGetStyle();
  if (!result) {
    return [a3 supportsPush] ^ 1;
  }
  return result;
}

- (id)_mccSchedule:(id)a3
{
  uint64_t v4 = (void *)[a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"ScheduleSettingsAccountKey"];
  uint64_t v6 = [v4 objectForKey:@"ScheduleSettingsAccountUniqueIdentifierKey"];
  BOOL v7 = NSNumber;
  if (self->_isLowPowerMode) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = [(ScheduleSettingsController *)self styleForAccount:v5 uniqueIdentifier:v6];
  }

  return (id)[v7 numberWithLong:v8];
}

- (void)_setMCCSchedule:(id)a3 specifier:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "userInfo"), "objectForKey:", @"ScheduleSettingsAccountUniqueIdentifierKey");
  int v8 = [a3 intValue];
  if (v7 && objc_msgSend(-[ScheduleSettingsController _mccSchedule:](self, "_mccSchedule:", a4), "longValue") != v8) {
    PCSettingsSetStyle();
  }
  BOOL v9 = (void *)[(ScheduleSettingsController *)self table];

  [v9 reloadData];
}

- (void)_readScheduleSettings
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int ClassPollInterval = PCSettingsGetClassPollInterval();

  self->_checkedSpecifier = 0;
  if (!self->_isLowPowerMode)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = (int)*MEMORY[0x263F5FDB8];
    uint64_t v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v5);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        uint64_t v12 = (void *)[v11 propertyForKey:@"interval"];
        if (v12)
        {
          if ([v12 integerValue] == ClassPollInterval) {
            break;
          }
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v8) {
            goto LABEL_5;
          }
          goto LABEL_12;
        }
      }
      checkedSpecifier = v11;
      self->_checkedSpecifier = checkedSpecifier;
      if (checkedSpecifier) {
        goto LABEL_16;
      }
    }
    else
    {
LABEL_12:
      checkedSpecifier = self->_checkedSpecifier;
      if (checkedSpecifier) {
        goto LABEL_16;
      }
    }
    checkedSpecifier = (PSSpecifier *)(id)[(ScheduleSettingsController *)self specifierForID:@"MANUALLY"];
    self->_checkedSpecifier = checkedSpecifier;
    goto LABEL_16;
  }
  checkedSpecifier = (PSSpecifier *)(id)[(ScheduleSettingsController *)self specifierForID:@"MANUALLY"];
  self->_checkedSpecifier = checkedSpecifier;
  uint64_t v5 = (int)*MEMORY[0x263F5FDB8];
LABEL_16:
  self->_rowToSelect = [*(id *)((char *)&self->super.super.super.super.super.isa + v5) indexOfObject:checkedSpecifier];
  [(ScheduleSettingsController *)self updateRadioGroupText];
}

- (id)pushEnabled:(id)a3
{
  if (self->_isLowPowerMode) {
    return &unk_26DDE72A0;
  }
  uint64_t v4 = NSNumber;
  BOOL v5 = PCSettingsGetClassPushEnabled() != 0;

  return (id)[v4 numberWithBool:v5];
}

- (void)setPushEnabled:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];
  PCSettingsSetClassPushEnabled();
  BOOL v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE78]);
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]);

  [v5 reloadSpecifier:v6];
}

- (void)setPollInterval:(id)a3 specifier:(id)a4
{
  checkedSpecifier = self->_checkedSpecifier;
  if (checkedSpecifier != a4)
  {
    uint64_t v7 = (void *)[(PSSpecifier *)checkedSpecifier propertyForKey:*MEMORY[0x263F602B0]];
    [v7 setChecked:0];
    [v7 setValue:0];

    uint64_t v8 = (PSSpecifier *)a4;
    self->_checkedSpecifier = v8;
    self->_rowToSelect = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) indexOfObject:v8];
    objc_msgSend((id)-[PSSpecifier propertyForKey:](self->_checkedSpecifier, "propertyForKey:", @"interval"), "intValue");
    PCSettingsSetClassPollInterval();
    [(ScheduleSettingsController *)self updateRadioGroupText];
    uint64_t v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE78]);
    uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]);
    [v9 reloadSpecifier:v10];
  }
}

- (void)updateRadioGroupText
{
  uint64_t v3 = [(ScheduleSettingsController *)self specifierForID:@"radioGroup"];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    BOOL v5 = (void *)[(PSSpecifier *)self->_checkedSpecifier propertyForKey:@"interval"];
    if (v5 && ![v5 integerValue])
    {
      uint64_t v6 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v7 = (void *)[v6 localizedStringForKey:SFLocalizableWAPIStringKeyForKey() value:&stru_26DDE6728 table:@"ScheduleSettings"];
      int v8 = [v7 _isNaturallyRTL];
      [v4 setProperty:v7 forKey:*MEMORY[0x263F600F8]];
      if (v8) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t v10 = [NSNumber numberWithInt:v9];
      [v4 setProperty:v10 forKey:*MEMORY[0x263F600B8]];
      uint64_t v11 = [NSNumber numberWithInt:v9];
      [v4 setProperty:v11 forKey:*MEMORY[0x263F5FEF0]];
    }
    else
    {
      [v4 removePropertyForKey:*MEMORY[0x263F600F8]];
    }
    [(ScheduleSettingsController *)self reloadSpecifier:v4];
  }
}

- (void)listItemSelected:(id)a3
{
  uint64_t v5 = -[ScheduleSettingsController indexForIndexPath:](self, "indexForIndexPath:");
  uint64_t v6 = (char *)[*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v5];
  if ([(ScheduleSettingsController *)self indexForIndexPath:a3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = (int)*MEMORY[0x263F5FDD0];
    if (self->_rowToSelect != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "cellForRowAtIndexPath:", -[ScheduleSettingsController indexPathForIndex:](self, "indexPathForIndex:")), "setChecked:", 0);
    }
    objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "cellForRowAtIndexPath:", a3), "setChecked:", 1);
  }
  int v8 = (int *)MEMORY[0x263F5FE38];
  if (*(void *)&v6[*MEMORY[0x263F5FE38]])
  {
    uint64_t v9 = (int *)MEMORY[0x263F5FE40];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = (void *)[v6 values];
      uint64_t v11 = [v10 count];
      uint64_t v12 = *(void **)&v6[*v9];
      uint64_t v13 = *(void *)&v6[*v8];
      if (v11) {
        uint64_t v14 = [v10 objectAtIndex:0];
      }
      else {
        uint64_t v14 = [v6 propertyForKey:*MEMORY[0x263F602D0]];
      }
      [v12 performSelector:v13 withObject:v14 withObject:v6];
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ScheduleSettingsController;
  id v6 = -[ScheduleSettingsController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3);
  uint64_t v7 = [(ScheduleSettingsController *)self indexForIndexPath:a4];
  if (v7 == self->_fetchDividerRow) {
    [(ScheduleSettingsController *)self configureFetchDividerCell:v6 atIndexPath:a4];
  }
  if (([v6 tag] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [v6 setChecked:v7 == self->_rowToSelect];
    [v6 setCellAction:sel_listItemSelected_];
    [v6 setCellTarget:self];
  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v7 = [(ScheduleSettingsController *)self indexForIndexPath:a5];
  int64_t fetchDividerRow = self->_fetchDividerRow;
  if (v7 == fetchDividerRow || v7 + 1 == fetchDividerRow)
  {
    [a4 _setShouldHaveFullLengthBottomSeparator:1];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7 = [(ScheduleSettingsController *)self specifierAtIndex:[(ScheduleSettingsController *)self indexForIndexPath:a4]];
  if (*(void *)(v7 + (int)*MEMORY[0x263F5FE10]) == 3)
  {
    [(ScheduleSettingsController *)self listItemSelected:a4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ScheduleSettingsController;
    [(ScheduleSettingsController *)&v8 tableView:a3 didSelectRowAtIndexPath:a4];
  }
  [a3 deselectRowAtIndexPath:a4 animated:1];
}

- (void)configureFetchDividerCell:(id)a3 atIndexPath:(id)a4
{
  id v5 = objc_alloc(MEMORY[0x263F1CB60]);
  objc_msgSend((id)objc_msgSend(a3, "contentView"), "frame");
  id v6 = objc_msgSend(v5, "initWithFrame:");
  [v6 setAutoresizingMask:18];
  [v6 setContentMode:4];
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "tableSeparatorLightColor"));
  uint64_t v7 = (void *)[a3 contentView];

  [v7 addSubview:v6];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ScheduleSettingsController;
  -[ScheduleSettingsController tableView:heightForRowAtIndexPath:](&v10, sel_tableView_heightForRowAtIndexPath_, a3);
  double v7 = v6;
  uint64_t v8 = [(ScheduleSettingsController *)self indexForIndexPath:a4];
  double result = 1.0;
  if (v8 != self->_fetchDividerRow) {
    return v7;
  }
  return result;
}

@end