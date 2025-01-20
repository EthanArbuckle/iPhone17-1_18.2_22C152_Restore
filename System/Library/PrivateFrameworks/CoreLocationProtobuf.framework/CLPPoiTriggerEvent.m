@interface CLPPoiTriggerEvent
- (BOOL)hasProviderIdentifier;
- (BOOL)hasTriggerSubType;
- (BOOL)hasTriggerTimestamp;
- (BOOL)hasTriggerType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)triggerTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)triggerTypeAsString:(int)a3;
- (int)StringAsTriggerType:(id)a3;
- (int)providerIdentifier;
- (int)triggerSubType;
- (int)triggerType;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasProviderIdentifier:(BOOL)a3;
- (void)setHasTriggerSubType:(BOOL)a3;
- (void)setHasTriggerTimestamp:(BOOL)a3;
- (void)setHasTriggerType:(BOOL)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setProviderIdentifier:(int)a3;
- (void)setTriggerSubType:(int)a3;
- (void)setTriggerTimestamp:(double)a3;
- (void)setTriggerType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPPoiTriggerEvent

- (void)setProviderIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_providerIdentifier = a3;
}

- (void)setHasProviderIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProviderIdentifier
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)triggerType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_triggerType;
  }
  else {
    return 0;
  }
}

- (void)setTriggerType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_triggerType = a3;
}

- (void)setHasTriggerType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTriggerType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)triggerTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6C36090[a3];
  }

  return v3;
}

- (int)StringAsTriggerType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Type_Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Passbook"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Visit"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VisitSettled"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Review"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setTriggerTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_triggerTimestamp = a3;
}

- (void)setHasTriggerTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTriggerTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTriggerSubType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_triggerSubType = a3;
}

- (void)setHasTriggerSubType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTriggerSubType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPPoiTriggerEvent;
  int v4 = [(CLPPoiTriggerEvent *)&v8 description];
  v5 = [(CLPPoiTriggerEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = [NSNumber numberWithUnsignedLongLong:self->_muid];
  [v3 setObject:v4 forKey:@"muid"];

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_providerIdentifier];
    [v3 setObject:v8 forKey:@"providerIdentifier"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  uint64_t triggerType = self->_triggerType;
  if (triggerType >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_triggerType);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E6C36090[triggerType];
  }
  [v3 setObject:v10 forKey:@"triggerType"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_14:
  v11 = [NSNumber numberWithDouble:self->_triggerTimestamp];
  [v3 setObject:v11 forKey:@"triggerTimestamp"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v6 = [NSNumber numberWithInt:self->_triggerSubType];
    [v3 setObject:v6 forKey:@"triggerSubType"];
  }
LABEL_6:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPoiTriggerEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  v4[1] = self->_muid;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_providerIdentifier;
    *((unsigned char *)v4 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 8) = self->_triggerType;
  *((unsigned char *)v4 + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[2] = *(void *)&self->_triggerTimestamp;
  *((unsigned char *)v4 + 36) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 7) = self->_triggerSubType;
    *((unsigned char *)v4 + 36) |= 4u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = self->_muid;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 6) = self->_providerIdentifier;
    *((unsigned char *)result + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_triggerType;
  *((unsigned char *)result + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((void *)result + 2) = *(void *)&self->_triggerTimestamp;
  *((unsigned char *)result + 36) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 7) = self->_triggerSubType;
  *((unsigned char *)result + 36) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_muid != *((void *)v4 + 1)) {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_providerIdentifier != *((_DWORD *)v4 + 6)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_22:
    BOOL v5 = 0;
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_triggerType != *((_DWORD *)v4 + 8)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_triggerTimestamp != *((double *)v4 + 2)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_22;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_triggerSubType != *((_DWORD *)v4 + 7)) {
      goto LABEL_22;
    }
    BOOL v5 = 1;
  }
LABEL_23:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_providerIdentifier;
  }
  else {
    uint64_t v4 = 0;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v5 = 2654435761 * self->_triggerType;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t muid = self->_muid;
  if (*(unsigned char *)&self->_has)
  {
    double triggerTimestamp = self->_triggerTimestamp;
    double v9 = -triggerTimestamp;
    if (triggerTimestamp >= 0.0) {
      double v9 = self->_triggerTimestamp;
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
  if ((has & 4) != 0) {
    uint64_t v12 = 2654435761 * self->_triggerSubType;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v5 ^ v7 ^ v12 ^ (2654435761u * muid);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unint64_t muid = *((void *)v4 + 1);
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_providerIdentifier = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t triggerType = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_double triggerTimestamp = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
LABEL_5:
    self->_triggerSubType = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_6:
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_unint64_t muid = a3;
}

- (int)providerIdentifier
{
  return self->_providerIdentifier;
}

- (double)triggerTimestamp
{
  return self->_triggerTimestamp;
}

- (int)triggerSubType
{
  return self->_triggerSubType;
}

@end