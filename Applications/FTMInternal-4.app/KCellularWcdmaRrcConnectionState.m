@interface KCellularWcdmaRrcConnectionState
- (BOOL)hasEstablishmentCause;
- (BOOL)hasReleaseCause;
- (BOOL)hasState;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)establishmentCauseAsString:(int)a3;
- (id)releaseCauseAsString:(int)a3;
- (id)stateAsString:(int)a3;
- (int)StringAsEstablishmentCause:(id)a3;
- (int)StringAsReleaseCause:(id)a3;
- (int)StringAsState:(id)a3;
- (int)establishmentCause;
- (int)releaseCause;
- (int)state;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEstablishmentCause:(int)a3;
- (void)setHasEstablishmentCause:(BOOL)a3;
- (void)setHasReleaseCause:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setReleaseCause:(int)a3;
- (void)setState:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularWcdmaRrcConnectionState

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)state
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_state;
  }
  else {
    return 0;
  }
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100287B70 + a3);
  }

  return v3;
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KWCDMA_RRC_CONN_STATE_INVALID"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RRC_CONN_STATE_INACTIVE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RRC_CONN_STATE_IDLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RRC_CONN_STATE_ESTABLISH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RRC_CONN_STATE_URA_PCH"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RRC_CONN_STATE_CELL_PCH"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RRC_CONN_STATE_CELL_FACH"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RRC_CONN_STATE_CELL_DCH"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RRC_CONN_STATE_RELEASE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RRC_CONN_STATE_RADIO_LINK_FAILURE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RRC_CONN_STATE_SCRI_SENT"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)establishmentCause
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_establishmentCause;
  }
  else {
    return 0;
  }
}

- (void)setEstablishmentCause:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_establishmentCause = a3;
}

- (void)setHasEstablishmentCause:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEstablishmentCause
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)establishmentCauseAsString:(int)a3
{
  if (a3 >= 0x17)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100287BC8 + a3);
  }

  return v3;
}

- (int)StringAsEstablishmentCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KRRC_EST_ORIG_CONV_CALL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_ORIG_STREAM_CALL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_ORIG_INTERACT_CALL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_ORIG_BACKGND_CALL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_ORIG_SUBSCRIBED_TRF_CALL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_TERM_CONV_CALL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_TERM_STREAM_CALL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_TERM_INTERACT_CALL"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_TERM_BACKGND_CALL"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_EMERGENCY_CALL"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_INTER_RAT_CELL_RESELECT"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_INTER_RAT_CELL_CHANGE_ORDER"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_REGISTRATION"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_DETACH"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_HI_PRI_SIGNALLING"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_LOW_PRI_SIGNALLING"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_CALL_RE_ESTABLISH"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_TERM_HI_SIGNALLING"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_TERM_LOW_SIGNALLING"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_TERM_UNKNOWN"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_MBMS_RECEPTION"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_MBMS_PTP_RB_REQUEST"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"KRRC_EST_DELAY_TOLERANT_ACCESS"])
  {
    int v4 = 22;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)releaseCause
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_releaseCause;
  }
  else {
    return 0;
  }
}

- (void)setReleaseCause:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_releaseCause = a3;
}

- (void)setHasReleaseCause:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReleaseCause
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)releaseCauseAsString:(int)a3
{
  if (a3 >= 0x1C)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100287C80 + a3);
  }

  return v3;
}

- (int)StringAsReleaseCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KRRC_REL_OTHER_CAUSE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_NO_CAUSE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_NO_CELL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_INACTIVE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_NORMAL_EVENT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_CELL_BARRED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_CELL_CHANGED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_ACCESS_NOT_ALLOWED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_RRC_CONN_ESTABLISHMENT_FAILURE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_RELEASE_OOSA"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_SIGN_CONN_REL"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_CONN_REJECT_REDIRECTION"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_NAS_TRIGGERED_ABORT"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_CONN_REL_LOWER_LAYER_FAILURE_DL"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_CONN_REL_LOWER_LAYER_FAILURE_UL"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_HO_FROM_UTRAN_REVERT_BACK_SYNC_FAIL"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_CONN_REJECT_CONGESTION"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_CONN_REJECT_UNSPECIFIED"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_SIM_RADIO_CONFLICT"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_CONN_RELEASE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_UNSPECIFIED"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_PRE_EMPTIVE_RELEASE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_CONGESTION"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_RE_ESTABLISHMENT_REJECT"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_DIRECTED_SIGCONN_RE_ESTABLISHMENT"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_USER_INACTIVITY"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_RL_FAILURE"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"KRRC_REL_RLC_LINK_ERROR"])
  {
    int v4 = 27;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularWcdmaRrcConnectionState;
  char v3 = [(KCellularWcdmaRrcConnectionState *)&v7 description];
  int v4 = [(KCellularWcdmaRrcConnectionState *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  uint64_t state = self->_state;
  if (state >= 0xB)
  {
    v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_state];
  }
  else
  {
    v9 = *(&off_100287B70 + state);
  }
  [v3 setObject:v9 forKey:@"state"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_15:
  uint64_t establishmentCause = self->_establishmentCause;
  if (establishmentCause >= 0x17)
  {
    v11 = +[NSString stringWithFormat:@"(unknown: %i)", self->_establishmentCause];
  }
  else
  {
    v11 = *(&off_100287BC8 + establishmentCause);
  }
  [v3 setObject:v11 forKey:@"establishment_cause"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  uint64_t releaseCause = self->_releaseCause;
  if (releaseCause >= 0x1C)
  {
    v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_releaseCause];
  }
  else
  {
    v13 = *(&off_100287C80 + releaseCause);
  }
  [v3 setObject:v13 forKey:@"release_cause"];

  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_7;
  }
LABEL_6:
  v5 = +[NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v5 forKey:@"subs_id"];

LABEL_7:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000DB4E8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_state;
  *((unsigned char *)v4 + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)v4 + 4) = self->_establishmentCause;
  *((unsigned char *)v4 + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((_DWORD *)v4 + 5) = self->_releaseCause;
  *((unsigned char *)v4 + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 7) = self->_subsId;
    *((unsigned char *)v4 + 32) |= 0x10u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_state;
  *((unsigned char *)result + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 4) = self->_establishmentCause;
  *((unsigned char *)result + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_releaseCause;
  *((unsigned char *)result + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 7) = self->_subsId;
  *((unsigned char *)result + 32) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_state != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_establishmentCause != *((_DWORD *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_releaseCause != *((_DWORD *)v4 + 5)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0 || self->_subsId != *((_DWORD *)v4 + 7)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_state;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_establishmentCause;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_releaseCause;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_subsId;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t state = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_uint64_t establishmentCause = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_uint64_t releaseCause = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
LABEL_6:
    self->_subsId = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_7:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end