@interface EARSpeechRecognitionResultPackage
+ (BOOL)supportsSecureCoding;
- (BOOL)firstResultAfterResume;
- (BOOL)isFinal;
- (BOOL)recognitionPaused;
- (EARAudioAnalytics)audioAnalytics;
- (EARLatticeMitigatorResult)latticeMitigatorResult;
- (EARSpeechRecognition)preITNRecognition;
- (EARSpeechRecognition)recognition;
- (EARSpeechRecognition)unrepairedRecognition;
- (EARSpeechRecognitionResultPackage)initWithCoder:(id)a3;
- (EARSpeechRecognitionResultPackage)initWithPackage:(id)a3;
- (NSArray)correctPartialResultIndexList;
- (NSArray)nBestVoiceCommandInterpretations;
- (NSArray)preITNNBestVoiceCommandInterpretations;
- (NSNumber)endOfSentenceLikelihood;
- (_EARPerformanceMarkers)performanceMarkers;
- (_EARVoiceCommandDebugInfo)voiceCommandDebugInfo;
- (double)utteranceStart;
- (int64_t)numOneBestTokensExcludingTriggerPhrase;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EARSpeechRecognitionResultPackage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMarkers, 0);
  objc_storeStrong((id *)&self->_voiceCommandDebugInfo, 0);
  objc_storeStrong((id *)&self->_latticeMitigatorResult, 0);
  objc_storeStrong((id *)&self->_endOfSentenceLikelihood, 0);
  objc_storeStrong((id *)&self->_preITNNBestVoiceCommandInterpretations, 0);
  objc_storeStrong((id *)&self->_nBestVoiceCommandInterpretations, 0);
  objc_storeStrong((id *)&self->_correctPartialResultIndexList, 0);
  objc_storeStrong((id *)&self->_audioAnalytics, 0);
  objc_storeStrong((id *)&self->_unrepairedRecognition, 0);
  objc_storeStrong((id *)&self->_preITNRecognition, 0);

  objc_storeStrong((id *)&self->_recognition, 0);
}

- (_EARPerformanceMarkers)performanceMarkers
{
  return self->_performanceMarkers;
}

- (_EARVoiceCommandDebugInfo)voiceCommandDebugInfo
{
  return self->_voiceCommandDebugInfo;
}

- (int64_t)numOneBestTokensExcludingTriggerPhrase
{
  return self->_numOneBestTokensExcludingTriggerPhrase;
}

- (EARLatticeMitigatorResult)latticeMitigatorResult
{
  return self->_latticeMitigatorResult;
}

- (NSNumber)endOfSentenceLikelihood
{
  return self->_endOfSentenceLikelihood;
}

- (BOOL)firstResultAfterResume
{
  return self->_firstResultAfterResume;
}

- (BOOL)recognitionPaused
{
  return self->_recognitionPaused;
}

- (NSArray)preITNNBestVoiceCommandInterpretations
{
  return self->_preITNNBestVoiceCommandInterpretations;
}

- (NSArray)nBestVoiceCommandInterpretations
{
  return self->_nBestVoiceCommandInterpretations;
}

- (NSArray)correctPartialResultIndexList
{
  return self->_correctPartialResultIndexList;
}

- (double)utteranceStart
{
  return self->_utteranceStart;
}

- (EARAudioAnalytics)audioAnalytics
{
  return self->_audioAnalytics;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (EARSpeechRecognition)unrepairedRecognition
{
  return self->_unrepairedRecognition;
}

- (EARSpeechRecognition)preITNRecognition
{
  return self->_preITNRecognition;
}

- (EARSpeechRecognition)recognition
{
  return self->_recognition;
}

- (EARSpeechRecognitionResultPackage)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)EARSpeechRecognitionResultPackage;
  v5 = [(EARSpeechRecognitionResultPackage *)&v39 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recognition"];
    recognition = v5->_recognition;
    v5->_recognition = (EARSpeechRecognition *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preITNRecognition"];
    preITNRecognition = v5->_preITNRecognition;
    v5->_preITNRecognition = (EARSpeechRecognition *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unrepairedRecognition"];
    unrepairedRecognition = v5->_unrepairedRecognition;
    v5->_unrepairedRecognition = (EARSpeechRecognition *)v10;

    v5->_isFinal = [v4 decodeBoolForKey:@"isFinal"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioAnalytics"];
    audioAnalytics = v5->_audioAnalytics;
    v5->_audioAnalytics = (EARAudioAnalytics *)v12;

    [v4 decodeDoubleForKey:@"utteranceStart"];
    v5->_utteranceStart = v14;
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"correctPartialResultIndexList"];
    correctPartialResultIndexList = v5->_correctPartialResultIndexList;
    v5->_correctPartialResultIndexList = (NSArray *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"nBestVoiceCommandInterpretations"];
    nBestVoiceCommandInterpretations = v5->_nBestVoiceCommandInterpretations;
    v5->_nBestVoiceCommandInterpretations = (NSArray *)v23;

    v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"preITNNBestVoiceCommandInterpretations"];
    preITNNBestVoiceCommandInterpretations = v5->_preITNNBestVoiceCommandInterpretations;
    v5->_preITNNBestVoiceCommandInterpretations = (NSArray *)v28;

    v5->_recognitionPaused = [v4 decodeBoolForKey:@"recognitionPaused"];
    v5->_firstResultAfterResume = [v4 decodeBoolForKey:@"firstResultAfterResume"];
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endOfSentenceLikelihood"];
    endOfSentenceLikelihood = v5->_endOfSentenceLikelihood;
    v5->_endOfSentenceLikelihood = (NSNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latticeMitigatorResult"];
    latticeMitigatorResult = v5->_latticeMitigatorResult;
    v5->_latticeMitigatorResult = (EARLatticeMitigatorResult *)v32;

    v5->_numOneBestTokensExcludingTriggerPhrase = [v4 decodeIntegerForKey:@"numOneBestTokensExcludingTriggerPhrase"];
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"voiceCommandDebugInfo"];
    voiceCommandDebugInfo = v5->_voiceCommandDebugInfo;
    v5->_voiceCommandDebugInfo = (_EARVoiceCommandDebugInfo *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"performanceMarkers"];
    performanceMarkers = v5->_performanceMarkers;
    v5->_performanceMarkers = (_EARPerformanceMarkers *)v36;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  recognition = self->_recognition;
  id v5 = a3;
  [v5 encodeObject:recognition forKey:@"recognition"];
  [v5 encodeObject:self->_preITNRecognition forKey:@"preITNRecognition"];
  [v5 encodeObject:self->_unrepairedRecognition forKey:@"unrepairedRecognition"];
  [v5 encodeBool:self->_isFinal forKey:@"isFinal"];
  [v5 encodeObject:self->_audioAnalytics forKey:@"audioAnalytics"];
  [v5 encodeDouble:@"utteranceStart" forKey:self->_utteranceStart];
  [v5 encodeObject:self->_correctPartialResultIndexList forKey:@"correctPartialResultIndexList"];
  [v5 encodeObject:self->_nBestVoiceCommandInterpretations forKey:@"nBestVoiceCommandInterpretations"];
  [v5 encodeObject:self->_preITNNBestVoiceCommandInterpretations forKey:@"preITNNBestVoiceCommandInterpretations"];
  [v5 encodeBool:self->_recognitionPaused forKey:@"recognitionPaused"];
  [v5 encodeBool:self->_firstResultAfterResume forKey:@"firstResultAfterResume"];
  [v5 encodeObject:self->_endOfSentenceLikelihood forKey:@"endOfSentenceLikelihood"];
  [v5 encodeObject:self->_latticeMitigatorResult forKey:@"latticeMitigatorResult"];
  [v5 encodeInteger:self->_numOneBestTokensExcludingTriggerPhrase forKey:@"numOneBestTokensExcludingTriggerPhrase"];
  [v5 encodeObject:self->_voiceCommandDebugInfo forKey:@"voiceCommandDebugInfo"];
  [v5 encodeObject:self->_performanceMarkers forKey:@"performanceMarkers"];
}

- (EARSpeechRecognitionResultPackage)initWithPackage:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)EARSpeechRecognitionResultPackage;
  id v5 = [(EARSpeechRecognitionResultPackage *)&v45 init];
  if (v5)
  {
    uint64_t v6 = [EARSpeechRecognition alloc];
    v7 = [v4 recognition];
    uint64_t v8 = [(EARSpeechRecognition *)v6 initWithRecognition:v7];

    v9 = [EARSpeechRecognition alloc];
    uint64_t v10 = [v4 preITNRecognition];
    v11 = [(EARSpeechRecognition *)v9 initWithRecognition:v10];

    uint64_t v12 = [EARAudioAnalytics alloc];
    v13 = [v4 audioAnalytics];
    double v14 = [(EARAudioAnalytics *)v12 initWithAnalytics:v13];

    v15 = [EARSpeechRecognition alloc];
    uint64_t v16 = [v4 unrepairedRecognition];
    v17 = [(EARSpeechRecognition *)v15 initWithRecognition:v16];

    uint64_t v18 = [EARLatticeMitigatorResult alloc];
    v19 = [v4 latticeMitigatorResult];
    v20 = [(EARLatticeMitigatorResult *)v18 initWithLatticeMitigatorResult:v19];

    recognition = v5->_recognition;
    v5->_recognition = v8;
    v22 = v8;

    preITNRecognition = v5->_preITNRecognition;
    v5->_preITNRecognition = v11;
    v24 = v11;

    unrepairedRecognition = v5->_unrepairedRecognition;
    v5->_unrepairedRecognition = v17;
    uint64_t v26 = v17;

    v5->_isFinal = [v4 isFinal];
    audioAnalytics = v5->_audioAnalytics;
    v5->_audioAnalytics = v14;
    uint64_t v28 = v14;

    [v4 utteranceStart];
    v5->_utteranceStart = v29;
    uint64_t v30 = [v4 correctPartialResultIndexList];
    correctPartialResultIndexList = v5->_correctPartialResultIndexList;
    v5->_correctPartialResultIndexList = (NSArray *)v30;

    uint64_t v32 = [v4 nBestVoiceCommandInterpretations];
    nBestVoiceCommandInterpretations = v5->_nBestVoiceCommandInterpretations;
    v5->_nBestVoiceCommandInterpretations = (NSArray *)v32;

    uint64_t v34 = [v4 preITNNBestVoiceCommandInterpretations];
    preITNNBestVoiceCommandInterpretations = v5->_preITNNBestVoiceCommandInterpretations;
    v5->_preITNNBestVoiceCommandInterpretations = (NSArray *)v34;

    v5->_recognitionPaused = [v4 recognitionPaused];
    v5->_firstResultAfterResume = [v4 firstResultAfterResume];
    uint64_t v36 = [v4 endOfSentenceLikelihood];
    endOfSentenceLikelihood = v5->_endOfSentenceLikelihood;
    v5->_endOfSentenceLikelihood = (NSNumber *)v36;

    latticeMitigatorResult = v5->_latticeMitigatorResult;
    v5->_latticeMitigatorResult = v20;
    objc_super v39 = v20;

    v5->_numOneBestTokensExcludingTriggerPhrase = [v4 numTokensExcludingTriggerPhrase];
    uint64_t v40 = [v4 voiceCommandDebugInfo];
    voiceCommandDebugInfo = v5->_voiceCommandDebugInfo;
    v5->_voiceCommandDebugInfo = (_EARVoiceCommandDebugInfo *)v40;

    uint64_t v42 = [v4 performanceMarkers];
    performanceMarkers = v5->_performanceMarkers;
    v5->_performanceMarkers = (_EARPerformanceMarkers *)v42;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end