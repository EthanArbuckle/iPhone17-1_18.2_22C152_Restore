@interface BMPBSiriInferredHelpfulnessEvent
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasInferredHelpfulnessScore;
- (BOOL)hasModelID;
- (BOOL)hasRestatementScore;
- (BOOL)hasTurnID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)modelID;
- (NSString)turnID;
- (double)absoluteTimestamp;
- (double)inferredHelpfulnessScore;
- (double)restatementScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasInferredHelpfulnessScore:(BOOL)a3;
- (void)setHasRestatementScore:(BOOL)a3;
- (void)setInferredHelpfulnessScore:(double)a3;
- (void)setModelID:(id)a3;
- (void)setRestatementScore:(double)a3;
- (void)setTurnID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSiriInferredHelpfulnessEvent

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

- (void)setInferredHelpfulnessScore:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_inferredHelpfulnessScore = a3;
}

- (void)setHasInferredHelpfulnessScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInferredHelpfulnessScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRestatementScore:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_restatementScore = a3;
}

- (void)setHasRestatementScore:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRestatementScore
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasTurnID
{
  return self->_turnID != 0;
}

- (BOOL)hasModelID
{
  return self->_modelID != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBSiriInferredHelpfulnessEvent;
  v4 = [(BMPBSiriInferredHelpfulnessEvent *)&v8 description];
  v5 = [(BMPBSiriInferredHelpfulnessEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v3 setObject:v9 forKey:@"absoluteTimestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = [NSNumber numberWithDouble:self->_inferredHelpfulnessScore];
  [v3 setObject:v10 forKey:@"inferredHelpfulnessScore"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithDouble:self->_restatementScore];
    [v3 setObject:v5 forKey:@"restatementScore"];
  }
LABEL_5:
  turnID = self->_turnID;
  if (turnID) {
    [v3 setObject:turnID forKey:@"turnID"];
  }
  modelID = self->_modelID;
  if (modelID) {
    [v3 setObject:modelID forKey:@"modelID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSiriInferredHelpfulnessEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
  if (self->_turnID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_modelID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = *(void *)&self->_inferredHelpfulnessScore;
  *((unsigned char *)v4 + 48) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[3] = *(void *)&self->_restatementScore;
    *((unsigned char *)v4 + 48) |= 4u;
  }
LABEL_5:
  id v6 = v4;
  if (self->_turnID)
  {
    objc_msgSend(v4, "setTurnID:");
    id v4 = v6;
  }
  if (self->_modelID)
  {
    objc_msgSend(v6, "setModelID:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(double *)(v5 + 16) = self->_inferredHelpfulnessScore;
    *(unsigned char *)(v5 + 48) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 8) = self->_absoluteTimestamp;
  *(unsigned char *)(v5 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(double *)(v5 + 24) = self->_restatementScore;
    *(unsigned char *)(v5 + 48) |= 4u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_turnID copyWithZone:a3];
  v9 = (void *)v6[5];
  v6[5] = v8;

  uint64_t v10 = [(NSString *)self->_modelID copyWithZone:a3];
  v11 = (void *)v6[4];
  v6[4] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_21:
    char v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_inferredHelpfulnessScore != *((double *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_restatementScore != *((double *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_21;
  }
  turnID = self->_turnID;
  if ((unint64_t)turnID | *((void *)v4 + 5) && !-[NSString isEqual:](turnID, "isEqual:")) {
    goto LABEL_21;
  }
  modelID = self->_modelID;
  if ((unint64_t)modelID | *((void *)v4 + 4)) {
    char v7 = -[NSString isEqual:](modelID, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v6 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v6 = self->_absoluteTimestamp;
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
  if ((has & 2) != 0)
  {
    double inferredHelpfulnessScore = self->_inferredHelpfulnessScore;
    double v11 = -inferredHelpfulnessScore;
    if (inferredHelpfulnessScore >= 0.0) {
      double v11 = self->_inferredHelpfulnessScore;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 4) != 0)
  {
    double restatementScore = self->_restatementScore;
    double v16 = -restatementScore;
    if (restatementScore >= 0.0) {
      double v16 = self->_restatementScore;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  NSUInteger v19 = v9 ^ v4 ^ v14 ^ [(NSString *)self->_turnID hash];
  return v19 ^ [(NSString *)self->_modelID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 48);
  if (v5)
  {
    self->_double absoluteTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_double inferredHelpfulnessScore = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
LABEL_4:
    self->_double restatementScore = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  id v6 = v4;
  if (*((void *)v4 + 5))
  {
    -[BMPBSiriInferredHelpfulnessEvent setTurnID:](self, "setTurnID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[BMPBSiriInferredHelpfulnessEvent setModelID:](self, "setModelID:");
    id v4 = v6;
  }
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (double)inferredHelpfulnessScore
{
  return self->_inferredHelpfulnessScore;
}

- (double)restatementScore
{
  return self->_restatementScore;
}

- (NSString)turnID
{
  return self->_turnID;
}

- (void)setTurnID:(id)a3
{
}

- (NSString)modelID
{
  return self->_modelID;
}

- (void)setModelID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnID, 0);

  objc_storeStrong((id *)&self->_modelID, 0);
}

@end