@interface AVAudioUnit
+ (void)instantiateWithComponentDescription:(AudioComponentDescription *)audioComponentDescription options:(AudioComponentInstantiationOptions)options completionHandler:(void *)completionHandler;
- (AVAudioUnit)initWithAudioComponentDescription:(AudioComponentDescription *)a3;
- (AudioComponentDescription)audioComponentDescription;
- (AudioUnit)audioUnit;
- (BOOL)loadAudioUnitPresetAtURL:(NSURL *)url error:(NSError *)outError;
- (BOOL)setValue:(float)a3 forParam:(unsigned int)a4;
- (NSString)manufacturerName;
- (NSString)name;
- (NSUInteger)version;
- (float)valueForParam:(unsigned int)a3;
@end

@implementation AVAudioUnit

- (float)valueForParam:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v8, (uint64_t)self->super._impl);
  float v7 = 0.0;
  (*(void (**)(void *, uint64_t, void, void, float *))(*(void *)self->super._impl + 136))(self->super._impl, v3, 0, 0, &v7);
  float v5 = v7;
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  return v5;
}

- (BOOL)setValue:(float)a3 forParam:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->super._impl);
  char v7 = (*(uint64_t (**)(void *, uint64_t, void, void, float))(*(void *)self->super._impl + 128))(self->super._impl, v4, 0, 0, a3);
  if (v12) {
    std::recursive_mutex::unlock(v11);
  }
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  return v7;
}

- (NSUInteger)version
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super._impl);
  UInt32 outVersion = 0;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)self->super._impl + 256))();
  long long v4 = *(_OWORD *)v3;
  v8.componentFlagsMask = *(_DWORD *)(v3 + 16);
  *(_OWORD *)&v8.componentType = v4;
  Next = AudioComponentFindNext(0, &v8);
  if (Next)
  {
    AudioComponentGetVersion(Next, &outVersion);
    NSUInteger v6 = outVersion;
  }
  else
  {
    NSUInteger v6 = 0;
  }
  if (v13) {
    std::recursive_mutex::unlock(v12);
  }
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  return v6;
}

- (NSString)manufacturerName
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super._impl);
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)self->super._impl + 256))();
  long long v4 = *(_OWORD *)v3;
  inDesc.componentFlagsMask = *(_DWORD *)(v3 + 16);
  *(_OWORD *)&inDesc.componentType = v4;
  Next = AudioComponentFindNext(0, &inDesc);
  if (Next && (CFStringRef outName = 0, AudioComponentCopyName(Next, &outName), outName))
  {
    NSUInteger v6 = (void *)[(__CFString *)(id)outName componentsSeparatedByString:@": "];
    CFRelease(outName);
    if (v6) {
      NSUInteger v6 = (void *)[v6 objectAtIndex:0];
    }
  }
  else
  {
    NSUInteger v6 = 0;
  }
  if (v13) {
    std::recursive_mutex::unlock(v12);
  }
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  return (NSString *)v6;
}

- (NSString)name
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super._impl);
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)self->super._impl + 256))();
  long long v4 = *(_OWORD *)v3;
  inDesc.componentFlagsMask = *(_DWORD *)(v3 + 16);
  *(_OWORD *)&inDesc.componentType = v4;
  Next = AudioComponentFindNext(0, &inDesc);
  if (Next && (CFStringRef outName = 0, AudioComponentCopyName(Next, &outName), outName))
  {
    NSUInteger v6 = (void *)[(__CFString *)(id)outName componentsSeparatedByString:@": "];
    CFRelease(outName);
    if (v6) {
      NSUInteger v6 = (void *)[v6 objectAtIndex:1];
    }
  }
  else
  {
    NSUInteger v6 = 0;
  }
  if (v13) {
    std::recursive_mutex::unlock(v12);
  }
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  return (NSString *)v6;
}

- (AudioComponentDescription)audioComponentDescription
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super._impl);
  result = (AudioComponentDescription *)(*(uint64_t (**)(void *))(*(void *)self->super._impl + 256))(self->super._impl);
  *retstr = *result;
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8)
  {
    NSUInteger v6 = v7;
    std::recursive_mutex::unlock(v6);
  }
  return result;
}

- (AudioUnit)audioUnit
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  uint64_t v3 = (OpaqueAudioComponentInstance *)(*(uint64_t (**)(void *))(*(void *)self->super._impl + 224))(self->super._impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (BOOL)loadAudioUnitPresetAtURL:(NSURL *)url error:(NSError *)outError
{
  if (outError) {
    *outError = 0;
  }
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:url];
  if (!v13)
  {
    if (outError)
    {
      char v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F28760];
      uint64_t v8 = -50;
      goto LABEL_9;
    }
    return 0;
  }
  int v6 = (*(uint64_t (**)(void *, void, void, void, uint64_t *, uint64_t))(*(void *)self->super._impl
                                                                                     + 160))(self->super._impl, 0, 0, 0, &v13, 8);
  if (v6)
  {
    if (outError)
    {
      uint64_t v7 = *MEMORY[0x1E4F28760];
      uint64_t v8 = v6;
      char v9 = (void *)MEMORY[0x1E4F28C58];
LABEL_9:
      char v10 = (NSError *)[v9 errorWithDomain:v7 code:v8 userInfo:0];
      BOOL result = 0;
      *outError = v10;
      return result;
    }
    return 0;
  }
  v12.mAudioUnit = [(AVAudioUnit *)self audioUnit];
  v12.mParameterID = -1;
  AUParameterListenerNotify(0, 0, &v12);
  return 1;
}

- (AVAudioUnit)initWithAudioComponentDescription:(AudioComponentDescription *)a3
{
}

+ (void)instantiateWithComponentDescription:(AudioComponentDescription *)audioComponentDescription options:(AudioComponentInstantiationOptions)options completionHandler:(void *)completionHandler
{
  uint64_t v8 = objc_opt_class();
  Next = AudioComponentFindNext(0, audioComponentDescription);
  if (Next)
  {
    inCompletionHandler[0] = MEMORY[0x1E4F143A8];
    inCompletionHandler[1] = 3221225472;
    inCompletionHandler[2] = __77__AVAudioUnit_instantiateWithComponentDescription_options_completionHandler___block_invoke;
    inCompletionHandler[3] = &unk_1E5965DC8;
    long long v13 = *(_OWORD *)&audioComponentDescription->componentType;
    UInt32 componentFlagsMask = audioComponentDescription->componentFlagsMask;
    inCompletionHandler[4] = v8;
    inCompletionHandler[5] = completionHandler;
    AudioComponentInstantiate(Next, options, inCompletionHandler);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-3000 userInfo:0];
    char v11 = (void (*)(void *, void, uint64_t))*((void *)completionHandler + 2);
    v11(completionHandler, 0, v10);
  }
}

uint64_t __77__AVAudioUnit_instantiateWithComponentDescription_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a2) {
    operator new();
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:a3 userInfo:0];
  float v5 = *(uint64_t (**)(uint64_t, void, uint64_t))(v3 + 16);

  return v5(v3, 0, v4);
}

@end