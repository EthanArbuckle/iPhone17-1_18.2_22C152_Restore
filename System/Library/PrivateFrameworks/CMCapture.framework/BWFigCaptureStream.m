@interface BWFigCaptureStream
+ (void)initialize;
- (BOOL)calibrationDataSent;
- (BOOL)streaming;
- (BOOL)vibeMitigationEnabled;
- (BOOL)workaroundToTurnTorchOnWhenStreamStartsIfNecessary;
- (BWFigCaptureStream)initWithFigCaptureStream:(OpaqueFigCaptureStream *)a3 deviceID:(id)a4 errOut:(int *)a5;
- (BWFigCaptureStreamStartStopDelegate)startStopDelegate;
- (NSDictionary)supportedProperties;
- (NSString)portType;
- (NSString)uniqueID;
- (OpaqueFigCaptureStream)figCaptureStream;
- (id)copyProperty:(__CFString *)a3 error:(int *)a4;
- (id)copyPropertyIfSupported:(__CFString *)a3 error:(int *)a4;
- (id)debugDescription;
- (id)description;
- (id)getProperty:(__CFString *)a3 error:(int *)a4;
- (id)getPropertyIfSupported:(__CFString *)a3 error:(int *)a4;
- (id)reactionsInProgressChangedHandler;
- (int)addAttachmentsToSampleBuffer:(opaqueCMSampleBuffer *)a3 options:(id)a4;
- (int)enqueueReactionEffect:(id)a3;
- (int)registerForNotification:(__CFString *)a3 listener:(const void *)a4 callback:(void *)a5;
- (int)sendCommandProperty:(__CFString *)a3;
- (int)setProperty:(__CFString *)a3 value:(id)a4;
- (int)setPropertyIfSupported:(__CFString *)a3 value:(id)a4;
- (int)start;
- (int)stop;
- (int)unregisterForNotification:(__CFString *)a3 listener:(const void *)a4;
- (uint64_t)_copyProperty:(int)a3 requireSupported:(int *)a4 error:;
- (uint64_t)_setProperty:(void *)a3 value:(int)a4 requireSupported:(char)a5 lockHeldByCaller:;
- (void)_activateVibeMitigationIfEnabled;
- (void)_resetStreamingState;
- (void)dealloc;
- (void)flushPropertyCache;
- (void)invalidate;
- (void)setCalibrationDataSent:(BOOL)a3;
- (void)setReactionsInProgressChangedHandler:(id)a3;
- (void)setStartStopDelegate:(id)a3;
- (void)setVibeMitigationEnabled:(BOOL)a3;
- (void)setWorkaroundToTurnTorchOnWhenStreamStartsIfNecessary:(BOOL)a3;
- (void)synchronizedStreamsGroupDidStop;
- (void)synchronizedStreamsGroupWillStop;
@end

@implementation BWFigCaptureStream

- (uint64_t)_setProperty:(void *)a3 value:(int)a4 requireSupported:(char)a5 lockHeldByCaller:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E4F54C70]))
  {
    [a3 floatValue];
    *(unsigned char *)(a1 + 107) = v10 == 1.0;
  }
  specific = dispatch_get_specific(@"BWFigCaptureStreamSetPropertySetPropertyAsyncQueue");
  if (specific)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__BWFigCaptureStream__setProperty_value_requireSupported_lockHeldByCaller___block_invoke;
    block[3] = &unk_1E5C284D8;
    block[5] = a3;
    block[6] = cf1;
    block[4] = a1;
    char v26 = a4;
    char v27 = a5;
    dispatch_async(specific, block);
    return 0;
  }
  int v13 = *(_DWORD *)(a1 + 76);
  v14 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (v13)
  {
    unsigned int v15 = v13 & 0xFFFFFFC0 | 8;
    if (*MEMORY[0x1E4F1EBA8]) {
      unsigned int v16 = v15;
    }
    else {
      unsigned int v16 = 0;
    }
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      CFHash(cf1);
      kdebug_trace();
    }
    if ((a5 & 1) == 0) {
      goto LABEL_14;
    }
  }
  else
  {
    unsigned int v16 = 0;
    if ((a5 & 1) == 0) {
LABEL_14:
    }
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 68));
  }
  if (*(unsigned char *)(a1 + 65))
  {
    uint64_t v12 = 4294954511;
    if ((a5 & 1) == 0) {
      goto LABEL_39;
    }
LABEL_36:
    if (v16) {
      goto LABEL_40;
    }
    goto LABEL_42;
  }
  v17 = *(void **)(a1 + 48);
  if (v17 && ![v17 objectForKeyedSubscript:cf1])
  {
    if (a4) {
      uint64_t v12 = 4294954509;
    }
    else {
      uint64_t v12 = 0;
    }
    if (a5) {
      goto LABEL_36;
    }
  }
  else
  {
    if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", cf1), "isEqual:", a3) & 1) == 0)
    {
      uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject(*(void *)(a1 + 8));
      uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v19) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
      v21 = *(uint64_t (**)(uint64_t, CFTypeRef, void *))(v20 + 56);
      if (!v21)
      {
        uint64_t v12 = 4294954514;
        if ((a5 & 1) == 0) {
          goto LABEL_39;
        }
        goto LABEL_36;
      }
      uint64_t v12 = v21(FigBaseObject, cf1, a3);
      if (v12)
      {
        if ((a5 & 1) == 0) {
          goto LABEL_39;
        }
        goto LABEL_36;
      }
      if ([(id)sCacheableProperties containsObject:cf1])
      {
        v24 = (void *)[a3 copy];
        [*(id *)(a1 + 56) setObject:v24 forKeyedSubscript:cf1];
      }
    }
    uint64_t v12 = 0;
    if (a5) {
      goto LABEL_36;
    }
  }
LABEL_39:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 68));
  if (v16)
  {
LABEL_40:
    if (*v14 == 1) {
      kdebug_trace();
    }
  }
LABEL_42:
  if (v12)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[BWFigCaptureStream debugDescription](self, "debugDescription")];
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"%@ FigCaptureStreamRef (%p)", self->_portTypeShortString, self->_stream];
}

- (int)setProperty:(__CFString *)a3 value:(id)a4
{
  return -[BWFigCaptureStream _setProperty:value:requireSupported:lockHeldByCaller:]((uint64_t)self, a3, a4, 1, 0);
}

- (int)setPropertyIfSupported:(__CFString *)a3 value:(id)a4
{
  return -[BWFigCaptureStream _setProperty:value:requireSupported:lockHeldByCaller:]((uint64_t)self, a3, a4, 0, 0);
}

- (NSDictionary)supportedProperties
{
  return self->_supportedProperties;
}

- (id)getProperty:(__CFString *)a3 error:(int *)a4
{
  v4 = (void *)-[BWFigCaptureStream _copyProperty:requireSupported:error:]((uint64_t)self, a3, 1, a4);
  return v4;
}

- (id)getPropertyIfSupported:(__CFString *)a3 error:(int *)a4
{
  v4 = (void *)-[BWFigCaptureStream _copyProperty:requireSupported:error:]((uint64_t)self, a3, 0, a4);
  return v4;
}

- (uint64_t)_copyProperty:(int)a3 requireSupported:(int *)a4 error:
{
  v20[22] = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  v20[0] = 0;
  int v8 = *(_DWORD *)(result + 76);
  v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (v8)
  {
    unsigned int v10 = v8 & 0xFFFFFFC0 | 0xC;
    if (*MEMORY[0x1E4F1EBA8]) {
      unsigned int v11 = v10;
    }
    else {
      unsigned int v11 = 0;
    }
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      CFHash(cf);
      kdebug_trace();
    }
  }
  else
  {
    unsigned int v11 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 68));
  if (*(unsigned char *)(v7 + 65))
  {
    int v12 = -12785;
    goto LABEL_26;
  }
  int v13 = *(void **)(v7 + 48);
  if (v13 && ![v13 objectForKeyedSubscript:cf])
  {
    if (a3) {
      int v12 = -12787;
    }
    else {
      int v12 = 0;
    }
    goto LABEL_26;
  }
  v20[0] = (id)[*(id *)(v7 + 56) objectForKeyedSubscript:cf];
  if (v20[0]) {
    goto LABEL_14;
  }
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject(*(void *)(v7 + 8));
  uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  v17 = *(uint64_t (**)(uint64_t, CFTypeRef, void, void *))(v16 + 48);
  if (v17)
  {
    int v12 = v17(FigBaseObject, cf, *MEMORY[0x1E4F1CF80], v20);
    if (!v12)
    {
      if ([(id)sCacheableProperties containsObject:cf]) {
        [*(id *)(v7 + 56) setObject:v20[0] forKeyedSubscript:cf];
      }
LABEL_14:
      int v12 = 0;
    }
  }
  else
  {
    int v12 = -12782;
  }
LABEL_26:
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 68));
  if (v11 && *v9 == 1) {
    kdebug_trace();
  }
  int v18 = 0;
  if (v12 != -12783 && v12)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v18 = v12;
  }
  if (a4) {
    *a4 = v18;
  }
  return v20[0];
}

- (id)copyPropertyIfSupported:(__CFString *)a3 error:(int *)a4
{
  return (id)-[BWFigCaptureStream _copyProperty:requireSupported:error:]((uint64_t)self, a3, 0, a4);
}

- (void)setStartStopDelegate:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(FigWeakReference *)self->_startStopDelegateWeakReference referencedObject];
  if (!a3 || (v6 ? (BOOL v7 = v6 == a3) : (BOOL v7 = 1), v7))
  {
    if (v6 != a3)
    {

      if (a3) {
        v9 = [[FigWeakReference alloc] initWithReferencedObject:a3];
      }
      else {
        v9 = 0;
      }
      self->_startStopDelegateWeakReference = v9;
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    [NSString stringWithFormat:@"setting delegate to %@ while one is already set %@", a3, v6];
    os_unfair_lock_unlock(p_lock);
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)setReactionsInProgressChangedHandler:(id)a3
{
}

- (NSString)portType
{
  return self->_portType;
}

- (OpaqueFigCaptureStream)figCaptureStream
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated) {
    stream = 0;
  }
  else {
    stream = self->_stream;
  }
  os_unfair_lock_unlock(p_lock);
  return stream;
}

- (BWFigCaptureStream)initWithFigCaptureStream:(OpaqueFigCaptureStream *)a3 deviceID:(id)a4 errOut:(int *)a5
{
  int v8 = self;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  int v43 = 0;
  if (!a3)
  {
    unsigned int v42 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
LABEL_51:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_52;
  }
  v40.receiver = self;
  v40.super_class = (Class)BWFigCaptureStream;
  v9 = [(BWFigCaptureStream *)&v40 init];
  int v8 = v9;
  if (!v9) {
    goto LABEL_52;
  }
  v9->_lock._os_unfair_lock_opaque = 0;
  v9->_cachedProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8->_stream = (OpaqueFigCaptureStream *)CFRetain(a3);
  unsigned int v10 = [(BWFigCaptureStream *)v8 copyProperty:*MEMORY[0x1E4F54B40] error:&v43];
  v8->_portType = v10;
  if (!v43)
  {
    v8->_portTypeShortString = (NSString *)(id)BWPortTypeToDisplayString(v10, v11);
    v8->_loggingPrefix = (NSString *)[[NSString alloc] initWithFormat:@"<%p FigCaptureStreamRef(%p), %@>", v8, v8->_stream, v8->_portTypeShortString];
    if (dword_1EB4C5270)
    {
      unsigned int v42 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      int v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v13 = v42;
      if (os_log_type_enabled(v12, type)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        loggingPrefix = v8->_loggingPrefix;
        int v44 = 136315394;
        v45 = "-[BWFigCaptureStream initWithFigCaptureStream:deviceID:errOut:]";
        __int16 v46 = 2114;
        v47 = (BWFigCaptureStream *)loggingPrefix;
        LODWORD(v39) = 22;
        v38 = &v44;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v8->_supportedProperties = (NSDictionary *)[(BWFigCaptureStream *)v8 copyProperty:@"SupportedPropertiesDictionary", &v43, v38, v39 error];
    if (!v43)
    {
      if ((BWCaptureIsRunningInMacCatalystEnvironment() & 1) == 0
        && (BWCaptureIsRunningInIOSAppOnMacEnvironment() & 1) == 0)
      {
        v8->_staticPropertiesCacheEnabled = [a4 isEqualToString:0x1EFA45440];
      }
      if (v8->_staticPropertiesCacheEnabled)
      {
        os_unfair_lock_lock((os_unfair_lock_t)&sStaticCachedPropertiesByPortTypeLock);
        -[NSMutableDictionary addEntriesFromDictionary:](v8->_cachedProperties, "addEntriesFromDictionary:", [(id)sStaticCachedPropertiesByPortType objectForKeyedSubscript:v8->_portType]);
        os_unfair_lock_unlock((os_unfair_lock_t)&sStaticCachedPropertiesByPortTypeLock);
      }
      uint64_t v16 = *MEMORY[0x1E4F52E00];
      if ([(NSString *)v8->_portType isEqualToString:*MEMORY[0x1E4F52E00]])
      {
        id v17 = (id)[(NSDictionary *)v8->_supportedProperties mutableCopy];
        [v17 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F54C28]];
        [v17 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F54C20]];
        [v17 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F54C18]];

        v8->_supportedProperties = (NSDictionary *)[v17 copy];
      }
      v8->_uniqueID = (NSString *)[(BWFigCaptureStream *)v8 copyPropertyIfSupported:@"UniqueID" error:&v43];
      if (!v43)
      {
        if (*MEMORY[0x1E4F1EBA8])
        {
          portType = v8->_portType;
          int v19 = 822151424;
          if ([(NSString *)portType isEqualToString:*MEMORY[0x1E4F52DF0]])
          {
            int v19 = 822151552;
          }
          else if ([(NSString *)portType isEqualToString:*MEMORY[0x1E4F52DD8]])
          {
            int v19 = 822151488;
          }
          else if (![(NSString *)portType isEqualToString:*MEMORY[0x1E4F52DE8]])
          {
            if ([(NSString *)portType isEqualToString:*MEMORY[0x1E4F52DF8]])
            {
              int v19 = 822151680;
            }
            else if ([(NSString *)portType isEqualToString:*MEMORY[0x1E4F52DE0]])
            {
              int v19 = 822151616;
            }
            else if ([(NSString *)portType isEqualToString:v16])
            {
              int v19 = 822151744;
            }
            else if ([(NSString *)portType isEqualToString:*MEMORY[0x1E4F52E10]])
            {
              int v19 = 822152064;
            }
            else
            {
              int v19 = 0;
            }
          }
        }
        else
        {
          int v19 = 0;
        }
        v8->_ktraceCodePrefix = v19;
        [(BWFigCaptureStream *)v8 registerForNotification:@"StreamControlTakenByAnotherClient" listener:v8 callback:fcs_handleStreamControlTakenByAnotherClientNotification];
        [(BWFigCaptureStream *)v8 registerForNotification:@"StreamControlRelinquishedByAnotherClient" listener:v8 callback:fcs_handleStreamControlRelinquishedByAnotherClientNotification];
        [(BWFigCaptureStream *)v8 registerForNotification:*MEMORY[0x1E4F54420] listener:v8 callback:fcs_handleFrameReceiveTimeout];
        [(BWFigCaptureStream *)v8 registerForNotification:*MEMORY[0x1E4F54438] listener:v8 callback:fcs_reactionsInProgressChanged];
        v8->_vibeMitigationWhileCameraStreamingSupported = 0;
        int v43 = [(BWFigCaptureStream *)v8 setPropertyIfSupported:*MEMORY[0x1E4F54CA8] value:MEMORY[0x1E4F1CC28]];
        if (v43)
        {
          unsigned int v42 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v21 = v42;
          if (os_log_type_enabled(v20, type)) {
            unsigned int v22 = v21;
          }
          else {
            unsigned int v22 = v21 & 0xFFFFFFFE;
          }
          if (v22)
          {
            v23 = v8->_loggingPrefix;
            int v44 = 136315650;
            v45 = "-[BWFigCaptureStream initWithFigCaptureStream:deviceID:errOut:]";
            __int16 v46 = 2114;
            v47 = (BWFigCaptureStream *)v23;
            __int16 v48 = 1024;
            LODWORD(v49) = v43;
            _os_log_send_and_compose_impl();
          }
        }
        else
        {
          if (!dword_1EB4C5270)
          {
            *a5 = 0;
            return v8;
          }
          unsigned int v42 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v25 = v42;
          if (os_log_type_enabled(v24, type)) {
            unsigned int v26 = v25;
          }
          else {
            unsigned int v26 = v25 & 0xFFFFFFFE;
          }
          if (v26)
          {
            char v27 = v8->_loggingPrefix;
            int v44 = 136315394;
            v45 = "-[BWFigCaptureStream initWithFigCaptureStream:deviceID:errOut:]";
            __int16 v46 = 2114;
            v47 = (BWFigCaptureStream *)v27;
            _os_log_send_and_compose_impl();
          }
        }
        goto LABEL_51;
      }
    }
  }
  FigDebugAssert3();
LABEL_52:
  int v29 = v43;
  *a5 = v43;
  if (v29)
  {
    if (v8->_loggingPrefix)
    {
      unsigned int v42 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v31 = v42;
      if (os_log_type_enabled(v30, type)) {
        unsigned int v32 = v31;
      }
      else {
        unsigned int v32 = v31 & 0xFFFFFFFE;
      }
      if (!v32) {
        goto LABEL_65;
      }
      v33 = v8->_loggingPrefix;
      int v44 = 136316162;
      v45 = "-[BWFigCaptureStream initWithFigCaptureStream:deviceID:errOut:]";
      __int16 v46 = 2114;
      v47 = (BWFigCaptureStream *)v33;
      __int16 v48 = 2048;
      v49 = a3;
      __int16 v50 = 2114;
      id v51 = a4;
      __int16 v52 = 1024;
      int v53 = v43;
    }
    else
    {
      unsigned int v42 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v35 = v42;
      if (os_log_type_enabled(v34, type)) {
        unsigned int v36 = v35;
      }
      else {
        unsigned int v36 = v35 & 0xFFFFFFFE;
      }
      if (!v36) {
        goto LABEL_65;
      }
      int v44 = 136316162;
      v45 = "-[BWFigCaptureStream initWithFigCaptureStream:deviceID:errOut:]";
      __int16 v46 = 2048;
      v47 = v8;
      __int16 v48 = 2048;
      v49 = a3;
      __int16 v50 = 2114;
      id v51 = a4;
      __int16 v52 = 1024;
      int v53 = v43;
    }
    _os_log_send_and_compose_impl();
LABEL_65:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return 0;
  }
  return v8;
}

- (int)registerForNotification:(__CFString *)a3 listener:(const void *)a4 callback:(void *)a5
{
  FigCaptureDeviceGetNotificationCenter(self, a2);
  return FigNotificationCenterAddWeakListener();
}

- (id)copyProperty:(__CFString *)a3 error:(int *)a4
{
  return (id)-[BWFigCaptureStream _copyProperty:requireSupported:error:]((uint64_t)self, a3, 1, a4);
}

- (int)addAttachmentsToSampleBuffer:(opaqueCMSampleBuffer *)a3 options:(id)a4
{
  unsigned int ktraceCodePrefix = self->_ktraceCodePrefix;
  int v8 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (ktraceCodePrefix)
  {
    unsigned int v9 = ktraceCodePrefix & 0xFFFFFFC0 | 0x10;
    if (*MEMORY[0x1E4F1EBA8]) {
      unsigned int v10 = v9;
    }
    else {
      unsigned int v10 = 0;
    }
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
  }
  else
  {
    unsigned int v10 = 0;
  }
  if (self->_invalidated)
  {
    int v11 = -12785;
  }
  else
  {
    stream = self->_stream;
    unsigned int v13 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v13) {
      unsigned int v14 = v13;
    }
    else {
      unsigned int v14 = 0;
    }
    if (*v14 >= 2uLL
      && (uint64_t v15 = (uint64_t (*)(OpaqueFigCaptureStream *, opaqueCMSampleBuffer *, id))v14[3]) != 0)
    {
      int v11 = v15(stream, a3, a4);
    }
    else
    {
      int v11 = -12782;
    }
  }
  if (v10 && *v8 == 1) {
    kdebug_trace();
  }
  return v11;
}

- (BOOL)streaming
{
  return self->_streaming;
}

- (int)start
{
  unsigned int ktraceCodePrefix = self->_ktraceCodePrefix;
  v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (ktraceCodePrefix)
  {
    unsigned int v5 = ktraceCodePrefix & 0xFFFFFFC0;
    if (*MEMORY[0x1E4F1EBA8]) {
      unsigned int v6 = v5;
    }
    else {
      unsigned int v6 = 0;
    }
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
  }
  else
  {
    unsigned int v6 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    id v7 = 0;
    int v8 = 0;
    int v9 = -12785;
  }
  else if (self->_streaming)
  {
    id v7 = 0;
    int v8 = 0;
    int v9 = -12780;
  }
  else
  {
    if (dword_1EB4C5270)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    stream = self->_stream;
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    unsigned int v14 = *(uint64_t (**)(OpaqueFigCaptureStream *))(v13 + 8);
    if (v14)
    {
      int v9 = v14(stream);
      if (v9)
      {
        id v7 = 0;
        int v8 = 0;
      }
      else
      {
        int v8 = 1;
        self->_streaming = 1;
        id v7 = [(FigWeakReference *)self->_startStopDelegateWeakReference retainReferencedObject];
      }
    }
    else
    {
      id v7 = 0;
      int v8 = 0;
      int v9 = -12782;
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v6 && *v4 == 1) {
    kdebug_trace();
  }
  if (v9)
  {
    uint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    os_unfair_lock_lock(&self->_lock);
    -[BWFigCaptureStream _activateVibeMitigationIfEnabled]((uint64_t)self);
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_28;
  }
  if (!dword_1EB4C5270)
  {
LABEL_28:
    if (!v8) {
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  uint64_t v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if (v8)
  {
LABEL_29:
    if (v7)
    {
      [v7 captureStreamDidStart];
    }
    else
    {
      id v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
LABEL_33:

  if (self->_workaroundToTurnTorchOnWhenStreamStartsIfNecessary)
  {
    if (self->_workaroundShouldTurnOnTorchWhenNextStreamStarts)
    {
      uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject(self->_stream);
      uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v19) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
      unsigned int v21 = *(void (**)(uint64_t, void, void *))(v20 + 56);
      if (v21) {
        v21(FigBaseObject, *MEMORY[0x1E4F54C70], &unk_1EFB04F48);
      }
      self->_workaroundShouldTurnOnTorchWhenNextStreamStarts = 0;
    }
    self->_workaroundToTurnTorchOnWhenStreamStartsIfNecessary = 0;
  }
  return v9;
}

- (void)setCalibrationDataSent:(BOOL)a3
{
  self->_calibrationDataSent = a3;
}

- (BOOL)calibrationDataSent
{
  return self->_calibrationDataSent;
}

- (void)flushPropertyCache
{
  unsigned int ktraceCodePrefix = self->_ktraceCodePrefix;
  v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (ktraceCodePrefix)
  {
    unsigned int v5 = ktraceCodePrefix & 0xFFFFFFC0 | 0x14;
    if (*MEMORY[0x1E4F1EBA8]) {
      unsigned int v6 = v5;
    }
    else {
      unsigned int v6 = 0;
    }
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
  }
  else
  {
    unsigned int v6 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_cachedProperties removeObjectsForKeys:sDynamicCacheableProperties];
  os_unfair_lock_unlock(&self->_lock);
  if (v6 && *v4 == 1)
  {
    kdebug_trace();
  }
}

uint64_t __75__BWFigCaptureStream__setProperty_value_requireSupported_lockHeldByCaller___block_invoke(uint64_t a1)
{
  return -[BWFigCaptureStream _setProperty:value:requireSupported:lockHeldByCaller:](*(void *)(a1 + 32), *(CFTypeRef *)(a1 + 48));
}

+ (void)initialize
{
  v39[27] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    uint64_t v2 = *MEMORY[0x1E4F54930];
    v39[0] = *MEMORY[0x1E4F54AE8];
    v39[1] = v2;
    uint64_t v3 = *MEMORY[0x1E4F54B38];
    v39[2] = *MEMORY[0x1E4F54A18];
    v39[3] = v3;
    uint64_t v4 = *MEMORY[0x1E4F54990];
    v39[4] = *MEMORY[0x1E4F54960];
    v39[5] = v4;
    uint64_t v5 = *MEMORY[0x1E4F54BF8];
    v39[6] = @"SupportedFormatsArray";
    v39[7] = v5;
    uint64_t v6 = *MEMORY[0x1E4F54CB0];
    v39[8] = *MEMORY[0x1E4F54BB0];
    v39[9] = v6;
    uint64_t v7 = *MEMORY[0x1E4F54B70];
    v39[10] = *MEMORY[0x1E4F54978];
    v39[11] = v7;
    uint64_t v8 = *MEMORY[0x1E4F548C0];
    v39[12] = *MEMORY[0x1E4F54B78];
    v39[13] = v8;
    uint64_t v9 = *MEMORY[0x1E4F54828];
    v39[14] = *MEMORY[0x1E4F54968];
    v39[15] = v9;
    uint64_t v10 = *MEMORY[0x1E4F54808];
    v39[16] = *MEMORY[0x1E4F54810];
    v39[17] = v10;
    uint64_t v11 = *MEMORY[0x1E4F54790];
    v39[18] = *MEMORY[0x1E4F54900];
    v39[19] = v11;
    uint64_t v12 = *MEMORY[0x1E4F549E8];
    v39[20] = *MEMORY[0x1E4F549E0];
    v39[21] = v12;
    uint64_t v13 = *MEMORY[0x1E4F54888];
    v39[22] = *MEMORY[0x1E4F54950];
    v39[23] = v13;
    uint64_t v14 = *MEMORY[0x1E4F54C20];
    v39[24] = *MEMORY[0x1E4F54890];
    v39[25] = v14;
    v39[26] = *MEMORY[0x1E4F54C00];
    sStaticCacheableProperties = (uint64_t)(id)[MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:27];
    uint64_t v15 = *MEMORY[0x1E4F54928];
    v38[0] = *MEMORY[0x1E4F54AB0];
    v38[1] = v15;
    uint64_t v16 = *MEMORY[0x1E4F54998];
    v38[2] = *MEMORY[0x1E4F54C70];
    v38[3] = v16;
    uint64_t v17 = *MEMORY[0x1E4F549A0];
    v38[4] = *MEMORY[0x1E4F54858];
    v38[5] = v17;
    uint64_t v18 = *MEMORY[0x1E4F549C0];
    v38[6] = *MEMORY[0x1E4F54AF0];
    v38[7] = v18;
    uint64_t v19 = *MEMORY[0x1E4F549B8];
    v38[8] = *MEMORY[0x1E4F549B0];
    v38[9] = v19;
    uint64_t v20 = *MEMORY[0x1E4F54C28];
    v38[10] = *MEMORY[0x1E4F54830];
    v38[11] = v20;
    uint64_t v21 = *MEMORY[0x1E4F54BC8];
    v38[12] = *MEMORY[0x1E4F54838];
    v38[13] = v21;
    uint64_t v22 = *MEMORY[0x1E4F54B48];
    v38[14] = *MEMORY[0x1E4F54BD0];
    v38[15] = v22;
    uint64_t v23 = *MEMORY[0x1E4F54BD8];
    v38[16] = *MEMORY[0x1E4F54B68];
    v38[17] = v23;
    uint64_t v24 = *MEMORY[0x1E4F549D8];
    v38[18] = *MEMORY[0x1E4F549D0];
    v38[19] = v24;
    uint64_t v25 = *MEMORY[0x1E4F54B50];
    v38[20] = *MEMORY[0x1E4F548D0];
    v38[21] = v25;
    uint64_t v26 = *MEMORY[0x1E4F54750];
    v38[22] = *MEMORY[0x1E4F54728];
    v38[23] = v26;
    uint64_t v27 = *MEMORY[0x1E4F54918];
    v38[24] = *MEMORY[0x1E4F54B08];
    v38[25] = v27;
    uint64_t v28 = *MEMORY[0x1E4F54A70];
    v38[26] = *MEMORY[0x1E4F54938];
    v38[27] = v28;
    uint64_t v29 = *MEMORY[0x1E4F54A30];
    v38[28] = *MEMORY[0x1E4F54A38];
    v38[29] = v29;
    v38[30] = *MEMORY[0x1E4F548E8];
    v38[31] = @"DeferAdditionOfAttachments";
    uint64_t v30 = *MEMORY[0x1E4F547E8];
    v38[32] = *MEMORY[0x1E4F54850];
    v38[33] = v30;
    uint64_t v31 = *MEMORY[0x1E4F54D10];
    v38[34] = *MEMORY[0x1E4F547E0];
    v38[35] = v31;
    uint64_t v32 = *MEMORY[0x1E4F54898];
    v38[36] = *MEMORY[0x1E4F549F8];
    v38[37] = v32;
    uint64_t v33 = *MEMORY[0x1E4F548A0];
    v38[38] = *MEMORY[0x1E4F54A08];
    v38[39] = v33;
    uint64_t v34 = *MEMORY[0x1E4F54880];
    v38[40] = *MEMORY[0x1E4F54878];
    v38[41] = v34;
    uint64_t v35 = *MEMORY[0x1E4F54970];
    v38[42] = *MEMORY[0x1E4F54A80];
    v38[43] = v35;
    uint64_t v36 = *MEMORY[0x1E4F54910];
    v38[44] = *MEMORY[0x1E4F54B40];
    v38[45] = v36;
    uint64_t v37 = *MEMORY[0x1E4F54B18];
    v38[46] = *MEMORY[0x1E4F54908];
    v38[47] = v37;
    v38[48] = *MEMORY[0x1E4F54820];
    sDynamicCacheableProperties = (uint64_t)(id)[MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:49];
    sCacheableProperties = (uint64_t)(id)[(id)sDynamicCacheableProperties arrayByAddingObjectsFromArray:sStaticCacheableProperties];
    sStaticCachedPropertiesByPortTypeLock = 0;
    sStaticCachedPropertiesByPortType = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5270)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  [(BWFigCaptureStream *)self unregisterForNotification:@"StreamControlTakenByAnotherClient", self, v12, v13 listener];
  [(BWFigCaptureStream *)self unregisterForNotification:@"StreamControlRelinquishedByAnotherClient" listener:self];
  [(BWFigCaptureStream *)self unregisterForNotification:*MEMORY[0x1E4F54420] listener:self];
  [(BWFigCaptureStream *)self unregisterForNotification:*MEMORY[0x1E4F54438] listener:self];

  stream = self->_stream;
  if (stream) {
    CFRelease(stream);
  }
  if (self->_staticPropertiesCacheEnabled)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)sStaticCacheableProperties, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = (void *)sStaticCacheableProperties;
    uint64_t v7 = [(id)sStaticCacheableProperties countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v5, "setObject:forKeyedSubscript:", -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedProperties, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i)), *(void *)(*((void *)&v15 + 1) + 8 * i));
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v8);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&sStaticCachedPropertiesByPortTypeLock);
    id v11 = (id)[v5 copy];
    [(id)sStaticCachedPropertiesByPortType setObject:v11 forKeyedSubscript:self->_portType];
    os_unfair_lock_unlock((os_unfair_lock_t)&sStaticCachedPropertiesByPortTypeLock);
  }

  _Block_release(self->_reactionsInProgressChangedHandler);
  v14.receiver = self;
  v14.super_class = (Class)BWFigCaptureStream;
  [(BWFigCaptureStream *)&v14 dealloc];
}

- (BWFigCaptureStreamStartStopDelegate)startStopDelegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(FigWeakReference *)self->_startStopDelegateWeakReference referencedObject];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int)unregisterForNotification:(__CFString *)a3 listener:(const void *)a4
{
  FigCaptureDeviceGetNotificationCenter(self, a2);
  return FigNotificationCenterRemoveWeakListener();
}

- (void)_activateVibeMitigationIfEnabled
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 68));
    if (*(unsigned char *)(a1 + 105))
    {
      if (*(unsigned char *)(a1 + 104) && *(unsigned char *)(a1 + 72))
      {
        if (!dword_1EB4C5270) {
          return;
        }
      }
      else
      {
        if (-[BWFigCaptureStream _setProperty:value:requireSupported:lockHeldByCaller:](a1, (CFTypeRef)*MEMORY[0x1E4F54CA8], (void *)[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 104) != 0], 0, 1))
        {
          FigDebugAssert3();
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
LABEL_11:
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          return;
        }
        if (!dword_1EB4C5270) {
          return;
        }
      }
      uint64_t v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      goto LABEL_11;
    }
  }
}

- (int)stop
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int ktraceCodePrefix = self->_ktraceCodePrefix;
  uint64_t v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (ktraceCodePrefix)
  {
    unsigned int v5 = ktraceCodePrefix & 0xFFFFFFC0 | 4;
    if (*MEMORY[0x1E4F1EBA8]) {
      unsigned int v6 = v5;
    }
    else {
      unsigned int v6 = 0;
    }
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
  }
  else
  {
    unsigned int v6 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    id v7 = 0;
    int v8 = 0;
    int v9 = -12785;
  }
  else if (self->_streaming)
  {
    if (dword_1EB4C5270)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    stream = self->_stream;
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    objc_super v14 = *(uint64_t (**)(OpaqueFigCaptureStream *))(v13 + 16);
    if (v14) {
      int v9 = v14(stream);
    }
    else {
      int v9 = -12782;
    }
    self->_streaming = 0;
    id v7 = [(FigWeakReference *)self->_startStopDelegateWeakReference retainReferencedObject];
    int v8 = 1;
  }
  else
  {
    id v7 = 0;
    int v8 = 0;
    int v9 = -12780;
  }
  -[BWFigCaptureStream _activateVibeMitigationIfEnabled]((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
  if (v6 && *v4 == 1) {
    kdebug_trace();
  }
  if (v9 || dword_1EB4C5270)
  {
    long long v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v8)
  {
    if (v7)
    {
      [v7 captureStreamDidStop];
    }
    else
    {
      long long v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }

  return v9;
}

- (void)_resetStreamingState
{
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 68);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 68));
    int v3 = *(unsigned __int8 *)(a1 + 72);
    if (*(unsigned char *)(a1 + 72)) {
      uint64_t v4 = (void *)[*(id *)(a1 + 88) retainReferencedObject];
    }
    else {
      uint64_t v4 = 0;
    }
    *(unsigned char *)(a1 + 72) = 0;
    -[BWFigCaptureStream _activateVibeMitigationIfEnabled](a1);
    os_unfair_lock_unlock(v2);
    if (v3)
    {
      if (v4)
      {
        [v4 captureStreamDidStop];
      }
      else
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
}

- (int)sendCommandProperty:(__CFString *)a3
{
  return [(BWFigCaptureStream *)self setProperty:a3 value:0];
}

- (int)enqueueReactionEffect:(id)a3
{
  stream = self->_stream;
  unsigned int v5 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = 0;
  }
  if (*v6 < 3uLL) {
    return -12782;
  }
  id v7 = (uint64_t (*)(OpaqueFigCaptureStream *, id))v6[4];
  if (!v7) {
    return -12782;
  }
  return v7(stream, a3);
}

- (void)setVibeMitigationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_vibeMitigationEnabled != v3)
  {
    self->_vibeMitigationEnabled = v3;
    -[BWFigCaptureStream _activateVibeMitigationIfEnabled]((uint64_t)self);
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)vibeMitigationEnabled
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_vibeMitigationEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  unsigned int ktraceCodePrefix = self->_ktraceCodePrefix;
  uint64_t v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (ktraceCodePrefix)
  {
    unsigned int v5 = ktraceCodePrefix & 0xFFFFFFC0 | 0x18;
    if (*MEMORY[0x1E4F1EBA8]) {
      unsigned int v6 = v5;
    }
    else {
      unsigned int v6 = 0;
    }
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
  }
  else
  {
    unsigned int v6 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    if (dword_1EB4C5270)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (self->_streaming)
    {
      stream = self->_stream;
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = *(void (**)(OpaqueFigCaptureStream *))(v10 + 16);
      if (v11) {
        v11(stream);
      }
      self->_streaming = 0;
    }
    self->_invalidated = 1;
  }
  -[BWFigCaptureStream _activateVibeMitigationIfEnabled]((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    if (*v4 == 1) {
      kdebug_trace();
    }
  }
}

- (void)synchronizedStreamsGroupWillStop
{
}

- (void)synchronizedStreamsGroupDidStop
{
  BOOL streaming = self->_streaming;
  if (self->_streaming) {
    id v4 = [(FigWeakReference *)self->_startStopDelegateWeakReference retainReferencedObject];
  }
  else {
    id v4 = 0;
  }
  self->_BOOL streaming = 0;
  -[BWFigCaptureStream _activateVibeMitigationIfEnabled]((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
  if (streaming)
  {
    if (v4)
    {
      [v4 captureStreamDidStop];
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (BOOL)workaroundToTurnTorchOnWhenStreamStartsIfNecessary
{
  return self->_workaroundToTurnTorchOnWhenStreamStartsIfNecessary;
}

- (void)setWorkaroundToTurnTorchOnWhenStreamStartsIfNecessary:(BOOL)a3
{
  self->_workaroundToTurnTorchOnWhenStreamStartsIfNecessary = a3;
}

- (id)reactionsInProgressChangedHandler
{
  return self->_reactionsInProgressChangedHandler;
}

@end