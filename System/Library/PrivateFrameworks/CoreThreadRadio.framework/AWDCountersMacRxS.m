@interface AWDCountersMacRxS
- (BOOL)hasRxBroadcast;
- (BOOL)hasRxData;
- (BOOL)hasRxErrDuplicated;
- (BOOL)hasRxErrFcs;
- (BOOL)hasRxErrInvalidSrcAddr;
- (BOOL)hasRxErrNoframe;
- (BOOL)hasRxErrOther;
- (BOOL)hasRxErrPercentage;
- (BOOL)hasRxErrSecurity;
- (BOOL)hasRxErrUnknownNeighbor;
- (BOOL)hasRxTotal;
- (BOOL)hasRxUnicast;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)rxPacketCountHistogramsCount;
- (unsigned)rxBroadcast;
- (unsigned)rxData;
- (unsigned)rxErrDuplicated;
- (unsigned)rxErrFcs;
- (unsigned)rxErrInvalidSrcAddr;
- (unsigned)rxErrNoframe;
- (unsigned)rxErrOther;
- (unsigned)rxErrPercentage;
- (unsigned)rxErrSecurity;
- (unsigned)rxErrUnknownNeighbor;
- (unsigned)rxPacketCountHistogramAtIndex:(unint64_t)a3;
- (unsigned)rxPacketCountHistograms;
- (unsigned)rxTotal;
- (unsigned)rxUnicast;
- (void)addRxPacketCountHistogram:(unsigned int)a3;
- (void)clearRxPacketCountHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasRxBroadcast:(BOOL)a3;
- (void)setHasRxData:(BOOL)a3;
- (void)setHasRxErrDuplicated:(BOOL)a3;
- (void)setHasRxErrFcs:(BOOL)a3;
- (void)setHasRxErrInvalidSrcAddr:(BOOL)a3;
- (void)setHasRxErrNoframe:(BOOL)a3;
- (void)setHasRxErrOther:(BOOL)a3;
- (void)setHasRxErrPercentage:(BOOL)a3;
- (void)setHasRxErrSecurity:(BOOL)a3;
- (void)setHasRxErrUnknownNeighbor:(BOOL)a3;
- (void)setHasRxTotal:(BOOL)a3;
- (void)setHasRxUnicast:(BOOL)a3;
- (void)setRxBroadcast:(unsigned int)a3;
- (void)setRxData:(unsigned int)a3;
- (void)setRxErrDuplicated:(unsigned int)a3;
- (void)setRxErrFcs:(unsigned int)a3;
- (void)setRxErrInvalidSrcAddr:(unsigned int)a3;
- (void)setRxErrNoframe:(unsigned int)a3;
- (void)setRxErrOther:(unsigned int)a3;
- (void)setRxErrPercentage:(unsigned int)a3;
- (void)setRxErrSecurity:(unsigned int)a3;
- (void)setRxErrUnknownNeighbor:(unsigned int)a3;
- (void)setRxPacketCountHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRxTotal:(unsigned int)a3;
- (void)setRxUnicast:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersMacRxS

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDCountersMacRxS;
  [(AWDCountersMacRxS *)&v3 dealloc];
}

- (void)setRxTotal:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_rxTotal = a3;
}

- (void)setHasRxTotal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRxTotal
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setRxData:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_rxData = a3;
}

- (void)setHasRxData:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRxData
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRxUnicast:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_rxUnicast = a3;
}

- (void)setHasRxUnicast:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRxUnicast
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setRxBroadcast:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_rxBroadcast = a3;
}

- (void)setHasRxBroadcast:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRxBroadcast
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRxErrFcs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rxErrFcs = a3;
}

- (void)setHasRxErrFcs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRxErrFcs
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRxErrUnknownNeighbor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rxErrUnknownNeighbor = a3;
}

- (void)setHasRxErrUnknownNeighbor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRxErrUnknownNeighbor
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRxErrInvalidSrcAddr:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_rxErrInvalidSrcAddr = a3;
}

- (void)setHasRxErrInvalidSrcAddr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRxErrInvalidSrcAddr
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRxErrSecurity:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rxErrSecurity = a3;
}

- (void)setHasRxErrSecurity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRxErrSecurity
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRxErrNoframe:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_rxErrNoframe = a3;
}

- (void)setHasRxErrNoframe:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRxErrNoframe
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRxErrDuplicated:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rxErrDuplicated = a3;
}

- (void)setHasRxErrDuplicated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRxErrDuplicated
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRxErrOther:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rxErrOther = a3;
}

- (void)setHasRxErrOther:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRxErrOther
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (unint64_t)rxPacketCountHistogramsCount
{
  return self->_rxPacketCountHistograms.count;
}

- (unsigned)rxPacketCountHistograms
{
  return self->_rxPacketCountHistograms.list;
}

- (void)clearRxPacketCountHistograms
{
}

- (void)addRxPacketCountHistogram:(unsigned int)a3
{
}

- (unsigned)rxPacketCountHistogramAtIndex:(unint64_t)a3
{
  p_rxPacketCountHistograms = &self->_rxPacketCountHistograms;
  unint64_t count = self->_rxPacketCountHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rxPacketCountHistograms->list[a3];
}

- (void)setRxPacketCountHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setRxErrPercentage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rxErrPercentage = a3;
}

- (void)setHasRxErrPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRxErrPercentage
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCountersMacRxS;
  __int16 v3 = [(AWDCountersMacRxS *)&v7 description];
  v4 = [(AWDCountersMacRxS *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_rxTotal];
    [v3 setObject:v9 forKey:@"rx_total"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = +[NSNumber numberWithUnsignedInt:self->_rxData];
  [v3 setObject:v10 forKey:@"rx_data"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  v11 = +[NSNumber numberWithUnsignedInt:self->_rxUnicast];
  [v3 setObject:v11 forKey:@"rx_unicast"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  v12 = +[NSNumber numberWithUnsignedInt:self->_rxBroadcast];
  [v3 setObject:v12 forKey:@"rx_broadcast"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  v13 = +[NSNumber numberWithUnsignedInt:self->_rxErrFcs];
  [v3 setObject:v13 forKey:@"rx_err_fcs"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  v14 = +[NSNumber numberWithUnsignedInt:self->_rxErrUnknownNeighbor];
  [v3 setObject:v14 forKey:@"rx_err_unknown_neighbor"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  v15 = +[NSNumber numberWithUnsignedInt:self->_rxErrInvalidSrcAddr];
  [v3 setObject:v15 forKey:@"rx_err_invalid_src_addr"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  v16 = +[NSNumber numberWithUnsignedInt:self->_rxErrSecurity];
  [v3 setObject:v16 forKey:@"rx_err_security"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  v17 = +[NSNumber numberWithUnsignedInt:self->_rxErrNoframe];
  [v3 setObject:v17 forKey:@"rx_err_noframe"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_27:
  v18 = +[NSNumber numberWithUnsignedInt:self->_rxErrDuplicated];
  [v3 setObject:v18 forKey:@"rx_err_duplicated"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    v5 = +[NSNumber numberWithUnsignedInt:self->_rxErrOther];
    [v3 setObject:v5 forKey:@"rx_err_other"];
  }
LABEL_13:
  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"rx_packet_count_histogram"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_rxErrPercentage];
    [v3 setObject:v7 forKey:@"rx_err_percentage"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCountersMacRxSReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  id v8 = v4;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
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
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_12:
    p_rxPacketCountHistograms = &self->_rxPacketCountHistograms;
    if (!self->_rxPacketCountHistograms.count) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  p_rxPacketCountHistograms = &self->_rxPacketCountHistograms;
  if (!self->_rxPacketCountHistograms.count) {
    goto LABEL_27;
  }
LABEL_25:
  unint64_t v7 = 0;
  do
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
    ++v7;
  }
  while (v7 < p_rxPacketCountHistograms->count);
LABEL_27:
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v4[18] = self->_rxTotal;
    *((_WORD *)v4 + 40) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[9] = self->_rxData;
  *((_WORD *)v4 + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[19] = self->_rxUnicast;
  *((_WORD *)v4 + 40) |= 0x800u;
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
  v4[8] = self->_rxBroadcast;
  *((_WORD *)v4 + 40) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[11] = self->_rxErrFcs;
  *((_WORD *)v4 + 40) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[17] = self->_rxErrUnknownNeighbor;
  *((_WORD *)v4 + 40) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[12] = self->_rxErrInvalidSrcAddr;
  *((_WORD *)v4 + 40) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  v4[16] = self->_rxErrSecurity;
  *((_WORD *)v4 + 40) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[13] = self->_rxErrNoframe;
  *((_WORD *)v4 + 40) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  v4[10] = self->_rxErrDuplicated;
  *((_WORD *)v4 + 40) |= 4u;
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_12:
    id v9 = v4;
    if (![(AWDCountersMacRxS *)self rxPacketCountHistogramsCount]) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[14] = self->_rxErrOther;
  *((_WORD *)v4 + 40) |= 0x40u;
  id v9 = v4;
  if (![(AWDCountersMacRxS *)self rxPacketCountHistogramsCount]) {
    goto LABEL_28;
  }
LABEL_25:
  [v9 clearRxPacketCountHistograms];
  unint64_t v6 = [(AWDCountersMacRxS *)self rxPacketCountHistogramsCount];
  if (v6)
  {
    unint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      objc_msgSend(v9, "addRxPacketCountHistogram:", -[AWDCountersMacRxS rxPacketCountHistogramAtIndex:](self, "rxPacketCountHistogramAtIndex:", i));
  }
LABEL_28:
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v9 + 15) = self->_rxErrPercentage;
    *((_WORD *)v9 + 40) |= 0x80u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v4[18] = self->_rxTotal;
    *((_WORD *)v4 + 40) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[9] = self->_rxData;
  *((_WORD *)v4 + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[19] = self->_rxUnicast;
  *((_WORD *)v4 + 40) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[8] = self->_rxBroadcast;
  *((_WORD *)v4 + 40) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[11] = self->_rxErrFcs;
  *((_WORD *)v4 + 40) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  v4[17] = self->_rxErrUnknownNeighbor;
  *((_WORD *)v4 + 40) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[12] = self->_rxErrInvalidSrcAddr;
  *((_WORD *)v4 + 40) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  v4[16] = self->_rxErrSecurity;
  *((_WORD *)v4 + 40) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[13] = self->_rxErrNoframe;
  *((_WORD *)v4 + 40) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  v4[10] = self->_rxErrDuplicated;
  *((_WORD *)v4 + 40) |= 4u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    v4[14] = self->_rxErrOther;
    *((_WORD *)v4 + 40) |= 0x40u;
  }
LABEL_13:
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v5[15] = self->_rxErrPercentage;
    *((_WORD *)v5 + 40) |= 0x80u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_63;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 40);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x400) == 0 || self->_rxTotal != *((_DWORD *)v4 + 18)) {
      goto LABEL_63;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x400) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_rxData != *((_DWORD *)v4 + 9)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x800) == 0 || self->_rxUnicast != *((_DWORD *)v4 + 19)) {
      goto LABEL_63;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x800) != 0)
  {
    goto LABEL_63;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_rxBroadcast != *((_DWORD *)v4 + 8)) {
      goto LABEL_63;
    }
  }
  else if (v6)
  {
    goto LABEL_63;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_rxErrFcs != *((_DWORD *)v4 + 11)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x200) == 0 || self->_rxErrUnknownNeighbor != *((_DWORD *)v4 + 17)) {
      goto LABEL_63;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x200) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_rxErrInvalidSrcAddr != *((_DWORD *)v4 + 12)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0 || self->_rxErrSecurity != *((_DWORD *)v4 + 16)) {
      goto LABEL_63;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_rxErrNoframe != *((_DWORD *)v4 + 13)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_rxErrDuplicated != *((_DWORD *)v4 + 10)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_rxErrOther != *((_DWORD *)v4 + 14)) {
      goto LABEL_63;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_63;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_63:
    BOOL v8 = 0;
    goto LABEL_64;
  }
  __int16 v7 = *((_WORD *)v4 + 40);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_rxErrPercentage != *((_DWORD *)v4 + 15)) {
      goto LABEL_63;
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = (v7 & 0x80) == 0;
  }
LABEL_64:

  return v8;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    uint64_t v17 = 2654435761 * self->_rxTotal;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v16 = 2654435761 * self->_rxData;
      if ((*(_WORD *)&self->_has & 0x800) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v16 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_4:
    uint64_t v15 = 2654435761 * self->_rxUnicast;
    if (has) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v15 = 0;
  if (has)
  {
LABEL_5:
    uint64_t v14 = 2654435761 * self->_rxBroadcast;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v14 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    uint64_t v4 = 2654435761 * self->_rxErrFcs;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_7:
    uint64_t v5 = 2654435761 * self->_rxErrUnknownNeighbor;
    if ((has & 0x10) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    uint64_t v6 = 2654435761 * self->_rxErrInvalidSrcAddr;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    uint64_t v7 = 2654435761 * self->_rxErrSecurity;
    if ((has & 0x20) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_10:
    uint64_t v8 = 2654435761 * self->_rxErrNoframe;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_11:
    uint64_t v9 = 2654435761 * self->_rxErrDuplicated;
    if ((has & 0x40) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v10 = 0;
    uint64_t v11 = PBRepeatedUInt32Hash();
    if ((*(_WORD *)&self->_has & 0x80) != 0) {
      goto LABEL_13;
    }
LABEL_25:
    uint64_t v12 = 0;
    return v16 ^ v17 ^ v15 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
  }
LABEL_23:
  uint64_t v9 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  uint64_t v10 = 2654435761 * self->_rxErrOther;
  uint64_t v11 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_has & 0x80) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  uint64_t v12 = 2654435761 * self->_rxErrPercentage;
  return v16 ^ v17 ^ v15 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x400) != 0)
  {
    self->_rxTotal = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v5 = *((_WORD *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_rxData = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x800) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_rxUnicast = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_rxBroadcast = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_rxErrFcs = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x200) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_rxErrUnknownNeighbor = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_rxErrInvalidSrcAddr = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_rxErrSecurity = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_rxErrNoframe = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_rxErrDuplicated = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 40) & 0x40) == 0)
  {
LABEL_12:
    uint64_t v9 = (unsigned int *)v4;
    uint64_t v6 = (char *)[v4 rxPacketCountHistogramsCount];
    if (!v6) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_rxErrOther = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x40u;
  uint64_t v9 = (unsigned int *)v4;
  uint64_t v6 = (char *)[v4 rxPacketCountHistogramsCount];
  if (!v6) {
    goto LABEL_27;
  }
LABEL_25:
  uint64_t v7 = v6;
  for (uint64_t i = 0; i != v7; ++i)
    -[AWDCountersMacRxS addRxPacketCountHistogram:](self, "addRxPacketCountHistogram:", [v9 rxPacketCountHistogramAtIndex:i]);
LABEL_27:
  if ((v9[20] & 0x80) != 0)
  {
    self->_rxErrPercentage = v9[15];
    *(_WORD *)&self->_has |= 0x80u;
  }
}

- (unsigned)rxTotal
{
  return self->_rxTotal;
}

- (unsigned)rxData
{
  return self->_rxData;
}

- (unsigned)rxUnicast
{
  return self->_rxUnicast;
}

- (unsigned)rxBroadcast
{
  return self->_rxBroadcast;
}

- (unsigned)rxErrFcs
{
  return self->_rxErrFcs;
}

- (unsigned)rxErrUnknownNeighbor
{
  return self->_rxErrUnknownNeighbor;
}

- (unsigned)rxErrInvalidSrcAddr
{
  return self->_rxErrInvalidSrcAddr;
}

- (unsigned)rxErrSecurity
{
  return self->_rxErrSecurity;
}

- (unsigned)rxErrNoframe
{
  return self->_rxErrNoframe;
}

- (unsigned)rxErrDuplicated
{
  return self->_rxErrDuplicated;
}

- (unsigned)rxErrOther
{
  return self->_rxErrOther;
}

- (unsigned)rxErrPercentage
{
  return self->_rxErrPercentage;
}

@end