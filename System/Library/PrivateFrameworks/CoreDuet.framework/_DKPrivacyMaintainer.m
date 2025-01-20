@interface _DKPrivacyMaintainer
+ (id)deletionPredicateForBundleID:(id)a3;
+ (unint64_t)deleteMalformedNotificationUsageEvents:(id)a3;
+ (void)maintainPrivacyWithKnowledgeStorage:(id)a3 installedApps:(id)a4 installedAppExtensions:(id)a5 deleteMaxCount:(unint64_t)a6 objectMaxCount:(unint64_t)a7 objectMaxLifespan:(double)a8 activity:(id)a9;
@end

@implementation _DKPrivacyMaintainer

+ (id)deletionPredicateForBundleID:(id)a3
{
  v44[8] = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  v39 = +[_DKSystemEventStreams appInFocusStream];
  v37 = [v39 name];
  v44[0] = v37;
  v35 = +[_DKSystemEventStreams appUsageStream];
  v34 = [v35 name];
  v44[1] = v34;
  v33 = +[_DKSystemEventStreams appClipUsageStream];
  v32 = [v33 name];
  v44[2] = v32;
  v31 = +[_DKSystemEventStreams appRelevantShortcutsStream];
  v3 = [v31 name];
  v44[3] = v3;
  v4 = +[_DKSystemEventStreams appActivityStream];
  v5 = [v4 name];
  v44[4] = v5;
  v6 = +[_DKSystemEventStreams appMediaUsageStream];
  v7 = [v6 name];
  v44[5] = v7;
  v8 = +[_DKSystemEventStreams appWebUsageStream];
  v9 = [v8 name];
  v44[6] = v9;
  v10 = +[_DKSystemEventStreams appLocationActivityStream];
  v11 = [v10 name];
  v44[7] = v11;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:8];

  v40 = +[_DKQuery predicateForEventsWithStringValue:v36];
  v38 = +[_DKQuery predicateForEventsWithStreamNames:v41];
  v12 = (void *)MEMORY[0x1E4F28BA0];
  v43[0] = v38;
  v43[1] = v40;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  v14 = [v12 andPredicateWithSubpredicates:v13];

  v15 = +[_DKSystemEventStreams notificationUsageStream];
  v16 = [v15 name];
  v17 = +[_DKQuery predicateForEventsWithStreamName:v16];

  v18 = +[_DKNotificationUsageMetadataKey bundleID];
  v19 = +[_DKQuery predicateForObjectsWithMetadataKey:v18 andStringValue:v36];

  v20 = (void *)MEMORY[0x1E4F28BA0];
  v42[0] = v17;
  v42[1] = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  v22 = [v20 andPredicateWithSubpredicates:v21];

  v23 = +[_DKAppClipUsageMetadataKey appBundleID];
  v24 = +[_DKQuery predicateForObjectsWithMetadataKey:v23 andStringValue:v36];

  v25 = +[_DKAppClipUsageMetadataKey clipBundleID];
  v26 = +[_DKQuery predicateForObjectsWithMetadataKey:v25 andStringValue:v36];

  v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v14, v22, v24, v26, 0);
  v28 = +[_DKQuery predicateForSpotlightEventsWithBundleID:]((uint64_t)_DKQuery, v36);

  [v27 addObject:v28];
  v29 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v27];

  return v29;
}

+ (unint64_t)deleteMalformedNotificationUsageEvents:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[_DKSystemEventStreams notificationUsageStream];
  v5 = [v4 name];
  v6 = +[_DKQuery predicateForEventsWithStreamName:v5];

  v7 = +[_DKNotificationUsageMetadataKey identifier];
  v8 = +[_DKNotificationUsageMetadataKey bundleID];
  v9 = (void *)MEMORY[0x1E4F28F60];
  v10 = +[_DKQuery structuredMetadataKeyPathForMetadataKey:v7];
  v11 = +[_DKQuery structuredMetadataKeyPathForMetadataKey:v8];
  v12 = objc_msgSend(v9, "predicateWithFormat:", @"%K != NULL OR %K != NULL", v10, v11);

  v13 = (void *)MEMORY[0x1E4F28BA0];
  v14 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v12];
  v22[0] = v14;
  v22[1] = v6;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v16 = [v13 andPredicateWithSubpredicates:v15];

  id v21 = 0;
  unint64_t v17 = [v3 deleteAllEventsMatchingPredicate:v16 error:&v21];

  id v18 = v21;
  if (v18)
  {
    v19 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[_DKPrivacyMaintainer deleteMalformedNotificationUsageEvents:]();
    }
  }
  return v17;
}

+ (void)maintainPrivacyWithKnowledgeStorage:(id)a3 installedApps:(id)a4 installedAppExtensions:(id)a5 deleteMaxCount:(unint64_t)a6 objectMaxCount:(unint64_t)a7 objectMaxLifespan:(double)a8 activity:(id)a9
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v92 = a3;
  id v14 = a4;
  id v85 = a5;
  v15 = (_xpc_activity_s *)a9;
  v16 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:]1();
  }

  kdebug_trace();
  unint64_t v17 = +[_CDLogging knowledgeSignpost];
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18ECEB000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MaintainPrivacy", " enableTelemetry=YES ", buf, 2u);
  }
  unint64_t v82 = a7;
  v86 = v14;

  id v18 = +[_CDEventStreams ephemeralitySchedule];
  v89 = [MEMORY[0x1E4F1CA48] array];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  obuint64_t j = v18;
  uint64_t v19 = [obj countByEnumeratingWithState:&v100 objects:v113 count:16];
  v93 = v15;
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)v101;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v101 != v23) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v100 + 1) + 8 * i);
        if (v15 && xpc_activity_should_defer(v15))
        {
          v33 = +[_CDLogging knowledgeChannel];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:]0();
          }

          goto LABEL_21;
        }
        v26 = [obj objectForKeyedSubscript:v25];
        v27 = [v26 allObjects];
        [v89 addObjectsFromArray:v27];
        v28 = (void *)MEMORY[0x1E4F1C9C8];
        [v25 doubleValue];
        v30 = [v28 dateWithTimeIntervalSinceNow:-v29];
        uint64_t v22 = [v92 deleteObjectsInEventStreams:v27 olderThanDate:v30 limit:a6];
        v31 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          [v25 doubleValue];
          *(_DWORD *)buf = 134218498;
          uint64_t v108 = v22;
          __int16 v109 = 2112;
          v110 = v30;
          __int16 v111 = 2048;
          uint64_t v112 = v32;
          _os_log_debug_impl(&dword_18ECEB000, v31, OS_LOG_TYPE_DEBUG, "Deleted %lu objects older than %@, for TTL=%f", buf, 0x20u);
        }
        v21 += v22;

        v15 = v93;
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v100 objects:v113 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
  }
LABEL_21:

  v34 = v86;
  if (!v86 || ![v86 count])
  {
    uint64_t v38 = 0;
    goto LABEL_36;
  }
  if (!v15 || !xpc_activity_should_defer(v15))
  {
    v39 = +[_DKSystemEventStreams appUsageStream];
    v40 = [v39 name];
    v106 = v40;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];

    uint64_t v42 = +[_DKQuery predicateForEventsWithStreamNames:v41];
    v43 = +[_DKQuery predicateForEventsWithStringValueInValues:v86];
    v44 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v43];
    v88 = (void *)v42;
    v105[0] = v42;
    v105[1] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
    v46 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v45];
    id v99 = 0;
    uint64_t v38 = [v92 deleteAllEventsMatchingPredicate:v46 error:&v99];
    id v47 = v99;
    v48 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
      +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.8(v38, (uint64_t)v41, v48);
    }

    if (v47)
    {
      v49 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.7();
      }
    }
    uint64_t v22 = v38;
LABEL_36:
    uint64_t v84 = v38;
    v87 = [MEMORY[0x1E4F1CA48] array];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    v50 = +[_CDEventStreams sharedInstance];
    v51 = [v50 allEventStreams];
    v52 = [v51 allValues];

    uint64_t v53 = [v52 countByEnumeratingWithState:&v95 objects:v104 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v37 = 0;
      uint64_t v55 = *(void *)v96;
      while (2)
      {
        for (uint64_t j = 0; j != v54; ++j)
        {
          if (*(void *)v96 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = *(void **)(*((void *)&v95 + 1) + 8 * j);
          if (v15 && xpc_activity_should_defer(v15))
          {
            v63 = +[_CDLogging knowledgeChannel];
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
              +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.6(v57, v63);
            }

            goto LABEL_55;
          }
          v58 = [v57 eventStreamProperties];
          v59 = [v58 knowledgeBaseName];

          if (v59)
          {
            [v87 addObject:v59];
            v60 = [v57 eventStreamProperties];
            uint64_t v61 = [v60 eventCountLimit];

            uint64_t v22 = [v92 deleteObjectsInEventStream:v59 ifNeededToLimitEventCount:v61 batchLimit:a6];
            v62 = +[_CDLogging knowledgeChannel];
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              uint64_t v108 = v22;
              __int16 v109 = 2112;
              v110 = v59;
              __int16 v111 = 2048;
              uint64_t v112 = v61;
              _os_log_debug_impl(&dword_18ECEB000, v62, OS_LOG_TYPE_DEBUG, "Deleted %lu objects from %@ to keep max count at %ld", buf, 0x20u);
            }
            v37 += v22;
          }
          v15 = v93;
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v95 objects:v104 count:16];
        if (v54) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v37 = 0;
    }

    if (v15)
    {
LABEL_55:
      v34 = v86;
      if (xpc_activity_should_defer(v15))
      {
        v64 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
          +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.5();
        }
        uint64_t v35 = 0;
        uint64_t v36 = 0;
LABEL_79:

        goto LABEL_80;
      }
      char v65 = 0;
    }
    else
    {
      char v65 = 1;
    }
    v64 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-a8];
    v94 = +[_DKQuery predicateForEventsWithStreamNames:v89];
    uint64_t v36 = objc_msgSend(v92, "deleteObjectsOlderThanDate:excludingPredicate:limit:", v64);
    v66 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
      +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.4((uint64_t)v64, v36, v66);
    }

    if ((v65 & 1) != 0 || !xpc_activity_should_defer(v15))
    {
      v83 = +[_DKQuery predicateForEventsWithStreamNames:v87];
      uint64_t v35 = objc_msgSend(v92, "deleteOldObjectsIfNeededToLimitTotalNumber:excludingPredicate:limit:", v82);
      v67 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
        +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:]();
      }

      if ((v65 & 1) != 0 || !xpc_activity_should_defer(v15))
      {
        uint64_t v22 = [v92 deleteOrphanedEntities];
        +[_DKPrivacyMaintainer deleteMalformedNotificationUsageEvents:v92];
        v68 = +[_CDLogging knowledgeChannel];
        v69 = v86;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v108 = v22;
          _os_log_impl(&dword_18ECEB000, v68, OS_LOG_TYPE_DEFAULT, "Deleted %lu orphaned entities", buf, 0xCu);
        }
      }
      else
      {
        v68 = +[_CDLogging knowledgeChannel];
        v69 = v86;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
          +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:]();
        }
        uint64_t v22 = v35;
      }

      v34 = v69;
    }
    else
    {
      v83 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
        +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:]();
      }
      uint64_t v35 = 0;
      uint64_t v22 = v36;
      v34 = v86;
    }

    goto LABEL_79;
  }
  v87 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
    +[_DKPrivacyMaintainer maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:].cold.9();
  }
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v84 = 0;
LABEL_80:

  v70 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v108 = (uint64_t)v34;
    _os_log_impl(&dword_18ECEB000, v70, OS_LOG_TYPE_DEFAULT, "Performing privacy maintenance for installedApps: %@", buf, 0xCu);
  }

  v71 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v108 = (uint64_t)v85;
    _os_log_impl(&dword_18ECEB000, v71, OS_LOG_TYPE_DEFAULT, "Performing privacy maintenance for installedAppExtensions: %@", buf, 0xCu);
  }

  if ([v34 count])
  {
    id BMLibraryStreamsPrunerClass = getBMLibraryStreamsPrunerClass();
    v73 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v34];
    uint64_t v74 = v35;
    uint64_t v75 = v36;
    v76 = v34;
    v77 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v85];
    [BMLibraryStreamsPrunerClass pruneWithInstalledApplications:v73 installedAppExtensions:v77];

    v34 = v76;
    uint64_t v36 = v75;
    uint64_t v35 = v74;
  }
  kdebug_trace();
  v78 = +[_CDLogging knowledgeSignpost];
  BOOL v79 = os_signpost_enabled(v78);
  uint64_t v80 = v35 + v21 + v36 + v37;
  uint64_t v81 = v80 + v84;
  if (v79)
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v108 = v80 + v84 + v22;
    _os_signpost_emit_with_name_impl(&dword_18ECEB000, v78, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MaintainPrivacy", "TotalDeleted=%{signpost.telemetry:number1,public}lu", buf, 0xCu);
  }

  +[_CDDiagnosticDataReporter addValue:v81 forScalarKey:@"com.apple.coreduet.knowledgeStore.privacyEventsDeleted"];
}

+ (void)deleteMalformedNotificationUsageEvents:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error encountered while attempting to delete unexpected notificationUsage events: %@", v2, v3, v4, v5, v6);
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Privacy maintenance deferred before orphaned metadata deletion.", v2, v3, v4, v5, v6);
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.2()
{
  OUTLINED_FUNCTION_1();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_4_3(&dword_18ECEB000, v0, v1, "Deleted %lu objects to keep max count at %lu", v2, v3);
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Privacy maintenance deferred before total count enforcement.", v2, v3, v4, v5, v6);
}

+ (void)maintainPrivacyWithKnowledgeStorage:(NSObject *)a3 installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_4_3(&dword_18ECEB000, a2, a3, "Deleted %lu objects older than %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Privacy maintenance deferred before lifespan enforcement.", v2, v3, v4, v5, v6);
}

+ (void)maintainPrivacyWithKnowledgeStorage:(void *)a1 installedApps:(NSObject *)a2 installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.6(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 eventStreamProperties];
  uint64_t v4 = [v3 knowledgeBaseName];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Privacy maintenance deferred before %@ enforcement.", v5, 0xCu);
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error deleting app usage events for uninstalled apps: %@", v2, v3, v4, v5, v6);
}

+ (void)maintainPrivacyWithKnowledgeStorage:(NSObject *)a3 installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_DEBUG, "Deleted %@ objects from uninstalled apps from %@", v6, 0x16u);
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Privacy maintenance deferred before uninstalled app enforcement.", v2, v3, v4, v5, v6);
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.10()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Privacy maintenance deferred before TTL=%@ deletion.", v2, v3, v4, v5, v6);
}

+ (void)maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:.cold.11()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_DEBUG, "Performing privacy maintenance for historical knowledge", v1, 2u);
}

@end