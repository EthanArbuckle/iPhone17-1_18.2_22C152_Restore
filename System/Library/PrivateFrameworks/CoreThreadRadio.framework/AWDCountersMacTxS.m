@interface AWDCountersMacTxS
- (BOOL)hasCslLossOfSyncDueToCslTimeout;
- (BOOL)hasCslLossOfSyncDueToMaxRetx;
- (BOOL)hasCslTxErrAbort;
- (BOOL)hasCslTxErrBusyChannel;
- (BOOL)hasCslTxErrCca;
- (BOOL)hasCslTxErrNoack;
- (BOOL)hasCslTxTotal;
- (BOOL)hasTxBroadcast;
- (BOOL)hasTxData;
- (BOOL)hasTxDirectMaxRetryExpiry;
- (BOOL)hasTxErrAbort;
- (BOOL)hasTxErrAbortPercentage;
- (BOOL)hasTxErrBusyChannel;
- (BOOL)hasTxErrBusyChannelPercentage;
- (BOOL)hasTxErrCca;
- (BOOL)hasTxErrCcaPercentage;
- (BOOL)hasTxErrPercentage;
- (BOOL)hasTxIndirectMaxRetryExpiry;
- (BOOL)hasTxTotal;
- (BOOL)hasTxUnicast;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)txCcaEnergyDetectedHistogramsCount;
- (unint64_t)txCsmaBackoffHistogramsCount;
- (unint64_t)txDirectChannelaccessfailureHistogramsCount;
- (unint64_t)txDirectNoackHistogramsCount;
- (unint64_t)txDirectRetryAttemptsHistogramsCount;
- (unint64_t)txIndirectRetryAttemptsHistogramsCount;
- (unint64_t)txPacketCountHistogramsCount;
- (unsigned)cslLossOfSyncDueToCslTimeout;
- (unsigned)cslLossOfSyncDueToMaxRetx;
- (unsigned)cslTxErrAbort;
- (unsigned)cslTxErrBusyChannel;
- (unsigned)cslTxErrCca;
- (unsigned)cslTxErrNoack;
- (unsigned)cslTxTotal;
- (unsigned)txBroadcast;
- (unsigned)txCcaEnergyDetectedHistogramAtIndex:(unint64_t)a3;
- (unsigned)txCcaEnergyDetectedHistograms;
- (unsigned)txCsmaBackoffHistogramAtIndex:(unint64_t)a3;
- (unsigned)txCsmaBackoffHistograms;
- (unsigned)txData;
- (unsigned)txDirectChannelaccessfailureHistogramAtIndex:(unint64_t)a3;
- (unsigned)txDirectChannelaccessfailureHistograms;
- (unsigned)txDirectMaxRetryExpiry;
- (unsigned)txDirectNoackHistogramAtIndex:(unint64_t)a3;
- (unsigned)txDirectNoackHistograms;
- (unsigned)txDirectRetryAttemptsHistogramAtIndex:(unint64_t)a3;
- (unsigned)txDirectRetryAttemptsHistograms;
- (unsigned)txErrAbort;
- (unsigned)txErrAbortPercentage;
- (unsigned)txErrBusyChannel;
- (unsigned)txErrBusyChannelPercentage;
- (unsigned)txErrCca;
- (unsigned)txErrCcaPercentage;
- (unsigned)txErrPercentage;
- (unsigned)txIndirectMaxRetryExpiry;
- (unsigned)txIndirectRetryAttemptsHistogramAtIndex:(unint64_t)a3;
- (unsigned)txIndirectRetryAttemptsHistograms;
- (unsigned)txPacketCountHistogramAtIndex:(unint64_t)a3;
- (unsigned)txPacketCountHistograms;
- (unsigned)txTotal;
- (unsigned)txUnicast;
- (void)addTxCcaEnergyDetectedHistogram:(unsigned int)a3;
- (void)addTxCsmaBackoffHistogram:(unsigned int)a3;
- (void)addTxDirectChannelaccessfailureHistogram:(unsigned int)a3;
- (void)addTxDirectNoackHistogram:(unsigned int)a3;
- (void)addTxDirectRetryAttemptsHistogram:(unsigned int)a3;
- (void)addTxIndirectRetryAttemptsHistogram:(unsigned int)a3;
- (void)addTxPacketCountHistogram:(unsigned int)a3;
- (void)clearTxCcaEnergyDetectedHistograms;
- (void)clearTxCsmaBackoffHistograms;
- (void)clearTxDirectChannelaccessfailureHistograms;
- (void)clearTxDirectNoackHistograms;
- (void)clearTxDirectRetryAttemptsHistograms;
- (void)clearTxIndirectRetryAttemptsHistograms;
- (void)clearTxPacketCountHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCslLossOfSyncDueToCslTimeout:(unsigned int)a3;
- (void)setCslLossOfSyncDueToMaxRetx:(unsigned int)a3;
- (void)setCslTxErrAbort:(unsigned int)a3;
- (void)setCslTxErrBusyChannel:(unsigned int)a3;
- (void)setCslTxErrCca:(unsigned int)a3;
- (void)setCslTxErrNoack:(unsigned int)a3;
- (void)setCslTxTotal:(unsigned int)a3;
- (void)setHasCslLossOfSyncDueToCslTimeout:(BOOL)a3;
- (void)setHasCslLossOfSyncDueToMaxRetx:(BOOL)a3;
- (void)setHasCslTxErrAbort:(BOOL)a3;
- (void)setHasCslTxErrBusyChannel:(BOOL)a3;
- (void)setHasCslTxErrCca:(BOOL)a3;
- (void)setHasCslTxErrNoack:(BOOL)a3;
- (void)setHasCslTxTotal:(BOOL)a3;
- (void)setHasTxBroadcast:(BOOL)a3;
- (void)setHasTxData:(BOOL)a3;
- (void)setHasTxDirectMaxRetryExpiry:(BOOL)a3;
- (void)setHasTxErrAbort:(BOOL)a3;
- (void)setHasTxErrAbortPercentage:(BOOL)a3;
- (void)setHasTxErrBusyChannel:(BOOL)a3;
- (void)setHasTxErrBusyChannelPercentage:(BOOL)a3;
- (void)setHasTxErrCca:(BOOL)a3;
- (void)setHasTxErrCcaPercentage:(BOOL)a3;
- (void)setHasTxErrPercentage:(BOOL)a3;
- (void)setHasTxIndirectMaxRetryExpiry:(BOOL)a3;
- (void)setHasTxTotal:(BOOL)a3;
- (void)setHasTxUnicast:(BOOL)a3;
- (void)setTxBroadcast:(unsigned int)a3;
- (void)setTxCcaEnergyDetectedHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxCsmaBackoffHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxData:(unsigned int)a3;
- (void)setTxDirectChannelaccessfailureHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxDirectMaxRetryExpiry:(unsigned int)a3;
- (void)setTxDirectNoackHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxDirectRetryAttemptsHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxErrAbort:(unsigned int)a3;
- (void)setTxErrAbortPercentage:(unsigned int)a3;
- (void)setTxErrBusyChannel:(unsigned int)a3;
- (void)setTxErrBusyChannelPercentage:(unsigned int)a3;
- (void)setTxErrCca:(unsigned int)a3;
- (void)setTxErrCcaPercentage:(unsigned int)a3;
- (void)setTxErrPercentage:(unsigned int)a3;
- (void)setTxIndirectMaxRetryExpiry:(unsigned int)a3;
- (void)setTxIndirectRetryAttemptsHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxPacketCountHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTxTotal:(unsigned int)a3;
- (void)setTxUnicast:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersMacTxS

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDCountersMacTxS;
  [(AWDCountersMacTxS *)&v3 dealloc];
}

- (void)setTxTotal:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_txTotal = a3;
}

- (void)setHasTxTotal:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTxTotal
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTxData:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_txData = a3;
}

- (void)setHasTxData:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasTxData
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setTxUnicast:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_txUnicast = a3;
}

- (void)setHasTxUnicast:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTxUnicast
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTxBroadcast:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_txBroadcast = a3;
}

- (void)setHasTxBroadcast:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasTxBroadcast
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setTxErrCca:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_txErrCca = a3;
}

- (void)setHasTxErrCca:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTxErrCca
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTxErrAbort:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_txErrAbort = a3;
}

- (void)setHasTxErrAbort:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTxErrAbort
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTxErrBusyChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_txErrBusyChannel = a3;
}

- (void)setHasTxErrBusyChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTxErrBusyChannel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setTxDirectMaxRetryExpiry:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_txDirectMaxRetryExpiry = a3;
}

- (void)setHasTxDirectMaxRetryExpiry:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasTxDirectMaxRetryExpiry
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTxIndirectMaxRetryExpiry:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_txIndirectMaxRetryExpiry = a3;
}

- (void)setHasTxIndirectMaxRetryExpiry:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTxIndirectMaxRetryExpiry
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (unint64_t)txPacketCountHistogramsCount
{
  return self->_txPacketCountHistograms.count;
}

- (unsigned)txPacketCountHistograms
{
  return self->_txPacketCountHistograms.list;
}

- (void)clearTxPacketCountHistograms
{
}

- (void)addTxPacketCountHistogram:(unsigned int)a3
{
}

- (unsigned)txPacketCountHistogramAtIndex:(unint64_t)a3
{
  p_txPacketCountHistograms = &self->_txPacketCountHistograms;
  unint64_t count = self->_txPacketCountHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_txPacketCountHistograms->list[a3];
}

- (void)setTxPacketCountHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txDirectRetryAttemptsHistogramsCount
{
  return self->_txDirectRetryAttemptsHistograms.count;
}

- (unsigned)txDirectRetryAttemptsHistograms
{
  return self->_txDirectRetryAttemptsHistograms.list;
}

- (void)clearTxDirectRetryAttemptsHistograms
{
}

- (void)addTxDirectRetryAttemptsHistogram:(unsigned int)a3
{
}

- (unsigned)txDirectRetryAttemptsHistogramAtIndex:(unint64_t)a3
{
  p_txDirectRetryAttemptsHistograms = &self->_txDirectRetryAttemptsHistograms;
  unint64_t count = self->_txDirectRetryAttemptsHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_txDirectRetryAttemptsHistograms->list[a3];
}

- (void)setTxDirectRetryAttemptsHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txIndirectRetryAttemptsHistogramsCount
{
  return self->_txIndirectRetryAttemptsHistograms.count;
}

- (unsigned)txIndirectRetryAttemptsHistograms
{
  return self->_txIndirectRetryAttemptsHistograms.list;
}

- (void)clearTxIndirectRetryAttemptsHistograms
{
}

- (void)addTxIndirectRetryAttemptsHistogram:(unsigned int)a3
{
}

- (unsigned)txIndirectRetryAttemptsHistogramAtIndex:(unint64_t)a3
{
  p_txIndirectRetryAttemptsHistograms = &self->_txIndirectRetryAttemptsHistograms;
  unint64_t count = self->_txIndirectRetryAttemptsHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_txIndirectRetryAttemptsHistograms->list[a3];
}

- (void)setTxIndirectRetryAttemptsHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txCcaEnergyDetectedHistogramsCount
{
  return self->_txCcaEnergyDetectedHistograms.count;
}

- (unsigned)txCcaEnergyDetectedHistograms
{
  return self->_txCcaEnergyDetectedHistograms.list;
}

- (void)clearTxCcaEnergyDetectedHistograms
{
}

- (void)addTxCcaEnergyDetectedHistogram:(unsigned int)a3
{
}

- (unsigned)txCcaEnergyDetectedHistogramAtIndex:(unint64_t)a3
{
  p_txCcaEnergyDetectedHistograms = &self->_txCcaEnergyDetectedHistograms;
  unint64_t count = self->_txCcaEnergyDetectedHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_txCcaEnergyDetectedHistograms->list[a3];
}

- (void)setTxCcaEnergyDetectedHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txDirectNoackHistogramsCount
{
  return self->_txDirectNoackHistograms.count;
}

- (unsigned)txDirectNoackHistograms
{
  return self->_txDirectNoackHistograms.list;
}

- (void)clearTxDirectNoackHistograms
{
}

- (void)addTxDirectNoackHistogram:(unsigned int)a3
{
}

- (unsigned)txDirectNoackHistogramAtIndex:(unint64_t)a3
{
  p_txDirectNoackHistograms = &self->_txDirectNoackHistograms;
  unint64_t count = self->_txDirectNoackHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_txDirectNoackHistograms->list[a3];
}

- (void)setTxDirectNoackHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txDirectChannelaccessfailureHistogramsCount
{
  return self->_txDirectChannelaccessfailureHistograms.count;
}

- (unsigned)txDirectChannelaccessfailureHistograms
{
  return self->_txDirectChannelaccessfailureHistograms.list;
}

- (void)clearTxDirectChannelaccessfailureHistograms
{
}

- (void)addTxDirectChannelaccessfailureHistogram:(unsigned int)a3
{
}

- (unsigned)txDirectChannelaccessfailureHistogramAtIndex:(unint64_t)a3
{
  p_txDirectChannelaccessfailureHistograms = &self->_txDirectChannelaccessfailureHistograms;
  unint64_t count = self->_txDirectChannelaccessfailureHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_txDirectChannelaccessfailureHistograms->list[a3];
}

- (void)setTxDirectChannelaccessfailureHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txCsmaBackoffHistogramsCount
{
  return self->_txCsmaBackoffHistograms.count;
}

- (unsigned)txCsmaBackoffHistograms
{
  return self->_txCsmaBackoffHistograms.list;
}

- (void)clearTxCsmaBackoffHistograms
{
}

- (void)addTxCsmaBackoffHistogram:(unsigned int)a3
{
}

- (unsigned)txCsmaBackoffHistogramAtIndex:(unint64_t)a3
{
  p_txCsmaBackoffHistograms = &self->_txCsmaBackoffHistograms;
  unint64_t count = self->_txCsmaBackoffHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_txCsmaBackoffHistograms->list[a3];
}

- (void)setTxCsmaBackoffHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setCslTxTotal:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_cslTxTotal = a3;
}

- (void)setHasCslTxTotal:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCslTxTotal
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCslTxErrNoack:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_cslTxErrNoack = a3;
}

- (void)setHasCslTxErrNoack:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCslTxErrNoack
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCslTxErrCca:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_cslTxErrCca = a3;
}

- (void)setHasCslTxErrCca:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCslTxErrCca
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCslTxErrAbort:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_cslTxErrAbort = a3;
}

- (void)setHasCslTxErrAbort:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCslTxErrAbort
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCslTxErrBusyChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_cslTxErrBusyChannel = a3;
}

- (void)setHasCslTxErrBusyChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCslTxErrBusyChannel
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCslLossOfSyncDueToCslTimeout:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_cslLossOfSyncDueToCslTimeout = a3;
}

- (void)setHasCslLossOfSyncDueToCslTimeout:(BOOL)a3
{
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCslLossOfSyncDueToCslTimeout
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCslLossOfSyncDueToMaxRetx:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_cslLossOfSyncDueToMaxRetx = a3;
}

- (void)setHasCslLossOfSyncDueToMaxRetx:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCslLossOfSyncDueToMaxRetx
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTxErrCcaPercentage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_txErrCcaPercentage = a3;
}

- (void)setHasTxErrCcaPercentage:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTxErrCcaPercentage
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTxErrAbortPercentage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_txErrAbortPercentage = a3;
}

- (void)setHasTxErrAbortPercentage:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTxErrAbortPercentage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTxErrBusyChannelPercentage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_txErrBusyChannelPercentage = a3;
}

- (void)setHasTxErrBusyChannelPercentage:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTxErrBusyChannelPercentage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTxErrPercentage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_txErrPercentage = a3;
}

- (void)setHasTxErrPercentage:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($415C8CA3583A475FE8FFF238EB099507)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTxErrPercentage
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCountersMacTxS;
  int v3 = [(AWDCountersMacTxS *)&v7 description];
  v4 = [(AWDCountersMacTxS *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v16 = +[NSNumber numberWithUnsignedInt:self->_txTotal];
    [v3 setObject:v16 forKey:@"tx_total"];

    $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v17 = +[NSNumber numberWithUnsignedInt:self->_txData];
  [v3 setObject:v17 forKey:@"tx_data"];

  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  v18 = +[NSNumber numberWithUnsignedInt:self->_txUnicast];
  [v3 setObject:v18 forKey:@"tx_unicast"];

  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  v19 = +[NSNumber numberWithUnsignedInt:self->_txBroadcast];
  [v3 setObject:v19 forKey:@"tx_broadcast"];

  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  v20 = +[NSNumber numberWithUnsignedInt:self->_txErrCca];
  [v3 setObject:v20 forKey:@"tx_err_cca"];

  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  v21 = +[NSNumber numberWithUnsignedInt:self->_txErrAbort];
  [v3 setObject:v21 forKey:@"tx_err_abort"];

  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  v22 = +[NSNumber numberWithUnsignedInt:self->_txErrBusyChannel];
  [v3 setObject:v22 forKey:@"tx_err_busy_channel"];

  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_33:
  v23 = +[NSNumber numberWithUnsignedInt:self->_txDirectMaxRetryExpiry];
  [v3 setObject:v23 forKey:@"tx_direct_max_retry_expiry"];

  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_10:
    v5 = +[NSNumber numberWithUnsignedInt:self->_txIndirectMaxRetryExpiry];
    [v3 setObject:v5 forKey:@"tx_indirect_max_retry_expiry"];
  }
LABEL_11:
  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"tx_packet_count_histogram"];

  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"tx_direct_retry_attempts_histogram"];

  v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"tx_indirect_retry_attempts_histogram"];

  v9 = PBRepeatedUInt32NSArray();
  [v3 setObject:v9 forKey:@"tx_cca_energy_detected_histogram"];

  v10 = PBRepeatedUInt32NSArray();
  [v3 setObject:v10 forKey:@"tx_direct_noack_histogram"];

  v11 = PBRepeatedUInt32NSArray();
  [v3 setObject:v11 forKey:@"tx_direct_channelaccessfailure_histogram"];

  v12 = PBRepeatedUInt32NSArray();
  [v3 setObject:v12 forKey:@"tx_csma_backoff_histogram"];

  $415C8CA3583A475FE8FFF238EB099507 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x40) != 0)
  {
    v24 = +[NSNumber numberWithUnsignedInt:self->_cslTxTotal];
    [v3 setObject:v24 forKey:@"csl_tx_total"];

    $415C8CA3583A475FE8FFF238EB099507 v13 = self->_has;
    if ((*(unsigned char *)&v13 & 0x20) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v13 & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_37;
    }
  }
  else if ((*(unsigned char *)&v13 & 0x20) == 0)
  {
    goto LABEL_13;
  }
  v25 = +[NSNumber numberWithUnsignedInt:self->_cslTxErrNoack];
  [v3 setObject:v25 forKey:@"csl_tx_err_noack"];

  $415C8CA3583A475FE8FFF238EB099507 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v13 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  v26 = +[NSNumber numberWithUnsignedInt:self->_cslTxErrCca];
  [v3 setObject:v26 forKey:@"csl_tx_err_cca"];

  $415C8CA3583A475FE8FFF238EB099507 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 4) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v13 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
LABEL_38:
  v27 = +[NSNumber numberWithUnsignedInt:self->_cslTxErrAbort];
  [v3 setObject:v27 forKey:@"csl_tx_err_abort"];

  $415C8CA3583A475FE8FFF238EB099507 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 8) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&v13 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  v28 = +[NSNumber numberWithUnsignedInt:self->_cslTxErrBusyChannel];
  [v3 setObject:v28 forKey:@"csl_tx_err_busy_channel"];

  $415C8CA3583A475FE8FFF238EB099507 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 1) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v13 & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  v29 = +[NSNumber numberWithUnsignedInt:self->_cslLossOfSyncDueToCslTimeout];
  [v3 setObject:v29 forKey:@"csl_loss_of_sync_due_to_csl_timeout"];

  $415C8CA3583A475FE8FFF238EB099507 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v13 & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_42;
  }
LABEL_41:
  v30 = +[NSNumber numberWithUnsignedInt:self->_cslLossOfSyncDueToMaxRetx];
  [v3 setObject:v30 forKey:@"csl_loss_of_sync_due_to_max_retx"];

  $415C8CA3583A475FE8FFF238EB099507 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v13 & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_43;
  }
LABEL_42:
  v31 = +[NSNumber numberWithUnsignedInt:self->_txErrCcaPercentage];
  [v3 setObject:v31 forKey:@"tx_err_cca_percentage"];

  $415C8CA3583A475FE8FFF238EB099507 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v13 & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_44;
  }
LABEL_43:
  v32 = +[NSNumber numberWithUnsignedInt:self->_txErrAbortPercentage];
  [v3 setObject:v32 forKey:@"tx_err_abort_percentage"];

  $415C8CA3583A475FE8FFF238EB099507 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v13 & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_44:
  v33 = +[NSNumber numberWithUnsignedInt:self->_txErrBusyChannelPercentage];
  [v3 setObject:v33 forKey:@"tx_err_busy_channel_percentage"];

  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_22:
    v14 = +[NSNumber numberWithUnsignedInt:self->_txErrPercentage];
    [v3 setObject:v14 forKey:@"tx_err_percentage"];
  }
LABEL_23:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCountersMacTxSReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  id v15 = v4;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v15;
    $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  if ((*(_DWORD *)&self->_has & 0x20000) == 0)
  {
LABEL_10:
    p_txPacketCountHistograms = &self->_txPacketCountHistograms;
    if (!self->_txPacketCountHistograms.count) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  p_txPacketCountHistograms = &self->_txPacketCountHistograms;
  if (!self->_txPacketCountHistograms.count) {
    goto LABEL_23;
  }
LABEL_21:
  unint64_t v7 = 0;
  do
  {
    PBDataWriterWriteUint32Field();
    id v4 = v15;
    ++v7;
  }
  while (v7 < p_txPacketCountHistograms->count);
LABEL_23:
  if (self->_txDirectRetryAttemptsHistograms.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v15;
      ++v8;
    }
    while (v8 < self->_txDirectRetryAttemptsHistograms.count);
  }
  if (self->_txIndirectRetryAttemptsHistograms.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v15;
      ++v9;
    }
    while (v9 < self->_txIndirectRetryAttemptsHistograms.count);
  }
  if (self->_txCcaEnergyDetectedHistograms.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v15;
      ++v10;
    }
    while (v10 < self->_txCcaEnergyDetectedHistograms.count);
  }
  if (self->_txDirectNoackHistograms.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v15;
      ++v11;
    }
    while (v11 < self->_txDirectNoackHistograms.count);
  }
  if (self->_txDirectChannelaccessfailureHistograms.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v15;
      ++v12;
    }
    while (v12 < self->_txDirectChannelaccessfailureHistograms.count);
  }
  if (self->_txCsmaBackoffHistograms.count)
  {
    unint64_t v13 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v15;
      ++v13;
    }
    while (v13 < self->_txCsmaBackoffHistograms.count);
  }
  $415C8CA3583A475FE8FFF238EB099507 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v15;
    $415C8CA3583A475FE8FFF238EB099507 v14 = self->_has;
    if ((*(unsigned char *)&v14 & 0x20) == 0)
    {
LABEL_43:
      if ((*(unsigned char *)&v14 & 0x10) == 0) {
        goto LABEL_44;
      }
      goto LABEL_57;
    }
  }
  else if ((*(unsigned char *)&v14 & 0x20) == 0)
  {
    goto LABEL_43;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  $415C8CA3583A475FE8FFF238EB099507 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x10) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v14 & 4) == 0) {
      goto LABEL_45;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  $415C8CA3583A475FE8FFF238EB099507 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 4) == 0)
  {
LABEL_45:
    if ((*(unsigned char *)&v14 & 8) == 0) {
      goto LABEL_46;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  $415C8CA3583A475FE8FFF238EB099507 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 8) == 0)
  {
LABEL_46:
    if ((*(unsigned char *)&v14 & 1) == 0) {
      goto LABEL_47;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  $415C8CA3583A475FE8FFF238EB099507 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 1) == 0)
  {
LABEL_47:
    if ((*(unsigned char *)&v14 & 2) == 0) {
      goto LABEL_48;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  $415C8CA3583A475FE8FFF238EB099507 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 2) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v14 & 0x8000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  $415C8CA3583A475FE8FFF238EB099507 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v14 & 0x800) == 0) {
      goto LABEL_50;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  $415C8CA3583A475FE8FFF238EB099507 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x800) == 0)
  {
LABEL_50:
    if ((*(_WORD *)&v14 & 0x2000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  $415C8CA3583A475FE8FFF238EB099507 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v14 & 0x10000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  id v4 = v15;
  if ((*(_DWORD *)&self->_has & 0x10000) == 0)
  {
LABEL_52:
    goto LABEL_54;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  id v4 = v15;

LABEL_54:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v4[62] = self->_txTotal;
    v4[64] |= 0x40000u;
    $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v4[52] = self->_txData;
  v4[64] |= 0x100u;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[63] = self->_txUnicast;
  v4[64] |= 0x80000u;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[51] = self->_txBroadcast;
  v4[64] |= 0x80u;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[58] = self->_txErrCca;
  v4[64] |= 0x4000u;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[54] = self->_txErrAbort;
  v4[64] |= 0x400u;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[56] = self->_txErrBusyChannel;
  v4[64] |= 0x1000u;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    v4[61] = self->_txIndirectMaxRetryExpiry;
    v4[64] |= 0x20000u;
    v28 = v4;
    if (![(AWDCountersMacTxS *)self txPacketCountHistogramsCount]) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
LABEL_19:
  v4[53] = self->_txDirectMaxRetryExpiry;
  v4[64] |= 0x200u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  v28 = v4;
  if (![(AWDCountersMacTxS *)self txPacketCountHistogramsCount]) {
    goto LABEL_24;
  }
LABEL_21:
  [v28 clearTxPacketCountHistograms];
  unint64_t v6 = [(AWDCountersMacTxS *)self txPacketCountHistogramsCount];
  if (v6)
  {
    unint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      objc_msgSend(v28, "addTxPacketCountHistogram:", -[AWDCountersMacTxS txPacketCountHistogramAtIndex:](self, "txPacketCountHistogramAtIndex:", i));
  }
LABEL_24:
  if ([(AWDCountersMacTxS *)self txDirectRetryAttemptsHistogramsCount])
  {
    [v28 clearTxDirectRetryAttemptsHistograms];
    unint64_t v9 = [(AWDCountersMacTxS *)self txDirectRetryAttemptsHistogramsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        objc_msgSend(v28, "addTxDirectRetryAttemptsHistogram:", -[AWDCountersMacTxS txDirectRetryAttemptsHistogramAtIndex:](self, "txDirectRetryAttemptsHistogramAtIndex:", j));
    }
  }
  if ([(AWDCountersMacTxS *)self txIndirectRetryAttemptsHistogramsCount])
  {
    [v28 clearTxIndirectRetryAttemptsHistograms];
    unint64_t v12 = [(AWDCountersMacTxS *)self txIndirectRetryAttemptsHistogramsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        objc_msgSend(v28, "addTxIndirectRetryAttemptsHistogram:", -[AWDCountersMacTxS txIndirectRetryAttemptsHistogramAtIndex:](self, "txIndirectRetryAttemptsHistogramAtIndex:", k));
    }
  }
  if ([(AWDCountersMacTxS *)self txCcaEnergyDetectedHistogramsCount])
  {
    [v28 clearTxCcaEnergyDetectedHistograms];
    unint64_t v15 = [(AWDCountersMacTxS *)self txCcaEnergyDetectedHistogramsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        objc_msgSend(v28, "addTxCcaEnergyDetectedHistogram:", -[AWDCountersMacTxS txCcaEnergyDetectedHistogramAtIndex:](self, "txCcaEnergyDetectedHistogramAtIndex:", m));
    }
  }
  if ([(AWDCountersMacTxS *)self txDirectNoackHistogramsCount])
  {
    [v28 clearTxDirectNoackHistograms];
    unint64_t v18 = [(AWDCountersMacTxS *)self txDirectNoackHistogramsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t n = 0; n != v19; ++n)
        objc_msgSend(v28, "addTxDirectNoackHistogram:", -[AWDCountersMacTxS txDirectNoackHistogramAtIndex:](self, "txDirectNoackHistogramAtIndex:", n));
    }
  }
  if ([(AWDCountersMacTxS *)self txDirectChannelaccessfailureHistogramsCount])
  {
    [v28 clearTxDirectChannelaccessfailureHistograms];
    unint64_t v21 = [(AWDCountersMacTxS *)self txDirectChannelaccessfailureHistogramsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (iuint64_t i = 0; ii != v22; ++ii)
        objc_msgSend(v28, "addTxDirectChannelaccessfailureHistogram:", -[AWDCountersMacTxS txDirectChannelaccessfailureHistogramAtIndex:](self, "txDirectChannelaccessfailureHistogramAtIndex:", ii));
    }
  }
  if ([(AWDCountersMacTxS *)self txCsmaBackoffHistogramsCount])
  {
    [v28 clearTxCsmaBackoffHistograms];
    unint64_t v24 = [(AWDCountersMacTxS *)self txCsmaBackoffHistogramsCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (juint64_t j = 0; jj != v25; ++jj)
        objc_msgSend(v28, "addTxCsmaBackoffHistogram:", -[AWDCountersMacTxS txCsmaBackoffHistogramAtIndex:](self, "txCsmaBackoffHistogramAtIndex:", jj));
    }
  }
  $415C8CA3583A475FE8FFF238EB099507 v27 = self->_has;
  if ((*(unsigned char *)&v27 & 0x40) != 0)
  {
    v28[50] = self->_cslTxTotal;
    v28[64] |= 0x40u;
    $415C8CA3583A475FE8FFF238EB099507 v27 = self->_has;
    if ((*(unsigned char *)&v27 & 0x20) == 0)
    {
LABEL_50:
      if ((*(unsigned char *)&v27 & 0x10) == 0) {
        goto LABEL_51;
      }
      goto LABEL_64;
    }
  }
  else if ((*(unsigned char *)&v27 & 0x20) == 0)
  {
    goto LABEL_50;
  }
  v28[49] = self->_cslTxErrNoack;
  v28[64] |= 0x20u;
  $415C8CA3583A475FE8FFF238EB099507 v27 = self->_has;
  if ((*(unsigned char *)&v27 & 0x10) == 0)
  {
LABEL_51:
    if ((*(unsigned char *)&v27 & 4) == 0) {
      goto LABEL_52;
    }
    goto LABEL_65;
  }
LABEL_64:
  v28[48] = self->_cslTxErrCca;
  v28[64] |= 0x10u;
  $415C8CA3583A475FE8FFF238EB099507 v27 = self->_has;
  if ((*(unsigned char *)&v27 & 4) == 0)
  {
LABEL_52:
    if ((*(unsigned char *)&v27 & 8) == 0) {
      goto LABEL_53;
    }
    goto LABEL_66;
  }
LABEL_65:
  v28[46] = self->_cslTxErrAbort;
  v28[64] |= 4u;
  $415C8CA3583A475FE8FFF238EB099507 v27 = self->_has;
  if ((*(unsigned char *)&v27 & 8) == 0)
  {
LABEL_53:
    if ((*(unsigned char *)&v27 & 1) == 0) {
      goto LABEL_54;
    }
    goto LABEL_67;
  }
LABEL_66:
  v28[47] = self->_cslTxErrBusyChannel;
  v28[64] |= 8u;
  $415C8CA3583A475FE8FFF238EB099507 v27 = self->_has;
  if ((*(unsigned char *)&v27 & 1) == 0)
  {
LABEL_54:
    if ((*(unsigned char *)&v27 & 2) == 0) {
      goto LABEL_55;
    }
    goto LABEL_68;
  }
LABEL_67:
  v28[44] = self->_cslLossOfSyncDueToCslTimeout;
  v28[64] |= 1u;
  $415C8CA3583A475FE8FFF238EB099507 v27 = self->_has;
  if ((*(unsigned char *)&v27 & 2) == 0)
  {
LABEL_55:
    if ((*(_WORD *)&v27 & 0x8000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_69;
  }
LABEL_68:
  v28[45] = self->_cslLossOfSyncDueToMaxRetx;
  v28[64] |= 2u;
  $415C8CA3583A475FE8FFF238EB099507 v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x8000) == 0)
  {
LABEL_56:
    if ((*(_WORD *)&v27 & 0x800) == 0) {
      goto LABEL_57;
    }
    goto LABEL_70;
  }
LABEL_69:
  v28[59] = self->_txErrCcaPercentage;
  v28[64] |= 0x8000u;
  $415C8CA3583A475FE8FFF238EB099507 v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x800) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v27 & 0x2000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_71;
  }
LABEL_70:
  v28[55] = self->_txErrAbortPercentage;
  v28[64] |= 0x800u;
  $415C8CA3583A475FE8FFF238EB099507 v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x2000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&v27 & 0x10000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_72;
  }
LABEL_71:
  v28[57] = self->_txErrBusyChannelPercentage;
  v28[64] |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x10000) == 0)
  {
LABEL_59:
    goto LABEL_61;
  }
LABEL_72:
  v28[60] = self->_txErrPercentage;
  v28[64] |= 0x10000u;

LABEL_61:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v4[62] = self->_txTotal;
    v4[64] |= 0x40000u;
    $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v4[52] = self->_txData;
  v4[64] |= 0x100u;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  v4[63] = self->_txUnicast;
  v4[64] |= 0x80000u;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[51] = self->_txBroadcast;
  v4[64] |= 0x80u;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[58] = self->_txErrCca;
  v4[64] |= 0x4000u;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[54] = self->_txErrAbort;
  v4[64] |= 0x400u;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[56] = self->_txErrBusyChannel;
  v4[64] |= 0x1000u;
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_30:
  v4[53] = self->_txDirectMaxRetryExpiry;
  v4[64] |= 0x200u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_10:
    v4[61] = self->_txIndirectMaxRetryExpiry;
    v4[64] |= 0x20000u;
  }
LABEL_11:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  $415C8CA3583A475FE8FFF238EB099507 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x40) != 0)
  {
    v5[50] = self->_cslTxTotal;
    v5[64] |= 0x40u;
    $415C8CA3583A475FE8FFF238EB099507 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 0x20) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v7 & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
    goto LABEL_13;
  }
  v5[49] = self->_cslTxErrNoack;
  v5[64] |= 0x20u;
  $415C8CA3583A475FE8FFF238EB099507 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v7 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  v5[48] = self->_cslTxErrCca;
  v5[64] |= 0x10u;
  $415C8CA3583A475FE8FFF238EB099507 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 4) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v7 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  v5[46] = self->_cslTxErrAbort;
  v5[64] |= 4u;
  $415C8CA3583A475FE8FFF238EB099507 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 8) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&v7 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  v5[47] = self->_cslTxErrBusyChannel;
  v5[64] |= 8u;
  $415C8CA3583A475FE8FFF238EB099507 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 1) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v7 & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  v5[44] = self->_cslLossOfSyncDueToCslTimeout;
  v5[64] |= 1u;
  $415C8CA3583A475FE8FFF238EB099507 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 2) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v7 & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  v5[45] = self->_cslLossOfSyncDueToMaxRetx;
  v5[64] |= 2u;
  $415C8CA3583A475FE8FFF238EB099507 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v7 & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_40;
  }
LABEL_39:
  v5[59] = self->_txErrCcaPercentage;
  v5[64] |= 0x8000u;
  $415C8CA3583A475FE8FFF238EB099507 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_21;
    }
LABEL_41:
    v5[57] = self->_txErrBusyChannelPercentage;
    v5[64] |= 0x2000u;
    if ((*(_DWORD *)&self->_has & 0x10000) == 0) {
      return v5;
    }
    goto LABEL_42;
  }
LABEL_40:
  v5[55] = self->_txErrAbortPercentage;
  v5[64] |= 0x800u;
  $415C8CA3583A475FE8FFF238EB099507 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) != 0) {
    goto LABEL_41;
  }
LABEL_21:
  if ((*(_DWORD *)&v7 & 0x10000) == 0) {
    return v5;
  }
LABEL_42:
  v5[60] = self->_txErrPercentage;
  v5[64] |= 0x10000u;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_109;
  }
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  int v6 = v4[64];
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_txTotal != v4[62]) {
      goto LABEL_109;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
LABEL_109:
    BOOL v9 = 0;
    goto LABEL_110;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_txData != v4[52]) {
      goto LABEL_109;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_txUnicast != v4[63]) {
      goto LABEL_109;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_109;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_txBroadcast != v4[51]) {
      goto LABEL_109;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_txErrCca != v4[58]) {
      goto LABEL_109;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_txErrAbort != v4[54]) {
      goto LABEL_109;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_txErrBusyChannel != v4[56]) {
      goto LABEL_109;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_txDirectMaxRetryExpiry != v4[53]) {
      goto LABEL_109;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_txIndirectMaxRetryExpiry != v4[61]) {
      goto LABEL_109;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_109;
  }
  if (!PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_109;
  }
  $415C8CA3583A475FE8FFF238EB099507 v7 = self->_has;
  int v8 = v4[64];
  if ((*(unsigned char *)&v7 & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_cslTxTotal != v4[50]) {
      goto LABEL_109;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_109;
  }
  if ((*(unsigned char *)&v7 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_cslTxErrNoack != v4[49]) {
      goto LABEL_109;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_109;
  }
  if ((*(unsigned char *)&v7 & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_cslTxErrCca != v4[48]) {
      goto LABEL_109;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_109;
  }
  if ((*(unsigned char *)&v7 & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_cslTxErrAbort != v4[46]) {
      goto LABEL_109;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_109;
  }
  if ((*(unsigned char *)&v7 & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_cslTxErrBusyChannel != v4[47]) {
      goto LABEL_109;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_109;
  }
  if (*(unsigned char *)&v7)
  {
    if ((v8 & 1) == 0 || self->_cslLossOfSyncDueToCslTimeout != v4[44]) {
      goto LABEL_109;
    }
  }
  else if (v8)
  {
    goto LABEL_109;
  }
  if ((*(unsigned char *)&v7 & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_cslLossOfSyncDueToMaxRetx != v4[45]) {
      goto LABEL_109;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&v7 & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_txErrCcaPercentage != v4[59]) {
      goto LABEL_109;
    }
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&v7 & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_txErrAbortPercentage != v4[55]) {
      goto LABEL_109;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&v7 & 0x2000) != 0)
  {
    if ((v8 & 0x2000) == 0 || self->_txErrBusyChannelPercentage != v4[57]) {
      goto LABEL_109;
    }
  }
  else if ((v8 & 0x2000) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_DWORD *)&v7 & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_txErrPercentage != v4[60]) {
      goto LABEL_109;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (v8 & 0x10000) == 0;
  }
LABEL_110:

  return v9;
}

- (unint64_t)hash
{
  $415C8CA3583A475FE8FFF238EB099507 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    uint64_t v32 = 2654435761 * self->_txTotal;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v31 = 2654435761 * self->_txData;
      if ((*(_DWORD *)&has & 0x80000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v31 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_4:
    uint64_t v30 = 2654435761 * self->_txUnicast;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v30 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_5:
    uint64_t v29 = 2654435761 * self->_txBroadcast;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v29 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_6:
    uint64_t v28 = 2654435761 * self->_txErrCca;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v28 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_7:
    uint64_t v27 = 2654435761 * self->_txErrAbort;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v27 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_8:
    uint64_t v26 = 2654435761 * self->_txErrBusyChannel;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v25 = 0;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v26 = 0;
  if ((*(_WORD *)&has & 0x200) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v25 = 2654435761 * self->_txDirectMaxRetryExpiry;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_10:
    uint64_t v4 = 2654435761 * self->_txIndirectMaxRetryExpiry;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v4 = 0;
LABEL_20:
  uint64_t v5 = PBRepeatedUInt32Hash();
  uint64_t v6 = PBRepeatedUInt32Hash();
  uint64_t v7 = PBRepeatedUInt32Hash();
  uint64_t v8 = PBRepeatedUInt32Hash();
  uint64_t v9 = PBRepeatedUInt32Hash();
  uint64_t v10 = PBRepeatedUInt32Hash();
  uint64_t v11 = PBRepeatedUInt32Hash();
  $415C8CA3583A475FE8FFF238EB099507 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x40) != 0)
  {
    uint64_t v13 = 2654435761 * self->_cslTxTotal;
    if ((*(unsigned char *)&v12 & 0x20) != 0)
    {
LABEL_22:
      uint64_t v14 = 2654435761 * self->_cslTxErrNoack;
      if ((*(unsigned char *)&v12 & 0x10) != 0) {
        goto LABEL_23;
      }
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(unsigned char *)&v12 & 0x20) != 0) {
      goto LABEL_22;
    }
  }
  uint64_t v14 = 0;
  if ((*(unsigned char *)&v12 & 0x10) != 0)
  {
LABEL_23:
    uint64_t v15 = 2654435761 * self->_cslTxErrCca;
    if ((*(unsigned char *)&v12 & 4) != 0) {
      goto LABEL_24;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v15 = 0;
  if ((*(unsigned char *)&v12 & 4) != 0)
  {
LABEL_24:
    uint64_t v16 = 2654435761 * self->_cslTxErrAbort;
    if ((*(unsigned char *)&v12 & 8) != 0) {
      goto LABEL_25;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&v12 & 8) != 0)
  {
LABEL_25:
    uint64_t v17 = 2654435761 * self->_cslTxErrBusyChannel;
    if (*(unsigned char *)&v12) {
      goto LABEL_26;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v17 = 0;
  if (*(unsigned char *)&v12)
  {
LABEL_26:
    uint64_t v18 = 2654435761 * self->_cslLossOfSyncDueToCslTimeout;
    if ((*(unsigned char *)&v12 & 2) != 0) {
      goto LABEL_27;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v18 = 0;
  if ((*(unsigned char *)&v12 & 2) != 0)
  {
LABEL_27:
    uint64_t v19 = 2654435761 * self->_cslLossOfSyncDueToMaxRetx;
    if ((*(_WORD *)&v12 & 0x8000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v19 = 0;
  if ((*(_WORD *)&v12 & 0x8000) != 0)
  {
LABEL_28:
    uint64_t v20 = 2654435761 * self->_txErrCcaPercentage;
    if ((*(_WORD *)&v12 & 0x800) != 0) {
      goto LABEL_29;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v20 = 0;
  if ((*(_WORD *)&v12 & 0x800) != 0)
  {
LABEL_29:
    uint64_t v21 = 2654435761 * self->_txErrAbortPercentage;
    if ((*(_WORD *)&v12 & 0x2000) != 0) {
      goto LABEL_30;
    }
LABEL_41:
    uint64_t v22 = 0;
    if ((*(_DWORD *)&v12 & 0x10000) != 0) {
      goto LABEL_31;
    }
LABEL_42:
    uint64_t v23 = 0;
    return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
  }
LABEL_40:
  uint64_t v21 = 0;
  if ((*(_WORD *)&v12 & 0x2000) == 0) {
    goto LABEL_41;
  }
LABEL_30:
  uint64_t v22 = 2654435761 * self->_txErrBusyChannelPercentage;
  if ((*(_DWORD *)&v12 & 0x10000) == 0) {
    goto LABEL_42;
  }
LABEL_31:
  uint64_t v23 = 2654435761 * self->_txErrPercentage;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  unsigned int v5 = v4[64];
  if ((v5 & 0x40000) != 0)
  {
    self->_txTotal = v4[62];
    *(_DWORD *)&self->_has |= 0x40000u;
    unsigned int v5 = v4[64];
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x80000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_txData = v4[52];
  *(_DWORD *)&self->_has |= 0x100u;
  unsigned int v5 = v4[64];
  if ((v5 & 0x80000) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_txUnicast = v4[63];
  *(_DWORD *)&self->_has |= 0x80000u;
  unsigned int v5 = v4[64];
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_txBroadcast = v4[51];
  *(_DWORD *)&self->_has |= 0x80u;
  unsigned int v5 = v4[64];
  if ((v5 & 0x4000) == 0)
  {
LABEL_6:
    if ((v5 & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_txErrCca = v4[58];
  *(_DWORD *)&self->_has |= 0x4000u;
  unsigned int v5 = v4[64];
  if ((v5 & 0x400) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_txErrAbort = v4[54];
  *(_DWORD *)&self->_has |= 0x400u;
  unsigned int v5 = v4[64];
  if ((v5 & 0x1000) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_txErrBusyChannel = v4[56];
  *(_DWORD *)&self->_has |= 0x1000u;
  unsigned int v5 = v4[64];
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_txDirectMaxRetryExpiry = v4[53];
  *(_DWORD *)&self->_has |= 0x200u;
  if ((v4[64] & 0x20000) == 0)
  {
LABEL_10:
    uint64_t v28 = v4;
    uint64_t v6 = (char *)[v4 txPacketCountHistogramsCount];
    if (!v6) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_txIndirectMaxRetryExpiry = v4[61];
  *(_DWORD *)&self->_has |= 0x20000u;
  uint64_t v28 = v4;
  uint64_t v6 = (char *)[v4 txPacketCountHistogramsCount];
  if (!v6) {
    goto LABEL_23;
  }
LABEL_21:
  uint64_t v7 = v6;
  for (uint64_t i = 0; i != v7; ++i)
    -[AWDCountersMacTxS addTxPacketCountHistogram:](self, "addTxPacketCountHistogram:", [v28 txPacketCountHistogramAtIndex:i]);
LABEL_23:
  uint64_t v9 = (char *)[v28 txDirectRetryAttemptsHistogramsCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[AWDCountersMacTxS addTxDirectRetryAttemptsHistogram:](self, "addTxDirectRetryAttemptsHistogram:", [v28 txDirectRetryAttemptsHistogramAtIndex:j]);
  }
  $415C8CA3583A475FE8FFF238EB099507 v12 = (char *)[v28 txIndirectRetryAttemptsHistogramsCount];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t k = 0; k != v13; ++k)
      -[AWDCountersMacTxS addTxIndirectRetryAttemptsHistogram:](self, "addTxIndirectRetryAttemptsHistogram:", [v28 txIndirectRetryAttemptsHistogramAtIndex:k]);
  }
  uint64_t v15 = (char *)[v28 txCcaEnergyDetectedHistogramsCount];
  if (v15)
  {
    uint64_t v16 = v15;
    for (uint64_t m = 0; m != v16; ++m)
      -[AWDCountersMacTxS addTxCcaEnergyDetectedHistogram:](self, "addTxCcaEnergyDetectedHistogram:", [v28 txCcaEnergyDetectedHistogramAtIndex:m]);
  }
  uint64_t v18 = (char *)[v28 txDirectNoackHistogramsCount];
  if (v18)
  {
    uint64_t v19 = v18;
    for (uint64_t n = 0; n != v19; ++n)
      -[AWDCountersMacTxS addTxDirectNoackHistogram:](self, "addTxDirectNoackHistogram:", [v28 txDirectNoackHistogramAtIndex:n]);
  }
  uint64_t v21 = (char *)[v28 txDirectChannelaccessfailureHistogramsCount];
  if (v21)
  {
    uint64_t v22 = v21;
    for (iuint64_t i = 0; ii != v22; ++ii)
      -[AWDCountersMacTxS addTxDirectChannelaccessfailureHistogram:](self, "addTxDirectChannelaccessfailureHistogram:", [v28 txDirectChannelaccessfailureHistogramAtIndex:ii]);
  }
  unint64_t v24 = (char *)[v28 txCsmaBackoffHistogramsCount];
  if (v24)
  {
    uint64_t v25 = v24;
    for (juint64_t j = 0; jj != v25; ++jj)
      -[AWDCountersMacTxS addTxCsmaBackoffHistogram:](self, "addTxCsmaBackoffHistogram:", [v28 txCsmaBackoffHistogramAtIndex:jj]);
  }
  unsigned int v27 = v28[64];
  if ((v27 & 0x40) != 0)
  {
    self->_cslTxTotal = v28[50];
    *(_DWORD *)&self->_has |= 0x40u;
    unsigned int v27 = v28[64];
    if ((v27 & 0x20) == 0)
    {
LABEL_43:
      if ((v27 & 0x10) == 0) {
        goto LABEL_44;
      }
      goto LABEL_57;
    }
  }
  else if ((v27 & 0x20) == 0)
  {
    goto LABEL_43;
  }
  self->_cslTxErrNoacuint64_t k = v28[49];
  *(_DWORD *)&self->_has |= 0x20u;
  unsigned int v27 = v28[64];
  if ((v27 & 0x10) == 0)
  {
LABEL_44:
    if ((v27 & 4) == 0) {
      goto LABEL_45;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_cslTxErrCca = v28[48];
  *(_DWORD *)&self->_has |= 0x10u;
  unsigned int v27 = v28[64];
  if ((v27 & 4) == 0)
  {
LABEL_45:
    if ((v27 & 8) == 0) {
      goto LABEL_46;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_cslTxErrAbort = v28[46];
  *(_DWORD *)&self->_has |= 4u;
  unsigned int v27 = v28[64];
  if ((v27 & 8) == 0)
  {
LABEL_46:
    if ((v27 & 1) == 0) {
      goto LABEL_47;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_cslTxErrBusyChannel = v28[47];
  *(_DWORD *)&self->_has |= 8u;
  unsigned int v27 = v28[64];
  if ((v27 & 1) == 0)
  {
LABEL_47:
    if ((v27 & 2) == 0) {
      goto LABEL_48;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_cslLossOfSyncDueToCslTimeout = v28[44];
  *(_DWORD *)&self->_has |= 1u;
  unsigned int v27 = v28[64];
  if ((v27 & 2) == 0)
  {
LABEL_48:
    if ((v27 & 0x8000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_cslLossOfSyncDueToMaxRetx = v28[45];
  *(_DWORD *)&self->_has |= 2u;
  unsigned int v27 = v28[64];
  if ((v27 & 0x8000) == 0)
  {
LABEL_49:
    if ((v27 & 0x800) == 0) {
      goto LABEL_50;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_txErrCcaPercentage = v28[59];
  *(_DWORD *)&self->_has |= 0x8000u;
  unsigned int v27 = v28[64];
  if ((v27 & 0x800) == 0)
  {
LABEL_50:
    if ((v27 & 0x2000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_txErrAbortPercentage = v28[55];
  *(_DWORD *)&self->_has |= 0x800u;
  unsigned int v27 = v28[64];
  if ((v27 & 0x2000) == 0)
  {
LABEL_51:
    if ((v27 & 0x10000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_txErrBusyChannelPercentage = v28[57];
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((v28[64] & 0x10000) == 0)
  {
LABEL_52:
    goto LABEL_54;
  }
LABEL_65:
  self->_txErrPercentage = v28[60];
  *(_DWORD *)&self->_has |= 0x10000u;

LABEL_54:
}

- (unsigned)txTotal
{
  return self->_txTotal;
}

- (unsigned)txData
{
  return self->_txData;
}

- (unsigned)txUnicast
{
  return self->_txUnicast;
}

- (unsigned)txBroadcast
{
  return self->_txBroadcast;
}

- (unsigned)txErrCca
{
  return self->_txErrCca;
}

- (unsigned)txErrAbort
{
  return self->_txErrAbort;
}

- (unsigned)txErrBusyChannel
{
  return self->_txErrBusyChannel;
}

- (unsigned)txDirectMaxRetryExpiry
{
  return self->_txDirectMaxRetryExpiry;
}

- (unsigned)txIndirectMaxRetryExpiry
{
  return self->_txIndirectMaxRetryExpiry;
}

- (unsigned)cslTxTotal
{
  return self->_cslTxTotal;
}

- (unsigned)cslTxErrNoack
{
  return self->_cslTxErrNoack;
}

- (unsigned)cslTxErrCca
{
  return self->_cslTxErrCca;
}

- (unsigned)cslTxErrAbort
{
  return self->_cslTxErrAbort;
}

- (unsigned)cslTxErrBusyChannel
{
  return self->_cslTxErrBusyChannel;
}

- (unsigned)cslLossOfSyncDueToCslTimeout
{
  return self->_cslLossOfSyncDueToCslTimeout;
}

- (unsigned)cslLossOfSyncDueToMaxRetx
{
  return self->_cslLossOfSyncDueToMaxRetx;
}

- (unsigned)txErrCcaPercentage
{
  return self->_txErrCcaPercentage;
}

- (unsigned)txErrAbortPercentage
{
  return self->_txErrAbortPercentage;
}

- (unsigned)txErrBusyChannelPercentage
{
  return self->_txErrBusyChannelPercentage;
}

- (unsigned)txErrPercentage
{
  return self->_txErrPercentage;
}

@end