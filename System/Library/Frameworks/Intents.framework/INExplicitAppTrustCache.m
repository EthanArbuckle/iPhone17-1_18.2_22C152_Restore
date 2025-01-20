@interface INExplicitAppTrustCache
- (BOOL)enterpriseAppTrustAllowed;
- (NSArray)managedBundleIdentifiers;
- (NSArray)trustedCodeSigningIdentities;
- (NSSet)signingIdentitiesRequiringExplicitTrust;
- (void)setEnterpriseAppTrustAllowed:(BOOL)a3;
- (void)setManagedBundleIdentifiers:(id)a3;
- (void)setSigningIdentitiesRequiringExplicitTrust:(id)a3;
- (void)setTrustedCodeSigningIdentities:(id)a3;
@end

@implementation INExplicitAppTrustCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingIdentitiesRequiringExplicitTrust, 0);
  objc_storeStrong((id *)&self->_trustedCodeSigningIdentities, 0);

  objc_storeStrong((id *)&self->_managedBundleIdentifiers, 0);
}

- (void)setSigningIdentitiesRequiringExplicitTrust:(id)a3
{
}

- (void)setTrustedCodeSigningIdentities:(id)a3
{
}

- (void)setManagedBundleIdentifiers:(id)a3
{
}

- (void)setEnterpriseAppTrustAllowed:(BOOL)a3
{
  self->_enterpriseAppTrustAllowed = a3;
}

- (NSSet)signingIdentitiesRequiringExplicitTrust
{
  p_signingIdentitiesRequiringExplicitTrust = &self->_signingIdentitiesRequiringExplicitTrust;
  signingIdentitiesRequiringExplicitTrust = self->_signingIdentitiesRequiringExplicitTrust;
  if (!signingIdentitiesRequiringExplicitTrust)
  {
    uint64_t v5 = 0;
    v6 = &v5;
    uint64_t v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__26978;
    v9 = __Block_byref_object_dispose__26979;
    id v10 = [MEMORY[0x1E4F1CA80] set];
    MISEnumerateInstalledProvisioningProfiles();
    objc_storeStrong((id *)p_signingIdentitiesRequiringExplicitTrust, (id)v6[5]);
    _Block_object_dispose(&v5, 8);

    signingIdentitiesRequiringExplicitTrust = *p_signingIdentitiesRequiringExplicitTrust;
  }

  return signingIdentitiesRequiringExplicitTrust;
}

uint64_t __66__INExplicitAppTrustCache_signingIdentitiesRequiringExplicitTrust__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  MISProvisioningProfileGetDeveloperCertificates();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v2) {
    goto LABEL_20;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)v16;
  while (2)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v16 != v4) {
        objc_enumerationMutation(v1);
      }
      v6 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((void *)&v15 + 1) + 8 * i));
      if (v6)
      {
        uint64_t v7 = v6;
        v8 = (__CFString *)SecCertificateCopySubjectSummary(v6);
        if (!v8)
        {
LABEL_15:
          CFRelease(v7);

          continue;
        }
        int v9 = MISProvisioningProfileProvisionsAllDevices();
        CFBooleanRef Value = (const __CFBoolean *)MISProfileGetValue();
        if (Value)
        {
          CFBooleanRef v11 = Value;
          CFTypeID v12 = CFGetTypeID(Value);
          if (v12 != CFBooleanGetTypeID())
          {
            LODWORD(Value) = 0;
            if (v9) {
              goto LABEL_19;
            }
LABEL_14:
            if (Value)
            {
LABEL_19:
              [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
              CFRelease(v7);

              goto LABEL_20;
            }
            goto LABEL_15;
          }
          LODWORD(Value) = CFBooleanGetValue(v11);
        }
        if (v9) {
          goto LABEL_19;
        }
        goto LABEL_14;
      }
    }
    uint64_t v3 = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3) {
      continue;
    }
    break;
  }
LABEL_20:

  return 1;
}

- (NSArray)trustedCodeSigningIdentities
{
  if (!self->_loadedTrustedCodeSigningIdentities)
  {
    uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
    uint64_t v4 = [v3 trustedCodeSigningIdentities];
    trustedCodeSigningIdentities = self->_trustedCodeSigningIdentities;
    self->_trustedCodeSigningIdentities = v4;

    self->_loadedTrustedCodeSigningIdentities = 1;
  }
  v6 = self->_trustedCodeSigningIdentities;

  return v6;
}

- (NSArray)managedBundleIdentifiers
{
  if (!self->_loadedManagedBundleIdentifiers)
  {
    uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
    uint64_t v4 = [v3 managedAppIDs];
    managedBundleIdentifiers = self->_managedBundleIdentifiers;
    self->_managedBundleIdentifiers = v4;

    self->_loadedManagedBundleIdentifiers = 1;
  }
  v6 = self->_managedBundleIdentifiers;

  return v6;
}

- (BOOL)enterpriseAppTrustAllowed
{
  if (!self->_enterpriseAppTrustAllowedLoaded)
  {
    uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
    self->_enterpriseAppTrustAllowed = [v3 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FD8]] != 2;

    self->_enterpriseAppTrustAllowedLoaded = 1;
  }
  return self->_enterpriseAppTrustAllowed;
}

@end