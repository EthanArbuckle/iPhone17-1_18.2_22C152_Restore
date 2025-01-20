@interface EXConcreteExtension
+ (BOOL)_evaluateActivationRule:(id)a3 withDictionaryIfItMatchesActiveWebPageAlternative:(id)a4 matchResult:(int64_t *)a5;
+ (BOOL)_evaluateActivationRule:(id)a3 withInputItemsIfTheyMatchActiveWebPageAlternative:(id)a4 matchResult:(int64_t *)a5;
+ (BOOL)_evaluateActivationRuleWithoutWorkarounds:(id)a3 withExtensionItemsRepresentation:(id)a4;
+ (BOOL)_genericValuesMatchActiveWebPageAlternativeWithExtensionItems:(id)a3 attachmentsLens:(id)a4 registeredTypeIdentifiersLens:(id)a5 isActiveWebPageAttachmentCheck:(id)a6;
+ (BOOL)_inputItemsMatchActiveWebPageAlternative:(id)a3;
+ (BOOL)_matchingDictionaryMatchesActiveWebPageAlternative:(id)a3;
+ (BOOL)_shouldLogExtensionDiscovery;
+ (BOOL)evaluateActivationRule:(id)a3 withExtensionItemsRepresentation:(id)a4;
+ (id)_dictionaryIncludingOnlyItemsWithRegisteredTypeIdentifier:(id)a3 fromMatchingDictionary:(id)a4;
+ (id)_inputItemsByApplyingActiveWebPageAlternative:(id)a3 ifNeededByActivationRule:(id)a4;
+ (id)beginMatchingExtensionsWithAttributes:(id)a3 completion:(id)a4;
+ (id)extensionWithIdentifier:(id)a3 error:(id *)a4;
+ (id)extensionWithIdentifier:(id)a3 excludingDisabledExtensions:(BOOL)a4 error:(id *)a5;
+ (id)extensionsWithMatchingAttributes:(id)a3 error:(id *)a4;
+ (id)globalStateQueueForExtension:(id)a3;
+ (id)predicateForActivationRule:(id)a3;
+ (void)endMatchingExtensions:(id)a3;
+ (void)extensionWithURL:(id)a3 completion:(id)a4;
+ (void)extensionWithUUID:(id)a3 completion:(id)a4;
+ (void)extensionsWithMatchingAttributes:(id)a3 completion:(id)a4;
+ (void)extensionsWithMatchingAttributes:(id)a3 synchronously:(BOOL)a4 completion:(id)a5;
+ (void)initialize;
+ (void)initializeFiltering;
- (BOOL)_beginUsingAndCreateExtensionAssertionWithRequest:(id)a3 error:(id *)a4;
- (BOOL)_isMarkedNew;
- (BOOL)_isObservingHostAppStateChanges;
- (BOOL)_isPhotoServiceAccessGranted;
- (BOOL)_isSystemExtension;
- (BOOL)_wantsProcessPerRequest;
- (BOOL)attemptOptIn:(id *)a3;
- (BOOL)attemptOptOut:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)makeExtensionContextAndXPCConnectionForRequest:(id)a3 error:(id *)a4;
- (BOOL)optedIn;
- (Class)_hostContextClass;
- (EXConcreteExtension)init;
- (NSArray)_internalPersonas;
- (NSBundle)_extensionBundle;
- (NSDictionary)_extensionState;
- (NSMutableDictionary)_extensionContexts;
- (NSMutableDictionary)_extensionExpirationIdentifiers;
- (NSMutableDictionary)_extensionServiceConnections;
- (NSSet)_allowedErrorClasses;
- (NSString)_localizedName;
- (NSString)_localizedShortName;
- (NSUUID)connectionUUID;
- (PKPlugIn)_plugIn;
- (double)requestTeardownDelay;
- (id)_bareExtensionServiceConnection;
- (id)_beginExtensionRequest:(id)a3 error:(id *)a4;
- (id)_extensionContextForUUID:(id)a3;
- (id)_initWithPKPlugin:(id)a3;
- (id)_itemProviderForPayload:(id)a3 extensionContext:(id)a4;
- (id)_requestPostCompletionBlock;
- (id)_requestPostCompletionBlockWithItems;
- (id)_stashedPlugInConnection;
- (id)attributes;
- (id)beginExtensionRequestWithInputItems:(id)a3 error:(id *)a4;
- (id)beginExtensionRequestWithInputItems:(id)a3 listenerEndpoint:(id)a4 error:(id *)a5;
- (id)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 error:(id *)a5;
- (id)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 listenerEndpoint:(id)a5 error:(id *)a6;
- (id)description;
- (id)extensionContexts;
- (id)extensionPointIdentifier;
- (id)icons;
- (id)identifier;
- (id)infoDictionary;
- (id)objectForInfoDictionaryKey:(id)a3;
- (id)requestCancellationBlock;
- (id)requestCompletionBlock;
- (id)requestInterruptionBlock;
- (id)version;
- (int)_plugInProcessIdentifier;
- (int)pidForRequestIdentifier:(id)a3;
- (int64_t)wantsDedicatedQueue;
- (unint64_t)hash;
- (void)_bareExtensionServiceConnection;
- (void)_beginExtensionRequest:(id)a3 completion:(id)a4;
- (void)_cancelRequestWithError:(id)a3 forExtensionContextWithUUID:(id)a4 completion:(id)a5;
- (void)_completeRequestReturningItems:(id)a3 forExtensionContextWithUUID:(id)a4 completion:(id)a5;
- (void)_didCreateExtensionContext:(id)a3;
- (void)_didShowExtensionManagementInterface;
- (void)_didShowNewExtensionIndicator;
- (void)_dropAssertion;
- (void)_extensionBundle;
- (void)_hostContextClass;
- (void)_hostDidBecomeActiveNote:(id)a3;
- (void)_hostDidEnterBackgroundNote:(id)a3;
- (void)_hostWillEnterForegroundNote:(id)a3;
- (void)_hostWillResignActiveNote:(id)a3;
- (void)_isPhotoServiceAccessGranted;
- (void)_isSystemExtension;
- (void)_kill:(int)a3;
- (void)_loadItemForPayload:(id)a3 contextIdentifier:(id)a4 completionHandler:(id)a5;
- (void)_loadPreviewImageForPayload:(id)a3 contextIdentifier:(id)a4 completionHandler:(id)a5;
- (void)_openURL:(id)a3 completion:(id)a4;
- (void)_reallyBeginExtensionRequest:(id)a3 completion:(id)a4;
- (void)_reallyBeginExtensionRequest:(id)a3 synchronously:(BOOL)a4 completion:(id)a5;
- (void)_resetExtensionState;
- (void)_safelyBeginUsing:(id)a3;
- (void)_safelyBeginUsingSynchronously:(BOOL)a3 request:(id)a4 readyHandler:(id)a5;
- (void)_safelyBeginUsingWithRequest:(id)a3 readyHandler:(id)a4;
- (void)_safelyEndUsing:(id)a3;
- (void)_safelyEndUsingRequestWithPKUUID:(id)a3 processAssertion:(id)a4 continuation:(id)a5;
- (void)_setAllowedErrorClasses:(id)a3;
- (void)_setExtensionContexts:(id)a3;
- (void)_setExtensionExpirationsIdentifiers:(id)a3;
- (void)_setExtensionServiceConnections:(id)a3;
- (void)_setExtensionState:(id)a3;
- (void)_setObservingHostAppStateChanges:(BOOL)a3;
- (void)_setPlugIn:(id)a3;
- (void)_wantsProcessPerRequest;
- (void)beginExtensionRequestWithInputItems:(id)a3 completion:(id)a4;
- (void)beginExtensionRequestWithInputItems:(id)a3 listenerEndpoint:(id)a4 completion:(id)a5;
- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 completion:(id)a5;
- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 listenerEndpoint:(id)a5 completion:(id)a6;
- (void)cancelExtensionRequestWithIdentifier:(id)a3;
- (void)dealloc;
- (void)setConnectionUUID:(id)a3;
- (void)setRequestCancellationBlock:(id)a3;
- (void)setRequestCompletionBlock:(id)a3;
- (void)setRequestInterruptionBlock:(id)a3;
- (void)setWantsDedicatedQueue:(int64_t)a3;
- (void)set_requestPostCompletionBlock:(id)a3;
- (void)set_requestPostCompletionBlockWithItems:(id)a3;
- (void)set_stashedPlugInConnection:(id)a3;
@end

@implementation EXConcreteExtension

- (void)setRequestInterruptionBlock:(id)a3
{
}

- (BOOL)_wantsProcessPerRequest
{
  v3 = [(EXConcreteExtension *)self infoDictionary];

  if (!v3)
  {
    v4 = _EXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[EXConcreteExtension _wantsProcessPerRequest]();
    }
  }
  v5 = [(EXConcreteExtension *)self infoDictionary];
  v6 = [v5 objectForKey:@"XPCService"];

  v7 = [v6 objectForKey:@"_MultipleInstances"];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (id)infoDictionary
{
  return self->_infoDictionary;
}

- (id)_initWithPKPlugin:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)EXConcreteExtension;
  id v5 = [(EXConcreteExtension *)&v45 _init];
  if (v5)
  {
    v6 = [v4 identifier];
    uint64_t v7 = [v6 copy];
    char v8 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v7;

    v9 = [v4 version];
    uint64_t v10 = [v9 copy];
    v11 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v10;

    v12 = [v4 attributes];
    uint64_t v13 = [v12 copy];
    v14 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v13;

    v15 = [v4 bundleInfoDictionary];
    uint64_t v16 = [v15 copy];
    v17 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v16;

    v18 = [v4 localizedName];
    uint64_t v19 = [v18 copy];
    v20 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v19;

    v21 = [v4 localizedShortName];
    uint64_t v22 = [v21 copy];
    v23 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v22;

    v24 = [*((id *)v5 + 4) objectForKey:*MEMORY[0x1E4F282B0]];
    uint64_t v25 = [v24 copy];
    v26 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v25;

    v27 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = 0;

    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v29 = [v4 launchPersonas];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [*(id *)(*((void *)&v41 + 1) + 8 * i) personaUniqueString];
          v35 = +[_EXPersona personaWithPersonaUniqueString:v34];
          [v28 addObject:v35];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v31);
    }

    objc_storeStrong((id *)v5 + 11, v28);
    if ([v5 _wantsProcessPerRequest])
    {
      uint64_t v36 = [MEMORY[0x1E4F29128] UUID];
      v37 = (void *)*((void *)v5 + 9);
      *((void *)v5 + 9) = v36;

      id v38 = [v4 createInstanceWithUUID:*((void *)v5 + 9)];
    }
    else
    {
      id v38 = v4;
    }
    v39 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v38;

    *((_DWORD *)v5 + 2) = 0;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EXConcreteExtension;
  id v4 = [(EXConcreteExtension *)&v8 description];
  id v5 = [(EXConcreteExtension *)self identifier];
  v6 = [v3 stringWithFormat:@"%@ {id = %@}", v4, v5];

  return v6;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = [(NSMutableDictionary *)self->__extensionServiceConnections allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v8 setInvalidationHandler:0];
        [v8 setInterruptionHandler:0];
        [v8 invalidate];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  v9 = +[_EXDefaults sharedInstance];
  int v10 = [v9 platformShouldExhibitEmbeddedBehavior];

  if (v10 && self->_observingHostAppStateChanges)
  {
    Class Class = objc_getClass("UIApplication");
    if (Class)
    {
      v12 = [(objc_class *)Class performSelector:sel_sharedApplication];
      uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 removeObserver:self name:@"UIApplicationWillEnterForegroundNotification" object:v12];

      v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 removeObserver:self name:@"UIApplicationDidEnterBackgroundNotification" object:v12];

      v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 removeObserver:self name:@"UIApplicationWillResignActiveNotification" object:v12];

      uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 removeObserver:self name:@"UIApplicationDidBecomeActiveNotification" object:v12];
    }
    self->_observingHostAppStateChanges = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)EXConcreteExtension;
  [(EXConcreteExtension *)&v17 dealloc];
}

+ (void)extensionsWithMatchingAttributes:(id)a3 completion:(id)a4
{
}

- (unint64_t)hash
{
  v2 = [(PKPlugIn *)self->__plugIn uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (void)extensionsWithMatchingAttributes:(id)a3 synchronously:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  if (v5) {
    uint64_t v8 = 1024;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = (void *)MEMORY[0x1E4F91488];
  id v10 = a3;
  v11 = [v9 defaultHost];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__EXConcreteExtension_extensionsWithMatchingAttributes_synchronously_completion___block_invoke;
  v13[3] = &unk_1E573CC98;
  id v14 = v7;
  id v12 = v7;
  [v11 discoverPlugInsForAttributes:v10 flags:v8 found:v13];
}

+ (id)beginMatchingExtensionsWithAttributes:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F91488] defaultHost];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__EXConcreteExtension_beginMatchingExtensionsWithAttributes_completion___block_invoke;
  v12[3] = &unk_1E573CD10;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = [v7 continuouslyDiscoverPlugInsForAttributes:v9 flags:0 found:v12];

  return v10;
}

void __81__EXConcreteExtension_extensionsWithMatchingAttributes_synchronously_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA80] set];
  if (v5)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
          id v14 = [EXConcreteExtension alloc];
          id v15 = -[EXConcreteExtension _initWithPKPlugin:](v14, "_initWithPKPlugin:", v13, (void)v18);
          [v7 addObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  uint64_t v16 = *(void *)(a1 + 32);
  objc_super v17 = objc_msgSend(v7, "allObjects", (void)v18);
  (*(void (**)(uint64_t, void *, id))(v16 + 16))(v16, v17, v6);
}

void __72__EXConcreteExtension_beginMatchingExtensionsWithAttributes_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = [MEMORY[0x1E4F1CA80] set];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * v7);
          uint64_t v9 = [EXConcreteExtension alloc];
          id v10 = -[EXConcreteExtension _initWithPKPlugin:](v9, "_initWithPKPlugin:", v8, (void)v17);
          [v2 addObject:v10];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v5);
    }

    uint64_t v11 = _EXLegacyLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v12;
      __int16 v23 = 2114;
      v24 = v2;
      _os_log_impl(&dword_191F29000, v11, OS_LOG_TYPE_DEFAULT, "discovered extensions: attributes %@, extensionSet %{public}@", buf, 0x16u);
    }

    uint64_t v13 = *(void *)(a1 + 56);
    if (v13)
    {
      id v14 = [v2 allObjects];
      (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v14, 0);
    }
  }
  else
  {
    id v15 = _EXLegacyLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke_2_cold_1();
    }

    uint64_t v16 = *(void *)(a1 + 56);
    if (v16) {
      (*(void (**)(uint64_t, void, void))(v16 + 16))(v16, 0, *(void *)(a1 + 48));
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(PKPlugIn *)self->__plugIn uuid];
    uint64_t v6 = [v4 _plugIn];
    uint64_t v7 = [v6 uuid];

    char v8 = [v5 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (PKPlugIn)_plugIn
{
  return (PKPlugIn *)objc_getProperty(self, a2, 80, 1);
}

- (id)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 initializeFiltering];
    CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
    CFPreferencesGetAppBooleanValue(@"EXAssertionLoggingEnabled", (CFStringRef)*MEMORY[0x1E4F1D3B8], 0);
    EXConcreteExtensionDiscoveryLoggingEnabled = CFPreferencesGetAppBooleanValue(@"NSExtensionDiscoveryLoggingEnabled", v3, 0) != 0;
    os_log_t v4 = os_log_create("com.apple.foundation.NSExtension", "connection");
    uint64_t v5 = (void *)EXConcreteExtensionLogCategoryConnection;
    EXConcreteExtensionLogCategoryConnection = (uint64_t)v4;

    os_log_t v6 = os_log_create("com.apple.foundation.NSExtension", "context");
    uint64_t v7 = (void *)EXConcreteExtensionLogCategoryContext;
    EXConcreteExtensionLogCategoryContext = (uint64_t)v6;

    os_log_t v8 = os_log_create("com.apple.foundation.NSExtension", "discovery");
    uint64_t v9 = (void *)EXConcreteExtensionLogCategoryDiscovery;
    EXConcreteExtensionLogCategoryDiscovery = (uint64_t)v8;

    EXConcreteExtensionLogCategoryPlugIn = (uint64_t)os_log_create("com.apple.foundation.NSExtension", "plugin");
    MEMORY[0x1F41817F8]();
  }
}

+ (void)initializeFiltering
{
  _EXExtensionUseAlternateRules = (uint64_t)CFPreferencesCopyAppValue(@"NSExtensionUseAlternateRules", (CFStringRef)*MEMORY[0x1E4F1D3B8]);

  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__allowedErrorClasses, 0);
  objc_storeStrong((id *)&self->__extensionBundle, 0);
  objc_storeStrong(&self->__requestPostCompletionBlockWithItems, 0);
  objc_storeStrong(&self->__requestPostCompletionBlock, 0);
  objc_storeStrong(&self->_requestInterruptionBlock, 0);
  objc_storeStrong(&self->_requestCancellationBlock, 0);
  objc_storeStrong(&self->_requestCompletionBlock, 0);
  objc_storeStrong(&self->__stashedPlugInConnection, 0);
  objc_storeStrong((id *)&self->__extensionContexts, 0);
  objc_storeStrong((id *)&self->__extensionExpirationIdentifiers, 0);
  objc_storeStrong((id *)&self->__extensionServiceConnections, 0);
  objc_storeStrong((id *)&self->__internalPersonas, 0);
  objc_storeStrong((id *)&self->__plugIn, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
  objc_storeStrong((id *)&self->__localizedShortName, 0);
  objc_storeStrong((id *)&self->__localizedName, 0);
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

void __72__EXConcreteExtension_beginMatchingExtensionsWithAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__EXConcreteExtension_beginMatchingExtensionsWithAttributes_completion___block_invoke_2;
  v10[3] = &unk_1E573CCC0;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v7;
  id v8 = v6;
  id v9 = v5;
  _os_activity_initiate(&dword_191F29000, "discovering extensions", OS_ACTIVITY_FLAG_DEFAULT, v10);
}

- (void)_safelyBeginUsingSynchronously:(BOOL)a3 request:(id)a4 readyHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = _sharedSafePluginQueue();
  dispatch_assert_queue_V2(v10);

  plugIn = self->__plugIn;
  if (plugIn && ![(PKPlugIn *)plugIn spent])
  {
    uint64_t v59 = 0;
    v60 = (os_activity_scope_state_s *)&v59;
    uint64_t v61 = 0x3010000000;
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    v62 = &unk_191FD711D;
    objc_super v45 = _os_activity_create(&dword_191F29000, "begin using plugin", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v45, v60 + 2);
    BOOL v47 = v6;
    if (useAssertions())
    {
      objc_initWeak((id *)location, v8);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke;
      aBlock[3] = &unk_1E573D058;
      objc_copyWeak(&v58, (id *)location);
      uint64_t v16 = _Block_copy(aBlock);
      objc_destroyWeak(&v58);
      objc_destroyWeak((id *)location);
    }
    else
    {
      uint64_t v16 = 0;
    }
    if (useAssertions())
    {
      long long v17 = [(EXConcreteExtension *)self identifier];
      long long v18 = self;
      id v19 = v17;
      if ([(EXConcreteExtension *)v18 _wantsProcessPerRequest])
      {
        uint64_t v20 = 0;
      }
      else
      {
        uint64_t v65 = 0;
        v66 = &v65;
        uint64_t v67 = 0x2020000000;
        int v68 = 0;
        *(void *)location = MEMORY[0x1E4F143A8];
        *(void *)&location[8] = 3221225472;
        *(void *)&location[16] = __EXConcreteExtensionGetProcessIdentifierForExtensionIdentifier_block_invoke;
        v72 = &unk_1E573D1B0;
        v74 = &v65;
        id v22 = v19;
        id v73 = v22;
        safelyAccessPidForExtensionIdentiferDictionary(location);
        uint64_t v20 = *((unsigned int *)v66 + 6);
        if ((int)v20 <= 0)
        {
          if ([(EXConcreteExtension *)v18 _isSystemExtension])
          {
            id v23 = v22;
            if (EXConcreteExtensionResolveSystemExtensionPIDByIdentifier_onceToken != -1) {
              dispatch_once(&EXConcreteExtensionResolveSystemExtensionPIDByIdentifier_onceToken, &__block_literal_global_406);
            }
            id v24 = v23;
            uint64_t v25 = (const char *)[v24 UTF8String];
            uint64_t v26 = xpc_connection_create(v25, (dispatch_queue_t)EXConcreteExtensionResolveSystemExtensionPIDByIdentifier_resolution_queue);
            if (v26)
            {
              uint64_t v20 = +[EXXPCUtil servicePidFromXPCConnection:v26];
              xpc_connection_set_event_handler(v26, &__block_literal_global_410);
              xpc_connection_activate(v26);
            }
            else
            {
              uint64_t v20 = 0;
            }

            *((_DWORD *)v66 + 6) = v20;
          }
          else
          {
            uint64_t v20 = *((unsigned int *)v66 + 6);
          }
        }

        _Block_object_dispose(&v65, 8);
      }

      long long v21 = _NSAcquireProcessAssertionForPIDWithOptions(v20, [v8 options], v16);
      if (v21)
      {
        v27 = _EXLegacyLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 138543618;
          *(void *)&location[4] = v21;
          *(_WORD *)&location[12] = 1024;
          *(_DWORD *)&location[14] = v20;
          _os_log_impl(&dword_191F29000, v27, OS_LOG_TYPE_DEFAULT, "Aquired asertion %{public}@ for running extension with pid %d", location, 0x12u);
        }
      }
    }
    else
    {
      long long v21 = 0;
      LODWORD(v20) = -1;
    }
    id v28 = self->__plugIn;
    if (!v28)
    {
      v29 = _EXDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        -[EXConcreteExtension _safelyBeginUsingSynchronously:request:readyHandler:].cold.4();
      }

      id v28 = self->__plugIn;
    }
    if ([(PKPlugIn *)v28 spent])
    {
      uint64_t v30 = _EXDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        -[EXConcreteExtension _safelyBeginUsingSynchronously:request:readyHandler:]();
      }
    }
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_139;
    v50[3] = &unk_1E573D080;
    v50[4] = self;
    id v31 = v21;
    id v51 = v31;
    int v56 = v20;
    id v32 = v8;
    id v52 = v32;
    id v33 = v16;
    id v53 = v33;
    id v54 = v9;
    v55 = &v59;
    v34 = (void (**)(void *, id))_Block_copy(v50);
    v35 = self->__plugIn;
    uint64_t v36 = _EXLegacyLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v37 = [v32 pkUUID];
      -[EXConcreteExtension _safelyBeginUsingSynchronously:request:readyHandler:]((uint64_t)v35, v37, (uint64_t)location, v36);
    }

    id v38 = (void *)MEMORY[0x1E4F91490];
    v39 = [v32 pkUUID];
    v40 = [v32 persona];
    long long v41 = [v38 launchRequestWithUUID:v39 launchPersona:v40];

    long long v42 = [v32 sandboxProfileName];
    [(PKPlugIn *)v35 setSandboxProfile:v42];

    if (v47)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v49 = 0;
        long long v43 = (id *)&v49;
        [(PKPlugIn *)v35 beginUsingRequest:v41 error:&v49];
      }
      else
      {
        uint64_t v48 = 0;
        long long v43 = (id *)&v48;
        [(PKPlugIn *)v35 beginUsingWithError:&v48];
      }
      id v44 = *v43;
      v34[2](v34, v44);
    }
    else if (objc_opt_respondsToSelector())
    {
      [(PKPlugIn *)v35 beginUsingRequest:v41 completion:v34];
    }
    else
    {
      [(PKPlugIn *)v35 beginUsing:v34];
    }

    _Block_object_dispose(&v59, 8);
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v69 = *MEMORY[0x1E4F28228];
    v70 = @"The plugin has been invalidated.";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    id v14 = [v12 errorWithDomain:*MEMORY[0x1E4F28268] code:-1 userInfo:v13];

    id v15 = _EXLegacyLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[EXConcreteExtension _safelyBeginUsingSynchronously:request:readyHandler:]();
    }

    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v14);
  }
}

+ (BOOL)_shouldLogExtensionDiscovery
{
  return EXConcreteExtensionDiscoveryLoggingEnabled;
}

+ (id)extensionsWithMatchingAttributes:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy_;
  id v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__EXConcreteExtension_extensionsWithMatchingAttributes_error___block_invoke;
  v8[3] = &unk_1E573CC70;
  v8[4] = &v15;
  v8[5] = &v9;
  +[EXConcreteExtension extensionsWithMatchingAttributes:v5 synchronously:1 completion:v8];
  if (a4) {
    *a4 = (id) v10[5];
  }
  id v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v6;
}

void __62__EXConcreteExtension_extensionsWithMatchingAttributes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v5 copy];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

+ (id)extensionWithIdentifier:(id)a3 error:(id *)a4
{
  return (id)[a1 extensionWithIdentifier:a3 excludingDisabledExtensions:0 error:a4];
}

+ (id)extensionWithIdentifier:(id)a3 excludingDisabledExtensions:(BOOL)a4 error:(id *)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v18[0] = *MEMORY[0x1E4F28290];
    v18[1] = @"NSUserElection";
    v19[0] = a3;
    uint64_t v7 = NSNumber;
    id v8 = a3;
    id v9 = [v7 numberWithInteger:1];
    uint64_t v10 = [v9 stringValue];
    v19[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F28290];
    id v17 = a3;
    id v12 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = a3;
    uint64_t v11 = [v12 dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  }

  id v13 = [a1 extensionsWithMatchingAttributes:v11 error:a5];
  id v14 = [v13 firstObject];

  return v14;
}

+ (void)extensionWithUUID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F91488] defaultHost];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke;
  v10[3] = &unk_1E573CCE8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 findPlugInByUUID:v9 reply:v10];
}

void __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke_2;
  v10[3] = &unk_1E573CCC0;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v7;
  id v8 = v6;
  id v9 = v5;
  _os_activity_initiate(&dword_191F29000, "discovering extensions", OS_ACTIVITY_FLAG_DEFAULT, v10);
}

void __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke_2(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    id v2 = [[EXConcreteExtension alloc] _initWithPKPlugin:a1[4]];
    CFStringRef v3 = _EXLegacyLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[5];
      int v6 = 138543618;
      id v7 = v2;
      __int16 v8 = 2114;
      uint64_t v9 = v4;
      _os_log_impl(&dword_191F29000, v3, OS_LOG_TYPE_DEFAULT, "discovered extension: %{public}@, uuid: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    id v5 = _EXLegacyLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
}

+ (void)extensionWithURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F91488] defaultHost];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__EXConcreteExtension_extensionWithURL_completion___block_invoke;
  v10[3] = &unk_1E573CCE8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 findPlugInByPathURL:v9 reply:v10];
}

void __51__EXConcreteExtension_extensionWithURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__EXConcreteExtension_extensionWithURL_completion___block_invoke_2;
  v10[3] = &unk_1E573CCC0;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v7;
  id v8 = v6;
  id v9 = v5;
  _os_activity_initiate(&dword_191F29000, "discovering extensions", OS_ACTIVITY_FLAG_DEFAULT, v10);
}

void __51__EXConcreteExtension_extensionWithURL_completion___block_invoke_2(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    id v2 = [[EXConcreteExtension alloc] _initWithPKPlugin:a1[4]];
    CFStringRef v3 = _EXLegacyLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[5];
      int v6 = 138543618;
      id v7 = v2;
      __int16 v8 = 2114;
      uint64_t v9 = v4;
      _os_log_impl(&dword_191F29000, v3, OS_LOG_TYPE_DEFAULT, "discovered extension: %{public}@, url: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    id v5 = _EXLegacyLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
}

+ (void)endMatchingExtensions:(id)a3
{
  CFStringRef v3 = (void *)MEMORY[0x1E4F91488];
  id v4 = a3;
  id v5 = [v3 defaultHost];
  [v5 cancelPlugInDiscovery:v4];
}

+ (id)globalStateQueueForExtension:(id)a3
{
  CFStringRef v3 = +[_EXDefaults sharedInstance];
  int v4 = [v3 platformShouldExhibitEmbeddedBehavior];

  if (v4 && dyld_program_sdk_at_least())
  {
    if (globalStateQueueForExtension__onceToken != -1) {
      dispatch_once(&globalStateQueueForExtension__onceToken, &__block_literal_global_0);
    }
    id v5 = (id)globalStateQueueForExtension__dedicatedQueue;
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F14428];
    id v6 = MEMORY[0x1E4F14428];
  }

  return v5;
}

uint64_t __52__EXConcreteExtension_globalStateQueueForExtension___block_invoke()
{
  globalStateQueueForExtension__dedicatedQueue = (uint64_t)dispatch_queue_create("com.apple.extension.global-state-queue", 0);

  return MEMORY[0x1F41817F8]();
}

- (EXConcreteExtension)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Unable to create null NSExtensions!" userInfo:0];
  objc_exception_throw(v2);
}

- (BOOL)optedIn
{
  return [(PKPlugIn *)self->__plugIn userElection] == 1;
}

- (BOOL)attemptOptIn:(id *)a3
{
  return 1;
}

- (BOOL)attemptOptOut:(id *)a3
{
  return 1;
}

- (id)_bareExtensionServiceConnection
{
  v13[2] = *MEMORY[0x1E4F143B8];
  CFStringRef v3 = [(EXConcreteExtension *)self _extensionBundle];
  int v4 = [v3 bundleIdentifier];

  if (!v4)
  {
    int v4 = [(EXConcreteExtension *)self identifier];
  }
  id v5 = [NSString stringWithFormat:@"%@.%@", v4, *MEMORY[0x1E4F28258]];
  id v6 = _EXLegacyLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[EXConcreteExtension _bareExtensionServiceConnection]();
  }

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:v5];
  __int16 v8 = +[EXExtensionContextImplementation _extensionContextVendorProtocolWithAllowedErrorClasses:self->__allowedErrorClasses];
  [v7 setRemoteObjectInterface:v8];

  uint64_t v9 = +[EXExtensionContextImplementation _extensionContextHostProtocolWithAllowedErrorClasses:self->__allowedErrorClasses];
  [v7 setExportedInterface:v9];

  [v7 setExportedObject:self];
  if ([(EXConcreteExtension *)self _wantsProcessPerRequest])
  {
    if (!self->_connectionUUID)
    {
      uint64_t v10 = _EXDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[EXConcreteExtension _bareExtensionServiceConnection]();
      }
    }
    id v11 = [v7 _xpcConnection];
    v13[0] = 0;
    v13[1] = 0;
    [(NSUUID *)self->_connectionUUID getUUIDBytes:v13];
    xpc_connection_set_oneshot_instance();
  }

  return v7;
}

- (void)_reallyBeginExtensionRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v19 = 0;
  BOOL v8 = [(EXConcreteExtension *)self makeExtensionContextAndXPCConnectionForRequest:v6 error:&v19];
  id v9 = v19;
  if (v8)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__EXConcreteExtension__reallyBeginExtensionRequest_completion___block_invoke;
    v17[3] = &unk_1E573CD60;
    v17[4] = self;
    id v18 = v7;
    id v10 = v7;
    [(EXConcreteExtension *)self _reallyBeginExtensionRequest:v6 synchronously:0 completion:v17];
    id v11 = v18;
  }
  else
  {
    id v12 = +[EXConcreteExtension globalStateQueueForExtension:self];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__EXConcreteExtension__reallyBeginExtensionRequest_completion___block_invoke_3;
    block[3] = &unk_1E573CD88;
    id v16 = v7;
    id v15 = v9;
    id v13 = v7;
    dispatch_async(v12, block);

    id v11 = v16;
  }
}

void __63__EXConcreteExtension__reallyBeginExtensionRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[EXConcreteExtension globalStateQueueForExtension:*(void *)(a1 + 32)];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__EXConcreteExtension__reallyBeginExtensionRequest_completion___block_invoke_2;
  block[3] = &unk_1E573CD38;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __63__EXConcreteExtension__reallyBeginExtensionRequest_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __63__EXConcreteExtension__reallyBeginExtensionRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (BOOL)makeExtensionContextAndXPCConnectionForRequest:(id)a3 error:(id *)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _EXLegacyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:].cold.8();
  }

  os_unfair_lock_lock(&self->_unfairLock);
  id v8 = [(EXConcreteExtension *)self _hostContextClass];
  id v9 = [v8 alloc];
  id v10 = [v6 inputItems];
  id v11 = (void *)[v9 initWithInputItems:v10];

  if (!v11)
  {
    id v12 = _EXDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      id v13 = NSStringFromClass(v8);
      -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:].cold.7(v13, buf, v12);
    }
  }
  id v14 = [v11 _UUID];
  id v15 = [v11 internalImplementation];
  [v15 setExtensionRequest:v6];
  extensionContexts = self->__extensionContexts;
  if (!extensionContexts)
  {
    id v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v18 = self->__extensionContexts;
    self->__extensionContexts = v17;

    extensionContexts = self->__extensionContexts;
  }
  [(NSMutableDictionary *)extensionContexts setObject:v11 forKey:v14];
  id v19 = [(EXConcreteExtension *)self _bareExtensionServiceConnection];
  extensionServiceConnections = self->__extensionServiceConnections;
  if (!extensionServiceConnections)
  {
    long long v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v22 = self->__extensionServiceConnections;
    self->__extensionServiceConnections = v21;

    extensionServiceConnections = self->__extensionServiceConnections;
  }
  [(NSMutableDictionary *)extensionServiceConnections setObject:v19 forKey:v14];
  objc_initWeak(&location, self);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke;
  v53[3] = &unk_1E573CDB0;
  objc_copyWeak(&v55, &location);
  id v23 = v14;
  id v54 = v23;
  [v19 setInterruptionHandler:v53];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke_68;
  v50[3] = &unk_1E573CDB0;
  objc_copyWeak(&v52, &location);
  id v24 = v23;
  id v51 = v24;
  [v19 setInvalidationHandler:v50];

  objc_destroyWeak(&v52);
  objc_destroyWeak(&v55);
  objc_destroyWeak(&location);

  os_unfair_lock_unlock(&self->_unfairLock);
  BOOL v25 = v11 != 0;
  if (v11)
  {
    [v6 setContext:v11];
  }
  else
  {
    if (a4)
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v61 = *MEMORY[0x1E4F28228];
      v27 = [NSString stringWithFormat:@"Failed to make extension context for extension: %@ request: %@", self, v6];
      v62 = v27;
      id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      *a4 = [v26 errorWithDomain:*MEMORY[0x1E4F28268] code:-1 userInfo:v28];
    }
    v29 = _EXLegacyLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:].cold.6();
    }
  }
  if (v19)
  {
    [v6 setXpcConnection:v19];
    uint64_t v30 = [v6 assertion];
    int v31 = [v30 valid];

    if (v31)
    {
      [v19 resume];
      goto LABEL_30;
    }
    uint64_t v36 = _EXLegacyLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:].cold.5(v11, self);
    }

    if (a4)
    {
      v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v59 = *MEMORY[0x1E4F28228];
      id v38 = NSString;
      v39 = [v11 _UUID];
      v40 = [(EXConcreteExtension *)self identifier];
      objc_msgSend(v38, "stringWithFormat:", @"Extension assertion was invalidated! request: %@; plugin_identifier: %@",
        v39,
      long long v41 = v40);
      v60 = v41;
      long long v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      *a4 = [v37 errorWithDomain:*MEMORY[0x1E4F28268] code:-1 userInfo:v42];
    }
  }
  else
  {
    id v32 = _EXLegacyLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:].cold.4();
    }

    if (a4)
    {
      id v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v57 = *MEMORY[0x1E4F28228];
      v34 = [NSString stringWithFormat:@"Failed to make XPC connection for extension: %@ request: %@", self, v6];
      id v58 = v34;
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      *a4 = [v33 errorWithDomain:*MEMORY[0x1E4F28268] code:-1 userInfo:v35];
    }
  }
  BOOL v25 = 0;
LABEL_30:
  long long v43 = +[_EXDefaults sharedInstance];
  if (![v43 allowSimulatedJetsam])
  {
LABEL_35:

    goto LABEL_36;
  }
  int v44 = [v6 options];

  if (v44 >= 0) {
    goto LABEL_36;
  }
  int v45 = [(EXConcreteExtension *)self _plugInProcessIdentifier];
  BOOL v46 = terminate_with_reason() == 0;
  long long v43 = _EXLegacyLog();
  BOOL v47 = os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG);
  if (!v46)
  {
    if (v47) {
      -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:](v43);
    }
    goto LABEL_35;
  }
  if (v47) {
    -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:](v45, v43);
  }

  sleep(1u);
LABEL_36:
  uint64_t v48 = _EXLegacyLog();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
    -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:]((uint64_t)self, v6, v48);
  }

  return v25;
}

void __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v4 = +[EXConcreteExtension globalStateQueueForExtension:WeakRetained];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke_2;
    v5[3] = &unk_1E573CDB0;
    objc_copyWeak(&v7, v2);
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v4, v5);

    objc_destroyWeak(&v7);
  }
}

void __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CFStringRef v3 = _EXLegacyLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = [WeakRetained identifier];
      int v8 = 138543618;
      uint64_t v9 = v4;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_191F29000, v3, OS_LOG_TYPE_DEFAULT, "extension connection was interrupted! request: %{public}@; plugin_identifier: %{public}@",
        (uint8_t *)&v8,
        0x16u);
    }
    uint64_t v6 = [WeakRetained requestInterruptionBlock];
    id v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, *(void *)(a1 + 32));
    }
    EXConcreteExtensionErrorCleanupHandler(WeakRetained, *(void **)(a1 + 32));
  }
}

void __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke_68(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CFStringRef v3 = _EXLegacyLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = [WeakRetained identifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v4;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_191F29000, v3, OS_LOG_TYPE_DEFAULT, "extension connection was invalidated! request: %{public}@; plugin_identifier: %{public}@",
        buf,
        0x16u);
    }
    uint64_t v6 = _sharedSafePluginQueue();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke_69;
    v7[3] = &unk_1E573CDD8;
    id v8 = WeakRetained;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);
  }
}

void __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke_69(uint64_t a1)
{
}

- (void)_reallyBeginExtensionRequest:(id)a3 synchronously:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = _EXLegacyLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    BOOL v25 = "NO";
    *(_DWORD *)buf = 138543874;
    v35 = self;
    if (v6) {
      BOOL v25 = "YES";
    }
    __int16 v36 = 2114;
    id v37 = v8;
    __int16 v38 = 2082;
    v39 = v25;
    _os_log_debug_impl(&dword_191F29000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ really begining request: %{public}@ synchronously: %{public}s", buf, 0x20u);
  }
  v27 = self;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke;
  aBlock[3] = &unk_1E573CE00;
  id v11 = v9;
  id v33 = v11;
  __int16 v12 = _Block_copy(aBlock);
  id v13 = [v8 xpcConnection];
  uint64_t v14 = [v8 context];
  id v15 = [v14 inputItems];
  id v16 = [v8 endpoint];
  if (v6) {
    [v13 synchronousRemoteObjectProxyWithErrorHandler:v12];
  }
  else {
  id v17 = [v13 remoteObjectProxyWithErrorHandler:v12];
  }
  uint64_t v26 = v12;
  id v18 = [v14 internalImplementation];
  [v18 _setExtensionVendorProxy:v17];
  if (v16)
  {
    id v19 = v16;
  }
  else
  {
    id v20 = [v18 _auxiliaryListener];
    id v19 = [v20 endpoint];
  }
  long long v21 = [v14 _UUID];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_84;
  v28[3] = &unk_1E573CE28;
  v28[4] = v27;
  id v29 = v8;
  id v30 = v14;
  id v31 = v11;
  id v22 = v11;
  id v23 = v14;
  id v24 = v8;
  [v17 _beginRequestWithExtensionItems:v15 listenerEndpoint:v19 withContextUUID:v21 completion:v28];
}

void __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _EXLegacyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_cold_1(v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _EXLegacyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_84_cold_2();
  }

  id v8 = [*(id *)(a1 + 48) _UUID];
  char v9 = [v8 isEqual:v5];

  if ((v9 & 1) == 0)
  {
    __int16 v10 = _EXLegacyLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_84_cold_1(v10);
    }
  }
  if (v5) {
    [*(id *)(a1 + 32) _didCreateExtensionContext:*(void *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (id)objc_opt_new();
  [v10 setOptions:a3];
  [v10 setInputItems:v9];

  [(EXConcreteExtension *)self _beginExtensionRequest:v10 completion:v8];
}

- (id)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = objc_opt_new();
  [v9 setOptions:a3];
  [v9 setInputItems:v8];

  id v10 = [(EXConcreteExtension *)self _beginExtensionRequest:v9 error:a5];

  return v10;
}

- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 listenerEndpoint:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = (id)objc_opt_new();
  [v13 setOptions:a3];
  [v13 setInputItems:v12];

  [v13 setEndpoint:v11];
  [(EXConcreteExtension *)self _beginExtensionRequest:v13 completion:v10];
}

- (id)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 listenerEndpoint:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = objc_opt_new();
  [v12 setOptions:a3];
  [v12 setInputItems:v11];

  [v12 setEndpoint:v10];
  id v13 = [(EXConcreteExtension *)self _beginExtensionRequest:v12 error:a6];

  return v13;
}

- (void)_beginExtensionRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _EXRegistrationLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = _EXRegistrationLog();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "async extension request", "", buf, 2u);
  }

  id v12 = _EXLegacyLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[EXConcreteExtension _beginExtensionRequest:completion:]();
  }

  [v6 applyActiveWebPageAlternativeIfNeededForExtension:self];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke;
  id v19 = &unk_1E573CEA0;
  id v20 = self;
  id v21 = v6;
  id v22 = v7;
  os_signpost_id_t v23 = v9;
  id v13 = v7;
  id v14 = v6;
  id v15 = _Block_copy(&v16);
  -[EXConcreteExtension _safelyBeginUsingWithRequest:readyHandler:](self, "_safelyBeginUsingWithRequest:readyHandler:", v14, v15, v16, v17, v18, v19, v20);
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[EXConcreteExtension globalStateQueueForExtension:*(void *)(a1 + 32)];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_2;
  v12[3] = &unk_1E573CE78;
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v15 = v5;
  os_signpost_id_t v9 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v18 = v8;
  id v17 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = _EXLegacyLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_2_cold_1();
    }

    id v3 = _EXRegistrationLog();
    uint64_t v4 = v3;
    os_signpost_id_t v5 = *(void *)(a1 + 72);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_191F29000, v4, OS_SIGNPOST_INTERVAL_END, v5, "async extension request'", "", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    *(void *)buf = 0;
    id v20 = buf;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    char v18 = 0;
    [*(id *)(a1 + 40) setAssertion:*(void *)(a1 + 48)];
    id v6 = *(void **)(a1 + 56);
    id v7 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3;
    v11[3] = &unk_1E573CE50;
    id v14 = buf;
    id v15 = v17;
    id v8 = v7;
    id v10 = *(void **)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 72);
    id v12 = v8;
    uint64_t v16 = v9;
    id v13 = v10;
    [v6 _reallyBeginExtensionRequest:v8 completion:v11];

    _Block_object_dispose(v17, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    if (v6)
    {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
      id v10 = _EXLegacyLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_2();
      }
    }
    else
    {
      id v10 = _EXLegacyLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_1();
      }
    }

    id v14 = _EXRegistrationLog();
    id v15 = v14;
    os_signpost_id_t v16 = a1[8];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)id v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_191F29000, v15, OS_SIGNPOST_INTERVAL_END, v16, "async extension request'", "", v17, 2u);
    }

    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v9 = a1[6];
    goto LABEL_18;
  }
  if (v6)
  {
    id v8 = _EXLegacyLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_5();
    }

    uint64_t v9 = a1[7];
LABEL_18:
    *(unsigned char *)(*(void *)(v9 + 8) + 24) = 1;
    goto LABEL_22;
  }
  int v11 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
  id v12 = _EXLegacyLog();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_4();
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_3();
  }

LABEL_22:
}

- (id)_beginExtensionRequest:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _EXRegistrationLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  uint64_t v9 = _EXRegistrationLog();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "synchronus extension request", "", buf, 2u);
  }

  int v11 = _EXLegacyLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[EXConcreteExtension _beginExtensionRequest:error:]();
  }

  *(void *)buf = 0;
  uint64_t v26 = buf;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy_;
  id v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  if ([(EXConcreteExtension *)self _beginUsingAndCreateExtensionAssertionWithRequest:v6 error:a4]&& [(EXConcreteExtension *)self makeExtensionContextAndXPCConnectionForRequest:v6 error:a4])
  {
    *(void *)id v31 = 0;
    *(void *)&v31[8] = v31;
    *(void *)&v31[16] = 0x3032000000;
    id v32 = __Block_byref_object_copy_;
    id v33 = __Block_byref_object_dispose_;
    id v34 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __52__EXConcreteExtension__beginExtensionRequest_error___block_invoke;
    v24[3] = &unk_1E573CEC8;
    v24[4] = v31;
    v24[5] = buf;
    [(EXConcreteExtension *)self _reallyBeginExtensionRequest:v6 synchronously:1 completion:v24];
    id v12 = [v6 context];

    if (v12)
    {
      id v13 = [v6 context];
      [(EXConcreteExtension *)self _didCreateExtensionContext:v13];
    }
    id v14 = *(void **)(*(void *)&v31[8] + 40);
    if (v14)
    {
      if (!a4) {
        goto LABEL_22;
      }
    }
    else if (!a4 || *((void *)v26 + 5))
    {
      goto LABEL_22;
    }
    *a4 = v14;
LABEL_22:
    _Block_object_dispose(v31, 8);

    goto LABEL_23;
  }
  id v15 = _EXLegacyLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (a4) {
      id v16 = *a4;
    }
    else {
      id v16 = 0;
    }
    *(_DWORD *)id v31 = 138543362;
    *(void *)&v31[4] = v16;
    _os_log_impl(&dword_191F29000, v15, OS_LOG_TYPE_DEFAULT, "Failed to begin using with error: %{public}@", v31, 0xCu);
  }

LABEL_23:
  id v17 = _EXLegacyLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = *((void *)v26 + 5);
    if (a4) {
      os_signpost_id_t v23 = (uint64_t (*)(uint64_t, uint64_t))*a4;
    }
    else {
      os_signpost_id_t v23 = 0;
    }
    *(_DWORD *)id v31 = 138543874;
    *(void *)&v31[4] = v6;
    *(_WORD *)&v31[12] = 2114;
    *(void *)&v31[14] = v22;
    *(_WORD *)&v31[22] = 2114;
    id v32 = v23;
    _os_log_debug_impl(&dword_191F29000, v17, OS_LOG_TYPE_DEBUG, "completed synchronus begin extension request %{public}@ with identifier: %{public}@ error: %{public}@", v31, 0x20u);
  }

  char v18 = _EXRegistrationLog();
  id v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)id v31 = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v19, OS_SIGNPOST_INTERVAL_END, v8, "synchronus extension request'", "", v31, 2u);
  }

  id v20 = *((id *)v26 + 5);
  _Block_object_dispose(buf, 8);

  return v20;
}

void __52__EXConcreteExtension__beginExtensionRequest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)beginExtensionRequestWithInputItems:(id)a3 listenerEndpoint:(id)a4 completion:(id)a5
{
}

- (id)beginExtensionRequestWithInputItems:(id)a3 listenerEndpoint:(id)a4 error:(id *)a5
{
  return [(EXConcreteExtension *)self beginExtensionRequestWithOptions:1 inputItems:a3 listenerEndpoint:a4 error:a5];
}

- (void)beginExtensionRequestWithInputItems:(id)a3 completion:(id)a4
{
}

- (id)beginExtensionRequestWithInputItems:(id)a3 error:(id *)a4
{
  return [(EXConcreteExtension *)self beginExtensionRequestWithInputItems:a3 listenerEndpoint:0 error:a4];
}

- (void)cancelExtensionRequestWithIdentifier:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28268];
  uint64_t v16 = *MEMORY[0x1E4F28568];
  v17[0] = @"Extension cancelled by host.";
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v8 = [v5 errorWithDomain:v6 code:-2 userInfo:v7];

  requestCancellationBlock = (void (**)(id, id, void *))self->_requestCancellationBlock;
  if (requestCancellationBlock) {
    requestCancellationBlock[2](requestCancellationBlock, v4, v8);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__EXConcreteExtension_cancelExtensionRequestWithIdentifier___block_invoke;
  aBlock[3] = &unk_1E573CDD8;
  void aBlock[4] = self;
  id v10 = v4;
  id v15 = v10;
  int v11 = (void (**)(void))_Block_copy(aBlock);
  id v12 = [(EXConcreteExtension *)self _requestPostCompletionBlock];

  if (v12)
  {
    id v13 = [(EXConcreteExtension *)self _requestPostCompletionBlock];
    ((void (**)(void, id, void (**)(void)))v13)[2](v13, v10, v11);
  }
  else
  {
    v11[2](v11);
  }
}

void __60__EXConcreteExtension_cancelExtensionRequestWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = +[EXConcreteExtension globalStateQueueForExtension:*(void *)(a1 + 32)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__EXConcreteExtension_cancelExtensionRequestWithIdentifier___block_invoke_2;
  v4[3] = &unk_1E573CDD8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __60__EXConcreteExtension_cancelExtensionRequestWithIdentifier___block_invoke_2(uint64_t a1)
{
}

- (int)pidForRequestIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  uint64_t v6 = [(NSMutableDictionary *)self->__extensionServiceConnections objectForKeyedSubscript:v4];
  if (!v6)
  {
    id v7 = _EXLegacyLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl(&dword_191F29000, v7, OS_LOG_TYPE_DEFAULT, "nil service connection for UUID: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  int v8 = [v6 processIdentifier];

  os_unfair_lock_unlock(p_unfairLock);
  return v8;
}

- (void)_didCreateExtensionContext:(id)a3
{
  id v4 = a3;
  id v5 = +[_EXDefaults sharedInstance];
  int v6 = [v5 platformShouldExhibitEmbeddedBehavior];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_respondsToSelector()) {
      char v7 = [(id)objc_opt_class() _shouldSendHostApplicationStateNotifications] ^ 1;
    }
    else {
      char v7 = 0;
    }
    os_unfair_lock_lock(&self->_unfairLock);
    if (!self->_observingHostAppStateChanges && (v7 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__EXConcreteExtension__didCreateExtensionContext___block_invoke;
      block[3] = &unk_1E573CBB8;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
      self->_observingHostAppStateChanges = 1;
    }
    os_unfair_lock_unlock(&self->_unfairLock);
  }
}

void __50__EXConcreteExtension__didCreateExtensionContext___block_invoke(uint64_t a1)
{
  Class Class = objc_getClass("UIApplication");
  if (Class)
  {
    id v7 = [(objc_class *)Class performSelector:sel_sharedApplication];
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:*(void *)(a1 + 32) selector:sel__hostWillEnterForegroundNote_ name:@"UIApplicationWillEnterForegroundNotification" object:v7];

    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:*(void *)(a1 + 32) selector:sel__hostDidEnterBackgroundNote_ name:@"UIApplicationDidEnterBackgroundNotification" object:v7];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:*(void *)(a1 + 32) selector:sel__hostWillResignActiveNote_ name:@"UIApplicationWillResignActiveNotification" object:v7];

    int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:*(void *)(a1 + 32) selector:sel__hostDidBecomeActiveNote_ name:@"UIApplicationDidBecomeActiveNotification" object:v7];
  }
}

- (id)objectForInfoDictionaryKey:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  plugIn = self->__plugIn;
  v28[0] = v4;
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  id v7 = plugIn;
  id v8 = v6;
  uint64_t v22 = 0;
  os_signpost_id_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  BOOL v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  if (!v7)
  {
    uint64_t v9 = _EXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[EXConcreteExtension objectForInfoDictionaryKey:]();
    }
  }
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  char v18 = __EXConcreteExtensionGetLocalizedInfoDictionaryObjectForPlugInAndKeys_block_invoke;
  id v19 = &unk_1E573D170;
  uint64_t v21 = &v22;
  id v11 = v10;
  id v20 = v11;
  [(PKPlugIn *)v7 localizedInfoDictionaryForKeys:v8 completion:&v16];
  if (dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL)) {
    NSLog(&cfstr_TimedOutAttemp.isa, v16, v17, v18, v19);
  }
  uint64_t v12 = v20;
  id v13 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  id v14 = [v13 objectForKey:v4];

  return v14;
}

- (id)icons
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(EXConcreteExtension *)self __UIKit_upcall_icons];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (NSBundle)_extensionBundle
{
  extensionBundle = self->__extensionBundle;
  if (extensionBundle)
  {
LABEL_8:
    id v11 = extensionBundle;
    goto LABEL_9;
  }
  plugIn = self->__plugIn;
  id v14 = 0;
  char v5 = [(PKPlugIn *)plugIn useBundle:0 error:&v14];
  id v6 = v14;
  if (v5)
  {
    id v7 = [(PKPlugIn *)self->__plugIn url];
    if (!v7)
    {
      id v8 = _EXDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[EXConcreteExtension _extensionBundle]();
      }
    }
    uint64_t v9 = (NSBundle *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithURL:v7];
    dispatch_semaphore_t v10 = self->__extensionBundle;
    self->__extensionBundle = v9;

    extensionBundle = self->__extensionBundle;
    goto LABEL_8;
  }
  id v13 = _EXDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    [(EXConcreteExtension *)v6 _extensionBundle];
  }

  id v11 = 0;
LABEL_9:

  return v11;
}

- (id)_extensionContextForUUID:(id)a3
{
  id v4 = a3;
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  id v6 = [(NSMutableDictionary *)self->__extensionContexts objectForKey:v4];
  os_unfair_lock_unlock(p_unfairLock);

  return v6;
}

- (id)_itemProviderForPayload:(id)a3 extensionContext:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 objectForKeyedSubscript:0x1EE2CEE30];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = [v5 inputItems];
  uint64_t v24 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v8 = *(void *)v31;
    uint64_t v22 = *(void *)v31;
    id v23 = v5;
    BOOL v25 = v7;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v7);
        }
        dispatch_semaphore_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v11 = objc_msgSend(v10, "attachments", v22);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v27;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v27 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              uint64_t v17 = [v16 _loadOperator];
              char v18 = [v17 identifier];
              char v19 = [v18 isEqual:v6];

              if (v19)
              {
                id v20 = v16;

                id v5 = v23;
                id v7 = v25;
                goto LABEL_19;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        id v7 = v25;
        uint64_t v8 = v22;
      }
      id v20 = 0;
      id v5 = v23;
      uint64_t v24 = [v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v24);
  }
  else
  {
    id v20 = 0;
  }
LABEL_19:

  return v20;
}

- (BOOL)_isPhotoServiceAccessGranted
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(PKPlugIn *)self->__plugIn uuid];
  if (!v2)
  {
    id v3 = _EXDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[EXConcreteExtension _isPhotoServiceAccessGranted]();
    }
  }
  id v4 = +[_EXServiceClient sharedInstance];
  id v9 = 0;
  char v5 = [v4 photoServiceAuthorizationStatusForExtensionUUID:v2 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    id v7 = _EXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v11 = v2;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_191F29000, v7, OS_LOG_TYPE_DEFAULT, "Cannot access privacy settings for %{public}@ with error %{public}@", buf, 0x16u);
    }
  }
  return v5;
}

- (void)_completeRequestReturningItems:(id)a3 forExtensionContextWithUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_191F29000, "completing extension request", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_t v12 = _os_activity_create(&dword_191F29000, "tear down extension request", v11, OS_ACTIVITY_FLAG_DEFAULT);
  id v13 = +[EXConcreteExtension globalStateQueueForExtension:self];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke;
  void v19[3] = &unk_1E573CF40;
  id v20 = v11;
  uint64_t v21 = self;
  id v22 = v9;
  id v23 = v8;
  os_activity_t v24 = v12;
  id v25 = v10;
  uint64_t v14 = v12;
  id v15 = v10;
  id v16 = v8;
  id v17 = v9;
  char v18 = v11;
  dispatch_async(v13, v19);
}

void __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  id v2 = [*(id *)(a1 + 40) requestCompletionBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) requestCompletionBlock];
    uint64_t v4 = *(void *)(a1 + 48);
    char v5 = EXConcreteExtensionFilterItemsWithMCProfile(*(void **)(a1 + 40), *(void **)(a1 + 56));
    ((void (**)(void, uint64_t, void *))v3)[2](v3, v4, v5);
  }
  id v6 = [*(id *)(a1 + 40) _requestPostCompletionBlockWithItems];

  id v7 = *(void **)(a1 + 40);
  if (v6)
  {
    id v8 = [v7 _requestPostCompletionBlockWithItems];
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = EXConcreteExtensionFilterItemsWithMCProfile(*(void **)(a1 + 40), *(void **)(a1 + 56));
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_2;
    v22[3] = &unk_1E573CEF0;
    id v11 = *(void **)(a1 + 48);
    v22[4] = *(void *)(a1 + 40);
    id v23 = v11;
    id v24 = *(id *)(a1 + 72);
    ((void (**)(void, uint64_t, void *, void *))v8)[2](v8, v9, v10, v22);
    os_activity_t v12 = &v23;
    id v13 = &v24;
  }
  else
  {
    uint64_t v14 = [v7 _requestPostCompletionBlock];

    id v15 = *(void **)(a1 + 40);
    if (!v14)
    {
      EXConcreteExtensionTearDownRequestCompletion(v15, *(void **)(a1 + 48), *(void **)(a1 + 72));
      goto LABEL_8;
    }
    id v16 = [v15 _requestPostCompletionBlock];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_4;
    v18[3] = &unk_1E573CF18;
    uint64_t v17 = *(void *)(a1 + 48);
    v18[4] = *(void *)(a1 + 40);
    id v19 = *(id *)(a1 + 64);
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 72);
    ((void (**)(void, uint64_t, void *))v16)[2](v16, v17, v18);
    os_activity_t v12 = &v19;
    id v13 = &v20;

    id v8 = (void (**)(void, void, void, void))v21;
  }

LABEL_8:
  os_activity_scope_leave(&state);
}

void __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_2(uint64_t a1)
{
  id v2 = +[EXConcreteExtension globalStateQueueForExtension:*(void *)(a1 + 32)];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_3;
  block[3] = &unk_1E573CEF0;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_3(void **a1)
{
}

void __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_4(uint64_t a1)
{
  id v2 = +[EXConcreteExtension globalStateQueueForExtension:*(void *)(a1 + 32)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_5;
  v5[3] = &unk_1E573CF18;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  dispatch_async(v2, v5);
}

void __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_5(uint64_t a1)
{
  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v2);
  EXConcreteExtensionTearDownRequestCompletion(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
  os_activity_scope_leave(&v2);
}

- (void)_cancelRequestWithError:(id)a3 forExtensionContextWithUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_activity_t v11 = _os_activity_create(&dword_191F29000, "cancelling extension request", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_t v12 = +[EXConcreteExtension globalStateQueueForExtension:self];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__EXConcreteExtension__cancelRequestWithError_forExtensionContextWithUUID_completion___block_invoke;
  block[3] = &unk_1E573CF68;
  os_activity_t v18 = v11;
  id v19 = self;
  id v20 = v9;
  id v21 = v8;
  id v22 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  id v16 = v11;
  dispatch_async(v12, block);
}

void __86__EXConcreteExtension__cancelRequestWithError_forExtensionContextWithUUID_completion___block_invoke(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  os_activity_scope_state_s v2 = [*(id *)(a1 + 40) requestCancellationBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) requestCancellationBlock];
    v3[2](v3, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__EXConcreteExtension__cancelRequestWithError_forExtensionContextWithUUID_completion___block_invoke_2;
  aBlock[3] = &unk_1E573CD38;
  id v4 = *(id *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v14 = v4;
  void aBlock[4] = v5;
  id v13 = v6;
  uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 40) _requestPostCompletionBlockWithItems];

  id v9 = *(void **)(a1 + 40);
  if (v8)
  {
    id v10 = [v9 _requestPostCompletionBlockWithItems];
    ((void (**)(void, void, void, void (**)(void)))v10)[2](v10, *(void *)(a1 + 48), 0, v7);
  }
  else
  {
    os_activity_t v11 = [v9 _requestPostCompletionBlock];

    if (!v11)
    {
      v7[2](v7);
      goto LABEL_8;
    }
    id v10 = [*(id *)(a1 + 40) _requestPostCompletionBlock];
    ((void (*)(void (**)(void, void, void, void), void, void (**)(void)))v10[2])(v10, *(void *)(a1 + 48), v7);
  }

LABEL_8:
  os_activity_scope_leave(&state);
}

void __86__EXConcreteExtension__cancelRequestWithError_forExtensionContextWithUUID_completion___block_invoke_2(void *a1)
{
  os_activity_scope_state_s v2 = _EXLegacyLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_191F29000, v2, OS_LOG_TYPE_DEFAULT, "in completeTearDown block", v6, 2u);
  }

  (*(void (**)(void))(a1[6] + 16))();
  id v4 = (void *)a1[4];
  id v3 = (void *)a1[5];
  [v4 requestTeardownDelay];
  EXConcreteExtensionTearDownRequestWithIdentifier(v4, v3, (uint64_t)v5);
}

- (void)_loadItemForPayload:(id)a3 contextIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(EXConcreteExtension *)self _extensionContextForUUID:a4];
  os_activity_t v11 = [(EXConcreteExtension *)self _itemProviderForPayload:v9 extensionContext:v10];
  os_activity_t v12 = [v9 objectForKeyedSubscript:0x1EE2CEE50];
  id v13 = [v9 objectForKeyedSubscript:0x1EE2CEE70];
  Class Class = objc_getClass((const char *)[v13 UTF8String]);
  id v15 = [v9 objectForKeyedSubscript:0x1EE2CEE90];

  long long v31 = 0u;
  long long v32 = 0u;
  id v16 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v17 = v16;
  if (v16)
  {
    [v16 auditToken];
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  long long v28 = v31;
  v22[2] = __79__EXConcreteExtension__loadItemForPayload_contextIdentifier_completionHandler___block_invoke;
  v22[3] = &unk_1E573CFB8;
  id v26 = v8;
  Class v27 = Class;
  id v23 = v11;
  id v24 = v12;
  char v30 = 1;
  long long v29 = v32;
  id v25 = v15;
  id v18 = v8;
  id v19 = v15;
  id v20 = v12;
  id v21 = v11;
  dispatch_async(MEMORY[0x1E4F14428], v22);
}

void __79__EXConcreteExtension__loadItemForPayload_contextIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  id v4 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__EXConcreteExtension__loadItemForPayload_contextIdentifier_completionHandler___block_invoke_2;
  v7[3] = &unk_1E573CF90;
  char v12 = *(unsigned char *)(a1 + 104);
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 88);
  long long v10 = *(_OWORD *)(a1 + 72);
  long long v11 = v6;
  id v9 = *(id *)(a1 + 56);
  [v4 _loadItemOfClass:v2 forTypeIdentifier:v8 options:v5 coerceForCoding:1 completionHandler:v7];
}

void __79__EXConcreteExtension__loadItemForPayload_contextIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 80))
  {
    CFStringRef v6 = *(const __CFString **)(a1 + 32);
    if (v6)
    {
      if (UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E4F226F8]) && _NSIsNSData())
      {
        uint64_t v7 = [MEMORY[0x1E4F1CB10] objectWithItemProviderData:v15 typeIdentifier:*(void *)(a1 + 32) error:0];
        id v8 = v7;
        if (v7)
        {
          long long v9 = *(_OWORD *)(a1 + 64);
          long long v16 = *(_OWORD *)(a1 + 48);
          long long v17 = v9;
          long long v10 = EXConcreteExtensionGetSandboxedResourceForItemIfNeeded(v7, &v16, 0);
          long long v11 = v10;
          if (v10)
          {
            id v12 = v10;

            id v15 = v12;
          }
        }
      }
    }
  }
  id v13 = *(void **)(a1 + 40);
  long long v14 = *(_OWORD *)(a1 + 64);
  long long v16 = *(_OWORD *)(a1 + 48);
  long long v17 = v14;
  EXConcreteExtensionCompleteItemLoading(v15, &v16, v5, v13);
}

- (void)_loadPreviewImageForPayload:(id)a3 contextIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  long long v10 = [(EXConcreteExtension *)self _extensionContextForUUID:a4];
  long long v11 = [(EXConcreteExtension *)self _itemProviderForPayload:v9 extensionContext:v10];
  id v12 = [v9 objectForKeyedSubscript:0x1EE2CEE70];
  Class Class = objc_getClass((const char *)[v12 UTF8String]);
  long long v14 = [v9 objectForKeyedSubscript:0x1EE2CEE90];

  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = [MEMORY[0x1E4F29268] currentConnection];
  long long v16 = v15;
  if (v15)
  {
    [v15 auditToken];
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__EXConcreteExtension__loadPreviewImageForPayload_contextIdentifier_completionHandler___block_invoke;
  v20[3] = &unk_1E573D008;
  id v21 = v11;
  id v22 = v14;
  long long v25 = v27;
  long long v26 = v28;
  id v23 = v8;
  Class v24 = Class;
  id v17 = v8;
  id v18 = v14;
  id v19 = v11;
  dispatch_async(MEMORY[0x1E4F14428], v20);
}

void __87__EXConcreteExtension__loadPreviewImageForPayload_contextIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  long long v3 = *(_OWORD *)(a1 + 80);
  long long v7 = *(_OWORD *)(a1 + 64);
  long long v8 = v3;
  v5[2] = __87__EXConcreteExtension__loadPreviewImageForPayload_contextIdentifier_completionHandler___block_invoke_2;
  v5[3] = &unk_1E573CFE0;
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v1 _loadPreviewImageOfClass:v4 options:v2 coerceForCoding:1 completionHandler:v5];
}

void __87__EXConcreteExtension__loadPreviewImageForPayload_contextIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  long long v3 = *(void **)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v4;
  EXConcreteExtensionCompleteItemLoading(a2, v5, a3, v3);
}

- (void)_openURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__EXConcreteExtension__openURL_completion___block_invoke;
    block[3] = &unk_1E573CEF0;
    void block[4] = self;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __43__EXConcreteExtension__openURL_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = _Block_copy(*(const void **)(a1 + 48));
  [v1 performSelector:sel___UI_upcall_openURL_completion_ withObject:v2 withObject:v3];
}

- (BOOL)_isSystemExtension
{
  id v3 = [(EXConcreteExtension *)self infoDictionary];

  if (!v3)
  {
    long long v4 = _EXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[EXConcreteExtension _isSystemExtension]();
    }
  }
  id v5 = [(EXConcreteExtension *)self infoDictionary];
  id v6 = [v5 objectForKey:@"XPCService"];

  id v7 = [v6 objectForKey:@"ServiceType"];
  char v8 = [v7 isEqualToString:@"System"];

  return v8;
}

- (double)requestTeardownDelay
{
  uint64_t v2 = [(EXConcreteExtension *)self infoDictionary];
  id v3 = [v2 objectForKey:@"NSExtension"];

  long long v4 = [v3 objectForKey:@"NSExtensionDisableTeardownDelay"];
  int v5 = [v4 BOOLValue];

  if (v5) {
    double v6 = 0.0;
  }
  else {
    double v6 = 5.0;
  }

  return v6;
}

- (Class)_hostContextClass
{
  id v3 = [(NSDictionary *)self->_infoDictionary objectForKey:@"NSExtension"];
  uint64_t v4 = [v3 objectForKey:@"NSExtensionContextHostClass"];
  if (v4)
  {
    int v5 = (void *)v4;

    goto LABEL_4;
  }
  int v5 = [(NSDictionary *)self->_infoDictionary objectForKey:@"NSExtensionContextHostClass"];

  if (v5)
  {
LABEL_4:
    id v6 = v5;
    Class Class = objc_getClass((const char *)[v6 UTF8String]);
    if (Class) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  Class Class = objc_opt_class();
  id v6 = 0;
  if (Class) {
    goto LABEL_8;
  }
LABEL_5:
  char v8 = _EXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    [(EXConcreteExtension *)(uint64_t)v6 _hostContextClass];
  }

LABEL_8:
  id v9 = Class;

  return v9;
}

- (int)_plugInProcessIdentifier
{
  uint64_t v2 = [(PKPlugIn *)self->__plugIn pluginConnection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (void)_safelyBeginUsing:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  [v5 setOptions:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__EXConcreteExtension__safelyBeginUsing___block_invoke;
  v7[3] = &unk_1E573D030;
  id v8 = v4;
  id v6 = v4;
  [(EXConcreteExtension *)self _safelyBeginUsingWithRequest:v5 readyHandler:v7];
}

uint64_t __41__EXConcreteExtension__safelyBeginUsing___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = _EXLegacyLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = [WeakRetained xpcConnection];
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_191F29000, v2, OS_LOG_TYPE_DEFAULT, "Assertion invalidated: Invalidating XPC connection %{public}@ ", (uint8_t *)&v5, 0xCu);
    }
    id v4 = [WeakRetained xpcConnection];
    [v4 invalidate];
  }
}

void __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x192FEB110]();
  if (useAssertions())
  {
    int v5 = (id *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 32) _plugInProcessIdentifier];
    if (!v6)
    {
      uint64_t v7 = _EXLegacyLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_139_cold_4();
      }
    }
    id v8 = [*(id *)(*(void *)(a1 + 32) + 80) pluginConnection];
    id v9 = [v8 _xpcConnection];
    objc_msgSend(*(id *)(a1 + 32), "set_stashedPlugInConnection:", v9);

    id v10 = *(void **)(a1 + 40);
    if (v10 && v6 == *(_DWORD *)(a1 + 80))
    {
      id v11 = v10;
LABEL_12:
      long long v14 = v11;
      goto LABEL_18;
    }
    [v10 invalidate];
    id v12 = *v5;
    id v13 = [*v5 identifier];
    if (([v12 _wantsProcessPerRequest] & 1) == 0)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __EXConcreteExtensionSetProcessIdentifierForExtensionIdentifier_block_invoke;
      long long v27 = &unk_1E573D1F8;
      id v28 = v13;
      int v29 = v6;
      safelyAccessPidForExtensionIdentiferDictionary(buf);
    }
    _NSAcquireProcessAssertionForPIDWithOptions(v6, [*(id *)(a1 + 48) options], *(void **)(a1 + 56));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11) {
      goto LABEL_12;
    }
    id v15 = _EXLegacyLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *((void *)*v5 + 10);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      _os_log_error_impl(&dword_191F29000, v15, OS_LOG_TYPE_ERROR, "Failed to acquire assertion for plugin: %{public}@ pid: %d", buf, 0x12u);
    }

    if (!v3)
    {
      long long v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28268];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      long long v25 = @"The plugin cannot be restarted.";
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      id v3 = [v16 errorWithDomain:v17 code:-1 userInfo:v18];
    }
  }
  long long v14 = 0;
LABEL_18:
  id v19 = _EXLegacyLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_139_cold_3(a1, (uint64_t)v3, v19);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  int v20 = useAssertions();
  if (!v14 && v20)
  {
    id v21 = _EXLegacyLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_139_cold_2(a1, v21);
    }

    [*(id *)(a1 + 32) _kill:9];
  }
  if (v3)
  {
    id v22 = _EXLegacyLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_139_cold_1(a1, v22);
    }

    [v14 invalidate];
    [*(id *)(a1 + 32) _kill:9];
  }
  os_activity_scope_leave((os_activity_scope_state_t)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
}

- (void)_safelyBeginUsingWithRequest:(id)a3 readyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _sharedSafePluginQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__EXConcreteExtension__safelyBeginUsingWithRequest_readyHandler___block_invoke;
  block[3] = &unk_1E573CEF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __65__EXConcreteExtension__safelyBeginUsingWithRequest_readyHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _safelyBeginUsingSynchronously:0 request:*(void *)(a1 + 40) readyHandler:*(void *)(a1 + 48)];
}

- (BOOL)_beginUsingAndCreateExtensionAssertionWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _sharedSafePluginQueue();
  dispatch_assert_queue_not_V2(v7);

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  id v8 = _sharedSafePluginQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__EXConcreteExtension__beginUsingAndCreateExtensionAssertionWithRequest_error___block_invoke;
  block[3] = &unk_1E573D0D0;
  void block[4] = self;
  id v9 = v6;
  id v15 = v9;
  long long v16 = &v17;
  dispatch_sync(v8, block);

  id v10 = [v9 assertion];
  if (v10)
  {

LABEL_3:
    BOOL v11 = 1;
    goto LABEL_4;
  }
  id v13 = (void *)v18[5];
  if (!v13) {
    goto LABEL_3;
  }
  BOOL v11 = 0;
  if (a4) {
    *a4 = v13;
  }
LABEL_4:

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __79__EXConcreteExtension__beginUsingAndCreateExtensionAssertionWithRequest_error___block_invoke(void *a1)
{
  id v3 = (void *)a1[4];
  uint64_t v2 = (void *)a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__EXConcreteExtension__beginUsingAndCreateExtensionAssertionWithRequest_error___block_invoke_2;
  v6[3] = &unk_1E573D0A8;
  id v4 = v2;
  uint64_t v5 = a1[6];
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 _safelyBeginUsingSynchronously:1 request:v4 readyHandler:v6];
}

void __79__EXConcreteExtension__beginUsingAndCreateExtensionAssertionWithRequest_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setAssertion:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)_safelyEndUsing:(id)a3
{
}

- (void)_safelyEndUsingRequestWithPKUUID:(id)a3 processAssertion:(id)a4 continuation:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = _sharedSafePluginQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke;
  block[3] = &unk_1E573D0F8;
  id v13 = v7;
  id v14 = v8;
  void block[4] = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

void __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v2)
  {
    id v3 = v2;
    id v4 = _EXLegacyLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_cold_2();
    }

    if (objc_opt_respondsToSelector())
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_150;
      void v13[3] = &unk_1E573CE00;
      id v5 = &v14;
      uint64_t v6 = *(void *)(a1 + 40);
      id v14 = *(id *)(a1 + 48);
      [v3 endUsingRequest:v6 completion:v13];
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_2;
      v11[3] = &unk_1E573CE00;
      id v5 = &v12;
      id v12 = *(id *)(a1 + 48);
      [v3 endUsing:v11];
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28268];
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"The plugin has been invalidated.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v3 = [v7 errorWithDomain:v8 code:-1 userInfo:v9];

    id v10 = _EXLegacyLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_150(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_kill:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = _EXLegacyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[EXConcreteExtension _kill:]();
  }

  uint64_t v6 = [(PKPlugIn *)self->__plugIn pluginConnection];
  [v6 _killConnection:v3];

  id v7 = [(EXConcreteExtension *)self _stashedPlugInConnection];

  if (v7)
  {
    uint64_t v8 = [(EXConcreteExtension *)self _stashedPlugInConnection];
    xpc_connection_kill();

    [(EXConcreteExtension *)self set_stashedPlugInConnection:0];
  }
}

- (id)extensionContexts
{
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  id v4 = [(NSMutableDictionary *)self->__extensionContexts allValues];
  os_unfair_lock_unlock(p_unfairLock);

  return v4;
}

- (void)_dropAssertion
{
  uint64_t v3 = _sharedSafePluginQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EXConcreteExtension__dropAssertion__block_invoke;
  block[3] = &unk_1E573CBB8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

void __37__EXConcreteExtension__dropAssertion__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "extensionContexts", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = [*(id *)(*((void *)&v8 + 1) + 8 * v5) internalImplementation];
        id v7 = [v6 _processAssertion];
        [v7 invalidate];
        [v6 _setProcessAssertion:0];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (void)_hostWillEnterForegroundNote:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__EXConcreteExtension__hostWillEnterForegroundNote___block_invoke;
  v3[3] = &unk_1E573CBB8;
  v3[4] = self;
  EXConcreteExtensionDispatchSyncFromMainQueueToGlobalStateQueue(self, v3);
}

void __52__EXConcreteExtension__hostWillEnterForegroundNote___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "extensionContexts", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v7 = [v6 internalImplementation];
        long long v8 = [v7 _extensionVendorProxy];
        long long v9 = [v6 _UUID];
        [v8 _hostWillEnterForegroundForContextUUID:v9 completion:&__block_literal_global_152];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

- (void)_hostDidEnterBackgroundNote:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__EXConcreteExtension__hostDidEnterBackgroundNote___block_invoke;
  v3[3] = &unk_1E573CBB8;
  v3[4] = self;
  EXConcreteExtensionDispatchSyncFromMainQueueToGlobalStateQueue(self, v3);
}

void __51__EXConcreteExtension__hostDidEnterBackgroundNote___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "extensionContexts", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v7 = [v6 internalImplementation];
        long long v8 = [v7 _extensionVendorProxy];
        long long v9 = [v6 _UUID];
        [v8 _hostDidEnterBackgroundForContextUUID:v9 completion:&__block_literal_global_154];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

- (void)_hostWillResignActiveNote:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__EXConcreteExtension__hostWillResignActiveNote___block_invoke;
  v3[3] = &unk_1E573CBB8;
  v3[4] = self;
  EXConcreteExtensionDispatchSyncFromMainQueueToGlobalStateQueue(self, v3);
}

void __49__EXConcreteExtension__hostWillResignActiveNote___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "extensionContexts", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v7 = [v6 internalImplementation];
        long long v8 = [v7 _extensionVendorProxy];
        long long v9 = [v6 _UUID];
        [v8 _hostWillResignActiveForContextUUID:v9 completion:&__block_literal_global_156];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

- (void)_hostDidBecomeActiveNote:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__EXConcreteExtension__hostDidBecomeActiveNote___block_invoke;
  v3[3] = &unk_1E573CBB8;
  v3[4] = self;
  EXConcreteExtensionDispatchSyncFromMainQueueToGlobalStateQueue(self, v3);
}

void __48__EXConcreteExtension__hostDidBecomeActiveNote___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "extensionContexts", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v7 = [v6 internalImplementation];
        long long v8 = [v7 _extensionVendorProxy];
        long long v9 = [v6 _UUID];
        [v8 _hostDidBecomeActiveForContextUUID:v9 completion:&__block_literal_global_158];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

- (id)version
{
  return self->_version;
}

- (id)attributes
{
  return self->_attributes;
}

- (NSString)_localizedName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)_localizedShortName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSUUID)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
}

- (void)_setPlugIn:(id)a3
{
}

- (NSArray)_internalPersonas
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableDictionary)_extensionServiceConnections
{
  return self->__extensionServiceConnections;
}

- (void)_setExtensionServiceConnections:(id)a3
{
}

- (NSMutableDictionary)_extensionExpirationIdentifiers
{
  return self->__extensionExpirationIdentifiers;
}

- (void)_setExtensionExpirationsIdentifiers:(id)a3
{
}

- (NSMutableDictionary)_extensionContexts
{
  return self->__extensionContexts;
}

- (void)_setExtensionContexts:(id)a3
{
}

- (id)_stashedPlugInConnection
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)set_stashedPlugInConnection:(id)a3
{
}

- (id)requestCompletionBlock
{
  return self->_requestCompletionBlock;
}

- (void)setRequestCompletionBlock:(id)a3
{
}

- (id)requestCancellationBlock
{
  return self->_requestCancellationBlock;
}

- (void)setRequestCancellationBlock:(id)a3
{
}

- (id)requestInterruptionBlock
{
  return self->_requestInterruptionBlock;
}

- (id)_requestPostCompletionBlock
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)set_requestPostCompletionBlock:(id)a3
{
}

- (id)_requestPostCompletionBlockWithItems
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)set_requestPostCompletionBlockWithItems:(id)a3
{
}

- (NSSet)_allowedErrorClasses
{
  return self->__allowedErrorClasses;
}

- (void)_setAllowedErrorClasses:(id)a3
{
}

- (BOOL)_isObservingHostAppStateChanges
{
  return self->_observingHostAppStateChanges;
}

- (void)_setObservingHostAppStateChanges:(BOOL)a3
{
  self->_observingHostAppStateChanges = a3;
}

- (int64_t)wantsDedicatedQueue
{
  return self->_wantsDedicatedQueue;
}

- (void)setWantsDedicatedQueue:(int64_t)a3
{
  self->_wantsDedicatedQueue = a3;
}

- (NSDictionary)_extensionState
{
  uint64_t v2 = [(EXConcreteExtension *)self _plugIn];
  uint64_t v3 = [v2 extensionState];
  uint64_t v4 = (void *)[v3 copy];

  return (NSDictionary *)v4;
}

- (void)_setExtensionState:(id)a3
{
  id v5 = (id)[a3 copy];
  uint64_t v4 = [(EXConcreteExtension *)self _plugIn];
  [v4 setExtensionState:v5];
}

- (BOOL)_isMarkedNew
{
  uint64_t v3 = [(EXConcreteExtension *)self _plugIn];
  uint64_t v4 = [v3 userElection];

  if (v4) {
    return 0;
  }
  uint64_t v6 = [(EXConcreteExtension *)self _plugIn];
  id v7 = [v6 valueForKey:@"extensionState"];

  long long v8 = [v7 objectForKeyedSubscript:@"lastDateManagedOn"];

  if (v8)
  {
    BOOL v5 = 0;
  }
  else
  {
    long long v9 = [v7 objectForKeyedSubscript:@"firstDateIndicatedFor"];
    if (v9)
    {
      long long v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      long long v11 = [MEMORY[0x1E4F1C9C8] date];
      long long v12 = [v10 components:16 fromDate:v9 toDate:v11 options:0];

      BOOL v5 = [v12 day] < 2;
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  return v5;
}

- (void)_didShowExtensionManagementInterface
{
  uint64_t v3 = [(EXConcreteExtension *)self _extensionState];
  id v5 = (id)[v3 mutableCopy];

  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [v5 setObject:v4 forKey:@"lastDateManagedOn"];

  [(EXConcreteExtension *)self willChangeValueForKey:@"markedNew"];
  [(EXConcreteExtension *)self _setExtensionState:v5];
  [(EXConcreteExtension *)self didChangeValueForKey:@"markedNew"];
}

- (void)_didShowNewExtensionIndicator
{
  uint64_t v3 = [(EXConcreteExtension *)self _extensionState];
  id v6 = (id)[v3 mutableCopy];

  uint64_t v4 = [v6 objectForKey:@"firstDateIndicatedFor"];

  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    [v6 setObject:v5 forKey:@"firstDateIndicatedFor"];

    [(EXConcreteExtension *)self willChangeValueForKey:@"markedNew"];
    [(EXConcreteExtension *)self _setExtensionState:v6];
    [(EXConcreteExtension *)self didChangeValueForKey:@"markedNew"];
  }
}

- (void)_resetExtensionState
{
  [(EXConcreteExtension *)self willChangeValueForKey:@"markedNew"];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionary];
  [(EXConcreteExtension *)self _setExtensionState:v3];

  [(EXConcreteExtension *)self didChangeValueForKey:@"markedNew"];
}

+ (id)_inputItemsByApplyingActiveWebPageAlternative:(id)a3 ifNeededByActivationRule:(id)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  if ([a1 _evaluateActivationRule:a4 withInputItemsIfTheyMatchActiveWebPageAlternative:v6 matchResult:&v11])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __131__EXConcreteExtension_NSExtensionActiveWebPageAlternative___inputItemsByApplyingActiveWebPageAlternative_ifNeededByActivationRule___block_invoke;
    v10[3] = &__block_descriptor_40_e42_B24__0__NSExtensionItem_8__NSDictionary_16l;
    void v10[4] = v11;
    id v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v10];
    uint64_t v8 = [v6 filteredArrayUsingPredicate:v7];

    id v6 = (id)v8;
  }

  return v6;
}

uint64_t __131__EXConcreteExtension_NSExtensionActiveWebPageAlternative___inputItemsByApplyingActiveWebPageAlternative_ifNeededByActivationRule___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = objc_msgSend(v3, "attachments", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (*(void *)(a1 + 32) == 1)
        {
          long long v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) registeredTypeIdentifiers];
          int v11 = [v10 containsObject:@"com.apple.webarchive"];

          if (!v11) {
            goto LABEL_19;
          }
        }
        long long v12 = [v3 userInfo];
        long long v13 = [v12 objectForKeyedSubscript:@"supportsJavaScript"];

        if (*(void *)(a1 + 32) == 2)
        {
          id v14 = [v9 registeredTypeIdentifiers];
          if (![v14 containsObject:@"public.url"]
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {

LABEL_19:
            uint64_t v16 = 0;
            goto LABEL_20;
          }
          int v15 = [v13 BOOLValue];

          if (!v15) {
            goto LABEL_19;
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v16 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v16 = 1;
  }
LABEL_20:

  return v16;
}

+ (BOOL)_matchingDictionaryMatchesActiveWebPageAlternative:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"extensionItems"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  char v7 = [a1 _genericValuesMatchActiveWebPageAlternativeWithExtensionItems:v6 attachmentsLens:&__block_literal_global_2 registeredTypeIdentifiersLens:&__block_literal_global_34 isActiveWebPageAttachmentCheck:&__block_literal_global_37];
  return v7;
}

id __111__EXConcreteExtension_NSExtensionActiveWebPageAlternative___matchingDictionaryMatchesActiveWebPageAlternative___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 objectForKeyedSubscript:@"attachments"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id __111__EXConcreteExtension_NSExtensionActiveWebPageAlternative___matchingDictionaryMatchesActiveWebPageAlternative___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 objectForKeyedSubscript:@"registeredTypeIdentifiers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

uint64_t __111__EXConcreteExtension_NSExtensionActiveWebPageAlternative___matchingDictionaryMatchesActiveWebPageAlternative___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 objectForKeyedSubscript:@"registeredTypeIdentifiers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 containsObject:@"com.apple.active-webpage"];
  return v6;
}

+ (BOOL)_inputItemsMatchActiveWebPageAlternative:(id)a3
{
  return [a1 _genericValuesMatchActiveWebPageAlternativeWithExtensionItems:a3 attachmentsLens:&__block_literal_global_40 registeredTypeIdentifiersLens:&__block_literal_global_43 isActiveWebPageAttachmentCheck:&__block_literal_global_46];
}

uint64_t __101__EXConcreteExtension_NSExtensionActiveWebPageAlternative___inputItemsMatchActiveWebPageAlternative___block_invoke(uint64_t a1, void *a2)
{
  return [a2 attachments];
}

uint64_t __101__EXConcreteExtension_NSExtensionActiveWebPageAlternative___inputItemsMatchActiveWebPageAlternative___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 registeredTypeIdentifiers];
}

uint64_t __101__EXConcreteExtension_NSExtensionActiveWebPageAlternative___inputItemsMatchActiveWebPageAlternative___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"supportsJavaScript"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  int v9 = [v8 BOOLValue];
  if (v9)
  {
    long long v10 = [v4 registeredTypeIdentifiers];
    uint64_t v11 = [v10 containsObject:@"public.url"];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (BOOL)_genericValuesMatchActiveWebPageAlternativeWithExtensionItems:(id)a3 attachmentsLens:(id)a4 registeredTypeIdentifiersLens:(id)a5 isActiveWebPageAttachmentCheck:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 count] == 2)
  {
    uint64_t v31 = 0;
    long long v32 = &v31;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __199__EXConcreteExtension_NSExtensionActiveWebPageAlternative___genericValuesMatchActiveWebPageAlternativeWithExtensionItems_attachmentsLens_registeredTypeIdentifiersLens_isActiveWebPageAttachmentCheck___block_invoke;
    aBlock[3] = &unk_1E573D3F0;
    id v22 = v10;
    id v23 = v11;
    long long v25 = &v31;
    long long v26 = &v27;
    id v24 = v12;
    long long v13 = (void (**)(void *, void *, void))_Block_copy(aBlock);
    id v14 = [v9 objectAtIndexedSubscript:0];
    v13[2](v13, v14, 0);

    int v15 = [v9 objectAtIndexedSubscript:1];
    v13[2](v13, v15, 1);

    uint64_t v16 = v32[3];
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v17 = 0;
    }
    else
    {
      uint64_t v18 = v28[3];
      BOOL v17 = v18 != 0x7FFFFFFFFFFFFFFFLL && v16 != v18;
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

void __199__EXConcreteExtension_NSExtensionActiveWebPageAlternative___genericValuesMatchActiveWebPageAlternativeWithExtensionItems_attachmentsLens_registeredTypeIdentifiersLens_isActiveWebPageAttachmentCheck___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  id v5 = (*(void (**)(void))(a1[4] + 16))();
  uint64_t v6 = v5;
  if (v5 && [v5 count] == 1)
  {
    char v7 = [v6 objectAtIndexedSubscript:0];
    id v8 = (*(void (**)(void))(a1[5] + 16))();
    if (v8)
    {
      id v9 = v8;
      if (*(void *)(*(void *)(a1[7] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL
        && [v8 containsObject:@"com.apple.webarchive"])
      {
        *(void *)(*(void *)(a1[7] + 8) + 24) = a3;
      }
      if (*(void *)(*(void *)(a1[8] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL
        && (*(unsigned int (**)(void))(a1[6] + 16))())
      {
        *(void *)(*(void *)(a1[8] + 8) + 24) = a3;
      }
    }
  }
}

+ (id)_dictionaryIncludingOnlyItemsWithRegisteredTypeIdentifier:(id)a3 fromMatchingDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [v6 objectForKeyedSubscript:@"extensionItems"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __141__EXConcreteExtension_NSExtensionActiveWebPageAlternative___dictionaryIncludingOnlyItemsWithRegisteredTypeIdentifier_fromMatchingDictionary___block_invoke;
  v16[3] = &unk_1E573D418;
  id v17 = v5;
  id v10 = v5;
  id v11 = [v9 indexesOfObjectsPassingTest:v16];

  if ([v11 count])
  {
    id v12 = (id)[v6 mutableCopy];
    long long v13 = [v6 objectForKeyedSubscript:@"extensionItems"];
    id v14 = (void *)[v13 mutableCopy];

    [v14 removeObjectsAtIndexes:v11];
    [v12 setObject:v14 forKey:@"extensionItems"];
  }
  else
  {
    id v12 = v6;
  }

  return v12;
}

uint64_t __141__EXConcreteExtension_NSExtensionActiveWebPageAlternative___dictionaryIncludingOnlyItemsWithRegisteredTypeIdentifier_fromMatchingDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [v4 objectForKeyedSubscript:@"attachments"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v22 = v3;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v14 = v13;
        }
        else {
          id v14 = 0;
        }
        id v15 = v14;

        uint64_t v16 = [v15 objectForKeyedSubscript:@"registeredTypeIdentifiers"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v17 = v16;
        }
        else {
          id v17 = 0;
        }
        id v18 = v17;

        char v19 = [v18 containsObject:*(void *)(a1 + 32)];
        if (v19)
        {
          uint64_t v20 = 0;
          goto LABEL_23;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    uint64_t v20 = 1;
LABEL_23:
    id v3 = v22;
  }
  else
  {
    uint64_t v20 = 1;
  }

  return v20;
}

+ (BOOL)_evaluateActivationRule:(id)a3 withInputItemsIfTheyMatchActiveWebPageAlternative:(id)a4 matchResult:(int64_t *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v12 = @"extensionItems";
  id v8 = a3;
  uint64_t v9 = [a4 valueForKey:@"_matchingDictionaryRepresentation"];
  v13[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  LOBYTE(a5) = [a1 _evaluateActivationRule:v8 withDictionaryIfItMatchesActiveWebPageAlternative:v10 matchResult:a5];

  return (char)a5;
}

+ (BOOL)_evaluateActivationRule:(id)a3 withDictionaryIfItMatchesActiveWebPageAlternative:(id)a4 matchResult:(int64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [a1 _matchingDictionaryMatchesActiveWebPageAlternative:v9];
  if (v10)
  {
    if ([a1 _evaluateActivationRuleWithoutWorkarounds:v8 withExtensionItemsRepresentation:v9])
    {
      *a5 = 3;
    }
    else
    {
      uint64_t v11 = [a1 _dictionaryIncludingOnlyItemsWithRegisteredTypeIdentifier:@"com.apple.active-webpage" fromMatchingDictionary:v9];
      if ([a1 _evaluateActivationRuleWithoutWorkarounds:v8 withExtensionItemsRepresentation:v11])
      {
        *a5 = 2;
      }
      else
      {
        id v12 = [a1 _dictionaryIncludingOnlyItemsWithRegisteredTypeIdentifier:@"com.apple.webarchive" fromMatchingDictionary:v9];
        *a5 = [a1 _evaluateActivationRuleWithoutWorkarounds:v8 withExtensionItemsRepresentation:v12];
      }
    }
  }

  return v10;
}

+ (BOOL)evaluateActivationRule:(id)a3 withExtensionItemsRepresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = 0;
  if ([a1 _evaluateActivationRule:v6 withDictionaryIfItMatchesActiveWebPageAlternative:v7 matchResult:&v10])char v8 = v10 != 0; {
  else
  }
    char v8 = [a1 _evaluateActivationRuleWithoutWorkarounds:v6 withExtensionItemsRepresentation:v7];

  return v8;
}

+ (BOOL)_evaluateActivationRuleWithoutWorkarounds:(id)a3 withExtensionItemsRepresentation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    if (_NSIsNSDictionary())
    {
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 1;
      id v7 = [v5 allValues];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __109__EXConcreteExtension_Filtering___evaluateActivationRuleWithoutWorkarounds_withExtensionItemsRepresentation___block_invoke;
      v15[3] = &unk_1E573D4B0;
      v15[4] = &v16;
      [v7 enumerateObjectsUsingBlock:v15];

      if (*((unsigned char *)v17 + 24))
      {
        char matched = 0;
LABEL_5:
        _Block_object_dispose(&v16, 8);
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v10 = +[_EXDefaults sharedInstance];
      int v11 = [v10 platformShouldExhibitEmbeddedBehavior];

      if (v11)
      {
        id v12 = [v5 objectForKey:@"NSExtensionActivationSupportsLocationWithMaxCount"];
        if (v12 && _NSIsNSNumber() && (int)[v12 intValue] >= 1)
        {
          char matched = _EXExtensionItemsMatchHackishRepresentationOfSharedLocationExtensionItems(v6);
          if ((matched & 1) != 0 || [v5 count] == 1)
          {

            goto LABEL_5;
          }
          id v13 = (void *)[v5 mutableCopy];
          [v13 removeObjectForKey:@"NSExtensionActivationSupportsLocationWithMaxCount"];
        }
        else
        {
          id v13 = v5;
        }

        id v5 = v13;
      }
      _Block_object_dispose(&v16, 8);
      id v9 = _EXExtensionPredicateForActivationRule(v5);
    }
    else
    {
      id v9 = _EXExtensionPredicateForActivationRule(v5);
      if (!EXExtensionIsPredicateSafeToExecuteWithObject(v9, v6))
      {
        char matched = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    char matched = [v9 evaluateWithObject:v6];
    goto LABEL_20;
  }
  char matched = 0;
LABEL_22:

  return matched;
}

void __109__EXConcreteExtension_Filtering___evaluateActivationRuleWithoutWorkarounds_withExtensionItemsRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 intValue])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

+ (id)predicateForActivationRule:(id)a3
{
  return _EXExtensionPredicateForActivationRule(a3);
}

void __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_0(&dword_191F29000, v0, v1, "errors encountered while discovering extensions: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_bareExtensionServiceConnection
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_191F29000, v0, v1, "%{public}@ Making host default XPC interface, allowed error classes: %{public}@", v2);
}

- (void)makeExtensionContextAndXPCConnectionForRequest:(NSObject *)a3 error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [a2 context];
  id v7 = [a2 xpcConnection];
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  int v11 = v6;
  __int16 v12 = 2114;
  id v13 = v7;
  _os_log_debug_impl(&dword_191F29000, a3, OS_LOG_TYPE_DEBUG, "%@ Finished making extension context: %{public}@ and connection: %{public}@", (uint8_t *)&v8, 0x20u);
}

- (void)makeExtensionContextAndXPCConnectionForRequest:(int)a1 error:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_191F29000, a2, OS_LOG_TYPE_DEBUG, "terminated extension with pid %d", (uint8_t *)v2, 8u);
}

- (void)makeExtensionContextAndXPCConnectionForRequest:(NSObject *)a1 error:.cold.3(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_191F29000, a1, OS_LOG_TYPE_DEBUG, "could not terminate extension: %{darwin.errno}d", (uint8_t *)v3, 8u);
}

- (void)makeExtensionContextAndXPCConnectionForRequest:error:.cold.4()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_191F29000, v0, v1, "Failed to make XPC connection for extension: %{public}@ request: %{public}@");
}

- (void)makeExtensionContextAndXPCConnectionForRequest:(void *)a1 error:(void *)a2 .cold.5(void *a1, void *a2)
{
  uint64_t v3 = [a1 _UUID];
  __int16 v10 = [a2 identifier];
  OUTLINED_FUNCTION_14(&dword_191F29000, v4, v5, "extension assertion was invalidated! request: %{public}@; plugin_identifier: %{public}@",
    v6,
    v7,
    v8,
    v9,
    2u);
}

- (void)makeExtensionContextAndXPCConnectionForRequest:error:.cold.6()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_191F29000, v0, v1, "Failed to make extension context for extension: %{public}@ request: %{public}@");
}

- (void)makeExtensionContextAndXPCConnectionForRequest:(os_log_t)log error:.cold.7(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(void *)(buf + 4) = "extensionContext != nil";
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtensi"
                          "on/NSExtensionSupport/EXConcreteExtension.m";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 618;
  *((_WORD *)buf + 14) = 2112;
  *(void *)(buf + 30) = a1;
  _os_log_fault_impl(&dword_191F29000, log, OS_LOG_TYPE_FAULT, "%s - %s:%d: Unable to initialize extension context class: %@", buf, 0x26u);
}

- (void)makeExtensionContextAndXPCConnectionForRequest:error:.cold.8()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8(&dword_191F29000, v0, v1, "Making extension context and XPC connection for %{public}@ request: %{public}@");
}

void __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_191F29000, a2, v4, "Unable to setup extension context - error: %{public}@", v5);
}

void __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_84_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_191F29000, log, OS_LOG_TYPE_FAULT, "UUIDs did not match!", v1, 2u);
}

void __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_84_cold_2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_191F29000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ Did begin request: %{public}@ context UUID: %{public}@", v3, 0x20u);
}

- (void)_beginExtensionRequest:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "begin async extension request %{public}@", v2, v3, v4, v5, v6);
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9(&dword_191F29000, v0, v1, "begin extension request %{public}@ complete with error: %{public}@");
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8(&dword_191F29000, v0, v1, "begin extension request %{public}@ complete with identifier: %{public}@");
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_191F29000, v0, v1, "Async Begin using error: %{public}@", v2, v3, v4, v5, v6);
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_15();
  uint64_t v2 = 0;
  _os_log_fault_impl(&dword_191F29000, v0, OS_LOG_TYPE_FAULT, "Async Begin using internal completion handler called multiple times. For unknow reasons. (request ID: %{public}@ error: %{public}@)", v1, 0x16u);
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_191F29000, v0, v1, "Async Begin using internal completion handler called multiple times. Due to error before initial completion for request: %{public}@", v2, v3, v4, v5, v6);
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_191F29000, v0, v1, "Async Begin using internal completion handler called multiple times. Due to error after initial completion: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_beginExtensionRequest:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "synchronus begin extension request %{public}@", v2, v3, v4, v5, v6);
}

- (void)objectForInfoDictionaryKey:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: can't get info dictionary keys from a nil plugin", v2, v3, v4, v5, v6);
}

- (void)_extensionBundle
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_191F29000, a2, v4, "Unable to use extension bundle: %{public}@", v5);
}

- (void)_isPhotoServiceAccessGranted
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: PlugIn's UUID is nil!", v2, v3, v4, v5, v6);
}

- (void)_isSystemExtension
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: infoDictionary is not available", v2, v3, v4, v5, v6);
}

- (void)_wantsProcessPerRequest
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: infoDictionary is not available", v2, v3, v4, v5, v6);
}

- (void)_hostContextClass
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = 136315906;
  uint64_t v3 = "extensionContextHostClass != nil";
  __int16 v4 = 2080;
  uint64_t v5 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSuppo"
       "rt/EXConcreteExtension.m";
  __int16 v6 = 1024;
  int v7 = 1312;
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  _os_log_fault_impl(&dword_191F29000, a2, OS_LOG_TYPE_FAULT, "%s - %s:%d: Unable to load host extension context class: %@", (uint8_t *)&v2, 0x26u);
}

- (void)_safelyBeginUsingSynchronously:request:readyHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "Attempt to reuse spect multi instance extension. Request will fail with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_safelyBeginUsingSynchronously:(uint64_t)a3 request:(NSObject *)a4 readyHandler:.cold.2(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_10(&dword_191F29000, a4, a3, "BeginUsing: Calling into PluginKit plugin: %{public}@ requestUUID: %{public}@", (uint8_t *)a3);
}

- (void)_safelyBeginUsingSynchronously:request:readyHandler:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: attempting to message a spent plugin!", v2, v3, v4, v5, v6);
}

- (void)_safelyBeginUsingSynchronously:request:readyHandler:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_191F29000, v0, v1, "%s - %s:%d: attempting to message a nil plugin!", v2, v3, v4, v5, v6);
}

void __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_139_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 80) identifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_191F29000, a2, v4, "PlugInKit error in beginUsing: with plugin identifier: %{public}@, killing plugin", v5);
}

void __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_139_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 80) identifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_191F29000, a2, v4, "Unable to acquire process assertion in beginUsing: with plugin identifier: %{public}@, killing plugin", v5);
}

void __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_139_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 48) pkUUID];
  OUTLINED_FUNCTION_15();
  uint64_t v8 = a2;
  OUTLINED_FUNCTION_10(&dword_191F29000, a3, v6, "BeginUsing: PluginKit responded for requesr: %{public}@ with error: %{public}@", v7);
}

void __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_139_cold_4()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_0(&dword_191F29000, v0, v1, "Plugin %{public}@ must have pid! Extension request will fail", v2, v3, v4, v5, v6);
}

void __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_9(&dword_191F29000, v0, v1, "EndUsing failed to endUsing extension %{public}@ with error: %{public}@");
}

void __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_191F29000, v0, v1, "EndUsing: Calling into PluginKit plugin: %{public}@ requestUUID: %{public}@");
}

- (void)_kill:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_191F29000, v1, OS_LOG_TYPE_DEBUG, "Client requested termination of extension %{public}@ with signal: %d ", v2, 0x12u);
}

@end