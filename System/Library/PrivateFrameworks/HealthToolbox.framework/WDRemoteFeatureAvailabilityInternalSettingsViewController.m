@interface WDRemoteFeatureAvailabilityInternalSettingsViewController
- (NSArray)userDefaultsContentKeys;
- (NSDictionary)userDefaultsContent;
- (NSSet)conditions;
- (NSUserDefaults)userDefaults;
- (WDRemoteFeatureAvailabilityInternalSettingsViewController)initWithConditions:(id)a3;
- (id)currentlocaleCountryCode;
- (id)evaluateRulesForCondition:(id)a3;
- (id)jsonStringFromDictionary:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int)featureAvailabilityConditionsDidUpdateNotificationToken;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_featureAvailabilityConditionsDidUpdate;
- (void)_registerForNotifications;
- (void)_unregisterForNotifications;
- (void)dealloc;
- (void)reloadUserDefaultsContent;
- (void)setConditions:(id)a3;
- (void)setFeatureAvailabilityConditionsDidUpdateNotificationToken:(int)a3;
- (void)setUserDefaultsContent:(id)a3;
- (void)setUserDefaultsContentKeys:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation WDRemoteFeatureAvailabilityInternalSettingsViewController

- (WDRemoteFeatureAvailabilityInternalSettingsViewController)initWithConditions:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDRemoteFeatureAvailabilityInternalSettingsViewController;
  v6 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)&v11 initWithStyle:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_conditions, a3);
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFFA40], "hk_remoteFeatureAvailabilityUserDefaults");
    userDefaults = v7->_userDefaults;
    v7->_userDefaults = (NSUserDefaults *)v8;

    [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)v7 setTitle:@"Remote Conditions"];
    [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)v7 _registerForNotifications];
  }

  return v7;
}

- (void)dealloc
{
  [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self _unregisterForNotifications];
  v3.receiver = self;
  v3.super_class = (Class)WDRemoteFeatureAvailabilityInternalSettingsViewController;
  [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)WDRemoteFeatureAvailabilityInternalSettingsViewController;
  [(HKTableViewController *)&v4 viewDidLoad];
  [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self reloadUserDefaultsContent];
  objc_super v3 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self tableView];
  [v3 reloadData];
}

- (void)_registerForNotifications
{
  objc_initWeak(&location, self);
  objc_super v3 = (const char *)*MEMORY[0x263F09F68];
  objc_super v4 = MEMORY[0x263EF83A0];
  id v5 = MEMORY[0x263EF83A0];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__WDRemoteFeatureAvailabilityInternalSettingsViewController__registerForNotifications__block_invoke;
  v6[3] = &unk_26458EF58;
  objc_copyWeak(&v7, &location);
  notify_register_dispatch(v3, &self->_featureAvailabilityConditionsDidUpdateNotificationToken, v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __86__WDRemoteFeatureAvailabilityInternalSettingsViewController__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _featureAvailabilityConditionsDidUpdate];
}

- (void)_unregisterForNotifications
{
  if (notify_is_valid_token(self->_featureAvailabilityConditionsDidUpdateNotificationToken))
  {
    int featureAvailabilityConditionsDidUpdateNotificationToken = self->_featureAvailabilityConditionsDidUpdateNotificationToken;
    notify_cancel(featureAvailabilityConditionsDidUpdateNotificationToken);
  }
}

- (void)_featureAvailabilityConditionsDidUpdate
{
  [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self reloadUserDefaultsContent];
  id v3 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self tableView];
  [v3 reloadData];
}

- (void)reloadUserDefaultsContent
{
  id v3 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self userDefaults];
  objc_super v4 = [v3 dictionaryRepresentation];
  [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self setUserDefaultsContent:v4];

  id v5 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self userDefaultsContent];
  v6 = [v5 allKeys];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__WDRemoteFeatureAvailabilityInternalSettingsViewController_reloadUserDefaultsContent__block_invoke;
  v9[3] = &unk_26458EF80;
  v9[4] = self;
  id v7 = objc_msgSend(v6, "hk_filter:", v9);
  uint64_t v8 = [v7 sortedArrayUsingSelector:sel_compare_];
  [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self setUserDefaultsContentKeys:v8];
}

uint64_t __86__WDRemoteFeatureAvailabilityInternalSettingsViewController_reloadUserDefaultsContent__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_super v4 = [v2 conditions];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (id)jsonStringFromDictionary:(id)a3
{
  uint64_t v6 = 0;
  id v3 = [MEMORY[0x263F08900] dataWithJSONObject:a3 options:1 error:&v6];
  if (v3) {
    objc_super v4 = (__CFString *)[[NSString alloc] initWithData:v3 encoding:4];
  }
  else {
    objc_super v4 = @"⚠️ Parsing data error";
  }

  return v4;
}

- (id)evaluateRulesForCondition:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NSClassFromString(&cfstr_Hkactivewatchr.isa);
  if (v5)
  {
    id v6 = objc_alloc_init(v5);
    id v7 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self currentlocaleCountryCode];
    [v6 setValue:v7 forKey:@"onboardingCountryCode"];

    id v8 = objc_alloc(MEMORY[0x263F0A6A8]);
    v9 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self userDefaultsContent];
    v10 = (void *)MEMORY[0x263EFFA08];
    v19[0] = v4;
    objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    v12 = [v10 setWithArray:v11];
    v13 = (void *)[v8 initWithRawValue:v9 dataSource:v6 supportedConditions:v12];

    v14 = [v13 evaluateAll];
    v15 = [v14 objectForKeyedSubscript:v4];
    uint64_t v16 = [v15 BOOLValue];

    v17 = [NSNumber numberWithBool:v16];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)currentlocaleCountryCode
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  id v3 = [v2 countryCode];

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self userDefaultsContentKeys];
  unint64_t v4 = [v3 count];

  if (v4 <= 1) {
    return 1;
  }
  else {
    return v4;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self userDefaultsContentKeys];
  uint64_t v5 = [v4 count];

  if (v5) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self userDefaultsContentKeys];
  uint64_t v7 = [v6 count] - 1;

  if (v7 == a4)
  {
    id v8 = NSString;
    v9 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self currentlocaleCountryCode];
    v10 = [v8 stringWithFormat:@"The current device region from the locale has been used to evaluate the conditions here (%@).", v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"default_cell"];
  if (!v7) {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"default_cell"];
  }
  id v8 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self userDefaultsContentKeys];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    v20 = [v7 textLabel];
    [v20 setText:@"N/A"];

    v21 = [v7 textLabel];
    [v21 setNumberOfLines:1];

    objc_super v11 = [v7 detailTextLabel];
    [v11 setText:0];
    goto LABEL_14;
  }
  v10 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self userDefaultsContentKeys];
  objc_super v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

  if ([v6 row])
  {
    v12 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self userDefaultsContent];
    v13 = [v12 objectForKeyedSubscript:v11];

    v14 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self jsonStringFromDictionary:v13];
    v15 = [v7 textLabel];
    [v15 setText:v14];

    uint64_t v16 = [v7 textLabel];
    [v16 setNumberOfLines:0];
  }
  else
  {
    v22 = [v7 textLabel];
    [v22 setText:v11];

    v23 = [v7 textLabel];
    [v23 setNumberOfLines:1];

    v24 = [(WDRemoteFeatureAvailabilityInternalSettingsViewController *)self evaluateRulesForCondition:v11];
    v13 = v24;
    if (v24)
    {
      if ([v24 BOOLValue]) {
        v25 = @"🟢";
      }
      else {
        v25 = @"🔴";
      }
      v17 = [v7 detailTextLabel];
      v18 = v17;
      v19 = v25;
      goto LABEL_13;
    }
  }
  v17 = [v7 detailTextLabel];
  v18 = v17;
  v19 = 0;
LABEL_13:
  [v17 setText:v19];

LABEL_14:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (NSSet)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
}

- (int)featureAvailabilityConditionsDidUpdateNotificationToken
{
  return self->_featureAvailabilityConditionsDidUpdateNotificationToken;
}

- (void)setFeatureAvailabilityConditionsDidUpdateNotificationToken:(int)a3
{
  self->_int featureAvailabilityConditionsDidUpdateNotificationToken = a3;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (NSDictionary)userDefaultsContent
{
  return self->_userDefaultsContent;
}

- (void)setUserDefaultsContent:(id)a3
{
}

- (NSArray)userDefaultsContentKeys
{
  return self->_userDefaultsContentKeys;
}

- (void)setUserDefaultsContentKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsContentKeys, 0);
  objc_storeStrong((id *)&self->_userDefaultsContent, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_conditions, 0);
}

@end