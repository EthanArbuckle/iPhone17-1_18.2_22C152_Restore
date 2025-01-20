@interface BWStillImageTimeMachine
+ (BOOL)afComplete:(opaqueCMSampleBuffer *)a3;
+ (void)initialize;
- (BWStillImageTimeMachine)initWithCapacity:(int)a3;
- (int)capacity;
- (int)insertFrame:(opaqueCMSampleBuffer *)a3;
- (opaqueCMSampleBuffer)copyBestFrame;
- (void)_drain;
- (void)dealloc;
- (void)drain;
- (void)resume;
- (void)suspendAndDrain;
@end

@implementation BWStillImageTimeMachine

+ (void)initialize
{
}

- (BWStillImageTimeMachine)initWithCapacity:(int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BWStillImageTimeMachine;
  v4 = [(BWStillImageTimeMachine *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_capacity = a3;
    if (a3 >= 1) {
      v4->_frames = (opaqueCMSampleBuffer **)malloc_type_calloc(a3, 8uLL, 0x2004093837F09uLL);
    }
    v5->_timeMachineMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v5;
}

- (void)dealloc
{
  -[BWStillImageTimeMachine _drain]((uint64_t)self);
  free(self->_frames);
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageTimeMachine;
  [(BWStillImageTimeMachine *)&v3 dealloc];
}

- (void)_drain
{
  if (a1)
  {
    unint64_t v2 = *(unsigned int *)(a1 + 28);
    if (v2)
    {
      for (unint64_t i = 0; i < v2; ++i)
      {
        v4 = *(const void **)(*(void *)(a1 + 16) + 8 * i);
        if (v4)
        {
          CFRelease(v4);
          *(void *)(*(void *)(a1 + 16) + 8 * i) = 0;
          unint64_t v2 = *(unsigned int *)(a1 + 28);
        }
      }
    }
  }
}

- (void)resume
{
  pthread_mutex_lock((pthread_mutex_t *)self->_timeMachineMutex);
  self->_suspended = 0;
  timeMachineMutex = self->_timeMachineMutex;
  pthread_mutex_unlock((pthread_mutex_t *)timeMachineMutex);
}

- (void)suspendAndDrain
{
  pthread_mutex_lock((pthread_mutex_t *)self->_timeMachineMutex);
  if (!self->_suspended)
  {
    self->_suspended = 1;
    -[BWStillImageTimeMachine _drain]((uint64_t)self);
  }
  timeMachineMutex = self->_timeMachineMutex;
  pthread_mutex_unlock((pthread_mutex_t *)timeMachineMutex);
}

- (int)insertFrame:(opaqueCMSampleBuffer *)a3
{
  pthread_mutex_lock((pthread_mutex_t *)self->_timeMachineMutex);
  int capacity = self->_capacity;
  if (capacity && !self->_suspended)
  {
    objc_super v7 = *self->_frames;
    if (v7)
    {
      CFRelease(v7);
      int capacity = self->_capacity;
    }
    uint64_t v8 = (capacity - 1);
    if (v8)
    {
      uint64_t v9 = 0;
      do
      {
        self->_frames[v9] = self->_frames[v9 + 1];
        ++v9;
      }
      while (v8 != v9);
    }
    else
    {
      uint64_t v8 = 0;
    }
    int CopyIncludingMetadata = BWCMSampleBufferCreateCopyIncludingMetadata(a3, &self->_frames[v8]);
    if (CopyIncludingMetadata)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    int CopyIncludingMetadata = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_timeMachineMutex);
  return CopyIncludingMetadata;
}

- (opaqueCMSampleBuffer)copyBestFrame
{
  double valuePtr = 0.0;
  pthread_mutex_lock((pthread_mutex_t *)self->_timeMachineMutex);
  int capacity = self->_capacity;
  if (capacity >= 4)
  {
    fig_log_get_emitter();
    uint64_t v38 = v2;
    LODWORD(v37) = 0;
    FigDebugAssert3();
    int capacity = self->_capacity;
  }
  uint64_t v42 = 0;
  if (capacity < 1) {
    goto LABEL_48;
  }
  if (!self->_frames) {
    goto LABEL_48;
  }
  unint64_t v5 = 0;
  int v6 = 0;
  do
  {
    v6 |= +[BWStillImageTimeMachine afComplete:](BWStillImageTimeMachine, "afComplete:", self->_frames[v5++], v37, v38);
    unint64_t v7 = self->_capacity;
  }
  while (v5 < v7);
  if ((v6 & 1) == 0) {
    goto LABEL_48;
  }
  uint64_t v8 = self->_frames[(int)v7 - 1];
  uint64_t v9 = (const __CFString **)MEMORY[0x1E4F53070];
  if (v8
    && (CFDictionaryRef v10 = (const __CFDictionary *)CMGetAttachment(v8, (CFStringRef)*MEMORY[0x1E4F53070], 0)) != 0
    && (CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x1E4F53E48])) != 0
    && (CFNumberGetValue(v11, kCFNumberFloat64Type, &valuePtr), valuePtr < 0.01)
    && valuePtr > 0.0)
  {
    int v12 = self->_capacity;
    int v13 = -1;
    if (v12)
    {
      int v14 = v12 - 1;
      goto LABEL_41;
    }
  }
  else
  {
    if (self->_capacity)
    {
      unint64_t v15 = 0;
      CFStringRef v16 = *v9;
      key = (void *)*MEMORY[0x1E4F53EC0];
      v17 = (const void *)*MEMORY[0x1E4F53BF0];
      v18 = (const void *)*MEMORY[0x1E4F53BF8];
      int v13 = -1;
      float v19 = 0.0;
      int v14 = -1;
      do
      {
        v20 = self->_frames[v15];
        if (v20)
        {
          CFDictionaryRef v21 = (const __CFDictionary *)CMGetAttachment(v20, v16, 0);
          if (v21)
          {
            CFDictionaryRef v22 = v21;
            CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v21, key);
            if (Value)
            {
              CFArrayRef v24 = Value;
              CFIndex v25 = (CFArrayGetCount(Value) << 32) - 0x100000000;
              if (v25 < (uint64_t)0xFFFFFFFF00000001)
              {
                uint64_t v26 = 0;
              }
              else
              {
                uint64_t v26 = 0;
                CFIndex v27 = v25 >> 32;
                do
                {
                  CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v24, v27);
                  CFNumberGetValue(ValueAtIndex, kCFNumberSInt64Type, &v42);
                  v26 += v42;
                }
                while (v27-- > 0);
              }
            }
            else
            {
              uint64_t v26 = -1;
            }
            CFBooleanRef v30 = (const __CFBoolean *)CFDictionaryGetValue(v22, v17);
            if (v30 && !CFBooleanGetValue(v30)) {
              v26 >>= 2;
            }
            CFNumberRef v31 = (const __CFNumber *)CFDictionaryGetValue(v22, v18);
            int v40 = 4;
            if (v31)
            {
              CFNumberGetValue(v31, kCFNumberIntType, &v40);
              uint64_t v32 = v26 >> 2;
              if (v40 != 2) {
                uint64_t v32 = v26;
              }
              if (v40 == 3) {
                v26 >>= 1;
              }
              else {
                uint64_t v26 = v32;
              }
            }
            if ((v26 & 0x8000000000000000) == 0)
            {
              int v33 = self->_capacity + ~v15;
              if ((float)(copyBestFrame_weights[v33] * (float)v26) > v19)
              {
                int v14 = v15;
                float v19 = copyBestFrame_weights[v33] * (float)v26;
              }
            }
          }
          int v13 = v15;
        }
        ++v15;
      }
      while (v15 < self->_capacity);
LABEL_41:
      if ((v14 & 0x80000000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
    int v13 = -1;
  }
LABEL_44:
  int v14 = v13;
  if (v13 < 0)
  {
LABEL_48:
    v35 = 0;
    goto LABEL_49;
  }
LABEL_45:
  if (v14 >= self->_capacity) {
    goto LABEL_48;
  }
  v34 = self->_frames[v14];
  if (!v34) {
    goto LABEL_48;
  }
  v35 = (opaqueCMSampleBuffer *)CFRetain(v34);
LABEL_49:
  pthread_mutex_unlock((pthread_mutex_t *)self->_timeMachineMutex);
  return v35;
}

- (void)drain
{
  pthread_mutex_lock((pthread_mutex_t *)self->_timeMachineMutex);
  -[BWStillImageTimeMachine _drain]((uint64_t)self);
  timeMachineMutex = self->_timeMachineMutex;
  pthread_mutex_unlock((pthread_mutex_t *)timeMachineMutex);
}

+ (BOOL)afComplete:(opaqueCMSampleBuffer *)a3
{
  if (!a3) {
    return 0;
  }
  CFDictionaryRef v3 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  BOOL result = 1;
  if (v3)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E4F53BF8]);
    int valuePtr = 0;
    if (Value)
    {
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      if (valuePtr == 2) {
        return 0;
      }
    }
  }
  return result;
}

- (int)capacity
{
  return self->_capacity;
}

@end