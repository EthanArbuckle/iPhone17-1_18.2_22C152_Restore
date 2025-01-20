@interface BMStoreEvent(EventJSON)
- (id)json;
- (id)jsonDictionary;
- (void)json;
@end

@implementation BMStoreEvent(EventJSON)

- (id)jsonDictionary
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  [a1 timestamp];
  v3 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v5 = NSNumber;
  [v3 timeIntervalSince1970];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v7 = objc_msgSend(v4, "initWithObjectsAndKeys:", v6, @"eventTimestamp", 0);

  v8 = [a1 eventBody];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [a1 eventBody];
    v11 = [v10 jsonDictionary];
    [v7 addEntriesFromDictionary:v11];
  }
  v12 = [a1 eventBody];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    v14 = [a1 eventBody];
    v15 = [v14 jsonDict];
    [v7 addEntriesFromDictionary:v15];
  }
  v16 = (void *)[v7 copy];

  return v16;
}

- (id)json
{
  v2 = [a1 jsonDictionary];
  id v10 = 0;
  v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:1 error:&v10];
  id v4 = v10;
  v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    id v8 = v3;
  }
  else
  {
    v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(BMStoreEvent(EventJSON) *)a1 json];
    }

    id v8 = 0;
  }

  return v8;
}

- (void)json
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v6 = 138412802;
  uint64_t v7 = objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = [a1 dataType];
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_18E67D000, a3, OS_LOG_TYPE_ERROR, "Failed to serialize store event %@ with type %@ to JSON: %@", (uint8_t *)&v6, 0x20u);
}

@end