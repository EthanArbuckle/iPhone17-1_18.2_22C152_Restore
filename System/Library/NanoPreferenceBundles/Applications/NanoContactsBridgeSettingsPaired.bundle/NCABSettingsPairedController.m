@interface NCABSettingsPairedController
+ (id)foundationKeys;
+ (id)peoplePickerKeys;
+ (void)mapFoundationPreferenceKeysAndValues:(id)a3 toLegacyDomainAccessor:(id)a4 withSyncManager:(id)a5;
- (BOOL)suppressAlertSpecifiers;
- (NCABSettingsPairedController)init;
- (id)_getValueForKey:(id)a3 inDomainAccessor:(id)a4;
- (id)applicationBundleIdentifier;
- (id)contactsSortOrder:(id)a3;
- (id)foundationKeysAndValuesUsingDomainAccessor:(BOOL)a3;
- (id)localizedMirroringDetailFooter;
- (id)localizedPaneTitle;
- (id)mirroredApplicationGroupSpecifiers;
- (id)personNameOrder:(id)a3;
- (void)_contactStoreDidChange:(id)a3;
- (void)_setValue:(id)a3 forKey:(id)a4 inDomainAccessor:(id)a5 syncWithClient:(BOOL)a6;
- (void)dealloc;
- (void)mirrorSettingsChanged:(BOOL)a3;
- (void)setContactsSortOrder:(id)a3 specifier:(id)a4;
- (void)setPersonNameOrder:(id)a3 specifier:(id)a4;
- (void)synchronizeContactsSettings:(BOOL)a3;
@end

@implementation NCABSettingsPairedController

- (NCABSettingsPairedController)init
{
  v15.receiver = self;
  v15.super_class = (Class)NCABSettingsPairedController;
  v2 = [(NCABSettingsPairedController *)&v15 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    syncManager = v2->_syncManager;
    v2->_syncManager = (NPSManager *)v3;

    v5 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.PeoplePicker"];
    peoplePickerDomainAccessor = v2->_peoplePickerDomainAccessor;
    v2->_peoplePickerDomainAccessor = v5;

    id v7 = objc_alloc((Class)NPSDomainAccessor);
    v8 = (NPSDomainAccessor *)[v7 initWithDomain:NSPersonNameDefaultNamePreferencesDomain];
    foundationDomainAccessor = v2->_foundationDomainAccessor;
    v2->_foundationDomainAccessor = v8;

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_contactStoreDidChange:" name:CNContactStoreDidChangeNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_45B8, NSPersonNamePreferencesDidChangeNotification, 0, CFNotificationSuspensionBehaviorDrop);
    v12 = +[NRPairedDeviceRegistry sharedInstance];
    v13 = [v12 getActivePairedDevice];

    if (v13)
    {
      NRWatchOSVersionForRemoteDevice();
      v2->_activePairedWatchRequiresLegacyKeys = NRVersionIsGreaterThanOrEqual() ^ 1;
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:CNContactStoreDidChangeNotification object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, NSPersonNamePreferencesDidChangeNotification, 0);
  v5.receiver = self;
  v5.super_class = (Class)NCABSettingsPairedController;
  [(NCABSettingsPairedController *)&v5 dealloc];
}

- (void)_contactStoreDidChange:(id)a3
{
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.PeoplePicker";
}

- (void)mirrorSettingsChanged:(BOOL)a3
{
}

- (id)mirroredApplicationGroupSpecifiers
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = objc_alloc((Class)NSDictionary);
  objc_super v5 = [v3 pathForResource:@"NanoContactsBridgeSettingsPaired" ofType:@"plist"];
  id v6 = [v4 initWithContentsOfFile:v5];

  id v7 = SpecifiersFromPlist();
  id v8 = objc_msgSend(v7, "count", 0);
  if ((uint64_t)v8 >= 1)
  {
    uint64_t v9 = NSPersonNameDefaultDisplayNameOrderKey;
    unint64_t v10 = (unint64_t)v8 + 1;
    do
    {
      v11 = [v7 objectAtIndex:v10 - 2];
      v12 = [v11 identifier];
      unsigned __int8 v13 = [v12 isEqualToString:@"contactsSortOrder"];
      v14 = &OBJC_IVAR___NCABSettingsPairedController__contactsSortOrderSpecifier;
      if ((v13 & 1) != 0
        || (unsigned int v15 = [v12 isEqualToString:v9],
            v14 = &OBJC_IVAR___NCABSettingsPairedController__personNameOrderSpecifier,
            v15))
      {
        v16 = (id *)&self->BPSNotificationAppController_opaque[*v14];
        objc_storeStrong(v16, v11);
        objc_storeWeak((id *)((char *)*v16 + OBJC_IVAR___PSSpecifier_target), self);
      }

      --v10;
    }
    while (v10 > 1);
  }

  return v7;
}

- (id)localizedMirroringDetailFooter
{
  ABPersonSortOrdering SortOrdering = ABPersonGetSortOrdering();
  uint64_t v3 = NanoContactsSettingsPairedBundle();
  id v4 = v3;
  if (SortOrdering) {
    CFStringRef v5 = @"LAST";
  }
  else {
    CFStringRef v5 = @"FIRST";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];

  id v7 = (char *)+[NSPersonNameComponentsFormatter _defaultDisplayNameOrder];
  id v8 = NanoContactsSettingsPairedBundle();
  uint64_t v9 = v8;
  if (v7 == (unsigned char *)&dword_0 + 1) {
    CFStringRef v10 = @"FIRST";
  }
  else {
    CFStringRef v10 = @"LAST";
  }
  v11 = [v8 localizedStringForKey:v10 value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];

  v12 = NanoContactsSettingsPairedBundle();
  unsigned __int8 v13 = [v12 localizedStringForKey:@"SETTING_DESCRIPTION_LINE_FORMAT_WITH_COLON" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
  v14 = NanoContactsSettingsPairedBundle();
  unsigned int v15 = [v14 localizedStringForKey:@"Sort Order" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
  v16 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", v13, v15, v6);

  v17 = NanoContactsSettingsPairedBundle();
  v18 = [v17 localizedStringForKey:@"SETTING_DESCRIPTION_LINE_FORMAT_WITH_COLON" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
  v19 = NanoContactsSettingsPairedBundle();
  v20 = [v19 localizedStringForKey:@"Display Order" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
  objc_msgSend(v16, "appendFormat:", v18, v20, v11);

  if (+[NSPersonNameComponentsFormatter _shortNameIsEnabled])
  {
    v21 = (int *)+[NSPersonNameComponentsFormatter _defaultShortNameFormat];
    if (v21 == &dword_4)
    {
      v22 = NanoContactsSettingsPairedBundle();
      v23 = v22;
      CFStringRef v24 = @"SHORT_NAME_FORMAT_LAST_ONLY";
    }
    else if (v21 == (int *)((char *)&dword_0 + 2))
    {
      v22 = NanoContactsSettingsPairedBundle();
      v23 = v22;
      CFStringRef v24 = @"SHORT_NAME_FORMAT_INITIAL_FIRST";
    }
    else if (v21 == (int *)((char *)&dword_0 + 1))
    {
      v22 = NanoContactsSettingsPairedBundle();
      v23 = v22;
      CFStringRef v24 = @"SHORT_NAME_FORMAT_INITIAL_LAST";
    }
    else
    {
      v22 = NanoContactsSettingsPairedBundle();
      v23 = v22;
      CFStringRef v24 = @"SHORT_NAME_FORMAT_FIRST_ONLY";
    }
    v25 = [v22 localizedStringForKey:v24 value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];

    v26 = NanoContactsSettingsPairedBundle();
    v27 = [v26 localizedStringForKey:@"SETTING_DESCRIPTION_LINE_FORMAT_WITH_COLON" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
    v28 = NanoContactsSettingsPairedBundle();
    v29 = [v28 localizedStringForKey:@"Short Name" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
    objc_msgSend(v16, "appendFormat:", v27, v29, v25);
  }
  unsigned int v30 = +[NSPersonNameComponentsFormatter _shouldPreferNicknames];
  v31 = NanoContactsSettingsPairedBundle();
  v32 = v31;
  if (v30) {
    CFStringRef v33 = @"ON";
  }
  else {
    CFStringRef v33 = @"OFF";
  }
  v34 = [v31 localizedStringForKey:v33 value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];

  v35 = NanoContactsSettingsPairedBundle();
  v36 = [v35 localizedStringForKey:@"SETTING_DESCRIPTION_LINE_FORMAT_WITH_COLON" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
  v37 = NanoContactsSettingsPairedBundle();
  v38 = [v37 localizedStringForKey:@"Prefer Nicknames" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
  objc_msgSend(v16, "appendFormat:", v36, v38, v34);

  return v16;
}

- (id)localizedPaneTitle
{
  v2 = NanoContactsSettingsPairedBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"CONTACTS" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];

  return v3;
}

- (BOOL)suppressAlertSpecifiers
{
  return 1;
}

- (id)contactsSortOrder:(id)a3
{
  uint64_t v3 = [(NCABSettingsPairedController *)self _getValueForKey:@"contactsSortOrder" inDomainAccessor:self->_peoplePickerDomainAccessor];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSNumber numberWithUnsignedInt:ABPersonGetSortOrdering()];
  }
  id v6 = v5;

  return v6;
}

- (void)setContactsSortOrder:(id)a3 specifier:(id)a4
{
  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [a3 intValue]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(NCABSettingsPairedController *)self _setValue:v5 forKey:@"contactsSortOrder" inDomainAccessor:self->_peoplePickerDomainAccessor syncWithClient:1];
}

- (id)personNameOrder:(id)a3
{
  uint64_t v3 = [(NCABSettingsPairedController *)self _getValueForKey:NSPersonNameDefaultDisplayNameOrderKey inDomainAccessor:self->_foundationDomainAccessor];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[NSPersonNameComponentsFormatter _defaultDisplayNameOrder]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;

  return v6;
}

- (void)setPersonNameOrder:(id)a3 specifier:(id)a4
{
  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 integerValue]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(NCABSettingsPairedController *)self _setValue:v5 forKey:NSPersonNameDefaultDisplayNameOrderKey inDomainAccessor:self->_foundationDomainAccessor syncWithClient:1];
}

- (void)synchronizeContactsSettings:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = [(id)objc_opt_class() peoplePickerKeys];
  id v5 = [(id)objc_opt_class() foundationKeys];
  syncManager = self->_syncManager;
  if (v3)
  {
    id v7 = [(NPSDomainAccessor *)self->_peoplePickerDomainAccessor domain];
    [(NPSManager *)syncManager synchronizeNanoDomain:v7 keys:v12];

    if (!self->_activePairedWatchRequiresLegacyKeys)
    {
      id v8 = self->_syncManager;
      uint64_t v9 = [(NPSDomainAccessor *)self->_foundationDomainAccessor domain];
      [(NPSManager *)v8 synchronizeNanoDomain:v9 keys:v5];
    }
  }
  else
  {
    [(NPSManager *)self->_syncManager synchronizeUserDefaultsDomain:@"com.apple.PeoplePicker" keys:v12];
    if (!self->_activePairedWatchRequiresLegacyKeys) {
      [(NPSManager *)self->_syncManager synchronizeUserDefaultsDomain:NSPersonNameDefaultNamePreferencesDomain keys:v5];
    }
  }
  if (self->_activePairedWatchRequiresLegacyKeys)
  {
    CFStringRef v10 = objc_opt_class();
    v11 = [(NCABSettingsPairedController *)self foundationKeysAndValuesUsingDomainAccessor:v3];
    [v10 mapFoundationPreferenceKeysAndValues:v11 toLegacyDomainAccessor:self->_peoplePickerDomainAccessor withSyncManager:self->_syncManager];
  }
}

+ (id)peoplePickerKeys
{
  if (qword_C690 != -1) {
    dispatch_once(&qword_C690, &stru_8290);
  }
  v2 = (void *)qword_C688;

  return v2;
}

+ (id)foundationKeys
{
  if (qword_C6A0 != -1) {
    dispatch_once(&qword_C6A0, &stru_82B0);
  }
  v2 = (void *)qword_C698;

  return v2;
}

- (id)foundationKeysAndValuesUsingDomainAccessor:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = NSPersonNameDefaultDisplayNameOrderKey;
    id v5 = [(NPSDomainAccessor *)self->_foundationDomainAccessor objectForKey:NSPersonNameDefaultDisplayNameOrderKey];
    if (v5) {
      id v6 = [(NPSDomainAccessor *)self->_foundationDomainAccessor integerForKey:v4];
    }
    else {
      id v6 = +[NSPersonNameComponentsFormatter _defaultDisplayNameOrder];
    }
    id v7 = v6;

    uint64_t v11 = NSPersonNameDefaultShortNameEnabledKey;
    v14 = [(NPSDomainAccessor *)self->_foundationDomainAccessor objectForKey:NSPersonNameDefaultShortNameEnabledKey];
    if (v14) {
      id v15 = [(NPSDomainAccessor *)self->_foundationDomainAccessor BOOLForKey:v11];
    }
    else {
      id v15 = +[NSPersonNameComponentsFormatter _shortNameIsEnabled];
    }
    id v8 = v15;

    uint64_t v12 = NSPersonNameDefaultShortNameFormatKey;
    v16 = [(NPSDomainAccessor *)self->_foundationDomainAccessor objectForKey:NSPersonNameDefaultShortNameFormatKey];
    if (v16) {
      id v17 = [(NPSDomainAccessor *)self->_foundationDomainAccessor integerForKey:v12];
    }
    else {
      id v17 = +[NSPersonNameComponentsFormatter _defaultShortNameFormat];
    }
    id v9 = v17;

    uint64_t v13 = NSPersonNameDefaultShouldPreferNicknamesKey;
    v18 = [(NPSDomainAccessor *)self->_foundationDomainAccessor objectForKey:NSPersonNameDefaultShouldPreferNicknamesKey];
    if (v18) {
      id v19 = [(NPSDomainAccessor *)self->_foundationDomainAccessor BOOLForKey:v13];
    }
    else {
      id v19 = +[NSPersonNameComponentsFormatter _shouldPreferNicknames];
    }
    id v10 = v19;
  }
  else
  {
    id v7 = +[NSPersonNameComponentsFormatter _defaultDisplayNameOrder];
    id v8 = +[NSPersonNameComponentsFormatter _shortNameIsEnabled];
    id v9 = +[NSPersonNameComponentsFormatter _defaultShortNameFormat];
    id v10 = +[NSPersonNameComponentsFormatter _shouldPreferNicknames];
    uint64_t v4 = NSPersonNameDefaultDisplayNameOrderKey;
    uint64_t v11 = NSPersonNameDefaultShortNameEnabledKey;
    uint64_t v12 = NSPersonNameDefaultShortNameFormatKey;
    uint64_t v13 = NSPersonNameDefaultShouldPreferNicknamesKey;
  }
  v26[0] = v4;
  v20 = +[NSNumber numberWithInteger:v7];
  v27[0] = v20;
  v26[1] = v11;
  v21 = +[NSNumber numberWithBool:v8];
  v27[1] = v21;
  v26[2] = v12;
  v22 = +[NSNumber numberWithInteger:v9];
  v27[2] = v22;
  v26[3] = v13;
  v23 = +[NSNumber numberWithBool:v10];
  v27[3] = v23;
  CFStringRef v24 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];

  return v24;
}

- (id)_getValueForKey:(id)a3 inDomainAccessor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 synchronize];
  id v8 = [v5 objectForKey:v6];

  return v8;
}

- (void)_setValue:(id)a3 forKey:(id)a4 inDomainAccessor:(id)a5 syncWithClient:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [v12 setObject:v10 forKey:v11];
  id v13 = [v12 synchronize];
  if (v6)
  {
    syncManager = self->_syncManager;
    id v15 = [v12 domain];
    v16 = +[NSSet setWithObject:v11];
    [(NPSManager *)syncManager synchronizeNanoDomain:v15 keys:v16];

    if (self->_activePairedWatchRequiresLegacyKeys)
    {
      id v17 = [(id)objc_opt_class() foundationKeys];
      unsigned int v18 = [v17 containsObject:v11];

      if (v18)
      {
        id v19 = objc_opt_class();
        id v21 = v11;
        id v22 = v10;
        v20 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        [v19 mapFoundationPreferenceKeysAndValues:v20 toLegacyDomainAccessor:self->_peoplePickerDomainAccessor withSyncManager:self->_syncManager];
      }
    }
  }
}

+ (void)mapFoundationPreferenceKeysAndValues:(id)a3 toLegacyDomainAccessor:(id)a4 withSyncManager:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = +[NSMutableSet set];
  id v11 = +[NSPersonNameComponentsFormatterPreferences mappedPreferencesForPreferences:v9 from:0 to:2];

  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  unsigned int v18 = sub_5790;
  id v19 = &unk_82D8;
  id v20 = v7;
  id v21 = v10;
  id v12 = v10;
  id v13 = v7;
  [v11 enumerateKeysAndObjectsUsingBlock:&v16];
  id v14 = objc_msgSend(v13, "synchronize", v16, v17, v18, v19);
  id v15 = [v13 domain];
  [v8 synchronizeNanoDomain:v15 keys:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundationDomainAccessor, 0);
  objc_storeStrong((id *)&self->_peoplePickerDomainAccessor, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_personNameOrderSpecifier, 0);

  objc_storeStrong((id *)&self->_contactsSortOrderSpecifier, 0);
}

@end