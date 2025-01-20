@interface CNDDonationPreferences
+ (id)observableWithPreferences:(id)a3 notificationCenter:(id)a4 schedulerProvider:(id)a5;
- (BOOL)isDonationsEnabled;
- (CNDDonationPreferences)init;
- (CNDDonationPreferences)initWithNotificationCenter:(id)a3 logger:(id)a4 donationPreferenceCheckingBlock:(id)a5 donationPreferenceSettingBlock:(id)a6;
- (CNDonationPreferencesLogger)logger;
- (NSNotificationCenter)notificationCenter;
- (NSString)description;
- (id)donationPreferenceCheckingBlock;
- (id)donationPreferenceSettingBlock;
- (void)setDonationsEnabled:(BOOL)a3;
@end

@implementation CNDDonationPreferences

- (CNDDonationPreferences)init
{
  v3 = [MEMORY[0x263F087C8] defaultCenter];
  v4 = +[CNDonationLoggerProvider defaultProvider];
  v5 = [v4 preferencesLogger];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __30__CNDDonationPreferences_init__block_invoke;
  v10[3] = &unk_2641FC638;
  v11 = @"com.apple.MobileAddressBook";
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __30__CNDDonationPreferences_init__block_invoke_2;
  v8[3] = &unk_2641FC660;
  v9 = @"com.apple.MobileAddressBook";
  v6 = [(CNDDonationPreferences *)self initWithNotificationCenter:v3 logger:v5 donationPreferenceCheckingBlock:v10 donationPreferenceSettingBlock:v8];

  return v6;
}

uint64_t __30__CNDDonationPreferences_init__block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  v2 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  int v3 = [v2 containsObject:v1];

  return v3 ^ 1u;
}

void __30__CNDDonationPreferences_init__block_invoke_2(uint64_t a1, int a2)
{
  id v8 = *(id *)(a1 + 32);
  int v3 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  v4 = v3;
  if (v3) {
    v5 = (void *)[v3 mutableCopy];
  }
  else {
    v5 = objc_opt_new();
  }
  v6 = v5;
  if (a2)
  {
    [v5 removeObject:v8];
  }
  else if (([v5 containsObject:v8] & 1) == 0)
  {
    [v6 addObject:v8];
  }
  CFPreferencesSetAppValue(@"AppCanShowSiriSuggestionsBlacklist", v6, @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
}

- (CNDDonationPreferences)initWithNotificationCenter:(id)a3 logger:(id)a4 donationPreferenceCheckingBlock:(id)a5 donationPreferenceSettingBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CNDDonationPreferences;
  v15 = [(CNDDonationPreferences *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_notificationCenter, a3);
    objc_storeStrong((id *)&v16->_logger, a4);
    uint64_t v17 = [v13 copy];
    id donationPreferenceCheckingBlock = v16->_donationPreferenceCheckingBlock;
    v16->_id donationPreferenceCheckingBlock = (id)v17;

    uint64_t v19 = [v14 copy];
    id donationPreferenceSettingBlock = v16->_donationPreferenceSettingBlock;
    v16->_id donationPreferenceSettingBlock = (id)v19;

    v21 = v16;
  }

  return v16;
}

- (NSString)description
{
  int v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"donations enabled", -[CNDDonationPreferences isDonationsEnabled](self, "isDonationsEnabled"));
  v5 = [v3 build];

  return (NSString *)v5;
}

- (BOOL)isDonationsEnabled
{
  uint64_t v3 = (*((uint64_t (**)(void))self->_donationPreferenceCheckingBlock + 2))();
  id v4 = [(CNDDonationPreferences *)self logger];
  [v4 isDonationsEnabled:v3];

  return v3;
}

- (void)setDonationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CNDDonationPreferences *)self logger];
  [v5 setDonationsEnabled:v3];

  (*((void (**)(void))self->_donationPreferenceSettingBlock + 2))();
  id v6 = [(CNDDonationPreferences *)self notificationCenter];
  [v6 postNotificationName:@"CNDDonationsEnabledPreferencesKey" object:0];
}

+ (id)observableWithPreferences:(id)a3 notificationCenter:(id)a4 schedulerProvider:(id)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263F33608];
  id v8 = a5;
  v9 = [v7 observableOnDarwinNotificationCenterWithName:@"com.apple.suggestions.settingsChanged"];
  v10 = [MEMORY[0x263EFF9D0] null];
  v20[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  id v12 = [v8 backgroundScheduler];

  id v13 = [v9 startWith:v11 scheduler:v12];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __89__CNDDonationPreferences_observableWithPreferences_notificationCenter_schedulerProvider___block_invoke;
  v18[3] = &unk_2641FC688;
  id v19 = v6;
  id v14 = v6;
  v15 = [v13 map:v18];
  v16 = [v15 distinctUntilChanged];

  return v16;
}

uint64_t __89__CNDDonationPreferences_observableWithPreferences_notificationCenter_schedulerProvider___block_invoke(uint64_t a1)
{
  id v1 = NSNumber;
  uint64_t v2 = [*(id *)(a1 + 32) isDonationsEnabled];

  return [v1 numberWithBool:v2];
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (CNDonationPreferencesLogger)logger
{
  return self->_logger;
}

- (id)donationPreferenceCheckingBlock
{
  return self->_donationPreferenceCheckingBlock;
}

- (id)donationPreferenceSettingBlock
{
  return self->_donationPreferenceSettingBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_donationPreferenceSettingBlock, 0);
  objc_storeStrong(&self->_donationPreferenceCheckingBlock, 0);
  objc_storeStrong((id *)&self->_logger, 0);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end