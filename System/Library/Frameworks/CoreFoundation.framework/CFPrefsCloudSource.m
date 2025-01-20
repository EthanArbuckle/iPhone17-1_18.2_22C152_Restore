@interface CFPrefsCloudSource
- (BOOL)enabled;
- (CFPrefsCloudSource)initWithDomain:(__CFString *)a3 user:(__CFString *)a4 byHost:(BOOL)a5 containerPath:(__CFString *)a6 containingPreferences:(id)a7;
- (id)createSynchronizeMessage;
- (int)alreadylocked_updateObservingRemoteChanges;
- (void)dealloc;
- (void)fullCloudSynchronizeWithCompletionHandler:(id)a3;
- (void)mergeIntoDictionary:(__CFDictionary *)a3 sourceDictionary:(__CFDictionary *)a4 cloudKeyEvaluator:(id)a5;
- (void)setConfigurationPath:(__CFString *)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setStoreName:(__CFString *)a3;
@end

@implementation CFPrefsCloudSource

- (CFPrefsCloudSource)initWithDomain:(__CFString *)a3 user:(__CFString *)a4 byHost:(BOOL)a5 containerPath:(__CFString *)a6 containingPreferences:(id)a7
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  v8.receiver = self;
  v8.super_class = (Class)CFPrefsCloudSource;
  result = [(CFPrefsPlistSource *)&v8 initWithDomain:a3 user:a4 byHost:a5 containerPath:a6 containingPreferences:a7];
  if (result) {
    atomic_store((unint64_t)&sentinelGeneration, (unint64_t *)&result->super.super.shmemEntry);
  }
  return result;
}

- (id)createSynchronizeMessage
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  v7.receiver = self;
  v7.super_class = (Class)CFPrefsCloudSource;
  id v3 = [(CFPrefsPlistSource *)&v7 createSynchronizeMessage];
  v4 = v3;
  if (v3)
  {
    configPath = self->_configPath;
    if (configPath)
    {
      xpc_dictionary_set_string(v3, "CFPreferencesCloudConfig", configPath);
      xpc_dictionary_set_string(v4, "CFPreferencesCloudStoreIdentifier", self->_storeName);
    }
  }
  return v4;
}

- (int)alreadylocked_updateObservingRemoteChanges
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->super._volatile);
  if (v2) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CFPrefsCloudSource;
  return [(CFPrefsPlistSource *)&v4 alreadylocked_updateObservingRemoteChanges];
}

- (void)fullCloudSynchronizeWithCompletionHandler:(id)a3
{
  v7[6] = *(void *)off_1ECE0A5B0;
  os_unfair_lock_lock(&self->super.super._lock);
  if ([(CFPrefsPlistSource *)self isDirectModeEnabled])
  {
    int v5 = 3;
  }
  else
  {
    int v5 = 1;
    if (xpc_user_sessions_enabled())
    {
      if (CFEqual(@"kCFPreferencesAnyUser", [(CFPrefsPlistSource *)self userIdentifier])) {
        int v5 = 2;
      }
      else {
        int v5 = 1;
      }
    }
  }
  containingPreferences = self->super.super._containingPreferences;
  v7[0] = off_1ECE0A5A0;
  v7[1] = 3221225472;
  v7[2] = __64__CFPrefsCloudSource_fullCloudSynchronizeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1ECDFE5E8;
  v7[4] = self;
  v7[5] = a3;
  -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](&containingPreferences->super.isa, v5, [(CFPrefsPlistSource *)self userIdentifier], (uint64_t)v7);
}

void __64__CFPrefsCloudSource_fullCloudSynchronizeWithCompletionHandler___block_invoke(uint64_t a1, _xpc_connection_s *a2)
{
  v11[5] = *(void *)off_1ECE0A5B0;
  id v3 = *(os_unfair_lock_s **)(a1 + 32);
  if (a2)
  {
    int v5 = (void *)[(os_unfair_lock_s *)v3 createSynchronizeMessage];
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_BOOL(v5, "FullCloudSync", 1);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 52));
      qos_class_t v7 = qos_class_self();
      global_queue = dispatch_get_global_queue(v7, 0);
      v11[0] = off_1ECE0A5A0;
      v11[1] = 3221225472;
      v11[2] = __64__CFPrefsCloudSource_fullCloudSynchronizeWithCompletionHandler___block_invoke_2;
      v11[3] = &unk_1ECDFE5C0;
      v11[4] = *(void *)(a1 + 40);
      xpc_connection_send_message_with_reply(a2, v6, global_queue, v11);
      xpc_release(v6);
      return;
    }
    uint64_t v9 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 52);
  }
  else
  {
    uint64_t v9 = v3 + 13;
  }
  os_unfair_lock_unlock(v9);
  v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);

  v10();
}

void __64__CFPrefsCloudSource_fullCloudSynchronizeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  CFDictionaryRef v2 = CFDictionaryCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, 0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  CFRelease(v2);
}

- (void)mergeIntoDictionary:(__CFDictionary *)a3 sourceDictionary:(__CFDictionary *)a4 cloudKeyEvaluator:(id)a5
{
  context[8] = *(void *)off_1ECE0A5B0;
  if (self->_enabled)
  {
    os_unfair_lock_lock(&self->super.super._lock);
    uint64_t v9 = [(CFPrefsPlistSource *)self alreadylocked_copyDictionary];
    os_unfair_lock_unlock(&self->super.super._lock);
    if (v9)
    {
      context[0] = off_1ECE0A5A0;
      context[1] = 3221225472;
      context[2] = __77__CFPrefsCloudSource_mergeIntoDictionary_sourceDictionary_cloudKeyEvaluator___block_invoke;
      context[3] = &unk_1ECDFE610;
      context[6] = a3;
      context[7] = a4;
      context[4] = self;
      context[5] = a5;
      _CFPrefsDictionaryApplyBlock(v9, context);
      CFRelease(v9);
    }
  }
}

void __77__CFPrefsCloudSource_mergeIntoDictionary_sourceDictionary_cloudKeyEvaluator___block_invoke(uint64_t a1, const void *a2, const void *a3)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 48), a2, a3);
    v6 = *(__CFDictionary **)(a1 + 56);
    if (v6)
    {
      qos_class_t v7 = *(const void **)(a1 + 32);
      CFDictionaryAddValue(v6, a2, v7);
    }
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_lock(&self->super.super._lock);
  atomic_store(!v3, (unsigned __int8 *)&self->super._volatile);
  self->_enabled = v3;
  p_shmemEntry = (unint64_t *)&self->super.super.shmemEntry;
  if (!v3)
  {
    atomic_store((unint64_t)&sentinelGeneration, p_shmemEntry);
  }
  else
  {
    atomic_store(0, p_shmemEntry);
    int v13 = 0;
    id v6 = [(CFPrefsPlistSource *)self alreadylocked_createObserverUpdateMessageWithOperation:[(CFPrefsCloudSource *)self alreadylocked_updateObservingRemoteChanges] forRole:&v13];
    if (v6)
    {
      qos_class_t v7 = v6;
      containingPreferences = self->super.super._containingPreferences;
      int v9 = v13;
      v10 = [(CFPrefsPlistSource *)self userIdentifier];
      v11[0] = off_1ECE0A5A0;
      v11[1] = 3221225472;
      v11[2] = __33__CFPrefsCloudSource_setEnabled___block_invoke;
      v11[3] = &unk_1ECDFE660;
      int v12 = v13;
      v11[4] = self;
      v11[5] = v7;
      -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](&containingPreferences->super.isa, v9, v10, (uint64_t)v11);
      xpc_release(v7);
    }
  }
  os_unfair_lock_unlock(&self->super.super._lock);
}

void __33__CFPrefsCloudSource_setEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *(void *)off_1ECE0A5B0;
  if (a2)
  {
    objc_super v4 = _os_activity_create(&dword_182B90000, "Updating Key-Value Observers Of Preferences", (os_activity_t)off_1ECE0A638, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    int v5 = *(_DWORD *)(a1 + 48);
    id v6 = *(const os_unfair_lock **)(*(void *)(a1 + 32) + 8);
    v8[0] = off_1ECE0A5A0;
    v8[1] = 3221225472;
    v8[2] = __33__CFPrefsCloudSource_setEnabled___block_invoke_2;
    v8[3] = &unk_1ECDFE638;
    uint64_t v7 = *(void *)(a1 + 40);
    v8[4] = a2;
    v8[5] = v7;
    if (v5 == 1)
    {
      CFPREFERENCES_IS_WAITING_FOR_USER_CFPREFSD(v6, (uint64_t)v8);
    }
    else if (v5 == 3)
    {
      CFPREFERENCES_IS_WAITING_FOR_DIRECT_CFPREFSD(v6, (uint64_t)v8);
    }
    else
    {
      CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(v6, (uint64_t)v8);
    }

    os_activity_scope_leave(&state);
  }
}

void __33__CFPrefsCloudSource_setEnabled___block_invoke_2(uint64_t a1)
{
  xpc_object_t v1 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  if (v1)
  {
    xpc_release(v1);
  }
}

- (void)setConfigurationPath:(__CFString *)a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_lock(&self->super.super._lock);
  configPath = (char *)self->_configPath;
  if (configPath) {
    free(configPath);
  }
  bzero(buffer, 0x402uLL);
  if (a3 && CFStringGetCString(a3, buffer, 1026, 0x8000100u)) {
    self->_configPath = strdup(buffer);
  }
  os_unfair_lock_unlock(&self->super.super._lock);
}

- (void)setStoreName:(__CFString *)a3
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_lock(&self->super.super._lock);
  storeName = (char *)self->_storeName;
  if (storeName) {
    free(storeName);
  }
  bzero(buffer, 0x402uLL);
  if (a3 && CFStringGetCString(a3, buffer, 1026, 0x8000100u)) {
    self->_storeName = strdup(buffer);
  }
  os_unfair_lock_unlock(&self->super.super._lock);
}

- (void)dealloc
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  storeName = (char *)self->_storeName;
  if (storeName) {
    free(storeName);
  }
  configPath = (char *)self->_configPath;
  if (configPath) {
    free(configPath);
  }
  v5.receiver = self;
  v5.super_class = (Class)CFPrefsCloudSource;
  [(CFPrefsPlistSource *)&v5 dealloc];
}

@end