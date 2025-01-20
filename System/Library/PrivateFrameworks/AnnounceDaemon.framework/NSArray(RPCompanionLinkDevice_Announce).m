@interface NSArray(RPCompanionLinkDevice_Announce)
- (id)activeAccessoryDevicesSupportingAnnounce;
- (id)activeDevicesSupportingAnnounce;
- (id)activePersonalDevicesSupportingAnnounce;
- (id)devicesByRemovingNonAccessoryDevicesNotBelongingToUsers:()RPCompanionLinkDevice_Announce;
- (id)devicesInHome:()RPCompanionLinkDevice_Announce;
- (id)pairedCompanion;
- (id)personalDevicesForUser:()RPCompanionLinkDevice_Announce;
@end

@implementation NSArray(RPCompanionLinkDevice_Announce)

- (id)activeAccessoryDevicesSupportingAnnounce
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "homeKitIdentifier", (void)v13);
        if (v9 && [v8 supportsAnnounce])
        {
          v10 = [v2 objectForKey:v9];
          v11 = v10;
          if (!v10 || ([v10 statusFlags] & 3) != 0) {
            [v2 setObject:v8 forKey:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)activeDevicesSupportingAnnounce
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "idsDeviceIdentifier", (void)v15);
        if ([v8 supportsAnnounce]) {
          BOOL v10 = v9 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10)
        {
          v11 = [v2 objectForKey:v9];
          v12 = v11;
          if (!v11 || ([v11 statusFlags] & 3) != 0) {
            [v2 setObject:v8 forKey:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  long long v13 = [v2 allValues];

  return v13;
}

- (id)activePersonalDevicesSupportingAnnounce
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(a1, "activeDevicesSupportingAnnounce", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v8 isAccessory] & 1) == 0) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)pairedCompanion
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = a1;
  id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (objc_msgSend(v5, "isPairedCompanion", (void)v7))
        {
          id v2 = v5;
          goto LABEL_11;
        }
      }
      id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (id)devicesInHome:()RPCompanionLinkDevice_Announce
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v19 = (id)objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = a1;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        long long v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v9 = [v8 homeKitUserIdentifiers];
        long long v10 = v9;
        if (v9)
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v11 = v9;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v23;
            while (2)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v23 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = objc_msgSend(v4, "hmu_userWithUniqueIdentifier:", *(void *)(*((void *)&v22 + 1) + 8 * j));
                if (v16)
                {
                  long long v17 = (void *)v16;
                  [v19 addObject:v8];

                  goto LABEL_17;
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  return v19;
}

- (id)devicesByRemovingNonAccessoryDevicesNotBelongingToUsers:()RPCompanionLinkDevice_Announce
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v21 = (id)objc_opt_new();
  id v19 = v4;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F2EBA0], "hmu_uniqueIdentifiersFromUsers:", v4);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = a1;
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v10 isAccessory])
        {
          [v21 addObject:v10];
        }
        else
        {
          id v11 = [v10 homeKitUserIdentifiers];
          uint64_t v12 = v11;
          if (v11)
          {
            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            id v13 = v11;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v23;
              while (2)
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v23 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  if ([v5 containsObject:*(void *)(*((void *)&v22 + 1) + 8 * j)])
                  {
                    [v21 addObject:v10];
                    goto LABEL_19;
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
                if (v15) {
                  continue;
                }
                break;
              }
            }
LABEL_19:
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  return v21;
}

- (id)personalDevicesForUser:()RPCompanionLinkDevice_Announce
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isAccessory", (void)v16) & 1) == 0)
        {
          uint64_t v12 = [v11 homeKitUserIdentifiers];
          if (v12)
          {
            id v13 = [v4 uniqueIdentifier];
            int v14 = [v12 containsObject:v13];

            if (v14) {
              [v5 addObject:v11];
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

@end