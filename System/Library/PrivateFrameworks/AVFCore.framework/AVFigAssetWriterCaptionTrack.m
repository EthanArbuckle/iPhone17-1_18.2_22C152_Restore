@interface AVFigAssetWriterCaptionTrack
- (BOOL)addCaption:(id)a3 error:(id *)a4;
- (BOOL)addCaptionGroup:(id)a3 error:(id *)a4;
- (BOOL)addCaptionGroupAsSampleBuffer:(id)a3 error:(id *)a4;
- (BOOL)addSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (BOOL)flushCaptionsUntilTime:(id *)a3 error:(id *)a4;
- (BOOL)flushCaptionsWithError:(id *)a3;
- (BOOL)markEndOfDataReturningError:(id *)a3;
- (int)_attachToFigAssetWriterUsingFormatSpecification:(id)a3 sourcePixelBufferAttributes:(id)a4 multiPass:(BOOL)a5 error:(id *)a6;
- (void)dealloc;
- (void)prepareToEndSession;
@end

@implementation AVFigAssetWriterCaptionTrack

- (int)_attachToFigAssetWriterUsingFormatSpecification:(id)a3 sourcePixelBufferAttributes:(id)a4 multiPass:(BOOL)a5 error:(id *)a6
{
  uint64_t v9 = CMMediaTypeFromAVMediaType([(AVFigAssetWriterTrack *)self mediaType]);
  v10 = [(AVMediaFileType *)[(AVFigAssetWriterTrack *)self mediaFileType] UTI];
  int v32 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if ([(NSString *)v10 isEqualToString:@"com.apple.itunes-timed-text"])
  {
    uint64_t v12 = 1634301044;
  }
  else if ([(NSString *)v10 isEqualToString:@"com.scenarist.closed-caption"])
  {
    uint64_t v12 = 1664495672;
  }
  else if ([(NSString *)v10 isEqualToString:@"org.w3.webvtt"])
  {
    uint64_t v12 = 2004251764;
  }
  else
  {
    uint64_t v12 = 0;
  }
  v13 = (void *)[a3 outputSettings];
  v14 = v13;
  if (v13) {
    [v13 captionTimeCodeFrameDuration];
  }
  long long v30 = 0uLL;
  uint64_t v31 = 0;
  uint64_t v15 = FigCFDictionarySetCMTime();
  if (v15) {
    goto LABEL_27;
  }
  int v16 = objc_msgSend(v14, "useDropFrameTimeCode", 0, 0, 0);
  v17 = (const void **)MEMORY[0x1E4F1CFC8];
  if (v16) {
    v17 = (const void **)MEMORY[0x1E4F1CFD0];
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F32848], *v17);
  v18 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = 0;
  }
  v21 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t, uint64_t, __CFDictionary *, int *))(v20 + 152);
  if (!v21)
  {
    uint64_t v27 = 4294954514;
LABEL_20:
    id v23 = +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:", v27, v30, v31);
    goto LABEL_21;
  }
  uint64_t v15 = v21(v18, v9, v12, Mutable, &v32);
  if (v15)
  {
LABEL_27:
    uint64_t v27 = v15;
    goto LABEL_20;
  }
  v22 = objc_alloc_init(AVCaptionGrouper);
  id v23 = 0;
  self->_captionGrouper = v22;
  uint64_t v24 = MEMORY[0x1E4F1FA20];
  long long v25 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&self->_previousCaptionTimeRange.start.value = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&self->_previousCaptionTimeRange.start.epoch = v25;
  *(_OWORD *)&self->_previousCaptionTimeRange.duration.timescale = *(_OWORD *)(v24 + 32);
  uint64_t v26 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&self->_nextGroupStartTime.value = *MEMORY[0x1E4F1F9F8];
  self->_nextGroupStartTime.epoch = *(void *)(v26 + 16);
LABEL_21:
  int v28 = v32;
  if (a6 && !v32) {
    *a6 = v23;
  }
  if (Mutable)
  {
    CFRelease(Mutable);
    return v32;
  }
  return v28;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVFigAssetWriterCaptionTrack;
  [(AVFigAssetWriterTrack *)&v3 dealloc];
}

- (BOOL)addSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  if (a4) {
    *a4 = (id)AVErrorForClientProgrammingError([MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot call appendSampleBuffer: when a caption adaptor is attached" userInfo:0]);
  }
  return 0;
}

- (BOOL)flushCaptionsUntilTime:(id *)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  captionGrouper = self->_captionGrouper;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = *a3;
  v7 = [(AVCaptionGrouper *)captionGrouper flushAddedCaptionsIntoGroupsUpToTime:&v18];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v7);
      }
      BOOL v12 = [(AVFigAssetWriterCaptionTrack *)self addCaptionGroupAsSampleBuffer:*(void *)(*((void *)&v14 + 1) + 8 * v11) error:a4];
      if (!v12) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v12) = 1;
  }
  return v12;
}

- (BOOL)flushCaptionsWithError:(id *)a3
{
  long long v4 = *MEMORY[0x1E4F1FA10];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  return [(AVFigAssetWriterCaptionTrack *)self flushCaptionsUntilTime:&v4 error:a3];
}

- (BOOL)addCaptionGroupAsSampleBuffer:(id)a3 error:(id *)a4
{
  uint64_t v11 = 0;
  uint64_t v6 = [a3 copySampleBufferWithError:&v11];
  if (v6)
  {
    v7 = (const void *)v6;
    v10.receiver = self;
    v10.super_class = (Class)AVFigAssetWriterCaptionTrack;
    BOOL v8 = [(AVFigAssetWriterTrack *)&v10 addSampleBuffer:v6 error:&v11];
    CFRelease(v7);
    if (!a4) {
      return v8;
    }
  }
  else
  {
    BOOL v8 = 0;
    if (!a4) {
      return v8;
    }
  }
  if (!v8) {
    *a4 = v11;
  }
  return v8;
}

- (BOOL)addCaption:(id)a3 error:(id *)a4
{
  v29 = 0;
  p_previousCaptionTimeRange = &self->_previousCaptionTimeRange;
  if (self->_previousCaptionTimeRange.start.flags)
  {
    if (a3)
    {
      [a3 timeRange];
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v25 = 0u;
    }
    *(_OWORD *)&time1.value = v25;
    time1.epoch = v26;
    *(_OWORD *)time2 = *(_OWORD *)&p_previousCaptionTimeRange->start.value;
    *(void *)&time2[16] = p_previousCaptionTimeRange->start.epoch;
    if (CMTimeCompare(&time1, (CMTime *)time2) < 0)
    {
      BOOL v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      objc_super v10 = @"Caption times must be non-decreasing";
      goto LABEL_21;
    }
  }
  if (self->_nextGroupStartTime.flags)
  {
    if (a3)
    {
      [a3 timeRange];
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v21 = 0u;
    }
    *(_OWORD *)&v24.value = v21;
    v24.epoch = v22;
    *(_OWORD *)time2 = *(_OWORD *)&self->_nextGroupStartTime.value;
    *(void *)&time2[16] = self->_nextGroupStartTime.epoch;
    if (CMTimeCompare(&v24, (CMTime *)time2) < 0)
    {
      BOOL v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      objc_super v10 = @"Caption cannot occur previous previous group";
LABEL_21:
      uint64_t v13 = AVErrorForClientProgrammingError([v8 exceptionWithName:v9 reason:v10 userInfo:0]);
      BOOL result = 0;
      v29 = (void *)v13;
      if (!a4) {
        return result;
      }
      goto LABEL_22;
    }
  }
  if (a3)
  {
    [a3 timeRange];
  }
  else
  {
    long long v20 = 0u;
    memset(time2, 0, sizeof(time2));
  }
  long long v11 = *(_OWORD *)&time2[16];
  *(_OWORD *)&p_previousCaptionTimeRange->start.value = *(_OWORD *)time2;
  *(_OWORD *)&p_previousCaptionTimeRange->start.epoch = v11;
  *(_OWORD *)&p_previousCaptionTimeRange->duration.timescale = v20;
  [(AVCaptionGrouper *)self->_captionGrouper addCaption:a3];
  if (a3)
  {
    [a3 timeRange];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
  }
  long long v17 = v14;
  uint64_t v18 = v15;
  BOOL result = -[AVFigAssetWriterCaptionTrack flushCaptionsUntilTime:error:](self, "flushCaptionsUntilTime:error:", &v17, &v29, v14, v15, v16);
  if (a4)
  {
LABEL_22:
    if (!result) {
      *a4 = v29;
    }
  }
  return result;
}

- (BOOL)addCaptionGroup:(id)a3 error:(id *)a4
{
  long long v27 = 0;
  p_nextGroupStartTime = &self->_nextGroupStartTime;
  if (self->_nextGroupStartTime.flags)
  {
    if (a3)
    {
      [a3 timeRange];
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v23 = 0u;
    }
    *(_OWORD *)&time1.value = v23;
    time1.epoch = v24;
    *(_OWORD *)&time2.start.value = *(_OWORD *)&p_nextGroupStartTime->value;
    time2.start.epoch = p_nextGroupStartTime->epoch;
    if (CMTimeCompare(&time1, &time2.start))
    {
      BOOL v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      objc_super v10 = @"Caption group times must be contiguous";
      goto LABEL_18;
    }
  }
  long long v11 = *(_OWORD *)&self->_previousCaptionTimeRange.start.epoch;
  *(_OWORD *)&time2.start.value = *(_OWORD *)&self->_previousCaptionTimeRange.start.value;
  *(_OWORD *)&time2.start.epoch = v11;
  *(_OWORD *)&time2.duration.timescale = *(_OWORD *)&self->_previousCaptionTimeRange.duration.timescale;
  CMTimeRangeGetEnd(&v22, &time2);
  if (v22.flags)
  {
    if (a3)
    {
      [a3 timeRange];
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v17 = 0u;
    }
    *(_OWORD *)&v20.value = v17;
    v20.epoch = v18;
    long long v12 = *(_OWORD *)&self->_previousCaptionTimeRange.start.epoch;
    *(_OWORD *)&time2.start.value = *(_OWORD *)&self->_previousCaptionTimeRange.start.value;
    *(_OWORD *)&time2.start.epoch = v12;
    *(_OWORD *)&time2.duration.timescale = *(_OWORD *)&self->_previousCaptionTimeRange.duration.timescale;
    CMTimeRangeGetEnd(&v16, &time2);
    if (CMTimeCompare(&v20, &v16) < 0)
    {
      BOOL v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      objc_super v10 = @"Caption group cannot occur before previous caption";
LABEL_18:
      uint64_t v14 = AVErrorForClientProgrammingError([v8 exceptionWithName:v9 reason:v10 userInfo:0]);
      BOOL result = 0;
      long long v27 = (void *)v14;
      if (!a4) {
        return result;
      }
      goto LABEL_19;
    }
  }
  if (a3) {
    [a3 timeRange];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  CMTimeRangeGetEnd(&time2.start, &v15);
  *(_OWORD *)&p_nextGroupStartTime->value = *(_OWORD *)&time2.start.value;
  p_nextGroupStartTime->epoch = time2.start.epoch;
  BOOL result = [(AVFigAssetWriterCaptionTrack *)self addCaptionGroupAsSampleBuffer:a3 error:&v27];
  if (a4)
  {
LABEL_19:
    if (!result) {
      *a4 = v27;
    }
  }
  return result;
}

- (void)prepareToEndSession
{
  [(AVFigAssetWriterCaptionTrack *)self flushCaptionsWithError:0];
  v3.receiver = self;
  v3.super_class = (Class)AVFigAssetWriterCaptionTrack;
  [(AVFigAssetWriterTrack *)&v3 prepareToEndSession];
}

- (BOOL)markEndOfDataReturningError:(id *)a3
{
  BOOL v8 = 0;
  BOOL v5 = [(AVFigAssetWriterCaptionTrack *)self flushCaptionsWithError:&v8];
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)AVFigAssetWriterCaptionTrack;
    LOBYTE(v5) = [(AVFigAssetWriterTrack *)&v7 markEndOfDataReturningError:&v8];
  }
  if (a3 && !v5) {
    *a3 = v8;
  }
  return v5;
}

@end