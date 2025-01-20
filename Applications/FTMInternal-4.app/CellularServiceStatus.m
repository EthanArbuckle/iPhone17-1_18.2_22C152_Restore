@interface CellularServiceStatus
- (BOOL)hasDurationMs;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasRoamStatus;
- (BOOL)hasSimHplmn;
- (BOOL)hasSrvDomain;
- (BOOL)hasSrvStatus;
- (BOOL)hasSubsId;
- (BOOL)hasSysMode;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (NSData)simHplmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)roamStatusAsString:(int)a3;
- (id)srvDomainAsString:(int)a3;
- (id)srvStatusAsString:(int)a3;
- (id)sysModeAsString:(int)a3;
- (int)StringAsRoamStatus:(id)a3;
- (int)StringAsSrvDomain:(id)a3;
- (int)StringAsSrvStatus:(id)a3;
- (int)StringAsSysMode:(id)a3;
- (int)roamStatus;
- (int)srvDomain;
- (int)srvStatus;
- (int)sysMode;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)durationMs;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDurationMs:(unsigned int)a3;
- (void)setHasDurationMs:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasRoamStatus:(BOOL)a3;
- (void)setHasSrvDomain:(BOOL)a3;
- (void)setHasSrvStatus:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasSysMode:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setRoamStatus:(int)a3;
- (void)setSimHplmn:(id)a3;
- (void)setSrvDomain:(int)a3;
- (void)setSrvStatus:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setSysMode:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularServiceStatus

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

- (int)sysMode
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_sysMode;
  }
  else {
    return 0;
  }
}

- (void)setSysMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_sysMode = a3;
}

- (void)setHasSysMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSysMode
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)sysModeAsString:(int)a3
{
  if a3 < 0x10 && ((0x9FFFu >> a3))
  {
    __int16 v3 = *(&off_100287238 + a3);
  }
  else
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsSysMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_MODE_NO_SRV"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_LTE_V2"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_CDMA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_GSM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_HDR"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_WCDMA"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_EHRPD"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_GW"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_WLAN"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_LTE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_GWL"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_UMTS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_NR5G"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SYS_MODE_CDMA_HDR"])
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)srvStatus
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_srvStatus;
  }
  else {
    return -1;
  }
}

- (void)setSrvStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_srvStatus = a3;
}

- (void)setHasSrvStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSrvStatus
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)srvStatusAsString:(int)a3
{
  int v4 = @"SYS_SRV_STATUS_NONE";
  switch(a3)
  {
    case -1:
      goto LABEL_29;
    case 0:
      int v4 = @"SYS_SRV_STATUS_NO_SRV";
      break;
    case 1:
      int v4 = @"SYS_SRV_STATUS_LIMITED";
      break;
    case 2:
      int v4 = @"SYS_SRV_STATUS_SRV";
      break;
    case 3:
      int v4 = @"SYS_SRV_STATUS_LIMITED_REGIONAL";
      break;
    case 4:
      int v4 = @"SYS_SRV_STATUS_PWR_SAVE";
      break;
    case 5:
      int v4 = @"SYS_SRV_STATUS_MAX";
      break;
    default:
      if (a3 == 100)
      {
        int v4 = @"SYS_SRV_STATUS_LOW_POWER_MODE";
      }
      else if (a3 == 101)
      {
        int v4 = @"SYS_SRV_STATUS_CMAS_ONLY_MODE";
      }
      else
      {
        int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_29:
      }
      break;
  }
  return v4;
}

- (int)StringAsSrvStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_SRV_STATUS_NONE"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"SYS_SRV_STATUS_NO_SRV"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_SRV_STATUS_LIMITED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_SRV_STATUS_SRV"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYS_SRV_STATUS_LIMITED_REGIONAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_SRV_STATUS_PWR_SAVE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SYS_SRV_STATUS_MAX"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SYS_SRV_STATUS_LOW_POWER_MODE"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"SYS_SRV_STATUS_CMAS_ONLY_MODE"])
  {
    int v4 = 101;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (int)srvDomain
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_srvDomain;
  }
  else {
    return -1;
  }
}

- (void)setSrvDomain:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_srvDomain = a3;
}

- (void)setHasSrvDomain:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSrvDomain
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)srvDomainAsString:(int)a3
{
  if ((a3 + 1) >= 7)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_1002872B8 + a3 + 1);
  }

  return v3;
}

- (int)StringAsSrvDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_SRV_DOMAIN_NONE"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"SYS_SRV_DOMAIN_NO_SRV"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_SRV_DOMAIN_CS_ONLY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_SRV_DOMAIN_PS_ONLY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYS_SRV_DOMAIN_CS_PS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_SRV_DOMAIN_CAMPED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SYS_SRV_DOMAIN_MAX"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (int)roamStatus
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_roamStatus;
  }
  else {
    return -1;
  }
}

- (void)setRoamStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_roamStatus = a3;
}

- (void)setHasRoamStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRoamStatus
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)roamStatusAsString:(int)a3
{
  int v4 = @"SYS_ROAM_STATUS_NONE";
  switch(a3)
  {
    case -1:
      goto LABEL_46;
    case 0:
      int v4 = @"SYS_ROAM_STATUS_OFF";
      break;
    case 1:
      int v4 = @"SYS_ROAM_STATUS_ON";
      break;
    case 2:
      int v4 = @"SYS_ROAM_STATUS_BLINK";
      break;
    case 3:
      int v4 = @"SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD";
      break;
    case 4:
      int v4 = @"SYS_ROAM_STATUS_OUT_OF_BLDG";
      break;
    case 5:
      int v4 = @"SYS_ROAM_STATUS_PREF_SYS";
      break;
    case 6:
      int v4 = @"SYS_ROAM_STATUS_AVAIL_SYS";
      break;
    case 7:
      int v4 = @"SYS_ROAM_STATUS_ALLIANCE_PARTNER";
      break;
    case 8:
      int v4 = @"SYS_ROAM_STATUS_PREMIUM_PARTNER";
      break;
    case 9:
      int v4 = @"SYS_ROAM_STATUS_FULL_SVC";
      break;
    case 10:
      int v4 = @"SYS_ROAM_STATUS_PARTIAL_SVC";
      break;
    case 11:
      int v4 = @"SYS_ROAM_STATUS_BANNER_ON";
      break;
    case 12:
      int v4 = @"SYS_ROAM_STATUS_BANNER_OFF";
      break;
    default:
      if (a3 == 64)
      {
        int v4 = @"SYS_ROAM_STATUS_HOME_SYSTEM";
      }
      else
      {
        int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
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

- (void)setDurationMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDurationMs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularServiceStatus;
  __int16 v3 = [(CellularServiceStatus *)&v7 description];
  int v4 = [(CellularServiceStatus *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v11 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v11 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  uint64_t sysMode = self->_sysMode;
  if sysMode < 0x10 && ((0x9FFFu >> sysMode))
  {
    v13 = *(&off_100287238 + sysMode);
  }
  else
  {
    v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_sysMode];
  }
  [v3 setObject:v13 forKey:@"sys_mode"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_41;
  }
LABEL_28:
  int srvStatus = self->_srvStatus;
  v17 = @"SYS_SRV_STATUS_NONE";
  switch(srvStatus)
  {
    case -1:
      break;
    case 0:
      v17 = @"SYS_SRV_STATUS_NO_SRV";
      break;
    case 1:
      v17 = @"SYS_SRV_STATUS_LIMITED";
      break;
    case 2:
      v17 = @"SYS_SRV_STATUS_SRV";
      break;
    case 3:
      v17 = @"SYS_SRV_STATUS_LIMITED_REGIONAL";
      break;
    case 4:
      v17 = @"SYS_SRV_STATUS_PWR_SAVE";
      break;
    case 5:
      v17 = @"SYS_SRV_STATUS_MAX";
      break;
    default:
      if (srvStatus == 100)
      {
        v17 = @"SYS_SRV_STATUS_LOW_POWER_MODE";
      }
      else if (srvStatus == 101)
      {
        v17 = @"SYS_SRV_STATUS_CMAS_ONLY_MODE";
      }
      else
      {
        v17 = +[NSString stringWithFormat:@"(unknown: %i)", self->_srvStatus];
      }
      break;
  }
  [v3 setObject:v17 forKey:@"srv_status"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_45;
  }
LABEL_41:
  int v18 = self->_srvDomain + 1;
  if (v18 >= 7)
  {
    v19 = +[NSString stringWithFormat:@"(unknown: %i)", self->_srvDomain];
  }
  else
  {
    v19 = *(&off_1002872B8 + v18);
  }
  [v3 setObject:v19 forKey:@"srv_domain"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_45:
  int roamStatus = self->_roamStatus;
  v21 = @"SYS_ROAM_STATUS_NONE";
  switch(roamStatus)
  {
    case -1:
      break;
    case 0:
      v21 = @"SYS_ROAM_STATUS_OFF";
      break;
    case 1:
      v21 = @"SYS_ROAM_STATUS_ON";
      break;
    case 2:
      v21 = @"SYS_ROAM_STATUS_BLINK";
      break;
    case 3:
      v21 = @"SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD";
      break;
    case 4:
      v21 = @"SYS_ROAM_STATUS_OUT_OF_BLDG";
      break;
    case 5:
      v21 = @"SYS_ROAM_STATUS_PREF_SYS";
      break;
    case 6:
      v21 = @"SYS_ROAM_STATUS_AVAIL_SYS";
      break;
    case 7:
      v21 = @"SYS_ROAM_STATUS_ALLIANCE_PARTNER";
      break;
    case 8:
      v21 = @"SYS_ROAM_STATUS_PREMIUM_PARTNER";
      break;
    case 9:
      v21 = @"SYS_ROAM_STATUS_FULL_SVC";
      break;
    case 10:
      v21 = @"SYS_ROAM_STATUS_PARTIAL_SVC";
      break;
    case 11:
      v21 = @"SYS_ROAM_STATUS_BANNER_ON";
      break;
    case 12:
      v21 = @"SYS_ROAM_STATUS_BANNER_OFF";
      break;
    default:
      if (roamStatus == 64)
      {
        v21 = @"SYS_ROAM_STATUS_HOME_SYSTEM";
      }
      else
      {
        v21 = +[NSString stringWithFormat:@"(unknown: %i)", self->_roamStatus];
      }
      break;
  }
  [v3 setObject:v21 forKey:@"roam_status"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    v5 = +[NSNumber numberWithUnsignedInt:self->_durationMs];
    [v3 setObject:v5 forKey:@"duration_ms"];
  }
LABEL_8:
  simHplmn = self->_simHplmn;
  if (simHplmn) {
    [v3 setObject:simHplmn forKey:@"sim_hplmn"];
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x80) != 0)
  {
    v14 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v14 forKey:@"subs_id"];

    __int16 v7 = (__int16)self->_has;
    if ((v7 & 4) == 0)
    {
LABEL_12:
      if ((v7 & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_12;
  }
  v15 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v15 forKey:@"num_subs"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    v8 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v8 forKey:@"ps_pref"];
  }
LABEL_14:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004EA80((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  id v7 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
LABEL_8:
  if (self->_simHplmn)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_12:
      if ((v6 & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
LABEL_14:
  if (self->_plmn)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 32) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 15) = self->_sysMode;
  *((_WORD *)v4 + 32) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 13) = self->_srvStatus;
  *((_WORD *)v4 + 32) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 12) = self->_srvDomain;
  *((_WORD *)v4 + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_23:
  *((_DWORD *)v4 + 9) = self->_roamStatus;
  *((_WORD *)v4 + 32) |= 0x10u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 4) = self->_durationMs;
    *((_WORD *)v4 + 32) |= 2u;
  }
LABEL_8:
  id v7 = v4;
  if (self->_simHplmn)
  {
    [v4 setSimHplmn:];
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_subsId;
    *((_WORD *)v4 + 32) |= 0x80u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_12:
      if ((v6 & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v4 + 5) = self->_numSubs;
  *((_WORD *)v4 + 32) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 8) = self->_psPref;
    *((_WORD *)v4 + 32) |= 8u;
  }
LABEL_14:
  if (self->_plmn)
  {
    [v7 setPlmn:];
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 32) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 15) = self->_sysMode;
  *((_WORD *)v5 + 32) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v5 + 13) = self->_srvStatus;
  *((_WORD *)v5 + 32) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v5 + 12) = self->_srvDomain;
  *((_WORD *)v5 + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  *((_DWORD *)v5 + 9) = self->_roamStatus;
  *((_WORD *)v5 + 32) |= 0x10u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 4) = self->_durationMs;
    *((_WORD *)v5 + 32) |= 2u;
  }
LABEL_8:
  id v8 = [(NSData *)self->_simHplmn copyWithZone:a3];
  v9 = (void *)v6[5];
  v6[5] = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x80) == 0)
  {
    if ((v10 & 4) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    *((_DWORD *)v6 + 5) = self->_numSubs;
    *((_WORD *)v6 + 32) |= 4u;
    if ((*(_WORD *)&self->_has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  *((_DWORD *)v6 + 14) = self->_subsId;
  *((_WORD *)v6 + 32) |= 0x80u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 4) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((v10 & 8) != 0)
  {
LABEL_11:
    *((_DWORD *)v6 + 8) = self->_psPref;
    *((_WORD *)v6 + 32) |= 8u;
  }
LABEL_12:
  id v11 = [(NSData *)self->_plmn copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 32);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_52;
    }
  }
  else if (v6)
  {
    goto LABEL_52;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_sysMode != *((_DWORD *)v4 + 15)) {
      goto LABEL_52;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_srvStatus != *((_DWORD *)v4 + 13)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_srvDomain != *((_DWORD *)v4 + 12)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_roamStatus != *((_DWORD *)v4 + 9)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_durationMs != *((_DWORD *)v4 + 4)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_52;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](simHplmn, "isEqual:"))
    {
LABEL_52:
      unsigned __int8 v10 = 0;
      goto LABEL_53;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v8 = *((_WORD *)v4 + 32);
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_subsId != *((_DWORD *)v4 + 14)) {
      goto LABEL_52;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_numSubs != *((_DWORD *)v4 + 5)) {
      goto LABEL_52;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_psPref != *((_DWORD *)v4 + 8)) {
      goto LABEL_52;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_52;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 3)) {
    unsigned __int8 v10 = -[NSData isEqual:](plmn, "isEqual:");
  }
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_53:

  return v10;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_sysMode;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_srvStatus;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_srvDomain;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v8 = 0;
    if ((has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v7 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_roamStatus;
  if ((has & 2) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_durationMs;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v9 = 0;
LABEL_14:
  unint64_t v10 = (unint64_t)[(NSData *)self->_simHplmn hash];
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x80) == 0)
  {
    uint64_t v12 = 0;
    if ((v11 & 4) != 0) {
      goto LABEL_16;
    }
LABEL_19:
    uint64_t v13 = 0;
    if ((v11 & 8) != 0) {
      goto LABEL_17;
    }
LABEL_20:
    uint64_t v14 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v12 ^ v13 ^ v14 ^ v10 ^ (unint64_t)[(NSData *)self->_plmn hash];
  }
  uint64_t v12 = 2654435761 * self->_subsId;
  if ((v11 & 4) == 0) {
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v13 = 2654435761 * self->_numSubs;
  if ((v11 & 8) == 0) {
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v14 = 2654435761 * self->_psPref;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v12 ^ v13 ^ v14 ^ v10 ^ (unint64_t)[(NSData *)self->_plmn hash];
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
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t sysMode = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_int srvStatus = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_srvDomain = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_23:
  self->_int roamStatus = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 32) & 2) != 0)
  {
LABEL_7:
    self->_durationMs = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_8:
  id v7 = v4;
  if (*((void *)v4 + 5))
  {
    -[CellularServiceStatus setSimHplmn:](self, "setSimHplmn:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x80) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v6 = *((_WORD *)v4 + 32);
    if ((v6 & 4) == 0)
    {
LABEL_12:
      if ((v6 & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_12;
  }
  self->_numSubs = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 32) & 8) != 0)
  {
LABEL_13:
    self->_psPref = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_14:
  if (*((void *)v4 + 3))
  {
    -[CellularServiceStatus setPlmn:](self, "setPlmn:");
    id v4 = v7;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (NSData)simHplmn
{
  return self->_simHplmn;
}

- (void)setSimHplmn:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simHplmn, 0);

  objc_storeStrong((id *)&self->_plmn, 0);
}

@end