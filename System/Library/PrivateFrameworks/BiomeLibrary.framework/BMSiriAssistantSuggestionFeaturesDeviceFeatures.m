@interface BMSiriAssistantSuggestionFeaturesDeviceFeatures
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriAssistantSuggestionFeaturesDeviceFeatures)initWithConnectedToAirpods:(id)a3 noiseCancellingMode:(id)a4 connectedToDevice:(id)a5 isInCarPlay:(id)a6 hasWatch:(id)a7 hasIPad:(id)a8 hasHomePod:(id)a9 hasAppleTV:(id)a10 hasIPhone:(id)a11 totalNumDevices:(id)a12 currentDeviceType:(id)a13 currentBuildVersion:(id)a14 distanceFromLatestBuild:(id)a15 isALargeFormatPhone:(id)a16 hasAPasscode:(id)a17 supportsSMSMEssaging:(id)a18;
- (BMSiriAssistantSuggestionFeaturesDeviceFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)connectedToAirpods;
- (BOOL)hasAPasscode;
- (BOOL)hasAppleTV;
- (BOOL)hasConnectedToAirpods;
- (BOOL)hasHasAPasscode;
- (BOOL)hasHasAppleTV;
- (BOOL)hasHasHomePod;
- (BOOL)hasHasIPad;
- (BOOL)hasHasIPhone;
- (BOOL)hasHasWatch;
- (BOOL)hasHomePod;
- (BOOL)hasIPad;
- (BOOL)hasIPhone;
- (BOOL)hasIsALargeFormatPhone;
- (BOOL)hasIsInCarPlay;
- (BOOL)hasSupportsSMSMEssaging;
- (BOOL)hasTotalNumDevices;
- (BOOL)hasWatch;
- (BOOL)isALargeFormatPhone;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInCarPlay;
- (BOOL)supportsSMSMEssaging;
- (NSString)connectedToDevice;
- (NSString)currentBuildVersion;
- (NSString)currentDeviceType;
- (NSString)description;
- (NSString)distanceFromLatestBuild;
- (NSString)noiseCancellingMode;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)totalNumDevices;
- (unsigned)dataVersion;
- (void)setHasConnectedToAirpods:(BOOL)a3;
- (void)setHasHasAPasscode:(BOOL)a3;
- (void)setHasHasAppleTV:(BOOL)a3;
- (void)setHasHasHomePod:(BOOL)a3;
- (void)setHasHasIPad:(BOOL)a3;
- (void)setHasHasIPhone:(BOOL)a3;
- (void)setHasHasWatch:(BOOL)a3;
- (void)setHasIsALargeFormatPhone:(BOOL)a3;
- (void)setHasIsInCarPlay:(BOOL)a3;
- (void)setHasSupportsSMSMEssaging:(BOOL)a3;
- (void)setHasTotalNumDevices:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriAssistantSuggestionFeaturesDeviceFeatures

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceFromLatestBuild, 0);
  objc_storeStrong((id *)&self->_currentBuildVersion, 0);
  objc_storeStrong((id *)&self->_currentDeviceType, 0);
  objc_storeStrong((id *)&self->_connectedToDevice, 0);

  objc_storeStrong((id *)&self->_noiseCancellingMode, 0);
}

- (void)setHasSupportsSMSMEssaging:(BOOL)a3
{
  self->_hasSupportsSMSMEssaging = a3;
}

- (BOOL)hasSupportsSMSMEssaging
{
  return self->_hasSupportsSMSMEssaging;
}

- (BOOL)supportsSMSMEssaging
{
  return self->_supportsSMSMEssaging;
}

- (void)setHasHasAPasscode:(BOOL)a3
{
  self->_hasHasAPasscode = a3;
}

- (BOOL)hasHasAPasscode
{
  return self->_hasHasAPasscode;
}

- (BOOL)hasAPasscode
{
  return self->_hasAPasscode;
}

- (void)setHasIsALargeFormatPhone:(BOOL)a3
{
  self->_hasIsALargeFormatPhone = a3;
}

- (BOOL)hasIsALargeFormatPhone
{
  return self->_hasIsALargeFormatPhone;
}

- (BOOL)isALargeFormatPhone
{
  return self->_isALargeFormatPhone;
}

- (NSString)distanceFromLatestBuild
{
  return self->_distanceFromLatestBuild;
}

- (NSString)currentBuildVersion
{
  return self->_currentBuildVersion;
}

- (NSString)currentDeviceType
{
  return self->_currentDeviceType;
}

- (void)setHasTotalNumDevices:(BOOL)a3
{
  self->_hasTotalNumDevices = a3;
}

- (BOOL)hasTotalNumDevices
{
  return self->_hasTotalNumDevices;
}

- (int)totalNumDevices
{
  return self->_totalNumDevices;
}

- (void)setHasHasIPhone:(BOOL)a3
{
  self->_hasHasIPhone = a3;
}

- (BOOL)hasHasIPhone
{
  return self->_hasHasIPhone;
}

- (BOOL)hasIPhone
{
  return self->_hasIPhone;
}

- (void)setHasHasAppleTV:(BOOL)a3
{
  self->_hasHasAppleTV = a3;
}

- (BOOL)hasHasAppleTV
{
  return self->_hasHasAppleTV;
}

- (BOOL)hasAppleTV
{
  return self->_hasAppleTV;
}

- (void)setHasHasHomePod:(BOOL)a3
{
  self->_hasHasHomePod = a3;
}

- (BOOL)hasHasHomePod
{
  return self->_hasHasHomePod;
}

- (BOOL)hasHomePod
{
  return self->_hasHomePod;
}

- (void)setHasHasIPad:(BOOL)a3
{
  self->_hasHasIPad = a3;
}

- (BOOL)hasHasIPad
{
  return self->_hasHasIPad;
}

- (BOOL)hasIPad
{
  return self->_hasIPad;
}

- (void)setHasHasWatch:(BOOL)a3
{
  self->_hasHasWatch = a3;
}

- (BOOL)hasHasWatch
{
  return self->_hasHasWatch;
}

- (BOOL)hasWatch
{
  return self->_hasWatch;
}

- (void)setHasIsInCarPlay:(BOOL)a3
{
  self->_hasIsInCarPlay = a3;
}

- (BOOL)hasIsInCarPlay
{
  return self->_hasIsInCarPlay;
}

- (BOOL)isInCarPlay
{
  return self->_isInCarPlay;
}

- (NSString)connectedToDevice
{
  return self->_connectedToDevice;
}

- (NSString)noiseCancellingMode
{
  return self->_noiseCancellingMode;
}

- (void)setHasConnectedToAirpods:(BOOL)a3
{
  self->_hasConnectedToAirpods = a3;
}

- (BOOL)hasConnectedToAirpods
{
  return self->_hasConnectedToAirpods;
}

- (BOOL)connectedToAirpods
{
  return self->_connectedToAirpods;
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
    if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasConnectedToAirpods]
      || [v5 hasConnectedToAirpods])
    {
      if (![(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasConnectedToAirpods]) {
        goto LABEL_78;
      }
      if (![v5 hasConnectedToAirpods]) {
        goto LABEL_78;
      }
      int v6 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self connectedToAirpods];
      if (v6 != [v5 connectedToAirpods]) {
        goto LABEL_78;
      }
    }
    v7 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self noiseCancellingMode];
    uint64_t v8 = [v5 noiseCancellingMode];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self noiseCancellingMode];
      v11 = [v5 noiseCancellingMode];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_78;
      }
    }
    v14 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self connectedToDevice];
    uint64_t v15 = [v5 connectedToDevice];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self connectedToDevice];
      v18 = [v5 connectedToDevice];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_78;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasIsInCarPlay]
      || [v5 hasIsInCarPlay])
    {
      if (![(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasIsInCarPlay]) {
        goto LABEL_78;
      }
      if (![v5 hasIsInCarPlay]) {
        goto LABEL_78;
      }
      int v20 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self isInCarPlay];
      if (v20 != [v5 isInCarPlay]) {
        goto LABEL_78;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasWatch]
      || [v5 hasHasWatch])
    {
      if (![(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasWatch]) {
        goto LABEL_78;
      }
      if (![v5 hasHasWatch]) {
        goto LABEL_78;
      }
      int v21 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasWatch];
      if (v21 != [v5 hasWatch]) {
        goto LABEL_78;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasIPad]
      || [v5 hasHasIPad])
    {
      if (![(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasIPad]) {
        goto LABEL_78;
      }
      if (![v5 hasHasIPad]) {
        goto LABEL_78;
      }
      int v22 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasIPad];
      if (v22 != [v5 hasIPad]) {
        goto LABEL_78;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasHomePod]
      || [v5 hasHasHomePod])
    {
      if (![(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasHomePod]) {
        goto LABEL_78;
      }
      if (![v5 hasHasHomePod]) {
        goto LABEL_78;
      }
      int v23 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHomePod];
      if (v23 != [v5 hasHomePod]) {
        goto LABEL_78;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasAppleTV]
      || [v5 hasHasAppleTV])
    {
      if (![(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasAppleTV]) {
        goto LABEL_78;
      }
      if (![v5 hasHasAppleTV]) {
        goto LABEL_78;
      }
      int v24 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasAppleTV];
      if (v24 != [v5 hasAppleTV]) {
        goto LABEL_78;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasIPhone]
      || [v5 hasHasIPhone])
    {
      if (![(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasIPhone]) {
        goto LABEL_78;
      }
      if (![v5 hasHasIPhone]) {
        goto LABEL_78;
      }
      int v25 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasIPhone];
      if (v25 != [v5 hasIPhone]) {
        goto LABEL_78;
      }
    }
    if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasTotalNumDevices]
      || [v5 hasTotalNumDevices])
    {
      if (![(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasTotalNumDevices]) {
        goto LABEL_78;
      }
      if (![v5 hasTotalNumDevices]) {
        goto LABEL_78;
      }
      int v26 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self totalNumDevices];
      if (v26 != [v5 totalNumDevices]) {
        goto LABEL_78;
      }
    }
    v27 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self currentDeviceType];
    uint64_t v28 = [v5 currentDeviceType];
    if (v27 == (void *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      v30 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self currentDeviceType];
      v31 = [v5 currentDeviceType];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_78;
      }
    }
    v33 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self currentBuildVersion];
    uint64_t v34 = [v5 currentBuildVersion];
    if (v33 == (void *)v34)
    {
    }
    else
    {
      v35 = (void *)v34;
      v36 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self currentBuildVersion];
      v37 = [v5 currentBuildVersion];
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_78;
      }
    }
    v39 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self distanceFromLatestBuild];
    uint64_t v40 = [v5 distanceFromLatestBuild];
    if (v39 == (void *)v40)
    {
    }
    else
    {
      v41 = (void *)v40;
      v42 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self distanceFromLatestBuild];
      v43 = [v5 distanceFromLatestBuild];
      int v44 = [v42 isEqual:v43];

      if (!v44) {
        goto LABEL_78;
      }
    }
    if (![(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasIsALargeFormatPhone]
      && ![v5 hasIsALargeFormatPhone]
      || [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasIsALargeFormatPhone]
      && [v5 hasIsALargeFormatPhone]
      && (int v45 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self isALargeFormatPhone],
          v45 == [v5 isALargeFormatPhone]))
    {
      if (![(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasAPasscode]
        && ![v5 hasHasAPasscode]
        || [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasAPasscode]
        && [v5 hasHasAPasscode]
        && (int v46 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasAPasscode],
            v46 == [v5 hasAPasscode]))
      {
        if (!-[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasSupportsSMSMEssaging](self, "hasSupportsSMSMEssaging")&& ![v5 hasSupportsSMSMEssaging])
        {
          LOBYTE(v13) = 1;
          goto LABEL_79;
        }
        if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasSupportsSMSMEssaging]
          && [v5 hasSupportsSMSMEssaging])
        {
          BOOL v47 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self supportsSMSMEssaging];
          int v13 = v47 ^ [v5 supportsSMSMEssaging] ^ 1;
LABEL_79:

          goto LABEL_80;
        }
      }
    }
LABEL_78:
    LOBYTE(v13) = 0;
    goto LABEL_79;
  }
  LOBYTE(v13) = 0;
LABEL_80:

  return v13;
}

- (id)jsonDictionary
{
  v56[16] = *MEMORY[0x1E4F143B8];
  if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasConnectedToAirpods])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures connectedToAirpods](self, "connectedToAirpods"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v4 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self noiseCancellingMode];
  uint64_t v5 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self connectedToDevice];
  if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasIsInCarPlay])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures isInCarPlay](self, "isInCarPlay"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasWatch])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasWatch](self, "hasWatch"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasIPad])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIPad](self, "hasIPad"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasHomePod])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHomePod](self, "hasHomePod"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasAppleTV])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasAppleTV](self, "hasAppleTV"));
    id v54 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v54 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasIPhone])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIPhone](self, "hasIPhone"));
    id v53 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v53 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasTotalNumDevices])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures totalNumDevices](self, "totalNumDevices"));
    id v52 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v52 = 0;
  }
  v51 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self currentDeviceType];
  v50 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self currentBuildVersion];
  v49 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self distanceFromLatestBuild];
  if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasIsALargeFormatPhone])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures isALargeFormatPhone](self, "isALargeFormatPhone"));
    id v48 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v48 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasHasAPasscode])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasAPasscode](self, "hasAPasscode"));
    id v47 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v47 = 0;
  }
  if ([(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self hasSupportsSMSMEssaging])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures supportsSMSMEssaging](self, "supportsSMSMEssaging"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  v55[0] = @"connectedToAirpods";
  uint64_t v11 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v41 = (void *)v11;
  v56[0] = v11;
  v55[1] = @"noiseCancellingMode";
  uint64_t v12 = v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v40 = (void *)v12;
  v56[1] = v12;
  v55[2] = @"connectedToDevice";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v13;
  v56[2] = v13;
  v55[3] = @"isInCarPlay";
  uint64_t v14 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  int v38 = (void *)v14;
  v56[3] = v14;
  v55[4] = @"hasWatch";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v15;
  v56[4] = v15;
  v55[5] = @"hasIPad";
  uint64_t v16 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v16;
  v56[5] = v16;
  v55[6] = @"hasHomePod";
  uint64_t v17 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v17;
  v56[6] = v17;
  v55[7] = @"hasAppleTV";
  uint64_t v18 = (uint64_t)v54;
  if (!v54)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v43 = v9;
  v56[7] = v18;
  v55[8] = @"hasIPhone";
  uint64_t v19 = (uint64_t)v53;
  if (!v53)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  int v45 = v6;
  v56[8] = v19;
  v55[9] = @"totalNumDevices";
  uint64_t v20 = (uint64_t)v52;
  if (!v52)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  int v46 = v3;
  uint64_t v31 = v20;
  v56[9] = v20;
  v55[10] = @"currentDeviceType";
  int v21 = v51;
  if (!v51)
  {
    int v21 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v20);
  }
  v33 = (void *)v19;
  uint64_t v34 = (void *)v18;
  int v44 = v7;
  v56[10] = v21;
  v55[11] = @"currentBuildVersion";
  int v22 = v50;
  if (!v50)
  {
    int v22 = [MEMORY[0x1E4F1CA98] null];
  }
  int v23 = v8;
  int v24 = (void *)v4;
  v56[11] = v22;
  v55[12] = @"distanceFromLatestBuild";
  int v25 = v49;
  if (!v49)
  {
    int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  int v26 = (void *)v5;
  v56[12] = v25;
  v55[13] = @"isALargeFormatPhone";
  v27 = v48;
  if (!v48)
  {
    v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v56[13] = v27;
  v55[14] = @"hasAPasscode";
  uint64_t v28 = v47;
  if (!v47)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v56[14] = v28;
  v55[15] = @"supportsSMSMEssaging";
  v29 = v10;
  if (!v10)
  {
    v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v56[15] = v29;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v56, v55, 16, v31);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10) {

  }
  if (!v47) {
  if (!v48)
  }

  if (!v49) {
  if (!v50)
  }

  if (!v51) {
  if (!v52)
  }

  if (!v53) {
  if (v54)
  }
  {
    if (v43) {
      goto LABEL_84;
    }
  }
  else
  {

    if (v43)
    {
LABEL_84:
      if (v23) {
        goto LABEL_85;
      }
      goto LABEL_95;
    }
  }

  if (v23)
  {
LABEL_85:
    if (v44) {
      goto LABEL_86;
    }
    goto LABEL_96;
  }
LABEL_95:

  if (v44)
  {
LABEL_86:
    if (v45) {
      goto LABEL_87;
    }
    goto LABEL_97;
  }
LABEL_96:

  if (v45)
  {
LABEL_87:
    if (v26) {
      goto LABEL_88;
    }
    goto LABEL_98;
  }
LABEL_97:

  if (v26)
  {
LABEL_88:
    if (v24) {
      goto LABEL_89;
    }
LABEL_99:

    if (v46) {
      goto LABEL_90;
    }
    goto LABEL_100;
  }
LABEL_98:

  if (!v24) {
    goto LABEL_99;
  }
LABEL_89:
  if (v46) {
    goto LABEL_90;
  }
LABEL_100:

LABEL_90:

  return v42;
}

- (BMSiriAssistantSuggestionFeaturesDeviceFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v199[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v167 = [v6 objectForKeyedSubscript:@"connectedToAirpods"];
  if (!v167 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
LABEL_4:
    id v8 = [v6 objectForKeyedSubscript:@"noiseCancellingMode"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v165 = 0;
          v37 = 0;
          goto LABEL_67;
        }
        id v46 = v7;
        id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v48 = *MEMORY[0x1E4F502C8];
        uint64_t v196 = *MEMORY[0x1E4F28568];
        uint64_t v40 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"noiseCancellingMode"];
        v197 = v40;
        uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v197 forKeys:&v196 count:1];
        v50 = v47;
        id v7 = v46;
        v166 = (void *)v49;
        id v51 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v48, 2);
        v37 = 0;
        id v165 = 0;
        *a4 = v51;
        goto LABEL_66;
      }
      id v165 = v8;
    }
    else
    {
      id v165 = 0;
    }
    v166 = [v6 objectForKeyedSubscript:@"connectedToDevice"];
    if (v166 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v42 = a4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v40 = 0;
          v37 = 0;
          goto LABEL_66;
        }
        v155 = v8;
        id v52 = v7;
        id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v54 = *MEMORY[0x1E4F502C8];
        uint64_t v194 = *MEMORY[0x1E4F28568];
        uint64_t v55 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"connectedToDevice"];
        uint64_t v195 = v55;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v195 forKeys:&v194 count:1];
        v56 = v53;
        id v7 = v52;
        id v8 = v155;
        id v57 = (id)[v56 initWithDomain:v54 code:2 userInfo:v9];
        v37 = 0;
        uint64_t v40 = 0;
        id *v42 = v57;
        id v11 = (id)v55;
LABEL_65:

LABEL_66:
        goto LABEL_67;
      }
      id v164 = v166;
    }
    else
    {
      id v164 = 0;
    }
    id v9 = [v6 objectForKeyedSubscript:@"isInCarPlay"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v37 = 0;
          uint64_t v40 = v164;
          goto LABEL_65;
        }
        id v58 = v7;
        id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v60 = *MEMORY[0x1E4F502C8];
        uint64_t v192 = *MEMORY[0x1E4F28568];
        v146 = a4;
        id v163 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isInCarPlay"];
        id v193 = v163;
        int v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v193 forKeys:&v192 count:1];
        v61 = v59;
        id v7 = v58;
        id v62 = (id)[v61 initWithDomain:v60 code:2 userInfo:v38];
        v37 = 0;
        id v11 = 0;
        id *v146 = v62;
        uint64_t v40 = v164;
        goto LABEL_64;
      }
      id v10 = self;
      id v11 = v9;
    }
    else
    {
      id v10 = self;
      id v11 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"hasWatch"];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v163 = 0;
          v37 = 0;
          uint64_t v40 = v164;
          int v38 = v12;
          self = v10;
          goto LABEL_64;
        }
        v156 = v8;
        id v63 = v11;
        id v64 = v7;
        id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v66 = *MEMORY[0x1E4F502C8];
        uint64_t v190 = *MEMORY[0x1E4F28568];
        v147 = a4;
        id v67 = [NSString alloc];
        uint64_t v132 = objc_opt_class();
        v68 = v67;
        int v38 = v12;
        self = v10;
        id v162 = (id)[v68 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v132, @"hasWatch"];
        id v191 = v162;
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
        v69 = v65;
        id v7 = v64;
        id v11 = v63;
        id v8 = v156;
        id v70 = (id)[v69 initWithDomain:v66 code:2 userInfo:v13];
        v37 = 0;
        id v163 = 0;
        id *v147 = v70;
        uint64_t v40 = v164;
LABEL_63:

LABEL_64:
        goto LABEL_65;
      }
      v159 = v12;
      id v163 = v12;
    }
    else
    {
      v159 = v12;
      id v163 = 0;
    }
    [v6 objectForKeyedSubscript:@"hasIPad"];
    uint64_t v13 = self = v10;
    id v160 = v11;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v162 = 0;
          v37 = 0;
          uint64_t v40 = v164;
          int v38 = v159;
          goto LABEL_63;
        }
        v157 = v8;
        id v71 = v11;
        id v72 = v7;
        id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v74 = *MEMORY[0x1E4F502C8];
        uint64_t v188 = *MEMORY[0x1E4F28568];
        id v161 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"hasIPad"];
        id v189 = v161;
        uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v189 forKeys:&v188 count:1];
        v76 = v73;
        id v7 = v72;
        id v11 = v71;
        id v8 = v157;
        v158 = (void *)v75;
        id v77 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v74, 2);
        v37 = 0;
        id v162 = 0;
        *a4 = v77;
        uint64_t v40 = v164;
        int v38 = v159;
        goto LABEL_62;
      }
      id v14 = v7;
      id v162 = v13;
    }
    else
    {
      id v14 = v7;
      id v162 = 0;
    }
    uint64_t v15 = [v6 objectForKeyedSubscript:@"hasHomePod"];
    v158 = (void *)v15;
    if (v15 && (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v161 = 0;
          v37 = 0;
          uint64_t v40 = v164;
          int v38 = v159;
          id v7 = v14;
          goto LABEL_61;
        }
        id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v81 = *MEMORY[0x1E4F502C8];
        uint64_t v186 = *MEMORY[0x1E4F28568];
        id v153 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"hasHomePod"];
        id v187 = v153;
        uint64_t v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v187 forKeys:&v186 count:1];
        v83 = v80;
        id v7 = v14;
        uint64_t v17 = (void *)v82;
        id v84 = (id)[v83 initWithDomain:v81 code:2 userInfo:v82];
        v37 = 0;
        id v161 = 0;
        *a4 = v84;
        goto LABEL_135;
      }
      id v161 = v16;
    }
    else
    {
      id v161 = 0;
    }
    [v6 objectForKeyedSubscript:@"hasAppleTV"];
    v17 = id v7 = v14;
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v145 = v13;
      uint64_t v18 = self;
      id v153 = 0;
LABEL_25:
      uint64_t v19 = [v6 objectForKeyedSubscript:@"hasIPhone"];
      v148 = v17;
      v151 = (void *)v19;
      if (v19 && (uint64_t v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v152 = 0;
            v37 = 0;
            uint64_t v40 = v164;
            int v38 = v159;
            self = v18;
            goto LABEL_58;
          }
          id v90 = v7;
          id v91 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v92 = *MEMORY[0x1E4F502C8];
          uint64_t v182 = *MEMORY[0x1E4F28568];
          self = v18;
          id v149 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"hasIPhone"];
          id v183 = v149;
          int v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v183 forKeys:&v182 count:1];
          v93 = v91;
          id v7 = v90;
          uint64_t v17 = v148;
          id v94 = (id)[v93 initWithDomain:v92 code:2 userInfo:v21];
          v37 = 0;
          id v152 = 0;
          *a4 = v94;
          goto LABEL_142;
        }
        id v152 = v20;
      }
      else
      {
        id v152 = 0;
      }
      [v6 objectForKeyedSubscript:@"totalNumDevices"];
      int v21 = self = v18;
      v144 = v21;
      if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v149 = 0;
LABEL_31:
        uint64_t v22 = [v6 objectForKeyedSubscript:@"currentDeviceType"];
        v142 = (void *)v22;
        if (v22 && (int v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v78 = v9;
          v79 = self;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v143 = 0;
              v37 = 0;
              uint64_t v40 = v164;
              int v38 = v159;
              uint64_t v17 = v148;
              int v21 = v144;
              goto LABEL_56;
            }
            id v101 = v7;
            id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v103 = *MEMORY[0x1E4F502C8];
            uint64_t v178 = *MEMORY[0x1E4F28568];
            id v141 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"currentDeviceType"];
            id v179 = v141;
            uint64_t v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v179 forKeys:&v178 count:1];
            v105 = v102;
            id v7 = v101;
            v140 = (void *)v104;
            id v106 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v103, 2);
            v37 = 0;
            id v143 = 0;
            *a4 = v106;
            goto LABEL_148;
          }
          id v143 = v23;
          uint64_t v17 = v148;
          int v21 = v144;
        }
        else
        {
          id v143 = 0;
        }
        uint64_t v24 = [v6 objectForKeyedSubscript:@"currentBuildVersion"];
        v140 = (void *)v24;
        if (!v24 || (int v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v141 = 0;
          goto LABEL_37;
        }
        v78 = v9;
        v79 = self;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v141 = v25;
          uint64_t v17 = v148;
          int v21 = v144;
LABEL_37:
          uint64_t v26 = [v6 objectForKeyedSubscript:@"distanceFromLatestBuild"];
          v137 = (void *)v26;
          if (!v26 || (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v139 = 0;
LABEL_40:
            uint64_t v28 = [v6 objectForKeyedSubscript:@"isALargeFormatPhone"];
            v136 = (void *)v28;
            if (v28 && (v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  id v138 = 0;
                  v37 = 0;
                  uint64_t v40 = v164;
                  int v38 = v159;
                  goto LABEL_53;
                }
                id v119 = v7;
                id v120 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v121 = *MEMORY[0x1E4F502C8];
                uint64_t v172 = *MEMORY[0x1E4F28568];
                int v21 = v144;
                v135 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isALargeFormatPhone"];
                v173 = v135;
                v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v173 forKeys:&v172 count:1];
                v122 = v120;
                id v7 = v119;
                uint64_t v17 = v148;
                id v123 = (id)[v122 initWithDomain:v121 code:2 userInfo:v39];
                v37 = 0;
                id v138 = 0;
                *a4 = v123;
                int v38 = v159;
                goto LABEL_52;
              }
              id v138 = v29;
            }
            else
            {
              id v138 = 0;
            }
            uint64_t v30 = [v6 objectForKeyedSubscript:@"hasAPasscode"];
            v134 = v9;
            v154 = (void *)v30;
            if (v30 && (uint64_t v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v135 = 0;
                  v37 = 0;
                  int v38 = v159;
                  goto LABEL_51;
                }
                id v33 = v7;
                id v124 = objc_alloc(MEMORY[0x1E4F28C58]);
                v125 = a4;
                uint64_t v126 = *MEMORY[0x1E4F502C8];
                uint64_t v170 = *MEMORY[0x1E4F28568];
                id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"hasAPasscode"];
                id v171 = v36;
                v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v171 forKeys:&v170 count:1];
                id v127 = (id)[v124 initWithDomain:v126 code:2 userInfo:v35];
                v37 = 0;
                v135 = 0;
                id *v125 = v127;
                goto LABEL_50;
              }
              id v32 = v160;
              id v33 = v7;
              id v34 = v31;
            }
            else
            {
              id v32 = v160;
              id v33 = v7;
              id v34 = 0;
            }
            v35 = [v6 objectForKeyedSubscript:@"supportsSMSMEssaging"];
            v135 = v34;
            if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (a4)
                {
                  id v133 = objc_alloc(MEMORY[0x1E4F28C58]);
                  v128 = a4;
                  uint64_t v129 = *MEMORY[0x1E4F502C8];
                  uint64_t v168 = *MEMORY[0x1E4F28568];
                  v130 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"supportsSMSMEssaging"];
                  v169 = v130;
                  v131 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v169 forKeys:&v168 count:1];
                  id *v128 = (id)[v133 initWithDomain:v129 code:2 userInfo:v131];
                }
                id v36 = 0;
                v37 = 0;
                goto LABEL_50;
              }
              id v36 = v35;
            }
            else
            {
              id v36 = 0;
            }
            self = objc_retain(-[BMSiriAssistantSuggestionFeaturesDeviceFeatures initWithConnectedToAirpods:noiseCancellingMode:connectedToDevice:isInCarPlay:hasWatch:hasIPad:hasHomePod:hasAppleTV:hasIPhone:totalNumDevices:currentDeviceType:currentBuildVersion:distanceFromLatestBuild:isALargeFormatPhone:hasAPasscode:supportsSMSMEssaging:](self, "initWithConnectedToAirpods:noiseCancellingMode:connectedToDevice:isInCarPlay:hasWatch:hasIPad:hasHomePod:hasAppleTV:hasIPhone:totalNumDevices:currentDeviceType:currentBuildVersion:distanceFromLatestBuild:isALargeFormatPhone:hasAPasscode:supportsSMSMEssaging:", v33, v165, v164, v32, v163, v162, v161, v153, v152, v149, v143, v141, v139, v138,
                       v34,
                       v36));
            v37 = self;
LABEL_50:
            int v38 = v159;

            id v7 = v33;
            id v9 = v134;
            uint64_t v17 = v148;
            int v21 = v144;
LABEL_51:
            v39 = v154;
LABEL_52:

            uint64_t v40 = v164;
LABEL_53:

LABEL_54:
LABEL_55:

LABEL_56:
LABEL_57:

LABEL_58:
            uint64_t v13 = v145;
LABEL_59:

LABEL_60:
LABEL_61:
            id v11 = v160;
LABEL_62:

            goto LABEL_63;
          }
          v78 = v9;
          v79 = self;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v139 = v27;
            uint64_t v17 = v148;
            int v21 = v144;
            goto LABEL_40;
          }
          if (a4)
          {
            id v113 = v7;
            id v114 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v115 = *MEMORY[0x1E4F502C8];
            uint64_t v174 = *MEMORY[0x1E4F28568];
            id v138 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"distanceFromLatestBuild"];
            id v175 = v138;
            uint64_t v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v175 forKeys:&v174 count:1];
            v117 = v114;
            id v7 = v113;
            v136 = (void *)v116;
            id v118 = (id)objc_msgSend(v117, "initWithDomain:code:userInfo:", v115, 2);
            v37 = 0;
            id v139 = 0;
            *a4 = v118;
            uint64_t v40 = v164;
            id v9 = v78;
            int v38 = v159;
            uint64_t v17 = v148;
            int v21 = v144;
            goto LABEL_53;
          }
          id v139 = 0;
          v37 = 0;
LABEL_150:
          self = v79;
          uint64_t v40 = v164;
          id v9 = v78;
          int v38 = v159;
          uint64_t v17 = v148;
          int v21 = v144;
          goto LABEL_54;
        }
        if (a4)
        {
          id v107 = v7;
          id v108 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v109 = *MEMORY[0x1E4F502C8];
          uint64_t v176 = *MEMORY[0x1E4F28568];
          id v139 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"currentBuildVersion"];
          id v177 = v139;
          uint64_t v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v177 forKeys:&v176 count:1];
          v111 = v108;
          id v7 = v107;
          v137 = (void *)v110;
          id v112 = (id)objc_msgSend(v111, "initWithDomain:code:userInfo:", v109, 2);
          v37 = 0;
          id v141 = 0;
          *a4 = v112;
          goto LABEL_150;
        }
        id v141 = 0;
        v37 = 0;
LABEL_148:
        self = v79;
        uint64_t v40 = v164;
        id v9 = v78;
        int v38 = v159;
        uint64_t v17 = v148;
        int v21 = v144;
        goto LABEL_55;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v149 = v21;
        goto LABEL_31;
      }
      if (a4)
      {
        id v95 = v7;
        id v96 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v97 = *MEMORY[0x1E4F502C8];
        uint64_t v180 = *MEMORY[0x1E4F28568];
        id v143 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"totalNumDevices"];
        id v181 = v143;
        uint64_t v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v181 forKeys:&v180 count:1];
        v99 = v96;
        id v7 = v95;
        uint64_t v17 = v148;
        v142 = (void *)v98;
        id v100 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v97, 2);
        v37 = 0;
        id v149 = 0;
        *a4 = v100;
        uint64_t v40 = v164;
        int v38 = v159;
        goto LABEL_56;
      }
      id v149 = 0;
      v37 = 0;
LABEL_142:
      uint64_t v40 = v164;
      int v38 = v159;
      goto LABEL_57;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v145 = v13;
      uint64_t v18 = self;
      id v153 = v17;
      goto LABEL_25;
    }
    if (a4)
    {
      id v150 = v7;
      id v85 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v86 = *MEMORY[0x1E4F502C8];
      uint64_t v184 = *MEMORY[0x1E4F28568];
      id v152 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"hasAppleTV"];
      id v185 = v152;
      uint64_t v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v185 forKeys:&v184 count:1];
      v88 = v85;
      id v7 = v150;
      v151 = (void *)v87;
      id v89 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v86, 2);
      v37 = 0;
      id v153 = 0;
      *a4 = v89;
      uint64_t v40 = v164;
      int v38 = v159;
      goto LABEL_59;
    }
    id v153 = 0;
    v37 = 0;
LABEL_135:
    uint64_t v40 = v164;
    int v38 = v159;
    goto LABEL_60;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v167;
    goto LABEL_4;
  }
  if (!a4)
  {
    v37 = 0;
    id v7 = 0;
    goto LABEL_68;
  }
  id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v44 = *MEMORY[0x1E4F502C8];
  uint64_t v198 = *MEMORY[0x1E4F28568];
  id v165 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"connectedToAirpods"];
  v199[0] = v165;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v199 forKeys:&v198 count:1];
  id v45 = (id)[v43 initWithDomain:v44 code:2 userInfo:v8];
  v37 = 0;
  id v7 = 0;
  *a4 = v45;
LABEL_67:

LABEL_68:
  return v37;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasConnectedToAirpods)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_noiseCancellingMode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_connectedToDevice)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasIsInCarPlay)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasHasWatch)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasHasIPad)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasHasHomePod)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasHasAppleTV)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasHasIPhone)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasTotalNumDevices)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_currentDeviceType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_currentBuildVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_distanceFromLatestBuild)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasIsALargeFormatPhone)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasHasAPasscode)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasSupportsSMSMEssaging)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v104.receiver = self;
  v104.super_class = (Class)BMSiriAssistantSuggestionFeaturesDeviceFeatures;
  id v5 = [(BMEventBase *)&v104 init];
  if (!v5) {
    goto LABEL_153;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
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
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasConnectedToAirpods = 1;
          while (1)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_106;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              uint64_t v22 = 0;
              goto LABEL_108;
            }
          }
          v4[*v8] = 1;
LABEL_106:
          if (v4[*v8]) {
            uint64_t v22 = 0;
          }
LABEL_108:
          BOOL v100 = v22 != 0;
          uint64_t v101 = 16;
          goto LABEL_149;
        case 2u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 48;
          goto LABEL_83;
        case 3u:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 56;
          goto LABEL_83;
        case 5u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          v5->_hasIsInCarPlay = 1;
          while (2)
          {
            uint64_t v32 = *v6;
            uint64_t v33 = *(void *)&v4[v32];
            unint64_t v34 = v33 + 1;
            if (v33 == -1 || v34 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
              *(void *)&v4[v32] = v34;
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if (v35 < 0)
              {
                v29 += 7;
                BOOL v17 = v30++ >= 9;
                if (v17)
                {
                  uint64_t v31 = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v31 = 0;
          }
LABEL_112:
          BOOL v100 = v31 != 0;
          uint64_t v101 = 18;
          goto LABEL_149;
        case 6u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          v5->_hasHasWatch = 1;
          while (2)
          {
            uint64_t v39 = *v6;
            uint64_t v40 = *(void *)&v4[v39];
            unint64_t v41 = v40 + 1;
            if (v40 == -1 || v41 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
              *(void *)&v4[v39] = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                BOOL v17 = v37++ >= 9;
                if (v17)
                {
                  uint64_t v38 = 0;
                  goto LABEL_116;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v38 = 0;
          }
LABEL_116:
          BOOL v100 = v38 != 0;
          uint64_t v101 = 20;
          goto LABEL_149;
        case 7u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          v5->_hasHasIPad = 1;
          while (2)
          {
            uint64_t v46 = *v6;
            uint64_t v47 = *(void *)&v4[v46];
            unint64_t v48 = v47 + 1;
            if (v47 == -1 || v48 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)&v4[*v9] + v47);
              *(void *)&v4[v46] = v48;
              v45 |= (unint64_t)(v49 & 0x7F) << v43;
              if (v49 < 0)
              {
                v43 += 7;
                BOOL v17 = v44++ >= 9;
                if (v17)
                {
                  uint64_t v45 = 0;
                  goto LABEL_120;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v45 = 0;
          }
LABEL_120:
          BOOL v100 = v45 != 0;
          uint64_t v101 = 22;
          goto LABEL_149;
        case 8u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
          v5->_hasHasHomePod = 1;
          while (2)
          {
            uint64_t v53 = *v6;
            uint64_t v54 = *(void *)&v4[v53];
            unint64_t v55 = v54 + 1;
            if (v54 == -1 || v55 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v56 = *(unsigned char *)(*(void *)&v4[*v9] + v54);
              *(void *)&v4[v53] = v55;
              v52 |= (unint64_t)(v56 & 0x7F) << v50;
              if (v56 < 0)
              {
                v50 += 7;
                BOOL v17 = v51++ >= 9;
                if (v17)
                {
                  uint64_t v52 = 0;
                  goto LABEL_124;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v52 = 0;
          }
LABEL_124:
          BOOL v100 = v52 != 0;
          uint64_t v101 = 24;
          goto LABEL_149;
        case 9u:
          char v57 = 0;
          unsigned int v58 = 0;
          uint64_t v59 = 0;
          v5->_hasHasAppleTV = 1;
          while (2)
          {
            uint64_t v60 = *v6;
            uint64_t v61 = *(void *)&v4[v60];
            unint64_t v62 = v61 + 1;
            if (v61 == -1 || v62 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v63 = *(unsigned char *)(*(void *)&v4[*v9] + v61);
              *(void *)&v4[v60] = v62;
              v59 |= (unint64_t)(v63 & 0x7F) << v57;
              if (v63 < 0)
              {
                v57 += 7;
                BOOL v17 = v58++ >= 9;
                if (v17)
                {
                  uint64_t v59 = 0;
                  goto LABEL_128;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v59 = 0;
          }
LABEL_128:
          BOOL v100 = v59 != 0;
          uint64_t v101 = 26;
          goto LABEL_149;
        case 0xAu:
          char v64 = 0;
          unsigned int v65 = 0;
          uint64_t v66 = 0;
          v5->_hasHasIPhone = 1;
          while (2)
          {
            uint64_t v67 = *v6;
            uint64_t v68 = *(void *)&v4[v67];
            unint64_t v69 = v68 + 1;
            if (v68 == -1 || v69 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v70 = *(unsigned char *)(*(void *)&v4[*v9] + v68);
              *(void *)&v4[v67] = v69;
              v66 |= (unint64_t)(v70 & 0x7F) << v64;
              if (v70 < 0)
              {
                v64 += 7;
                BOOL v17 = v65++ >= 9;
                if (v17)
                {
                  uint64_t v66 = 0;
                  goto LABEL_132;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v66 = 0;
          }
LABEL_132:
          BOOL v100 = v66 != 0;
          uint64_t v101 = 28;
          goto LABEL_149;
        case 0xBu:
          char v71 = 0;
          unsigned int v72 = 0;
          uint64_t v73 = 0;
          v5->_hasTotalNumDevices = 1;
          while (2)
          {
            uint64_t v74 = *v6;
            uint64_t v75 = *(void *)&v4[v74];
            unint64_t v76 = v75 + 1;
            if (v75 == -1 || v76 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v77 = *(unsigned char *)(*(void *)&v4[*v9] + v75);
              *(void *)&v4[v74] = v76;
              v73 |= (unint64_t)(v77 & 0x7F) << v71;
              if (v77 < 0)
              {
                v71 += 7;
                BOOL v17 = v72++ >= 9;
                if (v17)
                {
                  LODWORD(v73) = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v73) = 0;
          }
LABEL_136:
          v5->_totalNumDevices = v73;
          continue;
        case 0xCu:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 64;
          goto LABEL_83;
        case 0xDu:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 72;
          goto LABEL_83;
        case 0xEu:
          uint64_t v27 = PBReaderReadString();
          uint64_t v28 = 80;
LABEL_83:
          v78 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = (Class)v27;

          continue;
        case 0xFu:
          char v79 = 0;
          unsigned int v80 = 0;
          uint64_t v81 = 0;
          v5->_hasIsALargeFormatPhone = 1;
          while (2)
          {
            uint64_t v82 = *v6;
            uint64_t v83 = *(void *)&v4[v82];
            unint64_t v84 = v83 + 1;
            if (v83 == -1 || v84 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v85 = *(unsigned char *)(*(void *)&v4[*v9] + v83);
              *(void *)&v4[v82] = v84;
              v81 |= (unint64_t)(v85 & 0x7F) << v79;
              if (v85 < 0)
              {
                v79 += 7;
                BOOL v17 = v80++ >= 9;
                if (v17)
                {
                  uint64_t v81 = 0;
                  goto LABEL_140;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v81 = 0;
          }
LABEL_140:
          BOOL v100 = v81 != 0;
          uint64_t v101 = 31;
          goto LABEL_149;
        case 0x10u:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v88 = 0;
          v5->_hasHasAPasscode = 1;
          while (2)
          {
            uint64_t v89 = *v6;
            uint64_t v90 = *(void *)&v4[v89];
            unint64_t v91 = v90 + 1;
            if (v90 == -1 || v91 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v92 = *(unsigned char *)(*(void *)&v4[*v9] + v90);
              *(void *)&v4[v89] = v91;
              v88 |= (unint64_t)(v92 & 0x7F) << v86;
              if (v92 < 0)
              {
                v86 += 7;
                BOOL v17 = v87++ >= 9;
                if (v17)
                {
                  uint64_t v88 = 0;
                  goto LABEL_144;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v88 = 0;
          }
LABEL_144:
          BOOL v100 = v88 != 0;
          uint64_t v101 = 33;
          goto LABEL_149;
        case 0x11u:
          char v93 = 0;
          unsigned int v94 = 0;
          uint64_t v95 = 0;
          v5->_hasSupportsSMSMEssaging = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_152;
          }
          continue;
      }
      while (1)
      {
        uint64_t v96 = *v6;
        uint64_t v97 = *(void *)&v4[v96];
        unint64_t v98 = v97 + 1;
        if (v97 == -1 || v98 > *(void *)&v4[*v7]) {
          break;
        }
        char v99 = *(unsigned char *)(*(void *)&v4[*v9] + v97);
        *(void *)&v4[v96] = v98;
        v95 |= (unint64_t)(v99 & 0x7F) << v93;
        if ((v99 & 0x80) == 0) {
          goto LABEL_146;
        }
        v93 += 7;
        BOOL v17 = v94++ >= 9;
        if (v17)
        {
          uint64_t v95 = 0;
          goto LABEL_148;
        }
      }
      v4[*v8] = 1;
LABEL_146:
      if (v4[*v8]) {
        uint64_t v95 = 0;
      }
LABEL_148:
      BOOL v100 = v95 != 0;
      uint64_t v101 = 35;
LABEL_149:
      *((unsigned char *)&v5->super.super.isa + v101) = v100;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_152:
  }
    id v102 = 0;
  else {
LABEL_153:
  }
    id v102 = v5;

  return v102;
}

- (NSString)description
{
  id v17 = [NSString alloc];
  char v16 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures connectedToAirpods](self, "connectedToAirpods"));
  unsigned int v21 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self noiseCancellingMode];
  char v20 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self connectedToDevice];
  unint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures isInCarPlay](self, "isInCarPlay"));
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasWatch](self, "hasWatch"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIPad](self, "hasIPad"));
  uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasHomePod](self, "hasHomePod"));
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasAppleTV](self, "hasAppleTV"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasIPhone](self, "hasIPhone"));
  char v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures totalNumDevices](self, "totalNumDevices"));
  id v3 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self currentDeviceType];
  id v4 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self currentBuildVersion];
  id v5 = [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self distanceFromLatestBuild];
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures isALargeFormatPhone](self, "isALargeFormatPhone"));
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures hasAPasscode](self, "hasAPasscode"));
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesDeviceFeatures supportsSMSMEssaging](self, "supportsSMSMEssaging"));
  int v18 = (void *)[v17 initWithFormat:@"BMSiriAssistantSuggestionFeaturesDeviceFeatures with connectedToAirpods: %@, noiseCancellingMode: %@, connectedToDevice: %@, isInCarPlay: %@, hasWatch: %@, hasIPad: %@, hasHomePod: %@, hasAppleTV: %@, hasIPhone: %@, totalNumDevices: %@, currentDeviceType: %@, currentBuildVersion: %@, distanceFromLatestBuild: %@, isALargeFormatPhone: %@, hasAPasscode: %@, supportsSMSMEssaging: %@", v16, v21, v20, v15, v14, v13, v19, v12, v11, v10, v3, v4, v5, v6, v7, v8];

  return (NSString *)v18;
}

- (BMSiriAssistantSuggestionFeaturesDeviceFeatures)initWithConnectedToAirpods:(id)a3 noiseCancellingMode:(id)a4 connectedToDevice:(id)a5 isInCarPlay:(id)a6 hasWatch:(id)a7 hasIPad:(id)a8 hasHomePod:(id)a9 hasAppleTV:(id)a10 hasIPhone:(id)a11 totalNumDevices:(id)a12 currentDeviceType:(id)a13 currentBuildVersion:(id)a14 distanceFromLatestBuild:(id)a15 isALargeFormatPhone:(id)a16 hasAPasscode:(id)a17 supportsSMSMEssaging:(id)a18
{
  id v44 = a3;
  id obj = a4;
  id v38 = a4;
  id v34 = a5;
  id v37 = a5;
  id v42 = a6;
  id v43 = a7;
  id v23 = a8;
  id v41 = a9;
  id v40 = a10;
  id v24 = a11;
  id v39 = a12;
  id v25 = a13;
  id v26 = a14;
  id v36 = a15;
  id v27 = a16;
  id v28 = a17;
  id v29 = a18;
  v45.receiver = self;
  v45.super_class = (Class)BMSiriAssistantSuggestionFeaturesDeviceFeatures;
  unsigned int v30 = [(BMEventBase *)&v45 init];
  if (v30)
  {
    v30->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v44)
    {
      v30->_hasConnectedToAirpods = 1;
      v30->_connectedToAirpods = [v44 BOOLValue];
    }
    else
    {
      v30->_hasConnectedToAirpods = 0;
      v30->_connectedToAirpods = 0;
    }
    objc_storeStrong((id *)&v30->_noiseCancellingMode, obj);
    objc_storeStrong((id *)&v30->_connectedToDevice, v34);
    if (v42)
    {
      v30->_hasIsInCarPlay = 1;
      v30->_isInCarPlay = [v42 BOOLValue];
    }
    else
    {
      v30->_hasIsInCarPlay = 0;
      v30->_isInCarPlay = 0;
    }
    if (v43)
    {
      v30->_hasHasWatch = 1;
      v30->_hasWatch = [v43 BOOLValue];
    }
    else
    {
      v30->_hasHasWatch = 0;
      v30->_hasWatch = 0;
    }
    if (v23)
    {
      v30->_hasHasIPad = 1;
      v30->_hasIPad = [v23 BOOLValue];
    }
    else
    {
      v30->_hasHasIPad = 0;
      v30->_hasIPad = 0;
    }
    if (v41)
    {
      v30->_hasHasHomePod = 1;
      v30->_hasHomePod = [v41 BOOLValue];
    }
    else
    {
      v30->_hasHasHomePod = 0;
      v30->_hasHomePod = 0;
    }
    if (v40)
    {
      v30->_hasHasAppleTV = 1;
      v30->_hasAppleTV = [v40 BOOLValue];
    }
    else
    {
      v30->_hasHasAppleTV = 0;
      v30->_hasAppleTV = 0;
    }
    if (v24)
    {
      v30->_hasHasIPhone = 1;
      v30->_hasIPhone = [v24 BOOLValue];
    }
    else
    {
      v30->_hasHasIPhone = 0;
      v30->_hasIPhone = 0;
    }
    if (v39)
    {
      v30->_hasTotalNumDevices = 1;
      int v31 = [v39 intValue];
    }
    else
    {
      v30->_hasTotalNumDevices = 0;
      int v31 = -1;
    }
    v30->_totalNumDevices = v31;
    objc_storeStrong((id *)&v30->_currentDeviceType, a13);
    objc_storeStrong((id *)&v30->_currentBuildVersion, a14);
    objc_storeStrong((id *)&v30->_distanceFromLatestBuild, a15);
    if (v27)
    {
      v30->_hasIsALargeFormatPhone = 1;
      v30->_isALargeFormatPhone = [v27 BOOLValue];
    }
    else
    {
      v30->_hasIsALargeFormatPhone = 0;
      v30->_isALargeFormatPhone = 0;
    }
    if (v28)
    {
      v30->_hasHasAPasscode = 1;
      v30->_hasAPasscode = [v28 BOOLValue];
    }
    else
    {
      v30->_hasHasAPasscode = 0;
      v30->_hasAPasscode = 0;
    }
    if (v29)
    {
      v30->_hasSupportsSMSMEssaging = 1;
      v30->_supportsSMSMEssaging = [v29 BOOLValue];
    }
    else
    {
      v30->_hasSupportsSMSMEssaging = 0;
      v30->_supportsSMSMEssaging = 0;
    }
  }

  return v30;
}

+ (id)protoFields
{
  v20[16] = *MEMORY[0x1E4F143B8];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"connectedToAirpods" number:1 type:12 subMessageClass:0];
  v20[0] = v19;
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"noiseCancellingMode" number:2 type:13 subMessageClass:0];
  v20[1] = v18;
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"connectedToDevice" number:3 type:13 subMessageClass:0];
  v20[2] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isInCarPlay" number:5 type:12 subMessageClass:0];
  v20[3] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasWatch" number:6 type:12 subMessageClass:0];
  v20[4] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasIPad" number:7 type:12 subMessageClass:0];
  v20[5] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasHomePod" number:8 type:12 subMessageClass:0];
  v20[6] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasAppleTV" number:9 type:12 subMessageClass:0];
  v20[7] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasIPhone" number:10 type:12 subMessageClass:0];
  v20[8] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"totalNumDevices" number:11 type:2 subMessageClass:0];
  v20[9] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"currentDeviceType" number:12 type:13 subMessageClass:0];
  v20[10] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"currentBuildVersion" number:13 type:13 subMessageClass:0];
  v20[11] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"distanceFromLatestBuild" number:14 type:13 subMessageClass:0];
  v20[12] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isALargeFormatPhone" number:15 type:12 subMessageClass:0];
  v20[13] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hasAPasscode" number:16 type:12 subMessageClass:0];
  v20[14] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"supportsSMSMEssaging" number:17 type:12 subMessageClass:0];
  v20[15] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:16];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3C00;
}

+ (id)columns
{
  v20[16] = *MEMORY[0x1E4F143B8];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"connectedToAirpods" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"noiseCancellingMode" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"connectedToDevice" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isInCarPlay" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasWatch" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasIPad" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasHomePod" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasAppleTV" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasIPhone" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"totalNumDevices" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:2 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"currentDeviceType" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"currentBuildVersion" dataType:2 requestOnly:0 fieldNumber:13 protoDataType:13 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"distanceFromLatestBuild" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isALargeFormatPhone" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:12 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hasAPasscode" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:12 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"supportsSMSMEssaging" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:12 convertedType:0];
  v20[0] = v19;
  v20[1] = v18;
  v20[2] = v17;
  v20[3] = v16;
  v20[4] = v15;
  v20[5] = v14;
  v20[6] = v2;
  v20[7] = v3;
  v20[8] = v4;
  v20[9] = v5;
  v20[10] = v13;
  v20[11] = v6;
  v20[12] = v7;
  v20[13] = v12;
  v20[14] = v8;
  v20[15] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:16];

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriAssistantSuggestionFeaturesDeviceFeatures alloc] initByReadFrom:v7];
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