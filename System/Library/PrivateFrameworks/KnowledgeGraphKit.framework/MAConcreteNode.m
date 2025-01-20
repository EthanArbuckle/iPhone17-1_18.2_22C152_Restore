@interface MAConcreteNode
- (BOOL)hasProperties;
- (MAConcreteNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
- (float)weight;
- (id)label;
- (id)propertyDictionary;
- (id)propertyForKey:(id)a3;
- (id)propertyKeys;
- (unint64_t)propertiesCount;
- (unsigned)domain;
- (void)enumeratePropertiesUsingBlock:(id)a3;
@end

@implementation MAConcreteNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

- (id)label
{
  return self->_label;
}

- (float)weight
{
  return self->_weight;
}

- (unsigned)domain
{
  return self->_domain;
}

- (void)enumeratePropertiesUsingBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, void *, char *))a3;
  v5 = self;
  objc_sync_enter(v5);
  properties = v5->_properties;
  if (properties)
  {
    char v17 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v7 = [(NSMutableDictionary *)properties keyEnumerator];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        v12 = [(NSMutableDictionary *)v5->_properties objectForKeyedSubscript:v11];
        v4[2](v4, v11, v12, &v17);

        if (v17) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  objc_sync_exit(v5);
}

- (id)propertyDictionary
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v2->_properties];
  objc_sync_exit(v2);

  return v3;
}

- (id)propertyKeys
{
  v2 = self;
  objc_sync_enter(v2);
  properties = v2->_properties;
  if (properties && [(NSMutableDictionary *)properties count])
  {
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    v5 = [(NSMutableDictionary *)v2->_properties allKeys];
    v6 = [v4 setWithArray:v5];
  }
  else
  {
    v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  objc_sync_exit(v2);

  return v6;
}

- (unint64_t)propertiesCount
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(NSMutableDictionary *)v2->_properties count];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)hasProperties
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSMutableDictionary *)v2->_properties count] != 0;
  objc_sync_exit(v2);

  return v3;
}

- (id)propertyForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  properties = v5->_properties;
  if (properties)
  {
    v7 = [(NSMutableDictionary *)properties objectForKeyedSubscript:v4];
  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v5);

  return v7;
}

- (MAConcreteNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MAConcreteNode;
  v12 = [(MANode *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    label = v12->_label;
    v12->_label = (NSString *)v13;

    v12->_domain = a4;
    v12->_weight = a5;
    uint64_t v15 = [v11 mutableCopy];
    properties = v12->_properties;
    v12->_properties = (NSMutableDictionary *)v15;
  }
  return v12;
}

@end