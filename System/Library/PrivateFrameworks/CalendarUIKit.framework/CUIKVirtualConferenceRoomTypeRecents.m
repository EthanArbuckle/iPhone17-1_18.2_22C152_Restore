@interface CUIKVirtualConferenceRoomTypeRecents
+ (id)_extensionBundleIdentifierFromIdentifier:(id)a3;
+ (id)_identifierFromRoomType:(id)a3;
+ (id)roomTypesOrderedByMRU:(id)a3 forSource:(id)a4;
+ (void)_updateSavedMRUDictWithRoomTypes:(id)a3 source:(id)a4;
+ (void)cleanup;
+ (void)selectRoomType:(id)a3 forSource:(id)a4;
@end

@implementation CUIKVirtualConferenceRoomTypeRecents

+ (id)roomTypesOrderedByMRU:(id)a3 forSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 sourceIdentifier];
  if (v8)
  {
    [a1 _updateSavedMRUDictWithRoomTypes:v6 source:v7];
    v9 = [MEMORY[0x1E4F255C8] shared];
    v10 = [v9 conferenceRoomTypeIdentifiersByMRU];

    v11 = [v7 sourceIdentifier];
    v12 = [v10 objectForKey:v11];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__CUIKVirtualConferenceRoomTypeRecents_roomTypesOrderedByMRU_forSource___block_invoke;
    v22[3] = &unk_1E636AF90;
    id v23 = v12;
    id v24 = a1;
    id v13 = v12;
    v14 = [v6 sortedArrayUsingComparator:v22];
  }
  else
  {
    v10 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[CUIKVirtualConferenceRoomTypeRecents roomTypesOrderedByMRU:forSource:]((uint64_t)v7, v10, v15, v16, v17, v18, v19, v20);
    }
    v14 = 0;
  }

  return v14;
}

uint64_t __72__CUIKVirtualConferenceRoomTypeRecents_roomTypesOrderedByMRU_forSource___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = [v5 _identifierFromRoomType:a2];
  v8 = [*(id *)(a1 + 40) _identifierFromRoomType:v6];

  unint64_t v9 = [*(id *)(a1 + 32) indexOfObject:v7];
  unint64_t v10 = [*(id *)(a1 + 32) indexOfObject:v8];
  if (v9 < v10) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = v9 > v10;
  }

  return v11;
}

+ (void)selectRoomType:(id)a3 forSource:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 sourceIdentifier];
  if (v8)
  {
    v23[0] = v6;
    unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [a1 _updateSavedMRUDictWithRoomTypes:v9 source:v7];

    unint64_t v10 = [a1 _identifierFromRoomType:v6];
    uint64_t v11 = [MEMORY[0x1E4F255C8] shared];
    v12 = [v11 conferenceRoomTypeIdentifiersByMRU];

    id v13 = [v12 objectForKey:v8];
    v14 = (void *)[v13 mutableCopy];
    [v14 removeObject:v10];
    [v14 insertObject:v10 atIndex:0];
    uint64_t v15 = (void *)[v12 mutableCopy];
    [v15 setObject:v14 forKey:v8];
    uint64_t v16 = [MEMORY[0x1E4F255C8] shared];
    [v16 setConferenceRoomTypeIdentifiersByMRU:v15];
  }
  else
  {
    unint64_t v10 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[CUIKVirtualConferenceRoomTypeRecents selectRoomType:forSource:]((uint64_t)v7, v10, v17, v18, v19, v20, v21, v22);
    }
  }
}

+ (void)_updateSavedMRUDictWithRoomTypes:(id)a3 source:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 sourceIdentifier];
  if (v8)
  {
    id v30 = v7;
    unint64_t v9 = [MEMORY[0x1E4F255C8] shared];
    unint64_t v10 = [v9 conferenceRoomTypeIdentifiersByMRU];

    v29 = v10;
    id v11 = [v10 mutableCopy];
    if (!v11)
    {
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v12 = [v11 objectForKey:v8];
    id v13 = (void *)[v12 mutableCopy];

    if (!v13)
    {
      id v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    }
    [v11 setObject:v13 forKey:v8];
    v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v31 = v6;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [a1 _identifierFromRoomType:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          if (([v13 containsObject:v20] & 1) == 0) {
            [v14 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v17);
    }

    [v13 addObjectsFromArray:v14];
    uint64_t v21 = [MEMORY[0x1E4F255C8] shared];
    [v21 setConferenceRoomTypeIdentifiersByMRU:v11];

    id v7 = v30;
    id v6 = v31;
    uint64_t v22 = v29;
  }
  else
  {
    uint64_t v22 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[CUIKVirtualConferenceRoomTypeRecents _updateSavedMRUDictWithRoomTypes:source:]((uint64_t)v7, v22, v23, v24, v25, v26, v27, v28);
    }
  }
}

+ (void)cleanup
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F255C8] shared];
  v3 = [v2 conferenceRoomTypeIdentifiersByMRU];

  v4 = (void *)[v3 mutableCopy];
  id v5 = objc_alloc_init(MEMORY[0x1E4F25550]);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v60 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        v12 = [v5 sourceWithIdentifier:v11];
        if (!v12) {
          [v4 removeObjectForKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v59 objects:v66 count:16];
    }
    while (v8);
  }
  v38 = v5;

  id v13 = (void *)[v4 copy];
  v14 = [MEMORY[0x1E4F1CA80] set];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = v13;
  uint64_t v41 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v56;
    v40 = v4;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v56 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v15;
        uint64_t v16 = *(void *)(*((void *)&v55 + 1) + 8 * v15);
        uint64_t v17 = objc_msgSend(obj, "objectForKeyedSubscript:", v16, v38);
        uint64_t v18 = (void *)[v17 mutableCopy];

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        uint64_t v43 = v16;
        uint64_t v19 = [obj objectForKeyedSubscript:v16];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v64 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v52 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v51 + 1) + 8 * j);
              uint64_t v25 = [a1 _extensionBundleIdentifierFromIdentifier:v24];
              if ([v14 containsObject:v25])
              {
                [v18 removeObject:v24];
              }
              else
              {
                id v26 = objc_alloc(MEMORY[0x1E4F223A0]);
                id v50 = 0;
                uint64_t v27 = (void *)[v26 initWithBundleIdentifier:v25 error:&v50];
                id v28 = v50;
                if (!v27)
                {
                  [v14 addObject:v25];
                  [v18 removeObject:v24];
                }
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v51 objects:v64 count:16];
          }
          while (v21);
        }

        v4 = v40;
        [v40 setObject:v18 forKeyedSubscript:v43];

        uint64_t v15 = v44 + 1;
      }
      while (v44 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
    }
    while (v41);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v29 = obj;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v63 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v47 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v46 + 1) + 8 * k);
        long long v35 = objc_msgSend(v4, "objectForKeyedSubscript:", v34, v38);
        v36 = (void *)[v35 mutableCopy];

        if ((unint64_t)[v36 count] >= 0xB)
        {
          do
            [v36 removeLastObject];
          while ((unint64_t)[v36 count] > 0xA);
        }
        [v4 setObject:v36 forKeyedSubscript:v34];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v63 count:16];
    }
    while (v31);
  }

  uint64_t v37 = [MEMORY[0x1E4F255C8] shared];
  [v37 setConferenceRoomTypeIdentifiersByMRU:v4];
}

+ (id)_identifierFromRoomType:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  id v5 = [v4 extensionBundleIdentifier];
  id v6 = [v4 identifier];

  uint64_t v7 = [v3 stringWithFormat:@"%@%@%@", v5, @"/", v6];

  return v7;
}

+ (id)_extensionBundleIdentifierFromIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"/"];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = objc_msgSend(v3, "substringWithRange:", 0, v4);
  }

  return v5;
}

+ (void)roomTypesOrderedByMRU:(uint64_t)a3 forSource:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)selectRoomType:(uint64_t)a3 forSource:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_updateSavedMRUDictWithRoomTypes:(uint64_t)a3 source:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end