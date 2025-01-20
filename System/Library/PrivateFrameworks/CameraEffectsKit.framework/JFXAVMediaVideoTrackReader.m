@interface JFXAVMediaVideoTrackReader
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTimeOfCurrentData;
- (BOOL)hasRemainingAvailableData;
- (BOOL)readAheadToTime:(id *)a3;
- (JFXAVMediaVideoTrackReaderSample)currentSample;
- (JFXAVMediaVideoTrackReaderSample)nextSample;
- (id)createAssetReaderTrackOutput;
- (id)videoSampleForTime:(id *)a3;
- (void)JFX_preloadData;
- (void)JFX_updateCurrentSampleDurationIfNeeded;
- (void)didUpdateReadingRange;
- (void)readAndDiscardRemainingAvailableData;
- (void)setCurrentSample:(id)a3;
- (void)setNextSample:(id)a3;
@end

@implementation JFXAVMediaVideoTrackReader

- (id)createAssetReaderTrackOutput
{
  v16[1] = *MEMORY[0x263EF8340];
  v3 = [(JFXAVMediaDataReader *)self assetTrack];
  v4 = [v3 formatDescriptions];
  v5 = [v4 objectAtIndexedSubscript:0];

  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v5);
  if (MediaSubType == 1752589105) {
    uint64_t v7 = 1212493921;
  }
  else {
    uint64_t v7 = MediaSubType;
  }
  uint64_t v14 = 0;
  v8 = [(id)objc_opt_class() trackOptionsForDepthCodecType:v7 error:&v14];
  if (v14)
  {
    uint64_t v15 = *MEMORY[0x263F04180];
    v16[0] = &unk_26E801728;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

    v8 = (void *)v9;
  }
  id v10 = objc_alloc(MEMORY[0x263EFA4D8]);
  v11 = [(JFXAVMediaDataReader *)self assetTrack];
  v12 = (void *)[v10 initWithTrack:v11 outputSettings:v8];

  return v12;
}

- (void)didUpdateReadingRange
{
  [(JFXAVMediaVideoTrackReader *)self setCurrentSample:0];
  [(JFXAVMediaVideoTrackReader *)self setNextSample:0];
  [(JFXAVMediaVideoTrackReader *)self JFX_preloadData];
}

- (BOOL)readAheadToTime:(id *)a3
{
  uint64_t v5 = [(JFXAVMediaVideoTrackReader *)self nextSample];
  if (v5)
  {
    v6 = (void *)v5;
    uint64_t v7 = (CMTime *)MEMORY[0x263F010E0];
    do
    {
      v8 = [(JFXAVMediaVideoTrackReader *)self nextSample];
      uint64_t v9 = v8;
      if (v8) {
        [v8 presentationTimeStamp];
      }
      else {
        memset(&time2, 0, sizeof(time2));
      }
      $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = *a3;
      int32_t v10 = CMTimeCompare((CMTime *)&v22, &time2);

      if (v10 < 0) {
        break;
      }
      v11 = (void *)MEMORY[0x237DD1350]();
      v12 = [(JFXAVMediaVideoTrackReader *)self nextSample];
      [(JFXAVMediaVideoTrackReader *)self setCurrentSample:v12];

      v13 = [(JFXAVMediaDataReader *)self assetReaderTrackOutput];
      uint64_t v14 = (const void *)[v13 copyNextSampleBuffer];

      if (v14)
      {
        uint64_t v15 = [JFXAVMediaVideoTrackReaderSample alloc];
        $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)v7;
        v16 = [(JFXAVMediaVideoTrackReaderSample *)v15 initWithSampleBuffer:v14 duration:&v22];
        [(JFXAVMediaVideoTrackReader *)self setNextSample:v16];

        CFRelease(v14);
      }
      else
      {
        [(JFXAVMediaVideoTrackReader *)self setNextSample:0];
      }
      v6 = [(JFXAVMediaVideoTrackReader *)self nextSample];
    }
    while (v6);
  }
  [(JFXAVMediaVideoTrackReader *)self JFX_updateCurrentSampleDurationIfNeeded];
  v17 = [(JFXAVMediaDataReader *)self assetReader];
  uint64_t v18 = [v17 status];

  if (v18 == 3)
  {
    v19 = [(JFXAVMediaDataReader *)self assetReader];
    v20 = [v19 error];
    [(JFXAVMediaDataReader *)self didFailWithError:v20];
  }
  return v18 != 3;
}

- (void)readAndDiscardRemainingAvailableData
{
  v3 = [(JFXAVMediaVideoTrackReader *)self nextSample];

  if (v3)
  {
    do
    {
      v4 = (void *)MEMORY[0x237DD1350]();
      uint64_t v5 = [(JFXAVMediaDataReader *)self assetReaderTrackOutput];
      v6 = (const void *)[v5 copyNextSampleBuffer];

      if (v6)
      {
        uint64_t v7 = [[JFXAVMediaVideoTrackReaderSample alloc] initWithSampleBuffer:v6];
        [(JFXAVMediaVideoTrackReader *)self setNextSample:v7];

        CFRelease(v6);
      }
      else
      {
        [(JFXAVMediaVideoTrackReader *)self setNextSample:0];
      }
      v8 = [(JFXAVMediaVideoTrackReader *)self nextSample];
    }
    while (v8);
  }
  uint64_t v9 = [(JFXAVMediaDataReader *)self assetReader];
  uint64_t v10 = [v9 status];

  if (v10 == 3)
  {
    id v12 = [(JFXAVMediaDataReader *)self assetReader];
    v11 = [v12 error];
    [(JFXAVMediaDataReader *)self didFailWithError:v11];
  }
}

- (BOOL)hasRemainingAvailableData
{
  v2 = [(JFXAVMediaVideoTrackReader *)self nextSample];
  BOOL v3 = v2 != 0;

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTimeOfCurrentData
{
  uint64_t v5 = [(JFXAVMediaVideoTrackReader *)self currentSample];

  if (v5)
  {
    uint64_t v7 = [(JFXAVMediaVideoTrackReader *)self currentSample];
    if (v7)
    {
      uint64_t v9 = v7;
      [v7 presentationTimeStamp];
      uint64_t v7 = v9;
    }
    else
    {
      retstr->var0 = 0;
      *(void *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F010E0];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x263F010E0];
    retstr->var3 = *(void *)(v8 + 16);
  }
  return result;
}

- (void)JFX_preloadData
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  BOOL v3 = [(JFXAVMediaDataReader *)self assetReader];
  uint64_t v4 = [v3 status];

  if (v4 == 1)
  {
    uint64_t v5 = [(JFXAVMediaDataReader *)self assetReaderTrackOutput];
    v6 = (const void *)[v5 copyNextSampleBuffer];

    if (v6)
    {
      uint64_t v7 = [[JFXAVMediaVideoTrackReaderSample alloc] initWithSampleBuffer:v6];
      [(JFXAVMediaVideoTrackReader *)self setCurrentSample:v7];

      CFRelease(v6);
    }
  }
  uint64_t v8 = [(JFXAVMediaVideoTrackReader *)self currentSample];

  if (!v8)
  {
    uint64_t v9 = JFXLog_DebugMediaDataReader();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      [(JFXAVMediaDataReader *)self currentReadingRange];
      CMTime time = v20;
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 138412546;
      v23 = self;
      __int16 v24 = 2048;
      Float64 v25 = Seconds;
      _os_log_debug_impl(&dword_234C41000, v9, OS_LOG_TYPE_DEBUG, "%@ could not preload metadata from time %f", buf, 0x16u);
    }
  }
  uint64_t v10 = [(JFXAVMediaDataReader *)self assetReader];
  uint64_t v11 = [v10 status];

  if (v11 == 1)
  {
    id v12 = [(JFXAVMediaDataReader *)self assetReaderTrackOutput];
    v13 = (const void *)[v12 copyNextSampleBuffer];

    if (v13)
    {
      uint64_t v14 = [[JFXAVMediaVideoTrackReaderSample alloc] initWithSampleBuffer:v13];
      [(JFXAVMediaVideoTrackReader *)self setNextSample:v14];

      CFRelease(v13);
    }
  }
  [(JFXAVMediaVideoTrackReader *)self JFX_updateCurrentSampleDurationIfNeeded];
  uint64_t v15 = [(JFXAVMediaDataReader *)self assetReader];
  uint64_t v16 = [v15 status];

  if (v16 == 3)
  {
    v17 = [(JFXAVMediaDataReader *)self assetReader];
    uint64_t v18 = [v17 error];
    [(JFXAVMediaDataReader *)self didFailWithError:v18];
  }
}

- (void)JFX_updateCurrentSampleDurationIfNeeded
{
  BOOL v3 = [(JFXAVMediaVideoTrackReader *)self currentSample];

  if (v3)
  {
    memset(&v20, 0, sizeof(v20));
    uint64_t v4 = [(JFXAVMediaVideoTrackReader *)self currentSample];
    uint64_t v5 = v4;
    if (v4) {
      [v4 duration];
    }
    else {
      memset(&v20, 0, sizeof(v20));
    }

    if ((v20.flags & 1) == 0
      || (time1 = v20, CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0], !CMTimeCompare(&time1, &time2)))
    {
      memset(&time1, 0, sizeof(time1));
      v6 = [(JFXAVMediaVideoTrackReader *)self currentSample];
      CMSampleBufferGetDuration(&time1, (CMSampleBufferRef)[v6 sampleBufferRef]);

      if ((time1.flags & 1) == 0)
      {
        uint64_t v7 = [(JFXAVMediaVideoTrackReader *)self nextSample];

        if (v7)
        {
          uint64_t v8 = [(JFXAVMediaVideoTrackReader *)self nextSample];
          uint64_t v9 = v8;
          if (v8) {
            [v8 presentationTimeStamp];
          }
          else {
            memset(&lhs, 0, sizeof(lhs));
          }
          uint64_t v10 = [(JFXAVMediaVideoTrackReader *)self currentSample];
          uint64_t v11 = v10;
          if (v10) {
            [v10 presentationTimeStamp];
          }
          else {
            memset(&v16, 0, sizeof(v16));
          }
          CMTimeSubtract(&time2, &lhs, &v16);
          CMTime time1 = time2;
        }
      }
      if (time1.flags)
      {
        id v12 = [JFXAVMediaVideoTrackReaderSample alloc];
        v13 = [(JFXAVMediaVideoTrackReader *)self currentSample];
        uint64_t v14 = [v13 sampleBufferRef];
        CMTime time2 = time1;
        uint64_t v15 = [(JFXAVMediaVideoTrackReaderSample *)v12 initWithSampleBuffer:v14 duration:&time2];
        [(JFXAVMediaVideoTrackReader *)self setCurrentSample:v15];
      }
    }
  }
}

- (id)videoSampleForTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  if ([(JFXAVMediaDataReader *)self seekToTime:&v6])
  {
    uint64_t v4 = [(JFXAVMediaVideoTrackReader *)self currentSample];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (JFXAVMediaVideoTrackReaderSample)currentSample
{
  return self->_currentSample;
}

- (void)setCurrentSample:(id)a3
{
}

- (JFXAVMediaVideoTrackReaderSample)nextSample
{
  return self->_nextSample;
}

- (void)setNextSample:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextSample, 0);
  objc_storeStrong((id *)&self->_currentSample, 0);
}

@end