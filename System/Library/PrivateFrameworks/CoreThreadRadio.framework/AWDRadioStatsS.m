@interface AWDRadioStatsS
- (BOOL)hasListeningTime;
- (BOOL)hasReceivingTime;
- (BOOL)hasRetryInterval90perc;
- (BOOL)hasRetryIntervalAvg;
- (BOOL)hasRetryIntervalMax;
- (BOOL)hasRetryIntervalMin;
- (BOOL)hasRtt90perc;
- (BOOL)hasRttAvgVal;
- (BOOL)hasRttMaxVal;
- (BOOL)hasRttMinVal;
- (BOOL)hasTransmittingTime;
- (BOOL)hasTxDelay90perc;
- (BOOL)hasTxDelayAvg;
- (BOOL)hasTxDelayMax;
- (BOOL)hasTxDelayMin;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)listeningTime;
- (unsigned)receivingTime;
- (unsigned)retryInterval90perc;
- (unsigned)retryIntervalAvg;
- (unsigned)retryIntervalMax;
- (unsigned)retryIntervalMin;
- (unsigned)rtt90perc;
- (unsigned)rttAvgVal;
- (unsigned)rttMaxVal;
- (unsigned)rttMinVal;
- (unsigned)transmittingTime;
- (unsigned)txDelay90perc;
- (unsigned)txDelayAvg;
- (unsigned)txDelayMax;
- (unsigned)txDelayMin;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasListeningTime:(BOOL)a3;
- (void)setHasReceivingTime:(BOOL)a3;
- (void)setHasRetryInterval90perc:(BOOL)a3;
- (void)setHasRetryIntervalAvg:(BOOL)a3;
- (void)setHasRetryIntervalMax:(BOOL)a3;
- (void)setHasRetryIntervalMin:(BOOL)a3;
- (void)setHasRtt90perc:(BOOL)a3;
- (void)setHasRttAvgVal:(BOOL)a3;
- (void)setHasRttMaxVal:(BOOL)a3;
- (void)setHasRttMinVal:(BOOL)a3;
- (void)setHasTransmittingTime:(BOOL)a3;
- (void)setHasTxDelay90perc:(BOOL)a3;
- (void)setHasTxDelayAvg:(BOOL)a3;
- (void)setHasTxDelayMax:(BOOL)a3;
- (void)setHasTxDelayMin:(BOOL)a3;
- (void)setListeningTime:(unsigned int)a3;
- (void)setReceivingTime:(unsigned int)a3;
- (void)setRetryInterval90perc:(unsigned int)a3;
- (void)setRetryIntervalAvg:(unsigned int)a3;
- (void)setRetryIntervalMax:(unsigned int)a3;
- (void)setRetryIntervalMin:(unsigned int)a3;
- (void)setRtt90perc:(unsigned int)a3;
- (void)setRttAvgVal:(unsigned int)a3;
- (void)setRttMaxVal:(unsigned int)a3;
- (void)setRttMinVal:(unsigned int)a3;
- (void)setTransmittingTime:(unsigned int)a3;
- (void)setTxDelay90perc:(unsigned int)a3;
- (void)setTxDelayAvg:(unsigned int)a3;
- (void)setTxDelayMax:(unsigned int)a3;
- (void)setTxDelayMin:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDRadioStatsS

- (void)setRttMinVal:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rttMinVal = a3;
}

- (void)setHasRttMinVal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRttMinVal
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRttMaxVal:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rttMaxVal = a3;
}

- (void)setHasRttMaxVal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRttMaxVal
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRttAvgVal:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rttAvgVal = a3;
}

- (void)setHasRttAvgVal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRttAvgVal
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRtt90perc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rtt90perc = a3;
}

- (void)setHasRtt90perc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRtt90perc
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRetryIntervalMin:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_retryIntervalMin = a3;
}

- (void)setHasRetryIntervalMin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRetryIntervalMin
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRetryIntervalMax:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_retryIntervalMax = a3;
}

- (void)setHasRetryIntervalMax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRetryIntervalMax
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRetryIntervalAvg:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_retryIntervalAvg = a3;
}

- (void)setHasRetryIntervalAvg:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRetryIntervalAvg
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRetryInterval90perc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_retryInterval90perc = a3;
}

- (void)setHasRetryInterval90perc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRetryInterval90perc
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTxDelayMin:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_txDelayMin = a3;
}

- (void)setHasTxDelayMin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasTxDelayMin
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setTxDelayMax:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_txDelayMax = a3;
}

- (void)setHasTxDelayMax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasTxDelayMax
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setTxDelayAvg:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_txDelayAvg = a3;
}

- (void)setHasTxDelayAvg:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTxDelayAvg
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setTxDelay90perc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_txDelay90perc = a3;
}

- (void)setHasTxDelay90perc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTxDelay90perc
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setListeningTime:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_listeningTime = a3;
}

- (void)setHasListeningTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasListeningTime
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setReceivingTime:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_receivingTime = a3;
}

- (void)setHasReceivingTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasReceivingTime
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTransmittingTime:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_transmittingTime = a3;
}

- (void)setHasTransmittingTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTransmittingTime
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDRadioStatsS;
  __int16 v3 = [(AWDRadioStatsS *)&v7 description];
  v4 = [(AWDRadioStatsS *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_rttMinVal];
    [v3 setObject:v7 forKey:@"rtt_min_val"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_rttMaxVal];
  [v3 setObject:v8 forKey:@"rtt_max_val"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  v9 = +[NSNumber numberWithUnsignedInt:self->_rttAvgVal];
  [v3 setObject:v9 forKey:@"rtt_avg_val"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  v10 = +[NSNumber numberWithUnsignedInt:self->_rtt90perc];
  [v3 setObject:v10 forKey:@"rtt_90perc"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  v11 = +[NSNumber numberWithUnsignedInt:self->_retryIntervalMin];
  [v3 setObject:v11 forKey:@"retry_interval_min"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  v12 = +[NSNumber numberWithUnsignedInt:self->_retryIntervalMax];
  [v3 setObject:v12 forKey:@"retry_interval_max"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  v13 = +[NSNumber numberWithUnsignedInt:self->_retryIntervalAvg];
  [v3 setObject:v13 forKey:@"retry_interval_avg"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  v14 = +[NSNumber numberWithUnsignedInt:self->_retryInterval90perc];
  [v3 setObject:v14 forKey:@"retry_interval_90perc"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  v15 = +[NSNumber numberWithUnsignedInt:self->_txDelayMin];
  [v3 setObject:v15 forKey:@"tx_delay_min"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  v16 = +[NSNumber numberWithUnsignedInt:self->_txDelayMax];
  [v3 setObject:v16 forKey:@"tx_delay_max"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  v17 = +[NSNumber numberWithUnsignedInt:self->_txDelayAvg];
  [v3 setObject:v17 forKey:@"tx_delay_avg"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  v18 = +[NSNumber numberWithUnsignedInt:self->_txDelay90perc];
  [v3 setObject:v18 forKey:@"tx_delay_90perc"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  v19 = +[NSNumber numberWithUnsignedInt:self->_listeningTime];
  [v3 setObject:v19 forKey:@"listening_time"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_33:
  v20 = +[NSNumber numberWithUnsignedInt:self->_receivingTime];
  [v3 setObject:v20 forKey:@"receiving_time"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    v5 = +[NSNumber numberWithUnsignedInt:self->_transmittingTime];
    [v3 setObject:v5 forKey:@"transmitting_time"];
  }
LABEL_17:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDRadioStatsSReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_16:
    v5 = v6;
    goto LABEL_18;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  v5 = v6;

LABEL_18:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v4[11] = self->_rttMinVal;
    *((_WORD *)v4 + 34) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v4[10] = self->_rttMaxVal;
  *((_WORD *)v4 + 34) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  v4[9] = self->_rttAvgVal;
  *((_WORD *)v4 + 34) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[8] = self->_rtt90perc;
  *((_WORD *)v4 + 34) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  v4[7] = self->_retryIntervalMin;
  *((_WORD *)v4 + 34) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[6] = self->_retryIntervalMax;
  *((_WORD *)v4 + 34) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  v4[5] = self->_retryIntervalAvg;
  *((_WORD *)v4 + 34) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[4] = self->_retryInterval90perc;
  *((_WORD *)v4 + 34) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[16] = self->_txDelayMin;
  *((_WORD *)v4 + 34) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[15] = self->_txDelayMax;
  *((_WORD *)v4 + 34) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[14] = self->_txDelayAvg;
  *((_WORD *)v4 + 34) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[13] = self->_txDelay90perc;
  *((_WORD *)v4 + 34) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  v4[2] = self->_listeningTime;
  *((_WORD *)v4 + 34) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[3] = self->_receivingTime;
  *((_WORD *)v4 + 34) |= 2u;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_16:
    goto LABEL_18;
  }
LABEL_33:
  v4[12] = self->_transmittingTime;
  *((_WORD *)v4 + 34) |= 0x400u;

LABEL_18:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)result + 11) = self->_rttMinVal;
    *((_WORD *)result + 34) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_rttMaxVal;
  *((_WORD *)result + 34) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 9) = self->_rttAvgVal;
  *((_WORD *)result + 34) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 8) = self->_rtt90perc;
  *((_WORD *)result + 34) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 7) = self->_retryIntervalMin;
  *((_WORD *)result + 34) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 6) = self->_retryIntervalMax;
  *((_WORD *)result + 34) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 5) = self->_retryIntervalAvg;
  *((_WORD *)result + 34) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 4) = self->_retryInterval90perc;
  *((_WORD *)result + 34) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 16) = self->_txDelayMin;
  *((_WORD *)result + 34) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 15) = self->_txDelayMax;
  *((_WORD *)result + 34) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 14) = self->_txDelayAvg;
  *((_WORD *)result + 34) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 13) = self->_txDelay90perc;
  *((_WORD *)result + 34) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 2) = self->_listeningTime;
  *((_WORD *)result + 34) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0) {
      return result;
    }
LABEL_31:
    *((_DWORD *)result + 12) = self->_transmittingTime;
    *((_WORD *)result + 34) |= 0x400u;
    return result;
  }
LABEL_30:
  *((_DWORD *)result + 3) = self->_receivingTime;
  *((_WORD *)result + 34) |= 2u;
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    goto LABEL_31;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_77;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 34);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x200) == 0 || self->_rttMinVal != *((_DWORD *)v4 + 11)) {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x200) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x100) == 0 || self->_rttMaxVal != *((_DWORD *)v4 + 10)) {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x100) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_rttAvgVal != *((_DWORD *)v4 + 9)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_rtt90perc != *((_DWORD *)v4 + 8)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_retryIntervalMin != *((_DWORD *)v4 + 7)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_retryIntervalMax != *((_DWORD *)v4 + 6)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_retryIntervalAvg != *((_DWORD *)v4 + 5)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_retryInterval90perc != *((_DWORD *)v4 + 4)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x4000) == 0 || self->_txDelayMin != *((_DWORD *)v4 + 16)) {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x4000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x2000) == 0 || self->_txDelayMax != *((_DWORD *)v4 + 15)) {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x2000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x1000) == 0 || self->_txDelayAvg != *((_DWORD *)v4 + 14)) {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x1000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x800) == 0 || self->_txDelay90perc != *((_DWORD *)v4 + 13)) {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x800) != 0)
  {
    goto LABEL_77;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_listeningTime != *((_DWORD *)v4 + 2)) {
      goto LABEL_77;
    }
  }
  else if (v6)
  {
    goto LABEL_77;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_receivingTime != *((_DWORD *)v4 + 3)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    BOOL v7 = (v6 & 0x400) == 0;

    return v7;
  }
  if ((*((_WORD *)v4 + 34) & 0x400) != 0 && self->_transmittingTime == *((_DWORD *)v4 + 12))
  {

    return 1;
  }
LABEL_77:

  return 0;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    uint64_t v3 = 2654435761 * self->_rttMinVal;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_rttMaxVal;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_rttAvgVal;
    if ((has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_rtt90perc;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_retryIntervalMin;
    if ((has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_retryIntervalMax;
    if ((has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_retryIntervalAvg;
    if ((has & 4) != 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v9 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_retryInterval90perc;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_txDelayMin;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_txDelayMax;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_txDelayAvg;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_txDelay90perc;
    if (has) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v14 = 0;
  if (has)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_listeningTime;
    if ((has & 2) != 0) {
      goto LABEL_15;
    }
LABEL_30:
    uint64_t v16 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_16;
    }
LABEL_31:
    uint64_t v17 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_29:
  uint64_t v15 = 0;
  if ((has & 2) == 0) {
    goto LABEL_30;
  }
LABEL_15:
  uint64_t v16 = 2654435761 * self->_receivingTime;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_31;
  }
LABEL_16:
  uint64_t v17 = 2654435761 * self->_transmittingTime;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x200) != 0)
  {
    self->_rttMinVal = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v5 = *((_WORD *)v4 + 34);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_rttMaxVal = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_rttAvgVal = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_rtt90perc = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_retryIntervalMin = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_retryIntervalMax = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_retryIntervalAvg = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_retryInterval90perc = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x4000) == 0)
  {
LABEL_10:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_txDelayMin = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x2000) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_txDelayMax = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x1000) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_txDelayAvg = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_txDelay90perc = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 1) == 0)
  {
LABEL_14:
    if ((v5 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_listeningTime = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 2) == 0)
  {
LABEL_15:
    if ((v5 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_receivingTime = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 34) & 0x400) == 0)
  {
LABEL_16:
    goto LABEL_18;
  }
LABEL_33:
  self->_transmittingTime = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x400u;

LABEL_18:
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

@end