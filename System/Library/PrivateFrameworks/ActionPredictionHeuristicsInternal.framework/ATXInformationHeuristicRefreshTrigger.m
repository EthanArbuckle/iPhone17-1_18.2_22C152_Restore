@interface ATXInformationHeuristicRefreshTrigger
+ (BOOL)supportsSecureCoding;
- (ATXInformationHeuristicRefreshTrigger)init;
- (ATXInformationHeuristicRefreshTrigger)initWithCoder:(id)a3;
- (ATXInformationHeuristicRefreshTriggerDelegate)delegate;
- (NSSet)registeredHeuristics;
- (id)_safeDecodeObjectOfClass:(Class)a3 forKey:(id)a4 withCoder:(id)a5 nonNull:(BOOL)a6;
- (id)_safeDecodeObjectOfClasses:(id)a3 forKey:(id)a4 withCoder:(id)a5 nonNull:(BOOL)a6;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startTriggeringRefreshForHeuristicIfNotAlready:(id)a3;
- (void)stopTriggeringRefreshForAllHeuristics;
- (void)stopTriggeringRefreshForHeuristicIfAlready:(id)a3;
@end

@implementation ATXInformationHeuristicRefreshTrigger

- (ATXInformationHeuristicRefreshTrigger)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXInformationHeuristicRefreshTrigger;
  v2 = [(ATXInformationHeuristicRefreshTrigger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    registeredHeuristics = v2->_registeredHeuristics;
    v2->_registeredHeuristics = (NSMutableSet *)v3;
  }
  return v2;
}

- (void)dealloc
{
  v2 = self;
  objc_sync_enter(v2);
  [(ATXInformationHeuristicRefreshTrigger *)v2 _stop];
  objc_sync_exit(v2);

  v3.receiver = v2;
  v3.super_class = (Class)ATXInformationHeuristicRefreshTrigger;
  [(ATXInformationHeuristicRefreshTrigger *)&v3 dealloc];
}

- (NSSet)registeredHeuristics
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = (void *)[(NSMutableSet *)v2->_registeredHeuristics copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)startTriggeringRefreshForHeuristicIfNotAlready:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSMutableSet *)v4->_registeredHeuristics addObject:v5];
  [(ATXInformationHeuristicRefreshTrigger *)v4 _start];
  objc_sync_exit(v4);
}

- (void)stopTriggeringRefreshForHeuristicIfAlready:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSMutableSet *)v4->_registeredHeuristics removeObject:v5];
  if (![(NSMutableSet *)v4->_registeredHeuristics count]) {
    [(ATXInformationHeuristicRefreshTrigger *)v4 _stop];
  }
  objc_sync_exit(v4);
}

- (void)stopTriggeringRefreshForAllHeuristics
{
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableSet *)obj->_registeredHeuristics removeAllObjects];
  [(ATXInformationHeuristicRefreshTrigger *)obj _stop];
  objc_sync_exit(obj);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATXInformationHeuristicRefreshTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXInformationHeuristicRefreshTrigger;
  id v5 = [(ATXInformationHeuristicRefreshTrigger *)&v14 init];
  if (!v5) {
    goto LABEL_6;
  }
  objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [(ATXInformationHeuristicRefreshTrigger *)v5 _safeDecodeObjectOfClasses:v8 forKey:@"registeredHeuristics" withCoder:v4 nonNull:1];

  if (v9)
  {
    v10 = [v4 error];

    if (!v10)
    {
      registeredHeuristics = v5->_registeredHeuristics;
      v5->_registeredHeuristics = v9;

LABEL_6:
      v11 = v5;
      goto LABEL_7;
    }
  }

  v11 = 0;
LABEL_7:

  return v11;
}

- (id)_safeDecodeObjectOfClass:(Class)a3 forKey:(id)a4 withCoder:(id)a5 nonNull:(BOOL)a6
{
  BOOL v6 = a6;
  v31[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 decodeObjectOfClass:a3 forKey:v9];
  if (v11)
  {
    if (objc_opt_isKindOfClass())
    {
LABEL_3:
      id v12 = v11;
      goto LABEL_10;
    }
    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    v16 = [NSString stringWithFormat:@"key \"%@\" maps to unexpected class", v9, *MEMORY[0x1E4F28568]];
    v27 = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v18 = (void *)[v15 initWithDomain:@"ATXInformationHeuristicRefreshTrigger" code:-1 userInfo:v17];
    [v10 failWithError:v18];

    objc_super v14 = __atxlog_handle_gi();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:]();
    }
  }
  else
  {
    v13 = [v10 error];

    if (v13)
    {
      objc_super v14 = __atxlog_handle_gi();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:]();
      }
    }
    else
    {
      if (!v6) {
        goto LABEL_3;
      }
      if ([v10 containsValueForKey:v9])
      {
        uint64_t v30 = *MEMORY[0x1E4F28568];
        v20 = [NSString stringWithFormat:@"archive contains illegal nil value for key \"%@\"", v9];
        v31[0] = v20;
        v21 = (void *)MEMORY[0x1E4F1C9E8];
        v22 = (void **)v31;
        v23 = &v30;
      }
      else
      {
        uint64_t v28 = *MEMORY[0x1E4F28568];
        v20 = [NSString stringWithFormat:@"key \"%@\" not present", v9];
        v29 = v20;
        v21 = (void *)MEMORY[0x1E4F1C9E8];
        v22 = &v29;
        v23 = &v28;
      }
      v24 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];

      objc_super v14 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ATXInformationHeuristicRefreshTrigger" code:-1 userInfo:v24];
      [v10 failWithError:v14];
      v25 = __atxlog_handle_gi();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:]();
      }
    }
  }

  id v12 = 0;
LABEL_10:

  return v12;
}

- (id)_safeDecodeObjectOfClasses:(id)a3 forKey:(id)a4 withCoder:(id)a5 nonNull:(BOOL)a6
{
  BOOL v6 = a6;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 decodeObjectOfClasses:v9 forKey:v10];
  if (v12)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          if (objc_opt_isKindOfClass())
          {
            id v22 = v12;
            goto LABEL_25;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v19 = [NSString stringWithFormat:@"key \"%@\" maps to unexpected class", v10];
    v36 = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v21 = (void *)[v18 initWithDomain:@"ATXInformationHeuristicRefreshTrigger" code:-1 userInfo:v20];
    [v11 failWithError:v21];

    v13 = __atxlog_handle_gi();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:]();
    }
  }
  else
  {
    v23 = [v11 error];

    if (v23)
    {
      v13 = __atxlog_handle_gi();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:]();
      }
    }
    else
    {
      if (!v6)
      {
        id v22 = 0;
        goto LABEL_26;
      }
      if ([v11 containsValueForKey:v10])
      {
        uint64_t v40 = *MEMORY[0x1E4F28568];
        v24 = [NSString stringWithFormat:@"archive contains illegal nil value for key \"%@\"", v10];
        v41[0] = v24;
        v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = (void **)v41;
        v27 = &v40;
      }
      else
      {
        uint64_t v38 = *MEMORY[0x1E4F28568];
        v24 = [NSString stringWithFormat:@"key \"%@\" not present", v10];
        v39 = v24;
        v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = &v39;
        v27 = &v38;
      }
      uint64_t v28 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];

      v13 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ATXInformationHeuristicRefreshTrigger" code:-1 userInfo:v28];
      [v11 failWithError:v13];
      v29 = __atxlog_handle_gi();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:]();
      }
    }
  }
  id v22 = 0;
LABEL_25:

LABEL_26:

  return v22;
}

- (ATXInformationHeuristicRefreshTriggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXInformationHeuristicRefreshTriggerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_registeredHeuristics, 0);
}

- (void)_safeDecodeObjectOfClass:forKey:withCoder:nonNull:.cold.1()
{
  OUTLINED_FUNCTION_3();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(v0, v1), "error");
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1D0F43000, v3, v4, "ATXInformationHeuristicRefreshTrigger: error decoding %@ - %@", v5, v6, v7, v8, v9);
}

@end