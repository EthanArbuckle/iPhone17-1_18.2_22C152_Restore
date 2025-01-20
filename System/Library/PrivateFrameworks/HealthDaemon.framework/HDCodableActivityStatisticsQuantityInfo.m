@interface HDCodableActivityStatisticsQuantityInfo
- (BOOL)hasEndDate;
- (BOOL)hasStartDate;
- (BOOL)hasUnit;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)unit;
- (double)endDate;
- (double)startDate;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndDate:(double)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setStartDate:(double)a3;
- (void)setUnit:(id)a3;
- (void)setValue:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableActivityStatisticsQuantityInfo

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

- (BOOL)hasUnit
{
  return self->_unit != 0;
}

- (void)setValue:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableActivityStatisticsQuantityInfo;
  v4 = [(HDCodableActivityStatisticsQuantityInfo *)&v8 description];
  v5 = [(HDCodableActivityStatisticsQuantityInfo *)self dictionaryRepresentation];
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
  unit = self->_unit;
  if (unit) {
    [v3 setObject:unit forKey:@"unit"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_value];
    [v3 setObject:v8 forKey:@"value"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableActivityStatisticsQuantityInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_unit) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_startDate;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[1] = *(void *)&self->_endDate;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_unit)
  {
    v6 = v4;
    objc_msgSend(v4, "setUnit:");
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[3] = *(void *)&self->_value;
    *((unsigned char *)v4 + 40) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_startDate;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_endDate;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_unit copyWithZone:a3];
  v9 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(double *)(v6 + 24) = self->_value;
    *(unsigned char *)(v6 + 40) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 40);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_startDate != *((double *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_endDate != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_19;
  }
  unit = self->_unit;
  if ((unint64_t)unit | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](unit, "isEqual:"))
    {
LABEL_19:
      BOOL v8 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 40);
  }
  BOOL v8 = (v6 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_value != *((double *)v4 + 3)) {
      goto LABEL_19;
    }
    BOOL v8 = 1;
  }
LABEL_20:

  return v8;
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
  NSUInteger v14 = [(NSString *)self->_unit hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    double value = self->_value;
    double v17 = -value;
    if (value >= 0.0) {
      double v17 = self->_value;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  return v9 ^ v4 ^ v15 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_double startDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if (v5)
  {
    self->_double endDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    id v6 = v4;
    -[HDCodableActivityStatisticsQuantityInfo setUnit:](self, "setUnit:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    self->_double value = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
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

- (NSString)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (double)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end