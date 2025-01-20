@interface ACHCodableLegacyAchievement
- (BOOL)alerted;
- (BOOL)hasAchievementType;
- (BOOL)hasAlerted;
- (BOOL)hasCompletedDate;
- (BOOL)hasDefinitionIdentifier;
- (BOOL)hasDoubleValue;
- (BOOL)hasIntValue;
- (BOOL)hasUuid;
- (BOOL)hasWorkoutActivityType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)uuid;
- (NSString)definitionIdentifier;
- (double)completedDate;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)achievementType;
- (int64_t)intValue;
- (int64_t)workoutActivityType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAchievementType:(int64_t)a3;
- (void)setAlerted:(BOOL)a3;
- (void)setCompletedDate:(double)a3;
- (void)setDefinitionIdentifier:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setHasAchievementType:(BOOL)a3;
- (void)setHasAlerted:(BOOL)a3;
- (void)setHasCompletedDate:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntValue:(BOOL)a3;
- (void)setHasWorkoutActivityType:(BOOL)a3;
- (void)setIntValue:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)setWorkoutActivityType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACHCodableLegacyAchievement

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setAchievementType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_achievementType = a3;
}

- (void)setHasAchievementType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAchievementType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCompletedDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_completedDate = a3;
}

- (void)setHasCompletedDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCompletedDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDoubleValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIntValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_intValue = a3;
}

- (void)setHasIntValue:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIntValue
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAlerted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_alerted = a3;
}

- (void)setHasAlerted:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAlerted
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasDefinitionIdentifier
{
  return self->_definitionIdentifier != 0;
}

- (void)setWorkoutActivityType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_workoutActivityType = a3;
}

- (void)setHasWorkoutActivityType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWorkoutActivityType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACHCodableLegacyAchievement;
  v4 = [(ACHCodableLegacyAchievement *)&v8 description];
  v5 = [(ACHCodableLegacyAchievement *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v11 = [NSNumber numberWithLongLong:self->_achievementType];
    [v4 setObject:v11 forKey:@"achievementType"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v12 = [NSNumber numberWithDouble:self->_completedDate];
  [v4 setObject:v12 forKey:@"completedDate"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v13 = [NSNumber numberWithDouble:self->_doubleValue];
  [v4 setObject:v13 forKey:@"doubleValue"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  v14 = [NSNumber numberWithLongLong:self->_intValue];
  [v4 setObject:v14 forKey:@"intValue"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    v7 = [NSNumber numberWithBool:self->_alerted];
    [v4 setObject:v7 forKey:@"alerted"];
  }
LABEL_9:
  definitionIdentifier = self->_definitionIdentifier;
  if (definitionIdentifier) {
    [v4 setObject:definitionIdentifier forKey:@"definitionIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v9 = [NSNumber numberWithLongLong:self->_workoutActivityType];
    [v4 setObject:v9 forKey:@"workoutActivityType"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACHCodableLegacyAchievementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_9:
  if (self->_definitionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_achievementType;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 2) = *(void *)&self->_completedDate;
  *((unsigned char *)v4 + 68) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)v4 + 3) = *(void *)&self->_doubleValue;
  *((unsigned char *)v4 + 68) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  *((void *)v4 + 4) = self->_intValue;
  *((unsigned char *)v4 + 68) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    *((unsigned char *)v4 + 64) = self->_alerted;
    *((unsigned char *)v4 + 68) |= 0x20u;
  }
LABEL_9:
  if (self->_definitionIdentifier)
  {
    objc_msgSend(v6, "setDefinitionIdentifier:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((void *)v4 + 5) = self->_workoutActivityType;
    *((unsigned char *)v4 + 68) |= 0x10u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_uuid copyWithZone:a3];
  v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_achievementType;
    *(unsigned char *)(v5 + 68) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_completedDate;
  *(unsigned char *)(v5 + 68) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *(double *)(v5 + 24) = self->_doubleValue;
  *(unsigned char *)(v5 + 68) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *(void *)(v5 + 32) = self->_intValue;
  *(unsigned char *)(v5 + 68) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *(unsigned char *)(v5 + 64) = self->_alerted;
    *(unsigned char *)(v5 + 68) |= 0x20u;
  }
LABEL_7:
  uint64_t v9 = [(NSString *)self->_definitionIdentifier copyWithZone:a3];
  v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_workoutActivityType;
    *(unsigned char *)(v5 + 68) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_39;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_achievementType != *((void *)v4 + 1)) {
      goto LABEL_39;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_completedDate != *((double *)v4 + 2)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_doubleValue != *((double *)v4 + 3)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 8) == 0 || self->_intValue != *((void *)v4 + 4)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x20) == 0) {
      goto LABEL_39;
    }
    if (self->_alerted)
    {
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)v4 + 64))
    {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x20) != 0)
  {
    goto LABEL_39;
  }
  definitionIdentifier = self->_definitionIdentifier;
  if (!((unint64_t)definitionIdentifier | *((void *)v4 + 6))) {
    goto LABEL_35;
  }
  if (!-[NSString isEqual:](definitionIdentifier, "isEqual:"))
  {
LABEL_39:
    BOOL v8 = 0;
    goto LABEL_40;
  }
  char has = (char)self->_has;
LABEL_35:
  BOOL v8 = (*((unsigned char *)v4 + 68) & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x10) == 0 || self->_workoutActivityType != *((void *)v4 + 5)) {
      goto LABEL_39;
    }
    BOOL v8 = 1;
  }
LABEL_40:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_uuid hash];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v5 = 2654435761 * self->_achievementType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double completedDate = self->_completedDate;
  double v7 = -completedDate;
  if (completedDate >= 0.0) {
    double v7 = self->_completedDate;
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
    double doubleValue = self->_doubleValue;
    double v13 = -doubleValue;
    if (doubleValue >= 0.0) {
      double v13 = self->_doubleValue;
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
  if ((has & 8) != 0)
  {
    uint64_t v16 = 2654435761 * self->_intValue;
    if ((has & 0x20) != 0) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if ((has & 0x20) != 0)
    {
LABEL_21:
      uint64_t v17 = 2654435761 * self->_alerted;
      goto LABEL_24;
    }
  }
  uint64_t v17 = 0;
LABEL_24:
  NSUInteger v18 = [(NSString *)self->_definitionIdentifier hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v19 = 2654435761 * self->_workoutActivityType;
  }
  else {
    uint64_t v19 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 7))
  {
    -[ACHCodableLegacyAchievement setUuid:](self, "setUuid:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 68);
  if (v5)
  {
    self->_achievementType = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 68);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_double completedDate = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_double doubleValue = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  self->_intValue = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 68) & 0x20) != 0)
  {
LABEL_8:
    self->_alerted = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_9:
  if (*((void *)v4 + 6))
  {
    -[ACHCodableLegacyAchievement setDefinitionIdentifier:](self, "setDefinitionIdentifier:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 68) & 0x10) != 0)
  {
    self->_workoutActivityType = *((void *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (int64_t)achievementType
{
  return self->_achievementType;
}

- (double)completedDate
{
  return self->_completedDate;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (int64_t)intValue
{
  return self->_intValue;
}

- (BOOL)alerted
{
  return self->_alerted;
}

- (NSString)definitionIdentifier
{
  return self->_definitionIdentifier;
}

- (void)setDefinitionIdentifier:(id)a3
{
}

- (int64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_definitionIdentifier, 0);
}

@end