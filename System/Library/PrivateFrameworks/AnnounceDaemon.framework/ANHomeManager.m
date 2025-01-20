@interface ANHomeManager
+ (id)bundleForLocationAuthorization;
+ (id)shared;
+ (unint64_t)defaultHomeOptions;
- (ANAccessorySettingsCache)accessorySettingsCache;
- (ANHomeManager)init;
- (ANHomeManager)initWithCaching:(BOOL)a3;
- (ANHomeManager)initWithCaching:(BOOL)a3 homeOptions:(unint64_t)a4;
- (BOOL)homesLoaded;
- (BOOL)isEndpointWithUUID:(id)a3 inRoomWithName:(id)a4;
- (BOOL)isLocalDeviceInRoom:(id)a3;
- (HMAccessory)currentAccessory;
- (HMHome)currentHome;
- (HMHomeManager)homeManager;
- (NSArray)allHomes;
- (NSArray)homesSupportingAnnounce;
- (NSDate)loadHomesStart;
- (NSMapTable)delegatesToQueues;
- (NSMutableArray)homesLoadedCompletionHandlers;
- (OS_dispatch_queue)serialQueue;
- (id)_currentHomesWeAreIn;
- (id)_findBestHomeNames;
- (id)_homeNamesForAccessoryForContext:(id)a3;
- (id)_homesForContext:(id)a3;
- (id)homeForID:(id)a3;
- (id)homeNamesForContext:(id)a3;
- (id)homeWithName:(id)a3;
- (id)homesWithRoomNames:(id)a3;
- (id)homesWithZoneNames:(id)a3;
- (id)refreshHomeSynchronous;
- (void)_executeBlockForDelegates:(id)a3;
- (void)_notifyManagerLoadedHomes:(id)a3;
- (void)accessoryDidUpdateControllable:(id)a3;
- (void)accessoryDidUpdateName:(id)a3;
- (void)accessoryDidUpdateSupportsAudioAnalysis:(id)a3;
- (void)accessoryDidUpdateSupportsDropIn:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)home:(id)a3 didUpdateAccessControlForUser:(id)a4;
- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)loadHomeSynchronous;
- (void)loadHomes:(id)a3;
- (void)registerDelegate:(id)a3 queue:(id)a4;
- (void)setHomesLoaded:(BOOL)a3;
@end

@implementation ANHomeManager

- (id)homeForID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(ANHomeManager *)self allHomes];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "uniqueIdentifier", (void)v13);
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)homeWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(ANHomeManager *)self allHomes];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "name", (void)v13);
        uint64_t v11 = [v10 caseInsensitiveCompare:v4];

        if (!v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)homesWithRoomNames:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F2E7F8];
  id v5 = a3;
  id v6 = [(ANHomeManager *)self allHomes];
  uint64_t v7 = objc_msgSend(v4, "hmu_homesFromHomes:withRoomNames:", v6, v5);

  return v7;
}

- (id)homesWithZoneNames:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F2E7F8];
  id v5 = a3;
  id v6 = [(ANHomeManager *)self allHomes];
  uint64_t v7 = objc_msgSend(v4, "hmu_homesFromHomes:withZoneNames:", v6, v5);

  return v7;
}

- (NSArray)homesSupportingAnnounce
{
  v2 = [(ANHomeManager *)self allHomes];
  v3 = objc_msgSend(v2, "an_homesSupportingAnnounce");

  return (NSArray *)v3;
}

- (BOOL)isLocalDeviceInRoom:(id)a3
{
  id v4 = a3;
  if (![(ANHomeManager *)self homesLoaded]) {
    [(ANHomeManager *)self loadHomeSynchronous];
  }
  id v5 = [(ANHomeManager *)self currentAccessory];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 room];

    if (v7)
    {
      v8 = [v6 room];
      v9 = [v8 name];
      LOBYTE(v7) = [v9 isEqualToString:v4];
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (BOOL)isEndpointWithUUID:(id)a3 inRoomWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(ANHomeManager *)self homesLoaded]) {
    [(ANHomeManager *)self loadHomeSynchronous];
  }
  v8 = [(ANHomeManager *)self currentAccessory];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = v10;
    if (v6
      && ([v10 home],
          v12 = objc_claimAutoreleasedReturnValue(),
          [v12 accessoryWithUniqueIdentifier:v6],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          v11,
          v12,
          (uint64_t v11 = (void *)v13) == 0))
    {
      LOBYTE(v14) = 0;
    }
    else
    {
      long long v14 = [v11 room];

      if (v14)
      {
        long long v15 = [v11 room];
        long long v16 = [v15 name];
        LOBYTE(v14) = [v16 isEqualToString:v7];
      }
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return (char)v14;
}

- (id)homeNamesForContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(ANHomeManager *)self homesLoaded]) {
    [(ANHomeManager *)self loadHomeSynchronous];
  }
  if ([v4 isEmpty])
  {
    id v5 = ANLogHandleHomeManager_HomeContext();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      long long v14 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@Home Context empty. Will find best home names.", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v6 = [(ANHomeManager *)self _findBestHomeNames];
LABEL_11:
    id v10 = (void *)v6;
    goto LABEL_12;
  }
  id v7 = [(ANHomeManager *)self currentAccessory];

  v8 = ANLogHandleHomeManager_HomeContext();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v13 = 138412290;
      long long v14 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@Will find home names for Accessory.", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v6 = [(ANHomeManager *)self _homeNamesForAccessoryForContext:v4];
    goto LABEL_11;
  }
  if (v9)
  {
    int v13 = 138412290;
    long long v14 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@Will find home names for personal device.", (uint8_t *)&v13, 0xCu);
  }

  v12 = [(ANHomeManager *)self _homesForContext:v4];
  id v10 = objc_msgSend(v12, "na_map:", &__block_literal_global_12);

LABEL_12:
  return v10;
}

uint64_t __50__ANHomeManager_HomeContext__homeNamesForContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (id)_homesForContext:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 homeName];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = [v4 homeName];
    id v8 = [(ANHomeManager *)self homeWithName:v7];

    if (v8)
    {
      v26[0] = v8;
      BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    }
    else
    {
      BOOL v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v10 = [(ANHomeManager *)self currentAccessory];
    if (v10)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      uint64_t v11 = [(ANHomeManager *)self _currentHomesWeAreIn];
    }

    uint64_t v12 = [v11 count];
    int v13 = ANLogHandleHomeManager_HomeContext();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        int v24 = 138412290;
        v25 = &stru_1F34A0E10;
        _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "%@Checking Current Homes we are in for Rooms and Zones", (uint8_t *)&v24, 0xCu);
      }

      id v8 = v11;
    }
    else
    {
      if (v14)
      {
        int v24 = 138412290;
        v25 = &stru_1F34A0E10;
        _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "%@Checking All Homes Supporting Announce for Rooms and Zones", (uint8_t *)&v24, 0xCu);
      }

      uint64_t v15 = [(ANHomeManager *)self allHomes];
      objc_msgSend(v15, "an_homesSupportingAnnounce");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    long long v16 = objc_opt_new();
    v17 = (void *)MEMORY[0x1E4F2E7F8];
    uint64_t v18 = [v4 roomNames];
    v19 = objc_msgSend(v17, "hmu_homesFromHomes:withRoomNames:", v8, v18);
    [v16 addObjectsFromArray:v19];

    v20 = (void *)MEMORY[0x1E4F2E7F8];
    v21 = [v4 zoneNames];
    v22 = objc_msgSend(v20, "hmu_homesFromHomes:withZoneNames:", v8, v21);
    [v16 addObjectsFromArray:v22];

    BOOL v9 = [v16 allObjects];
  }
  return v9;
}

- (id)_homeNamesForAccessoryForContext:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ANHomeManager *)self currentAccessory];
  uint64_t v6 = [v5 home];

  id v7 = ANLogHandleHomeManager_HomeContext();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 name];
    *(_DWORD *)buf = 138412546;
    v32 = &stru_1F34A0E10;
    __int16 v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "%@Acessory Home Name: %@", buf, 0x16u);
  }
  if (v6)
  {
    BOOL v9 = [v4 homeName];
    if ([v9 length])
    {
      id v10 = [v4 homeName];
      uint64_t v11 = [v6 name];
      int v12 = [v10 isEqualToString:v11];

      if (!v12)
      {
        int v13 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_22;
      }
    }
    else
    {
    }
    [(ANHomeManager *)self _homesForContext:v4];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    BOOL v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v20 = objc_msgSend(v19, "uniqueIdentifier", (void)v25);
          v21 = [v6 uniqueIdentifier];
          char v22 = [v20 isEqual:v21];

          if (v22)
          {
            v23 = [v19 name];
            v29 = v23;
            int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];

            goto LABEL_21;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    BOOL v14 = ANLogHandleHomeManager_HomeContext();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v14, OS_LOG_TYPE_ERROR, "%@Accessory does not have a home", buf, 0xCu);
    }
  }
  int v13 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_21:

LABEL_22:
  return v13;
}

- (id)_findBestHomeNames
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v3 = [(ANHomeManager *)self currentAccessory];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 home];
    id v6 = v5;
    if (!v5)
    {
      id v8 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_21;
    }
    id v7 = [v5 name];
    v27[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  }
  else
  {
    id v8 = objc_opt_new();
    id v7 = [(ANHomeManager *)self _currentHomesWeAreIn];
    if ([v7 count])
    {
      BOOL v9 = ANLogHandleHomeManager_HomeContext();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        int v24 = &stru_1F34A0E10;
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "%@Selecting Current Homes: %@", buf, 0x16u);
      }

      id v10 = v7;
    }
    else
    {
      id v10 = [(ANHomeManager *)self homesSupportingAnnounce];
      uint64_t v11 = ANLogHandleHomeManager_HomeContext();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        int v24 = &stru_1F34A0E10;
        __int16 v25 = 2112;
        id v26 = v10;
        _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "%@Selecting All Homes Supporting announce: %@", buf, 0x16u);
      }
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v10;
    uint64_t v12 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v6);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "name", (void)v18);
          [v8 addObject:v16];
        }
        uint64_t v13 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }
  }
LABEL_21:

  return v8;
}

- (id)_currentHomesWeAreIn
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = (void *)MEMORY[0x1E4F2E7F8];
  id v5 = [(ANHomeManager *)self allHomes];
  id v6 = objc_msgSend(v4, "hmu_homesFromHomes:withHomeLocationStatus:", v5, 1);
  id v7 = [v3 setWithArray:v6];

  uint64_t v8 = [(ANHomeManager *)self currentHome];
  BOOL v9 = ANLogHandleHomeManager_HomeContext();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v35 = &stru_1F34A0E10;
    __int16 v36 = 2112;
    uint64_t v37 = v8;
    _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "%@Current Home: %@", buf, 0x16u);
  }
  long long v28 = (void *)v8;

  id v10 = ANLogHandleHomeManager_HomeContext();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v35 = &stru_1F34A0E10;
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v7;
    _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "%@Homes with Location Status at Home: %@", buf, 0x16u);
  }
  v29 = v7;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v27 = self;
  uint64_t v11 = [(ANHomeManager *)self allHomes];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v17 = ANLogHandleHomeManager_HomeContext();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v16 homeLocationStatus];
          *(_DWORD *)buf = 138412802;
          uint64_t v35 = &stru_1F34A0E10;
          __int16 v36 = 2112;
          uint64_t v37 = (uint64_t)v16;
          __int16 v38 = 2048;
          uint64_t v39 = v18;
          _os_log_impl(&dword_1DA5ED000, v17, OS_LOG_TYPE_DEFAULT, "%@HomeKit Location Status: %@: %ld", buf, 0x20u);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v13);
  }

  if (v28 && ![v7 count])
  {
    __int16 v25 = ANLogHandleHomeManager_HomeContext();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v25, OS_LOG_TYPE_DEFAULT, "%@Current Home is set but no Homes with Location Status at Home. Falling back to all Homes.", buf, 0xCu);
    }

    uint64_t v19 = [(ANHomeManager *)v27 allHomes];
    goto LABEL_24;
  }
  if ([v7 count] == 1)
  {
    uint64_t v19 = [v7 allObjects];
LABEL_24:
    int v24 = (void *)v19;
    goto LABEL_25;
  }
  long long v20 = (void *)MEMORY[0x1E4F1CA80];
  long long v21 = [v29 allObjects];
  char v22 = objc_msgSend(v21, "an_homesSupportingAnnounce");
  v23 = [v20 setWithArray:v22];

  if (v28) {
    [v23 addObject:v28];
  }
  int v24 = [v23 allObjects];

LABEL_25:
  return v24;
}

+ (id)bundleForLocationAuthorization
{
  return (id)[MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/LocationBundles/HomeKitDaemon.framework"];
}

- (ANHomeManager)init
{
  return [(ANHomeManager *)self initWithCaching:1];
}

- (ANHomeManager)initWithCaching:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = +[ANHomeManager defaultHomeOptions];
  return [(ANHomeManager *)self initWithCaching:v3 homeOptions:v5];
}

- (ANHomeManager)initWithCaching:(BOOL)a3 homeOptions:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)ANHomeManager;
  id v6 = [(ANHomeManager *)&v32 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.announce.homeManager", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:517 valueOptions:0];
    delegatesToQueues = v6->_delegatesToQueues;
    v6->_delegatesToQueues = (NSMapTable *)v9;

    uint64_t v11 = objc_opt_new();
    homesLoadedCompletionHandlers = v6->_homesLoadedCompletionHandlers;
    v6->_homesLoadedCompletionHandlers = (NSMutableArray *)v11;

    if (v5) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = [MEMORY[0x1E4F4A8E0] sharedInstance];
    int v15 = [v14 BOOLForDefault:*MEMORY[0x1E4F4A620]];

    if (v15)
    {
      uint64_t v16 = ANLogHandleHomeManager();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v34 = &stru_1F34A0E10;
        __int16 v35 = 2048;
        uint64_t v36 = v13;
        _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_DEFAULT, "%@[Override] Setting HomeKit Cache Policy to None. Actual = %lu", buf, 0x16u);
      }

      uint64_t v13 = 0;
    }
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F2E978]) initWithOptions:a4 cachePolicy:v13];
    [v17 setDiscretionary:0];
    uint64_t v18 = objc_opt_new();
    [v17 setDelegateQueue:v18];

    [v17 setAdaptive:1];
    uint64_t v19 = +[ANHomeManager bundleForLocationAuthorization];
    if (v19)
    {
      long long v20 = [objc_alloc(MEMORY[0x1E4F65468]) initWithBundle:v19];
      [v17 setLocationAuthorization:v20];
    }
    else
    {
      long long v20 = ANLogHandleHomeManager();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = &stru_1F34A0E10;
        _os_log_impl(&dword_1DA5ED000, v20, OS_LOG_TYPE_ERROR, "%@No bundle for location authorization", buf, 0xCu);
      }
    }

    uint64_t v21 = [MEMORY[0x1E4F1C9C8] now];
    loadHomesStart = v6->_loadHomesStart;
    v6->_loadHomesStart = (NSDate *)v21;

    id v23 = objc_alloc(MEMORY[0x1E4F2E820]);
    int v24 = (void *)[v17 copy];
    uint64_t v25 = [v23 initWithConfiguration:v24];
    homeManager = v6->_homeManager;
    v6->_homeManager = (HMHomeManager *)v25;

    long long v27 = [ANAccessorySettingsCache alloc];
    long long v28 = [(HMHomeManager *)v6->_homeManager createAccessorySettingsDataSource];
    uint64_t v29 = [(ANAccessorySettingsCache *)v27 initWithAccessorySettingsDataSource:v28];
    accessorySettingsCache = v6->_accessorySettingsCache;
    v6->_accessorySettingsCache = (ANAccessorySettingsCache *)v29;

    [(HMHomeManager *)v6->_homeManager setDelegate:v6];
  }
  return v6;
}

+ (unint64_t)defaultHomeOptions
{
  v2 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  int v3 = [v2 BOOLForDefault:*MEMORY[0x1E4F4A610]];

  if (v3) {
    return 34924;
  }
  else {
    return 32876;
  }
}

+ (id)shared
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__ANHomeManager_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, block);
  }
  v2 = (void *)shared_manager;
  return v2;
}

uint64_t __23__ANHomeManager_shared__block_invoke()
{
  shared_manager = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (void)loadHomes:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__ANHomeManager_loadHomes___block_invoke;
  block[3] = &unk_1E6BCE190;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __27__ANHomeManager_loadHomes___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "%@Loading Homes", (uint8_t *)&v8, 0xCu);
  }

  if (*((unsigned char *)WeakRetained + 8))
  {
    id v4 = ANLogHandleHomeManager();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "%@Homes Already Loaded", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [WeakRetained[5] homes];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    id v6 = [WeakRetained homesLoadedCompletionHandlers];
    dispatch_queue_t v7 = _Block_copy(*(const void **)(a1 + 32));
    [v6 addObject:v7];
  }
}

- (void)loadHomeSynchronous
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(ANHomeManager *)self allHomes];
  int v3 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412546;
    uint64_t v5 = &stru_1F34A0E10;
    __int16 v6 = 2112;
    dispatch_queue_t v7 = v2;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "%@Loaded Homes Synchronous: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (id)refreshHomeSynchronous
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1C9C8] date];
  int v4 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  uint64_t v5 = [v4 numberForDefault:*MEMORY[0x1E4F4A660]];
  [v5 doubleValue];
  double v7 = v6;

  uint64_t v8 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = &stru_1F34A0E10;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v7;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@Home manager refresh start (%.2fs timeout)", buf, 0x16u);
  }

  id v9 = [v3 dateByAddingTimeInterval:v7];
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v26 = __Block_byref_object_copy__4;
  long long v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  homeManager = self->_homeManager;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __39__ANHomeManager_refreshHomeSynchronous__block_invoke;
  v18[3] = &unk_1E6BCE3F8;
  long long v20 = buf;
  uint64_t v12 = v10;
  uint64_t v19 = v12;
  id v13 = (id)[(HMHomeManager *)homeManager _refreshBeforeDate:v9 completionHandler:v18];
  dispatch_semaphore_wait(v12, (unint64_t)(v7 + 0.5));
  uint64_t v14 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (*(void *)(*(void *)&buf[8] + 40)) {
      int v15 = @"failure";
    }
    else {
      int v15 = @"success";
    }
    *(_DWORD *)uint64_t v21 = 138412546;
    char v22 = &stru_1F34A0E10;
    __int16 v23 = 2112;
    int v24 = v15;
    _os_log_impl(&dword_1DA5ED000, v14, OS_LOG_TYPE_DEFAULT, "%@Home manager refresh %@", v21, 0x16u);
  }

  id v16 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v16;
}

void __39__ANHomeManager_refreshHomeSynchronous__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)registerDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ANHomeManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ANHomeManager_registerDelegate_queue___block_invoke;
  block[3] = &unk_1E6BCDF90;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __40__ANHomeManager_registerDelegate_queue___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v3;
  id v4 = [*(id *)(a1 + 40) delegatesToQueues];
  [v4 setObject:v5 forKey:*(void *)(a1 + 48)];
}

- (NSArray)allHomes
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_homesLoaded)
  {
    id v3 = dispatch_group_create();
    dispatch_group_enter(v3);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __25__ANHomeManager_allHomes__block_invoke;
    v9[3] = &unk_1E6BCE420;
    id v4 = v3;
    id v10 = v4;
    [(ANHomeManager *)self loadHomes:v9];
    dispatch_time_t v5 = dispatch_time(0, 3000000000);
    if (dispatch_group_wait(v4, v5))
    {
      id v6 = ANLogHandleHomeManager();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v12 = &stru_1F34A0E10;
        __int16 v13 = 1024;
        int v14 = 3;
        _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_FAULT, "%@allHomes timeout waiting for loaded Homes after %d seconds", buf, 0x12u);
      }
    }
  }
  id v7 = [(HMHomeManager *)self->_homeManager homes];
  return (NSArray *)v7;
}

void __25__ANHomeManager_allHomes__block_invoke(uint64_t a1)
{
}

- (HMHome)currentHome
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(ANHomeManager *)self allHomes];
  id v4 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    id v9 = &stru_1F34A0E10;
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEBUG, "%@Loaded homes %@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_time_t v5 = [(ANHomeManager *)self homeManager];
  id v6 = [v5 currentHome];

  return (HMHome *)v6;
}

- (HMAccessory)currentAccessory
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(ANHomeManager *)self allHomes];
  id v4 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    id v9 = &stru_1F34A0E10;
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEBUG, "%@Loaded homes %@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_time_t v5 = [(ANHomeManager *)self homeManager];
  id v6 = [v5 currentAccessory];

  return (HMAccessory *)v6;
}

- (void)_notifyManagerLoadedHomes:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_time_t v5 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [(NSMutableArray *)self->_homesLoadedCompletionHandlers count];
    *(_DWORD *)buf = 138412546;
    long long v20 = &stru_1F34A0E10;
    __int16 v21 = 1024;
    int v22 = v6;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEBUG, "%@Notifying Homes Loaded to %i handlers", buf, 0x12u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_homesLoadedCompletionHandlers;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        __int16 v13 = objc_msgSend(v4, "homes", (void)v14);
        (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(NSMutableArray *)self->_homesLoadedCompletionHandlers removeAllObjects];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = [(ANHomeManager *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ANHomeManager_homeManagerDidUpdateHomes___block_invoke;
  v7[3] = &unk_1E6BCE448;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __43__ANHomeManager_homeManagerDidUpdateHomes___block_invoke(id *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  char v4 = [WeakRetained homesLoaded];

  if ((v4 & 1) == 0)
  {
    dispatch_time_t v5 = [MEMORY[0x1E4F1C9C8] date];
    id v6 = ANLogHandleHomeManager();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      [v5 timeIntervalSince1970];
      double v8 = v7;
      id v9 = [a1[4] loadHomesStart];
      [v9 timeIntervalSince1970];
      *(_DWORD *)buf = 138412546;
      __int16 v38 = &stru_1F34A0E10;
      __int16 v39 = 2048;
      double v40 = v8 - v10;
      _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "%@Load Homes took %f seconds", buf, 0x16u);
    }
  }
  id location = v2;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v11 = [a1[5] homes];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v17 = [v16 accessories];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v28 != v20) {
                objc_enumerationMutation(v17);
              }
              [*(id *)(*((void *)&v27 + 1) + 8 * j) setDelegate:a1[4]];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v19);
        }

        [v16 setDelegate:a1[4]];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v13);
  }

  id v22 = objc_loadWeakRetained(location);
  [v22 setHomesLoaded:1];

  uint64_t v23 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    double v24 = [a1[5] homes];
    *(_DWORD *)buf = 138412546;
    __int16 v38 = &stru_1F34A0E10;
    __int16 v39 = 2112;
    double v40 = v24;
    _os_log_impl(&dword_1DA5ED000, v23, OS_LOG_TYPE_DEFAULT, "%@Homes Loaded: %@", buf, 0x16u);
  }
  id v25 = objc_loadWeakRetained(location);
  [v25 _notifyManagerLoadedHomes:a1[5]];
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  double v8 = [(ANHomeManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ANHomeManager_homeManager_didAddHome___block_invoke;
  block[3] = &unk_1E6BCE498;
  id v11 = v7;
  id v9 = v7;
  objc_copyWeak(&v12, &location);
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __40__ANHomeManager_homeManager_didAddHome___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) name];
    char v4 = [*(id *)(a1 + 32) uniqueIdentifier];
    *(_DWORD *)buf = 138412802;
    uint64_t v20 = &stru_1F34A0E10;
    __int16 v21 = 2112;
    id v22 = v3;
    __int16 v23 = 2112;
    double v24 = v4;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Added Home %@, %@", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) setDelegate:WeakRetained];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [*(id *)(a1 + 32) accessories];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v10++) setDelegate:WeakRetained];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__ANHomeManager_homeManager_didAddHome___block_invoke_24;
  v12[3] = &unk_1E6BCE470;
  id v13 = *(id *)(a1 + 32);
  [v11 _executeBlockForDelegates:v12];
}

void __40__ANHomeManager_homeManager_didAddHome___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didAddHome:*(void *)(a1 + 32)];
  }
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(ANHomeManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ANHomeManager_homeManager_didRemoveHome___block_invoke;
  block[3] = &unk_1E6BCE498;
  id v11 = v7;
  id v9 = v7;
  objc_copyWeak(&v12, &location);
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __43__ANHomeManager_homeManager_didRemoveHome___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) name];
    char v4 = [*(id *)(a1 + 32) uniqueIdentifier];
    *(_DWORD *)buf = 138412802;
    id v9 = &stru_1F34A0E10;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Removed Home %@, %@", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__ANHomeManager_homeManager_didRemoveHome___block_invoke_28;
  v6[3] = &unk_1E6BCE470;
  id v7 = *(id *)(a1 + 32);
  [WeakRetained _executeBlockForDelegates:v6];
}

void __43__ANHomeManager_homeManager_didRemoveHome___block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didRemoveHome:*(void *)(a1 + 32)];
  }
}

- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = [(ANHomeManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ANHomeManager_homeDidUpdateAccessControlForCurrentUser___block_invoke;
  block[3] = &unk_1E6BCE498;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__ANHomeManager_homeDidUpdateAccessControlForCurrentUser___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) name];
    *(_DWORD *)buf = 138412546;
    id v8 = &stru_1F34A0E10;
    __int16 v9 = 2112;
    __int16 v10 = v3;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Access Control Changed for Current User in Home: %@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__ANHomeManager_homeDidUpdateAccessControlForCurrentUser___block_invoke_31;
  v5[3] = &unk_1E6BCE470;
  id v6 = *(id *)(a1 + 32);
  [WeakRetained _executeBlockForDelegates:v5];
}

void __58__ANHomeManager_homeDidUpdateAccessControlForCurrentUser___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 homeDidUpdateAccessControlForCurrentUser:*(void *)(a1 + 32)];
  }
}

- (void)home:(id)a3 didUpdateAccessControlForUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(ANHomeManager *)self serialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__ANHomeManager_home_didUpdateAccessControlForUser___block_invoke;
  v11[3] = &unk_1E6BCE4E8;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  objc_copyWeak(&v14, &location);
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __52__ANHomeManager_home_didUpdateAccessControlForUser___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] name];
    id v4 = [a1[5] name];
    *(_DWORD *)buf = 138412802;
    long long v17 = &stru_1F34A0E10;
    __int16 v18 = 2112;
    uint64_t v19 = v3;
    __int16 v20 = 2112;
    __int16 v21 = v4;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Access Control Changed for User %@ in Home: %@", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__ANHomeManager_home_didUpdateAccessControlForUser___block_invoke_34;
  v13[3] = &unk_1E6BCE4C0;
  id v14 = a1[5];
  id v15 = a1[4];
  [WeakRetained _executeBlockForDelegates:v13];

  id v6 = [a1[4] uniqueIdentifier];
  id v7 = [a1[5] currentUser];
  id v8 = [v7 uniqueIdentifier];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    id v10 = objc_loadWeakRetained(a1 + 6);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__ANHomeManager_home_didUpdateAccessControlForUser___block_invoke_2;
    v11[3] = &unk_1E6BCE470;
    id v12 = a1[5];
    [v10 _executeBlockForDelegates:v11];
  }
}

void __52__ANHomeManager_home_didUpdateAccessControlForUser___block_invoke_34(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didUpdateAccessControlForUser:*(void *)(a1 + 40)];
  }
}

void __52__ANHomeManager_home_didUpdateAccessControlForUser___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 homeDidUpdateAccessControlForCurrentUser:*(void *)(a1 + 32)];
  }
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(ANHomeManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ANHomeManager_home_didAddAccessory___block_invoke;
  block[3] = &unk_1E6BCE510;
  id v12 = v7;
  id v13 = self;
  id v9 = v7;
  objc_copyWeak(&v15, &location);
  id v14 = v6;
  id v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __38__ANHomeManager_home_didAddAccessory___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) name];
    id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
    *(_DWORD *)buf = 138412802;
    id v10 = &stru_1F34A0E10;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Added Accessory %@, %@", buf, 0x20u);
  }
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__ANHomeManager_home_didAddAccessory___block_invoke_37;
  v6[3] = &unk_1E6BCE4C0;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 32);
  [WeakRetained _executeBlockForDelegates:v6];
}

void __38__ANHomeManager_home_didAddAccessory___block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didAddAccessory:*(void *)(a1 + 40)];
  }
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(ANHomeManager *)self serialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__ANHomeManager_home_didRemoveAccessory___block_invoke;
  v11[3] = &unk_1E6BCE538;
  id v12 = v7;
  id v9 = v7;
  objc_copyWeak(&v14, &location);
  id v13 = v6;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __41__ANHomeManager_home_didRemoveAccessory___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] name];
    id v4 = [a1[4] uniqueIdentifier];
    *(_DWORD *)buf = 138412802;
    id v10 = &stru_1F34A0E10;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Removed Accessory %@, %@", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__ANHomeManager_home_didRemoveAccessory___block_invoke_40;
  v6[3] = &unk_1E6BCE4C0;
  id v7 = a1[5];
  id v8 = a1[4];
  [WeakRetained _executeBlockForDelegates:v6];
}

void __41__ANHomeManager_home_didRemoveAccessory___block_invoke_40(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didRemoveAccessory:*(void *)(a1 + 40)];
  }
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(ANHomeManager *)self serialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__ANHomeManager_home_didAddUser___block_invoke;
  v11[3] = &unk_1E6BCE538;
  id v12 = v7;
  id v9 = v7;
  objc_copyWeak(&v14, &location);
  id v13 = v6;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __33__ANHomeManager_home_didAddUser___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] name];
    id v4 = [a1[4] uniqueIdentifier];
    dispatch_time_t v5 = [a1[4] userID];
    *(_DWORD *)buf = 138413058;
    __int16 v11 = &stru_1F34A0E10;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    long long v17 = v5;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@HomeKit Added User %@, %@, %@", buf, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__ANHomeManager_home_didAddUser___block_invoke_43;
  v7[3] = &unk_1E6BCE4C0;
  id v8 = a1[5];
  id v9 = a1[4];
  [WeakRetained _executeBlockForDelegates:v7];
}

void __33__ANHomeManager_home_didAddUser___block_invoke_43(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didAddUser:*(void *)(a1 + 40)];
  }
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(ANHomeManager *)self serialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__ANHomeManager_home_didRemoveUser___block_invoke;
  v11[3] = &unk_1E6BCE538;
  id v12 = v7;
  id v9 = v7;
  objc_copyWeak(&v14, &location);
  id v13 = v6;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __36__ANHomeManager_home_didRemoveUser___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] name];
    id v4 = [a1[4] uniqueIdentifier];
    dispatch_time_t v5 = [a1[4] userID];
    *(_DWORD *)buf = 138413058;
    __int16 v11 = &stru_1F34A0E10;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    long long v17 = v5;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@HomeKit Removed User %@, %@, %@", buf, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__ANHomeManager_home_didRemoveUser___block_invoke_46;
  v7[3] = &unk_1E6BCE4C0;
  id v8 = a1[5];
  id v9 = a1[4];
  [WeakRetained _executeBlockForDelegates:v7];
}

void __36__ANHomeManager_home_didRemoveUser___block_invoke_46(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didRemoveUser:*(void *)(a1 + 40)];
  }
}

- (void)accessoryDidUpdateControllable:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = [(ANHomeManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ANHomeManager_accessoryDidUpdateControllable___block_invoke;
  block[3] = &unk_1E6BCE498;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__ANHomeManager_accessoryDidUpdateControllable___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) name];
    id v4 = NSNumber;
    dispatch_time_t v5 = [*(id *)(a1 + 32) settings];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isControllable"));
    *(_DWORD *)buf = 138412802;
    __int16 v11 = &stru_1F34A0E10;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Accessory Controllable Updated: %@, %@", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__ANHomeManager_accessoryDidUpdateControllable___block_invoke_50;
  v8[3] = &unk_1E6BCE470;
  id v9 = *(id *)(a1 + 32);
  [WeakRetained _executeBlockForDelegates:v8];
}

void __48__ANHomeManager_accessoryDidUpdateControllable___block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accessoryDidUpdateControllable:*(void *)(a1 + 32)];
  }
}

- (void)accessoryDidUpdateName:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = [(ANHomeManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ANHomeManager_accessoryDidUpdateName___block_invoke;
  block[3] = &unk_1E6BCE498;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __40__ANHomeManager_accessoryDidUpdateName___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) name];
    id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
    *(_DWORD *)buf = 138412802;
    id v9 = &stru_1F34A0E10;
    __int16 v10 = 2112;
    __int16 v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Accessory Name Updated: %@, %@", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__ANHomeManager_accessoryDidUpdateName___block_invoke_53;
  v6[3] = &unk_1E6BCE470;
  id v7 = *(id *)(a1 + 32);
  [WeakRetained _executeBlockForDelegates:v6];
}

void __40__ANHomeManager_accessoryDidUpdateName___block_invoke_53(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accessoryDidUpdateName:*(void *)(a1 + 32)];
  }
}

- (void)accessoryDidUpdateSupportsAudioAnalysis:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  dispatch_time_t v5 = [(ANHomeManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ANHomeManager_accessoryDidUpdateSupportsAudioAnalysis___block_invoke;
  block[3] = &unk_1E6BCE498;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__ANHomeManager_accessoryDidUpdateSupportsAudioAnalysis___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) name];
    id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
    int v5 = [*(id *)(a1 + 32) supportsAudioAnalysis];
    *(_DWORD *)buf = 138413058;
    __int16 v10 = &stru_1F34A0E10;
    __int16 v11 = 2112;
    __int16 v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 1024;
    int v16 = v5;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Accessory Supports Audio Analysis Updated: %@, %@, Supports Audio Analysis = %d", buf, 0x26u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__ANHomeManager_accessoryDidUpdateSupportsAudioAnalysis___block_invoke_56;
  v7[3] = &unk_1E6BCE470;
  id v8 = *(id *)(a1 + 32);
  [WeakRetained _executeBlockForDelegates:v7];
}

void __57__ANHomeManager_accessoryDidUpdateSupportsAudioAnalysis___block_invoke_56(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accessoryDidUpdateSupportedCapabilities:*(void *)(a1 + 32)];
  }
}

- (void)accessoryDidUpdateSupportsDropIn:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = [(ANHomeManager *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ANHomeManager_accessoryDidUpdateSupportsDropIn___block_invoke;
  block[3] = &unk_1E6BCE498;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__ANHomeManager_accessoryDidUpdateSupportsDropIn___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = ANLogHandleHomeManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) name];
    id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
    int v5 = [*(id *)(a1 + 32) supportsDropIn];
    *(_DWORD *)buf = 138413058;
    __int16 v10 = &stru_1F34A0E10;
    __int16 v11 = 2112;
    __int16 v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 1024;
    int v16 = v5;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Accessory Supports Drop In Updated: %@, %@, Supports Drop In = %d", buf, 0x26u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ANHomeManager_accessoryDidUpdateSupportsDropIn___block_invoke_59;
  v7[3] = &unk_1E6BCE470;
  id v8 = *(id *)(a1 + 32);
  [WeakRetained _executeBlockForDelegates:v7];
}

void __50__ANHomeManager_accessoryDidUpdateSupportsDropIn___block_invoke_59(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accessoryDidUpdateSupportedCapabilities:*(void *)(a1 + 32)];
  }
}

- (void)_executeBlockForDelegates:(id)a3
{
  id v4 = a3;
  int v5 = [(ANHomeManager *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ANHomeManager__executeBlockForDelegates___block_invoke;
  v7[3] = &unk_1E6BCE168;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__ANHomeManager__executeBlockForDelegates___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) delegatesToQueues];
  id v3 = [v2 keyEnumerator];
  id v4 = [v3 allObjects];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        __int16 v10 = [*(id *)(a1 + 32) delegatesToQueues];
        __int16 v11 = [v10 objectForKey:v9];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __43__ANHomeManager__executeBlockForDelegates___block_invoke_2;
        block[3] = &unk_1E6BCE560;
        id v12 = *(id *)(a1 + 40);
        void block[4] = v9;
        id v15 = v12;
        dispatch_async(v11, block);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

uint64_t __43__ANHomeManager__executeBlockForDelegates___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (ANAccessorySettingsCache)accessorySettingsCache
{
  return self->_accessorySettingsCache;
}

- (BOOL)homesLoaded
{
  return self->_homesLoaded;
}

- (void)setHomesLoaded:(BOOL)a3
{
  self->_homesLoaded = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSMutableArray)homesLoadedCompletionHandlers
{
  return self->_homesLoadedCompletionHandlers;
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (NSMapTable)delegatesToQueues
{
  return self->_delegatesToQueues;
}

- (NSDate)loadHomesStart
{
  return self->_loadHomesStart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadHomesStart, 0);
  objc_storeStrong((id *)&self->_delegatesToQueues, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_homesLoadedCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_accessorySettingsCache, 0);
}

@end