@interface ReFromEutranCount
- (BOOL)hasDestRat;
- (BOOL)hasTotal;
- (BOOL)hasTotalAp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)destRatAsString:(int)a3;
- (id)dictionaryRepresentation;
- (int)StringAsDestRat:(id)a3;
- (int)destRat;
- (unint64_t)causeCountApsCount;
- (unint64_t)causeCountsCount;
- (unint64_t)hash;
- (unsigned)causeCountApAtIndex:(unint64_t)a3;
- (unsigned)causeCountAps;
- (unsigned)causeCountAtIndex:(unint64_t)a3;
- (unsigned)causeCounts;
- (unsigned)total;
- (unsigned)totalAp;
- (void)addCauseCount:(unsigned int)a3;
- (void)addCauseCountAp:(unsigned int)a3;
- (void)clearCauseCountAps;
- (void)clearCauseCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCauseCountAps:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCauseCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDestRat:(int)a3;
- (void)setHasDestRat:(BOOL)a3;
- (void)setHasTotal:(BOOL)a3;
- (void)setHasTotalAp:(BOOL)a3;
- (void)setTotal:(unsigned int)a3;
- (void)setTotalAp:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ReFromEutranCount

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)ReFromEutranCount;
  [(ReFromEutranCount *)&v3 dealloc];
}

- (int)destRat
{
  if (*(unsigned char *)&self->_has) {
    return self->_destRat;
  }
  else {
    return 0;
  }
}

- (void)setDestRat:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_destRat = a3;
}

- (void)setHasDestRat:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDestRat
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)destRatAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_super v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    objc_super v3 = *(&off_100287768 + a3);
  }

  return v3;
}

- (int)StringAsDestRat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LTE_LOG_RAT_CDMA_HRPD"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LTE_LOG_RAT_CDMA_1X"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LTE_LOG_RAT_GSM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LTE_LOG_RAT_WCDMA"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LTE_LOG_RAT_LTE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LTE_LOG_RAT_TDS"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setTotal:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_total = a3;
}

- (void)setHasTotal:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotal
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)causeCountsCount
{
  return self->_causeCounts.count;
}

- (unsigned)causeCounts
{
  return self->_causeCounts.list;
}

- (void)clearCauseCounts
{
}

- (void)addCauseCount:(unsigned int)a3
{
}

- (unsigned)causeCountAtIndex:(unint64_t)a3
{
  p_causeCounts = &self->_causeCounts;
  unint64_t count = self->_causeCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_causeCounts->list[a3];
}

- (void)setCauseCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setTotalAp:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_totalAp = a3;
}

- (void)setHasTotalAp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalAp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (unint64_t)causeCountApsCount
{
  return self->_causeCountAps.count;
}

- (unsigned)causeCountAps
{
  return self->_causeCountAps.list;
}

- (void)clearCauseCountAps
{
}

- (void)addCauseCountAp:(unsigned int)a3
{
}

- (unsigned)causeCountApAtIndex:(unint64_t)a3
{
  p_causeCountAps = &self->_causeCountAps;
  unint64_t count = self->_causeCountAps.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_causeCountAps->list[a3];
}

- (void)setCauseCountAps:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ReFromEutranCount;
  char v3 = [(ReFromEutranCount *)&v7 description];
  int v4 = [(ReFromEutranCount *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t destRat = self->_destRat;
    if (destRat >= 6)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_destRat];
    }
    else
    {
      v6 = *(&off_100287768 + destRat);
    }
    [v3 setObject:v6 forKey:@"dest_rat"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_total];
    [v3 setObject:v7 forKey:@"total"];
  }
  v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"cause_count"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_totalAp];
    [v3 setObject:v9 forKey:@"total_ap"];
  }
  v10 = PBRepeatedUInt32NSArray();
  [v3 setObject:v10 forKey:@"cause_count_ap"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000986C0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_causeCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_causeCounts.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_causeCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  p_causeCountAps = &self->_causeCountAps;
  if (p_causeCountAps->count)
  {
    PBDataWriterPlaceMark();
    if (p_causeCountAps->count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < p_causeCountAps->count);
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
    v4[14] = self->_destRat;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[15] = self->_total;
    *((unsigned char *)v4 + 68) |= 2u;
  }
  id v12 = v4;
  if ([(ReFromEutranCount *)self causeCountsCount])
  {
    [v12 clearCauseCounts];
    unint64_t v6 = [(ReFromEutranCount *)self causeCountsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v12 addCauseCount:[self causeCountAtIndex:i]];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v12 + 16) = self->_totalAp;
    *((unsigned char *)v12 + 68) |= 4u;
  }
  if ([(ReFromEutranCount *)self causeCountApsCount])
  {
    [v12 clearCauseCountAps];
    unint64_t v9 = [(ReFromEutranCount *)self causeCountApsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [v12 addCauseCountAp:[self causeCountApAtIndex:j]];
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
    v4[14] = self->_destRat;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[15] = self->_total;
    *((unsigned char *)v4 + 68) |= 2u;
  }
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[16] = self->_totalAp;
    *((unsigned char *)v5 + 68) |= 4u;
  }
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_destRat != *((_DWORD *)v4 + 14)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_total != *((_DWORD *)v4 + 15)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_19;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_19:
    char IsEqual = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_totalAp != *((_DWORD *)v4 + 16)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_19;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_20:

  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_destRat;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_total;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_totalAp;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 68);
  if (v5)
  {
    self->_uint64_t destRat = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 68);
  }
  if ((v5 & 2) != 0)
  {
    self->_total = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v12 = (unsigned int *)v4;
  uint64_t v6 = (char *)[v4 causeCountsCount];
  if (v6)
  {
    unint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[ReFromEutranCount addCauseCount:](self, "addCauseCount:", [v12 causeCountAtIndex:i]);
  }
  if ((v12[17] & 4) != 0)
  {
    self->_totalAp = v12[16];
    *(unsigned char *)&self->_has |= 4u;
  }
  unint64_t v9 = (char *)[v12 causeCountApsCount];
  if (v9)
  {
    unint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[ReFromEutranCount addCauseCountAp:](self, "addCauseCountAp:", [v12 causeCountApAtIndex:j]);
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