@interface CellularLteScellInfo
- (BOOL)cellIsApo;
- (BOOL)hasAllowedAccess;
- (BOOL)hasCellId;
- (BOOL)hasCellIsApo;
- (BOOL)hasDlBw;
- (BOOL)hasDlFreq;
- (BOOL)hasFreqBandInd;
- (BOOL)hasHstCellInfo;
- (BOOL)hasNumMncDigits;
- (BOOL)hasNumSubs;
- (BOOL)hasPhyCellId;
- (BOOL)hasPrioOfCampedLteBand;
- (BOOL)hasPsPref;
- (BOOL)hasSelPlmnMcc;
- (BOOL)hasSelPlmnMnc;
- (BOOL)hasSimHplmn;
- (BOOL)hasSubsId;
- (BOOL)hasTddSfAssignment;
- (BOOL)hasTddSsfPatterns;
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
- (unsigned)freqBandInd;
- (unsigned)hstCellInfo;
- (unsigned)numMncDigits;
- (unsigned)numSubs;
- (unsigned)phyCellId;
- (unsigned)prioOfCampedLteBand;
- (unsigned)psPref;
- (unsigned)selPlmnMcc;
- (unsigned)selPlmnMnc;
- (unsigned)subsId;
- (unsigned)tddSfAssignment;
- (unsigned)tddSsfPatterns;
- (unsigned)trackingAreaCode;
- (unsigned)ulBw;
- (unsigned)ulFreq;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowedAccess:(unsigned int)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setCellIsApo:(BOOL)a3;
- (void)setDlBw:(unsigned int)a3;
- (void)setDlFreq:(unsigned int)a3;
- (void)setFreqBandInd:(unsigned int)a3;
- (void)setHasAllowedAccess:(BOOL)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasCellIsApo:(BOOL)a3;
- (void)setHasDlBw:(BOOL)a3;
- (void)setHasDlFreq:(BOOL)a3;
- (void)setHasFreqBandInd:(BOOL)a3;
- (void)setHasHstCellInfo:(BOOL)a3;
- (void)setHasNumMncDigits:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPhyCellId:(BOOL)a3;
- (void)setHasPrioOfCampedLteBand:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasSelPlmnMcc:(BOOL)a3;
- (void)setHasSelPlmnMnc:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTddSfAssignment:(BOOL)a3;
- (void)setHasTddSsfPatterns:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTrackingAreaCode:(BOOL)a3;
- (void)setHasUlBw:(BOOL)a3;
- (void)setHasUlFreq:(BOOL)a3;
- (void)setHstCellInfo:(unsigned int)a3;
- (void)setNumMncDigits:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPhyCellId:(unsigned int)a3;
- (void)setPrioOfCampedLteBand:(unsigned int)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setSelPlmnMcc:(unsigned int)a3;
- (void)setSelPlmnMnc:(unsigned int)a3;
- (void)setSimHplmn:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTddSfAssignment:(unsigned int)a3;
- (void)setTddSsfPatterns:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTrackingAreaCode:(unsigned int)a3;
- (void)setUlBw:(unsigned int)a3;
- (void)setUlFreq:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLteScellInfo

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPhyCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_phyCellId = a3;
}

- (void)setHasPhyCellId:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPhyCellId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setDlFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dlFreq = a3;
}

- (void)setHasDlFreq:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDlFreq
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setUlFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_ulFreq = a3;
}

- (void)setHasUlFreq:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasUlFreq
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setDlBw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_dlBw = a3;
}

- (void)setHasDlBw:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDlBw
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setUlBw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_ulBw = a3;
}

- (void)setHasUlBw:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasUlBw
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCellId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFreqBandInd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_freqBandInd = a3;
}

- (void)setHasFreqBandInd:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasFreqBandInd
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTrackingAreaCode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_trackingAreaCode = a3;
}

- (void)setHasTrackingAreaCode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTrackingAreaCode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasNumMncDigits
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setSelPlmnMcc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_selPlmnMcc = a3;
}

- (void)setHasSelPlmnMcc:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSelPlmnMcc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSelPlmnMnc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_selPlmnMnc = a3;
}

- (void)setHasSelPlmnMnc:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSelPlmnMnc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setAllowedAccess:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_allowedAccess = a3;
}

- (void)setHasAllowedAccess:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAllowedAccess
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTddSfAssignment:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_tddSfAssignment = a3;
}

- (void)setHasTddSfAssignment:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTddSfAssignment
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTddSsfPatterns:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_tddSsfPatterns = a3;
}

- (void)setHasTddSsfPatterns:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTddSsfPatterns
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setCellIsApo:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_cellIsApo = a3;
}

- (void)setHasCellIsApo:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasCellIsApo
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHstCellInfo:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hstCellInfo = a3;
}

- (void)setHasHstCellInfo:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHstCellInfo
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPrioOfCampedLteBand:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_prioOfCampedLteBand = a3;
}

- (void)setHasPrioOfCampedLteBand:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPrioOfCampedLteBand
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNumSubs
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPsPref
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLteScellInfo;
  int v3 = [(CellularLteScellInfo *)&v7 description];
  v4 = [(CellularLteScellInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if (*(unsigned char *)&has)
  {
    v11 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v11 forKey:@"timestamp"];

    $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  v12 = +[NSNumber numberWithUnsignedInt:self->_phyCellId];
  [v3 setObject:v12 forKey:@"phy_cell_id"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  v13 = +[NSNumber numberWithUnsignedInt:self->_dlFreq];
  [v3 setObject:v13 forKey:@"dl_freq"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  v14 = +[NSNumber numberWithUnsignedInt:self->_ulFreq];
  [v3 setObject:v14 forKey:@"ul_freq"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  v15 = +[NSNumber numberWithUnsignedInt:self->_dlBw];
  [v3 setObject:v15 forKey:@"dl_bw"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  v16 = +[NSNumber numberWithUnsignedInt:self->_ulBw];
  [v3 setObject:v16 forKey:@"ul_bw"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  v17 = +[NSNumber numberWithUnsignedInt:self->_cellId];
  [v3 setObject:v17 forKey:@"cell_id"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  v18 = +[NSNumber numberWithUnsignedInt:self->_freqBandInd];
  [v3 setObject:v18 forKey:@"freq_band_ind"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  v19 = +[NSNumber numberWithUnsignedInt:self->_trackingAreaCode];
  [v3 setObject:v19 forKey:@"tracking_area_code"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  v20 = +[NSNumber numberWithUnsignedInt:self->_numMncDigits];
  [v3 setObject:v20 forKey:@"num_mnc_digits"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  v21 = +[NSNumber numberWithUnsignedInt:self->_selPlmnMcc];
  [v3 setObject:v21 forKey:@"sel_plmn_mcc"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  v22 = +[NSNumber numberWithUnsignedInt:self->_selPlmnMnc];
  [v3 setObject:v22 forKey:@"sel_plmn_mnc"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  v23 = +[NSNumber numberWithUnsignedInt:self->_allowedAccess];
  [v3 setObject:v23 forKey:@"allowed_access"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  v24 = +[NSNumber numberWithUnsignedInt:self->_tddSfAssignment];
  [v3 setObject:v24 forKey:@"tdd_sf_assignment"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  v25 = +[NSNumber numberWithUnsignedInt:self->_tddSsfPatterns];
  [v3 setObject:v25 forKey:@"tdd_ssf_patterns"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  v26 = +[NSNumber numberWithBool:self->_cellIsApo];
  [v3 setObject:v26 forKey:@"cell_is_apo"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  v27 = +[NSNumber numberWithUnsignedInt:self->_hstCellInfo];
  [v3 setObject:v27 forKey:@"hst_cell_info"];

  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_47:
  v28 = +[NSNumber numberWithUnsignedInt:self->_prioOfCampedLteBand];
  [v3 setObject:v28 forKey:@"prio_of_camped_lte_band"];

  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_20:
    v5 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v5 forKey:@"num_subs"];
  }
LABEL_21:
  simHplmn = self->_simHplmn;
  if (simHplmn) {
    [v3 setObject:simHplmn forKey:@"sim_hplmn"];
  }
  $B447797CE4B35B31ADD9032D7D2FFCDF v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) != 0)
  {
    v8 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v8 forKey:@"subs_id"];

    $B447797CE4B35B31ADD9032D7D2FFCDF v7 = self->_has;
  }
  if ((*(_WORD *)&v7 & 0x800) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v9 forKey:@"ps_pref"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100135848((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x100) != 0) {
LABEL_20:
  }
    PBDataWriterWriteUint32Field();
LABEL_21:
  if (self->_simHplmn) {
    PBDataWriterWriteDataField();
  }
  $B447797CE4B35B31ADD9032D7D2FFCDF v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $B447797CE4B35B31ADD9032D7D2FFCDF v5 = self->_has;
  }
  if ((*(_WORD *)&v5 & 0x800) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 27) |= 1u;
    $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 12) = self->_phyCellId;
  *((_DWORD *)v4 + 27) |= 0x200u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 7) = self->_dlFreq;
  *((_DWORD *)v4 + 27) |= 0x10u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 25) = self->_ulFreq;
  *((_DWORD *)v4 + 27) |= 0x80000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 6) = self->_dlBw;
  *((_DWORD *)v4 + 27) |= 8u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 24) = self->_ulBw;
  *((_DWORD *)v4 + 27) |= 0x40000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 5) = self->_cellId;
  *((_DWORD *)v4 + 27) |= 4u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 8) = self->_freqBandInd;
  *((_DWORD *)v4 + 27) |= 0x20u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 23) = self->_trackingAreaCode;
  *((_DWORD *)v4 + 27) |= 0x20000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 10) = self->_numMncDigits;
  *((_DWORD *)v4 + 27) |= 0x80u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 15) = self->_selPlmnMcc;
  *((_DWORD *)v4 + 27) |= 0x1000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 16) = self->_selPlmnMnc;
  *((_DWORD *)v4 + 27) |= 0x2000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 4) = self->_allowedAccess;
  *((_DWORD *)v4 + 27) |= 2u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 21) = self->_tddSfAssignment;
  *((_DWORD *)v4 + 27) |= 0x8000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 22) = self->_tddSsfPatterns;
  *((_DWORD *)v4 + 27) |= 0x10000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((unsigned char *)v4 + 104) = self->_cellIsApo;
  *((_DWORD *)v4 + 27) |= 0x100000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 9) = self->_hstCellInfo;
  *((_DWORD *)v4 + 27) |= 0x40u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_47:
  *((_DWORD *)v4 + 13) = self->_prioOfCampedLteBand;
  *((_DWORD *)v4 + 27) |= 0x400u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_20:
    *((_DWORD *)v4 + 11) = self->_numSubs;
    *((_DWORD *)v4 + 27) |= 0x100u;
  }
LABEL_21:
  if (self->_simHplmn)
  {
    $B447797CE4B35B31ADD9032D7D2FFCDF v7 = v4;
    [v4 setSimHplmn:];
    v4 = v7;
  }
  $B447797CE4B35B31ADD9032D7D2FFCDF v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_subsId;
    *((_DWORD *)v4 + 27) |= 0x4000u;
    $B447797CE4B35B31ADD9032D7D2FFCDF v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_psPref;
    *((_DWORD *)v4 + 27) |= 0x800u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  $B447797CE4B35B31ADD9032D7D2FFCDF v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $B447797CE4B35B31ADD9032D7D2FFCDF v6 = v5;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if (*(unsigned char *)&has)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 27) |= 1u;
    $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 12) = self->_phyCellId;
  *((_DWORD *)v5 + 27) |= 0x200u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v5 + 7) = self->_dlFreq;
  *((_DWORD *)v5 + 27) |= 0x10u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v5 + 25) = self->_ulFreq;
  *((_DWORD *)v5 + 27) |= 0x80000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v5 + 6) = self->_dlBw;
  *((_DWORD *)v5 + 27) |= 8u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v5 + 24) = self->_ulBw;
  *((_DWORD *)v5 + 27) |= 0x40000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v5 + 5) = self->_cellId;
  *((_DWORD *)v5 + 27) |= 4u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v5 + 8) = self->_freqBandInd;
  *((_DWORD *)v5 + 27) |= 0x20u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v5 + 23) = self->_trackingAreaCode;
  *((_DWORD *)v5 + 27) |= 0x20000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v5 + 10) = self->_numMncDigits;
  *((_DWORD *)v5 + 27) |= 0x80u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v5 + 15) = self->_selPlmnMcc;
  *((_DWORD *)v5 + 27) |= 0x1000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v5 + 16) = self->_selPlmnMnc;
  *((_DWORD *)v5 + 27) |= 0x2000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v5 + 4) = self->_allowedAccess;
  *((_DWORD *)v5 + 27) |= 2u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v5 + 21) = self->_tddSfAssignment;
  *((_DWORD *)v5 + 27) |= 0x8000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v5 + 22) = self->_tddSsfPatterns;
  *((_DWORD *)v5 + 27) |= 0x10000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((unsigned char *)v5 + 104) = self->_cellIsApo;
  *((_DWORD *)v5 + 27) |= 0x100000u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v5 + 9) = self->_hstCellInfo;
  *((_DWORD *)v5 + 27) |= 0x40u;
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_43:
  *((_DWORD *)v5 + 13) = self->_prioOfCampedLteBand;
  *((_DWORD *)v5 + 27) |= 0x400u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_20:
    *((_DWORD *)v5 + 11) = self->_numSubs;
    *((_DWORD *)v5 + 27) |= 0x100u;
  }
LABEL_21:
  id v8 = [(NSData *)self->_simHplmn copyWithZone:a3];
  v9 = (void *)v6[9];
  v6[9] = v8;

  $B447797CE4B35B31ADD9032D7D2FFCDF v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    *((_DWORD *)v6 + 20) = self->_subsId;
    *((_DWORD *)v6 + 27) |= 0x4000u;
    $B447797CE4B35B31ADD9032D7D2FFCDF v10 = self->_has;
  }
  if ((*(_WORD *)&v10 & 0x800) != 0)
  {
    *((_DWORD *)v6 + 14) = self->_psPref;
    *((_DWORD *)v6 + 27) |= 0x800u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_113;
  }
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  int v6 = *((_DWORD *)v4 + 27);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_113;
    }
  }
  else if (v6)
  {
    goto LABEL_113;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_phyCellId != *((_DWORD *)v4 + 12)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_113;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_dlFreq != *((_DWORD *)v4 + 7)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_ulFreq != *((_DWORD *)v4 + 25)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_dlBw != *((_DWORD *)v4 + 6)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_ulBw != *((_DWORD *)v4 + 24)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_cellId != *((_DWORD *)v4 + 5)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_113;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 8)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_trackingAreaCode != *((_DWORD *)v4 + 23)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 10)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_selPlmnMcc != *((_DWORD *)v4 + 15)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_selPlmnMnc != *((_DWORD *)v4 + 16)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_allowedAccess != *((_DWORD *)v4 + 4)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_tddSfAssignment != *((_DWORD *)v4 + 21)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_tddSsfPatterns != *((_DWORD *)v4 + 22)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0) {
      goto LABEL_113;
    }
    if (self->_cellIsApo)
    {
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_113;
      }
    }
    else if (*((unsigned char *)v4 + 104))
    {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_hstCellInfo != *((_DWORD *)v4 + 9)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_prioOfCampedLteBand != *((_DWORD *)v4 + 13)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_numSubs != *((_DWORD *)v4 + 11)) {
      goto LABEL_113;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_113;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((void *)v4 + 9))
  {
    if (-[NSData isEqual:](simHplmn, "isEqual:"))
    {
      $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
      goto LABEL_103;
    }
LABEL_113:
    BOOL v9 = 0;
    goto LABEL_114;
  }
LABEL_103:
  int v8 = *((_DWORD *)v4 + 27);
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0 || self->_subsId != *((_DWORD *)v4 + 20)) {
      goto LABEL_113;
    }
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_psPref != *((_DWORD *)v4 + 14)) {
      goto LABEL_113;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (*((_DWORD *)v4 + 27) & 0x800) == 0;
  }
LABEL_114:

  return v9;
}

- (unint64_t)hash
{
  $B447797CE4B35B31ADD9032D7D2FFCDF has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v28 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x200) != 0)
    {
LABEL_3:
      uint64_t v27 = 2654435761 * self->_phyCellId;
      if ((*(unsigned char *)&has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else
  {
    unint64_t v28 = 0;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v27 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v26 = 2654435761 * self->_dlFreq;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_5:
    uint64_t v25 = 2654435761 * self->_ulFreq;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v25 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_6:
    uint64_t v24 = 2654435761 * self->_dlBw;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_7:
    uint64_t v23 = 2654435761 * self->_ulBw;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v23 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_8:
    uint64_t v22 = 2654435761 * self->_cellId;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v22 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v21 = 2654435761 * self->_freqBandInd;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v21 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_10:
    uint64_t v20 = 2654435761 * self->_trackingAreaCode;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_11:
    uint64_t v19 = 2654435761 * self->_numMncDigits;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v19 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_12:
    uint64_t v17 = 2654435761 * self->_selPlmnMcc;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_13:
    uint64_t v4 = 2654435761 * self->_selPlmnMnc;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_14:
    uint64_t v5 = 2654435761 * self->_allowedAccess;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v5 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_15:
    uint64_t v6 = 2654435761 * self->_tddSfAssignment;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_16:
    uint64_t v7 = 2654435761 * self->_tddSsfPatterns;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_17:
    uint64_t v8 = 2654435761 * self->_cellIsApo;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_18:
    uint64_t v9 = 2654435761 * self->_hstCellInfo;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_19;
    }
LABEL_38:
    uint64_t v10 = 0;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_20;
    }
    goto LABEL_39;
  }
LABEL_37:
  uint64_t v9 = 0;
  if ((*(_WORD *)&has & 0x400) == 0) {
    goto LABEL_38;
  }
LABEL_19:
  uint64_t v10 = 2654435761 * self->_prioOfCampedLteBand;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_20:
    uint64_t v11 = 2654435761 * self->_numSubs;
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v11 = 0;
LABEL_40:
  unint64_t v12 = (unint64_t)[(NSData *)self->_simHplmn hash];
  $B447797CE4B35B31ADD9032D7D2FFCDF v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
    uint64_t v14 = 2654435761 * self->_subsId;
    if ((*(_WORD *)&v13 & 0x800) != 0) {
      goto LABEL_42;
    }
LABEL_44:
    uint64_t v15 = 0;
    return v27 ^ v28 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v14 ^ v15 ^ v12;
  }
  uint64_t v14 = 0;
  if ((*(_WORD *)&v13 & 0x800) == 0) {
    goto LABEL_44;
  }
LABEL_42:
  uint64_t v15 = 2654435761 * self->_psPref;
  return v27 ^ v28 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v14 ^ v15 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 27);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)v4 + 27);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((v5 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_phyCellId = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_dlFreq = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x80000) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_ulFreq = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_dlBw = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x40000) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_ulBw = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_cellId = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_freqBandInd = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x20000) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_trackingAreaCode = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_numMncDigits = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x1000) == 0)
  {
LABEL_12:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_selPlmnMcc = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x2000) == 0)
  {
LABEL_13:
    if ((v5 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_selPlmnMnc = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 2) == 0)
  {
LABEL_14:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_allowedAccess = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x8000) == 0)
  {
LABEL_15:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_tddSfAssignment = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x10000) == 0)
  {
LABEL_16:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_tddSsfPatterns = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x100000) == 0)
  {
LABEL_17:
    if ((v5 & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_cellIsApo = *((unsigned char *)v4 + 104);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x40) == 0)
  {
LABEL_18:
    if ((v5 & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_hstCellInfo = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x400) == 0)
  {
LABEL_19:
    if ((v5 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_47:
  self->_prioOfCampedLteBand = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  if ((*((_DWORD *)v4 + 27) & 0x100) != 0)
  {
LABEL_20:
    self->_numSubs = *((_DWORD *)v4 + 11);
    *(_DWORD *)&self->_has |= 0x100u;
  }
LABEL_21:
  if (*((void *)v4 + 9))
  {
    id v7 = v4;
    -[CellularLteScellInfo setSimHplmn:](self, "setSimHplmn:");
    id v4 = v7;
  }
  int v6 = *((_DWORD *)v4 + 27);
  if ((v6 & 0x4000) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x4000u;
    int v6 = *((_DWORD *)v4 + 27);
  }
  if ((v6 & 0x800) != 0)
  {
    self->_psPref = *((_DWORD *)v4 + 14);
    *(_DWORD *)&self->_has |= 0x800u;
  }
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

- (unsigned)freqBandInd
{
  return self->_freqBandInd;
}

- (unsigned)trackingAreaCode
{
  return self->_trackingAreaCode;
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

- (unsigned)tddSfAssignment
{
  return self->_tddSfAssignment;
}

- (unsigned)tddSsfPatterns
{
  return self->_tddSsfPatterns;
}

- (BOOL)cellIsApo
{
  return self->_cellIsApo;
}

- (unsigned)hstCellInfo
{
  return self->_hstCellInfo;
}

- (unsigned)prioOfCampedLteBand
{
  return self->_prioOfCampedLteBand;
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

- (unsigned)psPref
{
  return self->_psPref;
}

- (void).cxx_destruct
{
}

@end