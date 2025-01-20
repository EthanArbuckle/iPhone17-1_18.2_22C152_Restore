@interface LSMarketplacesPreferences
+ (id)currentPreferencesWithError:(id *)a3;
+ (id)modifyPreferencesWithBlock:;
+ (id)modifyPreferencesWithBlock:(id)a3;
+ (uint64_t)modifyPreferencesWithBlock:;
+ (void)modifyPreferencesWithBlock:;
- (LSMarketplacesPreferences)init;
- (LSMarketplacesPreferences)initWithValidatedPlist:(id)a3;
- (NSArray)preferredMarketplaces;
- (id)toPlist;
- (void)setPreferredMarketplaces:(id)a3;
@end

@implementation LSMarketplacesPreferences

- (NSArray)preferredMarketplaces
{
  return self->_preferredMarketplaces;
}

+ (id)currentPreferencesWithError:(id *)a3
{
  if (marketplacesPreferencesStatePlist(void)::onceToken != -1) {
    dispatch_once(&marketplacesPreferencesStatePlist(void)::onceToken, &__block_literal_global_51);
  }
  id v11 = 0;
  v5 = LaunchServices::LSStatePlist::read(marketplacesPreferencesStatePlist(void)::sharedPlist, &v11);
  id v6 = v11;
  v7 = v6;
  if (v5)
  {
    id v8 = (id)[objc_alloc((Class)a1) initWithValidatedPlist:v5];
LABEL_7:
    v9 = v8;
    goto LABEL_8;
  }
  if (_LSNSErrorIsFNFError(v6))
  {
    id v8 = objc_alloc_init((Class)a1);
    goto LABEL_7;
  }
  v9 = 0;
  if (a3) {
    *a3 = v7;
  }
LABEL_8:

  return v9;
}

- (LSMarketplacesPreferences)initWithValidatedPlist:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"preferredMarketplaces"];
  v10.receiver = self;
  v10.super_class = (Class)LSMarketplacesPreferences;
  id v6 = [(LSMarketplacesPreferences *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    preferredMarketplaces = v6->_preferredMarketplaces;
    v6->_preferredMarketplaces = (NSArray *)v7;
  }
  return v6;
}

- (void).cxx_destruct
{
}

- (LSMarketplacesPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)LSMarketplacesPreferences;
  v2 = [(LSMarketplacesPreferences *)&v6 init];
  v3 = v2;
  if (v2)
  {
    preferredMarketplaces = v2->_preferredMarketplaces;
    v2->_preferredMarketplaces = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (id)toPlist
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"version";
  v5[1] = @"preferredMarketplaces";
  preferredMarketplaces = self->_preferredMarketplaces;
  v6[0] = &unk_1ECB43930;
  v6[1] = preferredMarketplaces;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (id)modifyPreferencesWithBlock:(id)a3
{
  v10[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = marketplacesPreferencesStatePlist(void)::onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&marketplacesPreferencesStatePlist(void)::onceToken, &__block_literal_global_51);
  }
  uint64_t v6 = marketplacesPreferencesStatePlist(void)::sharedPlist;
  uint64_t v7 = MEMORY[0x18530F950](v5);

  v10[0] = &unk_1ECB19DB0;
  v10[1] = a1;
  v10[2] = v7;
  v10[3] = v10;
  id v8 = LaunchServices::LSStatePlist::modify(v6, (uint64_t)v10);
  std::__function::__value_func<objc_object * ()(objc_object *,NSError *)>::~__value_func[abi:nn180100](v10);

  return v8;
}

- (void)setPreferredMarketplaces:(id)a3
{
}

+ (uint64_t)modifyPreferencesWithBlock:
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  *a2 = &unk_1ECB19DB0;
  a2[1] = v4;
  uint64_t result = MEMORY[0x18530F950](v3);
  a2[2] = result;
  return result;
}

+ (void)modifyPreferencesWithBlock:
{
  operator delete(a1);
}

+ (id)modifyPreferencesWithBlock:
{
  uint64_t v4 = *a3;
  id v5 = *a2;
  id v6 = v4;
  uint64_t v7 = *(objc_class **)(a1 + 8);
  if (v5) {
    id v8 = (id)[[v7 alloc] initWithValidatedPlist:v5];
  }
  else {
    id v8 = objc_alloc_init(v7);
  }
  v9 = v8;
  (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
  objc_super v10 = [v9 toPlist];

  return v10;
}

@end