@interface _EARSpeechRecognizer
+ (BOOL)ConvertCXXExceptionToNSError:(id)a3 error:(id *)a4;
+ (BOOL)compileRecognizerModels2WithConfiguration:(id)a3 error:(id *)a4;
+ (id)EARErrorWithCode:(int64_t)a3 localizedDescription:(id)a4;
+ (id)maximumSupportedConfigurationVersion;
+ (id)minimumSupportedConfigurationVersion;
+ (id)rawTokenResultsFromRecognitionResults:(id)a3;
+ (int64_t)EARErrorCodeForExceptionMessage:(id)a3;
+ (void)ConvertCXXExceptionToNSException:(id)a3;
+ (void)EARSetError:(id *)a3 error:(id)a4;
+ (void)compileRecognizerModelsWithConfiguration:(id)a3;
+ (void)initialize;
+ (void)purgeCompiledRecognizerModelsWithConfiguration:(id)a3;
- (BOOL)allowUtteranceDelay;
- (BOOL)atypicalSpeech;
- (BOOL)canCloneIsFinalAsLastNonFinal;
- (BOOL)concatenateUtterances;
- (BOOL)detectUtterances;
- (BOOL)disableAutoPunctuation;
- (BOOL)disableContextualBiasing;
- (BOOL)disablePartialResults;
- (BOOL)enableSpeakerCodeTraining;
- (BOOL)enableVoiceCommands;
- (BOOL)farField;
- (BOOL)formatAcrossUtterances;
- (BOOL)highPriority;
- (BOOL)isContinuousListening;
- (BOOL)isLegacyVoiceCommandRequest;
- (BOOL)isSpeakerCodeTrainingSupported:(id)a3;
- (BOOL)recognizeEagerCandidates;
- (BOOL)recognizeEmoji;
- (BOOL)scoreNbest;
- (BOOL)shouldGenerateVoiceCommandCandidates;
- (EARVoiceCommandActiveSet)voiceCommandActiveSet;
- (NSArray)extraLmList;
- (NSArray)leftContext;
- (NSArray)leftContextForItn;
- (NSArray)scoreNbestExtraLmList;
- (NSData)jitProfileData;
- (NSData)userProfileData;
- (NSDictionary)recognitionConfidenceSubtraction;
- (NSDictionary)recognitionReplacements;
- (NSNumber)overrideDoServerSideEndpointing;
- (NSString)aneContext;
- (NSString)bluetoothDeviceId;
- (NSString)configPath;
- (NSString)cpuContext;
- (NSString)deviceId;
- (NSString)gpuContext;
- (NSString)inputOrigin;
- (NSString)refTranscriptForErrorBlaming;
- (NSString)rightContext;
- (NSString)selectedText;
- (NSString)sessionId;
- (NSString)userId;
- (_EARRecognitionMetrics)recognitionMetrics;
- (_EARRelevantTextContext)relevantTextContext;
- (_EARSpeakerCodeInfo)speakerCodeInfo;
- (_EARSpeechModelInfo)modelInfo;
- (_EARSpeechRecognizer)initWithConfig:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10 voiceCommandActiveSet:(id)a11 modelContextDelegate:(id)a12 enableItn:(BOOL)a13 error:(id *)a14;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrideConfigFiles:(id)a4;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrideConfigFiles:(id)a4 generalVoc:(id)a5 lexiconEnh:(id)a6 itnEnh:(id)a7;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 generalVoc:(id)a5 lexiconEnh:(id)a6 itnEnh:(id)a7;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 enableSpeakerCodeTraining:(BOOL)a11;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 modelLoadingOptions:(id)a11 enableSpeakerCodeTraining:(BOOL)a12;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 modelLoadingOptions:(id)a11 enableSpeakerCodeTraining:(BOOL)a12 supportEmojiRecognition:(BOOL)a13;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 modelLoadingOptions:(id)a11 enableSpeakerCodeTraining:(BOOL)a12 supportEmojiRecognition:(BOOL)a13 voiceCommandActiveSet:(id)a14;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 modelLoadingOptions:(id)a11 enableSpeakerCodeTraining:(BOOL)a12 supportEmojiRecognition:(BOOL)a13 voiceCommandActiveSet:(id)a14 modelContextDelegate:(id)a15;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 enableSpeakerCodeTraining:(BOOL)a8;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10 voiceCommandActiveSet:(id)a11;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10 voiceCommandActiveSet:(id)a11 modelContextDelegate:(id)a12;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10 voiceCommandActiveSet:(id)a11 modelContextDelegate:(id)a12 enableItn:(BOOL)a13;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 useQuasarFormatter:(BOOL)a4;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 useQuasarFormatter:(BOOL)a4 activeConfiguration:(id)a5;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 withGeneralVoc:(id)a4 withLexiconEnh:(id)a5 withItnEnh:(id)a6;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 withLanguage:(id)a4 withSdapiConfig:(id)a5;
- (double)endpointStart;
- (double)latitude;
- (double)longitude;
- (double)maximumRecognitionDuration;
- (id).cxx_construct;
- (id)_tokenizer;
- (id)_unmaskMuxPackages:(id)a3;
- (id)activeConfiguration;
- (id)recognitionResultsWithAudioData:(id)a3 userProfileData:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7;
- (id)recognitionResultsWithAudioData:(id)a3 userProfileData:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 extraLanguageModel:(id)a8;
- (id)recognitionStatistics;
- (id)recognitionUtteranceInfos;
- (id)recognitionUtterenceStatistics;
- (id)runRecognitionWithResultStream:(id)a3;
- (id)runRecognitionWithResultStream:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6;
- (id)runRecognitionWithResultStream:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6 userProfileData:(id)a7 speakerCodeWriter:(id)a8;
- (id)runRecognitionWithResultStream:(id)a3 speakerCodeWriter:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7;
- (id)testFormattingWithOneBestResults:(id)a3 uttMillis:(id)a4;
- (id)tokenizeTextFromEnd:(id)a3 withLimit:(unint64_t)a4 outTokensInVocab:(id *)a5;
- (int)getCachedTokensSize;
- (shared_ptr<quasar::RecogAudioBufferBase>)_audioBufferWithLangauge:(id)a3 task:(id)a4 samplingRate:(unint64_t)a5 userProfileData:(id)a6 resultStream:(shared_ptr<quasar::RecogResultStreamBase>)a7;
- (shared_ptr<quasar::SpeechRecognizer>)getRecognizer;
- (shared_ptr<quasar::corrective_reranking::Parser>)getParser;
- (unsigned)itnEnablingFlags;
- (vector<std::string,)splitWithTokenizer:(_EARSpeechRecognizer *)self isLeftContext:(SEL)a3 shouldTruncate:(id)a4 outTokensInVocab:(BOOL)a5;
- (vector<std::string,)splitWithTokenizer:(_EARSpeechRecognizer *)self outTokensInVocab:(SEL)a3 isLeftContext:(id)a4;
- (void)_restartActiveRecognition;
- (void)_setProfileContainers:(id)a3 muxIds:(id)a4;
- (void)_waitForAsyncRecogToFinish;
- (void)_waitForInitialization;
- (void)cancelRecognition;
- (void)dumpModelVirtualMemoryInfo;
- (void)getFormatterWithBlock:(id)a3;
- (void)interruptTraining;
- (void)loadParser;
- (void)pauseRecognition;
- (void)requestEagerResult:(id)a3;
- (void)resumeRecognitionWithLeftContext:(id)a3 rightContext:(id)a4 selectedText:(id)a5;
- (void)setActiveConfiguration:(id)a3;
- (void)setAllowUtteranceDelay:(BOOL)a3;
- (void)setAlternateRawRecognitionTokenSausage:(id)a3;
- (void)setAneContext:(id)a3;
- (void)setAtypicalSpeech:(BOOL)a3;
- (void)setBluetoothDeviceId:(id)a3;
- (void)setConcatenateUtterances:(BOOL)a3;
- (void)setCpuContext:(id)a3;
- (void)setDetectUtterances:(BOOL)a3;
- (void)setDeviceId:(id)a3;
- (void)setDisableAutoPunctuation:(BOOL)a3;
- (void)setDisableContextualBiasing:(BOOL)a3;
- (void)setDisablePartialResults:(BOOL)a3;
- (void)setEnableSpeakerCodeTraining:(BOOL)a3;
- (void)setEnableVoiceCommands:(BOOL)a3;
- (void)setEndpointStart:(double)a3;
- (void)setExtraLmList:(id)a3;
- (void)setFarField:(BOOL)a3;
- (void)setFormatAcrossUtterances:(BOOL)a3;
- (void)setGpuContext:(id)a3;
- (void)setHighPriority:(BOOL)a3;
- (void)setInputOrigin:(id)a3;
- (void)setJitProfileData:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLeftContext:(id)a3;
- (void)setLeftContextForItn:(id)a3;
- (void)setLeftContextText:(id)a3;
- (void)setLongitude:(double)a3;
- (void)setMaximumRecognitionDuration:(double)a3;
- (void)setOverrideDoServerSideEndpointing:(id)a3;
- (void)setRecognitionConfidenceSubtraction:(id)a3;
- (void)setRecognitionMetrics:(id)a3;
- (void)setRecognitionReplacements:(id)a3;
- (void)setRecognizeEagerCandidates:(BOOL)a3;
- (void)setRecognizeEmoji:(BOOL)a3;
- (void)setRefTranscriptForErrorBlaming:(id)a3;
- (void)setRelevantTextContext:(id)a3;
- (void)setRightContext:(id)a3;
- (void)setScoreNbest:(BOOL)a3;
- (void)setScoreNbestExtraLmList:(id)a3;
- (void)setSelectedText:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setShouldGenerateVoiceCommandCandidates:(BOOL)a3;
- (void)setUserId:(id)a3;
- (void)setUserProfile:(id)a3;
- (void)setUserProfileData:(id)a3;
- (void)updateJitProfileData:(id)a3;
- (void)updateUserProfileData:(id)a3;
- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9;
- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10;
- (void)writeRecordedStateAccesses;
@end

@implementation _EARSpeechRecognizer

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

+ (id)minimumSupportedConfigurationVersion
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d.%d", 14, 2);
}

+ (id)maximumSupportedConfigurationVersion
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d.%d", 274, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3
{
  return [(_EARSpeechRecognizer *)self initWithConfiguration:a3 overrides:0 overrideConfigFiles:0];
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4
{
  return [(_EARSpeechRecognizer *)self initWithConfiguration:a3 overrides:a4 overrideConfigFiles:0];
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrideConfigFiles:(id)a4
{
  return [(_EARSpeechRecognizer *)self initWithConfiguration:a3 overrides:0 overrideConfigFiles:a4];
}

+ (void)ConvertCXXExceptionToNSException:(id)a3
{
}

+ (BOOL)ConvertCXXExceptionToNSError:(id)a3 error:(id *)a4
{
  return ConvertCXXExceptionToNSError(a3);
}

+ (void)EARSetError:(id *)a3 error:(id)a4
{
  if (a3)
  {
    if (a4) {
      *a3 = a4;
    }
  }
}

+ (int64_t)EARErrorCodeForExceptionMessage:(id)a3
{
  return EARErrorCodeForExceptionMessage((NSString *)a3);
}

+ (id)EARErrorWithCode:(int64_t)a3 localizedDescription:(id)a4
{
  v4 = EARErrorWithCode(a3, a4);
  return v4;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForEverything];
  v12 = [(_EARSpeechRecognizer *)self initWithConfiguration:v8 overrides:v9 overrideConfigFiles:v10 language:0 activeConfiguration:v11];

  return v12;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForEverything];
  v15 = [(_EARSpeechRecognizer *)self initWithConfiguration:v10 overrides:v11 overrideConfigFiles:v12 language:v13 activeConfiguration:v14];

  return v15;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7
{
  return [(_EARSpeechRecognizer *)self initWithConfiguration:a3 overrides:a4 overrideConfigFiles:a5 language:a6 activeConfiguration:a7 enableSpeakerCodeTraining:1];
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 enableSpeakerCodeTraining:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return [(_EARSpeechRecognizer *)self initWithConfiguration:a3 overrides:a4 overrideConfigFiles:a5 language:a6 activeConfiguration:a7 modelLoadingOptions:0 enableSpeakerCodeTraining:v9];
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9
{
  LOWORD(v10) = a9;
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:", a3, a4, a5, a6, a7, a8, v10);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10
{
  LOWORD(v11) = __PAIR16__(a10, a9);
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:", a3, a4, a5, a6, a7, a8, v11, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10 voiceCommandActiveSet:(id)a11
{
  LOWORD(v12) = __PAIR16__(a10, a9);
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:", a3, a4, a5, a6, a7, a8, v12, a11, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10 voiceCommandActiveSet:(id)a11 modelContextDelegate:(id)a12
{
  LOBYTE(v14) = 0;
  LOWORD(v13) = __PAIR16__(a10, a9);
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:", a3, a4, a5, a6, a7, a8, v13, a11, a12, v14);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10 voiceCommandActiveSet:(id)a11 modelContextDelegate:(id)a12 enableItn:(BOOL)a13
{
  LOBYTE(v15) = a13;
  LOWORD(v14) = __PAIR16__(a10, a9);
  return -[_EARSpeechRecognizer initWithConfig:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:error:](self, "initWithConfig:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:error:", a3, a4, a5, a6, a7, a8, v14, a11, a12, v15, 0);
}

- (_EARSpeechRecognizer)initWithConfig:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10 voiceCommandActiveSet:(id)a11 modelContextDelegate:(id)a12 enableItn:(BOOL)a13 error:(id *)a14
{
  id v21 = a3;
  id v104 = a4;
  id v105 = a5;
  id v22 = a6;
  id v103 = a7;
  id v102 = a8;
  v101 = (quasar *)a11;
  id v23 = a12;
  v139.receiver = self;
  v139.super_class = (Class)_EARSpeechRecognizer;
  id v24 = [(_EARSpeechRecognizer *)&v139 init];
  if (!v24) {
    goto LABEL_74;
  }
  v100 = v22;
  dispatch_queue_t v25 = dispatch_queue_create("com.apple._EARSpeechRecognizer.recognition", 0);
  v26 = (void *)*((void *)v24 + 20);
  *((void *)v24 + 20) = v25;

  dispatch_queue_t v27 = dispatch_queue_create("com.apple._EARSpeechRecognizer.formatter", 0);
  v28 = (void *)*((void *)v24 + 1);
  *((void *)v24 + 1) = v27;

  dispatch_queue_t v29 = dispatch_queue_create("com.apple._EARSpeechRecognizer.training", 0);
  v30 = (void *)*((void *)v24 + 3);
  *((void *)v24 + 3) = v29;

  v137[0] = 0;
  v137[1] = v137;
  v137[2] = 0x4812000000;
  v137[3] = __Block_byref_object_copy__523;
  v137[4] = __Block_byref_object_dispose__524;
  v137[5] = &unk_1B27252DB;
  memset(v138, 0, sizeof(v138));
  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = __227___EARSpeechRecognizer_initWithConfig_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_error___block_invoke;
  v136[3] = &unk_1E5FFE350;
  v136[4] = v137;
  [v105 enumerateObjectsUsingBlock:v136];
  *((void *)v24 + 40) = 0x40F5180000000000;
  uint64_t v31 = [v21 copy];
  v32 = (void *)*((void *)v24 + 62);
  *((void *)v24 + 62) = v31;

  v33 = (void *)*((void *)v24 + 44);
  *((void *)v24 + 44) = &stru_1F0A64AB0;

  v34 = (void *)*((void *)v24 + 45);
  *((void *)v24 + 45) = &stru_1F0A64AB0;

  v35 = (void *)*((void *)v24 + 46);
  *((void *)v24 + 46) = &stru_1F0A64AB0;

  v36 = (void *)*((void *)v24 + 47);
  *((void *)v24 + 47) = &stru_1F0A64AB0;

  *((unsigned char *)v24 + 273) = 0;
  v37 = (void *)*((void *)v24 + 48);
  *((void *)v24 + 48) = &stru_1F0A64AB0;

  v38 = (void *)*((void *)v24 + 49);
  *((void *)v24 + 49) = &stru_1F0A64AB0;

  *((unsigned char *)v24 + 248) = 0;
  int64x2_t v98 = vdupq_n_s64(0x4076800000000000uLL);
  *(int64x2_t *)&v113.__r_.__value_.__l.__data_ = v98;
  *((double *)v24 + 52) = quasar::Location::getLatitude((quasar::Location *)&v113);
  *(int64x2_t *)&v113.__r_.__value_.__l.__data_ = v98;
  *((double *)v24 + 53) = quasar::corrective_reranking::VoiceEditingWFST::Path::getWeight((quasar::corrective_reranking::VoiceEditingWFST::Path *)&v113);
  *((unsigned char *)v24 + 271) = a9;
  uint64_t v132 = 0;
  v133 = &v132;
  uint64_t v134 = 0x2020000000;
  int v135 = 0;
  if (v23)
  {
    v39 = operator new(0x30uLL);
    v39[1] = 0;
    v39[2] = 0;
    void *v39 = &unk_1F0A5DE00;
    EARModelInitializeContext::EARModelInitializeContext((uint64_t)(v39 + 3), v23);
    v40 = (std::__shared_weak_count *)*((void *)v24 + 29);
    *((void *)v24 + 28) = v39 + 3;
    *((void *)v24 + 29) = v39;
    if (v40) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v40);
    }
  }
  if (!v21)
  {
    v82 = [MEMORY[0x1E4F28B00] currentHandler];
    [v82 handleFailureInMethod:a2 object:v24 file:@"EARSpeechRecognizer.mm" lineNumber:4086 description:&stru_1F0A64AB0];
  }
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __227___EARSpeechRecognizer_initWithConfig_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_error___block_invoke_2;
  v124[3] = &unk_1E5FFE378;
  id v41 = v24;
  id v125 = v41;
  id v42 = v21;
  id v126 = v42;
  v130 = v137;
  id v127 = v104;
  v131 = &v132;
  id v128 = v103;
  id v129 = v102;
  v43 = (void *)MEMORY[0x1B3EA9B60](v124);
  v99 = v43;
  if (a14)
  {
    if ((ConvertCXXExceptionToNSError(v43) & 1) == 0)
    {
      BOOL v44 = 0;
      goto LABEL_73;
    }
  }
  else
  {
    ConvertCXXExceptionToNSException(v43);
  }
  uint64_t v45 = *((unsigned int *)v133 + 6);
  BOOL v97 = v45 == 0;
  if (!v45)
  {
    v50 = [_EARSpeechModelInfo alloc];
    SysConfig = (quasar::SystemConfig *)quasar::SpeechRecognizer::getSysConfig(*((quasar::SpeechRecognizer **)v41 + 10));
    uint64_t v52 = [(_EARSpeechModelInfo *)v50 _initWithSpeechModelInfo:quasar::SystemConfig::getMainSpeechModelInfo(SysConfig)];
    v53 = (void *)*((void *)v41 + 37);
    *((void *)v41 + 37) = v52;

    quasar::SpeechRecognizer::getTraining(*((void *)v41 + 10), &v113);
    long long v54 = *(_OWORD *)&v113.__r_.__value_.__l.__data_;
    *(_OWORD *)&v113.__r_.__value_.__l.__data_ = 0uLL;
    v55 = (std::__shared_weak_count *)*((void *)v41 + 5);
    *((_OWORD *)v41 + 2) = v54;
    if (v55)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v55);
      if (v113.__r_.__value_.__l.__size_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v113.__r_.__value_.__l.__size_);
      }
      if (!*((void *)v41 + 4)) {
        goto LABEL_64;
      }
    }
    else if (!(void)v54)
    {
      goto LABEL_64;
    }
    if (*((unsigned char *)v24 + 271))
    {
      v56 = [[_EARSpeakerCodeInfo alloc] initWithLanguage:v22];
      v57 = (void *)*((void *)v41 + 38);
      *((void *)v41 + 38) = v56;

      v58 = [*((id *)v41 + 38) trainingSpeakerCode];
      if ([v58 length])
      {
        v59 = [*((id *)v41 + 38) inferenceSpeakerCode];
        if ([v59 length])
        {
          v60 = [*((id *)v41 + 38) accumulatedGradient];
          uint64_t v94 = [v60 length];

          if (v94)
          {
            uint64_t v88 = *((void *)v41 + 4);
            v61 = [*((id *)v41 + 38) trainingSpeakerCode];
            v95 = v61;
            if (v61) {
              objc_msgSend(v61, "ear_toString");
            }
            else {
              memset(&v113, 0, sizeof(v113));
            }
            std::allocate_shared[abi:ne180100]<std::istringstream,std::allocator<std::istringstream>,std::string,void>(&v113, &v122);
            long long v123 = v122;
            long long v122 = 0uLL;
            v65 = [*((id *)v41 + 38) inferenceSpeakerCode];
            v93 = v65;
            if (v65) {
              objc_msgSend(v65, "ear_toString");
            }
            else {
              memset(&v115, 0, sizeof(v115));
            }
            std::allocate_shared[abi:ne180100]<std::istringstream,std::allocator<std::istringstream>,std::string,void>(&v115, &v120);
            long long v121 = v120;
            long long v120 = 0uLL;
            v66 = [*((id *)v41 + 38) accumulatedGradient];
            v91 = v66;
            if (v66) {
              objc_msgSend(v66, "ear_toString");
            }
            else {
              memset(&__p, 0, sizeof(__p));
            }
            std::allocate_shared[abi:ne180100]<std::istringstream,std::allocator<std::istringstream>,std::string,void>(&__p, &v118);
            long long v119 = v118;
            long long v118 = 0uLL;
            v87 = [*((id *)v41 + 38) nnetVersion];
            int v84 = [v87 unsignedIntValue];
            v85 = [*((id *)v41 + 38) numFrames];
            uint64_t v83 = [v85 unsignedLongValue];
            v67 = [*((id *)v41 + 38) trainingOffset];
            uint64_t v68 = [v67 unsignedLongValue];
            v69 = [*((id *)v41 + 38) recognitionOffset];
            quasar::SpeakerCodeTraining::init(v88, &v123, &v121, &v119, v84, v83, v68, [v69 unsignedLongValue]);

            if (*((void *)&v119 + 1)) {
              std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v119 + 1));
            }
            if (*((void *)&v118 + 1)) {
              std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v118 + 1));
            }
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }

            if (*((void *)&v121 + 1)) {
              std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v121 + 1));
            }
            if (*((void *)&v120 + 1)) {
              std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v120 + 1));
            }
            if (SHIBYTE(v115.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v115.__r_.__value_.__l.__data_);
            }

            if (*((void *)&v123 + 1)) {
              std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v123 + 1));
            }
            if (*((void *)&v122 + 1)) {
              std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v122 + 1));
            }
            if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v113.__r_.__value_.__l.__data_);
            }

            goto LABEL_64;
          }
LABEL_32:
          uint64_t v90 = *((void *)v41 + 4);
          *(_OWORD *)&v113.__r_.__value_.__l.__data_ = 0uLL;
          *(_OWORD *)&v115.__r_.__value_.__l.__data_ = 0uLL;
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
          v96 = [*((id *)v41 + 38) nnetVersion];
          int v89 = [v96 unsignedIntValue];
          v92 = [*((id *)v41 + 38) numFrames];
          uint64_t v86 = [v92 unsignedLongValue];
          v62 = [*((id *)v41 + 38) trainingOffset];
          uint64_t v63 = [v62 unsignedLongValue];
          v64 = [*((id *)v41 + 38) recognitionOffset];
          quasar::SpeakerCodeTraining::init(v90, &v113, &v115, &__p, v89, v86, v63, [v64 unsignedLongValue]);

          if (__p.__r_.__value_.__l.__size_) {
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
          }
          if (v115.__r_.__value_.__l.__size_) {
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v115.__r_.__value_.__l.__size_);
          }
          if (v113.__r_.__value_.__l.__size_) {
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v113.__r_.__value_.__l.__size_);
          }
          goto LABEL_64;
        }
      }
      goto LABEL_32;
    }
LABEL_64:
    objc_storeStrong((id *)v41 + 54, a11);
    v70 = (void *)*((void *)v41 + 54);
    if (v70)
    {
      v115.__r_.__value_.__r.__words[0] = 0;
      v115.__r_.__value_.__l.__size_ = (std::string::size_type)&v115;
      v115.__r_.__value_.__r.__words[2] = 0x2020000000;
      char v116 = 0;
      v71 = [v70 suites];
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __227___EARSpeechRecognizer_initWithConfig_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_error___block_invoke_550;
      v114[3] = &unk_1E5FFE3A0;
      v114[4] = &v115;
      [v71 enumerateObjectsUsingBlock:v114];

      if (*(unsigned char *)(v115.__r_.__value_.__l.__size_ + 24)) {
        quasar::makeVoiceCommandActiveSetCompilation(v101, v72);
      }
      _Block_object_dispose(&v115, 8);
    }
    v73 = (void *)*((void *)v41 + 57);
    *((void *)v41 + 57) = &stru_1F0A64AB0;

    v74 = (void *)*((void *)v41 + 58);
    *((void *)v41 + 58) = &stru_1F0A64AB0;

    v75 = (void *)*((void *)v41 + 59);
    *((void *)v41 + 59) = &stru_1F0A64AB0;

    if (a13)
    {
      v76 = (quasar::SpeechRecognizer *)*((void *)v41 + 10);
      if (v76)
      {
        BOOL v77 = +[_EARFormatter supportedByQuasarSystemConfig:quasar::SpeechRecognizer::getSysConfig(v76)];
        v78 = *((void *)v24 + 1);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __227___EARSpeechRecognizer_initWithConfig_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_error___block_invoke_2_556;
        block[3] = &unk_1E5FFE3C8;
        BOOL v111 = v77;
        id v107 = v41;
        id v108 = v42;
        id v109 = v105;
        BOOL v112 = a10;
        id v110 = v100;
        dispatch_async(v78, block);
      }
    }
    v79 = objc_alloc_init(_EARRelevantTextContext);
    v46 = (EARLogger *)*((void *)v41 + 64);
    *((void *)v41 + 64) = v79;
    id v22 = v100;
    goto LABEL_72;
  }
  v46 = [NSString stringWithFormat:@"Failed to initialize recognizer, result: %d", v45];
  v47 = EARLogger::QuasarOSLogger(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
    -[_EARSpeechRecognizer initWithConfig:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:error:]();
  }

  v48 = EARErrorWithCode(100, v46);
  v49 = v48;
  if (a14 && v48) {
    *a14 = v48;
  }

LABEL_72:
  BOOL v44 = v97;
LABEL_73:

  _Block_object_dispose(&v132, 8);
  _Block_object_dispose(v137, 8);
  v113.__r_.__value_.__r.__words[0] = (std::string::size_type)v138;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v113);
  if (!v44)
  {
    v80 = 0;
    goto LABEL_76;
  }
LABEL_74:
  v80 = (_EARSpeechRecognizer *)v24;
LABEL_76:

  return v80;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 withLanguage:(id)a4 withSdapiConfig:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(_EARSpeechRecognizer *)self initWithConfiguration:v8];
  uint64_t v12 = v11;
  if (v11)
  {
    formatterQueue = v11->_formatterQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75___EARSpeechRecognizer_initWithConfiguration_withLanguage_withSdapiConfig___block_invoke;
    block[3] = &unk_1E5FFE3F0;
    v16 = v11;
    id v17 = v9;
    id v18 = v10;
    dispatch_async(formatterQueue, block);
  }
  return v12;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 withGeneralVoc:(id)a4 withLexiconEnh:(id)a5 withItnEnh:(id)a6
{
  return [(_EARSpeechRecognizer *)self initWithConfiguration:a3 overrides:0 overrideConfigFiles:0 generalVoc:a4 lexiconEnh:a5 itnEnh:a6];
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8
{
  return [(_EARSpeechRecognizer *)self initWithConfiguration:a3 overrides:a4 overrideConfigFiles:a5 generalVoc:a6 lexiconEnh:a7 itnEnh:a8 language:0];
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 generalVoc:(id)a5 lexiconEnh:(id)a6 itnEnh:(id)a7
{
  return [(_EARSpeechRecognizer *)self initWithConfiguration:a3 overrides:a4 overrideConfigFiles:0 generalVoc:a5 lexiconEnh:a6 itnEnh:a7 language:0];
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrideConfigFiles:(id)a4 generalVoc:(id)a5 lexiconEnh:(id)a6 itnEnh:(id)a7
{
  return [(_EARSpeechRecognizer *)self initWithConfiguration:a3 overrides:0 overrideConfigFiles:a4 generalVoc:a5 lexiconEnh:a6 itnEnh:a7 language:0];
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForEverything];
  id v23 = [(_EARSpeechRecognizer *)self initWithConfiguration:v15 overrides:v16 overrideConfigFiles:v17 generalVoc:v18 lexiconEnh:v19 itnEnh:v20 language:v21 activeConfiguration:v22];

  return v23;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10
{
  LOBYTE(v11) = 1;
  return [(_EARSpeechRecognizer *)self initWithConfiguration:a3 overrides:a4 overrideConfigFiles:a5 generalVoc:a6 lexiconEnh:a7 itnEnh:a8 language:a9 activeConfiguration:a10 enableSpeakerCodeTraining:v11];
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 enableSpeakerCodeTraining:(BOOL)a11
{
  LOBYTE(v12) = a11;
  return [(_EARSpeechRecognizer *)self initWithConfiguration:a3 overrides:a4 overrideConfigFiles:a5 generalVoc:a6 lexiconEnh:a7 itnEnh:a8 language:a9 activeConfiguration:a10 modelLoadingOptions:0 enableSpeakerCodeTraining:v12];
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 modelLoadingOptions:(id)a11 enableSpeakerCodeTraining:(BOOL)a12
{
  LOWORD(v13) = a12;
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:](self, "initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:", a3, a4, a5, a6, a7, a8, a9, a10, a11, v13);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 modelLoadingOptions:(id)a11 enableSpeakerCodeTraining:(BOOL)a12 supportEmojiRecognition:(BOOL)a13
{
  LOWORD(v14) = __PAIR16__(a13, a12);
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:](self, "initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:", a3, a4, a5, a6, a7, a8, a9, a10, a11, v14, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 modelLoadingOptions:(id)a11 enableSpeakerCodeTraining:(BOOL)a12 supportEmojiRecognition:(BOOL)a13 voiceCommandActiveSet:(id)a14
{
  LOWORD(v15) = __PAIR16__(a13, a12);
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:](self, "initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:", a3, a4, a5, a6, a7, a8, a9, a10, a11, v15, a14, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 modelLoadingOptions:(id)a11 enableSpeakerCodeTraining:(BOOL)a12 supportEmojiRecognition:(BOOL)a13 voiceCommandActiveSet:(id)a14 modelContextDelegate:(id)a15
{
  id v20 = a3;
  id v21 = a4;
  id v36 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a9;
  id v26 = a10;
  id v27 = a11;
  id v28 = a14;
  id v29 = a15;
  v35 = v22;
  if (v22 && v23 && v24) {
    id v30 = +[_EARQuasarTokenizer extractModelRootFromNcsResourcePaths:v22 lexiconEnh:v23 tokenEnh:0 itnEnh:v24];
  }
  LOBYTE(v34) = 1;
  LOWORD(v33) = __PAIR16__(a13, a12);
  uint64_t v31 = -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:", v20, v21, v36, v25, v26, v27, v33, v28, v29, v34);

  return v31;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 useQuasarFormatter:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForEverything];
  id v8 = [(_EARSpeechRecognizer *)self initWithConfiguration:v6 useQuasarFormatter:v4 activeConfiguration:v7];

  return v8;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 useQuasarFormatter:(BOOL)a4 activeConfiguration:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(_EARSpeechRecognizer *)self initWithConfiguration:v8 overrides:0 overrideConfigFiles:0 language:0 activeConfiguration:v9];
  if (v10 && v6)
  {
    if (![(id)objc_opt_class() supportedByQuasarConfig:v10->_configPath])
    {
      uint64_t v12 = 0;
      goto LABEL_7;
    }
    objc_initWeak(&location, v10);
    formatterQueue = v10->_formatterQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85___EARSpeechRecognizer_initWithConfiguration_useQuasarFormatter_activeConfiguration___block_invoke;
    block[3] = &unk_1E5FFE418;
    uint64_t v15 = v10;
    objc_copyWeak(&v16, &location);
    dispatch_async(formatterQueue, block);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
  uint64_t v12 = v10;
LABEL_7:

  return v12;
}

- (BOOL)enableVoiceCommands
{
  return self->_enableVoiceCommands;
}

- (void)loadParser
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1B1A86000, v0, v1, "Parser initialization unknown exception", v2, v3, v4, v5, v6);
}

- (void)setEnableVoiceCommands:(BOOL)a3
{
  if (a3)
  {
    SysConfig = (quasar *)quasar::SpeechRecognizer::getSysConfig((quasar::SpeechRecognizer *)self->_recognizer.__ptr_);
    quasar::configSupportsVoiceCommands(SysConfig, v4);
  }
  self->_supportVoiceCommands = 0;
  uint64_t v5 = EARLogger::QuasarOSLogger((EARLogger *)self);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t v6 = 0;
    _os_log_impl(&dword_1B1A86000, v5, OS_LOG_TYPE_INFO, "Voice commands disabled", v6, 2u);
  }
}

- (id)_tokenizer
{
  tokenizer = self->_tokenizer;
  if (!tokenizer)
  {
    uint64_t v4 = objc_alloc_init(_EARNLTokenizer);
    uint64_t v5 = self->_tokenizer;
    self->_tokenizer = &v4->super;

    tokenizer = self->_tokenizer;
  }
  return tokenizer;
}

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
  if (a3)
  {
    object = dispatch_workloop_create_inactive("com.apple._EARSpeechRecognizer.recognition.workloop");
    dispatch_workloop_set_scheduler_priority();
    dispatch_set_qos_class_fallback();
    dispatch_activate(object);
    uint64_t v4 = dispatch_queue_attr_make_initially_inactive(0);
    uint64_t v5 = dispatch_queue_create("com.apple._EARSpeechRecognizer.recognition", v4);

    dispatch_set_target_queue(v5, object);
    dispatch_set_qos_class_floor(v5, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_activate(v5);
    recognitionQueue = self->_recognitionQueue;
    self->_recognitionQueue = (OS_dispatch_queue *)v5;

    v7 = (OS_dispatch_queue *)object;
  }
  else
  {
    id v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple._EARSpeechRecognizer.recognition", 0);
    v7 = self->_recognitionQueue;
    self->_recognitionQueue = v8;
  }
}

- (void)setLeftContextText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    *(_OWORD *)std::string __p = 0u;
    long long v25 = 0u;
LABEL_5:
    uint8_t v6 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v4, "ear_toStringOrNothing");
  uint8_t v6 = v5;
  if (!BYTE8(v25)) {
    goto LABEL_5;
  }
LABEL_6:
  id v7 = v6;
  if (BYTE8(v25) && SBYTE7(v25) < 0) {
    operator delete(__p[0]);
  }
  id v8 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  id v9 = [v7 componentsSeparatedByCharactersInSet:v8];
  if ([v9 count])
  {
    id v10 = [v9 lastObject];
  }
  else
  {
    id v10 = &stru_1F0A64AB0;
  }
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = v11;
  if (self->_enableVoiceCommands) {
    uint64_t v13 = 50;
  }
  else {
    uint64_t v13 = 4;
  }
  id v23 = v11;
  uint64_t v14 = [(_EARSpeechRecognizer *)self tokenizeTextFromEnd:v10 withLimit:v13 outTokensInVocab:&v23];
  id v15 = v23;

  onScreenContextForEditLme = self->_onScreenContextForEditLme;
  self->_onScreenContextForEditLme = v14;

  NSUInteger v17 = [(NSArray *)self->_onScreenContextForEditLme count];
  id v18 = self->_onScreenContextForEditLme;
  if (v17 < 5)
  {
    id v19 = v18;
  }
  else
  {
    -[NSArray subarrayWithRange:](v18, "subarrayWithRange:", [(NSArray *)self->_onScreenContextForEditLme count] - 4, 4);
    id v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  leftContextForItn = self->_leftContextForItn;
  self->_leftContextForItn = v19;

  [(_EARRelevantTextContext *)self->_relevantTextContext setLeftContext:v7];
  if ((unint64_t)[v15 count] >= 5)
  {
    id v21 = objc_msgSend(v15, "subarrayWithRange:", objc_msgSend(v15, "count") - 4, 4);
    uint64_t v22 = [v21 mutableCopy];

    id v15 = (id)v22;
  }
  [(_EARSpeechRecognizer *)self setLeftContext:v15];
}

- (void)setLeftContext:(id)a3
{
  id v6 = a3;
  id v4 = (NSArray *)[v6 copy];
  leftContext = self->_leftContext;
  self->_leftContext = v4;

  [(_EARSpeechRecognizer *)self _restartActiveRecognition];
}

- (void)setRightContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "ear_toStringOrNothing");
    if (BYTE8(v9)) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
    *(_OWORD *)std::string __p = 0u;
    long long v9 = 0u;
  }
  id v7 = v6;
  if (BYTE8(v9) && SBYTE7(v9) < 0) {
    operator delete(__p[0]);
  }
  -[_EARSpeechRecognizer splitWithTokenizer:isLeftContext:shouldTruncate:outTokensInVocab:](self, "splitWithTokenizer:isLeftContext:shouldTruncate:outTokensInVocab:", v7, 0, 1, 0, __p[0]);
  std::vector<std::string>::__vdeallocate((std::vector<std::wstring> *)&self->_rightContextTokens);
  *(_OWORD *)&self->_rightContextTokens.__begin_ = *(_OWORD *)__p;
  self->_rightContextTokens.__end_cap_.__value_ = (void *)v9;
  __p[1] = 0;
  *(void *)&long long v9 = 0;
  __p[0] = 0;
  id v10 = __p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v10);
  [(_EARRelevantTextContext *)self->_relevantTextContext setRightContext:v7];
  [(_EARSpeechRecognizer *)self _restartActiveRecognition];
}

- (void)setUserProfileData:(id)a3
{
  id v6 = a3;
  id v4 = (NSData *)[v6 copy];
  userProfileData = self->_userProfileData;
  self->_userProfileData = v4;

  [(_EARSpeechRecognizer *)self _restartActiveRecognition];
}

- (void)setJitProfileData:(id)a3
{
  id v6 = a3;
  id v4 = (NSData *)[v6 copy];
  jitProfileData = self->_jitProfileData;
  self->_jitProfileData = v4;

  [(_EARSpeechRecognizer *)self _restartActiveRecognition];
}

- (void)_setProfileContainers:(id)a3 muxIds:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v56 = a4;
  muxIdMasunint64_t k = self->_muxIdMask;
  self->_muxIdMasunint64_t k = 0;

  muxIdReverseMasunint64_t k = self->_muxIdReverseMask;
  self->_muxIdReverseMasunint64_t k = 0;

  muxIds = self->_muxIds;
  self->_muxIds = 0;

  userProfiles = self->_userProfiles;
  v57 = self;
  self->_userProfiles = 0;

  v61 = (EARHelpers *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v62 = (EARHelpers *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obuint64_t j = v6;
  uint64_t v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16, v6);
  if (v11)
  {
    uint64_t v12 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v72 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v71 + 1) + 8 * i);
        if (v14)
        {
          id v15 = [*(id *)(*((void *)&v71 + 1) + 8 * i) userId];
          BOOL v16 = [v15 length] == 0;

          if (v16) {
            NSUInteger v17 = v62;
          }
          else {
            NSUInteger v17 = v61;
          }
          [(EARHelpers *)v17 addObject:v14];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v71 objects:v77 count:16];
    }
    while (v11);
  }

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v20 = v56;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v68 != v22) {
          objc_enumerationMutation(v20);
        }
        id v24 = *(void **)(*((void *)&v67 + 1) + 8 * j);
        if ([v24 length])
        {
          [v19 addObject:v24];
          [v18 addObject:v24];
        }
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v21);
  }

  long long v25 = [v18 allObjects];
  v59 = EARHelpers::shuffledArray(v25, v26);

  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  for (unint64_t k = 0; [v59 count] > k; ++k)
  {
    id v29 = [v59 objectAtIndexedSubscript:k];
    id v30 = [NSNumber numberWithInt:k];
    uint64_t v31 = [v30 stringValue];

    [v27 setObject:v31 forKeyedSubscript:v29];
    [v58 setObject:v29 forKeyedSubscript:v31];
  }
  uint64_t v32 = [v27 copy];
  uint64_t v33 = v57->_muxIdMask;
  v57->_muxIdMasunint64_t k = (NSDictionary *)v32;

  uint64_t v34 = [v58 copy];
  v35 = v57->_muxIdReverseMask;
  v57->_muxIdReverseMasunint64_t k = (NSDictionary *)v34;

  uint64_t v36 = [(NSDictionary *)v57->_muxIdMask count];
  if (v36 != [(NSDictionary *)v57->_muxIdReverseMask count])
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2 object:v57 file:@"EARSpeechRecognizer.mm" lineNumber:4754 description:@"Size mismatch"];
  }
  v55 = EARHelpers::shuffledArray(v61, v37);
  uint64_t v38 = [v55 arrayByAddingObjectsFromArray:v62];
  v39 = v57->_userProfiles;
  v57->_userProfiles = (NSArray *)v38;

  uint64_t v40 = [(NSArray *)v57->_userProfiles count];
  uint64_t v41 = [(EARHelpers *)v61 count];
  if (v40 != [(EARHelpers *)v62 count] + v41)
  {
    uint64_t v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2 object:v57 file:@"EARSpeechRecognizer.mm" lineNumber:4760 description:@"Size mismatch"];
  }
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v43 = v19;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v64;
    do
    {
      for (uint64_t m = 0; m != v44; ++m)
      {
        if (*(void *)v64 != v45) {
          objc_enumerationMutation(v43);
        }
        v47 = [v27 objectForKeyedSubscript:*(void *)(*((void *)&v63 + 1) + 8 * m)];
        [v42 addObject:v47];
      }
      uint64_t v44 = [v43 countByEnumeratingWithState:&v63 objects:v75 count:16];
    }
    while (v44);
  }

  uint64_t v48 = [v42 copy];
  v49 = v57->_muxIds;
  v57->_muxIds = (NSSet *)v48;

  uint64_t v50 = [(NSSet *)v57->_muxIds count];
  if (v50 != [v43 count])
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2 object:v57 file:@"EARSpeechRecognizer.mm" lineNumber:4768 description:@"Size mismatch"];
  }
  [(_EARSpeechRecognizer *)v57 _restartActiveRecognition];
}

- (void)setUserProfile:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v6 = 0;
  }
  [(_EARSpeechRecognizer *)self _setProfileContainers:v6 muxIds:0];
  if (v5) {
}
  }

- (id)_unmaskMuxPackages:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v6, "objectForKeyedSubscript:", v10, (void)v15);
        uint64_t v12 = [(NSDictionary *)self->_muxIdReverseMask objectForKeyedSubscript:v10];
        [v5 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v13 = (void *)[v5 copy];
  return v13;
}

- (id)runRecognitionWithResultStream:(id)a3
{
  uint64_t v3 = [(_EARSpeechRecognizer *)self runRecognitionWithResultStream:a3 language:@"en_US" task:@"Dictation" samplingRate:16000];
  return v3;
}

- (void)updateUserProfileData:(id)a3
{
  id v4 = (EARHelpers *)a3;
  quasar::LmeDataStreams::LmeDataStreams((quasar::LmeDataStreams *)&v13);
  if (v4) {
    EARHelpers::createNSDataInputStream(v4, v5);
  }
  addAotLmeStreams(&v13, self->_userProfiles, self->_muxIdMask);
  jitProfileData = (EARHelpers *)self->_jitProfileData;
  if (jitProfileData) {
    EARHelpers::createNSDataInputStream(jitProfileData, v6);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  v8[2] = __46___EARSpeechRecognizer_updateUserProfileData___block_invoke;
  v8[3] = &unk_1F0A63DC0;
  v8[4] = self;
  long long v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  std::vector<quasar::LmeDataFactoryBase::LmeType>::__init_with_size[abi:ne180100]<quasar::LmeDataFactoryBase::LmeType*,quasar::LmeDataFactoryBase::LmeType*>(&v9, v13, (uint64_t)v14, (v14 - (unsigned char *)v13) >> 2);
  std::map<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>::map[abi:ne180100](v12, (uint64_t)v15);
  ConvertCXXExceptionToNSException(v8);
  std::__tree<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::__map_value_compare<quasar::LmeDataFactoryBase::LmeType,std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::less<quasar::LmeDataFactoryBase::LmeType>,true>,std::allocator<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>>>::destroy((uint64_t)v12, (char *)v12[1]);
  if (v9)
  {
    uint64_t v10 = v9;
    operator delete(v9);
  }
  std::__tree<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::__map_value_compare<quasar::LmeDataFactoryBase::LmeType,std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::less<quasar::LmeDataFactoryBase::LmeType>,true>,std::allocator<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>>>::destroy((uint64_t)v15, v15[1]);
  if (v13)
  {
    uint64_t v14 = v13;
    operator delete(v13);
  }
}

- (void)updateJitProfileData:(id)a3
{
  id v4 = (EARHelpers *)a3;
  quasar::LmeDataStreams::LmeDataStreams((quasar::LmeDataStreams *)&v13);
  userProfileData = (EARHelpers *)self->_userProfileData;
  if (userProfileData) {
    EARHelpers::createNSDataInputStream(userProfileData, v5);
  }
  addAotLmeStreams(&v13, self->_userProfiles, self->_muxIdMask);
  if (v4) {
    EARHelpers::createNSDataInputStream(v4, v7);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  v8[2] = __45___EARSpeechRecognizer_updateJitProfileData___block_invoke;
  v8[3] = &unk_1F0A63DC0;
  v8[4] = self;
  long long v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  std::vector<quasar::LmeDataFactoryBase::LmeType>::__init_with_size[abi:ne180100]<quasar::LmeDataFactoryBase::LmeType*,quasar::LmeDataFactoryBase::LmeType*>(&v9, v13, (uint64_t)v14, (v14 - (unsigned char *)v13) >> 2);
  std::map<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>::map[abi:ne180100](v12, (uint64_t)v15);
  ConvertCXXExceptionToNSException(v8);
  std::__tree<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::__map_value_compare<quasar::LmeDataFactoryBase::LmeType,std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::less<quasar::LmeDataFactoryBase::LmeType>,true>,std::allocator<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>>>::destroy((uint64_t)v12, (char *)v12[1]);
  if (v9)
  {
    uint64_t v10 = v9;
    operator delete(v9);
  }
  std::__tree<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::__map_value_compare<quasar::LmeDataFactoryBase::LmeType,std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::less<quasar::LmeDataFactoryBase::LmeType>,true>,std::allocator<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>>>::destroy((uint64_t)v15, v15[1]);
  if (v13)
  {
    uint64_t v14 = v13;
    operator delete(v13);
  }
}

- (id)runRecognitionWithResultStream:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6
{
  id v6 = [(_EARSpeechRecognizer *)self runRecognitionWithResultStream:a3 language:a4 task:a5 samplingRate:a6 userProfileData:self->_userProfileData speakerCodeWriter:0];
  return v6;
}

- (id)runRecognitionWithResultStream:(id)a3 speakerCodeWriter:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7
{
  uint64_t v7 = [(_EARSpeechRecognizer *)self runRecognitionWithResultStream:a3 language:a5 task:a6 samplingRate:a7 userProfileData:self->_userProfileData speakerCodeWriter:a4];
  return v7;
}

- (id)runRecognitionWithResultStream:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6 userProfileData:(id)a7 speakerCodeWriter:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentAudioBuffer);
  [WeakRetained _detachFromRecognizer];

  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__2;
  uint64_t v40 = __Block_byref_object_dispose__2;
  id v41 = 0;
  uint64_t v20 = [v15 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __116___EARSpeechRecognizer_runRecognitionWithResultStream_language_task_samplingRate_userProfileData_speakerCodeWriter___block_invoke;
  v28[3] = &unk_1E5FFE440;
  v28[4] = self;
  id v21 = v20;
  id v29 = v21;
  id v22 = v14;
  id v30 = v22;
  id v23 = v16;
  id v31 = v23;
  id v24 = v18;
  id v32 = v24;
  unint64_t v35 = a6;
  id v25 = v17;
  id v33 = v25;
  uint64_t v34 = &v36;
  ConvertCXXExceptionToNSException(v28);
  id v26 = (id)v37[5];

  _Block_object_dispose(&v36, 8);
  return v26;
}

- (BOOL)canCloneIsFinalAsLastNonFinal
{
  if (self->_detectUtterances) {
    return self->_concatenateUtterances;
  }
  return !self->_concatenateUtterances && self->_recognizeEagerCandidates;
}

- (void)writeRecordedStateAccesses
{
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  quasar::SpeechRecognizer::writeRecordedStateAccesses((uint64_t)self->_recognizer.__ptr_, (uint64_t)__p);
  if (v4 < 0) {
    operator delete(__p[0]);
  }
}

- (shared_ptr<quasar::RecogAudioBufferBase>)_audioBufferWithLangauge:(id)a3 task:(id)a4 samplingRate:(unint64_t)a5 userProfileData:(id)a6 resultStream:(shared_ptr<quasar::RecogResultStreamBase>)a7
{
  v46[16] = *(void ***)MEMORY[0x1E4F143B8];
  a3;
  a4;
  id v33 = (EARHelpers *)a6;
  uint64_t v10 = [_EARRecognitionMetrics alloc];
  cntrl = self->_recognizer.__cntrl_;
  ptr = self->_recognizer.__ptr_;
  uint64_t v38 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = [(_EARRecognitionMetrics *)v10 initWithRecognizer:&ptr];
  recognitionMetrics = self->_recognitionMetrics;
  self->_recognitionMetrics = v12;

  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v38);
  }
  quasar::LmeDataStreams::LmeDataStreams((quasar::LmeDataStreams *)&v36);
  if (v33) {
    EARHelpers::createNSDataInputStream(v33, v14);
  }
  addAotLmeStreams(&v36, self->_userProfiles, self->_muxIdMask);
  jitProfileData = (EARHelpers *)self->_jitProfileData;
  if (jitProfileData) {
    EARHelpers::createNSDataInputStream(jitProfileData, v15);
  }
  if (self->_enableVoiceCommands)
  {
    memset(&v35, 0, sizeof(v35));
    id v17 = self->_onScreenContextForEditLme;
    memset(&v34, 0, sizeof(v34));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v18 = v17;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(v18);
          }
          id v22 = *(id *)(*((void *)&v41 + 1) + 8 * i);
          id v23 = v22;
          if (v22)
          {
            objc_msgSend(v22, "ear_toString");
          }
          else
          {
            long long __p = 0uLL;
            std::string::size_type v40 = 0;
          }

          std::vector<std::string>::pointer end = v34.__end_;
          if (v34.__end_ >= v34.__end_cap_.__value_)
          {
            unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)v34.__end_ - (char *)v34.__begin_) >> 3);
            unint64_t v27 = v26 + 1;
            if (v26 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<int>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3) > v27) {
              unint64_t v27 = 0x5555555555555556 * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3) >= 0x555555555555555) {
              unint64_t v28 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v28 = v27;
            }
            __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v34.__end_cap_;
            if (v28) {
              id v29 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v34.__end_cap_, v28);
            }
            else {
              id v29 = 0;
            }
            id v30 = v29 + v26;
            __v.__first_ = v29;
            __v.__begin_ = v30;
            __v.__end_cap_.__value_ = &v29[v28];
            long long v31 = __p;
            v30->__r_.__value_.__r.__words[2] = v40;
            *(_OWORD *)&v30->__r_.__value_.__l.__data_ = v31;
            std::string::size_type v40 = 0;
            long long __p = 0uLL;
            __v.__end_ = v30 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v34, &__v);
            id v32 = v34.__end_;
            std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
            v34.__end_ = v32;
            if (SHIBYTE(v40) < 0) {
              operator delete((void *)__p);
            }
          }
          else
          {
            long long v25 = __p;
            v34.__end_->__r_.__value_.__r.__words[2] = v40;
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v25;
            v34.__end_ = end + 1;
          }
        }
        uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v19);
    }

    std::vector<std::string>::__vdeallocate(&v35);
    std::vector<std::wstring> v35 = (std::vector<std::wstring>)v34;
    memset(&v34, 0, sizeof(v34));
    v46[0] = (void **)&v34;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v46);
    quasar::SpeechRecognizer::buildEditLmeWithLeftContext((quasar::SpeechRecognizer *)self->_recognizer.__ptr_, &v36, (long long **)&v35);
    v46[0] = (void **)&v35;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v46);
  }
  operator new();
}

- (void)_restartActiveRecognition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentAudioBuffer);
  if (WeakRetained)
  {
    cntrl = (std::__shared_weak_count *)self->_currentResultStreamWrapper.__cntrl_;
    if (cntrl)
    {
      cntrl = std::__shared_weak_count::lock(cntrl);
      id v5 = cntrl;
      if (cntrl && self->_currentResultStreamWrapper.__ptr_)
      {
        currentLanguage = self->_currentLanguage;
        currentTasunint64_t k = self->_currentTask;
        unint64_t currentSamplingRate = self->_currentSamplingRate;
        userProfileData = self->_userProfileData;
        ptr = self->_currentResultStreamWrapper.__ptr_;
        id v15 = cntrl;
        atomic_fetch_add_explicit(&cntrl->__shared_owners_, 1uLL, memory_order_relaxed);
        [(_EARSpeechRecognizer *)self _audioBufferWithLangauge:currentLanguage task:currentTask samplingRate:currentSamplingRate userProfileData:userProfileData resultStream:&ptr];
        if (v15) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v15);
        }
        uint64_t v12 = *(void *)buf;
        uint64_t v13 = v17;
        if (v17) {
          atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        [WeakRetained _setUnderlyingBuffer:&v12];
        if (v13) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v13);
        }
        if (v17) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v17);
        }
LABEL_20:
        std::__shared_weak_count::__release_shared[abi:ne180100](v5);
        goto LABEL_21;
      }
    }
    else
    {
      id v5 = 0;
    }
    uint64_t v11 = EARLogger::QuasarOSLogger((EARLogger *)cntrl);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B1A86000, v11, OS_LOG_TYPE_INFO, "Result stream wrapper has been deallocated; not restarting recognition",
        buf,
        2u);
    }

    if (v5) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v10 = EARLogger::QuasarOSLogger(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B1A86000, v10, OS_LOG_TYPE_INFO, "Audio buffer has been deallocated; not restarting recognition",
        buf,
        2u);
    }
  }
LABEL_21:
}

- (id)recognitionResultsWithAudioData:(id)a3 userProfileData:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = objc_alloc_init(_EARSyncResultStreamHelper);
  id v17 = [(_EARSpeechRecognizer *)self runRecognitionWithResultStream:v16 language:v14 task:v15 samplingRate:a7 userProfileData:v13 speakerCodeWriter:0];
  [v17 addAudioSampleData:v12];
  [v17 endAudio];
  [(_EARSyncResultStreamHelper *)v16 waitForCompletion];
  (*(void (**)(SpeechRecognizer *))(*(void *)self->_recognizer.__ptr_ + 32))(self->_recognizer.__ptr_);
  id v18 = [(_EARSyncResultStreamHelper *)v16 error];
  if (v18)
  {
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = [(_EARSyncResultStreamHelper *)v16 results];
  }

  return v19;
}

- (id)recognitionResultsWithAudioData:(id)a3 userProfileData:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 extraLanguageModel:(id)a8
{
  uint64_t v8 = -[_EARSpeechRecognizer recognitionResultsWithAudioData:userProfileData:language:task:samplingRate:](self, "recognitionResultsWithAudioData:userProfileData:language:task:samplingRate:", a3, a4, a5, a6, a7, a8);
  return v8;
}

- (id)testFormattingWithOneBestResults:(id)a3 uttMillis:(id)a4
{
  *(void *)&long long v74 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v46 = a4;
  uint64_t v8 = [v7 count];
  if (v8 != [v46 count])
  {
    long long v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"EARSpeechRecognizer.mm" lineNumber:5228 description:@"Array sizes are not the same"];
  }
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  quasar::RecogResult::RecogResult((quasar::RecogResult *)v69);
  long long v9 = [[_EARSyncResultStreamHelper alloc] initWithTagResults:1];
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x4012000000;
  v67[3] = __Block_byref_object_copy__593;
  v67[4] = __Block_byref_object_dispose__594;
  v67[5] = &unk_1B27252DB;
  v67[6] = 0;
  long long v68 = 0;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __67___EARSpeechRecognizer_testFormattingWithOneBestResults_uttMillis___block_invoke;
  v64[3] = &unk_1E5FFE468;
  long long v66 = v67;
  v64[4] = self;
  long long v43 = v9;
  long long v65 = v43;
  ConvertCXXExceptionToNSException(v64);
  unint64_t v10 = 0;
LABEL_4:
  if ([v7 count] > v10)
  {
    unint64_t v11 = 1;
    while (1)
    {
      id v12 = [v7 objectAtIndex:v10];
      BOOL v13 = [v12 count] < v11;

      if (v13)
      {
        ++v10;
        goto LABEL_4;
      }
      std::vector<double>::vector(v63, 1uLL);
      memset(v62, 0, sizeof(v62));
      id v14 = [v7 objectAtIndex:v10];
      id v15 = objc_msgSend(v14, "subarrayWithRange:", 0, v11);
      EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(v15, (uint64_t *)buf);
      std::vector<std::vector<quasar::Token>>::push_back[abi:ne180100](v62, (uint64_t)buf);
      v57 = (std::string *)buf;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v57);

      *(void *)buf = 0;
      std::allocate_shared[abi:ne180100]<quasar::RunAsyncParams,std::allocator<quasar::RunAsyncParams>,decltype(nullptr),void>(&v60);
      uint64_t v16 = quasar::RecogResult::setParams((uint64_t)v69, &v60);
      uint64_t v17 = quasar::RecogResult::setResultChoices(v16, (uint64_t)v62);
      uint64_t v18 = quasar::RecogResult::setResultCosts(v17, (uint64_t)v63);
      uint64_t v19 = [v7 count] - 1;
      if (v19 == v10)
      {
        char v4 = [v7 objectAtIndex:v10];
        char v20 = v11 == [v4 count];
      }
      else
      {
        char v20 = 0;
      }
      uint64_t IsFinal = quasar::RecogResult::setIsFinal(v18, v20);
      id v22 = [v46 objectAtIndexedSubscript:v10];
      id v23 = [v22 objectAtIndexedSubscript:0];
      uint64_t started = quasar::RecogResult::setUtteranceStartMillis(IsFinal, 1000 * [v23 intValue]);
      long long v25 = [v46 objectAtIndexedSubscript:v10];
      unint64_t v26 = [v25 objectAtIndexedSubscript:1];
      quasar::RecogResult::setUtteranceDurationMillis(started, 1000 * [v26 intValue]);

      if (v19 == v10) {
      if (v61)
      }
        std::__shared_weak_count::__release_shared[abi:ne180100](v61);
      cntrl = (std::__shared_weak_count *)self->_currentResultStreamWrapper.__cntrl_;
      if (!cntrl) {
        break;
      }
      cntrl = std::__shared_weak_count::lock(cntrl);
      unint64_t v28 = cntrl;
      if (!cntrl) {
        goto LABEL_20;
      }
      ptr = self->_currentResultStreamWrapper.__ptr_;
      if (!ptr) {
        goto LABEL_20;
      }
      id v30 = [v7 objectAtIndex:v10];
      BOOL v31 = v11 == [v30 count];

      if (v31)
      {
        char v32 = 1;
        (*(void (**)(ResultStreamWrapper *, unsigned char *, uint64_t))(*(void *)ptr + 40))(ptr, v69, 1);
      }
      else
      {
        long long v72 = 0uLL;
        uint64_t v73 = 0;
        id v58 = 0;
        p_data = 0;
        v57 = 0;
        *(void *)buf = &v57;
        LOBYTE(__p) = 0;
        v57 = (std::string *)operator new(0x18uLL);
        id v58 = v57;
        p_data = (void **)&v57[1].__r_.__value_.__l.__data_;
        id v58 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&p_data, &v72, &v74, v57);
        uint64_t v34 = v70;
        memset(v56, 0, sizeof(v56));
        memset(v55, 0, sizeof(v55));
        buf[0] = 0;
        std::string::basic_string[abi:ne180100]<0>(&__p, "▁");
        LOWORD(v42) = 0;
        (*(void (**)(ResultStreamWrapper *, std::string **, uint64_t, uint64_t, void, void, uint64_t *, void *, void *, int, uint8_t *))(*(void *)ptr + 24))(ptr, &v57, v34, 1, 0, 0, v62, v56, v55, v42, buf);
        if (v54 < 0) {
          operator delete(__p);
        }
        *(void *)buf = v55;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        *(void *)buf = v56;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        *(void *)buf = &v57;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        if (SHIBYTE(v73) < 0) {
          operator delete((void *)v72);
        }
        char v32 = 1;
      }
LABEL_29:
      std::__shared_weak_count::__release_shared[abi:ne180100](v28);
LABEL_30:
      *(void *)buf = v62;
      std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      if (v63[0])
      {
        v63[1] = v63[0];
        operator delete(v63[0]);
      }
      ++v11;
      if ((v32 & 1) == 0) {
        goto LABEL_43;
      }
    }
    unint64_t v28 = 0;
LABEL_20:
    id v33 = EARLogger::QuasarOSLogger((EARLogger *)cntrl);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B1A86000, v33, OS_LOG_TYPE_INFO, "Result stream wrapper has been deallocated", buf, 2u);
    }

    id v44 = v47;
    char v32 = 0;
    if (!v28) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  [(_EARSyncResultStreamHelper *)v43 waitForCompletion];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  std::vector<std::wstring> v35 = [(_EARSyncResultStreamHelper *)v43 taggedResults];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v48 objects:v71 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v49 != v37) {
          objc_enumerationMutation(v35);
        }
        v39 = [*(id *)(*((void *)&v48 + 1) + 8 * i) tokens];
        [v47 addObject:v39];
      }
      uint64_t v36 = [v35 countByEnumeratingWithState:&v48 objects:v71 count:16];
    }
    while (v36);
  }

  id v44 = v47;
LABEL_43:

  _Block_object_dispose(v67, 8);
  if (v68) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v68);
  }

  quasar::RecogResult::~RecogResult((quasar::RecogResult *)v69);
  return v44;
}

- (BOOL)isContinuousListening
{
  return quasar::isContinuousListening((quasar *)self->_detectUtterances, self->_concatenateUtterances, self->_allowUtteranceDelay, self->_formatAcrossUtterances);
}

- (BOOL)isLegacyVoiceCommandRequest
{
  BOOL result = self->_shouldGenerateVoiceCommandCandidates;
  if (self->_enableVoiceCommands) {
    return self->_voiceCommandCompilation.__ptr_ != 0;
  }
  return result;
}

- (unsigned)itnEnablingFlags
{
  if (self->_disableAutoPunctuation) {
    return -2;
  }
  else {
    return -1;
  }
}

+ (id)rawTokenResultsFromRecognitionResults:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v15;
  uint64_t v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16, v15);
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v9 = [v7 tokens];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v9);
              }
              BOOL v13 = [*(id *)(*((void *)&v17 + 1) + 8 * j) tokenName];
              [v8 addObject:v13];
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v10);
        }

        [v3 addObject:v8];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }

  return v3;
}

+ (void)compileRecognizerModelsWithConfiguration:(id)a3
{
}

+ (BOOL)compileRecognizerModels2WithConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  uint64_t v47 = 0;
  long long v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 1;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v32];

  if (v5)
  {
    id v7 = v32;
    std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v7 fileSystemRepresentation]);
    std::string::basic_string[abi:ne180100]<0>(__p, ".mlmodelc");
    getModelFilesWithSuffix((uint64_t)buf, (uint64_t)__p, &v45);
    if (v44 < 0) {
      operator delete(__p[0]);
    }
    if (v52 < 0) {
      operator delete(*(void **)buf);
    }
    id v8 = v45;
    for (uint64_t i = v46; v8 != i; v8 += 3)
    {
      uint64_t v10 = EARHelpers::getAbsolutePath(v8);
      LOBYTE(__p[0]) = 0;
      id v42 = 0;
      [MEMORY[0x1E4F1E980] needsANECompilationForModelAtURL:v10 result:__p error:&v42];
      uint64_t v11 = (EARLogger *)v42;
      if (v11)
      {
        id v12 = v11;
        BOOL v13 = EARLogger::QuasarOSLogger(v11);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v12;
          id v14 = v13;
          id v15 = "Error determining compilation status: %@\n";
LABEL_10:
          _os_log_impl(&dword_1B1A86000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
        }
      }
      else
      {
        if (!LOBYTE(__p[0]))
        {
          BOOL v13 = EARLogger::QuasarOSLogger(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v10;
            long long v19 = v13;
            long long v20 = "Skipping model that's already compiled: %@";
            uint32_t v21 = 12;
            goto LABEL_21;
          }
LABEL_22:
          id v12 = 0;
          goto LABEL_23;
        }
        uint64_t v16 = EARLogger::QuasarOSLogger(0);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v10;
          _os_log_impl(&dword_1B1A86000, v16, OS_LOG_TYPE_INFO, "Attempting to compile ANE model: %@", buf, 0xCu);
        }

        id v41 = 0;
        id v17 = (id)[MEMORY[0x1E4F1E970] modelWithContentsOfURL:v10 error:&v41];
        long long v18 = (EARLogger *)v41;
        if (!v18)
        {
          BOOL v13 = EARLogger::QuasarOSLogger(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            long long v19 = v13;
            long long v20 = "Compilation completed.";
            uint32_t v21 = 2;
LABEL_21:
            _os_log_impl(&dword_1B1A86000, v19, OS_LOG_TYPE_INFO, v20, buf, v21);
          }
          goto LABEL_22;
        }
        id v12 = v18;
        BOOL v13 = EARLogger::QuasarOSLogger(v18);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v12;
          id v14 = v13;
          id v15 = "Found an error: %@\n";
          goto LABEL_10;
        }
      }
LABEL_23:
    }
    quasar::ModelLoader::ModelLoader((quasar::ModelLoader *)buf);
    std::string::basic_string[abi:ne180100]<0>(v39, (char *)[v7 fileSystemRepresentation]);
    std::string::basic_string[abi:ne180100]<0>(v37, ".espresso.net");
    getModelFilesWithSuffix((uint64_t)v39, (uint64_t)v37, __p);
    if (v38 < 0) {
      operator delete(v37[0]);
    }
    if (v40 < 0) {
      operator delete(v39[0]);
    }
    long long v23 = (char *)__p[0];
    long long v22 = (char *)__p[1];
    while (v23 != v22)
    {
      quasar::ModelLoader::compileModel((uint64_t)buf, (uint64_t)v23);
      v23 += 24;
    }
    v39[0] = __p;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v39);
    quasar::ModelLoader::~ModelLoader((quasar::ModelLoader *)buf);
    *(void *)buf = &v45;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    id v29 = EARLogger::QuasarOSLogger(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v32;
      _os_log_impl(&dword_1B1A86000, v29, OS_LOG_TYPE_INFO, "Attempting to compile e5ml models, path: %@", buf, 0xCu);
    }

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __72___EARSpeechRecognizer_compileRecognizerModels2WithConfiguration_error___block_invoke;
    v33[3] = &unk_1E5FFE490;
    id v34 = v32;
    std::vector<std::wstring> v35 = &v47;
    uint64_t v36 = a4;
    +[_EARe5mlCompiler compileWithModelConfig:v34 completion:v33];

    BOOL v27 = *((unsigned char *)v48 + 24) != 0;
  }
  else
  {
    long long v24 = EARLogger::QuasarOSLogger(v6);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B1A86000, v24, OS_LOG_TYPE_DEFAULT, "Error file sent for compilation does not exist. Not compiling.", buf, 2u);
    }

    long long v25 = EARErrorWithCode(100, @"Error file sent for compilation does not exist. Not compiling.");
    unint64_t v26 = v25;
    if (a4 && v25) {
      *a4 = v25;
    }

    BOOL v27 = 0;
  }
  _Block_object_dispose(&v47, 8);

  return v27;
}

+ (void)purgeCompiledRecognizerModelsWithConfiguration:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:v21];

  if (v4)
  {
    id v20 = v21;
    std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v20 fileSystemRepresentation]);
    std::string::basic_string[abi:ne180100]<0>(__p, ".mlmodelc");
    getModelFilesWithSuffix((uint64_t)buf, (uint64_t)__p, &v29);
    if (v28 < 0) {
      operator delete(__p[0]);
    }
    if (v32 < 0) {
      operator delete(*(void **)buf);
    }
    id v7 = v29;
    for (uint64_t i = v30; v7 != i; v7 += 3)
    {
      EARHelpers::getAbsolutePath(v7);
      id v8 = (EARLogger *)objc_claimAutoreleasedReturnValue();
      long long v9 = EARLogger::QuasarOSLogger(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v8;
        _os_log_impl(&dword_1B1A86000, v9, OS_LOG_TYPE_INFO, "Attempting to purge ANE model: %@", buf, 0xCu);
      }

      id v26 = 0;
      [MEMORY[0x1E4F1E980] purgeANEIRForModelAtURL:v8 error:&v26];
      uint64_t v10 = (EARLogger *)v26;
      uint64_t v11 = v10;
      if (v10)
      {
        id v12 = EARLogger::QuasarOSLogger(v10);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v11;
          BOOL v13 = v12;
          os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
          id v15 = "Found an error: %@\n";
          uint32_t v16 = 12;
LABEL_14:
          _os_log_impl(&dword_1B1A86000, v13, v14, v15, buf, v16);
        }
      }
      else
      {
        id v12 = EARLogger::QuasarOSLogger(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          BOOL v13 = v12;
          os_log_type_t v14 = OS_LOG_TYPE_INFO;
          id v15 = "Purge completed.";
          uint32_t v16 = 2;
          goto LABEL_14;
        }
      }
    }
    quasar::ModelLoader::ModelLoader((quasar::ModelLoader *)buf);
    std::string::basic_string[abi:ne180100]<0>(v24, (char *)[v20 fileSystemRepresentation]);
    std::string::basic_string[abi:ne180100]<0>(v22, ".espresso.net");
    getModelFilesWithSuffix((uint64_t)v24, (uint64_t)v22, __p);
    if (v23 < 0) {
      operator delete(v22[0]);
    }
    if (v25 < 0) {
      operator delete(v24[0]);
    }
    long long v18 = (char *)__p[0];
    id v17 = (char *)__p[1];
    while (v18 != v17)
    {
      quasar::ModelLoader::purgeModel((uint64_t)buf, (uint64_t)v18);
      v18 += 24;
    }
    v24[0] = __p;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v24);
    quasar::ModelLoader::~ModelLoader((quasar::ModelLoader *)buf);
    *(void *)buf = &v29;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  else
  {
    long long v19 = EARLogger::QuasarOSLogger(v5);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B1A86000, v19, OS_LOG_TYPE_DEFAULT, "Error file sent for purge does not exist. Not purging.", buf, 2u);
    }
  }
}

- (void)cancelRecognition
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41___EARSpeechRecognizer_cancelRecognition__block_invoke;
  v2[3] = &unk_1E5FFE4B8;
  v2[4] = self;
  ConvertCXXExceptionToNSException(v2);
}

- (void)_waitForAsyncRecogToFinish
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50___EARSpeechRecognizer__waitForAsyncRecogToFinish__block_invoke;
  v2[3] = &unk_1E5FFE4B8;
  v2[4] = self;
  ConvertCXXExceptionToNSException(v2);
}

- (void)interruptTraining
{
  id v3 = EARLogger::QuasarOSLogger((EARLogger *)self);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B1A86000, v3, OS_LOG_TYPE_INFO, "Got interrupt signal, going to interrupt training if training is enabled and still running.", buf, 2u);
  }

  if (self->_training.__ptr_)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __41___EARSpeechRecognizer_interruptTraining__block_invoke;
    v4[3] = &unk_1E5FFE4B8;
    v4[4] = self;
    ConvertCXXExceptionToNSException(v4);
  }
}

- (id)recognitionStatistics
{
  v18[0] = 0;
  v18[1] = 0;
  v16[1] = 0;
  id v17 = v18;
  id v15 = v16;
  v16[0] = 0;
  uint64_t v13 = 0;
  os_log_type_t v14 = 0;
  uint64_t v11 = 0;
  id v12 = 0;
  (*(void (**)(SpeechRecognizer *, char ***, void ***, uint64_t *, uint64_t *))(*(void *)self->_recognizer.__ptr_
                                                                                         + 48))(self->_recognizer.__ptr_, &v17, &v15, &v13, &v11);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = v17;
  if (v17 != v18)
  {
    do
    {
      char v4 = [NSNumber numberWithDouble:*((double *)v3 + 7)];
      char v5 = v3 + 4;
      if (*((char *)v3 + 55) < 0) {
        char v5 = (void *)*v5;
      }
      id v6 = [NSString stringWithUTF8String:v5];
      [v2 setObject:v4 forKeyedSubscript:v6];

      id v7 = v3[1];
      if (v7)
      {
        do
        {
          id v8 = (char **)v7;
          id v7 = *(char **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          id v8 = (char **)v3[2];
          BOOL v9 = *v8 == (char *)v3;
          id v3 = v8;
        }
        while (!v9);
      }
      id v3 = v8;
    }
    while (v8 != v18);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v15, v16[0]);
  std::__tree<std::string>::destroy((uint64_t)&v17, v18[0]);
  return v2;
}

- (id)recognitionUtterenceStatistics
{
  v19[0] = 0;
  v19[1] = 0;
  v17[1] = 0;
  long long v18 = v19;
  uint32_t v16 = v17;
  v17[0] = 0;
  uint64_t v14 = 0;
  id v15 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  (*(void (**)(SpeechRecognizer *, char ***, void ***, uint64_t *, uint64_t *))(*(void *)self->_recognizer.__ptr_
                                                                                         + 48))(self->_recognizer.__ptr_, &v18, &v16, &v14, &v12);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = v16;
  if (v16 != v17)
  {
    do
    {
      char v4 = v3 + 7;
      if (*((char *)v3 + 79) < 0) {
        char v4 = (void *)*v4;
      }
      char v5 = [NSString stringWithUTF8String:v4];
      id v6 = v3 + 4;
      if (*((char *)v3 + 55) < 0) {
        id v6 = (void *)*v6;
      }
      id v7 = [NSString stringWithUTF8String:v6];
      [v2 setObject:v5 forKeyedSubscript:v7];

      id v8 = v3[1];
      if (v8)
      {
        do
        {
          BOOL v9 = (void **)v8;
          id v8 = (void *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          BOOL v9 = (void **)v3[2];
          BOOL v10 = *v9 == v3;
          id v3 = v9;
        }
        while (!v10);
      }
      id v3 = v9;
    }
    while (v9 != v17);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v16, v17[0]);
  std::__tree<std::string>::destroy((uint64_t)&v18, v19[0]);
  return v2;
}

- (id)recognitionUtteranceInfos
{
  quasar::SpeechRecognizer::getUttInfos((quasar::SpeechRecognizer *)self->_recognizer.__ptr_, v5);
  if (v5[0] == v5[1])
  {
    id v2 = 0;
  }
  else
  {
    quasar::UttInfo::ptreeBatch(v5, (quasar::PTree *)v4);
    id v2 = EARHelpers::arrayFromPTree((EARHelpers *)v4, (const quasar::PTree *)1);
    quasar::PTree::~PTree((quasar::PTree *)v4);
  }
  v4[0] = (void **)v5;
  std::vector<std::shared_ptr<quasar::LmeContainer>>::__destroy_vector::operator()[abi:ne180100](v4);
  return v2;
}

- (void)getFormatterWithBlock:(id)a3
{
  id v4 = a3;
  formatterQueue = self->_formatterQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __46___EARSpeechRecognizer_getFormatterWithBlock___block_invoke;
  v7[3] = &unk_1E5FFE4E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(formatterQueue, v7);
}

- (void)_waitForInitialization
{
}

- (void)dumpModelVirtualMemoryInfo
{
}

- (void)setActiveConfiguration:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47___EARSpeechRecognizer_setActiveConfiguration___block_invoke;
  v6[3] = &unk_1E5FFE528;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  ConvertCXXExceptionToNSException(v6);
}

- (BOOL)isSpeakerCodeTrainingSupported:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  ptr = self->_training.__ptr_;
  if (ptr)
  {
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v9 = 0;
    }
    LOBYTE(ptr) = quasar::SpeakerCodeTraining::isTaskSupported((const std::string *)ptr, (unsigned __int8 *)__p);
    if (SHIBYTE(v9) < 0) {
      operator delete(__p[0]);
    }
  }

  return (char)ptr;
}

- (id)activeConfiguration
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__2;
  uint64_t v9 = __Block_byref_object_dispose__2;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43___EARSpeechRecognizer_activeConfiguration__block_invoke;
  v4[3] = &unk_1E5FFE550;
  v4[4] = self;
  void v4[5] = &v5;
  ConvertCXXExceptionToNSException(v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)setAlternateRawRecognitionTokenSausage:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  memset(v28, 0, sizeof(v28));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = a3;
  uint64_t v19 = [obj countByEnumeratingWithState:&v30 objects:v56 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(id *)(*((void *)&v30 + 1) + 8 * i);
        memset(v29, 0, sizeof(v29));
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v23 = v3;
        uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v57 count:16];
        if (v25)
        {
          uint64_t v24 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v38 != v24) {
                objc_enumerationMutation(v23);
              }
              id v4 = *(id *)(*((void *)&v37 + 1) + 8 * j);
              unint64_t v35 = 0;
              unint64_t v36 = 0;
              uint64_t v34 = 0;
              long long v51 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              id v27 = v4;
              uint64_t v5 = [v27 countByEnumeratingWithState:&v51 objects:v58 count:16];
              if (v5)
              {
                uint64_t v6 = *(void *)v52;
                do
                {
                  for (uint64_t k = 0; k != v5; ++k)
                  {
                    if (*(void *)v52 != v6) {
                      objc_enumerationMutation(v27);
                    }
                    id v8 = *(id *)(*((void *)&v51 + 1) + 8 * k);
                    uint64_t v9 = v8;
                    if (v8)
                    {
                      [v8 quasarToken];
                    }
                    else
                    {
                      memset(v50, 0, sizeof(v50));
                      long long v48 = 0u;
                      *(_OWORD *)long long __p = 0u;
                      *(_OWORD *)uint64_t v47 = 0u;
                      *(_OWORD *)uint64_t v45 = 0u;
                      memset(v46, 0, sizeof(v46));
                      memset(v44, 0, sizeof(v44));
                      *(_OWORD *)long long v43 = 0u;
                      *(_OWORD *)id v41 = 0u;
                      memset(v42, 0, sizeof(v42));
                    }

                    unint64_t v10 = v35;
                    if (v35 >= v36)
                    {
                      unint64_t v35 = std::vector<quasar::Token>::__push_back_slow_path<quasar::Token>(&v34, (long long *)v41);
                      if (SBYTE7(v50[0]) < 0) {
                        operator delete(__p[0]);
                      }
                    }
                    else
                    {
                      long long v11 = *(_OWORD *)v41;
                      *(void *)(v35 + 16) = *(void *)&v42[0];
                      *(_OWORD *)unint64_t v10 = v11;
                      v41[1] = 0;
                      *(void *)&v42[0] = 0;
                      v41[0] = 0;
                      uint64_t v12 = *(void *)((char *)&v42[1] + 6);
                      *(_OWORD *)(v10 + 24) = *(_OWORD *)((char *)v42 + 8);
                      *(void *)(v10 + 38) = v12;
                      uint64_t v13 = *(void *)&v44[0];
                      *(_OWORD *)(v10 + 48) = *(_OWORD *)v43;
                      *(void *)(v10 + 64) = v13;
                      *(void *)(v10 + 72) = 0;
                      v43[1] = 0;
                      *(void *)&v44[0] = 0;
                      v43[0] = 0;
                      *(void *)(v10 + 80) = 0;
                      *(void *)(v10 + 88) = 0;
                      *(_OWORD *)(v10 + 72) = *(_OWORD *)((char *)v44 + 8);
                      *(void *)(v10 + 88) = *((void *)&v44[1] + 1);
                      memset((char *)v44 + 8, 0, 24);
                      long long v14 = *(_OWORD *)v45;
                      *(void *)(v10 + 112) = *(void *)&v46[0];
                      *(void *)(v10 + 120) = 0;
                      *(_OWORD *)(v10 + 96) = v14;
                      v45[1] = 0;
                      *(void *)&v46[0] = 0;
                      v45[0] = 0;
                      *(void *)(v10 + 128) = 0;
                      *(void *)(v10 + 136) = 0;
                      *(_OWORD *)(v10 + 120) = *(_OWORD *)((char *)v46 + 8);
                      *(void *)(v10 + 136) = *((void *)&v46[1] + 1);
                      memset((char *)v46 + 8, 0, 24);
                      long long v15 = *(_OWORD *)v47;
                      *(void *)(v10 + 160) = v48;
                      *(_OWORD *)(v10 + 144) = v15;
                      v47[1] = 0;
                      *(void *)&long long v48 = 0;
                      v47[0] = 0;
                      LODWORD(v13) = DWORD2(v48);
                      *(_WORD *)(v10 + 172) = WORD6(v48);
                      *(_DWORD *)(v10 + 168) = v13;
                      long long v16 = *(_OWORD *)__p;
                      *(void *)(v10 + 192) = *(void *)&v50[0];
                      *(_OWORD *)(v10 + 176) = v16;
                      __p[1] = 0;
                      *(void *)&v50[0] = 0;
                      __p[0] = 0;
                      long long v17 = *(_OWORD *)((char *)v50 + 8);
                      *(_DWORD *)(v10 + 216) = DWORD2(v50[1]);
                      *(_OWORD *)(v10 + 200) = v17;
                      unint64_t v35 = v10 + 224;
                    }
                    if (SBYTE7(v48) < 0) {
                      operator delete(v47[0]);
                    }
                    v55 = (void **)v46 + 1;
                    std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](&v55);
                    if (SBYTE7(v46[0]) < 0) {
                      operator delete(v45[0]);
                    }
                    v55 = (void **)v44 + 1;
                    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v55);
                    if (SBYTE7(v44[0]) < 0) {
                      operator delete(v43[0]);
                    }
                    if (SBYTE7(v42[0]) < 0) {
                      operator delete(v41[0]);
                    }
                  }
                  uint64_t v5 = [v27 countByEnumeratingWithState:&v51 objects:v58 count:16];
                }
                while (v5);
              }

              std::vector<std::vector<quasar::Token>>::push_back[abi:ne180100](v29, (uint64_t)&v34);
              v41[0] = &v34;
              std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v41);
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v57 count:16];
          }
          while (v25);
        }

        std::vector<std::vector<std::vector<quasar::Token>>>::push_back[abi:ne180100](v28, (uint64_t)v29);
        v41[0] = v29;
        std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)v41);
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v30 objects:v56 count:16];
    }
    while (v19);
  }

  (*(void (**)(SpeechRecognizer *, uint64_t *, uint64_t))(*(void *)self->_recognizer.__ptr_ + 56))(self->_recognizer.__ptr_, v28, 3);
  v41[0] = v28;
  std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v41);
}

- (shared_ptr<quasar::SpeechRecognizer>)getRecognizer
{
  cntrl = self->_recognizer.__cntrl_;
  *id v2 = self->_recognizer.__ptr_;
  v2[1] = (SpeechRecognizer *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (SpeechRecognizer *)self;
  return result;
}

- (shared_ptr<quasar::corrective_reranking::Parser>)getParser
{
  cntrl = self->_parser.__cntrl_;
  *id v2 = self->_parser.__ptr_;
  v2[1] = (Parser *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Parser *)self;
  return result;
}

- (void)requestEagerResult:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        ptr = self->_recognizer.__ptr_;
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "doubleValue", (void)v10);
        quasar::SpeechRecognizer::requestEagerResult((quasar::SpeechRecognizer *)ptr, (int)(v9 * 1000.0));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (int)getCachedTokensSize
{
  return quasar::SpeechRecognizer::getCachedTokensSize((quasar::SpeechRecognizer *)self->_recognizer.__ptr_);
}

- (void)pauseRecognition
{
}

- (void)resumeRecognitionWithLeftContext:(id)a3 rightContext:(id)a4 selectedText:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v32 = v8;
  if (v8 && (objc_msgSend(v8, "ear_toStringOrNothing"), v49))
  {
    if (v48 < 0)
    {
      operator delete(v47[0]);
      if (!v9)
      {
LABEL_34:
        [(_EARSpeechRecognizer *)self resumeRecognitionWithLeftContext:v8 rightContext:&stru_1F0A64AB0 selectedText:v10];
        goto LABEL_35;
      }
    }
    else if (!v9)
    {
      goto LABEL_34;
    }
    objc_msgSend(v9, "ear_toStringOrNothing");
    if (v48 < 0) {
      operator delete(v47[0]);
    }
    long long v31 = self;
    objc_initWeak(&location, self);
    formatterQueue = self->_formatterQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83___EARSpeechRecognizer_resumeRecognitionWithLeftContext_rightContext_selectedText___block_invoke;
    block[3] = &unk_1E5FFE578;
    objc_copyWeak(&v38, &location);
    dispatch_async(formatterQueue, block);
    long long v12 = [MEMORY[0x1E4F1CA48] array];
    id v35 = v12;
    [(_EARSpeechRecognizer *)self splitWithTokenizer:v32 isLeftContext:1 shouldTruncate:1 outTokensInVocab:&v35];
    id v13 = v35;

    id v14 = v13;
    memset(&v34, 0, sizeof(v34));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v15 = v14;
    id v33 = v15;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v43 != v17) {
            objc_enumerationMutation(v15);
          }
          id v19 = *(id *)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v20 = v19;
          if (v19)
          {
            objc_msgSend(v19, "ear_toString");
          }
          else
          {
            __p[0] = 0;
            __p[1] = 0;
            std::string::size_type v41 = 0;
          }

          std::vector<std::string>::pointer end = v34.__end_;
          if (v34.__end_ >= v34.__end_cap_.__value_)
          {
            unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * (((char *)v34.__end_ - (char *)v34.__begin_) >> 3);
            unint64_t v24 = v23 + 1;
            if (v23 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<int>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3) > v24) {
              unint64_t v24 = 0x5555555555555556 * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3) >= 0x555555555555555) {
              unint64_t v25 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v25 = v24;
            }
            __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v34.__end_cap_;
            if (v25) {
              id v26 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v34.__end_cap_, v25);
            }
            else {
              id v26 = 0;
            }
            id v27 = v26 + v23;
            __v.__first_ = v26;
            __v.__begin_ = v27;
            __v.__end_cap_.__value_ = &v26[v25];
            long long v28 = *(_OWORD *)__p;
            v27->__r_.__value_.__r.__words[2] = v41;
            *(_OWORD *)&v27->__r_.__value_.__l.__data_ = v28;
            __p[1] = 0;
            std::string::size_type v41 = 0;
            __p[0] = 0;
            __v.__end_ = v27 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v34, &__v);
            id v29 = v34.__end_;
            std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
            v34.__end_ = v29;
            id v15 = v33;
            if (SHIBYTE(v41) < 0) {
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v22 = *(_OWORD *)__p;
            v34.__end_->__r_.__value_.__r.__words[2] = v41;
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v22;
            v34.__end_ = end + 1;
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v16);
    }

    [(_EARRelevantTextContext *)v31->_relevantTextContext setLeftContext:v32 rightContext:v9];
    [(_EARRelevantTextContext *)v31->_relevantTextContext setFavorCommandSuppression:0];
    [(_EARRelevantTextContext *)v31->_relevantTextContext setAbortCommandSuppression:0];
    uint64_t ptr = (uint64_t)v31->_recognizer.__ptr_;
    [(_EARSpeechRecognizer *)v31 splitWithTokenizer:v9 isLeftContext:0 shouldTruncate:1 outTokensInVocab:0];
    quasar::SpeechRecognizer::resumeRecognition(ptr, (long long **)&v34, v36, (uint64_t)v47, 0);
    *(void *)&long long v42 = v47;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v42);
    v47[0] = (void **)&v34;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v47);
    v47[0] = (void **)v36;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v47);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  else
  {
    [(_EARSpeechRecognizer *)self resumeRecognitionWithLeftContext:&stru_1F0A64AB0 rightContext:v9 selectedText:v10];
  }
LABEL_35:
}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  id v23 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (v23) {
    [(_EARRelevantTextContext *)self->_relevantTextContext setLeftContext:v23];
  }
  if (v16) {
    [(_EARRelevantTextContext *)self->_relevantTextContext setRightContext:v16];
  }
  if (v18) {
    -[_EARRelevantTextContext setDisambiguationActive:](self->_relevantTextContext, "setDisambiguationActive:", [v18 BOOLValue]);
  }
  if (v19) {
    -[_EARRelevantTextContext setCursorInVisibleText:](self->_relevantTextContext, "setCursorInVisibleText:", [v19 BOOLValue]);
  }
  if (v20) {
    -[_EARRelevantTextContext setFavorCommandSuppression:](self->_relevantTextContext, "setFavorCommandSuppression:", [v20 BOOLValue]);
  }
  if (v21)
  {
    -[_EARRelevantTextContext setAbortCommandSuppression:](self->_relevantTextContext, "setAbortCommandSuppression:", [v21 BOOLValue]);
    if ([v21 BOOLValue]) {
      [(_EARRelevantTextContext *)self->_relevantTextContext setFavorCommandSuppression:0];
    }
  }
  if (v22 && [v22 BOOLValue]) {
    [(_EARRelevantTextContext *)self->_relevantTextContext notifyUndoEventFromClient];
  }
}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9
{
}

- (id)tokenizeTextFromEnd:(id)a3 withLimit:(unint64_t)a4 outTokensInVocab:(id *)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  context = (void *)MEMORY[0x1B3EA9930]();
  id v8 = [MEMORY[0x1E4F28F80] processInfo];
  [v8 systemUptime];

  if ([v41 length])
  {
    id v9 = [(_EARSpeechRecognizer *)self _tokenizer];
    id v40 = [v9 tokenize:v41 limit:a4];

    if (!a5) {
      goto LABEL_27;
    }
  }
  else
  {
    id v40 = 0;
    if (!a5) {
      goto LABEL_27;
    }
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v10 = [v40 reverseObjectEnumerator];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v66;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v66 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(id *)(*((void *)&v65 + 1) + 8 * i);
        id v15 = v14;
        uint64_t ptr = self->_recognizer.__ptr_;
        if (v14)
        {
          objc_msgSend(v14, "ear_toString");
        }
        else
        {
          long long __p = 0;
          uint64_t v63 = 0;
          uint64_t v64 = 0;
        }
        quasar::SpeechRecognizer::findWord((quasar::SpeechRecognizer *)ptr, (uint64_t)&__p, (std::string *)v45);
        if (SHIBYTE(v64) < 0) {
          operator delete(__p);
        }
        if (SBYTE7(v46) < 0)
        {
          id v17 = (void **)v45[0];
          if (!v45[1])
          {
            operator delete(v45[0]);
LABEL_25:

            goto LABEL_26;
          }
        }
        else
        {
          if (!BYTE7(v46)) {
            goto LABEL_25;
          }
          id v17 = v45;
        }
        id v18 = *a5;
        id v19 = [NSString stringWithUTF8String:v17];
        [v18 insertObject:v19 atIndex:0];

        if (SBYTE7(v46) < 0) {
          operator delete(v45[0]);
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v65 objects:v69 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_26:

LABEL_27:
  id v20 = [MEMORY[0x1E4F28F80] processInfo];
  [v20 systemUptime];

  int v21 = quasar::gLogLevel;
  if (quasar::gLogLevel >= 6)
  {
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
    long long v46 = 0u;
    long long v47 = 0u;
    *(_OWORD *)long long v45 = 0u;
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v45);
    id v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)"Tokenized text: \"", 17);
    if (v41)
    {
      objc_msgSend(v41, "ear_toString");
      unsigned int v23 = HIBYTE(v64);
      unint64_t v24 = (void **)__p;
      uint64_t v25 = v63;
    }
    else
    {
      uint64_t v25 = 0;
      unint64_t v24 = 0;
      unsigned int v23 = 0;
      long long __p = 0;
      uint64_t v63 = 0;
      uint64_t v64 = 0;
    }
    if ((v23 & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = v24;
    }
    if ((v23 & 0x80u) == 0) {
      uint64_t v27 = v23;
    }
    else {
      uint64_t v27 = v25;
    }
    long long v28 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)p_p, v27);
    id v29 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)"\" to \"", 6);
    long long v30 = [v40 componentsJoinedByString:@"\", \""];
    long long v31 = v30;
    if (v30)
    {
      objc_msgSend(v30, "ear_toString");
      unsigned int v32 = HIBYTE(v44);
      id v33 = (void **)v42;
      uint64_t v34 = v43;
    }
    else
    {
      uint64_t v34 = 0;
      id v33 = 0;
      unsigned int v32 = 0;
      long long v42 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
    }
    if ((v32 & 0x80u) == 0) {
      id v35 = &v42;
    }
    else {
      id v35 = v33;
    }
    if ((v32 & 0x80u) == 0) {
      uint64_t v36 = v32;
    }
    else {
      uint64_t v36 = v34;
    }
    long long v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)v35, v36);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)"\"", 1);
    if (SHIBYTE(v44) < 0) {
      operator delete(v42);
    }

    if (SHIBYTE(v64) < 0) {
      operator delete(__p);
    }
    quasar::QuasarTraceMessage::~QuasarTraceMessage((quasar::QuasarTraceMessage *)v45);
    int v21 = quasar::gLogLevel;
  }
  if (v21 >= 4)
  {
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
    long long v46 = 0u;
    long long v47 = 0u;
    *(_OWORD *)long long v45 = 0u;
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v45);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)"Tokenization duration:", 22);
    std::ostream::operator<<();
    quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)v45);
  }

  return v40;
}

- (vector<std::string,)splitWithTokenizer:(_EARSpeechRecognizer *)self outTokensInVocab:(SEL)a3 isLeftContext:(id)a4
{
  BOOL v6 = a6;
  v37[16] = *(void ***)MEMORY[0x1E4F143B8];
  id v10 = a4;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  id v28 = v10;
  if ([v10 length])
  {
    if (v6)
    {
      if (self->_enableVoiceCommands) {
        uint64_t v11 = 50;
      }
      else {
        uint64_t v11 = 4;
      }
    }
    else
    {
      uint64_t v11 = 4;
    }
    [(_EARSpeechRecognizer *)self tokenizeTextFromEnd:v28 withLimit:v11 outTokensInVocab:a5];
    memset(&v29, 0, sizeof(v29));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v12);
          }
          id v16 = *(id *)(*((void *)&v32 + 1) + 8 * i);
          id v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "ear_toString");
          }
          else
          {
            __p[0] = 0;
            __p[1] = 0;
            std::string::size_type v31 = 0;
          }

          std::vector<std::string>::pointer end = v29.__end_;
          if (v29.__end_ >= v29.__end_cap_.__value_)
          {
            unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * (((char *)v29.__end_ - (char *)v29.__begin_) >> 3);
            unint64_t v21 = v20 + 1;
            if (v20 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<int>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * (((char *)v29.__end_cap_.__value_ - (char *)v29.__begin_) >> 3) > v21) {
              unint64_t v21 = 0x5555555555555556 * (((char *)v29.__end_cap_.__value_ - (char *)v29.__begin_) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v29.__end_cap_.__value_ - (char *)v29.__begin_) >> 3) >= 0x555555555555555) {
              unint64_t v22 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v22 = v21;
            }
            __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v29.__end_cap_;
            if (v22) {
              unsigned int v23 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v29.__end_cap_, v22);
            }
            else {
              unsigned int v23 = 0;
            }
            unint64_t v24 = v23 + v20;
            __v.__first_ = v23;
            __v.__begin_ = v24;
            __v.__end_cap_.__value_ = &v23[v22];
            long long v25 = *(_OWORD *)__p;
            v24->__r_.__value_.__r.__words[2] = v31;
            *(_OWORD *)&v24->__r_.__value_.__l.__data_ = v25;
            __p[1] = 0;
            std::string::size_type v31 = 0;
            __p[0] = 0;
            __v.__end_ = v24 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v29, &__v);
            id v26 = v29.__end_;
            std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
            v29.__end_ = v26;
            if (SHIBYTE(v31) < 0) {
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v19 = *(_OWORD *)__p;
            v29.__end_->__r_.__value_.__r.__words[2] = v31;
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v19;
            v29.__end_ = end + 1;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v13);
    }

    std::vector<std::string>::__vdeallocate((std::vector<std::wstring> *)retstr);
    *(std::vector<std::string> *)retstr = v29;
    memset(&v29, 0, sizeof(v29));
    v37[0] = (void **)&v29;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v37);
  }
  return result;
}

- (vector<std::string,)splitWithTokenizer:(_EARSpeechRecognizer *)self isLeftContext:(SEL)a3 shouldTruncate:(id)a4 outTokensInVocab:(BOOL)a5
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a4;
  id v16 = v11;
  if (v8)
  {
    id v12 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    uint64_t v13 = [v16 componentsSeparatedByCharactersInSet:v12];
    uint64_t v14 = &stru_1F0A64AB0;
    if ([v13 count])
    {
      if (v9) {
        [v13 lastObject];
      }
      else {
      uint64_t v14 = [v13 firstObject];
      }
    }
    [(_EARSpeechRecognizer *)self splitWithTokenizer:v14 outTokensInVocab:a7 isLeftContext:v9];
  }
  else
  {
    [(_EARSpeechRecognizer *)self splitWithTokenizer:v11 outTokensInVocab:a7 isLeftContext:v9];
  }

  return result;
}

- (NSData)userProfileData
{
  return self->_userProfileData;
}

- (NSData)jitProfileData
{
  return self->_jitProfileData;
}

- (_EARSpeechModelInfo)modelInfo
{
  return self->_modelInfo;
}

- (_EARSpeakerCodeInfo)speakerCodeInfo
{
  return self->_speakerCodeInfo;
}

- (BOOL)detectUtterances
{
  return self->_detectUtterances;
}

- (void)setDetectUtterances:(BOOL)a3
{
  self->_detectUtterances = a3;
}

- (BOOL)concatenateUtterances
{
  return self->_concatenateUtterances;
}

- (void)setConcatenateUtterances:(BOOL)a3
{
  self->_concatenateUtterances = a3;
}

- (BOOL)allowUtteranceDelay
{
  return self->_allowUtteranceDelay;
}

- (void)setAllowUtteranceDelay:(BOOL)a3
{
  self->_allowUtteranceDelay = a3;
}

- (BOOL)formatAcrossUtterances
{
  return self->_formatAcrossUtterances;
}

- (void)setFormatAcrossUtterances:(BOOL)a3
{
  self->_formatAcrossUtterances = a3;
}

- (double)endpointStart
{
  return self->_endpointStart;
}

- (void)setEndpointStart:(double)a3
{
  self->_endpointStart = a3;
}

- (BOOL)recognizeEagerCandidates
{
  return self->_recognizeEagerCandidates;
}

- (void)setRecognizeEagerCandidates:(BOOL)a3
{
  self->_recognizeEagerCandidates = a3;
}

- (BOOL)farField
{
  return self->_farField;
}

- (void)setFarField:(BOOL)a3
{
  self->_farField = a3;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (BOOL)enableSpeakerCodeTraining
{
  return self->_enableSpeakerCodeTraining;
}

- (void)setEnableSpeakerCodeTraining:(BOOL)a3
{
  self->_enableSpeakerCodeTraining = a3;
}

- (double)maximumRecognitionDuration
{
  return self->_maximumRecognitionDuration;
}

- (void)setMaximumRecognitionDuration:(double)a3
{
  self->_maximumRecognitionDuration = a3;
}

- (NSDictionary)recognitionReplacements
{
  return self->_recognitionReplacements;
}

- (void)setRecognitionReplacements:(id)a3
{
}

- (NSDictionary)recognitionConfidenceSubtraction
{
  return self->_recognitionConfidenceSubtraction;
}

- (void)setRecognitionConfidenceSubtraction:(id)a3
{
}

- (NSArray)leftContext
{
  return self->_leftContext;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (void)setInputOrigin:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
}

- (NSString)refTranscriptForErrorBlaming
{
  return self->_refTranscriptForErrorBlaming;
}

- (void)setRefTranscriptForErrorBlaming:(id)a3
{
}

- (NSString)bluetoothDeviceId
{
  return self->_bluetoothDeviceId;
}

- (void)setBluetoothDeviceId:(id)a3
{
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSArray)extraLmList
{
  return self->_extraLmList;
}

- (void)setExtraLmList:(id)a3
{
}

- (NSArray)scoreNbestExtraLmList
{
  return self->_scoreNbestExtraLmList;
}

- (void)setScoreNbestExtraLmList:(id)a3
{
}

- (BOOL)scoreNbest
{
  return self->_scoreNbest;
}

- (void)setScoreNbest:(BOOL)a3
{
  self->_scoreNbest = a3;
}

- (BOOL)atypicalSpeech
{
  return self->_atypicalSpeech;
}

- (void)setAtypicalSpeech:(BOOL)a3
{
  self->_atypicalSpeech = a3;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (BOOL)disableAutoPunctuation
{
  return self->_disableAutoPunctuation;
}

- (void)setDisableAutoPunctuation:(BOOL)a3
{
  self->_disableAutoPunctuation = a3;
}

- (BOOL)disablePartialResults
{
  return self->_disablePartialResults;
}

- (void)setDisablePartialResults:(BOOL)a3
{
  self->_disablePartialResults = a3;
}

- (BOOL)shouldGenerateVoiceCommandCandidates
{
  return self->_shouldGenerateVoiceCommandCandidates;
}

- (void)setShouldGenerateVoiceCommandCandidates:(BOOL)a3
{
  self->_shouldGenerateVoiceCommandCandidates = a3;
}

- (BOOL)disableContextualBiasing
{
  return self->_disableContextualBiasing;
}

- (void)setDisableContextualBiasing:(BOOL)a3
{
  self->_disableContextualBiasing = a3;
}

- (EARVoiceCommandActiveSet)voiceCommandActiveSet
{
  return self->_voiceCommandActiveSet;
}

- (BOOL)recognizeEmoji
{
  return self->_recognizeEmoji;
}

- (void)setRecognizeEmoji:(BOOL)a3
{
  self->_recognizeEmojuint64_t i = a3;
}

- (NSString)rightContext
{
  return self->_rightContext;
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
}

- (NSString)aneContext
{
  return self->_aneContext;
}

- (void)setAneContext:(id)a3
{
}

- (NSString)cpuContext
{
  return self->_cpuContext;
}

- (void)setCpuContext:(id)a3
{
}

- (NSString)gpuContext
{
  return self->_gpuContext;
}

- (void)setGpuContext:(id)a3
{
}

- (_EARRecognitionMetrics)recognitionMetrics
{
  return self->_recognitionMetrics;
}

- (void)setRecognitionMetrics:(id)a3
{
}

- (NSArray)leftContextForItn
{
  return self->_leftContextForItn;
}

- (void)setLeftContextForItn:(id)a3
{
}

- (NSString)configPath
{
  return self->_configPath;
}

- (NSNumber)overrideDoServerSideEndpointing
{
  return self->_overrideDoServerSideEndpointing;
}

- (void)setOverrideDoServerSideEndpointing:(id)a3
{
}

- (_EARRelevantTextContext)relevantTextContext
{
  return self->_relevantTextContext;
}

- (void)setRelevantTextContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantTextContext, 0);
  objc_storeStrong((id *)&self->_overrideDoServerSideEndpointing, 0);
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_leftContextForItn, 0);
  objc_storeStrong((id *)&self->_recognitionMetrics, 0);
  objc_storeStrong((id *)&self->_gpuContext, 0);
  objc_storeStrong((id *)&self->_cpuContext, 0);
  objc_storeStrong((id *)&self->_aneContext, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_rightContext, 0);
  objc_storeStrong((id *)&self->_voiceCommandActiveSet, 0);
  objc_storeStrong((id *)&self->_scoreNbestExtraLmList, 0);
  objc_storeStrong((id *)&self->_extraLmList, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_bluetoothDeviceId, 0);
  objc_storeStrong((id *)&self->_refTranscriptForErrorBlaming, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_leftContext, 0);
  objc_storeStrong((id *)&self->_recognitionConfidenceSubtraction, 0);
  objc_storeStrong((id *)&self->_recognitionReplacements, 0);
  objc_storeStrong((id *)&self->_speakerCodeInfo, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_jitProfileData, 0);
  objc_storeStrong((id *)&self->_userProfileData, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_onScreenContextForEditLme, 0);
  cntrl = self->_modelInitializeContext.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  p_rightContextTokens = &self->_rightContextTokens;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_rightContextTokens);
  objc_storeStrong((id *)&self->_userProfiles, 0);
  objc_storeStrong((id *)&self->_muxIds, 0);
  objc_storeStrong((id *)&self->_muxIdReverseMask, 0);
  objc_storeStrong((id *)&self->_muxIdMask, 0);
  objc_storeStrong((id *)&self->_recognitionQueue, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  id v4 = self->_currentResultStreamWrapper.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
  objc_destroyWeak((id *)&self->_currentAudioBuffer);
  uint64_t v5 = self->_parser.__cntrl_;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v5);
  }
  BOOL v6 = self->_recognizer.__cntrl_;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  }
  objc_storeStrong((id *)&self->_endsOfSentencePunctuations, 0);
  uint64_t v7 = self->_voiceCommandCompilation.__cntrl_;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v7);
  }
  BOOL v8 = self->_training.__cntrl_;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v8);
  }
  objc_storeStrong((id *)&self->_trainingQueue, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_formatterQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *((void *)self + 29) = 0;
  return self;
}

- (void)initWithConfig:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1B1A86000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)_audioBufferWithLangauge:(int)a1 task:(std::__shared_weak_count *)a2 samplingRate:userProfileData:resultStream:.cold.1(int a1, std::__shared_weak_count **a2)
{
  _Block_object_dispose(a2, 8);
  uint64_t v3 = a2[7];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

+ (void)compileRecognizerModels2WithConfiguration:(void *)a3 error:.cold.1(uint64_t a1, NSObject *a2, void *a3)
{
  OUTLINED_FUNCTION_7(a1, (uint64_t)a2, a3);
  (*(void (**)(void))(v4 + 16))();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1B1A86000, a2, v5, "Exception (...): %s", v6);
}

+ (void)compileRecognizerModels2WithConfiguration:error:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1B1A86000, v0, v1, "Unexpected exception while compiling recognizer models with configuration path: %@", v2, v3, v4, v5, v6);
}

+ (void)compileRecognizerModels2WithConfiguration:(uint64_t)a1 error:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  (*(void (**)(void))(v3 + 16))();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1B1A86000, a2, v4, "Exception (...): %s", v5);
}

+ (void)purgeCompiledRecognizerModelsWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1B1A86000, v0, v1, "Unexpected exception while purging compiled recognizer models with configuration path: %@", v2, v3, v4, v5, v6);
}

@end