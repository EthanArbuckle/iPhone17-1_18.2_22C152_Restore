@interface ACHCodableTemplate
- (ACHCodableSyncIdentity)syncIdentity;
- (BOOL)availableOnPairedDevice;
- (BOOL)displaysEarnedInstanceCount;
- (BOOL)hasAlertDates;
- (BOOL)hasAlertabilityPredicate;
- (BOOL)hasAvailabilityEndDate;
- (BOOL)hasAvailabilityPredicate;
- (BOOL)hasAvailabilityStartDate;
- (BOOL)hasAvailableCountryCodes;
- (BOOL)hasAvailableOnPairedDevice;
- (BOOL)hasAvailableSuffixes;
- (BOOL)hasCanonicalUnit;
- (BOOL)hasCreatedDate;
- (BOOL)hasCreatorDevice;
- (BOOL)hasDailyTarget;
- (BOOL)hasDailyTargetCanonicalUnit;
- (BOOL)hasDisplayOrder;
- (BOOL)hasDisplaysEarnedInstanceCount;
- (BOOL)hasDuplicateRemovalCalendarUnit;
- (BOOL)hasDuplicateRemovalStrategy;
- (BOOL)hasEarnDateStrategy;
- (BOOL)hasEarnLimit;
- (BOOL)hasGoalExpression;
- (BOOL)hasGraceGoalExpression;
- (BOOL)hasGracePredicate;
- (BOOL)hasGraceProgressExpression;
- (BOOL)hasGraceValueExpression;
- (BOOL)hasGraceVisibilityPredicate;
- (BOOL)hasKey;
- (BOOL)hasMinimumEngineVersion;
- (BOOL)hasMobileAssetVersion;
- (BOOL)hasPredicate;
- (BOOL)hasPrerequisiteTemplateName;
- (BOOL)hasProgressExpression;
- (BOOL)hasSourceName;
- (BOOL)hasSyncIdentity;
- (BOOL)hasTriggers;
- (BOOL)hasUniqueName;
- (BOOL)hasValueExpression;
- (BOOL)hasVersion;
- (BOOL)hasVisibilityEndDate;
- (BOOL)hasVisibilityPredicate;
- (BOOL)hasVisibilityStartDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)alertDates;
- (NSString)alertabilityPredicate;
- (NSString)availabilityEndDate;
- (NSString)availabilityPredicate;
- (NSString)availabilityStartDate;
- (NSString)availableCountryCodes;
- (NSString)availableSuffixes;
- (NSString)canonicalUnit;
- (NSString)dailyTargetCanonicalUnit;
- (NSString)goalExpression;
- (NSString)graceGoalExpression;
- (NSString)gracePredicate;
- (NSString)graceProgressExpression;
- (NSString)graceValueExpression;
- (NSString)graceVisibilityPredicate;
- (NSString)predicate;
- (NSString)prerequisiteTemplateName;
- (NSString)progressExpression;
- (NSString)sourceName;
- (NSString)uniqueName;
- (NSString)valueExpression;
- (NSString)visibilityEndDate;
- (NSString)visibilityPredicate;
- (NSString)visibilityStartDate;
- (double)createdDate;
- (double)dailyTarget;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)creatorDevice;
- (int64_t)displayOrder;
- (int64_t)duplicateRemovalCalendarUnit;
- (int64_t)duplicateRemovalStrategy;
- (int64_t)earnDateStrategy;
- (int64_t)earnLimit;
- (int64_t)key;
- (int64_t)minimumEngineVersion;
- (int64_t)mobileAssetVersion;
- (int64_t)triggers;
- (int64_t)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlertDates:(id)a3;
- (void)setAlertabilityPredicate:(id)a3;
- (void)setAvailabilityEndDate:(id)a3;
- (void)setAvailabilityPredicate:(id)a3;
- (void)setAvailabilityStartDate:(id)a3;
- (void)setAvailableCountryCodes:(id)a3;
- (void)setAvailableOnPairedDevice:(BOOL)a3;
- (void)setAvailableSuffixes:(id)a3;
- (void)setCanonicalUnit:(id)a3;
- (void)setCreatedDate:(double)a3;
- (void)setCreatorDevice:(int64_t)a3;
- (void)setDailyTarget:(double)a3;
- (void)setDailyTargetCanonicalUnit:(id)a3;
- (void)setDisplayOrder:(int64_t)a3;
- (void)setDisplaysEarnedInstanceCount:(BOOL)a3;
- (void)setDuplicateRemovalCalendarUnit:(int64_t)a3;
- (void)setDuplicateRemovalStrategy:(int64_t)a3;
- (void)setEarnDateStrategy:(int64_t)a3;
- (void)setEarnLimit:(int64_t)a3;
- (void)setGoalExpression:(id)a3;
- (void)setGraceGoalExpression:(id)a3;
- (void)setGracePredicate:(id)a3;
- (void)setGraceProgressExpression:(id)a3;
- (void)setGraceValueExpression:(id)a3;
- (void)setGraceVisibilityPredicate:(id)a3;
- (void)setHasAvailableOnPairedDevice:(BOOL)a3;
- (void)setHasCreatedDate:(BOOL)a3;
- (void)setHasCreatorDevice:(BOOL)a3;
- (void)setHasDailyTarget:(BOOL)a3;
- (void)setHasDisplayOrder:(BOOL)a3;
- (void)setHasDisplaysEarnedInstanceCount:(BOOL)a3;
- (void)setHasDuplicateRemovalCalendarUnit:(BOOL)a3;
- (void)setHasDuplicateRemovalStrategy:(BOOL)a3;
- (void)setHasEarnDateStrategy:(BOOL)a3;
- (void)setHasEarnLimit:(BOOL)a3;
- (void)setHasKey:(BOOL)a3;
- (void)setHasMinimumEngineVersion:(BOOL)a3;
- (void)setHasMobileAssetVersion:(BOOL)a3;
- (void)setHasTriggers:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setKey:(int64_t)a3;
- (void)setMinimumEngineVersion:(int64_t)a3;
- (void)setMobileAssetVersion:(int64_t)a3;
- (void)setPredicate:(id)a3;
- (void)setPrerequisiteTemplateName:(id)a3;
- (void)setProgressExpression:(id)a3;
- (void)setSourceName:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setTriggers:(int64_t)a3;
- (void)setUniqueName:(id)a3;
- (void)setValueExpression:(id)a3;
- (void)setVersion:(int64_t)a3;
- (void)setVisibilityEndDate:(id)a3;
- (void)setVisibilityPredicate:(id)a3;
- (void)setVisibilityStartDate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACHCodableTemplate

- (ACHCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (NSString)canonicalUnit
{
  return self->_canonicalUnit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityStartDate, 0);
  objc_storeStrong((id *)&self->_visibilityPredicate, 0);
  objc_storeStrong((id *)&self->_visibilityEndDate, 0);
  objc_storeStrong((id *)&self->_valueExpression, 0);
  objc_storeStrong((id *)&self->_uniqueName, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_progressExpression, 0);
  objc_storeStrong((id *)&self->_prerequisiteTemplateName, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_graceVisibilityPredicate, 0);
  objc_storeStrong((id *)&self->_graceValueExpression, 0);
  objc_storeStrong((id *)&self->_graceProgressExpression, 0);
  objc_storeStrong((id *)&self->_gracePredicate, 0);
  objc_storeStrong((id *)&self->_graceGoalExpression, 0);
  objc_storeStrong((id *)&self->_goalExpression, 0);
  objc_storeStrong((id *)&self->_dailyTargetCanonicalUnit, 0);
  objc_storeStrong((id *)&self->_canonicalUnit, 0);
  objc_storeStrong((id *)&self->_availableSuffixes, 0);
  objc_storeStrong((id *)&self->_availableCountryCodes, 0);
  objc_storeStrong((id *)&self->_availabilityStartDate, 0);
  objc_storeStrong((id *)&self->_availabilityPredicate, 0);
  objc_storeStrong((id *)&self->_availabilityEndDate, 0);
  objc_storeStrong((id *)&self->_alertabilityPredicate, 0);

  objc_storeStrong((id *)&self->_alertDates, 0);
}

- (void)setVisibilityStartDate:(id)a3
{
}

- (void)setVisibilityPredicate:(id)a3
{
}

- (void)setVisibilityEndDate:(id)a3
{
}

- (void)setVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_version = a3;
}

- (void)setValueExpression:(id)a3
{
}

- (void)setUniqueName:(id)a3
{
}

- (void)setTriggers:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_triggers = a3;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void)setSourceName:(id)a3
{
}

- (void)setPrerequisiteTemplateName:(id)a3
{
}

- (void)setPredicate:(id)a3
{
}

- (void)setMobileAssetVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_mobileAssetVersion = a3;
}

- (void)setMinimumEngineVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_minimumEngineVersion = a3;
}

- (void)setKey:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_key = a3;
}

- (void)setGraceVisibilityPredicate:(id)a3
{
}

- (void)setGraceValueExpression:(id)a3
{
}

- (void)setGraceProgressExpression:(id)a3
{
}

- (void)setGracePredicate:(id)a3
{
}

- (void)setGraceGoalExpression:(id)a3
{
}

- (void)setGoalExpression:(id)a3
{
}

- (void)setEarnLimit:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_earnLimit = a3;
}

- (void)setEarnDateStrategy:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_earnDateStrategy = a3;
}

- (void)setDuplicateRemovalStrategy:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_duplicateRemovalStrategy = a3;
}

- (void)setDuplicateRemovalCalendarUnit:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_duplicateRemovalCalendarUnit = a3;
}

- (void)setDisplaysEarnedInstanceCount:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_displaysEarnedInstanceCount = a3;
}

- (void)setDisplayOrder:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_displayOrder = a3;
}

- (void)setDailyTargetCanonicalUnit:(id)a3
{
}

- (void)setDailyTarget:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_dailyTarget = a3;
}

- (void)setCreatorDevice:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_creatorDevice = a3;
}

- (void)setCreatedDate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_createdDate = a3;
}

- (void)setCanonicalUnit:(id)a3
{
}

- (void)setAvailableSuffixes:(id)a3
{
}

- (void)setAvailableOnPairedDevice:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_availableOnPairedDevice = a3;
}

- (void)setAvailableCountryCodes:(id)a3
{
}

- (void)setAvailabilityStartDate:(id)a3
{
}

- (void)setAvailabilityPredicate:(id)a3
{
}

- (void)setAvailabilityEndDate:(id)a3
{
}

- (void)setAlertabilityPredicate:(id)a3
{
}

- (void)setAlertDates:(id)a3
{
}

- (void)setProgressExpression:(id)a3
{
}

- (NSString)visibilityStartDate
{
  return self->_visibilityStartDate;
}

- (NSString)visibilityPredicate
{
  return self->_visibilityPredicate;
}

- (NSString)visibilityEndDate
{
  return self->_visibilityEndDate;
}

- (int64_t)version
{
  return self->_version;
}

- (NSString)valueExpression
{
  return self->_valueExpression;
}

- (NSString)uniqueName
{
  return self->_uniqueName;
}

- (int64_t)triggers
{
  return self->_triggers;
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (NSString)progressExpression
{
  return self->_progressExpression;
}

- (NSString)prerequisiteTemplateName
{
  return self->_prerequisiteTemplateName;
}

- (NSString)predicate
{
  return self->_predicate;
}

- (int64_t)mobileAssetVersion
{
  return self->_mobileAssetVersion;
}

- (int64_t)minimumEngineVersion
{
  return self->_minimumEngineVersion;
}

- (int64_t)key
{
  return self->_key;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (NSString)graceVisibilityPredicate
{
  return self->_graceVisibilityPredicate;
}

- (NSString)graceValueExpression
{
  return self->_graceValueExpression;
}

- (NSString)graceProgressExpression
{
  return self->_graceProgressExpression;
}

- (NSString)gracePredicate
{
  return self->_gracePredicate;
}

- (NSString)graceGoalExpression
{
  return self->_graceGoalExpression;
}

- (NSString)goalExpression
{
  return self->_goalExpression;
}

- (int64_t)earnLimit
{
  return self->_earnLimit;
}

- (int64_t)earnDateStrategy
{
  return self->_earnDateStrategy;
}

- (int64_t)duplicateRemovalStrategy
{
  return self->_duplicateRemovalStrategy;
}

- (int64_t)duplicateRemovalCalendarUnit
{
  return self->_duplicateRemovalCalendarUnit;
}

- (BOOL)displaysEarnedInstanceCount
{
  return self->_displaysEarnedInstanceCount;
}

- (int64_t)displayOrder
{
  return self->_displayOrder;
}

- (double)dailyTarget
{
  return self->_dailyTarget;
}

- (NSString)dailyTargetCanonicalUnit
{
  return self->_dailyTargetCanonicalUnit;
}

- (int64_t)creatorDevice
{
  return self->_creatorDevice;
}

- (double)createdDate
{
  return self->_createdDate;
}

- (NSString)availableSuffixes
{
  return self->_availableSuffixes;
}

- (BOOL)availableOnPairedDevice
{
  return self->_availableOnPairedDevice;
}

- (NSString)availableCountryCodes
{
  return self->_availableCountryCodes;
}

- (NSString)availabilityStartDate
{
  return self->_availabilityStartDate;
}

- (NSString)availabilityPredicate
{
  return self->_availabilityPredicate;
}

- (NSString)availabilityEndDate
{
  return self->_availabilityEndDate;
}

- (NSString)alertabilityPredicate
{
  return self->_alertabilityPredicate;
}

- (NSString)alertDates
{
  return self->_alertDates;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_uniqueName)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v10;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_78;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v10;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_78:
  PBDataWriterWriteDoubleField();
  id v4 = v10;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt64Field();
    id v4 = v10;
  }
LABEL_8:
  if (self->_sourceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_predicate)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v10;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x80) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v10;
  }
  if (self->_visibilityPredicate)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_visibilityStartDate)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_visibilityEndDate)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_availabilityPredicate)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_availabilityStartDate)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_availabilityEndDate)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_alertabilityPredicate)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_alertDates)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v10;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_34:
      if ((v7 & 0x40) == 0) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_34;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v10;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_35:
    PBDataWriterWriteInt64Field();
    id v4 = v10;
  }
LABEL_36:
  if (self->_canonicalUnit)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_valueExpression)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_progressExpression)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_goalExpression)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v10;
    __int16 v8 = (__int16)self->_has;
  }
  if ((v8 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v10;
  }
  if (self->_availableCountryCodes)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_availableSuffixes)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_gracePredicate)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_graceVisibilityPredicate)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_graceValueExpression)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_graceProgressExpression)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_graceGoalExpression)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v10;
    __int16 v9 = (__int16)self->_has;
    if ((v9 & 0x400) == 0)
    {
LABEL_64:
      if ((v9 & 0x100) == 0) {
        goto LABEL_65;
      }
      goto LABEL_85;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_64;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v10;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x100) == 0)
  {
LABEL_65:
    if ((v9 & 4) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
LABEL_85:
  PBDataWriterWriteInt64Field();
  id v4 = v10;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_66:
    PBDataWriterWriteDoubleField();
    id v4 = v10;
  }
LABEL_67:
  if (self->_dailyTargetCanonicalUnit)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v10;
  }
  if (self->_prerequisiteTemplateName)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
}

- (BOOL)hasUniqueName
{
  return self->_uniqueName != 0;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasVersion
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasMinimumEngineVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasMinimumEngineVersion
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasCreatedDate:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCreatedDate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasCreatorDevice:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCreatorDevice
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasSourceName
{
  return self->_sourceName != 0;
}

- (BOOL)hasPredicate
{
  return self->_predicate != 0;
}

- (void)setHasTriggers:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTriggers
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasEarnLimit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasEarnLimit
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasVisibilityPredicate
{
  return self->_visibilityPredicate != 0;
}

- (BOOL)hasVisibilityStartDate
{
  return self->_visibilityStartDate != 0;
}

- (BOOL)hasVisibilityEndDate
{
  return self->_visibilityEndDate != 0;
}

- (BOOL)hasAvailabilityPredicate
{
  return self->_availabilityPredicate != 0;
}

- (BOOL)hasAvailabilityStartDate
{
  return self->_availabilityStartDate != 0;
}

- (BOOL)hasAvailabilityEndDate
{
  return self->_availabilityEndDate != 0;
}

- (BOOL)hasAlertabilityPredicate
{
  return self->_alertabilityPredicate != 0;
}

- (BOOL)hasAlertDates
{
  return self->_alertDates != 0;
}

- (void)setHasDuplicateRemovalStrategy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDuplicateRemovalStrategy
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasDuplicateRemovalCalendarUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDuplicateRemovalCalendarUnit
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasEarnDateStrategy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasEarnDateStrategy
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasCanonicalUnit
{
  return self->_canonicalUnit != 0;
}

- (BOOL)hasValueExpression
{
  return self->_valueExpression != 0;
}

- (BOOL)hasProgressExpression
{
  return self->_progressExpression != 0;
}

- (BOOL)hasGoalExpression
{
  return self->_goalExpression != 0;
}

- (void)setHasDisplayOrder:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDisplayOrder
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasDisplaysEarnedInstanceCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasDisplaysEarnedInstanceCount
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (BOOL)hasAvailableCountryCodes
{
  return self->_availableCountryCodes != 0;
}

- (BOOL)hasAvailableSuffixes
{
  return self->_availableSuffixes != 0;
}

- (BOOL)hasGracePredicate
{
  return self->_gracePredicate != 0;
}

- (BOOL)hasGraceVisibilityPredicate
{
  return self->_graceVisibilityPredicate != 0;
}

- (BOOL)hasGraceValueExpression
{
  return self->_graceValueExpression != 0;
}

- (BOOL)hasGraceProgressExpression
{
  return self->_graceProgressExpression != 0;
}

- (BOOL)hasGraceGoalExpression
{
  return self->_graceGoalExpression != 0;
}

- (void)setHasAvailableOnPairedDevice:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasAvailableOnPairedDevice
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasMobileAssetVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasMobileAssetVersion
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasKey:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasKey
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasDailyTarget:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDailyTarget
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasDailyTargetCanonicalUnit
{
  return self->_dailyTargetCanonicalUnit != 0;
}

- (BOOL)hasPrerequisiteTemplateName
{
  return self->_prerequisiteTemplateName != 0;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACHCodableTemplate;
  id v4 = [(ACHCodableTemplate *)&v8 description];
  v5 = [(ACHCodableTemplate *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  uniqueName = self->_uniqueName;
  if (uniqueName) {
    [v3 setObject:uniqueName forKey:@"uniqueName"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    v45 = [NSNumber numberWithLongLong:self->_version];
    [v4 setObject:v45 forKey:@"version"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_76;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  v46 = [NSNumber numberWithLongLong:self->_minimumEngineVersion];
  [v4 setObject:v46 forKey:@"minimumEngineVersion"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_76:
  v47 = [NSNumber numberWithDouble:self->_createdDate];
  [v4 setObject:v47 forKey:@"createdDate"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    __int16 v7 = [NSNumber numberWithLongLong:self->_creatorDevice];
    [v4 setObject:v7 forKey:@"creatorDevice"];
  }
LABEL_8:
  sourceName = self->_sourceName;
  if (sourceName) {
    [v4 setObject:sourceName forKey:@"sourceName"];
  }
  predicate = self->_predicate;
  if (predicate) {
    [v4 setObject:predicate forKey:@"predicate"];
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x800) != 0)
  {
    v11 = [NSNumber numberWithLongLong:self->_triggers];
    [v4 setObject:v11 forKey:@"triggers"];

    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 0x80) != 0)
  {
    v12 = [NSNumber numberWithLongLong:self->_earnLimit];
    [v4 setObject:v12 forKey:@"earnLimit"];
  }
  visibilityPredicate = self->_visibilityPredicate;
  if (visibilityPredicate) {
    [v4 setObject:visibilityPredicate forKey:@"visibilityPredicate"];
  }
  visibilityStartDate = self->_visibilityStartDate;
  if (visibilityStartDate) {
    [v4 setObject:visibilityStartDate forKey:@"visibilityStartDate"];
  }
  visibilityEndDate = self->_visibilityEndDate;
  if (visibilityEndDate) {
    [v4 setObject:visibilityEndDate forKey:@"visibilityEndDate"];
  }
  availabilityPredicate = self->_availabilityPredicate;
  if (availabilityPredicate) {
    [v4 setObject:availabilityPredicate forKey:@"availabilityPredicate"];
  }
  availabilityStartDate = self->_availabilityStartDate;
  if (availabilityStartDate) {
    [v4 setObject:availabilityStartDate forKey:@"availabilityStartDate"];
  }
  availabilityEndDate = self->_availabilityEndDate;
  if (availabilityEndDate) {
    [v4 setObject:availabilityEndDate forKey:@"availabilityEndDate"];
  }
  alertabilityPredicate = self->_alertabilityPredicate;
  if (alertabilityPredicate) {
    [v4 setObject:alertabilityPredicate forKey:@"alertabilityPredicate"];
  }
  alertDates = self->_alertDates;
  if (alertDates) {
    [v4 setObject:alertDates forKey:@"alertDates"];
  }
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x20) != 0)
  {
    v48 = [NSNumber numberWithLongLong:self->_duplicateRemovalStrategy];
    [v4 setObject:v48 forKey:@"duplicateRemovalStrategy"];

    __int16 v21 = (__int16)self->_has;
    if ((v21 & 0x10) == 0)
    {
LABEL_34:
      if ((v21 & 0x40) == 0) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
  }
  else if ((v21 & 0x10) == 0)
  {
    goto LABEL_34;
  }
  v49 = [NSNumber numberWithLongLong:self->_duplicateRemovalCalendarUnit];
  [v4 setObject:v49 forKey:@"duplicateRemovalCalendarUnit"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_35:
    v22 = [NSNumber numberWithLongLong:self->_earnDateStrategy];
    [v4 setObject:v22 forKey:@"earnDateStrategy"];
  }
LABEL_36:
  canonicalUnit = self->_canonicalUnit;
  if (canonicalUnit) {
    [v4 setObject:canonicalUnit forKey:@"canonicalUnit"];
  }
  valueExpression = self->_valueExpression;
  if (valueExpression) {
    [v4 setObject:valueExpression forKey:@"valueExpression"];
  }
  progressExpression = self->_progressExpression;
  if (progressExpression) {
    [v4 setObject:progressExpression forKey:@"progressExpression"];
  }
  goalExpression = self->_goalExpression;
  if (goalExpression) {
    [v4 setObject:goalExpression forKey:@"goalExpression"];
  }
  __int16 v27 = (__int16)self->_has;
  if ((v27 & 8) != 0)
  {
    v28 = [NSNumber numberWithLongLong:self->_displayOrder];
    [v4 setObject:v28 forKey:@"displayOrder"];

    __int16 v27 = (__int16)self->_has;
  }
  if ((v27 & 0x4000) != 0)
  {
    v29 = [NSNumber numberWithBool:self->_displaysEarnedInstanceCount];
    [v4 setObject:v29 forKey:@"displaysEarnedInstanceCount"];
  }
  availableCountryCodes = self->_availableCountryCodes;
  if (availableCountryCodes) {
    [v4 setObject:availableCountryCodes forKey:@"availableCountryCodes"];
  }
  availableSuffixes = self->_availableSuffixes;
  if (availableSuffixes) {
    [v4 setObject:availableSuffixes forKey:@"availableSuffixes"];
  }
  gracePredicate = self->_gracePredicate;
  if (gracePredicate) {
    [v4 setObject:gracePredicate forKey:@"gracePredicate"];
  }
  graceVisibilityPredicate = self->_graceVisibilityPredicate;
  if (graceVisibilityPredicate) {
    [v4 setObject:graceVisibilityPredicate forKey:@"graceVisibilityPredicate"];
  }
  graceValueExpression = self->_graceValueExpression;
  if (graceValueExpression) {
    [v4 setObject:graceValueExpression forKey:@"graceValueExpression"];
  }
  graceProgressExpression = self->_graceProgressExpression;
  if (graceProgressExpression) {
    [v4 setObject:graceProgressExpression forKey:@"graceProgressExpression"];
  }
  graceGoalExpression = self->_graceGoalExpression;
  if (graceGoalExpression) {
    [v4 setObject:graceGoalExpression forKey:@"graceGoalExpression"];
  }
  __int16 v37 = (__int16)self->_has;
  if ((v37 & 0x2000) != 0)
  {
    v50 = [NSNumber numberWithBool:self->_availableOnPairedDevice];
    [v4 setObject:v50 forKey:@"availableOnPairedDevice"];

    __int16 v37 = (__int16)self->_has;
    if ((v37 & 0x400) == 0)
    {
LABEL_64:
      if ((v37 & 0x100) == 0) {
        goto LABEL_65;
      }
      goto LABEL_83;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_64;
  }
  v51 = [NSNumber numberWithLongLong:self->_mobileAssetVersion];
  [v4 setObject:v51 forKey:@"mobileAssetVersion"];

  __int16 v37 = (__int16)self->_has;
  if ((v37 & 0x100) == 0)
  {
LABEL_65:
    if ((v37 & 4) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
LABEL_83:
  v52 = [NSNumber numberWithLongLong:self->_key];
  [v4 setObject:v52 forKey:@"key"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_66:
    v38 = [NSNumber numberWithDouble:self->_dailyTarget];
    [v4 setObject:v38 forKey:@"dailyTarget"];
  }
LABEL_67:
  dailyTargetCanonicalUnit = self->_dailyTargetCanonicalUnit;
  if (dailyTargetCanonicalUnit) {
    [v4 setObject:dailyTargetCanonicalUnit forKey:@"dailyTargetCanonicalUnit"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v41 = [(ACHCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v41 forKey:@"syncIdentity"];
  }
  prerequisiteTemplateName = self->_prerequisiteTemplateName;
  if (prerequisiteTemplateName) {
    [v4 setObject:prerequisiteTemplateName forKey:@"prerequisiteTemplateName"];
  }
  id v43 = v4;

  return v43;
}

- (BOOL)readFrom:(id)a3
{
  return ACHCodableTemplateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_uniqueName)
  {
    objc_msgSend(v4, "setUniqueName:");
    id v4 = v10;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *((void *)v4 + 13) = self->_version;
    *((_WORD *)v4 + 158) |= 0x1000u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_78;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 10) = self->_minimumEngineVersion;
  *((_WORD *)v4 + 158) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_78:
  *((void *)v4 + 1) = *(void *)&self->_createdDate;
  *((_WORD *)v4 + 158) |= 1u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    *((void *)v4 + 2) = self->_creatorDevice;
    *((_WORD *)v4 + 158) |= 2u;
  }
LABEL_8:
  if (self->_sourceName)
  {
    objc_msgSend(v10, "setSourceName:");
    id v4 = v10;
  }
  if (self->_predicate)
  {
    objc_msgSend(v10, "setPredicate:");
    id v4 = v10;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) != 0)
  {
    *((void *)v4 + 12) = self->_triggers;
    *((_WORD *)v4 + 158) |= 0x800u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x80) != 0)
  {
    *((void *)v4 + 8) = self->_earnLimit;
    *((_WORD *)v4 + 158) |= 0x80u;
  }
  if (self->_visibilityPredicate)
  {
    objc_msgSend(v10, "setVisibilityPredicate:");
    id v4 = v10;
  }
  if (self->_visibilityStartDate)
  {
    objc_msgSend(v10, "setVisibilityStartDate:");
    id v4 = v10;
  }
  if (self->_visibilityEndDate)
  {
    objc_msgSend(v10, "setVisibilityEndDate:");
    id v4 = v10;
  }
  if (self->_availabilityPredicate)
  {
    objc_msgSend(v10, "setAvailabilityPredicate:");
    id v4 = v10;
  }
  if (self->_availabilityStartDate)
  {
    objc_msgSend(v10, "setAvailabilityStartDate:");
    id v4 = v10;
  }
  if (self->_availabilityEndDate)
  {
    objc_msgSend(v10, "setAvailabilityEndDate:");
    id v4 = v10;
  }
  if (self->_alertabilityPredicate)
  {
    objc_msgSend(v10, "setAlertabilityPredicate:");
    id v4 = v10;
  }
  if (self->_alertDates)
  {
    objc_msgSend(v10, "setAlertDates:");
    id v4 = v10;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x20) != 0)
  {
    *((void *)v4 + 6) = self->_duplicateRemovalStrategy;
    *((_WORD *)v4 + 158) |= 0x20u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_34:
      if ((v7 & 0x40) == 0) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_34;
  }
  *((void *)v4 + 5) = self->_duplicateRemovalCalendarUnit;
  *((_WORD *)v4 + 158) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_35:
    *((void *)v4 + 7) = self->_earnDateStrategy;
    *((_WORD *)v4 + 158) |= 0x40u;
  }
LABEL_36:
  if (self->_canonicalUnit)
  {
    objc_msgSend(v10, "setCanonicalUnit:");
    id v4 = v10;
  }
  if (self->_valueExpression)
  {
    objc_msgSend(v10, "setValueExpression:");
    id v4 = v10;
  }
  if (self->_progressExpression)
  {
    objc_msgSend(v10, "setProgressExpression:");
    id v4 = v10;
  }
  if (self->_goalExpression)
  {
    objc_msgSend(v10, "setGoalExpression:");
    id v4 = v10;
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 8) != 0)
  {
    *((void *)v4 + 4) = self->_displayOrder;
    *((_WORD *)v4 + 158) |= 8u;
    __int16 v8 = (__int16)self->_has;
  }
  if ((v8 & 0x4000) != 0)
  {
    *((unsigned char *)v4 + 313) = self->_displaysEarnedInstanceCount;
    *((_WORD *)v4 + 158) |= 0x4000u;
  }
  if (self->_availableCountryCodes)
  {
    objc_msgSend(v10, "setAvailableCountryCodes:");
    id v4 = v10;
  }
  if (self->_availableSuffixes)
  {
    objc_msgSend(v10, "setAvailableSuffixes:");
    id v4 = v10;
  }
  if (self->_gracePredicate)
  {
    objc_msgSend(v10, "setGracePredicate:");
    id v4 = v10;
  }
  if (self->_graceVisibilityPredicate)
  {
    objc_msgSend(v10, "setGraceVisibilityPredicate:");
    id v4 = v10;
  }
  if (self->_graceValueExpression)
  {
    objc_msgSend(v10, "setGraceValueExpression:");
    id v4 = v10;
  }
  if (self->_graceProgressExpression)
  {
    objc_msgSend(v10, "setGraceProgressExpression:");
    id v4 = v10;
  }
  if (self->_graceGoalExpression)
  {
    objc_msgSend(v10, "setGraceGoalExpression:");
    id v4 = v10;
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x2000) != 0)
  {
    *((unsigned char *)v4 + 312) = self->_availableOnPairedDevice;
    *((_WORD *)v4 + 158) |= 0x2000u;
    __int16 v9 = (__int16)self->_has;
    if ((v9 & 0x400) == 0)
    {
LABEL_64:
      if ((v9 & 0x100) == 0) {
        goto LABEL_65;
      }
      goto LABEL_85;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_64;
  }
  *((void *)v4 + 11) = self->_mobileAssetVersion;
  *((_WORD *)v4 + 158) |= 0x400u;
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x100) == 0)
  {
LABEL_65:
    if ((v9 & 4) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
LABEL_85:
  *((void *)v4 + 9) = self->_key;
  *((_WORD *)v4 + 158) |= 0x100u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_66:
    *((void *)v4 + 3) = *(void *)&self->_dailyTarget;
    *((_WORD *)v4 + 158) |= 4u;
  }
LABEL_67:
  if (self->_dailyTargetCanonicalUnit)
  {
    objc_msgSend(v10, "setDailyTargetCanonicalUnit:");
    id v4 = v10;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v10, "setSyncIdentity:");
    id v4 = v10;
  }
  if (self->_prerequisiteTemplateName)
  {
    objc_msgSend(v10, "setPrerequisiteTemplateName:");
    id v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueName copyWithZone:a3];
  __int16 v7 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *(void *)(v5 + 104) = self->_version;
    *(_WORD *)(v5 + 316) |= 0x1000u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 80) = self->_minimumEngineVersion;
  *(_WORD *)(v5 + 316) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_26:
  *(double *)(v5 + 8) = self->_createdDate;
  *(_WORD *)(v5 + 316) |= 1u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_5:
    *(void *)(v5 + 16) = self->_creatorDevice;
    *(_WORD *)(v5 + 316) |= 2u;
  }
LABEL_6:
  uint64_t v9 = [(NSString *)self->_sourceName copyWithZone:a3];
  id v10 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v9;

  uint64_t v11 = [(NSString *)self->_predicate copyWithZone:a3];
  v12 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v11;

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x800) != 0)
  {
    *(void *)(v5 + 96) = self->_triggers;
    *(_WORD *)(v5 + 316) |= 0x800u;
    __int16 v13 = (__int16)self->_has;
  }
  if ((v13 & 0x80) != 0)
  {
    *(void *)(v5 + 64) = self->_earnLimit;
    *(_WORD *)(v5 + 316) |= 0x80u;
  }
  uint64_t v14 = [(NSString *)self->_visibilityPredicate copyWithZone:a3];
  v15 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v14;

  uint64_t v16 = [(NSString *)self->_visibilityStartDate copyWithZone:a3];
  v17 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v16;

  uint64_t v18 = [(NSString *)self->_visibilityEndDate copyWithZone:a3];
  v19 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v18;

  uint64_t v20 = [(NSString *)self->_availabilityPredicate copyWithZone:a3];
  __int16 v21 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v20;

  uint64_t v22 = [(NSString *)self->_availabilityStartDate copyWithZone:a3];
  v23 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v22;

  uint64_t v24 = [(NSString *)self->_availabilityEndDate copyWithZone:a3];
  v25 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v24;

  uint64_t v26 = [(NSString *)self->_alertabilityPredicate copyWithZone:a3];
  __int16 v27 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v26;

  uint64_t v28 = [(NSString *)self->_alertDates copyWithZone:a3];
  v29 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v28;

  __int16 v30 = (__int16)self->_has;
  if ((v30 & 0x20) != 0)
  {
    *(void *)(v5 + 48) = self->_duplicateRemovalStrategy;
    *(_WORD *)(v5 + 316) |= 0x20u;
    __int16 v30 = (__int16)self->_has;
    if ((v30 & 0x10) == 0)
    {
LABEL_12:
      if ((v30 & 0x40) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v30 & 0x10) == 0)
  {
    goto LABEL_12;
  }
  *(void *)(v5 + 40) = self->_duplicateRemovalCalendarUnit;
  *(_WORD *)(v5 + 316) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    *(void *)(v5 + 56) = self->_earnDateStrategy;
    *(_WORD *)(v5 + 316) |= 0x40u;
  }
LABEL_14:
  uint64_t v31 = [(NSString *)self->_canonicalUnit copyWithZone:a3];
  v32 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v31;

  uint64_t v33 = [(NSString *)self->_valueExpression copyWithZone:a3];
  v34 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v33;

  uint64_t v35 = [(NSString *)self->_progressExpression copyWithZone:a3];
  v36 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v35;

  uint64_t v37 = [(NSString *)self->_goalExpression copyWithZone:a3];
  v38 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v37;

  __int16 v39 = (__int16)self->_has;
  if ((v39 & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_displayOrder;
    *(_WORD *)(v5 + 316) |= 8u;
    __int16 v39 = (__int16)self->_has;
  }
  if ((v39 & 0x4000) != 0)
  {
    *(unsigned char *)(v5 + 313) = self->_displaysEarnedInstanceCount;
    *(_WORD *)(v5 + 316) |= 0x4000u;
  }
  uint64_t v40 = [(NSString *)self->_availableCountryCodes copyWithZone:a3];
  v41 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v40;

  uint64_t v42 = [(NSString *)self->_availableSuffixes copyWithZone:a3];
  id v43 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v42;

  uint64_t v44 = [(NSString *)self->_gracePredicate copyWithZone:a3];
  v45 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v44;

  uint64_t v46 = [(NSString *)self->_graceVisibilityPredicate copyWithZone:a3];
  v47 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v46;

  uint64_t v48 = [(NSString *)self->_graceValueExpression copyWithZone:a3];
  v49 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v48;

  uint64_t v50 = [(NSString *)self->_graceProgressExpression copyWithZone:a3];
  v51 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v50;

  uint64_t v52 = [(NSString *)self->_graceGoalExpression copyWithZone:a3];
  v53 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v52;

  __int16 v54 = (__int16)self->_has;
  if ((v54 & 0x2000) != 0)
  {
    *(unsigned char *)(v5 + 312) = self->_availableOnPairedDevice;
    *(_WORD *)(v5 + 316) |= 0x2000u;
    __int16 v54 = (__int16)self->_has;
    if ((v54 & 0x400) == 0)
    {
LABEL_20:
      if ((v54 & 0x100) == 0) {
        goto LABEL_21;
      }
LABEL_33:
      *(void *)(v5 + 72) = self->_key;
      *(_WORD *)(v5 + 316) |= 0x100u;
      if ((*(_WORD *)&self->_has & 4) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_20;
  }
  *(void *)(v5 + 88) = self->_mobileAssetVersion;
  *(_WORD *)(v5 + 316) |= 0x400u;
  __int16 v54 = (__int16)self->_has;
  if ((v54 & 0x100) != 0) {
    goto LABEL_33;
  }
LABEL_21:
  if ((v54 & 4) != 0)
  {
LABEL_22:
    *(double *)(v5 + 24) = self->_dailyTarget;
    *(_WORD *)(v5 + 316) |= 4u;
  }
LABEL_23:
  uint64_t v55 = [(NSString *)self->_dailyTargetCanonicalUnit copyWithZone:a3];
  v56 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v55;

  id v57 = [(ACHCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v58 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v57;

  uint64_t v59 = [(NSString *)self->_prerequisiteTemplateName copyWithZone:a3];
  v60 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v59;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_133;
  }
  uniqueName = self->_uniqueName;
  if ((unint64_t)uniqueName | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](uniqueName, "isEqual:")) {
      goto LABEL_133;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 158);
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 158) & 0x1000) == 0 || self->_version != *((void *)v4 + 13)) {
      goto LABEL_133;
    }
  }
  else if ((*((_WORD *)v4 + 158) & 0x1000) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 158) & 0x200) == 0 || self->_minimumEngineVersion != *((void *)v4 + 10)) {
      goto LABEL_133;
    }
  }
  else if ((*((_WORD *)v4 + 158) & 0x200) != 0)
  {
    goto LABEL_133;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_createdDate != *((double *)v4 + 1)) {
      goto LABEL_133;
    }
  }
  else if (v7)
  {
    goto LABEL_133;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_creatorDevice != *((void *)v4 + 2)) {
      goto LABEL_133;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_133;
  }
  sourceName = self->_sourceName;
  if ((unint64_t)sourceName | *((void *)v4 + 32)
    && !-[NSString isEqual:](sourceName, "isEqual:"))
  {
    goto LABEL_133;
  }
  predicate = self->_predicate;
  if ((unint64_t)predicate | *((void *)v4 + 29))
  {
    if (!-[NSString isEqual:](predicate, "isEqual:")) {
      goto LABEL_133;
    }
  }
  __int16 v10 = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 158);
  if ((v10 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 158) & 0x800) == 0 || self->_triggers != *((void *)v4 + 12)) {
      goto LABEL_133;
    }
  }
  else if ((*((_WORD *)v4 + 158) & 0x800) != 0)
  {
    goto LABEL_133;
  }
  if ((v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_earnLimit != *((void *)v4 + 8)) {
      goto LABEL_133;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_133;
  }
  visibilityPredicate = self->_visibilityPredicate;
  if ((unint64_t)visibilityPredicate | *((void *)v4 + 37)
    && !-[NSString isEqual:](visibilityPredicate, "isEqual:"))
  {
    goto LABEL_133;
  }
  visibilityStartDate = self->_visibilityStartDate;
  if ((unint64_t)visibilityStartDate | *((void *)v4 + 38))
  {
    if (!-[NSString isEqual:](visibilityStartDate, "isEqual:")) {
      goto LABEL_133;
    }
  }
  visibilityEndDate = self->_visibilityEndDate;
  if ((unint64_t)visibilityEndDate | *((void *)v4 + 36))
  {
    if (!-[NSString isEqual:](visibilityEndDate, "isEqual:")) {
      goto LABEL_133;
    }
  }
  availabilityPredicate = self->_availabilityPredicate;
  if ((unint64_t)availabilityPredicate | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](availabilityPredicate, "isEqual:")) {
      goto LABEL_133;
    }
  }
  availabilityStartDate = self->_availabilityStartDate;
  if ((unint64_t)availabilityStartDate | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](availabilityStartDate, "isEqual:")) {
      goto LABEL_133;
    }
  }
  availabilityEndDate = self->_availabilityEndDate;
  if ((unint64_t)availabilityEndDate | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](availabilityEndDate, "isEqual:")) {
      goto LABEL_133;
    }
  }
  alertabilityPredicate = self->_alertabilityPredicate;
  if ((unint64_t)alertabilityPredicate | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](alertabilityPredicate, "isEqual:")) {
      goto LABEL_133;
    }
  }
  alertDates = self->_alertDates;
  if ((unint64_t)alertDates | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](alertDates, "isEqual:")) {
      goto LABEL_133;
    }
  }
  __int16 v20 = (__int16)self->_has;
  __int16 v21 = *((_WORD *)v4 + 158);
  if ((v20 & 0x20) != 0)
  {
    if ((v21 & 0x20) == 0 || self->_duplicateRemovalStrategy != *((void *)v4 + 6)) {
      goto LABEL_133;
    }
  }
  else if ((v21 & 0x20) != 0)
  {
    goto LABEL_133;
  }
  if ((v20 & 0x10) != 0)
  {
    if ((v21 & 0x10) == 0 || self->_duplicateRemovalCalendarUnit != *((void *)v4 + 5)) {
      goto LABEL_133;
    }
  }
  else if ((v21 & 0x10) != 0)
  {
    goto LABEL_133;
  }
  if ((v20 & 0x40) != 0)
  {
    if ((v21 & 0x40) == 0 || self->_earnDateStrategy != *((void *)v4 + 7)) {
      goto LABEL_133;
    }
  }
  else if ((v21 & 0x40) != 0)
  {
    goto LABEL_133;
  }
  canonicalUnit = self->_canonicalUnit;
  if ((unint64_t)canonicalUnit | *((void *)v4 + 21)
    && !-[NSString isEqual:](canonicalUnit, "isEqual:"))
  {
    goto LABEL_133;
  }
  valueExpression = self->_valueExpression;
  if ((unint64_t)valueExpression | *((void *)v4 + 35))
  {
    if (!-[NSString isEqual:](valueExpression, "isEqual:")) {
      goto LABEL_133;
    }
  }
  progressExpression = self->_progressExpression;
  if ((unint64_t)progressExpression | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](progressExpression, "isEqual:")) {
      goto LABEL_133;
    }
  }
  goalExpression = self->_goalExpression;
  if ((unint64_t)goalExpression | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](goalExpression, "isEqual:")) {
      goto LABEL_133;
    }
  }
  __int16 v26 = *((_WORD *)v4 + 158);
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    if ((v26 & 8) == 0 || self->_displayOrder != *((void *)v4 + 4)) {
      goto LABEL_133;
    }
  }
  else if ((v26 & 8) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 158) & 0x4000) == 0) {
      goto LABEL_133;
    }
    if (self->_displaysEarnedInstanceCount)
    {
      if (!*((unsigned char *)v4 + 313)) {
        goto LABEL_133;
      }
    }
    else if (*((unsigned char *)v4 + 313))
    {
      goto LABEL_133;
    }
  }
  else if ((*((_WORD *)v4 + 158) & 0x4000) != 0)
  {
    goto LABEL_133;
  }
  availableCountryCodes = self->_availableCountryCodes;
  if ((unint64_t)availableCountryCodes | *((void *)v4 + 19)
    && !-[NSString isEqual:](availableCountryCodes, "isEqual:"))
  {
    goto LABEL_133;
  }
  availableSuffixes = self->_availableSuffixes;
  if ((unint64_t)availableSuffixes | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](availableSuffixes, "isEqual:")) {
      goto LABEL_133;
    }
  }
  gracePredicate = self->_gracePredicate;
  if ((unint64_t)gracePredicate | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](gracePredicate, "isEqual:")) {
      goto LABEL_133;
    }
  }
  graceVisibilityPredicate = self->_graceVisibilityPredicate;
  if ((unint64_t)graceVisibilityPredicate | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](graceVisibilityPredicate, "isEqual:")) {
      goto LABEL_133;
    }
  }
  graceValueExpression = self->_graceValueExpression;
  if ((unint64_t)graceValueExpression | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](graceValueExpression, "isEqual:")) {
      goto LABEL_133;
    }
  }
  graceProgressExpression = self->_graceProgressExpression;
  if ((unint64_t)graceProgressExpression | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](graceProgressExpression, "isEqual:")) {
      goto LABEL_133;
    }
  }
  graceGoalExpression = self->_graceGoalExpression;
  if ((unint64_t)graceGoalExpression | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](graceGoalExpression, "isEqual:")) {
      goto LABEL_133;
    }
  }
  __int16 v34 = (__int16)self->_has;
  __int16 v35 = *((_WORD *)v4 + 158);
  if ((v34 & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 158) & 0x2000) != 0)
    {
      if (self->_availableOnPairedDevice)
      {
        if (!*((unsigned char *)v4 + 312)) {
          goto LABEL_133;
        }
        goto LABEL_112;
      }
      if (!*((unsigned char *)v4 + 312)) {
        goto LABEL_112;
      }
    }
LABEL_133:
    char v39 = 0;
    goto LABEL_134;
  }
  if ((*((_WORD *)v4 + 158) & 0x2000) != 0) {
    goto LABEL_133;
  }
LABEL_112:
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 158) & 0x400) == 0 || self->_mobileAssetVersion != *((void *)v4 + 11)) {
      goto LABEL_133;
    }
  }
  else if ((*((_WORD *)v4 + 158) & 0x400) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 158) & 0x100) == 0 || self->_key != *((void *)v4 + 9)) {
      goto LABEL_133;
    }
  }
  else if ((*((_WORD *)v4 + 158) & 0x100) != 0)
  {
    goto LABEL_133;
  }
  if ((v34 & 4) != 0)
  {
    if ((v35 & 4) == 0 || self->_dailyTarget != *((double *)v4 + 3)) {
      goto LABEL_133;
    }
  }
  else if ((v35 & 4) != 0)
  {
    goto LABEL_133;
  }
  dailyTargetCanonicalUnit = self->_dailyTargetCanonicalUnit;
  if ((unint64_t)dailyTargetCanonicalUnit | *((void *)v4 + 22)
    && !-[NSString isEqual:](dailyTargetCanonicalUnit, "isEqual:"))
  {
    goto LABEL_133;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 33))
  {
    if (!-[ACHCodableSyncIdentity isEqual:](syncIdentity, "isEqual:")) {
      goto LABEL_133;
    }
  }
  prerequisiteTemplateName = self->_prerequisiteTemplateName;
  if ((unint64_t)prerequisiteTemplateName | *((void *)v4 + 30)) {
    char v39 = -[NSString isEqual:](prerequisiteTemplateName, "isEqual:");
  }
  else {
    char v39 = 1;
  }
LABEL_134:

  return v39;
}

- (unint64_t)hash
{
  NSUInteger v56 = [(NSString *)self->_uniqueName hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
    uint64_t v55 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v54 = 0;
    if (has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v8 = 0;
    goto LABEL_13;
  }
  uint64_t v55 = 2654435761 * self->_version;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v54 = 2654435761 * self->_minimumEngineVersion;
  if ((has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double createdDate = self->_createdDate;
  double v5 = -createdDate;
  if (createdDate >= 0.0) {
    double v5 = self->_createdDate;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_13:
  unint64_t v53 = v8;
  if ((has & 2) != 0) {
    uint64_t v52 = 2654435761 * self->_creatorDevice;
  }
  else {
    uint64_t v52 = 0;
  }
  NSUInteger v51 = [(NSString *)self->_sourceName hash];
  NSUInteger v50 = [(NSString *)self->_predicate hash];
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x800) != 0)
  {
    uint64_t v49 = 2654435761 * self->_triggers;
    if ((v9 & 0x80) != 0) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v49 = 0;
    if ((v9 & 0x80) != 0)
    {
LABEL_18:
      uint64_t v48 = 2654435761 * self->_earnLimit;
      goto LABEL_21;
    }
  }
  uint64_t v48 = 0;
LABEL_21:
  NSUInteger v47 = [(NSString *)self->_visibilityPredicate hash];
  NSUInteger v46 = [(NSString *)self->_visibilityStartDate hash];
  NSUInteger v45 = [(NSString *)self->_visibilityEndDate hash];
  NSUInteger v44 = [(NSString *)self->_availabilityPredicate hash];
  NSUInteger v43 = [(NSString *)self->_availabilityStartDate hash];
  NSUInteger v42 = [(NSString *)self->_availabilityEndDate hash];
  NSUInteger v41 = [(NSString *)self->_alertabilityPredicate hash];
  NSUInteger v40 = [(NSString *)self->_alertDates hash];
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
    uint64_t v39 = 0;
    if ((v10 & 0x10) != 0) {
      goto LABEL_23;
    }
LABEL_26:
    uint64_t v38 = 0;
    if ((v10 & 0x40) != 0) {
      goto LABEL_24;
    }
    goto LABEL_27;
  }
  uint64_t v39 = 2654435761 * self->_duplicateRemovalStrategy;
  if ((v10 & 0x10) == 0) {
    goto LABEL_26;
  }
LABEL_23:
  uint64_t v38 = 2654435761 * self->_duplicateRemovalCalendarUnit;
  if ((v10 & 0x40) != 0)
  {
LABEL_24:
    uint64_t v37 = 2654435761 * self->_earnDateStrategy;
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v37 = 0;
LABEL_28:
  NSUInteger v36 = [(NSString *)self->_canonicalUnit hash];
  NSUInteger v35 = [(NSString *)self->_valueExpression hash];
  NSUInteger v34 = [(NSString *)self->_progressExpression hash];
  NSUInteger v33 = [(NSString *)self->_goalExpression hash];
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    uint64_t v32 = 2654435761 * self->_displayOrder;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
    {
LABEL_30:
      uint64_t v31 = 2654435761 * self->_displaysEarnedInstanceCount;
      goto LABEL_33;
    }
  }
  uint64_t v31 = 0;
LABEL_33:
  NSUInteger v30 = [(NSString *)self->_availableCountryCodes hash];
  NSUInteger v29 = [(NSString *)self->_availableSuffixes hash];
  NSUInteger v11 = [(NSString *)self->_gracePredicate hash];
  NSUInteger v12 = [(NSString *)self->_graceVisibilityPredicate hash];
  NSUInteger v13 = [(NSString *)self->_graceValueExpression hash];
  NSUInteger v14 = [(NSString *)self->_graceProgressExpression hash];
  NSUInteger v15 = [(NSString *)self->_graceGoalExpression hash];
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x2000) != 0)
  {
    uint64_t v17 = 2654435761 * self->_availableOnPairedDevice;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_35:
      uint64_t v18 = 2654435761 * self->_mobileAssetVersion;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_36;
      }
LABEL_43:
      uint64_t v19 = 0;
      if ((v16 & 4) != 0) {
        goto LABEL_37;
      }
LABEL_44:
      unint64_t v24 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_35;
    }
  }
  uint64_t v18 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_43;
  }
LABEL_36:
  uint64_t v19 = 2654435761 * self->_key;
  if ((v16 & 4) == 0) {
    goto LABEL_44;
  }
LABEL_37:
  double dailyTarget = self->_dailyTarget;
  double v21 = -dailyTarget;
  if (dailyTarget >= 0.0) {
    double v21 = self->_dailyTarget;
  }
  long double v22 = floor(v21 + 0.5);
  double v23 = (v21 - v22) * 1.84467441e19;
  unint64_t v24 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0) {
      v24 += (unint64_t)v23;
    }
  }
  else
  {
    v24 -= (unint64_t)fabs(v23);
  }
LABEL_47:
  NSUInteger v25 = v55 ^ v56 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v11 ^ v12 ^ v13 ^ v14;
  NSUInteger v26 = v15 ^ v17 ^ v18 ^ v19 ^ v24 ^ [(NSString *)self->_dailyTargetCanonicalUnit hash];
  unint64_t v27 = v26 ^ [(ACHCodableSyncIdentity *)self->_syncIdentity hash];
  return v25 ^ v27 ^ [(NSString *)self->_prerequisiteTemplateName hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (*((void *)v4 + 34))
  {
    -[ACHCodableTemplate setUniqueName:](self, "setUniqueName:");
    id v4 = v12;
  }
  __int16 v5 = *((_WORD *)v4 + 158);
  if ((v5 & 0x1000) != 0)
  {
    self->_version = *((void *)v4 + 13);
    *(_WORD *)&self->_has |= 0x1000u;
    __int16 v5 = *((_WORD *)v4 + 158);
    if ((v5 & 0x200) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_74;
    }
  }
  else if ((*((_WORD *)v4 + 158) & 0x200) == 0)
  {
    goto LABEL_5;
  }
  self->_minimumEngineVersion = *((void *)v4 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 158);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_74:
  self->_double createdDate = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v4 + 158) & 2) != 0)
  {
LABEL_7:
    self->_creatorDevice = *((void *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_8:
  if (*((void *)v4 + 32))
  {
    -[ACHCodableTemplate setSourceName:](self, "setSourceName:");
    id v4 = v12;
  }
  if (*((void *)v4 + 29))
  {
    -[ACHCodableTemplate setPredicate:](self, "setPredicate:");
    id v4 = v12;
  }
  __int16 v6 = *((_WORD *)v4 + 158);
  if ((v6 & 0x800) != 0)
  {
    self->_triggers = *((void *)v4 + 12);
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v6 = *((_WORD *)v4 + 158);
  }
  if ((v6 & 0x80) != 0)
  {
    self->_earnLimit = *((void *)v4 + 8);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 37))
  {
    -[ACHCodableTemplate setVisibilityPredicate:](self, "setVisibilityPredicate:");
    id v4 = v12;
  }
  if (*((void *)v4 + 38))
  {
    -[ACHCodableTemplate setVisibilityStartDate:](self, "setVisibilityStartDate:");
    id v4 = v12;
  }
  if (*((void *)v4 + 36))
  {
    -[ACHCodableTemplate setVisibilityEndDate:](self, "setVisibilityEndDate:");
    id v4 = v12;
  }
  if (*((void *)v4 + 17))
  {
    -[ACHCodableTemplate setAvailabilityPredicate:](self, "setAvailabilityPredicate:");
    id v4 = v12;
  }
  if (*((void *)v4 + 18))
  {
    -[ACHCodableTemplate setAvailabilityStartDate:](self, "setAvailabilityStartDate:");
    id v4 = v12;
  }
  if (*((void *)v4 + 16))
  {
    -[ACHCodableTemplate setAvailabilityEndDate:](self, "setAvailabilityEndDate:");
    id v4 = v12;
  }
  if (*((void *)v4 + 15))
  {
    -[ACHCodableTemplate setAlertabilityPredicate:](self, "setAlertabilityPredicate:");
    id v4 = v12;
  }
  if (*((void *)v4 + 14))
  {
    -[ACHCodableTemplate setAlertDates:](self, "setAlertDates:");
    id v4 = v12;
  }
  __int16 v7 = *((_WORD *)v4 + 158);
  if ((v7 & 0x20) != 0)
  {
    self->_duplicateRemovalStrategy = *((void *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v7 = *((_WORD *)v4 + 158);
    if ((v7 & 0x10) == 0)
    {
LABEL_34:
      if ((v7 & 0x40) == 0) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_34;
  }
  self->_duplicateRemovalCalendarUnit = *((void *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 158) & 0x40) != 0)
  {
LABEL_35:
    self->_earnDateStrategy = *((void *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_36:
  if (*((void *)v4 + 21))
  {
    -[ACHCodableTemplate setCanonicalUnit:](self, "setCanonicalUnit:");
    id v4 = v12;
  }
  if (*((void *)v4 + 35))
  {
    -[ACHCodableTemplate setValueExpression:](self, "setValueExpression:");
    id v4 = v12;
  }
  if (*((void *)v4 + 31))
  {
    -[ACHCodableTemplate setProgressExpression:](self, "setProgressExpression:");
    id v4 = v12;
  }
  if (*((void *)v4 + 23))
  {
    -[ACHCodableTemplate setGoalExpression:](self, "setGoalExpression:");
    id v4 = v12;
  }
  __int16 v8 = *((_WORD *)v4 + 158);
  if ((v8 & 8) != 0)
  {
    self->_displayOrder = *((void *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
    __int16 v8 = *((_WORD *)v4 + 158);
  }
  if ((v8 & 0x4000) != 0)
  {
    self->_displaysEarnedInstanceCount = *((unsigned char *)v4 + 313);
    *(_WORD *)&self->_has |= 0x4000u;
  }
  if (*((void *)v4 + 19))
  {
    -[ACHCodableTemplate setAvailableCountryCodes:](self, "setAvailableCountryCodes:");
    id v4 = v12;
  }
  if (*((void *)v4 + 20))
  {
    -[ACHCodableTemplate setAvailableSuffixes:](self, "setAvailableSuffixes:");
    id v4 = v12;
  }
  if (*((void *)v4 + 25))
  {
    -[ACHCodableTemplate setGracePredicate:](self, "setGracePredicate:");
    id v4 = v12;
  }
  if (*((void *)v4 + 28))
  {
    -[ACHCodableTemplate setGraceVisibilityPredicate:](self, "setGraceVisibilityPredicate:");
    id v4 = v12;
  }
  if (*((void *)v4 + 27))
  {
    -[ACHCodableTemplate setGraceValueExpression:](self, "setGraceValueExpression:");
    id v4 = v12;
  }
  if (*((void *)v4 + 26))
  {
    -[ACHCodableTemplate setGraceProgressExpression:](self, "setGraceProgressExpression:");
    id v4 = v12;
  }
  if (*((void *)v4 + 24))
  {
    -[ACHCodableTemplate setGraceGoalExpression:](self, "setGraceGoalExpression:");
    id v4 = v12;
  }
  __int16 v9 = *((_WORD *)v4 + 158);
  if ((v9 & 0x2000) != 0)
  {
    self->_availableOnPairedDevice = *((unsigned char *)v4 + 312);
    *(_WORD *)&self->_has |= 0x2000u;
    __int16 v9 = *((_WORD *)v4 + 158);
    if ((v9 & 0x400) == 0)
    {
LABEL_64:
      if ((v9 & 0x100) == 0) {
        goto LABEL_65;
      }
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 158) & 0x400) == 0)
  {
    goto LABEL_64;
  }
  self->_mobileAssetVersion = *((void *)v4 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v9 = *((_WORD *)v4 + 158);
  if ((v9 & 0x100) == 0)
  {
LABEL_65:
    if ((v9 & 4) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
LABEL_81:
  self->_key = *((void *)v4 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 158) & 4) != 0)
  {
LABEL_66:
    self->_double dailyTarget = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_67:
  if (*((void *)v4 + 22))
  {
    -[ACHCodableTemplate setDailyTargetCanonicalUnit:](self, "setDailyTargetCanonicalUnit:");
    id v4 = v12;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v11 = *((void *)v4 + 33);
  if (syncIdentity)
  {
    if (!v11) {
      goto LABEL_86;
    }
    -[ACHCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_86;
    }
    -[ACHCodableTemplate setSyncIdentity:](self, "setSyncIdentity:");
  }
  id v4 = v12;
LABEL_86:
  if (*((void *)v4 + 30)) {
    -[ACHCodableTemplate setPrerequisiteTemplateName:](self, "setPrerequisiteTemplateName:");
  }

  MEMORY[0x270F9A758]();
}

@end