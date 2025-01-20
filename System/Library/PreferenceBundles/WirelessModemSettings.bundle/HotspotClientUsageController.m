@interface HotspotClientUsageController
- (id)dataUsageString:(id)a3;
- (id)getSpecifiersForClients;
- (id)specifiers;
@end

@implementation HotspotClientUsageController

- (id)dataUsageString:(id)a3
{
  return (id)[a3 propertyForKey:@"ClientUsageString"];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v6 setProperty:@"Client data usage is only shown in internal builds." forKey:*MEMORY[0x263F600F8]];
    [v5 addObject:v6];
    v7 = [(HotspotClientUsageController *)self getSpecifiersForClients];
    [v5 addObjectsFromArray:v7];

    v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)getSpecifiersForClients
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v41 = [MEMORY[0x263EFF980] array];
  uint64_t v2 = WiFiManagerClientCreate();
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    v4 = (void *)WiFiManagerClientCopyProperty();
    id v5 = v4;
    if (v4)
    {
      v28 = v4;
      v29 = v3;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = v4;
      uint64_t v33 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
      v6 = 0;
      v7 = 0;
      if (v33)
      {
        uint64_t v31 = *MEMORY[0x263F55F70];
        uint64_t v32 = *(void *)v48;
        uint64_t v38 = *MEMORY[0x263F55F60];
        uint64_t v39 = *MEMORY[0x263F55F80];
        uint64_t v36 = *MEMORY[0x263F55F58];
        uint64_t v37 = *MEMORY[0x263F55F40];
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v48 != v32) {
              objc_enumerationMutation(obj);
            }
            uint64_t v34 = v8;
            v9 = [*(id *)(*((void *)&v47 + 1) + 8 * v8) objectForKey:v31];
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            id v35 = v9;
            uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v51 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v42 = *(void *)v44;
              do
              {
                uint64_t v12 = 0;
                v13 = v6;
                v14 = v7;
                do
                {
                  if (*(void *)v44 != v42) {
                    objc_enumerationMutation(v35);
                  }
                  v15 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
                  v16 = [v15 objectForKey:v39];
                  v17 = [v15 objectForKey:v38];
                  v6 = [v15 objectForKey:v37];

                  v7 = [v15 objectForKey:v36];

                  uint64_t v18 = [v17 unsignedIntegerValue];
                  uint64_t v19 = [v16 unsignedIntegerValue] + v18;
                  if (v7) {
                    v20 = v7;
                  }
                  else {
                    v20 = v6;
                  }
                  v21 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v20 target:self set:0 get:sel_dataUsageString_ detail:0 cell:4 edit:0];
                  v22 = v21;
                  if (v19)
                  {
                    v23 = [MEMORY[0x263F086F0] stringFromByteCount:v19 countStyle:0];
                    [v22 setProperty:v23 forKey:@"ClientUsageString"];
                  }
                  else
                  {
                    [v21 setProperty:&stru_26F3105F0 forKey:@"ClientUsageString"];
                  }
                  v24 = [NSNumber numberWithUnsignedInteger:v19];
                  [v22 setProperty:v24 forKey:@"ClientUsageBytes"];

                  [v41 addObject:v22];
                  ++v12;
                  v13 = v6;
                  v14 = v7;
                }
                while (v11 != v12);
                uint64_t v11 = [v35 countByEnumeratingWithState:&v43 objects:v51 count:16];
              }
              while (v11);
            }

            uint64_t v8 = v34 + 1;
          }
          while (v34 + 1 != v33);
          uint64_t v33 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v33);
      }

      id v5 = v28;
      uint64_t v3 = v29;
    }
    CFRelease(v3);
  }
  [v41 sortUsingFunction:_CompareUsages context:0];
  v25 = [v41 reverseObjectEnumerator];
  v26 = [v25 allObjects];

  return v26;
}

@end