@interface NSArray
- (id)enui_map:(id)a3;
@end

@implementation NSArray

- (id)enui_map:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
          if (v11) {
            objc_msgSend(v5, "addObject:", v11, (void)v13);
          }
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = [(NSArray *)self copy];
  }

  return v5;
}

@end