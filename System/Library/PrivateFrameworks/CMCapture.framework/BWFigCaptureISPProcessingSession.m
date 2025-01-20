@interface BWFigCaptureISPProcessingSession
+ (void)initialize;
- (BWFigCaptureISPProcessingSession)initWithFigCaptureISPProcessingSession:(OpaqueFigCaptureISPProcessingSession *)a3;
- (BWFigCaptureISPProcessingSessionDelegate)delegate;
- (NSDictionary)supportedProperties;
- (OpaqueFigCaptureISPProcessingSession)figCaptureISPProcessingSession;
- (id)copyProperty:(__CFString *)a3 error:(int *)a4;
- (id)getProperty:(__CFString *)a3 error:(int *)a4;
- (int)flush;
- (int)invalidate;
- (int)prepareWithHandler:(id)a3;
- (int)processBuffer:(__CVBuffer *)a3 refCon:(void *)a4 outputDescriptors:(id *)a5 numOutputDescriptors:(int)a6 parameters:(id)a7;
- (int)setProperty:(__CFString *)a3 value:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation BWFigCaptureISPProcessingSession

+ (void)initialize
{
  v2[1] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    v2[0] = @"SupportedPropertiesDictionary";
    sCacheableProperties_0 = (uint64_t)(id)[MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  }
}

- (BWFigCaptureISPProcessingSession)initWithFigCaptureISPProcessingSession:(OpaqueFigCaptureISPProcessingSession *)a3
{
  v3 = self;
  int v8 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  v7.receiver = self;
  v7.super_class = (Class)BWFigCaptureISPProcessingSession;
  v5 = [(BWFigCaptureISPProcessingSession *)&v7 init];
  v3 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_cachedProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_session = (OpaqueFigCaptureISPProcessingSession *)CFRetain(a3);
    v3->_supportedProperties = (NSDictionary *)[(BWFigCaptureISPProcessingSession *)v3 copyProperty:@"SupportedPropertiesDictionary" error:&v8];
    if (v8)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
LABEL_6:

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  [(BWFigCaptureISPProcessingSession *)self invalidate];
  session = self->_session;
  if (session) {
    CFRelease(session);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWFigCaptureISPProcessingSession;
  [(BWFigCaptureISPProcessingSession *)&v4 dealloc];
}

- (NSDictionary)supportedProperties
{
  return self->_supportedProperties;
}

- (OpaqueFigCaptureISPProcessingSession)figCaptureISPProcessingSession
{
  return self->_session;
}

- (int)setProperty:(__CFString *)a3 value:(id)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    int v8 = -12785;
    goto LABEL_13;
  }
  if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedProperties, "objectForKeyedSubscript:", a3), "isEqual:", a4))
  {
LABEL_4:
    int v8 = 0;
    goto LABEL_13;
  }
  session = self->_session;
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  v12 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *, __CFString *, id))(v11 + 56);
  if (!v12)
  {
    int v8 = -12782;
    goto LABEL_13;
  }
  int v8 = v12(session, a3, a4);
  if (!v8)
  {
    if ([(id)sCacheableProperties_0 containsObject:a3]) {
      [(NSMutableDictionary *)self->_cachedProperties setObject:a4 forKeyedSubscript:a3];
    }
    goto LABEL_4;
  }
LABEL_13:
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)copyProperty:(__CFString *)a3 error:(int *)a4
{
  id v14 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    int v8 = -12785;
    goto LABEL_13;
  }
  id v14 = (id)[(NSMutableDictionary *)self->_cachedProperties objectForKeyedSubscript:a3];
  if (v14) {
    goto LABEL_4;
  }
  session = self->_session;
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  v12 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *, __CFString *, void, id *))(v11 + 48);
  if (v12)
  {
    int v8 = v12(session, a3, *MEMORY[0x1E4F1CF80], &v14);
    if (!v8)
    {
      if ([(id)sCacheableProperties_0 containsObject:a3]) {
        [(NSMutableDictionary *)self->_cachedProperties setObject:v14 forKeyedSubscript:a3];
      }
LABEL_4:
      int v8 = 0;
    }
  }
  else
  {
    int v8 = -12782;
  }
LABEL_13:
  os_unfair_lock_unlock(p_lock);
  if (a4) {
    *a4 = v8;
  }
  return v14;
}

- (id)getProperty:(__CFString *)a3 error:(int *)a4
{
  id v4 = [(BWFigCaptureISPProcessingSession *)self copyProperty:a3 error:a4];
  return v4;
}

- (int)prepareWithHandler:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    int v6 = -12785;
  }
  else
  {
    session = self->_session;
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *, id))(v9 + 8);
    if (v10) {
      int v6 = v10(session, a3);
    }
    else {
      int v6 = -12782;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (int)processBuffer:(__CVBuffer *)a3 refCon:(void *)a4 outputDescriptors:(id *)a5 numOutputDescriptors:(int)a6 parameters:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    int v14 = -12785;
  }
  else
  {
    session = self->_session;
    uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v16) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    v18 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *, void *, __CVBuffer *, uint64_t, $9E4E0039428142913583DCEF048FEFF1 *, id))(v17 + 16);
    if (v18) {
      int v14 = v18(session, a4, a3, v8, a5, a7);
    }
    else {
      int v14 = -12782;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (int)flush
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    int v4 = -12785;
  }
  else
  {
    session = self->_session;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *))(v7 + 24);
    if (v8) {
      int v4 = v8(session);
    }
    else {
      int v4 = -12782;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
    return 0;
  }
  else
  {
    session = self->_session;
    if (session)
    {
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v8 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *))(v7 + 24);
      if (v8) {
        int v4 = v8(session);
      }
      else {
        int v4 = -12782;
      }
    }
    else
    {
      int v4 = -12780;
    }
    self->_invalidated = 1;
    os_unfair_lock_unlock(p_lock);
    [(BWFigCaptureISPProcessingSessionDelegate *)self->_delegate processingSessionHasBeenInvalidated:self];
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated) {
    self->_delegate = (BWFigCaptureISPProcessingSessionDelegate *)a3;
  }
  os_unfair_lock_unlock(p_lock);
}

- (BWFigCaptureISPProcessingSessionDelegate)delegate
{
  return self->_delegate;
}

@end