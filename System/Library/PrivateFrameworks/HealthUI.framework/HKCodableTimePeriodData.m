@interface HKCodableTimePeriodData
+ (id)timePeriodDataWithCodableData:(id)a3;
- (BOOL)hasDateInterval;
- (BOOL)hasTotal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableDateInterval)dateInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)total;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setHasTotal:(BOOL)a3;
- (void)setTotal:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableTimePeriodData

- (BOOL)hasDateInterval
{
  return self->_dateInterval != 0;
}

- (void)setTotal:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_total = a3;
}

- (void)setHasTotal:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTotal
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableTimePeriodData;
  v4 = [(HKCodableTimePeriodData *)&v8 description];
  v5 = [(HKCodableTimePeriodData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  dateInterval = self->_dateInterval;
  if (dateInterval)
  {
    v5 = [(HKCodableDateInterval *)dateInterval dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"dateInterval"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_total];
    [v3 setObject:v6 forKey:@"total"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableTimePeriodDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_dateInterval)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_dateInterval)
  {
    id v5 = v4;
    objc_msgSend(v4, "setDateInterval:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_total;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableDateInterval *)self->_dateInterval copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_total;
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
  dateInterval = self->_dateInterval;
  if ((unint64_t)dateInterval | *((void *)v4 + 2))
  {
    if (!-[HKCodableDateInterval isEqual:](dateInterval, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_total == *((void *)v4 + 1))
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
  unint64_t v3 = [(HKCodableDateInterval *)self->_dateInterval hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_total;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  dateInterval = self->_dateInterval;
  uint64_t v6 = v4[2];
  if (dateInterval)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    dateInterval = (HKCodableDateInterval *)-[HKCodableDateInterval mergeFrom:](dateInterval, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    dateInterval = (HKCodableDateInterval *)-[HKCodableTimePeriodData setDateInterval:](self, "setDateInterval:");
  }
  uint64_t v4 = v7;
LABEL_7:
  if (v4[3])
  {
    self->_total = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8](dateInterval, v4);
}

- (HKCodableDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (int64_t)total
{
  return self->_total;
}

- (void).cxx_destruct
{
}

+ (id)timePeriodDataWithCodableData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "total", (void)v17));
        v12 = (void *)MEMORY[0x1E4F28C18];
        v13 = [v10 dateInterval];
        v14 = objc_msgSend(v12, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v13, 0);

        [v4 setObject:v11 forKeyedSubscript:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v15 = (void *)[v4 copy];
  return v15;
}

@end