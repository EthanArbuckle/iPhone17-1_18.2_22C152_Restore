@interface HMHome
@end

@implementation HMHome

uint64_t __53__HMHome_HMUAdditions__hmu_userWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __64__HMHome_HMUAdditions__hmu_userWithSenderCorrelationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 senderCorrelationIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

BOOL __66__HMHome_HMUAdditions__hmu_homesFromHomes_withHomeLocationStatus___block_invoke(uint64_t a1, void *a2)
{
  return [a2 homeLocationStatus] == *(void *)(a1 + 32);
}

uint64_t __53__HMHome_HMUAdditions__hmu_roomWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __55__HMHome_HMUAdditions__hmu_roomsWithUniqueIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __41__HMHome_HMUAdditions__hmu_roomWithName___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __53__HMHome_HMUAdditions__hmu_zoneWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __55__HMHome_HMUAdditions__hmu_zonesWithUniqueIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __41__HMHome_HMUAdditions__hmu_zoneWithName___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __47__HMHome_HMUAdditions__hmu_endpointAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmu_isEndpoint");
}

uint64_t __51__HMHome_HMU_IDS__hmu_accessoryWithFromID_service___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(a2, "hmu_destinationForService:", *(void *)(a1 + 32));
  uint64_t v4 = [v3 destinationURIs];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HMHome_HMU_IDS__hmu_accessoryWithFromID_service___block_invoke_2;
  v7[3] = &unk_2645453F8;
  id v8 = *(id *)(a1 + 40);
  uint64_t v5 = objc_msgSend(v4, "na_any:", v7);

  return v5;
}

uint64_t __51__HMHome_HMU_IDS__hmu_accessoryWithFromID_service___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(a1 + 32)];
}

uint64_t __38__HMHome_HMU_IDS__hmu_userWithFromID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 userIDSURI];
  uint64_t v4 = [v3 destinationURIs];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__HMHome_HMU_IDS__hmu_userWithFromID___block_invoke_2;
  v7[3] = &unk_2645453F8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v5 = objc_msgSend(v4, "na_any:", v7);

  return v5;
}

uint64_t __38__HMHome_HMU_IDS__hmu_userWithFromID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(a1 + 32)];
}

uint64_t __43__HMHome_HMU_IDS__hmu_userWithDestination___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 destinationURIs];
  uint64_t v5 = [v3 userIDSURI];

  v6 = [v5 destinationURIs];
  uint64_t v7 = [v4 intersectsSet:v6];

  return v7;
}

uint64_t __56__HMHome_HMU_IDS__hmu_accessoryWithDestination_service___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hmu_destinationForService:", *(void *)(a1 + 32));
  uint64_t v4 = [v3 destinationURIs];
  uint64_t v5 = [*(id *)(a1 + 40) destinationURIs];
  uint64_t v6 = [v4 intersectsSet:v5];

  return v6;
}

@end