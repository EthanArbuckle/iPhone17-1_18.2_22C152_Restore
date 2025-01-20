@interface IAMICPropertyStorage
- (IAMICPropertyStorage)init;
- (void)getPropertyForKey:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5;
- (void)setProperty:(id)a3 forKey:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6;
@end

@implementation IAMICPropertyStorage

- (void)getPropertyForKey:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
}

- (IAMICPropertyStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)IAMICPropertyStorage;
  v2 = [(IAMICPropertyStorage *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F89160] sharedManager];
    iTunesCloudIAMManager = v2->_iTunesCloudIAMManager;
    v2->_iTunesCloudIAMManager = (ICInAppMessageManager *)v3;
  }
  return v2;
}

- (void)setProperty:(id)a3 forKey:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
}

- (void).cxx_destruct
{
}

@end