@interface AVFigAssetWriterAudioTrack
- (AVFigAssetWriterAudioTrack)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 mediaType:(id)a4 mediaFileType:(id)a5 formatSpecification:(id)a6 sourcePixelBufferAttributes:(id)a7 multiPass:(BOOL)a8 error:(id *)a9;
- (BOOL)_flushPendingSampleBuffersReturningError:(id *)a3;
- (BOOL)addSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (BOOL)markEndOfDataReturningError:(id *)a3;
- (int)_attachToFigAssetWriterUsingFormatSpecification:(id)a3 sourcePixelBufferAttributes:(id)a4 multiPass:(BOOL)a5 error:(id *)a6;
- (void)dealloc;
- (void)prepareToEndSession;
@end

@implementation AVFigAssetWriterAudioTrack

- (AVFigAssetWriterAudioTrack)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 mediaType:(id)a4 mediaFileType:(id)a5 formatSpecification:(id)a6 sourcePixelBufferAttributes:(id)a7 multiPass:(BOOL)a8 error:(id *)a9
{
  v11.receiver = self;
  v11.super_class = (Class)AVFigAssetWriterAudioTrack;
  v9 = [(AVFigAssetWriterTrack *)&v11 initWithFigAssetWriter:a3 mediaType:a4 mediaFileType:a5 formatSpecification:a6 sourcePixelBufferAttributes:a7 multiPass:a8 error:a9];
  if (v9) {
    v9->_pendingAudioSampleBuffers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVFigAssetWriterAudioTrack;
  [(AVFigAssetWriterTrack *)&v3 dealloc];
}

- (int)_attachToFigAssetWriterUsingFormatSpecification:(id)a3 sourcePixelBufferAttributes:(id)a4 multiPass:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v30 = 0;
  int v29 = 0;
  objc_super v11 = (void *)[a3 outputSettings];
  uint64_t v12 = [a3 sourceFormatDescription];
  v13 = [(AVFigAssetWriterTrack *)self mediaFileType];
  if (!v11)
  {
    v25.receiver = self;
    v25.super_class = (Class)AVFigAssetWriterAudioTrack;
    int v29 = [(AVFigAssetWriterTrack *)&v25 _attachToFigAssetWriterUsingFormatSpecification:a3 sourcePixelBufferAttributes:a4 multiPass:v7 error:&v30];
    if (!a6) {
      return v29;
    }
    goto LABEL_16;
  }
  v14 = v13;
  uint64_t v28 = 0;
  memset(v27, 0, sizeof(v27));
  uint64_t v26 = 0;
  if (v12) {
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v12 forKey:*MEMORY[0x1E4F324F8]];
  }
  else {
    uint64_t v15 = 0;
  }
  [v11 willYieldCompressedSamples];
  objc_msgSend(v11, "getAudioStreamBasicDescription:forAudioFileTypeID:sourceFormatDescription:", v27, -[AVMediaFileType audioFileTypeID](v14, "audioFileTypeID"), v12);
  v16 = (void *)[v11 copyAudioChannelLayoutForSourceFormatDescription:v12 audioChannelLayoutSize:&v26];
  uint64_t v17 = [v11 audioOptions];
  v18 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v19 = v26;
  uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v20) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 0;
  }
  v22 = *(uint64_t (**)(OpaqueFigAssetWriter *, _OWORD *, uint64_t, void *, uint64_t, uint64_t, int *))(v21 + 16);
  if (!v22)
  {
    uint64_t v23 = 4294954514;
    goto LABEL_14;
  }
  uint64_t v23 = v22(v18, v27, v19, v16, v17, v15, &v29);
  if (v23) {
LABEL_14:
  }
    id v30 = +[AVAssetWriter _errorForOSStatus:v23];
  free(v16);
  if (a6) {
LABEL_16:
  }
    *a6 = v30;
  return v29;
}

- (BOOL)_flushPendingSampleBuffersReturningError:(id *)a3
{
  pendingAudioSampleBuffers = self->_pendingAudioSampleBuffers;
  CMBlockBufferRef blockBufferOut = 0;
  memset(&timingInfoOut, 0, sizeof(timingInfoOut));
  size_t sampleSizeArray = 0;
  CMSampleBufferRef v21 = 0;
  uint64_t v6 = CMBlockBufferCreateEmpty(0, [(NSMutableArray *)pendingAudioSampleBuffers count], 0, &blockBufferOut);
  if (v6)
  {
    uint64_t v15 = v6;
    CMSampleBufferRef v16 = 0;
  }
  else
  {
    uint64_t v7 = [(NSMutableArray *)pendingAudioSampleBuffers count];
    if (v7 < 1)
    {
      FormatDescription = 0;
      CMItemCount v10 = 0;
    }
    else
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      CMItemCount v10 = 0;
      FormatDescription = 0;
      do
      {
        uint64_t v12 = (opaqueCMSampleBuffer *)[(NSMutableArray *)pendingAudioSampleBuffers objectAtIndex:v9];
        CMItemCount NumSamples = CMSampleBufferGetNumSamples(v12);
        if (!v9)
        {
          FormatDescription = CMSampleBufferGetFormatDescription(v12);
          size_t sampleSizeArray = CMSampleBufferGetSampleSize(v12, 0);
          CMSampleBufferGetSampleTimingInfo(v12, 0, &timingInfoOut);
        }
        v10 += NumSamples;
        DataBuffer = CMSampleBufferGetDataBuffer(v12);
        CMBlockBufferAppendBufferReference(blockBufferOut, DataBuffer, 0, 0, 0);
        ++v9;
      }
      while (v8 != v9);
    }
    uint64_t v15 = CMSampleBufferCreate(0, blockBufferOut, 1u, 0, 0, FormatDescription, v10, 1, &timingInfoOut, 1, &sampleSizeArray, &v21);
    if (v15) {
      CMSampleBufferRef v16 = 0;
    }
    else {
      CMSampleBufferRef v16 = v21;
    }
  }
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  timingInfoOut.duration.value = 0;
  if (v15)
  {
    id v17 = +[AVAssetWriter _errorForOSStatus:v15];
    LOBYTE(v15) = 0;
    timingInfoOut.duration.value = (CMTimeValue)v17;
    if (!v16) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v19.receiver = self;
  v19.super_class = (Class)AVFigAssetWriterAudioTrack;
  LODWORD(v15) = [(AVFigAssetWriterTrack *)&v19 addSampleBuffer:v16 error:&timingInfoOut];
  if (v16) {
LABEL_16:
  }
    CFRelease(v16);
LABEL_17:
  [(NSMutableArray *)self->_pendingAudioSampleBuffers removeAllObjects];
  if (a3) {
    *a3 = (id)timingInfoOut.duration.value;
  }
  return v15;
}

- (BOOL)addSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!self)
  {
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    goto LABEL_19;
  }
  [(AVFigAssetWriterTrack *)self sampleBufferCoalescingInterval];
  if ((v29 & 0x100000000) == 0)
  {
LABEL_19:
    v27.receiver = self;
    v27.super_class = (Class)AVFigAssetWriterAudioTrack;
    LOBYTE(v9) = [(AVFigAssetWriterTrack *)&v27 addSampleBuffer:a3 error:a4];
    return v9;
  }
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (![(NSMutableArray *)self->_pendingAudioSampleBuffers count]
    || (uint64_t v8 = CMSampleBufferGetFormatDescription((CMSampleBufferRef)[(NSMutableArray *)self->_pendingAudioSampleBuffers objectAtIndex:0]), CMFormatDescriptionEqual(FormatDescription, v8))|| (v9 = [(AVFigAssetWriterAudioTrack *)self _flushPendingSampleBuffersReturningError:a4]))
  {
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
    if (StreamBasicDescription
      && StreamBasicDescription->mFormatID == 1819304813
      && (StreamBasicDescription->mFormatFlags & 0x20) == 0)
    {
      [(NSMutableArray *)self->_pendingAudioSampleBuffers addObject:a3];
      long long v11 = *MEMORY[0x1E4F1FA48];
      v26.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      *(_OWORD *)&v26.value = v11;
      pendingAudioSampleBuffers = self->_pendingAudioSampleBuffers;
      uint64_t v13 = [(NSMutableArray *)pendingAudioSampleBuffers countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(pendingAudioSampleBuffers);
            }
            CMSampleBufferGetDuration(&rhs, *(CMSampleBufferRef *)(*((void *)&v22 + 1) + 8 * i));
            CMTime lhs = v26;
            CMTimeAdd(&v26, &lhs, &rhs);
          }
          uint64_t v14 = [(NSMutableArray *)pendingAudioSampleBuffers countByEnumeratingWithState:&v22 objects:v31 count:16];
        }
        while (v14);
      }
      [(AVFigAssetWriterTrack *)self sampleBufferCoalescingInterval];
      CMTime lhs = v26;
      LOBYTE(v9) = CMTimeCompare(&lhs, &time2) < 1
                || [(AVFigAssetWriterAudioTrack *)self _flushPendingSampleBuffersReturningError:a4];
    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)AVFigAssetWriterAudioTrack;
      LOBYTE(v9) = [(AVFigAssetWriterTrack *)&v18 addSampleBuffer:a3 error:a4];
    }
  }
  return v9;
}

- (void)prepareToEndSession
{
  if ([(NSMutableArray *)self->_pendingAudioSampleBuffers count])
  {
    [(AVFigAssetWriterAudioTrack *)self _flushPendingSampleBuffersReturningError:0];
  }
}

- (BOOL)markEndOfDataReturningError:(id *)a3
{
  uint64_t v8 = 0;
  if (![(NSMutableArray *)self->_pendingAudioSampleBuffers count]
    || (BOOL v5 = [(AVFigAssetWriterAudioTrack *)self _flushPendingSampleBuffersReturningError:&v8]))
  {
    v7.receiver = self;
    v7.super_class = (Class)AVFigAssetWriterAudioTrack;
    LOBYTE(v5) = [(AVFigAssetWriterTrack *)&v7 markEndOfDataReturningError:&v8];
  }
  if (a3) {
    *a3 = v8;
  }
  return v5;
}

@end