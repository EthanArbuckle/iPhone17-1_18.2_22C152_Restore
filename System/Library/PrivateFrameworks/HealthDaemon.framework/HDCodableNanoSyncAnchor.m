@interface HDCodableNanoSyncAnchor
- (BOOL)hasAnchor;
- (BOOL)hasEntityIdentifier;
- (BOOL)hasObjectType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableEntityIdentifier)entityIdentifier;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)nanoSyncDescription;
- (id)objectTypeAsString:(int)a3;
- (int)StringAsObjectType:(id)a3;
- (int)objectType;
- (int64_t)anchor;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnchor:(int64_t)a3;
- (void)setEntityIdentifier:(id)a3;
- (void)setHasAnchor:(BOOL)a3;
- (void)setHasObjectType:(BOOL)a3;
- (void)setObjectType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableNanoSyncAnchor

- (void)setAnchor:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_anchor = a3;
}

- (void)setObjectType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_objectType = a3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_entityIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (id)nanoSyncDescription
{
  if ([(HDCodableNanoSyncAnchor *)self hasEntityIdentifier])
  {
    v3 = [(HDCodableNanoSyncAnchor *)self entityIdentifier];
    uint64_t v4 = [v3 identifier];

    v5 = [(HDCodableNanoSyncAnchor *)self entityIdentifier];
    id v6 = [v5 schema];

    if (v6 || (v14 = (objc_class *)HDBuiltinSyncEntityClassForType(v4)) == 0)
    {
      v7 = NSString;
      v8 = [(HDCodableNanoSyncAnchor *)self entityIdentifier];
      uint64_t v9 = [v8 schema];
      v10 = (void *)v9;
      v11 = @"HDSyncEntityType";
      if (v9) {
        v11 = (__CFString *)v9;
      }
      v12 = [v7 stringWithFormat:@"%@(%ld) %lld", v11, v4, self->_anchor];
    }
    else
    {
      v15 = NSStringFromClass(v14);
      if ([v15 hasPrefix:@"HD"])
      {
        uint64_t v16 = [v15 substringFromIndex:objc_msgSend(@"HD", "length")];

        v15 = (void *)v16;
      }
      if ([v15 hasSuffix:@"SyncEntity"])
      {
        uint64_t v17 = [v15 substringToIndex:objc_msgSend(v15, "length") - objc_msgSend(@"SyncEntity", "length")];

        v15 = (void *)v17;
      }
      v12 = [NSString stringWithFormat:@"%@(%ld) %lld", v15, v4, self->_anchor];
    }
  }
  else
  {
    v12 = [NSString stringWithFormat:@"%@ %lld", @"(null)", self->_anchor];
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_objectType;
    *(unsigned char *)(v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_anchor;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v8 = [(HDCodableEntityIdentifier *)self->_entityIdentifier copyWithZone:a3];
  uint64_t v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (int64_t)anchor
{
  return self->_anchor;
}

- (int)objectType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_objectType;
  }
  else {
    return 1;
  }
}

- (BOOL)hasAnchor
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasObjectType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasObjectType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (id)objectTypeAsString:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) < 0x32 && ((0x3EF9FF2FFFFFFuLL >> v3))
  {
    uint64_t v4 = off_1E62F6808[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
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

- (void)setHasAnchor:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEntityIdentifier
{
  return self->_entityIdentifier != 0;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableNanoSyncAnchor;
  int v4 = [(HDCodableNanoSyncAnchor *)&v8 description];
  uint64_t v5 = [(HDCodableNanoSyncAnchor *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v5 = self->_objectType - 1;
    if (v5 < 0x32 && ((0x3EF9FF2FFFFFFuLL >> v5) & 1) != 0)
    {
      id v6 = off_1E62F6808[v5];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_objectType);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v6 forKey:@"objectType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v7 = [NSNumber numberWithLongLong:self->_anchor];
    [v3 setObject:v7 forKey:@"anchor"];
  }
  entityIdentifier = self->_entityIdentifier;
  if (entityIdentifier)
  {
    uint64_t v9 = [(HDCodableEntityIdentifier *)entityIdentifier dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"entityIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNanoSyncAnchorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[6] = self->_objectType;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_anchor;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  if (self->_entityIdentifier)
  {
    id v6 = v4;
    objc_msgSend(v4, "setEntityIdentifier:");
    int v4 = v6;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_objectType != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_anchor != *((void *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_14;
  }
  entityIdentifier = self->_entityIdentifier;
  if ((unint64_t)entityIdentifier | *((void *)v4 + 2)) {
    char v6 = -[HDCodableEntityIdentifier isEqual:](entityIdentifier, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_objectType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(HDCodableEntityIdentifier *)self->_entityIdentifier hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_anchor;
  return v3 ^ v2 ^ [(HDCodableEntityIdentifier *)self->_entityIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  char v6 = *((unsigned char *)v4 + 28);
  if ((v6 & 2) != 0)
  {
    self->_objectType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 28);
  }
  if (v6)
  {
    self->_anchor = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  entityIdentifier = self->_entityIdentifier;
  uint64_t v8 = v5[2];
  if (entityIdentifier)
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v9 = v5;
    -[HDCodableEntityIdentifier mergeFrom:](entityIdentifier, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v9 = v5;
    -[HDCodableNanoSyncAnchor setEntityIdentifier:](self, "setEntityIdentifier:");
  }
  unsigned int v5 = v9;
LABEL_11:
}

- (HDCodableEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end