@interface CSShadowMicScoreCreator
- (CSShadowMicScoreCreator)init;
- (NSMutableArray)rmsSamplesForEntireAudio;
- (NSMutableData)audioBuffer;
- (double)_calculateRMSWithFrameData:(signed __int16)a3[80];
- (double)shadowMicScore;
- (double)speechVoiceLevel;
- (int64_t)numberOfTotalFramesETFT;
- (unint64_t)bestEarlyDetectSample;
- (unint64_t)bestEndDetectSample;
- (unint64_t)bestStartDetectSample;
- (unint64_t)numberOfVoicingFrames;
- (void)_calculateNumberOfVoicingFrames;
- (void)_calculateSpeechVoicingLevel;
- (void)addDataToBuffer:(id)a3;
- (void)calculateShadowMicScore;
- (void)setAudioBuffer:(id)a3;
- (void)setBestEarlyDetectSample:(unint64_t)a3;
- (void)setBestEndDetectSample:(unint64_t)a3;
- (void)setBestStartDetectSample:(unint64_t)a3;
- (void)setNumberOfTotalFramesETFT:(int64_t)a3;
- (void)setNumberOfVoicingFrames:(unint64_t)a3;
- (void)setRmsSamplesForEntireAudio:(id)a3;
- (void)setShadowMicScore:(double)a3;
- (void)setSpeechVoiceLevel:(double)a3;
@end

@implementation CSShadowMicScoreCreator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_rmsSamplesForEntireAudio, 0);
}

- (void)setNumberOfTotalFramesETFT:(int64_t)a3
{
  self->_numberOfTotalFramesETFT = a3;
}

- (int64_t)numberOfTotalFramesETFT
{
  return self->_numberOfTotalFramesETFT;
}

- (void)setNumberOfVoicingFrames:(unint64_t)a3
{
  self->_numberOfVoicingFrames = a3;
}

- (unint64_t)numberOfVoicingFrames
{
  return self->_numberOfVoicingFrames;
}

- (void)setSpeechVoiceLevel:(double)a3
{
  self->_speechVoiceLevel = a3;
}

- (double)speechVoiceLevel
{
  return self->_speechVoiceLevel;
}

- (void)setAudioBuffer:(id)a3
{
}

- (NSMutableData)audioBuffer
{
  return self->_audioBuffer;
}

- (void)setRmsSamplesForEntireAudio:(id)a3
{
}

- (NSMutableArray)rmsSamplesForEntireAudio
{
  return self->_rmsSamplesForEntireAudio;
}

- (void)setShadowMicScore:(double)a3
{
  self->_shadowMicScore = a3;
}

- (double)shadowMicScore
{
  return self->_shadowMicScore;
}

- (void)setBestEndDetectSample:(unint64_t)a3
{
  self->_bestEndDetectSample = a3;
}

- (unint64_t)bestEndDetectSample
{
  return self->_bestEndDetectSample;
}

- (void)setBestEarlyDetectSample:(unint64_t)a3
{
  self->_bestEarlyDetectSample = a3;
}

- (unint64_t)bestEarlyDetectSample
{
  return self->_bestEarlyDetectSample;
}

- (void)setBestStartDetectSample:(unint64_t)a3
{
  self->_bestStartDetectSample = a3;
}

- (unint64_t)bestStartDetectSample
{
  return self->_bestStartDetectSample;
}

- (void)_calculateNumberOfVoicingFrames
{
  unint64_t bestEarlyDetectSample = self->_bestEarlyDetectSample;
  double speechVoiceLevel = self->_speechVoiceLevel;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_rmsSamplesForEntireAudio;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = 0;
    unint64_t v9 = bestEarlyDetectSample + 320;
    uint64_t v10 = *(void *)v16;
    double v11 = (double)(unint64_t)floor(speechVoiceLevel * 0.25);
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v5);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v13, "lastSampleCount", (void)v15) >= v9
          && (unint64_t)[v13 lastSampleCount] + 80 < self->_bestEndDetectSample)
        {
          ++self->_numberOfTotalFramesETFT;
          [v13 RMSScore];
          if (v14 >= v11) {
            ++v8;
          }
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  self->_numberOfVoicingFrames = v8;
}

- (void)_calculateSpeechVoicingLevel
{
  [(NSMutableArray *)self->_rmsSamplesForEntireAudio sortUsingSelector:"compareScoresDesc:"];
  unint64_t v3 = vcvtms_u32_f32((float)(unint64_t)[(NSMutableArray *)self->_rmsSamplesForEntireAudio count] * 0.2);
  id v4 = [(NSMutableArray *)self->_rmsSamplesForEntireAudio count];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_rmsSamplesForEntireAudio;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    double v10 = 0.0;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v5);
      }
      if (!(v3 - (void)v4 + v8 + v11)) {
        break;
      }
      objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "RMSScore", (void)v14);
      double v10 = v10 + v12;
      if (v7 == (id)++v11)
      {
        v8 += v11;
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    double v10 = 0.0;
  }

  double v13 = -1.0;
  if (v4 != (id)v3) {
    double v13 = floor(v10 / (double)((unint64_t)v4 - v3));
  }
  self->_double speechVoiceLevel = v13;
}

- (double)_calculateRMSWithFrameData:(signed __int16)a3[80]
{
  uint64_t v3 = 0;
  int64x2_t v4 = 0uLL;
  int64x2_t v5 = 0uLL;
  int64x2_t v6 = 0uLL;
  int64x2_t v7 = 0uLL;
  do
  {
    int16x8_t v8 = *(int16x8_t *)&a3[v3];
    uint32x4_t v9 = (uint32x4_t)vmull_high_s16(v8, v8);
    uint32x4_t v10 = (uint32x4_t)vmull_s16(*(int16x4_t *)v8.i8, *(int16x4_t *)v8.i8);
    int64x2_t v7 = (int64x2_t)vaddw_high_u32((uint64x2_t)v7, v9);
    int64x2_t v6 = (int64x2_t)vaddw_u32((uint64x2_t)v6, *(uint32x2_t *)v9.i8);
    int64x2_t v5 = (int64x2_t)vaddw_high_u32((uint64x2_t)v5, v10);
    int64x2_t v4 = (int64x2_t)vaddw_u32((uint64x2_t)v4, *(uint32x2_t *)v10.i8);
    v3 += 8;
  }
  while (v3 != 80);
  return (double)vaddvq_s64(vaddq_s64(vaddq_s64(v4, v6), vaddq_s64(v5, v7)));
}

- (void)calculateShadowMicScore
{
  unint64_t bestStartDetectSample = self->_bestStartDetectSample;
  unint64_t bestEarlyDetectSample = self->_bestEarlyDetectSample;
  if (bestStartDetectSample > bestEarlyDetectSample || (unint64_t v5 = self->_bestEndDetectSample, bestStartDetectSample > v5))
  {
    int64x2_t v6 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    unint64_t bestEndDetectSample = self->_bestEndDetectSample;
    *(_DWORD *)buf = 136315906;
    v23 = "-[CSShadowMicScoreCreator calculateShadowMicScore]";
    __int16 v24 = 2048;
    unint64_t v25 = bestStartDetectSample;
    __int16 v26 = 2048;
    unint64_t v27 = bestEarlyDetectSample;
    __int16 v28 = 2048;
    unint64_t v29 = bestEndDetectSample;
    int16x8_t v8 = "%s _bestStartDetectSample %lu was greater than _bestEarlyDetectSample %lu or _bestEndDetectSample %lu";
    uint32x4_t v9 = v6;
    uint32_t v10 = 42;
    goto LABEL_18;
  }
  if (bestEarlyDetectSample > v5)
  {
    int64x2_t v7 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315650;
    v23 = "-[CSShadowMicScoreCreator calculateShadowMicScore]";
    __int16 v24 = 2048;
    unint64_t v25 = bestEarlyDetectSample;
    __int16 v26 = 2048;
    unint64_t v27 = v5;
    int16x8_t v8 = "%s _bestEarlyDetectSample %lu was greater than _bestEndDetectSample %lu";
    uint32x4_t v9 = v7;
    uint32_t v10 = 32;
    goto LABEL_18;
  }
  unint64_t v11 = 2 * (int)bestStartDetectSample;
  if (v11 + 160 > [(NSMutableData *)self->_audioBuffer length])
  {
LABEL_15:
    [(CSShadowMicScoreCreator *)self _calculateNumberOfVoicingFrames];
    if (self->_numberOfTotalFramesETFT)
    {
      self->_shadowMicScore = (double)[(CSShadowMicScoreCreator *)self numberOfVoicingFrames]
                            / (double)self->_numberOfTotalFramesETFT;
      return;
    }
    long long v17 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
    {
LABEL_4:
      self->_shadowMicScore = -1.0;
      return;
    }
    *(_DWORD *)buf = 136315394;
    v23 = "-[CSShadowMicScoreCreator calculateShadowMicScore]";
    __int16 v24 = 2048;
    unint64_t v25 = 0;
    int16x8_t v8 = "%s _numberOfTotalFramesETFT %lu is 0";
    uint32x4_t v9 = v17;
    uint32_t v10 = 22;
LABEL_18:
    _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, v8, buf, v10);
    goto LABEL_4;
  }
  int v12 = v11 + 80;
  while (1)
  {
    -[NSMutableData getBytes:range:](self->_audioBuffer, "getBytes:range:", buf, v11, 160);
    [(CSShadowMicScoreCreator *)self _calculateRMSWithFrameData:buf];
    long long v14 = [[RMSSample alloc] initWithRMSScore:v11 >> 1 lastSampleCount:v13];
    [(NSMutableArray *)self->_rmsSamplesForEntireAudio addObject:v14];
    if ([(RMSSample *)v14 lastSampleCount] <= self->_bestEarlyDetectSample + 160
      || self->_speechVoiceLevel != -1.0)
    {
      goto LABEL_14;
    }
    [(CSShadowMicScoreCreator *)self _calculateSpeechVoicingLevel];
    if (self->_speechVoiceLevel == -1.0) {
      break;
    }
    [(NSMutableArray *)self->_rmsSamplesForEntireAudio removeAllObjects];
LABEL_14:

    unint64_t v11 = v12;
    unint64_t v15 = v12 + 160;
    v12 += 80;
    if (v15 > [(NSMutableData *)self->_audioBuffer length]) {
      goto LABEL_15;
    }
  }
  long long v18 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v19 = 136315394;
    v20 = "-[CSShadowMicScoreCreator calculateShadowMicScore]";
    __int16 v21 = 2048;
    _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "%s _speechVoiceLevel %lu is 0", (uint8_t *)&v19, 0x16u);
  }
  self->_shadowMicScore = -1.0;
}

- (void)addDataToBuffer:(id)a3
{
}

- (CSShadowMicScoreCreator)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSShadowMicScoreCreator;
  v2 = [(CSShadowMicScoreCreator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    rmsSamplesForEntireAudio = v2->_rmsSamplesForEntireAudio;
    v2->_rmsSamplesForEntireAudio = v3;

    unint64_t v5 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    audioBuffer = v2->_audioBuffer;
    v2->_audioBuffer = v5;

    v2->_double speechVoiceLevel = -1.0;
    v2->_shadowMicScore = -1.0;
  }
  return v2;
}

@end