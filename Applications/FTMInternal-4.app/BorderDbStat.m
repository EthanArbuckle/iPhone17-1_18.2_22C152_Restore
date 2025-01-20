@interface BorderDbStat
- (BOOL)hasFetchCnt;
- (BOOL)hasFetchCntApWakes;
- (BOOL)hasMaxLifeSecs;
- (BOOL)hasMinLifeSecs;
- (BOOL)hasTotalDbLifeSecs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)boundDurationSecsCount;
- (unint64_t)fetchStateDurationSecsCount;
- (unint64_t)hash;
- (unsigned)boundDurationSecs;
- (unsigned)boundDurationSecsAtIndex:(unint64_t)a3;
- (unsigned)fetchCnt;
- (unsigned)fetchCntApWakes;
- (unsigned)fetchStateDurationSecs;
- (unsigned)fetchStateDurationSecsAtIndex:(unint64_t)a3;
- (unsigned)maxLifeSecs;
- (unsigned)minLifeSecs;
- (unsigned)totalDbLifeSecs;
- (void)addBoundDurationSecs:(unsigned int)a3;
- (void)addFetchStateDurationSecs:(unsigned int)a3;
- (void)clearBoundDurationSecs;
- (void)clearFetchStateDurationSecs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBoundDurationSecs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setFetchCnt:(unsigned int)a3;
- (void)setFetchCntApWakes:(unsigned int)a3;
- (void)setFetchStateDurationSecs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasFetchCnt:(BOOL)a3;
- (void)setHasFetchCntApWakes:(BOOL)a3;
- (void)setHasMaxLifeSecs:(BOOL)a3;
- (void)setHasMinLifeSecs:(BOOL)a3;
- (void)setHasTotalDbLifeSecs:(BOOL)a3;
- (void)setMaxLifeSecs:(unsigned int)a3;
- (void)setMinLifeSecs:(unsigned int)a3;
- (void)setTotalDbLifeSecs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BorderDbStat

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)BorderDbStat;
  [(BorderDbStat *)&v3 dealloc];
}

- (void)setTotalDbLifeSecs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_totalDbLifeSecs = a3;
}

- (void)setHasTotalDbLifeSecs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTotalDbLifeSecs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMinLifeSecs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_minLifeSecs = a3;
}

- (void)setHasMinLifeSecs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinLifeSecs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMaxLifeSecs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_maxLifeSecs = a3;
}

- (void)setHasMaxLifeSecs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxLifeSecs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFetchCnt:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fetchCnt = a3;
}

- (void)setHasFetchCnt:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFetchCnt
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFetchCntApWakes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fetchCntApWakes = a3;
}

- (void)setHasFetchCntApWakes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFetchCntApWakes
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)fetchStateDurationSecsCount
{
  return self->_fetchStateDurationSecs.count;
}

- (unsigned)fetchStateDurationSecs
{
  return self->_fetchStateDurationSecs.list;
}

- (void)clearFetchStateDurationSecs
{
}

- (void)addFetchStateDurationSecs:(unsigned int)a3
{
}

- (unsigned)fetchStateDurationSecsAtIndex:(unint64_t)a3
{
  p_fetchStateDurationSecs = &self->_fetchStateDurationSecs;
  unint64_t count = self->_fetchStateDurationSecs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_fetchStateDurationSecs->list[a3];
}

- (void)setFetchStateDurationSecs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)boundDurationSecsCount
{
  return self->_boundDurationSecs.count;
}

- (unsigned)boundDurationSecs
{
  return self->_boundDurationSecs.list;
}

- (void)clearBoundDurationSecs
{
}

- (void)addBoundDurationSecs:(unsigned int)a3
{
}

- (unsigned)boundDurationSecsAtIndex:(unint64_t)a3
{
  p_boundDurationSecs = &self->_boundDurationSecs;
  unint64_t count = self->_boundDurationSecs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_boundDurationSecs->list[a3];
}

- (void)setBoundDurationSecs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BorderDbStat;
  char v3 = [(BorderDbStat *)&v7 description];
  v4 = [(BorderDbStat *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_totalDbLifeSecs];
    [v3 setObject:v9 forKey:@"total_db_life_secs"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v10 = +[NSNumber numberWithUnsignedInt:self->_minLifeSecs];
  [v3 setObject:v10 forKey:@"min_life_secs"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v11 = +[NSNumber numberWithUnsignedInt:self->_maxLifeSecs];
  [v3 setObject:v11 forKey:@"max_life_secs"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v12 = +[NSNumber numberWithUnsignedInt:self->_fetchCnt];
  [v3 setObject:v12 forKey:@"fetch_cnt"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    v5 = +[NSNumber numberWithUnsignedInt:self->_fetchCntApWakes];
    [v3 setObject:v5 forKey:@"fetch_cnt_ap_wakes"];
  }
LABEL_7:
  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"fetch_state_duration_secs"];

  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"bound_duration_secs"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000418E0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v9 = v4;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v9;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteUint32Field();
    id v4 = v9;
  }
LABEL_7:
  if (self->_fetchStateDurationSecs.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v9;
      ++v6;
    }
    while (v6 < self->_fetchStateDurationSecs.count);
  }
  p_boundDurationSecs = &self->_boundDurationSecs;
  if (p_boundDurationSecs->count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v9;
      ++v8;
    }
    while (v8 < p_boundDurationSecs->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[18] = self->_totalDbLifeSecs;
    *((unsigned char *)v4 + 76) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[17] = self->_minLifeSecs;
  *((unsigned char *)v4 + 76) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_21:
    v4[14] = self->_fetchCnt;
    *((unsigned char *)v4 + 76) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_20:
  v4[16] = self->_maxLifeSecs;
  *((unsigned char *)v4 + 76) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_21;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v4[15] = self->_fetchCntApWakes;
    *((unsigned char *)v4 + 76) |= 2u;
  }
LABEL_7:
  id v12 = v4;
  if ([(BorderDbStat *)self fetchStateDurationSecsCount])
  {
    [v12 clearFetchStateDurationSecs];
    unint64_t v6 = [(BorderDbStat *)self fetchStateDurationSecsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v12 addFetchStateDurationSecs:[self fetchStateDurationSecsAtIndex:i]];
    }
  }
  if ([(BorderDbStat *)self boundDurationSecsCount])
  {
    [v12 clearBoundDurationSecs];
    unint64_t v9 = [(BorderDbStat *)self boundDurationSecsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [v12 addBoundDurationSecs:[self boundDurationSecsAtIndex:j]];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = v4;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_totalDbLifeSecs;
    *((unsigned char *)v4 + 76) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 17) = self->_minLifeSecs;
  *((unsigned char *)v4 + 76) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *((_DWORD *)v4 + 14) = self->_fetchCnt;
    *((unsigned char *)v4 + 76) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *((_DWORD *)v4 + 16) = self->_maxLifeSecs;
  *((unsigned char *)v4 + 76) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 15) = self->_fetchCntApWakes;
    *((unsigned char *)v4 + 76) |= 2u;
  }
LABEL_7:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 0x10) == 0 || self->_totalDbLifeSecs != *((_DWORD *)v4 + 18)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 0x10) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 8) == 0 || self->_minLifeSecs != *((_DWORD *)v4 + 17)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0 || self->_maxLifeSecs != *((_DWORD *)v4 + 16)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_fetchCnt != *((_DWORD *)v4 + 14)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_fetchCntApWakes != *((_DWORD *)v4 + 15)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_29;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_29:
    char IsEqual = 0;
    goto LABEL_30;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_30:

  return IsEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v2 = 2654435761 * self->_totalDbLifeSecs;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_minLifeSecs;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_maxLifeSecs;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_fetchCnt;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_fetchCntApWakes;
LABEL_12:
  uint64_t v7 = v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ PBRepeatedUInt32Hash();
  return v7 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 76);
  if ((v5 & 0x10) != 0)
  {
    self->_totalDbLifeSecs = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 76);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_minLifeSecs = *((_DWORD *)v4 + 17);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 76);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_maxLifeSecs = *((_DWORD *)v4 + 16);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 76);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  self->_fetchCnt = *((_DWORD *)v4 + 14);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
LABEL_6:
    self->_fetchCntApWakes = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
  id v12 = v4;
  uint64_t v6 = (char *)[v4 fetchStateDurationSecsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[BorderDbStat addFetchStateDurationSecs:](self, "addFetchStateDurationSecs:", [v12 fetchStateDurationSecsAtIndex:i]);
  }
  unint64_t v9 = (char *)[v12 boundDurationSecsCount];
  if (v9)
  {
    unint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[BorderDbStat addBoundDurationSecs:](self, "addBoundDurationSecs:", [v12 boundDurationSecsAtIndex:j]);
  }
}

- (unsigned)totalDbLifeSecs
{
  return self->_totalDbLifeSecs;
}

- (unsigned)minLifeSecs
{
  return self->_minLifeSecs;
}

- (unsigned)maxLifeSecs
{
  return self->_maxLifeSecs;
}

- (unsigned)fetchCnt
{
  return self->_fetchCnt;
}

- (unsigned)fetchCntApWakes
{
  return self->_fetchCntApWakes;
}

@end