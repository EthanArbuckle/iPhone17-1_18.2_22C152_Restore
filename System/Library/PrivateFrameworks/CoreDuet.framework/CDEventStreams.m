@interface CDEventStreams
@end

@implementation CDEventStreams

uint64_t __33___CDEventStreams_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_CDEventStreams);
  uint64_t v1 = sharedInstance__sharedContextStoreEvents;
  sharedInstance__sharedContextStoreEvents = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __48___CDEventStreams__eventStreamForName_orKBName___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = [v7 objectForKeyedSubscript:kCDESPEventNameKey];
  uint64_t v9 = [v7 objectForKeyedSubscript:kCDESPKnowledgeBaseEventNameKey];
  if (v8 | v9)
  {
    if (*(unsigned char *)(a1 + 80)
      || ([*(id *)(a1 + 32) isEqualToString:v8] & 1) != 0
      || [(id)v9 isEqualToString:*(void *)(a1 + 40)])
    {
      v10 = +[_CDEventStreamProperties eventStreamPropertiesFromDictionary:v7 defaultProperties:*(void *)(a1 + 48)];
      v11 = +[_CDEventStream eventStreamWithProperties:v10];
      if (v8) {
        [*(id *)(a1 + 56) setObject:v11 forKeyedSubscript:v8];
      }
      if (v9) {
        [*(id *)(a1 + 64) setObject:v11 forKeyedSubscript:v9];
      }
      if (!*(unsigned char *)(a1 + 80))
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v11);
        *a4 = 1;
      }
    }
  }
  else
  {
    v12 = +[_CDLogging contextChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __48___CDEventStreams__eventStreamForName_orKBName___block_invoke_cold_1((uint64_t)v7, a3, v12);
    }
  }
}

uint64_t __49___CDEventStreams_rateLimiterForEventStreamName___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = rateLimiterForEventStreamName__policies;
  rateLimiterForEventStreamName__policies = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __51___CDEventStreams_privacyPolicyForEventStreamName___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = privacyPolicyForEventStreamName__policies;
  privacyPolicyForEventStreamName__policies = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __48___CDEventStreams__eventStreamForName_orKBName___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "plistArray[%ld]:\n%@\n missing EventName and KnowledgeBaseEventName keys -- skip over this event\n", (uint8_t *)&v3, 0x16u);
}

@end