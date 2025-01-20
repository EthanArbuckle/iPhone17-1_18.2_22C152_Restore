@interface RedirFromUtranCount
- (BOOL)hasRedirCause;
- (BOOL)hasTotal;
- (BOOL)hasTotalAp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)redirCauseAsString:(int)a3;
- (int)StringAsRedirCause:(id)a3;
- (int)redirCause;
- (unint64_t)endStatusCountApsCount;
- (unint64_t)endStatusCountsCount;
- (unint64_t)hash;
- (unsigned)endStatusCountApAtIndex:(unint64_t)a3;
- (unsigned)endStatusCountAps;
- (unsigned)endStatusCountAtIndex:(unint64_t)a3;
- (unsigned)endStatusCounts;
- (unsigned)total;
- (unsigned)totalAp;
- (void)addEndStatusCount:(unsigned int)a3;
- (void)addEndStatusCountAp:(unsigned int)a3;
- (void)clearEndStatusCountAps;
- (void)clearEndStatusCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEndStatusCountAps:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setEndStatusCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasRedirCause:(BOOL)a3;
- (void)setHasTotal:(BOOL)a3;
- (void)setHasTotalAp:(BOOL)a3;
- (void)setRedirCause:(int)a3;
- (void)setTotal:(unsigned int)a3;
- (void)setTotalAp:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RedirFromUtranCount

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)RedirFromUtranCount;
  [(RedirFromUtranCount *)&v3 dealloc];
}

- (int)redirCause
{
  if (*(unsigned char *)&self->_has) {
    return self->_redirCause;
  }
  else {
    return 0;
  }
}

- (void)setRedirCause:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_redirCause = a3;
}

- (void)setHasRedirCause:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRedirCause
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)redirCauseAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_super v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    objc_super v3 = off_100288660[a3];
  }

  return v3;
}

- (int)StringAsRedirCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"WTOL_REDIR_CAUSE_CONN_RELEASE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WTOL_REDIR_CAUSE_CONN_REJECT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WTOL_REDIR_CAUSE_NONE"])
  {
    int v4 = 2;
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

- (unint64_t)endStatusCountApsCount
{
  return self->_endStatusCountAps.count;
}

- (unsigned)endStatusCountAps
{
  return self->_endStatusCountAps.list;
}

- (void)clearEndStatusCountAps
{
}

- (void)addEndStatusCountAp:(unsigned int)a3
{
}

- (unsigned)endStatusCountApAtIndex:(unint64_t)a3
{
  p_endStatusCountAps = &self->_endStatusCountAps;
  unint64_t count = self->_endStatusCountAps.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_endStatusCountAps->list[a3];
}

- (void)setEndStatusCountAps:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)RedirFromUtranCount;
  char v3 = [(RedirFromUtranCount *)&v7 description];
  int v4 = [(RedirFromUtranCount *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t redirCause = self->_redirCause;
    if (redirCause >= 3)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_redirCause];
    }
    else
    {
      v6 = off_100288660[redirCause];
    }
    [v3 setObject:v6 forKey:@"redir_cause"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_total];
    [v3 setObject:v7 forKey:@"total"];
  }
  v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"end_status_count"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_totalAp];
    [v3 setObject:v9 forKey:@"total_ap"];
  }
  v10 = PBRepeatedUInt32NSArray();
  [v3 setObject:v10 forKey:@"end_status_count_ap"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100148668((uint64_t)self, (uint64_t)a3);
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
  if (self->_endStatusCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_endStatusCounts.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_endStatusCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  p_endStatusCountAps = &self->_endStatusCountAps;
  if (p_endStatusCountAps->count)
  {
    PBDataWriterPlaceMark();
    if (p_endStatusCountAps->count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < p_endStatusCountAps->count);
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
    v4[14] = self->_redirCause;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[15] = self->_total;
    *((unsigned char *)v4 + 68) |= 2u;
  }
  id v12 = v4;
  if ([(RedirFromUtranCount *)self endStatusCountsCount])
  {
    [v12 clearEndStatusCounts];
    unint64_t v6 = [(RedirFromUtranCount *)self endStatusCountsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v12 addEndStatusCount:[self endStatusCountAtIndex:i]];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v12 + 16) = self->_totalAp;
    *((unsigned char *)v12 + 68) |= 4u;
  }
  if ([(RedirFromUtranCount *)self endStatusCountApsCount])
  {
    [v12 clearEndStatusCountAps];
    unint64_t v9 = [(RedirFromUtranCount *)self endStatusCountApsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [v12 addEndStatusCountAp:[self endStatusCountApAtIndex:j]];
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
    v4[14] = self->_redirCause;
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
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_redirCause != *((_DWORD *)v4 + 14)) {
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
    uint64_t v3 = 2654435761 * self->_redirCause;
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
    self->_uint64_t redirCause = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 68);
  }
  if ((v5 & 2) != 0)
  {
    self->_total = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v12 = (unsigned int *)v4;
  uint64_t v6 = (char *)[v4 endStatusCountsCount];
  if (v6)
  {
    unint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[RedirFromUtranCount addEndStatusCount:](self, "addEndStatusCount:", [v12 endStatusCountAtIndex:i]);
  }
  if ((v12[17] & 4) != 0)
  {
    self->_totalAp = v12[16];
    *(unsigned char *)&self->_has |= 4u;
  }
  unint64_t v9 = (char *)[v12 endStatusCountApsCount];
  if (v9)
  {
    unint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[RedirFromUtranCount addEndStatusCountAp:](self, "addEndStatusCountAp:", [v12 endStatusCountApAtIndex:j]);
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