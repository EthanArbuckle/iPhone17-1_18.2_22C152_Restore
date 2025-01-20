@interface VCPSongDetector
- (VCPSongDetector)init;
- (id)results;
- (int)finalizeAnalysisAtTime:(id *)a3;
- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4;
- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 andSampleBatchSize:(int)a4;
@end

@implementation VCPSongDetector

- (VCPSongDetector)init
{
  v9.receiver = self;
  v9.super_class = (Class)VCPSongDetector;
  v2 = [(VCPSongDetector *)&v9 init];
  v3 = (VCPSongDetector *)v2;
  if (v2)
  {
    *((void *)v2 + 2) = 0;
    *((_DWORD *)v2 + 6) = 1182400512;
    uint64_t v4 = MEMORY[0x1E4F1F9F8];
    long long v5 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v2 + 40) = *MEMORY[0x1E4F1F9F8];
    uint64_t v6 = *(void *)(v4 + 16);
    *((void *)v2 + 7) = v6;
    *((_OWORD *)v2 + 4) = v5;
    *((void *)v2 + 10) = v6;
    v7 = v2;
  }

  return v3;
}

- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 andSampleBatchSize:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
  if (!StreamBasicDescription) {
    return -50;
  }
  float mSampleRate = StreamBasicDescription->mSampleRate;
  self->_sampleRate = mSampleRate;
  objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F153A0]) initWithCommonFormat:1 sampleRate:1 channels:1 interleaved:self->_sampleRate];
  v10 = (AVAudioPCMBuffer *)[objc_alloc(MEMORY[0x1E4F153B0]) initWithPCMFormat:v9 frameCapacity:v4];
  pcmBuffer = self->_pcmBuffer;
  self->_pcmBuffer = v10;

  v12 = self->_pcmBuffer;
  if (v12)
  {
    [(AVAudioPCMBuffer *)v12 setFrameLength:v4];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v13 = (void *)getSHMutableSignatureClass(void)::softClass;
    uint64_t v23 = getSHMutableSignatureClass(void)::softClass;
    if (!getSHMutableSignatureClass(void)::softClass)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = ___ZL26getSHMutableSignatureClassv_block_invoke;
      v19[3] = &unk_1E62970F8;
      v19[4] = &v20;
      ___ZL26getSHMutableSignatureClassv_block_invoke((uint64_t)v19);
      v13 = (void *)v21[3];
    }
    v14 = v13;
    _Block_object_dispose(&v20, 8);
    v15 = (SHMutableSignature *)objc_alloc_init(v14);
    signature = self->_signature;
    self->_signature = v15;

    if (self->_signature) {
      int v17 = 0;
    }
    else {
      int v17 = -18;
    }
  }
  else
  {
    int v17 = -18;
  }

  return v17;
}

- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((self->_startTime.flags & 1) == 0)
  {
    p_sampleRate = &self->_sampleRate;
    CMTimeMake(&v19, 0, (int)self->_sampleRate);
    self->_startTime = ($95D729B680665BEAEFA1D6FCA8238556)v19;
    CMTimeMake(&v19, 0, (int)*p_sampleRate);
    self->_endTime = ($95D729B680665BEAEFA1D6FCA8238556)v19;
  }
  if ((float)(self->_sampleRate * 11.0) < (float)self->_framePosition) {
    return 0;
  }
  mData = a3->mBuffers[0].mData;
  uint64_t mDataByteSize = (int)a3->mBuffers[0].mDataByteSize;
  if (mDataByteSize != 4 * [(AVAudioPCMBuffer *)self->_pcmBuffer frameLength]) {
    return -50;
  }
  memcpy(*(void **)([(AVAudioPCMBuffer *)self->_pcmBuffer mutableAudioBufferList] + 16), mData, 4 * [(AVAudioPCMBuffer *)self->_pcmBuffer frameLength]);
  signature = self->_signature;
  pcmBuffer = self->_pcmBuffer;
  id v18 = 0;
  char v12 = [(SHMutableSignature *)signature appendBuffer:pcmBuffer atTime:0 error:&v18];
  id v13 = v18;
  if (v12)
  {
    int64_t v14 = self->_framePosition + [(AVAudioPCMBuffer *)self->_pcmBuffer frameLength];
    self->_framePosition = v14;
    CMTimeMake(&v19, v14, (int)self->_sampleRate);
    int v7 = 0;
    self->_endTime = ($95D729B680665BEAEFA1D6FCA8238556)v19;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = [v13 description];
        LODWORD(v19.value) = 138412290;
        *(CMTimeValue *)((char *)&v19.value + 4) = (CMTimeValue)v16;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "song analysis failed %@", (uint8_t *)&v19, 0xCu);
      }
    }
    int v7 = -18;
  }

  return v7;
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  return 0;
}

- (id)results
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (self->_signature)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v3 encodeObject:self->_signature forKey:@"songSignature"];
    uint64_t v4 = [v3 encodedData];

    if (v4)
    {
      CMTime v19 = @"SongResults";
      v16[0] = @"start";
      $95D729B680665BEAEFA1D6FCA8238556 startTime = self->_startTime;
      CFDictionaryRef v5 = CMTimeCopyAsDictionary((CMTime *)&startTime, 0);
      v17[0] = v5;
      v16[1] = @"duration";
      $95D729B680665BEAEFA1D6FCA8238556 startTime = self->_endTime;
      CFDictionaryRef v6 = CMTimeCopyAsDictionary((CMTime *)&startTime, 0);
      v17[1] = v6;
      v16[2] = @"attributes";
      int64_t v14 = @"songSignature";
      int v7 = [v3 encodedData];
      v15 = v7;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      v17[2] = v8;
      objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
      id v18 = v9;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      v20[0] = v10;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

      goto LABEL_6;
    }
  }
  v11 = 0;
LABEL_6:
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_pcmBuffer, 0);
}

@end