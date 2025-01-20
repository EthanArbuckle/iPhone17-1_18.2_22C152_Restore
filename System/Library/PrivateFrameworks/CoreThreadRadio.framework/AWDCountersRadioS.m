@interface AWDCountersRadioS
- (AWDRadioStatsS)sRadioStats;
- (BOOL)hasCcaFailedAttempts;
- (BOOL)hasEnergyDetectedEvents;
- (BOOL)hasEnergyDetectedRequests;
- (BOOL)hasListeningTime;
- (BOOL)hasRadioReceivedFrames;
- (BOOL)hasRadioStatusDoubleNotification;
- (BOOL)hasReceivedEnergyEvents;
- (BOOL)hasReceivedFrames;
- (BOOL)hasReceivedPreambles;
- (BOOL)hasReceivingTime;
- (BOOL)hasRetryInterval90perc;
- (BOOL)hasRetryIntervalAvg;
- (BOOL)hasRetryIntervalMax;
- (BOOL)hasRetryIntervalMin;
- (BOOL)hasRtt90perc;
- (BOOL)hasRttAvgVal;
- (BOOL)hasRttMaxVal;
- (BOOL)hasRttMinVal;
- (BOOL)hasRxErrorAborted;
- (BOOL)hasRxErrorAckAborted;
- (BOOL)hasRxErrorAckDenied;
- (BOOL)hasRxErrorAckFailedRadioDelay;
- (BOOL)hasRxErrorAckFailedRadioState;
- (BOOL)hasRxErrorDelayedTimeout;
- (BOOL)hasRxErrorDelayedTimeslotEnded;
- (BOOL)hasRxErrorDestAddrFiltered;
- (BOOL)hasRxErrorInvalidData;
- (BOOL)hasRxErrorInvalidFcs;
- (BOOL)hasRxErrorInvalidFrame;
- (BOOL)hasRxErrorInvalidLength;
- (BOOL)hasRxErrorReceiveFailed;
- (BOOL)hasRxErrorRuntimeDelay;
- (BOOL)hasRxErrorTimeslotEnded;
- (BOOL)hasSRadioStats;
- (BOOL)hasSleepState;
- (BOOL)hasTransmittedFrames;
- (BOOL)hasTransmittingTime;
- (BOOL)hasTxDelay90perc;
- (BOOL)hasTxDelayAvg;
- (BOOL)hasTxDelayMax;
- (BOOL)hasTxDelayMin;
- (BOOL)hasTxErrorAckNoMem;
- (BOOL)hasTxErrorBusyChannelCcaNotStarted;
- (BOOL)hasTxErrorChannelAccessCcaBusy;
- (BOOL)hasTxErrorChannelAccessFailure;
- (BOOL)hasTxErrorInvalidAck;
- (BOOL)hasTxErrorNoAck;
- (BOOL)hasTxErrorNotGranted;
- (BOOL)hasTxErrorTimeslotDenied;
- (BOOL)hasTxErrorTimeslotEnded;
- (BOOL)hasTxErrorTxAborted;
- (BOOL)hasTxErrorTxAbortedCcaTx;
- (BOOL)hasTxErrorTxAbortedCsmaBackoff;
- (BOOL)hasTxErrorTxAbortedCsmaCfgBackoff;
- (BOOL)hasTxErrorTxAbortedCsmaPrepare;
- (BOOL)hasTxErrorTxAbortedIfs;
- (BOOL)hasTxErrorTxAbortedRxAck;
- (BOOL)hasTxErrorTxAbortedTx;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)ccaFailedAttempts;
- (unsigned)energyDetectedEvents;
- (unsigned)energyDetectedRequests;
- (unsigned)listeningTime;
- (unsigned)radioReceivedFrames;
- (unsigned)radioStatusDoubleNotification;
- (unsigned)receivedEnergyEvents;
- (unsigned)receivedFrames;
- (unsigned)receivedPreambles;
- (unsigned)receivingTime;
- (unsigned)retryInterval90perc;
- (unsigned)retryIntervalAvg;
- (unsigned)retryIntervalMax;
- (unsigned)retryIntervalMin;
- (unsigned)rtt90perc;
- (unsigned)rttAvgVal;
- (unsigned)rttMaxVal;
- (unsigned)rttMinVal;
- (unsigned)rxErrorAborted;
- (unsigned)rxErrorAckAborted;
- (unsigned)rxErrorAckDenied;
- (unsigned)rxErrorAckFailedRadioDelay;
- (unsigned)rxErrorAckFailedRadioState;
- (unsigned)rxErrorDelayedTimeout;
- (unsigned)rxErrorDelayedTimeslotEnded;
- (unsigned)rxErrorDestAddrFiltered;
- (unsigned)rxErrorInvalidData;
- (unsigned)rxErrorInvalidFcs;
- (unsigned)rxErrorInvalidFrame;
- (unsigned)rxErrorInvalidLength;
- (unsigned)rxErrorReceiveFailed;
- (unsigned)rxErrorRuntimeDelay;
- (unsigned)rxErrorTimeslotEnded;
- (unsigned)sleepState;
- (unsigned)transmittedFrames;
- (unsigned)transmittingTime;
- (unsigned)txDelay90perc;
- (unsigned)txDelayAvg;
- (unsigned)txDelayMax;
- (unsigned)txDelayMin;
- (unsigned)txErrorAckNoMem;
- (unsigned)txErrorBusyChannelCcaNotStarted;
- (unsigned)txErrorChannelAccessCcaBusy;
- (unsigned)txErrorChannelAccessFailure;
- (unsigned)txErrorInvalidAck;
- (unsigned)txErrorNoAck;
- (unsigned)txErrorNotGranted;
- (unsigned)txErrorTimeslotDenied;
- (unsigned)txErrorTimeslotEnded;
- (unsigned)txErrorTxAborted;
- (unsigned)txErrorTxAbortedCcaTx;
- (unsigned)txErrorTxAbortedCsmaBackoff;
- (unsigned)txErrorTxAbortedCsmaCfgBackoff;
- (unsigned)txErrorTxAbortedCsmaPrepare;
- (unsigned)txErrorTxAbortedIfs;
- (unsigned)txErrorTxAbortedRxAck;
- (unsigned)txErrorTxAbortedTx;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCcaFailedAttempts:(unsigned int)a3;
- (void)setEnergyDetectedEvents:(unsigned int)a3;
- (void)setEnergyDetectedRequests:(unsigned int)a3;
- (void)setHasCcaFailedAttempts:(BOOL)a3;
- (void)setHasEnergyDetectedEvents:(BOOL)a3;
- (void)setHasEnergyDetectedRequests:(BOOL)a3;
- (void)setHasListeningTime:(BOOL)a3;
- (void)setHasRadioReceivedFrames:(BOOL)a3;
- (void)setHasRadioStatusDoubleNotification:(BOOL)a3;
- (void)setHasReceivedEnergyEvents:(BOOL)a3;
- (void)setHasReceivedFrames:(BOOL)a3;
- (void)setHasReceivedPreambles:(BOOL)a3;
- (void)setHasReceivingTime:(BOOL)a3;
- (void)setHasRetryInterval90perc:(BOOL)a3;
- (void)setHasRetryIntervalAvg:(BOOL)a3;
- (void)setHasRetryIntervalMax:(BOOL)a3;
- (void)setHasRetryIntervalMin:(BOOL)a3;
- (void)setHasRtt90perc:(BOOL)a3;
- (void)setHasRttAvgVal:(BOOL)a3;
- (void)setHasRttMaxVal:(BOOL)a3;
- (void)setHasRttMinVal:(BOOL)a3;
- (void)setHasRxErrorAborted:(BOOL)a3;
- (void)setHasRxErrorAckAborted:(BOOL)a3;
- (void)setHasRxErrorAckDenied:(BOOL)a3;
- (void)setHasRxErrorAckFailedRadioDelay:(BOOL)a3;
- (void)setHasRxErrorAckFailedRadioState:(BOOL)a3;
- (void)setHasRxErrorDelayedTimeout:(BOOL)a3;
- (void)setHasRxErrorDelayedTimeslotEnded:(BOOL)a3;
- (void)setHasRxErrorDestAddrFiltered:(BOOL)a3;
- (void)setHasRxErrorInvalidData:(BOOL)a3;
- (void)setHasRxErrorInvalidFcs:(BOOL)a3;
- (void)setHasRxErrorInvalidFrame:(BOOL)a3;
- (void)setHasRxErrorInvalidLength:(BOOL)a3;
- (void)setHasRxErrorReceiveFailed:(BOOL)a3;
- (void)setHasRxErrorRuntimeDelay:(BOOL)a3;
- (void)setHasRxErrorTimeslotEnded:(BOOL)a3;
- (void)setHasSleepState:(BOOL)a3;
- (void)setHasTransmittedFrames:(BOOL)a3;
- (void)setHasTransmittingTime:(BOOL)a3;
- (void)setHasTxDelay90perc:(BOOL)a3;
- (void)setHasTxDelayAvg:(BOOL)a3;
- (void)setHasTxDelayMax:(BOOL)a3;
- (void)setHasTxDelayMin:(BOOL)a3;
- (void)setHasTxErrorAckNoMem:(BOOL)a3;
- (void)setHasTxErrorBusyChannelCcaNotStarted:(BOOL)a3;
- (void)setHasTxErrorChannelAccessCcaBusy:(BOOL)a3;
- (void)setHasTxErrorChannelAccessFailure:(BOOL)a3;
- (void)setHasTxErrorInvalidAck:(BOOL)a3;
- (void)setHasTxErrorNoAck:(BOOL)a3;
- (void)setHasTxErrorNotGranted:(BOOL)a3;
- (void)setHasTxErrorTimeslotDenied:(BOOL)a3;
- (void)setHasTxErrorTimeslotEnded:(BOOL)a3;
- (void)setHasTxErrorTxAborted:(BOOL)a3;
- (void)setHasTxErrorTxAbortedCcaTx:(BOOL)a3;
- (void)setHasTxErrorTxAbortedCsmaBackoff:(BOOL)a3;
- (void)setHasTxErrorTxAbortedCsmaCfgBackoff:(BOOL)a3;
- (void)setHasTxErrorTxAbortedCsmaPrepare:(BOOL)a3;
- (void)setHasTxErrorTxAbortedIfs:(BOOL)a3;
- (void)setHasTxErrorTxAbortedRxAck:(BOOL)a3;
- (void)setHasTxErrorTxAbortedTx:(BOOL)a3;
- (void)setListeningTime:(unsigned int)a3;
- (void)setRadioReceivedFrames:(unsigned int)a3;
- (void)setRadioStatusDoubleNotification:(unsigned int)a3;
- (void)setReceivedEnergyEvents:(unsigned int)a3;
- (void)setReceivedFrames:(unsigned int)a3;
- (void)setReceivedPreambles:(unsigned int)a3;
- (void)setReceivingTime:(unsigned int)a3;
- (void)setRetryInterval90perc:(unsigned int)a3;
- (void)setRetryIntervalAvg:(unsigned int)a3;
- (void)setRetryIntervalMax:(unsigned int)a3;
- (void)setRetryIntervalMin:(unsigned int)a3;
- (void)setRtt90perc:(unsigned int)a3;
- (void)setRttAvgVal:(unsigned int)a3;
- (void)setRttMaxVal:(unsigned int)a3;
- (void)setRttMinVal:(unsigned int)a3;
- (void)setRxErrorAborted:(unsigned int)a3;
- (void)setRxErrorAckAborted:(unsigned int)a3;
- (void)setRxErrorAckDenied:(unsigned int)a3;
- (void)setRxErrorAckFailedRadioDelay:(unsigned int)a3;
- (void)setRxErrorAckFailedRadioState:(unsigned int)a3;
- (void)setRxErrorDelayedTimeout:(unsigned int)a3;
- (void)setRxErrorDelayedTimeslotEnded:(unsigned int)a3;
- (void)setRxErrorDestAddrFiltered:(unsigned int)a3;
- (void)setRxErrorInvalidData:(unsigned int)a3;
- (void)setRxErrorInvalidFcs:(unsigned int)a3;
- (void)setRxErrorInvalidFrame:(unsigned int)a3;
- (void)setRxErrorInvalidLength:(unsigned int)a3;
- (void)setRxErrorReceiveFailed:(unsigned int)a3;
- (void)setRxErrorRuntimeDelay:(unsigned int)a3;
- (void)setRxErrorTimeslotEnded:(unsigned int)a3;
- (void)setSRadioStats:(id)a3;
- (void)setSleepState:(unsigned int)a3;
- (void)setTransmittedFrames:(unsigned int)a3;
- (void)setTransmittingTime:(unsigned int)a3;
- (void)setTxDelay90perc:(unsigned int)a3;
- (void)setTxDelayAvg:(unsigned int)a3;
- (void)setTxDelayMax:(unsigned int)a3;
- (void)setTxDelayMin:(unsigned int)a3;
- (void)setTxErrorAckNoMem:(unsigned int)a3;
- (void)setTxErrorBusyChannelCcaNotStarted:(unsigned int)a3;
- (void)setTxErrorChannelAccessCcaBusy:(unsigned int)a3;
- (void)setTxErrorChannelAccessFailure:(unsigned int)a3;
- (void)setTxErrorInvalidAck:(unsigned int)a3;
- (void)setTxErrorNoAck:(unsigned int)a3;
- (void)setTxErrorNotGranted:(unsigned int)a3;
- (void)setTxErrorTimeslotDenied:(unsigned int)a3;
- (void)setTxErrorTimeslotEnded:(unsigned int)a3;
- (void)setTxErrorTxAborted:(unsigned int)a3;
- (void)setTxErrorTxAbortedCcaTx:(unsigned int)a3;
- (void)setTxErrorTxAbortedCsmaBackoff:(unsigned int)a3;
- (void)setTxErrorTxAbortedCsmaCfgBackoff:(unsigned int)a3;
- (void)setTxErrorTxAbortedCsmaPrepare:(unsigned int)a3;
- (void)setTxErrorTxAbortedIfs:(unsigned int)a3;
- (void)setTxErrorTxAbortedRxAck:(unsigned int)a3;
- (void)setTxErrorTxAbortedTx:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersRadioS

- (void)setCcaFailedAttempts:(unsigned int)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_ccaFailedAttempts = a3;
}

- (void)setHasCcaFailedAttempts:(BOOL)a3
{
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasCcaFailedAttempts
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setRadioReceivedFrames:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_radioReceivedFrames = a3;
}

- (void)setHasRadioReceivedFrames:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasRadioReceivedFrames
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setReceivedEnergyEvents:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_receivedEnergyEvents = a3;
}

- (void)setHasReceivedEnergyEvents:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasReceivedEnergyEvents
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setReceivedPreambles:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_receivedPreambles = a3;
}

- (void)setHasReceivedPreambles:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasReceivedPreambles
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (BOOL)hasSRadioStats
{
  return self->_sRadioStats != 0;
}

- (void)setRttMinVal:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_rttMinVal = a3;
}

- (void)setHasRttMinVal:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasRttMinVal
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRttMaxVal:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_rttMaxVal = a3;
}

- (void)setHasRttMaxVal:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasRttMaxVal
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setRttAvgVal:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_rttAvgVal = a3;
}

- (void)setHasRttAvgVal:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasRttAvgVal
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setRtt90perc:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_rtt90perc = a3;
}

- (void)setHasRtt90perc:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasRtt90perc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setRetryIntervalMin:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_retryIntervalMin = a3;
}

- (void)setHasRetryIntervalMin:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasRetryIntervalMin
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRetryIntervalMax:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_retryIntervalMax = a3;
}

- (void)setHasRetryIntervalMax:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasRetryIntervalMax
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRetryIntervalAvg:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_retryIntervalAvg = a3;
}

- (void)setHasRetryIntervalAvg:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasRetryIntervalAvg
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRetryInterval90perc:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_retryInterval90perc = a3;
}

- (void)setHasRetryInterval90perc:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasRetryInterval90perc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTxDelayMin:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_txDelayMin = a3;
}

- (void)setHasTxDelayMin:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasTxDelayMin
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setTxDelayMax:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_txDelayMax = a3;
}

- (void)setHasTxDelayMax:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasTxDelayMax
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setTxDelayAvg:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_txDelayAvg = a3;
}

- (void)setHasTxDelayAvg:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasTxDelayAvg
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setTxDelay90perc:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_txDelay90perc = a3;
}

- (void)setHasTxDelay90perc:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasTxDelay90perc
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setListeningTime:(unsigned int)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_listeningTime = a3;
}

- (void)setHasListeningTime:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasListeningTime
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setReceivingTime:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_receivingTime = a3;
}

- (void)setHasReceivingTime:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasReceivingTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTransmittingTime:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_transmittingTime = a3;
}

- (void)setHasTransmittingTime:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasTransmittingTime
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setTransmittedFrames:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_transmittedFrames = a3;
}

- (void)setHasTransmittedFrames:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasTransmittedFrames
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setTxErrorTimeslotEnded:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_txErrorTimeslotEnded = a3;
}

- (void)setHasTxErrorTimeslotEnded:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTimeslotEnded
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (void)setTxErrorTimeslotDenied:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_txErrorTimeslotDenied = a3;
}

- (void)setHasTxErrorTimeslotDenied:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTimeslotDenied
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setTxErrorBusyChannelCcaNotStarted:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_txErrorBusyChannelCcaNotStarted = a3;
}

- (void)setHasTxErrorBusyChannelCcaNotStarted:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorBusyChannelCcaNotStarted
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setTxErrorChannelAccessCcaBusy:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_txErrorChannelAccessCcaBusy = a3;
}

- (void)setHasTxErrorChannelAccessCcaBusy:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorChannelAccessCcaBusy
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setTxErrorChannelAccessFailure:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_txErrorChannelAccessFailure = a3;
}

- (void)setHasTxErrorChannelAccessFailure:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorChannelAccessFailure
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setTxErrorTxAborted:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_txErrorTxAborted = a3;
}

- (void)setHasTxErrorTxAborted:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAborted
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setTxErrorTxAbortedCsmaCfgBackoff:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_txErrorTxAbortedCsmaCfgBackoff = a3;
}

- (void)setHasTxErrorTxAbortedCsmaCfgBackoff:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAbortedCsmaCfgBackoff
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (void)setTxErrorTxAbortedCsmaBackoff:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_txErrorTxAbortedCsmaBackoff = a3;
}

- (void)setHasTxErrorTxAbortedCsmaBackoff:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAbortedCsmaBackoff
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setTxErrorTxAbortedCsmaPrepare:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_txErrorTxAbortedCsmaPrepare = a3;
}

- (void)setHasTxErrorTxAbortedCsmaPrepare:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAbortedCsmaPrepare
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setTxErrorTxAbortedIfs:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_txErrorTxAbortedIfs = a3;
}

- (void)setHasTxErrorTxAbortedIfs:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAbortedIfs
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (void)setTxErrorTxAbortedRxAck:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_txErrorTxAbortedRxAck = a3;
}

- (void)setHasTxErrorTxAbortedRxAck:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAbortedRxAck
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (void)setTxErrorTxAbortedCcaTx:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_txErrorTxAbortedCcaTx = a3;
}

- (void)setHasTxErrorTxAbortedCcaTx:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAbortedCcaTx
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setTxErrorTxAbortedTx:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_txErrorTxAbortedTx = a3;
}

- (void)setHasTxErrorTxAbortedTx:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorTxAbortedTx
{
  return *((unsigned char *)&self->_has + 7) & 1;
}

- (void)setTxErrorNotGranted:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_txErrorNotGranted = a3;
}

- (void)setHasTxErrorNotGranted:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorNotGranted
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setTxErrorInvalidAck:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_txErrorInvalidAck = a3;
}

- (void)setHasTxErrorInvalidAck:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorInvalidAck
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setTxErrorNoAck:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_txErrorNoAck = a3;
}

- (void)setHasTxErrorNoAck:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorNoAck
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setTxErrorAckNoMem:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_txErrorAckNoMem = a3;
}

- (void)setHasTxErrorAckNoMem:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasTxErrorAckNoMem
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setReceivedFrames:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_receivedFrames = a3;
}

- (void)setHasReceivedFrames:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasReceivedFrames
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setRxErrorReceiveFailed:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_rxErrorReceiveFailed = a3;
}

- (void)setHasRxErrorReceiveFailed:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasRxErrorReceiveFailed
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setRxErrorInvalidFrame:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_rxErrorInvalidFrame = a3;
}

- (void)setHasRxErrorInvalidFrame:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasRxErrorInvalidFrame
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setRxErrorDelayedTimeout:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_rxErrorDelayedTimeout = a3;
}

- (void)setHasRxErrorDelayedTimeout:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasRxErrorDelayedTimeout
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setRxErrorInvalidFcs:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_rxErrorInvalidFcs = a3;
}

- (void)setHasRxErrorInvalidFcs:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasRxErrorInvalidFcs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setRxErrorDestAddrFiltered:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_rxErrorDestAddrFiltered = a3;
}

- (void)setHasRxErrorDestAddrFiltered:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasRxErrorDestAddrFiltered
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setRxErrorRuntimeDelay:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_rxErrorRuntimeDelay = a3;
}

- (void)setHasRxErrorRuntimeDelay:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasRxErrorRuntimeDelay
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setRxErrorTimeslotEnded:(unsigned int)a3
{
  *(void *)&self->_has |= (unint64_t)&_mh_execute_header;
  self->_rxErrorTimeslotEnded = a3;
}

- (void)setHasRxErrorTimeslotEnded:(BOOL)a3
{
  uint64_t v3 = &_mh_execute_header;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | (unint64_t)v3);
}

- (BOOL)hasRxErrorTimeslotEnded
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setRxErrorAborted:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_rxErrorAborted = a3;
}

- (void)setHasRxErrorAborted:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasRxErrorAborted
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setRxErrorDelayedTimeslotEnded:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_rxErrorDelayedTimeslotEnded = a3;
}

- (void)setHasRxErrorDelayedTimeslotEnded:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasRxErrorDelayedTimeslotEnded
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setRxErrorInvalidLength:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_rxErrorInvalidLength = a3;
}

- (void)setHasRxErrorInvalidLength:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasRxErrorInvalidLength
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setRxErrorInvalidData:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_rxErrorInvalidData = a3;
}

- (void)setHasRxErrorInvalidData:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasRxErrorInvalidData
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setRxErrorAckFailedRadioState:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_rxErrorAckFailedRadioState = a3;
}

- (void)setHasRxErrorAckFailedRadioState:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasRxErrorAckFailedRadioState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setRxErrorAckFailedRadioDelay:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_rxErrorAckFailedRadioDelay = a3;
}

- (void)setHasRxErrorAckFailedRadioDelay:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasRxErrorAckFailedRadioDelay
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setRxErrorAckDenied:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_rxErrorAckDenied = a3;
}

- (void)setHasRxErrorAckDenied:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasRxErrorAckDenied
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setRxErrorAckAborted:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_rxErrorAckAborted = a3;
}

- (void)setHasRxErrorAckAborted:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasRxErrorAckAborted
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSleepState:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_sleepState = a3;
}

- (void)setHasSleepState:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasSleepState
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setEnergyDetectedRequests:(unsigned int)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_energyDetectedRequests = a3;
}

- (void)setHasEnergyDetectedRequests:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasEnergyDetectedRequests
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEnergyDetectedEvents:(unsigned int)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_energyDetectedEvents = a3;
}

- (void)setHasEnergyDetectedEvents:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasEnergyDetectedEvents
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRadioStatusDoubleNotification:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_radioStatusDoubleNotification = a3;
}

- (void)setHasRadioStatusDoubleNotification:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($2059B406CAF625EF4BB33881A00C687A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasRadioStatusDoubleNotification
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCountersRadioS;
  uint64_t v3 = [(AWDCountersRadioS *)&v7 description];
  v4 = [(AWDCountersRadioS *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if (*(unsigned char *)&has)
  {
    v11 = +[NSNumber numberWithUnsignedInt:self->_ccaFailedAttempts];
    [v3 setObject:v11 forKey:@"cca_failed_attempts"];

    $2059B406CAF625EF4BB33881A00C687A has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_64;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v12 = +[NSNumber numberWithUnsignedInt:self->_radioReceivedFrames];
  [v3 setObject:v12 forKey:@"radio_received_frames"];

  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_65;
  }
LABEL_64:
  v13 = +[NSNumber numberWithUnsignedInt:self->_receivedEnergyEvents];
  [v3 setObject:v13 forKey:@"received_energy_events"];

  if ((*(void *)&self->_has & 0x100) == 0)
  {
LABEL_5:
    sRadioStats = self->_sRadioStats;
    if (!sRadioStats) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_65:
  v14 = +[NSNumber numberWithUnsignedInt:self->_receivedPreambles];
  [v3 setObject:v14 forKey:@"received_preambles"];

  sRadioStats = self->_sRadioStats;
  if (sRadioStats)
  {
LABEL_6:
    v6 = [(AWDRadioStatsS *)sRadioStats dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"s_radio_stats"];
  }
LABEL_7:
  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) != 0)
  {
    v15 = +[NSNumber numberWithUnsignedInt:self->_rttMinVal];
    [v3 setObject:v15 forKey:@"rtt_min_val"];

    $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x10000) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&v7 & 0x8000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_69;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
    goto LABEL_9;
  }
  v16 = +[NSNumber numberWithUnsignedInt:self->_rttMaxVal];
  [v3 setObject:v16 forKey:@"rtt_max_val"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_70;
  }
LABEL_69:
  v17 = +[NSNumber numberWithUnsignedInt:self->_rttAvgVal];
  [v3 setObject:v17 forKey:@"rtt_avg_val"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_71;
  }
LABEL_70:
  v18 = +[NSNumber numberWithUnsignedInt:self->_rtt90perc];
  [v3 setObject:v18 forKey:@"rtt_90perc"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v7 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_72;
  }
LABEL_71:
  v19 = +[NSNumber numberWithUnsignedInt:self->_retryIntervalMin];
  [v3 setObject:v19 forKey:@"retry_interval_min"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v7 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_73;
  }
LABEL_72:
  v20 = +[NSNumber numberWithUnsignedInt:self->_retryIntervalMax];
  [v3 setObject:v20 forKey:@"retry_interval_max"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v7 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_74;
  }
LABEL_73:
  v21 = +[NSNumber numberWithUnsignedInt:self->_retryIntervalAvg];
  [v3 setObject:v21 forKey:@"retry_interval_avg"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_15:
    if ((*(void *)&v7 & 0x8000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_75;
  }
LABEL_74:
  v22 = +[NSNumber numberWithUnsignedInt:self->_retryInterval90perc];
  [v3 setObject:v22 forKey:@"retry_interval_90perc"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x8000000000) == 0)
  {
LABEL_16:
    if ((*(void *)&v7 & 0x4000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_76;
  }
LABEL_75:
  v23 = +[NSNumber numberWithUnsignedInt:self->_txDelayMin];
  [v3 setObject:v23 forKey:@"tx_delay_min"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x4000000000) == 0)
  {
LABEL_17:
    if ((*(void *)&v7 & 0x2000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_77;
  }
LABEL_76:
  v24 = +[NSNumber numberWithUnsignedInt:self->_txDelayMax];
  [v3 setObject:v24 forKey:@"tx_delay_max"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x2000000000) == 0)
  {
LABEL_18:
    if ((*(void *)&v7 & 0x1000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_78;
  }
LABEL_77:
  v25 = +[NSNumber numberWithUnsignedInt:self->_txDelayAvg];
  [v3 setObject:v25 forKey:@"tx_delay_avg"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x1000000000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v7 & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_79;
  }
LABEL_78:
  v26 = +[NSNumber numberWithUnsignedInt:self->_txDelay90perc];
  [v3 setObject:v26 forKey:@"tx_delay_90perc"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(unsigned char *)&v7 & 8) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v7 & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_80;
  }
LABEL_79:
  v27 = +[NSNumber numberWithUnsignedInt:self->_listeningTime];
  [v3 setObject:v27 forKey:@"listening_time"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_21:
    if ((*(void *)&v7 & 0x800000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_81;
  }
LABEL_80:
  v28 = +[NSNumber numberWithUnsignedInt:self->_receivingTime];
  [v3 setObject:v28 forKey:@"receiving_time"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x800000000) == 0)
  {
LABEL_22:
    if ((*(void *)&v7 & 0x400000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_82;
  }
LABEL_81:
  v29 = +[NSNumber numberWithUnsignedInt:self->_transmittingTime];
  [v3 setObject:v29 forKey:@"transmitting_time"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(void *)&v7 & 0x1000000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_83;
  }
LABEL_82:
  v30 = +[NSNumber numberWithUnsignedInt:self->_transmittedFrames];
  [v3 setObject:v30 forKey:@"transmitted_frames"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x1000000000000) == 0)
  {
LABEL_24:
    if ((*(void *)&v7 & 0x800000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_84;
  }
LABEL_83:
  v31 = +[NSNumber numberWithUnsignedInt:self->_txErrorTimeslotEnded];
  [v3 setObject:v31 forKey:@"tx_error_timeslot_ended"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x800000000000) == 0)
  {
LABEL_25:
    if ((*(void *)&v7 & 0x20000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_85;
  }
LABEL_84:
  v32 = +[NSNumber numberWithUnsignedInt:self->_txErrorTimeslotDenied];
  [v3 setObject:v32 forKey:@"tx_error_timeslot_denied"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x20000000000) == 0)
  {
LABEL_26:
    if ((*(void *)&v7 & 0x40000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_86;
  }
LABEL_85:
  v33 = +[NSNumber numberWithUnsignedInt:self->_txErrorBusyChannelCcaNotStarted];
  [v3 setObject:v33 forKey:@"tx_error_busy_channel_cca_not_started"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x40000000000) == 0)
  {
LABEL_27:
    if ((*(void *)&v7 & 0x80000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_87;
  }
LABEL_86:
  v34 = +[NSNumber numberWithUnsignedInt:self->_txErrorChannelAccessCcaBusy];
  [v3 setObject:v34 forKey:@"tx_error_channel_access_cca_busy"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x80000000000) == 0)
  {
LABEL_28:
    if ((*(void *)&v7 & 0x2000000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_88;
  }
LABEL_87:
  v35 = +[NSNumber numberWithUnsignedInt:self->_txErrorChannelAccessFailure];
  [v3 setObject:v35 forKey:@"tx_error_channel_access_failure"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x2000000000000) == 0)
  {
LABEL_29:
    if ((*(void *)&v7 & 0x10000000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_89;
  }
LABEL_88:
  v36 = +[NSNumber numberWithUnsignedInt:self->_txErrorTxAborted];
  [v3 setObject:v36 forKey:@"tx_error_tx_aborted"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x10000000000000) == 0)
  {
LABEL_30:
    if ((*(void *)&v7 & 0x8000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_90;
  }
LABEL_89:
  v37 = +[NSNumber numberWithUnsignedInt:self->_txErrorTxAbortedCsmaCfgBackoff];
  [v3 setObject:v37 forKey:@"tx_error_tx_aborted_csma_cfg_backoff"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x8000000000000) == 0)
  {
LABEL_31:
    if ((*(void *)&v7 & 0x20000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_91;
  }
LABEL_90:
  v38 = +[NSNumber numberWithUnsignedInt:self->_txErrorTxAbortedCsmaBackoff];
  [v3 setObject:v38 forKey:@"tx_error_tx_aborted_csma_backoff"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x20000000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&v7 & 0x40000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_92;
  }
LABEL_91:
  v39 = +[NSNumber numberWithUnsignedInt:self->_txErrorTxAbortedCsmaPrepare];
  [v3 setObject:v39 forKey:@"tx_error_tx_aborted_csma_prepare"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x40000000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&v7 & 0x80000000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_93;
  }
LABEL_92:
  v40 = +[NSNumber numberWithUnsignedInt:self->_txErrorTxAbortedIfs];
  [v3 setObject:v40 forKey:@"tx_error_tx_aborted_ifs"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x80000000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&v7 & 0x4000000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_94;
  }
LABEL_93:
  v41 = +[NSNumber numberWithUnsignedInt:self->_txErrorTxAbortedRxAck];
  [v3 setObject:v41 forKey:@"tx_error_tx_aborted_rx_ack"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x4000000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&v7 & 0x100000000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_95;
  }
LABEL_94:
  v42 = +[NSNumber numberWithUnsignedInt:self->_txErrorTxAbortedCcaTx];
  [v3 setObject:v42 forKey:@"tx_error_tx_aborted_cca_tx"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x100000000000000) == 0)
  {
LABEL_36:
    if ((*(void *)&v7 & 0x400000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_96;
  }
LABEL_95:
  v43 = +[NSNumber numberWithUnsignedInt:self->_txErrorTxAbortedTx];
  [v3 setObject:v43 forKey:@"tx_error_tx_aborted_tx"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x400000000000) == 0)
  {
LABEL_37:
    if ((*(void *)&v7 & 0x100000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_97;
  }
LABEL_96:
  v44 = +[NSNumber numberWithUnsignedInt:self->_txErrorNotGranted];
  [v3 setObject:v44 forKey:@"tx_error_not_granted"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x100000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&v7 & 0x200000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_98;
  }
LABEL_97:
  v45 = +[NSNumber numberWithUnsignedInt:self->_txErrorInvalidAck];
  [v3 setObject:v45 forKey:@"tx_error_invalid_ack"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x200000000000) == 0)
  {
LABEL_39:
    if ((*(void *)&v7 & 0x10000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_99;
  }
LABEL_98:
  v46 = +[NSNumber numberWithUnsignedInt:self->_txErrorNoAck];
  [v3 setObject:v46 forKey:@"tx_error_no_ack"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x10000000000) == 0)
  {
LABEL_40:
    if ((*(unsigned char *)&v7 & 0x80) == 0) {
      goto LABEL_41;
    }
    goto LABEL_100;
  }
LABEL_99:
  v47 = +[NSNumber numberWithUnsignedInt:self->_txErrorAckNoMem];
  [v3 setObject:v47 forKey:@"tx_error_ack_no_mem"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_101;
  }
LABEL_100:
  v48 = +[NSNumber numberWithUnsignedInt:self->_receivedFrames];
  [v3 setObject:v48 forKey:@"received_frames"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v7 & 0x10000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_102;
  }
LABEL_101:
  v49 = +[NSNumber numberWithUnsignedInt:self->_rxErrorReceiveFailed];
  [v3 setObject:v49 forKey:@"rx_error_receive_failed"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v7 & 0x800000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_103;
  }
LABEL_102:
  v50 = +[NSNumber numberWithUnsignedInt:self->_rxErrorInvalidFrame];
  [v3 setObject:v50 forKey:@"rx_error_invalid_frame"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v7 & 0x8000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_104;
  }
LABEL_103:
  v51 = +[NSNumber numberWithUnsignedInt:self->_rxErrorDelayedTimeout];
  [v3 setObject:v51 forKey:@"rx_error_delayed_timeout"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x8000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v7 & 0x2000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_105;
  }
LABEL_104:
  v52 = +[NSNumber numberWithUnsignedInt:self->_rxErrorInvalidFcs];
  [v3 setObject:v52 forKey:@"rx_error_invalid_fcs"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v7 & 0x80000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_106;
  }
LABEL_105:
  v53 = +[NSNumber numberWithUnsignedInt:self->_rxErrorDestAddrFiltered];
  [v3 setObject:v53 forKey:@"rx_error_dest_addr_filtered"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000000) == 0)
  {
LABEL_47:
    if ((*(void *)&v7 & 0x100000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_107;
  }
LABEL_106:
  v54 = +[NSNumber numberWithUnsignedInt:self->_rxErrorRuntimeDelay];
  [v3 setObject:v54 forKey:@"rx_error_runtime_delay"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x100000000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v7 & 0x40000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_108;
  }
LABEL_107:
  v55 = +[NSNumber numberWithUnsignedInt:self->_rxErrorTimeslotEnded];
  [v3 setObject:v55 forKey:@"rx_error_timeslot_ended"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_109;
  }
LABEL_108:
  v56 = +[NSNumber numberWithUnsignedInt:self->_rxErrorAborted];
  [v3 setObject:v56 forKey:@"rx_error_aborted"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v7 & 0x20000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_110;
  }
LABEL_109:
  v57 = +[NSNumber numberWithUnsignedInt:self->_rxErrorDelayedTimeslotEnded];
  [v3 setObject:v57 forKey:@"rx_error_delayed_timeslot_ended"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v7 & 0x4000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_111;
  }
LABEL_110:
  v58 = +[NSNumber numberWithUnsignedInt:self->_rxErrorInvalidLength];
  [v3 setObject:v58 forKey:@"rx_error_invalid_length"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x4000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v7 & 0x400000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_112;
  }
LABEL_111:
  v59 = +[NSNumber numberWithUnsignedInt:self->_rxErrorInvalidData];
  [v3 setObject:v59 forKey:@"rx_error_invalid_data"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v7 & 0x200000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_113;
  }
LABEL_112:
  v60 = +[NSNumber numberWithUnsignedInt:self->_rxErrorAckFailedRadioState];
  [v3 setObject:v60 forKey:@"rx_error_ack_failed_radio_state"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v7 & 0x100000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_114;
  }
LABEL_113:
  v61 = +[NSNumber numberWithUnsignedInt:self->_rxErrorAckFailedRadioDelay];
  [v3 setObject:v61 forKey:@"rx_error_ack_failed_radio_delay"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v7 & 0x80000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_115;
  }
LABEL_114:
  v62 = +[NSNumber numberWithUnsignedInt:self->_rxErrorAckDenied];
  [v3 setObject:v62 forKey:@"rx_error_ack_denied"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_56:
    if ((*(void *)&v7 & 0x200000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_116;
  }
LABEL_115:
  v63 = +[NSNumber numberWithUnsignedInt:self->_rxErrorAckAborted];
  [v3 setObject:v63 forKey:@"rx_error_ack_aborted"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(void *)&v7 & 0x200000000) == 0)
  {
LABEL_57:
    if ((*(unsigned char *)&v7 & 4) == 0) {
      goto LABEL_58;
    }
    goto LABEL_117;
  }
LABEL_116:
  v64 = +[NSNumber numberWithUnsignedInt:self->_sleepState];
  [v3 setObject:v64 forKey:@"sleep_state"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(unsigned char *)&v7 & 4) == 0)
  {
LABEL_58:
    if ((*(unsigned char *)&v7 & 2) == 0) {
      goto LABEL_59;
    }
LABEL_118:
    v66 = +[NSNumber numberWithUnsignedInt:self->_energyDetectedEvents];
    [v3 setObject:v66 forKey:@"energy_detected_events"];

    if ((*(void *)&self->_has & 0x20) == 0) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
LABEL_117:
  v65 = +[NSNumber numberWithUnsignedInt:self->_energyDetectedRequests];
  [v3 setObject:v65 forKey:@"energy_detected_requests"];

  $2059B406CAF625EF4BB33881A00C687A v7 = self->_has;
  if ((*(unsigned char *)&v7 & 2) != 0) {
    goto LABEL_118;
  }
LABEL_59:
  if ((*(unsigned char *)&v7 & 0x20) != 0)
  {
LABEL_60:
    v8 = +[NSNumber numberWithUnsignedInt:self->_radioStatusDoubleNotification];
    [v3 setObject:v8 forKey:@"radio_status_double_notification"];
  }
LABEL_61:
  id v9 = v3;

  return v9;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCountersRadioSReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint32Field();
    $2059B406CAF625EF4BB33881A00C687A has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_65;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x100) == 0)
  {
LABEL_5:
    if (!self->_sRadioStats) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  if (self->_sRadioStats) {
LABEL_6:
  }
    PBDataWriterWriteSubmessage();
LABEL_7:
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
    if ((*(_DWORD *)&v5 & 0x10000) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&v5 & 0x8000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_70;
    }
  }
  else if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v5 & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&v5 & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v5 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v5 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v5 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_15:
    if ((*(void *)&v5 & 0x8000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x8000000000) == 0)
  {
LABEL_16:
    if ((*(void *)&v5 & 0x4000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x4000000000) == 0)
  {
LABEL_17:
    if ((*(void *)&v5 & 0x2000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x2000000000) == 0)
  {
LABEL_18:
    if ((*(void *)&v5 & 0x1000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x1000000000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v5 & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(unsigned char *)&v5 & 8) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v5 & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) == 0)
  {
LABEL_21:
    if ((*(void *)&v5 & 0x800000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x800000000) == 0)
  {
LABEL_22:
    if ((*(void *)&v5 & 0x400000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(void *)&v5 & 0x1000000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x1000000000000) == 0)
  {
LABEL_24:
    if ((*(void *)&v5 & 0x800000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x800000000000) == 0)
  {
LABEL_25:
    if ((*(void *)&v5 & 0x20000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x20000000000) == 0)
  {
LABEL_26:
    if ((*(void *)&v5 & 0x40000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x40000000000) == 0)
  {
LABEL_27:
    if ((*(void *)&v5 & 0x80000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x80000000000) == 0)
  {
LABEL_28:
    if ((*(void *)&v5 & 0x2000000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x2000000000000) == 0)
  {
LABEL_29:
    if ((*(void *)&v5 & 0x10000000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x10000000000000) == 0)
  {
LABEL_30:
    if ((*(void *)&v5 & 0x8000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x8000000000000) == 0)
  {
LABEL_31:
    if ((*(void *)&v5 & 0x20000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x20000000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&v5 & 0x40000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x40000000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&v5 & 0x80000000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x80000000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&v5 & 0x4000000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x4000000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&v5 & 0x100000000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x100000000000000) == 0)
  {
LABEL_36:
    if ((*(void *)&v5 & 0x400000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x400000000000) == 0)
  {
LABEL_37:
    if ((*(void *)&v5 & 0x100000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x100000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&v5 & 0x200000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x200000000000) == 0)
  {
LABEL_39:
    if ((*(void *)&v5 & 0x10000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x10000000000) == 0)
  {
LABEL_40:
    if ((*(unsigned char *)&v5 & 0x80) == 0) {
      goto LABEL_41;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x80) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v5 & 0x40000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v5 & 0x10000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v5 & 0x800000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x800000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v5 & 0x8000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x8000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v5 & 0x2000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x2000000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v5 & 0x80000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000000) == 0)
  {
LABEL_47:
    if ((*(void *)&v5 & 0x100000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x100000000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v5 & 0x40000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v5 & 0x1000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v5 & 0x20000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v5 & 0x4000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x4000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v5 & 0x400000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x400000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v5 & 0x200000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v5 & 0x100000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v5 & 0x80000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000) == 0)
  {
LABEL_56:
    if ((*(void *)&v5 & 0x200000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(void *)&v5 & 0x200000000) == 0)
  {
LABEL_57:
    if ((*(unsigned char *)&v5 & 4) == 0) {
      goto LABEL_58;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(unsigned char *)&v5 & 4) == 0)
  {
LABEL_58:
    if ((*(unsigned char *)&v5 & 2) == 0) {
      goto LABEL_59;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteUint32Field();
  $2059B406CAF625EF4BB33881A00C687A v5 = self->_has;
  if ((*(unsigned char *)&v5 & 2) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&v5 & 0x20) == 0) {
      goto LABEL_60;
    }
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x20) == 0)
  {
LABEL_60:
    v6 = v7;
    goto LABEL_62;
  }
LABEL_120:
  PBDataWriterWriteUint32Field();
  v6 = v7;

LABEL_62:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[2] = self->_ccaFailedAttempts;
    *((void *)v4 + 31) |= 1uLL;
    $2059B406CAF625EF4BB33881A00C687A has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_65;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_radioReceivedFrames;
  *((void *)v4 + 31) |= 0x10uLL;
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_66;
  }
LABEL_65:
  v4[8] = self->_receivedEnergyEvents;
  *((void *)v4 + 31) |= 0x40uLL;
  if ((*(void *)&self->_has & 0x100) == 0)
  {
LABEL_5:
    if (!self->_sRadioStats) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_66:
  v4[10] = self->_receivedPreambles;
  *((void *)v4 + 31) |= 0x100uLL;
  if (self->_sRadioStats)
  {
LABEL_6:
    id v7 = v4;
    objc_msgSend(v4, "setSRadioStats:");
    v4 = v7;
  }
LABEL_7:
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) != 0)
  {
    v4[19] = self->_rttMinVal;
    *((void *)v4 + 31) |= 0x20000uLL;
    $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&v6 & 0x8000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_70;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
    goto LABEL_9;
  }
  v4[18] = self->_rttMaxVal;
  *((void *)v4 + 31) |= 0x10000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_71;
  }
LABEL_70:
  v4[17] = self->_rttAvgVal;
  *((void *)v4 + 31) |= 0x8000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_72;
  }
LABEL_71:
  v4[16] = self->_rtt90perc;
  *((void *)v4 + 31) |= 0x4000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_73;
  }
LABEL_72:
  v4[15] = self->_retryIntervalMin;
  *((void *)v4 + 31) |= 0x2000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_74;
  }
LABEL_73:
  v4[14] = self->_retryIntervalMax;
  *((void *)v4 + 31) |= 0x1000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_75;
  }
LABEL_74:
  v4[13] = self->_retryIntervalAvg;
  *((void *)v4 + 31) |= 0x800uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_15:
    if ((*(void *)&v6 & 0x8000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_76;
  }
LABEL_75:
  v4[12] = self->_retryInterval90perc;
  *((void *)v4 + 31) |= 0x400uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x8000000000) == 0)
  {
LABEL_16:
    if ((*(void *)&v6 & 0x4000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_77;
  }
LABEL_76:
  v4[44] = self->_txDelayMin;
  *((void *)v4 + 31) |= 0x8000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x4000000000) == 0)
  {
LABEL_17:
    if ((*(void *)&v6 & 0x2000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_78;
  }
LABEL_77:
  v4[43] = self->_txDelayMax;
  *((void *)v4 + 31) |= 0x4000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x2000000000) == 0)
  {
LABEL_18:
    if ((*(void *)&v6 & 0x1000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_79;
  }
LABEL_78:
  v4[42] = self->_txDelayAvg;
  *((void *)v4 + 31) |= 0x2000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x1000000000) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_80;
  }
LABEL_79:
  v4[41] = self->_txDelay90perc;
  *((void *)v4 + 31) |= 0x1000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_81;
  }
LABEL_80:
  v4[5] = self->_listeningTime;
  *((void *)v4 + 31) |= 8uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_21:
    if ((*(void *)&v6 & 0x800000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_82;
  }
LABEL_81:
  v4[11] = self->_receivingTime;
  *((void *)v4 + 31) |= 0x200uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x800000000) == 0)
  {
LABEL_22:
    if ((*(void *)&v6 & 0x400000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_83;
  }
LABEL_82:
  v4[40] = self->_transmittingTime;
  *((void *)v4 + 31) |= 0x800000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(void *)&v6 & 0x1000000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_84;
  }
LABEL_83:
  v4[39] = self->_transmittedFrames;
  *((void *)v4 + 31) |= 0x400000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x1000000000000) == 0)
  {
LABEL_24:
    if ((*(void *)&v6 & 0x800000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_85;
  }
LABEL_84:
  v4[53] = self->_txErrorTimeslotEnded;
  *((void *)v4 + 31) |= 0x1000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x800000000000) == 0)
  {
LABEL_25:
    if ((*(void *)&v6 & 0x20000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_86;
  }
LABEL_85:
  v4[52] = self->_txErrorTimeslotDenied;
  *((void *)v4 + 31) |= 0x800000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x20000000000) == 0)
  {
LABEL_26:
    if ((*(void *)&v6 & 0x40000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_87;
  }
LABEL_86:
  v4[46] = self->_txErrorBusyChannelCcaNotStarted;
  *((void *)v4 + 31) |= 0x20000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x40000000000) == 0)
  {
LABEL_27:
    if ((*(void *)&v6 & 0x80000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_88;
  }
LABEL_87:
  v4[47] = self->_txErrorChannelAccessCcaBusy;
  *((void *)v4 + 31) |= 0x40000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x80000000000) == 0)
  {
LABEL_28:
    if ((*(void *)&v6 & 0x2000000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_89;
  }
LABEL_88:
  v4[48] = self->_txErrorChannelAccessFailure;
  *((void *)v4 + 31) |= 0x80000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x2000000000000) == 0)
  {
LABEL_29:
    if ((*(void *)&v6 & 0x10000000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_90;
  }
LABEL_89:
  v4[54] = self->_txErrorTxAborted;
  *((void *)v4 + 31) |= 0x2000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x10000000000000) == 0)
  {
LABEL_30:
    if ((*(void *)&v6 & 0x8000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_91;
  }
LABEL_90:
  v4[57] = self->_txErrorTxAbortedCsmaCfgBackoff;
  *((void *)v4 + 31) |= 0x10000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x8000000000000) == 0)
  {
LABEL_31:
    if ((*(void *)&v6 & 0x20000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_92;
  }
LABEL_91:
  v4[56] = self->_txErrorTxAbortedCsmaBackoff;
  *((void *)v4 + 31) |= 0x8000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x20000000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&v6 & 0x40000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_93;
  }
LABEL_92:
  v4[58] = self->_txErrorTxAbortedCsmaPrepare;
  *((void *)v4 + 31) |= 0x20000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x40000000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&v6 & 0x80000000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_94;
  }
LABEL_93:
  v4[59] = self->_txErrorTxAbortedIfs;
  *((void *)v4 + 31) |= 0x40000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x80000000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&v6 & 0x4000000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_95;
  }
LABEL_94:
  v4[60] = self->_txErrorTxAbortedRxAck;
  *((void *)v4 + 31) |= 0x80000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x4000000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&v6 & 0x100000000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_96;
  }
LABEL_95:
  v4[55] = self->_txErrorTxAbortedCcaTx;
  *((void *)v4 + 31) |= 0x4000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x100000000000000) == 0)
  {
LABEL_36:
    if ((*(void *)&v6 & 0x400000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_97;
  }
LABEL_96:
  v4[61] = self->_txErrorTxAbortedTx;
  *((void *)v4 + 31) |= 0x100000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x400000000000) == 0)
  {
LABEL_37:
    if ((*(void *)&v6 & 0x100000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_98;
  }
LABEL_97:
  v4[51] = self->_txErrorNotGranted;
  *((void *)v4 + 31) |= 0x400000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x100000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&v6 & 0x200000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_99;
  }
LABEL_98:
  v4[49] = self->_txErrorInvalidAck;
  *((void *)v4 + 31) |= 0x100000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x200000000000) == 0)
  {
LABEL_39:
    if ((*(void *)&v6 & 0x10000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_100;
  }
LABEL_99:
  v4[50] = self->_txErrorNoAck;
  *((void *)v4 + 31) |= 0x200000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x10000000000) == 0)
  {
LABEL_40:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_41;
    }
    goto LABEL_101;
  }
LABEL_100:
  v4[45] = self->_txErrorAckNoMem;
  *((void *)v4 + 31) |= 0x10000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v6 & 0x40000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_102;
  }
LABEL_101:
  v4[9] = self->_receivedFrames;
  *((void *)v4 + 31) |= 0x80uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_103;
  }
LABEL_102:
  v4[32] = self->_rxErrorReceiveFailed;
  *((void *)v4 + 31) |= 0x40000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v6 & 0x800000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_104;
  }
LABEL_103:
  v4[30] = self->_rxErrorInvalidFrame;
  *((void *)v4 + 31) |= 0x10000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_105;
  }
LABEL_104:
  v4[25] = self->_rxErrorDelayedTimeout;
  *((void *)v4 + 31) |= 0x800000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v6 & 0x2000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_106;
  }
LABEL_105:
  v4[29] = self->_rxErrorInvalidFcs;
  *((void *)v4 + 31) |= 0x8000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v6 & 0x80000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_107;
  }
LABEL_106:
  v4[27] = self->_rxErrorDestAddrFiltered;
  *((void *)v4 + 31) |= 0x2000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
LABEL_47:
    if ((*(void *)&v6 & 0x100000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_108;
  }
LABEL_107:
  v4[33] = self->_rxErrorRuntimeDelay;
  *((void *)v4 + 31) |= 0x80000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x100000000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_109;
  }
LABEL_108:
  v4[34] = self->_rxErrorTimeslotEnded;
  *((void *)v4 + 31) |= (unint64_t)&_mh_execute_header;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_110;
  }
LABEL_109:
  v4[20] = self->_rxErrorAborted;
  *((void *)v4 + 31) |= 0x40000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v6 & 0x20000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_111;
  }
LABEL_110:
  v4[26] = self->_rxErrorDelayedTimeslotEnded;
  *((void *)v4 + 31) |= 0x1000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v6 & 0x4000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_112;
  }
LABEL_111:
  v4[31] = self->_rxErrorInvalidLength;
  *((void *)v4 + 31) |= 0x20000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x4000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v6 & 0x400000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_113;
  }
LABEL_112:
  v4[28] = self->_rxErrorInvalidData;
  *((void *)v4 + 31) |= 0x4000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v6 & 0x200000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_114;
  }
LABEL_113:
  v4[24] = self->_rxErrorAckFailedRadioState;
  *((void *)v4 + 31) |= 0x400000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_115;
  }
LABEL_114:
  v4[23] = self->_rxErrorAckFailedRadioDelay;
  *((void *)v4 + 31) |= 0x200000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_116;
  }
LABEL_115:
  v4[22] = self->_rxErrorAckDenied;
  *((void *)v4 + 31) |= 0x100000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_56:
    if ((*(void *)&v6 & 0x200000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_117;
  }
LABEL_116:
  v4[21] = self->_rxErrorAckAborted;
  *((void *)v4 + 31) |= 0x80000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(void *)&v6 & 0x200000000) == 0)
  {
LABEL_57:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_58;
    }
    goto LABEL_118;
  }
LABEL_117:
  v4[38] = self->_sleepState;
  *((void *)v4 + 31) |= 0x200000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_58:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_59;
    }
    goto LABEL_119;
  }
LABEL_118:
  v4[4] = self->_energyDetectedRequests;
  *((void *)v4 + 31) |= 4uLL;
  $2059B406CAF625EF4BB33881A00C687A v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_60;
    }
    goto LABEL_120;
  }
LABEL_119:
  v4[3] = self->_energyDetectedEvents;
  *((void *)v4 + 31) |= 2uLL;
  if ((*(void *)&self->_has & 0x20) == 0)
  {
LABEL_60:
    goto LABEL_62;
  }
LABEL_120:
  v4[7] = self->_radioStatusDoubleNotification;
  *((void *)v4 + 31) |= 0x20uLL;

LABEL_62:
}

- (id)copyWithZone:(_NSZone *)a3
{
  $2059B406CAF625EF4BB33881A00C687A v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $2059B406CAF625EF4BB33881A00C687A v6 = v5;
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if (*(unsigned char *)&has)
  {
    v5[2] = self->_ccaFailedAttempts;
    *((void *)v5 + 31) |= 1uLL;
    $2059B406CAF625EF4BB33881A00C687A has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_63;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[6] = self->_radioReceivedFrames;
  *((void *)v5 + 31) |= 0x10uLL;
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_63:
  v5[8] = self->_receivedEnergyEvents;
  *((void *)v5 + 31) |= 0x40uLL;
  if ((*(void *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v5[10] = self->_receivedPreambles;
    *((void *)v5 + 31) |= 0x100uLL;
  }
LABEL_6:
  id v8 = [(AWDRadioStatsS *)self->_sRadioStats copyWithZone:a3];
  id v9 = (void *)v6[18];
  v6[18] = v8;

  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    *((_DWORD *)v6 + 19) = self->_rttMinVal;
    v6[31] |= 0x20000uLL;
    $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x10000) == 0)
    {
LABEL_8:
      if ((*(_WORD *)&v10 & 0x8000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_67;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x10000) == 0)
  {
    goto LABEL_8;
  }
  *((_DWORD *)v6 + 18) = self->_rttMaxVal;
  v6[31] |= 0x10000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&v10 & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)v6 + 17) = self->_rttAvgVal;
  v6[31] |= 0x8000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v10 & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v6 + 16) = self->_rtt90perc;
  v6[31] |= 0x4000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x2000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&v10 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v6 + 15) = self->_retryIntervalMin;
  v6[31] |= 0x2000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v10 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)v6 + 14) = self->_retryIntervalMax;
  v6[31] |= 0x1000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v10 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)v6 + 13) = self->_retryIntervalAvg;
  v6[31] |= 0x800uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x400) == 0)
  {
LABEL_14:
    if ((*(void *)&v10 & 0x8000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)v6 + 12) = self->_retryInterval90perc;
  v6[31] |= 0x400uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x8000000000) == 0)
  {
LABEL_15:
    if ((*(void *)&v10 & 0x4000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)v6 + 44) = self->_txDelayMin;
  v6[31] |= 0x8000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x4000000000) == 0)
  {
LABEL_16:
    if ((*(void *)&v10 & 0x2000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)v6 + 43) = self->_txDelayMax;
  v6[31] |= 0x4000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x2000000000) == 0)
  {
LABEL_17:
    if ((*(void *)&v10 & 0x1000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)v6 + 42) = self->_txDelayAvg;
  v6[31] |= 0x2000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x1000000000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v10 & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((_DWORD *)v6 + 41) = self->_txDelay90perc;
  v6[31] |= 0x1000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(unsigned char *)&v10 & 8) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v10 & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)v6 + 5) = self->_listeningTime;
  v6[31] |= 8uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) == 0)
  {
LABEL_20:
    if ((*(void *)&v10 & 0x800000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)v6 + 11) = self->_receivingTime;
  v6[31] |= 0x200uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x800000000) == 0)
  {
LABEL_21:
    if ((*(void *)&v10 & 0x400000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)v6 + 40) = self->_transmittingTime;
  v6[31] |= 0x800000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x400000000) == 0)
  {
LABEL_22:
    if ((*(void *)&v10 & 0x1000000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)v6 + 39) = self->_transmittedFrames;
  v6[31] |= 0x400000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x1000000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&v10 & 0x800000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)v6 + 53) = self->_txErrorTimeslotEnded;
  v6[31] |= 0x1000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x800000000000) == 0)
  {
LABEL_24:
    if ((*(void *)&v10 & 0x20000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)v6 + 52) = self->_txErrorTimeslotDenied;
  v6[31] |= 0x800000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x20000000000) == 0)
  {
LABEL_25:
    if ((*(void *)&v10 & 0x40000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((_DWORD *)v6 + 46) = self->_txErrorBusyChannelCcaNotStarted;
  v6[31] |= 0x20000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x40000000000) == 0)
  {
LABEL_26:
    if ((*(void *)&v10 & 0x80000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)v6 + 47) = self->_txErrorChannelAccessCcaBusy;
  v6[31] |= 0x40000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x80000000000) == 0)
  {
LABEL_27:
    if ((*(void *)&v10 & 0x2000000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((_DWORD *)v6 + 48) = self->_txErrorChannelAccessFailure;
  v6[31] |= 0x80000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x2000000000000) == 0)
  {
LABEL_28:
    if ((*(void *)&v10 & 0x10000000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)v6 + 54) = self->_txErrorTxAborted;
  v6[31] |= 0x2000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x10000000000000) == 0)
  {
LABEL_29:
    if ((*(void *)&v10 & 0x8000000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)v6 + 57) = self->_txErrorTxAbortedCsmaCfgBackoff;
  v6[31] |= 0x10000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x8000000000000) == 0)
  {
LABEL_30:
    if ((*(void *)&v10 & 0x20000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)v6 + 56) = self->_txErrorTxAbortedCsmaBackoff;
  v6[31] |= 0x8000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x20000000000000) == 0)
  {
LABEL_31:
    if ((*(void *)&v10 & 0x40000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)v6 + 58) = self->_txErrorTxAbortedCsmaPrepare;
  v6[31] |= 0x20000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x40000000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&v10 & 0x80000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v6 + 59) = self->_txErrorTxAbortedIfs;
  v6[31] |= 0x40000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x80000000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&v10 & 0x4000000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((_DWORD *)v6 + 60) = self->_txErrorTxAbortedRxAck;
  v6[31] |= 0x80000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x4000000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&v10 & 0x100000000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v6 + 55) = self->_txErrorTxAbortedCcaTx;
  v6[31] |= 0x4000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x100000000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&v10 & 0x400000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)v6 + 61) = self->_txErrorTxAbortedTx;
  v6[31] |= 0x100000000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x400000000000) == 0)
  {
LABEL_36:
    if ((*(void *)&v10 & 0x100000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)v6 + 51) = self->_txErrorNotGranted;
  v6[31] |= 0x400000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x100000000000) == 0)
  {
LABEL_37:
    if ((*(void *)&v10 & 0x200000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)v6 + 49) = self->_txErrorInvalidAck;
  v6[31] |= 0x100000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x200000000000) == 0)
  {
LABEL_38:
    if ((*(void *)&v10 & 0x10000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)v6 + 50) = self->_txErrorNoAck;
  v6[31] |= 0x200000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x10000000000) == 0)
  {
LABEL_39:
    if ((*(unsigned char *)&v10 & 0x80) == 0) {
      goto LABEL_40;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)v6 + 45) = self->_txErrorAckNoMem;
  v6[31] |= 0x10000000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x80) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v10 & 0x40000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)v6 + 9) = self->_receivedFrames;
  v6[31] |= 0x80uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v10 & 0x10000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)v6 + 32) = self->_rxErrorReceiveFailed;
  v6[31] |= 0x40000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x10000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v10 & 0x800000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)v6 + 30) = self->_rxErrorInvalidFrame;
  v6[31] |= 0x10000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x800000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v10 & 0x8000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)v6 + 25) = self->_rxErrorDelayedTimeout;
  v6[31] |= 0x800000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x8000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v10 & 0x2000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((_DWORD *)v6 + 29) = self->_rxErrorInvalidFcs;
  v6[31] |= 0x8000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x2000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v10 & 0x80000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_104;
  }
LABEL_103:
  *((_DWORD *)v6 + 27) = self->_rxErrorDestAddrFiltered;
  v6[31] |= 0x2000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000000) == 0)
  {
LABEL_46:
    if ((*(void *)&v10 & 0x100000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_105;
  }
LABEL_104:
  *((_DWORD *)v6 + 33) = self->_rxErrorRuntimeDelay;
  v6[31] |= 0x80000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x100000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v10 & 0x40000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)v6 + 34) = self->_rxErrorTimeslotEnded;
  v6[31] |= (unint64_t)&_mh_execute_header;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v10 & 0x1000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_107;
  }
LABEL_106:
  *((_DWORD *)v6 + 20) = self->_rxErrorAborted;
  v6[31] |= 0x40000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x1000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v10 & 0x20000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)v6 + 26) = self->_rxErrorDelayedTimeslotEnded;
  v6[31] |= 0x1000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v10 & 0x4000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_109;
  }
LABEL_108:
  *((_DWORD *)v6 + 31) = self->_rxErrorInvalidLength;
  v6[31] |= 0x20000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x4000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v10 & 0x400000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)v6 + 28) = self->_rxErrorInvalidData;
  v6[31] |= 0x4000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x400000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v10 & 0x200000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)v6 + 24) = self->_rxErrorAckFailedRadioState;
  v6[31] |= 0x400000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x200000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v10 & 0x100000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_112;
  }
LABEL_111:
  *((_DWORD *)v6 + 23) = self->_rxErrorAckFailedRadioDelay;
  v6[31] |= 0x200000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v10 & 0x80000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_113;
  }
LABEL_112:
  *((_DWORD *)v6 + 22) = self->_rxErrorAckDenied;
  v6[31] |= 0x100000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000) == 0)
  {
LABEL_55:
    if ((*(void *)&v10 & 0x200000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_114;
  }
LABEL_113:
  *((_DWORD *)v6 + 21) = self->_rxErrorAckAborted;
  v6[31] |= 0x80000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(void *)&v10 & 0x200000000) == 0)
  {
LABEL_56:
    if ((*(unsigned char *)&v10 & 4) == 0) {
      goto LABEL_57;
    }
    goto LABEL_115;
  }
LABEL_114:
  *((_DWORD *)v6 + 38) = self->_sleepState;
  v6[31] |= 0x200000000uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(unsigned char *)&v10 & 4) == 0)
  {
LABEL_57:
    if ((*(unsigned char *)&v10 & 2) == 0) {
      goto LABEL_58;
    }
LABEL_116:
    *((_DWORD *)v6 + 3) = self->_energyDetectedEvents;
    v6[31] |= 2uLL;
    if ((*(void *)&self->_has & 0x20) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_115:
  *((_DWORD *)v6 + 4) = self->_energyDetectedRequests;
  v6[31] |= 4uLL;
  $2059B406CAF625EF4BB33881A00C687A v10 = self->_has;
  if ((*(unsigned char *)&v10 & 2) != 0) {
    goto LABEL_116;
  }
LABEL_58:
  if ((*(unsigned char *)&v10 & 0x20) != 0)
  {
LABEL_59:
    *((_DWORD *)v6 + 7) = self->_radioStatusDoubleNotification;
    v6[31] |= 0x20uLL;
  }
LABEL_60:
  v11 = v6;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_290;
  }
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  uint64_t v6 = *((void *)v4 + 31);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_ccaFailedAttempts != *((_DWORD *)v4 + 2)) {
      goto LABEL_290;
    }
  }
  else if (v6)
  {
    goto LABEL_290;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_radioReceivedFrames != *((_DWORD *)v4 + 6)) {
      goto LABEL_290;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_290;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_receivedEnergyEvents != *((_DWORD *)v4 + 8)) {
      goto LABEL_290;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_receivedPreambles != *((_DWORD *)v4 + 10)) {
      goto LABEL_290;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_290;
  }
  sRadioStats = self->_sRadioStats;
  if ((unint64_t)sRadioStats | *((void *)v4 + 18))
  {
    if (!-[AWDRadioStatsS isEqual:](sRadioStats, "isEqual:")) {
      goto LABEL_290;
    }
    $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  }
  uint64_t v8 = *((void *)v4 + 31);
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_rttMinVal != *((_DWORD *)v4 + 19)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_rttMaxVal != *((_DWORD *)v4 + 18)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_rttAvgVal != *((_DWORD *)v4 + 17)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0 || self->_rtt90perc != *((_DWORD *)v4 + 16)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v8 & 0x2000) == 0 || self->_retryIntervalMin != *((_DWORD *)v4 + 15)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x2000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v8 & 0x1000) == 0 || self->_retryIntervalMax != *((_DWORD *)v4 + 14)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x1000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_retryIntervalAvg != *((_DWORD *)v4 + 13)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_retryInterval90perc != *((_DWORD *)v4 + 12)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    if ((v8 & 0x8000000000) == 0 || self->_txDelayMin != *((_DWORD *)v4 + 44)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x8000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    if ((v8 & 0x4000000000) == 0 || self->_txDelayMax != *((_DWORD *)v4 + 43)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x4000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x2000000000) != 0)
  {
    if ((v8 & 0x2000000000) == 0 || self->_txDelayAvg != *((_DWORD *)v4 + 42)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x2000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    if ((v8 & 0x1000000000) == 0 || self->_txDelay90perc != *((_DWORD *)v4 + 41)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x1000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_listeningTime != *((_DWORD *)v4 + 5)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_receivingTime != *((_DWORD *)v4 + 11)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x800000000) != 0)
  {
    if ((v8 & 0x800000000) == 0 || self->_transmittingTime != *((_DWORD *)v4 + 40)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x800000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    if ((v8 & 0x400000000) == 0 || self->_transmittedFrames != *((_DWORD *)v4 + 39)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x400000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    if ((v8 & 0x1000000000000) == 0 || self->_txErrorTimeslotEnded != *((_DWORD *)v4 + 53)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x1000000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x800000000000) != 0)
  {
    if ((v8 & 0x800000000000) == 0 || self->_txErrorTimeslotDenied != *((_DWORD *)v4 + 52)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x800000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    if ((v8 & 0x20000000000) == 0 || self->_txErrorBusyChannelCcaNotStarted != *((_DWORD *)v4 + 46)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x20000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    if ((v8 & 0x40000000000) == 0 || self->_txErrorChannelAccessCcaBusy != *((_DWORD *)v4 + 47)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x40000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x80000000000) != 0)
  {
    if ((v8 & 0x80000000000) == 0 || self->_txErrorChannelAccessFailure != *((_DWORD *)v4 + 48)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x80000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x2000000000000) != 0)
  {
    if ((v8 & 0x2000000000000) == 0 || self->_txErrorTxAborted != *((_DWORD *)v4 + 54)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x2000000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x10000000000000) != 0)
  {
    if ((v8 & 0x10000000000000) == 0 || self->_txErrorTxAbortedCsmaCfgBackoff != *((_DWORD *)v4 + 57)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x10000000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x8000000000000) != 0)
  {
    if ((v8 & 0x8000000000000) == 0 || self->_txErrorTxAbortedCsmaBackoff != *((_DWORD *)v4 + 56)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x8000000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x20000000000000) != 0)
  {
    if ((v8 & 0x20000000000000) == 0 || self->_txErrorTxAbortedCsmaPrepare != *((_DWORD *)v4 + 58)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x20000000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x40000000000000) != 0)
  {
    if ((v8 & 0x40000000000000) == 0 || self->_txErrorTxAbortedIfs != *((_DWORD *)v4 + 59)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x40000000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x80000000000000) != 0)
  {
    if ((v8 & 0x80000000000000) == 0 || self->_txErrorTxAbortedRxAck != *((_DWORD *)v4 + 60)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x80000000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x4000000000000) != 0)
  {
    if ((v8 & 0x4000000000000) == 0 || self->_txErrorTxAbortedCcaTx != *((_DWORD *)v4 + 55)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x4000000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x100000000000000) != 0)
  {
    if ((v8 & 0x100000000000000) == 0 || self->_txErrorTxAbortedTx != *((_DWORD *)v4 + 61)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x100000000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x400000000000) != 0)
  {
    if ((v8 & 0x400000000000) == 0 || self->_txErrorNotGranted != *((_DWORD *)v4 + 51)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x400000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x100000000000) != 0)
  {
    if ((v8 & 0x100000000000) == 0 || self->_txErrorInvalidAck != *((_DWORD *)v4 + 49)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x100000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x200000000000) != 0)
  {
    if ((v8 & 0x200000000000) == 0 || self->_txErrorNoAck != *((_DWORD *)v4 + 50)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x200000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    if ((v8 & 0x10000000000) == 0 || self->_txErrorAckNoMem != *((_DWORD *)v4 + 45)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x10000000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_receivedFrames != *((_DWORD *)v4 + 9)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v8 & 0x40000000) == 0 || self->_rxErrorReceiveFailed != *((_DWORD *)v4 + 32)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x40000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v8 & 0x10000000) == 0 || self->_rxErrorInvalidFrame != *((_DWORD *)v4 + 30)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x10000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0 || self->_rxErrorDelayedTimeout != *((_DWORD *)v4 + 25)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v8 & 0x8000000) == 0 || self->_rxErrorInvalidFcs != *((_DWORD *)v4 + 29)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x8000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v8 & 0x2000000) == 0 || self->_rxErrorDestAddrFiltered != *((_DWORD *)v4 + 27)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x2000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v8 & 0x80000000) == 0 || self->_rxErrorRuntimeDelay != *((_DWORD *)v4 + 33)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x80000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v8 & 0x100000000) == 0 || self->_rxErrorTimeslotEnded != *((_DWORD *)v4 + 34)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x100000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_rxErrorAborted != *((_DWORD *)v4 + 20)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0 || self->_rxErrorDelayedTimeslotEnded != *((_DWORD *)v4 + 26)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x1000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v8 & 0x20000000) == 0 || self->_rxErrorInvalidLength != *((_DWORD *)v4 + 31)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x20000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v8 & 0x4000000) == 0 || self->_rxErrorInvalidData != *((_DWORD *)v4 + 28)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x4000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0 || self->_rxErrorAckFailedRadioState != *((_DWORD *)v4 + 24)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0 || self->_rxErrorAckFailedRadioDelay != *((_DWORD *)v4 + 23)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0 || self->_rxErrorAckDenied != *((_DWORD *)v4 + 22)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_rxErrorAckAborted != *((_DWORD *)v4 + 21)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    if ((v8 & 0x200000000) == 0 || self->_sleepState != *((_DWORD *)v4 + 38)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 0x200000000) != 0)
  {
    goto LABEL_290;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_energyDetectedRequests != *((_DWORD *)v4 + 4)) {
      goto LABEL_290;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_290;
  }
  uint64_t v9 = *((void *)v4 + 31);
  if ((*(unsigned char *)&has & 2) == 0)
  {
    if ((v9 & 2) == 0) {
      goto LABEL_285;
    }
LABEL_290:
    BOOL v10 = 0;
    goto LABEL_291;
  }
  if ((v9 & 2) == 0 || self->_energyDetectedEvents != *((_DWORD *)v4 + 3)) {
    goto LABEL_290;
  }
LABEL_285:
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_radioStatusDoubleNotification != *((_DWORD *)v4 + 7)) {
      goto LABEL_290;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = (*((void *)v4 + 31) & 0x20) == 0;
  }
LABEL_291:

  return v10;
}

- (unint64_t)hash
{
  $2059B406CAF625EF4BB33881A00C687A has = self->_has;
  if (*(unsigned char *)&has)
  {
    uint64_t v63 = 2654435761 * self->_ccaFailedAttempts;
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v62 = 2654435761 * self->_radioReceivedFrames;
      if ((*(unsigned char *)&has & 0x40) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v61 = 0;
      if ((*(_WORD *)&has & 0x100) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v63 = 0;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v62 = 0;
  if ((*(unsigned char *)&has & 0x40) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v61 = 2654435761 * self->_receivedEnergyEvents;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v60 = 2654435761 * self->_receivedPreambles;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v60 = 0;
LABEL_10:
  unint64_t v59 = [(AWDRadioStatsS *)self->_sRadioStats hash];
  $2059B406CAF625EF4BB33881A00C687A v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
    uint64_t v58 = 2654435761 * self->_rttMinVal;
    if ((*(_DWORD *)&v4 & 0x10000) != 0)
    {
LABEL_12:
      uint64_t v57 = 2654435761 * self->_rttMaxVal;
      if ((*(_WORD *)&v4 & 0x8000) != 0) {
        goto LABEL_13;
      }
      goto LABEL_66;
    }
  }
  else
  {
    uint64_t v58 = 0;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_12;
    }
  }
  uint64_t v57 = 0;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_13:
    uint64_t v56 = 2654435761 * self->_rttAvgVal;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v56 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_14:
    uint64_t v55 = 2654435761 * self->_rtt90perc;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_68;
  }
LABEL_67:
  uint64_t v55 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_15:
    uint64_t v54 = 2654435761 * self->_retryIntervalMin;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v54 = 0;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_16:
    uint64_t v53 = 2654435761 * self->_retryIntervalMax;
    if ((*(_WORD *)&v4 & 0x800) != 0) {
      goto LABEL_17;
    }
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v53 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_17:
    uint64_t v52 = 2654435761 * self->_retryIntervalAvg;
    if ((*(_WORD *)&v4 & 0x400) != 0) {
      goto LABEL_18;
    }
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v52 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_18:
    uint64_t v51 = 2654435761 * self->_retryInterval90perc;
    if ((*(void *)&v4 & 0x8000000000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v51 = 0;
  if ((*(void *)&v4 & 0x8000000000) != 0)
  {
LABEL_19:
    uint64_t v50 = 2654435761 * self->_txDelayMin;
    if ((*(void *)&v4 & 0x4000000000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v50 = 0;
  if ((*(void *)&v4 & 0x4000000000) != 0)
  {
LABEL_20:
    uint64_t v49 = 2654435761 * self->_txDelayMax;
    if ((*(void *)&v4 & 0x2000000000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_74;
  }
LABEL_73:
  uint64_t v49 = 0;
  if ((*(void *)&v4 & 0x2000000000) != 0)
  {
LABEL_21:
    uint64_t v48 = 2654435761 * self->_txDelayAvg;
    if ((*(void *)&v4 & 0x1000000000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_75;
  }
LABEL_74:
  uint64_t v48 = 0;
  if ((*(void *)&v4 & 0x1000000000) != 0)
  {
LABEL_22:
    uint64_t v47 = 2654435761 * self->_txDelay90perc;
    if ((*(unsigned char *)&v4 & 8) != 0) {
      goto LABEL_23;
    }
    goto LABEL_76;
  }
LABEL_75:
  uint64_t v47 = 0;
  if ((*(unsigned char *)&v4 & 8) != 0)
  {
LABEL_23:
    uint64_t v46 = 2654435761 * self->_listeningTime;
    if ((*(_WORD *)&v4 & 0x200) != 0) {
      goto LABEL_24;
    }
    goto LABEL_77;
  }
LABEL_76:
  uint64_t v46 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_24:
    uint64_t v45 = 2654435761 * self->_receivingTime;
    if ((*(void *)&v4 & 0x800000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_78;
  }
LABEL_77:
  uint64_t v45 = 0;
  if ((*(void *)&v4 & 0x800000000) != 0)
  {
LABEL_25:
    uint64_t v44 = 2654435761 * self->_transmittingTime;
    if ((*(void *)&v4 & 0x400000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_79;
  }
LABEL_78:
  uint64_t v44 = 0;
  if ((*(void *)&v4 & 0x400000000) != 0)
  {
LABEL_26:
    uint64_t v43 = 2654435761 * self->_transmittedFrames;
    if ((*(void *)&v4 & 0x1000000000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v43 = 0;
  if ((*(void *)&v4 & 0x1000000000000) != 0)
  {
LABEL_27:
    uint64_t v42 = 2654435761 * self->_txErrorTimeslotEnded;
    if ((*(void *)&v4 & 0x800000000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_81;
  }
LABEL_80:
  uint64_t v42 = 0;
  if ((*(void *)&v4 & 0x800000000000) != 0)
  {
LABEL_28:
    uint64_t v41 = 2654435761 * self->_txErrorTimeslotDenied;
    if ((*(void *)&v4 & 0x20000000000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_82;
  }
LABEL_81:
  uint64_t v41 = 0;
  if ((*(void *)&v4 & 0x20000000000) != 0)
  {
LABEL_29:
    uint64_t v40 = 2654435761 * self->_txErrorBusyChannelCcaNotStarted;
    if ((*(void *)&v4 & 0x40000000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_83;
  }
LABEL_82:
  uint64_t v40 = 0;
  if ((*(void *)&v4 & 0x40000000000) != 0)
  {
LABEL_30:
    uint64_t v39 = 2654435761 * self->_txErrorChannelAccessCcaBusy;
    if ((*(void *)&v4 & 0x80000000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_84;
  }
LABEL_83:
  uint64_t v39 = 0;
  if ((*(void *)&v4 & 0x80000000000) != 0)
  {
LABEL_31:
    uint64_t v38 = 2654435761 * self->_txErrorChannelAccessFailure;
    if ((*(void *)&v4 & 0x2000000000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_85;
  }
LABEL_84:
  uint64_t v38 = 0;
  if ((*(void *)&v4 & 0x2000000000000) != 0)
  {
LABEL_32:
    uint64_t v37 = 2654435761 * self->_txErrorTxAborted;
    if ((*(void *)&v4 & 0x10000000000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_86;
  }
LABEL_85:
  uint64_t v37 = 0;
  if ((*(void *)&v4 & 0x10000000000000) != 0)
  {
LABEL_33:
    uint64_t v36 = 2654435761 * self->_txErrorTxAbortedCsmaCfgBackoff;
    if ((*(void *)&v4 & 0x8000000000000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_87;
  }
LABEL_86:
  uint64_t v36 = 0;
  if ((*(void *)&v4 & 0x8000000000000) != 0)
  {
LABEL_34:
    uint64_t v35 = 2654435761 * self->_txErrorTxAbortedCsmaBackoff;
    if ((*(void *)&v4 & 0x20000000000000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_88;
  }
LABEL_87:
  uint64_t v35 = 0;
  if ((*(void *)&v4 & 0x20000000000000) != 0)
  {
LABEL_35:
    uint64_t v34 = 2654435761 * self->_txErrorTxAbortedCsmaPrepare;
    if ((*(void *)&v4 & 0x40000000000000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_89;
  }
LABEL_88:
  uint64_t v34 = 0;
  if ((*(void *)&v4 & 0x40000000000000) != 0)
  {
LABEL_36:
    uint64_t v33 = 2654435761 * self->_txErrorTxAbortedIfs;
    if ((*(void *)&v4 & 0x80000000000000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_90;
  }
LABEL_89:
  uint64_t v33 = 0;
  if ((*(void *)&v4 & 0x80000000000000) != 0)
  {
LABEL_37:
    uint64_t v32 = 2654435761 * self->_txErrorTxAbortedRxAck;
    if ((*(void *)&v4 & 0x4000000000000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_91;
  }
LABEL_90:
  uint64_t v32 = 0;
  if ((*(void *)&v4 & 0x4000000000000) != 0)
  {
LABEL_38:
    uint64_t v5 = 2654435761 * self->_txErrorTxAbortedCcaTx;
    if ((*(void *)&v4 & 0x100000000000000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_92;
  }
LABEL_91:
  uint64_t v5 = 0;
  if ((*(void *)&v4 & 0x100000000000000) != 0)
  {
LABEL_39:
    uint64_t v6 = 2654435761 * self->_txErrorTxAbortedTx;
    if ((*(void *)&v4 & 0x400000000000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_93;
  }
LABEL_92:
  uint64_t v6 = 0;
  if ((*(void *)&v4 & 0x400000000000) != 0)
  {
LABEL_40:
    uint64_t v7 = 2654435761 * self->_txErrorNotGranted;
    if ((*(void *)&v4 & 0x100000000000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_94;
  }
LABEL_93:
  uint64_t v7 = 0;
  if ((*(void *)&v4 & 0x100000000000) != 0)
  {
LABEL_41:
    uint64_t v8 = 2654435761 * self->_txErrorInvalidAck;
    if ((*(void *)&v4 & 0x200000000000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_95;
  }
LABEL_94:
  uint64_t v8 = 0;
  if ((*(void *)&v4 & 0x200000000000) != 0)
  {
LABEL_42:
    uint64_t v9 = 2654435761 * self->_txErrorNoAck;
    if ((*(void *)&v4 & 0x10000000000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_96;
  }
LABEL_95:
  uint64_t v9 = 0;
  if ((*(void *)&v4 & 0x10000000000) != 0)
  {
LABEL_43:
    uint64_t v10 = 2654435761 * self->_txErrorAckNoMem;
    if ((*(unsigned char *)&v4 & 0x80) != 0) {
      goto LABEL_44;
    }
    goto LABEL_97;
  }
LABEL_96:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&v4 & 0x80) != 0)
  {
LABEL_44:
    uint64_t v11 = 2654435761 * self->_receivedFrames;
    if ((*(_DWORD *)&v4 & 0x40000000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_98;
  }
LABEL_97:
  uint64_t v11 = 0;
  if ((*(_DWORD *)&v4 & 0x40000000) != 0)
  {
LABEL_45:
    uint64_t v12 = 2654435761 * self->_rxErrorReceiveFailed;
    if ((*(_DWORD *)&v4 & 0x10000000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_99;
  }
LABEL_98:
  uint64_t v12 = 0;
  if ((*(_DWORD *)&v4 & 0x10000000) != 0)
  {
LABEL_46:
    uint64_t v13 = 2654435761 * self->_rxErrorInvalidFrame;
    if ((*(_DWORD *)&v4 & 0x800000) != 0) {
      goto LABEL_47;
    }
    goto LABEL_100;
  }
LABEL_99:
  uint64_t v13 = 0;
  if ((*(_DWORD *)&v4 & 0x800000) != 0)
  {
LABEL_47:
    uint64_t v14 = 2654435761 * self->_rxErrorDelayedTimeout;
    if ((*(_DWORD *)&v4 & 0x8000000) != 0) {
      goto LABEL_48;
    }
    goto LABEL_101;
  }
LABEL_100:
  uint64_t v14 = 0;
  if ((*(_DWORD *)&v4 & 0x8000000) != 0)
  {
LABEL_48:
    uint64_t v15 = 2654435761 * self->_rxErrorInvalidFcs;
    if ((*(_DWORD *)&v4 & 0x2000000) != 0) {
      goto LABEL_49;
    }
    goto LABEL_102;
  }
LABEL_101:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&v4 & 0x2000000) != 0)
  {
LABEL_49:
    uint64_t v16 = 2654435761 * self->_rxErrorDestAddrFiltered;
    if ((*(_DWORD *)&v4 & 0x80000000) != 0) {
      goto LABEL_50;
    }
    goto LABEL_103;
  }
LABEL_102:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&v4 & 0x80000000) != 0)
  {
LABEL_50:
    uint64_t v17 = 2654435761 * self->_rxErrorRuntimeDelay;
    if ((*(void *)&v4 & 0x100000000) != 0) {
      goto LABEL_51;
    }
    goto LABEL_104;
  }
LABEL_103:
  uint64_t v17 = 0;
  if ((*(void *)&v4 & 0x100000000) != 0)
  {
LABEL_51:
    uint64_t v18 = 2654435761 * self->_rxErrorTimeslotEnded;
    if ((*(_DWORD *)&v4 & 0x40000) != 0) {
      goto LABEL_52;
    }
    goto LABEL_105;
  }
LABEL_104:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_52:
    uint64_t v19 = 2654435761 * self->_rxErrorAborted;
    if ((*(_DWORD *)&v4 & 0x1000000) != 0) {
      goto LABEL_53;
    }
    goto LABEL_106;
  }
LABEL_105:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&v4 & 0x1000000) != 0)
  {
LABEL_53:
    uint64_t v20 = 2654435761 * self->_rxErrorDelayedTimeslotEnded;
    if ((*(_DWORD *)&v4 & 0x20000000) != 0) {
      goto LABEL_54;
    }
    goto LABEL_107;
  }
LABEL_106:
  uint64_t v20 = 0;
  if ((*(_DWORD *)&v4 & 0x20000000) != 0)
  {
LABEL_54:
    uint64_t v21 = 2654435761 * self->_rxErrorInvalidLength;
    if ((*(_DWORD *)&v4 & 0x4000000) != 0) {
      goto LABEL_55;
    }
    goto LABEL_108;
  }
LABEL_107:
  uint64_t v21 = 0;
  if ((*(_DWORD *)&v4 & 0x4000000) != 0)
  {
LABEL_55:
    uint64_t v22 = 2654435761 * self->_rxErrorInvalidData;
    if ((*(_DWORD *)&v4 & 0x400000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_109;
  }
LABEL_108:
  uint64_t v22 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) != 0)
  {
LABEL_56:
    uint64_t v23 = 2654435761 * self->_rxErrorAckFailedRadioState;
    if ((*(_DWORD *)&v4 & 0x200000) != 0) {
      goto LABEL_57;
    }
    goto LABEL_110;
  }
LABEL_109:
  uint64_t v23 = 0;
  if ((*(_DWORD *)&v4 & 0x200000) != 0)
  {
LABEL_57:
    uint64_t v24 = 2654435761 * self->_rxErrorAckFailedRadioDelay;
    if ((*(_DWORD *)&v4 & 0x100000) != 0) {
      goto LABEL_58;
    }
    goto LABEL_111;
  }
LABEL_110:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_58:
    uint64_t v25 = 2654435761 * self->_rxErrorAckDenied;
    if ((*(_DWORD *)&v4 & 0x80000) != 0) {
      goto LABEL_59;
    }
    goto LABEL_112;
  }
LABEL_111:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
LABEL_59:
    uint64_t v26 = 2654435761 * self->_rxErrorAckAborted;
    if ((*(void *)&v4 & 0x200000000) != 0) {
      goto LABEL_60;
    }
    goto LABEL_113;
  }
LABEL_112:
  uint64_t v26 = 0;
  if ((*(void *)&v4 & 0x200000000) != 0)
  {
LABEL_60:
    uint64_t v27 = 2654435761 * self->_sleepState;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_61;
    }
    goto LABEL_114;
  }
LABEL_113:
  uint64_t v27 = 0;
  if ((*(unsigned char *)&v4 & 4) != 0)
  {
LABEL_61:
    uint64_t v28 = 2654435761 * self->_energyDetectedRequests;
    if ((*(unsigned char *)&v4 & 2) != 0) {
      goto LABEL_62;
    }
LABEL_115:
    uint64_t v29 = 0;
    if ((*(unsigned char *)&v4 & 0x20) != 0) {
      goto LABEL_63;
    }
LABEL_116:
    uint64_t v30 = 0;
    return v62 ^ v63 ^ v61 ^ v60 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v59 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
  }
LABEL_114:
  uint64_t v28 = 0;
  if ((*(unsigned char *)&v4 & 2) == 0) {
    goto LABEL_115;
  }
LABEL_62:
  uint64_t v29 = 2654435761 * self->_energyDetectedEvents;
  if ((*(unsigned char *)&v4 & 0x20) == 0) {
    goto LABEL_116;
  }
LABEL_63:
  uint64_t v30 = 2654435761 * self->_radioStatusDoubleNotification;
  return v62 ^ v63 ^ v61 ^ v60 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v59 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
}

- (void)mergeFrom:(id)a3
{
  $2059B406CAF625EF4BB33881A00C687A v4 = (unsigned int *)a3;
  uint64_t v5 = v4;
  uint64_t v6 = *((void *)v4 + 31);
  if (v6)
  {
    self->_ccaFailedAttempts = v4[2];
    *(void *)&self->_has |= 1uLL;
    uint64_t v6 = *((void *)v4 + 31);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_radioReceivedFrames = v4[6];
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v6 = *((void *)v4 + 31);
  if ((v6 & 0x40) == 0)
  {
LABEL_4:
    if ((v6 & 0x100) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    self->_receivedPreambles = v4[10];
    *(void *)&self->_has |= 0x100uLL;
    sRadioStats = self->_sRadioStats;
    uint64_t v8 = *((void *)v5 + 18);
    if (sRadioStats) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_10:
  self->_receivedEnergyEvents = v4[8];
  *(void *)&self->_has |= 0x40uLL;
  if ((*((void *)v4 + 31) & 0x100) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  sRadioStats = self->_sRadioStats;
  uint64_t v8 = *((void *)v5 + 18);
  if (sRadioStats)
  {
LABEL_6:
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v10 = v5;
    -[AWDRadioStatsS mergeFrom:](sRadioStats, "mergeFrom:");
    goto LABEL_14;
  }
LABEL_12:
  if (!v8) {
    goto LABEL_15;
  }
  uint64_t v10 = v5;
  -[AWDCountersRadioS setSRadioStats:](self, "setSRadioStats:");
LABEL_14:
  uint64_t v5 = v10;
LABEL_15:
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x20000) != 0)
  {
    self->_rttMinVal = v5[19];
    *(void *)&self->_has |= 0x20000uLL;
    uint64_t v9 = *((void *)v5 + 31);
    if ((v9 & 0x10000) == 0)
    {
LABEL_17:
      if ((v9 & 0x8000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_73;
    }
  }
  else if ((v9 & 0x10000) == 0)
  {
    goto LABEL_17;
  }
  self->_rttMaxVal = v5[18];
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x8000) == 0)
  {
LABEL_18:
    if ((v9 & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_rttAvgVal = v5[17];
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x4000) == 0)
  {
LABEL_19:
    if ((v9 & 0x2000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_rtt90perc = v5[16];
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x2000) == 0)
  {
LABEL_20:
    if ((v9 & 0x1000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_retryIntervalMin = v5[15];
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x1000) == 0)
  {
LABEL_21:
    if ((v9 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_retryIntervalMax = v5[14];
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x800) == 0)
  {
LABEL_22:
    if ((v9 & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_retryIntervalAvg = v5[13];
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x400) == 0)
  {
LABEL_23:
    if ((v9 & 0x8000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_retryInterval90perc = v5[12];
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x8000000000) == 0)
  {
LABEL_24:
    if ((v9 & 0x4000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_txDelayMin = v5[44];
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x4000000000) == 0)
  {
LABEL_25:
    if ((v9 & 0x2000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_txDelayMax = v5[43];
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x2000000000) == 0)
  {
LABEL_26:
    if ((v9 & 0x1000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_txDelayAvg = v5[42];
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x1000000000) == 0)
  {
LABEL_27:
    if ((v9 & 8) == 0) {
      goto LABEL_28;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_txDelay90perc = v5[41];
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 8) == 0)
  {
LABEL_28:
    if ((v9 & 0x200) == 0) {
      goto LABEL_29;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_listeningTime = v5[5];
  *(void *)&self->_has |= 8uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x200) == 0)
  {
LABEL_29:
    if ((v9 & 0x800000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_receivingTime = v5[11];
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x800000000) == 0)
  {
LABEL_30:
    if ((v9 & 0x400000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_transmittingTime = v5[40];
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x400000000) == 0)
  {
LABEL_31:
    if ((v9 & 0x1000000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_transmittedFrames = v5[39];
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x1000000000000) == 0)
  {
LABEL_32:
    if ((v9 & 0x800000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_txErrorTimeslotEnded = v5[53];
  *(void *)&self->_has |= 0x1000000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x800000000000) == 0)
  {
LABEL_33:
    if ((v9 & 0x20000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_txErrorTimeslotDenied = v5[52];
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x20000000000) == 0)
  {
LABEL_34:
    if ((v9 & 0x40000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_txErrorBusyChannelCcaNotStarted = v5[46];
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x40000000000) == 0)
  {
LABEL_35:
    if ((v9 & 0x80000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_txErrorChannelAccessCcaBusy = v5[47];
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x80000000000) == 0)
  {
LABEL_36:
    if ((v9 & 0x2000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_txErrorChannelAccessFailure = v5[48];
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x2000000000000) == 0)
  {
LABEL_37:
    if ((v9 & 0x10000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_txErrorTxAborted = v5[54];
  *(void *)&self->_has |= 0x2000000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((v9 & 0x8000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_txErrorTxAbortedCsmaCfgBackoff = v5[57];
  *(void *)&self->_has |= 0x10000000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x8000000000000) == 0)
  {
LABEL_39:
    if ((v9 & 0x20000000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_txErrorTxAbortedCsmaBackoff = v5[56];
  *(void *)&self->_has |= 0x8000000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x20000000000000) == 0)
  {
LABEL_40:
    if ((v9 & 0x40000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_txErrorTxAbortedCsmaPrepare = v5[58];
  *(void *)&self->_has |= 0x20000000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x40000000000000) == 0)
  {
LABEL_41:
    if ((v9 & 0x80000000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_txErrorTxAbortedIfs = v5[59];
  *(void *)&self->_has |= 0x40000000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x80000000000000) == 0)
  {
LABEL_42:
    if ((v9 & 0x4000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_txErrorTxAbortedRxAck = v5[60];
  *(void *)&self->_has |= 0x80000000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x4000000000000) == 0)
  {
LABEL_43:
    if ((v9 & 0x100000000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_txErrorTxAbortedCcaTx = v5[55];
  *(void *)&self->_has |= 0x4000000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x100000000000000) == 0)
  {
LABEL_44:
    if ((v9 & 0x400000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_txErrorTxAbortedTx = v5[61];
  *(void *)&self->_has |= 0x100000000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x400000000000) == 0)
  {
LABEL_45:
    if ((v9 & 0x100000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_txErrorNotGranted = v5[51];
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x100000000000) == 0)
  {
LABEL_46:
    if ((v9 & 0x200000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_txErrorInvalidAck = v5[49];
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x200000000000) == 0)
  {
LABEL_47:
    if ((v9 & 0x10000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_txErrorNoAck = v5[50];
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x10000000000) == 0)
  {
LABEL_48:
    if ((v9 & 0x80) == 0) {
      goto LABEL_49;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_txErrorAckNoMem = v5[45];
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x80) == 0)
  {
LABEL_49:
    if ((v9 & 0x40000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_receivedFrames = v5[9];
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x40000000) == 0)
  {
LABEL_50:
    if ((v9 & 0x10000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_rxErrorReceiveFailed = v5[32];
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x10000000) == 0)
  {
LABEL_51:
    if ((v9 & 0x800000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_rxErrorInvalidFrame = v5[30];
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x800000) == 0)
  {
LABEL_52:
    if ((v9 & 0x8000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_108;
  }
LABEL_107:
  self->_rxErrorDelayedTimeout = v5[25];
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x8000000) == 0)
  {
LABEL_53:
    if ((v9 & 0x2000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_109;
  }
LABEL_108:
  self->_rxErrorInvalidFcs = v5[29];
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x2000000) == 0)
  {
LABEL_54:
    if ((v9 & 0x80000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_110;
  }
LABEL_109:
  self->_rxErrorDestAddrFiltered = v5[27];
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x80000000) == 0)
  {
LABEL_55:
    if ((v9 & 0x100000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_111;
  }
LABEL_110:
  self->_rxErrorRuntimeDelay = v5[33];
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x100000000) == 0)
  {
LABEL_56:
    if ((v9 & 0x40000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_112;
  }
LABEL_111:
  self->_rxErrorTimeslotEnded = v5[34];
  *(void *)&self->_has |= (unint64_t)&_mh_execute_header;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x40000) == 0)
  {
LABEL_57:
    if ((v9 & 0x1000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_113;
  }
LABEL_112:
  self->_rxErrorAborted = v5[20];
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x1000000) == 0)
  {
LABEL_58:
    if ((v9 & 0x20000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_114;
  }
LABEL_113:
  self->_rxErrorDelayedTimeslotEnded = v5[26];
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x20000000) == 0)
  {
LABEL_59:
    if ((v9 & 0x4000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_115;
  }
LABEL_114:
  self->_rxErrorInvalidLength = v5[31];
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x4000000) == 0)
  {
LABEL_60:
    if ((v9 & 0x400000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_116;
  }
LABEL_115:
  self->_rxErrorInvalidData = v5[28];
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x400000) == 0)
  {
LABEL_61:
    if ((v9 & 0x200000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_117;
  }
LABEL_116:
  self->_rxErrorAckFailedRadioState = v5[24];
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x200000) == 0)
  {
LABEL_62:
    if ((v9 & 0x100000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_118;
  }
LABEL_117:
  self->_rxErrorAckFailedRadioDelay = v5[23];
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x100000) == 0)
  {
LABEL_63:
    if ((v9 & 0x80000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_119;
  }
LABEL_118:
  self->_rxErrorAckDenied = v5[22];
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x80000) == 0)
  {
LABEL_64:
    if ((v9 & 0x200000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_120;
  }
LABEL_119:
  self->_rxErrorAckAborted = v5[21];
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 0x200000000) == 0)
  {
LABEL_65:
    if ((v9 & 4) == 0) {
      goto LABEL_66;
    }
    goto LABEL_121;
  }
LABEL_120:
  self->_sleepState = v5[38];
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 4) == 0)
  {
LABEL_66:
    if ((v9 & 2) == 0) {
      goto LABEL_67;
    }
    goto LABEL_122;
  }
LABEL_121:
  self->_energyDetectedRequests = v5[4];
  *(void *)&self->_has |= 4uLL;
  uint64_t v9 = *((void *)v5 + 31);
  if ((v9 & 2) == 0)
  {
LABEL_67:
    if ((v9 & 0x20) == 0) {
      goto LABEL_68;
    }
    goto LABEL_123;
  }
LABEL_122:
  self->_energyDetectedEvents = v5[3];
  *(void *)&self->_has |= 2uLL;
  if ((*((void *)v5 + 31) & 0x20) == 0)
  {
LABEL_68:
    goto LABEL_70;
  }
LABEL_123:
  self->_radioStatusDoubleNotification = v5[7];
  *(void *)&self->_has |= 0x20uLL;

LABEL_70:
}

- (unsigned)ccaFailedAttempts
{
  return self->_ccaFailedAttempts;
}

- (unsigned)radioReceivedFrames
{
  return self->_radioReceivedFrames;
}

- (unsigned)receivedEnergyEvents
{
  return self->_receivedEnergyEvents;
}

- (unsigned)receivedPreambles
{
  return self->_receivedPreambles;
}

- (AWDRadioStatsS)sRadioStats
{
  return self->_sRadioStats;
}

- (void)setSRadioStats:(id)a3
{
}

- (unsigned)rttMinVal
{
  return self->_rttMinVal;
}

- (unsigned)rttMaxVal
{
  return self->_rttMaxVal;
}

- (unsigned)rttAvgVal
{
  return self->_rttAvgVal;
}

- (unsigned)rtt90perc
{
  return self->_rtt90perc;
}

- (unsigned)retryIntervalMin
{
  return self->_retryIntervalMin;
}

- (unsigned)retryIntervalMax
{
  return self->_retryIntervalMax;
}

- (unsigned)retryIntervalAvg
{
  return self->_retryIntervalAvg;
}

- (unsigned)retryInterval90perc
{
  return self->_retryInterval90perc;
}

- (unsigned)txDelayMin
{
  return self->_txDelayMin;
}

- (unsigned)txDelayMax
{
  return self->_txDelayMax;
}

- (unsigned)txDelayAvg
{
  return self->_txDelayAvg;
}

- (unsigned)txDelay90perc
{
  return self->_txDelay90perc;
}

- (unsigned)listeningTime
{
  return self->_listeningTime;
}

- (unsigned)receivingTime
{
  return self->_receivingTime;
}

- (unsigned)transmittingTime
{
  return self->_transmittingTime;
}

- (unsigned)transmittedFrames
{
  return self->_transmittedFrames;
}

- (unsigned)txErrorTimeslotEnded
{
  return self->_txErrorTimeslotEnded;
}

- (unsigned)txErrorTimeslotDenied
{
  return self->_txErrorTimeslotDenied;
}

- (unsigned)txErrorBusyChannelCcaNotStarted
{
  return self->_txErrorBusyChannelCcaNotStarted;
}

- (unsigned)txErrorChannelAccessCcaBusy
{
  return self->_txErrorChannelAccessCcaBusy;
}

- (unsigned)txErrorChannelAccessFailure
{
  return self->_txErrorChannelAccessFailure;
}

- (unsigned)txErrorTxAborted
{
  return self->_txErrorTxAborted;
}

- (unsigned)txErrorTxAbortedCsmaCfgBackoff
{
  return self->_txErrorTxAbortedCsmaCfgBackoff;
}

- (unsigned)txErrorTxAbortedCsmaBackoff
{
  return self->_txErrorTxAbortedCsmaBackoff;
}

- (unsigned)txErrorTxAbortedCsmaPrepare
{
  return self->_txErrorTxAbortedCsmaPrepare;
}

- (unsigned)txErrorTxAbortedIfs
{
  return self->_txErrorTxAbortedIfs;
}

- (unsigned)txErrorTxAbortedRxAck
{
  return self->_txErrorTxAbortedRxAck;
}

- (unsigned)txErrorTxAbortedCcaTx
{
  return self->_txErrorTxAbortedCcaTx;
}

- (unsigned)txErrorTxAbortedTx
{
  return self->_txErrorTxAbortedTx;
}

- (unsigned)txErrorNotGranted
{
  return self->_txErrorNotGranted;
}

- (unsigned)txErrorInvalidAck
{
  return self->_txErrorInvalidAck;
}

- (unsigned)txErrorNoAck
{
  return self->_txErrorNoAck;
}

- (unsigned)txErrorAckNoMem
{
  return self->_txErrorAckNoMem;
}

- (unsigned)receivedFrames
{
  return self->_receivedFrames;
}

- (unsigned)rxErrorReceiveFailed
{
  return self->_rxErrorReceiveFailed;
}

- (unsigned)rxErrorInvalidFrame
{
  return self->_rxErrorInvalidFrame;
}

- (unsigned)rxErrorDelayedTimeout
{
  return self->_rxErrorDelayedTimeout;
}

- (unsigned)rxErrorInvalidFcs
{
  return self->_rxErrorInvalidFcs;
}

- (unsigned)rxErrorDestAddrFiltered
{
  return self->_rxErrorDestAddrFiltered;
}

- (unsigned)rxErrorRuntimeDelay
{
  return self->_rxErrorRuntimeDelay;
}

- (unsigned)rxErrorTimeslotEnded
{
  return self->_rxErrorTimeslotEnded;
}

- (unsigned)rxErrorAborted
{
  return self->_rxErrorAborted;
}

- (unsigned)rxErrorDelayedTimeslotEnded
{
  return self->_rxErrorDelayedTimeslotEnded;
}

- (unsigned)rxErrorInvalidLength
{
  return self->_rxErrorInvalidLength;
}

- (unsigned)rxErrorInvalidData
{
  return self->_rxErrorInvalidData;
}

- (unsigned)rxErrorAckFailedRadioState
{
  return self->_rxErrorAckFailedRadioState;
}

- (unsigned)rxErrorAckFailedRadioDelay
{
  return self->_rxErrorAckFailedRadioDelay;
}

- (unsigned)rxErrorAckDenied
{
  return self->_rxErrorAckDenied;
}

- (unsigned)rxErrorAckAborted
{
  return self->_rxErrorAckAborted;
}

- (unsigned)sleepState
{
  return self->_sleepState;
}

- (unsigned)energyDetectedRequests
{
  return self->_energyDetectedRequests;
}

- (unsigned)energyDetectedEvents
{
  return self->_energyDetectedEvents;
}

- (unsigned)radioStatusDoubleNotification
{
  return self->_radioStatusDoubleNotification;
}

- (void).cxx_destruct
{
}

@end