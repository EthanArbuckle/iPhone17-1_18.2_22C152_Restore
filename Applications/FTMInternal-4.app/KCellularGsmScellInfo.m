@interface KCellularGsmScellInfo
- (BOOL)hasArfcn;
- (BOOL)hasBsic;
- (BOOL)hasCellId;
- (BOOL)hasGsmBand;
- (BOOL)hasLac;
- (BOOL)hasMcc;
- (BOOL)hasMnc;
- (BOOL)hasNumMncDigits;
- (BOOL)hasState;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)gsmBandAsString:(int)a3;
- (id)stateAsString:(int)a3;
- (int)StringAsGsmBand:(id)a3;
- (int)StringAsState:(id)a3;
- (int)gsmBand;
- (int)state;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)arfcn;
- (unsigned)bsic;
- (unsigned)cellId;
- (unsigned)lac;
- (unsigned)mcc;
- (unsigned)mnc;
- (unsigned)numMncDigits;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArfcn:(unsigned int)a3;
- (void)setBsic:(unsigned int)a3;
- (void)setCellId:(unsigned int)a3;
- (void)setGsmBand:(int)a3;
- (void)setHasArfcn:(BOOL)a3;
- (void)setHasBsic:(BOOL)a3;
- (void)setHasCellId:(BOOL)a3;
- (void)setHasGsmBand:(BOOL)a3;
- (void)setHasLac:(BOOL)a3;
- (void)setHasMcc:(BOOL)a3;
- (void)setHasMnc:(BOOL)a3;
- (void)setHasNumMncDigits:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLac:(unsigned int)a3;
- (void)setMcc:(unsigned int)a3;
- (void)setMnc:(unsigned int)a3;
- (void)setNumMncDigits:(unsigned int)a3;
- (void)setState:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularGsmScellInfo

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

- (void)setMcc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMcc
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMnc
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setLac:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLac
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCellId
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)gsmBand
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_gsmBand;
  }
  else {
    return 0;
  }
}

- (void)setGsmBand:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_gsmBand = a3;
}

- (void)setHasGsmBand:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasGsmBand
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)gsmBandAsString:(int)a3
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

- (void)setArfcn:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_arfcn = a3;
}

- (void)setHasArfcn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasArfcn
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setBsic:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_bsic = a3;
}

- (void)setHasBsic:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBsic
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)state
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_state;
  }
  else {
    return 1;
  }
}

- (void)setState:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasState
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"DEDICATED_STATE";
  }
  else if (a3 == 2)
  {
    int v4 = @"NON_DEDICATED_STATE";
  }
  else
  {
    int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v4;
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"DEDICATED_STATE"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"NON_DEDICATED_STATE"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumMncDigits
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
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

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularGsmScellInfo;
  __int16 v3 = [(KCellularGsmScellInfo *)&v7 description];
  int v4 = [(KCellularGsmScellInfo *)self dictionaryRepresentation];
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
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_mcc];
  [v3 setObject:v8 forKey:@"mcc"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v9 = +[NSNumber numberWithUnsignedInt:self->_mnc];
  [v3 setObject:v9 forKey:@"mnc"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v10 = +[NSNumber numberWithUnsignedInt:self->_lac];
  [v3 setObject:v10 forKey:@"lac"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  v11 = +[NSNumber numberWithUnsignedInt:self->_cellId];
  [v3 setObject:v11 forKey:@"cell_id"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_101;
  }
LABEL_21:
  v12 = @"SYS_BAND_BC0";
  switch(self->_gsmBand)
  {
    case 0:
      break;
    case 1:
      v12 = @"SYS_BAND_BC1";
      break;
    case 3:
      v12 = @"SYS_BAND_BC3";
      break;
    case 4:
      v12 = @"SYS_BAND_BC4";
      break;
    case 5:
      v12 = @"SYS_BAND_BC5";
      break;
    case 6:
      v12 = @"SYS_BAND_BC6";
      break;
    case 7:
      v12 = @"SYS_BAND_BC7";
      break;
    case 8:
      v12 = @"SYS_BAND_BC8";
      break;
    case 9:
      v12 = @"SYS_BAND_BC9";
      break;
    case 0xA:
      v12 = @"SYS_BAND_BC10";
      break;
    case 0xB:
      v12 = @"SYS_BAND_BC11";
      break;
    case 0xC:
      v12 = @"SYS_BAND_BC12";
      break;
    case 0xD:
      v12 = @"SYS_BAND_BC13";
      break;
    case 0xE:
      v12 = @"SYS_BAND_BC14";
      break;
    case 0xF:
      v12 = @"SYS_BAND_BC15";
      break;
    case 0x10:
      v12 = @"SYS_BAND_BC16";
      break;
    case 0x11:
      v12 = @"SYS_BAND_BC17";
      break;
    case 0x12:
      v12 = @"SYS_BAND_BC18";
      break;
    case 0x13:
      v12 = @"SYS_BAND_BC19";
      break;
    case 0x28:
      v12 = @"SYS_BAND_GSM_450";
      break;
    case 0x29:
      v12 = @"SYS_BAND_GSM_480";
      break;
    case 0x2A:
      v12 = @"SYS_BAND_GSM_750";
      break;
    case 0x2B:
      v12 = @"SYS_BAND_GSM_850";
      break;
    case 0x2C:
      v12 = @"SYS_BAND_GSM_EGSM_900";
      break;
    case 0x2D:
      v12 = @"SYS_BAND_GSM_PGSM_900";
      break;
    case 0x2E:
      v12 = @"SYS_BAND_GSM_RGSM_900";
      break;
    case 0x2F:
      v12 = @"SYS_BAND_GSM_DCS_1800";
      break;
    case 0x30:
      v12 = @"SYS_BAND_GSM_PCS_1900";
      break;
    case 0x50:
      v12 = @"SYS_BAND_WCDMA_I_IMT_2000";
      break;
    case 0x51:
      v12 = @"SYS_BAND_WCDMA_II_PCS_1900";
      break;
    case 0x52:
      v12 = @"SYS_BAND_WCDMA_III_1700";
      break;
    case 0x53:
      v12 = @"SYS_BAND_WCDMA_IV_1700";
      break;
    case 0x54:
      v12 = @"SYS_BAND_WCDMA_V_850";
      break;
    case 0x55:
      v12 = @"SYS_BAND_WCDMA_VI_800";
      break;
    case 0x56:
      v12 = @"SYS_BAND_WCDMA_VII_2600";
      break;
    case 0x57:
      v12 = @"SYS_BAND_WCDMA_VIII_900";
      break;
    case 0x58:
      v12 = @"SYS_BAND_WCDMA_IX_1700";
      break;
    case 0x5A:
      v12 = @"SYS_BAND_WCDMA_XI_1500";
      break;
    case 0x5B:
      v12 = @"SYS_BAND_WCDMA_XIX_850";
      break;
    case 0x78:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND1";
      break;
    case 0x79:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND2";
      break;
    case 0x7A:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND3";
      break;
    case 0x7B:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND4";
      break;
    case 0x7C:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND5";
      break;
    case 0x7D:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND6";
      break;
    case 0x7E:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND7";
      break;
    case 0x7F:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND8";
      break;
    case 0x80:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND9";
      break;
    case 0x81:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND10";
      break;
    case 0x82:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND11";
      break;
    case 0x83:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND12";
      break;
    case 0x84:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND13";
      break;
    case 0x85:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND14";
      break;
    case 0x88:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND17";
      break;
    case 0x89:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND18";
      break;
    case 0x8A:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND19";
      break;
    case 0x8B:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND20";
      break;
    case 0x8C:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND21";
      break;
    case 0x8F:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND24";
      break;
    case 0x90:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND25";
      break;
    case 0x91:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND26";
      break;
    case 0x98:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND33";
      break;
    case 0x99:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND34";
      break;
    case 0x9A:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND35";
      break;
    case 0x9B:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND36";
      break;
    case 0x9C:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND37";
      break;
    case 0x9D:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND38";
      break;
    case 0x9E:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND39";
      break;
    case 0x9F:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND40";
      break;
    case 0xA0:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND41";
      break;
    case 0xA1:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND42";
      break;
    case 0xA2:
      v12 = @"SYS_BAND_LTE_EUTRAN_BAND43";
      break;
    case 0xA3:
      v12 = @"SYS_BAND_UMTS_BAND1";
      break;
    case 0xA4:
      v12 = @"SYS_BAND_UMTS_BAND2";
      break;
    case 0xA5:
      v12 = @"SYS_BAND_UMTS_BAND3";
      break;
    case 0xA6:
      v12 = @"SYS_BAND_UMTS_BAND4";
      break;
    case 0xA7:
      v12 = @"SYS_BAND_UMTS_BAND5";
      break;
    case 0xA8:
      v12 = @"SYS_BAND_UMTS_BAND6";
      break;
    default:
      v12 = +[NSString stringWithFormat:@"(unknown: %i)", self->_gsmBand];
      break;
  }
  [v3 setObject:v12 forKey:@"gsm_band"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_102;
  }
LABEL_101:
  v13 = +[NSNumber numberWithUnsignedInt:self->_arfcn];
  [v3 setObject:v13 forKey:@"arfcn"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_103;
  }
LABEL_102:
  v14 = +[NSNumber numberWithUnsignedInt:self->_bsic];
  [v3 setObject:v14 forKey:@"bsic"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_109;
  }
LABEL_103:
  int state = self->_state;
  if (state == 1)
  {
    v16 = @"DEDICATED_STATE";
  }
  else if (state == 2)
  {
    v16 = @"NON_DEDICATED_STATE";
  }
  else
  {
    v16 = +[NSString stringWithFormat:@"(unknown: %i)", self->_state];
  }
  [v3 setObject:v16 forKey:@"state"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_109:
  v17 = +[NSNumber numberWithUnsignedInt:self->_numMncDigits];
  [v3 setObject:v17 forKey:@"num_mnc_digits"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    v5 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v5 forKey:@"subs_id"];
  }
LABEL_13:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000EDB58((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_12:
  }
    PBDataWriterWriteUint32Field();
LABEL_13:
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
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 9) = self->_mcc;
  *((_WORD *)v4 + 28) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 10) = self->_mnc;
  *((_WORD *)v4 + 28) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 8) = self->_lac;
  *((_WORD *)v4 + 28) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 6) = self->_cellId;
  *((_WORD *)v4 + 28) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 7) = self->_gsmBand;
  *((_WORD *)v4 + 28) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 4) = self->_arfcn;
  *((_WORD *)v4 + 28) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 5) = self->_bsic;
  *((_WORD *)v4 + 28) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 12) = self->_state;
  *((_WORD *)v4 + 28) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  *((_DWORD *)v4 + 11) = self->_numMncDigits;
  *((_WORD *)v4 + 28) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 13) = self->_subsId;
    *((_WORD *)v4 + 28) |= 0x400u;
  }
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 28) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 9) = self->_mcc;
  *((_WORD *)result + 28) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 10) = self->_mnc;
  *((_WORD *)result + 28) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 8) = self->_lac;
  *((_WORD *)result + 28) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 6) = self->_cellId;
  *((_WORD *)result + 28) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 7) = self->_gsmBand;
  *((_WORD *)result + 28) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 4) = self->_arfcn;
  *((_WORD *)result + 28) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 5) = self->_bsic;
  *((_WORD *)result + 28) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 12) = self->_state;
  *((_WORD *)result + 28) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      return result;
    }
    goto LABEL_12;
  }
LABEL_23:
  *((_DWORD *)result + 11) = self->_numMncDigits;
  *((_WORD *)result + 28) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    return result;
  }
LABEL_12:
  *((_DWORD *)result + 13) = self->_subsId;
  *((_WORD *)result + 28) |= 0x400u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 28);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_57;
    }
  }
  else if (v6)
  {
LABEL_57:
    BOOL v7 = 0;
    goto LABEL_58;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_mcc != *((_DWORD *)v4 + 9)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_mnc != *((_DWORD *)v4 + 10)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_lac != *((_DWORD *)v4 + 8)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_cellId != *((_DWORD *)v4 + 6)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_gsmBand != *((_DWORD *)v4 + 7)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_arfcn != *((_DWORD *)v4 + 4)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_bsic != *((_DWORD *)v4 + 5)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x200) == 0 || self->_state != *((_DWORD *)v4 + 12)) {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x200) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x100) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 11)) {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 13)) {
      goto LABEL_57;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x400) == 0;
  }
LABEL_58:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_mcc;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_mnc;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_lac;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_cellId;
    if ((has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_gsmBand;
    if ((has & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_arfcn;
    if ((has & 4) != 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v9 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_bsic;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_state;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v12 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_12;
    }
LABEL_23:
    uint64_t v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_22;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_numMncDigits;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_23;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 28);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 28);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_mcc = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_mnc = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_lac = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_cellId = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_gsmBand = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_arfcn = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_bsic = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_int state = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  self->_numMncDigits = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 28) & 0x400) != 0)
  {
LABEL_12:
    self->_subsId = *((_DWORD *)v4 + 13);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_13:
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

- (unsigned)arfcn
{
  return self->_arfcn;
}

- (unsigned)bsic
{
  return self->_bsic;
}

- (unsigned)numMncDigits
{
  return self->_numMncDigits;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end