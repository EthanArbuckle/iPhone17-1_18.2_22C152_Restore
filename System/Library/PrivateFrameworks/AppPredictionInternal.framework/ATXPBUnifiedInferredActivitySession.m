@interface ATXPBUnifiedInferredActivitySession
- (BOOL)hasConfidence;
- (BOOL)hasEndTime;
- (BOOL)hasInferredActivity;
- (BOOL)hasSource;
- (BOOL)hasStartTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)source;
- (double)confidence;
- (double)endTime;
- (double)startTime;
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
- (void)setEndTime:(double)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasEndTime:(BOOL)a3;
- (void)setHasInferredActivity:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setInferredActivity:(int64_t)a3;
- (void)setSource:(id)a3;
- (void)setStartTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBUnifiedInferredActivitySession

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  v5 = [(ATXPBUnifiedInferredActivitySession *)self init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      v7 = [v6 objectForKeyedSubscript:@"confidence"];
      [v7 doubleValue];
      -[ATXPBUnifiedInferredActivitySession setConfidence:](v5, "setConfidence:");

      v8 = [v6 objectForKeyedSubscript:@"inferredActivity"];
      -[ATXPBUnifiedInferredActivitySession setInferredActivity:](v5, "setInferredActivity:", [v8 integerValue]);

      v9 = [v6 objectForKeyedSubscript:@"startTime"];
      [v9 doubleValue];
      -[ATXPBUnifiedInferredActivitySession setStartTime:](v5, "setStartTime:");

      v10 = [v6 objectForKeyedSubscript:@"source"];
      [(ATXPBUnifiedInferredActivitySession *)v5 setSource:v10];

      v11 = [v6 objectForKeyedSubscript:@"endTime"];

      [v11 doubleValue];
      -[ATXPBUnifiedInferredActivitySession setEndTime:](v5, "setEndTime:");
    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  v24[5] = *MEMORY[0x1E4F143B8];
  v23[0] = @"confidence";
  v3 = (void *)MEMORY[0x1E4F4B120];
  id v4 = NSNumber;
  [(ATXPBUnifiedInferredActivitySession *)self confidence];
  v22 = objc_msgSend(v4, "numberWithDouble:");
  v5 = [v3 wrapObject:v22];
  v24[0] = v5;
  v23[1] = @"inferredActivity";
  id v6 = (void *)MEMORY[0x1E4F4B120];
  v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ATXPBUnifiedInferredActivitySession inferredActivity](self, "inferredActivity"));
  v8 = [v6 wrapObject:v7];
  v24[1] = v8;
  v23[2] = @"startTime";
  v9 = (void *)MEMORY[0x1E4F4B120];
  v10 = NSNumber;
  [(ATXPBUnifiedInferredActivitySession *)self startTime];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  v12 = [v9 wrapObject:v11];
  v24[2] = v12;
  v23[3] = @"endTime";
  v13 = (void *)MEMORY[0x1E4F4B120];
  v14 = NSNumber;
  [(ATXPBUnifiedInferredActivitySession *)self endTime];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  v16 = [v13 wrapObject:v15];
  v24[3] = v16;
  v23[4] = @"source";
  v17 = (void *)MEMORY[0x1E4F4B120];
  v18 = [(ATXPBUnifiedInferredActivitySession *)self source];
  v19 = [v17 wrapObject:v18];
  v24[4] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];

  return v20;
}

- (void)setStartTime:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStartTime
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEndTime:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endTime = a3;
}

- (void)setHasEndTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setInferredActivity:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_inferredActivity = a3;
}

- (void)setHasInferredActivity:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInferredActivity
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)ATXPBUnifiedInferredActivitySession;
  id v4 = [(ATXPBUnifiedInferredActivitySession *)&v8 description];
  v5 = [(ATXPBUnifiedInferredActivitySession *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v9 = [NSNumber numberWithDouble:self->_startTime];
    [v3 setObject:v9 forKey:@"startTime"];

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
  v10 = [NSNumber numberWithDouble:self->_endTime];
  [v3 setObject:v10 forKey:@"endTime"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
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
  return ATXPBUnifiedInferredActivitySessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
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
  if ((*(unsigned char *)&self->_has & 4) != 0) {
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
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = *(void *)&self->_startTime;
    *((unsigned char *)v4 + 48) |= 8u;
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
  v4[2] = *(void *)&self->_endTime;
  *((unsigned char *)v4 + 48) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[3] = self->_inferredActivity;
    *((unsigned char *)v4 + 48) |= 4u;
  }
LABEL_5:
  if (self->_source)
  {
    id v6 = v4;
    objc_msgSend(v4, "setSource:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_confidence;
    *((unsigned char *)v4 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_startTime;
    *(unsigned char *)(v5 + 48) |= 8u;
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
  *(double *)(v5 + 16) = self->_endTime;
  *(unsigned char *)(v5 + 48) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(void *)(v5 + 24) = self->_inferredActivity;
    *(unsigned char *)(v5 + 48) |= 4u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_source copyWithZone:a3];
  v9 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v6 + 8) = self->_confidence;
    *(unsigned char *)(v6 + 48) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_startTime != *((double *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_endTime != *((double *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_inferredActivity != *((void *)v4 + 3)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](source, "isEqual:"))
    {
LABEL_24:
      BOOL v7 = 0;
      goto LABEL_25;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_confidence != *((double *)v4 + 1)) {
      goto LABEL_24;
    }
    BOOL v7 = 1;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    double startTime = self->_startTime;
    double v6 = -startTime;
    if (startTime >= 0.0) {
      double v6 = self->_startTime;
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
    double endTime = self->_endTime;
    double v11 = -endTime;
    if (endTime >= 0.0) {
      double v11 = self->_endTime;
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
  if ((has & 4) != 0) {
    uint64_t v14 = 2654435761 * self->_inferredActivity;
  }
  else {
    uint64_t v14 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_source hash];
  if (*(unsigned char *)&self->_has)
  {
    double confidence = self->_confidence;
    double v18 = -confidence;
    if (confidence >= 0.0) {
      double v18 = self->_confidence;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v16 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 8) != 0)
  {
    self->_double startTime = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
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
  self->_double endTime = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
LABEL_4:
    self->_inferredActivity = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  if (*((void *)v4 + 5))
  {
    id v6 = v4;
    -[ATXPBUnifiedInferredActivitySession setSource:](self, "setSource:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_double confidence = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
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

@end