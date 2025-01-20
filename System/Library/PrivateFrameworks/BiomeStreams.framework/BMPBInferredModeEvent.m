@interface BMPBInferredModeEvent
+ (Class)serializedTriggersType;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasConfidenceScore;
- (BOOL)hasIsAutomationEnabled;
- (BOOL)hasIsStart;
- (BOOL)hasModeIdentifier;
- (BOOL)hasModeType;
- (BOOL)hasOrigin;
- (BOOL)hasOriginAnchorType;
- (BOOL)hasOriginBundleId;
- (BOOL)hasShouldSuggestTriggers;
- (BOOL)hasUiLocation;
- (BOOL)hasUserModeName;
- (BOOL)hasUuid;
- (BOOL)isAutomationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStart;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldSuggestTriggers;
- (NSMutableArray)serializedTriggers;
- (NSString)modeIdentifier;
- (NSString)originAnchorType;
- (NSString)originBundleId;
- (NSString)userModeName;
- (NSString)uuid;
- (double)absoluteTimestamp;
- (double)confidenceScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)modeTypeAsString:(int)a3;
- (id)originAsString:(int)a3;
- (id)serializedTriggersAtIndex:(unint64_t)a3;
- (int)StringAsModeType:(id)a3;
- (int)StringAsOrigin:(id)a3;
- (int)modeType;
- (int)origin;
- (unint64_t)hash;
- (unint64_t)serializedTriggersCount;
- (unint64_t)uiLocation;
- (void)addSerializedTriggers:(id)a3;
- (void)clearSerializedTriggers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setConfidenceScore:(double)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasConfidenceScore:(BOOL)a3;
- (void)setHasIsAutomationEnabled:(BOOL)a3;
- (void)setHasIsStart:(BOOL)a3;
- (void)setHasModeType:(BOOL)a3;
- (void)setHasOrigin:(BOOL)a3;
- (void)setHasShouldSuggestTriggers:(BOOL)a3;
- (void)setHasUiLocation:(BOOL)a3;
- (void)setIsAutomationEnabled:(BOOL)a3;
- (void)setIsStart:(BOOL)a3;
- (void)setModeIdentifier:(id)a3;
- (void)setModeType:(int)a3;
- (void)setOrigin:(int)a3;
- (void)setOriginAnchorType:(id)a3;
- (void)setOriginBundleId:(id)a3;
- (void)setSerializedTriggers:(id)a3;
- (void)setShouldSuggestTriggers:(BOOL)a3;
- (void)setUiLocation:(unint64_t)a3;
- (void)setUserModeName:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBInferredModeEvent

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasModeIdentifier
{
  return self->_modeIdentifier != 0;
}

- (int)origin
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_origin;
  }
  else {
    return -1;
  }
}

- (void)setOrigin:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOrigin
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)originAsString:(int)a3
{
  if ((a3 + 1) >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D69B0[a3 + 1];
  }

  return v3;
}

- (int)StringAsOrigin:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CoreMotion"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CarPlay"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DNDWD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CoreRoutine"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Sleep"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"AppLaunch"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"WatchWorkout"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"WFHClassifier"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Calendar"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"AnchorModel"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"AppLaunchModel"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ScreenShare"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ScreenRecording"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"GameControllerConnected"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"POI"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"BacklightData"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (BOOL)hasOriginBundleId
{
  return self->_originBundleId != 0;
}

- (void)setIsAutomationEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isAutomationEnabled = a3;
}

- (void)setHasIsAutomationEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsAutomationEnabled
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsStart:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isStart = a3;
}

- (void)setHasIsStart:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsStart
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasOriginAnchorType
{
  return self->_originAnchorType != 0;
}

- (void)setUiLocation:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uiLocation = a3;
}

- (void)setHasUiLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUiLocation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setConfidenceScore:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_confidenceScore = a3;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConfidenceScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearSerializedTriggers
{
}

- (void)addSerializedTriggers:(id)a3
{
  id v4 = a3;
  serializedTriggers = self->_serializedTriggers;
  id v8 = v4;
  if (!serializedTriggers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_serializedTriggers;
    self->_serializedTriggers = v6;

    id v4 = v8;
    serializedTriggers = self->_serializedTriggers;
  }
  [(NSMutableArray *)serializedTriggers addObject:v4];
}

- (unint64_t)serializedTriggersCount
{
  return [(NSMutableArray *)self->_serializedTriggers count];
}

- (id)serializedTriggersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_serializedTriggers objectAtIndex:a3];
}

+ (Class)serializedTriggersType
{
  return (Class)objc_opt_class();
}

- (int)modeType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_modeType;
  }
  else {
    return 0;
  }
}

- (void)setModeType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_modeType = a3;
}

- (void)setHasModeType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasModeType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)modeTypeAsString:(int)a3
{
  if (a3 >= 0x11)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D6A40[a3];
  }

  return v3;
}

- (int)StringAsModeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Custom"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Home"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Working"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Exercising"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Driving"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Bedtime"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Gaming"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Reading"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Traveling"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Learning"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Streaming"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ScreenSharing"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ClassicDND"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"ScreenRecording"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"AirPlayMirroring"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"Mindfulness"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setShouldSuggestTriggers:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_shouldSuggestTriggers = a3;
}

- (void)setHasShouldSuggestTriggers:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasShouldSuggestTriggers
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasUserModeName
{
  return self->_userModeName != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBInferredModeEvent;
  int v4 = [(BMPBInferredModeEvent *)&v8 description];
  v5 = [(BMPBInferredModeEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v3 setObject:v4 forKey:@"absoluteTimestamp"];
  }
  modeIdentifier = self->_modeIdentifier;
  if (modeIdentifier) {
    [v3 setObject:modeIdentifier forKey:@"modeIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    unsigned int v6 = self->_origin + 1;
    if (v6 >= 0x12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_origin);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E55D69B0[v6];
    }
    [v3 setObject:v7 forKey:@"origin"];
  }
  originBundleId = self->_originBundleId;
  if (originBundleId) {
    [v3 setObject:originBundleId forKey:@"originBundleId"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_isAutomationEnabled];
    [v3 setObject:v10 forKey:@"isAutomationEnabled"];

    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_isStart];
    [v3 setObject:v11 forKey:@"isStart"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  originAnchorType = self->_originAnchorType;
  if (originAnchorType) {
    [v3 setObject:originAnchorType forKey:@"originAnchorType"];
  }
  char v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    v15 = [NSNumber numberWithUnsignedLongLong:self->_uiLocation];
    [v3 setObject:v15 forKey:@"uiLocation"];

    char v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    v16 = [NSNumber numberWithDouble:self->_confidenceScore];
    [v3 setObject:v16 forKey:@"confidenceScore"];
  }
  serializedTriggers = self->_serializedTriggers;
  if (serializedTriggers) {
    [v3 setObject:serializedTriggers forKey:@"serializedTriggers"];
  }
  char v18 = (char)self->_has;
  if ((v18 & 8) != 0)
  {
    uint64_t modeType = self->_modeType;
    if (modeType >= 0x11)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeType);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E55D6A40[modeType];
    }
    [v3 setObject:v20 forKey:@"modeType"];

    char v18 = (char)self->_has;
  }
  if (v18 < 0)
  {
    v21 = [NSNumber numberWithBool:self->_shouldSuggestTriggers];
    [v3 setObject:v21 forKey:@"shouldSuggestTriggers"];
  }
  userModeName = self->_userModeName;
  if (userModeName) {
    [v3 setObject:userModeName forKey:@"userModeName"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBInferredModeEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_modeIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_originBundleId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_originAnchorType) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = self->_serializedTriggers;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  char v12 = (char)self->_has;
  if ((v12 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v12 = (char)self->_has;
  }
  if (v12 < 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_userModeName) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 92) |= 1u;
  }
  long long v13 = v4;
  if (self->_modeIdentifier)
  {
    objc_msgSend(v4, "setModeIdentifier:");
    id v4 = v13;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_origin;
    *((unsigned char *)v4 + 92) |= 0x10u;
  }
  if (self->_originBundleId)
  {
    objc_msgSend(v13, "setOriginBundleId:");
    id v4 = v13;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)v4 + 88) = self->_isAutomationEnabled;
    *((unsigned char *)v4 + 92) |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *((unsigned char *)v4 + 89) = self->_isStart;
    *((unsigned char *)v4 + 92) |= 0x40u;
  }
  if (self->_uuid)
  {
    objc_msgSend(v13, "setUuid:");
    id v4 = v13;
  }
  if (self->_originAnchorType)
  {
    objc_msgSend(v13, "setOriginAnchorType:");
    id v4 = v13;
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    v4[3] = self->_uiLocation;
    *((unsigned char *)v4 + 92) |= 4u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    v4[2] = *(void *)&self->_confidenceScore;
    *((unsigned char *)v4 + 92) |= 2u;
  }
  if ([(BMPBInferredModeEvent *)self serializedTriggersCount])
  {
    [v13 clearSerializedTriggers];
    unint64_t v7 = [(BMPBInferredModeEvent *)self serializedTriggersCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(BMPBInferredModeEvent *)self serializedTriggersAtIndex:i];
        [v13 addSerializedTriggers:v10];
      }
    }
  }
  char v11 = (char)self->_has;
  char v12 = v13;
  if ((v11 & 8) != 0)
  {
    *((_DWORD *)v13 + 10) = self->_modeType;
    *((unsigned char *)v13 + 92) |= 8u;
    char v11 = (char)self->_has;
  }
  if (v11 < 0)
  {
    *((unsigned char *)v13 + 90) = self->_shouldSuggestTriggers;
    *((unsigned char *)v13 + 92) |= 0x80u;
  }
  if (self->_userModeName)
  {
    objc_msgSend(v13, "setUserModeName:");
    char v12 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 92) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_modeIdentifier copyWithZone:a3];
  unint64_t v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_origin;
    *(unsigned char *)(v6 + 92) |= 0x10u;
  }
  uint64_t v9 = [(NSString *)self->_originBundleId copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v9;

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(unsigned char *)(v6 + 88) = self->_isAutomationEnabled;
    *(unsigned char *)(v6 + 92) |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *(unsigned char *)(v6 + 89) = self->_isStart;
    *(unsigned char *)(v6 + 92) |= 0x40u;
  }
  uint64_t v12 = [(NSString *)self->_uuid copyWithZone:a3];
  long long v13 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v12;

  uint64_t v14 = [(NSString *)self->_originAnchorType copyWithZone:a3];
  long long v15 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v14;

  char v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    *(void *)(v6 + 24) = self->_uiLocation;
    *(unsigned char *)(v6 + 92) |= 4u;
    char v16 = (char)self->_has;
  }
  if ((v16 & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_confidenceScore;
    *(unsigned char *)(v6 + 92) |= 2u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v17 = self->_serializedTriggers;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (void)v27);
        [(id)v6 addSerializedTriggers:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v19);
  }

  char v23 = (char)self->_has;
  if ((v23 & 8) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_modeType;
    *(unsigned char *)(v6 + 92) |= 8u;
    char v23 = (char)self->_has;
  }
  if (v23 < 0)
  {
    *(unsigned char *)(v6 + 90) = self->_shouldSuggestTriggers;
    *(unsigned char *)(v6 + 92) |= 0x80u;
  }
  uint64_t v24 = -[NSString copyWithZone:](self->_userModeName, "copyWithZone:", a3, (void)v27);
  v25 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v24;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_61;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_61;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
    goto LABEL_61;
  }
  modeIdentifier = self->_modeIdentifier;
  if ((unint64_t)modeIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](modeIdentifier, "isEqual:")) {
      goto LABEL_61;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 0x10) == 0 || self->_origin != *((_DWORD *)v4 + 11)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 0x10) != 0)
  {
    goto LABEL_61;
  }
  originBundleId = self->_originBundleId;
  if ((unint64_t)originBundleId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](originBundleId, "isEqual:")) {
      goto LABEL_61;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 0x20) == 0) {
      goto LABEL_61;
    }
    if (self->_isAutomationEnabled)
    {
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_61;
      }
    }
    else if (*((unsigned char *)v4 + 88))
    {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 0x20) != 0)
  {
    goto LABEL_61;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 0x40) == 0) {
      goto LABEL_61;
    }
    if (self->_isStart)
    {
      if (!*((unsigned char *)v4 + 89)) {
        goto LABEL_61;
      }
    }
    else if (*((unsigned char *)v4 + 89))
    {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 0x40) != 0)
  {
    goto LABEL_61;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 10) && !-[NSString isEqual:](uuid, "isEqual:")) {
    goto LABEL_61;
  }
  originAnchorType = self->_originAnchorType;
  if ((unint64_t)originAnchorType | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](originAnchorType, "isEqual:")) {
      goto LABEL_61;
    }
  }
  char v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 4) == 0 || self->_uiLocation != *((void *)v4 + 3)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 4) != 0)
  {
    goto LABEL_61;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 2) == 0 || self->_confidenceScore != *((double *)v4 + 2)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 2) != 0)
  {
    goto LABEL_61;
  }
  serializedTriggers = self->_serializedTriggers;
  if ((unint64_t)serializedTriggers | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](serializedTriggers, "isEqual:")) {
      goto LABEL_61;
    }
    char v10 = (char)self->_has;
  }
  if ((v10 & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 8) == 0 || self->_modeType != *((_DWORD *)v4 + 10)) {
      goto LABEL_61;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 8) != 0)
  {
    goto LABEL_61;
  }
  if ((v10 & 0x80) == 0)
  {
    if ((*((unsigned char *)v4 + 92) & 0x80) == 0) {
      goto LABEL_58;
    }
LABEL_61:
    char v13 = 0;
    goto LABEL_62;
  }
  if ((*((unsigned char *)v4 + 92) & 0x80) == 0) {
    goto LABEL_61;
  }
  if (self->_shouldSuggestTriggers)
  {
    if (!*((unsigned char *)v4 + 90)) {
      goto LABEL_61;
    }
  }
  else if (*((unsigned char *)v4 + 90))
  {
    goto LABEL_61;
  }
LABEL_58:
  userModeName = self->_userModeName;
  if ((unint64_t)userModeName | *((void *)v4 + 9)) {
    char v13 = -[NSString isEqual:](userModeName, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_62:

  return v13;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v5 = self->_absoluteTimestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v24 = [(NSString *)self->_modeIdentifier hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v23 = 2654435761 * self->_origin;
  }
  else {
    uint64_t v23 = 0;
  }
  NSUInteger v22 = [(NSString *)self->_originBundleId hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v8 = 2654435761 * self->_isAutomationEnabled;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_14:
      uint64_t v9 = 2654435761 * self->_isStart;
      goto LABEL_17;
    }
  }
  uint64_t v9 = 0;
LABEL_17:
  NSUInteger v10 = [(NSString *)self->_uuid hash];
  NSUInteger v11 = [(NSString *)self->_originAnchorType hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v12 = 2654435761u * self->_uiLocation;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_19;
    }
LABEL_24:
    unint64_t v17 = 0;
    goto LABEL_27;
  }
  unint64_t v12 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_24;
  }
LABEL_19:
  double confidenceScore = self->_confidenceScore;
  double v14 = -confidenceScore;
  if (confidenceScore >= 0.0) {
    double v14 = self->_confidenceScore;
  }
  long double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  unint64_t v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0) {
      v17 += (unint64_t)v16;
    }
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
LABEL_27:
  uint64_t v18 = [(NSMutableArray *)self->_serializedTriggers hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v19 = 2654435761 * self->_modeType;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_29;
    }
LABEL_31:
    uint64_t v20 = 0;
    return v24 ^ v3 ^ v23 ^ v22 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v17 ^ v18 ^ v19 ^ v20 ^ [(NSString *)self->_userModeName hash];
  }
  uint64_t v19 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_31;
  }
LABEL_29:
  uint64_t v20 = 2654435761 * self->_shouldSuggestTriggers;
  return v24 ^ v3 ^ v23 ^ v22 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v17 ^ v18 ^ v19 ^ v20 ^ [(NSString *)self->_userModeName hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (double *)a3;
  double v5 = v4;
  if (*((unsigned char *)v4 + 92))
  {
    self->_double absoluteTimestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4)) {
    -[BMPBInferredModeEvent setModeIdentifier:](self, "setModeIdentifier:");
  }
  if ((*((unsigned char *)v5 + 92) & 0x10) != 0)
  {
    self->_origin = *((_DWORD *)v5 + 11);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v5 + 7)) {
    -[BMPBInferredModeEvent setOriginBundleId:](self, "setOriginBundleId:");
  }
  char v6 = *((unsigned char *)v5 + 92);
  if ((v6 & 0x20) != 0)
  {
    self->_isAutomationEnabled = *((unsigned char *)v5 + 88);
    *(unsigned char *)&self->_has |= 0x20u;
    char v6 = *((unsigned char *)v5 + 92);
  }
  if ((v6 & 0x40) != 0)
  {
    self->_isStart = *((unsigned char *)v5 + 89);
    *(unsigned char *)&self->_has |= 0x40u;
  }
  if (*((void *)v5 + 10)) {
    -[BMPBInferredModeEvent setUuid:](self, "setUuid:");
  }
  if (*((void *)v5 + 6)) {
    -[BMPBInferredModeEvent setOriginAnchorType:](self, "setOriginAnchorType:");
  }
  char v7 = *((unsigned char *)v5 + 92);
  if ((v7 & 4) != 0)
  {
    self->_uiLocation = (unint64_t)v5[3];
    *(unsigned char *)&self->_has |= 4u;
    char v7 = *((unsigned char *)v5 + 92);
  }
  if ((v7 & 2) != 0)
  {
    self->_double confidenceScore = v5[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = *((id *)v5 + 8);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        -[BMPBInferredModeEvent addSerializedTriggers:](self, "addSerializedTriggers:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  char v13 = *((unsigned char *)v5 + 92);
  if ((v13 & 8) != 0)
  {
    self->_uint64_t modeType = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 8u;
    char v13 = *((unsigned char *)v5 + 92);
  }
  if (v13 < 0)
  {
    self->_shouldSuggestTriggers = *((unsigned char *)v5 + 90);
    *(unsigned char *)&self->_has |= 0x80u;
  }
  if (*((void *)v5 + 9)) {
    -[BMPBInferredModeEvent setUserModeName:](self, "setUserModeName:");
  }
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (void)setModeIdentifier:(id)a3
{
}

- (NSString)originBundleId
{
  return self->_originBundleId;
}

- (void)setOriginBundleId:(id)a3
{
}

- (BOOL)isAutomationEnabled
{
  return self->_isAutomationEnabled;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)originAnchorType
{
  return self->_originAnchorType;
}

- (void)setOriginAnchorType:(id)a3
{
}

- (unint64_t)uiLocation
{
  return self->_uiLocation;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (NSMutableArray)serializedTriggers
{
  return self->_serializedTriggers;
}

- (void)setSerializedTriggers:(id)a3
{
}

- (BOOL)shouldSuggestTriggers
{
  return self->_shouldSuggestTriggers;
}

- (NSString)userModeName
{
  return self->_userModeName;
}

- (void)setUserModeName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_userModeName, 0);
  objc_storeStrong((id *)&self->_serializedTriggers, 0);
  objc_storeStrong((id *)&self->_originBundleId, 0);
  objc_storeStrong((id *)&self->_originAnchorType, 0);

  objc_storeStrong((id *)&self->_modeIdentifier, 0);
}

@end