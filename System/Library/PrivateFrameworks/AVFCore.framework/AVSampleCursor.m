@interface AVSampleCursor
+ (AVSampleCursor)sampleCursorWithFigSampleCursor:(OpaqueFigSampleCursor *)a3;
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stepByDecodeTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stepByPresentationTime:(SEL)a3;
- (AVSampleCursor)init;
- (AVSampleCursor)initWithFigSampleCursor:(OpaqueFigSampleCursor *)a3;
- (AVSampleCursorAudioDependencyInfo)currentSampleAudioDependencyInfo;
- (AVSampleCursorChunkInfo)currentChunkInfo;
- (AVSampleCursorDependencyInfo)currentSampleDependencyInfo;
- (AVSampleCursorStorageRange)currentChunkStorageRange;
- (AVSampleCursorStorageRange)currentSampleStorageRange;
- (AVSampleCursorSyncInfo)currentSampleSyncInfo;
- (BOOL)canProvideSampleBuffers;
- (BOOL)samplesWithEarlierDecodeTimeStampsMayHaveLaterPresentationTimeStampsThanCursor:(AVSampleCursor *)cursor;
- (BOOL)samplesWithLaterDecodeTimeStampsMayHaveEarlierPresentationTimeStampsThanCursor:(AVSampleCursor *)cursor;
- (CMFormatDescriptionRef)copyCurrentSampleFormatDescription;
- (CMTime)currentSampleDuration;
- (CMTime)decodeTimeStamp;
- (CMTime)presentationTimeStamp;
- (CMTime)stepByDecodeTime:(SEL)a3 wasPinned:(CMTime *)deltaDecodeTime;
- (CMTime)stepByPresentationTime:(SEL)a3 wasPinned:(CMTime *)deltaPresentationTime;
- (NSComparisonResult)comparePositionInDecodeOrderWithPositionOfCursor:(AVSampleCursor *)cursor;
- (NSDictionary)currentSampleDependencyAttachments;
- (NSInteger)samplesRequiredForDecoderRefresh;
- (NSURL)currentChunkStorageURL;
- (OpaqueFigSampleCursor)_figSampleCursor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)seamIdentifier;
- (int64_t)currentSampleIndexInChunk;
- (int64_t)stepInDecodeOrderByCount:(int64_t)stepCount;
- (int64_t)stepInPresentationOrderByCount:(int64_t)stepCount;
- (opaqueCMSampleBuffer)createSampleBufferForCurrentSampleReturningError:(id *)a3;
- (opaqueCMSampleBuffer)createSampleBufferFromCurrentSampleToEndCursor:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation AVSampleCursor

+ (void)initialize
{
}

+ (AVSampleCursor)sampleCursorWithFigSampleCursor:(OpaqueFigSampleCursor *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithFigSampleCursor:a3];
  return (AVSampleCursor *)v3;
}

- (AVSampleCursor)init
{
  return [(AVSampleCursor *)self initWithFigSampleCursor:0];
}

- (AVSampleCursor)initWithFigSampleCursor:(OpaqueFigSampleCursor *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)AVSampleCursor;
  v4 = [(AVSampleCursor *)&v24 init];
  if (v4)
  {
    v5 = objc_alloc_init(AVSampleCursorInternal);
    v4->_sampleCursor = v5;
    if (v5
      && ((CFRetain(v5), !a3) ? (v6 = 0) : (v6 = (OpaqueFigSampleCursor *)CFRetain(a3)),
          (v4->_sampleCursor->figSampleCursor = v6) != 0))
    {
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      v4->_sampleCursor->implementsGetDecodeTimeStamp = *(void *)(v8 + 48) != 0;
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      v4->_sampleCursor->implementsGetDuration = *(void *)(v10 + 56) != 0;
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v11) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      v4->_sampleCursor->implementsGetDependencyInfo = *(void *)(v12 + 64) != 0;
      uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v13) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
      v4->_sampleCursor->implementsTestReorderingBoundary = *(void *)(v14 + 80) != 0;
      uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v15) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      v4->_sampleCursor->implementsCopySampleLocation = *(void *)(v16 + 144) != 0;
      uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v17) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
      v4->_sampleCursor->implementsCopyChunkDetails = *(void *)(v18 + 152) != 0;
      uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v19) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
      v4->_sampleCursor->implementsCreateSampleBuffer = *(void *)(v20 + 112) != 0;
      uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v21) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = 0;
      }
      v4->_sampleCursor->implementsGetMPEG2FrameType = *(void *)(v22 + 72) != 0;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (self) {
    [(AVSampleCursor *)self presentationTimeStamp];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CFStringRef v7 = (id)CMTimeCopyDescription(v6, &time);
  if (self) {
    [(AVSampleCursor *)self decodeTimeStamp];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  return (id)[v3 stringWithFormat:@"<%@: %p, PTS = %@, DTS = %@>", v5, self, v7, (id)CMTimeCopyDescription(v6, &v9)];
}

- (void)dealloc
{
  sampleCursor = self->_sampleCursor;
  if (sampleCursor)
  {
    if (sampleCursor->figSampleCursor)
    {
      CFRelease(sampleCursor->figSampleCursor);
      sampleCursor = self->_sampleCursor;
    }
    CFRelease(sampleCursor);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVSampleCursor;
  [(AVSampleCursor *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  CFTypeRef cf = 0;
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFStringRef v7 = *(uint64_t (**)(OpaqueFigSampleCursor *, CFTypeRef *))(v6 + 8);
  if (!v7) {
    return 0;
  }
  int v8 = v7(figSampleCursor, &cf);
  CFTypeRef v9 = cf;
  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = cf == 0;
  }
  if (v10)
  {
    uint64_t v12 = 0;
    if (!cf) {
      return v12;
    }
    goto LABEL_10;
  }
  uint64_t v11 = +[AVSampleCursor allocWithZone:a3];
  uint64_t v12 = [(AVSampleCursor *)v11 initWithFigSampleCursor:cf];
  CFTypeRef v9 = cf;
  if (cf) {
LABEL_10:
  }
    CFRelease(v9);
  return v12;
}

- (OpaqueFigSampleCursor)_figSampleCursor
{
  return self->_sampleCursor->figSampleCursor;
}

- (int64_t)stepInDecodeOrderByCount:(int64_t)stepCount
{
  int64_t v9 = 0;
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFStringRef v7 = *(void (**)(OpaqueFigSampleCursor *, int64_t, int64_t *))(v6 + 168);
  if (!v7) {
    return 0;
  }
  v7(figSampleCursor, stepCount, &v9);
  return v9;
}

- (int64_t)stepInPresentationOrderByCount:(int64_t)stepCount
{
  int64_t v9 = 0;
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFStringRef v7 = *(void (**)(OpaqueFigSampleCursor *, int64_t, int64_t *))(v6 + 176);
  if (!v7) {
    return 0;
  }
  v7(figSampleCursor, stepCount, &v9);
  return v9;
}

- (CMTime)stepByDecodeTime:(SEL)a3 wasPinned:(CMTime *)deltaDecodeTime
{
  uint64_t v9 = MEMORY[0x1E4F1FA48];
  long long v28 = *MEMORY[0x1E4F1FA48];
  *(_OWORD *)&retstr->value = *MEMORY[0x1E4F1FA48];
  CMTimeEpoch v10 = *(void *)(v9 + 16);
  retstr->epoch = v10;
  long long v27 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&v32.value = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v11 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v32.epoch = v11;
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = *(void (**)(OpaqueFigSampleCursor *, CMTime *))(v14 + 48);
  if (v15) {
    v15(figSampleCursor, &v32);
  }
  uint64_t v16 = self->_sampleCursor->figSampleCursor;
  CMTime v31 = *deltaDecodeTime;
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v20 = *(void *)(VTable + 16);
  result = (CMTime *)(VTable + 16);
  uint64_t v19 = v20;
  if (v20) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v22 = *(uint64_t (**)(OpaqueFigSampleCursor *, CMTime *))(v21 + 120);
  if (v22 && ((CMTime v33 = v31, result = (CMTime *)v22(v16, &v33), result == -12840) || !result))
  {
    if (outWasPinned) {
      *outWasPinned = result == -12840;
    }
    *(_OWORD *)&v33.value = v27;
    v33.epoch = v11;
    v23 = self->_sampleCursor->figSampleCursor;
    uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v24) {
      uint64_t v25 = v24;
    }
    else {
      uint64_t v25 = 0;
    }
    v26 = *(void (**)(OpaqueFigSampleCursor *, CMTime *))(v25 + 48);
    if (v26) {
      v26(v23, &v33);
    }
    CMTime lhs = v33;
    CMTime rhs = v32;
    result = CMTimeSubtract(&v31, &lhs, &rhs);
    *retstr = v31;
  }
  else
  {
    *(_OWORD *)&retstr->value = v28;
    retstr->epoch = v10;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stepByDecodeTime:(SEL)a3
{
  if (self)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a4;
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self stepByDecodeTime:&v4 wasPinned:0];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }
  return self;
}

- (CMTime)stepByPresentationTime:(SEL)a3 wasPinned:(CMTime *)deltaPresentationTime
{
  uint64_t v9 = MEMORY[0x1E4F1FA48];
  long long v28 = *MEMORY[0x1E4F1FA48];
  *(_OWORD *)&retstr->value = *MEMORY[0x1E4F1FA48];
  CMTimeEpoch v10 = *(void *)(v9 + 16);
  retstr->epoch = v10;
  long long v27 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&v32.value = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v11 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v32.epoch = v11;
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = *(void (**)(OpaqueFigSampleCursor *, CMTime *))(v14 + 40);
  if (v15) {
    v15(figSampleCursor, &v32);
  }
  uint64_t v16 = self->_sampleCursor->figSampleCursor;
  CMTime v31 = *deltaPresentationTime;
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v20 = *(void *)(VTable + 16);
  result = (CMTime *)(VTable + 16);
  uint64_t v19 = v20;
  if (v20) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v22 = *(uint64_t (**)(OpaqueFigSampleCursor *, CMTime *))(v21 + 128);
  if (v22 && ((CMTime v33 = v31, result = (CMTime *)v22(v16, &v33), result == -12840) || !result))
  {
    if (outWasPinned) {
      *outWasPinned = result == -12840;
    }
    *(_OWORD *)&v33.value = v27;
    v33.epoch = v11;
    v23 = self->_sampleCursor->figSampleCursor;
    uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v24) {
      uint64_t v25 = v24;
    }
    else {
      uint64_t v25 = 0;
    }
    v26 = *(void (**)(OpaqueFigSampleCursor *, CMTime *))(v25 + 40);
    if (v26) {
      v26(v23, &v33);
    }
    CMTime lhs = v33;
    CMTime rhs = v32;
    result = CMTimeSubtract(&v31, &lhs, &rhs);
    *retstr = v31;
  }
  else
  {
    *(_OWORD *)&retstr->value = v28;
    retstr->epoch = v10;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stepByPresentationTime:(SEL)a3
{
  if (self)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a4;
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self stepByPresentationTime:&v4 wasPinned:0];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }
  return self;
}

- (CMTime)presentationTimeStamp
{
  *retstr = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v8 = *(void *)(VTable + 16);
  result = (CMTime *)(VTable + 16);
  uint64_t v7 = v8;
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  CMTimeEpoch v10 = *(uint64_t (**)(OpaqueFigSampleCursor *, CMTime *))(v9 + 40);
  if (v10)
  {
    return (CMTime *)v10(figSampleCursor, retstr);
  }
  return result;
}

- (CMTime)decodeTimeStamp
{
  *retstr = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  sampleCursor = self->_sampleCursor;
  BOOL implementsGetDecodeTimeStamp = sampleCursor->implementsGetDecodeTimeStamp;
  figSampleCursor = sampleCursor->figSampleCursor;
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v10 = *(void *)(VTable + 16);
  result = (CMTime *)(VTable + 16);
  uint64_t v9 = v10;
  if (implementsGetDecodeTimeStamp)
  {
    if (v9) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v13 = *(uint64_t (**)(OpaqueFigSampleCursor *, CMTime *))(v11 + 48);
    if (v13)
    {
      uint64_t v14 = figSampleCursor;
      uint64_t v15 = retstr;
      return (CMTime *)v13(v14, v15);
    }
  }
  else
  {
    if (v9) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = *(uint64_t (**)(OpaqueFigSampleCursor *, CMTime *))(v12 + 40);
    if (v13)
    {
      uint64_t v14 = figSampleCursor;
      uint64_t v15 = retstr;
      return (CMTime *)v13(v14, v15);
    }
  }
  return result;
}

- (NSComparisonResult)comparePositionInDecodeOrderWithPositionOfCursor:(AVSampleCursor *)cursor
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = [(AVSampleCursor *)cursor _figSampleCursor];
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (!v6)
  {
    uint64_t v7 = 0;
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = v6;
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = v7;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v7 = v11;
LABEL_6:
  if (v7 != v8) {
    return 0;
  }
  uint64_t v10 = *(uint64_t (**)(OpaqueFigSampleCursor *, OpaqueFigSampleCursor *))(v7 + 32);
  if (!v10) {
    return 0;
  }
  return v10(figSampleCursor, v4);
}

- (BOOL)samplesWithEarlierDecodeTimeStampsMayHaveLaterPresentationTimeStampsThanCursor:(AVSampleCursor *)cursor
{
  if (!self->_sampleCursor->implementsTestReorderingBoundary) {
    return 0;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = [(AVSampleCursor *)cursor _figSampleCursor];
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (!v6)
  {
    uint64_t v7 = 0;
    if (v4) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v8 = 0;
    return v7 != v8
        || (uint64_t v10 = *(unsigned int (**)(OpaqueFigSampleCursor *, OpaqueFigSampleCursor *, void))(v7 + 80)) == 0
        || v10(figSampleCursor, v4, 0) == 0;
  }
  uint64_t v7 = v6;
  if (!v4) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  return v7 != v8
      || (uint64_t v10 = *(unsigned int (**)(OpaqueFigSampleCursor *, OpaqueFigSampleCursor *, void))(v7 + 80)) == 0
      || v10(figSampleCursor, v4, 0) == 0;
}

- (BOOL)samplesWithLaterDecodeTimeStampsMayHaveEarlierPresentationTimeStampsThanCursor:(AVSampleCursor *)cursor
{
  if (!self->_sampleCursor->implementsTestReorderingBoundary) {
    return 0;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = [(AVSampleCursor *)cursor _figSampleCursor];
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (!v6)
  {
    uint64_t v7 = 0;
    if (v4) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v8 = 0;
    return v7 != v8
        || (uint64_t v10 = *(unsigned int (**)(OpaqueFigSampleCursor *, OpaqueFigSampleCursor *, uint64_t))(v7 + 80)) == 0
        || v10(figSampleCursor, v4, 1) == 0;
  }
  uint64_t v7 = v6;
  if (!v4) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  return v7 != v8
      || (uint64_t v10 = *(unsigned int (**)(OpaqueFigSampleCursor *, OpaqueFigSampleCursor *, uint64_t))(v7 + 80)) == 0
      || v10(figSampleCursor, v4, 1) == 0;
}

- (BOOL)canProvideSampleBuffers
{
  return self->_sampleCursor->implementsCreateSampleBuffer;
}

- (opaqueCMSampleBuffer)createSampleBufferForCurrentSampleReturningError:(id *)a3
{
  sampleCursor = self->_sampleCursor;
  if (!sampleCursor->implementsCreateSampleBuffer) {
    return 0;
  }
  uint64_t v11 = 0;
  figSampleCursor = sampleCursor->figSampleCursor;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(OpaqueFigSampleCursor *, void, opaqueCMSampleBuffer **))(v7 + 112);
  if (v9)
  {
    signed int v10 = v9(figSampleCursor, 0, &v11);
    if (!a3) {
      return v11;
    }
LABEL_10:
    if (v10) {
      *a3 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v10, 0);
    }
    return v11;
  }
  signed int v10 = -12782;
  if (a3) {
    goto LABEL_10;
  }
  return v11;
}

- (opaqueCMSampleBuffer)createSampleBufferFromCurrentSampleToEndCursor:(id)a3 error:(id *)a4
{
  if (!self->_sampleCursor->implementsCreateSampleBuffer) {
    return 0;
  }
  uint64_t v6 = [a3 _figSampleCursor];
  uint64_t v13 = 0;
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v11 = *(uint64_t (**)(OpaqueFigSampleCursor *, uint64_t, opaqueCMSampleBuffer **))(v9 + 112);
  if (v11)
  {
    signed int v12 = v11(figSampleCursor, v6, &v13);
    if (!a4) {
      return v13;
    }
LABEL_10:
    if (v12) {
      *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v12, 0);
    }
    return v13;
  }
  signed int v12 = -12782;
  if (a4) {
    goto LABEL_10;
  }
  return v13;
}

- (CMTime)currentSampleDuration
{
  *retstr = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
  uint64_t v4 = *(void *)&self->timescale;
  if (*(unsigned char *)(v4 + 17))
  {
    uint64_t v5 = *(void *)(v4 + 8);
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v8 = *(void *)(VTable + 16);
    self = (CMTime *)(VTable + 16);
    uint64_t v7 = v8;
    uint64_t v9 = v8 ? v7 : 0;
    signed int v10 = *(uint64_t (**)(uint64_t, CMTime *))(v9 + 56);
    if (v10)
    {
      return (CMTime *)v10(v5, retstr);
    }
  }
  return self;
}

- (CMFormatDescriptionRef)copyCurrentSampleFormatDescription
{
  uint64_t v7 = 0;
  figSampleCursor = self->_sampleCursor->figSampleCursor;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void (**)(OpaqueFigSampleCursor *, const opaqueCMFormatDescription **))(v4 + 160);
  if (!v5) {
    return 0;
  }
  v5(figSampleCursor, &v7);
  return v7;
}

- (AVSampleCursorSyncInfo)currentSampleSyncInfo
{
  char v18 = 1;
  char v17 = 0;
  char v16 = 0;
  sampleCursor = self->_sampleCursor;
  if (sampleCursor->implementsGetDependencyInfo)
  {
    figSampleCursor = sampleCursor->figSampleCursor;
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(unsigned int (**)(OpaqueFigSampleCursor *, char *, char *, void, char *))(v5 + 64);
    if (!v6) {
      goto LABEL_19;
    }
    if (!v6(figSampleCursor, &v18, &v17, 0, &v16))
    {
      int v10 = v16 != 0;
      LODWORD(v6) = v17 != 0;
      int v11 = v18 != 0;
      return (AVSampleCursorSyncInfo)((v6 << 8) | (v10 << 16) | v11);
    }
    goto LABEL_18;
  }
  LODWORD(v6) = sampleCursor->implementsGetMPEG2FrameType;
  if (!sampleCursor->implementsGetMPEG2FrameType)
  {
LABEL_19:
    int v10 = 0;
    int v11 = 1;
    return (AVSampleCursorSyncInfo)((v6 << 8) | (v10 << 16) | v11);
  }
  char v15 = 0;
  __int16 v14 = 0;
  uint64_t v7 = sampleCursor->figSampleCursor;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  signed int v12 = *(unsigned int (**)(OpaqueFigSampleCursor *, char *, char *, __int16 *))(v9 + 72);
  if (!v12 || v12(v7, &v15, (char *)&v14 + 1, &v14))
  {
LABEL_18:
    LODWORD(v6) = 0;
    goto LABEL_19;
  }
  int v10 = v15 == 66;
  LODWORD(v6) = v15 == 73 && HIBYTE(v14) != 0;
  int v11 = (v15 == 73) & ~v6;
  return (AVSampleCursorSyncInfo)((v6 << 8) | (v10 << 16) | v11);
}

- (AVSampleCursorDependencyInfo)currentSampleDependencyInfo
{
  CFTypeRef cf = 0;
  uint64_t FigBaseObject = FigSampleCursorGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (!v5 || v5(FigBaseObject, *MEMORY[0x1E4F346C8], *MEMORY[0x1E4F1CF80], &cf)) {
    goto LABEL_10;
  }
  if (!cf)
  {
    unsigned int v9 = 0;
    BOOL v8 = 0;
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    uint64_t v11 = 0;
    uint64_t v10 = 0;
    return (AVSampleCursorDependencyInfo)((v11 << 40) | (v10 << 32) | (v12 << 24) | (v13 << 16) | ((unint64_t)v8 << 8) | v9);
  }
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID())
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E4F1F1F8]);
    if (Value)
    {
      BOOL v8 = CFBooleanGetValue(Value) != 0;
      unsigned int v9 = 1;
    }
    else
    {
      BOOL v8 = 0;
      unsigned int v9 = 0;
    }
    CFBooleanRef v15 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E4F1F1A8]);
    if (v15)
    {
      uint64_t v12 = CFBooleanGetValue(v15) != 0;
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }
    CFBooleanRef v16 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E4F1F1F0]);
    if (v16)
    {
      uint64_t v11 = CFBooleanGetValue(v16) != 0;
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
  }
  else
  {
LABEL_10:
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    BOOL v8 = 0;
    unsigned int v9 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return (AVSampleCursorDependencyInfo)((v11 << 40) | (v10 << 32) | (v12 << 24) | (v13 << 16) | ((unint64_t)v8 << 8) | v9);
}

- (AVSampleCursorAudioDependencyInfo)currentSampleAudioDependencyInfo
{
  BOOL v11 = 0;
  NSInteger v12 = 0;
  CFTypeRef cf = 0;
  uint64_t FigBaseObject = FigSampleCursorGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (v5 && !v5(FigBaseObject, *MEMORY[0x1E4F346C8], *MEMORY[0x1E4F1CF80], &cf))
  {
    if (!cf) {
      goto LABEL_12;
    }
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID())
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E4F1F188]);
      if (Value)
      {
        LOBYTE(v11) = 1;
        CFNumberGetValue(Value, kCFNumberNSIntegerType, &v12);
      }
    }
  }
  if (cf) {
    CFRelease(cf);
  }
LABEL_12:
  BOOL v8 = v11;
  NSInteger v9 = v12;
  result.audioSamplePacketRefreshCount = v9;
  result.audioSampleIsIndependentlyDecodable = v8;
  return result;
}

- (NSDictionary)currentSampleDependencyAttachments
{
  BOOL v8 = 0;
  uint64_t FigBaseObject = FigSampleCursorGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void (**)(uint64_t, void, void, void **))(v4 + 48);
  if (v5)
  {
    v5(FigBaseObject, *MEMORY[0x1E4F346C8], *MEMORY[0x1E4F1CF80], &v8);
    CFTypeID v6 = v8;
  }
  else
  {
    CFTypeID v6 = 0;
  }
  return (NSDictionary *)v6;
}

- (NSURL)currentChunkStorageURL
{
  id v18 = 0;
  CFTypeRef cf = 0;
  sampleCursor = self->_sampleCursor;
  if (sampleCursor->implementsCopyChunkDetails)
  {
    figSampleCursor = sampleCursor->figSampleCursor;
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    NSInteger v9 = *(unsigned int (**)(OpaqueFigSampleCursor *, CFTypeRef *, id *, void, void, void, void, void, void, void))(v5 + 152);
    if (!v9 || v9(figSampleCursor, &cf, &v18, 0, 0, 0, 0, 0, 0, 0)) {
      goto LABEL_23;
    }
  }
  else if (sampleCursor->implementsCopySampleLocation)
  {
    CFTypeID v6 = sampleCursor->figSampleCursor;
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v8 = v7 ? v7 : 0;
    uint64_t v10 = *(unsigned int (**)(OpaqueFigSampleCursor *, void, void, CFTypeRef *, id *))(v8 + 144);
    if (!v10 || v10(v6, 0, 0, &cf, &v18)) {
      goto LABEL_23;
    }
  }
  CFTypeRef v11 = cf;
  if (v18) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = cf == 0;
  }
  if (v12) {
    goto LABEL_24;
  }
  uint64_t CMBaseObject = CMByteStreamGetCMBaseObject();
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  CFBooleanRef v16 = *(void (**)(uint64_t, void, void, id *))(v15 + 48);
  if (v16) {
    v16(CMBaseObject, *MEMORY[0x1E4F1EC78], *MEMORY[0x1E4F1CF80], &v18);
  }
LABEL_23:
  CFTypeRef v11 = cf;
LABEL_24:
  if (v11) {
    CFRelease(v11);
  }
  return (NSURL *)v18;
}

- (AVSampleCursorStorageRange)currentChunkStorageRange
{
  sampleCursor = self->_sampleCursor;
  if (sampleCursor->implementsCopyChunkDetails)
  {
    int64_t v11 = 0;
    int64_t v12 = 0;
    figSampleCursor = sampleCursor->figSampleCursor;
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v8 = *(uint64_t (**)(OpaqueFigSampleCursor *, void, void, int64_t *, int64_t *, void, void, void, void, void))(v5 + 152);
    if (v8)
    {
      int v9 = v8(figSampleCursor, 0, 0, &v12, &v11, 0, 0, 0, 0, 0);
      BOOL v10 = v9 == 0;
      if (v9) {
        int64_t v6 = -1;
      }
      else {
        int64_t v6 = v12;
      }
      if (v10) {
        int64_t v7 = v11;
      }
      else {
        int64_t v7 = 0;
      }
    }
    else
    {
      int64_t v7 = 0;
      int64_t v6 = -1;
    }
  }
  else
  {
    int64_t v6 = [(AVSampleCursor *)self currentSampleStorageRange];
  }
  result.length = v7;
  result.offset = v6;
  return result;
}

- (AVSampleCursorChunkInfo)currentChunkInfo
{
  unint64_t v2 = 65793;
  sampleCursor = self->_sampleCursor;
  if (sampleCursor->implementsCopyChunkDetails
    && ((int64_t v12 = 0,
         __int16 v11 = 0,
         char v10 = 0,
         figSampleCursor = sampleCursor->figSampleCursor,
         (uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0)
      ? (uint64_t v6 = 0)
      : (uint64_t v6 = v5),
        (int64_t v7 = *(unsigned int (**)(OpaqueFigSampleCursor *, void, void, void, void, int64_t *, void, char *, __int16 *, char *))(v6 + 152)) != 0
     && !v7(figSampleCursor, 0, 0, 0, 0, &v12, 0, (char *)&v11 + 1, &v11, &v10)))
  {
    int64_t v8 = v12;
    unint64_t v2 = (HIBYTE(v11) != 0) | ((unint64_t)((_BYTE)v11 != 0) << 8) | ((unint64_t)(v10 != 0) << 16);
  }
  else
  {
    int64_t v8 = 1;
  }
  BOOL v9 = v2;
  result.chunkHasUniformSampleSizes = v9;
  result.chunkHasUniformSampleDurations = BYTE1(v9);
  result.chunkHasUniformFormatDescriptions = BYTE2(v9);
  result.chunkSampleCount = v8;
  return result;
}

- (int64_t)currentSampleIndexInChunk
{
  sampleCursor = self->_sampleCursor;
  if (!sampleCursor->implementsCopyChunkDetails) {
    return 0;
  }
  int64_t v8 = 0;
  figSampleCursor = sampleCursor->figSampleCursor;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v5 = v4 ? v4 : 0;
  uint64_t v6 = *(unsigned int (**)(OpaqueFigSampleCursor *, void, void, void, void, void, int64_t *, void, void, void))(v5 + 152);
  if (!v6) {
    return 0;
  }
  if (v6(figSampleCursor, 0, 0, 0, 0, 0, &v8, 0, 0, 0)) {
    return 0;
  }
  return v8;
}

- (AVSampleCursorStorageRange)currentSampleStorageRange
{
  sampleCursor = self->_sampleCursor;
  int64_t v3 = -1;
  if (sampleCursor->implementsCopySampleLocation)
  {
    int64_t v11 = 0;
    uint64_t v12 = -1;
    figSampleCursor = sampleCursor->figSampleCursor;
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    int64_t v8 = *(uint64_t (**)(OpaqueFigSampleCursor *, uint64_t *, int64_t *, void, void))(v6 + 144);
    if (v8)
    {
      int v9 = v8(figSampleCursor, &v12, &v11, 0, 0);
      BOOL v10 = v9 == 0;
      if (v9) {
        int64_t v3 = -1;
      }
      else {
        int64_t v3 = v12;
      }
      if (v10) {
        int64_t v7 = v11;
      }
      else {
        int64_t v7 = 0;
      }
    }
    else
    {
      int64_t v7 = 0;
      int64_t v3 = -1;
    }
  }
  else
  {
    int64_t v7 = 0;
  }
  result.length = v7;
  result.offset = v3;
  return result;
}

- (NSInteger)samplesRequiredForDecoderRefresh
{
  CFNumberRef number = 0;
  uint64_t FigBaseObject = FigSampleCursorGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, void, CFNumberRef *))(v4 + 48);
  if (!v5) {
    return 0;
  }
  int v6 = v5(FigBaseObject, *MEMORY[0x1E4F346B8], *MEMORY[0x1E4F1CF80], &number);
  CFNumberRef v7 = number;
  if (v6)
  {
    NSInteger v8 = 0;
    if (!number) {
      return v8;
    }
    goto LABEL_7;
  }
  int valuePtr = 0;
  CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
  NSInteger v8 = valuePtr;
  CFNumberRef v7 = number;
  if (number) {
LABEL_7:
  }
    CFRelease(v7);
  return v8;
}

- (id)seamIdentifier
{
  CFTypeRef cf = 0;
  uint64_t FigBaseObject = FigSampleCursorGetFigBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (!v5 || v5(FigBaseObject, *MEMORY[0x1E4F346D0], *MEMORY[0x1E4F1CF80], &cf))
  {
    id v7 = 0;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    id v7 = (id)[v6 initWithUUIDString:cf];
  }
  if (cf) {
    CFRelease(cf);
  }
  return v7;
}

@end