@interface CellularWcdmaTxRxHist
- (BOOL)hasDuration;
- (BOOL)hasInVoiceCall;
- (BOOL)hasMinAcTxLevelDbm;
- (BOOL)hasMinAdTxLevelDbm;
- (BOOL)hasMinRxLevelDbm;
- (BOOL)hasMinRxLevelIdleDbm;
- (BOOL)hasMinSecRxLevelDbm;
- (BOOL)hasMinSecRxLevelIdleDbm;
- (BOOL)hasMinSecTxLevelDbm;
- (BOOL)hasMinTxLevelDbm;
- (BOOL)hasTimestamp;
- (BOOL)hasWcdmaBand;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)wcdmaBandAsString:(int)a3;
- (int)StringAsWcdmaBand:(id)a3;
- (int)minAcTxLevelDbm;
- (int)minAdTxLevelDbm;
- (int)minRxLevelDbm;
- (int)minRxLevelIdleDbm;
- (int)minSecRxLevelDbm;
- (int)minSecRxLevelIdleDbm;
- (int)minSecTxLevelDbm;
- (int)minTxLevelDbm;
- (int)wcdmaBand;
- (unint64_t)acTxBinsCount;
- (unint64_t)adTxBinsCount;
- (unint64_t)hash;
- (unint64_t)rxBinsCount;
- (unint64_t)rxBinsIdlesCount;
- (unint64_t)secRxBinsCount;
- (unint64_t)secRxBinsIdlesCount;
- (unint64_t)secTxBinsCount;
- (unint64_t)timestamp;
- (unint64_t)txBinsCount;
- (unsigned)acTxBins;
- (unsigned)acTxBinsAtIndex:(unint64_t)a3;
- (unsigned)adTxBins;
- (unsigned)adTxBinsAtIndex:(unint64_t)a3;
- (unsigned)duration;
- (unsigned)inVoiceCall;
- (unsigned)rxBins;
- (unsigned)rxBinsAtIndex:(unint64_t)a3;
- (unsigned)rxBinsIdleAtIndex:(unint64_t)a3;
- (unsigned)rxBinsIdles;
- (unsigned)secRxBins;
- (unsigned)secRxBinsAtIndex:(unint64_t)a3;
- (unsigned)secRxBinsIdleAtIndex:(unint64_t)a3;
- (unsigned)secRxBinsIdles;
- (unsigned)secTxBins;
- (unsigned)secTxBinsAtIndex:(unint64_t)a3;
- (unsigned)txBins;
- (unsigned)txBinsAtIndex:(unint64_t)a3;
- (void)addAcTxBins:(unsigned int)a3;
- (void)addAdTxBins:(unsigned int)a3;
- (void)addRxBins:(unsigned int)a3;
- (void)addRxBinsIdle:(unsigned int)a3;
- (void)addSecRxBins:(unsigned int)a3;
- (void)addSecRxBinsIdle:(unsigned int)a3;
- (void)addSecTxBins:(unsigned int)a3;
- (void)addTxBins:(unsigned int)a3;
- (void)clearAcTxBins;
- (void)clearAdTxBins;
- (void)clearRxBins;
- (void)clearRxBinsIdles;
- (void)clearSecRxBins;
- (void)clearSecRxBinsIdles;
- (void)clearSecTxBins;
- (void)clearTxBins;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAcTxBins:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setAdTxBins:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDuration:(unsigned int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasInVoiceCall:(BOOL)a3;
- (void)setHasMinAcTxLevelDbm:(BOOL)a3;
- (void)setHasMinAdTxLevelDbm:(BOOL)a3;
- (void)setHasMinRxLevelDbm:(BOOL)a3;
- (void)setHasMinRxLevelIdleDbm:(BOOL)a3;
- (void)setHasMinSecRxLevelDbm:(BOOL)a3;
- (void)setHasMinSecRxLevelIdleDbm:(BOOL)a3;
- (void)setHasMinSecTxLevelDbm:(BOOL)a3;
- (void)setHasMinTxLevelDbm:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWcdmaBand:(BOOL)a3;
- (void)setInVoiceCall:(unsigned int)a3;
- (void)setMinAcTxLevelDbm:(int)a3;
- (void)setMinAdTxLevelDbm:(int)a3;
- (void)setMinRxLevelDbm:(int)a3;
- (void)setMinRxLevelIdleDbm:(int)a3;
- (void)setMinSecRxLevelDbm:(int)a3;
- (void)setMinSecRxLevelIdleDbm:(int)a3;
- (void)setMinSecTxLevelDbm:(int)a3;
- (void)setMinTxLevelDbm:(int)a3;
- (void)setRxBins:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRxBinsIdles:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSecRxBins:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSecRxBinsIdles:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSecTxBins:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxBins:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setWcdmaBand:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularWcdmaTxRxHist

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CellularWcdmaTxRxHist;
  [(CellularWcdmaTxRxHist *)&v3 dealloc];
}

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

- (void)setDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDuration
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

- (void)setInVoiceCall:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_inVoiceCall = a3;
}

- (void)setHasInVoiceCall:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasInVoiceCall
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)minRxLevelDbm
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_minRxLevelDbm;
  }
  else {
    return -121;
  }
}

- (void)setMinRxLevelDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_minRxLevelDbm = a3;
}

- (void)setHasMinRxLevelDbm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMinRxLevelDbm
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (unint64_t)rxBinsCount
{
  return self->_rxBins.count;
}

- (unsigned)rxBins
{
  return self->_rxBins.list;
}

- (void)clearRxBins
{
}

- (void)addRxBins:(unsigned int)a3
{
}

- (unsigned)rxBinsAtIndex:(unint64_t)a3
{
  p_rxBins = &self->_rxBins;
  unint64_t count = self->_rxBins.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rxBins->list[a3];
}

- (void)setRxBins:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (int)minSecRxLevelDbm
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_minSecRxLevelDbm;
  }
  else {
    return -121;
  }
}

- (void)setMinSecRxLevelDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_minSecRxLevelDbm = a3;
}

- (void)setHasMinSecRxLevelDbm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMinSecRxLevelDbm
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (unint64_t)secRxBinsCount
{
  return self->_secRxBins.count;
}

- (unsigned)secRxBins
{
  return self->_secRxBins.list;
}

- (void)clearSecRxBins
{
}

- (void)addSecRxBins:(unsigned int)a3
{
}

- (unsigned)secRxBinsAtIndex:(unint64_t)a3
{
  p_secRxBins = &self->_secRxBins;
  unint64_t count = self->_secRxBins.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_secRxBins->list[a3];
}

- (void)setSecRxBins:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (int)minTxLevelDbm
{
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    return self->_minTxLevelDbm;
  }
  else {
    return -56;
  }
}

- (void)setMinTxLevelDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_minTxLevelDbm = a3;
}

- (void)setHasMinTxLevelDbm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasMinTxLevelDbm
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (unint64_t)txBinsCount
{
  return self->_txBins.count;
}

- (unsigned)txBins
{
  return self->_txBins.list;
}

- (void)clearTxBins
{
}

- (void)addTxBins:(unsigned int)a3
{
}

- (unsigned)txBinsAtIndex:(unint64_t)a3
{
  p_txBins = &self->_txBins;
  unint64_t count = self->_txBins.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_txBins->list[a3];
}

- (void)setTxBins:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (int)minRxLevelIdleDbm
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_minRxLevelIdleDbm;
  }
  else {
    return -121;
  }
}

- (void)setMinRxLevelIdleDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_minRxLevelIdleDbm = a3;
}

- (void)setHasMinRxLevelIdleDbm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMinRxLevelIdleDbm
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (unint64_t)rxBinsIdlesCount
{
  return self->_rxBinsIdles.count;
}

- (unsigned)rxBinsIdles
{
  return self->_rxBinsIdles.list;
}

- (void)clearRxBinsIdles
{
}

- (void)addRxBinsIdle:(unsigned int)a3
{
}

- (unsigned)rxBinsIdleAtIndex:(unint64_t)a3
{
  p_rxBinsIdles = &self->_rxBinsIdles;
  unint64_t count = self->_rxBinsIdles.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rxBinsIdles->list[a3];
}

- (void)setRxBinsIdles:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (int)minSecRxLevelIdleDbm
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_minSecRxLevelIdleDbm;
  }
  else {
    return -121;
  }
}

- (void)setMinSecRxLevelIdleDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_minSecRxLevelIdleDbm = a3;
}

- (void)setHasMinSecRxLevelIdleDbm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMinSecRxLevelIdleDbm
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (unint64_t)secRxBinsIdlesCount
{
  return self->_secRxBinsIdles.count;
}

- (unsigned)secRxBinsIdles
{
  return self->_secRxBinsIdles.list;
}

- (void)clearSecRxBinsIdles
{
}

- (void)addSecRxBinsIdle:(unsigned int)a3
{
}

- (unsigned)secRxBinsIdleAtIndex:(unint64_t)a3
{
  p_secRxBinsIdles = &self->_secRxBinsIdles;
  unint64_t count = self->_secRxBinsIdles.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_secRxBinsIdles->list[a3];
}

- (void)setSecRxBinsIdles:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (int)minSecTxLevelDbm
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_minSecTxLevelDbm;
  }
  else {
    return -56;
  }
}

- (void)setMinSecTxLevelDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_minSecTxLevelDbm = a3;
}

- (void)setHasMinSecTxLevelDbm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasMinSecTxLevelDbm
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (unint64_t)secTxBinsCount
{
  return self->_secTxBins.count;
}

- (unsigned)secTxBins
{
  return self->_secTxBins.list;
}

- (void)clearSecTxBins
{
}

- (void)addSecTxBins:(unsigned int)a3
{
}

- (unsigned)secTxBinsAtIndex:(unint64_t)a3
{
  p_secTxBins = &self->_secTxBins;
  unint64_t count = self->_secTxBins.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_secTxBins->list[a3];
}

- (void)setSecTxBins:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (int)minAcTxLevelDbm
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_minAcTxLevelDbm;
  }
  else {
    return -56;
  }
}

- (void)setMinAcTxLevelDbm:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_minAcTxLevelDbm = a3;
}

- (void)setHasMinAcTxLevelDbm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMinAcTxLevelDbm
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (unint64_t)acTxBinsCount
{
  return self->_acTxBins.count;
}

- (unsigned)acTxBins
{
  return self->_acTxBins.list;
}

- (void)clearAcTxBins
{
}

- (void)addAcTxBins:(unsigned int)a3
{
}

- (unsigned)acTxBinsAtIndex:(unint64_t)a3
{
  p_acTxBins = &self->_acTxBins;
  unint64_t count = self->_acTxBins.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_acTxBins->list[a3];
}

- (void)setAcTxBins:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (int)minAdTxLevelDbm
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_minAdTxLevelDbm;
  }
  else {
    return -56;
  }
}

- (void)setMinAdTxLevelDbm:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_minAdTxLevelDbm = a3;
}

- (void)setHasMinAdTxLevelDbm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMinAdTxLevelDbm
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (unint64_t)adTxBinsCount
{
  return self->_adTxBins.count;
}

- (unsigned)adTxBins
{
  return self->_adTxBins.list;
}

- (void)clearAdTxBins
{
}

- (void)addAdTxBins:(unsigned int)a3
{
}

- (unsigned)adTxBinsAtIndex:(unint64_t)a3
{
  p_adTxBins = &self->_adTxBins;
  unint64_t count = self->_adTxBins.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_adTxBins->list[a3];
}

- (void)setAdTxBins:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularWcdmaTxRxHist;
  __int16 v3 = [(CellularWcdmaTxRxHist *)&v7 description];
  int v4 = [(CellularWcdmaTxRxHist *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v22 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v22 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v23 = +[NSNumber numberWithUnsignedInt:self->_duration];
  [v3 setObject:v23 forKey:@"duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_106;
  }
LABEL_26:
  v24 = @"SYS_BAND_BC0";
  switch(self->_wcdmaBand)
  {
    case 0:
      break;
    case 1:
      v24 = @"SYS_BAND_BC1";
      break;
    case 3:
      v24 = @"SYS_BAND_BC3";
      break;
    case 4:
      v24 = @"SYS_BAND_BC4";
      break;
    case 5:
      v24 = @"SYS_BAND_BC5";
      break;
    case 6:
      v24 = @"SYS_BAND_BC6";
      break;
    case 7:
      v24 = @"SYS_BAND_BC7";
      break;
    case 8:
      v24 = @"SYS_BAND_BC8";
      break;
    case 9:
      v24 = @"SYS_BAND_BC9";
      break;
    case 0xA:
      v24 = @"SYS_BAND_BC10";
      break;
    case 0xB:
      v24 = @"SYS_BAND_BC11";
      break;
    case 0xC:
      v24 = @"SYS_BAND_BC12";
      break;
    case 0xD:
      v24 = @"SYS_BAND_BC13";
      break;
    case 0xE:
      v24 = @"SYS_BAND_BC14";
      break;
    case 0xF:
      v24 = @"SYS_BAND_BC15";
      break;
    case 0x10:
      v24 = @"SYS_BAND_BC16";
      break;
    case 0x11:
      v24 = @"SYS_BAND_BC17";
      break;
    case 0x12:
      v24 = @"SYS_BAND_BC18";
      break;
    case 0x13:
      v24 = @"SYS_BAND_BC19";
      break;
    case 0x28:
      v24 = @"SYS_BAND_GSM_450";
      break;
    case 0x29:
      v24 = @"SYS_BAND_GSM_480";
      break;
    case 0x2A:
      v24 = @"SYS_BAND_GSM_750";
      break;
    case 0x2B:
      v24 = @"SYS_BAND_GSM_850";
      break;
    case 0x2C:
      v24 = @"SYS_BAND_GSM_EGSM_900";
      break;
    case 0x2D:
      v24 = @"SYS_BAND_GSM_PGSM_900";
      break;
    case 0x2E:
      v24 = @"SYS_BAND_GSM_RGSM_900";
      break;
    case 0x2F:
      v24 = @"SYS_BAND_GSM_DCS_1800";
      break;
    case 0x30:
      v24 = @"SYS_BAND_GSM_PCS_1900";
      break;
    case 0x50:
      v24 = @"SYS_BAND_WCDMA_I_IMT_2000";
      break;
    case 0x51:
      v24 = @"SYS_BAND_WCDMA_II_PCS_1900";
      break;
    case 0x52:
      v24 = @"SYS_BAND_WCDMA_III_1700";
      break;
    case 0x53:
      v24 = @"SYS_BAND_WCDMA_IV_1700";
      break;
    case 0x54:
      v24 = @"SYS_BAND_WCDMA_V_850";
      break;
    case 0x55:
      v24 = @"SYS_BAND_WCDMA_VI_800";
      break;
    case 0x56:
      v24 = @"SYS_BAND_WCDMA_VII_2600";
      break;
    case 0x57:
      v24 = @"SYS_BAND_WCDMA_VIII_900";
      break;
    case 0x58:
      v24 = @"SYS_BAND_WCDMA_IX_1700";
      break;
    case 0x5A:
      v24 = @"SYS_BAND_WCDMA_XI_1500";
      break;
    case 0x5B:
      v24 = @"SYS_BAND_WCDMA_XIX_850";
      break;
    case 0x78:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND1";
      break;
    case 0x79:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND2";
      break;
    case 0x7A:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND3";
      break;
    case 0x7B:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND4";
      break;
    case 0x7C:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND5";
      break;
    case 0x7D:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND6";
      break;
    case 0x7E:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND7";
      break;
    case 0x7F:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND8";
      break;
    case 0x80:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND9";
      break;
    case 0x81:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND10";
      break;
    case 0x82:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND11";
      break;
    case 0x83:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND12";
      break;
    case 0x84:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND13";
      break;
    case 0x85:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND14";
      break;
    case 0x88:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND17";
      break;
    case 0x89:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND18";
      break;
    case 0x8A:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND19";
      break;
    case 0x8B:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND20";
      break;
    case 0x8C:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND21";
      break;
    case 0x8F:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND24";
      break;
    case 0x90:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND25";
      break;
    case 0x91:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND26";
      break;
    case 0x98:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND33";
      break;
    case 0x99:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND34";
      break;
    case 0x9A:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND35";
      break;
    case 0x9B:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND36";
      break;
    case 0x9C:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND37";
      break;
    case 0x9D:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND38";
      break;
    case 0x9E:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND39";
      break;
    case 0x9F:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND40";
      break;
    case 0xA0:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND41";
      break;
    case 0xA1:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND42";
      break;
    case 0xA2:
      v24 = @"SYS_BAND_LTE_EUTRAN_BAND43";
      break;
    case 0xA3:
      v24 = @"SYS_BAND_UMTS_BAND1";
      break;
    case 0xA4:
      v24 = @"SYS_BAND_UMTS_BAND2";
      break;
    case 0xA5:
      v24 = @"SYS_BAND_UMTS_BAND3";
      break;
    case 0xA6:
      v24 = @"SYS_BAND_UMTS_BAND4";
      break;
    case 0xA7:
      v24 = @"SYS_BAND_UMTS_BAND5";
      break;
    case 0xA8:
      v24 = @"SYS_BAND_UMTS_BAND6";
      break;
    default:
      v24 = +[NSString stringWithFormat:@"(unknown: %i)", self->_wcdmaBand];
      break;
  }
  [v3 setObject:v24 forKey:@"wcdma_band"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_106:
  v25 = +[NSNumber numberWithUnsignedInt:self->_inVoiceCall];
  [v3 setObject:v25 forKey:@"in_voice_call"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    v5 = +[NSNumber numberWithInt:self->_minRxLevelDbm];
    [v3 setObject:v5 forKey:@"min_rx_level_dbm"];
  }
LABEL_7:
  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"rx_bins"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    objc_super v7 = +[NSNumber numberWithInt:self->_minSecRxLevelDbm];
    [v3 setObject:v7 forKey:@"min_sec_rx_level_dbm"];
  }
  v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"sec_rx_bins"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v9 = +[NSNumber numberWithInt:self->_minTxLevelDbm];
    [v3 setObject:v9 forKey:@"min_tx_level_dbm"];
  }
  v10 = PBRepeatedUInt32NSArray();
  [v3 setObject:v10 forKey:@"tx_bins"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v11 = +[NSNumber numberWithInt:self->_minRxLevelIdleDbm];
    [v3 setObject:v11 forKey:@"min_rx_level_idle_dbm"];
  }
  v12 = PBRepeatedUInt32NSArray();
  [v3 setObject:v12 forKey:@"rx_bins_idle"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v13 = +[NSNumber numberWithInt:self->_minSecRxLevelIdleDbm];
    [v3 setObject:v13 forKey:@"min_sec_rx_level_idle_dbm"];
  }
  v14 = PBRepeatedUInt32NSArray();
  [v3 setObject:v14 forKey:@"sec_rx_bins_idle"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v15 = +[NSNumber numberWithInt:self->_minSecTxLevelDbm];
    [v3 setObject:v15 forKey:@"min_sec_tx_level_dbm"];
  }
  v16 = PBRepeatedUInt32NSArray();
  [v3 setObject:v16 forKey:@"sec_tx_bins"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v17 = +[NSNumber numberWithInt:self->_minAcTxLevelDbm];
    [v3 setObject:v17 forKey:@"min_ac_tx_level_dbm"];
  }
  v18 = PBRepeatedUInt32NSArray();
  [v3 setObject:v18 forKey:@"ac_tx_bins"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v19 = +[NSNumber numberWithInt:self->_minAdTxLevelDbm];
    [v3 setObject:v19 forKey:@"min_ad_tx_level_dbm"];
  }
  v20 = PBRepeatedUInt32NSArray();
  [v3 setObject:v20 forKey:@"ad_tx_bins"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005BE44((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_64;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
LABEL_6:
  }
    PBDataWriterWriteSint32Field();
LABEL_7:
  if (self->_rxBins.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rxBins.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_rxBins.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteSint32Field();
  }
  if (self->_secRxBins.count)
  {
    PBDataWriterPlaceMark();
    if (self->_secRxBins.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_secRxBins.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    PBDataWriterWriteSint32Field();
  }
  if (self->_txBins.count)
  {
    PBDataWriterPlaceMark();
    if (self->_txBins.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < self->_txBins.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteSint32Field();
  }
  if (self->_rxBinsIdles.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rxBinsIdles.count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v9 < self->_rxBinsIdles.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteSint32Field();
  }
  if (self->_secRxBinsIdles.count)
  {
    PBDataWriterPlaceMark();
    if (self->_secRxBinsIdles.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v10;
      }
      while (v10 < self->_secRxBinsIdles.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    PBDataWriterWriteSint32Field();
  }
  if (self->_secTxBins.count)
  {
    PBDataWriterPlaceMark();
    if (self->_secTxBins.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v11;
      }
      while (v11 < self->_secTxBins.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(_WORD *)&self->_has & 8) != 0) {
    PBDataWriterWriteSint32Field();
  }
  if (self->_acTxBins.count)
  {
    PBDataWriterPlaceMark();
    if (self->_acTxBins.count)
    {
      unint64_t v12 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v12;
      }
      while (v12 < self->_acTxBins.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteSint32Field();
  }
  p_adTxBins = &self->_adTxBins;
  if (p_adTxBins->count)
  {
    PBDataWriterPlaceMark();
    if (p_adTxBins->count)
    {
      unint64_t v14 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v14;
      }
      while (v14 < p_adTxBins->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[25] = self->_timestamp;
    *((_WORD *)v4 + 126) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_58;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 52) = self->_duration;
  *((_WORD *)v4 + 126) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_59:
    *((_DWORD *)v4 + 53) = self->_inVoiceCall;
    *((_WORD *)v4 + 126) |= 4u;
    if ((*(_WORD *)&self->_has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_58:
  *((_DWORD *)v4 + 62) = self->_wcdmaBand;
  *((_WORD *)v4 + 126) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_59;
  }
LABEL_5:
  if ((has & 0x20) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 56) = self->_minRxLevelDbm;
    *((_WORD *)v4 + 126) |= 0x20u;
  }
LABEL_7:
  id v30 = v4;
  if ([(CellularWcdmaTxRxHist *)self rxBinsCount])
  {
    [v30 clearRxBins];
    unint64_t v6 = [(CellularWcdmaTxRxHist *)self rxBinsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v30 addRxBins:[self rxBinsAtIndex:i]];
    }
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v30 + 58) = self->_minSecRxLevelDbm;
    *((_WORD *)v30 + 126) |= 0x80u;
  }
  if ([(CellularWcdmaTxRxHist *)self secRxBinsCount])
  {
    [v30 clearSecRxBins];
    unint64_t v9 = [(CellularWcdmaTxRxHist *)self secRxBinsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [v30 addSecRxBins:[self secRxBinsAtIndex:j]];
    }
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((_DWORD *)v30 + 61) = self->_minTxLevelDbm;
    *((_WORD *)v30 + 126) |= 0x400u;
  }
  if ([(CellularWcdmaTxRxHist *)self txBinsCount])
  {
    [v30 clearTxBins];
    unint64_t v12 = [(CellularWcdmaTxRxHist *)self txBinsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        [v30 addTxBins:[self txBinsAtIndex:k]];
    }
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v30 + 57) = self->_minRxLevelIdleDbm;
    *((_WORD *)v30 + 126) |= 0x40u;
  }
  if ([(CellularWcdmaTxRxHist *)self rxBinsIdlesCount])
  {
    [v30 clearRxBinsIdles];
    unint64_t v15 = [(CellularWcdmaTxRxHist *)self rxBinsIdlesCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        [v30 addRxBinsIdle:[self rxBinsIdleAtIndex:m]];
    }
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_DWORD *)v30 + 59) = self->_minSecRxLevelIdleDbm;
    *((_WORD *)v30 + 126) |= 0x100u;
  }
  if ([(CellularWcdmaTxRxHist *)self secRxBinsIdlesCount])
  {
    [v30 clearSecRxBinsIdles];
    unint64_t v18 = [(CellularWcdmaTxRxHist *)self secRxBinsIdlesCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t n = 0; n != v19; ++n)
        [v30 addSecRxBinsIdle:[self secRxBinsIdleAtIndex:n]];
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((_DWORD *)v30 + 60) = self->_minSecTxLevelDbm;
    *((_WORD *)v30 + 126) |= 0x200u;
  }
  if ([(CellularWcdmaTxRxHist *)self secTxBinsCount])
  {
    [v30 clearSecTxBins];
    unint64_t v21 = [(CellularWcdmaTxRxHist *)self secTxBinsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (iuint64_t i = 0; ii != v22; ++ii)
        [v30 addSecTxBins:[self secTxBinsAtIndex:ii]];
    }
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v30 + 54) = self->_minAcTxLevelDbm;
    *((_WORD *)v30 + 126) |= 8u;
  }
  if ([(CellularWcdmaTxRxHist *)self acTxBinsCount])
  {
    [v30 clearAcTxBins];
    unint64_t v24 = [(CellularWcdmaTxRxHist *)self acTxBinsCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (juint64_t j = 0; jj != v25; ++jj)
        [v30 addAcTxBins:[self acTxBinsAtIndex:jj]];
    }
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v30 + 55) = self->_minAdTxLevelDbm;
    *((_WORD *)v30 + 126) |= 0x10u;
  }
  if ([(CellularWcdmaTxRxHist *)self adTxBinsCount])
  {
    [v30 clearAdTxBins];
    unint64_t v27 = [(CellularWcdmaTxRxHist *)self adTxBinsCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (kuint64_t k = 0; kk != v28; ++kk)
        [v30 addAdTxBins:[[self adTxBinsAtIndex:kk]];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = v4;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[25] = self->_timestamp;
    *((_WORD *)v4 + 126) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 52) = self->_duration;
  *((_WORD *)v4 + 126) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 62) = self->_wcdmaBand;
  *((_WORD *)v4 + 126) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_25:
  *((_DWORD *)v4 + 53) = self->_inVoiceCall;
  *((_WORD *)v4 + 126) |= 4u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 56) = self->_minRxLevelDbm;
    *((_WORD *)v4 + 126) |= 0x20u;
  }
LABEL_7:
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v5[58] = self->_minSecRxLevelDbm;
    *((_WORD *)v5 + 126) |= 0x80u;
  }
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v5[61] = self->_minTxLevelDbm;
    *((_WORD *)v5 + 126) |= 0x400u;
  }
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v5[57] = self->_minRxLevelIdleDbm;
    *((_WORD *)v5 + 126) |= 0x40u;
  }
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v5[59] = self->_minSecRxLevelIdleDbm;
    *((_WORD *)v5 + 126) |= 0x100u;
  }
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v5[60] = self->_minSecTxLevelDbm;
    *((_WORD *)v5 + 126) |= 0x200u;
  }
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v5[54] = self->_minAcTxLevelDbm;
    *((_WORD *)v5 + 126) |= 8u;
  }
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v5[55] = self->_minAdTxLevelDbm;
    *((_WORD *)v5 + 126) |= 0x10u;
  }
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_70;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 126);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 25)) {
      goto LABEL_70;
    }
  }
  else if (v6)
  {
    goto LABEL_70;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_duration != *((_DWORD *)v4 + 52)) {
      goto LABEL_70;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_70;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x800) == 0 || self->_wcdmaBand != *((_DWORD *)v4 + 62)) {
      goto LABEL_70;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x800) != 0)
  {
    goto LABEL_70;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_inVoiceCall != *((_DWORD *)v4 + 53)) {
      goto LABEL_70;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_70;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_minRxLevelDbm != *((_DWORD *)v4 + 56)) {
      goto LABEL_70;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_70;
  }
  __int16 v7 = *((_WORD *)v4 + 126);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_minSecRxLevelDbm != *((_DWORD *)v4 + 58)) {
      goto LABEL_70;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_70;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x400) == 0 || self->_minTxLevelDbm != *((_DWORD *)v4 + 61)) {
      goto LABEL_70;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x400) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_70;
  }
  __int16 v8 = *((_WORD *)v4 + 126);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_minRxLevelIdleDbm != *((_DWORD *)v4 + 57)) {
      goto LABEL_70;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_70;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x100) == 0 || self->_minSecRxLevelIdleDbm != *((_DWORD *)v4 + 59)) {
      goto LABEL_70;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x100) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_70;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 126) & 0x200) == 0 || self->_minSecTxLevelDbm != *((_DWORD *)v4 + 60)) {
      goto LABEL_70;
    }
  }
  else if ((*((_WORD *)v4 + 126) & 0x200) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_70;
  }
  __int16 v9 = *((_WORD *)v4 + 126);
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_minAcTxLevelDbm != *((_DWORD *)v4 + 54)) {
      goto LABEL_70;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_70:
    char IsEqual = 0;
    goto LABEL_71;
  }
  __int16 v10 = *((_WORD *)v4 + 126);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_minAdTxLevelDbm != *((_DWORD *)v4 + 55)) {
      goto LABEL_70;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_70;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_71:

  return IsEqual;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v23 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v22 = 2654435761 * self->_duration;
      if ((*(_WORD *)&self->_has & 0x800) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v23 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_4:
    uint64_t v21 = 2654435761 * self->_wcdmaBand;
    if ((has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v20 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v21 = 0;
  if ((has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v20 = 2654435761 * self->_inVoiceCall;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v19 = 2654435761 * self->_minRxLevelDbm;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v19 = 0;
LABEL_12:
  uint64_t v18 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    uint64_t v17 = 2654435761 * self->_minSecRxLevelDbm;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v16 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    uint64_t v15 = 2654435761 * self->_minTxLevelDbm;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v14 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    uint64_t v4 = 2654435761 * self->_minRxLevelIdleDbm;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v6 = 2654435761 * self->_minSecRxLevelIdleDbm;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    uint64_t v8 = 2654435761 * self->_minSecTxLevelDbm;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_has & 8) != 0) {
    uint64_t v10 = 2654435761 * self->_minAcTxLevelDbm;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    uint64_t v12 = 2654435761 * self->_minAdTxLevelDbm;
  }
  else {
    uint64_t v12 = 0;
  }
  return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 126);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 25);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 126);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_50;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_duratiouint64_t n = *((_DWORD *)v4 + 52);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 126);
  if ((v5 & 0x800) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_wcdmaBand = *((_DWORD *)v4 + 62);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 126);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_51:
  self->_inVoiceCall = *((_DWORD *)v4 + 53);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 126) & 0x20) != 0)
  {
LABEL_6:
    self->_minRxLevelDbuint64_t m = *((_DWORD *)v4 + 56);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_7:
  id v30 = (int *)v4;
  uint64_t v6 = (char *)[v4 rxBinsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[CellularWcdmaTxRxHist addRxBins:](self, "addRxBins:", [v30 rxBinsAtIndex:i]);
  }
  if ((v30[63] & 0x80) != 0)
  {
    self->_minSecRxLevelDbuint64_t m = v30[58];
    *(_WORD *)&self->_has |= 0x80u;
  }
  uint64_t v9 = (char *)[v30 secRxBinsCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[CellularWcdmaTxRxHist addSecRxBins:](self, "addSecRxBins:", [v30 secRxBinsAtIndex:j]);
  }
  if ((v30[63] & 0x400) != 0)
  {
    self->_minTxLevelDbuint64_t m = v30[61];
    *(_WORD *)&self->_has |= 0x400u;
  }
  uint64_t v12 = (char *)[v30 txBinsCount];
  if (v12)
  {
    unint64_t v13 = v12;
    for (uint64_t k = 0; k != v13; ++k)
      -[CellularWcdmaTxRxHist addTxBins:](self, "addTxBins:", [v30 txBinsAtIndex:k]);
  }
  if ((v30[63] & 0x40) != 0)
  {
    self->_minRxLevelIdleDbuint64_t m = v30[57];
    *(_WORD *)&self->_has |= 0x40u;
  }
  uint64_t v15 = (char *)[v30 rxBinsIdlesCount];
  if (v15)
  {
    uint64_t v16 = v15;
    for (uint64_t m = 0; m != v16; ++m)
      -[CellularWcdmaTxRxHist addRxBinsIdle:](self, "addRxBinsIdle:", [v30 rxBinsIdleAtIndex:m]);
  }
  if ((v30[63] & 0x100) != 0)
  {
    self->_minSecRxLevelIdleDbuint64_t m = v30[59];
    *(_WORD *)&self->_has |= 0x100u;
  }
  uint64_t v18 = (char *)[v30 secRxBinsIdlesCount];
  if (v18)
  {
    uint64_t v19 = v18;
    for (uint64_t n = 0; n != v19; ++n)
      -[CellularWcdmaTxRxHist addSecRxBinsIdle:](self, "addSecRxBinsIdle:", [v30 secRxBinsIdleAtIndex:n]);
  }
  if ((v30[63] & 0x200) != 0)
  {
    self->_minSecTxLevelDbuint64_t m = v30[60];
    *(_WORD *)&self->_has |= 0x200u;
  }
  uint64_t v21 = (char *)[v30 secTxBinsCount];
  if (v21)
  {
    uint64_t v22 = v21;
    for (iuint64_t i = 0; ii != v22; ++ii)
      -[CellularWcdmaTxRxHist addSecTxBins:](self, "addSecTxBins:", [v30 secTxBinsAtIndex:ii]);
  }
  if ((v30[63] & 8) != 0)
  {
    self->_minAcTxLevelDbuint64_t m = v30[54];
    *(_WORD *)&self->_has |= 8u;
  }
  unint64_t v24 = (char *)[v30 acTxBinsCount];
  if (v24)
  {
    unint64_t v25 = v24;
    for (juint64_t j = 0; jj != v25; ++jj)
      -[CellularWcdmaTxRxHist addAcTxBins:](self, "addAcTxBins:", [v30 acTxBinsAtIndex:jj]);
  }
  if ((v30[63] & 0x10) != 0)
  {
    self->_minAdTxLevelDbuint64_t m = v30[55];
    *(_WORD *)&self->_has |= 0x10u;
  }
  unint64_t v27 = (char *)[v30 adTxBinsCount];
  if (v27)
  {
    unint64_t v28 = v27;
    for (kuint64_t k = 0; kk != v28; ++kk)
      -[CellularWcdmaTxRxHist addAdTxBins:](self, "addAdTxBins:", [v30 adTxBinsAtIndex:kk]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)inVoiceCall
{
  return self->_inVoiceCall;
}

@end