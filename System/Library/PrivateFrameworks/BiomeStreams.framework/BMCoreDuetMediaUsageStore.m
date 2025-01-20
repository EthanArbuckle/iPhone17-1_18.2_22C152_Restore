@interface BMCoreDuetMediaUsageStore
- (BMCoreDuetMediaUsageStore)init;
- (BOOL)addContextValue:(id)a3 toArrayAtKeyPath:(id)a4;
- (BOOL)saveKnowledgeEvent:(id)a3 error:(id *)a4;
- (_CDClientContext)contextStore;
- (_DKKnowledgeSaving)knowledgeStore;
- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4;
@end

@implementation BMCoreDuetMediaUsageStore

- (BMCoreDuetMediaUsageStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)BMCoreDuetMediaUsageStore;
  v2 = [(BMCoreDuetMediaUsageStore *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [get_DKKnowledgeStoreClass() userKnowledgeStore];
    knowledgeStore = v2->_knowledgeStore;
    v2->_knowledgeStore = (_DKKnowledgeSaving *)v3;

    uint64_t v5 = [get_CDClientContextClass() userContext];
    contextStore = v2->_contextStore;
    v2->_contextStore = (_CDClientContext *)v5;
  }
  return v2;
}

- (BOOL)addContextValue:(id)a3 toArrayAtKeyPath:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(BMCoreDuetMediaUsageStore *)self contextStore];
  v11[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  LOBYTE(v7) = [v8 addObjects:v9 toArrayAtKeyPath:v6];
  return (char)v7;
}

- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(BMCoreDuetMediaUsageStore *)self contextStore];
  v9 = [v8 removeObjectsMatchingPredicate:v7 fromArrayAtKeyPath:v6];

  return v9;
}

- (BOOL)saveKnowledgeEvent:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = [(BMCoreDuetMediaUsageStore *)self knowledgeStore];
    v11[0] = v6;
    objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    char v9 = [v7 saveObjects:v8 error:a4];
  }
  else
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BMCoreDuetMediaUsageStore saveKnowledgeEvent:error:]();
    }
    char v9 = 0;
  }

  return v9;
}

- (_DKKnowledgeSaving)knowledgeStore
{
  return self->_knowledgeStore;
}

- (_CDClientContext)contextStore
{
  return self->_contextStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextStore, 0);

  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)saveKnowledgeEvent:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "Cannot save nil event to knowledge store", v1, 2u);
}

@end