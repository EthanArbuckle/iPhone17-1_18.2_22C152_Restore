@interface HDDemoDataGeneratorConfiguration
+ (id)configurationFromDefaults:(id)a3;
- (BOOL)highFidelityGeneration;
- (BOOL)shouldEnsureRecentWorkoutHasRoute;
- (BOOL)shouldGenerateHealthDocuments;
- (BOOL)shouldGenerateLoudHeadphoneData;
- (BOOL)shouldGenerateMedicalID;
- (BOOL)shouldGenerateRecentLiquidsIntake;
- (BOOL)shouldPresentNotifications;
- (HDDemoDataGeneratorConfiguration)init;
- (int64_t)biologicalSex;
- (int64_t)generationPeriodInDays;
- (int64_t)nutritionTrackingType;
- (int64_t)profileType;
- (int64_t)resultsTrackingType;
- (int64_t)sampleTrackingType;
- (void)configureForProfileType:(int64_t)a3;
- (void)persistToDefaults:(id)a3;
- (void)setBiologicalSex:(int64_t)a3;
- (void)setGenerationPeriodInDays:(int64_t)a3;
- (void)setHighFidelityGeneration:(BOOL)a3;
- (void)setNutritionTrackingType:(int64_t)a3;
- (void)setProfileType:(int64_t)a3;
- (void)setResultsTrackingType:(int64_t)a3;
- (void)setSampleTrackingType:(int64_t)a3;
- (void)setShouldEnsureRecentWorkoutHasRoute:(BOOL)a3;
- (void)setShouldGenerateHealthDocuments:(BOOL)a3;
- (void)setShouldGenerateLoudHeadphoneData:(BOOL)a3;
- (void)setShouldGenerateMedicalID:(BOOL)a3;
- (void)setShouldGenerateRecentLiquidsIntake:(BOOL)a3;
- (void)setShouldPresentNotifications:(BOOL)a3;
@end

@implementation HDDemoDataGeneratorConfiguration

+ (id)configurationFromDefaults:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v4 objectForKey:@"HealthDemoDataProfileTypeKey"];

  if (v6)
  {
    objc_msgSend(v5, "setProfileType:", objc_msgSend(v4, "integerForKey:", @"HealthDemoDataProfileTypeKey"));
    objc_msgSend(v5, "setGenerationPeriodInDays:", objc_msgSend(v4, "integerForKey:", @"HealthDemoInitialDataGenerationPeriodKey"));
    objc_msgSend(v5, "setHighFidelityGeneration:", objc_msgSend(v4, "BOOLForKey:", @"HealthDemoDataHighFidelityDataKey"));
    objc_msgSend(v5, "setShouldPresentNotifications:", objc_msgSend(v4, "BOOLForKey:", @"HealthDemoDataEnableNotificationsKey"));
    objc_msgSend(v5, "setBiologicalSex:", objc_msgSend(v4, "integerForKey:", @"HealthDemoDataGenderKey"));
    objc_msgSend(v5, "setSampleTrackingType:", objc_msgSend(v4, "integerForKey:", @"HealthDemoDataDataTrackingTypeKey"));
    objc_msgSend(v5, "setNutritionTrackingType:", objc_msgSend(v4, "integerForKey:", @"HealthDemoDataNutritionTrackingTypeKey"));
    objc_msgSend(v5, "setResultsTrackingType:", objc_msgSend(v4, "integerForKey:", @"HealthDemoDataResultsTrackingTypeKey"));
    objc_msgSend(v5, "setShouldGenerateMedicalID:", objc_msgSend(v4, "BOOLForKey:", @"HealthDemoDataGenerateMedicalIDKey"));
    objc_msgSend(v5, "setShouldGenerateHealthDocuments:", objc_msgSend(v4, "BOOLForKey:", @"HealthDemoDataGenerateHealthDocumentsKey"));
    objc_msgSend(v5, "setShouldEnsureRecentWorkoutHasRoute:", objc_msgSend(v4, "BOOLForKey:", @"HealthDemoDataEnsureRecentWorkoutHasRouteKey"));
    objc_msgSend(v5, "setShouldGenerateRecentLiquidsIntake:", objc_msgSend(v4, "BOOLForKey:", @"HealthDemoDataGenerateRecentLiquidsKey"));
    objc_msgSend(v5, "setShouldGenerateLoudHeadphoneData:", objc_msgSend(v4, "BOOLForKey:", @"HealthDemoDataLoudHeadphoneListeningKey"));
  }
  else
  {
    [v5 configureForProfileType:1];
  }

  return v5;
}

- (HDDemoDataGeneratorConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataGeneratorConfiguration;
  v2 = [(HDDemoDataGeneratorConfiguration *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HDDemoDataGeneratorConfiguration *)v2 configureForProfileType:1];
  }
  return v3;
}

- (void)configureForProfileType:(int64_t)a3
{
  self->_profileType = a3;
  id v4 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v5 = [v4 isAppleWatch];

  if (v5)
  {
    self->_generationPeriodInDays = 1;
    if (![MEMORY[0x1E4F2B860] runningInStoreDemoModeF201]) {
      goto LABEL_8;
    }
    int64_t v6 = 60;
  }
  else if ([MEMORY[0x1E4F2B860] isRunningStoreDemoMode])
  {
    int64_t v6 = 180;
  }
  else
  {
    int64_t v6 = 90;
  }
  self->_generationPeriodInDays = v6;
LABEL_8:
  self->_highFidelityGeneration = [MEMORY[0x1E4F2B860] runningInStoreDemoModeF201];
  int64x2_t v7 = vdupq_n_s64(1uLL);
  *(int64x2_t *)&self->_biologicalSex = v7;
  *(int64x2_t *)&self->_nutritionTrackingType = v7;
  self->_shouldGenerateMedicalID = 1;
  id v8 = [MEMORY[0x1E4F2B860] sharedBehavior];
  self->_shouldGenerateHealthDocuments = [v8 isAppleWatch] ^ 1;
}

- (void)persistToDefaults:(id)a3
{
  id v4 = NSNumber;
  int64_t profileType = self->_profileType;
  id v6 = a3;
  int64x2_t v7 = [v4 numberWithInteger:profileType];
  [v6 setObject:v7 forKey:@"HealthDemoDataProfileTypeKey"];

  id v8 = [NSNumber numberWithInteger:self->_generationPeriodInDays];
  [v6 setObject:v8 forKey:@"HealthDemoInitialDataGenerationPeriodKey"];

  v9 = [NSNumber numberWithBool:self->_highFidelityGeneration];
  [v6 setObject:v9 forKey:@"HealthDemoDataHighFidelityDataKey"];

  v10 = [NSNumber numberWithBool:self->_shouldPresentNotifications];
  [v6 setObject:v10 forKey:@"HealthDemoDataEnableNotificationsKey"];

  v11 = [NSNumber numberWithInteger:self->_biologicalSex];
  [v6 setObject:v11 forKey:@"HealthDemoDataGenderKey"];

  v12 = [NSNumber numberWithInteger:self->_sampleTrackingType];
  [v6 setObject:v12 forKey:@"HealthDemoDataDataTrackingTypeKey"];

  v13 = [NSNumber numberWithInteger:self->_nutritionTrackingType];
  [v6 setObject:v13 forKey:@"HealthDemoDataNutritionTrackingTypeKey"];

  v14 = [NSNumber numberWithInteger:self->_resultsTrackingType];
  [v6 setObject:v14 forKey:@"HealthDemoDataResultsTrackingTypeKey"];

  v15 = [NSNumber numberWithBool:self->_shouldGenerateMedicalID];
  [v6 setObject:v15 forKey:@"HealthDemoDataGenerateMedicalIDKey"];

  v16 = [NSNumber numberWithBool:self->_shouldGenerateHealthDocuments];
  [v6 setObject:v16 forKey:@"HealthDemoDataGenerateHealthDocumentsKey"];

  v17 = [NSNumber numberWithBool:self->_shouldEnsureRecentWorkoutHasRoute];
  [v6 setObject:v17 forKey:@"HealthDemoDataEnsureRecentWorkoutHasRouteKey"];

  v18 = [NSNumber numberWithBool:self->_shouldGenerateRecentLiquidsIntake];
  [v6 setObject:v18 forKey:@"HealthDemoDataGenerateRecentLiquidsKey"];

  id v19 = [NSNumber numberWithBool:self->_shouldGenerateLoudHeadphoneData];
  [v6 setObject:v19 forKey:@"HealthDemoDataLoudHeadphoneListeningKey"];
}

- (int64_t)profileType
{
  return self->_profileType;
}

- (void)setProfileType:(int64_t)a3
{
  self->_int64_t profileType = a3;
}

- (int64_t)generationPeriodInDays
{
  return self->_generationPeriodInDays;
}

- (void)setGenerationPeriodInDays:(int64_t)a3
{
  self->_generationPeriodInDays = a3;
}

- (BOOL)highFidelityGeneration
{
  return self->_highFidelityGeneration;
}

- (void)setHighFidelityGeneration:(BOOL)a3
{
  self->_highFidelityGeneration = a3;
}

- (BOOL)shouldPresentNotifications
{
  return self->_shouldPresentNotifications;
}

- (void)setShouldPresentNotifications:(BOOL)a3
{
  self->_shouldPresentNotifications = a3;
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(int64_t)a3
{
  self->_biologicalSex = a3;
}

- (int64_t)sampleTrackingType
{
  return self->_sampleTrackingType;
}

- (void)setSampleTrackingType:(int64_t)a3
{
  self->_sampleTrackingType = a3;
}

- (int64_t)nutritionTrackingType
{
  return self->_nutritionTrackingType;
}

- (void)setNutritionTrackingType:(int64_t)a3
{
  self->_nutritionTrackingType = a3;
}

- (int64_t)resultsTrackingType
{
  return self->_resultsTrackingType;
}

- (void)setResultsTrackingType:(int64_t)a3
{
  self->_resultsTrackingType = a3;
}

- (BOOL)shouldGenerateHealthDocuments
{
  return self->_shouldGenerateHealthDocuments;
}

- (void)setShouldGenerateHealthDocuments:(BOOL)a3
{
  self->_shouldGenerateHealthDocuments = a3;
}

- (BOOL)shouldGenerateMedicalID
{
  return self->_shouldGenerateMedicalID;
}

- (void)setShouldGenerateMedicalID:(BOOL)a3
{
  self->_shouldGenerateMedicalID = a3;
}

- (BOOL)shouldEnsureRecentWorkoutHasRoute
{
  return self->_shouldEnsureRecentWorkoutHasRoute;
}

- (void)setShouldEnsureRecentWorkoutHasRoute:(BOOL)a3
{
  self->_shouldEnsureRecentWorkoutHasRoute = a3;
}

- (BOOL)shouldGenerateRecentLiquidsIntake
{
  return self->_shouldGenerateRecentLiquidsIntake;
}

- (void)setShouldGenerateRecentLiquidsIntake:(BOOL)a3
{
  self->_shouldGenerateRecentLiquidsIntake = a3;
}

- (BOOL)shouldGenerateLoudHeadphoneData
{
  return self->_shouldGenerateLoudHeadphoneData;
}

- (void)setShouldGenerateLoudHeadphoneData:(BOOL)a3
{
  self->_shouldGenerateLoudHeadphoneData = a3;
}

@end