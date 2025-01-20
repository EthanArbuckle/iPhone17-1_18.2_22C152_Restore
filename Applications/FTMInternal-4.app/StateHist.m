@interface StateHist
- (BOOL)hasInStateCount;
- (BOOL)hasInStateMs;
- (BOOL)hasRrcState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rrcStateAsString:(int)a3;
- (int)StringAsRrcState:(id)a3;
- (int)rrcState;
- (unint64_t)hash;
- (unsigned)inStateCount;
- (unsigned)inStateMs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasInStateCount:(BOOL)a3;
- (void)setHasInStateMs:(BOOL)a3;
- (void)setHasRrcState:(BOOL)a3;
- (void)setInStateCount:(unsigned int)a3;
- (void)setInStateMs:(unsigned int)a3;
- (void)setRrcState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation StateHist

- (int)rrcState
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_rrcState;
  }
  else {
    return 0;
  }
}

- (void)setRrcState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_rrcState = a3;
}

- (void)setHasRrcState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRrcState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)rrcStateAsString:(int)a3
{
  if (a3 >= 9)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_1002884E0[a3];
  }

  return v3;
}

- (int)StringAsRrcState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LTE_RRC_INACTIVE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LTE_RRC_IDLE_NOT_CAMPED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LTE_RRC_IDLE_CAMPED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LTE_RRC_CONNECTING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LTE_RRC_CONNECTED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LTE_RRC_SUSPENDED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LTE_RRC_IRAT_TO_LTE_STARTED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LTE_RRC_CLOSING"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LTE_RRC_MAX_STATE"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setInStateCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_inStateCount = a3;
}

- (void)setHasInStateCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInStateCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInStateMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_inStateMs = a3;
}

- (void)setHasInStateMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInStateMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)StateHist;
  char v3 = [(StateHist *)&v7 description];
  int v4 = [(StateHist *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t rrcState = self->_rrcState;
    if (rrcState >= 9)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_rrcState];
    }
    else
    {
      v6 = off_1002884E0[rrcState];
    }
    [v3 setObject:v6 forKey:@"rrc_state"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_inStateCount];
    [v3 setObject:v7 forKey:@"in_state_count"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = +[NSNumber numberWithUnsignedInt:self->_inStateMs];
    [v3 setObject:v8 forKey:@"in_state_ms"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10012B5E0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[4] = self->_rrcState;
    *((unsigned char *)v4 + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_inStateCount;
  *((unsigned char *)v4 + 20) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[3] = self->_inStateMs;
    *((unsigned char *)v4 + 20) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_rrcState;
    *((unsigned char *)result + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_inStateCount;
  *((unsigned char *)result + 20) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 3) = self->_inStateMs;
  *((unsigned char *)result + 20) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_rrcState != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_inStateCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_inStateMs != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_rrcState;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_inStateCount;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_inStateMs;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 4) != 0)
  {
    self->_uint64_t rrcState = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_inStateCount = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
LABEL_4:
    self->_inStateMs = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (unsigned)inStateCount
{
  return self->_inStateCount;
}

- (unsigned)inStateMs
{
  return self->_inStateMs;
}

@end