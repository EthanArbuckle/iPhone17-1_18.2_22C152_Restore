@interface CHProcessHandle
+ (id)processHandle;
- (BOOL)hasAppProtectionReadEntitlement;
- (BOOL)hasDataStoreReadOnlyEntitlement;
- (BOOL)hasDataStoreReadWriteEntitlement;
- (BOOL)hasDataVaultEntitlement;
@end

@implementation CHProcessHandle

+ (id)processHandle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__CHProcessHandle_processHandle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (processHandle_onceToken != -1) {
    dispatch_once(&processHandle_onceToken, block);
  }
  v2 = (void *)processHandle_sProcessHandle;
  return v2;
}

- (BOOL)hasDataStoreReadWriteEntitlement
{
  return [(CHProcessHandle *)self hasEntitlement:0x1F129FE28];
}

- (BOOL)hasAppProtectionReadEntitlement
{
  return [(CHProcessHandle *)self hasEntitlement:0x1F129FE68];
}

uint64_t __32__CHProcessHandle_processHandle__block_invoke(uint64_t a1)
{
  processHandle_sProcessHandle = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (BOOL)hasDataStoreReadOnlyEntitlement
{
  return [(CHProcessHandle *)self hasEntitlement:0x1F129FE08];
}

- (BOOL)hasDataVaultEntitlement
{
  return [(CHProcessHandle *)self hasEntitlement:0x1F129FE48];
}

@end