@interface FBKManagedLocalIDObject
+ (id)transformJSONArrayIntoLocalIDJSON:(id)a3 uniquingPrefix:(id)a4;
+ (id)transformJSONDictionaryIntoLocalIDJSON:(id)a3 uniquingPrefix:(id)a4;
+ (id)uniquingKey;
- (void)setID:(id)a3;
- (void)setPropertiesForLocalIDKeys:(id)a3;
@end

@implementation FBKManagedLocalIDObject

+ (id)uniquingKey
{
  return &stru_26DDF6A30;
}

+ (id)transformJSONArrayIntoLocalIDJSON:(id)a3 uniquingPrefix:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(a1, "transformJSONDictionaryIntoLocalIDJSON:uniquingPrefix:", *(void *)(*((void *)&v17 + 1) + 8 * i), v7, (void)v17);
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v9;
}

+ (id)transformJSONDictionaryIntoLocalIDJSON:(id)a3 uniquingPrefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[v6 mutableCopy];
  if (v7)
  {
    v9 = NSString;
    id v10 = [a1 uniquingKey];
    uint64_t v11 = [v6 objectForKeyedSubscript:v10];
    uint64_t v12 = FBKNilIfNSNull(v11);
    uint64_t v13 = [v9 stringWithFormat:@"%@-%@", v7, v12];
  }
  else
  {
    id v10 = [a1 uniquingKey];
    uint64_t v11 = [v6 objectForKeyedSubscript:v10];
    uint64_t v13 = FBKNilIfNSNull(v11);
  }

  if (v13)
  {
    v14 = [v6 objectForKeyedSubscript:@"id"];
    [v8 setObject:v14 forKeyedSubscript:@"serverID"];

    v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "hash"));
    [v8 setObject:v15 forKeyedSubscript:@"id"];

    v16 = [NSDictionary dictionaryWithDictionary:v8];
  }
  else
  {
    long long v17 = (void *)MEMORY[0x263EFF940];
    uint64_t v18 = *MEMORY[0x263EFF498];
    long long v19 = [a1 uniquingKey];

    v16 = 0;
  }

  return v16;
}

- (void)setID:(id)a3
{
  id v4 = a3;
  [(FBKManagedLocalIDObject *)self willChangeValueForKey:@"ID"];
  [(FBKManagedLocalIDObject *)self setServerID:v4];

  [(FBKManagedLocalIDObject *)self didChangeValueForKey:@"ID"];
}

- (void)setPropertiesForLocalIDKeys:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"serverID"];
  [(FBKManagedLocalIDObject *)self setServerID:v4];
}

@end