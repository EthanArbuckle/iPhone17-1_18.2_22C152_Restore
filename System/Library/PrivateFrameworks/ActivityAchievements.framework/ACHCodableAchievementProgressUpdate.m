@interface ACHCodableAchievementProgressUpdate
- (ACHCodableAchievementProgressUpdate)initWithSerializedData:(id)a3 error:(id *)a4;
- (BOOL)hasGoalQuantityUnit;
- (BOOL)hasGoalQuantityValue;
- (BOOL)hasProgressQuantityUnit;
- (BOOL)hasProgressQuantityValue;
- (BOOL)hasTemplateUniqueName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)goalQuantityUnit;
- (NSString)progressQuantityUnit;
- (NSString)templateUniqueName;
- (double)goalQuantityValue;
- (double)progressQuantityValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGoalQuantityUnit:(id)a3;
- (void)setGoalQuantityValue:(double)a3;
- (void)setHasGoalQuantityValue:(BOOL)a3;
- (void)setHasProgressQuantityValue:(BOOL)a3;
- (void)setProgressQuantityUnit:(id)a3;
- (void)setProgressQuantityValue:(double)a3;
- (void)setTemplateUniqueName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACHCodableAchievementProgressUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateUniqueName, 0);
  objc_storeStrong((id *)&self->_progressQuantityUnit, 0);

  objc_storeStrong((id *)&self->_goalQuantityUnit, 0);
}

- (void)setTemplateUniqueName:(id)a3
{
}

- (void)setProgressQuantityValue:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_progressQuantityValue = a3;
}

- (void)setProgressQuantityUnit:(id)a3
{
}

- (void)setGoalQuantityValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_goalQuantityValue = a3;
}

- (void)setGoalQuantityUnit:(id)a3
{
}

- (NSString)templateUniqueName
{
  return self->_templateUniqueName;
}

- (double)progressQuantityValue
{
  return self->_progressQuantityValue;
}

- (NSString)progressQuantityUnit
{
  return self->_progressQuantityUnit;
}

- (double)goalQuantityValue
{
  return self->_goalQuantityValue;
}

- (NSString)goalQuantityUnit
{
  return self->_goalQuantityUnit;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_templateUniqueName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_progressQuantityUnit)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_goalQuantityUnit)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (ACHCodableAchievementProgressUpdate)initWithSerializedData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [[ACHCodableAchievementProgressUpdate alloc] initWithData:v5];

  return v6;
}

- (BOOL)hasTemplateUniqueName
{
  return self->_templateUniqueName != 0;
}

- (void)setHasProgressQuantityValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProgressQuantityValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasProgressQuantityUnit
{
  return self->_progressQuantityUnit != 0;
}

- (void)setHasGoalQuantityValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGoalQuantityValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasGoalQuantityUnit
{
  return self->_goalQuantityUnit != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACHCodableAchievementProgressUpdate;
  id v4 = [(ACHCodableAchievementProgressUpdate *)&v8 description];
  id v5 = [(ACHCodableAchievementProgressUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  templateUniqueName = self->_templateUniqueName;
  if (templateUniqueName) {
    [v3 setObject:templateUniqueName forKey:@"templateUniqueName"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithDouble:self->_progressQuantityValue];
    [v4 setObject:v6 forKey:@"progressQuantityValue"];
  }
  progressQuantityUnit = self->_progressQuantityUnit;
  if (progressQuantityUnit) {
    [v4 setObject:progressQuantityUnit forKey:@"progressQuantityUnit"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_goalQuantityValue];
    [v4 setObject:v8 forKey:@"goalQuantityValue"];
  }
  goalQuantityUnit = self->_goalQuantityUnit;
  if (goalQuantityUnit) {
    [v4 setObject:goalQuantityUnit forKey:@"goalQuantityUnit"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACHCodableAchievementProgressUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_templateUniqueName)
  {
    objc_msgSend(v4, "setTemplateUniqueName:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_progressQuantityValue;
    *((unsigned char *)v4 + 48) |= 2u;
  }
  if (self->_progressQuantityUnit)
  {
    objc_msgSend(v5, "setProgressQuantityUnit:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_goalQuantityValue;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_goalQuantityUnit)
  {
    objc_msgSend(v5, "setGoalQuantityUnit:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_templateUniqueName copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_progressQuantityValue;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_progressQuantityUnit copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_goalQuantityValue;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_goalQuantityUnit copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  templateUniqueName = self->_templateUniqueName;
  if ((unint64_t)templateUniqueName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](templateUniqueName, "isEqual:")) {
      goto LABEL_19;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_progressQuantityValue != *((double *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_19;
  }
  progressQuantityUnit = self->_progressQuantityUnit;
  if ((unint64_t)progressQuantityUnit | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](progressQuantityUnit, "isEqual:"))
    {
LABEL_19:
      char v9 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_goalQuantityValue != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_19;
  }
  goalQuantityUnit = self->_goalQuantityUnit;
  if ((unint64_t)goalQuantityUnit | *((void *)v4 + 3)) {
    char v9 = -[NSString isEqual:](goalQuantityUnit, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_templateUniqueName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double progressQuantityValue = self->_progressQuantityValue;
    double v6 = -progressQuantityValue;
    if (progressQuantityValue >= 0.0) {
      double v6 = self->_progressQuantityValue;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_progressQuantityUnit hash];
  if (*(unsigned char *)&self->_has)
  {
    double goalQuantityValue = self->_goalQuantityValue;
    double v12 = -goalQuantityValue;
    if (goalQuantityValue >= 0.0) {
      double v12 = self->_goalQuantityValue;
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
  return v4 ^ v3 ^ v9 ^ v10 ^ [(NSString *)self->_goalQuantityUnit hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (double *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 5))
  {
    -[ACHCodableAchievementProgressUpdate setTemplateUniqueName:](self, "setTemplateUniqueName:");
    unint64_t v4 = v5;
  }
  if (((_BYTE)v4[6] & 2) != 0)
  {
    self->_double progressQuantityValue = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 4))
  {
    -[ACHCodableAchievementProgressUpdate setProgressQuantityUnit:](self, "setProgressQuantityUnit:");
    unint64_t v4 = v5;
  }
  if ((_BYTE)v4[6])
  {
    self->_double goalQuantityValue = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[ACHCodableAchievementProgressUpdate setGoalQuantityUnit:](self, "setGoalQuantityUnit:");
    unint64_t v4 = v5;
  }
}

@end