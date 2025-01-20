@interface MXSessionManagerSecure
+ (id)sharedInstance;
- (BOOL)isSessionWithAudioModeActive:(id)a3;
- (MXSessionManagerSecure)init;
- (id)copyActiveSessionsInfoForAdditiveRouting;
- (id)copyMXCoreSessionSecureList;
- (id)copySessionWithAudioSessionID:(unsigned int)a3;
- (int)_beginInterruption:(id)a3 withSecTask:(__SecTask *)a4 andFlags:(unint64_t)a5;
- (int)_endInterruption:(id)a3 withSecTask:(__SecTask *)a4 andStatus:(id)a5;
- (unint64_t)addMXCoreSessionSecure:(id)a3;
- (unint64_t)removeMXCoreSessionSecure:(id)a3;
- (void)dealloc;
- (void)logDebugInfo;
@end

@implementation MXSessionManagerSecure

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  return (id)sharedInstance_sSharedInstance;
}

MXSessionManagerSecure *__40__MXSessionManagerSecure_sharedInstance__block_invoke()
{
  result = objc_alloc_init(MXSessionManagerSecure);
  sharedInstance_sSharedInstance = (uint64_t)result;
  return result;
}

- (MXSessionManagerSecure)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)MXSessionManagerSecure;
  v2 = [(MXSessionManagerSecure *)&v5 init];
  if (v2)
  {
    if (CMSMDeviceState_DeviceHasExclaveCapability())
    {
      v2->mMXCoreSessionSecureList = (NSPointerArray *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:5];
      v2->mMXCoreSessionSecureListLock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  self->mMXCoreSessionSecureList = 0;
  self->mMXCoreSessionSecureListLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXSessionManagerSecure;
  [(MXSessionManagerSecure *)&v3 dealloc];
}

- (unint64_t)addMXCoreSessionSecure:(id)a3
{
  objc_initWeak(&location, a3);
  [(NSLock *)self->mMXCoreSessionSecureListLock lock];
  [(NSPointerArray *)self->mMXCoreSessionSecureList addPointer:objc_loadWeak(&location)];
  [(NSPointerArray *)self->mMXCoreSessionSecureList compact];
  unint64_t v4 = [(NSPointerArray *)self->mMXCoreSessionSecureList count];
  [(NSLock *)self->mMXCoreSessionSecureListLock unlock];
  objc_destroyWeak(&location);
  return v4;
}

- (unint64_t)removeMXCoreSessionSecure:(id)a3
{
  objc_initWeak(&location, a3);
  [(NSLock *)self->mMXCoreSessionSecureListLock lock];
  for (unint64_t i = 0; i < [(NSPointerArray *)self->mMXCoreSessionSecureList count]; ++i)
  {
    if (objc_msgSend(-[NSPointerArray pointerAtIndex:](self->mMXCoreSessionSecureList, "pointerAtIndex:", i), "isEqual:", objc_loadWeak(&location)))
    {
      [(NSPointerArray *)self->mMXCoreSessionSecureList removePointerAtIndex:i];
      [(NSPointerArray *)self->mMXCoreSessionSecureList compact];
      break;
    }
  }
  unint64_t v5 = [(NSPointerArray *)self->mMXCoreSessionSecureList count];
  [(NSLock *)self->mMXCoreSessionSecureListLock unlock];
  objc_destroyWeak(&location);
  return v5;
}

- (id)copyMXCoreSessionSecureList
{
  objc_super v3 = (void *)MEMORY[0x1997179E0]([(NSLock *)self->mMXCoreSessionSecureListLock lock]);
  unint64_t v4 = [(NSPointerArray *)self->mMXCoreSessionSecureList allObjects];
  [(NSLock *)self->mMXCoreSessionSecureListLock unlock];
  return v4;
}

- (int)_beginInterruption:(id)a3 withSecTask:(__SecTask *)a4 andFlags:(unint64_t)a5
{
  if (objc_msgSend((id)objc_msgSend(a3, "audioMode"), "isEqualToString:", @"Enrollment"))
  {
    if (CMSMUtility_IsPhoneCallActive())
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return -15685;
    }
    [+[MXSessionManager sharedInstance] interruptAllSessionsAndSystemSounds:@"secure enrollment session is going active"];
    int v7 = [+[MXSessionManager sharedInstance] updateSecureSpeakerMuteState:1];
    if (v7)
    {
      int v10 = v7;
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return v10;
    }
  }
  [a3 setIsActive:1];
  if (dword_1E9359ED0)
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSUtility_CreateReporterIDIfNeeded(a3);
  return [+[MXAdditiveRoutingManager sharedInstance] sendActiveSessionsInfoToVA];
}

- (int)_endInterruption:(id)a3 withSecTask:(__SecTask *)a4 andStatus:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a3, "audioMode"), "isEqualToString:", @"Enrollment")
    && (int v6 = [+[MXSessionManager sharedInstance] updateSecureSpeakerMuteState:0]) != 0)
  {
    int v7 = v6;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    [a3 setIsActive:0];
    if (dword_1E9359ED0)
    {
      v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return [+[MXAdditiveRoutingManager sharedInstance] sendActiveSessionsInfoToVA];
  }
  return v7;
}

- (id)copySessionWithAudioSessionID:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [(MXSessionManagerSecure *)self copyMXCoreSessionSecureList];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 audioSessionID] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)copyActiveSessionsInfoForAdditiveRouting
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [(MXSessionManagerSecure *)self copyMXCoreSessionSecureList];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v8, "isActive", v12, v13))
        {
          uint64_t v9 = [v8 additiveRoutingInfo];
          if (v9)
          {
            [v14 addObject:v9];
          }
          else
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return v14;
}

- (BOOL)isSessionWithAudioModeActive:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [(MXSessionManagerSecure *)self copyMXCoreSessionSecureList];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if [v9 isActive] && (objc_msgSend(v9, "hasAudioMode:", a3))
        {
          BOOL v10 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (void)logDebugInfo
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    unsigned int v23 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v4 = [(MXSessionManagerSecure *)self copyMXCoreSessionSecureList];
  uint64_t v5 = CMSMUtility_CopyPrioritizedListBasedOnPlayingAndActiveState(v4);
  if (dword_1E9359ED0)
  {
    unsigned int v23 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16, v15, v17);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) logDebugInfo];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }
  if (dword_1E9359ED0)
  {
    unsigned int v23 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v12 = v23;
    if (os_log_type_enabled(v11, type)) {
      unsigned int v13 = v12;
    }
    else {
      unsigned int v13 = v12 & 0xFFFFFFFE;
    }
    if (v13)
    {
      int v25 = 136315138;
      v26 = "-[MXSessionManagerSecure logDebugInfo]";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

@end