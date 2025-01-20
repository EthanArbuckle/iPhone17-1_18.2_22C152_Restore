@interface DKKnowledgeStorageLogging
@end

@implementation DKKnowledgeStorageLogging

uint64_t __44___DKKnowledgeStorageLogging_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_logger;
  sharedInstance_logger = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __49___DKKnowledgeStorageLogging_portraitStreamNames__block_invoke()
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = +[_CDPortraitStreams topicStream];
  v2 = [v1 name];
  v8[0] = v2;
  v3 = +[_CDPortraitStreams entityStream];
  v4 = [v3 name];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  uint64_t v6 = [v0 setWithArray:v5];
  v7 = (void *)portraitStreamNames_portraitStreamNames;
  portraitStreamNames_portraitStreamNames = v6;
}

void __62___DKKnowledgeStorageLogging_streamNamesNotificationWhitelist__block_invoke(uint64_t a1)
{
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v2 = -[_DKKnowledgeStorageLogging portraitStreamNames](*(id *)(a1 + 32));
  [v27 unionSet:v2];

  v3 = +[_DKSystemEventStreams appActivityStream];
  v4 = [v3 name];
  [v27 addObject:v4];

  v5 = +[_DKSystemEventStreams appIntentsStream];
  uint64_t v6 = [v5 name];
  [v27 addObject:v6];

  v7 = +[_DKSystemEventStreams appRelevantShortcutsStream];
  v8 = [v7 name];
  [v27 addObject:v8];

  v9 = +[_DKSystemEventStreams appUsageStream];
  v10 = [v9 name];
  [v27 addObject:v10];

  v11 = +[_DKSystemEventStreams appWebUsageStream];
  v12 = [v11 name];
  [v27 addObject:v12];

  v13 = +[_DKSystemEventStreams appMediaUsageStream];
  v14 = [v13 name];
  [v27 addObject:v14];

  v15 = +[_DKSystemEventStreams notificationUsageStream];
  v16 = [v15 name];
  [v27 addObject:v16];

  v17 = +[_DKSystemEventStreams microLocationVisitStream];
  v18 = [v17 name];
  [v27 addObject:v18];

  v19 = +[_DKSystemEventStreams nowPlayingStream];
  v20 = [v19 name];
  [v27 addObject:v20];

  v21 = +[_DKSystemEventStreams homeKitSceneStream];
  v22 = [v21 name];
  [v27 addObject:v22];

  v23 = +[_DKSystemEventStreams homeKitAccessoryControlStream];
  v24 = [v23 name];
  [v27 addObject:v24];

  uint64_t v25 = [v27 copy];
  v26 = (void *)streamNamesNotificationWhitelist_streamNamesNotificationWhitelist;
  streamNamesNotificationWhitelist_streamNamesNotificationWhitelist = v25;
}

void __92___DKKnowledgeStorageLogging__sendDistributedNotificationName_object_throttledActivityName___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v2 postNotificationName:*(void *)(a1 + 32) object:*(void *)(a1 + 40) userInfo:0 deliverImmediately:0];
}

uint64_t __83___DKKnowledgeStorageLogging_knowledgeStorage_didInsertEventsWithStreamNameCounts___block_invoke()
{
  uint64_t v0 = +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, @"portraitknowledge", @"ingest", @"type", &unk_1EDE1E8F0);
  uint64_t v1 = knowledgeStorage_didInsertEventsWithStreamNameCounts__ingestCounter;
  knowledgeStorage_didInsertEventsWithStreamNameCounts__ingestCounter = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __88___DKKnowledgeStorageLogging_knowledgeStorage_didInsertLocalEventsWithStreamNameCounts___block_invoke()
{
  uint64_t v0 = +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, @"portraitknowledge", @"ingest_local", @"type", &unk_1EDE1E908);
  uint64_t v1 = knowledgeStorage_didInsertLocalEventsWithStreamNameCounts__ingestLocalCounter;
  knowledgeStorage_didInsertLocalEventsWithStreamNameCounts__ingestLocalCounter = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end