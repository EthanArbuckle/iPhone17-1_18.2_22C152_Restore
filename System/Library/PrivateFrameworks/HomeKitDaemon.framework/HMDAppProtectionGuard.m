@interface HMDAppProtectionGuard
- (void)initiateAuthenticationForApplicationWithBundleIdentifier:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 completion:(id)a5;
@end

@implementation HMDAppProtectionGuard

- (void)initiateAuthenticationForApplicationWithBundleIdentifier:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 completion:(id)a5
{
  v7 = (void *)MEMORY[0x263F251D0];
  id v8 = a5;
  v9 = [v7 applicationWithBundleIdentifier:a3];
  v10 = [MEMORY[0x263F251F8] sharedGuard];
  long long v11 = *(_OWORD *)&a4->var0[4];
  v12[0] = *(_OWORD *)a4->var0;
  v12[1] = v11;
  [v10 initiateAuthenticationWithShieldingForSubject:v9 onBehalfOfProcessWithAuditToken:v12 accessGrantReason:1 completion:v8];
}

@end