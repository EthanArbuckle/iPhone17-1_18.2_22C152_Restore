@interface CLPNRCellTowerLocation
+ (Class)neighborType;
- (BOOL)hasAppBundleId;
- (BOOL)hasBandInfo;
- (BOOL)hasBandwidth;
- (BOOL)hasBwpSupport;
- (BOOL)hasCellLatitude;
- (BOOL)hasCellLongitude;
- (BOOL)hasCi;
- (BOOL)hasDownlinkBandwidth;
- (BOOL)hasEcn0;
- (BOOL)hasGscn;
- (BOOL)hasHasWifiFallback;
- (BOOL)hasIsLimitedService;
- (BOOL)hasIsStalled;
- (BOOL)hasLatency;
- (BOOL)hasLocation;
- (BOOL)hasMaxThroughput;
- (BOOL)hasMcc;
- (BOOL)hasMnc;
- (BOOL)hasNeighborGroup;
- (BOOL)hasNpnCsgIdEf;
- (BOOL)hasNpnNwIdEf;
- (BOOL)hasNrarfcn;
- (BOOL)hasOperatorName;
- (BOOL)hasPid;
- (BOOL)hasPmax;
- (BOOL)hasRscp;
- (BOOL)hasRssi;
- (BOOL)hasScs;
- (BOOL)hasServerHash;
- (BOOL)hasServiceProviderName;
- (BOOL)hasTac;
- (BOOL)hasTimingAdvance;
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
- (int)ecn0;
- (int)mcc;
- (int)mnc;
- (int)nrarfcn;
- (int)pid;
- (int)rscp;
- (int)rssi;
- (int)serverHash;
- (int)tac;
- (int)timingAdvance;
- (int64_t)ci;
- (unint64_t)hash;
- (unint64_t)neighborsCount;
- (unsigned)bwpSupport;
- (unsigned)downlinkBandwidth;
- (unsigned)gscn;
- (unsigned)latency;
- (unsigned)maxThroughput;
- (unsigned)pmax;
- (unsigned)scs;
- (void)addNeighbor:(id)a3;
- (void)clearNeighbors;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setBandInfo:(int)a3;
- (void)setBandwidth:(int)a3;
- (void)setBwpSupport:(unsigned int)a3;
- (void)setCellLatitude:(double)a3;
- (void)setCellLongitude:(double)a3;
- (void)setCi:(int64_t)a3;
- (void)setDownlinkBandwidth:(unsigned int)a3;
- (void)setEcn0:(int)a3;
- (void)setGscn:(unsigned int)a3;
- (void)setHasBandInfo:(BOOL)a3;
- (void)setHasBandwidth:(BOOL)a3;
- (void)setHasBwpSupport:(BOOL)a3;
- (void)setHasCellLatitude:(BOOL)a3;
- (void)setHasCellLongitude:(BOOL)a3;
- (void)setHasCi:(BOOL)a3;
- (void)setHasDownlinkBandwidth:(BOOL)a3;
- (void)setHasEcn0:(BOOL)a3;
- (void)setHasGscn:(BOOL)a3;
- (void)setHasHasWifiFallback:(BOOL)a3;
- (void)setHasIsLimitedService:(BOOL)a3;
- (void)setHasIsStalled:(BOOL)a3;
- (void)setHasLatency:(BOOL)a3;
- (void)setHasMaxThroughput:(BOOL)a3;
- (void)setHasMcc:(BOOL)a3;
- (void)setHasMnc:(BOOL)a3;
- (void)setHasNrarfcn:(BOOL)a3;
- (void)setHasPid:(BOOL)a3;
- (void)setHasPmax:(BOOL)a3;
- (void)setHasRscp:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setHasScs:(BOOL)a3;
- (void)setHasServerHash:(BOOL)a3;
- (void)setHasTac:(BOOL)a3;
- (void)setHasTimingAdvance:(BOOL)a3;
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
- (void)setNrarfcn:(int)a3;
- (void)setOperatorName:(id)a3;
- (void)setPid:(int)a3;
- (void)setPmax:(unsigned int)a3;
- (void)setRscp:(int)a3;
- (void)setRssi:(int)a3;
- (void)setScs:(unsigned int)a3;
- (void)setServerHash:(int)a3;
- (void)setServiceProviderName:(id)a3;
- (void)setTac:(int)a3;
- (void)setTimingAdvance:(int)a3;
- (void)setUniqueCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPNRCellTowerLocation

- (void)setMcc:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMcc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setMnc:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMnc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setTac:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_tac = a3;
}

- (void)setHasTac:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasTac
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setCi:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_ci = a3;
}

- (void)setHasCi:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCi
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNrarfcn:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_nrarfcn = a3;
}

- (void)setHasNrarfcn:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNrarfcn
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setPid:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_pid = a3;
}

- (void)setHasPid:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasPid
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setBandInfo:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_bandInfo = a3;
}

- (void)setHasBandInfo:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasBandInfo
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
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
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
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
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCellLongitude
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setServerHash:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_serverHash = a3;
}

- (void)setHasServerHash:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasServerHash
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setEcn0:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_ecn0 = a3;
}

- (void)setHasEcn0:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasEcn0
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setRscp:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRscp
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setRssi:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasRssi
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
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
  *(_DWORD *)&self->_has |= 0x10u;
  self->_bandwidth = a3;
}

- (void)setHasBandwidth:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasBandwidth
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsLimitedService:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_isLimitedService = a3;
}

- (void)setHasIsLimitedService:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIsLimitedService
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasServiceProviderName
{
  return self->_serviceProviderName != 0;
}

- (void)setScs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_scs = a3;
}

- (void)setHasScs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasScs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setGscn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_gscn = a3;
}

- (void)setHasGscn:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasGscn
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setDownlinkBandwidth:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_downlinkBandwidth = a3;
}

- (void)setHasDownlinkBandwidth:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasDownlinkBandwidth
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setIsStalled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isStalled = a3;
}

- (void)setHasIsStalled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsStalled
{
  return *((unsigned char *)&self->_has + 3) & 1;
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
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLatency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setPmax:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_pmax = a3;
}

- (void)setHasPmax:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPmax
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
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
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMaxThroughput
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setBwpSupport:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_bwpSupport = a3;
}

- (void)setHasBwpSupport:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBwpSupport
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTimingAdvance:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_timingAdvance = a3;
}

- (void)setHasTimingAdvance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasTimingAdvance
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setUniqueCount:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_uniqueCount = a3;
}

- (void)setHasUniqueCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasUniqueCount
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasWifiFallback:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_hasWifiFallback = a3;
}

- (void)setHasHasWifiFallback:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($669F305041D4B77DFCAD0040E26D0AA5)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasHasWifiFallback
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
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
  v8.super_class = (Class)CLPNRCellTowerLocation;
  id v4 = [(CLPNRCellTowerLocation *)&v8 description];
  v5 = [(CLPNRCellTowerLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v31 = [NSNumber numberWithInt:self->_mcc];
    [v3 setObject:v31 forKey:@"mcc"];

    $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  v32 = [NSNumber numberWithInt:self->_mnc];
  [v3 setObject:v32 forKey:@"mnc"];

  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_59;
  }
LABEL_58:
  v33 = [NSNumber numberWithInt:self->_tac];
  [v3 setObject:v33 forKey:@"tac"];

  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_60;
  }
LABEL_59:
  v34 = [NSNumber numberWithLongLong:self->_ci];
  [v3 setObject:v34 forKey:@"ci"];

  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_61;
  }
LABEL_60:
  v35 = [NSNumber numberWithInt:self->_nrarfcn];
  [v3 setObject:v35 forKey:@"nrarfcn"];

  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_61:
  v36 = [NSNumber numberWithInt:self->_pid];
  [v3 setObject:v36 forKey:@"pid"];

  if ((*(_DWORD *)&self->_has & 8) != 0)
  {
LABEL_8:
    v5 = [NSNumber numberWithInt:self->_bandInfo];
    [v3 setObject:v5 forKey:@"bandInfo"];
  }
LABEL_9:
  location = self->_location;
  if (location)
  {
    v7 = [(CLPLocation *)location dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"location"];
  }
  appBundleId = self->_appBundleId;
  if (appBundleId) {
    [v3 setObject:appBundleId forKey:@"appBundleId"];
  }
  operatorName = self->_operatorName;
  if (operatorName) {
    [v3 setObject:operatorName forKey:@"operatorName"];
  }
  $669F305041D4B77DFCAD0040E26D0AA5 v10 = self->_has;
  if (*(unsigned char *)&v10)
  {
    v37 = [NSNumber numberWithDouble:self->_cellLatitude];
    [v3 setObject:v37 forKey:@"cellLatitude"];

    $669F305041D4B77DFCAD0040E26D0AA5 v10 = self->_has;
    if ((*(unsigned char *)&v10 & 2) == 0)
    {
LABEL_17:
      if ((*(_DWORD *)&v10 & 0x80000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_65;
    }
  }
  else if ((*(unsigned char *)&v10 & 2) == 0)
  {
    goto LABEL_17;
  }
  v38 = [NSNumber numberWithDouble:self->_cellLongitude];
  [v3 setObject:v38 forKey:@"cellLongitude"];

  $669F305041D4B77DFCAD0040E26D0AA5 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v10 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_66;
  }
LABEL_65:
  v39 = [NSNumber numberWithInt:self->_serverHash];
  [v3 setObject:v39 forKey:@"serverHash"];

  $669F305041D4B77DFCAD0040E26D0AA5 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x80) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v10 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_67;
  }
LABEL_66:
  v40 = [NSNumber numberWithInt:self->_ecn0];
  [v3 setObject:v40 forKey:@"ecn0"];

  $669F305041D4B77DFCAD0040E26D0AA5 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v10 & 0x20000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_67:
  v41 = [NSNumber numberWithInt:self->_rscp];
  [v3 setObject:v41 forKey:@"rscp"];

  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_21:
    v11 = [NSNumber numberWithInt:self->_rssi];
    [v3 setObject:v11 forKey:@"rssi"];
  }
LABEL_22:
  if ([(NSMutableArray *)self->_neighbors count])
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_neighbors, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v13 = self->_neighbors;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v53 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "dictionaryRepresentation", (void)v52);
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"neighbor"];
  }
  neighborGroup = self->_neighborGroup;
  if (neighborGroup)
  {
    v20 = [(CLPCellNeighborsGroup *)neighborGroup dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"neighborGroup"];
  }
  $669F305041D4B77DFCAD0040E26D0AA5 v21 = self->_has;
  if ((*(unsigned char *)&v21 & 0x10) != 0)
  {
    v22 = [NSNumber numberWithInt:self->_bandwidth];
    [v3 setObject:v22 forKey:@"bandwidth"];

    $669F305041D4B77DFCAD0040E26D0AA5 v21 = self->_has;
  }
  if ((*(_DWORD *)&v21 & 0x800000) != 0)
  {
    v23 = [NSNumber numberWithBool:self->_isLimitedService];
    [v3 setObject:v23 forKey:@"isLimitedService"];
  }
  serviceProviderName = self->_serviceProviderName;
  if (serviceProviderName) {
    [v3 setObject:serviceProviderName forKey:@"serviceProviderName"];
  }
  $669F305041D4B77DFCAD0040E26D0AA5 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x40000) != 0)
  {
    v42 = [NSNumber numberWithUnsignedInt:self->_scs];
    [v3 setObject:v42 forKey:@"scs"];

    $669F305041D4B77DFCAD0040E26D0AA5 v25 = self->_has;
    if ((*(_WORD *)&v25 & 0x100) == 0)
    {
LABEL_41:
      if ((*(unsigned char *)&v25 & 0x40) == 0) {
        goto LABEL_42;
      }
      goto LABEL_71;
    }
  }
  else if ((*(_WORD *)&v25 & 0x100) == 0)
  {
    goto LABEL_41;
  }
  v43 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_gscn, (void)v52);
  [v3 setObject:v43 forKey:@"gscn"];

  $669F305041D4B77DFCAD0040E26D0AA5 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x40) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v25 & 0x1000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_72;
  }
LABEL_71:
  v44 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_downlinkBandwidth, (void)v52);
  [v3 setObject:v44 forKey:@"downlinkBandwidth"];

  $669F305041D4B77DFCAD0040E26D0AA5 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x1000000) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&v25 & 0x200) == 0) {
      goto LABEL_44;
    }
    goto LABEL_73;
  }
LABEL_72:
  v45 = objc_msgSend(NSNumber, "numberWithBool:", self->_isStalled, (void)v52);
  [v3 setObject:v45 forKey:@"isStalled"];

  $669F305041D4B77DFCAD0040E26D0AA5 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x200) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v25 & 0x8000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_74;
  }
LABEL_73:
  v46 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_latency, (void)v52);
  [v3 setObject:v46 forKey:@"latency"];

  $669F305041D4B77DFCAD0040E26D0AA5 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x8000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v25 & 0x400) == 0) {
      goto LABEL_46;
    }
    goto LABEL_75;
  }
LABEL_74:
  v47 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_pmax, (void)v52);
  [v3 setObject:v47 forKey:@"pmax"];

  $669F305041D4B77DFCAD0040E26D0AA5 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x400) == 0)
  {
LABEL_46:
    if ((*(unsigned char *)&v25 & 0x20) == 0) {
      goto LABEL_47;
    }
    goto LABEL_76;
  }
LABEL_75:
  v48 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_maxThroughput, (void)v52);
  [v3 setObject:v48 forKey:@"maxThroughput"];

  $669F305041D4B77DFCAD0040E26D0AA5 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x20) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v25 & 0x200000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_77;
  }
LABEL_76:
  v49 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_bwpSupport, (void)v52);
  [v3 setObject:v49 forKey:@"bwpSupport"];

  $669F305041D4B77DFCAD0040E26D0AA5 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x200000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v25 & 0x2000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_78;
  }
LABEL_77:
  v50 = objc_msgSend(NSNumber, "numberWithInt:", self->_timingAdvance, (void)v52);
  [v3 setObject:v50 forKey:@"timingAdvance"];

  $669F305041D4B77DFCAD0040E26D0AA5 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x2000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v25 & 0x400000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
LABEL_78:
  v51 = objc_msgSend(NSNumber, "numberWithBool:", self->_uniqueCount, (void)v52);
  [v3 setObject:v51 forKey:@"uniqueCount"];

  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_50:
    v26 = objc_msgSend(NSNumber, "numberWithBool:", self->_hasWifiFallback, (void)v52);
    [v3 setObject:v26 forKey:@"hasWifiFallback"];
  }
LABEL_51:
  npnNwIdEf = self->_npnNwIdEf;
  if (npnNwIdEf) {
    [v3 setObject:npnNwIdEf forKey:@"npnNwIdEf"];
  }
  npnCsgIdEf = self->_npnCsgIdEf;
  if (npnCsgIdEf) {
    [v3 setObject:npnCsgIdEf forKey:@"npnCsgIdEf"];
  }
  id v29 = v3;

  return v29;
}

- (BOOL)readFrom:(id)a3
{
  return CLPNRCellTowerLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteInt32Field();
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt64Field();
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 8) != 0) {
LABEL_8:
  }
    PBDataWriterWriteInt32Field();
LABEL_9:
  if (self->_location) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appBundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_operatorName) {
    PBDataWriterWriteStringField();
  }
  $669F305041D4B77DFCAD0040E26D0AA5 v6 = self->_has;
  if (*(unsigned char *)&v6)
  {
    PBDataWriterWriteDoubleField();
    $669F305041D4B77DFCAD0040E26D0AA5 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 2) == 0)
    {
LABEL_17:
      if ((*(_DWORD *)&v6 & 0x80000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_63;
    }
  }
  else if ((*(unsigned char *)&v6 & 2) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteDoubleField();
  $669F305041D4B77DFCAD0040E26D0AA5 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  $669F305041D4B77DFCAD0040E26D0AA5 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteSint32Field();
  $669F305041D4B77DFCAD0040E26D0AA5 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x20000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_65:
  PBDataWriterWriteSint32Field();
  if ((*(_DWORD *)&self->_has & 0x20000) != 0) {
LABEL_21:
  }
    PBDataWriterWriteSint32Field();
LABEL_22:
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
  $669F305041D4B77DFCAD0040E26D0AA5 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    $669F305041D4B77DFCAD0040E26D0AA5 v12 = self->_has;
  }
  if ((*(_DWORD *)&v12 & 0x800000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_serviceProviderName) {
    PBDataWriterWriteStringField();
  }
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x100) == 0)
    {
LABEL_39:
      if ((*(unsigned char *)&v13 & 0x40) == 0) {
        goto LABEL_40;
      }
      goto LABEL_69;
    }
  }
  else if ((*(_WORD *)&v13 & 0x100) == 0)
  {
    goto LABEL_39;
  }
  PBDataWriterWriteUint32Field();
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x40) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v13 & 0x1000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint32Field();
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x1000000) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v13 & 0x200) == 0) {
      goto LABEL_42;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteBOOLField();
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v13 & 0x8000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint32Field();
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&v13 & 0x400) == 0) {
      goto LABEL_44;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v13 & 0x20) == 0) {
      goto LABEL_45;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint32Field();
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x20) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v13 & 0x200000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v13 & 0x2000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt32Field();
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x2000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v13 & 0x400000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_76:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x400000) != 0) {
LABEL_48:
  }
    PBDataWriterWriteBOOLField();
LABEL_49:
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
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v4[21] = self->_mcc;
    v4[47] |= 0x800u;
    $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  v4[22] = self->_mnc;
  v4[47] |= 0x1000u;
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_56;
  }
LABEL_55:
  v4[44] = self->_tac;
  v4[47] |= 0x100000u;
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)v4 + 3) = self->_ci;
  v4[47] |= 4u;
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_58;
  }
LABEL_57:
  v4[32] = self->_nrarfcn;
  v4[47] |= 0x2000u;
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_58:
  v4[36] = self->_pid;
  v4[47] |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 8) != 0)
  {
LABEL_8:
    v4[10] = self->_bandInfo;
    v4[47] |= 8u;
  }
LABEL_9:
  long long v14 = v4;
  if (self->_location)
  {
    objc_msgSend(v4, "setLocation:");
    id v4 = v14;
  }
  if (self->_appBundleId)
  {
    objc_msgSend(v14, "setAppBundleId:");
    id v4 = v14;
  }
  if (self->_operatorName)
  {
    objc_msgSend(v14, "setOperatorName:");
    id v4 = v14;
  }
  $669F305041D4B77DFCAD0040E26D0AA5 v6 = self->_has;
  if (*(unsigned char *)&v6)
  {
    *((void *)v4 + 1) = *(void *)&self->_cellLatitude;
    v4[47] |= 1u;
    $669F305041D4B77DFCAD0040E26D0AA5 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 2) == 0)
    {
LABEL_17:
      if ((*(_DWORD *)&v6 & 0x80000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_62;
    }
  }
  else if ((*(unsigned char *)&v6 & 2) == 0)
  {
    goto LABEL_17;
  }
  *((void *)v4 + 2) = *(void *)&self->_cellLongitude;
  v4[47] |= 2u;
  $669F305041D4B77DFCAD0040E26D0AA5 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_63;
  }
LABEL_62:
  v4[41] = self->_serverHash;
  v4[47] |= 0x80000u;
  $669F305041D4B77DFCAD0040E26D0AA5 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_20;
    }
LABEL_64:
    v4[38] = self->_rscp;
    v4[47] |= 0x10000u;
    if ((*(_DWORD *)&self->_has & 0x20000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_63:
  v4[14] = self->_ecn0;
  v4[47] |= 0x80u;
  $669F305041D4B77DFCAD0040E26D0AA5 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) != 0) {
    goto LABEL_64;
  }
LABEL_20:
  if ((*(_DWORD *)&v6 & 0x20000) != 0)
  {
LABEL_21:
    v4[39] = self->_rssi;
    v4[47] |= 0x20000u;
  }
LABEL_22:
  if ([(CLPNRCellTowerLocation *)self neighborsCount])
  {
    [v14 clearNeighbors];
    unint64_t v7 = [(CLPNRCellTowerLocation *)self neighborsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(CLPNRCellTowerLocation *)self neighborAtIndex:i];
        [v14 addNeighbor:v10];
      }
    }
  }
  if (self->_neighborGroup) {
    objc_msgSend(v14, "setNeighborGroup:");
  }
  $669F305041D4B77DFCAD0040E26D0AA5 v11 = self->_has;
  $669F305041D4B77DFCAD0040E26D0AA5 v12 = v14;
  if ((*(unsigned char *)&v11 & 0x10) != 0)
  {
    v14[11] = self->_bandwidth;
    v14[47] |= 0x10u;
    $669F305041D4B77DFCAD0040E26D0AA5 v11 = self->_has;
  }
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
    *((unsigned char *)v14 + 185) = self->_isLimitedService;
    v14[47] |= 0x800000u;
  }
  if (self->_serviceProviderName)
  {
    objc_msgSend(v14, "setServiceProviderName:");
    $669F305041D4B77DFCAD0040E26D0AA5 v12 = v14;
  }
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) != 0)
  {
    v12[40] = self->_scs;
    v12[47] |= 0x40000u;
    $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x100) == 0)
    {
LABEL_36:
      if ((*(unsigned char *)&v13 & 0x40) == 0) {
        goto LABEL_37;
      }
      goto LABEL_68;
    }
  }
  else if ((*(_WORD *)&v13 & 0x100) == 0)
  {
    goto LABEL_36;
  }
  v12[15] = self->_gscn;
  v12[47] |= 0x100u;
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x40) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v13 & 0x1000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_69;
  }
LABEL_68:
  v12[13] = self->_downlinkBandwidth;
  v12[47] |= 0x40u;
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x1000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v13 & 0x200) == 0) {
      goto LABEL_39;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((unsigned char *)v12 + 186) = self->_isStalled;
  v12[47] |= 0x1000000u;
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v13 & 0x8000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_71;
  }
LABEL_70:
  v12[16] = self->_latency;
  v12[47] |= 0x200u;
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v13 & 0x400) == 0) {
      goto LABEL_41;
    }
    goto LABEL_72;
  }
LABEL_71:
  v12[37] = self->_pmax;
  v12[47] |= 0x8000u;
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&v13 & 0x20) == 0) {
      goto LABEL_42;
    }
    goto LABEL_73;
  }
LABEL_72:
  v12[20] = self->_maxThroughput;
  v12[47] |= 0x400u;
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x20) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v13 & 0x200000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_74;
  }
LABEL_73:
  v12[12] = self->_bwpSupport;
  v12[47] |= 0x20u;
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v13 & 0x2000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_75;
  }
LABEL_74:
  v12[45] = self->_timingAdvance;
  v12[47] |= 0x200000u;
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x2000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v13 & 0x400000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_75:
  *((unsigned char *)v12 + 187) = self->_uniqueCount;
  v12[47] |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_45:
    *((unsigned char *)v12 + 184) = self->_hasWifiFallback;
    v12[47] |= 0x400000u;
  }
LABEL_46:
  if (self->_npnNwIdEf)
  {
    objc_msgSend(v14, "setNpnNwIdEf:");
    $669F305041D4B77DFCAD0040E26D0AA5 v12 = v14;
  }
  if (self->_npnCsgIdEf)
  {
    objc_msgSend(v14, "setNpnCsgIdEf:");
    $669F305041D4B77DFCAD0040E26D0AA5 v12 = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_mcc;
    *(_DWORD *)(v5 + 188) |= 0x800u;
    $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
    if ((*(_WORD *)&has & 0x1000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_42;
    }
  }
  else if ((*(_WORD *)&has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 88) = self->_mnc;
  *(_DWORD *)(v5 + 188) |= 0x1000u;
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 176) = self->_tac;
  *(_DWORD *)(v5 + 188) |= 0x100000u;
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(void *)(v5 + 24) = self->_ci;
  *(_DWORD *)(v5 + 188) |= 4u;
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v5 + 128) = self->_nrarfcn;
  *(_DWORD *)(v5 + 188) |= 0x2000u;
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_45:
  *(_DWORD *)(v5 + 144) = self->_pid;
  *(_DWORD *)(v5 + 188) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 8) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 40) = self->_bandInfo;
    *(_DWORD *)(v5 + 188) |= 8u;
  }
LABEL_9:
  id v8 = [(CLPLocation *)self->_location copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v8;

  uint64_t v10 = [(NSString *)self->_appBundleId copyWithZone:a3];
  $669F305041D4B77DFCAD0040E26D0AA5 v11 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_operatorName copyWithZone:a3];
  $669F305041D4B77DFCAD0040E26D0AA5 v13 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v12;

  $669F305041D4B77DFCAD0040E26D0AA5 v14 = self->_has;
  if (*(unsigned char *)&v14)
  {
    *(double *)(v6 + 8) = self->_cellLatitude;
    *(_DWORD *)(v6 + 188) |= 1u;
    $669F305041D4B77DFCAD0040E26D0AA5 v14 = self->_has;
    if ((*(unsigned char *)&v14 & 2) == 0)
    {
LABEL_11:
      if ((*(_DWORD *)&v14 & 0x80000) == 0) {
        goto LABEL_12;
      }
      goto LABEL_49;
    }
  }
  else if ((*(unsigned char *)&v14 & 2) == 0)
  {
    goto LABEL_11;
  }
  *(double *)(v6 + 16) = self->_cellLongitude;
  *(_DWORD *)(v6 + 188) |= 2u;
  $669F305041D4B77DFCAD0040E26D0AA5 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&v14 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v6 + 164) = self->_serverHash;
  *(_DWORD *)(v6 + 188) |= 0x80000u;
  $669F305041D4B77DFCAD0040E26D0AA5 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v14 & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v6 + 56) = self->_ecn0;
  *(_DWORD *)(v6 + 188) |= 0x80u;
  $669F305041D4B77DFCAD0040E26D0AA5 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v14 & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_51:
  *(_DWORD *)(v6 + 152) = self->_rscp;
  *(_DWORD *)(v6 + 188) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_15:
    *(_DWORD *)(v6 + 156) = self->_rssi;
    *(_DWORD *)(v6 + 188) |= 0x20000u;
  }
LABEL_16:
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
        v20 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v19), "copyWithZone:", a3, (void)v32);
        [(id)v6 addNeighbor:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v17);
  }

  id v21 = [(CLPCellNeighborsGroup *)self->_neighborGroup copyWithZone:a3];
  v22 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v21;

  $669F305041D4B77DFCAD0040E26D0AA5 v23 = self->_has;
  if ((*(unsigned char *)&v23 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_bandwidth;
    *(_DWORD *)(v6 + 188) |= 0x10u;
    $669F305041D4B77DFCAD0040E26D0AA5 v23 = self->_has;
  }
  if ((*(_DWORD *)&v23 & 0x800000) != 0)
  {
    *(unsigned char *)(v6 + 185) = self->_isLimitedService;
    *(_DWORD *)(v6 + 188) |= 0x800000u;
  }
  uint64_t v24 = -[NSString copyWithZone:](self->_serviceProviderName, "copyWithZone:", a3, (void)v32);
  $669F305041D4B77DFCAD0040E26D0AA5 v25 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v24;

  $669F305041D4B77DFCAD0040E26D0AA5 v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x40000) != 0)
  {
    *(_DWORD *)(v6 + 160) = self->_scs;
    *(_DWORD *)(v6 + 188) |= 0x40000u;
    $669F305041D4B77DFCAD0040E26D0AA5 v26 = self->_has;
    if ((*(_WORD *)&v26 & 0x100) == 0)
    {
LABEL_29:
      if ((*(unsigned char *)&v26 & 0x40) == 0) {
        goto LABEL_30;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&v26 & 0x100) == 0)
  {
    goto LABEL_29;
  }
  *(_DWORD *)(v6 + 60) = self->_gscn;
  *(_DWORD *)(v6 + 188) |= 0x100u;
  $669F305041D4B77DFCAD0040E26D0AA5 v26 = self->_has;
  if ((*(unsigned char *)&v26 & 0x40) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v26 & 0x1000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v6 + 52) = self->_downlinkBandwidth;
  *(_DWORD *)(v6 + 188) |= 0x40u;
  $669F305041D4B77DFCAD0040E26D0AA5 v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x1000000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v26 & 0x200) == 0) {
      goto LABEL_32;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(unsigned char *)(v6 + 186) = self->_isStalled;
  *(_DWORD *)(v6 + 188) |= 0x1000000u;
  $669F305041D4B77DFCAD0040E26D0AA5 v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x200) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v26 & 0x8000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v6 + 64) = self->_latency;
  *(_DWORD *)(v6 + 188) |= 0x200u;
  $669F305041D4B77DFCAD0040E26D0AA5 v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x8000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v26 & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v6 + 148) = self->_pmax;
  *(_DWORD *)(v6 + 188) |= 0x8000u;
  $669F305041D4B77DFCAD0040E26D0AA5 v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x400) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v26 & 0x20) == 0) {
      goto LABEL_35;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v6 + 80) = self->_maxThroughput;
  *(_DWORD *)(v6 + 188) |= 0x400u;
  $669F305041D4B77DFCAD0040E26D0AA5 v26 = self->_has;
  if ((*(unsigned char *)&v26 & 0x20) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v26 & 0x200000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(_DWORD *)(v6 + 48) = self->_bwpSupport;
  *(_DWORD *)(v6 + 188) |= 0x20u;
  $669F305041D4B77DFCAD0040E26D0AA5 v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x200000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v26 & 0x2000000) == 0) {
      goto LABEL_37;
    }
LABEL_62:
    *(unsigned char *)(v6 + 187) = self->_uniqueCount;
    *(_DWORD *)(v6 + 188) |= 0x2000000u;
    if ((*(_DWORD *)&self->_has & 0x400000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_61:
  *(_DWORD *)(v6 + 180) = self->_timingAdvance;
  *(_DWORD *)(v6 + 188) |= 0x200000u;
  $669F305041D4B77DFCAD0040E26D0AA5 v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x2000000) != 0) {
    goto LABEL_62;
  }
LABEL_37:
  if ((*(_DWORD *)&v26 & 0x400000) != 0)
  {
LABEL_38:
    *(unsigned char *)(v6 + 184) = self->_hasWifiFallback;
    *(_DWORD *)(v6 + 188) |= 0x400000u;
  }
LABEL_39:
  uint64_t v27 = [(NSString *)self->_npnNwIdEf copyWithZone:a3];
  v28 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v27;

  uint64_t v29 = [(NSString *)self->_npnCsgIdEf copyWithZone:a3];
  v30 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v29;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_161;
  }
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  int v6 = *((_DWORD *)v4 + 47);
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_mcc != *((_DWORD *)v4 + 21)) {
      goto LABEL_161;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_mnc != *((_DWORD *)v4 + 22)) {
      goto LABEL_161;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_tac != *((_DWORD *)v4 + 44)) {
      goto LABEL_161;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_ci != *((void *)v4 + 3)) {
      goto LABEL_161;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_nrarfcn != *((_DWORD *)v4 + 32)) {
      goto LABEL_161;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_pid != *((_DWORD *)v4 + 36)) {
      goto LABEL_161;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_bandInfo != *((_DWORD *)v4 + 10)) {
      goto LABEL_161;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_161;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 9) && !-[CLPLocation isEqual:](location, "isEqual:")) {
    goto LABEL_161;
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:")) {
      goto LABEL_161;
    }
  }
  operatorName = self->_operatorName;
  if ((unint64_t)operatorName | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](operatorName, "isEqual:")) {
      goto LABEL_161;
    }
  }
  $669F305041D4B77DFCAD0040E26D0AA5 v10 = self->_has;
  int v11 = *((_DWORD *)v4 + 47);
  if (*(unsigned char *)&v10)
  {
    if ((v11 & 1) == 0 || self->_cellLatitude != *((double *)v4 + 1)) {
      goto LABEL_161;
    }
  }
  else if (v11)
  {
    goto LABEL_161;
  }
  if ((*(unsigned char *)&v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_cellLongitude != *((double *)v4 + 2)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&v10 & 0x80000) != 0)
  {
    if ((v11 & 0x80000) == 0 || self->_serverHash != *((_DWORD *)v4 + 41)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x80000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(unsigned char *)&v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_ecn0 != *((_DWORD *)v4 + 14)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0 || self->_rscp != *((_DWORD *)v4 + 38)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    if ((v11 & 0x20000) == 0 || self->_rssi != *((_DWORD *)v4 + 39)) {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x20000) != 0)
  {
    goto LABEL_161;
  }
  neighbors = self->_neighbors;
  if ((unint64_t)neighbors | *((void *)v4 + 13)
    && !-[NSMutableArray isEqual:](neighbors, "isEqual:"))
  {
    goto LABEL_161;
  }
  neighborGroup = self->_neighborGroup;
  if ((unint64_t)neighborGroup | *((void *)v4 + 12))
  {
    if (!-[CLPCellNeighborsGroup isEqual:](neighborGroup, "isEqual:")) {
      goto LABEL_161;
    }
  }
  $669F305041D4B77DFCAD0040E26D0AA5 v14 = self->_has;
  int v15 = *((_DWORD *)v4 + 47);
  if ((*(unsigned char *)&v14 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_bandwidth != *((_DWORD *)v4 + 11)) {
      goto LABEL_161;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
    if ((v15 & 0x800000) == 0) {
      goto LABEL_161;
    }
    if (self->_isLimitedService)
    {
      if (!*((unsigned char *)v4 + 185)) {
        goto LABEL_161;
      }
    }
    else if (*((unsigned char *)v4 + 185))
    {
      goto LABEL_161;
    }
  }
  else if ((v15 & 0x800000) != 0)
  {
    goto LABEL_161;
  }
  serviceProviderName = self->_serviceProviderName;
  if ((unint64_t)serviceProviderName | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](serviceProviderName, "isEqual:")) {
      goto LABEL_161;
    }
    $669F305041D4B77DFCAD0040E26D0AA5 v14 = self->_has;
  }
  int v17 = *((_DWORD *)v4 + 47);
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v17 & 0x40000) == 0 || self->_scs != *((_DWORD *)v4 + 40)) {
      goto LABEL_161;
    }
  }
  else if ((v17 & 0x40000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    if ((v17 & 0x100) == 0 || self->_gscn != *((_DWORD *)v4 + 15)) {
      goto LABEL_161;
    }
  }
  else if ((v17 & 0x100) != 0)
  {
    goto LABEL_161;
  }
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_downlinkBandwidth != *((_DWORD *)v4 + 13)) {
      goto LABEL_161;
    }
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&v14 & 0x1000000) != 0)
  {
    if ((v17 & 0x1000000) == 0) {
      goto LABEL_161;
    }
    if (self->_isStalled)
    {
      if (!*((unsigned char *)v4 + 186)) {
        goto LABEL_161;
      }
    }
    else if (*((unsigned char *)v4 + 186))
    {
      goto LABEL_161;
    }
  }
  else if ((v17 & 0x1000000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0 || self->_latency != *((_DWORD *)v4 + 16)) {
      goto LABEL_161;
    }
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&v14 & 0x8000) != 0)
  {
    if ((v17 & 0x8000) == 0 || self->_pmax != *((_DWORD *)v4 + 37)) {
      goto LABEL_161;
    }
  }
  else if ((v17 & 0x8000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    if ((v17 & 0x400) == 0 || self->_maxThroughput != *((_DWORD *)v4 + 20)) {
      goto LABEL_161;
    }
  }
  else if ((v17 & 0x400) != 0)
  {
    goto LABEL_161;
  }
  if ((*(unsigned char *)&v14 & 0x20) != 0)
  {
    if ((v17 & 0x20) == 0 || self->_bwpSupport != *((_DWORD *)v4 + 12)) {
      goto LABEL_161;
    }
  }
  else if ((v17 & 0x20) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    if ((v17 & 0x200000) == 0 || self->_timingAdvance != *((_DWORD *)v4 + 45)) {
      goto LABEL_161;
    }
  }
  else if ((v17 & 0x200000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&v14 & 0x2000000) != 0)
  {
    if ((v17 & 0x2000000) == 0) {
      goto LABEL_161;
    }
    if (self->_uniqueCount)
    {
      if (!*((unsigned char *)v4 + 187)) {
        goto LABEL_161;
      }
    }
    else if (*((unsigned char *)v4 + 187))
    {
      goto LABEL_161;
    }
  }
  else if ((v17 & 0x2000000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&v14 & 0x400000) != 0)
  {
    if ((v17 & 0x400000) != 0)
    {
      if (self->_hasWifiFallback)
      {
        if (!*((unsigned char *)v4 + 184)) {
          goto LABEL_161;
        }
        goto LABEL_157;
      }
      if (!*((unsigned char *)v4 + 184)) {
        goto LABEL_157;
      }
    }
LABEL_161:
    char v20 = 0;
    goto LABEL_162;
  }
  if ((v17 & 0x400000) != 0) {
    goto LABEL_161;
  }
LABEL_157:
  npnNwIdEf = self->_npnNwIdEf;
  if ((unint64_t)npnNwIdEf | *((void *)v4 + 15) && !-[NSString isEqual:](npnNwIdEf, "isEqual:")) {
    goto LABEL_161;
  }
  npnCsgIdEf = self->_npnCsgIdEf;
  if ((unint64_t)npnCsgIdEf | *((void *)v4 + 14)) {
    char v20 = -[NSString isEqual:](npnCsgIdEf, "isEqual:");
  }
  else {
    char v20 = 1;
  }
LABEL_162:

  return v20;
}

- (unint64_t)hash
{
  $669F305041D4B77DFCAD0040E26D0AA5 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    uint64_t v49 = 2654435761 * self->_mcc;
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
LABEL_3:
      uint64_t v48 = 2654435761 * self->_mnc;
      if ((*(_DWORD *)&has & 0x100000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v49 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v48 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_4:
    uint64_t v47 = 2654435761 * self->_tac;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v47 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_5:
    uint64_t v46 = 2654435761 * self->_ci;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v46 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    uint64_t v45 = 2654435761 * self->_nrarfcn;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v44 = 0;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v45 = 0;
  if ((*(_WORD *)&has & 0x4000) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v44 = 2654435761 * self->_pid;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_8:
    uint64_t v43 = 2654435761 * self->_bandInfo;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v43 = 0;
LABEL_16:
  unint64_t v42 = [(CLPLocation *)self->_location hash];
  NSUInteger v41 = [(NSString *)self->_appBundleId hash];
  NSUInteger v40 = [(NSString *)self->_operatorName hash];
  $669F305041D4B77DFCAD0040E26D0AA5 v4 = self->_has;
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
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
    uint64_t v39 = 2654435761 * self->_serverHash;
    if ((*(unsigned char *)&v4 & 0x80) != 0)
    {
LABEL_34:
      uint64_t v38 = 2654435761 * self->_ecn0;
      if ((*(_DWORD *)&v4 & 0x10000) != 0) {
        goto LABEL_35;
      }
LABEL_39:
      uint64_t v37 = 0;
      if ((*(_DWORD *)&v4 & 0x20000) != 0) {
        goto LABEL_36;
      }
      goto LABEL_40;
    }
  }
  else
  {
    uint64_t v39 = 0;
    if ((*(unsigned char *)&v4 & 0x80) != 0) {
      goto LABEL_34;
    }
  }
  uint64_t v38 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) == 0) {
    goto LABEL_39;
  }
LABEL_35:
  uint64_t v37 = 2654435761 * self->_rscp;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
LABEL_36:
    uint64_t v15 = 2654435761 * self->_rssi;
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v15 = 0;
LABEL_41:
  uint64_t v16 = [(NSMutableArray *)self->_neighbors hash];
  unint64_t v17 = [(CLPCellNeighborsGroup *)self->_neighborGroup hash];
  $669F305041D4B77DFCAD0040E26D0AA5 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x10) != 0)
  {
    uint64_t v19 = 2654435761 * self->_bandwidth;
    if ((*(_DWORD *)&v18 & 0x800000) != 0) {
      goto LABEL_43;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((*(_DWORD *)&v18 & 0x800000) != 0)
    {
LABEL_43:
      uint64_t v20 = 2654435761 * self->_isLimitedService;
      goto LABEL_46;
    }
  }
  uint64_t v20 = 0;
LABEL_46:
  NSUInteger v21 = [(NSString *)self->_serviceProviderName hash];
  $669F305041D4B77DFCAD0040E26D0AA5 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x40000) != 0)
  {
    uint64_t v23 = 2654435761 * self->_scs;
    if ((*(_WORD *)&v22 & 0x100) != 0)
    {
LABEL_48:
      uint64_t v24 = 2654435761 * self->_gscn;
      if ((*(unsigned char *)&v22 & 0x40) != 0) {
        goto LABEL_49;
      }
      goto LABEL_60;
    }
  }
  else
  {
    uint64_t v23 = 0;
    if ((*(_WORD *)&v22 & 0x100) != 0) {
      goto LABEL_48;
    }
  }
  uint64_t v24 = 0;
  if ((*(unsigned char *)&v22 & 0x40) != 0)
  {
LABEL_49:
    uint64_t v25 = 2654435761 * self->_downlinkBandwidth;
    if ((*(_DWORD *)&v22 & 0x1000000) != 0) {
      goto LABEL_50;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&v22 & 0x1000000) != 0)
  {
LABEL_50:
    uint64_t v26 = 2654435761 * self->_isStalled;
    if ((*(_WORD *)&v22 & 0x200) != 0) {
      goto LABEL_51;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v26 = 0;
  if ((*(_WORD *)&v22 & 0x200) != 0)
  {
LABEL_51:
    uint64_t v27 = 2654435761 * self->_latency;
    if ((*(_WORD *)&v22 & 0x8000) != 0) {
      goto LABEL_52;
    }
    goto LABEL_63;
  }
LABEL_62:
  uint64_t v27 = 0;
  if ((*(_WORD *)&v22 & 0x8000) != 0)
  {
LABEL_52:
    uint64_t v28 = 2654435761 * self->_pmax;
    if ((*(_WORD *)&v22 & 0x400) != 0) {
      goto LABEL_53;
    }
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v28 = 0;
  if ((*(_WORD *)&v22 & 0x400) != 0)
  {
LABEL_53:
    uint64_t v29 = 2654435761 * self->_maxThroughput;
    if ((*(unsigned char *)&v22 & 0x20) != 0) {
      goto LABEL_54;
    }
    goto LABEL_65;
  }
LABEL_64:
  uint64_t v29 = 0;
  if ((*(unsigned char *)&v22 & 0x20) != 0)
  {
LABEL_54:
    uint64_t v30 = 2654435761 * self->_bwpSupport;
    if ((*(_DWORD *)&v22 & 0x200000) != 0) {
      goto LABEL_55;
    }
    goto LABEL_66;
  }
LABEL_65:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&v22 & 0x200000) != 0)
  {
LABEL_55:
    uint64_t v31 = 2654435761 * self->_timingAdvance;
    if ((*(_DWORD *)&v22 & 0x2000000) != 0) {
      goto LABEL_56;
    }
LABEL_67:
    uint64_t v32 = 0;
    if ((*(_DWORD *)&v22 & 0x400000) != 0) {
      goto LABEL_57;
    }
LABEL_68:
    uint64_t v33 = 0;
    goto LABEL_69;
  }
LABEL_66:
  uint64_t v31 = 0;
  if ((*(_DWORD *)&v22 & 0x2000000) == 0) {
    goto LABEL_67;
  }
LABEL_56:
  uint64_t v32 = 2654435761 * self->_uniqueCount;
  if ((*(_DWORD *)&v22 & 0x400000) == 0) {
    goto LABEL_68;
  }
LABEL_57:
  uint64_t v33 = 2654435761 * self->_hasWifiFallback;
LABEL_69:
  unint64_t v34 = v48 ^ v49 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v5 ^ v10 ^ v39 ^ v38 ^ v37 ^ v15 ^ v16 ^ v17 ^ v19 ^ v20 ^ v21 ^ v23 ^ v24;
  NSUInteger v35 = v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ [(NSString *)self->_npnNwIdEf hash];
  return v34 ^ v35 ^ [(NSString *)self->_npnCsgIdEf hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  int v6 = *((_DWORD *)v4 + 47);
  if ((v6 & 0x800) != 0)
  {
    self->_mcc = *((_DWORD *)v4 + 21);
    *(_DWORD *)&self->_has |= 0x800u;
    int v6 = *((_DWORD *)v4 + 47);
    if ((v6 & 0x1000) == 0)
    {
LABEL_3:
      if ((v6 & 0x100000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v6 & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  self->_mnc = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v6 = *((_DWORD *)v4 + 47);
  if ((v6 & 0x100000) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_tac = *((_DWORD *)v4 + 44);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v6 = *((_DWORD *)v4 + 47);
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_cuint64_t i = *((void *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v6 = *((_DWORD *)v4 + 47);
  if ((v6 & 0x2000) == 0)
  {
LABEL_6:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_nrarfcn = *((_DWORD *)v4 + 32);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v6 = *((_DWORD *)v4 + 47);
  if ((v6 & 0x4000) == 0)
  {
LABEL_7:
    if ((v6 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_pid = *((_DWORD *)v4 + 36);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 47) & 8) != 0)
  {
LABEL_8:
    self->_bandInfo = *((_DWORD *)v4 + 10);
    *(_DWORD *)&self->_has |= 8u;
  }
LABEL_9:
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
    -[CLPNRCellTowerLocation setLocation:](self, "setLocation:");
  }
  if (*((void *)v5 + 4)) {
    -[CLPNRCellTowerLocation setAppBundleId:](self, "setAppBundleId:");
  }
  if (*((void *)v5 + 17)) {
    -[CLPNRCellTowerLocation setOperatorName:](self, "setOperatorName:");
  }
  int v9 = *((_DWORD *)v5 + 47);
  if (v9)
  {
    self->_double cellLatitude = *((double *)v5 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v9 = *((_DWORD *)v5 + 47);
    if ((v9 & 2) == 0)
    {
LABEL_27:
      if ((v9 & 0x80000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_44;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_27;
  }
  self->_double cellLongitude = *((double *)v5 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v9 = *((_DWORD *)v5 + 47);
  if ((v9 & 0x80000) == 0)
  {
LABEL_28:
    if ((v9 & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_serverHash = *((_DWORD *)v5 + 41);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v9 = *((_DWORD *)v5 + 47);
  if ((v9 & 0x80) == 0)
  {
LABEL_29:
    if ((v9 & 0x10000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_ecn0 = *((_DWORD *)v5 + 14);
  *(_DWORD *)&self->_has |= 0x80u;
  int v9 = *((_DWORD *)v5 + 47);
  if ((v9 & 0x10000) == 0)
  {
LABEL_30:
    if ((v9 & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_46:
  self->_rscp = *((_DWORD *)v5 + 38);
  *(_DWORD *)&self->_has |= 0x10000u;
  if ((*((_DWORD *)v5 + 47) & 0x20000) != 0)
  {
LABEL_31:
    self->_rssuint64_t i = *((_DWORD *)v5 + 39);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
LABEL_32:
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
        -[CLPNRCellTowerLocation addNeighbor:](self, "addNeighbor:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
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
    -[CLPNRCellTowerLocation setNeighborGroup:](self, "setNeighborGroup:");
  }
  int v17 = *((_DWORD *)v5 + 47);
  if ((v17 & 0x10) != 0)
  {
    self->_bandwidth = *((_DWORD *)v5 + 11);
    *(_DWORD *)&self->_has |= 0x10u;
    int v17 = *((_DWORD *)v5 + 47);
  }
  if ((v17 & 0x800000) != 0)
  {
    self->_isLimitedService = *((unsigned char *)v5 + 185);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
  if (*((void *)v5 + 21)) {
    -[CLPNRCellTowerLocation setServiceProviderName:](self, "setServiceProviderName:");
  }
  int v18 = *((_DWORD *)v5 + 47);
  if ((v18 & 0x40000) != 0)
  {
    self->_scs = *((_DWORD *)v5 + 40);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v18 = *((_DWORD *)v5 + 47);
    if ((v18 & 0x100) == 0)
    {
LABEL_58:
      if ((v18 & 0x40) == 0) {
        goto LABEL_59;
      }
      goto LABEL_75;
    }
  }
  else if ((v18 & 0x100) == 0)
  {
    goto LABEL_58;
  }
  self->_gscn = *((_DWORD *)v5 + 15);
  *(_DWORD *)&self->_has |= 0x100u;
  int v18 = *((_DWORD *)v5 + 47);
  if ((v18 & 0x40) == 0)
  {
LABEL_59:
    if ((v18 & 0x1000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_downlinkBandwidth = *((_DWORD *)v5 + 13);
  *(_DWORD *)&self->_has |= 0x40u;
  int v18 = *((_DWORD *)v5 + 47);
  if ((v18 & 0x1000000) == 0)
  {
LABEL_60:
    if ((v18 & 0x200) == 0) {
      goto LABEL_61;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_isStalled = *((unsigned char *)v5 + 186);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v18 = *((_DWORD *)v5 + 47);
  if ((v18 & 0x200) == 0)
  {
LABEL_61:
    if ((v18 & 0x8000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_latency = *((_DWORD *)v5 + 16);
  *(_DWORD *)&self->_has |= 0x200u;
  int v18 = *((_DWORD *)v5 + 47);
  if ((v18 & 0x8000) == 0)
  {
LABEL_62:
    if ((v18 & 0x400) == 0) {
      goto LABEL_63;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_pmax = *((_DWORD *)v5 + 37);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v18 = *((_DWORD *)v5 + 47);
  if ((v18 & 0x400) == 0)
  {
LABEL_63:
    if ((v18 & 0x20) == 0) {
      goto LABEL_64;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_maxThroughput = *((_DWORD *)v5 + 20);
  *(_DWORD *)&self->_has |= 0x400u;
  int v18 = *((_DWORD *)v5 + 47);
  if ((v18 & 0x20) == 0)
  {
LABEL_64:
    if ((v18 & 0x200000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_bwpSupport = *((_DWORD *)v5 + 12);
  *(_DWORD *)&self->_has |= 0x20u;
  int v18 = *((_DWORD *)v5 + 47);
  if ((v18 & 0x200000) == 0)
  {
LABEL_65:
    if ((v18 & 0x2000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_timingAdvance = *((_DWORD *)v5 + 45);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v18 = *((_DWORD *)v5 + 47);
  if ((v18 & 0x2000000) == 0)
  {
LABEL_66:
    if ((v18 & 0x400000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
LABEL_82:
  self->_uniqueCount = *((unsigned char *)v5 + 187);
  *(_DWORD *)&self->_has |= 0x2000000u;
  if ((*((_DWORD *)v5 + 47) & 0x400000) != 0)
  {
LABEL_67:
    self->_hasWifiFallback = *((unsigned char *)v5 + 184);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
LABEL_68:
  if (*((void *)v5 + 15)) {
    -[CLPNRCellTowerLocation setNpnNwIdEf:](self, "setNpnNwIdEf:");
  }
  if (*((void *)v5 + 14)) {
    -[CLPNRCellTowerLocation setNpnCsgIdEf:](self, "setNpnCsgIdEf:");
  }
}

- (int)mcc
{
  return self->_mcc;
}

- (int)mnc
{
  return self->_mnc;
}

- (int)tac
{
  return self->_tac;
}

- (int64_t)ci
{
  return self->_ci;
}

- (int)nrarfcn
{
  return self->_nrarfcn;
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

- (unsigned)scs
{
  return self->_scs;
}

- (unsigned)gscn
{
  return self->_gscn;
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

- (unsigned)bwpSupport
{
  return self->_bwpSupport;
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

@end