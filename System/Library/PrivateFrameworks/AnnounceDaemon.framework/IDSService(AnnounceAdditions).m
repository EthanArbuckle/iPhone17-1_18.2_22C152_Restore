@interface IDSService(AnnounceAdditions)
- (id)devicesExcludingHomePods;
- (id)uniqueIdentifiersForDevicesExcludingAppleAccessories;
@end

@implementation IDSService(AnnounceAdditions)

- (id)devicesExcludingHomePods
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = objc_msgSend(a1, "devices", 0);
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
        if (([v8 isHomePod] & 1) == 0) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)uniqueIdentifiersForDevicesExcludingAppleAccessories
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(a1, "devices", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v8 isHomePod] & 1) == 0)
        {
          v9 = [v8 uniqueIDOverride];
          [v2 addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  long long v10 = (void *)IDSCopyLocalDeviceUniqueID();
  [v2 addObject:v10];

  return v2;
}

@end