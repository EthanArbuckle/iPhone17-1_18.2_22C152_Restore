@interface HoFromEutranCount
- (BOOL)hasHoProc;
- (BOOL)hasStartCount;
- (BOOL)hasStartCountAp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hoProcAsString:(int)a3;
- (int)StringAsHoProc:(id)a3;
- (int)hoProc;
- (unint64_t)failureCountApsCount;
- (unint64_t)failureCountsCount;
- (unint64_t)hash;
- (unsigned)failureCountApAtIndex:(unint64_t)a3;
- (unsigned)failureCountAps;
- (unsigned)failureCountAtIndex:(unint64_t)a3;
- (unsigned)failureCounts;
- (unsigned)startCount;
- (unsigned)startCountAp;
- (void)addFailureCount:(unsigned int)a3;
- (void)addFailureCountAp:(unsigned int)a3;
- (void)clearFailureCountAps;
- (void)clearFailureCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFailureCountAps:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setFailureCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasHoProc:(BOOL)a3;
- (void)setHasStartCount:(BOOL)a3;
- (void)setHasStartCountAp:(BOOL)a3;
- (void)setHoProc:(int)a3;
- (void)setStartCount:(unsigned int)a3;
- (void)setStartCountAp:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HoFromEutranCount

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)HoFromEutranCount;
  [(HoFromEutranCount *)&v3 dealloc];
}

- (int)hoProc
{
  if (*(unsigned char *)&self->_has) {
    return self->_hoProc;
  }
  else {
    return 0;
  }
}

- (void)setHoProc:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_hoProc = a3;
}

- (void)setHasHoProc:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHoProc
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)hoProcAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_super v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    objc_super v3 = off_100288558[a3];
  }

  return v3;
}

- (int)StringAsHoProc:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LTE_HO_FROM_EUTRAN_PROC_UTRA_HO"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LTE_HO_FROM_EUTRAN_PROC_GERAN_HO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LTE_HO_FROM_EUTRAN_PROC_GERAN_CCO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LTE_HO_FROM_EUTRAN_PROC_E1XCSFB"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LTE_HO_FROM_EUTRAN_PROC_HRPD_HO"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setStartCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_startCount = a3;
}

- (void)setHasStartCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartCount
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

- (void)setStartCountAp:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_startCountAp = a3;
}

- (void)setHasStartCountAp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartCountAp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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
  v7.super_class = (Class)HoFromEutranCount;
  char v3 = [(HoFromEutranCount *)&v7 description];
  int v4 = [(HoFromEutranCount *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t hoProc = self->_hoProc;
    if (hoProc >= 5)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_hoProc];
    }
    else
    {
      v6 = off_100288558[hoProc];
    }
    [v3 setObject:v6 forKey:@"ho_proc"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_startCount];
    [v3 setObject:v7 forKey:@"start_count"];
  }
  v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"failure_count"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_startCountAp];
    [v3 setObject:v9 forKey:@"start_count_ap"];
  }
  v10 = PBRepeatedUInt32NSArray();
  [v3 setObject:v10 forKey:@"failure_count_ap"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10012FCC8((uint64_t)self, (uint64_t)a3);
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
  if (self->_failureCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_failureCounts.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_failureCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  p_failureCountAps = &self->_failureCountAps;
  if (p_failureCountAps->count)
  {
    PBDataWriterPlaceMark();
    if (p_failureCountAps->count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < p_failureCountAps->count);
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
    v4[14] = self->_hoProc;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[15] = self->_startCount;
    *((unsigned char *)v4 + 68) |= 2u;
  }
  id v12 = v4;
  if ([(HoFromEutranCount *)self failureCountsCount])
  {
    [v12 clearFailureCounts];
    unint64_t v6 = [(HoFromEutranCount *)self failureCountsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v12 addFailureCount:[self failureCountAtIndex:i]];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v12 + 16) = self->_startCountAp;
    *((unsigned char *)v12 + 68) |= 4u;
  }
  if ([(HoFromEutranCount *)self failureCountApsCount])
  {
    [v12 clearFailureCountAps];
    unint64_t v9 = [(HoFromEutranCount *)self failureCountApsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [v12 addFailureCountAp:[self failureCountApAtIndex:j]];
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
    v4[14] = self->_hoProc;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[15] = self->_startCount;
    *((unsigned char *)v4 + 68) |= 2u;
  }
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[16] = self->_startCountAp;
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
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_hoProc != *((_DWORD *)v4 + 14)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_startCount != *((_DWORD *)v4 + 15)) {
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
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_startCountAp != *((_DWORD *)v4 + 16)) {
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
    uint64_t v3 = 2654435761 * self->_hoProc;
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
      uint64_t v4 = 2654435761 * self->_startCount;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_startCountAp;
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
    self->_uint64_t hoProc = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 68);
  }
  if ((v5 & 2) != 0)
  {
    self->_startCount = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v12 = (unsigned int *)v4;
  uint64_t v6 = (char *)[v4 failureCountsCount];
  if (v6)
  {
    unint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[HoFromEutranCount addFailureCount:](self, "addFailureCount:", [v12 failureCountAtIndex:i]);
  }
  if ((v12[17] & 4) != 0)
  {
    self->_startCountAp = v12[16];
    *(unsigned char *)&self->_has |= 4u;
  }
  unint64_t v9 = (char *)[v12 failureCountApsCount];
  if (v9)
  {
    unint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[HoFromEutranCount addFailureCountAp:](self, "addFailureCountAp:", [v12 failureCountApAtIndex:j]);
  }
}

- (unsigned)startCount
{
  return self->_startCount;
}

- (unsigned)startCountAp
{
  return self->_startCountAp;
}

@end