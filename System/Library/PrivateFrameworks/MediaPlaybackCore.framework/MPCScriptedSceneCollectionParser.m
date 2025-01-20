@interface MPCScriptedSceneCollectionParser
+ (id)_instructionsForSceneDictionaries:(id)a3;
+ (id)sceneCollectionForMetadataItems:(id)a3;
+ (id)sceneCollectionForScriptData:(id)a3;
@end

@implementation MPCScriptedSceneCollectionParser

+ (id)_instructionsForSceneDictionaries:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (_NSIsNSDictionary())
        {
          v11 = objc_alloc_init(MPCScene);
          v12 = objc_msgSend(v10, "objectForKeyedSubscript:", @"start_frame", (void)v16);
          if (_NSIsNSNumber()) {
            -[MPCScene setStartFrame:](v11, "setStartFrame:", [v12 integerValue]);
          }
          v13 = [v10 objectForKeyedSubscript:@"end_frame"];
          if (_NSIsNSNumber()) {
            -[MPCScene setEndFrame:](v11, "setEndFrame:", [v13 integerValue]);
          }
          v14 = [v10 objectForKeyedSubscript:@"iterations"];
          if (_NSIsNSNumber()) {
            -[MPCScene setIterations:](v11, "setIterations:", [v14 integerValue]);
          }
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)sceneCollectionForScriptData:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v34 = 0;
  id v5 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v34];
  id v6 = v34;
  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v37 = v6;
      __int16 v38 = 2114;
      id v39 = v4;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "Error serializing JSONObject with scriptData. error=%{public}@ scriptData=%{public}@", buf, 0x16u);
    }
  }
  if (_NSIsNSDictionary())
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"motion-timeline"];
    if (_NSIsNSDictionary())
    {
      v9 = [v8 objectForKeyedSubscript:@"versions"];
      if (_NSIsNSArray())
      {
        id v24 = a1;
        v25 = v9;
        v26 = v8;
        id v27 = v6;
        v28 = v5;
        id v29 = v4;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v31;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v31 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              if (_NSIsNSDictionary())
              {
                long long v16 = [v15 objectForKeyedSubscript:@"version"];
                if (_NSIsNSString() && [v16 isEqual:@"1.0"])
                {
                  long long v17 = [v15 objectForKeyedSubscript:@"fps"];
                  if (_NSIsNSNumber())
                  {
                    [v17 doubleValue];
                    if (v18 > 0.0)
                    {
                      long long v19 = [v15 objectForKeyedSubscript:@"scenes"];
                      if (_NSIsNSArray())
                      {
                        v23 = [v24 _instructionsForSceneDictionaries:v19];
                        uint64_t v21 = objc_alloc_init(MPCSceneCollection);
                        [(MPCSceneCollection *)v21 setVersion:v16];
                        [v17 doubleValue];
                        -[MPCSceneCollection setFrameRate:](v21, "setFrameRate:");
                        [(MPCSceneCollection *)v21 setScenes:v23];

                        id v5 = v28;
                        id v4 = v29;
                        v20 = v26;
                        id v6 = v27;
                        goto LABEL_30;
                      }
                    }
                  }
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        id v5 = v28;
        id v4 = v29;
        uint64_t v8 = v26;
        id v6 = v27;
        v9 = v25;
      }
    }
  }
  v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v37 = v5;
    _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_ERROR, "MPCScriptedSceneCollectionParser: sceneCollectionForScriptData: Well-formatted V1 scene script not found [returning nil] JSONObject=%{public}@", buf, 0xCu);
  }
  uint64_t v21 = 0;
LABEL_30:

  return v21;
}

+ (id)sceneCollectionForMetadataItems:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "key", (void)v17);
        int v11 = [v10 isEqual:@"com.apple.music.scenes"];

        if (v11)
        {
          uint64_t v12 = [v9 value];
          if (_NSIsNSString())
          {
            v15 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v12 options:0];
            v14 = [a1 sceneCollectionForScriptData:v15];

            uint64_t v13 = v4;
            goto LABEL_15;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Video");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v22 = @"com.apple.music.scenes";
    __int16 v23 = 2114;
    id v24 = v4;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_ERROR, "MPCScriptedSceneCollectionParser: sceneCollectionForMetadataItems: Well-defined string script data corresponding to %{public}@ not found [returning nil] metadataItems=%{public}@", buf, 0x16u);
  }
  v14 = 0;
LABEL_15:

  return v14;
}

@end