@interface CellularNrScgRemoval
- (BOOL)hasBandInd;
- (BOOL)hasDuration;
- (BOOL)hasIsDueToSdm;
- (BOOL)hasNumBeamFailure;
- (BOOL)hasNumBeamRecovery;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasReason;
- (BOOL)hasResult;
- (BOOL)hasRxBeamSwitch;
- (BOOL)hasSdmTriggerCause;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasTxBeamSwitch;
- (BOOL)isDueToSdm;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sdmTriggerCauseAsString:(int)a3;
- (int)StringAsSdmTriggerCause:(id)a3;
- (int)sdmTriggerCause;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)bandInd;
- (unsigned)duration;
- (unsigned)numBeamFailure;
- (unsigned)numBeamRecovery;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)reason;
- (unsigned)result;
- (unsigned)rxBeamSwitch;
- (unsigned)subsId;
- (unsigned)txBeamSwitch;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBandInd:(unsigned int)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasBandInd:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasIsDueToSdm:(BOOL)a3;
- (void)setHasNumBeamFailure:(BOOL)a3;
- (void)setHasNumBeamRecovery:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setHasRxBeamSwitch:(BOOL)a3;
- (void)setHasSdmTriggerCause:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTxBeamSwitch:(BOOL)a3;
- (void)setIsDueToSdm:(BOOL)a3;
- (void)setNumBeamFailure:(unsigned int)a3;
- (void)setNumBeamRecovery:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setReason:(unsigned int)a3;
- (void)setResult:(unsigned int)a3;
- (void)setRxBeamSwitch:(unsigned int)a3;
- (void)setSdmTriggerCause:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxBeamSwitch:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrScgRemoval

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

- (void)setReason:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasReason
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setResult:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasResult
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumBeamFailure:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numBeamFailure = a3;
}

- (void)setHasNumBeamFailure:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumBeamFailure
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumBeamRecovery:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numBeamRecovery = a3;
}

- (void)setHasNumBeamRecovery:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumBeamRecovery
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRxBeamSwitch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rxBeamSwitch = a3;
}

- (void)setHasRxBeamSwitch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRxBeamSwitch
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTxBeamSwitch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_txBeamSwitch = a3;
}

- (void)setHasTxBeamSwitch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTxBeamSwitch
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setBandInd:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bandInd = a3;
}

- (void)setHasBandInd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBandInd
{
  return (*(_WORD *)&self->_has >> 1) & 1;
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

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setIsDueToSdm:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isDueToSdm = a3;
}

- (void)setHasIsDueToSdm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsDueToSdm
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (int)sdmTriggerCause
{
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    return self->_sdmTriggerCause;
  }
  else {
    return 0;
  }
}

- (void)setSdmTriggerCause:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sdmTriggerCause = a3;
}

- (void)setHasSdmTriggerCause:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSdmTriggerCause
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)sdmTriggerCauseAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = off_100286D90[a3];
  }

  return v3;
}

- (int)StringAsSdmTriggerCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_AP_SLEEP"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_CELLULAR_DATA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_WIFI_POOR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_VOIP_CALL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_COREMEDIA_STALL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SCREEN_STATUS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SYMPTOMS_RECOMM"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_UI_SWITCH"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_RLGS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_PHS"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_MAX"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrScgRemoval;
  id v3 = [(CellularNrScgRemoval *)&v7 description];
  int v4 = [(CellularNrScgRemoval *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v11 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v11 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v12 = +[NSNumber numberWithUnsignedInt:self->_reason];
  [v3 setObject:v12 forKey:@"reason"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  v13 = +[NSNumber numberWithUnsignedInt:self->_result];
  [v3 setObject:v13 forKey:@"result"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  v14 = +[NSNumber numberWithUnsignedInt:self->_duration];
  [v3 setObject:v14 forKey:@"duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  v15 = +[NSNumber numberWithUnsignedInt:self->_numBeamFailure];
  [v3 setObject:v15 forKey:@"num_beam_failure"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  v16 = +[NSNumber numberWithUnsignedInt:self->_numBeamRecovery];
  [v3 setObject:v16 forKey:@"num_beam_recovery"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  v17 = +[NSNumber numberWithUnsignedInt:self->_rxBeamSwitch];
  [v3 setObject:v17 forKey:@"rx_beam_switch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  v18 = +[NSNumber numberWithUnsignedInt:self->_txBeamSwitch];
  [v3 setObject:v18 forKey:@"tx_beam_switch"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  v19 = +[NSNumber numberWithUnsignedInt:self->_bandInd];
  [v3 setObject:v19 forKey:@"band_ind"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  v20 = +[NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v20 forKey:@"subs_id"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_31:
  v21 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v21 forKey:@"num_subs"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    v5 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v5 forKey:@"ps_pref"];
  }
LABEL_14:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x2000) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_isDueToSdm];
    [v3 setObject:v8 forKey:@"is_due_to_sdm"];

    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x400) != 0)
  {
    uint64_t sdmTriggerCause = self->_sdmTriggerCause;
    if (sdmTriggerCause >= 0xC)
    {
      v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_sdmTriggerCause];
    }
    else
    {
      v10 = off_100286D90[sdmTriggerCause];
    }
    [v3 setObject:v10 forKey:@"sdm_trigger_cause"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100017648((uint64_t)self, (uint64_t)a3);
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
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_12:
  }
    PBDataWriterWriteUint32Field();
LABEL_13:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x800) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x2000) == 0)
    {
LABEL_17:
      if ((v5 & 0x400) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_18:
  }
    PBDataWriterWriteInt32Field();
LABEL_19:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 40) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_reason;
  *((_WORD *)v4 + 40) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 14) = self->_result;
  *((_WORD *)v4 + 40) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 5) = self->_duration;
  *((_WORD *)v4 + 40) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 6) = self->_numBeamFailure;
  *((_WORD *)v4 + 40) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 7) = self->_numBeamRecovery;
  *((_WORD *)v4 + 40) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 15) = self->_rxBeamSwitch;
  *((_WORD *)v4 + 40) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 18) = self->_txBeamSwitch;
  *((_WORD *)v4 + 40) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 4) = self->_bandInd;
  *((_WORD *)v4 + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_31:
  *((_DWORD *)v4 + 8) = self->_numSubs;
  *((_WORD *)v4 + 40) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 12) = self->_psPref;
    *((_WORD *)v4 + 40) |= 0x40u;
  }
LABEL_13:
  if (self->_plmn)
  {
    __int16 v7 = v4;
    [v4 setPlmn:];
    int v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) != 0)
  {
    *((_DWORD *)v4 + 17) = self->_subsId;
    *((_WORD *)v4 + 40) |= 0x800u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x2000) == 0)
    {
LABEL_17:
      if ((v6 & 0x400) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  *((unsigned char *)v4 + 76) = self->_isDueToSdm;
  *((_WORD *)v4 + 40) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 16) = self->_sdmTriggerCause;
    *((_WORD *)v4 + 40) |= 0x400u;
  }
LABEL_19:
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int16 v5 = [[objc_opt_class() allocWithZone:a3] init];
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
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 13) = self->_reason;
  *((_WORD *)v5 + 40) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v5 + 14) = self->_result;
  *((_WORD *)v5 + 40) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v5 + 5) = self->_duration;
  *((_WORD *)v5 + 40) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v5 + 6) = self->_numBeamFailure;
  *((_WORD *)v5 + 40) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v5 + 7) = self->_numBeamRecovery;
  *((_WORD *)v5 + 40) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 15) = self->_rxBeamSwitch;
  *((_WORD *)v5 + 40) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v5 + 18) = self->_txBeamSwitch;
  *((_WORD *)v5 + 40) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v5 + 4) = self->_bandInd;
  *((_WORD *)v5 + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_27:
  *((_DWORD *)v5 + 8) = self->_numSubs;
  *((_WORD *)v5 + 40) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    *((_DWORD *)v5 + 12) = self->_psPref;
    *((_WORD *)v5 + 40) |= 0x40u;
  }
LABEL_13:
  id v8 = [(NSData *)self->_plmn copyWithZone:a3];
  v9 = (void *)v6[5];
  v6[5] = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x2000) == 0) {
      goto LABEL_15;
    }
LABEL_30:
    *((unsigned char *)v6 + 76) = self->_isDueToSdm;
    *((_WORD *)v6 + 40) |= 0x2000u;
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      return v6;
    }
    goto LABEL_16;
  }
  *((_DWORD *)v6 + 17) = self->_subsId;
  *((_WORD *)v6 + 40) |= 0x800u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x2000) != 0) {
    goto LABEL_30;
  }
LABEL_15:
  if ((v10 & 0x400) != 0)
  {
LABEL_16:
    *((_DWORD *)v6 + 16) = self->_sdmTriggerCause;
    *((_WORD *)v6 + 40) |= 0x400u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_78;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 40);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_78;
    }
  }
  else if (v6)
  {
    goto LABEL_78;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_reason != *((_DWORD *)v4 + 13)) {
      goto LABEL_78;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0 || self->_result != *((_DWORD *)v4 + 14)) {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_duration != *((_DWORD *)v4 + 5)) {
      goto LABEL_78;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_numBeamFailure != *((_DWORD *)v4 + 6)) {
      goto LABEL_78;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_numBeamRecovery != *((_DWORD *)v4 + 7)) {
      goto LABEL_78;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x200) == 0 || self->_rxBeamSwitch != *((_DWORD *)v4 + 15)) {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x200) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x1000) == 0 || self->_txBeamSwitch != *((_DWORD *)v4 + 18)) {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x1000) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_bandInd != *((_DWORD *)v4 + 4)) {
      goto LABEL_78;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_numSubs != *((_DWORD *)v4 + 8)) {
      goto LABEL_78;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_psPref != *((_DWORD *)v4 + 12)) {
      goto LABEL_78;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_78;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:")) {
      goto LABEL_78;
    }
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x800) == 0 || self->_subsId != *((_DWORD *)v4 + 17)) {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x800) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x2000) != 0)
    {
      if (self->_isDueToSdm)
      {
        if (!*((unsigned char *)v4 + 76)) {
          goto LABEL_78;
        }
        goto LABEL_73;
      }
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_73;
      }
    }
LABEL_78:
    BOOL v8 = 0;
    goto LABEL_79;
  }
  if ((*((_WORD *)v4 + 40) & 0x2000) != 0) {
    goto LABEL_78;
  }
LABEL_73:
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x400) == 0 || self->_sdmTriggerCause != *((_DWORD *)v4 + 16)) {
      goto LABEL_78;
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = (*((_WORD *)v4 + 40) & 0x400) == 0;
  }
LABEL_79:

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
      uint64_t v19 = 2654435761 * self->_reason;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
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
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    uint64_t v18 = 2654435761 * self->_result;
    if ((has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v18 = 0;
  if ((has & 4) != 0)
  {
LABEL_5:
    uint64_t v16 = 2654435761 * self->_duration;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v16 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    uint64_t v4 = 2654435761 * self->_numBeamFailure;
    if ((has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v5 = 2654435761 * self->_numBeamRecovery;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_8:
    uint64_t v6 = 2654435761 * self->_rxBeamSwitch;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_9:
    uint64_t v7 = 2654435761 * self->_txBeamSwitch;
    if ((has & 2) != 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v7 = 0;
  if ((has & 2) != 0)
  {
LABEL_10:
    uint64_t v8 = 2654435761 * self->_bandInd;
    if ((has & 0x20) != 0) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v9 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_21:
  uint64_t v8 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_22;
  }
LABEL_11:
  uint64_t v9 = 2654435761 * self->_numSubs;
  if ((has & 0x40) != 0)
  {
LABEL_12:
    uint64_t v10 = 2654435761 * self->_psPref;
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v10 = 0;
LABEL_24:
  unint64_t v11 = (unint64_t)[(NSData *)self->_plmn hash];
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    uint64_t v12 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_26;
    }
LABEL_29:
    uint64_t v13 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_27;
    }
LABEL_30:
    uint64_t v14 = 0;
    return v19 ^ v20 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v11;
  }
  uint64_t v12 = 2654435761 * self->_subsId;
  if ((*(_WORD *)&self->_has & 0x2000) == 0) {
    goto LABEL_29;
  }
LABEL_26:
  uint64_t v13 = 2654435761 * self->_isDueToSdm;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_30;
  }
LABEL_27:
  uint64_t v14 = 2654435761 * self->_sdmTriggerCause;
  return v19 ^ v20 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v11;
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
      if ((v5 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_reason = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_result = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_duration = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_numBeamFailure = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_numBeamRecovery = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_rxBeamSwitch = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x1000) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_txBeamSwitch = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_bandInd = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_31:
  self->_numSubs = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 40) & 0x40) != 0)
  {
LABEL_12:
    self->_psPref = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_13:
  if (*((void *)v4 + 5))
  {
    id v7 = v4;
    -[CellularNrScgRemoval setPlmn:](self, "setPlmn:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 40);
  if ((v6 & 0x800) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v6 = *((_WORD *)v4 + 40);
    if ((v6 & 0x2000) == 0)
    {
LABEL_17:
      if ((v6 & 0x400) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  self->_isDueToSdm = *((unsigned char *)v4 + 76);
  *(_WORD *)&self->_has |= 0x2000u;
  if ((*((_WORD *)v4 + 40) & 0x400) != 0)
  {
LABEL_18:
    self->_uint64_t sdmTriggerCause = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_19:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)reason
{
  return self->_reason;
}

- (unsigned)result
{
  return self->_result;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)numBeamFailure
{
  return self->_numBeamFailure;
}

- (unsigned)numBeamRecovery
{
  return self->_numBeamRecovery;
}

- (unsigned)rxBeamSwitch
{
  return self->_rxBeamSwitch;
}

- (unsigned)txBeamSwitch
{
  return self->_txBeamSwitch;
}

- (unsigned)bandInd
{
  return self->_bandInd;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
}

- (BOOL)isDueToSdm
{
  return self->_isDueToSdm;
}

- (void).cxx_destruct
{
}

@end