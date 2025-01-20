@interface _CDEventStreamsRegister
- (id)getEventHandler:(id)a1;
- (id)getEventHandlerDictForStreams;
- (void)getEventHandlerDictForStreams;
- (void)initWithEventStreams:(void *)a1;
@end

@implementation _CDEventStreamsRegister

- (void)initWithEventStreams:(void *)a1
{
  v31[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)_CDEventStreamsRegister;
    id v4 = objc_msgSendSuper2(&v25, sel_init);
    a1 = v4;
    if (v4)
    {
      v20 = v4;
      if (!v3)
      {
        v5 = +[_DKSystemEventStreams deviceActivityLevelStream];
        v31[0] = v5;
        v6 = +[_DKSystemEventStreams appInFocusStream];
        v31[1] = v6;
        v7 = +[_DKSystemEventStreams watchNearbyStream];
        v31[2] = v7;
        v8 = +[_DKSystemEventStreams defaultPairedDeviceNearbyStream];
        v31[3] = v8;
        id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
      }
      v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v3 = v3;
      uint64_t v10 = [v3 countByEnumeratingWithState:&v21 objects:v30 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v3);
            }
            v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            [v9 addObject:v14];
            v15 = +[_CDLogging dataCollectionChannel];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v16 = [v14 name];
              *(_DWORD *)buf = 138412546;
              v27 = @"enabled";
              __int16 v28 = 2112;
              v29 = v16;
              _os_log_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_INFO, "Data collection %@ for stream %@", buf, 0x16u);
            }
          }
          uint64_t v11 = [v3 countByEnumeratingWithState:&v21 objects:v30 count:16];
        }
        while (v11);
      }

      uint64_t v17 = [v9 copy];
      a1 = v20;
      v18 = (void *)v20[1];
      v20[1] = v17;
    }
  }

  return a1;
}

- (id)getEventHandler:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = +[_DKSystemEventStreams deviceActivityLevelStream];
    v5 = [v4 name];
    char v6 = [v3 isEqualToString:v5];

    if (v6)
    {
      v7 = off_1E560C7F8;
LABEL_10:
      a1 = objc_alloc_init(*v7);
      goto LABEL_11;
    }
    v8 = +[_DKSystemEventStreams appInFocusStream];
    v9 = [v8 name];
    char v10 = [v3 isEqualToString:v9];

    if (v10)
    {
      v7 = off_1E560C800;
      goto LABEL_10;
    }
    uint64_t v11 = +[_DKSystemEventStreams watchActiveStream];
    uint64_t v12 = [v11 name];
    char v13 = [v3 isEqualToString:v12];

    if (v13)
    {
      v7 = off_1E560C810;
      goto LABEL_10;
    }
    v14 = +[_DKSystemEventStreams defaultPairedDeviceNearbyStream];
    v15 = [v14 name];
    int v16 = [v3 isEqualToString:v15];

    if (v16)
    {
      v7 = off_1E560C808;
      goto LABEL_10;
    }
    a1 = 0;
  }
LABEL_11:

  return a1;
}

- (id)getEventHandlerDictForStreams
{
  v1 = a1;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v3 = v1[1];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v9 = [v8 name];
          char v10 = -[_CDEventStreamsRegister getEventHandler:](v1, v9);

          if (v10)
          {
            uint64_t v11 = [v8 name];
            [v2 setObject:v10 forKey:v11];
          }
          else
          {
            uint64_t v11 = +[_CDLogging dataCollectionChannel];
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
              [(_CDEventStreamsRegister *)(uint64_t)v17 getEventHandlerDictForStreams];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v5);
    }

    v1 = (id *)[v2 copy];
  }
  return v1;
}

- (void).cxx_destruct
{
}

- (void)getEventHandlerDictForStreams
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_14_1(a1, a2), "name");
  *id v3 = 138412290;
  *id v2 = v4;
  OUTLINED_FUNCTION_6_5(&dword_18ECEB000, v5, v6, "Event handler for %@ not defined in getEventHandler method");
}

@end