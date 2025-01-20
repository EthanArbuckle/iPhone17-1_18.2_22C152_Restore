@interface EACellBroadcastSwitchExtension
- (BOOL)readCustomPrefForKey:(id)a3 withDefault:(BOOL)a4;
- (EACellBroadcastSwitchExtension)init;
- (id)getAlertState;
- (id)getAlwaysDeliverState;
- (id)getEnhancedDeliveryState;
- (id)readAlertState:(id)a3;
- (id)specifiers;
- (void)addAlwaysDeliverOption;
- (void)addEnhancedDeliveryOption;
- (void)addRootAlertSwitch;
- (void)removeAlwaysDeliverOption;
- (void)removeEnhancedDeliveryOption;
- (void)resetItems;
- (void)setAlertState:(id)a3;
- (void)setAlertStateforKey:(id)a3 withValue:(id)a4;
- (void)setAlwaysDeliverState:(id)a3;
- (void)setCustomPreferenceForKey:(id)a3 withValue:(id)a4;
- (void)setEnhancedDeliveryState:(id)a3;
@end

@implementation EACellBroadcastSwitchExtension

- (void)resetItems
{
  cmasSwitch = self->_cmasSwitch;
  self->_cmasSwitch = 0;

  alwaysDeliverSwitch = self->_alwaysDeliverSwitch;
  self->_alwaysDeliverSwitch = 0;

  alertDict = self->_alertDict;
  self->_alertDict = 0;

  alertKey = self->_alertKey;
  self->_alertKey = 0;

  v7 = (NSMutableArray *)objc_opt_new();
  specifierArray = self->_specifierArray;
  self->_specifierArray = v7;

  v9 = +[PSSpecifier groupSpecifierWithID:@"CUSTOM_SPECIFIER_ROOT"];
  rootGroupSpecifier = self->_rootGroupSpecifier;
  self->_rootGroupSpecifier = v9;

  v11 = +[PSSpecifier groupSpecifierWithID:@"CUSTOM_SPECIFIER_ALWAYS_DELIVER"];
  alwaysDeliverGroupSpecifier = self->_alwaysDeliverGroupSpecifier;
  self->_alwaysDeliverGroupSpecifier = v11;

  v13 = +[PSSpecifier groupSpecifierWithID:@"CUSTOM_SPECIFIER_ADV"];
  groupSpecifierForEnhancedDelivery = self->_groupSpecifierForEnhancedDelivery;
  self->_groupSpecifierForEnhancedDelivery = v13;

  advancedEarthquakeWarningSwitch = self->_advancedEarthquakeWarningSwitch;
  self->_advancedEarthquakeWarningSwitch = 0;
}

- (EACellBroadcastSwitchExtension)init
{
  v5.receiver = self;
  v5.super_class = (Class)EACellBroadcastSwitchExtension;
  v2 = [(EACellBroadcastSwitchExtension *)&v5 init];
  v3 = v2;
  if (v2) {
    [(EACellBroadcastSwitchExtension *)v2 resetItems];
  }
  return v3;
}

- (void)setCustomPreferenceForKey:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _CTServerConnectionCreate();
  if (v8)
  {
    v9 = (const void *)v8;
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, @"AlertType", self->_alertKey);
    unsigned int v11 = objc_msgSend(v7, "BOOLValue", 0, 0, 0, 0, 0);
    v12 = (const void **)&kCFBooleanTrue;
    if (!v11) {
      v12 = (const void **)&kCFBooleanFalse;
    }
    CFDictionarySetValue(Mutable, v6, *v12);
    v13 = getLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      alertKey = self->_alertKey;
      unsigned int v15 = [v7 BOOLValue];
      v16 = @"disabled";
      if (v15) {
        v16 = @"enabled";
      }
      v17 = v16;
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = (uint64_t)alertKey;
      __int16 v24 = 2114;
      id v25 = v6;
      __int16 v26 = 2114;
      v27 = v17;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Storing custom user pref for %{public}@ - [%{public}@: %{public}@]", buf, 0x20u);
    }
    uint64_t v18 = _CTServerConnectionSetCellBroadcastCustomPrefForAlertType();
    v19 = getLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v23 = v18 >> 32;
      __int16 v24 = 1024;
      LODWORD(v25) = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Error code: %ld, Did succeed: %d", buf, 0x12u);
    }

    v20 = getLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Custom preference stored successfully", buf, 2u);
    }

    CFRelease(v9);
    CFRelease(Mutable);
  }
  else
  {
    v21 = getLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Error in creating connection to Telephony", buf, 2u);
    }
  }
}

- (void)setAlertStateforKey:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _CTServerConnectionCreate();
  if (v8)
  {
    v9 = (const void *)v8;
    unsigned int v10 = objc_msgSend(v7, "BOOLValue", 0, 0, 0, 0, 0);
    unsigned int v11 = getLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      alertKey = self->_alertKey;
      v13 = @"disabled";
      if (v10) {
        v13 = @"enabled";
      }
      v14 = v13;
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = (uint64_t)alertKey;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Storing alert state for %@: %@", buf, 0x16u);
    }
    uint64_t v15 = _CTServerConnectionSetCellBroadcastSettingForAlertType();
    v16 = getLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v19 = v15 >> 32;
      __int16 v20 = 1024;
      LODWORD(v21) = 0;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Error code: %ld, Did succeed: %d", buf, 0x12u);
    }

    CFRelease(v9);
  }
  else
  {
    v17 = getLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Error in creating server connection", buf, 2u);
    }
  }
}

- (id)readAlertState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _CTServerConnectionCreate();
  if (v5)
  {
    id v6 = (const void *)v5;
    unint64_t CellBroadcastSettingForAlertType = _CTServerConnectionGetCellBroadcastSettingForAlertType();
    if (HIDWORD(CellBroadcastSettingForAlertType))
    {
      uint64_t v8 = CellBroadcastSettingForAlertType;
      v9 = getLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v19 = (int)v8;
        __int16 v20 = 2048;
        uint64_t v21 = v8 >> 32;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Error with CT: domain %ld code %ld ", buf, 0x16u);
      }
    }
    unsigned int v10 = getLogger();
    unsigned int v11 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2A5C(v11);
    }

    CFRelease(v6);
    uint64_t v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0, 0, 0, 0, 0, 0);
  }
  else
  {
    v12 = [(NSDictionary *)self->_alertDict objectForKey:@"EnabledByDefault", 0, 0, 0, 0, 0];
    v13 = v12;
    if (v12)
    {
      id v16 = [v12 BOOLValue];
    }
    else
    {
      v14 = getLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Malformed EnabledByDefault payload", buf, 2u);
      }

      id v16 = 0;
    }
    uint64_t v15 = +[NSNumber numberWithBool:v16];
  }

  return v15;
}

- (BOOL)readCustomPrefForKey:(id)a3 withDefault:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = _CTServerConnectionCreate();
  if (v7)
  {
    uint64_t v8 = (const void *)v7;
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    p_alertKey = (uint64_t *)&self->_alertKey;
    CFDictionarySetValue(Mutable, @"AlertType", self->_alertKey);
    unsigned int v11 = getLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *p_alertKey;
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Reading custom pref for %@", buf, 0xCu);
    }

    unint64_t CellBroadcastCustomPrefForAlertType = _CTServerConnectionGetCellBroadcastCustomPrefForAlertType();
    if (HIDWORD(CellBroadcastCustomPrefForAlertType))
    {
      uint64_t v15 = CellBroadcastCustomPrefForAlertType;
      id v16 = getLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_2B9C(v15, v16, v17);
      }
    }
    else
    {
      id v16 = getLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_2AA0(p_alertKey, v16);
      }
    }

    CFRelease(v8);
    CFRelease(Mutable);
  }
  else
  {
    v14 = getLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Error creating Server connection", buf, 2u);
    }
  }
  return a4;
}

- (void)setEnhancedDeliveryState:(id)a3
{
}

- (id)getEnhancedDeliveryState
{
  BOOL v3 = [(EACellBroadcastSwitchExtension *)self readCustomPrefForKey:@"EnhancedDeliveryPref" withDefault:0];
  id v4 = getLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_2C20((uint64_t)self, v3, v4);
  }

  uint64_t v5 = +[NSNumber numberWithBool:v3];

  return v5;
}

- (void)removeEnhancedDeliveryOption
{
  if (self->_advancedEarthquakeWarningSwitch)
  {
    -[NSMutableArray removeObject:](self->_specifierArray, "removeObject:");
    advancedEarthquakeWarningSwitch = self->_advancedEarthquakeWarningSwitch;
    self->_advancedEarthquakeWarningSwitch = 0;
  }
}

- (void)addEnhancedDeliveryOption
{
  BOOL v3 = getLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Visited Enhanced Delivery page.", buf, 2u);
  }

  id v4 = +[SafetyAlerts sharedInterface];
  [v4 onEnhancedDeliveryPageVisited];

  uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"ENHANCED_DELIVERY_SWITCH_NAME" value:&stru_4380 table:@"Localizable~IGNEOUS"];

  uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"ENHANCED_DELIVERY_DESCRIPTION" value:&stru_4380 table:@"Localizable~IGNEOUS"];

  v9 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setEnhancedDeliveryState:" get:"getEnhancedDeliveryState" detail:0 cell:6 edit:0];
  advancedEarthquakeWarningSwitch = self->_advancedEarthquakeWarningSwitch;
  self->_advancedEarthquakeWarningSwitch = v9;

  [(PSSpecifier *)self->_groupSpecifierForEnhancedDelivery setProperty:v8 forKey:PSFooterTextGroupKey];
  [(NSMutableArray *)self->_specifierArray ps_addSpecifier:self->_advancedEarthquakeWarningSwitch toGroup:self->_groupSpecifierForEnhancedDelivery];
}

- (void)addAlwaysDeliverOption
{
  BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"ALWAYS_DELIVER" value:&stru_4380 table:@"Localizable"];
  uint64_t v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setAlwaysDeliverState:" get:"getAlwaysDeliverState" detail:0 cell:6 edit:0];
  alwaysDeliverSwitch = self->_alwaysDeliverSwitch;
  self->_alwaysDeliverSwitch = v5;

  alwaysDeliverGroupSpecifier = self->_alwaysDeliverGroupSpecifier;
  uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"ALWAYS_DELIVER_MESSAGE" value:&stru_4380 table:@"Localizable"];
  [(PSSpecifier *)alwaysDeliverGroupSpecifier setProperty:v9 forKey:PSFooterTextGroupKey];

  specifierArray = self->_specifierArray;
  unsigned int v11 = self->_alwaysDeliverSwitch;
  uint64_t v12 = self->_alwaysDeliverGroupSpecifier;

  [(NSMutableArray *)specifierArray ps_addSpecifier:v11 toGroup:v12];
}

- (void)removeAlwaysDeliverOption
{
  if (self->_alwaysDeliverSwitch)
  {
    -[NSMutableArray removeObject:](self->_specifierArray, "removeObject:");
    alwaysDeliverSwitch = self->_alwaysDeliverSwitch;
    self->_alwaysDeliverSwitch = 0;
  }
}

- (void)setAlwaysDeliverState:(id)a3
{
}

- (id)getAlwaysDeliverState
{
  BOOL v3 = [(EACellBroadcastSwitchExtension *)self readCustomPrefForKey:@"AlwaysDeliverPref" withDefault:0];
  id v4 = getLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_2CD4((uint64_t)self, v3, v4);
  }

  uint64_t v5 = +[NSNumber numberWithBool:v3];

  return v5;
}

- (void)addRootAlertSwitch
{
  id v4 = [(NSDictionary *)self->_alertDict objectForKey:@"SwitchName"];
  BOOL v3 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setAlertState:" get:"getAlertState" detail:0 cell:6 edit:0];
  [(NSMutableArray *)self->_specifierArray ps_addSpecifier:v3 toGroup:self->_rootGroupSpecifier];
}

- (id)getAlertState
{
  if (self->_alertKey) {
    -[EACellBroadcastSwitchExtension readAlertState:](self, "readAlertState:");
  }
  else {
  v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
  }

  return v2;
}

- (void)setAlertState:(id)a3
{
  alertKey = self->_alertKey;
  id v5 = a3;
  [(EACellBroadcastSwitchExtension *)self setAlertStateforKey:alertKey withValue:v5];
  unsigned int v6 = [v5 BOOLValue];

  uint64_t v7 = getLogger();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Adding Advanced options", buf, 2u);
    }

    [(EACellBroadcastSwitchExtension *)self addAlwaysDeliverOption];
    [(EACellBroadcastSwitchExtension *)self addEnhancedDeliveryOption];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Removing Advanced options", v9, 2u);
    }

    [(EACellBroadcastSwitchExtension *)self removeAlwaysDeliverOption];
    [(EACellBroadcastSwitchExtension *)self removeEnhancedDeliveryOption];
  }
}

- (id)specifiers
{
  v2 = self;
  [(EACellBroadcastSwitchExtension *)self resetItems];
  BOOL v3 = [(EACellBroadcastSwitchExtension *)v2 specifier];
  uint64_t v4 = [v3 propertyForKey:@"AlertKey"];
  alertKey = v2->_alertKey;
  v2->_alertKey = (NSString *)v4;

  unsigned int v6 = [(EACellBroadcastSwitchExtension *)v2 specifier];
  uint64_t v7 = [v6 propertyForKey:@"AlertDetail"];
  alertDict = v2->_alertDict;
  v2->_alertDict = (NSDictionary *)v7;

  v9 = getLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = v2->_alertKey;
    unsigned int v11 = v2->_alertDict;
    *(_DWORD *)buf = 138412546;
    v37 = v10;
    __int16 v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Custom settings for %@ - %@", buf, 0x16u);
  }

  uint64_t v12 = [(EACellBroadcastSwitchExtension *)v2 readAlertState:v2->_alertKey];
  [(NSMutableArray *)v2->_specifierArray addObject:v2->_rootGroupSpecifier];
  [(EACellBroadcastSwitchExtension *)v2 addRootAlertSwitch];
  unsigned __int8 v13 = [v12 BOOLValue];
  v14 = getLogger();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Root alert is enabled - Adding other options", buf, 2u);
    }

    id v16 = [(NSDictionary *)v2->_alertDict objectForKeyedSubscript:@"CustomPreferences"];
    v14 = v16;
    if (!v16 || (unint64_t)[v16 count] >= 3)
    {
      uint64_t v17 = getLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_2D88((uint64_t)v14, v17);
      }

      goto LABEL_30;
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v14 = v14;
    id v18 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (!v18)
    {

      goto LABEL_30;
    }
    id v19 = v18;
    v29 = v12;
    v30 = v2;
    char v20 = 0;
    char v21 = 0;
    uint64_t v22 = *(void *)v32;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v14);
        }
        __int16 v24 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v25 = [v24 objectForKeyedSubscript:@"ShowAlwaysDeliverSwitch"];

        if (v25)
        {
          char v20 = 1;
        }
        else
        {
          __int16 v26 = [v24 objectForKeyedSubscript:@"EnableEnhancedDelivery"];

          v21 |= v26 != 0;
        }
      }
      id v19 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v19);

    if (v21)
    {
      v2 = v30;
      [(NSMutableArray *)v30->_specifierArray addObject:v30->_groupSpecifierForEnhancedDelivery];
      [(EACellBroadcastSwitchExtension *)v30 addEnhancedDeliveryOption];
      if ((v20 & 1) == 0) {
        goto LABEL_29;
      }
    }
    else
    {
      v2 = v30;
      if ((v20 & 1) == 0)
      {
LABEL_29:
        uint64_t v12 = v29;
        goto LABEL_30;
      }
    }
    [(NSMutableArray *)v2->_specifierArray addObject:v2->_alwaysDeliverGroupSpecifier];
    [(EACellBroadcastSwitchExtension *)v2 addAlwaysDeliverOption];
    goto LABEL_29;
  }
  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Root alert is disabled - not adding other customizations", buf, 2u);
  }
LABEL_30:

  objc_storeStrong((id *)&v2->PSListController_opaque[OBJC_IVAR___PSListController__specifiers], v2->_specifierArray);
  v27 = v2->_specifierArray;

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierArray, 0);
  objc_storeStrong((id *)&self->_alertKey, 0);
  objc_storeStrong((id *)&self->_alertDict, 0);
  objc_storeStrong((id *)&self->_groupSpecifierForEnhancedDelivery, 0);
  objc_storeStrong((id *)&self->_alwaysDeliverGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_rootGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_cmasSwitch, 0);
  objc_storeStrong((id *)&self->_advancedEarthquakeWarningSwitch, 0);

  objc_storeStrong((id *)&self->_alwaysDeliverSwitch, 0);
}

@end