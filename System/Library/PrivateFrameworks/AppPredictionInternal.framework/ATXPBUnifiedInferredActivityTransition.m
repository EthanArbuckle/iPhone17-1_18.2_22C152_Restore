@interface ATXPBUnifiedInferredActivityTransition
- (BOOL)hasConfidence;
- (BOOL)hasInferredActivity;
- (BOOL)hasIsActivityStart;
- (BOOL)hasSource;
- (BOOL)hasTransitionTime;
- (BOOL)isActivityStart;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)source;
- (double)confidence;
- (double)transitionTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (int64_t)inferredActivity;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasInferredActivity:(BOOL)a3;
- (void)setHasIsActivityStart:(BOOL)a3;
- (void)setHasTransitionTime:(BOOL)a3;
- (void)setInferredActivity:(int64_t)a3;
- (void)setIsActivityStart:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setTransitionTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBUnifiedInferredActivityTransition

- (void)setTransitionTime:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_transitionTime = a3;
}

- (void)setHasTransitionTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTransitionTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsActivityStart:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isActivityStart = a3;
}

- (void)setHasIsActivityStart:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsActivityStart
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setInferredActivity:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_inferredActivity = a3;
}

- (void)setHasInferredActivity:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInferredActivity
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (void)setConfidence:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBUnifiedInferredActivityTransition;
  v4 = [(ATXPBUnifiedInferredActivityTransition *)&v8 description];
  v5 = [(ATXPBUnifiedInferredActivityTransition *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = [NSNumber numberWithDouble:self->_transitionTime];
    [v3 setObject:v9 forKey:@"transitionTime"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v10 = [NSNumber numberWithBool:self->_isActivityStart];
  [v3 setObject:v10 forKey:@"isActivityStart"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithLongLong:self->_inferredActivity];
    [v3 setObject:v5 forKey:@"inferredActivity"];
  }
LABEL_5:
  source = self->_source;
  if (source) {
    [v3 setObject:source forKey:@"source"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_confidence];
    [v3 setObject:v7 forKey:@"confidence"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUnifiedInferredActivityTransitionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt64Field();
LABEL_5:
  if (self->_source) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = *(void *)&self->_transitionTime;
    *((unsigned char *)v4 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 40) = self->_isActivityStart;
  *((unsigned char *)v4 + 44) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[2] = self->_inferredActivity;
    *((unsigned char *)v4 + 44) |= 2u;
  }
LABEL_5:
  if (self->_source)
  {
    v6 = v4;
    objc_msgSend(v4, "setSource:");
    v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_confidence;
    *((unsigned char *)v4 + 44) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_transitionTime;
    *(unsigned char *)(v5 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 40) = self->_isActivityStart;
  *(unsigned char *)(v5 + 44) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(void *)(v5 + 16) = self->_inferredActivity;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_source copyWithZone:a3];
  v9 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v6 + 8) = self->_confidence;
    *(unsigned char *)(v6 + 44) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_transitionTime != *((double *)v4 + 3)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0) {
      goto LABEL_27;
    }
    if (self->_isActivityStart)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_inferredActivity != *((void *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_27;
  }
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 4))
  {
    if (-[NSString isEqual:](source, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_23;
    }
LABEL_27:
    BOOL v7 = 0;
    goto LABEL_28;
  }
LABEL_23:
  BOOL v7 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_confidence != *((double *)v4 + 1)) {
      goto LABEL_27;
    }
    BOOL v7 = 1;
  }
LABEL_28:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double transitionTime = self->_transitionTime;
    double v6 = -transitionTime;
    if (transitionTime >= 0.0) {
      double v6 = self->_transitionTime;
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
  if ((has & 8) != 0)
  {
    uint64_t v9 = 2654435761 * self->_isActivityStart;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((has & 2) != 0)
    {
LABEL_11:
      uint64_t v10 = 2654435761 * self->_inferredActivity;
      goto LABEL_14;
    }
  }
  uint64_t v10 = 0;
LABEL_14:
  NSUInteger v11 = [(NSString *)self->_source hash];
  if (*(unsigned char *)&self->_has)
  {
    double confidence = self->_confidence;
    double v14 = -confidence;
    if (confidence >= 0.0) {
      double v14 = self->_confidence;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 4) != 0)
  {
    self->_double transitionTime = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_isActivityStart = *((unsigned char *)v4 + 40);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
LABEL_4:
    self->_inferredActivity = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((void *)v4 + 4))
  {
    id v6 = v4;
    -[ATXPBUnifiedInferredActivityTransition setSource:](self, "setSource:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 44))
  {
    self->_double confidence = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (double)transitionTime
{
  return self->_transitionTime;
}

- (BOOL)isActivityStart
{
  return self->_isActivityStart;
}

- (int64_t)inferredActivity
{
  return self->_inferredActivity;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  char v5 = [(ATXPBUnifiedInferredActivityTransition *)self init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      long double v7 = [v6 objectForKeyedSubscript:@"confidence"];
      [v7 doubleValue];
      -[ATXPBUnifiedInferredActivityTransition setConfidence:](v5, "setConfidence:");

      double v8 = [v6 objectForKeyedSubscript:@"inferredActivity"];
      -[ATXPBUnifiedInferredActivityTransition setInferredActivity:](v5, "setInferredActivity:", [v8 integerValue]);

      uint64_t v9 = [v6 objectForKeyedSubscript:@"isActivityStart"];
      -[ATXPBUnifiedInferredActivityTransition setIsActivityStart:](v5, "setIsActivityStart:", [v9 BOOLValue]);

      uint64_t v10 = [v6 objectForKeyedSubscript:@"source"];
      [(ATXPBUnifiedInferredActivityTransition *)v5 setSource:v10];

      NSUInteger v11 = [v6 objectForKeyedSubscript:@"transitionTime"];

      [v11 doubleValue];
      -[ATXPBUnifiedInferredActivityTransition setTransitionTime:](v5, "setTransitionTime:");
    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  v23[5] = *MEMORY[0x1E4F143B8];
  v22[0] = @"confidence";
  char v3 = (void *)MEMORY[0x1E4F4B120];
  id v4 = NSNumber;
  [(ATXPBUnifiedInferredActivityTransition *)self confidence];
  v21 = objc_msgSend(v4, "numberWithDouble:");
  char v5 = [v3 wrapObject:v21];
  v23[0] = v5;
  v22[1] = @"inferredActivity";
  id v6 = (void *)MEMORY[0x1E4F4B120];
  long double v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ATXPBUnifiedInferredActivityTransition inferredActivity](self, "inferredActivity"));
  double v8 = [v6 wrapObject:v7];
  v23[1] = v8;
  v22[2] = @"isActivityStart";
  uint64_t v9 = (void *)MEMORY[0x1E4F4B120];
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXPBUnifiedInferredActivityTransition isActivityStart](self, "isActivityStart"));
  NSUInteger v11 = [v9 wrapObject:v10];
  v23[2] = v11;
  v22[3] = @"transitionTime";
  unint64_t v12 = (void *)MEMORY[0x1E4F4B120];
  v13 = NSNumber;
  [(ATXPBUnifiedInferredActivityTransition *)self transitionTime];
  double v14 = objc_msgSend(v13, "numberWithDouble:");
  long double v15 = [v12 wrapObject:v14];
  v23[3] = v15;
  v22[4] = @"source";
  double v16 = (void *)MEMORY[0x1E4F4B120];
  v17 = [(ATXPBUnifiedInferredActivityTransition *)self source];
  v18 = [v16 wrapObject:v17];
  v23[4] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];

  return v19;
}

@end