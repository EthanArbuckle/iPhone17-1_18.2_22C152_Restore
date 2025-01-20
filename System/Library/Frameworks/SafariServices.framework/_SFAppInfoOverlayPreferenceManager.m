@interface _SFAppInfoOverlayPreferenceManager
- (WBSPerSitePreference)appInfoOverlayPreference;
- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore;
- (_SFAppInfoOverlayPreferenceManager)init;
- (_SFAppInfoOverlayPreferenceManager)initWithPerSitePreferencesStore:(id)a3;
- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3;
- (id)localizedStringForValue:(id)a3 inPreference:(id)a4;
- (id)offValueForPreference:(id)a3;
- (id)onValueForPreference:(id)a3;
- (id)preferenceNameForPreference:(id)a3;
- (id)preferences;
- (id)valuesForPreference:(id)a3;
- (int64_t)_defaultPreferenceValue;
- (void)getAppInfoOverlayPreferenceForDomain:(id)a3 completionHandler:(id)a4;
- (void)setAppInfoOverlayPreferenceForDomain:(id)a3 settings:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation _SFAppInfoOverlayPreferenceManager

- (_SFAppInfoOverlayPreferenceManager)init
{
  return 0;
}

- (_SFAppInfoOverlayPreferenceManager)initWithPerSitePreferencesStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFAppInfoOverlayPreferenceManager;
  v6 = [(_SFAppInfoOverlayPreferenceManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_perSitePreferencesStore, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F98CC8]) initWithIdentifier:@"AppInfoOverlayPreference"];
    appInfoOverlayPreference = v7->_appInfoOverlayPreference;
    v7->_appInfoOverlayPreference = (WBSPerSitePreference *)v8;

    [(WBSPerSitePreferenceManager *)v7 setStorageDelegate:v7];
    [(WBSPerSitePreferenceManager *)v7 setDefaultsDelegate:v7];
    v10 = v7;
  }

  return v7;
}

- (void)getAppInfoOverlayPreferenceForDomain:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    uint64_t v8 = [MEMORY[0x1E4F98CD0] timeoutWithInterval:&unk_1EFBDEBC0 fallbackValue:0.5];
    appInfoOverlayPreference = self->_appInfoOverlayPreference;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __93___SFAppInfoOverlayPreferenceManager_getAppInfoOverlayPreferenceForDomain_completionHandler___block_invoke;
    v10[3] = &unk_1E5C74298;
    id v11 = v7;
    [(WBSPerSitePreferenceManager *)self getValueOfPreference:appInfoOverlayPreference forDomain:v6 withTimeout:v8 usingBlock:v10];
  }
  else
  {
    (*((void (**)(id, int64_t, uint64_t))v7 + 2))(v7, [(_SFAppInfoOverlayPreferenceManager *)self _defaultPreferenceValue], 1);
  }
}

- (void)setAppInfoOverlayPreferenceForDomain:(id)a3 settings:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v8 = NSNumber;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 numberWithInteger:a4];
  [(WBSPerSitePreferenceManager *)self setValue:v11 ofPreference:self->_appInfoOverlayPreference forDomain:v10 completionHandler:v9];
}

- (int64_t)_defaultPreferenceValue
{
  return 1;
}

- (id)preferences
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_appInfoOverlayPreference;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)valuesForPreference:(id)a3
{
  return &unk_1EFBDF8C8;
}

- (id)localizedStringForValue:(id)a3 inPreference:(id)a4
{
  id v6 = NSNumber;
  id v7 = a3;
  uint64_t v8 = [(_SFAppInfoOverlayPreferenceManager *)self onValueForPreference:a4];
  uint64_t v9 = [v7 isEqual:v8];

  id v10 = [v6 numberWithBool:v9];

  id v11 = [MEMORY[0x1E4F98CC8] localizedStringForBinaryPreferenceValue:v10];

  return v11;
}

- (WBSPerSitePreferencesSQLiteStore)perSitePreferencesStore
{
  return self->_perSitePreferencesStore;
}

- (id)preferenceNameForPreference:(id)a3
{
  return (id)*MEMORY[0x1E4F99388];
}

- (id)defaultPreferenceValueForPreferenceIfNotCustomized:(id)a3
{
  v3 = NSNumber;
  int64_t v4 = [(_SFAppInfoOverlayPreferenceManager *)self _defaultPreferenceValue];

  return (id)[v3 numberWithInteger:v4];
}

- (id)onValueForPreference:(id)a3
{
  return &unk_1EFBDEBC0;
}

- (id)offValueForPreference:(id)a3
{
  return &unk_1EFBDEBD8;
}

- (WBSPerSitePreference)appInfoOverlayPreference
{
  return self->_appInfoOverlayPreference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInfoOverlayPreference, 0);

  objc_storeStrong((id *)&self->_perSitePreferencesStore, 0);
}

@end