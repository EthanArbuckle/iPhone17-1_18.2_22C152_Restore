@interface SecondaryComponentCarrier
- (BOOL)hasDlBandwidth;
- (BOOL)hasDlEarfcn;
- (BOOL)hasDlRfBand;
- (BOOL)hasHasUplink;
- (BOOL)hasIndex;
- (BOOL)hasPci;
- (BOOL)hasRsrp;
- (BOOL)hasRsrq;
- (BOOL)hasRssi;
- (BOOL)hasSnr;
- (BOOL)hasState;
- (BOOL)hasUlBandwidth;
- (BOOL)hasUlEarfcn;
- (BOOL)hasUlRfBand;
- (BOOL)hasUplink;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stateAsString:(int)a3;
- (int)StringAsState:(id)a3;
- (int)rsrp;
- (int)rsrq;
- (int)rssi;
- (int)snr;
- (int)state;
- (unint64_t)hash;
- (unsigned)dlBandwidth;
- (unsigned)dlEarfcn;
- (unsigned)dlRfBand;
- (unsigned)index;
- (unsigned)pci;
- (unsigned)ulBandwidth;
- (unsigned)ulEarfcn;
- (unsigned)ulRfBand;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDlBandwidth:(unsigned int)a3;
- (void)setDlEarfcn:(unsigned int)a3;
- (void)setDlRfBand:(unsigned int)a3;
- (void)setHasDlBandwidth:(BOOL)a3;
- (void)setHasDlEarfcn:(BOOL)a3;
- (void)setHasDlRfBand:(BOOL)a3;
- (void)setHasHasUplink:(BOOL)a3;
- (void)setHasIndex:(BOOL)a3;
- (void)setHasPci:(BOOL)a3;
- (void)setHasRsrp:(BOOL)a3;
- (void)setHasRsrq:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setHasSnr:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasUlBandwidth:(BOOL)a3;
- (void)setHasUlEarfcn:(BOOL)a3;
- (void)setHasUlRfBand:(BOOL)a3;
- (void)setHasUplink:(BOOL)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setPci:(unsigned int)a3;
- (void)setRsrp:(int)a3;
- (void)setRsrq:(int)a3;
- (void)setRssi:(int)a3;
- (void)setSnr:(int)a3;
- (void)setState:(int)a3;
- (void)setUlBandwidth:(unsigned int)a3;
- (void)setUlEarfcn:(unsigned int)a3;
- (void)setUlRfBand:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SecondaryComponentCarrier

- (void)setIndex:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_index = a3;
}

- (void)setHasIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIndex
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)state
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_state;
  }
  else {
    return 0;
  }
}

- (void)setState:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasState
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 3)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100287820 + a3);
  }

  return v3;
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SCC_STATE_DECONFIGURED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SCC_STATE_CONFIGURED_DEACTIVATED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SCC_STATE_ACTIVATED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPci:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_pci = a3;
}

- (void)setHasPci:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPci
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDlEarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_dlEarfcn = a3;
}

- (void)setHasDlEarfcn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDlEarfcn
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setDlRfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_dlRfBand = a3;
}

- (void)setHasDlRfBand:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDlRfBand
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDlBandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_dlBandwidth = a3;
}

- (void)setHasDlBandwidth:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDlBandwidth
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasUplink:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_hasUplink = a3;
}

- (void)setHasHasUplink:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasHasUplink
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setUlEarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_ulEarfcn = a3;
}

- (void)setHasUlEarfcn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUlEarfcn
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setUlRfBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_ulRfBand = a3;
}

- (void)setHasUlRfBand:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasUlRfBand
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setUlBandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_ulBandwidth = a3;
}

- (void)setHasUlBandwidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUlBandwidth
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setRsrp:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_rsrp = a3;
}

- (void)setHasRsrp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRsrp
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRsrq:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rsrq = a3;
}

- (void)setHasRsrq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRsrq
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setSnr:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_snr = a3;
}

- (void)setHasSnr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSnr
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRssi
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SecondaryComponentCarrier;
  __int16 v3 = [(SecondaryComponentCarrier *)&v7 description];
  int v4 = [(SecondaryComponentCarrier *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_index];
    [v3 setObject:v7 forKey:@"index"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  uint64_t state = self->_state;
  if (state >= 3)
  {
    v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_state];
  }
  else
  {
    v9 = *(&off_100287820 + state);
  }
  [v3 setObject:v9 forKey:@"state"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  v10 = +[NSNumber numberWithUnsignedInt:self->_pci];
  [v3 setObject:v10 forKey:@"pci"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  v11 = +[NSNumber numberWithUnsignedInt:self->_dlEarfcn];
  [v3 setObject:v11 forKey:@"dl_earfcn"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  v12 = +[NSNumber numberWithUnsignedInt:self->_dlRfBand];
  [v3 setObject:v12 forKey:@"dl_rf_band"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  v13 = +[NSNumber numberWithUnsignedInt:self->_dlBandwidth];
  [v3 setObject:v13 forKey:@"dl_bandwidth"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  v14 = +[NSNumber numberWithBool:self->_hasUplink];
  [v3 setObject:v14 forKey:@"has_uplink"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  v15 = +[NSNumber numberWithUnsignedInt:self->_ulEarfcn];
  [v3 setObject:v15 forKey:@"ul_earfcn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  v16 = +[NSNumber numberWithUnsignedInt:self->_ulRfBand];
  [v3 setObject:v16 forKey:@"ul_rf_band"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  v17 = +[NSNumber numberWithUnsignedInt:self->_ulBandwidth];
  [v3 setObject:v17 forKey:@"ul_bandwidth"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  v18 = +[NSNumber numberWithInt:self->_rsrp];
  [v3 setObject:v18 forKey:@"rsrp"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  v19 = +[NSNumber numberWithInt:self->_rsrq];
  [v3 setObject:v19 forKey:@"rsrq"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_34:
  v20 = +[NSNumber numberWithInt:self->_snr];
  [v3 setObject:v20 forKey:@"snr"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_15:
    v5 = +[NSNumber numberWithInt:self->_rssi];
    [v3 setObject:v5 forKey:@"rssi"];
  }
LABEL_16:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B7BCC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  PBDataWriterWriteSint32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_15:
  }
    PBDataWriterWriteSint32Field();
LABEL_16:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v4[5] = self->_index;
    *((_WORD *)v4 + 32) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  v4[11] = self->_state;
  *((_WORD *)v4 + 32) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  v4[6] = self->_pci;
  *((_WORD *)v4 + 32) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[3] = self->_dlEarfcn;
  *((_WORD *)v4 + 32) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  v4[4] = self->_dlRfBand;
  *((_WORD *)v4 + 32) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[2] = self->_dlBandwidth;
  *((_WORD *)v4 + 32) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((unsigned char *)v4 + 60) = self->_hasUplink;
  *((_WORD *)v4 + 32) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[13] = self->_ulEarfcn;
  *((_WORD *)v4 + 32) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[14] = self->_ulRfBand;
  *((_WORD *)v4 + 32) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[12] = self->_ulBandwidth;
  *((_WORD *)v4 + 32) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[7] = self->_rsrp;
  *((_WORD *)v4 + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[8] = self->_rsrq;
  *((_WORD *)v4 + 32) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  v4[10] = self->_snr;
  *((_WORD *)v4 + 32) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_15:
    v4[9] = self->_rssi;
    *((_WORD *)v4 + 32) |= 0x80u;
  }
LABEL_16:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = self->_index;
    *((_WORD *)result + 32) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 11) = self->_state;
  *((_WORD *)result + 32) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 6) = self->_pci;
  *((_WORD *)result + 32) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 3) = self->_dlEarfcn;
  *((_WORD *)result + 32) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 4) = self->_dlRfBand;
  *((_WORD *)result + 32) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 2) = self->_dlBandwidth;
  *((_WORD *)result + 32) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((unsigned char *)result + 60) = self->_hasUplink;
  *((_WORD *)result + 32) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 13) = self->_ulEarfcn;
  *((_WORD *)result + 32) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 14) = self->_ulRfBand;
  *((_WORD *)result + 32) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 12) = self->_ulBandwidth;
  *((_WORD *)result + 32) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 7) = self->_rsrp;
  *((_WORD *)result + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 8) = self->_rsrq;
  *((_WORD *)result + 32) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      return result;
    }
    goto LABEL_15;
  }
LABEL_29:
  *((_DWORD *)result + 10) = self->_snr;
  *((_WORD *)result + 32) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) == 0) {
    return result;
  }
LABEL_15:
  *((_DWORD *)result + 9) = self->_rssi;
  *((_WORD *)result + 32) |= 0x80u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_75;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_index != *((_DWORD *)v4 + 5)) {
      goto LABEL_75;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0 || self->_state != *((_DWORD *)v4 + 11)) {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_pci != *((_DWORD *)v4 + 6)) {
      goto LABEL_75;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_dlEarfcn != *((_DWORD *)v4 + 3)) {
      goto LABEL_75;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_dlRfBand != *((_DWORD *)v4 + 4)) {
      goto LABEL_75;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_75;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_dlBandwidth != *((_DWORD *)v4 + 2)) {
      goto LABEL_75;
    }
  }
  else if (v6)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x2000) != 0)
    {
      if (self->_hasUplink)
      {
        if (!*((unsigned char *)v4 + 60)) {
          goto LABEL_75;
        }
        goto LABEL_40;
      }
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_40;
      }
    }
LABEL_75:
    BOOL v7 = 0;
    goto LABEL_76;
  }
  if ((*((_WORD *)v4 + 32) & 0x2000) != 0) {
    goto LABEL_75;
  }
LABEL_40:
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x800) == 0 || self->_ulEarfcn != *((_DWORD *)v4 + 13)) {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x800) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x1000) == 0 || self->_ulRfBand != *((_DWORD *)v4 + 14)) {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x1000) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x400) == 0 || self->_ulBandwidth != *((_DWORD *)v4 + 12)) {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x400) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_rsrp != *((_DWORD *)v4 + 7)) {
      goto LABEL_75;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_rsrq != *((_DWORD *)v4 + 8)) {
      goto LABEL_75;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_snr != *((_DWORD *)v4 + 10)) {
      goto LABEL_75;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_rssi != *((_DWORD *)v4 + 9)) {
      goto LABEL_75;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x80) == 0;
  }
LABEL_76:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_index;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_state;
      if ((has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_pci;
    if ((has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v5 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_dlEarfcn;
    if ((has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_dlRfBand;
    if (has) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v7 = 0;
  if (has)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_dlBandwidth;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_hasUplink;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_ulEarfcn;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_ulRfBand;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_ulBandwidth;
    if ((has & 0x20) != 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v12 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_rsrp;
    if ((has & 0x40) != 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v13 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_rsrq;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_14;
    }
LABEL_28:
    uint64_t v15 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_15;
    }
LABEL_29:
    uint64_t v16 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_27:
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_28;
  }
LABEL_14:
  uint64_t v15 = 2654435761 * self->_snr;
  if ((has & 0x80) == 0) {
    goto LABEL_29;
  }
LABEL_15:
  uint64_t v16 = 2654435761 * self->_rssi;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 8) != 0)
  {
    self->_index = *((_DWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 8u;
    __int16 v5 = *((_WORD *)v4 + 32);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t state = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_pci = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_dlEarfcn = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_dlRfBand = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_dlBandwidth = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x2000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_hasUplink = *((unsigned char *)v4 + 60);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_ulEarfcn = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x1000) == 0)
  {
LABEL_10:
    if ((v5 & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_ulRfBand = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x400) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_ulBandwidth = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_rsrp = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_13:
    if ((v5 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_rsrq = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x100) == 0)
  {
LABEL_14:
    if ((v5 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  self->_snr = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 32) & 0x80) != 0)
  {
LABEL_15:
    self->_rssi = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_16:
}

- (unsigned)index
{
  return self->_index;
}

- (unsigned)pci
{
  return self->_pci;
}

- (unsigned)dlEarfcn
{
  return self->_dlEarfcn;
}

- (unsigned)dlRfBand
{
  return self->_dlRfBand;
}

- (unsigned)dlBandwidth
{
  return self->_dlBandwidth;
}

- (BOOL)hasUplink
{
  return self->_hasUplink;
}

- (unsigned)ulEarfcn
{
  return self->_ulEarfcn;
}

- (unsigned)ulRfBand
{
  return self->_ulRfBand;
}

- (unsigned)ulBandwidth
{
  return self->_ulBandwidth;
}

- (int)rsrp
{
  return self->_rsrp;
}

- (int)rsrq
{
  return self->_rsrq;
}

- (int)snr
{
  return self->_snr;
}

- (int)rssi
{
  return self->_rssi;
}

@end