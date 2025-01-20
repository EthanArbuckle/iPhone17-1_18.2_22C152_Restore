@interface AWDCountersPowerS
- (BOOL)hasHostWakeupsCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)hostWakeupsCountHistogramsCount;
- (unsigned)hostWakeupsCount;
- (unsigned)hostWakeupsCountHistogramAtIndex:(unint64_t)a3;
- (unsigned)hostWakeupsCountHistograms;
- (void)addHostWakeupsCountHistogram:(unsigned int)a3;
- (void)clearHostWakeupsCountHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasHostWakeupsCount:(BOOL)a3;
- (void)setHostWakeupsCount:(unsigned int)a3;
- (void)setHostWakeupsCountHistograms:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDCountersPowerS

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDCountersPowerS;
  [(AWDCountersPowerS *)&v3 dealloc];
}

- (void)setHostWakeupsCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_hostWakeupsCount = a3;
}

- (void)setHasHostWakeupsCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHostWakeupsCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)hostWakeupsCountHistogramsCount
{
  return self->_hostWakeupsCountHistograms.count;
}

- (unsigned)hostWakeupsCountHistograms
{
  return self->_hostWakeupsCountHistograms.list;
}

- (void)clearHostWakeupsCountHistograms
{
}

- (void)addHostWakeupsCountHistogram:(unsigned int)a3
{
}

- (unsigned)hostWakeupsCountHistogramAtIndex:(unint64_t)a3
{
  p_hostWakeupsCountHistograms = &self->_hostWakeupsCountHistograms;
  unint64_t count = self->_hostWakeupsCountHistograms.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_hostWakeupsCountHistograms->list[a3];
}

- (void)setHostWakeupsCountHistograms:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDCountersPowerS;
  objc_super v3 = [(AWDCountersPowerS *)&v7 description];
  v4 = [(AWDCountersPowerS *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_hostWakeupsCount];
    [v3 setObject:v4 forKey:@"host_wakeups_count"];
  }
  v5 = PBRepeatedUInt32NSArray();
  [v3 setObject:v5 forKey:@"host_wakeups_count_histogram"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCountersPowerSReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
  p_hostWakeupsCountHistograms = &self->_hostWakeupsCountHistograms;
  if (p_hostWakeupsCountHistograms->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < p_hostWakeupsCountHistograms->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_hostWakeupsCount;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  id v8 = v4;
  if ([(AWDCountersPowerS *)self hostWakeupsCountHistogramsCount])
  {
    [v8 clearHostWakeupsCountHistograms];
    unint64_t v5 = [(AWDCountersPowerS *)self hostWakeupsCountHistogramsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v8, "addHostWakeupsCountHistogram:", -[AWDCountersPowerS hostWakeupsCountHistogramAtIndex:](self, "hostWakeupsCountHistogramAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_hostWakeupsCount;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_hostWakeupsCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_8;
    }
LABEL_7:
    char IsEqual = PBRepeatedUInt32IsEqual();

    return IsEqual;
  }
  if ((*((unsigned char *)v4 + 36) & 1) == 0) {
    goto LABEL_7;
  }
LABEL_8:

  return 0;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_hostWakeupsCount;
  }
  else {
    uint64_t v2 = 0;
  }
  return PBRepeatedUInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[9])
  {
    self->_hostWakeupsCount = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  id v8 = v4;
  unint64_t v5 = (char *)[v4 hostWakeupsCountHistogramsCount];
  if (v5)
  {
    unint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDCountersPowerS addHostWakeupsCountHistogram:](self, "addHostWakeupsCountHistogram:", [v8 hostWakeupsCountHistogramAtIndex:i]);
  }
}

- (unsigned)hostWakeupsCount
{
  return self->_hostWakeupsCount;
}

@end