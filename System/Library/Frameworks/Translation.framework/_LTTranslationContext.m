@interface _LTTranslationContext
+ (BOOL)supportsSecureCoding;
- (BOOL)autoEndpoint;
- (BOOL)autodetectLanguage;
- (BOOL)cancelOnCleanup;
- (BOOL)censorSpeech;
- (BOOL)cleanUpExistingSpeechSession;
- (BOOL)enableVAD;
- (BOOL)forceSourceLocale;
- (BOOL)isFinal;
- (BOOL)muteTTSBasedOnRingerSwitchIfPossible;
- (BOOL)overrideOngoingSessionIfNeeded;
- (BOOL)supportsGenderDisambiguation;
- (NSArray)asrModelURLs;
- (NSString)appIdentifier;
- (NSString)clientIdentifier;
- (NSString)sessionID;
- (NSString)trustedClientIdentifier;
- (NSString)uniqueID;
- (NSString)untrustedClientIdentifier;
- (NSURL)mtModelURL;
- (NSURL)outputFileURL;
- (NSURL)sourceURL;
- (NSUUID)logIdentifier;
- (_LTLocalePair)localePair;
- (_LTTranslationContext)init;
- (_LTTranslationContext)initWithCoder:(id)a3;
- (double)ttsPlaybackRate;
- (id)sanitizedCopyForUntrustedTextTranslation;
- (int64_t)asrConfidenceThreshold;
- (int64_t)dataSharingOptInStatus;
- (int64_t)lidThreshold;
- (int64_t)route;
- (int64_t)sourceOrigin;
- (int64_t)taskHint;
- (unsigned)audioSessionID;
- (void)clientIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setAsrConfidenceThreshold:(int64_t)a3;
- (void)setAsrModelURLs:(id)a3;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setAutoEndpoint:(BOOL)a3;
- (void)setAutodetectLanguage:(BOOL)a3;
- (void)setCancelOnCleanup:(BOOL)a3;
- (void)setCensorSpeech:(BOOL)a3;
- (void)setCleanUpExistingSpeechSession:(BOOL)a3;
- (void)setDataSharingOptInStatus:(int64_t)a3;
- (void)setEnableVAD:(BOOL)a3;
- (void)setForceSourceLocale:(BOOL)a3;
- (void)setIsFinal:(BOOL)a3;
- (void)setLidThreshold:(int64_t)a3;
- (void)setLocalePair:(id)a3;
- (void)setLogIdentifier:(id)a3;
- (void)setMtModelURL:(id)a3;
- (void)setMuteTTSBasedOnRingerSwitchIfPossible:(BOOL)a3;
- (void)setOutputFileURL:(id)a3;
- (void)setOverrideOngoingSessionIfNeeded:(BOOL)a3;
- (void)setRoute:(int64_t)a3;
- (void)setSessionID:(id)a3;
- (void)setSourceOrigin:(int64_t)a3;
- (void)setSourceURL:(id)a3;
- (void)setSupportsGenderDisambiguation:(BOOL)a3;
- (void)setTaskHint:(int64_t)a3;
- (void)setTrustedClientIdentifier:(id)a3;
- (void)setTtsPlaybackRate:(double)a3;
- (void)setUniqueID:(id)a3;
- (void)setUntrustedClientIdentifier:(id)a3;
@end

@implementation _LTTranslationContext

- (_LTTranslationContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)_LTTranslationContext;
  v2 = [(_LTTranslationContext *)&v8 init];
  v3 = (_LTTranslationContext *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 88) = xmmword_2463E7660;
    *((void *)v2 + 13) = -1;
    v2[14] = 1;
    v2[9] = 0;
    v2[12] = 0;
    v4 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    logIdentifier = v3->_logIdentifier;
    v3->_logIdentifier = v4;

    v6 = v3;
  }

  return v3;
}

- (_LTTranslationContext)initWithCoder:(id)a3
{
  v33[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_LTTranslationContext;
  v5 = [(_LTTranslationContext *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v8;

    v5->_taskHint = [v4 decodeIntegerForKey:@"taskHint"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localePair"];
    localePair = v5->_localePair;
    v5->_localePair = (_LTLocalePair *)v10;

    v5->_autodetectLanguage = [v4 decodeBoolForKey:@"autodetectLanguage"];
    v5->_forceSourceLocale = [v4 decodeBoolForKey:@"forceSourceLocale"];
    v5->_autoEndpoint = [v4 decodeBoolForKey:@"autoEndpoint"];
    v5->_censorSpeech = [v4 decodeBoolForKey:@"censorSpeech"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outputFileURL"];
    outputFileURL = v5->_outputFileURL;
    v5->_outputFileURL = (NSURL *)v12;

    v14 = (void *)MEMORY[0x263EFFA08];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
    v16 = [v14 setWithArray:v15];

    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"asrModelURLs"];
    asrModelURLs = v5->_asrModelURLs;
    v5->_asrModelURLs = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mtModelURL"];
    mtModelURL = v5->_mtModelURL;
    v5->_mtModelURL = (NSURL *)v19;

    v5->_route = [v4 decodeIntegerForKey:@"route"];
    v5->_audioSessionID = [v4 decodeInt32ForKey:@"audioSessionID"];
    v5->_lidThreshold = [v4 decodeIntegerForKey:@"lidThreshold"];
    v5->_asrConfidenceThreshold = [v4 decodeIntegerForKey:@"asrConfidenceThreshold"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceURL"];
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v21;

    [v4 decodeDoubleForKey:@"ttsPlaybackRate"];
    v5->_ttsPlaybackRate = v23;
    v5->_muteTTSBasedOnRingerSwitchIfPossible = [v4 decodeBoolForKey:@"muteTTSBasedOnRingerSwitchIfPossible"];
    v5->_enableVAD = [v4 decodeBoolForKey:@"enableVAD"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appIdentifier"];
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v24;

    v5->_sourceOrigin = [v4 decodeIntegerForKey:@"sourceOrigin"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"untrustedClientIdentifier"];
    untrustedClientIdentifier = v5->_untrustedClientIdentifier;
    v5->_untrustedClientIdentifier = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logIdentifier"];
    logIdentifier = v5->_logIdentifier;
    v5->_logIdentifier = (NSUUID *)v28;

    v5->_isFinal = [v4 decodeBoolForKey:@"isFinal"];
    v5->_supportsGenderDisambiguation = [v4 decodeBoolForKey:@"supportsGenderDisambiguation"];
    v5->_overrideOngoingSessionIfNeeded = [v4 decodeBoolForKey:@"overrideOngoingSessionIfNeeded"];
    v5->_cancelOnCleanup = [v4 decodeBoolForKey:@"cancelOnCleanup"];
    v5->_cleanUpExistingSpeechSession = [v4 decodeBoolForKey:@"cleanUpExistingSpeechSession"];
    v30 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueID = self->_uniqueID;
  id v5 = a3;
  [v5 encodeObject:uniqueID forKey:@"uniqueID"];
  [v5 encodeObject:self->_sessionID forKey:@"sessionID"];
  [v5 encodeInteger:self->_taskHint forKey:@"taskHint"];
  [v5 encodeObject:self->_localePair forKey:@"localePair"];
  [v5 encodeBool:self->_autodetectLanguage forKey:@"autodetectLanguage"];
  [v5 encodeBool:self->_forceSourceLocale forKey:@"forceSourceLocale"];
  [v5 encodeBool:self->_autoEndpoint forKey:@"autoEndpoint"];
  [v5 encodeBool:self->_censorSpeech forKey:@"censorSpeech"];
  [v5 encodeObject:self->_outputFileURL forKey:@"outputFileURL"];
  [v5 encodeObject:self->_asrModelURLs forKey:@"asrModelURLs"];
  [v5 encodeObject:self->_mtModelURL forKey:@"mtModelURL"];
  [v5 encodeInteger:self->_route forKey:@"route"];
  [v5 encodeInt32:self->_audioSessionID forKey:@"audioSessionID"];
  [v5 encodeInteger:self->_lidThreshold forKey:@"lidThreshold"];
  [v5 encodeInteger:self->_asrConfidenceThreshold forKey:@"asrConfidenceThreshold"];
  [v5 encodeObject:self->_sourceURL forKey:@"sourceURL"];
  [v5 encodeDouble:@"ttsPlaybackRate" forKey:self->_ttsPlaybackRate];
  [v5 encodeBool:self->_muteTTSBasedOnRingerSwitchIfPossible forKey:@"muteTTSBasedOnRingerSwitchIfPossible"];
  [v5 encodeBool:self->_enableVAD forKey:@"enableVAD"];
  [v5 encodeObject:self->_appIdentifier forKey:@"appIdentifier"];
  [v5 encodeInteger:self->_sourceOrigin forKey:@"sourceOrigin"];
  [v5 encodeObject:self->_untrustedClientIdentifier forKey:@"untrustedClientIdentifier"];
  [v5 encodeObject:self->_logIdentifier forKey:@"logIdentifier"];
  [v5 encodeBool:self->_isFinal forKey:@"isFinal"];
  [v5 encodeBool:self->_supportsGenderDisambiguation forKey:@"supportsGenderDisambiguation"];
  [v5 encodeBool:self->_overrideOngoingSessionIfNeeded forKey:@"overrideOngoingSessionIfNeeded"];
  [v5 encodeBool:self->_cancelOnCleanup forKey:@"cancelOnCleanup"];
  [v5 encodeBool:self->_cleanUpExistingSpeechSession forKey:@"cleanUpExistingSpeechSession"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)sanitizedCopyForUntrustedTextTranslation
{
  v3 = objc_alloc_init(_LTTranslationContext);
  id v4 = [(_LTTranslationContext *)self uniqueID];
  id v5 = (void *)[v4 copy];
  [(_LTTranslationContext *)v3 setUniqueID:v5];

  uint64_t v6 = [(_LTTranslationContext *)self sessionID];
  v7 = (void *)[v6 copy];
  [(_LTTranslationContext *)v3 setSessionID:v7];

  [(_LTTranslationContext *)v3 setTaskHint:[(_LTTranslationContext *)self taskHint]];
  uint64_t v8 = [(_LTTranslationContext *)self localePair];
  v9 = (void *)[v8 copy];
  [(_LTTranslationContext *)v3 setLocalePair:v9];

  [(_LTTranslationContext *)v3 setAutodetectLanguage:[(_LTTranslationContext *)self autodetectLanguage]];
  [(_LTTranslationContext *)v3 setForceSourceLocale:[(_LTTranslationContext *)self forceSourceLocale]];
  [(_LTTranslationContext *)v3 setCensorSpeech:[(_LTTranslationContext *)self censorSpeech]];
  [(_LTTranslationContext *)v3 setAutoEndpoint:[(_LTTranslationContext *)self autoEndpoint]];
  [(_LTTranslationContext *)v3 setLidThreshold:[(_LTTranslationContext *)self lidThreshold]];
  [(_LTTranslationContext *)v3 setRoute:[(_LTTranslationContext *)self route]];
  uint64_t v10 = [(_LTTranslationContext *)self appIdentifier];
  v11 = (void *)[v10 copy];
  [(_LTTranslationContext *)v3 setAppIdentifier:v11];

  [(_LTTranslationContext *)v3 setSourceOrigin:[(_LTTranslationContext *)self sourceOrigin]];
  uint64_t v12 = [(_LTTranslationContext *)self logIdentifier];
  [(_LTTranslationContext *)v3 setLogIdentifier:v12];

  [(_LTTranslationContext *)v3 setIsFinal:[(_LTTranslationContext *)self isFinal]];
  [(_LTTranslationContext *)v3 setSupportsGenderDisambiguation:[(_LTTranslationContext *)self supportsGenderDisambiguation]];
  [(_LTTranslationContext *)v3 setCancelOnCleanup:[(_LTTranslationContext *)self cancelOnCleanup]];
  [(_LTTranslationContext *)v3 setCleanUpExistingSpeechSession:[(_LTTranslationContext *)self cleanUpExistingSpeechSession]];

  return v3;
}

- (NSString)clientIdentifier
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  p_trustedClientIdentifier = &self->_trustedClientIdentifier;
  trustedClientIdentifier = self->_trustedClientIdentifier;
  id v5 = _LTOSLogXPC();
  uint64_t v6 = v5;
  if (trustedClientIdentifier)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = *p_trustedClientIdentifier;
      int v10 = 138477827;
      v11 = v7;
      _os_log_impl(&dword_24639B000, v6, OS_LOG_TYPE_INFO, "Using trusted client identifier: %{private}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(_LTTranslationContext *)(uint64_t)self clientIdentifier];
    }
    p_trustedClientIdentifier = &self->_untrustedClientIdentifier;
  }
  uint64_t v8 = *p_trustedClientIdentifier;

  return v8;
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

- (void)setLocalePair:(id)a3
{
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

- (BOOL)censorSpeech
{
  return self->_censorSpeech;
}

- (void)setCensorSpeech:(BOOL)a3
{
  self->_censorSpeech = a3;
}

- (NSURL)outputFileURL
{
  return self->_outputFileURL;
}

- (void)setOutputFileURL:(id)a3
{
}

- (NSArray)asrModelURLs
{
  return self->_asrModelURLs;
}

- (void)setAsrModelURLs:(id)a3
{
}

- (NSURL)mtModelURL
{
  return self->_mtModelURL;
}

- (void)setMtModelURL:(id)a3
{
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (BOOL)autoEndpoint
{
  return self->_autoEndpoint;
}

- (void)setAutoEndpoint:(BOOL)a3
{
  self->_autoEndpoint = a3;
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

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (void)setIsFinal:(BOOL)a3
{
  self->_isFinal = a3;
}

- (int64_t)lidThreshold
{
  return self->_lidThreshold;
}

- (void)setLidThreshold:(int64_t)a3
{
  self->_lidThreshold = a3;
}

- (int64_t)route
{
  return self->_route;
}

- (void)setRoute:(int64_t)a3
{
  self->_route = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (int64_t)asrConfidenceThreshold
{
  return self->_asrConfidenceThreshold;
}

- (void)setAsrConfidenceThreshold:(int64_t)a3
{
  self->_asrConfidenceThreshold = a3;
}

- (double)ttsPlaybackRate
{
  return self->_ttsPlaybackRate;
}

- (void)setTtsPlaybackRate:(double)a3
{
  self->_ttsPlaybackRate = a3;
}

- (BOOL)muteTTSBasedOnRingerSwitchIfPossible
{
  return self->_muteTTSBasedOnRingerSwitchIfPossible;
}

- (void)setMuteTTSBasedOnRingerSwitchIfPossible:(BOOL)a3
{
  self->_muteTTSBasedOnRingerSwitchIfPossible = a3;
}

- (BOOL)enableVAD
{
  return self->_enableVAD;
}

- (void)setEnableVAD:(BOOL)a3
{
  self->_enableVAD = a3;
}

- (BOOL)cancelOnCleanup
{
  return self->_cancelOnCleanup;
}

- (void)setCancelOnCleanup:(BOOL)a3
{
  self->_cancelOnCleanup = a3;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSUUID)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setLogIdentifier:(id)a3
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

- (BOOL)supportsGenderDisambiguation
{
  return self->_supportsGenderDisambiguation;
}

- (void)setSupportsGenderDisambiguation:(BOOL)a3
{
  self->_supportsGenderDisambiguation = a3;
}

- (NSString)untrustedClientIdentifier
{
  return self->_untrustedClientIdentifier;
}

- (void)setUntrustedClientIdentifier:(id)a3
{
}

- (NSString)trustedClientIdentifier
{
  return self->_trustedClientIdentifier;
}

- (void)setTrustedClientIdentifier:(id)a3
{
}

- (int64_t)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (void)setDataSharingOptInStatus:(int64_t)a3
{
  self->_dataSharingOptInStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedClientIdentifier, 0);
  objc_storeStrong((id *)&self->_untrustedClientIdentifier, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_mtModelURL, 0);
  objc_storeStrong((id *)&self->_asrModelURLs, 0);
  objc_storeStrong((id *)&self->_outputFileURL, 0);
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (void)clientIdentifier
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 144);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_24639B000, a2, OS_LOG_TYPE_FAULT, "Failed to get trusted client identifier, falling back to untrusted value: %{private}@", (uint8_t *)&v3, 0xCu);
}

@end