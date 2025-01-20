@interface SGContactStoreFactory
+ (id)contactStore;
+ (id)contactStoreWithDonatedContacts;
+ (void)useMockContactStore:(id)a3;
@end

@implementation SGContactStoreFactory

+ (id)contactStore
{
  id WeakRetained = objc_loadWeakRetained(&_mockContactStore);
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    if (contactStore_onceToken != -1) {
      dispatch_once(&contactStore_onceToken, &__block_literal_global_15298);
    }
    v3 = (void *)contactStore__instance;
  }
  id v4 = v3;

  return v4;
}

+ (id)contactStoreWithDonatedContacts
{
  id WeakRetained = objc_loadWeakRetained(&_mockContactStore);
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    if (contactStoreWithDonatedContacts_onceToken != -1) {
      dispatch_once(&contactStoreWithDonatedContacts_onceToken, &__block_literal_global_2);
    }
    v3 = (void *)contactStoreWithDonatedContacts__instance;
  }
  id v4 = v3;

  return v4;
}

void __56__SGContactStoreFactory_contactStoreWithDonatedContacts__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1B980]);
  id v3 = (id)objc_opt_new();
  [v3 setIncludeDonatedContacts:1];
  uint64_t v1 = [v0 initWithConfiguration:v3];
  v2 = (void *)contactStoreWithDonatedContacts__instance;
  contactStoreWithDonatedContacts__instance = v1;
}

uint64_t __37__SGContactStoreFactory_contactStore__block_invoke()
{
  contactStore__instance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (void)useMockContactStore:(id)a3
{
}

@end