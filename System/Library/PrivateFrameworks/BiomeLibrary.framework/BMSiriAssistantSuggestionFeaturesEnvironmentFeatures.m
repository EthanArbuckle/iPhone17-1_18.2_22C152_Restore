@interface BMSiriAssistantSuggestionFeaturesEnvironmentFeatures
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriAssistantSuggestionFeaturesEnvironmentFeatures)initWithFocusMode:(id)a3 deviceMotion:(id)a4 location:(int)a5 isPlayingMedia:(id)a6 isAirplaneMode:(id)a7 isTimerRunning:(id)a8 isConnectedToWifi:(id)a9 hasInternetConnection:(id)a10 isScreenSharing:(id)a11 audioIsMuted:(id)a12 screenBrightness:(id)a13 homeGraph:(id)a14 batteryIsCharging:(id)a15 isLowBatteryMode:(id)a16;
- (BMSiriAssistantSuggestionFeaturesEnvironmentFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus)homeGraph;
- (BOOL)audioIsMuted;
- (BOOL)batteryIsCharging;
- (BOOL)hasAudioIsMuted;
- (BOOL)hasBatteryIsCharging;
- (BOOL)hasHasInternetConnection;
- (BOOL)hasInternetConnection;
- (BOOL)hasIsAirplaneMode;
- (BOOL)hasIsConnectedToWifi;
- (BOOL)hasIsLowBatteryMode;
- (BOOL)hasIsScreenSharing;
- (BOOL)hasIsTimerRunning;
- (BOOL)hasScreenBrightness;
- (BOOL)isAirplaneMode;
- (BOOL)isConnectedToWifi;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowBatteryMode;
- (BOOL)isScreenSharing;
- (BOOL)isTimerRunning;
- (NSString)description;
- (NSString)deviceMotion;
- (NSString)focusMode;
- (NSString)isPlayingMedia;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)location;
- (int)screenBrightness;
- (unsigned)dataVersion;
- (void)setHasAudioIsMuted:(BOOL)a3;
- (void)setHasBatteryIsCharging:(BOOL)a3;
- (void)setHasHasInternetConnection:(BOOL)a3;
- (void)setHasIsAirplaneMode:(BOOL)a3;
- (void)setHasIsConnectedToWifi:(BOOL)a3;
- (void)setHasIsLowBatteryMode:(BOOL)a3;
- (void)setHasIsScreenSharing:(BOOL)a3;
- (void)setHasIsTimerRunning:(BOOL)a3;
- (void)setHasScreenBrightness:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriAssistantSuggestionFeaturesEnvironmentFeatures

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeGraph, 0);
  objc_storeStrong((id *)&self->_isPlayingMedia, 0);
  objc_storeStrong((id *)&self->_deviceMotion, 0);

  objc_storeStrong((id *)&self->_focusMode, 0);
}

- (void)setHasIsLowBatteryMode:(BOOL)a3
{
  self->_hasIsLowBatteryMode = a3;
}

- (BOOL)hasIsLowBatteryMode
{
  return self->_hasIsLowBatteryMode;
}

- (BOOL)isLowBatteryMode
{
  return self->_isLowBatteryMode;
}

- (void)setHasBatteryIsCharging:(BOOL)a3
{
  self->_hasBatteryIsCharging = a3;
}

- (BOOL)hasBatteryIsCharging
{
  return self->_hasBatteryIsCharging;
}

- (BOOL)batteryIsCharging
{
  return self->_batteryIsCharging;
}

- (BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus)homeGraph
{
  return self->_homeGraph;
}

- (void)setHasScreenBrightness:(BOOL)a3
{
  self->_hasScreenBrightness = a3;
}

- (BOOL)hasScreenBrightness
{
  return self->_hasScreenBrightness;
}

- (int)screenBrightness
{
  return self->_screenBrightness;
}

- (void)setHasAudioIsMuted:(BOOL)a3
{
  self->_hasAudioIsMuted = a3;
}

- (BOOL)hasAudioIsMuted
{
  return self->_hasAudioIsMuted;
}

- (BOOL)audioIsMuted
{
  return self->_audioIsMuted;
}

- (void)setHasIsScreenSharing:(BOOL)a3
{
  self->_hasIsScreenSharing = a3;
}

- (BOOL)hasIsScreenSharing
{
  return self->_hasIsScreenSharing;
}

- (BOOL)isScreenSharing
{
  return self->_isScreenSharing;
}

- (void)setHasHasInternetConnection:(BOOL)a3
{
  self->_hasHasInternetConnection = a3;
}

- (BOOL)hasHasInternetConnection
{
  return self->_hasHasInternetConnection;
}

- (BOOL)hasInternetConnection
{
  return self->_hasInternetConnection;
}

- (void)setHasIsConnectedToWifi:(BOOL)a3
{
  self->_hasIsConnectedToWifi = a3;
}

- (BOOL)hasIsConnectedToWifi
{
  return self->_hasIsConnectedToWifi;
}

- (BOOL)isConnectedToWifi
{
  return self->_isConnectedToWifi;
}

- (void)setHasIsTimerRunning:(BOOL)a3
{
  self->_hasIsTimerRunning = a3;
}

- (BOOL)hasIsTimerRunning
{
  return self->_hasIsTimerRunning;
}

- (BOOL)isTimerRunning
{
  return self->_isTimerRunning;
}

- (void)setHasIsAirplaneMode:(BOOL)a3
{
  self->_hasIsAirplaneMode = a3;
}

- (BOOL)hasIsAirplaneMode
{
  return self->_hasIsAirplaneMode;
}

- (BOOL)isAirplaneMode
{
  return self->_isAirplaneMode;
}

- (NSString)isPlayingMedia
{
  return self->_isPlayingMedia;
}

- (int)location
{
  return self->_location;
}

- (NSString)deviceMotion
{
  return self->_deviceMotion;
}

- (NSString)focusMode
{
  return self->_focusMode;
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
    v6 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self focusMode];
    uint64_t v7 = [v5 focusMode];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self focusMode];
      v10 = [v5 focusMode];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_65;
      }
    }
    v13 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self deviceMotion];
    uint64_t v14 = [v5 deviceMotion];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self deviceMotion];
      v17 = [v5 deviceMotion];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_65;
      }
    }
    int v19 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self location];
    if (v19 == [v5 location])
    {
      v20 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self isPlayingMedia];
      uint64_t v21 = [v5 isPlayingMedia];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self isPlayingMedia];
        v24 = [v5 isPlayingMedia];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_65;
        }
      }
      if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsAirplaneMode]
        || [v5 hasIsAirplaneMode])
      {
        if (![(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsAirplaneMode]) {
          goto LABEL_65;
        }
        if (![v5 hasIsAirplaneMode]) {
          goto LABEL_65;
        }
        int v26 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self isAirplaneMode];
        if (v26 != [v5 isAirplaneMode]) {
          goto LABEL_65;
        }
      }
      if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsTimerRunning]
        || [v5 hasIsTimerRunning])
      {
        if (![(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsTimerRunning]) {
          goto LABEL_65;
        }
        if (![v5 hasIsTimerRunning]) {
          goto LABEL_65;
        }
        int v27 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self isTimerRunning];
        if (v27 != [v5 isTimerRunning]) {
          goto LABEL_65;
        }
      }
      if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsConnectedToWifi]
        || [v5 hasIsConnectedToWifi])
      {
        if (![(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsConnectedToWifi]) {
          goto LABEL_65;
        }
        if (![v5 hasIsConnectedToWifi]) {
          goto LABEL_65;
        }
        int v28 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self isConnectedToWifi];
        if (v28 != [v5 isConnectedToWifi]) {
          goto LABEL_65;
        }
      }
      if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasHasInternetConnection](self, "hasHasInternetConnection")|| [v5 hasHasInternetConnection])
      {
        if (![(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasHasInternetConnection])goto LABEL_65; {
        if (![v5 hasHasInternetConnection])
        }
          goto LABEL_65;
        int v29 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasInternetConnection];
        if (v29 != [v5 hasInternetConnection]) {
          goto LABEL_65;
        }
      }
      if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsScreenSharing]
        || [v5 hasIsScreenSharing])
      {
        if (![(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsScreenSharing]) {
          goto LABEL_65;
        }
        if (![v5 hasIsScreenSharing]) {
          goto LABEL_65;
        }
        int v30 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self isScreenSharing];
        if (v30 != [v5 isScreenSharing]) {
          goto LABEL_65;
        }
      }
      if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasAudioIsMuted]
        || [v5 hasAudioIsMuted])
      {
        if (![(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasAudioIsMuted]) {
          goto LABEL_65;
        }
        if (![v5 hasAudioIsMuted]) {
          goto LABEL_65;
        }
        int v31 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self audioIsMuted];
        if (v31 != [v5 audioIsMuted]) {
          goto LABEL_65;
        }
      }
      if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasScreenBrightness]
        || [v5 hasScreenBrightness])
      {
        if (![(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasScreenBrightness]) {
          goto LABEL_65;
        }
        if (![v5 hasScreenBrightness]) {
          goto LABEL_65;
        }
        int v32 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self screenBrightness];
        if (v32 != [v5 screenBrightness]) {
          goto LABEL_65;
        }
      }
      v33 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self homeGraph];
      uint64_t v34 = [v5 homeGraph];
      if (v33 == (void *)v34)
      {
      }
      else
      {
        v35 = (void *)v34;
        v36 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self homeGraph];
        v37 = [v5 homeGraph];
        int v38 = [v36 isEqual:v37];

        if (!v38) {
          goto LABEL_65;
        }
      }
      if (![(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasBatteryIsCharging]
        && ![v5 hasBatteryIsCharging]
        || [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasBatteryIsCharging]
        && [v5 hasBatteryIsCharging]
        && (int v39 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self batteryIsCharging],
            v39 == [v5 batteryIsCharging]))
      {
        if (![(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsLowBatteryMode]
          && ![v5 hasIsLowBatteryMode])
        {
          LOBYTE(v12) = 1;
          goto LABEL_66;
        }
        if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsLowBatteryMode]
          && [v5 hasIsLowBatteryMode])
        {
          BOOL v40 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self isLowBatteryMode];
          int v12 = v40 ^ [v5 isLowBatteryMode] ^ 1;
LABEL_66:

          goto LABEL_67;
        }
      }
    }
LABEL_65:
    LOBYTE(v12) = 0;
    goto LABEL_66;
  }
  LOBYTE(v12) = 0;
LABEL_67:

  return v12;
}

- (id)jsonDictionary
{
  v47[14] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self focusMode];
  uint64_t v4 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self deviceMotion];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures location](self, "location"));
  uint64_t v6 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self isPlayingMedia];
  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsAirplaneMode])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isAirplaneMode](self, "isAirplaneMode"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsTimerRunning])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isTimerRunning](self, "isTimerRunning"));
    id v45 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v45 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsConnectedToWifi])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isConnectedToWifi](self, "isConnectedToWifi"));
    id v44 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v44 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasHasInternetConnection])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasInternetConnection](self, "hasInternetConnection"));
    id v43 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v43 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsScreenSharing])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isScreenSharing](self, "isScreenSharing"));
    id v42 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v42 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasAudioIsMuted])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures audioIsMuted](self, "audioIsMuted"));
    id v41 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v41 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasScreenBrightness])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures screenBrightness](self, "screenBrightness"));
    id v40 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v40 = 0;
  }
  v8 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self homeGraph];
  int v39 = [v8 jsonDictionary];

  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasBatteryIsCharging])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures batteryIsCharging](self, "batteryIsCharging"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self hasIsLowBatteryMode])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isLowBatteryMode](self, "isLowBatteryMode"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  v46[0] = @"focusMode";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v11;
  v47[0] = v11;
  v46[1] = @"deviceMotion";
  uint64_t v12 = v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  int v32 = (void *)v12;
  v47[1] = v12;
  v46[2] = @"location";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  int v31 = (void *)v13;
  v47[2] = v13;
  v46[3] = @"isPlayingMedia";
  uint64_t v14 = v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  int v30 = (void *)v14;
  v47[3] = v14;
  v46[4] = @"isAirplaneMode";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v4;
  int v29 = (void *)v15;
  v47[4] = v15;
  v46[5] = @"isTimerRunning";
  uint64_t v16 = (uint64_t)v45;
  if (!v45)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v6;
  v47[5] = v16;
  v46[6] = @"isConnectedToWifi";
  uint64_t v17 = (uint64_t)v44;
  if (!v44)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  int v38 = (void *)v3;
  v47[6] = v17;
  v46[7] = @"hasInternetConnection";
  int v18 = v43;
  if (!v43)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = v7;
  v47[7] = v18;
  v46[8] = @"isScreenSharing";
  int v19 = v42;
  if (!v42)
  {
    int v19 = [MEMORY[0x1E4F1CA98] null];
  }
  int v27 = (void *)v17;
  int v28 = (void *)v16;
  v47[8] = v19;
  v46[9] = @"audioIsMuted";
  v20 = v41;
  if (!v41)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v21 = (void *)v5;
  v47[9] = v20;
  v46[10] = @"screenBrightness";
  v22 = v40;
  if (!v40)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v47[10] = v22;
  v46[11] = @"homeGraph";
  v23 = v39;
  if (!v39)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v47[11] = v23;
  v46[12] = @"batteryIsCharging";
  v24 = v9;
  if (!v9)
  {
    v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v47[12] = v24;
  v46[13] = @"isLowBatteryMode";
  int v25 = v10;
  if (!v10)
  {
    int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v47[13] = v25;
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:14];
  if (v10)
  {
    if (v9) {
      goto LABEL_58;
    }
  }
  else
  {

    if (v9) {
      goto LABEL_58;
    }
  }

LABEL_58:
  if (!v39) {

  }
  if (!v40) {
  if (!v41)
  }

  if (!v42) {
  if (!v43)
  }

  if (!v44) {
  if (!v45)
  }

  if (v35)
  {
    if (v36) {
      goto LABEL_74;
    }
  }
  else
  {

    if (v36)
    {
LABEL_74:
      if (v21) {
        goto LABEL_75;
      }
      goto LABEL_84;
    }
  }

  if (v21)
  {
LABEL_75:
    if (v37) {
      goto LABEL_76;
    }
LABEL_85:

    if (v38) {
      goto LABEL_77;
    }
    goto LABEL_86;
  }
LABEL_84:

  if (!v37) {
    goto LABEL_85;
  }
LABEL_76:
  if (v38) {
    goto LABEL_77;
  }
LABEL_86:

LABEL_77:

  return v34;
}

- (BMSiriAssistantSuggestionFeaturesEnvironmentFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v159[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"focusMode"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v130 = 0;
LABEL_4:
    v8 = [v6 objectForKeyedSubscript:@"deviceMotion"];
    v129 = self;
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v9 = 0;
          v24 = 0;
          goto LABEL_94;
        }
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v156 = *MEMORY[0x1E4F28568];
        int v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceMotion"];
        v157 = v27;
        uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v157 forKeys:&v156 count:1];
        uint64_t v29 = v26;
        id v10 = (void *)v28;
        id v9 = 0;
        v24 = 0;
        *a4 = (id)[v25 initWithDomain:v29 code:2 userInfo:v28];
        goto LABEL_93;
      }
      id v9 = v8;
    }
    else
    {
      id v9 = 0;
    }
    id v10 = [v6 objectForKeyedSubscript:@"location"];
    v125 = a4;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v126 = v10;
      }
      else
      {
        id v111 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v63 = v10;
          if (!a4)
          {
            int v27 = 0;
            v24 = 0;
            goto LABEL_93;
          }
          id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v65 = *MEMORY[0x1E4F502C8];
          uint64_t v154 = *MEMORY[0x1E4F28568];
          id v127 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"location"];
          id v155 = v127;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v155 forKeys:&v154 count:1];
          uint64_t v11 = v66 = a4;
          int v27 = 0;
          v24 = 0;
          id *v66 = (id)[v64 initWithDomain:v65 code:2 userInfo:v11];
          id v10 = v63;
          id v9 = v111;
LABEL_92:

LABEL_93:
          self = v129;
          goto LABEL_94;
        }
        id v126 = [NSNumber numberWithInt:BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHashedLocationFromString(v10)];
      }
    }
    else
    {
      id v126 = 0;
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"isPlayingMedia"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v125)
        {
          id v127 = 0;
          v24 = 0;
          int v27 = v126;
          goto LABEL_92;
        }
        id v128 = objc_alloc(MEMORY[0x1E4F28C58]);
        v106 = v10;
        uint64_t v35 = *MEMORY[0x1E4F502C8];
        uint64_t v152 = *MEMORY[0x1E4F28568];
        id v123 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"isPlayingMedia"];
        id v153 = v123;
        uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v153 forKeys:&v152 count:1];
        uint64_t v37 = v35;
        id v10 = v106;
        id v38 = (id)[v128 initWithDomain:v37 code:2 userInfo:v36];
        v24 = 0;
        id v127 = 0;
        id *v125 = v38;
        uint64_t v12 = (void *)v36;
        int v27 = v126;
        goto LABEL_91;
      }
      id v127 = v11;
    }
    else
    {
      id v127 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"isAirplaneMode"];
    v122 = v11;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v125)
        {
          id v123 = 0;
          v24 = 0;
          int v27 = v126;
          goto LABEL_91;
        }
        id v124 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v39 = v9;
        id v40 = v10;
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v150 = *MEMORY[0x1E4F28568];
        id v120 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isAirplaneMode"];
        id v151 = v120;
        uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v151 forKeys:&v150 count:1];
        uint64_t v43 = v41;
        id v10 = v40;
        id v9 = v39;
        uint64_t v11 = v122;
        id v44 = (id)[v124 initWithDomain:v43 code:2 userInfo:v42];
        v24 = 0;
        id v123 = 0;
        id *v125 = v44;
        uint64_t v13 = (void *)v42;
        int v27 = v126;
LABEL_90:

LABEL_91:
        goto LABEL_92;
      }
      id v123 = v12;
    }
    else
    {
      id v123 = 0;
    }
    uint64_t v13 = [v6 objectForKeyedSubscript:@"isTimerRunning"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v125)
        {
          id v120 = 0;
          v24 = 0;
          int v27 = v126;
          goto LABEL_90;
        }
        id v121 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v45 = v9;
        v46 = v10;
        uint64_t v47 = *MEMORY[0x1E4F502C8];
        uint64_t v148 = *MEMORY[0x1E4F28568];
        id v118 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isTimerRunning"];
        id v149 = v118;
        uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v149 forKeys:&v148 count:1];
        uint64_t v49 = v47;
        id v10 = v46;
        id v9 = v45;
        uint64_t v11 = v122;
        v117 = (void *)v48;
        id v50 = (id)objc_msgSend(v121, "initWithDomain:code:userInfo:", v49, 2);
        v24 = 0;
        id v120 = 0;
        id *v125 = v50;
        int v27 = v126;
        goto LABEL_89;
      }
      uint64_t v14 = v7;
      uint64_t v15 = v8;
      id v120 = v13;
    }
    else
    {
      uint64_t v14 = v7;
      uint64_t v15 = v8;
      id v120 = 0;
    }
    uint64_t v16 = [v6 objectForKeyedSubscript:@"isConnectedToWifi"];
    v114 = v13;
    v117 = (void *)v16;
    if (v16 && (uint64_t v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v56 = v12;
        if (!v125)
        {
          id v118 = 0;
          v24 = 0;
          int v27 = v126;
          uint64_t v13 = v114;
          v8 = v15;
          id v7 = v14;
          uint64_t v11 = v122;
          goto LABEL_89;
        }
        id v119 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v57 = v9;
        v58 = v10;
        uint64_t v59 = *MEMORY[0x1E4F502C8];
        uint64_t v146 = *MEMORY[0x1E4F28568];
        id v115 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isConnectedToWifi"];
        id v147 = v115;
        uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v147 forKeys:&v146 count:1];
        uint64_t v61 = v59;
        id v10 = v58;
        id v9 = v57;
        v113 = (void *)v60;
        id v62 = (id)objc_msgSend(v119, "initWithDomain:code:userInfo:", v61, 2);
        v24 = 0;
        id v118 = 0;
        id *v125 = v62;
        goto LABEL_131;
      }
      id v118 = v17;
    }
    else
    {
      id v118 = 0;
    }
    uint64_t v18 = [v6 objectForKeyedSubscript:@"hasInternetConnection"];
    v113 = (void *)v18;
    if (!v18 || (int v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v115 = 0;
      goto LABEL_25;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v115 = v19;
LABEL_25:
      uint64_t v20 = [v6 objectForKeyedSubscript:@"isScreenSharing"];
      v110 = v15;
      v108 = (void *)v20;
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        objc_opt_class();
        id v7 = v14;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          uint64_t v11 = v122;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v125)
            {
              id v109 = 0;
              v24 = 0;
              int v27 = v126;
              v8 = v110;
              goto LABEL_87;
            }
            id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v76 = v9;
            v77 = v10;
            uint64_t v78 = *MEMORY[0x1E4F502C8];
            uint64_t v142 = *MEMORY[0x1E4F28568];
            id v107 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isScreenSharing"];
            id v143 = v107;
            uint64_t v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
            uint64_t v80 = v78;
            id v10 = v77;
            id v9 = v76;
            uint64_t v11 = v122;
            v104 = (void *)v79;
            v24 = 0;
            id v109 = 0;
            id *v125 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v80, 2);
            int v27 = v126;
            v8 = v110;
            goto LABEL_86;
          }
          id v109 = v21;
LABEL_50:
          uint64_t v30 = [v6 objectForKeyedSubscript:@"audioIsMuted"];
          v8 = v110;
          v104 = (void *)v30;
          v105 = v10;
          id v112 = v9;
          if (v30 && (int v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v125)
              {
                id v107 = 0;
                v24 = 0;
                int v27 = v126;
                goto LABEL_86;
              }
              id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v82 = *MEMORY[0x1E4F502C8];
              uint64_t v140 = *MEMORY[0x1E4F28568];
              id v102 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"audioIsMuted"];
              id v141 = v102;
              uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v141 forKeys:&v140 count:1];
              v84 = v81;
              int v32 = (void *)v83;
              uint64_t v85 = v82;
              id v10 = v105;
              v24 = 0;
              id v107 = 0;
              id *v125 = (id)[v84 initWithDomain:v85 code:2 userInfo:v83];
              int v27 = v126;
              goto LABEL_84;
            }
            id v107 = v31;
          }
          else
          {
            id v107 = 0;
          }
          int v32 = [v6 objectForKeyedSubscript:@"screenBrightness"];
          v101 = v12;
          if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v8 = v110;
              if (!v125)
              {
                id v102 = 0;
                v24 = 0;
                int v27 = v126;
                goto LABEL_85;
              }
              id v103 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v86 = *MEMORY[0x1E4F502C8];
              uint64_t v138 = *MEMORY[0x1E4F28568];
              id v54 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"screenBrightness"];
              id v139 = v54;
              uint64_t v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];
              uint64_t v88 = v86;
              id v34 = (BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)v87;
              id v89 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v88, 2);
              v24 = 0;
              id v102 = 0;
              id *v125 = v89;
              goto LABEL_81;
            }
            id v102 = v32;
          }
          else
          {
            id v102 = 0;
          }
          v33 = [v6 objectForKeyedSubscript:@"homeGraph"];
          if (v33)
          {
            objc_opt_class();
            v8 = v110;
            if (objc_opt_isKindOfClass())
            {
              id v34 = 0;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v125)
                {
                  v24 = 0;
                  int v27 = v126;
                  goto LABEL_83;
                }
                id v96 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v90 = *MEMORY[0x1E4F502C8];
                uint64_t v136 = *MEMORY[0x1E4F28568];
                id v34 = (BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"homeGraph"];
                v137 = v34;
                v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];
                id *v125 = (id)[v96 initWithDomain:v90 code:2 userInfo:v91];

                v24 = 0;
                id v54 = v33;
                int v27 = v126;
LABEL_82:

                v33 = v54;
LABEL_83:

                id v10 = v105;
                uint64_t v12 = v101;
LABEL_84:
                uint64_t v13 = v114;
LABEL_85:

                id v9 = v112;
LABEL_86:

LABEL_87:
LABEL_88:

LABEL_89:
                goto LABEL_90;
              }
              id v54 = v33;
              id v131 = 0;
              id v34 = [[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus alloc] initWithJSONDictionary:v54 error:&v131];
              id v67 = v131;
              if (v67)
              {
                v68 = v67;
                int v27 = v126;
                if (v125) {
                  id *v125 = v67;
                }

                v24 = 0;
                goto LABEL_82;
              }
            }
          }
          else
          {
            id v34 = 0;
            v8 = v110;
          }
          v51 = [v6 objectForKeyedSubscript:@"batteryIsCharging"];
          if (v51 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v125)
              {
                v24 = 0;
                id v99 = 0;
                goto LABEL_80;
              }
              id v100 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v97 = *MEMORY[0x1E4F502C8];
              uint64_t v134 = *MEMORY[0x1E4F28568];
              id v53 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"batteryIsCharging"];
              id v135 = v53;
              v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
              id v92 = (id)[v100 initWithDomain:v97 code:2 userInfo:v52];
              v24 = 0;
              id v99 = 0;
              id *v125 = v92;
              goto LABEL_79;
            }
            id v99 = v51;
          }
          else
          {
            id v99 = 0;
          }
          v52 = [v6 objectForKeyedSubscript:@"isLowBatteryMode"];
          if (v52 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v125)
              {
                id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v95 = *MEMORY[0x1E4F502C8];
                uint64_t v132 = *MEMORY[0x1E4F28568];
                v93 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isLowBatteryMode"];
                v133 = v93;
                v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v133 forKeys:&v132 count:1];
                id *v125 = (id)[v98 initWithDomain:v95 code:2 userInfo:v94];
              }
              id v53 = 0;
              v24 = 0;
              goto LABEL_79;
            }
            id v53 = v52;
          }
          else
          {
            id v53 = 0;
          }
          v24 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures initWithFocusMode:deviceMotion:location:isPlayingMedia:isAirplaneMode:isTimerRunning:isConnectedToWifi:hasInternetConnection:isScreenSharing:audioIsMuted:screenBrightness:homeGraph:batteryIsCharging:isLowBatteryMode:](v129, "initWithFocusMode:deviceMotion:location:isPlayingMedia:isAirplaneMode:isTimerRunning:isConnectedToWifi:hasInternetConnection:isScreenSharing:audioIsMuted:screenBrightness:homeGraph:batteryIsCharging:isLowBatteryMode:", v130, v112, [v126 intValue], v127, v123, v120, v118, v115, v109, v107, v102, v34, v99, v53);
          v129 = v24;
LABEL_79:

          uint64_t v11 = v122;
LABEL_80:

          id v54 = v33;
LABEL_81:
          int v27 = v126;
          goto LABEL_82;
        }
        id v109 = 0;
      }
      else
      {
        id v109 = 0;
        id v7 = v14;
      }
      uint64_t v11 = v122;
      goto LABEL_50;
    }
    v56 = v12;
    if (v125)
    {
      id v116 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v69 = v9;
      v70 = v10;
      uint64_t v71 = *MEMORY[0x1E4F502C8];
      uint64_t v144 = *MEMORY[0x1E4F28568];
      id v109 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"hasInternetConnection"];
      id v145 = v109;
      uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v145 forKeys:&v144 count:1];
      uint64_t v73 = v71;
      id v10 = v70;
      id v9 = v69;
      v108 = (void *)v72;
      id v74 = (id)objc_msgSend(v116, "initWithDomain:code:userInfo:", v73, 2);
      v24 = 0;
      id v115 = 0;
      id *v125 = v74;
      int v27 = v126;
      uint64_t v13 = v114;
      v8 = v15;
      id v7 = v14;
      uint64_t v11 = v122;
      goto LABEL_87;
    }
    id v115 = 0;
    v24 = 0;
LABEL_131:
    int v27 = v126;
    uint64_t v12 = v56;
    uint64_t v13 = v114;
    v8 = v15;
    id v7 = v14;
    uint64_t v11 = v122;
    goto LABEL_88;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v130 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v130 = 0;
    v24 = 0;
    goto LABEL_95;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v23 = *MEMORY[0x1E4F502C8];
  uint64_t v158 = *MEMORY[0x1E4F28568];
  id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"focusMode"];
  v159[0] = v9;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v159 forKeys:&v158 count:1];
  id v130 = 0;
  v24 = 0;
  *a4 = (id)[v22 initWithDomain:v23 code:2 userInfo:v8];
LABEL_94:

LABEL_95:
  return v24;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_focusMode) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceMotion) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_isPlayingMedia) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsAirplaneMode) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsTimerRunning) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsConnectedToWifi) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasHasInternetConnection) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsScreenSharing) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasAudioIsMuted) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasScreenBrightness) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_homeGraph)
  {
    PBDataWriterPlaceMark();
    [(BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *)self->_homeGraph writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasBatteryIsCharging) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsLowBatteryMode) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v99.receiver = self;
  v99.super_class = (Class)BMSiriAssistantSuggestionFeaturesEnvironmentFeatures;
  uint64_t v5 = [(BMEventBase *)&v99 init];
  if (!v5) {
    goto LABEL_145;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
          goto LABEL_32;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
          goto LABEL_32;
        case 3u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (2)
          {
            uint64_t v25 = *v6;
            uint64_t v26 = *(void *)&v4[v25];
            unint64_t v27 = v26 + 1;
            if (v26 == -1 || v27 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
              *(void *)&v4[v25] = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                BOOL v17 = v23++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_102;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_102:
          if (v24 >= 4) {
            LODWORD(v24) = 0;
          }
          v5->_location = v24;
          continue;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
LABEL_32:
          uint64_t v29 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 5u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          v5->_hasIsAirplaneMode = 1;
          while (2)
          {
            uint64_t v33 = *v6;
            uint64_t v34 = *(void *)&v4[v33];
            unint64_t v35 = v34 + 1;
            if (v34 == -1 || v35 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v34);
              *(void *)&v4[v33] = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                BOOL v17 = v31++ >= 9;
                if (v17)
                {
                  uint64_t v32 = 0;
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v32 = 0;
          }
LABEL_108:
          BOOL v95 = v32 != 0;
          uint64_t v96 = 16;
          goto LABEL_141;
        case 6u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v39 = 0;
          v5->_hasIsTimerRunning = 1;
          while (2)
          {
            uint64_t v40 = *v6;
            uint64_t v41 = *(void *)&v4[v40];
            unint64_t v42 = v41 + 1;
            if (v41 == -1 || v42 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)&v4[*v9] + v41);
              *(void *)&v4[v40] = v42;
              v39 |= (unint64_t)(v43 & 0x7F) << v37;
              if (v43 < 0)
              {
                v37 += 7;
                BOOL v17 = v38++ >= 9;
                if (v17)
                {
                  uint64_t v39 = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v39 = 0;
          }
LABEL_112:
          BOOL v95 = v39 != 0;
          uint64_t v96 = 18;
          goto LABEL_141;
        case 7u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          v5->_hasIsConnectedToWifi = 1;
          while (2)
          {
            uint64_t v47 = *v6;
            uint64_t v48 = *(void *)&v4[v47];
            unint64_t v49 = v48 + 1;
            if (v48 == -1 || v49 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v50 = *(unsigned char *)(*(void *)&v4[*v9] + v48);
              *(void *)&v4[v47] = v49;
              v46 |= (unint64_t)(v50 & 0x7F) << v44;
              if (v50 < 0)
              {
                v44 += 7;
                BOOL v17 = v45++ >= 9;
                if (v17)
                {
                  uint64_t v46 = 0;
                  goto LABEL_116;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v46 = 0;
          }
LABEL_116:
          BOOL v95 = v46 != 0;
          uint64_t v96 = 20;
          goto LABEL_141;
        case 8u:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v53 = 0;
          v5->_hasHasInternetConnection = 1;
          while (2)
          {
            uint64_t v54 = *v6;
            uint64_t v55 = *(void *)&v4[v54];
            unint64_t v56 = v55 + 1;
            if (v55 == -1 || v56 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v57 = *(unsigned char *)(*(void *)&v4[*v9] + v55);
              *(void *)&v4[v54] = v56;
              v53 |= (unint64_t)(v57 & 0x7F) << v51;
              if (v57 < 0)
              {
                v51 += 7;
                BOOL v17 = v52++ >= 9;
                if (v17)
                {
                  uint64_t v53 = 0;
                  goto LABEL_120;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v53 = 0;
          }
LABEL_120:
          BOOL v95 = v53 != 0;
          uint64_t v96 = 22;
          goto LABEL_141;
        case 9u:
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v60 = 0;
          v5->_hasIsScreenSharing = 1;
          while (2)
          {
            uint64_t v61 = *v6;
            uint64_t v62 = *(void *)&v4[v61];
            unint64_t v63 = v62 + 1;
            if (v62 == -1 || v63 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v64 = *(unsigned char *)(*(void *)&v4[*v9] + v62);
              *(void *)&v4[v61] = v63;
              v60 |= (unint64_t)(v64 & 0x7F) << v58;
              if (v64 < 0)
              {
                v58 += 7;
                BOOL v17 = v59++ >= 9;
                if (v17)
                {
                  uint64_t v60 = 0;
                  goto LABEL_124;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v60 = 0;
          }
LABEL_124:
          BOOL v95 = v60 != 0;
          uint64_t v96 = 24;
          goto LABEL_141;
        case 0xAu:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v67 = 0;
          v5->_hasAudioIsMuted = 1;
          while (2)
          {
            uint64_t v68 = *v6;
            uint64_t v69 = *(void *)&v4[v68];
            unint64_t v70 = v69 + 1;
            if (v69 == -1 || v70 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v71 = *(unsigned char *)(*(void *)&v4[*v9] + v69);
              *(void *)&v4[v68] = v70;
              v67 |= (unint64_t)(v71 & 0x7F) << v65;
              if (v71 < 0)
              {
                v65 += 7;
                BOOL v17 = v66++ >= 9;
                if (v17)
                {
                  uint64_t v67 = 0;
                  goto LABEL_128;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v67 = 0;
          }
LABEL_128:
          BOOL v95 = v67 != 0;
          uint64_t v96 = 26;
          goto LABEL_141;
        case 0xBu:
          char v72 = 0;
          unsigned int v73 = 0;
          uint64_t v74 = 0;
          v5->_hasScreenBrightness = 1;
          while (2)
          {
            uint64_t v75 = *v6;
            uint64_t v76 = *(void *)&v4[v75];
            unint64_t v77 = v76 + 1;
            if (v76 == -1 || v77 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v78 = *(unsigned char *)(*(void *)&v4[*v9] + v76);
              *(void *)&v4[v75] = v77;
              v74 |= (unint64_t)(v78 & 0x7F) << v72;
              if (v78 < 0)
              {
                v72 += 7;
                BOOL v17 = v73++ >= 9;
                if (v17)
                {
                  LODWORD(v74) = 0;
                  goto LABEL_132;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v74) = 0;
          }
LABEL_132:
          v5->_screenBrightness = v74;
          continue;
        case 0xCu:
          uint64_t v100 = 0;
          uint64_t v101 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_144;
          }
          uint64_t v79 = [[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus alloc] initByReadFrom:v4];
          if (!v79) {
            goto LABEL_144;
          }
          homeGraph = v5->_homeGraph;
          v5->_homeGraph = v79;

          PBReaderRecallMark();
          continue;
        case 0xDu:
          char v81 = 0;
          unsigned int v82 = 0;
          uint64_t v83 = 0;
          v5->_hasBatteryIsCharging = 1;
          while (2)
          {
            uint64_t v84 = *v6;
            uint64_t v85 = *(void *)&v4[v84];
            unint64_t v86 = v85 + 1;
            if (v85 == -1 || v86 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v87 = *(unsigned char *)(*(void *)&v4[*v9] + v85);
              *(void *)&v4[v84] = v86;
              v83 |= (unint64_t)(v87 & 0x7F) << v81;
              if (v87 < 0)
              {
                v81 += 7;
                BOOL v17 = v82++ >= 9;
                if (v17)
                {
                  uint64_t v83 = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v83 = 0;
          }
LABEL_136:
          BOOL v95 = v83 != 0;
          uint64_t v96 = 29;
          goto LABEL_141;
        case 0xEu:
          char v88 = 0;
          unsigned int v89 = 0;
          uint64_t v90 = 0;
          v5->_hasIsLowBatteryMode = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_144;
          }
          continue;
      }
      while (1)
      {
        uint64_t v91 = *v6;
        uint64_t v92 = *(void *)&v4[v91];
        unint64_t v93 = v92 + 1;
        if (v92 == -1 || v93 > *(void *)&v4[*v7]) {
          break;
        }
        char v94 = *(unsigned char *)(*(void *)&v4[*v9] + v92);
        *(void *)&v4[v91] = v93;
        v90 |= (unint64_t)(v94 & 0x7F) << v88;
        if ((v94 & 0x80) == 0) {
          goto LABEL_138;
        }
        v88 += 7;
        BOOL v17 = v89++ >= 9;
        if (v17)
        {
          uint64_t v90 = 0;
          goto LABEL_140;
        }
      }
      v4[*v8] = 1;
LABEL_138:
      if (v4[*v8]) {
        uint64_t v90 = 0;
      }
LABEL_140:
      BOOL v95 = v90 != 0;
      uint64_t v96 = 31;
LABEL_141:
      *((unsigned char *)&v5->super.super.isa + v96) = v95;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_144:
  }
    uint64_t v97 = 0;
  else {
LABEL_145:
  }
    uint64_t v97 = v5;

  return v97;
}

- (NSString)description
{
  id v16 = [NSString alloc];
  unint64_t v15 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self focusMode];
  uint64_t v14 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self deviceMotion];
  int v19 = BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHashedLocationAsString([(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self location]);
  int v18 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self isPlayingMedia];
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isAirplaneMode](self, "isAirplaneMode"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isTimerRunning](self, "isTimerRunning"));
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isConnectedToWifi](self, "isConnectedToWifi"));
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures hasInternetConnection](self, "hasInternetConnection"));
  char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isScreenSharing](self, "isScreenSharing"));
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures audioIsMuted](self, "audioIsMuted"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures screenBrightness](self, "screenBrightness"));
  id v6 = [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self homeGraph];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures batteryIsCharging](self, "batteryIsCharging"));
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures isLowBatteryMode](self, "isLowBatteryMode"));
  BOOL v17 = (void *)[v16 initWithFormat:@"BMSiriAssistantSuggestionFeaturesEnvironmentFeatures with focusMode: %@, deviceMotion: %@, location: %@, isPlayingMedia: %@, isAirplaneMode: %@, isTimerRunning: %@, isConnectedToWifi: %@, hasInternetConnection: %@, isScreenSharing: %@, audioIsMuted: %@, screenBrightness: %@, homeGraph: %@, batteryIsCharging: %@, isLowBatteryMode: %@", v15, v14, v19, v18, v11, v13, v12, v3, v10, v4, v5, v6, v7, v8];

  return (NSString *)v17;
}

- (BMSiriAssistantSuggestionFeaturesEnvironmentFeatures)initWithFocusMode:(id)a3 deviceMotion:(id)a4 location:(int)a5 isPlayingMedia:(id)a6 isAirplaneMode:(id)a7 isTimerRunning:(id)a8 isConnectedToWifi:(id)a9 hasInternetConnection:(id)a10 isScreenSharing:(id)a11 audioIsMuted:(id)a12 screenBrightness:(id)a13 homeGraph:(id)a14 batteryIsCharging:(id)a15 isLowBatteryMode:(id)a16
{
  id v42 = a3;
  id v35 = a4;
  id v41 = a4;
  id v37 = a6;
  id v40 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  uint64_t v24 = v21;
  id v25 = a11;
  uint64_t v26 = v20;
  id v27 = a12;
  id v28 = a13;
  id v39 = a14;
  id v29 = a15;
  id v30 = a16;
  v43.receiver = self;
  v43.super_class = (Class)BMSiriAssistantSuggestionFeaturesEnvironmentFeatures;
  unsigned int v31 = [(BMEventBase *)&v43 init];
  if (v31)
  {
    v31->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v31->_focusMode, a3);
    objc_storeStrong((id *)&v31->_deviceMotion, v35);
    v31->_location = a5;
    objc_storeStrong((id *)&v31->_isPlayingMedia, v37);
    if (v26)
    {
      v31->_hasIsAirplaneMode = 1;
      v31->_isAirplaneMode = [v26 BOOLValue];
    }
    else
    {
      v31->_hasIsAirplaneMode = 0;
      v31->_isAirplaneMode = 0;
    }
    if (v24)
    {
      v31->_hasIsTimerRunning = 1;
      v31->_isTimerRunning = [v24 BOOLValue];
    }
    else
    {
      v31->_hasIsTimerRunning = 0;
      v31->_isTimerRunning = 0;
    }
    if (v22)
    {
      v31->_hasIsConnectedToWifi = 1;
      v31->_isConnectedToWifi = [v22 BOOLValue];
    }
    else
    {
      v31->_hasIsConnectedToWifi = 0;
      v31->_isConnectedToWifi = 0;
    }
    if (v23)
    {
      v31->_hasHasInternetConnection = 1;
      v31->_hasInternetConnection = [v23 BOOLValue];
    }
    else
    {
      v31->_hasHasInternetConnection = 0;
      v31->_hasInternetConnection = 0;
    }
    if (v25)
    {
      v31->_hasIsScreenSharing = 1;
      v31->_isScreenSharing = [v25 BOOLValue];
    }
    else
    {
      v31->_hasIsScreenSharing = 0;
      v31->_isScreenSharing = 0;
    }
    if (v27)
    {
      v31->_hasAudioIsMuted = 1;
      v31->_audioIsMuted = [v27 BOOLValue];
    }
    else
    {
      v31->_hasAudioIsMuted = 0;
      v31->_audioIsMuted = 0;
    }
    if (v28)
    {
      v31->_hasScreenBrightness = 1;
      int v32 = [v28 intValue];
    }
    else
    {
      v31->_hasScreenBrightness = 0;
      int v32 = -1;
    }
    v31->_screenBrightness = v32;
    objc_storeStrong((id *)&v31->_homeGraph, a14);
    if (v29)
    {
      v31->_hasBatteryIsCharging = 1;
      v31->_batteryIsCharging = [v29 BOOLValue];
    }
    else
    {
      v31->_hasBatteryIsCharging = 0;
      v31->_batteryIsCharging = 0;
    }
    if (v30)
    {
      v31->_hasIsLowBatteryMode = 1;
      v31->_isLowBatteryMode = [v30 BOOLValue];
    }
    else
    {
      v31->_hasIsLowBatteryMode = 0;
      v31->_isLowBatteryMode = 0;
    }
  }

  return v31;
}

+ (id)protoFields
{
  v18[14] = *MEMORY[0x1E4F143B8];
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"focusMode" number:1 type:13 subMessageClass:0];
  v18[0] = v17;
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceMotion" number:2 type:13 subMessageClass:0];
  v18[1] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"location" number:3 type:4 subMessageClass:0];
  v18[2] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isPlayingMedia" number:4 type:13 subMessageClass:0];
  v18[3] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isAirplaneMode" number:5 type:12 subMessageClass:0];
  v18[4] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isTimerRunning" number:6 type:12 subMessageClass:0];
  v18[5] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isConnectedToWifi" number:7 type:12 subMessageClass:0];
  v18[6] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasInternetConnection" number:8 type:12 subMessageClass:0];
  v18[7] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isScreenSharing" number:9 type:12 subMessageClass:0];
  v18[8] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"audioIsMuted" number:10 type:12 subMessageClass:0];
  v18[9] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"screenBrightness" number:11 type:2 subMessageClass:0];
  v18[10] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"homeGraph" number:12 type:14 subMessageClass:objc_opt_class()];
  v18[11] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"batteryIsCharging" number:13 type:12 subMessageClass:0];
  v18[12] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isLowBatteryMode" number:14 type:12 subMessageClass:0];
  v18[13] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3C30;
}

+ (id)columns
{
  v18[14] = *MEMORY[0x1E4F143B8];
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"focusMode" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceMotion" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"location" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isPlayingMedia" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isAirplaneMode" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isTimerRunning" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isConnectedToWifi" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasInternetConnection" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isScreenSharing" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"audioIsMuted" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"screenBrightness" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:2 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"homeGraph_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_895];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"batteryIsCharging" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isLowBatteryMode" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:12 convertedType:0];
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v15;
  v18[3] = v14;
  v18[4] = v2;
  v18[5] = v3;
  v18[6] = v4;
  v18[7] = v5;
  v18[8] = v6;
  v18[9] = v13;
  v18[10] = v7;
  v18[11] = v12;
  v18[12] = v8;
  v18[13] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

id __63__BMSiriAssistantSuggestionFeaturesEnvironmentFeatures_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 homeGraph];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[9] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end