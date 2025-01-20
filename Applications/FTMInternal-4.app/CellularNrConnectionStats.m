@interface CellularNrConnectionStats
+ (Class)nwUeCapStatType;
- (BOOL)hasBwpSwitch;
- (BOOL)hasCause;
- (BOOL)hasConnDuration;
- (BOOL)hasConnectionType;
- (BOOL)hasDuration;
- (BOOL)hasDurationOfConn;
- (BOOL)hasHasBwpSwitch;
- (BOOL)hasMaxDlMod;
- (BOOL)hasMaxNwMimoLyr;
- (BOOL)hasMaxRxAnt;
- (BOOL)hasMaxSchdMimoLyr;
- (BOOL)hasMaxUeRank;
- (BOOL)hasMaxUlMod;
- (BOOL)hasNr5gBandCombo;
- (BOOL)hasNr5gTotalDlMimoLayers;
- (BOOL)hasNr5gTotalNumCcs;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BandCombo)nr5gBandCombo;
- (NSData)plmn;
- (NSMutableArray)nwUeCapStats;
- (id)causeAsString:(int)a3;
- (id)connectionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)maxDlModAsString:(int)a3;
- (id)maxUlModAsString:(int)a3;
- (id)nwUeCapStatAtIndex:(unint64_t)a3;
- (int)StringAsCause:(id)a3;
- (int)StringAsConnectionType:(id)a3;
- (int)StringAsMaxDlMod:(id)a3;
- (int)StringAsMaxUlMod:(id)a3;
- (int)cause;
- (int)connectionType;
- (int)maxDlMod;
- (int)maxUlMod;
- (unint64_t)hash;
- (unint64_t)nwUeCapStatsCount;
- (unint64_t)timestamp;
- (unsigned)connDuration;
- (unsigned)duration;
- (unsigned)durationOfConn;
- (unsigned)maxNwMimoLyr;
- (unsigned)maxRxAnt;
- (unsigned)maxSchdMimoLyr;
- (unsigned)maxUeRank;
- (unsigned)nr5gTotalDlMimoLayers;
- (unsigned)nr5gTotalNumCcs;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)subsId;
- (void)addNwUeCapStat:(id)a3;
- (void)clearNwUeCapStats;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCause:(int)a3;
- (void)setConnDuration:(unsigned int)a3;
- (void)setConnectionType:(int)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setDurationOfConn:(unsigned int)a3;
- (void)setHasBwpSwitch:(BOOL)a3;
- (void)setHasCause:(BOOL)a3;
- (void)setHasConnDuration:(BOOL)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasDurationOfConn:(BOOL)a3;
- (void)setHasHasBwpSwitch:(BOOL)a3;
- (void)setHasMaxDlMod:(BOOL)a3;
- (void)setHasMaxNwMimoLyr:(BOOL)a3;
- (void)setHasMaxRxAnt:(BOOL)a3;
- (void)setHasMaxSchdMimoLyr:(BOOL)a3;
- (void)setHasMaxUeRank:(BOOL)a3;
- (void)setHasMaxUlMod:(BOOL)a3;
- (void)setHasNr5gTotalDlMimoLayers:(BOOL)a3;
- (void)setHasNr5gTotalNumCcs:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMaxDlMod:(int)a3;
- (void)setMaxNwMimoLyr:(unsigned int)a3;
- (void)setMaxRxAnt:(unsigned int)a3;
- (void)setMaxSchdMimoLyr:(unsigned int)a3;
- (void)setMaxUeRank:(unsigned int)a3;
- (void)setMaxUlMod:(int)a3;
- (void)setNr5gBandCombo:(id)a3;
- (void)setNr5gTotalDlMimoLayers:(unsigned int)a3;
- (void)setNr5gTotalNumCcs:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setNwUeCapStats:(id)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrConnectionStats

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
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
    int v3 = *(&off_1002883C8 + a3);
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
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
    int v3 = *(&off_1002883C8 + a3);
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

- (int)connectionType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_connectionType;
  }
  else {
    return 0;
  }
}

- (void)setConnectionType:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasConnectionType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100288400 + a3);
  }

  return v3;
}

- (int)StringAsConnectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NR5G_MAC_QSH_METRIC_CONNECTION_SA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NR5G_MAC_QSH_METRIC_CONNECTION_NSA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NR5G_MAC_QSH_METRIC_CONNECTION_MAX"])
  {
    int v4 = 2;
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMaxSchdMimoLyr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setDurationOfConn:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_durationOfConn = a3;
}

- (void)setHasDurationOfConn:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDurationOfConn
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasBwpSwitch:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_hasBwpSwitch = a3;
}

- (void)setHasHasBwpSwitch:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasHasBwpSwitch
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setNr5gTotalNumCcs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_nr5gTotalNumCcs = a3;
}

- (void)setHasNr5gTotalNumCcs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNr5gTotalNumCcs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setNr5gTotalDlMimoLayers:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_nr5gTotalDlMimoLayers = a3;
}

- (void)setHasNr5gTotalDlMimoLayers:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNr5gTotalDlMimoLayers
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasNr5gBandCombo
{
  return self->_nr5gBandCombo != 0;
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
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasNumSubs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSubsId
{
  return *((unsigned char *)&self->_has + 2) & 1;
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPsPref
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCause
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)causeAsString:(int)a3
{
  if (a3 >= 5)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100288418 + a3);
  }

  return v3;
}

- (int)StringAsCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CONN_INFO_FLUSH_REASON_RELEASE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONN_INFO_FLUSH_REASON_HO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONN_INFO_FLUSH_REASON_OTHER1"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONN_INFO_FLUSH_REASON_MAX"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CONN_INFO_FLUSH_REASON_MAX_STATS"])
  {
    int v4 = 4;
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
  self->_has = ($BA2926CC5996097E6E8D4FEAFF59E913)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasConnDuration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrConnectionStats;
  int v3 = [(CellularNrConnectionStats *)&v7 description];
  int v4 = [(CellularNrConnectionStats *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v20 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v20 forKey:@"timestamp"];

    $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v21 = +[NSNumber numberWithUnsignedInt:self->_duration];
  [v3 setObject:v21 forKey:@"duration"];

  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_48;
  }
LABEL_40:
  uint64_t maxUlMod = self->_maxUlMod;
  if (maxUlMod >= 7)
  {
    v23 = +[NSString stringWithFormat:@"(unknown: %i)", self->_maxUlMod];
  }
  else
  {
    v23 = *(&off_1002883C8 + maxUlMod);
  }
  [v3 setObject:v23 forKey:@"max_ul_mod"];

  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_55;
  }
LABEL_48:
  uint64_t maxDlMod = self->_maxDlMod;
  if (maxDlMod >= 7)
  {
    v29 = +[NSString stringWithFormat:@"(unknown: %i)", self->_maxDlMod];
  }
  else
  {
    v29 = *(&off_1002883C8 + maxDlMod);
  }
  [v3 setObject:v29 forKey:@"max_dl_mod"];

  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_59;
  }
LABEL_55:
  uint64_t connectionType = self->_connectionType;
  if (connectionType >= 3)
  {
    v31 = +[NSString stringWithFormat:@"(unknown: %i)", self->_connectionType];
  }
  else
  {
    v31 = *(&off_100288400 + connectionType);
  }
  [v3 setObject:v31 forKey:@"connection_type"];

  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_60;
  }
LABEL_59:
  v32 = +[NSNumber numberWithUnsignedInt:self->_maxNwMimoLyr];
  [v3 setObject:v32 forKey:@"max_nw_mimo_lyr"];

  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_61;
  }
LABEL_60:
  v33 = +[NSNumber numberWithUnsignedInt:self->_maxUeRank];
  [v3 setObject:v33 forKey:@"max_ue_rank"];

  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_62;
  }
LABEL_61:
  v34 = +[NSNumber numberWithUnsignedInt:self->_maxRxAnt];
  [v3 setObject:v34 forKey:@"max_rx_ant"];

  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_63;
  }
LABEL_62:
  v35 = +[NSNumber numberWithUnsignedInt:self->_maxSchdMimoLyr];
  [v3 setObject:v35 forKey:@"max_schd_mimo_lyr"];

  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_64;
  }
LABEL_63:
  v36 = +[NSNumber numberWithUnsignedInt:self->_durationOfConn];
  [v3 setObject:v36 forKey:@"duration_of_conn"];

  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_65;
  }
LABEL_64:
  v37 = +[NSNumber numberWithBool:self->_hasBwpSwitch];
  [v3 setObject:v37 forKey:@"has_bwp_switch"];

  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_65:
  v38 = +[NSNumber numberWithUnsignedInt:self->_nr5gTotalNumCcs];
  [v3 setObject:v38 forKey:@"nr5g_total_num_ccs"];

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_14:
    v5 = +[NSNumber numberWithUnsignedInt:self->_nr5gTotalDlMimoLayers];
    [v3 setObject:v5 forKey:@"nr5g_total_dl_mimo_layers"];
  }
LABEL_15:
  nr5gBandCombo = self->_nr5gBandCombo;
  if (nr5gBandCombo)
  {
    objc_super v7 = [nr5gBandCombo dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"nr5g_band_combo"];
  }
  if ([(NSMutableArray *)self->_nwUeCapStats count])
  {
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_nwUeCapStats, "count")];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v9 = self->_nwUeCapStats;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"nw_ue_cap_stat"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    v15 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v15 forKey:@"num_subs"];
  }
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  $BA2926CC5996097E6E8D4FEAFF59E913 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x10000) != 0)
  {
    v24 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v24 forKey:@"subs_id"];

    $BA2926CC5996097E6E8D4FEAFF59E913 v17 = self->_has;
    if ((*(_WORD *)&v17 & 0x8000) == 0)
    {
LABEL_32:
      if ((*(unsigned char *)&v17 & 2) == 0) {
        goto LABEL_33;
      }
      goto LABEL_44;
    }
  }
  else if ((*(_WORD *)&v17 & 0x8000) == 0)
  {
    goto LABEL_32;
  }
  v25 = +[NSNumber numberWithUnsignedInt:self->_psPref];
  [v3 setObject:v25 forKey:@"ps_pref"];

  $BA2926CC5996097E6E8D4FEAFF59E913 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 2) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v17 & 4) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_44:
  uint64_t cause = self->_cause;
  if (cause >= 5)
  {
    v27 = +[NSString stringWithFormat:@"(unknown: %i)", self->_cause];
  }
  else
  {
    v27 = *(&off_100288418 + cause);
  }
  [v3 setObject:v27 forKey:@"cause"];

  if ((*(_DWORD *)&self->_has & 4) == 0) {
    goto LABEL_35;
  }
LABEL_34:
  v18 = +[NSNumber numberWithUnsignedInt:self->_connDuration];
  [v3 setObject:v18 forKey:@"conn_duration"];

LABEL_35:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001184B0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_14:
  }
    PBDataWriterWriteUint32Field();
LABEL_15:
  if (self->_nr5gBandCombo) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_nwUeCapStats;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  $BA2926CC5996097E6E8D4FEAFF59E913 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x10000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $BA2926CC5996097E6E8D4FEAFF59E913 v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x8000) == 0)
    {
LABEL_30:
      if ((*(unsigned char *)&v11 & 2) == 0) {
        goto LABEL_31;
      }
LABEL_49:
      PBDataWriterWriteInt32Field();
      if ((*(_DWORD *)&self->_has & 4) == 0) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&v11 & 0x8000) == 0)
  {
    goto LABEL_30;
  }
  PBDataWriterWriteUint32Field();
  $BA2926CC5996097E6E8D4FEAFF59E913 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 2) != 0) {
    goto LABEL_49;
  }
LABEL_31:
  if ((*(unsigned char *)&v11 & 4) != 0) {
LABEL_32:
  }
    PBDataWriterWriteUint32Field();
LABEL_33:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 29) |= 1u;
    $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_duration;
  *((_DWORD *)v4 + 29) |= 0x10u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 14) = self->_maxUlMod;
  *((_DWORD *)v4 + 29) |= 0x800u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 9) = self->_maxDlMod;
  *((_DWORD *)v4 + 29) |= 0x40u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 6) = self->_connectionType;
  *((_DWORD *)v4 + 29) |= 8u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 10) = self->_maxNwMimoLyr;
  *((_DWORD *)v4 + 29) |= 0x80u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 13) = self->_maxUeRank;
  *((_DWORD *)v4 + 29) |= 0x400u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 11) = self->_maxRxAnt;
  *((_DWORD *)v4 + 29) |= 0x100u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 12) = self->_maxSchdMimoLyr;
  *((_DWORD *)v4 + 29) |= 0x200u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 8) = self->_durationOfConn;
  *((_DWORD *)v4 + 29) |= 0x20u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((unsigned char *)v4 + 112) = self->_hasBwpSwitch;
  *((_DWORD *)v4 + 29) |= 0x20000u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_44:
  *((_DWORD *)v4 + 19) = self->_nr5gTotalNumCcs;
  *((_DWORD *)v4 + 29) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_14:
    *((_DWORD *)v4 + 18) = self->_nr5gTotalDlMimoLayers;
    *((_DWORD *)v4 + 29) |= 0x1000u;
  }
LABEL_15:
  long long v12 = v4;
  if (self->_nr5gBandCombo) {
    [v4 setNr5gBandCombo];
  }
  if ([(CellularNrConnectionStats *)self nwUeCapStatsCount])
  {
    [v12 clearNwUeCapStats];
    unint64_t v6 = [(CellularNrConnectionStats *)self nwUeCapStatsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularNrConnectionStats *)self nwUeCapStatAtIndex:i];
        [v12 addNwUeCapStat:v9];
      }
    }
  }
  id v10 = v12;
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    v12[20] = self->_numSubs;
    v12[29] |= 0x4000u;
  }
  if (self->_plmn)
  {
    [v12 setPlmn:];
    id v10 = v12;
  }
  $BA2926CC5996097E6E8D4FEAFF59E913 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x10000) != 0)
  {
    v10[27] = self->_subsId;
    v10[29] |= 0x10000u;
    $BA2926CC5996097E6E8D4FEAFF59E913 v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x8000) == 0)
    {
LABEL_27:
      if ((*(unsigned char *)&v11 & 2) == 0) {
        goto LABEL_28;
      }
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&v11 & 0x8000) == 0)
  {
    goto LABEL_27;
  }
  v10[26] = self->_psPref;
  v10[29] |= 0x8000u;
  $BA2926CC5996097E6E8D4FEAFF59E913 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 2) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v11 & 4) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_48:
  v10[4] = self->_cause;
  v10[29] |= 2u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_29:
    v10[5] = self->_connDuration;
    v10[29] |= 4u;
  }
LABEL_30:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 29) |= 1u;
    $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 7) = self->_duration;
  *((_DWORD *)v5 + 29) |= 0x10u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v5 + 14) = self->_maxUlMod;
  *((_DWORD *)v5 + 29) |= 0x800u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v5 + 9) = self->_maxDlMod;
  *((_DWORD *)v5 + 29) |= 0x40u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v5 + 6) = self->_connectionType;
  *((_DWORD *)v5 + 29) |= 8u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v5 + 10) = self->_maxNwMimoLyr;
  *((_DWORD *)v5 + 29) |= 0x80u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v5 + 13) = self->_maxUeRank;
  *((_DWORD *)v5 + 29) |= 0x400u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v5 + 11) = self->_maxRxAnt;
  *((_DWORD *)v5 + 29) |= 0x100u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v5 + 12) = self->_maxSchdMimoLyr;
  *((_DWORD *)v5 + 29) |= 0x200u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v5 + 8) = self->_durationOfConn;
  *((_DWORD *)v5 + 29) |= 0x20u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((unsigned char *)v5 + 112) = self->_hasBwpSwitch;
  *((_DWORD *)v5 + 29) |= 0x20000u;
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_41:
  *((_DWORD *)v5 + 19) = self->_nr5gTotalNumCcs;
  *((_DWORD *)v5 + 29) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_14:
    *((_DWORD *)v5 + 18) = self->_nr5gTotalDlMimoLayers;
    *((_DWORD *)v5 + 29) |= 0x1000u;
  }
LABEL_15:
  id v8 = [self->_nr5gBandCombo copyWithZone:a3];
  uint64_t v9 = (void *)v6[8];
  v6[8] = v8;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = self->_nwUeCapStats;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v14) copyWithZone:a3];
        [v6 addNwUeCapStat:v15];

        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *((_DWORD *)v6 + 20) = self->_numSubs;
    *((_DWORD *)v6 + 29) |= 0x4000u;
  }
  id v16 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (void)v20);
  $BA2926CC5996097E6E8D4FEAFF59E913 v17 = (void *)v6[12];
  v6[12] = v16;

  $BA2926CC5996097E6E8D4FEAFF59E913 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x10000) != 0)
  {
    *((_DWORD *)v6 + 27) = self->_subsId;
    *((_DWORD *)v6 + 29) |= 0x10000u;
    $BA2926CC5996097E6E8D4FEAFF59E913 v18 = self->_has;
    if ((*(_WORD *)&v18 & 0x8000) == 0)
    {
LABEL_26:
      if ((*(unsigned char *)&v18 & 2) == 0) {
        goto LABEL_27;
      }
LABEL_45:
      *((_DWORD *)v6 + 4) = self->_cause;
      *((_DWORD *)v6 + 29) |= 2u;
      if ((*(_DWORD *)&self->_has & 4) == 0) {
        return v6;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&v18 & 0x8000) == 0)
  {
    goto LABEL_26;
  }
  *((_DWORD *)v6 + 26) = self->_psPref;
  *((_DWORD *)v6 + 29) |= 0x8000u;
  $BA2926CC5996097E6E8D4FEAFF59E913 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 2) != 0) {
    goto LABEL_45;
  }
LABEL_27:
  if ((*(unsigned char *)&v18 & 4) != 0)
  {
LABEL_28:
    *((_DWORD *)v6 + 5) = self->_connDuration;
    *((_DWORD *)v6 + 29) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_102;
  }
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  int v6 = *((_DWORD *)v4 + 29);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_102;
    }
  }
  else if (v6)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_duration != *((_DWORD *)v4 + 7)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_maxUlMod != *((_DWORD *)v4 + 14)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_maxDlMod != *((_DWORD *)v4 + 9)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_connectionType != *((_DWORD *)v4 + 6)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_maxNwMimoLyr != *((_DWORD *)v4 + 10)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_maxUeRank != *((_DWORD *)v4 + 13)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_maxRxAnt != *((_DWORD *)v4 + 11)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_maxSchdMimoLyr != *((_DWORD *)v4 + 12)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_durationOfConn != *((_DWORD *)v4 + 8)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0) {
      goto LABEL_102;
    }
    if (self->_hasBwpSwitch)
    {
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_102;
      }
    }
    else if (*((unsigned char *)v4 + 112))
    {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_nr5gTotalNumCcs != *((_DWORD *)v4 + 19)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_nr5gTotalDlMimoLayers != *((_DWORD *)v4 + 18)) {
      goto LABEL_102;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_102;
  }
  nr5gBandCombo = self->_nr5gBandCombo;
  if ((unint64_t)nr5gBandCombo | *((void *)v4 + 8) && !-[BandCombo isEqual:](nr5gBandCombo, "isEqual:")) {
    goto LABEL_102;
  }
  nwUeCapStats = self->_nwUeCapStats;
  if ((unint64_t)nwUeCapStats | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](nwUeCapStats, "isEqual:")) {
      goto LABEL_102;
    }
  }
  $BA2926CC5996097E6E8D4FEAFF59E913 v9 = self->_has;
  int v10 = *((_DWORD *)v4 + 29);
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_numSubs != *((_DWORD *)v4 + 20)) {
      goto LABEL_102;
    }
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_102;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 12))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      $BA2926CC5996097E6E8D4FEAFF59E913 v9 = self->_has;
      goto LABEL_82;
    }
LABEL_102:
    BOOL v13 = 0;
    goto LABEL_103;
  }
LABEL_82:
  int v12 = *((_DWORD *)v4 + 29);
  if ((*(_DWORD *)&v9 & 0x10000) != 0)
  {
    if ((v12 & 0x10000) == 0 || self->_subsId != *((_DWORD *)v4 + 27)) {
      goto LABEL_102;
    }
  }
  else if ((v12 & 0x10000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&v9 & 0x8000) != 0)
  {
    if ((v12 & 0x8000) == 0 || self->_psPref != *((_DWORD *)v4 + 26)) {
      goto LABEL_102;
    }
  }
  else if ((v12 & 0x8000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&v9 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_cause != *((_DWORD *)v4 + 4)) {
      goto LABEL_102;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_102;
  }
  if ((*(unsigned char *)&v9 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_connDuration != *((_DWORD *)v4 + 5)) {
      goto LABEL_102;
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = (*((_DWORD *)v4 + 29) & 4) == 0;
  }
LABEL_103:

  return v13;
}

- (unint64_t)hash
{
  $BA2926CC5996097E6E8D4FEAFF59E913 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v26 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v25 = 2654435761 * self->_duration;
      if ((*(_WORD *)&has & 0x800) != 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else
  {
    unint64_t v26 = 0;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v25 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_4:
    uint64_t v24 = 2654435761 * self->_maxUlMod;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v24 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v23 = 2654435761 * self->_maxDlMod;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v23 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_6:
    uint64_t v22 = 2654435761 * self->_connectionType;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v22 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_7:
    uint64_t v21 = 2654435761 * self->_maxNwMimoLyr;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v21 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_8:
    uint64_t v20 = 2654435761 * self->_maxUeRank;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v20 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_9:
    uint64_t v19 = 2654435761 * self->_maxRxAnt;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v19 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_10:
    uint64_t v18 = 2654435761 * self->_maxSchdMimoLyr;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v18 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_11:
    uint64_t v4 = 2654435761 * self->_durationOfConn;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v4 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_12:
    uint64_t v5 = 2654435761 * self->_hasBwpSwitch;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v6 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_25:
  uint64_t v5 = 0;
  if ((*(_WORD *)&has & 0x2000) == 0) {
    goto LABEL_26;
  }
LABEL_13:
  uint64_t v6 = 2654435761 * self->_nr5gTotalNumCcs;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_14:
    uint64_t v7 = 2654435761 * self->_nr5gTotalDlMimoLayers;
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v7 = 0;
LABEL_28:
  unint64_t v8 = [self->_nr5gBandCombo hash];
  unint64_t v9 = (unint64_t)[(NSMutableArray *)self->_nwUeCapStats hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    uint64_t v10 = 2654435761 * self->_numSubs;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = (unint64_t)[(NSData *)self->_plmn hash];
  $BA2926CC5996097E6E8D4FEAFF59E913 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) != 0)
  {
    uint64_t v13 = 2654435761 * self->_subsId;
    if ((*(_WORD *)&v12 & 0x8000) != 0)
    {
LABEL_33:
      uint64_t v14 = 2654435761 * self->_psPref;
      if ((*(unsigned char *)&v12 & 2) != 0) {
        goto LABEL_34;
      }
LABEL_38:
      uint64_t v15 = 0;
      if ((*(unsigned char *)&v12 & 4) != 0) {
        goto LABEL_35;
      }
LABEL_39:
      uint64_t v16 = 0;
      return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(_WORD *)&v12 & 0x8000) != 0) {
      goto LABEL_33;
    }
  }
  uint64_t v14 = 0;
  if ((*(unsigned char *)&v12 & 2) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v15 = 2654435761 * self->_cause;
  if ((*(unsigned char *)&v12 & 4) == 0) {
    goto LABEL_39;
  }
LABEL_35:
  uint64_t v16 = 2654435761 * self->_connDuration;
  return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int v6 = *((_DWORD *)v4 + 29);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v6 = *((_DWORD *)v4 + 29);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  int v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x800) == 0)
  {
LABEL_4:
    if ((v6 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_uint64_t maxUlMod = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  int v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x40) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_uint64_t maxDlMod = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  int v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_uint64_t connectionType = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x80) == 0)
  {
LABEL_7:
    if ((v6 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_maxNwMimoLyr = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  int v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x400) == 0)
  {
LABEL_8:
    if ((v6 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_maxUeRank = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  int v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x100) == 0)
  {
LABEL_9:
    if ((v6 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_maxRxAnt = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  int v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x200) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_maxSchdMimoLyr = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  int v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x20) == 0)
  {
LABEL_11:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_durationOfConn = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  int v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x20000) == 0)
  {
LABEL_12:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_hasBwpSwitch = *((unsigned char *)v4 + 112);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v6 = *((_DWORD *)v4 + 29);
  if ((v6 & 0x2000) == 0)
  {
LABEL_13:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  self->_nr5gTotalNumCcs = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v4 + 29) & 0x1000) != 0)
  {
LABEL_14:
    self->_nr5gTotalDlMimoLayers = *((_DWORD *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_15:
  nr5gBandCombo = self->_nr5gBandCombo;
  uint64_t v8 = *((void *)v5 + 8);
  if (nr5gBandCombo)
  {
    if (v8) {
      -[BandCombo mergeFrom:](nr5gBandCombo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[CellularNrConnectionStats setNr5gBandCombo:](self, "setNr5gBandCombo:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = *((id *)v5 + 11);
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        -[CellularNrConnectionStats addNwUeCapStat:](self, "addNwUeCapStat:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  if ((*((unsigned char *)v5 + 117) & 0x40) != 0)
  {
    self->_numSubs = *((_DWORD *)v5 + 20);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  if (*((void *)v5 + 12)) {
    -[CellularNrConnectionStats setPlmn:](self, "setPlmn:");
  }
  int v14 = *((_DWORD *)v5 + 29);
  if ((v14 & 0x10000) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 27);
    *(_DWORD *)&self->_has |= 0x10000u;
    int v14 = *((_DWORD *)v5 + 29);
    if ((v14 & 0x8000) == 0)
    {
LABEL_46:
      if ((v14 & 2) == 0) {
        goto LABEL_47;
      }
LABEL_52:
      self->_uint64_t cause = *((_DWORD *)v5 + 4);
      *(_DWORD *)&self->_has |= 2u;
      if ((*((_DWORD *)v5 + 29) & 4) == 0) {
        goto LABEL_49;
      }
      goto LABEL_48;
    }
  }
  else if ((v14 & 0x8000) == 0)
  {
    goto LABEL_46;
  }
  self->_psPref = *((_DWORD *)v5 + 26);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v14 = *((_DWORD *)v5 + 29);
  if ((v14 & 2) != 0) {
    goto LABEL_52;
  }
LABEL_47:
  if ((v14 & 4) != 0)
  {
LABEL_48:
    self->_connDuration = *((_DWORD *)v5 + 5);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_49:
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

- (unsigned)durationOfConn
{
  return self->_durationOfConn;
}

- (BOOL)hasBwpSwitch
{
  return self->_hasBwpSwitch;
}

- (unsigned)nr5gTotalNumCcs
{
  return self->_nr5gTotalNumCcs;
}

- (unsigned)nr5gTotalDlMimoLayers
{
  return self->_nr5gTotalDlMimoLayers;
}

- (BandCombo)nr5gBandCombo
{
  return self->_nr5gBandCombo;
}

- (void)setNr5gBandCombo:(id)a3
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

  objc_storeStrong((id *)&self->_nr5gBandCombo, 0);
}

@end