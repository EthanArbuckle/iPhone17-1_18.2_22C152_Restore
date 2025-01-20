@interface CellularNrScellInfo
- (BOOL)hasAllowedAccess;
- (BOOL)hasCellId;
- (BOOL)hasDlBw;
- (BOOL)hasDlFreq;
- (BOOL)hasNumMncDigits;
- (BOOL)hasNumSubs;
- (BOOL)hasPhyCellId;
- (BOOL)hasPsPref;
- (BOOL)hasSelPlmnMcc;
- (BOOL)hasSelPlmnMnc;
- (BOOL)hasSimHplmn;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasTrackingAreaCode;
- (BOOL)hasUlBw;
- (BOOL)hasUlFreq;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)simHplmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)allowedAccess;
- (unsigned)cellId;
- (unsigned)dlBw;
- (unsigned)dlFreq;
- (unsigned)numMncDigits;
- (unsigned)numSubs;
- (unsigned)phyCellId;
- (unsigned)psPref;
- (unsigned)selPlmnMcc;
- (unsigned)selPlmnMnc;
- (unsigned)subsId;
- (unsigned)trackingAreaCode;
- (unsigned)ulBw;
- (unsigned)ulFreq;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowedAccess:(unsigned int)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setDlBw:(unsigned int)a3;
- (void)setDlFreq:(unsigned int)a3;
- (void)setHasAllowedAccess:(BOOL)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasDlBw:(BOOL)a3;
- (void)setHasDlFreq:(BOOL)a3;
- (void)setHasNumMncDigits:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPhyCellId:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasSelPlmnMcc:(BOOL)a3;
- (void)setHasSelPlmnMnc:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTrackingAreaCode:(BOOL)a3;
- (void)setHasUlBw:(BOOL)a3;
- (void)setHasUlFreq:(BOOL)a3;
- (void)setNumMncDigits:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPhyCellId:(unsigned int)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setSelPlmnMcc:(unsigned int)a3;
- (void)setSelPlmnMnc:(unsigned int)a3;
- (void)setSimHplmn:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTrackingAreaCode:(unsigned int)a3;
- (void)setUlBw:(unsigned int)a3;
- (void)setUlFreq:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrScellInfo

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

- (void)setPhyCellId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_phyCellId = a3;
}

- (void)setHasPhyCellId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPhyCellId
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setDlFreq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dlFreq = a3;
}

- (void)setHasDlFreq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDlFreq
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setUlFreq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_ulFreq = a3;
}

- (void)setHasUlFreq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasUlFreq
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setDlBw:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_dlBw = a3;
}

- (void)setHasDlBw:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDlBw
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setUlBw:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_ulBw = a3;
}

- (void)setHasUlBw:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasUlBw
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCellId
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumMncDigits
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSelPlmnMcc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_selPlmnMcc = a3;
}

- (void)setHasSelPlmnMcc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSelPlmnMcc
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSelPlmnMnc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_selPlmnMnc = a3;
}

- (void)setHasSelPlmnMnc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSelPlmnMnc
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setAllowedAccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_allowedAccess = a3;
}

- (void)setHasAllowedAccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAllowedAccess
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTrackingAreaCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_trackingAreaCode = a3;
}

- (void)setHasTrackingAreaCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTrackingAreaCode
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPsPref
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrScellInfo;
  __int16 v3 = [(CellularNrScellInfo *)&v7 description];
  v4 = [(CellularNrScellInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v10 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v10 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v11 = +[NSNumber numberWithUnsignedInt:self->_phyCellId];
  [v3 setObject:v11 forKey:@"phy_cell_id"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  v12 = +[NSNumber numberWithUnsignedInt:self->_dlFreq];
  [v3 setObject:v12 forKey:@"dl_freq"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  v13 = +[NSNumber numberWithUnsignedInt:self->_ulFreq];
  [v3 setObject:v13 forKey:@"ul_freq"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  v14 = +[NSNumber numberWithUnsignedInt:self->_dlBw];
  [v3 setObject:v14 forKey:@"dl_bw"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  v15 = +[NSNumber numberWithUnsignedInt:self->_ulBw];
  [v3 setObject:v15 forKey:@"ul_bw"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  v16 = +[NSNumber numberWithUnsignedInt:self->_cellId];
  [v3 setObject:v16 forKey:@"cell_id"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  v17 = +[NSNumber numberWithUnsignedInt:self->_numMncDigits];
  [v3 setObject:v17 forKey:@"num_mnc_digits"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  v18 = +[NSNumber numberWithUnsignedInt:self->_selPlmnMcc];
  [v3 setObject:v18 forKey:@"sel_plmn_mcc"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  v19 = +[NSNumber numberWithUnsignedInt:self->_selPlmnMnc];
  [v3 setObject:v19 forKey:@"sel_plmn_mnc"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_33:
  v20 = +[NSNumber numberWithUnsignedInt:self->_allowedAccess];
  [v3 setObject:v20 forKey:@"allowed_access"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    v5 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v5 forKey:@"num_subs"];
  }
LABEL_14:
  simHplmn = self->_simHplmn;
  if (simHplmn) {
    [v3 setObject:simHplmn forKey:@"sim_hplmn"];
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x800) != 0)
  {
    v21 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v21 forKey:@"subs_id"];

    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x1000) == 0)
    {
LABEL_18:
      if ((v7 & 0x100) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_18;
  }
  v22 = +[NSNumber numberWithUnsignedInt:self->_trackingAreaCode];
  [v3 setObject:v22 forKey:@"tracking_area_code"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_19:
    v8 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v8 forKey:@"ps_pref"];
  }
LABEL_20:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000DFD9C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint32Field();
LABEL_14:
  if (self->_simHplmn) {
    PBDataWriterWriteDataField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x800) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x1000) == 0)
    {
LABEL_18:
      if ((v5 & 0x100) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_19:
  }
    PBDataWriterWriteUint32Field();
LABEL_20:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 40) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 10) = self->_phyCellId;
  *((_WORD *)v4 + 40) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 7) = self->_dlFreq;
  *((_WORD *)v4 + 40) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 19) = self->_ulFreq;
  *((_WORD *)v4 + 40) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 6) = self->_dlBw;
  *((_WORD *)v4 + 40) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 18) = self->_ulBw;
  *((_WORD *)v4 + 40) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 5) = self->_cellId;
  *((_WORD *)v4 + 40) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 8) = self->_numMncDigits;
  *((_WORD *)v4 + 40) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 12) = self->_selPlmnMcc;
  *((_WORD *)v4 + 40) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 13) = self->_selPlmnMnc;
  *((_WORD *)v4 + 40) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_33:
  *((_DWORD *)v4 + 4) = self->_allowedAccess;
  *((_WORD *)v4 + 40) |= 2u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 9) = self->_numSubs;
    *((_WORD *)v4 + 40) |= 0x40u;
  }
LABEL_14:
  if (self->_simHplmn)
  {
    __int16 v7 = v4;
    [v4 setSimHplmn:];
    v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_subsId;
    *((_WORD *)v4 + 40) |= 0x800u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x1000) == 0)
    {
LABEL_18:
      if ((v6 & 0x100) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_18;
  }
  *((_DWORD *)v4 + 17) = self->_trackingAreaCode;
  *((_WORD *)v4 + 40) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_19:
    *((_DWORD *)v4 + 11) = self->_psPref;
    *((_WORD *)v4 + 40) |= 0x100u;
  }
LABEL_20:
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int16 v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 40) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 10) = self->_phyCellId;
  *((_WORD *)v5 + 40) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v5 + 7) = self->_dlFreq;
  *((_WORD *)v5 + 40) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v5 + 19) = self->_ulFreq;
  *((_WORD *)v5 + 40) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v5 + 6) = self->_dlBw;
  *((_WORD *)v5 + 40) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 18) = self->_ulBw;
  *((_WORD *)v5 + 40) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v5 + 5) = self->_cellId;
  *((_WORD *)v5 + 40) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v5 + 8) = self->_numMncDigits;
  *((_WORD *)v5 + 40) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v5 + 12) = self->_selPlmnMcc;
  *((_WORD *)v5 + 40) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v5 + 13) = self->_selPlmnMnc;
  *((_WORD *)v5 + 40) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_29:
  *((_DWORD *)v5 + 4) = self->_allowedAccess;
  *((_WORD *)v5 + 40) |= 2u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    *((_DWORD *)v5 + 9) = self->_numSubs;
    *((_WORD *)v5 + 40) |= 0x40u;
  }
LABEL_14:
  id v8 = [(NSData *)self->_simHplmn copyWithZone:a3];
  v9 = (void *)v6[7];
  v6[7] = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x1000) == 0) {
      goto LABEL_16;
    }
LABEL_32:
    *((_DWORD *)v6 + 17) = self->_trackingAreaCode;
    *((_WORD *)v6 + 40) |= 0x1000u;
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      return v6;
    }
    goto LABEL_17;
  }
  *((_DWORD *)v6 + 16) = self->_subsId;
  *((_WORD *)v6 + 40) |= 0x800u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x1000) != 0) {
    goto LABEL_32;
  }
LABEL_16:
  if ((v10 & 0x100) != 0)
  {
LABEL_17:
    *((_DWORD *)v6 + 11) = self->_psPref;
    *((_WORD *)v6 + 40) |= 0x100u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_80;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 40);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_80;
    }
  }
  else if (v6)
  {
    goto LABEL_80;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_phyCellId != *((_DWORD *)v4 + 10)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_dlFreq != *((_DWORD *)v4 + 7)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x4000) == 0 || self->_ulFreq != *((_DWORD *)v4 + 19)) {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x4000) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_dlBw != *((_DWORD *)v4 + 6)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x2000) == 0 || self->_ulBw != *((_DWORD *)v4 + 18)) {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x2000) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_cellId != *((_DWORD *)v4 + 5)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 8)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x200) == 0 || self->_selPlmnMcc != *((_DWORD *)v4 + 12)) {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x200) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x400) == 0 || self->_selPlmnMnc != *((_DWORD *)v4 + 13)) {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x400) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_allowedAccess != *((_DWORD *)v4 + 4)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_numSubs != *((_DWORD *)v4 + 9)) {
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_80;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](simHplmn, "isEqual:"))
    {
LABEL_80:
      BOOL v8 = 0;
      goto LABEL_81;
    }
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x800) == 0 || self->_subsId != *((_DWORD *)v4 + 16)) {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x800) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x1000) == 0 || self->_trackingAreaCode != *((_DWORD *)v4 + 17)) {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x1000) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0 || self->_psPref != *((_DWORD *)v4 + 11)) {
      goto LABEL_80;
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = (*((_WORD *)v4 + 40) & 0x100) == 0;
  }
LABEL_81:

  return v8;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v20 = 2654435761u * self->_timestamp;
    if ((has & 0x80) != 0)
    {
LABEL_3:
      uint64_t v19 = 2654435761 * self->_phyCellId;
      if ((has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v20 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v18 = 2654435761 * self->_dlFreq;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v18 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_5:
    uint64_t v17 = 2654435761 * self->_ulFreq;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v17 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    uint64_t v16 = 2654435761 * self->_dlBw;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v16 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_7:
    uint64_t v4 = 2654435761 * self->_ulBw;
    if ((has & 4) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    uint64_t v5 = 2654435761 * self->_cellId;
    if ((has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v6 = 2654435761 * self->_numMncDigits;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    uint64_t v7 = 2654435761 * self->_selPlmnMcc;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_11:
    uint64_t v8 = 2654435761 * self->_selPlmnMnc;
    if ((has & 2) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v9 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_23:
  uint64_t v8 = 0;
  if ((has & 2) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  uint64_t v9 = 2654435761 * self->_allowedAccess;
  if ((has & 0x40) != 0)
  {
LABEL_13:
    uint64_t v10 = 2654435761 * self->_numSubs;
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v10 = 0;
LABEL_26:
  unint64_t v11 = (unint64_t)[(NSData *)self->_simHplmn hash];
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    uint64_t v12 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_28;
    }
LABEL_31:
    uint64_t v13 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_29;
    }
LABEL_32:
    uint64_t v14 = 0;
    return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v11;
  }
  uint64_t v12 = 2654435761 * self->_subsId;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_31;
  }
LABEL_28:
  uint64_t v13 = 2654435761 * self->_trackingAreaCode;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_32;
  }
LABEL_29:
  uint64_t v14 = 2654435761 * self->_psPref;
  return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 40);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 40);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_phyCellId = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_dlFreq = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x4000) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_ulFreq = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_dlBw = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x2000) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_ulBw = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_cellId = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_numMncDigits = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_selPlmnMcc = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x400) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_selPlmnMnc = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_33:
  self->_allowedAccess = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 40) & 0x40) != 0)
  {
LABEL_13:
    self->_numSubs = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_14:
  if (*((void *)v4 + 7))
  {
    id v7 = v4;
    -[CellularNrScellInfo setSimHplmn:](self, "setSimHplmn:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 40);
  if ((v6 & 0x800) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v6 = *((_WORD *)v4 + 40);
    if ((v6 & 0x1000) == 0)
    {
LABEL_18:
      if ((v6 & 0x100) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x1000) == 0)
  {
    goto LABEL_18;
  }
  self->_trackingAreaCode = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
LABEL_19:
    self->_psPref = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_20:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)phyCellId
{
  return self->_phyCellId;
}

- (unsigned)dlFreq
{
  return self->_dlFreq;
}

- (unsigned)ulFreq
{
  return self->_ulFreq;
}

- (unsigned)dlBw
{
  return self->_dlBw;
}

- (unsigned)ulBw
{
  return self->_ulBw;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)numMncDigits
{
  return self->_numMncDigits;
}

- (unsigned)selPlmnMcc
{
  return self->_selPlmnMcc;
}

- (unsigned)selPlmnMnc
{
  return self->_selPlmnMnc;
}

- (unsigned)allowedAccess
{
  return self->_allowedAccess;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (NSData)simHplmn
{
  return self->_simHplmn;
}

- (void)setSimHplmn:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)trackingAreaCode
{
  return self->_trackingAreaCode;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (void).cxx_destruct
{
}

@end