@interface SFSpeechRecognitionRequest
+ (void)initialize;
- (BOOL)_forceOfflineRecognition;
- (BOOL)_forceUseSiriProcess;
- (BOOL)addsPunctuation;
- (BOOL)detectMultipleUtterances;
- (BOOL)shouldReportPartialResults;
- (NSArray)contextualStrings;
- (NSDictionary)_recognitionOverrides;
- (NSDictionary)_voiceTriggerEventInfo;
- (NSString)interactionIdentifier;
- (NSString)taskIdentifier;
- (NSURL)_modelOverrideURL;
- (SFRequestParameters)_requestParametersWithTaskHint:(void *)a3 requestIdentifier:(void *)a4 taskIdentifier:(uint64_t)a5 narrowband:(void *)a6 language:;
- (SFSpeechLanguageModelConfiguration)customizedLanguageModel;
- (SFSpeechRecognitionRequest)init;
- (SFSpeechRecognitionTaskHint)taskHint;
- (_SFSearchRequest)_searchRequest;
- (double)_maximumRecognitionDuration;
- (id)_dictationOptionsWithTaskHint:(void *)a3 requestIdentifier:;
- (id)_sandboxExtensionsWithError:(uint64_t)a1;
- (id)_startedConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6;
- (id)_startedLocalConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6 taskIdentifier:(id)a7;
- (void)_setAFDictationRequestParams:(uint64_t)a1;
- (void)_setForceOfflineRecognition:(BOOL)a3;
- (void)_setForceUseSiriProcess:(BOOL)a3;
- (void)_setMaximumRecognitionDuration:(double)a3;
- (void)_setModelOverrideURL:(id)a3;
- (void)_setRecognitionOverrides:(id)a3;
- (void)_setSearchRequest:(id)a3;
- (void)_setVoiceTriggerEventInfo:(id)a3;
- (void)setAddsPunctuation:(BOOL)addsPunctuation;
- (void)setContextualStrings:(NSArray *)contextualStrings;
- (void)setCustomizedLanguageModel:(SFSpeechLanguageModelConfiguration *)customizedLanguageModel;
- (void)setDetectMultipleUtterances:(BOOL)a3;
- (void)setInteractionIdentifier:(NSString *)interactionIdentifier;
- (void)setRequiresOnDeviceRecognition:(BOOL)requiresOnDeviceRecognition;
- (void)setShouldReportPartialResults:(BOOL)shouldReportPartialResults;
- (void)setTaskHint:(SFSpeechRecognitionTaskHint)taskHint;
- (void)setTaskIdentifier:(id)a3;
@end

@implementation SFSpeechRecognitionRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_customizedLanguageModel, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_contextualStrings, 0);
  objc_storeStrong((id *)&self->_afDictationRequestParams, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_recognitionOverrides, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);

  objc_storeStrong((id *)&self->_searchRequest, 0);
}

- (void)setTaskIdentifier:(id)a3
{
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setDetectMultipleUtterances:(BOOL)a3
{
  self->_detectMultipleUtterances = a3;
}

- (BOOL)detectMultipleUtterances
{
  return self->_detectMultipleUtterances;
}

- (void)setCustomizedLanguageModel:(SFSpeechLanguageModelConfiguration *)customizedLanguageModel
{
}

- (SFSpeechLanguageModelConfiguration)customizedLanguageModel
{
  return self->_customizedLanguageModel;
}

- (void)setAddsPunctuation:(BOOL)addsPunctuation
{
  self->_addsPunctuation = addsPunctuation;
}

- (BOOL)addsPunctuation
{
  return self->_addsPunctuation;
}

- (void)setInteractionIdentifier:(NSString *)interactionIdentifier
{
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (void)setContextualStrings:(NSArray *)contextualStrings
{
}

- (NSArray)contextualStrings
{
  return self->_contextualStrings;
}

- (void)setShouldReportPartialResults:(BOOL)shouldReportPartialResults
{
  self->_shouldReportPartialResults = shouldReportPartialResults;
}

- (BOOL)shouldReportPartialResults
{
  return self->_shouldReportPartialResults;
}

- (void)setTaskHint:(SFSpeechRecognitionTaskHint)taskHint
{
  self->_taskHint = taskHint;
}

- (SFSpeechRecognitionTaskHint)taskHint
{
  return self->_taskHint;
}

- (void)_setForceUseSiriProcess:(BOOL)a3
{
  self->_forceUseSiriProcess = a3;
}

- (BOOL)_forceUseSiriProcess
{
  return self->_forceUseSiriProcess;
}

- (void)_setModelOverrideURL:(id)a3
{
}

- (NSURL)_modelOverrideURL
{
  return self->_modelOverrideURL;
}

- (void)_setRecognitionOverrides:(id)a3
{
}

- (NSDictionary)_recognitionOverrides
{
  return self->_recognitionOverrides;
}

- (void)_setVoiceTriggerEventInfo:(id)a3
{
}

- (NSDictionary)_voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (void)_setSearchRequest:(id)a3
{
}

- (_SFSearchRequest)_searchRequest
{
  return self->_searchRequest;
}

- (void)_setForceOfflineRecognition:(BOOL)a3
{
  self->_forceOfflineRecognition = a3;
}

- (BOOL)_forceOfflineRecognition
{
  return self->_forceOfflineRecognition;
}

- (void)_setMaximumRecognitionDuration:(double)a3
{
  self->_maximumRecognitionDuration = a3;
}

- (double)_maximumRecognitionDuration
{
  return self->_maximumRecognitionDuration;
}

- (id)_startedLocalConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6 taskIdentifier:(id)a7
{
  return 0;
}

- (id)_startedConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6
{
  return 0;
}

- (void)setRequiresOnDeviceRecognition:(BOOL)requiresOnDeviceRecognition
{
  BOOL v3 = requiresOnDeviceRecognition;
  -[SFSpeechRecognitionRequest setDetectMultipleUtterances:](self, "setDetectMultipleUtterances:");

  [(SFSpeechRecognitionRequest *)self _setForceOfflineRecognition:v3];
}

- (SFSpeechRecognitionRequest)init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SFSpeechRecognitionRequest;
    v4 = [(SFSpeechRecognitionRequest *)&v9 init];
    v5 = v4;
    if (v4)
    {
      v4->_shouldReportPartialResults = 1;
      contextualStrings = v4->_contextualStrings;
      v4->_contextualStrings = (NSArray *)MEMORY[0x1E4F1CBF0];

      v5->_maximumRecognitionDuration = 60.0;
      *(_WORD *)&v5->_addsPunctuation = 0;
    }
    self = v5;
    v7 = self;
  }

  return v7;
}

+ (void)initialize
{
}

- (SFRequestParameters)_requestParametersWithTaskHint:(void *)a3 requestIdentifier:(void *)a4 taskIdentifier:(uint64_t)a5 narrowband:(void *)a6 language:
{
  v11 = a6;
  if (a1)
  {
    id v12 = a4;
    id v13 = a3;
    v14 = objc_alloc_init(SFRequestParameters);
    v15 = [MEMORY[0x1E4F28B50] mainBundle];
    v16 = [v15 bundleIdentifier];
    [(SFRequestParameters *)v14 setApplicationName:v16];

    v17 = [v15 infoDictionary];
    v18 = [v17 objectForKey:*MEMORY[0x1E4F1D020]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SFRequestParameters *)v14 setApplicationVersion:v18];
    }
    [(SFRequestParameters *)v14 setInlineItemList:*(void *)(a1 + 72)];
    [(SFRequestParameters *)v14 setRequestIdentifier:v13];

    [(SFRequestParameters *)v14 setTaskIdentifier:v12];
    if (![(__CFString *)v11 caseInsensitiveCompare:@"hi-IN-translit"])
    {
      v19 = @"hi-IN";

      v11 = @"hi-IN";
    }
    [(SFRequestParameters *)v14 setLanguage:v11];
    v20 = +[SFUtilities taskNameFromTaskHint:a2];
    [(SFRequestParameters *)v14 setTask:v20];

    [(SFRequestParameters *)v14 setNarrowband:a5];
    [(SFRequestParameters *)v14 setRecognitionOverrides:*(void *)(a1 + 40)];
    [(SFRequestParameters *)v14 setModelOverrideURL:*(void *)(a1 + 48)];
    [(SFRequestParameters *)v14 setMaximumRecognitionDuration:3600.0];
    v21 = [*(id *)(a1 + 88) languageModel];
    [(SFRequestParameters *)v14 setDynamicLanguageModel:v21];

    v22 = [*(id *)(a1 + 88) vocabulary];
    [(SFRequestParameters *)v14 setDynamicVocabulary:v22];

    [(SFRequestParameters *)v14 setDetectMultipleUtterances:*(unsigned __int8 *)(a1 + 12)];
    -[SFRequestParameters setOnDeviceOnly:](v14, "setOnDeviceOnly:", [(id)a1 requiresOnDeviceRecognition]);
    -[SFRequestParameters setEnableAutoPunctuation:](v14, "setEnableAutoPunctuation:", [(id)a1 addsPunctuation]);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_sandboxExtensionsWithError:(uint64_t)a1
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v3 = +[SFUtilities sandboxExtensionsForUsingANEAndAssets];
    if (v3) {
      [v2 addObjectsFromArray:v3];
    }
    v4 = *(void **)(a1 + 88);
    if (v4)
    {
      v5 = [v4 languageModel];
      v6 = [v5 path];
      v7 = +[SFUtilities issueReadSandboxExtensionForFilePath:v6 error:0];

      v8 = [*(id *)(a1 + 88) vocabulary];
      if (v8)
      {
        objc_super v9 = [*(id *)(a1 + 88) vocabulary];
        v10 = [v9 path];
        v11 = +[SFUtilities issueReadSandboxExtensionForFilePath:v10 error:0];
      }
      else
      {
        v11 = 0;
      }

      if (v7) {
        [v2 addObject:v7];
      }
      if (v11) {
        [v2 addObject:v11];
      }
    }
    id v12 = (void *)[v2 copy];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_dictationOptionsWithTaskHint:(void *)a3 requestIdentifier:
{
  if (a1)
  {
    v5 = (objc_class *)MEMORY[0x1E4F4E458];
    id v6 = a3;
    id v7 = objc_alloc_init(v5);
    v8 = [MEMORY[0x1E4F28B50] mainBundle];
    objc_super v9 = [v8 bundleIdentifier];
    [v7 setApplicationName:v9];

    v10 = [v8 infoDictionary];
    v11 = [v10 objectForKey:*MEMORY[0x1E4F1D020]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 setApplicationVersion:v11];
    }
    [v7 setInlineItemList:*(void *)(a1 + 72)];
    [v7 setRequestIdentifier:v6];

    [v7 setVoiceTriggerEventInfo:*(void *)(a1 + 32)];
    [v7 setMaximumRecognitionDuration:*(double *)(a1 + 16)];
    [v7 setDetectUtterances:*(unsigned __int8 *)(a1 + 12)];
    id v12 = *(id *)(a1 + 24);
    id v13 = v12;
    if (v12)
    {
      objc_msgSend(v7, "setVoiceSearchTypeOptions:", objc_msgSend(v12, "searchTypes") & 3);
      v14 = [v13 queryParameters];
      [v7 setVoiceSearchQueryParameters:v14];

      v15 = [v13 headerFields];
      [v7 setVoiceSearchHeaderFields:v15];

      [v7 setKeyboardType:12];
    }
    else
    {
      uint64_t v16 = 1;
      if (a2 > 1001)
      {
        if (a2 == 1002)
        {
          uint64_t v16 = 1;
          [v7 setTaskHint:1];
        }
        else if (a2 == 1004)
        {
          [v7 setTaskHint:2];
          uint64_t v16 = 1;
        }
      }
      else
      {
        uint64_t v17 = 13;
        if (a2 != 1001) {
          uint64_t v17 = 1;
        }
        if (a2 == 2) {
          uint64_t v16 = 12;
        }
        else {
          uint64_t v16 = v17;
        }
      }
      [v7 setKeyboardType:v16];
      [v7 setAutoPunctuation:*(unsigned __int8 *)(a1 + 11)];
    }
    [v7 setForceOfflineRecognition:*(unsigned __int8 *)(a1 + 8)];
    if (*(unsigned char *)(a1 + 8)) {
      [v7 setMaximumRecognitionDuration:3600.0];
    }
    [v7 setRecognitionOverrides:*(void *)(a1 + 40)];
    [v7 setModelOverrideURL:*(void *)(a1 + 48)];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_setAFDictationRequestParams:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

@end