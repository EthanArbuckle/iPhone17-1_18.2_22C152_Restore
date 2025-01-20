@interface NbrEutra
- (BOOL)hasBand;
- (BOOL)hasDlBw;
- (BOOL)hasEarfcn;
- (BOOL)hasFrameType;
- (BOOL)hasPmax;
- (BOOL)hasPriority;
- (BOOL)hasQOffset;
- (BOOL)hasQQualMin;
- (BOOL)hasQRxlevMin;
- (BOOL)hasSfHigh;
- (BOOL)hasSfMedium;
- (BOOL)hasTReselection;
- (BOOL)hasThresXHighP;
- (BOOL)hasThresXHighQ;
- (BOOL)hasThresXLowP;
- (BOOL)hasThresXLowQ;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)frameTypeAsString:(int)a3;
- (int)StringAsFrameType:(id)a3;
- (int)frameType;
- (int)pmax;
- (int)qOffset;
- (int)qQualMin;
- (int)qRxlevMin;
- (unint64_t)hash;
- (unint64_t)pcisCount;
- (unsigned)band;
- (unsigned)dlBw;
- (unsigned)earfcn;
- (unsigned)pciAtIndex:(unint64_t)a3;
- (unsigned)pcis;
- (unsigned)priority;
- (unsigned)sfHigh;
- (unsigned)sfMedium;
- (unsigned)tReselection;
- (unsigned)thresXHighP;
- (unsigned)thresXHighQ;
- (unsigned)thresXLowP;
- (unsigned)thresXLowQ;
- (void)addPci:(unsigned int)a3;
- (void)clearPcis;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBand:(unsigned int)a3;
- (void)setDlBw:(unsigned int)a3;
- (void)setEarfcn:(unsigned int)a3;
- (void)setFrameType:(int)a3;
- (void)setHasBand:(BOOL)a3;
- (void)setHasDlBw:(BOOL)a3;
- (void)setHasEarfcn:(BOOL)a3;
- (void)setHasFrameType:(BOOL)a3;
- (void)setHasPmax:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasQOffset:(BOOL)a3;
- (void)setHasQQualMin:(BOOL)a3;
- (void)setHasQRxlevMin:(BOOL)a3;
- (void)setHasSfHigh:(BOOL)a3;
- (void)setHasSfMedium:(BOOL)a3;
- (void)setHasTReselection:(BOOL)a3;
- (void)setHasThresXHighP:(BOOL)a3;
- (void)setHasThresXHighQ:(BOOL)a3;
- (void)setHasThresXLowP:(BOOL)a3;
- (void)setHasThresXLowQ:(BOOL)a3;
- (void)setPcis:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPmax:(int)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setQOffset:(int)a3;
- (void)setQQualMin:(int)a3;
- (void)setQRxlevMin:(int)a3;
- (void)setSfHigh:(unsigned int)a3;
- (void)setSfMedium:(unsigned int)a3;
- (void)setTReselection:(unsigned int)a3;
- (void)setThresXHighP:(unsigned int)a3;
- (void)setThresXHighQ:(unsigned int)a3;
- (void)setThresXLowP:(unsigned int)a3;
- (void)setThresXLowQ:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NbrEutra

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NbrEutra;
  [(NbrEutra *)&v3 dealloc];
}

- (void)setEarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_earfcn = a3;
}

- (void)setHasEarfcn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEarfcn
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setQRxlevMin:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_qRxlevMin = a3;
}

- (void)setHasQRxlevMin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasQRxlevMin
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setQQualMin:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_qQualMin = a3;
}

- (void)setHasQQualMin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasQQualMin
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setQOffset:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_qOffset = a3;
}

- (void)setHasQOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasQOffset
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPmax:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_pmax = a3;
}

- (void)setHasPmax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPmax
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDlBw:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_dlBw = a3;
}

- (void)setHasDlBw:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDlBw
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setThresXHighP:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_thresXHighP = a3;
}

- (void)setHasThresXHighP:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasThresXHighP
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setThresXLowP:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_thresXLowP = a3;
}

- (void)setHasThresXLowP:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasThresXLowP
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setThresXHighQ:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_thresXHighQ = a3;
}

- (void)setHasThresXHighQ:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasThresXHighQ
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setThresXLowQ:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_thresXLowQ = a3;
}

- (void)setHasThresXLowQ:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasThresXLowQ
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setPriority:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPriority
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)frameType
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_frameType;
  }
  else {
    return 0;
  }
}

- (void)setFrameType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_frameType = a3;
}

- (void)setHasFrameType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasFrameType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)frameTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100287A28 + a3);
  }

  return v3;
}

- (int)StringAsFrameType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FDD"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TDD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INVALID"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setBand:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBand
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTReselection:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_tReselection = a3;
}

- (void)setHasTReselection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTReselection
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSfMedium:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sfMedium = a3;
}

- (void)setHasSfMedium:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSfMedium
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSfHigh:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_sfHigh = a3;
}

- (void)setHasSfHigh:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSfHigh
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (unint64_t)pcisCount
{
  return self->_pcis.count;
}

- (unsigned)pcis
{
  return self->_pcis.list;
}

- (void)clearPcis
{
}

- (void)addPci:(unsigned int)a3
{
}

- (unsigned)pciAtIndex:(unint64_t)a3
{
  p_pcis = &self->_pcis;
  unint64_t count = self->_pcis.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_pcis->list[a3];
}

- (void)setPcis:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NbrEutra;
  __int16 v3 = [(NbrEutra *)&v7 description];
  int v4 = [(NbrEutra *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v8 = +[NSNumber numberWithUnsignedInt:self->_earfcn];
    [v3 setObject:v8 forKey:@"earfcn"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v9 = +[NSNumber numberWithInt:self->_qRxlevMin];
  [v3 setObject:v9 forKey:@"Q_rxlev_min"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  v10 = +[NSNumber numberWithInt:self->_qQualMin];
  [v3 setObject:v10 forKey:@"Q_qual_min"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  v11 = +[NSNumber numberWithInt:self->_qOffset];
  [v3 setObject:v11 forKey:@"Q_offset"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  v12 = +[NSNumber numberWithInt:self->_pmax];
  [v3 setObject:v12 forKey:@"Pmax"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  v13 = +[NSNumber numberWithUnsignedInt:self->_dlBw];
  [v3 setObject:v13 forKey:@"dl_bw"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  v14 = +[NSNumber numberWithUnsignedInt:self->_thresXHighP];
  [v3 setObject:v14 forKey:@"Thres_X_highP"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  v15 = +[NSNumber numberWithUnsignedInt:self->_thresXLowP];
  [v3 setObject:v15 forKey:@"Thres_X_lowP"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  v16 = +[NSNumber numberWithUnsignedInt:self->_thresXHighQ];
  [v3 setObject:v16 forKey:@"Thres_X_highQ"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  v17 = +[NSNumber numberWithUnsignedInt:self->_thresXLowQ];
  [v3 setObject:v17 forKey:@"Thres_X_lowQ"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  v18 = +[NSNumber numberWithUnsignedInt:self->_priority];
  [v3 setObject:v18 forKey:@"priority"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_32:
  uint64_t frameType = self->_frameType;
  if (frameType >= 3)
  {
    v20 = +[NSString stringWithFormat:@"(unknown: %i)", self->_frameType];
  }
  else
  {
    v20 = *(&off_100287A28 + frameType);
  }
  [v3 setObject:v20 forKey:@"frame_type"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  v21 = +[NSNumber numberWithUnsignedInt:self->_band];
  [v3 setObject:v21 forKey:@"band"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  v22 = +[NSNumber numberWithUnsignedInt:self->_tReselection];
  [v3 setObject:v22 forKey:@"t_reselection"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_16:
    if ((has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_38:
  v23 = +[NSNumber numberWithUnsignedInt:self->_sfMedium];
  [v3 setObject:v23 forKey:@"sf_medium"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_17:
    v5 = +[NSNumber numberWithUnsignedInt:self->_sfHigh];
    [v3 setObject:v5 forKey:@"sf_high"];
  }
LABEL_18:
  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"pci"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D56E0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_16:
    if ((has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_17:
  }
    PBDataWriterWriteUint32Field();
LABEL_18:
  p_pcis = &self->_pcis;
  if (p_pcis->count)
  {
    PBDataWriterPlaceMark();
    if (p_pcis->count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < p_pcis->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v4[10] = self->_earfcn;
    *((_WORD *)v4 + 48) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v4[16] = self->_qRxlevMin;
  *((_WORD *)v4 + 48) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[15] = self->_qQualMin;
  *((_WORD *)v4 + 48) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[14] = self->_qOffset;
  *((_WORD *)v4 + 48) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[12] = self->_pmax;
  *((_WORD *)v4 + 48) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[9] = self->_dlBw;
  *((_WORD *)v4 + 48) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  v4[20] = self->_thresXHighP;
  *((_WORD *)v4 + 48) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[22] = self->_thresXLowP;
  *((_WORD *)v4 + 48) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  v4[21] = self->_thresXHighQ;
  *((_WORD *)v4 + 48) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  v4[23] = self->_thresXLowQ;
  *((_WORD *)v4 + 48) |= 0x8000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  v4[13] = self->_priority;
  *((_WORD *)v4 + 48) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  v4[11] = self->_frameType;
  *((_WORD *)v4 + 48) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  v4[8] = self->_band;
  *((_WORD *)v4 + 48) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0) {
      goto LABEL_16;
    }
LABEL_39:
    v4[18] = self->_sfMedium;
    *((_WORD *)v4 + 48) |= 0x400u;
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_38:
  v4[19] = self->_tReselection;
  *((_WORD *)v4 + 48) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0) {
    goto LABEL_39;
  }
LABEL_16:
  if ((has & 0x200) != 0)
  {
LABEL_17:
    v4[17] = self->_sfHigh;
    *((_WORD *)v4 + 48) |= 0x200u;
  }
LABEL_18:
  id v9 = v4;
  if ([(NbrEutra *)self pcisCount])
  {
    [v9 clearPcis];
    unint64_t v6 = [(NbrEutra *)self pcisCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v9 addPci:[self pciAtIndex:i]];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_earfcn;
    *((_WORD *)v4 + 48) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 16) = self->_qRxlevMin;
  *((_WORD *)v4 + 48) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 15) = self->_qQualMin;
  *((_WORD *)v4 + 48) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 14) = self->_qOffset;
  *((_WORD *)v4 + 48) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 12) = self->_pmax;
  *((_WORD *)v4 + 48) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 9) = self->_dlBw;
  *((_WORD *)v4 + 48) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 20) = self->_thresXHighP;
  *((_WORD *)v4 + 48) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 22) = self->_thresXLowP;
  *((_WORD *)v4 + 48) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 21) = self->_thresXHighQ;
  *((_WORD *)v4 + 48) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 23) = self->_thresXLowQ;
  *((_WORD *)v4 + 48) |= 0x8000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 13) = self->_priority;
  *((_WORD *)v4 + 48) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 11) = self->_frameType;
  *((_WORD *)v4 + 48) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 8) = self->_band;
  *((_WORD *)v4 + 48) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0) {
      goto LABEL_16;
    }
LABEL_33:
    *((_DWORD *)v4 + 18) = self->_sfMedium;
    *((_WORD *)v4 + 48) |= 0x400u;
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_32:
  *((_DWORD *)v4 + 19) = self->_tReselection;
  *((_WORD *)v4 + 48) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0) {
    goto LABEL_33;
  }
LABEL_16:
  if ((has & 0x200) != 0)
  {
LABEL_17:
    *((_DWORD *)v4 + 17) = self->_sfHigh;
    *((_WORD *)v4 + 48) |= 0x200u;
  }
LABEL_18:
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_83;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 48);
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_earfcn != *((_DWORD *)v4 + 10)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x100) == 0 || self->_qRxlevMin != *((_DWORD *)v4 + 16)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 48) & 0x100) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_qQualMin != *((_DWORD *)v4 + 15)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_qOffset != *((_DWORD *)v4 + 14)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_pmax != *((_DWORD *)v4 + 12)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_dlBw != *((_DWORD *)v4 + 9)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x1000) == 0 || self->_thresXHighP != *((_DWORD *)v4 + 20)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 48) & 0x1000) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x4000) == 0 || self->_thresXLowP != *((_DWORD *)v4 + 22)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 48) & 0x4000) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x2000) == 0 || self->_thresXHighQ != *((_DWORD *)v4 + 21)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 48) & 0x2000) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x8000) == 0 || self->_thresXLowQ != *((_DWORD *)v4 + 23)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 48) & 0x8000) != 0)
  {
LABEL_83:
    char IsEqual = 0;
    goto LABEL_84;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_priority != *((_DWORD *)v4 + 13)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_frameType != *((_DWORD *)v4 + 11)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_83;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_band != *((_DWORD *)v4 + 8)) {
      goto LABEL_83;
    }
  }
  else if (v6)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x800) == 0 || self->_tReselection != *((_DWORD *)v4 + 19)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 48) & 0x800) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x400) == 0 || self->_sfMedium != *((_DWORD *)v4 + 18)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 48) & 0x400) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x200) == 0 || self->_sfHigh != *((_DWORD *)v4 + 17)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 48) & 0x200) != 0)
  {
    goto LABEL_83;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_84:

  return IsEqual;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_earfcn;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_qRxlevMin;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_qQualMin;
    if ((has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_qOffset;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_pmax;
    if ((has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v7 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_dlBw;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_thresXHighP;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_thresXLowP;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_thresXHighQ;
    if ((*(_WORD *)&self->_has & 0x8000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_thresXLowQ;
    if ((has & 0x20) != 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v12 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_priority;
    if ((has & 8) != 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v13 = 0;
  if ((has & 8) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_frameType;
    if (has) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v14 = 0;
  if (has)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_band;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_tReselection;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_16;
    }
LABEL_32:
    uint64_t v17 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_17;
    }
LABEL_33:
    uint64_t v18 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ PBRepeatedUInt32Hash();
  }
LABEL_31:
  uint64_t v16 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_32;
  }
LABEL_16:
  uint64_t v17 = 2654435761 * self->_sfMedium;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_33;
  }
LABEL_17:
  uint64_t v18 = 2654435761 * self->_sfHigh;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 4) != 0)
  {
    self->_earfcn = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 4u;
    __int16 v5 = *((_WORD *)v4 + 48);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*((_WORD *)v4 + 48) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_qRxlevMin = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_qQualMin = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_qOffset = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_pmax = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_dlBw = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x1000) == 0)
  {
LABEL_8:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_thresXHighP = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x4000) == 0)
  {
LABEL_9:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_thresXLowP = *((_DWORD *)v4 + 22);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x2000) == 0)
  {
LABEL_10:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_thresXHighQ = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x8000) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_thresXLowQ = *((_DWORD *)v4 + 23);
  *(_WORD *)&self->_has |= 0x8000u;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_priority = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_13:
    if ((v5 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_uint64_t frameType = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_14:
    if ((v5 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_band = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x800) == 0)
  {
LABEL_15:
    if ((v5 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_tReselection = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x400) == 0)
  {
LABEL_16:
    if ((v5 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_38:
  self->_sfMedium = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 48) & 0x200) != 0)
  {
LABEL_17:
    self->_sfHigh = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_18:
  id v9 = v4;
  uint64_t v6 = (char *)[v4 pcisCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[NbrEutra addPci:](self, "addPci:", [v9 pciAtIndex:i]);
  }
}

- (unsigned)earfcn
{
  return self->_earfcn;
}

- (int)qRxlevMin
{
  return self->_qRxlevMin;
}

- (int)qQualMin
{
  return self->_qQualMin;
}

- (int)qOffset
{
  return self->_qOffset;
}

- (int)pmax
{
  return self->_pmax;
}

- (unsigned)dlBw
{
  return self->_dlBw;
}

- (unsigned)thresXHighP
{
  return self->_thresXHighP;
}

- (unsigned)thresXLowP
{
  return self->_thresXLowP;
}

- (unsigned)thresXHighQ
{
  return self->_thresXHighQ;
}

- (unsigned)thresXLowQ
{
  return self->_thresXLowQ;
}

- (unsigned)priority
{
  return self->_priority;
}

- (unsigned)band
{
  return self->_band;
}

- (unsigned)tReselection
{
  return self->_tReselection;
}

- (unsigned)sfMedium
{
  return self->_sfMedium;
}

- (unsigned)sfHigh
{
  return self->_sfHigh;
}

@end