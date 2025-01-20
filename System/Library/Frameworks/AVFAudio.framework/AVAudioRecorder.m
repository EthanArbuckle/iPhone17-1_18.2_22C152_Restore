@interface AVAudioRecorder
- (AVAudioFormat)format;
- (AVAudioRecorder)init;
- (AVAudioRecorder)initWithURL:(NSURL *)url format:(AVAudioFormat *)format error:(NSError *)outError;
- (AVAudioRecorder)initWithURL:(NSURL *)url settings:(NSDictionary *)settings error:(NSError *)outError;
- (AVAudioSession)audioSession;
- (AudioRecorderImpl)impl;
- (BOOL)deleteRecording;
- (BOOL)instantaneousMetering;
- (BOOL)isMeteringEnabled;
- (BOOL)isRecording;
- (BOOL)prepareToRecord;
- (BOOL)record;
- (BOOL)recordAtTime:(NSTimeInterval)time;
- (BOOL)recordAtTime:(NSTimeInterval)time forDuration:(NSTimeInterval)duration;
- (BOOL)recordForDuration:(NSTimeInterval)duration;
- (NSArray)channelAssignments;
- (NSDictionary)settings;
- (NSTimeInterval)currentTime;
- (NSTimeInterval)deviceCurrentTime;
- (NSURL)url;
- (float)averagePowerForChannel:(NSUInteger)channelNumber;
- (float)peakPowerForChannel:(NSUInteger)channelNumber;
- (id)baseInit;
- (id)delegate;
- (int)processToTap;
- (void)beginInterruption;
- (void)dealloc;
- (void)endInterruption;
- (void)endInterruptionWithFlags:(id)a3;
- (void)finalize;
- (void)finishedRecording:(id)a3;
- (void)handleInterruption:(id)a3;
- (void)pause;
- (void)privCommonCleanup;
- (void)privRemoveSessionPropertyListeners;
- (void)privSetDelegate:(id)a3;
- (void)setAudioSession:(id)a3;
- (void)setChannelAssignments:(NSArray *)channelAssignments;
- (void)setDelegate:(id)delegate;
- (void)setInstantaneousMetering:(BOOL)a3;
- (void)setMeteringEnabled:(BOOL)meteringEnabled;
- (void)setProcessToTap:(int)a3;
- (void)stop;
- (void)updateMeters;
@end

@implementation AVAudioRecorder

- (void)handleInterruption:(id)a3
{
  v4 = (void *)[a3 userInfo];
  v5 = (void *)[v4 objectForKey:*MEMORY[0x1E4F4E860]];
  v6 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v6);
  impl = (AVAudioRecorder *)self->_impl;
  v8 = (void *)MEMORY[0x19F3AC180]();
  objc_loadWeak((id *)&impl->super.isa);
  if (v5 && [v5 unsignedLongValue] == 1)
  {
    if (BYTE2(impl[11]._impl))
    {
      closeFile((uint64_t)impl, v9);
      BYTE1(impl[15].super.isa) = 1;
      LOWORD(impl[11]._impl) = 0;
      BYTE2(impl[11]._impl) = 0;
      if (objc_opt_respondsToSelector()) {
        [(AVAudioRecorder *)self performSelectorOnMainThread:sel_beginInterruption withObject:0 waitUntilDone:0];
      }
    }
  }
  else if (BYTE1(impl[15].super.isa))
  {
    [impl[15]._impl setActive:1 error:0];
    stopAndDisposeRecordQueue(impl, 0);
    if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
    {
      v10 = (void *)[v4 objectForKey:*MEMORY[0x1E4F4E840]];
      if (v10) {
        BOOL v11 = [v10 unsignedLongValue] == 1;
      }
      else {
        BOOL v11 = 0;
      }
      -[AVAudioRecorder performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_endInterruptionWithFlags_, [objc_alloc(NSNumber) initWithUnsignedInt:v11], 0);
    }
    else if (objc_opt_respondsToSelector())
    {
      [(AVAudioRecorder *)self performSelectorOnMainThread:sel_endInterruption withObject:0 waitUntilDone:0];
    }
    BYTE1(impl[15].super.isa) = 0;
  }

  os_unfair_lock_unlock(v6);
}

- (void)setInstantaneousMetering:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  impl = self->_impl;
  *((unsigned char *)impl + 191) = v3;
  v7 = (OpaqueAudioQueue *)*((void *)impl + 14);
  if (v7)
  {
    BOOL inData = v3;
    AudioQueueSetProperty(v7, 0x71696E6Du, &inData, 4u);
  }
  os_unfair_lock_unlock(v5);
}

- (BOOL)instantaneousMetering
{
  v2 = self;
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  LOBYTE(v2) = *((unsigned char *)v2->_impl + 191);
  os_unfair_lock_unlock(v3);
  return (char)v2;
}

- (void)setAudioSession:(id)a3
{
  id v5 = a3;
  [(AVAudioRecorder *)self stop];
  v6 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v6);
  [(AVAudioRecorder *)self privRemoveSessionPropertyListeners];
  impl = (AudioRecorderImpl *)self->_impl;

  impl->var33 = a3;
  tryToSetRecorderSessionListener((uint64_t)self, impl);

  os_unfair_lock_unlock(v6);
}

- (AVAudioSession)audioSession
{
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  v4 = (AVAudioSession *)*((id *)self->_impl + 31);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (int)processToTap
{
  v2 = self;
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  LODWORD(v2) = *((_DWORD *)v2->_impl + 61);
  os_unfair_lock_unlock(v3);
  return (int)v2;
}

- (void)setProcessToTap:(int)a3
{
  id v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  *((_DWORD *)self->_impl + 61) = a3;

  os_unfair_lock_unlock(v5);
}

- (void)setChannelAssignments:(NSArray *)channelAssignments
{
  id v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  impl = (AudioRecorderImpl *)self->_impl;
  var6 = (NSArray *)impl->var6;
  if (var6 != channelAssignments)
  {
    impl->var6 = (id)[(NSArray *)channelAssignments copy];
    if (var6) {

    }
    makeChannelAssignments(impl);
    if (impl->var10)
    {
      uint64_t v8 = [impl->var6 count];
      v9 = malloc_type_malloc(16 * v8, 0x902FE7C0uLL);
      v10 = v9;
      if (v8)
      {
        uint64_t v11 = 0;
        v12 = v9 + 2;
        do
        {
          id v13 = [(NSArray *)channelAssignments objectAtIndex:v11];
          *((void *)v12 - 1) = [v13 owningPortUID];
          _DWORD *v12 = [v13 channelNumber];
          v12 += 4;
          ++v11;
        }
        while (v8 != v11);
      }
      AudioQueueSetProperty(impl->var10, 0x61716361u, v10, 16 * v8);
      free(v10);
    }
  }

  os_unfair_lock_unlock(v5);
}

- (NSArray)channelAssignments
{
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  v4 = (NSArray *)*((void *)self->_impl + 6);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (void)endInterruption
{
  BOOL v3 = (void *)MEMORY[0x19F3AC180](self, a2);
  objc_msgSend(-[AVAudioRecorder delegate](self, "delegate"), "audioRecorderEndInterruption:", self);
}

- (void)endInterruptionWithFlags:(id)a3
{
  v4 = (void *)MEMORY[0x19F3AC180](self, a2);
  id v5 = [(AVAudioRecorder *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v5, "audioRecorderEndInterruption:withOptions:", self, objc_msgSend(a3, "unsignedIntegerValue"));
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v5, "audioRecorderEndInterruption:withFlags:", self, objc_msgSend(a3, "unsignedIntegerValue"));
  }
}

- (void)beginInterruption
{
  BOOL v3 = (void *)MEMORY[0x19F3AC180](self, a2);
  objc_msgSend(-[AVAudioRecorder delegate](self, "delegate"), "audioRecorderBeginInterruption:", self);
}

- (float)averagePowerForChannel:(NSUInteger)channelNumber
{
  id v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  impl = self->_impl;
  uint64_t v7 = impl[24];
  if (v7 && *((unsigned int *)impl + 23) > channelNumber) {
    float v8 = *(float *)(v7 + 8 * channelNumber);
  }
  else {
    float v8 = -160.0;
  }
  os_unfair_lock_unlock(v5);
  return v8;
}

- (float)peakPowerForChannel:(NSUInteger)channelNumber
{
  id v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  impl = self->_impl;
  uint64_t v7 = impl[24];
  if (v7 && *((unsigned int *)impl + 23) > channelNumber) {
    float v8 = *(float *)(v7 + 8 * channelNumber + 4);
  }
  else {
    float v8 = -160.0;
  }
  os_unfair_lock_unlock(v5);
  return v8;
}

- (void)updateMeters
{
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  impl = (unsigned int *)self->_impl;
  uint64_t v5 = impl[23];
  v6 = (void *)*((void *)impl + 24);
  if (!v6)
  {
    v6 = malloc_type_calloc(impl[23], 8uLL, 0x100004000313F17uLL);
    *((void *)impl + 24) = v6;
  }
  uint64_t v7 = (OpaqueAudioQueue *)*((void *)impl + 14);
  if (v7 && *((unsigned char *)impl + 190))
  {
    UInt32 ioDataSize = 8 * v5;
    if (AudioQueueGetProperty(v7, 0x61716D64u, v6, &ioDataSize)) {
      BOOL v8 = v5 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      v9 = (void *)*((void *)impl + 24);
      size_t v10 = 8 * v5;
LABEL_12:
      memset_pattern16(v9, &unk_19D8B1E80, v10);
    }
  }
  else if (v5)
  {
    size_t v10 = 8 * v5;
    v9 = v6;
    goto LABEL_12;
  }
  os_unfair_lock_unlock(v3);
}

- (void)setMeteringEnabled:(BOOL)meteringEnabled
{
  BOOL v3 = meteringEnabled;
  uint64_t v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  impl = self->_impl;
  *((unsigned char *)impl + 190) = v3;
  uint64_t v7 = (OpaqueAudioQueue *)*((void *)impl + 14);
  if (v7)
  {
    BOOL inData = v3;
    if (!AudioQueueSetProperty(v7, 0x61716D65u, &inData, 4u)) {
      *((unsigned char *)impl + 190) = v3;
    }
  }
  os_unfair_lock_unlock(v5);
}

- (BOOL)isMeteringEnabled
{
  v2 = self;
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  LOBYTE(v2) = *((unsigned char *)v2->_impl + 190);
  os_unfair_lock_unlock(v3);
  return (char)v2;
}

- (void)setDelegate:(id)delegate
{
  uint64_t v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  [(AVAudioRecorder *)self privSetDelegate:delegate];

  os_unfair_lock_unlock(v5);
}

- (id)delegate
{
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  id Weak = objc_loadWeak((id *)self->_impl);
  os_unfair_lock_unlock(v3);
  return Weak;
}

- (NSTimeInterval)deviceCurrentTime
{
  return (double)mach_absolute_time() * 0.0000000416666667;
}

- (NSTimeInterval)currentTime
{
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  impl = self->_impl;
  double v5 = *((double *)impl + 8);
  v6 = (OpaqueAudioQueue *)*((void *)impl + 14);
  if (v6 && !AudioQueueGetCurrentTime(v6, 0, &v9, 0)) {
    *((void *)impl + 18) = *(void *)&v9.mSampleTime;
  }
  NSTimeInterval v7 = *((double *)impl + 18) / v5;
  os_unfair_lock_unlock(v3);
  return v7;
}

- (BOOL)deleteRecording
{
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  impl = self->_impl;
  if (*((unsigned char *)impl + 184)) {
    goto LABEL_2;
  }
  uint64_t v5 = [*((id *)impl + 5) path];
  if (!v5) {
    goto LABEL_3;
  }
  if (!*((unsigned char *)impl + 189))
  {
LABEL_2:
    LOBYTE(v5) = 0;
  }
  else
  {
    id v7 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", v5, &v7);
    LOBYTE(v5) = v7 == 0;
    if (v7) {

    }
    else {
      *((unsigned char *)impl + 189) = 0;
    }
  }
LABEL_3:
  os_unfair_lock_unlock(v3);
  return v5;
}

- (void)stop
{
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  impl = (AVAudioRecorder *)self->_impl;
  if (stopAndDisposeRecordQueue(impl, (AudioRecorderImpl *)1))
  {
    uint64_t v5 = [objc_alloc(NSNumber) initWithBool:BYTE4(impl[11]._impl)];
    v6 = self;
    [(AVAudioRecorder *)self performSelectorOnMainThread:sel_finishedRecording_ withObject:v5 waitUntilDone:0];
  }

  os_unfair_lock_unlock(v3);
}

- (void)pause
{
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  impl = (AudioQueueRef *)self->_impl;
  if (*((unsigned char *)impl + 186))
  {
    AudioQueuePause(impl[14]);
    *((unsigned char *)impl + 186) = 0;
  }

  os_unfair_lock_unlock(v3);
}

- (BOOL)recordAtTime:(NSTimeInterval)time forDuration:(NSTimeInterval)duration
{
  uint64_t v5 = self;
  v8.mSampleTime = 0.0;
  memset(&v8.mRateScalar, 0, 48);
  v8.mFlags = 2;
  v8.mHostTime = (unint64_t)(time * 24000000.0);
  v6 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v6);
  LOBYTE(v5) = recordQueue(v5, (AudioFileID *)v5->_impl, duration, &v8) == 0;
  os_unfair_lock_unlock(v6);
  return (char)v5;
}

- (BOOL)recordForDuration:(NSTimeInterval)duration
{
  v4 = self;
  uint64_t v5 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v5);
  LOBYTE(v4) = recordQueue(v4, (AudioFileID *)v4->_impl, duration, 0) == 0;
  os_unfair_lock_unlock(v5);
  return (char)v4;
}

- (BOOL)recordAtTime:(NSTimeInterval)time
{
  BOOL v3 = self;
  v6.mSampleTime = 0.0;
  memset(&v6.mRateScalar, 0, 48);
  v6.mFlags = 2;
  v6.mHostTime = (unint64_t)(time * 24000000.0);
  v4 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v4);
  LOBYTE(v3) = recordQueue(v3, (AudioFileID *)v3->_impl, -1.0, &v6) == 0;
  os_unfair_lock_unlock(v4);
  return (char)v3;
}

- (BOOL)record
{
  v2 = self;
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  LOBYTE(v2) = recordQueue(v2, (AudioFileID *)v2->_impl, -1.0, 0) == 0;
  os_unfair_lock_unlock(v3);
  return (char)v2;
}

- (BOOL)prepareToRecord
{
  v2 = self;
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  LOBYTE(v2) = prepareToRecordQueue(v2, (AudioFileID *)v2->_impl) == 0;
  os_unfair_lock_unlock(v3);
  return (char)v2;
}

- (AVAudioFormat)format
{
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  v4 = (AVAudioFormat *)*((void *)self->_impl + 4);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (NSDictionary)settings
{
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  v4 = (NSDictionary *)*((void *)self->_impl + 3);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (NSURL)url
{
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  v4 = (NSURL *)*((void *)self->_impl + 5);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (BOOL)isRecording
{
  v2 = self;
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  LOBYTE(v2) = *((unsigned char *)v2->_impl + 186);
  os_unfair_lock_unlock(v3);
  return (char)v2;
}

- (AVAudioRecorder)initWithURL:(NSURL *)url settings:(NSDictionary *)settings error:(NSError *)outError
{
  AudioTimeStamp v8 = self;
  if (outError) {
    *outError = 0;
  }
  [(AVAudioRecorder *)self baseInit];
  impl = (char *)v8->_impl;
  *((void *)impl + 5) = url;
  size_t v10 = url;
  *((void *)impl + 2) = settings;
  uint64_t v11 = settings;
  id v12 = [(NSDictionary *)settings objectForKey:@"AVAudioFileTypeKey"];
  if (v12) {
    int v13 = [v12 unsignedIntValue];
  }
  else {
    int v13 = fileTypeFromExtension([(NSString *)[(NSURL *)url path] pathExtension]);
  }
  *((_DWORD *)impl + 14) = v13;
  int v14 = asbdFromSettingsAndFileType2(settings, 0, v13, (AudioStreamBasicDescription *)(impl + 64));
  if (v14)
  {
    if (outError) {
      *outError = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:0];
    }

    return 0;
  }
  return v8;
}

- (AVAudioRecorder)initWithURL:(NSURL *)url format:(AVAudioFormat *)format error:(NSError *)outError
{
  if (outError)
  {
    *outError = 0;
    if (!format)
    {
      *outError = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
LABEL_8:

      return 0;
    }
  }
  else if (!format)
  {
    goto LABEL_8;
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", -[AVAudioFormat settings](format, "settings"));

  return [(AVAudioRecorder *)self initWithURL:url settings:v8 error:outError];
}

- (id)baseInit
{
  BOOL v3 = (AudioRecorderImpl *)malloc_type_calloc(1uLL, 0x108uLL, 0x10B00404ABBA035uLL);
  self->_impl = v3;
  objc_storeWeak(&v3->var1, self);
  v3->var3 = 0;
  v3->var4 = 0;
  v3->var2 = 0;
  v4 = (void *)[MEMORY[0x1E4F4E9F8] sharedInstance];
  v3->var33 = v4;
  id v5 = v4;
  tryToSetRecorderSessionListener((uint64_t)self, v3);
  return self;
}

- (void)dealloc
{
  impl = self->_impl;
  if (impl)
  {
    os_unfair_lock_lock((os_unfair_lock_t)impl + 64);
    [(AVAudioRecorder *)self privCommonCleanup];

    os_unfair_lock_unlock((os_unfair_lock_t)impl + 64);
    v4 = self->_impl;
    if (v4)
    {
      free(v4);
      self->_impl = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAudioRecorder;
  [(AVAudioRecorder *)&v5 dealloc];
}

- (void)finalize
{
  BOOL v3 = (os_unfair_lock_s *)((char *)self->_impl + 256);
  os_unfair_lock_lock(v3);
  if (self->_impl) {
    [(AVAudioRecorder *)self privCommonCleanup];
  }
  os_unfair_lock_unlock(v3);
  impl = self->_impl;
  if (impl)
  {
    free(impl);
    self->_impl = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAudioRecorder;
  [(AVAudioRecorder *)&v5 finalize];
}

- (void)privRemoveSessionPropertyListeners
{
  impl = self->_impl;
  if (*((unsigned char *)impl + 240))
  {
    v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x1E4F4E838] object:impl[31]];
  }
  *((unsigned char *)impl + 240) = 0;
}

- (void)privCommonCleanup
{
  impl = (AVAudioRecorder *)self->_impl;
  [(AVAudioRecorder *)self privSetDelegate:0];
  __dmb(0xBu);
  [(AVAudioRecorder *)self privRemoveSessionPropertyListeners];
  stopAndDisposeRecordQueue(impl, (AudioRecorderImpl *)1);
  free(impl[12].super.isa);
  free(impl[11].super.isa);

  impl[15]._impl = 0;

  objc_storeWeak(&impl->_impl, 0);
}

- (void)privSetDelegate:(id)a3
{
  impl = (AudioRecorderImpl *)self->_impl;
  if (!a3 || objc_loadWeak((id *)self->_impl) != a3)
  {
    objc_storeWeak(&impl->var0, a3);
    tryToSetRecorderSessionListener((uint64_t)self, impl);
  }
}

- (void)finishedRecording:(id)a3
{
  v4 = (void *)MEMORY[0x19F3AC180](self, a2);
  id v5 = [(AVAudioRecorder *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "audioRecorderDidFinishRecording:successfully:", self, objc_msgSend(a3, "BOOLValue"));
  }
}

- (AudioRecorderImpl)impl
{
  return (AudioRecorderImpl *)self->_impl;
}

- (AVAudioRecorder)init
{
  return 0;
}

@end