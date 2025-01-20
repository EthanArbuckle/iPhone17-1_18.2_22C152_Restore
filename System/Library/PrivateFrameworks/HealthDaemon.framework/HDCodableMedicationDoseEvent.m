@interface HDCodableMedicationDoseEvent
- (BOOL)applyToObject:(id)a3;
- (BOOL)applyToObject:(id)a3 error:(id *)a4;
- (BOOL)hasDoseQuantity;
- (BOOL)hasLogOrigin;
- (BOOL)hasMedicationIdentifier;
- (BOOL)hasMedicationUuid;
- (BOOL)hasSample;
- (BOOL)hasScheduleItemIdentifier;
- (BOOL)hasScheduledDate;
- (BOOL)hasScheduledDoseQuantity;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSData)medicationUuid;
- (NSString)description;
- (NSString)medicationIdentifier;
- (NSString)scheduleItemIdentifier;
- (double)doseQuantity;
- (double)scheduledDate;
- (double)scheduledDoseQuantity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)logOrigin;
- (int64_t)status;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDoseQuantity:(double)a3;
- (void)setHasDoseQuantity:(BOOL)a3;
- (void)setHasLogOrigin:(BOOL)a3;
- (void)setHasScheduledDate:(BOOL)a3;
- (void)setHasScheduledDoseQuantity:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setLogOrigin:(int64_t)a3;
- (void)setMedicationIdentifier:(id)a3;
- (void)setMedicationUuid:(id)a3;
- (void)setSample:(id)a3;
- (void)setScheduleItemIdentifier:(id)a3;
- (void)setScheduledDate:(double)a3;
- (void)setScheduledDoseQuantity:(double)a3;
- (void)setStatus:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableMedicationDoseEvent

- (BOOL)applyToObject:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  BOOL v3 = [(HDCodableMedicationDoseEvent *)self applyToObject:a3 error:&v7];
  id v4 = v7;
  if (!v3)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Failed to decode object of type HKMedicationDoseEvent with error %@", buf, 0xCu);
    }
  }

  return v3;
}

- (BOOL)applyToObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    objc_msgSend(v21, "hk_assignError:code:format:", a4, 3, @"Unexpected class %@", v23);

LABEL_16:
    BOOL v14 = 0;
    goto LABEL_21;
  }
  id v7 = [(HDCodableMedicationDoseEvent *)self sample];
  char v8 = [v7 applyToObject:v6];

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Failed to decode superclass message");
    goto LABEL_16;
  }
  objc_msgSend(v6, "_setLogOrigin:", -[HDCodableMedicationDoseEvent logOrigin](self, "logOrigin"));
  if ([(HDCodableMedicationDoseEvent *)self hasScheduleItemIdentifier])
  {
    id v9 = [(HDCodableMedicationDoseEvent *)self scheduleItemIdentifier];
    [v6 _setScheduleItemIdentifier:v9];
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F29128];
  v11 = [(HDCodableMedicationDoseEvent *)self medicationUuid];
  v12 = objc_msgSend(v10, "hk_UUIDWithData:", v11);

  if (v12)
  {
    [v6 _setMedicationUUID:v12];
    v13 = [(HDCodableMedicationDoseEvent *)self medicationIdentifier];
    BOOL v14 = v13 != 0;
    if (v13)
    {
      [v6 _setMedicationIdentifier:v13];
      if ([(HDCodableMedicationDoseEvent *)self hasScheduledDoseQuantity])
      {
        v15 = NSNumber;
        [(HDCodableMedicationDoseEvent *)self scheduledDoseQuantity];
        v16 = objc_msgSend(v15, "numberWithDouble:");
        [v6 _setScheduledDoseQuantity:v16];
      }
      if ([(HDCodableMedicationDoseEvent *)self hasDoseQuantity])
      {
        v17 = NSNumber;
        [(HDCodableMedicationDoseEvent *)self doseQuantity];
        v18 = objc_msgSend(v17, "numberWithDouble:");
        [v6 _setDoseQuantity:v18];
      }
      if ([(HDCodableMedicationDoseEvent *)self hasScheduledDate])
      {
        v19 = (void *)MEMORY[0x1E4F1C9C8];
        [(HDCodableMedicationDoseEvent *)self scheduledDate];
        v20 = objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
        [v6 _setScheduledDate:v20];
      }
      objc_msgSend(v6, "_setStatus:", -[HDCodableMedicationDoseEvent status](self, "status"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Received nil for non-nil field 'medicationIdentifier'");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Received nil for non-nil field 'medicationUUID'");
    BOOL v14 = 0;
  }

LABEL_21:
  return v14;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setLogOrigin:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_logOrigin = a3;
}

- (void)setHasLogOrigin:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLogOrigin
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasScheduleItemIdentifier
{
  return self->_scheduleItemIdentifier != 0;
}

- (BOOL)hasMedicationIdentifier
{
  return self->_medicationIdentifier != 0;
}

- (void)setScheduledDoseQuantity:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_scheduledDoseQuantity = a3;
}

- (void)setHasScheduledDoseQuantity:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasScheduledDoseQuantity
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDoseQuantity:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_doseQuantity = a3;
}

- (void)setHasDoseQuantity:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoseQuantity
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScheduledDate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_scheduledDate = a3;
}

- (void)setHasScheduledDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScheduledDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setStatus:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasMedicationUuid
{
  return self->_medicationUuid != 0;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableMedicationDoseEvent;
  id v4 = [(HDCodableMedicationDoseEvent *)&v8 description];
  v5 = [(HDCodableMedicationDoseEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v6 = [NSNumber numberWithLongLong:self->_logOrigin];
    [v3 setObject:v6 forKey:@"logOrigin"];
  }
  scheduleItemIdentifier = self->_scheduleItemIdentifier;
  if (scheduleItemIdentifier) {
    [v3 setObject:scheduleItemIdentifier forKey:@"scheduleItemIdentifier"];
  }
  medicationIdentifier = self->_medicationIdentifier;
  if (medicationIdentifier) {
    [v3 setObject:medicationIdentifier forKey:@"medicationIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v13 = [NSNumber numberWithDouble:self->_scheduledDoseQuantity];
    [v3 setObject:v13 forKey:@"scheduledDoseQuantity"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  BOOL v14 = [NSNumber numberWithDouble:self->_doseQuantity];
  [v3 setObject:v14 forKey:@"doseQuantity"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_21:
  v15 = [NSNumber numberWithDouble:self->_scheduledDate];
  [v3 setObject:v15 forKey:@"scheduledDate"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    uint64_t v10 = [NSNumber numberWithLongLong:self->_status];
    [v3 setObject:v10 forKey:@"status"];
  }
LABEL_14:
  medicationUuid = self->_medicationUuid;
  if (medicationUuid) {
    [v3 setObject:medicationUuid forKey:@"medicationUuid"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicationDoseEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_scheduleItemIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_medicationIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_14:
  if (self->_medicationUuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_logOrigin;
    *((unsigned char *)v4 + 80) |= 2u;
  }
  if (self->_scheduleItemIdentifier)
  {
    objc_msgSend(v6, "setScheduleItemIdentifier:");
    id v4 = v6;
  }
  if (self->_medicationIdentifier)
  {
    objc_msgSend(v6, "setMedicationIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)v4 + 4) = *(void *)&self->_scheduledDoseQuantity;
    *((unsigned char *)v4 + 80) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  *((void *)v4 + 1) = *(void *)&self->_doseQuantity;
  *((unsigned char *)v4 + 80) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_21:
  *((void *)v4 + 3) = *(void *)&self->_scheduledDate;
  *((unsigned char *)v4 + 80) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    *((void *)v4 + 5) = self->_status;
    *((unsigned char *)v4 + 80) |= 0x10u;
  }
LABEL_14:
  if (self->_medicationUuid)
  {
    objc_msgSend(v6, "setMedicationUuid:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  id v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_logOrigin;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_scheduleItemIdentifier copyWithZone:a3];
  id v9 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v8;

  uint64_t v10 = [(NSString *)self->_medicationIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_scheduledDoseQuantity;
    *(unsigned char *)(v5 + 80) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(double *)(v5 + 24) = self->_scheduledDate;
      *(unsigned char *)(v5 + 80) |= 4u;
      if ((*(unsigned char *)&self->_has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 8) = self->_doseQuantity;
  *(unsigned char *)(v5 + 80) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    *(void *)(v5 + 40) = self->_status;
    *(unsigned char *)(v5 + 80) |= 0x10u;
  }
LABEL_8:
  uint64_t v13 = [(NSData *)self->_medicationUuid copyWithZone:a3];
  BOOL v14 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 8))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_logOrigin != *((void *)v4 + 2)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
LABEL_35:
    char v9 = 0;
    goto LABEL_36;
  }
  scheduleItemIdentifier = self->_scheduleItemIdentifier;
  if ((unint64_t)scheduleItemIdentifier | *((void *)v4 + 9)
    && !-[NSString isEqual:](scheduleItemIdentifier, "isEqual:"))
  {
    goto LABEL_35;
  }
  medicationIdentifier = self->_medicationIdentifier;
  if ((unint64_t)medicationIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](medicationIdentifier, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 8) == 0 || self->_scheduledDoseQuantity != *((double *)v4 + 4)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 8) != 0)
  {
    goto LABEL_35;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_doseQuantity != *((double *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_scheduledDate != *((double *)v4 + 3)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x10) == 0 || self->_status != *((void *)v4 + 5)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_35;
  }
  medicationUuid = self->_medicationUuid;
  if ((unint64_t)medicationUuid | *((void *)v4 + 7)) {
    char v9 = -[NSData isEqual:](medicationUuid, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_36:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableSample *)self->_sample hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_logOrigin;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_scheduleItemIdentifier hash];
  NSUInteger v6 = [(NSString *)self->_medicationIdentifier hash];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    double scheduledDoseQuantity = self->_scheduledDoseQuantity;
    double v10 = -scheduledDoseQuantity;
    if (scheduledDoseQuantity >= 0.0) {
      double v10 = self->_scheduledDoseQuantity;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  if (has)
  {
    double doseQuantity = self->_doseQuantity;
    double v15 = -doseQuantity;
    if (doseQuantity >= 0.0) {
      double v15 = self->_doseQuantity;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  if ((has & 4) != 0)
  {
    double scheduledDate = self->_scheduledDate;
    double v20 = -scheduledDate;
    if (scheduledDate >= 0.0) {
      double v20 = self->_scheduledDate;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v18 += (unint64_t)v22;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  if ((has & 0x10) != 0) {
    uint64_t v23 = 2654435761 * self->_status;
  }
  else {
    uint64_t v23 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13 ^ v18 ^ v23 ^ [(NSData *)self->_medicationUuid hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 8);
  id v8 = v4;
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableMedicationDoseEvent setSample:](self, "setSample:");
  }
  id v4 = v8;
LABEL_7:
  if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    self->_logOrigin = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 9))
  {
    -[HDCodableMedicationDoseEvent setScheduleItemIdentifier:](self, "setScheduleItemIdentifier:");
    id v4 = v8;
  }
  if (*((void *)v4 + 6))
  {
    -[HDCodableMedicationDoseEvent setMedicationIdentifier:](self, "setMedicationIdentifier:");
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 80);
  if ((v7 & 8) != 0)
  {
    self->_double scheduledDoseQuantity = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v7 = *((unsigned char *)v4 + 80);
    if ((v7 & 1) == 0)
    {
LABEL_15:
      if ((v7 & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 1) == 0)
  {
    goto LABEL_15;
  }
  self->_double doseQuantity = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v7 = *((unsigned char *)v4 + 80);
  if ((v7 & 4) == 0)
  {
LABEL_16:
    if ((v7 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_25:
  self->_double scheduledDate = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 80) & 0x10) != 0)
  {
LABEL_17:
    self->_status = *((void *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_18:
  if (*((void *)v4 + 7))
  {
    -[HDCodableMedicationDoseEvent setMedicationUuid:](self, "setMedicationUuid:");
    id v4 = v8;
  }
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (int64_t)logOrigin
{
  return self->_logOrigin;
}

- (NSString)scheduleItemIdentifier
{
  return self->_scheduleItemIdentifier;
}

- (void)setScheduleItemIdentifier:(id)a3
{
}

- (NSString)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (void)setMedicationIdentifier:(id)a3
{
}

- (double)scheduledDoseQuantity
{
  return self->_scheduledDoseQuantity;
}

- (double)doseQuantity
{
  return self->_doseQuantity;
}

- (double)scheduledDate
{
  return self->_scheduledDate;
}

- (int64_t)status
{
  return self->_status;
}

- (NSData)medicationUuid
{
  return self->_medicationUuid;
}

- (void)setMedicationUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleItemIdentifier, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_medicationUuid, 0);

  objc_storeStrong((id *)&self->_medicationIdentifier, 0);
}

@end