@interface CALNMSMailAccounts
+ (CALNMSMailAccounts)sharedInstance;
- (BOOL)canSendMail;
@end

@implementation CALNMSMailAccounts

+ (CALNMSMailAccounts)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__CALNMSMailAccounts_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_21 != -1) {
    dispatch_once(&sharedInstance_onceToken_21, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_18;
  return (CALNMSMailAccounts *)v2;
}

uint64_t __36__CALNMSMailAccounts_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_18 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (BOOL)canSendMail
{
  return [MEMORY[0x263F53698] canSendMail];
}

@end