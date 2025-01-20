@interface BMCoreDuetDiscoverabilitySignalsSource
- (void)sendEvent:(id)a3;
@end

@implementation BMCoreDuetDiscoverabilitySignalsSource

- (void)sendEvent:(id)a3
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(BMCoreDuetDiscoverabilitySignalsSource *)self sendEvent:v5];
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v4;
    v50 = [v6 identifier];
    v49 = [v6 bundleID];
    v47 = [v6 context];
    v7 = [v6 userInfo];
    v8 = (void *)MGCopyAnswer();
    if (v8)
    {
      v48 = [@"iOS-" stringByAppendingString:v8];
    }
    else
    {
      v48 = 0;
    }

    if (v50 && v49 && v48)
    {
      v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:CFAbsoluteTimeGetCurrent()];
      id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
      v66[0] = v48;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
      v12 = [get_DKDiscoverabilitySignalsMetadataKeyClass() osBuild];
      v65 = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
      v46 = (void *)[v10 initWithObjects:v11 forKeys:v13];

      if (v47)
      {
        v14 = [get_DKDiscoverabilitySignalsMetadataKeyClass() context];
        [v46 setObject:v47 forKeyedSubscript:v14];
      }
      if (v7)
      {
        v15 = [get_DKDiscoverabilitySignalsMetadataKeyClass() userInfo];
        [v46 setObject:v7 forKeyedSubscript:v15];
      }
      uint64_t v59 = 0;
      v60 = &v59;
      uint64_t v61 = 0x2050000000;
      v16 = (void *)get_DKSourceClass_softClass;
      uint64_t v62 = get_DKSourceClass_softClass;
      if (!get_DKSourceClass_softClass)
      {
        uint64_t v54 = MEMORY[0x1E4F143A8];
        uint64_t v55 = 3221225472;
        v56 = __get_DKSourceClass_block_invoke;
        v57 = &unk_1E55D6DA8;
        v58 = &v59;
        __get_DKSourceClass_block_invoke((uint64_t)&v54);
        v16 = (void *)v60[3];
      }
      v17 = v16;
      _Block_object_dispose(&v59, 8);
      v45 = (void *)[[v17 alloc] initWithIdentifier:0 bundleIdentifier:v49 itemIdentifier:0 groupIdentifier:0 deviceIdentifier:0 userIdentifier:0];
      uint64_t v59 = 0;
      v60 = &v59;
      uint64_t v61 = 0x2050000000;
      v18 = (void *)get_DKEventClass_softClass_2;
      uint64_t v62 = get_DKEventClass_softClass_2;
      if (!get_DKEventClass_softClass_2)
      {
        uint64_t v54 = MEMORY[0x1E4F143A8];
        uint64_t v55 = 3221225472;
        v56 = __get_DKEventClass_block_invoke_2;
        v57 = &unk_1E55D6DA8;
        v58 = &v59;
        __get_DKEventClass_block_invoke_2((uint64_t)&v54);
        v18 = (void *)v60[3];
      }
      id v19 = v18;
      _Block_object_dispose(&v59, 8);
      uint64_t v59 = 0;
      v60 = &v59;
      uint64_t v61 = 0x2050000000;
      v20 = (void *)get_DKSystemEventStreamsClass_softClass_1;
      uint64_t v62 = get_DKSystemEventStreamsClass_softClass_1;
      if (!get_DKSystemEventStreamsClass_softClass_1)
      {
        uint64_t v54 = MEMORY[0x1E4F143A8];
        uint64_t v55 = 3221225472;
        v56 = __get_DKSystemEventStreamsClass_block_invoke_1;
        v57 = &unk_1E55D6DA8;
        v58 = &v59;
        __get_DKSystemEventStreamsClass_block_invoke_1((uint64_t)&v54);
        v20 = (void *)v60[3];
      }
      id v21 = v20;
      _Block_object_dispose(&v59, 8);
      v22 = [v21 discoverabilitySignalsStream];
      v23 = (void *)[v46 copy];
      v44 = [v19 eventWithStream:v22 source:v45 startDate:v9 endDate:v9 identifierStringValue:v50 metadata:v23];

      if (v7)
      {
        id v53 = 0;
        v24 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:&v53];
        id v25 = v53;
        if (v25)
        {
          v26 = __biome_log_for_category();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            -[BMCoreDuetDiscoverabilitySignalsSource sendEvent:]();
          }
        }
      }
      else
      {
        v24 = 0;
      }
      uint64_t v59 = 0;
      v60 = &v59;
      uint64_t v61 = 0x2050000000;
      v27 = (void *)getBMDiscoverabilitySignalsClass_softClass;
      uint64_t v62 = getBMDiscoverabilitySignalsClass_softClass;
      if (!getBMDiscoverabilitySignalsClass_softClass)
      {
        uint64_t v54 = MEMORY[0x1E4F143A8];
        uint64_t v55 = 3221225472;
        v56 = __getBMDiscoverabilitySignalsClass_block_invoke;
        v57 = &unk_1E55D6DA8;
        v58 = &v59;
        __getBMDiscoverabilitySignalsClass_block_invoke((uint64_t)&v54);
        v27 = (void *)v60[3];
      }
      id v28 = v27;
      _Block_object_dispose(&v59, 8);
      v29 = (void *)[v28 alloc];
      v30 = [v6 identifier];
      v31 = [v6 context];
      v32 = (void *)[v29 initWithContentIdentifier:v30 context:v31 osBuild:v48 userInfo:v24];

      v33 = BMRootLibraryBridge();
      v34 = [v33 streamWithIdentifier:@"Discoverability.Signals" error:0];

      v35 = [v34 source];
      [v35 sendEvent:v32];

      id v36 = objc_alloc(MEMORY[0x1E4F1CA60]);
      v64[0] = v50;
      v64[1] = v49;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
      v38 = (void *)[v36 initWithObjects:v37 forKeys:&unk_1EDDD7708];

      if (v47) {
        [v38 setObject:v47 forKeyedSubscript:@"context"];
      }
      if (v7) {
        [v38 setObject:v7 forKeyedSubscript:@"userInfo"];
      }
      uint64_t v59 = 0;
      v60 = &v59;
      uint64_t v61 = 0x2050000000;
      v39 = (void *)get_DKKnowledgeStoreClass_softClass_0;
      uint64_t v62 = get_DKKnowledgeStoreClass_softClass_0;
      if (!get_DKKnowledgeStoreClass_softClass_0)
      {
        uint64_t v54 = MEMORY[0x1E4F143A8];
        uint64_t v55 = 3221225472;
        v56 = __get_DKKnowledgeStoreClass_block_invoke_0;
        v57 = &unk_1E55D6DA8;
        v58 = &v59;
        __get_DKKnowledgeStoreClass_block_invoke_0((uint64_t)&v54);
        v39 = (void *)v60[3];
      }
      id v40 = v39;
      _Block_object_dispose(&v59, 8);
      v41 = [v40 userKnowledgeStore];
      v63 = v44;
      v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __52__BMCoreDuetDiscoverabilitySignalsSource_sendEvent___block_invoke;
      v51[3] = &unk_1E55D7890;
      id v52 = v38;
      id v43 = v38;
      [v41 saveObjects:v42 responseQueue:0 withCompletion:v51];
    }
    else
    {
      v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[BMCoreDuetDiscoverabilitySignalsSource sendEvent:]();
      }
    }
  }
  else
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMCoreDuetDiscoverabilitySignalsSource sendEvent:](v6);
    }
  }
}

void __52__BMCoreDuetDiscoverabilitySignalsSource_sendEvent___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v6 = (void *)get_CDContextualKeyPathClass_softClass;
    uint64_t v21 = get_CDContextualKeyPathClass_softClass;
    if (!get_CDContextualKeyPathClass_softClass)
    {
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __get_CDContextualKeyPathClass_block_invoke;
      v16 = &unk_1E55D6DA8;
      v17 = &v18;
      __get_CDContextualKeyPathClass_block_invoke((uint64_t)&v13);
      v6 = (void *)v19[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v18, 8);
    v8 = [v7 ephemeralKeyPathWithKey:@"/discoverability/signals/dataDictionary"];
    v9 = (void *)[*(id *)(a1 + 32) copy];
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2050000000;
    id v10 = (void *)get_CDClientContextClass_softClass_0;
    uint64_t v21 = get_CDClientContextClass_softClass_0;
    if (!get_CDClientContextClass_softClass_0)
    {
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __get_CDClientContextClass_block_invoke_0;
      v16 = &unk_1E55D6DA8;
      v17 = &v18;
      __get_CDClientContextClass_block_invoke_0((uint64_t)&v13);
      id v10 = (void *)v19[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v18, 8);
    v12 = [v11 userContext];
    [v12 setObject:v9 forKeyedSubscript:v8];
  }
  else
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __52__BMCoreDuetDiscoverabilitySignalsSource_sendEvent___block_invoke_cold_1();
    }
  }
}

- (void)sendEvent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "Invalid event sent to source, missing property on discoverability signal event %@", v1, 0xCu);
}

- (void)sendEvent:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_18E67D000, v0, OS_LOG_TYPE_FAULT, "Encountered issue serializing userInfo to json %@", v1, 0xCu);
}

- (void)sendEvent:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Wrong event type sent to source expecting discoverability signal event", v1, 2u);
}

- (void)sendEvent:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 identifier];
  OUTLINED_FUNCTION_7();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_18E67D000, a3, OS_LOG_TYPE_DEBUG, "Event donation to %@ stream: %@", v6, 0x16u);
}

void __52__BMCoreDuetDiscoverabilitySignalsSource_sendEvent___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "Error persisting discoverability signal event to knowledge store %@", v1, 0xCu);
}

@end