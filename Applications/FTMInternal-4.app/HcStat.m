@interface HcStat
- (BOOL)hasCompType;
- (BOOL)hasFailureFoOrScStatePpt;
- (BOOL)hasFailureIrStatePpt;
- (BOOL)hasFailureSoOrFcStatePpt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)compType;
- (unsigned)failureFoOrScStatePpt;
- (unsigned)failureIrStatePpt;
- (unsigned)failureSoOrFcStatePpt;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompType:(unsigned int)a3;
- (void)setFailureFoOrScStatePpt:(unsigned int)a3;
- (void)setFailureIrStatePpt:(unsigned int)a3;
- (void)setFailureSoOrFcStatePpt:(unsigned int)a3;
- (void)setHasCompType:(BOOL)a3;
- (void)setHasFailureFoOrScStatePpt:(BOOL)a3;
- (void)setHasFailureIrStatePpt:(BOOL)a3;
- (void)setHasFailureSoOrFcStatePpt:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HcStat

- (void)setCompType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_compType = a3;
}

- (void)setHasCompType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFailureIrStatePpt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_failureIrStatePpt = a3;
}

- (void)setHasFailureIrStatePpt:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFailureIrStatePpt
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFailureFoOrScStatePpt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_failureFoOrScStatePpt = a3;
}

- (void)setHasFailureFoOrScStatePpt:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFailureFoOrScStatePpt
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFailureSoOrFcStatePpt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_failureSoOrFcStatePpt = a3;
}

- (void)setHasFailureSoOrFcStatePpt:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFailureSoOrFcStatePpt
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)HcStat;
  char v3 = [(HcStat *)&v7 description];
  v4 = [(HcStat *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_compType];
    [v3 setObject:v7 forKey:@"comp_type"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_failureIrStatePpt];
  [v3 setObject:v8 forKey:@"failure_ir_state_ppt"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = +[NSNumber numberWithUnsignedInt:self->_failureFoOrScStatePpt];
  [v3 setObject:v9 forKey:@"failure_fo_or_sc_state_ppt"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = +[NSNumber numberWithUnsignedInt:self->_failureSoOrFcStatePpt];
    [v3 setObject:v5 forKey:@"failure_so_or_fc_state_ppt"];
  }
LABEL_6:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000F3B24((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_compType;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_failureIrStatePpt;
  *((unsigned char *)v4 + 24) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[3] = self->_failureFoOrScStatePpt;
  *((unsigned char *)v4 + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v4[5] = self->_failureSoOrFcStatePpt;
    *((unsigned char *)v4 + 24) |= 8u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_compType;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_failureIrStatePpt;
  *((unsigned char *)result + 24) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 3) = self->_failureFoOrScStatePpt;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 5) = self->_failureSoOrFcStatePpt;
  *((unsigned char *)result + 24) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_compType != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_failureIrStatePpt != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_failureFoOrScStatePpt != *((_DWORD *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0 || self->_failureSoOrFcStatePpt != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_compType;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_failureIrStatePpt;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_failureFoOrScStatePpt;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_failureSoOrFcStatePpt;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_compType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_failureIrStatePpt = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_failureFoOrScStatePpt = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
LABEL_5:
    self->_failureSoOrFcStatePpt = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
}

- (unsigned)compType
{
  return self->_compType;
}

- (unsigned)failureIrStatePpt
{
  return self->_failureIrStatePpt;
}

- (unsigned)failureFoOrScStatePpt
{
  return self->_failureFoOrScStatePpt;
}

- (unsigned)failureSoOrFcStatePpt
{
  return self->_failureSoOrFcStatePpt;
}

@end