@interface ASCodableCloudKitAchievement
- (ASCodableCloudKitSample)sample;
- (BOOL)hasCompletedDate;
- (BOOL)hasDefinitionIdentifier;
- (BOOL)hasDoubleValue;
- (BOOL)hasIntValue;
- (BOOL)hasSample;
- (BOOL)hasTemplateUniqueName;
- (BOOL)hasWorkoutActivityType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)definitionIdentifier;
- (NSString)templateUniqueName;
- (double)completedDate;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)intValue;
- (int64_t)workoutActivityType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompletedDate:(double)a3;
- (void)setDefinitionIdentifier:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setHasCompletedDate:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntValue:(BOOL)a3;
- (void)setHasWorkoutActivityType:(BOOL)a3;
- (void)setIntValue:(int64_t)a3;
- (void)setSample:(id)a3;
- (void)setTemplateUniqueName:(id)a3;
- (void)setWorkoutActivityType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableCloudKitAchievement

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setCompletedDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_completedDate = a3;
}

- (void)setHasCompletedDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompletedDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDoubleValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIntValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_intValue = a3;
}

- (void)setHasIntValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIntValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWorkoutActivityType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_workoutActivityType = a3;
}

- (void)setHasWorkoutActivityType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWorkoutActivityType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasDefinitionIdentifier
{
  return self->_definitionIdentifier != 0;
}

- (BOOL)hasTemplateUniqueName
{
  return self->_templateUniqueName != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableCloudKitAchievement;
  v4 = [(ASCodableCloudKitAchievement *)&v8 description];
  v5 = [(ASCodableCloudKitAchievement *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(ASCodableCloudKitSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v11 = [NSNumber numberWithDouble:self->_completedDate];
    [v3 setObject:v11 forKey:@"completedDate"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v12 = [NSNumber numberWithDouble:self->_doubleValue];
  [v3 setObject:v12 forKey:@"doubleValue"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  v13 = [NSNumber numberWithLongLong:self->_intValue];
  [v3 setObject:v13 forKey:@"intValue"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    v7 = [NSNumber numberWithLongLong:self->_workoutActivityType];
    [v3 setObject:v7 forKey:@"workoutActivityType"];
  }
LABEL_8:
  definitionIdentifier = self->_definitionIdentifier;
  if (definitionIdentifier) {
    [v3 setObject:definitionIdentifier forKey:@"definitionIdentifier"];
  }
  templateUniqueName = self->_templateUniqueName;
  if (templateUniqueName) {
    [v3 setObject:templateUniqueName forKey:@"templateUniqueName"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableCloudKitAchievementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
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
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_8:
  if (self->_definitionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_templateUniqueName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_completedDate;
    *((unsigned char *)v4 + 64) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 2) = *(void *)&self->_doubleValue;
  *((unsigned char *)v4 + 64) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  *((void *)v4 + 3) = self->_intValue;
  *((unsigned char *)v4 + 64) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((void *)v4 + 4) = self->_workoutActivityType;
    *((unsigned char *)v4 + 64) |= 8u;
  }
LABEL_8:
  if (self->_definitionIdentifier)
  {
    objc_msgSend(v6, "setDefinitionIdentifier:");
    id v4 = v6;
  }
  if (self->_templateUniqueName)
  {
    objc_msgSend(v6, "setTemplateUniqueName:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ASCodableCloudKitSample *)self->_sample copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_completedDate;
    *(unsigned char *)(v5 + 64) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v5 + 24) = self->_intValue;
      *(unsigned char *)(v5 + 64) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_doubleValue;
  *(unsigned char *)(v5 + 64) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(void *)(v5 + 32) = self->_workoutActivityType;
    *(unsigned char *)(v5 + 64) |= 8u;
  }
LABEL_6:
  uint64_t v9 = [(NSString *)self->_definitionIdentifier copyWithZone:a3];
  v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_templateUniqueName copyWithZone:a3];
  v12 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 6))
  {
    if (!-[ASCodableCloudKitSample isEqual:](sample, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_completedDate != *((double *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_28:
    char v8 = 0;
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_doubleValue != *((double *)v4 + 2)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_intValue != *((void *)v4 + 3)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_workoutActivityType != *((void *)v4 + 4)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_28;
  }
  definitionIdentifier = self->_definitionIdentifier;
  if ((unint64_t)definitionIdentifier | *((void *)v4 + 5)
    && !-[NSString isEqual:](definitionIdentifier, "isEqual:"))
  {
    goto LABEL_28;
  }
  templateUniqueName = self->_templateUniqueName;
  if ((unint64_t)templateUniqueName | *((void *)v4 + 7)) {
    char v8 = -[NSString isEqual:](templateUniqueName, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ASCodableCloudKitSample *)self->_sample hash];
  char has = (char)self->_has;
  if (has)
  {
    double completedDate = self->_completedDate;
    double v7 = -completedDate;
    if (completedDate >= 0.0) {
      double v7 = self->_completedDate;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0)
  {
    double doubleValue = self->_doubleValue;
    double v12 = -doubleValue;
    if (doubleValue >= 0.0) {
      double v12 = self->_doubleValue;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((has & 4) != 0)
  {
    uint64_t v15 = 2654435761 * self->_intValue;
    if ((has & 8) != 0) {
      goto LABEL_19;
    }
LABEL_21:
    uint64_t v16 = 0;
    goto LABEL_22;
  }
  uint64_t v15 = 0;
  if ((has & 8) == 0) {
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v16 = 2654435761 * self->_workoutActivityType;
LABEL_22:
  NSUInteger v17 = v5 ^ v3 ^ v10 ^ v15 ^ v16 ^ [(NSString *)self->_definitionIdentifier hash];
  return v17 ^ [(NSString *)self->_templateUniqueName hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 6);
  id v8 = v4;
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ASCodableCloudKitSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ASCodableCloudKitAchievement setSample:](self, "setSample:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 64);
  if (v7)
  {
    self->_double completedDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 64);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_double doubleValue = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v7 = *((unsigned char *)v4 + 64);
  if ((v7 & 4) == 0)
  {
LABEL_10:
    if ((v7 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  self->_intValue = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
LABEL_11:
    self->_workoutActivityType = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((void *)v4 + 5))
  {
    -[ASCodableCloudKitAchievement setDefinitionIdentifier:](self, "setDefinitionIdentifier:");
    id v4 = v8;
  }
  if (*((void *)v4 + 7)) {
    -[ASCodableCloudKitAchievement setTemplateUniqueName:](self, "setTemplateUniqueName:");
  }

  MEMORY[0x270F9A758]();
}

- (ASCodableCloudKitSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
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

- (int64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (NSString)definitionIdentifier
{
  return self->_definitionIdentifier;
}

- (void)setDefinitionIdentifier:(id)a3
{
}

- (NSString)templateUniqueName
{
  return self->_templateUniqueName;
}

- (void)setTemplateUniqueName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateUniqueName, 0);
  objc_storeStrong((id *)&self->_sample, 0);

  objc_storeStrong((id *)&self->_definitionIdentifier, 0);
}

@end