@interface NSDictionary
- (id)bds_subDictionaryWithKeys:(id)a3;
@end

@implementation NSDictionary

- (id)bds_subDictionaryWithKeys:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = -[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v11, (void)v15);
        [v5 setObject:v12 forKeyedSubscript:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = [v5 copy];
  return v13;
}

@end