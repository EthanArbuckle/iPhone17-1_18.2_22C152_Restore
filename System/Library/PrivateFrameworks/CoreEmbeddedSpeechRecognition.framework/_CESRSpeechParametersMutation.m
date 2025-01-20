@interface _CESRSpeechParametersMutation
- (_CESRSpeechParametersMutation)init;
- (_CESRSpeechParametersMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setApplicationName:(id)a3;
- (void)setAsrId:(id)a3;
- (void)setCensorSpeech:(BOOL)a3;
- (void)setCodec:(id)a3;
- (void)setContinuousListening:(BOOL)a3;
- (void)setDeliverEagerPackage:(BOOL)a3;
- (void)setDetectUtterances:(BOOL)a3;
- (void)setDictationUIInteractionIdentifier:(id)a3;
- (void)setDisableDeliveringAsrFeatures:(BOOL)a3;
- (void)setEnableAutoPunctuation:(BOOL)a3;
- (void)setEnableEmojiRecognition:(BOOL)a3;
- (void)setEnableVoiceCommands:(BOOL)a3;
- (void)setEndpointStart:(double)a3;
- (void)setFarField:(BOOL)a3;
- (void)setInputOrigin:(id)a3;
- (void)setIsSpeechAPIRequest:(BOOL)a3;
- (void)setJitGrammar:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLoggingContext:(id)a3;
- (void)setMaximumRecognitionDuration:(double)a3;
- (void)setModelOverrideURL:(id)a3;
- (void)setNarrowband:(BOOL)a3;
- (void)setOriginalAudioFileURL:(id)a3;
- (void)setOverrides:(id)a3;
- (void)setPostfixText:(id)a3;
- (void)setPowerContext:(id)a3;
- (void)setPrefixText:(id)a3;
- (void)setProfile:(id)a3;
- (void)setRecognitionStart:(double)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setSecureOfflineOnly:(BOOL)a3;
- (void)setSelectedText:(id)a3;
- (void)setSharedUserInfos:(id)a3;
- (void)setShouldGenerateVoiceCommandCandidates:(BOOL)a3;
- (void)setShouldHandleCapitalization:(BOOL)a3;
- (void)setShouldStoreAudioOnDevice:(BOOL)a3;
- (void)setTask:(id)a3;
@end

@implementation _CESRSpeechParametersMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asrId, 0);
  objc_storeStrong((id *)&self->_powerContext, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_postfixText, 0);
  objc_storeStrong((id *)&self->_prefixText, 0);
  objc_storeStrong((id *)&self->_sharedUserInfos, 0);
  objc_storeStrong((id *)&self->_jitGrammar, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_originalAudioFileURL, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_loggingContext, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_dictationUIInteractionIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v6 = [CESRSpeechParameters alloc];
    LOBYTE(v29) = self->_shouldGenerateVoiceCommandCandidates;
    *(_DWORD *)((char *)&v28 + 1) = *(_DWORD *)&self->_disableDeliveringAsrFeatures;
    LOBYTE(v28) = self->_deliverEagerPackage;
    *(void *)((char *)&v27 + 1) = *(void *)&self->_detectUtterances;
    LOBYTE(v27) = self->_narrowband;
    uint64_t v5 = -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:](v6, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:", self->_language, self->_requestIdentifier, self->_dictationUIInteractionIdentifier, self->_task, self->_loggingContext, self->_applicationName, self->_maximumRecognitionDuration, self->_endpointStart, self->_recognitionStart, self->_profile, self->_overrides, self->_modelOverrideURL,
           self->_originalAudioFileURL,
           self->_codec,
           v27,
           self->_inputOrigin,
           self->_location,
           self->_jitGrammar,
           v28,
           self->_sharedUserInfos,
           self->_prefixText,
           self->_postfixText,
           self->_selectedText,
           self->_powerContext,
           v29,
           self->_asrId);
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)&self->_mutationFlags;
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [(CESRSpeechParameters *)baseModel copy];
LABEL_5:
    v7 = (CESRSpeechParameters *)v5;
    goto LABEL_103;
  }
  if ((v4 & 2) != 0)
  {
    v55 = self->_language;
  }
  else
  {
    v55 = [(CESRSpeechParameters *)baseModel language];
  }
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v54 = self->_requestIdentifier;
  }
  else
  {
    v54 = [(CESRSpeechParameters *)self->_baseModel requestIdentifier];
  }
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v53 = self->_dictationUIInteractionIdentifier;
  }
  else
  {
    v53 = [(CESRSpeechParameters *)self->_baseModel dictationUIInteractionIdentifier];
  }
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v52 = self->_task;
  }
  else
  {
    v52 = [(CESRSpeechParameters *)self->_baseModel task];
  }
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
  {
    v51 = self->_loggingContext;
  }
  else
  {
    v51 = [(CESRSpeechParameters *)self->_baseModel loggingContext];
  }
  if ((*(unsigned char *)&self->_mutationFlags & 0x40) != 0)
  {
    v50 = self->_applicationName;
  }
  else
  {
    v50 = [(CESRSpeechParameters *)self->_baseModel applicationName];
  }
  if ((*(unsigned char *)&self->_mutationFlags & 0x80) != 0)
  {
    v49 = self->_profile;
  }
  else
  {
    v49 = [(CESRSpeechParameters *)self->_baseModel profile];
  }
  if (*((unsigned char *)&self->_mutationFlags + 1))
  {
    v48 = self->_overrides;
  }
  else
  {
    v48 = [(CESRSpeechParameters *)self->_baseModel overrides];
  }
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 2) != 0)
  {
    v47 = self->_modelOverrideURL;
  }
  else
  {
    v47 = [(CESRSpeechParameters *)self->_baseModel modelOverrideURL];
  }
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 4) != 0)
  {
    v46 = self->_originalAudioFileURL;
  }
  else
  {
    v46 = [(CESRSpeechParameters *)self->_baseModel originalAudioFileURL];
  }
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 8) != 0)
  {
    v45 = self->_codec;
  }
  else
  {
    v45 = [(CESRSpeechParameters *)self->_baseModel codec];
  }
  uint64_t v8 = *(void *)&self->_mutationFlags;
  if ((v8 & 0x1000) != 0)
  {
    BOOL narrowband = self->_narrowband;
    if ((v8 & 0x2000) != 0)
    {
LABEL_41:
      BOOL detectUtterances = self->_detectUtterances;
      if ((v8 & 0x4000) != 0) {
        goto LABEL_42;
      }
      goto LABEL_54;
    }
  }
  else
  {
    BOOL narrowband = [(CESRSpeechParameters *)self->_baseModel narrowband];
    uint64_t v8 = *(void *)&self->_mutationFlags;
    if ((v8 & 0x2000) != 0) {
      goto LABEL_41;
    }
  }
  BOOL detectUtterances = [(CESRSpeechParameters *)self->_baseModel detectUtterances];
  uint64_t v8 = *(void *)&self->_mutationFlags;
  if ((v8 & 0x4000) != 0)
  {
LABEL_42:
    BOOL censorSpeech = self->_censorSpeech;
    if ((v8 & 0x8000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_55;
  }
LABEL_54:
  BOOL censorSpeech = [(CESRSpeechParameters *)self->_baseModel censorSpeech];
  uint64_t v8 = *(void *)&self->_mutationFlags;
  if ((v8 & 0x8000) != 0)
  {
LABEL_43:
    BOOL farField = self->_farField;
    if ((v8 & 0x10000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_56;
  }
LABEL_55:
  BOOL farField = [(CESRSpeechParameters *)self->_baseModel farField];
  uint64_t v8 = *(void *)&self->_mutationFlags;
  if ((v8 & 0x10000) != 0)
  {
LABEL_44:
    BOOL secureOfflineOnly = self->_secureOfflineOnly;
    if ((v8 & 0x20000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_57;
  }
LABEL_56:
  BOOL secureOfflineOnly = [(CESRSpeechParameters *)self->_baseModel secureOfflineOnly];
  uint64_t v8 = *(void *)&self->_mutationFlags;
  if ((v8 & 0x20000) != 0)
  {
LABEL_45:
    BOOL shouldStoreAudioOnDevice = self->_shouldStoreAudioOnDevice;
    if ((v8 & 0x40000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_58;
  }
LABEL_57:
  BOOL shouldStoreAudioOnDevice = [(CESRSpeechParameters *)self->_baseModel shouldStoreAudioOnDevice];
  uint64_t v8 = *(void *)&self->_mutationFlags;
  if ((v8 & 0x40000) != 0)
  {
LABEL_46:
    BOOL continuousListening = self->_continuousListening;
    if ((v8 & 0x80000) != 0) {
      goto LABEL_47;
    }
    goto LABEL_59;
  }
LABEL_58:
  BOOL continuousListening = [(CESRSpeechParameters *)self->_baseModel continuousListening];
  uint64_t v8 = *(void *)&self->_mutationFlags;
  if ((v8 & 0x80000) != 0)
  {
LABEL_47:
    BOOL shouldHandleCapitalization = self->_shouldHandleCapitalization;
    if ((v8 & 0x100000) != 0) {
      goto LABEL_48;
    }
    goto LABEL_60;
  }
LABEL_59:
  BOOL shouldHandleCapitalization = [(CESRSpeechParameters *)self->_baseModel shouldHandleCapitalization];
  uint64_t v8 = *(void *)&self->_mutationFlags;
  if ((v8 & 0x100000) != 0)
  {
LABEL_48:
    BOOL isSpeechAPIRequest = self->_isSpeechAPIRequest;
    if ((v8 & 0x200000) != 0) {
      goto LABEL_49;
    }
    goto LABEL_61;
  }
LABEL_60:
  BOOL isSpeechAPIRequest = [(CESRSpeechParameters *)self->_baseModel isSpeechAPIRequest];
  uint64_t v8 = *(void *)&self->_mutationFlags;
  if ((v8 & 0x200000) != 0)
  {
LABEL_49:
    double maximumRecognitionDuration = self->_maximumRecognitionDuration;
    if ((v8 & 0x400000) != 0) {
      goto LABEL_50;
    }
LABEL_62:
    [(CESRSpeechParameters *)self->_baseModel endpointStart];
    double endpointStart = v14;
    if ((*(void *)&self->_mutationFlags & 0x800000) != 0) {
      goto LABEL_51;
    }
    goto LABEL_63;
  }
LABEL_61:
  [(CESRSpeechParameters *)self->_baseModel maximumRecognitionDuration];
  double maximumRecognitionDuration = v13;
  uint64_t v8 = *(void *)&self->_mutationFlags;
  if ((v8 & 0x400000) == 0) {
    goto LABEL_62;
  }
LABEL_50:
  double endpointStart = self->_endpointStart;
  if ((v8 & 0x800000) != 0)
  {
LABEL_51:
    v43 = self->_inputOrigin;
    goto LABEL_64;
  }
LABEL_63:
  v43 = [(CESRSpeechParameters *)self->_baseModel inputOrigin];

LABEL_64:
  if (*((unsigned char *)&self->_mutationFlags + 3))
  {
    v40 = self->_location;
  }
  else
  {
    v40 = [(CESRSpeechParameters *)self->_baseModel location];
  }
  if ((*((unsigned char *)&self->_mutationFlags + 3) & 2) != 0)
  {
    v35 = self->_jitGrammar;
  }
  else
  {
    v35 = [(CESRSpeechParameters *)self->_baseModel jitGrammar];
  }
  uint64_t v15 = *(void *)&self->_mutationFlags;
  if ((v15 & 0x4000000) != 0)
  {
    BOOL deliverEagerPackage = self->_deliverEagerPackage;
    if ((v15 & 0x8000000) != 0)
    {
LABEL_72:
      BOOL disableDeliveringAsrFeatures = self->_disableDeliveringAsrFeatures;
      if ((v15 & 0x10000000) != 0) {
        goto LABEL_73;
      }
      goto LABEL_79;
    }
  }
  else
  {
    BOOL deliverEagerPackage = [(CESRSpeechParameters *)self->_baseModel deliverEagerPackage];
    uint64_t v15 = *(void *)&self->_mutationFlags;
    if ((v15 & 0x8000000) != 0) {
      goto LABEL_72;
    }
  }
  BOOL disableDeliveringAsrFeatures = [(CESRSpeechParameters *)self->_baseModel disableDeliveringAsrFeatures];
  uint64_t v15 = *(void *)&self->_mutationFlags;
  if ((v15 & 0x10000000) != 0)
  {
LABEL_73:
    BOOL enableEmojiRecognition = self->_enableEmojiRecognition;
    if ((v15 & 0x20000000) != 0) {
      goto LABEL_74;
    }
    goto LABEL_80;
  }
LABEL_79:
  BOOL enableEmojiRecognition = [(CESRSpeechParameters *)self->_baseModel enableEmojiRecognition];
  uint64_t v15 = *(void *)&self->_mutationFlags;
  if ((v15 & 0x20000000) != 0)
  {
LABEL_74:
    BOOL enableAutoPunctuation = self->_enableAutoPunctuation;
    if ((v15 & 0x40000000) != 0) {
      goto LABEL_75;
    }
LABEL_81:
    BOOL enableVoiceCommands = [(CESRSpeechParameters *)self->_baseModel enableVoiceCommands];
    if ((*(void *)&self->_mutationFlags & 0x80000000) != 0) {
      goto LABEL_76;
    }
    goto LABEL_82;
  }
LABEL_80:
  BOOL enableAutoPunctuation = [(CESRSpeechParameters *)self->_baseModel enableAutoPunctuation];
  uint64_t v15 = *(void *)&self->_mutationFlags;
  if ((v15 & 0x40000000) == 0) {
    goto LABEL_81;
  }
LABEL_75:
  BOOL enableVoiceCommands = self->_enableVoiceCommands;
  if ((v15 & 0x80000000) != 0)
  {
LABEL_76:
    v34 = self->_sharedUserInfos;
    goto LABEL_83;
  }
LABEL_82:
  v34 = [(CESRSpeechParameters *)self->_baseModel sharedUserInfos];

LABEL_83:
  if (*(unsigned char *)(&self->_mutationFlags + 1))
  {
    v31 = self->_prefixText;
  }
  else
  {
    v31 = [(CESRSpeechParameters *)self->_baseModel prefixText];
  }
  if ((*(unsigned char *)(&self->_mutationFlags + 1) & 2) != 0)
  {
    v19 = self->_postfixText;
  }
  else
  {
    v19 = [(CESRSpeechParameters *)self->_baseModel postfixText];
  }
  if ((*(unsigned char *)(&self->_mutationFlags + 1) & 4) != 0)
  {
    v20 = self->_selectedText;
  }
  else
  {
    v20 = [(CESRSpeechParameters *)self->_baseModel selectedText];
  }
  if ((*(unsigned char *)(&self->_mutationFlags + 1) & 8) != 0)
  {
    v21 = self->_powerContext;
  }
  else
  {
    v21 = [(CESRSpeechParameters *)self->_baseModel powerContext];
  }
  uint64_t v22 = *(void *)&self->_mutationFlags;
  if ((v22 & 0x1000000000) == 0)
  {
    [(CESRSpeechParameters *)self->_baseModel recognitionStart];
    double recognitionStart = v23;
    uint64_t v22 = *(void *)&self->_mutationFlags;
    if ((v22 & 0x2000000000) != 0) {
      goto LABEL_97;
    }
LABEL_100:
    BOOL shouldGenerateVoiceCommandCandidates = [(CESRSpeechParameters *)self->_baseModel shouldGenerateVoiceCommandCandidates];
    if ((*(void *)&self->_mutationFlags & 0x4000000000) != 0) {
      goto LABEL_98;
    }
LABEL_101:
    v25 = [(CESRSpeechParameters *)self->_baseModel asrId];

    goto LABEL_102;
  }
  double recognitionStart = self->_recognitionStart;
  if ((v22 & 0x2000000000) == 0) {
    goto LABEL_100;
  }
LABEL_97:
  BOOL shouldGenerateVoiceCommandCandidates = self->_shouldGenerateVoiceCommandCandidates;
  if ((v22 & 0x4000000000) == 0) {
    goto LABEL_101;
  }
LABEL_98:
  v25 = self->_asrId;
LABEL_102:
  LOBYTE(v29) = shouldGenerateVoiceCommandCandidates;
  BYTE4(v28) = enableVoiceCommands;
  BYTE3(v28) = enableAutoPunctuation;
  BYTE2(v28) = enableEmojiRecognition;
  BYTE1(v28) = disableDeliveringAsrFeatures;
  LOBYTE(v28) = deliverEagerPackage;
  BYTE8(v27) = isSpeechAPIRequest;
  BYTE7(v27) = shouldHandleCapitalization;
  BYTE6(v27) = continuousListening;
  BYTE5(v27) = shouldStoreAudioOnDevice;
  BYTE4(v27) = secureOfflineOnly;
  BYTE3(v27) = farField;
  BYTE2(v27) = censorSpeech;
  BYTE1(v27) = detectUtterances;
  LOBYTE(v27) = narrowband;
  v7 = -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:]([CESRSpeechParameters alloc], "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:", v55, v54, v53, v52, v51, v50, maximumRecognitionDuration, endpointStart, recognitionStart, v49, v48, v47,
         v46,
         v45,
         v27,
         v43,
         v40,
         v35,
         v28,
         v34,
         v31,
         v19,
         v20,
         v21,
         v29,
         v25);

LABEL_103:

  return v7;
}

- (void)setAsrId:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x4000000001uLL;
}

- (void)setShouldGenerateVoiceCommandCandidates:(BOOL)a3
{
  self->_BOOL shouldGenerateVoiceCommandCandidates = a3;
  *(void *)&self->_mutationFlags |= 0x2000000001uLL;
}

- (void)setRecognitionStart:(double)a3
{
  self->_double recognitionStart = a3;
  *(void *)&self->_mutationFlags |= 0x1000000001uLL;
}

- (void)setPowerContext:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x800000001uLL;
}

- (void)setSelectedText:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x400000001uLL;
}

- (void)setPostfixText:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x200000001uLL;
}

- (void)setPrefixText:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x100000001uLL;
}

- (void)setSharedUserInfos:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x80000001uLL;
}

- (void)setEnableVoiceCommands:(BOOL)a3
{
  self->_BOOL enableVoiceCommands = a3;
  *(void *)&self->_mutationFlags |= 0x40000001uLL;
}

- (void)setEnableAutoPunctuation:(BOOL)a3
{
  self->_BOOL enableAutoPunctuation = a3;
  *(void *)&self->_mutationFlags |= 0x20000001uLL;
}

- (void)setEnableEmojiRecognition:(BOOL)a3
{
  self->_BOOL enableEmojiRecognition = a3;
  *(void *)&self->_mutationFlags |= 0x10000001uLL;
}

- (void)setDisableDeliveringAsrFeatures:(BOOL)a3
{
  self->_BOOL disableDeliveringAsrFeatures = a3;
  *(void *)&self->_mutationFlags |= 0x8000001uLL;
}

- (void)setDeliverEagerPackage:(BOOL)a3
{
  self->_BOOL deliverEagerPackage = a3;
  *(void *)&self->_mutationFlags |= 0x4000001uLL;
}

- (void)setJitGrammar:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x2000001uLL;
}

- (void)setLocation:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x1000001uLL;
}

- (void)setInputOrigin:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x800001uLL;
}

- (void)setEndpointStart:(double)a3
{
  self->_double endpointStart = a3;
  *(void *)&self->_mutationFlags |= 0x400001uLL;
}

- (void)setMaximumRecognitionDuration:(double)a3
{
  self->_double maximumRecognitionDuration = a3;
  *(void *)&self->_mutationFlags |= 0x200001uLL;
}

- (void)setIsSpeechAPIRequest:(BOOL)a3
{
  self->_BOOL isSpeechAPIRequest = a3;
  *(void *)&self->_mutationFlags |= 0x100001uLL;
}

- (void)setShouldHandleCapitalization:(BOOL)a3
{
  self->_BOOL shouldHandleCapitalization = a3;
  *(void *)&self->_mutationFlags |= 0x80001uLL;
}

- (void)setContinuousListening:(BOOL)a3
{
  self->_BOOL continuousListening = a3;
  *(void *)&self->_mutationFlags |= 0x40001uLL;
}

- (void)setShouldStoreAudioOnDevice:(BOOL)a3
{
  self->_BOOL shouldStoreAudioOnDevice = a3;
  *(void *)&self->_mutationFlags |= 0x20001uLL;
}

- (void)setSecureOfflineOnly:(BOOL)a3
{
  self->_BOOL secureOfflineOnly = a3;
  *(void *)&self->_mutationFlags |= 0x10001uLL;
}

- (void)setFarField:(BOOL)a3
{
  self->_BOOL farField = a3;
  *(void *)&self->_mutationFlags |= 0x8001uLL;
}

- (void)setCensorSpeech:(BOOL)a3
{
  self->_BOOL censorSpeech = a3;
  *(void *)&self->_mutationFlags |= 0x4001uLL;
}

- (void)setDetectUtterances:(BOOL)a3
{
  self->_BOOL detectUtterances = a3;
  *(void *)&self->_mutationFlags |= 0x2001uLL;
}

- (void)setNarrowband:(BOOL)a3
{
  self->_BOOL narrowband = a3;
  *(void *)&self->_mutationFlags |= 0x1001uLL;
}

- (void)setCodec:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x801uLL;
}

- (void)setOriginalAudioFileURL:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x401uLL;
}

- (void)setModelOverrideURL:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x201uLL;
}

- (void)setOverrides:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x101uLL;
}

- (void)setProfile:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x81uLL;
}

- (void)setApplicationName:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x41uLL;
}

- (void)setLoggingContext:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x21uLL;
}

- (void)setTask:(id)a3
{
  *(void *)&self->_mutationFlags |= 0x11uLL;
}

- (void)setDictationUIInteractionIdentifier:(id)a3
{
  *(void *)&self->_mutationFlags |= 9uLL;
}

- (void)setRequestIdentifier:(id)a3
{
  *(void *)&self->_mutationFlags |= 5uLL;
}

- (void)setLanguage:(id)a3
{
  *(void *)&self->_mutationFlags |= 3uLL;
}

- (_CESRSpeechParametersMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CESRSpeechParametersMutation;
  v6 = [(_CESRSpeechParametersMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_CESRSpeechParametersMutation)init
{
  return [(_CESRSpeechParametersMutation *)self initWithBaseModel:0];
}

@end