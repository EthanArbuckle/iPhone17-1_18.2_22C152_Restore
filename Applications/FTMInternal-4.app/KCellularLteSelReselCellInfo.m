@interface KCellularLteSelReselCellInfo
+ (Class)nbrEutraType;
- (BOOL)hasAcBarringForEmergency;
- (BOOL)hasDlBandwidth;
- (BOOL)hasDlEarfcn;
- (BOOL)hasDlRfBand;
- (BOOL)hasGeraReselInfo;
- (BOOL)hasImsEmergencySupport;
- (BOOL)hasMoDataAcBarringFactor;
- (BOOL)hasMoDataAcBarringForSpecialAc;
- (BOOL)hasMoDataAcBarringTime;
- (BOOL)hasMoSignallingAcBarringFactor;
- (BOOL)hasMoSignallingAcBarringForSpecialAc;
- (BOOL)hasMoSignallingAcBarringTime;
- (BOOL)hasPci;
- (BOOL)hasPriorityOperatingFreq;
- (BOOL)hasQHyst;
- (BOOL)hasQQualMin;
- (BOOL)hasQRxLevMin;
- (BOOL)hasSIntraSearchP;
- (BOOL)hasSIntraSearchQ;
- (BOOL)hasSNonIntraSearchP;
- (BOOL)hasSNonIntraSearchQ;
- (BOOL)hasSubsId;
- (BOOL)hasThreshServingLowP;
- (BOOL)hasThreshServingLowQ;
- (BOOL)hasTimestamp;
- (BOOL)hasUtraReselInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GeraReselectionInfo)geraReselInfo;
- (NSMutableArray)nbrEutras;
- (UtraReselectionInfo)utraReselInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)nbrEutraAtIndex:(unint64_t)a3;
- (int)qQualMin;
- (int)qRxLevMin;
- (unint64_t)hash;
- (unint64_t)intraFreqPcisCount;
- (unint64_t)multiBandInfosCount;
- (unint64_t)nbrEutrasCount;
- (unint64_t)timestamp;
- (unsigned)acBarringForEmergency;
- (unsigned)dlBandwidth;
- (unsigned)dlEarfcn;
- (unsigned)dlRfBand;
- (unsigned)imsEmergencySupport;
- (unsigned)intraFreqPciAtIndex:(unint64_t)a3;
- (unsigned)intraFreqPcis;
- (unsigned)moDataAcBarringFactor;
- (unsigned)moDataAcBarringForSpecialAc;
- (unsigned)moDataAcBarringTime;
- (unsigned)moSignallingAcBarringFactor;
- (unsigned)moSignallingAcBarringForSpecialAc;
- (unsigned)moSignallingAcBarringTime;
- (unsigned)multiBandInfoAtIndex:(unint64_t)a3;
- (unsigned)multiBandInfos;
- (unsigned)pci;
- (unsigned)priorityOperatingFreq;
- (unsigned)qHyst;
- (unsigned)sIntraSearchP;
- (unsigned)sIntraSearchQ;
- (unsigned)sNonIntraSearchP;
- (unsigned)sNonIntraSearchQ;
- (unsigned)subsId;
- (unsigned)threshServingLowP;
- (unsigned)threshServingLowQ;
- (void)addIntraFreqPci:(unsigned int)a3;
- (void)addMultiBandInfo:(unsigned int)a3;
- (void)addNbrEutra:(id)a3;
- (void)clearIntraFreqPcis;
- (void)clearMultiBandInfos;
- (void)clearNbrEutras;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAcBarringForEmergency:(unsigned int)a3;
- (void)setDlBandwidth:(unsigned int)a3;
- (void)setDlEarfcn:(unsigned int)a3;
- (void)setDlRfBand:(unsigned int)a3;
- (void)setGeraReselInfo:(id)a3;
- (void)setHasAcBarringForEmergency:(BOOL)a3;
- (void)setHasDlBandwidth:(BOOL)a3;
- (void)setHasDlEarfcn:(BOOL)a3;
- (void)setHasDlRfBand:(BOOL)a3;
- (void)setHasImsEmergencySupport:(BOOL)a3;
- (void)setHasMoDataAcBarringFactor:(BOOL)a3;
- (void)setHasMoDataAcBarringForSpecialAc:(BOOL)a3;
- (void)setHasMoDataAcBarringTime:(BOOL)a3;
- (void)setHasMoSignallingAcBarringFactor:(BOOL)a3;
- (void)setHasMoSignallingAcBarringForSpecialAc:(BOOL)a3;
- (void)setHasMoSignallingAcBarringTime:(BOOL)a3;
- (void)setHasPci:(BOOL)a3;
- (void)setHasPriorityOperatingFreq:(BOOL)a3;
- (void)setHasQHyst:(BOOL)a3;
- (void)setHasQQualMin:(BOOL)a3;
- (void)setHasQRxLevMin:(BOOL)a3;
- (void)setHasSIntraSearchP:(BOOL)a3;
- (void)setHasSIntraSearchQ:(BOOL)a3;
- (void)setHasSNonIntraSearchP:(BOOL)a3;
- (void)setHasSNonIntraSearchQ:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasThreshServingLowP:(BOOL)a3;
- (void)setHasThreshServingLowQ:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setImsEmergencySupport:(unsigned int)a3;
- (void)setIntraFreqPcis:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setMoDataAcBarringFactor:(unsigned int)a3;
- (void)setMoDataAcBarringForSpecialAc:(unsigned int)a3;
- (void)setMoDataAcBarringTime:(unsigned int)a3;
- (void)setMoSignallingAcBarringFactor:(unsigned int)a3;
- (void)setMoSignallingAcBarringForSpecialAc:(unsigned int)a3;
- (void)setMoSignallingAcBarringTime:(unsigned int)a3;
- (void)setMultiBandInfos:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setNbrEutras:(id)a3;
- (void)setPci:(unsigned int)a3;
- (void)setPriorityOperatingFreq:(unsigned int)a3;
- (void)setQHyst:(unsigned int)a3;
- (void)setQQualMin:(int)a3;
- (void)setQRxLevMin:(int)a3;
- (void)setSIntraSearchP:(unsigned int)a3;
- (void)setSIntraSearchQ:(unsigned int)a3;
- (void)setSNonIntraSearchP:(unsigned int)a3;
- (void)setSNonIntraSearchQ:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setThreshServingLowP:(unsigned int)a3;
- (void)setThreshServingLowQ:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUtraReselInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularLteSelReselCellInfo

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)KCellularLteSelReselCellInfo;
  [(KCellularLteSelReselCellInfo *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (unint64_t)multiBandInfosCount
{
  return self->_multiBandInfos.count;
}

- (unsigned)multiBandInfos
{
  return self->_multiBandInfos.list;
}

- (void)clearMultiBandInfos
{
}

- (void)addMultiBandInfo:(unsigned int)a3
{
}

- (unsigned)multiBandInfoAtIndex:(unint64_t)a3
{
  p_multiBandInfos = &self->_multiBandInfos;
  unint64_t count = self->_multiBandInfos.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_multiBandInfos->list[a3];
}

- (void)setMultiBandInfos:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setImsEmergencySupport:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_imsEmergencySupport = a3;
}

- (void)setHasImsEmergencySupport:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasImsEmergencySupport
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAcBarringForEmergency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_acBarringForEmergency = a3;
}

- (void)setHasAcBarringForEmergency:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAcBarringForEmergency
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMoSignallingAcBarringFactor:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_moSignallingAcBarringFactor = a3;
}

- (void)setHasMoSignallingAcBarringFactor:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMoSignallingAcBarringFactor
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setMoSignallingAcBarringTime:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_moSignallingAcBarringTime = a3;
}

- (void)setHasMoSignallingAcBarringTime:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMoSignallingAcBarringTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setMoSignallingAcBarringForSpecialAc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_moSignallingAcBarringForSpecialAc = a3;
}

- (void)setHasMoSignallingAcBarringForSpecialAc:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMoSignallingAcBarringForSpecialAc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setMoDataAcBarringFactor:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_moDataAcBarringFactor = a3;
}

- (void)setHasMoDataAcBarringFactor:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMoDataAcBarringFactor
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setMoDataAcBarringTime:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_moDataAcBarringTime = a3;
}

- (void)setHasMoDataAcBarringTime:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMoDataAcBarringTime
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setMoDataAcBarringForSpecialAc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_moDataAcBarringForSpecialAc = a3;
}

- (void)setHasMoDataAcBarringForSpecialAc:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasMoDataAcBarringForSpecialAc
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setQRxLevMin:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_qRxLevMin = a3;
}

- (void)setHasQRxLevMin:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasQRxLevMin
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setQQualMin:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_qQualMin = a3;
}

- (void)setHasQQualMin:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasQQualMin
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setQHyst:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_qHyst = a3;
}

- (void)setHasQHyst:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasQHyst
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSNonIntraSearchP:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_sNonIntraSearchP = a3;
}

- (void)setHasSNonIntraSearchP:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasSNonIntraSearchP
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSNonIntraSearchQ:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_sNonIntraSearchQ = a3;
}

- (void)setHasSNonIntraSearchQ:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasSNonIntraSearchQ
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setSIntraSearchP:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_sIntraSearchP = a3;
}

- (void)setHasSIntraSearchP:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSIntraSearchP
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSIntraSearchQ:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_sIntraSearchQ = a3;
}

- (void)setHasSIntraSearchQ:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSIntraSearchQ
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setThreshServingLowP:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_threshServingLowP = a3;
}

- (void)setHasThreshServingLowP:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasThreshServingLowP
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setThreshServingLowQ:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_threshServingLowQ = a3;
}

- (void)setHasThreshServingLowQ:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasThreshServingLowQ
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setPriorityOperatingFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_priorityOperatingFreq = a3;
}

- (void)setHasPriorityOperatingFreq:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPriorityOperatingFreq
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)clearNbrEutras
{
}

- (void)addNbrEutra:(id)a3
{
  id v4 = a3;
  nbrEutras = self->_nbrEutras;
  id v8 = v4;
  if (!nbrEutras)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_nbrEutras;
    self->_nbrEutras = v6;

    id v4 = v8;
    nbrEutras = self->_nbrEutras;
  }
  [(NSMutableArray *)nbrEutras addObject:v4];
}

- (unint64_t)nbrEutrasCount
{
  return (unint64_t)[(NSMutableArray *)self->_nbrEutras count];
}

- (id)nbrEutraAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_nbrEutras objectAtIndex:a3];
}

+ (Class)nbrEutraType
{
  return (Class)objc_opt_class();
}

- (void)setDlEarfcn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_dlEarfcn = a3;
}

- (void)setHasDlEarfcn:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDlEarfcn
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPci:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_pci = a3;
}

- (void)setHasPci:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPci
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setDlRfBand:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dlRfBand = a3;
}

- (void)setHasDlRfBand:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDlRfBand
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDlBandwidth:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_dlBandwidth = a3;
}

- (void)setHasDlBandwidth:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDlBandwidth
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (unint64_t)intraFreqPcisCount
{
  return self->_intraFreqPcis.count;
}

- (unsigned)intraFreqPcis
{
  return self->_intraFreqPcis.list;
}

- (void)clearIntraFreqPcis
{
}

- (void)addIntraFreqPci:(unsigned int)a3
{
}

- (unsigned)intraFreqPciAtIndex:(unint64_t)a3
{
  p_intraFreqPcis = &self->_intraFreqPcis;
  unint64_t count = self->_intraFreqPcis.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_intraFreqPcis->list[a3];
}

- (void)setIntraFreqPcis:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasUtraReselInfo
{
  return self->_utraReselInfo != 0;
}

- (BOOL)hasGeraReselInfo
{
  return self->_geraReselInfo != 0;
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
  self->_has = ($8AB10C4AD39CB9520EB04F4DCC28D7C6)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularLteSelReselCellInfo;
  int v3 = [(KCellularLteSelReselCellInfo *)&v7 description];
  id v4 = [(KCellularLteSelReselCellInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  v5 = PBRepeatedUInt32NSArray();
  [v3 setObject:v5 forKey:@"multi_band_info"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    v24 = +[NSNumber numberWithUnsignedInt:self->_imsEmergencySupport];
    [v3 setObject:v24 forKey:@"ims_emergency_support"];

    $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_47;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_5;
  }
  v25 = +[NSNumber numberWithUnsignedInt:self->_acBarringForEmergency];
  [v3 setObject:v25 forKey:@"ac_barring_for_emergency"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_48;
  }
LABEL_47:
  v26 = +[NSNumber numberWithUnsignedInt:self->_moSignallingAcBarringFactor];
  [v3 setObject:v26 forKey:@"mo_signalling_ac_barring_factor"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_49;
  }
LABEL_48:
  v27 = +[NSNumber numberWithUnsignedInt:self->_moSignallingAcBarringTime];
  [v3 setObject:v27 forKey:@"mo_signalling_ac_barring_time"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_50;
  }
LABEL_49:
  v28 = +[NSNumber numberWithUnsignedInt:self->_moSignallingAcBarringForSpecialAc];
  [v3 setObject:v28 forKey:@"mo_signalling_ac_barring_for_special_ac"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_51;
  }
LABEL_50:
  v29 = +[NSNumber numberWithUnsignedInt:self->_moDataAcBarringFactor];
  [v3 setObject:v29 forKey:@"mo_data_ac_barring_factor"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_52;
  }
LABEL_51:
  v30 = +[NSNumber numberWithUnsignedInt:self->_moDataAcBarringTime];
  [v3 setObject:v30 forKey:@"mo_data_ac_barring_time"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_53;
  }
LABEL_52:
  v31 = +[NSNumber numberWithUnsignedInt:self->_moDataAcBarringForSpecialAc];
  [v3 setObject:v31 forKey:@"mo_data_ac_barring_for_special_ac"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_54;
  }
LABEL_53:
  v32 = +[NSNumber numberWithInt:self->_qRxLevMin];
  [v3 setObject:v32 forKey:@"QRxLevMin"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_55;
  }
LABEL_54:
  v33 = +[NSNumber numberWithInt:self->_qQualMin];
  [v3 setObject:v33 forKey:@"QQualMin"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_56;
  }
LABEL_55:
  v34 = +[NSNumber numberWithUnsignedInt:self->_qHyst];
  [v3 setObject:v34 forKey:@"Q_hyst"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_57;
  }
LABEL_56:
  v35 = +[NSNumber numberWithUnsignedInt:self->_sNonIntraSearchP];
  [v3 setObject:v35 forKey:@"S_non_intra_search_P"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_58;
  }
LABEL_57:
  v36 = +[NSNumber numberWithUnsignedInt:self->_sNonIntraSearchQ];
  [v3 setObject:v36 forKey:@"S_non_intra_search_Q"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_59;
  }
LABEL_58:
  v37 = +[NSNumber numberWithUnsignedInt:self->_sIntraSearchP];
  [v3 setObject:v37 forKey:@"S_intra_search_P"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_60;
  }
LABEL_59:
  v38 = +[NSNumber numberWithUnsignedInt:self->_sIntraSearchQ];
  [v3 setObject:v38 forKey:@"S_intra_search_Q"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_61;
  }
LABEL_60:
  v39 = +[NSNumber numberWithUnsignedInt:self->_threshServingLowP];
  [v3 setObject:v39 forKey:@"Thresh_serving_lowP"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_61:
  v40 = +[NSNumber numberWithUnsignedInt:self->_threshServingLowQ];
  [v3 setObject:v40 forKey:@"Thresh_serving_lowQ"];

  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_21:
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_priorityOperatingFreq];
    [v3 setObject:v7 forKey:@"priority_operating_freq"];
  }
LABEL_22:
  if ([(NSMutableArray *)self->_nbrEutras count])
  {
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_nbrEutras, "count")];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v9 = self->_nbrEutras;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v45;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v45 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [v44 dictionaryRepresentation];
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"nbr_eutra"];
  }
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 v15 = self->_has;
  if ((*(unsigned char *)&v15 & 8) != 0)
  {
    v41 = +[NSNumber numberWithUnsignedInt:self->_dlEarfcn];
    [v3 setObject:v41 forKey:@"dl_earfcn"];

    $8AB10C4AD39CB9520EB04F4DCC28D7C6 v15 = self->_has;
    if ((*(_WORD *)&v15 & 0x1000) == 0)
    {
LABEL_33:
      if ((*(unsigned char *)&v15 & 0x10) == 0) {
        goto LABEL_34;
      }
      goto LABEL_65;
    }
  }
  else if ((*(_WORD *)&v15 & 0x1000) == 0)
  {
    goto LABEL_33;
  }
  v42 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_pci, (void)v44);
  [v3 setObject:v42 forKey:@"pci"];

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 v15 = self->_has;
  if ((*(unsigned char *)&v15 & 0x10) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v15 & 4) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_65:
  v43 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlRfBand, (void)v44);
  [v3 setObject:v43 forKey:@"dl_rf_band"];

  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_35:
    v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlBandwidth, (void)v44);
    [v3 setObject:v16 forKey:@"dl_bandwidth"];
  }
LABEL_36:
  v17 = PBRepeatedUInt32NSArray();
  [v3 setObject:v17 forKey:@"intra_freq_pci"];

  utraReselInfo = self->_utraReselInfo;
  if (utraReselInfo)
  {
    v19 = [(UtraReselectionInfo *)utraReselInfo dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"utra_resel_info"];
  }
  geraReselInfo = self->_geraReselInfo;
  if (geraReselInfo)
  {
    v21 = [(GeraReselectionInfo *)geraReselInfo dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"gera_resel_info"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    v22 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v22 forKey:@"subs_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000C9200((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_multiBandInfos.count)
  {
    uint64_t v18 = 0;
    PBDataWriterPlaceMark();
    if (self->_multiBandInfos.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v5;
      }
      while (v5 < self->_multiBandInfos.count);
    }
    PBDataWriterRecallMark();
  }
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_10:
      if ((*(_WORD *)&has & 0x200) == 0) {
        goto LABEL_11;
      }
      goto LABEL_53;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteSint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteSint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x2000) != 0) {
LABEL_26:
  }
    PBDataWriterWriteUint32Field();
LABEL_27:
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v7 = self->_nbrEutras;
  id v8 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    $8AB10C4AD39CB9520EB04F4DCC28D7C6 v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x1000) == 0)
    {
LABEL_36:
      if ((*(unsigned char *)&v12 & 0x10) == 0) {
        goto LABEL_37;
      }
      goto LABEL_71;
    }
  }
  else if ((*(_WORD *)&v12 & 0x1000) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteUint32Field();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x10) == 0)
  {
LABEL_37:
    if ((*(unsigned char *)&v12 & 4) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_71:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 4) != 0) {
LABEL_38:
  }
    PBDataWriterWriteUint32Field();
LABEL_39:
  if (self->_intraFreqPcis.count)
  {
    uint64_t v18 = 0;
    PBDataWriterPlaceMark();
    if (self->_intraFreqPcis.count)
    {
      unint64_t v13 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v13;
      }
      while (v13 < self->_intraFreqPcis.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_utraReselInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_geraReselInfo) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[7] = self->_timestamp;
    *((_DWORD *)v4 + 46) |= 1u;
  }
  uint64_t v18 = v4;
  if ([(KCellularLteSelReselCellInfo *)self multiBandInfosCount])
  {
    [v18 clearMultiBandInfos];
    unint64_t v5 = [(KCellularLteSelReselCellInfo *)self multiBandInfosCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [v18 addMultiBandInfo:[self multiBandInfoAtIndex:i]];
    }
  }
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    v18[22] = self->_imsEmergencySupport;
    v18[46] |= 0x20u;
    $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x200) == 0) {
        goto LABEL_10;
      }
      goto LABEL_50;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_9;
  }
  v18[16] = self->_acBarringForEmergency;
  v18[46] |= 2u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_51;
  }
LABEL_50:
  v18[26] = self->_moSignallingAcBarringFactor;
  v18[46] |= 0x200u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_52;
  }
LABEL_51:
  v18[28] = self->_moSignallingAcBarringTime;
  v18[46] |= 0x800u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_53;
  }
LABEL_52:
  v18[27] = self->_moSignallingAcBarringForSpecialAc;
  v18[46] |= 0x400u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_54;
  }
LABEL_53:
  v18[23] = self->_moDataAcBarringFactor;
  v18[46] |= 0x40u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_55;
  }
LABEL_54:
  v18[25] = self->_moDataAcBarringTime;
  v18[46] |= 0x100u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_56;
  }
LABEL_55:
  v18[24] = self->_moDataAcBarringForSpecialAc;
  v18[46] |= 0x80u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_57;
  }
LABEL_56:
  v18[36] = self->_qRxLevMin;
  v18[46] |= 0x10000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_58;
  }
LABEL_57:
  v18[35] = self->_qQualMin;
  v18[46] |= 0x8000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_59;
  }
LABEL_58:
  v18[34] = self->_qHyst;
  v18[46] |= 0x4000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_60;
  }
LABEL_59:
  v18[39] = self->_sNonIntraSearchP;
  v18[46] |= 0x80000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_61;
  }
LABEL_60:
  v18[40] = self->_sNonIntraSearchQ;
  v18[46] |= 0x100000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_62;
  }
LABEL_61:
  v18[37] = self->_sIntraSearchP;
  v18[46] |= 0x20000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_63;
  }
LABEL_62:
  v18[38] = self->_sIntraSearchQ;
  v18[46] |= 0x40000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_24;
    }
LABEL_64:
    v18[43] = self->_threshServingLowQ;
    v18[46] |= 0x800000u;
    if ((*(_DWORD *)&self->_has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_63:
  v18[42] = self->_threshServingLowP;
  v18[46] |= 0x400000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0) {
    goto LABEL_64;
  }
LABEL_24:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_25:
    v18[33] = self->_priorityOperatingFreq;
    v18[46] |= 0x2000u;
  }
LABEL_26:
  if ([(KCellularLteSelReselCellInfo *)self nbrEutrasCount])
  {
    [v18 clearNbrEutras];
    unint64_t v9 = [(KCellularLteSelReselCellInfo *)self nbrEutrasCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        $8AB10C4AD39CB9520EB04F4DCC28D7C6 v12 = [(KCellularLteSelReselCellInfo *)self nbrEutraAtIndex:j];
        [v18 addNbrEutra:v12];
      }
    }
  }
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    v18[18] = self->_dlEarfcn;
    v18[46] |= 8u;
    $8AB10C4AD39CB9520EB04F4DCC28D7C6 v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x1000) == 0)
    {
LABEL_32:
      if ((*(unsigned char *)&v13 & 0x10) == 0) {
        goto LABEL_33;
      }
LABEL_68:
      v18[19] = self->_dlRfBand;
      v18[46] |= 0x10u;
      if ((*(_DWORD *)&self->_has & 4) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
    goto LABEL_32;
  }
  v18[32] = self->_pci;
  v18[46] |= 0x1000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x10) != 0) {
    goto LABEL_68;
  }
LABEL_33:
  if ((*(unsigned char *)&v13 & 4) != 0)
  {
LABEL_34:
    v18[17] = self->_dlBandwidth;
    v18[46] |= 4u;
  }
LABEL_35:
  if ([(KCellularLteSelReselCellInfo *)self intraFreqPcisCount])
  {
    [v18 clearIntraFreqPcis];
    unint64_t v14 = [(KCellularLteSelReselCellInfo *)self intraFreqPcisCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
        [v18 addIntraFreqPci:[self intraFreqPciAtIndex:k]];
    }
  }
  if (self->_utraReselInfo) {
    [v18 setUtraReselInfo:];
  }
  long long v17 = v18;
  if (self->_geraReselInfo)
  {
    [v18 setGeraReselInfo:];
    long long v17 = v18;
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    v17[41] = self->_subsId;
    v17[46] |= 0x200000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[7] = self->_timestamp;
    *((_DWORD *)v5 + 46) |= 1u;
  }
  PBRepeatedUInt32Copy();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    v6[22] = self->_imsEmergencySupport;
    v6[46] |= 0x20u;
    $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_39;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_5;
  }
  v6[16] = self->_acBarringForEmergency;
  v6[46] |= 2u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  v6[26] = self->_moSignallingAcBarringFactor;
  v6[46] |= 0x200u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_41;
  }
LABEL_40:
  v6[28] = self->_moSignallingAcBarringTime;
  v6[46] |= 0x800u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_42;
  }
LABEL_41:
  v6[27] = self->_moSignallingAcBarringForSpecialAc;
  v6[46] |= 0x400u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_43;
  }
LABEL_42:
  v6[23] = self->_moDataAcBarringFactor;
  v6[46] |= 0x40u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  v6[25] = self->_moDataAcBarringTime;
  v6[46] |= 0x100u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  v6[24] = self->_moDataAcBarringForSpecialAc;
  v6[46] |= 0x80u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_46;
  }
LABEL_45:
  v6[36] = self->_qRxLevMin;
  v6[46] |= 0x10000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_47;
  }
LABEL_46:
  v6[35] = self->_qQualMin;
  v6[46] |= 0x8000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_48;
  }
LABEL_47:
  v6[34] = self->_qHyst;
  v6[46] |= 0x4000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_49;
  }
LABEL_48:
  v6[39] = self->_sNonIntraSearchP;
  v6[46] |= 0x80000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_50;
  }
LABEL_49:
  v6[40] = self->_sNonIntraSearchQ;
  v6[46] |= 0x100000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_51;
  }
LABEL_50:
  v6[37] = self->_sIntraSearchP;
  v6[46] |= 0x20000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_52;
  }
LABEL_51:
  v6[38] = self->_sIntraSearchQ;
  v6[46] |= 0x40000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_53;
  }
LABEL_52:
  v6[42] = self->_threshServingLowP;
  v6[46] |= 0x400000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_53:
  v6[43] = self->_threshServingLowQ;
  v6[46] |= 0x800000u;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_21:
    v6[33] = self->_priorityOperatingFreq;
    v6[46] |= 0x2000u;
  }
LABEL_22:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = self->_nbrEutras;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      $8AB10C4AD39CB9520EB04F4DCC28D7C6 v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v6 addNbrEutra:v13];

        $8AB10C4AD39CB9520EB04F4DCC28D7C6 v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  $8AB10C4AD39CB9520EB04F4DCC28D7C6 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 8) != 0)
  {
    v6[18] = self->_dlEarfcn;
    v6[46] |= 8u;
    $8AB10C4AD39CB9520EB04F4DCC28D7C6 v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x1000) == 0)
    {
LABEL_31:
      if ((*(unsigned char *)&v14 & 0x10) == 0) {
        goto LABEL_32;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
    goto LABEL_31;
  }
  v6[32] = self->_pci;
  v6[46] |= 0x1000u;
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x10) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v14 & 4) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_57:
  v6[19] = self->_dlRfBand;
  v6[46] |= 0x10u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_33:
    v6[17] = self->_dlBandwidth;
    v6[46] |= 4u;
  }
LABEL_34:
  PBRepeatedUInt32Copy();
  id v15 = [(UtraReselectionInfo *)self->_utraReselInfo copyWithZone:a3];
  long long v16 = (void *)*((void *)v6 + 22);
  *((void *)v6 + 22) = v15;

  id v17 = [(GeraReselectionInfo *)self->_geraReselInfo copyWithZone:a3];
  uint64_t v18 = (void *)*((void *)v6 + 10);
  *((void *)v6 + 10) = v17;

  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    v6[41] = self->_subsId;
    v6[46] |= 0x200000u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_131;
  }
  int v5 = *((_DWORD *)v4 + 46);
  if (*(unsigned char *)&self->_has)
  {
    if ((v5 & 1) == 0 || self->_timestamp != *((void *)v4 + 7)) {
      goto LABEL_131;
    }
  }
  else if (v5)
  {
    goto LABEL_131;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_131;
  }
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  int v7 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_imsEmergencySupport != *((_DWORD *)v4 + 22)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_131;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_acBarringForEmergency != *((_DWORD *)v4 + 16)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_moSignallingAcBarringFactor != *((_DWORD *)v4 + 26)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_moSignallingAcBarringTime != *((_DWORD *)v4 + 28)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_moSignallingAcBarringForSpecialAc != *((_DWORD *)v4 + 27)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_131;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_moDataAcBarringFactor != *((_DWORD *)v4 + 23)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_moDataAcBarringTime != *((_DWORD *)v4 + 25)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_131;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_moDataAcBarringForSpecialAc != *((_DWORD *)v4 + 24)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_qRxLevMin != *((_DWORD *)v4 + 36)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_qQualMin != *((_DWORD *)v4 + 35)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_qHyst != *((_DWORD *)v4 + 34)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_sNonIntraSearchP != *((_DWORD *)v4 + 39)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_sNonIntraSearchQ != *((_DWORD *)v4 + 40)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_sIntraSearchP != *((_DWORD *)v4 + 37)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_sIntraSearchQ != *((_DWORD *)v4 + 38)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_threshServingLowP != *((_DWORD *)v4 + 42)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_threshServingLowQ != *((_DWORD *)v4 + 43)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_priorityOperatingFreq != *((_DWORD *)v4 + 33)) {
      goto LABEL_131;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_131;
  }
  nbrEutras = self->_nbrEutras;
  if ((unint64_t)nbrEutras | *((void *)v4 + 15))
  {
    if (-[NSMutableArray isEqual:](nbrEutras, "isEqual:"))
    {
      $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
      goto LABEL_101;
    }
LABEL_131:
    BOOL v13 = 0;
    goto LABEL_132;
  }
LABEL_101:
  int v9 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_dlEarfcn != *((_DWORD *)v4 + 18)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_131;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_pci != *((_DWORD *)v4 + 32)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_131;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_dlRfBand != *((_DWORD *)v4 + 19)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_131;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_dlBandwidth != *((_DWORD *)v4 + 17)) {
      goto LABEL_131;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_131;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_131;
  }
  utraReselInfo = self->_utraReselInfo;
  if ((unint64_t)utraReselInfo | *((void *)v4 + 22))
  {
    if (!-[UtraReselectionInfo isEqual:](utraReselInfo, "isEqual:")) {
      goto LABEL_131;
    }
  }
  geraReselInfo = self->_geraReselInfo;
  if ((unint64_t)geraReselInfo | *((void *)v4 + 10))
  {
    if (!-[GeraReselectionInfo isEqual:](geraReselInfo, "isEqual:")) {
      goto LABEL_131;
    }
  }
  int v12 = *((_DWORD *)v4 + 46);
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    if ((v12 & 0x200000) == 0 || self->_subsId != *((_DWORD *)v4 + 41)) {
      goto LABEL_131;
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = (v12 & 0x200000) == 0;
  }
LABEL_132:

  return v13;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v34 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v34 = 0;
  }
  uint64_t v33 = PBRepeatedUInt32Hash();
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    uint64_t v32 = 2654435761 * self->_imsEmergencySupport;
    if ((*(unsigned char *)&has & 2) != 0)
    {
LABEL_6:
      uint64_t v31 = 2654435761 * self->_acBarringForEmergency;
      if ((*(_WORD *)&has & 0x200) != 0) {
        goto LABEL_7;
      }
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v31 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_7:
    uint64_t v30 = 2654435761 * self->_moSignallingAcBarringFactor;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v30 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_8:
    uint64_t v29 = 2654435761 * self->_moSignallingAcBarringTime;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v29 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_9:
    uint64_t v28 = 2654435761 * self->_moSignallingAcBarringForSpecialAc;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v28 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_10:
    uint64_t v27 = 2654435761 * self->_moDataAcBarringFactor;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v27 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_11:
    uint64_t v26 = 2654435761 * self->_moDataAcBarringTime;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v26 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_12:
    uint64_t v25 = 2654435761 * self->_moDataAcBarringForSpecialAc;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_13:
    uint64_t v24 = 2654435761 * self->_qRxLevMin;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v24 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_14:
    uint64_t v23 = 2654435761 * self->_qQualMin;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v23 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_15:
    uint64_t v22 = 2654435761 * self->_qHyst;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v22 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_16:
    uint64_t v21 = 2654435761 * self->_sNonIntraSearchP;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v21 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_17:
    uint64_t v20 = 2654435761 * self->_sNonIntraSearchQ;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v20 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_18:
    uint64_t v19 = 2654435761 * self->_sIntraSearchP;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_19:
    uint64_t v18 = 2654435761 * self->_sIntraSearchQ;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_20:
    uint64_t v17 = 2654435761 * self->_threshServingLowP;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_21;
    }
LABEL_39:
    uint64_t v16 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_40;
  }
LABEL_38:
  uint64_t v17 = 0;
  if ((*(_DWORD *)&has & 0x800000) == 0) {
    goto LABEL_39;
  }
LABEL_21:
  uint64_t v16 = 2654435761 * self->_threshServingLowQ;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_22:
    uint64_t v15 = 2654435761 * self->_priorityOperatingFreq;
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v15 = 0;
LABEL_41:
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_nbrEutras hash];
  $8AB10C4AD39CB9520EB04F4DCC28D7C6 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 8) != 0)
  {
    uint64_t v6 = 2654435761 * self->_dlEarfcn;
    if ((*(_WORD *)&v5 & 0x1000) != 0)
    {
LABEL_43:
      uint64_t v7 = 2654435761 * self->_pci;
      if ((*(unsigned char *)&v5 & 0x10) != 0) {
        goto LABEL_44;
      }
LABEL_48:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&v5 & 4) != 0) {
        goto LABEL_45;
      }
      goto LABEL_49;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(_WORD *)&v5 & 0x1000) != 0) {
      goto LABEL_43;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&v5 & 0x10) == 0) {
    goto LABEL_48;
  }
LABEL_44:
  uint64_t v8 = 2654435761 * self->_dlRfBand;
  if ((*(unsigned char *)&v5 & 4) != 0)
  {
LABEL_45:
    uint64_t v9 = 2654435761 * self->_dlBandwidth;
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v9 = 0;
LABEL_50:
  uint64_t v10 = PBRepeatedUInt32Hash();
  unint64_t v11 = [(UtraReselectionInfo *)self->_utraReselInfo hash];
  unint64_t v12 = [(GeraReselectionInfo *)self->_geraReselInfo hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    uint64_t v13 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v13 = 0;
  }
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v6 ^ v4 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if (v4[23])
  {
    self->_timestamp = v4[7];
    *(_DWORD *)&self->_has |= 1u;
  }
  uint64_t v6 = (char *)[v4 multiBandInfosCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[KCellularLteSelReselCellInfo addMultiBandInfo:](self, "addMultiBandInfo:", [v5 multiBandInfoAtIndex:i]);
  }
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x20) != 0)
  {
    self->_imsEmergencySupport = *((_DWORD *)v5 + 22);
    *(_DWORD *)&self->_has |= 0x20u;
    int v9 = *((_DWORD *)v5 + 46);
    if ((v9 & 2) == 0)
    {
LABEL_8:
      if ((v9 & 0x200) == 0) {
        goto LABEL_9;
      }
      goto LABEL_45;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_8;
  }
  self->_acBarringForEmergency = *((_DWORD *)v5 + 16);
  *(_DWORD *)&self->_has |= 2u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x200) == 0)
  {
LABEL_9:
    if ((v9 & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_moSignallingAcBarringFactor = *((_DWORD *)v5 + 26);
  *(_DWORD *)&self->_has |= 0x200u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x800) == 0)
  {
LABEL_10:
    if ((v9 & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_moSignallingAcBarringTime = *((_DWORD *)v5 + 28);
  *(_DWORD *)&self->_has |= 0x800u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x400) == 0)
  {
LABEL_11:
    if ((v9 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_moSignallingAcBarringForSpecialAc = *((_DWORD *)v5 + 27);
  *(_DWORD *)&self->_has |= 0x400u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x40) == 0)
  {
LABEL_12:
    if ((v9 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_moDataAcBarringFactor = *((_DWORD *)v5 + 23);
  *(_DWORD *)&self->_has |= 0x40u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x100) == 0)
  {
LABEL_13:
    if ((v9 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_moDataAcBarringTime = *((_DWORD *)v5 + 25);
  *(_DWORD *)&self->_has |= 0x100u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x80) == 0)
  {
LABEL_14:
    if ((v9 & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_moDataAcBarringForSpecialAc = *((_DWORD *)v5 + 24);
  *(_DWORD *)&self->_has |= 0x80u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x10000) == 0)
  {
LABEL_15:
    if ((v9 & 0x8000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_qRxLevMin = *((_DWORD *)v5 + 36);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x8000) == 0)
  {
LABEL_16:
    if ((v9 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_qQualMin = *((_DWORD *)v5 + 35);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x4000) == 0)
  {
LABEL_17:
    if ((v9 & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_qHyst = *((_DWORD *)v5 + 34);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x80000) == 0)
  {
LABEL_18:
    if ((v9 & 0x100000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_sNonIntraSearchP = *((_DWORD *)v5 + 39);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x100000) == 0)
  {
LABEL_19:
    if ((v9 & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_sNonIntraSearchQ = *((_DWORD *)v5 + 40);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x20000) == 0)
  {
LABEL_20:
    if ((v9 & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_sIntraSearchP = *((_DWORD *)v5 + 37);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x40000) == 0)
  {
LABEL_21:
    if ((v9 & 0x400000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_sIntraSearchQ = *((_DWORD *)v5 + 38);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x400000) == 0)
  {
LABEL_22:
    if ((v9 & 0x800000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_threshServingLowP = *((_DWORD *)v5 + 42);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v9 = *((_DWORD *)v5 + 46);
  if ((v9 & 0x800000) == 0)
  {
LABEL_23:
    if ((v9 & 0x2000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_59:
  self->_threshServingLowQ = *((_DWORD *)v5 + 43);
  *(_DWORD *)&self->_has |= 0x800000u;
  if ((*((_DWORD *)v5 + 46) & 0x2000) != 0)
  {
LABEL_24:
    self->_priorityOperatingFreq = *((_DWORD *)v5 + 33);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
LABEL_25:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = *((id *)v5 + 15);
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        -[KCellularLteSelReselCellInfo addNbrEutra:](self, "addNbrEutra:", *(void *)(*((void *)&v23 + 1) + 8 * (void)j), (void)v23);
      }
      id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  int v15 = *((_DWORD *)v5 + 46);
  if ((v15 & 8) != 0)
  {
    self->_dlEarfcn = *((_DWORD *)v5 + 18);
    *(_DWORD *)&self->_has |= 8u;
    int v15 = *((_DWORD *)v5 + 46);
    if ((v15 & 0x1000) == 0)
    {
LABEL_34:
      if ((v15 & 0x10) == 0) {
        goto LABEL_35;
      }
      goto LABEL_63;
    }
  }
  else if ((v15 & 0x1000) == 0)
  {
    goto LABEL_34;
  }
  self->_pcuint64_t i = *((_DWORD *)v5 + 32);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v15 = *((_DWORD *)v5 + 46);
  if ((v15 & 0x10) == 0)
  {
LABEL_35:
    if ((v15 & 4) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_63:
  self->_dlRfBand = *((_DWORD *)v5 + 19);
  *(_DWORD *)&self->_has |= 0x10u;
  if ((*((_DWORD *)v5 + 46) & 4) != 0)
  {
LABEL_36:
    self->_dlBandwidth = *((_DWORD *)v5 + 17);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_37:
  uint64_t v16 = [v5 intraFreqPcisCount];
  if (v16)
  {
    uint64_t v17 = v16;
    for (uint64_t k = 0; k != v17; ++k)
      -[KCellularLteSelReselCellInfo addIntraFreqPci:](self, "addIntraFreqPci:", [v5 intraFreqPciAtIndex:k]);
  }
  utraReselInfo = self->_utraReselInfo;
  uint64_t v20 = *((void *)v5 + 22);
  if (utraReselInfo)
  {
    if (v20) {
      -[UtraReselectionInfo mergeFrom:](utraReselInfo, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[KCellularLteSelReselCellInfo setUtraReselInfo:](self, "setUtraReselInfo:");
  }
  geraReselInfo = self->_geraReselInfo;
  uint64_t v22 = *((void *)v5 + 10);
  if (geraReselInfo)
  {
    if (v22) {
      -[GeraReselectionInfo mergeFrom:](geraReselInfo, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[KCellularLteSelReselCellInfo setGeraReselInfo:](self, "setGeraReselInfo:");
  }
  if ((*((unsigned char *)v5 + 186) & 0x20) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 41);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)imsEmergencySupport
{
  return self->_imsEmergencySupport;
}

- (unsigned)acBarringForEmergency
{
  return self->_acBarringForEmergency;
}

- (unsigned)moSignallingAcBarringFactor
{
  return self->_moSignallingAcBarringFactor;
}

- (unsigned)moSignallingAcBarringTime
{
  return self->_moSignallingAcBarringTime;
}

- (unsigned)moSignallingAcBarringForSpecialAc
{
  return self->_moSignallingAcBarringForSpecialAc;
}

- (unsigned)moDataAcBarringFactor
{
  return self->_moDataAcBarringFactor;
}

- (unsigned)moDataAcBarringTime
{
  return self->_moDataAcBarringTime;
}

- (unsigned)moDataAcBarringForSpecialAc
{
  return self->_moDataAcBarringForSpecialAc;
}

- (int)qRxLevMin
{
  return self->_qRxLevMin;
}

- (int)qQualMin
{
  return self->_qQualMin;
}

- (unsigned)qHyst
{
  return self->_qHyst;
}

- (unsigned)sNonIntraSearchP
{
  return self->_sNonIntraSearchP;
}

- (unsigned)sNonIntraSearchQ
{
  return self->_sNonIntraSearchQ;
}

- (unsigned)sIntraSearchP
{
  return self->_sIntraSearchP;
}

- (unsigned)sIntraSearchQ
{
  return self->_sIntraSearchQ;
}

- (unsigned)threshServingLowP
{
  return self->_threshServingLowP;
}

- (unsigned)threshServingLowQ
{
  return self->_threshServingLowQ;
}

- (unsigned)priorityOperatingFreq
{
  return self->_priorityOperatingFreq;
}

- (NSMutableArray)nbrEutras
{
  return self->_nbrEutras;
}

- (void)setNbrEutras:(id)a3
{
}

- (unsigned)dlEarfcn
{
  return self->_dlEarfcn;
}

- (unsigned)pci
{
  return self->_pci;
}

- (unsigned)dlRfBand
{
  return self->_dlRfBand;
}

- (unsigned)dlBandwidth
{
  return self->_dlBandwidth;
}

- (UtraReselectionInfo)utraReselInfo
{
  return self->_utraReselInfo;
}

- (void)setUtraReselInfo:(id)a3
{
}

- (GeraReselectionInfo)geraReselInfo
{
  return self->_geraReselInfo;
}

- (void)setGeraReselInfo:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utraReselInfo, 0);
  objc_storeStrong((id *)&self->_nbrEutras, 0);

  objc_storeStrong((id *)&self->_geraReselInfo, 0);
}

@end