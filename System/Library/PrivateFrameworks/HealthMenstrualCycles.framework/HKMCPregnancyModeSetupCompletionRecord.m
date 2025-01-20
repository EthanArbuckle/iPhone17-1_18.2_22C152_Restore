@interface HKMCPregnancyModeSetupCompletionRecord
+ (BOOL)supportsSecureCoding;
+ (id)currentVersion;
- (BOOL)isEqual:(id)a3;
- (HKMCPregnancyModeSetupCompletionRecord)initWithCoder:(id)a3;
- (HKMCPregnancyModeSetupCompletionRecord)initWithVersion:(id)a3 sampleUUID:(id)a4 educationalStepsReviewDate:(id)a5 configurationStepsReviewDate:(id)a6 pregnancyAdjustedFeaturesSet:(id)a7 postPregnancyFeatureAdjustmentCompletionLog:(id)a8;
- (NSDate)configurationStepsReviewDate;
- (NSDate)educationalStepsReviewDate;
- (NSDictionary)postPregnancyFeatureAdjustmentCompletionLog;
- (NSNumber)version;
- (NSSet)pregnancyAdjustedFeaturesSet;
- (NSUUID)sampleUUID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigurationStepsReviewDate:(id)a3;
- (void)setPostPregnancyFeatureAdjustmentCompletionLog:(id)a3;
- (void)setPregnancyAdjustedFeaturesSet:(id)a3;
@end

@implementation HKMCPregnancyModeSetupCompletionRecord

+ (id)currentVersion
{
  return &unk_26D7D01A8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  version = self->_version;
  id v5 = a3;
  [v5 encodeObject:version forKey:@"Version"];
  [v5 encodeObject:self->_sampleUUID forKey:@"SampleUUID"];
  [v5 encodeObject:self->_educationalStepsReviewDate forKey:@"EducationalStepsReviewDate"];
  [v5 encodeObject:self->_configurationStepsReviewDate forKey:@"ConfigurationStepsReviewDate"];
  [v5 encodeObject:self->_pregnancyAdjustedFeaturesSet forKey:@"_PregnancyAdjustedFeaturesSet"];
  [v5 encodeObject:self->_postPregnancyFeatureAdjustmentCompletionLog forKey:@"PostPregnancyFeatureAdjustmentCompletionLog"];
  id v6 = [(NSDictionary *)self->_postPregnancyFeatureAdjustmentCompletionLog objectForKey:@"LowCardioFitness"];
  [v5 encodeObject:v6 forKey:@"_PostPregnancyFeatureAdjustmentCompletionDate"];
}

- (HKMCPregnancyModeSetupCompletionRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HKMCPregnancyModeSetupCompletionRecord;
  id v5 = [(HKMCPregnancyModeSetupCompletionRecord *)&v27 init];
  if (v5)
  {
    v5->_version = (NSNumber *)(id)[NSNumber numberWithInt:2];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SampleUUID"];
    sampleUUID = v5->_sampleUUID;
    v5->_sampleUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EducationalStepsReviewDate"];
    educationalStepsReviewDate = v5->_educationalStepsReviewDate;
    v5->_educationalStepsReviewDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ConfigurationStepsReviewDate"];
    configurationStepsReviewDate = v5->_configurationStepsReviewDate;
    v5->_configurationStepsReviewDate = (NSDate *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForSetOf:", objc_opt_class());
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_PregnancyAdjustedFeaturesSet"];
    pregnancyAdjustedFeaturesSet = v5->_pregnancyAdjustedFeaturesSet;
    v5->_pregnancyAdjustedFeaturesSet = (NSSet *)v13;

    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "hk_typesForDictionaryMapping:to:", v16, objc_opt_class());
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"PostPregnancyFeatureAdjustmentCompletionLog"];
    postPregnancyFeatureAdjustmentCompletionLog = v5->_postPregnancyFeatureAdjustmentCompletionLog;
    v5->_postPregnancyFeatureAdjustmentCompletionLog = (NSDictionary *)v18;

    if (!v5->_postPregnancyFeatureAdjustmentCompletionLog)
    {
      uint64_t v20 = [NSDictionary dictionary];
      v21 = v5->_postPregnancyFeatureAdjustmentCompletionLog;
      v5->_postPregnancyFeatureAdjustmentCompletionLog = (NSDictionary *)v20;
    }
    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_PostPregnancyFeatureAdjustmentCompletionDate"];
    if (v22)
    {
      v23 = (void *)[(NSDictionary *)v5->_postPregnancyFeatureAdjustmentCompletionLog mutableCopy];
      [v23 setValue:v22 forKey:@"LowCardioFitness"];
      uint64_t v24 = [NSDictionary dictionaryWithDictionary:v23];
      v25 = v5->_postPregnancyFeatureAdjustmentCompletionLog;
      v5->_postPregnancyFeatureAdjustmentCompletionLog = (NSDictionary *)v24;
    }
  }

  return v5;
}

- (HKMCPregnancyModeSetupCompletionRecord)initWithVersion:(id)a3 sampleUUID:(id)a4 educationalStepsReviewDate:(id)a5 configurationStepsReviewDate:(id)a6 pregnancyAdjustedFeaturesSet:(id)a7 postPregnancyFeatureAdjustmentCompletionLog:(id)a8
{
  v14 = (NSNumber *)a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HKMCPregnancyModeSetupCompletionRecord;
  uint64_t v18 = [(HKMCPregnancyModeSetupCompletionRecord *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_version = v14;
    objc_storeStrong((id *)&v18->_sampleUUID, a4);
    objc_storeStrong((id *)&v19->_educationalStepsReviewDate, a5);
    objc_storeStrong((id *)&v19->_configurationStepsReviewDate, a6);
    objc_storeStrong((id *)&v19->_pregnancyAdjustedFeaturesSet, a7);
    objc_storeStrong((id *)&v19->_postPregnancyFeatureAdjustmentCompletionLog, a8);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKMCPregnancyModeSetupCompletionRecord *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (![(NSNumber *)self->_version isEqualToNumber:v5->_version]) {
        goto LABEL_19;
      }
      if (![(NSUUID *)self->_sampleUUID isEqual:v5->_sampleUUID]) {
        goto LABEL_19;
      }
      educationalStepsReviewDate = self->_educationalStepsReviewDate;
      v7 = v5->_educationalStepsReviewDate;
      if (educationalStepsReviewDate != v7
        && (!v7 || !-[NSDate isEqual:](educationalStepsReviewDate, "isEqual:")))
      {
        goto LABEL_19;
      }
      configurationStepsReviewDate = self->_configurationStepsReviewDate;
      v9 = v5->_configurationStepsReviewDate;
      if (configurationStepsReviewDate != v9
        && (!v9 || !-[NSDate isEqual:](configurationStepsReviewDate, "isEqual:")))
      {
        goto LABEL_19;
      }
      pregnancyAdjustedFeaturesSet = self->_pregnancyAdjustedFeaturesSet;
      v11 = v5->_pregnancyAdjustedFeaturesSet;
      if (pregnancyAdjustedFeaturesSet != v11
        && (!v11 || !-[NSSet isEqualToSet:](pregnancyAdjustedFeaturesSet, "isEqualToSet:")))
      {
        goto LABEL_19;
      }
      postPregnancyFeatureAdjustmentCompletionLog = self->_postPregnancyFeatureAdjustmentCompletionLog;
      uint64_t v13 = v5->_postPregnancyFeatureAdjustmentCompletionLog;
      if (postPregnancyFeatureAdjustmentCompletionLog == v13)
      {
        char v14 = 1;
        goto LABEL_20;
      }
      if (v13) {
        char v14 = -[NSDictionary isEqual:](postPregnancyFeatureAdjustmentCompletionLog, "isEqual:");
      }
      else {
LABEL_19:
      }
        char v14 = 0;
LABEL_20:

      goto LABEL_21;
    }
    char v14 = 0;
  }
LABEL_21:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_version hash];
  uint64_t v4 = [(NSUUID *)self->_sampleUUID hash] ^ v3;
  uint64_t v5 = [(NSDate *)self->_educationalStepsReviewDate hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDate *)self->_configurationStepsReviewDate hash];
  uint64_t v7 = [(NSSet *)self->_pregnancyAdjustedFeaturesSet hash];
  return v6 ^ v7 ^ [(NSDictionary *)self->_postPregnancyFeatureAdjustmentCompletionLog hash];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  version = self->_version;
  uint64_t v6 = [(NSUUID *)self->_sampleUUID UUIDString];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p version:%@ sampleUUID:%@ educationalStepsReviewDate:%@ configurationStepsReviewDate:%@pregnancyAdjustedFeaturesSet:%@>postPregnancyFeatureAdjustmentCompletionLog:%@>", v4, self, version, v6, self->_educationalStepsReviewDate, self->_configurationStepsReviewDate, self->_pregnancyAdjustedFeaturesSet, self->_postPregnancyFeatureAdjustmentCompletionLog];

  return v7;
}

- (NSNumber)version
{
  return self->_version;
}

- (NSUUID)sampleUUID
{
  return self->_sampleUUID;
}

- (NSDate)educationalStepsReviewDate
{
  return self->_educationalStepsReviewDate;
}

- (NSDate)configurationStepsReviewDate
{
  return self->_configurationStepsReviewDate;
}

- (void)setConfigurationStepsReviewDate:(id)a3
{
}

- (NSSet)pregnancyAdjustedFeaturesSet
{
  return self->_pregnancyAdjustedFeaturesSet;
}

- (void)setPregnancyAdjustedFeaturesSet:(id)a3
{
}

- (NSDictionary)postPregnancyFeatureAdjustmentCompletionLog
{
  return self->_postPregnancyFeatureAdjustmentCompletionLog;
}

- (void)setPostPregnancyFeatureAdjustmentCompletionLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postPregnancyFeatureAdjustmentCompletionLog, 0);
  objc_storeStrong((id *)&self->_pregnancyAdjustedFeaturesSet, 0);
  objc_storeStrong((id *)&self->_configurationStepsReviewDate, 0);
  objc_storeStrong((id *)&self->_educationalStepsReviewDate, 0);
  objc_storeStrong((id *)&self->_sampleUUID, 0);
}

@end