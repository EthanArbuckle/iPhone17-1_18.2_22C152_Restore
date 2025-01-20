@interface BWDeferredProcessingContainerManager
+ (id)sharedInstance;
- (BWDeferredProcessingContainer)_copyRemoteContainer:(uint64_t)a3 captureRequestIdentifier:(uint64_t)a4 baseFolderURL:(int *)a5 err:;
- (BWDeferredProcessingContainerManager)init;
- (id)createProcessingContainerWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 openForPeeking:(BOOL)a5 err:(int *)a6;
- (id)createTransientContainerWithApplicationID:(id)a3 resolvedSettings:(id)a4 unresolvedSettings:(id)a5 pipelineParameters:(id)a6 intermediates:(id)a7 photoDescriptors:(id)a8;
- (id)manifestsForApplicationID:(id)a3 err:(int *)a4;
- (int)deleteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4;
- (int)waitForShaderCompilation;
- (uint64_t)_copyXPCContainerManager;
- (uint64_t)_queryContainerStatus:(uint64_t)a3 captureRequestIdentifier:(_DWORD *)a4 status:;
- (uint64_t)_releaseRemoteContainer:(uint64_t)a3 captureRequestIdentifier:;
- (void)_setXPCContainerManager:(uint64_t)a1;
- (void)releaseProcessingContainer:(id)a3;
@end

@implementation BWDeferredProcessingContainerManager

BWDeferredProcessingContainerManager *__54__BWDeferredProcessingContainerManager_sharedInstance__block_invoke()
{
  result = objc_alloc_init(BWDeferredProcessingContainerManager);
  sharedInstance_sharedInstance_180 = (uint64_t)result;
  return result;
}

- (BWDeferredProcessingContainerManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWDeferredProcessingContainerManager;
  v2 = [(BWDeferredContainerManagerBase *)&v5 initWithQueuePriority:39];
  if (v2)
  {
    v3 = (const void *)FigCaptureDeferredContainerManagerRemoteCopyContainerManager();
    -[BWDeferredProcessingContainerManager _setXPCContainerManager:]((uint64_t)v2, v3);
    if (v3) {
      CFRelease(v3);
    }
  }
  return v2;
}

- (id)createTransientContainerWithApplicationID:(id)a3 resolvedSettings:(id)a4 unresolvedSettings:(id)a5 pipelineParameters:(id)a6 intermediates:(id)a7 photoDescriptors:(id)a8
{
  v14 = [BWDeferredProcessingContainer alloc];
  return [(BWDeferredProcessingContainer *)v14 initWithApplicationID:a3 resolvedSettings:a4 unresolvedSettings:a5 pipelineParameters:a6 intermediates:a7 photoDescriptors:a8];
}

- (void)_setXPCContainerManager:(uint64_t)a1
{
  if (a1)
  {
    CFTypeRef v4 = *(CFTypeRef *)(a1 + 216);
    if (v4 != cf)
    {
      if (v4)
      {
        CFRelease(v4);
        *(void *)(a1 + 216) = 0;
      }
      if (cf) {
        *(void *)(a1 + 216) = CFRetain(cf);
      }
    }
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_once_181 != -1) {
    dispatch_once(&sharedInstance_once_181, &__block_literal_global_183);
  }
  return (id)sharedInstance_sharedInstance_180;
}

- (uint64_t)_copyXPCContainerManager
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = (pthread_rwlock_t *)(result + 8);
    pthread_rwlock_wrlock((pthread_rwlock_t *)(result + 8));
    if (FigCaptureDeferredContainerManagerRemoteIsConnectionValid(*(void *)(v1 + 216)))
    {
      v3 = *(const void **)(v1 + 216);
      if (v3) {
        CFRetain(v3);
      }
    }
    else
    {
      CFTypeRef v4 = (const void *)FigCaptureDeferredContainerManagerRemoteCopyContainerManager();
      -[BWDeferredProcessingContainerManager _setXPCContainerManager:](v1, v4);
    }
    pthread_rwlock_unlock(v2);
    return *(void *)(v1 + 216);
  }
  return result;
}

- (uint64_t)_queryContainerStatus:(uint64_t)a3 captureRequestIdentifier:(_DWORD *)a4 status:
{
  if (!a1) {
    return 0;
  }
  int v16 = 0;
  v8 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (!FigCaptureCurrentProcessIsDeferredmediad())
  {
    uint64_t v13 = [+[BWDeferredCaptureContainerManager sharedInstance] queryContainerStatusForApplicationID:a2 captureRequestIdentifier:a3 status:&v16];
    if (!a4) {
      goto LABEL_16;
    }
LABEL_15:
    *a4 = v16;
    goto LABEL_16;
  }
  uint64_t v9 = -[BWDeferredProcessingContainerManager _copyXPCContainerManager](a1);
  if (v9)
  {
    v10 = (const void *)v9;
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    v14 = *(uint64_t (**)(const void *, uint64_t, uint64_t, int *))(v12 + 16);
    if (v14) {
      uint64_t v13 = v14(v10, a2, a3, &v16);
    }
    else {
      uint64_t v13 = 4294954514;
    }
    CFRelease(v10);
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  FigDebugAssert3();
  uint64_t v13 = 4294951159;
  if (a4) {
    goto LABEL_15;
  }
LABEL_16:
  if (*v8 == 1) {
    kdebug_trace();
  }
  return v13;
}

- (BWDeferredProcessingContainer)_copyRemoteContainer:(uint64_t)a3 captureRequestIdentifier:(uint64_t)a4 baseFolderURL:(int *)a5 err:
{
  if (!a1) {
    return 0;
  }
  int v20 = 0;
  v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  uint64_t v11 = -[BWDeferredProcessingContainerManager _copyXPCContainerManager](a1);
  if (v11)
  {
    uint64_t v12 = (const void *)v11;
    uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    v15 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v14 + 24);
    if (v15 && (uint64_t v16 = v15(v12, a2, a3)) != 0)
    {
      v17 = (void *)v16;
      v18 = [[BWDeferredProcessingContainer alloc] initWithXPCEncoding:v16 applicationID:a2 captureRequestIdentifier:a3 baseFolderURL:a4 err:&v20];
      if (!v18)
      {
        FigDebugAssert3();
        int v20 = -16133;
      }
      CFRelease(v12);
      xpc_release(v17);
      if (!a5) {
        goto LABEL_16;
      }
    }
    else
    {
      FigDebugAssert3();
      int v20 = -16132;
      CFRelease(v12);
      v18 = 0;
      if (!a5) {
        goto LABEL_16;
      }
    }
    goto LABEL_15;
  }
  FigDebugAssert3();
  v18 = 0;
  int v20 = -16137;
  if (a5) {
LABEL_15:
  }
    *a5 = v20;
LABEL_16:
  if (*v10 == 1) {
    kdebug_trace();
  }
  return v18;
}

- (uint64_t)_releaseRemoteContainer:(uint64_t)a3 captureRequestIdentifier:
{
  if (!a1) {
    return 0;
  }
  v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  uint64_t v7 = -[BWDeferredProcessingContainerManager _copyXPCContainerManager](a1);
  if (v7)
  {
    v8 = (const void *)v7;
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v10 + 32);
    if (v11) {
      uint64_t v12 = v11(v8, a2, a3);
    }
    else {
      uint64_t v12 = 4294954514;
    }
    CFRelease(v8);
  }
  else
  {
    FigDebugAssert3();
    uint64_t v12 = 4294951159;
  }
  if (*v6 == 1) {
    kdebug_trace();
  }
  return v12;
}

- (id)manifestsForApplicationID:(id)a3 err:(int *)a4
{
  uint64_t v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (a3)
  {
    uint64_t v8 = -[BWDeferredProcessingContainerManager _copyXPCContainerManager]((uint64_t)self);
    if (v8)
    {
      uint64_t v9 = (const void *)v8;
      uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v12 = *(uint64_t (**)(const void *, id))(v11 + 8);
      if (v12 && (uint64_t v13 = (void *)v12(v9, a3)) != 0)
      {
        a3 = v13;
        int v14 = 0;
      }
      else
      {
        FigDebugAssert3();
        a3 = 0;
        int v14 = -16134;
      }
      CFRelease(v9);
    }
    else
    {
      FigDebugAssert3();
      a3 = 0;
      int v14 = -16137;
    }
  }
  else
  {
    FigDebugAssert3();
    int v14 = -16134;
  }
  if (a4) {
    *a4 = v14;
  }
  if (*v7 == 1) {
    kdebug_trace();
  }
  return a3;
}

- (id)createProcessingContainerWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 openForPeeking:(BOOL)a5 err:(int *)a6
{
  BOOL v7 = a5;
  int v20 = 0;
  id v19 = 0;
  uint64_t v11 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (!a3 || !a4)
  {
    FigDebugAssert3();
    uint64_t v13 = 0;
    int v14 = -16134;
    goto LABEL_7;
  }
  int v12 = -[BWDeferredProcessingContainerManager _queryContainerStatus:captureRequestIdentifier:status:]((uint64_t)self, (uint64_t)a3, (uint64_t)a4, &v20);
  int v21 = v12;
  if ((v12 + 16157) < 5 || v12 == -16159)
  {
    uint64_t v13 = 0;
    int v14 = -16138;
LABEL_7:
    int v21 = v14;
    goto LABEL_8;
  }
  if (v12)
  {
    if (v12 == -16138)
    {
      uint64_t v13 = 0;
      goto LABEL_8;
    }
    FigDebugAssert3();
  }
  __int16 v18 = 0;
  uint64_t v16 = -[BWDeferredContainerManagerBase _containerURLForApplicationID:captureRequestIdentifier:processingContainer:exists:isDirectory:resolvedApplicationID:]((uint64_t)self, a3, (uint64_t)a4, 1, (char *)&v18 + 1, &v18, &v19);
  if (v20 != 1
    || (uint64_t v13 = -[BWDeferredProcessingContainerManager _copyRemoteContainer:captureRequestIdentifier:baseFolderURL:err:]((uint64_t)self, (uint64_t)v19, (uint64_t)a4, (uint64_t)v16, &v21)) == 0)
  {
    if (HIBYTE(v18) && (_BYTE)v18)
    {
      v17 = [BWDeferredProcessingContainer alloc];
      uint64_t v13 = [(BWDeferredProcessingContainer *)v17 initWithApplicationID:v19 captureRequestIdentifier:a4 baseFolderURL:v16 openForPeeking:v7 err:&v21];
    }
    else
    {
      uint64_t v13 = 0;
      int v21 = FigSignalErrorAt();
    }
  }
LABEL_8:

  if (a6) {
    *a6 = v21;
  }
  if (*v11 == 1) {
    kdebug_trace();
  }
  return v13;
}

- (void)releaseProcessingContainer:(id)a3
{
  if (a3)
  {
    uint64_t v5 = [a3 applicationID];
    uint64_t v6 = [a3 captureRequestIdentifier];
    int v7 = [a3 isRemote];

    if (v7)
    {
      -[BWDeferredProcessingContainerManager _releaseRemoteContainer:captureRequestIdentifier:]((uint64_t)self, v5, v6);
    }
  }
  else
  {
    FigDebugAssert3();
  }
}

- (int)deleteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4
{
  int v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  uint64_t v8 = -[BWDeferredProcessingContainerManager _copyXPCContainerManager]((uint64_t)self);
  if (v8)
  {
    uint64_t v9 = (const void *)v8;
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    int v12 = *(uint64_t (**)(const void *, id, id))(v11 + 40);
    if (v12) {
      int v13 = v12(v9, a3, a4);
    }
    else {
      int v13 = -12782;
    }
    CFRelease(v9);
  }
  else
  {
    FigDebugAssert3();
    int v13 = -16137;
  }
  if (*v7 == 1) {
    kdebug_trace();
  }
  return v13;
}

- (int)waitForShaderCompilation
{
  v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  uint64_t v4 = -[BWDeferredProcessingContainerManager _copyXPCContainerManager]((uint64_t)self);
  if (v4)
  {
    uint64_t v5 = (const void *)v4;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(uint64_t (**)(const void *))(v7 + 48);
    if (v8) {
      int v9 = v8(v5);
    }
    else {
      int v9 = -12782;
    }
    CFRelease(v5);
  }
  else
  {
    FigDebugAssert3();
    int v9 = -16137;
  }
  if (*v3 == 1) {
    kdebug_trace();
  }
  return v9;
}

@end