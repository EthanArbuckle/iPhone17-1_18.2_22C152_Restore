@interface INAppTrust
+ (BOOL)_appRequiresExplicitTrust:(id)a3 withExplicitAppTrustCache:(id)a4;
+ (BOOL)_shouldTrustAppForLaunch:(id)a3 withExplicitAppTrustCache:(id)a4;
+ (BOOL)_shouldTrustExtensionForLaunch:(id)a3 withExplicitAppTrustCache:(id)a4;
+ (BOOL)shouldTrustAppForLaunch:(id)a3;
+ (BOOL)shouldTrustExtensionForLaunch:(id)a3;
+ (id)appsTrustedForLaunch:(id)a3;
+ (id)extensionsTrustedForLaunch:(id)a3;
@end

@implementation INAppTrust

+ (BOOL)_appRequiresExplicitTrust:(id)a3 withExplicitAppTrustCache:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 managedBundleIdentifiers];
  v8 = [v5 bundleIdentifier];
  char v9 = [v7 containsObject:v8];

  if ((v9 & 1) != 0
    || ([v6 trustedCodeSigningIdentities],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v5 signerIdentity],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v10 containsObject:v11],
        v11,
        v10,
        (v12 & 1) != 0))
  {
    char v13 = 0;
  }
  else
  {
    v14 = [v6 signingIdentitiesRequiringExplicitTrust];
    v15 = [v5 signerIdentity];
    char v13 = [v14 containsObject:v15];
  }
  return v13;
}

+ (id)appsTrustedForLaunch:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(INExplicitAppTrustCache);
  id v6 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  char v13 = __35__INAppTrust_appsTrustedForLaunch___block_invoke;
  v14 = &unk_1E551BE60;
  v15 = v5;
  id v16 = a1;
  v7 = v5;
  v8 = [v6 predicateWithBlock:&v11];
  char v9 = objc_msgSend(v4, "filteredArrayUsingPredicate:", v8, v11, v12, v13, v14);

  return v9;
}

uint64_t __35__INAppTrust_appsTrustedForLaunch___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _shouldTrustAppForLaunch:a2 withExplicitAppTrustCache:*(void *)(a1 + 32)];
}

+ (BOOL)_shouldTrustAppForLaunch:(id)a3 withExplicitAppTrustCache:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    LOBYTE(v8) = 0;
    goto LABEL_18;
  }
  if ((objc_msgSend(v6, "if_isSystem") & 1) == 0)
  {
    char v9 = [v6 bundleURL];
    v10 = [v9 path];

    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v12 = [v11 isReadableFileAtPath:v10];

      if (v12)
      {
        uint64_t v13 = MISAppApprovalState();
        switch(v13)
        {
          case 0:
            int v8 = [a1 _appRequiresExplicitTrust:v6 withExplicitAppTrustCache:v7] ^ 1;
            goto LABEL_17;
          case 3:
            goto LABEL_13;
          case 1:
            if (INIsInternalInstall_onceToken != -1) {
              dispatch_once(&INIsInternalInstall_onceToken, &__block_literal_global_226);
            }
            if (INIsInternalInstall_isInternal)
            {
LABEL_13:
              LOBYTE(v8) = 1;
LABEL_17:

              goto LABEL_18;
            }
            break;
        }
      }
      else
      {
        v14 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          int v16 = 136315394;
          v17 = "+[INAppTrust _shouldTrustAppForLaunch:withExplicitAppTrustCache:]";
          __int16 v18 = 2112;
          v19 = v10;
          _os_log_error_impl(&dword_18CB2F000, v14, OS_LOG_TYPE_ERROR, "%s Unable to determine app aproval state for %@ because the path is unreadable", (uint8_t *)&v16, 0x16u);
        }
      }
    }
    LOBYTE(v8) = 0;
    goto LABEL_17;
  }
  LOBYTE(v8) = 1;
LABEL_18:

  return v8;
}

+ (BOOL)shouldTrustAppForLaunch:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(INExplicitAppTrustCache);
  LOBYTE(a1) = [a1 _shouldTrustAppForLaunch:v4 withExplicitAppTrustCache:v5];

  return (char)a1;
}

+ (id)extensionsTrustedForLaunch:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(INExplicitAppTrustCache);
  id v6 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __41__INAppTrust_extensionsTrustedForLaunch___block_invoke;
  v14 = &unk_1E551BE60;
  v15 = v5;
  id v16 = a1;
  id v7 = v5;
  int v8 = [v6 predicateWithBlock:&v11];
  char v9 = objc_msgSend(v4, "filteredArrayUsingPredicate:", v8, v11, v12, v13, v14);

  return v9;
}

uint64_t __41__INAppTrust_extensionsTrustedForLaunch___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _shouldTrustExtensionForLaunch:a2 withExplicitAppTrustCache:*(void *)(a1 + 32)];
}

+ (BOOL)_shouldTrustExtensionForLaunch:(id)a3 withExplicitAppTrustCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 _extensionBundle];
  char v9 = [v8 bundlePath];
  char v10 = [v9 hasPrefix:@"/System/Library/PrivateFrameworks/"];

  if (v10)
  {
    char v11 = 1;
  }
  else
  {
    uint64_t v12 = [v6 _plugIn];
    uint64_t v13 = [v12 containingUrl];

    if (v13)
    {
      v14 = [MEMORY[0x1E4F223B8] applicationProxyForBundleURL:v13];
      char v11 = [a1 _shouldTrustAppForLaunch:v14 withExplicitAppTrustCache:v7];
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

+ (BOOL)shouldTrustExtensionForLaunch:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(INExplicitAppTrustCache);
  LOBYTE(a1) = [a1 _shouldTrustExtensionForLaunch:v4 withExplicitAppTrustCache:v5];

  return (char)a1;
}

@end