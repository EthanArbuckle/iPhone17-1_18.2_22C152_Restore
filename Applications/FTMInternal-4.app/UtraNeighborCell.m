@interface UtraNeighborCell
- (BOOL)hasDuplexMode;
- (BOOL)hasPMax;
- (BOOL)hasPriority;
- (BOOL)hasQQualMin;
- (BOOL)hasQRxlevMin;
- (BOOL)hasThreshXHighP;
- (BOOL)hasThreshXHighQ;
- (BOOL)hasThreshXLowP;
- (BOOL)hasThreshXLowQ;
- (BOOL)hasUarfcn;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)duplexModeAsString:(int)a3;
- (int)StringAsDuplexMode:(id)a3;
- (int)duplexMode;
- (int)pMax;
- (int)qQualMin;
- (int)qRxlevMin;
- (unint64_t)hash;
- (unsigned)priority;
- (unsigned)threshXHighP;
- (unsigned)threshXHighQ;
- (unsigned)threshXLowP;
- (unsigned)threshXLowQ;
- (unsigned)uarfcn;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuplexMode:(int)a3;
- (void)setHasDuplexMode:(BOOL)a3;
- (void)setHasPMax:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasQQualMin:(BOOL)a3;
- (void)setHasQRxlevMin:(BOOL)a3;
- (void)setHasThreshXHighP:(BOOL)a3;
- (void)setHasThreshXHighQ:(BOOL)a3;
- (void)setHasThreshXLowP:(BOOL)a3;
- (void)setHasThreshXLowQ:(BOOL)a3;
- (void)setHasUarfcn:(BOOL)a3;
- (void)setPMax:(int)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setQQualMin:(int)a3;
- (void)setQRxlevMin:(int)a3;
- (void)setThreshXHighP:(unsigned int)a3;
- (void)setThreshXHighQ:(unsigned int)a3;
- (void)setThreshXLowP:(unsigned int)a3;
- (void)setThreshXLowQ:(unsigned int)a3;
- (void)setUarfcn:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation UtraNeighborCell

- (void)setUarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_uarfcn = a3;
}

- (void)setHasUarfcn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasUarfcn
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setQRxlevMin:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_qRxlevMin = a3;
}

- (void)setHasQRxlevMin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasQRxlevMin
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setQQualMin:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_qQualMin = a3;
}

- (void)setHasQQualMin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasQQualMin
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPMax:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_pMax = a3;
}

- (void)setHasPMax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPMax
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setThreshXHighP:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_threshXHighP = a3;
}

- (void)setHasThreshXHighP:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasThreshXHighP
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setThreshXLowP:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_threshXLowP = a3;
}

- (void)setHasThreshXLowP:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasThreshXLowP
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setThreshXHighQ:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_threshXHighQ = a3;
}

- (void)setHasThreshXHighQ:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasThreshXHighQ
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setThreshXLowQ:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_threshXLowQ = a3;
}

- (void)setHasThreshXLowQ:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasThreshXLowQ
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPriority:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPriority
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)duplexMode
{
  if (*(_WORD *)&self->_has) {
    return self->_duplexMode;
  }
  else {
    return 0;
  }
}

- (void)setDuplexMode:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_duplexMode = a3;
}

- (void)setHasDuplexMode:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDuplexMode
{
  return *(_WORD *)&self->_has & 1;
}

- (id)duplexModeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"KCELLULAR_TIME_DIVISION_DUPLEX";
    }
    else
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    v4 = @"KCELLULAR_FREQ_DIVISION_DUPLEX";
  }
  return v4;
}

- (int)StringAsDuplexMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KCELLULAR_FREQ_DIVISION_DUPLEX"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"KCELLULAR_TIME_DIVISION_DUPLEX"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UtraNeighborCell;
  id v3 = [(UtraNeighborCell *)&v7 description];
  int v4 = [(UtraNeighborCell *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_uarfcn];
    [v3 setObject:v5 forKey:@"uarfcn"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v6 = +[NSNumber numberWithInt:self->_qRxlevMin];
  [v3 setObject:v6 forKey:@"q_rxlev_min"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  objc_super v7 = +[NSNumber numberWithInt:self->_qQualMin];
  [v3 setObject:v7 forKey:@"q_qual_min"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v8 = +[NSNumber numberWithInt:self->_pMax];
  [v3 setObject:v8 forKey:@"p_max"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v9 = +[NSNumber numberWithUnsignedInt:self->_threshXHighP];
  [v3 setObject:v9 forKey:@"thresh_x_high_p"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  v10 = +[NSNumber numberWithUnsignedInt:self->_threshXLowP];
  [v3 setObject:v10 forKey:@"thresh_x_low_p"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = +[NSNumber numberWithUnsignedInt:self->_threshXHighQ];
  [v3 setObject:v11 forKey:@"thresh_x_high_q"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    v13 = +[NSNumber numberWithUnsignedInt:self->_priority];
    [v3 setObject:v13 forKey:@"priority"];

    if ((*(_WORD *)&self->_has & 1) == 0) {
      goto LABEL_27;
    }
LABEL_21:
    int duplexMode = self->_duplexMode;
    if (duplexMode)
    {
      if (duplexMode == 1)
      {
        v15 = @"KCELLULAR_TIME_DIVISION_DUPLEX";
      }
      else
      {
        v15 = +[NSString stringWithFormat:@"(unknown: %i)", self->_duplexMode];
      }
    }
    else
    {
      v15 = @"KCELLULAR_FREQ_DIVISION_DUPLEX";
    }
    [v3 setObject:v15 forKey:@"duplex_mode"];

    goto LABEL_27;
  }
LABEL_19:
  v12 = +[NSNumber numberWithUnsignedInt:self->_threshXLowQ];
  [v3 setObject:v12 forKey:@"thresh_x_low_q"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if (has) {
    goto LABEL_21;
  }
LABEL_27:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10014E780((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  if (*(_WORD *)&self->_has) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v4[11] = self->_uarfcn;
    *((_WORD *)v4 + 24) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_qRxlevMin;
  *((_WORD *)v4 + 24) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[5] = self->_qQualMin;
  *((_WORD *)v4 + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[3] = self->_pMax;
  *((_WORD *)v4 + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[7] = self->_threshXHighP;
  *((_WORD *)v4 + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[9] = self->_threshXLowP;
  *((_WORD *)v4 + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  v4[8] = self->_threshXHighQ;
  *((_WORD *)v4 + 24) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[10] = self->_threshXLowQ;
  *((_WORD *)v4 + 24) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  v4[4] = self->_priority;
  *((_WORD *)v4 + 24) |= 4u;
  if (*(_WORD *)&self->_has)
  {
LABEL_11:
    v4[2] = self->_duplexMode;
    *((_WORD *)v4 + 24) |= 1u;
  }
LABEL_12:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)result + 11) = self->_uarfcn;
    *((_WORD *)result + 24) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_qRxlevMin;
  *((_WORD *)result + 24) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 5) = self->_qQualMin;
  *((_WORD *)result + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 3) = self->_pMax;
  *((_WORD *)result + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 7) = self->_threshXHighP;
  *((_WORD *)result + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 9) = self->_threshXLowP;
  *((_WORD *)result + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 8) = self->_threshXHighQ;
  *((_WORD *)result + 24) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 10) = self->_threshXLowQ;
  *((_WORD *)result + 24) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 4) = self->_priority;
  *((_WORD *)result + 24) |= 4u;
  if ((*(_WORD *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_11:
  *((_DWORD *)result + 2) = self->_duplexMode;
  *((_WORD *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 24);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x200) == 0 || self->_uarfcn != *((_DWORD *)v4 + 11)) {
      goto LABEL_52;
    }
  }
  else if ((*((_WORD *)v4 + 24) & 0x200) != 0)
  {
LABEL_52:
    BOOL v7 = 0;
    goto LABEL_53;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_qRxlevMin != *((_DWORD *)v4 + 6)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_qQualMin != *((_DWORD *)v4 + 5)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_pMax != *((_DWORD *)v4 + 3)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_threshXHighP != *((_DWORD *)v4 + 7)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_threshXLowP != *((_DWORD *)v4 + 9)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_threshXHighQ != *((_DWORD *)v4 + 8)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x100) == 0 || self->_threshXLowQ != *((_DWORD *)v4 + 10)) {
      goto LABEL_52;
    }
  }
  else if ((*((_WORD *)v4 + 24) & 0x100) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_priority != *((_DWORD *)v4 + 4)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_52;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_duplexMode != *((_DWORD *)v4 + 2)) {
      goto LABEL_52;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 1) == 0;
  }
LABEL_53:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    uint64_t v3 = 2654435761 * self->_uarfcn;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_qRxlevMin;
      if ((has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_qQualMin;
    if ((has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_pMax;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_threshXHighP;
    if ((has & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_threshXLowP;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_threshXHighQ;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_threshXLowQ;
    if ((has & 4) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v11 = 0;
    if (has) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  uint64_t v10 = 0;
  if ((has & 4) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_priority;
  if ((has & 1) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_duplexMode;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x200) != 0)
  {
    self->_uarfcn = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v5 = *((_WORD *)v4 + 24);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_qRxlevMin = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_qQualMin = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_pMax = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_threshXHighP = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_threshXLowP = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_threshXHighQ = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x100) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_threshXLowQ = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  self->_priority = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  if (*((_WORD *)v4 + 24))
  {
LABEL_11:
    self->_int duplexMode = *((_DWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_12:
}

- (unsigned)uarfcn
{
  return self->_uarfcn;
}

- (int)qRxlevMin
{
  return self->_qRxlevMin;
}

- (int)qQualMin
{
  return self->_qQualMin;
}

- (int)pMax
{
  return self->_pMax;
}

- (unsigned)threshXHighP
{
  return self->_threshXHighP;
}

- (unsigned)threshXLowP
{
  return self->_threshXLowP;
}

- (unsigned)threshXHighQ
{
  return self->_threshXHighQ;
}

- (unsigned)threshXLowQ
{
  return self->_threshXLowQ;
}

- (unsigned)priority
{
  return self->_priority;
}

@end