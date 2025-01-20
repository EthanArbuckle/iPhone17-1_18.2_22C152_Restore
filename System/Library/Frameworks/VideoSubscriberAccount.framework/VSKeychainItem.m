@interface VSKeychainItem
- (BOOL)hasChanges;
- (BOOL)hasFaultForData;
- (BOOL)hasPersistentChangedValues;
- (BOOL)isDeleted;
- (BOOL)isInserted;
- (BOOL)isUpdated;
- (NSData)data;
- (NSMutableDictionary)committedValues;
- (NSMutableDictionary)primitiveValues;
- (VSKeychainEditingContext)editingContext;
- (VSKeychainItem)init;
- (VSKeychainItem)initWithItemKind:(id)a3 insertIntoEditingContext:(id)a4;
- (VSKeychainItemKind)itemKind;
- (id)changedValues;
- (id)committedValueForKey:(id)a3;
- (id)committedValuesForKeys:(id)a3;
- (id)description;
- (id)primitiveValueForKey:(id)a3;
- (void)_setCommittedValues:(id)a3 registeringUndo:(BOOL)a4;
- (void)setCommittedValues:(id)a3;
- (void)setData:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setEditingContext:(id)a3;
- (void)setHasFaultForData:(BOOL)a3;
- (void)setInserted:(BOOL)a3;
- (void)setPrimitiveValue:(id)a3 forKey:(id)a4;
- (void)setPrimitiveValues:(id)a3;
- (void)setUpdated:(BOOL)a3;
- (void)willAccessValueForKey:(id)a3;
- (void)willChangeValueForKey:(id)a3;
@end

@implementation VSKeychainItem

- (VSKeychainItem)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSKeychainItem)initWithItemKind:(id)a3 insertIntoEditingContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The itemKind parameter must not be nil."];
  }
  v16.receiver = self;
  v16.super_class = (Class)VSKeychainItem;
  v8 = [(VSKeychainItem *)&v16 init];
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    committedValues = v8->_committedValues;
    v8->_committedValues = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    primitiveValues = v8->_primitiveValues;
    v8->_primitiveValues = v11;

    uint64_t v13 = [v6 copy];
    itemKind = v8->_itemKind;
    v8->_itemKind = (VSKeychainItemKind *)v13;

    objc_storeWeak((id *)&v8->_editingContext, v7);
    [v7 insertItem:v8];
  }

  return v8;
}

- (void)setDeleted:(BOOL)a3
{
  if (self->_deleted != a3)
  {
    v5 = [(VSKeychainItem *)self editingContext];
    id v6 = [v5 undoManager];
    id v7 = [v6 prepareWithInvocationTarget:self];
    [v7 setDeleted:self->_deleted];

    self->_deleted = a3;
  }
}

- (void)setInserted:(BOOL)a3
{
  if (self->_inserted != a3)
  {
    v5 = [(VSKeychainItem *)self editingContext];
    id v6 = [v5 undoManager];
    id v7 = [v6 prepareWithInvocationTarget:self];
    [v7 setInserted:self->_inserted];

    self->_inserted = a3;
  }
}

- (void)setUpdated:(BOOL)a3
{
  if (self->_updated != a3)
  {
    v5 = [(VSKeychainItem *)self editingContext];
    id v6 = [v5 undoManager];
    id v7 = [v6 prepareWithInvocationTarget:self];
    [v7 setUpdated:self->_updated];

    self->_updated = a3;
  }
}

- (void)_setCommittedValues:(id)a3 registeringUndo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (NSMutableDictionary *)a3;
  if (self->_committedValues != v6)
  {
    v12 = v6;
    if (v4)
    {
      id v7 = [(VSKeychainItem *)self editingContext];
      v8 = [v7 undoManager];
      v9 = [v8 prepareWithInvocationTarget:self];
      [v9 _setCommittedValues:self->_committedValues registeringUndo:1];
    }
    v10 = (NSMutableDictionary *)[(NSMutableDictionary *)v12 mutableCopy];
    committedValues = self->_committedValues;
    self->_committedValues = v10;

    id v6 = v12;
  }
}

- (void)setPrimitiveValues:(id)a3
{
  if (self->_primitiveValues != a3)
  {
    self->_primitiveValues = (NSMutableDictionary *)[a3 mutableCopy];
    MEMORY[0x1F41817F8]();
  }
}

- (BOOL)hasChanges
{
  if ([(VSKeychainItem *)self isInserted] || [(VSKeychainItem *)self isUpdated]) {
    return 1;
  }

  return [(VSKeychainItem *)self isDeleted];
}

- (BOOL)hasPersistentChangedValues
{
  v2 = [(VSKeychainItem *)self changedValues];
  uint64_t v3 = [v2 count];

  return v3 != 0;
}

- (id)primitiveValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(VSKeychainItem *)self itemKind];
  id v6 = [v5 attributesByName];
  id v7 = [v6 objectForKey:v4];

  v8 = [(VSKeychainItem *)self primitiveValues];
  v9 = [v8 objectForKey:v4];

  if (!v9)
  {
    v9 = [v7 defaultValue];
  }

  return v9;
}

- (void)setPrimitiveValue:(id)a3 forKey:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if ([(VSKeychainItem *)self isDeleted]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Attempting to modify a deleted object."];
  }
  id v7 = [(VSKeychainItem *)self primitiveValues];
  v8 = v7;
  if (v15)
  {
    [v7 setObject:v15 forKey:v6];
  }
  else
  {
    v9 = [(VSKeychainItem *)self itemKind];
    v10 = [v9 attributesByName];
    v11 = [v10 objectForKey:v6];

    v12 = [v11 defaultValue];
    if (v12) {
      [v8 setObject:v12 forKey:v6];
    }
    else {
      [v8 removeObjectForKey:v6];
    }
  }
  if (![(VSKeychainItem *)self isInserted])
  {
    uint64_t v13 = [(VSKeychainItem *)self changedValues];
    uint64_t v14 = [v13 count];

    [(VSKeychainItem *)self setUpdated:v14 != 0];
  }
}

- (id)committedValuesForKeys:(id)a3
{
  id v4 = a3;
  v5 = [(VSKeychainItem *)self committedValues];
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 dictionaryWithValuesForKeys:v4];

    id v6 = (void *)v7;
  }

  return v6;
}

- (id)committedValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(VSKeychainItem *)self committedValues];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)changedValues
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(VSKeychainItem *)self itemKind];
  v5 = [v4 attributesByName];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v21 = v5;
  id v6 = [v5 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v12 = [(VSKeychainItem *)self committedValueForKey:v11];
        uint64_t v13 = [(VSKeychainItem *)self primitiveValueForKey:v11];
        id v14 = v12;
        id v15 = v13;
        objc_super v16 = v15;
        if (v14 == v15)
        {

          goto LABEL_17;
        }
        if (v14) {
          BOOL v17 = v15 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {

          if (!v16)
          {
            v18 = [MEMORY[0x1E4F1CA98] null];
            [v3 setObject:v18 forKey:v11];

            goto LABEL_17;
          }
LABEL_16:
          [v3 setObject:v16 forKey:v11];
          goto LABEL_17;
        }
        char v19 = [v14 isEqual:v15];

        if ((v19 & 1) == 0) {
          goto LABEL_16;
        }
LABEL_17:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  return v3;
}

- (void)willChangeValueForKey:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VSKeychainItem;
  id v4 = a3;
  [(VSKeychainItem *)&v9 willChangeValueForKey:v4];
  v5 = -[VSKeychainItem valueForKey:](self, "valueForKey:", v4, v9.receiver, v9.super_class);
  id v6 = [(VSKeychainItem *)self editingContext];
  uint64_t v7 = [v6 undoManager];
  uint64_t v8 = [v7 prepareWithInvocationTarget:self];
  [v8 setValue:v5 forKey:v4];
}

- (void)willAccessValueForKey:(id)a3
{
  if ([a3 isEqual:@"data"]
    && [(VSKeychainItem *)self hasFaultForData])
  {
    id v4 = [(VSKeychainItem *)self editingContext];
    [v4 fulfillFault:self];
  }
}

- (NSData)data
{
  [(VSKeychainItem *)self willAccessValueForKey:@"data"];
  id v3 = [(VSKeychainItem *)self primitiveValueForKey:@"data"];
  [(VSKeychainItem *)self didAccessValueForKey:@"data"];

  return (NSData *)v3;
}

- (void)setData:(id)a3
{
  id v4 = (id)[a3 copy];
  [(VSKeychainItem *)self willChangeValueForKey:@"data"];
  [(VSKeychainItem *)self setPrimitiveValue:v4 forKey:@"data"];
  [(VSKeychainItem *)self didChangeValueForKey:@"data"];
}

- (id)description
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [(VSKeychainItem *)self itemKind];
  id v4 = [v3 attributesByName];

  long long v25 = v4;
  v5 = [v4 allKeys];
  id v6 = [v5 sortedArrayUsingSelector:sel_compare_];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v12 = [v25 objectForKey:v11];
        uint64_t v13 = [v12 secItemAttributeKey];
        id v14 = [(VSKeychainItem *)self primitiveValues];
        id v15 = [v14 objectForKey:v11];

        objc_super v16 = [(VSKeychainItem *)self committedValues];
        BOOL v17 = [v16 objectForKey:v11];

        v18 = [NSString stringWithFormat:@"%@(%@) = %@(%@)", v11, v13, v15, v17];
        [v26 addObject:v18];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }

  char v19 = NSString;
  v27.receiver = self;
  v27.super_class = (Class)VSKeychainItem;
  v20 = [(VSKeychainItem *)&v27 description];
  v21 = [v26 componentsJoinedByString:@","];
  long long v22 = [v19 stringWithFormat:@"<%@ %@>", v20, v21];

  return v22;
}

- (VSKeychainEditingContext)editingContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingContext);

  return (VSKeychainEditingContext *)WeakRetained;
}

- (void)setEditingContext:(id)a3
{
}

- (VSKeychainItemKind)itemKind
{
  return self->_itemKind;
}

- (BOOL)isInserted
{
  return self->_inserted;
}

- (BOOL)isUpdated
{
  return self->_updated;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (NSMutableDictionary)committedValues
{
  return self->_committedValues;
}

- (void)setCommittedValues:(id)a3
{
}

- (NSMutableDictionary)primitiveValues
{
  return self->_primitiveValues;
}

- (BOOL)hasFaultForData
{
  return self->_hasFaultForData;
}

- (void)setHasFaultForData:(BOOL)a3
{
  self->_hasFaultForData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primitiveValues, 0);
  objc_storeStrong((id *)&self->_committedValues, 0);
  objc_storeStrong((id *)&self->_itemKind, 0);

  objc_destroyWeak((id *)&self->_editingContext);
}

@end