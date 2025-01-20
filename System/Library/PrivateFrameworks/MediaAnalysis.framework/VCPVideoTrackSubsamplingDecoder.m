@interface VCPVideoTrackSubsamplingDecoder
- (VCPVideoTrackSubsamplingDecoder)initWithTrack:(id)a3 timerange:(id *)a4 atInterval:(id *)a5;
- (int64_t)status;
- (opaqueCMSampleBuffer)copyNextSampleBuffer;
- (opaqueCMSampleBuffer)getNextCaptureSampleBuffer;
- (void)dealloc;
@end

@implementation VCPVideoTrackSubsamplingDecoder

- (VCPVideoTrackSubsamplingDecoder)initWithTrack:(id)a3 timerange:(id *)a4 atInterval:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v45.receiver = self;
  v45.super_class = (Class)VCPVideoTrackSubsamplingDecoder;
  v9 = [(VCPVideoTrackDecoder *)&v45 initWithTrack:v8];
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E4F16378];
    v12 = [(AVAssetTrack *)v9->super._track asset];
    uint64_t v13 = [v11 assetReaderWithAsset:v12 error:0];
    assetReader = v10->_assetReader;
    v10->_assetReader = (AVAssetReader *)v13;

    v15 = v10->_assetReader;
    if (v15)
    {
      v16 = (void *)MEMORY[0x1E4F163A0];
      track = v10->super._track;
      v18 = [(VCPVideoTrackDecoder *)v10 settings];
      uint64_t v19 = [v16 assetReaderTrackOutputWithTrack:track outputSettings:v18];
      trackOutput = v10->_trackOutput;
      v10->_trackOutput = (AVAssetReaderTrackOutput *)v19;

      v21 = v10->_trackOutput;
      if (!v21) {
        goto LABEL_8;
      }
      [(AVAssetReaderTrackOutput *)v21 setAppliesPreferredTrackTransform:1];
      [(AVAssetReader *)v10->_assetReader addOutput:v10->_trackOutput];
      v22 = v10->_assetReader;
      long long v23 = *(_OWORD *)&a4->var0.var3;
      v44[0] = *(_OWORD *)&a4->var0.var0;
      v44[1] = v23;
      v44[2] = *(_OWORD *)&a4->var1.var1;
      [(AVAssetReader *)v22 setTimeRange:v44];
      if ([(AVAssetReader *)v10->_assetReader startReading])
      {
        int64_t var3 = a5->var3;
        *(_OWORD *)&v10->_sampleDuration.value = *(_OWORD *)&a5->var0;
        v10->_sampleDuration.CMTimeEpoch epoch = var3;
        v10->_nextSample = (opaqueCMSampleBuffer *)[(AVAssetReaderTrackOutput *)v10->_trackOutput copyNextSampleBuffer];
        v25 = v10->_assetReader;
        if (v25)
        {
          [(AVAssetReader *)v25 timeRange];
        }
        else
        {
          long long v49 = 0u;
          memset(time1, 0, sizeof(time1));
        }
        CMTimeMake(&v42, 0, v10->_sampleDuration.timescale);
        CMTime lhs = *(CMTime *)time1;
        CMTime rhs = v42;
        CMTimeAdd(&v43, &lhs, &rhs);
        p_nextSampleTime = &v10->_nextSampleTime;
        CMTimeEpoch epoch = v43.epoch;
        *(_OWORD *)&v10->_nextSampleTime.value = *(_OWORD *)&v43.value;
        v10->_nextSampleTime.CMTimeEpoch epoch = epoch;
        nextSample = v10->_nextSample;
        if (nextSample)
        {
          memset(&rhs, 0, sizeof(rhs));
          CMSampleBufferGetPresentationTimeStamp(&rhs, nextSample);
          *(CMTime *)time1 = rhs;
          CMTimeEpoch v30 = v10->_nextSampleTime.epoch;
          *(_OWORD *)&lhs.value = *(_OWORD *)&p_nextSampleTime->value;
          lhs.CMTimeEpoch epoch = v30;
          if (CMTimeCompare((CMTime *)time1, &lhs) >= 1)
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v31 = VCPLogInstance();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                long long v32 = *(_OWORD *)&p_nextSampleTime->value;
                time.CMTimeEpoch epoch = v10->_nextSampleTime.epoch;
                *(_OWORD *)&time.value = v32;
                Float64 Seconds = CMTimeGetSeconds(&time);
                CMTime v40 = rhs;
                Float64 v34 = CMTimeGetSeconds(&v40);
                *(_DWORD *)time1 = 134218240;
                *(Float64 *)&time1[4] = Seconds;
                *(_WORD *)&time1[12] = 2048;
                *(Float64 *)&time1[14] = v34;
                _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEFAULT, "Replace initial nextSampleTime %.4f with %.4f", time1, 0x16u);
              }
            }
            long long v35 = *(_OWORD *)&rhs.value;
            v10->_nextSampleTime.CMTimeEpoch epoch = rhs.epoch;
            *(_OWORD *)&p_nextSampleTime->value = v35;
          }
        }
        v36 = v10->_assetReader;
        if (v36) {
          [(AVAssetReader *)v36 timeRange];
        }
        else {
          memset(&v39, 0, sizeof(v39));
        }
        CMTimeRangeGetEnd((CMTime *)time1, &v39);
        int64_t v37 = *(void *)&time1[16];
        *(_OWORD *)&v10->_decodeEnd.value = *(_OWORD *)time1;
        v10->_decodeEnd.CMTimeEpoch epoch = v37;
        v15 = v10;
      }
      else
      {
LABEL_8:
        v15 = 0;
      }
    }
    v26 = v15;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)dealloc
{
  assetReader = self->_assetReader;
  if (assetReader) {
    [(AVAssetReader *)assetReader cancelReading];
  }
  currentSample = self->_currentSample;
  if (currentSample) {
    CFRelease(currentSample);
  }
  nextSample = self->_nextSample;
  if (nextSample) {
    CFRelease(nextSample);
  }
  v6.receiver = self;
  v6.super_class = (Class)VCPVideoTrackSubsamplingDecoder;
  [(VCPVideoTrackSubsamplingDecoder *)&v6 dealloc];
}

- (int64_t)status
{
  CMTime time1 = (CMTime)self->_nextSampleTime;
  $95D729B680665BEAEFA1D6FCA8238556 decodeEnd = self->_decodeEnd;
  if (CMTimeCompare(&time1, (CMTime *)&decodeEnd) < 0) {
    return [(AVAssetReader *)self->_assetReader status];
  }
  else {
    return 2;
  }
}

- (opaqueCMSampleBuffer)copyNextSampleBuffer
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  AVAssetReaderStatus v3 = [(AVAssetReader *)self->_assetReader status];
  p_nextSampleTime = &self->_nextSampleTime;
  time1.duration = (CMTime)self->_nextSampleTime;
  CMTime time2 = (CMTime)self->_decodeEnd;
  int32_t v5 = CMTimeCompare(&time1.duration, &time2);
  result = 0;
  if (v5 < 0 && (unint64_t)(v3 - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    nextSample = self->_nextSample;
    if (nextSample)
    {
      while (1)
      {
        memset(&lhs, 0, sizeof(lhs));
        CMSampleBufferGetPresentationTimeStamp(&lhs, nextSample);
        *(_OWORD *)&time1.duration.CMTimeValue value = *(_OWORD *)&p_nextSampleTime->value;
        time1.duration.CMTimeEpoch epoch = self->_nextSampleTime.epoch;
        CMTime time2 = lhs;
        if (CMTimeCompare(&time1.duration, &time2) < 0) {
          break;
        }
        currentSample = self->_currentSample;
        if (currentSample) {
          CFRelease(currentSample);
        }
        self->_currentSample = self->_nextSample;
        nextSample = (opaqueCMSampleBuffer *)[(AVAssetReaderTrackOutput *)self->_trackOutput copyNextSampleBuffer];
        self->_nextSample = nextSample;
        if (!nextSample)
        {
          if ([(AVAssetReader *)self->_assetReader status] == AVAssetReaderStatusFailed) {
            return 0;
          }
          nextSample = self->_nextSample;
          if (!nextSample) {
            goto LABEL_10;
          }
        }
      }
      v18 = self->_nextSample;
      p_CMTime sampleDuration = (CMTime *)&self->_sampleDuration;
      CMTime sampleDuration = (CMTime)self->_sampleDuration;
      if (v18)
      {
        memset(&lhs, 0, sizeof(lhs));
        CMSampleBufferGetPresentationTimeStamp(&lhs, v18);
        while (1)
        {
          *(_OWORD *)&time1.duration.CMTimeValue value = *(_OWORD *)&p_nextSampleTime->value;
          time1.duration.CMTimeEpoch epoch = self->_nextSampleTime.epoch;
          CMTime time2 = sampleDuration;
          CMTimeAdd(&rhs, &time1.duration, &time2);
          time1.duration = rhs;
          CMTime time2 = lhs;
          if ((CMTimeCompare(&time1.duration, &time2) & 0x80000000) == 0) {
            break;
          }
          time1.duration = sampleDuration;
          *(_OWORD *)&time2.CMTimeValue value = *(_OWORD *)&p_sampleDuration->value;
          time2.CMTimeEpoch epoch = self->_sampleDuration.epoch;
          CMTimeAdd(&sampleDuration, &time1.duration, &time2);
        }
      }
    }
    else
    {
LABEL_10:
      p_CMTime sampleDuration = (CMTime *)&self->_sampleDuration;
      CMTime sampleDuration = (CMTime)self->_sampleDuration;
    }
    *(_OWORD *)&time1.duration.CMTimeValue value = *(_OWORD *)&self->_decodeEnd.value;
    time1.duration.CMTimeEpoch epoch = self->_decodeEnd.epoch;
    *(_OWORD *)&time2.CMTimeValue value = *(_OWORD *)&p_nextSampleTime->value;
    time2.CMTimeEpoch epoch = self->_nextSampleTime.epoch;
    CMTimeSubtract(&lhs, &time1.duration, &time2);
    time1.duration = lhs;
    CMTime time2 = sampleDuration;
    int32_t v10 = CMTimeCompare(&time1.duration, &time2);
    p_CMTime lhs = &sampleDuration;
    if (v10 < 0) {
      p_CMTime lhs = &lhs;
    }
    long long v12 = *(_OWORD *)&p_lhs->value;
    sampleDuration.CMTimeEpoch epoch = p_lhs->epoch;
    *(_OWORD *)&sampleDuration.CMTimeValue value = v12;
    *(_OWORD *)&time1.duration.CMTimeValue value = v12;
    time1.duration.CMTimeEpoch epoch = sampleDuration.epoch;
    CMTime time2 = *p_sampleDuration;
    if (CMTimeCompare(&time1.duration, &time2) > 0)
    {
      memset(&time2, 0, sizeof(time2));
      CMSampleBufferGetPresentationTimeStamp(&time2, self->_currentSample);
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        uint64_t v13 = VCPLogInstance();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          CMTimeValue value = time2.value;
          CMTimeScale timescale = time2.timescale;
          CMTime time = sampleDuration;
          double Seconds = CMTimeGetSeconds(&time);
          CMTime v20 = *p_sampleDuration;
          Float64 v17 = CMTimeGetSeconds(&v20);
          LODWORD(time1.duration.value) = 134218496;
          *(CMTimeValue *)((char *)&time1.duration.value + 4) = value;
          LOWORD(time1.duration.flags) = 1024;
          *(CMTimeFlags *)((char *)&time1.duration.flags + 2) = timescale;
          WORD1(time1.duration.epoch) = 2048;
          *(double *)((char *)&time1.duration.epoch + 4) = Seconds / v17;
          _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Sample at %lld/%d is being extended %0.1fx", (uint8_t *)&time1, 0x1Cu);
        }
      }
    }
    *(_OWORD *)&time1.decodeTimeStamp.CMTimeValue value = *(_OWORD *)&p_nextSampleTime->value;
    time1.decodeTimeStamp.CMTimeEpoch epoch = self->_nextSampleTime.epoch;
    time1.presentationTimeStamp = time1.decodeTimeStamp;
    time1.duration = sampleDuration;
    CMSampleBufferRef sampleBufferOut = 0;
    if (CMSampleBufferCreateCopyWithNewTiming(0, self->_currentSample, 1, &time1, &sampleBufferOut))
    {
      result = sampleBufferOut;
      if (sampleBufferOut)
      {
        CFRelease(sampleBufferOut);
        return 0;
      }
    }
    else
    {
      *(_OWORD *)&lhs.CMTimeValue value = *(_OWORD *)&p_nextSampleTime->value;
      lhs.CMTimeEpoch epoch = self->_nextSampleTime.epoch;
      CMTime rhs = sampleDuration;
      CMTimeAdd(&time2, &lhs, &rhs);
      *(_OWORD *)&p_nextSampleTime->CMTimeValue value = *(_OWORD *)&time2.value;
      self->_nextSampleTime.CMTimeEpoch epoch = time2.epoch;
      return sampleBufferOut;
    }
  }
  return result;
}

- (opaqueCMSampleBuffer)getNextCaptureSampleBuffer
{
  return self->_nextSample;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
}

@end