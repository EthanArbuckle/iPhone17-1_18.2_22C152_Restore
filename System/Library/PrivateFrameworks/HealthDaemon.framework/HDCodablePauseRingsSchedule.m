@interface HDCodablePauseRingsSchedule
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasEndDateIndex;
- (BOOL)hasSample;
- (BOOL)hasStartDateIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)endDateIndex;
- (int64_t)startDateIndex;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndDateIndex:(int64_t)a3;
- (void)setHasEndDateIndex:(BOOL)a3;
- (void)setHasStartDateIndex:(BOOL)a3;
- (void)setSample:(id)a3;
- (void)setStartDateIndex:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodablePauseRingsSchedule

- (BOOL)applyToObject:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v14 = 0;
  id v4 = a3;
  if (self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HDCodablePauseRingsSchedule *)self sample];
      char v6 = [v5 applyToObject:v4];

      if (v6)
      {
        if ([(HDCodablePauseRingsSchedule *)self hasStartDateIndex]) {
          objc_msgSend(v4, "setStartDateIndex:", -[HDCodablePauseRingsSchedule startDateIndex](self, "startDateIndex"));
        }
        if ([(HDCodablePauseRingsSchedule *)self hasEndDateIndex]) {
          objc_msgSend(v4, "setEndDateIndex:", -[HDCodablePauseRingsSchedule endDateIndex](self, "endDateIndex"));
        }

        id v7 = 0;
        BOOL v8 = 1;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v14, 3, @"Failed to decode superclass message");
    }
    else
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      objc_msgSend(v9, "hk_assignError:code:format:", &v14, 3, @"Unexpected class %@", v11);
    }
  }

  id v7 = v14;
  _HKInitializeLogging();
  v12 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v7;
    _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "Failed to decode object of type HKPauseRingsSchedule with error %@", buf, 0xCu);
  }
  BOOL v8 = 0;
LABEL_14:

  return v8;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setStartDateIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_startDateIndex = a3;
}

- (void)setHasStartDateIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartDateIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEndDateIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_endDateIndex = a3;
}

- (void)setHasEndDateIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndDateIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodablePauseRingsSchedule;
  id v4 = [(HDCodablePauseRingsSchedule *)&v8 description];
  v5 = [(HDCodablePauseRingsSchedule *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    id v7 = [NSNumber numberWithLongLong:self->_startDateIndex];
    [v3 setObject:v7 forKey:@"startDateIndex"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_endDateIndex];
    [v3 setObject:v8 forKey:@"endDateIndex"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodablePauseRingsScheduleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_sample)
  {
    id v6 = v4;
    objc_msgSend(v4, "setSample:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_startDateIndex;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_endDateIndex;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  id v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_startDateIndex;
    *(unsigned char *)(v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_endDateIndex;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 3))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_startDateIndex != *((void *)v4 + 2)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_endDateIndex != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableSample *)self->_sample hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_startDateIndex;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_endDateIndex;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  sample = self->_sample;
  uint64_t v6 = v4[3];
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_super v8 = v4;
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_super v8 = v4;
    -[HDCodablePauseRingsSchedule setSample:](self, "setSample:");
  }
  uint64_t v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 32);
  if ((v7 & 2) != 0)
  {
    self->_startDateIndex = v4[2];
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 32);
  }
  if (v7)
  {
    self->_endDateIndex = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (int64_t)startDateIndex
{
  return self->_startDateIndex;
}

- (int64_t)endDateIndex
{
  return self->_endDateIndex;
}

- (void).cxx_destruct
{
}

@end