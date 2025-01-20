@interface HDCodableMedicationScheduleCompatibilityVersionRange
- (BOOL)hasMinimum;
- (BOOL)hasOrigin;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)minimum;
- (int64_t)origin;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMinimum:(BOOL)a3;
- (void)setHasOrigin:(BOOL)a3;
- (void)setMinimum:(int64_t)a3;
- (void)setOrigin:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableMedicationScheduleCompatibilityVersionRange

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
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

- (void)setOrigin:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_origin = a3;
}

- (void)setMinimum:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_minimum = a3;
}

- (void)setHasMinimum:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimum
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasOrigin:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOrigin
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableMedicationScheduleCompatibilityVersionRange;
  id v4 = [(HDCodableMedicationScheduleCompatibilityVersionRange *)&v8 description];
  v5 = [(HDCodableMedicationScheduleCompatibilityVersionRange *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:self->_minimum];
    [v3 setObject:v5 forKey:@"minimum"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    id v6 = [MEMORY[0x1E4F28ED0] numberWithLongLong:self->_origin];
    [v3 setObject:v6 forKey:@"origin"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicationScheduleCompatibilityVersionRangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_minimum;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = self->_origin;
    *((unsigned char *)v4 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_minimum;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_origin;
    *((unsigned char *)result + 24) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_minimum != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_origin != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_minimum;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_origin;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_minimum = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_origin = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int64_t)minimum
{
  return self->_minimum;
}

- (int64_t)origin
{
  return self->_origin;
}

@end