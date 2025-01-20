@interface CHSWidgetExtensionProvider
+ (id)_computeIconVersionsByForExtensions:(id)a3 withIconResolver:(id)a4;
+ (id)_makeWidgetExtensionSetWithExtensions:(id)a3 iconResolver:(id)a4;
- (BOOL)_isEDUMode;
- (CHSChronoServicesConnection)connection;
- (CHSWidgetExtensionProvider)init;
- (CHSWidgetExtensionProvider)initWithConnection:(id)a3 providerOptions:(id)a4 eduProvider:(id)a5;
- (CHSWidgetExtensionProvider)initWithOptions:(id)a3;
- (CHSWidgetExtensionSet)_widgetExtensionSet;
- (NSSet)containers;
- (NSSet)extensions;
- (NSString)description;
- (id)controlDescriptorForControl:(id)a3;
- (id)controlDescriptorForIdentifiable:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)eduModeProvider;
- (id)initIncludingIntents:(BOOL)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)widgetDescriptorForIdentifiable:(id)a3;
- (id)widgetDescriptorForWidget:(id)a3;
- (id)widgetExtensionContainerForContainerBundleIdentifier:(id)a3;
- (id)widgetExtensionContainerForExtensionBundleIdentifier:(id)a3;
- (void)_lock_loadContentInitiallySynchronouslyIfNecessary;
- (void)_lock_notifyObserversExtensionsDidChange;
- (void)_lock_widgetExtensionsDidChange:(id)a3 postNotification:(BOOL)a4 reason:(id)a5;
- (void)dealloc;
- (void)invalidate;
- (void)registerObserver:(id)a3;
- (void)setConnection:(id)a3;
- (void)setEduModeProvider:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)widgetExtensionsDidChange:(id)a3;
@end

@implementation CHSWidgetExtensionProvider

- (id)widgetExtensionContainerForContainerBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CHSWidgetExtensionProvider *)self _widgetExtensionSet];
  v6 = [v5 widgetExtensionContainerForContainerBundleIdentifier:v4];

  return v6;
}

- (CHSWidgetExtensionSet)_widgetExtensionSet
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__CHSWidgetExtensionProvider__widgetExtensionSet__block_invoke;
  v5[3] = &unk_1E56C8260;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __49__CHSWidgetExtensionProvider__widgetExtensionSet__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CHSWidgetExtensionSet *)v3;
}

void __49__CHSWidgetExtensionProvider__widgetExtensionSet__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_lock_loadContentInitiallySynchronouslyIfNecessary");
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_lock_loadContentInitiallySynchronouslyIfNecessary
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!self->_lock_subscription)
  {
    BOOL v3 = [(CHSWidgetExtensionProvider *)self _isEDUMode];
    id v4 = CHSLogChronoServices();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_DWORD *)buf = 134217984;
        v17 = self;
        _os_log_impl(&dword_190C6F000, v4, OS_LOG_TYPE_DEFAULT, "<CHSWidgetExtensionProvider:%p> Skipping sync load because in EDU mode.", buf, 0xCu);
      }
      id v6 = 0;
      id v7 = 0;
    }
    else
    {
      if (v5)
      {
        uint64_t v8 = [(CHSWidgetExtensionProviderOptions *)self->_lock_providerOptions description];
        *(_DWORD *)buf = 134218242;
        v17 = self;
        __int16 v18 = 2114;
        uint64_t v19 = (uint64_t)v8;
        _os_log_impl(&dword_190C6F000, v4, OS_LOG_TYPE_DEFAULT, "<CHSWidgetExtensionProvider:%p> Loading synchronously options: %{public}@.", buf, 0x16u);
      }
      lock_connection = self->_lock_connection;
      id v14 = 0;
      id v15 = 0;
      v10 = [(CHSChronoServicesConnection *)lock_connection subscribeToExtensions:&v15 fromClient:self withOptions:self->_lock_providerOptions outExtensions:&v14];
      id v7 = v15;
      id v6 = v14;
      lock_subscription = self->_lock_subscription;
      self->_lock_subscription = v10;

      id v4 = CHSLogChronoServices();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v6 count];
        v13 = [(CHSWidgetExtensionProviderOptions *)self->_lock_providerOptions description];
        *(_DWORD *)buf = 134218498;
        v17 = self;
        __int16 v18 = 2048;
        uint64_t v19 = v12;
        __int16 v20 = 2114;
        v21 = v13;
        _os_log_impl(&dword_190C6F000, v4, OS_LOG_TYPE_DEFAULT, "<CHSWidgetExtensionProvider:%p> Loaded synchronously - %lu received, options: %{public}@.", buf, 0x20u);
      }
    }

    [(CHSWidgetExtensionProvider *)self _lock_widgetExtensionsDidChange:v6 postNotification:0 reason:@"initial sync"];
  }
}

- (CHSWidgetExtensionProvider)initWithOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CHSChronoServicesConnection sharedInstance];
  id v6 = [(CHSWidgetExtensionProvider *)self initWithConnection:v5 providerOptions:v4 eduProvider:&__block_literal_global_1];

  return v6;
}

uint64_t __46__CHSWidgetExtensionProvider_initWithOptions___block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];
  if ([v1 isEqualToString:@"com.apple.springboard"])
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2050000000;
    uint64_t v2 = (void *)getUMUserManagerClass_softClass;
    uint64_t v11 = getUMUserManagerClass_softClass;
    if (!getUMUserManagerClass_softClass)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __getUMUserManagerClass_block_invoke;
      v7[3] = &unk_1E56C8628;
      v7[4] = &v8;
      __getUMUserManagerClass_block_invoke((uint64_t)v7);
      uint64_t v2 = (void *)v9[3];
    }
    id v3 = v2;
    _Block_object_dispose(&v8, 8);
    id v4 = [v3 sharedManager];
    uint64_t v5 = [v4 isMultiUser];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)initIncludingIntents:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [CHSWidgetExtensionProviderOptions alloc];
  id v6 = objc_alloc_init(CHSWidgetDescriptorsPredicate);
  id v7 = [(CHSWidgetExtensionProviderOptions *)v5 initWithWidgetsPredicate:v6 controlsPredicate:0 includeIntents:v3];

  uint64_t v8 = [(CHSWidgetExtensionProvider *)self initWithOptions:v7];
  return v8;
}

- (CHSWidgetExtensionProvider)init
{
  BOOL v3 = [CHSWidgetExtensionProviderOptions alloc];
  id v4 = objc_alloc_init(CHSWidgetDescriptorsPredicate);
  uint64_t v5 = [(CHSWidgetExtensionProviderOptions *)v3 initWithWidgetsPredicate:v4 controlsPredicate:0 includeIntents:1];

  id v6 = [(CHSWidgetExtensionProvider *)self initWithOptions:v5];
  return v6;
}

- (CHSWidgetExtensionProvider)initWithConnection:(id)a3 providerOptions:(id)a4 eduProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (initWithConnection_providerOptions_eduProvider____once[0] != -1) {
    dispatch_once(initWithConnection_providerOptions_eduProvider____once, &__block_literal_global_7);
  }
  v28.receiver = self;
  v28.super_class = (Class)CHSWidgetExtensionProvider;
  uint64_t v12 = [(CHSWidgetExtensionProvider *)&v28 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_observers = v13->_lock_observers;
    v13->_lock_observers = (NSHashTable *)v14;

    objc_storeStrong((id *)&v13->_lock_connection, a3);
    objc_storeStrong((id *)&v13->_lock_providerOptions, a4);
    [(CHSChronoServicesConnection *)v13->_lock_connection addClient:v13];
    v16 = _Block_copy(v11);
    id eduModeProvider = v13->_eduModeProvider;
    v13->_id eduModeProvider = v16;

    __int16 v18 = objc_alloc_init(CHSIconResolver);
    iconResolver = v13->_iconResolver;
    v13->_iconResolver = (CHSIconResolving *)v18;

    __int16 v20 = [CHSWidgetExtensionSet alloc];
    v21 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v22 = +[CHSEquivalentBundleIdentifierResolver defaultResolver];
    uint64_t v23 = [(CHSWidgetExtensionSet *)v20 initWithExtensions:v21 equivalentBundleIdentifierResolver:v22 iconResolver:v13->_iconResolver];
    lock_extensionSet = v13->_lock_extensionSet;
    v13->_lock_extensionSet = (CHSWidgetExtensionSet *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionary];
    lock_iconVersionByExtensionIdentity = v13->_lock_iconVersionByExtensionIdentity;
    v13->_lock_iconVersionByExtensionIdentity = (NSDictionary *)v25;
  }
  return v13;
}

void __77__CHSWidgetExtensionProvider_initWithConnection_providerOptions_eduProvider___block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.chrono.descriptorProvider", v2);
  v1 = (void *)__calloutQueue_0;
  __calloutQueue_0 = (uint64_t)v0;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__CHSWidgetExtensionProvider_dealloc__block_invoke;
  v5[3] = &unk_1E56C8238;
  v5[4] = self;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __37__CHSWidgetExtensionProvider_dealloc__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)CHSWidgetExtensionProvider;
  [(CHSWidgetExtensionProvider *)&v4 dealloc];
}

uint64_t __37__CHSWidgetExtensionProvider_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
}

- (NSSet)containers
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v3 = [(CHSWidgetExtensionProvider *)self _widgetExtensionSet];
  objc_super v4 = [v3 widgetExtensionContainers];
  uint64_t v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (NSSet)extensions
{
  uint64_t v2 = [(CHSWidgetExtensionProvider *)self _widgetExtensionSet];
  BOOL v3 = [v2 allExtensions];

  return (NSSet *)v3;
}

- (id)widgetDescriptorForWidget:(id)a3
{
  BOOL v3 = [(CHSWidgetExtensionProvider *)self widgetDescriptorForIdentifiable:a3];
  return v3;
}

- (id)widgetDescriptorForIdentifiable:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 extensionIdentity];
  id v6 = [(CHSWidgetExtensionProvider *)self _widgetExtensionSet];
  id v7 = [v6 widgetExtensionForExtensionIdentity:v5];

  if (!v7)
  {
    uint64_t v8 = CHSLogChronoServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(CHSWidgetExtensionProvider *)self succinctDescription];
      [(CHSWidgetExtensionProvider *)v9 widgetDescriptorForIdentifiable:(uint64_t)v13];
    }
  }
  id v10 = [v4 kind];
  id v11 = [v7 widgetDescriptorForKind:v10];

  return v11;
}

- (id)controlDescriptorForControl:(id)a3
{
  BOOL v3 = [(CHSWidgetExtensionProvider *)self controlDescriptorForIdentifiable:a3];
  return v3;
}

- (id)controlDescriptorForIdentifiable:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 extensionIdentity];
  id v6 = [(CHSWidgetExtensionProvider *)self _widgetExtensionSet];
  id v7 = [v6 widgetExtensionForExtensionIdentity:v5];

  if (!v7)
  {
    uint64_t v8 = CHSLogChronoServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(CHSWidgetExtensionProvider *)self succinctDescription];
      [(CHSWidgetExtensionProvider *)v9 widgetDescriptorForIdentifiable:(uint64_t)v13];
    }
  }
  id v10 = [v4 kind];
  id v11 = [v7 controlDescriptorForKind:v10];

  return v11;
}

- (id)widgetExtensionContainerForExtensionBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CHSWidgetExtensionProvider *)self _widgetExtensionSet];
  id v6 = [v5 widgetExtensionContainerForExtensionBundleIdentifier:v4];

  return v6;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CHSWidgetExtensionProvider_registerObserver___block_invoke;
  v7[3] = &unk_1E56C81F0;
  p_lock = &self->_lock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __47__CHSWidgetExtensionProvider_registerObserver___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __47__CHSWidgetExtensionProvider_registerObserver___block_invoke(uint64_t result)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 56))
  {
    uint64_t v2 = result;
    [*(id *)(v1 + 72) addObject:*(void *)(result + 40)];
    BOOL v3 = CHSLogChronoServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSString;
      uint64_t v5 = *(void *)(v2 + 32);
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      id v8 = [v4 stringWithFormat:@"<%@:%p>", v7, *(void *)(v2 + 40)];
      *(_DWORD *)buf = 134218242;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_impl(&dword_190C6F000, v3, OS_LOG_TYPE_DEFAULT, "<CHSWidgetExtensionProvider:%p> Add observer: %{public}@.", buf, 0x16u);
    }
    return objc_msgSend(*(id *)(v2 + 32), "_lock_loadContentInitiallySynchronouslyIfNecessary");
  }
  return result;
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CHSWidgetExtensionProvider_unregisterObserver___block_invoke;
  v7[3] = &unk_1E56C81F0;
  p_lock = &self->_lock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __49__CHSWidgetExtensionProvider_unregisterObserver___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __49__CHSWidgetExtensionProvider_unregisterObserver___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = NSString;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = [v3 stringWithFormat:@"<%@:%p>", v6, *(void *)(a1 + 40)];
    *(_DWORD *)buf = 134218242;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    _os_log_impl(&dword_190C6F000, v2, OS_LOG_TYPE_DEFAULT, "<CHSWidgetExtensionProvider:%p> Remove observer: %{public}@.", buf, 0x16u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
}

- (void)invalidate
{
  p_lock = &self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__CHSWidgetExtensionProvider_invalidate__block_invoke;
  v3[3] = &unk_1E56C8238;
  v3[4] = self;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __40__CHSWidgetExtensionProvider_invalidate__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);
}

void __40__CHSWidgetExtensionProvider_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 56))
  {
    *(unsigned char *)(v1 + 56) = 1;
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = 0;
  }
}

- (NSString)description
{
  return (NSString *)[(CHSWidgetExtensionProvider *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(CHSWidgetExtensionProvider *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__0;
  void v13[4] = __Block_byref_object_dispose__0;
  id v14 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  p_lock = &self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__CHSWidgetExtensionProvider_succinctDescriptionBuilder__block_invoke;
  v11[3] = &unk_1E56C85B0;
  v11[4] = self;
  v11[5] = v13;
  v11[6] = v12;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __56__CHSWidgetExtensionProvider_succinctDescriptionBuilder__block_invoke(v11);
  os_unfair_lock_unlock(p_lock);
  uint64_t v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__CHSWidgetExtensionProvider_succinctDescriptionBuilder__block_invoke_2;
  v7[3] = &unk_1E56C85D8;
  id v5 = v4;
  id v8 = v5;
  id v9 = v13;
  uint64_t v10 = v12;
  [v5 appendProem:self block:v7];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);

  return v5;
}

void __56__CHSWidgetExtensionProvider_succinctDescriptionBuilder__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 64) copy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1[4] + 32) allExtensions];
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v5 count];
}

id __56__CHSWidgetExtensionProvider_succinctDescriptionBuilder__block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withName:@"options"];
  return (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) withName:@"widgetExtensions"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(CHSWidgetExtensionProvider *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__0;
  void v13[4] = __Block_byref_object_dispose__0;
  id v14 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__CHSWidgetExtensionProvider_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E56C8600;
  void v12[4] = self;
  v12[5] = v13;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  __68__CHSWidgetExtensionProvider_descriptionBuilderWithMultilinePrefix___block_invoke((uint64_t)v12);
  os_unfair_lock_unlock(&self->_lock);
  id v5 = [(CHSWidgetExtensionProvider *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__CHSWidgetExtensionProvider_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v9[3] = &unk_1E56C81F0;
  id v6 = v5;
  id v10 = v6;
  __int16 v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  _Block_object_dispose(v13, 8);
  return v7;
}

void __68__CHSWidgetExtensionProvider_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __68__CHSWidgetExtensionProvider_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _widgetExtensionSet];
  uint64_t v2 = [v3 widgetExtensionContainers];
  [v1 appendArraySection:v2 withName:@"containers" skipIfEmpty:0];
}

- (void)widgetExtensionsDidChange:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__CHSWidgetExtensionProvider_widgetExtensionsDidChange___block_invoke;
  v7[3] = &unk_1E56C81F0;
  p_lock = &self->_lock;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __56__CHSWidgetExtensionProvider_widgetExtensionsDidChange___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __56__CHSWidgetExtensionProvider_widgetExtensionsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_widgetExtensionsDidChange:postNotification:reason:", *(void *)(a1 + 40), 1, @"chrono update");
}

- (void)_lock_widgetExtensionsDidChange:(id)a3 postNotification:(BOOL)a4 reason:(id)a5
{
  BOOL v6 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = CHSLogChronoServices();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218498;
    v17 = self;
    __int16 v18 = 2048;
    uint64_t v19 = [v8 count];
    __int16 v20 = 2114;
    id v21 = v9;
    _os_log_impl(&dword_190C6F000, v10, OS_LOG_TYPE_DEFAULT, "<CHSWidgetExtensionProvider:%p> Widget extensions changed - %lu received for %{public}@.", (uint8_t *)&v16, 0x20u);
  }

  if (!v8) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  if (!self->_lock_invalidated)
  {
    __int16 v11 = [(CHSWidgetExtensionSet *)self->_lock_extensionSet allExtensions];
    uint64_t v12 = +[CHSWidgetExtensionProvider _computeIconVersionsByForExtensions:v11 withIconResolver:self->_iconResolver];
    if (![v8 isEqualToSet:v11]
      || ![(NSDictionary *)v12 isEqualToDictionary:self->_lock_iconVersionByExtensionIdentity])
    {
      uint64_t v13 = +[CHSWidgetExtensionProvider _makeWidgetExtensionSetWithExtensions:v8 iconResolver:self->_iconResolver];
      lock_extensionSet = self->_lock_extensionSet;
      self->_lock_extensionSet = v13;

      if (v6) {
        [(CHSWidgetExtensionProvider *)self _lock_notifyObserversExtensionsDidChange];
      }
    }
    lock_iconVersionByExtensionIdentity = self->_lock_iconVersionByExtensionIdentity;
    self->_lock_iconVersionByExtensionIdentity = v12;
  }
}

+ (id)_makeWidgetExtensionSetWithExtensions:(id)a3 iconResolver:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [CHSWidgetExtensionSet alloc];
  id v8 = +[CHSEquivalentBundleIdentifierResolver defaultResolver];
  id v9 = [(CHSWidgetExtensionSet *)v7 initWithExtensions:v5 equivalentBundleIdentifierResolver:v8 iconResolver:v6];

  return v9;
}

+ (id)_computeIconVersionsByForExtensions:(id)a3 withIconResolver:(id)a4
{
  id v4 = objc_opt_new();
  return v4;
}

- (BOOL)_isEDUMode
{
  id eduModeProvider = (uint64_t (**)(void))self->_eduModeProvider;
  if (eduModeProvider) {
    LOBYTE(eduModeProvider) = eduModeProvider[2]();
  }
  return (char)eduModeProvider;
}

- (void)_lock_notifyObserversExtensionsDidChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (void *)[(NSHashTable *)self->_lock_observers copy];
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
          v8[2] = __70__CHSWidgetExtensionProvider__lock_notifyObserversExtensionsDidChange__block_invoke;
          v8[3] = &unk_1E56C81F0;
          v8[4] = v7;
          v8[5] = self;
          dispatch_async((dispatch_queue_t)__calloutQueue_0, v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

uint64_t __70__CHSWidgetExtensionProvider__lock_notifyObserversExtensionsDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) extensionsDidChangeForExtensionProvider:*(void *)(a1 + 40)];
}

- (CHSChronoServicesConnection)connection
{
  return self->_lock_connection;
}

- (void)setConnection:(id)a3
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
  objc_storeStrong((id *)&self->_lock_iconVersionByExtensionIdentity, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_providerOptions, 0);
  objc_storeStrong((id *)&self->_lock_subscription, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_lock_extensionSet, 0);
  objc_storeStrong((id *)&self->_iconResolver, 0);
  objc_storeStrong(&self->_eduModeProvider, 0);
}

- (void)widgetDescriptorForIdentifiable:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0((uint64_t)a1, a2, a3, 5.8382e-34);
  _os_log_error_impl(&dword_190C6F000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to find extension for extension identity: %{public}@.", v4, 0x16u);
}

@end