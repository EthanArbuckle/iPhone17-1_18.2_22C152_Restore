@interface CFPrefsPlistSource
- (BOOL)_logLoudlyAboutSettingKey:(BOOL)result;
- (BOOL)_shouldEnableDirectMode;
- (BOOL)attachAccessTokenToMessage:(int)a3 accessType:;
- (BOOL)isByHost;
- (BOOL)isDirectModeEnabled;
- (BOOL)isVolatile;
- (BOOL)servedByUserSessionDaemon;
- (BOOL)synchronize;
- (CFPrefsPlistSource)initWithDomain:(__CFString *)a3 user:(__CFString *)a4 byHost:(BOOL)a5 containerPath:(__CFString *)a6 containingPreferences:(id)a7;
- (__CFArray)alreadylocked_copyKeyList;
- (__CFDictionary)alreadylocked_copyDictionary;
- (__CFString)container;
- (__CFString)domainIdentifier;
- (__CFString)userIdentifier;
- (id)alreadylocked_createObserverUpdateMessageWithOperation:(int)a3 forRole:(int *)a4;
- (id)createRequestNewContentMessageForDaemon:(int)a3;
- (id)createSynchronizeMessage;
- (int)alreadylocked_updateObservingRemoteChanges;
- (int64_t)alreadylocked_generationCount;
- (int64_t)generationCount;
- (uint64_t)alreadylocked_requestNewData;
- (uint64_t)handleErrorReply:(void *)a3 toMessage:(const void *)a4 settingKeys:(const void *)a5 toValues:(CFIndex)a6 count:(int)a7 retryCount:(uint64_t)a8 retryContinuation:;
- (uint64_t)handleErrorReply:(void *)a3 toMessage:(int)a4 retryCount:(uint64_t)a5 retryContinuation:;
- (uint64_t)sendMessageSettingValues:(__objc2_class *)a3 forKeys:(uint64_t)a4 count:;
- (uint64_t)volatilizeIfInvalidHomeDir;
- (void)_sharedCleanup;
- (void)addPIDImpersonationIfNecessary:(void *)a1;
- (void)alreadylocked_clearCache;
- (void)alreadylocked_copyValueForKey:(__CFString *)a3;
- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6;
- (void)copyValueForKey:(__CFString *)a3;
- (void)createSynchronizeMessage;
- (void)dealloc;
- (void)goReadOnlyAfterTryingToWriteKeys:(__CFString *)a3 values:(uint64_t)a4 count:;
- (void)goVolatileAfterTryingToWriteKeys:(__CFString *)a3 values:(uint64_t)a4 count:;
- (void)handlePossibleOversizedMessage:(const void *)a3 forWritingKeys:(const void *)a4 values:(CFIndex)a5 count:;
- (void)handleReply:(id)a3 toRequestNewDataMessage:(id)a4 onConnection:(id)a5 retryCount:(int)a6 error:(BOOL *)a7;
- (void)requestPlistValidation;
- (void)sendFullyPreparedMessage:(xpc_connection_t)connection toConnection:(uint64_t)a4 settingValues:(uint64_t)a5 forKeys:(uint64_t)a6 count:(int)a7 retryCount:;
- (void)sendRequestNewDataMessage:(uint64_t)a3 toConnection:(uint64_t)a4 retryCount:(BOOL *)a5 error:;
- (void)setAccessRestricted:(BOOL)a3;
- (void)setBackupDisabled:(BOOL)a3;
- (void)setContainer:(uint64_t)a1;
- (void)setDaemonCacheEnabled:(BOOL)a3;
- (void)setDomainIdentifier:(uint64_t)a1;
- (void)setFileProtectionClass:(int)a3;
- (void)setUserIdentifier:(uint64_t)a1;
- (void)transitionIntoDirectModeIfNeededWithRetryBlock:(id)a3;
- (void)writeFailedForKeys:(__CFString *)a3 values:(uint64_t)a4 count:;
@end

@implementation CFPrefsPlistSource

void __88__CFPrefsPlistSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke_62(uint64_t a1, CFStringRef theString, const void *a3)
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  if (!CFStringHasPrefix(theString, @"Sig_"))
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), theString);
    v7 = Value;
    if (!Value || !CFEqual(Value, a3))
    {
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"%s%@", "Sig_", theString);
      v9 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), v8);
      CFRelease(v8);
      v10 = (const void *)[*(id *)(a1 + 32) copyOSLogDescription];
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v11 = _CFPrefsClientLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544387;
        v13 = v10;
        __int16 v14 = 2114;
        CFStringRef v15 = theString;
        __int16 v16 = 2113;
        v17 = v7;
        __int16 v18 = 2113;
        v19 = a3;
        __int16 v20 = 2114;
        v21 = v9;
        _os_log_error_impl(&dword_182B90000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Value for key %{public}@ was %{private}@. Expected %{private}@ (%{public}@)", buf, 0x34u);
      }
      _CFSetTSD(0xFu, 0, 0);
      CFRelease(v10);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), theString, a3);
    }
  }
}

- (__CFDictionary)alreadylocked_copyDictionary
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  if (byte_1EC090E01) {
    [(CFPrefsPlistSource *)self alreadylocked_clearCache];
  }
  v15[0] = off_1ECE0A5A0;
  v15[1] = 3221225472;
  __int16 v16 = __alreadylocked_requestNewDataIfStale_block_invoke;
  v17 = &unk_1ECDB0298;
  __int16 v18 = self;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if ((v3 & 1) == 0)
  {
    v4 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
    if (!v4
      || (unsigned int v5 = atomic_load(v4), v6 = atomic_load((unsigned int *)&sentinelGeneration), v5 != v6)
      && (unsigned int v7 = atomic_load(&self->super.lastKnownShmemState), v5 != v7))
    {
      os_unfair_lock_assert_owner(&self->super._lock);
      v16((uint64_t)v15);
    }
  }
  if (atomic_load((unint64_t *)&self->_locallySetDict))
  {
    dict = self->super._dict;
    if (dict) {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, dict);
    }
    else {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    CFMutableDictionaryRef v11 = MutableCopy;
    os_unfair_lock_lock(&locallySetDictLock);
    CFDictionaryRef v12 = (const __CFDictionary *)atomic_load((unint64_t *)&self->_locallySetDict);
    CFDictionaryApplyFunction(v12, (CFDictionaryApplierFunction)locallySetValueOverlayMergeFunc, v11);
    os_unfair_lock_unlock(&locallySetDictLock);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CFPrefsPlistSource;
    return [(CFPrefsSource *)&v14 alreadylocked_copyDictionary];
  }
  return v11;
}

- (void)copyValueForKey:(__CFString *)a3
{
  os_unfair_lock_lock(&self->super._lock);
  CFTypeRef v5 = _copyValueForKey((uint64_t)self, a3);
  os_unfair_lock_unlock(&self->super._lock);
  return (void *)v5;
}

- (CFPrefsPlistSource)initWithDomain:(__CFString *)a3 user:(__CFString *)a4 byHost:(BOOL)a5 containerPath:(__CFString *)a6 containingPreferences:(id)a7
{
  uint64_t v15 = *(void *)off_1ECE0A5B0;
  v14.receiver = self;
  v14.super_class = (Class)CFPrefsPlistSource;
  CFMutableDictionaryRef v11 = [(CFPrefsSource *)&v14 initWithContainingPreferences:a7];
  uint64_t v12 = (uint64_t)v11;
  if (v11)
  {
    -[CFPrefsPlistSource setDomainIdentifier:]((uint64_t)v11, a3);
    -[CFPrefsPlistSource setUserIdentifier:](v12, a4);
    -[CFPrefsPlistSource setContainer:](v12, a6);
    atomic_store(a5, (unsigned __int8 *)(v12 + 104));
    atomic_store(0, (unint64_t *)(v12 + 40));
    atomic_store(0, (unsigned int *)(v12 + 48));
  }
  return (CFPrefsPlistSource *)v12;
}

- (void)setUserIdentifier:(uint64_t)a1
{
  if (a1)
  {
    CFStringRef v4 = *(const __CFString **)(a1 + 64);
    if (v4 != cf1)
    {
      if (cf1)
      {
        CFTypeRef v5 = @"kCFPreferencesAnyUser";
        if (CFEqual(cf1, @"kCFPreferencesAnyUser")
          || (CFTypeRef v5 = @"kCFPreferencesCurrentUser", CFEqual(cf1, @"kCFPreferencesCurrentUser")))
        {
          *(void *)(a1 + 64) = v5;
          if (!v4) {
            return;
          }
        }
        else
        {
          *(void *)(a1 + 64) = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf1);
          if (!v4) {
            return;
          }
        }
      }
      else
      {
        *(void *)(a1 + 64) = 0;
        if (!v4) {
          return;
        }
      }
      CFRelease(v4);
    }
  }
}

- (void)setDomainIdentifier:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  if (!cf1)
  {
    CFStringRef v4 = *(__CFString **)(a1 + 72);
    if (!v4) {
      return;
    }
    *(void *)(a1 + 72) = 0;
    goto LABEL_12;
  }
  if (CFEqual(cf1, @"kCFPreferencesCurrentApplication")) {
    -[CFPrefsPlistSource setDomainIdentifier:]();
  }
  CFStringRef v4 = *(__CFString **)(a1 + 72);
  if (v4 != cf1)
  {
    CFTypeRef v5 = @"kCFPreferencesAnyApplication" == cf1
      || (__CFString *)_CFPrefsGetCacheStringForBundleID(@"kCFPreferencesCurrentApplication") == cf1
       ? CFRetain(cf1)
       : _CFStringCopyBundleUnloadingProtectedString((unint64_t *)cf1);
    *(void *)(a1 + 72) = v5;
    if (v4)
    {
LABEL_12:
      CFRelease(v4);
    }
  }
}

- (void)setContainer:(uint64_t)a1
{
  if (a1)
  {
    CFTypeRef v3 = *(CFTypeRef *)(a1 + 80);
    if (v3 != cf)
    {
      CFTypeRef v4 = cf ? CFRetain(cf) : 0;
      *(void *)(a1 + 80) = v4;
      if (v3)
      {
        CFRelease(v3);
      }
    }
  }
}

- (uint64_t)alreadylocked_requestNewData
{
  unint64_t v1 = a1;
  uint64_t v16 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(a1 + 105));
    if (v2)
    {
      return 0;
    }
    else
    {
      CFTypeRef v3 = (unsigned int *)atomic_load((unint64_t *)(a1 + 40));
      if (v3
        && ((v4 = atomic_load(v3), unsigned int v5 = atomic_load((unsigned int *)&sentinelGeneration), v4 == v5)
         || (unsigned int v6 = atomic_load((unsigned int *)(a1 + 48)), v4 == v6)))
      {
        return 1;
      }
      else
      {
        uint64_t v12 = 0;
        v13 = &v12;
        uint64_t v14 = 0x2020000000;
        char v15 = 0;
        unsigned int v7 = *(_xpc_connection_s ***)(a1 + 8);
        unsigned __int8 v8 = atomic_load((unsigned __int8 *)(a1 + 113));
        if ((v8 & 1) != 0 || _CFPrefsDirectMode())
        {
          int v9 = 3;
        }
        else if (xpc_user_sessions_enabled() {
               && (CFEqual(*(CFTypeRef *)(v1 + 64), @"kCFPreferencesAnyUser")
        }
                || !xpc_user_sessions_get_session_uid()
                && CFEqual(*(CFTypeRef *)(v1 + 64), @"kCFPreferencesCurrentUser")))
        {
          int v9 = 2;
        }
        else
        {
          int v9 = 1;
        }
        v11[0] = off_1ECE0A5A0;
        v11[1] = 3221225472;
        v11[2] = __50__CFPrefsPlistSource_alreadylocked_requestNewData__block_invoke;
        v11[3] = &unk_1ECE01230;
        v11[4] = v1;
        v11[5] = &v12;
        -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](v7, v9, (const void *)[(id)v1 userIdentifier], (uint64_t)v11);
        unint64_t v1 = *((unsigned char *)v13 + 24) == 0;
        _Block_object_dispose(&v12, 8);
      }
    }
  }
  return v1;
}

- (void)sendFullyPreparedMessage:(xpc_connection_t)connection toConnection:(uint64_t)a4 settingValues:(uint64_t)a5 forKeys:(uint64_t)a6 count:(int)a7 retryCount:
{
  uint64_t v13 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    v11[0] = off_1ECE0A5A0;
    v11[1] = 3221225472;
    v11[2] = __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke;
    v11[3] = &unk_1ECE01208;
    v11[4] = a2;
    v11[5] = a1;
    void v11[6] = a5;
    v11[7] = a4;
    v11[8] = a6;
    int v12 = a7;
    if (connection)
    {
      __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke((uint64_t)v11, connection);
    }
    else
    {
      unsigned __int8 v8 = *(_xpc_connection_s ***)(a1 + 8);
      unsigned __int8 v9 = atomic_load((unsigned __int8 *)(a1 + 113));
      if ((v9 & 1) != 0 || _CFPrefsDirectMode())
      {
        int v10 = 3;
      }
      else if (xpc_user_sessions_enabled() {
             && (CFEqual(*(CFTypeRef *)(a1 + 64), @"kCFPreferencesAnyUser")
      }
              || !xpc_user_sessions_get_session_uid()
              && CFEqual(*(CFTypeRef *)(a1 + 64), @"kCFPreferencesCurrentUser")))
      {
        int v10 = 2;
      }
      else
      {
        int v10 = 1;
      }
      -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](v8, v10, (const void *)[(id)a1 userIdentifier], (uint64_t)v11);
    }
  }
}

void __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke(uint64_t a1, xpc_connection_t connection)
{
  v14[10] = *(void *)off_1ECE0A5B0;
  if (connection) {
    xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(connection, *(xpc_object_t *)(a1 + 32));
  }
  else {
    xpc_object_t v4 = xpc_retain(off_1ECE0A658);
  }
  unsigned int v5 = v4;
  unsigned int v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  unsigned __int8 v8 = *(const void ***)(a1 + 48);
  unsigned __int8 v9 = *(const void ***)(a1 + 56);
  CFIndex v10 = *(void *)(a1 + 64);
  int v11 = *(_DWORD *)(a1 + 72);
  v14[0] = off_1ECE0A5A0;
  v14[1] = 3221225472;
  v14[2] = __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke_2;
  v14[3] = &unk_1ECE011E0;
  v14[4] = v7;
  v14[5] = v6;
  v14[6] = connection;
  v14[7] = v9;
  v14[8] = v8;
  v14[9] = v10;
  -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:](v6, v5, v7, v8, v9, v10, v11, (uint64_t)v14);
  if (object_getClass(v5) == (Class)off_1ECE0A690)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v5, "CFPreferencesShmemState");
    if (uint64)
    {
      unsigned int v13 = atomic_load((unsigned int *)(*(void *)(a1 + 40) + 48));
      if (uint64 == v13 + 1) {
        atomic_store(uint64, (unsigned int *)(*(void *)(a1 + 40) + 48));
      }
    }
  }
}

void __50__CFPrefsPlistSource_alreadylocked_requestNewData__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2
    && ((v4 = *(void *)(a1 + 32), unsigned __int8 v5 = atomic_load((unsigned __int8 *)(v4 + 113)), (v5 & 1) == 0)
     && !_CFPrefsDirectMode()
      ? (xpc_user_sessions_enabled()
      && (CFEqual(*(CFTypeRef *)(v4 + 64), @"kCFPreferencesAnyUser")
       || !xpc_user_sessions_get_session_uid()
       && CFEqual(*(CFTypeRef *)(v4 + 64), @"kCFPreferencesCurrentUser"))
       ? (uint64_t v6 = 2)
       : (uint64_t v6 = 1))
      : (uint64_t v6 = 3),
        (unsigned int v7 = (void *)[(id)v4 createRequestNewContentMessageForDaemon:v6]) != 0))
  {
    unsigned __int8 v8 = v7;
    -[CFPrefsPlistSource sendRequestNewDataMessage:toConnection:retryCount:error:](*(void *)(a1 + 32), v7, a2, 0, (BOOL *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    xpc_release(v8);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)sendRequestNewDataMessage:(uint64_t)a3 toConnection:(uint64_t)a4 retryCount:(BOOL *)a5 error:
{
  uint64_t v29 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    if (xdict)
    {
      BOOL v10 = -[CFPrefsPlistSource attachAccessTokenToMessage:accessType:](a1, xdict, 0);
      *a5 = !v10;
      if (v10)
      {
        unsigned __int8 v11 = atomic_load((unsigned __int8 *)(a1 + 113));
        if ((v11 & 1) != 0 || _CFPrefsDirectMode())
        {
          int v12 = "Loading Preferences From Direct CFPrefsD";
        }
        else if (xpc_user_sessions_enabled() {
               && (CFEqual(*(CFTypeRef *)(a1 + 64), @"kCFPreferencesAnyUser")
        }
                || !xpc_user_sessions_get_session_uid()
                && CFEqual(*(CFTypeRef *)(a1 + 64), @"kCFPreferencesCurrentUser")))
        {
          int v12 = "Loading Preferences From System Session CFPrefsD";
        }
        else
        {
          int v12 = "Loading Preferences From User Session CFPrefsD";
        }
        unsigned int v13 = _os_activity_create(&dword_182B90000, v12, (os_activity_t)off_1ECE0A638, OS_ACTIVITY_FLAG_DEFAULT);
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        os_activity_scope_enter(v13, &state);
        -[CFPrefsPlistSource addPIDImpersonationIfNecessary:]((void *)a1, xdict);
        uint64_t v22 = 0;
        v23 = &v22;
        uint64_t v24 = 0x3052000000;
        v25 = __Block_byref_object_copy__7;
        v26 = __Block_byref_object_dispose__7;
        uint64_t v27 = 0;
        char v15 = off_1ECE0A5A0;
        uint64_t v16 = 3221225472;
        v17 = __78__CFPrefsPlistSource_sendRequestNewDataMessage_toConnection_retryCount_error___block_invoke;
        __int16 v18 = &unk_1ECE008C8;
        xpc_object_t v20 = xdict;
        v21 = &v22;
        uint64_t v19 = a3;
        unsigned __int8 v14 = atomic_load((unsigned __int8 *)(a1 + 113));
        if ((v14 & 1) != 0 || _CFPrefsDirectMode())
        {
          CFPREFERENCES_IS_WAITING_FOR_DIRECT_CFPREFSD(*(const os_unfair_lock **)(a1 + 8), (uint64_t)&v15);
        }
        else if (xpc_user_sessions_enabled() {
               && (CFEqual(*(CFTypeRef *)(a1 + 64), @"kCFPreferencesAnyUser")
        }
                || !xpc_user_sessions_get_session_uid()
                && CFEqual(*(CFTypeRef *)(a1 + 64), @"kCFPreferencesCurrentUser")))
        {
          CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(*(const os_unfair_lock **)(a1 + 8), (uint64_t)&v15);
        }
        else
        {
          CFPREFERENCES_IS_WAITING_FOR_USER_CFPREFSD(*(const os_unfair_lock **)(a1 + 8), (uint64_t)&v15);
        }
        objc_msgSend((id)a1, "handleReply:toRequestNewDataMessage:onConnection:retryCount:error:", v23[5], xdict, a3, a4, a5, v15, v16, v17, v18, v19, v20, v21, v22);
        xpc_release((xpc_object_t)v23[5]);

        _Block_object_dispose(&v22, 8);
        os_activity_scope_leave(&state);
      }
    }
    else
    {
      *a5 = 1;
    }
  }
}

xpc_object_t __78__CFPrefsPlistSource_sendRequestNewDataMessage_toConnection_retryCount_error___block_invoke(uint64_t a1)
{
  xpc_object_t result = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (BOOL)synchronize
{
  p_lastWriteFailed = &self->_lastWriteFailed;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_lastWriteFailed);
  if (v3)
  {
    BOOL result = 0;
    atomic_store(0, (unsigned __int8 *)p_lastWriteFailed);
  }
  else
  {
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_volatile);
    if (v4)
    {
      return 0;
    }
    else
    {
      unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_readonly);
      return (v5 & 1) == 0;
    }
  }
  return result;
}

- (void)alreadylocked_copyValueForKey:(__CFString *)a3
{
  return (void *)_copyValueForKey((uint64_t)self, a3);
}

- (void)setBackupDisabled:(BOOL)a3
{
}

- (void)handleReply:(id)a3 toRequestNewDataMessage:(id)a4 onConnection:(id)a5 retryCount:(int)a6 error:(BOOL *)a7
{
  uint64_t v80 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->super._lock);
  unint64_t v13 = atomic_load((unint64_t *)&self->super.shmemEntry);
  if (v13 || (string = xpc_dictionary_get_string(a3, "CFPreferencesShmemName")) == 0)
  {
LABEL_2:
    v77[0] = off_1ECE0A5A0;
    v77[1] = 3221225472;
    v77[2] = __88__CFPrefsPlistSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke;
    v77[3] = &unk_1ECE012A0;
    v77[4] = a4;
    v77[5] = self;
    v77[6] = a5;
    v77[7] = a7;
    if (-[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:]((uint64_t)self, a3, a4, 0, 0, 0, a6, (uint64_t)v77))return; {
    atomic_store(xpc_dictionary_get_uint64(a3, "CFPreferencesShmemState"), &self->super.lastKnownShmemState);
    }
    xCFDataRef data = xpc_dictionary_get_value(a3, "CFPreferencesPropertyList");
    int v14 = xpc_dictionary_dup_fd(a3, "PlistFD");
    unint64_t value = (unint64_t)xpc_dictionary_get_value(a3, "PlistDiff");
    unint64_t v16 = (unint64_t)xpc_dictionary_get_value(a3, "CFPreferencesValidationPropertyList");
    if (value | v16) {
      int v17 = 0;
    }
    else {
      int v17 = dyld_program_sdk_at_least();
    }
    if (v14 != -1)
    {
      memset(&v79, 0, sizeof(v79));
      if (fstat(v14, &v79))
      {
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v23 = _CFPrefsClientLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = __error();
          -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.8(v24, (uint8_t *)error, v23);
        }
        int v25 = 0;
        _CFSetTSD(0xFu, 0, 0);
        Mutable = 0;
        goto LABEL_63;
      }
      off_t st_size = v79.st_size;
      if (_plistSizeIsAppropriateToRead(v79.st_size))
      {
        v28 = (UInt8 *)mmap(0, st_size, 1, 2, v14, 0);
        if (v28 != (UInt8 *)-1)
        {
          error[0] = 0;
          CFDataRef data = CFDataCreateWithBytesNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, v28, st_size, (CFAllocatorRef)&__kCFAllocatorNull);
          uint64_t v29 = (__CFDictionary *)CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, data, v17 ^ 1u, 0, error);
          Mutable = v29;
          if (v29)
          {
            if (CFGetTypeID(v29) == 18)
            {
              int v25 = 1;
LABEL_60:
              if (data) {
                CFRelease(data);
              }
              munmap(v28, st_size);
              goto LABEL_63;
            }
            cfa = [(CFPrefsSource *)self copyOSLogDescription];
            _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
            v44 = _CFPrefsClientLog();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
              -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.7();
            }
            _CFSetTSD(0xFu, 0, 0);
            CFRelease(cfa);
          }
          else
          {
            cf = [(CFPrefsSource *)self copyOSLogDescription];
            _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
            v43 = _CFPrefsClientLog();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
              -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.6();
            }
            _CFSetTSD(0xFu, 0, 0);
            if (os_variant_has_internal_diagnostics())
            {
              v71 = os_log_create("com.apple.defaults", "diagnostics");
              _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
              if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
                -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.5();
              }
              _CFSetTSD(0xFu, 0, 0);
            }
            CFRelease(cf);
            if (error[0]) {
              CFRelease(error[0]);
            }
          }
          int v25 = 0;
          goto LABEL_60;
        }
        int v40 = *__error();
        v41 = [(CFPrefsSource *)self copyOSLogDescription];
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v42 = _CFPrefsClientLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.4((uint64_t)v41, v40, v42);
        }
        _CFSetTSD(0xFu, 0, 0);
        CFRelease(v41);
      }
      Mutable = 0;
      int v25 = 0;
LABEL_63:
      close(v14);
      goto LABEL_64;
    }
    if (!xdata)
    {
      Mutable = 0;
      BOOL v32 = 1;
LABEL_65:
      if (value)
      {
        if (object_getClass((id)value) != (Class)off_1ECE0A668)
        {
LABEL_67:
          v45 = [(CFPrefsSource *)self copyOSLogDescription];
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
          v46 = _CFPrefsClientLog();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:]();
          }
          _CFSetTSD(0xFu, 0, 0);
          CFRelease(v45);
          goto LABEL_122;
        }
        size_t count = xpc_array_get_count((xpc_object_t)value);
        if ((count & 1) != 0 || Mutable)
        {
          if (count) {
            goto LABEL_67;
          }
        }
        else
        {
          dict = self->super._dict;
          if (count)
          {
            if (dict) {
              CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, dict);
            }
            else {
              CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            }
            goto LABEL_97;
          }
          if (dict)
          {
            CFMutableDictionaryRef MutableCopy = (__CFDictionary *)CFRetain(self->super._dict);
LABEL_97:
            Mutable = MutableCopy;
            goto LABEL_98;
          }
          Mutable = 0;
        }
LABEL_98:
        _CFPrefsApplyChangesQueueToDictionary((void *)value, Mutable);
        if (v16) {
          goto LABEL_99;
        }
        goto LABEL_115;
      }
LABEL_70:
      if (v16) {
        BOOL v47 = v32;
      }
      else {
        BOOL v47 = 0;
      }
      if (v47)
      {
LABEL_99:
        if (object_getClass((id)v16) == (Class)off_1ECE0A680)
        {
          size_t length = xpc_data_get_length((xpc_object_t)v16);
          if (length <= 0x7FFFFFFFFFFFFFFELL)
          {
            *(void *)&v79.st_dev = 0;
            bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr((xpc_object_t)v16);
            CFDataRef v55 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, bytes_ptr, length, (CFAllocatorRef)&__kCFAllocatorNull);
            CFDictionaryRef v56 = (const __CFDictionary *)CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, v55, 0, 0, (CFErrorRef *)&v79);
            CFDictionaryRef v57 = v56;
            if (!v56 || CFGetTypeID(v56) != 18)
            {
              v58 = [(CFPrefsSource *)self copyOSLogDescription];
              _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
              v59 = _CFPrefsClientLog();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
                -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:]();
              }
              _CFSetTSD(0xFu, 0, 0);
              CFRelease(v58);
              if (*(void *)&v79.st_dev) {
                CFRelease(*(CFTypeRef *)&v79.st_dev);
              }
            }
            if (v55) {
              CFRelease(v55);
            }
            if (v57)
            {
              if (CFDictionaryGetCount(v57) >= 1)
              {
                if (!Mutable) {
                  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                }
                context[0] = off_1ECE0A5A0;
                context[1] = 3221225472;
                context[2] = __88__CFPrefsPlistSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke_62;
                context[3] = &unk_1ECE012C8;
                context[5] = Mutable;
                context[6] = v57;
                context[4] = self;
                CFDictionaryApplyFunction(v57, (CFDictionaryApplierFunction)applyDictBlock, context);
              }
              CFRelease(v57);
            }
            goto LABEL_115;
          }
        }
LABEL_122:
        v64 = [(CFPrefsSource *)self copyOSLogDescription];
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v65 = _CFPrefsClientLog();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:]();
        }
        _CFSetTSD(0xFu, 0, 0);
        if (v64) {
          CFRelease(v64);
        }
        *a7 = 1;
        if (Mutable) {
          CFRelease(Mutable);
        }
        return;
      }
      if (!v32) {
        goto LABEL_122;
      }
LABEL_115:
      v60 = _CFPrefsClientLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        v61 = [(CFPrefsSource *)self copyOSLogDescription];
        BOOL v62 = v14 == -1;
        if (!xdata) {
          BOOL v62 = 0;
        }
        if (v62)
        {
          v63 = "a new base plist";
        }
        else if (self->super._dict)
        {
          v63 = "the same base plist";
        }
        else
        {
          v63 = "an empty base plist";
        }
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v66 = _CFPrefsClientLog();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          v70 = "no additional changes from the base plist";
          v79.st_dev = 138543874;
          *(void *)&v79.st_mode = v61;
          WORD2(v79.st_ino) = 2080;
          if (value) {
            v70 = "a diff relative to the base plist";
          }
          *(__darwin_ino64_t *)((char *)&v79.st_ino + 6) = (__darwin_ino64_t)v63;
          HIWORD(v79.st_gid) = 2080;
          *(void *)&v79.st_rdev = v70;
          _os_log_debug_impl(&dword_182B90000, v66, OS_LOG_TYPE_DEBUG, "%{public}@ loaded: %s and %s", (uint8_t *)&v79, 0x20u);
        }
        _CFSetTSD(0xFu, 0, 0);
        CFRelease(v61);
      }
      v67 = self->super._dict;
      if (v67) {
        CFRelease(v67);
      }
      if (Mutable) {
        int v68 = v17;
      }
      else {
        int v68 = 0;
      }
      if (v68 == 1)
      {
        CFMutableDictionaryRef v69 = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, Mutable);
        CFRelease(Mutable);
        Mutable = v69;
      }
      self->super._dict = Mutable;
      atomic_fetch_add(&self->super._generationCount, 1uLL);
      return;
    }
    if (object_getClass(xdata) != (Class)off_1ECE0A680
      || (size_t v33 = xpc_data_get_length(xdata), !_plistSizeIsAppropriateToRead(v33)))
    {
      Mutable = 0;
      goto LABEL_20;
    }
    *(void *)&v79.st_dev = 0;
    v34 = (const UInt8 *)xpc_data_get_bytes_ptr(xdata);
    CFDataRef v35 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, v34, v33, (CFAllocatorRef)&__kCFAllocatorNull);
    v36 = (__CFDictionary *)CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, v35, v17 ^ 1u, 0, (CFErrorRef *)&v79);
    Mutable = v36;
    if (!v35 || v36)
    {
      int v25 = 1;
      if (!v35)
      {
LABEL_87:
        if (*(void *)&v79.st_dev) {
          CFRelease(*(CFTypeRef *)&v79.st_dev);
        }
        if (!Mutable || CFGetTypeID(Mutable) == 18)
        {
LABEL_64:
          BOOL v32 = v25 != 0;
          if (!v25) {
            goto LABEL_70;
          }
          goto LABEL_65;
        }
        v51 = [(CFPrefsSource *)self copyOSLogDescription];
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v52 = _CFPrefsClientLog();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.9();
        }
        _CFSetTSD(0xFu, 0, 0);
        CFRelease(v51);
        -[CFPrefsPlistSource requestPlistValidation]((uint64_t)self);
LABEL_20:
        int v25 = 0;
        goto LABEL_64;
      }
    }
    else
    {
      v37 = [(CFPrefsSource *)self copyOSLogDescription];
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v38 = _CFPrefsClientLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:]1();
      }
      _CFSetTSD(0xFu, 0, 0);
      CFRelease(v37);
      -[CFPrefsPlistSource requestPlistValidation]((uint64_t)self);
      if (os_variant_has_internal_diagnostics())
      {
        v39 = os_log_create("com.apple.defaults", "diagnostics");
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:]0();
        }
        _CFSetTSD(0xFu, 0, 0);
      }
      int v25 = 0;
    }
    CFRelease(v35);
    goto LABEL_87;
  }
  uint64_t v19 = string;
  unsigned __int8 v20 = atomic_load((unsigned __int8 *)&self->_directMode);
  if ((v20 & 1) != 0 || _CFPrefsDirectMode())
  {
    int v21 = 3;
  }
  else if (xpc_user_sessions_enabled() {
         && (CFEqual(self->userIdentifier, @"kCFPreferencesAnyUser")
  }
          || !xpc_user_sessions_get_session_uid()
          && CFEqual(self->userIdentifier, @"kCFPreferencesCurrentUser")))
  {
    int v21 = 2;
  }
  else
  {
    int v21 = 1;
  }
  uint64_t v22 = -[_CFXPreferences shmemForRole:name:]((uint64_t)self->super._containingPreferences, v21, v19);
  if (v22)
  {
    atomic_store(v22 + 4 * xpc_dictionary_get_int64(a3, "CFPreferencesShmemIndex"), (unint64_t *)&self->super.shmemEntry);
    goto LABEL_2;
  }
  v30 = [(CFPrefsSource *)self copyOSLogDescription];
  _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
  v31 = _CFPrefsClientLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v79.st_dev = 67109634;
    *(_DWORD *)&v79.st_mode = v21;
    LOWORD(v79.st_ino) = 2082;
    *(__darwin_ino64_t *)((char *)&v79.st_ino + 2) = (__darwin_ino64_t)v19;
    HIWORD(v79.st_uid) = 2114;
    *(void *)&v79.st_gid = v30;
    _os_log_error_impl(&dword_182B90000, v31, OS_LOG_TYPE_ERROR, "going volatile, because unable to obtain shmem entry for role: %d name: %{public}s. %{public}@", (uint8_t *)&v79, 0x1Cu);
  }
  _CFSetTSD(0xFu, 0, 0);
  atomic_store(1u, (unsigned __int8 *)&self->_volatile);
  *a7 = 1;
  if (v30) {
    CFRelease(v30);
  }
}

- (id)createRequestNewContentMessageForDaemon:(int)a3
{
  uint64_t v25 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->super._lock);
  uint64_t v19 = 0;
  unsigned __int8 v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy__7;
  v23 = __Block_byref_object_dispose__7;
  uint64_t v24 = 0;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_directMode);
  if ((v5 & 1) != 0 || _CFPrefsDirectMode())
  {
    int v6 = 3;
  }
  else if (xpc_user_sessions_enabled() {
         && (CFEqual(self->userIdentifier, @"kCFPreferencesAnyUser")
  }
          || !xpc_user_sessions_get_session_uid()
          && CFEqual(self->userIdentifier, @"kCFPreferencesCurrentUser")))
  {
    int v6 = 2;
  }
  else
  {
    int v6 = 1;
  }
  if (v6 == a3)
  {
    v14[0] = off_1ECE0A5A0;
    v14[1] = 3221225472;
    char v15 = __62__CFPrefsPlistSource_createRequestNewContentMessageForDaemon___block_invoke;
    unint64_t v16 = &unk_1ECE01258;
    int v17 = self;
    __int16 v18 = &v19;
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_volatile);
    if ((v7 & 1) == 0)
    {
      unsigned __int8 v8 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
      if (!v8
        || (unsigned int v9 = atomic_load(v8), v10 = atomic_load((unsigned int *)&sentinelGeneration), v9 != v10)
        && (unsigned int v11 = atomic_load(&self->super.lastKnownShmemState), v9 != v11))
      {
        os_unfair_lock_assert_owner(&self->super._lock);
        v15((uint64_t)v14);
      }
    }
  }
  int v12 = (void *)v20[5];
  _Block_object_dispose(&v19, 8);
  return v12;
}

- (void)addPIDImpersonationIfNecessary:(void *)a1
{
  if (a1)
  {
    if ((void)_CFPrefsAuditTokenToImpersonate) {
      BOOL v2 = 0;
    }
    else {
      BOOL v2 = *((void *)&_CFPrefsAuditTokenToImpersonate + 1) == 0;
    }
    if (!v2 || qword_1EC094024 != 0 || unk_1EC09402C != 0)
    {
      int v6 = (const void *)objc_msgSend(a1, "domainIdentifier", 0, 0, 0, 0);
      CacheStringForBundleID = (const void *)_CFPrefsGetCacheStringForBundleID(@"kCFPreferencesCurrentApplication");
      if (CFEqual(v6, CacheStringForBundleID)) {
        xpc_dictionary_set_data(a2, "CFPreferencesAuditTokenToImpersonate", &_CFPrefsAuditTokenToImpersonate, 0x20uLL);
      }
    }
  }
}

- (uint64_t)handleErrorReply:(void *)a3 toMessage:(const void *)a4 settingKeys:(const void *)a5 toValues:(CFIndex)a6 count:(int)a7 retryCount:(uint64_t)a8 retryContinuation:
{
  uint64_t v56 = *(void *)off_1ECE0A5B0;
  if (!result) {
    return result;
  }
  if (!a2) {
    -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:]();
  }
  if (a2 == off_1ECE0A650)
  {
    if (!__CFProcessIsRestricted() && getenv("__CFPreferencesTestDaemon"))
    {
      BOOL v47 = _CFPrefsClientLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
        -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:]();
      }
      abort();
    }
    uint64_t v25 = _CFPrefsClientLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182B90000, v25, OS_LOG_TYPE_INFO, "cfprefsd crashed, retrying message", buf, 2u);
    }
    if (a7 <= 9)
    {
      (*(void (**)(uint64_t, void))(a8 + 16))(a8, (a7 + 1));
      return 1;
    }
    return 0;
  }
  uint64_t v14 = result;
  if (object_getClass(a2) != (Class)off_1ECE0A690) {
    goto LABEL_5;
  }
  int64_t int64 = xpc_dictionary_get_int64(a2, "CFPreferencesErrorType");
  if (int64 == 4)
  {
    string = xpc_dictionary_get_string(a2, "CFPreferencesUncanonicalizedPath");
    v36 = string;
    if (a7 >= 4)
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v37 = _CFPrefsClientLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.5();
      }
      goto LABEL_35;
    }
    if (string)
    {
      bzero(buf, 0x402uLL);
      if (dirname_r(v36, (char *)buf))
      {
        geteuid();
        getegid();
        if (_CFPrefsCreatePreferencesDirectory((const char *)buf))
        {
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
          v42 = _CFPrefsClientLog();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
            -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.9();
          }
          _CFSetTSD(0xFu, 0, 0);
          (*(void (**)(uint64_t, void))(a8 + 16))(a8, (a7 + 1));
          return 1;
        }
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v45 = _CFPrefsClientLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = __error();
          -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.8((uint64_t)buf, v46, v49, v45);
        }
        _CFSetTSD(0xFu, 0, 0);
      }
      else
      {
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
        v44 = _CFPrefsClientLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.7();
        }
        _CFSetTSD(0xFu, 0, 0);
      }
    }
    else
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      v43 = _CFPrefsClientLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.6();
      }
      _CFSetTSD(0xFu, 0, 0);
    }
  }
  else
  {
    if (int64 != 3) {
      goto LABEL_5;
    }
    uint64_t v27 = xpc_dictionary_get_string(a2, "CFPreferencesAccessToken");
    v28 = v27;
    if (a7 >= 10)
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      uint64_t v29 = _CFPrefsClientLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.4();
      }
LABEL_35:
      _CFSetTSD(0xFu, 0, 0);
      return 0;
    }
    if (v27)
    {
      xpc_dictionary_set_value(a3, "CFPreferencesAccessToken", 0);
      int v40 = strdup(v28);
      uint64_t v41 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(v14 + 96), (unint64_t *)&v41, (unint64_t)v40);
      if (v41) {
        free(v40);
      }
      (*(void (**)(uint64_t, void))(a8 + 16))(a8, (a7 + 1));
      return 1;
    }
  }
LABEL_5:
  int v15 = xpc_dictionary_get_int64(a2, "CFPreferencesByteCountThreshold");
  -[CFPrefsPlistSource handlePossibleOversizedMessage:forWritingKeys:values:count:]((unsigned __int8 *)v14, v15, a4, a5, a6);
  if (object_getClass(a2) == (Class)off_1ECE0A6A0
    || (BOOL result = (uint64_t)xpc_dictionary_get_value(a2, "CFPreferencesErrorDescription")) != 0)
  {
    if (a2 == off_1ECE0A658)
    {
      -[CFPrefsPlistSource writeFailedForKeys:values:count:](v14, a4, (__CFString **)a5, a6);
      atomic_store(1u, (unsigned __int8 *)(v14 + 105));
      if (handleErrorReply_toMessage_settingKeys_toValues_count_retryCount_retryContinuation__onceToken != -1) {
        dispatch_once(&handleErrorReply_toMessage_settingKeys_toValues_count_retryCount_retryContinuation__onceToken, &__block_literal_global_42);
      }
    }
    else
    {
      if (object_getClass(a2) != (Class)off_1ECE0A690) {
        -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:]();
      }
      int v16 = xpc_dictionary_get_int64(a2, "CFPreferencesErrorType");
      int v17 = xpc_dictionary_get_string(a2, "CFPreferencesErrorDescription");
      CFStringRef v18 = (const __CFString *)[(id)v14 copyOSLogDescription];
      if (xpc_dictionary_get_BOOL(a2, "CFPreferencesErrorClientFault")) {
        os_log_type_t v19 = OS_LOG_TYPE_FAULT;
      }
      else {
        os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      }
      if (v16 == 1)
      {
        if (a6 < 1)
        {
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
          v38 = _CFPrefsClientLog();
          if (os_log_type_enabled(v38, v19))
          {
            *(_DWORD *)buf = 138543618;
            CFStringRef v51 = v18;
            __int16 v52 = 2082;
            v53 = v17;
            _os_log_impl(&dword_182B90000, v38, v19, "Couldn't read values in %{public}@: %{public}s, detaching from cfprefsd", buf, 0x16u);
          }
          _CFSetTSD(0xFu, 0, 0);
        }
        else
        {
          Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
          CFIndex v21 = a6;
          uint64_t v22 = a4;
          do
          {
            if (*v22) {
              CFArrayAppendValue(Mutable, *v22);
            }
            ++v22;
            --v21;
          }
          while (v21);
          CFStringRef v23 = CFCopyDescription(Mutable);
          if (Mutable) {
            CFRelease(Mutable);
          }
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
          uint64_t v24 = _CFPrefsClientLog();
          if (os_log_type_enabled(v24, v19))
          {
            *(_DWORD *)buf = 138543874;
            CFStringRef v51 = v23;
            __int16 v52 = 2114;
            v53 = (const char *)v18;
            __int16 v54 = 2082;
            CFDataRef v55 = v17;
            _os_log_impl(&dword_182B90000, v24, v19, "Couldn't write values for keys %{public}@ in %{public}@: %{public}s, detaching from cfprefsd", buf, 0x20u);
          }
          _CFSetTSD(0xFu, 0, 0);
          if (v23) {
            CFRelease(v23);
          }
        }
        -[CFPrefsPlistSource writeFailedForKeys:values:count:](v14, a4, (__CFString **)a5, a6);
        atomic_store(1u, (unsigned __int8 *)(v14 + 105));
      }
      else
      {
        if (a6 < 1)
        {
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
          v39 = _CFPrefsClientLog();
          if (os_log_type_enabled(v39, v19))
          {
            *(_DWORD *)buf = 138543618;
            CFStringRef v51 = v18;
            __int16 v52 = 2082;
            v53 = v17;
            _os_log_impl(&dword_182B90000, v39, v19, "Couldn't read values in %{public}@: %{public}s", buf, 0x16u);
          }
          _CFSetTSD(0xFu, 0, 0);
        }
        else
        {
          v30 = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
          CFIndex v31 = a6;
          BOOL v32 = a4;
          do
          {
            if (*v32) {
              CFArrayAppendValue(v30, *v32);
            }
            ++v32;
            --v31;
          }
          while (v31);
          CFStringRef v33 = CFCopyDescription(v30);
          if (v30) {
            CFRelease(v30);
          }
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
          v34 = _CFPrefsClientLog();
          if (os_log_type_enabled(v34, v19))
          {
            *(_DWORD *)buf = 138543874;
            CFStringRef v51 = v33;
            __int16 v52 = 2114;
            v53 = (const char *)v18;
            __int16 v54 = 2082;
            CFDataRef v55 = v17;
            _os_log_impl(&dword_182B90000, v34, v19, "Couldn't write values for keys %{public}@ in %{public}@: %{public}s", buf, 0x20u);
          }
          _CFSetTSD(0xFu, 0, 0);
          if (v33) {
            CFRelease(v33);
          }
        }
        -[CFPrefsPlistSource writeFailedForKeys:values:count:](v14, a4, (__CFString **)a5, a6);
      }
      CFRelease(v18);
    }
    if (a6 >= 1) {
      atomic_store(xpc_dictionary_get_uint64(a2, "CFPreferencesShmemState"), (unsigned int *)(v14 + 48));
    }
    return 1;
  }
  return result;
}

- (void)handlePossibleOversizedMessage:(const void *)a3 forWritingKeys:(const void *)a4 values:(CFIndex)a5 count:
{
  uint64_t v29 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    if (a2 == 1)
    {
      int v12 = _CFPrefsClientLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        unint64_t v13 = (const void *)[a1 copyOSLogDescription];
        uint64_t v14 = (const void *)objc_msgSend(a1, "alreadylocked_copyDictionary");
        int v15 = -[_CFPrefsOversizedPlistDescription initWithDict:setKeys:andValues:count:]([_CFPrefsOversizedPlistDescription alloc], v14, a3, a4, a5);
        int v16 = _CFPrefsClientLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v17 = 138544642;
          CFStringRef v18 = v13;
          __int16 v19 = 1024;
          int v20 = 3145728;
          __int16 v21 = 1026;
          int v22 = 0x400000;
          __int16 v23 = 2082;
          uint64_t v24 = "cause performance problems or lose data";
          __int16 v25 = 2114;
          uint64_t v26 = _CFProcessNameString();
          __int16 v27 = 2112;
          v28 = v15;
          _os_log_impl(&dword_182B90000, v16, OS_LOG_TYPE_INFO, "%{public}@: Storing >= %d bytes of data in CFPreferences/NSUserDefaults. If this exceeds %{public}d, it may %{public}s. This is a bug in %{public}@ or a library it uses.\n%@", (uint8_t *)&v17, 0x36u);
        }

        CFRelease(v13);
        if (v14) {
          CFRelease(v14);
        }
      }
      dispatch_async((dispatch_queue_t)off_1ECE0A5E0, &__block_literal_global_47);
    }
    else if (a2 == 2)
    {
      unsigned __int8 v9 = atomic_load(a1 + 113);
      if ((v9 & 1) != 0 || _CFPrefsDirectMode())
      {
        unsigned int v10 = (const void *)[a1 copyOSLogDescription];
        unsigned int v11 = _CFPrefsClientLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[CFPrefsPlistSource handlePossibleOversizedMessage:forWritingKeys:values:count:]((uint64_t)v10);
        }
        CFRelease(v10);
      }
      else
      {
        -[CFPrefsPlistSource handlePossibleOversizedMessage:forWritingKeys:values:count:]((uint64_t)a1, a3, a4, a5);
      }
    }
  }
}

void __62__CFPrefsPlistSource_createRequestNewContentMessageForDaemon___block_invoke(uint64_t a1)
{
  if ((-[CFPrefsPlistSource volatilizeIfInvalidHomeDir](*(void *)(a1 + 32)) & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) createSynchronizeMessage];
    BOOL v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v2)
    {
      if (-[CFPrefsPlistSource attachAccessTokenToMessage:accessType:](*(void *)(a1 + 32), v2, 0))
      {
        unsigned __int8 v3 = *(void **)(a1 + 32);
        unsigned __int8 v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        -[CFPrefsPlistSource addPIDImpersonationIfNecessary:](v3, v4);
      }
    }
  }
}

- (BOOL)attachAccessTokenToMessage:(int)a3 accessType:
{
  if (result)
  {
    BOOL v3 = result;
    unint64_t v4 = atomic_load((unint64_t *)(result + 96));
    BOOL result = 1;
    if (v4 && !xpc_dictionary_get_value(xdict, "CFPreferencesAccessToken"))
    {
      unsigned __int8 v7 = (const char *)atomic_load((unint64_t *)(v3 + 96));
      int v8 = a3 ? open(v7, 514, 384) : open(v7, 0);
      int v9 = v8;
      if (v8 < 0) {
        return 0;
      }
      xpc_dictionary_set_fd(xdict, "CFPreferencesAccessToken", v8);
      close(v9);
      if (byte_1EC090E08) {
        return 0;
      }
    }
  }
  return result;
}

- (uint64_t)volatilizeIfInvalidHomeDir
{
  uint64_t v10 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(a1 + 109));
  if (v2) {
    return 0;
  }
  atomic_store(1u, (unsigned __int8 *)(a1 + 109));
  if (!-[_CFXPreferences euid](*(void *)(a1 + 8))
    || CFEqual(@"kCFPreferencesAnyUser", (CFTypeRef)[(id)a1 userIdentifier])
    || !-[_CFXPreferences currentUserHasInvalidHomeDirectory](*(void *)(a1 + 8)))
  {
    return 0;
  }
  BOOL v3 = _CFPrefsClientLog();
  uint64_t v4 = 1;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v5 = (const void *)[(id)a1 copyOSLogDescription];
    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
    int v6 = _CFPrefsClientLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138543362;
      int v9 = v5;
      _os_log_impl(&dword_182B90000, v6, OS_LOG_TYPE_INFO, "Volatilizing domain, because home directory is invalid. %{public}@", (uint8_t *)&v8, 0xCu);
    }
    _CFSetTSD(0xFu, 0, 0);
    if (v5) {
      CFRelease(v5);
    }
  }
  atomic_store(1u, (unsigned __int8 *)(a1 + 105));
  return v4;
}

- (id)createSynchronizeMessage
{
  uint64_t v27 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->super._lock);
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if (v3) {
    return 0;
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  unsigned __int8 v5 = [(CFPrefsPlistSource *)self domainIdentifier];
  if ((_CFPrefsEncodeValueIntoMessage(v4, "CFPreferencesDomain", (__objc2_class **)v5, 0) & 1) == 0)
  {
    xpc_release(v4);
    return 0;
  }
  os_unfair_lock_lock_with_options();
  groupContainersForCurrentUser = self->super._containingPreferences->_groupContainersForCurrentUser;
  if (groupContainersForCurrentUser && CFSetContainsValue(groupContainersForCurrentUser, v5))
  {
    bzero(buffer, 0x400uLL);
    if (CFStringGetCString(v5, buffer, 1024, 0x8000100u))
    {
      uint64_t v25 = 1;
      unsigned __int8 v7 = (void *)container_create_or_lookup_app_group_path_by_app_group_identifier();
      if (v7)
      {
        free(v7);
      }
      else
      {
        int v9 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          [(CFPrefsPlistSource *)(uint64_t)buffer createSynchronizeMessage];
        }
      }
    }
    CFSetRemoveValue(self->super._containingPreferences->_groupContainersForCurrentUser, v5);
    if (!CFSetGetCount(self->super._containingPreferences->_groupContainersForCurrentUser))
    {
      CFRelease(self->super._containingPreferences->_groupContainersForCurrentUser);
      self->super._containingPreferences->_groupContainersForCurrentUser = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&groupContainersLock);
  CacheStringForBundleID = (__objc2_class **)_CFPrefsGetCacheStringForBundleID(@"kCFPreferencesCurrentApplication");
  _CFPrefsEncodeValueIntoMessage(v4, "CFPreferencesHostBundleIdentifier", CacheStringForBundleID, 0);
  if (CFEqual(v5, CacheStringForBundleID)) {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesCurrentApplicationDomain", 1);
  }
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_isByHost);
  if (v11) {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesIsByHost", 1);
  }
  xpc_dictionary_set_int64(v4, "CFPreferencesOperation", 1);
  if ([(CFPrefsSource *)self managed]) {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesIsManaged", 1);
  }
  int v12 = [(CFPrefsPlistSource *)self userIdentifier];
  CFStringRef Copy = @"kCFPreferencesAnyUser";
  if (CFEqual(@"kCFPreferencesAnyUser", v12)) {
    goto LABEL_32;
  }
  _CFPrefsEncodeValueIntoMessage(v4, "CFPreferencesUser", (__objc2_class **)v12, 0);
  if (!CFEqual(@"kCFPreferencesCurrentUser", @"kCFPreferencesCurrentUser"))
  {
    if (CFEqual(@"kCFPreferencesCurrentUser", @"kCFPreferencesAnyUser")) {
      goto LABEL_28;
    }
    CFStringRef v14 = CFCopyUserName();
    int v15 = CFEqual(@"kCFPreferencesCurrentUser", v14);
    CFRelease(v14);
    if (!@"kCFPreferencesCurrentUser" || !v15)
    {
      CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, @"kCFPreferencesCurrentUser");
      goto LABEL_28;
    }
  }
  CFStringRef Copy = @"kCFPreferencesCurrentUser";
LABEL_28:
  if (!CFEqual(Copy, v12)) {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesUseCorrectOwner", 1);
  }
  if (Copy) {
    CFRelease(Copy);
  }
LABEL_32:
  int v16 = [(CFPrefsPlistSource *)self container];
  if (v16)
  {
    int v17 = (__objc2_class **)v16;
    if (CFStringGetLength(v16) >= 1) {
      _CFPrefsEncodeValueIntoMessage(v4, "CFPreferencesContainer", v17, 0);
    }
  }
  if (_CFPrefsSynchronizeIsSynchronous
    || (unsigned __int8 v24 = atomic_load((unsigned __int8 *)&self->_avoidsDaemonCache), (v24 & 1) != 0)
    || _CFPrefsTestingFlags
    || byte_1EC090E02 && (arc4random() & 1) == 0)
  {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesShouldWriteSynchronously", 1);
    xpc_dictionary_set_BOOL(v4, "CFPreferencesAvoidCache", 1);
  }
  unsigned __int8 v18 = atomic_load((unsigned __int8 *)&self->_disableBackup);
  if (v18) {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesDisableBackups", 1);
  }
  if (atomic_load((unsigned int *)&self->_fileProtectionClass))
  {
    signed int v20 = atomic_load((unsigned int *)&self->_fileProtectionClass);
    xpc_dictionary_set_int64(v4, "CFPreferencesFileProtectionClass", v20);
  }
  unsigned __int8 v21 = atomic_load((unsigned __int8 *)&self->_restrictedAccess);
  if (v21) {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesRestrictedReadability", 1);
  }
  if (byte_1EC090E03) {
    xpc_dictionary_set_BOOL(v4, "kCFPreferencesTestingSimulateSlowFilesystem", 1);
  }
  if (atomic_load(&dword_1EC090E0C))
  {
    signed int v23 = atomic_load(&dword_1EC090E0C);
    xpc_dictionary_set_int64(v4, "kCFPreferencesTestingSimulateOutOfDiskSpace", v23);
  }
  return v4;
}

- (__CFString)userIdentifier
{
  return self->userIdentifier;
}

- (__CFString)domainIdentifier
{
  return self->domainIdentifier;
}

- (__CFString)container
{
  return self->container;
}

- (void)writeFailedForKeys:(__CFString *)a3 values:(uint64_t)a4 count:
{
  if (a1)
  {
    uint64_t v4 = a4;
    if (a4 >= 1)
    {
      do
      {
        int v8 = *a2;
        if (*a2)
        {
          atomic_store(1u, (unsigned __int8 *)(a1 + 110));
          os_unfair_lock_lock(&locallySetDictLock);
          if (!atomic_load((unint64_t *)(a1 + 88))) {
            atomic_store((unint64_t)CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks), (unint64_t *)(a1 + 88));
          }
          uint64_t v10 = (__CFDictionary *)atomic_load((unint64_t *)(a1 + 88));
          if (*a3) {
            unsigned __int8 v11 = *a3;
          }
          else {
            unsigned __int8 v11 = @"MagicRemovedValue";
          }
          CFDictionarySetValue(v10, v8, v11);
          os_unfair_lock_unlock(&locallySetDictLock);
        }
        ++a3;
        ++a2;
        --v4;
      }
      while (v4);
    }
  }
}

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  -[CFPrefsPlistSource _sharedCleanup](self);
  v3.receiver = self;
  v3.super_class = (Class)CFPrefsPlistSource;
  [(CFPrefsSource *)&v3 dealloc];
}

- (void)_sharedCleanup
{
  if (a1)
  {
    if (atomic_load(a1 + 12))
    {
      objc_super v3 = (void *)atomic_load(a1 + 12);
      free(v3);
    }
    uint64_t v4 = (const void *)a1[9];
    if (v4)
    {
      a1[9] = 0;
      CFRelease(v4);
    }
    unsigned __int8 v5 = (const void *)a1[8];
    if (v5)
    {
      a1[8] = 0;
      CFRelease(v5);
    }
    int v6 = (const void *)a1[10];
    if (v6)
    {
      a1[10] = 0;
      CFRelease(v6);
    }
    if (atomic_load(a1 + 11))
    {
      int v8 = (const void *)atomic_load(a1 + 11);
      CFRelease(v8);
    }
  }
}

- (void)transitionIntoDirectModeIfNeededWithRetryBlock:(id)a3
{
  if (-[CFPrefsPlistSource _shouldEnableDirectMode]((BOOL)self))
  {
    unsigned __int8 v5 = [(CFPrefsSource *)self copyOSLogDescription];
    int v6 = _CFPrefsClientLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CFPrefsPlistSource transitionIntoDirectModeIfNeededWithRetryBlock:]();
    }
    CFRelease(v5);
    os_unfair_lock_lock(&self->super._lock);
    [(CFPrefsPlistSource *)self alreadylocked_clearCache];
    atomic_store(0, (unsigned __int8 *)&self->_byteCountLimitExceeded);
    atomic_store(1u, (unsigned __int8 *)&self->_directMode);
    os_unfair_lock_unlock(&self->super._lock);
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (BOOL)_shouldEnableDirectMode
{
  if (result)
  {
    BOOL v1 = result;
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(result + 112));
    if ((v2 & 1) != 0 && !_CFPrefsDirectMode())
    {
      unsigned __int8 v3 = atomic_load((unsigned __int8 *)(v1 + 113));
      return (v3 & 1) == 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)alreadylocked_createObserverUpdateMessageWithOperation:(int)a3 forRole:(int *)a4
{
  if (!a3) {
    return 0;
  }
  id v7 = [(CFPrefsPlistSource *)self createSynchronizeMessage];
  xpc_dictionary_set_int64(v7, "CFPreferencesOperation", a3);
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_directMode);
  if ((v8 & 1) != 0 || _CFPrefsDirectMode())
  {
    int v9 = 3;
  }
  else if (xpc_user_sessions_enabled() {
         && (CFEqual(self->userIdentifier, @"kCFPreferencesAnyUser")
  }
          || !xpc_user_sessions_get_session_uid()
          && CFEqual(self->userIdentifier, @"kCFPreferencesCurrentUser")))
  {
    int v9 = 2;
  }
  else
  {
    int v9 = 1;
  }
  *a4 = v9;
  return v7;
}

- (int)alreadylocked_updateObservingRemoteChanges
{
  os_unfair_lock_assert_owner(&self->super._lock);
  if (![(__CFPrefsWeakObservers *)self->super._observers approximateCount]
    || (unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_observing), (v3 & 1) != 0))
  {
    if ([(__CFPrefsWeakObservers *)self->super._observers approximateCount]) {
      return 0;
    }
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_observing);
    if ((v4 & 1) == 0) {
      return 0;
    }
    atomic_store(0, (unsigned __int8 *)&self->_observing);
  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)&self->_observing);
  }
  if ([(CFPrefsPlistSource *)self isVolatile]) {
    return 0;
  }
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_observing);
  if (v6) {
    return 7;
  }
  else {
    return 8;
  }
}

- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6
{
  uint64_t v57 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->super._lock);
  if (_CFPrefsTestingFlags) {
    [(CFPrefsPlistSource *)self alreadylocked_clearCache];
  }
  uint64_t v10 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
  if (!v10)
  {
    BOOL v13 = 1;
LABEL_8:
    char cf = v13;
    goto LABEL_9;
  }
  unsigned int v11 = atomic_load(v10);
  unsigned int v12 = atomic_load((unsigned int *)&sentinelGeneration);
  if (v11 != v12)
  {
    unsigned int v14 = atomic_load(&self->super.lastKnownShmemState);
    BOOL v13 = v11 != v14;
    goto LABEL_8;
  }
  char cf = 0;
LABEL_9:
  if (a5 < 1)
  {
LABEL_42:
    BOOL cfb = 0;
    goto LABEL_71;
  }
  uint64_t v15 = 0;
  int v16 = 0;
  char v17 = 0;
  do
  {
    CFStringRef v18 = a4[v15];
    if (!_CFPrefsTestingFlags)
    {
      __int16 v19 = a3[v15];
      unint64_t v20 = atomic_load((unint64_t *)&self->_locallySetDict);
      BOOL v26 = v20 == 0;
      char v21 = cf;
      if (!v26) {
        char v21 = 1;
      }
      if (v21)
      {
LABEL_17:
        if (!a4[v15]) {
          goto LABEL_19;
        }
LABEL_18:
        v16 |= -[CFPrefsPlistSource _logLoudlyAboutSettingKey:]((BOOL)self, v18);
        char v17 = 1;
        goto LABEL_19;
      }
      dict = self->super._dict;
      if (dict)
      {
        Value = CFDictionaryGetValue(dict, a4[v15]);
        BOOL v24 = Value != 0;
        BOOL v25 = v19 != 0;
        if (Value) {
          BOOL v26 = v19 == 0;
        }
        else {
          BOOL v26 = 1;
        }
        if (!v26)
        {
          if (!CFEqual(Value, v19)) {
            goto LABEL_17;
          }
LABEL_32:
          uint64_t v27 = _CFPrefsClientLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v28 = [(CFPrefsSource *)self copyOSLogDescription];
            _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
            uint64_t v29 = _CFPrefsClientLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v54 = (uint64_t)v28;
              __int16 v55 = 2114;
              CFStringRef v56 = v18;
              _os_log_debug_impl(&dword_182B90000, v29, OS_LOG_TYPE_DEBUG, "%{public}@ skipping setting already-present value for key %{public}@", buf, 0x16u);
            }
            _CFSetTSD(0xFu, 0, 0);
            CFRelease(v28);
          }
          a4[v15] = 0;
          goto LABEL_19;
        }
      }
      else
      {
        BOOL v24 = 0;
        BOOL v25 = v19 != 0;
      }
      if (v24 || !self->super._dict || v25) {
        goto LABEL_17;
      }
      goto LABEL_32;
    }
    if (a4[v15]) {
      goto LABEL_18;
    }
LABEL_19:
    ++v15;
  }
  while (a5 != v15);
  if ((v17 & 1) == 0) {
    goto LABEL_42;
  }
  v30 = _CFPrefsClientLog();
  if ((os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG) | v16))
  {
    cfa = [(CFPrefsSource *)self copyOSLogDescription];
    CFIndex v31 = _CFPrefsClientLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if ((v16 & 1) == 0) {
        goto LABEL_41;
      }
LABEL_44:
      CFStringRef v33 = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    else
    {
      Mutable = 0;
      if (v16) {
        goto LABEL_44;
      }
LABEL_41:
      CFStringRef v33 = 0;
    }
    int64_t v34 = a5;
    CFDataRef v35 = (const void **)a4;
    v36 = a3;
    do
    {
      if (*v35)
      {
        if (v33 && -[CFPrefsPlistSource _logLoudlyAboutSettingKey:]((BOOL)self, *v35))
        {
          if (*v36) {
            v37 = (__CFString *)*v36;
          }
          else {
            v37 = @"nil";
          }
          CFDictionarySetValue(v33, *v35, v37);
        }
        else if (Mutable)
        {
          if (*v36) {
            v38 = (__CFString *)*v36;
          }
          else {
            v38 = @"nil";
          }
          CFDictionarySetValue(Mutable, *v35, v38);
        }
      }
      ++v36;
      ++v35;
      --v34;
    }
    while (v34);
    v39 = (void *)MEMORY[0x185311AE0]();
    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
    if (Mutable)
    {
      if (CFDictionaryGetCount(Mutable) >= 1)
      {
        [(__CFDictionary *)Mutable description];
        int v40 = _CFPrefsClientLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
          -[CFPrefsPlistSource alreadylocked_setPrecopiedValues:forKeys:count:from:]();
        }
      }
      CFRelease(Mutable);
    }
    if (v33)
    {
      if (CFDictionaryGetCount(v33) >= 1)
      {
        uint64_t v41 = [(__CFDictionary *)v33 description];
        v42 = _CFPrefsClientLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v54 = v41;
          __int16 v55 = 2114;
          CFStringRef v56 = cfa;
          _os_log_impl(&dword_182B90000, v42, OS_LOG_TYPE_DEFAULT, "setting %{public}@ in %{public}@", buf, 0x16u);
        }
      }
      CFRelease(v33);
    }
    CFRelease(cfa);
    _CFSetTSD(0xFu, 0, 0);
  }
  BOOL cfb = -[CFPrefsPlistSource sendMessageSettingValues:forKeys:count:]((uint64_t)self, (__objc2_class ***)a3, (__objc2_class ***)a4, a5) != 1;
LABEL_71:
  unint64_t v43 = atomic_load((unint64_t *)&self->_locallySetDict);
  if (!v43 && _CFPrefsReadOnly())
  {
    os_unfair_lock_lock(&locallySetDictLock);
    atomic_store((unint64_t)CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks), (unint64_t *)&self->_locallySetDict);
    os_unfair_lock_unlock(&locallySetDictLock);
  }
  if (a5 >= 1)
  {
    while (2)
    {
      CFStringRef v44 = *a4;
      if (!*a4) {
        goto LABEL_85;
      }
      v45 = (__CFString *)*a3;
      v46 = self->super._dict;
      if (*a3)
      {
        if (!v46)
        {
          v46 = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          self->super._dict = v46;
        }
        CFDictionarySetValue(v46, v44, v45);
        if (!atomic_load((unint64_t *)&self->_locallySetDict)) {
          goto LABEL_85;
        }
      }
      else
      {
        if (v46) {
          CFDictionaryRemoveValue(v46, *a4);
        }
        unint64_t v48 = atomic_load((unint64_t *)&self->_locallySetDict);
        v45 = @"MagicRemovedValue";
        if (!v48)
        {
LABEL_85:
          ++a3;
          ++a4;
          if (!--a5) {
            goto LABEL_86;
          }
          continue;
        }
      }
      break;
    }
    os_unfair_lock_lock(&locallySetDictLock);
    v49 = (__CFDictionary *)atomic_load((unint64_t *)&self->_locallySetDict);
    CFDictionarySetValue(v49, v44, v45);
    os_unfair_lock_unlock(&locallySetDictLock);
    goto LABEL_85;
  }
LABEL_86:
  if (cfb) {
    atomic_fetch_add(&self->super._generationCount, 1uLL);
  }
}

- (BOOL)isVolatile
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_volatile);
  return v2 & 1;
}

- (uint64_t)sendMessageSettingValues:(__objc2_class *)a3 forKeys:(uint64_t)a4 count:
{
  uint64_t v29 = *(void *)off_1ECE0A5B0;
  if (result)
  {
    id v7 = (unsigned __int8 *)result;
    if (_CFPrefsReadOnly()) {
      return 0;
    }
    unsigned __int8 v8 = atomic_load(v7 + 105);
    if (v8 & 1) != 0 || (unsigned __int8 v9 = atomic_load(v7 + 106), (v9))
    {
      uint64_t v15 = (const void *)[v7 copyOSLogDescription];
      if (a4 >= 1)
      {
        do
        {
          if (*a3)
          {
            unsigned __int8 v16 = atomic_load(v7 + 106);
            if (v16)
            {
              _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
              CFStringRef v18 = _CFPrefsClientLog();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                char v21 = *a2;
                int v22 = *a3;
                *(_DWORD *)buf = 138478339;
                *(void *)&uint8_t buf[4] = v21;
                __int16 v25 = 2113;
                BOOL v26 = v22;
                __int16 v27 = 2114;
                v28 = v15;
                _os_log_error_impl(&dword_182B90000, v18, OS_LOG_TYPE_ERROR, "attempt to set %{private}@ for key in %{private}@ in read-only (due to a previously logged write error) preferences domain %{public}@", buf, 0x20u);
              }
            }
            else
            {
              _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
              char v17 = _CFPrefsClientLog();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                __int16 v19 = *a2;
                unint64_t v20 = *a3;
                *(_DWORD *)buf = 138478339;
                *(void *)&uint8_t buf[4] = v19;
                __int16 v25 = 2113;
                BOOL v26 = v20;
                __int16 v27 = 2114;
                v28 = v15;
                _os_log_error_impl(&dword_182B90000, v17, OS_LOG_TYPE_ERROR, "attempt to set %{private}@ for key in %{private}@ in non-persistent preferences domain %{public}@", buf, 0x20u);
              }
            }
            _CFSetTSD(0xFu, 0, 0);
          }
          ++a2;
          ++a3;
          --a4;
        }
        while (a4);
      }
      CFRelease(v15);
      return 2;
    }
    else
    {
      uint64_t v10 = (void *)[v7 createSynchronizeMessage];
      if (v10)
      {
        unsigned int v11 = v10;
        *(void *)buf = 0;
        int v12 = _CFPrefsEncodeKeyValuePairsIntoMessage(v10, a3, a2, a4, buf);
        int v13 = _CFPrefsDomainSizeAcceptabilityForByteCount(*(unint64_t *)buf);
        -[CFPrefsPlistSource handlePossibleOversizedMessage:forWritingKeys:values:count:](v7, v13, (const void **)a3, (const void **)a2, a4);
        unsigned __int8 v14 = atomic_load(v7 + 112);
        if (v14 & 1) == 0 || _CFPrefsDirectMode() || (unsigned __int8 v23 = atomic_load(v7 + 113), (v23))
        {
          if (((v12 ^ 1) & 1) == 0 && -[CFPrefsPlistSource attachAccessTokenToMessage:accessType:]((BOOL)v7, v11, 1))
          {
            -[CFPrefsPlistSource addPIDImpersonationIfNecessary:](v7, v11);
            -[CFPrefsPlistSource sendFullyPreparedMessage:toConnection:settingValues:forKeys:count:retryCount:]((uint64_t)v7, (uint64_t)v11, 0, (uint64_t)a2, (uint64_t)a3, a4, 0);
          }
        }
        xpc_release(v11);
        return 0;
      }
      return 3;
    }
  }
  return result;
}

- (BOOL)_logLoudlyAboutSettingKey:(BOOL)result
{
  if (result)
  {
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(result + 105));
    if (v2) {
      return 0;
    }
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)(result + 106));
    if (v3) {
      return 0;
    }
    else {
      return CFEqual(cf1, @"AppleLanguages") || CFEqual(cf1, @"AppleLocale") != 0;
    }
  }
  return result;
}

- (__CFArray)alreadylocked_copyKeyList
{
  uint64_t v14 = *(void *)off_1ECE0A5B0;
  if (byte_1EC090E01) {
    [(CFPrefsPlistSource *)self alreadylocked_clearCache];
  }
  v10[0] = off_1ECE0A5A0;
  v10[1] = 3221225472;
  unsigned int v11 = __alreadylocked_requestNewDataIfStale_block_invoke;
  int v12 = &unk_1ECDB0298;
  int v13 = self;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if ((v3 & 1) == 0)
  {
    unsigned __int8 v4 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
    if (!v4
      || (unsigned int v5 = atomic_load(v4), v6 = atomic_load((unsigned int *)&sentinelGeneration), v5 != v6)
      && (unsigned int v7 = atomic_load(&self->super.lastKnownShmemState), v5 != v7))
    {
      os_unfair_lock_assert_owner(&self->super._lock);
      v11((uint64_t)v10);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)CFPrefsPlistSource;
  return [(CFPrefsSource *)&v9 alreadylocked_copyKeyList];
}

- (BOOL)isByHost
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isByHost);
  return v2 & 1;
}

- (void)setFileProtectionClass:(int)a3
{
}

- (void)setAccessRestricted:(BOOL)a3
{
}

- (void)setDaemonCacheEnabled:(BOOL)a3
{
}

- (void)goVolatileAfterTryingToWriteKeys:(__CFString *)a3 values:(uint64_t)a4 count:
{
  if (a1)
  {
    -[CFPrefsPlistSource writeFailedForKeys:values:count:](a1, a2, a3, a4);
    atomic_store(1u, (unsigned __int8 *)(a1 + 105));
  }
}

- (BOOL)isDirectModeEnabled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_directMode);
  return v2 & 1;
}

- (void)goReadOnlyAfterTryingToWriteKeys:(__CFString *)a3 values:(uint64_t)a4 count:
{
  if (a1)
  {
    -[CFPrefsPlistSource writeFailedForKeys:values:count:](a1, a2, a3, a4);
    atomic_store(1u, (unsigned __int8 *)(a1 + 106));
  }
}

- (uint64_t)handleErrorReply:(void *)a3 toMessage:(int)a4 retryCount:(uint64_t)a5 retryContinuation:
{
  if (result) {
    return -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:](result, a2, a3, 0, 0, 0, a4, a5);
  }
  return result;
}

void __81__CFPrefsPlistSource_handlePossibleOversizedMessage_forWritingKeys_values_count___block_invoke()
{
  LocalCenter = CFNotificationCenterGetLocalCenter();

  CFNotificationCenterPostNotification(LocalCenter, @"com.apple.CFPreferences.byteCountLimitReached", 0, 0, 1u);
}

void __105__CFPrefsPlistSource_handleErrorReply_toMessage_settingKeys_toValues_count_retryCount_retryContinuation___block_invoke()
{
  v0 = _CFPrefsClientLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __105__CFPrefsPlistSource_handleErrorReply_toMessage_settingKeys_toValues_count_retryCount_retryContinuation___block_invoke_cold_1();
  }
}

- (BOOL)servedByUserSessionDaemon
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_directMode);
  return (v2 & 1) == 0
      && !_CFPrefsDirectMode()
      && (!xpc_user_sessions_enabled()
       || !CFEqual(self->userIdentifier, @"kCFPreferencesAnyUser")
       && (xpc_user_sessions_get_session_uid()
        || !CFEqual(self->userIdentifier, @"kCFPreferencesCurrentUser")));
}

void __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke_2(uint64_t a1)
{
  xpc_object_t v2 = xpc_copy(*(xpc_object_t *)(a1 + 32));
  unsigned __int8 v3 = v2;
  if (byte_1EC090E04) {
    xpc_dictionary_set_BOOL(v2, "PreviousMessageInjectedFailure", 1);
  }
  BOOL v4 = -[CFPrefsPlistSource attachAccessTokenToMessage:accessType:](*(void *)(a1 + 40), v3, 1);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4)
  {
    -[CFPrefsPlistSource sendFullyPreparedMessage:toConnection:settingValues:forKeys:count:retryCount:](*(void *)(a1 + 40), (int)v3, *(xpc_connection_t *)(a1 + 48));
  }
  else if (v5)
  {
    -[CFPrefsPlistSource writeFailedForKeys:values:count:](*(void *)(a1 + 40), *(const void ***)(a1 + 64), *(__CFString ***)(a1 + 56), *(void *)(a1 + 72));
    atomic_store(1u, (unsigned __int8 *)(v5 + 106));
  }

  xpc_release(v3);
}

- (void)requestPlistValidation
{
  v6[5] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    unsigned __int8 v1 = atomic_load(requestInvalidPropertyListDeletion);
    if (v1)
    {
      unsigned __int8 v3 = *(_xpc_connection_s ***)(a1 + 8);
      unsigned __int8 v4 = atomic_load((unsigned __int8 *)(a1 + 113));
      if ((v4 & 1) != 0 || _CFPrefsDirectMode())
      {
        int v5 = 3;
      }
      else if (xpc_user_sessions_enabled() {
             && (CFEqual(*(CFTypeRef *)(a1 + 64), @"kCFPreferencesAnyUser")
      }
              || !xpc_user_sessions_get_session_uid()
              && CFEqual(*(CFTypeRef *)(a1 + 64), @"kCFPreferencesCurrentUser")))
      {
        int v5 = 2;
      }
      else
      {
        int v5 = 1;
      }
      v6[0] = off_1ECE0A5A0;
      v6[1] = 3221225472;
      v6[2] = __44__CFPrefsPlistSource_requestPlistValidation__block_invoke;
      v6[3] = &unk_1ECE00348;
      v6[4] = a1;
      -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](v3, v5, (const void *)[(id)a1 userIdentifier], (uint64_t)v6);
    }
  }
}

void __44__CFPrefsPlistSource_requestPlistValidation__block_invoke(uint64_t a1, _xpc_connection_s *a2)
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  unsigned __int8 v4 = (void *)[*(id *)(a1 + 32) createSynchronizeMessage];
  if (v4)
  {
    int v5 = v4;
    if (-[CFPrefsPlistSource attachAccessTokenToMessage:accessType:](*(void *)(a1 + 32), v4, 0))
    {
      -[CFPrefsPlistSource addPIDImpersonationIfNecessary:](*(void **)(a1 + 32), v5);
      xpc_dictionary_set_BOOL(v5, "ValidatePlist", 1);
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
      unsigned int v6 = _CFPrefsClientLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned __int8 v8 = 0;
        _os_log_impl(&dword_182B90000, v6, OS_LOG_TYPE_INFO, "Requesting validation of plist after invalid data detected", v8, 2u);
      }
      _CFSetTSD(0xFu, 0, 0);
      global_queue = dispatch_get_global_queue(17, 0);
      xpc_connection_send_message_with_reply(a2, v5, global_queue, &__block_literal_global_53);
    }
    xpc_release(v5);
  }
}

void __88__CFPrefsPlistSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (byte_1EC090E04) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "PreviousMessageInjectedFailure", 1);
  }
  int v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  unsigned int v7 = *(BOOL **)(a1 + 56);

  -[CFPrefsPlistSource sendRequestNewDataMessage:toConnection:retryCount:error:](v4, v5, v6, a2, v7);
}

- (void)alreadylocked_clearCache
{
  os_unfair_lock_assert_owner(&self->super._lock);
  dict = self->super._dict;
  if (dict && CFDictionaryGetCount(dict) && !atomic_load((unint64_t *)&self->_locallySetDict))
  {
    CFRelease(self->super._dict);
    self->super._dict = 0;
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&self->super._generationCount);
    atomic_store(0, &self->super.lastKnownShmemState);
    atomic_store(0, (unint64_t *)&self->super.shmemEntry);
  }
}

- (int64_t)alreadylocked_generationCount
{
  uint64_t v13 = *(void *)off_1ECE0A5B0;
  if (byte_1EC090E01) {
    [(CFPrefsPlistSource *)self alreadylocked_clearCache];
  }
  v9[0] = off_1ECE0A5A0;
  v9[1] = 3221225472;
  uint64_t v10 = __alreadylocked_requestNewDataIfStale_block_invoke;
  unsigned int v11 = &unk_1ECDB0298;
  int v12 = self;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if ((v3 & 1) == 0)
  {
    uint64_t v4 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
    if (!v4
      || (unsigned int v5 = atomic_load(v4), v6 = atomic_load((unsigned int *)&sentinelGeneration), v5 != v6)
      && (unsigned int v7 = atomic_load(&self->super.lastKnownShmemState), v5 != v7))
    {
      os_unfair_lock_assert_owner(&self->super._lock);
      v10((uint64_t)v9);
    }
  }
  return atomic_load((unint64_t *)&self->super._generationCount);
}

- (int64_t)generationCount
{
  uint64_t v13 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_lock(&self->super._lock);
  if (byte_1EC090E01) {
    [(CFPrefsPlistSource *)self alreadylocked_clearCache];
  }
  v9[0] = off_1ECE0A5A0;
  v9[1] = 3221225472;
  uint64_t v10 = __alreadylocked_requestNewDataIfStale_block_invoke;
  unsigned int v11 = &unk_1ECDB0298;
  int v12 = self;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if ((v3 & 1) == 0)
  {
    uint64_t v4 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
    if (!v4
      || (unsigned int v5 = atomic_load(v4), v6 = atomic_load((unsigned int *)&sentinelGeneration), v5 != v6)
      && (unsigned int v7 = atomic_load(&self->super.lastKnownShmemState), v5 != v7))
    {
      os_unfair_lock_assert_owner(&self->super._lock);
      v10((uint64_t)v9);
    }
  }
  os_unfair_lock_unlock(&self->super._lock);
  return atomic_load((unint64_t *)&self->super._generationCount);
}

- (void)setDomainIdentifier:.cold.1()
{
}

- (void)alreadylocked_setPrecopiedValues:forKeys:count:from:.cold.1()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_7_1(&dword_182B90000, v0, v1, "setting %{private}@ in %{public}@");
}

- (void)createSynchronizeMessage
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  int v4 = 136446466;
  uint64_t v5 = a1;
  __int16 v6 = 2082;
  uint64_t error_description = container_get_error_description();
  _os_log_error_impl(&dword_182B90000, a3, OS_LOG_TYPE_ERROR, "Could not lookup group container %{public}s: %{public}s", (uint8_t *)&v4, 0x16u);
}

- (void)transitionIntoDirectModeIfNeededWithRetryBlock:.cold.1()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_23(&dword_182B90000, v0, v1, "%{public}@: Transitioning into direct mode", v2, v3, v4, v5, v6);
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.1()
{
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.2()
{
  OUTLINED_FUNCTION_6_1();
  _os_log_fault_impl(&dword_182B90000, v0, OS_LOG_TYPE_FAULT, "cfprefsd crashed, retrying message", v1, 2u);
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.3()
{
  __assert_rtn("-[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:]", "CFPrefsPlistSource.m", 1071, "xpc_get_type(reply) == XPC_TYPE_DICTIONARY");
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.4()
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  OUTLINED_FUNCTION_1_14();
  _os_log_fault_impl(&dword_182B90000, v0, OS_LOG_TYPE_FAULT, "cfprefsd has asked to provide an access token for %{private}s too many times. Bailing out.", v1, 0xCu);
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.5()
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  OUTLINED_FUNCTION_1_14();
  _os_log_fault_impl(&dword_182B90000, v0, OS_LOG_TYPE_FAULT, "cfprefsd has asked to create directory for %{private}s too many times. Bailing out.", v1, 0xCu);
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.6()
{
  OUTLINED_FUNCTION_6_1();
  _os_log_error_impl(&dword_182B90000, v0, OS_LOG_TYPE_ERROR, "cfprefsd required creation of a directory, but failed to provide the path.", v1, 2u);
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.7()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_23(&dword_182B90000, v0, v1, "Failed to compute parent directory path for %{private}s.", v2, v3, v4, v5, v6);
}

- (void)handleErrorReply:(uint8_t *)buf toMessage:(os_log_t)log settingKeys:toValues:count:retryCount:retryContinuation:.cold.8(uint64_t a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v4 = *a2;
  *(_DWORD *)buf = 136380931;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v4;
  _os_log_error_impl(&dword_182B90000, log, OS_LOG_TYPE_ERROR, "Failed to create directory %{private}s because of %{darwin.errno}d.", buf, 0x12u);
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.9()
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  OUTLINED_FUNCTION_1_14();
  _os_log_debug_impl(&dword_182B90000, v0, OS_LOG_TYPE_DEBUG, "Successfully created directory %{private}s. Retrying write.", v1, 0xCu);
}

- (void)handlePossibleOversizedMessage:(uint64_t)a1 forWritingKeys:values:count:.cold.1(uint64_t a1)
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  int v2 = 138543618;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_5_2();
  _os_log_debug_impl(&dword_182B90000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: Attempt to store >= %d bytes of data in CFPreferences/NSUserDefaults was allowed by virtue of direct mode", (uint8_t *)&v2, 0x12u);
}

- (void)handlePossibleOversizedMessage:(uint64_t)a1 forWritingKeys:(const void *)a2 values:(const void *)a3 count:(CFIndex)a4 .cold.2(uint64_t a1, const void **a2, const void **a3, CFIndex a4)
{
  if ((xpc_user_sessions_enabled() & 1) != 0
    && !CFEqual(*(CFTypeRef *)(a1 + 64), @"kCFPreferencesAnyUser")
    && !xpc_user_sessions_get_session_uid())
  {
    CFEqual(*(CFTypeRef *)(a1 + 64), @"kCFPreferencesCurrentUser");
  }
  __CFPREFERENCES_HAS_DETECTED_THIS_APP_TRYING_TO_STORE_TOO_MUCH_DATA__((void *)a1, a2, a3, a4);
  atomic_store(1u, (unsigned __int8 *)(a1 + 112));
}

void __105__CFPrefsPlistSource_handleErrorReply_toMessage_settingKeys_toValues_count_retryCount_retryContinuation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  _os_log_error_impl(&dword_182B90000, v0, OS_LOG_TYPE_ERROR, "Could not connect to cfprefsd. No CFPreferences/NSUserDefaults changes will be saved", v1, 2u);
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.1()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_3_3(&dword_182B90000, v0, v1, "serialized validation data for %{public}@ was not a dictionary plist. Error: %{public}@");
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.2()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_23(&dword_182B90000, v0, v1, "A RequestNewData response gave an invalid plist. We'll return wrong data this time, but NOT going volatile. Sent a request to validate the plist in the daemon and remove it if invalid. %{public}@", v2, v3, v4, v5, v6);
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.3()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_23(&dword_182B90000, v0, v1, "plist diff for %{public}@ was invalid", v2, v3, v4, v5, v6);
}

- (void)handleReply:(os_log_t)log toRequestNewDataMessage:onConnection:retryCount:error:.cold.4(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_182B90000, log, OS_LOG_TYPE_ERROR, "failed to map file from disk for %{public}@. error: %{darwin.errno}d", (uint8_t *)&v3, 0x12u);
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.5()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_23(&dword_182B90000, v0, v1, "bad plist data: %{public}@", v2, v3, v4, v5, v6);
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.6()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_3_3(&dword_182B90000, v0, v1, "file read from disk for %{public}@ was not a plist. Error: %{public}@");
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.7()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_23(&dword_182B90000, v0, v1, "plist read from disk for %{public}@ was not a dictionary", v2, v3, v4, v5, v6);
}

- (void)handleReply:(os_log_t)log toRequestNewDataMessage:onConnection:retryCount:error:.cold.8(int *a1, uint8_t *buf, os_log_t log)
{
  int v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl(&dword_182B90000, log, OS_LOG_TYPE_ERROR, "failed to lstat plist fd: %{darwin.errno}d.", buf, 8u);
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.9()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_23(&dword_182B90000, v0, v1, "serialized plist for %{public}@ was not a dictionary", v2, v3, v4, v5, v6);
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.10()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_23(&dword_182B90000, v0, v1, "bad plist data: %{public}@", v2, v3, v4, v5, v6);
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.11()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_3_3(&dword_182B90000, v0, v1, "serialized data for %{public}@ was not a plist. Error: %{public}@");
}

@end