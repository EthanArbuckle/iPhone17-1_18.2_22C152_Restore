@interface ANMessengerDestination
+ (id)_bestRemoteRelayAccessoryFromAccessories:(id)a3 inHome:(id)a4;
+ (id)_destinationForAppleAccessories:(id)a3 home:(id)a4 rooms:(id)a5 rapportConnection:(id)a6;
+ (id)destinationForAccessoriesInHome:(id)a3 rooms:(id)a4 rapportConnection:(id)a5;
+ (id)destinationForHome:(id)a3 excludingUsers:(id)a4 excludingAccessories:(id)a5 rapportConnection:(id)a6;
+ (id)relayDestinationForHome:(id)a3 rooms:(id)a4 rapportConnection:(id)a5 error:(id *)a6;
- (ANMessengerDestination)init;
- (BOOL)addAccessory:(id)a3;
- (BOOL)addDeviceWithID:(id)a3 rapportConnection:(id)a4;
- (BOOL)addUser:(id)a3 inHome:(id)a4;
- (HMHome)home;
- (NSArray)accessories;
- (NSArray)devices;
- (NSArray)users;
- (id)idsIdentifiersForService:(id)a3;
- (id)participantsWithService:(id)a3;
- (void)addUser:(id)a3 inHome:(id)a4 rapportConnection:(id)a5;
- (void)removeDeviceWithID:(id)a3;
- (void)removeUser:(id)a3;
- (void)removeUser:(id)a3 rapportConnection:(id)a4;
- (void)setAccessories:(id)a3;
- (void)setDevices:(id)a3;
- (void)setHome:(id)a3;
- (void)setUsers:(id)a3;
@end

@implementation ANMessengerDestination

- (ANMessengerDestination)init
{
  v9.receiver = self;
  v9.super_class = (Class)ANMessengerDestination;
  v2 = [(ANMessengerDestination *)&v9 init];
  v3 = v2;
  if (v2)
  {
    accessories = v2->_accessories;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_accessories = (NSArray *)MEMORY[0x1E4F1CBF0];

    users = v3->_users;
    v3->_users = v5;

    devices = v3->_devices;
    v3->_devices = v5;
  }
  return v3;
}

- (id)idsIdentifiersForService:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA80];
  v6 = [(ANMessengerDestination *)self users];
  uint64_t v7 = [v6 count];
  v8 = [(ANMessengerDestination *)self accessories];
  objc_super v9 = objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v8, "count") + v7);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v10 = [(ANMessengerDestination *)self users];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v16 = [v15 userIDSURI];

        if (v16)
        {
          v17 = [v15 userIDSURI];
          v18 = [v17 prefixedURI];
          [v9 addObject:v18];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v12);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v19 = [(ANMessengerDestination *)self accessories];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = [*(id *)(*((void *)&v30 + 1) + 8 * j) device];
        v25 = [v24 IDSDestinationForIDSService:v4];
        v26 = [v25 destinationURIs];
        v27 = [v26 anyObject];

        if (v27) {
          [v9 addObject:v27];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v21);
  }

  v28 = [v9 allObjects];

  return v28;
}

- (id)participantsWithService:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  v5 = [(ANMessengerDestination *)self users];
  uint64_t v6 = [v5 count];
  uint64_t v7 = [(ANMessengerDestination *)self accessories];
  uint64_t v8 = [v7 count] + v6;
  objc_super v9 = [(ANMessengerDestination *)self devices];
  v10 = objc_msgSend(v4, "arrayWithCapacity:", v8 + objc_msgSend(v9, "count"));

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v34 = self;
  uint64_t v11 = [(ANMessengerDestination *)self users];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = (void *)[objc_alloc(MEMORY[0x1E4F4A910]) initWithUser:*(void *)(*((void *)&v45 + 1) + 8 * i)];
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v13);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = [(ANMessengerDestination *)v34 accessories];
  uint64_t v17 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F4A910]) initWithAccessory:v21];
        v23 = [v21 device];
        v24 = [v23 IDSDestinationForIDSService:v36];
        v25 = [v24 destinationURIs];
        v26 = [v25 anyObject];

        if (v26) {
          [v22 setIdsID:v26];
        }
        [v10 addObject:v22];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v18);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v27 = [(ANMessengerDestination *)v34 devices];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(v27);
        }
        long long v32 = (void *)[objc_alloc(MEMORY[0x1E4F4A910]) initWithDevice:*(void *)(*((void *)&v37 + 1) + 8 * k)];
        [v10 addObject:v32];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v29);
  }

  return v10;
}

- (BOOL)addDeviceWithID:(id)a3 rapportConnection:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  int v9 = [v8 BOOLForDefault:*MEMORY[0x1E4F4A6F0]];

  if (v9)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v10 = objc_msgSend(v7, "devices", 0);
    uint64_t v11 = [v10 activeDevicesSupportingAnnounce];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v17 = [v16 idsDeviceIdentifier];
          char v18 = [v17 isEqualToString:v6];

          if (v18)
          {
            uint64_t v20 = [(ANMessengerDestination *)self devices];
            uint64_t v21 = (void *)[v20 mutableCopy];

            [v21 addObject:v16];
            [(ANMessengerDestination *)self setDevices:v21];

            BOOL v19 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    BOOL v19 = 0;
LABEL_13:
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)addUser:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((objc_msgSend(v7, "hmu_isRemoteAccessAllowedForUser:", v6) & 1) != 0
    || [v7 announceAccessAllowedForUser:v6])
  {
    uint64_t v8 = [(ANMessengerDestination *)self users];
    int v9 = (void *)[v8 mutableCopy];

    [v9 addObject:v6];
    [(ANMessengerDestination *)self setUsers:v9];

    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)addUser:(id)a3 inHome:(id)a4 rapportConnection:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(ANMessengerDestination *)self addUser:v9 inHome:a4];
  BOOL v10 = [(ANMessengerDestination *)self devices];
  id v14 = (id)[v10 mutableCopy];

  uint64_t v11 = [v8 devices];

  uint64_t v12 = [v11 activePersonalDevicesSupportingAnnounce];
  uint64_t v13 = [v12 personalDevicesForUser:v9];

  [v14 addObjectsFromArray:v13];
  [(ANMessengerDestination *)self setDevices:v14];
}

- (BOOL)addAccessory:(id)a3
{
  id v4 = a3;
  v5 = [(ANMessengerDestination *)self accessories];
  id v6 = (void *)[v5 mutableCopy];

  [v6 addObject:v4];
  [(ANMessengerDestination *)self setAccessories:v6];

  return 1;
}

- (void)removeUser:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(ANMessengerDestination *)self users];
    id v6 = (void *)[v5 mutableCopy];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37__ANMessengerDestination_removeUser___block_invoke;
    v13[3] = &unk_1E6BCEAF0;
    id v7 = v4;
    id v14 = v7;
    uint64_t v8 = [v6 indexOfObjectPassingTest:v13];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = v8;
      BOOL v10 = ANLogHandleMessengerDestination();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [v7 userID];
        uint64_t v12 = [v7 uniqueIdentifier];
        *(_DWORD *)buf = 138412802;
        v16 = &stru_1F34A0E10;
        __int16 v17 = 2112;
        char v18 = v11;
        __int16 v19 = 2112;
        uint64_t v20 = v12;
        _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "%@Removed User from Destination: %@, %@", buf, 0x20u);
      }
      [v6 removeObjectAtIndex:v9];
      [(ANMessengerDestination *)self setUsers:v6];
    }
  }
}

uint64_t __37__ANMessengerDestination_removeUser___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)removeDeviceWithID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(ANMessengerDestination *)self devices];
    id v6 = (void *)[v5 mutableCopy];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__ANMessengerDestination_removeDeviceWithID___block_invoke;
    v13[3] = &unk_1E6BCEAF0;
    id v7 = v4;
    id v14 = v7;
    uint64_t v8 = [v6 indexOfObjectPassingTest:v13];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = v8;
      BOOL v10 = [v6 objectAtIndex:v8];
      uint64_t v11 = ANLogHandleMessengerDestination();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v10 name];
        *(_DWORD *)buf = 138412802;
        v16 = &stru_1F34A0E10;
        __int16 v17 = 2112;
        char v18 = v12;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "%@Removed Device ID from Destination: %@, %@", buf, 0x20u);
      }
      [v6 removeObjectAtIndex:v9];
      [(ANMessengerDestination *)self setDevices:v6];
    }
  }
}

uint64_t __45__ANMessengerDestination_removeDeviceWithID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 idsDeviceIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)removeUser:(id)a3 rapportConnection:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(ANMessengerDestination *)self removeUser:v6];
  uint64_t v8 = [v7 devices];
  uint64_t v9 = [v8 activePersonalDevicesSupportingAnnounce];
  BOOL v10 = [v9 personalDevicesForUser:v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v15), "idsDeviceIdentifier", (void)v17);
        [(ANMessengerDestination *)self removeDeviceWithID:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

+ (id)relayDestinationForHome:(id)a3 rooms:(id)a4 rapportConnection:(id)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v38 = a5;
  id v11 = (void *)MEMORY[0x1E4F2E4F8];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F2EA80], "hmu_accessoriesInRooms:", v10);
  uint64_t v13 = [v11 appleAnnounceHostAccessoriesFromAccessories:v12];

  if ([v13 count])
  {
    id v14 = v13;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F2E4F8];
    v16 = [v9 accessories];
    id v14 = [v15 appleAnnounceHostAccessoriesFromAccessories:v16];
  }
  long long v17 = [MEMORY[0x1E4F2E4F8] accessoriesWithAnnounceEnabledFromAccessories:v14];
  if ([v17 count]) {
    long long v18 = v17;
  }
  else {
    long long v18 = v14;
  }
  long long v19 = [v18 sortedArrayUsingComparator:&__block_literal_global_22];
  long long v20 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  int v21 = [v20 BOOLForDefault:*MEMORY[0x1E4F4A6F0]];

  if (v21)
  {
    id v37 = v10;
    uint64_t v22 = +[ANMessengerDestination _destinationForAppleAccessories:v19 home:v9 rooms:v10 rapportConnection:v38];
    long long v23 = [v22 devices];
    long long v24 = ANLogHandleMessengerDestination();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      long long v42 = &stru_1F34A0E10;
      __int16 v43 = 2048;
      uint64_t v44 = [v23 count];
      _os_log_impl(&dword_1DA5ED000, v24, OS_LOG_TYPE_DEFAULT, "%@Checking (%lu) nearby Accessories for Relay Viability", buf, 0x16u);
    }

    if ([v23 count])
    {
      long long v25 = [v23 firstObject];
      long long v26 = ANLogHandleMessengerDestination();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v42 = &stru_1F34A0E10;
        __int16 v43 = 2112;
        uint64_t v44 = (uint64_t)v25;
        _os_log_impl(&dword_1DA5ED000, v26, OS_LOG_TYPE_DEFAULT, "%@Relaying Announcement through Nearby Accessory (%@)", buf, 0x16u);
      }

      v27 = objc_opt_new();
      [v27 setHome:v9];
      long long v40 = v25;
      uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
      [v27 setDevices:v28];

      id v10 = v37;
      goto LABEL_28;
    }

    id v10 = v37;
  }
  if (!objc_msgSend(v9, "hmu_isRemoteAccessAllowedForCurrentUser"))
  {
    if (a6)
    {
      long long v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F4A728];
      uint64_t v35 = 1032;
LABEL_26:
      objc_msgSend(v33, "an_errorWithCode:component:", v35, v34);
      v27 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
LABEL_27:
    v27 = 0;
    goto LABEL_28;
  }
  uint64_t v29 = +[ANMessengerDestination _bestRemoteRelayAccessoryFromAccessories:v19 inHome:v9];
  uint64_t v30 = ANLogHandleMessengerDestination();
  long long v31 = v30;
  if (!v29)
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v42 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v31, OS_LOG_TYPE_ERROR, "%@Failed to find Accessory for remote relay", buf, 0xCu);
    }

    if (a6)
    {
      long long v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F4A728];
      uint64_t v35 = 1015;
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    long long v42 = &stru_1F34A0E10;
    __int16 v43 = 2112;
    uint64_t v44 = (uint64_t)v29;
    _os_log_impl(&dword_1DA5ED000, v31, OS_LOG_TYPE_DEFAULT, "%@Relaying Announcement through Accessory %@", buf, 0x16u);
  }

  v27 = objc_opt_new();
  [v27 setHome:v9];
  long long v39 = v29;
  long long v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  [v27 setAccessories:v32];

LABEL_28:
  return v27;
}

uint64_t __80__ANMessengerDestination_relayDestinationForHome_rooms_rapportConnection_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 softwareVersion];
  id v6 = [v4 softwareVersion];

  uint64_t v7 = [v5 compare:v6];
  uint64_t v8 = 1;
  if (v7 != -1) {
    uint64_t v8 = v7;
  }
  if (v7 == 1) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = v8;
  }

  return v9;
}

+ (id)destinationForHome:(id)a3 excludingUsers:(id)a4 excludingAccessories:(id)a5 rapportConnection:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = (void *)MEMORY[0x1E4F2E4F8];
  id v13 = a5;
  id v14 = [v9 accessories];
  uint64_t v15 = [v12 appleAnnounceHostAccessoriesFromAccessories:v14];
  v16 = (void *)[v15 mutableCopy];

  [v16 removeObjectsInArray:v13];
  long long v17 = (void *)[v16 copy];
  long long v18 = objc_msgSend(v9, "hmu_allRoomsIncludingRoomForEntireHome");
  long long v19 = +[ANMessengerDestination _destinationForAppleAccessories:v17 home:v9 rooms:v18 rapportConnection:v11];

  [v19 setHome:v9];
  long long v20 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  int v21 = [v20 BOOLForDefault:*MEMORY[0x1E4F4A6F0]];

  if (v21 && [MEMORY[0x1E4F4A898] isEnabledForPersonalDevices])
  {
    uint64_t v22 = [v11 devices];
    long long v23 = [v22 activeAccessoryDevicesSupportingAnnounce];
    long long v24 = [v23 allValues];
    long long v25 = (void *)[v24 mutableCopy];

    id v37 = [v19 devices];
    [v25 removeObjectsInArray:v37];
    long long v26 = [v11 devices];
    v27 = [v26 activeDevicesSupportingAnnounce];
    uint64_t v28 = (void *)[v27 mutableCopy];

    [v28 removeObjectsInArray:v25];
    uint64_t v29 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v30 = [v9 usersIncludingCurrentUserWithAnnounceEnabled];
    long long v31 = [v29 arrayWithArray:v30];

    [v31 removeObjectsInArray:v10];
    long long v32 = [v28 devicesByRemovingNonAccessoryDevicesNotBelongingToUsers:v31];
    [v19 setDevices:v32];
  }
  if ([MEMORY[0x1E4F4A898] isEnabledForPersonalDevices])
  {
    long long v33 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v34 = [v9 usersIncludingCurrentUserWithAnnounceAndRemoteAccessEnabled];
    uint64_t v35 = [v33 arrayWithArray:v34];

    [v35 removeObjectsInArray:v10];
    [v19 setUsers:v35];
  }
  return v19;
}

+ (id)destinationForAccessoriesInHome:(id)a3 rooms:(id)a4 rapportConnection:(id)a5
{
  uint64_t v7 = (void *)MEMORY[0x1E4F2E4F8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 accessories];
  uint64_t v12 = [v7 appleAnnounceHostAccessoriesFromAccessories:v11];

  id v13 = +[ANMessengerDestination _destinationForAppleAccessories:v12 home:v10 rooms:v9 rapportConnection:v8];

  [v13 setHome:v10];
  return v13;
}

+ (id)_destinationForAppleAccessories:(id)a3 home:(id)a4 rooms:(id)a5 rapportConnection:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a6;
  id v10 = [v9 activateLinkWithOptions:2];
  if (v10)
  {
    id v11 = ANLogHandleMessengerDestination();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v34 = &stru_1F34A0E10;
      __int16 v35 = 2112;
      id v36 = v10;
      _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_ERROR, "%@Activate Rapport link failed with error: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = [v9 devices];
  id v13 = [v12 activeAccessoryDevicesSupportingAnnounce];

  id v14 = objc_opt_new();
  uint64_t v15 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  int v16 = [v15 BOOLForDefault:*MEMORY[0x1E4F4A6F0]];

  if (v16)
  {
    id v26 = a1;
    id v27 = v8;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v8;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "uniqueIdentifier", v26, v27, (void)v28);
          long long v23 = [v13 objectForKey:v22];

          if (v23) {
            [v14 addObject:v23];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v19);
    }

    id v8 = v27;
  }
  long long v24 = objc_opt_new();
  [v24 setDevices:v14];

  return v24;
}

+ (id)_bestRemoteRelayAccessoryFromAccessories:(id)a3 inHome:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = ANLogHandleMessengerDestination();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v53 = &stru_1F34A0E10;
    __int16 v54 = 2048;
    uint64_t v55 = [v5 count];
    _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "%@Checking (%lu) remote Accessories for Relay Viability", buf, 0x16u);
  }

  if ([v5 count] == 1)
  {
    id v8 = ANLogHandleMessengerDestination();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v5 firstObject];
      *(_DWORD *)buf = 138412546;
      v53 = &stru_1F34A0E10;
      __int16 v54 = 2112;
      uint64_t v55 = (uint64_t)v9;
      _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@Selected Single Accessory: %@", buf, 0x16u);
    }
    id v10 = [v5 firstObject];
    goto LABEL_30;
  }
  id v41 = v5;
  long long v42 = v6;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v5;
  uint64_t v11 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v49;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        int v16 = ANLogHandleMessengerDestination();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [v15 name];
          uint64_t v18 = [v15 uniqueIdentifier];
          uint64_t v19 = [v15 settings];
          int v20 = [v19 isControllable];
          int v21 = [v15 supportsAnnounce];
          *(_DWORD *)buf = 138413314;
          v53 = &stru_1F34A0E10;
          __int16 v54 = 2112;
          uint64_t v55 = (uint64_t)v17;
          __int16 v56 = 2112;
          v57 = v18;
          __int16 v58 = 1024;
          int v59 = v20;
          __int16 v60 = 1024;
          int v61 = v21;
          _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_DEFAULT, "%@Checking if Accessory can Relay: %@, HomeKitID: %@, Controllable: %d, Announce Supported: %d", buf, 0x2Cu);
        }
        uint64_t v22 = [v15 settings];
        int v23 = [v22 isControllable];

        if (v23)
        {
          uint64_t v37 = ANLogHandleMessengerDestination();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v53 = &stru_1F34A0E10;
            __int16 v54 = 2112;
            uint64_t v55 = (uint64_t)v15;
            _os_log_impl(&dword_1DA5ED000, v37, OS_LOG_TYPE_DEFAULT, "%@Found controllable accessory: %@", buf, 0x16u);
          }

          id v10 = v15;
          goto LABEL_29;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  long long v24 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  int v25 = [v24 BOOLForDefault:*MEMORY[0x1E4F4A610]];

  if (v25)
  {
    id v26 = ANLogHandleMessengerDestination();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v26, OS_LOG_TYPE_DEFAULT, "%@Checking Residents for Relay", buf, 0xCu);
    }

    id v27 = [v42 residentDevices];
    long long v28 = objc_msgSend(v27, "na_filter:", &__block_literal_global_17);

    long long v29 = (void *)MEMORY[0x1E4F2E4F8];
    long long v30 = [v42 accessories];
    long long v31 = [v29 appleAnnounceHostAccessoriesFromAccessories:v30];

    long long v32 = objc_msgSend(v28, "na_firstObjectPassingTest:", &__block_literal_global_19);
    long long v33 = v32;
    if (v32)
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __74__ANMessengerDestination__bestRemoteRelayAccessoryFromAccessories_inHome___block_invoke_3;
      v46[3] = &unk_1E6BCEB58;
      id v47 = v32;
      uint64_t v34 = objc_msgSend(v31, "na_firstObjectPassingTest:", v46);
      if (v34)
      {
        id v10 = (id)v34;
        __int16 v35 = ANLogHandleMessengerDestination();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v53 = &stru_1F34A0E10;
          __int16 v54 = 2112;
          uint64_t v55 = (uint64_t)v10;
          _os_log_impl(&dword_1DA5ED000, v35, OS_LOG_TYPE_DEFAULT, "%@Selected Primary Resident in Target List: %@", buf, 0x16u);
        }

        id v36 = v47;
        id v6 = v42;
LABEL_39:

        id v5 = v41;
        goto LABEL_30;
      }
    }
    long long v39 = objc_msgSend(v28, "na_map:", &__block_literal_global_24, v41);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __74__ANMessengerDestination__bestRemoteRelayAccessoryFromAccessories_inHome___block_invoke_2_25;
    v44[3] = &unk_1E6BCEB58;
    id v45 = v39;
    id v36 = v39;
    objc_msgSend(v31, "na_firstObjectPassingTest:", v44);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = v42;
    if (v10)
    {
      long long v40 = ANLogHandleMessengerDestination();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v53 = &stru_1F34A0E10;
        __int16 v54 = 2112;
        uint64_t v55 = (uint64_t)v10;
        _os_log_impl(&dword_1DA5ED000, v40, OS_LOG_TYPE_DEFAULT, "%@Selected any Announce-capable Accessory: %@", buf, 0x16u);
      }
    }
    goto LABEL_39;
  }
  id v10 = 0;
LABEL_29:
  id v5 = v41;
  id v6 = v42;
LABEL_30:

  return v10;
}

unint64_t __74__ANMessengerDestination__bestRemoteRelayAccessoryFromAccessories_inHome___block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 capabilities] >> 15) & 1;
}

unint64_t __74__ANMessengerDestination__bestRemoteRelayAccessoryFromAccessories_inHome___block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 status] >> 1) & 1;
}

uint64_t __74__ANMessengerDestination__bestRemoteRelayAccessoryFromAccessories_inHome___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 device];
  id v4 = [v3 uniqueIdentifier];
  id v5 = [*(id *)(a1 + 32) device];
  id v6 = [v5 uniqueIdentifier];
  uint64_t v7 = [v4 isEqual:v6];

  return v7;
}

uint64_t __74__ANMessengerDestination__bestRemoteRelayAccessoryFromAccessories_inHome___block_invoke_21(uint64_t a1, void *a2)
{
  return [a2 device];
}

uint64_t __74__ANMessengerDestination__bestRemoteRelayAccessoryFromAccessories_inHome___block_invoke_2_25(uint64_t a1, void *a2)
{
  v3 = [a2 device];
  if (v3) {
    uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
}

- (NSArray)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end