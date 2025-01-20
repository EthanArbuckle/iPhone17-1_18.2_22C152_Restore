@interface CellularNrRachAttempt
+ (Class)servingCellBeamInfoType;
- (BOOL)hasAccbState;
- (BOOL)hasCarrierId;
- (BOOL)hasCellId;
- (BOOL)hasCsiRsId;
- (BOOL)hasDcMode;
- (BOOL)hasFreqBandInd;
- (BOOL)hasFreqRange;
- (BOOL)hasLastTxPower;
- (BOOL)hasNumAttempt;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasRachContention;
- (BOOL)hasRachReason;
- (BOOL)hasRachResult;
- (BOOL)hasSsbId;
- (BOOL)hasSubsId;
- (BOOL)hasTac;
- (BOOL)hasTimestamp;
- (BOOL)hasTxPowerDiff;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (NSMutableArray)servingCellBeamInfos;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)servingCellBeamInfoAtIndex:(unint64_t)a3;
- (int)lastTxPower;
- (int)txPowerDiff;
- (unint64_t)hash;
- (unint64_t)servingCellBeamInfosCount;
- (unint64_t)timestamp;
- (unsigned)accbState;
- (unsigned)carrierId;
- (unsigned)cellId;
- (unsigned)csiRsId;
- (unsigned)dcMode;
- (unsigned)freqBandInd;
- (unsigned)freqRange;
- (unsigned)numAttempt;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)rachContention;
- (unsigned)rachReason;
- (unsigned)rachResult;
- (unsigned)ssbId;
- (unsigned)subsId;
- (unsigned)tac;
- (void)addServingCellBeamInfo:(id)a3;
- (void)clearServingCellBeamInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccbState:(unsigned int)a3;
- (void)setCarrierId:(unsigned int)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setCsiRsId:(unsigned int)a3;
- (void)setDcMode:(unsigned int)a3;
- (void)setFreqBandInd:(unsigned int)a3;
- (void)setFreqRange:(unsigned int)a3;
- (void)setHasAccbState:(BOOL)a3;
- (void)setHasCarrierId:(BOOL)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasCsiRsId:(BOOL)a3;
- (void)setHasDcMode:(BOOL)a3;
- (void)setHasFreqBandInd:(BOOL)a3;
- (void)setHasFreqRange:(BOOL)a3;
- (void)setHasLastTxPower:(BOOL)a3;
- (void)setHasNumAttempt:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasRachContention:(BOOL)a3;
- (void)setHasRachReason:(BOOL)a3;
- (void)setHasRachResult:(BOOL)a3;
- (void)setHasSsbId:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTac:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTxPowerDiff:(BOOL)a3;
- (void)setLastTxPower:(int)a3;
- (void)setNumAttempt:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setRachContention:(unsigned int)a3;
- (void)setRachReason:(unsigned int)a3;
- (void)setRachResult:(unsigned int)a3;
- (void)setServingCellBeamInfos:(id)a3;
- (void)setSsbId:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTac:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxPowerDiff:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrRachAttempt

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setNumAttempt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_numAttempt = a3;
}

- (void)setHasNumAttempt:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasNumAttempt
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRachResult:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_rachResult = a3;
}

- (void)setHasRachResult:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRachResult
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setRachContention:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_rachContention = a3;
}

- (void)setHasRachContention:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRachContention
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSsbId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_ssbId = a3;
}

- (void)setHasSsbId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSsbId
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setCsiRsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_csiRsId = a3;
}

- (void)setHasCsiRsId:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCsiRsId
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCarrierId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_carrierId = a3;
}

- (void)setHasCarrierId:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCarrierId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLastTxPower:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_lastTxPower = a3;
}

- (void)setHasLastTxPower:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLastTxPower
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setTac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_tac = a3;
}

- (void)setHasTac:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTac
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCellId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAccbState:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_accbState = a3;
}

- (void)setHasAccbState:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAccbState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNumSubs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSubsId
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setRachReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rachReason = a3;
}

- (void)setHasRachReason:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRachReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTxPowerDiff:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_txPowerDiff = a3;
}

- (void)setHasTxPowerDiff:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTxPowerDiff
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setDcMode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dcMode = a3;
}

- (void)setHasDcMode:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDcMode
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
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
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPsPref
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setFreqRange:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_freqRange = a3;
}

- (void)setHasFreqRange:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasFreqRange
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setFreqBandInd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_freqBandInd = a3;
}

- (void)setHasFreqBandInd:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasFreqBandInd
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)clearServingCellBeamInfos
{
}

- (void)addServingCellBeamInfo:(id)a3
{
  id v4 = a3;
  servingCellBeamInfos = self->_servingCellBeamInfos;
  id v8 = v4;
  if (!servingCellBeamInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_servingCellBeamInfos;
    self->_servingCellBeamInfos = v6;

    id v4 = v8;
    servingCellBeamInfos = self->_servingCellBeamInfos;
  }
  [(NSMutableArray *)servingCellBeamInfos addObject:v4];
}

- (unint64_t)servingCellBeamInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_servingCellBeamInfos count];
}

- (id)servingCellBeamInfoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_servingCellBeamInfos objectAtIndex:a3];
}

+ (Class)servingCellBeamInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrRachAttempt;
  int v3 = [(CellularNrRachAttempt *)&v7 description];
  id v4 = [(CellularNrRachAttempt *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if (*(unsigned char *)&has)
  {
    v17 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v17 forKey:@"timestamp"];

    $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  v18 = +[NSNumber numberWithUnsignedInt:self->_numAttempt];
  [v3 setObject:v18 forKey:@"num_attempt"];

  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  v19 = +[NSNumber numberWithUnsignedInt:self->_rachResult];
  [v3 setObject:v19 forKey:@"rach_result"];

  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  v20 = +[NSNumber numberWithUnsignedInt:self->_rachContention];
  [v3 setObject:v20 forKey:@"rach_contention"];

  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  v21 = +[NSNumber numberWithUnsignedInt:self->_ssbId];
  [v3 setObject:v21 forKey:@"ssb_id"];

  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_42;
  }
LABEL_41:
  v22 = +[NSNumber numberWithUnsignedInt:self->_csiRsId];
  [v3 setObject:v22 forKey:@"csi_rs_id"];

  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  v23 = +[NSNumber numberWithUnsignedInt:self->_carrierId];
  [v3 setObject:v23 forKey:@"carrier_id"];

  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
LABEL_43:
  v24 = +[NSNumber numberWithInt:self->_lastTxPower];
  [v3 setObject:v24 forKey:@"last_tx_power"];

  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  v25 = +[NSNumber numberWithUnsignedInt:self->_tac];
  [v3 setObject:v25 forKey:@"tac"];

  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_45:
  v26 = +[NSNumber numberWithUnsignedInt:self->_cellId];
  [v3 setObject:v26 forKey:@"cell_id"];

  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_46:
  v27 = +[NSNumber numberWithUnsignedInt:self->_accbState];
  [v3 setObject:v27 forKey:@"accb_state"];

  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_13:
    v5 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v5 forKey:@"num_subs"];
  }
LABEL_14:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  $CA3C5A67E5C9B5875AF43B507ECCA79F v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000) != 0)
  {
    v28 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v28 forKey:@"subs_id"];

    $CA3C5A67E5C9B5875AF43B507ECCA79F v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x2000) == 0)
    {
LABEL_18:
      if ((*(_DWORD *)&v7 & 0x40000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_50;
    }
  }
  else if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
    goto LABEL_18;
  }
  v29 = +[NSNumber numberWithUnsignedInt:self->_rachReason];
  [v3 setObject:v29 forKey:@"rach_reason"];

  $CA3C5A67E5C9B5875AF43B507ECCA79F v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  v30 = +[NSNumber numberWithInt:self->_txPowerDiff];
  [v3 setObject:v30 forKey:@"tx_power_diff"];

  $CA3C5A67E5C9B5875AF43B507ECCA79F v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v7 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  v31 = +[NSNumber numberWithUnsignedInt:self->_dcMode];
  [v3 setObject:v31 forKey:@"dc_mode"];

  $CA3C5A67E5C9B5875AF43B507ECCA79F v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v7 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  v32 = +[NSNumber numberWithUnsignedInt:self->_psPref];
  [v3 setObject:v32 forKey:@"ps_pref"];

  $CA3C5A67E5C9B5875AF43B507ECCA79F v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v7 & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_53:
  v33 = +[NSNumber numberWithUnsignedInt:self->_freqRange];
  [v3 setObject:v33 forKey:@"freq_range"];

  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_23:
    id v8 = +[NSNumber numberWithUnsignedInt:self->_freqBandInd];
    [v3 setObject:v8 forKey:@"freq_band_ind"];
  }
LABEL_24:
  if ([(NSMutableArray *)self->_servingCellBeamInfos count])
  {
    id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_servingCellBeamInfos, "count")];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v10 = self->_servingCellBeamInfos;
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v35;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"serving_cell_beam_info"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000693F4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteSint32Field();
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x400) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint32Field();
LABEL_14:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  $CA3C5A67E5C9B5875AF43B507ECCA79F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $CA3C5A67E5C9B5875AF43B507ECCA79F v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x2000) == 0)
    {
LABEL_18:
      if ((*(_DWORD *)&v6 & 0x40000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field();
  $CA3C5A67E5C9B5875AF43B507ECCA79F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteSint32Field();
  $CA3C5A67E5C9B5875AF43B507ECCA79F v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  $CA3C5A67E5C9B5875AF43B507ECCA79F v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  $CA3C5A67E5C9B5875AF43B507ECCA79F v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x40) != 0) {
LABEL_23:
  }
    PBDataWriterWriteUint32Field();
LABEL_24:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F v7 = self->_servingCellBeamInfos;
  id v8 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      id v9 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 26) |= 1u;
    $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 12) = self->_numAttempt;
  *((_DWORD *)v4 + 26) |= 0x200u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 19) = self->_rachResult;
  *((_DWORD *)v4 + 26) |= 0x4000u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 17) = self->_rachContention;
  *((_DWORD *)v4 + 26) |= 0x1000u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 22) = self->_ssbId;
  *((_DWORD *)v4 + 26) |= 0x8000u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 7) = self->_csiRsId;
  *((_DWORD *)v4 + 26) |= 0x10u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 5) = self->_carrierId;
  *((_DWORD *)v4 + 26) |= 4u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 11) = self->_lastTxPower;
  *((_DWORD *)v4 + 26) |= 0x100u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 24) = self->_tac;
  *((_DWORD *)v4 + 26) |= 0x20000u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 6) = self->_cellId;
  *((_DWORD *)v4 + 26) |= 8u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_41:
  *((_DWORD *)v4 + 4) = self->_accbState;
  *((_DWORD *)v4 + 26) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 13) = self->_numSubs;
    *((_DWORD *)v4 + 26) |= 0x400u;
  }
LABEL_14:
  id v11 = v4;
  if (self->_plmn)
  {
    [v4 setPlmn];
    id v4 = v11;
  }
  $CA3C5A67E5C9B5875AF43B507ECCA79F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) != 0)
  {
    *((_DWORD *)v4 + 23) = self->_subsId;
    *((_DWORD *)v4 + 26) |= 0x10000u;
    $CA3C5A67E5C9B5875AF43B507ECCA79F v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x2000) == 0)
    {
LABEL_18:
      if ((*(_DWORD *)&v6 & 0x40000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
    goto LABEL_18;
  }
  *((_DWORD *)v4 + 18) = self->_rachReason;
  *((_DWORD *)v4 + 26) |= 0x2000u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 25) = self->_txPowerDiff;
  *((_DWORD *)v4 + 26) |= 0x40000u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 8) = self->_dcMode;
  *((_DWORD *)v4 + 26) |= 0x20u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_22;
    }
LABEL_48:
    *((_DWORD *)v4 + 10) = self->_freqRange;
    *((_DWORD *)v4 + 26) |= 0x80u;
    if ((*(_DWORD *)&self->_has & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_47:
  *((_DWORD *)v4 + 16) = self->_psPref;
  *((_DWORD *)v4 + 26) |= 0x800u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) != 0) {
    goto LABEL_48;
  }
LABEL_22:
  if ((*(unsigned char *)&v6 & 0x40) != 0)
  {
LABEL_23:
    *((_DWORD *)v4 + 9) = self->_freqBandInd;
    *((_DWORD *)v4 + 26) |= 0x40u;
  }
LABEL_24:
  if ([(CellularNrRachAttempt *)self servingCellBeamInfosCount])
  {
    [v11 clearServingCellBeamInfos];
    unint64_t v7 = [(CellularNrRachAttempt *)self servingCellBeamInfosCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(CellularNrRachAttempt *)self servingCellBeamInfoAtIndex:i];
        [v11 addServingCellBeamInfo:v10];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  $CA3C5A67E5C9B5875AF43B507ECCA79F v6 = v5;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if (*(unsigned char *)&has)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 26) |= 1u;
    $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 12) = self->_numAttempt;
  *((_DWORD *)v5 + 26) |= 0x200u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v5 + 19) = self->_rachResult;
  *((_DWORD *)v5 + 26) |= 0x4000u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v5 + 17) = self->_rachContention;
  *((_DWORD *)v5 + 26) |= 0x1000u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v5 + 22) = self->_ssbId;
  *((_DWORD *)v5 + 26) |= 0x8000u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v5 + 7) = self->_csiRsId;
  *((_DWORD *)v5 + 26) |= 0x10u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v5 + 5) = self->_carrierId;
  *((_DWORD *)v5 + 26) |= 4u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v5 + 11) = self->_lastTxPower;
  *((_DWORD *)v5 + 26) |= 0x100u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v5 + 24) = self->_tac;
  *((_DWORD *)v5 + 26) |= 0x20000u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v5 + 6) = self->_cellId;
  *((_DWORD *)v5 + 26) |= 8u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_40:
  *((_DWORD *)v5 + 4) = self->_accbState;
  *((_DWORD *)v5 + 26) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_13:
    *((_DWORD *)v5 + 13) = self->_numSubs;
    *((_DWORD *)v5 + 26) |= 0x400u;
  }
LABEL_14:
  id v8 = [(NSData *)self->_plmn copyWithZone:a3];
  id v9 = (void *)v6[7];
  v6[7] = v8;

  $CA3C5A67E5C9B5875AF43B507ECCA79F v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
    *((_DWORD *)v6 + 23) = self->_subsId;
    *((_DWORD *)v6 + 26) |= 0x10000u;
    $CA3C5A67E5C9B5875AF43B507ECCA79F v10 = self->_has;
    if ((*(_WORD *)&v10 & 0x2000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v10 & 0x40000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_44;
    }
  }
  else if ((*(_WORD *)&v10 & 0x2000) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v6 + 18) = self->_rachReason;
  *((_DWORD *)v6 + 26) |= 0x2000u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v10 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v6 + 25) = self->_txPowerDiff;
  *((_DWORD *)v6 + 26) |= 0x40000u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x20) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v10 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v6 + 8) = self->_dcMode;
  *((_DWORD *)v6 + 26) |= 0x20u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x800) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v10 & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v6 + 16) = self->_psPref;
  *((_DWORD *)v6 + 26) |= 0x800u;
  $CA3C5A67E5C9B5875AF43B507ECCA79F v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x80) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v10 & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_47:
  *((_DWORD *)v6 + 10) = self->_freqRange;
  *((_DWORD *)v6 + 26) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_21:
    *((_DWORD *)v6 + 9) = self->_freqBandInd;
    *((_DWORD *)v6 + 26) |= 0x40u;
  }
LABEL_22:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = self->_servingCellBeamInfos;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      long long v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v15) copyWithZone:a3];
        [v6 addServingCellBeamInfo:v16];

        long long v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_102;
  }
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  int v6 = *((_DWORD *)v4 + 26);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_102;
    }
  }
  else if (v6)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_numAttempt != *((_DWORD *)v4 + 12)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_rachResult != *((_DWORD *)v4 + 19)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_rachContention != *((_DWORD *)v4 + 17)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_ssbId != *((_DWORD *)v4 + 22)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_csiRsId != *((_DWORD *)v4 + 7)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_carrierId != *((_DWORD *)v4 + 5)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_lastTxPower != *((_DWORD *)v4 + 11)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_tac != *((_DWORD *)v4 + 24)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_cellId != *((_DWORD *)v4 + 6)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_accbState != *((_DWORD *)v4 + 4)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_numSubs != *((_DWORD *)v4 + 13)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_102;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
    {
LABEL_102:
      unsigned __int8 v10 = 0;
      goto LABEL_103;
    }
    $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  }
  int v8 = *((_DWORD *)v4 + 26);
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_subsId != *((_DWORD *)v4 + 23)) {
      goto LABEL_102;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v8 & 0x2000) == 0 || self->_rachReason != *((_DWORD *)v4 + 18)) {
      goto LABEL_102;
    }
  }
  else if ((v8 & 0x2000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_txPowerDiff != *((_DWORD *)v4 + 25)) {
      goto LABEL_102;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_dcMode != *((_DWORD *)v4 + 8)) {
      goto LABEL_102;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_psPref != *((_DWORD *)v4 + 16)) {
      goto LABEL_102;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_freqRange != *((_DWORD *)v4 + 10)) {
      goto LABEL_102;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 9)) {
      goto LABEL_102;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_102;
  }
  servingCellBeamInfos = self->_servingCellBeamInfos;
  if ((unint64_t)servingCellBeamInfos | *((void *)v4 + 10)) {
    unsigned __int8 v10 = -[NSMutableArray isEqual:](servingCellBeamInfos, "isEqual:");
  }
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_103:

  return v10;
}

- (unint64_t)hash
{
  $CA3C5A67E5C9B5875AF43B507ECCA79F has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v25 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x200) != 0)
    {
LABEL_3:
      uint64_t v24 = 2654435761 * self->_numAttempt;
      if ((*(_WORD *)&has & 0x4000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v25 = 0;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v24 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_4:
    uint64_t v23 = 2654435761 * self->_rachResult;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v23 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_5:
    uint64_t v22 = 2654435761 * self->_rachContention;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v22 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_6:
    uint64_t v21 = 2654435761 * self->_ssbId;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v21 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v4 = 2654435761 * self->_csiRsId;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_8:
    uint64_t v5 = 2654435761 * self->_carrierId;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v5 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_9:
    uint64_t v6 = 2654435761 * self->_lastTxPower;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_10:
    uint64_t v7 = 2654435761 * self->_tac;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_11:
    uint64_t v8 = 2654435761 * self->_cellId;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v9 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_23:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&has & 2) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  uint64_t v9 = 2654435761 * self->_accbState;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_13:
    uint64_t v10 = 2654435761 * self->_numSubs;
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v10 = 0;
LABEL_26:
  unint64_t v11 = (unint64_t)[(NSData *)self->_plmn hash];
  $CA3C5A67E5C9B5875AF43B507ECCA79F v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) != 0)
  {
    uint64_t v13 = 2654435761 * self->_subsId;
    if ((*(_WORD *)&v12 & 0x2000) != 0)
    {
LABEL_28:
      uint64_t v14 = 2654435761 * self->_rachReason;
      if ((*(_DWORD *)&v12 & 0x40000) != 0) {
        goto LABEL_29;
      }
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(_WORD *)&v12 & 0x2000) != 0) {
      goto LABEL_28;
    }
  }
  uint64_t v14 = 0;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
LABEL_29:
    uint64_t v15 = 2654435761 * self->_txPowerDiff;
    if ((*(unsigned char *)&v12 & 0x20) != 0) {
      goto LABEL_30;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v15 = 0;
  if ((*(unsigned char *)&v12 & 0x20) != 0)
  {
LABEL_30:
    uint64_t v16 = 2654435761 * self->_dcMode;
    if ((*(_WORD *)&v12 & 0x800) != 0) {
      goto LABEL_31;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v16 = 0;
  if ((*(_WORD *)&v12 & 0x800) != 0)
  {
LABEL_31:
    uint64_t v17 = 2654435761 * self->_psPref;
    if ((*(unsigned char *)&v12 & 0x80) != 0) {
      goto LABEL_32;
    }
LABEL_39:
    uint64_t v18 = 0;
    if ((*(unsigned char *)&v12 & 0x40) != 0) {
      goto LABEL_33;
    }
LABEL_40:
    uint64_t v19 = 0;
    return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11 ^ v19 ^ (unint64_t)[(NSMutableArray *)self->_servingCellBeamInfos hash];
  }
LABEL_38:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&v12 & 0x80) == 0) {
    goto LABEL_39;
  }
LABEL_32:
  uint64_t v18 = 2654435761 * self->_freqRange;
  if ((*(unsigned char *)&v12 & 0x40) == 0) {
    goto LABEL_40;
  }
LABEL_33:
  uint64_t v19 = 2654435761 * self->_freqBandInd;
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11 ^ v19 ^ (unint64_t)[(NSMutableArray *)self->_servingCellBeamInfos hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int v6 = *((_DWORD *)v4 + 26);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v6 = *((_DWORD *)v4 + 26);
    if ((v6 & 0x200) == 0)
    {
LABEL_3:
      if ((v6 & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((v6 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_numAttempt = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x4000) == 0)
  {
LABEL_4:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_rachResult = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x1000) == 0)
  {
LABEL_5:
    if ((v6 & 0x8000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_rachContention = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x8000) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_ssbId = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x10) == 0)
  {
LABEL_7:
    if ((v6 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_csiRsId = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 4) == 0)
  {
LABEL_8:
    if ((v6 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_carrierId = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x100) == 0)
  {
LABEL_9:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_lastTxPower = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x20000) == 0)
  {
LABEL_10:
    if ((v6 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_tac = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 8) == 0)
  {
LABEL_11:
    if ((v6 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_cellId = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 2) == 0)
  {
LABEL_12:
    if ((v6 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_42:
  self->_accbState = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v4 + 26) & 0x400) != 0)
  {
LABEL_13:
    self->_numSubs = *((_DWORD *)v4 + 13);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_14:
  if (*((void *)v4 + 7)) {
    -[CellularNrRachAttempt setPlmn:](self, "setPlmn:");
  }
  int v7 = *((_DWORD *)v5 + 26);
  if ((v7 & 0x10000) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 23);
    *(_DWORD *)&self->_has |= 0x10000u;
    int v7 = *((_DWORD *)v5 + 26);
    if ((v7 & 0x2000) == 0)
    {
LABEL_18:
      if ((v7 & 0x40000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_46;
    }
  }
  else if ((v7 & 0x2000) == 0)
  {
    goto LABEL_18;
  }
  self->_rachReason = *((_DWORD *)v5 + 18);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v7 = *((_DWORD *)v5 + 26);
  if ((v7 & 0x40000) == 0)
  {
LABEL_19:
    if ((v7 & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_txPowerDiff = *((_DWORD *)v5 + 25);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v7 = *((_DWORD *)v5 + 26);
  if ((v7 & 0x20) == 0)
  {
LABEL_20:
    if ((v7 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_dcMode = *((_DWORD *)v5 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  int v7 = *((_DWORD *)v5 + 26);
  if ((v7 & 0x800) == 0)
  {
LABEL_21:
    if ((v7 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_psPref = *((_DWORD *)v5 + 16);
  *(_DWORD *)&self->_has |= 0x800u;
  int v7 = *((_DWORD *)v5 + 26);
  if ((v7 & 0x80) == 0)
  {
LABEL_22:
    if ((v7 & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_49:
  self->_freqRange = *((_DWORD *)v5 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)v5 + 26) & 0x40) != 0)
  {
LABEL_23:
    self->_freqBandInd = *((_DWORD *)v5 + 9);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_24:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v5 + 10);
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[CellularNrRachAttempt addServingCellBeamInfo:](self, "addServingCellBeamInfo:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)numAttempt
{
  return self->_numAttempt;
}

- (unsigned)rachResult
{
  return self->_rachResult;
}

- (unsigned)rachContention
{
  return self->_rachContention;
}

- (unsigned)ssbId
{
  return self->_ssbId;
}

- (unsigned)csiRsId
{
  return self->_csiRsId;
}

- (unsigned)carrierId
{
  return self->_carrierId;
}

- (int)lastTxPower
{
  return self->_lastTxPower;
}

- (unsigned)tac
{
  return self->_tac;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)accbState
{
  return self->_accbState;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)rachReason
{
  return self->_rachReason;
}

- (int)txPowerDiff
{
  return self->_txPowerDiff;
}

- (unsigned)dcMode
{
  return self->_dcMode;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (unsigned)freqRange
{
  return self->_freqRange;
}

- (unsigned)freqBandInd
{
  return self->_freqBandInd;
}

- (NSMutableArray)servingCellBeamInfos
{
  return self->_servingCellBeamInfos;
}

- (void)setServingCellBeamInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servingCellBeamInfos, 0);

  objc_storeStrong((id *)&self->_plmn, 0);
}

@end