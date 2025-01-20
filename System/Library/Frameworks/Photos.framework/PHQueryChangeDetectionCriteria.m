@interface PHQueryChangeDetectionCriteria
- (BOOL)isEqual:(id)a3;
- (PHQueryChangeDetectionCriteria)init;
- (PHQueryChangeDetectionCriteria)initWithPLQueryChangeDetectionCriteria:(id)a3;
- (id)changeDetectionCriteriaByAddingChangeDetectionCriteria:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)enumerateEntitiesAndAttributeIndexesUsingBlock:(id)a3;
- (void)enumerateEntitiesAndRelationshipIndexesBlock:(id)a3;
@end

@implementation PHQueryChangeDetectionCriteria

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipIndexValuesByEntityName, 0);

  objc_storeStrong((id *)&self->_attributeIndexValuesByEntityName, 0);
}

- (void)enumerateEntitiesAndRelationshipIndexesBlock:(id)a3
{
  id v4 = a3;
  relationshipIndexValuesByEntityName = self->_relationshipIndexValuesByEntityName;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__PHQueryChangeDetectionCriteria_enumerateEntitiesAndRelationshipIndexesBlock___block_invoke;
  v7[3] = &unk_1E58441F0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)relationshipIndexValuesByEntityName enumerateKeysAndObjectsUsingBlock:v7];
}

void __79__PHQueryChangeDetectionCriteria_enumerateEntitiesAndRelationshipIndexesBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 unsignedLongLongValue];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateEntitiesAndAttributeIndexesUsingBlock:(id)a3
{
  id v4 = a3;
  attributeIndexValuesByEntityName = self->_attributeIndexValuesByEntityName;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__PHQueryChangeDetectionCriteria_enumerateEntitiesAndAttributeIndexesUsingBlock___block_invoke;
  v7[3] = &unk_1E58441F0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)attributeIndexValuesByEntityName enumerateKeysAndObjectsUsingBlock:v7];
}

void __81__PHQueryChangeDetectionCriteria_enumerateEntitiesAndAttributeIndexesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 unsignedLongLongValue];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)changeDetectionCriteriaByAddingChangeDetectionCriteria:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PHQueryChangeDetectionCriteria.m", 71, @"Invalid parameter not satisfying: %@", @"criteria" object file lineNumber description];
  }
  id v6 = (void *)[(PHQueryChangeDetectionCriteria *)self copy];
  v7 = (void *)v5[1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__PHQueryChangeDetectionCriteria_changeDetectionCriteriaByAddingChangeDetectionCriteria___block_invoke;
  v13[3] = &unk_1E5845DD8;
  v13[4] = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];
  id v8 = (void *)v5[2];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__PHQueryChangeDetectionCriteria_changeDetectionCriteriaByAddingChangeDetectionCriteria___block_invoke_2;
  v12[3] = &unk_1E5845DD8;
  v12[4] = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];
  id v9 = v6;

  return v9;
}

void __89__PHQueryChangeDetectionCriteria_changeDetectionCriteriaByAddingChangeDetectionCriteria___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 unsignedLongLongValue];
  v7 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v5];
  uint64_t v8 = [v7 unsignedLongLongValue] | v6;

  id v9 = [NSNumber numberWithUnsignedLongLong:v8];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v9 forKeyedSubscript:v5];
}

void __89__PHQueryChangeDetectionCriteria_changeDetectionCriteriaByAddingChangeDetectionCriteria___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 unsignedLongLongValue];
  v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];
  uint64_t v8 = [v7 unsignedLongLongValue] | v6;

  id v9 = [NSNumber numberWithUnsignedLongLong:v8];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v9 forKeyedSubscript:v5];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableDictionary *)self->_attributeIndexValuesByEntityName hash];
  return [(NSMutableDictionary *)self->_relationshipIndexValuesByEntityName hash] + v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id *)v4;
    if ([v5[1] isEqual:self->_attributeIndexValuesByEntityName]) {
      char v6 = [v5[2] isEqual:self->_relationshipIndexValuesByEntityName];
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSMutableDictionary *)self->_attributeIndexValuesByEntityName mutableCopy];
  char v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSMutableDictionary *)self->_relationshipIndexValuesByEntityName mutableCopy];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (PHQueryChangeDetectionCriteria)initWithPLQueryChangeDetectionCriteria:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHQueryChangeDetectionCriteria *)self init];
  if (v5)
  {
    if ([v4 isEmpty])
    {

      uint64_t v5 = 0;
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __73__PHQueryChangeDetectionCriteria_initWithPLQueryChangeDetectionCriteria___block_invoke;
      v10[3] = &unk_1E58441C8;
      char v6 = v5;
      v11 = v6;
      [v4 enumerateEntitiesAndAttributesUsingBlock:v10];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __73__PHQueryChangeDetectionCriteria_initWithPLQueryChangeDetectionCriteria___block_invoke_2;
      v8[3] = &unk_1E58441C8;
      uint64_t v5 = v6;
      id v9 = v5;
      [v4 enumerateEntitiesAndRelationshipsUsingBlock:v8];
    }
  }

  return v5;
}

void __73__PHQueryChangeDetectionCriteria_initWithPLQueryChangeDetectionCriteria___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F8AAF8];
  id v6 = a2;
  uint64_t v7 = [a3 allObjects];
  uint64_t v8 = [v5 indexValueForAttributeNames:v7 entity:v6];

  id v9 = [NSNumber numberWithUnsignedLongLong:v8];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v9 forKeyedSubscript:v6];
}

void __73__PHQueryChangeDetectionCriteria_initWithPLQueryChangeDetectionCriteria___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F8AAF8];
  id v6 = a2;
  uint64_t v7 = [a3 allObjects];
  uint64_t v8 = [v5 indexValueForRelationshipNames:v7 entity:v6];

  id v9 = [NSNumber numberWithUnsignedLongLong:v8];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v9 forKeyedSubscript:v6];
}

- (PHQueryChangeDetectionCriteria)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHQueryChangeDetectionCriteria;
  v2 = [(PHQueryChangeDetectionCriteria *)&v8 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attributeIndexValuesByEntityName = v2->_attributeIndexValuesByEntityName;
    v2->_attributeIndexValuesByEntityName = v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    relationshipIndexValuesByEntityName = v2->_relationshipIndexValuesByEntityName;
    v2->_relationshipIndexValuesByEntityName = v5;
  }
  return v2;
}

@end