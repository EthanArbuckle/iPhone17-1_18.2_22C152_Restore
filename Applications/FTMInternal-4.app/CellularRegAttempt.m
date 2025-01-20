@interface CellularRegAttempt
- (BOOL)hasActiveRat;
- (BOOL)hasAttemptedPlmn;
- (BOOL)hasAttemptedPlmnCategory;
- (BOOL)hasBdStat;
- (BOOL)hasCellId;
- (BOOL)hasDlFreq;
- (BOOL)hasFreqBandInd;
- (BOOL)hasHplmn;
- (BOOL)hasHplmnScanAttemptsDisallowedDueToBl;
- (BOOL)hasHplmnScanDuration;
- (BOOL)hasHplmnScanNumOfAttempts;
- (BOOL)hasHplmnSearchPeriod;
- (BOOL)hasIsEhplmn;
- (BOOL)hasIsHplmn;
- (BOOL)hasIsHplmnScanTriggered;
- (BOOL)hasIsPlmnForbiden;
- (BOOL)hasIsRegAccepted;
- (BOOL)hasIsRoamingSteererPlmn;
- (BOOL)hasLac;
- (BOOL)hasRegServiceDomain;
- (BOOL)hasRejectCause;
- (BOOL)hasRoamingDuration;
- (BOOL)hasServiceStatus;
- (BOOL)hasTimestamp;
- (BOOL)isEhplmn;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHplmn;
- (BOOL)isHplmnScanTriggered;
- (BOOL)isPlmnForbiden;
- (BOOL)isRegAccepted;
- (BOOL)isRoamingSteererPlmn;
- (BOOL)readFrom:(id)a3;
- (BorderDbStat)bdStat;
- (NSData)attemptedPlmn;
- (NSData)hplmn;
- (id)activeRatAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)regServiceDomainAsString:(int)a3;
- (id)serviceStatusAsString:(int)a3;
- (int)StringAsActiveRat:(id)a3;
- (int)StringAsRegServiceDomain:(id)a3;
- (int)StringAsServiceStatus:(id)a3;
- (int)activeRat;
- (int)regServiceDomain;
- (int)serviceStatus;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)attemptedPlmnCategory;
- (unsigned)cellId;
- (unsigned)dlFreq;
- (unsigned)freqBandInd;
- (unsigned)hplmnScanAttemptsDisallowedDueToBl;
- (unsigned)hplmnScanDuration;
- (unsigned)hplmnScanNumOfAttempts;
- (unsigned)hplmnSearchPeriod;
- (unsigned)lac;
- (unsigned)rejectCause;
- (unsigned)roamingDuration;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveRat:(int)a3;
- (void)setAttemptedPlmn:(id)a3;
- (void)setAttemptedPlmnCategory:(unsigned int)a3;
- (void)setBdStat:(id)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setDlFreq:(unsigned int)a3;
- (void)setFreqBandInd:(unsigned int)a3;
- (void)setHasActiveRat:(BOOL)a3;
- (void)setHasAttemptedPlmnCategory:(BOOL)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasDlFreq:(BOOL)a3;
- (void)setHasFreqBandInd:(BOOL)a3;
- (void)setHasHplmnScanAttemptsDisallowedDueToBl:(BOOL)a3;
- (void)setHasHplmnScanDuration:(BOOL)a3;
- (void)setHasHplmnScanNumOfAttempts:(BOOL)a3;
- (void)setHasHplmnSearchPeriod:(BOOL)a3;
- (void)setHasIsEhplmn:(BOOL)a3;
- (void)setHasIsHplmn:(BOOL)a3;
- (void)setHasIsHplmnScanTriggered:(BOOL)a3;
- (void)setHasIsPlmnForbiden:(BOOL)a3;
- (void)setHasIsRegAccepted:(BOOL)a3;
- (void)setHasIsRoamingSteererPlmn:(BOOL)a3;
- (void)setHasLac:(BOOL)a3;
- (void)setHasRegServiceDomain:(BOOL)a3;
- (void)setHasRejectCause:(BOOL)a3;
- (void)setHasRoamingDuration:(BOOL)a3;
- (void)setHasServiceStatus:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHplmn:(id)a3;
- (void)setHplmnScanAttemptsDisallowedDueToBl:(unsigned int)a3;
- (void)setHplmnScanDuration:(unsigned int)a3;
- (void)setHplmnScanNumOfAttempts:(unsigned int)a3;
- (void)setHplmnSearchPeriod:(unsigned int)a3;
- (void)setIsEhplmn:(BOOL)a3;
- (void)setIsHplmn:(BOOL)a3;
- (void)setIsHplmnScanTriggered:(BOOL)a3;
- (void)setIsPlmnForbiden:(BOOL)a3;
- (void)setIsRegAccepted:(BOOL)a3;
- (void)setIsRoamingSteererPlmn:(BOOL)a3;
- (void)setLac:(unsigned int)a3;
- (void)setRegServiceDomain:(int)a3;
- (void)setRejectCause:(unsigned int)a3;
- (void)setRoamingDuration:(unsigned int)a3;
- (void)setServiceStatus:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularRegAttempt

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasHplmn
{
  return self->_hplmn != 0;
}

- (BOOL)hasAttemptedPlmn
{
  return self->_attemptedPlmn != 0;
}

- (void)setCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCellId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAttemptedPlmnCategory:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_attemptedPlmnCategory = a3;
}

- (void)setHasAttemptedPlmnCategory:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAttemptedPlmnCategory
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)regServiceDomain
{
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    return self->_regServiceDomain;
  }
  else {
    return -1;
  }
}

- (void)setRegServiceDomain:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_regServiceDomain = a3;
}

- (void)setHasRegServiceDomain:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRegServiceDomain
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)regServiceDomainAsString:(int)a3
{
  if ((a3 + 1) >= 7)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100287498 + a3 + 1);
  }

  return v3;
}

- (int)StringAsRegServiceDomain:(id)a3
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

- (int)activeRat
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_activeRat;
  }
  else {
    return 0;
  }
}

- (void)setActiveRat:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_activeRat = a3;
}

- (void)setHasActiveRat:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasActiveRat
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)activeRatAsString:(int)a3
{
  if (a3 >= 5)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_1002874D0 + a3);
  }

  return v3;
}

- (int)StringAsActiveRat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_RAT_GSM"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_RAT_UMTS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_RAT_LTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYS_RAT_TDS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_RAT_NR5G"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)serviceStatus
{
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    return self->_serviceStatus;
  }
  else {
    return -1;
  }
}

- (void)setServiceStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_serviceStatus = a3;
}

- (void)setHasServiceStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasServiceStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)serviceStatusAsString:(int)a3
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

- (int)StringAsServiceStatus:(id)a3
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

- (void)setRejectCause:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_rejectCause = a3;
}

- (void)setHasRejectCause:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRejectCause
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setDlFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dlFreq = a3;
}

- (void)setHasDlFreq:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDlFreq
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setFreqBandInd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_freqBandInd = a3;
}

- (void)setHasFreqBandInd:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasFreqBandInd
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLac
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setIsRegAccepted:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isRegAccepted = a3;
}

- (void)setHasIsRegAccepted:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsRegAccepted
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setIsHplmn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isHplmn = a3;
}

- (void)setHasIsHplmn:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsHplmn
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setIsEhplmn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isEhplmn = a3;
}

- (void)setHasIsEhplmn:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsEhplmn
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setIsPlmnForbiden:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isPlmnForbiden = a3;
}

- (void)setHasIsPlmnForbiden:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsPlmnForbiden
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setIsRoamingSteererPlmn:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isRoamingSteererPlmn = a3;
}

- (void)setHasIsRoamingSteererPlmn:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsRoamingSteererPlmn
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setIsHplmnScanTriggered:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isHplmnScanTriggered = a3;
}

- (void)setHasIsHplmnScanTriggered:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsHplmnScanTriggered
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRoamingDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_roamingDuration = a3;
}

- (void)setHasRoamingDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRoamingDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHplmnScanDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_hplmnScanDuration = a3;
}

- (void)setHasHplmnScanDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHplmnScanDuration
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHplmnScanNumOfAttempts:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hplmnScanNumOfAttempts = a3;
}

- (void)setHasHplmnScanNumOfAttempts:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHplmnScanNumOfAttempts
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHplmnSearchPeriod:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_hplmnSearchPeriod = a3;
}

- (void)setHasHplmnSearchPeriod:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasHplmnSearchPeriod
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHplmnScanAttemptsDisallowedDueToBl:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hplmnScanAttemptsDisallowedDueToBl = a3;
}

- (void)setHasHplmnScanAttemptsDisallowedDueToBl:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($B059C026A2D9336AAF1D1040F5C73324)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHplmnScanAttemptsDisallowedDueToBl
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasBdStat
{
  return self->_bdStat != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularRegAttempt;
  int v3 = [(CellularRegAttempt *)&v7 description];
  int v4 = [(CellularRegAttempt *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int v4 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  hplmn = self->_hplmn;
  if (hplmn) {
    [v3 setObject:hplmn forKey:@"hplmn"];
  }
  attemptedPlmn = self->_attemptedPlmn;
  if (attemptedPlmn) {
    [v3 setObject:attemptedPlmn forKey:@"attempted_plmn"];
  }
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    v12 = +[NSNumber numberWithUnsignedInt:self->_cellId];
    [v3 setObject:v12 forKey:@"cell_id"];

    $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
    if ((*(unsigned char *)&has & 4) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_10;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&has & 4) == 0)
  {
    goto LABEL_9;
  }
  v13 = +[NSNumber numberWithUnsignedInt:self->_attemptedPlmnCategory];
  [v3 setObject:v13 forKey:@"attempted_plmn_category"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_35:
  int v14 = self->_regServiceDomain + 1;
  if (v14 >= 7)
  {
    v15 = +[NSString stringWithFormat:@"(unknown: %i)", self->_regServiceDomain];
  }
  else
  {
    v15 = *(&off_100287498 + v14);
  }
  [v3 setObject:v15 forKey:@"reg_service_domain"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_39:
  uint64_t activeRat = self->_activeRat;
  if (activeRat >= 5)
  {
    v17 = +[NSString stringWithFormat:@"(unknown: %i)", self->_activeRat];
  }
  else
  {
    v17 = *(&off_1002874D0 + activeRat);
  }
  [v3 setObject:v17 forKey:@"active_rat"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_56;
  }
LABEL_43:
  int serviceStatus = self->_serviceStatus;
  v19 = @"SYS_SRV_STATUS_NONE";
  switch(serviceStatus)
  {
    case -1:
      break;
    case 0:
      v19 = @"SYS_SRV_STATUS_NO_SRV";
      break;
    case 1:
      v19 = @"SYS_SRV_STATUS_LIMITED";
      break;
    case 2:
      v19 = @"SYS_SRV_STATUS_SRV";
      break;
    case 3:
      v19 = @"SYS_SRV_STATUS_LIMITED_REGIONAL";
      break;
    case 4:
      v19 = @"SYS_SRV_STATUS_PWR_SAVE";
      break;
    case 5:
      v19 = @"SYS_SRV_STATUS_MAX";
      break;
    default:
      if (serviceStatus == 100)
      {
        v19 = @"SYS_SRV_STATUS_LOW_POWER_MODE";
      }
      else if (serviceStatus == 101)
      {
        v19 = @"SYS_SRV_STATUS_CMAS_ONLY_MODE";
      }
      else
      {
        v19 = +[NSString stringWithFormat:@"(unknown: %i)", self->_serviceStatus];
      }
      break;
  }
  [v3 setObject:v19 forKey:@"service_status"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_57;
  }
LABEL_56:
  v20 = +[NSNumber numberWithUnsignedInt:self->_rejectCause];
  [v3 setObject:v20 forKey:@"reject_cause"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_58;
  }
LABEL_57:
  v21 = +[NSNumber numberWithUnsignedInt:self->_dlFreq];
  [v3 setObject:v21 forKey:@"dl_freq"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_59;
  }
LABEL_58:
  v22 = +[NSNumber numberWithUnsignedInt:self->_freqBandInd];
  [v3 setObject:v22 forKey:@"freq_band_ind"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_60;
  }
LABEL_59:
  v23 = +[NSNumber numberWithUnsignedInt:self->_lac];
  [v3 setObject:v23 forKey:@"lac"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_61;
  }
LABEL_60:
  v24 = +[NSNumber numberWithBool:self->_isRegAccepted];
  [v3 setObject:v24 forKey:@"is_reg_accepted"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_62;
  }
LABEL_61:
  v25 = +[NSNumber numberWithBool:self->_isHplmn];
  [v3 setObject:v25 forKey:@"is_hplmn"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_63;
  }
LABEL_62:
  v26 = +[NSNumber numberWithBool:self->_isEhplmn];
  [v3 setObject:v26 forKey:@"is_ehplmn"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_64;
  }
LABEL_63:
  v27 = +[NSNumber numberWithBool:self->_isPlmnForbiden];
  [v3 setObject:v27 forKey:@"is_plmn_forbiden"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_65;
  }
LABEL_64:
  v28 = +[NSNumber numberWithBool:self->_isRoamingSteererPlmn];
  [v3 setObject:v28 forKey:@"is_roaming_steerer_plmn"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_66;
  }
LABEL_65:
  v29 = +[NSNumber numberWithBool:self->_isHplmnScanTriggered];
  [v3 setObject:v29 forKey:@"is_hplmn_scan_triggered"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_66:
  v30 = +[NSNumber numberWithUnsignedInt:self->_roamingDuration];
  [v3 setObject:v30 forKey:@"roaming_duration"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_68;
  }
LABEL_67:
  v31 = +[NSNumber numberWithUnsignedInt:self->_hplmnScanDuration];
  [v3 setObject:v31 forKey:@"hplmn_scan_duration"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_69;
  }
LABEL_68:
  v32 = +[NSNumber numberWithUnsignedInt:self->_hplmnScanNumOfAttempts];
  [v3 setObject:v32 forKey:@"hplmn_scan_num_of_attempts"];

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_69:
  v33 = +[NSNumber numberWithUnsignedInt:self->_hplmnSearchPeriod];
  [v3 setObject:v33 forKey:@"hplmn_search_period"];

  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_27:
    v8 = +[NSNumber numberWithUnsignedInt:self->_hplmnScanAttemptsDisallowedDueToBl];
    [v3 setObject:v8 forKey:@"hplmn_scan_attempts_disallowed_due_to_bl"];
  }
LABEL_28:
  bdStat = self->_bdStat;
  if (bdStat)
  {
    v10 = [(BorderDbStat *)bdStat dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"bd_stat"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10007384C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_hplmn)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_attemptedPlmn)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
    if ((*(unsigned char *)&has & 4) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_10;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_27:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_28:
  if (self->_bdStat)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 29) |= 1u;
  }
  id v6 = v4;
  if (self->_hplmn)
  {
    [v4 setHplmn];
    id v4 = v6;
  }
  if (self->_attemptedPlmn)
  {
    [v6 setAttemptedPlmn];
    id v4 = v6;
  }
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_cellId;
    *((_DWORD *)v4 + 29) |= 8u;
    $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
    if ((*(unsigned char *)&has & 4) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_10;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 8) = self->_attemptedPlmnCategory;
  *((_DWORD *)v4 + 29) |= 4u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 23) = self->_regServiceDomain;
  *((_DWORD *)v4 + 29) |= 0x800u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 4) = self->_activeRat;
  *((_DWORD *)v4 + 29) |= 2u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 26) = self->_serviceStatus;
  *((_DWORD *)v4 + 29) |= 0x4000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 24) = self->_rejectCause;
  *((_DWORD *)v4 + 29) |= 0x1000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 13) = self->_dlFreq;
  *((_DWORD *)v4 + 29) |= 0x10u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 14) = self->_freqBandInd;
  *((_DWORD *)v4 + 29) |= 0x20u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 22) = self->_lac;
  *((_DWORD *)v4 + 29) |= 0x400u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((unsigned char *)v4 + 112) = self->_isRegAccepted;
  *((_DWORD *)v4 + 29) |= 0x80000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((unsigned char *)v4 + 109) = self->_isHplmn;
  *((_DWORD *)v4 + 29) |= 0x10000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((unsigned char *)v4 + 108) = self->_isEhplmn;
  *((_DWORD *)v4 + 29) |= 0x8000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((unsigned char *)v4 + 111) = self->_isPlmnForbiden;
  *((_DWORD *)v4 + 29) |= 0x40000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((unsigned char *)v4 + 113) = self->_isRoamingSteererPlmn;
  *((_DWORD *)v4 + 29) |= 0x100000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((unsigned char *)v4 + 110) = self->_isHplmnScanTriggered;
  *((_DWORD *)v4 + 29) |= 0x20000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 25) = self->_roamingDuration;
  *((_DWORD *)v4 + 29) |= 0x2000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 19) = self->_hplmnScanDuration;
  *((_DWORD *)v4 + 29) |= 0x80u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 20) = self->_hplmnScanNumOfAttempts;
  *((_DWORD *)v4 + 29) |= 0x100u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_51:
  *((_DWORD *)v4 + 21) = self->_hplmnSearchPeriod;
  *((_DWORD *)v4 + 29) |= 0x200u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_27:
    *((_DWORD *)v4 + 18) = self->_hplmnScanAttemptsDisallowedDueToBl;
    *((_DWORD *)v4 + 29) |= 0x40u;
  }
LABEL_28:
  if (self->_bdStat)
  {
    [v6 setBdStat:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 29) |= 1u;
  }
  id v7 = [(NSData *)self->_hplmn copyWithZone:a3];
  v8 = (void *)v6[8];
  v6[8] = v7;

  id v9 = [(NSData *)self->_attemptedPlmn copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_cellId;
    *((_DWORD *)v6 + 29) |= 8u;
    $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
    if ((*(unsigned char *)&has & 4) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_6;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 8) = self->_attemptedPlmnCategory;
  *((_DWORD *)v6 + 29) |= 4u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v6 + 23) = self->_regServiceDomain;
  *((_DWORD *)v6 + 29) |= 0x800u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v6 + 4) = self->_activeRat;
  *((_DWORD *)v6 + 29) |= 2u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v6 + 26) = self->_serviceStatus;
  *((_DWORD *)v6 + 29) |= 0x4000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v6 + 24) = self->_rejectCause;
  *((_DWORD *)v6 + 29) |= 0x1000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v6 + 13) = self->_dlFreq;
  *((_DWORD *)v6 + 29) |= 0x10u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v6 + 14) = self->_freqBandInd;
  *((_DWORD *)v6 + 29) |= 0x20u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v6 + 22) = self->_lac;
  *((_DWORD *)v6 + 29) |= 0x400u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((unsigned char *)v6 + 112) = self->_isRegAccepted;
  *((_DWORD *)v6 + 29) |= 0x80000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((unsigned char *)v6 + 109) = self->_isHplmn;
  *((_DWORD *)v6 + 29) |= 0x10000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((unsigned char *)v6 + 108) = self->_isEhplmn;
  *((_DWORD *)v6 + 29) |= 0x8000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((unsigned char *)v6 + 111) = self->_isPlmnForbiden;
  *((_DWORD *)v6 + 29) |= 0x40000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((unsigned char *)v6 + 113) = self->_isRoamingSteererPlmn;
  *((_DWORD *)v6 + 29) |= 0x100000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((unsigned char *)v6 + 110) = self->_isHplmnScanTriggered;
  *((_DWORD *)v6 + 29) |= 0x20000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v6 + 25) = self->_roamingDuration;
  *((_DWORD *)v6 + 29) |= 0x2000u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v6 + 19) = self->_hplmnScanDuration;
  *((_DWORD *)v6 + 29) |= 0x80u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_22;
    }
LABEL_43:
    *((_DWORD *)v6 + 21) = self->_hplmnSearchPeriod;
    *((_DWORD *)v6 + 29) |= 0x200u;
    if ((*(_DWORD *)&self->_has & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_42:
  *((_DWORD *)v6 + 20) = self->_hplmnScanNumOfAttempts;
  *((_DWORD *)v6 + 29) |= 0x100u;
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0) {
    goto LABEL_43;
  }
LABEL_22:
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_23:
    *((_DWORD *)v6 + 18) = self->_hplmnScanAttemptsDisallowedDueToBl;
    *((_DWORD *)v6 + 29) |= 0x40u;
  }
LABEL_24:
  id v12 = [(BorderDbStat *)self->_bdStat copyWithZone:a3];
  v13 = (void *)v6[5];
  v6[5] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_131;
  }
  int v5 = *((_DWORD *)v4 + 29);
  if (*(unsigned char *)&self->_has)
  {
    if ((v5 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_131;
    }
  }
  else if (v5)
  {
    goto LABEL_131;
  }
  hplmn = self->_hplmn;
  if ((unint64_t)hplmn | *((void *)v4 + 8) && !-[NSData isEqual:](hplmn, "isEqual:")) {
    goto LABEL_131;
  }
  attemptedPlmn = self->_attemptedPlmn;
  if ((unint64_t)attemptedPlmn | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](attemptedPlmn, "isEqual:")) {
      goto LABEL_131;
    }
  }
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  int v9 = *((_DWORD *)v4 + 29);
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_cellId != *((_DWORD *)v4 + 12)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_131;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_attemptedPlmnCategory != *((_DWORD *)v4 + 8)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_regServiceDomain != *((_DWORD *)v4 + 23)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x800) != 0)
  {
    goto LABEL_131;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_activeRat != *((_DWORD *)v4 + 4)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0 || self->_serviceStatus != *((_DWORD *)v4 + 26)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_rejectCause != *((_DWORD *)v4 + 24)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_dlFreq != *((_DWORD *)v4 + 13)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_131;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 14)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v9 & 0x400) == 0 || self->_lac != *((_DWORD *)v4 + 22)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x400) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v9 & 0x80000) == 0) {
      goto LABEL_131;
    }
    if (self->_isRegAccepted)
    {
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_131;
      }
    }
    else if (*((unsigned char *)v4 + 112))
    {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x80000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0) {
      goto LABEL_131;
    }
    if (self->_isHplmn)
    {
      if (!*((unsigned char *)v4 + 109)) {
        goto LABEL_131;
      }
    }
    else if (*((unsigned char *)v4 + 109))
    {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x10000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v9 & 0x8000) == 0) {
      goto LABEL_131;
    }
    if (self->_isEhplmn)
    {
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_131;
      }
    }
    else if (*((unsigned char *)v4 + 108))
    {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x8000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v9 & 0x40000) == 0) {
      goto LABEL_131;
    }
    if (self->_isPlmnForbiden)
    {
      if (!*((unsigned char *)v4 + 111)) {
        goto LABEL_131;
      }
    }
    else if (*((unsigned char *)v4 + 111))
    {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x40000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v9 & 0x100000) == 0) {
      goto LABEL_131;
    }
    if (self->_isRoamingSteererPlmn)
    {
      if (!*((unsigned char *)v4 + 113)) {
        goto LABEL_131;
      }
    }
    else if (*((unsigned char *)v4 + 113))
    {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x100000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v9 & 0x20000) != 0)
    {
      if (self->_isHplmnScanTriggered)
      {
        if (!*((unsigned char *)v4 + 110)) {
          goto LABEL_131;
        }
        goto LABEL_104;
      }
      if (!*((unsigned char *)v4 + 110)) {
        goto LABEL_104;
      }
    }
LABEL_131:
    unsigned __int8 v11 = 0;
    goto LABEL_132;
  }
  if ((v9 & 0x20000) != 0) {
    goto LABEL_131;
  }
LABEL_104:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_roamingDuration != *((_DWORD *)v4 + 25)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_hplmnScanDuration != *((_DWORD *)v4 + 19)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0 || self->_hplmnScanNumOfAttempts != *((_DWORD *)v4 + 20)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v9 & 0x200) == 0 || self->_hplmnSearchPeriod != *((_DWORD *)v4 + 21)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x200) != 0)
  {
    goto LABEL_131;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_hplmnScanAttemptsDisallowedDueToBl != *((_DWORD *)v4 + 18)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_131;
  }
  bdStat = self->_bdStat;
  if ((unint64_t)bdStat | *((void *)v4 + 5)) {
    unsigned __int8 v11 = -[BorderDbStat isEqual:](bdStat, "isEqual:");
  }
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_132:

  return v11;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSData *)self->_hplmn hash];
  unint64_t v5 = (unint64_t)[(NSData *)self->_attemptedPlmn hash];
  $B059C026A2D9336AAF1D1040F5C73324 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    uint64_t v7 = 2654435761 * self->_cellId;
    if ((*(unsigned char *)&has & 4) != 0)
    {
LABEL_6:
      uint64_t v8 = 2654435761 * self->_attemptedPlmnCategory;
      if ((*(_WORD *)&has & 0x800) != 0) {
        goto LABEL_7;
      }
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_regServiceDomain;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_8:
    uint64_t v10 = 2654435761 * self->_activeRat;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v10 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    uint64_t v11 = 2654435761 * self->_serviceStatus;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_10:
    uint64_t v12 = 2654435761 * self->_rejectCause;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v12 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_11:
    uint64_t v13 = 2654435761 * self->_dlFreq;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v13 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_12:
    uint64_t v14 = 2654435761 * self->_freqBandInd;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v14 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_13:
    uint64_t v15 = 2654435761 * self->_lac;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_14:
    uint64_t v16 = 2654435761 * self->_isRegAccepted;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_15:
    uint64_t v17 = 2654435761 * self->_isHplmn;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_16:
    uint64_t v18 = 2654435761 * self->_isEhplmn;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_17:
    uint64_t v19 = 2654435761 * self->_isPlmnForbiden;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_18:
    uint64_t v20 = 2654435761 * self->_isRoamingSteererPlmn;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v20 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_19:
    uint64_t v21 = 2654435761 * self->_isHplmnScanTriggered;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v21 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_20:
    uint64_t v22 = 2654435761 * self->_roamingDuration;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_21;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v22 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_21:
    uint64_t v23 = 2654435761 * self->_hplmnScanDuration;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_22;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v23 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_22:
    uint64_t v24 = 2654435761 * self->_hplmnScanNumOfAttempts;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_23;
    }
LABEL_43:
    uint64_t v25 = 0;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_24;
    }
LABEL_44:
    uint64_t v26 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ [(BorderDbStat *)self->_bdStat hash];
  }
LABEL_42:
  uint64_t v24 = 0;
  if ((*(_WORD *)&has & 0x200) == 0) {
    goto LABEL_43;
  }
LABEL_23:
  uint64_t v25 = 2654435761 * self->_hplmnSearchPeriod;
  if ((*(unsigned char *)&has & 0x40) == 0) {
    goto LABEL_44;
  }
LABEL_24:
  uint64_t v26 = 2654435761 * self->_hplmnScanAttemptsDisallowedDueToBl;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ [(BorderDbStat *)self->_bdStat hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  unint64_t v5 = v4;
  if (*((unsigned char *)v4 + 116))
  {
    self->_timestamp = v4[1];
    *(_DWORD *)&self->_has |= 1u;
  }
  uint64_t v9 = v4;
  if (v4[8])
  {
    -[CellularRegAttempt setHplmn:](self, "setHplmn:");
    unint64_t v5 = v9;
  }
  if (v5[3])
  {
    -[CellularRegAttempt setAttemptedPlmn:](self, "setAttemptedPlmn:");
    unint64_t v5 = v9;
  }
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 8) != 0)
  {
    self->_cellId = *((_DWORD *)v5 + 12);
    *(_DWORD *)&self->_has |= 8u;
    int v6 = *((_DWORD *)v5 + 29);
    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 0x800) == 0) {
        goto LABEL_10;
      }
      goto LABEL_33;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_attemptedPlmnCategory = *((_DWORD *)v5 + 8);
  *(_DWORD *)&self->_has |= 4u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x800) == 0)
  {
LABEL_10:
    if ((v6 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_regServiceDomain = *((_DWORD *)v5 + 23);
  *(_DWORD *)&self->_has |= 0x800u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 2) == 0)
  {
LABEL_11:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_uint64_t activeRat = *((_DWORD *)v5 + 4);
  *(_DWORD *)&self->_has |= 2u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x4000) == 0)
  {
LABEL_12:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_int serviceStatus = *((_DWORD *)v5 + 26);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x1000) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_rejectCause = *((_DWORD *)v5 + 24);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x10) == 0)
  {
LABEL_14:
    if ((v6 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_dlFreq = *((_DWORD *)v5 + 13);
  *(_DWORD *)&self->_has |= 0x10u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x20) == 0)
  {
LABEL_15:
    if ((v6 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_freqBandInd = *((_DWORD *)v5 + 14);
  *(_DWORD *)&self->_has |= 0x20u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x400) == 0)
  {
LABEL_16:
    if ((v6 & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_lac = *((_DWORD *)v5 + 22);
  *(_DWORD *)&self->_has |= 0x400u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x80000) == 0)
  {
LABEL_17:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_isRegAccepted = *((unsigned char *)v5 + 112);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x10000) == 0)
  {
LABEL_18:
    if ((v6 & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_isHplmn = *((unsigned char *)v5 + 109);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x8000) == 0)
  {
LABEL_19:
    if ((v6 & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_isEhplmn = *((unsigned char *)v5 + 108);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x40000) == 0)
  {
LABEL_20:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_isPlmnForbiden = *((unsigned char *)v5 + 111);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x100000) == 0)
  {
LABEL_21:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_isRoamingSteererPlmn = *((unsigned char *)v5 + 113);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x20000) == 0)
  {
LABEL_22:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_isHplmnScanTriggered = *((unsigned char *)v5 + 110);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x2000) == 0)
  {
LABEL_23:
    if ((v6 & 0x80) == 0) {
      goto LABEL_24;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_roamingDuration = *((_DWORD *)v5 + 25);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x80) == 0)
  {
LABEL_24:
    if ((v6 & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_hplmnScanDuration = *((_DWORD *)v5 + 19);
  *(_DWORD *)&self->_has |= 0x80u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x100) == 0)
  {
LABEL_25:
    if ((v6 & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_hplmnScanNumOfAttempts = *((_DWORD *)v5 + 20);
  *(_DWORD *)&self->_has |= 0x100u;
  int v6 = *((_DWORD *)v5 + 29);
  if ((v6 & 0x200) == 0)
  {
LABEL_26:
    if ((v6 & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_49:
  self->_hplmnSearchPeriod = *((_DWORD *)v5 + 21);
  *(_DWORD *)&self->_has |= 0x200u;
  if ((*((_DWORD *)v5 + 29) & 0x40) != 0)
  {
LABEL_27:
    self->_hplmnScanAttemptsDisallowedDueToBl = *((_DWORD *)v5 + 18);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_28:
  bdStat = self->_bdStat;
  uint64_t v8 = v5[5];
  if (bdStat)
  {
    if (v8) {
      -[BorderDbStat mergeFrom:](bdStat, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[CellularRegAttempt setBdStat:](self, "setBdStat:");
  }

  _objc_release_x1();
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)hplmn
{
  return self->_hplmn;
}

- (void)setHplmn:(id)a3
{
}

- (NSData)attemptedPlmn
{
  return self->_attemptedPlmn;
}

- (void)setAttemptedPlmn:(id)a3
{
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)attemptedPlmnCategory
{
  return self->_attemptedPlmnCategory;
}

- (unsigned)rejectCause
{
  return self->_rejectCause;
}

- (unsigned)dlFreq
{
  return self->_dlFreq;
}

- (unsigned)freqBandInd
{
  return self->_freqBandInd;
}

- (unsigned)lac
{
  return self->_lac;
}

- (BOOL)isRegAccepted
{
  return self->_isRegAccepted;
}

- (BOOL)isHplmn
{
  return self->_isHplmn;
}

- (BOOL)isEhplmn
{
  return self->_isEhplmn;
}

- (BOOL)isPlmnForbiden
{
  return self->_isPlmnForbiden;
}

- (BOOL)isRoamingSteererPlmn
{
  return self->_isRoamingSteererPlmn;
}

- (BOOL)isHplmnScanTriggered
{
  return self->_isHplmnScanTriggered;
}

- (unsigned)roamingDuration
{
  return self->_roamingDuration;
}

- (unsigned)hplmnScanDuration
{
  return self->_hplmnScanDuration;
}

- (unsigned)hplmnScanNumOfAttempts
{
  return self->_hplmnScanNumOfAttempts;
}

- (unsigned)hplmnSearchPeriod
{
  return self->_hplmnSearchPeriod;
}

- (unsigned)hplmnScanAttemptsDisallowedDueToBl
{
  return self->_hplmnScanAttemptsDisallowedDueToBl;
}

- (BorderDbStat)bdStat
{
  return self->_bdStat;
}

- (void)setBdStat:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hplmn, 0);
  objc_storeStrong((id *)&self->_bdStat, 0);

  objc_storeStrong((id *)&self->_attemptedPlmn, 0);
}

@end