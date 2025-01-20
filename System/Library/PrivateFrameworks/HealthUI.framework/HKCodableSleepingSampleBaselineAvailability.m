@interface HKCodableSleepingSampleBaselineAvailability
- (BOOL)hasAnalyzedRange;
- (BOOL)hasCount;
- (BOOL)hasRequiredCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableDayIndexRange)analyzedRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)count;
- (int64_t)requiredCount;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnalyzedRange:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasRequiredCount:(BOOL)a3;
- (void)setRequiredCount:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSleepingSampleBaselineAvailability

- (BOOL)hasAnalyzedRange
{
  return self->_analyzedRange != 0;
}

- (void)setCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRequiredCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_requiredCount = a3;
}

- (void)setHasRequiredCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequiredCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSleepingSampleBaselineAvailability;
  v4 = [(HKCodableSleepingSampleBaselineAvailability *)&v8 description];
  v5 = [(HKCodableSleepingSampleBaselineAvailability *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  analyzedRange = self->_analyzedRange;
  if (analyzedRange)
  {
    v5 = [(HKCodableDayIndexRange *)analyzedRange dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"analyzedRange"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithLongLong:self->_count];
    [v3 setObject:v7 forKey:@"count"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_requiredCount];
    [v3 setObject:v8 forKey:@"requiredCount"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSleepingSampleBaselineAvailabilityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_analyzedRange)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_analyzedRange)
  {
    id v6 = v4;
    objc_msgSend(v4, "setAnalyzedRange:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_count;
    *((unsigned char *)v4 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_requiredCount;
    *((unsigned char *)v4 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableDayIndexRange *)self->_analyzedRange copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_count;
    *(unsigned char *)(v5 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_requiredCount;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  analyzedRange = self->_analyzedRange;
  if ((unint64_t)analyzedRange | *((void *)v4 + 3))
  {
    if (!-[HKCodableDayIndexRange isEqual:](analyzedRange, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_count != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_requiredCount != *((void *)v4 + 2)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKCodableDayIndexRange *)self->_analyzedRange hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_count;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_requiredCount;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  analyzedRange = self->_analyzedRange;
  uint64_t v6 = v4[3];
  if (analyzedRange)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_super v8 = v4;
    -[HKCodableDayIndexRange mergeFrom:](analyzedRange, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_super v8 = v4;
    -[HKCodableSleepingSampleBaselineAvailability setAnalyzedRange:](self, "setAnalyzedRange:");
  }
  uint64_t v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 32);
  if (v7)
  {
    self->_count = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 32);
  }
  if ((v7 & 2) != 0)
  {
    self->_requiredCount = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8]();
}

- (HKCodableDayIndexRange)analyzedRange
{
  return self->_analyzedRange;
}

- (void)setAnalyzedRange:(id)a3
{
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)requiredCount
{
  return self->_requiredCount;
}

- (void).cxx_destruct
{
}

@end