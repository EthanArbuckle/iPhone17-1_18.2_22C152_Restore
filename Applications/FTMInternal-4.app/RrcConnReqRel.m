@interface RrcConnReqRel
- (BOOL)hasConnStage;
- (BOOL)hasCounter;
- (BOOL)hasEstablishCause;
- (BOOL)hasReleaseCause;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)connStageAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)establishCauseAsString:(int)a3;
- (id)releaseCauseAsString:(int)a3;
- (int)StringAsConnStage:(id)a3;
- (int)StringAsEstablishCause:(id)a3;
- (int)StringAsReleaseCause:(id)a3;
- (int)connStage;
- (int)establishCause;
- (int)releaseCause;
- (unint64_t)hash;
- (unsigned)counter;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConnStage:(int)a3;
- (void)setCounter:(unsigned int)a3;
- (void)setEstablishCause:(int)a3;
- (void)setHasConnStage:(BOOL)a3;
- (void)setHasCounter:(BOOL)a3;
- (void)setHasEstablishCause:(BOOL)a3;
- (void)setHasReleaseCause:(BOOL)a3;
- (void)setReleaseCause:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RrcConnReqRel

- (int)establishCause
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_establishCause;
  }
  else {
    return 0;
  }
}

- (void)setEstablishCause:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_establishCause = a3;
}

- (void)setHasEstablishCause:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEstablishCause
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)establishCauseAsString:(int)a3
{
  if (a3 >= 0x17)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100288178 + a3);
  }

  return v3;
}

- (int)StringAsEstablishCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RRC_EST_ORIG_CONV_CALL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RRC_EST_ORIG_STREAM_CALL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RRC_EST_ORIG_INTERACT_CALL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RRC_EST_ORIG_BACKGND_CALL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RRC_EST_ORIG_SUBSCRIBED_TRF_CALL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RRC_EST_TERM_CONV_CALL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RRC_EST_TERM_STREAM_CALL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RRC_EST_TERM_INTERACT_CALL"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RRC_EST_TERM_BACKGND_CALL"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"RRC_EST_EMERGENCY_CALL"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"RRC_EST_INTER_RAT_CELL_RESELECT"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"RRC_EST_INTER_RAT_CELL_CHANGE_ORDER"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"RRC_EST_REGISTRATION"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"RRC_EST_DETACH"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"RRC_EST_HI_PRI_SIGNALLING"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"RRC_EST_LOW_PRI_SIGNALLING"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"RRC_EST_CALL_RE_ESTABLISH"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"RRC_EST_TERM_HI_SIGNALLING"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"RRC_EST_TERM_LOW_SIGNALLING"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"RRC_EST_TERM_UNKNOWN"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"RRC_EST_MBMS_RECEPTION"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"RRC_EST_MBMS_PTP_RB_REQUEST"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"RRC_EST_DELAY_TOLERANT_ACCESS"])
  {
    int v4 = 22;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)connStage
{
  if (*(unsigned char *)&self->_has) {
    return self->_connStage;
  }
  else {
    return 0;
  }
}

- (void)setConnStage:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_connStage = a3;
}

- (void)setHasConnStage:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConnStage
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)connStageAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = *(&off_100288230 + a3);
  }

  return v3;
}

- (int)StringAsConnStage:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RrcConnStage_AfterReq"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RrcConnStage_RrcSetupComp"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RrcConnStage_DrbEstComp"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)releaseCause
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_releaseCause;
  }
  else {
    return 0;
  }
}

- (void)setReleaseCause:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_releaseCause = a3;
}

- (void)setHasReleaseCause:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReleaseCause
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)releaseCauseAsString:(int)a3
{
  if (a3 >= 0x18)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100288248 + a3);
  }

  return v3;
}

- (int)StringAsReleaseCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RRC_FAIL_TO_CAMP_ON"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RRC_INTERNAL_ERROR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RRC_UNSUPPORTED_REDIRECTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RRC_MAX_ACCESS_FAILURE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RRC_FAILURE_DUE_TO_CONGESTION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RRC_FAILURE_UNSPECIFIED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RRC_UNSUPPORTED_INITIAL_UE_ID"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RRC_ACCESS_CLASS_NOT_ALLOWED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RRC_CONNECTION_NOT_AVAILABLE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"RRC_PCCO_FAILURE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"RRC_NO_RESOURCE_AVAILABLE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"RRC_ABORT_LAI_RAI_CHANGED"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"RRC_REL_CAUSE_NORMAL"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"RRC_REL_CAUSE_UNSPEC"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"RRC_REL_CAUSE_PRE_EMPTIVE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"RRC_REL_CAUSE_CONGESTION"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"RRC_REL_CAUSE_RE_ESTABLISH_REJECT"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"RRC_REL_USER_INACTIVITY"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"RRC_REL_DEEP_FADE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"RRC_DIRECTED_SIGNALLING_REESTABLISHMENT"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"RRC_REL_CAUSE_OOS"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"RRC_UE_INIT_DORMANCY_UE_IN_OOS"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"RRC_UE_INIT_DORMANCY_ABORT_SUCCESS"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"RRC_REL_DUAL_STANDBY_PS_ABORT_SUCCESS"])
  {
    int v4 = 23;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setCounter:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_counter = a3;
}

- (void)setHasCounter:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCounter
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)RrcConnReqRel;
  char v3 = [(RrcConnReqRel *)&v7 description];
  int v4 = [(RrcConnReqRel *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t establishCause = self->_establishCause;
    if (establishCause >= 0x17)
    {
      v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_establishCause];
    }
    else
    {
      v8 = *(&off_100288178 + establishCause);
    }
    [v3 setObject:v8 forKey:@"establish_cause"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  uint64_t connStage = self->_connStage;
  if (connStage >= 3)
  {
    v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_connStage];
  }
  else
  {
    v10 = *(&off_100288230 + connStage);
  }
  [v3 setObject:v10 forKey:@"conn_stage"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_17:
  uint64_t releaseCause = self->_releaseCause;
  if (releaseCause >= 0x18)
  {
    v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_releaseCause];
  }
  else
  {
    v12 = *(&off_100288248 + releaseCause);
  }
  [v3 setObject:v12 forKey:@"release_cause"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_5:
  v5 = +[NSNumber numberWithUnsignedInt:self->_counter];
  [v3 setObject:v5 forKey:@"counter"];

LABEL_6:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001099D4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[4] = self->_establishCause;
    *((unsigned char *)v4 + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_connStage;
  *((unsigned char *)v4 + 24) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[5] = self->_releaseCause;
  *((unsigned char *)v4 + 24) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v4[3] = self->_counter;
    *((unsigned char *)v4 + 24) |= 2u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_establishCause;
    *((unsigned char *)result + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_connStage;
  *((unsigned char *)result + 24) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 5) = self->_releaseCause;
  *((unsigned char *)result + 24) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 3) = self->_counter;
  *((unsigned char *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_establishCause != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_connStage != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_counter != *((_DWORD *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0 || self->_releaseCause != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v2 = 2654435761 * self->_establishCause;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_connStage;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_releaseCause;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_counter;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 4) != 0)
  {
    self->_uint64_t establishCause = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t connStage = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_uint64_t releaseCause = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_5:
    self->_counter = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_6:
}

- (unsigned)counter
{
  return self->_counter;
}

@end