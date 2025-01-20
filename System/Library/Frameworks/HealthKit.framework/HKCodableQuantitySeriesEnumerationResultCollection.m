@interface HKCodableQuantitySeriesEnumerationResultCollection
+ (Class)resultsType;
- (BOOL)hasLatestSampleStartTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)results;
- (double)latestSampleStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)resultsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)resultsCount;
- (void)addResults:(id)a3;
- (void)clearResults;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLatestSampleStartTime:(BOOL)a3;
- (void)setLatestSampleStartTime:(double)a3;
- (void)setResults:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableQuantitySeriesEnumerationResultCollection

- (void)clearResults
{
}

- (void)addResults:(id)a3
{
  id v4 = a3;
  results = self->_results;
  id v8 = v4;
  if (!results)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_results;
    self->_results = v6;

    id v4 = v8;
    results = self->_results;
  }
  [(NSMutableArray *)results addObject:v4];
}

- (unint64_t)resultsCount
{
  return [(NSMutableArray *)self->_results count];
}

- (id)resultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_results objectAtIndex:a3];
}

+ (Class)resultsType
{
  return (Class)objc_opt_class();
}

- (void)setLatestSampleStartTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_latestSampleStartTime = a3;
}

- (void)setHasLatestSampleStartTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatestSampleStartTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableQuantitySeriesEnumerationResultCollection;
  id v4 = [(HKCodableQuantitySeriesEnumerationResultCollection *)&v8 description];
  v5 = [(HKCodableQuantitySeriesEnumerationResultCollection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_results count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_results, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_results;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"results"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithDouble:self->_latestSampleStartTime];
    [v3 setObject:v11 forKey:@"latestSampleStartTime"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableQuantitySeriesEnumerationResultCollectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_results;
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
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(HKCodableQuantitySeriesEnumerationResultCollection *)self resultsCount])
  {
    [v8 clearResults];
    unint64_t v4 = [(HKCodableQuantitySeriesEnumerationResultCollection *)self resultsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HKCodableQuantitySeriesEnumerationResultCollection *)self resultsAtIndex:i];
        [v8 addResults:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v8 + 1) = *(void *)&self->_latestSampleStartTime;
    *((unsigned char *)v8 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_results;
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
        [(id)v5 addResults:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_latestSampleStartTime;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  results = self->_results;
  if ((unint64_t)results | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](results, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_latestSampleStartTime == *((double *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_results hash];
  if (*(unsigned char *)&self->_has)
  {
    double latestSampleStartTime = self->_latestSampleStartTime;
    double v6 = -latestSampleStartTime;
    if (latestSampleStartTime >= 0.0) {
      double v6 = self->_latestSampleStartTime;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        -[HKCodableQuantitySeriesEnumerationResultCollection addResults:](self, "addResults:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 24))
  {
    self->_double latestSampleStartTime = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (double)latestSampleStartTime
{
  return self->_latestSampleStartTime;
}

- (void).cxx_destruct
{
}

@end