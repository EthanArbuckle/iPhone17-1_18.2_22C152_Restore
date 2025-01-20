@interface MXSessionManagerSidekick
+ (id)sharedInstance;
- (BOOL)isSomeOtherSessionPlaying:(id)a3;
- (MXSessionManagerSidekick)init;
- (NSMapTable)coreSessionIDToMXSessionList;
- (NSMapTable)remoteDeviceIDToCoreSessionIDList;
- (NSRecursiveLock)recursiveLock;
- (OS_dispatch_queue)serialQueue;
- (id)copyMXCoreSessionForAudioSessionID:(unsigned int)a3;
- (id)copyMXSessionList:(id)a3;
- (int)postInterruptionEndedNotificationForAudioSessionID:(unsigned int)a3 resumable:(BOOL)a4;
- (void)dealloc;
- (void)dumpCoreSessionList;
- (void)dumpVersionNumbersFromSidekickSessionBehavioursPlist;
- (void)postNotification:(id)a3 toSession:(id)a4 payload:(id)a5;
- (void)registerMXCoreSessionSidekick:(id)a3;
- (void)unregisterMXCoreSessionSidekick:(id)a3;
@end

@implementation MXSessionManagerSidekick

- (void)dumpCoreSessionList
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)[(MXSessionManagerSidekick *)self recursiveLock] lock];
  [(NSPointerArray *)self->mCoreSessionList addPointer:0];
  [(NSPointerArray *)self->mCoreSessionList compact];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v30 = self;
  obj = self->mCoreSessionList;
  uint64_t v31 = [(NSPointerArray *)obj countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v40;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v39 + 1) + 8 * v3);
        id v5 = -[MXSessionManagerSidekick copyMXSessionList:](v30, "copyMXSessionList:", v4, v24, v26);
        if (dword_1E9359ED0)
        {
          unsigned int v38 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v7 = v38;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
            unsigned int v8 = v7;
          }
          else {
            unsigned int v8 = v7 & 0xFFFFFFFE;
          }
          if (v8)
          {
            uint64_t v9 = [v4 clientName];
            uint64_t v10 = [v5 count];
            int v44 = 136315650;
            v45 = "-[MXSessionManagerSidekick dumpCoreSessionList]";
            __int16 v46 = 2114;
            uint64_t v47 = v9;
            __int16 v48 = 2048;
            uint64_t v49 = v10;
            LODWORD(v27) = 32;
            v25 = &v44;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          if (dword_1E9359ED0)
          {
            unsigned int v38 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v12 = v38;
            if (os_log_type_enabled(v11, type)) {
              unsigned int v13 = v12;
            }
            else {
              unsigned int v13 = v12 & 0xFFFFFFFE;
            }
            if (v13)
            {
              uint64_t v14 = [v4 info];
              int v44 = 136315394;
              v45 = "-[MXSessionManagerSidekick dumpCoreSessionList]";
              __int16 v46 = 2114;
              uint64_t v47 = v14;
              LODWORD(v27) = 22;
              v25 = &v44;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        uint64_t v32 = v3;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v43, 16, v25, v27);
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v34 != v17) {
                objc_enumerationMutation(v5);
              }
              if (dword_1E9359ED0)
              {
                v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                unsigned int v38 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v21 = v38;
                if (os_log_type_enabled(v20, type)) {
                  unsigned int v22 = v21;
                }
                else {
                  unsigned int v22 = v21 & 0xFFFFFFFE;
                }
                if (v22)
                {
                  uint64_t v23 = [v19 info];
                  int v44 = 136315394;
                  v45 = "-[MXSessionManagerSidekick dumpCoreSessionList]";
                  __int16 v46 = 2114;
                  uint64_t v47 = v23;
                  LODWORD(v26) = 22;
                  v24 = &v44;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
            uint64_t v16 = [v5 countByEnumeratingWithState:&v33 objects:v43 count:16];
          }
          while (v16);
        }

        uint64_t v3 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [(NSPointerArray *)obj countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v31);
  }
  [(NSRecursiveLock *)[(MXSessionManagerSidekick *)v30 recursiveLock] unlock];
}

- (void)dumpVersionNumbersFromSidekickSessionBehavioursPlist
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CelestialGetModelSpecificName();
  uint64_t v2 = CelestialCFCreatePropertyListForModelAndBundleIdentifier();
  if (v2 && (uint64_t v3 = (void *)v2, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v24 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          if (dword_1E9359ED0)
          {
            unsigned int v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            unsigned int v19 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v10 = v19;
            if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
              unsigned int v11 = v10;
            }
            else {
              unsigned int v11 = v10 & 0xFFFFFFFE;
            }
            if (v11)
            {
              uint64_t v12 = [v8 valueForKey:@"Version"];
              int v20 = 136315394;
              unsigned int v21 = "-[MXSessionManagerSidekick dumpVersionNumbersFromSidekickSessionBehavioursPlist]";
              __int16 v22 = 2114;
              uint64_t v23 = v12;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v24 count:16];
      }
      while (v5);
    }
  }
  else
  {
    unsigned int v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (BOOL)isSomeOtherSessionPlaying:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)[(MXSessionManagerSidekick *)self recursiveLock] lock];
  [(NSPointerArray *)self->mCoreSessionList addPointer:0];
  [(NSPointerArray *)self->mCoreSessionList compact];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mCoreSessionList = self->mCoreSessionList;
  uint64_t v6 = [(NSPointerArray *)mCoreSessionList countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(mCoreSessionList);
        }
        id v10 = *(id *)(*((void *)&v13 + 1) + 8 * i);
        if (v10 != a3
          && [*(id *)(*((void *)&v13 + 1) + 8 * i) isPlaying]
          && (objc_msgSend((id)objc_msgSend(a3, "remoteDeviceID"), "isEqualToString:", objc_msgSend(v10, "remoteDeviceID")) & 1) != 0)
        {
          BOOL v11 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [(NSPointerArray *)mCoreSessionList countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_13:
  [(NSRecursiveLock *)[(MXSessionManagerSidekick *)self recursiveLock] unlock];
  return v11;
}

- (MXSessionManagerSidekick)init
{
  if (gMXSessionManagerSidekick)
  {

    return (MXSessionManagerSidekick *)gMXSessionManagerSidekick;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MXSessionManagerSidekick;
    uint64_t v2 = [(MXSessionManagerSidekick *)&v6 init];
    if (v2)
    {
      uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaexperiencesession.Sidekick", v3);
      v2->_remoteDeviceIDToCoreSessionIDList = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
      v2->_coreSessionIDToMXSessionList = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
      v2->_recursiveLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
      v2->mCoreSessionList = (NSPointerArray *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:5];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __32__MXSessionManagerSidekick_init__block_invoke;
      v5[3] = &unk_1E57C6368;
      v5[4] = v2;
      MXInstallSysdiagnoseBlock(@"MXSessionManagerSidekickSessionList", (uint64_t)v5);
    }
    gMXSessionManagerSidekick = (uint64_t)v2;
  }
  return v2;
}

void __32__MXSessionManagerSidekick_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serialQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__MXSessionManagerSidekick_init__block_invoke_2;
  v3[3] = &unk_1E57C6368;
  v3[4] = *(void *)(a1 + 32);
  MXDispatchAsync((uint64_t)"-[MXSessionManagerSidekick init]_block_invoke", (uint64_t)"MXSessionManagerSidekick.m", 133, 0, 0, v2, (uint64_t)v3);
}

uint64_t __32__MXSessionManagerSidekick_init__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) dumpCoreSessionList];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 dumpVersionNumbersFromSidekickSessionBehavioursPlist];
}

- (void)dealloc
{
  uint64_t v3 = (void *)MEMORY[0x1997179E0](self, a2);
  dispatch_release((dispatch_object_t)self->_serialQueue);

  v4.receiver = self;
  v4.super_class = (Class)MXSessionManagerSidekick;
  [(MXSessionManagerSidekick *)&v4 dealloc];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MXSessionManagerSidekick_sharedInstance__block_invoke;
  block[3] = &unk_1E57C6368;
  block[4] = a1;
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, block);
  }
  return (id)gMXSessionManagerSidekick;
}

uint64_t __42__MXSessionManagerSidekick_sharedInstance__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_METACLASS___MXSessionManagerSidekick;
  uint64_t result = objc_msgSend(objc_msgSendSuper2(&v2, sel_allocWithZone_, 0), "init");
  gMXSessionManagerSidekick = result;
  return result;
}

- (id)copyMXCoreSessionForAudioSessionID:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)[(MXSessionManagerSidekick *)self recursiveLock] lock];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mCoreSessionList = self->mCoreSessionList;
  uint64_t v6 = [(NSPointerArray *)mCoreSessionList countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(mCoreSessionList);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 audioSessionID] == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSPointerArray *)mCoreSessionList countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:
  [(NSRecursiveLock *)[(MXSessionManagerSidekick *)self recursiveLock] unlock];
  return v10;
}

- (void)registerMXCoreSessionSidekick:(id)a3
{
  [(NSRecursiveLock *)[(MXSessionManagerSidekick *)self recursiveLock] lock];
  id v5 = -[NSMapTable objectForKey:](-[MXSessionManagerSidekick remoteDeviceIDToCoreSessionIDList](self, "remoteDeviceIDToCoreSessionIDList"), "objectForKey:", [a3 remoteDeviceID]);
  uint64_t v6 = v5;
  if (!v5) {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:5];
  }
  objc_initWeak(&location, a3);
  [v6 addPointer:objc_loadWeak(&location)];
  -[NSMapTable setObject:forKey:](-[MXSessionManagerSidekick remoteDeviceIDToCoreSessionIDList](self, "remoteDeviceIDToCoreSessionIDList"), "setObject:forKey:", v6, [a3 remoteDeviceID]);
  [(NSPointerArray *)self->mCoreSessionList addPointer:objc_loadWeak(&location)];
  [(NSRecursiveLock *)[(MXSessionManagerSidekick *)self recursiveLock] unlock];
  if (!v5) {

  }
  objc_destroyWeak(&location);
}

- (void)unregisterMXCoreSessionSidekick:(id)a3
{
  [(NSRecursiveLock *)[(MXSessionManagerSidekick *)self recursiveLock] lock];
  [(NSPointerArray *)self->mCoreSessionList addPointer:0];
  [(NSPointerArray *)self->mCoreSessionList compact];
  id v5 = -[NSMapTable objectForKey:](-[MXSessionManagerSidekick remoteDeviceIDToCoreSessionIDList](self, "remoteDeviceIDToCoreSessionIDList"), "objectForKey:", [a3 remoteDeviceID]);
  [v5 addPointer:0];
  [v5 compact];
  if (![v5 count]) {
    -[NSMapTable removeObjectForKey:](-[MXSessionManagerSidekick remoteDeviceIDToCoreSessionIDList](self, "remoteDeviceIDToCoreSessionIDList"), "removeObjectForKey:", [a3 remoteDeviceID]);
  }
  uint64_t v6 = [(MXSessionManagerSidekick *)self recursiveLock];
  [(NSRecursiveLock *)v6 unlock];
}

- (id)copyMXSessionList:(id)a3
{
  if (a3)
  {
    id v5 = (void *)MEMORY[0x1997179E0](self, a2);
    [(NSRecursiveLock *)[(MXSessionManagerSidekick *)self recursiveLock] lock];
    id v6 = (id)objc_msgSend(-[NSMapTable objectForKey:](-[MXSessionManagerSidekick coreSessionIDToMXSessionList](self, "coreSessionIDToMXSessionList"), "objectForKey:", objc_msgSend(a3, "ID")), "allObjects");
    [(NSRecursiveLock *)[(MXSessionManagerSidekick *)self recursiveLock] unlock];
    return v6;
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
}

- (int)postInterruptionEndedNotificationForAudioSessionID:(unsigned int)a3 resumable:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = -[MXSessionManagerSidekick copyMXCoreSessionForAudioSessionID:](self, "copyMXCoreSessionForAudioSessionID:");
  if (v6)
  {
    uint64_t v7 = v6;
    if ([v6 isActive])
    {
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      id v10 = MXGetNotificationSenderQueue();
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __89__MXSessionManagerSidekick_postInterruptionEndedNotificationForAudioSessionID_resumable___block_invoke;
      v12[3] = &unk_1E57CA038;
      BOOL v13 = a4;
      v12[4] = v7;
      v12[5] = self;
      MXDispatchAsync((uint64_t)"-[MXSessionManagerSidekick postInterruptionEndedNotificationForAudioSessionID:resumable:]", (uint64_t)"MXSessionManagerSidekick.m", 287, 0, 0, v10, (uint64_t)v12);
    }
    return 0;
  }
  else
  {
    uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return -15681;
  }
}

void __89__MXSessionManagerSidekick_postInterruptionEndedNotificationForAudioSessionID_resumable___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48)) {
    objc_super v2 = @"resumable.MXSessionManager";
  }
  else {
    objc_super v2 = @"non-resumable.MXSessionManager";
  }
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  objc_super v4 = objc_msgSend(v3, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", 1), @"InterruptionCmd", @"MXSessionManager", @"InterruptorName", v2, @"Status", 0);
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 40), "postNotification:toSession:payload:", @"Interruption", *(void *)(a1 + 32), v4, v6, v7);
}

- (void)postNotification:(id)a3 toSession:(id)a4 payload:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", a3, a4, a5);
  id v9 = [(MXSessionManagerSidekick *)self copyMXSessionList:a4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", a3, *(void *)(*((void *)&v14 + 1) + 8 * v13++), a5);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSMapTable)remoteDeviceIDToCoreSessionIDList
{
  return self->_remoteDeviceIDToCoreSessionIDList;
}

- (NSMapTable)coreSessionIDToMXSessionList
{
  return self->_coreSessionIDToMXSessionList;
}

- (NSRecursiveLock)recursiveLock
{
  return self->_recursiveLock;
}

@end