@interface HFStateRestorationSettings
+ (HFStateRestorationSettings)sharedInstance;
- (HFStateRestorationSettings)init;
- (NSHashTable)observers;
- (NSString)selectedHomeAppTabIdentifier;
- (NSUUID)selectedHomeIdentifier;
- (NSUUID)selectedRoomIdentifierForSelectedHome;
- (id)_homeAppPreferencesValueForKey:(id)a3 ofClass:(Class)a4;
- (id)_roomKeyForHomeIdentifier:(id)a3;
- (id)selectedRoomIdentifierForHomeIdentifier:(id)a3;
- (int)notifyRegistrationToken;
- (void)_selectedHomeDidChange;
- (void)_setHomeAppPreferencesValue:(id)a3 forKey:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)saveSelectedRoomIdentifier:(id)a3 forHomeIdentifier:(id)a4;
- (void)setSelectedHomeAppTabIdentifier:(id)a3;
- (void)setSelectedHomeIdentifier:(id)a3;
- (void)syncToNanoPrefs;
@end

@implementation HFStateRestorationSettings

- (void)setSelectedHomeIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = HFLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 UUIDString];
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Saving home identifier %@", (uint8_t *)&v7, 0xCu);
  }
  v6 = [v3 UUIDString];
  CFPreferencesSetAppValue(@"HFSelectedHomeKey", v6, @"com.apple.sync.NanoHome");

  CFPreferencesAppSynchronize(@"com.apple.sync.NanoHome");
  notify_post("HFHomeSyncPreferencesDidChange");
}

- (NSString)selectedHomeAppTabIdentifier
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(HFStateRestorationSettings *)self _homeAppPreferencesValueForKey:@"HOLastSelectedTab" ofClass:v3];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFStateRestorationSettings *)self observers];
  [v5 addObject:v4];
}

void __34__HFStateRestorationSettings_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _selectedHomeDidChange];
}

- (void)_selectedHomeDidChange
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HFStateRestorationSettings *)self selectedHomeIdentifier];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(HFStateRestorationSettings *)self observers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 stateRestorationSettings:self selectedHomeIdentifierDidUpdateExternally:v3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (id)_homeAppPreferencesValueForKey:(id)a3 ofClass:(Class)a4
{
  id v4 = (id)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.Home");
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

+ (HFStateRestorationSettings)sharedInstance
{
  if (_MergedGlobals_259 != -1) {
    dispatch_once(&_MergedGlobals_259, &__block_literal_global_16_5);
  }
  v2 = (void *)qword_26AB2F168;
  return (HFStateRestorationSettings *)v2;
}

- (NSUUID)selectedHomeIdentifier
{
  CFPreferencesAppSynchronize(@"com.apple.sync.NanoHome");
  v2 = (void *)CFPreferencesCopyAppValue(@"HFSelectedHomeKey", @"com.apple.sync.NanoHome");
  if (v2) {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return (NSUUID *)v3;
}

uint64_t __44__HFStateRestorationSettings_sharedInstance__block_invoke_2()
{
  v0 = objc_alloc_init(HFStateRestorationSettings);
  uint64_t v1 = qword_26AB2F168;
  qword_26AB2F168 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFStateRestorationSettings)init
{
  v11.receiver = self;
  v11.super_class = (Class)HFStateRestorationSettings;
  v2 = [(HFStateRestorationSettings *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    objc_initWeak(&location, v2);
    uint64_t v5 = MEMORY[0x263EF83A0];
    id v6 = MEMORY[0x263EF83A0];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __34__HFStateRestorationSettings_init__block_invoke;
    v8[3] = &unk_26408DD70;
    objc_copyWeak(&v9, &location);
    notify_register_dispatch("HFHomeSyncPreferencesDidChange", &v2->_notifyRegistrationToken, v5, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  notify_cancel([(HFStateRestorationSettings *)self notifyRegistrationToken]);
  v3.receiver = self;
  v3.super_class = (Class)HFStateRestorationSettings;
  [(HFStateRestorationSettings *)&v3 dealloc];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFStateRestorationSettings *)self observers];
  [v5 removeObject:v4];
}

- (NSUUID)selectedRoomIdentifierForSelectedHome
{
  objc_super v3 = [(HFStateRestorationSettings *)self selectedHomeIdentifier];
  id v4 = [(HFStateRestorationSettings *)self selectedRoomIdentifierForHomeIdentifier:v3];

  return (NSUUID *)v4;
}

- (id)selectedRoomIdentifierForHomeIdentifier:(id)a3
{
  id v4 = [(HFStateRestorationSettings *)self _roomKeyForHomeIdentifier:a3];
  id v5 = [(HFStateRestorationSettings *)self _homeAppPreferencesValueForKey:v4 ofClass:objc_opt_class()];
  if (v5) {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)saveSelectedRoomIdentifier:(id)a3 forHomeIdentifier:(id)a4
{
  id v6 = a3;
  id v8 = [(HFStateRestorationSettings *)self _roomKeyForHomeIdentifier:a4];
  uint64_t v7 = [v6 UUIDString];

  [(HFStateRestorationSettings *)self _setHomeAppPreferencesValue:v7 forKey:v8];
}

- (id)_roomKeyForHomeIdentifier:(id)a3
{
  objc_super v3 = NSString;
  id v4 = [a3 UUIDString];
  id v5 = [v3 stringWithFormat:@"%@%@", v4, @"-selectedRoom"];

  return v5;
}

- (void)setSelectedHomeAppTabIdentifier:(id)a3
{
}

- (void)syncToNanoPrefs
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  objc_super v3 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"HFSelectedHomeKey";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v5 = [v3 setWithArray:v4];
  [v2 synchronizeUserDefaultsDomain:@"com.apple.sync.NanoHome" keys:v5];
}

- (void)_setHomeAppPreferencesValue:(id)a3 forKey:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (__CFString *)a4;
  uint64_t v7 = HFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Updating value for Home.app preference %@ to: %@", (uint8_t *)&v8, 0x16u);
  }

  CFPreferencesSetAppValue(v6, v5, @"com.apple.Home");
}

- (int)notifyRegistrationToken
{
  return self->_notifyRegistrationToken;
}

- (void).cxx_destruct
{
}

@end