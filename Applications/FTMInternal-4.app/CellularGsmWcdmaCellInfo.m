@interface CellularGsmWcdmaCellInfo
- (BOOL)hasCellId;
- (BOOL)hasDlUarfcn;
- (BOOL)hasFmtId;
- (BOOL)hasGsmArfcn;
- (BOOL)hasGsmBand;
- (BOOL)hasHspa;
- (BOOL)hasLac;
- (BOOL)hasMcc;
- (BOOL)hasMnc;
- (BOOL)hasNumSubs;
- (BOOL)hasPsPref;
- (BOOL)hasPsc;
- (BOOL)hasRat;
- (BOOL)hasSrvDomain;
- (BOOL)hasSrvStatus;
- (BOOL)hasSubsId;
- (BOOL)hasTdsBand;
- (BOOL)hasTimestamp;
- (BOOL)hasWcdmaBand;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)gsmBandAsString:(int)a3;
- (id)hspaAsString:(int)a3;
- (id)ratAsString:(int)a3;
- (id)srvDomainAsString:(int)a3;
- (id)srvStatusAsString:(int)a3;
- (id)tdsBandAsString:(int)a3;
- (id)wcdmaBandAsString:(int)a3;
- (int)StringAsGsmBand:(id)a3;
- (int)StringAsHspa:(id)a3;
- (int)StringAsRat:(id)a3;
- (int)StringAsSrvDomain:(id)a3;
- (int)StringAsSrvStatus:(id)a3;
- (int)StringAsTdsBand:(id)a3;
- (int)StringAsWcdmaBand:(id)a3;
- (int)gsmBand;
- (int)hspa;
- (int)rat;
- (int)srvDomain;
- (int)srvStatus;
- (int)tdsBand;
- (int)wcdmaBand;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)cellId;
- (unsigned)dlUarfcn;
- (unsigned)fmtId;
- (unsigned)gsmArfcn;
- (unsigned)lac;
- (unsigned)mcc;
- (unsigned)mnc;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)psc;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setDlUarfcn:(unsigned int)a3;
- (void)setFmtId:(unsigned int)a3;
- (void)setGsmArfcn:(unsigned int)a3;
- (void)setGsmBand:(int)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasDlUarfcn:(BOOL)a3;
- (void)setHasFmtId:(BOOL)a3;
- (void)setHasGsmArfcn:(BOOL)a3;
- (void)setHasGsmBand:(BOOL)a3;
- (void)setHasHspa:(BOOL)a3;
- (void)setHasLac:(BOOL)a3;
- (void)setHasMcc:(BOOL)a3;
- (void)setHasMnc:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasPsc:(BOOL)a3;
- (void)setHasRat:(BOOL)a3;
- (void)setHasSrvDomain:(BOOL)a3;
- (void)setHasSrvStatus:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTdsBand:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWcdmaBand:(BOOL)a3;
- (void)setHspa:(int)a3;
- (void)setLac:(unsigned int)a3;
- (void)setMcc:(unsigned int)a3;
- (void)setMnc:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setPsc:(unsigned int)a3;
- (void)setRat:(int)a3;
- (void)setSrvDomain:(int)a3;
- (void)setSrvStatus:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTdsBand:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWcdmaBand:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularGsmWcdmaCellInfo

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (int)rat
{
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    return self->_rat;
  }
  else {
    return 0;
  }
}

- (void)setRat:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRat
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)ratAsString:(int)a3
{
  if a3 < 0x10 && ((0x9FFFu >> a3))
  {
    int v3 = *(&off_100287868 + a3);
  }
  else
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsRat:(id)a3
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
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    return self->_srvStatus;
  }
  else {
    return -1;
  }
}

- (void)setSrvStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_srvStatus = a3;
}

- (void)setHasSrvStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSrvStatus
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
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
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    return self->_srvDomain;
  }
  else {
    return -1;
  }
}

- (void)setSrvDomain:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_srvDomain = a3;
}

- (void)setHasSrvDomain:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSrvDomain
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)srvDomainAsString:(int)a3
{
  if ((a3 + 1) >= 7)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_1002878E8 + a3 + 1);
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

- (void)setMcc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMcc
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMnc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLac
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCellId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)wcdmaBand
{
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    return self->_wcdmaBand;
  }
  else {
    return 0;
  }
}

- (void)setWcdmaBand:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_wcdmaBand = a3;
}

- (void)setHasWcdmaBand:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasWcdmaBand
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)wcdmaBandAsString:(int)a3
{
  int v4 = @"SYS_BAND_BC0";
  switch(a3)
  {
    case 0:
      goto LABEL_6;
    case 1:
      int v4 = @"SYS_BAND_BC1";
      break;
    case 3:
      int v4 = @"SYS_BAND_BC3";
      break;
    case 4:
      int v4 = @"SYS_BAND_BC4";
      break;
    case 5:
      int v4 = @"SYS_BAND_BC5";
      break;
    case 6:
      int v4 = @"SYS_BAND_BC6";
      break;
    case 7:
      int v4 = @"SYS_BAND_BC7";
      break;
    case 8:
      int v4 = @"SYS_BAND_BC8";
      break;
    case 9:
      int v4 = @"SYS_BAND_BC9";
      break;
    case 10:
      int v4 = @"SYS_BAND_BC10";
      break;
    case 11:
      int v4 = @"SYS_BAND_BC11";
      break;
    case 12:
      int v4 = @"SYS_BAND_BC12";
      break;
    case 13:
      int v4 = @"SYS_BAND_BC13";
      break;
    case 14:
      int v4 = @"SYS_BAND_BC14";
      break;
    case 15:
      int v4 = @"SYS_BAND_BC15";
      break;
    case 16:
      int v4 = @"SYS_BAND_BC16";
      break;
    case 17:
      int v4 = @"SYS_BAND_BC17";
      break;
    case 18:
      int v4 = @"SYS_BAND_BC18";
      break;
    case 19:
      int v4 = @"SYS_BAND_BC19";
      break;
    case 40:
      int v4 = @"SYS_BAND_GSM_450";
      break;
    case 41:
      int v4 = @"SYS_BAND_GSM_480";
      break;
    case 42:
      int v4 = @"SYS_BAND_GSM_750";
      break;
    case 43:
      int v4 = @"SYS_BAND_GSM_850";
      break;
    case 44:
      int v4 = @"SYS_BAND_GSM_EGSM_900";
      break;
    case 45:
      int v4 = @"SYS_BAND_GSM_PGSM_900";
      break;
    case 46:
      int v4 = @"SYS_BAND_GSM_RGSM_900";
      break;
    case 47:
      int v4 = @"SYS_BAND_GSM_DCS_1800";
      break;
    case 48:
      int v4 = @"SYS_BAND_GSM_PCS_1900";
      break;
    case 80:
      int v4 = @"SYS_BAND_WCDMA_I_IMT_2000";
      break;
    case 81:
      int v4 = @"SYS_BAND_WCDMA_II_PCS_1900";
      break;
    case 82:
      int v4 = @"SYS_BAND_WCDMA_III_1700";
      break;
    case 83:
      int v4 = @"SYS_BAND_WCDMA_IV_1700";
      break;
    case 84:
      int v4 = @"SYS_BAND_WCDMA_V_850";
      break;
    case 85:
      int v4 = @"SYS_BAND_WCDMA_VI_800";
      break;
    case 86:
      int v4 = @"SYS_BAND_WCDMA_VII_2600";
      break;
    case 87:
      int v4 = @"SYS_BAND_WCDMA_VIII_900";
      break;
    case 88:
      int v4 = @"SYS_BAND_WCDMA_IX_1700";
      break;
    case 90:
      int v4 = @"SYS_BAND_WCDMA_XI_1500";
      break;
    case 91:
      int v4 = @"SYS_BAND_WCDMA_XIX_850";
      break;
    case 120:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND1";
      break;
    case 121:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND2";
      break;
    case 122:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND3";
      break;
    case 123:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND4";
      break;
    case 124:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND5";
      break;
    case 125:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND6";
      break;
    case 126:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND7";
      break;
    case 127:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND8";
      break;
    case 128:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND9";
      break;
    case 129:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND10";
      break;
    case 130:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND11";
      break;
    case 131:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND12";
      break;
    case 132:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND13";
      break;
    case 133:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND14";
      break;
    case 136:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND17";
      break;
    case 137:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND18";
      break;
    case 138:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND19";
      break;
    case 139:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND20";
      break;
    case 140:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND21";
      break;
    case 143:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND24";
      break;
    case 144:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND25";
      break;
    case 145:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND26";
      break;
    case 152:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND33";
      break;
    case 153:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND34";
      break;
    case 154:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND35";
      break;
    case 155:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND36";
      break;
    case 156:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND37";
      break;
    case 157:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND38";
      break;
    case 158:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND39";
      break;
    case 159:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND40";
      break;
    case 160:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND41";
      break;
    case 161:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND42";
      break;
    case 162:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND43";
      break;
    case 163:
      int v4 = @"SYS_BAND_UMTS_BAND1";
      break;
    case 164:
      int v4 = @"SYS_BAND_UMTS_BAND2";
      break;
    case 165:
      int v4 = @"SYS_BAND_UMTS_BAND3";
      break;
    case 166:
      int v4 = @"SYS_BAND_UMTS_BAND4";
      break;
    case 167:
      int v4 = @"SYS_BAND_UMTS_BAND5";
      break;
    case 168:
      int v4 = @"SYS_BAND_UMTS_BAND6";
      break;
    default:
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_6:
      break;
  }
  return v4;
}

- (int)StringAsWcdmaBand:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_BAND_BC0"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC3"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC4"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC5"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC6"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC7"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC8"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC9"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC10"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC11"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC12"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC13"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC14"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC15"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC16"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC17"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC18"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC19"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_450"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_480"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_750"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_850"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_EGSM_900"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_PGSM_900"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_RGSM_900"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_DCS_1800"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_PCS_1900"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_I_IMT_2000"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_II_PCS_1900"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_III_1700"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_IV_1700"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_V_850"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_VI_800"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_VII_2600"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_VIII_900"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_IX_1700"])
  {
    int v4 = 88;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_XI_1500"])
  {
    int v4 = 90;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_XIX_850"])
  {
    int v4 = 91;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND1"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND2"])
  {
    int v4 = 121;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND3"])
  {
    int v4 = 122;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND4"])
  {
    int v4 = 123;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND5"])
  {
    int v4 = 124;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND6"])
  {
    int v4 = 125;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND7"])
  {
    int v4 = 126;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND8"])
  {
    int v4 = 127;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND9"])
  {
    int v4 = 128;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND10"])
  {
    int v4 = 129;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND11"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND12"])
  {
    int v4 = 131;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND13"])
  {
    int v4 = 132;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND14"])
  {
    int v4 = 133;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND17"])
  {
    int v4 = 136;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND18"])
  {
    int v4 = 137;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND19"])
  {
    int v4 = 138;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND20"])
  {
    int v4 = 139;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND21"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND24"])
  {
    int v4 = 143;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND25"])
  {
    int v4 = 144;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND26"])
  {
    int v4 = 145;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND33"])
  {
    int v4 = 152;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND34"])
  {
    int v4 = 153;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND35"])
  {
    int v4 = 154;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND36"])
  {
    int v4 = 155;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND37"])
  {
    int v4 = 156;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND38"])
  {
    int v4 = 157;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND39"])
  {
    int v4 = 158;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND40"])
  {
    int v4 = 159;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND41"])
  {
    int v4 = 160;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND42"])
  {
    int v4 = 161;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND43"])
  {
    int v4 = 162;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND1"])
  {
    int v4 = 163;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND2"])
  {
    int v4 = 164;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND3"])
  {
    int v4 = 165;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND4"])
  {
    int v4 = 166;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND5"])
  {
    int v4 = 167;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND6"])
  {
    int v4 = 168;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)tdsBand
{
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    return self->_tdsBand;
  }
  else {
    return 0;
  }
}

- (void)setTdsBand:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_tdsBand = a3;
}

- (void)setHasTdsBand:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTdsBand
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (id)tdsBandAsString:(int)a3
{
  if (a3 >= 6)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100287920 + a3);
  }

  return v3;
}

- (int)StringAsTdsBand:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_BAND_TDS_BANDA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_TDS_BANDB"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_TDS_BANDC"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_TDS_BANDD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_TDS_BANDE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_TDS_BANDF"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)hspa
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_hspa;
  }
  else {
    return -1;
  }
}

- (void)setHspa:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hspa = a3;
}

- (void)setHasHspa:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHspa
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)hspaAsString:(int)a3
{
  if ((a3 + 1) >= 8)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100287950 + a3 + 1);
  }

  return v3;
}

- (int)StringAsHspa:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_HS_IND_NONE"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"SYS_HS_IND_HSDPA_HSUPA_UNSUPP_CELL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_HS_IND_HSDPA_SUPP_CELL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_HS_IND_HSUPA_SUPP_CELL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYS_HS_IND_HSDPA_HSUPA_SUPP_CELL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_HS_IND_HSDPAPLUS_SUPP_CELL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SYS_HS_IND_HSDPAPLUS_HSUPA_SUPP_CELL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SYS_HS_IND_MAX"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (void)setDlUarfcn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_dlUarfcn = a3;
}

- (void)setHasDlUarfcn:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDlUarfcn
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPsc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPsc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (int)gsmBand
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_gsmBand;
  }
  else {
    return 0;
  }
}

- (void)setGsmBand:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_gsmBand = a3;
}

- (void)setHasGsmBand:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasGsmBand
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)gsmBandAsString:(int)a3
{
  int v4 = @"SYS_BAND_BC0";
  switch(a3)
  {
    case 0:
      goto LABEL_6;
    case 1:
      int v4 = @"SYS_BAND_BC1";
      break;
    case 3:
      int v4 = @"SYS_BAND_BC3";
      break;
    case 4:
      int v4 = @"SYS_BAND_BC4";
      break;
    case 5:
      int v4 = @"SYS_BAND_BC5";
      break;
    case 6:
      int v4 = @"SYS_BAND_BC6";
      break;
    case 7:
      int v4 = @"SYS_BAND_BC7";
      break;
    case 8:
      int v4 = @"SYS_BAND_BC8";
      break;
    case 9:
      int v4 = @"SYS_BAND_BC9";
      break;
    case 10:
      int v4 = @"SYS_BAND_BC10";
      break;
    case 11:
      int v4 = @"SYS_BAND_BC11";
      break;
    case 12:
      int v4 = @"SYS_BAND_BC12";
      break;
    case 13:
      int v4 = @"SYS_BAND_BC13";
      break;
    case 14:
      int v4 = @"SYS_BAND_BC14";
      break;
    case 15:
      int v4 = @"SYS_BAND_BC15";
      break;
    case 16:
      int v4 = @"SYS_BAND_BC16";
      break;
    case 17:
      int v4 = @"SYS_BAND_BC17";
      break;
    case 18:
      int v4 = @"SYS_BAND_BC18";
      break;
    case 19:
      int v4 = @"SYS_BAND_BC19";
      break;
    case 40:
      int v4 = @"SYS_BAND_GSM_450";
      break;
    case 41:
      int v4 = @"SYS_BAND_GSM_480";
      break;
    case 42:
      int v4 = @"SYS_BAND_GSM_750";
      break;
    case 43:
      int v4 = @"SYS_BAND_GSM_850";
      break;
    case 44:
      int v4 = @"SYS_BAND_GSM_EGSM_900";
      break;
    case 45:
      int v4 = @"SYS_BAND_GSM_PGSM_900";
      break;
    case 46:
      int v4 = @"SYS_BAND_GSM_RGSM_900";
      break;
    case 47:
      int v4 = @"SYS_BAND_GSM_DCS_1800";
      break;
    case 48:
      int v4 = @"SYS_BAND_GSM_PCS_1900";
      break;
    case 80:
      int v4 = @"SYS_BAND_WCDMA_I_IMT_2000";
      break;
    case 81:
      int v4 = @"SYS_BAND_WCDMA_II_PCS_1900";
      break;
    case 82:
      int v4 = @"SYS_BAND_WCDMA_III_1700";
      break;
    case 83:
      int v4 = @"SYS_BAND_WCDMA_IV_1700";
      break;
    case 84:
      int v4 = @"SYS_BAND_WCDMA_V_850";
      break;
    case 85:
      int v4 = @"SYS_BAND_WCDMA_VI_800";
      break;
    case 86:
      int v4 = @"SYS_BAND_WCDMA_VII_2600";
      break;
    case 87:
      int v4 = @"SYS_BAND_WCDMA_VIII_900";
      break;
    case 88:
      int v4 = @"SYS_BAND_WCDMA_IX_1700";
      break;
    case 90:
      int v4 = @"SYS_BAND_WCDMA_XI_1500";
      break;
    case 91:
      int v4 = @"SYS_BAND_WCDMA_XIX_850";
      break;
    case 120:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND1";
      break;
    case 121:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND2";
      break;
    case 122:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND3";
      break;
    case 123:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND4";
      break;
    case 124:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND5";
      break;
    case 125:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND6";
      break;
    case 126:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND7";
      break;
    case 127:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND8";
      break;
    case 128:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND9";
      break;
    case 129:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND10";
      break;
    case 130:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND11";
      break;
    case 131:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND12";
      break;
    case 132:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND13";
      break;
    case 133:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND14";
      break;
    case 136:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND17";
      break;
    case 137:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND18";
      break;
    case 138:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND19";
      break;
    case 139:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND20";
      break;
    case 140:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND21";
      break;
    case 143:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND24";
      break;
    case 144:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND25";
      break;
    case 145:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND26";
      break;
    case 152:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND33";
      break;
    case 153:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND34";
      break;
    case 154:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND35";
      break;
    case 155:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND36";
      break;
    case 156:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND37";
      break;
    case 157:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND38";
      break;
    case 158:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND39";
      break;
    case 159:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND40";
      break;
    case 160:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND41";
      break;
    case 161:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND42";
      break;
    case 162:
      int v4 = @"SYS_BAND_LTE_EUTRAN_BAND43";
      break;
    case 163:
      int v4 = @"SYS_BAND_UMTS_BAND1";
      break;
    case 164:
      int v4 = @"SYS_BAND_UMTS_BAND2";
      break;
    case 165:
      int v4 = @"SYS_BAND_UMTS_BAND3";
      break;
    case 166:
      int v4 = @"SYS_BAND_UMTS_BAND4";
      break;
    case 167:
      int v4 = @"SYS_BAND_UMTS_BAND5";
      break;
    case 168:
      int v4 = @"SYS_BAND_UMTS_BAND6";
      break;
    default:
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_6:
      break;
  }
  return v4;
}

- (int)StringAsGsmBand:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_BAND_BC0"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC3"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC4"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC5"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC6"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC7"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC8"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC9"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC10"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC11"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC12"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC13"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC14"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC15"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC16"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC17"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC18"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_BC19"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_450"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_480"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_750"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_850"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_EGSM_900"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_PGSM_900"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_RGSM_900"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_DCS_1800"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_GSM_PCS_1900"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_I_IMT_2000"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_II_PCS_1900"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_III_1700"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_IV_1700"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_V_850"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_VI_800"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_VII_2600"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_VIII_900"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_IX_1700"])
  {
    int v4 = 88;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_XI_1500"])
  {
    int v4 = 90;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_WCDMA_XIX_850"])
  {
    int v4 = 91;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND1"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND2"])
  {
    int v4 = 121;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND3"])
  {
    int v4 = 122;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND4"])
  {
    int v4 = 123;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND5"])
  {
    int v4 = 124;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND6"])
  {
    int v4 = 125;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND7"])
  {
    int v4 = 126;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND8"])
  {
    int v4 = 127;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND9"])
  {
    int v4 = 128;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND10"])
  {
    int v4 = 129;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND11"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND12"])
  {
    int v4 = 131;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND13"])
  {
    int v4 = 132;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND14"])
  {
    int v4 = 133;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND17"])
  {
    int v4 = 136;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND18"])
  {
    int v4 = 137;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND19"])
  {
    int v4 = 138;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND20"])
  {
    int v4 = 139;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND21"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND24"])
  {
    int v4 = 143;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND25"])
  {
    int v4 = 144;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND26"])
  {
    int v4 = 145;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND33"])
  {
    int v4 = 152;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND34"])
  {
    int v4 = 153;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND35"])
  {
    int v4 = 154;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND36"])
  {
    int v4 = 155;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND37"])
  {
    int v4 = 156;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND38"])
  {
    int v4 = 157;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND39"])
  {
    int v4 = 158;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND40"])
  {
    int v4 = 159;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND41"])
  {
    int v4 = 160;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND42"])
  {
    int v4 = 161;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_LTE_EUTRAN_BAND43"])
  {
    int v4 = 162;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND1"])
  {
    int v4 = 163;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND2"])
  {
    int v4 = 164;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND3"])
  {
    int v4 = 165;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND4"])
  {
    int v4 = 166;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND5"])
  {
    int v4 = 167;
  }
  else if ([v3 isEqualToString:@"SYS_BAND_UMTS_BAND6"])
  {
    int v4 = 168;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setGsmArfcn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_gsmArfcn = a3;
}

- (void)setHasGsmArfcn:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasGsmArfcn
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setFmtId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_fmtId = a3;
}

- (void)setHasFmtId:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasFmtId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNumSubs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSubsId
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8BB8A71BA2C7375E37BF2088B44ABA31)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPsPref
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularGsmWcdmaCellInfo;
  int v3 = [(CellularGsmWcdmaCellInfo *)&v7 description];
  int v4 = [(CellularGsmWcdmaCellInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v8 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v8 forKey:@"timestamp"];

    $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  uint64_t rat = self->_rat;
  if rat < 0x10 && ((0x9FFFu >> rat))
  {
    v10 = *(&off_100287868 + rat);
  }
  else
  {
    v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_rat];
  }
  [v3 setObject:v10 forKey:@"rat"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_41;
  }
LABEL_28:
  int srvStatus = self->_srvStatus;
  v12 = @"SYS_SRV_STATUS_NONE";
  switch(srvStatus)
  {
    case -1:
      break;
    case 0:
      v12 = @"SYS_SRV_STATUS_NO_SRV";
      break;
    case 1:
      v12 = @"SYS_SRV_STATUS_LIMITED";
      break;
    case 2:
      v12 = @"SYS_SRV_STATUS_SRV";
      break;
    case 3:
      v12 = @"SYS_SRV_STATUS_LIMITED_REGIONAL";
      break;
    case 4:
      v12 = @"SYS_SRV_STATUS_PWR_SAVE";
      break;
    case 5:
      v12 = @"SYS_SRV_STATUS_MAX";
      break;
    default:
      if (srvStatus == 100)
      {
        v12 = @"SYS_SRV_STATUS_LOW_POWER_MODE";
      }
      else if (srvStatus == 101)
      {
        v12 = @"SYS_SRV_STATUS_CMAS_ONLY_MODE";
      }
      else
      {
        v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_srvStatus];
      }
      break;
  }
  [v3 setObject:v12 forKey:@"srv_status"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_45;
  }
LABEL_41:
  int v13 = self->_srvDomain + 1;
  if (v13 >= 7)
  {
    v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_srvDomain];
  }
  else
  {
    v14 = *(&off_1002878E8 + v13);
  }
  [v3 setObject:v14 forKey:@"srv_domain"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_46;
  }
LABEL_45:
  v15 = +[NSNumber numberWithUnsignedInt:self->_mcc];
  [v3 setObject:v15 forKey:@"mcc"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_47;
  }
LABEL_46:
  v16 = +[NSNumber numberWithUnsignedInt:self->_mnc];
  [v3 setObject:v16 forKey:@"mnc"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_48;
  }
LABEL_47:
  v17 = +[NSNumber numberWithUnsignedInt:self->_lac];
  [v3 setObject:v17 forKey:@"lac"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_49;
  }
LABEL_48:
  v18 = +[NSNumber numberWithUnsignedInt:self->_cellId];
  [v3 setObject:v18 forKey:@"cell_id"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_129;
  }
LABEL_49:
  v19 = @"SYS_BAND_BC0";
  switch(self->_wcdmaBand)
  {
    case 0:
      break;
    case 1:
      v19 = @"SYS_BAND_BC1";
      break;
    case 3:
      v19 = @"SYS_BAND_BC3";
      break;
    case 4:
      v19 = @"SYS_BAND_BC4";
      break;
    case 5:
      v19 = @"SYS_BAND_BC5";
      break;
    case 6:
      v19 = @"SYS_BAND_BC6";
      break;
    case 7:
      v19 = @"SYS_BAND_BC7";
      break;
    case 8:
      v19 = @"SYS_BAND_BC8";
      break;
    case 9:
      v19 = @"SYS_BAND_BC9";
      break;
    case 0xA:
      v19 = @"SYS_BAND_BC10";
      break;
    case 0xB:
      v19 = @"SYS_BAND_BC11";
      break;
    case 0xC:
      v19 = @"SYS_BAND_BC12";
      break;
    case 0xD:
      v19 = @"SYS_BAND_BC13";
      break;
    case 0xE:
      v19 = @"SYS_BAND_BC14";
      break;
    case 0xF:
      v19 = @"SYS_BAND_BC15";
      break;
    case 0x10:
      v19 = @"SYS_BAND_BC16";
      break;
    case 0x11:
      v19 = @"SYS_BAND_BC17";
      break;
    case 0x12:
      v19 = @"SYS_BAND_BC18";
      break;
    case 0x13:
      v19 = @"SYS_BAND_BC19";
      break;
    case 0x28:
      v19 = @"SYS_BAND_GSM_450";
      break;
    case 0x29:
      v19 = @"SYS_BAND_GSM_480";
      break;
    case 0x2A:
      v19 = @"SYS_BAND_GSM_750";
      break;
    case 0x2B:
      v19 = @"SYS_BAND_GSM_850";
      break;
    case 0x2C:
      v19 = @"SYS_BAND_GSM_EGSM_900";
      break;
    case 0x2D:
      v19 = @"SYS_BAND_GSM_PGSM_900";
      break;
    case 0x2E:
      v19 = @"SYS_BAND_GSM_RGSM_900";
      break;
    case 0x2F:
      v19 = @"SYS_BAND_GSM_DCS_1800";
      break;
    case 0x30:
      v19 = @"SYS_BAND_GSM_PCS_1900";
      break;
    case 0x50:
      v19 = @"SYS_BAND_WCDMA_I_IMT_2000";
      break;
    case 0x51:
      v19 = @"SYS_BAND_WCDMA_II_PCS_1900";
      break;
    case 0x52:
      v19 = @"SYS_BAND_WCDMA_III_1700";
      break;
    case 0x53:
      v19 = @"SYS_BAND_WCDMA_IV_1700";
      break;
    case 0x54:
      v19 = @"SYS_BAND_WCDMA_V_850";
      break;
    case 0x55:
      v19 = @"SYS_BAND_WCDMA_VI_800";
      break;
    case 0x56:
      v19 = @"SYS_BAND_WCDMA_VII_2600";
      break;
    case 0x57:
      v19 = @"SYS_BAND_WCDMA_VIII_900";
      break;
    case 0x58:
      v19 = @"SYS_BAND_WCDMA_IX_1700";
      break;
    case 0x5A:
      v19 = @"SYS_BAND_WCDMA_XI_1500";
      break;
    case 0x5B:
      v19 = @"SYS_BAND_WCDMA_XIX_850";
      break;
    case 0x78:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND1";
      break;
    case 0x79:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND2";
      break;
    case 0x7A:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND3";
      break;
    case 0x7B:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND4";
      break;
    case 0x7C:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND5";
      break;
    case 0x7D:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND6";
      break;
    case 0x7E:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND7";
      break;
    case 0x7F:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND8";
      break;
    case 0x80:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND9";
      break;
    case 0x81:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND10";
      break;
    case 0x82:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND11";
      break;
    case 0x83:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND12";
      break;
    case 0x84:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND13";
      break;
    case 0x85:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND14";
      break;
    case 0x88:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND17";
      break;
    case 0x89:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND18";
      break;
    case 0x8A:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND19";
      break;
    case 0x8B:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND20";
      break;
    case 0x8C:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND21";
      break;
    case 0x8F:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND24";
      break;
    case 0x90:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND25";
      break;
    case 0x91:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND26";
      break;
    case 0x98:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND33";
      break;
    case 0x99:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND34";
      break;
    case 0x9A:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND35";
      break;
    case 0x9B:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND36";
      break;
    case 0x9C:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND37";
      break;
    case 0x9D:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND38";
      break;
    case 0x9E:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND39";
      break;
    case 0x9F:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND40";
      break;
    case 0xA0:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND41";
      break;
    case 0xA1:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND42";
      break;
    case 0xA2:
      v19 = @"SYS_BAND_LTE_EUTRAN_BAND43";
      break;
    case 0xA3:
      v19 = @"SYS_BAND_UMTS_BAND1";
      break;
    case 0xA4:
      v19 = @"SYS_BAND_UMTS_BAND2";
      break;
    case 0xA5:
      v19 = @"SYS_BAND_UMTS_BAND3";
      break;
    case 0xA6:
      v19 = @"SYS_BAND_UMTS_BAND4";
      break;
    case 0xA7:
      v19 = @"SYS_BAND_UMTS_BAND5";
      break;
    case 0xA8:
      v19 = @"SYS_BAND_UMTS_BAND6";
      break;
    default:
      v19 = +[NSString stringWithFormat:@"(unknown: %i)", self->_wcdmaBand];
      break;
  }
  [v3 setObject:v19 forKey:@"wcdma_band"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_133;
  }
LABEL_129:
  uint64_t tdsBand = self->_tdsBand;
  if (tdsBand >= 6)
  {
    v21 = +[NSString stringWithFormat:@"(unknown: %i)", self->_tdsBand];
  }
  else
  {
    v21 = *(&off_100287920 + tdsBand);
  }
  [v3 setObject:v21 forKey:@"tds_band"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_137;
  }
LABEL_133:
  int v22 = self->_hspa + 1;
  if (v22 >= 8)
  {
    v23 = +[NSString stringWithFormat:@"(unknown: %i)", self->_hspa];
  }
  else
  {
    v23 = *(&off_100287950 + v22);
  }
  [v3 setObject:v23 forKey:@"hspa"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_138;
  }
LABEL_137:
  v24 = +[NSNumber numberWithUnsignedInt:self->_dlUarfcn];
  [v3 setObject:v24 forKey:@"dl_uarfcn"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_139;
  }
LABEL_138:
  v25 = +[NSNumber numberWithUnsignedInt:self->_psc];
  [v3 setObject:v25 forKey:@"psc"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_219;
  }
LABEL_139:
  v26 = @"SYS_BAND_BC0";
  switch(self->_gsmBand)
  {
    case 0:
      break;
    case 1:
      v26 = @"SYS_BAND_BC1";
      break;
    case 3:
      v26 = @"SYS_BAND_BC3";
      break;
    case 4:
      v26 = @"SYS_BAND_BC4";
      break;
    case 5:
      v26 = @"SYS_BAND_BC5";
      break;
    case 6:
      v26 = @"SYS_BAND_BC6";
      break;
    case 7:
      v26 = @"SYS_BAND_BC7";
      break;
    case 8:
      v26 = @"SYS_BAND_BC8";
      break;
    case 9:
      v26 = @"SYS_BAND_BC9";
      break;
    case 0xA:
      v26 = @"SYS_BAND_BC10";
      break;
    case 0xB:
      v26 = @"SYS_BAND_BC11";
      break;
    case 0xC:
      v26 = @"SYS_BAND_BC12";
      break;
    case 0xD:
      v26 = @"SYS_BAND_BC13";
      break;
    case 0xE:
      v26 = @"SYS_BAND_BC14";
      break;
    case 0xF:
      v26 = @"SYS_BAND_BC15";
      break;
    case 0x10:
      v26 = @"SYS_BAND_BC16";
      break;
    case 0x11:
      v26 = @"SYS_BAND_BC17";
      break;
    case 0x12:
      v26 = @"SYS_BAND_BC18";
      break;
    case 0x13:
      v26 = @"SYS_BAND_BC19";
      break;
    case 0x28:
      v26 = @"SYS_BAND_GSM_450";
      break;
    case 0x29:
      v26 = @"SYS_BAND_GSM_480";
      break;
    case 0x2A:
      v26 = @"SYS_BAND_GSM_750";
      break;
    case 0x2B:
      v26 = @"SYS_BAND_GSM_850";
      break;
    case 0x2C:
      v26 = @"SYS_BAND_GSM_EGSM_900";
      break;
    case 0x2D:
      v26 = @"SYS_BAND_GSM_PGSM_900";
      break;
    case 0x2E:
      v26 = @"SYS_BAND_GSM_RGSM_900";
      break;
    case 0x2F:
      v26 = @"SYS_BAND_GSM_DCS_1800";
      break;
    case 0x30:
      v26 = @"SYS_BAND_GSM_PCS_1900";
      break;
    case 0x50:
      v26 = @"SYS_BAND_WCDMA_I_IMT_2000";
      break;
    case 0x51:
      v26 = @"SYS_BAND_WCDMA_II_PCS_1900";
      break;
    case 0x52:
      v26 = @"SYS_BAND_WCDMA_III_1700";
      break;
    case 0x53:
      v26 = @"SYS_BAND_WCDMA_IV_1700";
      break;
    case 0x54:
      v26 = @"SYS_BAND_WCDMA_V_850";
      break;
    case 0x55:
      v26 = @"SYS_BAND_WCDMA_VI_800";
      break;
    case 0x56:
      v26 = @"SYS_BAND_WCDMA_VII_2600";
      break;
    case 0x57:
      v26 = @"SYS_BAND_WCDMA_VIII_900";
      break;
    case 0x58:
      v26 = @"SYS_BAND_WCDMA_IX_1700";
      break;
    case 0x5A:
      v26 = @"SYS_BAND_WCDMA_XI_1500";
      break;
    case 0x5B:
      v26 = @"SYS_BAND_WCDMA_XIX_850";
      break;
    case 0x78:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND1";
      break;
    case 0x79:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND2";
      break;
    case 0x7A:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND3";
      break;
    case 0x7B:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND4";
      break;
    case 0x7C:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND5";
      break;
    case 0x7D:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND6";
      break;
    case 0x7E:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND7";
      break;
    case 0x7F:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND8";
      break;
    case 0x80:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND9";
      break;
    case 0x81:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND10";
      break;
    case 0x82:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND11";
      break;
    case 0x83:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND12";
      break;
    case 0x84:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND13";
      break;
    case 0x85:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND14";
      break;
    case 0x88:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND17";
      break;
    case 0x89:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND18";
      break;
    case 0x8A:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND19";
      break;
    case 0x8B:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND20";
      break;
    case 0x8C:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND21";
      break;
    case 0x8F:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND24";
      break;
    case 0x90:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND25";
      break;
    case 0x91:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND26";
      break;
    case 0x98:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND33";
      break;
    case 0x99:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND34";
      break;
    case 0x9A:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND35";
      break;
    case 0x9B:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND36";
      break;
    case 0x9C:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND37";
      break;
    case 0x9D:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND38";
      break;
    case 0x9E:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND39";
      break;
    case 0x9F:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND40";
      break;
    case 0xA0:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND41";
      break;
    case 0xA1:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND42";
      break;
    case 0xA2:
      v26 = @"SYS_BAND_LTE_EUTRAN_BAND43";
      break;
    case 0xA3:
      v26 = @"SYS_BAND_UMTS_BAND1";
      break;
    case 0xA4:
      v26 = @"SYS_BAND_UMTS_BAND2";
      break;
    case 0xA5:
      v26 = @"SYS_BAND_UMTS_BAND3";
      break;
    case 0xA6:
      v26 = @"SYS_BAND_UMTS_BAND4";
      break;
    case 0xA7:
      v26 = @"SYS_BAND_UMTS_BAND5";
      break;
    case 0xA8:
      v26 = @"SYS_BAND_UMTS_BAND6";
      break;
    default:
      v26 = +[NSString stringWithFormat:@"(unknown: %i)", self->_gsmBand];
      break;
  }
  [v3 setObject:v26 forKey:@"gsm_band"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_220;
  }
LABEL_219:
  v27 = +[NSNumber numberWithUnsignedInt:self->_gsmArfcn];
  [v3 setObject:v27 forKey:@"gsm_arfcn"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_221;
  }
LABEL_220:
  v28 = +[NSNumber numberWithUnsignedInt:self->_fmtId];
  [v3 setObject:v28 forKey:@"fmt_id"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_19;
    }
LABEL_222:
    v30 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v30 forKey:@"subs_id"];

    if ((*(_DWORD *)&self->_has & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_221:
  v29 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v29 forKey:@"num_subs"];

  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0) {
    goto LABEL_222;
  }
LABEL_19:
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_20:
    v5 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v5 forKey:@"ps_pref"];
  }
LABEL_21:
  id v6 = v3;

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000C0254((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x800) != 0) {
LABEL_20:
  }
    PBDataWriterWriteUint32Field();
LABEL_21:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 22) |= 1u;
    $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 16) = self->_rat;
  *((_DWORD *)v4 + 22) |= 0x2000u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 18) = self->_srvStatus;
  *((_DWORD *)v4 + 22) |= 0x8000u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 11) = self->_mcc;
  *((_DWORD *)v4 + 22) |= 0x100u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 12) = self->_mnc;
  *((_DWORD *)v4 + 22) |= 0x200u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 10) = self->_lac;
  *((_DWORD *)v4 + 22) |= 0x80u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 4) = self->_cellId;
  *((_DWORD *)v4 + 22) |= 2u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 21) = self->_wcdmaBand;
  *((_DWORD *)v4 + 22) |= 0x40000u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 5) = self->_dlUarfcn;
  *((_DWORD *)v4 + 22) |= 4u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 15) = self->_psc;
  *((_DWORD *)v4 + 22) |= 0x1000u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 8) = self->_gsmBand;
  *((_DWORD *)v4 + 22) |= 0x20u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 7) = self->_gsmArfcn;
  *((_DWORD *)v4 + 22) |= 0x10u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 17) = self->_srvDomain;
  *((_DWORD *)v4 + 22) |= 0x4000u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 9) = self->_hspa;
  *((_DWORD *)v4 + 22) |= 0x40u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 20) = self->_tdsBand;
  *((_DWORD *)v4 + 22) |= 0x20000u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 6) = self->_fmtId;
  *((_DWORD *)v4 + 22) |= 8u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 13) = self->_numSubs;
  *((_DWORD *)v4 + 22) |= 0x400u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_41:
  *((_DWORD *)v4 + 19) = self->_subsId;
  *((_DWORD *)v4 + 22) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_20:
    *((_DWORD *)v4 + 14) = self->_psPref;
    *((_DWORD *)v4 + 22) |= 0x800u;
  }
LABEL_21:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_DWORD *)result + 22) |= 1u;
    $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
    if ((*(_WORD *)&has & 0x2000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 16) = self->_rat;
  *((_DWORD *)result + 22) |= 0x2000u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 18) = self->_srvStatus;
  *((_DWORD *)result + 22) |= 0x8000u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 11) = self->_mcc;
  *((_DWORD *)result + 22) |= 0x100u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 12) = self->_mnc;
  *((_DWORD *)result + 22) |= 0x200u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 10) = self->_lac;
  *((_DWORD *)result + 22) |= 0x80u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 4) = self->_cellId;
  *((_DWORD *)result + 22) |= 2u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 21) = self->_wcdmaBand;
  *((_DWORD *)result + 22) |= 0x40000u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 5) = self->_dlUarfcn;
  *((_DWORD *)result + 22) |= 4u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)result + 15) = self->_psc;
  *((_DWORD *)result + 22) |= 0x1000u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)result + 8) = self->_gsmBand;
  *((_DWORD *)result + 22) |= 0x20u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)result + 7) = self->_gsmArfcn;
  *((_DWORD *)result + 22) |= 0x10u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 17) = self->_srvDomain;
  *((_DWORD *)result + 22) |= 0x4000u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 9) = self->_hspa;
  *((_DWORD *)result + 22) |= 0x40u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 20) = self->_tdsBand;
  *((_DWORD *)result + 22) |= 0x20000u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 6) = self->_fmtId;
  *((_DWORD *)result + 22) |= 8u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 13) = self->_numSubs;
  *((_DWORD *)result + 22) |= 0x400u;
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0) {
      return result;
    }
    goto LABEL_20;
  }
LABEL_39:
  *((_DWORD *)result + 19) = self->_subsId;
  *((_DWORD *)result + 22) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x800) == 0) {
    return result;
  }
LABEL_20:
  *((_DWORD *)result + 14) = self->_psPref;
  *((_DWORD *)result + 22) |= 0x800u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_97;
  }
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  int v6 = *((_DWORD *)v4 + 22);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_97;
    }
  }
  else if (v6)
  {
LABEL_97:
    BOOL v7 = 0;
    goto LABEL_98;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_rat != *((_DWORD *)v4 + 16)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_srvStatus != *((_DWORD *)v4 + 18)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_mcc != *((_DWORD *)v4 + 11)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_mnc != *((_DWORD *)v4 + 12)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_97;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_lac != *((_DWORD *)v4 + 10)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_97;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_cellId != *((_DWORD *)v4 + 4)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_wcdmaBand != *((_DWORD *)v4 + 21)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_dlUarfcn != *((_DWORD *)v4 + 5)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_psc != *((_DWORD *)v4 + 15)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_gsmBand != *((_DWORD *)v4 + 8)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_97;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_gsmArfcn != *((_DWORD *)v4 + 7)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_srvDomain != *((_DWORD *)v4 + 17)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_hspa != *((_DWORD *)v4 + 9)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_tdsBand != *((_DWORD *)v4 + 20)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_fmtId != *((_DWORD *)v4 + 6)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_numSubs != *((_DWORD *)v4 + 13)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_subsId != *((_DWORD *)v4 + 19)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_psPref != *((_DWORD *)v4 + 14)) {
      goto LABEL_97;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (*((_DWORD *)v4 + 22) & 0x800) == 0;
  }
LABEL_98:

  return v7;
}

- (unint64_t)hash
{
  $8BB8A71BA2C7375E37BF2088B44ABA31 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_rat;
      if ((*(_WORD *)&has & 0x8000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_srvStatus;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v5 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_mcc;
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
    uint64_t v7 = 2654435761 * self->_mnc;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_lac;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_cellId;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v9 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_wcdmaBand;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_dlUarfcn;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_psc;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v12 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_gsmBand;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v13 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_gsmArfcn;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v14 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_srvDomain;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v15 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_hspa;
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
    uint64_t v17 = 2654435761 * self->_tdsBand;
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
    uint64_t v18 = 2654435761 * self->_fmtId;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_18;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v18 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_18:
    uint64_t v19 = 2654435761 * self->_numSubs;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_19;
    }
LABEL_38:
    uint64_t v20 = 0;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_20;
    }
LABEL_39:
    uint64_t v21 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
LABEL_37:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x10000) == 0) {
    goto LABEL_38;
  }
LABEL_19:
  uint64_t v20 = 2654435761 * self->_subsId;
  if ((*(_WORD *)&has & 0x800) == 0) {
    goto LABEL_39;
  }
LABEL_20:
  uint64_t v21 = 2654435761 * self->_psPref;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 22);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)v4 + 22);
    if ((v5 & 0x2000) == 0)
    {
LABEL_3:
      if ((v5 & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((v5 & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t rat = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x8000) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_int srvStatus = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_mcc = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_mnc = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_lac = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_cellId = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x40000) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_wcdmaBand = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_dlUarfcn = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x1000) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_psc = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_gsmBand = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_gsmArfcn = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x4000) == 0)
  {
LABEL_14:
    if ((v5 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_srvDomain = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x40) == 0)
  {
LABEL_15:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_hspa = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x20000) == 0)
  {
LABEL_16:
    if ((v5 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_uint64_t tdsBand = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 8) == 0)
  {
LABEL_17:
    if ((v5 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_fmtId = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x400) == 0)
  {
LABEL_18:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_numSubs = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 22);
  if ((v5 & 0x10000) == 0)
  {
LABEL_19:
    if ((v5 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_41:
  self->_subsId = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x10000u;
  if ((*((_DWORD *)v4 + 22) & 0x800) != 0)
  {
LABEL_20:
    self->_psPref = *((_DWORD *)v4 + 14);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_21:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)mcc
{
  return self->_mcc;
}

- (unsigned)mnc
{
  return self->_mnc;
}

- (unsigned)lac
{
  return self->_lac;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)dlUarfcn
{
  return self->_dlUarfcn;
}

- (unsigned)psc
{
  return self->_psc;
}

- (unsigned)gsmArfcn
{
  return self->_gsmArfcn;
}

- (unsigned)fmtId
{
  return self->_fmtId;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)psPref
{
  return self->_psPref;
}

@end