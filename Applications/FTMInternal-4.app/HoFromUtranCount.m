@interface HoFromUtranCount
- (BOOL)hasStartCount;
- (BOOL)hasSuccessCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)failureCountsCount;
- (unint64_t)hash;
- (unsigned)failureCountAtIndex:(unint64_t)a3;
- (unsigned)failureCounts;
- (unsigned)startCount;
- (unsigned)successCount;
- (void)addFailureCount:(unsigned int)a3;
- (void)clearFailureCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFailureCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasStartCount:(BOOL)a3;
- (void)setHasSuccessCount:(BOOL)a3;
- (void)setStartCount:(unsigned int)a3;
- (void)setSuccessCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HoFromUtranCount

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)HoFromUtranCount;
  [(HoFromUtranCount *)&v3 dealloc];
}

- (void)setStartCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_startCount = a3;
}

- (void)setHasStartCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSuccessCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_successCount = a3;
}

- (void)setHasSuccessCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuccessCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)HoFromUtranCount;
  char v3 = [(HoFromUtranCount *)&v7 description];
  v4 = [(HoFromUtranCount *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_startCount];
    [v3 setObject:v5 forKey:@"start_count"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_successCount];
    [v3 setObject:v6 forKey:@"success_count"];
  }
  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"failure_count"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10010D350((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  p_failureCounts = &self->_failureCounts;
  if (p_failureCounts->count)
  {
    PBDataWriterPlaceMark();
    if (p_failureCounts->count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < p_failureCounts->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[8] = self->_startCount;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[9] = self->_successCount;
    *((unsigned char *)v4 + 40) |= 2u;
  }
  id v9 = v4;
  if ([(HoFromUtranCount *)self failureCountsCount])
  {
    [v9 clearFailureCounts];
    unint64_t v6 = [(HoFromUtranCount *)self failureCountsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v9 addFailureCount:[self failureCountAtIndex:i]];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = v4;
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 8) = self->_startCount;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_successCount;
    *((unsigned char *)v4 + 40) |= 2u;
  }
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_startCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char IsEqual = 0;
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_successCount != *((_DWORD *)v4 + 9)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_13;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_14:

  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_startCount;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ PBRepeatedUInt32Hash();
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_successCount;
  return v3 ^ v2 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_startCount = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_successCount = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v9 = v4;
  unint64_t v6 = (char *)[v4 failureCountsCount];
  if (v6)
  {
    unint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[HoFromUtranCount addFailureCount:](self, "addFailureCount:", [v9 failureCountAtIndex:i]);
  }
}

- (unsigned)startCount
{
  return self->_startCount;
}

- (unsigned)successCount
{
  return self->_successCount;
}

@end