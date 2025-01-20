@interface AVCaptureFileOutput
+ (void)initialize;
- (BOOL)isRecording;
- (BOOL)isRecordingPaused;
- (BOOL)isVirtualCaptureCardSupported;
- (BOOL)pausesRecordingOnInterruption;
- (BOOL)usesVirtualCaptureCard;
- (CMTime)maxRecordedDuration;
- (CMTime)recordedDuration;
- (NSURL)outputFileURL;
- (id)delegate;
- (id)initSubclass;
- (int64_t)maxRecordedFileSize;
- (int64_t)minFreeDiskSpaceLimit;
- (int64_t)recordedFileSize;
- (void)dealloc;
- (void)setDelegate:(id)delegate;
- (void)setMaxRecordedDuration:(CMTime *)maxRecordedDuration;
- (void)setMaxRecordedFileSize:(int64_t)maxRecordedFileSize;
- (void)setMinFreeDiskSpaceLimit:(int64_t)minFreeDiskSpaceLimit;
- (void)setPausesRecordingOnInterruption:(BOOL)a3;
@end

@implementation AVCaptureFileOutput

+ (void)initialize
{
}

- (id)initSubclass
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureFileOutput;
  v2 = [(AVCaptureOutput *)&v5 initSubclass];
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureFileOutputInternal);
    v2[2] = v3;
    if (!v3)
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureFileOutput;
  [(AVCaptureOutput *)&v3 dealloc];
}

- (NSURL)outputFileURL
{
  return 0;
}

- (BOOL)isRecording
{
  return 0;
}

- (BOOL)isRecordingPaused
{
  return 0;
}

- (BOOL)pausesRecordingOnInterruption
{
  return self->_fileOutputInternal->pausesRecordingOnInterruption;
}

- (void)setPausesRecordingOnInterruption:(BOOL)a3
{
  self->_fileOutputInternal->pausesRecordingOnInterruption = a3;
}

- (CMTime)recordedDuration
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3810000000;
  v9 = &unk_1A165D1D9;
  long long v10 = *MEMORY[0x1E4F1FA48];
  uint64_t v11 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AVCaptureFileOutput_recordedDuration__block_invoke;
  v5[3] = &unk_1E5A72D48;
  v5[4] = self;
  v5[5] = &v6;
  [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v5];
  *retstr = *(CMTime *)(v7 + 4);
  _Block_object_dispose(&v6, 8);
  return result;
}

void __39__AVCaptureFileOutput_recordedDuration__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    CFDictionaryRef dictionaryRepresentation = 0;
    uint64_t v4 = [*(id *)(a1 + 32) sinkID];
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = *(void (**)(uint64_t, uint64_t, void, void, CFDictionaryRef *))(v6 + 16);
    if (v7)
    {
      v7(a2, v4, *MEMORY[0x1E4F51570], *MEMORY[0x1E4F1CF80], &dictionaryRepresentation);
      if (dictionaryRepresentation)
      {
        CMTimeMakeFromDictionary(&v10, dictionaryRepresentation);
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        *(_OWORD *)(v8 + 32) = *(_OWORD *)&v10.value;
        CFDictionaryRef v9 = dictionaryRepresentation;
        *(void *)(v8 + 48) = v10.epoch;
        CFRelease(v9);
      }
    }
  }
}

- (int64_t)recordedFileSize
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__AVCaptureFileOutput_recordedFileSize__block_invoke;
  v4[3] = &unk_1E5A72D48;
  v4[4] = self;
  v4[5] = &v5;
  [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __39__AVCaptureFileOutput_recordedFileSize__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    CFNumberRef number = 0;
    uint64_t v4 = [*(id *)(a1 + 32) sinkID];
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, void, void, CFNumberRef *))(v6 + 16);
    if (v7)
    {
      v7(a2, v4, *MEMORY[0x1E4F51578], *MEMORY[0x1E4F1CF80], &number);
      if (number)
      {
        CFNumberGetValue(number, kCFNumberSInt64Type, (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
        CFRelease(number);
      }
    }
  }
}

- (CMTime)maxRecordedDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->epoch + 8);
  return self;
}

- (void)setMaxRecordedDuration:(CMTime *)maxRecordedDuration
{
  fileOutputInternal = self->_fileOutputInternal;
  CMTimeEpoch epoch = maxRecordedDuration->epoch;
  *(_OWORD *)&fileOutputInternal->maxRecordedDuration.value = *(_OWORD *)&maxRecordedDuration->value;
  fileOutputInternal->maxRecordedDuration.CMTimeEpoch epoch = epoch;
}

- (int64_t)maxRecordedFileSize
{
  return self->_fileOutputInternal->maxRecordedFileSize;
}

- (void)setMaxRecordedFileSize:(int64_t)maxRecordedFileSize
{
  self->_fileOutputInternal->maxRecordedFileSize = maxRecordedFileSize;
}

- (int64_t)minFreeDiskSpaceLimit
{
  return self->_fileOutputInternal->minFreeDiskSpaceLimit;
}

- (void)setMinFreeDiskSpaceLimit:(int64_t)minFreeDiskSpaceLimit
{
  self->_fileOutputInternal->minFreeDiskSpaceLimit = minFreeDiskSpaceLimit;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (AVCaptureFileOutputDelegate *)delegate;
}

- (BOOL)isVirtualCaptureCardSupported
{
  return 0;
}

- (BOOL)usesVirtualCaptureCard
{
  return 0;
}

@end