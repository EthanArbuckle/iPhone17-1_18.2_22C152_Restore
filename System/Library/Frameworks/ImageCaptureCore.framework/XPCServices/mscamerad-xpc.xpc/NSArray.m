@interface NSArray
- (id)copyGroupIntoDictionary:(id)a3;
@end

@implementation NSArray

- (id)copyGroupIntoDictionary:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = +[NSMutableDictionary dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = self;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v12 = v4[2](v4, v11);
        if (v12)
        {
          v13 = objc_msgSend(v5, "objectForKeyedSubscript:", v12, (void)v16);
          if (!v13)
          {
            v13 = +[NSMutableArray array];
            [v5 setObject:v13 forKeyedSubscript:v12];
          }
          [v13 addObject:v11];
        }
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = [v5 copy];
  return v14;
}

@end