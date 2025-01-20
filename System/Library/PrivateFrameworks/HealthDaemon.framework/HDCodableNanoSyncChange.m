@interface HDCodableNanoSyncChange
+ (Class)objectDataType;
+ (Class)requiredAnchorsType;
+ (id)changeWithNanoSyncEntityClass:(Class)a3 version:(id)a4;
- ($2825F4736939C4A6D3AD43837233062D)versionRange;
- (BOOL)complete;
- (BOOL)done;
- (BOOL)hasComplete;
- (BOOL)hasEndAnchor;
- (BOOL)hasEntityIdentifier;
- (BOOL)hasObjectType;
- (BOOL)hasSequence;
- (BOOL)hasSpeculative;
- (BOOL)hasStartAnchor;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSpeculative;
- (BOOL)readFrom:(id)a3;
- (BOOL)speculative;
- (Class)syncEntityClassForProfile:(id)a3;
- (HDCodableEntityIdentifier)entityIdentifier;
- (HDCodableSyncVersionRange)version;
- (HDSyncAnchorRange)syncAnchorRange;
- (NSMutableArray)objectDatas;
- (NSMutableArray)requiredAnchors;
- (NSNumber)sequenceNumber;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedObjectsForProfile:(id)a3 error:(id *)a4;
- (id)dictionaryRepresentation;
- (id)nanoSyncDescription;
- (id)objectDataAtIndex:(unint64_t)a3;
- (id)objectTypeAsString:(int)a3;
- (id)requiredAnchorMapWithProfile:(id)a3 error:(id *)a4;
- (id)requiredAnchorsAtIndex:(unint64_t)a3;
- (id)speculativeCopy;
- (id)syncEntityIdentifier;
- (int)StringAsObjectType:(id)a3;
- (int)objectType;
- (int64_t)endAnchor;
- (int64_t)sequence;
- (int64_t)startAnchor;
- (unint64_t)hash;
- (unint64_t)objectDatasCount;
- (unint64_t)requiredAnchorsCount;
- (void)addObjectData:(id)a3;
- (void)addRequiredAnchors:(id)a3;
- (void)clearObjectDatas;
- (void)clearRequiredAnchors;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setEndAnchor:(int64_t)a3;
- (void)setEntityIdentifier:(id)a3;
- (void)setHasComplete:(BOOL)a3;
- (void)setHasEndAnchor:(BOOL)a3;
- (void)setHasObjectType:(BOOL)a3;
- (void)setHasSequence:(BOOL)a3;
- (void)setHasSpeculative:(BOOL)a3;
- (void)setHasStartAnchor:(BOOL)a3;
- (void)setObjectDatas:(id)a3;
- (void)setObjectType:(int)a3;
- (void)setObjects:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 requiredAnchorMap:(id)a5;
- (void)setRequiredAnchors:(id)a3;
- (void)setSequence:(int64_t)a3;
- (void)setSequenceNumber:(int64_t)a3 done:(BOOL)a4;
- (void)setSpeculative:(BOOL)a3;
- (void)setStartAnchor:(int64_t)a3;
- (void)setVersion:(id)a3;
- (void)setVersionRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableNanoSyncChange

- (void)setObjectType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_objectType = a3;
}

- (void)setObjects:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 requiredAnchorMap:(id)a5
{
  int64_t end = a4.end;
  int64_t start = a4.start;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  [(HDCodableNanoSyncChange *)self clearObjectDatas];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x1C187C0E0]();
        v18 = [v16 data];
        if (v18) {
          [(HDCodableNanoSyncChange *)self addObjectData:v18];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  [(HDCodableNanoSyncChange *)self setStartAnchor:start];
  [(HDCodableNanoSyncChange *)self setEndAnchor:end];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__HDCodableNanoSyncChange_NanoSyncSupport__setObjects_syncAnchorRange_requiredAnchorMap___block_invoke;
  v19[3] = &unk_1E62F5BE8;
  v19[4] = self;
  [v10 enumerateAnchorsAndEntityIdentifiersWithBlock:v19];
}

- (void)clearObjectDatas
{
}

- (void)addObjectData:(id)a3
{
  id v4 = a3;
  objectDatas = self->_objectDatas;
  id v8 = v4;
  if (!objectDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_objectDatas;
    self->_objectDatas = v6;

    id v4 = v8;
    objectDatas = self->_objectDatas;
  }
  [(NSMutableArray *)objectDatas addObject:v4];
}

- (void)setStartAnchor:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_startAnchor = a3;
}

- (void)setEndAnchor:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_endAnchor = a3;
}

- (void)setSequenceNumber:(int64_t)a3 done:(BOOL)a4
{
  BOOL v4 = a4;
  [(HDCodableNanoSyncChange *)self setSequence:a3];

  [(HDCodableNanoSyncChange *)self setComplete:v4];
}

- (void)setSequence:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sequence = a3;
}

- (void)setComplete:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_complete = a3;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    PBDataWriterWriteInt64Field();
LABEL_5:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = self->_objectDatas;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = self->_requiredAnchors;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  char v16 = (char)self->_has;
  if ((v16 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v16 = (char)self->_has;
    if ((v16 & 2) == 0)
    {
LABEL_21:
      if ((v16 & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_22:
  }
    PBDataWriterWriteBOOLField();
LABEL_23:
  if (self->_entityIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_version) {
    PBDataWriterWriteSubmessage();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_requiredAnchors, 0);
  objc_storeStrong((id *)&self->_objectDatas, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (id)nanoSyncDescription
{
  v3 = [HDSyncEntityIdentifier alloc];
  id v4 = [(HDCodableNanoSyncChange *)self entityIdentifier];
  v5 = [(HDSyncEntityIdentifier *)v3 initWithCodableEntityIdentifier:v4];

  if (self->_speculative)
  {
    v6 = @"spec";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lld -> %lld", self->_startAnchor, self->_endAnchor);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = [NSString stringWithFormat:@"%@ (%@)", v5, v6];

  return v7;
}

void __89__HDCodableNanoSyncChange_NanoSyncSupport__setObjects_syncAnchorRange_requiredAnchorMap___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  v5 = objc_alloc_init(HDCodableNanoSyncAnchor);
  [(HDCodableNanoSyncAnchor *)v5 setAnchor:a3];
  v6 = [v10 codableEntityIdentifier];
  [(HDCodableNanoSyncAnchor *)v5 setEntityIdentifier:v6];

  uint64_t v7 = [v10 schemaIdentifier];

  if (!v7)
  {
    id v8 = HDBuiltinSyncEntityClassForType([v10 entityIdentifier]);
    if (v8)
    {
      uint64_t v9 = v8;
      if (objc_opt_respondsToSelector()) {
        -[HDCodableNanoSyncAnchor setObjectType:](v5, "setObjectType:", [v9 nanoSyncObjectType]);
      }
    }
  }
  [*(id *)(a1 + 32) addRequiredAnchors:v5];
}

- (void)addRequiredAnchors:(id)a3
{
  id v4 = a3;
  requiredAnchors = self->_requiredAnchors;
  id v8 = v4;
  if (!requiredAnchors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_requiredAnchors;
    self->_requiredAnchors = v6;

    id v4 = v8;
    requiredAnchors = self->_requiredAnchors;
  }
  [(NSMutableArray *)requiredAnchors addObject:v4];
}

- (HDSyncAnchorRange)syncAnchorRange
{
  if ((~*(unsigned char *)&self->_has & 5) != 0) {
    int64_t v2 = HDSyncAnchorRangeMake(-1, -1);
  }
  else {
    int64_t v2 = HDSyncAnchorRangeMake(self->_startAnchor, self->_endAnchor);
  }
  result.int64_t end = v3;
  result.int64_t start = v2;
  return result;
}

- (NSNumber)sequenceNumber
{
  if ([(HDCodableNanoSyncChange *)self hasSequence])
  {
    int64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDCodableNanoSyncChange sequence](self, "sequence"));
  }
  else
  {
    int64_t v3 = 0;
  }

  return (NSNumber *)v3;
}

- (BOOL)hasSequence
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int64_t)sequence
{
  return self->_sequence;
}

- (BOOL)isSpeculative
{
  return self->_speculative;
}

- (BOOL)done
{
  if (![(HDCodableNanoSyncChange *)self hasComplete]) {
    return 1;
  }

  return [(HDCodableNanoSyncChange *)self complete];
}

- (BOOL)hasComplete
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)complete
{
  return self->_complete;
}

- (int)objectType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_objectType;
  }
  else {
    return 1;
  }
}

- (void)setHasObjectType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasObjectType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)objectTypeAsString:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) < 0x32 && ((0x3EF9FF2FFFFFFuLL >> v3))
  {
    id v4 = off_1E62FC170[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (int)StringAsObjectType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CategorySamples"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"QuantitySamples"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Workouts"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ActivityCaches"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LegacyAchievements"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"UserCharacteristics"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Deprecated7"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ObjectAssociations"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"UnitPreferences"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Sources"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Authorizations"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"Devices"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"Correlations"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"DataTypeSourceOrder"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"MedicalID"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"NanoUserDefaults"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ProtectedNanoUserDefaults"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"LocationSeriesSamples"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"DeletedSamples"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"LegacyAchievementKeyValue"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"ActivityAchievementsKeyValue"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"BinarySamples"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"CDADocumentSamples"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"FHIRResources"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"ClinicalGateways"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"MedicationOrders"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"MedicationDispenseRecords"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"MedicationRecords"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"DiagnosticTestResults"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"DiagnosticTestReports"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"VaccinationRecords"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"ConditionRecords"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"AllergyRecords"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"ProcedureRecords"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"ClinicalAccounts"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"UserDefaults"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"ClinicalDeletedAccounts"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"AccountOwners"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"UnknownRecords"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"OnboardingCompletions"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"ECGSamples"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"SleepSchedules"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"QuantityDerivedCategorySamples"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"TypedObjectAssociations"])
  {
    int v4 = 50;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setHasStartAnchor:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartAnchor
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasEndAnchor:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndAnchor
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)objectDatasCount
{
  return [(NSMutableArray *)self->_objectDatas count];
}

- (id)objectDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_objectDatas objectAtIndex:a3];
}

+ (Class)objectDataType
{
  return (Class)objc_opt_class();
}

- (void)clearRequiredAnchors
{
}

- (unint64_t)requiredAnchorsCount
{
  return [(NSMutableArray *)self->_requiredAnchors count];
}

- (id)requiredAnchorsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_requiredAnchors objectAtIndex:a3];
}

+ (Class)requiredAnchorsType
{
  return (Class)objc_opt_class();
}

- (void)setSpeculative:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_speculative = a3;
}

- (void)setHasSpeculative:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSpeculative
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasSequence:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setHasComplete:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEntityIdentifier
{
  return self->_entityIdentifier != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableNanoSyncChange;
  int v4 = [(HDCodableNanoSyncChange *)&v8 description];
  v5 = [(HDCodableNanoSyncChange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    unsigned int v5 = self->_objectType - 1;
    if (v5 < 0x32 && ((0x3EF9FF2FFFFFFuLL >> v5) & 1) != 0)
    {
      v6 = off_1E62FC170[v5];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_objectType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v6 forKey:@"objectType"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t v7 = [NSNumber numberWithLongLong:self->_startAnchor];
    [v3 setObject:v7 forKey:@"startAnchor"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_endAnchor];
    [v3 setObject:v8 forKey:@"endAnchor"];
  }
  objectDatas = self->_objectDatas;
  if (objectDatas) {
    [v3 setObject:objectDatas forKey:@"objectData"];
  }
  if ([(NSMutableArray *)self->_requiredAnchors count])
  {
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_requiredAnchors, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = self->_requiredAnchors;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          char v16 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"requiredAnchors"];
  }
  char v17 = (char)self->_has;
  if ((v17 & 0x20) != 0)
  {
    long long v24 = [NSNumber numberWithBool:self->_speculative];
    [v3 setObject:v24 forKey:@"speculative"];

    char v17 = (char)self->_has;
    if ((v17 & 2) == 0)
    {
LABEL_24:
      if ((v17 & 0x10) == 0) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_24;
  }
  uint64_t v25 = [NSNumber numberWithLongLong:self->_sequence];
  [v3 setObject:v25 forKey:@"sequence"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_25:
    long long v18 = [NSNumber numberWithBool:self->_complete];
    [v3 setObject:v18 forKey:@"complete"];
  }
LABEL_26:
  entityIdentifier = self->_entityIdentifier;
  if (entityIdentifier)
  {
    long long v20 = [(HDCodableEntityIdentifier *)entityIdentifier dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"entityIdentifier"];
  }
  version = self->_version;
  if (version)
  {
    long long v22 = [(HDCodableSyncVersionRange *)version dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"version"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNanoSyncChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_25:
    v4[3] = self->_startAnchor;
    *((unsigned char *)v4 + 76) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v4 + 12) = self->_objectType;
  *((unsigned char *)v4 + 76) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_25;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    v4[1] = self->_endAnchor;
    *((unsigned char *)v4 + 76) |= 1u;
  }
LABEL_5:
  id v16 = v4;
  if ([(HDCodableNanoSyncChange *)self objectDatasCount])
  {
    [v16 clearObjectDatas];
    unint64_t v6 = [(HDCodableNanoSyncChange *)self objectDatasCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(HDCodableNanoSyncChange *)self objectDataAtIndex:i];
        [v16 addObjectData:v9];
      }
    }
  }
  if ([(HDCodableNanoSyncChange *)self requiredAnchorsCount])
  {
    [v16 clearRequiredAnchors];
    unint64_t v10 = [(HDCodableNanoSyncChange *)self requiredAnchorsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(HDCodableNanoSyncChange *)self requiredAnchorsAtIndex:j];
        [v16 addRequiredAnchors:v13];
      }
    }
  }
  char v14 = (char)self->_has;
  uint64_t v15 = v16;
  if ((v14 & 0x20) != 0)
  {
    *((unsigned char *)v16 + 73) = self->_speculative;
    *((unsigned char *)v16 + 76) |= 0x20u;
    char v14 = (char)self->_has;
    if ((v14 & 2) == 0)
    {
LABEL_15:
      if ((v14 & 0x10) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  *((void *)v16 + 2) = self->_sequence;
  *((unsigned char *)v16 + 76) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_16:
    *((unsigned char *)v16 + 72) = self->_complete;
    *((unsigned char *)v16 + 76) |= 0x10u;
  }
LABEL_17:
  if (self->_entityIdentifier)
  {
    objc_msgSend(v16, "setEntityIdentifier:");
    uint64_t v15 = v16;
  }
  if (self->_version)
  {
    objc_msgSend(v16, "setVersion:");
    uint64_t v15 = v16;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_objectType;
    *(unsigned char *)(v5 + 76) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 24) = self->_startAnchor;
  *(unsigned char *)(v5 + 76) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(void *)(v5 + 8) = self->_endAnchor;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
LABEL_5:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  objc_super v8 = self->_objectDatas;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addObjectData:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  char v14 = self->_requiredAnchors;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "copyWithZone:", a3, (void)v26);
        [(id)v6 addRequiredAnchors:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v16);
  }

  char v20 = (char)self->_has;
  if ((v20 & 0x20) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_21;
    }
LABEL_28:
    *(void *)(v6 + 16) = self->_sequence;
    *(unsigned char *)(v6 + 76) |= 2u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  *(unsigned char *)(v6 + 73) = self->_speculative;
  *(unsigned char *)(v6 + 76) |= 0x20u;
  char v20 = (char)self->_has;
  if ((v20 & 2) != 0) {
    goto LABEL_28;
  }
LABEL_21:
  if ((v20 & 0x10) != 0)
  {
LABEL_22:
    *(unsigned char *)(v6 + 72) = self->_complete;
    *(unsigned char *)(v6 + 76) |= 0x10u;
  }
LABEL_23:
  id v21 = -[HDCodableEntityIdentifier copyWithZone:](self->_entityIdentifier, "copyWithZone:", a3, (void)v26);
  long long v22 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v21;

  id v23 = [(HDCodableSyncVersionRange *)self->_version copyWithZone:a3];
  long long v24 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v23;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 8) == 0 || self->_objectType != *((_DWORD *)v4 + 12)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0 || self->_startAnchor != *((void *)v4 + 3)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
    goto LABEL_46;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_endAnchor != *((void *)v4 + 1)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_46;
  }
  objectDatas = self->_objectDatas;
  if ((unint64_t)objectDatas | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](objectDatas, "isEqual:"))
  {
    goto LABEL_46;
  }
  requiredAnchors = self->_requiredAnchors;
  if ((unint64_t)requiredAnchors | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](requiredAnchors, "isEqual:")) {
      goto LABEL_46;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 0x20) == 0) {
      goto LABEL_46;
    }
    if (self->_speculative)
    {
      if (!*((unsigned char *)v4 + 73)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 73))
    {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_sequence != *((void *)v4 + 2)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 0x10) != 0)
    {
      if (self->_complete)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_46;
        }
        goto LABEL_42;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_42;
      }
    }
LABEL_46:
    char v9 = 0;
    goto LABEL_47;
  }
  if ((*((unsigned char *)v4 + 76) & 0x10) != 0) {
    goto LABEL_46;
  }
LABEL_42:
  entityIdentifier = self->_entityIdentifier;
  if ((unint64_t)entityIdentifier | *((void *)v4 + 4)
    && !-[HDCodableEntityIdentifier isEqual:](entityIdentifier, "isEqual:"))
  {
    goto LABEL_46;
  }
  version = self->_version;
  if ((unint64_t)version | *((void *)v4 + 8)) {
    char v9 = -[HDCodableSyncVersionRange isEqual:](version, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_47:

  return v9;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_objectType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_startAnchor;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_endAnchor;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  uint64_t v6 = [(NSMutableArray *)self->_objectDatas hash];
  uint64_t v7 = [(NSMutableArray *)self->_requiredAnchors hash];
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v10 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = 2654435761 * self->_speculative;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_sequence;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_complete;
LABEL_15:
  uint64_t v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  unint64_t v12 = v9 ^ v10 ^ [(HDCodableEntityIdentifier *)self->_entityIdentifier hash];
  return v11 ^ v12 ^ [(HDCodableSyncVersionRange *)self->_version hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 76);
  if ((v6 & 8) != 0)
  {
    self->_objectType = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v4 + 76);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_startAnchor = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 76))
  {
LABEL_4:
    self->_endAnchor = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = *((id *)v4 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        [(HDCodableNanoSyncChange *)self addObjectData:*(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = *((id *)v5 + 7);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        -[HDCodableNanoSyncChange addRequiredAnchors:](self, "addRequiredAnchors:", *(void *)(*((void *)&v22 + 1) + 8 * j), (void)v22);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v14);
  }

  char v17 = *((unsigned char *)v5 + 76);
  if ((v17 & 0x20) != 0)
  {
    self->_speculative = *((unsigned char *)v5 + 73);
    *(unsigned char *)&self->_has |= 0x20u;
    char v17 = *((unsigned char *)v5 + 76);
    if ((v17 & 2) == 0)
    {
LABEL_21:
      if ((v17 & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v5 + 76) & 2) == 0)
  {
    goto LABEL_21;
  }
  self->_sequence = *((void *)v5 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v5 + 76) & 0x10) != 0)
  {
LABEL_22:
    self->_complete = *((unsigned char *)v5 + 72);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_23:
  entityIdentifier = self->_entityIdentifier;
  uint64_t v19 = *((void *)v5 + 4);
  if (entityIdentifier)
  {
    if (v19) {
      -[HDCodableEntityIdentifier mergeFrom:](entityIdentifier, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[HDCodableNanoSyncChange setEntityIdentifier:](self, "setEntityIdentifier:");
  }
  version = self->_version;
  uint64_t v21 = *((void *)v5 + 8);
  if (version)
  {
    if (v21) {
      -[HDCodableSyncVersionRange mergeFrom:](version, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[HDCodableNanoSyncChange setVersion:](self, "setVersion:");
  }
}

- (int64_t)startAnchor
{
  return self->_startAnchor;
}

- (int64_t)endAnchor
{
  return self->_endAnchor;
}

- (NSMutableArray)objectDatas
{
  return self->_objectDatas;
}

- (void)setObjectDatas:(id)a3
{
}

- (NSMutableArray)requiredAnchors
{
  return self->_requiredAnchors;
}

- (void)setRequiredAnchors:(id)a3
{
}

- (BOOL)speculative
{
  return self->_speculative;
}

- (HDCodableEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
}

- (HDCodableSyncVersionRange)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- ($2825F4736939C4A6D3AD43837233062D)versionRange
{
  int64_t v2 = [(HDCodableNanoSyncChange *)self version];
  $2825F4736939C4A6D3AD43837233062D v3 = ($2825F4736939C4A6D3AD43837233062D)[v2 syncVersionRange];

  return v3;
}

+ (id)changeWithNanoSyncEntityClass:(Class)a3 version:(id)a4
{
  id v6 = objc_alloc_init((Class)a1);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "setObjectType:", -[objc_class nanoSyncObjectType](a3, "nanoSyncObjectType"));
  }
  id v7 = [(objc_class *)a3 syncEntityIdentifier];
  uint64_t v8 = [v7 codableEntityIdentifier];
  [v6 setEntityIdentifier:v8];

  uint64_t v9 = +[HDCodableSyncVersionRange versionRangeWithSyncVersionRange:a4];
  [v6 setVersion:v9];

  return v6;
}

- (id)syncEntityIdentifier
{
  if (self->_entityIdentifier)
  {
    int64_t v2 = [[HDSyncEntityIdentifier alloc] initWithCodableEntityIdentifier:self->_entityIdentifier];
  }
  else if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    int64_t v2 = [HDNanoSyncEntityClassForObjectType(self->_objectType) syncEntityIdentifier];
  }
  else
  {
    int64_t v2 = 0;
  }

  return v2;
}

- (Class)syncEntityClassForProfile:(id)a3
{
  id v4 = a3;
  if (self->_entityIdentifier)
  {
    id v5 = [[HDSyncEntityIdentifier alloc] initWithCodableEntityIdentifier:self->_entityIdentifier];
    id v6 = [v4 syncEngine];
    id v7 = [v6 allSyncEntitiesByIdentifier];
    uint64_t v8 = [v7 objectForKeyedSubscript:v5];
  }
  else if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v8 = HDNanoSyncEntityClassForObjectType(self->_objectType);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (Class)v8;
}

- (id)speculativeCopy
{
  $2825F4736939C4A6D3AD43837233062D v3 = objc_alloc_init(HDCodableNanoSyncChange);
  [(HDCodableNanoSyncChange *)self copyTo:v3];
  [(HDCodableNanoSyncChange *)v3 setSpeculative:1];
  [(HDCodableNanoSyncChange *)v3 clearRequiredAnchors];
  [(HDCodableNanoSyncChange *)v3 setHasStartAnchor:0];
  [(HDCodableNanoSyncChange *)v3 setHasEndAnchor:0];

  return v3;
}

- (void)setVersionRange:(id)a3
{
  uint64_t var1 = a3.var1;
  id v6 = [(HDCodableNanoSyncChange *)self version];
  [v6 setMinimum:a3];

  id v7 = [(HDCodableNanoSyncChange *)self version];
  [v7 setCurrent:var1];
}

- (id)requiredAnchorMapWithProfile:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v6 = objc_alloc_init(HDSyncAnchorMap);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = self->_requiredAnchors;
  uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v20 = a4;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v12 = [v11 anchor];
        uint64_t v13 = [v11 entityIdentifier];

        if (!v13) {
          goto LABEL_8;
        }
        uint64_t v14 = [HDSyncEntityIdentifier alloc];
        uint64_t v15 = [v11 entityIdentifier];
        uint64_t v13 = [(HDSyncEntityIdentifier *)v14 initWithCodableEntityIdentifier:v15];

        uint64_t v16 = [v22 syncEngine];
        char v17 = [v16 allSyncEntitiesByIdentifier];
        id v18 = (id)[v17 objectForKeyedSubscript:v13];

        if (!v18) {
LABEL_8:
        }
          id v18 = HDNanoSyncEntityClassForObjectType([v11 objectType]);
        if (![v11 hasAnchor] || v12 < 0 || !v18)
        {

          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", v20, 3, @"invalid required anchor %@", v11);
          id v6 = 0;
          goto LABEL_16;
        }
        -[HDSyncAnchorMap setAnchor:forSyncEntity:](v6, "setAnchor:forSyncEntity:", [v11 anchor], v18);
      }
      uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v6;
}

- (id)decodedObjectsForProfile:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = [(HDCodableNanoSyncChange *)self syncEntityClassForProfile:a3];
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"No sync entity found for %@", self);
    goto LABEL_14;
  }
  uint64_t v7 = v6;
  if (![(NSMutableArray *)self->_objectDatas count])
  {
LABEL_14:
    uint64_t v8 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = self->_objectDatas;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [(objc_class *)v7 decodeSyncObjectWithData:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

LABEL_15:

  return v8;
}

@end