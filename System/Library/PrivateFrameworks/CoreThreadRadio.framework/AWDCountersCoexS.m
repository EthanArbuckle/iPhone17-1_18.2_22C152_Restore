@interface AWDCountersCoexS
- (BOOL)hasCoexRxDeniedRequests;
- (BOOL)hasCoexRxGrantedRequests;
- (BOOL)hasCoexRxRequests;
- (BOOL)hasCoexTxDeniedRequests;
- (BOOL)hasCoexTxGrantedRequests;
- (BOOL)hasCoexTxRequests;
- (BOOL)hasCoexUnsolicitedGrants;
- (BOOL)hasRxDeniedReqPercentage;
- (BOOL)hasRxGrantedReqPercentage;
- (BOOL)hasTxDeniedReqPercentage;
- (BOOL)hasTxGrantedReqPercentage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)coexRxGrantTimeHistogramsCount;
- (unint64_t)coexTxGrantTimeHistogramsCount;
- (unint64_t)hash;
- (unsigned)coexRxDeniedRequests;
- (unsigned)coexRxGrantTimeHistogramAtIndex:(unint64_t)a3;
- (unsigned)coexRxGrantTimeHistograms;
- (unsigned)coexRxGrantedRequests;
- (unsigned)coexRxRequests;
- (unsigned)coexTxDeniedRequests;
- (unsigned)coexTxGrantTimeHistogramAtIndex:(unint64_t)a3;
- (unsigned)coexTxGrantTimeHistograms;
- (unsigned)coexTxGrantedRequests;
- (unsigned)coexTxRequests;
- (unsigned)coexUnsolicitedGrants;
- (unsigned)rxDeniedReqPercentage;
- (unsigned)rxGrantedReqPercentage;
- (unsigned)txDeniedReqPercentage;
- (unsigned)txGrantedReqPercentage;
- (void)addCoexRxGrantTimeHistogram:(unsigned int)a3;
- (void)addCoexTxGrantTimeHistogram:(unsigned int)a3;
- (void)clearCoexRxGrantTimeHistograms;
- (void)clearCoexTxGrantTimeHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCoexRxDeniedRequests:(unsigned int)a3;
- (void)setCoexRxGrantTimeHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCoexRxGrantedRequests:(unsigned int)a3;
- (void)setCoexRxRequests:(unsigned int)a3;
- (void)setCoexTxDeniedRequests:(unsigned int)a3;
- (void)setCoexTxGrantTimeHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCoexTxGrantedRequests:(unsigned int)a3;
- (void)setCoexTxRequests:(unsigned int)a3;
- (void)setCoexUnsolicitedGrants:(unsigned int)a3;
- (void)setHasCoexRxDeniedRequests:(BOOL)a3;
- (void)setHasCoexRxGrantedRequests:(BOOL)a3;
- (void)setHasCoexRxRequests:(BOOL)a3;
- (void)setHasCoexTxDeniedRequests:(BOOL)a3;
- (void)setHasCoexTxGrantedRequests:(BOOL)a3;
- (void)setHasCoexTxRequests:(BOOL)a3;
- (void)setHasCoexUnsolicitedGrants:(BOOL)a3;
- (void)setHasRxDeniedReqPercentage:(BOOL)a3;
- (void)setHasRxGrantedReqPercentage:(BOOL)a3;
- (void)setHasTxDeniedReqPercentage:(BOOL)a3;
- (void)setHasTxGrantedReqPercentage:(BOOL)a3;
- (void)setRxDeniedReqPercentage:(unsigned int)a3;
- (void)setRxGrantedReqPercentage:(unsigned int)a3;
- (void)setTxDeniedReqPercentage:(unsigned int)a3;
- (void)setTxGrantedReqPercentage:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersCoexS

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDCountersCoexS;
  [(AWDCountersCoexS *)&v3 dealloc];
}

- (void)setCoexUnsolicitedGrants:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_coexUnsolicitedGrants = a3;
}

- (void)setHasCoexUnsolicitedGrants:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasCoexUnsolicitedGrants
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setCoexTxRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_coexTxRequests = a3;
}

- (void)setHasCoexTxRequests:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCoexTxRequests
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCoexTxGrantedRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_coexTxGrantedRequests = a3;
}

- (void)setHasCoexTxGrantedRequests:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCoexTxGrantedRequests
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setCoexTxDeniedRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_coexTxDeniedRequests = a3;
}

- (void)setHasCoexTxDeniedRequests:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCoexTxDeniedRequests
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setCoexRxRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_coexRxRequests = a3;
}

- (void)setHasCoexRxRequests:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCoexRxRequests
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setCoexRxGrantedRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_coexRxGrantedRequests = a3;
}

- (void)setHasCoexRxGrantedRequests:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCoexRxGrantedRequests
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setCoexRxDeniedRequests:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_coexRxDeniedRequests = a3;
}

- (void)setHasCoexRxDeniedRequests:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCoexRxDeniedRequests
{
  return *(_WORD *)&self->_has & 1;
}

- (unint64_t)coexRxGrantTimeHistogramsCount
{
  return self->_coexRxGrantTimeHistograms.count;
}

- (unsigned)coexRxGrantTimeHistograms
{
  return self->_coexRxGrantTimeHistograms.list;
}

- (void)clearCoexRxGrantTimeHistograms
{
}

- (void)addCoexRxGrantTimeHistogram:(unsigned int)a3
{
}

- (unsigned)coexRxGrantTimeHistogramAtIndex:(unint64_t)a3
{
  p_coexRxGrantTimeHistograms = &self->_coexRxGrantTimeHistograms;
  unint64_t count = self->_coexRxGrantTimeHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_coexRxGrantTimeHistograms->list[a3];
}

- (void)setCoexRxGrantTimeHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)coexTxGrantTimeHistogramsCount
{
  return self->_coexTxGrantTimeHistograms.count;
}

- (unsigned)coexTxGrantTimeHistograms
{
  return self->_coexTxGrantTimeHistograms.list;
}

- (void)clearCoexTxGrantTimeHistograms
{
}

- (void)addCoexTxGrantTimeHistogram:(unsigned int)a3
{
}

- (unsigned)coexTxGrantTimeHistogramAtIndex:(unint64_t)a3
{
  p_coexTxGrantTimeHistograms = &self->_coexTxGrantTimeHistograms;
  unint64_t count = self->_coexTxGrantTimeHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_coexTxGrantTimeHistograms->list[a3];
}

- (void)setCoexTxGrantTimeHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setTxGrantedReqPercentage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_txGrantedReqPercentage = a3;
}

- (void)setHasTxGrantedReqPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTxGrantedReqPercentage
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setRxGrantedReqPercentage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rxGrantedReqPercentage = a3;
}

- (void)setHasRxGrantedReqPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRxGrantedReqPercentage
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTxDeniedReqPercentage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_txDeniedReqPercentage = a3;
}

- (void)setHasTxDeniedReqPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTxDeniedReqPercentage
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRxDeniedReqPercentage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rxDeniedReqPercentage = a3;
}

- (void)setHasRxDeniedReqPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRxDeniedReqPercentage
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCountersCoexS;
  __int16 v3 = [(AWDCountersCoexS *)&v7 description];
  v4 = [(AWDCountersCoexS *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v11 = +[NSNumber numberWithUnsignedInt:self->_coexUnsolicitedGrants];
    [v3 setObject:v11 forKey:@"coex_unsolicited_grants"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v12 = +[NSNumber numberWithUnsignedInt:self->_coexTxRequests];
  [v3 setObject:v12 forKey:@"coex_tx_requests"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  v13 = +[NSNumber numberWithUnsignedInt:self->_coexTxGrantedRequests];
  [v3 setObject:v13 forKey:@"coex_tx_granted_requests"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  v14 = +[NSNumber numberWithUnsignedInt:self->_coexTxDeniedRequests];
  [v3 setObject:v14 forKey:@"coex_tx_denied_requests"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  v15 = +[NSNumber numberWithUnsignedInt:self->_coexRxRequests];
  [v3 setObject:v15 forKey:@"coex_rx_requests"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_22:
  v16 = +[NSNumber numberWithUnsignedInt:self->_coexRxGrantedRequests];
  [v3 setObject:v16 forKey:@"coex_rx_granted_requests"];

  if (*(_WORD *)&self->_has)
  {
LABEL_8:
    v5 = +[NSNumber numberWithUnsignedInt:self->_coexRxDeniedRequests];
    [v3 setObject:v5 forKey:@"coex_rx_denied_requests"];
  }
LABEL_9:
  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"coex_rx_grant_time_histogram"];

  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"coex_tx_grant_time_histogram"];

  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x400) != 0)
  {
    v17 = +[NSNumber numberWithUnsignedInt:self->_txGrantedReqPercentage];
    [v3 setObject:v17 forKey:@"tx_granted_req_percentage"];

    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x100) == 0)
    {
LABEL_11:
      if ((v8 & 0x200) == 0) {
        goto LABEL_12;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  v18 = +[NSNumber numberWithUnsignedInt:self->_rxGrantedReqPercentage];
  [v3 setObject:v18 forKey:@"rx_granted_req_percentage"];

  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x200) == 0)
  {
LABEL_12:
    if ((v8 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_26:
  v19 = +[NSNumber numberWithUnsignedInt:self->_txDeniedReqPercentage];
  [v3 setObject:v19 forKey:@"tx_denied_req_percentage"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_13:
    v9 = +[NSNumber numberWithUnsignedInt:self->_rxDeniedReqPercentage];
    [v3 setObject:v9 forKey:@"rx_denied_req_percentage"];
  }
LABEL_14:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCountersCoexSReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  id v10 = v4;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v10;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v10;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  id v4 = v10;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  id v4 = v10;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  id v4 = v10;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  id v4 = v10;
  if ((*(_WORD *)&self->_has & 1) == 0)
  {
LABEL_8:
    p_coexRxGrantTimeHistograms = &self->_coexRxGrantTimeHistograms;
    if (!self->_coexRxGrantTimeHistograms.count) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  id v4 = v10;
  p_coexRxGrantTimeHistograms = &self->_coexRxGrantTimeHistograms;
  if (!self->_coexRxGrantTimeHistograms.count) {
    goto LABEL_19;
  }
LABEL_17:
  unint64_t v7 = 0;
  do
  {
    PBDataWriterWriteUint32Field();
    id v4 = v10;
    ++v7;
  }
  while (v7 < p_coexRxGrantTimeHistograms->count);
LABEL_19:
  if (self->_coexTxGrantTimeHistograms.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v10;
      ++v8;
    }
    while (v8 < self->_coexTxGrantTimeHistograms.count);
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v10;
    __int16 v9 = (__int16)self->_has;
    if ((v9 & 0x100) == 0)
    {
LABEL_24:
      if ((v9 & 0x200) == 0) {
        goto LABEL_25;
      }
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v10;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x200) == 0)
  {
LABEL_25:
    if ((v9 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  id v4 = v10;
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_26:
    goto LABEL_28;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  id v4 = v10;

LABEL_28:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[20] = self->_coexUnsolicitedGrants;
    *((_WORD *)v4 + 50) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v4[19] = self->_coexTxRequests;
  *((_WORD *)v4 + 50) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[18] = self->_coexTxGrantedRequests;
  *((_WORD *)v4 + 50) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  v4[17] = self->_coexTxDeniedRequests;
  *((_WORD *)v4 + 50) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[16] = self->_coexRxRequests;
  *((_WORD *)v4 + 50) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    v4[14] = self->_coexRxDeniedRequests;
    *((_WORD *)v4 + 50) |= 1u;
    id v13 = v4;
    if (![(AWDCountersCoexS *)self coexRxGrantTimeHistogramsCount]) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
LABEL_15:
  v4[15] = self->_coexRxGrantedRequests;
  *((_WORD *)v4 + 50) |= 2u;
  if (*(_WORD *)&self->_has) {
    goto LABEL_16;
  }
LABEL_8:
  id v13 = v4;
  if (![(AWDCountersCoexS *)self coexRxGrantTimeHistogramsCount]) {
    goto LABEL_20;
  }
LABEL_17:
  [v13 clearCoexRxGrantTimeHistograms];
  unint64_t v6 = [(AWDCountersCoexS *)self coexRxGrantTimeHistogramsCount];
  if (v6)
  {
    unint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      objc_msgSend(v13, "addCoexRxGrantTimeHistogram:", -[AWDCountersCoexS coexRxGrantTimeHistogramAtIndex:](self, "coexRxGrantTimeHistogramAtIndex:", i));
  }
LABEL_20:
  if ([(AWDCountersCoexS *)self coexTxGrantTimeHistogramsCount])
  {
    [v13 clearCoexTxGrantTimeHistograms];
    unint64_t v9 = [(AWDCountersCoexS *)self coexTxGrantTimeHistogramsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        objc_msgSend(v13, "addCoexTxGrantTimeHistogram:", -[AWDCountersCoexS coexTxGrantTimeHistogramAtIndex:](self, "coexTxGrantTimeHistogramAtIndex:", j));
    }
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x400) != 0)
  {
    *((_DWORD *)v13 + 24) = self->_txGrantedReqPercentage;
    *((_WORD *)v13 + 50) |= 0x400u;
    __int16 v12 = (__int16)self->_has;
    if ((v12 & 0x100) == 0)
    {
LABEL_26:
      if ((v12 & 0x200) == 0) {
        goto LABEL_27;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_26;
  }
  *((_DWORD *)v13 + 22) = self->_rxGrantedReqPercentage;
  *((_WORD *)v13 + 50) |= 0x100u;
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x200) == 0)
  {
LABEL_27:
    if ((v12 & 0x80) == 0) {
      goto LABEL_28;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v13 + 23) = self->_txDeniedReqPercentage;
  *((_WORD *)v13 + 50) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_28:
    goto LABEL_30;
  }
LABEL_34:
  *((_DWORD *)v13 + 21) = self->_rxDeniedReqPercentage;
  *((_WORD *)v13 + 50) |= 0x80u;

LABEL_30:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[20] = self->_coexUnsolicitedGrants;
    *((_WORD *)v4 + 50) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v4[19] = self->_coexTxRequests;
  *((_WORD *)v4 + 50) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[18] = self->_coexTxGrantedRequests;
  *((_WORD *)v4 + 50) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[17] = self->_coexTxDeniedRequests;
  *((_WORD *)v4 + 50) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[16] = self->_coexRxRequests;
  *((_WORD *)v4 + 50) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  v4[15] = self->_coexRxGrantedRequests;
  *((_WORD *)v4 + 50) |= 2u;
  if (*(_WORD *)&self->_has)
  {
LABEL_8:
    v4[14] = self->_coexRxDeniedRequests;
    *((_WORD *)v4 + 50) |= 1u;
  }
LABEL_9:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x400) != 0)
  {
    v5[24] = self->_txGrantedReqPercentage;
    *((_WORD *)v5 + 50) |= 0x400u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x100) == 0)
    {
LABEL_11:
      if ((v7 & 0x200) == 0) {
        goto LABEL_12;
      }
LABEL_23:
      v5[23] = self->_txDeniedReqPercentage;
      *((_WORD *)v5 + 50) |= 0x200u;
      if ((*(_WORD *)&self->_has & 0x80) == 0) {
        return v5;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  v5[22] = self->_rxGrantedReqPercentage;
  *((_WORD *)v5 + 50) |= 0x100u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x200) != 0) {
    goto LABEL_23;
  }
LABEL_12:
  if ((v7 & 0x80) == 0) {
    return v5;
  }
LABEL_24:
  v5[21] = self->_rxDeniedReqPercentage;
  *((_WORD *)v5 + 50) |= 0x80u;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_59;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 50);
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_coexUnsolicitedGrants != *((_DWORD *)v4 + 20)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
LABEL_59:
    BOOL v9 = 0;
    goto LABEL_60;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_coexTxRequests != *((_DWORD *)v4 + 19)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_coexTxGrantedRequests != *((_DWORD *)v4 + 18)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_coexTxDeniedRequests != *((_DWORD *)v4 + 17)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_coexRxRequests != *((_DWORD *)v4 + 16)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_coexRxGrantedRequests != *((_DWORD *)v4 + 15)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_59;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_coexRxDeniedRequests != *((_DWORD *)v4 + 14)) {
      goto LABEL_59;
    }
  }
  else if (v6)
  {
    goto LABEL_59;
  }
  if (!PBRepeatedUInt32IsEqual() || !PBRepeatedUInt32IsEqual()) {
    goto LABEL_59;
  }
  __int16 v7 = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 50);
  if ((v7 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x400) == 0 || self->_txGrantedReqPercentage != *((_DWORD *)v4 + 24)) {
      goto LABEL_59;
    }
  }
  else if ((*((_WORD *)v4 + 50) & 0x400) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x100) == 0 || self->_rxGrantedReqPercentage != *((_DWORD *)v4 + 22)) {
      goto LABEL_59;
    }
  }
  else if ((*((_WORD *)v4 + 50) & 0x100) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x200) == 0 || self->_txDeniedReqPercentage != *((_DWORD *)v4 + 23)) {
      goto LABEL_59;
    }
  }
  else if ((*((_WORD *)v4 + 50) & 0x200) != 0)
  {
    goto LABEL_59;
  }
  if ((v7 & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_rxDeniedReqPercentage != *((_DWORD *)v4 + 21)) {
      goto LABEL_59;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (v8 & 0x80) == 0;
  }
LABEL_60:

  return v9;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v18 = 2654435761 * self->_coexUnsolicitedGrants;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_coexTxRequests;
      if ((has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_coexTxGrantedRequests;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_coexTxDeniedRequests;
    if ((has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_coexRxRequests;
    if ((has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v8 = 0;
    if (has) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((has & 2) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_coexRxGrantedRequests;
  if (has)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_coexRxDeniedRequests;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v9 = 0;
LABEL_16:
  uint64_t v10 = PBRepeatedUInt32Hash();
  uint64_t v11 = PBRepeatedUInt32Hash();
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x400) != 0)
  {
    uint64_t v13 = 2654435761 * self->_txGrantedReqPercentage;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_18:
      uint64_t v14 = 2654435761 * self->_rxGrantedReqPercentage;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_19;
      }
LABEL_23:
      uint64_t v15 = 0;
      if ((v12 & 0x80) != 0) {
        goto LABEL_20;
      }
LABEL_24:
      uint64_t v16 = 0;
      return v4 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_18;
    }
  }
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t v15 = 2654435761 * self->_txDeniedReqPercentage;
  if ((v12 & 0x80) == 0) {
    goto LABEL_24;
  }
LABEL_20:
  uint64_t v16 = 2654435761 * self->_rxDeniedReqPercentage;
  return v4 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x40) != 0)
  {
    self->_coexUnsolicitedGrants = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v5 = *((_WORD *)v4 + 50);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_coexTxRequests = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 50);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_coexTxGrantedRequests = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 50);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_coexTxDeniedRequests = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 50);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_coexRxRequests = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 50);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_coexRxGrantedRequests = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 50) & 1) == 0)
  {
LABEL_8:
    uint64_t v13 = (unsigned int *)v4;
    uint64_t v6 = (char *)[v4 coexRxGrantTimeHistogramsCount];
    if (!v6) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_coexRxDeniedRequests = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 1u;
  uint64_t v13 = (unsigned int *)v4;
  uint64_t v6 = (char *)[v4 coexRxGrantTimeHistogramsCount];
  if (!v6) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v7 = v6;
  for (uint64_t i = 0; i != v7; ++i)
    -[AWDCountersCoexS addCoexRxGrantTimeHistogram:](self, "addCoexRxGrantTimeHistogram:", [v13 coexRxGrantTimeHistogramAtIndex:i]);
LABEL_19:
  uint64_t v9 = (char *)[v13 coexTxGrantTimeHistogramsCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[AWDCountersCoexS addCoexTxGrantTimeHistogram:](self, "addCoexTxGrantTimeHistogram:", [v13 coexTxGrantTimeHistogramAtIndex:j]);
  }
  __int16 v12 = *((_WORD *)v13 + 50);
  if ((v12 & 0x400) != 0)
  {
    self->_txGrantedReqPercentage = v13[24];
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v12 = *((_WORD *)v13 + 50);
    if ((v12 & 0x100) == 0)
    {
LABEL_24:
      if ((v12 & 0x200) == 0) {
        goto LABEL_25;
      }
      goto LABEL_31;
    }
  }
  else if ((v13[25] & 0x100) == 0)
  {
    goto LABEL_24;
  }
  self->_rxGrantedReqPercentage = v13[22];
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v12 = *((_WORD *)v13 + 50);
  if ((v12 & 0x200) == 0)
  {
LABEL_25:
    if ((v12 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_txDeniedReqPercentage = v13[23];
  *(_WORD *)&self->_has |= 0x200u;
  if ((v13[25] & 0x80) == 0)
  {
LABEL_26:
    goto LABEL_28;
  }
LABEL_32:
  self->_rxDeniedReqPercentage = v13[21];
  *(_WORD *)&self->_has |= 0x80u;

LABEL_28:
}

- (unsigned)coexUnsolicitedGrants
{
  return self->_coexUnsolicitedGrants;
}

- (unsigned)coexTxRequests
{
  return self->_coexTxRequests;
}

- (unsigned)coexTxGrantedRequests
{
  return self->_coexTxGrantedRequests;
}

- (unsigned)coexTxDeniedRequests
{
  return self->_coexTxDeniedRequests;
}

- (unsigned)coexRxRequests
{
  return self->_coexRxRequests;
}

- (unsigned)coexRxGrantedRequests
{
  return self->_coexRxGrantedRequests;
}

- (unsigned)coexRxDeniedRequests
{
  return self->_coexRxDeniedRequests;
}

- (unsigned)txGrantedReqPercentage
{
  return self->_txGrantedReqPercentage;
}

- (unsigned)rxGrantedReqPercentage
{
  return self->_rxGrantedReqPercentage;
}

- (unsigned)txDeniedReqPercentage
{
  return self->_txDeniedReqPercentage;
}

- (unsigned)rxDeniedReqPercentage
{
  return self->_rxDeniedReqPercentage;
}

@end