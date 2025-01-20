@interface IKMediaElement
- (IKViewElement)relatedContent;
- (NSArray)assets;
- (unint64_t)scrubBehavior;
@end

@implementation IKMediaElement

- (unint64_t)scrubBehavior
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"scrubBehavior"];

  unint64_t v4 = [v3 isEqualToString:@"delayed"];
  return v4;
}

- (NSArray)assets
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
        int v10 = [v9 isEqualToString:@"asset"];

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

- (IKViewElement)relatedContent
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(IKViewElement *)self children];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v8 = [v7 elementName];
        int v9 = [v8 isEqualToString:@"relatedContent"];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return (IKViewElement *)v10;
}

@end