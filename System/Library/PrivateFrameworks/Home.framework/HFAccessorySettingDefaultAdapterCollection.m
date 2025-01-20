@interface HFAccessorySettingDefaultAdapterCollection
- (HFAccessorySettingAdapter)mobileTimerAdapter;
- (HFAccessorySettingManagedConfigurationAdapter)managedConfigurationAdapter;
- (HFAccessorySettingSiriLanguageAdapter)siriLanguageAdapter;
- (NSSet)allAdapters;
- (void)setManagedConfigurationAdapter:(id)a3;
- (void)setMobileTimerAdapter:(id)a3;
- (void)setSiriLanguageAdapter:(id)a3;
@end

@implementation HFAccessorySettingDefaultAdapterCollection

- (NSSet)allAdapters
{
  v3 = [MEMORY[0x263EFF9C0] set];
  v4 = [(HFAccessorySettingDefaultAdapterCollection *)self managedConfigurationAdapter];
  objc_msgSend(v3, "na_safeAddObject:", v4);

  v5 = [(HFAccessorySettingDefaultAdapterCollection *)self mobileTimerAdapter];
  objc_msgSend(v3, "na_safeAddObject:", v5);

  v6 = [(HFAccessorySettingDefaultAdapterCollection *)self siriLanguageAdapter];
  objc_msgSend(v3, "na_safeAddObject:", v6);

  return (NSSet *)v3;
}

- (HFAccessorySettingManagedConfigurationAdapter)managedConfigurationAdapter
{
  return self->_managedConfigurationAdapter;
}

- (void)setManagedConfigurationAdapter:(id)a3
{
}

- (HFAccessorySettingSiriLanguageAdapter)siriLanguageAdapter
{
  return self->_siriLanguageAdapter;
}

- (void)setSiriLanguageAdapter:(id)a3
{
}

- (HFAccessorySettingAdapter)mobileTimerAdapter
{
  return self->_mobileTimerAdapter;
}

- (void)setMobileTimerAdapter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileTimerAdapter, 0);
  objc_storeStrong((id *)&self->_siriLanguageAdapter, 0);
  objc_storeStrong((id *)&self->_managedConfigurationAdapter, 0);
}

@end