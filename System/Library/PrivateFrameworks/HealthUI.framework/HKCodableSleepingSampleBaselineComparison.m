@interface HKCodableSleepingSampleBaselineComparison
- (BOOL)hasAggregate;
- (BOOL)hasAvailability;
- (BOOL)hasBaseline;
- (BOOL)hasDataType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableSleepingSampleAggregate)aggregate;
- (HKCodableSleepingSampleBaseline)baseline;
- (HKCodableSleepingSampleBaselineAvailability)availability;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)dataType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAggregate:(id)a3;
- (void)setAvailability:(id)a3;
- (void)setBaseline:(id)a3;
- (void)setDataType:(int64_t)a3;
- (void)setHasDataType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSleepingSampleBaselineComparison

- (void)setDataType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dataType = a3;
}

- (void)setHasDataType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBaseline
{
  return self->_baseline != 0;
}

- (BOOL)hasAggregate
{
  return self->_aggregate != 0;
}

- (BOOL)hasAvailability
{
  return self->_availability != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSleepingSampleBaselineComparison;
  v4 = [(HKCodableSleepingSampleBaselineComparison *)&v8 description];
  v5 = [(HKCodableSleepingSampleBaselineComparison *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithLongLong:self->_dataType];
    [v3 setObject:v4 forKey:@"dataType"];
  }
  baseline = self->_baseline;
  if (baseline)
  {
    v6 = [(HKCodableSleepingSampleBaseline *)baseline dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"baseline"];
  }
  aggregate = self->_aggregate;
  if (aggregate)
  {
    objc_super v8 = [(HKCodableSleepingSampleAggregate *)aggregate dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"aggregate"];
  }
  availability = self->_availability;
  if (availability)
  {
    v10 = [(HKCodableSleepingSampleBaselineAvailability *)availability dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"availability"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSleepingSampleBaselineComparisonReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_baseline)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_aggregate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_availability)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_dataType;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_baseline)
  {
    objc_msgSend(v4, "setBaseline:");
    id v4 = v5;
  }
  if (self->_aggregate)
  {
    objc_msgSend(v5, "setAggregate:");
    id v4 = v5;
  }
  if (self->_availability)
  {
    objc_msgSend(v5, "setAvailability:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_dataType;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  id v7 = [(HKCodableSleepingSampleBaseline *)self->_baseline copyWithZone:a3];
  objc_super v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(HKCodableSleepingSampleAggregate *)self->_aggregate copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(HKCodableSleepingSampleBaselineAvailability *)self->_availability copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_dataType != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  baseline = self->_baseline;
  if ((unint64_t)baseline | *((void *)v4 + 4)
    && !-[HKCodableSleepingSampleBaseline isEqual:](baseline, "isEqual:"))
  {
    goto LABEL_13;
  }
  aggregate = self->_aggregate;
  if ((unint64_t)aggregate | *((void *)v4 + 2))
  {
    if (!-[HKCodableSleepingSampleAggregate isEqual:](aggregate, "isEqual:")) {
      goto LABEL_13;
    }
  }
  availability = self->_availability;
  if ((unint64_t)availability | *((void *)v4 + 3)) {
    char v8 = -[HKCodableSleepingSampleBaselineAvailability isEqual:](availability, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_dataType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(HKCodableSleepingSampleBaseline *)self->_baseline hash] ^ v3;
  unint64_t v5 = [(HKCodableSleepingSampleAggregate *)self->_aggregate hash];
  return v4 ^ v5 ^ [(HKCodableSleepingSampleBaselineAvailability *)self->_availability hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  unint64_t v5 = v4;
  if (v4[5])
  {
    self->_dataType = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  baseline = self->_baseline;
  uint64_t v7 = v5[4];
  v12 = v5;
  if (baseline)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[HKCodableSleepingSampleBaseline mergeFrom:](baseline, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[HKCodableSleepingSampleBaselineComparison setBaseline:](self, "setBaseline:");
  }
  unint64_t v5 = v12;
LABEL_9:
  aggregate = self->_aggregate;
  uint64_t v9 = v5[2];
  if (aggregate)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[HKCodableSleepingSampleAggregate mergeFrom:](aggregate, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[HKCodableSleepingSampleBaselineComparison setAggregate:](self, "setAggregate:");
  }
  unint64_t v5 = v12;
LABEL_15:
  availability = self->_availability;
  uint64_t v11 = v5[3];
  if (availability)
  {
    if (!v11) {
      goto LABEL_21;
    }
    availability = (HKCodableSleepingSampleBaselineAvailability *)-[HKCodableSleepingSampleBaselineAvailability mergeFrom:](availability, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    availability = (HKCodableSleepingSampleBaselineAvailability *)-[HKCodableSleepingSampleBaselineComparison setAvailability:](self, "setAvailability:");
  }
  unint64_t v5 = v12;
LABEL_21:
  MEMORY[0x1F41817F8](availability, v5);
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (HKCodableSleepingSampleBaseline)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(id)a3
{
}

- (HKCodableSleepingSampleAggregate)aggregate
{
  return self->_aggregate;
}

- (void)setAggregate:(id)a3
{
}

- (HKCodableSleepingSampleBaselineAvailability)availability
{
  return self->_availability;
}

- (void)setAvailability:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseline, 0);
  objc_storeStrong((id *)&self->_availability, 0);
  objc_storeStrong((id *)&self->_aggregate, 0);
}

@end