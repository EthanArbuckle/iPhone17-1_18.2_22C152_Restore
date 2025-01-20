@interface CellularCdmaCellInfo
- (BOOL)hasBand;
- (BOOL)hasBaseId;
- (BOOL)hasChannel;
- (BOOL)hasGwRat;
- (BOOL)hasGwSrvStatus;
- (BOOL)hasHdrHybrid;
- (BOOL)hasHdrPilotPn;
- (BOOL)hasHdrSrvStatus;
- (BOOL)hasHybridActiveBand;
- (BOOL)hasHybridActiveChannel;
- (BOOL)hasIs95Nid;
- (BOOL)hasIs95Sid;
- (BOOL)hasMcc;
- (BOOL)hasNumSubs;
- (BOOL)hasPilotPn;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasRat;
- (BOOL)hasSectorId;
- (BOOL)hasSrvStatus;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasZoneId;
- (BOOL)hdrHybrid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (NSData)sectorId;
- (id)bandAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)gwRatAsString:(int)a3;
- (id)gwSrvStatusAsString:(int)a3;
- (id)hdrSrvStatusAsString:(int)a3;
- (id)hybridActiveBandAsString:(int)a3;
- (id)ratAsString:(int)a3;
- (id)srvStatusAsString:(int)a3;
- (int)StringAsBand:(id)a3;
- (int)StringAsGwRat:(id)a3;
- (int)StringAsGwSrvStatus:(id)a3;
- (int)StringAsHdrSrvStatus:(id)a3;
- (int)StringAsHybridActiveBand:(id)a3;
- (int)StringAsRat:(id)a3;
- (int)StringAsSrvStatus:(id)a3;
- (int)band;
- (int)gwRat;
- (int)gwSrvStatus;
- (int)hdrSrvStatus;
- (int)hybridActiveBand;
- (int)rat;
- (int)srvStatus;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)baseId;
- (unsigned)channel;
- (unsigned)hdrPilotPn;
- (unsigned)hybridActiveChannel;
- (unsigned)is95Nid;
- (unsigned)is95Sid;
- (unsigned)mcc;
- (unsigned)numSubs;
- (unsigned)pilotPn;
- (unsigned)psPref;
- (unsigned)subsId;
- (unsigned)zoneId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBand:(int)a3;
- (void)setBaseId:(unsigned int)a3;
- (void)setChannel:(unsigned int)a3;
- (void)setGwRat:(int)a3;
- (void)setGwSrvStatus:(int)a3;
- (void)setHasBand:(BOOL)a3;
- (void)setHasBaseId:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasGwRat:(BOOL)a3;
- (void)setHasGwSrvStatus:(BOOL)a3;
- (void)setHasHdrHybrid:(BOOL)a3;
- (void)setHasHdrPilotPn:(BOOL)a3;
- (void)setHasHdrSrvStatus:(BOOL)a3;
- (void)setHasHybridActiveBand:(BOOL)a3;
- (void)setHasHybridActiveChannel:(BOOL)a3;
- (void)setHasIs95Nid:(BOOL)a3;
- (void)setHasIs95Sid:(BOOL)a3;
- (void)setHasMcc:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPilotPn:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasRat:(BOOL)a3;
- (void)setHasSrvStatus:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasZoneId:(BOOL)a3;
- (void)setHdrHybrid:(BOOL)a3;
- (void)setHdrPilotPn:(unsigned int)a3;
- (void)setHdrSrvStatus:(int)a3;
- (void)setHybridActiveBand:(int)a3;
- (void)setHybridActiveChannel:(unsigned int)a3;
- (void)setIs95Nid:(unsigned int)a3;
- (void)setIs95Sid:(unsigned int)a3;
- (void)setMcc:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPilotPn:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setRat:(int)a3;
- (void)setSectorId:(id)a3;
- (void)setSrvStatus:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setZoneId:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularCdmaCellInfo

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (int)rat
{
  if (*((unsigned char *)&self->_has + 2)) {
    return self->_rat;
  }
  else {
    return 0;
  }
}

- (void)setRat:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRat
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (id)ratAsString:(int)a3
{
  if a3 < 0x10 && ((0x9FFFu >> a3))
  {
    int v3 = *(&off_100288348 + a3);
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
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    return self->_srvStatus;
  }
  else {
    return -1;
  }
}

- (void)setSrvStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_srvStatus = a3;
}

- (void)setHasSrvStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSrvStatus
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
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

- (void)setMcc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMcc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setIs95Sid:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_is95Sid = a3;
}

- (void)setHasIs95Sid:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIs95Sid
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIs95Nid:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_is95Nid = a3;
}

- (void)setHasIs95Nid:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasIs95Nid
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasSectorId
{
  return self->_sectorId != 0;
}

- (int)band
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_band;
  }
  else {
    return 0;
  }
}

- (void)setBand:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasBand
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)bandAsString:(int)a3
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

- (int)StringAsBand:(id)a3
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

- (void)setChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasChannel
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBaseId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_baseId = a3;
}

- (void)setHasBaseId:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBaseId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setZoneId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_zoneId = a3;
}

- (void)setHasZoneId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasZoneId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (int)hdrSrvStatus
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_hdrSrvStatus;
  }
  else {
    return -1;
  }
}

- (void)setHdrSrvStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_hdrSrvStatus = a3;
}

- (void)setHasHdrSrvStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHdrSrvStatus
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)hdrSrvStatusAsString:(int)a3
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

- (int)StringAsHdrSrvStatus:(id)a3
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

- (void)setHdrHybrid:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_hdrHybrid = a3;
}

- (void)setHasHdrHybrid:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasHdrHybrid
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (int)hybridActiveBand
{
  if (*((unsigned char *)&self->_has + 1)) {
    return self->_hybridActiveBand;
  }
  else {
    return 0;
  }
}

- (void)setHybridActiveBand:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hybridActiveBand = a3;
}

- (void)setHasHybridActiveBand:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHybridActiveBand
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (id)hybridActiveBandAsString:(int)a3
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

- (int)StringAsHybridActiveBand:(id)a3
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

- (void)setHybridActiveChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_hybridActiveChannel = a3;
}

- (void)setHasHybridActiveChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasHybridActiveChannel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (int)gwRat
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_gwRat;
  }
  else {
    return 0;
  }
}

- (void)setGwRat:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_gwRat = a3;
}

- (void)setHasGwRat:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasGwRat
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)gwRatAsString:(int)a3
{
  if a3 < 0x10 && ((0x9FFFu >> a3))
  {
    int v3 = *(&off_100288348 + a3);
  }
  else
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsGwRat:(id)a3
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

- (int)gwSrvStatus
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_gwSrvStatus;
  }
  else {
    return -1;
  }
}

- (void)setGwSrvStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_gwSrvStatus = a3;
}

- (void)setHasGwSrvStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasGwSrvStatus
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)gwSrvStatusAsString:(int)a3
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

- (int)StringAsGwSrvStatus:(id)a3
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

- (void)setHdrPilotPn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hdrPilotPn = a3;
}

- (void)setHasHdrPilotPn:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHdrPilotPn
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPilotPn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_pilotPn = a3;
}

- (void)setHasPilotPn:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasPilotPn
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNumSubs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($61B41E93924E64F4A8EE0C468EC37E18)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPsPref
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularCdmaCellInfo;
  int v3 = [(CellularCdmaCellInfo *)&v7 description];
  int v4 = [(CellularCdmaCellInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v12 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v12 forKey:@"timestamp"];

    $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x20000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  uint64_t rat = self->_rat;
  if rat < 0x10 && ((0x9FFFu >> rat))
  {
    v14 = *(&off_100288348 + rat);
  }
  else
  {
    v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_rat];
  }
  [v3 setObject:v14 forKey:@"rat"];

  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_50;
  }
LABEL_37:
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

  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_51;
  }
LABEL_50:
  v18 = +[NSNumber numberWithUnsignedInt:self->_mcc];
  [v3 setObject:v18 forKey:@"mcc"];

  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_51:
  v19 = +[NSNumber numberWithUnsignedInt:self->_is95Sid];
  [v3 setObject:v19 forKey:@"is95_sid"];

  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    v5 = +[NSNumber numberWithUnsignedInt:self->_is95Nid];
    [v3 setObject:v5 forKey:@"is95_nid"];
  }
LABEL_8:
  sectorId = self->_sectorId;
  if (sectorId) {
    [v3 setObject:sectorId forKey:@"sector_id"];
  }
  $61B41E93924E64F4A8EE0C468EC37E18 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 2) != 0)
  {
    v15 = @"SYS_BAND_BC0";
    switch(self->_band)
    {
      case 0:
        break;
      case 1:
        v15 = @"SYS_BAND_BC1";
        break;
      case 3:
        v15 = @"SYS_BAND_BC3";
        break;
      case 4:
        v15 = @"SYS_BAND_BC4";
        break;
      case 5:
        v15 = @"SYS_BAND_BC5";
        break;
      case 6:
        v15 = @"SYS_BAND_BC6";
        break;
      case 7:
        v15 = @"SYS_BAND_BC7";
        break;
      case 8:
        v15 = @"SYS_BAND_BC8";
        break;
      case 9:
        v15 = @"SYS_BAND_BC9";
        break;
      case 0xA:
        v15 = @"SYS_BAND_BC10";
        break;
      case 0xB:
        v15 = @"SYS_BAND_BC11";
        break;
      case 0xC:
        v15 = @"SYS_BAND_BC12";
        break;
      case 0xD:
        v15 = @"SYS_BAND_BC13";
        break;
      case 0xE:
        v15 = @"SYS_BAND_BC14";
        break;
      case 0xF:
        v15 = @"SYS_BAND_BC15";
        break;
      case 0x10:
        v15 = @"SYS_BAND_BC16";
        break;
      case 0x11:
        v15 = @"SYS_BAND_BC17";
        break;
      case 0x12:
        v15 = @"SYS_BAND_BC18";
        break;
      case 0x13:
        v15 = @"SYS_BAND_BC19";
        break;
      case 0x28:
        v15 = @"SYS_BAND_GSM_450";
        break;
      case 0x29:
        v15 = @"SYS_BAND_GSM_480";
        break;
      case 0x2A:
        v15 = @"SYS_BAND_GSM_750";
        break;
      case 0x2B:
        v15 = @"SYS_BAND_GSM_850";
        break;
      case 0x2C:
        v15 = @"SYS_BAND_GSM_EGSM_900";
        break;
      case 0x2D:
        v15 = @"SYS_BAND_GSM_PGSM_900";
        break;
      case 0x2E:
        v15 = @"SYS_BAND_GSM_RGSM_900";
        break;
      case 0x2F:
        v15 = @"SYS_BAND_GSM_DCS_1800";
        break;
      case 0x30:
        v15 = @"SYS_BAND_GSM_PCS_1900";
        break;
      case 0x50:
        v15 = @"SYS_BAND_WCDMA_I_IMT_2000";
        break;
      case 0x51:
        v15 = @"SYS_BAND_WCDMA_II_PCS_1900";
        break;
      case 0x52:
        v15 = @"SYS_BAND_WCDMA_III_1700";
        break;
      case 0x53:
        v15 = @"SYS_BAND_WCDMA_IV_1700";
        break;
      case 0x54:
        v15 = @"SYS_BAND_WCDMA_V_850";
        break;
      case 0x55:
        v15 = @"SYS_BAND_WCDMA_VI_800";
        break;
      case 0x56:
        v15 = @"SYS_BAND_WCDMA_VII_2600";
        break;
      case 0x57:
        v15 = @"SYS_BAND_WCDMA_VIII_900";
        break;
      case 0x58:
        v15 = @"SYS_BAND_WCDMA_IX_1700";
        break;
      case 0x5A:
        v15 = @"SYS_BAND_WCDMA_XI_1500";
        break;
      case 0x5B:
        v15 = @"SYS_BAND_WCDMA_XIX_850";
        break;
      case 0x78:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND1";
        break;
      case 0x79:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND2";
        break;
      case 0x7A:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND3";
        break;
      case 0x7B:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND4";
        break;
      case 0x7C:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND5";
        break;
      case 0x7D:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND6";
        break;
      case 0x7E:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND7";
        break;
      case 0x7F:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND8";
        break;
      case 0x80:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND9";
        break;
      case 0x81:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND10";
        break;
      case 0x82:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND11";
        break;
      case 0x83:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND12";
        break;
      case 0x84:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND13";
        break;
      case 0x85:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND14";
        break;
      case 0x88:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND17";
        break;
      case 0x89:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND18";
        break;
      case 0x8A:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND19";
        break;
      case 0x8B:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND20";
        break;
      case 0x8C:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND21";
        break;
      case 0x8F:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND24";
        break;
      case 0x90:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND25";
        break;
      case 0x91:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND26";
        break;
      case 0x98:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND33";
        break;
      case 0x99:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND34";
        break;
      case 0x9A:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND35";
        break;
      case 0x9B:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND36";
        break;
      case 0x9C:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND37";
        break;
      case 0x9D:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND38";
        break;
      case 0x9E:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND39";
        break;
      case 0x9F:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND40";
        break;
      case 0xA0:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND41";
        break;
      case 0xA1:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND42";
        break;
      case 0xA2:
        v15 = @"SYS_BAND_LTE_EUTRAN_BAND43";
        break;
      case 0xA3:
        v15 = @"SYS_BAND_UMTS_BAND1";
        break;
      case 0xA4:
        v15 = @"SYS_BAND_UMTS_BAND2";
        break;
      case 0xA5:
        v15 = @"SYS_BAND_UMTS_BAND3";
        break;
      case 0xA6:
        v15 = @"SYS_BAND_UMTS_BAND4";
        break;
      case 0xA7:
        v15 = @"SYS_BAND_UMTS_BAND5";
        break;
      case 0xA8:
        v15 = @"SYS_BAND_UMTS_BAND6";
        break;
      default:
        v15 = +[NSString stringWithFormat:@"(unknown: %i)", self->_band];
        break;
    }
    [v3 setObject:v15 forKey:@"band"];

    $61B41E93924E64F4A8EE0C468EC37E18 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 8) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&v7 & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_132;
    }
  }
  else if ((*(unsigned char *)&v7 & 8) == 0)
  {
    goto LABEL_12;
  }
  v20 = +[NSNumber numberWithUnsignedInt:self->_channel];
  [v3 setObject:v20 forKey:@"channel"];

  $61B41E93924E64F4A8EE0C468EC37E18 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 4) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v7 & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_133;
  }
LABEL_132:
  v21 = +[NSNumber numberWithUnsignedInt:self->_baseId];
  [v3 setObject:v21 forKey:@"base_id"];

  $61B41E93924E64F4A8EE0C468EC37E18 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v7 & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_134;
  }
LABEL_133:
  v22 = +[NSNumber numberWithUnsignedInt:self->_zoneId];
  [v3 setObject:v22 forKey:@"zone_id"];

  $61B41E93924E64F4A8EE0C468EC37E18 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v7 & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_147;
  }
LABEL_134:
  int hdrSrvStatus = self->_hdrSrvStatus;
  v24 = @"SYS_SRV_STATUS_NONE";
  switch(hdrSrvStatus)
  {
    case -1:
      break;
    case 0:
      v24 = @"SYS_SRV_STATUS_NO_SRV";
      break;
    case 1:
      v24 = @"SYS_SRV_STATUS_LIMITED";
      break;
    case 2:
      v24 = @"SYS_SRV_STATUS_SRV";
      break;
    case 3:
      v24 = @"SYS_SRV_STATUS_LIMITED_REGIONAL";
      break;
    case 4:
      v24 = @"SYS_SRV_STATUS_PWR_SAVE";
      break;
    case 5:
      v24 = @"SYS_SRV_STATUS_MAX";
      break;
    default:
      if (hdrSrvStatus == 100)
      {
        v24 = @"SYS_SRV_STATUS_LOW_POWER_MODE";
      }
      else if (hdrSrvStatus == 101)
      {
        v24 = @"SYS_SRV_STATUS_CMAS_ONLY_MODE";
      }
      else
      {
        v24 = +[NSString stringWithFormat:@"(unknown: %i)", self->_hdrSrvStatus];
      }
      break;
  }
  [v3 setObject:v24 forKey:@"hdr_srv_status"];

  $61B41E93924E64F4A8EE0C468EC37E18 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v7 & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_148;
  }
LABEL_147:
  v25 = +[NSNumber numberWithBool:self->_hdrHybrid];
  [v3 setObject:v25 forKey:@"hdr_hybrid"];

  $61B41E93924E64F4A8EE0C468EC37E18 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v7 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_228;
  }
LABEL_148:
  v26 = @"SYS_BAND_BC0";
  switch(self->_hybridActiveBand)
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
      v26 = +[NSString stringWithFormat:@"(unknown: %i)", self->_hybridActiveBand];
      break;
  }
  [v3 setObject:v26 forKey:@"hybrid_active_band"];

  $61B41E93924E64F4A8EE0C468EC37E18 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v7 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_229;
  }
LABEL_228:
  v27 = +[NSNumber numberWithUnsignedInt:self->_hybridActiveChannel];
  [v3 setObject:v27 forKey:@"hybrid_active_channel"];

  $61B41E93924E64F4A8EE0C468EC37E18 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_234;
  }
LABEL_229:
  uint64_t gwRat = self->_gwRat;
  if gwRat < 0x10 && ((0x9FFFu >> gwRat))
  {
    v29 = *(&off_100288348 + gwRat);
  }
  else
  {
    v29 = +[NSString stringWithFormat:@"(unknown: %i)", self->_gwRat];
  }
  [v3 setObject:v29 forKey:@"gw_rat"];

  $61B41E93924E64F4A8EE0C468EC37E18 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v7 & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_247;
  }
LABEL_234:
  int gwSrvStatus = self->_gwSrvStatus;
  v31 = @"SYS_SRV_STATUS_NONE";
  switch(gwSrvStatus)
  {
    case -1:
      break;
    case 0:
      v31 = @"SYS_SRV_STATUS_NO_SRV";
      break;
    case 1:
      v31 = @"SYS_SRV_STATUS_LIMITED";
      break;
    case 2:
      v31 = @"SYS_SRV_STATUS_SRV";
      break;
    case 3:
      v31 = @"SYS_SRV_STATUS_LIMITED_REGIONAL";
      break;
    case 4:
      v31 = @"SYS_SRV_STATUS_PWR_SAVE";
      break;
    case 5:
      v31 = @"SYS_SRV_STATUS_MAX";
      break;
    default:
      if (gwSrvStatus == 100)
      {
        v31 = @"SYS_SRV_STATUS_LOW_POWER_MODE";
      }
      else if (gwSrvStatus == 101)
      {
        v31 = @"SYS_SRV_STATUS_CMAS_ONLY_MODE";
      }
      else
      {
        v31 = +[NSString stringWithFormat:@"(unknown: %i)", self->_gwSrvStatus];
      }
      break;
  }
  [v3 setObject:v31 forKey:@"gw_srv_status"];

  $61B41E93924E64F4A8EE0C468EC37E18 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_248;
  }
LABEL_247:
  v32 = +[NSNumber numberWithUnsignedInt:self->_hdrPilotPn];
  [v3 setObject:v32 forKey:@"hdr_pilot_pn"];

  $61B41E93924E64F4A8EE0C468EC37E18 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v7 & 0x40000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_249;
  }
LABEL_248:
  v33 = +[NSNumber numberWithUnsignedInt:self->_pilotPn];
  [v3 setObject:v33 forKey:@"pilot_pn"];

  $61B41E93924E64F4A8EE0C468EC37E18 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_250;
  }
LABEL_249:
  v34 = +[NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v34 forKey:@"subs_id"];

  $61B41E93924E64F4A8EE0C468EC37E18 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v7 & 0x8000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_250:
  v35 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v35 forKey:@"num_subs"];

  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_25:
    v8 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v8 forKey:@"ps_pref"];
  }
LABEL_26:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  id v10 = v3;

  return v10;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100114700((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  id v7 = v4;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v7;
    $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x20000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
LABEL_9:
  if (self->_sectorId)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 8) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v6 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&v6 & 8) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_22;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_25:
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
LABEL_26:
  if (self->_plmn)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 28) |= 1u;
    $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x20000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 21) = self->_rat;
  *((_DWORD *)v4 + 28) |= 0x10000u;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 24) = self->_srvStatus;
  *((_DWORD *)v4 + 28) |= 0x20000u;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 15) = self->_mcc;
  *((_DWORD *)v4 + 28) |= 0x1000u;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 25) = self->_subsId;
  *((_DWORD *)v4 + 28) |= 0x40000u;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_36:
  *((_DWORD *)v4 + 14) = self->_is95Sid;
  *((_DWORD *)v4 + 28) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 13) = self->_is95Nid;
    *((_DWORD *)v4 + 28) |= 0x400u;
  }
LABEL_9:
  id v7 = v4;
  if (self->_sectorId)
  {
    [v4 setSectorId:];
    id v4 = v7;
  }
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_band;
    *((_DWORD *)v4 + 28) |= 2u;
    $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 8) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v6 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&v6 & 8) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 6) = self->_channel;
  *((_DWORD *)v4 + 28) |= 8u;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 5) = self->_baseId;
  *((_DWORD *)v4 + 28) |= 4u;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 26) = self->_zoneId;
  *((_DWORD *)v4 + 28) |= 0x80000u;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 10) = self->_hdrSrvStatus;
  *((_DWORD *)v4 + 28) |= 0x80u;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((unsigned char *)v4 + 108) = self->_hdrHybrid;
  *((_DWORD *)v4 + 28) |= 0x100000u;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 11) = self->_hybridActiveBand;
  *((_DWORD *)v4 + 28) |= 0x100u;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 12) = self->_hybridActiveChannel;
  *((_DWORD *)v4 + 28) |= 0x200u;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 9) = self->_hdrPilotPn;
  *((_DWORD *)v4 + 28) |= 0x40u;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_22;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 17) = self->_pilotPn;
  *((_DWORD *)v4 + 28) |= 0x4000u;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 7) = self->_gwRat;
  *((_DWORD *)v4 + 28) |= 0x10u;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 8) = self->_gwSrvStatus;
  *((_DWORD *)v4 + 28) |= 0x20u;
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_50:
  *((_DWORD *)v4 + 16) = self->_numSubs;
  *((_DWORD *)v4 + 28) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_25:
    *((_DWORD *)v4 + 20) = self->_psPref;
    *((_DWORD *)v4 + 28) |= 0x8000u;
  }
LABEL_26:
  if (self->_plmn)
  {
    [v7 setPlmn:];
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $61B41E93924E64F4A8EE0C468EC37E18 v6 = v5;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 28) |= 1u;
    $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x20000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 21) = self->_rat;
  *((_DWORD *)v5 + 28) |= 0x10000u;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v5 + 24) = self->_srvStatus;
  *((_DWORD *)v5 + 28) |= 0x20000u;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v5 + 15) = self->_mcc;
  *((_DWORD *)v5 + 28) |= 0x1000u;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v5 + 25) = self->_subsId;
  *((_DWORD *)v5 + 28) |= 0x40000u;
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_30:
  *((_DWORD *)v5 + 14) = self->_is95Sid;
  *((_DWORD *)v5 + 28) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    *((_DWORD *)v5 + 13) = self->_is95Nid;
    *((_DWORD *)v5 + 28) |= 0x400u;
  }
LABEL_9:
  id v8 = [(NSData *)self->_sectorId copyWithZone:a3];
  v9 = (void *)v6[11];
  v6[11] = v8;

  $61B41E93924E64F4A8EE0C468EC37E18 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 2) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_band;
    *((_DWORD *)v6 + 28) |= 2u;
    $61B41E93924E64F4A8EE0C468EC37E18 v10 = self->_has;
    if ((*(unsigned char *)&v10 & 8) == 0)
    {
LABEL_11:
      if ((*(unsigned char *)&v10 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&v10 & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v6 + 6) = self->_channel;
  *((_DWORD *)v6 + 28) |= 8u;
  $61B41E93924E64F4A8EE0C468EC37E18 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 4) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&v10 & 0x80000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v6 + 5) = self->_baseId;
  *((_DWORD *)v6 + 28) |= 4u;
  $61B41E93924E64F4A8EE0C468EC37E18 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&v10 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v6 + 26) = self->_zoneId;
  *((_DWORD *)v6 + 28) |= 0x80000u;
  $61B41E93924E64F4A8EE0C468EC37E18 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x80) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v10 & 0x100000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v6 + 10) = self->_hdrSrvStatus;
  *((_DWORD *)v6 + 28) |= 0x80u;
  $61B41E93924E64F4A8EE0C468EC37E18 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v10 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((unsigned char *)v6 + 108) = self->_hdrHybrid;
  *((_DWORD *)v6 + 28) |= 0x100000u;
  $61B41E93924E64F4A8EE0C468EC37E18 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x100) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v10 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v6 + 11) = self->_hybridActiveBand;
  *((_DWORD *)v6 + 28) |= 0x100u;
  $61B41E93924E64F4A8EE0C468EC37E18 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v10 & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v6 + 12) = self->_hybridActiveChannel;
  *((_DWORD *)v6 + 28) |= 0x200u;
  $61B41E93924E64F4A8EE0C468EC37E18 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x40) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v10 & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v6 + 9) = self->_hdrPilotPn;
  *((_DWORD *)v6 + 28) |= 0x40u;
  $61B41E93924E64F4A8EE0C468EC37E18 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v10 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v6 + 17) = self->_pilotPn;
  *((_DWORD *)v6 + 28) |= 0x4000u;
  $61B41E93924E64F4A8EE0C468EC37E18 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x10) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v10 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v6 + 7) = self->_gwRat;
  *((_DWORD *)v6 + 28) |= 0x10u;
  $61B41E93924E64F4A8EE0C468EC37E18 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x20) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v10 & 0x2000) == 0) {
      goto LABEL_22;
    }
LABEL_44:
    *((_DWORD *)v6 + 16) = self->_numSubs;
    *((_DWORD *)v6 + 28) |= 0x2000u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_43:
  *((_DWORD *)v6 + 8) = self->_gwSrvStatus;
  *((_DWORD *)v6 + 28) |= 0x20u;
  $61B41E93924E64F4A8EE0C468EC37E18 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x2000) != 0) {
    goto LABEL_44;
  }
LABEL_22:
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
LABEL_23:
    *((_DWORD *)v6 + 20) = self->_psPref;
    *((_DWORD *)v6 + 28) |= 0x8000u;
  }
LABEL_24:
  id v11 = [(NSData *)self->_plmn copyWithZone:a3];
  v12 = (void *)v6[9];
  v6[9] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_115;
  }
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  int v6 = *((_DWORD *)v4 + 28);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_115;
    }
  }
  else if (v6)
  {
    goto LABEL_115;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_rat != *((_DWORD *)v4 + 21)) {
      goto LABEL_115;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_srvStatus != *((_DWORD *)v4 + 24)) {
      goto LABEL_115;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_mcc != *((_DWORD *)v4 + 15)) {
      goto LABEL_115;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_subsId != *((_DWORD *)v4 + 25)) {
      goto LABEL_115;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_is95Sid != *((_DWORD *)v4 + 14)) {
      goto LABEL_115;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_is95Nid != *((_DWORD *)v4 + 13)) {
      goto LABEL_115;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_115;
  }
  sectorId = self->_sectorId;
  if ((unint64_t)sectorId | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](sectorId, "isEqual:")) {
      goto LABEL_115;
    }
    $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  }
  int v8 = *((_DWORD *)v4 + 28);
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_band != *((_DWORD *)v4 + 4)) {
      goto LABEL_115;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_115;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_channel != *((_DWORD *)v4 + 6)) {
      goto LABEL_115;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_115;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_baseId != *((_DWORD *)v4 + 5)) {
      goto LABEL_115;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_zoneId != *((_DWORD *)v4 + 26)) {
      goto LABEL_115;
    }
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_hdrSrvStatus != *((_DWORD *)v4 + 10)) {
      goto LABEL_115;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v8 & 0x100000) != 0)
    {
      if (self->_hdrHybrid)
      {
        if (!*((unsigned char *)v4 + 108)) {
          goto LABEL_115;
        }
        goto LABEL_73;
      }
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_73;
      }
    }
LABEL_115:
    unsigned __int8 v10 = 0;
    goto LABEL_116;
  }
  if ((v8 & 0x100000) != 0) {
    goto LABEL_115;
  }
LABEL_73:
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_hybridActiveBand != *((_DWORD *)v4 + 11)) {
      goto LABEL_115;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_hybridActiveChannel != *((_DWORD *)v4 + 12)) {
      goto LABEL_115;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_115;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_hdrPilotPn != *((_DWORD *)v4 + 9)) {
      goto LABEL_115;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0 || self->_pilotPn != *((_DWORD *)v4 + 17)) {
      goto LABEL_115;
    }
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_gwRat != *((_DWORD *)v4 + 7)) {
      goto LABEL_115;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_115;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_gwSrvStatus != *((_DWORD *)v4 + 8)) {
      goto LABEL_115;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v8 & 0x2000) == 0 || self->_numSubs != *((_DWORD *)v4 + 16)) {
      goto LABEL_115;
    }
  }
  else if ((v8 & 0x2000) != 0)
  {
    goto LABEL_115;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_psPref != *((_DWORD *)v4 + 20)) {
      goto LABEL_115;
    }
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_115;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 9)) {
    unsigned __int8 v10 = -[NSData isEqual:](plmn, "isEqual:");
  }
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_116:

  return v10;
}

- (unint64_t)hash
{
  $61B41E93924E64F4A8EE0C468EC37E18 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_rat;
      if ((*(_DWORD *)&has & 0x20000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_srvStatus;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_mcc;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_subsId;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v9 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v8 = 0;
  if ((*(_WORD *)&has & 0x800) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_is95Sid;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_8:
    uint64_t v10 = 2654435761 * self->_is95Nid;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v10 = 0;
LABEL_16:
  unint64_t v11 = (unint64_t)[(NSData *)self->_sectorId hash];
  $61B41E93924E64F4A8EE0C468EC37E18 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 2) != 0)
  {
    uint64_t v13 = 2654435761 * self->_band;
    if ((*(unsigned char *)&v12 & 8) != 0)
    {
LABEL_18:
      uint64_t v14 = 2654435761 * self->_channel;
      if ((*(unsigned char *)&v12 & 4) != 0) {
        goto LABEL_19;
      }
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(unsigned char *)&v12 & 8) != 0) {
      goto LABEL_18;
    }
  }
  uint64_t v14 = 0;
  if ((*(unsigned char *)&v12 & 4) != 0)
  {
LABEL_19:
    uint64_t v15 = 2654435761 * self->_baseId;
    if ((*(_DWORD *)&v12 & 0x80000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&v12 & 0x80000) != 0)
  {
LABEL_20:
    uint64_t v16 = 2654435761 * self->_zoneId;
    if ((*(unsigned char *)&v12 & 0x80) != 0) {
      goto LABEL_21;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&v12 & 0x80) != 0)
  {
LABEL_21:
    uint64_t v17 = 2654435761 * self->_hdrSrvStatus;
    if ((*(_DWORD *)&v12 & 0x100000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v17 = 0;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
LABEL_22:
    uint64_t v18 = 2654435761 * self->_hdrHybrid;
    if ((*(_WORD *)&v12 & 0x100) != 0) {
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v18 = 0;
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
LABEL_23:
    uint64_t v19 = 2654435761 * self->_hybridActiveBand;
    if ((*(_WORD *)&v12 & 0x200) != 0) {
      goto LABEL_24;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v19 = 0;
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
LABEL_24:
    uint64_t v20 = 2654435761 * self->_hybridActiveChannel;
    if ((*(unsigned char *)&v12 & 0x40) != 0) {
      goto LABEL_25;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&v12 & 0x40) != 0)
  {
LABEL_25:
    uint64_t v21 = 2654435761 * self->_hdrPilotPn;
    if ((*(_WORD *)&v12 & 0x4000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v21 = 0;
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
LABEL_26:
    uint64_t v22 = 2654435761 * self->_pilotPn;
    if ((*(unsigned char *)&v12 & 0x10) != 0) {
      goto LABEL_27;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v22 = 0;
  if ((*(unsigned char *)&v12 & 0x10) != 0)
  {
LABEL_27:
    uint64_t v23 = 2654435761 * self->_gwRat;
    if ((*(unsigned char *)&v12 & 0x20) != 0) {
      goto LABEL_28;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v23 = 0;
  if ((*(unsigned char *)&v12 & 0x20) != 0)
  {
LABEL_28:
    uint64_t v24 = 2654435761 * self->_gwSrvStatus;
    if ((*(_WORD *)&v12 & 0x2000) != 0) {
      goto LABEL_29;
    }
LABEL_43:
    uint64_t v25 = 0;
    if ((*(_WORD *)&v12 & 0x8000) != 0) {
      goto LABEL_30;
    }
LABEL_44:
    uint64_t v26 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v11 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ (unint64_t)[(NSData *)self->_plmn hash];
  }
LABEL_42:
  uint64_t v24 = 0;
  if ((*(_WORD *)&v12 & 0x2000) == 0) {
    goto LABEL_43;
  }
LABEL_29:
  uint64_t v25 = 2654435761 * self->_numSubs;
  if ((*(_WORD *)&v12 & 0x8000) == 0) {
    goto LABEL_44;
  }
LABEL_30:
  uint64_t v26 = 2654435761 * self->_psPref;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v11 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ (unint64_t)[(NSData *)self->_plmn hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 28);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)v4 + 28);
    if ((v5 & 0x10000) == 0)
    {
LABEL_3:
      if ((v5 & 0x20000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((v5 & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t rat = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x20000) == 0)
  {
LABEL_4:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_int srvStatus = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x1000) == 0)
  {
LABEL_5:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_mcc = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x40000) == 0)
  {
LABEL_6:
    if ((v5 & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_subsId = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x800) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_36:
  self->_is95Sid = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  if ((*((_DWORD *)v4 + 28) & 0x400) != 0)
  {
LABEL_8:
    self->_is95Nid = *((_DWORD *)v4 + 13);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_9:
  id v7 = v4;
  if (*((void *)v4 + 11))
  {
    -[CellularCdmaCellInfo setSectorId:](self, "setSectorId:");
    id v4 = v7;
  }
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 2) != 0)
  {
    self->_band = *((_DWORD *)v4 + 4);
    *(_DWORD *)&self->_has |= 2u;
    int v6 = *((_DWORD *)v4 + 28);
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_40;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_13;
  }
  self->_channel = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 4) == 0)
  {
LABEL_14:
    if ((v6 & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_baseId = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x80000) == 0)
  {
LABEL_15:
    if ((v6 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_zoneId = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x80) == 0)
  {
LABEL_16:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_int hdrSrvStatus = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x100000) == 0)
  {
LABEL_17:
    if ((v6 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_hdrHybrid = *((unsigned char *)v4 + 108);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x100) == 0)
  {
LABEL_18:
    if ((v6 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_hybridActiveBand = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x200) == 0)
  {
LABEL_19:
    if ((v6 & 0x40) == 0) {
      goto LABEL_20;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_hybridActiveChannel = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x40) == 0)
  {
LABEL_20:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_hdrPilotPn = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x4000) == 0)
  {
LABEL_21:
    if ((v6 & 0x10) == 0) {
      goto LABEL_22;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_pilotPn = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x10) == 0)
  {
LABEL_22:
    if ((v6 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_uint64_t gwRat = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x20) == 0)
  {
LABEL_23:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_int gwSrvStatus = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x2000) == 0)
  {
LABEL_24:
    if ((v6 & 0x8000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_50:
  self->_numSubs = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v4 + 28) & 0x8000) != 0)
  {
LABEL_25:
    self->_psPref = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_26:
  if (*((void *)v4 + 9))
  {
    -[CellularCdmaCellInfo setPlmn:](self, "setPlmn:");
    id v4 = v7;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)mcc
{
  return self->_mcc;
}

- (unsigned)is95Sid
{
  return self->_is95Sid;
}

- (unsigned)is95Nid
{
  return self->_is95Nid;
}

- (NSData)sectorId
{
  return self->_sectorId;
}

- (void)setSectorId:(id)a3
{
}

- (unsigned)channel
{
  return self->_channel;
}

- (unsigned)baseId
{
  return self->_baseId;
}

- (unsigned)zoneId
{
  return self->_zoneId;
}

- (BOOL)hdrHybrid
{
  return self->_hdrHybrid;
}

- (unsigned)hybridActiveChannel
{
  return self->_hybridActiveChannel;
}

- (unsigned)hdrPilotPn
{
  return self->_hdrPilotPn;
}

- (unsigned)pilotPn
{
  return self->_pilotPn;
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
  objc_storeStrong((id *)&self->_sectorId, 0);

  objc_storeStrong((id *)&self->_plmn, 0);
}

@end