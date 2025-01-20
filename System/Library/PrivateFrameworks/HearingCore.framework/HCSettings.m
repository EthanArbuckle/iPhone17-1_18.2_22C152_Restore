@interface HCSettings
- (BOOL)BOOLValueForPreferenceKey:(id)a3 withDefaultValue:(BOOL)a4;
- (BOOL)_switchFromRootUserIfNecessary:(id)a3;
- (BOOL)shouldStoreLocally;
- (HCSettings)init;
- (NPSDomainAccessor)domainAccessor;
- (NPSDomainAccessor)globalDomainAccessor;
- (NSMutableDictionary)updateBlocks;
- (NSMutableSet)registeredNotifications;
- (NSMutableSet)synchronizePreferences;
- (OS_dispatch_queue)nanoDomainAccessorQueue;
- (double)cgfloatValueForPreferenceKey:(id)a3 withDefaultValue:(double)a4;
- (id)_valueForPreferenceKey:(id)a3;
- (id)keysToSync;
- (id)nanoDomainAccessor;
- (id)nanoPreferenceDomain;
- (id)notificationForPreferenceKey:(id)a3;
- (id)objectValueForKey:(id)a3 withClass:(Class)a4 andDefaultValue:(id)a5;
- (id)preferenceDomainForPreferenceKey:(id)a3;
- (id)preferenceKeyForSelector:(SEL)a3;
- (int64_t)integerValueForKey:(id)a3 withDefaultValue:(int64_t)a4;
- (void)_handlePreferenceChanged:(id)a3;
- (void)_registerForNotification:(id)a3;
- (void)_synchronizeIfNecessary:(id)a3;
- (void)dealloc;
- (void)logMessage:(id)a3;
- (void)pairedWatchDidChange:(id)a3;
- (void)registerUpdateBlock:(id)a3 forRetrieveSelector:(SEL)a4 withListener:(id)a5;
- (void)resetValueForSelector:(SEL)a3;
- (void)setDomainAccessor:(id)a3;
- (void)setGlobalDomainAccessor:(id)a3;
- (void)setNanoDomainAccessorQueue:(id)a3;
- (void)setRegisteredNotifications:(id)a3;
- (void)setSynchronizePreferences:(id)a3;
- (void)setUpdateBlocks:(id)a3;
- (void)setValue:(id)a3 forPreferenceKey:(id)a4;
@end

@implementation HCSettings

void __38__HCSettings__synchronizeIfNecessary___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) synchronizePreferences];
  if ([v2 containsObject:*(void *)(a1 + 40)])
  {
    CFPreferencesAppSynchronize((CFStringRef)[*(id *)(a1 + 32) preferenceDomainForPreferenceKey:*(void *)(a1 + 40)]);
    [v2 removeObject:*(void *)(a1 + 40)];
  }
}

void __39__HCSettings__registerForNotification___block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) registeredNotifications];
  if (([v6 containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [v6 addObject:*(void *)(a1 + 40)];
    id v2 = [*(id *)(a1 + 32) notificationForPreferenceKey:*(void *)(a1 + 40)];
    v3 = *(void **)(a1 + 32);
    v4 = [NSString stringWithFormat:@"Registering for %@", v2];
    [v3 logMessage:v4];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_axSettingsHandlePreferenceChanged, v2, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (NSMutableSet)synchronizePreferences
{
  return self->_synchronizePreferences;
}

- (NSMutableSet)registeredNotifications
{
  return self->_registeredNotifications;
}

- (id)objectValueForKey:(id)a3 withClass:(Class)a4 andDefaultValue:(id)a5
{
  id v7 = a5;
  v8 = [(HCSettings *)self _valueForPreferenceKey:a3];
  if (!v8 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = v7;

    v8 = v9;
  }

  return v8;
}

- (id)_valueForPreferenceKey:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __37__HCSettings__valueForPreferenceKey___block_invoke;
  v21[3] = &unk_1E6191CD0;
  v23 = &v24;
  v21[4] = self;
  v5 = (__CFString *)v4;
  v22 = v5;
  if ([(HCSettings *)self _switchFromRootUserIfNecessary:v21])
  {
    id v6 = (id)v25[5];
    id v7 = v22;
  }
  else
  {

    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v20 = 0;
    if ([(HCSettings *)self shouldStoreLocally])
    {
      [(HCSettings *)self _synchronizeIfNecessary:v5];
      [(HCSettings *)self _registerForNotification:v5];
      CFPropertyListRef v8 = CFPreferencesCopyAppValue(v5, (CFStringRef)[(HCSettings *)self preferenceDomainForPreferenceKey:v5]);
      id v9 = (void *)v16[5];
      v16[5] = (uint64_t)v8;
    }
    else
    {
      v10 = [(HCSettings *)self nanoDomainAccessorQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __37__HCSettings__valueForPreferenceKey___block_invoke_2;
      v12[3] = &unk_1E6191CF8;
      v12[4] = self;
      v14 = &v15;
      v13 = v5;
      dispatch_sync(v10, v12);
    }
    id v6 = (id)v16[5];
    _Block_object_dispose(&v15, 8);
    id v7 = v20;
  }

  _Block_object_dispose(&v24, 8);
  return v6;
}

- (void)_synchronizeIfNecessary:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AX_PERFORM_WITH_LOCK();
}

- (BOOL)_switchFromRootUserIfNecessary:(id)a3
{
  id v3 = (void (**)(void))a3;
  if (!geteuid())
  {
    id v6 = getpwnam("mobile");
    if (v6)
    {
      uid_t pw_uid = v6->pw_uid;
      if (pw_uid)
      {
        seteuid(pw_uid);
        v3[2](v3);
        seteuid(0);
        BOOL v4 = 1;
        goto LABEL_3;
      }
      CFPropertyListRef v8 = AXLogSettings();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[HCSettings _switchFromRootUserIfNecessary:](v8);
      }
    }
  }
  BOOL v4 = 0;
LABEL_3:

  return v4;
}

- (void)_registerForNotification:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__HCSettings__registerForNotification___block_invoke;
  v9[3] = &unk_1E6191BE8;
  v9[4] = self;
  if (_registerForNotification__onceToken != -1) {
    dispatch_once(&_registerForNotification__onceToken, v9);
  }
  v5 = _registerForNotification__RegistrationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__HCSettings__registerForNotification___block_invoke_2;
  block[3] = &unk_1E6191BC0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (HCSettings)init
{
  v19.receiver = self;
  v19.super_class = (Class)HCSettings;
  id v2 = [(HCSettings *)&v19 init];
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    registeredNotifications = v2->_registeredNotifications;
    v2->_registeredNotifications = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    synchronizePreferences = v2->_synchronizePreferences;
    v2->_synchronizePreferences = v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    updateBlocks = v2->_updateBlocks;
    v2->_updateBlocks = v7;

    v2->_syncLock._os_unfair_lock_opaque = 0;
    id v9 = [(HCSettings *)v2 keysToSync];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      dispatch_queue_t v11 = dispatch_queue_create("accessibility.hearing.domain.accessor", 0);
      [(HCSettings *)v2 setNanoDomainAccessorQueue:v11];

      v12 = [(HCSettings *)v2 nanoDomainAccessorQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __18__HCSettings_init__block_invoke;
      block[3] = &unk_1E6191BE8;
      v13 = v2;
      v18 = v13;
      dispatch_async(v12, block);

      v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 addObserver:v13 selector:sel_pairedWatchDidChange_ name:*MEMORY[0x1E4F79EB8] object:0];

      uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 addObserver:v13 selector:sel_pairedWatchDidChange_ name:*MEMORY[0x1E4F79E88] object:0];
    }
  }
  return v2;
}

void __18__HCSettings_init__block_invoke(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:@".GlobalPreferences"];
  [*(id *)(a1 + 32) setGlobalDomainAccessor:v2];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HCSettings;
  [(HCSettings *)&v4 dealloc];
}

- (void)pairedWatchDidChange:(id)a3
{
  objc_super v4 = [(HCSettings *)self nanoDomainAccessorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HCSettings_pairedWatchDidChange___block_invoke;
  block[3] = &unk_1E6191BE8;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __35__HCSettings_pairedWatchDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (id)nanoDomainAccessor
{
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F79CD8]);
    v5 = [(HCSettings *)self nanoPreferenceDomain];
    id v6 = (NPSDomainAccessor *)[v4 initWithDomain:v5];
    id v7 = self->_domainAccessor;
    self->_domainAccessor = v6;

    domainAccessor = self->_domainAccessor;
  }
  return domainAccessor;
}

- (void)_handlePreferenceChanged:(id)a3
{
  id v3 = a3;
  [v3 stringByReplacingOccurrencesOfString:@"_AXNotification_" withString:&stru_1F125CFB8];
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AX_PERFORM_WITH_LOCK();
  [(id)v6[5] enumerateObjectsUsingBlock:&__block_literal_global_1];

  _Block_object_dispose(&v5, 8);
}

void __39__HCSettings__handlePreferenceChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) synchronizePreferences];
  [v2 addObject:*(void *)(a1 + 40)];

  id v7 = [*(id *)(a1 + 32) updateBlocks];
  id v3 = [v7 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __39__HCSettings__handlePreferenceChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 objectAtIndexedSubscript:1];
  if (v2)
  {
    id v3 = v2;
    v2[2]();
    id v2 = v3;
  }
}

- (id)notificationForPreferenceKey:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", @"_AXNotification_", a3];
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  return NSStringFromSelector(a3);
}

- (void)resetValueForSelector:(SEL)a3
{
  id v4 = [(HCSettings *)self preferenceKeyForSelector:a3];
  [(HCSettings *)self setValue:0 forPreferenceKey:v4];
}

void __39__HCSettings__registerForNotification___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
  id v2 = (void *)_registerForNotification__RegistrationQueue;
  _registerForNotification__RegistrationQueue = (uint64_t)v1;
}

- (void)registerUpdateBlock:(id)a3 forRetrieveSelector:(SEL)a4 withListener:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = [NSNumber numberWithUnsignedLongLong:v7];
  v12 = v7;
  id v9 = v7;
  id v10 = v8;
  id v11 = v6;
  AX_PERFORM_WITH_LOCK();
}

void __67__HCSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke(uint64_t a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) updateBlocks];
  id v3 = [*(id *)(a1 + 32) preferenceKeyForSelector:*(void *)(a1 + 64)];
  id v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void **)(a1 + 56);
  if (v5)
  {
    id v6 = (void *)[v5 copy];
    v15[0] = *(void *)(a1 + 40);
    id v7 = (void *)MEMORY[0x1BA9C6EC0]();
    v15[1] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

    if (!v4)
    {
      id v4 = [MEMORY[0x1E4F1CA48] array];
      [v2 setObject:v4 forKey:v3];
    }
    [v4 addObject:v8];
    id v9 = *(void **)(a1 + 32);
    id v10 = [NSString stringWithFormat:@"Registering %@ - %@", v3, *(void *)(a1 + 48)];
    [v9 logMessage:v10];

    objc_getAssociatedObject(*(id *)(a1 + 48), &HCSettingsDestructionHelperKey);
    id v11 = (HCSettingsListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      id v11 = [[HCSettingsListenerHelper alloc] initWithListenerAddress:*(void *)(a1 + 48) andDelegate:*(void *)(a1 + 32)];
      objc_setAssociatedObject(*(id *)(a1 + 48), &HCSettingsDestructionHelperKey, v11, (void *)1);
    }
    [(HCSettingsListenerHelper *)v11 addSelectorKey:*(void *)(a1 + 64)];
    [*(id *)(a1 + 32) _registerForNotification:v3];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__HCSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke_2;
    v13[3] = &unk_1E6191C58;
    id v14 = *(id *)(a1 + 40);
    v12 = [v4 indexesOfObjectsPassingTest:v13];
    if ([v12 count]) {
      [v4 removeObjectsAtIndexes:v12];
    }

    id v6 = v14;
  }
}

uint64_t __67__HCSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)setValue:(id)a3 forPreferenceKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40__HCSettings_setValue_forPreferenceKey___block_invoke;
  v18[3] = &unk_1E6191CA8;
  v18[4] = self;
  id v8 = v6;
  id v19 = v8;
  id v9 = (__CFString *)v7;
  v20 = v9;
  LOBYTE(v7) = [(HCSettings *)self _switchFromRootUserIfNecessary:v18];

  if ((v7 & 1) == 0)
  {
    if ([(HCSettings *)self shouldStoreLocally])
    {
      CFStringRef v10 = [(HCSettings *)self preferenceDomainForPreferenceKey:v9];
      CFPreferencesSetAppValue(v9, v8, v10);
      CFPreferencesAppSynchronize(v10);
      id v11 = [(HCSettings *)self notificationForPreferenceKey:v9];
      if (v11)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, v11, 0, 0, 1u);
      }
    }
    v13 = [(HCSettings *)self keysToSync];
    if ([v13 count] && objc_msgSend(v13, "containsObject:", v9))
    {
      id v14 = [(HCSettings *)self nanoDomainAccessorQueue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __40__HCSettings_setValue_forPreferenceKey___block_invoke_2;
      void v15[3] = &unk_1E6191CA8;
      v15[4] = self;
      id v16 = v8;
      uint64_t v17 = v9;
      dispatch_async(v14, v15);
    }
  }
}

uint64_t __40__HCSettings_setValue_forPreferenceKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40) forPreferenceKey:*(void *)(a1 + 48)];
}

void __40__HCSettings_setValue_forPreferenceKey___block_invoke_2(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) nanoDomainAccessor];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  id v3 = [v2 synchronize];
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [NSString stringWithFormat:@"Error synchronizing accessor %@", v3];
    [v4 logMessage:v5];
  }
  id v6 = objc_opt_new();
  id v7 = [*(id *)(a1 + 32) nanoPreferenceDomain];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  v11[0] = *(void *)(a1 + 48);
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  CFStringRef v10 = [v8 setWithArray:v9];
  [v6 synchronizeNanoDomain:v7 keys:v10];
}

- (int64_t)integerValueForKey:(id)a3 withDefaultValue:(int64_t)a4
{
  uint64_t v5 = [(HCSettings *)self _valueForPreferenceKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = [v5 integerValue];
  }

  return a4;
}

- (BOOL)BOOLValueForPreferenceKey:(id)a3 withDefaultValue:(BOOL)a4
{
  uint64_t v5 = [(HCSettings *)self _valueForPreferenceKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (double)cgfloatValueForPreferenceKey:(id)a3 withDefaultValue:(double)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v8 = [NSNumber numberWithDouble:a4];
  id v9 = [(HCSettings *)self objectValueForKey:v6 withClass:v7 andDefaultValue:v8];

  [v9 doubleValue];
  double v11 = v10;

  return v11;
}

uint64_t __37__HCSettings__valueForPreferenceKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _valueForPreferenceKey:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

void __37__HCSettings__valueForPreferenceKey___block_invoke_2(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) nanoDomainAccessor];
  id v2 = [v8 synchronize];
  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [NSString stringWithFormat:@"Error synchronizing accessor %@", v2];
    [v3 logMessage:v4];
  }
  uint64_t v5 = [v8 objectForKey:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)nanoPreferenceDomain
{
  return [(HCSettings *)self preferenceDomainForPreferenceKey:0];
}

- (BOOL)shouldStoreLocally
{
  return 0;
}

- (id)keysToSync
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (void)setRegisteredNotifications:(id)a3
{
}

- (void)setSynchronizePreferences:(id)a3
{
}

- (NSMutableDictionary)updateBlocks
{
  return self->_updateBlocks;
}

- (void)setUpdateBlocks:(id)a3
{
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
}

- (NPSDomainAccessor)globalDomainAccessor
{
  return self->_globalDomainAccessor;
}

- (void)setGlobalDomainAccessor:(id)a3
{
}

- (OS_dispatch_queue)nanoDomainAccessorQueue
{
  return self->_nanoDomainAccessorQueue;
}

- (void)setNanoDomainAccessorQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nanoDomainAccessorQueue, 0);
  objc_storeStrong((id *)&self->_globalDomainAccessor, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_synchronizePreferences, 0);
  objc_storeStrong((id *)&self->_registeredNotifications, 0);
}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  return &stru_1F125CFB8;
}

- (void)logMessage:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)_switchFromRootUserIfNecessary:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)dispatch_queue_t v1 = 0;
  _os_log_fault_impl(&dword_1B8AF3000, log, OS_LOG_TYPE_FAULT, "Attempted to switch from root to mobile to deal with settings, but getpwnam for mobile returned root.", v1, 2u);
}

@end