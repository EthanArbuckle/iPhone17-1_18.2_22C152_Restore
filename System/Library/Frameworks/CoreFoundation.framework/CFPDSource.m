@interface CFPDSource
- (BOOL)_getUncanonicalizedPath:(BOOL)result;
- (BOOL)byHost;
- (BOOL)enqueueNewKey:(id)a3 value:(id)a4 encoding:(int)a5 inBatch:(BOOL)a6 fromMessage:(id)a7;
- (BOOL)getUncanonicalizedPath:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (BOOL)managed;
- (BOOL)shouldBePurgable;
- (BOOL)validateSandboxForWrite:(const char *)a3 containerPath:;
- (CFPDSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 byHost:(BOOL)a5 managed:(BOOL)a6 shmemIndex:(signed __int16)a7 daemon:(id)a8;
- (CFStringRef)_copyUncanonicalizedPath;
- (__CFString)cloudConfigurationPath;
- (__CFString)container;
- (__CFString)copyUncanonicalizedPath;
- (__CFString)debugDump;
- (__CFString)domain;
- (__CFString)user;
- (const)_canTrustUserPropertyForPOSIXPermissionCheckForAccessType:(const __CFString *)result;
- (const)endHandlingRequest;
- (const)hasObservers;
- (id)acceptMessage:(id)a3;
- (id)copyPropertyListValidatingPlist:(BOOL)a3;
- (id)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:(BOOL)a3 andReturnFileUID:(unsigned int *)a4 andMode:(unsigned __int16 *)a5;
- (id)createDiskWrite;
- (id)description;
- (int)cacheFileInfoForWriting:(BOOL)a3 euid:(unsigned int)a4 egid:(unsigned int)a5 didCreate:(BOOL *)a6;
- (int)validateMessage:(id)a3 withNewKey:(id)a4 newValue:(id)a5 plistIsAvailableToRead:(BOOL)a6 containerPath:(const char *)a7 fileUID:(unsigned int)a8 mode:(unsigned __int16)a9 diagnosticMessage:(const char *)a10;
- (signed)shmemIndex;
- (uint64_t)approximatePlistSizeIncludingPendingChanges;
- (uint64_t)closeFileDescriptors;
- (uint64_t)isEmpty;
- (uint64_t)openActualPath;
- (uint64_t)openPropertyListWithoutDrainingPendingChangesOrValidatingPlistAndReturnFileUID:(mode_t *)a3 andMode:;
- (uint64_t)shouldStayDirtyAfterOpenForWritingFailureWithErrno:(uint64_t)a1;
- (uint64_t)tryEndAccessingPlist;
- (uint64_t)validateAccessToken:(int)a3 accessType:;
- (uint64_t)validatePOSIXPermissionsForMessage:(int)a3 accessType:(int)a4 fileUID:(int)a5 mode:(unsigned char *)a6 fullyValidated:;
- (uint64_t)validateSandboxForRead:(const char *)a3 containerPath:;
- (uint64_t)validateSandboxPermissionsForMessage:(const char *)a3 containerPath:(int)a4 accessType:;
- (void)asyncNotifyObserversOfWriteFromConnection:(id)a3 message:(id)a4;
- (void)attachSizeWarningsToReply:(unint64_t)a3 forByteCount:;
- (void)beginHandlingRequest;
- (void)cacheFileInfo;
- (void)cleanUpIfNecessaryAfterCreatingPlist;
- (void)clearCacheForReason:(__CFString *)a3;
- (void)clearPlist;
- (void)createDiskWrite;
- (void)dealloc;
- (void)drainPendingChanges;
- (void)endHandlingRequest;
- (void)finishedNonRequestWriteWithResult:(__CFDictionary *)a3;
- (void)handleAvoidCache;
- (void)handleDeviceUnlock;
- (void)handleEUIDorEGIDMismatch;
- (void)handleNeverCache;
- (void)handleNoPlistFound;
- (void)handleSynchronous;
- (void)handleWritingResult:(__CFDictionary *)a3;
- (void)lock;
- (void)lockedAsync:(id)a3;
- (void)lockedSync:(id)a3;
- (void)markNeedsToReloadFromDiskDueToFailedWrite;
- (void)observingConnectionWasInvalidated:(id)a3;
- (void)observingConnectionsLockedSync:(os_unfair_lock_s *)a1;
- (void)processEndOfMessageIntendingToRemoveSource:(BOOL *)a3 replacingWithTombstone:(id *)a4;
- (void)respondToFileWrittenToBehindOurBack;
- (void)setDirty:(BOOL)a3;
- (void)setManagedPreferencesUseContainer:(BOOL)a3;
- (void)setObserved:(void *)a3 bySenderOfMessage:;
- (void)setPlist:(int)a3 owner:(unsigned int)a4 mode:;
- (void)setUncanonicalizedPathCached:(BOOL)a3;
- (void)stopNotifyingObserver:(uint64_t)a1;
- (void)syncWriteToDisk;
- (void)syncWriteToDiskAndFlushCacheForReason:(__CFString *)a3;
- (void)unlock;
- (void)updateShmemEntry;
@end

@implementation CFPDSource

- (__CFString)copyUncanonicalizedPath
{
  p_uncanonicalizedPathCacheLock = &self->_uncanonicalizedPathCacheLock;
  os_unfair_lock_lock(&self->_uncanonicalizedPathCacheLock);
  uncanonicalizedPathCache = self->_uncanonicalizedPathCache;
  if (uncanonicalizedPathCache)
  {
    v5 = (__CFString *)CFRetain(uncanonicalizedPathCache);
    os_unfair_lock_unlock(p_uncanonicalizedPathCacheLock);
    if (v5) {
      return v5;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_uncanonicalizedPathCacheLock);
  }

  return (__CFString *)-[CFPDSource _copyUncanonicalizedPath]((CFStringRef)self);
}

void __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  int v4 = *(unsigned __int8 *)(a1 + 40);
  v5 = *(__CFSet **)(a2 + 24);
  if (v4)
  {
    if (!v5)
    {
      CFSetCallBacks v6 = *(CFSetCallBacks *)byte_1ECE10578;
      *(void *)(a2 + 24) = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &v6);
      v5 = *(__CFSet **)(a2 + 24);
    }
    CFSetAddValue(v5, *(const void **)(a1 + 32));
  }
  else if (v5)
  {
    CFSetRemoveValue(v5, *(const void **)(a1 + 32));
    if (!CFSetGetCount(*(CFSetRef *)(a2 + 24)))
    {
      CFRelease(*(CFTypeRef *)(a2 + 24));
      *(void *)(a2 + 24) = 0;
    }
  }
}

CFDictionaryRef __29__CFPDSource_createDiskWrite__block_invoke(uint64_t a1)
{
  values[5] = *(void **)off_1ECE0A5B0;
  uint64_t v2 = a1 + 40;
  int v3 = _CFPrefsWritePlistToFDThenClose(*(void **)(a1 + 32), *(_DWORD *)(v2 + 24), *(_DWORD *)(v2 + 28), *(_DWORD *)(v2 + 32), *(_WORD *)(v2 + 40), *(unsigned __int8 *)(v2 + 42), *(_DWORD *)(v2 + 36), *(const char **)(v2 + 16), *(void *)(*(void *)(a1 + 40) + 56));
  int v4 = *(os_unfair_lock_s **)v2;
  if (v3 == 47837 && v4)
  {
    values[0] = off_1ECE0A5A0;
    values[1] = (void *)3221225472;
    values[2] = __55__CFPDSource_markNeedsToReloadFromDiskDueToFailedWrite__block_invoke;
    values[3] = &unk_1ECDB0298;
    values[4] = v4;
    [(os_unfair_lock_s *)v4 lockedAsync:values];
    int v4 = *(os_unfair_lock_s **)v2;
  }
  os_unfair_lock_unlock(v4 + 26);

  int v5 = *(_DWORD *)(a1 + 76);
  if ((v5 & 0x80000000) == 0) {
    close(v5);
  }
  free(*(void **)(a1 + 56));

  if (!v3) {
    return 0;
  }
  values[0] = (void *)v3;
  return CFDictionaryCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const void **)v2, (const void **)values, 1, 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  return _CFPrefsEqualKeyOrSource(self, a3);
}

- (CFPDSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 byHost:(BOOL)a5 managed:(BOOL)a6 shmemIndex:(signed __int16)a7 daemon:(id)a8
{
  uint64_t v18 = *(void *)off_1ECE0A5B0;
  v17.receiver = self;
  v17.super_class = (Class)CFPDSource;
  v14 = [(CFPDSource *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_cfprefsd = (CFPrefsDaemon *)a8;
    *(void *)&v14->_uncanonicalizedPathCacheLock._os_unfair_lock_opaque = 0;
    *(void *)&v14->_writeLock._os_unfair_lock_opaque = 0;
    *((unsigned char *)v14 + 142) &= ~2u;
    v14->_byHost = a5;
    v14->_domain = _internString(a3);
    v15->_userName = _internString(a4);
    v15->_managed = a6;
    v15->_generationShmemIndex = a7;
    *(void *)&v15->_parentFD = -1;
  }
  return v15;
}

- (CFStringRef)_copyUncanonicalizedPath
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  if (result)
  {
    BOOL v1 = (BOOL)result;
    bzero(cStr, 0x402uLL);
    if (-[CFPDSource _getUncanonicalizedPath:](v1, (UInt8 *)cStr))
    {
      CFStringEncoding v2 = CFStringFileSystemEncoding();
      return CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, cStr, v2);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)_getUncanonicalizedPath:(BOOL)result
{
  if (result)
  {
    uint64_t v3 = result;
    int v5 = *(__CFString **)(result + 40);
    uint64_t v4 = *(__CFString **)(result + 48);
    int v6 = *(unsigned __int8 *)(result + 138);
    CFStringRef v7 = (const __CFString *)[(id)result container];
    int v8 = *(unsigned __int8 *)(v3 + 139);
    int v9 = *(unsigned __int8 *)(v3 + 140);
    return +[CFPrefsDaemon _getUncanonicalizedSourcePath:withDomain:user:byHost:containerPath:managed:managedUsesContainer:]((uint64_t)CFPrefsDaemon, a2, v4, v5, v6, v7, v8, v9);
  }
  return result;
}

- (__CFString)container
{
  return 0;
}

- (signed)shmemIndex
{
  return self->_generationShmemIndex;
}

- (BOOL)managed
{
  return self->_managed;
}

- (__CFString)domain
{
  return self->_domain;
}

- (__CFString)user
{
  return self->_userName;
}

- (id)acceptMessage:(id)a3
{
  uint64_t v80 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(CFPDDataBuffer *)self->_plist purgable]) {
    -[CFPDSource acceptMessage:]();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  int v6 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(void *)&long long v74 = off_1ECE0A5A0;
    *((void *)&v74 + 1) = 3221225472;
    *(void *)&long long v75 = __DEBUG_REQUEST_block_invoke;
    *((void *)&v75 + 1) = &unk_1ECE00518;
    v76 = self;
    _extractCFPDBits(a3, 0, self, (uint64_t)&v74);
  }
  xpc_object_t v67 = 0;
  xpc_object_t v68 = 0;
  unsigned int v66 = 0;
  int64_t int64 = xpc_dictionary_get_int64(a3, "CFPreferencesOperation");
  int v8 = _CFPrefsDecodeKeyValuePairFromXPCMessage(a3, &v68, &v67, (int *)&v66);
  char v65 = 0;
  if (xpc_dictionary_get_BOOL(a3, "CFPreferencesAvoidCache")) {
    [(CFPDSource *)self syncWriteToDiskAndFlushCacheForReason:@"we're avoiding the cache"];
  }
  if (xpc_dictionary_get_BOOL(a3, "CFPreferencesRestrictedReadability")) {
    *((unsigned char *)self + 142) |= 0x10u;
  }
  if (xpc_dictionary_get_BOOL(a3, "CFPreferencesDisableBackups")) {
    *((unsigned char *)self + 142) |= 0x40u;
  }
  self->_fileProtectionClass = xpc_dictionary_get_int64(a3, "CFPreferencesFileProtectionClass");
  if (xpc_dictionary_get_BOOL(a3, "kCFPreferencesTestingSimulateSlowFilesystem")) {
    byte_1EC090E03 = 1;
  }
  atomic_store(xpc_dictionary_get_int64(a3, "kCFPreferencesTestingSimulateOutOfDiskSpace"), &dword_1EC090E0C);
  remote_connection = xpc_dictionary_get_remote_connection(a3);
  if (!remote_connection)
  {
    value = (_xpc_connection_s *)xpc_dictionary_get_value(a3, "connection");
    if (!value || (remote_connection = value, object_getClass(value) != (Class)off_1ECE0A678)) {
      -[CFPDSource acceptMessage:]();
    }
  }
  *(void *)&long long v74 = 0;
  long long v78 = 0u;
  long long v79 = 0u;
  data = (long long *)xpc_dictionary_get_data(a3, "CFPreferencesAuditToken", (size_t *)&v74);
  if (data && (void)v74 == 32)
  {
    long long v12 = data[1];
    long long v78 = *data;
    long long v79 = v12;
  }
  else
  {
    if (!xpc_dictionary_get_remote_connection(a3))
    {
      xpc_object_t v13 = xpc_dictionary_get_value(a3, "connection");
      if (!v13 || object_getClass(v13) != (Class)off_1ECE0A678) {
        -[CFPDSource acceptMessage:].cold.5();
      }
    }
    xpc_connection_get_audit_token();
  }
  bzero(v77, 0x400uLL);
  long long v74 = v78;
  long long v75 = v79;
  sandbox_container_path_for_audit_token();
  if (!v8)
  {
LABEL_38:
    int v14 = 0;
    goto LABEL_39;
  }
  if ((_CFPrefsReadOnly() & 1) == 0)
  {
    if (xpc_dictionary_get_BOOL(a3, "CFPreferencesUseCorrectOwner"))
    {
      CFIndex Length = CFStringGetLength(self->_userName);
      CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      size_t v17 = MaximumSizeForEncoding + 1;
      MEMORY[0x1F4188790](MaximumSizeForEncoding, v18);
      v20 = (char *)&v58 - v19;
      bzero((char *)&v58 - v19, v17);
      CFStringGetCString(self->_userName, v20, v17, 0x8000100u);
      v21 = getpwnam(v20);
      if (v21)
      {
        uint64_t pw_uid = v21->pw_uid;
        uint64_t pw_gid = v21->pw_gid;
LABEL_34:
        if (pw_uid != self->_lastEuid || pw_gid != self->_lastEgid) {
          [(CFPDSource *)self syncWriteToDisk];
        }
        self->_lastEuid = pw_uid;
        self->_lastEgid = pw_gid;
        if (self->_parentFD == -1)
        {
          int v14 = [(CFPDSource *)self cacheFileInfoForWriting:1 euid:pw_uid egid:pw_gid didCreate:&v65];
          goto LABEL_39;
        }
        goto LABEL_38;
      }
      v24 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[CFPDSource acceptMessage:].cold.4();
      }
    }
    uint64_t pw_uid = xpc_connection_get_euid(remote_connection);
    uint64_t pw_gid = xpc_connection_get_egid(remote_connection);
    goto LABEL_34;
  }
  int v14 = 8;
LABEL_39:
  v64 = 0;
  mode_t v63 = 0;
  uid_t v62 = 0;
  BOOL v25 = xpc_dictionary_get_BOOL(a3, "ValidatePlist");
  if ((v8 & 1) == 0)
  {
    BOOL v30 = v25;
    if (self->_plist
      || self->_parentFD != -1
      || ([(CFPDSource *)self cacheFileInfo], self->_parentFD != -1))
    {
      if (!_os_feature_enabled_impl()
        || CFStringFind(self->_domain, @"com.apple.", 0).location == -1)
      {
        goto LABEL_56;
      }
      if (acceptMessage__onceToken != -1) {
        dispatch_once(&acceptMessage__onceToken, &__block_literal_global_135);
      }
      if (acceptMessage___CFMKBDeviceUnlockedSinceBoot && !acceptMessage___CFMKBDeviceUnlockedSinceBoot())
      {
        actualPath = self->_actualPath;
        *(void *)&long long v74 = off_1ECE0A5A0;
        *((void *)&v74 + 1) = 3221225472;
        *(void *)&long long v75 = __ERROR_LOG_PREUNLOCK_ACCESS_block_invoke;
        *((void *)&v75 + 1) = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
        v76 = (CFPDSource *)actualPath;
        _extractCFPDBits(a3, 0, self, (uint64_t)&v74);
        if (v30) {
          goto LABEL_58;
        }
      }
      else
      {
LABEL_56:
        if (v30) {
          goto LABEL_58;
        }
      }
      if (!self->_plist)
      {
        int v39 = -[CFPDSource openPropertyListWithoutDrainingPendingChangesOrValidatingPlistAndReturnFileUID:andMode:]((os_unfair_lock_s *)self, &v62, &v63);
        if (v39 != -1)
        {
          int v28 = v39;
          id v26 = 0;
LABEL_59:
          BOOL v27 = v28 != -1 || v26 != 0;
          if (v14) {
            goto LABEL_42;
          }
          goto LABEL_41;
        }
      }
LABEL_58:
      id v26 = [(CFPDSource *)self copyPropertyListWithoutDrainingPendingChangesValidatingPlist:v30 andReturnFileUID:&v62 andMode:&v63];
      int v28 = -1;
      goto LABEL_59;
    }
  }
  id v26 = 0;
  BOOL v27 = 0;
  int v28 = -1;
  if (!v14)
  {
LABEL_41:
    LOWORD(v57) = v63;
    int v14 = [(CFPDSource *)self validateMessage:a3 withNewKey:v68 newValue:v67 plistIsAvailableToRead:v27 containerPath:v77 fileUID:v62 mode:v57 diagnosticMessage:&v64];
  }
LABEL_42:
  switch(v14)
  {
    case 0:
      -[CFPDSource acceptMessage:]();
    case 1:
      if (v8)
      {
        unint64_t v32 = -[CFPDSource approximatePlistSizeIncludingPendingChanges]((uint64_t)self);
        if ([(CFPDSource *)self enqueueNewKey:v68 value:v67 encoding:v66 inBatch:0 fromMessage:a3])
        {
          unint64_t v33 = -[CFPDSource approximatePlistSizeIncludingPendingChanges]((uint64_t)self);
          if (v33 > v32) {
            -[CFPDSource attachSizeWarningsToReply:forByteCount:]((uint64_t)self, reply, v33);
          }
          if (xpc_dictionary_get_BOOL(a3, "CFPreferencesShouldWriteSynchronously") || v65) {
            [(CFPDSource *)self syncWriteToDisk];
          }
          unsigned int v59 = v66;
          xpc_object_t v47 = v67;
          xpc_object_t v58 = v68;
          v48 = _CFPrefsDaemonLog();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            if (v59) {
              v49 = v47;
            }
            else {
              v49 = v58;
            }
            _extractCFPDBits(a3, v49, self, (uint64_t)&__block_literal_global_408);
          }
          [(CFPDSource *)self asyncNotifyObserversOfWriteFromConnection:remote_connection message:a3];
        }
        else
        {
          v36 = "Couldn't enqueue updated values";
          v37 = reply;
          unsigned int v38 = 2;
LABEL_83:
          populateErrorReply(v36, v37, v38);
        }
      }
      else if ((unint64_t)(int64 - 7) > 1)
      {
        if (v26 || v28 != -1 || (v41 = self->_pendingChangesQueue) != 0 && xpc_array_get_count(v41))
        {
          v61[0] = off_1ECE0A5A0;
          v61[1] = 3221225472;
          v61[2] = __28__CFPDSource_acceptMessage___block_invoke_2;
          v61[3] = &unk_1ECDB0298;
          v61[4] = self;
          [v26 quicklyValidatePlistAndOnFailureInvokeBlock:v61];
          v42 = (void *)[v26 copyXPCData];
          if (v42)
          {
            xpc_dictionary_set_value(reply, "CFPreferencesPropertyList", v42);
            xpc_release(v42);
          }
          if (v28 != -1) {
            xpc_dictionary_set_fd(reply, "PlistFD", v28);
          }
          pendingChangesQueue = self->_pendingChangesQueue;
          if (pendingChangesQueue && xpc_array_get_count(pendingChangesQueue))
          {
            xpc_object_t v44 = xpc_array_create(0, 0);
            v45 = self->_pendingChangesQueue;
            v60[0] = off_1ECE0A5A0;
            v60[1] = 3221225472;
            v60[2] = __28__CFPDSource_acceptMessage___block_invoke_143;
            v60[3] = &unk_1ECE00150;
            v60[4] = v44;
            xpc_array_apply(v45, v60);
            xpc_dictionary_set_value(reply, "PlistDiff", v44);
            xpc_release(v44);
          }
          v46 = self->_actualPath;
          if (v42) {
            DEBUG_READ(a3, self, (uint64_t)v46);
          }
          else {
            DEBUG_READ_EMPTY(a3, self, (uint64_t)v46);
          }
        }
        xpc_dictionary_set_int64(reply, "CFPreferencesShmemIndex", self->_generationShmemIndex);
        bzero(&v74, 0x400uLL);
        -[CFPrefsDaemon getShmemName:bufLen:]((uint64_t)self->_cfprefsd, (char *)&v74);
        v35 = "CFPreferencesShmemName";
LABEL_115:
        v34 = (char *)&v74;
LABEL_116:
        xpc_dictionary_set_string(reply, v35, v34);
      }
      else
      {
        -[CFPDSource setObserved:bySenderOfMessage:]((const os_unfair_lock *)self, int64 == 7, a3);
      }
LABEL_117:
      xpc_dictionary_set_int64(reply, "CFPreferencesShmemIndex", self->_generationShmemIndex);
      bzero(&v74, 0x400uLL);
      -[CFPrefsDaemon getShmemName:bufLen:]((uint64_t)self->_cfprefsd, (char *)&v74);
      xpc_dictionary_set_string(reply, "CFPreferencesShmemName", (const char *)&v74);
      uint64_t v50 = atomic_load((unsigned int *)(-[CFPrefsDaemon shmem]((uint64_t)self->_cfprefsd)
                                       + 4 * self->_generationShmemIndex));
      xpc_dictionary_set_uint64(reply, "CFPreferencesShmemState", v50);
      if (v14 == 1) {
        goto LABEL_128;
      }
      if (v14 == 4)
      {
        v51 = _CFPrefsDaemonLog();
        if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_128;
        }
        v69 = off_1ECE0A5A0;
        uint64_t v70 = 3221225472;
        v71 = __DEBUG_NEEDS_TOKEN_block_invoke;
        v72 = &__block_descriptor_33_e29_v64__0i8_12_20_28_36_44_52B60l;
        LOBYTE(v73) = v8;
        goto LABEL_126;
      }
      string = xpc_dictionary_get_string(reply, "CFPreferencesErrorDescription");
      if (!v8)
      {
        v69 = off_1ECE0A5A0;
        uint64_t v70 = 3221225472;
        v71 = __ERROR_READ_REJECTED_block_invoke;
        v72 = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
        v73 = string;
LABEL_126:
        id v55 = a3;
        v54 = 0;
        goto LABEL_127;
      }
      v53 = &v67;
      if (!v66) {
        v53 = &v68;
      }
      v54 = *v53;
      v69 = off_1ECE0A5A0;
      uint64_t v70 = 3221225472;
      v71 = __ERROR_WRITE_REJECTED_block_invoke;
      v72 = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
      v73 = string;
      id v55 = a3;
LABEL_127:
      _extractCFPDBits(v55, v54, self, (uint64_t)&v69);
LABEL_128:
      if (v65) {
        -[CFPDSource cleanUpIfNecessaryAfterCreatingPlist]((uint64_t)self);
      }
      if ((*((unsigned char *)self + 142) & 4) != 0) {
        [(CFPDSource *)self syncWriteToDiskAndFlushCacheForReason:@"we're never caching"];
      }
      -[CFPDSource closeFileDescriptors]((uint64_t)self);
      if (v68) {
        xpc_release(v68);
      }
      if (v67) {
        xpc_release(v67);
      }

      if (v28 != -1) {
        close(v28);
      }
      return reply;
    case 2:
    case 3:
      if (v64) {
        v29 = v64;
      }
      else {
        v29 = "Operation not allowed";
      }
      populateErrorReply(v29, reply, 0);
      xpc_dictionary_set_BOOL(reply, "CFPreferencesErrorClientFault", 1);
      goto LABEL_117;
    case 4:
      if (!self->_actualPath)
      {
        [(CFPDSource *)self cacheFileInfo];
        if (!self->_actualPath) {
          goto LABEL_76;
        }
      }
      populateErrorReply("Access token needed", reply, 3u);
      v34 = self->_actualPath;
      v35 = "CFPreferencesAccessToken";
      goto LABEL_116;
    case 5:
      populateErrorReply("Directory needed", reply, 4u);
      bzero(&v74, 0x402uLL);
      if (!-[CFPDSource getUncanonicalizedPath:]((uint64_t)self, (char *)&v74)) {
        goto LABEL_117;
      }
      v35 = "CFPreferencesUncanonicalizedPath";
      goto LABEL_115;
    case 6:
      v36 = "Invalid plist data";
      v37 = reply;
      unsigned int v38 = 1;
      goto LABEL_83;
    case 7:
LABEL_76:
      v36 = "Path not accessible";
      goto LABEL_82;
    case 8:
      v36 = "Writing has been disabled";
      goto LABEL_82;
    case 9:
      v36 = "Unable to determine access";
LABEL_82:
      v37 = reply;
      unsigned int v38 = 0;
      goto LABEL_83;
    default:
      goto LABEL_117;
  }
}

- (uint64_t)closeFileDescriptors
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(unsigned char *)(result + 142) & 2) == 0)
    {
      int v2 = *(_DWORD *)(result + 128);
      if ((v2 & 0x80000000) == 0) {
        close(v2);
      }
      *(_DWORD *)(v1 + 128) = -1;
      free(*(void **)(v1 + 64));
      *(void *)(v1 + 64) = 0;
    }
    result = *(unsigned int *)(v1 + 132);
    if ((result & 0x80000000) == 0) {
      result = close(result);
    }
    *(_DWORD *)(v1 + 132) = -1;
  }
  return result;
}

- (void)lockedSync:(id)a3
{
  [(CFPDSource *)self lock];
  -[CFPDSource beginHandlingRequest]((uint64_t)self);
  (*((void (**)(id))a3 + 2))(a3);
  -[CFPDSource endHandlingRequest]((const os_unfair_lock *)self);

  [(CFPDSource *)self unlock];
}

- (void)lock
{
}

- (uint64_t)tryEndAccessingPlist
{
  if (result)
  {
    uint64_t v1 = result;
    result = *(void *)(result + 16);
    if (result)
    {
      result = [(id)result purgable];
      if ((result & 1) == 0)
      {
        result = -[CFPDSource shouldBePurgable](v1);
        if (result)
        {
          int v2 = *(void **)(v1 + 16);
          return [v2 endAccessing];
        }
      }
    }
  }
  return result;
}

- (const)endHandlingRequest
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    os_unfair_lock_assert_owner(result + 27);
    if ((*(unsigned char *)(v1 + 142) & 1) == 0) {
      -[CFPDSource endHandlingRequest]();
    }
    *(unsigned char *)(v1 + 142) &= ~1u;
    return (const os_unfair_lock *)-[CFPDSource tryEndAccessingPlist](v1);
  }
  return result;
}

- (void)beginHandlingRequest
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  OUTLINED_FUNCTION_3_2();
  _os_log_debug_impl(&dword_182B90000, v0, OS_LOG_TYPE_DEBUG, "Data for { %@, %@ } was purged due to memory pressure", v1, 0x16u);
}

- (int)validateMessage:(id)a3 withNewKey:(id)a4 newValue:(id)a5 plistIsAvailableToRead:(BOOL)a6 containerPath:(const char *)a7 fileUID:(unsigned int)a8 mode:(unsigned __int16)a9 diagnosticMessage:(const char *)a10
{
  BOOL v12 = a6;
  uint64_t v27 = *(void *)off_1ECE0A5B0;
  BOOL v17 = a4 != 0;
  if (!eduModeEnabled() || !xpc_dictionary_get_BOOL(a3, "AllowWritingSpecialKeysToGlobalPreferences"))
  {
    if (a4 || v12) {
      goto LABEL_11;
    }
    return 1;
  }
  if (!a4) {
    return 1;
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  if (xpc_dictionary_get_BOOL(a3, "MultiKeySet"))
  {
    v22[0] = off_1ECE0A5A0;
    v22[1] = 3221225472;
    v22[2] = __118__CFPDSource_validateMessage_withNewKey_newValue_plistIsAvailableToRead_containerPath_fileUID_mode_diagnosticMessage___block_invoke;
    v22[3] = &unk_1ECDABE88;
    v22[4] = &v23;
    xpc_dictionary_apply(a5, v22);
    int v18 = *((unsigned __int8 *)v24 + 24);
  }
  else
  {
    string_ptr = (char *)xpc_string_get_string_ptr(a4);
    int v18 = isSpecialKey(string_ptr);
    *((unsigned char *)v24 + 24) = v18;
  }
  _Block_object_dispose(&v23, 8);
  if (v18) {
    return 1;
  }
LABEL_11:
  LOBYTE(v23) = 0;
  int result = -[CFPDSource validatePOSIXPermissionsForMessage:accessType:fileUID:mode:fullyValidated:]((uint64_t)self, a3, v17, a8, a9, &v23);
  if ((_BYTE)v23)
  {
    if (result == 3)
    {
      v21 = "writing to another user's preferences requires sufficient permissions to write to the file";
    }
    else
    {
      if (result != 2) {
        return result;
      }
      v21 = "accessing another user's preferences requires sufficient permissions to be able to read the file";
    }
  }
  else
  {
    int result = -[CFPDSource validateSandboxPermissionsForMessage:containerPath:accessType:]((uint64_t)self, a3, a7, v17);
    if (a7 && *a7)
    {
      if (result == 3)
      {
        v21 = "setting preferences outside an application's container requires user-preference-write or file-write-data sandbox access";
      }
      else
      {
        if (result != 2) {
          return result;
        }
        v21 = "accessing preferences outside an application's container requires user-preference-read or file-read-data sandbox access";
      }
    }
    else if (result == 3)
    {
      v21 = "setting these preferences requires user-preference-write or file-write-data sandbox access";
    }
    else
    {
      if (result != 2) {
        return result;
      }
      v21 = "accessing these preferences requires user-preference-read or file-read-data sandbox access";
    }
  }
  *a10 = v21;
  return result;
}

- (void)unlock
{
}

- (void)setUncanonicalizedPathCached:(BOOL)a3
{
  BOOL v3 = a3;
  p_uncanonicalizedPathCacheLock = &self->_uncanonicalizedPathCacheLock;
  os_unfair_lock_lock(&self->_uncanonicalizedPathCacheLock);
  uncanonicalizedPathCache = self->_uncanonicalizedPathCache;
  if (v3)
  {
    if (uncanonicalizedPathCache) {
      goto LABEL_7;
    }
    CFStringRef v7 = (__CFString *)-[CFPDSource _copyUncanonicalizedPath]((CFStringRef)self);
  }
  else
  {
    if (!uncanonicalizedPathCache) {
      goto LABEL_7;
    }
    CFRelease(uncanonicalizedPathCache);
    CFStringRef v7 = 0;
  }
  self->_uncanonicalizedPathCache = v7;
LABEL_7:

  os_unfair_lock_unlock(p_uncanonicalizedPathCacheLock);
}

- (void)processEndOfMessageIntendingToRemoveSource:(BOOL *)a3 replacingWithTombstone:(id *)a4
{
  v22[6] = *(void *)off_1ECE0A5B0;
  p_lock = &self->_lock;
  os_unfair_lock_assert_owner(&self->_lock);
  if (*a3)
  {
    if ((*((unsigned char *)self + 142) & 0x20) != 0 || !-[CFPDSource isEmpty]((uint64_t)self))
    {
      *a3 = 0;
    }
    else
    {
      v22[0] = off_1ECE0A5A0;
      v22[1] = 3221225472;
      v22[2] = __80__CFPDSource_processEndOfMessageIntendingToRemoveSource_replacingWithTombstone___block_invoke;
      v22[3] = &unk_1ECE00178;
      v22[4] = self;
      void v22[5] = a4;
      -[CFPDSource observingConnectionsLockedSync:]((os_unfair_lock_s *)self, (uint64_t)v22);
    }
  }
  if (self->_actualPath)
  {
    if (_CFPrefsCurrentProcessIsCFPrefsD())
    {
      size_t v8 = strlen(self->_actualPath);
      CFURLRef v9 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)self->_actualPath, v8, 0);
      if (v9)
      {
        CFURLRef v10 = v9;
        CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)&__kCFAllocatorSystemDefault, v9);
        CFRelease(v10);
        if (PathComponent)
        {
          BOOL v12 = (__CFString *)CFURLCopyFileSystemPath(PathComponent, kCFURLPOSIXPathStyle);
          CFRelease(PathComponent);
          if (v12)
          {
            BOOL v13 = *a3;
            os_unfair_lock_assert_owner(p_lock);
            if (v13)
            {
              os_unfair_lock_lock((os_unfair_lock_t)&dirWatcherLock);
              if (self->_watchingParentDirectory)
              {
                self->_watchingParentDirectory = 0;
                CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)dirWatcherTargets, v12);
                if (Value)
                {
                  CFArrayRef v15 = Value;
                  v23.length = CFArrayGetCount(Value);
                  v23.location = 0;
                  FirstIndexOfCFArrayRef Value = CFArrayGetFirstIndexOfValue(v15, v23, self);
                  if (FirstIndexOfValue != -1) {
                    CFArrayRemoveValueAtIndex(v15, FirstIndexOfValue);
                  }
                  if (!CFArrayGetCount(v15))
                  {
                    CFDictionaryRemoveValue((CFMutableDictionaryRef)dirWatcherTargets, v12);
                    CFArrayRef v17 = (const __CFArray *)watchedDirs;
                    v24.length = CFArrayGetCount((CFArrayRef)watchedDirs);
                    v24.location = 0;
                    CFIndex v18 = CFArrayGetFirstIndexOfValue(v17, v24, v12);
                    if (v18 != -1)
                    {
                      CFArrayRemoveValueAtIndex((CFMutableArrayRef)watchedDirs, v18);
LABEL_35:
                      os_unfair_lock_unlock((os_unfair_lock_t)&dirWatcherLock);
                      os_unfair_lock_assert_not_owner((const os_unfair_lock *)&dirWatcherLock);
                      dispatch_async((dispatch_queue_t)fseventsQueue, &__block_literal_global_427);
                      goto LABEL_32;
                    }
                  }
                }
              }
            }
            else
            {
              if (-[CFPrefsDaemon role]((uint64_t)self->_cfprefsd) == 2)
              {
LABEL_32:
                CFRelease(v12);
                return;
              }
              if (initializeFSEvents_predicate != -1) {
                dispatch_once(&initializeFSEvents_predicate, &__block_literal_global_417);
              }
              if (_CFPrefsWatchForDeletionOfDirectory_onceToken != -1) {
                dispatch_once(&_CFPrefsWatchForDeletionOfDirectory_onceToken, &__block_literal_global_414);
              }
              uint64_t v19 = _internString(v12);
              os_unfair_lock_lock((os_unfair_lock_t)&dirWatcherLock);
              if (!self->_watchingParentDirectory)
              {
                self->_watchingParentDirectory = 1;
                Mutable = (void *)CFDictionaryGetValue((CFDictionaryRef)dirWatcherTargets, v19);
                if (!Mutable)
                {
                  Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
                  if (Mutable)
                  {
                    CFDictionarySetValue((CFMutableDictionaryRef)dirWatcherTargets, v19, Mutable);
                    CFRelease(Mutable);
                  }
                }
                v25.length = CFArrayGetCount((CFArrayRef)Mutable);
                v25.location = 0;
                if (!CFArrayContainsValue((CFArrayRef)Mutable, v25, self)) {
                  CFArrayAppendValue((CFMutableArrayRef)Mutable, self);
                }
                CFArrayRef v21 = (const __CFArray *)watchedDirs;
                v26.length = CFArrayGetCount((CFArrayRef)watchedDirs);
                v26.location = 0;
                if (!CFArrayContainsValue(v21, v26, v19))
                {
                  CFArrayAppendValue((CFMutableArrayRef)watchedDirs, v19);
                  goto LABEL_35;
                }
              }
            }
            os_unfair_lock_unlock((os_unfair_lock_t)&dirWatcherLock);
            goto LABEL_32;
          }
        }
      }
    }
  }
}

- (uint64_t)isEmpty
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)(result + 24);
    if (v2 && xpc_array_get_count(v2) || [*(id *)(v1 + 16) length])
    {
      return 0;
    }
    else
    {
      int v3 = *(_DWORD *)(v1 + 128);
      if (v3 == -1)
      {
        return 1;
      }
      else
      {
        memset(&v5, 0, sizeof(v5));
        return fstatat(v3, *(const char **)(v1 + 64), &v5, 0) || v5.st_size < 1;
      }
    }
  }
  return result;
}

- (void)cacheFileInfo
{
}

- (void)setManagedPreferencesUseContainer:(BOOL)a3
{
  self->_managedUsesContainer = a3;
}

- (BOOL)shouldBePurgable
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(result + 108));
    if ((*(unsigned char *)(v1 + 142) & 3) != 0)
    {
      return 0;
    }
    else
    {
      uint64_t v2 = (os_unfair_lock_s *)(v1 + 104);
      int result = os_unfair_lock_trylock(v2);
      if (result)
      {
        os_unfair_lock_unlock(v2);
        return 1;
      }
    }
  }
  return result;
}

- (uint64_t)validateSandboxPermissionsForMessage:(const char *)a3 containerPath:(int)a4 accessType:
{
  if (result)
  {
    if (a4 == 1)
    {
      if (-[CFPDSource validateSandboxForWrite:containerPath:](result, a2, a3)) {
        return 1;
      }
      else {
        return 3;
      }
    }
    else
    {
      return -[CFPDSource validateSandboxForRead:containerPath:](result, a2, a3);
    }
  }
  return result;
}

- (uint64_t)approximatePlistSizeIncludingPendingChanges
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 16))
  {
    v1 += [*(id *)(a1 + 16) length];
  }
  else
  {
    int v2 = *(_DWORD *)(a1 + 128);
    if (v2 != -1)
    {
      memset(&v6, 0, sizeof(v6));
      int v3 = fstatat(v2, *(const char **)(a1 + 64), &v6, 0);
      off_t st_size = v6.st_size;
      if (v3) {
        off_t st_size = 0;
      }
      v1 += st_size;
    }
  }
  return v1;
}

- (void)attachSizeWarningsToReply:(unint64_t)a3 forByteCount:
{
  if (a1)
  {
    int64_t v4 = _CFPrefsDomainSizeAcceptabilityForByteCount(a3);
    xpc_dictionary_set_int64(a2, "CFPreferencesByteCountThreshold", v4);
  }
}

- (uint64_t)openPropertyListWithoutDrainingPendingChangesOrValidatingPlistAndReturnFileUID:(mode_t *)a3 andMode:
{
  uint64_t v3 = (uint64_t)a1;
  uint64_t v11 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    stat v6 = a1 + 26;
    os_unfair_lock_lock(a1 + 26);
    int v7 = *(_DWORD *)(v3 + 128);
    if (v7 == -1 && ([(id)v3 cacheFileInfo], int v7 = *(_DWORD *)(v3 + 128), v7 == -1))
    {
      uint64_t v3 = 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v8 = openat(v7, *(const char **)(v3 + 64), 256);
      uint64_t v3 = v8;
      if (v8 != -1)
      {
        memset(&v10, 0, sizeof(v10));
        if (fstat(v8, &v10) || v10.st_size < 0x100000)
        {
          close(v3);
          uint64_t v3 = 0xFFFFFFFFLL;
        }
        if (a2) {
          *a2 = v10.st_uid;
        }
        if (a3) {
          *a3 = v10.st_mode;
        }
      }
    }
    os_unfair_lock_unlock(v6);
  }
  return v3;
}

- (void)endHandlingRequest
{
}

- (void)dealloc
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  observingConnections = self->_observingConnections;
  if (observingConnections) {
    CFRelease(observingConnections);
  }
  pendingChangesQueue = self->_pendingChangesQueue;
  if (pendingChangesQueue) {
    xpc_release(pendingChangesQueue);
  }

  free(self->_actualPath);
  free(self->_fileName);
  int parentFD = self->_parentFD;
  if ((parentFD & 0x80000000) == 0) {
    close(parentFD);
  }
  v6.receiver = self;
  v6.super_class = (Class)CFPDSource;
  [(CFPDSource *)&v6 dealloc];
}

- (uint64_t)validatePOSIXPermissionsForMessage:(int)a3 accessType:(int)a4 fileUID:(int)a5 mode:(unsigned char *)a6 fullyValidated:
{
  if (!a1) {
    return 0;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 108));
  remote_connection = xpc_dictionary_get_remote_connection(a2);
  if (!remote_connection)
  {
    value = (_xpc_connection_s *)xpc_dictionary_get_value(a2, "connection");
    if (!value || (remote_connection = value, object_getClass(value) != (Class)off_1ECE0A678)) {
      -[CFPDSource validatePOSIXPermissionsForMessage:accessType:fileUID:mode:fullyValidated:]();
    }
  }
  uid_t euid = xpc_connection_get_euid(remote_connection);
  int v15 = cfprefsdEuid();
  if (euid && v15 != euid && (a3 == 1 || (euid != a4 ? (int v16 = 4) : (int v16 = 256), (v16 & a5) == 0)))
  {
    if (-[CFPDSource _canTrustUserPropertyForPOSIXPermissionCheckForAccessType:]((const __CFString *)a1, a3))
    {
      CFArrayRef v17 = _CFPrefsCopyUserNameForUID(euid);
      if (v17)
      {
        CFIndex v18 = v17;
        if (CFEqual(*(CFTypeRef *)(a1 + 40), v17))
        {
          *a6 = 0;
          CFRelease(v18);
          return 1;
        }
        CFRelease(v18);
      }
    }
  }
  else if (!byte_1EC090E07)
  {
    *a6 = 0;
    return 1;
  }
  int v20 = xpc_dictionary_dup_fd(a2, "CFPreferencesAccessToken");
  uint64_t v19 = -[CFPDSource validateAccessToken:accessType:](a1, v20, a3);
  if ((v20 & 0x80000000) == 0) {
    close(v20);
  }
  *a6 = 1;
  return v19;
}

- (const)_canTrustUserPropertyForPOSIXPermissionCheckForAccessType:(const __CFString *)result
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  if (result)
  {
    int v2 = (__CFString *)result;
    int result = (const __CFString *)result[1].data;
    if (result)
    {
      if (CFStringHasPrefix(result, @"/")) {
        return 0;
      }
      CFStringRef data = (const __CFString *)v2[1].data;
      v9.length = CFStringGetLength(data);
      v9.location = 0;
      if (CFStringFindWithOptions(data, @"..", v9, 0, 0)) {
        return 0;
      }
      CFStringRef v5 = (const __CFString *)[(__CFString *)v2 container];
      if (v5 && (!CFStringGetFileSystemRepresentation(v5, buffer, 1024) || (getpid(), sandbox_check()))) {
        return 0;
      }
      else {
        return (const __CFString *)((v2[4].info & 0x200000000000000) == 0 || a2 != 0);
      }
    }
  }
  return result;
}

- (id)copyPropertyListValidatingPlist:(BOOL)a3
{
  [(CFPDSource *)self drainPendingChanges];
  plist = self->_plist;

  return plist;
}

- (id)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:(BOOL)a3 andReturnFileUID:(unsigned int *)a4 andMode:(unsigned __int16 *)a5
{
  BOOL v7 = a3;
  uint64_t v44 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(CFPDDataBuffer *)self->_plist purgable]) {
    -[CFPDSource copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:]();
  }
  plist = self->_plist;
  if (plist) {
    BOOL v10 = !v7;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (!plist) {
      goto LABEL_22;
    }
    v38[0] = off_1ECE0A5A0;
    v38[1] = 3221225472;
    v38[2] = __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke;
    v38[3] = &unk_1ECDB0298;
    v38[4] = self;
    [(CFPDDataBuffer *)plist quicklyValidatePlistAndOnFailureInvokeBlock:v38];
  }
  else
  {
    BOOL v11 = [(CFPDDataBuffer *)plist validatePlist];
    BOOL v12 = _CFPrefsDaemonLog();
    BOOL v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        userName = self->_userName;
        domain = self->_domain;
        buf.st_dev = 138412546;
        *(void *)&buf.mode_t st_mode = domain;
        WORD2(buf.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)userName;
        _os_log_impl(&dword_182B90000, v13, OS_LOG_TYPE_INFO, "Validation of pre-existing plist succeeded. {%@ %@}", (uint8_t *)&buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CFPDSource copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:]();
      }
      [(CFPDSource *)self clearCacheForReason:@"cached plist is invalid"];
    }
  }
  int v16 = self->_plist;
  if (v16)
  {
LABEL_16:
    if (a4) {
      *a4 = self->_plistFileOwner;
    }
    if (!a5) {
      return v16;
    }
    unsigned __int16 v17 = (2 * (*((unsigned char *)self + 142) & 0x80)) & 0xFFFB | (4 * (*((unsigned char *)self + 143) & 1));
    goto LABEL_20;
  }
LABEL_22:
  if (!self->_managed || CFPreferencesIsManaged([(CFPDSource *)self user], self->_managedUsesContainer))
  {
    os_unfair_lock_lock(&self->_writeLock);
    if (self->_parentFD == -1)
    {
      [(CFPDSource *)self cacheFileInfo];
      if (self->_parentFD == -1) {
        goto LABEL_39;
      }
    }
    actualPath = self->_actualPath;
    int v20 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(void *)&buf.st_dev = off_1ECE0A5A0;
      buf.st_ino = 3221225472;
      *(void *)&buf.uid_t st_uid = __DEBUG_CACHE_MISS_block_invoke;
      *(void *)&buf.st_rdev = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
      buf.st_atimespec.tv_sec = (__darwin_time_t)actualPath;
      _extractCFPDBits(0, 0, self, (uint64_t)&buf);
    }
    char v21 = *((unsigned char *)self + 142);
    if ((v21 & 8) == 0)
    {
      if (!strstr(self->_actualPath, "Preferences/"))
      {
        v22 = [(CFPDSource *)self copyUncanonicalizedPath];
        if (v22
          && (CFStringRef v23 = v22,
              v45.length = CFStringGetLength(v22),
              v45.location = 0,
              int v24 = CFStringFindWithOptions(v23, @"Preferences/", v45, 0, 0),
              CFRelease(v23),
              v24))
        {
          char v21 = *((unsigned char *)self + 142);
        }
        else
        {
          char v21 = *((unsigned char *)self + 142) | 4;
        }
      }
      *((unsigned char *)self + 142) = v21 | 8;
    }
    uint64_t v25 = -[CFPDSource openActualPath]((uint64_t)self);
    if ((v25 & 0x80000000) != 0)
    {
LABEL_39:
      os_unfair_lock_unlock(&self->_writeLock);
    }
    else
    {
      int v26 = v25;
      BOOL v27 = !self->_managed && (*((unsigned char *)self + 142) & 4) == 0;
      int v16 = +[CFPDDataBuffer newBufferFromFile:v25 allowMappingIfSafe:v27];
      memset(&buf, 0, sizeof(buf));
      if (v16)
      {
        int v28 = fstat(v26, &buf);
        if (v28) {
          uid_t st_uid = 0;
        }
        else {
          uid_t st_uid = buf.st_uid;
        }
        if (v28) {
          mode_t st_mode = 0;
        }
        else {
          mode_t st_mode = buf.st_mode;
        }
        -[CFPDSource setPlist:owner:mode:]((uint64_t)self, v16, st_uid, st_mode);

        if (v7)
        {
          BOOL v31 = [(CFPDDataBuffer *)v16 validatePlist];
          unint64_t v32 = _CFPrefsDaemonLog();
          unint64_t v33 = v32;
          if (v31)
          {
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              v35 = self->_userName;
              v34 = self->_domain;
              *(_DWORD *)int v39 = 138412546;
              v40 = v34;
              __int16 v41 = 2112;
              v42 = v35;
              _os_log_impl(&dword_182B90000, v33, OS_LOG_TYPE_INFO, "Validation of plist read from disk succeeded. {%@ %@}", v39, 0x16u);
            }
          }
          else
          {
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              -[CFPDSource copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:]();
            }
            unlinkat(self->_parentFD, self->_fileName, 0);
            [(CFPDSource *)self clearCacheForReason:@"plist on disk is invalid"];
            int v16 = 0;
          }
        }
        else
        {
          v36 = self->_plist;
          v37[0] = off_1ECE0A5A0;
          v37[1] = 3221225472;
          v37[2] = __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_70;
          v37[3] = &unk_1ECDB0298;
          v37[4] = self;
          [(CFPDDataBuffer *)v36 quicklyValidatePlistAndOnFailureInvokeBlock:v37];
        }
      }
      else
      {
        -[CFPDSource setPlist:owner:mode:]((uint64_t)self, 0, 0, 0);
      }
      close(v26);
      os_unfair_lock_unlock(&self->_writeLock);
      if (v16) {
        goto LABEL_16;
      }
    }
    if (a4) {
      *a4 = self->_lastEuid;
    }
    if (!a5)
    {
      int v16 = 0;
      return v16;
    }
    unsigned __int16 v17 = 384;
    if ((*((unsigned char *)self + 142) & 0x10) != 0)
    {
      int v16 = 0;
    }
    else
    {
      int v16 = 0;
      if (CFEqual(self->_userName, @"kCFPreferencesAnyUser")) {
        unsigned __int16 v17 = 420;
      }
      else {
        unsigned __int16 v17 = 384;
      }
    }
LABEL_20:
    *a5 = v17;
    return v16;
  }
  return 0;
}

- (int)cacheFileInfoForWriting:(BOOL)a3 euid:(unsigned int)a4 egid:(unsigned int)a5 didCreate:(BOOL *)a6
{
  objc_super v6 = (const os_unfair_lock *)MEMORY[0x1F4188790](self, a2);
  uint64_t v8 = v7;
  int v10 = v9;
  uint64_t v11 = (uint64_t)v6;
  uint64_t v69 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(v6 + 27);
  free(*(void **)(v11 + 56));
  *(void *)(v11 + 56) = 0;
  *(unsigned char *)(v11 + 143) &= ~2u;
  free(*(void **)(v11 + 64));
  *(void *)(v11 + 64) = 0;
  int v12 = *(_DWORD *)(v11 + 132);
  if ((v12 & 0x80000000) == 0) {
    close(v12);
  }
  *(_DWORD *)(v11 + 132) = -1;
  int v13 = *(_DWORD *)(v11 + 128);
  if ((v13 & 0x80000000) == 0) {
    close(v13);
  }
  *(_DWORD *)(v11 + 128) = -1;
  bzero(__s2, 0x402uLL);
  if (!-[CFPDSource getUncanonicalizedPath:](v11, __s2))
  {
    CFIndex v18 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.7(v11, v18, v19, v20, v21, v22, v23, v24);
    }
    return 7;
  }
  int v57 = -1;
  bzero(__s1, 0x402uLL);
  bzero(&v65, 0x402uLL);
  if (v10)
  {
    unsigned int v14 = atomic_load(&dword_1EC090E0C);
    if (v14 == 3)
    {
      int v15 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:](v15);
      }
      int v16 = 0;
      int v17 = 0;
      *__error() = 28;
      goto LABEL_70;
    }
  }
  int IsCFPrefsD = _CFPrefsCurrentProcessIsCFPrefsD();
  if (byte_1EC090E06) {
    int v26 = 1;
  }
  else {
    int v26 = IsCFPrefsD;
  }
  if (v26 == 1)
  {
    if (dirname_r(__s2, (char *)&v65))
    {
      if (basename_r(__s2, __s1))
      {
        int v27 = open((const char *)&v65, 1074790400);
        int v57 = v27;
        if (v27 != -1) {
          goto LABEL_25;
        }
        int v28 = *__error();
        v29 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.6();
        }
        *__error() = v28;
      }
      else
      {
        unint64_t v33 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.5();
        }
      }
    }
    else
    {
      unint64_t v32 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.4();
      }
    }
  }
  else
  {
    int v57 = -2;
    __strlcpy_chk();
  }
  int v27 = v57;
  if (v57 == -1)
  {
LABEL_32:
    int v17 = 0;
    int v30 = -1;
    goto LABEL_39;
  }
LABEL_25:
  int v30 = openat(v27, __s1, 0);
  int v17 = 0;
  if (v30 != -1 || !v10) {
    goto LABEL_39;
  }
  if (*__error() != 2) {
    goto LABEL_32;
  }
  if ((*(unsigned char *)(v11 + 142) & 0x10) != 0)
  {
    uint64_t v31 = 384;
  }
  else if (CFEqual(*(CFTypeRef *)(v11 + 40), @"kCFPreferencesAnyUser"))
  {
    uint64_t v31 = 420;
  }
  else
  {
    uint64_t v31 = 384;
  }
  int v30 = openat(v57, __s1, 512, v31);
  int v17 = 1;
LABEL_39:
  if (v30 < 0) {
    int v34 = v10;
  }
  else {
    int v34 = 0;
  }
  if (v34 != 1) {
    goto LABEL_65;
  }
  if (*__error() != 2 && *__error() != 20) {
    goto LABEL_69;
  }
  if (v65 == 0x7972617262694C2FLL
    && v66[0] == 0x657265666572502FLL
    && *(void *)((char *)v66 + 5) == 0x7365636E657265)
  {
    if (!_CFPrefsCreatePreferencesDirectory((const char *)&v65)) {
      goto LABEL_69;
    }
    if ((*(unsigned char *)(v11 + 142) & 0x10) != 0)
    {
      uint64_t v41 = 384;
    }
    else if (CFEqual(*(CFTypeRef *)(v11 + 40), @"kCFPreferencesAnyUser"))
    {
      uint64_t v41 = 420;
    }
    else
    {
      uint64_t v41 = 384;
    }
    int v30 = openat(v57, __s1, 512, v41);
    int v17 = 1;
LABEL_65:
    if ((v30 & 0x80000000) == 0)
    {
      bzero(buf, 0x402uLL);
      if (fcntl(v30, 50, buf) == -1)
      {
        if ((v57 & 0x80000000) == 0) {
          close(v57);
        }
        close(v30);
        xpc_object_t v47 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:]((uint64_t)__s2, v47);
        }
      }
      else
      {
        *(_DWORD *)(v11 + 128) = v57;
        *(void *)(v11 + 64) = strdup(__s1);
        *(void *)(v11 + 56) = strdup((const char *)buf);
        if (_canDup()) {
          *(_DWORD *)(v11 + 132) = v30;
        }
        else {
          close(v30);
        }
        if (!strcmp((const char *)buf, __s2))
        {
          char v51 = *(unsigned char *)(v11 + 143) & 0xFD;
        }
        else
        {
          memset(&out_token, 0, sizeof(out_token));
          int v48 = lstat(__s2, &out_token);
          if ((out_token.st_mode & 0xF000) == 0xA000 && v48 == 0) {
            char v50 = 2;
          }
          else {
            char v50 = 0;
          }
          char v51 = v50 | *(unsigned char *)(v11 + 143) & 0xFD;
        }
        *(unsigned char *)(v11 + 143) = v51;
        if (((v34 | v10 ^ 1) & 1) != 0 || !sandbox_passthrough_access())
        {
          int v16 = 0;
          if (!v17) {
            return v16;
          }
          goto LABEL_102;
        }
        v52 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:]();
        }
      }
      int v16 = 7;
      if (!v17) {
        return v16;
      }
LABEL_102:
      *uint64_t v8 = 1;
      return v16;
    }
LABEL_69:
    int v16 = 0;
LABEL_70:
    int v40 = 1;
    goto LABEL_71;
  }
  v37 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    if (v17) {
      unsigned int v38 = "create";
    }
    else {
      unsigned int v38 = "open";
    }
    int v39 = *__error();
    *(_DWORD *)stat buf = 136446723;
    v60 = v38;
    __int16 v61 = 2081;
    uid_t v62 = __s2;
    __int16 v63 = 1024;
    LODWORD(v64) = v39;
    _os_log_impl(&dword_182B90000, v37, OS_LOG_TYPE_INFO, "Couldn't %{public}s %{private}s due to %{darwin.errno}d. Asking client to create directory.", buf, 0x1Cu);
  }
  int v40 = 0;
  int v16 = 5;
LABEL_71:
  if ((v57 & 0x80000000) == 0) {
    close(v57);
  }
  if (v40)
  {
    int v42 = *__error();
    v43 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      if (v17) {
        v53 = "create";
      }
      else {
        v53 = "open";
      }
      v54 = strerror(v42);
      *(_DWORD *)stat buf = 136446723;
      v60 = v53;
      __int16 v61 = 2081;
      uid_t v62 = __s2;
      __int16 v63 = 2082;
      v64 = v54;
      _os_log_debug_impl(&dword_182B90000, v43, OS_LOG_TYPE_DEBUG, "Couldn't %{public}s %{private}s due to %{public}s", buf, 0x20u);
    }
    if (v42 == 1
      && (cacheFileInfoForWriting_euid_egid_didCreate__deviceEverUnlocked & 1) == 0
      && (*(unsigned char *)(v11 + 142) & 0x20) == 0)
    {
      *(unsigned char *)(v11 + 142) |= 0x20u;
      out_token.st_dev = 0;
      objc_initWeak((id *)buf, (id)v11);
      qos_class_t v44 = qos_class_main();
      global_queue = dispatch_get_global_queue(v44, 2uLL);
      handler[0] = off_1ECE0A5A0;
      handler[1] = 3221225472;
      handler[2] = __58__CFPDSource_cacheFileInfoForWriting_euid_egid_didCreate___block_invoke;
      handler[3] = &unk_1ECE00008;
      objc_copyWeak(&v56, (id *)buf);
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token.st_dev, global_queue, handler);
      objc_destroyWeak(&v56);
      objc_destroyWeak((id *)buf);
    }
    return 7;
  }
  return v16;
}

- (BOOL)getUncanonicalizedPath:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  int64_t v4 = (os_unfair_lock_s *)(a1 + 96);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  CFStringRef v5 = *(const __CFString **)(a1 + 88);
  if (v5)
  {
    CFStringEncoding v6 = CFStringFileSystemEncoding();
    BOOL v7 = CFStringGetCString(v5, a2, 1024, v6) != 0;
    os_unfair_lock_unlock(v4);
    return v7;
  }
  os_unfair_lock_unlock(v4);

  return -[CFPDSource _getUncanonicalizedPath:](a1, (UInt8 *)a2);
}

- (void)drainPendingChanges
{
  __assert_rtn("-[CFPDSource drainPendingChanges]", "CFPDSource.m", 1744, "count % CHANGE_QUEUE_TUPLE_COUNT == 0");
}

- (void)setPlist:(int)a3 owner:(unsigned int)a4 mode:
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 108));
    if ([*(id *)(a1 + 16) purgable]) {
      -[CFPDSource setPlist:owner:mode:]();
    }
    uint64_t v8 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = a2;
    if (v8) {

    }
    *(_DWORD *)(a1 + 112) = a3;
    *(unsigned char *)(a1 + 142) = (a4 >> 1) & 0x80 | *(unsigned char *)(a1 + 142) & 0x7F;
    *(unsigned char *)(a1 + 143) = *(unsigned char *)(a1 + 143) & 0xFE | ((a4 & 4) != 0);
  }
}

- (uint64_t)openActualPath
{
  if (!a1) {
    return 0;
  }
  int v2 = *(_DWORD *)(a1 + 132);
  if (v2 == -1)
  {
    int v4 = *(_DWORD *)(a1 + 128);
    if (v4 == -1 || (CFStringRef v5 = *(const char **)(a1 + 64)) == 0)
    {
      *__error() = 22;
      return 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v3 = openat(v4, v5, 0);
      if (v3 != -1 && _canDup()) {
        *(_DWORD *)(a1 + 132) = dup(v3);
      }
    }
  }
  else
  {
    uint64_t v3 = dup(v2);
    lseek(*(_DWORD *)(a1 + 132), 0, 0);
  }
  return v3;
}

- (void)clearPlist
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 108));

    *(void *)(a1 + 16) = 0;
    *(_DWORD *)(a1 + 112) = 0;
    *(unsigned char *)(a1 + 142) &= ~0x80u;
    *(unsigned char *)(a1 + 143) &= ~1u;
  }
}

uint64_t __28__CFPDSource_acceptMessage___block_invoke_143(uint64_t a1, int a2, xpc_object_t value)
{
  return 1;
}

- (void)observingConnectionWasInvalidated:(id)a3
{
  v3[6] = *(void *)off_1ECE0A5B0;
  v3[0] = off_1ECE0A5A0;
  v3[1] = 3221225472;
  v3[2] = __48__CFPDSource_observingConnectionWasInvalidated___block_invoke;
  v3[3] = &unk_1ECDFE638;
  v3[4] = self;
  v3[5] = a3;
  -[CFPDSource observingConnectionsLockedSync:]((os_unfair_lock_s *)self, (uint64_t)v3);
}

- (void)asyncNotifyObserversOfWriteFromConnection:(id)a3 message:(id)a4
{
  v4[7] = *(void *)off_1ECE0A5B0;
  v4[0] = off_1ECE0A5A0;
  v4[1] = 3221225472;
  v4[2] = __64__CFPDSource_asyncNotifyObserversOfWriteFromConnection_message___block_invoke;
  v4[3] = &unk_1ECE00088;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[CFPDSource observingConnectionsLockedSync:]((os_unfair_lock_s *)self, (uint64_t)v4);
}

- (void)observingConnectionsLockedSync:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    uint64_t v3 = a1 + 25;
    os_unfair_lock_lock(a1 + 25);
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    os_unfair_lock_unlock(v3);
  }
}

const os_unfair_lock *__80__CFPDSource_processEndOfMessageIntendingToRemoveSource_replacingWithTombstone___block_invoke(uint64_t a1)
{
  int result = -[CFPDSource hasObservers](*(const os_unfair_lock **)(a1 + 32));
  if (result)
  {
    **(void **)(a1 + 40) = [[CFPDObserverOnlyTombstone alloc] initMatchingSource:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = **(void ***)(a1 + 40);
    return (const os_unfair_lock *)objc_msgSend(v4, "alreadyLocked_transferObservingConnectionsFromSource:", v3);
  }
  return result;
}

- (const)hasObservers
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_assert_owner(result + 25);
    int result = *(const os_unfair_lock **)&v1[18]._os_unfair_lock_opaque;
    if (result) {
      return (const os_unfair_lock *)(CFSetGetCount((CFSetRef)result) > 0);
    }
  }
  return result;
}

void __64__CFPDSource_asyncNotifyObserversOfWriteFromConnection_message___block_invoke(uint64_t a1)
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  if (-[CFPDSource hasObservers](*(const os_unfair_lock **)(a1 + 32)))
  {
    values[0] = _CFXPCCreateXPCObjectFromCFObject(*(__CFString **)(*(void *)(a1 + 32) + 48));
    values[1] = _CFXPCCreateXPCObjectFromCFObject(*(__CFString **)(*(void *)(a1 + 32) + 40));
    values[2] = xpc_BOOL_create(*(unsigned char *)(*(void *)(a1 + 32) + 138));
    values[3] = _CFXPCCreateXPCObjectFromCFObject((__CFString *)[*(id *)(a1 + 32) container]);
    values[4] = _CFXPCCreateXPCObjectFromCFObject((__CFString *)[*(id *)(a1 + 32) cloudConfigurationPath]);
    if (*(void *)(a1 + 40) && (int v2 = *(void **)(a1 + 48)) != 0)
    {
      size_t length = 0;
      long long context = 0u;
      long long v18 = 0u;
      CFStringRef data = (long long *)xpc_dictionary_get_data(v2, "CFPreferencesAuditToken", &length);
      if (data && length == 32)
      {
        long long v4 = data[1];
        long long context = *data;
        long long v18 = v4;
      }
      else
      {
        if (!xpc_dictionary_get_remote_connection(v2))
        {
          xpc_object_t value = xpc_dictionary_get_value(v2, "connection");
          if (!value || object_getClass(value) != (Class)off_1ECE0A678) {
            __64__CFPDSource_asyncNotifyObserversOfWriteFromConnection_message___block_invoke_cold_1();
          }
        }
        xpc_connection_get_audit_token();
      }
      pid_t v5 = DWORD1(v18);
    }
    else
    {
      pid_t v5 = getpid();
    }
    xpc_object_t v7 = xpc_int64_create(v5);
    uint64_t v8 = *(void *)(a1 + 32);
    values[5] = v7;
    *(void *)&long long context = v8;
    xpc_object_t v9 = xpc_dictionary_create((const char *const *)_CFPrefsNotifyFuncKeys, values, 6uLL);
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)(a1 + 40);
    *((void *)&context + 1) = v9;
    *(void *)&long long v18 = v11;
    do
    {
      xpc_object_t v12 = values[v10];
      if (v12) {
        xpc_release(v12);
      }
      ++v10;
    }
    while (v10 != 6);
    int v13 = *(void **)(a1 + 32);
    unsigned int v14 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      _extractCFPDBits(0, 0, v13, (uint64_t)&__block_literal_global_389);
    }
    CFSetApplyFunction(*(CFSetRef *)(*(void *)(a1 + 32) + 72), (CFSetApplierFunction)notifyFunc, &context);
    xpc_release(*((xpc_object_t *)&context + 1));
  }
}

- (__CFString)cloudConfigurationPath
{
  return 0;
}

void __48__CFPDSource_observingConnectionWasInvalidated___block_invoke(uint64_t a1)
{
}

- (void)stopNotifyingObserver:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 100));
    long long v4 = *(__CFSet **)(a1 + 72);
    if (v4)
    {
      CFSetRemoveValue(v4, a2);
      if (!CFSetGetCount(*(CFSetRef *)(a1 + 72)))
      {
        CFRelease(*(CFTypeRef *)(a1 + 72));
        *(void *)(a1 + 72) = 0;
      }
    }
  }
}

- (void)finishedNonRequestWriteWithResult:(__CFDictionary *)a3
{
  [(CFPDSource *)self lock];
  [(CFPDSource *)self handleWritingResult:a3];
  -[CFPDSource tryEndAccessingPlist]((uint64_t)self);

  [(CFPDSource *)self unlock];
}

- (void)handleWritingResult:(__CFDictionary *)a3
{
  uint64_t v15 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!a3)
  {
LABEL_4:
    if ((*((unsigned char *)self + 142) & 2) == 0)
    {
      int cachedPlistFD = self->_cachedPlistFD;
      if ((cachedPlistFD & 0x80000000) == 0) {
        close(cachedPlistFD);
      }
      self->_int cachedPlistFD = -1;
      int parentFD = self->_parentFD;
      if ((parentFD & 0x80000000) == 0) {
        close(parentFD);
      }
      self->_int parentFD = -1;
      free(self->_fileName);
      self->_fileName = 0;
    }
    return;
  }
  CFArrayRef Value = CFDictionaryGetValue(a3, self);
  if (Value != (const void *)28)
  {
    if (Value) {
      return;
    }
    goto LABEL_4;
  }
  uint64_t v8 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    userName = self->_userName;
    domain = self->_domain;
    int v11 = 138412546;
    xpc_object_t v12 = domain;
    __int16 v13 = 2112;
    unsigned int v14 = userName;
    _os_log_impl(&dword_182B90000, v8, OS_LOG_TYPE_INFO, "Re-marking { %@, %@ } as dirty because previous write failed with ENOSPC", (uint8_t *)&v11, 0x16u);
  }
  [(CFPDSource *)self setDirty:1];
}

- (id)createDiskWrite
{
  uint64_t v26 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(CFPDDataBuffer *)self->_plist purgable]) {
    -[CFPDSource createDiskWrite]();
  }
  [(CFPDSource *)self drainPendingChanges];
  os_unfair_lock_lock(&self->_writeLock);
  if ((*((unsigned char *)self + 142) & 2) == 0) {
    goto LABEL_16;
  }
  if (!self->_plist) {
    goto LABEL_16;
  }
  if (self->_parentFD == -1) {
    goto LABEL_16;
  }
  actualPath = self->_actualPath;
  if (!actualPath) {
    goto LABEL_16;
  }
  size_t v4 = strlen(self->_actualPath);
  CFURLRef v5 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)actualPath, v4, 0);
  uint64_t lastEuid = self->_lastEuid;
  unsigned int lastEgid = self->_lastEgid;
  __int16 v8 = 384;
  if ((*((unsigned char *)self + 142) & 0x10) == 0)
  {
    if (CFEqual(self->_userName, @"kCFPreferencesAnyUser")) {
      __int16 v8 = 420;
    }
    else {
      __int16 v8 = 384;
    }
  }
  int v9 = _CFPrefsTemporaryFDToWriteTo((uint64_t)v5, lastEuid);
  CFRelease(v5);
  if (v9 < 0)
  {
    uint64_t v15 = __error();
    -[CFPDSource setDirty:](self, "setDirty:", -[CFPDSource shouldStayDirtyAfterOpenForWritingFailureWithErrno:]((uint64_t)self, *v15));
LABEL_16:
    os_unfair_lock_unlock(&self->_writeLock);
    return 0;
  }
  memcpy(__dst, "CFPrefs domain writing: ", sizeof(__dst));
  if (!CFStringGetCString(self->_domain, &__dst[24], 488, 0x8000100u)) {
    __strncat_chk();
  }
  uint64_t v10 = os_transaction_create();
  int v11 = self->_plist;
  int v12 = (*((unsigned __int8 *)self + 142) >> 6) & 1;
  int parentFD = self->_parentFD;
  if (parentFD == -2) {
    int v14 = -2;
  }
  else {
    int v14 = dup(parentFD);
  }
  int v17 = strdup(self->_fileName);
  [(CFPDSource *)self setDirty:0];
  v18[0] = off_1ECE0A5A0;
  v18[1] = 3221225472;
  v18[2] = __29__CFPDSource_createDiskWrite__block_invoke;
  v18[3] = &unk_1ECE00030;
  int v19 = v9;
  int v20 = lastEuid;
  __int16 v23 = v8;
  char v24 = v12;
  unsigned int v21 = lastEgid;
  int v22 = v14;
  v18[4] = v11;
  v18[5] = self;
  v18[6] = v10;
  v18[7] = v17;
  return (id)[v18 copy];
}

- (BOOL)enqueueNewKey:(id)a3 value:(id)a4 encoding:(int)a5 inBatch:(BOOL)a6 fromMessage:(id)a7
{
  applier[6] = *(void *)off_1ECE0A5B0;
  if (object_getClass(a3) != (Class)off_1ECE0A6B8) {
    -[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:]();
  }
  if (a5 == 1)
  {
    applier[0] = off_1ECE0A5A0;
    applier[1] = 3221225472;
    applier[2] = __63__CFPDSource_enqueueNewKey_value_encoding_inBatch_fromMessage___block_invoke;
    applier[3] = &unk_1ECE000B0;
    applier[4] = self;
    applier[5] = a7;
    xpc_dictionary_apply(a4, applier);
  }
  else
  {
    pendingChangesQueue = self->_pendingChangesQueue;
    if (!pendingChangesQueue)
    {
      pendingChangesQueue = (OS_xpc_object *)xpc_array_create(0, 0);
      self->_pendingChangesQueue = pendingChangesQueue;
    }
    size_t count = xpc_array_get_count(pendingChangesQueue);
    size_t v15 = count;
    if (count) {
      -[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:]();
    }
    if (count)
    {
      size_t v16 = 1;
      while (1)
      {
        xpc_object_t value = xpc_array_get_value(self->_pendingChangesQueue, v16 - 1);
        if (xpc_equal(a3, value)) {
          break;
        }
        size_t v18 = v16 + 1;
        v16 += 2;
        if (v18 >= v15) {
          goto LABEL_11;
        }
      }
      xpc_object_t v20 = xpc_array_get_value(self->_pendingChangesQueue, v16);
      uint64_t v21 = _CFPrefsSizeOfValue(a4, 0);
      uint64_t v22 = v21 - _CFPrefsSizeOfValue(v20, 0);
      __int16 v23 = self->_pendingChangesQueue;
      self->_pendingChangesSize += v22;
      xpc_array_set_value(v23, v16, a4);
    }
    else
    {
LABEL_11:
      xpc_array_append_value(self->_pendingChangesQueue, a3);
      xpc_array_append_value(self->_pendingChangesQueue, a4);
      if (object_getClass(a4) != (Class)off_1ECE0A6B0)
      {
        uint64_t v19 = _CFPrefsSizeOfValue(a4, 0);
        self->_pendingChangesSize += _CFPrefsSizeOfValue(a3, 0) + v19;
      }
    }
  }
  [(CFPDSource *)self setDirty:1];
  if (!a6 && self->_pendingChangesSize > 0x20000)
  {

    self->_pendingChangesSize = 0;
  }
  return 1;
}

- (void)setDirty:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v3) {
    [(CFPDSource *)self updateShmemEntry];
  }
  char v5 = *((unsigned char *)self + 142);
  if (((((v5 & 2) == 0) ^ v3) & 1) == 0)
  {
    if (v3) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 142) = v5 & 0xFD | v6;
    if (v3)
    {
      uint64_t v7 = +[_CFPrefsSynchronizer sharedInstance]();
      -[_CFPrefsSynchronizer noteDirtySource:](v7, self);
      memcpy(__dst, "CFPrefs domain dirty: ", sizeof(__dst));
      if (!CFStringGetCString(self->_domain, &__dst[22], 490, 0x8000100u)) {
        __strncat_chk();
      }
      self->_dirtyTransaction = (OS_os_transaction *)os_transaction_create();
    }
    else
    {

      self->_dirtyTransaction = 0;
    }
  }
}

- (void)updateShmemEntry
{
}

- (void)setObserved:(void *)a3 bySenderOfMessage:
{
  uint64_t v13 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 27);
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    if (!remote_connection)
    {
      xpc_object_t value = (_xpc_connection_s *)xpc_dictionary_get_value(a3, "connection");
      if (!value || (remote_connection = value, object_getClass(value) != (Class)off_1ECE0A678)) {
        -[CFPDSource setObserved:bySenderOfMessage:]();
      }
    }
    v11[0] = off_1ECE0A5A0;
    v11[1] = 3221225472;
    v11[2] = __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke;
    v11[3] = &unk_1ECE00100;
    char v12 = a2;
    v11[4] = a1;
    if (withClientContext(remote_connection, (uint64_t)v11))
    {
      v9[0] = off_1ECE0A5A0;
      v9[1] = 3221225472;
      v9[2] = __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke_2;
      v9[3] = &unk_1ECE00128;
      char v10 = a2;
      v9[4] = a1;
      v9[5] = a3;
      v9[6] = remote_connection;
      __int16 v8 = (os_unfair_lock_s *)&a1[25];
      os_unfair_lock_lock(v8);
      __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke_2((uint64_t)v9);
      os_unfair_lock_unlock(v8);
    }
  }
}

void __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *(void *)off_1ECE0A5B0;
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[9];
  if (*(unsigned char *)(a1 + 56))
  {
    if (!v3)
    {
      *(void *)(*(void *)(a1 + 32) + 72) = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeSetCallBacks);
      int v2 = *(void **)(a1 + 32);
    }
    size_t v4 = *(void **)(a1 + 40);
    char v5 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      _extractCFPDBits(v4, 0, v2, (uint64_t)&__block_literal_global_406);
    }
    char v6 = *(__CFSet **)(*(void *)(a1 + 32) + 72);
    uint64_t v7 = *(const void **)(a1 + 48);
    CFSetAddValue(v6, v7);
  }
  else if (v3)
  {
    __int16 v8 = *(void **)(a1 + 40);
    size_t length = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    CFStringRef data = (long long *)xpc_dictionary_get_data(v8, "CFPreferencesAuditToken", &length);
    if (data && length == 32)
    {
      long long v10 = data[1];
      long long v16 = *data;
      long long v17 = v10;
    }
    else
    {
      if (!xpc_dictionary_get_remote_connection(v8))
      {
        xpc_object_t value = xpc_dictionary_get_value(v8, "connection");
        if (!value || object_getClass(value) != (Class)off_1ECE0A678) {
          __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke_2_cold_1();
        }
      }
      xpc_connection_get_audit_token();
    }
    int v12 = DWORD1(v17);
    uint64_t v13 = *(void **)(a1 + 32);
    int v14 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(void *)&long long v16 = off_1ECE0A5A0;
      *((void *)&v16 + 1) = 3221225472;
      *(void *)&long long v17 = __DEBUG_STOPPED_OBSERVING_block_invoke;
      *((void *)&v17 + 1) = &unk_1ECE004F0;
      size_t v18 = v8;
      int v19 = v12;
      _extractCFPDBits(v8, 0, v13, (uint64_t)&v16);
    }
    -[CFPDSource stopNotifyingObserver:](*(void *)(a1 + 32), *(const void **)(a1 + 48));
  }
}

- (BOOL)validateSandboxForWrite:(const char *)a3 containerPath:
{
  uint64_t v30 = *(void *)off_1ECE0A5B0;
  if (result)
  {
    uint64_t v5 = result;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(result + 108));
    if (*(_DWORD *)(v5 + 128) == -1)
    {
      return 0;
    }
    else if (_CFPrefsMessageSenderIsSandboxed(a2))
    {
      string = (char *)xpc_dictionary_get_string(a2, "CFPreferencesDomain");
      size_t v7 = strlen(a3);
      if (v7) {
        BOOL v8 = strncmp(*(const char **)(v5 + 56), a3, v7) != 0;
      }
      else {
        BOOL v8 = 1;
      }
      uint64_t v9 = strchr(string, 47);
      BOOL v10 = xpc_dictionary_get_BOOL(a2, "CFPreferencesHasFixedUpContainer");
      if (!v8 || v10 || v9)
      {
        length[0] = 0;
        long long v28 = 0u;
        long long v29 = 0u;
        CFStringRef data = (long long *)xpc_dictionary_get_data(a2, "CFPreferencesAuditToken", length);
        if (data && length[0] == 32)
        {
          long long v14 = data[1];
          long long v28 = *data;
          long long v29 = v14;
        }
        else
        {
          if (!xpc_dictionary_get_remote_connection(a2))
          {
            xpc_object_t value = xpc_dictionary_get_value(a2, "connection");
            if (!value || object_getClass(value) != (Class)off_1ECE0A678) {
              -[CFPDSource validateSandboxForWrite:containerPath:]();
            }
          }
          xpc_connection_get_audit_token();
        }
        int v22 = *(_DWORD *)(v5 + 128);
        uint64_t v24 = *(void *)(v5 + 56);
        __int16 v23 = *(const char **)(v5 + 64);
        unsigned int v25 = 384;
        if ((*(unsigned char *)(v5 + 142) & 0x10) == 0)
        {
          if (CFEqual(*(CFTypeRef *)(v5 + 40), @"kCFPreferencesAnyUser")) {
            unsigned int v25 = 420;
          }
          else {
            unsigned int v25 = 384;
          }
        }
        *(_OWORD *)size_t length = v28;
        long long v27 = v29;
        int v20 = checkFileWriteData(length, v24, v22, v23, v25);
      }
      else
      {
        length[0] = 0;
        long long v28 = 0u;
        long long v29 = 0u;
        int v11 = (long long *)xpc_dictionary_get_data(a2, "CFPreferencesAuditToken", length);
        if (v11 && length[0] == 32)
        {
          long long v12 = v11[1];
          long long v28 = *v11;
          long long v29 = v12;
        }
        else
        {
          if (!xpc_dictionary_get_remote_connection(a2))
          {
            xpc_object_t v15 = xpc_dictionary_get_value(a2, "connection");
            if (!v15 || object_getClass(v15) != (Class)off_1ECE0A678) {
              -[CFPDSource validateSandboxForWrite:containerPath:]();
            }
          }
          xpc_connection_get_audit_token();
        }
        *(_OWORD *)size_t length = v28;
        long long v27 = v29;
        if (sandbox_check_by_audit_token())
        {
          int v16 = *(_DWORD *)(v5 + 128);
          uint64_t v18 = *(void *)(v5 + 56);
          long long v17 = *(const char **)(v5 + 64);
          unsigned int v19 = 384;
          if ((*(unsigned char *)(v5 + 142) & 0x10) == 0)
          {
            if (CFEqual(*(CFTypeRef *)(v5 + 40), @"kCFPreferencesAnyUser")) {
              unsigned int v19 = 420;
            }
            else {
              unsigned int v19 = 384;
            }
          }
          *(_OWORD *)size_t length = v28;
          long long v27 = v29;
          int v20 = checkFileWriteData(length, v18, v16, v17, v19);
          if (v20) {
            _CFPrefsSandboxCheckForMessage(a2);
          }
        }
        else
        {
          int v20 = 0;
        }
      }
      return v20 == 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)validateSandboxForRead:(const char *)a3 containerPath:
{
  uint64_t v26 = *(void *)off_1ECE0A5B0;
  if (result)
  {
    if (!a2) {
      -[CFPDSource validateSandboxForRead:containerPath:]();
    }
    uint64_t v5 = result;
    if (*(void *)(result + 56))
    {
LABEL_8:
      if (_CFPrefsMessageSenderIsSandboxed(a2))
      {
        string = (char *)xpc_dictionary_get_string(a2, "CFPreferencesDomain");
        length[0] = 0;
        long long v24 = 0u;
        long long v25 = 0u;
        CFStringRef data = (long long *)xpc_dictionary_get_data(a2, "CFPreferencesAuditToken", length);
        if (data && length[0] == 32)
        {
          long long v12 = data[1];
          long long v24 = *data;
          long long v25 = v12;
        }
        else
        {
          if (!xpc_dictionary_get_remote_connection(a2))
          {
            xpc_object_t value = xpc_dictionary_get_value(a2, "connection");
            if (!value || object_getClass(value) != (Class)off_1ECE0A678) {
              -[CFPDSource validateSandboxForRead:containerPath:].cold.4();
            }
          }
          xpc_connection_get_audit_token();
        }
        if (*(unsigned char *)(v5 + 139))
        {
          if (!xpc_dictionary_get_remote_connection(a2))
          {
            xpc_object_t v14 = xpc_dictionary_get_value(a2, "connection");
            if (!v14 || object_getClass(v14) != (Class)off_1ECE0A678) {
              -[CFPDSource validateSandboxForRead:containerPath:]();
            }
          }
          xpc_object_t v15 = (const char *)xpc_connection_copy_bundle_id();
          int v16 = (char *)v15;
          if (v15 && !strcmp(v15, string))
          {
            int v17 = 0;
          }
          else
          {
            *(_OWORD *)size_t length = v24;
            long long v23 = v25;
            int v17 = sandbox_check_by_audit_token();
          }
          free(v16);
          if (!v17) {
            return 1;
          }
          return 2;
        }
        size_t v18 = strlen(a3);
        if (v18) {
          BOOL v19 = strncmp(*(const char **)(v5 + 56), a3, v18) != 0;
        }
        else {
          BOOL v19 = 1;
        }
        int v20 = strchr(string, 47);
        BOOL v21 = xpc_dictionary_get_BOOL(a2, "CFPreferencesHasFixedUpContainer");
        if (!v19 || v21 || v20)
        {
          *(_OWORD *)size_t length = v24;
          long long v23 = v25;
          if (sandbox_check_by_audit_token()) {
            return 2;
          }
        }
        else
        {
          *(_OWORD *)size_t length = v24;
          long long v23 = v25;
          if (sandbox_check_by_audit_token())
          {
            *(_OWORD *)size_t length = v24;
            long long v23 = v25;
            if (sandbox_check_by_audit_token())
            {
              *(_OWORD *)size_t length = v24;
              long long v23 = v25;
              sandbox_check_by_audit_token();
              return 2;
            }
          }
        }
      }
      return 1;
    }
    [(id)result cacheFileInfo];
    uint64_t v6 = *(void *)(v5 + 56);
    size_t v7 = (void *)MEMORY[0x185313310](a2);
    BOOL v8 = _CFPrefsDaemonLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v9) {
        -[CFPDSource validateSandboxForRead:containerPath:].cold.5();
      }
      free(v7);
      goto LABEL_8;
    }
    if (v9) {
      -[CFPDSource validateSandboxForRead:containerPath:]();
    }
    free(v7);
    return 9;
  }
  return result;
}

id __58__CFPDSource_cacheFileInfoForWriting_euid_egid_didCreate___block_invoke(uint64_t a1, int token)
{
  v4[5] = *(void *)off_1ECE0A5B0;
  notify_cancel(token);
  cacheFileInfoForWriting_euid_egid_didCreate__deviceEverUnlocked = 1;
  id result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    v4[0] = off_1ECE0A5A0;
    v4[1] = 3221225472;
    v4[2] = __32__CFPDSource_handleDeviceUnlock__block_invoke;
    v4[3] = &unk_1ECDB0298;
    v4[4] = result;
    return (id)[result lockedSync:v4];
  }
  return result;
}

- (void)handleDeviceUnlock
{
  v1[5] = *(void *)off_1ECE0A5B0;
  if (result)
  {
    v1[0] = off_1ECE0A5A0;
    v1[1] = 3221225472;
    v1[2] = __32__CFPDSource_handleDeviceUnlock__block_invoke;
    v1[3] = &unk_1ECDB0298;
    v1[4] = result;
    return (void *)[result lockedSync:v1];
  }
  return result;
}

- (void)respondToFileWrittenToBehindOurBack
{
  v2[5] = *(void *)off_1ECE0A5B0;
  v2[0] = off_1ECE0A5A0;
  v2[1] = 3221225472;
  v2[2] = __49__CFPDSource_respondToFileWrittenToBehindOurBack__block_invoke;
  v2[3] = &unk_1ECDB0298;
  v2[4] = self;
  [(CFPDSource *)self lockedSync:v2];
}

uint64_t __49__CFPDSource_respondToFileWrittenToBehindOurBack__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) syncWriteToDiskAndFlushCacheForReason:@"client invalidated domain"];
  [*(id *)(a1 + 32) updateShmemEntry];
  int v2 = *(void **)(a1 + 32);

  return [v2 asyncNotifyObserversOfWriteFromConnection:0 message:0];
}

- (BOOL)byHost
{
  return self->_byHost;
}

- (id)description
{
  int v2 = [(CFPDSource *)self debugDump];

  return v2;
}

- (uint64_t)shouldStayDirtyAfterOpenForWritingFailureWithErrno:(uint64_t)a1
{
  uint64_t v14 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  size_t v4 = _CFPrefsDaemonLog();
  uint64_t v5 = v4;
  if (a2 != 28)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(CFPDSource *)a1 shouldStayDirtyAfterOpenForWritingFailureWithErrno:v5];
    }
    return 0;
  }
  uint64_t v6 = 1;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl(&dword_182B90000, v5, OS_LOG_TYPE_INFO, "Re-marking { %@, %@ } as dirty because attempt to open temporary path failed with ENOSPC", (uint8_t *)&v10, 0x16u);
  }
  return v6;
}

- (void)cleanUpIfNecessaryAfterCreatingPlist
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  uint64_t v3 = __error();
  strerror(*v3);
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_2_4(&dword_182B90000, a2, v4, "couldn't stat file at %{private}s due to \"%{public}s\"", v5);
}

- (void)markNeedsToReloadFromDiskDueToFailedWrite
{
  v1[5] = *(void *)off_1ECE0A5B0;
  if (result)
  {
    v1[0] = off_1ECE0A5A0;
    v1[1] = 3221225472;
    v1[2] = __55__CFPDSource_markNeedsToReloadFromDiskDueToFailedWrite__block_invoke;
    v1[3] = &unk_1ECDB0298;
    v1[4] = result;
    return (void *)[result lockedAsync:v1];
  }
  return result;
}

- (void)syncWriteToDiskAndFlushCacheForReason:(__CFString *)a3
{
  [(CFPDSource *)self syncWriteToDisk];

  [(CFPDSource *)self clearCacheForReason:a3];
}

- (void)syncWriteToDisk
{
  uint64_t v3 = [(CFPDSource *)self createDiskWrite];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v4 = (const void *)v3[2]();
    [(CFPDSource *)self handleWritingResult:v4];
    uint64_t v3 = v5;
    if (v4)
    {
      CFRelease(v4);
      uint64_t v3 = v5;
    }
  }
}

uint64_t __55__CFPDSource_markNeedsToReloadFromDiskDueToFailedWrite__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearCacheForReason:@"previous error"];
  int v2 = *(void **)(a1 + 32);

  return [v2 updateShmemEntry];
}

uint64_t __32__CFPDSource_handleDeviceUnlock__block_invoke(uint64_t a1)
{
  uint64_t v13 = *(void *)off_1ECE0A5B0;
  int v2 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v5 = v3[5];
    uint64_t v4 = v3[6];
    int v7 = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = [v3 container];
    _os_log_impl(&dword_182B90000, v2, OS_LOG_TYPE_INFO, "Responding to device unlock to refresh preferences reads previously denied by data protection { %@, %@, %@ }", (uint8_t *)&v7, 0x20u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 142) &= ~0x20u;
  [*(id *)(a1 + 32) syncWriteToDiskAndFlushCacheForReason:@"device was unlocked"];
  [*(id *)(a1 + 32) updateShmemEntry];
  return [*(id *)(a1 + 32) asyncNotifyObserversOfWriteFromConnection:0 message:0];
}

void __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke()
{
  os_log_t v0 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_cold_1();
  }
}

void __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_70()
{
  os_log_t v0 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_70_cold_1();
  }
}

void __33__CFPDSource_drainPendingChanges__block_invoke()
{
  os_log_t v0 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __33__CFPDSource_drainPendingChanges__block_invoke_cold_1();
  }
}

uint64_t __63__CFPDSource_enqueueNewKey_value_encoding_inBatch_fromMessage___block_invoke(uint64_t a1, char *string, uint64_t a3)
{
  xpc_object_t v5 = xpc_string_create(string);
  [*(id *)(a1 + 32) enqueueNewKey:v5 value:a3 encoding:0 inBatch:1 fromMessage:*(void *)(a1 + 40)];
  xpc_release(v5);
  return 1;
}

- (__CFString)debugDump
{
  uint64_t v3 = [(CFPDSource *)self copyUncanonicalizedPath];
  userName = self->_userName;
  domain = self->_domain;
  plist = self->_plist;
  uint64_t generationShmemIndex = self->_generationShmemIndex;
  unsigned int v8 = *((unsigned __int8 *)self + 142);
  uint64_t v9 = (v8 >> 1) & 1;
  BOOL byHost = self->_byHost;
  uint64_t v11 = 384;
  if ((v8 & 0x10) == 0)
  {
    if (CFEqual(userName, @"kCFPreferencesAnyUser")) {
      uint64_t v11 = 420;
    }
    else {
      uint64_t v11 = 384;
    }
  }
  uint64_t v12 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"\n*****************************************************\nDomain: %@\nUser: %@\nPath: %@\nplist data:%@\nshmem index:%d\ndirty:%d\nbyHost:%d\nmode:%o\n", domain, userName, v3, plist, generationShmemIndex, v9, byHost, v11);
  if (v3) {
    CFRelease(v3);
  }
  return v12;
}

- (void)clearCacheForReason:(__CFString *)a3
{
  v8[5] = *(void *)off_1ECE0A5B0;
  xpc_object_t v5 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = off_1ECE0A5A0;
    v8[1] = 3221225472;
    v8[2] = __DEBUG_CACHE_EVICT_block_invoke;
    v8[3] = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
    v8[4] = a3;
    _extractCFPDBits(0, 0, self, (uint64_t)v8);
  }
  [(CFPDSource *)self setDirty:0];
  pendingChangesQueue = self->_pendingChangesQueue;
  if (pendingChangesQueue) {
    xpc_release(pendingChangesQueue);
  }
  -[CFPDSource clearPlist]((uint64_t)self);
  self->_pendingChangesQueue = 0;
  self->_pendingChangesSize = 0;
  free(self->_actualPath);
  self->_actualPath = 0;
  *((unsigned char *)self + 143) &= ~2u;
  free(self->_fileName);
  self->_fileName = 0;
  int parentFD = self->_parentFD;
  if ((parentFD & 0x80000000) == 0) {
    close(parentFD);
  }
  self->_int parentFD = -1;
}

- (void)lockedAsync:(id)a3
{
  block[6] = *(void *)off_1ECE0A5B0;
  block[0] = off_1ECE0A5A0;
  block[1] = 3221225472;
  block[2] = __26__CFPDSource_lockedAsync___block_invoke;
  block[3] = &unk_1ECE000D8;
  block[4] = self;
  block[5] = a3;
  dispatch_block_t v3 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
  qos_class_t v4 = qos_class_self();
  global_queue = dispatch_get_global_queue(v4, 0);
  dispatch_async(global_queue, v3);
}

uint64_t __26__CFPDSource_lockedAsync___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(os_unfair_lock **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  [(os_unfair_lock *)v1 lock];
  -[CFPDSource beginHandlingRequest]((uint64_t)v1);
  (*(void (**)(uint64_t))(v2 + 16))(v2);
  -[CFPDSource endHandlingRequest](v1);

  return [(os_unfair_lock *)v1 unlock];
}

- (uint64_t)validateAccessToken:(int)a3 accessType:
{
  uint64_t v45 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  if (a2 == -1) {
    return 4;
  }
  if (a3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }
  bzero(__s2, 0x400uLL);
  if ((a2 & 0x80000000) == 0)
  {
    memset(&v43, 0, sizeof(v43));
    if (fstat(a2, &v43))
    {
      int v7 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = *__error();
        *(_DWORD *)stat buf = 67109120;
        LODWORD(v39) = v8;
        uint64_t v9 = "Failed access token check because fstat failed: %{darwin.errno}d";
LABEL_12:
        uint64_t v10 = buf;
        uint64_t v11 = v7;
        uint32_t v12 = 8;
LABEL_13:
        _os_log_impl(&dword_182B90000, v11, OS_LOG_TYPE_INFO, v9, v10, v12);
        return v6;
      }
      return v6;
    }
    if (fcntl(a2, 50, __s2) == -1)
    {
      int v7 = _CFPrefsDaemonLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        return v6;
      }
      int v15 = *__error();
      *(_DWORD *)stat buf = 67109120;
      LODWORD(v39) = v15;
      uint64_t v9 = "Failed access token check because F_GETPATH failed: %{darwin.errno}d";
      goto LABEL_12;
    }
    uint64_t v13 = *(const char **)(a1 + 56);
    if (v13) {
      uint64_t v14 = strdup(v13);
    }
    else {
      uint64_t v14 = 0;
    }
    if (*(_DWORD *)(a1 + 128) == -1)
    {
      [(id)a1 cacheFileInfo];
      if (*(_DWORD *)(a1 + 128) == -1)
      {
        long long v25 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl(&dword_182B90000, v25, OS_LOG_TYPE_INFO, "Failed access token check because cacheFileInfo failed", buf, 2u);
        }
        free(v14);
        return v6;
      }
    }
    if (v14 && strcmp(*(const char **)(a1 + 56), v14))
    {
      int v16 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 56);
        *(_DWORD *)stat buf = 136315394;
        int v39 = v14;
        __int16 v40 = 2080;
        uint64_t v41 = v17;
        _os_log_impl(&dword_182B90000, v16, OS_LOG_TYPE_INFO, "Failed access token check because _actualPath has changed since the last-known path (%s vs %s)", buf, 0x16u);
      }
      [(id)a1 clearCacheForReason:@"observed actual path changed"];
      free(v14);
      return 4;
    }
    free(v14);
    if (byte_1EC090E09)
    {
      [(id)a1 setDirty:1];
      [(id)a1 syncWriteToDisk];
      [(id)a1 cacheFileInfo];
      byte_1EC090E09 = 0;
    }
    int v19 = -[CFPDSource openActualPath](a1);
    if (v19 == -1)
    {
      int v7 = _CFPrefsDaemonLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        return v6;
      }
      int v24 = *__error();
      *(_DWORD *)stat buf = 67109120;
      LODWORD(v39) = v24;
      uint64_t v9 = "Failed access token check because the file could not be opened: %{darwin.errno}d";
      goto LABEL_12;
    }
    int v20 = v19;
    memset(&v42, 0, sizeof(v42));
    if (fstat(v19, &v42))
    {
      BOOL v21 = _CFPrefsDaemonLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
LABEL_36:
        close(v20);
        return v6;
      }
      int v22 = *__error();
      *(_DWORD *)stat buf = 67109120;
      LODWORD(v39) = v22;
      long long v23 = buf;
LABEL_35:
      _os_log_impl(&dword_182B90000, v21, OS_LOG_TYPE_INFO, "Failed access token check because F_GETPATH failed: %{darwin.errno}d", v23, 8u);
      goto LABEL_36;
    }
    bzero(buf, 0x400uLL);
    if (fcntl(v20, 50, buf) == -1)
    {
      BOOL v21 = _CFPrefsDaemonLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
        goto LABEL_36;
      }
      int v27 = *__error();
      *(_DWORD *)int v34 = 67109120;
      LODWORD(v35) = v27;
      long long v23 = v34;
      goto LABEL_35;
    }
    close(v20);
    if (strcmp((const char *)buf, __s2))
    {
      uint64_t v26 = _CFPrefsDaemonLog();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
        return v6;
      }
      *(_DWORD *)int v34 = 136315394;
      v35 = __s2;
      __int16 v36 = 2080;
      v37 = buf;
      uint64_t v9 = "Failed access token check because path of token doesn't match verification path (%s vs %s)";
      uint64_t v10 = v34;
      uint64_t v11 = v26;
      uint32_t v12 = 22;
      goto LABEL_13;
    }
    long long v28 = *(const char **)(a1 + 56);
    if (!v28 || strcmp((const char *)buf, v28))
    {
      long long v29 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = *(uint8_t **)(a1 + 56);
        *(_DWORD *)int v34 = 136315394;
        v35 = __s2;
        __int16 v36 = 2080;
        v37 = v30;
        _os_log_impl(&dword_182B90000, v29, OS_LOG_TYPE_INFO, "Failed access token check because verification path doesn't match known actual path (%s vs %s)", v34, 0x16u);
      }
      [(id)a1 clearCacheForReason:@"observed actual path changed"];
      return v6;
    }
    if (v42.st_dev == v43.st_dev && v42.st_ino == v43.st_ino)
    {
      if (v42.st_nlink)
      {
        if (a3 != 1 || (fcntl(a2, 3, 0) & 3) == 2) {
          return 1;
        }
        unint64_t v33 = _CFPrefsDaemonLog();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
          return v6;
        }
        *(_WORD *)int v34 = 0;
        uint64_t v9 = "Failed access token check because the it was not opened for writing";
        uint64_t v10 = v34;
        uint64_t v11 = v33;
        uint32_t v12 = 2;
        goto LABEL_13;
      }
      uint64_t v31 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v34 = 0;
        unint64_t v32 = "Failed access token check because the file it references has been unlinked";
        goto LABEL_61;
      }
    }
    else
    {
      uint64_t v31 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v34 = 0;
        unint64_t v32 = "Failed access token check because inode of token doesn't match verification inode";
LABEL_61:
        _os_log_impl(&dword_182B90000, v31, OS_LOG_TYPE_INFO, v32, v34, 2u);
      }
    }
    return 4;
  }
  int v7 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v39) = a2;
    uint64_t v9 = "Failed access token check because %d is invalid";
    goto LABEL_12;
  }
  return v6;
}

uint64_t __118__CFPDSource_validateMessage_withNewKey_newValue_plistIsAvailableToRead_containerPath_fileUID_mode_diagnosticMessage___block_invoke(uint64_t a1, char *__s2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    BOOL v4 = isSpecialKey(__s2);
  }
  else {
    BOOL v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (void)handleAvoidCache
{
  if (result) {
    return (void *)[result syncWriteToDiskAndFlushCacheForReason:@"we're avoiding the cache"];
  }
  return result;
}

- (void)handleNeverCache
{
  if (result) {
    return (void *)[result syncWriteToDiskAndFlushCacheForReason:@"we're never caching"];
  }
  return result;
}

- (void)handleEUIDorEGIDMismatch
{
  if (result) {
    return (void *)[result syncWriteToDisk];
  }
  return result;
}

- (void)handleSynchronous
{
  if (result) {
    return (void *)[result syncWriteToDisk];
  }
  return result;
}

- (void)handleNoPlistFound
{
  if (result) {
    return (void *)[result syncWriteToDisk];
  }
  return result;
}

uint64_t (*__28__CFPDSource_acceptMessage___block_invoke())(void)
{
  os_log_t v0 = dlopen("/System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag", 256);
  id result = (uint64_t (*)(void))dlsym(v0, "MKBDeviceUnlockedSinceBoot");
  acceptMessage___CFMKBDeviceUnlockedSinceBoot = result;
  return result;
}

void __28__CFPDSource_acceptMessage___block_invoke_2()
{
  os_log_t v0 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __28__CFPDSource_acceptMessage___block_invoke_2_cold_1();
  }
}

- (void)cacheFileInfoForWriting:(os_log_t)log euid:egid:didCreate:.cold.1(os_log_t log)
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_182B90000, log, OS_LOG_TYPE_DEBUG, "Simulating ENOSPC in cacheFileInfo for testing", v1, 2u);
}

- (void)cacheFileInfoForWriting:(uint64_t)a1 euid:(NSObject *)a2 egid:didCreate:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  uint64_t v3 = __error();
  strerror(*v3);
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_2_4(&dword_182B90000, a2, v4, "Couldn't get real path for %{private}s due to %{public}s", v5);
}

- (void)cacheFileInfoForWriting:euid:egid:didCreate:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_1(&dword_182B90000, v0, v1, "No write access to parent directory of %{private}s", v2, v3, v4, v5, v6);
}

- (void)cacheFileInfoForWriting:euid:egid:didCreate:.cold.4()
{
  __error();
  OUTLINED_FUNCTION_8(&dword_182B90000, v0, v1, "Couldn't get parent path due to %{darwin.errno}d", v2, v3, v4, v5, 0);
}

- (void)cacheFileInfoForWriting:euid:egid:didCreate:.cold.5()
{
  __error();
  OUTLINED_FUNCTION_8(&dword_182B90000, v0, v1, "Couldn't get file name due to %{darwin.errno}d", v2, v3, v4, v5, 0);
}

- (void)cacheFileInfoForWriting:euid:egid:didCreate:.cold.6()
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  OUTLINED_FUNCTION_6_0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_182B90000, v1, OS_LOG_TYPE_DEBUG, "Couldn't open parent path %{private}s due to %{darwin.errno}d", v2, 0x12u);
}

- (void)cacheFileInfoForWriting:(uint64_t)a3 euid:(uint64_t)a4 egid:(uint64_t)a5 didCreate:(uint64_t)a6 .cold.7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)shouldStayDirtyAfterOpenForWritingFailureWithErrno:(NSObject *)a3 .cold.1(int a1, int __errnum, NSObject *a3)
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  strerror(__errnum);
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_2_4(&dword_182B90000, a3, v4, "cfprefsd couldn't open temporary path appropriate for %{private}s for writing due to \"%{public}s\". Cancelling attempt to save preferences", v5);
}

- (void)createDiskWrite
{
}

- (void)setPlist:owner:mode:.cold.1()
{
}

- (void)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:.cold.1()
{
}

- (void)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:.cold.2()
{
  uint64_t v3 = *(void *)off_1ECE0A5B0;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_182B90000, v0, v1, "Validation of plist read from disk failed. DELETING file. {%@ %@}", v2);
}

- (void)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:.cold.3()
{
  uint64_t v3 = *(void *)off_1ECE0A5B0;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_182B90000, v0, v1, "Validation of pre-existing plist failed. Clearing cache and re-reading from disk. {%@ %@}", v2);
}

void __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_2(*(void *)off_1ECE0A5B0);
  OUTLINED_FUNCTION_0_21();
  OUTLINED_FUNCTION_2_4(&dword_182B90000, v0, v1, "Found potentially bad pre-existing plist, but not clearing yet, as we weren't asked to validate {%@ %@}", v2);
}

void __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_70_cold_1()
{
  OUTLINED_FUNCTION_4_2(*(void *)off_1ECE0A5B0);
  OUTLINED_FUNCTION_0_21();
  OUTLINED_FUNCTION_2_4(&dword_182B90000, v0, v1, "Found potentially bad plist when reading from disk, but not deleting, because we weren't asked to validate {%@ %@}", v2);
}

void __64__CFPDSource_asyncNotifyObserversOfWriteFromConnection_message___block_invoke_cold_1()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

void __33__CFPDSource_drainPendingChanges__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_2(*(void *)off_1ECE0A5B0);
  OUTLINED_FUNCTION_0_21();
  OUTLINED_FUNCTION_2_4(&dword_182B90000, v0, v1, "Found potentially bad plist after draining pending changes {%@ %@}", v2);
}

- (void)enqueueNewKey:value:encoding:inBatch:fromMessage:.cold.1()
{
  __assert_rtn("-[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:]", "CFPDSource.m", 1819, "count % CHANGE_QUEUE_TUPLE_COUNT == 0");
}

- (void)enqueueNewKey:value:encoding:inBatch:fromMessage:.cold.2()
{
  __assert_rtn("-[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:]", "CFPDSource.m", 1801, "xpc_get_type(key) == XPC_TYPE_STRING");
}

- (void)validateSandboxForWrite:containerPath:.cold.1()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)validateSandboxForWrite:containerPath:.cold.2()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)validateSandboxForRead:containerPath:.cold.1()
{
}

- (void)validateSandboxForRead:containerPath:.cold.2()
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_4(&dword_182B90000, v0, (uint64_t)v0, "unable to validate sandbox access of message %{private}s in container %{private}s due to no plist path, conservatively assuming not allowed.", v1);
}

- (void)validateSandboxForRead:containerPath:.cold.3()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)validateSandboxForRead:containerPath:.cold.4()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)validateSandboxForRead:containerPath:.cold.5()
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_4(&dword_182B90000, v0, (uint64_t)v0, "Initial attempt to validate sandbox access of message %{private}s in container %{private}s due to no plist path, but we recovered successfully by recalculating the path.", v1);
}

- (void)validatePOSIXPermissionsForMessage:accessType:fileUID:mode:fullyValidated:.cold.1()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)setObserved:bySenderOfMessage:.cold.1()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

void __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke_2_cold_1()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)acceptMessage:.cold.1()
{
}

- (void)acceptMessage:.cold.2()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)acceptMessage:.cold.3()
{
  __assert_rtn("-[CFPDSource acceptMessage:]", "CFPDSource.m", 2755, "validity != _CFPrefsInvalidValidity");
}

- (void)acceptMessage:.cold.4()
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  OUTLINED_FUNCTION_6_0();
  _os_log_fault_impl(&dword_182B90000, v0, OS_LOG_TYPE_FAULT, "unable to find user information for requested user %s", v1, 0xCu);
}

- (void)acceptMessage:.cold.5()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

void __28__CFPDSource_acceptMessage___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4_2(*(void *)off_1ECE0A5B0);
  OUTLINED_FUNCTION_0_21();
  OUTLINED_FUNCTION_2_4(&dword_182B90000, v0, v1, "About to serve up potentially bad plist {%@ %@}", v2);
}

@end