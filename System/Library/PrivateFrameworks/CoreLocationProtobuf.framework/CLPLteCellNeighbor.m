@interface CLPLteCellNeighbor
- (BOOL)hasBandwidth;
- (BOOL)hasEcn0;
- (BOOL)hasMaxThroughput;
- (BOOL)hasNeighborType;
- (BOOL)hasPid;
- (BOOL)hasRscp;
- (BOOL)hasRssi;
- (BOOL)hasUarfcn;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)ecn0;
- (int)pid;
- (int)rscp;
- (int)rssi;
- (int)uarfcn;
- (unint64_t)hash;
- (unsigned)bandwidth;
- (unsigned)maxThroughput;
- (unsigned)neighborType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBandwidth:(unsigned int)a3;
- (void)setEcn0:(int)a3;
- (void)setHasBandwidth:(BOOL)a3;
- (void)setHasEcn0:(BOOL)a3;
- (void)setHasMaxThroughput:(BOOL)a3;
- (void)setHasNeighborType:(BOOL)a3;
- (void)setHasPid:(BOOL)a3;
- (void)setHasRscp:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setHasUarfcn:(BOOL)a3;
- (void)setMaxThroughput:(unsigned int)a3;
- (void)setNeighborType:(unsigned int)a3;
- (void)setPid:(int)a3;
- (void)setRscp:(int)a3;
- (void)setRssi:(int)a3;
- (void)setUarfcn:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLteCellNeighbor

- (void)setUarfcn:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_uarfcn = a3;
}

- (void)setHasUarfcn:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasUarfcn
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setPid:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_pid = a3;
}

- (void)setHasPid:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPid
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setRssi:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRssi
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setEcn0:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_ecn0 = a3;
}

- (void)setHasEcn0:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEcn0
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRscp:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRscp
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setBandwidth:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bandwidth = a3;
}

- (void)setHasBandwidth:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBandwidth
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNeighborType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_neighborType = a3;
}

- (void)setHasNeighborType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNeighborType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMaxThroughput:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_maxThroughput = a3;
}

- (void)setHasMaxThroughput:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxThroughput
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLteCellNeighbor;
  v4 = [(CLPLteCellNeighbor *)&v8 description];
  v5 = [(CLPLteCellNeighbor *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has < 0)
  {
    v7 = [NSNumber numberWithInt:self->_uarfcn];
    [v3 setObject:v7 forKey:@"uarfcn"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithInt:self->_pid];
  [v3 setObject:v8 forKey:@"pid"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v9 = [NSNumber numberWithInt:self->_rssi];
  [v3 setObject:v9 forKey:@"rssi"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v10 = [NSNumber numberWithInt:self->_ecn0];
  [v3 setObject:v10 forKey:@"ecn0"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v11 = [NSNumber numberWithInt:self->_rscp];
  [v3 setObject:v11 forKey:@"rscp"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v12 = [NSNumber numberWithUnsignedInt:self->_bandwidth];
  [v3 setObject:v12 forKey:@"bandwidth"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  v13 = [NSNumber numberWithUnsignedInt:self->_neighborType];
  [v3 setObject:v13 forKey:@"neighborType"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    v5 = [NSNumber numberWithUnsignedInt:self->_maxThroughput];
    [v3 setObject:v5 forKey:@"maxThroughput"];
  }
LABEL_10:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLteCellNeighborReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has < 0)
  {
    PBDataWriterWriteSint32Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteSint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteSint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteSint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_9:
  }
    PBDataWriterWriteUint32Field();
LABEL_10:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has < 0)
  {
    v4[9] = self->_uarfcn;
    *((unsigned char *)v4 + 40) |= 0x80u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_pid;
  *((unsigned char *)v4 + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[8] = self->_rssi;
  *((unsigned char *)v4 + 40) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[3] = self->_ecn0;
  *((unsigned char *)v4 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[7] = self->_rscp;
  *((unsigned char *)v4 + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[2] = self->_bandwidth;
  *((unsigned char *)v4 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  v4[5] = self->_neighborType;
  *((unsigned char *)v4 + 40) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    v4[4] = self->_maxThroughput;
    *((unsigned char *)v4 + 40) |= 4u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has < 0)
  {
    *((_DWORD *)result + 9) = self->_uarfcn;
    *((unsigned char *)result + 40) |= 0x80u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_pid;
  *((unsigned char *)result + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 8) = self->_rssi;
  *((unsigned char *)result + 40) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 3) = self->_ecn0;
  *((unsigned char *)result + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 7) = self->_rscp;
  *((unsigned char *)result + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 2) = self->_bandwidth;
  *((unsigned char *)result + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 5) = self->_neighborType;
  *((unsigned char *)result + 40) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_9:
  *((_DWORD *)result + 4) = self->_maxThroughput;
  *((unsigned char *)result + 40) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  $E9045A7D2FDECF7A39A6CA852734FC8F has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x80) == 0 || self->_uarfcn != *((_DWORD *)v4 + 9)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x80) != 0)
  {
LABEL_41:
    BOOL v6 = 0;
    goto LABEL_42;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) == 0 || self->_pid != *((_DWORD *)v4 + 6)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x40) == 0 || self->_rssi != *((_DWORD *)v4 + 8)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x40) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_ecn0 != *((_DWORD *)v4 + 3)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x20) == 0 || self->_rscp != *((_DWORD *)v4 + 7)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  if (*(unsigned char *)&has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_bandwidth != *((_DWORD *)v4 + 2)) {
      goto LABEL_41;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_neighborType != *((_DWORD *)v4 + 5)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_41;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 4) == 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_maxThroughput != *((_DWORD *)v4 + 4)) {
      goto LABEL_41;
    }
    BOOL v6 = 1;
  }
LABEL_42:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    uint64_t v2 = 2654435761 * self->_uarfcn;
    if ((*(unsigned char *)&self->_has & 0x10) == 0)
    {
LABEL_3:
      uint64_t v3 = 0;
      if ((*(unsigned char *)&self->_has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 2654435761 * self->_pid;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_rssi;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_ecn0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_rscp;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_bandwidth;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_neighborType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_maxThroughput;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if (v5 < 0)
  {
    self->_uarfcn = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 0x80u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_pid = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_rssi = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_ecn0 = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_rscp = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_bandwidth = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  self->_neighborType = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_9:
    self->_maxThroughput = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_10:
}

- (int)uarfcn
{
  return self->_uarfcn;
}

- (int)pid
{
  return self->_pid;
}

- (int)rssi
{
  return self->_rssi;
}

- (int)ecn0
{
  return self->_ecn0;
}

- (int)rscp
{
  return self->_rscp;
}

- (unsigned)bandwidth
{
  return self->_bandwidth;
}

- (unsigned)neighborType
{
  return self->_neighborType;
}

- (unsigned)maxThroughput
{
  return self->_maxThroughput;
}

@end