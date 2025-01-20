@interface SecCBORMap
- (SecCBORMap)init;
- (id)dictionaryRepresentation;
- (id)getSortedKeys;
- (int)fieldType;
- (void)setKey:(id)a3 value:(id)a4;
- (void)write:(id)a3;
@end

@implementation SecCBORMap

- (void).cxx_destruct
{
}

- (void)write:(id)a3
{
  id v11 = a3;
  v4 = [(SecCBORMap *)self getSortedKeys];
  v5 = [v4 objectEnumerator];
  [(SecCBORValue *)self encodeStartItems:[(NSMapTable *)self->m_data count] output:v11];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = 0;
    do
    {
      v9 = v8;
      v8 = [(NSMapTable *)self->m_data objectForKey:v7];

      [v7 write:v11];
      [v8 write:v11];
      uint64_t v10 = [v5 nextObject];

      v7 = (void *)v10;
    }
    while (v10);
  }
}

- (id)dictionaryRepresentation
{
  return [(NSMapTable *)self->m_data dictionaryRepresentation];
}

- (id)getSortedKeys
{
  v2 = NSAllMapTableKeys(self->m_data);
  v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_13629];

  return v3;
}

uint64_t __27__SecCBORMap_getSortedKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 fieldType];
  int v7 = [v5 fieldType];
  if (v6 >= v7)
  {
    if (v6 <= v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()) {
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      }
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v8 = [v4 compare:v5];
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = -1;
  }

  return v8;
}

- (void)setKey:(id)a3 value:(id)a4
{
}

- (SecCBORMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)SecCBORMap;
  v2 = [(SecCBORMap *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    m_data = v2->m_data;
    v2->m_data = (NSMapTable *)v3;
  }
  return v2;
}

- (int)fieldType
{
  return 5;
}

@end