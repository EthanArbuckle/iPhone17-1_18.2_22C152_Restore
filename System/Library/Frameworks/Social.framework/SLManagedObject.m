@interface SLManagedObject
- (id)objectOfClass:(Class)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setValuesWithObject:(id)a3;
@end

@implementation SLManagedObject

- (void)encodeWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SLManagedObject *)self entity];
  v6 = [v5 attributesByName];
  v7 = [v6 allKeys];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v14 = -[SLManagedObject valueForKey:](self, "valueForKey:", v13, (void)v15);
        [v4 encodeObject:v14 forKey:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (id)objectOfClass:(Class)a3
{
  v5 = [(SLManagedObject *)self entity];
  v6 = [v5 attributesByName];
  v7 = [v6 allKeys];

  id v8 = [(SLManagedObject *)self dictionaryWithValuesForKeys:v7];
  id v9 = objc_alloc_init(a3);
  [v9 setValuesForKeysWithDictionary:v8];
  uint64_t v10 = [(SLManagedObject *)self objectID];
  uint64_t v11 = [v10 URIRepresentation];
  [v9 setValue:v11 forKey:@"objectID"];

  return v9;
}

- (void)setValuesWithObject:(id)a3
{
  id v4 = a3;
  v5 = [(SLManagedObject *)self entity];
  v6 = [v5 attributesByName];
  id v8 = [v6 allKeys];

  v7 = [v4 dictionaryWithValuesForKeys:v8];

  [(SLManagedObject *)self setValuesForKeysWithDictionary:v7];
}

@end