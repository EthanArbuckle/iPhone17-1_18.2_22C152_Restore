@interface AWDCountersNetworkS
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)channelSelectionsHistogramsCount;
- (unint64_t)frameTxpowerHistogramsCount;
- (unint64_t)hash;
- (unint64_t)nbrBatteryExtensionFactorHistogramsCount;
- (unint64_t)nbrTxpowerHistogramsCount;
- (unint64_t)packetLqiHistogramsCount;
- (unint64_t)packetRssiNbrAccessoryHistogramsCount;
- (unint64_t)packetRssiNbrRouterHistogramsCount;
- (unsigned)channelSelectionsHistogramAtIndex:(unint64_t)a3;
- (unsigned)channelSelectionsHistograms;
- (unsigned)frameTxpowerHistogramAtIndex:(unint64_t)a3;
- (unsigned)frameTxpowerHistograms;
- (unsigned)nbrBatteryExtensionFactorHistogramAtIndex:(unint64_t)a3;
- (unsigned)nbrBatteryExtensionFactorHistograms;
- (unsigned)nbrTxpowerHistogramAtIndex:(unint64_t)a3;
- (unsigned)nbrTxpowerHistograms;
- (unsigned)packetLqiHistogramAtIndex:(unint64_t)a3;
- (unsigned)packetLqiHistograms;
- (unsigned)packetRssiNbrAccessoryHistogramAtIndex:(unint64_t)a3;
- (unsigned)packetRssiNbrAccessoryHistograms;
- (unsigned)packetRssiNbrRouterHistogramAtIndex:(unint64_t)a3;
- (unsigned)packetRssiNbrRouterHistograms;
- (void)addChannelSelectionsHistogram:(unsigned int)a3;
- (void)addFrameTxpowerHistogram:(unsigned int)a3;
- (void)addNbrBatteryExtensionFactorHistogram:(unsigned int)a3;
- (void)addNbrTxpowerHistogram:(unsigned int)a3;
- (void)addPacketLqiHistogram:(unsigned int)a3;
- (void)addPacketRssiNbrAccessoryHistogram:(unsigned int)a3;
- (void)addPacketRssiNbrRouterHistogram:(unsigned int)a3;
- (void)clearChannelSelectionsHistograms;
- (void)clearFrameTxpowerHistograms;
- (void)clearNbrBatteryExtensionFactorHistograms;
- (void)clearNbrTxpowerHistograms;
- (void)clearPacketLqiHistograms;
- (void)clearPacketRssiNbrAccessoryHistograms;
- (void)clearPacketRssiNbrRouterHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setChannelSelectionsHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setFrameTxpowerHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setNbrBatteryExtensionFactorHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setNbrTxpowerHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPacketLqiHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPacketRssiNbrAccessoryHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPacketRssiNbrRouterHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersNetworkS

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
  v3.super_class = (Class)AWDCountersNetworkS;
  [(AWDCountersNetworkS *)&v3 dealloc];
}

- (unint64_t)packetRssiNbrRouterHistogramsCount
{
  return self->_packetRssiNbrRouterHistograms.count;
}

- (unsigned)packetRssiNbrRouterHistograms
{
  return self->_packetRssiNbrRouterHistograms.list;
}

- (void)clearPacketRssiNbrRouterHistograms
{
}

- (void)addPacketRssiNbrRouterHistogram:(unsigned int)a3
{
}

- (unsigned)packetRssiNbrRouterHistogramAtIndex:(unint64_t)a3
{
  p_packetRssiNbrRouterHistograms = &self->_packetRssiNbrRouterHistograms;
  unint64_t count = self->_packetRssiNbrRouterHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_packetRssiNbrRouterHistograms->list[a3];
}

- (void)setPacketRssiNbrRouterHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)packetRssiNbrAccessoryHistogramsCount
{
  return self->_packetRssiNbrAccessoryHistograms.count;
}

- (unsigned)packetRssiNbrAccessoryHistograms
{
  return self->_packetRssiNbrAccessoryHistograms.list;
}

- (void)clearPacketRssiNbrAccessoryHistograms
{
}

- (void)addPacketRssiNbrAccessoryHistogram:(unsigned int)a3
{
}

- (unsigned)packetRssiNbrAccessoryHistogramAtIndex:(unint64_t)a3
{
  p_packetRssiNbrAccessoryHistograms = &self->_packetRssiNbrAccessoryHistograms;
  unint64_t count = self->_packetRssiNbrAccessoryHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_packetRssiNbrAccessoryHistograms->list[a3];
}

- (void)setPacketRssiNbrAccessoryHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)channelSelectionsHistogramsCount
{
  return self->_channelSelectionsHistograms.count;
}

- (unsigned)channelSelectionsHistograms
{
  return self->_channelSelectionsHistograms.list;
}

- (void)clearChannelSelectionsHistograms
{
}

- (void)addChannelSelectionsHistogram:(unsigned int)a3
{
}

- (unsigned)channelSelectionsHistogramAtIndex:(unint64_t)a3
{
  p_channelSelectionsHistograms = &self->_channelSelectionsHistograms;
  unint64_t count = self->_channelSelectionsHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_channelSelectionsHistograms->list[a3];
}

- (void)setChannelSelectionsHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)packetLqiHistogramsCount
{
  return self->_packetLqiHistograms.count;
}

- (unsigned)packetLqiHistograms
{
  return self->_packetLqiHistograms.list;
}

- (void)clearPacketLqiHistograms
{
}

- (void)addPacketLqiHistogram:(unsigned int)a3
{
}

- (unsigned)packetLqiHistogramAtIndex:(unint64_t)a3
{
  p_packetLqiHistograms = &self->_packetLqiHistograms;
  unint64_t count = self->_packetLqiHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_packetLqiHistograms->list[a3];
}

- (void)setPacketLqiHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)frameTxpowerHistogramsCount
{
  return self->_frameTxpowerHistograms.count;
}

- (unsigned)frameTxpowerHistograms
{
  return self->_frameTxpowerHistograms.list;
}

- (void)clearFrameTxpowerHistograms
{
}

- (void)addFrameTxpowerHistogram:(unsigned int)a3
{
}

- (unsigned)frameTxpowerHistogramAtIndex:(unint64_t)a3
{
  p_frameTxpowerHistograms = &self->_frameTxpowerHistograms;
  unint64_t count = self->_frameTxpowerHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_frameTxpowerHistograms->list[a3];
}

- (void)setFrameTxpowerHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)nbrTxpowerHistogramsCount
{
  return self->_nbrTxpowerHistograms.count;
}

- (unsigned)nbrTxpowerHistograms
{
  return self->_nbrTxpowerHistograms.list;
}

- (void)clearNbrTxpowerHistograms
{
}

- (void)addNbrTxpowerHistogram:(unsigned int)a3
{
}

- (unsigned)nbrTxpowerHistogramAtIndex:(unint64_t)a3
{
  p_nbrTxpowerHistograms = &self->_nbrTxpowerHistograms;
  unint64_t count = self->_nbrTxpowerHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_nbrTxpowerHistograms->list[a3];
}

- (void)setNbrTxpowerHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)nbrBatteryExtensionFactorHistogramsCount
{
  return self->_nbrBatteryExtensionFactorHistograms.count;
}

- (unsigned)nbrBatteryExtensionFactorHistograms
{
  return self->_nbrBatteryExtensionFactorHistograms.list;
}

- (void)clearNbrBatteryExtensionFactorHistograms
{
}

- (void)addNbrBatteryExtensionFactorHistogram:(unsigned int)a3
{
}

- (unsigned)nbrBatteryExtensionFactorHistogramAtIndex:(unint64_t)a3
{
  p_nbrBatteryExtensionFactorHistograms = &self->_nbrBatteryExtensionFactorHistograms;
  unint64_t count = self->_nbrBatteryExtensionFactorHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_nbrBatteryExtensionFactorHistograms->list[a3];
}

- (void)setNbrBatteryExtensionFactorHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCountersNetworkS;
  objc_super v3 = [(AWDCountersNetworkS *)&v7 description];
  v4 = [(AWDCountersNetworkS *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v2 = +[NSMutableDictionary dictionary];
  objc_super v3 = PBRepeatedUInt32NSArray();
  [v2 setObject:v3 forKey:@"packet_rssi_nbr_router_histogram"];

  v4 = PBRepeatedUInt32NSArray();
  [v2 setObject:v4 forKey:@"packet_rssi_nbr_accessory_histogram"];

  v5 = PBRepeatedUInt32NSArray();
  [v2 setObject:v5 forKey:@"channel_selections_histogram"];

  v6 = PBRepeatedUInt32NSArray();
  [v2 setObject:v6 forKey:@"packet_lqi_histogram"];

  objc_super v7 = PBRepeatedUInt32NSArray();
  [v2 setObject:v7 forKey:@"frame_txpower_histogram"];

  v8 = PBRepeatedUInt32NSArray();
  [v2 setObject:v8 forKey:@"nbr_txpower_histogram"];

  v9 = PBRepeatedUInt32NSArray();
  [v2 setObject:v9 forKey:@"nbr_battery_extension_factor_histogram"];

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCountersNetworkSReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_packetRssiNbrRouterHistograms.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v13;
      ++v5;
    }
    while (v5 < self->_packetRssiNbrRouterHistograms.count);
  }
  if (self->_packetRssiNbrAccessoryHistograms.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v13;
      ++v6;
    }
    while (v6 < self->_packetRssiNbrAccessoryHistograms.count);
  }
  if (self->_channelSelectionsHistograms.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v13;
      ++v7;
    }
    while (v7 < self->_channelSelectionsHistograms.count);
  }
  if (self->_packetLqiHistograms.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v13;
      ++v8;
    }
    while (v8 < self->_packetLqiHistograms.count);
  }
  if (self->_frameTxpowerHistograms.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v13;
      ++v9;
    }
    while (v9 < self->_frameTxpowerHistograms.count);
  }
  if (self->_nbrTxpowerHistograms.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v13;
      ++v10;
    }
    while (v10 < self->_nbrTxpowerHistograms.count);
  }
  p_nbrBatteryExtensionFactorHistograms = &self->_nbrBatteryExtensionFactorHistograms;
  if (p_nbrBatteryExtensionFactorHistograms->count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v13;
      ++v12;
    }
    while (v12 < p_nbrBatteryExtensionFactorHistograms->count);
  }
}

- (void)copyTo:(id)a3
{
  id v25 = a3;
  if ([(AWDCountersNetworkS *)self packetRssiNbrRouterHistogramsCount])
  {
    [v25 clearPacketRssiNbrRouterHistograms];
    unint64_t v4 = [(AWDCountersNetworkS *)self packetRssiNbrRouterHistogramsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v25, "addPacketRssiNbrRouterHistogram:", -[AWDCountersNetworkS packetRssiNbrRouterHistogramAtIndex:](self, "packetRssiNbrRouterHistogramAtIndex:", i));
    }
  }
  if ([(AWDCountersNetworkS *)self packetRssiNbrAccessoryHistogramsCount])
  {
    [v25 clearPacketRssiNbrAccessoryHistograms];
    unint64_t v7 = [(AWDCountersNetworkS *)self packetRssiNbrAccessoryHistogramsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v25, "addPacketRssiNbrAccessoryHistogram:", -[AWDCountersNetworkS packetRssiNbrAccessoryHistogramAtIndex:](self, "packetRssiNbrAccessoryHistogramAtIndex:", j));
    }
  }
  if ([(AWDCountersNetworkS *)self channelSelectionsHistogramsCount])
  {
    [v25 clearChannelSelectionsHistograms];
    unint64_t v10 = [(AWDCountersNetworkS *)self channelSelectionsHistogramsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
        objc_msgSend(v25, "addChannelSelectionsHistogram:", -[AWDCountersNetworkS channelSelectionsHistogramAtIndex:](self, "channelSelectionsHistogramAtIndex:", k));
    }
  }
  if ([(AWDCountersNetworkS *)self packetLqiHistogramsCount])
  {
    [v25 clearPacketLqiHistograms];
    unint64_t v13 = [(AWDCountersNetworkS *)self packetLqiHistogramsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t m = 0; m != v14; ++m)
        objc_msgSend(v25, "addPacketLqiHistogram:", -[AWDCountersNetworkS packetLqiHistogramAtIndex:](self, "packetLqiHistogramAtIndex:", m));
    }
  }
  if ([(AWDCountersNetworkS *)self frameTxpowerHistogramsCount])
  {
    [v25 clearFrameTxpowerHistograms];
    unint64_t v16 = [(AWDCountersNetworkS *)self frameTxpowerHistogramsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t n = 0; n != v17; ++n)
        objc_msgSend(v25, "addFrameTxpowerHistogram:", -[AWDCountersNetworkS frameTxpowerHistogramAtIndex:](self, "frameTxpowerHistogramAtIndex:", n));
    }
  }
  if ([(AWDCountersNetworkS *)self nbrTxpowerHistogramsCount])
  {
    [v25 clearNbrTxpowerHistograms];
    unint64_t v19 = [(AWDCountersNetworkS *)self nbrTxpowerHistogramsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (iuint64_t i = 0; ii != v20; ++ii)
        objc_msgSend(v25, "addNbrTxpowerHistogram:", -[AWDCountersNetworkS nbrTxpowerHistogramAtIndex:](self, "nbrTxpowerHistogramAtIndex:", ii));
    }
  }
  if ([(AWDCountersNetworkS *)self nbrBatteryExtensionFactorHistogramsCount])
  {
    [v25 clearNbrBatteryExtensionFactorHistograms];
    unint64_t v22 = [(AWDCountersNetworkS *)self nbrBatteryExtensionFactorHistogramsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (juint64_t j = 0; jj != v23; ++jj)
        objc_msgSend(v25, "addNbrBatteryExtensionFactorHistogram:", -[AWDCountersNetworkS nbrBatteryExtensionFactorHistogramAtIndex:](self, "nbrBatteryExtensionFactorHistogramAtIndex:", jj));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()]
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual())
  {
    char IsEqual = PBRepeatedUInt32IsEqual();

    return IsEqual;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2 = PBRepeatedUInt32Hash();
  uint64_t v3 = PBRepeatedUInt32Hash() ^ v2;
  uint64_t v4 = PBRepeatedUInt32Hash();
  uint64_t v5 = v3 ^ v4 ^ PBRepeatedUInt32Hash();
  uint64_t v6 = PBRepeatedUInt32Hash();
  uint64_t v7 = v6 ^ PBRepeatedUInt32Hash();
  return v5 ^ v7 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v25 = a3;
  uint64_t v4 = (char *)[v25 packetRssiNbrRouterHistogramsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[AWDCountersNetworkS addPacketRssiNbrRouterHistogram:](self, "addPacketRssiNbrRouterHistogram:", [v25 packetRssiNbrRouterHistogramAtIndex:i]);
  }
  uint64_t v7 = (char *)[v25 packetRssiNbrAccessoryHistogramsCount];
  if (v7)
  {
    unint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
      -[AWDCountersNetworkS addPacketRssiNbrAccessoryHistogram:](self, "addPacketRssiNbrAccessoryHistogram:", [v25 packetRssiNbrAccessoryHistogramAtIndex:j]);
  }
  unint64_t v10 = (char *)[v25 channelSelectionsHistogramsCount];
  if (v10)
  {
    unint64_t v11 = v10;
    for (uint64_t k = 0; k != v11; ++k)
      -[AWDCountersNetworkS addChannelSelectionsHistogram:](self, "addChannelSelectionsHistogram:", [v25 channelSelectionsHistogramAtIndex:k]);
  }
  unint64_t v13 = (char *)[v25 packetLqiHistogramsCount];
  if (v13)
  {
    unint64_t v14 = v13;
    for (uint64_t m = 0; m != v14; ++m)
      -[AWDCountersNetworkS addPacketLqiHistogram:](self, "addPacketLqiHistogram:", [v25 packetLqiHistogramAtIndex:m]);
  }
  unint64_t v16 = (char *)[v25 frameTxpowerHistogramsCount];
  if (v16)
  {
    unint64_t v17 = v16;
    for (uint64_t n = 0; n != v17; ++n)
      -[AWDCountersNetworkS addFrameTxpowerHistogram:](self, "addFrameTxpowerHistogram:", [v25 frameTxpowerHistogramAtIndex:n]);
  }
  unint64_t v19 = (char *)[v25 nbrTxpowerHistogramsCount];
  if (v19)
  {
    unint64_t v20 = v19;
    for (iuint64_t i = 0; ii != v20; ++ii)
      -[AWDCountersNetworkS addNbrTxpowerHistogram:](self, "addNbrTxpowerHistogram:", [v25 nbrTxpowerHistogramAtIndex:ii]);
  }
  unint64_t v22 = (char *)[v25 nbrBatteryExtensionFactorHistogramsCount];
  if (v22)
  {
    unint64_t v23 = v22;
    for (juint64_t j = 0; jj != v23; ++jj)
      -[AWDCountersNetworkS addNbrBatteryExtensionFactorHistogram:](self, "addNbrBatteryExtensionFactorHistogram:", [v25 nbrBatteryExtensionFactorHistogramAtIndex:jj]);
  }
}

@end