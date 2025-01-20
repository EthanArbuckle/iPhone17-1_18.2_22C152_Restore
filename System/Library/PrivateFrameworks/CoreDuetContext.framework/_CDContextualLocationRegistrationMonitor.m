@interface _CDContextualLocationRegistrationMonitor
- (NSMapTable)effectiveBundleIDs;
- (NSMutableDictionary)effectiveBundleIDRegionInfos;
- (NSMutableDictionary)managers;
- (NSMutableSet)registrations;
- (OS_dispatch_queue)queue;
- (_CDContextualLocationRegistrationMonitor)init;
- (id)regionInfosForRegistration:(id)a3;
- (void)addRegistration:(id)a3;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)removeRegistration:(id)a3;
@end

@implementation _CDContextualLocationRegistrationMonitor

- (_CDContextualLocationRegistrationMonitor)init
{
  v15.receiver = self;
  v15.super_class = (Class)_CDContextualLocationRegistrationMonitor;
  v2 = [(_CDContextualLocationRegistrationMonitor *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ContextStore.location-monitor-queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    registrations = v2->_registrations;
    v2->_registrations = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    managers = v2->_managers;
    v2->_managers = v8;

    uint64_t v10 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    effectiveBundleIDs = v2->_effectiveBundleIDs;
    v2->_effectiveBundleIDs = (NSMapTable *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    effectiveBundleIDRegionInfos = v2->_effectiveBundleIDRegionInfos;
    v2->_effectiveBundleIDRegionInfos = v12;
  }
  return v2;
}

- (void)addRegistration:(id)a3
{
  id v4 = a3;
  v5 = [(_CDContextualLocationRegistrationMonitor *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60___CDContextualLocationRegistrationMonitor_addRegistration___block_invoke;
  v7[3] = &unk_1E56091D8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)removeRegistration:(id)a3
{
  id v4 = a3;
  v5 = [(_CDContextualLocationRegistrationMonitor *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63___CDContextualLocationRegistrationMonitor_removeRegistration___block_invoke;
  v7[3] = &unk_1E56091D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(_CDContextualLocationRegistrationMonitor *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(_CDContextualLocationRegistrationMonitor *)self effectiveBundleIDs];
  v9 = [v8 objectForKey:v6];

  uint64_t v10 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = [NSNumber numberWithInt:v4];
    int v12 = 138412546;
    v13 = v9;
    __int16 v14 = 2112;
    objc_super v15 = v11;
    _os_log_impl(&dword_18EC9B000, v10, OS_LOG_TYPE_INFO, "Authorization for %@ changed to %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_CDContextualLocationRegistrationMonitor *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [(_CDContextualLocationRegistrationMonitor *)self effectiveBundleIDs];
  uint64_t v10 = [v9 objectForKey:v7];

  v11 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_CDContextualLocationRegistrationMonitor locationManager:didStartMonitoringForRegion:](v6, (uint64_t)v10, v11);
  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [(_CDContextualLocationRegistrationMonitor *)self queue];
  dispatch_assert_queue_V2(v11);

  int v12 = [(_CDContextualLocationRegistrationMonitor *)self effectiveBundleIDs];
  v13 = [v12 objectForKey:v10];

  __int16 v14 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    objc_super v15 = [v8 identifier];
    int v16 = 138412802;
    v17 = v15;
    __int16 v18 = 2112;
    v19 = v13;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_error_impl(&dword_18EC9B000, v14, OS_LOG_TYPE_ERROR, "Failed monitoring region %@ for %@: %@", (uint8_t *)&v16, 0x20u);
  }
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(_CDContextualLocationRegistrationMonitor *)self queue];
  dispatch_assert_queue_V2(v10);

  v11 = [MEMORY[0x1E4F1C9C8] date];
  int v12 = [v9 identifier];
  if (v12)
  {
    v75 = v12;
    v76 = v11;
    v74 = v9;
    id v77 = v8;
    v13 = _os_activity_create(&dword_18EC9B000, "Duet: ContextStore Region State Change", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    *(void *)state = 0;
    *(void *)&state[8] = 0;
    os_activity_scope_enter(v13, (os_activity_scope_state_t)state);
    os_activity_scope_leave((os_activity_scope_state_t)state);

    v81 = self;
    id v82 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    __int16 v14 = [(_CDContextualLocationRegistrationMonitor *)self registrations];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v91 objects:v106 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v92 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          __int16 v20 = [(_CDContextualLocationRegistrationMonitor *)v81 regionInfosForRegistration:v19];
          if ([v20 count])
          {
            id v21 = [v19 identifier];
            [v82 setObject:v20 forKeyedSubscript:v21];
          }
          else
          {
            id v21 = objc_alloc_init(MEMORY[0x1E4F1C978]);
            uint64_t v22 = [v19 identifier];
            [v82 setObject:v21 forKeyedSubscript:v22];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v91 objects:v106 count:16];
      }
      while (v16);
    }

    v80 = (void *)[v82 copy];
    v23 = [(_CDContextualLocationRegistrationMonitor *)v81 effectiveBundleIDs];
    uint64_t v24 = [v23 objectForKey:v77];

    v25 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = [v74 identifier];
      v27 = [NSNumber numberWithInteger:a4];
      *(_DWORD *)state = 138412802;
      *(void *)&state[4] = v26;
      *(_WORD *)&state[12] = 2112;
      *(void *)&state[14] = v27;
      __int16 v98 = 2112;
      uint64_t v99 = v24;
      _os_log_impl(&dword_18EC9B000, v25, OS_LOG_TYPE_INFO, "Region state for region %@ changed to %@ on behalf of %@", state, 0x20u);
    }
    v28 = [(_CDContextualLocationRegistrationMonitor *)v81 effectiveBundleIDRegionInfos];
    v29 = [v28 objectForKeyedSubscript:v24];
    v30 = (void *)[v29 mutableCopy];

    if (!v30) {
      v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    }
    v31 = +[_CDContextQueries regionIdentifierKey];
    v104[0] = v31;
    v105[0] = v75;
    v32 = +[_CDContextQueries regionStateKey];
    v104[1] = v32;
    v33 = [NSNumber numberWithInteger:a4];
    v105[1] = v33;
    v34 = +[_CDContextQueries changeDateKey];
    v104[2] = v34;
    v105[2] = v76;
    uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:3];

    v71 = (void *)v35;
    [v30 setObject:v35 forKeyedSubscript:v75];
    uint64_t v36 = [v30 copy];
    v37 = [(_CDContextualLocationRegistrationMonitor *)v81 effectiveBundleIDRegionInfos];
    v70 = (void *)v36;
    [v37 setObject:v36 forKeyedSubscript:v24];

    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v39 = [(_CDContextualLocationRegistrationMonitor *)v81 registrations];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v87 objects:v103 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v88 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = *(void **)(*((void *)&v87 + 1) + 8 * j);
          v45 = [(_CDContextualLocationRegistrationMonitor *)v81 regionInfosForRegistration:v44];
          if ([v45 count])
          {
            v46 = [v44 identifier];
            [v38 setObject:v45 forKeyedSubscript:v46];
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v87 objects:v103 count:16];
      }
      while (v41);
    }
    v72 = v30;
    v73 = (void *)v24;

    v69 = v38;
    v47 = (void *)[v38 copy];
    id v79 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v48 = v47;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v83 objects:v102 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v84;
      uint64_t v52 = MEMORY[0x1E4F1CBF0];
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v84 != v51) {
            objc_enumerationMutation(v48);
          }
          uint64_t v54 = *(void *)(*((void *)&v83 + 1) + 8 * k);
          id v55 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v56 = [v80 objectForKeyedSubscript:v54];
          v57 = (void *)v56;
          if (v56) {
            uint64_t v58 = v56;
          }
          else {
            uint64_t v58 = v52;
          }
          v59 = (void *)[v55 initWithArray:v58];

          id v60 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v61 = [v48 objectForKeyedSubscript:v54];
          v62 = (void *)v61;
          if (v61) {
            uint64_t v63 = v61;
          }
          else {
            uint64_t v63 = v52;
          }
          v64 = (void *)[v60 initWithArray:v63];

          if (([v59 isEqualToSet:v64] & 1) == 0)
          {
            v65 = [MEMORY[0x1E4F5B418] contextChannel];
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
            {
              v78 = +[_CDContextQueries keyPathForCircularLocationRegions];
              *(_DWORD *)state = 138413058;
              *(void *)&state[4] = v54;
              *(_WORD *)&state[12] = 2112;
              *(void *)&state[14] = v78;
              __int16 v98 = 2112;
              uint64_t v99 = (uint64_t)v59;
              __int16 v100 = 2112;
              v101 = v64;
              _os_log_debug_impl(&dword_18EC9B000, v65, OS_LOG_TYPE_DEBUG, "Registration %@ had %@ values change from %@ to %@", state, 0x2Au);
            }
            [v79 addObject:v54];
          }
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v83 objects:v102 count:16];
      }
      while (v50);
    }

    v11 = v76;
    if ([v79 count])
    {
      v66 = [v80 dictionaryWithValuesForKeys:v79];
      v67 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v95[0] = @"previousRegistrationRegionInfos";
      v95[1] = @"regionStateChangeDate";
      v96[0] = v66;
      v96[1] = v76;
      v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:2];
      [v67 postNotificationName:@"_CDCircularRegionsForRegistrationDidChangeNotification" object:v81 userInfo:v68];
    }
    id v8 = v77;
    id v9 = v74;
    int v12 = v75;
  }
}

- (id)regionInfosForRegistration:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_CDContextualLocationRegistrationMonitor *)self effectiveBundleIDRegionInfos];
  id v6 = (void *)[v5 copy];

  id v7 = [v4 locationManagerEffectiveBundleID];
  id v8 = [v6 objectForKeyedSubscript:v7];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = [v4 predicate];
  v11 = [v10 circularLocationRegions];
  int v12 = NSStringFromSelector(sel_identifier);
  v13 = [v11 valueForKey:v12];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = objc_msgSend(v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
        if (v19) {
          [v9 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  __int16 v20 = (void *)[v9 copy];
  return v20;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableSet)registrations
{
  return self->_registrations;
}

- (NSMutableDictionary)managers
{
  return self->_managers;
}

- (NSMapTable)effectiveBundleIDs
{
  return self->_effectiveBundleIDs;
}

- (NSMutableDictionary)effectiveBundleIDRegionInfos
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveBundleIDRegionInfos, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIDs, 0);
  objc_storeStrong((id *)&self->_managers, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)locationManager:(NSObject *)a3 didStartMonitoringForRegion:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a1 identifier];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_18EC9B000, a3, OS_LOG_TYPE_DEBUG, "Start monitoring for region %@ on behalf of %@", (uint8_t *)&v6, 0x16u);
}

@end