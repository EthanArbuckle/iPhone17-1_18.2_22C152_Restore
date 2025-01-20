@interface CellularCdmaTxRxHist
- (BOOL)hasBand;
- (BOOL)hasDuration;
- (BOOL)hasHdrRx0IdleCountAll;
- (BOOL)hasHdrRx0TrafficCountAll;
- (BOOL)hasHdrRx1TrafficCountAll;
- (BOOL)hasHdrTxTrafficCountAll;
- (BOOL)hasRx0IdleCountAll;
- (BOOL)hasRx0TrafficCountAll;
- (BOOL)hasRx1TrafficCountAll;
- (BOOL)hasTimestamp;
- (BOOL)hasTxTrafficCountAll;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)bandAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsBand:(id)a3;
- (int)band;
- (unint64_t)hash;
- (unint64_t)hdrRx0IdleCountsCount;
- (unint64_t)hdrRx0TrafficCountsCount;
- (unint64_t)hdrRx1TrafficCountsCount;
- (unint64_t)hdrTxTrafficCountsCount;
- (unint64_t)rx0IdleCountsCount;
- (unint64_t)rx0TrafficCountsCount;
- (unint64_t)rx1TrafficCountsCount;
- (unint64_t)timestamp;
- (unint64_t)txTrafficCountsCount;
- (unsigned)duration;
- (unsigned)hdrRx0IdleCountAll;
- (unsigned)hdrRx0IdleCountAtIndex:(unint64_t)a3;
- (unsigned)hdrRx0IdleCounts;
- (unsigned)hdrRx0TrafficCountAll;
- (unsigned)hdrRx0TrafficCountAtIndex:(unint64_t)a3;
- (unsigned)hdrRx0TrafficCounts;
- (unsigned)hdrRx1TrafficCountAll;
- (unsigned)hdrRx1TrafficCountAtIndex:(unint64_t)a3;
- (unsigned)hdrRx1TrafficCounts;
- (unsigned)hdrTxTrafficCountAll;
- (unsigned)hdrTxTrafficCountAtIndex:(unint64_t)a3;
- (unsigned)hdrTxTrafficCounts;
- (unsigned)rx0IdleCountAll;
- (unsigned)rx0IdleCountAtIndex:(unint64_t)a3;
- (unsigned)rx0IdleCounts;
- (unsigned)rx0TrafficCountAll;
- (unsigned)rx0TrafficCountAtIndex:(unint64_t)a3;
- (unsigned)rx0TrafficCounts;
- (unsigned)rx1TrafficCountAll;
- (unsigned)rx1TrafficCountAtIndex:(unint64_t)a3;
- (unsigned)rx1TrafficCounts;
- (unsigned)txTrafficCountAll;
- (unsigned)txTrafficCountAtIndex:(unint64_t)a3;
- (unsigned)txTrafficCounts;
- (void)addHdrRx0IdleCount:(unsigned int)a3;
- (void)addHdrRx0TrafficCount:(unsigned int)a3;
- (void)addHdrRx1TrafficCount:(unsigned int)a3;
- (void)addHdrTxTrafficCount:(unsigned int)a3;
- (void)addRx0IdleCount:(unsigned int)a3;
- (void)addRx0TrafficCount:(unsigned int)a3;
- (void)addRx1TrafficCount:(unsigned int)a3;
- (void)addTxTrafficCount:(unsigned int)a3;
- (void)clearHdrRx0IdleCounts;
- (void)clearHdrRx0TrafficCounts;
- (void)clearHdrRx1TrafficCounts;
- (void)clearHdrTxTrafficCounts;
- (void)clearRx0IdleCounts;
- (void)clearRx0TrafficCounts;
- (void)clearRx1TrafficCounts;
- (void)clearTxTrafficCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBand:(int)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasBand:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasHdrRx0IdleCountAll:(BOOL)a3;
- (void)setHasHdrRx0TrafficCountAll:(BOOL)a3;
- (void)setHasHdrRx1TrafficCountAll:(BOOL)a3;
- (void)setHasHdrTxTrafficCountAll:(BOOL)a3;
- (void)setHasRx0IdleCountAll:(BOOL)a3;
- (void)setHasRx0TrafficCountAll:(BOOL)a3;
- (void)setHasRx1TrafficCountAll:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTxTrafficCountAll:(BOOL)a3;
- (void)setHdrRx0IdleCountAll:(unsigned int)a3;
- (void)setHdrRx0IdleCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHdrRx0TrafficCountAll:(unsigned int)a3;
- (void)setHdrRx0TrafficCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHdrRx1TrafficCountAll:(unsigned int)a3;
- (void)setHdrRx1TrafficCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHdrTxTrafficCountAll:(unsigned int)a3;
- (void)setHdrTxTrafficCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRx0IdleCountAll:(unsigned int)a3;
- (void)setRx0IdleCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRx0TrafficCountAll:(unsigned int)a3;
- (void)setRx0TrafficCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRx1TrafficCountAll:(unsigned int)a3;
- (void)setRx1TrafficCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxTrafficCountAll:(unsigned int)a3;
- (void)setTxTrafficCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation CellularCdmaTxRxHist

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
  v3.super_class = (Class)CellularCdmaTxRxHist;
  [(CellularCdmaTxRxHist *)&v3 dealloc];
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
  *(_WORD *)&self->_has |= 4u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRx0IdleCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rx0IdleCountAll = a3;
}

- (void)setHasRx0IdleCountAll:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRx0IdleCountAll
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRx0TrafficCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rx0TrafficCountAll = a3;
}

- (void)setHasRx0TrafficCountAll:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRx0TrafficCountAll
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRx1TrafficCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rx1TrafficCountAll = a3;
}

- (void)setHasRx1TrafficCountAll:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRx1TrafficCountAll
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTxTrafficCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_txTrafficCountAll = a3;
}

- (void)setHasTxTrafficCountAll:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTxTrafficCountAll
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (unint64_t)rx0IdleCountsCount
{
  return self->_rx0IdleCounts.count;
}

- (unsigned)rx0IdleCounts
{
  return self->_rx0IdleCounts.list;
}

- (void)clearRx0IdleCounts
{
}

- (void)addRx0IdleCount:(unsigned int)a3
{
}

- (unsigned)rx0IdleCountAtIndex:(unint64_t)a3
{
  p_rx0IdleCounts = &self->_rx0IdleCounts;
  unint64_t count = self->_rx0IdleCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rx0IdleCounts->list[a3];
}

- (void)setRx0IdleCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rx0TrafficCountsCount
{
  return self->_rx0TrafficCounts.count;
}

- (unsigned)rx0TrafficCounts
{
  return self->_rx0TrafficCounts.list;
}

- (void)clearRx0TrafficCounts
{
}

- (void)addRx0TrafficCount:(unsigned int)a3
{
}

- (unsigned)rx0TrafficCountAtIndex:(unint64_t)a3
{
  p_rx0TrafficCounts = &self->_rx0TrafficCounts;
  unint64_t count = self->_rx0TrafficCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rx0TrafficCounts->list[a3];
}

- (void)setRx0TrafficCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rx1TrafficCountsCount
{
  return self->_rx1TrafficCounts.count;
}

- (unsigned)rx1TrafficCounts
{
  return self->_rx1TrafficCounts.list;
}

- (void)clearRx1TrafficCounts
{
}

- (void)addRx1TrafficCount:(unsigned int)a3
{
}

- (unsigned)rx1TrafficCountAtIndex:(unint64_t)a3
{
  p_rx1TrafficCounts = &self->_rx1TrafficCounts;
  unint64_t count = self->_rx1TrafficCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rx1TrafficCounts->list[a3];
}

- (void)setRx1TrafficCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txTrafficCountsCount
{
  return self->_txTrafficCounts.count;
}

- (unsigned)txTrafficCounts
{
  return self->_txTrafficCounts.list;
}

- (void)clearTxTrafficCounts
{
}

- (void)addTxTrafficCount:(unsigned int)a3
{
}

- (unsigned)txTrafficCountAtIndex:(unint64_t)a3
{
  p_txTrafficCounts = &self->_txTrafficCounts;
  unint64_t count = self->_txTrafficCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_txTrafficCounts->list[a3];
}

- (void)setTxTrafficCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setHdrRx0IdleCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_hdrRx0IdleCountAll = a3;
}

- (void)setHasHdrRx0IdleCountAll:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHdrRx0IdleCountAll
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHdrRx0TrafficCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_hdrRx0TrafficCountAll = a3;
}

- (void)setHasHdrRx0TrafficCountAll:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHdrRx0TrafficCountAll
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHdrRx1TrafficCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_hdrRx1TrafficCountAll = a3;
}

- (void)setHasHdrRx1TrafficCountAll:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHdrRx1TrafficCountAll
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHdrTxTrafficCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_hdrTxTrafficCountAll = a3;
}

- (void)setHasHdrTxTrafficCountAll:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasHdrTxTrafficCountAll
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (unint64_t)hdrRx0IdleCountsCount
{
  return self->_hdrRx0IdleCounts.count;
}

- (unsigned)hdrRx0IdleCounts
{
  return self->_hdrRx0IdleCounts.list;
}

- (void)clearHdrRx0IdleCounts
{
}

- (void)addHdrRx0IdleCount:(unsigned int)a3
{
}

- (unsigned)hdrRx0IdleCountAtIndex:(unint64_t)a3
{
  p_hdrRx0IdleCounts = &self->_hdrRx0IdleCounts;
  unint64_t count = self->_hdrRx0IdleCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_hdrRx0IdleCounts->list[a3];
}

- (void)setHdrRx0IdleCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)hdrRx0TrafficCountsCount
{
  return self->_hdrRx0TrafficCounts.count;
}

- (unsigned)hdrRx0TrafficCounts
{
  return self->_hdrRx0TrafficCounts.list;
}

- (void)clearHdrRx0TrafficCounts
{
}

- (void)addHdrRx0TrafficCount:(unsigned int)a3
{
}

- (unsigned)hdrRx0TrafficCountAtIndex:(unint64_t)a3
{
  p_hdrRx0TrafficCounts = &self->_hdrRx0TrafficCounts;
  unint64_t count = self->_hdrRx0TrafficCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_hdrRx0TrafficCounts->list[a3];
}

- (void)setHdrRx0TrafficCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)hdrRx1TrafficCountsCount
{
  return self->_hdrRx1TrafficCounts.count;
}

- (unsigned)hdrRx1TrafficCounts
{
  return self->_hdrRx1TrafficCounts.list;
}

- (void)clearHdrRx1TrafficCounts
{
}

- (void)addHdrRx1TrafficCount:(unsigned int)a3
{
}

- (unsigned)hdrRx1TrafficCountAtIndex:(unint64_t)a3
{
  p_hdrRx1TrafficCounts = &self->_hdrRx1TrafficCounts;
  unint64_t count = self->_hdrRx1TrafficCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_hdrRx1TrafficCounts->list[a3];
}

- (void)setHdrRx1TrafficCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)hdrTxTrafficCountsCount
{
  return self->_hdrTxTrafficCounts.count;
}

- (unsigned)hdrTxTrafficCounts
{
  return self->_hdrTxTrafficCounts.list;
}

- (void)clearHdrTxTrafficCounts
{
}

- (void)addHdrTxTrafficCount:(unsigned int)a3
{
}

- (unsigned)hdrTxTrafficCountAtIndex:(unint64_t)a3
{
  p_hdrTxTrafficCounts = &self->_hdrTxTrafficCounts;
  unint64_t count = self->_hdrTxTrafficCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_hdrTxTrafficCounts->list[a3];
}

- (void)setHdrTxTrafficCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (int)band
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_band;
  }
  else {
    return 0;
  }
}

- (void)setBand:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBand
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)bandAsString:(int)a3
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

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularCdmaTxRxHist;
  id v3 = [(CellularCdmaTxRxHist *)&v7 description];
  int v4 = [(CellularCdmaTxRxHist *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v18 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v18 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  v19 = +[NSNumber numberWithUnsignedInt:self->_duration];
  [v3 setObject:v19 forKey:@"duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v20 = +[NSNumber numberWithUnsignedInt:self->_rx0IdleCountAll];
  [v3 setObject:v20 forKey:@"rx0_idle_count_all"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v21 = +[NSNumber numberWithUnsignedInt:self->_rx0TrafficCountAll];
  [v3 setObject:v21 forKey:@"rx0_traffic_count_all"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_20:
  v22 = +[NSNumber numberWithUnsignedInt:self->_rx1TrafficCountAll];
  [v3 setObject:v22 forKey:@"rx1_traffic_count_all"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    v5 = +[NSNumber numberWithUnsignedInt:self->_txTrafficCountAll];
    [v3 setObject:v5 forKey:@"tx_traffic_count_all"];
  }
LABEL_8:
  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"rx0_idle_count"];

  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"rx0_traffic_count"];

  v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"rx1_traffic_count"];

  v9 = PBRepeatedUInt32NSArray();
  [v3 setObject:v9 forKey:@"tx_traffic_count"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    v23 = +[NSNumber numberWithUnsignedInt:self->_hdrRx0IdleCountAll];
    [v3 setObject:v23 forKey:@"hdr_rx0_idle_count_all"];

    __int16 v10 = (__int16)self->_has;
    if ((v10 & 0x10) == 0)
    {
LABEL_10:
      if ((v10 & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_24;
    }
  }
  else if ((v10 & 0x10) == 0)
  {
    goto LABEL_10;
  }
  v24 = +[NSNumber numberWithUnsignedInt:self->_hdrRx0TrafficCountAll];
  [v3 setObject:v24 forKey:@"hdr_rx0_traffic_count_all"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_11:
    if ((v10 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_24:
  v25 = +[NSNumber numberWithUnsignedInt:self->_hdrRx1TrafficCountAll];
  [v3 setObject:v25 forKey:@"hdr_rx1_traffic_count_all"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    v11 = +[NSNumber numberWithUnsignedInt:self->_hdrTxTrafficCountAll];
    [v3 setObject:v11 forKey:@"hdr_tx_traffic_count_all"];
  }
LABEL_13:
  v12 = PBRepeatedUInt32NSArray();
  [v3 setObject:v12 forKey:@"hdr_rx0_idle_count"];

  v13 = PBRepeatedUInt32NSArray();
  [v3 setObject:v13 forKey:@"hdr_rx0_traffic_count"];

  v14 = PBRepeatedUInt32NSArray();
  [v3 setObject:v14 forKey:@"hdr_rx1_traffic_count"];

  v15 = PBRepeatedUInt32NSArray();
  [v3 setObject:v15 forKey:@"hdr_tx_traffic_count"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    uint64_t band = self->_band;
    v17 = @"SYS_BAND_BC0";
    switch((int)band)
    {
      case 0:
        break;
      case 1:
        v17 = @"SYS_BAND_BC1";
        break;
      case 3:
        v17 = @"SYS_BAND_BC3";
        break;
      case 4:
        v17 = @"SYS_BAND_BC4";
        break;
      case 5:
        v17 = @"SYS_BAND_BC5";
        break;
      case 6:
        v17 = @"SYS_BAND_BC6";
        break;
      case 7:
        v17 = @"SYS_BAND_BC7";
        break;
      case 8:
        v17 = @"SYS_BAND_BC8";
        break;
      case 9:
        v17 = @"SYS_BAND_BC9";
        break;
      case 10:
        v17 = @"SYS_BAND_BC10";
        break;
      case 11:
        v17 = @"SYS_BAND_BC11";
        break;
      case 12:
        v17 = @"SYS_BAND_BC12";
        break;
      case 13:
        v17 = @"SYS_BAND_BC13";
        break;
      case 14:
        v17 = @"SYS_BAND_BC14";
        break;
      case 15:
        v17 = @"SYS_BAND_BC15";
        break;
      case 16:
        v17 = @"SYS_BAND_BC16";
        break;
      case 17:
        v17 = @"SYS_BAND_BC17";
        break;
      case 18:
        v17 = @"SYS_BAND_BC18";
        break;
      case 19:
        v17 = @"SYS_BAND_BC19";
        break;
      case 40:
        v17 = @"SYS_BAND_GSM_450";
        break;
      case 41:
        v17 = @"SYS_BAND_GSM_480";
        break;
      case 42:
        v17 = @"SYS_BAND_GSM_750";
        break;
      case 43:
        v17 = @"SYS_BAND_GSM_850";
        break;
      case 44:
        v17 = @"SYS_BAND_GSM_EGSM_900";
        break;
      case 45:
        v17 = @"SYS_BAND_GSM_PGSM_900";
        break;
      case 46:
        v17 = @"SYS_BAND_GSM_RGSM_900";
        break;
      case 47:
        v17 = @"SYS_BAND_GSM_DCS_1800";
        break;
      case 48:
        v17 = @"SYS_BAND_GSM_PCS_1900";
        break;
      case 80:
        v17 = @"SYS_BAND_WCDMA_I_IMT_2000";
        break;
      case 81:
        v17 = @"SYS_BAND_WCDMA_II_PCS_1900";
        break;
      case 82:
        v17 = @"SYS_BAND_WCDMA_III_1700";
        break;
      case 83:
        v17 = @"SYS_BAND_WCDMA_IV_1700";
        break;
      case 84:
        v17 = @"SYS_BAND_WCDMA_V_850";
        break;
      case 85:
        v17 = @"SYS_BAND_WCDMA_VI_800";
        break;
      case 86:
        v17 = @"SYS_BAND_WCDMA_VII_2600";
        break;
      case 87:
        v17 = @"SYS_BAND_WCDMA_VIII_900";
        break;
      case 88:
        v17 = @"SYS_BAND_WCDMA_IX_1700";
        break;
      case 90:
        v17 = @"SYS_BAND_WCDMA_XI_1500";
        break;
      case 91:
        v17 = @"SYS_BAND_WCDMA_XIX_850";
        break;
      case 120:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND1";
        break;
      case 121:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND2";
        break;
      case 122:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND3";
        break;
      case 123:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND4";
        break;
      case 124:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND5";
        break;
      case 125:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND6";
        break;
      case 126:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND7";
        break;
      case 127:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND8";
        break;
      case 128:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND9";
        break;
      case 129:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND10";
        break;
      case 130:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND11";
        break;
      case 131:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND12";
        break;
      case 132:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND13";
        break;
      case 133:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND14";
        break;
      case 136:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND17";
        break;
      case 137:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND18";
        break;
      case 138:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND19";
        break;
      case 139:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND20";
        break;
      case 140:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND21";
        break;
      case 143:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND24";
        break;
      case 144:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND25";
        break;
      case 145:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND26";
        break;
      case 152:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND33";
        break;
      case 153:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND34";
        break;
      case 154:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND35";
        break;
      case 155:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND36";
        break;
      case 156:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND37";
        break;
      case 157:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND38";
        break;
      case 158:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND39";
        break;
      case 159:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND40";
        break;
      case 160:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND41";
        break;
      case 161:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND42";
        break;
      case 162:
        v17 = @"SYS_BAND_LTE_EUTRAN_BAND43";
        break;
      case 163:
        v17 = @"SYS_BAND_UMTS_BAND1";
        break;
      case 164:
        v17 = @"SYS_BAND_UMTS_BAND2";
        break;
      case 165:
        v17 = @"SYS_BAND_UMTS_BAND3";
        break;
      case 166:
        v17 = @"SYS_BAND_UMTS_BAND4";
        break;
      case 167:
        v17 = @"SYS_BAND_UMTS_BAND5";
        break;
      case 168:
        v17 = @"SYS_BAND_UMTS_BAND6";
        break;
      default:
        v17 = +[NSString stringWithFormat:@"(unknown: %i)", band];
        break;
    }
    [v3 setObject:v17 forKey:@"band"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005642C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_58;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
  if (self->_rx0IdleCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rx0IdleCounts.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_rx0IdleCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_rx0TrafficCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rx0TrafficCounts.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_rx0TrafficCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_rx1TrafficCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rx1TrafficCounts.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < self->_rx1TrafficCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_txTrafficCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_txTrafficCounts.count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v9 < self->_txTrafficCounts.count);
    }
    PBDataWriterRecallMark();
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 0x10) == 0)
    {
LABEL_30:
      if ((v10 & 0x20) == 0) {
        goto LABEL_31;
      }
      goto LABEL_64;
    }
  }
  else if ((v10 & 0x10) == 0)
  {
    goto LABEL_30;
  }
  PBDataWriterWriteUint32Field();
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_31:
    if ((v10 & 0x40) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_32:
  }
    PBDataWriterWriteUint32Field();
LABEL_33:
  if (self->_hdrRx0IdleCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_hdrRx0IdleCounts.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v11;
      }
      while (v11 < self->_hdrRx0IdleCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_hdrRx0TrafficCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_hdrRx0TrafficCounts.count)
    {
      unint64_t v12 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v12;
      }
      while (v12 < self->_hdrRx0TrafficCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_hdrRx1TrafficCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_hdrRx1TrafficCounts.count)
    {
      unint64_t v13 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v13;
      }
      while (v13 < self->_hdrRx1TrafficCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_hdrTxTrafficCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_hdrTxTrafficCounts.count)
    {
      unint64_t v14 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v14;
      }
      while (v14 < self->_hdrTxTrafficCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(_WORD *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[25] = self->_timestamp;
    *((_WORD *)v4 + 124) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_52;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 53) = self->_duration;
  *((_WORD *)v4 + 124) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 58) = self->_rx0IdleCountAll;
  *((_WORD *)v4 + 124) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
LABEL_54:
    *((_DWORD *)v4 + 60) = self->_rx1TrafficCountAll;
    *((_WORD *)v4 + 124) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_53:
  *((_DWORD *)v4 + 59) = self->_rx0TrafficCountAll;
  *((_WORD *)v4 + 124) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_54;
  }
LABEL_6:
  if ((has & 0x400) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 61) = self->_txTrafficCountAll;
    *((_WORD *)v4 + 124) |= 0x400u;
  }
LABEL_8:
  id v31 = v4;
  if ([(CellularCdmaTxRxHist *)self rx0IdleCountsCount])
  {
    [v31 clearRx0IdleCounts];
    unint64_t v6 = [(CellularCdmaTxRxHist *)self rx0IdleCountsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v31 addRx0IdleCount:[self rx0IdleCountAtIndex:i]];
    }
  }
  if ([(CellularCdmaTxRxHist *)self rx0TrafficCountsCount])
  {
    [v31 clearRx0TrafficCounts];
    unint64_t v9 = [(CellularCdmaTxRxHist *)self rx0TrafficCountsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [v31 addRx0TrafficCount:[self rx0TrafficCountAtIndex:j]];
    }
  }
  if ([(CellularCdmaTxRxHist *)self rx1TrafficCountsCount])
  {
    [v31 clearRx1TrafficCounts];
    unint64_t v12 = [(CellularCdmaTxRxHist *)self rx1TrafficCountsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        [v31 addRx1TrafficCount:[self rx1TrafficCountAtIndex:k]];
    }
  }
  if ([(CellularCdmaTxRxHist *)self txTrafficCountsCount])
  {
    [v31 clearTxTrafficCounts];
    unint64_t v15 = [(CellularCdmaTxRxHist *)self txTrafficCountsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        [v31 addTxTrafficCount:[self txTrafficCountAtIndex:m]];
    }
  }
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 8) != 0)
  {
    *((_DWORD *)v31 + 54) = self->_hdrRx0IdleCountAll;
    *((_WORD *)v31 + 124) |= 8u;
    __int16 v18 = (__int16)self->_has;
    if ((v18 & 0x10) == 0)
    {
LABEL_26:
      if ((v18 & 0x20) == 0) {
        goto LABEL_27;
      }
LABEL_58:
      *((_DWORD *)v31 + 56) = self->_hdrRx1TrafficCountAll;
      *((_WORD *)v31 + 124) |= 0x20u;
      if ((*(_WORD *)&self->_has & 0x40) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((v18 & 0x10) == 0)
  {
    goto LABEL_26;
  }
  *((_DWORD *)v31 + 55) = self->_hdrRx0TrafficCountAll;
  *((_WORD *)v31 + 124) |= 0x10u;
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x20) != 0) {
    goto LABEL_58;
  }
LABEL_27:
  if ((v18 & 0x40) != 0)
  {
LABEL_28:
    *((_DWORD *)v31 + 57) = self->_hdrTxTrafficCountAll;
    *((_WORD *)v31 + 124) |= 0x40u;
  }
LABEL_29:
  if ([(CellularCdmaTxRxHist *)self hdrRx0IdleCountsCount])
  {
    [v31 clearHdrRx0IdleCounts];
    unint64_t v19 = [(CellularCdmaTxRxHist *)self hdrRx0IdleCountsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t n = 0; n != v20; ++n)
        [v31 addHdrRx0IdleCount:[self hdrRx0IdleCountAtIndex:n]];
    }
  }
  if ([(CellularCdmaTxRxHist *)self hdrRx0TrafficCountsCount])
  {
    [v31 clearHdrRx0TrafficCounts];
    unint64_t v22 = [(CellularCdmaTxRxHist *)self hdrRx0TrafficCountsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (iuint64_t i = 0; ii != v23; ++ii)
        [v31 addHdrRx0TrafficCount:[self hdrRx0TrafficCountAtIndex:ii]];
    }
  }
  if ([(CellularCdmaTxRxHist *)self hdrRx1TrafficCountsCount])
  {
    [v31 clearHdrRx1TrafficCounts];
    unint64_t v25 = [(CellularCdmaTxRxHist *)self hdrRx1TrafficCountsCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (juint64_t j = 0; jj != v26; ++jj)
        [v31 addHdrRx1TrafficCount:[self hdrRx1TrafficCountAtIndex:jj]];
    }
  }
  if ([(CellularCdmaTxRxHist *)self hdrTxTrafficCountsCount])
  {
    [v31 clearHdrTxTrafficCounts];
    unint64_t v28 = [(CellularCdmaTxRxHist *)self hdrTxTrafficCountsCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (kuint64_t k = 0; kk != v29; ++kk)
        [v31 addHdrTxTrafficCount:[self hdrTxTrafficCountAtIndex:kk]];
    }
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v31 + 52) = self->_band;
    *((_WORD *)v31 + 124) |= 2u;
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
    *((_WORD *)v4 + 124) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 53) = self->_duration;
  *((_WORD *)v4 + 124) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 58) = self->_rx0IdleCountAll;
  *((_WORD *)v4 + 124) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 59) = self->_rx0TrafficCountAll;
  *((_WORD *)v4 + 124) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_20:
  *((_DWORD *)v4 + 60) = self->_rx1TrafficCountAll;
  *((_WORD *)v4 + 124) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 61) = self->_txTrafficCountAll;
    *((_WORD *)v4 + 124) |= 0x400u;
  }
LABEL_8:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    v5[54] = self->_hdrRx0IdleCountAll;
    *((_WORD *)v5 + 124) |= 8u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_10:
      if ((v7 & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_24;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_10;
  }
  v5[55] = self->_hdrRx0TrafficCountAll;
  *((_WORD *)v5 + 124) |= 0x10u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x20) == 0)
  {
LABEL_11:
    if ((v7 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_24:
  v5[56] = self->_hdrRx1TrafficCountAll;
  *((_WORD *)v5 + 124) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    v5[57] = self->_hdrTxTrafficCountAll;
    *((_WORD *)v5 + 124) |= 0x40u;
  }
LABEL_13:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v5[52] = self->_band;
    *((_WORD *)v5 + 124) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_65;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 124);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 25)) {
      goto LABEL_65;
    }
  }
  else if (v6)
  {
LABEL_65:
    BOOL v10 = 0;
    goto LABEL_66;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_duration != *((_DWORD *)v4 + 53)) {
      goto LABEL_65;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_rx0IdleCountAll != *((_DWORD *)v4 + 58)) {
      goto LABEL_65;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 124) & 0x100) == 0 || self->_rx0TrafficCountAll != *((_DWORD *)v4 + 59)) {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 124) & 0x100) != 0)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 124) & 0x200) == 0 || self->_rx1TrafficCountAll != *((_DWORD *)v4 + 60)) {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 124) & 0x200) != 0)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 124) & 0x400) == 0 || self->_txTrafficCountAll != *((_DWORD *)v4 + 61)) {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 124) & 0x400) != 0)
  {
    goto LABEL_65;
  }
  if (!PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_65;
  }
  __int16 v7 = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 124);
  if ((v7 & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_hdrRx0IdleCountAll != *((_DWORD *)v4 + 54)) {
      goto LABEL_65;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_65;
  }
  if ((v7 & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_hdrRx0TrafficCountAll != *((_DWORD *)v4 + 55)) {
      goto LABEL_65;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  if ((v7 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_hdrRx1TrafficCountAll != *((_DWORD *)v4 + 56)) {
      goto LABEL_65;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_65;
  }
  if ((v7 & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_hdrTxTrafficCountAll != *((_DWORD *)v4 + 57)) {
      goto LABEL_65;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_65;
  }
  if (!PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_65;
  }
  __int16 v9 = *((_WORD *)v4 + 124);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_band != *((_DWORD *)v4 + 52)) {
      goto LABEL_65;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = (v9 & 2) == 0;
  }
LABEL_66:

  return v10;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v24 = 2654435761u * self->_timestamp;
    if ((has & 4) != 0)
    {
LABEL_3:
      uint64_t v23 = 2654435761 * self->_duration;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v24 = 0;
    if ((has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v23 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v22 = 2654435761 * self->_rx0IdleCountAll;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v22 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v21 = 2654435761 * self->_rx0TrafficCountAll;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v20 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v21 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v20 = 2654435761 * self->_rx1TrafficCountAll;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    uint64_t v19 = 2654435761 * self->_txTrafficCountAll;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v19 = 0;
LABEL_14:
  uint64_t v18 = PBRepeatedUInt32Hash();
  uint64_t v17 = PBRepeatedUInt32Hash();
  uint64_t v16 = PBRepeatedUInt32Hash();
  uint64_t v15 = PBRepeatedUInt32Hash();
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_hdrRx0IdleCountAll;
    if ((v4 & 0x10) != 0)
    {
LABEL_16:
      uint64_t v6 = 2654435761 * self->_hdrRx0TrafficCountAll;
      if ((v4 & 0x20) != 0) {
        goto LABEL_17;
      }
LABEL_21:
      uint64_t v7 = 0;
      if ((v4 & 0x40) != 0) {
        goto LABEL_18;
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((v4 & 0x10) != 0) {
      goto LABEL_16;
    }
  }
  uint64_t v6 = 0;
  if ((v4 & 0x20) == 0) {
    goto LABEL_21;
  }
LABEL_17:
  uint64_t v7 = 2654435761 * self->_hdrRx1TrafficCountAll;
  if ((v4 & 0x40) != 0)
  {
LABEL_18:
    uint64_t v8 = 2654435761 * self->_hdrTxTrafficCountAll;
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v8 = 0;
LABEL_23:
  uint64_t v9 = PBRepeatedUInt32Hash();
  uint64_t v10 = PBRepeatedUInt32Hash();
  uint64_t v11 = PBRepeatedUInt32Hash();
  uint64_t v12 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_has & 2) != 0) {
    uint64_t v13 = 2654435761 * self->_band;
  }
  else {
    uint64_t v13 = 0;
  }
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 124);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 25);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 124);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_44;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_duratiouint64_t n = *((_DWORD *)v4 + 53);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 124);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_rx0IdleCountAll = *((_DWORD *)v4 + 58);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 124);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_rx0TrafficCountAll = *((_DWORD *)v4 + 59);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 124);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_46:
  self->_rx1TrafficCountAll = *((_DWORD *)v4 + 60);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 124) & 0x400) != 0)
  {
LABEL_7:
    self->_txTrafficCountAll = *((_DWORD *)v4 + 61);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_8:
  id v31 = v4;
  uint64_t v6 = (char *)[v4 rx0IdleCountsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[CellularCdmaTxRxHist addRx0IdleCount:](self, "addRx0IdleCount:", [v31 rx0IdleCountAtIndex:i]);
  }
  uint64_t v9 = (char *)[v31 rx0TrafficCountsCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[CellularCdmaTxRxHist addRx0TrafficCount:](self, "addRx0TrafficCount:", [v31 rx0TrafficCountAtIndex:j]);
  }
  uint64_t v12 = (char *)[v31 rx1TrafficCountsCount];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t k = 0; k != v13; ++k)
      -[CellularCdmaTxRxHist addRx1TrafficCount:](self, "addRx1TrafficCount:", [v31 rx1TrafficCountAtIndex:k]);
  }
  uint64_t v15 = (char *)[v31 txTrafficCountsCount];
  if (v15)
  {
    uint64_t v16 = v15;
    for (uint64_t m = 0; m != v16; ++m)
      -[CellularCdmaTxRxHist addTxTrafficCount:](self, "addTxTrafficCount:", [v31 txTrafficCountAtIndex:m]);
  }
  __int16 v18 = *((_WORD *)v31 + 124);
  if ((v18 & 8) != 0)
  {
    self->_hdrRx0IdleCountAll = *((_DWORD *)v31 + 54);
    *(_WORD *)&self->_has |= 8u;
    __int16 v18 = *((_WORD *)v31 + 124);
    if ((v18 & 0x10) == 0)
    {
LABEL_22:
      if ((v18 & 0x20) == 0) {
        goto LABEL_23;
      }
      goto LABEL_50;
    }
  }
  else if ((v18 & 0x10) == 0)
  {
    goto LABEL_22;
  }
  self->_hdrRx0TrafficCountAll = *((_DWORD *)v31 + 55);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v18 = *((_WORD *)v31 + 124);
  if ((v18 & 0x20) == 0)
  {
LABEL_23:
    if ((v18 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_50:
  self->_hdrRx1TrafficCountAll = *((_DWORD *)v31 + 56);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v31 + 124) & 0x40) != 0)
  {
LABEL_24:
    self->_hdrTxTrafficCountAll = *((_DWORD *)v31 + 57);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_25:
  uint64_t v19 = (char *)[v31 hdrRx0IdleCountsCount];
  if (v19)
  {
    uint64_t v20 = v19;
    for (uint64_t n = 0; n != v20; ++n)
      -[CellularCdmaTxRxHist addHdrRx0IdleCount:](self, "addHdrRx0IdleCount:", [v31 hdrRx0IdleCountAtIndex:n]);
  }
  uint64_t v22 = (char *)[v31 hdrRx0TrafficCountsCount];
  if (v22)
  {
    uint64_t v23 = v22;
    for (iuint64_t i = 0; ii != v23; ++ii)
      -[CellularCdmaTxRxHist addHdrRx0TrafficCount:](self, "addHdrRx0TrafficCount:", [v31 hdrRx0TrafficCountAtIndex:ii]);
  }
  unint64_t v25 = (char *)[v31 hdrRx1TrafficCountsCount];
  if (v25)
  {
    unint64_t v26 = v25;
    for (juint64_t j = 0; jj != v26; ++jj)
      -[CellularCdmaTxRxHist addHdrRx1TrafficCount:](self, "addHdrRx1TrafficCount:", [v31 hdrRx1TrafficCountAtIndex:jj]);
  }
  unint64_t v28 = (char *)[v31 hdrTxTrafficCountsCount];
  if (v28)
  {
    unint64_t v29 = v28;
    for (kuint64_t k = 0; kk != v29; ++kk)
      -[CellularCdmaTxRxHist addHdrTxTrafficCount:](self, "addHdrTxTrafficCount:", [v31 hdrTxTrafficCountAtIndex:kk]);
  }
  if ((*((_WORD *)v31 + 124) & 2) != 0)
  {
    self->_uint64_t band = *((_DWORD *)v31 + 52);
    *(_WORD *)&self->_has |= 2u;
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

- (unsigned)rx0IdleCountAll
{
  return self->_rx0IdleCountAll;
}

- (unsigned)rx0TrafficCountAll
{
  return self->_rx0TrafficCountAll;
}

- (unsigned)rx1TrafficCountAll
{
  return self->_rx1TrafficCountAll;
}

- (unsigned)txTrafficCountAll
{
  return self->_txTrafficCountAll;
}

- (unsigned)hdrRx0IdleCountAll
{
  return self->_hdrRx0IdleCountAll;
}

- (unsigned)hdrRx0TrafficCountAll
{
  return self->_hdrRx0TrafficCountAll;
}

- (unsigned)hdrRx1TrafficCountAll
{
  return self->_hdrRx1TrafficCountAll;
}

- (unsigned)hdrTxTrafficCountAll
{
  return self->_hdrTxTrafficCountAll;
}

@end