@interface HMDMatterCommandActionUtilities
+ (id)commandsInMemoryRepresentation:(id)a3;
+ (id)commandsInStoreRepresentation:(id)a3;
@end

@implementation HMDMatterCommandActionUtilities

+ (id)commandsInMemoryRepresentation:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    uint64_t v8 = *MEMORY[0x263F0C610];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v11 = (void *)[v10 mutableCopy];
        v12 = [v11 objectForKey:v8];
        v13 = (void *)[v12 mutableCopy];

        if (v13)
        {
          v14 = (void *)[v13 mutableCopy];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __66__HMDMatterCommandActionUtilities_commandsInMemoryRepresentation___block_invoke;
          v21[3] = &unk_264A15D88;
          id v22 = v14;
          id v15 = v14;
          objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);
          v16 = (void *)[v15 copy];
          [v11 setObject:v16 forKey:v8];

          v17 = (void *)[v11 copy];
          [v4 addObject:v17];
        }
        else
        {
          [v4 addObject:v10];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  v18 = (void *)[v4 copy];
  return v18;
}

void __66__HMDMatterCommandActionUtilities_commandsInMemoryRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v34 = a2;
  id v3 = (void *)[v34 mutableCopy];
  uint64_t v4 = *MEMORY[0x263F10B70];
  uint64_t v5 = [v34 objectForKey:*MEMORY[0x263F10B70]];
  uint64_t v6 = v5;
  uint64_t v7 = (void *)MEMORY[0x263F0C6F8];
  uint64_t v8 = (void *)MEMORY[0x263F0C5F8];
  if (v5)
  {
    v9 = (void *)MEMORY[0x263F10C50];
    v10 = objc_msgSend(v5, "hmf_numberForKey:", *MEMORY[0x263F0C6F8]);
    v11 = objc_msgSend(v6, "hmf_numberForKey:", *v8);
    v12 = objc_msgSend(v6, "hmf_numberForKey:", *MEMORY[0x263F0BA78]);
    v13 = [v9 attributePathWithEndpointID:v10 clusterID:v11 attributeID:v12];

    [v3 setObject:v13 forKey:v4];
  }
  uint64_t v14 = *MEMORY[0x263F10B80];
  id v15 = [v34 objectForKey:*MEMORY[0x263F10B80]];
  v16 = v15;
  if (v15)
  {
    v17 = (void *)MEMORY[0x263F10D90];
    v18 = objc_msgSend(v15, "hmf_numberForKey:", *v7);
    v19 = objc_msgSend(v16, "hmf_numberForKey:", *v8);
    v20 = objc_msgSend(v16, "hmf_numberForKey:", *MEMORY[0x263F0C620]);
    v21 = [v17 commandPathWithEndpointID:v18 clusterID:v19 commandID:v20];

    [v3 setObject:v21 forKey:v14];
  }
  uint64_t v22 = *MEMORY[0x263F10BD0];
  long long v23 = [v34 objectForKey:*MEMORY[0x263F10BD0]];
  long long v24 = v23;
  if (v23)
  {
    long long v25 = (void *)MEMORY[0x263F10EA0];
    long long v26 = objc_msgSend(v23, "hmf_numberForKey:", *v7);
    v27 = objc_msgSend(v24, "hmf_numberForKey:", *v8);
    uint64_t v28 = objc_msgSend(v24, "hmf_numberForKey:", *MEMORY[0x263F0C720]);
    v29 = [v25 eventPathWithEndpointID:v26 clusterID:v27 eventID:v28];

    [v3 setObject:v29 forKey:v22];
  }
  v30 = *(void **)(a1 + 32);
  v31 = (void *)[v3 copy];
  [v30 replaceObjectAtIndex:a3 withObject:v31];
}

+ (id)commandsInStoreRepresentation:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    uint64_t v8 = *MEMORY[0x263F0C610];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v11 = (void *)[v10 mutableCopy];
        v12 = [v11 objectForKey:v8];
        v13 = (void *)[v12 mutableCopy];

        if (v13)
        {
          uint64_t v14 = (void *)[v13 mutableCopy];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __65__HMDMatterCommandActionUtilities_commandsInStoreRepresentation___block_invoke;
          v21[3] = &unk_264A15D88;
          id v22 = v14;
          id v15 = v14;
          [v15 enumerateObjectsUsingBlock:v21];
          v16 = (void *)[v15 copy];
          [v11 setObject:v16 forKey:v8];

          v17 = (void *)[v11 copy];
          [v4 addObject:v17];
        }
        else
        {
          [v4 addObject:v10];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  v18 = (void *)[v4 copy];
  return v18;
}

void __65__HMDMatterCommandActionUtilities_commandsInStoreRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v47[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = *MEMORY[0x263F10B70];
  uint64_t v6 = [v3 objectForKeyedSubscript:*MEMORY[0x263F10B70]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  v9 = (void *)MEMORY[0x263F0C5F8];
  v10 = (void *)MEMORY[0x263F0C6F8];
  if (v8)
  {
    v46[0] = *MEMORY[0x263F0BA78];
    v11 = [v8 attribute];
    v47[0] = v11;
    v46[1] = *v9;
    v12 = [v8 cluster];
    v47[1] = v12;
    v46[2] = *v10;
    v13 = [v8 endpoint];
    v47[2] = v13;
    [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
    id v15 = v14 = v10;

    [v4 setObject:v15 forKey:v5];
    v10 = v14;
  }
  uint64_t v16 = *MEMORY[0x263F10B80];
  v17 = objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x263F10B80], a1);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  if (v19)
  {
    v44[0] = *MEMORY[0x263F0C620];
    v20 = [v19 command];
    v45[0] = v20;
    v44[1] = *v9;
    v21 = [v19 cluster];
    v45[1] = v21;
    v44[2] = *v10;
    [v19 endpoint];
    id v22 = v19;
    id v23 = v3;
    id v24 = v8;
    long long v25 = v4;
    v27 = long long v26 = v10;
    v45[2] = v27;
    uint64_t v28 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];

    v10 = v26;
    uint64_t v4 = v25;
    id v8 = v24;
    id v3 = v23;
    id v19 = v22;

    v9 = (void *)MEMORY[0x263F0C5F8];
    [v4 setObject:v28 forKey:v16];
  }
  uint64_t v29 = *MEMORY[0x263F10BD0];
  v30 = [v3 objectForKeyedSubscript:*MEMORY[0x263F10BD0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v31 = v30;
  }
  else {
    v31 = 0;
  }
  id v32 = v31;

  if (v32)
  {
    v42[0] = *MEMORY[0x263F0C720];
    v33 = [v32 event];
    v43[0] = v33;
    v42[1] = *v9;
    id v34 = [v32 cluster];
    v43[1] = v34;
    v42[2] = *v10;
    v35 = [v32 endpoint];
    v43[2] = v35;
    v36 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];

    [v4 setObject:v36 forKey:v29];
  }
  v37 = *(void **)(v40 + 32);
  v38 = (void *)[v4 copy];
  [v37 replaceObjectAtIndex:a3 withObject:v38];
}

@end