@interface NSDictionary(PickableRoute)
- (uint64_t)matchesUID:()PickableRoute;
@end

@implementation NSDictionary(PickableRoute)

- (uint64_t)matchesUID:()PickableRoute
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[a1 objectForKey:AVController_RouteDescriptionKey_RouteUID];
  if (v5 && [v5 rangeOfString:a3] != 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  uint64_t result = [a1 objectForKey:AVController_RouteDescriptionKey_AlternateUIDs];
  if (result)
  {
    v7 = (void *)result;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t result = [(id)result countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (result)
    {
      uint64_t v8 = result;
      uint64_t v9 = *(void *)v13;
LABEL_6:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (v11)
        {
          if ([v11 rangeOfString:a3] != 0x7FFFFFFFFFFFFFFFLL) {
            return 1;
          }
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          uint64_t result = 0;
          if (v8) {
            goto LABEL_6;
          }
          return result;
        }
      }
    }
  }
  return result;
}

@end