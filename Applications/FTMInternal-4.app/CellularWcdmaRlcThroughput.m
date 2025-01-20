@interface CellularWcdmaRlcThroughput
- (BOOL)hasAveDlThroughput;
- (BOOL)hasAveUlThroughput;
- (BOOL)hasDlActiveDur;
- (BOOL)hasDlBlerPpt;
- (BOOL)hasDlTotalBytes;
- (BOOL)hasLastDlInactiveDur;
- (BOOL)hasLastFachDuration;
- (BOOL)hasLastUlInactiveDur;
- (BOOL)hasMaxDlRbRate;
- (BOOL)hasMaxDlThroughput;
- (BOOL)hasMaxUlRbRate;
- (BOOL)hasMaxUlThroughput;
- (BOOL)hasMrabDuration;
- (BOOL)hasPsDuration;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalFachDuration;
- (BOOL)hasUlActiveDur;
- (BOOL)hasUlRetxBlockRatePpt;
- (BOOL)hasUlTotalBytes;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)rxPowerHistsCount;
- (unint64_t)timestamp;
- (unint64_t)txPowerHistsCount;
- (unsigned)aveDlThroughput;
- (unsigned)aveUlThroughput;
- (unsigned)dlActiveDur;
- (unsigned)dlBlerPpt;
- (unsigned)dlTotalBytes;
- (unsigned)lastDlInactiveDur;
- (unsigned)lastFachDuration;
- (unsigned)lastUlInactiveDur;
- (unsigned)maxDlRbRate;
- (unsigned)maxDlThroughput;
- (unsigned)maxUlRbRate;
- (unsigned)maxUlThroughput;
- (unsigned)mrabDuration;
- (unsigned)psDuration;
- (unsigned)rxPowerHistAtIndex:(unint64_t)a3;
- (unsigned)rxPowerHists;
- (unsigned)totalFachDuration;
- (unsigned)txPowerHistAtIndex:(unint64_t)a3;
- (unsigned)txPowerHists;
- (unsigned)ulActiveDur;
- (unsigned)ulRetxBlockRatePpt;
- (unsigned)ulTotalBytes;
- (unsigned)version;
- (void)addRxPowerHist:(unsigned int)a3;
- (void)addTxPowerHist:(unsigned int)a3;
- (void)clearRxPowerHists;
- (void)clearTxPowerHists;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAveDlThroughput:(unsigned int)a3;
- (void)setAveUlThroughput:(unsigned int)a3;
- (void)setDlActiveDur:(unsigned int)a3;
- (void)setDlBlerPpt:(unsigned int)a3;
- (void)setDlTotalBytes:(unsigned int)a3;
- (void)setHasAveDlThroughput:(BOOL)a3;
- (void)setHasAveUlThroughput:(BOOL)a3;
- (void)setHasDlActiveDur:(BOOL)a3;
- (void)setHasDlBlerPpt:(BOOL)a3;
- (void)setHasDlTotalBytes:(BOOL)a3;
- (void)setHasLastDlInactiveDur:(BOOL)a3;
- (void)setHasLastFachDuration:(BOOL)a3;
- (void)setHasLastUlInactiveDur:(BOOL)a3;
- (void)setHasMaxDlRbRate:(BOOL)a3;
- (void)setHasMaxDlThroughput:(BOOL)a3;
- (void)setHasMaxUlRbRate:(BOOL)a3;
- (void)setHasMaxUlThroughput:(BOOL)a3;
- (void)setHasMrabDuration:(BOOL)a3;
- (void)setHasPsDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalFachDuration:(BOOL)a3;
- (void)setHasUlActiveDur:(BOOL)a3;
- (void)setHasUlRetxBlockRatePpt:(BOOL)a3;
- (void)setHasUlTotalBytes:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLastDlInactiveDur:(unsigned int)a3;
- (void)setLastFachDuration:(unsigned int)a3;
- (void)setLastUlInactiveDur:(unsigned int)a3;
- (void)setMaxDlRbRate:(unsigned int)a3;
- (void)setMaxDlThroughput:(unsigned int)a3;
- (void)setMaxUlRbRate:(unsigned int)a3;
- (void)setMaxUlThroughput:(unsigned int)a3;
- (void)setMrabDuration:(unsigned int)a3;
- (void)setPsDuration:(unsigned int)a3;
- (void)setRxPowerHists:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalFachDuration:(unsigned int)a3;
- (void)setTxPowerHists:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setUlActiveDur:(unsigned int)a3;
- (void)setUlRetxBlockRatePpt:(unsigned int)a3;
- (void)setUlTotalBytes:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularWcdmaRlcThroughput

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CellularWcdmaRlcThroughput;
  [(CellularWcdmaRlcThroughput *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPsDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_psDuration = a3;
}

- (void)setHasPsDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasPsDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTotalFachDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_totalFachDuration = a3;
}

- (void)setHasTotalFachDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTotalFachDuration
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setLastFachDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_lastFachDuration = a3;
}

- (void)setHasLastFachDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLastFachDuration
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setMrabDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_mrabDuration = a3;
}

- (void)setHasMrabDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasMrabDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setLastUlInactiveDur:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_lastUlInactiveDur = a3;
}

- (void)setHasLastUlInactiveDur:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLastUlInactiveDur
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setLastDlInactiveDur:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_lastDlInactiveDur = a3;
}

- (void)setHasLastDlInactiveDur:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasLastDlInactiveDur
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setAveUlThroughput:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_aveUlThroughput = a3;
}

- (void)setHasAveUlThroughput:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAveUlThroughput
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAveDlThroughput:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_aveDlThroughput = a3;
}

- (void)setHasAveDlThroughput:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAveDlThroughput
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMaxUlThroughput:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_maxUlThroughput = a3;
}

- (void)setHasMaxUlThroughput:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMaxUlThroughput
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setMaxDlThroughput:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_maxDlThroughput = a3;
}

- (void)setHasMaxDlThroughput:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMaxDlThroughput
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setMaxUlRbRate:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_maxUlRbRate = a3;
}

- (void)setHasMaxUlRbRate:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMaxUlRbRate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setMaxDlRbRate:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_maxDlRbRate = a3;
}

- (void)setHasMaxDlRbRate:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMaxDlRbRate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setUlActiveDur:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_ulActiveDur = a3;
}

- (void)setHasUlActiveDur:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasUlActiveDur
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setDlActiveDur:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_dlActiveDur = a3;
}

- (void)setHasDlActiveDur:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDlActiveDur
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setUlRetxBlockRatePpt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_ulRetxBlockRatePpt = a3;
}

- (void)setHasUlRetxBlockRatePpt:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasUlRetxBlockRatePpt
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setDlBlerPpt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dlBlerPpt = a3;
}

- (void)setHasDlBlerPpt:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDlBlerPpt
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (unint64_t)txPowerHistsCount
{
  return self->_txPowerHists.count;
}

- (unsigned)txPowerHists
{
  return self->_txPowerHists.list;
}

- (void)clearTxPowerHists
{
}

- (void)addTxPowerHist:(unsigned int)a3
{
}

- (unsigned)txPowerHistAtIndex:(unint64_t)a3
{
  p_txPowerHists = &self->_txPowerHists;
  unint64_t count = self->_txPowerHists.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_txPowerHists->list[a3];
}

- (void)setTxPowerHists:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rxPowerHistsCount
{
  return self->_rxPowerHists.count;
}

- (unsigned)rxPowerHists
{
  return self->_rxPowerHists.list;
}

- (void)clearRxPowerHists
{
}

- (void)addRxPowerHist:(unsigned int)a3
{
}

- (unsigned)rxPowerHistAtIndex:(unint64_t)a3
{
  p_rxPowerHists = &self->_rxPowerHists;
  unint64_t count = self->_rxPowerHists.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rxPowerHists->list[a3];
}

- (void)setRxPowerHists:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setUlTotalBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_ulTotalBytes = a3;
}

- (void)setHasUlTotalBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasUlTotalBytes
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setDlTotalBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dlTotalBytes = a3;
}

- (void)setHasDlTotalBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDlTotalBytes
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasVersion
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularWcdmaRlcThroughput;
  int v3 = [(CellularWcdmaRlcThroughput *)&v7 description];
  v4 = [(CellularWcdmaRlcThroughput *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v11 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v11 forKey:@"timestamp"];

    $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  v12 = +[NSNumber numberWithUnsignedInt:self->_psDuration];
  [v3 setObject:v12 forKey:@"ps_duration"];

  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  v13 = +[NSNumber numberWithUnsignedInt:self->_totalFachDuration];
  [v3 setObject:v13 forKey:@"total_fach_duration"];

  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  v14 = +[NSNumber numberWithUnsignedInt:self->_lastFachDuration];
  [v3 setObject:v14 forKey:@"last_fach_duration"];

  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  v15 = +[NSNumber numberWithUnsignedInt:self->_mrabDuration];
  [v3 setObject:v15 forKey:@"mrab_duration"];

  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  v16 = +[NSNumber numberWithUnsignedInt:self->_lastUlInactiveDur];
  [v3 setObject:v16 forKey:@"last_ul_inactive_dur"];

  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  v17 = +[NSNumber numberWithUnsignedInt:self->_lastDlInactiveDur];
  [v3 setObject:v17 forKey:@"last_dl_inactive_dur"];

  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  v18 = +[NSNumber numberWithUnsignedInt:self->_aveUlThroughput];
  [v3 setObject:v18 forKey:@"ave_ul_throughput"];

  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  v19 = +[NSNumber numberWithUnsignedInt:self->_aveDlThroughput];
  [v3 setObject:v19 forKey:@"ave_dl_throughput"];

  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  v20 = +[NSNumber numberWithUnsignedInt:self->_maxUlThroughput];
  [v3 setObject:v20 forKey:@"max_ul_throughput"];

  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  v21 = +[NSNumber numberWithUnsignedInt:self->_maxDlThroughput];
  [v3 setObject:v21 forKey:@"max_dl_throughput"];

  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  v22 = +[NSNumber numberWithUnsignedInt:self->_maxUlRbRate];
  [v3 setObject:v22 forKey:@"max_ul_rb_rate"];

  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  v23 = +[NSNumber numberWithUnsignedInt:self->_maxDlRbRate];
  [v3 setObject:v23 forKey:@"max_dl_rb_rate"];

  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  v24 = +[NSNumber numberWithUnsignedInt:self->_ulActiveDur];
  [v3 setObject:v24 forKey:@"ul_active_dur"];

  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  v25 = +[NSNumber numberWithUnsignedInt:self->_dlActiveDur];
  [v3 setObject:v25 forKey:@"dl_active_dur"];

  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_41:
  v26 = +[NSNumber numberWithUnsignedInt:self->_ulRetxBlockRatePpt];
  [v3 setObject:v26 forKey:@"ul_retx_block_rate_ppt"];

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_18:
    v5 = +[NSNumber numberWithUnsignedInt:self->_dlBlerPpt];
    [v3 setObject:v5 forKey:@"dl_bler_ppt"];
  }
LABEL_19:
  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"tx_power_hist"];

  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"rx_power_hist"];

  $E76A4E3F312DA20721C84FD0B50D0B19 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) != 0)
  {
    v27 = +[NSNumber numberWithUnsignedInt:self->_ulTotalBytes];
    [v3 setObject:v27 forKey:@"ul_total_bytes"];

    $E76A4E3F312DA20721C84FD0B50D0B19 v8 = self->_has;
    if ((*(unsigned char *)&v8 & 0x20) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v8 & 0x80000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&v8 & 0x20) == 0)
  {
    goto LABEL_21;
  }
  v28 = +[NSNumber numberWithUnsignedInt:self->_dlTotalBytes];
  [v3 setObject:v28 forKey:@"dl_total_bytes"];

  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_22:
    v9 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v9 forKey:@"version"];
  }
LABEL_23:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006CD34((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  id v9 = v4;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v9;
    $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_18:
    PBDataWriterWriteUint32Field();
    id v4 = v9;
  }
LABEL_19:
  if (self->_txPowerHists.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v9;
      ++v6;
    }
    while (v6 < self->_txPowerHists.count);
  }
  if (self->_rxPowerHists.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v9;
      ++v7;
    }
    while (v7 < self->_rxPowerHists.count);
  }
  $E76A4E3F312DA20721C84FD0B50D0B19 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v9;
    $E76A4E3F312DA20721C84FD0B50D0B19 v8 = self->_has;
    if ((*(unsigned char *)&v8 & 0x20) == 0)
    {
LABEL_27:
      if ((*(_DWORD *)&v8 & 0x80000) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&v8 & 0x20) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_28:
    PBDataWriterWriteUint32Field();
    id v4 = v9;
  }
LABEL_29:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[7] = self->_timestamp;
    *((_DWORD *)v4 + 35) |= 1u;
    $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 29) = self->_psDuration;
  *((_DWORD *)v4 + 35) |= 0x4000u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 30) = self->_totalFachDuration;
  *((_DWORD *)v4 + 35) |= 0x8000u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 22) = self->_lastFachDuration;
  *((_DWORD *)v4 + 35) |= 0x80u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 28) = self->_mrabDuration;
  *((_DWORD *)v4 + 35) |= 0x2000u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 23) = self->_lastUlInactiveDur;
  *((_DWORD *)v4 + 35) |= 0x100u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 21) = self->_lastDlInactiveDur;
  *((_DWORD *)v4 + 35) |= 0x40u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 17) = self->_aveUlThroughput;
  *((_DWORD *)v4 + 35) |= 4u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 16) = self->_aveDlThroughput;
  *((_DWORD *)v4 + 35) |= 2u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 27) = self->_maxUlThroughput;
  *((_DWORD *)v4 + 35) |= 0x1000u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 25) = self->_maxDlThroughput;
  *((_DWORD *)v4 + 35) |= 0x400u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 26) = self->_maxUlRbRate;
  *((_DWORD *)v4 + 35) |= 0x800u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 24) = self->_maxDlRbRate;
  *((_DWORD *)v4 + 35) |= 0x200u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 31) = self->_ulActiveDur;
  *((_DWORD *)v4 + 35) |= 0x10000u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_17;
    }
LABEL_49:
    *((_DWORD *)v4 + 32) = self->_ulRetxBlockRatePpt;
    *((_DWORD *)v4 + 35) |= 0x20000u;
    if ((*(_DWORD *)&self->_has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_48:
  *((_DWORD *)v4 + 18) = self->_dlActiveDur;
  *((_DWORD *)v4 + 35) |= 8u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0) {
    goto LABEL_49;
  }
LABEL_17:
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 19) = self->_dlBlerPpt;
    *((_DWORD *)v4 + 35) |= 0x10u;
  }
LABEL_19:
  v13 = v4;
  if ([(CellularWcdmaRlcThroughput *)self txPowerHistsCount])
  {
    [v13 clearTxPowerHists];
    unint64_t v6 = [(CellularWcdmaRlcThroughput *)self txPowerHistsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v13 addTxPowerHist:[self txPowerHistAtIndex:i]];
    }
  }
  if ([(CellularWcdmaRlcThroughput *)self rxPowerHistsCount])
  {
    [v13 clearRxPowerHists];
    unint64_t v9 = [(CellularWcdmaRlcThroughput *)self rxPowerHistsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [v13 addRxPowerHist:[self rxPowerHistAtIndex:j]];
    }
  }
  $E76A4E3F312DA20721C84FD0B50D0B19 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
    v13[33] = self->_ulTotalBytes;
    v13[35] |= 0x40000u;
    $E76A4E3F312DA20721C84FD0B50D0B19 v12 = self->_has;
    if ((*(unsigned char *)&v12 & 0x20) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&v12 & 0x80000) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((*(unsigned char *)&v12 & 0x20) == 0)
  {
    goto LABEL_29;
  }
  v13[20] = self->_dlTotalBytes;
  v13[35] |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_30:
    v13[34] = self->_version;
    v13[35] |= 0x80000u;
  }
LABEL_31:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = v4;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)v4 + 7) = self->_timestamp;
    v4[35] |= 1u;
    $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  v4[29] = self->_psDuration;
  v4[35] |= 0x4000u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[30] = self->_totalFachDuration;
  v4[35] |= 0x8000u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[22] = self->_lastFachDuration;
  v4[35] |= 0x80u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[28] = self->_mrabDuration;
  v4[35] |= 0x2000u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[23] = self->_lastUlInactiveDur;
  v4[35] |= 0x100u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[21] = self->_lastDlInactiveDur;
  v4[35] |= 0x40u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  v4[17] = self->_aveUlThroughput;
  v4[35] |= 4u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[16] = self->_aveDlThroughput;
  v4[35] |= 2u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  v4[27] = self->_maxUlThroughput;
  v4[35] |= 0x1000u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  v4[25] = self->_maxDlThroughput;
  v4[35] |= 0x400u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  v4[26] = self->_maxUlRbRate;
  v4[35] |= 0x800u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  v4[24] = self->_maxDlRbRate;
  v4[35] |= 0x200u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  v4[31] = self->_ulActiveDur;
  v4[35] |= 0x10000u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  v4[18] = self->_dlActiveDur;
  v4[35] |= 8u;
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_39:
  v4[32] = self->_ulRetxBlockRatePpt;
  v4[35] |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_18:
    v4[19] = self->_dlBlerPpt;
    v4[35] |= 0x10u;
  }
LABEL_19:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  $E76A4E3F312DA20721C84FD0B50D0B19 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
    if ((*(unsigned char *)&v7 & 0x20) == 0) {
      goto LABEL_21;
    }
LABEL_42:
    v5[20] = self->_dlTotalBytes;
    v5[35] |= 0x20u;
    if ((*(_DWORD *)&self->_has & 0x80000) == 0) {
      return v5;
    }
    goto LABEL_22;
  }
  v5[33] = self->_ulTotalBytes;
  v5[35] |= 0x40000u;
  $E76A4E3F312DA20721C84FD0B50D0B19 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x20) != 0) {
    goto LABEL_42;
  }
LABEL_21:
  if ((*(_DWORD *)&v7 & 0x80000) != 0)
  {
LABEL_22:
    v5[34] = self->_version;
    v5[35] |= 0x80000u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_104;
  }
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  int v6 = *((_DWORD *)v4 + 35);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 7)) {
      goto LABEL_104;
    }
  }
  else if (v6)
  {
LABEL_104:
    BOOL v9 = 0;
    goto LABEL_105;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_psDuration != *((_DWORD *)v4 + 29)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_totalFachDuration != *((_DWORD *)v4 + 30)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_104;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_lastFachDuration != *((_DWORD *)v4 + 22)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_mrabDuration != *((_DWORD *)v4 + 28)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_lastUlInactiveDur != *((_DWORD *)v4 + 23)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_104;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_lastDlInactiveDur != *((_DWORD *)v4 + 21)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_104;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_aveUlThroughput != *((_DWORD *)v4 + 17)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_104;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_aveDlThroughput != *((_DWORD *)v4 + 16)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_maxUlThroughput != *((_DWORD *)v4 + 27)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_maxDlThroughput != *((_DWORD *)v4 + 25)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_maxUlRbRate != *((_DWORD *)v4 + 26)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_maxDlRbRate != *((_DWORD *)v4 + 24)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_ulActiveDur != *((_DWORD *)v4 + 31)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_104;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_dlActiveDur != *((_DWORD *)v4 + 18)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_ulRetxBlockRatePpt != *((_DWORD *)v4 + 32)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_104;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_dlBlerPpt != *((_DWORD *)v4 + 19)) {
      goto LABEL_104;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_104;
  }
  if (!PBRepeatedUInt32IsEqual() || !PBRepeatedUInt32IsEqual()) {
    goto LABEL_104;
  }
  $E76A4E3F312DA20721C84FD0B50D0B19 v7 = self->_has;
  int v8 = *((_DWORD *)v4 + 35);
  if ((*(_DWORD *)&v7 & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_ulTotalBytes != *((_DWORD *)v4 + 33)) {
      goto LABEL_104;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_104;
  }
  if ((*(unsigned char *)&v7 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_dlTotalBytes != *((_DWORD *)v4 + 20)) {
      goto LABEL_104;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_DWORD *)&v7 & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_version != *((_DWORD *)v4 + 34)) {
      goto LABEL_104;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (v8 & 0x80000) == 0;
  }
LABEL_105:

  return v9;
}

- (unint64_t)hash
{
  $E76A4E3F312DA20721C84FD0B50D0B19 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v27 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
LABEL_3:
      uint64_t v26 = 2654435761 * self->_psDuration;
      if ((*(_WORD *)&has & 0x8000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else
  {
    unint64_t v27 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v26 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    uint64_t v25 = 2654435761 * self->_totalFachDuration;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v25 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_5:
    uint64_t v24 = 2654435761 * self->_lastFachDuration;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v24 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    uint64_t v23 = 2654435761 * self->_mrabDuration;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v23 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v22 = 2654435761 * self->_lastUlInactiveDur;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v22 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v21 = 2654435761 * self->_lastDlInactiveDur;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v21 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_9:
    uint64_t v20 = 2654435761 * self->_aveUlThroughput;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_10:
    uint64_t v19 = 2654435761 * self->_aveDlThroughput;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v19 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_11:
    uint64_t v18 = 2654435761 * self->_maxUlThroughput;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v18 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    uint64_t v4 = 2654435761 * self->_maxDlThroughput;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_13:
    uint64_t v5 = 2654435761 * self->_maxUlRbRate;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v5 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_14:
    uint64_t v6 = 2654435761 * self->_maxDlRbRate;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_15:
    uint64_t v7 = 2654435761 * self->_ulActiveDur;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_16:
    uint64_t v8 = 2654435761 * self->_dlActiveDur;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_17;
    }
LABEL_34:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_18;
    }
    goto LABEL_35;
  }
LABEL_33:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x20000) == 0) {
    goto LABEL_34;
  }
LABEL_17:
  uint64_t v9 = 2654435761 * self->_ulRetxBlockRatePpt;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_18:
    uint64_t v10 = 2654435761 * self->_dlBlerPpt;
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v10 = 0;
LABEL_36:
  uint64_t v11 = PBRepeatedUInt32Hash();
  uint64_t v12 = PBRepeatedUInt32Hash();
  $E76A4E3F312DA20721C84FD0B50D0B19 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) == 0)
  {
    uint64_t v14 = 0;
    if ((*(unsigned char *)&v13 & 0x20) != 0) {
      goto LABEL_38;
    }
LABEL_41:
    uint64_t v15 = 0;
    if ((*(_DWORD *)&v13 & 0x80000) != 0) {
      goto LABEL_39;
    }
LABEL_42:
    uint64_t v16 = 0;
    return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
  }
  uint64_t v14 = 2654435761 * self->_ulTotalBytes;
  if ((*(unsigned char *)&v13 & 0x20) == 0) {
    goto LABEL_41;
  }
LABEL_38:
  uint64_t v15 = 2654435761 * self->_dlTotalBytes;
  if ((*(_DWORD *)&v13 & 0x80000) == 0) {
    goto LABEL_42;
  }
LABEL_39:
  uint64_t v16 = 2654435761 * self->_version;
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 35);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 7);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)v4 + 35);
    if ((v5 & 0x4000) == 0)
    {
LABEL_3:
      if ((v5 & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((v5 & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  self->_psDuration = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x8000) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_totalFachDuration = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_lastFachDuration = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x2000) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_mrabDuration = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_lastUlInactiveDur = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_lastDlInactiveDur = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_aveUlThroughput = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_aveDlThroughput = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x1000) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_maxUlThroughput = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_maxDlThroughput = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_maxUlRbRate = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x200) == 0)
  {
LABEL_14:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_maxDlRbRate = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x10000) == 0)
  {
LABEL_15:
    if ((v5 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_ulActiveDur = *((_DWORD *)v4 + 31);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 8) == 0)
  {
LABEL_16:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_dlActiveDur = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x20000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_47:
  self->_ulRetxBlockRatePpt = *((_DWORD *)v4 + 32);
  *(_DWORD *)&self->_has |= 0x20000u;
  if ((*((_DWORD *)v4 + 35) & 0x10) != 0)
  {
LABEL_18:
    self->_dlBlerPpt = *((_DWORD *)v4 + 19);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_19:
  $E76A4E3F312DA20721C84FD0B50D0B19 v13 = (unsigned int *)v4;
  uint64_t v6 = (char *)[v4 txPowerHistsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[CellularWcdmaRlcThroughput addTxPowerHist:](self, "addTxPowerHist:", [v13 txPowerHistAtIndex:i]);
  }
  uint64_t v9 = (char *)[v13 rxPowerHistsCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[CellularWcdmaRlcThroughput addRxPowerHist:](self, "addRxPowerHist:", [v13 rxPowerHistAtIndex:j]);
  }
  unsigned int v12 = v13[35];
  if ((v12 & 0x40000) != 0)
  {
    self->_ulTotalBytes = v13[33];
    *(_DWORD *)&self->_has |= 0x40000u;
    unsigned int v12 = v13[35];
    if ((v12 & 0x20) == 0)
    {
LABEL_27:
      if ((v12 & 0x80000) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((v12 & 0x20) == 0)
  {
    goto LABEL_27;
  }
  self->_dlTotalBytes = v13[20];
  *(_DWORD *)&self->_has |= 0x20u;
  if ((v13[35] & 0x80000) != 0)
  {
LABEL_28:
    self->_version = v13[34];
    *(_DWORD *)&self->_has |= 0x80000u;
  }
LABEL_29:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)psDuration
{
  return self->_psDuration;
}

- (unsigned)totalFachDuration
{
  return self->_totalFachDuration;
}

- (unsigned)lastFachDuration
{
  return self->_lastFachDuration;
}

- (unsigned)mrabDuration
{
  return self->_mrabDuration;
}

- (unsigned)lastUlInactiveDur
{
  return self->_lastUlInactiveDur;
}

- (unsigned)lastDlInactiveDur
{
  return self->_lastDlInactiveDur;
}

- (unsigned)aveUlThroughput
{
  return self->_aveUlThroughput;
}

- (unsigned)aveDlThroughput
{
  return self->_aveDlThroughput;
}

- (unsigned)maxUlThroughput
{
  return self->_maxUlThroughput;
}

- (unsigned)maxDlThroughput
{
  return self->_maxDlThroughput;
}

- (unsigned)maxUlRbRate
{
  return self->_maxUlRbRate;
}

- (unsigned)maxDlRbRate
{
  return self->_maxDlRbRate;
}

- (unsigned)ulActiveDur
{
  return self->_ulActiveDur;
}

- (unsigned)dlActiveDur
{
  return self->_dlActiveDur;
}

- (unsigned)ulRetxBlockRatePpt
{
  return self->_ulRetxBlockRatePpt;
}

- (unsigned)dlBlerPpt
{
  return self->_dlBlerPpt;
}

- (unsigned)ulTotalBytes
{
  return self->_ulTotalBytes;
}

- (unsigned)dlTotalBytes
{
  return self->_dlTotalBytes;
}

- (unsigned)version
{
  return self->_version;
}

@end