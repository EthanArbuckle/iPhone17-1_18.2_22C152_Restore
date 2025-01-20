@interface IKVideoElement
- (NSArray)timelines;
@end

@implementation IKVideoElement

- (NSArray)timelines
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(IKViewElement *)self children];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v9 = [v8 elementName];
        int v10 = [v9 isEqualToString:@"timeline"];

        if (v10)
        {
          if (!v5)
          {
            v5 = [MEMORY[0x1E4F1CA48] array];
          }
          [v5 addObject:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  if ([v5 count]) {
    v11 = v5;
  }
  else {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

@end