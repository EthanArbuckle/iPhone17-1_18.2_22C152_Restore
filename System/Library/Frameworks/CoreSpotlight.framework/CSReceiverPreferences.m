@interface CSReceiverPreferences
- (CSReceiverPreferences)init;
- (NSDictionary)dictionary;
- (void)disableBundleIdentifier:(id)a3;
- (void)enableBundleIdentifier:(id)a3;
@end

@implementation CSReceiverPreferences

- (CSReceiverPreferences)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSReceiverPreferences;
  v2 = [(CSReceiverPreferences *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CoreSpotlightPreferences *)v2 setState_key:@"CSReceiverBundleIdentifierState"];
    [(CoreSpotlightPreferences *)v3 setNotification_key:"com.apple.corespotlight.receiver.bundle.changed"];
  }
  return v3;
}

- (NSDictionary)dictionary
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(CoreSpotlightPreferences *)self state_key];
  v3 = (void *)CFPreferencesCopyValue(v2, @"com.apple.corespotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (void *)[v3 mutableCopy];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    uint64_t v7 = (uint64_t)v5;
    if (v6)
    {
      uint64_t v8 = v6;
      char v9 = 0;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v13 = +[CSXPCConnection appIdentifierFromTeamAppTuple:v12];
            if ([v13 length])
            {
              [v4 removeObjectForKey:v12];
              v14 = [v4 objectForKeyedSubscript:v13];

              if (!v14)
              {
                v15 = [v5 objectForKeyedSubscript:v12];
                [v4 setObject:v15 forKeyedSubscript:v13];
              }
              char v9 = 1;
            }
          }
          else
          {
            objc_msgSend(v4, "removeObjectForKey:", v12, (void)v17);
            char v9 = 1;
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);

      if ((v9 & 1) == 0) {
        goto LABEL_19;
      }
      uint64_t v7 = [v4 copy];
    }

    id v5 = (id)v7;
LABEL_19:

    goto LABEL_21;
  }

  id v5 = (id)MEMORY[0x1E4F1CC08];
LABEL_21:

  return (NSDictionary *)v5;
}

- (void)disableBundleIdentifier:(id)a3
{
  id v7 = a3;
  if ([v7 length])
  {
    v4 = [(CSReceiverPreferences *)self dictionary];
    id v5 = [v4 objectForKeyedSubscript:v7];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v5 BOOLValue])
    {
      uint64_t v6 = (void *)[v4 mutableCopy];
      [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v7];
      [(CoreSpotlightPreferences *)self saveState:v6];
    }
  }
}

- (void)enableBundleIdentifier:(id)a3
{
  id v7 = a3;
  if ([v7 length])
  {
    v4 = [(CSReceiverPreferences *)self dictionary];
    id v5 = [v4 objectForKeyedSubscript:v7];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v5 BOOLValue] & 1) == 0)
    {
      uint64_t v6 = (void *)[v4 mutableCopy];
      [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v7];
      [(CoreSpotlightPreferences *)self saveState:v6];
    }
  }
}

@end