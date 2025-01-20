@interface CFPrefsDaemon
+ (BOOL)_getUncanonicalizedSourcePath:(__CFString *)a3 withDomain:(__CFString *)a4 user:(int)a5 byHost:(const __CFString *)a6 containerPath:(int)a7 managed:(int)a8 managedUsesContainer:;
+ (CFStringRef)_copyUncanonicalizedSourcePathWithDomain:(__CFString *)a3 user:(int)a4 byHost:(const __CFString *)a5 containerPath:(int)a6 managed:(int)a7 managedUsesContainer:;
- (BOOL)enterSandbox;
- (BOOL)isInTestMode;
- (CFPDContainerSource)_createSourceWithDomain:(const void *)a3 user:(uint64_t)a4 container:(uint64_t)a5 byHost:(uint64_t)a6 managed:(uint64_t)a7 shmemIndex:;
- (os_unfair_lock_s)initWithRole:(int)a3 testMode:;
- (uint64_t)_initializeShmemPage:(uint64_t)result;
- (uint64_t)_setSource:(int)a3 isDead:;
- (uint64_t)getShmemName:(uint64_t)result bufLen:(char *)__str;
- (uint64_t)listener;
- (uint64_t)role;
- (uint64_t)shmem;
- (uint64_t)updateEntireShmem;
- (uint64_t)updateShmemForDomain:(uint64_t)result;
- (uint64_t)updateShmemIndex:(uint64_t)result;
- (uint64_t)userID;
- (void)handleAgentCheckInMessage:(uint64_t)a1;
- (void)handleFlushManagedMessage:(uint64_t)a3 replyHandler:;
- (void)handleFlushSourceForDomainMessage:(uint64_t)a3 replyHandler:;
- (void)handleMessage:(_xpc_connection_s *)a3 fromPeer:(uint64_t)a4 replyHandler:;
- (void)handleMultiMessage:(uint64_t)a3 replyHandler:;
- (void)handleSimulateTimerSynchronizeForTesting;
- (void)handleSourceMessage:(uint64_t)a3 replyHandler:;
- (void)handleUserDeletedMessage:(uint64_t)a1 replyHandler:(void *)a2;
- (void)logDomainInconsistencyForProcess:(void *)a3 message:(void *)a4 source:;
- (void)shmem;
- (void)synchronousWithSourceCache:(uint64_t)a1;
- (void)withAllKnownManagedSources:(uint64_t)a1;
- (void)withSnapshotOfSourcesForDomainIdentifier:(uint64_t)a3 performBlock:;
- (void)withSourceForDomain:(const __CFString *)a3 inContainer:(__CFString *)a4 user:(int)a5 byHost:(int)a6 managed:(int)a7 managedUsesContainer:(uint64_t)a8 cloudStoreEntitlement:(const void *)a9 cloudConfigurationPath:(uint64_t)a10 performWithSourceLock:(uint64_t)a11 afterReleasingSourceLock:;
@end

@implementation CFPrefsDaemon

uint64_t __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_5(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(a2 + 57) = 0;
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 24) = 0;
  return result;
}

uint64_t __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_6(uint64_t a1, void *a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void *)(a1 + 32);
    return [a2 observingConnectionWasInvalidated:v4];
  }
  else
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      return [a2 removeObservingConnection:v6 daemon:v7];
    }
  }
  return result;
}

BOOL __49__CFPrefsDaemon_handleMultiMessage_replyHandler___block_invoke(int a1, int a2, id a3)
{
  Class Class = object_getClass(a3);
  return Class == (Class)off_1ECE0A690 || Class == (Class)off_1ECE0A6B0;
}

- (uint64_t)listener
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

+ (BOOL)_getUncanonicalizedSourcePath:(__CFString *)a3 withDomain:(__CFString *)a4 user:(int)a5 byHost:(const __CFString *)a6 containerPath:(int)a7 managed:(int)a8 managedUsesContainer:
{
  self;
  if (a7) {
    BOOL PathForManagedBundleID = _CFPrefsGetPathForManagedBundleID(a3, a4, a8, a2);
  }
  else {
    BOOL PathForManagedBundleID = _CFPrefsGetPathForTriplet(a3, a4, a5, a6, a2);
  }
  if (!strncmp("/private/var/empty", (const char *)a2, 0x12uLL) || !strncmp("/var/empty", (const char *)a2, 0xAuLL))
  {
    size_t v16 = strlen((const char *)a2);
    bzero(a2, v16);
    BOOL PathForManagedBundleID = 0;
  }
  if (!strncmp((const char *)a2, "/private", 8uLL))
  {
    size_t v17 = strlen((const char *)a2);
    memmove(a2, a2 + 8, v17 - 7);
  }
  return PathForManagedBundleID;
}

- (uint64_t)_setSource:(int)a3 isDead:
{
  if (result)
  {
    uint64_t v5 = result;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(result + 48));
    uint64_t result = [a2 managed];
    if (result)
    {
      uint64_t result = [a2 shmemIndex];
      uint64_t v6 = *(void *)(v5 + 56 + 8 * (result >> 6));
      uint64_t v7 = v6 | (1 << result);
      uint64_t v8 = v6 & ~(1 << result);
      if (a3) {
        uint64_t v8 = v7;
      }
      *(void *)(v5 + 56 + 8 * (result >> 6)) = v8;
    }
  }
  return result;
}

- (void)handleMultiMessage:(uint64_t)a3 replyHandler:
{
  v34[1] = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return;
  }
  int v5 = a1;
  if (!xpc_dictionary_get_remote_connection(xdict))
  {
    xpc_object_t value = xpc_dictionary_get_value(xdict, "connection");
    if (!value || object_getClass(value) != (Class)off_1ECE0A678) {
      -[CFPrefsDaemon handleMultiMessage:replyHandler:]();
    }
  }
  xpc_object_t v7 = xpc_dictionary_get_value(xdict, "CFPreferencesMessages");
  if (!v7 || (uint64_t v8 = v7, object_getClass(v7) != (Class)off_1ECE0A668))
  {
    v9 = "There must be an array of contained messages present in multimessages";
LABEL_8:
    xpc_object_t ErrorReply = createErrorReply(v9, xdict);
    (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, ErrorReply);
    xpc_release(ErrorReply);
    return;
  }
  if (!xpc_array_apply(v8, &__block_literal_global_98))
  {
    v9 = "Contained messages must be dictionaries or nulls in multimessages";
    goto LABEL_8;
  }
  size_t count = xpc_array_get_count(v8);
  size_t v13 = count;
  if (count >> 60)
  {
    CFStringRef v24 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", count);
    v25 = +[NSException exceptionWithName:@"NSGenericException" reason:v24 userInfo:0];
    CFRelease(v24);
    objc_exception_throw(v25);
  }
  if (count <= 1) {
    size_t count = 1;
  }
  unint64_t v14 = MEMORY[0x1F4188790](count, v12);
  size_t v16 = (xpc_object_t *)((char *)&v26 - v15);
  v34[0] = 0;
  if (v13 >= 0x101)
  {
    size_t v17 = (xpc_object_t *)_CFCreateArrayStorage(v14, 0, v34);
    uint64_t v26 = (uint64_t)&v26;
    size_t v16 = v17;
    goto LABEL_20;
  }
  size_t v17 = 0;
  if (v13)
  {
    uint64_t v26 = (uint64_t)&v26;
LABEL_20:
    size_t v18 = 0;
    v27 = v17;
    do
    {
      v16[v18] = xpc_array_get_value(v8, v18);
      ++v18;
    }
    while (v13 != v18);
    for (uint64_t i = 0; i != v13; ++i)
    {
      xpc_object_t v20 = v16[i];
      v16[i] = 0;
      if (object_getClass(v20) == (Class)off_1ECE0A690)
      {
        v28 = off_1ECE0A5A0;
        uint64_t v29 = 3221225472;
        v30 = __49__CFPrefsDaemon_handleMultiMessage_replyHandler___block_invoke_2;
        v31 = &__block_descriptor_44_e33_v16__0__NSObject_OS_xpc_object__8l;
        v32 = v16;
        int v33 = i;
        -[CFPrefsDaemon handleMessage:fromPeer:replyHandler:](v5, v20);
      }
      if (!v16[i]) {
        v16[i] = xpc_null_create();
      }
    }
    int v21 = 1;
    size_t v17 = v27;
    goto LABEL_29;
  }
  int v21 = 0;
LABEL_29:
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  xpc_object_t v23 = xpc_array_create(v16, v13);
  xpc_dictionary_set_value(reply, "CFPreferencesMessages", v23);
  xpc_release(v23);
  if (v21)
  {
    do
    {
      if (object_getClass(*v16) != (Class)off_1ECE0A6B0) {
        xpc_release(*v16);
      }
      ++v16;
      --v13;
    }
    while (v13);
  }
  (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, reply);
  xpc_release(reply);
  free(v17);
}

- (void)handleMessage:(_xpc_connection_s *)a3 fromPeer:(uint64_t)a4 replyHandler:
{
  if (a1)
  {
    Class Class = object_getClass(a2);
    if (Class != (Class)off_1ECE0A6A0)
    {
      if (Class != (Class)off_1ECE0A690) {
        -[CFPrefsDaemon handleMessage:fromPeer:replyHandler:]();
      }
      if (byte_1EC090E04 && !xpc_dictionary_get_BOOL(a2, "PreviousMessageInjectedFailure"))
      {
        xpc_connection_cancel(a3);
      }
      else
      {
        xpc_dictionary_set_value(a2, "connection", a3);
        int64_t int64 = xpc_dictionary_get_int64(a2, "CFPreferencesOperation");
        switch(int64)
        {
          case 1:
          case 7:
          case 8:
          case 9:
            -[CFPrefsDaemon handleSourceMessage:replyHandler:](a1, a2, a4);
            break;
          case 2:
            -[CFPrefsDaemon handleAgentCheckInMessage:](a1);
            goto LABEL_17;
          case 3:
            -[CFPrefsDaemon handleFlushManagedMessage:replyHandler:](a1, a2, a4);
            break;
          case 4:
            -[CFPrefsDaemon handleFlushSourceForDomainMessage:replyHandler:](a1, a2, a4);
            break;
          case 5:
            -[CFPrefsDaemon handleMultiMessage:replyHandler:](a1, a2, a4);
            break;
          case 6:
            log_client_activity(a2, (uint64_t)"reported a user was deleted", 0);
            break;
          default:
            if (int64 == 999)
            {
              CFSetRef v10 = (const __CFSet *)+[_CFPrefsSynchronizer sharedInstance]();
              -[_CFPrefsSynchronizer synchronize](v10);
LABEL_17:
              v11 = *(void (**)(uint64_t, void))(a4 + 16);
              v11(a4, 0);
            }
            else
            {
              xpc_object_t ErrorReply = createErrorReply("Unsupported CFPreferences Daemon Operation", a2);
              (*(void (**)(uint64_t, xpc_object_t))(a4 + 16))(a4, ErrorReply);
              xpc_release(ErrorReply);
            }
            break;
        }
      }
    }
  }
}

- (void)handleSourceMessage:(uint64_t)a3 replyHandler:
{
  uint64_t v59 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return;
  }
  _CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded(a2);
  xpc_retain(a2);
  __int16 v47 = 0;
  uint64_t v6 = (__CFString *)_CFPrefsCopyFixedUpUserForMessage(a2, (BOOL *)&v47 + 1, &v47);
  if (xpc_user_sessions_enabled()
    && !xpc_user_sessions_get_session_uid()
    && !(_BYTE)v47
    && !CFEqual(v6, @"kCFPreferencesAnyUser"))
  {
    xpc_object_t ErrorReply = createErrorReply("Access to user preferences from system session not allowed", a2);
    (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, ErrorReply);
    xpc_release(ErrorReply);
    CFRelease(v6);
    return;
  }
  v46 = 0;
  BOOL v40 = xpc_dictionary_get_BOOL(a2, "CFPreferencesIsByHost");
  FixedUpDomainForMessage = (__CFString *)_CFPrefsGetFixedUpDomainForMessage(a2, v6, v40, &v46);
  if (FixedUpDomainForMessage)
  {
    xpc_dictionary_set_value(a2, "AllowWritingSpecialKeysToGlobalPreferences", 0);
    if (FixedUpDomainForMessage == @"kCFPreferencesAnyApplication" && eduModeEnabled())
    {
      remote_connection = xpc_dictionary_get_remote_connection(a2);
      if (!remote_connection)
      {
        xpc_object_t value = (_xpc_connection_s *)xpc_dictionary_get_value(a2, "connection");
        remote_connection = value;
        if (!value || object_getClass(value) != (Class)off_1ECE0A678) {
          -[CFPrefsDaemon handleSourceMessage:replyHandler:]();
        }
      }
      if (xpc_connection_get_euid(remote_connection) == 502
        && _CFPrefsBooleanEntitlementValueForMessage(a2, (uint64_t)"com.apple.private.defaults-shared-ipad-loginui"))
      {
        xpc_dictionary_set_value(a2, "AllowWritingSpecialKeysToGlobalPreferences", off_1ECE0A648);
      }
    }
    BOOL v41 = xpc_dictionary_get_BOOL(a2, "CFPreferencesIsManaged");
    CFSetRef v10 = xpc_dictionary_get_remote_connection(a2);
    if (!v10)
    {
      v11 = (_xpc_connection_s *)xpc_dictionary_get_value(a2, "connection");
      CFSetRef v10 = v11;
      if (!v11 || object_getClass(v11) != (Class)off_1ECE0A678) {
        -[CFPrefsDaemon handleSourceMessage:replyHandler:]();
      }
    }
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2020000000;
    char v57 = 1;
    v48 = off_1ECE0A5A0;
    uint64_t v49 = 3221225472;
    uint64_t v50 = (uint64_t)___CFPrefsMessageSenderIsSandboxed_block_invoke_0;
    v51 = (void (*)(uint64_t, uint64_t))&unk_1ECE004C8;
    v52 = (void (*)(uint64_t))a2;
    v53 = &v54;
    withClientContext(v10, (uint64_t)&v48);
    int v12 = *((unsigned __int8 *)v55 + 24);
    _Block_object_dispose(&v54, 8);
    BOOL v37 = xpc_dictionary_get_BOOL(a2, "CFPreferencesCurrentApplicationDomain");
    if (v41)
    {
      if (handleSourceMessage_replyHandler__onceToken != -1) {
        dispatch_once(&handleSourceMessage_replyHandler__onceToken, &__block_literal_global_66);
      }
      if (handleSourceMessage_replyHandler__enableContainerizedManagedPrefs == 1)
      {
        size_t v13 = xpc_dictionary_get_remote_connection(a2);
        if (!v13)
        {
          unint64_t v14 = (_xpc_connection_s *)xpc_dictionary_get_value(a2, "connection");
          size_t v13 = v14;
          if (!v14 || object_getClass(v14) != (Class)off_1ECE0A678) {
            -[CFPrefsDaemon handleSourceMessage:replyHandler:]();
          }
        }
        uint64_t v54 = 0;
        v55 = &v54;
        uint64_t v56 = 0x2020000000;
        char v57 = 0;
        v48 = off_1ECE0A5A0;
        uint64_t v49 = 3221225472;
        uint64_t v50 = (uint64_t)___CFPrefsIsConnectionPlatformBinary_block_invoke;
        v51 = (void (*)(uint64_t, uint64_t))&unk_1ECE00848;
        v52 = (void (*)(uint64_t))v13;
        v53 = &v54;
        withClientContext(v13, (uint64_t)&v48);
        BOOL v38 = *((unsigned char *)v55 + 24) == 0;
        _Block_object_dispose(&v54, 8);
      }
      else
      {
        BOOL v38 = 0;
      }
      xpc_dictionary_set_value(a2, "CFPreferencesHasFixedUpContainer", 0);
      int v17 = 0;
      CFStringRef v16 = 0;
      if (!v12) {
        goto LABEL_38;
      }
    }
    else
    {
      xpc_dictionary_set_value(a2, "CFPreferencesHasFixedUpContainer", 0);
      CFStringRef v16 = _CFPrefsCopyFixedUpContainerForMessage(a2, (uint64_t)FixedUpDomainForMessage, (uint64_t)v46, HIBYTE(v47), v12 != 0);
      if (v16)
      {
        xpc_dictionary_set_BOOL(a2, "CFPreferencesHasFixedUpContainer", 1);
        BOOL v38 = 0;
        int v17 = 1;
        if (!v12) {
          goto LABEL_38;
        }
      }
      else
      {
        int v17 = 0;
        BOOL v38 = 0;
        if (!v12) {
          goto LABEL_38;
        }
      }
    }
    if (_CFPrefsSandboxCheckForMessage_0(a2))
    {
      BOOL v18 = 0;
      goto LABEL_39;
    }
LABEL_38:
    BOOL v18 = xpc_dictionary_get_string(a2, "Key") == 0;
LABEL_39:
    uint64_t v39 = a3;
    v48 = 0;
    uint64_t v49 = (uint64_t)&v48;
    uint64_t v50 = 0x3052000000;
    v51 = __Block_byref_object_copy__5;
    v52 = __Block_byref_object_dispose__5;
    v53 = 0;
    string = xpc_dictionary_get_string(a2, "CFPreferencesCloudConfig");
    xpc_object_t v20 = xpc_dictionary_get_value(a2, "CFPreferencesCloudStoreIdentifier");
    xpc_object_t v21 = v20;
    if (v20)
    {
      if (object_getClass(v20) != (Class)off_1ECE0A6B8)
      {
        v22 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          int v23 = _CFPrefsPIDForMessage(a2);
          -[CFPrefsDaemon handleSourceMessage:replyHandler:].cold.4(buf, v23, v22);
        }
        goto LABEL_64;
      }
      if (string)
      {
        xpc_retain(v21);
LABEL_47:
        CFStringRef v24 = CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, string, 0x8000100u);
        if (v18
          || _CFPrefsBooleanEntitlementValueForMessage(a2, (uint64_t)"com.apple.private.trust-defaults-kvstore-identifier"))
        {
          *(void *)(v49 + 40) = v21;
        }
        else if (v37)
        {
          v35 = (void *)_CFPrefsCopyEntitlementForMessage(a2, (uint64_t)"com.apple.developer.ubiquity-kvstore-identifier");
          v36 = v35;
          if (v35)
          {
            if (object_getClass(v35) == (Class)off_1ECE0A6B8 && xpc_equal(v21, v36)) {
              *(void *)(v49 + 40) = v21;
            }
            xpc_release(v36);
          }
        }
        if (!*(void *)(v49 + 40))
        {
          v25 = (void *)_CFPrefsCopyEntitlementForMessage(a2, (uint64_t)"com.apple.private.ubiquity-kvstore-access");
          uint64_t v26 = v25;
          if (v25)
          {
            if (object_getClass(v25) == (Class)off_1ECE0A668)
            {
              applier[0] = off_1ECE0A5A0;
              applier[1] = 3221225472;
              applier[2] = __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_75;
              applier[3] = &unk_1ECE005D8;
              applier[4] = v21;
              applier[5] = &v48;
              xpc_array_apply(v26, applier);
            }
            xpc_release(v26);
          }
        }
        if (!*(void *)(v49 + 40))
        {
          v27 = (void *)_CFPrefsCopyEntitlementForMessage(a2, (uint64_t)"com.apple.private.ubiquity-additional-kvstore-identifiers");
          v28 = v27;
          if (v27)
          {
            if (object_getClass(v27) == (Class)off_1ECE0A668)
            {
              v44[0] = off_1ECE0A5A0;
              v44[1] = 3221225472;
              v44[2] = __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_2;
              v44[3] = &unk_1ECE005D8;
              v44[4] = v21;
              v44[5] = &v48;
              xpc_array_apply(v28, v44);
            }
            xpc_release(v28);
          }
        }
        uint64_t v29 = *(void **)(v49 + 40);
        if (v29) {
          xpc_retain(v29);
        }
        if (v21) {
          xpc_release(v21);
        }
LABEL_65:
        char v30 = v17 ^ 1;
        if (HIBYTE(v47)) {
          char v30 = 1;
        }
        if ((v30 & 1) != 0 || CFStringHasPrefix(v16, @"/private/var/containers/Shared/SystemGroup/"))
        {
          uint64_t v31 = *(void *)(v49 + 40);
          if (!string || v31)
          {
            uint64_t v54 = 0;
            v55 = &v54;
            uint64_t v56 = 0x2020000000;
            char v57 = 0;
            v43[0] = off_1ECE0A5A0;
            v43[1] = 3221225472;
            v43[2] = __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_3;
            v43[3] = &unk_1ECE00600;
            v43[6] = v39;
            v43[7] = &v54;
            v43[4] = a2;
            v43[5] = a1;
            v42[0] = off_1ECE0A5A0;
            v42[1] = 3221225472;
            v42[2] = __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_4;
            v42[3] = &unk_1ECE00628;
            v42[4] = a2;
            v42[5] = &v54;
            -[CFPrefsDaemon withSourceForDomain:inContainer:user:byHost:managed:managedUsesContainer:cloudStoreEntitlement:cloudConfigurationPath:performWithSourceLock:afterReleasingSourceLock:](a1, FixedUpDomainForMessage, v16, v6, v40, v41, v38, v31, v24, (uint64_t)v43, (uint64_t)v42);
            _Block_object_dispose(&v54, 8);
LABEL_75:
            int v33 = *(void **)(v49 + 40);
            if (v33) {
              xpc_release(v33);
            }
            if (v17) {
              CFRelease(v16);
            }
            if (v24) {
              CFRelease(v24);
            }
            if (v6) {
              CFRelease(v6);
            }
            _Block_object_dispose(&v48, 8);
            return;
          }
          xpc_object_t v32 = createErrorReply("'com.apple.developer.ubiquity-kvstore-identifier' entitlement needed to use cloud preferences", a2);
          (*(void (**)(uint64_t, xpc_object_t))(v39 + 16))(v39, v32);
        }
        else
        {
          xpc_object_t v32 = createErrorReply("Using kCFPreferencesAnyUser with a container is only allowed for System Containers", a2);
          (*(void (**)(uint64_t, xpc_object_t))(v39 + 16))(v39, v32);
        }
        xpc_release(v32);
        xpc_release(a2);
        goto LABEL_75;
      }
    }
    else if (string)
    {
      xpc_object_t v21 = xpc_string_create(v46);
      goto LABEL_47;
    }
LABEL_64:
    CFStringRef v24 = 0;
    goto LABEL_65;
  }
  if (v6) {
    CFRelease(v6);
  }
  xpc_object_t v15 = createErrorReply("Domain not found", a2);
  (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, v15);
  xpc_release(v15);
  xpc_release(a2);
}

- (uint64_t)shmem
{
  v2[5] = *(void *)off_1ECE0A5B0;
  if (result)
  {
    uint64_t v1 = result;
    if (isCFPrefsD == 1)
    {
      v2[0] = off_1ECE0A5A0;
      v2[1] = 3221225472;
      v2[2] = __22__CFPrefsDaemon_shmem__block_invoke;
      v2[3] = &unk_1ECDB0298;
      v2[4] = result;
      if (shmem_onceToken != -1) {
        dispatch_once(&shmem_onceToken, v2);
      }
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)&shmem_directModeShmemLock);
      if (!*(void *)(v1 + 576)) {
        -[CFPrefsDaemon _initializeShmemPage:](v1, (uint64_t *)(v1 + 576));
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&shmem_directModeShmemLock);
    }
    uint64_t result = *(void *)(v1 + 576);
    if (!result) {
      -[CFPrefsDaemon shmem]();
    }
  }
  return result;
}

- (uint64_t)getShmemName:(uint64_t)result bufLen:(char *)__str
{
  if (result)
  {
    if (*(_DWORD *)(result + 24) == 2) {
      return snprintf(__str, 0x1FuLL, "%scfprefs.system.daemonv%d");
    }
    else {
      return snprintf(__str, 0x1FuLL, "%scfprefs.user.daemonv%d");
    }
  }
  return result;
}

void __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_2(void *a1)
{
  v4[6] = *(void *)off_1ECE0A5B0;
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v2 = a1[4];
  v4[0] = off_1ECE0A5A0;
  v4[1] = 3221225472;
  v4[2] = __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_3;
  v4[3] = &unk_1ECDFFFB8;
  uint64_t v3 = a1[6];
  v4[4] = v2;
  v4[5] = v3;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 48));
  __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_3((uint64_t)v4, *(__CFSet **)(v2 + 32), *(void *)(v2 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 48));
}

void __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *(void *)off_1ECE0A5B0;
  if (!xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "FullCloudSync"))
  {
    if (a2)
    {
      xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "CFPreferencesShmemIndex");
      if (!value
        || (xpc_object_t v7 = value, object_getClass(value) != (Class)off_1ECE0A6A8)
        || (int v12 = xpc_int64_get_value(v7), v12 == -1)
        || v12 == [a2 shmemIndex])
      {
        xpc_object_t ErrorReply = (xpc_object_t)[a2 acceptMessage:*(void *)(a1 + 32)];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
LABEL_15:
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        xpc_release(ErrorReply);
        return;
      }
      unint64_t v14 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      size_t length = 0;
      long long v19 = 0u;
      long long v20 = 0u;
      data = (long long *)xpc_dictionary_get_data(v14, "CFPreferencesAuditToken", &length);
      if (data && length == 32)
      {
        long long v16 = data[1];
        long long v19 = *data;
        long long v20 = v16;
      }
      else
      {
        if (!xpc_dictionary_get_remote_connection(v14))
        {
          xpc_object_t v17 = xpc_dictionary_get_value(v14, "connection");
          if (!v17 || object_getClass(v17) != (Class)off_1ECE0A678) {
            __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_3_cold_1();
          }
        }
        xpc_connection_get_audit_token();
      }
      -[CFPrefsDaemon logDomainInconsistencyForProcess:message:source:](v13, SDWORD1(v20), *(void **)(a1 + 32), a2);
      v11 = *(void **)(a1 + 32);
      CFSetRef v10 = "Lookup inconsistency";
    }
    else
    {
      CFSetRef v10 = "Domain or user not found";
      v11 = *(void **)(a1 + 32);
    }
    xpc_object_t ErrorReply = createErrorReply(v10, v11);
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    [a2 synchronizeWithCloud:v5 replyHandler:v4];
  }
  else
  {
    xpc_object_t v9 = createErrorReply("Domain not cloud-backed", *(xpc_object_t *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    xpc_release(v9);
  }
}

- (void)withSourceForDomain:(const __CFString *)a3 inContainer:(__CFString *)a4 user:(int)a5 byHost:(int)a6 managed:(int)a7 managedUsesContainer:(uint64_t)a8 cloudStoreEntitlement:(const void *)a9 cloudConfigurationPath:(uint64_t)a10 performWithSourceLock:(uint64_t)a11 afterReleasingSourceLock:
{
  uint64_t v35 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    if (a7 && (a6 & 1) == 0) {
      -[CFPrefsDaemon withSourceForDomain:inContainer:user:byHost:managed:managedUsesContainer:cloudStoreEntitlement:cloudConfigurationPath:performWithSourceLock:afterReleasingSourceLock:]();
    }
    BOOL v18 = 0;
    if (a2 && a4)
    {
      int v19 = a5;
      if (-[CFPrefsDaemon shmem](a1))
      {
        uint64_t v23 = a8;
        CFStringRef v20 = +[CFPrefsDaemon _copyUncanonicalizedSourcePathWithDomain:user:byHost:containerPath:managed:managedUsesContainer:]((uint64_t)CFPrefsDaemon, a2, a4, v19, a3, a6, a7);
        BOOL v18 = objc_alloc_init(CFPDSourceLookUpKey);
        if (a9) {
          uint64_t v21 = (__CFString *)CFRetain(a9);
        }
        else {
          uint64_t v21 = 0;
        }
        v18->cloudPath = v21;
        if (v20)
        {
          v18->uncanonicalizedPath = (__CFString *)CFRetain(v20);
          CFRelease(v20);
        }
        else
        {
          v18->uncanonicalizedPath = 0;
        }
        a8 = v23;
      }
      else
      {
        BOOL v18 = 0;
      }
      LOBYTE(a5) = v19;
    }
    uint64_t v29 = 0;
    char v30 = &v29;
    uint64_t v31 = 0x3052000000;
    xpc_object_t v32 = __Block_byref_object_copy__4;
    int v33 = __Block_byref_object_dispose__4;
    uint64_t v34 = 0;
    v25[0] = off_1ECE0A5A0;
    v25[1] = 3221225472;
    v25[2] = __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke;
    v25[3] = &unk_1ECDFFF90;
    v25[8] = a2;
    v25[9] = a3;
    char v26 = a5;
    char v27 = a6;
    v25[10] = a4;
    v25[11] = a9;
    v25[4] = v18;
    v25[5] = a8;
    v25[6] = a1;
    v25[7] = &v29;
    char v28 = a7;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke((uint64_t)v25, *(CFSetRef *)(a1 + 32), *(__CFBag **)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v22 = (void *)v30[5];
    if (v22)
    {
      v24[0] = off_1ECE0A5A0;
      v24[1] = 3221225472;
      v24[2] = __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_2;
      v24[3] = &unk_1ECDFFFE0;
      v24[5] = a10;
      v24[6] = &v29;
      v24[4] = a1;
      [v22 lockedSync:v24];
    }
    else
    {
      (*(void (**)(uint64_t, void))(a10 + 16))(a10, 0);
    }
    if (a11) {
      (*(void (**)(uint64_t, uint64_t))(a11 + 16))(a11, v30[5]);
    }

    _Block_object_dispose(&v29, 8);
  }
}

void __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_4(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [a2 cleanUpAfterAcceptingMessage:*(void *)(a1 + 32)];
  }
  uint64_t v3 = *(void **)(a1 + 32);

  xpc_release(v3);
}

void __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_3(uint64_t a1, __CFSet *a2, uint64_t a3)
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  uint64_t v5 = CFBasicHashRemoveValue(a3, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  BOOL v6 = v5 == 1;
  if (v5 == 1) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setUncanonicalizedPathCached:0];
  }
  BOOL v8 = v6;
  xpc_object_t value = 0;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) processEndOfMessageIntendingToRemoveSource:&v8 replacingWithTombstone:&value];
  if (v8)
  {
    -[CFPrefsDaemon _setSource:isDead:](*(void *)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 1);
    CFSetRemoveValue(a2, *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    if (value) {
      CFSetAddValue(a2, value);
    }
  }
}

void __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke(uint64_t a1, CFSetRef theSet, __CFBag *a3)
{
  uint64_t v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = CFSetGetValue(theSet, v4);
    xpc_object_t v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v7)
    {
      [v7 setUncanonicalizedPathCached:1];
      CFBagAddValue(a3, *(const void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      id v8 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    else
    {
      CFStringRef v10 = *(const __CFString **)(a1 + 64);
      uint64_t v11 = *(void *)(a1 + 72);
      int v12 = *(unsigned __int8 *)(a1 + 96);
      int v13 = *(unsigned __int8 *)(a1 + 97);
      unint64_t v14 = *(__CFString **)(a1 + 80);
      uint64_t v15 = *(void *)(a1 + 88);
      if (v10)
      {
        CFHashCode v16 = 7 * (CFHash(*(CFTypeRef *)(a1 + 64)) % 0x249);
        CFIndex v17 = CFStringGetLength(v10) % 7;
      }
      else
      {
        LODWORD(v16) = 0;
        LODWORD(v17) = 0;
      }
      if ((int)v17 + (int)v16 > 4088 || v17 + v16 == 0) {
        __int16 v19 = v17 + 1;
      }
      else {
        __int16 v19 = v17 + v16;
      }
      if (v11) {
        __int16 v20 = 6;
      }
      else {
        __int16 v20 = 5;
      }
      if (!(v11 | v15))
      {
        __int16 v20 = @"kCFPreferencesAnyUser" == v14 ? 2 : v12 == 0;
        __int16 v21 = @"kCFPreferencesAnyUser" == v14 ? 4 : 3;
        if (v13) {
          __int16 v20 = v21;
        }
      }
      __int16 v22 = v20 + v19;
      if (*(void *)(a1 + 88)) {
        uint64_t v23 = [[CFPDCloudSource alloc] initWithDomain:*(void *)(a1 + 64) userName:*(void *)(a1 + 80) storeName:*(void *)(a1 + 40) configurationPath:*(void *)(a1 + 88) containerPath:*(void *)(a1 + 72) shmemIndex:v22 daemon:*(void *)(a1 + 48)];
      }
      else {
        uint64_t v23 = (CFPDCloudSource *)-[CFPrefsDaemon _createSourceWithDomain:user:container:byHost:managed:shmemIndex:](*(CFPDContainerSource **)(a1 + 48), *(const __CFString **)(a1 + 64), *(const void **)(a1 + 80), *(void *)(a1 + 72), *(unsigned __int8 *)(a1 + 96), *(unsigned __int8 *)(a1 + 97), v22);
      }
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v23;
      CFStringRef v24 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (v24)
      {
        [v24 setUncanonicalizedPathCached:1];
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setManagedPreferencesUseContainer:*(unsigned __int8 *)(a1 + 98)];
        CFSetAddValue(theSet, *(const void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
        CFBagAddValue(a3, *(const void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
        -[CFPrefsDaemon _setSource:isDead:](*(void *)(a1 + 48), *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), 0);
        id v25 = [[CFPDObserverOnlyTombstone alloc] initMatchingSource:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
        Value = (void *)CFSetGetValue(theSet, v25);

        if (Value)
        {
          [Value transferObservingConnectionsToSource:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
          CFSetRemoveValue(theSet, Value);
        }
      }
    }
    uint64_t v9 = *(void **)(a1 + 32);
  }
}

+ (CFStringRef)_copyUncanonicalizedSourcePathWithDomain:(__CFString *)a3 user:(int)a4 byHost:(const __CFString *)a5 containerPath:(int)a6 managed:(int)a7 managedUsesContainer:
{
  uint64_t v16 = *(void *)off_1ECE0A5B0;
  self;
  bzero(cStr, 0x402uLL);
  if (!+[CFPrefsDaemon _getUncanonicalizedSourcePath:withDomain:user:byHost:containerPath:managed:managedUsesContainer:]((uint64_t)CFPrefsDaemon, (UInt8 *)cStr, a2, a3, a4, a5, a6, a7))return 0; {
  CFStringEncoding v13 = CFStringFileSystemEncoding();
  }
  return CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, cStr, v13);
}

xpc_object_t __49__CFPrefsDaemon_handleMultiMessage_replyHandler___block_invoke_2(xpc_object_t result, xpc_object_t object)
{
  if (object)
  {
    uint64_t v2 = (uint64_t)result;
    uint64_t result = xpc_retain(object);
    *(void *)(*(void *)(v2 + 32) + 8 * *(int *)(v2 + 40)) = result;
  }
  return result;
}

- (CFPDContainerSource)_createSourceWithDomain:(const void *)a3 user:(uint64_t)a4 container:(uint64_t)a5 byHost:(uint64_t)a6 managed:(uint64_t)a7 shmemIndex:
{
  if (result)
  {
    uint64_t v12 = (uint64_t)result;
    if (a4)
    {
      return [[CFPDContainerSource alloc] initWithDomain:cf1 userName:a3 container:a4 byHost:a5 managed:a6 shmemIndex:a7 daemon:result];
    }
    else
    {
      if (CFEqual(cf1, @"kCFPreferencesAnyApplication"))
      {
        if (CFEqual(a3, @"kCFPreferencesAnyUser")) {
          int v13 = 0;
        }
        else {
          int v13 = (a5 | a6) ^ 1;
        }
      }
      else
      {
        int v13 = 0;
      }
      BOOL v14 = (_CFPrefsCurrentProcessIsCFPrefsD() & 1) == 0 && CFStringHasSuffix(cf1, @"_TestMirror") != 0;
      if ((v13 | v14) == 1)
      {
        return (CFPDContainerSource *)[[CFPDMirroredSource alloc] initWithDomain:cf1 userName:a3 byHost:a5 managed:a6 mirroredKeys:&off_1ECF558A8 shmemIndex:a7 daemon:v12];
      }
      else
      {
        uint64_t v15 = [CFPDSource alloc];
        return (CFPDContainerSource *)[(CFPDSource *)v15 initWithDomain:cf1 userName:a3 byHost:a5 managed:a6 shmemIndex:a7 daemon:v12];
      }
    }
  }
  return result;
}

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_4(uint64_t a1, void *a2)
{
  if (a2) {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), a2);
  }
}

- (uint64_t)role
{
  if (result) {
    return *(unsigned int *)(result + 24);
  }
  return result;
}

- (uint64_t)_initializeShmemPage:(uint64_t)result
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  bzero(__str, 0x400uLL);
  if (*(_DWORD *)(v3 + 24) == 2) {
    snprintf(__str, 0x1FuLL, "%scfprefs.system.daemonv%d");
  }
  else {
    snprintf(__str, 0x1FuLL, "%scfprefs.user.daemonv%d");
  }
  if (isCFPrefsD)
  {
    uint64_t result = shm_open(__str, 514, 420);
  }
  else
  {
    getpid();
    uint64_t result = sandbox_check();
    if (result)
    {
LABEL_12:
      uint64_t v5 = *a2;
LABEL_13:
      if (v5) {
        return result;
      }
      goto LABEL_14;
    }
    uint64_t result = shm_open(__str, 2, 420);
  }
  if ((result & 0x80000000) != 0) {
    goto LABEL_12;
  }
  int v4 = result;
  ftruncate(result, 0x4000);
  *a2 = (uint64_t)mmap(0, 0x4000uLL, 3, 1, v4, 0);
  uint64_t result = close(v4);
  uint64_t v5 = *a2;
  if (*a2 != -1) {
    goto LABEL_13;
  }
  *a2 = 0;
LABEL_14:
  if (isCFPrefsD == 1)
  {
    BOOL v6 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[CFPrefsDaemon _initializeShmemPage:]((uint64_t)__str, v6);
    }
  }
  uint64_t result = (uint64_t)malloc_type_calloc(1uLL, 0x4000uLL, 0x100004052888210uLL);
  *a2 = result;
  return result;
}

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_3(uint64_t a1, id a2)
{
  v18[5] = *(void *)off_1ECE0A5B0;
  if (object_getClass(a2) == (Class)off_1ECE0A690)
  {
    xpc_object_t v7 = *(_xpc_connection_s **)(a1 + 32);
    if (terminating)
    {
      xpc_connection_cancel(v7);
    }
    else
    {
      context = (unint64_t *)xpc_connection_get_context(v7);
      if (!context) {
        __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_3_cold_1();
      }
      uint64_t v9 = atomic_load(context + 1);
      if (!v9) {
        __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_3_cold_2();
      }
      CFStringRef v10 = *(_xpc_connection_s **)(a1 + 32);
      v18[0] = off_1ECE0A5A0;
      v18[1] = 3221225472;
      v18[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_4;
      v18[3] = &unk_1ECE00348;
      v18[4] = v10;
      -[CFPrefsDaemon handleMessage:fromPeer:replyHandler:](v9, a2, v10, (uint64_t)v18);
    }
  }
  else if (a2 == off_1ECE0A658)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    int v4 = *(_xpc_connection_s **)(a1 + 32);
    v13[0] = off_1ECE0A5A0;
    v13[1] = 3221225472;
    v13[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_5;
    v13[3] = &unk_1ECE00450;
    v13[4] = &v14;
    withClientContext(v4, (uint64_t)v13);
    CFSetRef v5 = (const __CFSet *)v15[3];
    if (v5)
    {
      if (CFSetGetCount(v5) >= 1)
      {
        BOOL v6 = (void *)v15[3];
        v11[0] = off_1ECE0A5A0;
        v11[1] = 3221225472;
        v11[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_6;
        v11[3] = &unk_1ECE00280;
        long long v12 = *(_OWORD *)(a1 + 32);
        CFSetApply(v6, (uint64_t)v11);
      }
      CFRelease((CFTypeRef)v15[3]);
    }
    _Block_object_dispose(&v14, 8);
  }
}

- (uint64_t)updateShmemIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t result = -[CFPrefsDaemon shmem](result);
    if (atomic_fetch_add((atomic_uint *volatile)(result + 4 * a2), 1u) == -1) {
      atomic_store(1u, (unsigned int *)(result + 4 * a2));
    }
  }
  return result;
}

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_2(uint64_t a1, _xpc_connection_s *a2)
{
  uint64_t v18 = *(void *)off_1ECE0A5B0;
  if (object_getClass(a2) == (Class)off_1ECE0A678)
  {
    handler[0] = off_1ECE0A5A0;
    handler[1] = 3221225472;
    handler[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_3;
    handler[3] = &unk_1ECE00700;
    uint64_t v4 = *(void *)(a1 + 32);
    handler[4] = a2;
    handler[5] = v4;
    xpc_connection_set_event_handler(a2, handler);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    *(_OWORD *)__str = 0u;
    long long v11 = 0u;
    pid_t pid = xpc_connection_get_pid(a2);
    if ((snprintf(__str, 0x80uLL, "client-%d", pid) - 1) > 0x7E)
    {
      xpc_object_t v7 = 0;
    }
    else
    {
      BOOL v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      xpc_object_t v7 = dispatch_queue_create(__str, v6);
    }
    xpc_connection_set_target_queue(a2, v7);

    uint64_t v8 = objc_alloc_init(_CFPrefsClientContext);
    v8->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v8->_lock);
    atomic_store(*(void *)(a1 + 32), (unint64_t *)&v8->_cfprefsd);
    *(_WORD *)&v8->_sandboxed = -1;
    v8->_valid = 1;
    os_unfair_lock_unlock(&v8->_lock);
    xpc_connection_set_context(a2, v8);
    xpc_connection_set_finalizer_f(a2, (xpc_finalizer_t)client_context_finalizer);
    xpc_connection_activate(a2);
  }
}

uint64_t __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke()
{
  uint64_t result = access("/containerized_managed_preferences", 0);
  if (!result) {
    handleSourceMessage_replyHandler__enableContainerizedManagedPrefs = 1;
  }
  return result;
}

- (os_unfair_lock_s)initWithRole:(int)a3 testMode:
{
  uint64_t v15 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  v14.receiver = a1;
  v14.super_class = (Class)CFPrefsDaemon;
  CFSetRef v5 = (os_unfair_lock_s *)objc_msgSendSuper2(&v14, sel_init);
  BOOL v6 = v5;
  if (v5)
  {
    LOBYTE(v5[142]._os_unfair_lock_opaque) = a3;
    if (a3) {
      os_transaction_create();
    }
    if (!a2)
    {
      if ((isCFPrefsD & 1) == 0) {
        -[CFPrefsDaemon initWithRole:testMode:]();
      }
      if (initWithRole_testMode__onceToken != -1) {
        dispatch_once(&initWithRole_testMode__onceToken, &__block_literal_global_112);
      }
      if (initWithRole_testMode__runningInSystemContext) {
        a2 = 2;
      }
      else {
        a2 = 1;
      }
    }
    v6[6]._os_unfair_lock_opaque = a2;
    if (LOBYTE(v6[142]._os_unfair_lock_opaque)) {
      xpc_object_t v7 = "com.apple.cfprefsd.daemon.system.test";
    }
    else {
      xpc_object_t v7 = "com.apple.cfprefsd.daemon.system";
    }
    uint64_t v8 = "com.apple.cfprefsd.daemon.test";
    if (!LOBYTE(v6[142]._os_unfair_lock_opaque)) {
      uint64_t v8 = "com.apple.cfprefsd.daemon";
    }
    if (a2 == 2) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = v8;
    }
    *(void *)&v6[4]._os_unfair_lock_opaque = v9;
    if (isCFPrefsD == 1) {
      mach_service = xpc_connection_create_mach_service(v9, 0, 1uLL);
    }
    else {
      mach_service = xpc_connection_create(0, 0);
    }
    long long v11 = mach_service;
    v13[0] = off_1ECE0A5A0;
    v13[1] = 3221225472;
    v13[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_2;
    v13[3] = &unk_1ECE00348;
    v13[4] = v6;
    xpc_connection_set_event_handler(mach_service, v13);
    v6[12]._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(v6 + 12);
    *(void *)&v6[8]._os_unfair_lock_opaque = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeSetCallBacks);
    *(void *)&v6[10]._os_unfair_lock_opaque = CFBagCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeBagCallBacks);
    os_unfair_lock_unlock(v6 + 12);
    *(void *)&v6[2]._os_unfair_lock_opaque = v11;
    xpc_connection_activate(v11);
  }
  return v6;
}

- (void)synchronousWithSourceCache:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)withSnapshotOfSourcesForDomainIdentifier:(uint64_t)a3 performBlock:
{
  uint64_t v16 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t v12 = 0;
    long long v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    uint64_t v11 = 0;
    v7[0] = off_1ECE0A5A0;
    v7[1] = 3221225472;
    v7[2] = __86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke;
    v7[3] = &unk_1ECDFFF18;
    v7[4] = &v8;
    v7[5] = &v12;
    v7[6] = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    ((void (*)(void *, void, void))__86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke)(v7, *(void *)(a1 + 32), *(void *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v13[3], v9[3]);
    CFSetRef v5 = (void *)v13[3];
    if (v5)
    {
      if (v9[3])
      {
        unint64_t v6 = 0;
        do
          CFRelease(*(CFTypeRef *)(v13[3] + 8 * v6++));
        while (v6 < v9[3]);
        CFSetRef v5 = (void *)v13[3];
      }
      free(v5);
    }
    _Block_object_dispose(&v8, 8);
    _Block_object_dispose(&v12, 8);
  }
}

CFIndex __86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke(int8x16_t *a1, CFSetRef theSet)
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  CFIndex result = CFSetGetCount(theSet);
  *(void *)(*(void *)(a1[2].i64[0] + 8) + 24) = result;
  uint64_t v5 = *(void *)(*(void *)(a1[2].i64[0] + 8) + 24);
  if (v5)
  {
    *(void *)(*(void *)(a1[2].i64[1] + 8) + 24) = malloc_type_calloc(1uLL, 8 * v5, 0x80040B8603338uLL);
    *(void *)(*(void *)(a1[2].i64[0] + 8) + 24) = 0;
    v6[0] = off_1ECE0A5A0;
    v6[1] = 3221225472;
    v6[2] = __86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke_2;
    v6[3] = &unk_1ECDFFEF0;
    uint64_t v8 = a1[3].i64[0];
    int8x16_t v7 = vextq_s8(a1[2], a1[2], 8uLL);
    return CFSetApply(theSet, (uint64_t)v6);
  }
  return result;
}

uint64_t __86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke_2(uint64_t a1, void *a2)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    if (!*(void *)(a1 + 48)
      || (uint64_t result = CFEqual((CFTypeRef)[a2 domain], *(CFTypeRef *)(a1 + 48)), result))
    {
      uint64_t result = (uint64_t)CFRetain(a2);
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
                + 8 * (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))++) = result;
    }
  }
  return result;
}

- (void)withAllKnownManagedSources:(uint64_t)a1
{
  uint64_t v59 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t v19 = 0;
    __int16 v20 = &v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    uint64_t v10 = 0;
    CFStringRef v24 = &v23;
    uint64_t v25 = 0x22010000000;
    char v26 = &unk_18303D447;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v6[0] = off_1ECE0A5A0;
    v6[1] = 3221225472;
    v6[2] = __59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke;
    v6[3] = &unk_1ECDFFF68;
    v6[6] = &v11;
    v6[7] = &v7;
    v6[8] = &v15;
    v6[9] = &v23;
    void v6[4] = a1;
    v6[5] = &v19;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    ((void (*)(void *, void, void))__59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke)(v6, *(void *)(a1 + 32), *(void *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, v20[3], v12[3], v16[3], v8[3], v24 + 4);
    if (v20[3])
    {
      if (v12[3])
      {
        unint64_t v4 = 0;
        do
          CFRelease(*(CFTypeRef *)(v20[3] + 8 * v4++));
        while (v4 < v12[3]);
      }
      if (v8[3])
      {
        unint64_t v5 = 0;
        do
          CFRelease(*(CFTypeRef *)(v16[3] + 8 * v5++));
        while (v5 < v8[3]);
      }
      free((void *)v20[3]);
    }
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);
  }
}

void *__59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke(void *a1, CFSetRef theSet)
{
  uint64_t v11 = *(void *)off_1ECE0A5B0;
  CFIndex Count = CFSetGetCount(theSet);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    *(void *)(*(void *)(a1[5] + 8) + 24) = malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v7[0] = off_1ECE0A5A0;
    v7[1] = 3221225472;
    v7[2] = __59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke_2;
    v7[3] = &unk_1ECDFFF40;
    long long v8 = *(_OWORD *)(a1 + 5);
    uint64_t v9 = a1[7];
    CFIndex v10 = v5;
    CFSetApply(theSet, (uint64_t)v7);
    *(void *)(*(void *)(a1[8] + 8) + 24) = *(void *)(*(void *)(a1[5] + 8) + 24)
                                                 + 8 * v5
                                                 - 8 * *(void *)(*(void *)(a1[7] + 8) + 24);
  }
  return memcpy((void *)(*(void *)(a1[9] + 8) + 32), (const void *)(a1[4] + 56), 0x200uLL);
}

uint64_t __59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke_2(void *a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a2 managed])
  {
    uint64_t result = (uint64_t)CFRetain(a2);
    uint64_t v5 = *(void *)(*(void *)(a1[4] + 8) + 24);
    uint64_t v6 = *(void *)(a1[5] + 8);
    uint64_t v7 = *(void *)(v6 + 24);
    *(void *)(v6 + 24) = v7 + 1;
    *(void *)(v5 + 8 * v7) = result;
  }
  else
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      uint64_t result = [a2 managed];
      if (result)
      {
        ++*(void *)(*(void *)(a1[6] + 8) + 24);
        uint64_t result = (uint64_t)CFRetain(a2);
        *(void *)(*(void *)(*(void *)(a1[4] + 8) + 24)
                  + 8 * (a1[7] - *(void *)(*(void *)(a1[6] + 8) + 24))) = result;
      }
    }
  }
  return result;
}

- (void)logDomainInconsistencyForProcess:(void *)a3 message:(void *)a4 source:
{
  uint64_t v13 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    id v8 = a4;
    xpc_retain(a3);
    qos_class_t v9 = qos_class_main();
    global_queue = dispatch_get_global_queue(v9, 2uLL);
    block[0] = off_1ECE0A5A0;
    block[1] = 3221225472;
    block[2] = __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke;
    block[3] = &unk_1ECE005B0;
    int v12 = a2;
    block[4] = a3;
    block[5] = a1;
    block[6] = a4;
    dispatch_async(global_queue, block);
  }
}

void __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke(uint64_t a1)
{
  uint64_t v11 = *(void *)off_1ECE0A5B0;
  int int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "CFPreferencesShmemIndex");
  uint64_t v3 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_cold_1(a1, v3);
  }
  v8[0] = off_1ECE0A5A0;
  v8[1] = 3221225472;
  v8[2] = __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_52;
  v8[3] = &unk_1ECE00588;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 56);
  int v9 = int64;
  int v10 = v6;
  uint64_t v7 = *(void *)(a1 + 32);
  v8[4] = v5;
  v8[5] = v7;
  -[CFPrefsDaemon synchronousWithSourceCache:](v4, (uint64_t)v8);
}

void __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_52(uint64_t a1, CFSetRef theSet)
{
  uint64_t v28 = *(void *)off_1ECE0A5B0;
  context[0] = *(unsigned int *)(a1 + 48);
  context[1] = &v21;
  id v21 = 0;
  CFSetApplyFunction(theSet, (CFSetApplierFunction)indexSearchCallback, context);
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v11[0] = off_1ECE0A5A0;
  v11[1] = 3221225472;
  v11[2] = __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_2;
  v11[3] = &unk_1ECE003C0;
  void v11[4] = v21;
  v11[5] = &v16;
  [v21 lockedSync:v11];
  uint64_t v3 = *(void **)(a1 + 32);
  v10[0] = off_1ECE0A5A0;
  v10[1] = 3221225472;
  v10[2] = __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_3;
  v10[3] = &unk_1ECE003C0;
  v10[4] = v3;
  v10[5] = &v12;
  [v3 lockedSync:v10];
  uint64_t v4 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v7 = *(_DWORD *)(a1 + 52);
    uint64_t v8 = v17[3];
    uint64_t v9 = v13[3];
    *(_DWORD *)buf = 67240706;
    int v23 = v7;
    __int16 v24 = 2114;
    uint64_t v25 = v8;
    __int16 v26 = 2114;
    uint64_t v27 = v9;
    _os_log_fault_impl(&dword_182B90000, v4, OS_LOG_TYPE_FAULT, "CFPreferences detected an inconsistency. An attempt by process %{public}d to access preferences in \n%{public}@\n actually resolved to \n%{public}@\n Typically this indicates that the process's sandbox profile changed in a way that added or removed a shared-preference-* rule or changed its container path. To avoid overwriting data incorrectly, cfprefsd is disconnecting this client from this source, its preferences will not be saved to disk", buf, 0x1Cu);
  }
  uint64_t v5 = (const void *)v17[3];
  if (v5) {
    CFRelease(v5);
  }
  int v6 = (const void *)v13[3];
  if (v6) {
    CFRelease(v6);
  }

  xpc_release(*(xpc_object_t *)(a1 + 40));
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
}

uint64_t __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) debugDump];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) debugDump];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)handleFlushManagedMessage:(uint64_t)a3 replyHandler:
{
  void v7[7] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    log_client_activity(a2, (uint64_t)"requested flush of managed sources", 0);
    _CFPrefsResetManagedPreferencesStateCache();
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    if (!reply) {
      xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
    }
    v7[0] = off_1ECE0A5A0;
    v7[1] = 3221225472;
    v7[2] = __56__CFPrefsDaemon_handleFlushManagedMessage_replyHandler___block_invoke;
    v7[3] = &unk_1ECE00678;
    v7[5] = reply;
    v7[6] = a3;
    void v7[4] = a1;
    -[CFPrefsDaemon withAllKnownManagedSources:](a1, (uint64_t)v7);
  }
}

- (void)handleAgentCheckInMessage:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v1 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      -[CFPrefsDaemon handleAgentCheckInMessage:](v1);
    }
  }
}

- (void)handleFlushSourceForDomainMessage:(uint64_t)a3 replyHandler:
{
  if (a1)
  {
    string = xpc_dictionary_get_string(xdict, "CFPreferencesDomain");
    if (string)
    {
      int v7 = string;
      log_client_activity(xdict, (uint64_t)"requested flush of sources", (uint64_t)string);
      CFStringRef v8 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, v7, 0x8000100u, (CFAllocatorRef)&__kCFAllocatorNull);
      if (v8)
      {
        CFStringRef v9 = v8;
        -[CFPrefsDaemon withSnapshotOfSourcesForDomainIdentifier:performBlock:](a1, (uint64_t)v8, (uint64_t)&__block_literal_global_94);
        -[CFPrefsDaemon updateShmemForDomain:](a1, v9);
        CFRelease(v9);
      }
    }
    xpc_object_t reply = xpc_dictionary_create_reply(xdict);
    if (!reply) {
      xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
    }
    (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, reply);
    xpc_release(reply);
  }
}

- (void)handleUserDeletedMessage:(uint64_t)a1 replyHandler:(void *)a2
{
  if (a1) {
    log_client_activity(a2, (uint64_t)"reported a user was deleted", 0);
  }
}

- (void)handleSimulateTimerSynchronizeForTesting
{
  if (a1)
  {
    CFSetRef v1 = (const __CFSet *)+[_CFPrefsSynchronizer sharedInstance]();
    -[_CFPrefsSynchronizer synchronize](v1);
  }
}

uint64_t __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_75(uint64_t a1, int a2, id a3)
{
  if (object_getClass(a3) != (Class)off_1ECE0A6B8 || !xpc_equal(*(xpc_object_t *)(a1 + 32), a3)) {
    return 1;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(void *)(a1 + 32);
  return result;
}

uint64_t __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_2(uint64_t a1, int a2, id a3)
{
  if (object_getClass(a3) != (Class)off_1ECE0A6B8 || !xpc_equal(*(xpc_object_t *)(a1 + 32), a3)) {
    return 1;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(void *)(a1 + 32);
  return result;
}

void __56__CFPrefsDaemon_handleFlushManagedMessage_replyHandler___block_invoke(uint64_t a1, void **a2, uint64_t a3, void **a4, uint64_t a5, uint64_t a6)
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  if (a3)
  {
    uint64_t v10 = a3;
    do
    {
      uint64_t v12 = *a2++;
      [v12 respondToFileWrittenToBehindOurBack];
      --v10;
    }
    while (v10);
  }
  uint64_t v13 = 0;
  uint64_t v17 = off_1ECE0A5A0;
  uint64_t v18 = 3221225472;
  uint64_t v19 = __56__CFPrefsDaemon_handleFlushManagedMessage_replyHandler___block_invoke_2;
  __int16 v20 = &unk_1ECE00650;
  uint64_t v21 = *(void *)(a1 + 32);
  do
  {
    for (unint64_t i = *(void *)(a6 + 8 * v13); i; i &= ~(1 << v15))
    {
      __int16 v15 = __clz(__rbit64(i));
      v19((uint64_t)&v17, (__int16)((((_WORD)v13 << 6) | 1) + v15 - 1));
    }
    ++v13;
  }
  while (v13 != 64);
  for (; a5; --a5)
  {
    uint64_t v16 = *a4++;
    objc_msgSend(v16, "notifyObservers", v17, v18);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

uint64_t __56__CFPrefsDaemon_handleFlushManagedMessage_replyHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t result = -[CFPrefsDaemon shmem](result);
    if (atomic_fetch_add((atomic_uint *volatile)(result + 4 * a2), 1u) == -1) {
      atomic_store(1u, (unsigned int *)(result + 4 * a2));
    }
  }
  return result;
}

uint64_t __64__CFPrefsDaemon_handleFlushSourceForDomainMessage_replyHandler___block_invoke(uint64_t a1, void **a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    do
    {
      uint64_t v5 = *a2++;
      uint64_t result = [v5 respondToFileWrittenToBehindOurBack];
      --v3;
    }
    while (v3);
  }
  return result;
}

- (uint64_t)updateShmemForDomain:(uint64_t)result
{
  if (result)
  {
    uint64_t result = -[CFPrefsDaemon shmem](result);
    uint64_t v3 = result;
    if (a2)
    {
      CFHashCode v4 = 7 * (CFHash(a2) % 0x249);
      uint64_t result = CFStringGetLength(a2);
      uint64_t v5 = result % 7;
    }
    else
    {
      CFHashCode v4 = 0;
      uint64_t v5 = 0;
    }
    unint64_t v6 = v5 + v4;
    if ((int)v5 + (int)v4 > 4088 || v6 == 0) {
      unint64_t v6 = v5 + 1;
    }
    if ((unsigned __int16)v6 <= 0xFFF8u)
    {
      unint64_t v8 = v6 + 7;
      unint64_t v6 = (unsigned __int16)v6;
      do
      {
        if (atomic_fetch_add((atomic_uint *volatile)(v3 + 4 * v6), 1u) == -1) {
          atomic_store(1u, (unsigned int *)(v3 + 4 * v6));
        }
        ++v6;
      }
      while (v6 < v8);
    }
  }
  return result;
}

uint64_t __39__CFPrefsDaemon_initWithRole_testMode___block_invoke()
{
  uint64_t result = xpc_user_sessions_enabled();
  if (result)
  {
    uint64_t result = xpc_user_sessions_get_session_uid();
    BOOL v1 = result == 0;
  }
  else
  {
    BOOL v1 = 0;
  }
  initWithRole_testMode__runningInSystemContext = v1;
  return result;
}

- (BOOL)isInTestMode
{
  if (result) {
    return *(unsigned char *)(result + 568) != 0;
  }
  return result;
}

uint64_t __22__CFPrefsDaemon_shmem__block_invoke(uint64_t a1)
{
  return -[CFPrefsDaemon _initializeShmemPage:](*(void *)(a1 + 32), (uint64_t *)(*(void *)(a1 + 32) + 576));
}

- (uint64_t)updateEntireShmem
{
  if (result)
  {
    uint64_t result = -[CFPrefsDaemon shmem](result);
    for (uint64_t i = 4; i != 0x4000; i += 4)
    {
      if (atomic_fetch_add((atomic_uint *volatile)(result + i), 1u) == -1) {
        atomic_store(1u, (unsigned int *)(result + i));
      }
    }
  }
  return result;
}

- (uint64_t)userID
{
  if (a1 && (*(_DWORD *)(a1 + 24) | 2) == 3) {
    return cfprefsdEuid();
  }
  else {
    return 0;
  }
}

- (BOOL)enterSandbox
{
  return 1;
}

- (void)withSourceForDomain:inContainer:user:byHost:managed:managedUsesContainer:cloudStoreEntitlement:cloudConfigurationPath:performWithSourceLock:afterReleasingSourceLock:.cold.1()
{
}

void __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  int v2 = *(_DWORD *)(a1 + 56);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_182B90000, a2, OS_LOG_TYPE_FAULT, "Lookup inconsistency for request from pid %d", (uint8_t *)v3, 8u);
}

- (void)handleMessage:fromPeer:replyHandler:.cold.1()
{
  __assert_rtn("-[CFPrefsDaemon handleMessage:fromPeer:replyHandler:]", "cfprefsd.m", 700, "type == XPC_TYPE_DICTIONARY");
}

- (void)handleSourceMessage:replyHandler:.cold.1()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)handleSourceMessage:replyHandler:.cold.2()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)handleSourceMessage:replyHandler:.cold.3()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)handleSourceMessage:(os_log_t)log replyHandler:.cold.4(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl(&dword_182B90000, log, OS_LOG_TYPE_ERROR, "Client (%d) passed an invalid cloud store identifier value.", buf, 8u);
}

- (void)handleAgentCheckInMessage:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  *(_WORD *)BOOL v1 = 0;
  _os_log_error_impl(&dword_182B90000, log, OS_LOG_TYPE_ERROR, "cfprefsd agents don't exist on non-macOS platforms", v1, 2u);
}

- (void)handleMultiMessage:replyHandler:.cold.1()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

void __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_3_cold_1()
{
  __assert_rtn("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", 393, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)initWithRole:testMode:.cold.1()
{
}

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_3_cold_1()
{
}

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_3_cold_2()
{
}

- (void)_initializeShmemPage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_182B90000, a2, OS_LOG_TYPE_FAULT, "cfprefsd could not create a shmem named %s, cross-process preferences will not work correctly", (uint8_t *)&v2, 0xCu);
}

- (void)shmem
{
}

@end