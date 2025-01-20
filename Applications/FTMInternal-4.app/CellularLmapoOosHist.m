@interface CellularLmapoOosHist
+ (Class)recoverHistType;
- (BOOL)hasDurationSeconds;
- (BOOL)hasTimestamp;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)recoverHists;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recoverHistAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)oosStateCountsCount;
- (unint64_t)oosStateDurationMsCount;
- (unint64_t)oosToOosCountsCount;
- (unint64_t)recoverHistsCount;
- (unint64_t)timestamp;
- (unsigned)durationSeconds;
- (unsigned)oosStateCountAtIndex:(unint64_t)a3;
- (unsigned)oosStateCounts;
- (unsigned)oosStateDurationMs;
- (unsigned)oosStateDurationMsAtIndex:(unint64_t)a3;
- (unsigned)oosToOosCountAtIndex:(unint64_t)a3;
- (unsigned)oosToOosCounts;
- (unsigned)version;
- (void)addOosStateCount:(unsigned int)a3;
- (void)addOosStateDurationMs:(unsigned int)a3;
- (void)addOosToOosCount:(unsigned int)a3;
- (void)addRecoverHist:(id)a3;
- (void)clearOosStateCounts;
- (void)clearOosStateDurationMs;
- (void)clearOosToOosCounts;
- (void)clearRecoverHists;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDurationSeconds:(unsigned int)a3;
- (void)setHasDurationSeconds:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setOosStateCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setOosStateDurationMs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setOosToOosCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRecoverHists:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLmapoOosHist

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CellularLmapoOosHist;
  [(CellularLmapoOosHist *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDurationSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_durationSeconds = a3;
}

- (void)setHasDurationSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)oosStateCountsCount
{
  return self->_oosStateCounts.count;
}

- (unsigned)oosStateCounts
{
  return self->_oosStateCounts.list;
}

- (void)clearOosStateCounts
{
}

- (void)addOosStateCount:(unsigned int)a3
{
}

- (unsigned)oosStateCountAtIndex:(unint64_t)a3
{
  p_oosStateCounts = &self->_oosStateCounts;
  unint64_t count = self->_oosStateCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_oosStateCounts->list[a3];
}

- (void)setOosStateCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)oosStateDurationMsCount
{
  return self->_oosStateDurationMs.count;
}

- (unsigned)oosStateDurationMs
{
  return self->_oosStateDurationMs.list;
}

- (void)clearOosStateDurationMs
{
}

- (void)addOosStateDurationMs:(unsigned int)a3
{
}

- (unsigned)oosStateDurationMsAtIndex:(unint64_t)a3
{
  p_oosStateDurationMs = &self->_oosStateDurationMs;
  unint64_t count = self->_oosStateDurationMs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_oosStateDurationMs->list[a3];
}

- (void)setOosStateDurationMs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)clearRecoverHists
{
}

- (void)addRecoverHist:(id)a3
{
  id v4 = a3;
  recoverHists = self->_recoverHists;
  id v8 = v4;
  if (!recoverHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_recoverHists;
    self->_recoverHists = v6;

    id v4 = v8;
    recoverHists = self->_recoverHists;
  }
  [(NSMutableArray *)recoverHists addObject:v4];
}

- (unint64_t)recoverHistsCount
{
  return (unint64_t)[(NSMutableArray *)self->_recoverHists count];
}

- (id)recoverHistAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_recoverHists objectAtIndex:a3];
}

+ (Class)recoverHistType
{
  return (Class)objc_opt_class();
}

- (unint64_t)oosToOosCountsCount
{
  return self->_oosToOosCounts.count;
}

- (unsigned)oosToOosCounts
{
  return self->_oosToOosCounts.list;
}

- (void)clearOosToOosCounts
{
}

- (void)addOosToOosCount:(unsigned int)a3
{
}

- (unsigned)oosToOosCountAtIndex:(unint64_t)a3
{
  p_oosToOosCounts = &self->_oosToOosCounts;
  unint64_t count = self->_oosToOosCounts.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_oosToOosCounts->list[a3];
}

- (void)setOosToOosCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLmapoOosHist;
  char v3 = [(CellularLmapoOosHist *)&v7 description];
  id v4 = [(CellularLmapoOosHist *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_durationSeconds];
    [v3 setObject:v6 forKey:@"duration_seconds"];
  }
  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"oos_state_count"];

  id v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"oos_state_duration_ms"];

  if ([(NSMutableArray *)self->_recoverHists count])
  {
    id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_recoverHists, "count")];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v10 = self->_recoverHists;
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"recover_hist"];
  }
  v16 = PBRepeatedUInt32NSArray();
  [v3 setObject:v16 forKey:@"oos_to_oos_count"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v17 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v17 forKey:@"version"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000DDE8C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_oosStateCounts.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_oosStateCounts.count);
  }
  if (self->_oosStateDurationMs.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < self->_oosStateDurationMs.count);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = self->_recoverHists;
  id v9 = (char *)[(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      v10 = (char *)[(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  if (self->_oosToOosCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_oosToOosCounts.count)
    {
      unint64_t v13 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v13;
      }
      while (v13 < self->_oosToOosCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[10] = self->_timestamp;
    *((unsigned char *)v4 + 108) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_durationSeconds;
    *((unsigned char *)v4 + 108) |= 2u;
  }
  id v19 = v4;
  if ([(CellularLmapoOosHist *)self oosStateCountsCount])
  {
    [v19 clearOosStateCounts];
    unint64_t v6 = [(CellularLmapoOosHist *)self oosStateCountsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v19 addOosStateCount:[self oosStateCountAtIndex:i]];
    }
  }
  if ([(CellularLmapoOosHist *)self oosStateDurationMsCount])
  {
    [v19 clearOosStateDurationMs];
    unint64_t v9 = [(CellularLmapoOosHist *)self oosStateDurationMsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [v19 addOosStateDurationMs:[self oosStateDurationMsAtIndex:j]];
    }
  }
  if ([(CellularLmapoOosHist *)self recoverHistsCount])
  {
    [v19 clearRecoverHists];
    unint64_t v12 = [(CellularLmapoOosHist *)self recoverHistsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        long long v15 = [(CellularLmapoOosHist *)self recoverHistAtIndex:k];
        [v19 addRecoverHist:v15];
      }
    }
  }
  if ([(CellularLmapoOosHist *)self oosToOosCountsCount])
  {
    [v19 clearOosToOosCounts];
    unint64_t v16 = [(CellularLmapoOosHist *)self oosToOosCountsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
        [v19 addOosToOosCount:[self oosToOosCountAtIndex:m]];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v19 + 26) = self->_version;
    *((unsigned char *)v19 + 108) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[10] = self->_timestamp;
    *((unsigned char *)v5 + 108) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 22) = self->_durationSeconds;
    *((unsigned char *)v5 + 108) |= 2u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_recoverHists;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [v15 copyWithZone:a3];
        [v6 addRecoverHist:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v6 + 26) = self->_version;
    *((unsigned char *)v6 + 108) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 108) & 1) == 0 || self->_timestamp != *((void *)v4 + 10)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 108))
  {
LABEL_21:
    BOOL v6 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 2) == 0 || self->_durationSeconds != *((_DWORD *)v4 + 22)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    goto LABEL_21;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_21;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_21;
  }
  recoverHists = self->_recoverHists;
  if ((unint64_t)recoverHists | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](recoverHists, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_21;
  }
  BOOL v6 = (*((unsigned char *)v4 + 108) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 4) == 0 || self->_version != *((_DWORD *)v4 + 26)) {
      goto LABEL_21;
    }
    BOOL v6 = 1;
  }
LABEL_22:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_durationSeconds;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = PBRepeatedUInt32Hash();
  uint64_t v6 = PBRepeatedUInt32Hash();
  unint64_t v7 = (unint64_t)[(NSMutableArray *)self->_recoverHists hash];
  uint64_t v8 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v9 = 2654435761 * self->_version;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 108);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 108);
  }
  if ((v6 & 2) != 0)
  {
    self->_durationSeconds = *((_DWORD *)v4 + 22);
    *(unsigned char *)&self->_has |= 2u;
  }
  unint64_t v7 = (char *)[v4 oosStateCountsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[CellularLmapoOosHist addOosStateCount:](self, "addOosStateCount:", [v5 oosStateCountAtIndex:i]);
  }
  id v10 = (char *)[v5 oosStateDurationMsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[CellularLmapoOosHist addOosStateDurationMs:](self, "addOosStateDurationMs:", [v5 oosStateDurationMsAtIndex:j]);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = *((id *)v5 + 12);
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v15; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        -[CellularLmapoOosHist addRecoverHist:](self, "addRecoverHist:", *(void *)(*((void *)&v21 + 1) + 8 * (void)k), (void)v21);
      }
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  long long v18 = (char *)[v5 oosToOosCountsCount];
  if (v18)
  {
    id v19 = v18;
    for (uint64_t m = 0; m != v19; ++m)
      [self addOosToOosCount:[v5 oosToOosCountAtIndex:m]];
  }
  if ((*((unsigned char *)v5 + 108) & 4) != 0)
  {
    self->_version = *((_DWORD *)v5 + 26);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationSeconds
{
  return self->_durationSeconds;
}

- (NSMutableArray)recoverHists
{
  return self->_recoverHists;
}

- (void)setRecoverHists:(id)a3
{
}

- (unsigned)version
{
  return self->_version;
}

- (void).cxx_destruct
{
}

@end