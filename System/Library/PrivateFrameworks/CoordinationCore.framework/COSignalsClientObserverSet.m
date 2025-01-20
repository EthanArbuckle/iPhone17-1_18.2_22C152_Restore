@interface COSignalsClientObserverSet
- (NSSet)constraints;
- (void)addClientObserver:(id)a3 forNotificationName:(id)a4;
@end

@implementation COSignalsClientObserverSet

- (NSSet)constraints
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v4 = [(COClientObserverSet *)self clientObservers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [v9 constraints];
          if (v10) {
            [v3 unionSet:v10];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  v11 = (void *)[v3 copy];

  return (NSSet *)v11;
}

- (void)addClientObserver:(id)a3 forNotificationName:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)COSignalsClientObserverSet;
  [(COClientObserverSet *)&v4 addClientObserver:a3 forNotificationName:a4];
}

@end