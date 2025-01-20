@interface _INPBPrivateMediaIntentData
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAsrConfidenceLevel;
- (BOOL)hasAsrConfidenceScore;
- (BOOL)hasFallbackUsername;
- (BOOL)hasHomeAutomationEntityProvider;
- (BOOL)hasIsAppAttributionRequired;
- (BOOL)hasIsAppCorrection;
- (BOOL)hasNlConfidenceLevel;
- (BOOL)hasNlConfidenceScore;
- (BOOL)hasProxiedThirdPartyAppInfo;
- (BOOL)hasResolvedSharedUserID;
- (BOOL)hasSpeakerIDInfo;
- (BOOL)hasUseDialogMemoryForAttribution;
- (BOOL)hasWholeHouseAudioMetadata;
- (BOOL)isAppAttributionRequired;
- (BOOL)isAppCorrection;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)useDialogMemoryForAttribution;
- (_INPBAppIdentifier)proxiedThirdPartyAppInfo;
- (_INPBHomeAutomationEntityProvider)homeAutomationEntityProvider;
- (_INPBPrivateMediaIntentData)initWithCoder:(id)a3;
- (_INPBSpeakerIDInfo)speakerIDInfo;
- (_INPBString)fallbackUsername;
- (_INPBString)resolvedSharedUserID;
- (_INPBWholeHouseAudioMetadata)wholeHouseAudioMetadata;
- (float)asrConfidenceScore;
- (float)nlConfidenceScore;
- (id)asrConfidenceLevelAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)nlConfidenceLevelAsString:(int)a3;
- (int)StringAsAsrConfidenceLevel:(id)a3;
- (int)StringAsNlConfidenceLevel:(id)a3;
- (int)asrConfidenceLevel;
- (int)nlConfidenceLevel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAsrConfidenceLevel:(int)a3;
- (void)setAsrConfidenceScore:(float)a3;
- (void)setFallbackUsername:(id)a3;
- (void)setHasAsrConfidenceLevel:(BOOL)a3;
- (void)setHasAsrConfidenceScore:(BOOL)a3;
- (void)setHasIsAppAttributionRequired:(BOOL)a3;
- (void)setHasIsAppCorrection:(BOOL)a3;
- (void)setHasNlConfidenceLevel:(BOOL)a3;
- (void)setHasNlConfidenceScore:(BOOL)a3;
- (void)setHasUseDialogMemoryForAttribution:(BOOL)a3;
- (void)setHomeAutomationEntityProvider:(id)a3;
- (void)setIsAppAttributionRequired:(BOOL)a3;
- (void)setIsAppCorrection:(BOOL)a3;
- (void)setNlConfidenceLevel:(int)a3;
- (void)setNlConfidenceScore:(float)a3;
- (void)setProxiedThirdPartyAppInfo:(id)a3;
- (void)setResolvedSharedUserID:(id)a3;
- (void)setSpeakerIDInfo:(id)a3;
- (void)setUseDialogMemoryForAttribution:(BOOL)a3;
- (void)setWholeHouseAudioMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPrivateMediaIntentData

- (BOOL)hasIsAppAttributionRequired
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsAppAttributionRequired:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isAppAttributionRequired = a3;
}

- (int)StringAsNlConfidenceLevel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CONFIDENCE_LEVEL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOW"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MEDIUM"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"HIGH"])
  {
    int v4 = 30;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wholeHouseAudioMetadata, 0);
  objc_storeStrong((id *)&self->_speakerIDInfo, 0);
  objc_storeStrong((id *)&self->_resolvedSharedUserID, 0);
  objc_storeStrong((id *)&self->_proxiedThirdPartyAppInfo, 0);
  objc_storeStrong((id *)&self->_homeAutomationEntityProvider, 0);

  objc_storeStrong((id *)&self->_fallbackUsername, 0);
}

- (_INPBWholeHouseAudioMetadata)wholeHouseAudioMetadata
{
  return self->_wholeHouseAudioMetadata;
}

- (BOOL)useDialogMemoryForAttribution
{
  return self->_useDialogMemoryForAttribution;
}

- (_INPBSpeakerIDInfo)speakerIDInfo
{
  return self->_speakerIDInfo;
}

- (_INPBString)resolvedSharedUserID
{
  return self->_resolvedSharedUserID;
}

- (_INPBAppIdentifier)proxiedThirdPartyAppInfo
{
  return self->_proxiedThirdPartyAppInfo;
}

- (float)nlConfidenceScore
{
  return self->_nlConfidenceScore;
}

- (int)nlConfidenceLevel
{
  return self->_nlConfidenceLevel;
}

- (BOOL)isAppCorrection
{
  return self->_isAppCorrection;
}

- (BOOL)isAppAttributionRequired
{
  return self->_isAppAttributionRequired;
}

- (_INPBHomeAutomationEntityProvider)homeAutomationEntityProvider
{
  return self->_homeAutomationEntityProvider;
}

- (_INPBString)fallbackUsername
{
  return self->_fallbackUsername;
}

- (float)asrConfidenceScore
{
  return self->_asrConfidenceScore;
}

- (int)asrConfidenceLevel
{
  return self->_asrConfidenceLevel;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBPrivateMediaIntentData *)self hasAsrConfidenceLevel])
  {
    uint64_t v4 = [(_INPBPrivateMediaIntentData *)self asrConfidenceLevel];
    if ((int)v4 > 19)
    {
      if (v4 == 20)
      {
        v5 = @"MEDIUM";
        goto LABEL_12;
      }
      if (v4 == 30)
      {
        v5 = @"HIGH";
        goto LABEL_12;
      }
    }
    else
    {
      if (!v4)
      {
        v5 = @"UNKNOWN_CONFIDENCE_LEVEL";
        goto LABEL_12;
      }
      if (v4 == 10)
      {
        v5 = @"LOW";
LABEL_12:
        [v3 setObject:v5 forKeyedSubscript:@"asrConfidenceLevel"];

        goto LABEL_13;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_13:
  if ([(_INPBPrivateMediaIntentData *)self hasAsrConfidenceScore])
  {
    v6 = NSNumber;
    [(_INPBPrivateMediaIntentData *)self asrConfidenceScore];
    v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"asrConfidenceScore"];
  }
  v8 = [(_INPBPrivateMediaIntentData *)self fallbackUsername];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"fallbackUsername"];

  v10 = [(_INPBPrivateMediaIntentData *)self homeAutomationEntityProvider];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"homeAutomationEntityProvider"];

  if ([(_INPBPrivateMediaIntentData *)self hasIsAppAttributionRequired])
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivateMediaIntentData isAppAttributionRequired](self, "isAppAttributionRequired"));
    [v3 setObject:v12 forKeyedSubscript:@"isAppAttributionRequired"];
  }
  if ([(_INPBPrivateMediaIntentData *)self hasIsAppCorrection])
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivateMediaIntentData isAppCorrection](self, "isAppCorrection"));
    [v3 setObject:v13 forKeyedSubscript:@"isAppCorrection"];
  }
  if ([(_INPBPrivateMediaIntentData *)self hasNlConfidenceLevel])
  {
    uint64_t v14 = [(_INPBPrivateMediaIntentData *)self nlConfidenceLevel];
    if ((int)v14 > 19)
    {
      if (v14 == 20)
      {
        v15 = @"MEDIUM";
        goto LABEL_30;
      }
      if (v14 == 30)
      {
        v15 = @"HIGH";
        goto LABEL_30;
      }
    }
    else
    {
      if (!v14)
      {
        v15 = @"UNKNOWN_CONFIDENCE_LEVEL";
        goto LABEL_30;
      }
      if (v14 == 10)
      {
        v15 = @"LOW";
LABEL_30:
        [v3 setObject:v15 forKeyedSubscript:@"nlConfidenceLevel"];

        goto LABEL_31;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
LABEL_31:
  if ([(_INPBPrivateMediaIntentData *)self hasNlConfidenceScore])
  {
    v16 = NSNumber;
    [(_INPBPrivateMediaIntentData *)self nlConfidenceScore];
    v17 = objc_msgSend(v16, "numberWithFloat:");
    [v3 setObject:v17 forKeyedSubscript:@"nlConfidenceScore"];
  }
  v18 = [(_INPBPrivateMediaIntentData *)self proxiedThirdPartyAppInfo];
  v19 = [v18 dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"proxiedThirdPartyAppInfo"];

  v20 = [(_INPBPrivateMediaIntentData *)self resolvedSharedUserID];
  v21 = [v20 dictionaryRepresentation];
  [v3 setObject:v21 forKeyedSubscript:@"resolvedSharedUserID"];

  v22 = [(_INPBPrivateMediaIntentData *)self speakerIDInfo];
  v23 = [v22 dictionaryRepresentation];
  [v3 setObject:v23 forKeyedSubscript:@"speakerIDInfo"];

  if ([(_INPBPrivateMediaIntentData *)self hasUseDialogMemoryForAttribution])
  {
    v24 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivateMediaIntentData useDialogMemoryForAttribution](self, "useDialogMemoryForAttribution"));
    [v3 setObject:v24 forKeyedSubscript:@"useDialogMemoryForAttribution"];
  }
  v25 = [(_INPBPrivateMediaIntentData *)self wholeHouseAudioMetadata];
  v26 = [v25 dictionaryRepresentation];
  [v3 setObject:v26 forKeyedSubscript:@"wholeHouseAudioMetadata"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBPrivateMediaIntentData *)self hasAsrConfidenceLevel]) {
    uint64_t v3 = 2654435761 * self->_asrConfidenceLevel;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBPrivateMediaIntentData *)self hasAsrConfidenceScore])
  {
    float asrConfidenceScore = self->_asrConfidenceScore;
    double v5 = asrConfidenceScore;
    if (asrConfidenceScore < 0.0) {
      double v5 = -asrConfidenceScore;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    double v8 = fmod(v6, 1.84467441e19);
    unint64_t v9 = 2654435761u * (unint64_t)v8;
    unint64_t v10 = v9 + (unint64_t)v7;
    if (v7 <= 0.0) {
      unint64_t v10 = 2654435761u * (unint64_t)v8;
    }
    unint64_t v11 = v9 - (unint64_t)fabs(v7);
    if (v7 < 0.0) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v10;
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  unint64_t v13 = [(_INPBString *)self->_fallbackUsername hash];
  unint64_t v14 = [(_INPBHomeAutomationEntityProvider *)self->_homeAutomationEntityProvider hash];
  if ([(_INPBPrivateMediaIntentData *)self hasIsAppAttributionRequired]) {
    uint64_t v15 = 2654435761 * self->_isAppAttributionRequired;
  }
  else {
    uint64_t v15 = 0;
  }
  if ([(_INPBPrivateMediaIntentData *)self hasIsAppCorrection]) {
    uint64_t v29 = 2654435761 * self->_isAppCorrection;
  }
  else {
    uint64_t v29 = 0;
  }
  if ([(_INPBPrivateMediaIntentData *)self hasNlConfidenceLevel]) {
    BOOL v16 = [(_INPBPrivateMediaIntentData *)self hasNlConfidenceScore];
  }
  else {
    BOOL v16 = [(_INPBPrivateMediaIntentData *)self hasNlConfidenceScore];
  }
  if (v16)
  {
    float nlConfidenceScore = self->_nlConfidenceScore;
    double v18 = nlConfidenceScore;
    if (nlConfidenceScore < 0.0) {
      double v18 = -nlConfidenceScore;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v21 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    unint64_t v22 = v14;
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v21 += (unint64_t)v20;
      }
    }
    else
    {
      v21 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v22 = v14;
    unint64_t v21 = 0;
  }
  unint64_t v23 = [(_INPBAppIdentifier *)self->_proxiedThirdPartyAppInfo hash];
  unint64_t v24 = [(_INPBString *)self->_resolvedSharedUserID hash];
  unint64_t v25 = [(_INPBSpeakerIDInfo *)self->_speakerIDInfo hash];
  if ([(_INPBPrivateMediaIntentData *)self hasUseDialogMemoryForAttribution]) {
    uint64_t v26 = 2654435761 * self->_useDialogMemoryForAttribution;
  }
  else {
    uint64_t v26 = 0;
  }
  return v12 ^ v3 ^ v13 ^ v22 ^ v15 ^ v29 ^ v28 ^ v21 ^ v23 ^ v24 ^ v25 ^ v26 ^ [(_INPBWholeHouseAudioMetadata *)self->_wholeHouseAudioMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_60;
  }
  int v5 = [(_INPBPrivateMediaIntentData *)self hasAsrConfidenceLevel];
  if (v5 != [v4 hasAsrConfidenceLevel]) {
    goto LABEL_60;
  }
  if ([(_INPBPrivateMediaIntentData *)self hasAsrConfidenceLevel])
  {
    if ([v4 hasAsrConfidenceLevel])
    {
      int asrConfidenceLevel = self->_asrConfidenceLevel;
      if (asrConfidenceLevel != [v4 asrConfidenceLevel]) {
        goto LABEL_60;
      }
    }
  }
  int v7 = [(_INPBPrivateMediaIntentData *)self hasAsrConfidenceScore];
  if (v7 != [v4 hasAsrConfidenceScore]) {
    goto LABEL_60;
  }
  if ([(_INPBPrivateMediaIntentData *)self hasAsrConfidenceScore])
  {
    if ([v4 hasAsrConfidenceScore])
    {
      float asrConfidenceScore = self->_asrConfidenceScore;
      [v4 asrConfidenceScore];
      if (asrConfidenceScore != v9) {
        goto LABEL_60;
      }
    }
  }
  unint64_t v10 = [(_INPBPrivateMediaIntentData *)self fallbackUsername];
  unint64_t v11 = [v4 fallbackUsername];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_59;
  }
  uint64_t v12 = [(_INPBPrivateMediaIntentData *)self fallbackUsername];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(_INPBPrivateMediaIntentData *)self fallbackUsername];
    uint64_t v15 = [v4 fallbackUsername];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_60;
    }
  }
  else
  {
  }
  unint64_t v10 = [(_INPBPrivateMediaIntentData *)self homeAutomationEntityProvider];
  unint64_t v11 = [v4 homeAutomationEntityProvider];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_59;
  }
  uint64_t v17 = [(_INPBPrivateMediaIntentData *)self homeAutomationEntityProvider];
  if (v17)
  {
    double v18 = (void *)v17;
    long double v19 = [(_INPBPrivateMediaIntentData *)self homeAutomationEntityProvider];
    double v20 = [v4 homeAutomationEntityProvider];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_60;
    }
  }
  else
  {
  }
  int v22 = [(_INPBPrivateMediaIntentData *)self hasIsAppAttributionRequired];
  if (v22 != [v4 hasIsAppAttributionRequired]) {
    goto LABEL_60;
  }
  if ([(_INPBPrivateMediaIntentData *)self hasIsAppAttributionRequired])
  {
    if ([v4 hasIsAppAttributionRequired])
    {
      int isAppAttributionRequired = self->_isAppAttributionRequired;
      if (isAppAttributionRequired != [v4 isAppAttributionRequired]) {
        goto LABEL_60;
      }
    }
  }
  int v24 = [(_INPBPrivateMediaIntentData *)self hasIsAppCorrection];
  if (v24 != [v4 hasIsAppCorrection]) {
    goto LABEL_60;
  }
  if ([(_INPBPrivateMediaIntentData *)self hasIsAppCorrection])
  {
    if ([v4 hasIsAppCorrection])
    {
      int isAppCorrection = self->_isAppCorrection;
      if (isAppCorrection != [v4 isAppCorrection]) {
        goto LABEL_60;
      }
    }
  }
  int v26 = [(_INPBPrivateMediaIntentData *)self hasNlConfidenceLevel];
  if (v26 != [v4 hasNlConfidenceLevel]) {
    goto LABEL_60;
  }
  if ([(_INPBPrivateMediaIntentData *)self hasNlConfidenceLevel])
  {
    if ([v4 hasNlConfidenceLevel])
    {
      int nlConfidenceLevel = self->_nlConfidenceLevel;
      if (nlConfidenceLevel != [v4 nlConfidenceLevel]) {
        goto LABEL_60;
      }
    }
  }
  int v28 = [(_INPBPrivateMediaIntentData *)self hasNlConfidenceScore];
  if (v28 != [v4 hasNlConfidenceScore]) {
    goto LABEL_60;
  }
  if ([(_INPBPrivateMediaIntentData *)self hasNlConfidenceScore])
  {
    if ([v4 hasNlConfidenceScore])
    {
      float nlConfidenceScore = self->_nlConfidenceScore;
      [v4 nlConfidenceScore];
      if (nlConfidenceScore != v30) {
        goto LABEL_60;
      }
    }
  }
  unint64_t v10 = [(_INPBPrivateMediaIntentData *)self proxiedThirdPartyAppInfo];
  unint64_t v11 = [v4 proxiedThirdPartyAppInfo];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_59;
  }
  uint64_t v31 = [(_INPBPrivateMediaIntentData *)self proxiedThirdPartyAppInfo];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_INPBPrivateMediaIntentData *)self proxiedThirdPartyAppInfo];
    v34 = [v4 proxiedThirdPartyAppInfo];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_60;
    }
  }
  else
  {
  }
  unint64_t v10 = [(_INPBPrivateMediaIntentData *)self resolvedSharedUserID];
  unint64_t v11 = [v4 resolvedSharedUserID];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_59;
  }
  uint64_t v36 = [(_INPBPrivateMediaIntentData *)self resolvedSharedUserID];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(_INPBPrivateMediaIntentData *)self resolvedSharedUserID];
    v39 = [v4 resolvedSharedUserID];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_60;
    }
  }
  else
  {
  }
  unint64_t v10 = [(_INPBPrivateMediaIntentData *)self speakerIDInfo];
  unint64_t v11 = [v4 speakerIDInfo];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_59;
  }
  uint64_t v41 = [(_INPBPrivateMediaIntentData *)self speakerIDInfo];
  if (v41)
  {
    v42 = (void *)v41;
    v43 = [(_INPBPrivateMediaIntentData *)self speakerIDInfo];
    v44 = [v4 speakerIDInfo];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_60;
    }
  }
  else
  {
  }
  int v46 = [(_INPBPrivateMediaIntentData *)self hasUseDialogMemoryForAttribution];
  if (v46 != [v4 hasUseDialogMemoryForAttribution]) {
    goto LABEL_60;
  }
  if ([(_INPBPrivateMediaIntentData *)self hasUseDialogMemoryForAttribution])
  {
    if ([v4 hasUseDialogMemoryForAttribution])
    {
      int useDialogMemoryForAttribution = self->_useDialogMemoryForAttribution;
      if (useDialogMemoryForAttribution != [v4 useDialogMemoryForAttribution]) {
        goto LABEL_60;
      }
    }
  }
  unint64_t v10 = [(_INPBPrivateMediaIntentData *)self wholeHouseAudioMetadata];
  unint64_t v11 = [v4 wholeHouseAudioMetadata];
  if ((v10 == 0) != (v11 != 0))
  {
    uint64_t v48 = [(_INPBPrivateMediaIntentData *)self wholeHouseAudioMetadata];
    if (!v48)
    {

LABEL_63:
      BOOL v53 = 1;
      goto LABEL_61;
    }
    v49 = (void *)v48;
    v50 = [(_INPBPrivateMediaIntentData *)self wholeHouseAudioMetadata];
    v51 = [v4 wholeHouseAudioMetadata];
    char v52 = [v50 isEqual:v51];

    if (v52) {
      goto LABEL_63;
    }
  }
  else
  {
LABEL_59:
  }
LABEL_60:
  BOOL v53 = 0;
LABEL_61:

  return v53;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBPrivateMediaIntentData allocWithZone:](_INPBPrivateMediaIntentData, "allocWithZone:") init];
  if ([(_INPBPrivateMediaIntentData *)self hasAsrConfidenceLevel]) {
    [(_INPBPrivateMediaIntentData *)v5 setAsrConfidenceLevel:[(_INPBPrivateMediaIntentData *)self asrConfidenceLevel]];
  }
  if ([(_INPBPrivateMediaIntentData *)self hasAsrConfidenceScore])
  {
    [(_INPBPrivateMediaIntentData *)self asrConfidenceScore];
    -[_INPBPrivateMediaIntentData setAsrConfidenceScore:](v5, "setAsrConfidenceScore:");
  }
  id v6 = [(_INPBString *)self->_fallbackUsername copyWithZone:a3];
  [(_INPBPrivateMediaIntentData *)v5 setFallbackUsername:v6];

  id v7 = [(_INPBHomeAutomationEntityProvider *)self->_homeAutomationEntityProvider copyWithZone:a3];
  [(_INPBPrivateMediaIntentData *)v5 setHomeAutomationEntityProvider:v7];

  if ([(_INPBPrivateMediaIntentData *)self hasIsAppAttributionRequired]) {
    [(_INPBPrivateMediaIntentData *)v5 setIsAppAttributionRequired:[(_INPBPrivateMediaIntentData *)self isAppAttributionRequired]];
  }
  if ([(_INPBPrivateMediaIntentData *)self hasIsAppCorrection]) {
    [(_INPBPrivateMediaIntentData *)v5 setIsAppCorrection:[(_INPBPrivateMediaIntentData *)self isAppCorrection]];
  }
  if ([(_INPBPrivateMediaIntentData *)self hasNlConfidenceLevel]) {
    [(_INPBPrivateMediaIntentData *)v5 setNlConfidenceLevel:[(_INPBPrivateMediaIntentData *)self nlConfidenceLevel]];
  }
  if ([(_INPBPrivateMediaIntentData *)self hasNlConfidenceScore])
  {
    [(_INPBPrivateMediaIntentData *)self nlConfidenceScore];
    -[_INPBPrivateMediaIntentData setNlConfidenceScore:](v5, "setNlConfidenceScore:");
  }
  id v8 = [(_INPBAppIdentifier *)self->_proxiedThirdPartyAppInfo copyWithZone:a3];
  [(_INPBPrivateMediaIntentData *)v5 setProxiedThirdPartyAppInfo:v8];

  id v9 = [(_INPBString *)self->_resolvedSharedUserID copyWithZone:a3];
  [(_INPBPrivateMediaIntentData *)v5 setResolvedSharedUserID:v9];

  id v10 = [(_INPBSpeakerIDInfo *)self->_speakerIDInfo copyWithZone:a3];
  [(_INPBPrivateMediaIntentData *)v5 setSpeakerIDInfo:v10];

  if ([(_INPBPrivateMediaIntentData *)self hasUseDialogMemoryForAttribution]) {
    [(_INPBPrivateMediaIntentData *)v5 setUseDialogMemoryForAttribution:[(_INPBPrivateMediaIntentData *)self useDialogMemoryForAttribution]];
  }
  id v11 = [(_INPBWholeHouseAudioMetadata *)self->_wholeHouseAudioMetadata copyWithZone:a3];
  [(_INPBPrivateMediaIntentData *)v5 setWholeHouseAudioMetadata:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPrivateMediaIntentData *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPrivateMediaIntentData)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPrivateMediaIntentData *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPrivateMediaIntentData *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPrivateMediaIntentData *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v17 = a3;
  if ([(_INPBPrivateMediaIntentData *)self hasAsrConfidenceLevel]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPrivateMediaIntentData *)self hasAsrConfidenceScore]) {
    PBDataWriterWriteFloatField();
  }
  id v4 = [(_INPBPrivateMediaIntentData *)self fallbackUsername];

  if (v4)
  {
    int v5 = [(_INPBPrivateMediaIntentData *)self fallbackUsername];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBPrivateMediaIntentData *)self homeAutomationEntityProvider];

  if (v6)
  {
    uint64_t v7 = [(_INPBPrivateMediaIntentData *)self homeAutomationEntityProvider];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBPrivateMediaIntentData *)self hasIsAppAttributionRequired]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBPrivateMediaIntentData *)self hasIsAppCorrection]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBPrivateMediaIntentData *)self hasNlConfidenceLevel]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPrivateMediaIntentData *)self hasNlConfidenceScore]) {
    PBDataWriterWriteFloatField();
  }
  id v8 = [(_INPBPrivateMediaIntentData *)self proxiedThirdPartyAppInfo];

  if (v8)
  {
    id v9 = [(_INPBPrivateMediaIntentData *)self proxiedThirdPartyAppInfo];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBPrivateMediaIntentData *)self resolvedSharedUserID];

  if (v10)
  {
    id v11 = [(_INPBPrivateMediaIntentData *)self resolvedSharedUserID];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBPrivateMediaIntentData *)self speakerIDInfo];

  if (v12)
  {
    unint64_t v13 = [(_INPBPrivateMediaIntentData *)self speakerIDInfo];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBPrivateMediaIntentData *)self hasUseDialogMemoryForAttribution]) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v14 = [(_INPBPrivateMediaIntentData *)self wholeHouseAudioMetadata];

  uint64_t v15 = v17;
  if (v14)
  {
    int v16 = [(_INPBPrivateMediaIntentData *)self wholeHouseAudioMetadata];
    PBDataWriterWriteSubmessage();

    uint64_t v15 = v17;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPrivateMediaIntentDataReadFrom(self, (uint64_t)a3, v3);
}

- (BOOL)hasWholeHouseAudioMetadata
{
  return self->_wholeHouseAudioMetadata != 0;
}

- (void)setWholeHouseAudioMetadata:(id)a3
{
}

- (void)setHasUseDialogMemoryForAttribution:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasUseDialogMemoryForAttribution
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setUseDialogMemoryForAttribution:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_int useDialogMemoryForAttribution = a3;
}

- (BOOL)hasSpeakerIDInfo
{
  return self->_speakerIDInfo != 0;
}

- (void)setSpeakerIDInfo:(id)a3
{
}

- (BOOL)hasResolvedSharedUserID
{
  return self->_resolvedSharedUserID != 0;
}

- (void)setResolvedSharedUserID:(id)a3
{
}

- (BOOL)hasProxiedThirdPartyAppInfo
{
  return self->_proxiedThirdPartyAppInfo != 0;
}

- (void)setProxiedThirdPartyAppInfo:(id)a3
{
}

- (void)setHasNlConfidenceScore:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNlConfidenceScore
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNlConfidenceScore:(float)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_float nlConfidenceScore = a3;
}

- (id)nlConfidenceLevelAsString:(int)a3
{
  if (a3 > 19)
  {
    if (a3 == 20)
    {
      id v4 = @"MEDIUM";
    }
    else
    {
      if (a3 != 30)
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      id v4 = @"HIGH";
    }
  }
  else
  {
    if (a3)
    {
      if (a3 == 10)
      {
        id v4 = @"LOW";
        return v4;
      }
      goto LABEL_12;
    }
    id v4 = @"UNKNOWN_CONFIDENCE_LEVEL";
  }
  return v4;
}

- (void)setHasNlConfidenceLevel:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNlConfidenceLevel
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setNlConfidenceLevel:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xEF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x10;
    self->_int nlConfidenceLevel = a3;
  }
}

- (void)setHasIsAppCorrection:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsAppCorrection
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsAppCorrection:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isAppCorrection = a3;
}

- (void)setHasIsAppAttributionRequired:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHomeAutomationEntityProvider
{
  return self->_homeAutomationEntityProvider != 0;
}

- (void)setHomeAutomationEntityProvider:(id)a3
{
}

- (BOOL)hasFallbackUsername
{
  return self->_fallbackUsername != 0;
}

- (void)setFallbackUsername:(id)a3
{
}

- (void)setHasAsrConfidenceScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAsrConfidenceScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAsrConfidenceScore:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float asrConfidenceScore = a3;
}

- (int)StringAsAsrConfidenceLevel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CONFIDENCE_LEVEL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOW"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MEDIUM"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"HIGH"])
  {
    int v4 = 30;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)asrConfidenceLevelAsString:(int)a3
{
  if (a3 > 19)
  {
    if (a3 == 20)
    {
      int v4 = @"MEDIUM";
    }
    else
    {
      if (a3 != 30)
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      int v4 = @"HIGH";
    }
  }
  else
  {
    if (a3)
    {
      if (a3 == 10)
      {
        int v4 = @"LOW";
        return v4;
      }
      goto LABEL_12;
    }
    int v4 = @"UNKNOWN_CONFIDENCE_LEVEL";
  }
  return v4;
}

- (void)setHasAsrConfidenceLevel:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAsrConfidenceLevel
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAsrConfidenceLevel:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int asrConfidenceLevel = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end