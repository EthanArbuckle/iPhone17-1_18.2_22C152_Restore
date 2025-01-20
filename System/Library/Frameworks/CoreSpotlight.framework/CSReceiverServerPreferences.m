@interface CSReceiverServerPreferences
- (CSReceiverServerPreferences)init;
- (NSSet)disabledServices;
- (void)disableService:(id)a3;
- (void)enableService:(id)a3;
@end

@implementation CSReceiverServerPreferences

- (CSReceiverServerPreferences)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSReceiverServerPreferences;
  v2 = [(CSReceiverServerPreferences *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CoreSpotlightPreferences *)v2 setState_key:@"CSReceiverServiceIdentifierState"];
    [(CoreSpotlightPreferences *)v3 setNotification_key:"com.apple.corespotlight.receiver.service.changed"];
  }
  return v3;
}

- (NSSet)disabledServices
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = [(CoreSpotlightPreferences *)self state_key];
  objc_super v5 = (void *)CFPreferencesCopyValue(v4, @"com.apple.corespotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v3, "addObject:", v11, (void)v13);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }

  return (NSSet *)v3;
}

- (void)disableService:(id)a3
{
  id v7 = a3;
  if ([v7 length])
  {
    v4 = [(CSReceiverServerPreferences *)self disabledServices];
    if (([v4 containsObject:v7] & 1) == 0)
    {
      objc_super v5 = (void *)[v4 mutableCopy];
      [v5 addObject:v7];
      id v6 = [v5 allObjects];
      [(CoreSpotlightPreferences *)self saveState:v6];
    }
  }
}

- (void)enableService:(id)a3
{
  id v7 = a3;
  if ([v7 length])
  {
    v4 = [(CSReceiverServerPreferences *)self disabledServices];
    if ([v4 containsObject:v7])
    {
      objc_super v5 = (void *)[v4 mutableCopy];
      [v5 removeObject:v7];
      id v6 = [v5 allObjects];
      [(CoreSpotlightPreferences *)self saveState:v6];
    }
  }
}

@end