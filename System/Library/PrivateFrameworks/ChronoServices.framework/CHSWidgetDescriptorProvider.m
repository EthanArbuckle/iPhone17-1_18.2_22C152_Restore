@interface CHSWidgetDescriptorProvider
- (BOOL)_isEDUMode;
- (CHSWidgetDescriptorProvider)init;
- (CHSWidgetDescriptorProvider)initWithConnection:(id)a3 extensionProvider:(id)a4;
- (CHSWidgetDescriptorProvider)initWithConnection:(id)a3 extensionProvider:(id)a4 providerOptions:(id)a5;
- (CHSWidgetExtensionProvider)extensionProvider;
- (NSDictionary)descriptorsByExtensionIdentifier;
- (NSSet)descriptors;
- (NSString)description;
- (id)_descriptorsFromExtensions:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)descriptorForPersonality:(id)a3;
- (id)eduModeProvider;
- (id)initIncludingIntents:(BOOL)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_lock_addNewDescriptorsFromDescriptors:(id)a3;
- (void)_lock_notifyObserversDescriptorsDidChange;
- (void)_lock_reloadContentAsynchronouslyForContainerIdentifier:(id)a3 completion:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)extensionsDidChangeForExtensionProvider:(id)a3;
- (void)fetchDescriptorsForContainerIdentifier:(id)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setEduModeProvider:(id)a3;
- (void)setExtensionProvider:(id)a3;
@end

@implementation CHSWidgetDescriptorProvider

- (id)initIncludingIntents:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[CHSChronoServicesConnection sharedInstance];
  v6 = [CHSWidgetExtensionProviderOptions alloc];
  v7 = objc_alloc_init(CHSWidgetDescriptorsPredicate);
  v8 = [(CHSWidgetExtensionProviderOptions *)v6 initWithWidgetsPredicate:v7 controlsPredicate:0 includeIntents:v3];

  v9 = [[CHSWidgetExtensionProvider alloc] initWithOptions:v8];
  v10 = [(CHSWidgetDescriptorProvider *)self initWithConnection:v5 extensionProvider:v9 providerOptions:v8];

  return v10;
}

- (CHSWidgetDescriptorProvider)init
{
  return (CHSWidgetDescriptorProvider *)[(CHSWidgetDescriptorProvider *)self initIncludingIntents:1];
}

- (CHSWidgetDescriptorProvider)initWithConnection:(id)a3 extensionProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [CHSWidgetExtensionProviderOptions alloc];
  v9 = objc_alloc_init(CHSWidgetDescriptorsPredicate);
  v10 = [(CHSWidgetExtensionProviderOptions *)v8 initWithWidgetsPredicate:v9 controlsPredicate:0 includeIntents:1];

  v11 = [(CHSWidgetDescriptorProvider *)self initWithConnection:v6 extensionProvider:v7 providerOptions:v10];
  return v11;
}

- (CHSWidgetDescriptorProvider)initWithConnection:(id)a3 extensionProvider:(id)a4 providerOptions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (initWithConnection_extensionProvider_providerOptions____once[0] != -1) {
    dispatch_once(initWithConnection_extensionProvider_providerOptions____once, &__block_literal_global);
  }
  v20.receiver = self;
  v20.super_class = (Class)CHSWidgetDescriptorProvider;
  v12 = [(CHSWidgetDescriptorProvider *)&v20 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    lock_observers = v13->_lock_observers;
    v13->_lock_observers = (NSMutableSet *)v14;

    objc_storeStrong((id *)&v13->_lock_connection, a3);
    objc_storeStrong((id *)&v13->_extensionProvider, a4);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__CHSWidgetDescriptorProvider_initWithConnection_extensionProvider_providerOptions___block_invoke_2;
    v17[3] = &unk_1E56C81F0;
    v18 = v13;
    id v19 = v11;
    os_unfair_lock_assert_not_owner(&v13->_lock);
    os_unfair_lock_lock(&v13->_lock);
    __84__CHSWidgetDescriptorProvider_initWithConnection_extensionProvider_providerOptions___block_invoke_2((uint64_t)v17);
    os_unfair_lock_unlock(&v13->_lock);
  }
  return v13;
}

void __84__CHSWidgetDescriptorProvider_initWithConnection_extensionProvider_providerOptions___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.chrono.descriptorProvider", v2);
  v1 = (void *)__calloutQueue;
  __calloutQueue = (uint64_t)v0;
}

void __84__CHSWidgetDescriptorProvider_initWithConnection_extensionProvider_providerOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) cachedExtensionsWithOptions:*(void *)(a1 + 40)];
  BOOL v3 = *(void **)(a1 + 32);
  v4 = (void *)v2;
  id v9 = (id)v2;
  if (!v2)
  {
    v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v5 = [v3 _descriptorsFromExtensions:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  v8 = v9;
  if (!v9)
  {

    v8 = 0;
  }
}

- (void)dealloc
{
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__CHSWidgetDescriptorProvider_dealloc__block_invoke;
  v5[3] = &unk_1E56C8238;
  v5[4] = self;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __38__CHSWidgetDescriptorProvider_dealloc__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)CHSWidgetDescriptorProvider;
  [(CHSWidgetDescriptorProvider *)&v4 dealloc];
}

uint64_t __38__CHSWidgetDescriptorProvider_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "unregisterObserver:");
}

- (NSDictionary)descriptorsByExtensionIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = (id)MEMORY[0x1E4F1CC08];
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__CHSWidgetDescriptorProvider_descriptorsByExtensionIdentifier__block_invoke;
  v5[3] = &unk_1E56C8260;
  v5[4] = self;
  void v5[5] = &v6;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __63__CHSWidgetDescriptorProvider_descriptorsByExtensionIdentifier__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __63__CHSWidgetDescriptorProvider_descriptorsByExtensionIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  if (v3)
  {
    if ([v3 count]) {
      goto LABEL_5;
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_super v4 = [*(id *)(v2 + 8) extensions];
  uint64_t v5 = [(id)v2 _descriptorsFromExtensions:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

LABEL_5:
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 32);
  id v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v9, v8);
}

- (NSSet)descriptors
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(CHSWidgetDescriptorProvider *)self descriptorsByExtensionIdentifier];
  objc_super v4 = [v3 allValues];
  uint64_t v5 = objc_msgSend(v4, "bs_flatten");
  uint64_t v6 = [v2 setWithArray:v5];

  return (NSSet *)v6;
}

- (id)descriptorForPersonality:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CHSWidgetDescriptorProvider *)self descriptorsByExtensionIdentifier];
  uint64_t v6 = [v4 extensionBundleIdentifier];
  id v7 = [v5 objectForKey:v6];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__CHSWidgetDescriptorProvider_descriptorForPersonality___block_invoke;
  v11[3] = &unk_1E56C8288;
  id v8 = v4;
  id v12 = v8;
  id v9 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v11);

  return v9;
}

uint64_t __56__CHSWidgetDescriptorProvider_descriptorForPersonality___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matchesPersonality:*(void *)(a1 + 32)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CHSWidgetDescriptorProvider_addObserver___block_invoke;
  v7[3] = &unk_1E56C81F0;
  p_lock = &self->_lock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __43__CHSWidgetDescriptorProvider_addObserver___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __43__CHSWidgetDescriptorProvider_addObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 20))
  {
    *(unsigned char *)(v3 + 20) = 1;
    id v4 = *(void **)(*(void *)(a1 + 32) + 8);
    return objc_msgSend(v4, "registerObserver:");
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__CHSWidgetDescriptorProvider_removeObserver___block_invoke;
  v7[3] = &unk_1E56C81F0;
  p_lock = &self->_lock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __46__CHSWidgetDescriptorProvider_removeObserver___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __46__CHSWidgetDescriptorProvider_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

- (void)fetchDescriptorsForContainerIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__CHSWidgetDescriptorProvider_fetchDescriptorsForContainerIdentifier_completion___block_invoke;
  v11[3] = &unk_1E56C82B0;
  p_lock = &self->_lock;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __81__CHSWidgetDescriptorProvider_fetchDescriptorsForContainerIdentifier_completion___block_invoke((uint64_t)v11);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __81__CHSWidgetDescriptorProvider_fetchDescriptorsForContainerIdentifier_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_reloadContentAsynchronouslyForContainerIdentifier:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (NSString)description
{
  return (NSString *)[(CHSWidgetDescriptorProvider *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(CHSWidgetDescriptorProvider *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(CHSWidgetDescriptorProvider *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CHSWidgetDescriptorProvider *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__CHSWidgetDescriptorProvider_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E56C81F0;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];
  id v7 = v11;
  id v8 = v6;

  return v8;
}

void __69__CHSWidgetDescriptorProvider_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__CHSWidgetDescriptorProvider_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v5[3] = &unk_1E56C81F0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  os_unfair_lock_assert_not_owner(v2);
  os_unfair_lock_lock(v2);
  __69__CHSWidgetDescriptorProvider_descriptionBuilderWithMultilinePrefix___block_invoke_2((uint64_t)v5);
  os_unfair_lock_unlock(v2);
}

void __69__CHSWidgetDescriptorProvider_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) descriptors];
  uint64_t v2 = [v3 allObjects];
  [v1 appendArraySection:v2 withName:@"descriptors" skipIfEmpty:0];
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 extensions];
  id v6 = [(CHSWidgetDescriptorProvider *)self _descriptorsFromExtensions:v5];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__CHSWidgetDescriptorProvider_extensionsDidChangeForExtensionProvider___block_invoke;
  v9[3] = &unk_1E56C81F0;
  p_lock = &self->_lock;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __71__CHSWidgetDescriptorProvider_extensionsDidChangeForExtensionProvider___block_invoke((uint64_t)v9);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __71__CHSWidgetDescriptorProvider_extensionsDidChangeForExtensionProvider___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToDictionary:*(void *)(*(void *)(a1 + 40) + 32)];
  if ((result & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 32), *(id *)(a1 + 32));
    id v3 = *(void **)(a1 + 40);
    return objc_msgSend(v3, "_lock_notifyObserversDescriptorsDidChange");
  }
  return result;
}

- (id)_descriptorsFromExtensions:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__CHSWidgetDescriptorProvider__descriptorsFromExtensions___block_invoke;
  v6[3] = &unk_1E56C82D8;
  v6[4] = &v7;
  objc_msgSend(v3, "bs_each:", v6);
  id v4 = (void *)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __58__CHSWidgetDescriptorProvider__descriptorsFromExtensions___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 identity];
  id v4 = [v3 extensionBundleIdentifier];

  uint64_t v5 = [v6 orderedWidgetDescriptors];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 forKeyedSubscript:v4];
}

- (BOOL)_isEDUMode
{
  eduModeProvider = (uint64_t (**)(void))self->_eduModeProvider;
  if (eduModeProvider) {
    LOBYTE(eduModeProvider) = eduModeProvider[2]();
  }
  return (char)eduModeProvider;
}

- (void)_lock_reloadContentAsynchronouslyForContainerIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  lock_connection = self->_lock_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__CHSWidgetDescriptorProvider__lock_reloadContentAsynchronouslyForContainerIdentifier_completion___block_invoke;
  v11[3] = &unk_1E56C8300;
  void v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  objc_copyWeak(&v14, &location);
  id v13 = v7;
  id v10 = v7;
  [(CHSChronoServicesConnection *)lock_connection fetchDescriptorsForContainerBundleIdentifier:v9 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __98__CHSWidgetDescriptorProvider__lock_reloadContentAsynchronouslyForContainerIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = CHSLogChronoServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_190C6F000, v7, OS_LOG_TYPE_DEFAULT, "<CHSWidgetDescriptorProvider:%p> Cache descriptors for container identifier: %@ returned error: %@", buf, 0x20u);
    }
  }
  if (!v5)
  {
    id v10 = 0;
LABEL_12:
    (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
    goto LABEL_13;
  }
  id v10 = [v5 descriptorsByExtensionIdentifier];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 56));
  id v12 = WeakRetained;
  if (WeakRetained)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __98__CHSWidgetDescriptorProvider__lock_reloadContentAsynchronouslyForContainerIdentifier_completion___block_invoke_14;
    v13[3] = &unk_1E56C81F0;
    v13[4] = WeakRetained;
    id v14 = v10;
    os_unfair_lock_assert_not_owner(v12 + 4);
    os_unfair_lock_lock(v12 + 4);
    __98__CHSWidgetDescriptorProvider__lock_reloadContentAsynchronouslyForContainerIdentifier_completion___block_invoke_14((uint64_t)v13);
    os_unfair_lock_unlock(v12 + 4);
  }
  if (!v10 || ![v10 count]) {
    goto LABEL_12;
  }
  (*(void (**)(void, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v10);
LABEL_13:
}

uint64_t __98__CHSWidgetDescriptorProvider__lock_reloadContentAsynchronouslyForContainerIdentifier_completion___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_addNewDescriptorsFromDescriptors:", *(void *)(a1 + 40));
}

- (void)_lock_addNewDescriptorsFromDescriptors:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[(NSDictionary *)self->_lock_descriptorsByExtensionIdentifier mutableCopy];
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __70__CHSWidgetDescriptorProvider__lock_addNewDescriptorsFromDescriptors___block_invoke;
  v15 = &unk_1E56C8328;
  id v6 = v5;
  id v16 = v6;
  __int16 v17 = &v18;
  [v4 enumerateKeysAndObjectsUsingBlock:&v12];
  if (*((unsigned char *)v19 + 24))
  {
    objc_storeStrong((id *)&self->_lock_descriptorsByExtensionIdentifier, v5);
    [(CHSWidgetDescriptorProvider *)self _lock_notifyObserversDescriptorsDidChange];
    id v7 = CHSLogChronoServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 count];
      *(_DWORD *)buf = 134218498;
      v23 = self;
      __int16 v24 = 2112;
      id v25 = v4;
      __int16 v26 = 2048;
      uint64_t v27 = v8;
      uint64_t v9 = "<CHSWidgetDescriptorProvider:%p> Added descriptors: %@ for extension count: %lu";
      id v10 = v7;
      uint32_t v11 = 32;
LABEL_6:
      _os_log_impl(&dword_190C6F000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else
  {
    id v7 = CHSLogChronoServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v23 = self;
      __int16 v24 = 2112;
      id v25 = v4;
      uint64_t v9 = "<CHSWidgetDescriptorProvider:%p> No descriptor update needed. Already discovered descriptors: %@";
      id v10 = v7;
      uint32_t v11 = 22;
      goto LABEL_6;
    }
  }

  _Block_object_dispose(&v18, 8);
}

void __70__CHSWidgetDescriptorProvider__lock_addNewDescriptorsFromDescriptors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKey:v8];
  id v7 = v6;
  if (!v6 || ([v6 isEqualToArray:v5] & 1) == 0)
  {
    [*(id *)(a1 + 32) setObject:v5 forKey:v8];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)_lock_notifyObserversDescriptorsDidChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (void *)[(NSMutableSet *)self->_lock_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          v8[0] = MEMORY[0x1E4F143A8];
          v8[1] = 3221225472;
          v8[2] = __72__CHSWidgetDescriptorProvider__lock_notifyObserversDescriptorsDidChange__block_invoke;
          v8[3] = &unk_1E56C81F0;
          v8[4] = v7;
          v8[5] = self;
          dispatch_async((dispatch_queue_t)__calloutQueue, v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

uint64_t __72__CHSWidgetDescriptorProvider__lock_notifyObserversDescriptorsDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) descriptorsDidChangeForDescriptorProvider:*(void *)(a1 + 40)];
}

- (CHSWidgetExtensionProvider)extensionProvider
{
  return self->_extensionProvider;
}

- (void)setExtensionProvider:(id)a3
{
}

- (id)eduModeProvider
{
  return self->_eduModeProvider;
}

- (void)setEduModeProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eduModeProvider, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_descriptorsByExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
}

@end