@interface ANAnnouncementDestination(Home)
- (id)home;
- (id)rooms;
- (id)zones;
@end

@implementation ANAnnouncementDestination(Home)

- (id)home
{
  uint64_t v2 = [a1 type];
  if (v2 == 1)
  {
    v5 = [a1 homeObject];
    v6 = +[ANHomeManager shared];
    uint64_t v7 = [v6 homeForID:v5];
  }
  else
  {
    if (v2)
    {
      v8 = 0;
      goto LABEL_10;
    }
    v3 = +[ANHomeManager shared];
    v4 = [v3 currentAccessory];

    if (v4)
    {
      v5 = +[ANHomeManager shared];
      v6 = [v5 currentAccessory];
      [v6 home];
    }
    else
    {
      v5 = [a1 homeObject];
      v6 = +[ANHomeManager shared];
      [v6 homeWithName:v5];
    uint64_t v7 = };
  }
  v8 = (void *)v7;

LABEL_10:
  return v8;
}

- (id)zones
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 home];
  if (!v2) {
    goto LABEL_14;
  }
  uint64_t v3 = [a1 type];
  if (v3 == 1)
  {
    v13 = (void *)MEMORY[0x1E4F1CA48];
    v14 = [a1 zoneObjects];
    v6 = objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = objc_msgSend(a1, "zoneObjects", 0);
    uint64_t v15 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v7);
          }
          v19 = objc_msgSend(v2, "hmu_zoneWithUniqueIdentifier:", *(void *)(*((void *)&v21 + 1) + 8 * i));
          if (v19) {
            [v6 addObject:v19];
          }
        }
        uint64_t v16 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }
    goto LABEL_24;
  }
  if (v3)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_25;
  }
  v4 = (void *)MEMORY[0x1E4F1CA48];
  v5 = [a1 zoneObjects];
  v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [a1 zoneObjects];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(v2, "hmu_zoneWithName:", *(void *)(*((void *)&v25 + 1) + 8 * j));
        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }
LABEL_24:

LABEL_25:
  return v6;
}

- (id)rooms
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 home];
  if (!v2) {
    goto LABEL_14;
  }
  uint64_t v3 = [a1 type];
  if (v3 == 1)
  {
    v13 = (void *)MEMORY[0x1E4F1CA48];
    v14 = [a1 roomObjects];
    v6 = objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = objc_msgSend(a1, "roomObjects", 0);
    uint64_t v15 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v7);
          }
          v19 = objc_msgSend(v2, "hmu_roomWithUniqueIdentifier:", *(void *)(*((void *)&v21 + 1) + 8 * i));
          if (v19) {
            [v6 addObject:v19];
          }
        }
        uint64_t v16 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }
    goto LABEL_24;
  }
  if (v3)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_25;
  }
  v4 = (void *)MEMORY[0x1E4F1CA48];
  v5 = [a1 roomObjects];
  v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [a1 roomObjects];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(v2, "hmu_roomWithName:", *(void *)(*((void *)&v25 + 1) + 8 * j));
        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }
LABEL_24:

LABEL_25:
  return v6;
}

@end