@interface BWFigCaptureDevice
+ (void)initialize;
- (BOOL)invalidated;
- (BWFigCaptureDevice)initWithFigCaptureDevice:(OpaqueFigCaptureDevice *)a3 deviceID:(id)a4;
- (NSArray)streams;
- (NSArray)synchronizedStreamsGroups;
- (NSDictionary)supportedProperties;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)deviceID;
- (OpaqueFigCaptureDevice)figCaptureDevice;
- (id)copyISPProcessingSessionWithType:(int)a3 error:(int *)a4;
- (id)copyProperty:(__CFString *)a3 error:(int *)a4;
- (id)copyPropertyIfSupported:(__CFString *)a3 error:(int *)a4;
- (id)copyStreamForFigCaptureStream:(OpaqueFigCaptureStream *)a3 error:(int *)a4;
- (id)copyStreamWithPortType:(__CFString *)a3 error:(int *)a4;
- (id)copyStreamsWithPortTypes:(id)a3 error:(int *)a4;
- (id)copySyncGroupForFigCaptureSynchronizedStreamsGroup:(OpaqueFigCaptureSynchronizedStreamsGroup *)a3 error:(int *)a4;
- (id)copySynchronizedStreamsGroupForStreams:(id)a3 error:(int *)a4;
- (id)getProperty:(__CFString *)a3 error:(int *)a4;
- (id)getPropertyIfSupported:(__CFString *)a3 error:(int *)a4;
- (int)enqueueReactionEffect:(id)a3;
- (int)registerForNotification:(__CFString *)a3 listener:(const void *)a4 callback:(void *)a5;
- (int)relinquishControlOfStreams:(id)a3;
- (int)requestControlOfStreams:(id)a3 clientPriority:(int)a4;
- (int)setProperty:(__CFString *)a3 value:(id)a4;
- (int)setPropertyIfSupported:(__CFString *)a3 value:(id)a4;
- (int)unregisterForNotification:(__CFString *)a3 listener:(const void *)a4;
- (int64_t)uniqueID;
- (uint64_t)_copyProperty:(int)a3 requireSupported:(int *)a4 error:;
- (uint64_t)_setProperty:(uint64_t)a3 value:(int)a4 requireSupported:;
- (void)dealloc;
- (void)invalidate;
- (void)processingSessionHasBeenInvalidated:(id)a3;
- (void)resetSynchronizedStreamsGroups;
@end

@implementation BWFigCaptureDevice

- (int)requestControlOfStreams:(id)a3 clientPriority:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "figCaptureStream"));
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v9);
  }
  unsigned int ktraceCodePrefix = self->_ktraceCodePrefix;
  v13 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (ktraceCodePrefix)
  {
    unsigned int v14 = ktraceCodePrefix & 0xFFFFFFC0;
    if (*MEMORY[0x1E4F1EBA8]) {
      unsigned int v15 = v14;
    }
    else {
      unsigned int v15 = 0;
    }
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
  }
  else
  {
    unsigned int v15 = 0;
  }
  if ((int)FigCapturePlatformIdentifier() < 10)
  {
    uint64_t v17 = 0;
  }
  else
  {
    v56[0] = @"ClientPriority";
    uint64_t v16 = [NSNumber numberWithInt:v4];
    v56[1] = @"DefaultFormatIndexDisabled";
    v57[0] = v16;
    v57[1] = MEMORY[0x1E4F1CC38];
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
  }
  if (dword_1EB4C4F90)
  {
    unsigned int v44 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    int v19 = -12785;
  }
  else
  {
    device = self->_device;
    v21 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v21) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
    if (*v22 >= 2uLL && (v23 = (uint64_t (*)(OpaqueFigCaptureDevice *, void *, uint64_t))v22[2]) != 0) {
      int v19 = v23(device, v7, v17);
    }
    else {
      int v19 = -12782;
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v15 && *v13 == 1) {
    kdebug_trace();
  }

  if (v19 == -12782) {
    int v24 = 0;
  }
  else {
    int v24 = v19;
  }
  if (v24)
  {
    unsigned int v44 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
LABEL_50:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return v24;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v26 = [a3 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v40;
    uint64_t v29 = *MEMORY[0x1E4F54B00];
    uint64_t v30 = MEMORY[0x1E4F1CC38];
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * j), "setProperty:value:", v29, v30, v37, v38);
      }
      uint64_t v27 = [a3 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v27);
  }
  if (dword_1EB4C4F90)
  {
    unsigned int v44 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v33 = v44;
    if (os_log_type_enabled(v32, type)) {
      unsigned int v34 = v33;
    }
    else {
      unsigned int v34 = v33 & 0xFFFFFFFE;
    }
    if (v34)
    {
      loggingPrefix = self->_loggingPrefix;
      int v50 = 136315650;
      v51 = "-[BWFigCaptureDevice requestControlOfStreams:clientPriority:]";
      __int16 v52 = 2114;
      v53 = loggingPrefix;
      __int16 v54 = 2114;
      id v55 = a3;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_50;
  }
  return v24;
}

- (NSDictionary)supportedProperties
{
  return self->_supportedProperties;
}

- (NSArray)streams
{
  return self->_streams;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[BWFigCaptureDevice debugDescription](self, "debugDescription")];
}

- (NSString)debugDescription
{
  return (NSString *)[NSString stringWithFormat:@"FigCaptureDeviceRef (%p) %ld %@", self->_device, self->_uniqueID, self->_deviceID];
}

- (id)copySynchronizedStreamsGroupForStreams:(id)a3 error:(int *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 firstObject];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  synchronizedStreamsGroups = self->_synchronizedStreamsGroups;
  uint64_t v8 = [(NSArray *)synchronizedStreamsGroups countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v8)
  {
LABEL_13:
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v12 = 0;
    int v13 = -12784;
    if (!a4) {
      return v12;
    }
LABEL_14:
    *a4 = v13;
    return v12;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v17;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v17 != v10) {
      objc_enumerationMutation(synchronizedStreamsGroups);
    }
    v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
    if (objc_msgSend((id)objc_msgSend(v12, "streams"), "containsObject:", v6)) {
      break;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = [(NSArray *)synchronizedStreamsGroups countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        goto LABEL_3;
      }
      goto LABEL_13;
    }
  }
  if (!v12) {
    goto LABEL_13;
  }
  int v13 = 0;
  if (a4) {
    goto LABEL_14;
  }
  return v12;
}

- (int)registerForNotification:(__CFString *)a3 listener:(const void *)a4 callback:(void *)a5
{
  FigCaptureDeviceGetNotificationCenter(self, a2);
  return FigNotificationCenterAddWeakListener();
}

- (BWFigCaptureDevice)initWithFigCaptureDevice:(OpaqueFigCaptureDevice *)a3 deviceID:(id)a4
{
  uint64_t v4 = self;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  int v69 = 0;
  if (a3)
  {
    v66.receiver = self;
    v66.super_class = (Class)BWFigCaptureDevice;
    v7 = [(BWFigCaptureDevice *)&v66 init];
    uint64_t v4 = v7;
    if (v7)
    {
      v7->_lock._os_unfair_lock_opaque = 0;
      uint64_t v8 = (OpaqueFigCaptureDevice *)CFRetain(a3);
      uint64_t v9 = sNextUniqueID++;
      v4->_device = v8;
      v4->_uniqueID = v9;
      v4->_deviceID = (NSString *)[a4 copy];
      v4->_loggingPrefix = (NSString *)[[NSString alloc] initWithFormat:@"<%p FigCaptureDeviceRef(%p), %ld, %@>", v4, a3, v4->_uniqueID, v4->_deviceID];
      if (dword_1EB4C4F90)
      {
        unsigned int v68 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v11 = v68;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
          unsigned int v12 = v11;
        }
        else {
          unsigned int v12 = v11 & 0xFFFFFFFE;
        }
        if (v12)
        {
          loggingPrefix = v4->_loggingPrefix;
          int v71 = 136315394;
          v72 = "-[BWFigCaptureDevice initWithFigCaptureDevice:deviceID:]";
          __int16 v73 = 2114;
          v74 = loggingPrefix;
          LODWORD(v46) = 22;
          unsigned int v44 = &v71;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v4->_supportedProperties = (NSDictionary *)[(BWFigCaptureDevice *)v4 copyProperty:@"SupportedPropertiesDictionary", &v69, v44, v46 error];
      if (!v69)
      {
        id v14 = [(BWFigCaptureDevice *)v4 copyProperty:@"StreamArray" error:&v69];
        if (v69) {
          goto LABEL_71;
        }
        unsigned int v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
        long long v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v14, "count"));
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        BOOL v52 = 0;
        if (FigCaptureExternalCameraReplacesBuiltIn(&type)) {
          BOOL v52 = [(NSString *)v4->_deviceID isEqualToString:@"Default"];
        }
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        uint64_t v17 = [v14 countByEnumeratingWithState:&v62 objects:v77 count:16];
        if (!v17)
        {
LABEL_43:
          unsigned int v68 = 0;
          os_log_type_t v61 = OS_LOG_TYPE_DEFAULT;
          uint64_t v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v28 = v68;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v29 = v28;
          }
          else {
            unsigned int v29 = v28 & 0xFFFFFFFE;
          }
          if (v29)
          {
            uint64_t v30 = v4->_loggingPrefix;
            int v71 = 136315650;
            v72 = "-[BWFigCaptureDevice initWithFigCaptureDevice:deviceID:]";
            __int16 v73 = 2114;
            v74 = v30;
            __int16 v75 = 2114;
            v76 = v15;
            LODWORD(v47) = 32;
            long long v45 = &v71;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          goto LABEL_49;
        }
        uint64_t v18 = v17;
        char v55 = 0;
        uint64_t v19 = *(void *)v63;
        uint64_t v56 = *MEMORY[0x1E4F52DF8];
        uint64_t v53 = *MEMORY[0x1E4F52E10];
        uint64_t v51 = *MEMORY[0x1E4F52DD8];
        uint64_t v50 = *MEMORY[0x1E4F52DF0];
        uint64_t v49 = *MEMORY[0x1E4F52DE8];
        uint64_t v48 = *MEMORY[0x1E4F52DE0];
        while (1)
        {
          uint64_t v20 = 0;
          uint64_t v54 = v18;
          do
          {
            if (*(void *)v63 != v19) {
              objc_enumerationMutation(v14);
            }
            uint64_t v21 = [[BWFigCaptureStream alloc] initWithFigCaptureStream:*(void *)(*((void *)&v62 + 1) + 8 * v20) deviceID:a4 errOut:&v69];
            if (v21)
            {
              v22 = v21;
              [v15 addObject:v21];
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, -[BWFigCaptureStream portType](v22, "portType"));
              if ([(NSString *)[(BWFigCaptureStream *)v22 portType] isEqualToString:v56]|| [(NSString *)[(BWFigCaptureStream *)v22 portType] isEqualToString:v53])
              {
                if (type)
                {
                  [v15 removeObject:v22];
                  objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, -[BWFigCaptureStream portType](v22, "portType"));

                  char v55 = 1;
                  goto LABEL_40;
                }
                char v55 = 1;
                goto LABEL_39;
              }
              if ([(NSString *)[(BWFigCaptureStream *)v22 portType] isEqualToString:v51]|| [(NSString *)[(BWFigCaptureStream *)v22 portType] isEqualToString:v50]|| [(NSString *)[(BWFigCaptureStream *)v22 portType] isEqualToString:v49])
              {
                if (v52)
                {
LABEL_34:
                  if (type == OS_LOG_TYPE_DEFAULT)
                  {
                    [v15 removeObject:v22];
                    objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, -[BWFigCaptureStream portType](v22, "portType"));
                  }
                }
              }
              else if ([(NSString *)[(BWFigCaptureStream *)v22 portType] isEqualToString:v48]&& v52)
              {
                goto LABEL_34;
              }
LABEL_39:

              goto LABEL_40;
            }
            unsigned int v68 = 0;
            os_log_type_t v61 = OS_LOG_TYPE_DEFAULT;
            v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v24 = v68;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
              unsigned int v25 = v24;
            }
            else {
              unsigned int v25 = v24 & 0xFFFFFFFE;
            }
            if (v25)
            {
              uint64_t v26 = v4->_loggingPrefix;
              int v71 = 136315394;
              v72 = "-[BWFigCaptureDevice initWithFigCaptureDevice:deviceID:]";
              __int16 v73 = 2114;
              v74 = v26;
              LODWORD(v47) = 22;
              long long v45 = &v71;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            if (v69 != -12787) {
              goto LABEL_42;
            }
            int v69 = 0;
            uint64_t v18 = v54;
LABEL_40:
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v14 countByEnumeratingWithState:&v62 objects:v77 count:16];
          if (!v18)
          {
LABEL_42:
            if ((v55 & 1) == 0) {
              goto LABEL_43;
            }
LABEL_49:
            v4->_streams = (NSArray *)objc_msgSend(v15, "copy", v45, v47);
            v4->_streamsByPortType = (NSDictionary *)[v16 copy];

            if (!v69)
            {
              uint64_t v31 = *MEMORY[0x1E4F52D98];
              if ([(NSDictionary *)v4->_supportedProperties objectForKeyedSubscript:*MEMORY[0x1E4F52D98]])
              {
                id v32 = [(BWFigCaptureDevice *)v4 copyProperty:v31 error:&v69];
                if (v69) {
                  goto LABEL_72;
                }
                unsigned int v33 = v14;
                unsigned int v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v32, "count"));
                long long v57 = 0u;
                long long v58 = 0u;
                long long v59 = 0u;
                long long v60 = 0u;
                uint64_t v35 = [v32 countByEnumeratingWithState:&v57 objects:v70 count:16];
                if (v35)
                {
                  uint64_t v36 = v35;
                  uint64_t v37 = *(void *)v58;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v36; ++i)
                    {
                      if (*(void *)v58 != v37) {
                        objc_enumerationMutation(v32);
                      }
                      long long v39 = [[BWFigCaptureSynchronizedStreamsGroup alloc] initWithFigCaptureSynchronizedStreamsGroup:*(void *)(*((void *)&v57 + 1) + 8 * i) captureDevice:v4];
                      if (!v39)
                      {
                        int v69 = -12785;
                        goto LABEL_62;
                      }
                      long long v40 = v39;
                      [v34 addObject:v39];
                    }
                    uint64_t v36 = [v32 countByEnumeratingWithState:&v57 objects:v70 count:16];
                    if (v36) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_62:
                v4->_synchronizedStreamsGroups = (NSArray *)[v34 copy];

                id v14 = v33;
                if (v69)
                {
LABEL_72:
                  FigDebugAssert3();
                  goto LABEL_74;
                }
              }
              else
              {
                id v32 = 0;
              }
              if (*MEMORY[0x1E4F1EBA8]) {
                int v41 = 822152000;
              }
              else {
                int v41 = 0;
              }
              v4->_unsigned int ktraceCodePrefix = v41;
              goto LABEL_74;
            }
LABEL_71:
            FigDebugAssert3();
            id v32 = 0;
            goto LABEL_74;
          }
        }
      }
      FigDebugAssert3();
    }
  }
  else
  {
    int v69 = -12780;
    unsigned int v68 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v32 = 0;
  id v14 = 0;
LABEL_74:

  if (v69)
  {

    return 0;
  }
  return v4;
}

- (id)copyProperty:(__CFString *)a3 error:(int *)a4
{
  return (id)-[BWFigCaptureDevice _copyProperty:requireSupported:error:]((uint64_t)self, a3, 1, a4);
}

- (uint64_t)_copyProperty:(int)a3 requireSupported:(int *)a4 error:
{
  v19[24] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v7 = result;
    v19[0] = 0;
    int v8 = *(_DWORD *)(result + 80);
    uint64_t v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (v8)
    {
      unsigned int v10 = v8 & 0xFFFFFFC0 | 0x10;
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
    os_unfair_lock_lock((os_unfair_lock_t)(v7 + 76));
    if (*(unsigned char *)(v7 + 72))
    {
      int v12 = -12785;
    }
    else
    {
      int v13 = *(void **)(v7 + 32);
      if (v13 && ![v13 objectForKeyedSubscript:cf])
      {
        if (a3) {
          int v12 = -12787;
        }
        else {
          int v12 = 0;
        }
      }
      else
      {
        uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject(*(void *)(v7 + 8));
        uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v15) {
          uint64_t v16 = v15;
        }
        else {
          uint64_t v16 = 0;
        }
        uint64_t v17 = *(uint64_t (**)(uint64_t, CFTypeRef, void, void *))(v16 + 48);
        if (v17) {
          int v12 = v17(FigBaseObject, cf, *MEMORY[0x1E4F1CF80], v19);
        }
        else {
          int v12 = -12782;
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 76));
    if (v11 && *v9 == 1) {
      kdebug_trace();
    }
    if (v12 || dword_1EB4C4F90)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (a4) {
      *a4 = v12;
    }
    return v19[0];
  }
  return result;
}

- (uint64_t)_setProperty:(uint64_t)a3 value:(int)a4 requireSupported:
{
  if (!a1) {
    return 0;
  }
  int v8 = *(_DWORD *)(a1 + 80);
  uint64_t v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
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
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 76));
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v12 = 4294954511;
  }
  else
  {
    int v13 = *(void **)(a1 + 32);
    if (v13 && ![v13 objectForKeyedSubscript:cf])
    {
      if (a4) {
        uint64_t v12 = 4294954509;
      }
      else {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject(*(void *)(a1 + 8));
      uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v15) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      uint64_t v17 = *(uint64_t (**)(uint64_t, CFTypeRef, uint64_t))(v16 + 56);
      if (v17) {
        uint64_t v12 = v17(FigBaseObject, cf, a3);
      }
      else {
        uint64_t v12 = 4294954514;
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
  if (v11 && *v9 == 1) {
    kdebug_trace();
  }
  if (!v12)
  {
    if (dword_1EB4C4F90)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
  uint64_t v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return v12;
}

- (int)setPropertyIfSupported:(__CFString *)a3 value:(id)a4
{
  return -[BWFigCaptureDevice _setProperty:value:requireSupported:]((uint64_t)self, a3, (uint64_t)a4, 0);
}

- (void)resetSynchronizedStreamsGroups
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  synchronizedStreamsGroups = self->_synchronizedStreamsGroups;
  uint64_t v3 = [(NSArray *)synchronizedStreamsGroups countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    uint64_t v6 = *MEMORY[0x1E4F555D0];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(synchronizedStreamsGroups);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) setProperty:v6 value:0];
      }
      uint64_t v4 = [(NSArray *)synchronizedStreamsGroups countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)copyStreamsWithPortTypes:(id)a3 error:(int *)a4
{
  uint64_t v5 = (NSArray *)a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  if (dword_1EB4C4F90)
  {
    unsigned int v28 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!v5) {
    uint64_t v5 = [(NSDictionary *)self->_streamsByPortType allKeys];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16, v21, v22);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
LABEL_7:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v5);
      }
      uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * v12);
      id v14 = [(NSDictionary *)self->_streamsByPortType objectForKeyedSubscript:v13];
      if (!v14) {
        break;
      }
      [v7 addObject:v14];
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
        if (v10) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
    unsigned int v28 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v18 = v28;
    if (os_log_type_enabled(v17, type)) {
      unsigned int v19 = v18;
    }
    else {
      unsigned int v19 = v18 & 0xFFFFFFFE;
    }
    if (v19)
    {
      loggingPrefix = self->_loggingPrefix;
      int v30 = 136315650;
      uint64_t v31 = "-[BWFigCaptureDevice copyStreamsWithPortTypes:error:]";
      __int16 v32 = 2114;
      unsigned int v33 = loggingPrefix;
      __int16 v34 = 2114;
      uint64_t v35 = v13;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v7 = 0;
    int v15 = -12780;
    if (a4) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_13:
    int v15 = 0;
    if (a4) {
LABEL_14:
    }
      *a4 = v15;
  }
  return v7;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (BOOL)invalidated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (int)setProperty:(__CFString *)a3 value:(id)a4
{
  return -[BWFigCaptureDevice _setProperty:value:requireSupported:]((uint64_t)self, a3, (uint64_t)a4, 1);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C4F90)
  {
    int v7 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  device = self->_device;
  if (device) {
    CFRelease(device);
  }

  v5.receiver = self;
  v5.super_class = (Class)BWFigCaptureDevice;
  [(BWFigCaptureDevice *)&v5 dealloc];
}

- (id)copyStreamWithPortType:(__CFString *)a3 error:(int *)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = a3;
  id v4 = -[BWFigCaptureDevice copyStreamsWithPortTypes:error:](self, "copyStreamsWithPortTypes:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1], a4);
  id v5 = (id)[v4 firstObject];

  return v5;
}

- (int)relinquishControlOfStreams:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C4F90)
  {
    unsigned int v37 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v32 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "figCaptureStream", v30, v31));
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v32 objects:v46 count:16];
    }
    while (v8);
  }
  unsigned int ktraceCodePrefix = self->_ktraceCodePrefix;
  uint64_t v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (ktraceCodePrefix)
  {
    unsigned int v13 = ktraceCodePrefix & 0xFFFFFFC0 | 4;
    if (*MEMORY[0x1E4F1EBA8]) {
      unsigned int v14 = v13;
    }
    else {
      unsigned int v14 = 0;
    }
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
  }
  else
  {
    unsigned int v14 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    int v15 = -12785;
  }
  else
  {
    device = self->_device;
    uint64_t v17 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v17) {
      unsigned int v18 = v17;
    }
    else {
      unsigned int v18 = 0;
    }
    if (*v18 >= 2uLL && (unsigned int v19 = (uint64_t (*)(OpaqueFigCaptureDevice *, void *, void))v18[3]) != 0) {
      int v15 = v19(device, v6, 0);
    }
    else {
      int v15 = -12782;
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v14 && *v12 == 1) {
    kdebug_trace();
  }

  if (v15 == -12782) {
    int v20 = 0;
  }
  else {
    int v20 = v15;
  }
  if (v20)
  {
    unsigned int v37 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v22 = v37;
    if (os_log_type_enabled(v21, type)) {
      unsigned int v23 = v22;
    }
    else {
      unsigned int v23 = v22 & 0xFFFFFFFE;
    }
    if (v23)
    {
      loggingPrefix = self->_loggingPrefix;
      int v38 = 136315906;
      long long v39 = "-[BWFigCaptureDevice relinquishControlOfStreams:]";
      __int16 v40 = 2114;
      int v41 = loggingPrefix;
      __int16 v42 = 2114;
      id v43 = a3;
      __int16 v44 = 1024;
      int v45 = v20;
      _os_log_send_and_compose_impl();
    }
LABEL_44:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return v20;
  }
  if (dword_1EB4C4F90)
  {
    unsigned int v37 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v26 = v37;
    if (os_log_type_enabled(v25, type)) {
      unsigned int v27 = v26;
    }
    else {
      unsigned int v27 = v26 & 0xFFFFFFFE;
    }
    if (v27)
    {
      unsigned int v28 = self->_loggingPrefix;
      int v38 = 136315650;
      long long v39 = "-[BWFigCaptureDevice relinquishControlOfStreams:]";
      __int16 v40 = 2114;
      int v41 = v28;
      __int16 v42 = 2114;
      id v43 = a3;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_44;
  }
  return v20;
}

- (id)copyISPProcessingSessionWithType:(int)a3 error:(int *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  int v20 = @"SessionType";
  v21[0] = [NSNumber numberWithInt:*(void *)&a3];
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  CFTypeRef cf = 0;
  unsigned int ktraceCodePrefix = self->_ktraceCodePrefix;
  uint64_t v8 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (ktraceCodePrefix)
  {
    unsigned int v9 = ktraceCodePrefix & 0xFFFFFFC0 | 8;
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
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    uint64_t v11 = 0;
    int v12 = -12785;
  }
  else
  {
    device = self->_device;
    uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v14) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = *(uint64_t (**)(OpaqueFigCaptureDevice *, void, uint64_t, CFTypeRef *))(v15 + 8);
    if (v16)
    {
      int v12 = v16(device, *MEMORY[0x1E4F1CF80], v6, &cf);
      if (cf)
      {
        uint64_t v17 = [BWFigCaptureISPProcessingSession alloc];
        uint64_t v11 = [(BWFigCaptureISPProcessingSession *)v17 initWithFigCaptureISPProcessingSession:cf];
        [(BWFigCaptureISPProcessingSession *)v11 setDelegate:self];
        if (!self->_activeProcessingSessions) {
          self->_activeProcessingSessions = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
        }
        [(NSMutableArray *)self->_activeProcessingSessions addObject:+[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", v11, cf)];
        if (cf) {
          CFRelease(cf);
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
      int v12 = -12782;
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v10 && *v8 == 1) {
    kdebug_trace();
  }
  if (a4) {
    *a4 = v12;
  }
  return v11;
}

- (int)enqueueReactionEffect:(id)a3
{
  return -12782;
}

- (int)unregisterForNotification:(__CFString *)a3 listener:(const void *)a4
{
  FigCaptureDeviceGetNotificationCenter(self, a2);
  return FigNotificationCenterRemoveWeakListener();
}

- (id)copyPropertyIfSupported:(__CFString *)a3 error:(int *)a4
{
  return (id)-[BWFigCaptureDevice _copyProperty:requireSupported:error:]((uint64_t)self, a3, 0, a4);
}

- (id)getProperty:(__CFString *)a3 error:(int *)a4
{
  id v4 = (void *)-[BWFigCaptureDevice _copyProperty:requireSupported:error:]((uint64_t)self, a3, 1, a4);
  return v4;
}

- (id)getPropertyIfSupported:(__CFString *)a3 error:(int *)a4
{
  id v4 = (void *)-[BWFigCaptureDevice _copyProperty:requireSupported:error:]((uint64_t)self, a3, 0, a4);
  return v4;
}

- (id)copyStreamForFigCaptureStream:(OpaqueFigCaptureStream *)a3 error:(int *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  streams = self->_streams;
  uint64_t v7 = [(NSArray *)streams countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v7)
  {
LABEL_13:
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v11 = 0;
    int v12 = -12784;
    if (!a4) {
      return v11;
    }
LABEL_14:
    *a4 = v12;
    return v11;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v16;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v16 != v9) {
      objc_enumerationMutation(streams);
    }
    uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
    if ((OpaqueFigCaptureStream *)[v11 figCaptureStream] == a3) {
      break;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [(NSArray *)streams countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        goto LABEL_3;
      }
      goto LABEL_13;
    }
  }
  if (!v11) {
    goto LABEL_13;
  }
  int v12 = 0;
  if (a4) {
    goto LABEL_14;
  }
  return v11;
}

- (id)copySyncGroupForFigCaptureSynchronizedStreamsGroup:(OpaqueFigCaptureSynchronizedStreamsGroup *)a3 error:(int *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  synchronizedStreamsGroups = self->_synchronizedStreamsGroups;
  uint64_t v7 = [(NSArray *)synchronizedStreamsGroups countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v7)
  {
LABEL_13:
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v11 = 0;
    int v12 = -12784;
    if (!a4) {
      return v11;
    }
LABEL_14:
    *a4 = v12;
    return v11;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v16;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v16 != v9) {
      objc_enumerationMutation(synchronizedStreamsGroups);
    }
    uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
    if ((OpaqueFigCaptureSynchronizedStreamsGroup *)[v11 figCaptureSynchronizedStreamsGroup] == a3) {
      break;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [(NSArray *)synchronizedStreamsGroups countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        goto LABEL_3;
      }
      goto LABEL_13;
    }
  }
  if (!v11) {
    goto LABEL_13;
  }
  int v12 = 0;
  if (a4) {
    goto LABEL_14;
  }
  return v11;
}

- (OpaqueFigCaptureDevice)figCaptureDevice
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated) {
    device = 0;
  }
  else {
    device = self->_device;
  }
  os_unfair_lock_unlock(p_lock);
  return device;
}

- (void)invalidate
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  unsigned int ktraceCodePrefix = self->_ktraceCodePrefix;
  id v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
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
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    __int16 v40 = &self->_lock;
    unsigned int v41 = v6;
    if (dword_1EB4C4F90)
    {
      unsigned int v53 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    __int16 v42 = self;
    obuint64_t j = self->_streams;
    uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v61, 16, v36, v38);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v49;
      uint64_t v12 = *MEMORY[0x1E4F54CA8];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          int v15 = objc_msgSend(v14, "setPropertyIfSupported:value:", v12, MEMORY[0x1E4F1CC28], v37, v39);
          if (v15)
          {
            int v16 = v15;
            unsigned int v53 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            long long v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v18 = v53;
            if (os_log_type_enabled(v17, type)) {
              unsigned int v19 = v18;
            }
            else {
              unsigned int v19 = v18 & 0xFFFFFFFE;
            }
            if (v19)
            {
              uint64_t v20 = [v14 portType];
              int v55 = 136315650;
              uint64_t v56 = "-[BWFigCaptureDevice invalidate]";
              __int16 v57 = 2112;
              uint64_t v58 = v20;
              __int16 v59 = 1024;
              int v60 = v16;
              LODWORD(v39) = 28;
              unsigned int v37 = &v55;
              _os_log_send_and_compose_impl();
            }
          }
          else
          {
            if (!dword_1EB4C4F90) {
              continue;
            }
            unsigned int v53 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            uint64_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v22 = v53;
            if (os_log_type_enabled(v21, type)) {
              unsigned int v23 = v22;
            }
            else {
              unsigned int v23 = v22 & 0xFFFFFFFE;
            }
            if (v23)
            {
              uint64_t v24 = [v14 portType];
              int v55 = 136315394;
              uint64_t v56 = "-[BWFigCaptureDevice invalidate]";
              __int16 v57 = 2112;
              uint64_t v58 = v24;
              LODWORD(v39) = 22;
              unsigned int v37 = &v55;
              _os_log_send_and_compose_impl();
            }
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v48 objects:v61 count:16];
      }
      while (v10);
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    activeProcessingSessions = v42->_activeProcessingSessions;
    uint64_t v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activeProcessingSessions, "countByEnumeratingWithState:objects:count:", &v44, v54, 16, v37, v39);
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v45 != v28) {
            objc_enumerationMutation(activeProcessingSessions);
          }
          uint64_t v30 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * j) referencedObject];
          [v30 setDelegate:0];
          [v30 invalidate];
        }
        uint64_t v27 = [(NSMutableArray *)activeProcessingSessions countByEnumeratingWithState:&v44 objects:v54 count:16];
      }
      while (v27);
    }

    v42->_activeProcessingSessions = 0;
    uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject(v42->_device);
    id v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    unsigned int v6 = v41;
    p_lock = v40;
    if (FigBaseObject)
    {
      uint64_t v32 = FigBaseObject;
      uint64_t v33 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v34 = v33 ? v33 : 0;
      long long v35 = *(void (**)(uint64_t))(v34 + 24);
      if (v35) {
        v35(v32);
      }
    }
    v42->_invalidated = 1;
  }
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    if (*v4 == 1) {
      kdebug_trace();
    }
  }
}

- (void)processingSessionHasBeenInvalidated:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int ktraceCodePrefix = self->_ktraceCodePrefix;
  unsigned int v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (ktraceCodePrefix)
  {
    unsigned int v7 = ktraceCodePrefix & 0xFFFFFFC0 | 0x18;
    if (*MEMORY[0x1E4F1EBA8]) {
      unsigned int v8 = v7;
    }
    else {
      unsigned int v8 = 0;
    }
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
  }
  else
  {
    unsigned int v8 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  activeProcessingSessions = self->_activeProcessingSessions;
  uint64_t v10 = [(NSMutableArray *)activeProcessingSessions countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(activeProcessingSessions);
        }
        uint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((id)[v14 referencedObject] == a3)
        {
          if (v14)
          {
            [(NSMutableArray *)self->_activeProcessingSessions removeObject:v14];
            if (![(NSMutableArray *)self->_activeProcessingSessions count])
            {

              self->_activeProcessingSessions = 0;
            }
          }
          goto LABEL_20;
        }
      }
      uint64_t v11 = [(NSMutableArray *)activeProcessingSessions countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_20:
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    if (*v6 == 1) {
      kdebug_trace();
    }
  }
}

- (int64_t)uniqueID
{
  return self->_uniqueID;
}

- (NSArray)synchronizedStreamsGroups
{
  return self->_synchronizedStreamsGroups;
}

@end