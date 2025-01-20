@interface MXCoreSessionSidekick
- (BOOL)isCategoryValid:(id)a3;
- (BOOL)isModeValidForCategory:(id)a3;
- (MXCoreSessionSidekick)initWithRemoteDeviceID:(id)a3;
- (NSString)remoteDeviceID;
- (id)_initWithRemoteDeviceID:(id)a3;
- (int)_activate;
- (int)_copyPropertyForKey:(id)a3 valueOut:(id *)a4;
- (int)_deactivate:(BOOL)a3 postInterruptionNotification:(BOOL)a4;
- (int)_setPropertyForKey:(id)a3 value:(id)a4;
- (int)activate;
- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4;
- (int)deactivate:(BOOL)a3 postInterruptionNotification:(BOOL)a4;
- (int)setPropertyForKey:(id)a3 value:(id)a4;
- (void)dealloc;
- (void)setRemoteDeviceID:(id)a3;
@end

@implementation MXCoreSessionSidekick

- (MXCoreSessionSidekick)initWithRemoteDeviceID:(id)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  uint64_t v14 = 0;
  v5 = [+[MXSessionManagerSidekick sharedInstance] serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__MXCoreSessionSidekick_initWithRemoteDeviceID___block_invoke;
  v8[3] = &unk_1E57C9678;
  v8[5] = a3;
  v8[6] = &v9;
  v8[4] = self;
  MXDispatchAsyncAndWait((uint64_t)"-[MXCoreSessionSidekick initWithRemoteDeviceID:]", (uint64_t)"MXCoreSessionSidekick.m", 46, 0, 0, v5, (uint64_t)v8);
  v6 = (MXCoreSessionSidekick *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __48__MXCoreSessionSidekick_initWithRemoteDeviceID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _initWithRemoteDeviceID:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (int)activate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v3 = [+[MXSessionManagerSidekick sharedInstance] serialQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__MXCoreSessionSidekick_activate__block_invoke;
  v5[3] = &unk_1E57C96A0;
  v5[4] = self;
  v5[5] = &v6;
  MXDispatchAsyncAndWait((uint64_t)"-[MXCoreSessionSidekick activate]", (uint64_t)"MXCoreSessionSidekick.m", 57, 0, 0, v3, (uint64_t)v5);
  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)self;
}

uint64_t __33__MXCoreSessionSidekick_activate__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _activate];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)deactivate:(BOOL)a3 postInterruptionNotification:(BOOL)a4
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  v7 = [+[MXSessionManagerSidekick sharedInstance] serialQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__MXCoreSessionSidekick_deactivate_postInterruptionNotification___block_invoke;
  v10[3] = &unk_1E57C96C8;
  v10[4] = self;
  v10[5] = &v13;
  BOOL v11 = a3;
  BOOL v12 = a4;
  MXDispatchAsyncAndWait((uint64_t)"-[MXCoreSessionSidekick deactivate:postInterruptionNotification:]", (uint64_t)"MXCoreSessionSidekick.m", 69, 0, 0, v7, (uint64_t)v10);
  int v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __65__MXCoreSessionSidekick_deactivate_postInterruptionNotification___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _deactivate:*(unsigned __int8 *)(a1 + 48) postInterruptionNotification:*(unsigned __int8 *)(a1 + 49)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dealloc
{
  v3 = (void *)MEMORY[0x1997179E0](self, a2);
  [+[MXSessionManagerSidekick sharedInstance] unregisterMXCoreSessionSidekick:self];

  v4.receiver = self;
  v4.super_class = (Class)MXCoreSessionSidekick;
  [(MXCoreSessionBase *)&v4 dealloc];
}

- (int)setPropertyForKey:(id)a3 value:(id)a4
{
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v7 = [+[MXSessionManagerSidekick sharedInstance] serialQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__MXCoreSessionSidekick_setPropertyForKey_value___block_invoke;
  v9[3] = &unk_1E57C57E0;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  v9[7] = &v10;
  MXDispatchAsyncAndWait((uint64_t)"-[MXCoreSessionSidekick setPropertyForKey:value:]", (uint64_t)"MXCoreSessionSidekick.m", 91, 0, 0, v7, (uint64_t)v9);
  LODWORD(a4) = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return (int)a4;
}

uint64_t __49__MXCoreSessionSidekick_setPropertyForKey_value___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _setPropertyForKey:*(void *)(a1 + 40) value:*(void *)(a1 + 48)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4
{
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v7 = [+[MXSessionManagerSidekick sharedInstance] serialQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__MXCoreSessionSidekick_copyPropertyForKey_valueOut___block_invoke;
  v9[3] = &unk_1E57C5808;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = &v10;
  v9[7] = a4;
  MXDispatchAsyncAndWait((uint64_t)"-[MXCoreSessionSidekick copyPropertyForKey:valueOut:]", (uint64_t)"MXCoreSessionSidekick.m", 102, 0, 0, v7, (uint64_t)v9);
  LODWORD(a4) = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return (int)a4;
}

uint64_t __53__MXCoreSessionSidekick_copyPropertyForKey_valueOut___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _copyPropertyForKey:*(void *)(a1 + 40) valueOut:*(void *)(a1 + 56)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (NSString)remoteDeviceID
{
  return self->_remoteDeviceID;
}

- (void)setRemoteDeviceID:(id)a3
{
}

- (id)_initWithRemoteDeviceID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)MXCoreSessionSidekick;
  objc_super v4 = [(MXCoreSessionBase *)&v10 init];
  v5 = v4;
  if (v4)
  {
    [(MXCoreSessionSidekick *)v4 setRemoteDeviceID:a3];
    [(MXCoreSessionBase *)v5 setAudioCategory:@"MediaPlayback"];
    [(MXCoreSessionBase *)v5 setAudioMode:@"Default"];
    CFTypeRef cf = 0;
    FigRoutingManagerContextUtilities_CopySidePlayContextUUID((uint64_t)&cf);
    [(MXCoreSessionBase *)v5 setRoutingContextUUID:cf];
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    LODWORD(v6) = *(_DWORD *)"333?";
    [(MXCoreSessionBase *)v5 setInterruptionFadeDuration:v6];
    [+[MXSessionManagerSidekick sharedInstance] registerMXCoreSessionSidekick:v5];
    if (dword_1E9359ED0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v5;
}

- (int)_activate
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (![(MXCoreSessionBase *)self isActive])
  {
    [(MXCoreSessionBase *)self setIsActive:1];
    if (dword_1E9359ED0)
    {
      int v26 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSUtility_CreateReporterIDIfNeeded(self);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    objc_super v4 = [(MXCoreSessionBase *)self reporterIDs];
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          CMSUtility_SetAudioServiceTypeForReporterID(self, objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "longLongValue", v19, v20));
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v6);
    }
    CMSUtility_StartReporterWithAudioStatistics(self);
    [(MXCoreSessionBase *)self interruptionFadeDuration];
    float v10 = v9;
    if ([(NSString *)[(MXCoreSessionBase *)self audioMode] isEqualToString:@"Sleep"])
    {
      float v11 = 5.0;
    }
    else
    {
      float v11 = *(float *)"333?";
    }
    id v12 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", -[MXCoreSessionBase audioSessionID](self, "audioSessionID"));
    uint64_t v14 = objc_msgSend(v12, "initWithObjectsAndKeys:", v13, @"AudioSessionID", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MXCoreSessionBase isActive](self, "isActive")), @"IsActive", -[MXCoreSessionBase audioCategory](self, "audioCategory"), @"AudioCategory", -[MXCoreSessionBase audioMode](self, "audioMode"), @"AudioMode", 0);
    int v16 = (void *)v14;
    if (v10 != v11)
    {
      v17 = (void *)MEMORY[0x1E4F28ED0];
      [(MXCoreSessionBase *)self interruptionFadeDuration];
      uint64_t v14 = objc_msgSend(v16, "setObject:forKey:", objc_msgSend(v17, "numberWithFloat:"), @"InterruptionFadeDuration");
    }
    if (MX_FeatureFlags_IsAirPlayDaemonEnabled(v14, v15)) {
      objc_msgSend(v16, "setObject:forKey:", -[MXCoreSessionSidekick remoteDeviceID](self, "remoteDeviceID"), @"RemoteDeviceID");
    }
    +[MXSystemController notifyAll:@"SomeClientIsActiveDidChange" payload:v16 dontPostIfSuspended:0 remoteDeviceID:[(MXCoreSessionSidekick *)self remoteDeviceID]];
  }
  return 0;
}

- (int)_deactivate:(BOOL)a3 postInterruptionNotification:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(MXCoreSessionBase *)self isActive])
  {
    [(MXCoreSessionSidekick *)self _setPropertyForKey:@"IsPlaying" value:*MEMORY[0x1E4F1CFC8]];
    [(MXCoreSessionBase *)self setIsActive:0];
    CMSUtility_StopReporterWithAudioStatistics(self);
    uint64_t v7 = [(MXCoreSessionBase *)self audioSessionID];
    id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v7];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MXCoreSessionBase isActive](self, "isActive"));
    float v11 = objc_msgSend(v8, "initWithObjectsAndKeys:", v9, @"AudioSessionID", v10, @"IsActive", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", v5), @"NotifyOthers", -[MXCoreSessionBase audioCategory](self, "audioCategory"), @"AudioCategory", -[MXCoreSessionBase audioMode](self, "audioMode"), @"AudioMode", 0);
    if (MX_FeatureFlags_IsAirPlayDaemonEnabled(v11, v12)) {
      objc_msgSend(v11, "setObject:forKey:", -[MXCoreSessionSidekick remoteDeviceID](self, "remoteDeviceID"), @"RemoteDeviceID");
    }
    +[MXSystemController notifyAll:@"SomeClientIsActiveDidChange" payload:v11 dontPostIfSuspended:0 remoteDeviceID:[(MXCoreSessionSidekick *)self remoteDeviceID]];

    if (dword_1E9359ED0)
    {
      int v19 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v4)
    {
      uint64_t v14 = self;
      uint64_t v15 = MXGetNotificationSenderQueue();
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __79__MXCoreSessionSidekick_InternalUse___deactivate_postInterruptionNotification___block_invoke;
      v17[3] = &unk_1E57C96F0;
      v17[4] = self;
      v17[5] = self;
      MXDispatchAsync((uint64_t)"-[MXCoreSessionSidekick(InternalUse) _deactivate:postInterruptionNotification:]", (uint64_t)"MXCoreSessionSidekick.m", 230, 0, 0, v15, (uint64_t)v17);
    }
  }
  return 0;
}

void __79__MXCoreSessionSidekick_InternalUse___deactivate_postInterruptionNotification___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
  BOOL v4 = objc_msgSend(v2, "initWithObjectsAndKeys:", v3, @"InterruptionCmd", @"MXSessionManager", @"InterruptorName", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", 2), @"InterruptionReason", 0);
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [+[MXSessionManagerSidekick sharedInstance] postNotification:@"Interruption" toSession:*(void *)(a1 + 40) payload:v4];
}

- (BOOL)isCategoryValid:(id)a3
{
  if ([a3 isEqualToString:@"Alarm"]) {
    return 1;
  }
  return [a3 isEqualToString:@"MediaPlayback"];
}

- (BOOL)isModeValidForCategory:(id)a3
{
  if (![(NSString *)[(MXCoreSessionBase *)self audioCategory] isEqualToString:@"Alarm"])
  {
    int v6 = [(NSString *)[(MXCoreSessionBase *)self audioCategory] isEqualToString:@"MediaPlayback"];
    if (!v6) {
      return v6;
    }
    if (([a3 isEqualToString:@"Default"] & 1) == 0
      && ([a3 isEqualToString:@"VoicePrompt"] & 1) == 0)
    {
      BOOL v5 = kMXSessionAudioMode_VoiceMessages;
      goto LABEL_10;
    }
LABEL_7:
    LOBYTE(v6) = 1;
    return v6;
  }
  if ([a3 isEqualToString:@"Default"]) {
    goto LABEL_7;
  }
  BOOL v5 = kMXSessionAudioMode_Sleep;
LABEL_10:
  uint64_t v7 = *v5;
  LOBYTE(v6) = [a3 isEqualToString:v7];
  return v6;
}

- (int)_setPropertyForKey:(id)a3 value:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!objc_msgSend(a3, "isEqualToString:", @"AudioSessionID", v25, v26))
  {
    if ([a3 isEqualToString:@"ClientPID"])
    {
      if (a4)
      {
        CFTypeID v9 = CFGetTypeID(a4);
        if (v9 == CFNumberGetTypeID())
        {
          [(MXCoreSessionBase *)self setClientPID:a4];
          return 0;
        }
      }
      goto LABEL_53;
    }
    if ([a3 isEqualToString:@"ClientName"])
    {
      if (a4)
      {
        CFTypeID v10 = CFGetTypeID(a4);
        if (v10 == CFStringGetTypeID())
        {
          [(MXCoreSessionBase *)self updateClientName:a4];
          return 0;
        }
      }
      goto LABEL_53;
    }
    if ([a3 isEqualToString:@"AudioCategory"])
    {
      if (a4)
      {
        CFTypeID v11 = CFGetTypeID(a4);
        if (v11 == CFStringGetTypeID())
        {
          if ([(MXCoreSessionSidekick *)self isCategoryValid:a4])
          {
            [(MXCoreSessionBase *)self setAudioCategory:a4];
            return 0;
          }
          int v12 = -12981;
LABEL_44:
          long long v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          return v12;
        }
      }
      goto LABEL_53;
    }
    if ([a3 isEqualToString:@"AudioMode"])
    {
      if (a4)
      {
        CFTypeID v14 = CFGetTypeID(a4);
        if (v14 == CFStringGetTypeID())
        {
          uint64_t v15 = [(MXCoreSessionBase *)self audioMode];
          if ([(MXCoreSessionSidekick *)self isModeValidForCategory:a4])
          {
            [(MXCoreSessionBase *)self setAudioMode:a4];
            [(MXCoreSessionBase *)self updateDefaultInterruptionFadeDuration:v15];
            int v12 = 0;
          }
          else
          {
            int v12 = -12981;
          }

LABEL_43:
          if (!v12) {
            return v12;
          }
          goto LABEL_44;
        }
      }
LABEL_53:
      int v12 = FigSignalErrorAt();
      goto LABEL_43;
    }
    if ([a3 isEqualToString:@"IsPlaying"])
    {
      if (a4)
      {
        CFTypeID v16 = CFGetTypeID(a4);
        if (v16 == CFBooleanGetTypeID())
        {
          id v17 = (id)*MEMORY[0x1E4F1CFD0];
          BOOL v18 = *MEMORY[0x1E4F1CFD0] == (void)a4;
          if ([(MXCoreSessionBase *)self isPlaying] != v18)
          {
            if (v17 == a4 && ![(MXCoreSessionBase *)self isActive]) {
              [(MXCoreSessionSidekick *)self _activate];
            }
            [(MXCoreSessionBase *)self setIsPlaying:v17 == a4];
            if (dword_1E9359ED0)
            {
              int v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            +[MXSystemController notifyAll:payload:dontPostIfSuspended:](MXSystemController, "notifyAll:payload:dontPostIfSuspended:", @"SomeSidekickSessionIsPlayingDidChange", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", -[MXCoreSessionSidekick remoteDeviceID](self, "remoteDeviceID"), @"RemoteDeviceID", 0), 0);
          }
          return 0;
        }
      }
      goto LABEL_53;
    }
    if ([a3 isEqualToString:@"IAmTheAssistant"])
    {
      if (a4)
      {
        CFTypeID v20 = CFGetTypeID(a4);
        if (v20 == CFBooleanGetTypeID())
        {
          [(MXCoreSessionBase *)self setIsTheAssistant:*MEMORY[0x1E4F1CFD0] == (void)a4];
          return 0;
        }
      }
      goto LABEL_53;
    }
    if (![a3 isEqualToString:@"InterruptionFadeDuration"]) {
      return 0;
    }
    BOOL v22 = [(MXCoreSessionBase *)self hasAudioMode:@"Sleep"];
    float v23 = *(float *)"333?";
    if (v22) {
      float v23 = 5.0;
    }
    valuePtr[0] = v23;
    if (a4)
    {
      CFTypeID v24 = CFGetTypeID(a4);
      if (v24 != CFNumberGetTypeID()) {
        goto LABEL_53;
      }
      CFNumberGetValue((CFNumberRef)a4, kCFNumberFloat32Type, valuePtr);
    }
    -[MXCoreSessionBase setInterruptionFadeDuration:](self, "setInterruptionFadeDuration:");
    int v12 = 0;
    goto LABEL_43;
  }
  if (!a4) {
    goto LABEL_53;
  }
  CFTypeID v8 = CFGetTypeID(a4);
  if (v8 != CFNumberGetTypeID()) {
    goto LABEL_53;
  }
  -[MXCoreSessionBase setAudioSessionID:](self, "setAudioSessionID:", [a4 unsignedIntValue]);
  return 0;
}

- (int)_copyPropertyForKey:(id)a3 valueOut:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return -15682;
  }
  if (![a3 isEqualToString:@"RemoteDeviceID"])
  {
    if ([a3 isEqualToString:@"RoutingContextUUID"])
    {
      uint64_t v7 = [(MXCoreSessionBase *)self routingContextUUID];
      goto LABEL_7;
    }
    if ([a3 isEqualToString:@"RoutingContext"])
    {
      FigRoutingManagerContextUtilities_CopyRoutingContextForContextUUID((uint64_t)[(MXCoreSessionBase *)self routingContextUUID], (uint64_t)a4);
      goto LABEL_8;
    }
    if ([a3 isEqualToString:@"AudioSessionID"])
    {
      [(MXCoreSessionBase *)self audioSessionID];
      UInt32 = (void *)FigCFNumberCreateUInt32();
LABEL_19:
      *a4 = UInt32;
      goto LABEL_8;
    }
    if ([a3 isEqualToString:@"ClientPID"])
    {
      valuePtr[0] = [(NSNumber *)[(MXCoreSessionBase *)self clientPID] intValue];
LABEL_17:
      CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFNumberType v12 = kCFNumberIntType;
LABEL_18:
      UInt32 = CFNumberCreate(v11, v12, valuePtr);
      goto LABEL_19;
    }
    if ([a3 isEqualToString:@"ClientName"])
    {
      uint64_t v7 = [(MXCoreSessionBase *)self clientName];
      goto LABEL_7;
    }
    if ([a3 isEqualToString:@"AudioCategory"])
    {
      uint64_t v7 = [(MXCoreSessionBase *)self audioCategory];
      goto LABEL_7;
    }
    if ([a3 isEqualToString:@"AudioMode"])
    {
      uint64_t v7 = [(MXCoreSessionBase *)self audioMode];
      goto LABEL_7;
    }
    if ([a3 isEqualToString:@"IsActive"])
    {
      BOOL v13 = [(MXCoreSessionBase *)self isActive];
    }
    else if ([a3 isEqualToString:@"IsPlaying"])
    {
      BOOL v13 = [(MXCoreSessionBase *)self isPlaying];
    }
    else
    {
      if ([a3 isEqualToString:@"MaximumNumberOfOutputChannels"])
      {
        valuePtr[0] = 2;
        goto LABEL_17;
      }
      if (![a3 isEqualToString:@"SomeOtherClientIsPlaying"])
      {
        if ([a3 isEqualToString:@"DetailedActiveAudioRoute"])
        {
          CFTypeID v20 = @"RouteDetailedDescription_Outputs";
          v17[0] = @"RouteDetailedDescription_Name";
          v17[1] = @"RouteDetailedDescription_PortType";
          v17[2] = @"RouteDetailedDescription_UID";
          v18[0] = @"AirTunes";
          v18[1] = @"AirTunes";
          v18[2] = @"AirTunes";
          uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
          v21[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
          uint64_t v7 = (NSArray *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
          goto LABEL_7;
        }
        if ([a3 isEqualToString:@"ReporterIDs"])
        {
          CMSUtility_CreateReporterIDIfNeeded(self);
          uint64_t v7 = [(MXCoreSessionBase *)self reporterIDs];
          goto LABEL_7;
        }
        if (![a3 isEqualToString:@"InterruptionFadeDuration"])
        {
          *a4 = 0;
          goto LABEL_8;
        }
        [(MXCoreSessionBase *)self interruptionFadeDuration];
        valuePtr[0] = v15;
        CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CFNumberType v12 = kCFNumberFloat32Type;
        goto LABEL_18;
      }
      BOOL v13 = [+[MXSessionManagerSidekick sharedInstance] isSomeOtherSessionPlaying:self];
    }
    CFTypeID v14 = (NSArray **)MEMORY[0x1E4F1CFD0];
    if (!v13) {
      CFTypeID v14 = (NSArray **)MEMORY[0x1E4F1CFC8];
    }
    uint64_t v7 = *v14;
    goto LABEL_7;
  }
  uint64_t v7 = [(MXCoreSessionSidekick *)self remoteDeviceID];
LABEL_7:
  *a4 = v7;
  CFRetain(v7);
LABEL_8:
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return 0;
}

@end