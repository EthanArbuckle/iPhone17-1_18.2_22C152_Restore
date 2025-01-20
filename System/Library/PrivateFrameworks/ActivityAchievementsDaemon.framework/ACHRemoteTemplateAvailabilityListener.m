@interface ACHRemoteTemplateAvailabilityListener
- (ACHRemoteTemplateAvailabilityListener)init;
- (BOOL)_isKeyACHAvailabilityStateKey:(id)a3;
- (void)_unprotectedNanoUserDefaultsDidSyncWithNotification:(id)a3;
@end

@implementation ACHRemoteTemplateAvailabilityListener

- (ACHRemoteTemplateAvailabilityListener)init
{
  v5.receiver = self;
  v5.super_class = (Class)ACHRemoteTemplateAvailabilityListener;
  v2 = [(ACHRemoteTemplateAvailabilityListener *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__unprotectedNanoUserDefaultsDidSyncWithNotification_ name:*MEMORY[0x263F430B8] object:0];
  }
  return v2;
}

- (void)_unprotectedNanoUserDefaultsDidSyncWithNotification:(id)a3
{
  v3 = [a3 userInfo];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F43058]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = objc_msgSend(v4, "hk_firstObjectPassingTest:", &__block_literal_global_14);
    if (v5)
    {
      v6 = ACHLogTemplates();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_21F5DA000, v6, OS_LOG_TYPE_DEFAULT, "Remote template availability on paired device definitions synced. Posting notification.", v7, 2u);
      }

      notify_post((const char *)[(id)*MEMORY[0x263F235B0] UTF8String]);
    }
  }
}

uint64_t __93__ACHRemoteTemplateAvailabilityListener__unprotectedNanoUserDefaultsDidSyncWithNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasSuffix:*MEMORY[0x263F23478]]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 hasSuffix:*MEMORY[0x263F23480]];
  }

  return v3;
}

- (BOOL)_isKeyACHAvailabilityStateKey:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:*MEMORY[0x263F23478]]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasSuffix:*MEMORY[0x263F23480]];
  }

  return v4;
}

@end