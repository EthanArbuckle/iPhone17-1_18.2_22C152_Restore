@interface CFPrefsSearchListSource
- (BOOL)alreadylocked_hasNonRegisteredValueForKey:(uint64_t)a1;
- (BOOL)isDirectModeEnabled;
- (CFMutableArrayRef)_getPendingNotifications;
- (CFMutableDictionaryRef)alreadylocked_copyManagedDictionary;
- (CFPrefsSearchListSource)initWithIdentifier:(__CFString *)a3 containingPreferences:(id)a4;
- (CFStringRef)copyCloudConfigurationWithURL:(CFPrefsConfigurationFileSource *)a3 outConfigFileSource:(CFStringRef *)a4 outStoreName:;
- (__CFArray)alreadylocked_copyKeyList;
- (__CFDictionary)alreadylocked_copyDictionary;
- (__CFString)copyOSLogDescription;
- (__CFString)domainIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createRequestNewContentMessageForDaemon:(int)a3;
- (id)description;
- (int64_t)generationCount;
- (uint64_t)alreadylocked_copyManagedValueForKey:;
- (uint64_t)alreadylocked_generationCountFromListOfSources:(uint64_t)a3 count:;
- (uint64_t)alreadylocked_hasCloudValueForKey:(uint64_t)result;
- (uint64_t)alreadylocked_requestNewData;
- (uint64_t)alreadylocked_useCloudForKey:(uint64_t)result;
- (uint64_t)freeze;
- (uint64_t)synchronouslySendSystemMessage:(uint64_t)a3 andUserMessage:(uint64_t)a4 andDirectMessage:(uint64_t)a5 replyHandler:;
- (void)_getPendingNotifications;
- (void)addCloudSourceForIdentifier:(uint64_t)a3 configurationPath:(uint64_t)a4 storeName:(const __CFString *)a5 container:;
- (void)addManagedSourceForIdentifier:(uint64_t)a3 user:;
- (void)addNamedVolatileSourceForIdentifier:(uint64_t)a1;
- (void)addPreferencesObserver:(uint64_t)a1;
- (void)addSource:(uint64_t)a1;
- (void)addSourceForIdentifier:(const __CFString *)a3 user:(int)a4 byHost:(const __CFString *)a5 container:;
- (void)addSuiteSourceForIdentifier:(const __CFString *)a3 user:;
- (void)alreadylocked_copyValueForKey:(__CFString *)a3;
- (void)alreadylocked_getDictionary:(uint64_t)a1;
- (void)alreadylocked_reloadCacheIfStale;
- (void)alreadylocked_setObservingContents:(uint64_t)a1;
- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6;
- (void)dealloc;
- (void)deferredNotifyCausedByLoadingOfChangesFromDictionary:(__CFDictionary *)a3 toDictionary:(__CFDictionary *)Copy;
- (void)deferredNotifyCausedByLocalWriteOfChangesToKey:(__CFString *)a3 fromValue:(void *)a4 toValue:(void *)a5;
- (void)fullCloudSynchronizeWithCompletionHandler:(id)a3;
- (void)handleChangeNotificationForDomainIdentifier:(__CFString *)a3 isRemote:(BOOL)a4;
- (void)handleReply:(id)a3 toRequestNewDataMessage:(id)a4 onConnection:(id)a5 retryCount:(int)a6 error:(BOOL *)a7;
- (void)removePreferencesObserver:(uint64_t)a1;
- (void)removeSource:(uint64_t)a1;
- (void)replaceSource:(const void *)a3 withSource:;
- (void)setCloudEnabled:(const void *)a3 forKey:;
- (void)setCloudEnabled:(const void *)a3 forKeyPrefix:;
- (void)transitionIntoDirectModeIfNeededWithRetryBlock:(id)a3;
- (xpc_object_t)createMultiMessageWithContainedMessages:(uint64_t)a1;
@end

@implementation CFPrefsSearchListSource

- (void)deferredNotifyCausedByLocalWriteOfChangesToKey:(__CFString *)a3 fromValue:(void *)a4 toValue:(void *)a5
{
  v6 = (char *)a4;
  keys[1] = *(void **)off_1ECE0A5B0;
  values = a4;
  keys[0] = a3;
  v11 = a5;
  os_unfair_lock_assert_owner(&self->super._lock);
  if (v6) {
    v6 = (char *)CFDictionaryCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const void **)keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  if (a5) {
    v8 = (char *)CFDictionaryCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const void **)keys, (const void **)&v11, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  else {
    v8 = 0;
  }
  v9 = objc_alloc_init(_CFPrefsPendingKVONotification);
  -[_CFPrefsPendingKVONotification setSource:](v9, (char *)self);
  -[_CFPrefsPendingKVONotification setValues:](v9, v8);
  -[_CFPrefsPendingKVONotification setOldValues:](v9, v6);
  if (v6) {
    CFRelease(v6);
  }
  if (v8) {
    CFRelease(v8);
  }
  Pending = -[CFPrefsSearchListSource _getPendingNotifications]((uint64_t)self);
  CFArrayAppendValue(Pending, v9);
}

- (void)deferredNotifyCausedByLoadingOfChangesFromDictionary:(__CFDictionary *)a3 toDictionary:(__CFDictionary *)Copy
{
  os_unfair_lock_assert_owner(&self->super._lock);
  if (a3) {
    CFRetain(a3);
  }
  if (Copy) {
    Copy = CFDictionaryCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, Copy);
  }
  value = objc_alloc_init(_CFPrefsPendingKVONotification);
  -[_CFPrefsPendingKVONotification setSource:](value, (char *)self);
  -[_CFPrefsPendingKVONotification setValues:](value, (char *)Copy);
  -[_CFPrefsPendingKVONotification setOldValues:](value, (char *)a3);
  if (a3) {
    CFRelease(a3);
  }
  if (Copy) {
    CFRelease(Copy);
  }
  Pending = -[CFPrefsSearchListSource _getPendingNotifications]((uint64_t)self);
  CFArrayAppendValue(Pending, value);
}

- (CFMutableArrayRef)_getPendingNotifications
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = _CFGetTSD(0x10u);
  if (v1 == 16)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
    _CFSetTSD(0x10u, (uint64_t)Mutable, (uint64_t)pendingKVODestructor);
  }
  else
  {
    CFMutableArrayRef Mutable = (CFMutableArrayRef)v1;
    if (!v1) {
      -[CFPrefsSearchListSource _getPendingNotifications]();
    }
  }
  return Mutable;
}

- (__CFDictionary)alreadylocked_copyDictionary
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = off_1ECE0A5A0;
  v4[1] = 3221225472;
  v4[2] = __55__CFPrefsSearchListSource_alreadylocked_copyDictionary__block_invoke;
  v4[3] = &unk_1ECDFEFB8;
  v4[4] = &v5;
  -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)v4);
  v2 = (__CFDictionary *)v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)addSource:(uint64_t)a1
{
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 120)) {
      -[CFPrefsSearchListSource addSource:]();
    }
    CFArrayRef Mutable = *(const __CFArray **)(a1 + 80);
    if (!Mutable)
    {
      CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
      *(void *)(a1 + 80) = Mutable;
    }
    v5.length = CFArrayGetCount(Mutable);
    v5.location = 0;
    if (!CFArrayContainsValue(Mutable, v5, a2)) {
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 80), a2);
    }
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 32));
  }
}

void __62__CFPrefsSearchListSource_addManagedSourceForIdentifier_user___block_invoke(uint64_t a1, const void *a2)
{
}

- (CFPrefsSearchListSource)initWithIdentifier:(__CFString *)a3 containingPreferences:(id)a4
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  v7.receiver = self;
  v7.super_class = (Class)CFPrefsSearchListSource;
  CFRange v5 = [(CFPrefsSource *)&v7 initWithContainingPreferences:a4];
  if (v5)
  {
    v5->_identifier = _CFStringCopyBundleUnloadingProtectedString((unint64_t *)a3);
    v5->super._isSearchList = 1;
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&v5->super._generationCount);
  }
  return v5;
}

void __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  v5[6] = *(void *)off_1ECE0A5B0;
  v3 = *(_xpc_connection_s ***)(*(void *)(a1 + 32) + 8);
  v5[0] = off_1ECE0A5A0;
  v5[1] = 3221225472;
  v5[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_2;
  v5[3] = &unk_1ECDFE5E8;
  uint64_t v4 = *(void *)(a1 + 40);
  v5[4] = a2;
  v5[5] = v4;
  -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](v3, a3, 0, (uint64_t)v5);
}

void __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_2(uint64_t a1, xpc_connection_t connection)
{
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(connection, *(xpc_object_t *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, xpc_object_t, xpc_connection_t))(v5 + 16))(v5, *(void *)(a1 + 32), v4, connection);
  }

  xpc_release(v4);
}

uint64_t __80__CFPrefsSearchListSource_alreadylocked_generationCountFromListOfSources_count___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  char v5 = 0;
  return [*(id *)(a1 + 32) handleReply:a3 toRequestNewDataMessage:a2 onConnection:a4 retryCount:0 error:&v5];
}

- (void)handleReply:(id)a3 toRequestNewDataMessage:(id)a4 onConnection:(id)a5 retryCount:(int)a6 error:(BOOL *)a7
{
  v17[7] = *(void *)off_1ECE0A5B0;
  sourceList = self->_sourceList;
  if (!sourceList) {
    return;
  }
  if (!a3) {
    goto LABEL_5;
  }
  if (object_getClass(a3) != (Class)off_1ECE0A690)
  {
    sourceList = self->_sourceList;
LABEL_5:
    if (CFArrayGetCount(sourceList) >= 1)
    {
      CFIndex v12 = 0;
      do
        objc_msgSend((id)CFArrayGetValueAtIndex(self->_sourceList, v12++), "generationCount");
      while (CFArrayGetCount(self->_sourceList) > v12);
    }
    return;
  }
  xpc_object_t value = xpc_dictionary_get_value(a4, "CFPreferencesMessages");
  xpc_object_t v14 = xpc_dictionary_get_value(a3, "CFPreferencesMessages");
  if (v14)
  {
    v15 = v14;
    CFIndex Count = CFArrayGetCount(self->_sourceList);
    if (Count != xpc_array_get_count(v15)) {
      -[CFPrefsSearchListSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:]();
    }
    v17[0] = off_1ECE0A5A0;
    v17[1] = 3221225472;
    v17[2] = __93__CFPrefsSearchListSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke;
    v17[3] = &unk_1ECDFEFE0;
    v17[4] = self;
    v17[5] = value;
    v17[6] = a5;
    xpc_array_apply(v15, v17);
  }
}

uint64_t __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 1);
}

- (void)addSource:.cold.1()
{
}

uint64_t __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 2);
}

- (uint64_t)alreadylocked_requestNewData
{
  if (result)
  {
    uint64_t v1 = result;
    CFArrayRef v2 = *(const __CFArray **)(result + 80);
    if (v2 && (CFIndex Count = CFArrayGetCount(v2), Count >= 1))
    {
      CFIndex v4 = Count;
      result = objc_msgSend((id)CFArrayGetValueAtIndex(*(CFArrayRef *)(v1 + 80), 0), "synchronize");
      if (result)
      {
        CFIndex v5 = 1;
        do
        {
          CFIndex v6 = v5;
          if (v4 == v5) {
            break;
          }
          char v7 = objc_msgSend((id)CFArrayGetValueAtIndex(*(CFArrayRef *)(v1 + 80), v5), "synchronize");
          CFIndex v5 = v6 + 1;
        }
        while ((v7 & 1) != 0);
        return v4 <= v6;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)alreadylocked_copyValueForKey:(__CFString *)a3
{
  uint64_t v25 = *(void *)off_1ECE0A5B0;
  if (!self->_sourceList) {
    return 0;
  }
  uint64_t v13 = 0;
  xpc_object_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = off_1ECE0A5A0;
  v12[1] = 3221225472;
  v12[2] = __57__CFPrefsSearchListSource_alreadylocked_copyValueForKey___block_invoke;
  v12[3] = &unk_1ECDFEF90;
  v12[4] = &v13;
  v12[5] = a3;
  -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)v12);
  if (makeLogHandles_logToken != -1) {
    dispatch_once(&makeLogHandles_logToken, &__block_literal_global_167);
  }
  if (os_log_type_enabled((os_log_t)clientHandle, OS_LOG_TYPE_DEBUG))
  {
    if (v14[3]) {
      Value = (void *)CFDictionaryGetValue(self->_keysToSources, a3);
    }
    else {
      Value = 0;
    }
    char v7 = [(CFPrefsSearchListSource *)self copyOSLogDescription];
    uint64_t v8 = (const void *)[Value copyOSLogDescription];
    if (v14[3])
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      if (makeLogHandles_logToken != -1) {
        dispatch_once(&makeLogHandles_logToken, &__block_literal_global_167);
      }
      uint64_t v9 = clientHandle;
      if (os_log_type_enabled((os_log_t)clientHandle, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = v14[3];
        *(_DWORD *)buf = 138478595;
        uint64_t v18 = v11;
        __int16 v19 = 2114;
        v20 = a3;
        __int16 v21 = 2114;
        v22 = v8;
        __int16 v23 = 2114;
        v24 = v7;
        _os_log_debug_impl(&dword_182B90000, v9, OS_LOG_TYPE_DEBUG, "looked up value %{private}@ for key %{public}@ in %{public}@ via %{public}@", buf, 0x2Au);
      }
    }
    else
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      if (makeLogHandles_logToken != -1) {
        dispatch_once(&makeLogHandles_logToken, &__block_literal_global_167);
      }
      if (os_log_type_enabled((os_log_t)clientHandle, OS_LOG_TYPE_DEBUG)) {
        -[CFPrefsSearchListSource alreadylocked_copyValueForKey:]((uint64_t)a3);
      }
    }
    _CFSetTSD(0xFu, 0, 0);
    CFRelease(v7);
    if (v8) {
      CFRelease(v8);
    }
  }
  CFIndex v6 = (void *)v14[3];
  _Block_object_dispose(&v13, 8);
  return v6;
}

- (void)alreadylocked_getDictionary:(uint64_t)a1
{
  v24[5] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 52));
    CFArrayRef v5 = *(const __CFArray **)(a1 + 80);
    if (v5)
    {
      if (!byte_1EC090E01) {
        goto LABEL_7;
      }
      atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 32));
      CFIndex v6 = *(const void **)(a1 + 16);
      if (v6) {
        CFRelease(v6);
      }
      *(void *)(a1 + 16) = 0;
      CFArrayRef v5 = *(const __CFArray **)(a1 + 80);
      if (!v5)
      {
        MEMORY[0x1F4188790](0, v4);
        uint64_t v11 = (const void **)&v23;
        uint64_t Count = 0;
      }
      else
      {
LABEL_7:
        uint64_t Count = CFArrayGetCount(v5);
        uint64_t v9 = MEMORY[0x1F4188790](Count, v8);
        uint64_t v11 = (const void **)((char *)v24 - v10);
        if (v9 >= 1)
        {
          v26.location = 0;
          v26.length = Count;
          CFArrayGetValues(*(CFArrayRef *)(a1 + 80), v26, v11);
        }
      }
      uint64_t v13 = -[CFPrefsSearchListSource alreadylocked_generationCountFromListOfSources:count:](a1, (uint64_t *)v11, Count);
      unint64_t v14 = atomic_load((unint64_t *)(a1 + 32));
      if (v14 == v13)
      {
        uint64_t v15 = *(const void **)(a1 + 16);
        if (!v15)
        {
          *(void *)(a1 + 16) = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          uint64_t v15 = *(const void **)(a1 + 16);
        }
        CFTypeRef v16 = CFRetain(v15);
LABEL_26:
        (*(void (**)(uint64_t, CFTypeRef))(a2 + 16))(a2, v16);
        CFRelease(v16);
        return;
      }
      unint64_t v17 = v13;
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFMutableDictionaryRef v19 = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v24[0] = off_1ECE0A5A0;
      v24[1] = 3221225472;
      v24[2] = __55__CFPrefsSearchListSource_alreadylocked_getDictionary___block_invoke;
      v24[3] = &unk_1ECDFF0F0;
      v24[4] = a1;
      if (Count >= 1)
      {
        do
        {
          v20 = (void *)*v11++;
          [v20 mergeIntoDictionary:Mutable sourceDictionary:v19 cloudKeyEvaluator:v24];
          --Count;
        }
        while (Count);
      }
      unint64_t v21 = *(void *)(a1 + 16);
      *(void *)(a1 + 16) = Mutable;
      v22 = *(const void **)(a1 + 64);
      *(void *)(a1 + 64) = v19;
      atomic_store(v17, (unint64_t *)(a1 + 32));
      CFTypeRef v16 = CFRetain(*(CFTypeRef *)(a1 + 16));
      if ([*(id *)(a1 + 24) approximateCount])
      {
        if (!(v21 | *(void *)(a1 + 16)))
        {
LABEL_24:
          if (v22) {
            CFRelease(v22);
          }
          goto LABEL_26;
        }
        objc_msgSend((id)a1, "deferredNotifyCausedByLoadingOfChangesFromDictionary:toDictionary:", v21);
      }
      if (v21) {
        CFRelease((CFTypeRef)v21);
      }
      goto LABEL_24;
    }
    CFDictionaryRef v12 = CFDictionaryCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, 0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    (*(void (**)(uint64_t, CFDictionaryRef))(a2 + 16))(a2, v12);
    CFRelease(v12);
  }
}

- (uint64_t)alreadylocked_generationCountFromListOfSources:(uint64_t)a3 count:
{
  uint64_t v11 = *(void *)off_1ECE0A5B0;
  if (result)
  {
    CFArrayRef v5 = (void *)result;
    char v10 = 0;
    result = generationCountFromListOfSources(a2, a3, &v10);
    if (v10)
    {
      CFIndex v6 = (void *)[v5 createRequestNewContentMessageForDaemon:2];
      char v7 = (void *)[v5 createRequestNewContentMessageForDaemon:1];
      uint64_t v8 = (void *)[v5 createRequestNewContentMessageForDaemon:3];
      v9[0] = off_1ECE0A5A0;
      v9[1] = 3221225472;
      v9[2] = __80__CFPrefsSearchListSource_alreadylocked_generationCountFromListOfSources_count___block_invoke;
      v9[3] = &unk_1ECDFF0A8;
      v9[4] = v5;
      -[CFPrefsSearchListSource synchronouslySendSystemMessage:andUserMessage:andDirectMessage:replyHandler:]((uint64_t)v5, (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9);
      if (v6) {
        xpc_release(v6);
      }
      if (v7) {
        xpc_release(v7);
      }
      if (v8) {
        xpc_release(v8);
      }
      return generationCountFromListOfSources(a2, a3, &v10);
    }
  }
  return result;
}

const void **__57__CFPrefsSearchListSource_alreadylocked_copyValueForKey___block_invoke(const void **result, CFDictionaryRef theDict)
{
  if (theDict)
  {
    CFArrayRef v2 = result;
    *(void *)(*((void *)result[4] + 1) + 24) = CFDictionaryGetValue(theDict, result[5]);
    result = *(const void ***)(*((void *)v2[4] + 1) + 24);
    if (result)
    {
      return (const void **)CFRetain(result);
    }
  }
  return result;
}

void __72__CFPrefsSearchListSource_addSourceForIdentifier_user_byHost_container___block_invoke(uint64_t a1, const void *a2)
{
}

- (void)addSourceForIdentifier:(const __CFString *)a3 user:(int)a4 byHost:(const __CFString *)a5 container:
{
  v6[5] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    v6[0] = off_1ECE0A5A0;
    v6[1] = 3221225472;
    v6[2] = __72__CFPrefsSearchListSource_addSourceForIdentifier_user_byHost_container___block_invoke;
    v6[3] = &unk_1ECDFEF18;
    v6[4] = a1;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v5, a2, a3, a4, a5, 0, (uint64_t)v6);
  }
}

- (void)addManagedSourceForIdentifier:(uint64_t)a3 user:
{
  void v4[5] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    v3 = *(const os_unfair_lock **)(a1 + 8);
    v4[0] = off_1ECE0A5A0;
    v4[1] = 3221225472;
    v4[2] = __62__CFPrefsSearchListSource_addManagedSourceForIdentifier_user___block_invoke;
    v4[3] = &unk_1ECDFEEF0;
    v4[4] = a1;
    -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](v3, a2, a3, (uint64_t)v4);
  }
}

- (CFStringRef)copyCloudConfigurationWithURL:(CFPrefsConfigurationFileSource *)a3 outConfigFileSource:(CFStringRef *)a4 outStoreName:
{
  CFStringRef v4 = a1;
  uint64_t v49 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return v4;
  }
  if (!eduModeEnabled()) {
    return 0;
  }
  if (a2)
  {
    CFURLRef v8 = (const __CFURL *)CFRetain(a2);
    if (v8) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
  uint64_t CacheStringForBundleID = _CFPrefsGetCacheStringForBundleID(@"kCFPreferencesAnyApplication");
  if (CacheStringForBundleID == _CFPrefsGetCacheStringForBundleID((__CFString *)v4[2].info)) {
    return 0;
  }
  CFStringRef ConfigurationFileNameFromIdentifier = _CFPrefsCreateConfigurationFileNameFromIdentifier((const __CFString *)v4[2].info);
  if (ConfigurationFileNameFromIdentifier)
  {
    CFStringRef v12 = ConfigurationFileNameFromIdentifier;
    v47 = a3;
    uint64_t v13 = CFCopySearchPathForDirectoriesInDomains(5, 8, 0);
    CFIndex Count = CFArrayGetCount(v13);
    if (Count < 1)
    {
      CFDataRef v9 = 0;
      CFURLRef v8 = 0;
    }
    else
    {
      CFIndex v15 = Count;
      v46 = a4;
      CFIndex v16 = 0;
      while (1)
      {
        CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v13, v16);
        CFURLRef v18 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)&__kCFAllocatorSystemDefault, ValueAtIndex, @"DefaultsConfigurations", 1u);
        CFURLRef v8 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)&__kCFAllocatorSystemDefault, v18, v12, 0);
        CFDataRef v19 = _CFDataCreateFromURL(v8, 0);
        if (v19) {
          break;
        }
        CFRelease(v8);
        CFRelease(v18);
        if (v15 == ++v16)
        {
          CFDataRef v9 = 0;
          CFURLRef v8 = 0;
          goto LABEL_18;
        }
      }
      CFDataRef v9 = v19;
LABEL_18:
      a4 = v46;
    }
    CFRelease(v13);
    CFRelease(v12);
    a3 = v47;
    if (v9) {
      goto LABEL_36;
    }
  }
  else
  {
    CFURLRef v8 = 0;
  }
  v20 = a4;
  info = (const void *)v4[2].info;
  v22 = (const void *)_CFPrefsGetCacheStringForBundleID(@"kCFPreferencesCurrentApplication");
  if (!CFEqual(info, v22))
  {
    if (_CFPrefsWritingToExternalAppCloudPreferencesEnabled())
    {
      if (v8) {
        CFRelease(v8);
      }
      CFURLRef v25 = _CFPrefsCopyCloudConfigurationURLForIdentifier((const void *)v4[2].info);
      goto LABEL_29;
    }
    if (v8)
    {
      CFRelease(v8);
      CFDataRef v9 = 0;
      CFURLRef v8 = 0;
    }
    else
    {
      CFDataRef v9 = 0;
    }
    a4 = v20;
LABEL_36:
    BOOL v48 = v8 == 0;
    if (v9) {
      goto LABEL_37;
    }
LABEL_65:
    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
    if (makeLogHandles_logToken != -1) {
      dispatch_once(&makeLogHandles_logToken, &__block_literal_global_167);
    }
    if (os_log_type_enabled((os_log_t)clientHandle, OS_LOG_TYPE_DEBUG)) {
      -[CFPrefsSearchListSource copyCloudConfigurationWithURL:outConfigFileSource:outStoreName:]((uint64_t)v4);
    }
    _CFSetTSD(0xFu, 0, 0);
    goto LABEL_70;
  }
  CFBundleRef MainBundle = CFBundleGetMainBundle();
  if (!MainBundle) {
    goto LABEL_30;
  }
  v24 = MainBundle;
  if (v8) {
    CFRelease(v8);
  }
  CFURLRef v25 = _CFPrefsCopyCloudConfigurationURLFromBundle(v24, (const __CFString *)v4[2].info);
LABEL_29:
  CFURLRef v8 = v25;
LABEL_30:
  a4 = v20;
  if (!v8)
  {
LABEL_31:
    BOOL v48 = 1;
    goto LABEL_65;
  }
LABEL_5:
  CFDataRef v9 = _CFDataCreateFromURL(v8, 0);
  BOOL v48 = 0;
  if (!v9) {
    goto LABEL_65;
  }
LABEL_37:
  v47 = a3;
  CFPropertyListRef v26 = CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, v9, 0, 0, 0);
  CFRelease(v9);
  if (!v26) {
    goto LABEL_65;
  }
  if (CFGetTypeID(v26) != 18)
  {
    CFRelease(v26);
    goto LABEL_65;
  }
  v46 = a4;
  _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
  if (makeLogHandles_logToken != -1) {
    dispatch_once(&makeLogHandles_logToken, &__block_literal_global_167);
  }
  if (os_log_type_enabled((os_log_t)clientHandle, OS_LOG_TYPE_DEBUG)) {
    -[CFPrefsSearchListSource copyCloudConfigurationWithURL:outConfigFileSource:outStoreName:]((uint64_t)v4);
  }
  _CFSetTSD(0xFu, 0, 0);
  CFIndex v27 = CFDictionaryGetCount((CFDictionaryRef)v26);
  v45[1] = v45;
  MEMORY[0x1F4188790](v27, v28);
  unint64_t v29 = (8 * v27 + 15) & 0xFFFFFFFFFFFFFFF0;
  v30 = (const void **)((char *)v45 - v29);
  if ((unint64_t)(8 * v27) >= 0x200) {
    size_t v31 = 512;
  }
  else {
    size_t v31 = 8 * v27;
  }
  bzero((char *)v45 - v29, v31);
  MEMORY[0x1F4188790](v32, v33);
  v34 = (CFDictionaryRef *)((char *)v45 - v29);
  bzero(v34, v31);
  CFDictionaryGetKeysAndValues((CFDictionaryRef)v26, v30, (const void **)v34);
  if (v27 < 1)
  {
    char v35 = 0;
  }
  else
  {
    char v35 = 0;
    do
    {
      if (CFGetTypeID(*v34) == 18)
      {
        if (CFDictionaryGetValue(*v34, @"NSUserDefaultsUbiquitous") != &__kCFBooleanFalse)
        {
          int HasSuffix = CFStringHasSuffix((CFStringRef)*v30, @"*");
          CFStringRef v37 = (const __CFString *)*v30;
          if (HasSuffix)
          {
            v50.length = CFStringGetLength((CFStringRef)*v30) - 1;
            v50.location = 0;
            CFStringRef v38 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, v37, v50);
            -[CFPrefsSearchListSource setCloudEnabled:forKeyPrefix:]((uint64_t)v4, 1, v38);
            CFRelease(v38);
          }
          else
          {
            -[CFPrefsSearchListSource setCloudEnabled:forKey:]((uint64_t)v4, 1, *v30);
          }
        }
        char v35 = 1;
      }
      ++v30;
      ++v34;
      --v27;
    }
    while (v27);
  }
  if (v47)
  {
    v39 = [[CFPrefsConfigurationFileSource alloc] initWithConfigurationPropertyList:v26 containingPreferences:v4->info];
    *v47 = v39;
  }
  if (v46)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v26, @"NSUserDefaultsCloudStoreIdentifier");
    if (!Value) {
      CFStringRef Value = (const __CFString *)v4[2].info;
    }
    CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, Value);
    CFStringRef *v46 = Copy;
  }
  CFRelease(v26);
  if ((v35 & 1) == 0) {
    goto LABEL_65;
  }
  CFURLRef v43 = CFURLCopyAbsoluteURL(v8);
  CFURLRef v44 = v43;
  if (!v43)
  {
LABEL_70:
    CFStringRef v4 = 0;
    goto LABEL_71;
  }
  CFStringRef v4 = CFURLCopyFileSystemPath(v43, kCFURLPOSIXPathStyle);
  CFRelease(v44);
LABEL_71:
  if (!v48) {
    CFRelease(v8);
  }
  return v4;
}

- (void)addPreferencesObserver:(uint64_t)a1
{
  if (a1 && a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    if (![*(id *)(a1 + 24) approximateCount]) {
      -[CFPrefsSearchListSource alreadylocked_getDictionary:](a1, (uint64_t)&__block_literal_global_32);
    }
    if (-[CFPrefsSource alreadylocked_addPreferencesObserver:](a1, a2)) {
      -[CFPrefsSearchListSource addPreferencesObserver:]();
    }
    if ([*(id *)(a1 + 24) approximateCount] == 1) {
      -[CFPrefsSearchListSource alreadylocked_setObservingContents:](a1, 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
  }
}

CFMutableDictionaryRef __55__CFPrefsSearchListSource_alreadylocked_copyDictionary__block_invoke(CFMutableDictionaryRef result, CFDictionaryRef theDict)
{
  if (theDict)
  {
    uint64_t v2 = (uint64_t)result;
    result = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, theDict);
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 40;
  if (a2)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v2 = 32;
    uint64_t v3 = 2;
  }
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + v2), v3);
}

uint64_t __93__CFPrefsSearchListSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke(uint64_t a1, size_t a2, id a3)
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  if (object_getClass(a3) != (Class)off_1ECE0A6B0)
  {
    char v8 = 0;
    CFURLRef ValueAtIndex = (os_unfair_lock_s *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 80), a2);
    os_unfair_lock_lock(ValueAtIndex + 13);
    [(os_unfair_lock_s *)ValueAtIndex handleReply:a3 toRequestNewDataMessage:xpc_array_get_value(*(xpc_object_t *)(a1 + 40), a2) onConnection:*(void *)(a1 + 48) retryCount:0 error:&v8];
    os_unfair_lock_unlock(ValueAtIndex + 13);
  }
  return 1;
}

- (id)createRequestNewContentMessageForDaemon:(int)a3
{
  uint64_t v23 = *(void *)off_1ECE0A5B0;
  sourceList = self->_sourceList;
  if (!sourceList) {
    return 0;
  }
  uint64_t v5 = *(void *)&a3;
  uint64_t Count = CFArrayGetCount(sourceList);
  MEMORY[0x1F4188790](Count, v7);
  char v8 = (const void **)((char *)&v20 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
  v24.location = 0;
  v24.length = Count;
  CFArrayGetValues(self->_sourceList, v24, v8);
  xpc_object_t v9 = xpc_null_create();
  MEMORY[0x1F4188790](v9, v10);
  uint64_t v11 = (xpc_object_t *)v8;
  if (Count < 1)
  {
    xpc_object_t v18 = 0;
  }
  else
  {
    unint64_t v21 = self;
    v22 = &v20;
    uint64_t v12 = 0;
    char v13 = 0;
    do
    {
      unint64_t v14 = (os_unfair_lock_s *)v8[v12];
      os_unfair_lock_lock(v14 + 13);
      uint64_t v15 = [(os_unfair_lock_s *)v14 createRequestNewContentMessageForDaemon:v5];
      if (v15) {
        xpc_object_t v16 = (xpc_object_t)v15;
      }
      else {
        xpc_object_t v16 = v9;
      }
      v8[v12] = v16;
      os_unfair_lock_unlock(v14 + 13);
      v13 |= v16 != v9;
      ++v12;
    }
    while (Count != v12);
    if (v13)
    {
      xpc_object_t v17 = xpc_array_create((xpc_object_t *)v8, Count);
      xpc_object_t v18 = -[CFPrefsSearchListSource createMultiMessageWithContainedMessages:]((uint64_t)v21, v17);
      xpc_release(v17);
      do
      {
        if (*v11 != v9) {
          xpc_release(*v11);
        }
        ++v11;
        --Count;
      }
      while (Count);
    }
    else
    {
      xpc_object_t v18 = 0;
    }
  }
  xpc_release(v9);
  return v18;
}

- (xpc_object_t)createMultiMessageWithContainedMessages:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "CFPreferencesOperation", 5);
  xpc_dictionary_set_value(v3, "CFPreferencesMessages", a2);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_lock(&self->super._lock);
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithIdentifier:self->_identifier containingPreferences:self->super._containingPreferences];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    CFIndex v6 = *(const void **)(v4 + 80);
    if (v6) {
      CFRelease(v6);
    }
    sourceList = self->_sourceList;
    if (sourceList) {
      MutableCFStringRef Copy = CFArrayCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, sourceList);
    }
    else {
      MutableCFStringRef Copy = 0;
    }
    v5[10] = MutableCopy;
    xpc_object_t v9 = (const void *)v5[3];
    if (v9) {
      CFRelease(v9);
    }
    observers = self->super._observers;
    if (observers) {
      observers = (__CFPrefsWeakObservers *)[(__CFPrefsWeakObservers *)observers mutableCopy];
    }
    v5[3] = observers;
    uint64_t v11 = (const void *)v5[11];
    if (v11) {
      CFRelease(v11);
    }
    cloudKeys = self->_cloudKeys;
    if (cloudKeys) {
      CFMutableSetRef v13 = CFSetCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, cloudKeys);
    }
    else {
      CFMutableSetRef v13 = 0;
    }
    v5[11] = v13;
    cloudPrefixKeys = self->_cloudPrefixKeys;
    if (cloudPrefixKeys) {
      v5[12] = CFArrayCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, cloudPrefixKeys);
    }
    v5[13] = self->_standardSetTarget;
    v5[14] = self->_cloudSetTarget;
    dict = self->super._dict;
    if (dict) {
      v5[2] = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, dict);
    }
    keysToSources = self->_keysToSources;
    if (keysToSources) {
      v5[8] = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, keysToSources);
    }
  }
  os_unfair_lock_unlock(&self->super._lock);
  return v5;
}

- (void)addSuiteSourceForIdentifier:(const __CFString *)a3 user:
{
  void v4[5] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 8);
    v4[0] = off_1ECE0A5A0;
    v4[1] = 3221225472;
    v4[2] = __60__CFPrefsSearchListSource_addSuiteSourceForIdentifier_user___block_invoke;
    v4[3] = &unk_1ECDFEF68;
    v4[4] = a1;
    -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:](v3, a2, a3, 1, (uint64_t)v4);
  }
}

void __60__CFPrefsSearchListSource_addSuiteSourceForIdentifier_user___block_invoke(uint64_t a1, const void *a2)
{
}

- (void)dealloc
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  sourceList = self->_sourceList;
  if (sourceList) {
    CFRelease(sourceList);
  }
  identifier = self->_identifier;
  if (identifier) {
    CFRelease(identifier);
  }
  cloudKeys = self->_cloudKeys;
  if (cloudKeys) {
    CFRelease(cloudKeys);
  }
  cloudPrefixKeys = self->_cloudPrefixKeys;
  if (cloudPrefixKeys) {
    CFRelease(cloudPrefixKeys);
  }
  keysToSources = self->_keysToSources;
  if (keysToSources) {
    CFRelease(keysToSources);
  }
  self->_identifier = 0;
  self->_sourceList = 0;
  v8.receiver = self;
  v8.super_class = (Class)CFPrefsSearchListSource;
  [(CFPrefsSource *)&v8 dealloc];
}

- (void)replaceSource:(const void *)a3 withSource:
{
  if (a1)
  {
    CFArrayRef v4 = *(const __CFArray **)(a1 + 80);
    if (v4)
    {
      if (!a2 || !a3 || *(unsigned char *)(a1 + 120)) {
        -[CFPrefsSearchListSource replaceSource:withSource:]();
      }
      v11.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 80));
      v11.location = 0;
      FirstIndexOfCFStringRef Value = CFArrayGetFirstIndexOfValue(v4, v11, a2);
      if (FirstIndexOfValue != -1)
      {
        CFIndex v8 = FirstIndexOfValue;
        uint64_t v9 = *(__CFArray **)(a1 + 80);
        CFArraySetValueAtIndex(v9, v8, a3);
      }
    }
  }
}

- (uint64_t)freeze
{
  if (result) {
    *(unsigned char *)(result + 120) = 1;
  }
  return result;
}

- (void)transitionIntoDirectModeIfNeededWithRetryBlock:(id)a3
{
}

- (void)alreadylocked_setObservingContents:(uint64_t)a1
{
  uint64_t v27 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 52));
    CFArrayRef v4 = *(const __CFArray **)(a1 + 80);
    if (v4)
    {
      CFIndex Count = CFArrayGetCount(v4);
      uint64_t v23 = 0;
      CFRange v24 = 0;
      v22 = 0;
      if (Count < 1)
      {
        BOOL v13 = 0;
        uint64_t v12 = 0;
      }
      else
      {
        for (CFIndex i = 0; i != Count; ++i)
        {
          CFURLRef ValueAtIndex = (os_unfair_lock_s *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 80), i);
          os_unfair_lock_lock(ValueAtIndex + 13);
          if (a2) {
            uint64_t v8 = -[CFPrefsSource alreadylocked_addPreferencesObserver:]((uint64_t)ValueAtIndex, a1);
          }
          else {
            uint64_t v8 = -[CFPrefsSource alreadylocked_removePreferencesObserver:]((uint64_t)ValueAtIndex, a1);
          }
          int v25 = 0;
          objects.opaque[0] = 0;
          uint64_t v9 = (void *)[(os_unfair_lock_s *)ValueAtIndex alreadylocked_createObserverUpdateMessageWithOperation:v8 forRole:&v25];
          objects.opaque[0] = (uint64_t)v9;
          if (v9)
          {
            if (v25 == 1) {
              uint64_t v10 = &v24;
            }
            else {
              uint64_t v10 = &v22;
            }
            if (v25 == 2) {
              CFRange v11 = &v23;
            }
            else {
              CFRange v11 = v10;
            }
            if (*v11) {
              xpc_array_append_value(*v11, v9);
            }
            else {
              xpc_object_t *v11 = xpc_array_create((xpc_object_t *)&objects, 1uLL);
            }
            xpc_release((xpc_object_t)objects.opaque[0]);
          }
        }
        uint64_t v12 = v24;
        BOOL v13 = Count > 0;
      }
    }
    else
    {
      BOOL v13 = 0;
      CFIndex Count = 0;
      uint64_t v12 = 0;
      v22 = 0;
      uint64_t v23 = 0;
    }
    unint64_t v14 = _os_activity_create(&dword_182B90000, "Updating Key-Value Observers Of Preferences", (os_activity_t)off_1ECE0A638, OS_ACTIVITY_FLAG_DEFAULT);
    objects.opaque[0] = 0;
    objects.opaque[1] = 0;
    os_activity_scope_enter(v14, &objects);
    if (v12)
    {
      xpc_object_t v15 = -[CFPrefsSearchListSource createMultiMessageWithContainedMessages:](a1, v12);
      xpc_release(v12);
    }
    else
    {
      xpc_object_t v15 = 0;
    }
    xpc_object_t v16 = v23;
    if (v23)
    {
      xpc_object_t v17 = -[CFPrefsSearchListSource createMultiMessageWithContainedMessages:](a1, v23);
      xpc_release(v16);
    }
    else
    {
      xpc_object_t v17 = 0;
    }
    xpc_object_t v18 = v22;
    if (v22)
    {
      xpc_object_t v19 = -[CFPrefsSearchListSource createMultiMessageWithContainedMessages:](a1, v22);
      xpc_release(v18);
    }
    else
    {
      xpc_object_t v19 = 0;
    }
    -[CFPrefsSearchListSource synchronouslySendSystemMessage:andUserMessage:andDirectMessage:replyHandler:](a1, (uint64_t)v17, (uint64_t)v15, (uint64_t)v19, 0);
    if (v17) {
      xpc_release(v17);
    }
    if (v15) {
      xpc_release(v15);
    }
    if (v19) {
      xpc_release(v19);
    }

    if (v13)
    {
      CFIndex v20 = 0;
      do
      {
        unint64_t v21 = (os_unfair_lock_s *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 80), v20);
        os_unfair_lock_unlock(v21 + 13);
        ++v20;
      }
      while (Count != v20);
    }
    os_activity_scope_leave(&objects);
  }
}

- (uint64_t)synchronouslySendSystemMessage:(uint64_t)a3 andUserMessage:(uint64_t)a4 andDirectMessage:(uint64_t)a5 replyHandler:
{
  v15[6] = *(void *)off_1ECE0A5B0;
  if (result)
  {
    uint64_t v6 = result;
    v15[0] = off_1ECE0A5A0;
    v15[1] = 3221225472;
    v15[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke;
    v15[3] = &unk_1ECDFF008;
    v15[4] = result;
    v15[5] = a5;
    if (a2 && a3)
    {
      uint64_t v7 = *(const os_unfair_lock **)(result + 8);
      v14[0] = off_1ECE0A5A0;
      v14[1] = 3221225472;
      v14[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_3;
      v14[3] = &unk_1ECDFF058;
      v14[5] = a3;
      v14[6] = v15;
      v14[4] = a2;
      result = CFPREFERENCES_IS_WAITING_FOR_SYSTEM_AND_USER_CFPREFSDS(v7, (uint64_t)v14);
    }
    else if (a2)
    {
      uint64_t v8 = *(const os_unfair_lock **)(result + 8);
      v13[0] = off_1ECE0A5A0;
      v13[1] = 3221225472;
      v13[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_5;
      v13[3] = &unk_1ECDFF080;
      v13[4] = a2;
      v13[5] = v15;
      result = CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(v8, (uint64_t)v13);
    }
    else if (a3)
    {
      uint64_t v9 = *(const os_unfair_lock **)(result + 8);
      v12[0] = off_1ECE0A5A0;
      v12[1] = 3221225472;
      v12[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_6;
      v12[3] = &unk_1ECDFF080;
      v12[4] = a3;
      v12[5] = v15;
      result = CFPREFERENCES_IS_WAITING_FOR_USER_CFPREFSD(v9, (uint64_t)v12);
    }
    if (a4)
    {
      uint64_t v10 = *(const os_unfair_lock **)(v6 + 8);
      v11[0] = off_1ECE0A5A0;
      v11[1] = 3221225472;
      v11[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_7;
      v11[3] = &unk_1ECDFF080;
      v11[4] = a4;
      v11[5] = v15;
      return CFPREFERENCES_IS_WAITING_FOR_DIRECT_CFPREFSD(v10, (uint64_t)v11);
    }
  }
  return result;
}

void __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  v1[0] = off_1ECE0A5A0;
  v1[1] = 3221225472;
  v1[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_4;
  v1[3] = &unk_1ECDFF030;
  uint64_t v3 = *(void *)(a1 + 48);
  long long v2 = *(_OWORD *)(a1 + 32);
  dispatch_apply(2uLL, 0, v1);
}

- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6
{
  v86 = a3;
  v94[1] = *(void *)off_1ECE0A5B0;
  p_standardSetTarget = &self->_standardSetTarget;
  if (*(_OWORD *)&self->_standardSetTarget == 0) {
    -[CFPrefsSearchListSource alreadylocked_setPrecopiedValues:forKeys:count:from:]();
  }
  uint64_t v93 = 16;
  if (!self->super._dict) {
    -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)&__block_literal_global_32);
  }
  if (!self->_keysToSources) {
    -[CFPrefsSearchListSource alreadylocked_setPrecopiedValues:forKeys:count:from:]();
  }
  MEMORY[0x1F4188790](self, a2);
  v87 = (char *)&v82 - ((a5 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v87, a5);
  if (*(_OWORD *)&self->_cloudKeys == 0)
  {
    int v45 = 0;
  }
  else
  {
    if (a5 < 1)
    {
      char v11 = 0;
    }
    else
    {
      char v11 = 0;
      uint64_t v12 = a4;
      BOOL v13 = v87;
      int64_t v14 = a5;
      do
      {
        CFStringRef v15 = *v12++;
        uint64_t v9 = -[CFPrefsSearchListSource alreadylocked_useCloudForKey:]((uint64_t)self, v15);
        *v13++ = v9;
        if (v9) {
          char v11 = 1;
        }
        --v14;
      }
      while (v14);
    }
    int v45 = v11 & 1;
  }
  MEMORY[0x1F4188790](v9, v10);
  v91 = (char *)&v82 - ((a5 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v91, a5);
  sourceList = self->_sourceList;
  v95.length = CFArrayGetCount(sourceList);
  v95.location = 0;
  FirstIndexOfCFStringRef Value = CFArrayGetFirstIndexOfValue(sourceList, v95, *p_standardSetTarget);
  uint64_t v92 = 80;
  LODWORD(v83) = v45;
  if (v45)
  {
    xpc_object_t v17 = self->_sourceList;
    v96.length = CFArrayGetCount(v17);
    v96.location = 0;
    CFIndex v89 = CFArrayGetFirstIndexOfValue(v17, v96, self->_cloudSetTarget);
  }
  else
  {
    CFIndex v89 = -1;
  }
  int64_t v82 = a5;
  if (a5 < 1)
  {
    char v19 = 0;
  }
  else
  {
    int64_t v18 = a5;
    char v19 = 0;
    CFIndex v20 = (const void **)a4;
    unint64_t v21 = (BOOL *)v91;
    v22 = v87;
    do
    {
      CFStringRef Value = CFDictionaryGetValue(self->_keysToSources, *v20);
      BOOL v24 = 1;
      *unint64_t v21 = 1;
      if (Value)
      {
        int v25 = Value;
        CFArrayRef v26 = *(Class *)((char *)&self->super.super.isa + v92);
        v97.length = CFArrayGetCount(v26);
        v97.location = 0;
        CFIndex v27 = CFArrayGetFirstIndexOfValue(v26, v97, v25);
        if (v27 == -1)
        {
          BOOL v24 = 1;
        }
        else
        {
          CFIndex v28 = FirstIndexOfValue;
          if (*v22) {
            CFIndex v28 = v89;
          }
          BOOL v24 = v27 >= v28;
        }
        *unint64_t v21 = v24;
      }
      v19 |= v24;
      ++v22;
      ++v21;
      ++v20;
      --v18;
    }
    while (v18);
  }
  unint64_t v29 = [(__CFPrefsWeakObservers *)self->super._observers approximateCount];
  CFMutableDictionaryRef Mutable = 0;
  uint64_t v30 = *(uint64_t *)((char *)&self->super.super.isa + v93);
  unint64_t v84 = v29;
  if (v30) {
    BOOL v31 = v29 == 0;
  }
  else {
    BOOL v31 = 1;
  }
  if (v31)
  {
    int64_t v32 = v82;
    if (!v83) {
      goto LABEL_51;
    }
  }
  else
  {
    int64_t v32 = v82;
    int v33 = (int)v83;
    if (v19)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v32 >= 1)
      {
        int64_t v34 = v32;
        char v35 = (const void **)a4;
        v36 = v91;
        do
        {
          CFStringRef v37 = CFDictionaryGetValue(*(CFDictionaryRef *)((char *)&self->super.super.isa + v93), *v35);
          if (v37 && *v36) {
            CFDictionarySetValue(Mutable, *v35, v37);
          }
          ++v36;
          ++v35;
          --v34;
        }
        while (v34);
      }
    }
    if (!v33) {
      goto LABEL_51;
    }
  }
  if ([(CFPrefsCloudSource *)self->_cloudSetTarget enabled])
  {
    if ((((unint64_t)v32 >> 59) & 0xF) != 0)
    {
      CFStringRef v79 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", 2 * v32);
      v80 = +[NSException exceptionWithName:@"NSGenericException" reason:v79 userInfo:0];
      CFRelease(v79);
      objc_exception_throw(v80);
    }
    if (v32) {
      uint64_t v39 = 2 * v32;
    }
    else {
      uint64_t v39 = 1;
    }
    unint64_t v40 = MEMORY[0x1F4188790](v39, v38);
    v42 = (char *)&v82 - v41;
    v94[0] = 0;
    if (v43 >= 0x101)
    {
      v42 = (char *)_CFCreateArrayStorage(v40, 0, v94);
      CFURLRef v44 = v42;
    }
    else
    {
      CFURLRef v44 = 0;
    }
    v46 = &v42[8 * v32];
    if (v32 < 1)
    {
      unint64_t v47 = 0;
    }
    else
    {
      unint64_t v47 = 0;
      uint64_t v49 = v86;
      BOOL v48 = (unsigned __int8 *)v87;
      CFRange v50 = a4;
      int64_t v51 = v32;
      do
      {
        if (*v48++)
        {
          *(void *)&v42[8 * v47] = *v50;
          *(void *)&v46[8 * v47++] = *v49;
        }
        ++v49;
        ++v50;
        --v51;
      }
      while (v51);
    }
    -[CFPrefsSource setValues:forKeys:count:copyValues:from:]((os_unfair_lock_s *)self->_cloudSetTarget, (uint64_t)&v42[8 * v32], (uint64_t)v42, v47, 0, (uint64_t)self);
    if (v32 < 1)
    {
      unint64_t v53 = 0;
    }
    else
    {
      unint64_t v53 = 0;
      v55 = v86;
      v54 = (unsigned __int8 *)v87;
      int64_t v56 = v32;
      v57 = a4;
      do
      {
        if (!*v54++)
        {
          *(void *)&v42[8 * v53] = *v57;
          *(void *)&v46[8 * v53++] = *v55;
        }
        ++v55;
        ++v57;
        --v56;
      }
      while (v56);
    }
    -[CFPrefsSource setValues:forKeys:count:copyValues:from:]((os_unfair_lock_s *)*p_standardSetTarget, (uint64_t)&v42[8 * v32], (uint64_t)v42, v53, 0, (uint64_t)self);
    free(v44);
    if ((v19 & 1) == 0) {
      return;
    }
    goto LABEL_69;
  }
LABEL_51:
  -[CFPrefsSource setValues:forKeys:count:copyValues:from:]((os_unfair_lock_s *)*p_standardSetTarget, (uint64_t)v86, (uint64_t)a4, v32, 0, (uint64_t)self);
  if ((v19 & 1) == 0) {
    return;
  }
LABEL_69:
  if (v32 >= 1)
  {
    for (uint64_t i = 0; i != v32; ++i)
    {
      if (v91[i])
      {
        CFStringRef v60 = a4[i];
        if (v60)
        {
          v61 = v86[i];
          if (v61)
          {
            CFDictionarySetValue(*(CFMutableDictionaryRef *)((char *)&self->super.super.isa + v93), v60, v61);
            p_cloudSetTarget = (CFPrefsCloudSource **)p_standardSetTarget;
            if (v87[i]) {
              p_cloudSetTarget = &self->_cloudSetTarget;
            }
            CFDictionarySetValue(self->_keysToSources, a4[i], *p_cloudSetTarget);
          }
          else
          {
            CFArrayRef v63 = *(Class *)((char *)&self->super.super.isa + v92);
            if (v63)
            {
              CFIndex Count = CFArrayGetCount(v63);
              v83 = &v82;
              uint64_t v66 = MEMORY[0x1F4188790](Count, v65);
              v68 = (const void **)((char *)&v82 - v67);
              if (v66 >= 1)
              {
                v98.location = 0;
                v98.length = Count;
                CFArrayGetValues(*(CFArrayRef *)((char *)&self->super.super.isa + v92), v98, v68);
              }
            }
            else
            {
              v83 = &v82;
              MEMORY[0x1F4188790](0, v60);
              v68 = (const void **)&v81;
              CFIndex Count = 0;
            }
            CFIndex v69 = FirstIndexOfValue;
            if (v87[i]) {
              CFIndex v69 = v89;
            }
            if (v69 + 1 < Count)
            {
              v70 = (id *)&v68[v69 + 1];
              CFIndex v71 = ~v69 + Count;
              while (1)
              {
                v72 = &a4[i];
                v73 = (const void *)[*v70 copyValueForKey:*v72];
                v74 = *(Class *)((char *)&self->super.super.isa + v93);
                CFStringRef v75 = *v72;
                if (v73) {
                  break;
                }
                CFDictionaryRemoveValue(v74, v75);
                CFDictionaryRemoveValue(self->_keysToSources, a4[i]);
                ++v70;
                if (!--v71) {
                  goto LABEL_89;
                }
              }
              CFDictionarySetValue(v74, v75, v73);
              CFDictionarySetValue(self->_keysToSources, a4[i], *v70);
              CFRelease(v73);
            }
          }
LABEL_89:
          if (v84)
          {
            v76 = (const void **)&a4[i];
            v77 = *v76;
            v78 = CFDictionaryGetValue(Mutable, *v76);
            [(CFPrefsSearchListSource *)self deferredNotifyCausedByLocalWriteOfChangesToKey:v77 fromValue:v78 toValue:CFDictionaryGetValue(*(CFDictionaryRef *)((char *)&self->super.super.isa + v93), *v76)];
          }
        }
      }
    }
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

- (void)handleChangeNotificationForDomainIdentifier:(__CFString *)a3 isRemote:(BOOL)a4
{
  uint64_t v20 = *(void *)off_1ECE0A5B0;
  if (self->_sourceList)
  {
    BOOL v4 = a4;
    if (CFEqual(a3, @"Volatile"))
    {
      [(CFPrefsSearchListSource *)self generationCount];
    }
    else if (!v4 || (identifier = self->_identifier, identifier == a3) || CFEqual(identifier, a3))
    {
      sourceList = self->_sourceList;
      if (sourceList)
      {
        CFIndex Count = CFArrayGetCount(sourceList);
        uint64_t v11 = MEMORY[0x1F4188790](Count, v10);
        unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
        int64_t v14 = (uint64_t *)&v17[-v13];
        if (v11 >= 1)
        {
          v22.location = 0;
          v22.length = Count;
          CFArrayGetValues(self->_sourceList, v22, (const void **)&v17[-v13]);
        }
      }
      else
      {
        CFIndex Count = 0;
        int64_t v14 = (uint64_t *)&v19;
      }
      char v18 = 0;
      uint64_t v15 = generationCountFromListOfSources(v14, Count, &v18);
      if (v18 || !v4 && (unint64_t v16 = atomic_load((unint64_t *)&self->super._generationCount), v15 != v16)) {
        [(CFPrefsSearchListSource *)self generationCount];
      }
    }
  }
}

- (__CFString)domainIdentifier
{
  return self->_identifier;
}

- (int64_t)generationCount
{
  if (!self->_sourceList) {
    return 0;
  }
  os_unfair_lock_lock(&self->super._lock);
  -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)&__block_literal_global_32);
  os_unfair_lock_unlock(&self->super._lock);
  return atomic_load((unint64_t *)&self->super._generationCount);
}

- (void)addNamedVolatileSourceForIdentifier:(uint64_t)a1
{
  v3[5] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 8);
    v3[0] = off_1ECE0A5A0;
    v3[1] = 3221225472;
    v3[2] = __63__CFPrefsSearchListSource_addNamedVolatileSourceForIdentifier___block_invoke;
    v3[3] = &unk_1ECDFEF18;
    v3[4] = a1;
    -[_CFXPreferences withNamedVolatileSourceForIdentifier:perform:](v2, a2, (uint64_t)v3);
  }
}

void __63__CFPrefsSearchListSource_addNamedVolatileSourceForIdentifier___block_invoke(uint64_t a1, const void *a2)
{
}

uint64_t __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 3);
}

- (void)setCloudEnabled:(const void *)a3 forKeyPrefix:
{
  if (!a1) {
    return;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
  CFMutableDictionaryRef Mutable = *(__CFArray **)(a1 + 96);
  if (a2)
  {
    if (!Mutable)
    {
      CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
      *(void *)(a1 + 96) = Mutable;
    }
    CFArrayAppendValue(Mutable, a3);
    goto LABEL_6;
  }
  if (Mutable)
  {
    v9.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 96));
    v9.location = 0;
    FirstIndexOfCFStringRef Value = CFArrayGetFirstIndexOfValue(Mutable, v9, a3);
    if (FirstIndexOfValue != -1)
    {
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 96), FirstIndexOfValue);
      if (!CFArrayGetCount(*(CFArrayRef *)(a1 + 96))) {
LABEL_6:
      }
        [*(id *)(a1 + 112) setEnabled:a2];
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
}

- (void)setCloudEnabled:(const void *)a3 forKey:
{
  if (!a1) {
    return;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
  CFMutableDictionaryRef Mutable = *(__CFSet **)(a1 + 88);
  if (a2)
  {
    if (!Mutable)
    {
      CFMutableDictionaryRef Mutable = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFCopyStringSetCallBacks);
      *(void *)(a1 + 88) = Mutable;
    }
    CFSetAddValue(Mutable, a3);
    goto LABEL_6;
  }
  if (Mutable)
  {
    CFSetRemoveValue(Mutable, a3);
    if (!CFSetGetCount(*(CFSetRef *)(a1 + 88))) {
LABEL_6:
    }
      [*(id *)(a1 + 112) setEnabled:a2];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
}

- (void)alreadylocked_reloadCacheIfStale
{
  if (a1) {
    -[CFPrefsSearchListSource alreadylocked_getDictionary:](a1, (uint64_t)&__block_literal_global_32);
  }
}

- (void)removePreferencesObserver:(uint64_t)a1
{
  if (a1 && a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    if (-[CFPrefsSource alreadylocked_removePreferencesObserver:](a1, a2)) {
      -[CFPrefsSearchListSource removePreferencesObserver:]();
    }
    if (![*(id *)(a1 + 24) approximateCount]) {
      -[CFPrefsSearchListSource alreadylocked_setObservingContents:](a1, 0);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
  }
}

- (BOOL)isDirectModeEnabled
{
  return [(CFPrefsPlistSource *)self->_standardSetTarget isDirectModeEnabled];
}

- (void)addCloudSourceForIdentifier:(uint64_t)a3 configurationPath:(uint64_t)a4 storeName:(const __CFString *)a5 container:
{
  v6[7] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    v6[0] = off_1ECE0A5A0;
    v6[1] = 3221225472;
    v6[2] = __93__CFPrefsSearchListSource_addCloudSourceForIdentifier_configurationPath_storeName_container___block_invoke;
    v6[3] = &unk_1ECDFEF40;
    v6[5] = a3;
    void v6[6] = a4;
    v6[4] = a1;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v5, a2, @"kCFPreferencesCurrentUser", 0, a5, 1, (uint64_t)v6);
  }
}

void __93__CFPrefsSearchListSource_addCloudSourceForIdentifier_configurationPath_storeName_container___block_invoke(void *a1, void *a2)
{
  [a2 setConfigurationPath:a1[5]];
  [a2 setStoreName:a1[6]];
  uint64_t v4 = a1[4];

  -[CFPrefsSearchListSource addSource:](v4, a2);
}

- (uint64_t)alreadylocked_useCloudForKey:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    CFSetRef v4 = *(const __CFSet **)(result + 88);
    if (v4 && CFSetContainsValue(v4, value))
    {
      return 1;
    }
    else
    {
      result = *(void *)(v3 + 96);
      if (result)
      {
        CFIndex Count = CFArrayGetCount((CFArrayRef)result);
        CFIndex v6 = Count - 1;
        if (Count < 1)
        {
          return 0;
        }
        else
        {
          CFIndex v7 = 0;
          do
          {
            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 96), v7);
            int HasPrefix = CFStringHasPrefix(value, ValueAtIndex);
            BOOL v10 = HasPrefix == 0;
            result = HasPrefix != 0;
            BOOL v10 = !v10 || v6 == v7++;
          }
          while (!v10);
        }
      }
    }
  }
  return result;
}

- (uint64_t)alreadylocked_hasCloudValueForKey:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 80))
    {
      result = -[CFPrefsSearchListSource alreadylocked_useCloudForKey:](result, a2);
      if (result)
      {
        result = [*(id *)(v2 + 112) copyValueForKey:a2];
        if (result)
        {
          CFRelease((CFTypeRef)result);
          return 1;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)alreadylocked_hasNonRegisteredValueForKey:(uint64_t)a1
{
  v18[1] = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  CFArrayRef v3 = *(const __CFArray **)(a1 + 80);
  if (!v3) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(v3);
  if (Count < 1) {
    return 0;
  }
  CFIndex v7 = Count;
  MEMORY[0x1F4188790](Count, v6);
  CFRange v9 = (const void **)((char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19.location = 0;
  v19.length = v7;
  CFArrayGetValues(*(CFArrayRef *)(a1 + 80), v19, v9);
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = -2;
  }
  else {
    uint64_t v10 = -1;
  }
  uint64_t v11 = v10 + v7;
  if (v10 + v7 < 1) {
    return 0;
  }
  uint64_t v12 = (const void *)[(id)*v9 copyValueForKey:a2];
  if (!v12)
  {
    uint64_t v14 = 0;
    uint64_t v15 = v9 + 1;
    uint64_t v16 = v10 + v7 - 1;
    while (v16 != v14)
    {
      uint64_t v12 = (const void *)[(id)v15[v14++] copyValueForKey:a2];
      if (v12)
      {
        BOOL v13 = v11 > v14;
        goto LABEL_15;
      }
    }
    return 0;
  }
  BOOL v13 = 1;
LABEL_15:
  CFRelease(v12);
  return v13;
}

- (void)fullCloudSynchronizeWithCompletionHandler:(id)a3
{
  cloudSetTarget = self->_cloudSetTarget;
  if (cloudSetTarget) {
    [(CFPrefsCloudSource *)cloudSetTarget fullCloudSynchronizeWithCompletionHandler:a3];
  }
  else {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (__CFArray)alreadylocked_copyKeyList
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  if (self->_sourceList)
  {
    uint64_t v5 = 0;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x2020000000;
    uint64_t v8 = 0;
    v4[0] = off_1ECE0A5A0;
    v4[1] = 3221225472;
    v4[2] = __52__CFPrefsSearchListSource_alreadylocked_copyKeyList__block_invoke;
    v4[3] = &unk_1ECDFEFB8;
    v4[4] = &v5;
    -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)v4);
    CFMutableDictionaryRef Mutable = (__CFArray *)v6[3];
    if (!Mutable) {
      CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
    }
    _Block_object_dispose(&v5, 8);
    return Mutable;
  }
  else
  {
    return CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
  }
}

void __52__CFPrefsSearchListSource_alreadylocked_copyKeyList__block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  v13[1] = *(void *)off_1ECE0A5B0;
  if (theDict)
  {
    unint64_t Count = CFDictionaryGetCount(theDict);
    unint64_t v6 = Count;
    if (Count >> 60)
    {
      CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", Count);
      uint64_t v12 = +[NSException exceptionWithName:@"NSGenericException" reason:v11 userInfo:0];
      CFRelease(v11);
      objc_exception_throw(v12);
    }
    if (Count <= 1) {
      unint64_t Count = 1;
    }
    unint64_t v7 = MEMORY[0x1F4188790](Count, v5);
    uint64_t v9 = (const void **)((char *)v13 - v8);
    v13[0] = 0;
    if (v6 >= 0x101)
    {
      uint64_t v9 = (const void **)_CFCreateArrayStorage(v7, 0, v13);
      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v10 = 0;
    }
    CFDictionaryGetKeysAndValues(theDict, v9, 0);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v9, v6, &kCFTypeArrayCallBacks);
    free(v10);
  }
}

uint64_t __55__CFPrefsSearchListSource_alreadylocked_getDictionary___block_invoke(uint64_t a1, const __CFString *a2)
{
  return -[CFPrefsSearchListSource alreadylocked_useCloudForKey:](*(void *)(a1 + 32), a2);
}

- (uint64_t)alreadylocked_copyManagedValueForKey:
{
  return 0;
}

- (CFMutableDictionaryRef)alreadylocked_copyManagedDictionary
{
  if (!a1) {
    return 0;
  }
  CFArrayRef v1 = (const __CFArray *)objc_msgSend(a1, "alreadylocked_copyKeyList");
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFIndex Count = CFArrayGetCount(v1);
  if (Count >= 1)
  {
    CFIndex v4 = Count;
    for (CFIndex i = 0; i != v4; ++i)
      CFArrayGetValueAtIndex(v1, i);
  }
  CFRelease(v1);
  return Mutable;
}

- (void)removeSource:(uint64_t)a1
{
  if (a1)
  {
    if (a2)
    {
      CFArrayRef v4 = *(const __CFArray **)(a1 + 80);
      if (v4)
      {
        if (*(unsigned char *)(a1 + 120)) {
          -[CFPrefsSearchListSource removeSource:]();
        }
        v6.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 80));
        v6.location = 0;
        FirstIndexOfCFStringRef Value = CFArrayGetFirstIndexOfValue(v4, v6, a2);
        if (FirstIndexOfValue != -1) {
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 80), FirstIndexOfValue);
        }
        if (*(const void **)(a1 + 104) == a2) {
          *(void *)(a1 + 104) = 0;
        }
        if (*(const void **)(a1 + 112) == a2) {
          *(void *)(a1 + 112) = 0;
        }
        atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 32));
      }
    }
  }
}

- (id)description
{
  uint64_t v24 = *(void *)off_1ECE0A5B0;
  CFMutableDictionaryRef Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  os_unfair_lock_lock(&self->super._lock);
  sourceList = self->_sourceList;
  if (sourceList && (CFIndex Count = CFArrayGetCount(sourceList), Count >= 1))
  {
    CFIndex v7 = Count;
    MEMORY[0x1F4188790](Count, v6);
    uint64_t v9 = (const void **)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    v25.location = 0;
    v25.length = v7;
    CFArrayGetValues(self->_sourceList, v25, v9);
    v23.receiver = self;
    v23.super_class = (Class)CFPrefsSearchListSource;
    CFStringRef v10 = [(CFPrefsSource *)&v23 description];
    CFStringAppend(Mutable, v10);
    CFStringAppend(Mutable, @"Sources: [\n");
    do
    {
      CFStringRef v11 = (void *)_CFAutoreleasePoolPush();
      CFStringAppend(Mutable, @"    ");
      uint64_t v12 = (void *)*v9++;
      CFStringAppend(Mutable, (CFStringRef)[v12 description]);
      CFStringAppend(Mutable, @"\n");
      _CFAutoreleasePoolPop(v11);
      --v7;
    }
    while (v7);
    CFStringAppend(Mutable, @"]\n");
  }
  else
  {
    CFStringAppend(Mutable, @"Sources: []\n");
  }
  CFStringAppend(Mutable, @"Cloud Keys: [");
  CFSetRef cloudKeys = self->_cloudKeys;
  if (cloudKeys)
  {
    CFSetRef cloudKeys = (const __CFSet *)CFSetGetCount(cloudKeys);
    uint64_t v15 = (uint64_t)cloudKeys;
  }
  else
  {
    uint64_t v15 = 0;
  }
  MEMORY[0x1F4188790](cloudKeys, v13);
  char v18 = (const void **)((char *)&v22 - v17);
  if (v16 >= 0x200) {
    size_t v19 = 512;
  }
  else {
    size_t v19 = v16;
  }
  bzero((char *)&v22 - v17, v19);
  if (v15 >= 1)
  {
    CFSetGetValues(self->_cloudKeys, v18);
    do
    {
      CFStringRef v20 = (const __CFString *)*v18++;
      CFStringAppend(Mutable, v20);
      CFStringAppend(Mutable, @", ");
      --v15;
    }
    while (v15);
  }
  CFStringAppend(Mutable, @"]\n");
  os_unfair_lock_unlock(&self->super._lock);
  return (id)CFAutorelease(Mutable);
}

- (__CFString)copyOSLogDescription
{
  ClassName = object_getClassName(self);
  return (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%s<%p> (Domain: %@, Container: %@)", ClassName, self, [(CFPrefsSearchListSource *)self domainIdentifier], [(CFPrefsPlistSource *)self->_standardSetTarget container]);
}

- (void)copyCloudConfigurationWithURL:(uint64_t)a1 outConfigFileSource:outStoreName:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 72);
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_0_17(&dword_182B90000, v1, v2, "No defaults configuration file found for %{public}@ (looked at %{public}@)", (void)v3, DWORD2(v3));
}

- (void)copyCloudConfigurationWithURL:(uint64_t)a1 outConfigFileSource:outStoreName:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 72);
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_0_17(&dword_182B90000, v1, v2, "Found defaults configuration for %{public}@ at %{public}@", (void)v3, DWORD2(v3));
}

- (void)addPreferencesObserver:.cold.1()
{
  __assert_rtn("-[CFPrefsSearchListSource addPreferencesObserver:]", "CFPrefsSearchListSource.m", 522, "CFPreferencesInvalidOperation == [self alreadylocked_addPreferencesObserver:obs]");
}

- (void)removePreferencesObserver:.cold.1()
{
  __assert_rtn("-[CFPrefsSearchListSource removePreferencesObserver:]", "CFPrefsSearchListSource.m", 534, "CFPreferencesInvalidOperation == [self alreadylocked_removePreferencesObserver:obs]");
}

- (void)alreadylocked_copyValueForKey:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_0_17(&dword_182B90000, v1, v2, "found no value for key %{public}@ in %{public}@", (void)v3, DWORD2(v3));
}

- (void)alreadylocked_setPrecopiedValues:forKeys:count:from:.cold.1()
{
}

- (void)alreadylocked_setPrecopiedValues:forKeys:count:from:.cold.2()
{
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.1()
{
  __assert_rtn("-[CFPrefsSearchListSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:]", "CFPrefsSearchListSource.m", 897, "count == xpc_array_get_count(replyList)");
}

- (void)_getPendingNotifications
{
}

- (void)removeSource:.cold.1()
{
}

- (void)replaceSource:withSource:.cold.1()
{
}

@end