@interface VCPAudioAnalyzer
- (VCPAudioAnalyzer)initWithAnalysisTypes:(unint64_t)a3 forStreaming:(BOOL)a4;
- (id)audioFormatRequirements;
- (id)voiceDetections;
- (int)analyzeAsset:(id)a3 cancel:(id)a4 results:(id *)a5;
- (int)analyzeSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (int)finalizeAnalysisAtTime:(id *)a3;
- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4;
- (int)processSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 andTrackDuration:(id *)a4;
- (void)dealloc;
@end

@implementation VCPAudioAnalyzer

- (VCPAudioAnalyzer)initWithAnalysisTypes:(unint64_t)a3 forStreaming:(BOOL)a4
{
  BOOL v4 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VCPAudioAnalyzer;
  v6 = [(VCPAudioAnalyzer *)&v18 init];
  if (!v6)
  {
    v9 = 0;
    goto LABEL_14;
  }
  if ((a3 & 0x10) != 0 && v4)
  {
    uint64_t v7 = +[VCPVoiceDetector detector];
    voiceDetector = v6->_voiceDetector;
    v6->_voiceDetector = (VCPVoiceDetector *)v7;

    v9 = v6->_voiceDetector;
    if (!v9) {
      goto LABEL_14;
    }
  }
  else if ((a3 & 0x820400200010) != 0)
  {
    v10 = [[VCPAudioClassifier alloc] initWithTypes:a3];
    audioClassifier = v6->_audioClassifier;
    v6->_audioClassifier = v10;

    v9 = v6->_audioClassifier;
    if (!v9) {
      goto LABEL_14;
    }
  }
  if ((a3 & 0x800000) == 0
    || (v12 = objc_alloc_init(VCPLoudnessAnalyzer),
        loudnessAnalyzer = v6->_loudnessAnalyzer,
        v6->_loudnessAnalyzer = v12,
        loudnessAnalyzer,
        (v9 = v6->_loudnessAnalyzer) != 0))
  {
    if ((a3 & 0x8000000) == 0
      || (v14 = objc_alloc_init(VCPSongDetector),
          songDetector = v6->_songDetector,
          v6->_songDetector = v14,
          songDetector,
          (v9 = v6->_songDetector) != 0))
    {
      v6->_inputBuffer = 0;
      v6->_bufferedSamples = 0;
      v6->_sampleBatchSize = 320;
      v6->_initialized = 0;
      v9 = v6;
    }
  }
LABEL_14:
  v16 = v9;

  return v16;
}

- (void)dealloc
{
  inputBuffer = self->_inputBuffer;
  if (inputBuffer) {
    free(inputBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPAudioAnalyzer;
  [(VCPAudioAnalyzer *)&v4 dealloc];
}

- (id)audioFormatRequirements
{
  v8[7] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F15270];
  v7[0] = *MEMORY[0x1E4F151E0];
  v7[1] = v2;
  v8[0] = &unk_1F15ED560;
  v8[1] = &unk_1F15EAD28;
  uint64_t v3 = *MEMORY[0x1E4F151F0];
  v7[2] = *MEMORY[0x1E4F15228];
  v7[3] = v3;
  v8[2] = &unk_1F15ED578;
  v8[3] = &unk_1F15ED590;
  uint64_t v4 = *MEMORY[0x1E4F15208];
  v7[4] = *MEMORY[0x1E4F151F8];
  v7[5] = v4;
  v8[4] = MEMORY[0x1E4F1CC28];
  v8[5] = MEMORY[0x1E4F1CC38];
  v7[6] = *MEMORY[0x1E4F15218];
  v8[6] = MEMORY[0x1E4F1CC38];
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:7];
  return v5;
}

- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 andTrackDuration:(id *)a4
{
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (!CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription)) {
    return -50;
  }
  voiceDetector = self->_voiceDetector;
  if (!voiceDetector
    || (int result = [(VCPVoiceDetector *)voiceDetector setupWithSample:a3 andSampleBatchSize:self->_sampleBatchSize]) == 0)
  {
    audioClassifier = self->_audioClassifier;
    if (!audioClassifier
      || (long long v15 = *(_OWORD *)&a4->var0,
          int64_t var3 = a4->var3,
          (int result = [(VCPAudioClassifier *)audioClassifier setupWithSample:a3 trackDuration:&v15 andSampleBatchSize:self->_sampleBatchSize]) == 0))
    {
      loudnessAnalyzer = self->_loudnessAnalyzer;
      if (!loudnessAnalyzer
        || (int result = [(VCPLoudnessAnalyzer *)loudnessAnalyzer setupWithSample:a3 andSampleBatchSize:self->_sampleBatchSize]) == 0)
      {
        songDetector = self->_songDetector;
        if (!songDetector
          || (int result = [(VCPSongDetector *)songDetector setupWithSample:a3 andSampleBatchSize:self->_sampleBatchSize]) == 0)
        {
          if (self->_inputBuffer)
          {
LABEL_13:
            int result = 0;
            self->_audioTimestamp.mSampleTime = 0.0;
            self->_audioTimestamp.mFlags = 1;
            return result;
          }
          v13 = malloc_type_malloc(4 * self->_sampleBatchSize + 4095, 0x37FF7721uLL);
          self->_inputBuffer = v13;
          if (v13)
          {
            self->_audioBufferList.mBuffers[0].mData = (void *)(((unint64_t)v13 + 4095) & 0xFFFFFFFFFFFFF000);
            self->_audioBufferList.mNumberBuffers = 1;
            UInt32 v14 = 4 * self->_sampleBatchSize;
            self->_audioBufferList.mBuffers[0].mNumberChannels = 1;
            self->_audioBufferList.mBuffers[0].mDataByteSize = v14;
            goto LABEL_13;
          }
          return -108;
        }
      }
    }
  }
  return result;
}

- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4
{
  voiceDetector = self->_voiceDetector;
  if (!voiceDetector
    || (long long v8 = *(_OWORD *)&a4->mRateScalar,
        v23[0] = *(_OWORD *)&a4->mSampleTime,
        v23[1] = v8,
        long long v9 = *(_OWORD *)&a4->mSMPTETime.mHours,
        v23[2] = *(_OWORD *)&a4->mSMPTETime.mSubframes,
        v23[3] = v9,
        (int result = [(VCPVoiceDetector *)voiceDetector processAudioSamples:a3 timestamp:v23]) == 0))
  {
    audioClassifier = self->_audioClassifier;
    if (!audioClassifier
      || (long long v12 = *(_OWORD *)&a4->mRateScalar,
          v22[0] = *(_OWORD *)&a4->mSampleTime,
          v22[1] = v12,
          long long v13 = *(_OWORD *)&a4->mSMPTETime.mHours,
          v22[2] = *(_OWORD *)&a4->mSMPTETime.mSubframes,
          v22[3] = v13,
          (int result = [(VCPAudioClassifier *)audioClassifier processAudioSamples:a3 timestamp:v22]) == 0))
    {
      loudnessAnalyzer = self->_loudnessAnalyzer;
      if (!loudnessAnalyzer
        || (long long v15 = *(_OWORD *)&a4->mRateScalar,
            v21[0] = *(_OWORD *)&a4->mSampleTime,
            v21[1] = v15,
            long long v16 = *(_OWORD *)&a4->mSMPTETime.mHours,
            v21[2] = *(_OWORD *)&a4->mSMPTETime.mSubframes,
            v21[3] = v16,
            (int result = [(VCPLoudnessAnalyzer *)loudnessAnalyzer processAudioSamples:a3 timestamp:v21]) == 0))
      {
        songDetector = self->_songDetector;
        if (!songDetector) {
          return 0;
        }
        long long v18 = *(_OWORD *)&a4->mRateScalar;
        v20[0] = *(_OWORD *)&a4->mSampleTime;
        v20[1] = v18;
        long long v19 = *(_OWORD *)&a4->mSMPTETime.mHours;
        v20[2] = *(_OWORD *)&a4->mSMPTETime.mSubframes;
        v20[3] = v19;
        int result = [(VCPSongDetector *)songDetector processAudioSamples:a3 timestamp:v20];
        if (!result) {
          return 0;
        }
      }
    }
  }
  return result;
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  voiceDetector = self->_voiceDetector;
  if (!voiceDetector
    || (int result = [(VCPVoiceDetector *)voiceDetector finalizeAnalysisAtTime:a3]) == 0)
  {
    audioClassifier = self->_audioClassifier;
    if (!audioClassifier
      || (int result = [(VCPAudioClassifier *)audioClassifier finalizeAnalysisAtTime:a3]) == 0)
    {
      loudnessAnalyzer = self->_loudnessAnalyzer;
      if (!loudnessAnalyzer
        || (int result = [(VCPLoudnessAnalyzer *)loudnessAnalyzer finalizeAnalysisAtTime:a3]) == 0)
      {
        songDetector = self->_songDetector;
        if (!songDetector) {
          return 0;
        }
        int result = [(VCPSongDetector *)songDetector finalizeAnalysisAtTime:a3];
        if (!result) {
          return 0;
        }
      }
    }
  }
  return result;
}

- (int)processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (!CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription)) {
    return -50;
  }
  CMItemCount NumSamples = CMSampleBufferGetNumSamples(a3);
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  dataPointerOut = 0;
  mData = (char *)self->_audioBufferList.mBuffers[0].mData;
  int result = CMBlockBufferGetDataPointer(DataBuffer, 0, 0, 0, &dataPointerOut);
  if (!result)
  {
    if (NumSamples)
    {
      int sampleBatchSize = self->_sampleBatchSize;
      int bufferedSamples = self->_bufferedSamples;
      long long v12 = dataPointerOut;
      do
      {
        int v13 = sampleBatchSize - bufferedSamples;
        if (NumSamples >= v13) {
          int v14 = v13;
        }
        else {
          int v14 = NumSamples;
        }
        memcpy(&mData[4 * bufferedSamples], v12, 4 * v14);
        int bufferedSamples = self->_bufferedSamples + v14;
        self->_int bufferedSamples = bufferedSamples;
        int sampleBatchSize = self->_sampleBatchSize;
        if (bufferedSamples == sampleBatchSize)
        {
          long long v15 = *(_OWORD *)&self->_audioTimestamp.mRateScalar;
          v17[0] = *(_OWORD *)&self->_audioTimestamp.mSampleTime;
          v17[1] = v15;
          long long v16 = *(_OWORD *)&self->_audioTimestamp.mSMPTETime.mHours;
          v17[2] = *(_OWORD *)&self->_audioTimestamp.mSMPTETime.mSubframes;
          v17[3] = v16;
          int result = [(VCPAudioAnalyzer *)self processAudioSamples:&self->_audioBufferList timestamp:v17];
          if (result) {
            return result;
          }
          int bufferedSamples = 0;
          int sampleBatchSize = self->_sampleBatchSize;
          self->_audioTimestamp.mSampleTime = self->_audioTimestamp.mSampleTime + (double)sampleBatchSize;
          self->_int bufferedSamples = 0;
          long long v12 = dataPointerOut;
        }
        v12 += 4 * v14;
        dataPointerOut = v12;
        NumSamples -= v14;
      }
      while (NumSamples);
    }
    return 0;
  }
  return result;
}

- (int)analyzeAsset:(id)a3 cancel:(id)a4 results:(id *)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v8 = (uint64_t (**)(void))a4;
  v49 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v9 = objc_msgSend(v7, "vcp_enabledTracksWithMediaType:", *MEMORY[0x1E4F15BA8]);
  v47 = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (!v10)
  {
    int v50 = 0;
    goto LABEL_44;
  }
  uint64_t v45 = v10;
  int v50 = 0;
  uint64_t v11 = *(void *)v59;
  while (2)
  {
    for (uint64_t i = 0; i != v45; ++i)
    {
      if (*(void *)v59 != v11) {
        objc_enumerationMutation(v9);
      }
      long long v12 = *(void **)(*((void *)&v58 + 1) + 8 * i);
      memset(&v57, 0, sizeof(v57));
      if (v12) {
        [v12 timeRange];
      }
      memset(&v56, 0, sizeof(v56));
      CMTimeRange range = v57;
      CMTimeRangeGetEnd(&v56, &range);
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        int v13 = VCPLogInstance();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v43 = v11;
          id v44 = v7;
          int v14 = [v12 trackID];
          CMTimeValue value = v57.start.value;
          CMTimeScale timescale = v57.start.timescale;
          CMTime time = v57.start;
          Float64 Seconds = CMTimeGetSeconds(&time);
          CMTimeValue v18 = v56.value;
          CMTimeScale v19 = v56.timescale;
          CMTime v53 = v56;
          Float64 v20 = CMTimeGetSeconds(&v53);
          *(_DWORD *)buf = 67110656;
          *(_DWORD *)&buf[4] = v14;
          *(_WORD *)&buf[8] = 2048;
          *(void *)&buf[10] = value;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = timescale;
          *(_WORD *)&buf[24] = 2048;
          *(Float64 *)&buf[26] = Seconds;
          *(_WORD *)&buf[34] = 2048;
          *(void *)&buf[36] = v18;
          *(_WORD *)&buf[44] = 1024;
          *(_DWORD *)&buf[46] = v19;
          __int16 v63 = 2048;
          Float64 v64 = v20;
          _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEBUG, "    Analyzing Audio Track - ID: %d Start: %lld/%d (%0.3fs) End: %lld/%d (%0.3fs)", buf, 0x3Cu);
          uint64_t v11 = v43;
          id v7 = v44;
        }
      }
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v7 error:0];
      v22 = (void *)MEMORY[0x1E4F163A0];
      v23 = [(VCPAudioAnalyzer *)self audioFormatRequirements];
      v24 = [v22 assetReaderTrackOutputWithTrack:v12 outputSettings:v23];

      [v21 addOutput:v24];
      if (([v21 startReading] & 1) == 0)
      {
LABEL_50:
        v25 = 0;
LABEL_51:
        int v39 = -19;
LABEL_39:
        int v50 = v39;
        int v40 = 1;
        goto LABEL_40;
      }
      v25 = (const void *)[v24 copyNextSampleBuffer];
      if (!v25) {
        goto LABEL_51;
      }
      CMTime duration = v57.duration;
      int v26 = [(VCPAudioAnalyzer *)self setupWithSample:v25 andTrackDuration:&duration];
      LODWORD(v23) = v26;
      int v27 = v50;
      if (v26) {
        int v27 = v26;
      }
      int v50 = v27;
      if (v26) {
        goto LABEL_53;
      }
      do
      {
        if (v8[2](v8))
        {
          int v39 = -128;
          goto LABEL_39;
        }
        v23 = (void *)MEMORY[0x1C186D320]();
        [(VCPAudioAnalyzer *)self processSampleBuffer:v25];
        CFRelease(v25);
        v25 = (const void *)[v24 copyNextSampleBuffer];
      }
      while (v25);
      if ([v21 status] != 2) {
        goto LABEL_50;
      }
      uint64_t bufferedSamples = self->_bufferedSamples;
      if (bufferedSamples)
      {
        bzero((char *)self->_audioBufferList.mBuffers[0].mData + 4 * bufferedSamples, 4 * (self->_sampleBatchSize - (int)bufferedSamples));
        long long v29 = *(_OWORD *)&self->_audioTimestamp.mRateScalar;
        v51[0] = *(_OWORD *)&self->_audioTimestamp.mSampleTime;
        v51[1] = v29;
        long long v30 = *(_OWORD *)&self->_audioTimestamp.mSMPTETime.mHours;
        v51[2] = *(_OWORD *)&self->_audioTimestamp.mSMPTETime.mSubframes;
        v51[3] = v30;
        LODWORD(v23) = [(VCPAudioAnalyzer *)self processAudioSamples:&self->_audioBufferList timestamp:v51];
        if (!v23)
        {
          self->_uint64_t bufferedSamples = 0;
          goto LABEL_23;
        }
        v25 = 0;
        int v40 = 0;
LABEL_40:

        if (!v40) {
          goto LABEL_49;
        }
        if (!v25) {
          goto LABEL_45;
        }
        goto LABEL_42;
      }
LABEL_23:
      if (v12) {
        [v12 timeRange];
      }
      else {
        memset(buf, 0, 48);
      }
      LODWORD(v23) = [(VCPAudioAnalyzer *)self finalizeAnalysisAtTime:&buf[24]];
      if (v23)
      {
        v25 = 0;
LABEL_53:

        int v50 = (int)v23;
        if (!v25) {
          goto LABEL_45;
        }
LABEL_42:
        CFRelease(v25);
        goto LABEL_45;
      }
      voiceDetector = self->_voiceDetector;
      if (voiceDetector)
      {
        v32 = [(VCPVoiceDetector *)voiceDetector results];
        [v49 addEntriesFromDictionary:v32];
      }
      audioClassifier = self->_audioClassifier;
      if (audioClassifier)
      {
        v34 = [(VCPAudioClassifier *)audioClassifier results];
        [v49 addEntriesFromDictionary:v34];
      }
      loudnessAnalyzer = self->_loudnessAnalyzer;
      if (loudnessAnalyzer)
      {
        v36 = [(VCPLoudnessAnalyzer *)loudnessAnalyzer results];
        [v49 addEntriesFromDictionary:v36];
      }
      songDetector = self->_songDetector;
      if (songDetector)
      {
        v38 = [(VCPSongDetector *)songDetector results];
        [v49 addEntriesFromDictionary:v38];
      }
      long long v9 = v47;
    }
    uint64_t v45 = [v47 countByEnumeratingWithState:&v58 objects:v65 count:16];
    if (v45) {
      continue;
    }
    break;
  }
LABEL_44:

LABEL_45:
  if (v50) {
    v41 = 0;
  }
  else {
    v41 = v49;
  }
  *a5 = v41;
  LODWORD(v23) = v50;
LABEL_49:

  return (int)v23;
}

- (int)analyzeSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (!self->_initialized)
  {
    long long v10 = *MEMORY[0x1E4F1F9F8];
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    int result = [(VCPAudioAnalyzer *)self setupWithSample:a3 andTrackDuration:&v10];
    if (result) {
      return result;
    }
    self->_initialized = 1;
  }
  int result = [(VCPAudioAnalyzer *)self processSampleBuffer:a3];
  if (!result)
  {
    uint64_t bufferedSamples = self->_bufferedSamples;
    if (bufferedSamples)
    {
      bzero((char *)self->_audioBufferList.mBuffers[0].mData + 4 * bufferedSamples, 4 * (self->_sampleBatchSize - (int)bufferedSamples));
      long long v7 = *(_OWORD *)&self->_audioTimestamp.mRateScalar;
      v9[0] = *(_OWORD *)&self->_audioTimestamp.mSampleTime;
      v9[1] = v7;
      long long v8 = *(_OWORD *)&self->_audioTimestamp.mSMPTETime.mHours;
      v9[2] = *(_OWORD *)&self->_audioTimestamp.mSMPTETime.mSubframes;
      v9[3] = v8;
      int result = [(VCPAudioAnalyzer *)self processAudioSamples:&self->_audioBufferList timestamp:v9];
      if (!result) {
        self->_uint64_t bufferedSamples = 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)voiceDetections
{
  voiceDetector = self->_voiceDetector;
  if (voiceDetector)
  {
    voiceDetector = [voiceDetector voiceDetections];
  }
  return voiceDetector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songDetector, 0);
  objc_storeStrong((id *)&self->_loudnessAnalyzer, 0);
  objc_storeStrong((id *)&self->_audioClassifier, 0);
  objc_storeStrong((id *)&self->_voiceDetector, 0);
}

@end