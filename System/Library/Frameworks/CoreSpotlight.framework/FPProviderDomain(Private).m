@interface FPProviderDomain(Private)
- (id)FPDomainItem;
@end

@implementation FPProviderDomain(Private)

- (id)FPDomainItem
{
  v24[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 topLevelBundleIdentifier];
  if (v2)
  {
    v3 = (void *)v2;
    uint64_t v4 = [a1 providerID];
    if (v4)
    {
      v5 = (void *)v4;
      v6 = [a1 domain];
      v7 = [v6 spotlightDomainIdentifier];

      if (v7)
      {
        v8 = [a1 topLevelBundleIdentifier];
        v24[0] = v8;
        v9 = [a1 providerID];
        v24[1] = v9;
        v10 = [a1 domain];
        v11 = [v10 spotlightDomainIdentifier];
        v24[2] = v11;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];

        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  v8 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [a1 topLevelBundleIdentifier];
    v14 = [a1 providerID];
    v15 = [a1 domain];
    v16 = [v15 spotlightDomainIdentifier];
    int v18 = 138412802;
    v19 = v13;
    __int16 v20 = 2112;
    v21 = v14;
    __int16 v22 = 2112;
    v23 = v16;
    _os_log_impl(&dword_18D0E3000, v8, OS_LOG_TYPE_DEFAULT, "*warn* FileProvider domain with incomplete proerpties. (bundleID:%@ providerID:%@ domainID:%@)", (uint8_t *)&v18, 0x20u);
  }
  v12 = 0;
LABEL_9:

  return v12;
}

@end