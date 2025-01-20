@interface AWDCountersIpv6S
- (BOOL)hasRxFailure;
- (BOOL)hasRxSuccess;
- (BOOL)hasRxSuccessRate;
- (BOOL)hasTxAppPktSucess;
- (BOOL)hasTxDelayavg;
- (BOOL)hasTxDelaymax;
- (BOOL)hasTxDelaymin;
- (BOOL)hasTxFailure;
- (BOOL)hasTxSuccess;
- (BOOL)hasTxSuccessRate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)rxFailure;
- (unsigned)rxSuccess;
- (unsigned)rxSuccessRate;
- (unsigned)txAppPktSucess;
- (unsigned)txDelayavg;
- (unsigned)txDelaymax;
- (unsigned)txDelaymin;
- (unsigned)txFailure;
- (unsigned)txSuccess;
- (unsigned)txSuccessRate;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRxFailure:(BOOL)a3;
- (void)setHasRxSuccess:(BOOL)a3;
- (void)setHasRxSuccessRate:(BOOL)a3;
- (void)setHasTxAppPktSucess:(BOOL)a3;
- (void)setHasTxDelayavg:(BOOL)a3;
- (void)setHasTxDelaymax:(BOOL)a3;
- (void)setHasTxDelaymin:(BOOL)a3;
- (void)setHasTxFailure:(BOOL)a3;
- (void)setHasTxSuccess:(BOOL)a3;
- (void)setHasTxSuccessRate:(BOOL)a3;
- (void)setRxFailure:(unsigned int)a3;
- (void)setRxSuccess:(unsigned int)a3;
- (void)setRxSuccessRate:(unsigned int)a3;
- (void)setTxAppPktSucess:(unsigned int)a3;
- (void)setTxDelayavg:(unsigned int)a3;
- (void)setTxDelaymax:(unsigned int)a3;
- (void)setTxDelaymin:(unsigned int)a3;
- (void)setTxFailure:(unsigned int)a3;
- (void)setTxSuccess:(unsigned int)a3;
- (void)setTxSuccessRate:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersIpv6S

- (void)setTxSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_txSuccess = a3;
}

- (void)setHasTxSuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTxSuccess
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTxFailure:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_txFailure = a3;
}

- (void)setHasTxFailure:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTxFailure
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRxSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_rxSuccess = a3;
}

- (void)setHasRxSuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRxSuccess
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRxFailure:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_rxFailure = a3;
}

- (void)setHasRxFailure:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRxFailure
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTxAppPktSucess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_txAppPktSucess = a3;
}

- (void)setHasTxAppPktSucess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTxAppPktSucess
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTxDelaymin:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_txDelaymin = a3;
}

- (void)setHasTxDelaymin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTxDelaymin
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTxDelaymax:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_txDelaymax = a3;
}

- (void)setHasTxDelaymax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTxDelaymax
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTxDelayavg:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_txDelayavg = a3;
}

- (void)setHasTxDelayavg:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTxDelayavg
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTxSuccessRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_txSuccessRate = a3;
}

- (void)setHasTxSuccessRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTxSuccessRate
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRxSuccessRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rxSuccessRate = a3;
}

- (void)setHasRxSuccessRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRxSuccessRate
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCountersIpv6S;
  __int16 v3 = [(AWDCountersIpv6S *)&v7 description];
  v4 = [(AWDCountersIpv6S *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_txSuccess];
    [v3 setObject:v7 forKey:@"tx_success"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedInt:self->_txFailure];
  [v3 setObject:v8 forKey:@"tx_failure"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  v9 = +[NSNumber numberWithUnsignedInt:self->_rxSuccess];
  [v3 setObject:v9 forKey:@"rx_success"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  v10 = +[NSNumber numberWithUnsignedInt:self->_rxFailure];
  [v3 setObject:v10 forKey:@"rx_failure"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  v11 = +[NSNumber numberWithUnsignedInt:self->_txAppPktSucess];
  [v3 setObject:v11 forKey:@"tx_app_pkt_sucess"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  v12 = +[NSNumber numberWithUnsignedInt:self->_txDelaymin];
  [v3 setObject:v12 forKey:@"tx_delaymin"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  v13 = +[NSNumber numberWithUnsignedInt:self->_txDelaymax];
  [v3 setObject:v13 forKey:@"tx_delaymax"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  v14 = +[NSNumber numberWithUnsignedInt:self->_txDelayavg];
  [v3 setObject:v14 forKey:@"tx_delayavg"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  v15 = +[NSNumber numberWithUnsignedInt:self->_txSuccessRate];
  [v3 setObject:v15 forKey:@"tx_success_rate"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_11:
    v5 = +[NSNumber numberWithUnsignedInt:self->_rxSuccessRate];
    [v3 setObject:v5 forKey:@"rx_success_rate"];
  }
LABEL_12:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCountersIpv6SReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_11:
    v5 = v6;
    goto LABEL_13;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  v5 = v6;

LABEL_13:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4[10] = self->_txSuccess;
    *((_WORD *)v4 + 24) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v4[9] = self->_txFailure;
  *((_WORD *)v4 + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[3] = self->_rxSuccess;
  *((_WORD *)v4 + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[2] = self->_rxFailure;
  *((_WORD *)v4 + 24) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[5] = self->_txAppPktSucess;
  *((_WORD *)v4 + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[8] = self->_txDelaymin;
  *((_WORD *)v4 + 24) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[7] = self->_txDelaymax;
  *((_WORD *)v4 + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  v4[6] = self->_txDelayavg;
  *((_WORD *)v4 + 24) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[11] = self->_txSuccessRate;
  *((_WORD *)v4 + 24) |= 0x200u;
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_11:
    goto LABEL_13;
  }
LABEL_23:
  v4[4] = self->_rxSuccessRate;
  *((_WORD *)v4 + 24) |= 4u;

LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)result + 10) = self->_txSuccess;
    *((_WORD *)result + 24) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 9) = self->_txFailure;
  *((_WORD *)result + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 3) = self->_rxSuccess;
  *((_WORD *)result + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 2) = self->_rxFailure;
  *((_WORD *)result + 24) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 5) = self->_txAppPktSucess;
  *((_WORD *)result + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 8) = self->_txDelaymin;
  *((_WORD *)result + 24) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 7) = self->_txDelaymax;
  *((_WORD *)result + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 6) = self->_txDelayavg;
  *((_WORD *)result + 24) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      return result;
    }
LABEL_21:
    *((_DWORD *)result + 4) = self->_rxSuccessRate;
    *((_WORD *)result + 24) |= 4u;
    return result;
  }
LABEL_20:
  *((_DWORD *)result + 11) = self->_txSuccessRate;
  *((_WORD *)result + 24) |= 0x200u;
  if ((*(_WORD *)&self->_has & 4) != 0) {
    goto LABEL_21;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 24);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x100) == 0 || self->_txSuccess != *((_DWORD *)v4 + 10)) {
      goto LABEL_52;
    }
  }
  else if ((*((_WORD *)v4 + 24) & 0x100) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_txFailure != *((_DWORD *)v4 + 9)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_rxSuccess != *((_DWORD *)v4 + 3)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_52;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_rxFailure != *((_DWORD *)v4 + 2)) {
      goto LABEL_52;
    }
  }
  else if (v6)
  {
    goto LABEL_52;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_txAppPktSucess != *((_DWORD *)v4 + 5)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_txDelaymin != *((_DWORD *)v4 + 8)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_txDelaymax != *((_DWORD *)v4 + 7)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_txDelayavg != *((_DWORD *)v4 + 6)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x200) == 0 || self->_txSuccessRate != *((_DWORD *)v4 + 11)) {
      goto LABEL_52;
    }
  }
  else if ((*((_WORD *)v4 + 24) & 0x200) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 4) == 0)
  {
    BOOL v7 = (v6 & 4) == 0;

    return v7;
  }
  if ((v6 & 4) != 0 && self->_rxSuccessRate == *((_DWORD *)v4 + 4))
  {

    return 1;
  }
LABEL_52:

  return 0;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v3 = 2654435761 * self->_txSuccess;
    if ((has & 0x80) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_txFailure;
      if ((has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_rxSuccess;
    if (has) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if (has)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_rxFailure;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_txAppPktSucess;
    if ((has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_txDelaymin;
    if ((has & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_txDelaymax;
    if ((has & 0x10) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_txDelayavg;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v11 = 0;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_txSuccessRate;
  if ((has & 4) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_rxSuccessRate;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x100) != 0)
  {
    self->_txSuccess = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v5 = *((_WORD *)v4 + 24);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_txFailure = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_rxSuccess = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_rxFailure = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_txAppPktSucess = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_txDelaymin = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_txDelaymax = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_txDelayavg = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_txSuccessRate = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 24) & 4) == 0)
  {
LABEL_11:
    goto LABEL_13;
  }
LABEL_23:
  self->_rxSuccessRate = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;

LABEL_13:
}

- (unsigned)txSuccess
{
  return self->_txSuccess;
}

- (unsigned)txFailure
{
  return self->_txFailure;
}

- (unsigned)rxSuccess
{
  return self->_rxSuccess;
}

- (unsigned)rxFailure
{
  return self->_rxFailure;
}

- (unsigned)txAppPktSucess
{
  return self->_txAppPktSucess;
}

- (unsigned)txDelaymin
{
  return self->_txDelaymin;
}

- (unsigned)txDelaymax
{
  return self->_txDelaymax;
}

- (unsigned)txDelayavg
{
  return self->_txDelayavg;
}

- (unsigned)txSuccessRate
{
  return self->_txSuccessRate;
}

- (unsigned)rxSuccessRate
{
  return self->_rxSuccessRate;
}

@end