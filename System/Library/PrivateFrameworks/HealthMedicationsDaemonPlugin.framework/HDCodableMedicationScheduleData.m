@interface HDCodableMedicationScheduleData
- (BOOL)hasCompatibilityVersionRange;
- (BOOL)hasCreationDate;
- (BOOL)hasFutureCompatibilityVersion;
- (BOOL)hasScheduleData;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocallyUnavailable;
- (BOOL)readFrom:(id)a3;
- (HDCodableMedicationScheduleCompatibilityVersionRange)compatibilityVersionRange;
- (NSData)scheduleData;
- (NSData)uuid;
- (double)creationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompatibilityVersionRange:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setScheduleData:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableMedicationScheduleData

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setCreationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCompatibilityVersionRange
{
  return self->_compatibilityVersionRange != 0;
}

- (BOOL)hasScheduleData
{
  return self->_scheduleData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableMedicationScheduleData;
  v4 = [(HDCodableMedicationScheduleData *)&v8 description];
  v5 = [(HDCodableMedicationScheduleData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_creationDate];
    [v4 setObject:v6 forKey:@"creationDate"];
  }
  compatibilityVersionRange = self->_compatibilityVersionRange;
  if (compatibilityVersionRange)
  {
    objc_super v8 = [(HDCodableMedicationScheduleCompatibilityVersionRange *)compatibilityVersionRange dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"compatibilityVersionRange"];
  }
  scheduleData = self->_scheduleData;
  if (scheduleData) {
    [v4 setObject:scheduleData forKey:@"scheduleData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicationScheduleDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_compatibilityVersionRange)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_scheduleData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_creationDate;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_compatibilityVersionRange)
  {
    objc_msgSend(v5, "setCompatibilityVersionRange:");
    id v4 = v5;
  }
  if (self->_scheduleData)
  {
    objc_msgSend(v5, "setScheduleData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_uuid copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_creationDate;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  id v8 = [(HDCodableMedicationScheduleCompatibilityVersionRange *)self->_compatibilityVersionRange copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSData *)self->_scheduleData copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_creationDate != *((double *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  compatibilityVersionRange = self->_compatibilityVersionRange;
  if ((unint64_t)compatibilityVersionRange | *((void *)v4 + 2)
    && !-[HDCodableMedicationScheduleCompatibilityVersionRange isEqual:](compatibilityVersionRange, "isEqual:"))
  {
    goto LABEL_13;
  }
  scheduleData = self->_scheduleData;
  if ((unint64_t)scheduleData | *((void *)v4 + 3)) {
    char v8 = -[NSData isEqual:](scheduleData, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_uuid hash];
  if (*(unsigned char *)&self->_has)
  {
    double creationDate = self->_creationDate;
    double v6 = -creationDate;
    if (creationDate >= 0.0) {
      double v6 = self->_creationDate;
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
  unint64_t v9 = v4 ^ v3;
  unint64_t v10 = [(HDCodableMedicationScheduleCompatibilityVersionRange *)self->_compatibilityVersionRange hash];
  return v9 ^ v10 ^ [(NSData *)self->_scheduleData hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (double *)a3;
  long double v7 = v4;
  if (*((void *)v4 + 4))
  {
    -[HDCodableMedicationScheduleData setUuid:](self, "setUuid:");
    unint64_t v4 = v7;
  }
  if ((_BYTE)v4[5])
  {
    self->_double creationDate = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  compatibilityVersionRange = self->_compatibilityVersionRange;
  uint64_t v6 = *((void *)v4 + 2);
  if (compatibilityVersionRange)
  {
    if (!v6) {
      goto LABEL_11;
    }
    compatibilityVersionRange = (HDCodableMedicationScheduleCompatibilityVersionRange *)-[HDCodableMedicationScheduleCompatibilityVersionRange mergeFrom:](compatibilityVersionRange, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    compatibilityVersionRange = (HDCodableMedicationScheduleCompatibilityVersionRange *)-[HDCodableMedicationScheduleData setCompatibilityVersionRange:](self, "setCompatibilityVersionRange:");
  }
  unint64_t v4 = v7;
LABEL_11:
  if (*((void *)v4 + 3))
  {
    compatibilityVersionRange = (HDCodableMedicationScheduleCompatibilityVersionRange *)-[HDCodableMedicationScheduleData setScheduleData:](self, "setScheduleData:");
    unint64_t v4 = v7;
  }
  MEMORY[0x1F41817F8](compatibilityVersionRange, v4);
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (double)creationDate
{
  return self->_creationDate;
}

- (HDCodableMedicationScheduleCompatibilityVersionRange)compatibilityVersionRange
{
  return self->_compatibilityVersionRange;
}

- (void)setCompatibilityVersionRange:(id)a3
{
}

- (NSData)scheduleData
{
  return self->_scheduleData;
}

- (void)setScheduleData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_scheduleData, 0);
  objc_storeStrong((id *)&self->_compatibilityVersionRange, 0);
}

- (BOOL)isLocallyUnavailable
{
  uint64_t v3 = [(HDCodableMedicationScheduleData *)self compatibilityVersionRange];
  uint64_t v4 = [v3 minimum];
  uint64_t v5 = [(HDCodableMedicationScheduleData *)self compatibilityVersionRange];
  LOBYTE(v4) = v4 > [v5 origin];

  return v4;
}

- (BOOL)hasFutureCompatibilityVersion
{
  v2 = [(HDCodableMedicationScheduleData *)self compatibilityVersionRange];
  BOOL v3 = [v2 minimum] > 1;

  return v3;
}

@end