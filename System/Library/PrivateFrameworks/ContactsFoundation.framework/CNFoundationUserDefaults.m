@interface CNFoundationUserDefaults
+ (id)makeRegisteredDefaults;
+ (id)registeredDefaults;
+ (id)sharedDefaults;
+ (unint64_t)_convertNSNameOrderToCNNameOrder:(int64_t)a3;
- (BOOL)isShortNameFormatEnabled;
- (BOOL)preferNickname;
- (CNFoundationUserDefaults)init;
- (CNUserDefaults)userDefaults;
- (NSDictionary)filteredAccountsAndContainers;
- (id)countryCode;
- (unint64_t)nameOrder;
- (unint64_t)newContactNameOrder;
- (unint64_t)shortNameFormat;
- (unint64_t)sortOrder;
- (void)setFilteredAccountsAndContainers:(id)a3;
- (void)setNameOrder:(unint64_t)a3;
- (void)setPreferNickname:(BOOL)a3;
- (void)setShortNameFormat:(unint64_t)a3;
- (void)setShortNameFormatEnabled:(BOOL)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation CNFoundationUserDefaults

+ (id)makeRegisteredDefaults
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"LocalizedDefaults" ofType:@"plist"];

  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v3];

  return v4;
}

+ (id)registeredDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CNFoundationUserDefaults_registeredDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (registeredDefaults_cn_once_token_2 != -1) {
    dispatch_once(&registeredDefaults_cn_once_token_2, block);
  }
  v2 = (void *)registeredDefaults_cn_once_object_2;

  return v2;
}

void __46__CNFoundationUserDefaults_registeredDefaults__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) makeRegisteredDefaults];
  uint64_t v1 = [v3 copy];
  v2 = (void *)registeredDefaults_cn_once_object_2;
  registeredDefaults_cn_once_object_2 = v1;
}

+ (id)sharedDefaults
{
  if (sharedDefaults_cn_once_token_3 != -1) {
    dispatch_once(&sharedDefaults_cn_once_token_3, &__block_literal_global_59);
  }
  v2 = (void *)sharedDefaults_cn_once_object_3;

  return v2;
}

uint64_t __42__CNFoundationUserDefaults_sharedDefaults__block_invoke()
{
  v0 = objc_alloc_init(CNFoundationUserDefaults);
  uint64_t v1 = sharedDefaults_cn_once_object_3;
  sharedDefaults_cn_once_object_3 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (CNFoundationUserDefaults)init
{
  v9.receiver = self;
  v9.super_class = (Class)CNFoundationUserDefaults;
  v2 = [(CNFoundationUserDefaults *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[CNUserDefaults preferencesWithApplicationID:@"com.apple.AddressBook"];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (CNUserDefaults *)v3;

    v5 = v2->_userDefaults;
    v6 = [(id)objc_opt_class() registeredDefaults];
    [(CNUserDefaults *)v5 registerDefaults:v6];

    v7 = v2;
  }

  return v2;
}

- (unint64_t)newContactNameOrder
{
  [MEMORY[0x1E4F1CA00] raise:@"MethodNotImplemented", @"You shouldn't have hit that, CNFoundationUserDefaults on iOS shouldn't be used directly, use CNContactsUserDefaults instead" format];
  int64_t v3 = [(CNUserDefaults *)self->_userDefaults integerForKey:@"ABNewContactNameDisplay"];
  if (v3 == 2) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }

  return [(CNFoundationUserDefaults *)self nameOrder];
}

- (unint64_t)sortOrder
{
  [MEMORY[0x1E4F1CA00] raise:@"MethodNotImplemented", @"You shouldn't have hit that, CNFoundationUserDefaults on iOS shouldn't be used directly, use CNContactsUserDefaults instead" format];
  int64_t v3 = [(CNUserDefaults *)self->_userDefaults objectForKey:@"ABNameSortingFormat"];
  uint64_t v4 = [v3 rangeOfString:@"firstName" options:1];
  unint64_t v5 = v4 >= [v3 rangeOfString:@"lastName" options:1];

  return v5;
}

- (id)countryCode
{
  [MEMORY[0x1E4F1CA00] raise:@"MethodNotImplemented", @"You shouldn't have hit that, CNFoundationUserDefaults on iOS shouldn't be used directly, use CNContactsUserDefaults instead" format];
  userDefaults = self->_userDefaults;

  return [(CNUserDefaults *)userDefaults objectForKey:@"ABDefaultAddressCountryCode"];
}

- (unint64_t)nameOrder
{
  return 1;
}

- (void)setNameOrder:(unint64_t)a3
{
}

- (BOOL)preferNickname
{
  return 0;
}

- (void)setPreferNickname:(BOOL)a3
{
}

+ (unint64_t)_convertNSNameOrderToCNNameOrder:(int64_t)a3
{
  return a3 == 2;
}

- (unint64_t)shortNameFormat
{
  return 0;
}

- (void)setShortNameFormat:(unint64_t)a3
{
}

- (void)setShortNameFormatEnabled:(BOOL)a3
{
}

- (BOOL)isShortNameFormatEnabled
{
  return 0;
}

- (NSDictionary)filteredAccountsAndContainers
{
  v2 = [(CNFoundationUserDefaults *)self userDefaults];
  int64_t v3 = [v2 objectForKey:@"CNDefaultsFilteredAccountsAndContainersKey"];

  return (NSDictionary *)v3;
}

- (void)setFilteredAccountsAndContainers:(id)a3
{
  id v4 = a3;
  id v5 = [(CNFoundationUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"CNDefaultsFilteredAccountsAndContainersKey"];
}

- (CNUserDefaults)userDefaults
{
  return (CNUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end