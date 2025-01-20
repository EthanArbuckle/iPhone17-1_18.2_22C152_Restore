@interface CADNullAppProtectionGuard
+ (id)shared;
- (void)initiateAuthenticationForApplicationWithBundleIdentifier:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantedByEntitlement:(BOOL)a5 completion:(id)a6;
@end

@implementation CADNullAppProtectionGuard

+ (id)shared
{
  if (shared_onceToken_55 != -1) {
    dispatch_once(&shared_onceToken_55, &__block_literal_global_57);
  }
  v2 = (void *)shared_guard_54;
  return v2;
}

uint64_t __35__CADNullAppProtectionGuard_shared__block_invoke()
{
  v0 = objc_alloc_init(CADNullAppProtectionGuard);
  shared_guard_54 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

- (void)initiateAuthenticationForApplicationWithBundleIdentifier:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantedByEntitlement:(BOOL)a5 completion:(id)a6
{
}

@end