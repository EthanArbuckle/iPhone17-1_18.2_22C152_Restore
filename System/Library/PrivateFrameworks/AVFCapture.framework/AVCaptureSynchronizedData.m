@interface AVCaptureSynchronizedData
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjustedTimestamp;
- (BOOL)hasCorrespondingDepthData;
- (BOOL)hasCorrespondingVisionData;
- (CMTime)timestamp;
- (id)_initWithTimestamp:(id *)a3;
- (int)constituentDeviceCaptureID;
- (void)dealloc;
- (void)setAdjustedTimestamp:(id *)a3;
- (void)setTimestampOverride:(id *)a3;
@end

@implementation AVCaptureSynchronizedData

+ (void)initialize
{
}

- (id)_initWithTimestamp:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AVCaptureSynchronizedData;
  v4 = [(AVCaptureSynchronizedData *)&v10 init];
  if (v4)
  {
    v5 = objc_alloc_init(AVCaptureSynchronizedDataInternal);
    v4->_synchronizedDataInternal = v5;
    if (v5)
    {
      long long v6 = *(_OWORD *)&a3->var0;
      v5->timestamp.epoch = a3->var3;
      *(_OWORD *)&v5->timestamp.value = v6;
      synchronizedDataInternal = v4->_synchronizedDataInternal;
      uint64_t v8 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)&synchronizedDataInternal->adjustedTimestamp.value = *MEMORY[0x1E4F1F9F8];
      synchronizedDataInternal->adjustedTimestamp.epoch = *(void *)(v8 + 16);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSynchronizedData;
  [(AVCaptureSynchronizedData *)&v3 dealloc];
}

- (CMTime)timestamp
{
  uint64_t v3 = *(void *)&self->timescale;
  uint64_t v4 = 8;
  if ((*(_DWORD *)(v3 + 20) & 1) == 0) {
    uint64_t v4 = 32;
  }
  *retstr = *(CMTime *)(v3 + v4);
  return self;
}

- (void)setTimestampOverride:(id *)a3
{
  synchronizedDataInternal = self->_synchronizedDataInternal;
  long long v4 = *(_OWORD *)&a3->var0;
  synchronizedDataInternal->timestamp.epoch = a3->var3;
  *(_OWORD *)&synchronizedDataInternal->timestamp.value = v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjustedTimestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(void *)&self->var1 + 32);
  return self;
}

- (void)setAdjustedTimestamp:(id *)a3
{
  synchronizedDataInternal = self->_synchronizedDataInternal;
  long long v4 = *(_OWORD *)&a3->var0;
  synchronizedDataInternal->adjustedTimestamp.epoch = a3->var3;
  *(_OWORD *)&synchronizedDataInternal->adjustedTimestamp.value = v4;
}

- (BOOL)hasCorrespondingDepthData
{
  return 0;
}

- (BOOL)hasCorrespondingVisionData
{
  return 0;
}

- (int)constituentDeviceCaptureID
{
  return -1;
}

@end