@interface CPLRejectedRecords
- (BOOL)isEqual:(id)a3;
- (BOOL)rejectsTheSameRecordsAs:(id)a3;
- (CPLRejectedRecords)init;
- (id)objectForKeyedSubscript:(id)a3;
- (id)recordWithScopedIdentifier:(id)a3;
- (id)rejectedDescriptions;
- (unint64_t)count;
- (void)enumerateRecordsAndReasonsUsingBlock:(id)a3;
- (void)removeRejectedRecordsWithScopedIdentifiers:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation CPLRejectedRecords

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_records, 0);
}

- (id)rejectedDescriptions
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableDictionary count](self->_records, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CPLRejectedRecords_rejectedDescriptions__block_invoke;
  v6[3] = &unk_1E60AAD38;
  id v4 = v3;
  id v7 = v4;
  [(CPLRejectedRecords *)self enumerateRecordsAndReasonsUsingBlock:v6];

  return v4;
}

void __42__CPLRejectedRecords_rejectedDescriptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 alloc];
  uint64_t v9 = objc_opt_class();
  v10 = [v7 scopedIdentifier];

  id v11 = (id)[v8 initWithFormat:@"%@ %@: '%@'", v9, v10, v6];
  [*(id *)(a1 + 32) addObject:v11];
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_records count];
}

- (BOOL)rejectsTheSameRecordsAs:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  else {
    return [*((id *)a3 + 1) isEqual:self->_records];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CPLRejectedRecords *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && [(NSMutableDictionary *)v4->_records isEqual:self->_records])
    {
      char v6 = [(NSMutableDictionary *)v4->_reasons isEqual:self->_reasons];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void)enumerateRecordsAndReasonsUsingBlock:(id)a3
{
  id v4 = a3;
  records = self->_records;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CPLRejectedRecords_enumerateRecordsAndReasonsUsingBlock___block_invoke;
  v7[3] = &unk_1E60AAD10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)records enumerateKeysAndObjectsUsingBlock:v7];
}

void __59__CPLRejectedRecords_enumerateRecordsAndReasonsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeRejectedRecordsWithScopedIdentifiers:(id)a3
{
  records = self->_records;
  id v5 = a3;
  [(NSMutableDictionary *)records removeObjectsForKeys:v5];
  [(NSMutableDictionary *)self->_reasons removeObjectsForKeys:v5];
}

- (id)recordWithScopedIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_records objectForKeyedSubscript:a3];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v6 scopedIdentifier];
  records = self->_records;
  if (v9)
  {
    [(NSMutableDictionary *)records setObject:v6 forKeyedSubscript:v7];
    [(NSMutableDictionary *)self->_reasons setObject:v9 forKeyedSubscript:v7];
  }
  else
  {
    [(NSMutableDictionary *)records removeObjectForKey:v7];
    [(NSMutableDictionary *)self->_reasons removeObjectForKey:v7];
  }
}

- (id)objectForKeyedSubscript:(id)a3
{
  reasons = self->_reasons;
  id v4 = [a3 scopedIdentifier];
  id v5 = [(NSMutableDictionary *)reasons objectForKeyedSubscript:v4];

  return v5;
}

- (CPLRejectedRecords)init
{
  v8.receiver = self;
  v8.super_class = (Class)CPLRejectedRecords;
  v2 = [(CPLRejectedRecords *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    records = v2->_records;
    v2->_records = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    reasons = v2->_reasons;
    v2->_reasons = v5;
  }
  return v2;
}

@end