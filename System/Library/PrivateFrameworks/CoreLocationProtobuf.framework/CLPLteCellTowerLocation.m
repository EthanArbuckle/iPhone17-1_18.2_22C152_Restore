@interface CLPLteCellTowerLocation
+ (Class)neighborType;
- (BOOL)hasAppBundleId;
- (BOOL)hasBandInfo;
- (BOOL)hasBandwidth;
- (BOOL)hasCellLatitude;
- (BOOL)hasCellLongitude;
- (BOOL)hasCsgId;
- (BOOL)hasCsgIndication;
- (BOOL)hasDeploymentType;
- (BOOL)hasDownlinkBandwidth;
- (BOOL)hasEcn0;
- (BOOL)hasHasWifiFallback;
- (BOOL)hasIsLimitedService;
- (BOOL)hasIsStalled;
- (BOOL)hasLatency;
- (BOOL)hasMaxThroughput;
- (BOOL)hasNeighborGroup;
- (BOOL)hasNpnCsgIdEf;
- (BOOL)hasNpnNwIdEf;
- (BOOL)hasOperatorName;
- (BOOL)hasPid;
- (BOOL)hasPmax;
- (BOOL)hasRscp;
- (BOOL)hasRssi;
- (BOOL)hasServerHash;
- (BOOL)hasServiceProviderName;
- (BOOL)hasTimingAdvance;
- (BOOL)hasUarfcn;
- (BOOL)hasUniqueCount;
- (BOOL)hasWifiFallback;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLimitedService;
- (BOOL)isStalled;
- (BOOL)readFrom:(id)a3;
- (BOOL)uniqueCount;
- (CLPCellNeighborsGroup)neighborGroup;
- (CLPLocation)location;
- (NSMutableArray)neighbors;
- (NSString)appBundleId;
- (NSString)npnCsgIdEf;
- (NSString)npnNwIdEf;
- (NSString)operatorName;
- (NSString)serviceProviderName;
- (double)cellLatitude;
- (double)cellLongitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)neighborAtIndex:(unint64_t)a3;
- (int)bandInfo;
- (int)bandwidth;
- (int)ci;
- (int)ecn0;
- (int)mcc;
- (int)mnc;
- (int)pid;
- (int)rscp;
- (int)rssi;
- (int)serverHash;
- (int)tac;
- (int)timingAdvance;
- (int)uarfcn;
- (unint64_t)hash;
- (unint64_t)neighborsCount;
- (unsigned)csgId;
- (unsigned)csgIndication;
- (unsigned)deploymentType;
- (unsigned)downlinkBandwidth;
- (unsigned)latency;
- (unsigned)maxThroughput;
- (unsigned)pmax;
- (void)addNeighbor:(id)a3;
- (void)clearNeighbors;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setBandInfo:(int)a3;
- (void)setBandwidth:(int)a3;
- (void)setCellLatitude:(double)a3;
- (void)setCellLongitude:(double)a3;
- (void)setCi:(int)a3;
- (void)setCsgId:(unsigned int)a3;
- (void)setCsgIndication:(unsigned int)a3;
- (void)setDeploymentType:(unsigned int)a3;
- (void)setDownlinkBandwidth:(unsigned int)a3;
- (void)setEcn0:(int)a3;
- (void)setHasBandInfo:(BOOL)a3;
- (void)setHasBandwidth:(BOOL)a3;
- (void)setHasCellLatitude:(BOOL)a3;
- (void)setHasCellLongitude:(BOOL)a3;
- (void)setHasCsgId:(BOOL)a3;
- (void)setHasCsgIndication:(BOOL)a3;
- (void)setHasDeploymentType:(BOOL)a3;
- (void)setHasDownlinkBandwidth:(BOOL)a3;
- (void)setHasEcn0:(BOOL)a3;
- (void)setHasHasWifiFallback:(BOOL)a3;
- (void)setHasIsLimitedService:(BOOL)a3;
- (void)setHasIsStalled:(BOOL)a3;
- (void)setHasLatency:(BOOL)a3;
- (void)setHasMaxThroughput:(BOOL)a3;
- (void)setHasPid:(BOOL)a3;
- (void)setHasPmax:(BOOL)a3;
- (void)setHasRscp:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setHasServerHash:(BOOL)a3;
- (void)setHasTimingAdvance:(BOOL)a3;
- (void)setHasUarfcn:(BOOL)a3;
- (void)setHasUniqueCount:(BOOL)a3;
- (void)setHasWifiFallback:(BOOL)a3;
- (void)setIsLimitedService:(BOOL)a3;
- (void)setIsStalled:(BOOL)a3;
- (void)setLatency:(unsigned int)a3;
- (void)setLocation:(id)a3;
- (void)setMaxThroughput:(unsigned int)a3;
- (void)setMcc:(int)a3;
- (void)setMnc:(int)a3;
- (void)setNeighborGroup:(id)a3;
- (void)setNeighbors:(id)a3;
- (void)setNpnCsgIdEf:(id)a3;
- (void)setNpnNwIdEf:(id)a3;
- (void)setOperatorName:(id)a3;
- (void)setPid:(int)a3;
- (void)setPmax:(unsigned int)a3;
- (void)setRscp:(int)a3;
- (void)setRssi:(int)a3;
- (void)setServerHash:(int)a3;
- (void)setServiceProviderName:(id)a3;
- (void)setTac:(int)a3;
- (void)setTimingAdvance:(int)a3;
- (void)setUarfcn:(int)a3;
- (void)setUniqueCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLteCellTowerLocation

- (void)setUarfcn:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_uarfcn = a3;
}

- (void)setHasUarfcn:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasUarfcn
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setPid:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_pid = a3;
}

- (void)setHasPid:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPid
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setBandInfo:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_bandInfo = a3;
}

- (void)setHasBandInfo:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBandInfo
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (BOOL)hasOperatorName
{
  return self->_operatorName != 0;
}

- (void)setCellLatitude:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_cellLatitude = a3;
}

- (void)setHasCellLatitude:(BOOL)a3
{
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCellLatitude
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCellLongitude:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_cellLongitude = a3;
}

- (void)setHasCellLongitude:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCellLongitude
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setServerHash:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_serverHash = a3;
}

- (void)setHasServerHash:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasServerHash
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setEcn0:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_ecn0 = a3;
}

- (void)setHasEcn0:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasEcn0
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setRscp:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRscp
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRssi:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRssi
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)clearNeighbors
{
}

- (void)addNeighbor:(id)a3
{
  id v4 = a3;
  neighbors = self->_neighbors;
  id v8 = v4;
  if (!neighbors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_neighbors;
    self->_neighbors = v6;

    id v4 = v8;
    neighbors = self->_neighbors;
  }
  [(NSMutableArray *)neighbors addObject:v4];
}

- (unint64_t)neighborsCount
{
  return [(NSMutableArray *)self->_neighbors count];
}

- (id)neighborAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_neighbors objectAtIndex:a3];
}

+ (Class)neighborType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNeighborGroup
{
  return self->_neighborGroup != 0;
}

- (void)setBandwidth:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_bandwidth = a3;
}

- (void)setHasBandwidth:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasBandwidth
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsLimitedService:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isLimitedService = a3;
}

- (void)setHasIsLimitedService:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsLimitedService
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasServiceProviderName
{
  return self->_serviceProviderName != 0;
}

- (void)setDeploymentType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_deploymentType = a3;
}

- (void)setHasDeploymentType:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasDeploymentType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setDownlinkBandwidth:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_downlinkBandwidth = a3;
}

- (void)setHasDownlinkBandwidth:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasDownlinkBandwidth
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setIsStalled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isStalled = a3;
}

- (void)setHasIsStalled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsStalled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setLatency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_latency = a3;
}

- (void)setHasLatency:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLatency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setPmax:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_pmax = a3;
}

- (void)setHasPmax:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPmax
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setMaxThroughput:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_maxThroughput = a3;
}

- (void)setHasMaxThroughput:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMaxThroughput
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCsgIndication:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_csgIndication = a3;
}

- (void)setHasCsgIndication:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCsgIndication
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCsgId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_csgId = a3;
}

- (void)setHasCsgId:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCsgId
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTimingAdvance:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_timingAdvance = a3;
}

- (void)setHasTimingAdvance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTimingAdvance
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setUniqueCount:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_uniqueCount = a3;
}

- (void)setHasUniqueCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasUniqueCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasWifiFallback:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_hasWifiFallback = a3;
}

- (void)setHasHasWifiFallback:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($518A04349E53DCBCEC9F539BAEE36789)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasHasWifiFallback
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasNpnNwIdEf
{
  return self->_npnNwIdEf != 0;
}

- (BOOL)hasNpnCsgIdEf
{
  return self->_npnCsgIdEf != 0;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLteCellTowerLocation;
  id v4 = [(CLPLteCellTowerLocation *)&v8 description];
  v5 = [(CLPLteCellTowerLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithInt:self->_mcc];
  [v3 setObject:v4 forKey:@"mcc"];

  v5 = [NSNumber numberWithInt:self->_mnc];
  [v3 setObject:v5 forKey:@"mnc"];

  v6 = [NSNumber numberWithInt:self->_tac];
  [v3 setObject:v6 forKey:@"tac"];

  v7 = [NSNumber numberWithInt:self->_ci];
  [v3 setObject:v7 forKey:@"ci"];

  $518A04349E53DCBCEC9F539BAEE36789 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v34 = [NSNumber numberWithInt:self->_uarfcn];
    [v3 setObject:v34 forKey:@"uarfcn"];

    $518A04349E53DCBCEC9F539BAEE36789 has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  v35 = [NSNumber numberWithInt:self->_pid];
  [v3 setObject:v35 forKey:@"pid"];

  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    v9 = [NSNumber numberWithInt:self->_bandInfo];
    [v3 setObject:v9 forKey:@"bandInfo"];
  }
LABEL_5:
  location = self->_location;
  if (location)
  {
    v11 = [(CLPLocation *)location dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"location"];
  }
  appBundleId = self->_appBundleId;
  if (appBundleId) {
    [v3 setObject:appBundleId forKey:@"appBundleId"];
  }
  operatorName = self->_operatorName;
  if (operatorName) {
    [v3 setObject:operatorName forKey:@"operatorName"];
  }
  $518A04349E53DCBCEC9F539BAEE36789 v14 = self->_has;
  if (*(unsigned char *)&v14)
  {
    v36 = [NSNumber numberWithDouble:self->_cellLatitude];
    [v3 setObject:v36 forKey:@"cellLatitude"];

    $518A04349E53DCBCEC9F539BAEE36789 v14 = self->_has;
    if ((*(unsigned char *)&v14 & 2) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&v14 & 0x8000) == 0) {
        goto LABEL_14;
      }
      goto LABEL_59;
    }
  }
  else if ((*(unsigned char *)&v14 & 2) == 0)
  {
    goto LABEL_13;
  }
  v37 = [NSNumber numberWithDouble:self->_cellLongitude];
  [v3 setObject:v37 forKey:@"cellLongitude"];

  $518A04349E53DCBCEC9F539BAEE36789 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v14 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_60;
  }
LABEL_59:
  v38 = [NSNumber numberWithInt:self->_serverHash];
  [v3 setObject:v38 forKey:@"serverHash"];

  $518A04349E53DCBCEC9F539BAEE36789 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v14 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_61;
  }
LABEL_60:
  v39 = [NSNumber numberWithInt:self->_ecn0];
  [v3 setObject:v39 forKey:@"ecn0"];

  $518A04349E53DCBCEC9F539BAEE36789 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v14 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_61:
  v40 = [NSNumber numberWithInt:self->_rscp];
  [v3 setObject:v40 forKey:@"rscp"];

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_17:
    v15 = [NSNumber numberWithInt:self->_rssi];
    [v3 setObject:v15 forKey:@"rssi"];
  }
LABEL_18:
  if ([(NSMutableArray *)self->_neighbors count])
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_neighbors, "count"));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v17 = self->_neighbors;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v52 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * i), "dictionaryRepresentation", (void)v51);
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKey:@"neighbor"];
  }
  neighborGroup = self->_neighborGroup;
  if (neighborGroup)
  {
    v24 = [(CLPCellNeighborsGroup *)neighborGroup dictionaryRepresentation];
    [v3 setObject:v24 forKey:@"neighborGroup"];
  }
  $518A04349E53DCBCEC9F539BAEE36789 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 8) != 0)
  {
    v26 = [NSNumber numberWithInt:self->_bandwidth];
    [v3 setObject:v26 forKey:@"bandwidth"];

    $518A04349E53DCBCEC9F539BAEE36789 v25 = self->_has;
  }
  if ((*(_DWORD *)&v25 & 0x80000) != 0)
  {
    v27 = [NSNumber numberWithBool:self->_isLimitedService];
    [v3 setObject:v27 forKey:@"isLimitedService"];
  }
  serviceProviderName = self->_serviceProviderName;
  if (serviceProviderName) {
    [v3 setObject:serviceProviderName forKey:@"serviceProviderName"];
  }
  $518A04349E53DCBCEC9F539BAEE36789 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 0x40) != 0)
  {
    v41 = [NSNumber numberWithUnsignedInt:self->_deploymentType];
    [v3 setObject:v41 forKey:@"deploymentType"];

    $518A04349E53DCBCEC9F539BAEE36789 v29 = self->_has;
    if ((*(unsigned char *)&v29 & 0x80) == 0)
    {
LABEL_37:
      if ((*(_DWORD *)&v29 & 0x100000) == 0) {
        goto LABEL_38;
      }
      goto LABEL_65;
    }
  }
  else if ((*(unsigned char *)&v29 & 0x80) == 0)
  {
    goto LABEL_37;
  }
  v42 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_downlinkBandwidth, (void)v51);
  [v3 setObject:v42 forKey:@"downlinkBandwidth"];

  $518A04349E53DCBCEC9F539BAEE36789 v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x100000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v29 & 0x200) == 0) {
      goto LABEL_39;
    }
    goto LABEL_66;
  }
LABEL_65:
  v43 = objc_msgSend(NSNumber, "numberWithBool:", self->_isStalled, (void)v51);
  [v3 setObject:v43 forKey:@"isStalled"];

  $518A04349E53DCBCEC9F539BAEE36789 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x200) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v29 & 0x1000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_67;
  }
LABEL_66:
  v44 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_latency, (void)v51);
  [v3 setObject:v44 forKey:@"latency"];

  $518A04349E53DCBCEC9F539BAEE36789 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x1000) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v29 & 0x400) == 0) {
      goto LABEL_41;
    }
    goto LABEL_68;
  }
LABEL_67:
  v45 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_pmax, (void)v51);
  [v3 setObject:v45 forKey:@"pmax"];

  $518A04349E53DCBCEC9F539BAEE36789 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x400) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&v29 & 0x20) == 0) {
      goto LABEL_42;
    }
    goto LABEL_69;
  }
LABEL_68:
  v46 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_maxThroughput, (void)v51);
  [v3 setObject:v46 forKey:@"maxThroughput"];

  $518A04349E53DCBCEC9F539BAEE36789 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 0x20) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&v29 & 0x10) == 0) {
      goto LABEL_43;
    }
    goto LABEL_70;
  }
LABEL_69:
  v47 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_csgIndication, (void)v51);
  [v3 setObject:v47 forKey:@"csgIndication"];

  $518A04349E53DCBCEC9F539BAEE36789 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 0x10) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v29 & 0x10000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_71;
  }
LABEL_70:
  v48 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_csgId, (void)v51);
  [v3 setObject:v48 forKey:@"csgId"];

  $518A04349E53DCBCEC9F539BAEE36789 v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x10000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v29 & 0x200000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_72;
  }
LABEL_71:
  v49 = objc_msgSend(NSNumber, "numberWithInt:", self->_timingAdvance, (void)v51);
  [v3 setObject:v49 forKey:@"timingAdvance"];

  $518A04349E53DCBCEC9F539BAEE36789 v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x200000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v29 & 0x40000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
LABEL_72:
  v50 = objc_msgSend(NSNumber, "numberWithBool:", self->_uniqueCount, (void)v51);
  [v3 setObject:v50 forKey:@"uniqueCount"];

  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_46:
    v30 = objc_msgSend(NSNumber, "numberWithBool:", self->_hasWifiFallback, (void)v51);
    [v3 setObject:v30 forKey:@"hasWifiFallback"];
  }
LABEL_47:
  npnNwIdEf = self->_npnNwIdEf;
  if (npnNwIdEf) {
    [v3 setObject:npnNwIdEf forKey:@"npnNwIdEf"];
  }
  npnCsgIdEf = self->_npnCsgIdEf;
  if (npnCsgIdEf) {
    [v3 setObject:npnCsgIdEf forKey:@"npnCsgIdEf"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLteCellTowerLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  $518A04349E53DCBCEC9F539BAEE36789 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $518A04349E53DCBCEC9F539BAEE36789 has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (!self->_location) {
    -[CLPLteCellTowerLocation writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (self->_appBundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_operatorName) {
    PBDataWriterWriteStringField();
  }
  $518A04349E53DCBCEC9F539BAEE36789 v6 = self->_has;
  if (*(unsigned char *)&v6)
  {
    PBDataWriterWriteDoubleField();
    $518A04349E53DCBCEC9F539BAEE36789 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 2) == 0)
    {
LABEL_12:
      if ((*(_WORD *)&v6 & 0x8000) == 0) {
        goto LABEL_13;
      }
      goto LABEL_54;
    }
  }
  else if ((*(unsigned char *)&v6 & 2) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteDoubleField();
  $518A04349E53DCBCEC9F539BAEE36789 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  $518A04349E53DCBCEC9F539BAEE36789 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteSint32Field();
  $518A04349E53DCBCEC9F539BAEE36789 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_56:
  PBDataWriterWriteSint32Field();
  if ((*(_DWORD *)&self->_has & 0x4000) != 0) {
LABEL_16:
  }
    PBDataWriterWriteSint32Field();
LABEL_17:
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = self->_neighbors;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if (self->_neighborGroup) {
    PBDataWriterWriteSubmessage();
  }
  $518A04349E53DCBCEC9F539BAEE36789 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    $518A04349E53DCBCEC9F539BAEE36789 v12 = self->_has;
  }
  if ((*(_DWORD *)&v12 & 0x80000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_serviceProviderName) {
    PBDataWriterWriteStringField();
  }
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
    if ((*(unsigned char *)&v13 & 0x80) == 0)
    {
LABEL_34:
      if ((*(_DWORD *)&v13 & 0x100000) == 0) {
        goto LABEL_35;
      }
      goto LABEL_60;
    }
  }
  else if ((*(unsigned char *)&v13 & 0x80) == 0)
  {
    goto LABEL_34;
  }
  PBDataWriterWriteUint32Field();
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v13 & 0x200) == 0) {
      goto LABEL_36;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v13 & 0x1000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v13 & 0x400) == 0) {
      goto LABEL_38;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_38:
    if ((*(unsigned char *)&v13 & 0x20) == 0) {
      goto LABEL_39;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x20) == 0)
  {
LABEL_39:
    if ((*(unsigned char *)&v13 & 0x10) == 0) {
      goto LABEL_40;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x10) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v13 & 0x10000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v13 & 0x200000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteInt32Field();
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v13 & 0x40000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_67:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x40000) != 0) {
LABEL_43:
  }
    PBDataWriterWriteBOOLField();
LABEL_44:
  if (self->_npnNwIdEf) {
    PBDataWriterWriteStringField();
  }
  if (self->_npnCsgIdEf) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[21] = self->_mcc;
  v4[22] = self->_mnc;
  v4[42] = self->_tac;
  v4[10] = self->_ci;
  $518A04349E53DCBCEC9F539BAEE36789 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v4[44] = self->_uarfcn;
    v4[46] |= 0x20000u;
    $518A04349E53DCBCEC9F539BAEE36789 has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  v4[34] = self->_pid;
  v4[46] |= 0x800u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[8] = self->_bandInfo;
    v4[46] |= 4u;
  }
LABEL_5:
  id v14 = v4;
  [v4 setLocation:self->_location];
  if (self->_appBundleId) {
    objc_msgSend(v14, "setAppBundleId:");
  }
  if (self->_operatorName) {
    objc_msgSend(v14, "setOperatorName:");
  }
  $518A04349E53DCBCEC9F539BAEE36789 v6 = self->_has;
  if (*(unsigned char *)&v6)
  {
    *((void *)v14 + 1) = *(void *)&self->_cellLatitude;
    *((_DWORD *)v14 + 46) |= 1u;
    $518A04349E53DCBCEC9F539BAEE36789 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 2) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v6 & 0x8000) == 0) {
        goto LABEL_12;
      }
      goto LABEL_52;
    }
  }
  else if ((*(unsigned char *)&v6 & 2) == 0)
  {
    goto LABEL_11;
  }
  *((void *)v14 + 2) = *(void *)&self->_cellLongitude;
  *((_DWORD *)v14 + 46) |= 2u;
  $518A04349E53DCBCEC9F539BAEE36789 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v14 + 38) = self->_serverHash;
  *((_DWORD *)v14 + 46) |= 0x8000u;
  $518A04349E53DCBCEC9F539BAEE36789 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_14;
    }
LABEL_54:
    *((_DWORD *)v14 + 36) = self->_rscp;
    *((_DWORD *)v14 + 46) |= 0x2000u;
    if ((*(_DWORD *)&self->_has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_53:
  *((_DWORD *)v14 + 15) = self->_ecn0;
  *((_DWORD *)v14 + 46) |= 0x100u;
  $518A04349E53DCBCEC9F539BAEE36789 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) != 0) {
    goto LABEL_54;
  }
LABEL_14:
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
LABEL_15:
    *((_DWORD *)v14 + 37) = self->_rssi;
    *((_DWORD *)v14 + 46) |= 0x4000u;
  }
LABEL_16:
  if ([(CLPLteCellTowerLocation *)self neighborsCount])
  {
    [v14 clearNeighbors];
    unint64_t v7 = [(CLPLteCellTowerLocation *)self neighborsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(CLPLteCellTowerLocation *)self neighborAtIndex:i];
        [v14 addNeighbor:v10];
      }
    }
  }
  if (self->_neighborGroup) {
    objc_msgSend(v14, "setNeighborGroup:");
  }
  $518A04349E53DCBCEC9F539BAEE36789 v11 = self->_has;
  $518A04349E53DCBCEC9F539BAEE36789 v12 = v14;
  if ((*(unsigned char *)&v11 & 8) != 0)
  {
    *((_DWORD *)v14 + 9) = self->_bandwidth;
    *((_DWORD *)v14 + 46) |= 8u;
    $518A04349E53DCBCEC9F539BAEE36789 v11 = self->_has;
  }
  if ((*(_DWORD *)&v11 & 0x80000) != 0)
  {
    *((unsigned char *)v14 + 181) = self->_isLimitedService;
    *((_DWORD *)v14 + 46) |= 0x80000u;
  }
  if (self->_serviceProviderName)
  {
    objc_msgSend(v14, "setServiceProviderName:");
    $518A04349E53DCBCEC9F539BAEE36789 v12 = v14;
  }
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x40) != 0)
  {
    v12[13] = self->_deploymentType;
    v12[46] |= 0x40u;
    $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
    if ((*(unsigned char *)&v13 & 0x80) == 0)
    {
LABEL_30:
      if ((*(_DWORD *)&v13 & 0x100000) == 0) {
        goto LABEL_31;
      }
      goto LABEL_58;
    }
  }
  else if ((*(unsigned char *)&v13 & 0x80) == 0)
  {
    goto LABEL_30;
  }
  v12[14] = self->_downlinkBandwidth;
  v12[46] |= 0x80u;
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v13 & 0x200) == 0) {
      goto LABEL_32;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((unsigned char *)v12 + 182) = self->_isStalled;
  v12[46] |= 0x100000u;
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v13 & 0x1000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_60;
  }
LABEL_59:
  v12[16] = self->_latency;
  v12[46] |= 0x200u;
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v13 & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_61;
  }
LABEL_60:
  v12[35] = self->_pmax;
  v12[46] |= 0x1000u;
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v13 & 0x20) == 0) {
      goto LABEL_35;
    }
    goto LABEL_62;
  }
LABEL_61:
  v12[20] = self->_maxThroughput;
  v12[46] |= 0x400u;
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x20) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&v13 & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_63;
  }
LABEL_62:
  v12[12] = self->_csgIndication;
  v12[46] |= 0x20u;
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x10) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v13 & 0x10000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_64;
  }
LABEL_63:
  v12[11] = self->_csgId;
  v12[46] |= 0x10u;
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v13 & 0x200000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_65;
  }
LABEL_64:
  v12[43] = self->_timingAdvance;
  v12[46] |= 0x10000u;
  $518A04349E53DCBCEC9F539BAEE36789 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v13 & 0x40000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_65:
  *((unsigned char *)v12 + 183) = self->_uniqueCount;
  v12[46] |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_39:
    *((unsigned char *)v12 + 180) = self->_hasWifiFallback;
    v12[46] |= 0x40000u;
  }
LABEL_40:
  if (self->_npnNwIdEf)
  {
    objc_msgSend(v14, "setNpnNwIdEf:");
    $518A04349E53DCBCEC9F539BAEE36789 v12 = v14;
  }
  if (self->_npnCsgIdEf)
  {
    objc_msgSend(v14, "setNpnCsgIdEf:");
    $518A04349E53DCBCEC9F539BAEE36789 v12 = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v5 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $518A04349E53DCBCEC9F539BAEE36789 v6 = v5;
  v5[21] = self->_mcc;
  v5[22] = self->_mnc;
  v5[42] = self->_tac;
  v5[10] = self->_ci;
  $518A04349E53DCBCEC9F539BAEE36789 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v5[44] = self->_uarfcn;
    v5[46] |= 0x20000u;
    $518A04349E53DCBCEC9F539BAEE36789 has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  v5[34] = self->_pid;
  v5[46] |= 0x800u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5[8] = self->_bandInfo;
    v5[46] |= 4u;
  }
LABEL_5:
  id v8 = [(CLPLocation *)self->_location copyWithZone:a3];
  uint64_t v9 = (void *)*((void *)v6 + 9);
  *((void *)v6 + 9) = v8;

  uint64_t v10 = [(NSString *)self->_appBundleId copyWithZone:a3];
  $518A04349E53DCBCEC9F539BAEE36789 v11 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = v10;

  uint64_t v12 = [(NSString *)self->_operatorName copyWithZone:a3];
  $518A04349E53DCBCEC9F539BAEE36789 v13 = (void *)*((void *)v6 + 16);
  *((void *)v6 + 16) = v12;

  $518A04349E53DCBCEC9F539BAEE36789 v14 = self->_has;
  if (*(unsigned char *)&v14)
  {
    *((void *)v6 + 1) = *(void *)&self->_cellLatitude;
    v6[46] |= 1u;
    $518A04349E53DCBCEC9F539BAEE36789 v14 = self->_has;
    if ((*(unsigned char *)&v14 & 2) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&v14 & 0x8000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&v14 & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v6 + 2) = *(void *)&self->_cellLongitude;
  v6[46] |= 2u;
  $518A04349E53DCBCEC9F539BAEE36789 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&v14 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_42;
  }
LABEL_41:
  v6[38] = self->_serverHash;
  v6[46] |= 0x8000u;
  $518A04349E53DCBCEC9F539BAEE36789 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&v14 & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_43;
  }
LABEL_42:
  v6[15] = self->_ecn0;
  v6[46] |= 0x100u;
  $518A04349E53DCBCEC9F539BAEE36789 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v14 & 0x4000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_43:
  v6[36] = self->_rscp;
  v6[46] |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_11:
    v6[37] = self->_rssi;
    v6[46] |= 0x4000u;
  }
LABEL_12:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v15 = self->_neighbors;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v19), "copyWithZone:", a3, (void)v32);
        [v6 addNeighbor:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v17);
  }

  id v21 = [(CLPCellNeighborsGroup *)self->_neighborGroup copyWithZone:a3];
  v22 = (void *)*((void *)v6 + 12);
  *((void *)v6 + 12) = v21;

  $518A04349E53DCBCEC9F539BAEE36789 v23 = self->_has;
  if ((*(unsigned char *)&v23 & 8) != 0)
  {
    v6[9] = self->_bandwidth;
    v6[46] |= 8u;
    $518A04349E53DCBCEC9F539BAEE36789 v23 = self->_has;
  }
  if ((*(_DWORD *)&v23 & 0x80000) != 0)
  {
    *((unsigned char *)v6 + 181) = self->_isLimitedService;
    v6[46] |= 0x80000u;
  }
  uint64_t v24 = -[NSString copyWithZone:](self->_serviceProviderName, "copyWithZone:", a3, (void)v32);
  $518A04349E53DCBCEC9F539BAEE36789 v25 = (void *)*((void *)v6 + 20);
  *((void *)v6 + 20) = v24;

  $518A04349E53DCBCEC9F539BAEE36789 v26 = self->_has;
  if ((*(unsigned char *)&v26 & 0x40) != 0)
  {
    v6[13] = self->_deploymentType;
    v6[46] |= 0x40u;
    $518A04349E53DCBCEC9F539BAEE36789 v26 = self->_has;
    if ((*(unsigned char *)&v26 & 0x80) == 0)
    {
LABEL_25:
      if ((*(_DWORD *)&v26 & 0x100000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_47;
    }
  }
  else if ((*(unsigned char *)&v26 & 0x80) == 0)
  {
    goto LABEL_25;
  }
  v6[14] = self->_downlinkBandwidth;
  v6[46] |= 0x80u;
  $518A04349E53DCBCEC9F539BAEE36789 v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x100000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v26 & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((unsigned char *)v6 + 182) = self->_isStalled;
  v6[46] |= 0x100000u;
  $518A04349E53DCBCEC9F539BAEE36789 v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x200) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v26 & 0x1000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_49;
  }
LABEL_48:
  v6[16] = self->_latency;
  v6[46] |= 0x200u;
  $518A04349E53DCBCEC9F539BAEE36789 v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x1000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v26 & 0x400) == 0) {
      goto LABEL_29;
    }
    goto LABEL_50;
  }
LABEL_49:
  v6[35] = self->_pmax;
  v6[46] |= 0x1000u;
  $518A04349E53DCBCEC9F539BAEE36789 v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x400) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v26 & 0x20) == 0) {
      goto LABEL_30;
    }
    goto LABEL_51;
  }
LABEL_50:
  v6[20] = self->_maxThroughput;
  v6[46] |= 0x400u;
  $518A04349E53DCBCEC9F539BAEE36789 v26 = self->_has;
  if ((*(unsigned char *)&v26 & 0x20) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v26 & 0x10) == 0) {
      goto LABEL_31;
    }
    goto LABEL_52;
  }
LABEL_51:
  v6[12] = self->_csgIndication;
  v6[46] |= 0x20u;
  $518A04349E53DCBCEC9F539BAEE36789 v26 = self->_has;
  if ((*(unsigned char *)&v26 & 0x10) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v26 & 0x10000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_53;
  }
LABEL_52:
  v6[11] = self->_csgId;
  v6[46] |= 0x10u;
  $518A04349E53DCBCEC9F539BAEE36789 v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x10000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v26 & 0x200000) == 0) {
      goto LABEL_33;
    }
LABEL_54:
    *((unsigned char *)v6 + 183) = self->_uniqueCount;
    v6[46] |= 0x200000u;
    if ((*(_DWORD *)&self->_has & 0x40000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_53:
  v6[43] = self->_timingAdvance;
  v6[46] |= 0x10000u;
  $518A04349E53DCBCEC9F539BAEE36789 v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x200000) != 0) {
    goto LABEL_54;
  }
LABEL_33:
  if ((*(_DWORD *)&v26 & 0x40000) != 0)
  {
LABEL_34:
    *((unsigned char *)v6 + 180) = self->_hasWifiFallback;
    v6[46] |= 0x40000u;
  }
LABEL_35:
  uint64_t v27 = [(NSString *)self->_npnNwIdEf copyWithZone:a3];
  v28 = (void *)*((void *)v6 + 15);
  *((void *)v6 + 15) = v27;

  uint64_t v29 = [(NSString *)self->_npnCsgIdEf copyWithZone:a3];
  v30 = (void *)*((void *)v6 + 14);
  *((void *)v6 + 14) = v29;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_mcc != *((_DWORD *)v4 + 21)
    || self->_mnc != *((_DWORD *)v4 + 22)
    || self->_tac != *((_DWORD *)v4 + 42)
    || self->_ci != *((_DWORD *)v4 + 10))
  {
    goto LABEL_145;
  }
  $518A04349E53DCBCEC9F539BAEE36789 has = self->_has;
  int v6 = *((_DWORD *)v4 + 46);
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_uarfcn != *((_DWORD *)v4 + 44)) {
      goto LABEL_145;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_pid != *((_DWORD *)v4 + 34)) {
      goto LABEL_145;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_145;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_bandInfo != *((_DWORD *)v4 + 8)) {
      goto LABEL_145;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_145;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 9) && !-[CLPLocation isEqual:](location, "isEqual:")) {
    goto LABEL_145;
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:")) {
      goto LABEL_145;
    }
  }
  operatorName = self->_operatorName;
  if ((unint64_t)operatorName | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](operatorName, "isEqual:")) {
      goto LABEL_145;
    }
  }
  $518A04349E53DCBCEC9F539BAEE36789 v10 = self->_has;
  int v11 = *((_DWORD *)v4 + 46);
  if (*(unsigned char *)&v10)
  {
    if ((v11 & 1) == 0 || self->_cellLatitude != *((double *)v4 + 1)) {
      goto LABEL_145;
    }
  }
  else if (v11)
  {
    goto LABEL_145;
  }
  if ((*(unsigned char *)&v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_cellLongitude != *((double *)v4 + 2)) {
      goto LABEL_145;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0 || self->_serverHash != *((_DWORD *)v4 + 38)) {
      goto LABEL_145;
    }
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&v10 & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_ecn0 != *((_DWORD *)v4 + 15)) {
      goto LABEL_145;
    }
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0 || self->_rscp != *((_DWORD *)v4 + 36)) {
      goto LABEL_145;
    }
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0 || self->_rssi != *((_DWORD *)v4 + 37)) {
      goto LABEL_145;
    }
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_145;
  }
  neighbors = self->_neighbors;
  if ((unint64_t)neighbors | *((void *)v4 + 13)
    && !-[NSMutableArray isEqual:](neighbors, "isEqual:"))
  {
    goto LABEL_145;
  }
  neighborGroup = self->_neighborGroup;
  if ((unint64_t)neighborGroup | *((void *)v4 + 12))
  {
    if (!-[CLPCellNeighborsGroup isEqual:](neighborGroup, "isEqual:")) {
      goto LABEL_145;
    }
  }
  $518A04349E53DCBCEC9F539BAEE36789 v14 = self->_has;
  int v15 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&v14 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_bandwidth != *((_DWORD *)v4 + 9)) {
      goto LABEL_145;
    }
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    if ((v15 & 0x80000) == 0) {
      goto LABEL_145;
    }
    if (self->_isLimitedService)
    {
      if (!*((unsigned char *)v4 + 181)) {
        goto LABEL_145;
      }
    }
    else if (*((unsigned char *)v4 + 181))
    {
      goto LABEL_145;
    }
  }
  else if ((v15 & 0x80000) != 0)
  {
    goto LABEL_145;
  }
  serviceProviderName = self->_serviceProviderName;
  if ((unint64_t)serviceProviderName | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](serviceProviderName, "isEqual:")) {
      goto LABEL_145;
    }
    $518A04349E53DCBCEC9F539BAEE36789 v14 = self->_has;
  }
  int v17 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_deploymentType != *((_DWORD *)v4 + 13)) {
      goto LABEL_145;
    }
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_145;
  }
  if ((*(unsigned char *)&v14 & 0x80) != 0)
  {
    if ((v17 & 0x80) == 0 || self->_downlinkBandwidth != *((_DWORD *)v4 + 14)) {
      goto LABEL_145;
    }
  }
  else if ((v17 & 0x80) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_DWORD *)&v14 & 0x100000) != 0)
  {
    if ((v17 & 0x100000) == 0) {
      goto LABEL_145;
    }
    if (self->_isStalled)
    {
      if (!*((unsigned char *)v4 + 182)) {
        goto LABEL_145;
      }
    }
    else if (*((unsigned char *)v4 + 182))
    {
      goto LABEL_145;
    }
  }
  else if ((v17 & 0x100000) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0 || self->_latency != *((_DWORD *)v4 + 16)) {
      goto LABEL_145;
    }
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&v14 & 0x1000) != 0)
  {
    if ((v17 & 0x1000) == 0 || self->_pmax != *((_DWORD *)v4 + 35)) {
      goto LABEL_145;
    }
  }
  else if ((v17 & 0x1000) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    if ((v17 & 0x400) == 0 || self->_maxThroughput != *((_DWORD *)v4 + 20)) {
      goto LABEL_145;
    }
  }
  else if ((v17 & 0x400) != 0)
  {
    goto LABEL_145;
  }
  if ((*(unsigned char *)&v14 & 0x20) != 0)
  {
    if ((v17 & 0x20) == 0 || self->_csgIndication != *((_DWORD *)v4 + 12)) {
      goto LABEL_145;
    }
  }
  else if ((v17 & 0x20) != 0)
  {
    goto LABEL_145;
  }
  if ((*(unsigned char *)&v14 & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0 || self->_csgId != *((_DWORD *)v4 + 11)) {
      goto LABEL_145;
    }
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
    if ((v17 & 0x10000) == 0 || self->_timingAdvance != *((_DWORD *)v4 + 43)) {
      goto LABEL_145;
    }
  }
  else if ((v17 & 0x10000) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    if ((v17 & 0x200000) == 0) {
      goto LABEL_145;
    }
    if (self->_uniqueCount)
    {
      if (!*((unsigned char *)v4 + 183)) {
        goto LABEL_145;
      }
    }
    else if (*((unsigned char *)v4 + 183))
    {
      goto LABEL_145;
    }
  }
  else if ((v17 & 0x200000) != 0)
  {
    goto LABEL_145;
  }
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v17 & 0x40000) != 0)
    {
      if (self->_hasWifiFallback)
      {
        if (!*((unsigned char *)v4 + 180)) {
          goto LABEL_145;
        }
        goto LABEL_141;
      }
      if (!*((unsigned char *)v4 + 180)) {
        goto LABEL_141;
      }
    }
LABEL_145:
    char v20 = 0;
    goto LABEL_146;
  }
  if ((v17 & 0x40000) != 0) {
    goto LABEL_145;
  }
LABEL_141:
  npnNwIdEf = self->_npnNwIdEf;
  if ((unint64_t)npnNwIdEf | *((void *)v4 + 15) && !-[NSString isEqual:](npnNwIdEf, "isEqual:")) {
    goto LABEL_145;
  }
  npnCsgIdEf = self->_npnCsgIdEf;
  if ((unint64_t)npnCsgIdEf | *((void *)v4 + 14)) {
    char v20 = -[NSString isEqual:](npnCsgIdEf, "isEqual:");
  }
  else {
    char v20 = 1;
  }
LABEL_146:

  return v20;
}

- (unint64_t)hash
{
  $518A04349E53DCBCEC9F539BAEE36789 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0) {
    uint64_t v49 = 2654435761 * self->_uarfcn;
  }
  else {
    uint64_t v49 = 0;
  }
  if ((*(_WORD *)&has & 0x800) != 0) {
    uint64_t v48 = 2654435761 * self->_pid;
  }
  else {
    uint64_t v48 = 0;
  }
  if ((*(unsigned char *)&has & 4) != 0) {
    uint64_t v47 = 2654435761 * self->_bandInfo;
  }
  else {
    uint64_t v47 = 0;
  }
  uint64_t mcc = self->_mcc;
  uint64_t tac = self->_tac;
  uint64_t mnc = self->_mnc;
  cuint64_t i = self->_ci;
  unint64_t v43 = [(CLPLocation *)self->_location hash];
  NSUInteger v41 = [(NSString *)self->_appBundleId hash];
  NSUInteger v40 = [(NSString *)self->_operatorName hash];
  $518A04349E53DCBCEC9F539BAEE36789 v4 = self->_has;
  if (*(unsigned char *)&v4)
  {
    double cellLatitude = self->_cellLatitude;
    double v7 = -cellLatitude;
    if (cellLatitude >= 0.0) {
      double v7 = self->_cellLatitude;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((*(unsigned char *)&v4 & 2) != 0)
  {
    double cellLongitude = self->_cellLongitude;
    double v12 = -cellLongitude;
    if (cellLongitude >= 0.0) {
      double v12 = self->_cellLongitude;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
    uint64_t v39 = 2654435761 * self->_serverHash;
    if ((*(_WORD *)&v4 & 0x100) != 0)
    {
LABEL_28:
      uint64_t v38 = 2654435761 * self->_ecn0;
      if ((*(_WORD *)&v4 & 0x2000) != 0) {
        goto LABEL_29;
      }
LABEL_33:
      uint64_t v37 = 0;
      if ((*(_WORD *)&v4 & 0x4000) != 0) {
        goto LABEL_30;
      }
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v39 = 0;
    if ((*(_WORD *)&v4 & 0x100) != 0) {
      goto LABEL_28;
    }
  }
  uint64_t v38 = 0;
  if ((*(_WORD *)&v4 & 0x2000) == 0) {
    goto LABEL_33;
  }
LABEL_29:
  uint64_t v37 = 2654435761 * self->_rscp;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_30:
    uint64_t v15 = 2654435761 * self->_rssi;
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v15 = 0;
LABEL_35:
  uint64_t v16 = [(NSMutableArray *)self->_neighbors hash];
  unint64_t v17 = [(CLPCellNeighborsGroup *)self->_neighborGroup hash];
  $518A04349E53DCBCEC9F539BAEE36789 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 8) != 0)
  {
    uint64_t v19 = 2654435761 * self->_bandwidth;
    if ((*(_DWORD *)&v18 & 0x80000) != 0) {
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((*(_DWORD *)&v18 & 0x80000) != 0)
    {
LABEL_37:
      uint64_t v20 = 2654435761 * self->_isLimitedService;
      goto LABEL_40;
    }
  }
  uint64_t v20 = 0;
LABEL_40:
  NSUInteger v21 = [(NSString *)self->_serviceProviderName hash];
  $518A04349E53DCBCEC9F539BAEE36789 v22 = self->_has;
  if ((*(unsigned char *)&v22 & 0x40) != 0)
  {
    uint64_t v23 = 2654435761 * self->_deploymentType;
    if ((*(unsigned char *)&v22 & 0x80) != 0)
    {
LABEL_42:
      uint64_t v24 = 2654435761 * self->_downlinkBandwidth;
      if ((*(_DWORD *)&v22 & 0x100000) != 0) {
        goto LABEL_43;
      }
      goto LABEL_54;
    }
  }
  else
  {
    uint64_t v23 = 0;
    if ((*(unsigned char *)&v22 & 0x80) != 0) {
      goto LABEL_42;
    }
  }
  uint64_t v24 = 0;
  if ((*(_DWORD *)&v22 & 0x100000) != 0)
  {
LABEL_43:
    uint64_t v25 = 2654435761 * self->_isStalled;
    if ((*(_WORD *)&v22 & 0x200) != 0) {
      goto LABEL_44;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v25 = 0;
  if ((*(_WORD *)&v22 & 0x200) != 0)
  {
LABEL_44:
    uint64_t v26 = 2654435761 * self->_latency;
    if ((*(_WORD *)&v22 & 0x1000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v26 = 0;
  if ((*(_WORD *)&v22 & 0x1000) != 0)
  {
LABEL_45:
    uint64_t v27 = 2654435761 * self->_pmax;
    if ((*(_WORD *)&v22 & 0x400) != 0) {
      goto LABEL_46;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v27 = 0;
  if ((*(_WORD *)&v22 & 0x400) != 0)
  {
LABEL_46:
    uint64_t v28 = 2654435761 * self->_maxThroughput;
    if ((*(unsigned char *)&v22 & 0x20) != 0) {
      goto LABEL_47;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v28 = 0;
  if ((*(unsigned char *)&v22 & 0x20) != 0)
  {
LABEL_47:
    uint64_t v29 = 2654435761 * self->_csgIndication;
    if ((*(unsigned char *)&v22 & 0x10) != 0) {
      goto LABEL_48;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v29 = 0;
  if ((*(unsigned char *)&v22 & 0x10) != 0)
  {
LABEL_48:
    uint64_t v30 = 2654435761 * self->_csgId;
    if ((*(_DWORD *)&v22 & 0x10000) != 0) {
      goto LABEL_49;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&v22 & 0x10000) != 0)
  {
LABEL_49:
    uint64_t v31 = 2654435761 * self->_timingAdvance;
    if ((*(_DWORD *)&v22 & 0x200000) != 0) {
      goto LABEL_50;
    }
LABEL_61:
    uint64_t v32 = 0;
    if ((*(_DWORD *)&v22 & 0x40000) != 0) {
      goto LABEL_51;
    }
LABEL_62:
    uint64_t v33 = 0;
    goto LABEL_63;
  }
LABEL_60:
  uint64_t v31 = 0;
  if ((*(_DWORD *)&v22 & 0x200000) == 0) {
    goto LABEL_61;
  }
LABEL_50:
  uint64_t v32 = 2654435761 * self->_uniqueCount;
  if ((*(_DWORD *)&v22 & 0x40000) == 0) {
    goto LABEL_62;
  }
LABEL_51:
  uint64_t v33 = 2654435761 * self->_hasWifiFallback;
LABEL_63:
  uint64_t v34 = (2654435761 * mnc) ^ (2654435761 * mcc) ^ (2654435761 * tac) ^ (2654435761 * ci) ^ v49 ^ v48 ^ v47 ^ v43 ^ v41 ^ v40 ^ v5 ^ v10 ^ v39 ^ v38 ^ v37 ^ v15 ^ v16 ^ v17 ^ v19 ^ v20 ^ v21 ^ v23 ^ v24;
  NSUInteger v35 = v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ [(NSString *)self->_npnNwIdEf hash];
  return v34 ^ v35 ^ [(NSString *)self->_npnCsgIdEf hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  $518A04349E53DCBCEC9F539BAEE36789 v4 = (int *)a3;
  unint64_t v5 = v4;
  self->_uint64_t mcc = v4[21];
  self->_uint64_t mnc = v4[22];
  self->_uint64_t tac = v4[42];
  self->_cuint64_t i = v4[10];
  int v6 = v4[46];
  if ((v6 & 0x20000) != 0)
  {
    self->_uarfcn = v4[44];
    *(_DWORD *)&self->_has |= 0x20000u;
    int v6 = v4[46];
    if ((v6 & 0x800) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v6 & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_pid = v4[34];
  *(_DWORD *)&self->_has |= 0x800u;
  if ((v4[46] & 4) != 0)
  {
LABEL_4:
    self->_bandInfo = v4[8];
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_5:
  location = self->_location;
  uint64_t v8 = *((void *)v5 + 9);
  if (location)
  {
    if (v8) {
      -[CLPLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[CLPLteCellTowerLocation setLocation:](self, "setLocation:");
  }
  if (*((void *)v5 + 3)) {
    -[CLPLteCellTowerLocation setAppBundleId:](self, "setAppBundleId:");
  }
  if (*((void *)v5 + 16)) {
    -[CLPLteCellTowerLocation setOperatorName:](self, "setOperatorName:");
  }
  int v9 = v5[46];
  if (v9)
  {
    self->_double cellLatitude = *((double *)v5 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v9 = v5[46];
    if ((v9 & 2) == 0)
    {
LABEL_19:
      if ((v9 & 0x8000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_36;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_19;
  }
  self->_double cellLongitude = *((double *)v5 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v9 = v5[46];
  if ((v9 & 0x8000) == 0)
  {
LABEL_20:
    if ((v9 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_serverHash = v5[38];
  *(_DWORD *)&self->_has |= 0x8000u;
  int v9 = v5[46];
  if ((v9 & 0x100) == 0)
  {
LABEL_21:
    if ((v9 & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_ecn0 = v5[15];
  *(_DWORD *)&self->_has |= 0x100u;
  int v9 = v5[46];
  if ((v9 & 0x2000) == 0)
  {
LABEL_22:
    if ((v9 & 0x4000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_38:
  self->_rscp = v5[36];
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((v5[46] & 0x4000) != 0)
  {
LABEL_23:
    self->_rssuint64_t i = v5[37];
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_24:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = *((id *)v5 + 13);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        -[CLPLteCellTowerLocation addNeighbor:](self, "addNeighbor:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  neighborGroup = self->_neighborGroup;
  uint64_t v16 = *((void *)v5 + 12);
  if (neighborGroup)
  {
    if (v16) {
      -[CLPCellNeighborsGroup mergeFrom:](neighborGroup, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[CLPLteCellTowerLocation setNeighborGroup:](self, "setNeighborGroup:");
  }
  int v17 = v5[46];
  if ((v17 & 8) != 0)
  {
    self->_bandwidth = v5[9];
    *(_DWORD *)&self->_has |= 8u;
    int v17 = v5[46];
  }
  if ((v17 & 0x80000) != 0)
  {
    self->_isLimitedService = *((unsigned char *)v5 + 181);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
  if (*((void *)v5 + 20)) {
    -[CLPLteCellTowerLocation setServiceProviderName:](self, "setServiceProviderName:");
  }
  int v18 = v5[46];
  if ((v18 & 0x40) != 0)
  {
    self->_deploymentType = v5[13];
    *(_DWORD *)&self->_has |= 0x40u;
    int v18 = v5[46];
    if ((v18 & 0x80) == 0)
    {
LABEL_50:
      if ((v18 & 0x100000) == 0) {
        goto LABEL_51;
      }
      goto LABEL_67;
    }
  }
  else if ((v18 & 0x80) == 0)
  {
    goto LABEL_50;
  }
  self->_downlinkBandwidth = v5[14];
  *(_DWORD *)&self->_has |= 0x80u;
  int v18 = v5[46];
  if ((v18 & 0x100000) == 0)
  {
LABEL_51:
    if ((v18 & 0x200) == 0) {
      goto LABEL_52;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_isStalled = *((unsigned char *)v5 + 182);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v18 = v5[46];
  if ((v18 & 0x200) == 0)
  {
LABEL_52:
    if ((v18 & 0x1000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_latency = v5[16];
  *(_DWORD *)&self->_has |= 0x200u;
  int v18 = v5[46];
  if ((v18 & 0x1000) == 0)
  {
LABEL_53:
    if ((v18 & 0x400) == 0) {
      goto LABEL_54;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_pmax = v5[35];
  *(_DWORD *)&self->_has |= 0x1000u;
  int v18 = v5[46];
  if ((v18 & 0x400) == 0)
  {
LABEL_54:
    if ((v18 & 0x20) == 0) {
      goto LABEL_55;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_maxThroughput = v5[20];
  *(_DWORD *)&self->_has |= 0x400u;
  int v18 = v5[46];
  if ((v18 & 0x20) == 0)
  {
LABEL_55:
    if ((v18 & 0x10) == 0) {
      goto LABEL_56;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_csgIndication = v5[12];
  *(_DWORD *)&self->_has |= 0x20u;
  int v18 = v5[46];
  if ((v18 & 0x10) == 0)
  {
LABEL_56:
    if ((v18 & 0x10000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_csgId = v5[11];
  *(_DWORD *)&self->_has |= 0x10u;
  int v18 = v5[46];
  if ((v18 & 0x10000) == 0)
  {
LABEL_57:
    if ((v18 & 0x200000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_timingAdvance = v5[43];
  *(_DWORD *)&self->_has |= 0x10000u;
  int v18 = v5[46];
  if ((v18 & 0x200000) == 0)
  {
LABEL_58:
    if ((v18 & 0x40000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_74:
  self->_uniqueCount = *((unsigned char *)v5 + 183);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((v5[46] & 0x40000) != 0)
  {
LABEL_59:
    self->_hasWifiFallback = *((unsigned char *)v5 + 180);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_60:
  if (*((void *)v5 + 15)) {
    -[CLPLteCellTowerLocation setNpnNwIdEf:](self, "setNpnNwIdEf:");
  }
  if (*((void *)v5 + 14)) {
    -[CLPLteCellTowerLocation setNpnCsgIdEf:](self, "setNpnCsgIdEf:");
  }
}

- (int)mcc
{
  return self->_mcc;
}

- (void)setMcc:(int)a3
{
  self->_uint64_t mcc = a3;
}

- (int)mnc
{
  return self->_mnc;
}

- (void)setMnc:(int)a3
{
  self->_uint64_t mnc = a3;
}

- (int)tac
{
  return self->_tac;
}

- (void)setTac:(int)a3
{
  self->_uint64_t tac = a3;
}

- (int)ci
{
  return self->_ci;
}

- (void)setCi:(int)a3
{
  self->_cuint64_t i = a3;
}

- (int)uarfcn
{
  return self->_uarfcn;
}

- (int)pid
{
  return self->_pid;
}

- (int)bandInfo
{
  return self->_bandInfo;
}

- (CLPLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)operatorName
{
  return self->_operatorName;
}

- (void)setOperatorName:(id)a3
{
}

- (double)cellLatitude
{
  return self->_cellLatitude;
}

- (double)cellLongitude
{
  return self->_cellLongitude;
}

- (int)serverHash
{
  return self->_serverHash;
}

- (int)ecn0
{
  return self->_ecn0;
}

- (int)rscp
{
  return self->_rscp;
}

- (int)rssi
{
  return self->_rssi;
}

- (NSMutableArray)neighbors
{
  return self->_neighbors;
}

- (void)setNeighbors:(id)a3
{
}

- (CLPCellNeighborsGroup)neighborGroup
{
  return self->_neighborGroup;
}

- (void)setNeighborGroup:(id)a3
{
}

- (int)bandwidth
{
  return self->_bandwidth;
}

- (BOOL)isLimitedService
{
  return self->_isLimitedService;
}

- (NSString)serviceProviderName
{
  return self->_serviceProviderName;
}

- (void)setServiceProviderName:(id)a3
{
}

- (unsigned)deploymentType
{
  return self->_deploymentType;
}

- (unsigned)downlinkBandwidth
{
  return self->_downlinkBandwidth;
}

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (unsigned)latency
{
  return self->_latency;
}

- (unsigned)pmax
{
  return self->_pmax;
}

- (unsigned)maxThroughput
{
  return self->_maxThroughput;
}

- (unsigned)csgIndication
{
  return self->_csgIndication;
}

- (unsigned)csgId
{
  return self->_csgId;
}

- (int)timingAdvance
{
  return self->_timingAdvance;
}

- (BOOL)uniqueCount
{
  return self->_uniqueCount;
}

- (BOOL)hasWifiFallback
{
  return self->_hasWifiFallback;
}

- (NSString)npnNwIdEf
{
  return self->_npnNwIdEf;
}

- (void)setNpnNwIdEf:(id)a3
{
}

- (NSString)npnCsgIdEf
{
  return self->_npnCsgIdEf;
}

- (void)setNpnCsgIdEf:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderName, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_npnNwIdEf, 0);
  objc_storeStrong((id *)&self->_npnCsgIdEf, 0);
  objc_storeStrong((id *)&self->_neighbors, 0);
  objc_storeStrong((id *)&self->_neighborGroup, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPLteCellTowerLocation writeTo:]", "CLPCollectionRequest.gen.m", 24735, "self->_location != nil");
}

@end