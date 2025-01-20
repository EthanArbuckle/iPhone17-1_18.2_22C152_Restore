@interface CSPhraseNDEAPIScorer
- (BOOL)hasReceivedNDEAPIResult;
- (CSKeywordAnalyzerNDEAPI)keywordAnalyzerNDEAPI;
- (CSPhraseNDEAPIScorer)initWithAsset:(id)a3 assetConfig:(id)a4 firstPassSource:(unint64_t)a5 activeChannel:(unint64_t)a6 siriLanguage:(id)a7 shouldEnableShadowMicScore:(BOOL)a8 rtmodelRequestOptions:(id)a9;
- (CSPhraseNDEAPIScorerDelegate)delegate;
- (CSShadowMicScoreCreator)shadowMicScoreCreator;
- (NSMutableData)dataBufferNDEAPI;
- (double)currentShadowMicScore;
- (float)shadowMicScoreThresholdForVAD;
- (id)_rtModelFromAsset:(id)a3 requestOptions:(id)a4 forSiriLanguage:(id)a5 withPhraseCount:(unint64_t)a6;
- (unint64_t)dataBufferPositionNDEAPI;
- (unint64_t)hearstNumberOfBytesPerChunk;
- (unint64_t)hearstNumberOfSamplesPerChunk;
- (unsigned)hasReceivedEarlyDetectNDEAPIResult;
- (void)keywordAnalyzerNDEAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5;
- (void)processAudioChunk:(id)a3 activeChannel:(unint64_t)a4;
- (void)reset;
- (void)setDataBufferNDEAPI:(id)a3;
- (void)setDataBufferPositionNDEAPI:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHasReceivedEarlyDetectNDEAPIResult:(unsigned __int8)a3;
- (void)setHasReceivedNDEAPIResult:(BOOL)a3;
- (void)setHearstNumberOfBytesPerChunk:(unint64_t)a3;
- (void)setHearstNumberOfSamplesPerChunk:(unint64_t)a3;
- (void)setKeywordAnalyzerNDEAPI:(id)a3;
- (void)setShadowMicScoreCreator:(id)a3;
@end

@implementation CSPhraseNDEAPIScorer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataBufferNDEAPI, 0);
  objc_storeStrong((id *)&self->_shadowMicScoreCreator, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzerNDEAPI, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setHearstNumberOfSamplesPerChunk:(unint64_t)a3
{
  self->_hearstNumberOfSamplesPerChunk = a3;
}

- (unint64_t)hearstNumberOfSamplesPerChunk
{
  return self->_hearstNumberOfSamplesPerChunk;
}

- (void)setHearstNumberOfBytesPerChunk:(unint64_t)a3
{
  self->_hearstNumberOfBytesPerChunk = a3;
}

- (unint64_t)hearstNumberOfBytesPerChunk
{
  return self->_hearstNumberOfBytesPerChunk;
}

- (void)setHasReceivedEarlyDetectNDEAPIResult:(unsigned __int8)a3
{
  self->_hasReceivedEarlyDetectNDEAPIResult = a3;
}

- (unsigned)hasReceivedEarlyDetectNDEAPIResult
{
  return self->_hasReceivedEarlyDetectNDEAPIResult;
}

- (void)setDataBufferPositionNDEAPI:(unint64_t)a3
{
  self->_dataBufferPositionNDEAPI = a3;
}

- (unint64_t)dataBufferPositionNDEAPI
{
  return self->_dataBufferPositionNDEAPI;
}

- (void)setDataBufferNDEAPI:(id)a3
{
}

- (NSMutableData)dataBufferNDEAPI
{
  return self->_dataBufferNDEAPI;
}

- (void)setShadowMicScoreCreator:(id)a3
{
}

- (CSShadowMicScoreCreator)shadowMicScoreCreator
{
  return self->_shadowMicScoreCreator;
}

- (void)setHasReceivedNDEAPIResult:(BOOL)a3
{
  self->_hasReceivedNDEAPIResult = a3;
}

- (BOOL)hasReceivedNDEAPIResult
{
  return self->_hasReceivedNDEAPIResult;
}

- (void)setKeywordAnalyzerNDEAPI:(id)a3
{
}

- (CSKeywordAnalyzerNDEAPI)keywordAnalyzerNDEAPI
{
  return self->_keywordAnalyzerNDEAPI;
}

- (float)shadowMicScoreThresholdForVAD
{
  return self->_shadowMicScoreThresholdForVAD;
}

- (void)setDelegate:(id)a3
{
}

- (CSPhraseNDEAPIScorerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSPhraseNDEAPIScorerDelegate *)WeakRetained;
}

- (id)_rtModelFromAsset:(id)a3 requestOptions:(id)a4 forSiriLanguage:(id)a5 withPhraseCount:(unint64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = [CSVoiceTriggerRTModelRequestOptions alloc];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100163680;
  v18[3] = &unk_100253330;
  id v19 = v9;
  id v20 = v10;
  unint64_t v21 = a6;
  id v13 = v10;
  id v14 = v9;
  v15 = [(CSVoiceTriggerRTModelRequestOptions *)v12 initWithCSRTModelRequestOptions:v14 builder:v18];
  v16 = [v11 latestHearstRTModelWithRequestOptions:v15];

  return v16;
}

- (void)keywordAnalyzerNDEAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 isEarlyDetect] && !self->_hasReceivedEarlyDetectNDEAPIResult)
  {
    id v13 = [v8 samplesFed];
    id v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      v16 = "-[CSPhraseNDEAPIScorer keywordAnalyzerNDEAPI:hasResultAvailable:forChannel:]";
      __int16 v17 = 1026;
      int v18 = (int)v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s EarlyDetectSample = %{public}d", (uint8_t *)&v15, 0x12u);
    }
    [(CSShadowMicScoreCreator *)self->_shadowMicScoreCreator setBestEarlyDetectSample:v13];
    self->_hasReceivedEarlyDetectNDEAPIResult = 1;
  }
  else if (!self->_hasReceivedNDEAPIResult)
  {
    self->_hasReceivedNDEAPIResult = 1;
    id v9 = [v8 bestStart];
    id v10 = [v8 bestEnd];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained voiceTriggerPhraseNDEAPIScorerDidDetectedKeyword:self bestStartSampleCount:v9 bestEndSampleCount:v10];

    id v12 = [v8 samplesFed];
    [(CSShadowMicScoreCreator *)self->_shadowMicScoreCreator setBestStartDetectSample:v9];
    [(CSShadowMicScoreCreator *)self->_shadowMicScoreCreator setBestEndDetectSample:v12];
    [v7 reset];
  }
}

- (double)currentShadowMicScore
{
  [(CSShadowMicScoreCreator *)self->_shadowMicScoreCreator calculateShadowMicScore];
  shadowMicScoreCreator = self->_shadowMicScoreCreator;
  [(CSShadowMicScoreCreator *)shadowMicScoreCreator shadowMicScore];
  return result;
}

- (void)processAudioChunk:(id)a3 activeChannel:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 dataForChannel:a4];
  [(CSShadowMicScoreCreator *)self->_shadowMicScoreCreator addDataToBuffer:v7];
  if (self->_shadowMicScoreCreator)
  {
    if (+[CSConfig inputRecordingIsFloat])
    {
      id v8 = +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:v7];
      if ([v8 length]) {
        [(NSMutableData *)self->_dataBufferNDEAPI appendData:v8];
      }
    }
    else
    {
      [(NSMutableData *)self->_dataBufferNDEAPI appendData:v7];
    }
    for (;
          (char *)[(NSMutableData *)self->_dataBufferNDEAPI length] - self->_dataBufferPositionNDEAPI >= (char *)self->_hearstNumberOfBytesPerChunk;
          self->_dataBufferPositionNDEAPI += self->_hearstNumberOfBytesPerChunk)
    {
      __chkstk_darwin();
      id v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v10 >= 0x200) {
        size_t v12 = 512;
      }
      else {
        size_t v12 = v10;
      }
      bzero((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
      -[NSMutableData getBytes:range:](self->_dataBufferNDEAPI, "getBytes:range:", v11, self->_dataBufferPositionNDEAPI, self->_hearstNumberOfBytesPerChunk);
      id v13 = [(CSKeywordAnalyzerNDEAPI *)self->_keywordAnalyzerNDEAPI processAudioBytes:v11 withNumberOfSamples:self->_hearstNumberOfSamplesPerChunk];
    }
  }
  else
  {
    id v9 = [(CSKeywordAnalyzerNDEAPI *)self->_keywordAnalyzerNDEAPI processAudioChunk:v6];
  }
}

- (void)reset
{
  self->_hasReceivedNDEAPIResult = 0;
  [(CSKeywordAnalyzerNDEAPI *)self->_keywordAnalyzerNDEAPI reset];
}

- (CSPhraseNDEAPIScorer)initWithAsset:(id)a3 assetConfig:(id)a4 firstPassSource:(unint64_t)a5 activeChannel:(unint64_t)a6 siriLanguage:(id)a7 shouldEnableShadowMicScore:(BOOL)a8 rtmodelRequestOptions:(id)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a9;
  v35.receiver = self;
  v35.super_class = (Class)CSPhraseNDEAPIScorer;
  int v18 = [(CSPhraseNDEAPIScorer *)&v35 init];
  id v19 = v18;
  if (v18)
  {
    if (v9 && v18->_shadowMicScoreThresholdForVAD != -1.0)
    {
      id v20 = [v17 accessoryInfo];
      unsigned __int8 v21 = [v20 supportsAlwaysOnAccelerometer];

      if ((v21 & 1) == 0)
      {
        v22 = [v15 wearerDetectionConfig];
        [v22 shadowMicScoreThreshold];
        v19->_shadowMicScoreThresholdForVAD = v23;

        v24 = objc_alloc_init(CSShadowMicScoreCreator);
        shadowMicScoreCreator = v19->_shadowMicScoreCreator;
        v19->_shadowMicScoreCreator = v24;
      }
    }
    v26 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    dataBufferNDEAPI = v19->_dataBufferNDEAPI;
    v19->_dataBufferNDEAPI = v26;

    v19->_dataBufferPositionNDEAPI = 0;
    v19->_hasReceivedEarlyDetectNDEAPIResult = 0;
    v19->_hearstNumberOfBytesPerChunk = +[CSConfig hearstNumberOfBytesPerChunk];
    v19->_hearstNumberOfSamplesPerChunk = +[CSConfig hearstNumberOfSamplesPerChunk];
    v28 = [v15 phraseConfigs];
    v29 = -[CSPhraseNDEAPIScorer _rtModelFromAsset:requestOptions:forSiriLanguage:withPhraseCount:](v19, "_rtModelFromAsset:requestOptions:forSiriLanguage:withPhraseCount:", v14, v17, v16, [v28 count]);

    id v30 = objc_alloc((Class)CSKeywordAnalyzerNDEAPI);
    v31 = [v29 modelData];
    v32 = (CSKeywordAnalyzerNDEAPI *)[v30 initWithBlob:v31];
    keywordAnalyzerNDEAPI = v19->_keywordAnalyzerNDEAPI;
    v19->_keywordAnalyzerNDEAPI = v32;

    [(CSKeywordAnalyzerNDEAPI *)v19->_keywordAnalyzerNDEAPI setActiveChannel:a6];
    [(CSKeywordAnalyzerNDEAPI *)v19->_keywordAnalyzerNDEAPI setDelegate:v19];
  }
  return v19;
}

@end