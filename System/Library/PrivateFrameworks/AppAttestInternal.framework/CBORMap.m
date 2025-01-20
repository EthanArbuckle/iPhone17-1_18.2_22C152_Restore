@interface CBORMap
- (CBORMap)init;
- (id)getSortedKeys;
- (int)fieldType;
- (void)setKey:(id)a3 value:(id)a4;
- (void)write:(id)a3;
@end

@implementation CBORMap

- (int)fieldType
{
  return 5;
}

- (CBORMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBORMap;
  v2 = [(CBORMap *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    m_data = v2->m_data;
    v2->m_data = (NSMapTable *)v3;
  }
  return v2;
}

- (void)setKey:(id)a3 value:(id)a4
{
}

- (id)getSortedKeys
{
  v2 = NSAllMapTableKeys(self->m_data);
  uint64_t v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_0];

  return v3;
}

uint64_t __24__CBORMap_getSortedKeys__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)write:(id)a3
{
  id v11 = a3;
  id v4 = [(CBORMap *)self getSortedKeys];
  id v5 = [v4 objectEnumerator];
  [(CBORValue *)self encodeStartItems:[(NSMapTable *)self->m_data count] output:v11];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    int v7 = (void *)v6;
    uint64_t v8 = 0;
    do
    {
      v9 = v8;
      uint64_t v8 = [(NSMapTable *)self->m_data objectForKey:v7];

      [v7 write:v11];
      [v8 write:v11];
      uint64_t v10 = [v5 nextObject];

      int v7 = (void *)v10;
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
}

@end