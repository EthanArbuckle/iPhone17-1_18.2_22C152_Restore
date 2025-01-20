@interface KCellularMmContext
- (BOOL)hasIsCombinedProc;
- (BOOL)hasLai;
- (BOOL)hasProcFailureCause;
- (BOOL)hasRegStatus;
- (BOOL)hasRejectCause;
- (BOOL)hasSubsId;
- (BOOL)hasT3212DurS;
- (BOOL)hasTimestamp;
- (BOOL)hasTmsi;
- (BOOL)hasUpdateStatus;
- (BOOL)isCombinedProc;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (KCellularLocationAreaId)lai;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)procFailureCauseAsString:(int)a3;
- (id)regStatusAsString:(int)a3;
- (id)rejectCauseAsString:(int)a3;
- (id)updateStatusAsString:(int)a3;
- (int)StringAsProcFailureCause:(id)a3;
- (int)StringAsRegStatus:(id)a3;
- (int)StringAsRejectCause:(id)a3;
- (int)StringAsUpdateStatus:(id)a3;
- (int)procFailureCause;
- (int)regStatus;
- (int)rejectCause;
- (int)updateStatus;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)subsId;
- (unsigned)t3212DurS;
- (unsigned)tmsi;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsCombinedProc:(BOOL)a3;
- (void)setHasProcFailureCause:(BOOL)a3;
- (void)setHasRegStatus:(BOOL)a3;
- (void)setHasRejectCause:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasT3212DurS:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTmsi:(BOOL)a3;
- (void)setHasUpdateStatus:(BOOL)a3;
- (void)setIsCombinedProc:(BOOL)a3;
- (void)setLai:(id)a3;
- (void)setProcFailureCause:(int)a3;
- (void)setRegStatus:(int)a3;
- (void)setRejectCause:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setT3212DurS:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTmsi:(unsigned int)a3;
- (void)setUpdateStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularMmContext

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

- (int)regStatus
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_regStatus;
  }
  else {
    return 0;
  }
}

- (void)setRegStatus:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_regStatus = a3;
}

- (void)setHasRegStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRegStatus
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)regStatusAsString:(int)a3
{
  v4 = @"KREG_STATUS_NORMAL_SERVICE";
  switch(a3)
  {
    case 0:
      goto LABEL_43;
    case 1:
      v4 = @"KREG_STATUS_REGISTRATION_FAILURE";
      break;
    case 2:
      v4 = @"KREG_STATUS_LIMITED_SERVICE";
      break;
    case 3:
      v4 = @"KREG_STATUS_NO_SERVICE";
      break;
    case 4:
      v4 = @"KREG_STATUS_AT_NOT_REGISTERED";
      break;
    case 5:
      v4 = @"KREG_STATUS_REGISTRATION_SERVICE_DISABLED";
      break;
    case 6:
      v4 = @"KREG_STATUS_SERVICE_DETACHED";
      break;
    case 7:
      v4 = @"KREG_STATUS_SERVICE_ACTIVATED";
      break;
    case 8:
      v4 = @"KREG_STATUS_EMERGENCY_SERVICE";
      break;
    case 9:
      v4 = @"KREG_STATUS_EMERGENCY_LIMITED";
      break;
    case 10:
      v4 = @"KREG_STATUS_REGISTERED_SMS_ONLY";
      break;
    case 11:
      v4 = @"KREG_STATUS_REGISTRATION_IN_PROGRESS";
      break;
    case 12:
      v4 = @"KREG_STATUS_POWER_OFF_NO_SERVICE";
      break;
    default:
      if (a3 == 100)
      {
        v4 = @"KREG_STATUS_SUSPENDED";
      }
      else
      {
        v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_43:
      }
      break;
  }
  return v4;
}

- (int)StringAsRegStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KREG_STATUS_NORMAL_SERVICE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KREG_STATUS_REGISTRATION_FAILURE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KREG_STATUS_LIMITED_SERVICE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KREG_STATUS_NO_SERVICE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KREG_STATUS_AT_NOT_REGISTERED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KREG_STATUS_REGISTRATION_SERVICE_DISABLED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KREG_STATUS_SERVICE_DETACHED"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KREG_STATUS_SERVICE_ACTIVATED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KREG_STATUS_EMERGENCY_SERVICE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KREG_STATUS_EMERGENCY_LIMITED"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"KREG_STATUS_REGISTERED_SMS_ONLY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"KREG_STATUS_REGISTRATION_IN_PROGRESS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"KREG_STATUS_POWER_OFF_NO_SERVICE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"KREG_STATUS_SUSPENDED"])
  {
    int v4 = 100;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)updateStatus
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_updateStatus;
  }
  else {
    return 1;
  }
}

- (void)setUpdateStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_updateStatus = a3;
}

- (void)setHasUpdateStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasUpdateStatus
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)updateStatusAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100287D60 + a3 - 1);
  }

  return v3;
}

- (int)StringAsUpdateStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_UPDATED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_NOT_UPDATED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"STATUS_ROAMING_NOT_ALLOWED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"STATUS_UPDATE_DISABLED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasLai
{
  return self->_lai != 0;
}

- (void)setTmsi:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_tmsi = a3;
}

- (void)setHasTmsi:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTmsi
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setT3212DurS:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_t3212DurS = a3;
}

- (void)setHasT3212DurS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasT3212DurS
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)procFailureCause
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_procFailureCause;
  }
  else {
    return 0;
  }
}

- (void)setProcFailureCause:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_procFailureCause = a3;
}

- (void)setHasProcFailureCause:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasProcFailureCause
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)procFailureCauseAsString:(int)a3
{
  if (a3 >= 0x10)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100287D80 + a3);
  }

  return v3;
}

- (int)StringAsProcFailureCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_LOWER_LAYER_FAILURE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_ACCESS_BARRED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_LIMITED_SERVICE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_PAGE_NOT_EXPECTED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_T3210_EXPIRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_T3240_EXPIRY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_DETACH_INITIATED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_PS_SUSPENDED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_SERV_REQ_THROTTLING"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_T3317_EXPIRY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_REJECTED_BY_NW"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_NW_AUTH_REJ"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_INVALID_IE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_TIMEOUT"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_PROC_FAILURE_CAUSE_OTHER"])
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)rejectCause
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_rejectCause;
  }
  else {
    return 0;
  }
}

- (void)setRejectCause:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rejectCause = a3;
}

- (void)setHasRejectCause:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRejectCause
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)rejectCauseAsString:(int)a3
{
  int v4 = @"KNAS_MM_REJ_CAUSE_NONE";
  switch(a3)
  {
    case 0:
      goto LABEL_106;
    case 1:
    case 18:
    case 19:
    case 24:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 35:
    case 36:
    case 37:
    case 39:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
LABEL_105:
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_106:
      break;
    case 2:
      int v4 = @"KNAS_MM_REJ_CAUSE_IMSI_UNKNOWN";
      break;
    case 3:
      int v4 = @"KNAS_MM_REJ_CAUSE_ILLEGAL_MS";
      break;
    case 4:
      int v4 = @"KNAS_MM_REJ_CAUSE_IMSI_UNKNOWN_IN_VLR";
      break;
    case 5:
      int v4 = @"KNAS_MM_REJ_CAUSE_IMEI_NOT_ACCEPTED";
      break;
    case 6:
      int v4 = @"KNAS_MM_REJ_CAUSE_ILLEGAL_ME";
      break;
    case 7:
      int v4 = @"KNAS_MM_REJ_CAUSE_GPRS_SERVICES_NOT_ALLOWED";
      break;
    case 8:
      int v4 = @"KNAS_MM_REJ_CAUSE_GPRS_AND_NON_GPRS_SERVICES_NOT_ALLOWED";
      break;
    case 9:
      int v4 = @"KNAS_MM_REJ_CAUSE_MS_IDENTITY_NOT_DERIVED_BY_NW";
      break;
    case 10:
      int v4 = @"KNAS_MM_REJ_CAUSE_IMPLICITLY_DET";
      break;
    case 11:
      int v4 = @"KNAS_MM_REJ_CAUSE_PLMN_NOT_ALLOWED";
      break;
    case 12:
      int v4 = @"KNAS_MM_REJ_CAUSE_LA_NOT_ALLOWED";
      break;
    case 13:
      int v4 = @"KNAS_MM_REJ_CAUSE_ROM_NOT_ALLOWED_IN_LA";
      break;
    case 14:
      int v4 = @"KNAS_MM_REJ_CAUSE_GPRS_NOT_ALLOWED_IN_PLMN";
      break;
    case 15:
      int v4 = @"KNAS_MM_REJ_CAUSE_NO_SUITABLE_CELL_IN_LA";
      break;
    case 16:
      int v4 = @"KNAS_MM_REJ_CAUSE_MSC_OUT_OF_REACH";
      break;
    case 17:
      int v4 = @"KNAS_MM_REJ_CAUSE_NW_FAILURE";
      break;
    case 20:
      int v4 = @"KNAS_MM_REJ_CAUSE_MAC_FAILURE";
      break;
    case 21:
      int v4 = @"KNAS_MM_REJ_CAUSE_SYNCH_FAILURE";
      break;
    case 22:
      int v4 = @"KNAS_MM_REJ_CAUSE_CONGESTION";
      break;
    case 23:
      int v4 = @"KNAS_MM_REJ_CAUSE_GSM_AUTH_UNACCEPTABLE";
      break;
    case 25:
      int v4 = @"KNAS_MM_REJ_CAUSE_CSG_NOT_AUTHORIZED";
      break;
    case 32:
      int v4 = @"KNAS_MM_REJ_CAUSE_SERVICE_OPTION_NOT_SUPPORTED";
      break;
    case 33:
      int v4 = @"KNAS_MM_REJ_CAUSE_REQ_SERVICE_OPTION_NOT_SUBSCRIBED";
      break;
    case 34:
      int v4 = @"KNAS_MM_REJ_CAUSE_SERVICE_OPTION_TEMPORARILY_OUT_OF_ORDER";
      break;
    case 38:
      int v4 = @"KNAS_MM_REJ_CAUSE_CALL_NOT_IDENTIFIED";
      break;
    case 40:
      int v4 = @"KNAS_MM_REJ_CAUSE_NO_PDP_CONTEXT_ACTIVATED";
      break;
    case 63:
      int v4 = @"KNAS_MM_REJ_CAUSE_RETRY_UPON_ENTRY_TO_NEW_CELL";
      break;
    default:
      switch(a3)
      {
        case '_':
          int v4 = @"KNAS_MM_REJ_CAUSE_SEMANTICALLY_INCORRECT_MSG";
          break;
          int v4 = @"KNAS_MM_REJ_CAUSE_INVALID_MANDATORY_INFO";
          break;
        case 'a':
          int v4 = @"KNAS_MM_REJ_CAUSE_MSG_TYPE_NOT_IMPL";
          break;
        case 'b':
          int v4 = @"KNAS_MM_REJ_CAUSE_MSG_TYPE_NOT_COMPATIBLE";
          break;
        case 'c':
          int v4 = @"KNAS_MM_REJ_CAUSE_INFO_ELEMENT_NOT_IMPL";
          break;
        case 'd':
          int v4 = @"KNAS_MM_REJ_CAUSE_IE_ERROR";
          break;
        case 'e':
          int v4 = @"KNAS_MM_REJ_CAUSE_MSG_NOT_COMPATIBLE";
          break;
        case 'o':
          int v4 = @"KNAS_MM_REJ_CAUSE_PROTOCOL_ERROR_UNSPECIFIED";
          break;
        default:
          goto LABEL_105;
      }
      break;
  }
  return v4;
}

- (int)StringAsRejectCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_IMSI_UNKNOWN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_ILLEGAL_MS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_IMSI_UNKNOWN_IN_VLR"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_IMEI_NOT_ACCEPTED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_ILLEGAL_ME"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_GPRS_SERVICES_NOT_ALLOWED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_GPRS_AND_NON_GPRS_SERVICES_NOT_ALLOWED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_MS_IDENTITY_NOT_DERIVED_BY_NW"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_IMPLICITLY_DET"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_PLMN_NOT_ALLOWED"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_LA_NOT_ALLOWED"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_ROM_NOT_ALLOWED_IN_LA"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_GPRS_NOT_ALLOWED_IN_PLMN"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_NO_SUITABLE_CELL_IN_LA"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_MSC_OUT_OF_REACH"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_NW_FAILURE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_MAC_FAILURE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_SYNCH_FAILURE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_CONGESTION"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_GSM_AUTH_UNACCEPTABLE"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_CSG_NOT_AUTHORIZED"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_SERVICE_OPTION_NOT_SUPPORTED"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_REQ_SERVICE_OPTION_NOT_SUBSCRIBED"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_SERVICE_OPTION_TEMPORARILY_OUT_OF_ORDER"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_CALL_NOT_IDENTIFIED"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_NO_PDP_CONTEXT_ACTIVATED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_RETRY_UPON_ENTRY_TO_NEW_CELL"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_SEMANTICALLY_INCORRECT_MSG"])
  {
    int v4 = 95;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_INVALID_MANDATORY_INFO"])
  {
    int v4 = 96;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_MSG_TYPE_NOT_IMPL"])
  {
    int v4 = 97;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_MSG_TYPE_NOT_COMPATIBLE"])
  {
    int v4 = 98;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_INFO_ELEMENT_NOT_IMPL"])
  {
    int v4 = 99;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_IE_ERROR"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_MSG_NOT_COMPATIBLE"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"KNAS_MM_REJ_CAUSE_PROTOCOL_ERROR_UNSPECIFIED"])
  {
    int v4 = 111;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setIsCombinedProc:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isCombinedProc = a3;
}

- (void)setHasIsCombinedProc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsCombinedProc
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularMmContext;
  __int16 v3 = [(KCellularMmContext *)&v7 description];
  int v4 = [(KCellularMmContext *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_27;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  int regStatus = self->_regStatus;
  objc_super v7 = @"KREG_STATUS_NORMAL_SERVICE";
  switch(regStatus)
  {
    case 0:
      break;
    case 1:
      objc_super v7 = @"KREG_STATUS_REGISTRATION_FAILURE";
      break;
    case 2:
      objc_super v7 = @"KREG_STATUS_LIMITED_SERVICE";
      break;
    case 3:
      objc_super v7 = @"KREG_STATUS_NO_SERVICE";
      break;
    case 4:
      objc_super v7 = @"KREG_STATUS_AT_NOT_REGISTERED";
      break;
    case 5:
      objc_super v7 = @"KREG_STATUS_REGISTRATION_SERVICE_DISABLED";
      break;
    case 6:
      objc_super v7 = @"KREG_STATUS_SERVICE_DETACHED";
      break;
    case 7:
      objc_super v7 = @"KREG_STATUS_SERVICE_ACTIVATED";
      break;
    case 8:
      objc_super v7 = @"KREG_STATUS_EMERGENCY_SERVICE";
      break;
    case 9:
      objc_super v7 = @"KREG_STATUS_EMERGENCY_LIMITED";
      break;
    case 10:
      objc_super v7 = @"KREG_STATUS_REGISTERED_SMS_ONLY";
      break;
    case 11:
      objc_super v7 = @"KREG_STATUS_REGISTRATION_IN_PROGRESS";
      break;
    case 12:
      objc_super v7 = @"KREG_STATUS_POWER_OFF_NO_SERVICE";
      break;
    default:
      if (regStatus == 100)
      {
        objc_super v7 = @"KREG_STATUS_SUSPENDED";
      }
      else
      {
        objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_regStatus];
      }
      break;
  }
  [v3 setObject:v7 forKey:@"reg_status"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_23:
    int v8 = self->_updateStatus - 1;
    if (v8 >= 4)
    {
      v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_updateStatus];
    }
    else
    {
      v9 = *(&off_100287D60 + v8);
    }
    [v3 setObject:v9 forKey:@"update_status"];
  }
LABEL_27:
  lai = self->_lai;
  if (lai)
  {
    v11 = [(KCellularLocationAreaId *)lai dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"lai"];
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x40) != 0)
  {
    v15 = +[NSNumber numberWithUnsignedInt:self->_tmsi];
    [v3 setObject:v15 forKey:@"tmsi"];

    __int16 v12 = (__int16)self->_has;
    if ((v12 & 0x20) == 0)
    {
LABEL_31:
      if ((v12 & 2) == 0) {
        goto LABEL_32;
      }
      goto LABEL_41;
    }
  }
  else if ((v12 & 0x20) == 0)
  {
    goto LABEL_31;
  }
  v16 = +[NSNumber numberWithUnsignedInt:self->_t3212DurS];
  [v3 setObject:v16 forKey:@"t3212_dur_s"];

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 2) == 0)
  {
LABEL_32:
    if ((v12 & 8) == 0) {
      goto LABEL_33;
    }
    goto LABEL_45;
  }
LABEL_41:
  uint64_t procFailureCause = self->_procFailureCause;
  if (procFailureCause >= 0x10)
  {
    v18 = +[NSString stringWithFormat:@"(unknown: %i)", self->_procFailureCause];
  }
  else
  {
    v18 = *(&off_100287D80 + procFailureCause);
  }
  [v3 setObject:v18 forKey:@"proc_failure_cause"];

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 8) == 0)
  {
LABEL_33:
    if ((v12 & 0x100) == 0) {
      goto LABEL_34;
    }
    goto LABEL_84;
  }
LABEL_45:
  int rejectCause = self->_rejectCause;
  v20 = @"KNAS_MM_REJ_CAUSE_NONE";
  switch(rejectCause)
  {
    case 0:
      break;
    case 1:
    case 18:
    case 19:
    case 24:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 35:
    case 36:
    case 37:
    case 39:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
LABEL_81:
      v20 = +[NSString stringWithFormat:@"(unknown: %i)", self->_rejectCause];
      break;
    case 2:
      v20 = @"KNAS_MM_REJ_CAUSE_IMSI_UNKNOWN";
      break;
    case 3:
      v20 = @"KNAS_MM_REJ_CAUSE_ILLEGAL_MS";
      break;
    case 4:
      v20 = @"KNAS_MM_REJ_CAUSE_IMSI_UNKNOWN_IN_VLR";
      break;
    case 5:
      v20 = @"KNAS_MM_REJ_CAUSE_IMEI_NOT_ACCEPTED";
      break;
    case 6:
      v20 = @"KNAS_MM_REJ_CAUSE_ILLEGAL_ME";
      break;
    case 7:
      v20 = @"KNAS_MM_REJ_CAUSE_GPRS_SERVICES_NOT_ALLOWED";
      break;
    case 8:
      v20 = @"KNAS_MM_REJ_CAUSE_GPRS_AND_NON_GPRS_SERVICES_NOT_ALLOWED";
      break;
    case 9:
      v20 = @"KNAS_MM_REJ_CAUSE_MS_IDENTITY_NOT_DERIVED_BY_NW";
      break;
    case 10:
      v20 = @"KNAS_MM_REJ_CAUSE_IMPLICITLY_DET";
      break;
    case 11:
      v20 = @"KNAS_MM_REJ_CAUSE_PLMN_NOT_ALLOWED";
      break;
    case 12:
      v20 = @"KNAS_MM_REJ_CAUSE_LA_NOT_ALLOWED";
      break;
    case 13:
      v20 = @"KNAS_MM_REJ_CAUSE_ROM_NOT_ALLOWED_IN_LA";
      break;
    case 14:
      v20 = @"KNAS_MM_REJ_CAUSE_GPRS_NOT_ALLOWED_IN_PLMN";
      break;
    case 15:
      v20 = @"KNAS_MM_REJ_CAUSE_NO_SUITABLE_CELL_IN_LA";
      break;
    case 16:
      v20 = @"KNAS_MM_REJ_CAUSE_MSC_OUT_OF_REACH";
      break;
    case 17:
      v20 = @"KNAS_MM_REJ_CAUSE_NW_FAILURE";
      break;
    case 20:
      v20 = @"KNAS_MM_REJ_CAUSE_MAC_FAILURE";
      break;
    case 21:
      v20 = @"KNAS_MM_REJ_CAUSE_SYNCH_FAILURE";
      break;
    case 22:
      v20 = @"KNAS_MM_REJ_CAUSE_CONGESTION";
      break;
    case 23:
      v20 = @"KNAS_MM_REJ_CAUSE_GSM_AUTH_UNACCEPTABLE";
      break;
    case 25:
      v20 = @"KNAS_MM_REJ_CAUSE_CSG_NOT_AUTHORIZED";
      break;
    case 32:
      v20 = @"KNAS_MM_REJ_CAUSE_SERVICE_OPTION_NOT_SUPPORTED";
      break;
    case 33:
      v20 = @"KNAS_MM_REJ_CAUSE_REQ_SERVICE_OPTION_NOT_SUBSCRIBED";
      break;
    case 34:
      v20 = @"KNAS_MM_REJ_CAUSE_SERVICE_OPTION_TEMPORARILY_OUT_OF_ORDER";
      break;
    case 38:
      v20 = @"KNAS_MM_REJ_CAUSE_CALL_NOT_IDENTIFIED";
      break;
    case 40:
      v20 = @"KNAS_MM_REJ_CAUSE_NO_PDP_CONTEXT_ACTIVATED";
      break;
    case 63:
      v20 = @"KNAS_MM_REJ_CAUSE_RETRY_UPON_ENTRY_TO_NEW_CELL";
      break;
    default:
      switch(rejectCause)
      {
        case '_':
          v20 = @"KNAS_MM_REJ_CAUSE_SEMANTICALLY_INCORRECT_MSG";
          break;
          v20 = @"KNAS_MM_REJ_CAUSE_INVALID_MANDATORY_INFO";
          break;
        case 'a':
          v20 = @"KNAS_MM_REJ_CAUSE_MSG_TYPE_NOT_IMPL";
          break;
        case 'b':
          v20 = @"KNAS_MM_REJ_CAUSE_MSG_TYPE_NOT_COMPATIBLE";
          break;
        case 'c':
          v20 = @"KNAS_MM_REJ_CAUSE_INFO_ELEMENT_NOT_IMPL";
          break;
        case 'd':
          v20 = @"KNAS_MM_REJ_CAUSE_IE_ERROR";
          break;
        case 'e':
          v20 = @"KNAS_MM_REJ_CAUSE_MSG_NOT_COMPATIBLE";
          break;
        case 'o':
          v20 = @"KNAS_MM_REJ_CAUSE_PROTOCOL_ERROR_UNSPECIFIED";
          break;
        default:
          goto LABEL_81;
      }
      break;
  }
  [v3 setObject:v20 forKey:@"reject_cause"];

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x100) == 0)
  {
LABEL_34:
    if ((v12 & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_84:
  v21 = +[NSNumber numberWithBool:self->_isCombinedProc];
  [v3 setObject:v21 forKey:@"is_combined_proc"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_35:
    v13 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v13 forKey:@"subs_id"];
  }
LABEL_36:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000E387C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_lai) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x20) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_22;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint32Field();
LABEL_14:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 28) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_regStatus;
  *((_WORD *)v4 + 28) |= 4u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 12) = self->_updateStatus;
    *((_WORD *)v4 + 28) |= 0x80u;
  }
LABEL_5:
  if (self->_lai)
  {
    objc_super v7 = v4;
    [v4 setLai:];
    int v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_tmsi;
    *((_WORD *)v4 + 28) |= 0x40u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_9:
      if ((v6 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_22;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 10) = self->_t3212DurS;
  *((_WORD *)v4 + 28) |= 0x20u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_10:
    if ((v6 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 6) = self->_procFailureCause;
  *((_WORD *)v4 + 28) |= 2u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_11:
    if ((v6 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 8) = self->_rejectCause;
  *((_WORD *)v4 + 28) |= 8u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_12:
    if ((v6 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_24:
  *((unsigned char *)v4 + 52) = self->_isCombinedProc;
  *((_WORD *)v4 + 28) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 9) = self->_subsId;
    *((_WORD *)v4 + 28) |= 0x10u;
  }
LABEL_14:
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int16 v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 28) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 7) = self->_regStatus;
  *((_WORD *)v5 + 28) |= 4u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 12) = self->_updateStatus;
    *((_WORD *)v5 + 28) |= 0x80u;
  }
LABEL_5:
  id v8 = [(KCellularLocationAreaId *)self->_lai copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x40) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_tmsi;
    *((_WORD *)v6 + 28) |= 0x40u;
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 0x20) == 0)
    {
LABEL_7:
      if ((v10 & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((v10 & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v6 + 10) = self->_t3212DurS;
  *((_WORD *)v6 + 28) |= 0x20u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 2) == 0)
  {
LABEL_8:
    if ((v10 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v6 + 6) = self->_procFailureCause;
  *((_WORD *)v6 + 28) |= 2u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) == 0)
  {
LABEL_9:
    if ((v10 & 0x100) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    *((unsigned char *)v6 + 52) = self->_isCombinedProc;
    *((_WORD *)v6 + 28) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      return v6;
    }
    goto LABEL_11;
  }
LABEL_19:
  *((_DWORD *)v6 + 8) = self->_rejectCause;
  *((_WORD *)v6 + 28) |= 8u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((v10 & 0x10) != 0)
  {
LABEL_11:
    *((_DWORD *)v6 + 9) = self->_subsId;
    *((_WORD *)v6 + 28) |= 0x10u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_53;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 28);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_53;
    }
  }
  else if (v6)
  {
    goto LABEL_53;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_regStatus != *((_DWORD *)v4 + 7)) {
      goto LABEL_53;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_updateStatus != *((_DWORD *)v4 + 12)) {
      goto LABEL_53;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_53;
  }
  lai = self->_lai;
  if ((unint64_t)lai | *((void *)v4 + 2))
  {
    if (!-[KCellularLocationAreaId isEqual:](lai, "isEqual:")) {
      goto LABEL_53;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v8 = *((_WORD *)v4 + 28);
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_tmsi != *((_DWORD *)v4 + 11)) {
      goto LABEL_53;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_t3212DurS != *((_DWORD *)v4 + 10)) {
      goto LABEL_53;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_procFailureCause != *((_DWORD *)v4 + 6)) {
      goto LABEL_53;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_rejectCause != *((_DWORD *)v4 + 8)) {
      goto LABEL_53;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x100) != 0)
    {
      if (self->_isCombinedProc)
      {
        if (!*((unsigned char *)v4 + 52)) {
          goto LABEL_53;
        }
        goto LABEL_48;
      }
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_48;
      }
    }
LABEL_53:
    BOOL v9 = 0;
    goto LABEL_54;
  }
  if ((*((_WORD *)v4 + 28) & 0x100) != 0) {
    goto LABEL_53;
  }
LABEL_48:
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_subsId != *((_DWORD *)v4 + 9)) {
      goto LABEL_53;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (v8 & 0x10) == 0;
  }
LABEL_54:

  return v9;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    unint64_t v4 = 0;
    if ((has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v4 = 2654435761u * self->_timestamp;
  if ((has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_regStatus;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_updateStatus;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v6 = 0;
LABEL_8:
  unint64_t v7 = [(KCellularLocationAreaId *)self->_lai hash];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x40) != 0)
  {
    uint64_t v9 = 2654435761 * self->_tmsi;
    if ((v8 & 0x20) != 0)
    {
LABEL_10:
      uint64_t v10 = 2654435761 * self->_t3212DurS;
      if ((v8 & 2) != 0) {
        goto LABEL_11;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((v8 & 0x20) != 0) {
      goto LABEL_10;
    }
  }
  uint64_t v10 = 0;
  if ((v8 & 2) != 0)
  {
LABEL_11:
    uint64_t v11 = 2654435761 * self->_procFailureCause;
    if ((v8 & 8) != 0) {
      goto LABEL_12;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v11 = 0;
  if ((v8 & 8) != 0)
  {
LABEL_12:
    uint64_t v12 = 2654435761 * self->_rejectCause;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_13;
    }
LABEL_19:
    uint64_t v13 = 0;
    if ((v8 & 0x10) != 0) {
      goto LABEL_14;
    }
LABEL_20:
    uint64_t v14 = 0;
    return v5 ^ v4 ^ v6 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v7;
  }
LABEL_18:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_19;
  }
LABEL_13:
  uint64_t v13 = 2654435761 * self->_isCombinedProc;
  if ((v8 & 0x10) == 0) {
    goto LABEL_20;
  }
LABEL_14:
  uint64_t v14 = 2654435761 * self->_subsId;
  return v5 ^ v4 ^ v6 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 28);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 28);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 0x80) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_int regStatus = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 28) & 0x80) != 0)
  {
LABEL_4:
    self->_updateStatus = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_5:
  lai = self->_lai;
  uint64_t v8 = *((void *)v5 + 2);
  if (lai)
  {
    if (!v8) {
      goto LABEL_14;
    }
    id v10 = v5;
    -[KCellularLocationAreaId mergeFrom:](lai, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    id v10 = v5;
    -[KCellularMmContext setLai:](self, "setLai:");
  }
  id v5 = v10;
LABEL_14:
  __int16 v9 = *((_WORD *)v5 + 28);
  if ((v9 & 0x40) != 0)
  {
    self->_tmsi = *((_DWORD *)v5 + 11);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v9 = *((_WORD *)v5 + 28);
    if ((v9 & 0x20) == 0)
    {
LABEL_16:
      if ((v9 & 2) == 0) {
        goto LABEL_17;
      }
      goto LABEL_26;
    }
  }
  else if ((v9 & 0x20) == 0)
  {
    goto LABEL_16;
  }
  self->_t3212DurS = *((_DWORD *)v5 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v9 = *((_WORD *)v5 + 28);
  if ((v9 & 2) == 0)
  {
LABEL_17:
    if ((v9 & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_uint64_t procFailureCause = *((_DWORD *)v5 + 6);
  *(_WORD *)&self->_has |= 2u;
  __int16 v9 = *((_WORD *)v5 + 28);
  if ((v9 & 8) == 0)
  {
LABEL_18:
    if ((v9 & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_int rejectCause = *((_DWORD *)v5 + 8);
  *(_WORD *)&self->_has |= 8u;
  __int16 v9 = *((_WORD *)v5 + 28);
  if ((v9 & 0x100) == 0)
  {
LABEL_19:
    if ((v9 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_28:
  self->_isCombinedProc = *((unsigned char *)v5 + 52);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v5 + 28) & 0x10) != 0)
  {
LABEL_20:
    self->_subsId = *((_DWORD *)v5 + 9);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_21:

  _objc_release_x1();
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (KCellularLocationAreaId)lai
{
  return self->_lai;
}

- (void)setLai:(id)a3
{
}

- (unsigned)tmsi
{
  return self->_tmsi;
}

- (unsigned)t3212DurS
{
  return self->_t3212DurS;
}

- (BOOL)isCombinedProc
{
  return self->_isCombinedProc;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
}

@end