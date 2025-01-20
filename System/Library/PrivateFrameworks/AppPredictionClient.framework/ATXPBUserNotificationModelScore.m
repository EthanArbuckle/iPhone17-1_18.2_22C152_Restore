@interface ATXPBUserNotificationModelScore
- (BOOL)hasModelId;
- (BOOL)hasModelVersion;
- (BOOL)hasScore;
- (BOOL)hasScoreInfo;
- (BOOL)hasScoreTimestamp;
- (BOOL)hasScoreUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)scoreInfo;
- (NSString)modelId;
- (NSString)scoreUUID;
- (double)score;
- (double)scoreTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)modelVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasScoreTimestamp:(BOOL)a3;
- (void)setModelId:(id)a3;
- (void)setModelVersion:(unint64_t)a3;
- (void)setScore:(double)a3;
- (void)setScoreInfo:(id)a3;
- (void)setScoreTimestamp:(double)a3;
- (void)setScoreUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBUserNotificationModelScore

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  v5 = [(ATXPBUserNotificationModelScore *)self init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      v7 = [v6 objectForKeyedSubscript:@"modelId"];
      [(ATXPBUserNotificationModelScore *)v5 setModelId:v7];

      v8 = [v6 objectForKeyedSubscript:@"modelVersion"];
      -[ATXPBUserNotificationModelScore setModelVersion:](v5, "setModelVersion:", [v8 unsignedIntValue]);

      v9 = [v6 objectForKeyedSubscript:@"score"];
      [v9 doubleValue];
      -[ATXPBUserNotificationModelScore setScore:](v5, "setScore:");

      v10 = [v6 objectForKeyedSubscript:@"scoreTimestamp"];
      [v10 doubleValue];
      -[ATXPBUserNotificationModelScore setScoreTimestamp:](v5, "setScoreTimestamp:");

      v11 = [v6 objectForKeyedSubscript:@"scoreUUID"];
      [(ATXPBUserNotificationModelScore *)v5 setScoreUUID:v11];

      v12 = [v6 objectForKeyedSubscript:@"scoreInfo"];

      v13 = +[ATXJSONHelper unwrapData:v12];
      [(ATXPBUserNotificationModelScore *)v5 setScoreInfo:v13];
    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  v15[6] = *MEMORY[0x1E4F143B8];
  v14[0] = @"modelId";
  v3 = +[ATXJSONHelper wrapObject:self->_modelId];
  v15[0] = v3;
  v14[1] = @"modelVersion";
  id v4 = [NSNumber numberWithUnsignedInteger:self->_modelVersion];
  v5 = +[ATXJSONHelper wrapObject:v4];
  v15[1] = v5;
  v14[2] = @"score";
  id v6 = [NSNumber numberWithDouble:self->_score];
  v7 = +[ATXJSONHelper wrapObject:v6];
  v15[2] = v7;
  v14[3] = @"scoreTimestamp";
  v8 = [NSNumber numberWithDouble:self->_scoreTimestamp];
  v9 = +[ATXJSONHelper wrapObject:v8];
  v15[3] = v9;
  v14[4] = @"scoreUUID";
  v10 = +[ATXJSONHelper wrapObject:self->_scoreUUID];
  v15[4] = v10;
  v14[5] = @"scoreInfo";
  v11 = +[ATXJSONHelper wrapObject:self->_scoreInfo];
  v15[5] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:6];

  return v12;
}

- (BOOL)hasModelId
{
  return self->_modelId != 0;
}

- (void)setModelVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_modelVersion = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModelVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setScoreTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_scoreTimestamp = a3;
}

- (void)setHasScoreTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScoreTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasScoreUUID
{
  return self->_scoreUUID != 0;
}

- (BOOL)hasScoreInfo
{
  return self->_scoreInfo != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBUserNotificationModelScore;
  id v4 = [(ATXPBUserNotificationModelScore *)&v8 description];
  v5 = [(ATXPBUserNotificationModelScore *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  modelId = self->_modelId;
  if (modelId) {
    [v3 setObject:modelId forKey:@"modelId"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v11 = [NSNumber numberWithUnsignedLongLong:self->_modelVersion];
    [v4 setObject:v11 forKey:@"modelVersion"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v12 = [NSNumber numberWithDouble:self->_score];
  [v4 setObject:v12 forKey:@"score"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    v7 = [NSNumber numberWithDouble:self->_scoreTimestamp];
    [v4 setObject:v7 forKey:@"scoreTimestamp"];
  }
LABEL_7:
  scoreUUID = self->_scoreUUID;
  if (scoreUUID) {
    [v4 setObject:scoreUUID forKey:@"scoreUUID"];
  }
  scoreInfo = self->_scoreInfo;
  if (scoreInfo) {
    [v4 setObject:scoreInfo forKey:@"scoreInfo"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUserNotificationModelScoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_modelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_7:
  if (self->_scoreUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_scoreInfo)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_modelId)
  {
    objc_msgSend(v4, "setModelId:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_modelVersion;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 2) = *(void *)&self->_score;
  *((unsigned char *)v4 + 56) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((void *)v4 + 3) = *(void *)&self->_scoreTimestamp;
    *((unsigned char *)v4 + 56) |= 4u;
  }
LABEL_7:
  if (self->_scoreUUID)
  {
    objc_msgSend(v6, "setScoreUUID:");
    id v4 = v6;
  }
  if (self->_scoreInfo)
  {
    objc_msgSend(v6, "setScoreInfo:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_modelId copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(double *)(v5 + 16) = self->_score;
    *(unsigned char *)(v5 + 56) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 8) = self->_modelVersion;
  *(unsigned char *)(v5 + 56) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(double *)(v5 + 24) = self->_scoreTimestamp;
    *(unsigned char *)(v5 + 56) |= 4u;
  }
LABEL_5:
  uint64_t v9 = [(NSString *)self->_scoreUUID copyWithZone:a3];
  v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  uint64_t v11 = [(NSData *)self->_scoreInfo copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  modelId = self->_modelId;
  if ((unint64_t)modelId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](modelId, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_modelVersion != *((void *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_23:
    char v8 = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_score != *((double *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_scoreTimestamp != *((double *)v4 + 3)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_23;
  }
  scoreUUID = self->_scoreUUID;
  if ((unint64_t)scoreUUID | *((void *)v4 + 6) && !-[NSString isEqual:](scoreUUID, "isEqual:")) {
    goto LABEL_23;
  }
  scoreInfo = self->_scoreInfo;
  if ((unint64_t)scoreInfo | *((void *)v4 + 5)) {
    char v8 = -[NSData isEqual:](scoreInfo, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_modelId hash];
  char has = (char)self->_has;
  if (has)
  {
    unint64_t v5 = 2654435761u * self->_modelVersion;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double score = self->_score;
  double v7 = -score;
  if (score >= 0.0) {
    double v7 = self->_score;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    double scoreTimestamp = self->_scoreTimestamp;
    double v13 = -scoreTimestamp;
    if (scoreTimestamp >= 0.0) {
      double v13 = self->_scoreTimestamp;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  NSUInteger v16 = v5 ^ v3 ^ v10 ^ v11 ^ [(NSString *)self->_scoreUUID hash];
  return v16 ^ [(NSData *)self->_scoreInfo hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[ATXPBUserNotificationModelScore setModelId:](self, "setModelId:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 56);
  if (v5)
  {
    self->_modelVersion = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_double score = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
LABEL_6:
    self->_double scoreTimestamp = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_7:
  if (*((void *)v4 + 6))
  {
    -[ATXPBUserNotificationModelScore setScoreUUID:](self, "setScoreUUID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[ATXPBUserNotificationModelScore setScoreInfo:](self, "setScoreInfo:");
    id v4 = v6;
  }
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
}

- (unint64_t)modelVersion
{
  return self->_modelVersion;
}

- (double)score
{
  return self->_score;
}

- (double)scoreTimestamp
{
  return self->_scoreTimestamp;
}

- (NSString)scoreUUID
{
  return self->_scoreUUID;
}

- (void)setScoreUUID:(id)a3
{
}

- (NSData)scoreInfo
{
  return self->_scoreInfo;
}

- (void)setScoreInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreUUID, 0);
  objc_storeStrong((id *)&self->_scoreInfo, 0);

  objc_storeStrong((id *)&self->_modelId, 0);
}

@end