@interface AWDCountersDiscoveryJoinS
- (AWDCountersJoinerS)sCntrsJoiner;
- (BOOL)hasSCntrsJoiner;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)accessoryNodesCountHistogramsCount;
- (unint64_t)hash;
- (unsigned)accessoryNodesCountHistogramAtIndex:(unint64_t)a3;
- (unsigned)accessoryNodesCountHistograms;
- (void)addAccessoryNodesCountHistogram:(unsigned int)a3;
- (void)clearAccessoryNodesCountHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryNodesCountHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSCntrsJoiner:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersDiscoveryJoinS

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDCountersDiscoveryJoinS;
  [(AWDCountersDiscoveryJoinS *)&v3 dealloc];
}

- (unint64_t)accessoryNodesCountHistogramsCount
{
  return self->_accessoryNodesCountHistograms.count;
}

- (unsigned)accessoryNodesCountHistograms
{
  return self->_accessoryNodesCountHistograms.list;
}

- (void)clearAccessoryNodesCountHistograms
{
}

- (void)addAccessoryNodesCountHistogram:(unsigned int)a3
{
}

- (unsigned)accessoryNodesCountHistogramAtIndex:(unint64_t)a3
{
  p_accessoryNodesCountHistograms = &self->_accessoryNodesCountHistograms;
  unint64_t count = self->_accessoryNodesCountHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_accessoryNodesCountHistograms->list[a3];
}

- (void)setAccessoryNodesCountHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasSCntrsJoiner
{
  return self->_sCntrsJoiner != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCountersDiscoveryJoinS;
  objc_super v3 = [(AWDCountersDiscoveryJoinS *)&v7 description];
  v4 = [(AWDCountersDiscoveryJoinS *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = +[NSMutableDictionary dictionary];
  v4 = PBRepeatedUInt32NSArray();
  [v3 setObject:v4 forKey:@"accessory_nodes_count_histogram"];

  sCntrsJoiner = self->_sCntrsJoiner;
  if (sCntrsJoiner)
  {
    v6 = [(AWDCountersJoinerS *)sCntrsJoiner dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"s_cntrs_joiner"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCountersDiscoveryJoinSReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_accessoryNodesCountHistograms.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_accessoryNodesCountHistograms.count);
  }
  if (self->_sCntrsJoiner)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if ([(AWDCountersDiscoveryJoinS *)self accessoryNodesCountHistogramsCount])
  {
    [v7 clearAccessoryNodesCountHistograms];
    unint64_t v4 = [(AWDCountersDiscoveryJoinS *)self accessoryNodesCountHistogramsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addAccessoryNodesCountHistogram:", -[AWDCountersDiscoveryJoinS accessoryNodesCountHistogramAtIndex:](self, "accessoryNodesCountHistogramAtIndex:", i));
    }
  }
  if (self->_sCntrsJoiner) {
    objc_msgSend(v7, "setSCntrsJoiner:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  id v6 = [(AWDCountersJoinerS *)self->_sCntrsJoiner copyWithZone:a3];
  id v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && PBRepeatedUInt32IsEqual())
  {
    sCntrsJoiner = self->_sCntrsJoiner;
    if ((unint64_t)sCntrsJoiner | v4[4])
    {
      unsigned __int8 v7 = -[AWDCountersJoinerS isEqual:](sCntrsJoiner, "isEqual:");

      return v7;
    }
    else
    {

      return 1;
    }
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedUInt32Hash();
  return [(AWDCountersJoinerS *)self->_sCntrsJoiner hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  v10 = a3;
  unint64_t v4 = (char *)[v10 accessoryNodesCountHistogramsCount];
  if (v4)
  {
    unint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[AWDCountersDiscoveryJoinS addAccessoryNodesCountHistogram:](self, "addAccessoryNodesCountHistogram:", [v10 accessoryNodesCountHistogramAtIndex:i]);
  }
  sCntrsJoiner = self->_sCntrsJoiner;
  v8 = v10;
  uint64_t v9 = v10[4];
  if (sCntrsJoiner)
  {
    if (!v9) {
      goto LABEL_10;
    }
    -[AWDCountersJoinerS mergeFrom:](sCntrsJoiner, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_10;
    }
    -[AWDCountersDiscoveryJoinS setSCntrsJoiner:](self, "setSCntrsJoiner:");
  }
  v8 = v10;
LABEL_10:
}

- (AWDCountersJoinerS)sCntrsJoiner
{
  return self->_sCntrsJoiner;
}

- (void)setSCntrsJoiner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end