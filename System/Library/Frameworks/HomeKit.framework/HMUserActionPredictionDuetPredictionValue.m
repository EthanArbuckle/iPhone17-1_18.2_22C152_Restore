@interface HMUserActionPredictionDuetPredictionValue
- (BOOL)hasHomeIdentifier;
- (BOOL)hasPredictionType;
- (BOOL)hasScore;
- (BOOL)hasTargetAccessoryServiceIdentifier;
- (BOOL)hasTargetIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)homeIdentifier;
- (NSString)targetAccessoryServiceIdentifier;
- (NSString)targetIdentifier;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)predictionTypeAsString:(int)a3;
- (int)StringAsPredictionType:(id)a3;
- (int)predictionType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPredictionType:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHomeIdentifier:(id)a3;
- (void)setPredictionType:(int)a3;
- (void)setScore:(double)a3;
- (void)setTargetAccessoryServiceIdentifier:(id)a3;
- (void)setTargetIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMUserActionPredictionDuetPredictionValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
  objc_storeStrong((id *)&self->_targetAccessoryServiceIdentifier, 0);

  objc_storeStrong((id *)&self->_homeIdentifier, 0);
}

- (double)score
{
  return self->_score;
}

- (void)setTargetAccessoryServiceIdentifier:(id)a3
{
}

- (NSString)targetAccessoryServiceIdentifier
{
  return self->_targetAccessoryServiceIdentifier;
}

- (void)setTargetIdentifier:(id)a3
{
}

- (NSString)targetIdentifier
{
  return self->_targetIdentifier;
}

- (void)setHomeIdentifier:(id)a3
{
}

- (NSString)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[HMUserActionPredictionDuetPredictionValue setHomeIdentifier:](self, "setHomeIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[HMUserActionPredictionDuetPredictionValue setTargetIdentifier:](self, "setTargetIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[HMUserActionPredictionDuetPredictionValue setTargetAccessoryServiceIdentifier:](self, "setTargetAccessoryServiceIdentifier:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if (v5)
  {
    self->_score = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 48);
  }
  if ((v5 & 2) != 0)
  {
    self->_predictionType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_homeIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_targetIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_targetAccessoryServiceIdentifier hash];
  char has = (char)self->_has;
  if (has)
  {
    double score = self->_score;
    double v9 = -score;
    if (score >= 0.0) {
      double v9 = self->_score;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v12 = 2654435761 * self->_predictionType;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  homeIdentifier = self->_homeIdentifier;
  if ((unint64_t)homeIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](homeIdentifier, "isEqual:")) {
      goto LABEL_17;
    }
  }
  targetIdentifier = self->_targetIdentifier;
  if ((unint64_t)targetIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](targetIdentifier, "isEqual:")) {
      goto LABEL_17;
    }
  }
  targetAccessoryServiceIdentifier = self->_targetAccessoryServiceIdentifier;
  if ((unint64_t)targetAccessoryServiceIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](targetAccessoryServiceIdentifier, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_score != *((double *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  BOOL v8 = (*((unsigned char *)v4 + 48) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_predictionType != *((_DWORD *)v4 + 6)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_homeIdentifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_targetIdentifier copyWithZone:a3];
  double v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_targetAccessoryServiceIdentifier copyWithZone:a3];
  double v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_score;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_predictionType;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_homeIdentifier)
  {
    objc_msgSend(v4, "setHomeIdentifier:");
    id v4 = v6;
  }
  if (self->_targetIdentifier)
  {
    objc_msgSend(v6, "setTargetIdentifier:");
    id v4 = v6;
  }
  if (self->_targetAccessoryServiceIdentifier)
  {
    objc_msgSend(v6, "setTargetAccessoryServiceIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_score;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_predictionType;
    *((unsigned char *)v4 + 48) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_homeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_targetIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_targetAccessoryServiceIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMUserActionPredictionDuetPredictionValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  homeIdentifier = self->_homeIdentifier;
  if (homeIdentifier) {
    [v3 setObject:homeIdentifier forKey:@"homeIdentifier"];
  }
  targetIdentifier = self->_targetIdentifier;
  if (targetIdentifier) {
    [v4 setObject:targetIdentifier forKey:@"targetIdentifier"];
  }
  targetAccessoryServiceIdentifier = self->_targetAccessoryServiceIdentifier;
  if (targetAccessoryServiceIdentifier) {
    [v4 setObject:targetAccessoryServiceIdentifier forKey:@"targetAccessoryServiceIdentifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    double v9 = [NSNumber numberWithDouble:self->_score];
    [v4 setObject:v9 forKey:@"score"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t predictionType = self->_predictionType;
    if (predictionType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_predictionType);
      double v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v11 = off_1E5945530[predictionType];
    }
    [v4 setObject:v11 forKey:@"predictionType"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMUserActionPredictionDuetPredictionValue;
  id v4 = [(HMUserActionPredictionDuetPredictionValue *)&v8 description];
  uint64_t v5 = [(HMUserActionPredictionDuetPredictionValue *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsPredictionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"scene"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"accessory"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)predictionTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5945530[a3];
  }

  return v3;
}

- (BOOL)hasPredictionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasPredictionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setPredictionType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t predictionType = a3;
}

- (int)predictionType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_predictionType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double score = a3;
}

- (BOOL)hasTargetAccessoryServiceIdentifier
{
  return self->_targetAccessoryServiceIdentifier != 0;
}

- (BOOL)hasTargetIdentifier
{
  return self->_targetIdentifier != 0;
}

- (BOOL)hasHomeIdentifier
{
  return self->_homeIdentifier != 0;
}

@end