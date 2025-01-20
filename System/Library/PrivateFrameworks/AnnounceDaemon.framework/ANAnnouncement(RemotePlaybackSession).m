@interface ANAnnouncement(RemotePlaybackSession)
- (id)remoteSessionDictionary;
- (id)sendFailureDictionary;
- (uint64_t)defaultActionURL;
@end

@implementation ANAnnouncement(RemotePlaybackSession)

- (id)remoteSessionDictionary
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v3 = [a1 identifier];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F4A4E0]];

  v4 = [a1 groupID];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F4A758]];

  v5 = [a1 location];
  v6 = [v5 homeUUID];

  v82 = v6;
  if (v6)
  {
    v7 = +[ANHomeManager shared];
    v8 = [v7 homeForID:v6];

    v9 = [v6 UUIDString];
    [v2 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F4A770]];

    v10 = [v8 name];
    [v2 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F4A778]];
  }
  else
  {
    v8 = 0;
  }
  v11 = NSNumber;
  v12 = [a1 announcer];
  v13 = objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "isAccessory"));
  [v2 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F4A538]];

  v14 = [a1 announcer];
  v15 = [v14 homeKitID];
  [v2 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F4A530]];

  v16 = [a1 announcer];
  v17 = [v16 homeKitUserID];
  [v2 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F4A560]];

  v84 = a1;
  if (v8)
  {
    v18 = [a1 announcer];
    v19 = [v18 name];

    if (!v19 || [v19 isEqualToString:&stru_1F34A0E10])
    {
      uint64_t v20 = [a1 announcerNameInHome:v8];

      v19 = (void *)v20;
    }
    [v2 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F4A540]];
    id v21 = objc_alloc(MEMORY[0x1E4F29128]);
    v22 = [a1 announcer];
    v23 = [v22 homeKitID];
    uint64_t v24 = [v21 initWithUUIDString:v23];
    v25 = a1;
    v26 = (void *)v24;

    v27 = [v25 announcer];
    v28 = [v27 userID];

    if (!v28)
    {
      v29 = objc_msgSend(v8, "hmu_userWithUniqueIdentifier:", v26);
      uint64_t v30 = [v29 userID];

      if (v30) {
        v28 = (__CFString *)v30;
      }
      else {
        v28 = &stru_1F34A0E10;
      }
    }
    [v2 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F4A550]];

    a1 = v84;
  }
  v83 = v2;
  v31 = objc_opt_new();
  v32 = [a1 location];
  v33 = [v32 roomUUIDs];

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v34 = v33;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v89 objects:v94 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v90 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        v40 = objc_msgSend(v8, "hmu_roomWithUniqueIdentifier:", v39);
        v41 = v40;
        if (v40)
        {
          v42 = [v40 name];
          v43 = [v39 UUIDString];
          [v31 setObject:v42 forKeyedSubscript:v43];
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v89 objects:v94 count:16];
    }
    while (v36);
  }
  v81 = v34;

  [v83 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F4A7F8]];
  v44 = objc_opt_new();
  v45 = [v84 location];
  v46 = [v45 zoneUUIDs];

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v47 = v46;
  uint64_t v48 = [v47 countByEnumeratingWithState:&v85 objects:v93 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v86;
    do
    {
      for (uint64_t j = 0; j != v49; ++j)
      {
        if (*(void *)v86 != v50) {
          objc_enumerationMutation(v47);
        }
        v52 = *(void **)(*((void *)&v85 + 1) + 8 * j);
        v53 = objc_msgSend(v8, "hmu_zoneWithUniqueIdentifier:", v52);
        v54 = v53;
        if (v53)
        {
          v55 = [v53 name];
          v56 = [v52 UUIDString];
          [v44 setObject:v55 forKeyedSubscript:v56];
        }
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v85 objects:v93 count:16];
    }
    while (v49);
  }

  [v83 setObject:v44 forKeyedSubscript:*MEMORY[0x1E4F4A880]];
  v57 = [v84 filePath];
  [v83 setObject:v57 forKeyedSubscript:*MEMORY[0x1E4F4A570]];

  v58 = [v84 announcer];
  v59 = [v58 homeKitID];
  v60 = objc_msgSend(v8, "hmu_accessoryWithUniqueIdentifierUUIDString:", v59);

  if (v8)
  {
    v61 = [v84 announcer];
    if ([v61 isAccessory])
    {
      v62 = v60;
      v63 = [v84 announcer];
      uint64_t v64 = [v63 homeKitUserID];
      if (v64)
      {
        v65 = (void *)v64;
        v80 = v62;
        v66 = [v62 room];

        v60 = v80;
        if (v66)
        {
          v67 = [v80 room];
          v79 = [v67 name];
          v68 = ANLocalizedStringWithFormat();

LABEL_39:
          objc_msgSend(v83, "setObject:forKeyedSubscript:", v68, *MEMORY[0x1E4F4A818], v79);

          goto LABEL_40;
        }
LABEL_38:
        v67 = [v8 name];
        v79 = v67;
        v68 = ANLocalizedStringWithFormat();
        goto LABEL_39;
      }
    }
    goto LABEL_38;
  }
LABEL_40:
  v69 = [v60 services];
  v70 = objc_msgSend(v69, "na_firstObjectPassingTest:", &__block_literal_global_4);

  v71 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v84, "productType"));
  [v83 setObject:v71 forKeyedSubscript:*MEMORY[0x1E4F4A7D8]];

  v72 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v84, "productTypeOverride"));
  [v83 setObject:v72 forKeyedSubscript:*MEMORY[0x1E4F4A7E0]];

  v73 = [v70 serviceType];
  [v83 setObject:v73 forKeyedSubscript:*MEMORY[0x1E4F4A800]];

  v74 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v84, "deviceClass"));
  [v83 setObject:v74 forKeyedSubscript:*MEMORY[0x1E4F4A708]];

  v75 = [v84 transcriptionText];
  [v83 setObject:v75 forKeyedSubscript:*MEMORY[0x1E4F4A828]];

  v76 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v84, "hasPlayed"));
  [v83 setObject:v76 forKeyedSubscript:*MEMORY[0x1E4F4A7C8]];

  v77 = (void *)[v83 copy];
  return v77;
}

- (id)sendFailureDictionary
{
  v1 = (void *)MEMORY[0x1E4F1CA60];
  v2 = [a1 remoteSessionDictionary];
  v3 = [v1 dictionaryWithDictionary:v2];

  [v3 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F4A708]];
  [v3 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F4A7C8]];
  [v3 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F4A538]];
  [v3 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F4A7D8]];
  v4 = ANLocalizedString();
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F4A818]];

  v5 = (void *)[v3 copy];
  return v5;
}

- (uint64_t)defaultActionURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"com.apple.Home://"];
}

@end