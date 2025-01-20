@interface AFDictationOptions
+ (BOOL)supportsSecureCoding;
- (AFDictationOptions)dictationOptionsWithoutTextContext;
- (AFDictationOptions)init;
- (AFDictationOptions)initWithCoder:(id)a3;
- (AFLanguageDetectionUserContext)languageDetectionUserContext;
- (BOOL)autoPunctuation;
- (BOOL)continuousListening;
- (BOOL)detectUtterances;
- (BOOL)emojiRecognition;
- (BOOL)farField;
- (BOOL)forceOfflineRecognition;
- (BOOL)incremental;
- (BOOL)preferOnDeviceRecognition;
- (BOOL)preferOnlineRecognition;
- (BOOL)releaseAudioSessionOnRecordingCompletion;
- (BOOL)secureOfflineOnly;
- (BOOL)shouldClassifyIntent;
- (BOOL)shouldGenerateVoiceCommandCandidates;
- (BOOL)shouldHandleCapitalization;
- (BOOL)shouldRecognizeCommands;
- (NSArray)inlineItemList;
- (NSDictionary)recognitionOverrides;
- (NSDictionary)voiceSearchHeaderFields;
- (NSDictionary)voiceSearchQueryParameters;
- (NSDictionary)voiceTriggerEventInfo;
- (NSString)applicationDisplayName;
- (NSString)applicationName;
- (NSString)applicationVersion;
- (NSString)fieldIdentifier;
- (NSString)fieldLabel;
- (NSString)interactionIdentifier;
- (NSString)keyboardIdentifier;
- (NSString)languageCodeOverride;
- (NSString)microphoneIdentifier;
- (NSString)offlineLanguage;
- (NSString)orthography;
- (NSString)postfixText;
- (NSString)prefixText;
- (NSString)requestIdentifier;
- (NSString)samplingInfo;
- (NSString)selectedText;
- (NSURL)modelOverrideURL;
- (NSURL)originalAudioFileURL;
- (STSiriContext)context;
- (double)maximumRecognitionDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)dictationInputOrigin;
- (int64_t)keyboardType;
- (int64_t)returnKeyType;
- (int64_t)taskHint;
- (int64_t)transcriptionMode;
- (int64_t)voiceSearchTypeOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationDisplayName:(id)a3;
- (void)setApplicationName:(id)a3;
- (void)setApplicationVersion:(id)a3;
- (void)setAutoPunctuation:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setContinuousListening:(BOOL)a3;
- (void)setDetectUtterances:(BOOL)a3;
- (void)setDictationInputOrigin:(int64_t)a3;
- (void)setEmojiRecognition:(BOOL)a3;
- (void)setFarField:(BOOL)a3;
- (void)setFieldIdentifier:(id)a3;
- (void)setFieldLabel:(id)a3;
- (void)setForceOfflineRecognition:(BOOL)a3;
- (void)setIncremental:(BOOL)a3;
- (void)setInlineItemList:(id)a3;
- (void)setInteractionIdentifier:(id)a3;
- (void)setKeyboardIdentifier:(id)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setLanguageCodeOverride:(id)a3;
- (void)setLanguageDetectionUserContext:(id)a3;
- (void)setMaximumRecognitionDuration:(double)a3;
- (void)setMicrophoneIdentifier:(id)a3;
- (void)setModelOverrideURL:(id)a3;
- (void)setOfflineLanguage:(id)a3;
- (void)setOriginalAudioFileURL:(id)a3;
- (void)setOrthography:(id)a3;
- (void)setPostfixText:(id)a3;
- (void)setPreferOnDeviceRecognition:(BOOL)a3;
- (void)setPreferOnlineRecognition:(BOOL)a3;
- (void)setPrefixText:(id)a3;
- (void)setRecognitionOverrides:(id)a3;
- (void)setReleaseAudioSessionOnRecordingCompletion:(BOOL)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setReturnKeyType:(int64_t)a3;
- (void)setSamplingInfo:(id)a3;
- (void)setSecureOfflineOnly:(BOOL)a3;
- (void)setSelectedText:(id)a3;
- (void)setShouldClassifyIntent:(BOOL)a3;
- (void)setShouldGenerateVoiceCommandCandidates:(BOOL)a3;
- (void)setShouldHandleCapitalization:(BOOL)a3;
- (void)setShouldRecognizeCommands:(BOOL)a3;
- (void)setTaskHint:(int64_t)a3;
- (void)setTranscriptionMode:(int64_t)a3;
- (void)setVoiceSearchHeaderFields:(id)a3;
- (void)setVoiceSearchQueryParameters:(id)a3;
- (void)setVoiceSearchTypeOptions:(int64_t)a3;
- (void)setVoiceTriggerEventInfo:(id)a3;
@end

@implementation AFDictationOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplingInfo, 0);
  objc_storeStrong((id *)&self->_languageDetectionUserContext, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_recognitionOverrides, 0);
  objc_storeStrong((id *)&self->_originalAudioFileURL, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_voiceSearchQueryParameters, 0);
  objc_storeStrong((id *)&self->_voiceSearchHeaderFields, 0);
  objc_storeStrong((id *)&self->_offlineLanguage, 0);
  objc_storeStrong((id *)&self->_languageCodeOverride, 0);
  objc_storeStrong((id *)&self->_keyboardIdentifier, 0);
  objc_storeStrong((id *)&self->_orthography, 0);
  objc_storeStrong((id *)&self->_microphoneIdentifier, 0);
  objc_storeStrong((id *)&self->_inlineItemList, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_postfixText, 0);
  objc_storeStrong((id *)&self->_prefixText, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_fieldIdentifier, 0);
  objc_storeStrong((id *)&self->_fieldLabel, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
}

- (void)setShouldGenerateVoiceCommandCandidates:(BOOL)a3
{
  self->_shouldGenerateVoiceCommandCandidates = a3;
}

- (BOOL)shouldGenerateVoiceCommandCandidates
{
  return self->_shouldGenerateVoiceCommandCandidates;
}

- (void)setShouldRecognizeCommands:(BOOL)a3
{
  self->_shouldRecognizeCommands = a3;
}

- (BOOL)shouldRecognizeCommands
{
  return self->_shouldRecognizeCommands;
}

- (void)setShouldClassifyIntent:(BOOL)a3
{
  self->_shouldClassifyIntent = a3;
}

- (BOOL)shouldClassifyIntent
{
  return self->_shouldClassifyIntent;
}

- (void)setSamplingInfo:(id)a3
{
}

- (NSString)samplingInfo
{
  return self->_samplingInfo;
}

- (void)setDictationInputOrigin:(int64_t)a3
{
  self->_dictationInputOrigin = a3;
}

- (int64_t)dictationInputOrigin
{
  return self->_dictationInputOrigin;
}

- (void)setLanguageDetectionUserContext:(id)a3
{
}

- (AFLanguageDetectionUserContext)languageDetectionUserContext
{
  return self->_languageDetectionUserContext;
}

- (void)setModelOverrideURL:(id)a3
{
}

- (NSURL)modelOverrideURL
{
  return self->_modelOverrideURL;
}

- (void)setRecognitionOverrides:(id)a3
{
}

- (NSDictionary)recognitionOverrides
{
  return self->_recognitionOverrides;
}

- (void)setOriginalAudioFileURL:(id)a3
{
}

- (NSURL)originalAudioFileURL
{
  return self->_originalAudioFileURL;
}

- (void)setTaskHint:(int64_t)a3
{
  self->_taskHint = a3;
}

- (int64_t)taskHint
{
  return self->_taskHint;
}

- (void)setMaximumRecognitionDuration:(double)a3
{
  self->_maximumRecognitionDuration = a3;
}

- (double)maximumRecognitionDuration
{
  return self->_maximumRecognitionDuration;
}

- (void)setIncremental:(BOOL)a3
{
  self->_incremental = a3;
}

- (BOOL)incremental
{
  return self->_incremental;
}

- (void)setReleaseAudioSessionOnRecordingCompletion:(BOOL)a3
{
  self->_releaseAudioSessionOnRecordingCompletion = a3;
}

- (BOOL)releaseAudioSessionOnRecordingCompletion
{
  return self->_releaseAudioSessionOnRecordingCompletion;
}

- (void)setFarField:(BOOL)a3
{
  self->_farField = a3;
}

- (BOOL)farField
{
  return self->_farField;
}

- (void)setSecureOfflineOnly:(BOOL)a3
{
  self->_secureOfflineOnly = a3;
}

- (BOOL)secureOfflineOnly
{
  return self->_secureOfflineOnly;
}

- (void)setPreferOnDeviceRecognition:(BOOL)a3
{
  self->_preferOnDeviceRecognition = a3;
}

- (BOOL)preferOnDeviceRecognition
{
  return self->_preferOnDeviceRecognition;
}

- (void)setEmojiRecognition:(BOOL)a3
{
  self->_emojiRecognition = a3;
}

- (BOOL)emojiRecognition
{
  return self->_emojiRecognition;
}

- (void)setAutoPunctuation:(BOOL)a3
{
  self->_autoPunctuation = a3;
}

- (BOOL)autoPunctuation
{
  return self->_autoPunctuation;
}

- (void)setShouldHandleCapitalization:(BOOL)a3
{
  self->_shouldHandleCapitalization = a3;
}

- (BOOL)shouldHandleCapitalization
{
  return self->_shouldHandleCapitalization;
}

- (void)setContinuousListening:(BOOL)a3
{
  self->_continuousListening = a3;
}

- (BOOL)continuousListening
{
  return self->_continuousListening;
}

- (void)setDetectUtterances:(BOOL)a3
{
  self->_detectUtterances = a3;
}

- (BOOL)detectUtterances
{
  return self->_detectUtterances;
}

- (void)setPreferOnlineRecognition:(BOOL)a3
{
  self->_preferOnlineRecognition = a3;
}

- (BOOL)preferOnlineRecognition
{
  return self->_preferOnlineRecognition;
}

- (void)setForceOfflineRecognition:(BOOL)a3
{
  self->_forceOfflineRecognition = a3;
}

- (BOOL)forceOfflineRecognition
{
  return self->_forceOfflineRecognition;
}

- (void)setVoiceTriggerEventInfo:(id)a3
{
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (void)setVoiceSearchQueryParameters:(id)a3
{
}

- (NSDictionary)voiceSearchQueryParameters
{
  return self->_voiceSearchQueryParameters;
}

- (void)setVoiceSearchHeaderFields:(id)a3
{
}

- (NSDictionary)voiceSearchHeaderFields
{
  return self->_voiceSearchHeaderFields;
}

- (void)setVoiceSearchTypeOptions:(int64_t)a3
{
  self->_voiceSearchTypeOptions = a3;
}

- (int64_t)voiceSearchTypeOptions
{
  return self->_voiceSearchTypeOptions;
}

- (void)setOfflineLanguage:(id)a3
{
}

- (NSString)offlineLanguage
{
  return self->_offlineLanguage;
}

- (void)setLanguageCodeOverride:(id)a3
{
}

- (NSString)languageCodeOverride
{
  return self->_languageCodeOverride;
}

- (void)setKeyboardIdentifier:(id)a3
{
}

- (NSString)keyboardIdentifier
{
  return self->_keyboardIdentifier;
}

- (void)setOrthography:(id)a3
{
}

- (NSString)orthography
{
  return self->_orthography;
}

- (void)setMicrophoneIdentifier:(id)a3
{
}

- (NSString)microphoneIdentifier
{
  return self->_microphoneIdentifier;
}

- (void)setInlineItemList:(id)a3
{
}

- (NSArray)inlineItemList
{
  return self->_inlineItemList;
}

- (void)setTranscriptionMode:(int64_t)a3
{
  self->_transcriptionMode = a3;
}

- (int64_t)transcriptionMode
{
  return self->_transcriptionMode;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setSelectedText:(id)a3
{
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void)setPostfixText:(id)a3
{
}

- (NSString)postfixText
{
  return self->_postfixText;
}

- (void)setPrefixText:(id)a3
{
}

- (NSString)prefixText
{
  return self->_prefixText;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setInteractionIdentifier:(id)a3
{
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (void)setFieldIdentifier:(id)a3
{
}

- (NSString)fieldIdentifier
{
  return self->_fieldIdentifier;
}

- (void)setFieldLabel:(id)a3
{
}

- (NSString)fieldLabel
{
  return self->_fieldLabel;
}

- (void)setContext:(id)a3
{
}

- (STSiriContext)context
{
  return self->_context;
}

- (void)setApplicationVersion:(id)a3
{
}

- (NSString)applicationVersion
{
  return self->_applicationVersion;
}

- (void)setApplicationDisplayName:(id)a3
{
}

- (NSString)applicationDisplayName
{
  return self->_applicationDisplayName;
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (AFDictationOptions)dictationOptionsWithoutTextContext
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  v4 = [(AFDictationOptions *)self applicationName];
  [v3 setApplicationName:v4];

  v5 = [(AFDictationOptions *)self applicationDisplayName];
  [v3 setApplicationDisplayName:v5];

  v6 = [(AFDictationOptions *)self applicationVersion];
  [v3 setApplicationVersion:v6];

  v7 = [(AFDictationOptions *)self context];
  [v3 setContext:v7];

  v8 = [(AFDictationOptions *)self fieldLabel];
  [v3 setFieldLabel:v8];

  v9 = [(AFDictationOptions *)self fieldIdentifier];
  [v3 setFieldIdentifier:v9];

  v10 = [(AFDictationOptions *)self interactionIdentifier];
  [v3 setInteractionIdentifier:v10];

  v11 = [(AFDictationOptions *)self requestIdentifier];
  [v3 setRequestIdentifier:v11];

  objc_msgSend(v3, "setKeyboardType:", -[AFDictationOptions keyboardType](self, "keyboardType"));
  objc_msgSend(v3, "setReturnKeyType:", -[AFDictationOptions returnKeyType](self, "returnKeyType"));
  v12 = [(AFDictationOptions *)self languageCodeOverride];
  [v3 setLanguageCodeOverride:v12];

  v13 = [(AFDictationOptions *)self offlineLanguage];
  [v3 setOfflineLanguage:v13];

  objc_msgSend(v3, "setTranscriptionMode:", -[AFDictationOptions transcriptionMode](self, "transcriptionMode"));
  v14 = [(AFDictationOptions *)self microphoneIdentifier];
  [v3 setMicrophoneIdentifier:v14];

  objc_msgSend(v3, "setVoiceSearchTypeOptions:", -[AFDictationOptions voiceSearchTypeOptions](self, "voiceSearchTypeOptions"));
  v15 = [(AFDictationOptions *)self voiceSearchHeaderFields];
  [v3 setVoiceSearchHeaderFields:v15];

  v16 = [(AFDictationOptions *)self voiceSearchQueryParameters];
  [v3 setVoiceSearchQueryParameters:v16];

  v17 = [(AFDictationOptions *)self voiceTriggerEventInfo];
  [v3 setVoiceTriggerEventInfo:v17];

  objc_msgSend(v3, "setForceOfflineRecognition:", -[AFDictationOptions forceOfflineRecognition](self, "forceOfflineRecognition"));
  objc_msgSend(v3, "setPreferOnlineRecognition:", -[AFDictationOptions preferOnlineRecognition](self, "preferOnlineRecognition"));
  objc_msgSend(v3, "setDetectUtterances:", -[AFDictationOptions detectUtterances](self, "detectUtterances"));
  objc_msgSend(v3, "setContinuousListening:", -[AFDictationOptions continuousListening](self, "continuousListening"));
  objc_msgSend(v3, "setShouldHandleCapitalization:", -[AFDictationOptions shouldHandleCapitalization](self, "shouldHandleCapitalization"));
  objc_msgSend(v3, "setAutoPunctuation:", -[AFDictationOptions autoPunctuation](self, "autoPunctuation"));
  objc_msgSend(v3, "setEmojiRecognition:", -[AFDictationOptions emojiRecognition](self, "emojiRecognition"));
  objc_msgSend(v3, "setPreferOnDeviceRecognition:", -[AFDictationOptions preferOnDeviceRecognition](self, "preferOnDeviceRecognition"));
  objc_msgSend(v3, "setSecureOfflineOnly:", -[AFDictationOptions secureOfflineOnly](self, "secureOfflineOnly"));
  objc_msgSend(v3, "setFarField:", -[AFDictationOptions farField](self, "farField"));
  v18 = [(AFDictationOptions *)self orthography];
  [v3 setOrthography:v18];

  v19 = [(AFDictationOptions *)self keyboardIdentifier];
  [v3 setKeyboardIdentifier:v19];

  objc_msgSend(v3, "setReleaseAudioSessionOnRecordingCompletion:", -[AFDictationOptions releaseAudioSessionOnRecordingCompletion](self, "releaseAudioSessionOnRecordingCompletion"));
  objc_msgSend(v3, "setIncremental:", -[AFDictationOptions incremental](self, "incremental"));
  [(AFDictationOptions *)self maximumRecognitionDuration];
  objc_msgSend(v3, "setMaximumRecognitionDuration:");
  objc_msgSend(v3, "setTaskHint:", -[AFDictationOptions taskHint](self, "taskHint"));
  v20 = [(AFDictationOptions *)self originalAudioFileURL];
  [v3 setOriginalAudioFileURL:v20];

  v21 = [(AFDictationOptions *)self recognitionOverrides];
  [v3 setRecognitionOverrides:v21];

  v22 = [(AFDictationOptions *)self modelOverrideURL];
  [v3 setModelOverrideURL:v22];

  v23 = [(AFDictationOptions *)self inlineItemList];
  [v3 setInlineItemList:v23];

  v24 = [(AFDictationOptions *)self languageDetectionUserContext];
  [v3 setLanguageDetectionUserContext:v24];

  objc_msgSend(v3, "setDictationInputOrigin:", -[AFDictationOptions dictationInputOrigin](self, "dictationInputOrigin"));
  v25 = [(AFDictationOptions *)self samplingInfo];
  [v3 setSamplingInfo:v25];

  objc_msgSend(v3, "setShouldClassifyIntent:", -[AFDictationOptions shouldClassifyIntent](self, "shouldClassifyIntent"));
  objc_msgSend(v3, "setShouldRecognizeCommands:", -[AFDictationOptions shouldRecognizeCommands](self, "shouldRecognizeCommands"));
  objc_msgSend(v3, "setShouldGenerateVoiceCommandCandidates:", -[AFDictationOptions shouldGenerateVoiceCommandCandidates](self, "shouldGenerateVoiceCommandCandidates"));
  return (AFDictationOptions *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(AFDictationOptions *)self dictationOptionsWithoutTextContext];
  v5 = [(AFDictationOptions *)self prefixText];
  [v4 setPrefixText:v5];

  v6 = [(AFDictationOptions *)self postfixText];
  [v4 setPostfixText:v6];

  v7 = [(AFDictationOptions *)self selectedText];
  [v4 setSelectedText:v7];

  return v4;
}

- (AFDictationOptions)initWithCoder:(id)a3
{
  v72[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)AFDictationOptions;
  v5 = [(AFDictationOptions *)&v69 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_applicationName"];
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_applicationDisplayName"];
    applicationDisplayName = v5->_applicationDisplayName;
    v5->_applicationDisplayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_applicationVersion"];
    applicationVersion = v5->_applicationVersion;
    v5->_applicationVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_context"];
    context = v5->_context;
    v5->_context = (STSiriContext *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fieldLabel"];
    fieldLabel = v5->_fieldLabel;
    v5->_fieldLabel = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fieldIdentifier"];
    fieldIdentifier = v5->_fieldIdentifier;
    v5->_fieldIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_interactionIdentifier"];
    interactionIdentifier = v5->_interactionIdentifier;
    v5->_interactionIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requestIdentifier"];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v20;

    v5->_keyboardType = [v4 decodeIntegerForKey:@"_keyboardType"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_prefixText"];
    prefixText = v5->_prefixText;
    v5->_prefixText = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_postfixText"];
    postfixText = v5->_postfixText;
    v5->_postfixText = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_selectedText"];
    selectedText = v5->_selectedText;
    v5->_selectedText = (NSString *)v26;

    v5->_returnKeyType = [v4 decodeIntegerForKey:@"_returnKeyType"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_languageCodeOverride"];
    languageCodeOverride = v5->_languageCodeOverride;
    v5->_languageCodeOverride = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_offlineLanguage"];
    offlineLanguage = v5->_offlineLanguage;
    v5->_offlineLanguage = (NSString *)v30;

    v5->_transcriptionMode = [v4 decodeIntegerForKey:@"_transcriptionMode"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_microphoneIdentifier"];
    microphoneIdentifier = v5->_microphoneIdentifier;
    v5->_microphoneIdentifier = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_orthography"];
    orthography = v5->_orthography;
    v5->_orthography = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_keyboardIdentifier"];
    keyboardIdentifier = v5->_keyboardIdentifier;
    v5->_keyboardIdentifier = (NSString *)v36;

    v38 = (void *)MEMORY[0x1E4F1CAD0];
    v72[0] = objc_opt_class();
    v72[1] = objc_opt_class();
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
    v40 = [v38 setWithArray:v39];
    uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"_inlineItemList"];
    inlineItemList = v5->_inlineItemList;
    v5->_inlineItemList = (NSArray *)v41;

    v5->_voiceSearchTypeOptions = [v4 decodeIntegerForKey:@"_voiceSearchTypeOptions"];
    v43 = (void *)MEMORY[0x1E4F1CAD0];
    v71[0] = objc_opt_class();
    v71[1] = objc_opt_class();
    v71[2] = objc_opt_class();
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:3];
    v45 = [v43 setWithArray:v44];
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"_voiceSearchHeaderFields"];
    voiceSearchHeaderFields = v5->_voiceSearchHeaderFields;
    v5->_voiceSearchHeaderFields = (NSDictionary *)v46;

    v48 = (void *)MEMORY[0x1E4F1CAD0];
    v70[0] = objc_opt_class();
    v70[1] = objc_opt_class();
    v70[2] = objc_opt_class();
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];
    v50 = [v48 setWithArray:v49];
    uint64_t v51 = [v4 decodeObjectOfClasses:v50 forKey:@"_voiceSearchQueryParameters"];
    voiceSearchQueryParameters = v5->_voiceSearchQueryParameters;
    v5->_voiceSearchQueryParameters = (NSDictionary *)v51;

    uint64_t v53 = [v4 decodePropertyListForKey:@"_voiceTriggerEventInfo"];
    voiceTriggerEventInfo = v5->_voiceTriggerEventInfo;
    v5->_voiceTriggerEventInfo = (NSDictionary *)v53;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v55 = v5->_voiceTriggerEventInfo;
      v5->_voiceTriggerEventInfo = 0;
    }
    v5->_forceOfflineRecognition = [v4 decodeBoolForKey:@"_forceOfflineRecognition"];
    v5->_preferOnlineRecognition = [v4 decodeBoolForKey:@"_preferOnlineRecognition"];
    v5->_detectUtterances = [v4 decodeBoolForKey:@"_detectUtterances"];
    v5->_continuousListening = [v4 decodeBoolForKey:@"_continuousListening"];
    v5->_shouldHandleCapitalization = [v4 decodeBoolForKey:@"_shouldHandleCapitalization"];
    v5->_autoPunctuation = [v4 decodeBoolForKey:@"_autoPunctuation"];
    v5->_emojiRecognition = [v4 decodeBoolForKey:@"_emojiRecognition"];
    v5->_preferOnDeviceRecognition = [v4 decodeBoolForKey:@"_preferOnDeviceRecognition"];
    v5->_secureOfflineOnly = [v4 decodeBoolForKey:@"_secureOfflineOnly"];
    v5->_farField = [v4 decodeBoolForKey:@"_farField"];
    v5->_releaseAudioSessionOnRecordingCompletion = [v4 decodeBoolForKey:@"_releaseAudioSessionOnRecordingCompletion"];
    v5->_incremental = [v4 decodeBoolForKey:@"_incremental"];
    [v4 decodeDoubleForKey:@"_maximumRecognitionDuration"];
    v5->_maximumRecognitionDuration = v56;
    v5->_taskHint = [v4 decodeIntegerForKey:@"_taskHint"];
    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originalAudioFileURL"];
    originalAudioFileURL = v5->_originalAudioFileURL;
    v5->_originalAudioFileURL = (NSURL *)v57;

    uint64_t v59 = [v4 decodePropertyListForKey:@"_recognitionOverrides"];
    recognitionOverrides = v5->_recognitionOverrides;
    v5->_recognitionOverrides = (NSDictionary *)v59;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v61 = v5->_recognitionOverrides;
      v5->_recognitionOverrides = 0;
    }
    uint64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_modelOverrideURL"];
    modelOverrideURL = v5->_modelOverrideURL;
    v5->_modelOverrideURL = (NSURL *)v62;

    uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_languageDetectionUserContext"];
    languageDetectionUserContext = v5->_languageDetectionUserContext;
    v5->_languageDetectionUserContext = (AFLanguageDetectionUserContext *)v64;

    v5->_dictationInputOrigin = [v4 decodeIntegerForKey:@"_dictationInputOrigin"];
    uint64_t v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_samplingInfo"];
    samplingInfo = v5->_samplingInfo;
    v5->_samplingInfo = (NSString *)v66;

    v5->_shouldClassifyIntent = [v4 decodeBoolForKey:@"_shouldClassifyIntent"];
    v5->_shouldRecognizeCommands = [v4 decodeBoolForKey:@"_shouldRecognizeCommands"];
    v5->_shouldGenerateVoiceCommandCandidates = [v4 decodeBoolForKey:@"_shouldGenerateVoiceCommandCandidates"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  applicationName = self->_applicationName;
  id v5 = a3;
  [v5 encodeObject:applicationName forKey:@"_applicationName"];
  [v5 encodeObject:self->_applicationDisplayName forKey:@"_applicationDisplayName"];
  [v5 encodeObject:self->_applicationVersion forKey:@"_applicationVersion"];
  [v5 encodeObject:self->_context forKey:@"_context"];
  [v5 encodeObject:self->_fieldLabel forKey:@"_fieldLabel"];
  [v5 encodeObject:self->_fieldIdentifier forKey:@"_fieldIdentifier"];
  [v5 encodeObject:self->_interactionIdentifier forKey:@"_interactionIdentifier"];
  [v5 encodeObject:self->_requestIdentifier forKey:@"_requestIdentifier"];
  [v5 encodeInteger:self->_keyboardType forKey:@"_keyboardType"];
  [v5 encodeObject:self->_prefixText forKey:@"_prefixText"];
  [v5 encodeObject:self->_postfixText forKey:@"_postfixText"];
  [v5 encodeObject:self->_selectedText forKey:@"_selectedText"];
  [v5 encodeInteger:self->_returnKeyType forKey:@"_returnKeyType"];
  [v5 encodeObject:self->_languageCodeOverride forKey:@"_languageCodeOverride"];
  [v5 encodeObject:self->_offlineLanguage forKey:@"_offlineLanguage"];
  [v5 encodeInteger:self->_transcriptionMode forKey:@"_transcriptionMode"];
  [v5 encodeObject:self->_microphoneIdentifier forKey:@"_microphoneIdentifier"];
  [v5 encodeObject:self->_inlineItemList forKey:@"_inlineItemList"];
  [v5 encodeInteger:self->_voiceSearchTypeOptions forKey:@"_voiceSearchTypeOptions"];
  [v5 encodeObject:self->_voiceSearchHeaderFields forKey:@"_voiceSearchHeaderFields"];
  [v5 encodeObject:self->_voiceSearchQueryParameters forKey:@"_voiceSearchQueryParameters"];
  [v5 encodeObject:self->_voiceTriggerEventInfo forKey:@"_voiceTriggerEventInfo"];
  [v5 encodeObject:self->_orthography forKey:@"_orthography"];
  [v5 encodeObject:self->_keyboardIdentifier forKey:@"_keyboardIdentifier"];
  [v5 encodeBool:self->_forceOfflineRecognition forKey:@"_forceOfflineRecognition"];
  [v5 encodeBool:self->_preferOnlineRecognition forKey:@"_preferOnlineRecognition"];
  [v5 encodeBool:self->_detectUtterances forKey:@"_detectUtterances"];
  [v5 encodeBool:self->_continuousListening forKey:@"_continuousListening"];
  [v5 encodeBool:self->_shouldHandleCapitalization forKey:@"_shouldHandleCapitalization"];
  [v5 encodeBool:self->_autoPunctuation forKey:@"_autoPunctuation"];
  [v5 encodeBool:self->_emojiRecognition forKey:@"_emojiRecognition"];
  [v5 encodeBool:self->_preferOnDeviceRecognition forKey:@"_preferOnDeviceRecognition"];
  [v5 encodeBool:self->_secureOfflineOnly forKey:@"_secureOfflineOnly"];
  [v5 encodeBool:self->_farField forKey:@"_farField"];
  [v5 encodeBool:self->_releaseAudioSessionOnRecordingCompletion forKey:@"_releaseAudioSessionOnRecordingCompletion"];
  [v5 encodeBool:self->_incremental forKey:@"_incremental"];
  [v5 encodeDouble:@"_maximumRecognitionDuration" forKey:self->_maximumRecognitionDuration];
  [v5 encodeInteger:self->_taskHint forKey:@"_taskHint"];
  [v5 encodeObject:self->_originalAudioFileURL forKey:@"_originalAudioFileURL"];
  [v5 encodeObject:self->_recognitionOverrides forKey:@"_recognitionOverrides"];
  [v5 encodeObject:self->_modelOverrideURL forKey:@"_modelOverrideURL"];
  [v5 encodeObject:self->_languageDetectionUserContext forKey:@"_languageDetectionUserContext"];
  [v5 encodeInteger:self->_dictationInputOrigin forKey:@"_dictationInputOrigin"];
  [v5 encodeObject:self->_samplingInfo forKey:@"_samplingInfo"];
  [v5 encodeBool:self->_shouldClassifyIntent forKey:@"_shouldClassifyIntent"];
  [v5 encodeBool:self->_shouldRecognizeCommands forKey:@"_shouldRecognizeCommands"];
  [v5 encodeBool:self->_shouldGenerateVoiceCommandCandidates forKey:@"_shouldGenerateVoiceCommandCandidates"];
}

- (AFDictationOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)AFDictationOptions;
  result = [(AFDictationOptions *)&v3 init];
  if (result) {
    result->_maximumRecognitionDuration = 120.0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end