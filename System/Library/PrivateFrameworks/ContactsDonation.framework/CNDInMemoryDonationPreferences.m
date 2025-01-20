@interface CNDInMemoryDonationPreferences
+ (id)observableWithPreferences:(id)a3 notificationCenter:(id)a4 schedulerProvider:(id)a5;
- (BOOL)isDonationsEnabled;
- (void)setDonationsEnabled:(BOOL)a3;
@end

@implementation CNDInMemoryDonationPreferences

+ (id)observableWithPreferences:(id)a3 notificationCenter:(id)a4 schedulerProvider:(id)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = (void *)MEMORY[0x263F33608];
  id v9 = a5;
  v10 = [v8 observableOnNotificationCenter:a4 withName:@"CNDDonationsEnabledPreferencesKey" object:0];
  v11 = [MEMORY[0x263EFF9D0] null];
  v21[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  v13 = [v9 backgroundScheduler];

  v14 = [v10 startWith:v12 scheduler:v13];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __97__CNDInMemoryDonationPreferences_observableWithPreferences_notificationCenter_schedulerProvider___block_invoke;
  v19[3] = &unk_2641FC688;
  id v20 = v7;
  id v15 = v7;
  v16 = [v14 map:v19];
  v17 = [v16 distinctUntilChanged];

  return v17;
}

uint64_t __97__CNDInMemoryDonationPreferences_observableWithPreferences_notificationCenter_schedulerProvider___block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  uint64_t v2 = [*(id *)(a1 + 32) isDonationsEnabled];

  return [v1 numberWithBool:v2];
}

- (BOOL)isDonationsEnabled
{
  return self->_donationsEnabled;
}

- (void)setDonationsEnabled:(BOOL)a3
{
  self->_donationsEnabled = a3;
}

@end