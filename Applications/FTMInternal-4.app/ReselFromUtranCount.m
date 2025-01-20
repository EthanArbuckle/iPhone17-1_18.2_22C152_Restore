@interface ReselFromUtranCount
- (BOOL)hasTotal;
- (BOOL)hasTotalAp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)failureCountApsCount;
- (unint64_t)failureCountsCount;
- (unint64_t)hash;
- (unsigned)failureCountApAtIndex:(unint64_t)a3;
- (unsigned)failureCountAps;
- (unsigned)failureCountAtIndex:(unint64_t)a3;
- (unsigned)failureCounts;
- (unsigned)total;
- (unsigned)totalAp;
- (void)addFailureCount:(unsigned int)a3;
- (void)addFailureCountAp:(unsigned int)a3;
- (void)clearFailureCountAps;
- (void)clearFailureCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFailureCountAps:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setFailureCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasTotal:(BOOL)a3;
- (void)setHasTotalAp:(BOOL)a3;
- (void)setTotal:(unsigned int)a3;
- (void)setTotalAp:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ReselFromUtranCount

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)ReselFromUtranCount;
  [(ReselFromUtranCount *)&v3 dealloc];
}

- (void)setTotal:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_total = a3;
}

- (void)setHasTotal:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTotal
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)failureCountsCount
{
  return self->_failureCounts.count;
}

- (unsigned)failureCounts
{
  return self->_failureCounts.list;
}

- (void)clearFailureCounts
{
}

- (void)addFailureCount:(unsigned int)a3
{
}

- (unsigned)failureCountAtIndex:(unint64_t)a3
{
  p_failureCounts = &self->_failureCounts;
  unint64_t count = self->_failureCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_failureCounts->list[a3];
}

- (void)setFailureCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setTotalAp:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_totalAp = a3;
}

- (void)setHasTotalAp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalAp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)failureCountApsCount
{
  return self->_failureCountAps.count;
}

- (unsigned)failureCountAps
{
  return self->_failureCountAps.list;
}

- (void)clearFailureCountAps
{
}

- (void)addFailureCountAp:(unsigned int)a3
{
}

- (unsigned)failureCountApAtIndex:(unint64_t)a3
{
  p_failureCountAps = &self->_failureCountAps;
  unint64_t count = self->_failureCountAps.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_failureCountAps->list[a3];
}

- (void)setFailureCountAps:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ReselFromUtranCount;
  char v3 = [(ReselFromUtranCount *)&v7 description];
  v4 = [(ReselFromUtranCount *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_total];
    [v3 setObject:v4 forKey:@"total"];
  }
  v5 = PBRepeatedUInt32NSArray();
  [v3 setObject:v5 forKey:@"failure_count"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_totalAp];
    [v3 setObject:v6 forKey:@"total_ap"];
  }
  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"failure_count_ap"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003ADC4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_failureCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_failureCounts.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v5;
      }
      while (v5 < self->_failureCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  p_failureCountAps = &self->_failureCountAps;
  if (p_failureCountAps->count)
  {
    PBDataWriterPlaceMark();
    if (p_failureCountAps->count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < p_failureCountAps->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[14] = self->_total;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  id v11 = v4;
  if ([(ReselFromUtranCount *)self failureCountsCount])
  {
    [v11 clearFailureCounts];
    unint64_t v5 = [(ReselFromUtranCount *)self failureCountsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [v11 addFailureCount:[self failureCountAtIndex:i]];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v11 + 15) = self->_totalAp;
    *((unsigned char *)v11 + 64) |= 2u;
  }
  if ([(ReselFromUtranCount *)self failureCountApsCount])
  {
    [v11 clearFailureCountAps];
    unint64_t v8 = [(ReselFromUtranCount *)self failureCountApsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [v11 addFailureCountAp:[self failureCountApAtIndex:j]];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    v4[14] = self->_total;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[15] = self->_totalAp;
    *((unsigned char *)v5 + 64) |= 2u;
  }
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_total != *((_DWORD *)v4 + 14)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_14;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_14:
    char IsEqual = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_totalAp != *((_DWORD *)v4 + 15)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_14;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_15:

  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_total;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_totalAp;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  if (v4[16])
  {
    self->_total = v4[14];
    *(unsigned char *)&self->_has |= 1u;
  }
  id v11 = v4;
  uint64_t v5 = (char *)[v4 failureCountsCount];
  if (v5)
  {
    unint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[ReselFromUtranCount addFailureCount:](self, "addFailureCount:", [v11 failureCountAtIndex:i]);
  }
  if ((v11[16] & 2) != 0)
  {
    self->_totalAp = v11[15];
    *(unsigned char *)&self->_has |= 2u;
  }
  unint64_t v8 = (char *)[v11 failureCountApsCount];
  if (v8)
  {
    unint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[ReselFromUtranCount addFailureCountAp:](self, "addFailureCountAp:", [v11 failureCountApAtIndex:j]);
  }
}

- (unsigned)total
{
  return self->_total;
}

- (unsigned)totalAp
{
  return self->_totalAp;
}

@end