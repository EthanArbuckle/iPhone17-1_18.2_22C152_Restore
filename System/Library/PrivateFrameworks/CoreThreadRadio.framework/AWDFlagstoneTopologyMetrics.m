@interface AWDFlagstoneTopologyMetrics
- (AWDHeaderInfoS)header;
- (BOOL)hasHeader;
- (BOOL)hasMaxChangeinNodeCount;
- (BOOL)hasPercTopologyChangeTimeInstances;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)fEDCountsCount;
- (unint64_t)hash;
- (unint64_t)nodeCountsCount;
- (unint64_t)routerCountsCount;
- (unint64_t)sEDCountsCount;
- (unint64_t)timestamp;
- (unsigned)fEDCountAtIndex:(unint64_t)a3;
- (unsigned)fEDCounts;
- (unsigned)maxChangeinNodeCount;
- (unsigned)nodeCountAtIndex:(unint64_t)a3;
- (unsigned)nodeCounts;
- (unsigned)percTopologyChangeTimeInstances;
- (unsigned)routerCountAtIndex:(unint64_t)a3;
- (unsigned)routerCounts;
- (unsigned)sEDCountAtIndex:(unint64_t)a3;
- (unsigned)sEDCounts;
- (void)addFEDCount:(unsigned int)a3;
- (void)addNodeCount:(unsigned int)a3;
- (void)addRouterCount:(unsigned int)a3;
- (void)addSEDCount:(unsigned int)a3;
- (void)clearFEDCounts;
- (void)clearNodeCounts;
- (void)clearRouterCounts;
- (void)clearSEDCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFEDCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasMaxChangeinNodeCount:(BOOL)a3;
- (void)setHasPercTopologyChangeTimeInstances:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setMaxChangeinNodeCount:(unsigned int)a3;
- (void)setNodeCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPercTopologyChangeTimeInstances:(unsigned int)a3;
- (void)setRouterCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSEDCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDFlagstoneTopologyMetrics

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDFlagstoneTopologyMetrics;
  [(AWDFlagstoneTopologyMetrics *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (unint64_t)nodeCountsCount
{
  return self->_nodeCounts.count;
}

- (unsigned)nodeCounts
{
  return self->_nodeCounts.list;
}

- (void)clearNodeCounts
{
}

- (void)addNodeCount:(unsigned int)a3
{
}

- (unsigned)nodeCountAtIndex:(unint64_t)a3
{
  p_nodeCounts = &self->_nodeCounts;
  unint64_t count = self->_nodeCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_nodeCounts->list[a3];
}

- (void)setNodeCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)routerCountsCount
{
  return self->_routerCounts.count;
}

- (unsigned)routerCounts
{
  return self->_routerCounts.list;
}

- (void)clearRouterCounts
{
}

- (void)addRouterCount:(unsigned int)a3
{
}

- (unsigned)routerCountAtIndex:(unint64_t)a3
{
  p_routerCounts = &self->_routerCounts;
  unint64_t count = self->_routerCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_routerCounts->list[a3];
}

- (void)setRouterCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)fEDCountsCount
{
  return self->_fEDCounts.count;
}

- (unsigned)fEDCounts
{
  return self->_fEDCounts.list;
}

- (void)clearFEDCounts
{
}

- (void)addFEDCount:(unsigned int)a3
{
}

- (unsigned)fEDCountAtIndex:(unint64_t)a3
{
  p_fEDCounts = &self->_fEDCounts;
  unint64_t count = self->_fEDCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_fEDCounts->list[a3];
}

- (void)setFEDCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)sEDCountsCount
{
  return self->_sEDCounts.count;
}

- (unsigned)sEDCounts
{
  return self->_sEDCounts.list;
}

- (void)clearSEDCounts
{
}

- (void)addSEDCount:(unsigned int)a3
{
}

- (unsigned)sEDCountAtIndex:(unint64_t)a3
{
  p_sEDCounts = &self->_sEDCounts;
  unint64_t count = self->_sEDCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_sEDCounts->list[a3];
}

- (void)setSEDCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setMaxChangeinNodeCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_maxChangeinNodeCount = a3;
}

- (void)setHasMaxChangeinNodeCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxChangeinNodeCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPercTopologyChangeTimeInstances:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_percTopologyChangeTimeInstances = a3;
}

- (void)setHasPercTopologyChangeTimeInstances:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPercTopologyChangeTimeInstances
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDFlagstoneTopologyMetrics;
  char v3 = [(AWDFlagstoneTopologyMetrics *)&v7 description];
  v4 = [(AWDFlagstoneTopologyMetrics *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  header = self->_header;
  if (header)
  {
    v6 = [(AWDHeaderInfoS *)header dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"header"];
  }
  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"node_count"];

  v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"router_count"];

  v9 = PBRepeatedUInt32NSArray();
  [v3 setObject:v9 forKey:@"FED_count"];

  v10 = PBRepeatedUInt32NSArray();
  [v3 setObject:v10 forKey:@"SED_count"];

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = +[NSNumber numberWithUnsignedInt:self->_maxChangeinNodeCount];
    [v3 setObject:v12 forKey:@"maxChangeinNodeCount"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v13 = +[NSNumber numberWithUnsignedInt:self->_percTopologyChangeTimeInstances];
    [v3 setObject:v13 forKey:@"percTopologyChangeTimeInstances"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDFlagstoneTopologyMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v9;
  }
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }
  if (self->_nodeCounts.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v9;
      ++v5;
    }
    while (v5 < self->_nodeCounts.count);
  }
  if (self->_routerCounts.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v9;
      ++v6;
    }
    while (v6 < self->_routerCounts.count);
  }
  if (self->_fEDCounts.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v9;
      ++v7;
    }
    while (v7 < self->_fEDCounts.count);
  }
  if (self->_sEDCounts.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v9;
      ++v8;
    }
    while (v8 < self->_sEDCounts.count);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v9;
    if ((*(unsigned char *)&self->_has & 4) == 0)
    {
LABEL_19:
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v9;

LABEL_21:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[13] = self->_timestamp;
    *((unsigned char *)v4 + 128) |= 1u;
  }
  id v17 = v4;
  if (self->_header) {
    objc_msgSend(v4, "setHeader:");
  }
  if ([(AWDFlagstoneTopologyMetrics *)self nodeCountsCount])
  {
    [v17 clearNodeCounts];
    unint64_t v5 = [(AWDFlagstoneTopologyMetrics *)self nodeCountsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v17, "addNodeCount:", -[AWDFlagstoneTopologyMetrics nodeCountAtIndex:](self, "nodeCountAtIndex:", i));
    }
  }
  if ([(AWDFlagstoneTopologyMetrics *)self routerCountsCount])
  {
    [v17 clearRouterCounts];
    unint64_t v8 = [(AWDFlagstoneTopologyMetrics *)self routerCountsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v17, "addRouterCount:", -[AWDFlagstoneTopologyMetrics routerCountAtIndex:](self, "routerCountAtIndex:", j));
    }
  }
  if ([(AWDFlagstoneTopologyMetrics *)self fEDCountsCount])
  {
    [v17 clearFEDCounts];
    unint64_t v11 = [(AWDFlagstoneTopologyMetrics *)self fEDCountsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        objc_msgSend(v17, "addFEDCount:", -[AWDFlagstoneTopologyMetrics fEDCountAtIndex:](self, "fEDCountAtIndex:", k));
    }
  }
  if ([(AWDFlagstoneTopologyMetrics *)self sEDCountsCount])
  {
    [v17 clearSEDCounts];
    unint64_t v14 = [(AWDFlagstoneTopologyMetrics *)self sEDCountsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        objc_msgSend(v17, "addSEDCount:", -[AWDFlagstoneTopologyMetrics sEDCountAtIndex:](self, "sEDCountAtIndex:", m));
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v17 + 30) = self->_maxChangeinNodeCount;
    *((unsigned char *)v17 + 128) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0)
    {
LABEL_23:
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)v17 + 31) = self->_percTopologyChangeTimeInstances;
  *((unsigned char *)v17 + 128) |= 4u;

LABEL_25:
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[13] = self->_timestamp;
    *((unsigned char *)v5 + 128) |= 1u;
  }
  id v7 = [(AWDHeaderInfoS *)self->_header copyWithZone:a3];
  unint64_t v8 = (void *)v6[14];
  v6[14] = v7;

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 30) = self->_maxChangeinNodeCount;
    *((unsigned char *)v6 + 128) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    return v6;
  }
  *((_DWORD *)v6 + 31) = self->_percTopologyChangeTimeInstances;
  *((unsigned char *)v6 + 128) |= 4u;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 128) & 1) == 0 || self->_timestamp != *((void *)v4 + 13)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 128))
  {
LABEL_22:
    BOOL v6 = 0;
    goto LABEL_23;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 14) && !-[AWDHeaderInfoS isEqual:](header, "isEqual:")
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 2) == 0 || self->_maxChangeinNodeCount != *((_DWORD *)v4 + 30)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 2) != 0)
  {
    goto LABEL_22;
  }
  BOOL v6 = (*((unsigned char *)v4 + 128) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 4) == 0 || self->_percTopologyChangeTimeInstances != *((_DWORD *)v4 + 31)) {
      goto LABEL_22;
    }
    BOOL v6 = 1;
  }
LABEL_23:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(AWDHeaderInfoS *)self->_header hash];
  uint64_t v5 = PBRepeatedUInt32Hash();
  uint64_t v6 = PBRepeatedUInt32Hash();
  uint64_t v7 = PBRepeatedUInt32Hash();
  uint64_t v8 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v9 = 2654435761 * self->_maxChangeinNodeCount;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v10 = 2654435761 * self->_percTopologyChangeTimeInstances;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if (v4[16])
  {
    self->_timestamp = v4[13];
    *(unsigned char *)&self->_has |= 1u;
  }
  header = self->_header;
  uint64_t v7 = v5[14];
  id v20 = v5;
  if (header)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[AWDHeaderInfoS mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[AWDFlagstoneTopologyMetrics setHeader:](self, "setHeader:");
  }
  uint64_t v5 = v20;
LABEL_9:
  uint64_t v8 = (char *)[v5 nodeCountsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
      -[AWDFlagstoneTopologyMetrics addNodeCount:](self, "addNodeCount:", [v20 nodeCountAtIndex:i]);
  }
  unint64_t v11 = (char *)[v20 routerCountsCount];
  if (v11)
  {
    unint64_t v12 = v11;
    for (uint64_t j = 0; j != v12; ++j)
      -[AWDFlagstoneTopologyMetrics addRouterCount:](self, "addRouterCount:", [v20 routerCountAtIndex:j]);
  }
  unint64_t v14 = (char *)[v20 fEDCountsCount];
  if (v14)
  {
    unint64_t v15 = v14;
    for (uint64_t k = 0; k != v15; ++k)
      -[AWDFlagstoneTopologyMetrics addFEDCount:](self, "addFEDCount:", [v20 fEDCountAtIndex:k]);
  }
  id v17 = (char *)[v20 sEDCountsCount];
  if (v17)
  {
    v18 = v17;
    for (uint64_t m = 0; m != v18; ++m)
      -[AWDFlagstoneTopologyMetrics addSEDCount:](self, "addSEDCount:", [v20 sEDCountAtIndex:m]);
  }
  if ((*((unsigned char *)v20 + 128) & 2) != 0)
  {
    self->_maxChangeinNodeCount = *((_DWORD *)v20 + 30);
    *(unsigned char *)&self->_has |= 2u;
    if ((*((unsigned char *)v20 + 128) & 4) == 0)
    {
LABEL_23:
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v20 + 128) & 4) == 0)
  {
    goto LABEL_23;
  }
  self->_percTopologyChangeTimeInstances = *((_DWORD *)v20 + 31);
  *(unsigned char *)&self->_has |= 4u;

LABEL_25:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDHeaderInfoS)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (unsigned)maxChangeinNodeCount
{
  return self->_maxChangeinNodeCount;
}

- (unsigned)percTopologyChangeTimeInstances
{
  return self->_percTopologyChangeTimeInstances;
}

- (void).cxx_destruct
{
}

@end