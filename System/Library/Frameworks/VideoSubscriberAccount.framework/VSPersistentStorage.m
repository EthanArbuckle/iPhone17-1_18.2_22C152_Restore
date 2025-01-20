@interface VSPersistentStorage
+ (id)defaultStorageDirectoryURL;
+ (void)defaultStorageDirectoryURL;
- (VSAccountChannelsCenter)channelsCenter;
- (VSAccountStore)accountStore;
- (VSPersistentStorage)init;
- (VSPersistentStorage)initWithAccountStore:(id)a3;
- (VSPersistentStorage)initWithAccountStore:(id)a3 channelsCenterClass:(Class)a4;
- (VSPrivacyFacade)privacyFacade;
- (VSPrivacyVoucherLockbox)voucherLockbox;
@end

@implementation VSPersistentStorage

+ (id)defaultStorageDirectoryURL
{
  v2 = +[VSOptional optionalWithObject:@"/var/mobile/Library/Application Support"];
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = [v2 forceUnwrapObject];
  v5 = [v3 fileURLWithPath:v4];

  v6 = [v5 URLByAppendingPathComponent:@"com.apple.VideoSubscriberAccount"];
  v7 = +[VSOptional optionalWithObject:v6];

  id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v9 = [v7 forceUnwrapObject];
  v10 = [v9 path];

  if (v10 && ([v8 fileExistsAtPath:v10] & 1) == 0)
  {
    id v15 = 0;
    [v8 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v15];
    id v11 = v15;
    if (v11)
    {
      v12 = VSErrorLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[VSPersistentStorage defaultStorageDirectoryURL];
      }
    }
  }
  v13 = [v7 forceUnwrapObject];

  return v13;
}

- (VSPersistentStorage)initWithAccountStore:(id)a3 channelsCenterClass:(Class)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VSPersistentStorage;
  v7 = [(VSPersistentStorage *)&v17 init];
  if (v7)
  {
    if (v6)
    {
      id v8 = (VSAccountStore *)v6;
    }
    else
    {
      id v8 = +[VSAccountStore sharedAccountStore];
    }
    accountStore = v7->_accountStore;
    v7->_accountStore = v8;

    uint64_t v10 = [[a4 alloc] initWithAccountStore:v7->_accountStore];
    channelsCenter = v7->_channelsCenter;
    v7->_channelsCenter = (VSAccountChannelsCenter *)v10;

    v12 = objc_alloc_init(VSPrivacyVoucherLockbox);
    voucherLockbox = v7->_voucherLockbox;
    v7->_voucherLockbox = v12;

    v14 = [[VSPrivacyFacade alloc] initWithVoucherLockbox:v7->_voucherLockbox];
    privacyFacade = v7->_privacyFacade;
    v7->_privacyFacade = v14;
  }
  return v7;
}

- (VSPersistentStorage)initWithAccountStore:(id)a3
{
  id v4 = a3;
  v5 = [(VSPersistentStorage *)self initWithAccountStore:v4 channelsCenterClass:objc_opt_class()];

  return v5;
}

- (VSPersistentStorage)init
{
  return [(VSPersistentStorage *)self initWithAccountStore:0];
}

- (VSAccountStore)accountStore
{
  return self->_accountStore;
}

- (VSAccountChannelsCenter)channelsCenter
{
  return self->_channelsCenter;
}

- (VSPrivacyVoucherLockbox)voucherLockbox
{
  return self->_voucherLockbox;
}

- (VSPrivacyFacade)privacyFacade
{
  return self->_privacyFacade;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyFacade, 0);
  objc_storeStrong((id *)&self->_voucherLockbox, 0);
  objc_storeStrong((id *)&self->_channelsCenter, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

+ (void)defaultStorageDirectoryURL
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error creating persistent storage directory %@", (uint8_t *)&v2, 0xCu);
}

@end