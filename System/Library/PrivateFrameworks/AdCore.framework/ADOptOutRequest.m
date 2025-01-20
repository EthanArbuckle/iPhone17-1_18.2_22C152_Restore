@interface ADOptOutRequest
+ (id)options;
- (BOOL)hasDPID;
- (BOOL)hasIAdID;
- (BOOL)hasOptedOutStatus;
- (BOOL)hasStatusChangeTimestamp;
- (BOOL)hasTimezone;
- (BOOL)hasTransmitTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)optedOutStatus;
- (BOOL)readFrom:(id)a3;
- (NSData)dPID;
- (NSData)iAdID;
- (double)statusChangeTimestamp;
- (double)transmitTimestamp;
- (float)timezone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDPID:(id)a3;
- (void)setHasOptedOutStatus:(BOOL)a3;
- (void)setHasStatusChangeTimestamp:(BOOL)a3;
- (void)setHasTimezone:(BOOL)a3;
- (void)setHasTransmitTimestamp:(BOOL)a3;
- (void)setIAdID:(id)a3;
- (void)setOptedOutStatus:(BOOL)a3;
- (void)setStatusChangeTimestamp:(double)a3;
- (void)setTimezone:(float)a3;
- (void)setTransmitTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ADOptOutRequest

+ (id)options
{
  if (options_once_3 != -1) {
    dispatch_once(&options_once_3, &__block_literal_global_6);
  }
  v2 = (void *)options_sOptions_3;
  return v2;
}

void __26__ADOptOutRequest_options__block_invoke()
{
  v0 = (void *)options_sOptions_3;
  options_sOptions_3 = (uint64_t)&unk_1F27154B0;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (void)setOptedOutStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_optedOutStatus = a3;
}

- (void)setHasOptedOutStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOptedOutStatus
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTransmitTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_transmitTimestamp = a3;
}

- (void)setHasTransmitTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTransmitTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStatusChangeTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_statusChangeTimestamp = a3;
}

- (void)setHasStatusChangeTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatusChangeTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimezone:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timezone = a3;
}

- (void)setHasTimezone:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimezone
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADOptOutRequest;
  v4 = [(ADOptOutRequest *)&v8 description];
  v5 = [(ADOptOutRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  iAdID = self->_iAdID;
  if (iAdID) {
    [v3 setObject:iAdID forKey:@"iAdID"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_optedOutStatus];
    [v5 setObject:v11 forKey:@"optedOutStatus"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v12 = [NSNumber numberWithDouble:self->_transmitTimestamp];
  [v5 setObject:v12 forKey:@"transmitTimestamp"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v13 = [NSNumber numberWithDouble:self->_statusChangeTimestamp];
  [v5 setObject:v13 forKey:@"statusChangeTimestamp"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    *(float *)&double v4 = self->_timezone;
    objc_super v8 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v8 forKey:@"timezone"];
  }
LABEL_8:
  dPID = self->_dPID;
  if (dPID) {
    [v5 setObject:dPID forKey:@"DPID"];
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return ADOptOutRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_iAdID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
LABEL_8:
  if (self->_dPID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_iAdID)
  {
    objc_msgSend(v4, "setIAdID:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)v4 + 44) = self->_optedOutStatus;
    *((unsigned char *)v4 + 48) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 2) = *(void *)&self->_transmitTimestamp;
  *((unsigned char *)v4 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((void *)v4 + 1) = *(void *)&self->_statusChangeTimestamp;
  *((unsigned char *)v4 + 48) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 10) = LODWORD(self->_timezone);
    *((unsigned char *)v4 + 48) |= 4u;
  }
LABEL_8:
  if (self->_dPID)
  {
    objc_msgSend(v6, "setDPID:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_iAdID copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v5 + 44) = self->_optedOutStatus;
    *(unsigned char *)(v5 + 48) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(double *)(v5 + 8) = self->_statusChangeTimestamp;
      *(unsigned char *)(v5 + 48) |= 1u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_transmitTimestamp;
  *(unsigned char *)(v5 + 48) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(float *)(v5 + 40) = self->_timezone;
    *(unsigned char *)(v5 + 48) |= 4u;
  }
LABEL_6:
  uint64_t v9 = [(NSData *)self->_dPID copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](iAdID, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) != 0)
    {
      if (self->_optedOutStatus)
      {
        if (!*((unsigned char *)v4 + 44)) {
          goto LABEL_29;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_12;
      }
    }
LABEL_29:
    char v7 = 0;
    goto LABEL_30;
  }
  if ((*((unsigned char *)v4 + 48) & 8) != 0) {
    goto LABEL_29;
  }
LABEL_12:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_transmitTimestamp != *((double *)v4 + 2)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_statusChangeTimestamp != *((double *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_timezone != *((float *)v4 + 10)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_29;
  }
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((void *)v4 + 3)) {
    char v7 = -[NSData isEqual:](dPID, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_30:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_iAdID hash];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_optedOutStatus;
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
  double transmitTimestamp = self->_transmitTimestamp;
  double v7 = -transmitTimestamp;
  if (transmitTimestamp >= 0.0) {
    double v7 = self->_transmitTimestamp;
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
  if (has)
  {
    double statusChangeTimestamp = self->_statusChangeTimestamp;
    double v13 = -statusChangeTimestamp;
    if (statusChangeTimestamp >= 0.0) {
      double v13 = self->_statusChangeTimestamp;
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
  if ((has & 4) != 0)
  {
    float timezone = self->_timezone;
    float v18 = -timezone;
    if (timezone >= 0.0) {
      float v18 = self->_timezone;
    }
    float v19 = floorf(v18 + 0.5);
    float v20 = (float)(v18 - v19) * 1.8447e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmodf(v19, 1.8447e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabsf(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v11 ^ v16 ^ [(NSData *)self->_dPID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[ADOptOutRequest setIAdID:](self, "setIAdID:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 8) != 0)
  {
    self->_optedOutStatus = *((unsigned char *)v4 + 44);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_double transmitTimestamp = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_double statusChangeTimestamp = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
LABEL_7:
    self->_float timezone = *((float *)v4 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_8:
  if (*((void *)v4 + 3))
  {
    -[ADOptOutRequest setDPID:](self, "setDPID:");
    id v4 = v6;
  }
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
}

- (BOOL)optedOutStatus
{
  return self->_optedOutStatus;
}

- (double)transmitTimestamp
{
  return self->_transmitTimestamp;
}

- (double)statusChangeTimestamp
{
  return self->_statusChangeTimestamp;
}

- (float)timezone
{
  return self->_timezone;
}

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
}

@end