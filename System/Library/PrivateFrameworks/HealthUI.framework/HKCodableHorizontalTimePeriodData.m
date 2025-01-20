@interface HKCodableHorizontalTimePeriodData
+ (Class)dateIntervalsType;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)dateIntervals;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateIntervalsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)value;
- (unint64_t)dateIntervalsCount;
- (unint64_t)hash;
- (void)addDateIntervals:(id)a3;
- (void)clearDateIntervals;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateIntervals:(id)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setValue:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableHorizontalTimePeriodData

- (void)setValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearDateIntervals
{
}

- (void)addDateIntervals:(id)a3
{
  id v4 = a3;
  dateIntervals = self->_dateIntervals;
  id v8 = v4;
  if (!dateIntervals)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_dateIntervals;
    self->_dateIntervals = v6;

    id v4 = v8;
    dateIntervals = self->_dateIntervals;
  }
  [(NSMutableArray *)dateIntervals addObject:v4];
}

- (unint64_t)dateIntervalsCount
{
  return [(NSMutableArray *)self->_dateIntervals count];
}

- (id)dateIntervalsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dateIntervals objectAtIndex:a3];
}

+ (Class)dateIntervalsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableHorizontalTimePeriodData;
  id v4 = [(HKCodableHorizontalTimePeriodData *)&v8 description];
  v5 = [(HKCodableHorizontalTimePeriodData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_value];
    [v3 setObject:v4 forKey:@"value"];
  }
  if ([(NSMutableArray *)self->_dateIntervals count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_dateIntervals, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_dateIntervals;
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

    [v3 setObject:v5 forKey:@"dateIntervals"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableHorizontalTimePeriodDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_dateIntervals;
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
    v4[1] = self->_value;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  id v9 = v4;
  if ([(HKCodableHorizontalTimePeriodData *)self dateIntervalsCount])
  {
    [v9 clearDateIntervals];
    unint64_t v5 = [(HKCodableHorizontalTimePeriodData *)self dateIntervalsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(HKCodableHorizontalTimePeriodData *)self dateIntervalsAtIndex:i];
        [v9 addDateIntervals:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_value;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_dateIntervals;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [v6 addDateIntervals:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_value != *((void *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  dateIntervals = self->_dateIntervals;
  if ((unint64_t)dateIntervals | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](dateIntervals, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_value;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSMutableArray *)self->_dateIntervals hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 24))
  {
    self->_value = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[HKCodableHorizontalTimePeriodData addDateIntervals:](self, "addDateIntervals:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (int64_t)value
{
  return self->_value;
}

- (NSMutableArray)dateIntervals
{
  return self->_dateIntervals;
}

- (void)setDateIntervals:(id)a3
{
}

- (void).cxx_destruct
{
}

@end