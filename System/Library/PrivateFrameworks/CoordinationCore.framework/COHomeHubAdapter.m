@interface COHomeHubAdapter
+ (id)sharedInstance;
- (COHomeHubAdapter)init;
- (NSObject)client;
- (NSObject)list;
- (id)accessoryForPeerInstance:(id)a3 usingHomeKitAdapter:(id)a4;
- (id)accessoryIdentifierForPeerInstance:(id)a3 usingHomeKitAdapter:(id)a4;
@end

@implementation COHomeHubAdapter

- (COHomeHubAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)COHomeHubAdapter;
  return [(COHomeHubAdapter *)&v3 init];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__COHomeHubAdapter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_result;
  return v2;
}

uint64_t __34__COHomeHubAdapter_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_result = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (id)accessoryForPeerInstance:(id)a3 usingHomeKitAdapter:(id)a4
{
  return 0;
}

- (id)accessoryIdentifierForPeerInstance:(id)a3 usingHomeKitAdapter:(id)a4
{
  v4 = [(COHomeHubAdapter *)self accessoryForPeerInstance:a3 usingHomeKitAdapter:a4];
  v5 = [v4 uniqueIdentifier];

  return v5;
}

- (NSObject)client
{
  return self->_client;
}

- (NSObject)list
{
  return self->_list;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end