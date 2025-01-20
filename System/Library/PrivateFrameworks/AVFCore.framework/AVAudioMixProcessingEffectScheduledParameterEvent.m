@interface AVAudioMixProcessingEffectScheduledParameterEvent
+ (id)eventWithParameters:(id)a3 at:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (AVAudioMixProcessingEffectScheduledParameterEvent)initWithParameters:(id)a3 at:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_figSchedule;
- (id)parameters;
- (unint64_t)hash;
@end

@implementation AVAudioMixProcessingEffectScheduledParameterEvent

- (AVAudioMixProcessingEffectScheduledParameterEvent)initWithParameters:(id)a3 at:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVAudioMixProcessingEffectScheduledParameterEvent;
  v6 = [(AVAudioMixProcessingEffectScheduledParameterEvent *)&v9 init];
  if (v6)
  {
    v6->_parameters = (NSArray *)[a3 copy];
    int64_t var3 = a4->var3;
    *(_OWORD *)&v6->_time.value = *(_OWORD *)&a4->var0;
    v6->_time.epoch = var3;
  }
  return v6;
}

+ (id)eventWithParameters:(id)a3 at:(id *)a4
{
  v6 = [AVAudioMixProcessingEffectScheduledParameterEvent alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  return [(AVAudioMixProcessingEffectScheduledParameterEvent *)v6 initWithParameters:a3 at:&v8];
}

- (id)parameters
{
  v2 = self->_parameters;
  return v2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a3 == self)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      int v5 = [(NSArray *)self->_parameters isEqual:*((void *)a3 + 1)];
      if (v5)
      {
        CMTime time1 = (CMTime)self->_time;
        CMTime v7 = *(CMTime *)((char *)a3 + 16);
        LOBYTE(v5) = CMTimeCompare(&time1, &v7) == 0;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_parameters hash];
  $95D729B680665BEAEFA1D6FCA8238556 time = self->_time;
  return CMTimeHash((CMTime *)&time) ^ v3;
}

- (id)_figSchedule
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTime time = (CMTime)self->_time;
  CFDictionaryRef v5 = CMTimeCopyAsDictionary(&time, v4);
  [v3 setObject:v5 forKey:*MEMORY[0x1E4F326E0]];
  v6 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", 12* objc_msgSend(-[AVAudioMixProcessingEffectScheduledParameterEvent parameters](self, "parameters"), "count"));
  CMTime v7 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", 4* objc_msgSend(-[AVAudioMixProcessingEffectScheduledParameterEvent parameters](self, "parameters"), "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [(AVAudioMixProcessingEffectScheduledParameterEvent *)self parameters];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
        time.timescale = 0;
        time.value = 0;
        unsigned int v14 = [v13 fourcc];
        time.timescale = 0;
        time.value = v14;
        objc_msgSend(v6, "appendData:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &time, 12));
        int v17 = 0;
        [v13 value];
        int v17 = v15;
        objc_msgSend(v7, "appendData:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v17, 4));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v10);
  }
  [v3 setObject:v6 forKey:*MEMORY[0x1E4F326D8]];
  [v3 setObject:v7 forKey:*MEMORY[0x1E4F326E8]];
  if (v5) {
    CFRelease(v5);
  }
  return v3;
}

@end