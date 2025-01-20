@interface CellMetric
- (BOOL)hasElapsedMs;
- (BOOL)hasWakeupMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)sfScheduledByStatesCount;
- (unint64_t)sfScheduledByTypesCount;
- (unint64_t)sizeTbTotalByStateAtIndex:(unint64_t)a3;
- (unint64_t)sizeTbTotalByStates;
- (unint64_t)sizeTbTotalByStatesCount;
- (unint64_t)sizeTbTotalByTypeAtIndex:(unint64_t)a3;
- (unint64_t)sizeTbTotalByTypes;
- (unint64_t)sizeTbTotalByTypesCount;
- (unint64_t)ulSfScheduledByStatesCount;
- (unint64_t)ulSfScheduledByTypesCount;
- (unint64_t)ulSizeTbTotalByStateAtIndex:(unint64_t)a3;
- (unint64_t)ulSizeTbTotalByStates;
- (unint64_t)ulSizeTbTotalByStatesCount;
- (unint64_t)ulSizeTbTotalByTypeAtIndex:(unint64_t)a3;
- (unint64_t)ulSizeTbTotalByTypes;
- (unint64_t)ulSizeTbTotalByTypesCount;
- (unsigned)elapsedMs;
- (unsigned)sfScheduledByStateAtIndex:(unint64_t)a3;
- (unsigned)sfScheduledByStates;
- (unsigned)sfScheduledByTypeAtIndex:(unint64_t)a3;
- (unsigned)sfScheduledByTypes;
- (unsigned)ulSfScheduledByStateAtIndex:(unint64_t)a3;
- (unsigned)ulSfScheduledByStates;
- (unsigned)ulSfScheduledByTypeAtIndex:(unint64_t)a3;
- (unsigned)ulSfScheduledByTypes;
- (unsigned)wakeupMs;
- (void)addSfScheduledByState:(unsigned int)a3;
- (void)addSfScheduledByType:(unsigned int)a3;
- (void)addSizeTbTotalByState:(unint64_t)a3;
- (void)addSizeTbTotalByType:(unint64_t)a3;
- (void)addUlSfScheduledByState:(unsigned int)a3;
- (void)addUlSfScheduledByType:(unsigned int)a3;
- (void)addUlSizeTbTotalByState:(unint64_t)a3;
- (void)addUlSizeTbTotalByType:(unint64_t)a3;
- (void)clearSfScheduledByStates;
- (void)clearSfScheduledByTypes;
- (void)clearSizeTbTotalByStates;
- (void)clearSizeTbTotalByTypes;
- (void)clearUlSfScheduledByStates;
- (void)clearUlSfScheduledByTypes;
- (void)clearUlSizeTbTotalByStates;
- (void)clearUlSizeTbTotalByTypes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setElapsedMs:(unsigned int)a3;
- (void)setHasElapsedMs:(BOOL)a3;
- (void)setHasWakeupMs:(BOOL)a3;
- (void)setSfScheduledByStates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSfScheduledByTypes:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSizeTbTotalByStates:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setSizeTbTotalByTypes:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setUlSfScheduledByStates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setUlSfScheduledByTypes:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setUlSizeTbTotalByStates:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setUlSizeTbTotalByTypes:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setWakeupMs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellMetric

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)CellMetric;
  [(CellMetric *)&v3 dealloc];
}

- (void)setElapsedMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_elapsedMs = a3;
}

- (void)setHasElapsedMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasElapsedMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWakeupMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_wakeupMs = a3;
}

- (void)setHasWakeupMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWakeupMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)sfScheduledByStatesCount
{
  return self->_sfScheduledByStates.count;
}

- (unsigned)sfScheduledByStates
{
  return self->_sfScheduledByStates.list;
}

- (void)clearSfScheduledByStates
{
}

- (void)addSfScheduledByState:(unsigned int)a3
{
}

- (unsigned)sfScheduledByStateAtIndex:(unint64_t)a3
{
  p_sfScheduledByStates = &self->_sfScheduledByStates;
  unint64_t count = self->_sfScheduledByStates.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_sfScheduledByStates->list[a3];
}

- (void)setSfScheduledByStates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)sizeTbTotalByStatesCount
{
  return self->_sizeTbTotalByStates.count;
}

- (unint64_t)sizeTbTotalByStates
{
  return self->_sizeTbTotalByStates.list;
}

- (void)clearSizeTbTotalByStates
{
}

- (void)addSizeTbTotalByState:(unint64_t)a3
{
}

- (unint64_t)sizeTbTotalByStateAtIndex:(unint64_t)a3
{
  p_sizeTbTotalByStates = &self->_sizeTbTotalByStates;
  unint64_t count = self->_sizeTbTotalByStates.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_sizeTbTotalByStates->list[a3];
}

- (void)setSizeTbTotalByStates:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)sfScheduledByTypesCount
{
  return self->_sfScheduledByTypes.count;
}

- (unsigned)sfScheduledByTypes
{
  return self->_sfScheduledByTypes.list;
}

- (void)clearSfScheduledByTypes
{
}

- (void)addSfScheduledByType:(unsigned int)a3
{
}

- (unsigned)sfScheduledByTypeAtIndex:(unint64_t)a3
{
  p_sfScheduledByTypes = &self->_sfScheduledByTypes;
  unint64_t count = self->_sfScheduledByTypes.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_sfScheduledByTypes->list[a3];
}

- (void)setSfScheduledByTypes:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)sizeTbTotalByTypesCount
{
  return self->_sizeTbTotalByTypes.count;
}

- (unint64_t)sizeTbTotalByTypes
{
  return self->_sizeTbTotalByTypes.list;
}

- (void)clearSizeTbTotalByTypes
{
}

- (void)addSizeTbTotalByType:(unint64_t)a3
{
}

- (unint64_t)sizeTbTotalByTypeAtIndex:(unint64_t)a3
{
  p_sizeTbTotalByTypes = &self->_sizeTbTotalByTypes;
  unint64_t count = self->_sizeTbTotalByTypes.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_sizeTbTotalByTypes->list[a3];
}

- (void)setSizeTbTotalByTypes:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)ulSfScheduledByStatesCount
{
  return self->_ulSfScheduledByStates.count;
}

- (unsigned)ulSfScheduledByStates
{
  return self->_ulSfScheduledByStates.list;
}

- (void)clearUlSfScheduledByStates
{
}

- (void)addUlSfScheduledByState:(unsigned int)a3
{
}

- (unsigned)ulSfScheduledByStateAtIndex:(unint64_t)a3
{
  p_ulSfScheduledByStates = &self->_ulSfScheduledByStates;
  unint64_t count = self->_ulSfScheduledByStates.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_ulSfScheduledByStates->list[a3];
}

- (void)setUlSfScheduledByStates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)ulSizeTbTotalByStatesCount
{
  return self->_ulSizeTbTotalByStates.count;
}

- (unint64_t)ulSizeTbTotalByStates
{
  return self->_ulSizeTbTotalByStates.list;
}

- (void)clearUlSizeTbTotalByStates
{
}

- (void)addUlSizeTbTotalByState:(unint64_t)a3
{
}

- (unint64_t)ulSizeTbTotalByStateAtIndex:(unint64_t)a3
{
  p_ulSizeTbTotalByStates = &self->_ulSizeTbTotalByStates;
  unint64_t count = self->_ulSizeTbTotalByStates.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_ulSizeTbTotalByStates->list[a3];
}

- (void)setUlSizeTbTotalByStates:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)ulSfScheduledByTypesCount
{
  return self->_ulSfScheduledByTypes.count;
}

- (unsigned)ulSfScheduledByTypes
{
  return self->_ulSfScheduledByTypes.list;
}

- (void)clearUlSfScheduledByTypes
{
}

- (void)addUlSfScheduledByType:(unsigned int)a3
{
}

- (unsigned)ulSfScheduledByTypeAtIndex:(unint64_t)a3
{
  p_ulSfScheduledByTypes = &self->_ulSfScheduledByTypes;
  unint64_t count = self->_ulSfScheduledByTypes.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_ulSfScheduledByTypes->list[a3];
}

- (void)setUlSfScheduledByTypes:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)ulSizeTbTotalByTypesCount
{
  return self->_ulSizeTbTotalByTypes.count;
}

- (unint64_t)ulSizeTbTotalByTypes
{
  return self->_ulSizeTbTotalByTypes.list;
}

- (void)clearUlSizeTbTotalByTypes
{
}

- (void)addUlSizeTbTotalByType:(unint64_t)a3
{
}

- (unint64_t)ulSizeTbTotalByTypeAtIndex:(unint64_t)a3
{
  p_ulSizeTbTotalByTypes = &self->_ulSizeTbTotalByTypes;
  unint64_t count = self->_ulSizeTbTotalByTypes.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_ulSizeTbTotalByTypes->list[a3];
}

- (void)setUlSizeTbTotalByTypes:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellMetric;
  char v3 = [(CellMetric *)&v7 description];
  v4 = [(CellMetric *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_elapsedMs];
    [v3 setObject:v5 forKey:@"elapsed_ms"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_wakeupMs];
    [v3 setObject:v6 forKey:@"wakeup_ms"];
  }
  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"sf_scheduled_by_state"];

  v8 = PBRepeatedUInt64NSArray();
  [v3 setObject:v8 forKey:@"size_tb_total_by_state"];

  v9 = PBRepeatedUInt32NSArray();
  [v3 setObject:v9 forKey:@"sf_scheduled_by_type"];

  v10 = PBRepeatedUInt64NSArray();
  [v3 setObject:v10 forKey:@"size_tb_total_by_type"];

  v11 = PBRepeatedUInt32NSArray();
  [v3 setObject:v11 forKey:@"ul_sf_scheduled_by_state"];

  v12 = PBRepeatedUInt64NSArray();
  [v3 setObject:v12 forKey:@"ul_size_tb_total_by_state"];

  v13 = PBRepeatedUInt32NSArray();
  [v3 setObject:v13 forKey:@"ul_sf_scheduled_by_type"];

  v14 = PBRepeatedUInt64NSArray();
  [v3 setObject:v14 forKey:@"ul_size_tb_total_by_type"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000AADB4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v15 = v4;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v15;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v15;
  }
  if (self->_sfScheduledByStates.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v15;
      ++v6;
    }
    while (v6 < self->_sfScheduledByStates.count);
  }
  if (self->_sizeTbTotalByStates.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v15;
      ++v7;
    }
    while (v7 < self->_sizeTbTotalByStates.count);
  }
  if (self->_sfScheduledByTypes.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v15;
      ++v8;
    }
    while (v8 < self->_sfScheduledByTypes.count);
  }
  if (self->_sizeTbTotalByTypes.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v15;
      ++v9;
    }
    while (v9 < self->_sizeTbTotalByTypes.count);
  }
  if (self->_ulSfScheduledByStates.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v15;
      ++v10;
    }
    while (v10 < self->_ulSfScheduledByStates.count);
  }
  if (self->_ulSizeTbTotalByStates.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v15;
      ++v11;
    }
    while (v11 < self->_ulSizeTbTotalByStates.count);
  }
  if (self->_ulSfScheduledByTypes.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v15;
      ++v12;
    }
    while (v12 < self->_ulSfScheduledByTypes.count);
  }
  p_ulSizeTbTotalByTypes = &self->_ulSizeTbTotalByTypes;
  if (p_ulSizeTbTotalByTypes->count)
  {
    unint64_t v14 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v15;
      ++v14;
    }
    while (v14 < p_ulSizeTbTotalByTypes->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[50] = self->_elapsedMs;
    *((unsigned char *)v4 + 208) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[51] = self->_wakeupMs;
    *((unsigned char *)v4 + 208) |= 2u;
  }
  id v30 = v4;
  if ([(CellMetric *)self sfScheduledByStatesCount])
  {
    [v30 clearSfScheduledByStates];
    unint64_t v6 = [(CellMetric *)self sfScheduledByStatesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v30 addSfScheduledByState:[self sfScheduledByStateAtIndex:i]];
    }
  }
  if ([(CellMetric *)self sizeTbTotalByStatesCount])
  {
    [v30 clearSizeTbTotalByStates];
    unint64_t v9 = [(CellMetric *)self sizeTbTotalByStatesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [v30 addSizeTbTotalByState:[self sizeTbTotalByStateAtIndex:j]];
    }
  }
  if ([(CellMetric *)self sfScheduledByTypesCount])
  {
    [v30 clearSfScheduledByTypes];
    unint64_t v12 = [(CellMetric *)self sfScheduledByTypesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        [v30 addSfScheduledByType:[self sfScheduledByTypeAtIndex:k]];
    }
  }
  if ([(CellMetric *)self sizeTbTotalByTypesCount])
  {
    [v30 clearSizeTbTotalByTypes];
    unint64_t v15 = [(CellMetric *)self sizeTbTotalByTypesCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        [v30 addSizeTbTotalByType:[self sizeTbTotalByTypeAtIndex:m]];
    }
  }
  if ([(CellMetric *)self ulSfScheduledByStatesCount])
  {
    [v30 clearUlSfScheduledByStates];
    unint64_t v18 = [(CellMetric *)self ulSfScheduledByStatesCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t n = 0; n != v19; ++n)
        [v30 addUlSfScheduledByState:[self ulSfScheduledByStateAtIndex:n]];
    }
  }
  if ([(CellMetric *)self ulSizeTbTotalByStatesCount])
  {
    [v30 clearUlSizeTbTotalByStates];
    unint64_t v21 = [(CellMetric *)self ulSizeTbTotalByStatesCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (iuint64_t i = 0; ii != v22; ++ii)
        [v30 addUlSizeTbTotalByState:[self ulSizeTbTotalByStateAtIndex:ii]];
    }
  }
  if ([(CellMetric *)self ulSfScheduledByTypesCount])
  {
    [v30 clearUlSfScheduledByTypes];
    unint64_t v24 = [(CellMetric *)self ulSfScheduledByTypesCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (juint64_t j = 0; jj != v25; ++jj)
        [v30 addUlSfScheduledByType:[self ulSfScheduledByTypeAtIndex:jj]];
    }
  }
  if ([(CellMetric *)self ulSizeTbTotalByTypesCount])
  {
    [v30 clearUlSizeTbTotalByTypes];
    unint64_t v27 = [(CellMetric *)self ulSizeTbTotalByTypesCount];
    if (v27)
    {
      unint64_t v28 = v27;
      for (kuint64_t k = 0; kk != v28; ++kk)
        [v30 addUlSizeTbTotalByType:[self ulSizeTbTotalByTypeAtIndex:kk]];
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
    *((_DWORD *)v4 + 50) = self->_elapsedMs;
    *((unsigned char *)v4 + 208) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 51) = self->_wakeupMs;
    *((unsigned char *)v4 + 208) |= 2u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt64Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 208) & 1) == 0 || self->_elapsedMs != *((_DWORD *)v4 + 50)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 208))
  {
LABEL_20:
    char IsEqual = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 208) & 2) == 0 || self->_wakeupMs != *((_DWORD *)v4 + 51)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 208) & 2) != 0)
  {
    goto LABEL_20;
  }
  if (!PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt64IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt64IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt64IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_20;
  }
  char IsEqual = PBRepeatedUInt64IsEqual();
LABEL_21:

  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_elapsedMs;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    goto LABEL_6;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_wakeupMs;
LABEL_6:
  uint64_t v4 = v3 ^ v2 ^ PBRepeatedUInt32Hash();
  uint64_t v5 = PBRepeatedUInt64Hash();
  uint64_t v6 = v4 ^ v5 ^ PBRepeatedUInt32Hash();
  uint64_t v7 = PBRepeatedUInt64Hash();
  uint64_t v8 = v7 ^ PBRepeatedUInt32Hash();
  uint64_t v9 = v6 ^ v8 ^ PBRepeatedUInt64Hash();
  uint64_t v10 = PBRepeatedUInt32Hash();
  return v9 ^ v10 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 208);
  if (v5)
  {
    self->_elapsedMs = *((_DWORD *)v4 + 50);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 208);
  }
  if ((v5 & 2) != 0)
  {
    self->_wakeupMs = *((_DWORD *)v4 + 51);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v30 = v4;
  uint64_t v6 = (char *)[v4 sfScheduledByStatesCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[CellMetric addSfScheduledByState:](self, "addSfScheduledByState:", [v30 sfScheduledByStateAtIndex:i]);
  }
  uint64_t v9 = (char *)[v30 sizeTbTotalByStatesCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[CellMetric addSizeTbTotalByState:](self, "addSizeTbTotalByState:", [v30 sizeTbTotalByStateAtIndex:j]);
  }
  unint64_t v12 = (char *)[v30 sfScheduledByTypesCount];
  if (v12)
  {
    unint64_t v13 = v12;
    for (uint64_t k = 0; k != v13; ++k)
      -[CellMetric addSfScheduledByType:](self, "addSfScheduledByType:", [v30 sfScheduledByTypeAtIndex:k]);
  }
  unint64_t v15 = (char *)[v30 sizeTbTotalByTypesCount];
  if (v15)
  {
    unint64_t v16 = v15;
    for (uint64_t m = 0; m != v16; ++m)
      -[CellMetric addSizeTbTotalByType:](self, "addSizeTbTotalByType:", [v30 sizeTbTotalByTypeAtIndex:m]);
  }
  unint64_t v18 = (char *)[v30 ulSfScheduledByStatesCount];
  if (v18)
  {
    unint64_t v19 = v18;
    for (uint64_t n = 0; n != v19; ++n)
      -[CellMetric addUlSfScheduledByState:](self, "addUlSfScheduledByState:", [v30 ulSfScheduledByStateAtIndex:n]);
  }
  unint64_t v21 = (char *)[v30 ulSizeTbTotalByStatesCount];
  if (v21)
  {
    unint64_t v22 = v21;
    for (iuint64_t i = 0; ii != v22; ++ii)
      -[CellMetric addUlSizeTbTotalByState:](self, "addUlSizeTbTotalByState:", [v30 ulSizeTbTotalByStateAtIndex:ii]);
  }
  unint64_t v24 = (char *)[v30 ulSfScheduledByTypesCount];
  if (v24)
  {
    unint64_t v25 = v24;
    for (juint64_t j = 0; jj != v25; ++jj)
      -[CellMetric addUlSfScheduledByType:](self, "addUlSfScheduledByType:", [v30 ulSfScheduledByTypeAtIndex:jj]);
  }
  unint64_t v27 = (char *)[v30 ulSizeTbTotalByTypesCount];
  if (v27)
  {
    unint64_t v28 = v27;
    for (kuint64_t k = 0; kk != v28; ++kk)
      -[CellMetric addUlSizeTbTotalByType:](self, "addUlSizeTbTotalByType:", [v30 ulSizeTbTotalByTypeAtIndex:kk]);
  }
}

- (unsigned)elapsedMs
{
  return self->_elapsedMs;
}

- (unsigned)wakeupMs
{
  return self->_wakeupMs;
}

@end