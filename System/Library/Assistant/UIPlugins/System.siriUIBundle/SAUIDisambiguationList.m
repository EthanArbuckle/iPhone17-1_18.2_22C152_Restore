@interface SAUIDisambiguationList
- (id)_systemPlugin_failureCommandsForCode:(int64_t)a3;
@end

@implementation SAUIDisambiguationList

- (id)_systemPlugin_failureCommandsForCode:(int64_t)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(SAUIDisambiguationList *)self fallbackCommands];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v11 code] == (id)a3)
        {
          v12 = [v11 commands];
          if (v12) {
            [v5 addObjectsFromArray:v12];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    v13 = v5;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

@end