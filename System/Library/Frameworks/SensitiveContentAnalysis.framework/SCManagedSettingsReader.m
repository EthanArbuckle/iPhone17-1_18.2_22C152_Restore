@interface SCManagedSettingsReader
+ (id)currentInterventionType;
+ (id)currentScanningPolicy;
+ (id)subscribeForScanningPolicyChanges:(id)a3;
@end

@implementation SCManagedSettingsReader

+ (id)subscribeForScanningPolicyChanges:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F53E80]];
  v5 = [MEMORY[0x263F53ED0] publisherForGroups:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__SCManagedSettingsReader_subscribeForScanningPolicyChanges___block_invoke;
  v9[3] = &unk_2651CA940;
  id v10 = v3;
  id v6 = v3;
  v7 = [v5 sinkWithReceiveInput:v9];

  return v7;
}

+ (id)currentScanningPolicy
{
  v2 = objc_opt_new();
  id v3 = [v2 userSafety];
  v4 = [v3 scanningPolicy];

  return v4;
}

+ (id)currentInterventionType
{
  v2 = [a1 currentScanningPolicy];
  id v3 = [v2 interventionType];

  return v3;
}

void __61__SCManagedSettingsReader_subscribeForScanningPolicyChanges___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 containsObject:*MEMORY[0x263F53E80]])
  {
    id v6 = (id)objc_opt_new();
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = [v6 userSafety];
    v5 = [v4 scanningPolicy];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
  }
}

@end