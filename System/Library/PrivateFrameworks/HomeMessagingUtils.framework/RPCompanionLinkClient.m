@interface RPCompanionLinkClient
@end

@implementation RPCompanionLinkClient

uint64_t __56__RPCompanionLinkClient_HMU_HomeKit__hmu_devicesInHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 homeKitIdentifier];
  if (v4
    && ([*(id *)(a1 + 32) accessoryWithUniqueIdentifier:v4],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    uint64_t v6 = 1;
  }
  else
  {
    v7 = [v3 homeKitUserIdentifiers];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__RPCompanionLinkClient_HMU_HomeKit__hmu_devicesInHome___block_invoke_2;
    v9[3] = &unk_264545388;
    id v10 = *(id *)(a1 + 32);
    uint64_t v6 = objc_msgSend(v7, "na_any:", v9);
  }
  return v6;
}

BOOL __56__RPCompanionLinkClient_HMU_HomeKit__hmu_devicesInHome___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "hmu_userWithUniqueIdentifier:", a2);
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __57__RPCompanionLinkClient_HMU_HomeKit__hmu_devicesForUser___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 homeKitUserIdentifiers];
  v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

@end