@interface HMDHomeEventsGenerated
+ (id)accessorySettingsTopicsForAccessory:(id)a3 homeUUID:(id)a4;
+ (id)accessoryTopicsForAccessory:(id)a3 homeUUID:(id)a4;
+ (id)allTopics;
+ (id)clientIndexToHomeTopicsForHomeUUID:(id)a3;
+ (id)expandedTopicsWithTopics:(id)a3 homeManager:(id)a4;
+ (id)forwardingTopicsWithTopics:(id)a3 forHomeRouterWithUUID:(id)a4;
+ (id)homeInfoIndexForHomeUUID:(id)a3;
+ (id)indexTopicForTopicSuffix:(id)a3 indexName:(id)a4;
+ (id)topicMap;
+ (id)upstreamClientTopicForTopic:(id)a3;
+ (id)upstreamHomeAndAccessoryTopicsForTopic:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5;
+ (id)upstreamHomeTopicForTopic:(id)a3 homeUUID:(id)a4;
+ (id)upstreamTopicsForTopic:(id)a3;
@end

@implementation HMDHomeEventsGenerated

+ (id)expandedTopicsWithTopics:(id)a3 homeManager:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F1CA80];
  id v8 = a3;
  v9 = [v7 set];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke;
  v14[3] = &unk_1E6A07D38;
  id v15 = v6;
  id v16 = v9;
  id v17 = a1;
  id v10 = v9;
  id v11 = v6;
  objc_msgSend(v8, "na_each:", v14);

  v12 = [v10 allObjects];

  return v12;
}

void __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [MEMORY[0x1E4F2E7A0] decodeTopic:v3];
  v5 = v4;
  if (v4 && [v4 isIndexTopic])
  {
    uint64_t v6 = [v5 asIndexAccessoryTopic];
    if (v6
      && (v7 = (void *)v6,
          [v5 topicSuffix],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isEqualToString:@"info"],
          v8,
          v7,
          v9))
    {
      id v10 = *(void **)(a1 + 32);
      id v11 = [v5 accessoryUUID];
      v12 = [v10 accessoryWithUUID:v11];

      if (v12)
      {
        v13 = *(void **)(a1 + 40);
        v14 = *(void **)(a1 + 48);
        id v15 = [v5 homeUUID];
        id v16 = [v14 accessoryTopicsForAccessory:v12 homeUUID:v15];
        [v13 addObjectsFromArray:v16];

        id v17 = *(void **)(a1 + 40);
        v18 = *(void **)(a1 + 48);
        v19 = [v5 homeUUID];
        v20 = [v18 accessorySettingsTopicsForAccessory:v12 homeUUID:v19];
        [v17 addObjectsFromArray:v20];
      }
    }
    else
    {
      uint64_t v21 = [v5 asIndexHomeTopic];
      if (!v21
        || (v22 = (void *)v21,
            [v5 topicSuffix],
            v23 = objc_claimAutoreleasedReturnValue(),
            int v24 = [v23 isEqualToString:@"info"],
            v23,
            v22,
            !v24))
      {
        if ([v3 isEqualToString:@"index.xpc.client.spi"])
        {
          v45 = [*(id *)(a1 + 32) homes];
          v46 = (void *)[v45 copy];
          v61[0] = MEMORY[0x1E4F143A8];
          v61[1] = 3221225472;
          v61[2] = __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_3;
          v61[3] = &unk_1E6A07D10;
          id v47 = *(id *)(a1 + 40);
          uint64_t v48 = *(void *)(a1 + 48);
          id v62 = v47;
          uint64_t v63 = v48;
          objc_msgSend(v46, "na_each:", v61);

          v49 = v62;
        }
        else
        {
          if (![v3 isEqualToString:@"index.xpc.client.spi.settings"]) {
            goto LABEL_9;
          }
          v50 = [*(id *)(a1 + 32) homes];
          v51 = (void *)[v50 copy];
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_5;
          v58[3] = &unk_1E6A07D10;
          id v52 = *(id *)(a1 + 40);
          uint64_t v53 = *(void *)(a1 + 48);
          id v59 = v52;
          uint64_t v60 = v53;
          objc_msgSend(v51, "na_each:", v58);

          v49 = v59;
        }

        goto LABEL_9;
      }
      id v56 = v3;
      v25 = *(void **)(a1 + 32);
      v26 = [v5 homeUUID];
      v27 = [v25 _homeWithUUID:v26];
      v28 = [v27 accessories];

      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_2;
      v68[3] = &unk_1E6A07CE8;
      id v29 = *(id *)(a1 + 40);
      uint64_t v57 = a1;
      uint64_t v30 = *(void *)(a1 + 48);
      id v69 = v29;
      uint64_t v71 = v30;
      v55 = v5;
      id v31 = v5;
      id v70 = v31;
      v54 = v28;
      objc_msgSend(v28, "na_each:", v68);
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      uint64_t v32 = [&unk_1F2DCA2A8 countByEnumeratingWithState:&v64 objects:v72 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v65 != v34) {
              objc_enumerationMutation(&unk_1F2DCA2A8);
            }
            uint64_t v36 = *(void *)(*((void *)&v64 + 1) + 8 * i);
            v37 = [&unk_1F2DCA320 objectForKeyedSubscript:v36];
            v38 = [v37 objectForKeyedSubscript:@"indexes"];
            v39 = [v38 objectForKeyedSubscript:@"HomeIndex"];

            if (v39)
            {
              v40 = *(void **)(v57 + 40);
              v41 = NSString;
              v42 = [v31 homeUUID];
              v43 = [v42 UUIDString];
              v44 = [v41 stringWithFormat:@"home.%@.%@", v43, v36];
              [v40 addObject:v44];
            }
          }
          uint64_t v33 = [&unk_1F2DCA2A8 countByEnumeratingWithState:&v64 objects:v72 count:16];
        }
        while (v33);
      }

      v5 = v55;
      id v3 = v56;
    }
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v3];
  }
LABEL_9:
}

void __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_2(uint64_t a1, void *a2)
{
  v4 = *(void **)(a1 + 40);
  id v3 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v4 homeUUID];
  id v8 = [v3 accessoryTopicsForAccessory:v6 homeUUID:v7];
  [v5 addObjectsFromArray:v8];

  int v9 = *(void **)(a1 + 48);
  id v10 = *(void **)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) homeUUID];
  id v11 = [v9 accessorySettingsTopicsForAccessory:v6 homeUUID:v12];

  [v10 addObjectsFromArray:v11];
}

void __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 accessories];
  v5 = (void *)[v4 copy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_4;
  v9[3] = &unk_1E6A07CE8;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v7;
  id v10 = v6;
  id v8 = v3;
  objc_msgSend(v5, "na_each:", v9);
}

void __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 accessories];
  v5 = (void *)[v4 copy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_6;
  v9[3] = &unk_1E6A07CE8;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v7;
  id v10 = v6;
  id v8 = v3;
  objc_msgSend(v5, "na_each:", v9);
}

void __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_6(void *a1, void *a2)
{
  id v3 = (void *)a1[5];
  v2 = (void *)a1[6];
  v4 = (void *)a1[4];
  id v5 = a2;
  id v7 = [v3 uuid];
  id v6 = [v2 accessorySettingsTopicsForAccessory:v5 homeUUID:v7];

  [v4 addObjectsFromArray:v6];
}

void __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_4(void *a1, void *a2)
{
  id v3 = (void *)a1[5];
  v2 = (void *)a1[6];
  v4 = (void *)a1[4];
  id v5 = a2;
  id v7 = [v3 uuid];
  id v6 = [v2 accessoryTopicsForAccessory:v5 homeUUID:v7];

  [v4 addObjectsFromArray:v6];
}

+ (id)accessoryTopicsForAccessory:(id)a3 homeUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  int v9 = v8;
  if (v8)
  {
    id v10 = [v8 uuid];
    id v11 = +[HMDAccessoryEventsGenerated appleMediaAccessoryTopicsForAccessoryUUID:v10 homeUUID:v6];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

+ (id)accessorySettingsTopicsForAccessory:(id)a3 homeUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  id v9 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v8)
  {
    uint64_t v12 = [v8 category];
    v13 = [v12 categoryType];
    if ([v13 isEqualToString:*MEMORY[0x1E4F2C1D0]])
    {

LABEL_14:
      v14 = [v8 uuid];
      uint64_t v15 = +[HMDAccessoryEventsGenerated homePodAccessorySettingsTopicsForAccessoryUUID:v14 homeUUID:v6];
      goto LABEL_15;
    }
    uint64_t v16 = [v8 homePodVariant];

    if (v16) {
      goto LABEL_14;
    }
  }
  else if (v11 && [v11 hasSiriEndpointService])
  {
    v14 = [v11 uuid];
    uint64_t v15 = +[HMDAccessoryEventsGenerated endpointAccessorySettingsTopicsForAccessoryUUID:v14 homeUUID:v6];
LABEL_15:
    id v17 = (void *)v15;

    goto LABEL_17;
  }
  id v17 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_17:

  return v17;
}

+ (id)upstreamTopicsForTopic:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  id v6 = [MEMORY[0x1E4F2E7A0] decodeTopic:v4];
  uint64_t v7 = [v6 accessoryUUID];
  if (v7
    && (id v8 = (void *)v7,
        [v6 homeUUID],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    id v10 = [v6 homeUUID];
    id v11 = [v6 accessoryUUID];
    uint64_t v12 = [a1 upstreamHomeAndAccessoryTopicsForTopic:v4 homeUUID:v10 accessoryUUID:v11];
    [v5 unionSet:v12];
  }
  else
  {
    v13 = [v6 homeUUID];

    if (!v13) {
      goto LABEL_8;
    }
    v14 = [v6 homeUUID];
    id v10 = [a1 upstreamHomeTopicForTopic:v4 homeUUID:v14];

    if (v10) {
      [v5 addObject:v10];
    }
  }

LABEL_8:
  uint64_t v15 = [a1 upstreamClientTopicForTopic:v4];
  if (v15) {
    [v5 addObject:v15];
  }
  uint64_t v16 = (void *)[v5 copy];

  return v16;
}

+ (id)upstreamHomeAndAccessoryTopicsForTopic:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v12 = [a1 upstreamHomeTopicForTopic:v8 homeUUID:v9];
  if (v12) {
    [v11 addObject:v12];
  }
  v13 = [MEMORY[0x1E4F2E7A0] decodeTopic:v8];
  v14 = v13;
  if (v13)
  {
    uint64_t v15 = [v13 homeUUID];
    if (objc_msgSend(v15, "hmf_isEqualToUUID:", v9))
    {
      uint64_t v16 = [v14 accessoryUUID];
      int v17 = objc_msgSend(v16, "hmf_isEqualToUUID:", v10);

      if (!v17) {
        goto LABEL_9;
      }
      v18 = [v14 asAccessorySettingTopic];

      if (!v18)
      {
        uint64_t v21 = [v14 asAccessoryTopic];
        if (!v21) {
          goto LABEL_9;
        }
        v22 = (void *)v21;
        v23 = [v14 topicSuffix];
        BOOL v24 = +[HMDAccessoryEventsGenerated topicSuffix:v23 isPartOfIndex:@"AppleAccessoryIndex"];

        if (!v24) {
          goto LABEL_9;
        }
      }
      uint64_t v15 = +[HMDAccessoryEventsGenerated accessoryIndexForAccessoryUUID:v10 homeUUID:v9];
      [v11 addObject:v15];
    }
  }
LABEL_9:
  v19 = (void *)[v11 copy];

  return v19;
}

+ (id)upstreamHomeTopicForTopic:(id)a3 homeUUID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F2E7A0] decodeTopic:a3];
  id v8 = v7;
  if (!v7) {
    goto LABEL_9;
  }
  id v9 = [v7 homeUUID];
  int v10 = objc_msgSend(v9, "hmf_isEqualToUUID:", v6);

  if (!v10) {
    goto LABEL_9;
  }
  id v11 = [v8 asAccessorySettingTopic];

  if (v11) {
    goto LABEL_4;
  }
  uint64_t v13 = [v8 asAccessoryTopic];
  if (v13)
  {
    v14 = (void *)v13;
    uint64_t v15 = [v8 topicSuffix];
    BOOL v16 = +[HMDAccessoryEventsGenerated topicSuffix:v15 isPartOfIndex:@"HomeIndex"];

    if (v16) {
      goto LABEL_4;
    }
  }
  uint64_t v17 = [v8 asHomeEventTopic];
  if (!v17) {
    goto LABEL_9;
  }
  v18 = (void *)v17;
  v19 = [v8 topicSuffix];
  v20 = [&unk_1F2DCA230 objectForKeyedSubscript:v19];
  uint64_t v21 = [v20 objectForKeyedSubscript:@"indexes"];
  v22 = [v21 objectForKeyedSubscript:@"HomeIndex"];

  if (v22)
  {
LABEL_4:
    uint64_t v12 = [a1 homeInfoIndexForHomeUUID:v6];
  }
  else
  {
LABEL_9:
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)upstreamClientTopicForTopic:(id)a3
{
  id v3 = [MEMORY[0x1E4F2E7A0] decodeTopic:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 asAccessorySettingTopic];

    if (v5)
    {
      id v6 = @"index.xpc.client.spi.settings";
    }
    else
    {
      uint64_t v8 = [v4 asAccessoryTopic];
      if (v8
        && (id v9 = (void *)v8,
            [v4 topicSuffix],
            int v10 = objc_claimAutoreleasedReturnValue(),
            BOOL v11 = +[HMDAccessoryEventsGenerated topicSuffix:v10 isPartOfIndex:@"SpiIndex"], v10, v9, v11))
      {
        id v6 = @"index.xpc.client.spi";
      }
      else
      {
        id v6 = [v4 asHomeEventTopic];
        if (v6)
        {
          uint64_t v12 = [&unk_1F2DCA1B8 objectForKeyedSubscript:@"indexes"];
          uint64_t v13 = [v12 objectForKeyedSubscript:@"SpiIndex"];

          if (v13) {
            id v6 = @"index.xpc.client.spi";
          }
          else {
            id v6 = 0;
          }
        }
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)forwardingTopicsWithTopics:(id)a3 forHomeRouterWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __75__HMDHomeEventsGenerated_forwardingTopicsWithTopics_forHomeRouterWithUUID___block_invoke;
  v18 = &unk_1E6A07CC0;
  id v10 = v7;
  id v19 = v10;
  id v20 = a1;
  BOOL v11 = objc_msgSend(v6, "na_flatMap:", &v15);
  uint64_t v12 = objc_msgSend(v9, "setWithArray:", v11, v15, v16, v17, v18);
  uint64_t v13 = [v12 allObjects];

  return v13;
}

id __75__HMDHomeEventsGenerated_forwardingTopicsWithTopics_forHomeRouterWithUUID___block_invoke(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F2E7A0] decodeTopic:v3];
  id v5 = v4;
  if (!v4
    || ([v4 homeUUID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = objc_msgSend(v6, "hmf_isEqualToUUID:", *(void *)(a1 + 32)),
        v6,
        !v7))
  {
    if ([v3 isEqualToString:@"index.xpc.client.spi"]
      || [v3 isEqualToString:@"index.xpc.client.spi.settings"])
    {
      id v10 = [*(id *)(a1 + 40) clientIndexToHomeTopicsForHomeUUID:*(void *)(a1 + 32)];
    }
    else
    {
      id v10 = 0;
    }
    goto LABEL_19;
  }
  uint64_t v8 = [v5 asAccessorySettingTopic];
  if (!v8)
  {
    id v9 = [v5 asAccessoryTopic];
    if (v9)
    {
      BOOL v11 = [v5 topicSuffix];
      BOOL v12 = +[HMDAccessoryEventsGenerated topicSuffix:v11 isPartOfIndex:@"HomeIndex"];

      if (v12)
      {
        uint64_t v13 = [*(id *)(a1 + 40) homeInfoIndexForHomeUUID:*(void *)(a1 + 32)];
        BOOL v24 = v13;
        id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];

        goto LABEL_18;
      }
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = [v5 asHomeEventTopic];
      if (v14)
      {
        uint64_t v15 = [v5 topicSuffix];
        uint64_t v16 = [&unk_1F2DCA140 objectForKeyedSubscript:v15];
        uint64_t v17 = [v16 objectForKeyedSubscript:@"indexes"];
        v18 = [v17 objectForKeyedSubscript:@"HomeIndex"];

        if (v18)
        {
          id v9 = [*(id *)(a1 + 40) homeInfoIndexForHomeUUID:*(void *)(a1 + 32)];
          v23 = v9;
          id v19 = (void *)MEMORY[0x1E4F1C978];
          id v20 = &v23;
LABEL_17:
          id v10 = [v19 arrayWithObjects:v20 count:1];

          id v9 = (void *)v14;
          goto LABEL_18;
        }
      }
    }
    id v22 = v3;
    id v19 = (void *)MEMORY[0x1E4F1C978];
    id v20 = &v22;
    goto LABEL_17;
  }
  id v9 = [*(id *)(a1 + 40) homeInfoIndexForHomeUUID:*(void *)(a1 + 32)];
  v25[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
LABEL_18:

LABEL_19:
  return v10;
}

+ (id)clientIndexToHomeTopicsForHomeUUID:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = NSString;
  id v4 = [a3 UUIDString];
  id v5 = [v3 stringWithFormat:@"index.home.%@.info", v4];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)homeInfoIndexForHomeUUID:(id)a3
{
  return (id)[NSString stringWithFormat:@"index.home.%@.info", a3];
}

+ (id)indexTopicForTopicSuffix:(id)a3 indexName:(id)a4
{
  id v5 = a4;
  id v6 = [&unk_1F2DCA0C8 objectForKeyedSubscript:a3];
  int v7 = [v6 objectForKeyedSubscript:@"indexes"];
  uint64_t v8 = [v7 objectForKeyedSubscript:v5];

  return v8;
}

+ (id)allTopics
{
  return &unk_1F2DC6A30;
}

+ (id)topicMap
{
  return &unk_1F2DCA050;
}

@end