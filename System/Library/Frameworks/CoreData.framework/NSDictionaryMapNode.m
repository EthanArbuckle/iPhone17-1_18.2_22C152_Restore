@interface NSDictionaryMapNode
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (NSDictionaryMapNode)initWithCoder:(id)a3;
- (NSDictionaryMapNode)initWithValues:(id *)a3 objectID:(id)a4;
- (id)valueForKey:(id)a3;
- (void)_doAttributeDecoding;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSDictionaryMapNode

+ (void)initialize
{
}

- (NSDictionaryMapNode)initWithValues:(id *)a3 objectID:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NSDictionaryMapNode;
  result = [(NSStoreMapNode *)&v6 initWithObjectID:a4];
  if (result) {
    result->_attributes = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionaryMapNode)initWithCoder:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSDictionaryMapNode;
  v4 = -[NSStoreMapNode initWithCoder:](&v8, sel_initWithCoder_);
  v5 = (void *)[a3 allowedClasses];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  id v6 = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v9, 2)), @"NSAttributeValues");
  v4->_attributesAsEncoded = v6;
  if (!v6) {
    v4->_attributesAsEncoded = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), @"NSAttributes");
  }
  return v4;
}

- (void)_doAttributeDecoding
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1 && *(void *)(a1 + 56))
  {
    v2 = objc_msgSend((id)objc_msgSend((id)a1, "entity"), "_propertySearchMapping");
    uint64_t v3 = [v2 length];
    v4 = (id *)PF_CALLOC_OBJECT_ARRAY(v3);
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
    int v6 = [*(id *)(a1 + 56) isNSArray];
    v7 = *(void **)(a1 + 56);
    if (v6)
    {
      [*(id *)(a1 + 56) getObjects:v4];
      if (v3)
      {
        objc_super v8 = v4;
        do
        {
          if (*v8 == (id)v5) {
            *objc_super v8 = 0;
          }
          else {
            id v9 = *v8;
          }
          ++v8;
          --v3;
        }
        while (v3);
      }
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v10 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v7);
            }
            uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            uint64_t v15 = [v2 fastIndexForKnownKey:v14];
            v16 = (void *)[v7 objectForKey:v14];
            if (v16 == (void *)v5) {
              id v17 = 0;
            }
            else {
              id v17 = v16;
            }
            v4[v15] = v17;
          }
          uint64_t v11 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }
    }

    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 48) = v4;
  }
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NSDictionaryMapNode;
  -[NSStoreMapNode encodeWithCoder:](&v13, sel_encodeWithCoder_);
  if (self->_attributesAsEncoded) {
    -[NSDictionaryMapNode _doAttributeDecoding]((uint64_t)self);
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(-[NSStoreMapNode entity](self, "entity"), "_propertySearchMapping"), "length");
  int v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    int v6 = malloc_default_zone();
  }
  v7 = malloc_type_zone_malloc(v6, 8 * v5, 0x80040B8603338uLL);
  uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v10 = self->_attributes[i];
      if (!v10) {
        id v10 = (id)v8;
      }
      v7[i] = v10;
    }
  }
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v7 count:v5];
  uint64_t v12 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    uint64_t v12 = malloc_default_zone();
  }
  malloc_zone_free(v12, v7);
  [a3 encodeObject:v11 forKey:@"NSAttributeValues"];
}

- (void)dealloc
{
  if (self->_attributes)
  {
    uint64_t v3 = objc_msgSend((id)objc_msgSend(-[NSStoreMapNode entity](self, "entity"), "_propertySearchMapping"), "length");
    if (v3)
    {
      uint64_t v4 = v3;
      for (uint64_t i = 0; i != v4; ++i)
    }
    PF_FREE_OBJECT_ARRAY(self->_attributes);
    self->_attributes = 0;
  }

  self->_attributesAsEncoded = 0;
  v6.receiver = self;
  v6.super_class = (Class)NSDictionaryMapNode;
  [(NSStoreMapNode *)&v6 dealloc];
}

- (id)valueForKey:(id)a3
{
  if (self->_attributesAsEncoded) {
    -[NSDictionaryMapNode _doAttributeDecoding]((uint64_t)self);
  }
  id v5 = [(NSStoreMapNode *)self entity];
  objc_super v6 = (void *)[v5 _propertySearchMapping];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v5, "propertiesByName"), "values");
  uint64_t v8 = [v6 indexForKey:a3];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 == @"objectID" || [@"objectID" isEqualToString:a3])
    {
      id v9 = [(NSStoreMapNode *)self objectID];
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)NSDictionaryMapNode;
      id v9 = [(NSDictionaryMapNode *)&v19 valueForKey:a3];
    }
    goto LABEL_21;
  }
  uint64_t v10 = v8;
  if ([*(id *)(v7 + 8 * v8) isTransient])
  {
LABEL_8:
    id v11 = 0;
    goto LABEL_22;
  }
  if ([*(id *)(v7 + 8 * v10) _propertyType] == 2)
  {
    id v11 = self->_attributes[v10];
    goto LABEL_22;
  }
  uint64_t v12 = *(void **)(v7 + 8 * v10);
  objc_super v13 = (void *)[(NSMutableDictionary *)self->super._relatedNodes valueForKey:a3];
  if (![v12 isToMany])
  {
    if ([v13 count])
    {
      id v9 = -[NSPersistentStoreMap dataForKey:](self->super._map, "dataForKey:", [v13 objectAtIndex:0]);
LABEL_21:
      id v11 = v9;
      goto LABEL_22;
    }
    goto LABEL_8;
  }
  id v11 = (id)[MEMORY[0x1E4F1CA48] array];
  uint64_t v14 = [v13 count];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t i = 0; i != v15; ++i)
    {
      id v17 = -[NSPersistentStoreMap dataForKey:](self->super._map, "dataForKey:", [v13 objectAtIndex:i]);
      if (v17) {
        [v11 addObject:v17];
      }
    }
  }
LABEL_22:
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA98], "null"), "isEqual:", v11)) {
    return 0;
  }
  else {
    return v11;
  }
}

@end