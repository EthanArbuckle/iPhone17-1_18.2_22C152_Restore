@interface HKPopulationNormsAbstractViewModel
- (BOOL)isCurrentClassificationAvailable;
- (BOOL)shouldShowClassificationTitle;
- (HKHealthStore)healthStore;
- (HKPopulationNormsAbstractViewModel)initWithHealthStore:(id)a3;
- (NSNumber)cacheAgeInYears;
- (NSNumber)cacheBiologicalSexSegmentIndex;
- (NSNumber)cacheClassificationIndex;
- (NSNumber)cacheLatestSampleValue;
- (NSNumber)userHasDataPointAvailable;
- (OS_dispatch_queue)sampleQueryQueue;
- (double)maximumSampleValueQuantity;
- (double)minimumSampleValueQuantity;
- (id)ageBucketsTitle;
- (id)associatedSampleType;
- (id)chartTitle;
- (id)classificationIdentifierForIndex:(unint64_t)a3;
- (id)classificationIndexForSampleValue:(double)a3 age:(int64_t)a4 sex:(int64_t)a5;
- (id)currentAgeInYears;
- (id)currentDataForBiologicalSex;
- (id)currentLocalizedClassificationDescription;
- (id)currentLocalizedClassificationName;
- (id)currentLocalizedClassificationTitle;
- (id)footerText;
- (id)hk_UIAutomationIdentifier;
- (id)levelsTitle;
- (id)localizedBiologicalSexTitles;
- (id)localizedClassificationDescriptionForIndex:(unint64_t)a3;
- (id)localizedClassificationNameForIndex:(unint64_t)a3;
- (id)localizedClassificationTitleForIndex:(unint64_t)a3;
- (id)quantityUnitTitle;
- (id)seriesHighlightedColor;
- (id)userAgeBucketIndex;
- (id)userLatestSampleValue;
- (id)viewTitle;
- (int64_t)_biologicalSexForSexSegmentIndex:(unint64_t)a3;
- (int64_t)currentBiologicalSex;
- (unint64_t)_biologicalSexSegmentIndexForSex:(int64_t)a3;
- (unint64_t)classificationIndexForLevelIndex:(unint64_t)a3;
- (unint64_t)currentBiologicalSexSegmentIndex;
- (unint64_t)currentClassificationIndex;
- (unint64_t)maximumUserAgeBucketIndex;
- (unint64_t)numberOfBiologicalSexSegments;
- (unint64_t)numberOfClassifications;
- (void)_requireConcreteImplementationOfSelector:(SEL)a3;
- (void)clearUserCharacteristicCache;
- (void)currentAgeInYears;
- (void)currentBiologicalSexSegmentIndex;
- (void)prepareUserCharacteristicCacheWithHandler:(id)a3;
- (void)setBiologicalSexSegmentIndex:(unint64_t)a3;
- (void)setCacheAgeInYears:(id)a3;
- (void)setCacheBiologicalSexSegmentIndex:(id)a3;
- (void)setCacheClassificationIndex:(id)a3;
- (void)setCacheLatestSampleValue:(id)a3;
- (void)setClassificationIndex:(unint64_t)a3;
- (void)setUserHasDataPointAvailable:(id)a3;
- (void)userAgeBucketIndex;
@end

@implementation HKPopulationNormsAbstractViewModel

- (HKPopulationNormsAbstractViewModel)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKPopulationNormsAbstractViewModel;
  v6 = [(HKPopulationNormsAbstractViewModel *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    uint64_t v8 = dispatch_get_global_queue(21, 0);
    sampleQueryQueue = v7->_sampleQueryQueue;
    v7->_sampleQueryQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void)_requireConcreteImplementationOfSelector:(SEL)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3A8];
  NSStringFromSelector(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 raise:v5, @"-[%@ %@] not implemented", self, v6 format];
}

- (id)associatedSampleType
{
  return 0;
}

- (id)classificationIndexForSampleValue:(double)a3 age:(int64_t)a4 sex:(int64_t)a5
{
  return 0;
}

- (id)footerText
{
  return 0;
}

- (unint64_t)numberOfBiologicalSexSegments
{
  return 3;
}

- (id)localizedBiologicalSexTitles
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"BIOLOGICAL_SEX_FEMALE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-CardioFitness"];
  v4 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.HealthUI", v3);
  uint64_t v5 = [v4 localizedStringForKey:@"BIOLOGICAL_SEX_MALE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-CardioFitness"];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = [v6 localizedStringForKey:@"BIOLOGICAL_SEX_ALL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-CardioFitness"];
  v10[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  return v8;
}

- (id)currentLocalizedClassificationDescription
{
  unint64_t v3 = [(HKPopulationNormsAbstractViewModel *)self currentClassificationIndex];
  return [(HKPopulationNormsAbstractViewModel *)self localizedClassificationDescriptionForIndex:v3];
}

- (id)currentLocalizedClassificationTitle
{
  unint64_t v3 = [(HKPopulationNormsAbstractViewModel *)self currentClassificationIndex];
  return [(HKPopulationNormsAbstractViewModel *)self localizedClassificationTitleForIndex:v3];
}

- (id)currentLocalizedClassificationName
{
  unint64_t v3 = [(HKPopulationNormsAbstractViewModel *)self currentClassificationIndex];
  return [(HKPopulationNormsAbstractViewModel *)self localizedClassificationNameForIndex:v3];
}

- (int64_t)_biologicalSexForSexSegmentIndex:(unint64_t)a3
{
  int64_t v3 = 2;
  if (a3 != 1) {
    int64_t v3 = 3;
  }
  if (a3) {
    return v3;
  }
  else {
    return 1;
  }
}

- (unint64_t)_biologicalSexSegmentIndexForSex:(int64_t)a3
{
  unint64_t v3 = 1;
  if (a3 != 2) {
    unint64_t v3 = 2;
  }
  if (a3 == 1) {
    return 0;
  }
  else {
    return v3;
  }
}

- (int64_t)currentBiologicalSex
{
  unint64_t v3 = [(HKPopulationNormsAbstractViewModel *)self currentBiologicalSexSegmentIndex];
  return [(HKPopulationNormsAbstractViewModel *)self _biologicalSexForSexSegmentIndex:v3];
}

- (unint64_t)currentBiologicalSexSegmentIndex
{
  cacheBiologicalSexSegmentIndex = self->_cacheBiologicalSexSegmentIndex;
  if (!cacheBiologicalSexSegmentIndex)
  {
    healthStore = self->_healthStore;
    id v13 = 0;
    uint64_t v5 = [(HKHealthStore *)healthStore biologicalSexWithError:&v13];
    id v6 = v13;
    if (v5)
    {
      if ([v5 biologicalSex])
      {
        v7 = NSNumber;
        uint64_t v8 = [v5 biologicalSex];
LABEL_8:
        objc_msgSend(v7, "numberWithUnsignedInteger:", -[HKPopulationNormsAbstractViewModel _biologicalSexSegmentIndexForSex:](self, "_biologicalSexSegmentIndexForSex:", v8));
        v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        objc_super v11 = self->_cacheBiologicalSexSegmentIndex;
        self->_cacheBiologicalSexSegmentIndex = v10;

        cacheBiologicalSexSegmentIndex = self->_cacheBiologicalSexSegmentIndex;
        return [(NSNumber *)cacheBiologicalSexSegmentIndex unsignedIntegerValue];
      }
    }
    else
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR)) {
        [(HKPopulationNormsAbstractViewModel *)(uint64_t)v6 currentBiologicalSexSegmentIndex];
      }
    }
    uint64_t v8 = 0;
    v7 = NSNumber;
    goto LABEL_8;
  }
  return [(NSNumber *)cacheBiologicalSexSegmentIndex unsignedIntegerValue];
}

- (void)setBiologicalSexSegmentIndex:(unint64_t)a3
{
  if ([(HKPopulationNormsAbstractViewModel *)self numberOfBiologicalSexSegments] <= a3)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKPopulationNormsAbstractViewModel.m", 126, @"Invalid parameter not satisfying: %@", @"biologicalSexSegmentIndex >= 0 && biologicalSexSegmentIndex < [self numberOfBiologicalSexSegments]" object file lineNumber description];
  }
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  cacheBiologicalSexSegmentIndex = self->_cacheBiologicalSexSegmentIndex;
  self->_cacheBiologicalSexSegmentIndex = v6;
  MEMORY[0x1F41817F8](v6, cacheBiologicalSexSegmentIndex);
}

- (BOOL)isCurrentClassificationAvailable
{
  return self->_cacheClassificationIndex != 0;
}

- (unint64_t)currentClassificationIndex
{
  cacheClassificationIndex = self->_cacheClassificationIndex;
  if (!cacheClassificationIndex)
  {
    v4 = [(HKPopulationNormsAbstractViewModel *)self userLatestSampleValue];
    uint64_t v5 = [(HKPopulationNormsAbstractViewModel *)self currentAgeInYears];
    id v6 = (void *)v5;
    if (v4 && v5)
    {
      int64_t v7 = [(HKPopulationNormsAbstractViewModel *)self _biologicalSexForSexSegmentIndex:[(HKPopulationNormsAbstractViewModel *)self currentBiologicalSexSegmentIndex]];
      [v4 floatValue];
      -[HKPopulationNormsAbstractViewModel classificationIndexForSampleValue:age:sex:](self, "classificationIndexForSampleValue:age:sex:", [v6 integerValue], v7, v8);
      v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v10 = self->_cacheClassificationIndex;
      self->_cacheClassificationIndex = v9;
    }
    if (!self->_cacheClassificationIndex)
    {
      if ([(HKPopulationNormsAbstractViewModel *)self numberOfClassifications])
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", (-[HKPopulationNormsAbstractViewModel numberOfClassifications](self, "numberOfClassifications") - 1) >> 1);
        objc_super v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v11 = (NSNumber *)&unk_1F3C20788;
      }
      v12 = self->_cacheClassificationIndex;
      self->_cacheClassificationIndex = v11;
    }
    cacheClassificationIndex = self->_cacheClassificationIndex;
  }
  return [(NSNumber *)cacheClassificationIndex unsignedIntegerValue];
}

- (void)setClassificationIndex:(unint64_t)a3
{
  if ([(HKPopulationNormsAbstractViewModel *)self numberOfClassifications] <= a3)
  {
    float v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKPopulationNormsAbstractViewModel.m", 161, @"Invalid parameter not satisfying: %@", @"classificationIndex >= 0 && classificationIndex < [self numberOfClassifications]" object file lineNumber description];
  }
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  cacheClassificationIndex = self->_cacheClassificationIndex;
  self->_cacheClassificationIndex = v6;
  MEMORY[0x1F41817F8](v6, cacheClassificationIndex);
}

- (unint64_t)classificationIndexForLevelIndex:(unint64_t)a3
{
  return [(HKPopulationNormsAbstractViewModel *)self numberOfClassifications] + ~a3;
}

- (id)currentAgeInYears
{
  cacheAgeInYears = self->_cacheAgeInYears;
  if (!cacheAgeInYears)
  {
    healthStore = self->_healthStore;
    id v13 = 0;
    uint64_t v5 = [(HKHealthStore *)healthStore dateOfBirthComponentsWithError:&v13];
    id v6 = v13;
    if (v5)
    {
      int64_t v7 = NSNumber;
      float v8 = [MEMORY[0x1E4F1C9C8] date];
      objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v5, "hk_ageWithCurrentDate:", v8));
      v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v10 = self->_cacheAgeInYears;
      self->_cacheAgeInYears = v9;
    }
    else
    {
      _HKInitializeLogging();
      objc_super v11 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR)) {
        [(HKPopulationNormsAbstractViewModel *)(uint64_t)v6 currentAgeInYears];
      }
    }

    cacheAgeInYears = self->_cacheAgeInYears;
  }
  return cacheAgeInYears;
}

- (id)userAgeBucketIndex
{
  unint64_t v3 = *MEMORY[0x1E4F2BCF8];
  v4 = [(HKPopulationNormsAbstractViewModel *)self currentAgeInYears];
  unint64_t v5 = [v4 unsignedIntegerValue];

  if (v3 <= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v3;
  }
  int64_t v7 = [(HKPopulationNormsAbstractViewModel *)self currentDataForBiologicalSex];
  float v8 = [v7 allKeys];
  v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_25];

  if ([v9 count])
  {
    uint64_t v10 = 0;
    while (1)
    {
      objc_super v11 = [v9 objectAtIndexedSubscript:v10];
      unint64_t v12 = [v11 rangeValue];
      unint64_t v14 = v13;

      if (v6 >= v12 && v6 - v12 < v14) {
        break;
      }
      if (++v10 >= (unint64_t)[v9 count]) {
        goto LABEL_9;
      }
    }
    v16 = [NSNumber numberWithInteger:v10];
  }
  else
  {
LABEL_9:
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR)) {
      -[HKPopulationNormsAbstractViewModel userAgeBucketIndex](v15);
    }
    v16 = 0;
  }

  return v16;
}

- (id)userLatestSampleValue
{
  cacheLatestSampleValue = self->_cacheLatestSampleValue;
  if (!cacheLatestSampleValue)
  {
    if (self->_userHasDataPointAvailable)
    {
      cacheLatestSampleValue = 0;
    }
    else
    {
      self->_userHasDataPointAvailable = (NSNumber *)&unk_1F3C20788;

      dispatch_assert_queue_V2((dispatch_queue_t)self->_sampleQueryQueue);
      dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
      unint64_t v5 = [(HKPopulationNormsAbstractViewModel *)self associatedSampleType];
      unint64_t v6 = (void *)MEMORY[0x1E4F2B0B8];
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      unint64_t v12 = __59__HKPopulationNormsAbstractViewModel_userLatestSampleValue__block_invoke;
      unint64_t v13 = &unk_1E6D52F90;
      unint64_t v14 = self;
      dispatch_semaphore_t v15 = v4;
      int64_t v7 = v4;
      float v8 = [v6 queryForMostRecentSampleOfType:v5 predicate:0 completion:&v10];
      -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v8, v10, v11, v12, v13, v14);
      dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

      cacheLatestSampleValue = self->_cacheLatestSampleValue;
    }
  }
  return cacheLatestSampleValue;
}

void __59__HKPopulationNormsAbstractViewModel_userLatestSampleValue__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [NSNumber numberWithInt:v5 != 0];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 56);
  *(void *)(v8 + 56) = v7;

  if ([*(id *)(*(void *)(a1 + 32) + 56) BOOLValue])
  {
    uint64_t v10 = NSNumber;
    uint64_t v11 = [v5 quantity];
    [v11 _value];
    uint64_t v12 = objc_msgSend(v10, "numberWithDouble:");
    uint64_t v13 = *(void *)(a1 + 32);
    unint64_t v14 = *(void **)(v13 + 48);
    *(void *)(v13 + 48) = v12;
  }
  else
  {
    _HKInitializeLogging();
    dispatch_semaphore_t v15 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v6;
      _os_log_impl(&dword_1E0B26000, v15, OS_LOG_TYPE_DEFAULT, "Failed to fetch latest VO2 max sample with error: %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)clearUserCharacteristicCache
{
  cacheBiologicalSexSegmentIndex = self->_cacheBiologicalSexSegmentIndex;
  self->_cacheBiologicalSexSegmentIndex = 0;

  cacheClassificationIndex = self->_cacheClassificationIndex;
  self->_cacheClassificationIndex = 0;

  cacheAgeInYears = self->_cacheAgeInYears;
  self->_cacheAgeInYears = 0;

  cacheLatestSampleValue = self->_cacheLatestSampleValue;
  self->_cacheLatestSampleValue = 0;

  userHasDataPointAvailable = self->_userHasDataPointAvailable;
  self->_userHasDataPointAvailable = 0;
}

- (void)prepareUserCharacteristicCacheWithHandler:(id)a3
{
  id v4 = a3;
  sampleQueryQueue = self->_sampleQueryQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__HKPopulationNormsAbstractViewModel_prepareUserCharacteristicCacheWithHandler___block_invoke;
  v7[3] = &unk_1E6D51728;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sampleQueryQueue, v7);
}

void __80__HKPopulationNormsAbstractViewModel_prepareUserCharacteristicCacheWithHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[6]) {
    id v3 = (id)[v2 userLatestSampleValue];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__HKPopulationNormsAbstractViewModel_prepareUserCharacteristicCacheWithHandler___block_invoke_2;
  block[3] = &unk_1E6D52FB8;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __80__HKPopulationNormsAbstractViewModel_prepareUserCharacteristicCacheWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)viewTitle
{
  return &stru_1F3B9CF20;
}

- (id)chartTitle
{
  return &stru_1F3B9CF20;
}

- (id)levelsTitle
{
  return &stru_1F3B9CF20;
}

- (id)quantityUnitTitle
{
  return &stru_1F3B9CF20;
}

- (id)ageBucketsTitle
{
  return &stru_1F3B9CF20;
}

- (id)seriesHighlightedColor
{
  return 0;
}

- (unint64_t)numberOfClassifications
{
  return 0;
}

- (BOOL)shouldShowClassificationTitle
{
  return 0;
}

- (id)localizedClassificationTitleForIndex:(unint64_t)a3
{
  return &stru_1F3B9CF20;
}

- (id)classificationIdentifierForIndex:(unint64_t)a3
{
  return &stru_1F3B9CF20;
}

- (id)localizedClassificationNameForIndex:(unint64_t)a3
{
  return &stru_1F3B9CF20;
}

- (id)localizedClassificationDescriptionForIndex:(unint64_t)a3
{
  return &stru_1F3B9CF20;
}

- (id)currentDataForBiologicalSex
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (unint64_t)maximumUserAgeBucketIndex
{
  return 0;
}

- (double)maximumSampleValueQuantity
{
  return 0.0;
}

- (double)minimumSampleValueQuantity
{
  return 0.0;
}

- (id)hk_UIAutomationIdentifier
{
  return &stru_1F3B9CF20;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (OS_dispatch_queue)sampleQueryQueue
{
  return self->_sampleQueryQueue;
}

- (NSNumber)cacheBiologicalSexSegmentIndex
{
  return self->_cacheBiologicalSexSegmentIndex;
}

- (void)setCacheBiologicalSexSegmentIndex:(id)a3
{
}

- (NSNumber)cacheClassificationIndex
{
  return self->_cacheClassificationIndex;
}

- (void)setCacheClassificationIndex:(id)a3
{
}

- (NSNumber)cacheAgeInYears
{
  return self->_cacheAgeInYears;
}

- (void)setCacheAgeInYears:(id)a3
{
}

- (NSNumber)cacheLatestSampleValue
{
  return self->_cacheLatestSampleValue;
}

- (void)setCacheLatestSampleValue:(id)a3
{
}

- (NSNumber)userHasDataPointAvailable
{
  return self->_userHasDataPointAvailable;
}

- (void)setUserHasDataPointAvailable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userHasDataPointAvailable, 0);
  objc_storeStrong((id *)&self->_cacheLatestSampleValue, 0);
  objc_storeStrong((id *)&self->_cacheAgeInYears, 0);
  objc_storeStrong((id *)&self->_cacheClassificationIndex, 0);
  objc_storeStrong((id *)&self->_cacheBiologicalSexSegmentIndex, 0);
  objc_storeStrong((id *)&self->_sampleQueryQueue, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)currentBiologicalSexSegmentIndex
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Unable to retrieve biological sex: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)currentAgeInYears
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Unable to retrieve date of birth: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)userAgeBucketIndex
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "Unable to determine user age bucket index", v1, 2u);
}

@end