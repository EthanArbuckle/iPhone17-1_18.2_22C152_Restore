@interface _SFSecIdentityPreferencesController
+ (id)ephemeralSecIdentityPreferencesController;
+ (id)sharedPersistentSecIdentityPreferencesController;
- (BOOL)shouldUseOnlyAvailableIdentityWithoutPromptingForDomainAndPort:(id)a3;
- (id)_initUsingEphemeralStorage:(BOOL)a3;
- (void)saveShouldUseOnlyAvailableIdentityWithoutPrompting:(BOOL)a3 forDomainAndPort:(id)a4;
@end

@implementation _SFSecIdentityPreferencesController

+ (id)sharedPersistentSecIdentityPreferencesController
{
  if (sharedPersistentSecIdentityPreferencesController_onceToken != -1) {
    dispatch_once(&sharedPersistentSecIdentityPreferencesController_onceToken, &__block_literal_global_50);
  }
  v2 = (void *)sharedPersistentSecIdentityPreferencesController_sharedInstance;

  return v2;
}

+ (id)ephemeralSecIdentityPreferencesController
{
  id v2 = [[_SFSecIdentityPreferencesController alloc] _initUsingEphemeralStorage:1];

  return v2;
}

- (BOOL)shouldUseOnlyAvailableIdentityWithoutPromptingForDomainAndPort:(id)a3
{
  domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting = self->_domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting;
  if (domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting)
  {
    id v4 = a3;
    LOBYTE(domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting) = [(NSMutableSet *)domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting containsObject:v4];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CB18];
    id v6 = a3;
    objc_msgSend(v5, "safari_browserDefaults");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    v7 = [v4 arrayForKey:*MEMORY[0x1E4F789B8]];
    domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting = (NSMutableSet *)[v7 containsObject:v6];
  }
  return (char)domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting;
}

- (void)saveShouldUseOnlyAvailableIdentityWithoutPrompting:(BOOL)a3 forDomainAndPort:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting = self->_domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting;
  id v15 = v6;
  if (domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting)
  {
    if (v4) {
      [(NSMutableSet *)domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting addObject:v6];
    }
    else {
      [(NSMutableSet *)domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting removeObject:v6];
    }
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v9 = *MEMORY[0x1E4F789B8];
    v10 = [v8 arrayForKey:*MEMORY[0x1E4F789B8]];
    v11 = (void *)[v10 mutableCopy];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F1CA48] array];
    }
    v14 = v13;

    [v14 addObject:v15];
    [v8 setObject:v14 forKey:v9];
  }
}

- (id)_initUsingEphemeralStorage:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFSecIdentityPreferencesController;
  BOOL v4 = [(_SFSecIdentityPreferencesController *)&v9 init];
  if (v4)
  {
    if (v3)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
      domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting = v4->_domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting;
      v4->_domainsAndPortsToUseOnlyAvailableIdentityWithoutPrompting = (NSMutableSet *)v5;
    }
    v7 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end