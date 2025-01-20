@interface _SFRequestDesktopSitePreferenceManager
- (BOOL)clientPrefersMobileUserAgentByDefault;
- (WBSPerSitePreference)requestDesktopSitePreference;
- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore;
- (_SFRequestDesktopSitePreferenceManager)init;
- (_SFRequestDesktopSitePreferenceManager)initWithPerSitePreferencesStore:(id)a3 quirksManager:(id)a4;
- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3;
- (id)localizedStringForValue:(id)a3 inPreference:(id)a4;
- (id)offValueForPreference:(id)a3;
- (id)onValueForPreference:(id)a3;
- (id)preferenceNameForPreference:(id)a3;
- (id)preferences;
- (id)valuesForPreference:(id)a3;
- (int64_t)_defaultPreferenceValue;
- (void)_notifyObserversOfPerSitePreferenceDefaultValueUpdate;
- (void)_notifyObserversOfPerSitePreferenceDomainValuesUpdate;
- (void)_requestDesktopSitePerSitePreferenceDidChange:(id)a3;
- (void)addRequestDesktopSitePerSitePreferenceObserver:(id)a3;
- (void)dealloc;
- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5;
- (void)getAllDomainsConfiguredForPreference:(id)a3 usingBlock:(id)a4;
- (void)getAllRequestDesktopSitePerSitePreferenceValues:(id)a3;
- (void)getDefaultPreferenceValueForPreference:(id)a3 completionHandler:(id)a4;
- (void)getDefaultPreferenceValueIfNotCustomizedForPreference:(id)a3 domain:(id)a4 completionHandler:(id)a5;
- (void)getRequestDesktopSitePreferenceForDomain:(id)a3 withTimeout:(double)a4 completionHandler:(id)a5;
- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6;
- (void)removeRequestDesktopSitePerSitePreferenceObserver:(id)a3;
- (void)setClientPrefersMobileUserAgentByDefault:(BOOL)a3;
@end

@implementation _SFRequestDesktopSitePreferenceManager

- (id)preferenceNameForPreference:(id)a3
{
  return (id)*MEMORY[0x1E4F99390];
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  v3 = NSNumber;
  int64_t v4 = [(_SFRequestDesktopSitePreferenceManager *)self _defaultPreferenceValue];

  return (id)[v3 numberWithInteger:v4];
}

- (int64_t)_defaultPreferenceValue
{
  return _SFDeviceSupportsDesktopSitesByDefault() && !self->_clientPrefersMobileUserAgentByDefault;
}

- (_SFRequestDesktopSitePreferenceManager)initWithPerSitePreferencesStore:(id)a3 quirksManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_SFRequestDesktopSitePreferenceManager;
  v9 = [(_SFRequestDesktopSitePreferenceManager *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_perSitePreferencesStore, a3);
    id v11 = objc_alloc(MEMORY[0x1E4F98CC8]);
    uint64_t v12 = [v11 initWithIdentifier:*MEMORY[0x1E4F99438]];
    requestDesktopSitePreference = v10->_requestDesktopSitePreference;
    v10->_requestDesktopSitePreference = (WBSPerSitePreference *)v12;

    objc_storeStrong((id *)&v10->_quirksManager, a4);
    [(WBSPerSitePreferenceManager *)v10 setStorageDelegate:v10];
    [(WBSPerSitePreferenceManager *)v10 setDefaultsDelegate:v10];
    v14 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v14 addObserver:v10 selector:sel__requestDesktopSitePerSitePreferenceDidChange_ name:@"com.apple.SafariServices.RequestDesktopSitePerSitePreferenceDidChange" object:0];

    v15 = v10;
  }

  return v10;
}

- (void)addRequestDesktopSitePerSitePreferenceObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F1CA80] set];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSMutableSet *)observers addObject:v4];
}

- (WBSPerSitePreference)requestDesktopSitePreference
{
  return self->_requestDesktopSitePreference;
}

- (void)getDefaultPreferenceValueForPreference:(id)a3 completionHandler:(id)a4
{
  if (self->_clientPrefersMobileUserAgentByDefault)
  {
    v5 = (void (**)(id, id))a4;
    v6 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_SFRequestDesktopSitePreferenceManager getDefaultPreferenceValueForPreference:completionHandler:](v6);
    }
    objc_msgSend(NSNumber, "numberWithInteger:", -[_SFRequestDesktopSitePreferenceManager _defaultPreferenceValue](self, "_defaultPreferenceValue"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_SFRequestDesktopSitePreferenceManager;
    id v7 = a4;
    [(WBSPerSitePreferenceManager *)&v9 getDefaultPreferenceValueForPreference:a3 completionHandler:v7];
  }
}

- (void)getAllRequestDesktopSitePerSitePreferenceValues:(id)a3
{
  id v4 = a3;
  perSitePreferencesStore = self->_perSitePreferencesStore;
  uint64_t v6 = *MEMORY[0x1E4F99390];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90___SFRequestDesktopSitePreferenceManager_getAllRequestDesktopSitePerSitePreferenceValues___block_invoke;
  v8[3] = &unk_1E5C75D58;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(WBSPerSitePreferencesSQLiteStore *)perSitePreferencesStore getAllPreferenceInformationForPreference:v6 completionHandler:v8];
}

- (_SFRequestDesktopSitePreferenceManager)init
{
  return 0;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_SFRequestDesktopSitePreferenceManager;
  [(_SFRequestDesktopSitePreferenceManager *)&v4 dealloc];
}

- (void)removeRequestDesktopSitePerSitePreferenceObserver:(id)a3
{
}

- (void)getRequestDesktopSitePreferenceForDomain:(id)a3 withTimeout:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 length])
  {
    requestDesktopSitePreference = self->_requestDesktopSitePreference;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __113___SFRequestDesktopSitePreferenceManager_getRequestDesktopSitePreferenceForDomain_withTimeout_completionHandler___block_invoke;
    v11[3] = &unk_1E5C75CE0;
    v11[4] = self;
    id v12 = v8;
    double v14 = a4;
    id v13 = v9;
    [(_SFRequestDesktopSitePreferenceManager *)self getDefaultPreferenceValueIfNotCustomizedForPreference:requestDesktopSitePreference domain:v12 completionHandler:v11];
  }
  else
  {
    (*((void (**)(id, int64_t, uint64_t))v9 + 2))(v9, [(_SFRequestDesktopSitePreferenceManager *)self _defaultPreferenceValue], 1);
  }
}

- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeout:(id)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96___SFRequestDesktopSitePreferenceManager_getValueOfPreference_forDomain_withTimeout_usingBlock___block_invoke;
  v17[3] = &unk_1E5C75D30;
  id v18 = v11;
  v19 = self;
  id v20 = v10;
  id v21 = v12;
  v16.receiver = self;
  v16.super_class = (Class)_SFRequestDesktopSitePreferenceManager;
  id v13 = v10;
  id v14 = v11;
  id v15 = v12;
  [(WBSPerSitePreferenceManager *)&v16 getValueOfPreference:v13 forDomain:v14 withTimeout:a5 usingBlock:v17];
}

- (void)getAllDomainsConfiguredForPreference:(id)a3 usingBlock:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)_SFRequestDesktopSitePreferenceManager;
  [(WBSPerSitePreferenceManager *)&v4 getAllDomainsConfiguredForPreference:a3 usingBlock:a4];
}

- (void)didUpdatePreference:(id)a3 toValue:(id)a4 forDomain:(id)a5
{
  if ([(NSMutableSet *)self->_observers count])
  {
    [(_SFRequestDesktopSitePreferenceManager *)self _notifyObserversOfPerSitePreferenceDomainValuesUpdate];
  }
}

- (void)_requestDesktopSitePerSitePreferenceDidChange:(id)a3
{
  [(_SFRequestDesktopSitePreferenceManager *)self _notifyObserversOfPerSitePreferenceDefaultValueUpdate];

  [(_SFRequestDesktopSitePreferenceManager *)self _notifyObserversOfPerSitePreferenceDomainValuesUpdate];
}

- (void)_notifyObserversOfPerSitePreferenceDefaultValueUpdate
{
  if ([(NSMutableSet *)self->_observers count])
  {
    objc_initWeak(&location, self);
    requestDesktopSitePreference = self->_requestDesktopSitePreference;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __95___SFRequestDesktopSitePreferenceManager__notifyObserversOfPerSitePreferenceDefaultValueUpdate__block_invoke;
    v4[3] = &unk_1E5C75D80;
    objc_copyWeak(&v5, &location);
    [(_SFRequestDesktopSitePreferenceManager *)self getDefaultPreferenceValueForPreference:requestDesktopSitePreference completionHandler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_notifyObserversOfPerSitePreferenceDomainValuesUpdate
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __95___SFRequestDesktopSitePreferenceManager__notifyObserversOfPerSitePreferenceDomainValuesUpdate__block_invoke;
  v3[3] = &unk_1E5C73AE8;
  objc_copyWeak(&v4, &location);
  [(_SFRequestDesktopSitePreferenceManager *)self getAllRequestDesktopSitePerSitePreferenceValues:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)preferences
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_requestDesktopSitePreference;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1EFBDF910;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  uint64_t v6 = NSNumber;
  id v7 = a3;
  id v8 = [(_SFRequestDesktopSitePreferenceManager *)self onValueForPreference:a4];
  uint64_t v9 = [v7 isEqual:v8];

  id v10 = [v6 numberWithBool:v9];

  id v11 = [MEMORY[0x1E4F98CC8] localizedStringForBinaryPreferenceValue:v10];

  return v11;
}

- (void)getDefaultPreferenceValueIfNotCustomizedForPreference:(id)a3 domain:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  quirksManager = self->_quirksManager;
  if (quirksManager)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __121___SFRequestDesktopSitePreferenceManager_getDefaultPreferenceValueIfNotCustomizedForPreference_domain_completionHandler___block_invoke;
    v10[3] = &unk_1E5C75DA8;
    v10[4] = self;
    id v11 = v7;
    [(_SFRequestDesktopSiteQuirksManager *)quirksManager quirksValueForDomain:a4 completionHandler:v10];
  }
  else
  {
    [(_SFRequestDesktopSitePreferenceManager *)self getDefaultPreferenceValueForPreference:self->_requestDesktopSitePreference completionHandler:v7];
  }
}

- (id)onValueForPreference:(id)a3
{
  return &unk_1EFBDED10;
}

- (id)offValueForPreference:(id)a3
{
  return &unk_1EFBDECF8;
}

- (void)setClientPrefersMobileUserAgentByDefault:(BOOL)a3
{
  if (self->_clientPrefersMobileUserAgentByDefault != a3)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[_SFRequestDesktopSitePreferenceManager setClientPrefersMobileUserAgentByDefault:](a3, v5);
    }
    self->_clientPrefersMobileUserAgentByDefault = a3;
    [(_SFRequestDesktopSitePreferenceManager *)self _notifyObserversOfPerSitePreferenceDefaultValueUpdate];
  }
}

- (BOOL)clientPrefersMobileUserAgentByDefault
{
  return self->_clientPrefersMobileUserAgentByDefault;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDesktopSitePreference, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_quirksManager, 0);

  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

- (void)getDefaultPreferenceValueForPreference:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A690B000, log, OS_LOG_TYPE_DEBUG, "Client can't support Desktop user agent by default, so forcing Mobile default for this client only", v1, 2u);
}

- (void)setClientPrefersMobileUserAgentByDefault:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = @"NO";
  if (a1) {
    v3 = @"YES";
  }
  id v4 = v3;
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_debug_impl(&dword_1A690B000, a2, OS_LOG_TYPE_DEBUG, "Updating client preference for loading Mobile user agent by default: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end