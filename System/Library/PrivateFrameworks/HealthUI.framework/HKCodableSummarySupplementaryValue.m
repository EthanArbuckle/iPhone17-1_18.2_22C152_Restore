@interface HKCodableSummarySupplementaryValue
- (BOOL)hasDataCount;
- (BOOL)hasDateInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableDateInterval)dateInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)dataCount;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDataCount:(int64_t)a3;
- (void)setDateInterval:(id)a3;
- (void)setHasDataCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummarySupplementaryValue

- (BOOL)hasDateInterval
{
  return self->_dateInterval != 0;
}

- (void)setDataCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dataCount = a3;
}

- (void)setHasDataCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummarySupplementaryValue;
  v4 = [(HKCodableSummarySupplementaryValue *)&v8 description];
  v5 = [(HKCodableSummarySupplementaryValue *)self dictionaryRepresentation];
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
    v6 = [NSNumber numberWithLongLong:self->_dataCount];
    [v3 setObject:v6 forKey:@"dataCount"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummarySupplementaryValueReadFrom((uint64_t)self, (uint64_t)a3);
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
    *((void *)v4 + 1) = self->_dataCount;
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
    *(void *)(v5 + 8) = self->_dataCount;
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
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_dataCount == *((void *)v4 + 1))
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
    uint64_t v4 = 2654435761 * self->_dataCount;
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
    dateInterval = (HKCodableDateInterval *)-[HKCodableSummarySupplementaryValue setDateInterval:](self, "setDateInterval:");
  }
  uint64_t v4 = v7;
LABEL_7:
  if (v4[3])
  {
    self->_dataCount = v4[1];
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

- (int64_t)dataCount
{
  return self->_dataCount;
}

- (void).cxx_destruct
{
}

@end