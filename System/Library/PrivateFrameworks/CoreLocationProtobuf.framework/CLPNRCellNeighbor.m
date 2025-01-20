@interface CLPNRCellNeighbor
- (BOOL)hasBandwidth;
- (BOOL)hasBwpSupport;
- (BOOL)hasEcn0;
- (BOOL)hasMaxThroughput;
- (BOOL)hasNeighborType;
- (BOOL)hasNrarfcn;
- (BOOL)hasPid;
- (BOOL)hasRscp;
- (BOOL)hasRssi;
- (BOOL)hasSaOrNsaNeighbor;
- (BOOL)hasScs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)ecn0;
- (int)nrarfcn;
- (int)pid;
- (int)rscp;
- (int)rssi;
- (unint64_t)hash;
- (unsigned)bandwidth;
- (unsigned)bwpSupport;
- (unsigned)maxThroughput;
- (unsigned)neighborType;
- (unsigned)saOrNsaNeighbor;
- (unsigned)scs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBandwidth:(unsigned int)a3;
- (void)setBwpSupport:(unsigned int)a3;
- (void)setEcn0:(int)a3;
- (void)setHasBandwidth:(BOOL)a3;
- (void)setHasBwpSupport:(BOOL)a3;
- (void)setHasEcn0:(BOOL)a3;
- (void)setHasMaxThroughput:(BOOL)a3;
- (void)setHasNeighborType:(BOOL)a3;
- (void)setHasNrarfcn:(BOOL)a3;
- (void)setHasPid:(BOOL)a3;
- (void)setHasRscp:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setHasSaOrNsaNeighbor:(BOOL)a3;
- (void)setHasScs:(BOOL)a3;
- (void)setMaxThroughput:(unsigned int)a3;
- (void)setNeighborType:(unsigned int)a3;
- (void)setNrarfcn:(int)a3;
- (void)setPid:(int)a3;
- (void)setRscp:(int)a3;
- (void)setRssi:(int)a3;
- (void)setSaOrNsaNeighbor:(unsigned int)a3;
- (void)setScs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPNRCellNeighbor

- (void)setNrarfcn:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_nrarfcn = a3;
}

- (void)setHasNrarfcn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNrarfcn
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPid:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_pid = a3;
}

- (void)setHasPid:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPid
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRssi
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setEcn0:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ecn0 = a3;
}

- (void)setHasEcn0:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEcn0
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRscp:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRscp
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setScs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_scs = a3;
}

- (void)setHasScs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasScs
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSaOrNsaNeighbor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_saOrNsaNeighbor = a3;
}

- (void)setHasSaOrNsaNeighbor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSaOrNsaNeighbor
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setBandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bandwidth = a3;
}

- (void)setHasBandwidth:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBandwidth
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNeighborType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_neighborType = a3;
}

- (void)setHasNeighborType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNeighborType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setMaxThroughput:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_maxThroughput = a3;
}

- (void)setHasMaxThroughput:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMaxThroughput
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setBwpSupport:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bwpSupport = a3;
}

- (void)setHasBwpSupport:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBwpSupport
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPNRCellNeighbor;
  v4 = [(CLPNRCellNeighbor *)&v8 description];
  v5 = [(CLPNRCellNeighbor *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    v7 = [NSNumber numberWithInt:self->_nrarfcn];
    [v3 setObject:v7 forKey:@"nrarfcn"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithInt:self->_pid];
  [v3 setObject:v8 forKey:@"pid"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v9 = [NSNumber numberWithInt:self->_rssi];
  [v3 setObject:v9 forKey:@"rssi"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v10 = [NSNumber numberWithInt:self->_ecn0];
  [v3 setObject:v10 forKey:@"ecn0"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  v11 = [NSNumber numberWithInt:self->_rscp];
  [v3 setObject:v11 forKey:@"rscp"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  v12 = [NSNumber numberWithUnsignedInt:self->_scs];
  [v3 setObject:v12 forKey:@"scs"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  v13 = [NSNumber numberWithUnsignedInt:self->_saOrNsaNeighbor];
  [v3 setObject:v13 forKey:@"saOrNsaNeighbor"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  v14 = [NSNumber numberWithUnsignedInt:self->_bandwidth];
  [v3 setObject:v14 forKey:@"bandwidth"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  v15 = [NSNumber numberWithUnsignedInt:self->_neighborType];
  [v3 setObject:v15 forKey:@"neighborType"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  v16 = [NSNumber numberWithUnsignedInt:self->_maxThroughput];
  [v3 setObject:v16 forKey:@"maxThroughput"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_12:
    v5 = [NSNumber numberWithUnsignedInt:self->_bwpSupport];
    [v3 setObject:v5 forKey:@"bwpSupport"];
  }
LABEL_13:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPNRCellNeighborReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteSint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 2) != 0) {
LABEL_12:
  }
    PBDataWriterWriteUint32Field();
LABEL_13:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[7] = self->_nrarfcn;
    *((_WORD *)v4 + 26) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v4[8] = self->_pid;
  *((_WORD *)v4 + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[10] = self->_rssi;
  *((_WORD *)v4 + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[4] = self->_ecn0;
  *((_WORD *)v4 + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[9] = self->_rscp;
  *((_WORD *)v4 + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  v4[12] = self->_scs;
  *((_WORD *)v4 + 26) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[11] = self->_saOrNsaNeighbor;
  *((_WORD *)v4 + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  v4[2] = self->_bandwidth;
  *((_WORD *)v4 + 26) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[6] = self->_neighborType;
  *((_WORD *)v4 + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  v4[5] = self->_maxThroughput;
  *((_WORD *)v4 + 26) |= 8u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_12:
    v4[3] = self->_bwpSupport;
    *((_WORD *)v4 + 26) |= 2u;
  }
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)result + 7) = self->_nrarfcn;
    *((_WORD *)result + 26) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_pid;
  *((_WORD *)result + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 10) = self->_rssi;
  *((_WORD *)result + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 4) = self->_ecn0;
  *((_WORD *)result + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 9) = self->_rscp;
  *((_WORD *)result + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 12) = self->_scs;
  *((_WORD *)result + 26) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 11) = self->_saOrNsaNeighbor;
  *((_WORD *)result + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 2) = self->_bandwidth;
  *((_WORD *)result + 26) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 6) = self->_neighborType;
  *((_WORD *)result + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_12;
  }
LABEL_23:
  *((_DWORD *)result + 5) = self->_maxThroughput;
  *((_WORD *)result + 26) |= 8u;
  if ((*(_WORD *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_12:
  *((_DWORD *)result + 3) = self->_bwpSupport;
  *((_WORD *)result + 26) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 26);
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_nrarfcn != *((_DWORD *)v4 + 7)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
LABEL_57:
    BOOL v7 = 0;
    goto LABEL_58;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_pid != *((_DWORD *)v4 + 8)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0 || self->_rssi != *((_DWORD *)v4 + 10)) {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_ecn0 != *((_DWORD *)v4 + 4)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_rscp != *((_DWORD *)v4 + 9)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x400) == 0 || self->_scs != *((_DWORD *)v4 + 12)) {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x200) == 0 || self->_saOrNsaNeighbor != *((_DWORD *)v4 + 11)) {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x200) != 0)
  {
    goto LABEL_57;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_bandwidth != *((_DWORD *)v4 + 2)) {
      goto LABEL_57;
    }
  }
  else if (v6)
  {
    goto LABEL_57;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_neighborType != *((_DWORD *)v4 + 6)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_maxThroughput != *((_DWORD *)v4 + 5)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_bwpSupport != *((_DWORD *)v4 + 3)) {
      goto LABEL_57;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 2) == 0;
  }
LABEL_58:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t v3 = 2654435761 * self->_nrarfcn;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_pid;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_rssi;
    if ((has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_ecn0;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_rscp;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_scs;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_saOrNsaNeighbor;
    if (has) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v9 = 0;
  if (has)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_bandwidth;
    if ((has & 0x10) != 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v10 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_neighborType;
    if ((has & 8) != 0) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v12 = 0;
    if ((has & 2) != 0) {
      goto LABEL_12;
    }
LABEL_23:
    uint64_t v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  uint64_t v11 = 0;
  if ((has & 8) == 0) {
    goto LABEL_22;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_maxThroughput;
  if ((has & 2) == 0) {
    goto LABEL_23;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_bwpSupport;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x20) != 0)
  {
    self->_nrarfcn = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v5 = *((_WORD *)v4 + 26);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_pid = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_rssi = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_ecn0 = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_rscp = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x400) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_scs = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_saOrNsaNeighbor = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 1) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_bandwidth = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_neighborType = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  self->_maxThroughput = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 26) & 2) != 0)
  {
LABEL_12:
    self->_bwpSupport = *((_DWORD *)v4 + 3);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_13:
}

- (int)nrarfcn
{
  return self->_nrarfcn;
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

- (unsigned)scs
{
  return self->_scs;
}

- (unsigned)saOrNsaNeighbor
{
  return self->_saOrNsaNeighbor;
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

- (unsigned)bwpSupport
{
  return self->_bwpSupport;
}

@end