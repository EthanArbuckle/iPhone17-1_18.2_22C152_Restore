@interface MXCoreSessionSecure
- (BOOL)hasEntitlementToSetEnrollmentMode;
- (BOOL)updateAudioBehaviourFromVARouteConfig:(id)a3;
- (MXCoreSessionSecure)initWithOptions:(id)a3;
- (id)copyMXSessionSecureList;
- (id)getIsolatedAudioUseCaseIDAsString;
- (int)_beginInterruptionWithSecTask:(__SecTask *)a3 andFlags:(unint64_t)a4;
- (int)_endInterruptionWithSecTask:(__SecTask *)a3 andStatus:(id)a4;
- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4;
- (int)setPropertyForKey:(id)a3 value:(id)a4;
- (unint64_t)addMXSessionSecure:(id)a3;
- (unint64_t)removeMXSessionSecure:(id)a3;
- (unsigned)isolatedAudioUseCaseID;
- (void)dealloc;
- (void)logDebugInfo;
- (void)setHasEntitlementToSetEnrollmentMode:(BOOL)a3;
- (void)setIsolatedAudioUseCaseID:(unsigned int)a3;
- (void)updateEntitlements;
@end

@implementation MXCoreSessionSecure

- (MXCoreSessionSecure)initWithOptions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)MXCoreSessionSecure;
  v4 = [(MXCoreSessionBase *)&v18 init];
  if (!v4) {
    return v4;
  }
  if (!a3)
  {
    unsigned int v19 = 0;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v11 = v19;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v12 = v11;
    }
    else {
      unsigned int v12 = v11 & 0xFFFFFFFE;
    }
    if (!v12) {
      goto LABEL_23;
    }
LABEL_13:
    LODWORD(v20) = 136315138;
    *(void *)((char *)&v20 + 4) = "-[MXCoreSessionSecure initWithOptions:]";
    _os_log_send_and_compose_impl();
LABEL_23:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return 0;
  }
  if (!CMSMDeviceState_DeviceHasExclaveCapability())
  {
    unsigned int v19 = 0;
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v14 = v19;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v15 = v14;
    }
    else {
      unsigned int v15 = v14 & 0xFFFFFFFE;
    }
    if (!v15) {
      goto LABEL_23;
    }
    goto LABEL_13;
  }
  v5 = (void *)[a3 objectForKey:@"AuditToken"];
  *(void *)&long long v6 = -1;
  *((void *)&v6 + 1) = -1;
  long long v20 = v6;
  long long v21 = v6;
  [v5 getBytes:&v20 length:32];
  v7 = (void *)xpc_copy_entitlement_for_token();
  if (!v7
    || (*(_OWORD *)location = v20,
        long long v23 = v21,
        [(MXCoreSessionBase *)v4 setAuditToken:location],
        xpc_release(v7),
        uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IsolatedAudioUseCaseID"), "unsignedIntValue"),
        uint64_t v9 = v8,
        !v8))
  {
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    goto LABEL_23;
  }
  if (v8 == 1936290409) {
    [(MXCoreSessionBase *)v4 setIsTheAssistant:1];
  }
  [(MXCoreSessionSecure *)v4 setIsolatedAudioUseCaseID:v9];
  [(MXCoreSessionSecure *)v4 updateEntitlements];
  v4->mMXSessionSecureList = (NSPointerArray *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:5];
  v4->mMXSessionSecureListLock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
  objc_initWeak(location, v4);
  [+[MXSessionManagerSecure sharedInstance] addMXCoreSessionSecure:objc_loadWeak(location)];
  objc_destroyWeak(location);
  return v4;
}

- (void)dealloc
{
  [+[MXSessionManagerSecure sharedInstance] addMXCoreSessionSecure:0];

  self->mMXSessionSecureList = 0;
  self->mMXSessionSecureListLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXCoreSessionSecure;
  [(MXCoreSessionBase *)&v3 dealloc];
}

- (unint64_t)addMXSessionSecure:(id)a3
{
  objc_initWeak(&location, a3);
  [(NSLock *)self->mMXSessionSecureListLock lock];
  [(NSPointerArray *)self->mMXSessionSecureList addPointer:objc_loadWeak(&location)];
  [(NSPointerArray *)self->mMXSessionSecureList compact];
  unint64_t v4 = [(NSPointerArray *)self->mMXSessionSecureList count];
  [(NSLock *)self->mMXSessionSecureListLock unlock];
  objc_destroyWeak(&location);
  return v4;
}

- (unint64_t)removeMXSessionSecure:(id)a3
{
  objc_initWeak(&location, a3);
  [(NSLock *)self->mMXSessionSecureListLock lock];
  for (unint64_t i = 0; i < [(NSPointerArray *)self->mMXSessionSecureList count]; ++i)
  {
    if (objc_msgSend(-[NSPointerArray pointerAtIndex:](self->mMXSessionSecureList, "pointerAtIndex:", i), "isEqual:", objc_loadWeak(&location)))
    {
      [(NSPointerArray *)self->mMXSessionSecureList removePointerAtIndex:i];
      [(NSPointerArray *)self->mMXSessionSecureList compact];
      break;
    }
  }
  unint64_t v5 = [(NSPointerArray *)self->mMXSessionSecureList count];
  [(NSLock *)self->mMXSessionSecureListLock unlock];
  objc_destroyWeak(&location);
  return v5;
}

- (id)copyMXSessionSecureList
{
  objc_super v3 = (void *)MEMORY[0x1997179E0]([(NSLock *)self->mMXSessionSecureListLock lock]);
  unint64_t v4 = [(NSPointerArray *)self->mMXSessionSecureList allObjects];
  [(NSLock *)self->mMXSessionSecureListLock unlock];
  return v4;
}

- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || !a4)
  {
    int v10 = FigSignalErrorAt();
    if (!v10) {
      return v10;
    }
    goto LABEL_34;
  }
  if (![a3 isEqualToString:@"AudioBehaviour"])
  {
    if ([a3 isEqualToString:@"CurrentInputSampleRate"])
    {
      uint64_t v8 = [+[MXSessionManager sharedInstance] devicesSampleRates];
      v7 = -[NSDictionary objectForKey:](v8, "objectForKey:", [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:CMSUtility_GetCurrentInputVADID(self)]);
      goto LABEL_14;
    }
    if ([a3 isEqualToString:@"AudioCategory"])
    {
      v7 = [(MXCoreSessionBase *)self audioCategory];
      goto LABEL_14;
    }
    if ([a3 isEqualToString:@"ReporterIDs"])
    {
      CMSUtility_CreateReporterIDIfNeeded(self);
      v7 = [(MXCoreSessionBase *)self reporterIDs];
      goto LABEL_14;
    }
    if ([a3 isEqualToString:@"AudioMode"])
    {
      v7 = [(MXCoreSessionBase *)self audioMode];
      goto LABEL_14;
    }
    if ([a3 isEqualToString:@"AuditToken"])
    {
      memset(v20, 0, 32);
      if (self) {
        [(MXCoreSessionBase *)self auditToken];
      }
      uint64_t v9 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v20 length:32];
      goto LABEL_15;
    }
    if ([a3 isEqualToString:@"ClientName"])
    {
      v7 = [(MXCoreSessionBase *)self clientName];
      goto LABEL_14;
    }
    if ([a3 isEqualToString:@"ClientPID"])
    {
      v7 = [(MXCoreSessionBase *)self clientPID];
      goto LABEL_14;
    }
    if ([a3 isEqualToString:@"ClientPriority"])
    {
      uint64_t v9 = (NSArray *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithInt:0];
      goto LABEL_15;
    }
    if ([a3 isEqualToString:@"AudioSessionID"])
    {
      id v12 = objc_alloc(MEMORY[0x1E4F28ED0]);
      uint64_t DeviceBufferNumPCMFrames = [(MXCoreSessionBase *)self audioSessionID];
LABEL_29:
      uint64_t v9 = (NSArray *)[v12 initWithUnsignedInt:DeviceBufferNumPCMFrames];
      goto LABEL_15;
    }
    if ([a3 isEqualToString:@"CoreSessionID"])
    {
      v7 = [(MXCoreSessionBase *)self ID];
      goto LABEL_14;
    }
    if ([a3 isEqualToString:@"IsActive"])
    {
      uint64_t v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithBool:", -[MXCoreSessionBase isActive](self, "isActive"));
      goto LABEL_15;
    }
    if ([a3 isEqualToString:@"CurrentInputDeviceBufferSize"])
    {
      id v12 = objc_alloc(MEMORY[0x1E4F28ED0]);
      AudioObjectID CurrentInputVADID = CMSUtility_GetCurrentInputVADID(self);
      uint64_t DeviceBufferNumPCMFrames = vaemGetDeviceBufferNumPCMFrames(CurrentInputVADID, 0x696E7074u);
      goto LABEL_29;
    }
    if ([a3 isEqualToString:@"CurrentInputLatency"])
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28ED0]);
      uint64_t v17 = CMSUtility_GetCurrentInputVADID(self);
      *(float *)&double v18 = vaemGetCurrentLatencyForVADIDAndScope(v17, 1);
      uint64_t v9 = (NSArray *)[v16 initWithFloat:v18];
      goto LABEL_15;
    }
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v10 = -12984;
LABEL_34:
    unsigned int v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return v10;
  }
  v7 = [(MXCoreSessionBase *)self audioBehaviour];
LABEL_14:
  uint64_t v9 = v7;
LABEL_15:
  int v10 = 0;
  *a4 = v9;
  return v10;
}

- (int)setPropertyForKey:(id)a3 value:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_52;
  }
  if (![a3 isEqualToString:@"AuditToken"])
  {
    if ([a3 isEqualToString:@"ClientName"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(MXCoreSessionBase *)self updateClientName:a4];
        return 0;
      }
      goto LABEL_52;
    }
    if ([a3 isEqualToString:@"ClientPID"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![a4 unsignedIntValue]) {
        goto LABEL_52;
      }
      if ([(NSNumber *)[(MXCoreSessionBase *)self clientPID] isEqualToNumber:a4]) {
        return 0;
      }
      [(MXCoreSessionBase *)self setClientPID:a4];
      CMSessionMgrCopyDisplayIdentifierToSession(self);
      goto LABEL_42;
    }
    if ([a3 isEqualToString:@"ReporterIDs"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (![(NSArray *)[(MXCoreSessionBase *)self reporterIDs] isEqualToArray:a4])
        {
          [(MXCoreSessionBase *)self setReporterIDs:a4];
          if (dword_1E9359ED0)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          CMSMNotificationUtility_PostReporterIDsDidChange(self);
        }
        return 0;
      }
      goto LABEL_52;
    }
    if ([a3 isEqualToString:@"AudioCategory"])
    {
      unsigned int v11 = [(MXCoreSessionBase *)self audioCategory];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_52;
      }
      [(MXCoreSessionBase *)self setAudioCategory:a4];
      if ([(NSString *)v11 isEqualToString:a4]) {
        return 0;
      }
LABEL_42:
      if (![(MXCoreSessionBase *)self isActive]) {
        return 0;
      }
      int v17 = [+[MXAdditiveRoutingManager sharedInstance] sendActiveSessionsInfoToVA];
      goto LABEL_44;
    }
    if (![a3 isEqualToString:@"AudioMode"])
    {
      if ([a3 isEqualToString:@"AudioSessionID"])
      {
        unsigned int v14 = [(MXCoreSessionBase *)self audioSessionID];
        if (a4)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_52;
          }
          int v15 = [a4 unsignedIntValue];
        }
        else
        {
          int v15 = 0;
        }
        if (v14 == v15) {
          return 0;
        }
        -[MXCoreSessionBase setAudioSessionID:](self, "setAudioSessionID:");
        goto LABEL_42;
      }
      id v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      int v8 = -12984;
LABEL_51:
      double v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return v8;
    }
    id v12 = [(MXCoreSessionBase *)self audioMode];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || [a4 isEqualToString:@"Enrollment"]
      && ![(MXCoreSessionSecure *)self hasEntitlementToSetEnrollmentMode])
    {
      goto LABEL_52;
    }
    [(MXCoreSessionBase *)self setAudioMode:a4];
    if ([(NSString *)v12 isEqualToString:a4] || ![(MXCoreSessionBase *)self isActive]) {
      return 0;
    }
    if ([(NSString *)v12 isEqualToString:@"Enrollment"])
    {
      int v13 = [+[MXSessionManager sharedInstance] updateSecureSpeakerMuteState:0];
    }
    else
    {
      if (![a4 isEqualToString:@"Enrollment"]) {
        goto LABEL_49;
      }
      int v13 = [(MXCoreSessionSecure *)self _beginInterruptionWithSecTask:0 andFlags:2];
    }
    int v8 = v13;
    if (v13)
    {
LABEL_50:
      [(MXCoreSessionBase *)self setAudioMode:v12];
      goto LABEL_51;
    }
LABEL_49:
    int v8 = [+[MXAdditiveRoutingManager sharedInstance] sendActiveSessionsInfoToVA];
    if (!v8) {
      return v8;
    }
    goto LABEL_50;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_52:
    int v17 = FigSignalErrorAt();
LABEL_44:
    int v8 = v17;
    if (!v17) {
      return v8;
    }
    goto LABEL_51;
  }
  *(void *)&long long v7 = -1;
  *((void *)&v7 + 1) = -1;
  long long v19 = v7;
  long long v20 = v7;
  [a4 getBytes:&v19 length:32];
  v21[0] = v19;
  v21[1] = v20;
  [(MXCoreSessionBase *)self setAuditToken:v21];
  [(MXCoreSessionSecure *)self updateEntitlements];
  return 0;
}

- (int)_beginInterruptionWithSecTask:(__SecTask *)a3 andFlags:(unint64_t)a4
{
  long long v7 = +[MXSessionManagerSecure sharedInstance];
  return [(MXSessionManagerSecure *)v7 _beginInterruption:self withSecTask:a3 andFlags:a4];
}

- (int)_endInterruptionWithSecTask:(__SecTask *)a3 andStatus:(id)a4
{
  long long v7 = +[MXSessionManagerSecure sharedInstance];
  return [(MXSessionManagerSecure *)v7 _endInterruption:self withSecTask:a3 andStatus:a4];
}

- (void)updateEntitlements
{
  if (self) {
    [(MXCoreSessionBase *)self auditToken];
  }
  [(MXCoreSessionSecure *)self setHasEntitlementToSetEnrollmentMode:0];
  if ([(MXCoreSessionSecure *)self isolatedAudioUseCaseID] == 1936614497)
  {
    uint64_t v3 = xpc_copy_entitlement_for_token();
    if (v3)
    {
      unint64_t v4 = (void *)v3;
      [(MXCoreSessionSecure *)self setHasEntitlementToSetEnrollmentMode:1];
      xpc_release(v4);
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (id)getIsolatedAudioUseCaseIDAsString
{
  int v3 = [(MXCoreSessionSecure *)self isolatedAudioUseCaseID];
  if (v3 <= 1936290408)
  {
    if (!v3) {
      return @"Unknown";
    }
    if (v3 == 1836346212) {
      return @"MutedTalkerDetection";
    }
  }
  else
  {
    switch(v3)
    {
      case 1986225004:
        return @"VoiceControl";
      case 1936614497:
        return @"SoundAnalysis";
      case 1936290409:
        return @"Siri";
    }
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Unknown [%c%c%c%c]", -[MXCoreSessionSecure isolatedAudioUseCaseID](self, "isolatedAudioUseCaseID") >> 24, (-[MXCoreSessionSecure isolatedAudioUseCaseID](self, "isolatedAudioUseCaseID") >> 16), ((unsigned __int16)-[MXCoreSessionSecure isolatedAudioUseCaseID](self, "isolatedAudioUseCaseID") >> 8), -[MXCoreSessionSecure isolatedAudioUseCaseID](self, "isolatedAudioUseCaseID"));
}

- (BOOL)updateAudioBehaviourFromVARouteConfig:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 objectForKey:0x1EE5EFBC8];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", 0x1EE5EFC08), "count");
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", 0x1EE5EFC28), "count");
  if (v5)
  {
    uint64_t v8 = v7;
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v5, 0);
    int v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", -[MXCoreSessionBase audioBehaviour](self, "audioBehaviour"));
    unsigned int v11 = v10;
    if (v6) {
      [v10 setObject:v9 forKey:@"AudioBehaviour_Source"];
    }
    if (v8)
    {
      [(MXCoreSessionBase *)self setAudioDestinationPriority:v9];
      [v11 setObject:v9 forKey:@"AudioBehaviour_Destination"];
    }
    BOOL v12 = [(NSDictionary *)[(MXCoreSessionBase *)self audioBehaviour] isEqualToDictionary:v11];
    if (!v12)
    {
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[MXCoreSessionBase setAudioBehaviour:](self, "setAudioBehaviour:", v11, v17, v18);
      CMSMNotificationUtility_PostSessionAudioBehaviourDidChange(self);
      CMSMVAUtility_UpdateSessionInfoAndReporterIDsOnVA(self, 0);
    }
    BOOL v15 = !v12;
  }
  else
  {
    unsigned int v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  return v15;
}

- (void)logDebugInfo
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = [(MXCoreSessionSecure *)self copyMXSessionSecureList];
  int v3 = CMSMUtility_CopyPrioritizedListBasedOnPlayingAndActiveState(v2);
  if (dword_1E9359ED0)
  {
    unsigned int v27 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1E9359ED0)
    {
      unsigned int v27 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1E9359ED0)
      {
        unsigned int v27 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (dword_1E9359ED0)
        {
          unsigned int v27 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          if (dword_1E9359ED0)
          {
            unsigned int v27 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            uint64_t v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            if (dword_1E9359ED0)
            {
              unsigned int v27 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
        }
      }
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16, v20, v21);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) logDebugInfo];
      }
      uint64_t v11 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v11);
  }
  if (dword_1E9359ED0)
  {
    unsigned int v27 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unsigned int v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v15 = v27;
    if (os_log_type_enabled(v14, type)) {
      unsigned int v16 = v15;
    }
    else {
      unsigned int v16 = v15 & 0xFFFFFFFE;
    }
    if (v16)
    {
      int v29 = 136315138;
      v30 = "-[MXCoreSessionSecure logDebugInfo]";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1E9359ED0)
    {
      unsigned int v27 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v18 = v27;
      if (os_log_type_enabled(v17, type)) {
        unsigned int v19 = v18;
      }
      else {
        unsigned int v19 = v18 & 0xFFFFFFFE;
      }
      if (v19)
      {
        int v29 = 136315138;
        v30 = "-[MXCoreSessionSecure logDebugInfo]";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (unsigned)isolatedAudioUseCaseID
{
  return self->_isolatedAudioUseCaseID;
}

- (void)setIsolatedAudioUseCaseID:(unsigned int)a3
{
  self->_isolatedAudioUseCaseID = a3;
}

- (BOOL)hasEntitlementToSetEnrollmentMode
{
  return self->_hasEntitlementToSetEnrollmentMode;
}

- (void)setHasEntitlementToSetEnrollmentMode:(BOOL)a3
{
  self->_hasEntitlementToSetEnrollmentMode = a3;
}

@end