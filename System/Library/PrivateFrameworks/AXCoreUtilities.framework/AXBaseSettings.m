@interface AXBaseSettings
- (AXBaseSettings)init;
- (BOOL)BOOLValueForPreferenceKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)_switchFromRootUserIfNecessary:(id)a3;
- (BOOL)hasExistingValueForPreferenceWithSelector:(SEL)a3;
- (NSMutableDictionary)preferenceKeysByDomainNameToSynchronize;
- (NSMutableDictionary)updateBlocks;
- (NSMutableSet)registeredPreferenceKeys;
- (double)doubleValueForPreferenceKey:(id)a3 defaultValue:(double)a4;
- (float)floatValueForPreferenceKey:(id)a3 defaultValue:(float)a4;
- (id)_userDefaultsStoreForDomainName:(id)a3;
- (id)allDomainNamesForPreferenceKey:(id)a3;
- (id)domainNameForPreferenceKey:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)notificationNameForPreferenceKey:(id)a3;
- (id)objectValueForPreferenceKey:(id)a3 ofClass:(Class)a4 defaultValue:(id)a5;
- (id)preferenceKeyForSelector:(SEL)a3;
- (id)targetForKVOKey:(id)a3;
- (id)valueForPreferenceKey:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)integerValueForPreferenceKey:(id)a3 defaultValue:(int64_t)a4;
- (void)_handlePreferenceChangedWithNotificationName:(id)a3;
- (void)_registerForNotification:(id)a3;
- (void)_registerUpdateBlock:(id)a3 forPreferenceKey:(id)a4 withListener:(id)a5;
- (void)_synchronizeIfNecessaryForPreferenceKey:(id)a3 domainName:(id)a4;
- (void)_unregisterUpdateBlockForPreferenceKey:(id)a3 withListenerID:(id)a4;
- (void)clearExistingValueForPreferenceWithSelector:(SEL)a3;
- (void)dealloc;
- (void)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)postNotificationForPreferenceKey:(id)a3;
- (void)registerUpdateBlock:(id)a3 forPreferenceKey:(id)a4 withListener:(id)a5;
- (void)registerUpdateBlock:(id)a3 forRetrieveSelector:(SEL)a4 withListener:(id)a5;
- (void)setPreferenceKeysByDomainNameToSynchronize:(id)a3;
- (void)setRegisteredPreferenceKeys:(id)a3;
- (void)setUpdateBlocks:(id)a3;
- (void)setValue:(id)a3 forPreferenceKey:(id)a4;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)unregisterUpdateBlockForPreferenceKey:(id)a3 withListenerID:(id)a4;
- (void)unregisterUpdateBlockForRetrieveSelector:(SEL)a3 withListenerID:(id)a4;
@end

@implementation AXBaseSettings

- (AXBaseSettings)init
{
  v3 = (objc_class *)objc_opt_class();
  if ((objc_class *)objc_opt_class() == v3)
  {
    v12 = AXLogSettings();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[AXBaseSettings init](v3);
    }

    v11 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AXBaseSettings;
    v4 = [(AXBaseSettings *)&v14 init];
    if (v4)
    {
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      registeredPreferenceKeys = v4->_registeredPreferenceKeys;
      v4->_registeredPreferenceKeys = v5;

      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      preferenceKeysByDomainNameToSynchronize = v4->_preferenceKeysByDomainNameToSynchronize;
      v4->_preferenceKeysByDomainNameToSynchronize = v7;

      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      updateBlocks = v4->_updateBlocks;
      v4->_updateBlocks = v9;

      v4->_domainNamesToSynchronizeLock._os_unfair_lock_opaque = 0;
    }
    self = v4;
    v11 = self;
  }

  return v11;
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_registeredPreferenceKeys;
  uint64_t v3 = [(NSMutableSet *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * v6);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        v8 = [(AXBaseSettings *)self allDomainNamesForPreferenceKey:v7];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = [(AXBaseSettings *)self _userDefaultsStoreForDomainName:*(void *)(*((void *)&v16 + 1) + 8 * v12)];
              [v13 removeObserver:self forKeyPath:v7];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [(NSMutableSet *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }

  v15.receiver = self;
  v15.super_class = (Class)AXBaseSettings;
  [(AXBaseSettings *)&v15 dealloc];
}

- (void)unregisterUpdateBlockForRetrieveSelector:(SEL)a3 withListenerID:(id)a4
{
  id v6 = a4;
  p_domainNamesToSynchronizeLock = &self->_domainNamesToSynchronizeLock;
  os_unfair_lock_lock(&self->_domainNamesToSynchronizeLock);
  v8 = [(AXBaseSettings *)self preferenceKeyForSelector:a3];
  if (v8)
  {
    [(AXBaseSettings *)self _unregisterUpdateBlockForPreferenceKey:v8 withListenerID:v6];
  }
  else
  {
    uint64_t v9 = AXLogSettings();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AXBaseSettings unregisterUpdateBlockForRetrieveSelector:withListenerID:](a3);
    }
  }
  os_unfair_lock_unlock(p_domainNamesToSynchronizeLock);
}

- (void)unregisterUpdateBlockForPreferenceKey:(id)a3 withListenerID:(id)a4
{
  p_domainNamesToSynchronizeLock = &self->_domainNamesToSynchronizeLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_domainNamesToSynchronizeLock);
  [(AXBaseSettings *)self _unregisterUpdateBlockForPreferenceKey:v8 withListenerID:v7];

  os_unfair_lock_unlock(p_domainNamesToSynchronizeLock);
}

- (void)_unregisterUpdateBlockForPreferenceKey:(id)a3 withListenerID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AXBaseSettings *)self updateBlocks];
  uint64_t v9 = [v8 objectForKey:v7];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__AXBaseSettings__unregisterUpdateBlockForPreferenceKey_withListenerID___block_invoke;
  v12[3] = &unk_1E5672F20;
  id v13 = v6;
  id v10 = v6;
  uint64_t v11 = [v9 indexesOfObjectsPassingTest:v12];
  if ([v11 count]) {
    [v9 removeObjectsAtIndexes:v11];
  }
}

uint64_t __72__AXBaseSettings__unregisterUpdateBlockForPreferenceKey_withListenerID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)registerUpdateBlock:(id)a3 forPreferenceKey:(id)a4 withListener:(id)a5
{
  p_domainNamesToSynchronizeLock = &self->_domainNamesToSynchronizeLock;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  os_unfair_lock_lock(p_domainNamesToSynchronizeLock);
  [(AXBaseSettings *)self _registerUpdateBlock:v11 forPreferenceKey:v10 withListener:v9];

  os_unfair_lock_unlock(p_domainNamesToSynchronizeLock);
}

- (void)_registerUpdateBlock:(id)a3 forPreferenceKey:(id)a4 withListener:(id)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    if (_registerUpdateBlock_forPreferenceKey_withListener__onceToken != -1) {
      dispatch_once(&_registerUpdateBlock_forPreferenceKey_withListener__onceToken, &__block_literal_global_4);
    }
    id v10 = (id)_registerUpdateBlock_forPreferenceKey_withListener__FakeListener;
  }
  id v11 = [NSNumber numberWithUnsignedLongLong:v10];
  if (v8)
  {
    uint64_t v12 = [(AXBaseSettings *)self updateBlocks];
    id v13 = [v12 objectForKey:v9];
    v21[0] = v11;
    long long v19 = (void *)[v8 copy];
    objc_super v14 = _Block_copy(v19);
    v21[1] = v14;
    objc_super v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];

    if (!v13)
    {
      id v13 = [MEMORY[0x1E4F1CA48] array];
      [v12 setObject:v13 forKey:v9];
    }
    long long v20 = v12;
    [v13 addObject:v15];
    long long v16 = objc_getAssociatedObject(v10, &AXSettingsDestructionHelpersKey);
    if (!v16)
    {
      long long v16 = [MEMORY[0x1E4F1CA60] dictionary];
      objc_setAssociatedObject(v10, &AXSettingsDestructionHelpersKey, v16, (void *)1);
    }
    long long v17 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    long long v18 = [v16 objectForKeyedSubscript:v17];
    if (!v18)
    {
      long long v18 = [[AXSettingsObjectDestructionHelper alloc] initWithListenerAddress:v10 forSettings:self];
      [v16 setObject:v18 forKeyedSubscript:v17];
    }
    [(AXSettingsObjectDestructionHelper *)v18 addPreferenceKey:v9];
    [(AXBaseSettings *)self _registerForNotification:v9];
  }
  else
  {
    [(AXBaseSettings *)self _unregisterUpdateBlockForPreferenceKey:v9 withListenerID:v11];
  }
}

uint64_t __69__AXBaseSettings__registerUpdateBlock_forPreferenceKey_withListener___block_invoke()
{
  _registerUpdateBlock_forPreferenceKey_withListener__FakeListener = (uint64_t)objc_alloc_init(MEMORY[0x1E4FBA8A8]);
  return MEMORY[0x1F41817F8]();
}

- (void)registerUpdateBlock:(id)a3 forRetrieveSelector:(SEL)a4 withListener:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  p_domainNamesToSynchronizeLock = &self->_domainNamesToSynchronizeLock;
  os_unfair_lock_lock(&self->_domainNamesToSynchronizeLock);
  id v11 = [(AXBaseSettings *)self preferenceKeyForSelector:a4];
  if (v11)
  {
    [(AXBaseSettings *)self _registerUpdateBlock:v8 forPreferenceKey:v11 withListener:v9];
  }
  else
  {
    uint64_t v12 = [(AXBaseSettings *)self swiftSettings];
    char v13 = [v12 observeWithSelector:a4 listener:v9 block:v8];

    if ((v13 & 1) == 0)
    {
      objc_super v14 = AXLogSettings();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AXBaseSettings unregisterUpdateBlockForRetrieveSelector:withListenerID:](a4);
      }
    }
  }
  os_unfair_lock_unlock(p_domainNamesToSynchronizeLock);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  uint64_t v4 = [(AXBaseSettings *)self swiftSettings];
  uint64_t v5 = [v4 forwardingTargetForSelector:a3];

  return v5;
}

- (id)targetForKVOKey:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  uint64_t v5 = [(AXBaseSettings *)self swiftSettings];
  id v6 = [v5 forwardingTargetForSelector:NSSelectorFromString(v4)];

  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28A48], @"Undefined forwarding target for axsettings key %@", v4 format];
  }

  return v6;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXBaseSettings *)self targetForKVOKey:v4];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AXBaseSettings *)self targetForKVOKey:v6];
  [v8 setValue:v7 forKey:v6];
}

- (BOOL)hasExistingValueForPreferenceWithSelector:(SEL)a3
{
  uint64_t v5 = -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:");
  if (!v5)
  {
    id v6 = AXLogSettings();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[AXBaseSettings hasExistingValueForPreferenceWithSelector:](a3);
    }
  }
  id v7 = [(AXBaseSettings *)self valueForPreferenceKey:v5];
  BOOL v8 = v7 != 0;

  return v8;
}

- (void)clearExistingValueForPreferenceWithSelector:(SEL)a3
{
  uint64_t v5 = -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:");
  if (!v5)
  {
    id v6 = AXLogSettings();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[AXBaseSettings hasExistingValueForPreferenceWithSelector:](a3);
    }
  }
  [(AXBaseSettings *)self setValue:0 forPreferenceKey:v5];
}

- (id)notificationNameForPreferenceKey:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", @"_AXNotification_", a3];
}

- (id)allDomainNamesForPreferenceKey:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AXBaseSettings *)self domainNameForPreferenceKey:a3];
  id v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)valueForPreferenceKey:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__1;
  long long v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__AXBaseSettings_valueForPreferenceKey___block_invoke;
  v10[3] = &unk_1E5672F48;
  uint64_t v12 = &v13;
  v10[4] = self;
  uint64_t v5 = (__CFString *)v4;
  id v11 = v5;
  if ([(AXBaseSettings *)self _switchFromRootUserIfNecessary:v10])
  {
    id v6 = (id)v14[5];
  }
  else
  {

    id v7 = [(AXBaseSettings *)self domainNameForPreferenceKey:v5];
    [(AXBaseSettings *)self _synchronizeIfNecessaryForPreferenceKey:v5 domainName:v7];
    if (v7)
    {
      [(AXBaseSettings *)self _registerForNotification:v5];
      id v6 = (id)CFPreferencesCopyAppValue(v5, v7);
    }
    else
    {
      BOOL v8 = AXLogSettings();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[AXBaseSettings valueForPreferenceKey:]();
      }

      id v6 = 0;
    }
  }
  _Block_object_dispose(&v13, 8);

  return v6;
}

uint64_t __40__AXBaseSettings_valueForPreferenceKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) valueForPreferenceKey:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (void)setValue:(id)a3 forPreferenceKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__AXBaseSettings_setValue_forPreferenceKey___block_invoke;
  v11[3] = &unk_1E5672F70;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v9 = (__CFString *)v7;
  uint64_t v13 = v9;
  LOBYTE(v7) = [(AXBaseSettings *)self _switchFromRootUserIfNecessary:v11];

  if ((v7 & 1) == 0)
  {
    CFStringRef v10 = [(AXBaseSettings *)self domainNameForPreferenceKey:v9];
    CFPreferencesSetAppValue(v9, v8, v10);
    CFPreferencesAppSynchronize(v10);
    [(AXBaseSettings *)self willPostNotificationForPreferenceKey:v9 value:v8];
    [(AXBaseSettings *)self postNotificationForPreferenceKey:v9];
  }
}

uint64_t __44__AXBaseSettings_setValue_forPreferenceKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40) forPreferenceKey:*(void *)(a1 + 48)];
}

- (void)postNotificationForPreferenceKey:(id)a3
{
  name = [(AXBaseSettings *)self notificationNameForPreferenceKey:a3];
  if (name)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
  }
}

- (BOOL)BOOLValueForPreferenceKey:(id)a3 defaultValue:(BOOL)a4
{
  uint64_t v5 = [(AXBaseSettings *)self valueForPreferenceKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (int64_t)integerValueForPreferenceKey:(id)a3 defaultValue:(int64_t)a4
{
  uint64_t v5 = [(AXBaseSettings *)self valueForPreferenceKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = [v5 integerValue];
  }

  return a4;
}

- (double)doubleValueForPreferenceKey:(id)a3 defaultValue:(double)a4
{
  uint64_t v5 = [(AXBaseSettings *)self valueForPreferenceKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 doubleValue];
    a4 = v6;
  }

  return a4;
}

- (float)floatValueForPreferenceKey:(id)a3 defaultValue:(float)a4
{
  uint64_t v5 = [(AXBaseSettings *)self valueForPreferenceKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 floatValue];
    a4 = v6;
  }

  return a4;
}

- (id)objectValueForPreferenceKey:(id)a3 ofClass:(Class)a4 defaultValue:(id)a5
{
  id v7 = a5;
  id v8 = [(AXBaseSettings *)self valueForPreferenceKey:a3];
  if (!v8 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = v7;

    id v8 = v9;
  }

  return v8;
}

- (BOOL)_switchFromRootUserIfNecessary:(id)a3
{
  uint64_t v3 = (void (**)(void))a3;
  if (!geteuid())
  {
    float v6 = getpwnam("mobile");
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
      id v8 = AXLogSettings();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[AXBaseSettings _switchFromRootUserIfNecessary:](v8);
      }
    }
  }
  BOOL v4 = 0;
LABEL_3:

  return v4;
}

- (void)_synchronizeIfNecessaryForPreferenceKey:(id)a3 domainName:(id)a4
{
  float v6 = (__CFString *)a4;
  if (v6)
  {
    p_domainNamesToSynchronizeLock = &self->_domainNamesToSynchronizeLock;
    CFStringRef applicationID = v6;
    id v8 = a3;
    os_unfair_lock_lock(&self->_domainNamesToSynchronizeLock);
    id v9 = [(AXBaseSettings *)self preferenceKeysByDomainNameToSynchronize];
    CFStringRef v10 = [v9 objectForKeyedSubscript:applicationID];

    LODWORD(v9) = [v10 containsObject:v8];
    [v10 removeObject:v8];

    os_unfair_lock_unlock(p_domainNamesToSynchronizeLock);
    if (v9) {
      CFPreferencesAppSynchronize(applicationID);
    }

    float v6 = (__CFString *)applicationID;
  }
}

- (void)_handlePreferenceChangedWithNotificationName:(id)a3
{
  BOOL v4 = [a3 stringByReplacingOccurrencesOfString:@"_AXNotification_" withString:&stru_1EDF601D0];
  uint64_t v5 = [(AXBaseSettings *)self domainNameForPreferenceKey:v4];
  if (v5)
  {
    os_unfair_lock_lock(&self->_domainNamesToSynchronizeLock);
    float v6 = [(AXBaseSettings *)self preferenceKeysByDomainNameToSynchronize];
    id v7 = [v6 objectForKeyedSubscript:v5];

    if (!v7)
    {
      id v7 = [MEMORY[0x1E4F1CA80] set];
      id v8 = [(AXBaseSettings *)self preferenceKeysByDomainNameToSynchronize];
      [v8 setObject:v7 forKeyedSubscript:v5];
    }
    [v7 addObject:v4];
    id v9 = [(AXBaseSettings *)self updateBlocks];
    CFStringRef v10 = [v9 objectForKey:v4];
    id v11 = (void *)[v10 copy];

    os_unfair_lock_unlock(&self->_domainNamesToSynchronizeLock);
    [(AXBaseSettings *)self willPerformUpdateBlocksForPreferenceKey:v4];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__AXBaseSettings__handlePreferenceChangedWithNotificationName___block_invoke;
    v13[3] = &unk_1E5672590;
    id v14 = v11;
    id v12 = v11;
    AXPerformBlockOnMainThread(v13);
  }
}

uint64_t __63__AXBaseSettings__handlePreferenceChangedWithNotificationName___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_27_0];
}

void __63__AXBaseSettings__handlePreferenceChangedWithNotificationName___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 objectAtIndexedSubscript:1];
  if (v2)
  {
    uint64_t v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (id)_userDefaultsStoreForDomainName:(id)a3
{
  id v3 = a3;
  if (_userDefaultsStoreForDomainName__onceToken != -1) {
    dispatch_once(&_userDefaultsStoreForDomainName__onceToken, &__block_literal_global_29);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_defaultsStoreCacheLock);
  BOOL v4 = [(id)_domainNameToDefaultsStoreMap objectForKeyedSubscript:v3];
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
    float v6 = [v5 bundleIdentifier];
    int v7 = [v6 isEqualToString:v3];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    }
    else
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v3];
    }
    BOOL v4 = (void *)v8;
    [(id)_domainNameToDefaultsStoreMap setObject:v8 forKeyedSubscript:v3];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_defaultsStoreCacheLock);

  return v4;
}

void __50__AXBaseSettings__userDefaultsStoreForDomainName___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_domainNameToDefaultsStoreMap;
  _domainNameToDefaultsStoreMap = (uint64_t)v0;

  _defaultsStoreCacheLock = 0;
}

- (void)_registerForNotification:(id)a3
{
  id v4 = a3;
  if (_registerForNotification__onceToken != -1) {
    dispatch_once(&_registerForNotification__onceToken, &__block_literal_global_33_0);
  }
  uint64_t v5 = _registerForNotification__RegistrationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __43__AXBaseSettings__registerForNotification___block_invoke_2;
  v7[3] = &unk_1E5672FB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __43__AXBaseSettings__registerForNotification___block_invoke()
{
  _registerForNotification__RegistrationQueue = (uint64_t)dispatch_queue_create("AXBaseSettings-Registration", 0);
  return MEMORY[0x1F41817F8]();
}

void __43__AXBaseSettings__registerForNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) registeredPreferenceKeys];
  if (([v2 containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    [v2 addObject:*(void *)(a1 + 40)];
    id v3 = [*(id *)(a1 + 32) notificationNameForPreferenceKey:*(void *)(a1 + 40)];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_axSettingsHandlePreferenceChanged, v3, 0, (CFNotificationSuspensionBehavior)1028);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "allDomainNamesForPreferenceKey:", *(void *)(a1 + 40), 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          CFStringRef v10 = [*(id *)(a1 + 32) _userDefaultsStoreForDomainName:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
          [v10 addObserver:*(void *)(a1 + 32) forKeyPath:*(void *)(a1 + 40) options:3 context:0];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v17 = a3;
  id v9 = a5;
  id v10 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v12 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
    long long v13 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    long long v14 = [MEMORY[0x1E4F1CA98] null];
    if (![v12 isEqual:v14])
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      if (![v13 isEqual:v15])
      {
        char v16 = [v12 isEqual:v13];

        if ((v16 & 1) == 0) {
          [(AXBaseSettings *)self _handlePreferenceChangedWithNotificationName:v17];
        }
        goto LABEL_6;
      }
    }
LABEL_6:
  }
}

- (NSMutableSet)registeredPreferenceKeys
{
  return self->_registeredPreferenceKeys;
}

- (void)setRegisteredPreferenceKeys:(id)a3
{
}

- (NSMutableDictionary)preferenceKeysByDomainNameToSynchronize
{
  return self->_preferenceKeysByDomainNameToSynchronize;
}

- (void)setPreferenceKeysByDomainNameToSynchronize:(id)a3
{
}

- (NSMutableDictionary)updateBlocks
{
  return self->_updateBlocks;
}

- (void)setUpdateBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_preferenceKeysByDomainNameToSynchronize, 0);
  objc_storeStrong((id *)&self->_registeredPreferenceKeys, 0);
}

- (id)domainNameForPreferenceKey:(id)a3
{
  return 0;
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  return 0;
}

- (void)init
{
  v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_18FC6C000, v2, v3, "Attempted to create an instance of abstract class %@", v4, v5, v6, v7, v8);
}

- (void)unregisterUpdateBlockForRetrieveSelector:(const char *)a1 withListenerID:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_18FC6C000, v2, v3, "Cannot register update block for selector '%@'. No matching pref key was found.", v4, v5, v6, v7, v8);
}

- (void)hasExistingValueForPreferenceWithSelector:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_18FC6C000, v2, v3, "Could not find preference key for %@", v4, v5, v6, v7, v8);
}

- (void)valueForPreferenceKey:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_18FC6C000, v0, OS_LOG_TYPE_FAULT, "Can not get value without domain name for preference key: %@", v1, 0xCu);
}

- (void)_switchFromRootUserIfNecessary:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18FC6C000, log, OS_LOG_TYPE_FAULT, "Attempted to switch from root to mobile to deal with settings, but getpwnam for mobile returned root.", v1, 2u);
}

@end