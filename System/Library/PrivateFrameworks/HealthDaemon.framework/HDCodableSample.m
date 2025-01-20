@interface HDCodableSample
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasDataType;
- (BOOL)hasEndDate;
- (BOOL)hasObject;
- (BOOL)hasStartDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableHealthObject)object;
- (NSString)description;
- (double)endDate;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)dataType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDataType:(int64_t)a3;
- (void)setEndDate:(double)a3;
- (void)setHasDataType:(BOOL)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setObject:(id)a3;
- (void)setStartDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSample

- (void)setObject:(id)a3
{
}

- (void)setDataType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dataType = a3;
}

- (void)setStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_startDate = a3;
}

- (void)setEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endDate = a3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_object)
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
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_7:
}

- (void).cxx_destruct
{
}

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  v5 = [(HDCodableSample *)self object];
  int v6 = [v5 applyToObject:v4];

  if (!v6) {
    goto LABEL_14;
  }
  double v7 = (*(unsigned char *)&self->_has & 4) != 0 ? self->_startDate : 2.22507386e-308;
  [v4 _setStartTimestamp:v7];
  double v8 = (*(unsigned char *)&self->_has & 2) != 0 ? self->_endDate : 2.22507386e-308;
  [v4 _setEndTimestamp:v8];
  if ((*(unsigned char *)&self->_has & 1) != 0 && (int64_t dataType = self->_dataType, _HKValidDataTypeCode()))
  {
    v10 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:dataType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      [v4 _setSampleType:v10];
    }
  }
  else
  {
LABEL_14:
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (HDCodableHealthObject)object
{
  return self->_object;
}

- (BOOL)hasObject
{
  return self->_object != 0;
}

- (void)setHasDataType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasEndDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSample;
  id v4 = [(HDCodableSample *)&v8 description];
  v5 = [(HDCodableSample *)self dictionaryRepresentation];
  int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  object = self->_object;
  if (object)
  {
    v5 = [(HDCodableHealthObject *)object dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"object"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithLongLong:self->_dataType];
    [v3 setObject:v9 forKey:@"dataType"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  v10 = [NSNumber numberWithDouble:self->_startDate];
  [v3 setObject:v10 forKey:@"startDate"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    double v7 = [NSNumber numberWithDouble:self->_endDate];
    [v3 setObject:v7 forKey:@"endDate"];
  }
LABEL_7:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_object)
  {
    id v6 = v4;
    objc_msgSend(v4, "setObject:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_dataType;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 3) = *(void *)&self->_startDate;
  *((unsigned char *)v4 + 40) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((void *)v4 + 2) = *(void *)&self->_endDate;
    *((unsigned char *)v4 + 40) |= 2u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableHealthObject *)self->_object copyWithZone:a3];
  double v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(double *)(v5 + 24) = self->_startDate;
    *(unsigned char *)(v5 + 40) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 8) = self->_dataType;
  *(unsigned char *)(v5 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_endDate;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  object = self->_object;
  if ((unint64_t)object | *((void *)v4 + 4))
  {
    if (!-[HDCodableHealthObject isEqual:](object, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_dataType != *((void *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_startDate != *((double *)v4 + 3)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_endDate != *((double *)v4 + 2)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableHealthObject *)self->_object hash];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v5 = 2654435761 * self->_dataType;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double startDate = self->_startDate;
  double v7 = -startDate;
  if (startDate >= 0.0) {
    double v7 = self->_startDate;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 2) != 0)
  {
    double endDate = self->_endDate;
    double v13 = -endDate;
    if (endDate >= 0.0) {
      double v13 = self->_endDate;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  object = self->_object;
  uint64_t v6 = *((void *)v4 + 4);
  if (object)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[HDCodableHealthObject mergeFrom:](object, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[HDCodableSample setObject:](self, "setObject:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 40);
  if (v7)
  {
    self->_int64_t dataType = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 40);
    if ((v7 & 4) == 0)
    {
LABEL_9:
      if ((v7 & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_double startDate = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_10:
    self->_double endDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_11:
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

@end