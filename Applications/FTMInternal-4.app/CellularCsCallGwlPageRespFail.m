@interface CellularCsCallGwlPageRespFail
- (BOOL)csfbIsLacMismatch;
- (BOOL)hasAttemptArfcn;
- (BOOL)hasAttemptCellId;
- (BOOL)hasAttemptLac;
- (BOOL)hasCause;
- (BOOL)hasCsfbAbnormalCause;
- (BOOL)hasCsfbFailureEmmCause;
- (BOOL)hasCsfbFailureLocalCause;
- (BOOL)hasCsfbFailureType;
- (BOOL)hasCsfbIsLacMismatch;
- (BOOL)hasIsAttemptBandPcs;
- (BOOL)hasIsImsiPage;
- (BOOL)hasIsRedirHighBandPcs;
- (BOOL)hasLteCellId;
- (BOOL)hasLteRegLac;
- (BOOL)hasNumRedirFreq;
- (BOOL)hasPageRat;
- (BOOL)hasTac;
- (BOOL)hasTimestamp;
- (BOOL)hasVersion;
- (BOOL)isAttemptBandPcs;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRedirHighBandPcs;
- (BOOL)readFrom:(id)a3;
- (id)causeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)csfbFailureEmmCauseAsString:(int)a3;
- (id)csfbFailureLocalCauseAsString:(int)a3;
- (id)csfbFailureTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pageRatAsString:(int)a3;
- (int)StringAsCause:(id)a3;
- (int)StringAsCsfbFailureEmmCause:(id)a3;
- (int)StringAsCsfbFailureLocalCause:(id)a3;
- (int)StringAsCsfbFailureType:(id)a3;
- (int)StringAsPageRat:(id)a3;
- (int)cause;
- (int)csfbFailureEmmCause;
- (int)csfbFailureLocalCause;
- (int)csfbFailureType;
- (int)pageRat;
- (unint64_t)hash;
- (unint64_t)redirArfcnsCount;
- (unint64_t)timestamp;
- (unsigned)attemptArfcn;
- (unsigned)attemptCellId;
- (unsigned)attemptLac;
- (unsigned)csfbAbnormalCause;
- (unsigned)isImsiPage;
- (unsigned)lteCellId;
- (unsigned)lteRegLac;
- (unsigned)numRedirFreq;
- (unsigned)redirArfcnAtIndex:(unint64_t)a3;
- (unsigned)redirArfcns;
- (unsigned)tac;
- (unsigned)version;
- (void)addRedirArfcn:(unsigned int)a3;
- (void)clearRedirArfcns;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAttemptArfcn:(unsigned int)a3;
- (void)setAttemptCellId:(unsigned int)a3;
- (void)setAttemptLac:(unsigned int)a3;
- (void)setCause:(int)a3;
- (void)setCsfbAbnormalCause:(unsigned int)a3;
- (void)setCsfbFailureEmmCause:(int)a3;
- (void)setCsfbFailureLocalCause:(int)a3;
- (void)setCsfbFailureType:(int)a3;
- (void)setCsfbIsLacMismatch:(BOOL)a3;
- (void)setHasAttemptArfcn:(BOOL)a3;
- (void)setHasAttemptCellId:(BOOL)a3;
- (void)setHasAttemptLac:(BOOL)a3;
- (void)setHasCause:(BOOL)a3;
- (void)setHasCsfbAbnormalCause:(BOOL)a3;
- (void)setHasCsfbFailureEmmCause:(BOOL)a3;
- (void)setHasCsfbFailureLocalCause:(BOOL)a3;
- (void)setHasCsfbFailureType:(BOOL)a3;
- (void)setHasCsfbIsLacMismatch:(BOOL)a3;
- (void)setHasIsAttemptBandPcs:(BOOL)a3;
- (void)setHasIsImsiPage:(BOOL)a3;
- (void)setHasIsRedirHighBandPcs:(BOOL)a3;
- (void)setHasLteCellId:(BOOL)a3;
- (void)setHasLteRegLac:(BOOL)a3;
- (void)setHasNumRedirFreq:(BOOL)a3;
- (void)setHasPageRat:(BOOL)a3;
- (void)setHasTac:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIsAttemptBandPcs:(BOOL)a3;
- (void)setIsImsiPage:(unsigned int)a3;
- (void)setIsRedirHighBandPcs:(BOOL)a3;
- (void)setLteCellId:(unsigned int)a3;
- (void)setLteRegLac:(unsigned int)a3;
- (void)setNumRedirFreq:(unsigned int)a3;
- (void)setPageRat:(int)a3;
- (void)setRedirArfcns:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTac:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularCsCallGwlPageRespFail

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CellularCsCallGwlPageRespFail;
  [(CellularCsCallGwlPageRespFail *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasVersion
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (int)pageRat
{
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    return self->_pageRat;
  }
  else {
    return 0;
  }
}

- (void)setPageRat:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_pageRat = a3;
}

- (void)setHasPageRat:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPageRat
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)pageRatAsString:(int)a3
{
  if (a3 >= 3)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = off_100286E90[a3];
  }

  return v3;
}

- (int)StringAsPageRat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PAGE_RAT_GSM"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PAGE_RAT_WCDMA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAGE_RAT_LTE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)cause
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_cause;
  }
  else {
    return 0;
  }
}

- (void)setCause:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_cause = a3;
}

- (void)setHasCause:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCause
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)causeAsString:(int)a3
{
  if (a3 >= 9)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = off_100286EA8[a3];
  }

  return v3;
}

- (int)StringAsCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MT_PAGING_IGNORED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MT_RRC_CONN_EST_FAIL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MT_RRC_CONN_LOST"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MT_CS_DOMAIN_REL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MT_RR_REL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MT_CSFB_FAIL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MT_RR_REL_NW_REL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MT_CSFB_LOST_GSM"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MT_CSFB_PEND_REJ"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setIsImsiPage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_isImsiPage = a3;
}

- (void)setHasIsImsiPage:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasIsImsiPage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (int)csfbFailureType
{
  if (*((unsigned char *)&self->_has + 1)) {
    return self->_csfbFailureType;
  }
  else {
    return 0;
  }
}

- (void)setCsfbFailureType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_csfbFailureType = a3;
}

- (void)setHasCsfbFailureType:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCsfbFailureType
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (id)csfbFailureTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = off_100286EF0[a3];
  }

  return v3;
}

- (int)StringAsCsfbFailureType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"INVALID_REJECT_CAUSE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"OTA_REJECT_CAUSE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AS_REJECT_CAUSE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MM_REJECT_CAUSE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CNM_MN_REJECT_CAUSE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EMM_REJECT_CAUSE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ONEX_CSFB_REJECT_CAUSE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)csfbFailureEmmCause
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_csfbFailureEmmCause;
  }
  else {
    return 2;
  }
}

- (void)setCsfbFailureEmmCause:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_csfbFailureEmmCause = a3;
}

- (void)setHasCsfbFailureEmmCause:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCsfbFailureEmmCause
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)csfbFailureEmmCauseAsString:(int)a3
{
  int v4 = @"LTE_NAS_IMSI_UNKNOWN_IN_HSS";
  switch(a3)
  {
    case 2:
      goto LABEL_103;
    case 3:
      int v4 = @"LTE_NAS_ILLEGAL_UE";
      break;
    case 4:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
LABEL_102:
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_103:
      break;
    case 5:
      int v4 = @"LTE_NAS_IMEI_NOT_ACCEPTED";
      break;
    case 6:
      int v4 = @"LTE_NAS_ILLEGAL_ME";
      break;
    case 7:
      int v4 = @"LTE_NAS_EPS_SERVICES_NOT_ALLOWED";
      break;
    case 8:
      int v4 = @"LTE_NAS_EPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED";
      break;
    case 9:
      int v4 = @"LTE_NAS_UE_ID_CANNOT_BE_DERIVED_BY_NW";
      break;
    case 10:
      int v4 = @"LTE_NAS_IMPLICITLY_DETACHED";
      break;
    case 11:
      int v4 = @"LTE_NAS_PLMN_NOT_ALLOWED";
      break;
    case 12:
      int v4 = @"LTE_NAS_TRACKING_AREA_NOT_ALLOWED";
      break;
    case 13:
      int v4 = @"LTE_NAS_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA";
      break;
    case 14:
      int v4 = @"LTE_NAS_EPS_SERVICES_NOT_ALLOWED_IN_PLMN";
      break;
    case 15:
      int v4 = @"LTE_NAS_NO_SUITABLE_CELLS_IN_TRACKING_AREA";
      break;
    case 16:
      int v4 = @"LTE_NAS_MSC_TEMPORARILY_NOT_REACHABLE";
      break;
    case 17:
      int v4 = @"LTE_NAS_NW_FAILURE";
      break;
    case 18:
      int v4 = @"LTE_NAS_CS_DOMAIN_NOT_AVAILABLE";
      break;
    case 19:
      int v4 = @"LTE_NAS_ESM_FAILURE";
      break;
    case 20:
      int v4 = @"LTE_NAS_MAC_FAILURE";
      break;
    case 21:
      int v4 = @"LTE_NAS_SYNCH_FAILURE";
      break;
    case 22:
      int v4 = @"LTE_NAS_CONGESTION";
      break;
    case 23:
      int v4 = @"LTE_NAS_UE_SECURITY_CAPABILITIES_MISMATCH";
      break;
    case 24:
      int v4 = @"LTE_NAS_SECURITY_MODE_REJ_UNSPECIFIED";
      break;
    case 25:
      int v4 = @"LTE_NAS_NOT_AUTHORIZED_FOR_THIS_CSG";
      break;
    case 26:
      int v4 = @"LTE_NON_EPS_AUTH_UNACCEPTABLE";
      break;
    case 38:
      int v4 = @"LTE_NAS_CS_FALLBACK_CALL_EST_NOT_ALLOWED";
      break;
    case 39:
      int v4 = @"LTE_NAS_CS_DOMAIN_TEMP_NOT_AVAILABLE";
      break;
    case 40:
      int v4 = @"LTE_NAS_NO_EPS_BEARER_CONTEXT_ACTIVATED";
      break;
    default:
      switch(a3)
      {
        case '_':
          int v4 = @"LTE_NAS_SEMANTICALLY_INCORRECT_MSG";
          break;
          int v4 = @"LTE_NAS_INVALID_MANDATORY_INFO";
          break;
        case 'a':
          int v4 = @"LTE_NAS_NON_EXISTENT_MSG_TYPE";
          break;
        case 'b':
          int v4 = @"LTE_NAS_MSG_TYPE_INCOMPATIBLE_WITH_PROTOCOL_STATE";
          break;
        case 'c':
          int v4 = @"LTE_NAS_NON_EXISTANT_INFO";
          break;
        case 'd':
          int v4 = @"LTE_NAS_CONDITIONAL_IE_ERROR";
          break;
        case 'e':
          int v4 = @"LTE_NAS_MSG_INCOMPATIBLE_WITH_PROTOCOL_STATE";
          break;
        case 'o':
          int v4 = @"LTE_NAS_PROTOCOL_ERROR_UNSPECIFIED";
          break;
        case 'p':
          int v4 = @"LTE_NAS_NO_FAILURE";
          break;
        default:
          goto LABEL_102;
      }
      break;
  }
  return v4;
}

- (int)StringAsCsfbFailureEmmCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LTE_NAS_IMSI_UNKNOWN_IN_HSS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_ILLEGAL_UE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_IMEI_NOT_ACCEPTED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_ILLEGAL_ME"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_EPS_SERVICES_NOT_ALLOWED"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_EPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_UE_ID_CANNOT_BE_DERIVED_BY_NW"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_IMPLICITLY_DETACHED"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_PLMN_NOT_ALLOWED"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_TRACKING_AREA_NOT_ALLOWED"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_EPS_SERVICES_NOT_ALLOWED_IN_PLMN"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_NO_SUITABLE_CELLS_IN_TRACKING_AREA"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_MSC_TEMPORARILY_NOT_REACHABLE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_NW_FAILURE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_CS_DOMAIN_NOT_AVAILABLE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_ESM_FAILURE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_MAC_FAILURE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_SYNCH_FAILURE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_CONGESTION"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_UE_SECURITY_CAPABILITIES_MISMATCH"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_SECURITY_MODE_REJ_UNSPECIFIED"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_NOT_AUTHORIZED_FOR_THIS_CSG"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"LTE_NON_EPS_AUTH_UNACCEPTABLE"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_CS_FALLBACK_CALL_EST_NOT_ALLOWED"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_CS_DOMAIN_TEMP_NOT_AVAILABLE"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_NO_EPS_BEARER_CONTEXT_ACTIVATED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_SEMANTICALLY_INCORRECT_MSG"])
  {
    int v4 = 95;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_INVALID_MANDATORY_INFO"])
  {
    int v4 = 96;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_NON_EXISTENT_MSG_TYPE"])
  {
    int v4 = 97;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_MSG_TYPE_INCOMPATIBLE_WITH_PROTOCOL_STATE"])
  {
    int v4 = 98;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_NON_EXISTANT_INFO"])
  {
    int v4 = 99;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_CONDITIONAL_IE_ERROR"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_MSG_INCOMPATIBLE_WITH_PROTOCOL_STATE"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_PROTOCOL_ERROR_UNSPECIFIED"])
  {
    int v4 = 111;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_NO_FAILURE"])
  {
    int v4 = 112;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (int)csfbFailureLocalCause
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_csfbFailureLocalCause;
  }
  else {
    return 3;
  }
}

- (void)setCsfbFailureLocalCause:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_csfbFailureLocalCause = a3;
}

- (void)setHasCsfbFailureLocalCause:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCsfbFailureLocalCause
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)csfbFailureLocalCauseAsString:(int)a3
{
  if (a3 <= 42)
  {
    int v4 = @"LTE_NAS_ILLEGAL_UE_LOCAL";
    switch(a3)
    {
      case 3:
        goto LABEL_194;
      case 4:
      case 5:
      case 8:
      case 14:
      case 16:
      case 17:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
        goto LABEL_193;
      case 6:
        int v4 = @"LTE_NAS_ILLEGAL_ME_LOCAL";
        return v4;
      case 7:
        int v4 = @"LTE_NAS_EPS_SERVICES_NOT_ALLOWED_LOCAL";
        return v4;
      case 9:
        int v4 = @"LTE_NAS_UE_ID_CANNOT_BE_DERIVED_BY_NW_LOCAL";
        return v4;
      case 10:
        int v4 = @"LTE_NAS_IMPLICITLY_DETACHED_LOCAL";
        return v4;
      case 11:
        int v4 = @"LTE_NAS_PLMN_NOT_ALLOWED_LOCAL";
        return v4;
      case 12:
        int v4 = @"LTE_NAS_TRACKING_AREA_NOT_ALLOWED_LOCAL";
        return v4;
      case 13:
        int v4 = @"LTE_NAS_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA_LOCAL";
        return v4;
      case 15:
        int v4 = @"LTE_NAS_NO_SUITABLE_CELLS_IN_TRACKING_AREA_LOCAL";
        return v4;
      case 18:
        int v4 = @"LTE_NAS_CS_DOMAIN_NOT_AVAILABLE_LOCAL";
        return v4;
      case 25:
        int v4 = @"LTE_NAS_NOT_AUTHORIZED_FOR_THIS_CSG_LOCAL";
        return v4;
      default:
        if (a3 == 38)
        {
          int v4 = @"LTE_NAS_CS_FALLBACK_CALL_EST_NOT_ALLOWED_LOCAL";
        }
        else if (a3 == 39)
        {
          int v4 = @"LTE_NAS_CS_DOMAIN_TEMP_NOT_AVAILABLE_LOCAL";
        }
        else
        {
LABEL_193:
          int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_194:
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 256:
        int v4 = @"DRB_RELEASED_AT_RRC";
        break;
      case 257:
        int v4 = @"NAS_SIG_CONN_RELEASED";
        break;
      case 258:
        int v4 = @"EMM_DETACHED";
        break;
      case 259:
        int v4 = @"EMM_ATTACH_FAILED";
        break;
      case 260:
        int v4 = @"EMM_ATTACH_STARTED";
        break;
      case 261:
        int v4 = @"LTE_NAS_SERVICE_REQ_FAILED";
        break;
      case 262:
        int v4 = @"ESM_ACTIVE_DEDICATED_BEARER_REACTIVATED_BY_NW";
        break;
      case 263:
        int v4 = @"ESM_LOWER_LAYER_FAILURE";
        break;
      case 264:
        int v4 = @"ESM_SYNC_UP_WITH_NW";
        break;
      case 265:
        int v4 = @"ESM_NW_ACTIVATED_DED_BEARER_WITH_ID_OF_DEF_BEARER";
        break;
      case 266:
        int v4 = @"ESM_BAD_OTA_MESSAGE";
        break;
      case 267:
        int v4 = @"ESM_DS_REJECTED_THE_CALL";
        break;
      case 268:
        int v4 = @"ESM_CONTEXT_TRANSFERED_DUE_TO_IRAT";
        break;
      case 269:
        int v4 = @"DS_EXPLICIT_DEACT";
        break;
      case 270:
        int v4 = @"ESM_MSGR_FAILURE";
        break;
      case 271:
        int v4 = @"ESM_LOCAL_CUASE_NONE";
        break;
      case 272:
        int v4 = @"ESM_REJ_DUE_TO_CONNECTED_STATE";
        break;
      case 273:
        int v4 = @"LTE_NAS_SERVICE_REQ_FAILED_NO_THROTTLE";
        break;
      case 274:
        int v4 = @"ACL_FAILURE";
        break;
      case 275:
        int v4 = @"LTE_NAS_SERVICE_REQ_FAILED_DS_DISALLOW";
        break;
      case 276:
        int v4 = @"EMM_T3417_EXPIRED";
        break;
      case 277:
        int v4 = @"EMM_T3417_EXT_EXPIRED";
        break;
      case 278:
        int v4 = @"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_TXN";
        break;
      case 279:
        int v4 = @"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_HO";
        break;
      case 280:
        int v4 = @"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_CONN_REL";
        break;
      case 281:
        int v4 = @"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_RLF";
        break;
      case 282:
        int v4 = @"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_CTRL_NOT_CONN";
        break;
      case 283:
        int v4 = @"LTE_NAS_LRRC_CONN_EST_SUCCESS";
        break;
      case 284:
        int v4 = @"LTE_NAS_LRRC_CONN_EST_FAILURE";
        break;
      case 285:
        int v4 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_ABORTED";
        break;
      case 286:
        int v4 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_ACCESS_BARRED";
        break;
      case 287:
        int v4 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_CELL_RESEL";
        break;
      case 288:
        int v4 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_CONFIG_FAILURE";
        break;
      case 289:
        int v4 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_TIMER_EXPIRED";
        break;
      case 290:
        int v4 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_LINK_FAILURE";
        break;
      case 291:
        int v4 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_NOT_CAMPED";
        break;
      case 292:
        int v4 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_SI_FAILURE";
        break;
      case 293:
        int v4 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_CONN_REJECT";
        break;
      case 294:
        int v4 = @"LTE_NAS_LRRC_CONN_REL_NORMAL";
        break;
      case 295:
        int v4 = @"LTE_NAS_LRRC_CONN_REL_RLF";
        break;
      case 296:
        int v4 = @"LTE_NAS_LRRC_CONN_REL_CRE_FAILURE";
        break;
      case 297:
        int v4 = @"LTE_NAS_LRRC_CONN_REL_OOS_DURING_CRE";
        break;
      case 298:
        int v4 = @"LTE_NAS_LRRC_CONN_REL_ABORTED";
        break;
      case 299:
        int v4 = @"LTE_NAS_LRRC_CONN_REL_SIB_READ_ERROR";
        break;
      case 300:
        int v4 = @"LTE_NAS_LRRC_CONN_REL_ABORTED_IRAT_SUCCESS";
        break;
      case 301:
        int v4 = @"LTE_NAS_REJ_LRRC_RADIO_LINK_FAILURE";
        break;
      case 302:
        int v4 = @"LTE_NAS_SERVICE_REQ_FAILURE_LTE_NW_REJECT";
        break;
      case 303:
        int v4 = @"LTE_NAS_DETACH_WITH_REATTACH_LTE_NW_DETACH";
        break;
      case 304:
        int v4 = @"LTE_NAS_DETACH_WITH_OUT_REATTACH_LTE_NW_DETACH";
        break;
      case 305:
        int v4 = @"ESM_PROC_TIME_OUT";
        break;
      default:
        if (a3 != 43) {
          goto LABEL_193;
        }
        int v4 = @"LTE_NAS_ESM_UNKNOWN_EPS_BEARER_CONTEXT";
        break;
    }
  }
  return v4;
}

- (int)StringAsCsfbFailureLocalCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LTE_NAS_ILLEGAL_UE_LOCAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_ILLEGAL_ME_LOCAL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_EPS_SERVICES_NOT_ALLOWED_LOCAL"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_UE_ID_CANNOT_BE_DERIVED_BY_NW_LOCAL"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_IMPLICITLY_DETACHED_LOCAL"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_PLMN_NOT_ALLOWED_LOCAL"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_TRACKING_AREA_NOT_ALLOWED_LOCAL"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA_LOCAL"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_NO_SUITABLE_CELLS_IN_TRACKING_AREA_LOCAL"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_CS_DOMAIN_NOT_AVAILABLE_LOCAL"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_NOT_AUTHORIZED_FOR_THIS_CSG_LOCAL"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_CS_FALLBACK_CALL_EST_NOT_ALLOWED_LOCAL"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_CS_DOMAIN_TEMP_NOT_AVAILABLE_LOCAL"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_ESM_UNKNOWN_EPS_BEARER_CONTEXT"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"DRB_RELEASED_AT_RRC"])
  {
    int v4 = 256;
  }
  else if ([v3 isEqualToString:@"NAS_SIG_CONN_RELEASED"])
  {
    int v4 = 257;
  }
  else if ([v3 isEqualToString:@"EMM_DETACHED"])
  {
    int v4 = 258;
  }
  else if ([v3 isEqualToString:@"EMM_ATTACH_FAILED"])
  {
    int v4 = 259;
  }
  else if ([v3 isEqualToString:@"EMM_ATTACH_STARTED"])
  {
    int v4 = 260;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_SERVICE_REQ_FAILED"])
  {
    int v4 = 261;
  }
  else if ([v3 isEqualToString:@"ESM_ACTIVE_DEDICATED_BEARER_REACTIVATED_BY_NW"])
  {
    int v4 = 262;
  }
  else if ([v3 isEqualToString:@"ESM_LOWER_LAYER_FAILURE"])
  {
    int v4 = 263;
  }
  else if ([v3 isEqualToString:@"ESM_SYNC_UP_WITH_NW"])
  {
    int v4 = 264;
  }
  else if ([v3 isEqualToString:@"ESM_NW_ACTIVATED_DED_BEARER_WITH_ID_OF_DEF_BEARER"])
  {
    int v4 = 265;
  }
  else if ([v3 isEqualToString:@"ESM_BAD_OTA_MESSAGE"])
  {
    int v4 = 266;
  }
  else if ([v3 isEqualToString:@"ESM_DS_REJECTED_THE_CALL"])
  {
    int v4 = 267;
  }
  else if ([v3 isEqualToString:@"ESM_CONTEXT_TRANSFERED_DUE_TO_IRAT"])
  {
    int v4 = 268;
  }
  else if ([v3 isEqualToString:@"DS_EXPLICIT_DEACT"])
  {
    int v4 = 269;
  }
  else if ([v3 isEqualToString:@"ESM_MSGR_FAILURE"])
  {
    int v4 = 270;
  }
  else if ([v3 isEqualToString:@"ESM_LOCAL_CUASE_NONE"])
  {
    int v4 = 271;
  }
  else if ([v3 isEqualToString:@"ESM_REJ_DUE_TO_CONNECTED_STATE"])
  {
    int v4 = 272;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_SERVICE_REQ_FAILED_NO_THROTTLE"])
  {
    int v4 = 273;
  }
  else if ([v3 isEqualToString:@"ACL_FAILURE"])
  {
    int v4 = 274;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_SERVICE_REQ_FAILED_DS_DISALLOW"])
  {
    int v4 = 275;
  }
  else if ([v3 isEqualToString:@"EMM_T3417_EXPIRED"])
  {
    int v4 = 276;
  }
  else if ([v3 isEqualToString:@"EMM_T3417_EXT_EXPIRED"])
  {
    int v4 = 277;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_TXN"])
  {
    int v4 = 278;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_HO"])
  {
    int v4 = 279;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_CONN_REL"])
  {
    int v4 = 280;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_RLF"])
  {
    int v4 = 281;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_CTRL_NOT_CONN"])
  {
    int v4 = 282;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_EST_SUCCESS"])
  {
    int v4 = 283;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_EST_FAILURE"])
  {
    int v4 = 284;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_EST_FAILURE_ABORTED"])
  {
    int v4 = 285;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_EST_FAILURE_ACCESS_BARRED"])
  {
    int v4 = 286;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_EST_FAILURE_CELL_RESEL"])
  {
    int v4 = 287;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_EST_FAILURE_CONFIG_FAILURE"])
  {
    int v4 = 288;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_EST_FAILURE_TIMER_EXPIRED"])
  {
    int v4 = 289;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_EST_FAILURE_LINK_FAILURE"])
  {
    int v4 = 290;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_EST_FAILURE_NOT_CAMPED"])
  {
    int v4 = 291;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_EST_FAILURE_SI_FAILURE"])
  {
    int v4 = 292;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_EST_FAILURE_CONN_REJECT"])
  {
    int v4 = 293;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_REL_NORMAL"])
  {
    int v4 = 294;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_REL_RLF"])
  {
    int v4 = 295;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_REL_CRE_FAILURE"])
  {
    int v4 = 296;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_REL_OOS_DURING_CRE"])
  {
    int v4 = 297;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_REL_ABORTED"])
  {
    int v4 = 298;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_REL_SIB_READ_ERROR"])
  {
    int v4 = 299;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_LRRC_CONN_REL_ABORTED_IRAT_SUCCESS"])
  {
    int v4 = 300;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_REJ_LRRC_RADIO_LINK_FAILURE"])
  {
    int v4 = 301;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_SERVICE_REQ_FAILURE_LTE_NW_REJECT"])
  {
    int v4 = 302;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_DETACH_WITH_REATTACH_LTE_NW_DETACH"])
  {
    int v4 = 303;
  }
  else if ([v3 isEqualToString:@"LTE_NAS_DETACH_WITH_OUT_REATTACH_LTE_NW_DETACH"])
  {
    int v4 = 304;
  }
  else if ([v3 isEqualToString:@"ESM_PROC_TIME_OUT"])
  {
    int v4 = 305;
  }
  else
  {
    int v4 = 3;
  }

  return v4;
}

- (void)setCsfbIsLacMismatch:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_csfbIsLacMismatch = a3;
}

- (void)setHasCsfbIsLacMismatch:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasCsfbIsLacMismatch
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setCsfbAbnormalCause:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_csfbAbnormalCause = a3;
}

- (void)setHasCsfbAbnormalCause:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCsfbAbnormalCause
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setLteRegLac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_lteRegLac = a3;
}

- (void)setHasLteRegLac:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasLteRegLac
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_tac = a3;
}

- (void)setHasTac:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTac
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setLteCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_lteCellId = a3;
}

- (void)setHasLteCellId:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLteCellId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAttemptArfcn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_attemptArfcn = a3;
}

- (void)setHasAttemptArfcn:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAttemptArfcn
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsAttemptBandPcs:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isAttemptBandPcs = a3;
}

- (void)setHasIsAttemptBandPcs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsAttemptBandPcs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setAttemptLac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_attemptLac = a3;
}

- (void)setHasAttemptLac:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAttemptLac
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAttemptCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_attemptCellId = a3;
}

- (void)setHasAttemptCellId:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAttemptCellId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumRedirFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_numRedirFreq = a3;
}

- (void)setHasNumRedirFreq:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNumRedirFreq
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setIsRedirHighBandPcs:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isRedirHighBandPcs = a3;
}

- (void)setHasIsRedirHighBandPcs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9871CD01E7CDACA26BC14801762D3127)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsRedirHighBandPcs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (unint64_t)redirArfcnsCount
{
  return self->_redirArfcns.count;
}

- (unsigned)redirArfcns
{
  return self->_redirArfcns.list;
}

- (void)clearRedirArfcns
{
}

- (void)addRedirArfcn:(unsigned int)a3
{
}

- (unsigned)redirArfcnAtIndex:(unint64_t)a3
{
  p_redirArfcns = &self->_redirArfcns;
  unint64_t count = self->_redirArfcns.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_redirArfcns->list[a3];
}

- (void)setRedirArfcns:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularCsCallGwlPageRespFail;
  int v3 = [(CellularCsCallGwlPageRespFail *)&v7 description];
  int v4 = [(CellularCsCallGwlPageRespFail *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v9 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v9 forKey:@"timestamp"];

    $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  v10 = +[NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v10 forKey:@"version"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_24:
  uint64_t pageRat = self->_pageRat;
  if (pageRat >= 3)
  {
    v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_pageRat];
  }
  else
  {
    v12 = off_100286E90[pageRat];
  }
  [v3 setObject:v12 forKey:@"page_rat"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_28:
  uint64_t cause = self->_cause;
  if (cause >= 9)
  {
    v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_cause];
  }
  else
  {
    v14 = off_100286EA8[cause];
  }
  [v3 setObject:v14 forKey:@"cause"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  v15 = +[NSNumber numberWithUnsignedInt:self->_isImsiPage];
  [v3 setObject:v15 forKey:@"is_imsi_page"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_37;
  }
LABEL_33:
  uint64_t csfbFailureType = self->_csfbFailureType;
  if (csfbFailureType >= 7)
  {
    v17 = +[NSString stringWithFormat:@"(unknown: %i)", self->_csfbFailureType];
  }
  else
  {
    v17 = off_100286EF0[csfbFailureType];
  }
  [v3 setObject:v17 forKey:@"csfb_failure_type"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_76;
  }
LABEL_37:
  int csfbFailureEmmCause = self->_csfbFailureEmmCause;
  v19 = @"LTE_NAS_IMSI_UNKNOWN_IN_HSS";
  switch(csfbFailureEmmCause)
  {
    case 2:
      break;
    case 3:
      v19 = @"LTE_NAS_ILLEGAL_UE";
      break;
    case 4:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
LABEL_72:
      v19 = +[NSString stringWithFormat:@"(unknown: %i)", self->_csfbFailureEmmCause];
      break;
    case 5:
      v19 = @"LTE_NAS_IMEI_NOT_ACCEPTED";
      break;
    case 6:
      v19 = @"LTE_NAS_ILLEGAL_ME";
      break;
    case 7:
      v19 = @"LTE_NAS_EPS_SERVICES_NOT_ALLOWED";
      break;
    case 8:
      v19 = @"LTE_NAS_EPS_SERVICES_AND_NON_EPS_SERVICES_NOT_ALLOWED";
      break;
    case 9:
      v19 = @"LTE_NAS_UE_ID_CANNOT_BE_DERIVED_BY_NW";
      break;
    case 10:
      v19 = @"LTE_NAS_IMPLICITLY_DETACHED";
      break;
    case 11:
      v19 = @"LTE_NAS_PLMN_NOT_ALLOWED";
      break;
    case 12:
      v19 = @"LTE_NAS_TRACKING_AREA_NOT_ALLOWED";
      break;
    case 13:
      v19 = @"LTE_NAS_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA";
      break;
    case 14:
      v19 = @"LTE_NAS_EPS_SERVICES_NOT_ALLOWED_IN_PLMN";
      break;
    case 15:
      v19 = @"LTE_NAS_NO_SUITABLE_CELLS_IN_TRACKING_AREA";
      break;
    case 16:
      v19 = @"LTE_NAS_MSC_TEMPORARILY_NOT_REACHABLE";
      break;
    case 17:
      v19 = @"LTE_NAS_NW_FAILURE";
      break;
    case 18:
      v19 = @"LTE_NAS_CS_DOMAIN_NOT_AVAILABLE";
      break;
    case 19:
      v19 = @"LTE_NAS_ESM_FAILURE";
      break;
    case 20:
      v19 = @"LTE_NAS_MAC_FAILURE";
      break;
    case 21:
      v19 = @"LTE_NAS_SYNCH_FAILURE";
      break;
    case 22:
      v19 = @"LTE_NAS_CONGESTION";
      break;
    case 23:
      v19 = @"LTE_NAS_UE_SECURITY_CAPABILITIES_MISMATCH";
      break;
    case 24:
      v19 = @"LTE_NAS_SECURITY_MODE_REJ_UNSPECIFIED";
      break;
    case 25:
      v19 = @"LTE_NAS_NOT_AUTHORIZED_FOR_THIS_CSG";
      break;
    case 26:
      v19 = @"LTE_NON_EPS_AUTH_UNACCEPTABLE";
      break;
    case 38:
      v19 = @"LTE_NAS_CS_FALLBACK_CALL_EST_NOT_ALLOWED";
      break;
    case 39:
      v19 = @"LTE_NAS_CS_DOMAIN_TEMP_NOT_AVAILABLE";
      break;
    case 40:
      v19 = @"LTE_NAS_NO_EPS_BEARER_CONTEXT_ACTIVATED";
      break;
    default:
      switch(csfbFailureEmmCause)
      {
        case '_':
          v19 = @"LTE_NAS_SEMANTICALLY_INCORRECT_MSG";
          break;
          v19 = @"LTE_NAS_INVALID_MANDATORY_INFO";
          break;
        case 'a':
          v19 = @"LTE_NAS_NON_EXISTENT_MSG_TYPE";
          break;
        case 'b':
          v19 = @"LTE_NAS_MSG_TYPE_INCOMPATIBLE_WITH_PROTOCOL_STATE";
          break;
        case 'c':
          v19 = @"LTE_NAS_NON_EXISTANT_INFO";
          break;
        case 'd':
          v19 = @"LTE_NAS_CONDITIONAL_IE_ERROR";
          break;
        case 'e':
          v19 = @"LTE_NAS_MSG_INCOMPATIBLE_WITH_PROTOCOL_STATE";
          break;
        case 'o':
          v19 = @"LTE_NAS_PROTOCOL_ERROR_UNSPECIFIED";
          break;
        case 'p':
          v19 = @"LTE_NAS_NO_FAILURE";
          break;
        default:
          goto LABEL_72;
      }
      break;
  }
  [v3 setObject:v19 forKey:@"csfb_failure_emm_cause"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_147;
  }
LABEL_76:
  int csfbFailureLocalCause = self->_csfbFailureLocalCause;
  if (csfbFailureLocalCause <= 42)
  {
    v21 = @"LTE_NAS_ILLEGAL_UE_LOCAL";
    switch(csfbFailureLocalCause)
    {
      case 3:
        break;
      case 4:
      case 5:
      case 8:
      case 14:
      case 16:
      case 17:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
        goto LABEL_145;
      case 6:
        v21 = @"LTE_NAS_ILLEGAL_ME_LOCAL";
        break;
      case 7:
        v21 = @"LTE_NAS_EPS_SERVICES_NOT_ALLOWED_LOCAL";
        break;
      case 9:
        v21 = @"LTE_NAS_UE_ID_CANNOT_BE_DERIVED_BY_NW_LOCAL";
        break;
      case 10:
        v21 = @"LTE_NAS_IMPLICITLY_DETACHED_LOCAL";
        break;
      case 11:
        v21 = @"LTE_NAS_PLMN_NOT_ALLOWED_LOCAL";
        break;
      case 12:
        v21 = @"LTE_NAS_TRACKING_AREA_NOT_ALLOWED_LOCAL";
        break;
      case 13:
        v21 = @"LTE_NAS_ROAMING_NOT_ALLOWED_IN_THIS_TRACKING_AREA_LOCAL";
        break;
      case 15:
        v21 = @"LTE_NAS_NO_SUITABLE_CELLS_IN_TRACKING_AREA_LOCAL";
        break;
      case 18:
        v21 = @"LTE_NAS_CS_DOMAIN_NOT_AVAILABLE_LOCAL";
        break;
      case 25:
        v21 = @"LTE_NAS_NOT_AUTHORIZED_FOR_THIS_CSG_LOCAL";
        break;
      default:
        if (csfbFailureLocalCause == 38)
        {
          v21 = @"LTE_NAS_CS_FALLBACK_CALL_EST_NOT_ALLOWED_LOCAL";
        }
        else if (csfbFailureLocalCause == 39)
        {
          v21 = @"LTE_NAS_CS_DOMAIN_TEMP_NOT_AVAILABLE_LOCAL";
        }
        else
        {
LABEL_145:
          v21 = +[NSString stringWithFormat:@"(unknown: %i)", self->_csfbFailureLocalCause];
        }
        break;
    }
  }
  else
  {
    switch(csfbFailureLocalCause)
    {
      case 256:
        v21 = @"DRB_RELEASED_AT_RRC";
        break;
      case 257:
        v21 = @"NAS_SIG_CONN_RELEASED";
        break;
      case 258:
        v21 = @"EMM_DETACHED";
        break;
      case 259:
        v21 = @"EMM_ATTACH_FAILED";
        break;
      case 260:
        v21 = @"EMM_ATTACH_STARTED";
        break;
      case 261:
        v21 = @"LTE_NAS_SERVICE_REQ_FAILED";
        break;
      case 262:
        v21 = @"ESM_ACTIVE_DEDICATED_BEARER_REACTIVATED_BY_NW";
        break;
      case 263:
        v21 = @"ESM_LOWER_LAYER_FAILURE";
        break;
      case 264:
        v21 = @"ESM_SYNC_UP_WITH_NW";
        break;
      case 265:
        v21 = @"ESM_NW_ACTIVATED_DED_BEARER_WITH_ID_OF_DEF_BEARER";
        break;
      case 266:
        v21 = @"ESM_BAD_OTA_MESSAGE";
        break;
      case 267:
        v21 = @"ESM_DS_REJECTED_THE_CALL";
        break;
      case 268:
        v21 = @"ESM_CONTEXT_TRANSFERED_DUE_TO_IRAT";
        break;
      case 269:
        v21 = @"DS_EXPLICIT_DEACT";
        break;
      case 270:
        v21 = @"ESM_MSGR_FAILURE";
        break;
      case 271:
        v21 = @"ESM_LOCAL_CUASE_NONE";
        break;
      case 272:
        v21 = @"ESM_REJ_DUE_TO_CONNECTED_STATE";
        break;
      case 273:
        v21 = @"LTE_NAS_SERVICE_REQ_FAILED_NO_THROTTLE";
        break;
      case 274:
        v21 = @"ACL_FAILURE";
        break;
      case 275:
        v21 = @"LTE_NAS_SERVICE_REQ_FAILED_DS_DISALLOW";
        break;
      case 276:
        v21 = @"EMM_T3417_EXPIRED";
        break;
      case 277:
        v21 = @"EMM_T3417_EXT_EXPIRED";
        break;
      case 278:
        v21 = @"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_TXN";
        break;
      case 279:
        v21 = @"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_HO";
        break;
      case 280:
        v21 = @"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_CONN_REL";
        break;
      case 281:
        v21 = @"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_RLF";
        break;
      case 282:
        v21 = @"LTE_NAS_LRRC_UL_DATA_CNF_FAILURE_CTRL_NOT_CONN";
        break;
      case 283:
        v21 = @"LTE_NAS_LRRC_CONN_EST_SUCCESS";
        break;
      case 284:
        v21 = @"LTE_NAS_LRRC_CONN_EST_FAILURE";
        break;
      case 285:
        v21 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_ABORTED";
        break;
      case 286:
        v21 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_ACCESS_BARRED";
        break;
      case 287:
        v21 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_CELL_RESEL";
        break;
      case 288:
        v21 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_CONFIG_FAILURE";
        break;
      case 289:
        v21 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_TIMER_EXPIRED";
        break;
      case 290:
        v21 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_LINK_FAILURE";
        break;
      case 291:
        v21 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_NOT_CAMPED";
        break;
      case 292:
        v21 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_SI_FAILURE";
        break;
      case 293:
        v21 = @"LTE_NAS_LRRC_CONN_EST_FAILURE_CONN_REJECT";
        break;
      case 294:
        v21 = @"LTE_NAS_LRRC_CONN_REL_NORMAL";
        break;
      case 295:
        v21 = @"LTE_NAS_LRRC_CONN_REL_RLF";
        break;
      case 296:
        v21 = @"LTE_NAS_LRRC_CONN_REL_CRE_FAILURE";
        break;
      case 297:
        v21 = @"LTE_NAS_LRRC_CONN_REL_OOS_DURING_CRE";
        break;
      case 298:
        v21 = @"LTE_NAS_LRRC_CONN_REL_ABORTED";
        break;
      case 299:
        v21 = @"LTE_NAS_LRRC_CONN_REL_SIB_READ_ERROR";
        break;
      case 300:
        v21 = @"LTE_NAS_LRRC_CONN_REL_ABORTED_IRAT_SUCCESS";
        break;
      case 301:
        v21 = @"LTE_NAS_REJ_LRRC_RADIO_LINK_FAILURE";
        break;
      case 302:
        v21 = @"LTE_NAS_SERVICE_REQ_FAILURE_LTE_NW_REJECT";
        break;
      case 303:
        v21 = @"LTE_NAS_DETACH_WITH_REATTACH_LTE_NW_DETACH";
        break;
      case 304:
        v21 = @"LTE_NAS_DETACH_WITH_OUT_REATTACH_LTE_NW_DETACH";
        break;
      case 305:
        v21 = @"ESM_PROC_TIME_OUT";
        break;
      default:
        if (csfbFailureLocalCause != 43) {
          goto LABEL_145;
        }
        v21 = @"LTE_NAS_ESM_UNKNOWN_EPS_BEARER_CONTEXT";
        break;
    }
  }
  [v3 setObject:v21 forKey:@"csfb_failure_local_cause"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_148;
  }
LABEL_147:
  v22 = +[NSNumber numberWithBool:self->_csfbIsLacMismatch];
  [v3 setObject:v22 forKey:@"csfb_is_lac_mismatch"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_149;
  }
LABEL_148:
  v23 = +[NSNumber numberWithUnsignedInt:self->_csfbAbnormalCause];
  [v3 setObject:v23 forKey:@"csfb_abnormal_cause"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_150;
  }
LABEL_149:
  v24 = +[NSNumber numberWithUnsignedInt:self->_lteRegLac];
  [v3 setObject:v24 forKey:@"lte_reg_lac"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_151;
  }
LABEL_150:
  v25 = +[NSNumber numberWithUnsignedInt:self->_tac];
  [v3 setObject:v25 forKey:@"tac"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_152;
  }
LABEL_151:
  v26 = +[NSNumber numberWithUnsignedInt:self->_lteCellId];
  [v3 setObject:v26 forKey:@"lte_cell_id"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_153;
  }
LABEL_152:
  v27 = +[NSNumber numberWithUnsignedInt:self->_attemptArfcn];
  [v3 setObject:v27 forKey:@"attempt_arfcn"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_154;
  }
LABEL_153:
  v28 = +[NSNumber numberWithBool:self->_isAttemptBandPcs];
  [v3 setObject:v28 forKey:@"is_attempt_band_pcs"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_155;
  }
LABEL_154:
  v29 = +[NSNumber numberWithUnsignedInt:self->_attemptLac];
  [v3 setObject:v29 forKey:@"attempt_lac"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_19;
    }
LABEL_156:
    v31 = +[NSNumber numberWithUnsignedInt:self->_numRedirFreq];
    [v3 setObject:v31 forKey:@"num_redir_freq"];

    if ((*(_DWORD *)&self->_has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_155:
  v30 = +[NSNumber numberWithUnsignedInt:self->_attemptCellId];
  [v3 setObject:v30 forKey:@"attempt_cell_id"];

  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0) {
    goto LABEL_156;
  }
LABEL_19:
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_20:
    v5 = +[NSNumber numberWithBool:self->_isRedirHighBandPcs];
    [v3 setObject:v5 forKey:@"is_redir_high_band_pcs"];
  }
LABEL_21:
  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"redir_arfcn"];

  id v7 = v3;
  return v7;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001EB74((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  id v8 = v4;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v8;
    $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_20:
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
LABEL_21:
  p_redirArfcns = &self->_redirArfcns;
  if (p_redirArfcns->count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v8;
      ++v7;
    }
    while (v7 < p_redirArfcns->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[4] = self->_timestamp;
    *((_DWORD *)v4 + 26) |= 1u;
    $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 24) = self->_version;
  *((_DWORD *)v4 + 26) |= 0x8000u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 22) = self->_pageRat;
  *((_DWORD *)v4 + 26) |= 0x2000u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 13) = self->_cause;
  *((_DWORD *)v4 + 26) |= 0x10u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 18) = self->_isImsiPage;
  *((_DWORD *)v4 + 26) |= 0x200u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 17) = self->_csfbFailureType;
  *((_DWORD *)v4 + 26) |= 0x100u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 15) = self->_csfbFailureEmmCause;
  *((_DWORD *)v4 + 26) |= 0x40u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 16) = self->_csfbFailureLocalCause;
  *((_DWORD *)v4 + 26) |= 0x80u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((unsigned char *)v4 + 100) = self->_csfbIsLacMismatch;
  *((_DWORD *)v4 + 26) |= 0x10000u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 14) = self->_csfbAbnormalCause;
  *((_DWORD *)v4 + 26) |= 0x20u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 20) = self->_lteRegLac;
  *((_DWORD *)v4 + 26) |= 0x800u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 23) = self->_tac;
  *((_DWORD *)v4 + 26) |= 0x4000u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 19) = self->_lteCellId;
  *((_DWORD *)v4 + 26) |= 0x400u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 10) = self->_attemptArfcn;
  *((_DWORD *)v4 + 26) |= 2u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((unsigned char *)v4 + 101) = self->_isAttemptBandPcs;
  *((_DWORD *)v4 + 26) |= 0x20000u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 12) = self->_attemptLac;
  *((_DWORD *)v4 + 26) |= 8u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_19;
    }
LABEL_45:
    *((_DWORD *)v4 + 21) = self->_numRedirFreq;
    *((_DWORD *)v4 + 26) |= 0x1000u;
    if ((*(_DWORD *)&self->_has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_44:
  *((_DWORD *)v4 + 11) = self->_attemptCellId;
  *((_DWORD *)v4 + 26) |= 4u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0) {
    goto LABEL_45;
  }
LABEL_19:
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_20:
    *((unsigned char *)v4 + 102) = self->_isRedirHighBandPcs;
    *((_DWORD *)v4 + 26) |= 0x40000u;
  }
LABEL_21:
  id v9 = v4;
  if ([(CellularCsCallGwlPageRespFail *)self redirArfcnsCount])
  {
    [v9 clearRedirArfcns];
    unint64_t v6 = [(CellularCsCallGwlPageRespFail *)self redirArfcnsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v9 addRedirArfcn:[self redirArfcnAtIndex:i]];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = v4;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)v4 + 4) = self->_timestamp;
    *((_DWORD *)v4 + 26) |= 1u;
    $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 24) = self->_version;
  *((_DWORD *)v4 + 26) |= 0x8000u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 22) = self->_pageRat;
  *((_DWORD *)v4 + 26) |= 0x2000u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 13) = self->_cause;
  *((_DWORD *)v4 + 26) |= 0x10u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 18) = self->_isImsiPage;
  *((_DWORD *)v4 + 26) |= 0x200u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 17) = self->_csfbFailureType;
  *((_DWORD *)v4 + 26) |= 0x100u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 15) = self->_csfbFailureEmmCause;
  *((_DWORD *)v4 + 26) |= 0x40u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 16) = self->_csfbFailureLocalCause;
  *((_DWORD *)v4 + 26) |= 0x80u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((unsigned char *)v4 + 100) = self->_csfbIsLacMismatch;
  *((_DWORD *)v4 + 26) |= 0x10000u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 14) = self->_csfbAbnormalCause;
  *((_DWORD *)v4 + 26) |= 0x20u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 20) = self->_lteRegLac;
  *((_DWORD *)v4 + 26) |= 0x800u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 23) = self->_tac;
  *((_DWORD *)v4 + 26) |= 0x4000u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 19) = self->_lteCellId;
  *((_DWORD *)v4 + 26) |= 0x400u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 10) = self->_attemptArfcn;
  *((_DWORD *)v4 + 26) |= 2u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((unsigned char *)v4 + 101) = self->_isAttemptBandPcs;
  *((_DWORD *)v4 + 26) |= 0x20000u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 12) = self->_attemptLac;
  *((_DWORD *)v4 + 26) |= 8u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_19;
    }
LABEL_39:
    *((_DWORD *)v4 + 21) = self->_numRedirFreq;
    *((_DWORD *)v4 + 26) |= 0x1000u;
    if ((*(_DWORD *)&self->_has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_38:
  *((_DWORD *)v4 + 11) = self->_attemptCellId;
  *((_DWORD *)v4 + 26) |= 4u;
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0) {
    goto LABEL_39;
  }
LABEL_19:
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_20:
    *((unsigned char *)v4 + 102) = self->_isRedirHighBandPcs;
    *((_DWORD *)v4 + 26) |= 0x40000u;
  }
LABEL_21:
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_102;
  }
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  int v6 = *((_DWORD *)v4 + 26);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 4)) {
      goto LABEL_102;
    }
  }
  else if (v6)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_version != *((_DWORD *)v4 + 24)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_pageRat != *((_DWORD *)v4 + 22)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_cause != *((_DWORD *)v4 + 13)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_isImsiPage != *((_DWORD *)v4 + 18)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_csfbFailureType != *((_DWORD *)v4 + 17)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_csfbFailureEmmCause != *((_DWORD *)v4 + 15)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_csfbFailureLocalCause != *((_DWORD *)v4 + 16)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0) {
      goto LABEL_102;
    }
    if (self->_csfbIsLacMismatch)
    {
      if (!*((unsigned char *)v4 + 100)) {
        goto LABEL_102;
      }
    }
    else if (*((unsigned char *)v4 + 100))
    {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_csfbAbnormalCause != *((_DWORD *)v4 + 14)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_lteRegLac != *((_DWORD *)v4 + 20)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_tac != *((_DWORD *)v4 + 23)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_lteCellId != *((_DWORD *)v4 + 19)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_attemptArfcn != *((_DWORD *)v4 + 10)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0) {
      goto LABEL_102;
    }
    if (self->_isAttemptBandPcs)
    {
      if (!*((unsigned char *)v4 + 101)) {
        goto LABEL_102;
      }
    }
    else if (*((unsigned char *)v4 + 101))
    {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_attemptLac != *((_DWORD *)v4 + 12)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_attemptCellId != *((_DWORD *)v4 + 11)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_numRedirFreq != *((_DWORD *)v4 + 21)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) != 0)
    {
      if (self->_isRedirHighBandPcs)
      {
        if (!*((unsigned char *)v4 + 102)) {
          goto LABEL_102;
        }
      }
      else if (*((unsigned char *)v4 + 102))
      {
        goto LABEL_102;
      }
LABEL_108:
      char IsEqual = PBRepeatedUInt32IsEqual();
      goto LABEL_103;
    }
  }
  else if ((v6 & 0x40000) == 0)
  {
    goto LABEL_108;
  }
LABEL_102:
  char IsEqual = 0;
LABEL_103:

  return IsEqual;
}

- (unint64_t)hash
{
  $9871CD01E7CDACA26BC14801762D3127 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_version;
      if ((*(_WORD *)&has & 0x2000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_pageRat;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_cause;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v6 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_isImsiPage;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_csfbFailureType;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_csfbFailureEmmCause;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_csfbFailureLocalCause;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v10 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_csfbIsLacMismatch;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v11 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_csfbAbnormalCause;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v12 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_lteRegLac;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v13 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_tac;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v14 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_lteCellId;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v15 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_attemptArfcn;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_isAttemptBandPcs;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_17:
    uint64_t v18 = 2654435761 * self->_attemptLac;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v18 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_18:
    uint64_t v19 = 2654435761 * self->_attemptCellId;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_19;
    }
LABEL_38:
    uint64_t v20 = 0;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_20;
    }
LABEL_39:
    uint64_t v21 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ PBRepeatedUInt32Hash();
  }
LABEL_37:
  uint64_t v19 = 0;
  if ((*(_WORD *)&has & 0x1000) == 0) {
    goto LABEL_38;
  }
LABEL_19:
  uint64_t v20 = 2654435761 * self->_numRedirFreq;
  if ((*(_DWORD *)&has & 0x40000) == 0) {
    goto LABEL_39;
  }
LABEL_20:
  uint64_t v21 = 2654435761 * self->_isRedirHighBandPcs;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 26);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 4);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)v4 + 26);
    if ((v5 & 0x8000) == 0)
    {
LABEL_3:
      if ((v5 & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((v5 & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  self->_version = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x2000) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_uint64_t pageRat = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_uint64_t cause = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_isImsiPage = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_uint64_t csfbFailureType = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_int csfbFailureEmmCause = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_int csfbFailureLocalCause = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x10000) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_csfbIsLacMismatch = *((unsigned char *)v4 + 100);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_csfbAbnormalCause = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_lteRegLac = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x4000) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_tac = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x400) == 0)
  {
LABEL_14:
    if ((v5 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_lteCellId = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 2) == 0)
  {
LABEL_15:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_attemptArfcn = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x20000) == 0)
  {
LABEL_16:
    if ((v5 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_isAttemptBandPcs = *((unsigned char *)v4 + 101);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_17:
    if ((v5 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_attemptLac = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_18:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_attemptCellId = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 26);
  if ((v5 & 0x1000) == 0)
  {
LABEL_19:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_44:
  self->_numRedirFreq = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v4 + 26) & 0x40000) != 0)
  {
LABEL_20:
    self->_isRedirHighBandPcs = *((unsigned char *)v4 + 102);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_21:
  id v9 = v4;
  uint64_t v6 = (char *)[v4 redirArfcnsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[CellularCsCallGwlPageRespFail addRedirArfcn:](self, "addRedirArfcn:", [v9 redirArfcnAtIndex:i]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)isImsiPage
{
  return self->_isImsiPage;
}

- (BOOL)csfbIsLacMismatch
{
  return self->_csfbIsLacMismatch;
}

- (unsigned)csfbAbnormalCause
{
  return self->_csfbAbnormalCause;
}

- (unsigned)lteRegLac
{
  return self->_lteRegLac;
}

- (unsigned)tac
{
  return self->_tac;
}

- (unsigned)lteCellId
{
  return self->_lteCellId;
}

- (unsigned)attemptArfcn
{
  return self->_attemptArfcn;
}

- (BOOL)isAttemptBandPcs
{
  return self->_isAttemptBandPcs;
}

- (unsigned)attemptLac
{
  return self->_attemptLac;
}

- (unsigned)attemptCellId
{
  return self->_attemptCellId;
}

- (unsigned)numRedirFreq
{
  return self->_numRedirFreq;
}

- (BOOL)isRedirHighBandPcs
{
  return self->_isRedirHighBandPcs;
}

@end