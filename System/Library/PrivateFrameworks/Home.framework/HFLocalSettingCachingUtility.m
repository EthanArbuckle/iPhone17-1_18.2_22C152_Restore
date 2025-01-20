@interface HFLocalSettingCachingUtility
+ (id)sharedInstance;
- (BOOL)getWelcomeBannerDismissedLocalCachedValue:(id)a3;
- (HFLocalSettingCachingUtility)init;
- (NSMutableDictionary)settingCache;
- (NSUserDefaults)defaults;
- (id)_getValueForSetting:(id)a3;
- (id)_getWelcomeBannerDismissedKey:(id)a3;
- (void)_setValueForSetting:(id)a3 settingValue:(id)a4;
- (void)setDefaults:(id)a3;
- (void)setSettingCache:(id)a3;
- (void)setWelcomeBannerDismissedLocalCachedValue:(BOOL)a3 home:(id)a4;
@end

@implementation HFLocalSettingCachingUtility

uint64_t __46__HFLocalSettingCachingUtility_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HFLocalSettingCachingUtility);
  uint64_t v1 = _MergedGlobals_213;
  _MergedGlobals_213 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFLocalSettingCachingUtility)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFLocalSettingCachingUtility;
  v2 = [(HFLocalSettingCachingUtility *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(HFLocalSettingCachingUtility *)v2 setSettingCache:v3];

    v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [(HFLocalSettingCachingUtility *)v2 setDefaults:v4];
  }
  return v2;
}

- (void)setSettingCache:(id)a3
{
}

- (void)setDefaults:(id)a3
{
}

- (BOOL)getWelcomeBannerDismissedLocalCachedValue:(id)a3
{
  v4 = [(HFLocalSettingCachingUtility *)self _getWelcomeBannerDismissedKey:a3];
  v5 = [(HFLocalSettingCachingUtility *)self _getValueForSetting:v4];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (id)_getWelcomeBannerDismissedKey:(id)a3
{
  id v3 = NSString;
  v4 = [a3 uuid];
  v5 = [v3 stringWithFormat:@"%@:%@", @"root.home.dismissedWelcomeUI", v4];

  return v5;
}

- (id)_getValueForSetting:(id)a3
{
  id v4 = a3;
  v5 = [(HFLocalSettingCachingUtility *)self settingCache];
  char v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    v8 = [(HFLocalSettingCachingUtility *)self defaults];
    v9 = [v8 valueForKey:v4];

    if (v9)
    {
      v10 = [(HFLocalSettingCachingUtility *)self defaults];
      id v7 = [v10 valueForKey:v4];

      v11 = [(HFLocalSettingCachingUtility *)self settingCache];
      [v11 setObject:v7 forKeyedSubscript:v4];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (NSMutableDictionary)settingCache
{
  return self->_settingCache;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

+ (id)sharedInstance
{
  if (qword_26AB2EC38 != -1) {
    dispatch_once(&qword_26AB2EC38, &__block_literal_global_9);
  }
  v2 = (void *)_MergedGlobals_213;
  return v2;
}

- (void)setWelcomeBannerDismissedLocalCachedValue:(BOOL)a3 home:(id)a4
{
  BOOL v4 = a3;
  id v7 = [(HFLocalSettingCachingUtility *)self _getWelcomeBannerDismissedKey:a4];
  char v6 = [NSNumber numberWithBool:v4];
  [(HFLocalSettingCachingUtility *)self _setValueForSetting:v7 settingValue:v6];
}

- (void)_setValueForSetting:(id)a3 settingValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HFLocalSettingCachingUtility *)self defaults];
  [v8 setValue:v6 forKey:v7];

  id v9 = [(HFLocalSettingCachingUtility *)self settingCache];
  [v9 setObject:v6 forKeyedSubscript:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_settingCache, 0);
}

@end