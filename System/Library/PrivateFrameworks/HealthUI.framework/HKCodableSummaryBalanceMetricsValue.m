@interface HKCodableSummaryBalanceMetricsValue
+ (Class)baselineComparisonType;
- (BOOL)hasBaselineRange;
- (BOOL)hasMorningIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableDayIndexRange)baselineRange;
- (NSMutableArray)baselineComparisons;
- (id)baselineComparisonAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)morningIndex;
- (unint64_t)baselineComparisonsCount;
- (unint64_t)hash;
- (void)addBaselineComparison:(id)a3;
- (void)clearBaselineComparisons;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBaselineComparisons:(id)a3;
- (void)setBaselineRange:(id)a3;
- (void)setHasMorningIndex:(BOOL)a3;
- (void)setMorningIndex:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryBalanceMetricsValue

- (void)setMorningIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_morningIndex = a3;
}

- (void)setHasMorningIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMorningIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBaselineRange
{
  return self->_baselineRange != 0;
}

- (void)clearBaselineComparisons
{
}

- (void)addBaselineComparison:(id)a3
{
  id v4 = a3;
  baselineComparisons = self->_baselineComparisons;
  id v8 = v4;
  if (!baselineComparisons)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_baselineComparisons;
    self->_baselineComparisons = v6;

    id v4 = v8;
    baselineComparisons = self->_baselineComparisons;
  }
  [(NSMutableArray *)baselineComparisons addObject:v4];
}

- (unint64_t)baselineComparisonsCount
{
  return [(NSMutableArray *)self->_baselineComparisons count];
}

- (id)baselineComparisonAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_baselineComparisons objectAtIndex:a3];
}

+ (Class)baselineComparisonType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryBalanceMetricsValue;
  id v4 = [(HKCodableSummaryBalanceMetricsValue *)&v8 description];
  v5 = [(HKCodableSummaryBalanceMetricsValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_morningIndex];
    [v3 setObject:v4 forKey:@"morningIndex"];
  }
  baselineRange = self->_baselineRange;
  if (baselineRange)
  {
    v6 = [(HKCodableDayIndexRange *)baselineRange dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"baselineRange"];
  }
  if ([(NSMutableArray *)self->_baselineComparisons count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_baselineComparisons, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_baselineComparisons;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"baselineComparison"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryBalanceMetricsValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_baselineRange) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_baselineComparisons;
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
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_morningIndex;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v9 = v4;
  if (self->_baselineRange) {
    objc_msgSend(v4, "setBaselineRange:");
  }
  if ([(HKCodableSummaryBalanceMetricsValue *)self baselineComparisonsCount])
  {
    [v9 clearBaselineComparisons];
    unint64_t v5 = [(HKCodableSummaryBalanceMetricsValue *)self baselineComparisonsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(HKCodableSummaryBalanceMetricsValue *)self baselineComparisonAtIndex:i];
        [v9 addBaselineComparison:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_morningIndex;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v7 = [(HKCodableDayIndexRange *)self->_baselineRange copyWithZone:a3];
  uint64_t v8 = (void *)v6[3];
  v6[3] = v7;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = self->_baselineComparisons;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "copyWithZone:", a3, (void)v16);
        [v6 addBaselineComparison:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_morningIndex != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  baselineRange = self->_baselineRange;
  if ((unint64_t)baselineRange | *((void *)v4 + 3)
    && !-[HKCodableDayIndexRange isEqual:](baselineRange, "isEqual:"))
  {
    goto LABEL_11;
  }
  baselineComparisons = self->_baselineComparisons;
  if ((unint64_t)baselineComparisons | *((void *)v4 + 2)) {
    char v7 = -[NSMutableArray isEqual:](baselineComparisons, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_morningIndex;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(HKCodableDayIndexRange *)self->_baselineRange hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_baselineComparisons hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3;
  id v5 = v4;
  if (v4[4])
  {
    self->_morningIndex = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  baselineRange = self->_baselineRange;
  uint64_t v7 = *((void *)v5 + 3);
  if (baselineRange)
  {
    if (v7) {
      -[HKCodableDayIndexRange mergeFrom:](baselineRange, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[HKCodableSummaryBalanceMetricsValue setBaselineRange:](self, "setBaselineRange:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v5 + 2);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[HKCodableSummaryBalanceMetricsValue addBaselineComparison:](self, "addBaselineComparison:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (int64_t)morningIndex
{
  return self->_morningIndex;
}

- (HKCodableDayIndexRange)baselineRange
{
  return self->_baselineRange;
}

- (void)setBaselineRange:(id)a3
{
}

- (NSMutableArray)baselineComparisons
{
  return self->_baselineComparisons;
}

- (void)setBaselineComparisons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baselineRange, 0);
  objc_storeStrong((id *)&self->_baselineComparisons, 0);
}

@end