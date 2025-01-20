@interface ATXInfoEngineCachedSuggestions
- (ATXInfoEngineCachedSuggestions)initWithProto:(id)a3;
- (ATXInfoEngineCachedSuggestions)initWithProtoData:(id)a3;
- (NSArray)entries;
- (id)encodeAsProto;
- (id)proto;
- (void)setEntries:(id)a3;
@end

@implementation ATXInfoEngineCachedSuggestions

- (ATXInfoEngineCachedSuggestions)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[ATXPBInfoEngineCachedSuggestions alloc] initWithData:v4];

    self = [(ATXInfoEngineCachedSuggestions *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXInfoEngineCachedSuggestions *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXInfoEngineCachedSuggestions)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = -[ATXPBInfoEngineCachedSuggestions length]((uint64_t)v5);
      v7 = -[ATXPBInfoEngineCachedSuggestions cachedSuggestionIds]((uint64_t)v5);
      v8 = -[ATXPBInfoEngineCachedSuggestions cachedSuggestionSourceIds]((uint64_t)v5);
      if ([v7 count] == v6 && objc_msgSend(v8, "count") == v6)
      {
        v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __48__ATXInfoEngineCachedSuggestions_initWithProto___block_invoke;
        v16[3] = &unk_1E5D08010;
        id v17 = v8;
        v10 = v9;
        v18 = v10;
        [v7 enumerateObjectsUsingBlock:v16];
        v15.receiver = self;
        v15.super_class = (Class)ATXInfoEngineCachedSuggestions;
        v11 = [(ATXInfoEngineCachedSuggestions *)&v15 init];
        v12 = v11;
        if (v11) {
          objc_storeStrong((id *)&v11->_entries, v9);
        }
        self = v12;

        v13 = self;
      }
      else
      {
        v10 = __atxlog_handle_gi();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          -[ATXInfoEngineCachedSuggestions initWithProto:](v10);
        }
        v13 = 0;
      }
    }
    else
    {
      v5 = __atxlog_handle_gi();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXInfoEngineCachedSuggestions initWithProto:]((uint64_t)self, v5);
      }
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __48__ATXInfoEngineCachedSuggestions_initWithProto___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v7 = (id)objc_opt_new();
  [v7 setSuggestionId:v5];

  uint64_t v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v7 setSourceId:v6];

  [*(id *)(a1 + 40) addObject:v7];
}

- (id)proto
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_entries, "count"));
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_entries, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_entries;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "suggestionId", (void)v15);
        [v3 addObject:v11];

        v12 = [v10 sourceId];
        [v4 addObject:v12];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = objc_opt_new();
  -[ATXPBInfoEngineCachedSuggestions setLength:]((uint64_t)v13, [(NSArray *)self->_entries count]);
  -[ATXPBInfoEngineCachedSuggestions setCachedSuggestionIds:]((uint64_t)v13, v3);
  -[ATXPBInfoEngineCachedSuggestions setCachedSuggestionSourceIds:]((uint64_t)v13, v4);

  return v13;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "ATXInfoEngineCachedSuggestions: Unable to init from malformed proto object (mismatched array length).", v1, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "ATXInfoEngineCachedSuggestions: Unable to construct class %@ from ProtoBuf object", (uint8_t *)&v5, 0xCu);
}

@end