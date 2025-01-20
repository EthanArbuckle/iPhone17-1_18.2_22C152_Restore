@interface HKCodableChartTimePeriodSeriesDataSourceData
+ (Class)dateIntervalsToTotalsType;
+ (Class)intervalCountsType;
- (BOOL)hasStatisticsInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableDateComponents)statisticsInterval;
- (NSMutableArray)dateIntervalsToTotals;
- (NSMutableArray)intervalCounts;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateIntervalsToTotalsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)intervalCountsAtIndex:(unint64_t)a3;
- (unint64_t)dateIntervalsToTotalsCount;
- (unint64_t)hash;
- (unint64_t)intervalCountsCount;
- (void)addDateIntervalsToTotals:(id)a3;
- (void)addIntervalCounts:(id)a3;
- (void)clearDateIntervalsToTotals;
- (void)clearIntervalCounts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateIntervalsToTotals:(id)a3;
- (void)setIntervalCounts:(id)a3;
- (void)setStatisticsInterval:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableChartTimePeriodSeriesDataSourceData

- (BOOL)hasStatisticsInterval
{
  return self->_statisticsInterval != 0;
}

- (void)clearDateIntervalsToTotals
{
}

- (void)addDateIntervalsToTotals:(id)a3
{
  id v4 = a3;
  dateIntervalsToTotals = self->_dateIntervalsToTotals;
  id v8 = v4;
  if (!dateIntervalsToTotals)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_dateIntervalsToTotals;
    self->_dateIntervalsToTotals = v6;

    id v4 = v8;
    dateIntervalsToTotals = self->_dateIntervalsToTotals;
  }
  [(NSMutableArray *)dateIntervalsToTotals addObject:v4];
}

- (unint64_t)dateIntervalsToTotalsCount
{
  return [(NSMutableArray *)self->_dateIntervalsToTotals count];
}

- (id)dateIntervalsToTotalsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dateIntervalsToTotals objectAtIndex:a3];
}

+ (Class)dateIntervalsToTotalsType
{
  return (Class)objc_opt_class();
}

- (void)clearIntervalCounts
{
}

- (void)addIntervalCounts:(id)a3
{
  id v4 = a3;
  intervalCounts = self->_intervalCounts;
  id v8 = v4;
  if (!intervalCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_intervalCounts;
    self->_intervalCounts = v6;

    id v4 = v8;
    intervalCounts = self->_intervalCounts;
  }
  [(NSMutableArray *)intervalCounts addObject:v4];
}

- (unint64_t)intervalCountsCount
{
  return [(NSMutableArray *)self->_intervalCounts count];
}

- (id)intervalCountsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_intervalCounts objectAtIndex:a3];
}

+ (Class)intervalCountsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableChartTimePeriodSeriesDataSourceData;
  id v4 = [(HKCodableChartTimePeriodSeriesDataSourceData *)&v8 description];
  v5 = [(HKCodableChartTimePeriodSeriesDataSourceData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  statisticsInterval = self->_statisticsInterval;
  if (statisticsInterval)
  {
    v5 = [(HKCodableDateComponents *)statisticsInterval dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"statisticsInterval"];
  }
  if ([(NSMutableArray *)self->_dateIntervalsToTotals count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_dateIntervalsToTotals, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v7 = self->_dateIntervalsToTotals;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"dateIntervalsToTotals"];
  }
  if ([(NSMutableArray *)self->_intervalCounts count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_intervalCounts, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v14 = self->_intervalCounts;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (void)v21);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"intervalCounts"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableChartTimePeriodSeriesDataSourceDataReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_statisticsInterval) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_dateIntervalsToTotals;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_intervalCounts;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_statisticsInterval) {
    objc_msgSend(v12, "setStatisticsInterval:");
  }
  if ([(HKCodableChartTimePeriodSeriesDataSourceData *)self dateIntervalsToTotalsCount])
  {
    [v12 clearDateIntervalsToTotals];
    unint64_t v4 = [(HKCodableChartTimePeriodSeriesDataSourceData *)self dateIntervalsToTotalsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HKCodableChartTimePeriodSeriesDataSourceData *)self dateIntervalsToTotalsAtIndex:i];
        [v12 addDateIntervalsToTotals:v7];
      }
    }
  }
  if ([(HKCodableChartTimePeriodSeriesDataSourceData *)self intervalCountsCount])
  {
    [v12 clearIntervalCounts];
    unint64_t v8 = [(HKCodableChartTimePeriodSeriesDataSourceData *)self intervalCountsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(HKCodableChartTimePeriodSeriesDataSourceData *)self intervalCountsAtIndex:j];
        [v12 addIntervalCounts:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableDateComponents *)self->_statisticsInterval copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_dateIntervalsToTotals;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addDateIntervalsToTotals:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_intervalCounts;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [v5 addIntervalCounts:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((statisticsInterval = self->_statisticsInterval, !((unint64_t)statisticsInterval | v4[3]))
     || -[HKCodableDateComponents isEqual:](statisticsInterval, "isEqual:"))
    && ((dateIntervalsToTotals = self->_dateIntervalsToTotals, !((unint64_t)dateIntervalsToTotals | v4[1]))
     || -[NSMutableArray isEqual:](dateIntervalsToTotals, "isEqual:")))
  {
    intervalCounts = self->_intervalCounts;
    if ((unint64_t)intervalCounts | v4[2]) {
      char v8 = -[NSMutableArray isEqual:](intervalCounts, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableDateComponents *)self->_statisticsInterval hash];
  uint64_t v4 = [(NSMutableArray *)self->_dateIntervalsToTotals hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_intervalCounts hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  statisticsInterval = self->_statisticsInterval;
  uint64_t v6 = *((void *)v4 + 3);
  if (statisticsInterval)
  {
    if (v6) {
      -[HKCodableDateComponents mergeFrom:](statisticsInterval, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HKCodableChartTimePeriodSeriesDataSourceData setStatisticsInterval:](self, "setStatisticsInterval:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(HKCodableChartTimePeriodSeriesDataSourceData *)self addDateIntervalsToTotals:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *((id *)v4 + 2);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[HKCodableChartTimePeriodSeriesDataSourceData addIntervalCounts:](self, "addIntervalCounts:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (HKCodableDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void)setStatisticsInterval:(id)a3
{
}

- (NSMutableArray)dateIntervalsToTotals
{
  return self->_dateIntervalsToTotals;
}

- (void)setDateIntervalsToTotals:(id)a3
{
}

- (NSMutableArray)intervalCounts
{
  return self->_intervalCounts;
}

- (void)setIntervalCounts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_intervalCounts, 0);
  objc_storeStrong((id *)&self->_dateIntervalsToTotals, 0);
}

@end