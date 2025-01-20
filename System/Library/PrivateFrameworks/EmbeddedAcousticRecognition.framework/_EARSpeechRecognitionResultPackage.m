@interface _EARSpeechRecognitionResultPackage
- (BOOL)firstResultAfterResume;
- (BOOL)hasNonEmptyToken;
- (BOOL)isFinal;
- (BOOL)recognitionIsFormatted;
- (BOOL)recognitionPaused;
- (NSArray)correctPartialResultIndexList;
- (NSArray)nBestVoiceCommandInterpretations;
- (NSArray)preITNNBestVoiceCommandInterpretations;
- (NSNumber)endOfSentenceLikelihood;
- (_EARAudioAnalytics)audioAnalytics;
- (_EARLatticeMitigatorResult)latticeMitigatorResult;
- (_EARPerformanceMarkers)performanceMarkers;
- (_EARSpeechRecognition)preITNRecognition;
- (_EARSpeechRecognition)recognition;
- (_EARSpeechRecognition)unrepairedRecognition;
- (_EARVoiceCommandDebugInfo)voiceCommandDebugInfo;
- (double)utteranceStart;
- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7;
- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8;
- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9;
- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9 latticeMitigatorResult:(id)a10;
- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9 latticeMitigatorResult:(id)a10 nBestVoiceCommandInterpretations:(id)a11 preITNNBestVoiceCommandInterpretations:(id)a12 recognitionPaused:(BOOL)a13;
- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9 latticeMitigatorResult:(id)a10 nBestVoiceCommandInterpretations:(id)a11 preITNNBestVoiceCommandInterpretations:(id)a12 recognitionPaused:(BOOL)a13 firstResultAfterResume:(BOOL)a14 endOfSentenceLikelihood:(id)a15;
- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9 latticeMitigatorResult:(id)a10 nBestVoiceCommandInterpretations:(id)a11 preITNNBestVoiceCommandInterpretations:(id)a12 recognitionPaused:(BOOL)a13 firstResultAfterResume:(BOOL)a14 endOfSentenceLikelihood:(id)a15 numTokensExcludingTriggerPhrase:(int64_t)a16 voiceCommandDebugInfo:(id)a17 performanceMarkers:(id)a18;
- (id)copyWithZone:(_NSZone *)a3;
- (id)nBestResults;
- (int64_t)numTokensExcludingTriggerPhrase;
- (void)setCorrectPartialResultIndexList:(const void *)a3 oneBestFinalResult:(const void *)a4 partialResultIndexOffset:(int)a5;
- (void)setCorrectPartialResultIndexList:(id)a3;
- (void)setFirstResultAfterResume:(BOOL)a3;
- (void)setIsFinal:(BOOL)a3;
- (void)setRecognitionPaused:(BOOL)a3;
@end

@implementation _EARSpeechRecognitionResultPackage

- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7
{
  return [(_EARSpeechRecognitionResultPackage *)self _initWithRecognition:a3 preITNRecognition:a4 unrepairedRecognition:a5 recognitionIsFormatted:a6 isFinal:a7 audioAnalytics:0 utteranceStart:0.0];
}

- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8
{
  return [(_EARSpeechRecognitionResultPackage *)self _initWithRecognition:a3 preITNRecognition:a4 unrepairedRecognition:a5 recognitionIsFormatted:a6 isFinal:a7 audioAnalytics:a8 utteranceStart:0.0];
}

- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9
{
  return [(_EARSpeechRecognitionResultPackage *)self _initWithRecognition:a3 preITNRecognition:a4 unrepairedRecognition:a5 recognitionIsFormatted:a6 isFinal:a7 audioAnalytics:a8 utteranceStart:a9 latticeMitigatorResult:0];
}

- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9 latticeMitigatorResult:(id)a10
{
  LOBYTE(v11) = 0;
  return [(_EARSpeechRecognitionResultPackage *)self _initWithRecognition:a3 preITNRecognition:a4 unrepairedRecognition:a5 recognitionIsFormatted:a6 isFinal:a7 audioAnalytics:a8 utteranceStart:a9 latticeMitigatorResult:a10 nBestVoiceCommandInterpretations:0 preITNNBestVoiceCommandInterpretations:0 recognitionPaused:v11];
}

- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9 latticeMitigatorResult:(id)a10 nBestVoiceCommandInterpretations:(id)a11 preITNNBestVoiceCommandInterpretations:(id)a12 recognitionPaused:(BOOL)a13
{
  LOWORD(v14) = a13;
  return -[_EARSpeechRecognitionResultPackage _initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:nBestVoiceCommandInterpretations:preITNNBestVoiceCommandInterpretations:recognitionPaused:firstResultAfterResume:endOfSentenceLikelihood:](self, "_initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:nBestVoiceCommandInterpretations:preITNNBestVoiceCommandInterpretations:recognitionPaused:firstResultAfterResume:endOfSentenceLikelihood:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, v14, 0);
}

- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9 latticeMitigatorResult:(id)a10 nBestVoiceCommandInterpretations:(id)a11 preITNNBestVoiceCommandInterpretations:(id)a12 recognitionPaused:(BOOL)a13 firstResultAfterResume:(BOOL)a14 endOfSentenceLikelihood:(id)a15
{
  LOWORD(v16) = __PAIR16__(a14, a13);
  return -[_EARSpeechRecognitionResultPackage _initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:nBestVoiceCommandInterpretations:preITNNBestVoiceCommandInterpretations:recognitionPaused:firstResultAfterResume:endOfSentenceLikelihood:numTokensExcludingTriggerPhrase:voiceCommandDebugInfo:performanceMarkers:](self, "_initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:nBestVoiceCommandInterpretations:preITNNBestVoiceCommandInterpretations:recognitionPaused:firstResultAfterResume:endOfSentenceLikelihood:numTokensExcludingTriggerPhrase:voiceCommandDebugInfo:performanceMarkers:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, v16, a15, 0, 0,
           0);
}

- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9 latticeMitigatorResult:(id)a10 nBestVoiceCommandInterpretations:(id)a11 preITNNBestVoiceCommandInterpretations:(id)a12 recognitionPaused:(BOOL)a13 firstResultAfterResume:(BOOL)a14 endOfSentenceLikelihood:(id)a15 numTokensExcludingTriggerPhrase:(int64_t)a16 voiceCommandDebugInfo:(id)a17 performanceMarkers:(id)a18
{
  id v46 = a3;
  id v45 = a4;
  id v44 = a5;
  id v43 = a8;
  id v42 = a10;
  id v23 = a11;
  id v24 = a12;
  id v41 = a15;
  id v40 = a17;
  id v25 = a18;
  v47.receiver = self;
  v47.super_class = (Class)_EARSpeechRecognitionResultPackage;
  v26 = [(_EARSpeechRecognitionResultPackage *)&v47 init];
  if (v26)
  {
    uint64_t v27 = [v46 copy];
    recognition = v26->_recognition;
    v26->_recognition = (_EARSpeechRecognition *)v27;

    uint64_t v29 = [v45 copy];
    preITNRecognition = v26->_preITNRecognition;
    v26->_preITNRecognition = (_EARSpeechRecognition *)v29;

    uint64_t v31 = [v44 copy];
    unrepairedRecognition = v26->_unrepairedRecognition;
    v26->_unrepairedRecognition = (_EARSpeechRecognition *)v31;

    v26->_recognitionIsFormatted = a6;
    v26->_isFinal = a7;
    objc_storeStrong((id *)&v26->_audioAnalytics, a8);
    v26->_utteranceStart = a9;
    objc_storeStrong((id *)&v26->_latticeMitigatorResult, a10);
    uint64_t v33 = [v23 copy];
    nBestVoiceCommandInterpretations = v26->_nBestVoiceCommandInterpretations;
    v26->_nBestVoiceCommandInterpretations = (NSArray *)v33;

    uint64_t v35 = [v24 copy];
    preITNNBestVoiceCommandInterpretations = v26->_preITNNBestVoiceCommandInterpretations;
    v26->_preITNNBestVoiceCommandInterpretations = (NSArray *)v35;

    v26->_recognitionPaused = a13;
    v26->_firstResultAfterResume = a14;
    objc_storeStrong((id *)&v26->_endOfSentenceLikelihood, a15);
    v26->_numTokensExcludingTriggerPhrase = a16;
    objc_storeStrong((id *)&v26->_voiceCommandDebugInfo, a17);
    objc_storeStrong((id *)&v26->_performanceMarkers, a18);
  }

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18 = [_EARSpeechRecognitionResultPackage alloc];
  id v24 = [(_EARSpeechRecognitionResultPackage *)self recognition];
  id v23 = [(_EARSpeechRecognitionResultPackage *)self preITNRecognition];
  v22 = [(_EARSpeechRecognitionResultPackage *)self unrepairedRecognition];
  BOOL v4 = [(_EARSpeechRecognitionResultPackage *)self recognitionIsFormatted];
  BOOL v5 = [(_EARSpeechRecognitionResultPackage *)self isFinal];
  v21 = [(_EARSpeechRecognitionResultPackage *)self audioAnalytics];
  [(_EARSpeechRecognitionResultPackage *)self utteranceStart];
  double v7 = v6;
  v20 = [(_EARSpeechRecognitionResultPackage *)self latticeMitigatorResult];
  v8 = [(_EARSpeechRecognitionResultPackage *)self nBestVoiceCommandInterpretations];
  v17 = [(_EARSpeechRecognitionResultPackage *)self preITNNBestVoiceCommandInterpretations];
  BOOL v9 = [(_EARSpeechRecognitionResultPackage *)self recognitionPaused];
  BOOL v10 = [(_EARSpeechRecognitionResultPackage *)self firstResultAfterResume];
  uint64_t v16 = [(_EARSpeechRecognitionResultPackage *)self endOfSentenceLikelihood];
  int64_t v11 = [(_EARSpeechRecognitionResultPackage *)self numTokensExcludingTriggerPhrase];
  v12 = [(_EARSpeechRecognitionResultPackage *)self voiceCommandDebugInfo];
  v13 = [(_EARSpeechRecognitionResultPackage *)self performanceMarkers];
  BYTE1(v15) = v10;
  LOBYTE(v15) = v9;
  id v19 = -[_EARSpeechRecognitionResultPackage _initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:nBestVoiceCommandInterpretations:preITNNBestVoiceCommandInterpretations:recognitionPaused:firstResultAfterResume:endOfSentenceLikelihood:numTokensExcludingTriggerPhrase:voiceCommandDebugInfo:performanceMarkers:](v18, "_initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:nBestVoiceCommandInterpretations:preITNNBestVoiceCommandInterpretations:recognitionPaused:firstResultAfterResume:endOfSentenceLikelihood:numTokensExcludingTriggerPhrase:voiceCommandDebugInfo:performanceMarkers:", v24, v23, v22, v4, v5, v21, v7, v20, v8, v17, v15, v16, v11, v12,
          v13);

  return v19;
}

- (id)nBestResults
{
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [(_EARSpeechRecognition *)self->_recognition nBest];
  BOOL v4 = [(_EARSpeechRecognition *)self->_preITNRecognition nBest];
  unint64_t v5 = [v3 count];
  if (v5 >= [v4 count]) {
    double v6 = v4;
  }
  else {
    double v6 = v3;
  }
  uint64_t v7 = [v6 count];
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      BOOL v9 = [_EARSpeechRecognitionResult alloc];
      BOOL v10 = [v3 objectAtIndex:i];
      EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(v10, v16);
      int64_t v11 = [v4 objectAtIndex:i];
      EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(v11, v15);
      id v12 = [(_EARSpeechRecognitionResult *)v9 _initWithTokens:v16 preITNTokens:v15];
      v17 = (void **)v15;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v17);

      v17 = (void **)v16;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v17);

      [v14 addObject:v12];
    }
  }

  return v14;
}

- (void)setCorrectPartialResultIndexList:(id)a3
{
}

- (void)setCorrectPartialResultIndexList:(const void *)a3 oneBestFinalResult:(const void *)a4 partialResultIndexOffset:(int)a5
{
  if (*(void *)a4 == *((void *)a4 + 1))
  {
    if (quasar::gLogLevel >= 6)
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v47 = 0u;
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v47);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v47, (uint64_t)"[TTAW] Final Result Empty.", 26);
      quasar::QuasarTraceMessage::~QuasarTraceMessage((quasar::QuasarTraceMessage *)&v47);
    }
  }
  else
  {
    quasar::strictAlignTokensToFirstSeenPartialResults((uint64_t *)a3, (uint64_t *)a4, a5, &v46);
    id v43 = 0;
    id v44 = 0;
    unint64_t v45 = 0;
    std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(&v43, *(uint64_t **)a3, *((uint64_t **)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3));
    BOOL v9 = v44;
    if ((unint64_t)v44 >= v45)
    {
      uint64_t v10 = std::vector<std::vector<quasar::Token>>::__emplace_back_slow_path<std::vector<quasar::Token> const&>((uint64_t *)&v43, (uint64_t *)a4);
    }
    else
    {
      *id v44 = 0;
      v9[1] = 0;
      v9[2] = 0;
      std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v9, *(void *)a4, *((void *)a4 + 1), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5));
      uint64_t v10 = (uint64_t)(v9 + 3);
    }
    id v44 = (void *)v10;
    quasar::alignTokensToFirstSeenPartialResultsV3(&v43, (unsigned __int8 **)a4, a5, &v42);
    std::vector<int>::pointer begin = v42.__begin_;
    std::vector<int>::pointer end = v42.__end_;
    if (v42.__begin_ != v42.__end_)
    {
      unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
      do
      {
        if (*begin != -1)
        {
          unint64_t v14 = (*begin - a5);
          if ((v14 & 0x80000000) != 0 || v13 < v14)
          {
            kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v47);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v47, (uint64_t)"0 <= partialResultIndexWithoutOffset && partialResultIndexWithoutOffset <= partialResults.size()", 96);
            kaldi::KaldiErrorMessage::~KaldiErrorMessage((kaldi::KaldiErrorMessage *)&v47);
          }
          if (v13 == v14) {
            *std::vector<int>::pointer begin = -2;
          }
        }
        ++begin;
      }
      while (begin != end);
    }
    if (quasar::gLogLevel > 5)
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v47 = 0u;
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v47);
      uint64_t v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v47, (uint64_t)"[TTAW] oneBestFinalResult: ", 27);
      quasar::tokens2Str((uint64_t *)a4, &v41);
      if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v16 = &v41;
      }
      else {
        uint64_t v16 = (std::string *)v41.__r_.__value_.__r.__words[0];
      }
      if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v41.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v41.__r_.__value_.__l.__size_;
      }
      v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v16, size);
      id v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)", correctIndexList: [", 21);
      v38[0] = (uint64_t)",";
      v38[1] = 1;
      quasar::join<std::vector<int>>((uint64_t *)&v46, v38);
      if ((v40 & 0x80u) == 0) {
        v20 = v39;
      }
      else {
        v20 = (void **)v39[0];
      }
      if ((v40 & 0x80u) == 0) {
        uint64_t v21 = v40;
      }
      else {
        uint64_t v21 = (uint64_t)v39[1];
      }
      v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)v20, v21);
      id v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)"]", 1);
      id v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)", correctAlignedIndexList: [", 28);
      v35[0] = (uint64_t)",";
      v35[1] = 1;
      quasar::join<std::vector<int>>((uint64_t *)&v42, v35);
      if ((v37 & 0x80u) == 0) {
        id v25 = __p;
      }
      else {
        id v25 = (void **)__p[0];
      }
      if ((v37 & 0x80u) == 0) {
        uint64_t v26 = v37;
      }
      else {
        uint64_t v26 = (uint64_t)__p[1];
      }
      uint64_t v27 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)v25, v26);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"]", 1);
      if ((char)v37 < 0) {
        operator delete(__p[0]);
      }
      if ((char)v40 < 0) {
        operator delete(v39[0]);
      }
      if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v41.__r_.__value_.__l.__data_);
      }
      quasar::QuasarTraceMessage::~QuasarTraceMessage((quasar::QuasarTraceMessage *)&v47);
    }
    EARHelpers::VectorToArray<int>((unsigned int **)&v46);
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    correctPartialResultIndexList = self->_correctPartialResultIndexList;
    self->_correctPartialResultIndexList = v28;

    v30 = [_EARPerformanceMarkers alloc];
    uint64_t v31 = EARHelpers::VectorToArray<int>((unsigned int **)&v46);
    v32 = EARHelpers::VectorToArray<int>((unsigned int **)&v42);
    uint64_t v33 = [(_EARPerformanceMarkers *)v30 initWithCorrectPartialResultIndexList:v31 correctAlignedPartialResultIndexList:v32 tokenDelayInMilliseconds:0];
    performanceMarkers = self->_performanceMarkers;
    self->_performanceMarkers = v33;

    if (v42.__begin_)
    {
      v42.__end_ = v42.__begin_;
      operator delete(v42.__begin_);
    }
    *(void *)&long long v47 = &v43;
    std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
    if (v46.__begin_)
    {
      v46.__end_ = v46.__begin_;
      operator delete(v46.__begin_);
    }
  }
}

- (BOOL)hasNonEmptyToken
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v2 = [(_EARSpeechRecognitionResultPackage *)self recognition];
  v3 = [v2 tokenSausage];

  id v24 = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v34;
    uint64_t v21 = *(void *)v34;
    do
    {
      uint64_t v6 = 0;
      uint64_t v22 = v4;
      do
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v33 + 1) + 8 * v6);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v30;
          uint64_t v23 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v30 != v10) {
                objc_enumerationMutation(v8);
              }
              id v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              long long v25 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              id v13 = v12;
              uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v37 count:16];
              if (v14)
              {
                uint64_t v15 = *(void *)v26;
                while (2)
                {
                  for (uint64_t j = 0; j != v14; ++j)
                  {
                    if (*(void *)v26 != v15) {
                      objc_enumerationMutation(v13);
                    }
                    v17 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "tokenName", v21);
                    BOOL v18 = [v17 length] == 0;

                    if (!v18)
                    {

                      BOOL v19 = 1;
                      v3 = v24;
                      goto LABEL_26;
                    }
                  }
                  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v37 count:16];
                  if (v14) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v10 = v23;
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v38 count:16];
          }
          while (v9);
        }

        ++v6;
        uint64_t v5 = v21;
        v3 = v24;
      }
      while (v6 != v22);
      uint64_t v4 = [v24 countByEnumeratingWithState:&v33 objects:v39 count:16];
      BOOL v19 = 0;
    }
    while (v4);
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_26:

  return v19;
}

- (void)setFirstResultAfterResume:(BOOL)a3
{
  self->_firstResultAfterResume = a3;
}

- (_EARSpeechRecognition)recognition
{
  return self->_recognition;
}

- (_EARSpeechRecognition)preITNRecognition
{
  return self->_preITNRecognition;
}

- (_EARSpeechRecognition)unrepairedRecognition
{
  return self->_unrepairedRecognition;
}

- (BOOL)recognitionIsFormatted
{
  return self->_recognitionIsFormatted;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (void)setIsFinal:(BOOL)a3
{
  self->_isFinal = a3;
}

- (_EARAudioAnalytics)audioAnalytics
{
  return self->_audioAnalytics;
}

- (double)utteranceStart
{
  return self->_utteranceStart;
}

- (_EARLatticeMitigatorResult)latticeMitigatorResult
{
  return self->_latticeMitigatorResult;
}

- (NSArray)correctPartialResultIndexList
{
  return self->_correctPartialResultIndexList;
}

- (NSArray)nBestVoiceCommandInterpretations
{
  return self->_nBestVoiceCommandInterpretations;
}

- (NSArray)preITNNBestVoiceCommandInterpretations
{
  return self->_preITNNBestVoiceCommandInterpretations;
}

- (BOOL)recognitionPaused
{
  return self->_recognitionPaused;
}

- (void)setRecognitionPaused:(BOOL)a3
{
  self->_recognitionPaused = a3;
}

- (BOOL)firstResultAfterResume
{
  return self->_firstResultAfterResume;
}

- (NSNumber)endOfSentenceLikelihood
{
  return self->_endOfSentenceLikelihood;
}

- (int64_t)numTokensExcludingTriggerPhrase
{
  return self->_numTokensExcludingTriggerPhrase;
}

- (_EARVoiceCommandDebugInfo)voiceCommandDebugInfo
{
  return self->_voiceCommandDebugInfo;
}

- (_EARPerformanceMarkers)performanceMarkers
{
  return self->_performanceMarkers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMarkers, 0);
  objc_storeStrong((id *)&self->_voiceCommandDebugInfo, 0);
  objc_storeStrong((id *)&self->_endOfSentenceLikelihood, 0);
  objc_storeStrong((id *)&self->_preITNNBestVoiceCommandInterpretations, 0);
  objc_storeStrong((id *)&self->_nBestVoiceCommandInterpretations, 0);
  objc_storeStrong((id *)&self->_correctPartialResultIndexList, 0);
  objc_storeStrong((id *)&self->_latticeMitigatorResult, 0);
  objc_storeStrong((id *)&self->_audioAnalytics, 0);
  objc_storeStrong((id *)&self->_unrepairedRecognition, 0);
  objc_storeStrong((id *)&self->_preITNRecognition, 0);
  objc_storeStrong((id *)&self->_recognition, 0);
}

@end