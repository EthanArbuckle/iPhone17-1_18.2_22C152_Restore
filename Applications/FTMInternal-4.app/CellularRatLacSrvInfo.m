@interface CellularRatLacSrvInfo
- (BOOL)hasAsubsId;
- (BOOL)hasCellId;
- (BOOL)hasCellId2nd;
- (BOOL)hasCompanionType;
- (BOOL)hasDynNr5gEnabling;
- (BOOL)hasElapsedMs;
- (BOOL)hasGizmoMode;
- (BOOL)hasHdrPersonality;
- (BOOL)hasLac;
- (BOOL)hasLac2nd;
- (BOOL)hasNid;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPlmn2nd;
- (BOOL)hasPsPref;
- (BOOL)hasRoamStatus;
- (BOOL)hasScgEverConfigured;
- (BOOL)hasSid;
- (BOOL)hasSimHplmn;
- (BOOL)hasSimPlmn;
- (BOOL)hasSrvDomain;
- (BOOL)hasSrvDomain2nd;
- (BOOL)hasSrvStatus;
- (BOOL)hasSrvStatus2nd;
- (BOOL)hasStandbyPref;
- (BOOL)hasSubsId;
- (BOOL)hasSysMode;
- (BOOL)hasSysMode2nd;
- (BOOL)hasTimestamp;
- (BOOL)hasUiNr5gSwitch;
- (BOOL)hasUpperLayerIndication;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)scgEverConfigured;
- (BOOL)upperLayerIndication;
- (NSData)plmn;
- (NSData)plmn2nd;
- (NSData)simHplmn;
- (NSData)simPlmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)roamStatusAsString:(int)a3;
- (int)StringAsRoamStatus:(id)a3;
- (int)hdrPersonality;
- (int)roamStatus;
- (int)srvDomain;
- (int)srvDomain2nd;
- (int)srvStatus;
- (int)srvStatus2nd;
- (int)standbyPref;
- (int)sysMode;
- (int)sysMode2nd;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)asubsId;
- (unsigned)cellId;
- (unsigned)cellId2nd;
- (unsigned)companionType;
- (unsigned)dynNr5gEnabling;
- (unsigned)elapsedMs;
- (unsigned)gizmoMode;
- (unsigned)lac;
- (unsigned)lac2nd;
- (unsigned)nid;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)sid;
- (unsigned)subsId;
- (unsigned)uiNr5gSwitch;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsubsId:(unsigned int)a3;
- (void)setCellId2nd:(unsigned int)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setCompanionType:(unsigned int)a3;
- (void)setDynNr5gEnabling:(unsigned int)a3;
- (void)setElapsedMs:(unsigned int)a3;
- (void)setGizmoMode:(unsigned int)a3;
- (void)setHasAsubsId:(BOOL)a3;
- (void)setHasCellId2nd:(BOOL)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasCompanionType:(BOOL)a3;
- (void)setHasDynNr5gEnabling:(BOOL)a3;
- (void)setHasElapsedMs:(BOOL)a3;
- (void)setHasGizmoMode:(BOOL)a3;
- (void)setHasHdrPersonality:(BOOL)a3;
- (void)setHasLac2nd:(BOOL)a3;
- (void)setHasLac:(BOOL)a3;
- (void)setHasNid:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasRoamStatus:(BOOL)a3;
- (void)setHasScgEverConfigured:(BOOL)a3;
- (void)setHasSid:(BOOL)a3;
- (void)setHasSrvDomain2nd:(BOOL)a3;
- (void)setHasSrvDomain:(BOOL)a3;
- (void)setHasSrvStatus2nd:(BOOL)a3;
- (void)setHasSrvStatus:(BOOL)a3;
- (void)setHasStandbyPref:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasSysMode2nd:(BOOL)a3;
- (void)setHasSysMode:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUiNr5gSwitch:(BOOL)a3;
- (void)setHasUpperLayerIndication:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHdrPersonality:(int)a3;
- (void)setLac2nd:(unsigned int)a3;
- (void)setLac:(unsigned int)a3;
- (void)setNid:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn2nd:(id)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setRoamStatus:(int)a3;
- (void)setScgEverConfigured:(BOOL)a3;
- (void)setSid:(unsigned int)a3;
- (void)setSimHplmn:(id)a3;
- (void)setSimPlmn:(id)a3;
- (void)setSrvDomain2nd:(int)a3;
- (void)setSrvDomain:(int)a3;
- (void)setSrvStatus2nd:(int)a3;
- (void)setSrvStatus:(int)a3;
- (void)setStandbyPref:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setSysMode2nd:(int)a3;
- (void)setSysMode:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUiNr5gSwitch:(unsigned int)a3;
- (void)setUpperLayerIndication:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularRatLacSrvInfo

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasVersion
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
}

- (void)setStandbyPref:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_standbyPref = a3;
}

- (void)setHasStandbyPref:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasStandbyPref
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSid:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_sid = a3;
}

- (void)setHasSid:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSid
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNid:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_nid = a3;
}

- (void)setHasNid:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNid
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCellId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLac
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setGizmoMode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_gizmoMode = a3;
}

- (void)setHasGizmoMode:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasGizmoMode
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCompanionType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_companionType = a3;
}

- (void)setHasCompanionType:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCompanionType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSysMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_sysMode = a3;
}

- (void)setHasSysMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSysMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSrvStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_srvStatus = a3;
}

- (void)setHasSrvStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSrvStatus
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSrvDomain:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_srvDomain = a3;
}

- (void)setHasSrvDomain:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSrvDomain
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (int)roamStatus
{
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    return self->_roamStatus;
  }
  else {
    return -1;
  }
}

- (void)setRoamStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_roamStatus = a3;
}

- (void)setHasRoamStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRoamStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)roamStatusAsString:(int)a3
{
  v4 = @"SYS_ROAM_STATUS_NONE";
  switch(a3)
  {
    case -1:
      goto LABEL_46;
    case 0:
      v4 = @"SYS_ROAM_STATUS_OFF";
      break;
    case 1:
      v4 = @"SYS_ROAM_STATUS_ON";
      break;
    case 2:
      v4 = @"SYS_ROAM_STATUS_BLINK";
      break;
    case 3:
      v4 = @"SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD";
      break;
    case 4:
      v4 = @"SYS_ROAM_STATUS_OUT_OF_BLDG";
      break;
    case 5:
      v4 = @"SYS_ROAM_STATUS_PREF_SYS";
      break;
    case 6:
      v4 = @"SYS_ROAM_STATUS_AVAIL_SYS";
      break;
    case 7:
      v4 = @"SYS_ROAM_STATUS_ALLIANCE_PARTNER";
      break;
    case 8:
      v4 = @"SYS_ROAM_STATUS_PREMIUM_PARTNER";
      break;
    case 9:
      v4 = @"SYS_ROAM_STATUS_FULL_SVC";
      break;
    case 10:
      v4 = @"SYS_ROAM_STATUS_PARTIAL_SVC";
      break;
    case 11:
      v4 = @"SYS_ROAM_STATUS_BANNER_ON";
      break;
    case 12:
      v4 = @"SYS_ROAM_STATUS_BANNER_OFF";
      break;
    default:
      if (a3 == 64)
      {
        v4 = @"SYS_ROAM_STATUS_HOME_SYSTEM";
      }
      else
      {
        v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_46:
      }
      break;
  }
  return v4;
}

- (int)StringAsRoamStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_ROAM_STATUS_NONE"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_OFF"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_ON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_BLINK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_OUT_OF_BLDG"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_PREF_SYS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_AVAIL_SYS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_ALLIANCE_PARTNER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_PREMIUM_PARTNER"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_FULL_SVC"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_PARTIAL_SVC"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_BANNER_ON"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_BANNER_OFF"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_HOME_SYSTEM"])
  {
    int v4 = 64;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (void)setAsubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_asubsId = a3;
}

- (void)setHasAsubsId:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAsubsId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSimPlmn
{
  return self->_simPlmn != 0;
}

- (BOOL)hasPlmn2nd
{
  return self->_plmn2nd != 0;
}

- (void)setLac2nd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_lac2nd = a3;
}

- (void)setHasLac2nd:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLac2nd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSysMode2nd:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_sysMode2nd = a3;
}

- (void)setHasSysMode2nd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasSysMode2nd
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSrvStatus2nd:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_srvStatus2nd = a3;
}

- (void)setHasSrvStatus2nd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasSrvStatus2nd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSrvDomain2nd:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_srvDomain2nd = a3;
}

- (void)setHasSrvDomain2nd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSrvDomain2nd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setCellId2nd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_cellId2nd = a3;
}

- (void)setHasCellId2nd:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCellId2nd
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHdrPersonality:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hdrPersonality = a3;
}

- (void)setHasHdrPersonality:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHdrPersonality
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setElapsedMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_elapsedMs = a3;
}

- (void)setHasElapsedMs:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasElapsedMs
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNumSubs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setUpperLayerIndication:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_upperLayerIndication = a3;
}

- (void)setHasUpperLayerIndication:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasUpperLayerIndication
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setScgEverConfigured:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_scgEverConfigured = a3;
}

- (void)setHasScgEverConfigured:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasScgEverConfigured
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPsPref
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setUiNr5gSwitch:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_uiNr5gSwitch = a3;
}

- (void)setHasUiNr5gSwitch:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasUiNr5gSwitch
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setDynNr5gEnabling:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dynNr5gEnabling = a3;
}

- (void)setHasDynNr5gEnabling:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($38D75A67934D4523D3B2DC0696C465DD)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDynNr5gEnabling
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularRatLacSrvInfo;
  int v3 = [(CellularRatLacSrvInfo *)&v7 description];
  int v4 = [(CellularRatLacSrvInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $38D75A67934D4523D3B2DC0696C465DD has = self->_has;
  if (*(unsigned char *)&has)
  {
    v17 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v17 forKey:@"timestamp"];

    $38D75A67934D4523D3B2DC0696C465DD has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  v18 = +[NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v18 forKey:@"version"];

  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_4:
    v5 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v5 forKey:@"subs_id"];
  }
LABEL_5:
  simHplmn = self->_simHplmn;
  if (simHplmn) {
    [v3 setObject:simHplmn forKey:@"sim_hplmn"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    objc_super v7 = +[NSNumber numberWithInt:self->_standbyPref];
    [v3 setObject:v7 forKey:@"standby_pref"];
  }
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  $38D75A67934D4523D3B2DC0696C465DD v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) != 0)
  {
    v19 = +[NSNumber numberWithUnsignedInt:self->_sid];
    [v3 setObject:v19 forKey:@"sid"];

    $38D75A67934D4523D3B2DC0696C465DD v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x800) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v9 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&v9 & 0x800) == 0)
  {
    goto LABEL_13;
  }
  v20 = +[NSNumber numberWithUnsignedInt:self->_nid];
  [v3 setObject:v20 forKey:@"nid"];

  $38D75A67934D4523D3B2DC0696C465DD v9 = self->_has;
  if ((*(unsigned char *)&v9 & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v9 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_48;
  }
LABEL_47:
  v21 = +[NSNumber numberWithUnsignedInt:self->_cellId];
  [v3 setObject:v21 forKey:@"cell_id"];

  $38D75A67934D4523D3B2DC0696C465DD v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x200) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v9 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_49;
  }
LABEL_48:
  v22 = +[NSNumber numberWithUnsignedInt:self->_lac];
  [v3 setObject:v22 forKey:@"lac"];

  $38D75A67934D4523D3B2DC0696C465DD v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x80) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&v9 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_50;
  }
LABEL_49:
  v23 = +[NSNumber numberWithUnsignedInt:self->_gizmoMode];
  [v3 setObject:v23 forKey:@"gizmo_mode"];

  $38D75A67934D4523D3B2DC0696C465DD v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x10) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v9 & 0x400000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_51;
  }
LABEL_50:
  v24 = +[NSNumber numberWithUnsignedInt:self->_companionType];
  [v3 setObject:v24 forKey:@"companion_type"];

  $38D75A67934D4523D3B2DC0696C465DD v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v9 & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_52;
  }
LABEL_51:
  v25 = +[NSNumber numberWithInt:self->_sysMode];
  [v3 setObject:v25 forKey:@"sys_mode"];

  $38D75A67934D4523D3B2DC0696C465DD v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v9 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_53;
  }
LABEL_52:
  v26 = +[NSNumber numberWithInt:self->_srvStatus];
  [v3 setObject:v26 forKey:@"srv_status"];

  $38D75A67934D4523D3B2DC0696C465DD v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v9 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_54;
  }
LABEL_53:
  v27 = +[NSNumber numberWithInt:self->_srvDomain];
  [v3 setObject:v27 forKey:@"srv_domain"];

  $38D75A67934D4523D3B2DC0696C465DD v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v9 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_54:
  int roamStatus = self->_roamStatus;
  v29 = @"SYS_ROAM_STATUS_NONE";
  switch(roamStatus)
  {
    case -1:
      break;
    case 0:
      v29 = @"SYS_ROAM_STATUS_OFF";
      break;
    case 1:
      v29 = @"SYS_ROAM_STATUS_ON";
      break;
    case 2:
      v29 = @"SYS_ROAM_STATUS_BLINK";
      break;
    case 3:
      v29 = @"SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD";
      break;
    case 4:
      v29 = @"SYS_ROAM_STATUS_OUT_OF_BLDG";
      break;
    case 5:
      v29 = @"SYS_ROAM_STATUS_PREF_SYS";
      break;
    case 6:
      v29 = @"SYS_ROAM_STATUS_AVAIL_SYS";
      break;
    case 7:
      v29 = @"SYS_ROAM_STATUS_ALLIANCE_PARTNER";
      break;
    case 8:
      v29 = @"SYS_ROAM_STATUS_PREMIUM_PARTNER";
      break;
    case 9:
      v29 = @"SYS_ROAM_STATUS_FULL_SVC";
      break;
    case 10:
      v29 = @"SYS_ROAM_STATUS_PARTIAL_SVC";
      break;
    case 11:
      v29 = @"SYS_ROAM_STATUS_BANNER_ON";
      break;
    case 12:
      v29 = @"SYS_ROAM_STATUS_BANNER_OFF";
      break;
    default:
      if (roamStatus == 64)
      {
        v29 = @"SYS_ROAM_STATUS_HOME_SYSTEM";
      }
      else
      {
        v29 = +[NSString stringWithFormat:@"(unknown: %i)", self->_roamStatus];
      }
      break;
  }
  [v3 setObject:v29 forKey:@"roam_status"];

  if ((*(_DWORD *)&self->_has & 2) != 0)
  {
LABEL_22:
    v10 = +[NSNumber numberWithUnsignedInt:self->_asubsId];
    [v3 setObject:v10 forKey:@"asubs_id"];
  }
LABEL_23:
  simPlmn = self->_simPlmn;
  if (simPlmn) {
    [v3 setObject:simPlmn forKey:@"sim_plmn"];
  }
  plmn2nd = self->_plmn2nd;
  if (plmn2nd) {
    [v3 setObject:plmn2nd forKey:@"plmn_2nd"];
  }
  $38D75A67934D4523D3B2DC0696C465DD v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) != 0)
  {
    v30 = +[NSNumber numberWithUnsignedInt:self->_lac2nd];
    [v3 setObject:v30 forKey:@"lac_2nd"];

    $38D75A67934D4523D3B2DC0696C465DD v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x800000) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&v13 & 0x80000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x800000) == 0)
  {
    goto LABEL_29;
  }
  v31 = +[NSNumber numberWithInt:self->_sysMode2nd];
  [v3 setObject:v31 forKey:@"sys_mode_2nd"];

  $38D75A67934D4523D3B2DC0696C465DD v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v13 & 0x20000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_59;
  }
LABEL_58:
  v32 = +[NSNumber numberWithInt:self->_srvStatus2nd];
  [v3 setObject:v32 forKey:@"srv_status_2nd"];

  $38D75A67934D4523D3B2DC0696C465DD v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v13 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_60;
  }
LABEL_59:
  v33 = +[NSNumber numberWithInt:self->_srvDomain2nd];
  [v3 setObject:v33 forKey:@"srv_domain_2nd"];

  $38D75A67934D4523D3B2DC0696C465DD v13 = self->_has;
  if ((*(unsigned char *)&v13 & 8) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v13 & 0x100) == 0) {
      goto LABEL_33;
    }
    goto LABEL_61;
  }
LABEL_60:
  v34 = +[NSNumber numberWithUnsignedInt:self->_cellId2nd];
  [v3 setObject:v34 forKey:@"cell_id_2nd"];

  $38D75A67934D4523D3B2DC0696C465DD v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v13 & 0x40) == 0) {
      goto LABEL_34;
    }
    goto LABEL_62;
  }
LABEL_61:
  v35 = +[NSNumber numberWithInt:self->_hdrPersonality];
  [v3 setObject:v35 forKey:@"hdr_personality"];

  $38D75A67934D4523D3B2DC0696C465DD v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v13 & 0x1000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_63;
  }
LABEL_62:
  v36 = +[NSNumber numberWithUnsignedInt:self->_elapsedMs];
  [v3 setObject:v36 forKey:@"elapsed_ms"];

  $38D75A67934D4523D3B2DC0696C465DD v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v13 & 0x8000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_64;
  }
LABEL_63:
  v37 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v37 forKey:@"num_subs"];

  $38D75A67934D4523D3B2DC0696C465DD v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v13 & 0x4000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_65;
  }
LABEL_64:
  v38 = +[NSNumber numberWithBool:self->_upperLayerIndication];
  [v3 setObject:v38 forKey:@"upper_layer_indication"];

  $38D75A67934D4523D3B2DC0696C465DD v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x4000000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v13 & 0x2000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_66;
  }
LABEL_65:
  v39 = +[NSNumber numberWithBool:self->_scgEverConfigured];
  [v3 setObject:v39 forKey:@"scg_ever_configured"];

  $38D75A67934D4523D3B2DC0696C465DD v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v13 & 0x1000000) == 0) {
      goto LABEL_39;
    }
LABEL_67:
    v41 = +[NSNumber numberWithUnsignedInt:self->_uiNr5gSwitch];
    [v3 setObject:v41 forKey:@"ui_nr5g_switch"];

    if ((*(_DWORD *)&self->_has & 0x20) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_66:
  v40 = +[NSNumber numberWithUnsignedInt:self->_psPref];
  [v3 setObject:v40 forKey:@"ps_pref"];

  $38D75A67934D4523D3B2DC0696C465DD v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x1000000) != 0) {
    goto LABEL_67;
  }
LABEL_39:
  if ((*(unsigned char *)&v13 & 0x20) != 0)
  {
LABEL_40:
    v14 = +[NSNumber numberWithUnsignedInt:self->_dynNr5gEnabling];
    [v3 setObject:v14 forKey:@"dyn_nr5g_enabling"];
  }
LABEL_41:
  id v15 = v3;

  return v15;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100125730((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  $38D75A67934D4523D3B2DC0696C465DD has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $38D75A67934D4523D3B2DC0696C465DD has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x200000) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  if (self->_simHplmn) {
    PBDataWriterWriteDataField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  $38D75A67934D4523D3B2DC0696C465DD v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x8000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $38D75A67934D4523D3B2DC0696C465DD v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x800) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v5 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&v5 & 0x800) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  $38D75A67934D4523D3B2DC0696C465DD v5 = self->_has;
  if ((*(unsigned char *)&v5 & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v5 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  $38D75A67934D4523D3B2DC0696C465DD v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v5 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $38D75A67934D4523D3B2DC0696C465DD v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x80) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&v5 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $38D75A67934D4523D3B2DC0696C465DD v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x10) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v5 & 0x400000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  $38D75A67934D4523D3B2DC0696C465DD v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v5 & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt32Field();
  $38D75A67934D4523D3B2DC0696C465DD v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v5 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  $38D75A67934D4523D3B2DC0696C465DD v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v5 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt32Field();
  $38D75A67934D4523D3B2DC0696C465DD v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v5 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_56:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 2) != 0) {
LABEL_22:
  }
    PBDataWriterWriteUint32Field();
LABEL_23:
  if (self->_simPlmn) {
    PBDataWriterWriteDataField();
  }
  if (self->_plmn2nd) {
    PBDataWriterWriteDataField();
  }
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x800000) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&v6 & 0x80000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_60;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteInt32Field();
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v6 & 0x20000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt32Field();
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt32Field();
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_33;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_34;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v6 & 0x4000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteBOOLField();
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x4000000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteBOOLField();
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint32Field();
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_39:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_69:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x20) != 0) {
LABEL_40:
  }
    PBDataWriterWriteUint32Field();
LABEL_41:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  $38D75A67934D4523D3B2DC0696C465DD has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 39) |= 1u;
    $38D75A67934D4523D3B2DC0696C465DD has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 37) = self->_version;
  *((_DWORD *)v4 + 39) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 33) = self->_subsId;
    *((_DWORD *)v4 + 39) |= 0x200000u;
  }
LABEL_5:
  v8 = v4;
  if (self->_simHplmn)
  {
    [v4 setSimHplmn:];
    int v4 = v8;
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    *((_DWORD *)v4 + 32) = self->_standbyPref;
    *((_DWORD *)v4 + 39) |= 0x100000u;
  }
  if (self->_plmn)
  {
    [v8 setPlmn:];
    int v4 = v8;
  }
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_sid;
    *((_DWORD *)v4 + 39) |= 0x8000u;
    $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x800) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v6 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&v6 & 0x800) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 14) = self->_nid;
  *((_DWORD *)v4 + 39) |= 0x800u;
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 5) = self->_cellId;
  *((_DWORD *)v4 + 39) |= 4u;
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 12) = self->_lac;
  *((_DWORD *)v4 + 39) |= 0x200u;
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 10) = self->_gizmoMode;
  *((_DWORD *)v4 + 39) |= 0x80u;
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v6 & 0x400000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 7) = self->_companionType;
  *((_DWORD *)v4 + 39) |= 0x10u;
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 34) = self->_sysMode;
  *((_DWORD *)v4 + 39) |= 0x400000u;
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 30) = self->_srvStatus;
  *((_DWORD *)v4 + 39) |= 0x40000u;
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 28) = self->_srvDomain;
  *((_DWORD *)v4 + 39) |= 0x10000u;
  $38D75A67934D4523D3B2DC0696C465DD v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_56:
  *((_DWORD *)v4 + 21) = self->_roamStatus;
  *((_DWORD *)v4 + 39) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 2) != 0)
  {
LABEL_22:
    *((_DWORD *)v4 + 4) = self->_asubsId;
    *((_DWORD *)v4 + 39) |= 2u;
  }
LABEL_23:
  if (self->_simPlmn)
  {
    [v8 setSimPlmn];
    int v4 = v8;
  }
  if (self->_plmn2nd)
  {
    [v8 setPlmn2nd:];
    int v4 = v8;
  }
  $38D75A67934D4523D3B2DC0696C465DD v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_lac2nd;
    *((_DWORD *)v4 + 39) |= 0x400u;
    $38D75A67934D4523D3B2DC0696C465DD v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x800000) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&v7 & 0x80000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_60;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x800000) == 0)
  {
    goto LABEL_29;
  }
  *((_DWORD *)v4 + 35) = self->_sysMode2nd;
  *((_DWORD *)v4 + 39) |= 0x800000u;
  $38D75A67934D4523D3B2DC0696C465DD v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v7 & 0x20000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v4 + 31) = self->_srvStatus2nd;
  *((_DWORD *)v4 + 39) |= 0x80000u;
  $38D75A67934D4523D3B2DC0696C465DD v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v7 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v4 + 29) = self->_srvDomain2nd;
  *((_DWORD *)v4 + 39) |= 0x20000u;
  $38D75A67934D4523D3B2DC0696C465DD v7 = self->_has;
  if ((*(unsigned char *)&v7 & 8) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v7 & 0x100) == 0) {
      goto LABEL_33;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v4 + 6) = self->_cellId2nd;
  *((_DWORD *)v4 + 39) |= 8u;
  $38D75A67934D4523D3B2DC0696C465DD v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v7 & 0x40) == 0) {
      goto LABEL_34;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v4 + 11) = self->_hdrPersonality;
  *((_DWORD *)v4 + 39) |= 0x100u;
  $38D75A67934D4523D3B2DC0696C465DD v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v7 & 0x1000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)v4 + 9) = self->_elapsedMs;
  *((_DWORD *)v4 + 39) |= 0x40u;
  $38D75A67934D4523D3B2DC0696C465DD v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v7 & 0x8000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)v4 + 15) = self->_numSubs;
  *((_DWORD *)v4 + 39) |= 0x1000u;
  $38D75A67934D4523D3B2DC0696C465DD v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v7 & 0x4000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((unsigned char *)v4 + 153) = self->_upperLayerIndication;
  *((_DWORD *)v4 + 39) |= 0x8000000u;
  $38D75A67934D4523D3B2DC0696C465DD v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x4000000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((unsigned char *)v4 + 152) = self->_scgEverConfigured;
  *((_DWORD *)v4 + 39) |= 0x4000000u;
  $38D75A67934D4523D3B2DC0696C465DD v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v4 + 20) = self->_psPref;
  *((_DWORD *)v4 + 39) |= 0x2000u;
  $38D75A67934D4523D3B2DC0696C465DD v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_39:
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_69:
  *((_DWORD *)v4 + 36) = self->_uiNr5gSwitch;
  *((_DWORD *)v4 + 39) |= 0x1000000u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_40:
    *((_DWORD *)v4 + 8) = self->_dynNr5gEnabling;
    *((_DWORD *)v4 + 39) |= 0x20u;
  }
LABEL_41:
}

- (id)copyWithZone:(_NSZone *)a3
{
  $38D75A67934D4523D3B2DC0696C465DD v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $38D75A67934D4523D3B2DC0696C465DD v6 = v5;
  $38D75A67934D4523D3B2DC0696C465DD has = self->_has;
  if (*(unsigned char *)&has)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 39) |= 1u;
    $38D75A67934D4523D3B2DC0696C465DD has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 37) = self->_version;
  *((_DWORD *)v5 + 39) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 33) = self->_subsId;
    *((_DWORD *)v5 + 39) |= 0x200000u;
  }
LABEL_5:
  id v8 = [(NSData *)self->_simHplmn copyWithZone:a3];
  $38D75A67934D4523D3B2DC0696C465DD v9 = (void *)v6[12];
  v6[12] = v8;

  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    *((_DWORD *)v6 + 32) = self->_standbyPref;
    *((_DWORD *)v6 + 39) |= 0x100000u;
  }
  id v10 = [(NSData *)self->_plmn copyWithZone:a3];
  v11 = (void *)v6[8];
  v6[8] = v10;

  $38D75A67934D4523D3B2DC0696C465DD v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x8000) != 0)
  {
    *((_DWORD *)v6 + 22) = self->_sid;
    *((_DWORD *)v6 + 39) |= 0x8000u;
    $38D75A67934D4523D3B2DC0696C465DD v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x800) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&v12 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&v12 & 0x800) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v6 + 14) = self->_nid;
  *((_DWORD *)v6 + 39) |= 0x800u;
  $38D75A67934D4523D3B2DC0696C465DD v12 = self->_has;
  if ((*(unsigned char *)&v12 & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v12 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v6 + 5) = self->_cellId;
  *((_DWORD *)v6 + 39) |= 4u;
  $38D75A67934D4523D3B2DC0696C465DD v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x200) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&v12 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v6 + 12) = self->_lac;
  *((_DWORD *)v6 + 39) |= 0x200u;
  $38D75A67934D4523D3B2DC0696C465DD v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x80) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&v12 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v6 + 10) = self->_gizmoMode;
  *((_DWORD *)v6 + 39) |= 0x80u;
  $38D75A67934D4523D3B2DC0696C465DD v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v12 & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v6 + 7) = self->_companionType;
  *((_DWORD *)v6 + 39) |= 0x10u;
  $38D75A67934D4523D3B2DC0696C465DD v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v12 & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v6 + 34) = self->_sysMode;
  *((_DWORD *)v6 + 39) |= 0x400000u;
  $38D75A67934D4523D3B2DC0696C465DD v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v12 & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v6 + 30) = self->_srvStatus;
  *((_DWORD *)v6 + 39) |= 0x40000u;
  $38D75A67934D4523D3B2DC0696C465DD v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v12 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v6 + 28) = self->_srvDomain;
  *((_DWORD *)v6 + 39) |= 0x10000u;
  $38D75A67934D4523D3B2DC0696C465DD v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x4000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v12 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_46:
  *((_DWORD *)v6 + 21) = self->_roamStatus;
  *((_DWORD *)v6 + 39) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 2) != 0)
  {
LABEL_18:
    *((_DWORD *)v6 + 4) = self->_asubsId;
    *((_DWORD *)v6 + 39) |= 2u;
  }
LABEL_19:
  id v13 = [(NSData *)self->_simPlmn copyWithZone:a3];
  v14 = (void *)v6[13];
  v6[13] = v13;

  id v15 = [(NSData *)self->_plmn2nd copyWithZone:a3];
  v16 = (void *)v6[9];
  v6[9] = v15;

  $38D75A67934D4523D3B2DC0696C465DD v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x400) != 0)
  {
    *((_DWORD *)v6 + 13) = self->_lac2nd;
    *((_DWORD *)v6 + 39) |= 0x400u;
    $38D75A67934D4523D3B2DC0696C465DD v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x800000) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v17 & 0x80000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_50;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x800000) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)v6 + 35) = self->_sysMode2nd;
  *((_DWORD *)v6 + 39) |= 0x800000u;
  $38D75A67934D4523D3B2DC0696C465DD v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x80000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v17 & 0x20000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v6 + 31) = self->_srvStatus2nd;
  *((_DWORD *)v6 + 39) |= 0x80000u;
  $38D75A67934D4523D3B2DC0696C465DD v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x20000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v17 & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v6 + 29) = self->_srvDomain2nd;
  *((_DWORD *)v6 + 39) |= 0x20000u;
  $38D75A67934D4523D3B2DC0696C465DD v17 = self->_has;
  if ((*(unsigned char *)&v17 & 8) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v17 & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v6 + 6) = self->_cellId2nd;
  *((_DWORD *)v6 + 39) |= 8u;
  $38D75A67934D4523D3B2DC0696C465DD v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x100) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v17 & 0x40) == 0) {
      goto LABEL_26;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v6 + 11) = self->_hdrPersonality;
  *((_DWORD *)v6 + 39) |= 0x100u;
  $38D75A67934D4523D3B2DC0696C465DD v17 = self->_has;
  if ((*(unsigned char *)&v17 & 0x40) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v17 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v6 + 9) = self->_elapsedMs;
  *((_DWORD *)v6 + 39) |= 0x40u;
  $38D75A67934D4523D3B2DC0696C465DD v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x1000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v17 & 0x8000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v6 + 15) = self->_numSubs;
  *((_DWORD *)v6 + 39) |= 0x1000u;
  $38D75A67934D4523D3B2DC0696C465DD v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x8000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v17 & 0x4000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((unsigned char *)v6 + 153) = self->_upperLayerIndication;
  *((_DWORD *)v6 + 39) |= 0x8000000u;
  $38D75A67934D4523D3B2DC0696C465DD v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x4000000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v17 & 0x2000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((unsigned char *)v6 + 152) = self->_scgEverConfigured;
  *((_DWORD *)v6 + 39) |= 0x4000000u;
  $38D75A67934D4523D3B2DC0696C465DD v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x2000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v17 & 0x1000000) == 0) {
      goto LABEL_31;
    }
LABEL_59:
    *((_DWORD *)v6 + 36) = self->_uiNr5gSwitch;
    *((_DWORD *)v6 + 39) |= 0x1000000u;
    if ((*(_DWORD *)&self->_has & 0x20) == 0) {
      return v6;
    }
    goto LABEL_32;
  }
LABEL_58:
  *((_DWORD *)v6 + 20) = self->_psPref;
  *((_DWORD *)v6 + 39) |= 0x2000u;
  $38D75A67934D4523D3B2DC0696C465DD v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x1000000) != 0) {
    goto LABEL_59;
  }
LABEL_31:
  if ((*(unsigned char *)&v17 & 0x20) != 0)
  {
LABEL_32:
    *((_DWORD *)v6 + 8) = self->_dynNr5gEnabling;
    *((_DWORD *)v6 + 39) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_158;
  }
  $38D75A67934D4523D3B2DC0696C465DD has = self->_has;
  int v6 = *((_DWORD *)v4 + 39);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_158;
    }
  }
  else if (v6)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_version != *((_DWORD *)v4 + 37)) {
      goto LABEL_158;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_subsId != *((_DWORD *)v4 + 33)) {
      goto LABEL_158;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_158;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((void *)v4 + 12))
  {
    if (!-[NSData isEqual:](simHplmn, "isEqual:")) {
      goto LABEL_158;
    }
    $38D75A67934D4523D3B2DC0696C465DD has = self->_has;
  }
  int v8 = *((_DWORD *)v4 + 39);
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0 || self->_standbyPref != *((_DWORD *)v4 + 32)) {
      goto LABEL_158;
    }
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_158;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:")) {
      goto LABEL_158;
    }
    $38D75A67934D4523D3B2DC0696C465DD has = self->_has;
  }
  int v10 = *((_DWORD *)v4 + 39);
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v10 & 0x8000) == 0 || self->_sid != *((_DWORD *)v4 + 22)) {
      goto LABEL_158;
    }
  }
  else if ((v10 & 0x8000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_nid != *((_DWORD *)v4 + 14)) {
      goto LABEL_158;
    }
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_158;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_cellId != *((_DWORD *)v4 + 5)) {
      goto LABEL_158;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_lac != *((_DWORD *)v4 + 12)) {
      goto LABEL_158;
    }
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_158;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_gizmoMode != *((_DWORD *)v4 + 10)) {
      goto LABEL_158;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_158;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_companionType != *((_DWORD *)v4 + 7)) {
      goto LABEL_158;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v10 & 0x400000) == 0 || self->_sysMode != *((_DWORD *)v4 + 34)) {
      goto LABEL_158;
    }
  }
  else if ((v10 & 0x400000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0 || self->_srvStatus != *((_DWORD *)v4 + 30)) {
      goto LABEL_158;
    }
  }
  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0 || self->_srvDomain != *((_DWORD *)v4 + 28)) {
      goto LABEL_158;
    }
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_roamStatus != *((_DWORD *)v4 + 21)) {
      goto LABEL_158;
    }
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_asubsId != *((_DWORD *)v4 + 4)) {
      goto LABEL_158;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_158;
  }
  simPlmn = self->_simPlmn;
  if ((unint64_t)simPlmn | *((void *)v4 + 13) && !-[NSData isEqual:](simPlmn, "isEqual:")) {
    goto LABEL_158;
  }
  plmn2nd = self->_plmn2nd;
  if ((unint64_t)plmn2nd | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](plmn2nd, "isEqual:")) {
      goto LABEL_158;
    }
  }
  $38D75A67934D4523D3B2DC0696C465DD v13 = self->_has;
  int v14 = *((_DWORD *)v4 + 39);
  if ((*(_WORD *)&v13 & 0x400) != 0)
  {
    if ((v14 & 0x400) == 0 || self->_lac2nd != *((_DWORD *)v4 + 13)) {
      goto LABEL_158;
    }
  }
  else if ((v14 & 0x400) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&v13 & 0x800000) != 0)
  {
    if ((v14 & 0x800000) == 0 || self->_sysMode2nd != *((_DWORD *)v4 + 35)) {
      goto LABEL_158;
    }
  }
  else if ((v14 & 0x800000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
    if ((v14 & 0x80000) == 0 || self->_srvStatus2nd != *((_DWORD *)v4 + 31)) {
      goto LABEL_158;
    }
  }
  else if ((v14 & 0x80000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
  {
    if ((v14 & 0x20000) == 0 || self->_srvDomain2nd != *((_DWORD *)v4 + 29)) {
      goto LABEL_158;
    }
  }
  else if ((v14 & 0x20000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_cellId2nd != *((_DWORD *)v4 + 6)) {
      goto LABEL_158;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_WORD *)&v13 & 0x100) != 0)
  {
    if ((v14 & 0x100) == 0 || self->_hdrPersonality != *((_DWORD *)v4 + 11)) {
      goto LABEL_158;
    }
  }
  else if ((v14 & 0x100) != 0)
  {
    goto LABEL_158;
  }
  if ((*(unsigned char *)&v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_elapsedMs != *((_DWORD *)v4 + 9)) {
      goto LABEL_158;
    }
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
    if ((v14 & 0x1000) == 0 || self->_numSubs != *((_DWORD *)v4 + 15)) {
      goto LABEL_158;
    }
  }
  else if ((v14 & 0x1000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&v13 & 0x8000000) != 0)
  {
    if ((v14 & 0x8000000) == 0) {
      goto LABEL_158;
    }
    if (self->_upperLayerIndication)
    {
      if (!*((unsigned char *)v4 + 153)) {
        goto LABEL_158;
      }
    }
    else if (*((unsigned char *)v4 + 153))
    {
      goto LABEL_158;
    }
  }
  else if ((v14 & 0x8000000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&v13 & 0x4000000) != 0)
  {
    if ((v14 & 0x4000000) != 0)
    {
      if (self->_scgEverConfigured)
      {
        if (!*((unsigned char *)v4 + 152)) {
          goto LABEL_158;
        }
        goto LABEL_143;
      }
      if (!*((unsigned char *)v4 + 152)) {
        goto LABEL_143;
      }
    }
LABEL_158:
    BOOL v15 = 0;
    goto LABEL_159;
  }
  if ((v14 & 0x4000000) != 0) {
    goto LABEL_158;
  }
LABEL_143:
  if ((*(_WORD *)&v13 & 0x2000) != 0)
  {
    if ((v14 & 0x2000) == 0 || self->_psPref != *((_DWORD *)v4 + 20)) {
      goto LABEL_158;
    }
  }
  else if ((v14 & 0x2000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(_DWORD *)&v13 & 0x1000000) != 0)
  {
    if ((v14 & 0x1000000) == 0 || self->_uiNr5gSwitch != *((_DWORD *)v4 + 36)) {
      goto LABEL_158;
    }
  }
  else if ((v14 & 0x1000000) != 0)
  {
    goto LABEL_158;
  }
  if ((*(unsigned char *)&v13 & 0x20) != 0)
  {
    if ((v14 & 0x20) == 0 || self->_dynNr5gEnabling != *((_DWORD *)v4 + 8)) {
      goto LABEL_158;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = (*((_DWORD *)v4 + 39) & 0x20) == 0;
  }
LABEL_159:

  return v15;
}

- (unint64_t)hash
{
  $38D75A67934D4523D3B2DC0696C465DD has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
    unint64_t v38 = 0;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v37 = 0;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v38 = 2654435761u * self->_timestamp;
  if ((*(_DWORD *)&has & 0x2000000) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v37 = 2654435761 * self->_version;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_4:
    uint64_t v36 = 2654435761 * self->_subsId;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v36 = 0;
LABEL_8:
  unint64_t v35 = (unint64_t)[(NSData *)self->_simHplmn hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    uint64_t v34 = 2654435761 * self->_standbyPref;
  }
  else {
    uint64_t v34 = 0;
  }
  unint64_t v33 = (unint64_t)[(NSData *)self->_plmn hash];
  $38D75A67934D4523D3B2DC0696C465DD v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
    uint64_t v32 = 2654435761 * self->_sid;
    if ((*(_WORD *)&v4 & 0x800) != 0)
    {
LABEL_13:
      uint64_t v31 = 2654435761 * self->_nid;
      if ((*(unsigned char *)&v4 & 4) != 0) {
        goto LABEL_14;
      }
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if ((*(_WORD *)&v4 & 0x800) != 0) {
      goto LABEL_13;
    }
  }
  uint64_t v31 = 0;
  if ((*(unsigned char *)&v4 & 4) != 0)
  {
LABEL_14:
    uint64_t v30 = 2654435761 * self->_cellId;
    if ((*(_WORD *)&v4 & 0x200) != 0) {
      goto LABEL_15;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v30 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_15:
    uint64_t v29 = 2654435761 * self->_lac;
    if ((*(unsigned char *)&v4 & 0x80) != 0) {
      goto LABEL_16;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v29 = 0;
  if ((*(unsigned char *)&v4 & 0x80) != 0)
  {
LABEL_16:
    uint64_t v28 = 2654435761 * self->_gizmoMode;
    if ((*(unsigned char *)&v4 & 0x10) != 0) {
      goto LABEL_17;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v28 = 0;
  if ((*(unsigned char *)&v4 & 0x10) != 0)
  {
LABEL_17:
    uint64_t v5 = 2654435761 * self->_companionType;
    if ((*(_DWORD *)&v4 & 0x400000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v5 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) != 0)
  {
LABEL_18:
    uint64_t v6 = 2654435761 * self->_sysMode;
    if ((*(_DWORD *)&v4 & 0x40000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_19:
    uint64_t v7 = 2654435761 * self->_srvStatus;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_20:
    uint64_t v8 = 2654435761 * self->_srvDomain;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_21;
    }
LABEL_32:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&v4 & 2) != 0) {
      goto LABEL_22;
    }
    goto LABEL_33;
  }
LABEL_31:
  uint64_t v8 = 0;
  if ((*(_WORD *)&v4 & 0x4000) == 0) {
    goto LABEL_32;
  }
LABEL_21:
  uint64_t v9 = 2654435761 * self->_roamStatus;
  if ((*(unsigned char *)&v4 & 2) != 0)
  {
LABEL_22:
    uint64_t v10 = 2654435761 * self->_asubsId;
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v10 = 0;
LABEL_34:
  unint64_t v11 = (unint64_t)[(NSData *)self->_simPlmn hash];
  unint64_t v12 = (unint64_t)[(NSData *)self->_plmn2nd hash];
  $38D75A67934D4523D3B2DC0696C465DD v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) != 0)
  {
    uint64_t v14 = 2654435761 * self->_lac2nd;
    if ((*(_DWORD *)&v13 & 0x800000) != 0)
    {
LABEL_36:
      uint64_t v15 = 2654435761 * self->_sysMode2nd;
      if ((*(_DWORD *)&v13 & 0x80000) != 0) {
        goto LABEL_37;
      }
      goto LABEL_50;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((*(_DWORD *)&v13 & 0x800000) != 0) {
      goto LABEL_36;
    }
  }
  uint64_t v15 = 0;
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
LABEL_37:
    uint64_t v16 = 2654435761 * self->_srvStatus2nd;
    if ((*(_DWORD *)&v13 & 0x20000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
  {
LABEL_38:
    uint64_t v17 = 2654435761 * self->_srvDomain2nd;
    if ((*(unsigned char *)&v13 & 8) != 0) {
      goto LABEL_39;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
LABEL_39:
    uint64_t v18 = 2654435761 * self->_cellId2nd;
    if ((*(_WORD *)&v13 & 0x100) != 0) {
      goto LABEL_40;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v18 = 0;
  if ((*(_WORD *)&v13 & 0x100) != 0)
  {
LABEL_40:
    uint64_t v19 = 2654435761 * self->_hdrPersonality;
    if ((*(unsigned char *)&v13 & 0x40) != 0) {
      goto LABEL_41;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v19 = 0;
  if ((*(unsigned char *)&v13 & 0x40) != 0)
  {
LABEL_41:
    uint64_t v20 = 2654435761 * self->_elapsedMs;
    if ((*(_WORD *)&v13 & 0x1000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v20 = 0;
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
LABEL_42:
    uint64_t v21 = 2654435761 * self->_numSubs;
    if ((*(_DWORD *)&v13 & 0x8000000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v21 = 0;
  if ((*(_DWORD *)&v13 & 0x8000000) != 0)
  {
LABEL_43:
    uint64_t v22 = 2654435761 * self->_upperLayerIndication;
    if ((*(_DWORD *)&v13 & 0x4000000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v22 = 0;
  if ((*(_DWORD *)&v13 & 0x4000000) != 0)
  {
LABEL_44:
    uint64_t v23 = 2654435761 * self->_scgEverConfigured;
    if ((*(_WORD *)&v13 & 0x2000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v23 = 0;
  if ((*(_WORD *)&v13 & 0x2000) != 0)
  {
LABEL_45:
    uint64_t v24 = 2654435761 * self->_psPref;
    if ((*(_DWORD *)&v13 & 0x1000000) != 0) {
      goto LABEL_46;
    }
LABEL_59:
    uint64_t v25 = 0;
    if ((*(unsigned char *)&v13 & 0x20) != 0) {
      goto LABEL_47;
    }
LABEL_60:
    uint64_t v26 = 0;
    return v37 ^ v38 ^ v36 ^ v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
  }
LABEL_58:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&v13 & 0x1000000) == 0) {
    goto LABEL_59;
  }
LABEL_46:
  uint64_t v25 = 2654435761 * self->_uiNr5gSwitch;
  if ((*(unsigned char *)&v13 & 0x20) == 0) {
    goto LABEL_60;
  }
LABEL_47:
  uint64_t v26 = 2654435761 * self->_dynNr5gEnabling;
  return v37 ^ v38 ^ v36 ^ v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 39);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)v4 + 39);
    if ((v5 & 0x2000000) == 0)
    {
LABEL_3:
      if ((v5 & 0x200000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  self->_version = *((_DWORD *)v4 + 37);
  *(_DWORD *)&self->_has |= 0x2000000u;
  if ((*((_DWORD *)v4 + 39) & 0x200000) != 0)
  {
LABEL_4:
    self->_subsId = *((_DWORD *)v4 + 33);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
LABEL_5:
  id v8 = v4;
  if (*((void *)v4 + 12))
  {
    -[CellularRatLacSrvInfo setSimHplmn:](self, "setSimHplmn:");
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 158) & 0x10) != 0)
  {
    self->_standbyPref = *((_DWORD *)v4 + 32);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
  if (*((void *)v4 + 8))
  {
    -[CellularRatLacSrvInfo setPlmn:](self, "setPlmn:");
    id v4 = v8;
  }
  int v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x8000) != 0)
  {
    self->_sid = *((_DWORD *)v4 + 22);
    *(_DWORD *)&self->_has |= 0x8000u;
    int v6 = *((_DWORD *)v4 + 39);
    if ((v6 & 0x800) == 0)
    {
LABEL_13:
      if ((v6 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x800) == 0)
  {
    goto LABEL_13;
  }
  self->_nid = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  int v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 4) == 0)
  {
LABEL_14:
    if ((v6 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_cellId = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  int v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x200) == 0)
  {
LABEL_15:
    if ((v6 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_lac = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  int v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x80) == 0)
  {
LABEL_16:
    if ((v6 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_gizmoMode = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  int v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x10) == 0)
  {
LABEL_17:
    if ((v6 & 0x400000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_companionType = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  int v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x400000) == 0)
  {
LABEL_18:
    if ((v6 & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_sysMode = *((_DWORD *)v4 + 34);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x40000) == 0)
  {
LABEL_19:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_srvStatus = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x10000) == 0)
  {
LABEL_20:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_srvDomain = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v6 = *((_DWORD *)v4 + 39);
  if ((v6 & 0x4000) == 0)
  {
LABEL_21:
    if ((v6 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_56:
  self->_int roamStatus = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 39) & 2) != 0)
  {
LABEL_22:
    self->_asubsId = *((_DWORD *)v4 + 4);
    *(_DWORD *)&self->_has |= 2u;
  }
LABEL_23:
  if (*((void *)v4 + 13))
  {
    -[CellularRatLacSrvInfo setSimPlmn:](self, "setSimPlmn:");
    id v4 = v8;
  }
  if (*((void *)v4 + 9))
  {
    -[CellularRatLacSrvInfo setPlmn2nd:](self, "setPlmn2nd:");
    id v4 = v8;
  }
  int v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x400) != 0)
  {
    self->_lac2nd = *((_DWORD *)v4 + 13);
    *(_DWORD *)&self->_has |= 0x400u;
    int v7 = *((_DWORD *)v4 + 39);
    if ((v7 & 0x800000) == 0)
    {
LABEL_29:
      if ((v7 & 0x80000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_60;
    }
  }
  else if ((v7 & 0x800000) == 0)
  {
    goto LABEL_29;
  }
  self->_sysMode2nd = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x80000) == 0)
  {
LABEL_30:
    if ((v7 & 0x20000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_srvStatus2nd = *((_DWORD *)v4 + 31);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x20000) == 0)
  {
LABEL_31:
    if ((v7 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_srvDomain2nd = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 8) == 0)
  {
LABEL_32:
    if ((v7 & 0x100) == 0) {
      goto LABEL_33;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_cellId2nd = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x100) == 0)
  {
LABEL_33:
    if ((v7 & 0x40) == 0) {
      goto LABEL_34;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_hdrPersonality = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  int v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x40) == 0)
  {
LABEL_34:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_elapsedMs = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  int v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x1000) == 0)
  {
LABEL_35:
    if ((v7 & 0x8000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_numSubs = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x8000000) == 0)
  {
LABEL_36:
    if ((v7 & 0x4000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_upperLayerIndication = *((unsigned char *)v4 + 153);
  *(_DWORD *)&self->_has |= 0x8000000u;
  int v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x4000000) == 0)
  {
LABEL_37:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_scgEverConfigured = *((unsigned char *)v4 + 152);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x2000) == 0)
  {
LABEL_38:
    if ((v7 & 0x1000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_psPref = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v7 = *((_DWORD *)v4 + 39);
  if ((v7 & 0x1000000) == 0)
  {
LABEL_39:
    if ((v7 & 0x20) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_69:
  self->_uiNr5gSwitch = *((_DWORD *)v4 + 36);
  *(_DWORD *)&self->_has |= 0x1000000u;
  if ((*((_DWORD *)v4 + 39) & 0x20) != 0)
  {
LABEL_40:
    self->_dynNr5gEnabling = *((_DWORD *)v4 + 8);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_41:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (NSData)simHplmn
{
  return self->_simHplmn;
}

- (void)setSimHplmn:(id)a3
{
}

- (int)standbyPref
{
  return self->_standbyPref;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
}

- (unsigned)sid
{
  return self->_sid;
}

- (unsigned)nid
{
  return self->_nid;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)lac
{
  return self->_lac;
}

- (unsigned)gizmoMode
{
  return self->_gizmoMode;
}

- (unsigned)companionType
{
  return self->_companionType;
}

- (int)sysMode
{
  return self->_sysMode;
}

- (int)srvStatus
{
  return self->_srvStatus;
}

- (int)srvDomain
{
  return self->_srvDomain;
}

- (unsigned)asubsId
{
  return self->_asubsId;
}

- (NSData)simPlmn
{
  return self->_simPlmn;
}

- (void)setSimPlmn:(id)a3
{
}

- (NSData)plmn2nd
{
  return self->_plmn2nd;
}

- (void)setPlmn2nd:(id)a3
{
}

- (unsigned)lac2nd
{
  return self->_lac2nd;
}

- (int)sysMode2nd
{
  return self->_sysMode2nd;
}

- (int)srvStatus2nd
{
  return self->_srvStatus2nd;
}

- (int)srvDomain2nd
{
  return self->_srvDomain2nd;
}

- (unsigned)cellId2nd
{
  return self->_cellId2nd;
}

- (int)hdrPersonality
{
  return self->_hdrPersonality;
}

- (unsigned)elapsedMs
{
  return self->_elapsedMs;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (BOOL)upperLayerIndication
{
  return self->_upperLayerIndication;
}

- (BOOL)scgEverConfigured
{
  return self->_scgEverConfigured;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (unsigned)uiNr5gSwitch
{
  return self->_uiNr5gSwitch;
}

- (unsigned)dynNr5gEnabling
{
  return self->_dynNr5gEnabling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simPlmn, 0);
  objc_storeStrong((id *)&self->_simHplmn, 0);
  objc_storeStrong((id *)&self->_plmn2nd, 0);

  objc_storeStrong((id *)&self->_plmn, 0);
}

@end