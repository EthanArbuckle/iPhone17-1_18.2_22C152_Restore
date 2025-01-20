@interface VCSessionMediaNegotiator
+ (BOOL)initializeLocalConfiguration:(id)a3 negotiationData:(id)a4 deviceRole:(int)a5 preferredAudioPayload:(int)a6;
+ (id)mediaBlobForVersion:(int)a3 negotiationData:(id)a4;
+ (id)negotiationDataWithVersion1:(id)a3 version2:(id)a4;
+ (id)negotiationDataWithVersion:(int)a3 mediaBlob:(id)a4;
+ (id)serializeNegotiationData:(id)a3;
+ (id)streamGroupIDsWithMediaBlob:(id)a3;
+ (id)unserializeNegotiationData:(id)a3;
- (BOOL)processRemoteNegotiationData:(id)a3;
- (NSArray)negotiatedStreamGroups;
- (VCMediaNegotiatorLocalConfiguration)localSettings;
- (VCMediaNegotiatorResults)negotiatedSettings;
- (VCMediaNegotiatorResultsAudio)negotiatedAudioSettings;
- (VCMediaNegotiatorResultsFaceTimeSettings)negotiatedFaceTimeSettings;
- (VCMediaNegotiatorResultsMediaRecorder)negotiatedMediaRecorderSettings;
- (VCMediaNegotiatorResultsVideo)negotiatedScreenSettings;
- (VCMediaNegotiatorResultsVideo)negotiatedVideoSettings;
- (VCSessionMediaNegotiator)initWithLocalConfiguration:(id)a3;
- (id)negotiatedResultsForGroupID:(unsigned int)a3;
- (id)negotiationData;
- (unsigned)remoteMaxBandwidthForArbiterMode:(unsigned __int8)a3 connectionType:(int)a4;
- (void)dealloc;
@end

@implementation VCSessionMediaNegotiator

- (VCSessionMediaNegotiator)initWithLocalConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCSessionMediaNegotiator;
  v4 = [(VCSessionMediaNegotiator *)&v11 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    v4->_mediaNegotiatorMap = (NSMutableDictionary *)v5;
    if (v5)
    {
      v6 = [[VCMediaNegotiator alloc] initWithLocalSettings:a3];
      if (v6)
      {
        v7 = v6;
        [(NSMutableDictionary *)v4->_mediaNegotiatorMap setObject:v6 forKeyedSubscript:&unk_1F3DC43C8];

        v8 = [(VCMediaNegotiatorBase *)[VCMediaNegotiatorV2 alloc] initWithLocalSettings:a3];
        if (v8)
        {
          v9 = v8;
          [(NSMutableDictionary *)v4->_mediaNegotiatorMap setObject:v8 forKeyedSubscript:&unk_1F3DC43E0];

          v4->_localSettings = (VCMediaNegotiatorLocalConfiguration *)a3;
          return v4;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaNegotiator initWithLocalConfiguration:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaNegotiator initWithLocalConfiguration:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaNegotiator initWithLocalConfiguration:]();
      }
    }

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionMediaNegotiator;
  [(VCSessionMediaNegotiator *)&v3 dealloc];
}

+ (id)mediaBlobForVersion:(int)a3 negotiationData:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = +[VCSessionMediaNegotiator unserializeNegotiationData:a4];
  uint64_t v6 = [NSNumber numberWithInt:v4];

  return (id)[v5 objectForKeyedSubscript:v6];
}

+ (id)negotiationDataWithVersion:(int)a3 mediaBlob:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", a4, objc_msgSend(NSNumber, "numberWithInt:", v5));

  return +[VCSessionMediaNegotiator serializeNegotiationData:v6];
}

+ (id)negotiationDataWithVersion1:(id)a3 version2:(id)a4
{
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  [v6 setObject:a3 forKeyedSubscript:&unk_1F3DC43C8];
  [v6 setObject:a4 forKeyedSubscript:&unk_1F3DC43E0];

  return +[VCSessionMediaNegotiator serializeNegotiationData:v6];
}

- (id)negotiationData
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  uint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  p_mediaNegotiatorMap = &self->_mediaNegotiatorMap;
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_mediaNegotiatorMap, "count"));
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  objc_super v3 = *p_mediaNegotiatorMap;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__VCSessionMediaNegotiator_negotiationData__block_invoke;
  v6[3] = &unk_1E6DB67B8;
  v6[4] = &v7;
  v6[5] = &v11;
  [(NSMutableDictionary *)v3 enumerateKeysAndObjectsUsingBlock:v6];
  if (*((unsigned char *)v8 + 24)) {
    id v4 = +[VCSessionMediaNegotiator serializeNegotiationData:v12[5]];
  }
  else {
    id v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

uint64_t __43__VCSessionMediaNegotiator_negotiationData__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v7 = [a3 negotiationData];
  if (!v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v8 setObject:v7 forKeyedSubscript:a2];
}

- (BOOL)processRemoteNegotiationData:(id)a3
{
  p_activeNegotiator = &self->_activeNegotiator;
  if (self->_activeNegotiator)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      -[VCSessionMediaNegotiator processRemoteNegotiationData:].cold.4();
    }
  }
  else
  {
    id v5 = +[VCSessionMediaNegotiator unserializeNegotiationData:a3];
    if ([v5 count] == 1)
    {
      uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "allKeys"), "firstObject");
      uint64_t v7 = (void *)[(NSMutableDictionary *)self->_mediaNegotiatorMap objectForKeyedSubscript:v6];
      if (v7)
      {
        v8 = v7;
        if (objc_msgSend(v7, "processRemoteNegotiationData:", objc_msgSend(v5, "objectForKeyedSubscript:", v6)))
        {
          *p_activeNegotiator = (VCMediaNegotiatorProtocol *)v8;
          LOBYTE(v9) = 1;
          return v9;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v9) {
            return v9;
          }
          -[VCSessionMediaNegotiator processRemoteNegotiationData:]();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v9) {
          return v9;
        }
        -[VCSessionMediaNegotiator processRemoteNegotiationData:]();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      -[VCSessionMediaNegotiator processRemoteNegotiationData:]();
    }
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (VCMediaNegotiatorResults)negotiatedSettings
{
  return (VCMediaNegotiatorResults *)[(VCMediaNegotiatorProtocol *)self->_activeNegotiator negotiatedSettings];
}

- (VCMediaNegotiatorResultsAudio)negotiatedAudioSettings
{
  return (VCMediaNegotiatorResultsAudio *)[(VCMediaNegotiatorProtocol *)self->_activeNegotiator negotiatedAudioSettings];
}

- (VCMediaNegotiatorResultsVideo)negotiatedVideoSettings
{
  return (VCMediaNegotiatorResultsVideo *)[(VCMediaNegotiatorProtocol *)self->_activeNegotiator negotiatedVideoSettings];
}

- (VCMediaNegotiatorResultsVideo)negotiatedScreenSettings
{
  return (VCMediaNegotiatorResultsVideo *)[(VCMediaNegotiatorProtocol *)self->_activeNegotiator negotiatedScreenSettings];
}

- (VCMediaNegotiatorResultsMediaRecorder)negotiatedMediaRecorderSettings
{
  return (VCMediaNegotiatorResultsMediaRecorder *)[(VCMediaNegotiatorProtocol *)self->_activeNegotiator negotiatedMediaRecorderSettings];
}

- (VCMediaNegotiatorResultsFaceTimeSettings)negotiatedFaceTimeSettings
{
  return (VCMediaNegotiatorResultsFaceTimeSettings *)[(VCMediaNegotiatorProtocol *)self->_activeNegotiator negotiatedFaceTimeSettings];
}

- (NSArray)negotiatedStreamGroups
{
  return (NSArray *)[(VCMediaNegotiatorProtocol *)self->_activeNegotiator negotiatedStreamGroups];
}

- (id)negotiatedResultsForGroupID:(unsigned int)a3
{
  return (id)[(VCMediaNegotiatorProtocol *)self->_activeNegotiator negotiatedResultsForGroupID:*(void *)&a3];
}

+ (id)streamGroupIDsWithMediaBlob:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = +[VCSessionMediaNegotiator unserializeNegotiationData:a3];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = -1;
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy__8;
  uint64_t v13 = __Block_byref_object_dispose__8;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__VCSessionMediaNegotiator_streamGroupIDsWithMediaBlob___block_invoke;
  v8[3] = &unk_1E6DB67E0;
  v8[4] = &v15;
  v8[5] = &v9;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];
  if (!v10[5])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionMediaNegotiator streamGroupIDsWithMediaBlob:]();
      }
    }
    goto LABEL_10;
  }
  int v4 = *((_DWORD *)v16 + 6);
  if (!v4)
  {
    id v5 = off_1E6DB3038;
    goto LABEL_6;
  }
  if (v4 != 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionMediaNegotiator streamGroupIDsWithMediaBlob:]();
      }
    }
LABEL_10:
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  id v5 = off_1E6DB3040;
LABEL_6:
  uint64_t v6 = (void *)-[__objc2_class streamGroupIDsWithMediaBlob:](*v5, "streamGroupIDsWithMediaBlob:");
LABEL_11:
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

uint64_t __56__VCSessionMediaNegotiator_streamGroupIDsWithMediaBlob___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 intValue];
  if ((int)result <= 1)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    if ((int)result > *(_DWORD *)(v6 + 24))
    {
      *(_DWORD *)(v6 + 24) = result;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a3;
    }
  }
  return result;
}

- (unsigned)remoteMaxBandwidthForArbiterMode:(unsigned __int8)a3 connectionType:(int)a4
{
  return [(VCMediaNegotiatorProtocol *)self->_activeNegotiator remoteMaxBandwidthForArbiterMode:a3 connectionType:*(void *)&a4];
}

+ (BOOL)initializeLocalConfiguration:(id)a3 negotiationData:(id)a4 deviceRole:(int)a5 preferredAudioPayload:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  id v9 = +[VCSessionMediaNegotiator unserializeNegotiationData:a4];
  if (v9)
  {
    char v10 = v9;
    uint64_t v11 = 0;
    char v12 = 1;
    while (1)
    {
      uint64_t v13 = objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v11));
      if (!v13) {
        break;
      }
      if ((v12 & 1) == 0)
      {
        if (+[VCMediaNegotiatorV2 initializeLocalConfiguration:a3 negotiationData:v13 deviceRole:v7 preferredAudioPayload:v6])
        {
          LOBYTE(v15) = 1;
          return v15;
        }
LABEL_6:
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_18;
        }
        VRTraceErrorLogLevelToCSTR();
        BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (v15)
        {
          +[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]();
          goto LABEL_18;
        }
        return v15;
      }
      BOOL v14 = +[VCMediaNegotiator initializeLocalConfiguration:a3 negotiationData:v13 deviceRole:v7 preferredAudioPayload:v6];
      char v12 = 0;
      uint64_t v11 = 1;
      if (!v14) {
        goto LABEL_6;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_18;
    }
    VRTraceErrorLogLevelToCSTR();
    BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (v15)
    {
      +[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]();
      goto LABEL_18;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v15) {
        return v15;
      }
      +[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]();
    }
LABEL_18:
    LOBYTE(v15) = 0;
  }
  return v15;
}

+ (id)serializeNegotiationData:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:a3];

  return (id)[v3 archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
}

+ (id)unserializeNegotiationData:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v8 = (void *)MEMORY[0x1E4F28DC0];

  return (id)[v8 _strictlyUnarchivedObjectOfClasses:v7 fromData:a3 error:0];
}

- (VCMediaNegotiatorLocalConfiguration)localSettings
{
  return self->_localSettings;
}

- (void)initWithLocalConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the negotiator map", v2, v3, v4, v5, v6);
}

- (void)initWithLocalConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the negotiator for version 1 of the media blob", v2, v3, v4, v5, v6);
}

- (void)initWithLocalConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the negotiator for version 2 of the media blob", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No negotiator found for media blob version=%@");
}

- (void)processRemoteNegotiationData:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate the media blob with version=%@");
}

- (void)processRemoteNegotiationData:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to extract the media blob from the negotiation data", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Active negotiator found, negotiation already performed. ActiveNegotiator=%@");
}

+ (void)streamGroupIDsWithMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to extract the media blob from the negotiation data", v2, v3, v4, v5, v6);
}

+ (void)streamGroupIDsWithMediaBlob:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "+[VCSessionMediaNegotiator streamGroupIDsWithMediaBlob:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unknown blob version=%d", v2, *(const char **)v3, (unint64_t)"+[VCSessionMediaNegotiator streamGroupIDsWithMediaBlob:]" >> 16, 169);
}

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to unserialize the negotiation data", v2, v3, v4, v5, v6);
}

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve the negotiation data for version=%d", v2, *(const char **)v3, (unint64_t)"+[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]" >> 16, 190);
}

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize the local configuration for version=%u", v2, *(const char **)v3, (unint64_t)"+[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]" >> 16, 204);
}

@end