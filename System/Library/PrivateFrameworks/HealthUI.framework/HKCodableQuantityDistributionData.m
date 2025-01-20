@interface HKCodableQuantityDistributionData
+ (Class)contextIdentifiersType;
- (BOOL)hasAverageValue;
- (BOOL)hasDuration;
- (BOOL)hasEndDate;
- (BOOL)hasMaximumValue;
- (BOOL)hasMinimumBucketValue;
- (BOOL)hasMinimumValue;
- (BOOL)hasStartDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableQuantity)averageValue;
- (HKCodableQuantity)duration;
- (HKCodableQuantity)maximumValue;
- (HKCodableQuantity)minimumBucketValue;
- (HKCodableQuantity)minimumValue;
- (NSMutableArray)contextIdentifiers;
- (double)endDate;
- (double)histogramCounts;
- (double)histogramCountsAtIndex:(unint64_t)a3;
- (double)startDate;
- (id)contextIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)contextIdentifiersCount;
- (unint64_t)hash;
- (unint64_t)histogramCountsCount;
- (void)addContextIdentifiers:(id)a3;
- (void)addHistogramCounts:(double)a3;
- (void)clearContextIdentifiers;
- (void)clearHistogramCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAverageValue:(id)a3;
- (void)setContextIdentifiers:(id)a3;
- (void)setDuration:(id)a3;
- (void)setEndDate:(double)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setHistogramCounts:(double *)a3 count:(unint64_t)a4;
- (void)setMaximumValue:(id)a3;
- (void)setMinimumBucketValue:(id)a3;
- (void)setMinimumValue:(id)a3;
- (void)setStartDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableQuantityDistributionData

- (void)dealloc
{
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)HKCodableQuantityDistributionData;
  [(HKCodableQuantityDistributionData *)&v3 dealloc];
}

- (void)setStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasMinimumBucketValue
{
  return self->_minimumBucketValue != 0;
}

- (BOOL)hasMinimumValue
{
  return self->_minimumValue != 0;
}

- (BOOL)hasMaximumValue
{
  return self->_maximumValue != 0;
}

- (BOOL)hasAverageValue
{
  return self->_averageValue != 0;
}

- (BOOL)hasDuration
{
  return self->_duration != 0;
}

- (unint64_t)histogramCountsCount
{
  return self->_histogramCounts.count;
}

- (double)histogramCounts
{
  return self->_histogramCounts.list;
}

- (void)clearHistogramCounts
{
}

- (void)addHistogramCounts:(double)a3
{
}

- (double)histogramCountsAtIndex:(unint64_t)a3
{
  p_histogramCounts = &self->_histogramCounts;
  unint64_t count = self->_histogramCounts.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_histogramCounts->list[a3];
}

- (void)setHistogramCounts:(double *)a3 count:(unint64_t)a4
{
}

- (void)clearContextIdentifiers
{
}

- (void)addContextIdentifiers:(id)a3
{
  id v4 = a3;
  contextIdentifiers = self->_contextIdentifiers;
  id v8 = v4;
  if (!contextIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_contextIdentifiers;
    self->_contextIdentifiers = v6;

    id v4 = v8;
    contextIdentifiers = self->_contextIdentifiers;
  }
  [(NSMutableArray *)contextIdentifiers addObject:v4];
}

- (unint64_t)contextIdentifiersCount
{
  return [(NSMutableArray *)self->_contextIdentifiers count];
}

- (id)contextIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contextIdentifiers objectAtIndex:a3];
}

+ (Class)contextIdentifiersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableQuantityDistributionData;
  id v4 = [(HKCodableQuantityDistributionData *)&v8 description];
  v5 = [(HKCodableQuantityDistributionData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithDouble:self->_startDate];
    [v3 setObject:v5 forKey:@"startDate"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithDouble:self->_endDate];
    [v3 setObject:v6 forKey:@"endDate"];
  }
  minimumBucketValue = self->_minimumBucketValue;
  if (minimumBucketValue)
  {
    objc_super v8 = [(HKCodableQuantity *)minimumBucketValue dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"minimumBucketValue"];
  }
  minimumValue = self->_minimumValue;
  if (minimumValue)
  {
    v10 = [(HKCodableQuantity *)minimumValue dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"minimumValue"];
  }
  maximumValue = self->_maximumValue;
  if (maximumValue)
  {
    v12 = [(HKCodableQuantity *)maximumValue dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"maximumValue"];
  }
  averageValue = self->_averageValue;
  if (averageValue)
  {
    v14 = [(HKCodableQuantity *)averageValue dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"averageValue"];
  }
  duration = self->_duration;
  if (duration)
  {
    v16 = [(HKCodableQuantity *)duration dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"duration"];
  }
  v17 = PBRepeatedDoubleNSArray();
  [v3 setObject:v17 forKey:@"histogramCounts"];

  contextIdentifiers = self->_contextIdentifiers;
  if (contextIdentifiers) {
    [v3 setObject:contextIdentifiers forKey:@"contextIdentifiers"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableQuantityDistributionDataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_minimumBucketValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_minimumValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_maximumValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_averageValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_duration) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_histogramCounts.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      ++v6;
    }
    while (v6 < self->_histogramCounts.count);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_contextIdentifiers;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = *(void *)&self->_startDate;
    *((unsigned char *)v4 + 96) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[4] = *(void *)&self->_endDate;
    *((unsigned char *)v4 + 96) |= 1u;
  }
  id v13 = v4;
  if (self->_minimumBucketValue) {
    objc_msgSend(v4, "setMinimumBucketValue:");
  }
  if (self->_minimumValue) {
    objc_msgSend(v13, "setMinimumValue:");
  }
  if (self->_maximumValue) {
    objc_msgSend(v13, "setMaximumValue:");
  }
  if (self->_averageValue) {
    objc_msgSend(v13, "setAverageValue:");
  }
  if (self->_duration) {
    objc_msgSend(v13, "setDuration:");
  }
  if ([(HKCodableQuantityDistributionData *)self histogramCountsCount])
  {
    [v13 clearHistogramCounts];
    unint64_t v6 = [(HKCodableQuantityDistributionData *)self histogramCountsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        [(HKCodableQuantityDistributionData *)self histogramCountsAtIndex:i];
        objc_msgSend(v13, "addHistogramCounts:");
      }
    }
  }
  if ([(HKCodableQuantityDistributionData *)self contextIdentifiersCount])
  {
    [v13 clearContextIdentifiers];
    unint64_t v9 = [(HKCodableQuantityDistributionData *)self contextIdentifiersCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        long long v12 = [(HKCodableQuantityDistributionData *)self contextIdentifiersAtIndex:j];
        [v13 addContextIdentifiers:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 40) = self->_startDate;
    *(unsigned char *)(v5 + 96) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 32) = self->_endDate;
    *(unsigned char *)(v5 + 96) |= 1u;
  }
  id v8 = [(HKCodableQuantity *)self->_minimumBucketValue copyWithZone:a3];
  unint64_t v9 = (void *)v6[10];
  v6[10] = v8;

  id v10 = [(HKCodableQuantity *)self->_minimumValue copyWithZone:a3];
  v11 = (void *)v6[11];
  v6[11] = v10;

  id v12 = [(HKCodableQuantity *)self->_maximumValue copyWithZone:a3];
  id v13 = (void *)v6[9];
  v6[9] = v12;

  id v14 = [(HKCodableQuantity *)self->_averageValue copyWithZone:a3];
  long long v15 = (void *)v6[6];
  v6[6] = v14;

  id v16 = [(HKCodableQuantity *)self->_duration copyWithZone:a3];
  uint64_t v17 = (void *)v6[8];
  v6[8] = v16;

  PBRepeatedDoubleCopy();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v18 = self->_contextIdentifiers;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (void)v25);
        [v6 addContextIdentifiers:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v20);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_startDate != *((double *)v4 + 5)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
LABEL_25:
    char v11 = 0;
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_endDate != *((double *)v4 + 4)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_25;
  }
  minimumBucketValue = self->_minimumBucketValue;
  if ((unint64_t)minimumBucketValue | *((void *)v4 + 10)
    && !-[HKCodableQuantity isEqual:](minimumBucketValue, "isEqual:"))
  {
    goto LABEL_25;
  }
  minimumValue = self->_minimumValue;
  if ((unint64_t)minimumValue | *((void *)v4 + 11))
  {
    if (!-[HKCodableQuantity isEqual:](minimumValue, "isEqual:")) {
      goto LABEL_25;
    }
  }
  maximumValue = self->_maximumValue;
  if ((unint64_t)maximumValue | *((void *)v4 + 9))
  {
    if (!-[HKCodableQuantity isEqual:](maximumValue, "isEqual:")) {
      goto LABEL_25;
    }
  }
  averageValue = self->_averageValue;
  if ((unint64_t)averageValue | *((void *)v4 + 6))
  {
    if (!-[HKCodableQuantity isEqual:](averageValue, "isEqual:")) {
      goto LABEL_25;
    }
  }
  duration = self->_duration;
  if ((unint64_t)duration | *((void *)v4 + 8))
  {
    if (!-[HKCodableQuantity isEqual:](duration, "isEqual:")) {
      goto LABEL_25;
    }
  }
  if (!PBRepeatedDoubleIsEqual()) {
    goto LABEL_25;
  }
  contextIdentifiers = self->_contextIdentifiers;
  if ((unint64_t)contextIdentifiers | *((void *)v4 + 7)) {
    char v11 = -[NSMutableArray isEqual:](contextIdentifiers, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_26:

  return v11;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double startDate = self->_startDate;
    double v6 = -startDate;
    if (startDate >= 0.0) {
      double v6 = self->_startDate;
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
  if (has)
  {
    double endDate = self->_endDate;
    double v11 = -endDate;
    if (endDate >= 0.0) {
      double v11 = self->_endDate;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v14 = v9 ^ v4 ^ [(HKCodableQuantity *)self->_minimumBucketValue hash];
  unint64_t v15 = [(HKCodableQuantity *)self->_minimumValue hash];
  unint64_t v16 = v14 ^ v15 ^ [(HKCodableQuantity *)self->_maximumValue hash];
  unint64_t v17 = [(HKCodableQuantity *)self->_averageValue hash];
  unint64_t v18 = v17 ^ [(HKCodableQuantity *)self->_duration hash];
  uint64_t v19 = v16 ^ v18 ^ PBRepeatedDoubleHash();
  return v19 ^ [(NSMutableArray *)self->_contextIdentifiers hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (double *)a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 96);
  if ((v6 & 2) != 0)
  {
    self->_double startDate = v4[5];
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 96);
  }
  if (v6)
  {
    self->_double endDate = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  minimumBucketValue = self->_minimumBucketValue;
  uint64_t v8 = *((void *)v5 + 10);
  if (minimumBucketValue)
  {
    if (v8) {
      -[HKCodableQuantity mergeFrom:](minimumBucketValue, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[HKCodableQuantityDistributionData setMinimumBucketValue:](self, "setMinimumBucketValue:");
  }
  minimumValue = self->_minimumValue;
  uint64_t v10 = *((void *)v5 + 11);
  if (minimumValue)
  {
    if (v10) {
      -[HKCodableQuantity mergeFrom:](minimumValue, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[HKCodableQuantityDistributionData setMinimumValue:](self, "setMinimumValue:");
  }
  maximumValue = self->_maximumValue;
  uint64_t v12 = *((void *)v5 + 9);
  if (maximumValue)
  {
    if (v12) {
      -[HKCodableQuantity mergeFrom:](maximumValue, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[HKCodableQuantityDistributionData setMaximumValue:](self, "setMaximumValue:");
  }
  averageValue = self->_averageValue;
  uint64_t v14 = *((void *)v5 + 6);
  if (averageValue)
  {
    if (v14) {
      -[HKCodableQuantity mergeFrom:](averageValue, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[HKCodableQuantityDistributionData setAverageValue:](self, "setAverageValue:");
  }
  duration = self->_duration;
  uint64_t v16 = *((void *)v5 + 8);
  if (duration)
  {
    if (v16) {
      -[HKCodableQuantity mergeFrom:](duration, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[HKCodableQuantityDistributionData setDuration:](self, "setDuration:");
  }
  uint64_t v17 = [v5 histogramCountsCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t i = 0; i != v18; ++i)
    {
      [v5 histogramCountsAtIndex:i];
      -[HKCodableQuantityDistributionData addHistogramCounts:](self, "addHistogramCounts:");
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = *((id *)v5 + 7);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        -[HKCodableQuantityDistributionData addContextIdentifiers:](self, "addContextIdentifiers:", *(void *)(*((void *)&v25 + 1) + 8 * j), (void)v25);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v22);
  }
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HKCodableQuantity)minimumBucketValue
{
  return self->_minimumBucketValue;
}

- (void)setMinimumBucketValue:(id)a3
{
}

- (HKCodableQuantity)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(id)a3
{
}

- (HKCodableQuantity)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(id)a3
{
}

- (HKCodableQuantity)averageValue
{
  return self->_averageValue;
}

- (void)setAverageValue:(id)a3
{
}

- (HKCodableQuantity)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSMutableArray)contextIdentifiers
{
  return self->_contextIdentifiers;
}

- (void)setContextIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_minimumBucketValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_contextIdentifiers, 0);
  objc_storeStrong((id *)&self->_averageValue, 0);
}

@end