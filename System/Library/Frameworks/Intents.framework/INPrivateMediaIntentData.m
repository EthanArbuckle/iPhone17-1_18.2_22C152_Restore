@interface INPrivateMediaIntentData
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INAppIdentifier)proxiedThirdPartyAppInfo;
- (INHomeAutomationEntityProvider)homeAutomationEntityProvider;
- (INPrivateMediaIntentData)initWithCoder:(id)a3;
- (INPrivateMediaIntentData)initWithSpeakerIDInfo:(id)a3 proxiedThirdPartyAppInfo:(id)a4 isAppAttributionRequired:(id)a5 useDialogMemoryForAttribution:(id)a6 isAppCorrection:(id)a7 fallbackUsername:(id)a8 wholeHouseAudioMetadata:(id)a9 nlConfidenceScore:(id)a10 nlConfidenceLevel:(int64_t)a11 asrConfidenceScore:(id)a12 asrConfidenceLevel:(int64_t)a13;
- (INPrivateMediaIntentData)initWithSpeakerIDInfo:(id)a3 proxiedThirdPartyAppInfo:(id)a4 isAppAttributionRequired:(id)a5 useDialogMemoryForAttribution:(id)a6 isAppCorrection:(id)a7 fallbackUsername:(id)a8 wholeHouseAudioMetadata:(id)a9 nlConfidenceScore:(id)a10 nlConfidenceLevel:(int64_t)a11 asrConfidenceScore:(id)a12 asrConfidenceLevel:(int64_t)a13 resolvedSharedUserID:(id)a14;
- (INPrivateMediaIntentData)initWithSpeakerIDInfo:(id)a3 proxiedThirdPartyAppInfo:(id)a4 isAppAttributionRequired:(id)a5 useDialogMemoryForAttribution:(id)a6 isAppCorrection:(id)a7 fallbackUsername:(id)a8 wholeHouseAudioMetadata:(id)a9 nlConfidenceScore:(id)a10 nlConfidenceLevel:(int64_t)a11 asrConfidenceScore:(id)a12 asrConfidenceLevel:(int64_t)a13 resolvedSharedUserID:(id)a14 homeAutomationEntityProvider:(id)a15;
- (INSpeakerIDInfo)speakerIDInfo;
- (INWholeHouseAudioMetadata)wholeHouseAudioMetadata;
- (NSNumber)asrConfidenceScore;
- (NSNumber)isAppAttributionRequired;
- (NSNumber)isAppCorrection;
- (NSNumber)nlConfidenceScore;
- (NSNumber)useDialogMemoryForAttribution;
- (NSString)description;
- (NSString)fallbackUsername;
- (NSString)resolvedSharedUserID;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)asrConfidenceLevel;
- (int64_t)nlConfidenceLevel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFallbackUsername:(id)a3;
- (void)setIsAppAttributionRequired:(id)a3;
- (void)setProxiedThirdPartyAppInfo:(id)a3;
- (void)setResolvedSharedUserID:(id)a3;
- (void)setSpeakerIDInfo:(id)a3;
- (void)setUseDialogMemoryForAttribution:(id)a3;
@end

@implementation INPrivateMediaIntentData

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_speakerIDInfo];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"speakerIDInfo");

  v9 = [v6 encodeObject:self->_proxiedThirdPartyAppInfo];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"proxiedThirdPartyAppInfo");

  v10 = [v6 encodeObject:self->_isAppAttributionRequired];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"isAppAttributionRequired");

  v11 = [v6 encodeObject:self->_useDialogMemoryForAttribution];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"useDialogMemoryForAttribution");

  v12 = [v6 encodeObject:self->_isAppCorrection];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"isAppCorrection");

  v13 = [v6 encodeObject:self->_fallbackUsername];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"fallbackUsername");

  v14 = [v6 encodeObject:self->_wholeHouseAudioMetadata];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"wholeHouseAudioMetadata");

  v15 = [v6 encodeObject:self->_nlConfidenceScore];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"nlConfidenceScore");

  unint64_t v16 = self->_nlConfidenceLevel - 1;
  if (v16 > 2) {
    v17 = @"unknown";
  }
  else {
    v17 = off_1E5520598[v16];
  }
  v18 = v17;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v18, @"nlConfidenceLevel");

  v19 = [v6 encodeObject:self->_asrConfidenceScore];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, @"asrConfidenceScore");

  unint64_t v20 = self->_asrConfidenceLevel - 1;
  if (v20 > 2) {
    v21 = @"unknown";
  }
  else {
    v21 = off_1E5520598[v20];
  }
  v22 = v21;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v22, @"asrConfidenceLevel");

  v23 = [v6 encodeObject:self->_resolvedSharedUserID];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, @"resolvedSharedUserID");

  v24 = [v6 encodeObject:self->_homeAutomationEntityProvider];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v24, @"homeAutomationEntityProvider");

  return v7;
}

- (INPrivateMediaIntentData)initWithSpeakerIDInfo:(id)a3 proxiedThirdPartyAppInfo:(id)a4 isAppAttributionRequired:(id)a5 useDialogMemoryForAttribution:(id)a6 isAppCorrection:(id)a7 fallbackUsername:(id)a8 wholeHouseAudioMetadata:(id)a9 nlConfidenceScore:(id)a10 nlConfidenceLevel:(int64_t)a11 asrConfidenceScore:(id)a12 asrConfidenceLevel:(int64_t)a13 resolvedSharedUserID:(id)a14
{
  return [(INPrivateMediaIntentData *)self initWithSpeakerIDInfo:a3 proxiedThirdPartyAppInfo:a4 isAppAttributionRequired:a5 useDialogMemoryForAttribution:a6 isAppCorrection:a7 fallbackUsername:a8 wholeHouseAudioMetadata:a9 nlConfidenceScore:a10 nlConfidenceLevel:a11 asrConfidenceScore:a12 asrConfidenceLevel:a13 resolvedSharedUserID:a14 homeAutomationEntityProvider:0];
}

- (INPrivateMediaIntentData)initWithSpeakerIDInfo:(id)a3 proxiedThirdPartyAppInfo:(id)a4 isAppAttributionRequired:(id)a5 useDialogMemoryForAttribution:(id)a6 isAppCorrection:(id)a7 fallbackUsername:(id)a8 wholeHouseAudioMetadata:(id)a9 nlConfidenceScore:(id)a10 nlConfidenceLevel:(int64_t)a11 asrConfidenceScore:(id)a12 asrConfidenceLevel:(int64_t)a13
{
  return [(INPrivateMediaIntentData *)self initWithSpeakerIDInfo:a3 proxiedThirdPartyAppInfo:a4 isAppAttributionRequired:a5 useDialogMemoryForAttribution:a6 isAppCorrection:a7 fallbackUsername:a8 wholeHouseAudioMetadata:a9 nlConfidenceScore:a10 nlConfidenceLevel:a11 asrConfidenceScore:a12 asrConfidenceLevel:a13 resolvedSharedUserID:0 homeAutomationEntityProvider:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAutomationEntityProvider, 0);
  objc_storeStrong((id *)&self->_resolvedSharedUserID, 0);
  objc_storeStrong((id *)&self->_asrConfidenceScore, 0);
  objc_storeStrong((id *)&self->_nlConfidenceScore, 0);
  objc_storeStrong((id *)&self->_wholeHouseAudioMetadata, 0);
  objc_storeStrong((id *)&self->_fallbackUsername, 0);
  objc_storeStrong((id *)&self->_isAppCorrection, 0);
  objc_storeStrong((id *)&self->_useDialogMemoryForAttribution, 0);
  objc_storeStrong((id *)&self->_isAppAttributionRequired, 0);
  objc_storeStrong((id *)&self->_proxiedThirdPartyAppInfo, 0);

  objc_storeStrong((id *)&self->_speakerIDInfo, 0);
}

- (INHomeAutomationEntityProvider)homeAutomationEntityProvider
{
  return self->_homeAutomationEntityProvider;
}

- (void)setResolvedSharedUserID:(id)a3
{
}

- (NSString)resolvedSharedUserID
{
  return self->_resolvedSharedUserID;
}

- (int64_t)asrConfidenceLevel
{
  return self->_asrConfidenceLevel;
}

- (NSNumber)asrConfidenceScore
{
  return self->_asrConfidenceScore;
}

- (int64_t)nlConfidenceLevel
{
  return self->_nlConfidenceLevel;
}

- (NSNumber)nlConfidenceScore
{
  return self->_nlConfidenceScore;
}

- (INWholeHouseAudioMetadata)wholeHouseAudioMetadata
{
  return self->_wholeHouseAudioMetadata;
}

- (void)setFallbackUsername:(id)a3
{
}

- (NSString)fallbackUsername
{
  return self->_fallbackUsername;
}

- (NSNumber)isAppCorrection
{
  return self->_isAppCorrection;
}

- (void)setUseDialogMemoryForAttribution:(id)a3
{
}

- (NSNumber)useDialogMemoryForAttribution
{
  return self->_useDialogMemoryForAttribution;
}

- (void)setIsAppAttributionRequired:(id)a3
{
}

- (NSNumber)isAppAttributionRequired
{
  return self->_isAppAttributionRequired;
}

- (void)setProxiedThirdPartyAppInfo:(id)a3
{
}

- (INAppIdentifier)proxiedThirdPartyAppInfo
{
  return self->_proxiedThirdPartyAppInfo;
}

- (void)setSpeakerIDInfo:(id)a3
{
}

- (INSpeakerIDInfo)speakerIDInfo
{
  return self->_speakerIDInfo;
}

- (id)_dictionaryRepresentation
{
  v38[13] = *MEMORY[0x1E4F143B8];
  uint64_t speakerIDInfo = (uint64_t)self->_speakerIDInfo;
  uint64_t v36 = speakerIDInfo;
  v37[0] = @"speakerIDInfo";
  if (!speakerIDInfo)
  {
    uint64_t speakerIDInfo = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)speakerIDInfo;
  v38[0] = speakerIDInfo;
  v37[1] = @"proxiedThirdPartyAppInfo";
  uint64_t proxiedThirdPartyAppInfo = (uint64_t)self->_proxiedThirdPartyAppInfo;
  uint64_t v35 = proxiedThirdPartyAppInfo;
  if (!proxiedThirdPartyAppInfo)
  {
    uint64_t proxiedThirdPartyAppInfo = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)proxiedThirdPartyAppInfo;
  v38[1] = proxiedThirdPartyAppInfo;
  v37[2] = @"isAppAttributionRequired";
  uint64_t isAppAttributionRequired = (uint64_t)self->_isAppAttributionRequired;
  uint64_t v34 = isAppAttributionRequired;
  if (!isAppAttributionRequired)
  {
    uint64_t isAppAttributionRequired = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)isAppAttributionRequired;
  v38[2] = isAppAttributionRequired;
  v37[3] = @"useDialogMemoryForAttribution";
  uint64_t useDialogMemoryForAttribution = (uint64_t)self->_useDialogMemoryForAttribution;
  uint64_t v33 = useDialogMemoryForAttribution;
  if (!useDialogMemoryForAttribution)
  {
    uint64_t useDialogMemoryForAttribution = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)useDialogMemoryForAttribution;
  v38[3] = useDialogMemoryForAttribution;
  v37[4] = @"isAppCorrection";
  uint64_t isAppCorrection = (uint64_t)self->_isAppCorrection;
  uint64_t v32 = isAppCorrection;
  if (!isAppCorrection)
  {
    uint64_t isAppCorrection = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)isAppCorrection;
  v38[4] = isAppCorrection;
  v37[5] = @"fallbackUsername";
  uint64_t fallbackUsername = (uint64_t)self->_fallbackUsername;
  uint64_t v31 = fallbackUsername;
  if (!fallbackUsername)
  {
    uint64_t fallbackUsername = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)fallbackUsername;
  v38[5] = fallbackUsername;
  v37[6] = @"wholeHouseAudioMetadata";
  wholeHouseAudioMetadata = self->_wholeHouseAudioMetadata;
  uint64_t v10 = (uint64_t)wholeHouseAudioMetadata;
  if (!wholeHouseAudioMetadata)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v10;
  v38[6] = v10;
  v37[7] = @"nlConfidenceScore";
  nlConfidenceScore = self->_nlConfidenceScore;
  uint64_t v12 = (uint64_t)nlConfidenceScore;
  if (!nlConfidenceScore)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v12;
  v38[7] = v12;
  v37[8] = @"nlConfidenceLevel";
  v13 = [NSNumber numberWithInteger:self->_nlConfidenceLevel];
  v38[8] = v13;
  v37[9] = @"asrConfidenceScore";
  asrConfidenceScore = self->_asrConfidenceScore;
  v15 = asrConfidenceScore;
  if (!asrConfidenceScore)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[9] = v15;
  v37[10] = @"asrConfidenceLevel";
  unint64_t v16 = [NSNumber numberWithInteger:self->_asrConfidenceLevel];
  v38[10] = v16;
  v37[11] = @"resolvedSharedUserID";
  resolvedSharedUserID = self->_resolvedSharedUserID;
  v18 = resolvedSharedUserID;
  if (!resolvedSharedUserID)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[11] = v18;
  v37[12] = @"homeAutomationEntityProvider";
  homeAutomationEntityProvider = self->_homeAutomationEntityProvider;
  unint64_t v20 = homeAutomationEntityProvider;
  if (!homeAutomationEntityProvider)
  {
    unint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[12] = v20;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:13];
  if (homeAutomationEntityProvider)
  {
    if (resolvedSharedUserID) {
      goto LABEL_25;
    }
  }
  else
  {

    if (resolvedSharedUserID) {
      goto LABEL_25;
    }
  }

LABEL_25:
  if (!asrConfidenceScore) {

  }
  if (nlConfidenceScore)
  {
    if (wholeHouseAudioMetadata) {
      goto LABEL_29;
    }
  }
  else
  {

    if (wholeHouseAudioMetadata) {
      goto LABEL_29;
    }
  }

LABEL_29:
  if (!v31) {

  }
  if (!v32) {
  if (!v33)
  }

  if (!v34) {
  if (!v35)
  }

  if (!v36) {

  }
  return v30;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INPrivateMediaIntentData;
  id v6 = [(INPrivateMediaIntentData *)&v11 description];
  v7 = [(INPrivateMediaIntentData *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INPrivateMediaIntentData *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t speakerIDInfo = self->_speakerIDInfo;
  id v5 = a3;
  [v5 encodeObject:speakerIDInfo forKey:@"speakerIDInfo"];
  [v5 encodeObject:self->_proxiedThirdPartyAppInfo forKey:@"proxiedThirdPartyAppInfo"];
  [v5 encodeObject:self->_isAppAttributionRequired forKey:@"isAppAttributionRequired"];
  [v5 encodeObject:self->_useDialogMemoryForAttribution forKey:@"useDialogMemoryForAttribution"];
  [v5 encodeObject:self->_isAppCorrection forKey:@"isAppCorrection"];
  [v5 encodeObject:self->_fallbackUsername forKey:@"fallbackUsername"];
  [v5 encodeObject:self->_wholeHouseAudioMetadata forKey:@"wholeHouseAudioMetadata"];
  [v5 encodeObject:self->_nlConfidenceScore forKey:@"nlConfidenceScore"];
  [v5 encodeInteger:self->_nlConfidenceLevel forKey:@"nlConfidenceLevel"];
  [v5 encodeObject:self->_asrConfidenceScore forKey:@"asrConfidenceScore"];
  [v5 encodeInteger:self->_asrConfidenceLevel forKey:@"asrConfidenceLevel"];
  [v5 encodeObject:self->_resolvedSharedUserID forKey:@"resolvedSharedUserID"];
  [v5 encodeObject:self->_homeAutomationEntityProvider forKey:@"homeAutomationEntityProvider"];
}

- (INPrivateMediaIntentData)initWithCoder:(id)a3
{
  id v3 = a3;
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"speakerIDInfo"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"proxiedThirdPartyAppInfo"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"isAppAttributionRequired"];
  unint64_t v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"useDialogMemoryForAttribution"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"isAppCorrection"];
  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"fallbackUsername"];
  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"wholeHouseAudioMetadata"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"nlConfidenceScore"];
  uint64_t v8 = [v3 decodeIntegerForKey:@"nlConfidenceLevel"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"asrConfidenceScore"];
  uint64_t v10 = [v3 decodeIntegerForKey:@"asrConfidenceLevel"];
  objc_super v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"resolvedSharedUserID"];
  uint64_t v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"homeAutomationEntityProvider"];

  v18 = [(INPrivateMediaIntentData *)self initWithSpeakerIDInfo:v19 proxiedThirdPartyAppInfo:v14 isAppAttributionRequired:v4 useDialogMemoryForAttribution:v16 isAppCorrection:v5 fallbackUsername:v15 wholeHouseAudioMetadata:v6 nlConfidenceScore:v7 nlConfidenceLevel:v8 asrConfidenceScore:v9 asrConfidenceLevel:v10 resolvedSharedUserID:v11 homeAutomationEntityProvider:v12];
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INPrivateMediaIntentData *)a3;
  if (v4 == self)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t speakerIDInfo = self->_speakerIDInfo;
      if (speakerIDInfo != v5->_speakerIDInfo && !-[INSpeakerIDInfo isEqual:](speakerIDInfo, "isEqual:")) {
        goto LABEL_30;
      }
      uint64_t proxiedThirdPartyAppInfo = self->_proxiedThirdPartyAppInfo;
      if (proxiedThirdPartyAppInfo != v5->_proxiedThirdPartyAppInfo
        && !-[INAppIdentifier isEqual:](proxiedThirdPartyAppInfo, "isEqual:"))
      {
        goto LABEL_30;
      }
      uint64_t isAppAttributionRequired = self->_isAppAttributionRequired;
      if (isAppAttributionRequired != v5->_isAppAttributionRequired
        && !-[NSNumber isEqual:](isAppAttributionRequired, "isEqual:"))
      {
        goto LABEL_30;
      }
      uint64_t useDialogMemoryForAttribution = self->_useDialogMemoryForAttribution;
      if (useDialogMemoryForAttribution != v5->_useDialogMemoryForAttribution
        && !-[NSNumber isEqual:](useDialogMemoryForAttribution, "isEqual:"))
      {
        goto LABEL_30;
      }
      if (((uint64_t isAppCorrection = self->_isAppCorrection, isAppCorrection == v5->_isAppCorrection)
         || -[NSNumber isEqual:](isAppCorrection, "isEqual:"))
        && ((uint64_t fallbackUsername = self->_fallbackUsername, fallbackUsername == v5->_fallbackUsername)
         || -[NSString isEqual:](fallbackUsername, "isEqual:"))
        && ((wholeHouseAudioMetadata = self->_wholeHouseAudioMetadata,
             wholeHouseAudioMetadata == v5->_wholeHouseAudioMetadata)
         || -[INWholeHouseAudioMetadata isEqual:](wholeHouseAudioMetadata, "isEqual:"))
        && ((nlConfidenceScore = self->_nlConfidenceScore, nlConfidenceScore == v5->_nlConfidenceScore)
         || -[NSNumber isEqual:](nlConfidenceScore, "isEqual:"))
        && self->_nlConfidenceLevel == v5->_nlConfidenceLevel
        && ((asrConfidenceScore = self->_asrConfidenceScore, asrConfidenceScore == v5->_asrConfidenceScore)
         || -[NSNumber isEqual:](asrConfidenceScore, "isEqual:"))
        && self->_asrConfidenceLevel == v5->_asrConfidenceLevel
        && ((resolvedSharedUserID = self->_resolvedSharedUserID, resolvedSharedUserID == v5->_resolvedSharedUserID)
         || -[NSString isEqual:](resolvedSharedUserID, "isEqual:"))
        && ((homeAutomationEntityProvider = self->_homeAutomationEntityProvider,
             homeAutomationEntityProvider == v5->_homeAutomationEntityProvider)
         || -[INHomeAutomationEntityProvider isEqual:](homeAutomationEntityProvider, "isEqual:")))
      {
        BOOL v17 = 1;
      }
      else
      {
LABEL_30:
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INSpeakerIDInfo *)self->_speakerIDInfo hash];
  unint64_t v4 = [(INAppIdentifier *)self->_proxiedThirdPartyAppInfo hash] ^ v3;
  uint64_t v5 = [(NSNumber *)self->_isAppAttributionRequired hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSNumber *)self->_useDialogMemoryForAttribution hash];
  uint64_t v7 = [(NSNumber *)self->_isAppCorrection hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_fallbackUsername hash];
  unint64_t v9 = v6 ^ v8 ^ [(INWholeHouseAudioMetadata *)self->_wholeHouseAudioMetadata hash];
  uint64_t v10 = [(NSNumber *)self->_nlConfidenceScore hash];
  objc_super v11 = [NSNumber numberWithInteger:self->_nlConfidenceLevel];
  uint64_t v12 = v9 ^ v10 ^ [v11 hash];
  uint64_t v13 = [(NSNumber *)self->_asrConfidenceScore hash];
  v14 = [NSNumber numberWithInteger:self->_asrConfidenceLevel];
  uint64_t v15 = v13 ^ [v14 hash];
  NSUInteger v16 = v12 ^ v15 ^ [(NSString *)self->_resolvedSharedUserID hash];
  unint64_t v17 = v16 ^ [(INHomeAutomationEntityProvider *)self->_homeAutomationEntityProvider hash];

  return v17;
}

- (INPrivateMediaIntentData)initWithSpeakerIDInfo:(id)a3 proxiedThirdPartyAppInfo:(id)a4 isAppAttributionRequired:(id)a5 useDialogMemoryForAttribution:(id)a6 isAppCorrection:(id)a7 fallbackUsername:(id)a8 wholeHouseAudioMetadata:(id)a9 nlConfidenceScore:(id)a10 nlConfidenceLevel:(int64_t)a11 asrConfidenceScore:(id)a12 asrConfidenceLevel:(int64_t)a13 resolvedSharedUserID:(id)a14 homeAutomationEntityProvider:(id)a15
{
  id v20 = a3;
  id v21 = a4;
  id v55 = a5;
  id v54 = a6;
  id v53 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a12;
  id v26 = a14;
  id v27 = a15;
  v56.receiver = self;
  v56.super_class = (Class)INPrivateMediaIntentData;
  v28 = [(INPrivateMediaIntentData *)&v56 init];
  if (v28)
  {
    uint64_t v29 = [v20 copy];
    uint64_t speakerIDInfo = v28->_speakerIDInfo;
    v28->_uint64_t speakerIDInfo = (INSpeakerIDInfo *)v29;

    uint64_t v31 = [v21 copy];
    uint64_t proxiedThirdPartyAppInfo = v28->_proxiedThirdPartyAppInfo;
    v28->_uint64_t proxiedThirdPartyAppInfo = (INAppIdentifier *)v31;

    uint64_t v33 = [v55 copy];
    uint64_t isAppAttributionRequired = v28->_isAppAttributionRequired;
    v28->_uint64_t isAppAttributionRequired = (NSNumber *)v33;

    uint64_t v35 = [v54 copy];
    uint64_t useDialogMemoryForAttribution = v28->_useDialogMemoryForAttribution;
    v28->_uint64_t useDialogMemoryForAttribution = (NSNumber *)v35;

    uint64_t v37 = [v53 copy];
    uint64_t isAppCorrection = v28->_isAppCorrection;
    v28->_uint64_t isAppCorrection = (NSNumber *)v37;

    uint64_t v39 = [v22 copy];
    uint64_t fallbackUsername = v28->_fallbackUsername;
    v28->_uint64_t fallbackUsername = (NSString *)v39;

    uint64_t v41 = [v23 copy];
    wholeHouseAudioMetadata = v28->_wholeHouseAudioMetadata;
    v28->_wholeHouseAudioMetadata = (INWholeHouseAudioMetadata *)v41;

    uint64_t v43 = [v24 copy];
    nlConfidenceScore = v28->_nlConfidenceScore;
    v28->_nlConfidenceScore = (NSNumber *)v43;

    v28->_nlConfidenceLevel = a11;
    uint64_t v45 = [v25 copy];
    asrConfidenceScore = v28->_asrConfidenceScore;
    v28->_asrConfidenceScore = (NSNumber *)v45;

    v28->_asrConfidenceLevel = a13;
    uint64_t v47 = [v26 copy];
    resolvedSharedUserID = v28->_resolvedSharedUserID;
    v28->_resolvedSharedUserID = (NSString *)v47;

    uint64_t v49 = [v27 copy];
    homeAutomationEntityProvider = v28->_homeAutomationEntityProvider;
    v28->_homeAutomationEntityProvider = (INHomeAutomationEntityProvider *)v49;
  }
  return v28;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v32 = (objc_class *)a1;
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v8 objectForKeyedSubscript:@"speakerIDInfo"];
    v38 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [v8 objectForKeyedSubscript:@"proxiedThirdPartyAppInfo"];
    uint64_t v37 = [v7 decodeObjectOfClass:v11 from:v12];

    uint64_t v36 = [v8 objectForKeyedSubscript:@"isAppAttributionRequired"];
    uint64_t v35 = [v8 objectForKeyedSubscript:@"useDialogMemoryForAttribution"];
    uint64_t v34 = [v8 objectForKeyedSubscript:@"isAppCorrection"];
    uint64_t v13 = objc_opt_class();
    v14 = [v8 objectForKeyedSubscript:@"fallbackUsername"];
    uint64_t v33 = [v7 decodeObjectOfClass:v13 from:v14];

    uint64_t v15 = objc_opt_class();
    NSUInteger v16 = [v8 objectForKeyedSubscript:@"wholeHouseAudioMetadata"];
    id v30 = [v7 decodeObjectOfClass:v15 from:v16];

    uint64_t v31 = [v8 objectForKeyedSubscript:@"nlConfidenceScore"];
    unint64_t v17 = [v8 objectForKeyedSubscript:@"nlConfidenceLevel"];
    uint64_t v18 = INMediaConfidenceLevelWithString(v17);

    uint64_t v29 = [v8 objectForKeyedSubscript:@"asrConfidenceScore"];
    v19 = [v8 objectForKeyedSubscript:@"asrConfidenceLevel"];
    uint64_t v20 = INMediaConfidenceLevelWithString(v19);

    uint64_t v21 = objc_opt_class();
    id v22 = [v8 objectForKeyedSubscript:@"resolvedSharedUserID"];
    id v23 = [v7 decodeObjectOfClass:v21 from:v22];

    uint64_t v24 = objc_opt_class();
    id v25 = [v8 objectForKeyedSubscript:@"homeAutomationEntityProvider"];
    id v26 = [v7 decodeObjectOfClass:v24 from:v25];

    id v27 = (void *)[[v32 alloc] initWithSpeakerIDInfo:v38 proxiedThirdPartyAppInfo:v37 isAppAttributionRequired:v36 useDialogMemoryForAttribution:v35 isAppCorrection:v34 fallbackUsername:v33 wholeHouseAudioMetadata:v30 nlConfidenceScore:v31 nlConfidenceLevel:v18 asrConfidenceScore:v29 asrConfidenceLevel:v20 resolvedSharedUserID:v23 homeAutomationEntityProvider:v26];
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end