@interface FBSApplicationInfo(DEPRECATED)
- (id)_initForProfileManagerTesting;
- (id)_signatureValidationService;
- (uint64_t)_mapSignatureStateFromTrustState:()DEPRECATED;
- (uint64_t)signatureState;
- (void)acceptApplicationSignatureIdentity;
@end

@implementation FBSApplicationInfo(DEPRECATED)

- (id)_initForProfileManagerTesting
{
  v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/"];
  v5.receiver = a1;
  v5.super_class = (Class)&off_1EFB3E910;
  id v3 = objc_msgSendSuper2(&v5, sel__initWithBundleIdentifier_url_, @"com.apple.frontboard.appInfoTest", v2);

  return v3;
}

- (uint64_t)signatureState
{
  v2 = [a1 _signatureValidationService];
  uint64_t v3 = objc_msgSend(a1, "_mapSignatureStateFromTrustState:", objc_msgSend(v2, "trustStateForApplication:", a1));

  return v3;
}

- (id)_signatureValidationService
{
  id v2 = objc_alloc(MEMORY[0x1E4F62998]);
  uint64_t v3 = [MEMORY[0x1E4F62A18] sharedInstance];
  v4 = [a1 signerIdentity];
  objc_super v5 = [v3 profilesForSignerIdentity:v4];
  v6 = [MEMORY[0x1E4F62A18] sharedInstance];
  v7 = [a1 bundleIdentifier];
  v8 = objc_msgSend(v2, "initWithApplicationInfo:andProvisioningProfiles:isManaged:", a1, v5, objc_msgSend(v6, "isManaged:", v7));

  return v8;
}

- (void)acceptApplicationSignatureIdentity
{
  v1 = [a1 signerIdentity];
  if (v1)
  {
    id v7 = v1;
    id MCProfileConnectionClass = getMCProfileConnectionClass();
    uint64_t v3 = [MCProfileConnectionClass sharedConnection];
    v4 = [v3 trustedCodeSigningIdentities];
    id v5 = (id)[v4 mutableCopy];

    if (!v5) { {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    }
    [v5 addObject:v7];
    v6 = [MCProfileConnectionClass sharedConnection];
    [v6 setTrustedCodeSigningIdentities:v5];

    v1 = v7;
  }
}

- (uint64_t)_mapSignatureStateFromTrustState:()DEPRECATED
{
  if (a3 > 0xA) { {
    return 0;
  }
  }
  else {
    return qword_1A6386588[a3];
  }
}

@end