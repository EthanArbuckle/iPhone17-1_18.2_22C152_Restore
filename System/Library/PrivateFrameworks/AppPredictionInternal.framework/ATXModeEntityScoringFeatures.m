@interface ATXModeEntityScoringFeatures
- (ATXModeEntityProtocol)entity;
- (ATXModeEntityScoringFeatures)init;
- (BOOL)entityOccurredGloballyOverLastNDays:(unint64_t)a3;
- (BOOL)entityOccurredInModeOverLastNDays:(unint64_t)a3;
- (BOOL)entityOccurredOverLastNDays:(unint64_t)a3 withHistogram:(id)a4;
- (NSArray)localDeviceGlobalAppLaunchesHistogramForLast28Days;
- (NSArray)localDeviceModeAppLaunchesHistogramForLast28Days;
- (NSArray)macDesktopGlobalAppLaunchesHistogramForLast28Days;
- (NSArray)macDesktopModeAppLaunchesHistogramForLast28Days;
- (NSArray)macPortableGlobalAppLaunchesHistogramForLast28Days;
- (NSArray)macPortableModeAppLaunchesHistogramForLast28Days;
- (NSArray)totalGlobalLaunchesHistogramForLast28Days;
- (NSArray)totalModeLaunchesHistogramForLast28Days;
- (NSObject)entitySpecificFeatures;
- (NSString)entityDescription;
- (NSString)modeDescription;
- (double)classConditionalProbability;
- (double)globalPopularity;
- (double)modePopularity;
- (double)posteriorProbability;
- (double)ratioModeAndGlobalPopularity;
- (id)description;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (unint64_t)globalOccurrences;
- (unint64_t)localOccurrences;
- (unint64_t)localOccurrencesAcrossAllEntities;
- (unint64_t)modeOccurrences;
- (unint64_t)uniqueOccurrencesInMode;
- (void)setClassConditionalProbability:(double)a3;
- (void)setEntity:(id)a3;
- (void)setEntityDescription:(id)a3;
- (void)setEntitySpecificFeatures:(id)a3;
- (void)setGlobalOccurrences:(unint64_t)a3;
- (void)setGlobalPopularity:(double)a3;
- (void)setLocalDeviceGlobalAppLaunchesHistogramForLast28Days:(id)a3;
- (void)setLocalDeviceModeAppLaunchesHistogramForLast28Days:(id)a3;
- (void)setLocalOccurrences:(unint64_t)a3;
- (void)setLocalOccurrencesAcrossAllEntities:(unint64_t)a3;
- (void)setMacDesktopGlobalAppLaunchesHistogramForLast28Days:(id)a3;
- (void)setMacDesktopModeAppLaunchesHistogramForLast28Days:(id)a3;
- (void)setMacPortableGlobalAppLaunchesHistogramForLast28Days:(id)a3;
- (void)setMacPortableModeAppLaunchesHistogramForLast28Days:(id)a3;
- (void)setModeDescription:(id)a3;
- (void)setModeOccurrences:(unint64_t)a3;
- (void)setModePopularity:(double)a3;
- (void)setPosteriorProbability:(double)a3;
- (void)setRatioModeAndGlobalPopularity:(double)a3;
- (void)setTotalGlobalLaunchesHistogramForLast28Days:(id)a3;
- (void)setTotalModeLaunchesHistogramForLast28Days:(id)a3;
- (void)setUniqueOccurrencesInMode:(unint64_t)a3;
@end

@implementation ATXModeEntityScoringFeatures

- (ATXModeEntityScoringFeatures)init
{
  v20.receiver = self;
  v20.super_class = (Class)ATXModeEntityScoringFeatures;
  v2 = [(ATXModeEntityScoringFeatures *)&v20 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    totalModeLaunchesHistogramForLast28Days = v2->_totalModeLaunchesHistogramForLast28Days;
    v2->_totalModeLaunchesHistogramForLast28Days = (NSArray *)v3;

    uint64_t v5 = objc_opt_new();
    totalGlobalLaunchesHistogramForLast28Days = v2->_totalGlobalLaunchesHistogramForLast28Days;
    v2->_totalGlobalLaunchesHistogramForLast28Days = (NSArray *)v5;

    uint64_t v7 = objc_opt_new();
    macPortableGlobalAppLaunchesHistogramForLast28Days = v2->_macPortableGlobalAppLaunchesHistogramForLast28Days;
    v2->_macPortableGlobalAppLaunchesHistogramForLast28Days = (NSArray *)v7;

    uint64_t v9 = objc_opt_new();
    macPortableModeAppLaunchesHistogramForLast28Days = v2->_macPortableModeAppLaunchesHistogramForLast28Days;
    v2->_macPortableModeAppLaunchesHistogramForLast28Days = (NSArray *)v9;

    uint64_t v11 = objc_opt_new();
    macDesktopGlobalAppLaunchesHistogramForLast28Days = v2->_macDesktopGlobalAppLaunchesHistogramForLast28Days;
    v2->_macDesktopGlobalAppLaunchesHistogramForLast28Days = (NSArray *)v11;

    uint64_t v13 = objc_opt_new();
    macDesktopModeAppLaunchesHistogramForLast28Days = v2->_macDesktopModeAppLaunchesHistogramForLast28Days;
    v2->_macDesktopModeAppLaunchesHistogramForLast28Days = (NSArray *)v13;

    uint64_t v15 = objc_opt_new();
    localDeviceGlobalAppLaunchesHistogramForLast28Days = v2->_localDeviceGlobalAppLaunchesHistogramForLast28Days;
    v2->_localDeviceGlobalAppLaunchesHistogramForLast28Days = (NSArray *)v15;

    uint64_t v17 = objc_opt_new();
    localDeviceModeAppLaunchesHistogramForLast28Days = v2->_localDeviceModeAppLaunchesHistogramForLast28Days;
    v2->_localDeviceModeAppLaunchesHistogramForLast28Days = (NSArray *)v17;
  }
  return v2;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)ATXModeEntityScoringFeatures;
  uint64_t v5 = [(ATXModeEntityScoringFeatures *)&v48 init];
  v6 = v5;
  if (v5) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    modeDescription = v5->_modeDescription;
    v5->_modeDescription = (NSString *)&stru_1F2740B58;

    entityDescription = v6->_entityDescription;
    v6->_entityDescription = (NSString *)&stru_1F2740B58;

    v10 = [v4 objectForKeyedSubscript:@"correlationPosteriorProbability"];
    [v10 doubleValue];
    v6->_posteriorProbability = v11;

    v12 = [v4 objectForKeyedSubscript:@"correlationClassConditionalProbability"];
    [v12 doubleValue];
    v6->_classConditionalProbability = v13;

    entity = v6->_entity;
    v6->_entity = 0;

    uint64_t v15 = [v4 objectForKeyedSubscript:@"correlationUniqueOccurrencesInMode"];
    v6->_uniqueOccurrencesInMode = [v15 unsignedIntegerValue];

    v16 = [v4 objectForKeyedSubscript:@"correlationNumLocalOccurrences"];
    v6->_localOccurrences = [v16 unsignedIntegerValue];

    uint64_t v17 = [v4 objectForKeyedSubscript:@"correlationNumGlobalOccurrences"];
    v6->_globalOccurrences = [v17 unsignedIntegerValue];

    v18 = [v4 objectForKeyedSubscript:@"correlationModePopularity"];
    [v18 doubleValue];
    v6->_modePopularity = v19;

    objc_super v20 = [v4 objectForKeyedSubscript:@"correlationRatioModeAndGlobalPopularity"];
    [v20 doubleValue];
    v6->_ratioModeAndGlobalPopularity = v21;

    v22 = [v4 objectForKeyedSubscript:@"correlationGlobalPopularity"];
    [v22 doubleValue];
    v6->_globalPopularity = v23;

    uint64_t v24 = [v4 objectForKeyedSubscript:@"totalModeLaunchesHistogram"];
    totalModeLaunchesHistogramForLast28Days = v6->_totalModeLaunchesHistogramForLast28Days;
    v6->_totalModeLaunchesHistogramForLast28Days = (NSArray *)v24;

    uint64_t v26 = [v4 objectForKeyedSubscript:@"totalGlobalLaunchesHistogram"];
    totalGlobalLaunchesHistogramForLast28Days = v6->_totalGlobalLaunchesHistogramForLast28Days;
    v6->_totalGlobalLaunchesHistogramForLast28Days = (NSArray *)v26;

    uint64_t v28 = [v4 objectForKeyedSubscript:@"macPortableGlobalAppLaunchesHistogram"];
    macPortableGlobalAppLaunchesHistogramForLast28Days = v6->_macPortableGlobalAppLaunchesHistogramForLast28Days;
    v6->_macPortableGlobalAppLaunchesHistogramForLast28Days = (NSArray *)v28;

    uint64_t v30 = [v4 objectForKeyedSubscript:@"macPortableModeAppLaunchesHistogram"];
    macPortableModeAppLaunchesHistogramForLast28Days = v6->_macPortableModeAppLaunchesHistogramForLast28Days;
    v6->_macPortableModeAppLaunchesHistogramForLast28Days = (NSArray *)v30;

    uint64_t v32 = [v4 objectForKeyedSubscript:@"macDesktopGlobalAppLaunchesHistogram"];
    macDesktopGlobalAppLaunchesHistogramForLast28Days = v6->_macDesktopGlobalAppLaunchesHistogramForLast28Days;
    v6->_macDesktopGlobalAppLaunchesHistogramForLast28Days = (NSArray *)v32;

    uint64_t v34 = [v4 objectForKeyedSubscript:@"macDesktopModeAppLaunchesHistogram"];
    macDesktopModeAppLaunchesHistogramForLast28Days = v6->_macDesktopModeAppLaunchesHistogramForLast28Days;
    v6->_macDesktopModeAppLaunchesHistogramForLast28Days = (NSArray *)v34;

    uint64_t v36 = [v4 objectForKeyedSubscript:@"localDeviceGlobalAppLaunchesHistogram"];
    localDeviceGlobalAppLaunchesHistogramForLast28Days = v6->_localDeviceGlobalAppLaunchesHistogramForLast28Days;
    v6->_localDeviceGlobalAppLaunchesHistogramForLast28Days = (NSArray *)v36;

    uint64_t v38 = [v4 objectForKeyedSubscript:@"localDeviceModeAppLaunchesHistogram"];
    localDeviceModeAppLaunchesHistogramForLast28Days = v6->_localDeviceModeAppLaunchesHistogramForLast28Days;
    v6->_localDeviceModeAppLaunchesHistogramForLast28Days = (NSArray *)v38;

    v40 = [v4 objectForKeyedSubscript:@"correlationEntityFeaturesType"];

    if (v40)
    {
      v41 = [v4 objectForKeyedSubscript:@"correlationEntityFeaturesType"];
      v42 = NSClassFromString(v41);

      if (v42)
      {
        id v43 = [v42 alloc];
        v44 = [v4 objectForKeyedSubscript:@"correlationEntitySpecificFeatures"];
        uint64_t v45 = [v43 initFromJSON:v44];
        entitySpecificFeatures = v6->_entitySpecificFeatures;
        v6->_entitySpecificFeatures = v45;
      }
    }
  }

  return v6;
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"entityDescription: %@, posteriorProbability: %.3f, globalPopularity: %.3f, modePopularity: %.3f, ratio between mode popularity and global popularity: %.3f, classConditionalProbability: %.3f, unique occurrences in mode: %lu, local occurrences: %lu, global occurrences: %lu, entity specific features: %@, total mode launches histogram: %@, total global launches histogram: %@, macPortable global app launches histogram: %@, macPortable mode app launches histogram: %@, macDesktop global app launches histogram: %@, macDesktop mode app launches histogram: %@local device global app launches histogram: %@local device mode app launches histogram: %@", self->_entityDescription, *(void *)&self->_posteriorProbability, *(void *)&self->_globalPopularity, *(void *)&self->_modePopularity, *(void *)&self->_ratioModeAndGlobalPopularity, *(void *)&self->_classConditionalProbability, self->_uniqueOccurrencesInMode, self->_localOccurrences, self->_globalOccurrences, self->_entitySpecificFeatures, self->_totalModeLaunchesHistogramForLast28Days, self->_totalGlobalLaunchesHistogramForLast28Days, self->_macPortableGlobalAppLaunchesHistogramForLast28Days, self->_macPortableModeAppLaunchesHistogramForLast28Days, self->_macDesktopGlobalAppLaunchesHistogramForLast28Days, self->_macDesktopModeAppLaunchesHistogramForLast28Days,
                 self->_localDeviceGlobalAppLaunchesHistogramForLast28Days,
                 self->_localDeviceModeAppLaunchesHistogramForLast28Days);
  return v2;
}

- (id)jsonRepresentation
{
  v33[18] = *MEMORY[0x1E4F143B8];
  v32[0] = @"correlationModePopularity";
  v31 = [NSNumber numberWithDouble:self->_modePopularity];
  v33[0] = v31;
  v32[1] = @"correlationGlobalPopularity";
  uint64_t v3 = [NSNumber numberWithDouble:self->_globalPopularity];
  v33[1] = v3;
  v32[2] = @"correlationPosteriorProbability";
  id v4 = [NSNumber numberWithDouble:self->_posteriorProbability];
  v33[2] = v4;
  v32[3] = @"correlationRatioModeAndGlobalPopularity";
  uint64_t v5 = [NSNumber numberWithDouble:self->_ratioModeAndGlobalPopularity];
  v33[3] = v5;
  v32[4] = @"correlationClassConditionalProbability";
  v6 = [NSNumber numberWithDouble:self->_classConditionalProbability];
  v33[4] = v6;
  v32[5] = @"correlationUniqueOccurrencesInMode";
  BOOL v7 = [NSNumber numberWithUnsignedInteger:self->_uniqueOccurrencesInMode];
  v33[5] = v7;
  v32[6] = @"correlationNumLocalOccurrences";
  v8 = [NSNumber numberWithUnsignedInteger:self->_localOccurrences];
  v33[6] = v8;
  v32[7] = @"correlationNumGlobalOccurrences";
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:self->_globalOccurrences];
  v33[7] = v9;
  v32[8] = @"correlationEntityFeaturesType";
  v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  v12 = (void *)v11;
  double v13 = &stru_1F2740B58;
  if (v11) {
    double v13 = (__CFString *)v11;
  }
  v33[8] = v13;
  v32[9] = @"correlationEntitySpecificFeatures";
  uint64_t v14 = [self->_entitySpecificFeatures jsonRepresentation];
  uint64_t v15 = (void *)v14;
  uint64_t v16 = MEMORY[0x1E4F1CC08];
  if (v14) {
    uint64_t v16 = v14;
  }
  totalModeLaunchesHistogramForLast28Days = self->_totalModeLaunchesHistogramForLast28Days;
  totalGlobalLaunchesHistogramForLast28Days = self->_totalGlobalLaunchesHistogramForLast28Days;
  if (!totalModeLaunchesHistogramForLast28Days) {
    totalModeLaunchesHistogramForLast28Days = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v33[9] = v16;
  v33[10] = totalModeLaunchesHistogramForLast28Days;
  v32[10] = @"totalModeLaunchesHistogram";
  v32[11] = @"totalGlobalLaunchesHistogram";
  if (totalGlobalLaunchesHistogramForLast28Days) {
    double v19 = totalGlobalLaunchesHistogramForLast28Days;
  }
  else {
    double v19 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  macPortableGlobalAppLaunchesHistogramForLast28Days = self->_macPortableGlobalAppLaunchesHistogramForLast28Days;
  macPortableModeAppLaunchesHistogramForLast28Days = self->_macPortableModeAppLaunchesHistogramForLast28Days;
  if (!macPortableGlobalAppLaunchesHistogramForLast28Days) {
    macPortableGlobalAppLaunchesHistogramForLast28Days = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v33[11] = v19;
  v33[12] = macPortableGlobalAppLaunchesHistogramForLast28Days;
  v32[12] = @"macPortableGlobalAppLaunchesHistogram";
  v32[13] = @"macPortableModeAppLaunchesHistogram";
  if (macPortableModeAppLaunchesHistogramForLast28Days) {
    v22 = macPortableModeAppLaunchesHistogramForLast28Days;
  }
  else {
    v22 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  macDesktopGlobalAppLaunchesHistogramForLast28Days = self->_macDesktopGlobalAppLaunchesHistogramForLast28Days;
  macDesktopModeAppLaunchesHistogramForLast28Days = self->_macDesktopModeAppLaunchesHistogramForLast28Days;
  if (!macDesktopGlobalAppLaunchesHistogramForLast28Days) {
    macDesktopGlobalAppLaunchesHistogramForLast28Days = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v33[13] = v22;
  v33[14] = macDesktopGlobalAppLaunchesHistogramForLast28Days;
  v32[14] = @"macDesktopGlobalAppLaunchesHistogram";
  v32[15] = @"macDesktopModeAppLaunchesHistogram";
  if (macDesktopModeAppLaunchesHistogramForLast28Days) {
    v25 = macDesktopModeAppLaunchesHistogramForLast28Days;
  }
  else {
    v25 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  localDeviceGlobalAppLaunchesHistogramForLast28Days = self->_localDeviceGlobalAppLaunchesHistogramForLast28Days;
  localDeviceModeAppLaunchesHistogramForLast28Days = self->_localDeviceModeAppLaunchesHistogramForLast28Days;
  if (!localDeviceGlobalAppLaunchesHistogramForLast28Days) {
    localDeviceGlobalAppLaunchesHistogramForLast28Days = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v33[15] = v25;
  v33[16] = localDeviceGlobalAppLaunchesHistogramForLast28Days;
  v32[16] = @"localDeviceGlobalAppLaunchesHistogram";
  v32[17] = @"localDeviceModeAppLaunchesHistogram";
  if (localDeviceModeAppLaunchesHistogramForLast28Days) {
    uint64_t v28 = localDeviceModeAppLaunchesHistogramForLast28Days;
  }
  else {
    uint64_t v28 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v33[17] = v28;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:18];

  return v29;
}

- (BOOL)entityOccurredOverLastNDays:(unint64_t)a3 withHistogram:(id)a4
{
  id v5 = a4;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__ATXModeEntityScoringFeatures_entityOccurredOverLastNDays_withHistogram___block_invoke;
  v7[3] = &unk_1E68B6538;
  v7[4] = &v8;
  v7[5] = a3;
  [v5 enumerateObjectsUsingBlock:v7];
  LOBYTE(a3) = v9[3] != 0;
  _Block_object_dispose(&v8, 8);

  return a3;
}

void __74__ATXModeEntityScoringFeatures_entityOccurredOverLastNDays_withHistogram___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(void *)(a1 + 40) < a3
    || (id v11 = v7,
        uint64_t v8 = [v7 unsignedIntegerValue],
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8),
        uint64_t v10 = *(void *)(v9 + 24) + v8,
        id v7 = v11,
        *(void *)(v9 + 24) = v10,
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)))
  {
    *a4 = 1;
  }
}

- (BOOL)entityOccurredGloballyOverLastNDays:(unint64_t)a3
{
  return [(ATXModeEntityScoringFeatures *)self entityOccurredOverLastNDays:a3 withHistogram:self->_totalGlobalLaunchesHistogramForLast28Days];
}

- (BOOL)entityOccurredInModeOverLastNDays:(unint64_t)a3
{
  return [(ATXModeEntityScoringFeatures *)self entityOccurredOverLastNDays:a3 withHistogram:self->_totalModeLaunchesHistogramForLast28Days];
}

- (NSString)modeDescription
{
  return self->_modeDescription;
}

- (void)setModeDescription:(id)a3
{
}

- (double)posteriorProbability
{
  return self->_posteriorProbability;
}

- (void)setPosteriorProbability:(double)a3
{
  self->_posteriorProbability = a3;
}

- (double)classConditionalProbability
{
  return self->_classConditionalProbability;
}

- (void)setClassConditionalProbability:(double)a3
{
  self->_classConditionalProbability = a3;
}

- (unint64_t)uniqueOccurrencesInMode
{
  return self->_uniqueOccurrencesInMode;
}

- (void)setUniqueOccurrencesInMode:(unint64_t)a3
{
  self->_uniqueOccurrencesInMode = a3;
}

- (unint64_t)modeOccurrences
{
  return self->_modeOccurrences;
}

- (void)setModeOccurrences:(unint64_t)a3
{
  self->_modeOccurrences = a3;
}

- (unint64_t)localOccurrences
{
  return self->_localOccurrences;
}

- (void)setLocalOccurrences:(unint64_t)a3
{
  self->_localOccurrences = a3;
}

- (unint64_t)globalOccurrences
{
  return self->_globalOccurrences;
}

- (void)setGlobalOccurrences:(unint64_t)a3
{
  self->_globalOccurrences = a3;
}

- (double)modePopularity
{
  return self->_modePopularity;
}

- (void)setModePopularity:(double)a3
{
  self->_modePopularity = a3;
}

- (double)globalPopularity
{
  return self->_globalPopularity;
}

- (void)setGlobalPopularity:(double)a3
{
  self->_globalPopularity = a3;
}

- (double)ratioModeAndGlobalPopularity
{
  return self->_ratioModeAndGlobalPopularity;
}

- (void)setRatioModeAndGlobalPopularity:(double)a3
{
  self->_ratioModeAndGlobalPopularity = a3;
}

- (unint64_t)localOccurrencesAcrossAllEntities
{
  return self->_localOccurrencesAcrossAllEntities;
}

- (void)setLocalOccurrencesAcrossAllEntities:(unint64_t)a3
{
  self->_localOccurrencesAcrossAllEntities = a3;
}

- (NSArray)totalModeLaunchesHistogramForLast28Days
{
  return self->_totalModeLaunchesHistogramForLast28Days;
}

- (void)setTotalModeLaunchesHistogramForLast28Days:(id)a3
{
}

- (NSArray)totalGlobalLaunchesHistogramForLast28Days
{
  return self->_totalGlobalLaunchesHistogramForLast28Days;
}

- (void)setTotalGlobalLaunchesHistogramForLast28Days:(id)a3
{
}

- (ATXModeEntityProtocol)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
}

- (NSString)entityDescription
{
  return self->_entityDescription;
}

- (void)setEntityDescription:(id)a3
{
}

- (NSObject)entitySpecificFeatures
{
  return self->_entitySpecificFeatures;
}

- (void)setEntitySpecificFeatures:(id)a3
{
}

- (NSArray)macPortableGlobalAppLaunchesHistogramForLast28Days
{
  return self->_macPortableGlobalAppLaunchesHistogramForLast28Days;
}

- (void)setMacPortableGlobalAppLaunchesHistogramForLast28Days:(id)a3
{
}

- (NSArray)macPortableModeAppLaunchesHistogramForLast28Days
{
  return self->_macPortableModeAppLaunchesHistogramForLast28Days;
}

- (void)setMacPortableModeAppLaunchesHistogramForLast28Days:(id)a3
{
}

- (NSArray)macDesktopGlobalAppLaunchesHistogramForLast28Days
{
  return self->_macDesktopGlobalAppLaunchesHistogramForLast28Days;
}

- (void)setMacDesktopGlobalAppLaunchesHistogramForLast28Days:(id)a3
{
}

- (NSArray)macDesktopModeAppLaunchesHistogramForLast28Days
{
  return self->_macDesktopModeAppLaunchesHistogramForLast28Days;
}

- (void)setMacDesktopModeAppLaunchesHistogramForLast28Days:(id)a3
{
}

- (NSArray)localDeviceGlobalAppLaunchesHistogramForLast28Days
{
  return self->_localDeviceGlobalAppLaunchesHistogramForLast28Days;
}

- (void)setLocalDeviceGlobalAppLaunchesHistogramForLast28Days:(id)a3
{
}

- (NSArray)localDeviceModeAppLaunchesHistogramForLast28Days
{
  return self->_localDeviceModeAppLaunchesHistogramForLast28Days;
}

- (void)setLocalDeviceModeAppLaunchesHistogramForLast28Days:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceModeAppLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_localDeviceGlobalAppLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_macDesktopModeAppLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_macDesktopGlobalAppLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_macPortableModeAppLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_macPortableGlobalAppLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_entitySpecificFeatures, 0);
  objc_storeStrong((id *)&self->_entityDescription, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_totalGlobalLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_totalModeLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_modeDescription, 0);
}

@end