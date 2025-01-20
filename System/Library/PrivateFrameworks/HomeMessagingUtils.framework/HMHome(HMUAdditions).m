@interface HMHome(HMUAdditions)
+ (id)hmu_homesFromHomes:()HMUAdditions withHomeLocationStatus:;
+ (id)hmu_homesFromHomes:()HMUAdditions withRoomNames:;
+ (id)hmu_homesFromHomes:()HMUAdditions withZoneNames:;
- (id)hmu_accessoryWithUniqueIdentifierUUIDString:()HMUAdditions;
- (id)hmu_allRoomsIncludingRoomForEntireHome;
- (id)hmu_allUsersIncludingCurrentUser;
- (id)hmu_endpointAccessories;
- (id)hmu_homePodsDictionary;
- (id)hmu_homePodsIncludingCurrentAccessoryDictionary;
- (id)hmu_roomWithName:()HMUAdditions;
- (id)hmu_roomWithUniqueIdentifier:()HMUAdditions;
- (id)hmu_roomsWithUniqueIdentifiers:()HMUAdditions;
- (id)hmu_userWithSenderCorrelationIdentifier:()HMUAdditions;
- (id)hmu_userWithUniqueIdentifier:()HMUAdditions;
- (id)hmu_userWithUniqueIdentifierUUIDString:()HMUAdditions;
- (id)hmu_zoneWithName:()HMUAdditions;
- (id)hmu_zoneWithUniqueIdentifier:()HMUAdditions;
- (id)hmu_zonesWithUniqueIdentifiers:()HMUAdditions;
- (uint64_t)hmu_isAdministrator:()HMUAdditions;
- (uint64_t)hmu_isCurrentUserAdministrator;
- (uint64_t)hmu_isCurrentUserOwner;
- (uint64_t)hmu_isOwner:()HMUAdditions;
- (uint64_t)hmu_isRemoteAccessAllowedForCurrentUser;
- (uint64_t)hmu_isRemoteAccessAllowedForUser:()HMUAdditions;
@end

@implementation HMHome(HMUAdditions)

- (id)hmu_allUsersIncludingCurrentUser
{
  v2 = [a1 users];
  v3 = [a1 currentUser];
  v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

- (id)hmu_userWithUniqueIdentifier:()HMUAdditions
{
  id v4 = a3;
  v5 = [a1 communalUsers];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__HMHome_HMUAdditions__hmu_userWithUniqueIdentifier___block_invoke;
  v9[3] = &unk_264545340;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hmu_userWithUniqueIdentifierUUIDString:()HMUAdditions
{
  id v4 = (objc_class *)MEMORY[0x263F08C38];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithUUIDString:v5];

  if (v6)
  {
    v7 = objc_msgSend(a1, "hmu_userWithUniqueIdentifier:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)hmu_isRemoteAccessAllowedForCurrentUser
{
  v2 = [a1 currentUser];
  uint64_t v3 = objc_msgSend(a1, "hmu_isRemoteAccessAllowedForUser:", v2);

  return v3;
}

- (uint64_t)hmu_isCurrentUserAdministrator
{
  v2 = [a1 currentUser];
  uint64_t v3 = objc_msgSend(a1, "hmu_isAdministrator:", v2);

  return v3;
}

- (uint64_t)hmu_isCurrentUserOwner
{
  v2 = [a1 currentUser];
  uint64_t v3 = objc_msgSend(a1, "hmu_isOwner:", v2);

  return v3;
}

- (uint64_t)hmu_isRemoteAccessAllowedForUser:()HMUAdditions
{
  v1 = objc_msgSend(a1, "homeAccessControlForUser:");
  uint64_t v2 = [v1 isRemoteAccessAllowed];

  return v2;
}

- (uint64_t)hmu_isAdministrator:()HMUAdditions
{
  v1 = objc_msgSend(a1, "homeAccessControlForUser:");
  uint64_t v2 = [v1 isAdministrator];

  return v2;
}

- (uint64_t)hmu_isOwner:()HMUAdditions
{
  v1 = objc_msgSend(a1, "homeAccessControlForUser:");
  uint64_t v2 = [v1 isOwner];

  return v2;
}

- (id)hmu_userWithSenderCorrelationIdentifier:()HMUAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "hmu_allUsersIncludingCurrentUser");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__HMHome_HMUAdditions__hmu_userWithSenderCorrelationIdentifier___block_invoke;
  v9[3] = &unk_264545340;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

+ (id)hmu_homesFromHomes:()HMUAdditions withRoomNames:
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    id v21 = (id)objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v19 = v5;
    obuint64_t j = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          v11 = objc_msgSend(v10, "rooms", v19);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v24;
            while (2)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v24 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = [*(id *)(*((void *)&v23 + 1) + 8 * j) name];
                int v17 = [v6 containsObject:v16];

                if (v17)
                {
                  [v21 addObject:v10];
                  goto LABEL_17;
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v8);
    }

    id v5 = v19;
  }
  else
  {
    id v21 = (id)MEMORY[0x263EFFA68];
  }

  return v21;
}

+ (id)hmu_homesFromHomes:()HMUAdditions withZoneNames:
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    id v21 = (id)objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v19 = v5;
    obuint64_t j = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          v11 = objc_msgSend(v10, "zones", v19);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v24;
            while (2)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v24 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = [*(id *)(*((void *)&v23 + 1) + 8 * j) name];
                int v17 = [v6 containsObject:v16];

                if (v17)
                {
                  [v21 addObject:v10];
                  goto LABEL_17;
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v8);
    }

    id v5 = v19;
  }
  else
  {
    id v21 = (id)MEMORY[0x263EFFA68];
  }

  return v21;
}

+ (id)hmu_homesFromHomes:()HMUAdditions withHomeLocationStatus:
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__HMHome_HMUAdditions__hmu_homesFromHomes_withHomeLocationStatus___block_invoke;
  v6[3] = &__block_descriptor_40_e16_B16__0__HMHome_8l;
  v6[4] = a4;
  id v4 = objc_msgSend(a3, "na_filter:", v6);
  return v4;
}

- (id)hmu_allRoomsIncludingRoomForEntireHome
{
  uint64_t v2 = [a1 rooms];
  uint64_t v3 = [a1 roomForEntireHome];
  id v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

- (id)hmu_roomWithUniqueIdentifier:()HMUAdditions
{
  id v4 = a3;
  id v5 = [a1 rooms];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__HMHome_HMUAdditions__hmu_roomWithUniqueIdentifier___block_invoke;
  v9[3] = &unk_2645452D0;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hmu_roomsWithUniqueIdentifiers:()HMUAdditions
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [a1 rooms];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __55__HMHome_HMUAdditions__hmu_roomsWithUniqueIdentifiers___block_invoke;
    v9[3] = &unk_2645452D0;
    id v10 = v5;
    uint64_t v7 = objc_msgSend(v6, "na_filter:", v9);
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

- (id)hmu_roomWithName:()HMUAdditions
{
  id v4 = a3;
  id v5 = [a1 rooms];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__HMHome_HMUAdditions__hmu_roomWithName___block_invoke;
  v9[3] = &unk_2645452D0;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hmu_zoneWithUniqueIdentifier:()HMUAdditions
{
  id v4 = a3;
  id v5 = [a1 zones];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__HMHome_HMUAdditions__hmu_zoneWithUniqueIdentifier___block_invoke;
  v9[3] = &unk_2645452F8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hmu_zonesWithUniqueIdentifiers:()HMUAdditions
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [a1 zones];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __55__HMHome_HMUAdditions__hmu_zonesWithUniqueIdentifiers___block_invoke;
    v9[3] = &unk_2645452F8;
    id v10 = v5;
    uint64_t v7 = objc_msgSend(v6, "na_filter:", v9);
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

- (id)hmu_zoneWithName:()HMUAdditions
{
  id v4 = a3;
  id v5 = [a1 zones];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__HMHome_HMUAdditions__hmu_zoneWithName___block_invoke;
  v9[3] = &unk_2645452F8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

- (id)hmu_accessoryWithUniqueIdentifierUUIDString:()HMUAdditions
{
  id v4 = (objc_class *)MEMORY[0x263F08C38];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithUUIDString:v5];

  if (v6)
  {
    uint64_t v7 = [a1 accessoryWithUniqueIdentifier:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)hmu_homePodsDictionary
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = objc_msgSend(a1, "accessories", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "hmu_isHomePod") && (objc_msgSend(v8, "isCurrentAccessory") & 1) == 0)
        {
          v9 = [v8 uniqueIdentifier];
          [v2 setObject:v8 forKey:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)hmu_homePodsIncludingCurrentAccessoryDictionary
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v3 = objc_msgSend(a1, "hmu_homePodsDictionary");
  uint64_t v4 = [v2 dictionaryWithDictionary:v3];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = objc_msgSend(a1, "accessories", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "hmu_isHomePod"))
        {
          long long v11 = [v10 uniqueIdentifier];
          [v4 setObject:v10 forKey:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)hmu_endpointAccessories
{
  v1 = [a1 accessories];
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_1);

  return v2;
}

@end