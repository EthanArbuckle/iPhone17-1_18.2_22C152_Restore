@interface ATXPBTaskAgnosticBehaviorSample
- (ATXPBTaskAgnosticBehaviorFeatureVector)featureVector;
- (BOOL)engaged;
- (BOOL)hasEngaged;
- (BOOL)hasFeatureVector;
- (BOOL)hasTimeIntervalSinceReferenceDate;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)timeIntervalSinceReferenceDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEngaged:(BOOL)a3;
- (void)setFeatureVector:(id)a3;
- (void)setHasEngaged:(BOOL)a3;
- (void)setHasTimeIntervalSinceReferenceDate:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setTimeIntervalSinceReferenceDate:(double)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBTaskAgnosticBehaviorSample

- (void)setTimeIntervalSinceReferenceDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeIntervalSinceReferenceDate = a3;
}

- (void)setHasTimeIntervalSinceReferenceDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeIntervalSinceReferenceDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = @"contactInteraction";
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  return 0;
}

- (void)setEngaged:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_engaged = a3;
}

- (void)setHasEngaged:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEngaged
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasFeatureVector
{
  return self->_featureVector != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBTaskAgnosticBehaviorSample;
  v4 = [(ATXPBTaskAgnosticBehaviorSample *)&v8 description];
  v5 = [(ATXPBTaskAgnosticBehaviorSample *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_timeIntervalSinceReferenceDate];
    [v3 setObject:v9 forKey:@"timeIntervalSinceReferenceDate"];

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
  if (self->_type)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = @"contactInteraction";
  }
  [v3 setObject:v10 forKey:@"type"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithBool:self->_engaged];
    [v3 setObject:v5 forKey:@"engaged"];
  }
LABEL_5:
  featureVector = self->_featureVector;
  if (featureVector)
  {
    v7 = [(ATXPBTaskAgnosticBehaviorFeatureVector *)featureVector dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"featureVector"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBTaskAgnosticBehaviorSampleReadFrom((uint64_t)self, (uint64_t)a3);
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
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
  if (self->_featureVector)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = *(void *)&self->_timeIntervalSinceReferenceDate;
    *((unsigned char *)v4 + 32) |= 1u;
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
  *((_DWORD *)v4 + 6) = self->_type;
  *((unsigned char *)v4 + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((unsigned char *)v4 + 28) = self->_engaged;
    *((unsigned char *)v4 + 32) |= 4u;
  }
LABEL_5:
  if (self->_featureVector)
  {
    id v6 = v4;
    objc_msgSend(v4, "setFeatureVector:");
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
    *(_DWORD *)(v5 + 24) = self->_type;
    *(unsigned char *)(v5 + 32) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 8) = self->_timeIntervalSinceReferenceDate;
  *(unsigned char *)(v5 + 32) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 28) = self->_engaged;
    *(unsigned char *)(v5 + 32) |= 4u;
  }
LABEL_5:
  id v8 = [(ATXPBTaskAgnosticBehaviorFeatureVector *)self->_featureVector copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_timeIntervalSinceReferenceDate != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0) {
      goto LABEL_22;
    }
LABEL_16:
    char v5 = 0;
    goto LABEL_17;
  }
  if ((*((unsigned char *)v4 + 32) & 4) == 0) {
    goto LABEL_16;
  }
  if (!self->_engaged)
  {
    if (!*((unsigned char *)v4 + 28)) {
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  if (!*((unsigned char *)v4 + 28)) {
    goto LABEL_16;
  }
LABEL_22:
  featureVector = self->_featureVector;
  if ((unint64_t)featureVector | *((void *)v4 + 2)) {
    char v5 = -[ATXPBTaskAgnosticBehaviorFeatureVector isEqual:](featureVector, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
    double v6 = -timeIntervalSinceReferenceDate;
    if (timeIntervalSinceReferenceDate >= 0.0) {
      double v6 = self->_timeIntervalSinceReferenceDate;
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
    uint64_t v9 = 2654435761 * self->_type;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v10 = 0;
    return v9 ^ v4 ^ v10 ^ [(ATXPBTaskAgnosticBehaviorFeatureVector *)self->_featureVector hash];
  }
  uint64_t v9 = 0;
  if ((has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_engaged;
  return v9 ^ v4 ^ v10 ^ [(ATXPBTaskAgnosticBehaviorFeatureVector *)self->_featureVector hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  char v6 = *((unsigned char *)v4 + 32);
  if (v6)
  {
    self->_double timeIntervalSinceReferenceDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 32);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_type = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
LABEL_4:
    self->_engaged = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  featureVector = self->_featureVector;
  uint64_t v8 = v5[2];
  if (featureVector)
  {
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v9 = v5;
    featureVector = (ATXPBTaskAgnosticBehaviorFeatureVector *)-[ATXPBTaskAgnosticBehaviorFeatureVector mergeFrom:](featureVector, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v9 = v5;
    featureVector = (ATXPBTaskAgnosticBehaviorFeatureVector *)-[ATXPBTaskAgnosticBehaviorSample setFeatureVector:](self, "setFeatureVector:");
  }
  char v5 = v9;
LABEL_14:
  MEMORY[0x1F41817F8](featureVector, v5);
}

- (double)timeIntervalSinceReferenceDate
{
  return self->_timeIntervalSinceReferenceDate;
}

- (BOOL)engaged
{
  return self->_engaged;
}

- (ATXPBTaskAgnosticBehaviorFeatureVector)featureVector
{
  return self->_featureVector;
}

- (void)setFeatureVector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end