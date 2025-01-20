@interface BMKnowledgeContextMapping
+ (id)contextKeypathForQuery:(id)a3;
+ (id)liveEventsForQuery:(id)a3 context:(id)a4;
@end

@implementation BMKnowledgeContextMapping

+ (id)contextKeypathForQuery:(id)a3
{
  id v3 = a3;
  v4 = [v3 eventStreams];
  uint64_t v5 = [v4 count];

  if (v5 != 1)
  {
    v9 = 0;
    goto LABEL_9;
  }
  v6 = [v3 eventStreams];
  v7 = [v6 objectAtIndexedSubscript:0];

  v8 = [get_DKSystemEventStreamsClass() appInFocusStream];
  if ([v8 isEqual:v7])
  {

LABEL_6:
    uint64_t v12 = [get_CDContextQueriesClass() keyPathForAppUsageDataDictionaries];
    goto LABEL_7;
  }
  v10 = [get_DKSystemEventStreamsClass() appUsageStream];
  int v11 = [v10 isEqual:v7];

  if (v11) {
    goto LABEL_6;
  }
  v14 = [get_DKSystemEventStreamsClass() appWebUsageStream];
  int v15 = [v14 isEqual:v7];

  if (!v15)
  {
    v9 = 0;
    goto LABEL_8;
  }
  uint64_t v12 = [get_CDContextQueriesClass() keyPathForAppWebUsageDataDictionaries];
LABEL_7:
  v9 = (void *)v12;
LABEL_8:

LABEL_9:

  return v9;
}

+ (id)liveEventsForQuery:(id)a3 context:(id)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v48 = a4;
  v49 = v6;
  v50 = [a1 contextKeypathForQuery:v6];
  if (!v50
    || ([v6 eventStreams],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8 != 1))
  {
    id v51 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_59;
  }
  v9 = [v6 eventStreams];
  v55 = [v9 objectAtIndexedSubscript:0];

  v10 = [get_CDContextQueriesClass() keyPathForAppUsageDataDictionaries];
  int v11 = [v50 isEqual:v10];

  if (v11)
  {
    uint64_t v12 = [v48 objectForKeyedSubscript:v50];
    id v51 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id obj = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v71 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          v17 = [get_CDContextQueriesClass() appUsageBundleID];
          v18 = [v16 objectForKeyedSubscript:v17];

          v19 = [get_CDContextQueriesClass() appUsageStartDate];
          v20 = [v16 objectForKeyedSubscript:v19];

          if (v18 && v20)
          {
            v21 = [MEMORY[0x1E4F1C9C8] date];
            v22 = [get_DKEventClass() eventWithStream:v55 startDate:v20 endDate:v21 identifierStringValue:v18 metadata:0];
            if (v22)
            {
              [v51 addObject:v22];
            }
            else
            {
              v24 = __biome_log_for_category();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                +[BMKnowledgeContextMapping liveEventsForQuery:context:](v74, &v74[1], v24);
              }
            }
          }
          else
          {
            v23 = @"startDate";
            if (!v20) {
              v23 = @"all";
            }
            if (v18) {
              v23 = @"bundleId";
            }
            v21 = v23;
            v22 = __biome_log_for_category();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v21;
              _os_log_error_impl(&dword_18E67D000, v22, OS_LOG_TYPE_ERROR, "Missing %@ information to construct an event from context data", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
      }
      while (v13);
    }
  }
  else
  {
    v25 = [get_CDContextQueriesClass() keyPathForAppWebUsageDataDictionaries];
    int v26 = [v50 isEqual:v25];

    if (!v26)
    {
      id v51 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_58;
    }
    v27 = [v48 objectForKeyedSubscript:v50];
    id v51 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id obj = v27;
    uint64_t v53 = [obj countByEnumeratingWithState:&v66 objects:v80 count:16];
    if (v53)
    {
      uint64_t v52 = *(void *)v67;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v67 != v52)
          {
            uint64_t v29 = v28;
            objc_enumerationMutation(obj);
            uint64_t v28 = v29;
          }
          uint64_t v57 = v28;
          v30 = *(void **)(*((void *)&v66 + 1) + 8 * v28);
          v63 = [get_CDContextQueriesClass() appWebUsageWebDomain];
          v62 = [get_CDContextQueriesClass() appWebUsageStartDate];
          v61 = [get_CDContextQueriesClass() appWebUsageBundleID];
          v60 = [get_CDContextQueriesClass() appWebUsageType];
          v59 = [get_CDContextQueriesClass() appWebUsageWepageURL];
          v31 = [v30 objectForKeyedSubscript:v63];
          v32 = [v30 objectForKeyedSubscript:v62];
          v58 = [v30 objectForKeyedSubscript:v61];
          v33 = [v30 objectForKeyedSubscript:v60];
          uint64_t v34 = [v30 objectForKeyedSubscript:v59];
          v35 = (void *)v34;
          if (v34 && v31 && v33 && v32)
          {
            *(void *)v74 = 0;
            v75 = v74;
            uint64_t v76 = 0x2050000000;
            v36 = (void *)get_DKBundleIdentifierClass_softClass;
            uint64_t v77 = get_DKBundleIdentifierClass_softClass;
            if (!get_DKBundleIdentifierClass_softClass)
            {
              *(void *)&long long buf = MEMORY[0x1E4F143A8];
              *((void *)&buf + 1) = 3221225472;
              v83 = __get_DKBundleIdentifierClass_block_invoke;
              v84 = &unk_1E55D6DA8;
              v85 = v74;
              __get_DKBundleIdentifierClass_block_invoke((uint64_t)&buf);
              v36 = (void *)*((void *)v75 + 3);
            }
            id v37 = v36;
            _Block_object_dispose(v74, 8);
            v38 = [v37 withBundle:v58];
            v39 = [get_DKDigitalHealthMetadataKeyClass() webpageURL];
            v54 = [get_DKDigitalHealthMetadataKeyClass() webDomain];
            v40 = [get_DKDigitalHealthMetadataKeyClass() usageType];
            v78[0] = v39;
            v78[1] = v54;
            v79[0] = v35;
            v79[1] = v31;
            v78[2] = v40;
            v79[2] = v33;
            v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:3];
            id DKEventClass = get_DKEventClass();
            v43 = [MEMORY[0x1E4F1C9C8] date];
            v44 = [DKEventClass eventWithStream:v55 startDate:v32 endDate:v43 value:v38 metadata:v41];

            if (v44)
            {
              [v51 addObject:v44];
            }
            else
            {
              v46 = __biome_log_for_category();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
                +[BMKnowledgeContextMapping liveEventsForQuery:context:](&v64, v65, v46);
              }
            }
          }
          else
          {
            v45 = @"startDate";
            if (!v32) {
              v45 = @"all";
            }
            if (v33) {
              v45 = @"usageType";
            }
            if (v31) {
              v45 = @"webDomain";
            }
            if (v34) {
              v45 = @"url";
            }
            v38 = v45;
            v39 = __biome_log_for_category();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v38;
              _os_log_error_impl(&dword_18E67D000, v39, OS_LOG_TYPE_ERROR, "Missing %@ information to construct an event from context data", (uint8_t *)&buf, 0xCu);
            }
          }

          uint64_t v28 = v57 + 1;
        }
        while (v53 != v57 + 1);
        uint64_t v53 = [obj countByEnumeratingWithState:&v66 objects:v80 count:16];
      }
      while (v53);
    }
  }

LABEL_58:
LABEL_59:

  return v51;
}

+ (void)liveEventsForQuery:(os_log_t)log context:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Failed to create event from context data", buf, 2u);
}

@end