@interface KCellularWcdmaCellInfo
- (BOOL)hasCellId;
- (BOOL)hasDlUarfcn;
- (BOOL)hasHspa;
- (BOOL)hasLac;
- (BOOL)hasMcc;
- (BOOL)hasMnc;
- (BOOL)hasNumMncDigits;
- (BOOL)hasNumSubs;
- (BOOL)hasPsc;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasWcdmaBand;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hspaAsString:(int)a3;
- (id)wcdmaBandAsString:(int)a3;
- (int)StringAsHspa:(id)a3;
- (int)StringAsWcdmaBand:(id)a3;
- (int)hspa;
- (int)wcdmaBand;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)cellId;
- (unsigned)dlUarfcn;
- (unsigned)lac;
- (unsigned)mcc;
- (unsigned)mnc;
- (unsigned)numMncDigits;
- (unsigned)numSubs;
- (unsigned)psc;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setDlUarfcn:(unsigned int)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasDlUarfcn:(BOOL)a3;
- (void)setHasHspa:(BOOL)a3;
- (void)setHasLac:(BOOL)a3;
- (void)setHasMcc:(BOOL)a3;
- (void)setHasMnc:(BOOL)a3;
- (void)setHasNumMncDigits:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsc:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWcdmaBand:(BOOL)a3;
- (void)setHspa:(int)a3;
- (void)setLac:(unsigned int)a3;
- (void)setMcc:(unsigned int)a3;
- (void)setMnc:(unsigned int)a3;
- (void)setNumMncDigits:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPsc:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWcdmaBand:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularWcdmaCellInfo

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

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumSubs
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMcc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMcc
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMnc
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLac
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCellId
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (int)wcdmaBand
{
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    return self->_wcdmaBand;
  }
  else {
    return 0;
  }
}

- (void)setWcdmaBand:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_wcdmaBand = a3;
}

- (void)setHasWcdmaBand:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasWcdmaBand
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)wcdmaBandAsString:(int)a3
{
  v4 = @"SYS_BAND_BC0";
  switch(a3)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v4 = @"SYS_BAND_BC1";
      break;
    case 3:
      v4 = @"SYS_BAND_BC3";
      break;
    case 4:
      v4 = @"SYS_BAND_BC4";
      break;
    case 5:
      v4 = @"SYS_BAND_BC5";
      break;
    case 6:
      v4 = @"SYS_BAND_BC6";
      break;
    case 7:
      v4 = @"SYS_BAND_BC7";
      break;
    case 8:
      v4 = @"SYS_BAND_BC8";
      break;
    case 9:
      v4 = @"SYS_BAND_BC9";
      break;
    case 10:
      v4 = @"SYS_BAND_BC10";
      break;
    case 11:
      v4 = @"SYS_BAND_BC11";
      break;
    case 12:
      v4 = @"SYS_BAND_BC12";
      break;
    case 13:
      v4 = @"SYS_BAND_BC13";
      break;
    case 14:
      v4 = @"SYS_BAND_BC14";
      break;
    case 15:
      v4 = @"SYS_BAND_BC15";
      break;
    case 16:
      v4 = @"SYS_BAND_BC16";
      break;
    case 17:
      v4 = @"SYS_BAND_BC17";
      break;
    case 18:
      v4 = @"SYS_BAND_BC18";
      break;
    case 19:
      v4 = @"SYS_BAND_BC19";
      break;
    case 40:
      v4 = @"SYS_BAND_GSM_450";
      break;
    case 41:
      v4 = @"SYS_BAND_GSM_480";
      break;
    case 42:
      v4 = @"SYS_BAND_GSM_750";
      break;
    case 43:
      v4 = @"SYS_BAND_GSM_850";
      break;
    case 44:
      v4 = @"SYS_BAND_GSM_EGSM_900";
      break;
    case 45:
      v4 = @"SYS_BAND_GSM_PGSM_900";
      break;
    case 46:
      v4 = @"SYS_BAND_GSM_RGSM_900";
      break;
    case 47:
      v4 = @"SYS_BAND_GSM_DCS_1800";
      break;
    case 48:
      v4 = @"SYS_BAND_GSM_PCS_1900";
      break;
    case 80:
      v4 = @"SYS_BAND_WCDMA_I_IMT_2000";
      break;
    case 81:
      v4 = @"SYS_BAND_WCDMA_II_PCS_1900";
      break;
    case 82:
      v4 = @"SYS_BAND_WCDMA_III_1700";
      break;
    case 83:
      v4 = @"SYS_BAND_WCDMA_IV_1700";
      break;
    case 84:
      v4 = @"SYS_BAND_WCDMA_V_850";
      break;
    case 85:
      v4 = @"SYS_BAND_WCDMA_VI_800";
      break;
    case 86:
      v4 = @"SYS_BAND_WCDMA_VII_2600";
      break;
    case 87:
      v4 = @"SYS_BAND_WCDMA_VIII_900";
      break;
    case 88:
      v4 = @"SYS_BAND_WCDMA_IX_1700";
      break;
    case 90:
      v4 = @"SYS_BAND_WCDMA_XI_1500";
      break;
    case 91:
      v4 = @"SYS_BAND_WCDMA_XIX_850";
      break;
    case 120:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND1";
      break;
    case 121:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND2";
      break;
    case 122:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND3";
      break;
    case 123:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND4";
      break;
    case 124:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND5";
      break;
    case 125:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND6";
      break;
    case 126:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND7";
      break;
    case 127:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND8";
      break;
    case 128:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND9";
      break;
    case 129:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND10";
      break;
    case 130:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND11";
      break;
    case 131:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND12";
      break;
    case 132:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND13";
      break;
    case 133:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND14";
      break;
    case 136:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND17";
      break;
    case 137:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND18";
      break;
    case 138:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND19";
      break;
    case 139:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND20";
      break;
    case 140:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND21";
      break;
    case 143:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND24";
      break;
    case 144:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND25";
      break;
    case 145:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND26";
      break;
    case 152:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND33";
      break;
    case 153:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND34";
      break;
    case 154:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND35";
      break;
    case 155:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND36";
      break;
    case 156:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND37";
      break;
    case 157:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND38";
      break;
    case 158:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND39";
      break;
    case 159:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND40";
      break;
    case 160:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND41";
      break;
    case 161:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND42";
      break;
    case 162:
      v4 = @"SYS_BAND_LTE_EUTRAN_BAND43";
      break;
    case 163:
      v4 = @"SYS_BAND_UMTS_BAND1";
      break;
    case 164:
      v4 = @"SYS_BAND_UMTS_BAND2";
      break;
    case 165:
      v4 = @"SYS_BAND_UMTS_BAND3";
      break;
    case 166:
      v4 = @"SYS_BAND_UMTS_BAND4";
      break;
    case 167:
      v4 = @"SYS_BAND_UMTS_BAND5";
      break;
    case 168:
      v4 = @"SYS_BAND_UMTS_BAND6";
      break;
    default:
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
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

- (int)hspa
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_hspa;
  }
  else {
    return 0;
  }
}

- (void)setHspa:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_hspa = a3;
}

- (void)setHasHspa:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHspa
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)hspaAsString:(int)a3
{
  if (a3 >= 4)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100287798 + a3);
  }

  return v3;
}

- (int)StringAsHspa:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_HS_IND_HSDPA_HSUPA_UNSUPP_CELL"])
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
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setDlUarfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_dlUarfcn = a3;
}

- (void)setHasDlUarfcn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDlUarfcn
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPsc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_psc = a3;
}

- (void)setHasPsc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPsc
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumMncDigits
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularWcdmaCellInfo;
  __int16 v3 = [(KCellularWcdmaCellInfo *)&v7 description];
  int v4 = [(KCellularWcdmaCellInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v8 forKey:@"subs_id"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  v9 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v9 forKey:@"num_subs"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  v10 = +[NSNumber numberWithUnsignedInt:self->_mcc];
  [v3 setObject:v10 forKey:@"mcc"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  v11 = +[NSNumber numberWithUnsignedInt:self->_mnc];
  [v3 setObject:v11 forKey:@"mnc"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  v12 = +[NSNumber numberWithUnsignedInt:self->_lac];
  [v3 setObject:v12 forKey:@"lac"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  v13 = +[NSNumber numberWithUnsignedInt:self->_cellId];
  [v3 setObject:v13 forKey:@"cell_id"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_104;
  }
LABEL_24:
  v14 = @"SYS_BAND_BC0";
  switch(self->_wcdmaBand)
  {
    case 0:
      break;
    case 1:
      v14 = @"SYS_BAND_BC1";
      break;
    case 3:
      v14 = @"SYS_BAND_BC3";
      break;
    case 4:
      v14 = @"SYS_BAND_BC4";
      break;
    case 5:
      v14 = @"SYS_BAND_BC5";
      break;
    case 6:
      v14 = @"SYS_BAND_BC6";
      break;
    case 7:
      v14 = @"SYS_BAND_BC7";
      break;
    case 8:
      v14 = @"SYS_BAND_BC8";
      break;
    case 9:
      v14 = @"SYS_BAND_BC9";
      break;
    case 0xA:
      v14 = @"SYS_BAND_BC10";
      break;
    case 0xB:
      v14 = @"SYS_BAND_BC11";
      break;
    case 0xC:
      v14 = @"SYS_BAND_BC12";
      break;
    case 0xD:
      v14 = @"SYS_BAND_BC13";
      break;
    case 0xE:
      v14 = @"SYS_BAND_BC14";
      break;
    case 0xF:
      v14 = @"SYS_BAND_BC15";
      break;
    case 0x10:
      v14 = @"SYS_BAND_BC16";
      break;
    case 0x11:
      v14 = @"SYS_BAND_BC17";
      break;
    case 0x12:
      v14 = @"SYS_BAND_BC18";
      break;
    case 0x13:
      v14 = @"SYS_BAND_BC19";
      break;
    case 0x28:
      v14 = @"SYS_BAND_GSM_450";
      break;
    case 0x29:
      v14 = @"SYS_BAND_GSM_480";
      break;
    case 0x2A:
      v14 = @"SYS_BAND_GSM_750";
      break;
    case 0x2B:
      v14 = @"SYS_BAND_GSM_850";
      break;
    case 0x2C:
      v14 = @"SYS_BAND_GSM_EGSM_900";
      break;
    case 0x2D:
      v14 = @"SYS_BAND_GSM_PGSM_900";
      break;
    case 0x2E:
      v14 = @"SYS_BAND_GSM_RGSM_900";
      break;
    case 0x2F:
      v14 = @"SYS_BAND_GSM_DCS_1800";
      break;
    case 0x30:
      v14 = @"SYS_BAND_GSM_PCS_1900";
      break;
    case 0x50:
      v14 = @"SYS_BAND_WCDMA_I_IMT_2000";
      break;
    case 0x51:
      v14 = @"SYS_BAND_WCDMA_II_PCS_1900";
      break;
    case 0x52:
      v14 = @"SYS_BAND_WCDMA_III_1700";
      break;
    case 0x53:
      v14 = @"SYS_BAND_WCDMA_IV_1700";
      break;
    case 0x54:
      v14 = @"SYS_BAND_WCDMA_V_850";
      break;
    case 0x55:
      v14 = @"SYS_BAND_WCDMA_VI_800";
      break;
    case 0x56:
      v14 = @"SYS_BAND_WCDMA_VII_2600";
      break;
    case 0x57:
      v14 = @"SYS_BAND_WCDMA_VIII_900";
      break;
    case 0x58:
      v14 = @"SYS_BAND_WCDMA_IX_1700";
      break;
    case 0x5A:
      v14 = @"SYS_BAND_WCDMA_XI_1500";
      break;
    case 0x5B:
      v14 = @"SYS_BAND_WCDMA_XIX_850";
      break;
    case 0x78:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND1";
      break;
    case 0x79:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND2";
      break;
    case 0x7A:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND3";
      break;
    case 0x7B:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND4";
      break;
    case 0x7C:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND5";
      break;
    case 0x7D:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND6";
      break;
    case 0x7E:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND7";
      break;
    case 0x7F:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND8";
      break;
    case 0x80:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND9";
      break;
    case 0x81:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND10";
      break;
    case 0x82:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND11";
      break;
    case 0x83:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND12";
      break;
    case 0x84:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND13";
      break;
    case 0x85:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND14";
      break;
    case 0x88:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND17";
      break;
    case 0x89:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND18";
      break;
    case 0x8A:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND19";
      break;
    case 0x8B:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND20";
      break;
    case 0x8C:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND21";
      break;
    case 0x8F:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND24";
      break;
    case 0x90:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND25";
      break;
    case 0x91:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND26";
      break;
    case 0x98:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND33";
      break;
    case 0x99:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND34";
      break;
    case 0x9A:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND35";
      break;
    case 0x9B:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND36";
      break;
    case 0x9C:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND37";
      break;
    case 0x9D:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND38";
      break;
    case 0x9E:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND39";
      break;
    case 0x9F:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND40";
      break;
    case 0xA0:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND41";
      break;
    case 0xA1:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND42";
      break;
    case 0xA2:
      v14 = @"SYS_BAND_LTE_EUTRAN_BAND43";
      break;
    case 0xA3:
      v14 = @"SYS_BAND_UMTS_BAND1";
      break;
    case 0xA4:
      v14 = @"SYS_BAND_UMTS_BAND2";
      break;
    case 0xA5:
      v14 = @"SYS_BAND_UMTS_BAND3";
      break;
    case 0xA6:
      v14 = @"SYS_BAND_UMTS_BAND4";
      break;
    case 0xA7:
      v14 = @"SYS_BAND_UMTS_BAND5";
      break;
    case 0xA8:
      v14 = @"SYS_BAND_UMTS_BAND6";
      break;
    default:
      v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_wcdmaBand];
      break;
  }
  [v3 setObject:v14 forKey:@"wcdma_band"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_108;
  }
LABEL_104:
  uint64_t hspa = self->_hspa;
  if (hspa >= 4)
  {
    v16 = +[NSString stringWithFormat:@"(unknown: %i)", self->_hspa];
  }
  else
  {
    v16 = *(&off_100287798 + hspa);
  }
  [v3 setObject:v16 forKey:@"hspa"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_109;
  }
LABEL_108:
  v17 = +[NSNumber numberWithUnsignedInt:self->_dlUarfcn];
  [v3 setObject:v17 forKey:@"dl_uarfcn"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_109:
  v18 = +[NSNumber numberWithUnsignedInt:self->_psc];
  [v3 setObject:v18 forKey:@"psc"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_13:
    v5 = +[NSNumber numberWithUnsignedInt:self->_numMncDigits];
    [v3 setObject:v5 forKey:@"num_mnc_digits"];
  }
LABEL_14:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A8920((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_13:
  }
    PBDataWriterWriteInt32Field();
LABEL_14:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 30) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_subsId;
  *((_WORD *)v4 + 30) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 11) = self->_numSubs;
  *((_WORD *)v4 + 30) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 8) = self->_mcc;
  *((_WORD *)v4 + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 9) = self->_mnc;
  *((_WORD *)v4 + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 7) = self->_lac;
  *((_WORD *)v4 + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 4) = self->_cellId;
  *((_WORD *)v4 + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 14) = self->_wcdmaBand;
  *((_WORD *)v4 + 30) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 5) = self->_dlUarfcn;
  *((_WORD *)v4 + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 12) = self->_psc;
  *((_WORD *)v4 + 30) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  *((_DWORD *)v4 + 10) = self->_numMncDigits;
  *((_WORD *)v4 + 30) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 6) = self->_hspa;
    *((_WORD *)v4 + 30) |= 8u;
  }
LABEL_14:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 30) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 13) = self->_subsId;
  *((_WORD *)result + 30) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 11) = self->_numSubs;
  *((_WORD *)result + 30) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 8) = self->_mcc;
  *((_WORD *)result + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 9) = self->_mnc;
  *((_WORD *)result + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 7) = self->_lac;
  *((_WORD *)result + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 4) = self->_cellId;
  *((_WORD *)result + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 14) = self->_wcdmaBand;
  *((_WORD *)result + 30) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 5) = self->_dlUarfcn;
  *((_WORD *)result + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 12) = self->_psc;
  *((_WORD *)result + 30) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_25:
  *((_DWORD *)result + 10) = self->_numMncDigits;
  *((_WORD *)result + 30) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_13:
  *((_DWORD *)result + 6) = self->_hspa;
  *((_WORD *)result + 30) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_62;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 30);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_62;
    }
  }
  else if (v6)
  {
LABEL_62:
    BOOL v7 = 0;
    goto LABEL_63;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 13)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x400) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0 || self->_numSubs != *((_DWORD *)v4 + 11)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_mcc != *((_DWORD *)v4 + 8)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_mnc != *((_DWORD *)v4 + 9)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_lac != *((_DWORD *)v4 + 7)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_cellId != *((_DWORD *)v4 + 4)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x800) == 0 || self->_wcdmaBand != *((_DWORD *)v4 + 14)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x800) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_dlUarfcn != *((_DWORD *)v4 + 5)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x200) == 0 || self->_psc != *((_DWORD *)v4 + 12)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x200) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 10)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_hspa != *((_DWORD *)v4 + 6)) {
      goto LABEL_62;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 8) == 0;
  }
LABEL_63:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_subsId;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_numSubs;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_mcc;
    if ((has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v6 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_mnc;
    if ((has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_lac;
    if ((has & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_cellId;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_wcdmaBand;
    if ((has & 4) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = 0;
  if ((has & 4) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_dlUarfcn;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_psc;
    if ((has & 0x80) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v13 = 0;
    if ((has & 8) != 0) {
      goto LABEL_13;
    }
LABEL_25:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  uint64_t v12 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_numMncDigits;
  if ((has & 8) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_hspa;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 30);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 30);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_subsId = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_numSubs = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_mcc = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_mnc = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_lac = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_cellId = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_wcdmaBand = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_dlUarfcn = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_psc = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_12:
    if ((v5 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  self->_numMncDigits = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 30) & 8) != 0)
  {
LABEL_13:
    self->_uint64_t hspa = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_14:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)numSubs
{
  return self->_numSubs;
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

- (unsigned)numMncDigits
{
  return self->_numMncDigits;
}

@end