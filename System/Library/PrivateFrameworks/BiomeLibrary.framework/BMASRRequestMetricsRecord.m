@interface BMASRRequestMetricsRecord
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMASRRequestMetricsRecord)initWithAsrId:(id)a3 requestId:(id)a4 timestamp:(id)a5 invocationType:(id)a6 triggerType:(id)a7 asrTask:(id)a8 bundleId:(id)a9 clientId:(id)a10 geoLMRegionId:(id)a11 locale:(id)a12 audioDurationMs:(id)a13 recognitionDurationMs:(id)a14 completionState:(int)a15 snrRatio:(id)a16 avgPitch:(id)a17 jitLmeUsed:(id)a18 aotLmeUsed:(id)a19 jitLmeRecognized:(id)a20 aotLmeRecognized:(id)a21 deviceClass:(id)a22 deviceType:(id)a23 deviceBuild:(id)a24 isSiriOptIn:(id)a25 isAssistantEnabled:(id)a26 isDictationEnabled:(id)a27 isMultipleDictationKeyboardsInstalled:(id)a28 enabledDictationLocales:(id)a29 activeDictationLanguages:(id)a30;
- (BMASRRequestMetricsRecord)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)aotLmeRecognized;
- (BOOL)aotLmeUsed;
- (BOOL)hasAotLmeRecognized;
- (BOOL)hasAotLmeUsed;
- (BOOL)hasAudioDurationMs;
- (BOOL)hasAvgPitch;
- (BOOL)hasIsAssistantEnabled;
- (BOOL)hasIsDictationEnabled;
- (BOOL)hasIsMultipleDictationKeyboardsInstalled;
- (BOOL)hasIsSiriOptIn;
- (BOOL)hasJitLmeRecognized;
- (BOOL)hasJitLmeUsed;
- (BOOL)hasRecognitionDurationMs;
- (BOOL)hasSnrRatio;
- (BOOL)hasTimestamp;
- (BOOL)isAssistantEnabled;
- (BOOL)isDictationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMultipleDictationKeyboardsInstalled;
- (BOOL)isSiriOptIn;
- (BOOL)jitLmeRecognized;
- (BOOL)jitLmeUsed;
- (NSArray)activeDictationLanguages;
- (NSArray)enabledDictationLocales;
- (NSString)asrId;
- (NSString)asrTask;
- (NSString)bundleId;
- (NSString)clientId;
- (NSString)description;
- (NSString)deviceBuild;
- (NSString)deviceClass;
- (NSString)deviceType;
- (NSString)geoLMRegionId;
- (NSString)invocationType;
- (NSString)locale;
- (NSString)requestId;
- (NSString)triggerType;
- (double)avgPitch;
- (double)snrRatio;
- (double)timestamp;
- (id)_activeDictationLanguagesJSONArray;
- (id)_enabledDictationLocalesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)completionState;
- (unsigned)audioDurationMs;
- (unsigned)dataVersion;
- (unsigned)recognitionDurationMs;
- (void)setHasAotLmeRecognized:(BOOL)a3;
- (void)setHasAotLmeUsed:(BOOL)a3;
- (void)setHasAudioDurationMs:(BOOL)a3;
- (void)setHasAvgPitch:(BOOL)a3;
- (void)setHasIsAssistantEnabled:(BOOL)a3;
- (void)setHasIsDictationEnabled:(BOOL)a3;
- (void)setHasIsMultipleDictationKeyboardsInstalled:(BOOL)a3;
- (void)setHasIsSiriOptIn:(BOOL)a3;
- (void)setHasJitLmeRecognized:(BOOL)a3;
- (void)setHasJitLmeUsed:(BOOL)a3;
- (void)setHasRecognitionDurationMs:(BOOL)a3;
- (void)setHasSnrRatio:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMASRRequestMetricsRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDictationLanguages, 0);
  objc_storeStrong((id *)&self->_enabledDictationLocales, 0);
  objc_storeStrong((id *)&self->_deviceBuild, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_geoLMRegionId, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_asrTask, 0);
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_invocationType, 0);
  objc_storeStrong((id *)&self->_requestId, 0);

  objc_storeStrong((id *)&self->_asrId, 0);
}

- (NSArray)activeDictationLanguages
{
  return self->_activeDictationLanguages;
}

- (NSArray)enabledDictationLocales
{
  return self->_enabledDictationLocales;
}

- (void)setHasIsMultipleDictationKeyboardsInstalled:(BOOL)a3
{
  self->_hasIsMultipleDictationKeyboardsInstalled = a3;
}

- (BOOL)hasIsMultipleDictationKeyboardsInstalled
{
  return self->_hasIsMultipleDictationKeyboardsInstalled;
}

- (BOOL)isMultipleDictationKeyboardsInstalled
{
  return self->_isMultipleDictationKeyboardsInstalled;
}

- (void)setHasIsDictationEnabled:(BOOL)a3
{
  self->_hasIsDictationEnabled = a3;
}

- (BOOL)hasIsDictationEnabled
{
  return self->_hasIsDictationEnabled;
}

- (BOOL)isDictationEnabled
{
  return self->_isDictationEnabled;
}

- (void)setHasIsAssistantEnabled:(BOOL)a3
{
  self->_hasIsAssistantEnabled = a3;
}

- (BOOL)hasIsAssistantEnabled
{
  return self->_hasIsAssistantEnabled;
}

- (BOOL)isAssistantEnabled
{
  return self->_isAssistantEnabled;
}

- (void)setHasIsSiriOptIn:(BOOL)a3
{
  self->_hasIsSiriOptIn = a3;
}

- (BOOL)hasIsSiriOptIn
{
  return self->_hasIsSiriOptIn;
}

- (BOOL)isSiriOptIn
{
  return self->_isSiriOptIn;
}

- (NSString)deviceBuild
{
  return self->_deviceBuild;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setHasAotLmeRecognized:(BOOL)a3
{
  self->_hasAotLmeRecognized = a3;
}

- (BOOL)hasAotLmeRecognized
{
  return self->_hasAotLmeRecognized;
}

- (BOOL)aotLmeRecognized
{
  return self->_aotLmeRecognized;
}

- (void)setHasJitLmeRecognized:(BOOL)a3
{
  self->_hasJitLmeRecognized = a3;
}

- (BOOL)hasJitLmeRecognized
{
  return self->_hasJitLmeRecognized;
}

- (BOOL)jitLmeRecognized
{
  return self->_jitLmeRecognized;
}

- (void)setHasAotLmeUsed:(BOOL)a3
{
  self->_hasAotLmeUsed = a3;
}

- (BOOL)hasAotLmeUsed
{
  return self->_hasAotLmeUsed;
}

- (BOOL)aotLmeUsed
{
  return self->_aotLmeUsed;
}

- (void)setHasJitLmeUsed:(BOOL)a3
{
  self->_hasJitLmeUsed = a3;
}

- (BOOL)hasJitLmeUsed
{
  return self->_hasJitLmeUsed;
}

- (BOOL)jitLmeUsed
{
  return self->_jitLmeUsed;
}

- (void)setHasAvgPitch:(BOOL)a3
{
  self->_hasAvgPitch = a3;
}

- (BOOL)hasAvgPitch
{
  return self->_hasAvgPitch;
}

- (double)avgPitch
{
  return self->_avgPitch;
}

- (void)setHasSnrRatio:(BOOL)a3
{
  self->_hasSnrRatio = a3;
}

- (BOOL)hasSnrRatio
{
  return self->_hasSnrRatio;
}

- (double)snrRatio
{
  return self->_snrRatio;
}

- (int)completionState
{
  return self->_completionState;
}

- (void)setHasRecognitionDurationMs:(BOOL)a3
{
  self->_hasRecognitionDurationMs = a3;
}

- (BOOL)hasRecognitionDurationMs
{
  return self->_hasRecognitionDurationMs;
}

- (unsigned)recognitionDurationMs
{
  return self->_recognitionDurationMs;
}

- (void)setHasAudioDurationMs:(BOOL)a3
{
  self->_hasAudioDurationMs = a3;
}

- (BOOL)hasAudioDurationMs
{
  return self->_hasAudioDurationMs;
}

- (unsigned)audioDurationMs
{
  return self->_audioDurationMs;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)geoLMRegionId
{
  return self->_geoLMRegionId;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)asrTask
{
  return self->_asrTask;
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (NSString)invocationType
{
  return self->_invocationType;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_hasTimestamp = a3;
}

- (BOOL)hasTimestamp
{
  return self->_hasTimestamp;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (NSString)asrId
{
  return self->_asrId;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMASRRequestMetricsRecord *)self asrId];
    uint64_t v7 = [v5 asrId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMASRRequestMetricsRecord *)self asrId];
      v10 = [v5 asrId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_119;
      }
    }
    v13 = [(BMASRRequestMetricsRecord *)self requestId];
    uint64_t v14 = [v5 requestId];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMASRRequestMetricsRecord *)self requestId];
      v17 = [v5 requestId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_119;
      }
    }
    if ([(BMASRRequestMetricsRecord *)self hasTimestamp]
      || [v5 hasTimestamp])
    {
      if (![(BMASRRequestMetricsRecord *)self hasTimestamp]) {
        goto LABEL_119;
      }
      if (![v5 hasTimestamp]) {
        goto LABEL_119;
      }
      [(BMASRRequestMetricsRecord *)self timestamp];
      double v20 = v19;
      [v5 timestamp];
      if (v20 != v21) {
        goto LABEL_119;
      }
    }
    v22 = [(BMASRRequestMetricsRecord *)self invocationType];
    uint64_t v23 = [v5 invocationType];
    if (v22 == (void *)v23)
    {
    }
    else
    {
      v24 = (void *)v23;
      v25 = [(BMASRRequestMetricsRecord *)self invocationType];
      v26 = [v5 invocationType];
      int v27 = [v25 isEqual:v26];

      if (!v27) {
        goto LABEL_119;
      }
    }
    v28 = [(BMASRRequestMetricsRecord *)self triggerType];
    uint64_t v29 = [v5 triggerType];
    if (v28 == (void *)v29)
    {
    }
    else
    {
      v30 = (void *)v29;
      v31 = [(BMASRRequestMetricsRecord *)self triggerType];
      v32 = [v5 triggerType];
      int v33 = [v31 isEqual:v32];

      if (!v33) {
        goto LABEL_119;
      }
    }
    v34 = [(BMASRRequestMetricsRecord *)self asrTask];
    uint64_t v35 = [v5 asrTask];
    if (v34 == (void *)v35)
    {
    }
    else
    {
      v36 = (void *)v35;
      v37 = [(BMASRRequestMetricsRecord *)self asrTask];
      v38 = [v5 asrTask];
      int v39 = [v37 isEqual:v38];

      if (!v39) {
        goto LABEL_119;
      }
    }
    v40 = [(BMASRRequestMetricsRecord *)self bundleId];
    uint64_t v41 = [v5 bundleId];
    if (v40 == (void *)v41)
    {
    }
    else
    {
      v42 = (void *)v41;
      v43 = [(BMASRRequestMetricsRecord *)self bundleId];
      v44 = [v5 bundleId];
      int v45 = [v43 isEqual:v44];

      if (!v45) {
        goto LABEL_119;
      }
    }
    v46 = [(BMASRRequestMetricsRecord *)self clientId];
    uint64_t v47 = [v5 clientId];
    if (v46 == (void *)v47)
    {
    }
    else
    {
      v48 = (void *)v47;
      v49 = [(BMASRRequestMetricsRecord *)self clientId];
      v50 = [v5 clientId];
      int v51 = [v49 isEqual:v50];

      if (!v51) {
        goto LABEL_119;
      }
    }
    v52 = [(BMASRRequestMetricsRecord *)self geoLMRegionId];
    uint64_t v53 = [v5 geoLMRegionId];
    if (v52 == (void *)v53)
    {
    }
    else
    {
      v54 = (void *)v53;
      v55 = [(BMASRRequestMetricsRecord *)self geoLMRegionId];
      v56 = [v5 geoLMRegionId];
      int v57 = [v55 isEqual:v56];

      if (!v57) {
        goto LABEL_119;
      }
    }
    v58 = [(BMASRRequestMetricsRecord *)self locale];
    uint64_t v59 = [v5 locale];
    if (v58 == (void *)v59)
    {
    }
    else
    {
      v60 = (void *)v59;
      v61 = [(BMASRRequestMetricsRecord *)self locale];
      v62 = [v5 locale];
      int v63 = [v61 isEqual:v62];

      if (!v63) {
        goto LABEL_119;
      }
    }
    if ([(BMASRRequestMetricsRecord *)self hasAudioDurationMs]
      || [v5 hasAudioDurationMs])
    {
      if (![(BMASRRequestMetricsRecord *)self hasAudioDurationMs]) {
        goto LABEL_119;
      }
      if (![v5 hasAudioDurationMs]) {
        goto LABEL_119;
      }
      unsigned int v64 = [(BMASRRequestMetricsRecord *)self audioDurationMs];
      if (v64 != [v5 audioDurationMs]) {
        goto LABEL_119;
      }
    }
    if ([(BMASRRequestMetricsRecord *)self hasRecognitionDurationMs]
      || [v5 hasRecognitionDurationMs])
    {
      if (![(BMASRRequestMetricsRecord *)self hasRecognitionDurationMs]) {
        goto LABEL_119;
      }
      if (![v5 hasRecognitionDurationMs]) {
        goto LABEL_119;
      }
      unsigned int v65 = [(BMASRRequestMetricsRecord *)self recognitionDurationMs];
      if (v65 != [v5 recognitionDurationMs]) {
        goto LABEL_119;
      }
    }
    int v66 = [(BMASRRequestMetricsRecord *)self completionState];
    if (v66 != [v5 completionState]) {
      goto LABEL_119;
    }
    if (-[BMASRRequestMetricsRecord hasSnrRatio](self, "hasSnrRatio") || [v5 hasSnrRatio])
    {
      if (![(BMASRRequestMetricsRecord *)self hasSnrRatio]) {
        goto LABEL_119;
      }
      if (![v5 hasSnrRatio]) {
        goto LABEL_119;
      }
      [(BMASRRequestMetricsRecord *)self snrRatio];
      double v68 = v67;
      [v5 snrRatio];
      if (v68 != v69) {
        goto LABEL_119;
      }
    }
    if (-[BMASRRequestMetricsRecord hasAvgPitch](self, "hasAvgPitch") || [v5 hasAvgPitch])
    {
      if (![(BMASRRequestMetricsRecord *)self hasAvgPitch]) {
        goto LABEL_119;
      }
      if (![v5 hasAvgPitch]) {
        goto LABEL_119;
      }
      [(BMASRRequestMetricsRecord *)self avgPitch];
      double v71 = v70;
      [v5 avgPitch];
      if (v71 != v72) {
        goto LABEL_119;
      }
    }
    if ([(BMASRRequestMetricsRecord *)self hasJitLmeUsed]
      || [v5 hasJitLmeUsed])
    {
      if (![(BMASRRequestMetricsRecord *)self hasJitLmeUsed]) {
        goto LABEL_119;
      }
      if (![v5 hasJitLmeUsed]) {
        goto LABEL_119;
      }
      int v73 = [(BMASRRequestMetricsRecord *)self jitLmeUsed];
      if (v73 != [v5 jitLmeUsed]) {
        goto LABEL_119;
      }
    }
    if ([(BMASRRequestMetricsRecord *)self hasAotLmeUsed]
      || [v5 hasAotLmeUsed])
    {
      if (![(BMASRRequestMetricsRecord *)self hasAotLmeUsed]) {
        goto LABEL_119;
      }
      if (![v5 hasAotLmeUsed]) {
        goto LABEL_119;
      }
      int v74 = [(BMASRRequestMetricsRecord *)self aotLmeUsed];
      if (v74 != [v5 aotLmeUsed]) {
        goto LABEL_119;
      }
    }
    if ([(BMASRRequestMetricsRecord *)self hasJitLmeRecognized]
      || [v5 hasJitLmeRecognized])
    {
      if (![(BMASRRequestMetricsRecord *)self hasJitLmeRecognized]) {
        goto LABEL_119;
      }
      if (![v5 hasJitLmeRecognized]) {
        goto LABEL_119;
      }
      int v75 = [(BMASRRequestMetricsRecord *)self jitLmeRecognized];
      if (v75 != [v5 jitLmeRecognized]) {
        goto LABEL_119;
      }
    }
    if ([(BMASRRequestMetricsRecord *)self hasAotLmeRecognized]
      || [v5 hasAotLmeRecognized])
    {
      if (![(BMASRRequestMetricsRecord *)self hasAotLmeRecognized]) {
        goto LABEL_119;
      }
      if (![v5 hasAotLmeRecognized]) {
        goto LABEL_119;
      }
      int v76 = [(BMASRRequestMetricsRecord *)self aotLmeRecognized];
      if (v76 != [v5 aotLmeRecognized]) {
        goto LABEL_119;
      }
    }
    v77 = [(BMASRRequestMetricsRecord *)self deviceClass];
    uint64_t v78 = [v5 deviceClass];
    if (v77 == (void *)v78)
    {
    }
    else
    {
      v79 = (void *)v78;
      v80 = [(BMASRRequestMetricsRecord *)self deviceClass];
      v81 = [v5 deviceClass];
      int v82 = [v80 isEqual:v81];

      if (!v82) {
        goto LABEL_119;
      }
    }
    v83 = [(BMASRRequestMetricsRecord *)self deviceType];
    uint64_t v84 = [v5 deviceType];
    if (v83 == (void *)v84)
    {
    }
    else
    {
      v85 = (void *)v84;
      v86 = [(BMASRRequestMetricsRecord *)self deviceType];
      v87 = [v5 deviceType];
      int v88 = [v86 isEqual:v87];

      if (!v88) {
        goto LABEL_119;
      }
    }
    v89 = [(BMASRRequestMetricsRecord *)self deviceBuild];
    uint64_t v90 = [v5 deviceBuild];
    if (v89 == (void *)v90)
    {
    }
    else
    {
      v91 = (void *)v90;
      v92 = [(BMASRRequestMetricsRecord *)self deviceBuild];
      v93 = [v5 deviceBuild];
      int v94 = [v92 isEqual:v93];

      if (!v94) {
        goto LABEL_119;
      }
    }
    if ([(BMASRRequestMetricsRecord *)self hasIsSiriOptIn]
      || [v5 hasIsSiriOptIn])
    {
      if (![(BMASRRequestMetricsRecord *)self hasIsSiriOptIn]) {
        goto LABEL_119;
      }
      if (![v5 hasIsSiriOptIn]) {
        goto LABEL_119;
      }
      int v95 = [(BMASRRequestMetricsRecord *)self isSiriOptIn];
      if (v95 != [v5 isSiriOptIn]) {
        goto LABEL_119;
      }
    }
    if ([(BMASRRequestMetricsRecord *)self hasIsAssistantEnabled]
      || [v5 hasIsAssistantEnabled])
    {
      if (![(BMASRRequestMetricsRecord *)self hasIsAssistantEnabled]) {
        goto LABEL_119;
      }
      if (![v5 hasIsAssistantEnabled]) {
        goto LABEL_119;
      }
      int v96 = [(BMASRRequestMetricsRecord *)self isAssistantEnabled];
      if (v96 != [v5 isAssistantEnabled]) {
        goto LABEL_119;
      }
    }
    if ([(BMASRRequestMetricsRecord *)self hasIsDictationEnabled]
      || [v5 hasIsDictationEnabled])
    {
      if (![(BMASRRequestMetricsRecord *)self hasIsDictationEnabled]) {
        goto LABEL_119;
      }
      if (![v5 hasIsDictationEnabled]) {
        goto LABEL_119;
      }
      int v97 = [(BMASRRequestMetricsRecord *)self isDictationEnabled];
      if (v97 != [v5 isDictationEnabled]) {
        goto LABEL_119;
      }
    }
    if (-[BMASRRequestMetricsRecord hasIsMultipleDictationKeyboardsInstalled](self, "hasIsMultipleDictationKeyboardsInstalled")|| [v5 hasIsMultipleDictationKeyboardsInstalled])
    {
      if (![(BMASRRequestMetricsRecord *)self hasIsMultipleDictationKeyboardsInstalled])goto LABEL_119; {
      if (![v5 hasIsMultipleDictationKeyboardsInstalled])
      }
        goto LABEL_119;
      int v98 = [(BMASRRequestMetricsRecord *)self isMultipleDictationKeyboardsInstalled];
      if (v98 != [v5 isMultipleDictationKeyboardsInstalled]) {
        goto LABEL_119;
      }
    }
    v99 = [(BMASRRequestMetricsRecord *)self enabledDictationLocales];
    uint64_t v100 = [v5 enabledDictationLocales];
    if (v99 == (void *)v100)
    {
    }
    else
    {
      v101 = (void *)v100;
      v102 = [(BMASRRequestMetricsRecord *)self enabledDictationLocales];
      v103 = [v5 enabledDictationLocales];
      int v104 = [v102 isEqual:v103];

      if (!v104)
      {
LABEL_119:
        char v12 = 0;
LABEL_120:

        goto LABEL_121;
      }
    }
    v106 = [(BMASRRequestMetricsRecord *)self activeDictationLanguages];
    v107 = [v5 activeDictationLanguages];
    if (v106 == v107)
    {
      char v12 = 1;
    }
    else
    {
      v108 = [(BMASRRequestMetricsRecord *)self activeDictationLanguages];
      v109 = [v5 activeDictationLanguages];
      char v12 = [v108 isEqual:v109];
    }
    goto LABEL_120;
  }
  char v12 = 0;
LABEL_121:

  return v12;
}

- (id)jsonDictionary
{
  v97[28] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMASRRequestMetricsRecord *)self asrId];
  id v4 = [(BMASRRequestMetricsRecord *)self requestId];
  if (![(BMASRRequestMetricsRecord *)self hasTimestamp]
    || ([(BMASRRequestMetricsRecord *)self timestamp], fabs(v5) == INFINITY))
  {
    id v7 = 0;
  }
  else
  {
    [(BMASRRequestMetricsRecord *)self timestamp];
    v6 = NSNumber;
    [(BMASRRequestMetricsRecord *)self timestamp];
    objc_msgSend(v6, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = [(BMASRRequestMetricsRecord *)self invocationType];
  uint64_t v9 = [(BMASRRequestMetricsRecord *)self triggerType];
  uint64_t v10 = [(BMASRRequestMetricsRecord *)self asrTask];
  int v11 = [(BMASRRequestMetricsRecord *)self bundleId];
  int v95 = [(BMASRRequestMetricsRecord *)self clientId];
  int v94 = [(BMASRRequestMetricsRecord *)self geoLMRegionId];
  v93 = [(BMASRRequestMetricsRecord *)self locale];
  if ([(BMASRRequestMetricsRecord *)self hasAudioDurationMs])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMASRRequestMetricsRecord audioDurationMs](self, "audioDurationMs"));
    id v92 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v92 = 0;
  }
  if ([(BMASRRequestMetricsRecord *)self hasRecognitionDurationMs])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMASRRequestMetricsRecord recognitionDurationMs](self, "recognitionDurationMs"));
    id v91 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v91 = 0;
  }
  uint64_t v90 = objc_msgSend(NSNumber, "numberWithInt:", -[BMASRRequestMetricsRecord completionState](self, "completionState"));
  if (![(BMASRRequestMetricsRecord *)self hasSnrRatio]
    || ([(BMASRRequestMetricsRecord *)self snrRatio], fabs(v12) == INFINITY))
  {
    id v89 = 0;
  }
  else
  {
    [(BMASRRequestMetricsRecord *)self snrRatio];
    v13 = NSNumber;
    [(BMASRRequestMetricsRecord *)self snrRatio];
    objc_msgSend(v13, "numberWithDouble:");
    id v89 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMASRRequestMetricsRecord *)self hasAvgPitch]
    || ([(BMASRRequestMetricsRecord *)self avgPitch], fabs(v14) == INFINITY))
  {
    id v88 = 0;
  }
  else
  {
    [(BMASRRequestMetricsRecord *)self avgPitch];
    v15 = NSNumber;
    [(BMASRRequestMetricsRecord *)self avgPitch];
    objc_msgSend(v15, "numberWithDouble:");
    id v88 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMASRRequestMetricsRecord *)self hasJitLmeUsed])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord jitLmeUsed](self, "jitLmeUsed"));
    id v87 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v87 = 0;
  }
  if ([(BMASRRequestMetricsRecord *)self hasAotLmeUsed])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord aotLmeUsed](self, "aotLmeUsed"));
    id v86 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v86 = 0;
  }
  if ([(BMASRRequestMetricsRecord *)self hasJitLmeRecognized])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord jitLmeRecognized](self, "jitLmeRecognized"));
    id v85 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v85 = 0;
  }
  if ([(BMASRRequestMetricsRecord *)self hasAotLmeRecognized])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord aotLmeRecognized](self, "aotLmeRecognized"));
    id v84 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v84 = 0;
  }
  v83 = [(BMASRRequestMetricsRecord *)self deviceClass];
  int v82 = [(BMASRRequestMetricsRecord *)self deviceType];
  v81 = [(BMASRRequestMetricsRecord *)self deviceBuild];
  if ([(BMASRRequestMetricsRecord *)self hasIsSiriOptIn])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord isSiriOptIn](self, "isSiriOptIn"));
    id v80 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v80 = 0;
  }
  if ([(BMASRRequestMetricsRecord *)self hasIsAssistantEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord isAssistantEnabled](self, "isAssistantEnabled"));
    id v79 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v79 = 0;
  }
  if ([(BMASRRequestMetricsRecord *)self hasIsDictationEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord isDictationEnabled](self, "isDictationEnabled"));
    id v78 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v78 = 0;
  }
  if ([(BMASRRequestMetricsRecord *)self hasIsMultipleDictationKeyboardsInstalled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord isMultipleDictationKeyboardsInstalled](self, "isMultipleDictationKeyboardsInstalled"));
    id v77 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v77 = 0;
  }
  int v76 = [(BMASRRequestMetricsRecord *)self _enabledDictationLocalesJSONArray];
  uint64_t v16 = [(BMASRRequestMetricsRecord *)self _activeDictationLanguagesJSONArray];
  v96[0] = @"asrId";
  uint64_t v17 = v3;
  if (!v3)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v66 = (void *)v17;
  v97[0] = v17;
  v96[1] = @"requestId";
  uint64_t v18 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v65 = (void *)v18;
  v97[1] = v18;
  v96[2] = @"timestamp";
  uint64_t v19 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v64 = (void *)v19;
  v97[2] = v19;
  v96[3] = @"invocationType";
  uint64_t v20 = v8;
  if (!v8)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  int v63 = (void *)v20;
  v97[3] = v20;
  v96[4] = @"triggerType";
  uint64_t v21 = v9;
  if (!v9)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v62 = (void *)v21;
  v97[4] = v21;
  v96[5] = @"asrTask";
  uint64_t v22 = v10;
  if (!v10)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v61 = (void *)v22;
  v97[5] = v22;
  v96[6] = @"bundleId";
  uint64_t v23 = (uint64_t)v11;
  if (!v11)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v60 = (void *)v23;
  v97[6] = v23;
  v96[7] = @"clientId";
  uint64_t v24 = (uint64_t)v95;
  if (!v95)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v97[7] = v24;
  v96[8] = @"geoLMRegionId";
  uint64_t v25 = (uint64_t)v94;
  if (!v94)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v97[8] = v25;
  v96[9] = @"locale";
  uint64_t v26 = (uint64_t)v93;
  if (!v93)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  double v70 = (void *)v26;
  v97[9] = v26;
  v96[10] = @"audioDurationMs";
  uint64_t v27 = (uint64_t)v92;
  if (!v92)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  double v68 = (void *)v10;
  double v69 = (void *)v27;
  v97[10] = v27;
  v96[11] = @"recognitionDurationMs";
  uint64_t v28 = (uint64_t)v91;
  if (!v91)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v29 = (void *)v28;
  v97[11] = v28;
  v96[12] = @"completionState";
  uint64_t v30 = (uint64_t)v90;
  if (!v90)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v58 = (void *)v30;
  v97[12] = v30;
  v96[13] = @"snrRatio";
  uint64_t v31 = (uint64_t)v89;
  if (!v89)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  int v57 = (void *)v31;
  v97[13] = v31;
  v96[14] = @"avgPitch";
  uint64_t v32 = (uint64_t)v88;
  if (!v88)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v56 = (void *)v32;
  v97[14] = v32;
  v96[15] = @"jitLmeUsed";
  uint64_t v33 = (uint64_t)v87;
  if (!v87)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v55 = (void *)v33;
  v97[15] = v33;
  v96[16] = @"aotLmeUsed";
  uint64_t v34 = (uint64_t)v86;
  if (!v86)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  int v73 = v7;
  v54 = (void *)v34;
  v97[16] = v34;
  v96[17] = @"jitLmeRecognized";
  uint64_t v35 = (uint64_t)v85;
  if (!v85)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  int v74 = (void *)v3;
  uint64_t v53 = (void *)v35;
  v97[17] = v35;
  v96[18] = @"aotLmeRecognized";
  uint64_t v36 = (uint64_t)v84;
  if (!v84)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v52 = (void *)v36;
  v97[18] = v36;
  v96[19] = @"deviceClass";
  uint64_t v37 = (uint64_t)v83;
  if (!v83)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  double v72 = (void *)v8;
  int v51 = (void *)v37;
  v97[19] = v37;
  v96[20] = @"deviceType";
  uint64_t v38 = (uint64_t)v82;
  if (!v82)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v50 = (void *)v38;
  v97[20] = v38;
  v96[21] = @"deviceBuild";
  uint64_t v39 = (uint64_t)v81;
  if (!v81)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  double v71 = (void *)v9;
  v49 = (void *)v39;
  v97[21] = v39;
  v96[22] = @"isSiriOptIn";
  v40 = v80;
  if (!v80)
  {
    v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v97[22] = v40;
  v96[23] = @"isAssistantEnabled";
  uint64_t v41 = v79;
  if (!v79)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  int v75 = (void *)v16;
  v97[23] = v41;
  v96[24] = @"isDictationEnabled";
  v42 = v78;
  if (!v78)
  {
    v42 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v59 = (void *)v24;
  v97[24] = v42;
  v96[25] = @"isMultipleDictationKeyboardsInstalled";
  v43 = v77;
  if (!v77)
  {
    v43 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)v25;
  v97[25] = v43;
  v96[26] = @"enabledDictationLocales";
  int v45 = v76;
  if (!v76)
  {
    int v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v97[26] = v45;
  v96[27] = @"activeDictationLanguages";
  v46 = v75;
  if (!v75)
  {
    v46 = [MEMORY[0x1E4F1CA98] null];
  }
  v97[27] = v46;
  id v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:28];
  if (!v75) {

  }
  uint64_t v47 = v29;
  if (!v76)
  {

    uint64_t v47 = v29;
  }
  if (!v77)
  {

    uint64_t v47 = v29;
  }
  if (!v78)
  {

    uint64_t v47 = v29;
  }
  if (!v79)
  {

    uint64_t v47 = v29;
  }
  if (!v80)
  {

    uint64_t v47 = v29;
  }
  if (!v81)
  {

    uint64_t v47 = v29;
  }
  if (!v82)
  {

    uint64_t v47 = v29;
  }
  if (!v83)
  {

    uint64_t v47 = v29;
  }
  if (!v84)
  {

    uint64_t v47 = v29;
  }
  if (!v85)
  {

    uint64_t v47 = v29;
  }
  if (!v86)
  {

    uint64_t v47 = v29;
  }
  if (!v87)
  {

    uint64_t v47 = v29;
  }
  if (!v88)
  {

    uint64_t v47 = v29;
  }
  if (!v89)
  {

    uint64_t v47 = v29;
  }
  if (!v90)
  {

    uint64_t v47 = v29;
  }
  if (!v91) {

  }
  if (!v92) {
  if (!v93)
  }

  if (!v94) {
  if (v95)
  }
  {
    if (v11) {
      goto LABEL_141;
    }
  }
  else
  {

    if (v11)
    {
LABEL_141:
      if (v68) {
        goto LABEL_142;
      }
      goto LABEL_152;
    }
  }

  if (v68)
  {
LABEL_142:
    if (v71) {
      goto LABEL_143;
    }
    goto LABEL_153;
  }
LABEL_152:

  if (v71)
  {
LABEL_143:
    if (v72) {
      goto LABEL_144;
    }
    goto LABEL_154;
  }
LABEL_153:

  if (v72)
  {
LABEL_144:
    if (v73) {
      goto LABEL_145;
    }
    goto LABEL_155;
  }
LABEL_154:

  if (v73)
  {
LABEL_145:
    if (v4) {
      goto LABEL_146;
    }
LABEL_156:

    if (v74) {
      goto LABEL_147;
    }
    goto LABEL_157;
  }
LABEL_155:

  if (!v4) {
    goto LABEL_156;
  }
LABEL_146:
  if (v74) {
    goto LABEL_147;
  }
LABEL_157:

LABEL_147:

  return v67;
}

- (id)_activeDictationLanguagesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMASRRequestMetricsRecord *)self activeDictationLanguages];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_enabledDictationLocalesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMASRRequestMetricsRecord *)self enabledDictationLocales];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMASRRequestMetricsRecord)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v426[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v352 = [v6 objectForKeyedSubscript:@"asrId"];
  if (!v352 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v352;
LABEL_4:
    v351 = [v6 objectForKeyedSubscript:@"requestId"];
    if (!v351 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v8 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v351;
LABEL_7:
      v350 = [v6 objectForKeyedSubscript:@"timestamp"];
      if (!v350 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v9 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v350;
LABEL_10:
        long long v10 = [v6 objectForKeyedSubscript:@"invocationType"];
        v349 = v10;
        id v347 = v7;
        id v348 = v8;
        if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v11 = 0;
LABEL_13:
          long long v12 = [v6 objectForKeyedSubscript:@"triggerType"];
          id v345 = v11;
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v60 = v12;
              if (!a4)
              {
                id v14 = 0;
                uint64_t v29 = 0;
LABEL_293:
                id v8 = v348;
                goto LABEL_294;
              }
              id v316 = v6;
              id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
              v62 = self;
              uint64_t v63 = *MEMORY[0x1E4F502C8];
              uint64_t v417 = *MEMORY[0x1E4F28568];
              unsigned int v64 = v62;
              id v346 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"triggerType"];
              id v418 = v346;
              uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v418 forKeys:&v417 count:1];
              id v6 = v316;
              uint64_t v65 = v63;
              self = v64;
              id v66 = (id)[v61 initWithDomain:v65 code:2 userInfo:v15];
              id v14 = 0;
              uint64_t v29 = 0;
              *a4 = v66;
              long long v10 = v349;
              goto LABEL_292;
            }
            long long v13 = self;
            v344 = v12;
            id v14 = v12;
          }
          else
          {
            long long v13 = self;
            v344 = v12;
            id v14 = 0;
          }
          uint64_t v15 = [v6 objectForKeyedSubscript:@"asrTask"];
          id v16 = v9;
          id v342 = v14;
          if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v346 = 0;
LABEL_19:
            uint64_t v17 = [v6 objectForKeyedSubscript:@"bundleId"];
            v343 = (void *)v17;
            if (v17 && (uint64_t v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  id v19 = 0;
                  uint64_t v29 = 0;
                  v60 = v344;
LABEL_290:
                  id v9 = v16;
                  self = v13;
                  id v11 = v345;
                  goto LABEL_291;
                }
                id v318 = v6;
                id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v76 = *MEMORY[0x1E4F502C8];
                uint64_t v413 = *MEMORY[0x1E4F28568];
                id v77 = v16;
                id v78 = [NSString alloc];
                uint64_t v244 = objc_opt_class();
                id v79 = v78;
                id v16 = v77;
                id v80 = (void *)[v79 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v244, @"bundleId"];
                v414 = v80;
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v414 forKeys:&v413 count:1];
                v341 = id v6 = v318;
                id v81 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v76, 2);
                id v19 = 0;
                uint64_t v29 = 0;
                *a4 = v81;
                goto LABEL_149;
              }
              id v19 = v18;
            }
            else
            {
              id v19 = 0;
            }
            uint64_t v20 = [v6 objectForKeyedSubscript:@"clientId"];
            v341 = (void *)v20;
            if (!v20 || (uint64_t v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v339 = 0;
              goto LABEL_25;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v339 = v21;
LABEL_25:
              uint64_t v22 = [v6 objectForKeyedSubscript:@"geoLMRegionId"];
              id v310 = v16;
              v314 = (void *)v22;
              v338 = a4;
              if (!v22 || (uint64_t v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                a4 = 0;
LABEL_50:
                v40 = [v6 objectForKeyedSubscript:@"locale"];
                if (!v40 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v307 = a4;
                  uint64_t v41 = v15;
                  id v312 = 0;
                  goto LABEL_53;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v307 = a4;
                  uint64_t v41 = v15;
                  id v312 = v40;
LABEL_53:
                  uint64_t v42 = [v6 objectForKeyedSubscript:@"audioDurationMs"];
                  v311 = (void *)v42;
                  id v306 = v19;
                  if (!v42 || (v43 = (void *)v42, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v308 = 0;
                    goto LABEL_56;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v308 = v43;
LABEL_56:
                    [v6 objectForKeyedSubscript:@"recognitionDurationMs"];
                    v44 = uint64_t v15 = v41;
                    v303 = v40;
                    if (!v44 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      int v45 = v40;
                      v46 = v44;
                      id v304 = 0;
LABEL_59:
                      uint64_t v47 = [v6 objectForKeyedSubscript:@"completionState"];
                      v48 = v13;
                      v301 = (void *)v47;
                      if (v47 && (v49 = (void *)v47, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        v293 = v46;
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v302 = v49;
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (!v338)
                            {
                              id v302 = 0;
                              uint64_t v29 = 0;
                              v60 = v344;
                              a4 = v307;
                              int v45 = v303;
LABEL_283:
                              id v16 = v310;
                              goto LABEL_284;
                            }
                            id v163 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v164 = *MEMORY[0x1E4F502C8];
                            uint64_t v401 = *MEMORY[0x1E4F28568];
                            v48 = v13;
                            id v300 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"completionState"];
                            id v402 = v300;
                            v299 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v402 forKeys:&v401 count:1];
                            id v302 = 0;
                            uint64_t v29 = 0;
                            id *v338 = (id)objc_msgSend(v163, "initWithDomain:code:userInfo:", v164, 2);
                            long long v10 = v349;
                            v60 = v344;
                            int v45 = v303;
                            v46 = v293;
                            goto LABEL_282;
                          }
                          id v117 = v49;
                          id v302 = [NSNumber numberWithInt:BMASRRequestMetricsRecordCompletionStateFromString(v117)];

                          v48 = v13;
                        }

                        int v45 = v303;
                        v50 = v46;
                      }
                      else
                      {
                        id v302 = 0;
                        v50 = v46;
                      }
                      uint64_t v118 = [v6 objectForKeyedSubscript:@"snrRatio"];
                      v299 = (void *)v118;
                      if (!v118 || (v119 = (void *)v118, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v300 = 0;
                        goto LABEL_103;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v300 = v119;
LABEL_103:
                        v120 = [v6 objectForKeyedSubscript:@"avgPitch"];
                        if (!v120 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          v289 = v120;
                          id v297 = 0;
                          goto LABEL_106;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v289 = v120;
                          id v297 = v120;
LABEL_106:
                          uint64_t v121 = [v6 objectForKeyedSubscript:@"jitLmeUsed"];
                          v292 = v48;
                          v290 = (void *)v121;
                          if (!v121 || (v122 = (void *)v121, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v291 = 0;
                            goto LABEL_109;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v291 = v122;
LABEL_109:
                            uint64_t v123 = [v6 objectForKeyedSubscript:@"aotLmeUsed"];
                            v287 = (void *)v123;
                            if (!v123 || (v124 = (void *)v123, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v125 = v50;
                              id v288 = 0;
                              goto LABEL_112;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v125 = v50;
                              id v288 = v124;
LABEL_112:
                              uint64_t v126 = [v6 objectForKeyedSubscript:@"jitLmeRecognized"];
                              v286 = (void *)v126;
                              if (!v126 || (v127 = (void *)v126, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v285 = 0;
                                goto LABEL_115;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v285 = v127;
LABEL_115:
                                uint64_t v128 = [v6 objectForKeyedSubscript:@"aotLmeRecognized"];
                                v50 = v125;
                                v284 = (void *)v128;
                                if (!v128
                                  || (v129 = (void *)v128, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v283 = 0;
LABEL_118:
                                  uint64_t v130 = [v6 objectForKeyedSubscript:@"deviceClass"];
                                  v280 = (void *)v130;
                                  if (v130
                                    && (v131 = (void *)v130, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (!v338)
                                      {
                                        v173 = 0;
                                        uint64_t v29 = 0;
                                        v60 = v344;
                                        v120 = v289;
                                        v142 = v283;
                                        v48 = v292;
LABEL_276:

                                        v162 = v303;
                                        goto LABEL_277;
                                      }
                                      id v330 = v6;
                                      id v174 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v175 = *MEMORY[0x1E4F502C8];
                                      uint64_t v387 = *MEMORY[0x1E4F28568];
                                      id v176 = [NSString alloc];
                                      uint64_t v256 = objc_opt_class();
                                      v177 = v176;
                                      v48 = v292;
                                      id v278 = (id)[v177 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v256, @"deviceClass"];
                                      id v388 = v278;
                                      v178 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v388 forKeys:&v387 count:1];
                                      v179 = v174;
                                      id v6 = v330;
                                      v173 = 0;
                                      uint64_t v29 = 0;
                                      id *v338 = (id)[v179 initWithDomain:v175 code:2 userInfo:v178];
                                      v60 = v344;
                                      v142 = v283;
                                      goto LABEL_274;
                                    }
                                    id v279 = v131;
                                  }
                                  else
                                  {
                                    id v279 = 0;
                                  }
                                  v132 = [v6 objectForKeyedSubscript:@"deviceType"];
                                  if (v132 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (!v338)
                                      {
                                        id v278 = 0;
                                        uint64_t v29 = 0;
                                        v60 = v344;
                                        v178 = v132;
                                        v142 = v283;
                                        v173 = v279;
                                        v48 = v292;
LABEL_274:

                                        goto LABEL_275;
                                      }
                                      id v331 = v6;
                                      id v187 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      id obja = (id)*MEMORY[0x1E4F502C8];
                                      uint64_t v385 = *MEMORY[0x1E4F28568];
                                      id v188 = [NSString alloc];
                                      uint64_t v257 = objc_opt_class();
                                      v189 = v188;
                                      v178 = v132;
                                      v48 = v292;
                                      v276 = (void *)[v189 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v257, @"deviceType"];
                                      v386 = v276;
                                      uint64_t v190 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v386 forKeys:&v385 count:1];
                                      v191 = v187;
                                      v173 = v279;
                                      v142 = v283;
                                      id v6 = v331;
                                      v277 = (void *)v190;
                                      id v278 = 0;
                                      uint64_t v29 = 0;
                                      id *v338 = (id)objc_msgSend(v191, "initWithDomain:code:userInfo:", obja, 2);
                                      v60 = v344;
                                      goto LABEL_273;
                                    }
                                    v275 = v132;
                                    id v278 = v132;
                                  }
                                  else
                                  {
                                    v275 = v132;
                                    id v278 = 0;
                                  }
                                  uint64_t v133 = [v6 objectForKeyedSubscript:@"deviceBuild"];
                                  v277 = (void *)v133;
                                  if (!v133
                                    || (v134 = (void *)v133, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v135 = 0;
                                    goto LABEL_127;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v135 = v134;
LABEL_127:
                                    uint64_t v136 = [v6 objectForKeyedSubscript:@"isSiriOptIn"];
                                    v276 = v135;
                                    v274 = (void *)v136;
                                    if (!v136
                                      || (v137 = (void *)v136, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v273 = 0;
                                      goto LABEL_130;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v273 = v137;
LABEL_130:
                                      uint64_t v138 = [v6 objectForKeyedSubscript:@"isAssistantEnabled"];
                                      v272 = (void *)v138;
                                      if (!v138
                                        || (v139 = (void *)v138, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v271 = 0;
                                        goto LABEL_133;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v271 = v139;
LABEL_133:
                                        uint64_t v140 = [v6 objectForKeyedSubscript:@"isDictationEnabled"];
                                        v267 = (void *)v140;
                                        if (v140)
                                        {
                                          v141 = (void *)v140;
                                          objc_opt_class();
                                          v142 = v283;
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v266 = 0;
                                          }
                                          else
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                            {
                                              if (!v338)
                                              {
                                                id v266 = 0;
                                                uint64_t v29 = 0;
                                                v60 = v344;
                                                v178 = v275;
                                                v173 = v279;
                                                v48 = v292;
                                                goto LABEL_270;
                                              }
                                              id v200 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v335 = *MEMORY[0x1E4F502C8];
                                              uint64_t v377 = *MEMORY[0x1E4F28568];
                                              v48 = v292;
                                              id v265 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isDictationEnabled"];
                                              id v378 = v265;
                                              v264 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v378 forKeys:&v377 count:1];
                                              id v266 = 0;
                                              uint64_t v29 = 0;
                                              id *v338 = (id)objc_msgSend(v200, "initWithDomain:code:userInfo:", v335, 2);
                                              v60 = v344;
                                              v178 = v275;
                                              v173 = v279;
                                              goto LABEL_269;
                                            }
                                            id v266 = v141;
                                          }
                                        }
                                        else
                                        {
                                          id v266 = 0;
                                          v142 = v283;
                                        }
                                        uint64_t v180 = [v6 objectForKeyedSubscript:@"isMultipleDictationKeyboardsInstalled"];
                                        v173 = v279;
                                        v296 = v50;
                                        v264 = (void *)v180;
                                        if (v180
                                          && (v181 = (void *)v180, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                        {
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            v48 = v292;
                                            if (v338)
                                            {
                                              id v336 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              id v269 = (id)*MEMORY[0x1E4F502C8];
                                              uint64_t v375 = *MEMORY[0x1E4F28568];
                                              v217 = v15;
                                              id v218 = [NSString alloc];
                                              uint64_t v259 = objc_opt_class();
                                              v219 = v218;
                                              uint64_t v15 = v217;
                                              v48 = v292;
                                              id obj = (id)[v219 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v259, @"isMultipleDictationKeyboardsInstalled"];
                                              id v376 = obj;
                                              v263 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v376 forKeys:&v375 count:1];
                                              id v265 = 0;
                                              uint64_t v29 = 0;
                                              id *v338 = (id)objc_msgSend(v336, "initWithDomain:code:userInfo:", v269, 2);
                                              v60 = v344;

                                              goto LABEL_267;
                                            }
                                            id v265 = 0;
                                            uint64_t v29 = 0;
                                            v60 = v344;
LABEL_268:
                                            v178 = v275;
LABEL_269:

                                            goto LABEL_270;
                                          }
                                          v182 = v292;
                                          id v265 = v181;
                                        }
                                        else
                                        {
                                          v182 = v292;
                                          id v265 = 0;
                                        }
                                        v183 = [v6 objectForKeyedSubscript:@"enabledDictationLocales"];
                                        v184 = [MEMORY[0x1E4F1CA98] null];
                                        int v185 = [v183 isEqual:v184];

                                        if (v185)
                                        {
                                          v261 = v15;

LABEL_215:
                                          v186 = 0;
                                          goto LABEL_216;
                                        }
                                        if (!v183)
                                        {
                                          v261 = v15;
                                          goto LABEL_215;
                                        }
                                        objc_opt_class();
                                        id obj = v183;
                                        v142 = v283;
                                        if (objc_opt_isKindOfClass())
                                        {
                                          v261 = v15;
                                          v186 = v183;
LABEL_216:
                                          v201 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v186, "count"));
                                          long long v357 = 0u;
                                          long long v358 = 0u;
                                          long long v359 = 0u;
                                          long long v360 = 0u;
                                          id obj = v186;
                                          uint64_t v202 = [obj countByEnumeratingWithState:&v357 objects:v372 count:16];
                                          v50 = v296;
                                          v262 = v201;
                                          if (!v202) {
                                            goto LABEL_225;
                                          }
                                          uint64_t v203 = v202;
                                          uint64_t v204 = *(void *)v358;
                                          while (1)
                                          {
                                            for (uint64_t i = 0; i != v203; ++i)
                                            {
                                              if (*(void *)v358 != v204) {
                                                objc_enumerationMutation(obj);
                                              }
                                              v206 = *(void **)(*((void *)&v357 + 1) + 8 * i);
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                if (v338)
                                                {
                                                  id v211 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  uint64_t v212 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v370 = *MEMORY[0x1E4F28568];
                                                  v213 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"enabledDictationLocales"];
                                                  v371 = v213;
                                                  v214 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v371 forKeys:&v370 count:1];
                                                  v215 = v211;
LABEL_231:
                                                  v48 = v292;
                                                  long long v10 = v349;
                                                  uint64_t v15 = v261;
                                                  id *v338 = (id)[v215 initWithDomain:v212 code:2 userInfo:v214];

                                                  uint64_t v29 = 0;
                                                  id v268 = obj;
                                                  v60 = v344;
                                                  v50 = v296;
LABEL_232:
                                                  v142 = v283;
                                                  v173 = v279;
                                                  goto LABEL_264;
                                                }
LABEL_233:
                                                uint64_t v29 = 0;
                                                id v268 = obj;
                                                v48 = v292;
                                                long long v10 = v349;
                                                goto LABEL_234;
                                              }
                                              objc_opt_class();
                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                              {
                                                if (v338)
                                                {
                                                  id v216 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  uint64_t v212 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v368 = *MEMORY[0x1E4F28568];
                                                  v213 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"enabledDictationLocales"];
                                                  v369 = v213;
                                                  v214 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v369 forKeys:&v368 count:1];
                                                  v215 = v216;
                                                  goto LABEL_231;
                                                }
                                                goto LABEL_233;
                                              }
                                              id v207 = v206;
                                              [v201 addObject:v207];
                                            }
                                            uint64_t v203 = [obj countByEnumeratingWithState:&v357 objects:v372 count:16];
                                            long long v10 = v349;
                                            if (!v203)
                                            {
LABEL_225:

                                              v208 = [v6 objectForKeyedSubscript:@"activeDictationLanguages"];
                                              v209 = [MEMORY[0x1E4F1CA98] null];
                                              int v210 = [v208 isEqual:v209];

                                              if (v210)
                                              {

                                                v208 = 0;
                                                goto LABEL_242;
                                              }
                                              if (v208)
                                              {
                                                objc_opt_class();
                                                id v220 = v306;
                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                {
                                                  id v268 = v208;
                                                  v48 = v292;
                                                  if (v338)
                                                  {
                                                    id v221 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    uint64_t v222 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v366 = *MEMORY[0x1E4F28568];
                                                    v213 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"activeDictationLanguages"];
                                                    v367 = v213;
                                                    v223 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v367 forKeys:&v366 count:1];
                                                    long long v10 = v349;
                                                    id *v338 = (id)[v221 initWithDomain:v222 code:2 userInfo:v223];

                                                    uint64_t v29 = 0;
                                                    v60 = v344;
                                                    uint64_t v15 = v261;
                                                    goto LABEL_232;
                                                  }
                                                  uint64_t v29 = 0;
LABEL_234:
                                                  v60 = v344;
                                                  uint64_t v15 = v261;
                                                  v142 = v283;
                                                  v173 = v279;
                                                  goto LABEL_265;
                                                }
                                              }
                                              else
                                              {
LABEL_242:
                                                id v220 = v306;
                                              }
                                              v213 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v208, "count"));
                                              long long v353 = 0u;
                                              long long v354 = 0u;
                                              long long v355 = 0u;
                                              long long v356 = 0u;
                                              id v268 = v208;
                                              uint64_t v224 = [v268 countByEnumeratingWithState:&v353 objects:v365 count:16];
                                              if (!v224) {
                                                goto LABEL_252;
                                              }
                                              uint64_t v225 = v224;
                                              uint64_t v226 = *(void *)v354;
LABEL_245:
                                              uint64_t v227 = 0;
                                              while (1)
                                              {
                                                if (*(void *)v354 != v226) {
                                                  objc_enumerationMutation(v268);
                                                }
                                                v228 = *(void **)(*((void *)&v353 + 1) + 8 * v227);
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass()) {
                                                  break;
                                                }
                                                objc_opt_class();
                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                {
                                                  v235 = v292;
                                                  long long v10 = v349;
                                                  uint64_t v15 = v261;
                                                  v173 = v279;
                                                  if (v338)
                                                  {
                                                    id v337 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    uint64_t v236 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v361 = *MEMORY[0x1E4F28568];
                                                    v237 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"activeDictationLanguages"];
                                                    v362 = v237;
                                                    v238 = (void *)MEMORY[0x1E4F1C9E8];
                                                    v239 = &v362;
                                                    v240 = &v361;
LABEL_262:
                                                    v241 = [v238 dictionaryWithObjects:v239 forKeys:v240 count:1];
                                                    id *v338 = (id)[v337 initWithDomain:v236 code:2 userInfo:v241];
                                                  }
                                                  goto LABEL_263;
                                                }
                                                id v229 = v228;
                                                [v213 addObject:v229];

                                                if (v225 == ++v227)
                                                {
                                                  uint64_t v225 = [v268 countByEnumeratingWithState:&v353 objects:v365 count:16];
                                                  long long v10 = v349;
                                                  if (v225) {
                                                    goto LABEL_245;
                                                  }
LABEL_252:

                                                  v142 = v283;
                                                  LODWORD(v260) = [v302 intValue];
                                                  v173 = v279;
                                                  v48 = objc_retain(-[BMASRRequestMetricsRecord initWithAsrId:requestId:timestamp:invocationType:triggerType:asrTask:bundleId:clientId:geoLMRegionId:locale:audioDurationMs:recognitionDurationMs:completionState:snrRatio:avgPitch:jitLmeUsed:aotLmeUsed:jitLmeRecognized:aotLmeRecognized:deviceClass:deviceType:deviceBuild:isSiriOptIn:isAssistantEnabled:isDictationEnabled:isMultipleDictationKeyboardsInstalled:enabledDictationLocales:activeDictationLanguages:](v292, "initWithAsrId:requestId:timestamp:invocationType:triggerType:asrTask:bundleId:clientId:geoLMRegionId:locale:audioDurationMs:recognitionDurationMs:completionState:snrRatio:avgPitch:jitLmeUsed:aotLmeUsed:jitLmeRecognized:aotLmeRecognized:deviceClass:deviceType:deviceBuild:isSiriOptIn:isAssistantEnabled:isDictationEnabled:isMultipleDictationKeyboardsInstalled:enabledDictationLocales:activeDictationLanguages:", v347, v348, v310, v345, v342, v346, v220, v339, v307, v312,
                                                            v308,
                                                            v304,
                                                            v260,
                                                            v300,
                                                            v297,
                                                            v291,
                                                            v288,
                                                            v285,
                                                            v283,
                                                            v279,
                                                            v278,
                                                            v276,
                                                            v273,
                                                            v271,
                                                            v266,
                                                            v265,
                                                            v262,
                                                            v213));
                                                  uint64_t v29 = v48;
                                                  v60 = v344;
                                                  uint64_t v15 = v261;
LABEL_264:

LABEL_265:
LABEL_266:

                                                  goto LABEL_267;
                                                }
                                              }
                                              v235 = v292;
                                              long long v10 = v349;
                                              uint64_t v15 = v261;
                                              v173 = v279;
                                              if (v338)
                                              {
                                                id v337 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                uint64_t v236 = *MEMORY[0x1E4F502C8];
                                                uint64_t v363 = *MEMORY[0x1E4F28568];
                                                v237 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"activeDictationLanguages"];
                                                v364 = v237;
                                                v238 = (void *)MEMORY[0x1E4F1C9E8];
                                                v239 = &v364;
                                                v240 = &v363;
                                                goto LABEL_262;
                                              }
LABEL_263:

                                              uint64_t v29 = 0;
                                              v60 = v344;
                                              v48 = v235;
                                              v50 = v296;
                                              v142 = v283;
                                              goto LABEL_264;
                                            }
                                          }
                                        }
                                        if (v338)
                                        {
                                          id v230 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v231 = *MEMORY[0x1E4F502C8];
                                          uint64_t v373 = *MEMORY[0x1E4F28568];
                                          v262 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"enabledDictationLocales"];
                                          v374 = v262;
                                          uint64_t v232 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v374 forKeys:&v373 count:1];
                                          uint64_t v233 = v231;
                                          v142 = v283;
                                          id v270 = (id)v232;
                                          id v234 = (id)objc_msgSend(v230, "initWithDomain:code:userInfo:", v233, 2);
                                          uint64_t v29 = 0;
                                          id *v338 = v234;
                                          v60 = v344;
                                          v48 = v182;
                                          v50 = v296;

                                          goto LABEL_266;
                                        }
                                        uint64_t v29 = 0;
                                        v60 = v344;
                                        v48 = v182;
                                        v50 = v296;
LABEL_267:

                                        goto LABEL_268;
                                      }
                                      if (v338)
                                      {
                                        id v199 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v334 = *MEMORY[0x1E4F502C8];
                                        uint64_t v379 = *MEMORY[0x1E4F28568];
                                        v48 = v292;
                                        id v266 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isAssistantEnabled"];
                                        id v380 = v266;
                                        v267 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v380 forKeys:&v379 count:1];
                                        id v271 = 0;
                                        uint64_t v29 = 0;
                                        id *v338 = (id)objc_msgSend(v199, "initWithDomain:code:userInfo:", v334, 2);
                                        v60 = v344;
                                        v178 = v275;
                                        v142 = v283;
                                        v173 = v279;
LABEL_270:

                                        goto LABEL_271;
                                      }
                                      id v271 = 0;
                                      uint64_t v29 = 0;
                                      v60 = v344;
                                      v178 = v275;
                                      v142 = v283;
                                      v173 = v279;
                                      v48 = v292;
LABEL_271:

                                      goto LABEL_272;
                                    }
                                    if (v338)
                                    {
                                      id v198 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v333 = *MEMORY[0x1E4F502C8];
                                      uint64_t v381 = *MEMORY[0x1E4F28568];
                                      v48 = v292;
                                      id v271 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isSiriOptIn"];
                                      id v382 = v271;
                                      v272 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v382 forKeys:&v381 count:1];
                                      id v273 = 0;
                                      uint64_t v29 = 0;
                                      id *v338 = (id)objc_msgSend(v198, "initWithDomain:code:userInfo:", v333, 2);
                                      v60 = v344;
                                      v178 = v275;
                                      v142 = v283;
                                      v173 = v279;
                                      goto LABEL_271;
                                    }
                                    id v273 = 0;
                                    uint64_t v29 = 0;
                                    v60 = v344;
                                    v178 = v275;
                                    v142 = v283;
                                    v173 = v279;
                                    v48 = v292;
LABEL_272:

                                    goto LABEL_273;
                                  }
                                  if (v338)
                                  {
                                    id v332 = v6;
                                    id v192 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v193 = *MEMORY[0x1E4F502C8];
                                    uint64_t v383 = *MEMORY[0x1E4F28568];
                                    id v194 = [NSString alloc];
                                    uint64_t v258 = objc_opt_class();
                                    v195 = v194;
                                    v48 = v292;
                                    id v273 = (id)[v195 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v258, @"deviceBuild"];
                                    id v384 = v273;
                                    uint64_t v196 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v384 forKeys:&v383 count:1];
                                    v197 = v192;
                                    v173 = v279;
                                    v142 = v283;
                                    id v6 = v332;
                                    v274 = (void *)v196;
                                    v276 = 0;
                                    uint64_t v29 = 0;
                                    id *v338 = (id)objc_msgSend(v197, "initWithDomain:code:userInfo:", v193, 2);
                                    v60 = v344;
                                    v178 = v275;
                                    goto LABEL_272;
                                  }
                                  v276 = 0;
                                  uint64_t v29 = 0;
                                  v60 = v344;
                                  v178 = v275;
                                  v142 = v283;
                                  v173 = v279;
                                  v48 = v292;
LABEL_273:

                                  goto LABEL_274;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v283 = v129;
                                  goto LABEL_118;
                                }
                                if (v338)
                                {
                                  id v169 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v329 = *MEMORY[0x1E4F502C8];
                                  uint64_t v389 = *MEMORY[0x1E4F28568];
                                  v170 = v15;
                                  id v171 = [NSString alloc];
                                  uint64_t v255 = objc_opt_class();
                                  v172 = v171;
                                  uint64_t v15 = v170;
                                  v48 = v292;
                                  v173 = (void *)[v172 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v255, @"aotLmeRecognized"];
                                  v390 = v173;
                                  v280 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v390 forKeys:&v389 count:1];
                                  v142 = 0;
                                  uint64_t v29 = 0;
                                  id *v338 = (id)objc_msgSend(v169, "initWithDomain:code:userInfo:", v329, 2);
                                  v60 = v344;
LABEL_275:
                                  v120 = v289;
                                  goto LABEL_276;
                                }
                                uint64_t v29 = 0;
                                v60 = v344;
                                v120 = v289;
                                v162 = v45;
                                v142 = 0;
                                v48 = v292;
LABEL_277:

                                goto LABEL_278;
                              }
                              if (v338)
                              {
                                id v165 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v328 = *MEMORY[0x1E4F502C8];
                                uint64_t v391 = *MEMORY[0x1E4F28568];
                                v295 = v125;
                                v166 = v15;
                                id v167 = [NSString alloc];
                                uint64_t v254 = objc_opt_class();
                                v168 = v167;
                                uint64_t v15 = v166;
                                v162 = v303;
                                v48 = v292;
                                v50 = v295;
                                v142 = (void *)[v168 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v254, @"jitLmeRecognized"];
                                v392 = v142;
                                v284 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v392 forKeys:&v391 count:1];
                                id v285 = 0;
                                uint64_t v29 = 0;
                                id *v338 = (id)objc_msgSend(v165, "initWithDomain:code:userInfo:", v328, 2);
                                v60 = v344;
                                v120 = v289;
                                goto LABEL_277;
                              }
                              id v285 = 0;
                              uint64_t v29 = 0;
                              v60 = v344;
                              v120 = v289;
                              v50 = v125;
                              v162 = v45;
                              v48 = v292;
LABEL_278:
                              int v45 = v162;

                              goto LABEL_279;
                            }
                            if (v338)
                            {
                              id v158 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v327 = *MEMORY[0x1E4F502C8];
                              uint64_t v393 = *MEMORY[0x1E4F28568];
                              v294 = v50;
                              v159 = v15;
                              id v160 = [NSString alloc];
                              uint64_t v253 = objc_opt_class();
                              v161 = v160;
                              uint64_t v15 = v159;
                              v162 = v303;
                              v48 = v292;
                              v50 = v294;
                              id v285 = (id)[v161 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v253, @"aotLmeUsed"];
                              id v394 = v285;
                              v286 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v394 forKeys:&v393 count:1];
                              id v288 = 0;
                              uint64_t v29 = 0;
                              id *v338 = (id)objc_msgSend(v158, "initWithDomain:code:userInfo:", v327, 2);
                              v60 = v344;
                              v120 = v289;
                              goto LABEL_278;
                            }
                            id v288 = 0;
                            uint64_t v29 = 0;
                            v60 = v344;
                            v120 = v289;
                            v48 = v292;
LABEL_279:
                            v46 = v50;

                            goto LABEL_280;
                          }
                          if (v338)
                          {
                            id v153 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v326 = *MEMORY[0x1E4F502C8];
                            uint64_t v395 = *MEMORY[0x1E4F28568];
                            v154 = v48;
                            v155 = v15;
                            id v156 = [NSString alloc];
                            uint64_t v252 = objc_opt_class();
                            v157 = v156;
                            uint64_t v15 = v155;
                            int v45 = v303;
                            v48 = v154;
                            long long v10 = v349;
                            id v288 = (id)[v157 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v252, @"jitLmeUsed"];
                            id v396 = v288;
                            v287 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v396 forKeys:&v395 count:1];
                            id v291 = 0;
                            uint64_t v29 = 0;
                            id *v338 = (id)objc_msgSend(v153, "initWithDomain:code:userInfo:", v326, 2);
                            v60 = v344;
                            v120 = v289;
                            goto LABEL_279;
                          }
                          v46 = v50;
                          id v291 = 0;
                          uint64_t v29 = 0;
                          v60 = v344;
                          v120 = v289;
LABEL_280:

                          goto LABEL_281;
                        }
                        if (v338)
                        {
                          id v325 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v298 = *MEMORY[0x1E4F502C8];
                          uint64_t v397 = *MEMORY[0x1E4F28568];
                          v148 = v48;
                          v149 = v15;
                          id v150 = [NSString alloc];
                          uint64_t v251 = objc_opt_class();
                          v151 = v150;
                          uint64_t v15 = v149;
                          int v45 = v303;
                          v46 = v50;
                          v48 = v148;
                          long long v10 = v349;
                          id v291 = (id)[v151 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v251, @"avgPitch"];
                          id v398 = v291;
                          v290 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v398 forKeys:&v397 count:1];
                          id v152 = (id)objc_msgSend(v325, "initWithDomain:code:userInfo:", v298, 2);
                          id v297 = 0;
                          uint64_t v29 = 0;
                          id *v338 = v152;
                          v60 = v344;
                          goto LABEL_280;
                        }
                        v46 = v50;
                        id v297 = 0;
                        uint64_t v29 = 0;
LABEL_185:
                        v60 = v344;
LABEL_281:

                        goto LABEL_282;
                      }
                      v46 = v50;
                      if (v338)
                      {
                        id v143 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v324 = *MEMORY[0x1E4F502C8];
                        uint64_t v399 = *MEMORY[0x1E4F28568];
                        v144 = v48;
                        v145 = v15;
                        id v146 = [NSString alloc];
                        uint64_t v250 = objc_opt_class();
                        v147 = v146;
                        uint64_t v15 = v145;
                        int v45 = v303;
                        v48 = v144;
                        long long v10 = v349;
                        id v297 = (id)[v147 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v250, @"snrRatio"];
                        id v400 = v297;
                        v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v400 forKeys:&v399 count:1];
                        id v300 = 0;
                        uint64_t v29 = 0;
                        id *v338 = (id)[v143 initWithDomain:v324 code:2 userInfo:v120];
                        goto LABEL_185;
                      }
                      id v300 = 0;
                      uint64_t v29 = 0;
                      v60 = v344;
LABEL_282:
                      long long v13 = v48;

                      a4 = v307;
                      goto LABEL_283;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      int v45 = v40;
                      v46 = v44;
                      id v304 = v44;
                      goto LABEL_59;
                    }
                    if (v338)
                    {
                      id v323 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v305 = *MEMORY[0x1E4F502C8];
                      uint64_t v403 = *MEMORY[0x1E4F28568];
                      v113 = v15;
                      id v114 = [NSString alloc];
                      uint64_t v249 = objc_opt_class();
                      v115 = v114;
                      uint64_t v15 = v113;
                      id v16 = v310;
                      int v45 = v40;
                      v46 = v44;
                      a4 = v307;
                      id v302 = (id)[v115 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v249, @"recognitionDurationMs"];
                      id v404 = v302;
                      v301 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v404 forKeys:&v403 count:1];
                      id v116 = (id)objc_msgSend(v323, "initWithDomain:code:userInfo:", v305, 2);
                      id v304 = 0;
                      uint64_t v29 = 0;
                      id *v338 = v116;
                      v60 = v344;
LABEL_284:

                      goto LABEL_285;
                    }
                    int v45 = v40;
                    v46 = v44;
                    id v304 = 0;
                    uint64_t v29 = 0;
                    v60 = v344;
                    a4 = v307;
LABEL_285:

                    v40 = v45;
                    id v19 = v306;
                    goto LABEL_286;
                  }
                  if (v338)
                  {
                    id v322 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v309 = *MEMORY[0x1E4F502C8];
                    uint64_t v405 = *MEMORY[0x1E4F28568];
                    uint64_t v15 = v41;
                    id v110 = [NSString alloc];
                    uint64_t v248 = objc_opt_class();
                    v111 = v110;
                    a4 = v307;
                    id v16 = v310;
                    int v45 = v40;
                    id v304 = (id)[v111 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v248, @"audioDurationMs"];
                    id v406 = v304;
                    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v406 forKeys:&v405 count:1];
                    id v112 = (id)objc_msgSend(v322, "initWithDomain:code:userInfo:", v309, 2);
                    id v308 = 0;
                    uint64_t v29 = 0;
                    id *v338 = v112;
                    v60 = v344;
                    goto LABEL_285;
                  }
                  id v308 = 0;
                  uint64_t v29 = 0;
                  v60 = v344;
                  uint64_t v15 = v41;
                  a4 = v307;
LABEL_286:

                  goto LABEL_287;
                }
                if (v338)
                {
                  id v321 = v6;
                  uint64_t v100 = v13;
                  v101 = a4;
                  id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v313 = *MEMORY[0x1E4F502C8];
                  uint64_t v407 = *MEMORY[0x1E4F28568];
                  v103 = v100;
                  id v104 = v16;
                  id v105 = [NSString alloc];
                  uint64_t v247 = objc_opt_class();
                  v106 = v105;
                  id v16 = v104;
                  id v308 = (id)[v106 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v247, @"locale"];
                  id v408 = v308;
                  uint64_t v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v408 forKeys:&v407 count:1];
                  v108 = v102;
                  a4 = v101;
                  long long v13 = v103;
                  id v6 = v321;
                  v311 = (void *)v107;
                  id v109 = (id)objc_msgSend(v108, "initWithDomain:code:userInfo:", v313, 2);
                  id v312 = 0;
                  uint64_t v29 = 0;
                  id *v338 = v109;
                  long long v10 = v349;
                  v60 = v344;
                  goto LABEL_286;
                }
                id v312 = 0;
                uint64_t v29 = 0;
LABEL_161:
                long long v10 = v349;
                v60 = v344;
LABEL_287:

                id v80 = v339;
                uint64_t v25 = v314;
                goto LABEL_288;
              }
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              uint64_t v25 = v23;
              if (isKindOfClass)
              {
                a4 = v23;
                goto LABEL_50;
              }
              id v80 = v339;
              if (a4)
              {
                id v320 = v6;
                id v92 = v13;
                id v93 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v94 = *MEMORY[0x1E4F502C8];
                uint64_t v409 = *MEMORY[0x1E4F28568];
                int v95 = v92;
                id v96 = v16;
                id v97 = [NSString alloc];
                uint64_t v246 = objc_opt_class();
                int v98 = v97;
                id v16 = v96;
                id v312 = (id)[v98 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v246, @"geoLMRegionId"];
                id v410 = v312;
                v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v410 forKeys:&v409 count:1];
                v99 = v93;
                long long v13 = v95;
                id v6 = v320;
                a4 = 0;
                uint64_t v29 = 0;
                id *v338 = (id)[v99 initWithDomain:v94 code:2 userInfo:v40];
                goto LABEL_161;
              }
              uint64_t v29 = 0;
LABEL_155:
              long long v10 = v349;
              v60 = v344;
LABEL_288:

              goto LABEL_289;
            }
            if (a4)
            {
              id v319 = v6;
              int v82 = v13;
              id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v340 = *MEMORY[0x1E4F502C8];
              uint64_t v411 = *MEMORY[0x1E4F28568];
              id v84 = v82;
              id v85 = v16;
              id v86 = [NSString alloc];
              uint64_t v245 = objc_opt_class();
              id v87 = v86;
              id v88 = v15;
              id v16 = v85;
              id v89 = (id *)[v87 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v245, @"clientId"];
              v412 = v89;
              uint64_t v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v412 forKeys:&v411 count:1];
              id v91 = v83;
              long long v13 = v84;
              id v6 = v319;
              uint64_t v29 = 0;
              *a4 = (id)[v91 initWithDomain:v340 code:2 userInfo:v90];
              uint64_t v25 = (void *)v90;
              uint64_t v15 = v88;
              a4 = v89;
              id v80 = 0;
              goto LABEL_155;
            }
            id v80 = 0;
            uint64_t v29 = 0;
LABEL_149:
            v60 = v344;
LABEL_289:

            goto LABEL_290;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v346 = v15;
            goto LABEL_19;
          }
          if (a4)
          {
            id v317 = v6;
            id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v68 = *MEMORY[0x1E4F502C8];
            uint64_t v415 = *MEMORY[0x1E4F28568];
            self = v13;
            id v69 = v9;
            id v70 = [NSString alloc];
            uint64_t v243 = objc_opt_class();
            double v71 = v70;
            id v11 = v345;
            id v9 = v69;
            uint64_t v72 = [v71 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v243, @"asrTask"];
            uint64_t v416 = v72;
            uint64_t v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v416 forKeys:&v415 count:1];
            int v74 = v67;
            id v19 = (id)v72;
            id v6 = v317;
            v343 = (void *)v73;
            id v346 = 0;
            uint64_t v29 = 0;
            *a4 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v68, 2);
            v60 = v344;
LABEL_291:

            id v14 = v342;
            goto LABEL_292;
          }
          id v346 = 0;
          uint64_t v29 = 0;
          v60 = v344;
          self = v13;
          id v11 = v345;
LABEL_292:

          goto LABEL_293;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          goto LABEL_13;
        }
        if (a4)
        {
          id v315 = v6;
          int v51 = self;
          v52 = a4;
          id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v54 = *MEMORY[0x1E4F502C8];
          uint64_t v419 = *MEMORY[0x1E4F28568];
          uint64_t v55 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"invocationType"];
          uint64_t v420 = v55;
          uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v420 forKeys:&v419 count:1];
          int v57 = v53;
          v58 = v51;
          id v14 = (id)v55;
          id v6 = v315;
          uint64_t v59 = v54;
          v60 = (void *)v56;
          id v11 = 0;
          uint64_t v29 = 0;
          id *v52 = (id)[v57 initWithDomain:v59 code:2 userInfo:v56];
          self = v58;
LABEL_294:

          id v7 = v347;
          goto LABEL_295;
        }
        id v11 = 0;
        uint64_t v29 = 0;
LABEL_295:

        goto LABEL_296;
      }
      if (a4)
      {
        id v35 = v8;
        id v36 = v7;
        id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v38 = *MEMORY[0x1E4F502C8];
        uint64_t v421 = *MEMORY[0x1E4F28568];
        id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"timestamp"];
        id v422 = v11;
        long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v422 forKeys:&v421 count:1];
        uint64_t v39 = v37;
        id v7 = v36;
        id v8 = v35;
        id v9 = 0;
        uint64_t v29 = 0;
        *a4 = (id)[v39 initWithDomain:v38 code:2 userInfo:v10];
        goto LABEL_295;
      }
      id v9 = 0;
      uint64_t v29 = 0;
LABEL_296:

      goto LABEL_297;
    }
    if (a4)
    {
      id v30 = v7;
      id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v32 = *MEMORY[0x1E4F502C8];
      uint64_t v423 = *MEMORY[0x1E4F28568];
      id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"requestId"];
      id v424 = v9;
      uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v424 forKeys:&v423 count:1];
      uint64_t v34 = v31;
      id v7 = v30;
      v350 = (void *)v33;
      id v8 = 0;
      uint64_t v29 = 0;
      *a4 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v32, 2);
      goto LABEL_296;
    }
    id v8 = 0;
    uint64_t v29 = 0;
LABEL_297:

    goto LABEL_298;
  }
  if (a4)
  {
    id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v27 = *MEMORY[0x1E4F502C8];
    uint64_t v425 = *MEMORY[0x1E4F28568];
    id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"asrId"];
    v426[0] = v8;
    v351 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v426 forKeys:&v425 count:1];
    id v28 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2);
    id v7 = 0;
    uint64_t v29 = 0;
    *a4 = v28;
    goto LABEL_297;
  }
  id v7 = 0;
  uint64_t v29 = 0;
LABEL_298:

  return v29;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMASRRequestMetricsRecord *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_asrId) {
    PBDataWriterWriteStringField();
  }
  if (self->_requestId) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_invocationType) {
    PBDataWriterWriteStringField();
  }
  if (self->_triggerType) {
    PBDataWriterWriteStringField();
  }
  if (self->_asrTask) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_clientId) {
    PBDataWriterWriteStringField();
  }
  if (self->_geoLMRegionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasAudioDurationMs) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasRecognitionDurationMs) {
    PBDataWriterWriteUint32Field();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasSnrRatio) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasAvgPitch) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasJitLmeUsed) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasAotLmeUsed) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasJitLmeRecognized) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasAotLmeRecognized) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_deviceClass) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceType) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceBuild) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsSiriOptIn) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsAssistantEnabled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsDictationEnabled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsMultipleDictationKeyboardsInstalled) {
    PBDataWriterWriteBOOLField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self->_enabledDictationLocales;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v10 = self->_activeDictationLanguages;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v123.receiver = self;
  v123.super_class = (Class)BMASRRequestMetricsRecord;
  uint64_t v5 = [(BMEventBase *)&v123 init];
  if (!v5) {
    goto LABEL_184;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  long long v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v10]) {
        break;
      }
      char v12 = 0;
      unsigned int v13 = 0;
      unint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = *v8;
        uint64_t v16 = *(void *)&v4[v15];
        unint64_t v17 = v16 + 1;
        if (v16 == -1 || v17 > *(void *)&v4[*v9]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
        *(void *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0) {
          goto LABEL_13;
        }
        v12 += 7;
        BOOL v19 = v13++ >= 9;
        if (v19)
        {
          unint64_t v14 = 0;
          int v20 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      int v20 = v4[*v10];
      if (v4[*v10]) {
        unint64_t v14 = 0;
      }
LABEL_15:
      if (v20 || (v14 & 7) == 4) {
        break;
      }
      switch((v14 >> 3))
      {
        case 1u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 56;
          goto LABEL_92;
        case 2u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 64;
          goto LABEL_92;
        case 3u:
          v5->_hasTimestamp = 1;
          uint64_t v24 = *v8;
          unint64_t v25 = *(void *)&v4[v24];
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)&v4[*v9])
          {
            id v26 = *(objc_class **)(*(void *)&v4[*v11] + v25);
            *(void *)&v4[v24] = v25 + 8;
          }
          else
          {
            v4[*v10] = 1;
            id v26 = 0;
          }
          uint64_t v115 = 72;
          goto LABEL_180;
        case 4u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 80;
          goto LABEL_92;
        case 5u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 88;
          goto LABEL_92;
        case 6u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 96;
          goto LABEL_92;
        case 7u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 104;
          goto LABEL_92;
        case 8u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 112;
          goto LABEL_92;
        case 9u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 120;
          goto LABEL_92;
        case 0xAu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 128;
          goto LABEL_92;
        case 0xBu:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          v5->_hasAudioDurationMs = 1;
          while (2)
          {
            uint64_t v30 = *v8;
            uint64_t v31 = *(void *)&v4[v30];
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)&v4[*v11] + v31);
              *(void *)&v4[v30] = v32;
              v29 |= (unint64_t)(v33 & 0x7F) << v27;
              if (v33 < 0)
              {
                v27 += 7;
                BOOL v19 = v28++ >= 9;
                if (v19)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_129;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v29) = 0;
          }
LABEL_129:
          uint64_t v112 = 44;
          goto LABEL_134;
        case 0xCu:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v29 = 0;
          v5->_hasRecognitionDurationMs = 1;
          while (2)
          {
            uint64_t v36 = *v8;
            uint64_t v37 = *(void *)&v4[v36];
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)&v4[*v11] + v37);
              *(void *)&v4[v36] = v38;
              v29 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                BOOL v19 = v35++ >= 9;
                if (v19)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_133;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v29) = 0;
          }
LABEL_133:
          uint64_t v112 = 48;
LABEL_134:
          *(_DWORD *)((char *)&v5->super.super.isa + v112) = v29;
          continue;
        case 0xDu:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          while (2)
          {
            uint64_t v43 = *v8;
            uint64_t v44 = *(void *)&v4[v43];
            unint64_t v45 = v44 + 1;
            if (v44 == -1 || v45 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v46 = *(unsigned char *)(*(void *)&v4[*v11] + v44);
              *(void *)&v4[v43] = v45;
              v42 |= (unint64_t)(v46 & 0x7F) << v40;
              if (v46 < 0)
              {
                v40 += 7;
                BOOL v19 = v41++ >= 9;
                if (v19)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_138;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v42) = 0;
          }
LABEL_138:
          if (v42 >= 6) {
            LODWORD(v42) = 0;
          }
          v5->_completionState = v42;
          continue;
        case 0xEu:
          v5->_hasSnrRatio = 1;
          uint64_t v47 = *v8;
          unint64_t v48 = *(void *)&v4[v47];
          if (v48 <= 0xFFFFFFFFFFFFFFF7 && v48 + 8 <= *(void *)&v4[*v9])
          {
            id v26 = *(objc_class **)(*(void *)&v4[*v11] + v48);
            *(void *)&v4[v47] = v48 + 8;
          }
          else
          {
            v4[*v10] = 1;
            id v26 = 0;
          }
          uint64_t v115 = 136;
          goto LABEL_180;
        case 0xFu:
          v5->_hasAvgPitch = 1;
          uint64_t v49 = *v8;
          unint64_t v50 = *(void *)&v4[v49];
          if (v50 <= 0xFFFFFFFFFFFFFFF7 && v50 + 8 <= *(void *)&v4[*v9])
          {
            id v26 = *(objc_class **)(*(void *)&v4[*v11] + v50);
            *(void *)&v4[v49] = v50 + 8;
          }
          else
          {
            v4[*v10] = 1;
            id v26 = 0;
          }
          uint64_t v115 = 144;
LABEL_180:
          *(Class *)((char *)&v5->super.super.isa + v115) = v26;
          continue;
        case 0x10u:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v53 = 0;
          v5->_hasJitLmeUsed = 1;
          while (2)
          {
            uint64_t v54 = *v8;
            uint64_t v55 = *(void *)&v4[v54];
            unint64_t v56 = v55 + 1;
            if (v55 == -1 || v56 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v57 = *(unsigned char *)(*(void *)&v4[*v11] + v55);
              *(void *)&v4[v54] = v56;
              v53 |= (unint64_t)(v57 & 0x7F) << v51;
              if (v57 < 0)
              {
                v51 += 7;
                BOOL v19 = v52++ >= 9;
                if (v19)
                {
                  uint64_t v53 = 0;
                  goto LABEL_144;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v53 = 0;
          }
LABEL_144:
          BOOL v113 = v53 != 0;
          uint64_t v114 = 21;
          goto LABEL_173;
        case 0x11u:
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v60 = 0;
          v5->_hasAotLmeUsed = 1;
          while (2)
          {
            uint64_t v61 = *v8;
            uint64_t v62 = *(void *)&v4[v61];
            unint64_t v63 = v62 + 1;
            if (v62 == -1 || v63 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v64 = *(unsigned char *)(*(void *)&v4[*v11] + v62);
              *(void *)&v4[v61] = v63;
              v60 |= (unint64_t)(v64 & 0x7F) << v58;
              if (v64 < 0)
              {
                v58 += 7;
                BOOL v19 = v59++ >= 9;
                if (v19)
                {
                  uint64_t v60 = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v60 = 0;
          }
LABEL_148:
          BOOL v113 = v60 != 0;
          uint64_t v114 = 23;
          goto LABEL_173;
        case 0x12u:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v67 = 0;
          v5->_hasJitLmeRecognized = 1;
          while (2)
          {
            uint64_t v68 = *v8;
            uint64_t v69 = *(void *)&v4[v68];
            unint64_t v70 = v69 + 1;
            if (v69 == -1 || v70 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v71 = *(unsigned char *)(*(void *)&v4[*v11] + v69);
              *(void *)&v4[v68] = v70;
              v67 |= (unint64_t)(v71 & 0x7F) << v65;
              if (v71 < 0)
              {
                v65 += 7;
                BOOL v19 = v66++ >= 9;
                if (v19)
                {
                  uint64_t v67 = 0;
                  goto LABEL_152;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v67 = 0;
          }
LABEL_152:
          BOOL v113 = v67 != 0;
          uint64_t v114 = 25;
          goto LABEL_173;
        case 0x13u:
          char v72 = 0;
          unsigned int v73 = 0;
          uint64_t v74 = 0;
          v5->_hasAotLmeRecognized = 1;
          while (2)
          {
            uint64_t v75 = *v8;
            uint64_t v76 = *(void *)&v4[v75];
            unint64_t v77 = v76 + 1;
            if (v76 == -1 || v77 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v78 = *(unsigned char *)(*(void *)&v4[*v11] + v76);
              *(void *)&v4[v75] = v77;
              v74 |= (unint64_t)(v78 & 0x7F) << v72;
              if (v78 < 0)
              {
                v72 += 7;
                BOOL v19 = v73++ >= 9;
                if (v19)
                {
                  uint64_t v74 = 0;
                  goto LABEL_156;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v74 = 0;
          }
LABEL_156:
          BOOL v113 = v74 != 0;
          uint64_t v114 = 27;
          goto LABEL_173;
        case 0x14u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 152;
          goto LABEL_92;
        case 0x15u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 160;
          goto LABEL_92;
        case 0x16u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 168;
LABEL_92:
          id v79 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        case 0x17u:
          char v80 = 0;
          unsigned int v81 = 0;
          uint64_t v82 = 0;
          v5->_hasIsSiriOptIn = 1;
          while (2)
          {
            uint64_t v83 = *v8;
            uint64_t v84 = *(void *)&v4[v83];
            unint64_t v85 = v84 + 1;
            if (v84 == -1 || v85 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v86 = *(unsigned char *)(*(void *)&v4[*v11] + v84);
              *(void *)&v4[v83] = v85;
              v82 |= (unint64_t)(v86 & 0x7F) << v80;
              if (v86 < 0)
              {
                v80 += 7;
                BOOL v19 = v81++ >= 9;
                if (v19)
                {
                  uint64_t v82 = 0;
                  goto LABEL_160;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v82 = 0;
          }
LABEL_160:
          BOOL v113 = v82 != 0;
          uint64_t v114 = 29;
          goto LABEL_173;
        case 0x18u:
          char v87 = 0;
          unsigned int v88 = 0;
          uint64_t v89 = 0;
          v5->_hasIsAssistantEnabled = 1;
          while (2)
          {
            uint64_t v90 = *v8;
            uint64_t v91 = *(void *)&v4[v90];
            unint64_t v92 = v91 + 1;
            if (v91 == -1 || v92 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v93 = *(unsigned char *)(*(void *)&v4[*v11] + v91);
              *(void *)&v4[v90] = v92;
              v89 |= (unint64_t)(v93 & 0x7F) << v87;
              if (v93 < 0)
              {
                v87 += 7;
                BOOL v19 = v88++ >= 9;
                if (v19)
                {
                  uint64_t v89 = 0;
                  goto LABEL_164;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v89 = 0;
          }
LABEL_164:
          BOOL v113 = v89 != 0;
          uint64_t v114 = 31;
          goto LABEL_173;
        case 0x19u:
          char v94 = 0;
          unsigned int v95 = 0;
          uint64_t v96 = 0;
          v5->_hasIsDictationEnabled = 1;
          while (2)
          {
            uint64_t v97 = *v8;
            uint64_t v98 = *(void *)&v4[v97];
            unint64_t v99 = v98 + 1;
            if (v98 == -1 || v99 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v100 = *(unsigned char *)(*(void *)&v4[*v11] + v98);
              *(void *)&v4[v97] = v99;
              v96 |= (unint64_t)(v100 & 0x7F) << v94;
              if (v100 < 0)
              {
                v94 += 7;
                BOOL v19 = v95++ >= 9;
                if (v19)
                {
                  uint64_t v96 = 0;
                  goto LABEL_168;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v96 = 0;
          }
LABEL_168:
          BOOL v113 = v96 != 0;
          uint64_t v114 = 33;
          goto LABEL_173;
        case 0x1Au:
          char v101 = 0;
          unsigned int v102 = 0;
          uint64_t v103 = 0;
          v5->_hasIsMultipleDictationKeyboardsInstalled = 1;
          break;
        case 0x1Bu:
          uint64_t v108 = PBReaderReadString();
          if (!v108) {
            goto LABEL_186;
          }
          id v109 = (void *)v108;
          id v110 = v6;
          goto LABEL_125;
        case 0x1Cu:
          uint64_t v111 = PBReaderReadString();
          if (!v111) {
            goto LABEL_186;
          }
          id v109 = (void *)v111;
          id v110 = v7;
LABEL_125:
          [v110 addObject:v109];

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_186:

          goto LABEL_183;
      }
      while (1)
      {
        uint64_t v104 = *v8;
        uint64_t v105 = *(void *)&v4[v104];
        unint64_t v106 = v105 + 1;
        if (v105 == -1 || v106 > *(void *)&v4[*v9]) {
          break;
        }
        char v107 = *(unsigned char *)(*(void *)&v4[*v11] + v105);
        *(void *)&v4[v104] = v106;
        v103 |= (unint64_t)(v107 & 0x7F) << v101;
        if ((v107 & 0x80) == 0) {
          goto LABEL_170;
        }
        v101 += 7;
        BOOL v19 = v102++ >= 9;
        if (v19)
        {
          uint64_t v103 = 0;
          goto LABEL_172;
        }
      }
      v4[*v10] = 1;
LABEL_170:
      if (v4[*v10]) {
        uint64_t v103 = 0;
      }
LABEL_172:
      BOOL v113 = v103 != 0;
      uint64_t v114 = 35;
LABEL_173:
      *((unsigned char *)&v5->super.super.isa + v114) = v113;
    }
    while (*(void *)&v4[*v8] < *(void *)&v4[*v9]);
  }
  uint64_t v116 = [v6 copy];
  enabledDictationLocales = v5->_enabledDictationLocales;
  v5->_enabledDictationLocales = (NSArray *)v116;

  uint64_t v118 = [v7 copy];
  activeDictationLanguages = v5->_activeDictationLanguages;
  v5->_activeDictationLanguages = (NSArray *)v118;

  int v120 = v4[*v10];
  if (v120) {
LABEL_183:
  }
    uint64_t v121 = 0;
  else {
LABEL_184:
  }
    uint64_t v121 = v5;

  return v121;
}

- (NSString)description
{
  id v21 = [NSString alloc];
  unsigned int v35 = [(BMASRRequestMetricsRecord *)self asrId];
  uint64_t v36 = [(BMASRRequestMetricsRecord *)self requestId];
  uint64_t v3 = NSNumber;
  [(BMASRRequestMetricsRecord *)self timestamp];
  char v34 = objc_msgSend(v3, "numberWithDouble:");
  unint64_t v32 = [(BMASRRequestMetricsRecord *)self invocationType];
  char v33 = [(BMASRRequestMetricsRecord *)self triggerType];
  uint64_t v30 = [(BMASRRequestMetricsRecord *)self asrTask];
  uint64_t v31 = [(BMASRRequestMetricsRecord *)self bundleId];
  unsigned int v28 = [(BMASRRequestMetricsRecord *)self clientId];
  uint64_t v29 = [(BMASRRequestMetricsRecord *)self geoLMRegionId];
  int v20 = [(BMASRRequestMetricsRecord *)self locale];
  BOOL v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMASRRequestMetricsRecord audioDurationMs](self, "audioDurationMs"));
  char v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMASRRequestMetricsRecord recognitionDurationMs](self, "recognitionDurationMs"));
  char v18 = BMASRRequestMetricsRecordCompletionStateAsString([(BMASRRequestMetricsRecord *)self completionState]);
  id v4 = NSNumber;
  [(BMASRRequestMetricsRecord *)self snrRatio];
  id v26 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v5 = NSNumber;
  [(BMASRRequestMetricsRecord *)self avgPitch];
  unint64_t v25 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord jitLmeUsed](self, "jitLmeUsed"));
  unint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord aotLmeUsed](self, "aotLmeUsed"));
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord jitLmeRecognized](self, "jitLmeRecognized"));
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord aotLmeRecognized](self, "aotLmeRecognized"));
  unint64_t v14 = [(BMASRRequestMetricsRecord *)self deviceClass];
  unsigned int v13 = [(BMASRRequestMetricsRecord *)self deviceType];
  uint64_t v16 = [(BMASRRequestMetricsRecord *)self deviceBuild];
  char v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord isSiriOptIn](self, "isSiriOptIn"));
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord isAssistantEnabled](self, "isAssistantEnabled"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord isDictationEnabled](self, "isDictationEnabled"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMASRRequestMetricsRecord isMultipleDictationKeyboardsInstalled](self, "isMultipleDictationKeyboardsInstalled"));
  uint64_t v9 = [(BMASRRequestMetricsRecord *)self enabledDictationLocales];
  long long v10 = [(BMASRRequestMetricsRecord *)self activeDictationLanguages];
  uint64_t v22 = objc_msgSend(v21, "initWithFormat:", @"BMASRRequestMetricsRecord with asrId: %@, requestId: %@, timestamp: %@, invocationType: %@, triggerType: %@, asrTask: %@, bundleId: %@, clientId: %@, geoLMRegionId: %@, locale: %@, audioDurationMs: %@, recognitionDurationMs: %@, completionState: %@, snrRatio: %@, avgPitch: %@, jitLmeUsed: %@, aotLmeUsed: %@, jitLmeRecognized: %@, aotLmeRecognized: %@, deviceClass: %@, deviceType: %@, deviceBuild: %@, isSiriOptIn: %@, isAssistantEnabled: %@, isDictationEnabled: %@, isMultipleDictationKeyboardsInstalled: %@, enabledDictationLocales: %@, activeDictationLanguages: %@", v35, v36, v34, v32, v33, v30, v31, v28, v29, v20, v19, v27, v18, v26, v25, v24,
                  v17,
                  v23,
                  v15,
                  v14,
                  v13,
                  v16,
                  v12,
                  v6,
                  v7,
                  v8,
                  v9,
                  v10);

  return (NSString *)v22;
}

- (BMASRRequestMetricsRecord)initWithAsrId:(id)a3 requestId:(id)a4 timestamp:(id)a5 invocationType:(id)a6 triggerType:(id)a7 asrTask:(id)a8 bundleId:(id)a9 clientId:(id)a10 geoLMRegionId:(id)a11 locale:(id)a12 audioDurationMs:(id)a13 recognitionDurationMs:(id)a14 completionState:(int)a15 snrRatio:(id)a16 avgPitch:(id)a17 jitLmeUsed:(id)a18 aotLmeUsed:(id)a19 jitLmeRecognized:(id)a20 aotLmeRecognized:(id)a21 deviceClass:(id)a22 deviceType:(id)a23 deviceBuild:(id)a24 isSiriOptIn:(id)a25 isAssistantEnabled:(id)a26 isDictationEnabled:(id)a27 isMultipleDictationKeyboardsInstalled:(id)a28 enabledDictationLocales:(id)a29 activeDictationLanguages:(id)a30
{
  id v69 = a3;
  id v52 = a4;
  id v68 = a4;
  id v35 = a5;
  id v53 = a6;
  id v67 = a6;
  id v54 = a7;
  id v66 = a7;
  id v55 = a8;
  id v65 = a8;
  id v64 = a9;
  id v63 = a10;
  id v62 = a11;
  id v61 = a12;
  id v36 = a13;
  id v72 = a14;
  id v76 = a16;
  id v37 = a17;
  id v75 = a18;
  id v74 = a19;
  id v38 = a20;
  id v73 = a21;
  id v60 = a22;
  id v59 = a23;
  id v58 = a24;
  id v39 = a25;
  id v40 = a26;
  id v71 = a27;
  id v70 = a28;
  id v57 = a29;
  id v41 = a30;
  v77.receiver = self;
  v77.super_class = (Class)BMASRRequestMetricsRecord;
  uint64_t v42 = [(BMEventBase *)&v77 init];
  if (v42)
  {
    v42->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v42->_asrId, a3);
    objc_storeStrong((id *)&v42->_requestId, v52);
    if (v35)
    {
      v42->_hasTimestamp = 1;
      [v35 doubleValue];
    }
    else
    {
      v42->_hasTimestamp = 0;
      double v43 = -1.0;
    }
    uint64_t v44 = v39;
    v42->_timestamp = v43;
    objc_storeStrong((id *)&v42->_invocationType, v53);
    objc_storeStrong((id *)&v42->_triggerType, v54);
    objc_storeStrong((id *)&v42->_asrTask, v55);
    objc_storeStrong((id *)&v42->_bundleId, a9);
    objc_storeStrong((id *)&v42->_clientId, a10);
    objc_storeStrong((id *)&v42->_geoLMRegionId, a11);
    objc_storeStrong((id *)&v42->_locale, a12);
    if (v36)
    {
      v42->_hasAudioDurationMs = 1;
      id v45 = v36;
      unsigned int v46 = [v36 unsignedIntValue];
    }
    else
    {
      id v45 = 0;
      unsigned int v46 = 0;
      v42->_hasAudioDurationMs = 0;
    }
    v42->_audioDurationMs = v46;
    unsigned int v47 = v72;
    if (v72)
    {
      v42->_hasRecognitionDurationMs = 1;
      unsigned int v47 = [v72 unsignedIntValue];
    }
    else
    {
      v42->_hasRecognitionDurationMs = 0;
    }
    v42->_recognitionDurationMs = v47;
    v42->_completionState = a15;
    if (v76)
    {
      v42->_hasSnrRatio = 1;
      [v76 doubleValue];
    }
    else
    {
      v42->_hasSnrRatio = 0;
      double v48 = -1.0;
    }
    id v36 = v45;
    v42->_snrRatio = v48;
    id v39 = v44;
    if (v37)
    {
      v42->_hasAvgPitch = 1;
      [v37 doubleValue];
    }
    else
    {
      v42->_hasAvgPitch = 0;
      double v49 = -1.0;
    }
    v42->_avgPitch = v49;
    if (v75)
    {
      v42->_hasJitLmeUsed = 1;
      v42->_jitLmeUsed = [v75 BOOLValue];
    }
    else
    {
      v42->_hasJitLmeUsed = 0;
      v42->_jitLmeUsed = 0;
    }
    if (v74)
    {
      v42->_hasAotLmeUsed = 1;
      v42->_aotLmeUsed = [v74 BOOLValue];
    }
    else
    {
      v42->_hasAotLmeUsed = 0;
      v42->_aotLmeUsed = 0;
    }
    if (v38)
    {
      v42->_hasJitLmeRecognized = 1;
      v42->_jitLmeRecognized = [v38 BOOLValue];
    }
    else
    {
      v42->_hasJitLmeRecognized = 0;
      v42->_jitLmeRecognized = 0;
    }
    if (v73)
    {
      v42->_hasAotLmeRecognized = 1;
      v42->_aotLmeRecognized = [v73 BOOLValue];
    }
    else
    {
      v42->_hasAotLmeRecognized = 0;
      v42->_aotLmeRecognized = 0;
    }
    objc_storeStrong((id *)&v42->_deviceClass, a22);
    objc_storeStrong((id *)&v42->_deviceType, a23);
    objc_storeStrong((id *)&v42->_deviceBuild, a24);
    if (v44)
    {
      v42->_hasIsSiriOptIn = 1;
      v42->_isSiriOptIn = [v44 BOOLValue];
    }
    else
    {
      v42->_hasIsSiriOptIn = 0;
      v42->_isSiriOptIn = 0;
    }
    if (v40)
    {
      v42->_hasIsAssistantEnabled = 1;
      v42->_isAssistantEnabled = [v40 BOOLValue];
    }
    else
    {
      v42->_hasIsAssistantEnabled = 0;
      v42->_isAssistantEnabled = 0;
    }
    if (v71)
    {
      v42->_hasIsDictationEnabled = 1;
      v42->_isDictationEnabled = [v71 BOOLValue];
    }
    else
    {
      v42->_hasIsDictationEnabled = 0;
      v42->_isDictationEnabled = 0;
    }
    if (v70)
    {
      v42->_hasIsMultipleDictationKeyboardsInstalled = 1;
      v42->_isMultipleDictationKeyboardsInstalled = [v70 BOOLValue];
    }
    else
    {
      v42->_hasIsMultipleDictationKeyboardsInstalled = 0;
      v42->_isMultipleDictationKeyboardsInstalled = 0;
    }
    objc_storeStrong((id *)&v42->_enabledDictationLocales, a29);
    objc_storeStrong((id *)&v42->_activeDictationLanguages, a30);
  }

  return v42;
}

+ (id)protoFields
{
  v32[28] = *MEMORY[0x1E4F143B8];
  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"asrId" number:1 type:13 subMessageClass:0];
  v32[0] = v31;
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"requestId" number:2 type:13 subMessageClass:0];
  v32[1] = v30;
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:3 type:0 subMessageClass:0];
  v32[2] = v29;
  unsigned int v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"invocationType" number:4 type:13 subMessageClass:0];
  v32[3] = v28;
  char v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"triggerType" number:5 type:13 subMessageClass:0];
  v32[4] = v27;
  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"asrTask" number:6 type:13 subMessageClass:0];
  v32[5] = v26;
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleId" number:7 type:13 subMessageClass:0];
  v32[6] = v25;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientId" number:8 type:13 subMessageClass:0];
  v32[7] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"geoLMRegionId" number:9 type:13 subMessageClass:0];
  v32[8] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"locale" number:10 type:13 subMessageClass:0];
  v32[9] = v22;
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"audioDurationMs" number:11 type:4 subMessageClass:0];
  v32[10] = v21;
  int v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"recognitionDurationMs" number:12 type:4 subMessageClass:0];
  v32[11] = v20;
  BOOL v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"completionState" number:13 type:4 subMessageClass:0];
  v32[12] = v19;
  char v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"snrRatio" number:14 type:0 subMessageClass:0];
  v32[13] = v18;
  unint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"avgPitch" number:15 type:0 subMessageClass:0];
  v32[14] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"jitLmeUsed" number:16 type:12 subMessageClass:0];
  v32[15] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"aotLmeUsed" number:17 type:12 subMessageClass:0];
  v32[16] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"jitLmeRecognized" number:18 type:12 subMessageClass:0];
  v32[17] = v14;
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"aotLmeRecognized" number:19 type:12 subMessageClass:0];
  v32[18] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceClass" number:20 type:13 subMessageClass:0];
  v32[19] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceType" number:21 type:13 subMessageClass:0];
  v32[20] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceBuild" number:22 type:13 subMessageClass:0];
  v32[21] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSiriOptIn" number:23 type:12 subMessageClass:0];
  v32[22] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isAssistantEnabled" number:24 type:12 subMessageClass:0];
  v32[23] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isDictationEnabled" number:25 type:12 subMessageClass:0];
  v32[24] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isMultipleDictationKeyboardsInstalled" number:26 type:12 subMessageClass:0];
  v32[25] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"enabledDictationLocales" number:27 type:13 subMessageClass:0];
  v32[26] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activeDictationLanguages" number:28 type:13 subMessageClass:0];
  v32[27] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:28];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7A70;
}

+ (id)columns
{
  v32[28] = *MEMORY[0x1E4F143B8];
  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"asrId" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"requestId" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  unsigned int v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"invocationType" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  char v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"triggerType" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"asrTask" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleId" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientId" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"geoLMRegionId" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"locale" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"audioDurationMs" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:4 convertedType:0];
  int v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"recognitionDurationMs" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:4 convertedType:0];
  BOOL v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"completionState" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:4 convertedType:0];
  char v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"snrRatio" dataType:1 requestOnly:0 fieldNumber:14 protoDataType:0 convertedType:0];
  unint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"avgPitch" dataType:1 requestOnly:0 fieldNumber:15 protoDataType:0 convertedType:0];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"jitLmeUsed" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:12 convertedType:0];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"aotLmeUsed" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:12 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"jitLmeRecognized" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:12 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"aotLmeRecognized" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:12 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceClass" dataType:2 requestOnly:0 fieldNumber:20 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceType" dataType:2 requestOnly:0 fieldNumber:21 protoDataType:13 convertedType:0];
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceBuild" dataType:2 requestOnly:0 fieldNumber:22 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSiriOptIn" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:12 convertedType:0];
  char v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isAssistantEnabled" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:12 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isDictationEnabled" dataType:0 requestOnly:0 fieldNumber:25 protoDataType:12 convertedType:0];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMultipleDictationKeyboardsInstalled" dataType:0 requestOnly:0 fieldNumber:26 protoDataType:12 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"enabledDictationLocales_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_141_92529];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"activeDictationLanguages_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_143_92530];
  v32[0] = v31;
  v32[1] = v30;
  v32[2] = v29;
  v32[3] = v28;
  v32[4] = v27;
  v32[5] = v26;
  v32[6] = v25;
  v32[7] = v24;
  v32[8] = v23;
  v32[9] = v22;
  v32[10] = v21;
  v32[11] = v20;
  v32[12] = v19;
  v32[13] = v18;
  v32[14] = v17;
  v32[15] = v16;
  v32[16] = v15;
  v32[17] = v14;
  v32[18] = v2;
  v32[19] = v3;
  v32[20] = v4;
  v32[21] = v13;
  v32[22] = v5;
  v32[23] = v12;
  v32[24] = v6;
  v32[25] = v11;
  v32[26] = v7;
  v32[27] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:28];

  return v10;
}

id __36__BMASRRequestMetricsRecord_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _activeDictationLanguagesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __36__BMASRRequestMetricsRecord_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _enabledDictationLocalesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMASRRequestMetricsRecord alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[10] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end