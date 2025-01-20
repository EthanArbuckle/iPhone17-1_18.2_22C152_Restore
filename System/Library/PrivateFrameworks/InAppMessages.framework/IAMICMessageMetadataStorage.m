@interface IAMICMessageMetadataStorage
- (IAMICMessageMetadataStorage)init;
- (void)metadataForBundleIdentifiers:(id)a3 completion:(id)a4;
- (void)updateMetadata:(id)a3 messageIdentifier:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6;
@end

@implementation IAMICMessageMetadataStorage

- (IAMICMessageMetadataStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)IAMICMessageMetadataStorage;
  v2 = [(IAMICMessageMetadataStorage *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F89160] sharedManager];
    iTunesCloudIAMManager = v2->_iTunesCloudIAMManager;
    v2->_iTunesCloudIAMManager = (ICInAppMessageManager *)v3;
  }
  return v2;
}

- (void)metadataForBundleIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)updateMetadata:(id)a3 messageIdentifier:(id)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
}

- (void).cxx_destruct
{
}

@end