@interface HMDAccessoryEventsGenerated
+ (BOOL)topicSuffix:(id)a3 isPartOfIndex:(id)a4;
+ (id)accessoryIndexForAccessoryUUID:(id)a3 homeUUID:(id)a4;
+ (id)allTopics;
+ (id)appleMediaAccessoryTopicsForAccessoryUUID:(id)a3 homeUUID:(id)a4;
+ (id)endpointAccessorySettingsTopicsForAccessoryUUID:(id)a3 homeUUID:(id)a4;
+ (id)forwardingTopicsForTopics:(id)a3 residentAccessoryUUID:(id)a4 homeUUID:(id)a5;
+ (id)homePodAccessorySettingsTopicsForAccessoryUUID:(id)a3 homeUUID:(id)a4;
+ (id)indexTopicForTopic:(id)a3;
+ (id)topicMap;
+ (id)topicsRemovingAccessoryTopics:(id)a3 accessoryUUID:(id)a4;
@end

@implementation HMDAccessoryEventsGenerated

+ (id)topicsRemovingAccessoryTopics:(id)a3 accessoryUUID:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__HMDAccessoryEventsGenerated_topicsRemovingAccessoryTopics_accessoryUUID___block_invoke;
  v9[3] = &unk_1E6A139C0;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a3, "na_filter:", v9);

  return v7;
}

uint64_t __75__HMDAccessoryEventsGenerated_topicsRemovingAccessoryTopics_accessoryUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x1E4F2E7A0] decodeTopic:a2];
  v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 accessoryUUID];
    uint64_t v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6) ^ 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (BOOL)topicSuffix:(id)a3 isPartOfIndex:(id)a4
{
  id v5 = a4;
  id v6 = [&unk_1F2DCB7C0 objectForKeyedSubscript:a3];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"indexes"];
  v8 = [v7 objectForKeyedSubscript:v5];

  return v8 != 0;
}

+ (id)accessoryIndexForAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  id v5 = NSString;
  id v6 = a3;
  uint64_t v7 = [a4 UUIDString];
  v8 = [v6 UUIDString];

  v9 = [v5 stringWithFormat:@"index.home.%@.accessory.%@.info", v7, v8];

  return v9;
}

+ (id)forwardingTopicsForTopics:(id)a3 residentAccessoryUUID:(id)a4 homeUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [a1 accessoryIndexForAccessoryUUID:v8 homeUUID:v9];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__HMDAccessoryEventsGenerated_forwardingTopicsForTopics_residentAccessoryUUID_homeUUID___block_invoke;
  v17[3] = &unk_1E6A0EC28;
  id v18 = v8;
  id v19 = v11;
  id v20 = v9;
  id v21 = a1;
  id v12 = v9;
  id v13 = v11;
  id v14 = v8;
  v15 = objc_msgSend(v10, "na_map:", v17);

  return v15;
}

id __88__HMDAccessoryEventsGenerated_forwardingTopicsForTopics_residentAccessoryUUID_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F2E7A0] decodeTopic:v3];
  uint64_t v5 = [v4 asIndexAccessoryTopic];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [v4 accessoryUUID];
    int v8 = [v7 isEqual:*(void *)(a1 + 32)];

    if (v8)
    {
      id v9 = v3;
LABEL_7:
      id v14 = v9;
      v15 = 0;
      goto LABEL_17;
    }
  }
  uint64_t v10 = [v4 asAccessorySettingTopic];
  if (v10)
  {
    v11 = (void *)v10;
    id v12 = [v4 accessoryUUID];
    int v13 = [v12 isEqual:*(void *)(a1 + 32)];

    if (v13)
    {
      id v9 = *(id *)(a1 + 40);
      goto LABEL_7;
    }
  }
  v15 = [v4 asAccessoryTopic];
  if (v15)
  {
    v16 = [v4 accessoryUUID];
    int v17 = [v16 isEqual:*(void *)(a1 + 32)];

    if (v17)
    {
      id v18 = [v4 topicSuffix];
      id v19 = [&unk_1F2DCB3D8 objectForKeyedSubscript:v18];
      id v20 = [v19 objectForKeyedSubscript:@"indexes"];
      id v21 = [v20 objectForKeyedSubscript:@"AppleAccessoryIndex"];
      v22 = v3;
      if (v21) {
        v22 = *(void **)(a1 + 40);
      }
      id v14 = v22;

      goto LABEL_15;
    }
  }
  uint64_t v23 = [v4 asIndexHomeTopic];
  if (v23)
  {
    id v18 = (void *)v23;
    id v14 = [*(id *)(a1 + 56) accessoryIndexForAccessoryUUID:*(void *)(a1 + 32) homeUUID:*(void *)(a1 + 48)];
LABEL_15:

    goto LABEL_17;
  }
  id v14 = 0;
LABEL_17:

  return v14;
}

+ (id)endpointAccessorySettingsTopicsForAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  return +[HMDAccessorySettingEventsGenerated topicsForAccessoryUUID:a3 homeUUID:a4];
}

+ (id)homePodAccessorySettingsTopicsForAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)appleMediaAccessoryTopicsForAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)indexTopicForTopic:(id)a3
{
  v4 = [MEMORY[0x1E4F2E7A0] decodeTopic:a3];
  uint64_t v5 = [v4 asAccessorySettingTopic];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 accessoryUUID];
    int v8 = [v6 homeUUID];
    id v9 = [a1 accessoryIndexForAccessoryUUID:v7 homeUUID:v8];
    uint64_t v10 = 0;
LABEL_6:

    goto LABEL_8;
  }
  uint64_t v10 = [v4 asAccessoryTopic];
  if (v10)
  {
    v11 = [v4 topicSuffix];
    id v12 = [&unk_1F2DCAFF0 objectForKeyedSubscript:v11];
    int v13 = [v12 objectForKeyedSubscript:@"indexes"];
    id v14 = [v13 objectForKeyedSubscript:@"AppleAccessoryIndex"];

    if (v14)
    {
      uint64_t v7 = [v10 accessoryUUID];
      int v8 = [v10 homeUUID];
      id v9 = [a1 accessoryIndexForAccessoryUUID:v7 homeUUID:v8];
      goto LABEL_6;
    }
  }
  id v9 = 0;
LABEL_8:

  return v9;
}

+ (id)allTopics
{
  return &unk_1F2DC6EB0;
}

+ (id)topicMap
{
  return &unk_1F2DCAC08;
}

@end