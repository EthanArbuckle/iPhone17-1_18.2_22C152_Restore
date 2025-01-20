@interface KCellularGsmIdleScellMeasurement
- (BOOL)hasCurrentAntenna;
- (BOOL)hasIdleRxlevDBm;
- (BOOL)hasScellArfcn;
- (BOOL)hasSimplifiedL1State;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)idleRxlevDBm;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)currentAntenna;
- (unsigned)scellArfcn;
- (unsigned)simplifiedL1State;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentAntenna:(unsigned int)a3;
- (void)setHasCurrentAntenna:(BOOL)a3;
- (void)setHasIdleRxlevDBm:(BOOL)a3;
- (void)setHasScellArfcn:(BOOL)a3;
- (void)setHasSimplifiedL1State:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIdleRxlevDBm:(int)a3;
- (void)setScellArfcn:(unsigned int)a3;
- (void)setSimplifiedL1State:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularGsmIdleScellMeasurement

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScellArfcn:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_scellArfcn = a3;
}

- (void)setHasScellArfcn:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasScellArfcn
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSimplifiedL1State:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_simplifiedL1State = a3;
}

- (void)setHasSimplifiedL1State:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSimplifiedL1State
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCurrentAntenna:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_currentAntenna = a3;
}

- (void)setHasCurrentAntenna:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCurrentAntenna
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIdleRxlevDBm:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_idleRxlevDBm = a3;
}

- (void)setHasIdleRxlevDBm:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIdleRxlevDBm
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularGsmIdleScellMeasurement;
  char v3 = [(KCellularGsmIdleScellMeasurement *)&v7 description];
  v4 = [(KCellularGsmIdleScellMeasurement *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_scellArfcn];
  [v3 setObject:v8 forKey:@"scell_arfcn"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v9 = +[NSNumber numberWithUnsignedInt:self->_simplifiedL1State];
  [v3 setObject:v9 forKey:@"simplified_l1_state"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = +[NSNumber numberWithUnsignedInt:self->_currentAntenna];
  [v3 setObject:v10 forKey:@"current_antenna"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v11 = +[NSNumber numberWithInt:self->_idleRxlevDBm];
  [v3 setObject:v11 forKey:@"idle_rxlev_dBm"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v5 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v5 forKey:@"subs_id"];
  }
LABEL_8:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100089B98((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteSint32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_scellArfcn;
  *((unsigned char *)v4 + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v4 + 7) = self->_simplifiedL1State;
  *((unsigned char *)v4 + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 4) = self->_currentAntenna;
  *((unsigned char *)v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((_DWORD *)v4 + 5) = self->_idleRxlevDBm;
  *((unsigned char *)v4 + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 8) = self->_subsId;
    *((unsigned char *)v4 + 36) |= 0x20u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_scellArfcn;
  *((unsigned char *)result + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 7) = self->_simplifiedL1State;
  *((unsigned char *)result + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 4) = self->_currentAntenna;
  *((unsigned char *)result + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 5) = self->_idleRxlevDBm;
  *((unsigned char *)result + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 8) = self->_subsId;
  *((unsigned char *)result + 36) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_31:
    BOOL v5 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_scellArfcn != *((_DWORD *)v4 + 6)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0 || self->_simplifiedL1State != *((_DWORD *)v4 + 7)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_currentAntenna != *((_DWORD *)v4 + 4)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_idleRxlevDBm != *((_DWORD *)v4 + 5)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_31;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 8)) {
      goto LABEL_31;
    }
    BOOL v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_scellArfcn;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_simplifiedL1State;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_currentAntenna;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_idleRxlevDBm;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_subsId;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_scellArfcn = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_simplifiedL1State = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_currentAntenna = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_idleRxlevDBm = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 36) & 0x20) != 0)
  {
LABEL_7:
    self->_subsId = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_8:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)scellArfcn
{
  return self->_scellArfcn;
}

- (unsigned)simplifiedL1State
{
  return self->_simplifiedL1State;
}

- (unsigned)currentAntenna
{
  return self->_currentAntenna;
}

- (int)idleRxlevDBm
{
  return self->_idleRxlevDBm;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end