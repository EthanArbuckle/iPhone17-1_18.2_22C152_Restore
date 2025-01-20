@interface _LTTranslationRequest
- (BOOL)_canUseTextService;
- (BOOL)_forcedOnlineTranslation;
- (BOOL)_supportsGenderDisambiguation;
- (BOOL)autodetectLanguage;
- (BOOL)censorSpeech;
- (BOOL)cleanUpExistingSpeechSession;
- (BOOL)forceSourceLocale;
- (BOOL)forcedOfflineTranslation;
- (BOOL)isFinal;
- (BOOL)overrideOngoingSessionIfNeeded;
- (NSString)appIdentifier;
- (NSString)loggingType;
- (NSString)qssSessionID;
- (NSString)sessionID;
- (NSString)uniqueID;
- (NSURL)_offlineMTModelURL;
- (NSURL)outputFileURL;
- (NSUUID)batchSessionUUID;
- (NSUUID)logIdentifier;
- (_LTLocalePair)localePair;
- (_LTTranslationRequest)initWithLocalePair:(id)a3;
- (_LTTranslationRequest)initWithLocalePair:(id)a3 suggestedUniqueID:(id)a4;
- (_LTTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4;
- (_LTTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4 suggestedUniqueID:(id)a5;
- (id)requestContext;
- (int64_t)_mtConfidenceThreshold;
- (int64_t)sourceOrigin;
- (int64_t)taskHint;
- (unsigned)audioSessionID;
- (void)requestContext;
- (void)setAppIdentifier:(id)a3;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setAutodetectLanguage:(BOOL)a3;
- (void)setBatchSessionUUID:(id)a3;
- (void)setCensorSpeech:(BOOL)a3;
- (void)setCleanUpExistingSpeechSession:(BOOL)a3;
- (void)setForceSourceLocale:(BOOL)a3;
- (void)setForcedOfflineTranslation:(BOOL)a3;
- (void)setIsFinal:(BOOL)a3;
- (void)setLogIdentifier:(id)a3;
- (void)setOutputFileURL:(id)a3;
- (void)setOverrideOngoingSessionIfNeeded:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setSourceOrigin:(int64_t)a3;
- (void)setTaskHint:(int64_t)a3;
- (void)setUniqueID:(id)a3;
- (void)set_forcedOnlineTranslation:(BOOL)a3;
- (void)set_mtConfidenceThreshold:(int64_t)a3;
- (void)set_offlineMTModelURL:(id)a3;
- (void)set_supportsGenderDisambiguation:(BOOL)a3;
@end

@implementation _LTTranslationRequest

- (NSString)loggingType
{
  return (NSString *)@"undefined";
}

- (_LTTranslationRequest)initWithLocalePair:(id)a3
{
  return [(_LTTranslationRequest *)self initWithLocalePair:a3 suggestedUniqueID:0];
}

- (_LTTranslationRequest)initWithLocalePair:(id)a3 suggestedUniqueID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_LTTranslationRequest;
  v9 = [(_LTTranslationRequest *)&v17 init];
  if (v9)
  {
    if (v8)
    {
      id v10 = v8;
      v11 = (void *)*((void *)v9 + 3);
      *((void *)v9 + 3) = v10;
    }
    else
    {
      v11 = [MEMORY[0x263F08C38] UUID];
      uint64_t v12 = [v11 UUIDString];
      v13 = (void *)*((void *)v9 + 3);
      *((void *)v9 + 3) = v12;
    }
    objc_storeStrong((id *)v9 + 6, a3);
    *(_WORD *)(v9 + 11) = 0;
    v9[8] = 0;
    *((void *)v9 + 9) = -1;
    *((void *)v9 + 5) = 1;
    *((void *)v9 + 11) = 0;
    v9[13] = 1;
    v14 = [MEMORY[0x263EF93E0] sharedInstance];
    *((_DWORD *)v9 + 5) = [v14 opaqueSessionID];

    v9[15] = 0;
    v15 = v9;
  }

  return (_LTTranslationRequest *)v9;
}

- (_LTTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _LTOSLogXPC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138478083;
    id v12 = v6;
    __int16 v13 = 2113;
    id v14 = v7;
    _os_log_impl(&dword_24639B000, v8, OS_LOG_TYPE_INFO, "Translation request with sourceLocale:%{private}@ targetLocale:%{private}@", (uint8_t *)&v11, 0x16u);
  }
  v9 = [(_LTTranslationRequest *)self initWithSourceLocale:v6 targetLocale:v7 suggestedUniqueID:0];

  return v9;
}

- (_LTTranslationRequest)initWithSourceLocale:(id)a3 targetLocale:(id)a4 suggestedUniqueID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [[_LTLocalePair alloc] initWithSourceLocale:v10 targetLocale:v9];

  id v12 = [(_LTTranslationRequest *)self initWithLocalePair:v11 suggestedUniqueID:v8];
  return v12;
}

- (NSString)qssSessionID
{
  v3 = [(_LTTranslationRequest *)self batchSessionUUID];

  if (v3)
  {
    v4 = [(_LTTranslationRequest *)self batchSessionUUID];
    v5 = [v4 UUIDString];
  }
  else
  {
    v5 = [(_LTTranslationRequest *)self uniqueID];
  }

  return (NSString *)v5;
}

- (BOOL)_canUseTextService
{
  return 0;
}

- (id)requestContext
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(_LTTranslationContext);
  v4 = [(_LTTranslationRequest *)self uniqueID];
  [(_LTTranslationContext *)v3 setUniqueID:v4];

  v5 = [(_LTTranslationRequest *)self sessionID];
  [(_LTTranslationContext *)v3 setSessionID:v5];

  [(_LTTranslationContext *)v3 setTaskHint:[(_LTTranslationRequest *)self taskHint]];
  id v6 = [(_LTTranslationRequest *)self localePair];
  [(_LTTranslationContext *)v3 setLocalePair:v6];

  [(_LTTranslationContext *)v3 setAutodetectLanguage:[(_LTTranslationRequest *)self autodetectLanguage]];
  [(_LTTranslationContext *)v3 setForceSourceLocale:[(_LTTranslationRequest *)self forceSourceLocale]];
  [(_LTTranslationContext *)v3 setCensorSpeech:[(_LTTranslationRequest *)self censorSpeech]];
  id v7 = [(_LTTranslationRequest *)self _offlineMTModelURL];
  [(_LTTranslationContext *)v3 setMtModelURL:v7];

  id v8 = [(_LTTranslationRequest *)self outputFileURL];
  [(_LTTranslationContext *)v3 setOutputFileURL:v8];

  [(_LTTranslationContext *)v3 setAudioSessionID:[(_LTTranslationRequest *)self audioSessionID]];
  id v9 = [(_LTTranslationRequest *)self appIdentifier];
  [(_LTTranslationContext *)v3 setAppIdentifier:v9];

  [(_LTTranslationContext *)v3 setSourceOrigin:[(_LTTranslationRequest *)self sourceOrigin]];
  id v10 = [MEMORY[0x263F086E0] mainBundle];
  int v11 = [v10 objectForInfoDictionaryKey:@"CFBundleIdentifier"];

  if (v11)
  {
    id v12 = _LTOSLogXPC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v17 = 138543362;
      v18 = v11;
      _os_log_impl(&dword_24639B000, v12, OS_LOG_TYPE_INFO, "Got untrusted client identifier from Info.plist: %{public}@", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    __int16 v13 = [MEMORY[0x263F08AB0] processInfo];
    int v11 = [v13 processName];

    id v14 = _LTOSLogXPC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_LTTranslationRequest requestContext]();
    }
  }
  id v15 = v11;

  [(_LTTranslationContext *)v3 setUntrustedClientIdentifier:v15];
  [(_LTTranslationContext *)v3 setLogIdentifier:self->_logIdentifier];
  [(_LTTranslationContext *)v3 setIsFinal:[(_LTTranslationRequest *)self isFinal]];
  [(_LTTranslationContext *)v3 setSupportsGenderDisambiguation:[(_LTTranslationRequest *)self _supportsGenderDisambiguation]];
  [(_LTTranslationContext *)v3 setOverrideOngoingSessionIfNeeded:[(_LTTranslationRequest *)self overrideOngoingSessionIfNeeded]];
  [(_LTTranslationContext *)v3 setCleanUpExistingSpeechSession:[(_LTTranslationRequest *)self cleanUpExistingSpeechSession]];
  [(_LTTranslationContext *)v3 setRoute:2];
  if ([(_LTTranslationRequest *)self forcedOfflineTranslation]) {
    [(_LTTranslationContext *)v3 setRoute:1];
  }

  return v3;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (int64_t)taskHint
{
  return self->_taskHint;
}

- (void)setTaskHint:(int64_t)a3
{
  self->_taskHint = a3;
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (NSURL)outputFileURL
{
  return self->_outputFileURL;
}

- (void)setOutputFileURL:(id)a3
{
}

- (BOOL)censorSpeech
{
  return self->_censorSpeech;
}

- (void)setCensorSpeech:(BOOL)a3
{
  self->_censorSpeech = a3;
}

- (BOOL)forcedOfflineTranslation
{
  return self->_forcedOfflineTranslation;
}

- (void)setForcedOfflineTranslation:(BOOL)a3
{
  self->_forcedOfflineTranslation = a3;
}

- (BOOL)_forcedOnlineTranslation
{
  return self->__forcedOnlineTranslation;
}

- (void)set_forcedOnlineTranslation:(BOOL)a3
{
  self->__forcedOnlineTranslation = a3;
}

- (NSURL)_offlineMTModelURL
{
  return self->__offlineMTModelURL;
}

- (void)set_offlineMTModelURL:(id)a3
{
}

- (int64_t)_mtConfidenceThreshold
{
  return self->__mtConfidenceThreshold;
}

- (void)set_mtConfidenceThreshold:(int64_t)a3
{
  self->__mtConfidenceThreshold = a3;
}

- (BOOL)autodetectLanguage
{
  return self->_autodetectLanguage;
}

- (void)setAutodetectLanguage:(BOOL)a3
{
  self->_autodetectLanguage = a3;
}

- (BOOL)forceSourceLocale
{
  return self->_forceSourceLocale;
}

- (void)setForceSourceLocale:(BOOL)a3
{
  self->_forceSourceLocale = a3;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (int64_t)sourceOrigin
{
  return self->_sourceOrigin;
}

- (void)setSourceOrigin:(int64_t)a3
{
  self->_sourceOrigin = a3;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (void)setIsFinal:(BOOL)a3
{
  self->_isFinal = a3;
}

- (BOOL)_supportsGenderDisambiguation
{
  return self->__supportsGenderDisambiguation;
}

- (void)set_supportsGenderDisambiguation:(BOOL)a3
{
  self->__supportsGenderDisambiguation = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (BOOL)overrideOngoingSessionIfNeeded
{
  return self->_overrideOngoingSessionIfNeeded;
}

- (void)setOverrideOngoingSessionIfNeeded:(BOOL)a3
{
  self->_overrideOngoingSessionIfNeeded = a3;
}

- (BOOL)cleanUpExistingSpeechSession
{
  return self->_cleanUpExistingSpeechSession;
}

- (void)setCleanUpExistingSpeechSession:(BOOL)a3
{
  self->_cleanUpExistingSpeechSession = a3;
}

- (NSUUID)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setLogIdentifier:(id)a3
{
}

- (NSUUID)batchSessionUUID
{
  return self->_batchSessionUUID;
}

- (void)setBatchSessionUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchSessionUUID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->__offlineMTModelURL, 0);
  objc_storeStrong((id *)&self->_outputFileURL, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (void)requestContext
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Unable to read untrusted client identifier from Info.plist; falling back to process name: %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

@end