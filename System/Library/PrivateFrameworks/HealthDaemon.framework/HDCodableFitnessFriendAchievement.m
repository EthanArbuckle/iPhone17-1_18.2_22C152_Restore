@interface HDCodableFitnessFriendAchievement
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasCompletedDate;
- (BOOL)hasDoubleValue;
- (BOOL)hasFriendUUID;
- (BOOL)hasIntValue;
- (BOOL)hasSample;
- (BOOL)hasTemplateUniqueName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSData)friendUUID;
- (NSString)description;
- (NSString)templateUniqueName;
- (double)completedDate;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)intValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompletedDate:(double)a3;
- (void)setDoubleValue:(double)a3;
- (void)setFriendUUID:(id)a3;
- (void)setHasCompletedDate:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntValue:(BOOL)a3;
- (void)setIntValue:(int64_t)a3;
- (void)setSample:(id)a3;
- (void)setTemplateUniqueName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableFitnessFriendAchievement

- (void)setSample:(id)a3
{
}

- (void)setFriendUUID:(id)a3
{
}

- (void)setCompletedDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_completedDate = a3;
}

- (void)setIntValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_intValue = a3;
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
  if (self->_friendUUID)
  {
    PBDataWriterWriteDataField();
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
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_9:
  if (self->_templateUniqueName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateUniqueName, 0);
  objc_storeStrong((id *)&self->_sample, 0);

  objc_storeStrong((id *)&self->_friendUUID, 0);
}

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(HDCodableFitnessFriendAchievement *)self sample];
    int v6 = [v5 applyToObject:v4];
    if (v6)
    {
      if ([(HDCodableFitnessFriendAchievement *)self hasFriendUUID])
      {
        v7 = (void *)MEMORY[0x1E4F29128];
        v8 = [(HDCodableFitnessFriendAchievement *)self friendUUID];
        v9 = objc_msgSend(v7, "hk_UUIDWithData:", v8);

        [v4 setFriendUUID:v9];
      }
      v10 = [(HDCodableFitnessFriendAchievement *)self templateUniqueName];
      [v4 setTemplateUniqueName:v10];

      id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [(HDCodableFitnessFriendAchievement *)self completedDate];
      v12 = objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
      [v4 setCompletedDate:v12];

      if ([(HDCodableFitnessFriendAchievement *)self hasIntValue])
      {
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDCodableFitnessFriendAchievement intValue](self, "intValue"));
LABEL_10:
        v15 = (void *)v13;
        [v4 setValue:v13];

        goto LABEL_11;
      }
      if ([(HDCodableFitnessFriendAchievement *)self hasDoubleValue])
      {
        v14 = NSNumber;
        [(HDCodableFitnessFriendAchievement *)self doubleValue];
        uint64_t v13 = objc_msgSend(v14, "numberWithDouble:");
        goto LABEL_10;
      }
    }
LABEL_11:

    goto LABEL_12;
  }
  LOBYTE(v6) = 0;
LABEL_12:

  return v6;
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (BOOL)hasFriendUUID
{
  return self->_friendUUID != 0;
}

- (NSData)friendUUID
{
  return self->_friendUUID;
}

- (double)completedDate
{
  return self->_completedDate;
}

- (BOOL)hasIntValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int64_t)intValue
{
  return self->_intValue;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setHasCompletedDate:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
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
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDoubleValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasIntValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTemplateUniqueName
{
  return self->_templateUniqueName != 0;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableFitnessFriendAchievement;
  id v4 = [(HDCodableFitnessFriendAchievement *)&v8 description];
  v5 = [(HDCodableFitnessFriendAchievement *)self dictionaryRepresentation];
  int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  friendUUID = self->_friendUUID;
  if (friendUUID) {
    [v3 setObject:friendUUID forKey:@"friendUUID"];
  }
  char has = (char)self->_has;
  if (has)
  {
    id v11 = [NSNumber numberWithDouble:self->_completedDate];
    [v3 setObject:v11 forKey:@"completedDate"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v12 = [NSNumber numberWithDouble:self->_doubleValue];
  [v3 setObject:v12 forKey:@"doubleValue"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    objc_super v8 = [NSNumber numberWithLongLong:self->_intValue];
    [v3 setObject:v8 forKey:@"intValue"];
  }
LABEL_9:
  templateUniqueName = self->_templateUniqueName;
  if (templateUniqueName) {
    [v3 setObject:templateUniqueName forKey:@"templateUniqueName"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableFitnessFriendAchievementReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_friendUUID)
  {
    objc_msgSend(v6, "setFriendUUID:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_completedDate;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 2) = *(void *)&self->_doubleValue;
  *((unsigned char *)v4 + 56) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    *((void *)v4 + 3) = self->_intValue;
    *((unsigned char *)v4 + 56) |= 4u;
  }
LABEL_9:
  if (self->_templateUniqueName)
  {
    objc_msgSend(v6, "setTemplateUniqueName:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSData *)self->_friendUUID copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(double *)(v5 + 16) = self->_doubleValue;
    *(unsigned char *)(v5 + 56) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 8) = self->_completedDate;
  *(unsigned char *)(v5 + 56) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(void *)(v5 + 24) = self->_intValue;
    *(unsigned char *)(v5 + 56) |= 4u;
  }
LABEL_5:
  uint64_t v11 = [(NSString *)self->_templateUniqueName copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 5))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_23;
    }
  }
  friendUUID = self->_friendUUID;
  if ((unint64_t)friendUUID | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](friendUUID, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_completedDate != *((double *)v4 + 1)) {
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
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_doubleValue != *((double *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_intValue != *((void *)v4 + 3)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_23;
  }
  templateUniqueName = self->_templateUniqueName;
  if ((unint64_t)templateUniqueName | *((void *)v4 + 6)) {
    char v8 = -[NSString isEqual:](templateUniqueName, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableSample *)self->_sample hash];
  uint64_t v4 = [(NSData *)self->_friendUUID hash];
  char has = (char)self->_has;
  if (has)
  {
    double completedDate = self->_completedDate;
    double v8 = -completedDate;
    if (completedDate >= 0.0) {
      double v8 = self->_completedDate;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 2) != 0)
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
  if ((has & 4) != 0) {
    uint64_t v16 = 2654435761 * self->_intValue;
  }
  else {
    uint64_t v16 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ [(NSString *)self->_templateUniqueName hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 5);
  id v8 = v4;
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableFitnessFriendAchievement setSample:](self, "setSample:");
  }
  id v4 = v8;
LABEL_7:
  if (*((void *)v4 + 4))
  {
    -[HDCodableFitnessFriendAchievement setFriendUUID:](self, "setFriendUUID:");
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 56);
  if (v7)
  {
    self->_double completedDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 56);
    if ((v7 & 2) == 0)
    {
LABEL_11:
      if ((v7 & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_double doubleValue = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
LABEL_12:
    self->_intValue = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_13:
  if (*((void *)v4 + 6))
  {
    -[HDCodableFitnessFriendAchievement setTemplateUniqueName:](self, "setTemplateUniqueName:");
    id v4 = v8;
  }
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (NSString)templateUniqueName
{
  return self->_templateUniqueName;
}

- (void)setTemplateUniqueName:(id)a3
{
}

@end