@interface ReselFromDoCount
- (BOOL)ehrpd;
- (BOOL)hasEhrpd;
- (BOOL)hasTotal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)endStatusCountsCount;
- (unint64_t)hash;
- (unsigned)endStatusCountAtIndex:(unint64_t)a3;
- (unsigned)endStatusCounts;
- (unsigned)total;
- (void)addEndStatusCount:(unsigned int)a3;
- (void)clearEndStatusCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEhrpd:(BOOL)a3;
- (void)setEndStatusCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasEhrpd:(BOOL)a3;
- (void)setHasTotal:(BOOL)a3;
- (void)setTotal:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ReselFromDoCount

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)ReselFromDoCount;
  [(ReselFromDoCount *)&v3 dealloc];
}

- (void)setEhrpd:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_ehrpd = a3;
}

- (void)setHasEhrpd:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEhrpd
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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

- (unint64_t)endStatusCountsCount
{
  return self->_endStatusCounts.count;
}

- (unsigned)endStatusCounts
{
  return self->_endStatusCounts.list;
}

- (void)clearEndStatusCounts
{
}

- (void)addEndStatusCount:(unsigned int)a3
{
}

- (unsigned)endStatusCountAtIndex:(unint64_t)a3
{
  p_endStatusCounts = &self->_endStatusCounts;
  unint64_t count = self->_endStatusCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_endStatusCounts->list[a3];
}

- (void)setEndStatusCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ReselFromDoCount;
  char v3 = [(ReselFromDoCount *)&v7 description];
  v4 = [(ReselFromDoCount *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithBool:self->_ehrpd];
    [v3 setObject:v5 forKey:@"ehrpd"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_total];
    [v3 setObject:v6 forKey:@"total"];
  }
  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"end_status_count"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000E50B8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint32Field();
  }
  p_endStatusCounts = &self->_endStatusCounts;
  if (p_endStatusCounts->count)
  {
    PBDataWriterPlaceMark();
    if (p_endStatusCounts->count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < p_endStatusCounts->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[36] = self->_ehrpd;
    v4[40] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 8) = self->_total;
    v4[40] |= 1u;
  }
  id v9 = v4;
  if ([(ReselFromDoCount *)self endStatusCountsCount])
  {
    [v9 clearEndStatusCounts];
    unint64_t v6 = [(ReselFromDoCount *)self endStatusCountsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v9 addEndStatusCount:[self endStatusCountAtIndex:i]];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = v4;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 36) = self->_ehrpd;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 8) = self->_total;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) != 0)
    {
      if (self->_ehrpd)
      {
        if (!*((unsigned char *)v4 + 36)) {
          goto LABEL_16;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_10;
      }
    }
LABEL_16:
    char IsEqual = 0;
    goto LABEL_17;
  }
  if ((*((unsigned char *)v4 + 40) & 2) != 0) {
    goto LABEL_16;
  }
LABEL_10:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_total != *((_DWORD *)v4 + 8)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_16;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_17:

  return IsEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_ehrpd;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ PBRepeatedUInt32Hash();
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_total;
  return v3 ^ v2 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_ehrpd = *((unsigned char *)v4 + 36);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if (v5)
  {
    self->_total = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v9 = v4;
  unint64_t v6 = (char *)[v4 endStatusCountsCount];
  if (v6)
  {
    unint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[ReselFromDoCount addEndStatusCount:](self, "addEndStatusCount:", [v9 endStatusCountAtIndex:i]);
  }
}

- (BOOL)ehrpd
{
  return self->_ehrpd;
}

- (unsigned)total
{
  return self->_total;
}

@end