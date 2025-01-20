@interface VCPVideoTrackStandardDecoder
- (VCPVideoTrackStandardDecoder)initWithTrack:(id)a3 timerange:(id *)a4;
- (VCPVideoTrackStandardDecoder)initWithTrack:(id)a3 timerange:(id *)a4 withSettings:(id)a5 applyTransform:(BOOL)a6;
- (int64_t)status;
- (opaqueCMSampleBuffer)copyNextSampleBuffer;
- (void)dealloc;
@end

@implementation VCPVideoTrackStandardDecoder

- (VCPVideoTrackStandardDecoder)initWithTrack:(id)a3 timerange:(id *)a4
{
  return [(VCPVideoTrackStandardDecoder *)self initWithTrack:a3 timerange:a4 withSettings:0 applyTransform:1];
}

- (VCPVideoTrackStandardDecoder)initWithTrack:(id)a3 timerange:(id *)a4 withSettings:(id)a5 applyTransform:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)VCPVideoTrackStandardDecoder;
  v12 = [(VCPVideoTrackDecoder *)&v30 initWithTrack:v10];
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x1E4F16378];
    v15 = [(AVAssetTrack *)v12->super._track asset];
    uint64_t v16 = [v14 assetReaderWithAsset:v15 error:0];
    assetReader = v13->_assetReader;
    v13->_assetReader = (AVAssetReader *)v16;

    v18 = v13->_assetReader;
    if (v18)
    {
      v19 = v11;
      if (!v11)
      {
        v19 = [(VCPVideoTrackDecoder *)v13 settings];
      }
      objc_storeStrong((id *)&v13->_decoderSettings, v19);
      if (!v11) {

      }
      uint64_t v20 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v13->super._track outputSettings:v13->_decoderSettings];
      trackOutput = v13->_trackOutput;
      v13->_trackOutput = (AVAssetReaderTrackOutput *)v20;

      v22 = v13->_trackOutput;
      if (!v22) {
        goto LABEL_12;
      }
      [(AVAssetReaderTrackOutput *)v22 setAppliesPreferredTrackTransform:v6];
      [(AVAssetReader *)v13->_assetReader addOutput:v13->_trackOutput];
      v23 = v13->_assetReader;
      long long v24 = *(_OWORD *)&a4->var0.var3;
      v29[0] = *(_OWORD *)&a4->var0.var0;
      v29[1] = v24;
      v29[2] = *(_OWORD *)&a4->var1.var1;
      [(AVAssetReader *)v23 setTimeRange:v29];
      if ([(AVAssetReader *)v13->_assetReader startReading])
      {
        uint64_t v25 = [(AVAssetReaderTrackOutput *)v13->_trackOutput copyNextSampleBuffer];
        v13->_nextSample = (opaqueCMSampleBuffer *)v25;
        if (v25) {
          uint64_t v26 = 1;
        }
        else {
          uint64_t v26 = [(AVAssetReader *)v13->_assetReader status];
        }
        v13->_status = v26;
        v18 = v13;
      }
      else
      {
LABEL_12:
        v18 = 0;
      }
    }
    v27 = v18;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)dealloc
{
  nextSample = self->_nextSample;
  if (nextSample) {
    CFRelease(nextSample);
  }
  assetReader = self->_assetReader;
  if (assetReader) {
    [(AVAssetReader *)assetReader cancelReading];
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPVideoTrackStandardDecoder;
  [(VCPVideoTrackStandardDecoder *)&v5 dealloc];
}

- (int64_t)status
{
  return self->_status;
}

- (opaqueCMSampleBuffer)copyNextSampleBuffer
{
  nextSample = self->_nextSample;
  if (!nextSample) {
    return 0;
  }
  v4 = (opaqueCMSampleBuffer *)[(AVAssetReaderTrackOutput *)self->_trackOutput copyNextSampleBuffer];
  self->_nextSample = v4;
  objc_super v5 = (CMTime *)MEMORY[0x1E4F1F9F8];
  CMTime v18 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  if (!v4)
  {
    AVAssetReaderStatus v6 = [(AVAssetReader *)self->_assetReader status];
    self->_status = v6;
    if (v6 == AVAssetReaderStatusCompleted)
    {
      v7 = [(AVAssetReaderTrackOutput *)self->_trackOutput track];
      v8 = v7;
      if (v7) {
        [v7 timeRange];
      }
      else {
        memset(&range, 0, sizeof(range));
      }
      CMTimeRangeGetEnd(&rhs, &range);
      assetReader = self->_assetReader;
      if (assetReader) {
        [(AVAssetReader *)assetReader timeRange];
      }
      else {
        memset(&v15, 0, sizeof(v15));
      }
      CMTimeRangeGetEnd(&v16, &v15);
      v14.duration = v16;
      CMTime time2 = rhs;
      int32_t v11 = CMTimeCompare(&v14.duration, &time2);
      p_CMTime rhs = &rhs;
      if (v11 < 0) {
        p_CMTime rhs = &v16;
      }
      CMTime v18 = *p_rhs;

      goto LABEL_16;
    }
    CFRelease(nextSample);
    return 0;
  }
  CMSampleBufferGetPresentationTimeStamp(&v18, v4);
LABEL_16:
  v14.decodeTimeStamp = *v5;
  CMSampleBufferGetPresentationTimeStamp(&v14.presentationTimeStamp, nextSample);
  CMTime time2 = v18;
  CMTime rhs = v14.presentationTimeStamp;
  CMTimeSubtract(&v16, &time2, &rhs);
  v14.duration = v16;
  time2.value = 0;
  if (CMSampleBufferCreateCopyWithNewTiming(0, nextSample, 1, &v14, (CMSampleBufferRef *)&time2))
  {
    v13 = self->_nextSample;
    if (v13)
    {
      CFRelease(v13);
      self->_nextSample = 0;
    }
    self->_status = 3;
  }
  CFRelease(nextSample);
  return (opaqueCMSampleBuffer *)time2.value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoderSettings, 0);
  objc_storeStrong((id *)&self->_trackOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
}

@end