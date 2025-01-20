@interface CRKKeychainProvider
+ (CRKKeychainProvider)sharedProvider;
+ (id)makeKeychainForCurrentEnvironment;
- (CRKKeychain)keychain;
- (CRKKeychainProvider)initWithKeychain:(id)a3;
@end

@implementation CRKKeychainProvider

- (CRKKeychainProvider)initWithKeychain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKKeychainProvider;
  v6 = [(CRKKeychainProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keychain, a3);
  }

  return v7;
}

+ (CRKKeychainProvider)sharedProvider
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__CRKKeychainProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, block);
  }
  v2 = (void *)sharedProvider_keychainProvider;

  return (CRKKeychainProvider *)v2;
}

void __37__CRKKeychainProvider_sharedProvider__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) makeKeychainForCurrentEnvironment];
  uint64_t v2 = [objc_alloc(*(Class *)(a1 + 32)) initWithKeychain:v4];
  v3 = (void *)sharedProvider_keychainProvider;
  sharedProvider_keychainProvider = v2;
}

+ (id)makeKeychainForCurrentEnvironment
{
  uint64_t v2 = [MEMORY[0x263F08AB0] processInfo];
  if (objc_msgSend(v2, "crk_isBeingTested"))
  {
    uint64_t v3 = objc_opt_new();
  }
  else
  {
    uint64_t v3 = +[CRKConcreteKeychain defaultKeychain];
  }
  id v4 = (void *)v3;

  return v4;
}

- (CRKKeychain)keychain
{
  return self->_keychain;
}

- (void).cxx_destruct
{
}

@end