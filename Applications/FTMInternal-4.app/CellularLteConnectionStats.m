@interface CellularLteConnectionStats
+ (Class)nwUeCapStatType;
- (BOOL)hasCause;
- (BOOL)hasConnDuration;
- (BOOL)hasDuration;
- (BOOL)hasLteBandCombo;
- (BOOL)hasLteTotalDlMimoLayers;
- (BOOL)hasLteTotalNumCcs;
- (BOOL)hasMaxDlMod;
- (BOOL)hasMaxNwMimoLyr;
- (BOOL)hasMaxRxAnt;
- (BOOL)hasMaxSchdMimoLyr;
- (BOOL)hasMaxUeRank;
- (BOOL)hasMaxUlMod;
- (BOOL)hasMrdcLteBandCombo;
- (BOOL)hasMrdcLteTotalDlMimoLayers;
- (BOOL)hasMrdcLteTotalNumCcs;
- (BOOL)hasMrdcNrBandCombo;
- (BOOL)hasMrdcNrTotalDlMimoLayers;
- (BOOL)hasMrdcNrTotalNumCcs;
- (BOOL)hasMrdcTotalDlMimoLayers;
- (BOOL)hasMrdcTotalNumCcs;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BandCombo)lteBandCombo;
- (BandCombo)mrdcLteBandCombo;
- (BandCombo)mrdcNrBandCombo;
- (NSData)plmn;
- (NSMutableArray)nwUeCapStats;
- (id)causeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)maxDlModAsString:(int)a3;
- (id)maxUlModAsString:(int)a3;
- (id)nwUeCapStatAtIndex:(unint64_t)a3;
- (int)StringAsCause:(id)a3;
- (int)StringAsMaxDlMod:(id)a3;
- (int)StringAsMaxUlMod:(id)a3;
- (int)cause;
- (int)maxDlMod;
- (int)maxUlMod;
- (unint64_t)hash;
- (unint64_t)nwUeCapStatsCount;
- (unint64_t)timestamp;
- (unsigned)connDuration;
- (unsigned)duration;
- (unsigned)lteTotalDlMimoLayers;
- (unsigned)lteTotalNumCcs;
- (unsigned)maxNwMimoLyr;
- (unsigned)maxRxAnt;
- (unsigned)maxSchdMimoLyr;
- (unsigned)maxUeRank;
- (unsigned)mrdcLteTotalDlMimoLayers;
- (unsigned)mrdcLteTotalNumCcs;
- (unsigned)mrdcNrTotalDlMimoLayers;
- (unsigned)mrdcNrTotalNumCcs;
- (unsigned)mrdcTotalDlMimoLayers;
- (unsigned)mrdcTotalNumCcs;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)subsId;
- (void)addNwUeCapStat:(id)a3;
- (void)clearNwUeCapStats;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCause:(int)a3;
- (void)setConnDuration:(unsigned int)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasCause:(BOOL)a3;
- (void)setHasConnDuration:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasLteTotalDlMimoLayers:(BOOL)a3;
- (void)setHasLteTotalNumCcs:(BOOL)a3;
- (void)setHasMaxDlMod:(BOOL)a3;
- (void)setHasMaxNwMimoLyr:(BOOL)a3;
- (void)setHasMaxRxAnt:(BOOL)a3;
- (void)setHasMaxSchdMimoLyr:(BOOL)a3;
- (void)setHasMaxUeRank:(BOOL)a3;
- (void)setHasMaxUlMod:(BOOL)a3;
- (void)setHasMrdcLteTotalDlMimoLayers:(BOOL)a3;
- (void)setHasMrdcLteTotalNumCcs:(BOOL)a3;
- (void)setHasMrdcNrTotalDlMimoLayers:(BOOL)a3;
- (void)setHasMrdcNrTotalNumCcs:(BOOL)a3;
- (void)setHasMrdcTotalDlMimoLayers:(BOOL)a3;
- (void)setHasMrdcTotalNumCcs:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLteBandCombo:(id)a3;
- (void)setLteTotalDlMimoLayers:(unsigned int)a3;
- (void)setLteTotalNumCcs:(unsigned int)a3;
- (void)setMaxDlMod:(int)a3;
- (void)setMaxNwMimoLyr:(unsigned int)a3;
- (void)setMaxRxAnt:(unsigned int)a3;
- (void)setMaxSchdMimoLyr:(unsigned int)a3;
- (void)setMaxUeRank:(unsigned int)a3;
- (void)setMaxUlMod:(int)a3;
- (void)setMrdcLteBandCombo:(id)a3;
- (void)setMrdcLteTotalDlMimoLayers:(unsigned int)a3;
- (void)setMrdcLteTotalNumCcs:(unsigned int)a3;
- (void)setMrdcNrBandCombo:(id)a3;
- (void)setMrdcNrTotalDlMimoLayers:(unsigned int)a3;
- (void)setMrdcNrTotalNumCcs:(unsigned int)a3;
- (void)setMrdcTotalDlMimoLayers:(unsigned int)a3;
- (void)setMrdcTotalNumCcs:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setNwUeCapStats:(id)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLteConnectionStats

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)maxUlMod
{
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    return self->_maxUlMod;
  }
  else {
    return 0;
  }
}

- (void)setMaxUlMod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_maxUlMod = a3;
}

- (void)setHasMaxUlMod:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMaxUlMod
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)maxUlModAsString:(int)a3
{
  if (a3 >= 7)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_1002877B8 + a3);
  }

  return v3;
}

- (int)StringAsMaxUlMod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MODULATION_BPSK"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MODULATION_QPSK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MODULATION_16QAM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MODULATION_64QAM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MODULATION_256QAM"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MODULATION_1024QAM"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MODULATION_UNKOWN"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)maxDlMod
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_maxDlMod;
  }
  else {
    return 0;
  }
}

- (void)setMaxDlMod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_maxDlMod = a3;
}

- (void)setHasMaxDlMod:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMaxDlMod
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)maxDlModAsString:(int)a3
{
  if (a3 >= 7)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_1002877B8 + a3);
  }

  return v3;
}

- (int)StringAsMaxDlMod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MODULATION_BPSK"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MODULATION_QPSK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MODULATION_16QAM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MODULATION_64QAM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MODULATION_256QAM"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MODULATION_1024QAM"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MODULATION_UNKOWN"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setMaxNwMimoLyr:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_maxNwMimoLyr = a3;
}

- (void)setHasMaxNwMimoLyr:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasMaxNwMimoLyr
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setMaxUeRank:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_maxUeRank = a3;
}

- (void)setHasMaxUeRank:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMaxUeRank
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setMaxRxAnt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_maxRxAnt = a3;
}

- (void)setHasMaxRxAnt:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMaxRxAnt
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setMaxSchdMimoLyr:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_maxSchdMimoLyr = a3;
}

- (void)setHasMaxSchdMimoLyr:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMaxSchdMimoLyr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setLteTotalNumCcs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_lteTotalNumCcs = a3;
}

- (void)setHasLteTotalNumCcs:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasLteTotalNumCcs
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setLteTotalDlMimoLayers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_lteTotalDlMimoLayers = a3;
}

- (void)setHasLteTotalDlMimoLayers:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasLteTotalDlMimoLayers
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasLteBandCombo
{
  return self->_lteBandCombo != 0;
}

- (void)setMrdcTotalNumCcs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_mrdcTotalNumCcs = a3;
}

- (void)setHasMrdcTotalNumCcs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasMrdcTotalNumCcs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMrdcTotalDlMimoLayers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_mrdcTotalDlMimoLayers = a3;
}

- (void)setHasMrdcTotalDlMimoLayers:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasMrdcTotalDlMimoLayers
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setMrdcLteTotalNumCcs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_mrdcLteTotalNumCcs = a3;
}

- (void)setHasMrdcLteTotalNumCcs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasMrdcLteTotalNumCcs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMrdcLteTotalDlMimoLayers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_mrdcLteTotalDlMimoLayers = a3;
}

- (void)setHasMrdcLteTotalDlMimoLayers:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMrdcLteTotalDlMimoLayers
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasMrdcLteBandCombo
{
  return self->_mrdcLteBandCombo != 0;
}

- (void)setMrdcNrTotalNumCcs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_mrdcNrTotalNumCcs = a3;
}

- (void)setHasMrdcNrTotalNumCcs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasMrdcNrTotalNumCcs
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setMrdcNrTotalDlMimoLayers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_mrdcNrTotalDlMimoLayers = a3;
}

- (void)setHasMrdcNrTotalDlMimoLayers:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasMrdcNrTotalDlMimoLayers
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasMrdcNrBandCombo
{
  return self->_mrdcNrBandCombo != 0;
}

- (void)clearNwUeCapStats
{
}

- (void)addNwUeCapStat:(id)a3
{
  id v4 = a3;
  nwUeCapStats = self->_nwUeCapStats;
  id v8 = v4;
  if (!nwUeCapStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_nwUeCapStats;
    self->_nwUeCapStats = v6;

    id v4 = v8;
    nwUeCapStats = self->_nwUeCapStats;
  }
  [(NSMutableArray *)nwUeCapStats addObject:v4];
}

- (unint64_t)nwUeCapStatsCount
{
  return (unint64_t)[(NSMutableArray *)self->_nwUeCapStats count];
}

- (id)nwUeCapStatAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_nwUeCapStats objectAtIndex:a3];
}

+ (Class)nwUeCapStatType
{
  return (Class)objc_opt_class();
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasNumSubs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPsPref
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (int)cause
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_cause;
  }
  else {
    return 0;
  }
}

- (void)setCause:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_cause = a3;
}

- (void)setHasCause:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCause
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)causeAsString:(int)a3
{
  if (a3 >= 6)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_1002877F0 + a3);
  }

  return v3;
}

- (int)StringAsCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CONN_INFO_CAUSE_INVALID"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONN_INFO_CAUSE_RELEASE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONN_INFO_CAUSE_HO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONN_INFO_CAUSE_OTHER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CONN_INFO_CAUSE_MAX"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CONN_INFO_CAUSE_MAX_STATS"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setConnDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_connDuration = a3;
}

- (void)setHasConnDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($3007357E5C0AFF4C2A6FF1D18BB3CA6A)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasConnDuration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLteConnectionStats;
  int v3 = [(CellularLteConnectionStats *)&v7 description];
  int v4 = [(CellularLteConnectionStats *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if (*(unsigned char *)&has)
  {
    v30 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v30 forKey:@"timestamp"];

    $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_48;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  v31 = +[NSNumber numberWithUnsignedInt:self->_duration];
  [v3 setObject:v31 forKey:@"duration"];

  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_60;
  }
LABEL_48:
  uint64_t maxUlMod = self->_maxUlMod;
  if (maxUlMod >= 7)
  {
    v33 = +[NSString stringWithFormat:@"(unknown: %i)", self->_maxUlMod];
  }
  else
  {
    v33 = *(&off_1002877B8 + maxUlMod);
  }
  [v3 setObject:v33 forKey:@"max_ul_mod"];

  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_67;
  }
LABEL_60:
  uint64_t maxDlMod = self->_maxDlMod;
  if (maxDlMod >= 7)
  {
    v42 = +[NSString stringWithFormat:@"(unknown: %i)", self->_maxDlMod];
  }
  else
  {
    v42 = *(&off_1002877B8 + maxDlMod);
  }
  [v3 setObject:v42 forKey:@"max_dl_mod"];

  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_68;
  }
LABEL_67:
  v43 = +[NSNumber numberWithUnsignedInt:self->_maxNwMimoLyr];
  [v3 setObject:v43 forKey:@"max_nw_mimo_lyr"];

  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_69;
  }
LABEL_68:
  v44 = +[NSNumber numberWithUnsignedInt:self->_maxUeRank];
  [v3 setObject:v44 forKey:@"max_ue_rank"];

  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_70;
  }
LABEL_69:
  v45 = +[NSNumber numberWithUnsignedInt:self->_maxRxAnt];
  [v3 setObject:v45 forKey:@"max_rx_ant"];

  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_71;
  }
LABEL_70:
  v46 = +[NSNumber numberWithUnsignedInt:self->_maxSchdMimoLyr];
  [v3 setObject:v46 forKey:@"max_schd_mimo_lyr"];

  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_71:
  v47 = +[NSNumber numberWithUnsignedInt:self->_lteTotalNumCcs];
  [v3 setObject:v47 forKey:@"lte_total_num_ccs"];

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    v5 = +[NSNumber numberWithUnsignedInt:self->_lteTotalDlMimoLayers];
    [v3 setObject:v5 forKey:@"lte_total_dl_mimo_layers"];
  }
LABEL_12:
  lteBandCombo = self->_lteBandCombo;
  if (lteBandCombo)
  {
    objc_super v7 = [lteBandCombo dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"lte_band_combo"];
  }
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) != 0)
  {
    v34 = +[NSNumber numberWithUnsignedInt:self->_mrdcTotalNumCcs];
    [v3 setObject:v34 forKey:@"mrdc_total_num_ccs"];

    $3007357E5C0AFF4C2A6FF1D18BB3CA6A v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x10000) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v8 & 0x2000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_52;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
    goto LABEL_16;
  }
  v35 = +[NSNumber numberWithUnsignedInt:self->_mrdcTotalDlMimoLayers];
  [v3 setObject:v35 forKey:@"mrdc_total_dl_mimo_layers"];

  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v8 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_52:
  v36 = +[NSNumber numberWithUnsignedInt:self->_mrdcLteTotalNumCcs];
  [v3 setObject:v36 forKey:@"mrdc_lte_total_num_ccs"];

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_18:
    v9 = +[NSNumber numberWithUnsignedInt:self->_mrdcLteTotalDlMimoLayers];
    [v3 setObject:v9 forKey:@"mrdc_lte_total_dl_mimo_layers"];
  }
LABEL_19:
  mrdcLteBandCombo = self->_mrdcLteBandCombo;
  if (mrdcLteBandCombo)
  {
    v11 = [mrdcLteBandCombo dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"mrdc_lte_band_combo"];
  }
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x8000) != 0)
  {
    v13 = +[NSNumber numberWithUnsignedInt:self->_mrdcNrTotalNumCcs];
    [v3 setObject:v13 forKey:@"mrdc_nr_total_num_ccs"];

    $3007357E5C0AFF4C2A6FF1D18BB3CA6A v12 = self->_has;
  }
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
    v14 = +[NSNumber numberWithUnsignedInt:self->_mrdcNrTotalDlMimoLayers];
    [v3 setObject:v14 forKey:@"mrdc_nr_total_dl_mimo_layers"];
  }
  mrdcNrBandCombo = self->_mrdcNrBandCombo;
  if (mrdcNrBandCombo)
  {
    v16 = [mrdcNrBandCombo dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"mrdc_nr_band_combo"];
  }
  if ([(NSMutableArray *)self->_nwUeCapStats count])
  {
    id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_nwUeCapStats, "count")];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v18 = self->_nwUeCapStats;
    id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v49;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v49 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [*(id *)(*((void *)&v48 + 1) + 8 * i) dictionaryRepresentation];
          [v17 addObject:v23];
        }
        id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKey:@"nw_ue_cap_stat"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    v24 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v24 forKey:@"num_subs"];
  }
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x100000) != 0)
  {
    v37 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v37 forKey:@"subs_id"];

    $3007357E5C0AFF4C2A6FF1D18BB3CA6A v26 = self->_has;
    if ((*(_DWORD *)&v26 & 0x80000) == 0)
    {
LABEL_42:
      if ((*(unsigned char *)&v26 & 2) == 0) {
        goto LABEL_43;
      }
LABEL_56:
      uint64_t cause = self->_cause;
      if (cause >= 6)
      {
        v40 = +[NSString stringWithFormat:@"(unknown: %i)", self->_cause];
      }
      else
      {
        v40 = *(&off_1002877F0 + cause);
      }
      [v3 setObject:v40 forKey:@"cause"];

      if ((*(_DWORD *)&self->_has & 4) != 0) {
        goto LABEL_44;
      }
      goto LABEL_45;
    }
  }
  else if ((*(_DWORD *)&v26 & 0x80000) == 0)
  {
    goto LABEL_42;
  }
  v38 = +[NSNumber numberWithUnsignedInt:self->_psPref];
  [v3 setObject:v38 forKey:@"ps_pref"];

  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v26 = self->_has;
  if ((*(unsigned char *)&v26 & 2) != 0) {
    goto LABEL_56;
  }
LABEL_43:
  if ((*(unsigned char *)&v26 & 4) != 0)
  {
LABEL_44:
    v27 = +[NSNumber numberWithUnsignedInt:self->_connDuration];
    [v3 setObject:v27 forKey:@"conn_duration"];
  }
LABEL_45:
  id v28 = v3;

  return v28;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B30FC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_46;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x10) != 0) {
LABEL_11:
  }
    PBDataWriterWriteUint32Field();
LABEL_12:
  if (self->_lteBandCombo) {
    PBDataWriterWriteSubmessage();
  }
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v6 & 0x2000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint32Field();
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_18:
  }
    PBDataWriterWriteUint32Field();
LABEL_19:
  if (self->_mrdcLteBandCombo) {
    PBDataWriterWriteSubmessage();
  }
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A v7 = self->_has;
  }
  if ((*(_WORD *)&v7 & 0x4000) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_mrdcNrBandCombo) {
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v8 = self->_nwUeCapStats;
  v9 = (char *)[(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      $3007357E5C0AFF4C2A6FF1D18BB3CA6A v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = (char *)[(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x80000) == 0)
    {
LABEL_40:
      if ((*(unsigned char *)&v13 & 2) == 0) {
        goto LABEL_41;
      }
LABEL_60:
      PBDataWriterWriteInt32Field();
      if ((*(_DWORD *)&self->_has & 4) == 0) {
        goto LABEL_43;
      }
      goto LABEL_42;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x80000) == 0)
  {
    goto LABEL_40;
  }
  PBDataWriterWriteUint32Field();
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v13 = self->_has;
  if ((*(unsigned char *)&v13 & 2) != 0) {
    goto LABEL_60;
  }
LABEL_41:
  if ((*(unsigned char *)&v13 & 4) != 0) {
LABEL_42:
  }
    PBDataWriterWriteUint32Field();
LABEL_43:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 36) |= 1u;
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_45;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_duration;
  *((_DWORD *)v4 + 36) |= 8u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 17) = self->_maxUlMod;
  *((_DWORD *)v4 + 36) |= 0x800u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 12) = self->_maxDlMod;
  *((_DWORD *)v4 + 36) |= 0x40u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 13) = self->_maxNwMimoLyr;
  *((_DWORD *)v4 + 36) |= 0x80u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 16) = self->_maxUeRank;
  *((_DWORD *)v4 + 36) |= 0x400u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 14) = self->_maxRxAnt;
  *((_DWORD *)v4 + 36) |= 0x100u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 15) = self->_maxSchdMimoLyr;
  *((_DWORD *)v4 + 36) |= 0x200u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_51:
  *((_DWORD *)v4 + 11) = self->_lteTotalNumCcs;
  *((_DWORD *)v4 + 36) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 10) = self->_lteTotalDlMimoLayers;
    *((_DWORD *)v4 + 36) |= 0x10u;
  }
LABEL_12:
  long long v14 = v4;
  if (self->_lteBandCombo)
  {
    [v4 setLteBandCombo:];
    id v4 = v14;
  }
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) != 0)
  {
    *((_DWORD *)v4 + 27) = self->_mrdcTotalNumCcs;
    *((_DWORD *)v4 + 36) |= 0x20000u;
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v6 & 0x2000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v4 + 26) = self->_mrdcTotalDlMimoLayers;
  *((_DWORD *)v4 + 36) |= 0x10000u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_55:
  *((_DWORD *)v4 + 21) = self->_mrdcLteTotalNumCcs;
  *((_DWORD *)v4 + 36) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 20) = self->_mrdcLteTotalDlMimoLayers;
    *((_DWORD *)v4 + 36) |= 0x1000u;
  }
LABEL_19:
  if (self->_mrdcLteBandCombo)
  {
    [v14 setMrdcLteBandCombo:];
    id v4 = v14;
  }
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) != 0)
  {
    *((_DWORD *)v4 + 25) = self->_mrdcNrTotalNumCcs;
    *((_DWORD *)v4 + 36) |= 0x8000u;
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A v7 = self->_has;
  }
  if ((*(_WORD *)&v7 & 0x4000) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_mrdcNrTotalDlMimoLayers;
    *((_DWORD *)v4 + 36) |= 0x4000u;
  }
  if (self->_mrdcNrBandCombo) {
    [v14 setMrdcNrBandCombo:];
  }
  if ([(CellularLteConnectionStats *)self nwUeCapStatsCount])
  {
    [v14 clearNwUeCapStats];
    unint64_t v8 = [(CellularLteConnectionStats *)self nwUeCapStatsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
      {
        uint64_t v11 = [(CellularLteConnectionStats *)self nwUeCapStatAtIndex:i];
        [v14 addNwUeCapStat:v11];
      }
    }
  }
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v12 = v14;
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    v14[28] = self->_numSubs;
    v14[36] |= 0x40000u;
  }
  if (self->_plmn)
  {
    [v14 setPlmn];
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A v12 = v14;
  }
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) != 0)
  {
    v12[35] = self->_subsId;
    v12[36] |= 0x100000u;
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x80000) == 0)
    {
LABEL_37:
      if ((*(unsigned char *)&v13 & 2) == 0) {
        goto LABEL_38;
      }
      goto LABEL_59;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x80000) == 0)
  {
    goto LABEL_37;
  }
  v12[34] = self->_psPref;
  v12[36] |= 0x80000u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v13 = self->_has;
  if ((*(unsigned char *)&v13 & 2) == 0)
  {
LABEL_38:
    if ((*(unsigned char *)&v13 & 4) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_59:
  v12[4] = self->_cause;
  v12[36] |= 2u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_39:
    v12[5] = self->_connDuration;
    v12[36] |= 4u;
  }
LABEL_40:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v6 = v5;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if (*(unsigned char *)&has)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 36) |= 1u;
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 6) = self->_duration;
  *((_DWORD *)v5 + 36) |= 8u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v5 + 17) = self->_maxUlMod;
  *((_DWORD *)v5 + 36) |= 0x800u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v5 + 12) = self->_maxDlMod;
  *((_DWORD *)v5 + 36) |= 0x40u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v5 + 13) = self->_maxNwMimoLyr;
  *((_DWORD *)v5 + 36) |= 0x80u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v5 + 16) = self->_maxUeRank;
  *((_DWORD *)v5 + 36) |= 0x400u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v5 + 14) = self->_maxRxAnt;
  *((_DWORD *)v5 + 36) |= 0x100u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v5 + 15) = self->_maxSchdMimoLyr;
  *((_DWORD *)v5 + 36) |= 0x200u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_44:
  *((_DWORD *)v5 + 11) = self->_lteTotalNumCcs;
  *((_DWORD *)v5 + 36) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    *((_DWORD *)v5 + 10) = self->_lteTotalDlMimoLayers;
    *((_DWORD *)v5 + 36) |= 0x10u;
  }
LABEL_12:
  id v8 = [self->_lteBandCombo copyWithZone:a3];
  unint64_t v9 = (void *)v6[4];
  v6[4] = v8;

  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    *((_DWORD *)v6 + 27) = self->_mrdcTotalNumCcs;
    *((_DWORD *)v6 + 36) |= 0x20000u;
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x10000) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&v10 & 0x2000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_48;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x10000) == 0)
  {
    goto LABEL_14;
  }
  *((_DWORD *)v6 + 26) = self->_mrdcTotalDlMimoLayers;
  *((_DWORD *)v6 + 36) |= 0x10000u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v10 & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_48:
  *((_DWORD *)v6 + 21) = self->_mrdcLteTotalNumCcs;
  *((_DWORD *)v6 + 36) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_16:
    *((_DWORD *)v6 + 20) = self->_mrdcLteTotalDlMimoLayers;
    *((_DWORD *)v6 + 36) |= 0x1000u;
  }
LABEL_17:
  id v11 = [self->_mrdcLteBandCombo copyWithZone:a3];
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v12 = (void *)v6[9];
  v6[9] = v11;

  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) != 0)
  {
    *((_DWORD *)v6 + 25) = self->_mrdcNrTotalNumCcs;
    *((_DWORD *)v6 + 36) |= 0x8000u;
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A v13 = self->_has;
  }
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
    *((_DWORD *)v6 + 24) = self->_mrdcNrTotalDlMimoLayers;
    *((_DWORD *)v6 + 36) |= 0x4000u;
  }
  id v14 = [self->_mrdcNrBandCombo copyWithZone:a3];
  long long v15 = (void *)v6[11];
  v6[11] = v14;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v16 = self->_nwUeCapStats;
  id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)v20) copyWithZone:a3 v26];
        [v6 addNwUeCapStat:v21];

        id v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v18);
  }

  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    *((_DWORD *)v6 + 28) = self->_numSubs;
    *((_DWORD *)v6 + 36) |= 0x40000u;
  }
  id v22 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (void)v26);
  v23 = (void *)v6[16];
  v6[16] = v22;

  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x100000) != 0)
  {
    *((_DWORD *)v6 + 35) = self->_subsId;
    *((_DWORD *)v6 + 36) |= 0x100000u;
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A v24 = self->_has;
    if ((*(_DWORD *)&v24 & 0x80000) == 0)
    {
LABEL_32:
      if ((*(unsigned char *)&v24 & 2) == 0) {
        goto LABEL_33;
      }
LABEL_52:
      *((_DWORD *)v6 + 4) = self->_cause;
      *((_DWORD *)v6 + 36) |= 2u;
      if ((*(_DWORD *)&self->_has & 4) == 0) {
        return v6;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_DWORD *)&v24 & 0x80000) == 0)
  {
    goto LABEL_32;
  }
  *((_DWORD *)v6 + 34) = self->_psPref;
  *((_DWORD *)v6 + 36) |= 0x80000u;
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v24 = self->_has;
  if ((*(unsigned char *)&v24 & 2) != 0) {
    goto LABEL_52;
  }
LABEL_33:
  if ((*(unsigned char *)&v24 & 4) != 0)
  {
LABEL_34:
    *((_DWORD *)v6 + 5) = self->_connDuration;
    *((_DWORD *)v6 + 36) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_120;
  }
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  int v6 = *((_DWORD *)v4 + 36);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_120;
    }
  }
  else if (v6)
  {
    goto LABEL_120;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_duration != *((_DWORD *)v4 + 6)) {
      goto LABEL_120;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_maxUlMod != *((_DWORD *)v4 + 17)) {
      goto LABEL_120;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_120;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_maxDlMod != *((_DWORD *)v4 + 12)) {
      goto LABEL_120;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_120;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_maxNwMimoLyr != *((_DWORD *)v4 + 13)) {
      goto LABEL_120;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_maxUeRank != *((_DWORD *)v4 + 16)) {
      goto LABEL_120;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_maxRxAnt != *((_DWORD *)v4 + 14)) {
      goto LABEL_120;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_maxSchdMimoLyr != *((_DWORD *)v4 + 15)) {
      goto LABEL_120;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_120;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_lteTotalNumCcs != *((_DWORD *)v4 + 11)) {
      goto LABEL_120;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_120;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_lteTotalDlMimoLayers != *((_DWORD *)v4 + 10)) {
      goto LABEL_120;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_120;
  }
  lteBandCombo = self->_lteBandCombo;
  if ((unint64_t)lteBandCombo | *((void *)v4 + 4))
  {
    if (!-[BandCombo isEqual:](lteBandCombo, "isEqual:")) {
      goto LABEL_120;
    }
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  }
  int v8 = *((_DWORD *)v4 + 36);
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_mrdcTotalNumCcs != *((_DWORD *)v4 + 27)) {
      goto LABEL_120;
    }
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_mrdcTotalDlMimoLayers != *((_DWORD *)v4 + 26)) {
      goto LABEL_120;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v8 & 0x2000) == 0 || self->_mrdcLteTotalNumCcs != *((_DWORD *)v4 + 21)) {
      goto LABEL_120;
    }
  }
  else if ((v8 & 0x2000) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v8 & 0x1000) == 0 || self->_mrdcLteTotalDlMimoLayers != *((_DWORD *)v4 + 20)) {
      goto LABEL_120;
    }
  }
  else if ((v8 & 0x1000) != 0)
  {
    goto LABEL_120;
  }
  mrdcLteBandCombo = self->_mrdcLteBandCombo;
  if ((unint64_t)mrdcLteBandCombo | *((void *)v4 + 9))
  {
    if (!-[BandCombo isEqual:](mrdcLteBandCombo, "isEqual:")) {
      goto LABEL_120;
    }
    $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  }
  int v10 = *((_DWORD *)v4 + 36);
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v10 & 0x8000) == 0 || self->_mrdcNrTotalNumCcs != *((_DWORD *)v4 + 25)) {
      goto LABEL_120;
    }
  }
  else if ((v10 & 0x8000) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_mrdcNrTotalDlMimoLayers != *((_DWORD *)v4 + 24)) {
      goto LABEL_120;
    }
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_120;
  }
  mrdcNrBandCombo = self->_mrdcNrBandCombo;
  if ((unint64_t)mrdcNrBandCombo | *((void *)v4 + 11) && !-[BandCombo isEqual:](mrdcNrBandCombo, "isEqual:")) {
    goto LABEL_120;
  }
  nwUeCapStats = self->_nwUeCapStats;
  if ((unint64_t)nwUeCapStats | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](nwUeCapStats, "isEqual:")) {
      goto LABEL_120;
    }
  }
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v13 = self->_has;
  int v14 = *((_DWORD *)v4 + 36);
  if ((*(_DWORD *)&v13 & 0x40000) != 0)
  {
    if ((v14 & 0x40000) == 0 || self->_numSubs != *((_DWORD *)v4 + 28)) {
      goto LABEL_120;
    }
  }
  else if ((v14 & 0x40000) != 0)
  {
    goto LABEL_120;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 16))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      $3007357E5C0AFF4C2A6FF1D18BB3CA6A v13 = self->_has;
      goto LABEL_100;
    }
LABEL_120:
    BOOL v17 = 0;
    goto LABEL_121;
  }
LABEL_100:
  int v16 = *((_DWORD *)v4 + 36);
  if ((*(_DWORD *)&v13 & 0x100000) != 0)
  {
    if ((v16 & 0x100000) == 0 || self->_subsId != *((_DWORD *)v4 + 35)) {
      goto LABEL_120;
    }
  }
  else if ((v16 & 0x100000) != 0)
  {
    goto LABEL_120;
  }
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
    if ((v16 & 0x80000) == 0 || self->_psPref != *((_DWORD *)v4 + 34)) {
      goto LABEL_120;
    }
  }
  else if ((v16 & 0x80000) != 0)
  {
    goto LABEL_120;
  }
  if ((*(unsigned char *)&v13 & 2) != 0)
  {
    if ((v16 & 2) == 0 || self->_cause != *((_DWORD *)v4 + 4)) {
      goto LABEL_120;
    }
  }
  else if ((v16 & 2) != 0)
  {
    goto LABEL_120;
  }
  if ((*(unsigned char *)&v13 & 4) != 0)
  {
    if ((v16 & 4) == 0 || self->_connDuration != *((_DWORD *)v4 + 5)) {
      goto LABEL_120;
    }
    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = (*((_DWORD *)v4 + 36) & 4) == 0;
  }
LABEL_121:

  return v17;
}

- (unint64_t)hash
{
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v34 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&has & 8) != 0)
    {
LABEL_3:
      uint64_t v33 = 2654435761 * self->_duration;
      if ((*(_WORD *)&has & 0x800) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v34 = 0;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v33 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_4:
    uint64_t v32 = 2654435761 * self->_maxUlMod;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v32 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v31 = 2654435761 * self->_maxDlMod;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v31 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v30 = 2654435761 * self->_maxNwMimoLyr;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v30 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_7:
    uint64_t v29 = 2654435761 * self->_maxUeRank;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v29 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_8:
    uint64_t v28 = 2654435761 * self->_maxRxAnt;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v28 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_9:
    uint64_t v27 = 2654435761 * self->_maxSchdMimoLyr;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v26 = 0;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v27 = 0;
  if ((*(unsigned char *)&has & 0x20) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v26 = 2654435761 * self->_lteTotalNumCcs;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_11:
    uint64_t v25 = 2654435761 * self->_lteTotalDlMimoLayers;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v25 = 0;
LABEL_22:
  unint64_t v24 = [self->_lteBandCombo hash];
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
    uint64_t v23 = 2654435761 * self->_mrdcTotalNumCcs;
    if ((*(_DWORD *)&v4 & 0x10000) != 0)
    {
LABEL_24:
      uint64_t v22 = 2654435761 * self->_mrdcTotalDlMimoLayers;
      if ((*(_WORD *)&v4 & 0x2000) != 0) {
        goto LABEL_25;
      }
LABEL_29:
      uint64_t v20 = 0;
      if ((*(_WORD *)&v4 & 0x1000) != 0) {
        goto LABEL_26;
      }
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v23 = 0;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_24;
    }
  }
  uint64_t v22 = 0;
  if ((*(_WORD *)&v4 & 0x2000) == 0) {
    goto LABEL_29;
  }
LABEL_25:
  uint64_t v20 = 2654435761 * self->_mrdcLteTotalNumCcs;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_26:
    uint64_t v5 = 2654435761 * self->_mrdcLteTotalDlMimoLayers;
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v5 = 0;
LABEL_31:
  unint64_t v6 = [self->_mrdcLteBandCombo hash];
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) != 0)
  {
    uint64_t v8 = 2654435761 * self->_mrdcNrTotalNumCcs;
    if ((*(_WORD *)&v7 & 0x4000) != 0) {
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(_WORD *)&v7 & 0x4000) != 0)
    {
LABEL_33:
      uint64_t v9 = 2654435761 * self->_mrdcNrTotalDlMimoLayers;
      goto LABEL_36;
    }
  }
  uint64_t v9 = 0;
LABEL_36:
  unint64_t v10 = [self->_mrdcNrBandCombo hash];
  unint64_t v11 = (unint64_t)[(NSMutableArray *)self->_nwUeCapStats hash];
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    uint64_t v12 = 2654435761 * self->_numSubs;
  }
  else {
    uint64_t v12 = 0;
  }
  unint64_t v13 = (unint64_t)[(NSData *)self->_plmn hash];
  $3007357E5C0AFF4C2A6FF1D18BB3CA6A v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x100000) != 0)
  {
    uint64_t v15 = 2654435761 * self->_subsId;
    if ((*(_DWORD *)&v14 & 0x80000) != 0)
    {
LABEL_41:
      uint64_t v16 = 2654435761 * self->_psPref;
      if ((*(unsigned char *)&v14 & 2) != 0) {
        goto LABEL_42;
      }
LABEL_46:
      uint64_t v17 = 0;
      if ((*(unsigned char *)&v14 & 4) != 0) {
        goto LABEL_43;
      }
LABEL_47:
      uint64_t v18 = 0;
      return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v23 ^ v22 ^ v21 ^ v5 ^ v24 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((*(_DWORD *)&v14 & 0x80000) != 0) {
      goto LABEL_41;
    }
  }
  uint64_t v16 = 0;
  if ((*(unsigned char *)&v14 & 2) == 0) {
    goto LABEL_46;
  }
LABEL_42:
  uint64_t v17 = 2654435761 * self->_cause;
  if ((*(unsigned char *)&v14 & 4) == 0) {
    goto LABEL_47;
  }
LABEL_43:
  uint64_t v18 = 2654435761 * self->_connDuration;
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v23 ^ v22 ^ v21 ^ v5 ^ v24 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int v6 = *((_DWORD *)v4 + 36);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v6 = *((_DWORD *)v4 + 36);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 0x800) == 0)
  {
LABEL_4:
    if ((v6 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_uint64_t maxUlMod = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x800u;
  int v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 0x40) == 0)
  {
LABEL_5:
    if ((v6 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_uint64_t maxDlMod = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x40u;
  int v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 0x80) == 0)
  {
LABEL_6:
    if ((v6 & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_maxNwMimoLyr = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x80u;
  int v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 0x400) == 0)
  {
LABEL_7:
    if ((v6 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_maxUeRank = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x400u;
  int v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 0x100) == 0)
  {
LABEL_8:
    if ((v6 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_maxRxAnt = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x100u;
  int v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 0x200) == 0)
  {
LABEL_9:
    if ((v6 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_maxSchdMimoLyr = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x200u;
  int v6 = *((_DWORD *)v4 + 36);
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  self->_lteTotalNumCcs = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 36) & 0x10) != 0)
  {
LABEL_11:
    self->_lteTotalDlMimoLayers = *((_DWORD *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_12:
  lteBandCombo = self->_lteBandCombo;
  uint64_t v8 = *((void *)v5 + 4);
  if (lteBandCombo)
  {
    if (v8) {
      -[BandCombo mergeFrom:](lteBandCombo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[CellularLteConnectionStats setLteBandCombo:](self, "setLteBandCombo:");
  }
  int v9 = *((_DWORD *)v5 + 36);
  if ((v9 & 0x20000) != 0)
  {
    self->_mrdcTotalNumCcs = *((_DWORD *)v5 + 27);
    *(_DWORD *)&self->_has |= 0x20000u;
    int v9 = *((_DWORD *)v5 + 36);
    if ((v9 & 0x10000) == 0)
    {
LABEL_29:
      if ((v9 & 0x2000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_37;
    }
  }
  else if ((v9 & 0x10000) == 0)
  {
    goto LABEL_29;
  }
  self->_mrdcTotalDlMimoLayers = *((_DWORD *)v5 + 26);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v9 = *((_DWORD *)v5 + 36);
  if ((v9 & 0x2000) == 0)
  {
LABEL_30:
    if ((v9 & 0x1000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_37:
  self->_mrdcLteTotalNumCcs = *((_DWORD *)v5 + 21);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v5 + 36) & 0x1000) != 0)
  {
LABEL_31:
    self->_mrdcLteTotalDlMimoLayers = *((_DWORD *)v5 + 20);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_32:
  mrdcLteBandCombo = self->_mrdcLteBandCombo;
  uint64_t v11 = *((void *)v5 + 9);
  if (mrdcLteBandCombo)
  {
    if (v11) {
      -[BandCombo mergeFrom:](mrdcLteBandCombo, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[CellularLteConnectionStats setMrdcLteBandCombo:](self, "setMrdcLteBandCombo:");
  }
  int v12 = *((_DWORD *)v5 + 36);
  if ((v12 & 0x8000) != 0)
  {
    self->_mrdcNrTotalNumCcs = *((_DWORD *)v5 + 25);
    *(_DWORD *)&self->_has |= 0x8000u;
    int v12 = *((_DWORD *)v5 + 36);
  }
  if ((v12 & 0x4000) != 0)
  {
    self->_mrdcNrTotalDlMimoLayers = *((_DWORD *)v5 + 24);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  mrdcNrBandCombo = self->_mrdcNrBandCombo;
  uint64_t v14 = *((void *)v5 + 11);
  if (mrdcNrBandCombo)
  {
    if (v14) {
      -[BandCombo mergeFrom:](mrdcNrBandCombo, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[CellularLteConnectionStats setMrdcNrBandCombo:](self, "setMrdcNrBandCombo:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = *((id *)v5 + 15);
  id v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        -[CellularLteConnectionStats addNwUeCapStat:](self, "addNwUeCapStat:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
      }
      id v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }

  if ((*((unsigned char *)v5 + 146) & 4) != 0)
  {
    self->_numSubs = *((_DWORD *)v5 + 28);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
  if (*((void *)v5 + 16)) {
    -[CellularLteConnectionStats setPlmn:](self, "setPlmn:");
  }
  int v20 = *((_DWORD *)v5 + 36);
  if ((v20 & 0x100000) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 35);
    *(_DWORD *)&self->_has |= 0x100000u;
    int v20 = *((_DWORD *)v5 + 36);
    if ((v20 & 0x80000) == 0)
    {
LABEL_63:
      if ((v20 & 2) == 0) {
        goto LABEL_64;
      }
LABEL_69:
      self->_uint64_t cause = *((_DWORD *)v5 + 4);
      *(_DWORD *)&self->_has |= 2u;
      if ((*((_DWORD *)v5 + 36) & 4) == 0) {
        goto LABEL_66;
      }
      goto LABEL_65;
    }
  }
  else if ((v20 & 0x80000) == 0)
  {
    goto LABEL_63;
  }
  self->_psPref = *((_DWORD *)v5 + 34);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v20 = *((_DWORD *)v5 + 36);
  if ((v20 & 2) != 0) {
    goto LABEL_69;
  }
LABEL_64:
  if ((v20 & 4) != 0)
  {
LABEL_65:
    self->_connDuration = *((_DWORD *)v5 + 5);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_66:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)maxNwMimoLyr
{
  return self->_maxNwMimoLyr;
}

- (unsigned)maxUeRank
{
  return self->_maxUeRank;
}

- (unsigned)maxRxAnt
{
  return self->_maxRxAnt;
}

- (unsigned)maxSchdMimoLyr
{
  return self->_maxSchdMimoLyr;
}

- (unsigned)lteTotalNumCcs
{
  return self->_lteTotalNumCcs;
}

- (unsigned)lteTotalDlMimoLayers
{
  return self->_lteTotalDlMimoLayers;
}

- (BandCombo)lteBandCombo
{
  return self->_lteBandCombo;
}

- (void)setLteBandCombo:(id)a3
{
}

- (unsigned)mrdcTotalNumCcs
{
  return self->_mrdcTotalNumCcs;
}

- (unsigned)mrdcTotalDlMimoLayers
{
  return self->_mrdcTotalDlMimoLayers;
}

- (unsigned)mrdcLteTotalNumCcs
{
  return self->_mrdcLteTotalNumCcs;
}

- (unsigned)mrdcLteTotalDlMimoLayers
{
  return self->_mrdcLteTotalDlMimoLayers;
}

- (BandCombo)mrdcLteBandCombo
{
  return self->_mrdcLteBandCombo;
}

- (void)setMrdcLteBandCombo:(id)a3
{
}

- (unsigned)mrdcNrTotalNumCcs
{
  return self->_mrdcNrTotalNumCcs;
}

- (unsigned)mrdcNrTotalDlMimoLayers
{
  return self->_mrdcNrTotalDlMimoLayers;
}

- (BandCombo)mrdcNrBandCombo
{
  return self->_mrdcNrBandCombo;
}

- (void)setMrdcNrBandCombo:(id)a3
{
}

- (NSMutableArray)nwUeCapStats
{
  return self->_nwUeCapStats;
}

- (void)setNwUeCapStats:(id)a3
{
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (unsigned)connDuration
{
  return self->_connDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
  objc_storeStrong((id *)&self->_nwUeCapStats, 0);
  objc_storeStrong((id *)&self->_mrdcNrBandCombo, 0);
  objc_storeStrong((id *)&self->_mrdcLteBandCombo, 0);

  objc_storeStrong((id *)&self->_lteBandCombo, 0);
}

@end