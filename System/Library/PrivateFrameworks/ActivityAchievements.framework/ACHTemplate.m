@interface ACHTemplate
+ (BOOL)supportsSecureCoding;
- ($02FB07F485EFC64008691ED20BDF3B27)packedAvailabilityEnd;
- ($02FB07F485EFC64008691ED20BDF3B27)packedAvailabilityStart;
- ($02FB07F485EFC64008691ED20BDF3B27)packedVisibilityEnd;
- ($02FB07F485EFC64008691ED20BDF3B27)packedVisibilityStart;
- (ACHSyncIdentity)syncIdentity;
- (ACHTemplate)init;
- (ACHTemplate)initWithCodable:(id)a3;
- (ACHTemplate)initWithCoder:(id)a3;
- (BOOL)_isValid;
- (BOOL)availableOnPairedDevice;
- (BOOL)displaysEarnedInstanceCount;
- (BOOL)isEqual:(id)a3;
- (HKUnit)canonicalUnit;
- (HKUnit)dailyTargetCanonicalUnit;
- (NSArray)availableCountryCodes;
- (NSArray)availableSuffixes;
- (NSDate)createdDate;
- (NSDateComponents)availabilityEnd;
- (NSDateComponents)availabilityStart;
- (NSDateComponents)visibilityEnd;
- (NSDateComponents)visibilityStart;
- (NSSet)alertDates;
- (NSString)alertabilityPredicate;
- (NSString)availabilityPredicate;
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
- (NSString)visibilityPredicate;
- (double)dailyTarget;
- (id)_displayStringForAlertDates:(id)a3;
- (id)_displayStringForStringValues:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)displayOrder;
- (unint64_t)duplicateRemovalCalendarUnit;
- (unint64_t)hash;
- (unint64_t)key;
- (unint64_t)mobileAssetVersion;
- (unint64_t)triggers;
- (unint64_t)version;
- (unsigned)creatorDevice;
- (unsigned)duplicateRemovalStrategy;
- (unsigned)earnDateStrategy;
- (unsigned)earnLimit;
- (unsigned)minimumEngineVersion;
- (void)_isValid;
- (void)encodeWithCoder:(id)a3;
- (void)setAlertDates:(id)a3;
- (void)setAlertabilityPredicate:(id)a3;
- (void)setAvailabilityEnd:(id)a3;
- (void)setAvailabilityPredicate:(id)a3;
- (void)setAvailabilityStart:(id)a3;
- (void)setAvailableCountryCodes:(id)a3;
- (void)setAvailableOnPairedDevice:(BOOL)a3;
- (void)setAvailableSuffixes:(id)a3;
- (void)setCanonicalUnit:(id)a3;
- (void)setCreatedDate:(id)a3;
- (void)setCreatorDevice:(unsigned __int8)a3;
- (void)setDailyTarget:(double)a3;
- (void)setDailyTargetCanonicalUnit:(id)a3;
- (void)setDisplayOrder:(unint64_t)a3;
- (void)setDisplaysEarnedInstanceCount:(BOOL)a3;
- (void)setDuplicateRemovalCalendarUnit:(unint64_t)a3;
- (void)setDuplicateRemovalStrategy:(unsigned __int8)a3;
- (void)setEarnDateStrategy:(unsigned __int8)a3;
- (void)setEarnLimit:(unsigned __int8)a3;
- (void)setGoalExpression:(id)a3;
- (void)setGraceGoalExpression:(id)a3;
- (void)setGracePredicate:(id)a3;
- (void)setGraceProgressExpression:(id)a3;
- (void)setGraceValueExpression:(id)a3;
- (void)setGraceVisibilityPredicate:(id)a3;
- (void)setKey:(unint64_t)a3;
- (void)setMinimumEngineVersion:(unsigned __int8)a3;
- (void)setMobileAssetVersion:(unint64_t)a3;
- (void)setPackedAvailabilityEnd:(id)a3;
- (void)setPackedAvailabilityStart:(id)a3;
- (void)setPackedVisibilityEnd:(id)a3;
- (void)setPackedVisibilityStart:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setPrerequisiteTemplateName:(id)a3;
- (void)setProgressExpression:(id)a3;
- (void)setSourceName:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setTriggers:(unint64_t)a3;
- (void)setUniqueName:(id)a3;
- (void)setValueExpression:(id)a3;
- (void)setVersion:(unint64_t)a3;
- (void)setVisibilityEnd:(id)a3;
- (void)setVisibilityPredicate:(id)a3;
- (void)setVisibilityStart:(id)a3;
@end

@implementation ACHTemplate

- (NSDateComponents)visibilityStart
{
  uint64_t v2 = (uint64_t)[(ACHTemplate *)self packedVisibilityStart];
  if ((v2 & 0x100000000) != 0)
  {
    v3 = ACHDateComponentsForYearMonthDay((unsigned __int16)v2, BYTE2(v2), BYTE3(v2));
  }
  else
  {
    v3 = 0;
  }

  return (NSDateComponents *)v3;
}

- ($02FB07F485EFC64008691ED20BDF3B27)packedVisibilityStart
{
  objc_copyStruct(&dest, &self->_availableOnPairedDevice + 1, 5, 1, 0);
  return ($02FB07F485EFC64008691ED20BDF3B27)(dest | ((unint64_t)v4 << 32));
}

- (ACHTemplate)initWithCodable:(id)a3
{
  id v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)ACHTemplate;
  v5 = [(ACHTemplate *)&v72 init];
  if (v5)
  {
    -[ACHTemplate setKey:](v5, "setKey:", [v4 key]);
    v6 = [v4 uniqueName];
    v7 = (void *)[v6 copy];
    [(ACHTemplate *)v5 setUniqueName:v7];

    -[ACHTemplate setVersion:](v5, "setVersion:", [v4 version]);
    -[ACHTemplate setMinimumEngineVersion:](v5, "setMinimumEngineVersion:", [v4 minimumEngineVersion]);
    v8 = (void *)MEMORY[0x263EFF910];
    [v4 createdDate];
    v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    [(ACHTemplate *)v5 setCreatedDate:v9];

    -[ACHTemplate setCreatorDevice:](v5, "setCreatorDevice:", [v4 creatorDevice]);
    v10 = [v4 sourceName];
    v11 = (void *)[v10 copy];
    [(ACHTemplate *)v5 setSourceName:v11];

    v12 = [v4 predicate];
    v13 = (void *)[v12 copy];
    [(ACHTemplate *)v5 setPredicate:v13];

    v14 = [v4 gracePredicate];
    v15 = (void *)[v14 copy];
    [(ACHTemplate *)v5 setGracePredicate:v15];

    v16 = [v4 valueExpression];
    v17 = (void *)[v16 copy];
    [(ACHTemplate *)v5 setValueExpression:v17];

    v18 = [v4 graceValueExpression];
    v19 = (void *)[v18 copy];
    [(ACHTemplate *)v5 setGraceValueExpression:v19];

    v20 = [v4 progressExpression];
    v21 = (void *)[v20 copy];
    [(ACHTemplate *)v5 setProgressExpression:v21];

    v22 = [v4 graceProgressExpression];
    v23 = (void *)[v22 copy];
    [(ACHTemplate *)v5 setGraceProgressExpression:v23];

    v24 = [v4 goalExpression];
    v25 = (void *)[v24 copy];
    [(ACHTemplate *)v5 setGoalExpression:v25];

    v26 = [v4 graceGoalExpression];
    v27 = (void *)[v26 copy];
    [(ACHTemplate *)v5 setGraceGoalExpression:v27];

    -[ACHTemplate setTriggers:](v5, "setTriggers:", [v4 triggers]);
    -[ACHTemplate setEarnLimit:](v5, "setEarnLimit:", [v4 earnLimit]);
    v28 = [v4 visibilityPredicate];
    v29 = (void *)[v28 copy];
    [(ACHTemplate *)v5 setVisibilityPredicate:v29];

    v30 = [v4 graceVisibilityPredicate];
    v31 = (void *)[v30 copy];
    [(ACHTemplate *)v5 setGraceVisibilityPredicate:v31];

    v32 = [v4 visibilityStartDate];
    v33 = ACHYearMonthDayDateComponentsFromString(v32);
    [(ACHTemplate *)v5 setVisibilityStart:v33];

    v34 = [v4 visibilityEndDate];
    v35 = ACHYearMonthDayDateComponentsFromString(v34);
    [(ACHTemplate *)v5 setVisibilityEnd:v35];

    v36 = [v4 availabilityPredicate];
    v37 = (void *)[v36 copy];
    [(ACHTemplate *)v5 setAvailabilityPredicate:v37];

    v38 = [v4 availabilityStartDate];
    v39 = ACHYearMonthDayDateComponentsFromString(v38);
    [(ACHTemplate *)v5 setAvailabilityStart:v39];

    v40 = [v4 availabilityEndDate];
    v41 = ACHYearMonthDayDateComponentsFromString(v40);
    [(ACHTemplate *)v5 setAvailabilityEnd:v41];

    v42 = [v4 availableCountryCodes];
    v44 = ACHTemplateAvailableCountryCodesFromString(v42, v43);
    [(ACHTemplate *)v5 setAvailableCountryCodes:v44];

    v45 = [v4 alertabilityPredicate];
    v46 = (void *)[v45 copy];
    [(ACHTemplate *)v5 setAlertabilityPredicate:v46];

    v47 = [v4 alertDates];
    v48 = ACHTemplateAlertDatesFromString(v47);
    [(ACHTemplate *)v5 setAlertDates:v48];

    -[ACHTemplate setDuplicateRemovalStrategy:](v5, "setDuplicateRemovalStrategy:", [v4 duplicateRemovalStrategy]);
    -[ACHTemplate setDuplicateRemovalCalendarUnit:](v5, "setDuplicateRemovalCalendarUnit:", [v4 duplicateRemovalCalendarUnit]);
    -[ACHTemplate setEarnDateStrategy:](v5, "setEarnDateStrategy:", [v4 earnDateStrategy]);
    v49 = [v4 canonicalUnit];
    if (v49)
    {
      v50 = (void *)MEMORY[0x263F0A830];
      v51 = [v4 canonicalUnit];
      v52 = [v50 unitFromString:v51];
      [(ACHTemplate *)v5 setCanonicalUnit:v52];
    }
    else
    {
      [(ACHTemplate *)v5 setCanonicalUnit:0];
    }

    -[ACHTemplate setDisplayOrder:](v5, "setDisplayOrder:", [v4 displayOrder]);
    -[ACHTemplate setDisplaysEarnedInstanceCount:](v5, "setDisplaysEarnedInstanceCount:", [v4 displaysEarnedInstanceCount]);
    v53 = [v4 availableSuffixes];
    v55 = ACHTemplateAvailableSuffixesFromString(v53, v54);
    [(ACHTemplate *)v5 setAvailableSuffixes:v55];

    -[ACHTemplate setAvailableOnPairedDevice:](v5, "setAvailableOnPairedDevice:", [v4 availableOnPairedDevice]);
    -[ACHTemplate setMobileAssetVersion:](v5, "setMobileAssetVersion:", [v4 mobileAssetVersion]);
    [v4 dailyTarget];
    -[ACHTemplate setDailyTarget:](v5, "setDailyTarget:");
    v56 = [v4 dailyTargetCanonicalUnit];
    if (v56)
    {
      v57 = (void *)MEMORY[0x263F0A830];
      v58 = [v4 dailyTargetCanonicalUnit];
      v59 = [v57 unitFromString:v58];
      [(ACHTemplate *)v5 setDailyTargetCanonicalUnit:v59];
    }
    else
    {
      [(ACHTemplate *)v5 setDailyTargetCanonicalUnit:0];
    }

    if ([v4 hasSyncIdentity])
    {
      v60 = [v4 syncIdentity];
      v61 = [v60 hardwareIdentifier];

      v62 = [v4 syncIdentity];
      v63 = [v62 databaseIdentifier];

      if (v61 && v63)
      {
        v64 = [v4 syncIdentity];
        uint64_t v65 = [v64 instanceDiscriminator];
        v66 = (void *)v65;
        v67 = &stru_26D0EC7B0;
        if (v65) {
          v67 = (__CFString *)v65;
        }
        v68 = v67;

        v69 = [[ACHSyncIdentity alloc] initWithHardwareIdentifier:v61 databaseIdentifier:v63 instanceDiscriminator:v68];
        [(ACHTemplate *)v5 setSyncIdentity:v69];
      }
      else
      {
        ACHLogTemplates();
        v69 = (ACHSyncIdentity *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v69->super, OS_LOG_TYPE_ERROR)) {
          -[ACHTemplate initWithCodable:](&v69->super);
        }
      }
    }
    v70 = [v4 prerequisiteTemplateName];
    [(ACHTemplate *)v5 setPrerequisiteTemplateName:v70];
  }
  return v5;
}

- (void)setVisibilityPredicate:(id)a3
{
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (void)setUniqueName:(id)a3
{
}

- (void)setSourceName:(id)a3
{
}

- (void)setMinimumEngineVersion:(unsigned __int8)a3
{
  self->_minimumEngineVersion = a3;
}

- (void)setEarnLimit:(unsigned __int8)a3
{
  self->_earnLimit = a3;
}

- (void)setEarnDateStrategy:(unsigned __int8)a3
{
  self->_earnDateStrategy = a3;
}

- (void)setDuplicateRemovalStrategy:(unsigned __int8)a3
{
  self->_duplicateRemovalStrategy = a3;
}

- (void)setDisplayOrder:(unint64_t)a3
{
  self->_displayOrder = a3;
}

- (void)setPredicate:(id)a3
{
}

- (void)setCanonicalUnit:(id)a3
{
}

- (void)setGoalExpression:(id)a3
{
}

- (void)setProgressExpression:(id)a3
{
}

- (void)setPrerequisiteTemplateName:(id)a3
{
}

- (ACHSyncIdentity)syncIdentity
{
  return (ACHSyncIdentity *)objc_getProperty(self, a2, 256, 1);
}

- (NSDateComponents)visibilityEnd
{
  uint64_t v2 = (uint64_t)[(ACHTemplate *)self packedVisibilityEnd];
  if ((v2 & 0x100000000) != 0)
  {
    v3 = ACHDateComponentsForYearMonthDay((unsigned __int16)v2, BYTE2(v2), BYTE3(v2));
  }
  else
  {
    v3 = 0;
  }

  return (NSDateComponents *)v3;
}

- ($02FB07F485EFC64008691ED20BDF3B27)packedVisibilityEnd
{
  objc_copyStruct(&dest, &self->_packedVisibilityStart.valid, 5, 1, 0);
  return ($02FB07F485EFC64008691ED20BDF3B27)(dest | ((unint64_t)v4 << 32));
}

- (NSArray)availableCountryCodes
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prerequisiteTemplateName, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_dailyTargetCanonicalUnit, 0);
  objc_storeStrong((id *)&self->_availableSuffixes, 0);
  objc_storeStrong((id *)&self->_canonicalUnit, 0);
  objc_storeStrong((id *)&self->_alertDates, 0);
  objc_storeStrong((id *)&self->_alertabilityPredicate, 0);
  objc_storeStrong((id *)&self->_availableCountryCodes, 0);
  objc_storeStrong((id *)&self->_availabilityPredicate, 0);
  objc_storeStrong((id *)&self->_graceVisibilityPredicate, 0);
  objc_storeStrong((id *)&self->_visibilityPredicate, 0);
  objc_storeStrong((id *)&self->_graceGoalExpression, 0);
  objc_storeStrong((id *)&self->_goalExpression, 0);
  objc_storeStrong((id *)&self->_graceProgressExpression, 0);
  objc_storeStrong((id *)&self->_progressExpression, 0);
  objc_storeStrong((id *)&self->_graceValueExpression, 0);
  objc_storeStrong((id *)&self->_valueExpression, 0);
  objc_storeStrong((id *)&self->_gracePredicate, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);

  objc_storeStrong((id *)&self->_uniqueName, 0);
}

- (unint64_t)hash
{
  unint64_t v3 = [(ACHTemplate *)self key];
  v53 = [(ACHTemplate *)self uniqueName];
  uint64_t v4 = [v53 hash];
  unint64_t v5 = v4 ^ v3 ^ [(ACHTemplate *)self version];
  unint64_t v6 = v5 ^ [(ACHTemplate *)self minimumEngineVersion];
  v52 = [(ACHTemplate *)self createdDate];
  uint64_t v7 = [v52 hash];
  uint64_t v8 = v6 ^ v7 ^ [(ACHTemplate *)self creatorDevice];
  v51 = [(ACHTemplate *)self sourceName];
  uint64_t v9 = [v51 hash];
  v50 = [(ACHTemplate *)self predicate];
  uint64_t v10 = v9 ^ [v50 hash];
  v49 = [(ACHTemplate *)self gracePredicate];
  uint64_t v11 = v10 ^ [v49 hash];
  v48 = [(ACHTemplate *)self valueExpression];
  uint64_t v12 = v8 ^ v11 ^ [v48 hash];
  v47 = [(ACHTemplate *)self graceValueExpression];
  uint64_t v13 = [v47 hash];
  v46 = [(ACHTemplate *)self progressExpression];
  uint64_t v14 = v13 ^ [v46 hash];
  v45 = [(ACHTemplate *)self graceProgressExpression];
  uint64_t v15 = v14 ^ [v45 hash];
  v44 = [(ACHTemplate *)self goalExpression];
  uint64_t v16 = v15 ^ [v44 hash];
  v43 = [(ACHTemplate *)self graceGoalExpression];
  uint64_t v17 = v12 ^ v16 ^ [v43 hash];
  unint64_t v18 = [(ACHTemplate *)self triggers];
  unint64_t v19 = v18 ^ [(ACHTemplate *)self earnLimit];
  v42 = [(ACHTemplate *)self visibilityPredicate];
  uint64_t v20 = v19 ^ [v42 hash];
  v21 = [(ACHTemplate *)self graceVisibilityPredicate];
  uint64_t v22 = v20 ^ [v21 hash];
  v23 = [(ACHTemplate *)self alertabilityPredicate];
  uint64_t v24 = v17 ^ v22 ^ [v23 hash];
  v25 = [(ACHTemplate *)self alertDates];
  uint64_t v26 = [v25 hash];
  uint64_t v27 = v26 ^ [(ACHTemplate *)self duplicateRemovalStrategy];
  unint64_t v28 = v27 ^ [(ACHTemplate *)self duplicateRemovalCalendarUnit];
  unint64_t v29 = v28 ^ [(ACHTemplate *)self earnDateStrategy];
  unint64_t v30 = v29 ^ [(ACHTemplate *)self displayOrder];
  unint64_t v31 = v24 ^ v30 ^ [(ACHTemplate *)self displaysEarnedInstanceCount];
  v32 = [(ACHTemplate *)self canonicalUnit];
  uint64_t v33 = [v32 hash];
  v34 = [(ACHTemplate *)self dailyTargetCanonicalUnit];
  uint64_t v35 = v33 ^ [v34 hash];
  v36 = NSNumber;
  [(ACHTemplate *)self dailyTarget];
  v37 = objc_msgSend(v36, "numberWithDouble:");
  uint64_t v38 = v35 ^ [v37 hash];
  v39 = [(ACHTemplate *)self prerequisiteTemplateName];
  unint64_t v40 = v31 ^ v38 ^ [v39 hash];

  return v40;
}

- (NSString)uniqueName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)prerequisiteTemplateName
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (unint64_t)triggers
{
  return self->_triggers;
}

- (HKUnit)canonicalUnit
{
  return (HKUnit *)objc_getProperty(self, a2, 208, 1);
}

- (unsigned)earnLimit
{
  return self->_earnLimit;
}

- (NSString)alertabilityPredicate
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (unint64_t)displayOrder
{
  return self->_displayOrder;
}

- (unsigned)minimumEngineVersion
{
  return self->_minimumEngineVersion;
}

- (unint64_t)version
{
  return self->_version;
}

- (unsigned)earnDateStrategy
{
  return self->_earnDateStrategy;
}

- (unsigned)duplicateRemovalStrategy
{
  return self->_duplicateRemovalStrategy;
}

- (unint64_t)duplicateRemovalCalendarUnit
{
  return self->_duplicateRemovalCalendarUnit;
}

- (BOOL)displaysEarnedInstanceCount
{
  return self->_displaysEarnedInstanceCount;
}

- (double)dailyTarget
{
  return self->_dailyTarget;
}

- (HKUnit)dailyTargetCanonicalUnit
{
  return (HKUnit *)objc_getProperty(self, a2, 248, 1);
}

- (unsigned)creatorDevice
{
  return self->_creatorDevice;
}

- (NSDate)createdDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (NSSet)alertDates
{
  return (NSSet *)objc_getProperty(self, a2, 192, 1);
}

- (NSDateComponents)availabilityStart
{
  uint64_t v2 = (uint64_t)[(ACHTemplate *)self packedAvailabilityStart];
  if ((v2 & 0x100000000) != 0)
  {
    unint64_t v3 = ACHDateComponentsForYearMonthDay((unsigned __int16)v2, BYTE2(v2), BYTE3(v2));
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSDateComponents *)v3;
}

- ($02FB07F485EFC64008691ED20BDF3B27)packedAvailabilityStart
{
  objc_copyStruct(&dest, &self->_packedVisibilityEnd.day, 5, 1, 0);
  return ($02FB07F485EFC64008691ED20BDF3B27)(dest | ((unint64_t)v4 << 32));
}

- (NSDateComponents)availabilityEnd
{
  uint64_t v2 = (uint64_t)[(ACHTemplate *)self packedAvailabilityEnd];
  if ((v2 & 0x100000000) != 0)
  {
    unint64_t v3 = ACHDateComponentsForYearMonthDay((unsigned __int16)v2, BYTE2(v2), BYTE3(v2));
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSDateComponents *)v3;
}

- ($02FB07F485EFC64008691ED20BDF3B27)packedAvailabilityEnd
{
  objc_copyStruct(&dest, &self->_packedAvailabilityStart.month, 5, 1, 0);
  return ($02FB07F485EFC64008691ED20BDF3B27)(dest | ((unint64_t)v4 << 32));
}

- (NSArray)availableSuffixes
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (unint64_t)mobileAssetVersion
{
  return self->_mobileAssetVersion;
}

- (BOOL)availableOnPairedDevice
{
  return self->_availableOnPairedDevice;
}

- (NSString)progressExpression
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)goalExpression
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)visibilityPredicate
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)graceProgressExpression
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)predicate
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)graceVisibilityPredicate
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSString)graceGoalExpression
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)valueExpression
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)sourceName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)graceValueExpression
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)gracePredicate
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)availabilityPredicate
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setDuplicateRemovalCalendarUnit:(unint64_t)a3
{
  self->_duplicateRemovalCalendarUnit = a3;
}

- (void)setValueExpression:(id)a3
{
}

- (void)setDisplaysEarnedInstanceCount:(BOOL)a3
{
  self->_displaysEarnedInstanceCount = a3;
}

- (void)setVisibilityStart:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    unsigned __int16 v5 = [v4 year];
    unsigned __int8 v6 = [v8 month];
    unint64_t v7 = v5 | ((unint64_t)v6 << 16) | ([v8 day] << 24) | 0x100000000;
  }
  else
  {
    unint64_t v7 = 0;
  }
  [(ACHTemplate *)self setPackedVisibilityStart:v7];
}

- (void)setVisibilityEnd:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    unsigned __int16 v5 = [v4 year];
    unsigned __int8 v6 = [v8 month];
    unint64_t v7 = v5 | ((unint64_t)v6 << 16) | ([v8 day] << 24) | 0x100000000;
  }
  else
  {
    unint64_t v7 = 0;
  }
  [(ACHTemplate *)self setPackedVisibilityEnd:v7];
}

- (void)setTriggers:(unint64_t)a3
{
  self->_triggers = a3;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void)setPackedVisibilityStart:(id)a3
{
  $02FB07F485EFC64008691ED20BDF3B27 src = a3;
  objc_copyStruct(&self->_availableOnPairedDevice + 1, &src, 5, 1, 0);
}

- (void)setPackedVisibilityEnd:(id)a3
{
  $02FB07F485EFC64008691ED20BDF3B27 src = a3;
  objc_copyStruct(&self->_packedVisibilityStart.valid, &src, 5, 1, 0);
}

- (void)setMobileAssetVersion:(unint64_t)a3
{
  self->_mobileAssetVersion = a3;
}

- (void)setKey:(unint64_t)a3
{
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

- (void)setDailyTargetCanonicalUnit:(id)a3
{
}

- (void)setDailyTarget:(double)a3
{
  self->_dailyTarget = a3;
}

- (void)setCreatorDevice:(unsigned __int8)a3
{
  self->_creatorDevice = a3;
}

- (void)setCreatedDate:(id)a3
{
}

- (void)setAvailableSuffixes:(id)a3
{
}

- (void)setAvailableOnPairedDevice:(BOOL)a3
{
  self->_availableOnPairedDevice = a3;
}

- (void)setAvailableCountryCodes:(id)a3
{
}

- (void)setAvailabilityStart:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    unsigned __int16 v5 = [v4 year];
    unsigned __int8 v6 = [v8 month];
    unint64_t v7 = v5 | ((unint64_t)v6 << 16) | ([v8 day] << 24) | 0x100000000;
  }
  else
  {
    unint64_t v7 = 0;
  }
  [(ACHTemplate *)self setPackedAvailabilityStart:v7];
}

- (void)setPackedAvailabilityStart:(id)a3
{
  $02FB07F485EFC64008691ED20BDF3B27 src = a3;
  objc_copyStruct(&self->_packedVisibilityEnd.day, &src, 5, 1, 0);
}

- (void)setAvailabilityPredicate:(id)a3
{
}

- (void)setAvailabilityEnd:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    unsigned __int16 v5 = [v4 year];
    unsigned __int8 v6 = [v8 month];
    unint64_t v7 = v5 | ((unint64_t)v6 << 16) | ([v8 day] << 24) | 0x100000000;
  }
  else
  {
    unint64_t v7 = 0;
  }
  [(ACHTemplate *)self setPackedAvailabilityEnd:v7];
}

- (void)setPackedAvailabilityEnd:(id)a3
{
  $02FB07F485EFC64008691ED20BDF3B27 src = a3;
  objc_copyStruct(&self->_packedAvailabilityStart.month, &src, 5, 1, 0);
}

- (void)setAlertabilityPredicate:(id)a3
{
}

- (void)setAlertDates:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(ACHTemplate *)self key];
    if (v6 != [v5 key]) {
      goto LABEL_63;
    }
    unint64_t v7 = [(ACHTemplate *)self uniqueName];
    id v8 = [v5 uniqueName];
    int v9 = [v7 isEqualToString:v8];

    if (!v9) {
      goto LABEL_63;
    }
    unint64_t v10 = [(ACHTemplate *)self version];
    if (v10 != [v5 version]) {
      goto LABEL_63;
    }
    int v11 = [(ACHTemplate *)self minimumEngineVersion];
    if (v11 != [v5 minimumEngineVersion]) {
      goto LABEL_63;
    }
    uint64_t v12 = [(ACHTemplate *)self createdDate];
    [v12 timeIntervalSinceReferenceDate];
    double v14 = v13;
    uint64_t v15 = [v5 createdDate];
    [v15 timeIntervalSinceReferenceDate];
    double v17 = vabdd_f64(v14, v16);

    if (v17 > 1.0) {
      goto LABEL_63;
    }
    int v18 = [(ACHTemplate *)self creatorDevice];
    if (v18 != [v5 creatorDevice]) {
      goto LABEL_63;
    }
    unint64_t v19 = [(ACHTemplate *)self sourceName];
    uint64_t v20 = [v5 sourceName];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      int v22 = [v19 isEqualToString:v20];

      if (!v22) {
        goto LABEL_63;
      }
    }
    uint64_t v24 = [(ACHTemplate *)self predicate];
    uint64_t v25 = [v5 predicate];
    if (v24 == (void *)v25)
    {
    }
    else
    {
      uint64_t v26 = (void *)v25;
      int v27 = [v24 isEqualToString:v25];

      if (!v27) {
        goto LABEL_63;
      }
    }
    unint64_t v28 = [(ACHTemplate *)self gracePredicate];
    uint64_t v29 = [v5 gracePredicate];
    if (v28 == (void *)v29)
    {
    }
    else
    {
      unint64_t v30 = (void *)v29;
      int v31 = [v28 isEqualToString:v29];

      if (!v31) {
        goto LABEL_63;
      }
    }
    v32 = [(ACHTemplate *)self valueExpression];
    uint64_t v33 = [v5 valueExpression];
    if (v32 == (void *)v33)
    {
    }
    else
    {
      v34 = (void *)v33;
      int v35 = [v32 isEqualToString:v33];

      if (!v35) {
        goto LABEL_63;
      }
    }
    v36 = [(ACHTemplate *)self graceValueExpression];
    uint64_t v37 = [v5 graceValueExpression];
    if (v36 == (void *)v37)
    {
    }
    else
    {
      uint64_t v38 = (void *)v37;
      int v39 = [v36 isEqualToString:v37];

      if (!v39) {
        goto LABEL_63;
      }
    }
    unint64_t v40 = [(ACHTemplate *)self progressExpression];
    uint64_t v41 = [v5 progressExpression];
    if (v40 == (void *)v41)
    {
    }
    else
    {
      v42 = (void *)v41;
      int v43 = [v40 isEqualToString:v41];

      if (!v43) {
        goto LABEL_63;
      }
    }
    v44 = [(ACHTemplate *)self graceProgressExpression];
    uint64_t v45 = [v5 graceProgressExpression];
    if (v44 == (void *)v45)
    {
    }
    else
    {
      v46 = (void *)v45;
      int v47 = [v44 isEqualToString:v45];

      if (!v47) {
        goto LABEL_63;
      }
    }
    v48 = [(ACHTemplate *)self goalExpression];
    uint64_t v49 = [v5 goalExpression];
    if (v48 == (void *)v49)
    {
    }
    else
    {
      v50 = (void *)v49;
      int v51 = [v48 isEqualToString:v49];

      if (!v51) {
        goto LABEL_63;
      }
    }
    v52 = [(ACHTemplate *)self graceGoalExpression];
    uint64_t v53 = [v5 graceGoalExpression];
    if (v52 == (void *)v53)
    {
    }
    else
    {
      v54 = (void *)v53;
      int v55 = [v52 isEqualToString:v53];

      if (!v55) {
        goto LABEL_63;
      }
    }
    unint64_t v56 = [(ACHTemplate *)self triggers];
    if (v56 != [v5 triggers]) {
      goto LABEL_63;
    }
    int v57 = [(ACHTemplate *)self earnLimit];
    if (v57 != [v5 earnLimit]) {
      goto LABEL_63;
    }
    v58 = [(ACHTemplate *)self visibilityPredicate];
    uint64_t v59 = [v5 visibilityPredicate];
    if (v58 == (void *)v59)
    {
    }
    else
    {
      v60 = (void *)v59;
      int v61 = [v58 isEqualToString:v59];

      if (!v61) {
        goto LABEL_63;
      }
    }
    v62 = [(ACHTemplate *)self graceVisibilityPredicate];
    uint64_t v63 = [v5 graceVisibilityPredicate];
    if (v62 == (void *)v63)
    {
    }
    else
    {
      v64 = (void *)v63;
      int v65 = [v62 isEqualToString:v63];

      if (!v65) {
        goto LABEL_63;
      }
    }
    uint64_t v66 = (uint64_t)[(ACHTemplate *)self packedVisibilityStart];
    if ((([v5 packedVisibilityStart] ^ v66) & 0x1FFFFFFFFLL) != 0) {
      goto LABEL_63;
    }
    uint64_t v67 = (uint64_t)[(ACHTemplate *)self packedVisibilityEnd];
    if ((([v5 packedVisibilityEnd] ^ v67) & 0x1FFFFFFFFLL) != 0) {
      goto LABEL_63;
    }
    v68 = [(ACHTemplate *)self availabilityPredicate];
    uint64_t v69 = [v5 availabilityPredicate];
    if (v68 == (void *)v69)
    {
    }
    else
    {
      v70 = (void *)v69;
      int v71 = [v68 isEqualToString:v69];

      if (!v71) {
        goto LABEL_63;
      }
    }
    uint64_t v72 = (uint64_t)[(ACHTemplate *)self packedAvailabilityStart];
    if ((([v5 packedAvailabilityStart] ^ v72) & 0x1FFFFFFFFLL) != 0) {
      goto LABEL_63;
    }
    uint64_t v73 = (uint64_t)[(ACHTemplate *)self packedAvailabilityEnd];
    if ((([v5 packedAvailabilityEnd] ^ v73) & 0x1FFFFFFFFLL) != 0) {
      goto LABEL_63;
    }
    v75 = [(ACHTemplate *)self availableCountryCodes];
    uint64_t v76 = [v5 availableCountryCodes];
    if (v75 == (void *)v76)
    {
    }
    else
    {
      v77 = (void *)v76;
      int v78 = [v75 isEqual:v76];

      if (!v78) {
        goto LABEL_63;
      }
    }
    v79 = [(ACHTemplate *)self alertabilityPredicate];
    uint64_t v80 = [v5 alertabilityPredicate];
    if (v79 == (void *)v80)
    {
    }
    else
    {
      v81 = (void *)v80;
      int v82 = [v79 isEqualToString:v80];

      if (!v82) {
        goto LABEL_63;
      }
    }
    v83 = [(ACHTemplate *)self alertDates];
    uint64_t v84 = [v5 alertDates];
    if (v83 == (void *)v84)
    {
    }
    else
    {
      v85 = (void *)v84;
      int v86 = [v83 isEqual:v84];

      if (!v86) {
        goto LABEL_63;
      }
    }
    int v87 = [(ACHTemplate *)self duplicateRemovalStrategy];
    if (v87 != [v5 duplicateRemovalStrategy]) {
      goto LABEL_63;
    }
    unint64_t v88 = [(ACHTemplate *)self duplicateRemovalCalendarUnit];
    if (v88 != [v5 duplicateRemovalCalendarUnit]) {
      goto LABEL_63;
    }
    int v89 = [(ACHTemplate *)self earnDateStrategy];
    if (v89 != [v5 earnDateStrategy]) {
      goto LABEL_63;
    }
    int v90 = [(ACHTemplate *)self displaysEarnedInstanceCount];
    if (v90 != [v5 displaysEarnedInstanceCount]) {
      goto LABEL_63;
    }
    unint64_t v91 = [(ACHTemplate *)self displayOrder];
    if (v91 != [v5 displayOrder]) {
      goto LABEL_63;
    }
    v92 = [(ACHTemplate *)self canonicalUnit];
    uint64_t v93 = [v5 canonicalUnit];
    if (v92 == (void *)v93)
    {
    }
    else
    {
      v94 = (void *)v93;
      int v95 = [v92 isEqual:v93];

      if (!v95) {
        goto LABEL_63;
      }
    }
    v96 = [(ACHTemplate *)self availableSuffixes];
    uint64_t v97 = [v5 availableSuffixes];
    if (v96 == (void *)v97)
    {
    }
    else
    {
      v98 = (void *)v97;
      int v99 = [v96 isEqual:v97];

      if (!v99) {
        goto LABEL_63;
      }
    }
    int v100 = [(ACHTemplate *)self availableOnPairedDevice];
    if (v100 != [v5 availableOnPairedDevice]) {
      goto LABEL_63;
    }
    unint64_t v101 = [(ACHTemplate *)self mobileAssetVersion];
    if (v101 != [v5 mobileAssetVersion]) {
      goto LABEL_63;
    }
    [(ACHTemplate *)self dailyTarget];
    [v5 dailyTarget];
    if (HKCompareDoubles()) {
      goto LABEL_63;
    }
    v102 = [(ACHTemplate *)self dailyTargetCanonicalUnit];
    uint64_t v103 = [v5 dailyTargetCanonicalUnit];
    if (v102 == (void *)v103)
    {

LABEL_98:
      v106 = [(ACHTemplate *)self prerequisiteTemplateName];
      v107 = [v5 prerequisiteTemplateName];
      if (v106 == v107) {
        char v23 = 1;
      }
      else {
        char v23 = [v106 isEqual:v107];
      }

      goto LABEL_64;
    }
    v104 = (void *)v103;
    int v105 = [v102 isEqual:v103];

    if (v105) {
      goto LABEL_98;
    }
LABEL_63:
    char v23 = 0;
LABEL_64:

    goto LABEL_65;
  }
  char v23 = 0;
LABEL_65:

  return v23;
}

- (unint64_t)key
{
  return self->_key;
}

- (ACHTemplate)init
{
  v3.receiver = self;
  v3.super_class = (Class)ACHTemplate;
  result = [(ACHTemplate *)&v3 init];
  if (result)
  {
    *(void *)((char *)&result->_packedVisibilityEnd.year + 1) = 0;
    *(void *)(&result->_availableOnPairedDevice + 1) = 0;
    *(_DWORD *)&result->_packedAvailabilityStart.day = 0;
  }
  return result;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v46.receiver = self;
  v46.super_class = (Class)ACHTemplate;
  id v4 = [(ACHTemplate *)&v46 description];
  [v3 appendFormat:@"%@", v4];

  objc_msgSend(v3, "appendFormat:", @"(Key: %lu\n"), -[ACHTemplate key](self, "key");
  id v5 = [(ACHTemplate *)self uniqueName];
  [v3 appendFormat:@"Unique Name: %@\n", v5];

  objc_msgSend(v3, "appendFormat:", @"Version: %lu\n", -[ACHTemplate version](self, "version"));
  objc_msgSend(v3, "appendFormat:", @"Minimum Engine Version: %lu\n", -[ACHTemplate minimumEngineVersion](self, "minimumEngineVersion"));
  unint64_t v6 = [(ACHTemplate *)self createdDate];
  [v3 appendFormat:@"Created Date (MM-dd-yyyy HH:mm:ss): %@\n", v6];

  [v3 appendFormat:@"Creator Device [1 = Watch, 2= Phone]: %lu\n", -[ACHTemplate creatorDevice](self, "creatorDevice")];
  unint64_t v7 = [(ACHTemplate *)self sourceName];
  [v3 appendFormat:@"Source Name: %@\n", v7];

  id v8 = [(ACHTemplate *)self predicate];
  [v3 appendFormat:@"Predicate: %@\n", v8];

  int v9 = [(ACHTemplate *)self gracePredicate];
  [v3 appendFormat:@"Grace Predicate: %@\n", v9];

  unint64_t v10 = [(ACHTemplate *)self valueExpression];
  [v3 appendFormat:@"Value Expression: %@\n", v10];

  int v11 = [(ACHTemplate *)self graceValueExpression];
  [v3 appendFormat:@"Grace Value Expression: %@\n", v11];

  uint64_t v12 = [(ACHTemplate *)self progressExpression];
  [v3 appendFormat:@"Progress Expression: %@\n", v12];

  double v13 = [(ACHTemplate *)self graceProgressExpression];
  [v3 appendFormat:@"Grace Progress Expression: %@\n", v13];

  double v14 = [(ACHTemplate *)self goalExpression];
  [v3 appendFormat:@"Goal Expression: %@\n", v14];

  uint64_t v15 = [(ACHTemplate *)self graceGoalExpression];
  [v3 appendFormat:@"Grace Goal Expression: %@\n", v15];

  [(ACHTemplate *)self dailyTarget];
  objc_msgSend(v3, "appendFormat:", @"dailyTarget: %f\n", v16);
  double v17 = [(ACHTemplate *)self dailyTargetCanonicalUnit];
  [v3 appendFormat:@"dailyTargetUnit: %@\n", v17];

  int v18 = ACHTriggerOptionsToString([(ACHTemplate *)self triggers]);
  [v3 appendFormat:@"Triggers: %@\n", v18];

  objc_msgSend(v3, "appendFormat:", @"Earn Limit: %lu\n", -[ACHTemplate earnLimit](self, "earnLimit"));
  unint64_t v19 = [(ACHTemplate *)self visibilityPredicate];
  [v3 appendFormat:@"Visibility Predicate: %@\n", v19];

  uint64_t v20 = [(ACHTemplate *)self graceVisibilityPredicate];
  [v3 appendFormat:@"Grace Visibility Predicate: %@\n", v20];

  v21 = [(ACHTemplate *)self visibilityStart];
  int v22 = ACHYearMonthDayStringFromDateComponents(v21);
  [v3 appendFormat:@"Visibility Start (YYYY-MM-dd): %@\n", v22];

  char v23 = [(ACHTemplate *)self visibilityEnd];
  uint64_t v24 = ACHYearMonthDayStringFromDateComponents(v23);
  [v3 appendFormat:@"Visibility End (YYYY-MM-dd): %@\n", v24];

  uint64_t v25 = [(ACHTemplate *)self availabilityPredicate];
  [v3 appendFormat:@"Availability Predicate: %@\n", v25];

  uint64_t v26 = [(ACHTemplate *)self availabilityStart];
  int v27 = ACHYearMonthDayStringFromDateComponents(v26);
  [v3 appendFormat:@"Availability Start (YYYY-MM-dd): %@\n", v27];

  unint64_t v28 = [(ACHTemplate *)self availabilityEnd];
  uint64_t v29 = ACHYearMonthDayStringFromDateComponents(v28);
  [v3 appendFormat:@"Availability End (YYYY-MM-dd): %@\n", v29];

  unint64_t v30 = [(ACHTemplate *)self availableCountryCodes];
  int v31 = [(ACHTemplate *)self _displayStringForStringValues:v30];
  [v3 appendFormat:@"Available Countries: %@\n", v31];

  v32 = [(ACHTemplate *)self alertabilityPredicate];
  [v3 appendFormat:@"Alertability Predicate: %@\n", v32];

  uint64_t v33 = [(ACHTemplate *)self alertDates];
  v34 = [(ACHTemplate *)self _displayStringForAlertDates:v33];
  [v3 appendFormat:@"Alert Dates (YYYY-MM-dd): %@\n", v34];

  unsigned __int8 v35 = [(ACHTemplate *)self duplicateRemovalStrategy] - 1;
  if (v35 > 3u) {
    v36 = 0;
  }
  else {
    v36 = off_264512C20[(char)v35];
  }
  [v3 appendFormat:@"Duplicate Removal Strategy: %@\n", v36];
  objc_msgSend(v3, "appendFormat:", @"Duplicate Removal Calendar Unit: %ld\n", -[ACHTemplate duplicateRemovalCalendarUnit](self, "duplicateRemovalCalendarUnit"));
  int v37 = [(ACHTemplate *)self earnDateStrategy];
  uint64_t v38 = @"Current Date";
  if (v37 != 1) {
    uint64_t v38 = 0;
  }
  if (v37 == 2) {
    uint64_t v38 = @"Yesterday";
  }
  [v3 appendFormat:@"Earn Date Strategy: %@\n", v38];
  int v39 = [(ACHTemplate *)self canonicalUnit];
  [v3 appendFormat:@"Canonical Unit: %@\n", v39];

  objc_msgSend(v3, "appendFormat:", @"Display Order: %lu\n", -[ACHTemplate displayOrder](self, "displayOrder"));
  if ([(ACHTemplate *)self displaysEarnedInstanceCount]) {
    unint64_t v40 = @"YES";
  }
  else {
    unint64_t v40 = @"NO";
  }
  [v3 appendFormat:@"Displays Earned Instance Count: %@\n", v40];
  uint64_t v41 = [(ACHTemplate *)self availableSuffixes];
  v42 = [(ACHTemplate *)self _displayStringForStringValues:v41];
  [v3 appendFormat:@"Available Suffixes: %@\n", v42];

  if ([(ACHTemplate *)self availableOnPairedDevice]) {
    int v43 = @"YES";
  }
  else {
    int v43 = @"NO";
  }
  [v3 appendFormat:@"Available On Paired Device: %@\n", v43];
  objc_msgSend(v3, "appendFormat:", @"Mobile Asset Version: %lu\n", -[ACHTemplate mobileAssetVersion](self, "mobileAssetVersion"));
  [v3 appendString:@""]);
  v44 = (void *)[v3 copy];

  return v44;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v46.receiver = self;
  v46.super_class = (Class)ACHTemplate;
  id v4 = [(ACHTemplate *)&v46 description];
  [v3 appendFormat:@"%@", v4];

  objc_msgSend(v3, "appendFormat:", @"(key: %lu\n"), -[ACHTemplate key](self, "key");
  id v5 = [(ACHTemplate *)self uniqueName];
  [v3 appendFormat:@"uniqueName: %@\n", v5];

  objc_msgSend(v3, "appendFormat:", @"version: %lu\n", -[ACHTemplate version](self, "version"));
  objc_msgSend(v3, "appendFormat:", @"minimumEngineVersion: %lu\n", -[ACHTemplate minimumEngineVersion](self, "minimumEngineVersion"));
  unint64_t v6 = [(ACHTemplate *)self createdDate];
  [v3 appendFormat:@"createdDate (MM-dd-yyyy HH:mm:ss): %@\n", v6];

  [v3 appendFormat:@"creatorDevice [1 = Watch, 2= Phone]: %lu\n", -[ACHTemplate creatorDevice](self, "creatorDevice")];
  unint64_t v7 = [(ACHTemplate *)self sourceName];
  [v3 appendFormat:@"sourceName: %@\n", v7];

  id v8 = [(ACHTemplate *)self predicate];
  [v3 appendFormat:@"predicate: %@\n", v8];

  int v9 = [(ACHTemplate *)self gracePredicate];
  [v3 appendFormat:@"gracePredicate: %@\n", v9];

  unint64_t v10 = [(ACHTemplate *)self valueExpression];
  [v3 appendFormat:@"valueExpression: %@\n", v10];

  int v11 = [(ACHTemplate *)self graceValueExpression];
  [v3 appendFormat:@"graceValueExpression: %@\n", v11];

  uint64_t v12 = [(ACHTemplate *)self progressExpression];
  [v3 appendFormat:@"progressExpression: %@\n", v12];

  double v13 = [(ACHTemplate *)self graceProgressExpression];
  [v3 appendFormat:@"graceProgressExpression: %@\n", v13];

  double v14 = [(ACHTemplate *)self goalExpression];
  [v3 appendFormat:@"goalExpression: %@\n", v14];

  uint64_t v15 = [(ACHTemplate *)self graceGoalExpression];
  [v3 appendFormat:@"graceGoalExpression: %@\n", v15];

  [(ACHTemplate *)self dailyTarget];
  objc_msgSend(v3, "appendFormat:", @"dailyTarget: %f\n", v16);
  double v17 = [(ACHTemplate *)self dailyTargetCanonicalUnit];
  [v3 appendFormat:@"dailyTargetUnit: %@\n", v17];

  int v18 = ACHTriggerOptionsToString([(ACHTemplate *)self triggers]);
  [v3 appendFormat:@"triggers: %@\n", v18];

  objc_msgSend(v3, "appendFormat:", @"earnLimit: %lu\n", -[ACHTemplate earnLimit](self, "earnLimit"));
  unint64_t v19 = [(ACHTemplate *)self visibilityPredicate];
  [v3 appendFormat:@"visibilityPredicate: %@\n", v19];

  uint64_t v20 = [(ACHTemplate *)self graceVisibilityPredicate];
  [v3 appendFormat:@"graceVisibilityPredicate: %@\n", v20];

  v21 = [(ACHTemplate *)self visibilityStart];
  int v22 = ACHYearMonthDayStringFromDateComponents(v21);
  [v3 appendFormat:@"visibilityStart (YYYY-MM-dd): %@\n", v22];

  char v23 = [(ACHTemplate *)self visibilityEnd];
  uint64_t v24 = ACHYearMonthDayStringFromDateComponents(v23);
  [v3 appendFormat:@"visibilityEnd (YYYY-MM-dd): %@\n", v24];

  uint64_t v25 = [(ACHTemplate *)self availabilityPredicate];
  [v3 appendFormat:@"availabilityPredicate: %@\n", v25];

  uint64_t v26 = [(ACHTemplate *)self availabilityStart];
  int v27 = ACHYearMonthDayStringFromDateComponents(v26);
  [v3 appendFormat:@"availabilityStart (YYYY-MM-dd): %@\n", v27];

  unint64_t v28 = [(ACHTemplate *)self availabilityEnd];
  uint64_t v29 = ACHYearMonthDayStringFromDateComponents(v28);
  [v3 appendFormat:@"availabilityEnd (YYYY-MM-dd): %@\n", v29];

  unint64_t v30 = [(ACHTemplate *)self availableCountryCodes];
  int v31 = [(ACHTemplate *)self _displayStringForStringValues:v30];
  [v3 appendFormat:@"availableCountryCodes: %@\n", v31];

  v32 = [(ACHTemplate *)self alertabilityPredicate];
  [v3 appendFormat:@"alertabilityPredicate: %@\n", v32];

  uint64_t v33 = [(ACHTemplate *)self alertDates];
  v34 = [(ACHTemplate *)self _displayStringForAlertDates:v33];
  [v3 appendFormat:@"alertDates (YYYY-MM-dd): %@\n", v34];

  unsigned __int8 v35 = [(ACHTemplate *)self duplicateRemovalStrategy] - 1;
  if (v35 > 3u) {
    v36 = 0;
  }
  else {
    v36 = off_264512C20[(char)v35];
  }
  [v3 appendFormat:@"duplicateRemovalStrategy: %@\n", v36];
  objc_msgSend(v3, "appendFormat:", @"duplicateRemovalCalendarUnit: %ld\n", -[ACHTemplate duplicateRemovalCalendarUnit](self, "duplicateRemovalCalendarUnit"));
  int v37 = [(ACHTemplate *)self earnDateStrategy];
  uint64_t v38 = @"Current Date";
  if (v37 != 1) {
    uint64_t v38 = 0;
  }
  if (v37 == 2) {
    uint64_t v38 = @"Yesterday";
  }
  [v3 appendFormat:@"earnDateStrategy: %@\n", v38];
  int v39 = [(ACHTemplate *)self canonicalUnit];
  [v3 appendFormat:@"canonicalUnit: %@\n", v39];

  objc_msgSend(v3, "appendFormat:", @"displayOrder: %lu\n", -[ACHTemplate displayOrder](self, "displayOrder"));
  if ([(ACHTemplate *)self displaysEarnedInstanceCount]) {
    unint64_t v40 = @"YES";
  }
  else {
    unint64_t v40 = @"NO";
  }
  [v3 appendFormat:@"displaysEarnedInstanceCount: %@\n", v40];
  uint64_t v41 = [(ACHTemplate *)self availableSuffixes];
  v42 = [(ACHTemplate *)self _displayStringForStringValues:v41];
  [v3 appendFormat:@"availableSuffixes: %@\n", v42];

  if ([(ACHTemplate *)self availableOnPairedDevice]) {
    int v43 = @"YES";
  }
  else {
    int v43 = @"NO";
  }
  [v3 appendFormat:@"availableOnPairedDevice: %@\n", v43];
  objc_msgSend(v3, "appendFormat:", @"mobileAssetVersion: %lu\n", -[ACHTemplate mobileAssetVersion](self, "mobileAssetVersion"));
  [v3 appendString:@""]);
  v44 = (void *)[v3 copy];

  return v44;
}

- (id)_displayStringForAlertDates:(id)a3
{
  id v4 = objc_msgSend(a3, "hk_map:", &__block_literal_global_5);
  id v5 = [v4 allObjects];
  unint64_t v6 = [(ACHTemplate *)self _displayStringForStringValues:v5];

  return v6;
}

id __43__ACHTemplate__displayStringForAlertDates___block_invoke(uint64_t a1, void *a2)
{
  return ACHYearMonthDayStringFromDateComponents(a2);
}

- (id)_displayStringForStringValues:(id)a3
{
  id v3 = ACHTemplateStringFromStrings(a3, (const char *)@", ");
  id v4 = [NSString stringWithFormat:@"{ %@ }", v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setKey:", -[ACHTemplate key](self, "key"));
  unint64_t v6 = [(ACHTemplate *)self uniqueName];
  unint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setUniqueName:v7];

  objc_msgSend(v5, "setVersion:", -[ACHTemplate version](self, "version"));
  objc_msgSend(v5, "setMinimumEngineVersion:", -[ACHTemplate minimumEngineVersion](self, "minimumEngineVersion"));
  id v8 = [(ACHTemplate *)self createdDate];
  int v9 = (void *)[v8 copyWithZone:a3];
  [v5 setCreatedDate:v9];

  objc_msgSend(v5, "setCreatorDevice:", -[ACHTemplate creatorDevice](self, "creatorDevice"));
  unint64_t v10 = [(ACHTemplate *)self sourceName];
  int v11 = (void *)[v10 copyWithZone:a3];
  [v5 setSourceName:v11];

  uint64_t v12 = [(ACHTemplate *)self predicate];
  double v13 = (void *)[v12 copyWithZone:a3];
  [v5 setPredicate:v13];

  double v14 = [(ACHTemplate *)self gracePredicate];
  uint64_t v15 = (void *)[v14 copyWithZone:a3];
  [v5 setGracePredicate:v15];

  uint64_t v16 = [(ACHTemplate *)self valueExpression];
  double v17 = (void *)[v16 copyWithZone:a3];
  [v5 setValueExpression:v17];

  int v18 = [(ACHTemplate *)self graceValueExpression];
  unint64_t v19 = (void *)[v18 copyWithZone:a3];
  [v5 setGraceValueExpression:v19];

  uint64_t v20 = [(ACHTemplate *)self progressExpression];
  v21 = (void *)[v20 copyWithZone:a3];
  [v5 setProgressExpression:v21];

  int v22 = [(ACHTemplate *)self graceProgressExpression];
  char v23 = (void *)[v22 copyWithZone:a3];
  [v5 setGraceProgressExpression:v23];

  uint64_t v24 = [(ACHTemplate *)self goalExpression];
  uint64_t v25 = (void *)[v24 copyWithZone:a3];
  [v5 setGoalExpression:v25];

  uint64_t v26 = [(ACHTemplate *)self graceGoalExpression];
  int v27 = (void *)[v26 copyWithZone:a3];
  [v5 setGraceGoalExpression:v27];

  objc_msgSend(v5, "setTriggers:", -[ACHTemplate triggers](self, "triggers"));
  objc_msgSend(v5, "setEarnLimit:", -[ACHTemplate earnLimit](self, "earnLimit"));
  unint64_t v28 = [(ACHTemplate *)self visibilityPredicate];
  uint64_t v29 = (void *)[v28 copyWithZone:a3];
  [v5 setVisibilityPredicate:v29];

  unint64_t v30 = [(ACHTemplate *)self graceVisibilityPredicate];
  int v31 = (void *)[v30 copyWithZone:a3];
  [v5 setGraceVisibilityPredicate:v31];

  objc_msgSend(v5, "setPackedVisibilityStart:", -[ACHTemplate packedVisibilityStart](self, "packedVisibilityStart") & 0xFFFFFFFFFFLL);
  objc_msgSend(v5, "setPackedVisibilityEnd:", -[ACHTemplate packedVisibilityEnd](self, "packedVisibilityEnd") & 0xFFFFFFFFFFLL);
  v32 = [(ACHTemplate *)self availabilityPredicate];
  uint64_t v33 = (void *)[v32 copyWithZone:a3];
  [v5 setAvailabilityPredicate:v33];

  objc_msgSend(v5, "setPackedAvailabilityStart:", -[ACHTemplate packedAvailabilityStart](self, "packedAvailabilityStart") & 0xFFFFFFFFFFLL);
  objc_msgSend(v5, "setPackedAvailabilityEnd:", -[ACHTemplate packedAvailabilityEnd](self, "packedAvailabilityEnd") & 0xFFFFFFFFFFLL);
  v34 = [(ACHTemplate *)self availableCountryCodes];
  unsigned __int8 v35 = (void *)[v34 copyWithZone:a3];
  [v5 setAvailableCountryCodes:v35];

  v36 = [(ACHTemplate *)self alertabilityPredicate];
  int v37 = (void *)[v36 copyWithZone:a3];
  [v5 setAlertabilityPredicate:v37];

  uint64_t v38 = [(ACHTemplate *)self alertDates];
  int v39 = (void *)[v38 copyWithZone:a3];
  [v5 setAlertDates:v39];

  objc_msgSend(v5, "setDuplicateRemovalStrategy:", -[ACHTemplate duplicateRemovalStrategy](self, "duplicateRemovalStrategy"));
  objc_msgSend(v5, "setDuplicateRemovalCalendarUnit:", -[ACHTemplate duplicateRemovalCalendarUnit](self, "duplicateRemovalCalendarUnit"));
  objc_msgSend(v5, "setEarnDateStrategy:", -[ACHTemplate earnDateStrategy](self, "earnDateStrategy"));
  unint64_t v40 = [(ACHTemplate *)self canonicalUnit];
  uint64_t v41 = (void *)[v40 copyWithZone:a3];
  [v5 setCanonicalUnit:v41];

  objc_msgSend(v5, "setDisplayOrder:", -[ACHTemplate displayOrder](self, "displayOrder"));
  objc_msgSend(v5, "setDisplaysEarnedInstanceCount:", -[ACHTemplate displaysEarnedInstanceCount](self, "displaysEarnedInstanceCount"));
  v42 = [(ACHTemplate *)self availableSuffixes];
  [v5 setAvailableSuffixes:v42];

  objc_msgSend(v5, "setAvailableOnPairedDevice:", -[ACHTemplate availableOnPairedDevice](self, "availableOnPairedDevice"));
  objc_msgSend(v5, "setMobileAssetVersion:", -[ACHTemplate mobileAssetVersion](self, "mobileAssetVersion"));
  [(ACHTemplate *)self dailyTarget];
  objc_msgSend(v5, "setDailyTarget:");
  int v43 = [(ACHTemplate *)self dailyTargetCanonicalUnit];
  [v5 setDailyTargetCanonicalUnit:v43];

  v44 = [(ACHTemplate *)self prerequisiteTemplateName];
  uint64_t v45 = (void *)[v44 copyWithZone:a3];
  [v5 setPrerequisiteTemplateName:v45];

  return v5;
}

- (BOOL)_isValid
{
  id v3 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v4 = [(ACHTemplate *)self uniqueName];
  id v5 = [v4 stringByTrimmingCharactersInSet:v3];

  if (v5 && [v5 length])
  {
    BOOL v6 = 1;
  }
  else
  {
    unint64_t v7 = ACHLogTemplates();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(ACHTemplate *)(uint64_t)v5 _isValid];
    }

    BOOL v6 = 0;
  }
  double v14 = [(ACHTemplate *)self predicate];
  uint64_t v15 = [v14 stringByTrimmingCharactersInSet:v3];

  if (v15)
  {
    if ([v15 length]) {
      goto LABEL_14;
    }
    uint64_t v16 = ACHLogTemplates();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACHTemplate _isValid].cold.4(v16);
    }
  }
  else
  {
    uint64_t v16 = ACHLogTemplates();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      [(ACHTemplate *)v16 _isValid];
    }
  }

  BOOL v6 = 0;
LABEL_14:
  uint64_t v24 = [(ACHTemplate *)self duplicateRemovalStrategy];
  if ((v24 - 5) <= 0xFBu)
  {
    uint64_t v25 = v24;
    uint64_t v26 = ACHLogTemplates();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      [(ACHTemplate *)v25 _isValid];
    }

    BOOL v6 = 0;
  }
  uint64_t v33 = [(ACHTemplate *)self earnDateStrategy];
  if ((v33 - 3) <= 0xFDu)
  {
    uint64_t v34 = v33;
    unsigned __int8 v35 = ACHLogTemplates();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      [(ACHTemplate *)v34 _isValid];
    }

    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = (objc_class *)objc_opt_class();
  unint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [v4 decodeObjectOfClass:v5 forKey:v7];

  if ([v8 length])
  {
    uint64_t v9 = [[ACHCodableTemplate alloc] initWithData:v8];
    if (v9)
    {
      self = [(ACHTemplate *)self initWithCodable:v9];

      uint64_t v9 = (ACHCodableTemplate *)self;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return (ACHTemplate *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = ACHCodableFromTemplate(self);
  uint64_t v5 = [v4 data];
  if ([v5 length])
  {
    BOOL v6 = (objc_class *)objc_opt_class();
    unint64_t v7 = NSStringFromClass(v6);
    [v8 encodeObject:v5 forKey:v7];
  }
}

- (void)_isValid
{
}

- (void)initWithCodable:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F582000, log, OS_LOG_TYPE_ERROR, "Unable to decode sync identity.", v1, 2u);
}

@end