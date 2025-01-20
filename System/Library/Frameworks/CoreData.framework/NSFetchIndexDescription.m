@interface NSFetchIndexDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEditable;
- (BOOL)isEqual:(id)a3;
- (NSArray)elements;
- (NSEntityDescription)entity;
- (NSFetchIndexDescription)initWithCoder:(id)a3;
- (NSFetchIndexDescription)initWithName:(NSString *)name elements:(NSArray *)elements;
- (NSFetchIndexDescription)initWithName:(id)a3 predicate:(id)a4 elements:(id)a5 entity:(id)a6;
- (NSPredicate)partialIndexPredicate;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_compare:(id)a3;
- (uint64_t)_checkElements:(uint64_t)result;
- (uint64_t)_compoundIndexRepresentation;
- (uint64_t)_isIndexForProperty:(uint64_t)a1;
- (uint64_t)_isMappedSinglePropertyIndex;
- (uint64_t)_isPurelyModeledIndex;
- (uint64_t)_isUnique;
- (uint64_t)_setIsUnique:(uint64_t)result;
- (unint64_t)_validateCollationTypeChangeFrom:(uint64_t)a3 to:;
- (unint64_t)hash;
- (void)_setEntity:(id)a3;
- (void)_throwIfNotEditable;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setElements:(NSArray *)elements;
- (void)setName:(NSString *)name;
- (void)setPartialIndexPredicate:(NSPredicate *)partialIndexPredicate;
@end

@implementation NSFetchIndexDescription

- (void)_setEntity:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_entity = (NSEntityDescription *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  elements = self->_elements;
  uint64_t v5 = [(NSArray *)elements countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(elements);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        -[NSFetchIndexElementDescription _setIndexDescription:]((uint64_t)v9, self);
        [v9 property];
      }
      uint64_t v6 = [(NSArray *)elements countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSFetchIndexDescription)initWithName:(id)a3 predicate:(id)a4 elements:(id)a5 entity:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)NSFetchIndexDescription;
  long long v10 = [(NSFetchIndexDescription *)&v21 init];
  if (v10)
  {
    v10->_name = (NSString *)a3;
    v10->_elements = (NSArray *)[a5 copy];
    long long v11 = (NSPredicate *)a4;
    v10->_entity = (NSEntityDescription *)a6;
    v10->_partialIndexPredicate = v11;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = [a5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(a5);
          }
          -[NSFetchIndexElementDescription _setIndexDescription:](*(void *)(*((void *)&v17 + 1) + 8 * v15++), v10);
        }
        while (v13 != v15);
        uint64_t v13 = [a5 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v13);
    }
  }
  return v10;
}

- (NSEntityDescription)entity
{
  return self->_entity;
}

- (uint64_t)_checkElements:(uint64_t)result
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = [a2 count] ? objc_msgSend((id)objc_msgSend(a2, "firstObject"), "collationType") : 0;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    result = [a2 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v19;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v19 != v5) {
            objc_enumerationMutation(a2);
          }
          uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
          v8 = (void *)[v7 property];
          if (v8)
          {
            v9 = v8;
            uint64_t v10 = [v8 _propertyType];
            if ((unint64_t)(v10 - 4) >= 3 && v10 != 2)
            {
              uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v13 = *MEMORY[0x1E4F1C3C8];
              v22 = @"Property";
              uint64_t v23 = v9;
              uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
              uint64_t v15 = @"Unsupported property type for index.";
              v16 = v12;
              uint64_t v17 = v13;
              goto LABEL_21;
            }
            if (v3 != [v7 collationType])
            {
              v16 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v17 = *MEMORY[0x1E4F1C3C8];
              uint64_t v15 = @"Can't mix and match collation types.";
              uint64_t v14 = 0;
LABEL_21:
              objc_exception_throw((id)[v16 exceptionWithName:v17 reason:v15 userInfo:v14]);
            }
          }
          ++v6;
        }
        while (v4 != v6);
        result = [a2 countByEnumeratingWithState:&v18 objects:v24 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (NSArray)elements
{
  return self->_elements;
}

- (NSString)name
{
  return self->_name;
}

- (NSFetchIndexDescription)initWithName:(NSString *)name elements:(NSArray *)elements
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!name)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't create an index with no name" userInfo:0]);
  }
  -[NSFetchIndexDescription _checkElements:]((uint64_t)self, elements);
  v16.receiver = self;
  v16.super_class = (Class)NSFetchIndexDescription;
  uint64_t v7 = [(NSFetchIndexDescription *)&v16 init];
  if (v7)
  {
    v7->_name = name;
    v7->_elements = (NSArray *)[(NSArray *)elements copy];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = [(NSArray *)elements countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(elements);
          }
          -[NSFetchIndexElementDescription _setIndexDescription:](*(void *)(*((void *)&v12 + 1) + 8 * v10++), v7);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)elements countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)_isMappedSinglePropertyIndex
{
  if (!a1) {
    return 0;
  }
  if ([*(id *)(a1 + 16) count] != 1) {
    return 0;
  }
  v2 = (void *)[*(id *)(a1 + 16) firstObject];
  if ([v2 collationType]) {
    return 0;
  }

  return [v2 isAscending];
}

- (void)dealloc
{
  self->_elements = 0;
  self->_name = 0;

  self->_entity = 0;
  self->_partialIndexPredicate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSFetchIndexDescription;
  [(NSFetchIndexDescription *)&v3 dealloc];
}

- (NSFetchIndexDescription)initWithCoder:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)NSFetchIndexDescription;
  uint64_t v4 = [(NSFetchIndexDescription *)&v33 init];
  if (v4)
  {
    uint64_t v5 = +[PFModelDecoderContext retainedContext];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v30 = __41__NSFetchIndexDescription_initWithCoder___block_invoke;
    v31 = &unk_1E544B868;
    v32 = v5;
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), @"NSIndexName");
    v4->_name = v8;
    if (v8 && ([(NSString *)v8 isNSString] & 1) == 0)
    {
      long long v20 = &unk_1ED7E1EE8;
      goto LABEL_28;
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    long long v12 = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0), @"NSIndexElements");
    v4->_elements = v12;
    if (v12)
    {
      if (![(NSArray *)v12 isNSArray])
      {
        long long v20 = &unk_1ED7E1F10;
        goto LABEL_28;
      }
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      elements = v4->_elements;
      uint64_t v14 = [(NSArray *)elements countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(elements);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, &unk_1ED7E1F38));

              goto LABEL_29;
            }
          }
          uint64_t v14 = [(NSArray *)elements countByEnumeratingWithState:&v25 objects:v34 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
    }
    uint64_t v17 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSEntity"];
    v4->_entity = (NSEntityDescription *)v17;
    if (!v17) {
      goto LABEL_23;
    }
    if (v5) {
      uint64_t v18 = (void *)v5[3];
    }
    else {
      uint64_t v18 = 0;
    }
    [v18 addObject:v17];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      long long v20 = &unk_1ED7E1F88;
    }
    else {
      long long v20 = &unk_1ED7E1F60;
    }
    if (v5 != 0 && (isKindOfClass & 1) != 0)
    {
      if (v5[2] || v5[1])
      {
LABEL_23:
        long long v21 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v22 = objc_opt_class();
        v4->_partialIndexPredicate = (NSPredicate *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0), @"NSPartialIndexPredicate");
        if (v5) {
          uint64_t v23 = (void *)v5[3];
        }
        else {
          uint64_t v23 = 0;
        }
        [v23 addObject:v4];
LABEL_30:
        v30((uint64_t)v29);
        return v4;
      }
      long long v20 = &unk_1ED7E1F88;
    }
LABEL_28:
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, v20));

LABEL_29:
    uint64_t v4 = 0;
    goto LABEL_30;
  }
  return v4;
}

void __41__NSFetchIndexDescription_initWithCoder___block_invoke(uint64_t a1)
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v4[1] = [(NSString *)self->_name copy];
    v4[3] = self->_entity;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    elements = self->_elements;
    uint64_t v7 = [(NSArray *)elements countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(elements);
          }
          uint64_t v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * i) copy];
          [v5 addObject:v11];
          -[NSFetchIndexElementDescription _setIndexDescription:]((uint64_t)v11, v4);
        }
        uint64_t v8 = [(NSArray *)elements countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    v4[2] = v5;
    v4[4] = [(NSPredicate *)self->_partialIndexPredicate copy];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_name forKey:@"NSIndexName"];
  [a3 encodeObject:self->_elements forKey:@"NSIndexElements"];
  [a3 encodeObject:self->_entity forKey:@"NSEntity"];
  partialIndexPredicate = self->_partialIndexPredicate;

  [a3 encodeObject:partialIndexPredicate forKey:@"NSPartialIndexPredicate"];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_23;
  }
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  name = self->_name;
  uint64_t v6 = [a3 name];
  if (name == (NSString *)v6
    || (uint64_t v7 = v6, LOBYTE(v6) = 0, name) && v7 && (LODWORD(v6) = -[NSString isEqual:](name, "isEqual:"), v6))
  {
    uint64_t v8 = [(NSEntityDescription *)self->_entity name];
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "entity"), "name");
    if (v8 == (NSString *)v6
      || (uint64_t v9 = v6, LOBYTE(v6) = 0, v8) && v9 && (LODWORD(v6) = -[NSString isEqual:](v8, "isEqual:"), v6))
    {
      elements = self->_elements;
      uint64_t v6 = [a3 elements];
      if (elements == (NSArray *)v6
        || (uint64_t v11 = v6, LOBYTE(v6) = 0, elements)
        && v11
        && (LODWORD(v6) = -[NSArray isEqual:](elements, "isEqual:"), v6))
      {
        partialIndexPredicate = self->_partialIndexPredicate;
        uint64_t v6 = [a3 partialIndexPredicate];
        if (partialIndexPredicate != (NSPredicate *)v6)
        {
          uint64_t v13 = v6;
          LOBYTE(v6) = 0;
          if (partialIndexPredicate && v13)
          {
            LOBYTE(v6) = -[NSPredicate isEqual:](partialIndexPredicate, "isEqual:");
          }
          return v6;
        }
LABEL_23:
        LOBYTE(v6) = 1;
      }
    }
  }
  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<NSFetchIndexDescription : (%@:%@, elements: %@, predicate: %@)>", -[NSEntityDescription name](self->_entity, "name"), self->_name, self->_elements, self->_partialIndexPredicate];
}

- (BOOL)_isEditable
{
  entity = self->_entity;
  return !entity || [(NSEntityDescription *)entity _isEditable];
}

- (void)_throwIfNotEditable
{
}

- (void)setName:(NSString *)name
{
  v10[1] = *MEMORY[0x1E4F143B8];
  [(NSFetchIndexDescription *)self _throwIfNotEditable];
  if (!name)
  {
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = @"IndexDescription";
    v10[0] = self;
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v8, @"Can't set an index name to nil", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }
  if (([(NSString *)self->_name isEqual:name] & 1) == 0)
  {
    entity = self->_entity;
    if (entity)
    {
      if ((*(unsigned char *)&entity->_entityDescriptionFlags & 4) != 0)
      {
        uint64_t rootentity = (uint64_t)entity->_rootentity;
      }
      else
      {
        do
        {
          uint64_t rootentity = (uint64_t)entity;
          entity = [(NSEntityDescription *)entity superentity];
        }
        while (entity);
      }
    }
    else
    {
      uint64_t rootentity = 0;
    }
    -[NSEntityDescription _validateIndexNameChangeFrom:to:](rootentity, self->_name, (uint64_t)name);
    uint64_t v7 = name;

    self->_name = name;
  }
}

- (void)setElements:(NSArray *)elements
{
  [(NSFetchIndexDescription *)self _throwIfNotEditable];
  -[NSFetchIndexDescription _checkElements:]((uint64_t)self, elements);
  id v5 = (NSArray *)[(NSArray *)elements copy];

  self->_elements = v5;
}

- (NSPredicate)partialIndexPredicate
{
  return self->_partialIndexPredicate;
}

- (void)setPartialIndexPredicate:(NSPredicate *)partialIndexPredicate
{
  [(NSFetchIndexDescription *)self _throwIfNotEditable];
  if (self->_partialIndexPredicate != partialIndexPredicate)
  {
    id v5 = partialIndexPredicate;

    self->_partialIndexPredicate = partialIndexPredicate;
  }
}

- (unint64_t)_validateCollationTypeChangeFrom:(uint64_t)a3 to:
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v5 = result;
    result = [*(id *)(result + 16) count];
    if (a2 != a3 && result <= 1)
    {
      uint64_t v6 = *MEMORY[0x1E4F1C3C8];
      uint64_t v7 = @"Index";
      v8[0] = v5;
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v6, @"Can't change an collation type in a multi-element index", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1)));
    }
  }
  return result;
}

- (uint64_t)_isPurelyModeledIndex
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    v1 = *(void **)(result + 16);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v7;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v1);
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * i), "property"), "_propertyType") == 5) {
            return 0;
          }
        }
        uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
    return 1;
  }
  return result;
}

- (uint64_t)_isIndexForProperty:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if ([*(id *)(a1 + 16) count] != 1) {
    return 0;
  }
  uint64_t v4 = (void *)[*(id *)(a1 + 16) firstObject];
  if (!objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v4, "property"), "name"))|| objc_msgSend(v4, "collationType"))
  {
    return 0;
  }

  return [v4 isAscending];
}

- (uint64_t)_compoundIndexRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a1
    || ![*(id *)(a1 + 16) count]
    || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "firstObject"), "collationType")
    || [*(id *)(a1 + 16) count] == 1)
  {
    return 0;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v4 = *(void **)(a1 + 16);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) property];
        uint64_t v10 = [v9 _propertyType];
        if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 2
          && (v10 != 5
           || !+[_PFRoutines _expressionIsCompoundIndexCompatible:]((uint64_t)_PFRoutines, (void *)[v9 expression])))
        {
          return 0;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);
  }
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v11 = *(void **)(a1 + 16);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (!v12) {
    return v2;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v24;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v24 != v14) {
        objc_enumerationMutation(v11);
      }
      long long v16 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v15) property];
      uint64_t v17 = [v16 _propertyType];
      if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 2)
      {
        uint64_t v18 = [v16 name];
        goto LABEL_24;
      }
      if (v17 == 5
        && +[_PFRoutines _expressionIsCompoundIndexCompatible:]((uint64_t)_PFRoutines, (void *)[v16 expression]))
      {
        uint64_t v21 = objc_msgSend((id)objc_msgSend(v16, "expression"), "expressionType");
        if (v21 == 3)
        {
          uint64_t v18 = objc_msgSend((id)objc_msgSend(v16, "expression"), "keyPath");
LABEL_24:
          long long v19 = (__CFString *)v18;
          long long v20 = (void *)v2;
LABEL_25:
          [v20 addObject:v19];
          goto LABEL_31;
        }
        if (v21 == 1)
        {
          long long v20 = (void *)v2;
          long long v19 = @"self";
          goto LABEL_25;
        }
      }
LABEL_31:
      ++v15;
    }
    while (v13 != v15);
    uint64_t v22 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    uint64_t v13 = v22;
  }
  while (v22);
  return v2;
}

- (uint64_t)_isUnique
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    v1 = *(void **)(result + 16);
    result = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = *(void *)v7;
      while (2)
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v7 != v3) {
            objc_enumerationMutation(v1);
          }
          uint64_t v5 = *(void *)(*((void *)&v6 + 1) + 8 * v4);
          if (v5 && (*(unsigned char *)(v5 + 40) & 4) != 0) {
            return 1;
          }
          ++v4;
        }
        while (v2 != v4);
        result = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v2 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_setIsUnique:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = *(void **)(result + 16);
    result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v10;
      if (a2) {
        int v6 = 4;
      }
      else {
        int v6 = 0;
      }
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * v7);
          if (v8) {
            *(_DWORD *)(v8 + 40) = *(_DWORD *)(v8 + 40) & 0xFFFFFFFB | v6;
          }
          ++v7;
        }
        while (v4 != v7);
        result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (int64_t)_compare:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 1;
  }
  if (-[NSString isEqualToString:](-[NSEntityDescription name](-[NSFetchIndexDescription entity](self, "entity"), "name"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "entity"), "name")))
  {
    NSUInteger v5 = [(NSArray *)self->_elements count];
    if (v5 == [*((id *)a3 + 2) count])
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      elements = self->_elements;
      int64_t result = [(NSArray *)elements countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (result)
      {
        int64_t v8 = result;
        uint64_t v9 = *(void *)v33;
        uint64_t v25 = *(void *)v33;
        while (1)
        {
          uint64_t v10 = 0;
          int64_t v26 = v8;
          while (2)
          {
            if (*(void *)v33 != v9) {
              objc_enumerationMutation(elements);
            }
            long long v11 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v12 = (void *)*((void *)a3 + 2);
            uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (!v13) {
              return -1;
            }
            uint64_t v14 = v13;
            uint64_t v27 = v10;
            char v15 = 0;
            uint64_t v16 = *(void *)v29;
            while (2)
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v29 != v16) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend(v11, "propertyName"), "isEqualToString:", objc_msgSend(v18, "propertyName")))
                {
                  uint64_t v19 = [v11 collationType];
                  if (v19 != [v18 collationType])
                  {
                    unint64_t v24 = [v11 collationType];
                    BOOL v23 = v24 >= [v18 collationType];
                    goto LABEL_29;
                  }
                  char v15 = 1;
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
              if (v14) {
                continue;
              }
              break;
            }
            if ((v15 & 1) == 0) {
              return -1;
            }
            uint64_t v10 = v27 + 1;
            uint64_t v9 = v25;
            if (v27 + 1 != v26) {
              continue;
            }
            break;
          }
          int64_t v8 = [(NSArray *)elements countByEnumeratingWithState:&v32 objects:v37 count:16];
          int64_t result = 0;
          if (!v8) {
            return result;
          }
        }
      }
    }
    else
    {
      unint64_t v22 = [(NSArray *)self->_elements count];
      BOOL v23 = v22 >= [*((id *)a3 + 2) count];
LABEL_29:
      if (v23) {
        return 1;
      }
      else {
        return -1;
      }
    }
  }
  else
  {
    long long v20 = [(NSEntityDescription *)[(NSFetchIndexDescription *)self entity] name];
    uint64_t v21 = objc_msgSend((id)objc_msgSend(a3, "entity"), "name");
    return [(NSString *)v20 compare:v21];
  }
  return result;
}

@end