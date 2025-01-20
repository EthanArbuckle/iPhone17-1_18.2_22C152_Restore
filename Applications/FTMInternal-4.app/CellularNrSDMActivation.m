@interface CellularNrSDMActivation
- (BOOL)apNrRecomm;
- (BOOL)apNrRecommConfFactor;
- (BOOL)fr1MeasDisabled;
- (BOOL)fr2MeasDisabled;
- (BOOL)hasApNrRecomm;
- (BOOL)hasApNrRecommConfFactor;
- (BOOL)hasDurationInPrevState;
- (BOOL)hasFr1MeasDisabled;
- (BOOL)hasFr2MeasDisabled;
- (BOOL)hasPrevFr1MeasDisabled;
- (BOOL)hasPrevFr2MeasDisabled;
- (BOOL)hasSib24Configured;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasTriggerCause;
- (BOOL)isEqual:(id)a3;
- (BOOL)prevFr1MeasDisabled;
- (BOOL)prevFr2MeasDisabled;
- (BOOL)readFrom:(id)a3;
- (BOOL)sib24Configured;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)triggerCauseAsString:(int)a3;
- (int)StringAsTriggerCause:(id)a3;
- (int)triggerCause;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)durationInPrevState;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApNrRecomm:(BOOL)a3;
- (void)setApNrRecommConfFactor:(BOOL)a3;
- (void)setDurationInPrevState:(unsigned int)a3;
- (void)setFr1MeasDisabled:(BOOL)a3;
- (void)setFr2MeasDisabled:(BOOL)a3;
- (void)setHasApNrRecomm:(BOOL)a3;
- (void)setHasApNrRecommConfFactor:(BOOL)a3;
- (void)setHasDurationInPrevState:(BOOL)a3;
- (void)setHasFr1MeasDisabled:(BOOL)a3;
- (void)setHasFr2MeasDisabled:(BOOL)a3;
- (void)setHasPrevFr1MeasDisabled:(BOOL)a3;
- (void)setHasPrevFr2MeasDisabled:(BOOL)a3;
- (void)setHasSib24Configured:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTriggerCause:(BOOL)a3;
- (void)setPrevFr1MeasDisabled:(BOOL)a3;
- (void)setPrevFr2MeasDisabled:(BOOL)a3;
- (void)setSib24Configured:(BOOL)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerCause:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrSDMActivation

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

- (void)setFr1MeasDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_fr1MeasDisabled = a3;
}

- (void)setHasFr1MeasDisabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFr1MeasDisabled
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setFr2MeasDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_fr2MeasDisabled = a3;
}

- (void)setHasFr2MeasDisabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasFr2MeasDisabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPrevFr1MeasDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_prevFr1MeasDisabled = a3;
}

- (void)setHasPrevFr1MeasDisabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPrevFr1MeasDisabled
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPrevFr2MeasDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_prevFr2MeasDisabled = a3;
}

- (void)setHasPrevFr2MeasDisabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPrevFr2MeasDisabled
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)triggerCause
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_triggerCause;
  }
  else {
    return 0;
  }
}

- (void)setTriggerCause:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_triggerCause = a3;
}

- (void)setHasTriggerCause:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTriggerCause
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)triggerCauseAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100287708 + a3);
  }

  return v3;
}

- (int)StringAsTriggerCause:(id)a3
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

- (void)setApNrRecomm:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_apNrRecomm = a3;
}

- (void)setHasApNrRecomm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasApNrRecomm
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setApNrRecommConfFactor:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_apNrRecommConfFactor = a3;
}

- (void)setHasApNrRecommConfFactor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasApNrRecommConfFactor
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSib24Configured:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sib24Configured = a3;
}

- (void)setHasSib24Configured:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSib24Configured
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setDurationInPrevState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_durationInPrevState = a3;
}

- (void)setHasDurationInPrevState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDurationInPrevState
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrSDMActivation;
  __int16 v3 = [(CellularNrSDMActivation *)&v7 description];
  int v4 = [(CellularNrSDMActivation *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithBool:self->_fr1MeasDisabled];
  [v3 setObject:v8 forKey:@"fr1_meas_disabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v9 = +[NSNumber numberWithBool:self->_fr2MeasDisabled];
  [v3 setObject:v9 forKey:@"fr2_meas_disabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v10 = +[NSNumber numberWithBool:self->_prevFr1MeasDisabled];
  [v3 setObject:v10 forKey:@"prev_fr1_meas_disabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  v11 = +[NSNumber numberWithBool:self->_prevFr2MeasDisabled];
  [v3 setObject:v11 forKey:@"prev_fr2_meas_disabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_21:
  uint64_t triggerCause = self->_triggerCause;
  if (triggerCause >= 0xC)
  {
    v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_triggerCause];
  }
  else
  {
    v13 = *(&off_100287708 + triggerCause);
  }
  [v3 setObject:v13 forKey:@"trigger_cause"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  v14 = +[NSNumber numberWithBool:self->_apNrRecomm];
  [v3 setObject:v14 forKey:@"ap_nr_recomm"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  v15 = +[NSNumber numberWithBool:self->_apNrRecommConfFactor];
  [v3 setObject:v15 forKey:@"ap_nr_recomm_conf_factor"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  v16 = +[NSNumber numberWithBool:self->_sib24Configured];
  [v3 setObject:v16 forKey:@"sib24_configured"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_28:
  v17 = +[NSNumber numberWithUnsignedInt:self->_durationInPrevState];
  [v3 setObject:v17 forKey:@"duration_in_prev_state"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    v5 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v5 forKey:@"subs_id"];
  }
LABEL_13:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100091AD0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_12:
  }
    PBDataWriterWriteUint32Field();
LABEL_13:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 18) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 30) = self->_fr1MeasDisabled;
  *((_WORD *)v4 + 18) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)v4 + 31) = self->_fr2MeasDisabled;
  *((_WORD *)v4 + 18) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((unsigned char *)v4 + 32) = self->_prevFr1MeasDisabled;
  *((_WORD *)v4 + 18) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)v4 + 33) = self->_prevFr2MeasDisabled;
  *((_WORD *)v4 + 18) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 6) = self->_triggerCause;
  *((_WORD *)v4 + 18) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)v4 + 28) = self->_apNrRecomm;
  *((_WORD *)v4 + 18) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((unsigned char *)v4 + 29) = self->_apNrRecommConfFactor;
  *((_WORD *)v4 + 18) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((unsigned char *)v4 + 34) = self->_sib24Configured;
  *((_WORD *)v4 + 18) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  *((_DWORD *)v4 + 4) = self->_durationInPrevState;
  *((_WORD *)v4 + 18) |= 2u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 5) = self->_subsId;
    *((_WORD *)v4 + 18) |= 4u;
  }
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 18) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 30) = self->_fr1MeasDisabled;
  *((_WORD *)result + 18) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((unsigned char *)result + 31) = self->_fr2MeasDisabled;
  *((_WORD *)result + 18) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((unsigned char *)result + 32) = self->_prevFr1MeasDisabled;
  *((_WORD *)result + 18) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)result + 33) = self->_prevFr2MeasDisabled;
  *((_WORD *)result + 18) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 6) = self->_triggerCause;
  *((_WORD *)result + 18) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)result + 28) = self->_apNrRecomm;
  *((_WORD *)result + 18) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((unsigned char *)result + 29) = self->_apNrRecommConfFactor;
  *((_WORD *)result + 18) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)result + 34) = self->_sib24Configured;
  *((_WORD *)result + 18) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_12;
  }
LABEL_23:
  *((_DWORD *)result + 4) = self->_durationInPrevState;
  *((_WORD *)result + 18) |= 2u;
  if ((*(_WORD *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_12:
  *((_DWORD *)result + 5) = self->_subsId;
  *((_WORD *)result + 18) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_78;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 18);
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
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0) {
      goto LABEL_78;
    }
    if (self->_fr1MeasDisabled)
    {
      if (!*((unsigned char *)v4 + 30)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)v4 + 30))
    {
      goto LABEL_78;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0) {
      goto LABEL_78;
    }
    if (self->_fr2MeasDisabled)
    {
      if (!*((unsigned char *)v4 + 31)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)v4 + 31))
    {
      goto LABEL_78;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 18) & 0x100) == 0) {
      goto LABEL_78;
    }
    if (self->_prevFr1MeasDisabled)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)v4 + 18) & 0x100) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 18) & 0x200) == 0) {
      goto LABEL_78;
    }
    if (self->_prevFr2MeasDisabled)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)v4 + 18) & 0x200) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_triggerCause != *((_DWORD *)v4 + 6)) {
      goto LABEL_78;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0) {
      goto LABEL_78;
    }
    if (self->_apNrRecomm)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_78;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0) {
      goto LABEL_78;
    }
    if (self->_apNrRecommConfFactor)
    {
      if (!*((unsigned char *)v4 + 29)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)v4 + 29))
    {
      goto LABEL_78;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 18) & 0x400) != 0)
    {
      if (self->_sib24Configured)
      {
        if (!*((unsigned char *)v4 + 34)) {
          goto LABEL_78;
        }
        goto LABEL_68;
      }
      if (!*((unsigned char *)v4 + 34)) {
        goto LABEL_68;
      }
    }
LABEL_78:
    BOOL v7 = 0;
    goto LABEL_79;
  }
  if ((*((_WORD *)v4 + 18) & 0x400) != 0) {
    goto LABEL_78;
  }
LABEL_68:
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_durationInPrevState != *((_DWORD *)v4 + 4)) {
      goto LABEL_78;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_subsId != *((_DWORD *)v4 + 5)) {
      goto LABEL_78;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 4) == 0;
  }
LABEL_79:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_fr1MeasDisabled;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_fr2MeasDisabled;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_prevFr1MeasDisabled;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_prevFr2MeasDisabled;
    if ((has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_triggerCause;
    if ((has & 0x10) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_apNrRecomm;
    if ((has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_apNrRecommConfFactor;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_sib24Configured;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v12 = 0;
    if ((has & 4) != 0) {
      goto LABEL_12;
    }
LABEL_23:
    uint64_t v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  uint64_t v11 = 0;
  if ((has & 2) == 0) {
    goto LABEL_22;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_durationInPrevState;
  if ((has & 4) == 0) {
    goto LABEL_23;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 18);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 18);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_fr1MeasDisabled = *((unsigned char *)v4 + 30);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 18);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_fr2MeasDisabled = *((unsigned char *)v4 + 31);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 18);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_prevFr1MeasDisabled = *((unsigned char *)v4 + 32);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 18);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_prevFr2MeasDisabled = *((unsigned char *)v4 + 33);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 18);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_uint64_t triggerCause = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 18);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_apNrRecomm = *((unsigned char *)v4 + 28);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 18);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_apNrRecommConfFactor = *((unsigned char *)v4 + 29);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 18);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_sib24Configured = *((unsigned char *)v4 + 34);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 18);
  if ((v5 & 2) == 0)
  {
LABEL_11:
    if ((v5 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  self->_durationInPrevState = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 18) & 4) != 0)
  {
LABEL_12:
    self->_subsId = *((_DWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_13:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)fr1MeasDisabled
{
  return self->_fr1MeasDisabled;
}

- (BOOL)fr2MeasDisabled
{
  return self->_fr2MeasDisabled;
}

- (BOOL)prevFr1MeasDisabled
{
  return self->_prevFr1MeasDisabled;
}

- (BOOL)prevFr2MeasDisabled
{
  return self->_prevFr2MeasDisabled;
}

- (BOOL)apNrRecomm
{
  return self->_apNrRecomm;
}

- (BOOL)apNrRecommConfFactor
{
  return self->_apNrRecommConfFactor;
}

- (BOOL)sib24Configured
{
  return self->_sib24Configured;
}

- (unsigned)durationInPrevState
{
  return self->_durationInPrevState;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end