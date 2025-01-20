@interface KCellularEmmContext
+ (Class)taiListType;
- (BOOL)hasGuti;
- (BOOL)hasIsEmergBearerSupported;
- (BOOL)hasIsImsVoiceSupported;
- (BOOL)hasRegProc;
- (BOOL)hasRegStatus;
- (BOOL)hasRejectCause;
- (BOOL)hasSubsId;
- (BOOL)hasT3412DurS;
- (BOOL)hasTimestamp;
- (BOOL)hasUeOpMode;
- (BOOL)hasUpdateStatus;
- (BOOL)isEmergBearerSupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)isImsVoiceSupported;
- (BOOL)readFrom:(id)a3;
- (Guti)guti;
- (NSMutableArray)taiLists;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)regProcAsString:(int)a3;
- (id)regStatusAsString:(int)a3;
- (id)rejectCauseAsString:(int)a3;
- (id)taiListAtIndex:(unint64_t)a3;
- (id)ueOpModeAsString:(int)a3;
- (id)updateStatusAsString:(int)a3;
- (int)StringAsRegProc:(id)a3;
- (int)StringAsRegStatus:(id)a3;
- (int)StringAsRejectCause:(id)a3;
- (int)StringAsUeOpMode:(id)a3;
- (int)StringAsUpdateStatus:(id)a3;
- (int)regProc;
- (int)regStatus;
- (int)rejectCause;
- (int)ueOpMode;
- (int)updateStatus;
- (unint64_t)hash;
- (unint64_t)taiListsCount;
- (unint64_t)timestamp;
- (unsigned)subsId;
- (unsigned)t3412DurS;
- (void)addTaiList:(id)a3;
- (void)clearTaiLists;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGuti:(id)a3;
- (void)setHasIsEmergBearerSupported:(BOOL)a3;
- (void)setHasIsImsVoiceSupported:(BOOL)a3;
- (void)setHasRegProc:(BOOL)a3;
- (void)setHasRegStatus:(BOOL)a3;
- (void)setHasRejectCause:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasT3412DurS:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUeOpMode:(BOOL)a3;
- (void)setHasUpdateStatus:(BOOL)a3;
- (void)setIsEmergBearerSupported:(BOOL)a3;
- (void)setIsImsVoiceSupported:(BOOL)a3;
- (void)setRegProc:(int)a3;
- (void)setRegStatus:(int)a3;
- (void)setRejectCause:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setT3412DurS:(unsigned int)a3;
- (void)setTaiLists:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUeOpMode:(int)a3;
- (void)setUpdateStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularEmmContext

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
    return 0;
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
  if (a3 >= 3)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100287388 + a3);
  }

  return v3;
}

- (int)StringAsUpdateStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EPS_STATUS_UPDATED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EPS_STATUS_NOT_UPDATED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EPS_STATUS_ROAMING_NOT_ALLOWED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)ueOpMode
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_ueOpMode;
  }
  else {
    return 0;
  }
}

- (void)setUeOpMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_ueOpMode = a3;
}

- (void)setHasUeOpMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasUeOpMode
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)ueOpModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_1002873A0 + a3);
  }

  return v3;
}

- (int)StringAsUeOpMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EPS_UE_OP_MODE_PS_MODE_1"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EPS_UE_OP_MODE_PS_MODE_2"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EPS_UE_OP_MODE_CSPS_MODE_1"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EPS_UE_OP_MODE_CSPS_MODE_2"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearTaiLists
{
}

- (void)addTaiList:(id)a3
{
  id v4 = a3;
  taiLists = self->_taiLists;
  id v8 = v4;
  if (!taiLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_taiLists;
    self->_taiLists = v6;

    id v4 = v8;
    taiLists = self->_taiLists;
  }
  [(NSMutableArray *)taiLists addObject:v4];
}

- (unint64_t)taiListsCount
{
  return (unint64_t)[(NSMutableArray *)self->_taiLists count];
}

- (id)taiListAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_taiLists objectAtIndex:a3];
}

+ (Class)taiListType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasGuti
{
  return self->_guti != 0;
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
  id v4 = @"EMM_CAUSE_NO_CAUSE";
  switch(a3)
  {
    case 0:
      goto LABEL_106;
    case 1:
    case 4:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 36:
    case 37:
    case 38:
LABEL_105:
      id v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_106:
      break;
    case 2:
      id v4 = @"EMM_CAUSE_IMSI_UNKNOWN_IN_HSS";
      break;
    case 3:
      id v4 = @"EMM_CAUSE_ILLEGAL_UE";
      break;
    case 5:
      id v4 = @"EMM_CAUSE_IMEI_NOT_ACCEPTED";
      break;
    case 6:
      id v4 = @"EMM_CAUSE_ILLEGAL_ME";
      break;
    case 7:
      id v4 = @"EMM_CAUSE_EPS_SERVICES_NOT_ALLOWED";
      break;
    case 8:
      id v4 = @"EMM_CAUSE_EPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED";
      break;
    case 9:
      id v4 = @"EMM_CAUSE_UE_IDENTITY_CANNOT_BE_DERIVED_BY_NETWORK";
      break;
    case 10:
      id v4 = @"EMM_CAUSE_IMPLICITLY_DETACHED";
      break;
    case 11:
      id v4 = @"EMM_CAUSE_PLMN_NOT_ALLOWED";
      break;
    case 12:
      id v4 = @"EMM_CAUSE_TRACKING_AREA_NOT_ALLOWED";
      break;
    case 13:
      id v4 = @"EMM_CAUSE_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA";
      break;
    case 14:
      id v4 = @"EMM_CAUSE_EPS_SERVICES_NOT_ALLOWED_IN_THIS_PLMN";
      break;
    case 15:
      id v4 = @"EMM_CAUSE_NO_SUITABLE_CELLS_IN_TRACKING_AREA";
      break;
    case 16:
      id v4 = @"EMM_CAUSE_MSC_TEMPORARILY_NOT_REACHABLE";
      break;
    case 17:
      id v4 = @"EMM_CAUSE_NETWORK_FAILURE";
      break;
    case 18:
      id v4 = @"EMM_CAUSE_CS_DOMAIN_NOT_AVAILABLE";
      break;
    case 19:
      id v4 = @"EMM_CAUSE_ESM_FAILURE";
      break;
    case 20:
      id v4 = @"EMM_CAUSE_MAC_FAILURE";
      break;
    case 21:
      id v4 = @"EMM_CAUSE_SYNCH_FAILURE";
      break;
    case 22:
      id v4 = @"EMM_CAUSE_CONGESTION";
      break;
    case 23:
      id v4 = @"EMM_CAUSE_UE_SECURITY_CAPABILITY_MISMATCH";
      break;
    case 24:
      id v4 = @"EMM_CAUSE_SECURITY_MODE_REJECTED_UNSPECIFIED";
      break;
    case 25:
      id v4 = @"EMM_CAUSE_NOT_AUTHORIZED_FOR_THIS_CSG";
      break;
    case 26:
      id v4 = @"EMM_CAUSE_NON_EPS_AUTHENTICATION_UNACCEPTABLE";
      break;
    case 35:
      id v4 = @"EMM_CAUSE_REQUESTED_SERVICE_OPTION_NOT_AUTHORIZED_IN_THIS_PLMN";
      break;
    case 39:
      id v4 = @"EMM_CAUSE_CS_DOMAIN_TEMPORARILY_NOT_AVAILABLE";
      break;
    case 40:
      id v4 = @"EMM_CAUSE_NO_EPS_BEARER_CONTEXT_ACTIVATED";
      break;
    default:
      switch(a3)
      {
        case '_':
          id v4 = @"EMM_CAUSE_SEMANTICALLY_INCORRECT_MESSAGE";
          break;
          id v4 = @"EMM_CAUSE_INVALID_MANDATORY_INFORMATION";
          break;
        case 'a':
          id v4 = @"EMM_CAUSE_MESSAGE_TYPE_NON_EXISTENT_OR_NOT_IMPLEMENTED";
          break;
        case 'b':
          id v4 = @"EMM_CAUSE_MESSAGE_TYPE_NOT_COMPATIBLE_WITH_PROTOCOL_STATE";
          break;
        case 'c':
          id v4 = @"EMM_CAUSE_IE_NON_EXISTENT_OR_NOT_IMPLEMENTED";
          break;
        case 'd':
          id v4 = @"EMM_CAUSE_CONDITIONAL_IE_ERROR";
          break;
        case 'e':
          id v4 = @"EMM_CAUSE_MESSAGE_NOT_COMPATIBLE_WITH_PROTOCOL_STATE";
          break;
        case 'o':
          id v4 = @"EMM_CAUSE_PROTOCOL_ERROR_UNSPECIFIED";
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
  if ([v3 isEqualToString:@"EMM_CAUSE_NO_CAUSE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_IMSI_UNKNOWN_IN_HSS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_ILLEGAL_UE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_IMEI_NOT_ACCEPTED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_ILLEGAL_ME"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_EPS_SERVICES_NOT_ALLOWED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_EPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_UE_IDENTITY_CANNOT_BE_DERIVED_BY_NETWORK"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_IMPLICITLY_DETACHED"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_PLMN_NOT_ALLOWED"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_TRACKING_AREA_NOT_ALLOWED"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_EPS_SERVICES_NOT_ALLOWED_IN_THIS_PLMN"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_NO_SUITABLE_CELLS_IN_TRACKING_AREA"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_MSC_TEMPORARILY_NOT_REACHABLE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_NETWORK_FAILURE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_CS_DOMAIN_NOT_AVAILABLE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_ESM_FAILURE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_MAC_FAILURE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_SYNCH_FAILURE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_CONGESTION"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_UE_SECURITY_CAPABILITY_MISMATCH"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_SECURITY_MODE_REJECTED_UNSPECIFIED"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_NOT_AUTHORIZED_FOR_THIS_CSG"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_NON_EPS_AUTHENTICATION_UNACCEPTABLE"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_REQUESTED_SERVICE_OPTION_NOT_AUTHORIZED_IN_THIS_PLMN"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_CS_DOMAIN_TEMPORARILY_NOT_AVAILABLE"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_NO_EPS_BEARER_CONTEXT_ACTIVATED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_SEMANTICALLY_INCORRECT_MESSAGE"])
  {
    int v4 = 95;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_INVALID_MANDATORY_INFORMATION"])
  {
    int v4 = 96;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_MESSAGE_TYPE_NON_EXISTENT_OR_NOT_IMPLEMENTED"])
  {
    int v4 = 97;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_MESSAGE_TYPE_NOT_COMPATIBLE_WITH_PROTOCOL_STATE"])
  {
    int v4 = 98;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_IE_NON_EXISTENT_OR_NOT_IMPLEMENTED"])
  {
    int v4 = 99;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_CONDITIONAL_IE_ERROR"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_MESSAGE_NOT_COMPATIBLE_WITH_PROTOCOL_STATE"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"EMM_CAUSE_PROTOCOL_ERROR_UNSPECIFIED"])
  {
    int v4 = 111;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)regProc
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_regProc;
  }
  else {
    return 0;
  }
}

- (void)setRegProc:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_regProc = a3;
}

- (void)setHasRegProc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRegProc
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)regProcAsString:(int)a3
{
  if (a3 >= 8)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_1002873C0 + a3);
  }

  return v3;
}

- (int)StringAsRegProc:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EMM_PROC_NO_PROC"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EMM_PROC_ATTACH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EMM_PROC_ATTACH_COMB"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EMM_PROC_EMERGENCY_ATTACH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EMM_PROC_TAU"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EMM_PROC_TAU_COMB"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"EMM_PROC_PERIODIC_TAU"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"EMM_PROC_SERV_REQ"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setT3412DurS:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_t3412DurS = a3;
}

- (void)setHasT3412DurS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasT3412DurS
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIsImsVoiceSupported:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isImsVoiceSupported = a3;
}

- (void)setHasIsImsVoiceSupported:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsImsVoiceSupported
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsEmergBearerSupported:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isEmergBearerSupported = a3;
}

- (void)setHasIsEmergBearerSupported:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsEmergBearerSupported
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
  v7.super_class = (Class)KCellularEmmContext;
  __int16 v3 = [(KCellularEmmContext *)&v7 description];
  int v4 = [(KCellularEmmContext *)self dictionaryRepresentation];
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
        goto LABEL_4;
      }
      goto LABEL_24;
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

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_32;
    }
    goto LABEL_28;
  }
LABEL_24:
  uint64_t updateStatus = self->_updateStatus;
  if (updateStatus >= 3)
  {
    v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_updateStatus];
  }
  else
  {
    v9 = *(&off_100287388 + updateStatus);
  }
  [v3 setObject:v9 forKey:@"update_status"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_28:
    uint64_t ueOpMode = self->_ueOpMode;
    if (ueOpMode >= 4)
    {
      v11 = +[NSString stringWithFormat:@"(unknown: %i)", self->_ueOpMode];
    }
    else
    {
      v11 = *(&off_1002873A0 + ueOpMode);
    }
    [v3 setObject:v11 forKey:@"ue_op_mode"];
  }
LABEL_32:
  if ([(NSMutableArray *)self->_taiLists count])
  {
    id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_taiLists, "count")];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v13 = self->_taiLists;
    id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"tai_list"];
  }
  guti = self->_guti;
  if (guti)
  {
    v20 = [(Guti *)guti dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"guti"];
  }
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 8) != 0)
  {
    int rejectCause = self->_rejectCause;
    v25 = @"EMM_CAUSE_NO_CAUSE";
    switch(rejectCause)
    {
      case 0:
        break;
      case 1:
      case 4:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 36:
      case 37:
      case 38:
LABEL_90:
        v25 = +[NSString stringWithFormat:@"(unknown: %i)", self->_rejectCause];
        break;
      case 2:
        v25 = @"EMM_CAUSE_IMSI_UNKNOWN_IN_HSS";
        break;
      case 3:
        v25 = @"EMM_CAUSE_ILLEGAL_UE";
        break;
      case 5:
        v25 = @"EMM_CAUSE_IMEI_NOT_ACCEPTED";
        break;
      case 6:
        v25 = @"EMM_CAUSE_ILLEGAL_ME";
        break;
      case 7:
        v25 = @"EMM_CAUSE_EPS_SERVICES_NOT_ALLOWED";
        break;
      case 8:
        v25 = @"EMM_CAUSE_EPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED";
        break;
      case 9:
        v25 = @"EMM_CAUSE_UE_IDENTITY_CANNOT_BE_DERIVED_BY_NETWORK";
        break;
      case 10:
        v25 = @"EMM_CAUSE_IMPLICITLY_DETACHED";
        break;
      case 11:
        v25 = @"EMM_CAUSE_PLMN_NOT_ALLOWED";
        break;
      case 12:
        v25 = @"EMM_CAUSE_TRACKING_AREA_NOT_ALLOWED";
        break;
      case 13:
        v25 = @"EMM_CAUSE_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA";
        break;
      case 14:
        v25 = @"EMM_CAUSE_EPS_SERVICES_NOT_ALLOWED_IN_THIS_PLMN";
        break;
      case 15:
        v25 = @"EMM_CAUSE_NO_SUITABLE_CELLS_IN_TRACKING_AREA";
        break;
      case 16:
        v25 = @"EMM_CAUSE_MSC_TEMPORARILY_NOT_REACHABLE";
        break;
      case 17:
        v25 = @"EMM_CAUSE_NETWORK_FAILURE";
        break;
      case 18:
        v25 = @"EMM_CAUSE_CS_DOMAIN_NOT_AVAILABLE";
        break;
      case 19:
        v25 = @"EMM_CAUSE_ESM_FAILURE";
        break;
      case 20:
        v25 = @"EMM_CAUSE_MAC_FAILURE";
        break;
      case 21:
        v25 = @"EMM_CAUSE_SYNCH_FAILURE";
        break;
      case 22:
        v25 = @"EMM_CAUSE_CONGESTION";
        break;
      case 23:
        v25 = @"EMM_CAUSE_UE_SECURITY_CAPABILITY_MISMATCH";
        break;
      case 24:
        v25 = @"EMM_CAUSE_SECURITY_MODE_REJECTED_UNSPECIFIED";
        break;
      case 25:
        v25 = @"EMM_CAUSE_NOT_AUTHORIZED_FOR_THIS_CSG";
        break;
      case 26:
        v25 = @"EMM_CAUSE_NON_EPS_AUTHENTICATION_UNACCEPTABLE";
        break;
      case 35:
        v25 = @"EMM_CAUSE_REQUESTED_SERVICE_OPTION_NOT_AUTHORIZED_IN_THIS_PLMN";
        break;
      case 39:
        v25 = @"EMM_CAUSE_CS_DOMAIN_TEMPORARILY_NOT_AVAILABLE";
        break;
      case 40:
        v25 = @"EMM_CAUSE_NO_EPS_BEARER_CONTEXT_ACTIVATED";
        break;
      default:
        switch(rejectCause)
        {
          case '_':
            v25 = @"EMM_CAUSE_SEMANTICALLY_INCORRECT_MESSAGE";
            break;
            v25 = @"EMM_CAUSE_INVALID_MANDATORY_INFORMATION";
            break;
          case 'a':
            v25 = @"EMM_CAUSE_MESSAGE_TYPE_NON_EXISTENT_OR_NOT_IMPLEMENTED";
            break;
          case 'b':
            v25 = @"EMM_CAUSE_MESSAGE_TYPE_NOT_COMPATIBLE_WITH_PROTOCOL_STATE";
            break;
          case 'c':
            v25 = @"EMM_CAUSE_IE_NON_EXISTENT_OR_NOT_IMPLEMENTED";
            break;
          case 'd':
            v25 = @"EMM_CAUSE_CONDITIONAL_IE_ERROR";
            break;
          case 'e':
            v25 = @"EMM_CAUSE_MESSAGE_NOT_COMPATIBLE_WITH_PROTOCOL_STATE";
            break;
          case 'o':
            v25 = @"EMM_CAUSE_PROTOCOL_ERROR_UNSPECIFIED";
            break;
          default:
            goto LABEL_90;
        }
        break;
    }
    [v3 setObject:v25 forKey:@"reject_cause"];

    __int16 v21 = (__int16)self->_has;
    if ((v21 & 2) == 0)
    {
LABEL_45:
      if ((v21 & 0x20) == 0) {
        goto LABEL_46;
      }
      goto LABEL_96;
    }
  }
  else if ((v21 & 2) == 0)
  {
    goto LABEL_45;
  }
  uint64_t regProc = self->_regProc;
  if (regProc >= 8)
  {
    v27 = +[NSString stringWithFormat:@"(unknown: %i)", self->_regProc];
  }
  else
  {
    v27 = *(&off_1002873C0 + regProc);
  }
  [v3 setObject:v27 forKey:@"reg_proc"];

  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x20) == 0)
  {
LABEL_46:
    if ((v21 & 0x200) == 0) {
      goto LABEL_47;
    }
    goto LABEL_97;
  }
LABEL_96:
  v28 = +[NSNumber numberWithUnsignedInt:self->_t3412DurS];
  [v3 setObject:v28 forKey:@"t3412_dur_s"];

  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x200) == 0)
  {
LABEL_47:
    if ((v21 & 0x100) == 0) {
      goto LABEL_48;
    }
    goto LABEL_98;
  }
LABEL_97:
  v29 = +[NSNumber numberWithBool:self->_isImsVoiceSupported];
  [v3 setObject:v29 forKey:@"is_ims_voice_supported"];

  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x100) == 0)
  {
LABEL_48:
    if ((v21 & 0x10) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_98:
  v30 = +[NSNumber numberWithBool:self->_isEmergBearerSupported];
  [v3 setObject:v30 forKey:@"is_emerg_bearer_supported"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_49:
    v22 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v22 forKey:@"subs_id"];
  }
LABEL_50:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100065B78((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_taiLists;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (self->_guti) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_17:
      if ((v11 & 0x20) == 0) {
        goto LABEL_18;
      }
      goto LABEL_29;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x20) == 0)
  {
LABEL_18:
    if ((v11 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x200) == 0)
  {
LABEL_19:
    if ((v11 & 0x100) == 0) {
      goto LABEL_20;
    }
LABEL_31:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x100) != 0) {
    goto LABEL_31;
  }
LABEL_20:
  if ((v11 & 0x10) != 0) {
LABEL_21:
  }
    PBDataWriterWriteUint32Field();
LABEL_22:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 34) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
LABEL_24:
      *((_DWORD *)v4 + 15) = self->_updateStatus;
      *((_WORD *)v4 + 34) |= 0x80u;
      if ((*(_WORD *)&self->_has & 0x40) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_regStatus;
  *((_WORD *)v4 + 34) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0) {
    goto LABEL_24;
  }
LABEL_4:
  if ((has & 0x40) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 14) = self->_ueOpMode;
    *((_WORD *)v4 + 34) |= 0x40u;
  }
LABEL_6:
  id v11 = v4;
  if ([(KCellularEmmContext *)self taiListsCount])
  {
    [v11 clearTaiLists];
    unint64_t v6 = [(KCellularEmmContext *)self taiListsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(KCellularEmmContext *)self taiListAtIndex:i];
        [v11 addTaiList:v9];
      }
    }
  }
  if (self->_guti) {
    [v11 setGuti:];
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    *((_DWORD *)v11 + 8) = self->_rejectCause;
    *((_WORD *)v11 + 34) |= 8u;
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_14:
      if ((v10 & 0x20) == 0) {
        goto LABEL_15;
      }
      goto LABEL_28;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_14;
  }
  *((_DWORD *)v11 + 6) = self->_regProc;
  *((_WORD *)v11 + 34) |= 2u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_15:
    if ((v10 & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v11 + 10) = self->_t3412DurS;
  *((_WORD *)v11 + 34) |= 0x20u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x200) == 0)
  {
LABEL_16:
    if ((v10 & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((unsigned char *)v11 + 65) = self->_isImsVoiceSupported;
  *((_WORD *)v11 + 34) |= 0x200u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_17:
    if ((v10 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_30:
  *((unsigned char *)v11 + 64) = self->_isEmergBearerSupported;
  *((_WORD *)v11 + 34) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_18:
    *((_DWORD *)v11 + 9) = self->_subsId;
    *((_WORD *)v11 + 34) |= 0x10u;
  }
LABEL_19:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 34) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 7) = self->_regStatus;
  *((_WORD *)v5 + 34) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_23:
  *((_DWORD *)v5 + 15) = self->_updateStatus;
  *((_WORD *)v5 + 34) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 14) = self->_ueOpMode;
    *((_WORD *)v5 + 34) |= 0x40u;
  }
LABEL_6:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = self->_taiLists;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) copyWithZone:a3];
        [v6 addTaiList:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v14 = [(Guti *)self->_guti copyWithZone:a3];
  long long v15 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v14;

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 8) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_rejectCause;
    *((_WORD *)v6 + 34) |= 8u;
    __int16 v16 = (__int16)self->_has;
    if ((v16 & 2) == 0)
    {
LABEL_15:
      if ((v16 & 0x20) == 0) {
        goto LABEL_16;
      }
      goto LABEL_27;
    }
  }
  else if ((v16 & 2) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v6 + 6) = self->_regProc;
  *((_WORD *)v6 + 34) |= 2u;
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x20) == 0)
  {
LABEL_16:
    if ((v16 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v6 + 10) = self->_t3412DurS;
  *((_WORD *)v6 + 34) |= 0x20u;
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x200) == 0)
  {
LABEL_17:
    if ((v16 & 0x100) == 0) {
      goto LABEL_18;
    }
LABEL_29:
    *((unsigned char *)v6 + 64) = self->_isEmergBearerSupported;
    *((_WORD *)v6 + 34) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      return v6;
    }
    goto LABEL_19;
  }
LABEL_28:
  *((unsigned char *)v6 + 65) = self->_isImsVoiceSupported;
  *((_WORD *)v6 + 34) |= 0x200u;
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x100) != 0) {
    goto LABEL_29;
  }
LABEL_18:
  if ((v16 & 0x10) != 0)
  {
LABEL_19:
    *((_DWORD *)v6 + 9) = self->_subsId;
    *((_WORD *)v6 + 34) |= 0x10u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_62;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 34);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_62;
    }
  }
  else if (v6)
  {
    goto LABEL_62;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_regStatus != *((_DWORD *)v4 + 7)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_updateStatus != *((_DWORD *)v4 + 15)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_ueOpMode != *((_DWORD *)v4 + 14)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_62;
  }
  taiLists = self->_taiLists;
  if ((unint64_t)taiLists | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](taiLists, "isEqual:"))
  {
    goto LABEL_62;
  }
  gutuint64_t i = self->_guti;
  if ((unint64_t)guti | *((void *)v4 + 2))
  {
    if (!-[Guti isEqual:](guti, "isEqual:")) {
      goto LABEL_62;
    }
  }
  __int16 v9 = (__int16)self->_has;
  __int16 v10 = *((_WORD *)v4 + 34);
  if ((v9 & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_rejectCause != *((_DWORD *)v4 + 8)) {
      goto LABEL_62;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_62;
  }
  if ((v9 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_regProc != *((_DWORD *)v4 + 6)) {
      goto LABEL_62;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((v9 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_t3412DurS != *((_DWORD *)v4 + 10)) {
      goto LABEL_62;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x200) == 0) {
      goto LABEL_62;
    }
    if (self->_isImsVoiceSupported)
    {
      if (!*((unsigned char *)v4 + 65)) {
        goto LABEL_62;
      }
    }
    else if (*((unsigned char *)v4 + 65))
    {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x200) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x100) != 0)
    {
      if (self->_isEmergBearerSupported)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_62;
        }
        goto LABEL_57;
      }
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_57;
      }
    }
LABEL_62:
    BOOL v11 = 0;
    goto LABEL_63;
  }
  if ((*((_WORD *)v4 + 34) & 0x100) != 0) {
    goto LABEL_62;
  }
LABEL_57:
  if ((v9 & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_subsId != *((_DWORD *)v4 + 9)) {
      goto LABEL_62;
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = (v10 & 0x10) == 0;
  }
LABEL_63:

  return v11;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((has & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_regStatus;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((has & 0x40) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_updateStatus;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_ueOpMode;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v7 = 0;
LABEL_10:
  unint64_t v8 = (unint64_t)[(NSMutableArray *)self->_taiLists hash];
  unint64_t v9 = [(Guti *)self->_guti hash];
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    uint64_t v11 = 2654435761 * self->_rejectCause;
    if ((v10 & 2) != 0)
    {
LABEL_12:
      uint64_t v12 = 2654435761 * self->_regProc;
      if ((v10 & 0x20) != 0) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((v10 & 2) != 0) {
      goto LABEL_12;
    }
  }
  uint64_t v12 = 0;
  if ((v10 & 0x20) != 0)
  {
LABEL_13:
    uint64_t v13 = 2654435761 * self->_t3412DurS;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_14;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_14:
    uint64_t v14 = 2654435761 * self->_isImsVoiceSupported;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_15;
    }
LABEL_21:
    uint64_t v15 = 0;
    if ((v10 & 0x10) != 0) {
      goto LABEL_16;
    }
LABEL_22:
    uint64_t v16 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_20:
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_21;
  }
LABEL_15:
  uint64_t v15 = 2654435761 * self->_isEmergBearerSupported;
  if ((v10 & 0x10) == 0) {
    goto LABEL_22;
  }
LABEL_16:
  uint64_t v16 = 2654435761 * self->_subsId;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 34);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 34);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_int regStatus = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  __int16 v6 = *((_WORD *)v4 + 34);
  if ((v6 & 0x80) == 0)
  {
LABEL_4:
    if ((v6 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  self->_uint64_t updateStatus = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 34) & 0x40) != 0)
  {
LABEL_5:
    self->_uint64_t ueOpMode = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_6:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *((id *)v4 + 6);
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        -[KCellularEmmContext addTaiList:](self, "addTaiList:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  gutuint64_t i = self->_guti;
  uint64_t v13 = *((void *)v5 + 2);
  if (guti)
  {
    if (v13) {
      -[Guti mergeFrom:](guti, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[KCellularEmmContext setGuti:](self, "setGuti:");
  }
  __int16 v14 = *((_WORD *)v5 + 34);
  if ((v14 & 8) != 0)
  {
    self->_int rejectCause = *((_DWORD *)v5 + 8);
    *(_WORD *)&self->_has |= 8u;
    __int16 v14 = *((_WORD *)v5 + 34);
    if ((v14 & 2) == 0)
    {
LABEL_24:
      if ((v14 & 0x20) == 0) {
        goto LABEL_25;
      }
      goto LABEL_32;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_24;
  }
  self->_uint64_t regProc = *((_DWORD *)v5 + 6);
  *(_WORD *)&self->_has |= 2u;
  __int16 v14 = *((_WORD *)v5 + 34);
  if ((v14 & 0x20) == 0)
  {
LABEL_25:
    if ((v14 & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_t3412DurS = *((_DWORD *)v5 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v14 = *((_WORD *)v5 + 34);
  if ((v14 & 0x200) == 0)
  {
LABEL_26:
    if ((v14 & 0x100) == 0) {
      goto LABEL_27;
    }
LABEL_34:
    self->_isEmergBearerSupported = *((unsigned char *)v5 + 64);
    *(_WORD *)&self->_has |= 0x100u;
    if ((*((_WORD *)v5 + 34) & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_33:
  self->_isImsVoiceSupported = *((unsigned char *)v5 + 65);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v14 = *((_WORD *)v5 + 34);
  if ((v14 & 0x100) != 0) {
    goto LABEL_34;
  }
LABEL_27:
  if ((v14 & 0x10) != 0)
  {
LABEL_28:
    self->_subsId = *((_DWORD *)v5 + 9);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_29:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)taiLists
{
  return self->_taiLists;
}

- (void)setTaiLists:(id)a3
{
}

- (Guti)guti
{
  return self->_guti;
}

- (void)setGuti:(id)a3
{
}

- (unsigned)t3412DurS
{
  return self->_t3412DurS;
}

- (BOOL)isImsVoiceSupported
{
  return self->_isImsVoiceSupported;
}

- (BOOL)isEmergBearerSupported
{
  return self->_isEmergBearerSupported;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taiLists, 0);

  objc_storeStrong((id *)&self->_guti, 0);
}

@end