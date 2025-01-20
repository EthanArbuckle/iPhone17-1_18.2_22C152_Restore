@interface CellularNrRadioLinkFailure
- (BOOL)hasDeployment;
- (BOOL)hasExpiryTimerDuration;
- (BOOL)hasLastRsrp;
- (BOOL)hasMobilityState;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasReason;
- (BOOL)hasRlmInSyncOutOfSyncThreshold;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)rlmInSyncOutOfSyncThreshold;
- (NSData)plmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deploymentAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)expiryTimerDurationAsString:(int)a3;
- (id)mobilityStateAsString:(int)a3;
- (id)reasonAsString:(int)a3;
- (int)StringAsDeployment:(id)a3;
- (int)StringAsExpiryTimerDuration:(id)a3;
- (int)StringAsMobilityState:(id)a3;
- (int)StringAsReason:(id)a3;
- (int)deployment;
- (int)expiryTimerDuration;
- (int)lastRsrp;
- (int)mobilityState;
- (int)reason;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeployment:(int)a3;
- (void)setExpiryTimerDuration:(int)a3;
- (void)setHasDeployment:(BOOL)a3;
- (void)setHasExpiryTimerDuration:(BOOL)a3;
- (void)setHasLastRsrp:(BOOL)a3;
- (void)setHasMobilityState:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasRlmInSyncOutOfSyncThreshold:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLastRsrp:(int)a3;
- (void)setMobilityState:(int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setReason:(int)a3;
- (void)setRlmInSyncOutOfSyncThreshold:(BOOL)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrRadioLinkFailure

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

- (int)reason
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_reason;
  }
  else {
    return 0;
  }
}

- (void)setReason:(int)a3
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

- (id)reasonAsString:(int)a3
{
  if (a3 >= 9)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100287A40 + a3);
  }

  return v3;
}

- (int)StringAsReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NR5G_RLF_CAUSE_T310_EXPIRY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NR5G_RLF_CAUSE_RACH_PROBLEM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NR5G_RLF_CAUSE_RLC_MAX_RETX"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NR5G_RLF_CAUSE_SCG_CHANGE_FAILURE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NR5G_RLF_CAUSE_SCG_RECONFIG_FAILURE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NR5G_RLF_CAUSE_SRB3_IP_CHEK_FAILURE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NR5G_RLF_CAUSE_RECONFIGURATION_FAILURE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"NR5G_RLF_CAUSE_HANDOVER_FAILURE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"NR5G_RLF_CAUSE_OTHER_FAILURE"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)expiryTimerDuration
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_expiryTimerDuration;
  }
  else {
    return 0;
  }
}

- (void)setExpiryTimerDuration:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_expiryTimerDuration = a3;
}

- (void)setHasExpiryTimerDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasExpiryTimerDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)expiryTimerDurationAsString:(int)a3
{
  if (a3 >= 0x15)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100287A88 + a3);
  }

  return v3;
}

- (int)StringAsExpiryTimerDuration:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NR5G_RRC_TIMER_INVALID"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS0"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS50"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS100"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS150"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS200"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS300"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS400"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS500"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS600"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS1000"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS1500"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS2000"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS3000"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS4000"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS5000"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS6000"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS10000"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS15000"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS20000"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"NR5G_RRC_TIMER_MS30000"])
  {
    int v4 = 20;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setRlmInSyncOutOfSyncThreshold:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rlmInSyncOutOfSyncThreshold = a3;
}

- (void)setHasRlmInSyncOutOfSyncThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRlmInSyncOutOfSyncThreshold
{
  return (*(_WORD *)&self->_has >> 9) & 1;
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

- (int)mobilityState
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_mobilityState;
  }
  else {
    return 0;
  }
}

- (void)setMobilityState:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_mobilityState = a3;
}

- (void)setHasMobilityState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMobilityState
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)mobilityStateAsString:(int)a3
{
  if (a3 >= 5)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100287B30 + a3);
  }

  return v3;
}

- (int)StringAsMobilityState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MOTION_ST_STATIONARY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MOTION_ST_MOVING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MOTION_ST_PEDESTRIAN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MOTION_ST_DRIVING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MOTION_ST_SEMISTATIONARY"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setLastRsrp:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_lastRsrp = a3;
}

- (void)setHasLastRsrp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLastRsrp
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)deployment
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_deployment;
  }
  else {
    return 0;
  }
}

- (void)setDeployment:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_deployment = a3;
}

- (void)setHasDeployment:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDeployment
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)deploymentAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"DEPLOYMENT_NSA";
    }
    else
    {
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    int v4 = @"DEPLOYMENT_SA";
  }
  return v4;
}

- (int)StringAsDeployment:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEPLOYMENT_SA"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"DEPLOYMENT_NSA"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrRadioLinkFailure;
  id v3 = [(CellularNrRadioLinkFailure *)&v7 description];
  int v4 = [(CellularNrRadioLinkFailure *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v8 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v8 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  uint64_t reason = self->_reason;
  if (reason >= 9)
  {
    v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_reason];
  }
  else
  {
    v10 = *(&off_100287A40 + reason);
  }
  [v3 setObject:v10 forKey:@"reason"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_32;
  }
LABEL_22:
  uint64_t expiryTimerDuration = self->_expiryTimerDuration;
  if (expiryTimerDuration >= 0x15)
  {
    v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_expiryTimerDuration];
  }
  else
  {
    v14 = *(&off_100287A88 + expiryTimerDuration);
  }
  [v3 setObject:v14 forKey:@"expiry_timer_duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_33;
  }
LABEL_32:
  v18 = +[NSNumber numberWithBool:self->_rlmInSyncOutOfSyncThreshold];
  [v3 setObject:v18 forKey:@"rlm_in_sync_out_of_sync_threshold"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_34;
  }
LABEL_33:
  v19 = +[NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v19 forKey:@"subs_id"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_34:
  v20 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v20 forKey:@"num_subs"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    v5 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v5 forKey:@"ps_pref"];
  }
LABEL_9:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x10) == 0)
  {
    if ((v7 & 8) == 0) {
      goto LABEL_13;
    }
LABEL_26:
    v15 = +[NSNumber numberWithInt:self->_lastRsrp];
    [v3 setObject:v15 forKey:@"last_rsrp"];

    if ((*(_WORD *)&self->_has & 2) == 0) {
      goto LABEL_39;
    }
LABEL_27:
    int deployment = self->_deployment;
    if (deployment)
    {
      if (deployment == 1)
      {
        v17 = @"DEPLOYMENT_NSA";
      }
      else
      {
        v17 = +[NSString stringWithFormat:@"(unknown: %i)", self->_deployment];
      }
    }
    else
    {
      v17 = @"DEPLOYMENT_SA";
    }
    [v3 setObject:v17 forKey:@"deployment"];

    goto LABEL_39;
  }
  uint64_t mobilityState = self->_mobilityState;
  if (mobilityState >= 5)
  {
    v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_mobilityState];
  }
  else
  {
    v12 = *(&off_100287B30 + mobilityState);
  }
  [v3 setObject:v12 forKey:@"mobility_state"];

  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) != 0) {
    goto LABEL_26;
  }
LABEL_13:
  if ((v7 & 2) != 0) {
    goto LABEL_27;
  }
LABEL_39:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D8734((uint64_t)self, (uint64_t)a3);
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
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 8) == 0)
    {
LABEL_13:
      if ((v5 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteSint32Field();
  if ((*(_WORD *)&self->_has & 2) != 0) {
LABEL_14:
  }
    PBDataWriterWriteInt32Field();
LABEL_15:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 32) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_reason;
  *((_WORD *)v4 + 32) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 5) = self->_expiryTimerDuration;
  *((_WORD *)v4 + 32) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((unsigned char *)v4 + 60) = self->_rlmInSyncOutOfSyncThreshold;
  *((_WORD *)v4 + 32) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 14) = self->_subsId;
  *((_WORD *)v4 + 32) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_23:
  *((_DWORD *)v4 + 8) = self->_numSubs;
  *((_WORD *)v4 + 32) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 12) = self->_psPref;
    *((_WORD *)v4 + 32) |= 0x40u;
  }
LABEL_9:
  if (self->_plmn)
  {
    __int16 v7 = v4;
    [v4 setPlmn:];
    int v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_mobilityState;
    *((_WORD *)v4 + 32) |= 0x10u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 6) = self->_lastRsrp;
  *((_WORD *)v4 + 32) |= 8u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_14:
    *((_DWORD *)v4 + 4) = self->_deployment;
    *((_WORD *)v4 + 32) |= 2u;
  }
LABEL_15:
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int16 v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 32) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 13) = self->_reason;
  *((_WORD *)v5 + 32) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v5 + 5) = self->_expiryTimerDuration;
  *((_WORD *)v5 + 32) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((unsigned char *)v5 + 60) = self->_rlmInSyncOutOfSyncThreshold;
  *((_WORD *)v5 + 32) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v5 + 14) = self->_subsId;
  *((_WORD *)v5 + 32) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  *((_DWORD *)v5 + 8) = self->_numSubs;
  *((_WORD *)v5 + 32) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *((_DWORD *)v5 + 12) = self->_psPref;
    *((_WORD *)v5 + 32) |= 0x40u;
  }
LABEL_9:
  id v8 = [(NSData *)self->_plmn copyWithZone:a3];
  v9 = (void *)v6[5];
  v6[5] = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x10) == 0)
  {
    if ((v10 & 8) == 0) {
      goto LABEL_11;
    }
LABEL_22:
    *((_DWORD *)v6 + 6) = self->_lastRsrp;
    *((_WORD *)v6 + 32) |= 8u;
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return v6;
    }
    goto LABEL_12;
  }
  *((_DWORD *)v6 + 7) = self->_mobilityState;
  *((_WORD *)v6 + 32) |= 0x10u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) != 0) {
    goto LABEL_22;
  }
LABEL_11:
  if ((v10 & 2) != 0)
  {
LABEL_12:
    *((_DWORD *)v6 + 4) = self->_deployment;
    *((_WORD *)v6 + 32) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 32);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_58;
    }
  }
  else if (v6)
  {
    goto LABEL_58;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_reason != *((_DWORD *)v4 + 13)) {
      goto LABEL_58;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_expiryTimerDuration != *((_DWORD *)v4 + 5)) {
      goto LABEL_58;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0) {
      goto LABEL_58;
    }
    if (self->_rlmInSyncOutOfSyncThreshold)
    {
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_58;
      }
    }
    else if (*((unsigned char *)v4 + 60))
    {
      goto LABEL_58;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_subsId != *((_DWORD *)v4 + 14)) {
      goto LABEL_58;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_numSubs != *((_DWORD *)v4 + 8)) {
      goto LABEL_58;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_psPref != *((_DWORD *)v4 + 12)) {
      goto LABEL_58;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_58;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 5))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      __int16 has = (__int16)self->_has;
      goto LABEL_43;
    }
LABEL_58:
    BOOL v9 = 0;
    goto LABEL_59;
  }
LABEL_43:
  __int16 v8 = *((_WORD *)v4 + 32);
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_mobilityState != *((_DWORD *)v4 + 7)) {
      goto LABEL_58;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_lastRsrp != *((_DWORD *)v4 + 6)) {
      goto LABEL_58;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_deployment != *((_DWORD *)v4 + 4)) {
      goto LABEL_58;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (v8 & 2) == 0;
  }
LABEL_59:

  return v9;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((has & 0x80) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_reason;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_expiryTimerDuration;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_rlmInSyncOutOfSyncThreshold;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_subsId;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v9 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v8 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_numSubs;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v10 = 2654435761 * self->_psPref;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v10 = 0;
LABEL_16:
  unint64_t v11 = (unint64_t)[(NSData *)self->_plmn hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x10) == 0)
  {
    uint64_t v13 = 0;
    if ((v12 & 8) != 0) {
      goto LABEL_18;
    }
LABEL_21:
    uint64_t v14 = 0;
    if ((v12 & 2) != 0) {
      goto LABEL_19;
    }
LABEL_22:
    uint64_t v15 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v11;
  }
  uint64_t v13 = 2654435761 * self->_mobilityState;
  if ((v12 & 8) == 0) {
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v14 = 2654435761 * self->_lastRsrp;
  if ((v12 & 2) == 0) {
    goto LABEL_22;
  }
LABEL_19:
  uint64_t v15 = 2654435761 * self->_deployment;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 32);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 32);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t reason = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_uint64_t expiryTimerDuration = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_rlmInSyncOutOfSyncThreshold = *((unsigned char *)v4 + 60);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_subsId = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_23:
  self->_numSubs = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 32) & 0x40) != 0)
  {
LABEL_8:
    self->_psPref = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_9:
  if (*((void *)v4 + 5))
  {
    id v7 = v4;
    -[CellularNrRadioLinkFailure setPlmn:](self, "setPlmn:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x10) != 0)
  {
    self->_uint64_t mobilityState = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v6 = *((_WORD *)v4 + 32);
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_13;
  }
  self->_lastRsrp = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    self->_int deployment = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_15:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)rlmInSyncOutOfSyncThreshold
{
  return self->_rlmInSyncOutOfSyncThreshold;
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

- (int)lastRsrp
{
  return self->_lastRsrp;
}

- (void).cxx_destruct
{
}

@end