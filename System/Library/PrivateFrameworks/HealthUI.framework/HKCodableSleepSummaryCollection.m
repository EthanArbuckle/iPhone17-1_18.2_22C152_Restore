@interface HKCodableSleepSummaryCollection
+ (Class)sleepSummaryEntryType;
+ (id)_codableSleepPeriodFromPeriod:(id)a3;
+ (id)_codableSleepPeriodSegmentFromSegment:(id)a3;
+ (id)_sleepEntryFromDaySummary:(id)a3;
+ (id)sleepSummaryCollectionFromDaySummaries:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sleepSummaryEntrys;
- (id)_daySummaryFromCodableSummary:(id)a3 sourceTimeZone:(id)a4;
- (id)_segmentFromCodableSegment:(id)a3 sourceTimeZone:(id)a4;
- (id)_sleepPeriodFromCodablePeriod:(id)a3 sourceTimeZone:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)daySummariesWithSourceTimeZone:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sleepSummaryEntryAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sleepSummaryEntrysCount;
- (void)addSleepSummaryEntry:(id)a3;
- (void)clearSleepSummaryEntrys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSleepSummaryEntrys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSleepSummaryCollection

- (void)clearSleepSummaryEntrys
{
}

- (void)addSleepSummaryEntry:(id)a3
{
  id v4 = a3;
  sleepSummaryEntrys = self->_sleepSummaryEntrys;
  id v8 = v4;
  if (!sleepSummaryEntrys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sleepSummaryEntrys;
    self->_sleepSummaryEntrys = v6;

    id v4 = v8;
    sleepSummaryEntrys = self->_sleepSummaryEntrys;
  }
  [(NSMutableArray *)sleepSummaryEntrys addObject:v4];
}

- (unint64_t)sleepSummaryEntrysCount
{
  return [(NSMutableArray *)self->_sleepSummaryEntrys count];
}

- (id)sleepSummaryEntryAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sleepSummaryEntrys objectAtIndex:a3];
}

+ (Class)sleepSummaryEntryType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSleepSummaryCollection;
  id v4 = [(HKCodableSleepSummaryCollection *)&v8 description];
  v5 = [(HKCodableSleepSummaryCollection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_sleepSummaryEntrys count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_sleepSummaryEntrys, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_sleepSummaryEntrys;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"sleepSummaryEntry"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSleepSummaryCollectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_sleepSummaryEntrys;
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
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(HKCodableSleepSummaryCollection *)self sleepSummaryEntrysCount])
  {
    [v8 clearSleepSummaryEntrys];
    unint64_t v4 = [(HKCodableSleepSummaryCollection *)self sleepSummaryEntrysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HKCodableSleepSummaryCollection *)self sleepSummaryEntryAtIndex:i];
        [v8 addSleepSummaryEntry:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_sleepSummaryEntrys;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addSleepSummaryEntry:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    sleepSummaryEntrys = self->_sleepSummaryEntrys;
    if ((unint64_t)sleepSummaryEntrys | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](sleepSummaryEntrys, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_sleepSummaryEntrys hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[HKCodableSleepSummaryCollection addSleepSummaryEntry:](self, "addSleepSummaryEntry:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)sleepSummaryEntrys
{
  return self->_sleepSummaryEntrys;
}

- (void)setSleepSummaryEntrys:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sleepSummaryCollectionFromDaySummaries:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(HKCodableSleepSummaryCollection);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(a1, "_sleepEntryFromDaySummary:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [(HKCodableSleepSummaryCollection *)v5 addSleepSummaryEntry:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_sleepEntryFromDaySummary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(HKCodableSleepSummaryEntry);
  id v6 = [v4 dateInterval];
  uint64_t v7 = objc_msgSend(v6, "hk_codableDateInterval");
  [(HKCodableSleepSummaryEntry *)v5 setDateInterval:v7];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = objc_msgSend(v4, "periods", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [a1 _codableSleepPeriodFromPeriod:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [(HKCodableSleepSummaryEntry *)v5 addPeriod:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

+ (id)_codableSleepPeriodFromPeriod:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(HKCodableSleepPeriod);
  id v6 = [v4 dateInterval];
  uint64_t v7 = objc_msgSend(v6, "hk_codableDateInterval");
  [(HKCodableSleepPeriod *)v5 setDateInterval:v7];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = objc_msgSend(v4, "segments", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [a1 _codableSleepPeriodSegmentFromSegment:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [(HKCodableSleepPeriod *)v5 addSegment:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

+ (id)_codableSleepPeriodSegmentFromSegment:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(HKCodableSleepPeriodSegment);
  uint64_t v5 = [v3 dateInterval];
  id v6 = objc_msgSend(v5, "hk_codableDateInterval");
  [(HKCodableSleepPeriodSegment *)v4 setDateInterval:v6];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = objc_msgSend(v3, "sampleIntervals", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "hk_codableDateInterval");
        [(HKCodableSleepPeriodSegment *)v4 addSampleInterval:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  -[HKCodableSleepPeriodSegment setCategory:](v4, "setCategory:", [v3 category]);
  return v4;
}

- (id)daySummariesWithSourceTimeZone:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(HKCodableSleepSummaryCollection *)self sleepSummaryEntrys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [(HKCodableSleepSummaryCollection *)self _daySummaryFromCodableSummary:*(void *)(*((void *)&v13 + 1) + 8 * i) sourceTimeZone:v4];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_daySummaryFromCodableSummary:(id)a3 sourceTimeZone:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 hasDateInterval];
  uint64_t v9 = (void *)MEMORY[0x1E4F28C18];
  if (v8)
  {
    uint64_t v10 = [v6 dateInterval];
    objc_msgSend(v9, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v10, v7);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28C18]);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v13 = [v6 periods];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [(HKCodableSleepSummaryCollection *)self _sleepPeriodFromCodablePeriod:*(void *)(*((void *)&v26 + 1) + 8 * i) sourceTimeZone:v7];
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  [v19 setTimeZone:v7];
  uint64_t v20 = [v11 startDate];
  uint64_t v21 = objc_msgSend(v20, "hk_morningIndexWithCalendar:", v19);

  v22 = (void *)MEMORY[0x1E4F2B528];
  id v23 = objc_alloc_init(MEMORY[0x1E4F28C18]);
  v24 = [v22 daySummaryWithMorningIndex:v21 dateInterval:v11 calendar:v19 periods:v12 schedules:MEMORY[0x1E4F1CBF0] sleepDurationGoal:0 creationInterval:v23];

  return v24;
}

- (id)_sleepPeriodFromCodablePeriod:(id)a3 sourceTimeZone:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 hasDateInterval];
  uint64_t v9 = (void *)MEMORY[0x1E4F28C18];
  if (v8)
  {
    uint64_t v10 = [v6 dateInterval];
    objc_msgSend(v9, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v10, v7);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28C18]);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v13 = objc_msgSend(v6, "segments", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [(HKCodableSleepSummaryCollection *)self _segmentFromCodableSegment:*(void *)(*((void *)&v21 + 1) + 8 * i) sourceTimeZone:v7];
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [MEMORY[0x1E4F2B540] sleepPeriodWithDateInterval:v11 segments:v12];

  return v19;
}

- (id)_segmentFromCodableSegment:(id)a3 sourceTimeZone:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = [v5 hasDateInterval];
  char v8 = (void *)MEMORY[0x1E4F28C18];
  if (v7)
  {
    uint64_t v9 = [v5 dateInterval];
    objc_msgSend(v8, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v9, v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28C18]);
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = objc_msgSend(v5, "sampleIntervals", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", *(void *)(*((void *)&v21 + 1) + 8 * i), v6);
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  if ([v5 hasCategory]) {
    uint64_t v18 = [v5 category];
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v19 = [MEMORY[0x1E4F2B548] sleepPeriodSegmentWithDateInterval:v10 sampleIntervals:v11 category:v18];

  return v19;
}

@end