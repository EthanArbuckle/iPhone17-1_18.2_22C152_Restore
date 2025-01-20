@interface CellularLteSysInfoBlocks
+ (Class)sibType;
- (BOOL)hasCellId;
- (BOOL)hasFreq;
- (BOOL)hasFreqBandInd;
- (BOOL)hasMib;
- (BOOL)hasNumMncDigits;
- (BOOL)hasPhyCellId;
- (BOOL)hasSelPlmnMcc;
- (BOOL)hasSelPlmnMnc;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasTrackingAreaCode;
- (BOOL)hasValueTag;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Mib)mib;
- (NSMutableArray)sibs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sibAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sibsCount;
- (unint64_t)timestamp;
- (unsigned)cellId;
- (unsigned)freq;
- (unsigned)freqBandInd;
- (unsigned)numMncDigits;
- (unsigned)phyCellId;
- (unsigned)selPlmnMcc;
- (unsigned)selPlmnMnc;
- (unsigned)subsId;
- (unsigned)trackingAreaCode;
- (unsigned)valueTag;
- (void)addSib:(id)a3;
- (void)clearSibs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setFreq:(unsigned int)a3;
- (void)setFreqBandInd:(unsigned int)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasFreq:(BOOL)a3;
- (void)setHasFreqBandInd:(BOOL)a3;
- (void)setHasNumMncDigits:(BOOL)a3;
- (void)setHasPhyCellId:(BOOL)a3;
- (void)setHasSelPlmnMcc:(BOOL)a3;
- (void)setHasSelPlmnMnc:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTrackingAreaCode:(BOOL)a3;
- (void)setHasValueTag:(BOOL)a3;
- (void)setMib:(id)a3;
- (void)setNumMncDigits:(unsigned int)a3;
- (void)setPhyCellId:(unsigned int)a3;
- (void)setSelPlmnMcc:(unsigned int)a3;
- (void)setSelPlmnMnc:(unsigned int)a3;
- (void)setSibs:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTrackingAreaCode:(unsigned int)a3;
- (void)setValueTag:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLteSysInfoBlocks

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCellId
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setFreq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_freq = a3;
}

- (void)setHasFreq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFreq
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPhyCellId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_phyCellId = a3;
}

- (void)setHasPhyCellId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPhyCellId
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setValueTag:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_valueTag = a3;
}

- (void)setHasValueTag:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasValueTag
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasMib
{
  return self->_mib != 0;
}

- (void)clearSibs
{
}

- (void)addSib:(id)a3
{
  id v4 = a3;
  sibs = self->_sibs;
  id v8 = v4;
  if (!sibs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_sibs;
    self->_sibs = v6;

    id v4 = v8;
    sibs = self->_sibs;
  }
  [(NSMutableArray *)sibs addObject:v4];
}

- (unint64_t)sibsCount
{
  return (unint64_t)[(NSMutableArray *)self->_sibs count];
}

- (id)sibAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_sibs objectAtIndex:a3];
}

+ (Class)sibType
{
  return (Class)objc_opt_class();
}

- (void)setFreqBandInd:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_freqBandInd = a3;
}

- (void)setHasFreqBandInd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasFreqBandInd
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTrackingAreaCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_trackingAreaCode = a3;
}

- (void)setHasTrackingAreaCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTrackingAreaCode
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSelPlmnMcc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_selPlmnMcc = a3;
}

- (void)setHasSelPlmnMcc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSelPlmnMcc
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setSelPlmnMnc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_selPlmnMnc = a3;
}

- (void)setHasSelPlmnMnc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSelPlmnMnc
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumMncDigits
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSubsId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLteSysInfoBlocks;
  __int16 v3 = [(CellularLteSysInfoBlocks *)&v7 description];
  id v4 = [(CellularLteSysInfoBlocks *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v18 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v18 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v19 = +[NSNumber numberWithUnsignedInt:self->_cellId];
  [v3 setObject:v19 forKey:@"cell_id"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  v20 = +[NSNumber numberWithUnsignedInt:self->_freq];
  [v3 setObject:v20 forKey:@"freq"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_31:
  v21 = +[NSNumber numberWithUnsignedInt:self->_phyCellId];
  [v3 setObject:v21 forKey:@"phy_cell_id"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    v5 = +[NSNumber numberWithUnsignedInt:self->_valueTag];
    [v3 setObject:v5 forKey:@"value_tag"];
  }
LABEL_7:
  mib = self->_mib;
  if (mib)
  {
    objc_super v7 = [(Mib *)mib dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"mib"];
  }
  if ([(NSMutableArray *)self->_sibs count])
  {
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_sibs, "count")];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v9 = self->_sibs;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"sib"];
  }
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 8) != 0)
  {
    v22 = +[NSNumber numberWithUnsignedInt:self->_freqBandInd];
    [v3 setObject:v22 forKey:@"freq_band_ind"];

    __int16 v15 = (__int16)self->_has;
    if ((v15 & 0x200) == 0)
    {
LABEL_20:
      if ((v15 & 0x40) == 0) {
        goto LABEL_21;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_20;
  }
  v23 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_trackingAreaCode, (void)v27);
  [v3 setObject:v23 forKey:@"tracking_area_code"];

  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x40) == 0)
  {
LABEL_21:
    if ((v15 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_36;
  }
LABEL_35:
  v24 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selPlmnMcc, (void)v27);
  [v3 setObject:v24 forKey:@"sel_plmn_mcc"];

  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x80) == 0)
  {
LABEL_22:
    if ((v15 & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_36:
  v25 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selPlmnMnc, (void)v27);
  [v3 setObject:v25 forKey:@"sel_plmn_mnc"];

  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x10) == 0)
  {
LABEL_23:
    if ((v15 & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_37:
  v26 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMncDigits, (void)v27);
  [v3 setObject:v26 forKey:@"num_mnc_digits"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_24:
    v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId, (void)v27);
    [v3 setObject:v16 forKey:@"subs_id"];
  }
LABEL_25:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100044660((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_mib) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_sibs;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 8) == 0)
    {
LABEL_18:
      if ((v11 & 0x200) == 0) {
        goto LABEL_19;
      }
      goto LABEL_31;
    }
  }
  else if ((v11 & 8) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x200) == 0)
  {
LABEL_19:
    if ((v11 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) == 0)
  {
LABEL_20:
    if ((v11 & 0x80) == 0) {
      goto LABEL_21;
    }
LABEL_33:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x80) != 0) {
    goto LABEL_33;
  }
LABEL_21:
  if ((v11 & 0x10) != 0) {
LABEL_22:
  }
    PBDataWriterWriteUint32Field();
LABEL_23:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 38) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 4) = self->_cellId;
  *((_WORD *)v4 + 38) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 5) = self->_freq;
  *((_WORD *)v4 + 38) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_26:
  *((_DWORD *)v4 + 11) = self->_phyCellId;
  *((_WORD *)v4 + 38) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 18) = self->_valueTag;
    *((_WORD *)v4 + 38) |= 0x400u;
  }
LABEL_7:
  id v11 = v4;
  if (self->_mib) {
    [v4 setMib:];
  }
  if ([(CellularLteSysInfoBlocks *)self sibsCount])
  {
    [v11 clearSibs];
    unint64_t v6 = [(CellularLteSysInfoBlocks *)self sibsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularLteSysInfoBlocks *)self sibAtIndex:i];
        [v11 addSib:v9];
      }
    }
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) != 0)
  {
    *((_DWORD *)v11 + 16) = self->_subsId;
    *((_WORD *)v11 + 38) |= 0x100u;
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_15:
      if ((v10 & 0x200) == 0) {
        goto LABEL_16;
      }
      goto LABEL_30;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v11 + 6) = self->_freqBandInd;
  *((_WORD *)v11 + 38) |= 8u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x200) == 0)
  {
LABEL_16:
    if ((v10 & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v11 + 17) = self->_trackingAreaCode;
  *((_WORD *)v11 + 38) |= 0x200u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x40) == 0)
  {
LABEL_17:
    if ((v10 & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v11 + 12) = self->_selPlmnMcc;
  *((_WORD *)v11 + 38) |= 0x40u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x80) == 0)
  {
LABEL_18:
    if ((v10 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_32:
  *((_DWORD *)v11 + 13) = self->_selPlmnMnc;
  *((_WORD *)v11 + 38) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_19:
    *((_DWORD *)v11 + 10) = self->_numMncDigits;
    *((_WORD *)v11 + 38) |= 0x10u;
  }
LABEL_20:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 38) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 4) = self->_cellId;
  *((_WORD *)v5 + 38) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 5) = self->_freq;
  *((_WORD *)v5 + 38) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_25:
  *((_DWORD *)v5 + 11) = self->_phyCellId;
  *((_WORD *)v5 + 38) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 18) = self->_valueTag;
    *((_WORD *)v5 + 38) |= 0x400u;
  }
LABEL_7:
  id v8 = [(Mib *)self->_mib copyWithZone:a3];
  uint64_t v9 = (void *)v6[4];
  v6[4] = v8;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  __int16 v10 = self->_sibs;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) copyWithZone:a3];
        [v6 addSib:v15];
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x100) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_subsId;
    *((_WORD *)v6 + 38) |= 0x100u;
    __int16 v16 = (__int16)self->_has;
    if ((v16 & 8) == 0)
    {
LABEL_16:
      if ((v16 & 0x200) == 0) {
        goto LABEL_17;
      }
      goto LABEL_29;
    }
  }
  else if ((v16 & 8) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v6 + 6) = self->_freqBandInd;
  *((_WORD *)v6 + 38) |= 8u;
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x200) == 0)
  {
LABEL_17:
    if ((v16 & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v6 + 17) = self->_trackingAreaCode;
  *((_WORD *)v6 + 38) |= 0x200u;
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x40) == 0)
  {
LABEL_18:
    if ((v16 & 0x80) == 0) {
      goto LABEL_19;
    }
LABEL_31:
    *((_DWORD *)v6 + 13) = self->_selPlmnMnc;
    *((_WORD *)v6 + 38) |= 0x80u;
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      return v6;
    }
    goto LABEL_20;
  }
LABEL_30:
  *((_DWORD *)v6 + 12) = self->_selPlmnMcc;
  *((_WORD *)v6 + 38) |= 0x40u;
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x80) != 0) {
    goto LABEL_31;
  }
LABEL_19:
  if ((v16 & 0x10) != 0)
  {
LABEL_20:
    *((_DWORD *)v6 + 10) = self->_numMncDigits;
    *((_WORD *)v6 + 38) |= 0x10u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_61;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 38);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_61;
    }
  }
  else if (v6)
  {
LABEL_61:
    BOOL v11 = 0;
    goto LABEL_62;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_cellId != *((_DWORD *)v4 + 4)) {
      goto LABEL_61;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_61;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_freq != *((_DWORD *)v4 + 5)) {
      goto LABEL_61;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_61;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_phyCellId != *((_DWORD *)v4 + 11)) {
      goto LABEL_61;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x400) == 0 || self->_valueTag != *((_DWORD *)v4 + 18)) {
      goto LABEL_61;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x400) != 0)
  {
    goto LABEL_61;
  }
  mib = self->_mib;
  if ((unint64_t)mib | *((void *)v4 + 4) && !-[Mib isEqual:](mib, "isEqual:")) {
    goto LABEL_61;
  }
  sibs = self->_sibs;
  if ((unint64_t)sibs | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](sibs, "isEqual:")) {
      goto LABEL_61;
    }
  }
  __int16 v9 = (__int16)self->_has;
  __int16 v10 = *((_WORD *)v4 + 38);
  if ((v9 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x100) == 0 || self->_subsId != *((_DWORD *)v4 + 16)) {
      goto LABEL_61;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x100) != 0)
  {
    goto LABEL_61;
  }
  if ((v9 & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 6)) {
      goto LABEL_61;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x200) == 0 || self->_trackingAreaCode != *((_DWORD *)v4 + 17)) {
      goto LABEL_61;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x200) != 0)
  {
    goto LABEL_61;
  }
  if ((v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_selPlmnMcc != *((_DWORD *)v4 + 12)) {
      goto LABEL_61;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_61;
  }
  if ((v9 & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_selPlmnMnc != *((_DWORD *)v4 + 13)) {
      goto LABEL_61;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_61;
  }
  if ((v9 & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 10)) {
      goto LABEL_61;
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = (v10 & 0x10) == 0;
  }
LABEL_62:

  return v11;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_cellId;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_freq;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v7 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v6 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_phyCellId;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_valueTag;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v8 = 0;
LABEL_12:
  unint64_t v9 = [(Mib *)self->_mib hash];
  unint64_t v10 = (unint64_t)[(NSMutableArray *)self->_sibs hash];
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x100) != 0)
  {
    uint64_t v12 = 2654435761 * self->_subsId;
    if ((v11 & 8) != 0)
    {
LABEL_14:
      uint64_t v13 = 2654435761 * self->_freqBandInd;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_15;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if ((v11 & 8) != 0) {
      goto LABEL_14;
    }
  }
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_15:
    uint64_t v14 = 2654435761 * self->_trackingAreaCode;
    if ((v11 & 0x40) != 0) {
      goto LABEL_16;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v14 = 0;
  if ((v11 & 0x40) != 0)
  {
LABEL_16:
    uint64_t v15 = 2654435761 * self->_selPlmnMcc;
    if ((v11 & 0x80) != 0) {
      goto LABEL_17;
    }
LABEL_23:
    uint64_t v16 = 0;
    if ((v11 & 0x10) != 0) {
      goto LABEL_18;
    }
LABEL_24:
    uint64_t v17 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_22:
  uint64_t v15 = 0;
  if ((v11 & 0x80) == 0) {
    goto LABEL_23;
  }
LABEL_17:
  uint64_t v16 = 2654435761 * self->_selPlmnMnc;
  if ((v11 & 0x10) == 0) {
    goto LABEL_24;
  }
LABEL_18:
  uint64_t v17 = 2654435761 * self->_numMncDigits;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 38);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 38);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_cellId = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_freq = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((v6 & 0x20) == 0)
  {
LABEL_5:
    if ((v6 & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_phyCellId = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 38) & 0x400) != 0)
  {
LABEL_6:
    self->_valueTag = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_7:
  mib = self->_mib;
  uint64_t v8 = *((void *)v5 + 4);
  if (mib)
  {
    if (v8) {
      -[Mib mergeFrom:](mib, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[CellularLteSysInfoBlocks setMib:](self, "setMib:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = *((id *)v5 + 7);
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        -[CellularLteSysInfoBlocks addSib:](self, "addSib:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  __int16 v14 = *((_WORD *)v5 + 38);
  if ((v14 & 0x100) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 16);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v14 = *((_WORD *)v5 + 38);
    if ((v14 & 8) == 0)
    {
LABEL_26:
      if ((v14 & 0x200) == 0) {
        goto LABEL_27;
      }
      goto LABEL_34;
    }
  }
  else if ((v14 & 8) == 0)
  {
    goto LABEL_26;
  }
  self->_freqBandInd = *((_DWORD *)v5 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v14 = *((_WORD *)v5 + 38);
  if ((v14 & 0x200) == 0)
  {
LABEL_27:
    if ((v14 & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_trackingAreaCode = *((_DWORD *)v5 + 17);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v14 = *((_WORD *)v5 + 38);
  if ((v14 & 0x40) == 0)
  {
LABEL_28:
    if ((v14 & 0x80) == 0) {
      goto LABEL_29;
    }
LABEL_36:
    self->_selPlmnMnc = *((_DWORD *)v5 + 13);
    *(_WORD *)&self->_has |= 0x80u;
    if ((*((_WORD *)v5 + 38) & 0x10) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_35:
  self->_selPlmnMcc = *((_DWORD *)v5 + 12);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v14 = *((_WORD *)v5 + 38);
  if ((v14 & 0x80) != 0) {
    goto LABEL_36;
  }
LABEL_29:
  if ((v14 & 0x10) != 0)
  {
LABEL_30:
    self->_numMncDigits = *((_DWORD *)v5 + 10);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_31:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)freq
{
  return self->_freq;
}

- (unsigned)phyCellId
{
  return self->_phyCellId;
}

- (unsigned)valueTag
{
  return self->_valueTag;
}

- (Mib)mib
{
  return self->_mib;
}

- (void)setMib:(id)a3
{
}

- (NSMutableArray)sibs
{
  return self->_sibs;
}

- (void)setSibs:(id)a3
{
}

- (unsigned)freqBandInd
{
  return self->_freqBandInd;
}

- (unsigned)trackingAreaCode
{
  return self->_trackingAreaCode;
}

- (unsigned)selPlmnMcc
{
  return self->_selPlmnMcc;
}

- (unsigned)selPlmnMnc
{
  return self->_selPlmnMnc;
}

- (unsigned)numMncDigits
{
  return self->_numMncDigits;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sibs, 0);

  objc_storeStrong((id *)&self->_mib, 0);
}

@end