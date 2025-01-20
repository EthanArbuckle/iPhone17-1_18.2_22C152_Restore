@interface ANLocation(Home)
- (id)allRoomsInHome:()Home;
- (uint64_t)containsAccessory:()Home;
@end

@implementation ANLocation(Home)

- (uint64_t)containsAccessory:()Home
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 homeUUID];
  v6 = [v4 home];
  v7 = [v6 uniqueIdentifier];
  int v8 = [v5 isEqual:v7];

  if (v8)
  {
    if ([a1 flags])
    {
      uint64_t v31 = 1;
    }
    else
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v9 = [a1 roomUUIDs];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v46;
        while (2)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v46 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v45 + 1) + 8 * v13);
            v15 = [v4 room];
            v16 = [v15 uniqueIdentifier];
            LOBYTE(v14) = [v14 isEqual:v16];

            if (v14)
            {
LABEL_30:
              uint64_t v31 = 1;
              goto LABEL_31;
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v51 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v9 = [a1 zoneUUIDs];
      uint64_t v34 = [v9 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v34)
      {
        uint64_t v17 = *(void *)v42;
        uint64_t v33 = *(void *)v42;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v42 != v17) {
              objc_enumerationMutation(v9);
            }
            uint64_t v35 = v18;
            uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8 * v18);
            v20 = objc_msgSend(v4, "home", v33);
            v21 = objc_msgSend(v20, "hmu_zoneWithUniqueIdentifier:", v19);

            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            v36 = v21;
            v22 = [v21 rooms];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v49 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v38;
              while (2)
              {
                uint64_t v26 = 0;
                do
                {
                  if (*(void *)v38 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  v27 = [*(id *)(*((void *)&v37 + 1) + 8 * v26) uniqueIdentifier];
                  v28 = [v4 room];
                  v29 = [v28 uniqueIdentifier];
                  char v30 = [v27 isEqual:v29];

                  if (v30)
                  {

                    goto LABEL_30;
                  }
                  ++v26;
                }
                while (v24 != v26);
                uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v49 count:16];
                if (v24) {
                  continue;
                }
                break;
              }
            }

            uint64_t v18 = v35 + 1;
            uint64_t v17 = v33;
          }
          while (v35 + 1 != v34);
          uint64_t v34 = [v9 countByEnumeratingWithState:&v41 objects:v50 count:16];
        }
        while (v34);
      }
      uint64_t v31 = 0;
LABEL_31:
    }
  }
  else
  {
    uint64_t v31 = 0;
  }

  return v31;
}

- (id)allRoomsInHome:()Home
{
  id v4 = a3;
  v5 = [a1 roomUUIDs];
  if (v5)
  {
    v6 = [a1 roomUUIDs];
    v7 = objc_msgSend(v4, "hmu_roomsWithUniqueIdentifiers:", v6);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  int v8 = [a1 zoneUUIDs];
  if (v8)
  {
    v9 = [a1 zoneUUIDs];
    uint64_t v10 = objc_msgSend(v4, "hmu_zonesWithUniqueIdentifiers:", v9);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F2EBF0], "hmu_roomsInZones:appendingRooms:", v10, v7);

  return v11;
}

@end