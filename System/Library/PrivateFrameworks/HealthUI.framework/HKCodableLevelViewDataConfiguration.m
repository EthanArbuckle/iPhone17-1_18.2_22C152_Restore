@interface HKCodableLevelViewDataConfiguration
+ (Class)sortedNormalizedBucketsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sortedNormalizedBuckets;
- (double)normalizedValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sortedNormalizedBucketsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sortedNormalizedBucketsCount;
- (void)addSortedNormalizedBuckets:(id)a3;
- (void)clearSortedNormalizedBuckets;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setNormalizedValue:(double)a3;
- (void)setSortedNormalizedBuckets:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableLevelViewDataConfiguration

- (void)clearSortedNormalizedBuckets
{
}

- (void)addSortedNormalizedBuckets:(id)a3
{
  id v4 = a3;
  sortedNormalizedBuckets = self->_sortedNormalizedBuckets;
  id v8 = v4;
  if (!sortedNormalizedBuckets)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sortedNormalizedBuckets;
    self->_sortedNormalizedBuckets = v6;

    id v4 = v8;
    sortedNormalizedBuckets = self->_sortedNormalizedBuckets;
  }
  [(NSMutableArray *)sortedNormalizedBuckets addObject:v4];
}

- (unint64_t)sortedNormalizedBucketsCount
{
  return [(NSMutableArray *)self->_sortedNormalizedBuckets count];
}

- (id)sortedNormalizedBucketsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sortedNormalizedBuckets objectAtIndex:a3];
}

+ (Class)sortedNormalizedBucketsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableLevelViewDataConfiguration;
  id v4 = [(HKCodableLevelViewDataConfiguration *)&v8 description];
  v5 = [(HKCodableLevelViewDataConfiguration *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithDouble:self->_normalizedValue];
  [v3 setObject:v4 forKey:@"normalizedValue"];

  if ([(NSMutableArray *)self->_sortedNormalizedBuckets count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_sortedNormalizedBuckets, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_sortedNormalizedBuckets;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"sortedNormalizedBuckets"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableLevelViewDataConfigurationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteDoubleField();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_sortedNormalizedBuckets;
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
  uint64_t v8 = (double *)a3;
  v8[1] = self->_normalizedValue;
  if ([(HKCodableLevelViewDataConfiguration *)self sortedNormalizedBucketsCount])
  {
    [v8 clearSortedNormalizedBuckets];
    unint64_t v4 = [(HKCodableLevelViewDataConfiguration *)self sortedNormalizedBucketsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HKCodableLevelViewDataConfiguration *)self sortedNormalizedBucketsAtIndex:i];
        [v8 addSortedNormalizedBuckets:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (double *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_normalizedValue;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_sortedNormalizedBuckets;
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
        [v5 addSortedNormalizedBuckets:v11];

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
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_normalizedValue == *((double *)v4 + 1))
  {
    sortedNormalizedBuckets = self->_sortedNormalizedBuckets;
    if ((unint64_t)sortedNormalizedBuckets | v4[2]) {
      char v6 = -[NSMutableArray isEqual:](sortedNormalizedBuckets, "isEqual:");
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
  double normalizedValue = self->_normalizedValue;
  double v4 = -normalizedValue;
  if (normalizedValue >= 0.0) {
    double v4 = self->_normalizedValue;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  return [(NSMutableArray *)self->_sortedNormalizedBuckets hash] ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_double normalizedValue = *((double *)v4 + 1);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
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
        -[HKCodableLevelViewDataConfiguration addSortedNormalizedBuckets:](self, "addSortedNormalizedBuckets:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (double)normalizedValue
{
  return self->_normalizedValue;
}

- (void)setNormalizedValue:(double)a3
{
  self->_double normalizedValue = a3;
}

- (NSMutableArray)sortedNormalizedBuckets
{
  return self->_sortedNormalizedBuckets;
}

- (void)setSortedNormalizedBuckets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end