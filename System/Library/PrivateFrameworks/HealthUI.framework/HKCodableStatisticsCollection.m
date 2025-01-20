@interface HKCodableStatisticsCollection
+ (Class)statisticsType;
- (BOOL)hasStatisticsInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableDateComponents)statisticsInterval;
- (NSMutableArray)statistics;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statisticsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)statisticsCount;
- (void)addStatistics:(id)a3;
- (void)clearStatistics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setStatistics:(id)a3;
- (void)setStatisticsInterval:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableStatisticsCollection

- (BOOL)hasStatisticsInterval
{
  return self->_statisticsInterval != 0;
}

- (void)clearStatistics
{
}

- (void)addStatistics:(id)a3
{
  id v4 = a3;
  statistics = self->_statistics;
  id v8 = v4;
  if (!statistics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_statistics;
    self->_statistics = v6;

    id v4 = v8;
    statistics = self->_statistics;
  }
  [(NSMutableArray *)statistics addObject:v4];
}

- (unint64_t)statisticsCount
{
  return [(NSMutableArray *)self->_statistics count];
}

- (id)statisticsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_statistics objectAtIndex:a3];
}

+ (Class)statisticsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableStatisticsCollection;
  id v4 = [(HKCodableStatisticsCollection *)&v8 description];
  v5 = [(HKCodableStatisticsCollection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  statisticsInterval = self->_statisticsInterval;
  if (statisticsInterval)
  {
    v5 = [(HKCodableDateComponents *)statisticsInterval dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"statisticsInterval"];
  }
  if ([(NSMutableArray *)self->_statistics count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_statistics, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_statistics;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"statistics"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableStatisticsCollectionReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_statisticsInterval) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_statistics;
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
  if (self->_statisticsInterval) {
    objc_msgSend(v8, "setStatisticsInterval:");
  }
  if ([(HKCodableStatisticsCollection *)self statisticsCount])
  {
    [v8 clearStatistics];
    unint64_t v4 = [(HKCodableStatisticsCollection *)self statisticsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HKCodableStatisticsCollection *)self statisticsAtIndex:i];
        [v8 addStatistics:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableDateComponents *)self->_statisticsInterval copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_statistics;
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
        [v5 addStatistics:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((statisticsInterval = self->_statisticsInterval, !((unint64_t)statisticsInterval | v4[2]))
     || -[HKCodableDateComponents isEqual:](statisticsInterval, "isEqual:")))
  {
    statistics = self->_statistics;
    if ((unint64_t)statistics | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](statistics, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableDateComponents *)self->_statisticsInterval hash];
  return [(NSMutableArray *)self->_statistics hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  statisticsInterval = self->_statisticsInterval;
  uint64_t v6 = *((void *)v4 + 2);
  if (statisticsInterval)
  {
    if (v6) {
      -[HKCodableDateComponents mergeFrom:](statisticsInterval, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HKCodableStatisticsCollection setStatisticsInterval:](self, "setStatisticsInterval:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
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
        -[HKCodableStatisticsCollection addStatistics:](self, "addStatistics:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (HKCodableDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void)setStatisticsInterval:(id)a3
{
}

- (NSMutableArray)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end