@interface ComponentAccessoryUSB
- (BOOL)isPresent;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentAccessoryUSB

- (BOOL)isPresent
{
  v2 = +[EAAccessoryManager sharedAccessoryManager];
  v3 = [v2 connectedAccessories];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)populateAttributes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = +[EAAccessoryManager sharedAccessoryManager];
  v6 = [v5 connectedAccessories];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12 = [v11 modelNumber];

        if (v12)
        {
          v13 = [v11 modelNumber];
          [v4 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v4 count]) {
    [v3 setObject:v4 forKeyedSubscript:@"USBModelNumbers"];
  }
}

@end