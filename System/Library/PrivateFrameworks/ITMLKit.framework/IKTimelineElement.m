@interface IKTimelineElement
- (IKTextElement)title;
- (NSArray)events;
- (NSURL)url;
- (double)refreshInterval;
- (unint64_t)timelineType;
@end

@implementation IKTimelineElement

- (IKTextElement)title
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(IKViewElement *)self children];
  id v3 = (id)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v7 = [v6 elementName];
        if (v7 == @"title")
        {
          uint64_t v8 = [v6 textStyle];

          if (v8 == 1)
          {
            id v3 = v6;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (IKTextElement *)v3;
}

- (NSArray)events
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
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v9 = [v8 elementName];
        int v10 = [v9 isEqualToString:@"event"];

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
    long long v11 = v5;
  }
  else {
    long long v11 = 0;
  }
  long long v12 = v11;

  return v12;
}

- (unint64_t)timelineType
{
  v2 = [(IKViewElement *)self attributes];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"type"];

  if ([v3 isEqualToString:@"scenes"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"interstitials"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (NSURL)url
{
  v2 = [(IKViewElement *)self attributes];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"src"];

  if ([v3 length])
  {
    unint64_t v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v5 = [v3 stringByTrimmingCharactersInSet:v4];

    uint64_t v3 = [v5 stringByRemovingPercentEncoding];

    uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSURL *)v6;
}

- (double)refreshInterval
{
  v2 = [(IKViewElement *)self attributes];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"refreshInterval"];

  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

@end