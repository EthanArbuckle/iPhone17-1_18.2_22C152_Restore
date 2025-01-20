@interface CLPOutdoorUpdate
- (BOOL)hasConfidence;
- (BOOL)hasEstimatedStateProbabilityOutdoor;
- (BOOL)hasMctTimestamp;
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)estimatedStateProbabilityOutdoor;
- (double)mctTimestamp;
- (double)timestamp;
- (id)confidenceAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsConfidence:(id)a3;
- (int)StringAsType:(id)a3;
- (int)confidence;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(int)a3;
- (void)setEstimatedStateProbabilityOutdoor:(double)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasEstimatedStateProbabilityOutdoor:(BOOL)a3;
- (void)setHasMctTimestamp:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMctTimestamp:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPOutdoorUpdate

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setMctTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mctTimestamp = a3;
}

- (void)setEstimatedStateProbabilityOutdoor:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_estimatedStateProbabilityOutdoor = a3;
}

- (void)setConfidence:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_confidence = a3;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_6:
  }
    PBDataWriterWriteDoubleField();
LABEL_7:
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasMctTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMctTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6C36008[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"IndoorOutdoorTypeUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IndoorOutdoorTypeIndoor"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IndoorOutdoorTypeOutdoor"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"IndoorOutdoorTypeMax"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)confidence
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_confidence;
  }
  else {
    return 0;
  }
}

- (void)setHasConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasConfidence
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)confidenceAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6C36028[a3];
  }

  return v3;
}

- (int)StringAsConfidence:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"IndoorOutdoorConfidenceUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IndoorOutdoorConfidenceLow"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IndoorOutdoorConfidenceMedium"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"IndoorOutdoorConfidenceHigh"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setHasEstimatedStateProbabilityOutdoor:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEstimatedStateProbabilityOutdoor
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPOutdoorUpdate;
  int v4 = [(CLPOutdoorUpdate *)&v8 description];
  id v5 = [(CLPOutdoorUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_mctTimestamp];
  [v3 setObject:v8 forKey:@"mctTimestamp"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_12:
  uint64_t type = self->_type;
  if (type >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E6C36008[type];
  }
  [v3 setObject:v10 forKey:@"type"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_16:
  uint64_t confidence = self->_confidence;
  if (confidence >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_confidence);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E6C36028[confidence];
  }
  [v3 setObject:v12 forKey:@"confidence"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_6:
  id v5 = [NSNumber numberWithDouble:self->_estimatedStateProbabilityOutdoor];
  [v3 setObject:v5 forKey:@"estimatedStateProbabilityOutdoor"];

LABEL_7:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPOutdoorUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = *(void *)&self->_mctTimestamp;
  *((unsigned char *)v4 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)v4 + 9) = self->_type;
  *((unsigned char *)v4 + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((_DWORD *)v4 + 8) = self->_confidence;
  *((unsigned char *)v4 + 40) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    v4[1] = *(void *)&self->_estimatedStateProbabilityOutdoor;
    *((unsigned char *)v4 + 40) |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = *(void *)&self->_timestamp;
    *((unsigned char *)result + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = *(void *)&self->_mctTimestamp;
  *((unsigned char *)result + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 9) = self->_type;
  *((unsigned char *)result + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 8) = self->_confidence;
  *((unsigned char *)result + 40) |= 8u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_6:
  *((void *)result + 1) = *(void *)&self->_estimatedStateProbabilityOutdoor;
  *((unsigned char *)result + 40) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_timestamp != *((double *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_mctTimestamp != *((double *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 9)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_confidence != *((_DWORD *)v4 + 8)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_estimatedStateProbabilityOutdoor != *((double *)v4 + 1)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double timestamp = self->_timestamp;
    double v6 = -timestamp;
    if (timestamp >= 0.0) {
      double v6 = self->_timestamp;
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
    double mctTimestamp = self->_mctTimestamp;
    double v11 = -mctTimestamp;
    if (mctTimestamp >= 0.0) {
      double v11 = self->_mctTimestamp;
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
  if ((has & 0x10) == 0)
  {
    uint64_t v14 = 0;
    if ((has & 8) != 0) {
      goto LABEL_19;
    }
LABEL_25:
    uint64_t v15 = 0;
    if (has) {
      goto LABEL_20;
    }
LABEL_26:
    unint64_t v20 = 0;
    return v9 ^ v4 ^ v14 ^ v15 ^ v20;
  }
  uint64_t v14 = 2654435761 * self->_type;
  if ((has & 8) == 0) {
    goto LABEL_25;
  }
LABEL_19:
  uint64_t v15 = 2654435761 * self->_confidence;
  if ((has & 1) == 0) {
    goto LABEL_26;
  }
LABEL_20:
  double estimatedStateProbabilityOutdoor = self->_estimatedStateProbabilityOutdoor;
  double v17 = -estimatedStateProbabilityOutdoor;
  if (estimatedStateProbabilityOutdoor >= 0.0) {
    double v17 = self->_estimatedStateProbabilityOutdoor;
  }
  long double v18 = floor(v17 + 0.5);
  double v19 = (v17 - v18) * 1.84467441e19;
  unint64_t v20 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
  if (v19 >= 0.0)
  {
    if (v19 > 0.0) {
      v20 += (unint64_t)v19;
    }
  }
  else
  {
    v20 -= (unint64_t)fabs(v19);
  }
  return v9 ^ v4 ^ v14 ^ v15 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_double timestamp = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_double mctTimestamp = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_uint64_t type = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_uint64_t confidence = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 8u;
  if (*((unsigned char *)v4 + 40))
  {
LABEL_6:
    self->_double estimatedStateProbabilityOutdoor = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
}

- (double)mctTimestamp
{
  return self->_mctTimestamp;
}

- (double)estimatedStateProbabilityOutdoor
{
  return self->_estimatedStateProbabilityOutdoor;
}

@end