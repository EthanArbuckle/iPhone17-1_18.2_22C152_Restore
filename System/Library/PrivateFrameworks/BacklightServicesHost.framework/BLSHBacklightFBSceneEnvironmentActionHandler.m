@interface BLSHBacklightFBSceneEnvironmentActionHandler
- (id)respondToActions:(id)a3 forFBScene:(id)a4;
@end

@implementation BLSHBacklightFBSceneEnvironmentActionHandler

- (id)respondToActions:(id)a3 forFBScene:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[v5 mutableCopy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        v14 = bls_scenes_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v13;
          _os_log_debug_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_DEBUG, "respondToActions: action: %@", buf, 0xCu);
        }

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v13;
          v16 = bls_scenes_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v15;
            _os_log_debug_impl(&dword_21FCFC000, v16, OS_LOG_TYPE_DEBUG, "respondToActions: matched action: %@", buf, 0xCu);
          }

          v17 = [v6 backlightSceneHostEnvironment];
          v18 = [v15 reason];
          [v17 clientDidRequestInvalidationForReason:v18];

          [v7 removeObject:v15];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v10);
  }

  v19 = (void *)[v7 copy];

  return v19;
}

@end