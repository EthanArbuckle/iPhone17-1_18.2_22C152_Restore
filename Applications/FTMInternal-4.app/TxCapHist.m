@interface TxCapHist
- (BOOL)hasBand;
- (BOOL)hasPowerCap10thDbm;
- (BOOL)hasProxState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)proxStateAsString:(int)a3;
- (int)StringAsProxState:(id)a3;
- (int)band;
- (int)powerCap10thDbm;
- (int)proxState;
- (unint64_t)hash;
- (unint64_t)pucchCountersCount;
- (unint64_t)puschCountersCount;
- (unsigned)pucchCounterAtIndex:(unint64_t)a3;
- (unsigned)pucchCounters;
- (unsigned)puschCounterAtIndex:(unint64_t)a3;
- (unsigned)puschCounters;
- (void)addPucchCounter:(unsigned int)a3;
- (void)addPuschCounter:(unsigned int)a3;
- (void)clearPucchCounters;
- (void)clearPuschCounters;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBand:(int)a3;
- (void)setHasBand:(BOOL)a3;
- (void)setHasPowerCap10thDbm:(BOOL)a3;
- (void)setHasProxState:(BOOL)a3;
- (void)setPowerCap10thDbm:(int)a3;
- (void)setProxState:(int)a3;
- (void)setPucchCounters:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPuschCounters:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation TxCapHist

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)TxCapHist;
  [(TxCapHist *)&v3 dealloc];
}

- (void)setBand:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBand
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)proxState
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_proxState;
  }
  else {
    return 0;
  }
}

- (void)setProxState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_proxState = a3;
}

- (void)setHasProxState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProxState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)proxStateAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1002876C8 + a3);
  }

  return v3;
}

- (int)StringAsProxState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INTERMIDIATE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PROX"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPowerCap10thDbm:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_powerCap10thDbm = a3;
}

- (void)setHasPowerCap10thDbm:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPowerCap10thDbm
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)pucchCountersCount
{
  return self->_pucchCounters.count;
}

- (unsigned)pucchCounters
{
  return self->_pucchCounters.list;
}

- (void)clearPucchCounters
{
}

- (void)addPucchCounter:(unsigned int)a3
{
}

- (unsigned)pucchCounterAtIndex:(unint64_t)a3
{
  p_pucchCounters = &self->_pucchCounters;
  unint64_t count = self->_pucchCounters.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_pucchCounters->list[a3];
}

- (void)setPucchCounters:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)puschCountersCount
{
  return self->_puschCounters.count;
}

- (unsigned)puschCounters
{
  return self->_puschCounters.list;
}

- (void)clearPuschCounters
{
}

- (void)addPuschCounter:(unsigned int)a3
{
}

- (unsigned)puschCounterAtIndex:(unint64_t)a3
{
  p_puschCounters = &self->_puschCounters;
  unint64_t count = self->_puschCounters.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_puschCounters->list[a3];
}

- (void)setPuschCounters:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TxCapHist;
  char v3 = [(TxCapHist *)&v7 description];
  int v4 = [(TxCapHist *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v9 = +[NSNumber numberWithInt:self->_band];
    [v3 setObject:v9 forKey:@"band"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  uint64_t proxState = self->_proxState;
  if (proxState >= 3)
  {
    v11 = +[NSString stringWithFormat:@"(unknown: %i)", self->_proxState];
  }
  else
  {
    v11 = *(&off_1002876C8 + proxState);
  }
  [v3 setObject:v11 forKey:@"prox_state"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  v5 = +[NSNumber numberWithInt:self->_powerCap10thDbm];
  [v3 setObject:v5 forKey:@"power_cap_10th_dbm"];

LABEL_5:
  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"pucch_counter"];

  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"pusch_counter"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10008D7DC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteSint32Field();
LABEL_5:
  if (self->_pucchCounters.count)
  {
    PBDataWriterPlaceMark();
    if (self->_pucchCounters.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_pucchCounters.count);
    }
    PBDataWriterRecallMark();
  }
  p_puschCounters = &self->_puschCounters;
  if (p_puschCounters->count)
  {
    PBDataWriterPlaceMark();
    if (p_puschCounters->count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < p_puschCounters->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_17:
    v4[16] = self->_proxState;
    *((unsigned char *)v4 + 68) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v4[14] = self->_band;
  *((unsigned char *)v4 + 68) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_17;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v4[15] = self->_powerCap10thDbm;
    *((unsigned char *)v4 + 68) |= 2u;
  }
LABEL_5:
  id v12 = v4;
  if ([(TxCapHist *)self pucchCountersCount])
  {
    [v12 clearPucchCounters];
    unint64_t v6 = [(TxCapHist *)self pucchCountersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v12 addPucchCounter:[self pucchCounterAtIndex:i]];
    }
  }
  if ([(TxCapHist *)self puschCountersCount])
  {
    [v12 clearPuschCounters];
    unint64_t v9 = [(TxCapHist *)self puschCountersCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [v12 addPuschCounter:[self puschCounterAtIndex:j]];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = v4;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v4 + 16) = self->_proxState;
    *((unsigned char *)v4 + 68) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v4 + 14) = self->_band;
  *((unsigned char *)v4 + 68) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 15) = self->_powerCap10thDbm;
    *((unsigned char *)v4 + 68) |= 2u;
  }
LABEL_5:
  PBRepeatedUInt32Copy();
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
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_band != *((_DWORD *)v4 + 14)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_proxState != *((_DWORD *)v4 + 16)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_powerCap10thDbm != *((_DWORD *)v4 + 15)) {
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
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_20:

  return IsEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    goto LABEL_8;
  }
  uint64_t v2 = 2654435761 * self->_band;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_proxState;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_powerCap10thDbm;
LABEL_8:
  uint64_t v5 = v3 ^ v2 ^ v4 ^ PBRepeatedUInt32Hash();
  return v5 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 68);
  if (v5)
  {
    self->_band = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 68);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t proxState = *((_DWORD *)v4 + 16);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
LABEL_4:
    self->_powerCap10thDbm = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  id v12 = v4;
  unint64_t v6 = (char *)[v4 pucchCountersCount];
  if (v6)
  {
    unint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[TxCapHist addPucchCounter:](self, "addPucchCounter:", [v12 pucchCounterAtIndex:i]);
  }
  unint64_t v9 = (char *)[v12 puschCountersCount];
  if (v9)
  {
    unint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[TxCapHist addPuschCounter:](self, "addPuschCounter:", [v12 puschCounterAtIndex:j]);
  }
}

- (int)band
{
  return self->_band;
}

- (int)powerCap10thDbm
{
  return self->_powerCap10thDbm;
}

@end