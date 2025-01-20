@interface MCUIAppSigner
+ (id)_uppProfilesBySignerIDWithOutFreeDevProfilesBySignerID:(id *)a3;
+ (id)enterpriseAppSignersWithOutDeveloperAppSigners:(id *)a3;
+ (void)_addProfile:(id)a3 toSignerIdentity:(id)a4 inDictionary:(id)a5;
- (BOOL)hasFreePP;
- (BOOL)hasUniversalPP;
- (BOOL)isAppRemovalAllowed;
- (BOOL)isEnterpriseAppTrustAllowed;
- (BOOL)isTrustable;
- (BOOL)isTrusted;
- (MCUIAppSigner)initWithIdentity:(id)a3 applications:(id)a4 provisioningProfiles:(id)a5 hasUPP:(BOOL)a6 hasFreePP:(BOOL)a7;
- (NSArray)applications;
- (NSArray)provisioningProfiles;
- (NSString)displayName;
- (NSString)identity;
- (int64_t)almostUntrustedAppCount;
- (int64_t)untrustedAppCount;
- (void)_updateUntrustedAppCountsForBundleIDs:(id)a3;
- (void)main_removeMCUIReferenceForBundleID:(id)a3;
- (void)refreshApplications;
- (void)setIdentity:(id)a3;
@end

@implementation MCUIAppSigner

+ (id)_uppProfilesBySignerIDWithOutFreeDevProfilesBySignerID:(id *)a3
{
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = (void *)MEMORY[0x1E4F73180];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__MCUIAppSigner__uppProfilesBySignerIDWithOutFreeDevProfilesBySignerID___block_invoke;
  v12[3] = &unk_1E6EAD6F8;
  id v7 = v4;
  id v13 = v7;
  id v8 = v5;
  id v14 = v8;
  [v6 enumerateProvisioningProfilesWithBlock:v12];
  if (a3) {
    *a3 = v8;
  }
  v9 = v14;
  id v10 = v7;

  return v10;
}

+ (id)enterpriseAppSignersWithOutDeveloperAppSigners:(id *)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v74 = 0;
  v61 = +[MCUIAppSigner _uppProfilesBySignerIDWithOutFreeDevProfilesBySignerID:&v74];
  id v60 = v74;
  v4 = [MEMORY[0x1E4F74230] sharedConnection];
  v5 = [v4 managedAppIDs];

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v6 = [MEMORY[0x1E4F5E640] userApplications];
  v53 = v5;
  uint64_t v58 = [v6 countByEnumeratingWithState:&v70 objects:v77 count:16];
  if (v58)
  {
    uint64_t v7 = *(void *)v71;
    v54 = v3;
    uint64_t v51 = *(void *)v71;
    v52 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v71 != v7) {
          objc_enumerationMutation(v6);
        }
        v9 = *(void **)(*((void *)&v70 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x1E4E8BA40]();
        v11 = [v9 signerID];

        if (v11)
        {
          char v12 = [v9 isInstalled];
          uint64_t v13 = [v9 bundleID];
          id v14 = (void *)v13;
          if (v12)
          {
            int v15 = [v5 containsObject:v13];

            if (v15)
            {
              id v14 = [v9 bundleID];
              NSLog(&cfstr_McuiappsignerI_1.isa, v14);
            }
            else
            {
              v16 = [v9 signerID];
              id v14 = [v61 objectForKey:v16];

              v17 = [v9 signerID];
              uint64_t v18 = [v60 objectForKey:v17];

              v19 = objc_opt_new();
              v20 = v19;
              if (v14) {
                [v19 addObjectsFromArray:v14];
              }
              if (v18) {
                [v20 addObjectsFromArray:v18];
              }
              id v56 = (id)v18;
              long long v68 = 0u;
              long long v69 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              id v21 = v20;
              uint64_t v22 = [v21 countByEnumeratingWithState:&v66 objects:v76 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v67;
                while (2)
                {
                  for (uint64_t i = 0; i != v23; ++i)
                  {
                    if (*(void *)v67 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    v26 = *(void **)(*((void *)&v66 + 1) + 8 * i);
                    if (([v26 isAppleInternal] & 1) != 0
                      || (int v27 = [v9 isBetaApp], v27 == objc_msgSend(v26, "isBeta"))
                      && ([v9 appIDEntitlement],
                          v28 = objc_claimAutoreleasedReturnValue(),
                          int v29 = [v26 allowsAppIDEntitlement:v28],
                          v28,
                          v29))
                    {
                      v32 = [v9 signerID];
                      v3 = v54;
                      v33 = [v54 objectForKey:v32];

                      if (v33)
                      {
                        v34 = [v9 bundleID];
                        [v33 addObject:v34];
                      }
                      else
                      {
                        v35 = (void *)MEMORY[0x1E4F1CA48];
                        v36 = [v9 bundleID];
                        v33 = [v35 arrayWithObject:v36];

                        v34 = [v9 signerID];
                        [v54 setObject:v33 forKey:v34];
                      }

                      goto LABEL_33;
                    }
                    v30 = [v9 bundleID];
                    v31 = [v9 appIDEntitlement];
                    NSLog(&cfstr_McuiappsignerS.isa, v30, v31);
                  }
                  uint64_t v23 = [v21 countByEnumeratingWithState:&v66 objects:v76 count:16];
                  v3 = v54;
                  if (v23) {
                    continue;
                  }
                  break;
                }
              }
LABEL_33:

              v6 = v52;
              v5 = v53;
              uint64_t v7 = v51;
            }
          }
          else
          {
            NSLog(&cfstr_McuiappsignerI_0.isa, v13);
          }
        }
        else
        {
          id v14 = [v9 bundleID];
          NSLog(&cfstr_McuiappsignerI.isa, v14);
        }

        ++v8;
      }
      while (v8 != v58);
      uint64_t v37 = [v6 countByEnumeratingWithState:&v70 objects:v77 count:16];
      uint64_t v58 = v37;
    }
    while (v37);
  }

  id v57 = (id)objc_opt_new();
  v38 = objc_opt_new();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v39 = v3;
  uint64_t v59 = [v39 countByEnumeratingWithState:&v62 objects:v75 count:16];
  if (v59)
  {
    uint64_t v55 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v59; ++j)
      {
        if (*(void *)v63 != v55) {
          objc_enumerationMutation(v39);
        }
        uint64_t v41 = *(void *)(*((void *)&v62 + 1) + 8 * j);
        v42 = [v39 objectForKey:v41];
        v43 = [v61 objectForKey:v41];
        v44 = [v60 objectForKey:v41];
        v45 = objc_opt_new();
        v46 = v45;
        if (v43) {
          [v45 addObjectsFromArray:v43];
        }
        if (v44) {
          [v46 addObjectsFromArray:v44];
        }
        v47 = -[MCUIAppSigner initWithIdentity:applications:provisioningProfiles:hasUPP:hasFreePP:]([MCUIAppSigner alloc], "initWithIdentity:applications:provisioningProfiles:hasUPP:hasFreePP:", v41, v42, v46, [v43 count] != 0, objc_msgSend(v44, "count") != 0);
        if ([v43 count]) {
          v48 = v57;
        }
        else {
          v48 = v38;
        }
        [v48 addObject:v47];
      }
      uint64_t v59 = [v39 countByEnumeratingWithState:&v62 objects:v75 count:16];
    }
    while (v59);
  }

  if (a3) {
    *a3 = v38;
  }

  return v57;
}

- (MCUIAppSigner)initWithIdentity:(id)a3 applications:(id)a4 provisioningProfiles:(id)a5 hasUPP:(BOOL)a6 hasFreePP:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MCUIAppSigner;
  v16 = [(MCUIAppSigner *)&v23 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identity, a3);
    uint64_t v18 = [v14 mutableCopy];
    applications = v17->_applications;
    v17->_applications = (NSArray *)v18;

    objc_storeStrong((id *)&v17->_provisioningProfiles, a5);
    v17->_hasUniversalPP = v8;
    v17->_hasFreePP = v7;
    uint64_t v20 = [MEMORY[0x1E4F73180] developerFromIdentity:v13 hasFreePP:v7 hasUPP:v8];
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v20;

    [(MCUIAppSigner *)v17 refreshApplications];
  }

  return v17;
}

- (void)setIdentity:(id)a3
{
  BOOL v7 = (NSString *)a3;
  if (self->_identity != v7)
  {
    objc_storeStrong((id *)&self->_identity, a3);
    v5 = [MEMORY[0x1E4F73180] developerFromIdentity:v7 hasFreePP:self->_hasFreePP hasUPP:self->_hasUniversalPP];
    displayName = self->_displayName;
    self->_displayName = v5;
  }
}

- (void)refreshApplications
{
  id v3 = [(MCUIAppSigner *)self applications];
  [(MCUIAppSigner *)self _updateUntrustedAppCountsForBundleIDs:v3];
}

- (void)_updateUntrustedAppCountsForBundleIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [(MCUIAppSigner *)self applications];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        char v12 = (void *)MEMORY[0x1E4E8BA40]();
        id v13 = (void *)[objc_alloc(MEMORY[0x1E4F5E640]) initWithBundleID:v11 dataSource:0];
        uint64_t v14 = [v13 misStateIncludingPending:1];
        if ((unint64_t)(v14 - 2) >= 2)
        {
          if (v14 == 1)
          {
            ++v7;
          }
          else
          {
            if (v14 == 5)
            {

              goto LABEL_16;
            }
            ++v8;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v7 = 0;
    int64_t v8 = 0;
  }
LABEL_16:

  self->_untrustedAppCount = v8;
  self->_almostUntrustedAppCount = v7;
}

- (void)main_removeMCUIReferenceForBundleID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__MCUIAppSigner_main_removeMCUIReferenceForBundleID___block_invoke;
  v6[3] = &unk_1E6EAD2D0;
  objc_copyWeak(&v9, &location);
  id v7 = v4;
  int64_t v8 = self;
  id v5 = v4;
  dispatch_sync(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__MCUIAppSigner_main_removeMCUIReferenceForBundleID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v3 = [WeakRetained applications];
    id v4 = (void *)[v3 mutableCopy];

    [v4 removeObject:*(void *)(a1 + 32)];
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v5;

    id WeakRetained = v8;
  }
}

- (BOOL)isTrusted
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F74230] sharedConnection];
  id v4 = [v3 trustedCodeSigningIdentities];
  uint64_t v5 = [(MCUIAppSigner *)self identity];
  int v6 = [v4 containsObject:v5];

  if (!v6) {
    return 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [(MCUIAppSigner *)self provisioningProfiles];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v13 = [v12 uuid];
        uint64_t v14 = [v13 length];

        if (v14)
        {
          id v15 = (void *)MEMORY[0x1E4F73180];
          long long v16 = [v12 uuid];
          LODWORD(v15) = [v15 isTrustedProvisioningProfileUUID:v16];

          if (!v15)
          {
            BOOL v17 = 0;
            goto LABEL_15;
          }
        }
        else
        {
          NSLog(&cfstr_McuiappsignerC.isa, v12);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  BOOL v17 = 1;
LABEL_15:

  return v17;
}

- (BOOL)isAppRemovalAllowed
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F08]] != 2;

  return v3;
}

- (BOOL)isEnterpriseAppTrustAllowed
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FD8]] != 2;

  return v3;
}

- (BOOL)isTrustable
{
  if ([(MCUIAppSigner *)self isTrusted]
    && [(MCUIAppSigner *)self isAppRemovalAllowed])
  {
    return 1;
  }
  if ([(MCUIAppSigner *)self isTrusted]) {
    return 0;
  }
  return [(MCUIAppSigner *)self isEnterpriseAppTrustAllowed];
}

+ (void)_addProfile:(id)a3 toSignerIdentity:(id)a4 inDictionary:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 objectForKey:v7];
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    [v8 setObject:v9 forKey:v7];
  }
  [v9 addObject:v10];
}

void __72__MCUIAppSigner__uppProfilesBySignerIDWithOutFreeDevProfilesBySignerID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v6 isUniversalPP]) {
    +[MCUIAppSigner _addProfile:v6 toSignerIdentity:v5 inDictionary:*(void *)(a1 + 32)];
  }
  if ([v6 isFreePP]) {
    +[MCUIAppSigner _addProfile:v6 toSignerIdentity:v5 inDictionary:*(void *)(a1 + 40)];
  }
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)identity
{
  return self->_identity;
}

- (NSArray)applications
{
  return self->_applications;
}

- (NSArray)provisioningProfiles
{
  return self->_provisioningProfiles;
}

- (BOOL)hasFreePP
{
  return self->_hasFreePP;
}

- (BOOL)hasUniversalPP
{
  return self->_hasUniversalPP;
}

- (int64_t)untrustedAppCount
{
  return self->_untrustedAppCount;
}

- (int64_t)almostUntrustedAppCount
{
  return self->_almostUntrustedAppCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningProfiles, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end