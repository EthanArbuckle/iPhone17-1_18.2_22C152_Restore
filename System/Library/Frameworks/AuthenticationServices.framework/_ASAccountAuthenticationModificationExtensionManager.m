@interface _ASAccountAuthenticationModificationExtensionManager
+ (id)sharedManager;
- (_ASAccountAuthenticationModificationExtensionManager)init;
- (void)_beginExtensionDiscovery;
- (void)_buildDomainToExtensionDictionaryWithSharedWebCredentialsDatabaseEntries:(id)a3;
- (void)_endExtensionDiscovery;
- (void)_notifyObservers:(id)a3;
- (void)addChangeObserver:(id)a3;
- (void)dealloc;
- (void)extensionForDomain:(id)a3 completionHandler:(id)a4;
- (void)removeChangeObserver:(id)a3;
@end

@implementation _ASAccountAuthenticationModificationExtensionManager

- (_ASAccountAuthenticationModificationExtensionManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)_ASAccountAuthenticationModificationExtensionManager;
  id v2 = [(_ASAccountAuthenticationModificationExtensionManager *)&v15 init];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"com.apple.AuthenticationServices.%@.%p", objc_opt_class(), v2];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    id v6 = [NSString stringWithFormat:@"com.apple.AuthenticationServices.ReadOnly.%@.%p", objc_opt_class(), v2];
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2((const char *)[v6 UTF8String], 0, *((dispatch_queue_t *)v2 + 1));
    v8 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v7;

    uint64_t v9 = [MEMORY[0x263EFF9B0] orderedSet];
    v10 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v9;

    uint64_t v11 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
    v12 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v11;

    id v13 = v2;
  }

  return (_ASAccountAuthenticationModificationExtensionManager *)v2;
}

- (void)dealloc
{
  if (self->_extensionMatchingToken) {
    objc_msgSend(MEMORY[0x263F08800], "endMatchingExtensions:");
  }
  v3.receiver = self;
  v3.super_class = (Class)_ASAccountAuthenticationModificationExtensionManager;
  [(_ASAccountAuthenticationModificationExtensionManager *)&v3 dealloc];
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69___ASAccountAuthenticationModificationExtensionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  id v2 = (void *)sharedManager_sharedManager;

  return v2;
}

- (void)_beginExtensionDiscovery
{
  v11[1] = *MEMORY[0x263EF8340];
  if (!self->_extensionMatchingToken)
  {
    objc_initWeak(&location, self);
    objc_super v3 = (void *)MEMORY[0x263F08800];
    uint64_t v10 = *MEMORY[0x263F07FF8];
    v11[0] = *MEMORY[0x263F665C0];
    dispatch_queue_t v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __80___ASAccountAuthenticationModificationExtensionManager__beginExtensionDiscovery__block_invoke;
    v7[3] = &unk_2643957A8;
    objc_copyWeak(&v8, &location);
    v5 = [v3 beginMatchingExtensionsWithAttributes:v4 completion:v7];
    id extensionMatchingToken = self->_extensionMatchingToken;
    self->_id extensionMatchingToken = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_endExtensionDiscovery
{
  if (self->_extensionMatchingToken)
  {
    objc_msgSend(MEMORY[0x263F08800], "endMatchingExtensions:");
    id extensionMatchingToken = self->_extensionMatchingToken;
    self->_id extensionMatchingToken = 0;

    domainToExtension = self->_domainToExtension;
    self->_domainToExtension = 0;

    extensions = self->_extensions;
    self->_extensions = 0;
  }
}

- (void)_buildDomainToExtensionDictionaryWithSharedWebCredentialsDatabaseEntries:(id)a3
{
  v19 = self;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  dispatch_queue_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x263F66570];
        v12 = objc_msgSend(v10, "domain", v19);
        id v13 = [v11 domainByStrippingSubdomainWildcardPrefixIfNecessary:v12];

        if (([MEMORY[0x263F66570] domainIsProhibitedForSavingCredentials:v13] & 1) == 0)
        {
          v14 = objc_msgSend(v13, "safari_highLevelDomainFromHost");
          if (v14
            && (![MEMORY[0x263F66570] highLevelDomainHasSuiteOfAssociatedApps:v14]
             || [v10 service] == 7))
          {
            uint64_t v23 = 0;
            objc_super v15 = [v10 appID];
            CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();

            v16 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              -[_ASAccountAuthenticationModificationExtensionManager _buildDomainToExtensionDictionaryWithSharedWebCredentialsDatabaseEntries:](v28, v16, v10, &v29);
            }
            uint64_t v8 = v20;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v7);
  }

  dataConstructionQueue = v19->_dataConstructionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __129___ASAccountAuthenticationModificationExtensionManager__buildDomainToExtensionDictionaryWithSharedWebCredentialsDatabaseEntries___block_invoke;
  block[3] = &unk_264395428;
  block[4] = v19;
  id v22 = v4;
  id v18 = v4;
  dispatch_async(dataConstructionQueue, block);
}

- (void)extensionForDomain:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(NSUserDefaults *)self->_mobileSafariUserDefaults BOOLForKey:@"EnableSFAppAccountAuthenticationModificationExtension"];
  if (![v6 containsString:@"apple.com"] || v8)
  {
    objc_initWeak(&location, self);
    readOnlyQueue = self->_readOnlyQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __93___ASAccountAuthenticationModificationExtensionManager_extensionForDomain_completionHandler___block_invoke;
    v10[3] = &unk_2643957D0;
    objc_copyWeak(&v13, &location);
    id v12 = v7;
    id v11 = v6;
    dispatch_async(readOnlyQueue, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)addChangeObserver:(id)a3
{
  id v4 = a3;
  dataConstructionQueue = self->_dataConstructionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74___ASAccountAuthenticationModificationExtensionManager_addChangeObserver___block_invoke;
  v7[3] = &unk_264395428;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dataConstructionQueue, v7);
}

- (void)removeChangeObserver:(id)a3
{
  id v4 = a3;
  dataConstructionQueue = self->_dataConstructionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77___ASAccountAuthenticationModificationExtensionManager_removeChangeObserver___block_invoke;
  v7[3] = &unk_264395428;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dataConstructionQueue, v7);
}

- (void)_notifyObservers:(id)a3
{
  id v4 = (void *)[a3 copy];
  id v5 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73___ASAccountAuthenticationModificationExtensionManager__notifyObservers___block_invoke;
  v7[3] = &unk_264395428;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileSafariUserDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_domainToExtension, 0);
  objc_storeStrong(&self->_extensionMatchingToken, 0);
  objc_storeStrong((id *)&self->_readOnlyQueue, 0);

  objc_storeStrong((id *)&self->_dataConstructionQueue, 0);
}

- (void)_buildDomainToExtensionDictionaryWithSharedWebCredentialsDatabaseEntries:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = [a3 appID];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl(&dword_21918F000, v7, OS_LOG_TYPE_ERROR, "Could not retrieve bundle identifier from %@", a1, 0xCu);
}

@end