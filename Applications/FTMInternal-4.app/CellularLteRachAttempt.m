@interface CellularLteRachAttempt
- (BOOL)cellIsApo;
- (BOOL)contentionBased;
- (BOOL)hasAccbState;
- (BOOL)hasCellId;
- (BOOL)hasCellIsApo;
- (BOOL)hasContentionBased;
- (BOOL)hasEarfcn;
- (BOOL)hasNumSubs;
- (BOOL)hasPMax;
- (BOOL)hasPlmn;
- (BOOL)hasRachResult;
- (BOOL)hasRetxCounter;
- (BOOL)hasRsrp;
- (BOOL)hasScellIndex;
- (BOOL)hasSubsId;
- (BOOL)hasTac;
- (BOOL)hasTimestamp;
- (BOOL)hasTxPowerLimited;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)txPowerLimited;
- (NSData)plmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rachResultAsString:(int)a3;
- (int)StringAsRachResult:(id)a3;
- (int)pMax;
- (int)rachResult;
- (int)rsrp;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)accbState;
- (unsigned)cellId;
- (unsigned)earfcn;
- (unsigned)numSubs;
- (unsigned)retxCounter;
- (unsigned)scellIndex;
- (unsigned)subsId;
- (unsigned)tac;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccbState:(unsigned int)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setCellIsApo:(BOOL)a3;
- (void)setContentionBased:(BOOL)a3;
- (void)setEarfcn:(unsigned int)a3;
- (void)setHasAccbState:(BOOL)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasCellIsApo:(BOOL)a3;
- (void)setHasContentionBased:(BOOL)a3;
- (void)setHasEarfcn:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPMax:(BOOL)a3;
- (void)setHasRachResult:(BOOL)a3;
- (void)setHasRetxCounter:(BOOL)a3;
- (void)setHasRsrp:(BOOL)a3;
- (void)setHasScellIndex:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTac:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTxPowerLimited:(BOOL)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPMax:(int)a3;
- (void)setPlmn:(id)a3;
- (void)setRachResult:(int)a3;
- (void)setRetxCounter:(unsigned int)a3;
- (void)setRsrp:(int)a3;
- (void)setScellIndex:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTac:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxPowerLimited:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLteRachAttempt

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

- (void)setRetxCounter:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_retxCounter = a3;
}

- (void)setHasRetxCounter:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRetxCounter
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (int)rachResult
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_rachResult;
  }
  else {
    return 0;
  }
}

- (void)setRachResult:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rachResult = a3;
}

- (void)setHasRachResult:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRachResult
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)rachResultAsString:(int)a3
{
  if (a3 >= 5)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_1002876E0 + a3);
  }

  return v3;
}

- (int)StringAsRachResult:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LTE_RACH_RESULT_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LTE_RACH_RESULT_FAIL_AT_MESG2"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LTE_RACH_RESULT_FAIL_AT_MESG4_CTT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LTE_RACH_RESULT_FAIL_AT_MESG4"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LTE_RACH_RESULT_ABORTED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setContentionBased:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_contentionBased = a3;
}

- (void)setHasContentionBased:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasContentionBased
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setPMax:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_pMax = a3;
}

- (void)setHasPMax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPMax
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRsrp:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rsrp = a3;
}

- (void)setHasRsrp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRsrp
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setEarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_earfcn = a3;
}

- (void)setHasEarfcn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasEarfcn
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTac:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_tac = a3;
}

- (void)setHasTac:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTac
{
  return (*(_WORD *)&self->_has >> 11) & 1;
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

- (void)setCellIsApo:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_cellIsApo = a3;
}

- (void)setHasCellIsApo:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasCellIsApo
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setAccbState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_accbState = a3;
}

- (void)setHasAccbState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAccbState
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setScellIndex:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_scellIndex = a3;
}

- (void)setHasScellIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasScellIndex
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTxPowerLimited:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_txPowerLimited = a3;
}

- (void)setHasTxPowerLimited:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasTxPowerLimited
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLteRachAttempt;
  __int16 v3 = [(CellularLteRachAttempt *)&v7 description];
  int v4 = [(CellularLteRachAttempt *)self dictionaryRepresentation];
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
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v11 = +[NSNumber numberWithUnsignedInt:self->_retxCounter];
  [v3 setObject:v11 forKey:@"retx_counter"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_32;
  }
LABEL_25:
  uint64_t rachResult = self->_rachResult;
  if (rachResult >= 5)
  {
    v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_rachResult];
  }
  else
  {
    v13 = *(&off_1002876E0 + rachResult);
  }
  [v3 setObject:v13 forKey:@"rach_result"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_33;
  }
LABEL_32:
  v16 = +[NSNumber numberWithBool:self->_contentionBased];
  [v3 setObject:v16 forKey:@"contention_based"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_34;
  }
LABEL_33:
  v17 = +[NSNumber numberWithInt:self->_pMax];
  [v3 setObject:v17 forKey:@"p_max"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_35;
  }
LABEL_34:
  v18 = +[NSNumber numberWithInt:self->_rsrp];
  [v3 setObject:v18 forKey:@"rsrp"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_36;
  }
LABEL_35:
  v19 = +[NSNumber numberWithUnsignedInt:self->_earfcn];
  [v3 setObject:v19 forKey:@"earfcn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_37;
  }
LABEL_36:
  v20 = +[NSNumber numberWithUnsignedInt:self->_tac];
  [v3 setObject:v20 forKey:@"tac"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_38;
  }
LABEL_37:
  v21 = +[NSNumber numberWithUnsignedInt:self->_cellId];
  [v3 setObject:v21 forKey:@"cell_id"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_39;
  }
LABEL_38:
  v22 = +[NSNumber numberWithBool:self->_cellIsApo];
  [v3 setObject:v22 forKey:@"cell_is_apo"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_39:
  v23 = +[NSNumber numberWithUnsignedInt:self->_accbState];
  [v3 setObject:v23 forKey:@"accb_state"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
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
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x400) != 0)
  {
    v14 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v14 forKey:@"subs_id"];

    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x200) == 0)
    {
LABEL_18:
      if ((v7 & 0x4000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_18;
  }
  v15 = +[NSNumber numberWithUnsignedInt:self->_scellIndex];
  [v3 setObject:v15 forKey:@"scell_index"];

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_19:
    v8 = +[NSNumber numberWithBool:self->_txPowerLimited];
    [v3 setObject:v8 forKey:@"tx_power_limited"];
  }
LABEL_20:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10008F250((uint64_t)self, (uint64_t)a3);
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
      if ((has & 0x40) == 0) {
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
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteSint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint32Field();
LABEL_14:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x200) == 0)
    {
LABEL_18:
      if ((v5 & 0x4000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x4000) != 0) {
LABEL_19:
  }
    PBDataWriterWriteBOOLField();
LABEL_20:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 38) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_retxCounter;
  *((_WORD *)v4 + 38) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 12) = self->_rachResult;
  *((_WORD *)v4 + 38) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((unsigned char *)v4 + 73) = self->_contentionBased;
  *((_WORD *)v4 + 38) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 8) = self->_pMax;
  *((_WORD *)v4 + 38) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 14) = self->_rsrp;
  *((_WORD *)v4 + 38) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 6) = self->_earfcn;
  *((_WORD *)v4 + 38) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 17) = self->_tac;
  *((_WORD *)v4 + 38) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 5) = self->_cellId;
  *((_WORD *)v4 + 38) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((unsigned char *)v4 + 72) = self->_cellIsApo;
  *((_WORD *)v4 + 38) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_33:
  *((_DWORD *)v4 + 4) = self->_accbState;
  *((_WORD *)v4 + 38) |= 2u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 7) = self->_numSubs;
    *((_WORD *)v4 + 38) |= 0x10u;
  }
LABEL_14:
  if (self->_plmn)
  {
    __int16 v7 = v4;
    [v4 setPlmn:];
    int v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_subsId;
    *((_WORD *)v4 + 38) |= 0x400u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x200) == 0)
    {
LABEL_18:
      if ((v6 & 0x4000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_18;
  }
  *((_DWORD *)v4 + 15) = self->_scellIndex;
  *((_WORD *)v4 + 38) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_19:
    *((unsigned char *)v4 + 74) = self->_txPowerLimited;
    *((_WORD *)v4 + 38) |= 0x4000u;
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
    *((_WORD *)v5 + 38) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 13) = self->_retxCounter;
  *((_WORD *)v5 + 38) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v5 + 12) = self->_rachResult;
  *((_WORD *)v5 + 38) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)v5 + 73) = self->_contentionBased;
  *((_WORD *)v5 + 38) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v5 + 8) = self->_pMax;
  *((_WORD *)v5 + 38) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 14) = self->_rsrp;
  *((_WORD *)v5 + 38) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v5 + 6) = self->_earfcn;
  *((_WORD *)v5 + 38) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v5 + 17) = self->_tac;
  *((_WORD *)v5 + 38) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v5 + 5) = self->_cellId;
  *((_WORD *)v5 + 38) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((unsigned char *)v5 + 72) = self->_cellIsApo;
  *((_WORD *)v5 + 38) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_29:
  *((_DWORD *)v5 + 4) = self->_accbState;
  *((_WORD *)v5 + 38) |= 2u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    *((_DWORD *)v5 + 7) = self->_numSubs;
    *((_WORD *)v5 + 38) |= 0x10u;
  }
LABEL_14:
  id v8 = [(NSData *)self->_plmn copyWithZone:a3];
  v9 = (void *)v6[5];
  v6[5] = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x400) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      goto LABEL_16;
    }
LABEL_32:
    *((_DWORD *)v6 + 15) = self->_scellIndex;
    *((_WORD *)v6 + 38) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x4000) == 0) {
      return v6;
    }
    goto LABEL_17;
  }
  *((_DWORD *)v6 + 16) = self->_subsId;
  *((_WORD *)v6 + 38) |= 0x400u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x200) != 0) {
    goto LABEL_32;
  }
LABEL_16:
  if ((v10 & 0x4000) != 0)
  {
LABEL_17:
    *((unsigned char *)v6 + 74) = self->_txPowerLimited;
    *((_WORD *)v6 + 38) |= 0x4000u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_84;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 38);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_84;
    }
  }
  else if (v6)
  {
    goto LABEL_84;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_retxCounter != *((_DWORD *)v4 + 13)) {
      goto LABEL_84;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_rachResult != *((_DWORD *)v4 + 12)) {
      goto LABEL_84;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x2000) == 0) {
      goto LABEL_84;
    }
    if (self->_contentionBased)
    {
      if (!*((unsigned char *)v4 + 73)) {
        goto LABEL_84;
      }
    }
    else if (*((unsigned char *)v4 + 73))
    {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x2000) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_pMax != *((_DWORD *)v4 + 8)) {
      goto LABEL_84;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x100) == 0 || self->_rsrp != *((_DWORD *)v4 + 14)) {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x100) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_earfcn != *((_DWORD *)v4 + 6)) {
      goto LABEL_84;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x800) == 0 || self->_tac != *((_DWORD *)v4 + 17)) {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x800) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_cellId != *((_DWORD *)v4 + 5)) {
      goto LABEL_84;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_84;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x1000) == 0) {
      goto LABEL_84;
    }
    if (self->_cellIsApo)
    {
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_84;
      }
    }
    else if (*((unsigned char *)v4 + 72))
    {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x1000) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_accbState != *((_DWORD *)v4 + 4)) {
      goto LABEL_84;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_numSubs != *((_DWORD *)v4 + 7)) {
      goto LABEL_84;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_84;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:")) {
      goto LABEL_84;
    }
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 16)) {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x400) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x200) == 0 || self->_scellIndex != *((_DWORD *)v4 + 15)) {
      goto LABEL_84;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x200) != 0)
  {
    goto LABEL_84;
  }
  if ((has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x4000) != 0)
    {
      if (self->_txPowerLimited)
      {
        if (!*((unsigned char *)v4 + 74)) {
          goto LABEL_84;
        }
      }
      else if (*((unsigned char *)v4 + 74))
      {
        goto LABEL_84;
      }
      BOOL v8 = 1;
      goto LABEL_85;
    }
LABEL_84:
    BOOL v8 = 0;
    goto LABEL_85;
  }
  BOOL v8 = (*((_WORD *)v4 + 38) & 0x4000) == 0;
LABEL_85:

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
      uint64_t v19 = 2654435761 * self->_retxCounter;
      if ((has & 0x40) != 0) {
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
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v18 = 2654435761 * self->_rachResult;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v18 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_5:
    uint64_t v17 = 2654435761 * self->_contentionBased;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v17 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v16 = 2654435761 * self->_pMax;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v16 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v4 = 2654435761 * self->_rsrp;
    if ((has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v4 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    uint64_t v5 = 2654435761 * self->_earfcn;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    uint64_t v6 = 2654435761 * self->_tac;
    if ((has & 4) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_10:
    uint64_t v7 = 2654435761 * self->_cellId;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_11:
    uint64_t v8 = 2654435761 * self->_cellIsApo;
    if ((has & 2) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v9 = 0;
    if ((has & 0x10) != 0) {
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
  uint64_t v9 = 2654435761 * self->_accbState;
  if ((has & 0x10) != 0)
  {
LABEL_13:
    uint64_t v10 = 2654435761 * self->_numSubs;
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v10 = 0;
LABEL_26:
  unint64_t v11 = (unint64_t)[(NSData *)self->_plmn hash];
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    uint64_t v12 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_28;
    }
LABEL_31:
    uint64_t v13 = 0;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_29;
    }
LABEL_32:
    uint64_t v14 = 0;
    return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v11;
  }
  uint64_t v12 = 2654435761 * self->_subsId;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_31;
  }
LABEL_28:
  uint64_t v13 = 2654435761 * self->_scellIndex;
  if ((*(_WORD *)&self->_has & 0x4000) == 0) {
    goto LABEL_32;
  }
LABEL_29:
  uint64_t v14 = 2654435761 * self->_txPowerLimited;
  return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 38);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 38);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_retxCounter = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_uint64_t rachResult = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x2000) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_contentionBased = *((unsigned char *)v4 + 73);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_pMax = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_rsrp = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_earfcn = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_tac = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_cellId = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x1000) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_cellIsApo = *((unsigned char *)v4 + 72);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_33:
  self->_accbState = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 38) & 0x10) != 0)
  {
LABEL_13:
    self->_numSubs = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_14:
  if (*((void *)v4 + 5))
  {
    id v7 = v4;
    -[CellularLteRachAttempt setPlmn:](self, "setPlmn:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((v6 & 0x400) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v6 = *((_WORD *)v4 + 38);
    if ((v6 & 0x200) == 0)
    {
LABEL_18:
      if ((v6 & 0x4000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x200) == 0)
  {
    goto LABEL_18;
  }
  self->_scellIndex = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 38) & 0x4000) != 0)
  {
LABEL_19:
    self->_txPowerLimited = *((unsigned char *)v4 + 74);
    *(_WORD *)&self->_has |= 0x4000u;
  }
LABEL_20:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)retxCounter
{
  return self->_retxCounter;
}

- (BOOL)contentionBased
{
  return self->_contentionBased;
}

- (int)pMax
{
  return self->_pMax;
}

- (int)rsrp
{
  return self->_rsrp;
}

- (unsigned)earfcn
{
  return self->_earfcn;
}

- (unsigned)tac
{
  return self->_tac;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (BOOL)cellIsApo
{
  return self->_cellIsApo;
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

- (unsigned)scellIndex
{
  return self->_scellIndex;
}

- (BOOL)txPowerLimited
{
  return self->_txPowerLimited;
}

- (void).cxx_destruct
{
}

@end