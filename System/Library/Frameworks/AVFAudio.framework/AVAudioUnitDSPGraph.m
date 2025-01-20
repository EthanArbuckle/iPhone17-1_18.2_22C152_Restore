@interface AVAudioUnitDSPGraph
- (AVAudioUnitDSPGraph)init;
- (BOOL)loadAudioDSPManager;
- (BOOL)loadAudioUnitProcessingStripAtURL:(id)a3 error:(id *)a4;
- (BOOL)loadDSPGraphAtURL:(id)a3 error:(id *)a4;
- (NSURL)auProcessingStripURL;
- (NSURL)dspGraphURL;
@end

@implementation AVAudioUnitDSPGraph

- (NSURL)auProcessingStripURL
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  p_impl = &self->super.super._impl;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super.super._impl);
  int v3 = (*(uint64_t (**)(void *, uint64_t, void, void, CFTypeRef *, uint64_t))(*(void *)*p_impl + 152))(*p_impl, 1635087216, 0, 0, &cf, 8);
  if (v3)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "AVAudioUnitDSPGraph.mm";
      __int16 v14 = 1024;
      int v15 = 130;
      __int16 v16 = 1024;
      int v17 = v3;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d unable to get property kAUDSPGraphProperty_AUStrip %i", buf, 0x18u);
    }
  }
  else if (cf)
  {
    v5 = (NSURL *)[MEMORY[0x1E4F1CB10] fileURLWithPath:(id)CFMakeCollectable(cf)];
    goto LABEL_9;
  }
  v5 = 0;
LABEL_9:
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  return v5;
}

- (NSURL)dspGraphURL
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  p_impl = &self->super.super._impl;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super.super._impl);
  int v3 = (*(uint64_t (**)(void *, uint64_t, void, void, CFTypeRef *, uint64_t))(*(void *)*p_impl + 152))(*p_impl, 1685287015, 0, 0, &cf, 8);
  if (v3)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "AVAudioUnitDSPGraph.mm";
      __int16 v14 = 1024;
      int v15 = 115;
      __int16 v16 = 1024;
      int v17 = v3;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d unable to get property kAUDSPGraphProperty_GraphTextFilePath %i", buf, 0x18u);
    }
  }
  else if (cf)
  {
    v5 = (NSURL *)[MEMORY[0x1E4F1CB10] fileURLWithPath:(id)CFMakeCollectable(cf)];
    goto LABEL_9;
  }
  v5 = 0;
LABEL_9:
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  return v5;
}

- (BOOL)loadAudioUnitProcessingStripAtURL:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:a3 error:a4];
  if (!v14) {
    return 0;
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super.super._impl);
  int v6 = (*(uint64_t (**)(void *, uint64_t, void, void, uint64_t *, uint64_t))(*(void *)self->super.super._impl
                                                                                      + 160))(self->super.super._impl, 1635087216, 0, 0, &v14, 8);
  BOOL v7 = v6 == 0;
  if (v6) {
    BOOL v8 = a4 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreaudio.avfaudio" code:v6 userInfo:0];
  }
  if (v13) {
    std::recursive_mutex::unlock(v12);
  }
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  return v7;
}

- (BOOL)loadDSPGraphAtURL:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = 0;
    uint64_t v6 = [a3 relativePath];
    if (!v6)
    {
      BOOL v7 = 0;
      *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreaudio.avfaudio" code:-50 userInfo:0];
      return v7;
    }
  }
  else
  {
    uint64_t v6 = [a3 relativePath];
    if (!v6) {
      return 0;
    }
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v12, (uint64_t)self->super.super._impl);
  uint64_t v11 = v6;
  int v8 = (*(uint64_t (**)(void *, uint64_t, void, void, uint64_t *, uint64_t))(*(void *)self->super.super._impl
                                                                                      + 160))(self->super.super._impl, 1685287015, 0, 0, &v11, 8);
  BOOL v7 = v8 == 0;
  if (v8) {
    BOOL v9 = a4 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreaudio.avfaudio" code:v8 userInfo:0];
  }
  if (v15) {
    std::recursive_mutex::unlock(v14);
  }
  if (v13) {
    std::recursive_mutex::unlock(v12);
  }
  return v7;
}

- (BOOL)loadAudioDSPManager
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AVAudioUnitDSPGraph_loadAudioDSPManager__block_invoke;
  block[3] = &unk_1E5965E38;
  block[4] = &v5;
  if (-[AVAudioUnitDSPGraph loadAudioDSPManager]::once != -1) {
    dispatch_once(&-[AVAudioUnitDSPGraph loadAudioDSPManager]::once, block);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __42__AVAudioUnitDSPGraph_loadAudioDSPManager__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v2 = dlopen("/System/Library/Frameworks/AudioToolbox.framework/libAudioDSP.dylib", 1);
  int v3 = (uint64_t (*)(void))dlsym(v2, "GetAudioDSPManager");
  if (v3)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ42__AVAudioUnitDSPGraph_loadAudioDSPManager_EUb_E8instance, memory_order_acquire) & 1) == 0)
    {
      uint64_t v6 = v3;
      if (__cxa_guard_acquire(&_ZGVZZ42__AVAudioUnitDSPGraph_loadAudioDSPManager_EUb_E8instance))
      {
        _ZZZ42__AVAudioUnitDSPGraph_loadAudioDSPManager_EUb_E8instance = v6();
        __cxa_guard_release(&_ZGVZZ42__AVAudioUnitDSPGraph_loadAudioDSPManager_EUb_E8instance);
      }
    }
    v4 = *(void (**)(void))(*(void *)_ZZZ42__AVAudioUnitDSPGraph_loadAudioDSPManager_EUb_E8instance + 24);
    v4();
  }
  else
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      char v8 = "AVAudioUnitDSPGraph.mm";
      __int16 v9 = 1024;
      int v10 = 51;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Unable to call RegisterAudioUnits_Internal from libAudioDSP.dylib.", (uint8_t *)&v7, 0x12u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (AVAudioUnitDSPGraph)init
{
  if (![(AVAudioUnitDSPGraph *)self loadAudioDSPManager]) {
    return 0;
  }
  int v6 = 0;
  long long v5 = *(_OWORD *)"xfuagpsdlppa";
  v4.receiver = self;
  v4.super_class = (Class)AVAudioUnitDSPGraph;
  return [(AVAudioUnit *)&v4 initWithAudioComponentDescription:&v5];
}

@end