@interface HDCodableMedicationSchedule
+ (Class)intervalDataType;
- (BOOL)deleted;
- (BOOL)duplicate;
- (BOOL)hasCompatibilityVersionRange;
- (BOOL)hasCreatedTimeZone;
- (BOOL)hasCreationDate;
- (BOOL)hasCycleStartDateComponents;
- (BOOL)hasDeleted;
- (BOOL)hasDisplayOptions;
- (BOOL)hasDuplicate;
- (BOOL)hasEndDateTime;
- (BOOL)hasFrequencyType;
- (BOOL)hasMedicationIdentifier;
- (BOOL)hasMedicationUUID;
- (BOOL)hasNote;
- (BOOL)hasScheduleType;
- (BOOL)hasStartDateTime;
- (BOOL)hasSyncIdentity;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableDateComponents)cycleStartDateComponents;
- (HDCodableMedicationScheduleCompatibilityVersionRange)compatibilityVersionRange;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)medicationUUID;
- (NSData)uuid;
- (NSMutableArray)intervalDatas;
- (NSString)createdTimeZone;
- (NSString)medicationIdentifier;
- (NSString)note;
- (double)creationDate;
- (double)endDateTime;
- (double)frequencyType;
- (double)startDateTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedMedicationUUID;
- (id)decodedUUID;
- (id)description;
- (id)dictionaryRepresentation;
- (id)intervalDataAtIndex:(unint64_t)a3;
- (int64_t)displayOptions;
- (int64_t)scheduleType;
- (unint64_t)hash;
- (unint64_t)intervalDatasCount;
- (void)addIntervalData:(id)a3;
- (void)clearIntervalDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompatibilityVersionRange:(id)a3;
- (void)setCreatedTimeZone:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setCycleStartDateComponents:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setDisplayOptions:(int64_t)a3;
- (void)setDuplicate:(BOOL)a3;
- (void)setEndDateTime:(double)a3;
- (void)setFrequencyType:(double)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasDisplayOptions:(BOOL)a3;
- (void)setHasDuplicate:(BOOL)a3;
- (void)setHasEndDateTime:(BOOL)a3;
- (void)setHasFrequencyType:(BOOL)a3;
- (void)setHasScheduleType:(BOOL)a3;
- (void)setHasStartDateTime:(BOOL)a3;
- (void)setIntervalDatas:(id)a3;
- (void)setMedicationIdentifier:(id)a3;
- (void)setMedicationUUID:(id)a3;
- (void)setNote:(id)a3;
- (void)setScheduleType:(int64_t)a3;
- (void)setStartDateTime:(double)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableMedicationSchedule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_medicationUUID, 0);
  objc_storeStrong((id *)&self->_medicationIdentifier, 0);
  objc_storeStrong((id *)&self->_intervalDatas, 0);
  objc_storeStrong((id *)&self->_cycleStartDateComponents, 0);
  objc_storeStrong((id *)&self->_createdTimeZone, 0);
  objc_storeStrong((id *)&self->_compatibilityVersionRange, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuid) {
    PBDataWriterWriteDataField();
  }
  if (self->_medicationIdentifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_createdTimeZone) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_cycleStartDateComponents) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_note) {
    PBDataWriterWriteStringField();
  }
  if (self->_medicationUUID) {
    PBDataWriterWriteDataField();
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    PBDataWriterWriteDoubleField();
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_syncIdentity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_compatibilityVersionRange) {
    PBDataWriterWriteSubmessage();
  }
  char v7 = (char)self->_has;
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteInt64Field();
    char v7 = (char)self->_has;
  }
  if ((v7 & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = self->_intervalDatas;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)setUuid:(id)a3
{
}

- (void)setStartDateTime:(double)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_startDateTime = a3;
}

- (void)setScheduleType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_scheduleType = a3;
}

- (void)setNote:(id)a3
{
}

- (void)setMedicationUUID:(id)a3
{
}

- (void)setMedicationIdentifier:(id)a3
{
}

- (void)setIntervalDatas:(id)a3
{
}

- (void)setFrequencyType:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_frequencyType = a3;
}

- (void)setEndDateTime:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_endDateTime = a3;
}

- (void)setDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_deleted = a3;
}

- (void)setCycleStartDateComponents:(id)a3
{
}

- (void)setCreationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setCreatedTimeZone:(id)a3
{
}

- (void)setCompatibilityVersionRange:(id)a3
{
}

- (id)decodedUUID
{
  if (self->_uuid)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:");
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)decodedMedicationUUID
{
  if (self->_medicationUUID)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:");
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasMedicationIdentifier
{
  return self->_medicationIdentifier != 0;
}

- (void)setHasStartDateTime:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStartDateTime
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasEndDateTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndDateTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasCreatedTimeZone
{
  return self->_createdTimeZone != 0;
}

- (void)setHasFrequencyType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFrequencyType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasCycleStartDateComponents
{
  return self->_cycleStartDateComponents != 0;
}

- (BOOL)hasNote
{
  return self->_note != 0;
}

- (BOOL)hasMedicationUUID
{
  return self->_medicationUUID != 0;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasDeleted
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (BOOL)hasCompatibilityVersionRange
{
  return self->_compatibilityVersionRange != 0;
}

- (void)setHasScheduleType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasScheduleType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDisplayOptions:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_displayOptions = a3;
}

- (void)setHasDisplayOptions:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDisplayOptions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearIntervalDatas
{
}

- (void)addIntervalData:(id)a3
{
  id v4 = a3;
  intervalDatas = self->_intervalDatas;
  id v8 = v4;
  if (!intervalDatas)
  {
    char v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v7 = self->_intervalDatas;
    self->_intervalDatas = v6;

    id v4 = v8;
    intervalDatas = self->_intervalDatas;
  }
  [(NSMutableArray *)intervalDatas addObject:v4];
}

- (unint64_t)intervalDatasCount
{
  return [(NSMutableArray *)self->_intervalDatas count];
}

- (id)intervalDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_intervalDatas objectAtIndex:a3];
}

+ (Class)intervalDataType
{
  return (Class)objc_opt_class();
}

- (void)setDuplicate:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_duplicate = a3;
}

- (void)setHasDuplicate:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasDuplicate
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableMedicationSchedule;
  id v4 = [(HDCodableMedicationSchedule *)&v8 description];
  v5 = [(HDCodableMedicationSchedule *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  medicationIdentifier = self->_medicationIdentifier;
  if (medicationIdentifier) {
    [v4 setObject:medicationIdentifier forKey:@"medicationIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_super v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_startDateTime];
    [v4 setObject:v8 forKey:@"startDateTime"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_endDateTime];
    [v4 setObject:v9 forKey:@"endDateTime"];
  }
  createdTimeZone = self->_createdTimeZone;
  if (createdTimeZone) {
    [v4 setObject:createdTimeZone forKey:@"createdTimeZone"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_frequencyType];
    [v4 setObject:v11 forKey:@"frequencyType"];
  }
  cycleStartDateComponents = self->_cycleStartDateComponents;
  if (cycleStartDateComponents)
  {
    long long v13 = [(HDCodableDateComponents *)cycleStartDateComponents dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"cycleStartDateComponents"];
  }
  note = self->_note;
  if (note) {
    [v4 setObject:note forKey:@"note"];
  }
  medicationUUID = self->_medicationUUID;
  if (medicationUUID) {
    [v4 setObject:medicationUUID forKey:@"medicationUUID"];
  }
  char v16 = (char)self->_has;
  if (v16)
  {
    v17 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_creationDate];
    [v4 setObject:v17 forKey:@"creationDate"];

    char v16 = (char)self->_has;
  }
  if ((v16 & 0x40) != 0)
  {
    uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_deleted];
    [v4 setObject:v18 forKey:@"deleted"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v20 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"syncIdentity"];
  }
  compatibilityVersionRange = self->_compatibilityVersionRange;
  if (compatibilityVersionRange)
  {
    v22 = [(HDCodableMedicationScheduleCompatibilityVersionRange *)compatibilityVersionRange dictionaryRepresentation];
    [v4 setObject:v22 forKey:@"compatibilityVersionRange"];
  }
  char v23 = (char)self->_has;
  if ((v23 & 0x10) != 0)
  {
    v24 = [MEMORY[0x1E4F28ED0] numberWithLongLong:self->_scheduleType];
    [v4 setObject:v24 forKey:@"scheduleType"];

    char v23 = (char)self->_has;
  }
  if ((v23 & 2) != 0)
  {
    v25 = [MEMORY[0x1E4F28ED0] numberWithLongLong:self->_displayOptions];
    [v4 setObject:v25 forKey:@"displayOptions"];
  }
  if ([(NSMutableArray *)self->_intervalDatas count])
  {
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_intervalDatas, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v27 = self->_intervalDatas;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v36 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "dictionaryRepresentation", (void)v35);
          [v26 addObject:v32];
        }
        uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v29);
    }

    [v4 setObject:v26 forKey:@"intervalData"];
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v33 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_duplicate];
    [v4 setObject:v33 forKey:@"duplicate"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicationScheduleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v12 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v12;
  }
  if (self->_medicationIdentifier)
  {
    objc_msgSend(v12, "setMedicationIdentifier:");
    id v4 = v12;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((void *)v4 + 6) = *(void *)&self->_startDateTime;
    v4[132] |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_endDateTime;
    v4[132] |= 4u;
  }
  if (self->_createdTimeZone)
  {
    objc_msgSend(v12, "setCreatedTimeZone:");
    id v4 = v12;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((void *)v4 + 4) = *(void *)&self->_frequencyType;
    v4[132] |= 8u;
  }
  if (self->_cycleStartDateComponents)
  {
    objc_msgSend(v12, "setCycleStartDateComponents:");
    id v4 = v12;
  }
  if (self->_note)
  {
    objc_msgSend(v12, "setNote:");
    id v4 = v12;
  }
  if (self->_medicationUUID)
  {
    objc_msgSend(v12, "setMedicationUUID:");
    id v4 = v12;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    *((void *)v4 + 1) = *(void *)&self->_creationDate;
    v4[132] |= 1u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    v4[128] = self->_deleted;
    v4[132] |= 0x40u;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v12, "setSyncIdentity:");
    id v4 = v12;
  }
  if (self->_compatibilityVersionRange)
  {
    objc_msgSend(v12, "setCompatibilityVersionRange:");
    id v4 = v12;
  }
  char v7 = (char)self->_has;
  if ((v7 & 0x10) != 0)
  {
    *((void *)v4 + 5) = self->_scheduleType;
    v4[132] |= 0x10u;
    char v7 = (char)self->_has;
  }
  if ((v7 & 2) != 0)
  {
    *((void *)v4 + 2) = self->_displayOptions;
    v4[132] |= 2u;
  }
  if ([(HDCodableMedicationSchedule *)self intervalDatasCount])
  {
    [v12 clearIntervalDatas];
    unint64_t v8 = [(HDCodableMedicationSchedule *)self intervalDatasCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
      {
        uint64_t v11 = [(HDCodableMedicationSchedule *)self intervalDataAtIndex:i];
        [v12 addIntervalData:v11];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v12[129] = self->_duplicate;
    v12[132] |= 0x80u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_uuid copyWithZone:a3];
  char v7 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v6;

  uint64_t v8 = [(NSString *)self->_medicationIdentifier copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v8;

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_startDateTime;
    *(unsigned char *)(v5 + 132) |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_endDateTime;
    *(unsigned char *)(v5 + 132) |= 4u;
  }
  uint64_t v11 = [(NSString *)self->_createdTimeZone copyWithZone:a3];
  v12 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v11;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_frequencyType;
    *(unsigned char *)(v5 + 132) |= 8u;
  }
  uint64_t v13 = [(HDCodableDateComponents *)self->_cycleStartDateComponents copyWithZone:a3];
  long long v14 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v13;

  uint64_t v15 = [(NSString *)self->_note copyWithZone:a3];
  char v16 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v15;

  uint64_t v17 = [(NSData *)self->_medicationUUID copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v17;

  char v19 = (char)self->_has;
  if (v19)
  {
    *(double *)(v5 + 8) = self->_creationDate;
    *(unsigned char *)(v5 + 132) |= 1u;
    char v19 = (char)self->_has;
  }
  if ((v19 & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 128) = self->_deleted;
    *(unsigned char *)(v5 + 132) |= 0x40u;
  }
  uint64_t v20 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v21 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v20;

  id v22 = [(HDCodableMedicationScheduleCompatibilityVersionRange *)self->_compatibilityVersionRange copyWithZone:a3];
  char v23 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v22;

  char v24 = (char)self->_has;
  if ((v24 & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_scheduleType;
    *(unsigned char *)(v5 + 132) |= 0x10u;
    char v24 = (char)self->_has;
  }
  if ((v24 & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_displayOptions;
    *(unsigned char *)(v5 + 132) |= 2u;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v25 = self->_intervalDatas;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "copyWithZone:", a3, (void)v32);
        [(id)v5 addIntervalData:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v27);
  }

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *(unsigned char *)(v5 + 129) = self->_duplicate;
    *(unsigned char *)(v5 + 132) |= 0x80u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_63;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 15))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_63;
    }
  }
  medicationIdentifier = self->_medicationIdentifier;
  if ((unint64_t)medicationIdentifier | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](medicationIdentifier, "isEqual:")) {
      goto LABEL_63;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((v4[132] & 0x20) == 0 || self->_startDateTime != *((double *)v4 + 6)) {
      goto LABEL_63;
    }
  }
  else if ((v4[132] & 0x20) != 0)
  {
    goto LABEL_63;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[132] & 4) == 0 || self->_endDateTime != *((double *)v4 + 3)) {
      goto LABEL_63;
    }
  }
  else if ((v4[132] & 4) != 0)
  {
    goto LABEL_63;
  }
  createdTimeZone = self->_createdTimeZone;
  if ((unint64_t)createdTimeZone | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](createdTimeZone, "isEqual:")) {
      goto LABEL_63;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((v4[132] & 8) == 0 || self->_frequencyType != *((double *)v4 + 4)) {
      goto LABEL_63;
    }
  }
  else if ((v4[132] & 8) != 0)
  {
    goto LABEL_63;
  }
  cycleStartDateComponents = self->_cycleStartDateComponents;
  if ((unint64_t)cycleStartDateComponents | *((void *)v4 + 9)
    && !-[HDCodableDateComponents isEqual:](cycleStartDateComponents, "isEqual:"))
  {
    goto LABEL_63;
  }
  note = self->_note;
  if ((unint64_t)note | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](note, "isEqual:")) {
      goto LABEL_63;
    }
  }
  medicationUUID = self->_medicationUUID;
  if ((unint64_t)medicationUUID | *((void *)v4 + 12))
  {
    if (!-[NSData isEqual:](medicationUUID, "isEqual:")) {
      goto LABEL_63;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[132] & 1) == 0 || self->_creationDate != *((double *)v4 + 1)) {
      goto LABEL_63;
    }
  }
  else if (v4[132])
  {
    goto LABEL_63;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[132] & 0x40) == 0) {
      goto LABEL_63;
    }
    if (self->_deleted)
    {
      if (!v4[128]) {
        goto LABEL_63;
      }
    }
    else if (v4[128])
    {
      goto LABEL_63;
    }
  }
  else if ((v4[132] & 0x40) != 0)
  {
    goto LABEL_63;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 14)
    && !-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
  {
    goto LABEL_63;
  }
  compatibilityVersionRange = self->_compatibilityVersionRange;
  if ((unint64_t)compatibilityVersionRange | *((void *)v4 + 7))
  {
    if (!-[HDCodableMedicationScheduleCompatibilityVersionRange isEqual:](compatibilityVersionRange, "isEqual:")) {
      goto LABEL_63;
    }
  }
  char v14 = (char)self->_has;
  if ((v14 & 0x10) != 0)
  {
    if ((v4[132] & 0x10) == 0 || self->_scheduleType != *((void *)v4 + 5)) {
      goto LABEL_63;
    }
  }
  else if ((v4[132] & 0x10) != 0)
  {
    goto LABEL_63;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[132] & 2) == 0 || self->_displayOptions != *((void *)v4 + 2)) {
      goto LABEL_63;
    }
  }
  else if ((v4[132] & 2) != 0)
  {
    goto LABEL_63;
  }
  intervalDatas = self->_intervalDatas;
  if ((unint64_t)intervalDatas | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](intervalDatas, "isEqual:")) {
      goto LABEL_63;
    }
    char v14 = (char)self->_has;
  }
  int v16 = v4[132];
  if (v14 < 0)
  {
    if (v16 < 0)
    {
      if (self->_duplicate)
      {
        if (!v4[129]) {
          goto LABEL_63;
        }
      }
      else if (v4[129])
      {
        goto LABEL_63;
      }
      BOOL v17 = 1;
      goto LABEL_64;
    }
LABEL_63:
    BOOL v17 = 0;
    goto LABEL_64;
  }
  BOOL v17 = v16 >= 0;
LABEL_64:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v41 = [(NSData *)self->_uuid hash];
  NSUInteger v40 = [(NSString *)self->_medicationIdentifier hash];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    double startDateTime = self->_startDateTime;
    double v6 = -startDateTime;
    if (startDateTime >= 0.0) {
      double v6 = self->_startDateTime;
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
  unint64_t v39 = v4;
  if ((has & 4) != 0)
  {
    double endDateTime = self->_endDateTime;
    double v11 = -endDateTime;
    if (endDateTime >= 0.0) {
      double v11 = self->_endDateTime;
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
  unint64_t v38 = v9;
  NSUInteger v37 = [(NSString *)self->_createdTimeZone hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    double frequencyType = self->_frequencyType;
    double v16 = -frequencyType;
    if (frequencyType >= 0.0) {
      double v16 = self->_frequencyType;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  uint64_t v36 = [(HDCodableDateComponents *)self->_cycleStartDateComponents hash];
  NSUInteger v35 = [(NSString *)self->_note hash];
  uint64_t v33 = [(NSData *)self->_medicationUUID hash];
  char v19 = (char)self->_has;
  if (v19)
  {
    double creationDate = self->_creationDate;
    double v22 = -creationDate;
    if (creationDate >= 0.0) {
      double v22 = self->_creationDate;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  if ((v19 & 0x40) != 0) {
    uint64_t v25 = 2654435761 * self->_deleted;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v26 = [(HDCodableSyncIdentity *)self->_syncIdentity hash];
  unint64_t v27 = [(HDCodableMedicationScheduleCompatibilityVersionRange *)self->_compatibilityVersionRange hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v28 = 2654435761 * self->_scheduleType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v28 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_38:
      uint64_t v29 = 2654435761 * self->_displayOptions;
      goto LABEL_41;
    }
  }
  uint64_t v29 = 0;
LABEL_41:
  uint64_t v30 = [(NSMutableArray *)self->_intervalDatas hash];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v31 = 2654435761 * self->_duplicate;
  }
  else {
    uint64_t v31 = 0;
  }
  return v40 ^ v41 ^ v39 ^ v38 ^ v37 ^ v14 ^ v36 ^ v35 ^ v34 ^ v20 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (char *)a3;
  if (*((void *)v4 + 15)) {
    -[HDCodableMedicationSchedule setUuid:](self, "setUuid:");
  }
  if (*((void *)v4 + 11)) {
    -[HDCodableMedicationSchedule setMedicationIdentifier:](self, "setMedicationIdentifier:");
  }
  char v5 = v4[132];
  if ((v5 & 0x20) != 0)
  {
    self->_double startDateTime = *((double *)v4 + 6);
    *(unsigned char *)&self->_has |= 0x20u;
    char v5 = v4[132];
  }
  if ((v5 & 4) != 0)
  {
    self->_double endDateTime = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 8)) {
    -[HDCodableMedicationSchedule setCreatedTimeZone:](self, "setCreatedTimeZone:");
  }
  if ((v4[132] & 8) != 0)
  {
    self->_double frequencyType = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  cycleStartDateComponents = self->_cycleStartDateComponents;
  uint64_t v7 = *((void *)v4 + 9);
  if (cycleStartDateComponents)
  {
    if (v7) {
      -[HDCodableDateComponents mergeFrom:](cycleStartDateComponents, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[HDCodableMedicationSchedule setCycleStartDateComponents:](self, "setCycleStartDateComponents:");
  }
  if (*((void *)v4 + 13)) {
    -[HDCodableMedicationSchedule setNote:](self, "setNote:");
  }
  if (*((void *)v4 + 12)) {
    -[HDCodableMedicationSchedule setMedicationUUID:](self, "setMedicationUUID:");
  }
  char v8 = v4[132];
  if (v8)
  {
    self->_double creationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v8 = v4[132];
  }
  if ((v8 & 0x40) != 0)
  {
    self->_deleted = v4[128];
    *(unsigned char *)&self->_has |= 0x40u;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v10 = *((void *)v4 + 14);
  if (syncIdentity)
  {
    if (v10) {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[HDCodableMedicationSchedule setSyncIdentity:](self, "setSyncIdentity:");
  }
  compatibilityVersionRange = self->_compatibilityVersionRange;
  uint64_t v12 = *((void *)v4 + 7);
  if (compatibilityVersionRange)
  {
    if (v12) {
      -[HDCodableMedicationScheduleCompatibilityVersionRange mergeFrom:](compatibilityVersionRange, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[HDCodableMedicationSchedule setCompatibilityVersionRange:](self, "setCompatibilityVersionRange:");
  }
  char v13 = v4[132];
  if ((v13 & 0x10) != 0)
  {
    self->_scheduleType = *((void *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
    char v13 = v4[132];
  }
  if ((v13 & 2) != 0)
  {
    self->_displayOptions = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = *((id *)v4 + 10);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[HDCodableMedicationSchedule addIntervalData:](self, "addIntervalData:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }

  if (v4[132] < 0)
  {
    self->_duplicate = v4[129];
    *(unsigned char *)&self->_has |= 0x80u;
  }
}

- (NSData)uuid
{
  return self->_uuid;
}

- (NSString)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (double)startDateTime
{
  return self->_startDateTime;
}

- (double)endDateTime
{
  return self->_endDateTime;
}

- (NSString)createdTimeZone
{
  return self->_createdTimeZone;
}

- (double)frequencyType
{
  return self->_frequencyType;
}

- (HDCodableDateComponents)cycleStartDateComponents
{
  return self->_cycleStartDateComponents;
}

- (NSString)note
{
  return self->_note;
}

- (NSData)medicationUUID
{
  return self->_medicationUUID;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (HDCodableMedicationScheduleCompatibilityVersionRange)compatibilityVersionRange
{
  return self->_compatibilityVersionRange;
}

- (int64_t)scheduleType
{
  return self->_scheduleType;
}

- (int64_t)displayOptions
{
  return self->_displayOptions;
}

- (NSMutableArray)intervalDatas
{
  return self->_intervalDatas;
}

- (BOOL)duplicate
{
  return self->_duplicate;
}

@end