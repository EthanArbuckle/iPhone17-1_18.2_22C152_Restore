@interface IKTimelineEventElement
- (IKViewElement)relatedContent;
- (NSDate)startDate;
- (double)duration;
- (double)offset;
@end

@implementation IKTimelineEventElement

- (double)offset
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"offset"];

  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

- (NSDate)startDate
{
  return 0;
}

- (double)duration
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"duration"];

  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
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