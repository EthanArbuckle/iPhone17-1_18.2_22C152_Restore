@interface AVTStickerRecentsPresetsProvider
+ (id)filteredRecentStickers:(id)a3 withAvailableRecordIdentifiersMap:(id)a4;
+ (id)paddedStickerRecordsWithRecents:(id)a3 excludingRecords:(id)a4 paddingMemojiIdentifier:(id)a5 numberOfStickers:(int64_t)a6;
+ (id)paddedStickerRecordsWithRecents:(id)a3 paddingMemojiIdentifier:(id)a4 numberOfStickers:(int64_t)a5;
+ (id)presetsGivenNoMemoji;
+ (id)presetsGivenOneMemojiWithIdentifier:(id)a3;
+ (void)filteredAndPaddedStickerRecordsWithRecents:(id)a3 excludingRecords:(id)a4 paddingMemojiIdentifier:(id)a5 avatarStore:(id)a6 numberOfStickers:(int64_t)a7 resultBlock:(id)a8;
@end

@implementation AVTStickerRecentsPresetsProvider

+ (void)filteredAndPaddedStickerRecordsWithRecents:(id)a3 excludingRecords:(id)a4 paddingMemojiIdentifier:(id)a5 avatarStore:(id)a6 numberOfStickers:(int64_t)a7 resultBlock:(id)a8
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v47 = a8;
  id v45 = a1;
  id v49 = v15;
  v17 = [a1 paddedStickerRecordsWithRecents:a3 excludingRecords:v14 paddingMemojiIdentifier:v15 numberOfStickers:a7];
  unint64_t v46 = a7;
  v18 = [MEMORY[0x263EFF9C0] setWithCapacity:a7];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v57 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = [*(id *)(*((void *)&v56 + 1) + 8 * i) avatarRecordIdentifier];
        [v18 addObject:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v21);
  }
  id v50 = v14;

  v25 = (void *)MEMORY[0x263F29718];
  v26 = [v18 allObjects];
  v27 = [v25 requestForAvatarsWithIdentifiers:v26];

  id v55 = 0;
  id v48 = v16;
  v28 = [v16 avatarsForFetchRequest:v27 error:&v55];
  id v44 = v55;
  v29 = [MEMORY[0x263EFF9A0] dictionary];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v30 = v28;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v52 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v51 + 1) + 8 * j);
        v36 = [v35 identifier];
        [v29 setObject:v35 forKeyedSubscript:v36];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v32);
  }

  v37 = [v45 filteredRecentStickers:v19 withAvailableRecordIdentifiersMap:v29];

  if ([v37 count] >= v46)
  {
    v43 = v47;
    (*((void (**)(id, void *, void *))v47 + 2))(v47, v37, v29);
    v38 = v49;
    v41 = v50;
    v42 = v48;
  }
  else
  {
    v38 = v49;
    v39 = [v29 objectForKey:v49];

    if (v39) {
      id v40 = v49;
    }
    else {
      id v40 = 0;
    }
    v41 = v50;
    v42 = v48;
    v43 = v47;
    [v45 filteredAndPaddedStickerRecordsWithRecents:v37 excludingRecords:v50 paddingMemojiIdentifier:v40 avatarStore:v48 numberOfStickers:v46 resultBlock:v47];
  }
}

+ (id)filteredRecentStickers:(id)a3 withAvailableRecordIdentifiersMap:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "avatarRecordIdentifier", (void)v17);
        id v15 = [v6 objectForKey:v14];

        if (v15) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)paddedStickerRecordsWithRecents:(id)a3 paddingMemojiIdentifier:(id)a4 numberOfStickers:(int64_t)a5
{
  return (id)[a1 paddedStickerRecordsWithRecents:a3 excludingRecords:0 paddingMemojiIdentifier:a4 numberOfStickers:a5];
}

+ (id)paddedStickerRecordsWithRecents:(id)a3 excludingRecords:(id)a4 paddingMemojiIdentifier:(id)a5 numberOfStickers:(int64_t)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 count] >= (unint64_t)a6)
  {
    id v33 = v10;
  }
  else
  {
    id v33 = [MEMORY[0x263EFF980] arrayWithArray:v10];
    if (v12) {
      [a1 presetsGivenOneMemojiWithIdentifier:v12];
    }
    else {
    v13 = [a1 presetsGivenNoMemoji];
    }
    uint64_t v14 = objc_msgSend(v10, "count", v12);
    id v31 = v10;
    uint64_t v32 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count") + objc_msgSend(v11, "count"));
    if (v11) {
      [v32 addObjectsFromArray:v11];
    }
    if (v10) {
      objc_msgSend(v32, "addObjectsFromArray:");
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obuint64_t j = v13;
    uint64_t v37 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v37)
    {
      int64_t v15 = a6 - v14;
      uint64_t v35 = *(void *)v45;
      id v36 = v11;
LABEL_12:
      uint64_t v16 = 0;
      while (1)
      {
        int64_t v39 = v15;
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v16;
        long long v17 = *(void **)(*((void *)&v44 + 1) + 8 * v16);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v18 = v11;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v41 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              v24 = [v23 avatarRecordIdentifier];
              v25 = [v17 avatarRecordIdentifier];
              if ([v24 isEqualToString:v25])
              {
                v26 = [v23 stickerConfigurationIdentifier];
                v27 = [v17 stickerConfigurationIdentifier];
                char v28 = [v26 isEqualToString:v27];

                if (v28)
                {

                  int64_t v15 = v39;
                  goto LABEL_27;
                }
              }
              else
              {
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
          }
          while (v20);
        }

        [v33 addObject:v17];
        int64_t v15 = v39 - 1;
LABEL_27:
        id v11 = v36;
        if (!v15) {
          break;
        }
        uint64_t v16 = v38 + 1;
        if (v38 + 1 == v37)
        {
          uint64_t v37 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
          if (v37) {
            goto LABEL_12;
          }
          break;
        }
      }
    }

    id v12 = v30;
    id v10 = v31;
  }

  return v33;
}

+ (id)presetsGivenNoMemoji
{
  v36[8] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F29768]);
  v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [v3 UUIDString];
  uint64_t v35 = (void *)[v2 initWithIdentifier:v4 avatarRecordIdentifier:@"unicorn" stickerConfigurationIdentifier:@"face_with_starry_eyes" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  id v5 = objc_alloc(MEMORY[0x263F29768]);
  id v6 = [MEMORY[0x263F08C38] UUID];
  v7 = [v6 UUIDString];
  v34 = (void *)[v5 initWithIdentifier:v7 avatarRecordIdentifier:@"unicorn" stickerConfigurationIdentifier:@"smiling_face_with_heart-shaped_eyes" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  id v8 = objc_alloc(MEMORY[0x263F29768]);
  uint64_t v9 = [MEMORY[0x263F08C38] UUID];
  id v10 = [v9 UUIDString];
  id v33 = (void *)[v8 initWithIdentifier:v10 avatarRecordIdentifier:@"unicorn" stickerConfigurationIdentifier:@"exploding_head" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  id v11 = objc_alloc(MEMORY[0x263F29768]);
  id v12 = [MEMORY[0x263F08C38] UUID];
  v13 = [v12 UUIDString];
  uint64_t v14 = (void *)[v11 initWithIdentifier:v13 avatarRecordIdentifier:@"unicorn" stickerConfigurationIdentifier:@"face_with_tears_of_joy" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  id v15 = objc_alloc(MEMORY[0x263F29768]);
  uint64_t v16 = [MEMORY[0x263F08C38] UUID];
  long long v17 = [v16 UUIDString];
  id v18 = (void *)[v15 initWithIdentifier:v17 avatarRecordIdentifier:@"unicorn" stickerConfigurationIdentifier:@"face_blowing_a_kiss" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  id v19 = objc_alloc(MEMORY[0x263F29768]);
  uint64_t v20 = [MEMORY[0x263F08C38] UUID];
  uint64_t v21 = [v20 UUIDString];
  uint64_t v22 = (void *)[v19 initWithIdentifier:v21 avatarRecordIdentifier:@"unicorn" stickerConfigurationIdentifier:@"sleeping_face" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  id v23 = objc_alloc(MEMORY[0x263F29768]);
  v24 = [MEMORY[0x263F08C38] UUID];
  v25 = [v24 UUIDString];
  v26 = (void *)[v23 initWithIdentifier:v25 avatarRecordIdentifier:@"unicorn" stickerConfigurationIdentifier:@"face_with_symbols_over_mouth" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  id v27 = objc_alloc(MEMORY[0x263F29768]);
  char v28 = [MEMORY[0x263F08C38] UUID];
  v29 = [v28 UUIDString];
  id v30 = (void *)[v27 initWithIdentifier:v29 avatarRecordIdentifier:@"unicorn" stickerConfigurationIdentifier:@"winking_face_with_stuck_out_tongue" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  v36[0] = v35;
  v36[1] = v34;
  v36[2] = v33;
  v36[3] = v14;
  v36[4] = v18;
  v36[5] = v22;
  v36[6] = v26;
  v36[7] = v30;
  id v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:8];

  return v31;
}

+ (id)presetsGivenOneMemojiWithIdentifier:(id)a3
{
  v39[8] = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263F29768];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [MEMORY[0x263F08C38] UUID];
  v7 = [v6 UUIDString];
  uint64_t v38 = (void *)[v5 initWithIdentifier:v7 avatarRecordIdentifier:v4 stickerConfigurationIdentifier:@"face_with_starry_eyes" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  id v8 = objc_alloc(MEMORY[0x263F29768]);
  uint64_t v9 = [MEMORY[0x263F08C38] UUID];
  id v10 = [v9 UUIDString];
  uint64_t v37 = (void *)[v8 initWithIdentifier:v10 avatarRecordIdentifier:v4 stickerConfigurationIdentifier:@"smiling_face_with_heart-shaped_eyes" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  id v11 = objc_alloc(MEMORY[0x263F29768]);
  id v12 = [MEMORY[0x263F08C38] UUID];
  v13 = [v12 UUIDString];
  id v36 = (void *)[v11 initWithIdentifier:v13 avatarRecordIdentifier:v4 stickerConfigurationIdentifier:@"person_nervous" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  id v14 = objc_alloc(MEMORY[0x263F29768]);
  id v15 = [MEMORY[0x263F08C38] UUID];
  uint64_t v16 = [v15 UUIDString];
  long long v17 = (void *)[v14 initWithIdentifier:v16 avatarRecordIdentifier:v4 stickerConfigurationIdentifier:@"face_with_tears_of_joy" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  id v18 = objc_alloc(MEMORY[0x263F29768]);
  id v19 = [MEMORY[0x263F08C38] UUID];
  uint64_t v20 = [v19 UUIDString];
  uint64_t v21 = (void *)[v18 initWithIdentifier:v20 avatarRecordIdentifier:v4 stickerConfigurationIdentifier:@"beKind" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  id v22 = objc_alloc(MEMORY[0x263F29768]);
  id v23 = [MEMORY[0x263F08C38] UUID];
  v24 = [v23 UUIDString];
  v25 = (void *)[v22 initWithIdentifier:v24 avatarRecordIdentifier:v4 stickerConfigurationIdentifier:@"face_with_symbols_over_mouth" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  id v26 = objc_alloc(MEMORY[0x263F29768]);
  id v27 = [MEMORY[0x263F08C38] UUID];
  char v28 = [v27 UUIDString];
  v29 = (void *)[v26 initWithIdentifier:v28 avatarRecordIdentifier:v4 stickerConfigurationIdentifier:@"person_waving" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  id v30 = objc_alloc(MEMORY[0x263F29768]);
  id v31 = [MEMORY[0x263F08C38] UUID];
  uint64_t v32 = [v31 UUIDString];
  id v33 = (void *)[v30 initWithIdentifier:v32 avatarRecordIdentifier:v4 stickerConfigurationIdentifier:@"head_in_clouds" frequencySum:&unk_26BF4D358 serializationVersion:&unk_26BF4D358];

  v39[0] = v38;
  v39[1] = v37;
  v39[2] = v36;
  v39[3] = v17;
  v39[4] = v21;
  v39[5] = v25;
  v39[6] = v29;
  v39[7] = v33;
  v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:8];

  return v34;
}

@end