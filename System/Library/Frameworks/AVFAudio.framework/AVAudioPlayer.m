@interface AVAudioPlayer
- (AVAudioFormat)format;
- (AVAudioPlayer)init;
- (AVAudioPlayer)initWithContentsOfURL:(NSURL *)url error:(NSError *)outError;
- (AVAudioPlayer)initWithContentsOfURL:(NSURL *)url fileTypeHint:(NSString *)utiString error:(NSError *)outError;
- (AVAudioPlayer)initWithData:(NSData *)data error:(NSError *)outError;
- (AVAudioPlayer)initWithData:(NSData *)data fileTypeHint:(NSString *)utiString error:(NSError *)outError;
- (BOOL)enableRate;
- (BOOL)isMeteringEnabled;
- (BOOL)isPlaying;
- (BOOL)mixToUplink;
- (BOOL)play;
- (BOOL)playAtTime:(NSTimeInterval)time;
- (BOOL)prepareToPlay;
- (NSArray)channelAssignments;
- (NSData)data;
- (NSDictionary)settings;
- (NSInteger)numberOfLoops;
- (NSString)currentDevice;
- (NSTimeInterval)currentTime;
- (NSTimeInterval)deviceCurrentTime;
- (NSTimeInterval)duration;
- (NSUInteger)numberOfChannels;
- (NSURL)url;
- (float)averagePowerForChannel:(NSUInteger)channelNumber;
- (float)pan;
- (float)peakPowerForChannel:(NSUInteger)channelNumber;
- (float)rate;
- (float)volume;
- (id)STSLabel;
- (id)audioSession;
- (id)delegate;
- (id)impl;
- (id)initBase;
- (void)beginInterruption;
- (void)dealloc;
- (void)decodeError:(id)a3;
- (void)endInterruption;
- (void)endInterruptionWithFlags:(id)a3;
- (void)finalize;
- (void)finishedPlaying:(id)a3;
- (void)handleInterruption:(id)a3;
- (void)pause;
- (void)privRemoveSessionListener;
- (void)setAudioSession:(id)a3;
- (void)setChannelAssignments:(NSArray *)channelAssignments;
- (void)setCurrentDevice:(NSString *)currentDevice;
- (void)setCurrentTime:(NSTimeInterval)currentTime;
- (void)setDelegate:(id)delegate;
- (void)setEnableRate:(BOOL)enableRate;
- (void)setMeteringEnabled:(BOOL)meteringEnabled;
- (void)setMixToUplink:(BOOL)a3;
- (void)setNumberOfLoops:(NSInteger)numberOfLoops;
- (void)setPan:(float)pan;
- (void)setRate:(float)rate;
- (void)setSTSLabel:(id)a3;
- (void)setVolume:(float)volume;
- (void)setVolume:(float)volume fadeDuration:(NSTimeInterval)duration;
- (void)stop;
- (void)updateMeters;
@end

@implementation AVAudioPlayer

- (AVAudioPlayer)initWithContentsOfURL:(NSURL *)url error:(NSError *)outError
{
  return [(AVAudioPlayer *)self initWithContentsOfURL:url fileTypeHint:0 error:outError];
}

- (AVAudioPlayer)initWithContentsOfURL:(NSURL *)url fileTypeHint:(NSString *)utiString error:(NSError *)outError
{
  v7 = [(AVAudioPlayer *)self initBase];
  v8 = v7;
  if (v7)
  {
    if (outError)
    {
      *outError = 0;
      if (!url)
      {
        *outError = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10875 userInfo:0];
LABEL_7:
        v10 = v8;
        return 0;
      }
    }
    else if (!url)
    {
      goto LABEL_7;
    }
    *((void *)v7->_impl + 3) = url;
    v9 = url;
    operator new();
  }
  return v8;
}

- (id)initBase
{
  v6.receiver = self;
  v6.super_class = (Class)AVAudioPlayer;
  v2 = [(AVAudioPlayer *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(AudioPlayerImpl);
    v2->_impl = v3;
    if (!v3)
    {
      v4 = v2;
      return 0;
    }
  }
  return v2;
}

- (id)impl
{
  return self->_impl;
}

- (void)setCurrentDevice:(NSString *)currentDevice
{
}

- (NSString)currentDevice
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)STSLabel
{
  uint64_t v2 = *((void *)self->_impl + 11);
  v3 = *(const void **)(v2 + 536);
  if (v3)
  {
    CFRetain(*(CFTypeRef *)(v2 + 536));
    CFRelease(v3);
  }
  return (id)v3;
}

- (void)setSTSLabel:(id)a3
{
  id v3 = a3;
  v4 = (AVAudioPlayerCpp *)*((void *)self->_impl + 11);
  if (a3)
  {
    CFRetain(a3);
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      objc_super v6 = (const void *)*((void *)v4 + 67);
      *((void *)v4 + 67) = v3;
      CFRetain(v3);
      char v7 = 0;
      if (!v6) {
        goto LABEL_9;
      }
    }
    else
    {
      CFRelease(v3);
      id v3 = 0;
      objc_super v6 = (const void *)*((void *)v4 + 67);
      *((void *)v4 + 67) = 0;
      char v7 = 1;
      if (!v6) {
        goto LABEL_9;
      }
    }
LABEL_8:
    CFRelease(v6);
    goto LABEL_9;
  }
  objc_super v6 = (const void *)*((void *)v4 + 67);
  char v7 = 1;
  *((void *)v4 + 67) = 0;
  if (v6) {
    goto LABEL_8;
  }
LABEL_9:
  AVAudioPlayerCpp::applySTSLabelToQueueIfPossible(v4);
  if ((v7 & 1) == 0) {
    CFRelease(v3);
  }
}

- (void)setMixToUplink:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(*((void *)self->_impl + 11) + 24) = *(_DWORD *)(*((void *)self->_impl + 11) + 24) & 0xFFFFFEFF | v3;
}

- (BOOL)mixToUplink
{
  return *(unsigned char *)(*((void *)self->_impl + 11) + 25) & 1;
}

- (void)setAudioSession:(id)a3
{
  id v5 = a3;
  objc_sync_enter(self);
  id impl = self->_impl;
  [(AVAudioPlayer *)self stop];
  [(AVAudioPlayer *)self privRemoveSessionListener];
  uint64_t v7 = *((void *)impl + 11);
  *(_DWORD *)(v7 + 456) = [a3 opaqueSessionID];

  *((void *)impl + 8) = a3;
  tryToSetPlayerSessionListener(self);

  objc_sync_exit(self);
}

- (id)audioSession
{
  id v2 = *((id *)self->_impl + 8);

  return v2;
}

- (void)setChannelAssignments:(NSArray *)channelAssignments
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id impl = self->_impl;
  NSUInteger v6 = [(NSArray *)channelAssignments count];
  if (v6 == [(AVAudioPlayer *)self numberOfChannels])
  {
    uint64_t v7 = (void *)impl[7];
    impl[7] = [(NSArray *)channelAssignments copy];
    if (v7) {

    }
    if (!(v6 >> 60))
    {
      v8 = (char *)malloc_type_malloc(16 * v6, 0xF80A5484uLL);
      if (v8)
      {
        v9 = v8;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v10 = [(NSArray *)channelAssignments countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = 0;
          uint64_t v13 = *(void *)v26;
          do
          {
            uint64_t v14 = 0;
            v15 = &v9[16 * v12];
            do
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(channelAssignments);
              }
              v16 = *(void **)(*((void *)&v25 + 1) + 8 * v14);
              if (v16)
              {
                *(void *)v15 = [*(id *)(*((void *)&v25 + 1) + 8 * v14) owningPortUID];
                int v17 = [v16 channelNumber];
              }
              else
              {
                int v17 = 0;
                *(void *)v15 = 0;
              }
              *((_DWORD *)v15 + 2) = v17;
              ++v14;
              v15 += 16;
            }
            while (v11 != v14);
            v12 += v14;
            uint64_t v11 = [(NSArray *)channelAssignments countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v11);
        }
        uint64_t v18 = impl[11];
        AVAudioPlayerCpp::freeChannelAssignments((AVAudioPlayerCpp *)v18);
        *(_DWORD *)(v18 + 520) = v6;
        v19 = (char *)malloc_type_malloc((16 * v6) & 0xFFFFFFFF0, 0x1060040ADAFC7CAuLL);
        *(void *)(v18 + 528) = v19;
        if (v19)
        {
          unint64_t v20 = *(unsigned int *)(v18 + 520);
          if (v20)
          {
            uint64_t v21 = 0;
            for (unint64_t i = 0; i < v20; ++i)
            {
              uint64_t v23 = *(void *)&v9[v21];
              if (v23)
              {
                CFRetain(*(CFTypeRef *)&v9[v21]);
                uint64_t v23 = *(void *)&v9[v21];
                v19 = *(char **)(v18 + 528);
                unint64_t v20 = *(unsigned int *)(v18 + 520);
              }
              v24 = &v19[v21];
              *(void *)v24 = v23;
              *((_DWORD *)v24 + 2) = *(_DWORD *)&v9[v21 + 8];
              v21 += 16;
            }
          }
          AVAudioPlayerCpp::makeChannelAssignments((AVAudioPlayerCpp *)v18);
        }
        free(v9);
      }
    }
  }
}

- (NSArray)channelAssignments
{
  return (NSArray *)*((void *)self->_impl + 7);
}

- (float)averagePowerForChannel:(NSUInteger)channelNumber
{
  uint64_t v3 = *((void *)self->_impl + 11);
  if (*(_DWORD *)(v3 + 60) > channelNumber && *(unsigned char *)(v3 + 307) && (uint64_t v4 = *(void *)(v3 + 384)) != 0) {
    return *(float *)(v4 + 8 * channelNumber);
  }
  else {
    return -160.0;
  }
}

- (float)peakPowerForChannel:(NSUInteger)channelNumber
{
  uint64_t v3 = *((void *)self->_impl + 11);
  if (*(_DWORD *)(v3 + 60) > channelNumber && *(unsigned char *)(v3 + 307) && (uint64_t v4 = *(void *)(v3 + 384)) != 0) {
    return *(float *)(v4 + 8 * channelNumber + 4);
  }
  else {
    return -160.0;
  }
}

- (void)updateMeters
{
}

- (void)setMeteringEnabled:(BOOL)meteringEnabled
{
  id impl = self->_impl;
  LODWORD(var4) = meteringEnabled;
  AVAudioPlayerCpp::SetProperty(impl[11], 1701735796, 4, &var4);
}

- (BOOL)isMeteringEnabled
{
  id impl = (AVAudioPlayerCpp **)self->_impl;
  int v4 = 0;
  AudioPlayerImpl_GetProperty<unsigned int>(impl[11], 1701735796, &v4);
  return v4 != 0;
}

- (NSInteger)numberOfLoops
{
  return *(int *)(*((void *)self->_impl + 11) + 296);
}

- (void)setNumberOfLoops:(NSInteger)numberOfLoops
{
  *(_DWORD *)(*((void *)self->_impl + 11) + 296) = numberOfLoops;
}

- (void)setCurrentTime:(NSTimeInterval)currentTime
{
  id impl = self->_impl;
  NSTimeInterval v4 = currentTime;
  AVAudioPlayerCpp::SetProperty(impl[11], 1668573549, 8, &v4);
}

- (NSTimeInterval)deviceCurrentTime
{
  id impl = (AVAudioPlayerCpp **)self->_impl;
  double v4 = 0.0;
  AudioPlayerImpl_GetProperty<double>(impl[11], 1685350765, &v4);
  return v4;
}

- (NSTimeInterval)currentTime
{
  id impl = (AVAudioPlayerCpp **)self->_impl;
  double v4 = 0.0;
  AudioPlayerImpl_GetProperty<double>(impl[11], 1668573549, &v4);
  return v4;
}

- (NSUInteger)numberOfChannels
{
  id impl = (AVAudioPlayerCpp **)self->_impl;
  unsigned int v4 = 0;
  AudioPlayerImpl_GetProperty<unsigned int>(impl[11], 1667788403, &v4);
  return v4;
}

- (float)pan
{
  id impl = (AVAudioPlayerCpp **)self->_impl;
  double v4 = 0.0;
  AudioPlayerImpl_GetProperty<double>(impl[11], 1885433376, &v4);
  return v4;
}

- (void)setPan:(float)pan
{
  id impl = self->_impl;
  double v4 = pan;
  AVAudioPlayerCpp::SetProperty(impl[11], 1885433376, 8, &v4);
}

- (float)rate
{
  id impl = (AVAudioPlayerCpp **)self->_impl;
  double v4 = 1.0;
  AudioPlayerImpl_GetProperty<double>(impl[11], 1918989413, &v4);
  return v4;
}

- (void)setRate:(float)rate
{
  id impl = self->_impl;
  double v4 = rate;
  AVAudioPlayerCpp::SetProperty(impl[11], 1918989413, 8, &v4);
}

- (BOOL)enableRate
{
  id impl = (AVAudioPlayerCpp **)self->_impl;
  int v4 = 0;
  AudioPlayerImpl_GetProperty<unsigned int>(impl[11], 1701737076, &v4);
  return v4 != 0;
}

- (void)setEnableRate:(BOOL)enableRate
{
  id impl = self->_impl;
  LODWORD(var4) = enableRate;
  AVAudioPlayerCpp::SetProperty(impl[11], 1701737076, 4, &var4);
}

- (void)setVolume:(float)volume fadeDuration:(NSTimeInterval)duration
{
  id impl = self->_impl;
  NSTimeInterval v7 = duration;
  AVAudioPlayerCpp::SetProperty(impl[11], 1987015284, 8, &v7);
  double v6 = volume;
  AVAudioPlayerCpp::SetProperty(impl[11], 1987013749, 8, &v6);
}

- (float)volume
{
  id impl = (AVAudioPlayerCpp **)self->_impl;
  double v4 = 0.0;
  AudioPlayerImpl_GetProperty<double>(impl[11], 1987013749, &v4);
  return v4;
}

- (void)setVolume:(float)volume
{
  id impl = self->_impl;
  uint64_t v6 = 0;
  AVAudioPlayerCpp::SetProperty(impl[11], 1987015284, 8, (double *)&v6);
  double v5 = volume;
  AVAudioPlayerCpp::SetProperty(impl[11], 1987013749, 8, &v5);
}

- (NSTimeInterval)duration
{
  id impl = (AVAudioPlayerCpp **)self->_impl;
  double v4 = 0.0;
  AudioPlayerImpl_GetProperty<double>(impl[11], 1685418593, &v4);
  return v4;
}

- (AVAudioFormat)format
{
  return (AVAudioFormat *)*((void *)self->_impl + 5);
}

- (NSDictionary)settings
{
  return (NSDictionary *)*((void *)self->_impl + 4);
}

- (void)setDelegate:(id)delegate
{
  double v4 = (id *)((char *)self->_impl + 8);
  if (objc_loadWeak(v4) != delegate)
  {
    objc_storeWeak(v4, delegate);
  }
}

- (id)delegate
{
  return objc_loadWeak((id *)self->_impl + 1);
}

- (NSData)data
{
  return (NSData *)*((void *)self->_impl + 2);
}

- (NSURL)url
{
  return (NSURL *)*((void *)self->_impl + 3);
}

- (BOOL)isPlaying
{
  id impl = (AVAudioPlayerCpp **)self->_impl;
  int v4 = 0;
  AudioPlayerImpl_GetProperty<unsigned int>(impl[11], 1886157119, &v4);
  return v4 != 0;
}

- (void)stop
{
}

- (void)pause
{
}

- (BOOL)playAtTime:(NSTimeInterval)time
{
  NSTimeInterval v4 = time;
  return AVAudioPlayerCpp::DoAction(*((AudioQueueRef **)self->_impl + 11), 1886151028, 8, &v4) == 0;
}

- (BOOL)play
{
  return AVAudioPlayerCpp::DoAction(*((AudioQueueRef **)self->_impl + 11), 1886151033, 0, 0) == 0;
}

- (BOOL)prepareToPlay
{
  return AVAudioPlayerCpp::DoAction(*((AudioQueueRef **)self->_impl + 11), 1886545264, 0, 0) == 0;
}

- (AVAudioPlayer)initWithData:(NSData *)data fileTypeHint:(NSString *)utiString error:(NSError *)outError
{
  NSTimeInterval v7 = [(AVAudioPlayer *)self initBase];
  if (v7)
  {
    if (outError) {
      *outError = 0;
    }
    if (data)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *((void *)v7->_impl + 2) = data;
        v8 = data;
        operator new();
      }
    }
    if (outError) {
      *outError = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10875 userInfo:0];
    }
    v9 = v7;
    return 0;
  }
  return v7;
}

- (AVAudioPlayer)initWithData:(NSData *)data error:(NSError *)outError
{
  return [(AVAudioPlayer *)self initWithData:data fileTypeHint:0 error:outError];
}

- (void)dealloc
{
  [(AVAudioPlayer *)self privRemoveSessionListener];

  self->_id impl = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVAudioPlayer;
  [(AVAudioPlayer *)&v3 dealloc];
}

- (void)finalize
{
  self->_id impl = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVAudioPlayer;
  [(AVAudioPlayer *)&v3 finalize];
}

- (AVAudioPlayer)init
{
  return 0;
}

- (void)endInterruption
{
  objc_super v3 = (void *)MEMORY[0x19F3AC180](self, a2);
  objc_msgSend(-[AVAudioPlayer delegate](self, "delegate"), "audioPlayerEndInterruption:", self);
}

- (void)endInterruptionWithFlags:(id)a3
{
  double v5 = (void *)MEMORY[0x19F3AC180](self, a2);
  id v6 = [(AVAudioPlayer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v6, "audioPlayerEndInterruption:withOptions:", self, objc_msgSend(a3, "unsignedLongLongValue"));
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v6, "audioPlayerEndInterruption:withFlags:", self, objc_msgSend(a3, "unsignedLongLongValue"));
  }
}

- (void)beginInterruption
{
  objc_super v3 = (void *)MEMORY[0x19F3AC180](self, a2);
  objc_msgSend(-[AVAudioPlayer delegate](self, "delegate"), "audioPlayerBeginInterruption:", self);
}

- (void)handleInterruption:(id)a3
{
  id impl = self->_impl;
  id v6 = (void *)[a3 userInfo];
  int v7 = objc_msgSend((id)objc_msgSend(v6, "valueForKey:", *MEMORY[0x1E4F4E860]), "intValue");
  if (v7)
  {
    if (v7 == 1)
    {
      uint64_t v8 = *((void *)impl + 11);
      if (!*(unsigned char *)(v8 + 313))
      {
        pthread_mutex_lock(&avap_mutex);
        *(unsigned char *)(v8 + 460) = 1;
        int v9 = *(unsigned __int8 *)(v8 + 307);
        if (*(unsigned char *)(v8 + 307) || *(unsigned char *)(v8 + 305))
        {
          *(unsigned char *)(v8 + 461) = v9;
          AVAudioPlayerCpp::getQueueTime((AVAudioPlayerCpp *)v8, 1);
          uint64_t v10 = *(void *)(v8 + 336);
          *(void *)(v8 + 344) = *(void *)(v8 + 328);
          *(void *)(v8 + 320) = v10;
          *(unsigned char *)(v8 + 315) = 0;
          *(_WORD *)(v8 + 304) = 0;
          *(_DWORD *)(v8 + 308) = 0;
          *(unsigned char *)(v8 + 307) = 0;
        }
        pthread_mutex_unlock(&avap_mutex);
        if (v9)
        {
          LocalPlayerHandleCallback(self, 1651076724, 0, 0);
        }
      }
    }
  }
  else
  {
    uint64_t v11 = (AVAudioPlayerCpp *)*((void *)impl + 11);
    if (!*((unsigned char *)v11 + 313))
    {
      pthread_mutex_lock(&avap_mutex);
      if (*((unsigned char *)v11 + 460))
      {
        AVAudioPlayerCpp::disposeQueue(v11, 1);
        int v12 = *((unsigned __int8 *)v11 + 460);
      }
      else
      {
        int v12 = 0;
      }
      int v13 = *((unsigned __int8 *)v11 + 461);
      pthread_mutex_unlock(&avap_mutex);
      if (v12)
      {
        *((void *)impl + 10) = 0;
        if (v13)
        {
          uint64_t v14 = (void *)[a3 userInfo];
          if (objc_msgSend((id)objc_msgSend(v14, "valueForKey:", *MEMORY[0x1E4F4E840]), "intValue") == 1) {
            *((void *)impl + 10) |= 1uLL;
          }
          LocalPlayerHandleCallback(self, 1701408372, 8, (unsigned int *)impl + 20);
        }
        uint64_t v15 = *((void *)impl + 11);
        pthread_mutex_lock(&avap_mutex);
        *(_WORD *)(v15 + 460) = 0;
        pthread_mutex_unlock(&avap_mutex);
      }
    }
  }
}

- (void)privRemoveSessionListener
{
  id impl = self->_impl;
  if (impl)
  {
    if (*((unsigned char *)impl + 72))
    {
      NSTimeInterval v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      [v4 removeObserver:self name:*MEMORY[0x1E4F4E838] object:impl[8]];
      *((unsigned char *)impl + 72) = 0;
    }
  }
}

- (void)decodeError:(id)a3
{
  double v5 = (void *)MEMORY[0x19F3AC180](self, a2);
  id v6 = [(AVAudioPlayer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    objc_msgSend(v6, "audioPlayerDecodeErrorDidOccur:error:", self, (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], objc_msgSend(a3, "unsignedIntValue"), 0));
  }
}

- (void)finishedPlaying:(id)a3
{
  double v5 = (void *)MEMORY[0x19F3AC180]([(AVAudioPlayer *)self stop]);
  id v6 = [(AVAudioPlayer *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "audioPlayerDidFinishPlaying:successfully:", self, objc_msgSend(a3, "BOOLValue"));
  }
}

@end