@interface _LTDisambiguationChangeManager
- (BOOL)hasAnyChangeOfType:(unint64_t)a3;
- (BOOL)restoreChangesToResult:(id)a3;
- (NSDictionary)changeMapping;
- (_LTDisambiguationChangeManager)init;
- (void)addUserSelection:(id)a3;
- (void)reset;
@end

@implementation _LTDisambiguationChangeManager

- (_LTDisambiguationChangeManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)_LTDisambiguationChangeManager;
  v2 = [(_LTDisambiguationChangeManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    changeMapping = v2->_changeMapping;
    v2->_changeMapping = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (NSDictionary)changeMapping
{
  v2 = (void *)[objc_alloc(NSDictionary) initWithDictionary:self->_changeMapping copyItems:1];

  return (NSDictionary *)v2;
}

- (void)reset
{
}

- (void)addUserSelection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    changeMapping = self->_changeMapping;
    id v11 = v4;
    v6 = [v4 sourceSnippet];
    objc_super v7 = [(NSMutableDictionary *)changeMapping objectForKeyedSubscript:v6];

    if (v7)
    {
      [v7 addUserSelection:v11];
    }
    else
    {
      v8 = objc_alloc_init(_LTDisambiguationChangeSet);
      [(_LTDisambiguationChangeSet *)v8 addUserSelection:v11];
      v9 = self->_changeMapping;
      v10 = [v11 sourceSnippet];
      [(NSMutableDictionary *)v9 setObject:v8 forKeyedSubscript:v10];
    }
    id v4 = v11;
  }
}

- (BOOL)restoreChangesToResult:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = objc_msgSend(a3, "sentences", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += [*(id *)(*((void *)&v14 + 1) + 8 * i) _restoreChanges:self];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);

    if (v7)
    {
      v10 = _LTOSLogDisambiguation();
      BOOL v11 = 1;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v19 = v7;
        _os_log_impl(&dword_24639B000, v10, OS_LOG_TYPE_INFO, "Restored changes to %zu sentences in result", buf, 0xCu);
      }
      return v11;
    }
  }
  else
  {
  }
  v12 = _LTOSLogDisambiguation();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[_LTDisambiguationChangeManager restoreChangesToResult:](v12);
  }
  return 0;
}

- (BOOL)hasAnyChangeOfType:(unint64_t)a3
{
  id v4 = [(NSMutableDictionary *)self->_changeMapping allValues];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53___LTDisambiguationChangeManager_hasAnyChangeOfType___block_invoke;
  v6[3] = &__block_descriptor_40_e36_B16__0___LTDisambiguationChangeSet_8l;
  v6[4] = a3;
  LOBYTE(a3) = objc_msgSend(v4, "lt_hasObjectPassingTest:", v6);

  return a3;
}

- (void).cxx_destruct
{
}

- (void)restoreChangesToResult:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24639B000, log, OS_LOG_TYPE_DEBUG, "No sentences restored changes from previous user-selections", v1, 2u);
}

@end