@interface BWFigCaptureSynchronizedStreamsGroup
+ (void)initialize;
- (BOOL)stopSupported;
- (BWFigCaptureStream)synchronizationMaster;
- (BWFigCaptureSynchronizedStreamsGroup)initWithFigCaptureSynchronizedStreamsGroup:(OpaqueFigCaptureSynchronizedStreamsGroup *)a3 captureDevice:(id)a4;
- (NSArray)streams;
- (NSDictionary)supportedProperties;
- (OpaqueFigCaptureSynchronizedStreamsGroup)figCaptureSynchronizedStreamsGroup;
- (id)activeStreams;
- (id)copyProperty:(__CFString *)a3 error:(int *)a4;
- (id)getProperty:(__CFString *)a3 error:(int *)a4;
- (int)setActiveStreams:(id)a3;
- (int)setCameraControlsMasterStream:(id)a3;
- (int)setMasterStream:(id)a3 slaveConfigurationsByPortType:(id)a4;
- (int)setProperty:(__CFString *)a3 value:(id)a4;
- (int)stop;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BWFigCaptureSynchronizedStreamsGroup

- (int)setActiveStreams:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v18 = 0;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9++), "figCaptureStream"));
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  uint64_t v11 = *MEMORY[0x1E4F555D0];
  id v12 = [(BWFigCaptureSynchronizedStreamsGroup *)self getProperty:*MEMORY[0x1E4F555D0] error:&v18];
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v12), "isEqualToSet:", v10) & 1) == 0)
  {
    int v18 = [(BWFigCaptureSynchronizedStreamsGroup *)self setProperty:v11 value:v5];
    if (!v18)
    {

      self->_activeStreams = (NSArray *)[a3 copy];
    }
  }

  return v18;
}

- (BWFigCaptureStream)synchronizationMaster
{
  return self->_synchronizationMaster;
}

- (NSArray)streams
{
  return self->_streams;
}

- (BWFigCaptureSynchronizedStreamsGroup)initWithFigCaptureSynchronizedStreamsGroup:(OpaqueFigCaptureSynchronizedStreamsGroup *)a3 captureDevice:(id)a4
{
  v4 = self;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v26 = 0;
  if (!a3)
  {
    uint64_t v9 = 0;
LABEL_35:

    uint64_t v9 = v4;
    v4 = 0;
    goto LABEL_29;
  }
  v25.receiver = self;
  v25.super_class = (Class)BWFigCaptureSynchronizedStreamsGroup;
  uint64_t v7 = [(BWFigCaptureSynchronizedStreamsGroup *)&v25 init];
  v4 = v7;
  if (!v7)
  {
    uint64_t v9 = 0;
    goto LABEL_29;
  }
  v7->_lock._os_unfair_lock_opaque = 0;
  v7->_syncGroup = (OpaqueFigCaptureSynchronizedStreamsGroup *)CFRetain(a3);
  v4->_supportedProperties = (NSDictionary *)[(BWFigCaptureSynchronizedStreamsGroup *)v4 copyProperty:@"SupportedPropertiesDictionary" error:&v26];
  id v8 = [(BWFigCaptureSynchronizedStreamsGroup *)v4 copyProperty:*MEMORY[0x1E4F55650] error:&v26];
  if (v26)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v9 = 0;
    goto LABEL_33;
  }
  uint64_t v9 = [(BWFigCaptureSynchronizedStreamsGroup *)v4 copyProperty:*MEMORY[0x1E4F55648] error:&v26];
  if (v26)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_33:
    if (v8) {
      CFRelease(v8);
    }
    goto LABEL_35;
  }
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[BWFigCaptureSynchronizedStreamsGroup count](v9, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = (void *)[a4 streams];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((id)[v16 figCaptureStream] == v8) {
          v4->_synchronizationMaster = (BWFigCaptureStream *)v16;
        }
        if (-[BWFigCaptureSynchronizedStreamsGroup containsObject:](v9, "containsObject:", [v16 figCaptureStream]))objc_msgSend(v10, "addObject:", v16); {
      }
        }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v13);
  }
  v4->_streams = (NSArray *)[v10 copy];

  v4->_stopSupported = **(void **)(CMBaseObjectGetVTable() + 16) > 1uLL;
  long long v17 = [(BWFigCaptureStream *)v4->_synchronizationMaster portType];
  if (!*MEMORY[0x1E4F1EBA8])
  {
LABEL_26:
    int v19 = 0;
    goto LABEL_27;
  }
  int v18 = v17;
  int v19 = 822151936;
  if (![(NSString *)v17 isEqualToString:*MEMORY[0x1E4F52DF0]]
    && ![(NSString *)v18 isEqualToString:*MEMORY[0x1E4F52DD8]]
    && ![(NSString *)v18 isEqualToString:*MEMORY[0x1E4F52DE8]]
    && ![(NSString *)v18 isEqualToString:*MEMORY[0x1E4F52DE0]])
  {
    if ([(NSString *)v18 isEqualToString:*MEMORY[0x1E4F52DF8]]
      || [(NSString *)v18 isEqualToString:*MEMORY[0x1E4F52E00]]
      || [(NSString *)v18 isEqualToString:*MEMORY[0x1E4F52E10]])
    {
      int v19 = 822151872;
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_27:
  v4->_ktraceCodePrefix = v19;
  if (v8) {
    CFRelease(v8);
  }
LABEL_29:

  return v4;
}

- (id)getProperty:(__CFString *)a3 error:(int *)a4
{
  id v4 = [(BWFigCaptureSynchronizedStreamsGroup *)self copyProperty:a3 error:a4];
  return v4;
}

- (id)copyProperty:(__CFString *)a3 error:(int *)a4
{
  int v18 = 0;
  unsigned int ktraceCodePrefix = self->_ktraceCodePrefix;
  id v8 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (ktraceCodePrefix)
  {
    unsigned int v9 = ktraceCodePrefix & 0xFFFFFFC0 | 4;
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      CFHash(a3);
      kdebug_trace();
    }
  }
  else
  {
    unsigned int v9 = 0;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    int v11 = -12785;
  }
  else
  {
    supportedProperties = self->_supportedProperties;
    if (supportedProperties
      && ![(NSDictionary *)supportedProperties objectForKeyedSubscript:a3])
    {
      int v11 = -12787;
    }
    else
    {
      uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(self->_syncGroup);
      uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v14) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
      long long v16 = *(uint64_t (**)(uint64_t, __CFString *, void, void **))(v15 + 48);
      if (v16) {
        int v11 = v16(FigBaseObject, a3, *MEMORY[0x1E4F1CF80], &v18);
      }
      else {
        int v11 = -12782;
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
  if (v9 && *v8 == 1) {
    kdebug_trace();
  }
  if (a4) {
    *a4 = v11;
  }
  return v18;
}

- (NSDictionary)supportedProperties
{
  return self->_supportedProperties;
}

- (int)setProperty:(__CFString *)a3 value:(id)a4
{
  specific = dispatch_get_specific(@"BWFigCaptureStreamSetPropertySetPropertyAsyncQueue");
  if (specific)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__BWFigCaptureSynchronizedStreamsGroup_setProperty_value___block_invoke;
    block[3] = &unk_1E5C249A0;
    block[5] = a4;
    block[6] = a3;
    block[4] = self;
    dispatch_async(specific, block);
    return 0;
  }
  else
  {
    unsigned int ktraceCodePrefix = self->_ktraceCodePrefix;
    uint64_t v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (ktraceCodePrefix)
    {
      unsigned int v11 = ktraceCodePrefix & 0xFFFFFFC0;
      if (*MEMORY[0x1E4F1EBA8] == 1)
      {
        CFHash(a3);
        kdebug_trace();
      }
    }
    else
    {
      unsigned int v11 = 0;
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_invalidated)
    {
      int v8 = -12785;
    }
    else
    {
      supportedProperties = self->_supportedProperties;
      if (supportedProperties
        && ![(NSDictionary *)supportedProperties objectForKeyedSubscript:a3])
      {
        int v8 = -12787;
      }
      else
      {
        uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(self->_syncGroup);
        uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v15) {
          uint64_t v16 = v15;
        }
        else {
          uint64_t v16 = 0;
        }
        long long v17 = *(uint64_t (**)(uint64_t, __CFString *, id))(v16 + 56);
        if (v17) {
          int v8 = v17(FigBaseObject, a3, a4);
        }
        else {
          int v8 = -12782;
        }
      }
    }
    os_unfair_lock_unlock(p_lock);
    if (v11 && *v10 == 1) {
      kdebug_trace();
    }
  }
  return v8;
}

- (int)setMasterStream:(id)a3 slaveConfigurationsByPortType:(id)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = [a3 figCaptureStream];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F555A8]];
  [v7 setObject:a4 forKeyedSubscript:*MEMORY[0x1E4F555B0]];
  LODWORD(a4) = [(BWFigCaptureSynchronizedStreamsGroup *)self setProperty:*MEMORY[0x1E4F555E8] value:v7];

  return (int)a4;
}

- (int)setCameraControlsMasterStream:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1A6272C70](self, a2);
  v16[0] = *MEMORY[0x1E4F55598];
  uint64_t v6 = [a3 figCaptureStream];
  uint64_t v7 = *MEMORY[0x1E4F1D260];
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = *MEMORY[0x1E4F1D260];
  }
  v17[0] = v8;
  v16[1] = *MEMORY[0x1E4F55590];
  uint64_t v9 = [a3 figCaptureStream];
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v7;
  }
  v17[1] = v10;
  v16[2] = *MEMORY[0x1E4F555A0];
  uint64_t v11 = [a3 figCaptureStream];
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = v7;
  }
  v17[2] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  int v14 = [(BWFigCaptureSynchronizedStreamsGroup *)self setProperty:*MEMORY[0x1E4F555E8] value:v13];
  return v14;
}

- (OpaqueFigCaptureSynchronizedStreamsGroup)figCaptureSynchronizedStreamsGroup
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated) {
    syncGroup = 0;
  }
  else {
    syncGroup = self->_syncGroup;
  }
  os_unfair_lock_unlock(p_lock);
  return syncGroup;
}

+ (void)initialize
{
}

- (void)dealloc
{
  syncGroup = self->_syncGroup;
  if (syncGroup) {
    CFRelease(syncGroup);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWFigCaptureSynchronizedStreamsGroup;
  [(BWFigCaptureSynchronizedStreamsGroup *)&v4 dealloc];
}

uint64_t __58__BWFigCaptureSynchronizedStreamsGroup_setProperty_value___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProperty:*(void *)(a1 + 48) value:*(void *)(a1 + 40)];
}

- (id)activeStreams
{
  return self->_activeStreams;
}

- (int)stop
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (self->_stopSupported)
  {
    unsigned int ktraceCodePrefix = self->_ktraceCodePrefix;
    objc_super v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (ktraceCodePrefix)
    {
      unsigned int v5 = ktraceCodePrefix & 0xFFFFFFC0 | 8;
      if (*MEMORY[0x1E4F1EBA8] == 1) {
        kdebug_trace();
      }
    }
    else
    {
      unsigned int v5 = 0;
    }
    p_locuint64_t k = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    activeStreams = self->_activeStreams;
    uint64_t v8 = [(NSArray *)activeStreams countByEnumeratingWithState:&v46 objects:v53 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v47;
LABEL_8:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(activeStreams);
        }
        if ([*(id *)(*((void *)&v46 + 1) + 8 * v11) streaming]) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [(NSArray *)activeStreams countByEnumeratingWithState:&v46 objects:v53 count:16];
          if (v9) {
            goto LABEL_8;
          }
          goto LABEL_37;
        }
      }
      if (**(void **)(CMBaseObjectGetVTable() + 16) >= 2uLL)
      {
        long long v44 = 0uLL;
        long long v45 = 0uLL;
        long long v42 = 0uLL;
        long long v43 = 0uLL;
        uint64_t v12 = self->_activeStreams;
        uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v43 != v15) {
                objc_enumerationMutation(v12);
              }
              [*(id *)(*((void *)&v42 + 1) + 8 * i) synchronizedStreamsGroupWillStop];
            }
            uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v42 objects:v52 count:16];
          }
          while (v14);
        }
        syncGroup = self->_syncGroup;
        int v18 = *(void **)(CMBaseObjectGetVTable() + 16);
        if (v18) {
          int v19 = v18;
        }
        else {
          int v19 = 0;
        }
        if (*v19 >= 2uLL && (v27 = (uint64_t (*)(OpaqueFigCaptureSynchronizedStreamsGroup *))v19[1]) != 0) {
          int v26 = v27(syncGroup);
        }
        else {
          int v26 = -12782;
        }
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v28 = self->_activeStreams;
        uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v38 objects:v51 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v39 != v31) {
                objc_enumerationMutation(v28);
              }
              [*(id *)(*((void *)&v38 + 1) + 8 * j) synchronizedStreamsGroupDidStop];
            }
            uint64_t v30 = [(NSArray *)v28 countByEnumeratingWithState:&v38 objects:v51 count:16];
          }
          while (v30);
        }
        goto LABEL_50;
      }
      long long v36 = 0uLL;
      long long v37 = 0uLL;
      long long v34 = 0uLL;
      long long v35 = 0uLL;
      uint64_t v20 = self->_activeStreams;
      uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v34 objects:v50 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v35;
        do
        {
          for (uint64_t k = 0; k != v22; ++k)
          {
            if (*(void *)v35 != v23) {
              objc_enumerationMutation(v20);
            }
            objc_super v25 = *(BWFigCaptureStream **)(*((void *)&v34 + 1) + 8 * k);
            if ([(BWFigCaptureStream *)v25 streaming] && v25 != self->_synchronizationMaster) {
              [(BWFigCaptureStream *)v25 stop];
            }
          }
          uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v34 objects:v50 count:16];
        }
        while (v22);
      }
      if ([(BWFigCaptureStream *)self->_synchronizationMaster streaming]) {
        [(BWFigCaptureStream *)self->_synchronizationMaster stop];
      }
    }
LABEL_37:
    int v26 = 0;
LABEL_50:
    os_unfair_lock_unlock(p_lock);
    if (v5 && *v4 == 1) {
      kdebug_trace();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12782;
  }
  return v26;
}

- (void)invalidate
{
  unsigned int ktraceCodePrefix = self->_ktraceCodePrefix;
  objc_super v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (ktraceCodePrefix)
  {
    unsigned int v5 = ktraceCodePrefix & 0xFFFFFFC0 | 0xC;
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      kdebug_trace();
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated) {
    self->_invalidated = 1;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v5 && *v4 == 1)
  {
    kdebug_trace();
  }
}

- (BOOL)stopSupported
{
  return self->_stopSupported;
}

@end