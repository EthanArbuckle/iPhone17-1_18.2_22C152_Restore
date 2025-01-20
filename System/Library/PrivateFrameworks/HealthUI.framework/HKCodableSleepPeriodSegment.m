@interface HKCodableSleepPeriodSegment
+ (Class)sampleIntervalType;
- (BOOL)hasCategory;
- (BOOL)hasDateInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableDateInterval)dateInterval;
- (NSMutableArray)sampleIntervals;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sampleIntervalAtIndex:(unint64_t)a3;
- (int64_t)category;
- (unint64_t)hash;
- (unint64_t)sampleIntervalsCount;
- (void)addSampleInterval:(id)a3;
- (void)clearSampleIntervals;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategory:(int64_t)a3;
- (void)setDateInterval:(id)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)setSampleIntervals:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSleepPeriodSegment

- (BOOL)hasDateInterval
{
  return self->_dateInterval != 0;
}

- (void)clearSampleIntervals
{
}

- (void)addSampleInterval:(id)a3
{
  id v4 = a3;
  sampleIntervals = self->_sampleIntervals;
  id v8 = v4;
  if (!sampleIntervals)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sampleIntervals;
    self->_sampleIntervals = v6;

    id v4 = v8;
    sampleIntervals = self->_sampleIntervals;
  }
  [(NSMutableArray *)sampleIntervals addObject:v4];
}

- (unint64_t)sampleIntervalsCount
{
  return [(NSMutableArray *)self->_sampleIntervals count];
}

- (id)sampleIntervalAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sampleIntervals objectAtIndex:a3];
}

+ (Class)sampleIntervalType
{
  return (Class)objc_opt_class();
}

- (void)setCategory:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_category = a3;
}

- (void)setHasCategory:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCategory
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSleepPeriodSegment;
  id v4 = [(HKCodableSleepPeriodSegment *)&v8 description];
  v5 = [(HKCodableSleepPeriodSegment *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  dateInterval = self->_dateInterval;
  if (dateInterval)
  {
    v5 = [(HKCodableDateInterval *)dateInterval dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"dateInterval"];
  }
  if ([(NSMutableArray *)self->_sampleIntervals count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_sampleIntervals, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = self->_sampleIntervals;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"sampleInterval"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v13 = [NSNumber numberWithLongLong:self->_category];
    [v3 setObject:v13 forKey:@"category"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSleepPeriodSegmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_dateInterval) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_sampleIntervals;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_dateInterval) {
    objc_msgSend(v8, "setDateInterval:");
  }
  if ([(HKCodableSleepPeriodSegment *)self sampleIntervalsCount])
  {
    [v8 clearSampleIntervals];
    unint64_t v4 = [(HKCodableSleepPeriodSegment *)self sampleIntervalsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HKCodableSleepPeriodSegment *)self sampleIntervalAtIndex:i];
        [v8 addSampleInterval:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v8 + 1) = self->_category;
    *((unsigned char *)v8 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableDateInterval *)self->_dateInterval copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_sampleIntervals;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [(id)v5 addSampleInterval:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_category;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  dateInterval = self->_dateInterval;
  if ((unint64_t)dateInterval | *((void *)v4 + 2))
  {
    if (!-[HKCodableDateInterval isEqual:](dateInterval, "isEqual:")) {
      goto LABEL_10;
    }
  }
  sampleIntervals = self->_sampleIntervals;
  if ((unint64_t)sampleIntervals | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](sampleIntervals, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_category == *((void *)v4 + 1))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableDateInterval *)self->_dateInterval hash];
  uint64_t v4 = [(NSMutableArray *)self->_sampleIntervals hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_category;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dateInterval = self->_dateInterval;
  uint64_t v6 = *((void *)v4 + 2);
  if (dateInterval)
  {
    if (v6) {
      -[HKCodableDateInterval mergeFrom:](dateInterval, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HKCodableSleepPeriodSegment setDateInterval:](self, "setDateInterval:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[HKCodableSleepPeriodSegment addSampleInterval:](self, "addSampleInterval:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*((unsigned char *)v4 + 32))
  {
    self->_category = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (HKCodableDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (NSMutableArray)sampleIntervals
{
  return self->_sampleIntervals;
}

- (void)setSampleIntervals:(id)a3
{
}

- (int64_t)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleIntervals, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end