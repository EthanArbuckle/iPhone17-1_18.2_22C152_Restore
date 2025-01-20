@interface MPBaseEntityTranslator
+ (id)createTranslatorForMPModelClass:(Class)a3;
+ (id)translatorForMPModelClass:(Class)a3;
+ (void)buildSchemaIfNeeded;
- (Class)MPModelClass;
- (Class)classForRelationshipKey:(id)a3;
- (MPBaseEntityTranslator)initWithMPModelClass:(Class)a3;
- (id)_objectForPropertySet:(id)a3 source:(id)a4 context:(id)a5;
- (id)_objectForRelationshipKey:(id)a3 propertySet:(id)a4 source:(id)a5 context:(id)a6;
- (id)_valueForPropertyKey:(id)a3 source:(id)a4 context:(id)a5;
- (id)description;
- (id)identifiersForSource:(uint64_t)a3 context:;
- (id)objectForPropertySet:(uint64_t)a3 source:(uint64_t)a4 context:;
- (id)prepareSource:(id)a3 context:(id)a4 properties:(id)a5;
- (id)propertyTranslatorForPropertyKey:(id *)a1;
- (void)mapIdentifiersToPropertyTranslator:(id *)a1;
- (void)mapPropertyKey:(void *)a3 toPropertyTranslator:;
- (void)mapRelationshipKey:(uint64_t)a1 ofModelClass:(void *)a2 toRelationshipTranslator:(void *)a3;
- (void)mapUnsupportedPropertyKey:(id)a3;
- (void)mapUnsupportedRelationshipKey:(id)a3;
- (void)setSourcePreprocessorBlock:(id)a3;
@end

@implementation MPBaseEntityTranslator

- (MPBaseEntityTranslator)initWithMPModelClass:(Class)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MPBaseEntityTranslator;
  v4 = [(MPBaseEntityTranslator *)&v13 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_MPModelClass, a3);
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    propertiesToTranslators = v5->_propertiesToTranslators;
    v5->_propertiesToTranslators = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    relationshipsToTranslators = v5->_relationshipsToTranslators;
    v5->_relationshipsToTranslators = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    unsupportedKeys = v5->_unsupportedKeys;
    v5->_unsupportedKeys = (NSMutableSet *)v10;
  }
  return v5;
}

void __63__MPBaseEntityTranslator__objectForPropertySet_source_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7 = [*(id *)(a1 + 56) properties];
  uint64_t v8 = [v4 prepareSource:v5 context:v6 properties:v7];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v9 = [*(id *)(a1 + 56) properties];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v15 = [*(id *)(a1 + 32) _valueForPropertyKey:v14 source:v8 context:*(void *)(a1 + 48)];
        [v3 setValue:v15 forModelKey:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  v16 = [*(id *)(a1 + 56) relationships];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__MPBaseEntityTranslator__objectForPropertySet_source_context___block_invoke_2;
  v19[3] = &unk_1E57F25A8;
  v17 = *(void **)(a1 + 40);
  v19[4] = *(void *)(a1 + 32);
  id v20 = v17;
  id v21 = *(id *)(a1 + 48);
  id v22 = v3;
  id v18 = v3;
  [v16 enumerateKeysAndObjectsUsingBlock:v19];
}

- (id)_valueForPropertyKey:(id)a3 source:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = -[MPBaseEntityTranslator propertyTranslatorForPropertyKey:]((id *)&self->super.isa, a3);
  uint64_t v11 = [v10 valueFromSource:v9 context:v8];

  return v11;
}

- (id)propertyTranslatorForPropertyKey:(id *)a1
{
  id v3 = a2;
  if (a1 && ([a1[4] containsObject:v3] & 1) == 0)
  {
    v4 = [a1[1] objectForKeyedSubscript:v3];
    if (v4) {
      goto LABEL_6;
    }
    uint64_t v5 = (void *)[a1 MPModelClass];
    uint64_t v6 = [NSString stringWithFormat:@"[%@] Property mapping missing for %@ : %@", objc_opt_class(), objc_msgSend(a1, "MPModelClass"), v3];
    MPModelPropertyMappingMissing(v5, v3, v6);
  }
  v4 = 0;
LABEL_6:

  return v4;
}

- (id)prepareSource:(id)a3 context:(id)a4 properties:(id)a5
{
  id v7 = a3;
  sourcePreprocessorBlock = (void (**)(id, id, id))self->_sourcePreprocessorBlock;
  id v9 = v7;
  if (sourcePreprocessorBlock)
  {
    id v9 = sourcePreprocessorBlock[2](sourcePreprocessorBlock, v7, a4);
  }

  return v9;
}

- (id)_objectForRelationshipKey:(id)a3 propertySet:(id)a4 source:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  if (!self)
  {
    v15 = 0;
    goto LABEL_4;
  }
  if ([(NSMutableSet *)self->_unsupportedKeys containsObject:v14])
  {
    v15 = 0;
    self = 0;
LABEL_4:
    id v16 = v14;
    goto LABEL_15;
  }
  uint64_t v17 = [(NSMutableDictionary *)self->_relationshipsToTranslators objectForKeyedSubscript:v14];
  if (!v17)
  {
    id v22 = [(MPBaseEntityTranslator *)self MPModelClass];
    v19 = [NSString stringWithFormat:@"[%@] Relationship mapping missing for %@ : %@", objc_opt_class(), -[MPBaseEntityTranslator MPModelClass](self, "MPModelClass"), v14];
    MPModelPropertyMappingMissing(v22, v14, v19);
    v15 = 0;
    self = 0;
    id v16 = v14;
LABEL_13:

    goto LABEL_15;
  }
  v15 = (void *)v17;

  id v16 = v12;
  if (*(unsigned char *)&self->_optionalHooks)
  {
    uint64_t v18 = [v15 prepareSource:v16 context:v13];

    id v16 = (id)v18;
  }
  if (v16)
  {
    v19 = objc_msgSend((id)objc_opt_class(), "translatorForMPModelClass:", objc_msgSend(v15, "relatedMPModelClass"));
    if (!v19)
    {
      id v20 = [(MPBaseEntityTranslator *)self MPModelClass];
      id v21 = [NSString stringWithFormat:@"Missing entity translator for model class: %@", objc_msgSend(v15, "relatedMPModelClass")];
      MPModelPropertyMappingMissing(v20, v14, v21);
    }
    self = [v19 _objectForPropertySet:v11 source:v16 context:v13];
    goto LABEL_13;
  }
  self = 0;
LABEL_15:

  return self;
}

- (id)_objectForPropertySet:(id)a3 source:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = -[MPBaseEntityTranslator identifiersForSource:context:](self, (uint64_t)v10, (uint64_t)v11);
  if (!v12)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"MPBaseEntityTranslator.m", 177, @"No identifiers for model class: %@ from source: %@", -[MPBaseEntityTranslator MPModelClass](self, "MPModelClass"), v10 object file lineNumber description];
  }
  id v13 = objc_alloc([(MPBaseEntityTranslator *)self MPModelClass]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__MPBaseEntityTranslator__objectForPropertySet_source_context___block_invoke;
  v20[3] = &unk_1E57F25D0;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v9;
  id v14 = v9;
  id v15 = v11;
  id v16 = v10;
  uint64_t v17 = (void *)[v13 initWithIdentifiers:v12 block:v20];

  return v17;
}

- (Class)MPModelClass
{
  return self->_MPModelClass;
}

- (id)identifiersForSource:(uint64_t)a3 context:
{
  if (a1)
  {
    a1 = [a1 _valueForPropertyKey:@"_identifiers" source:a2 context:a3];
    uint64_t v3 = vars8;
  }
  return a1;
}

+ (id)translatorForMPModelClass:(Class)a3
{
  [a1 buildSchemaIfNeeded];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = __MPGetModelToTranslatorMap();
  uint64_t v6 = [v5 objectForKey:v4];
  id v7 = [v6 objectForKey:a3];

  return v7;
}

void __63__MPBaseEntityTranslator__objectForPropertySet_source_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = a2;
  id v9 = [v5 _objectForRelationshipKey:v8 propertySet:a3 source:v6 context:v7];
  [*(id *)(a1 + 56) setValue:v9 forModelKey:v8];
}

- (id)objectForPropertySet:(uint64_t)a3 source:(uint64_t)a4 context:
{
  if (a1)
  {
    a1 = [a1 _objectForPropertySet:a2 source:a3 context:a4];
    uint64_t v4 = vars8;
  }
  return a1;
}

- (void)mapPropertyKey:(void *)a3 toPropertyTranslator:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    if ([a1[4] containsObject:v9])
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel_mapPropertyKey_toPropertyTranslator_, a1, @"MPBaseEntityTranslator.m", 138, @"[%@] Attempting to map an already unsupported property for %@ : %@", objc_opt_class(), objc_msgSend(a1, "MPModelClass"), v9 object file lineNumber description];
    }
    uint64_t v6 = [a1[1] objectForKeyedSubscript:v9];

    if (v6)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_mapPropertyKey_toPropertyTranslator_, a1, @"MPBaseEntityTranslator.m", 139, @"[%@] Attempting to replace existing property translator for %@ : %@", objc_opt_class(), objc_msgSend(a1, "MPModelClass"), v9 object file lineNumber description];
    }
    [a1[1] setObject:v5 forKeyedSubscript:v9];
  }
}

- (void)mapRelationshipKey:(uint64_t)a1 ofModelClass:(void *)a2 toRelationshipTranslator:(void *)a3
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    if ([*(id *)(a1 + 32) containsObject:v9])
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel_mapRelationshipKey_ofModelClass_toRelationshipTranslator_, a1, @"MPBaseEntityTranslator.m", 144, @"[%@] Attempting to map an already unsupported relationship for %@ : %@", objc_opt_class(), objc_msgSend((id)a1, "MPModelClass"), v9 object file lineNumber description];
    }
    uint64_t v6 = [*(id *)(a1 + 16) objectForKeyedSubscript:v9];

    if (v6)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_mapRelationshipKey_ofModelClass_toRelationshipTranslator_, a1, @"MPBaseEntityTranslator.m", 145, @"[%@] Attempting to replace existing relationship translator for %@ : %@", objc_opt_class(), objc_msgSend((id)a1, "MPModelClass"), v9 object file lineNumber description];
    }
    [*(id *)(a1 + 16) setObject:v5 forKeyedSubscript:v9];
    if (objc_opt_respondsToSelector()) {
      *(unsigned char *)(a1 + 40) |= 1u;
    }
  }
}

- (void)mapUnsupportedPropertyKey:(id)a3
{
  id v8 = a3;
  if ([v8 isEqualToString:@"_identifiers"])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"MPBaseEntityTranslator.m", 163, @"[%@] Attempting to unsupport identifiers for %@", objc_opt_class(), -[MPBaseEntityTranslator MPModelClass](self, "MPModelClass") object file lineNumber description];
  }
  id v5 = [(NSMutableDictionary *)self->_propertiesToTranslators objectForKeyedSubscript:v8];

  if (v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"MPBaseEntityTranslator.m", 164, @"[%@] Attempting to unsupport a property with an existing mapping: %@", objc_opt_class(), v8 object file lineNumber description];
  }
  [(NSMutableSet *)self->_unsupportedKeys addObject:v8];
}

- (void)mapIdentifiersToPropertyTranslator:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [a1[1] objectForKeyedSubscript:@"_identifiers"];

    if (v4)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel_mapIdentifiersToPropertyTranslator_, a1, @"MPBaseEntityTranslator.m", 133, @"[%@] Attempting to replace existing identifiers translator for %@", objc_opt_class(), objc_msgSend(a1, "MPModelClass") object file lineNumber description];
    }
    [a1[1] setObject:v6 forKeyedSubscript:@"_identifiers"];
    id v3 = v6;
  }
}

+ (id)createTranslatorForMPModelClass:(Class)a3
{
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = __MPGetModelToTranslatorMap();
  id v8 = [v7 objectForKey:v6];
  id v9 = [v8 objectForKey:a3];

  if (v9)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"MPBaseEntityTranslator.m", 156, @"[%@] Already an existing translator for %@", objc_opt_class(), a3 object file lineNumber description];
  }
  id v10 = (void *)[objc_alloc((Class)a1) initWithMPModelClass:a3];
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  id v13 = __MPGetModelToTranslatorMap();
  id v14 = [v13 objectForKey:v11];
  if (!v14)
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:10];
    [v13 setObject:v14 forKey:v11];
  }
  [v14 setObject:v12 forKey:a3];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MPModelClass, 0);
  objc_storeStrong((id *)&self->_unsupportedKeys, 0);
  objc_storeStrong(&self->_sourcePreprocessorBlock, 0);
  objc_storeStrong((id *)&self->_relationshipsToTranslators, 0);

  objc_storeStrong((id *)&self->_propertiesToTranslators, 0);
}

- (void)mapUnsupportedRelationshipKey:(id)a3
{
  id v7 = a3;
  id v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_relationshipsToTranslators, "objectForKeyedSubscript:");

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"MPBaseEntityTranslator.m", 169, @"[%@] Attempting to unsupport a relationship with an existing mapping: %@", objc_opt_class(), v7 object file lineNumber description];
  }
  [(NSMutableSet *)self->_unsupportedKeys addObject:v7];
}

- (void)setSourcePreprocessorBlock:(id)a3
{
  id v8 = a3;
  if (self->_sourcePreprocessorBlock)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"MPBaseEntityTranslator.m", 128, @"[%@] Attempting to set a source preprocessor for %@, but one is already set.", objc_opt_class(), -[MPBaseEntityTranslator MPModelClass](self, "MPModelClass") object file lineNumber description];
  }
  id v5 = (void *)MEMORY[0x19971E0F0]();
  id sourcePreprocessorBlock = self->_sourcePreprocessorBlock;
  self->_id sourcePreprocessorBlock = v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p modelClass=%@>", objc_opt_class(), self, -[MPBaseEntityTranslator MPModelClass](self, "MPModelClass")];
}

- (Class)classForRelationshipKey:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_relationshipsToTranslators objectForKeyedSubscript:a3];
  uint64_t v4 = [v3 relatedMPModelClass];

  return (Class)v4;
}

+ (void)buildSchemaIfNeeded
{
  uint64_t v4 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, a1, @"MPBaseEntityTranslator.m", 96, @"Subclass %@ must implement -%@ defined in %@.", v6, v7, @"[MPBaseEntityTranslator class]" object file lineNumber description];
  }
}

@end