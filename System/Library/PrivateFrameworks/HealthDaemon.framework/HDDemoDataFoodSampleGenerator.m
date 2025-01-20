@interface HDDemoDataFoodSampleGenerator
+ (BOOL)supportsSecureCoding;
- (BOOL)_isDemoPersonConsumingCaffeine:(id)a3 atTime:(double)a4;
- (HDDemoDataFoodSampleGenerator)init;
- (HDDemoDataFoodSampleGenerator)initWithCoder:(id)a3;
- (double)_computeMealTimeForDemoPerson:(id)a3 fromTime:(double)a4 mealTimeType:(int64_t)a5 timeMean:(double)a6 stdDev:(double)a7;
- (double)_computeNutrientForDemoPerson:(void *)a3 atTime:(void *)a4 mealItem:(double)a5 quantityType:;
- (double)_nextMealTimeForDemoPerson:(double)a3 atTime:;
- (double)lastMealTime;
- (double)nextBreakfastTime;
- (double)nextDinnerTime;
- (double)nextLunchTime;
- (double)nextSnackTime;
- (id)_lastMeal;
- (uint64_t)mealTypeForTime:(uint64_t)result;
- (void)_generateRandomLastMeal;
- (void)encodeWithCoder:(id)a3;
- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)setupWithDemoDataGenerator:(id)a3;
@end

@implementation HDDemoDataFoodSampleGenerator

- (HDDemoDataFoodSampleGenerator)init
{
  v7.receiver = self;
  v7.super_class = (Class)HDDemoDataFoodSampleGenerator;
  v2 = [(HDDemoDataBaseSampleGenerator *)&v7 init];
  v3 = v2;
  if (v2)
  {
    foodDatabase = v2->_foodDatabase;
    v2->_foodDatabase = 0;

    v3->_nextMealTime = 0.0;
    v3->_nextBreakfastTime = 0.0;
    v3->_nextLunchTime = 0.0;
    v3->_nextSnackTime = 0.0;
    v3->_nextDinnerTime = 0.0;
    v3->_lastMealTime = 0.0;
    lastMeal = v3->_lastMeal;
    v3->_lastMeal = 0;

    v3->_nextBloodGlucoseSampleTime = 0.0;
    v3->_nextBloodGlucoseFingerStickSampleTime = 0.0;
    v3->_nextBloodGlucoseMealTime = 0.0;
    v3->_lastBloodGlucose = 100.0;
    v3->_nextInsulinPumpBasalSampleTime = 0.0;
    v3->_carbohydratesLeftToDigest = 0.0;
    v3->_bloodGlucoseCarbohydrateGlycemicRate = 0.0;
    v3->_bloodGlucoseDecreaseRateDueToInsulin = 0.0;
    v3->_nextWaterConsumedSampleTime = 0.0;
  }
  return v3;
}

- (HDDemoDataFoodSampleGenerator)initWithCoder:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HDDemoDataFoodSampleGenerator;
  v5 = [(HDDemoDataBaseSampleGenerator *)&v27 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorNextMealTimeKey"];
    v5->_nextMealTime = v6;
    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorNextBreakfastTimeKey"];
    v5->_nextBreakfastTime = v7;
    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorNextLunchTimeKey"];
    v5->_nextLunchTime = v8;
    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorNextSnackTimeKey"];
    v5->_nextSnackTime = v9;
    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorNextDinnerTimeKey"];
    v5->_nextDinnerTime = v10;
    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorLastMealTimeKey"];
    v5->_lastMealTime = v11;
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"HDDemoDataFoodSampleGeneratorLastMealKey"];
    lastMeal = v5->_lastMeal;
    v5->_lastMeal = (NSArray *)v15;

    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorNextBloodGlucoseSampleTimeKey"];
    v5->_nextBloodGlucoseSampleTime = v17;
    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorNextBloodGlucoseFingerStickSampleTimeKey"];
    v5->_nextBloodGlucoseFingerStickSampleTime = v18;
    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorNextBloodGlucoseMealTimeKey"];
    v5->_nextBloodGlucoseMealTime = v19;
    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorLastBloodGlucoseKey"];
    v5->_lastBloodGlucose = v20;
    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorNextInsulinPumpBasalSampleKey"];
    v5->_nextInsulinPumpBasalSampleTime = v21;
    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorCarbohydratesLeftToDigestKey"];
    v5->_carbohydratesLeftToDigest = v22;
    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorBloodGlucoseCarbohydrateGlycemicRateKey"];
    v5->_bloodGlucoseCarbohydrateGlycemicRate = v23;
    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorBloodGlucoseDecreaseRateDueToInsulinKey"];
    v5->_bloodGlucoseDecreaseRateDueToInsulin = v24;
    [v4 decodeDoubleForKey:@"HDDemoDataFoodSampleGeneratorNextWaterConsumeSampleTimeKey"];
    v5->_nextWaterConsumedSampleTime = v25;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataFoodSampleGenerator;
  id v4 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HDDemoDataFoodSampleGeneratorNextMealTimeKey", self->_nextMealTime, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"HDDemoDataFoodSampleGeneratorNextBreakfastTimeKey" forKey:self->_nextBreakfastTime];
  [v4 encodeDouble:@"HDDemoDataFoodSampleGeneratorNextLunchTimeKey" forKey:self->_nextLunchTime];
  [v4 encodeDouble:@"HDDemoDataFoodSampleGeneratorNextSnackTimeKey" forKey:self->_nextSnackTime];
  [v4 encodeDouble:@"HDDemoDataFoodSampleGeneratorNextDinnerTimeKey" forKey:self->_nextDinnerTime];
  [v4 encodeDouble:@"HDDemoDataFoodSampleGeneratorLastMealTimeKey" forKey:self->_lastMealTime];
  [v4 encodeObject:self->_lastMeal forKey:@"HDDemoDataFoodSampleGeneratorLastMealKey"];
  [v4 encodeDouble:@"HDDemoDataFoodSampleGeneratorNextBloodGlucoseSampleTimeKey" forKey:self->_nextBloodGlucoseSampleTime];
  [v4 encodeDouble:@"HDDemoDataFoodSampleGeneratorNextBloodGlucoseFingerStickSampleTimeKey" forKey:self->_nextBloodGlucoseFingerStickSampleTime];
  [v4 encodeDouble:@"HDDemoDataFoodSampleGeneratorNextBloodGlucoseMealTimeKey" forKey:self->_nextBloodGlucoseMealTime];
  [v4 encodeDouble:@"HDDemoDataFoodSampleGeneratorLastBloodGlucoseKey" forKey:self->_lastBloodGlucose];
  [v4 encodeDouble:@"HDDemoDataFoodSampleGeneratorNextInsulinPumpBasalSampleKey" forKey:self->_nextInsulinPumpBasalSampleTime];
  [v4 encodeDouble:@"HDDemoDataFoodSampleGeneratorCarbohydratesLeftToDigestKey" forKey:self->_carbohydratesLeftToDigest];
  [v4 encodeDouble:@"HDDemoDataFoodSampleGeneratorBloodGlucoseCarbohydrateGlycemicRateKey" forKey:self->_bloodGlucoseCarbohydrateGlycemicRate];
  [v4 encodeDouble:@"HDDemoDataFoodSampleGeneratorBloodGlucoseDecreaseRateDueToInsulinKey" forKey:self->_bloodGlucoseDecreaseRateDueToInsulin];
  [v4 encodeDouble:@"HDDemoDataFoodSampleGeneratorNextWaterConsumeSampleTimeKey" forKey:self->_nextWaterConsumedSampleTime];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HDDemoDataFoodSampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v19 setupWithDemoDataGenerator:v4];
  objc_super v5 = objc_alloc_init(HDDemoDataFoodDatabase);
  foodDatabase = self->_foodDatabase;
  self->_foodDatabase = v5;

  if (![(HDDemoDataBaseSampleGenerator *)self createdFromNSKeyedUnarchiver])
  {
    double v7 = [v4 demoPerson];
    [v7 breakfastTime];
    self->_nextMealTime = v8;

    double v9 = [v4 demoPerson];
    [v9 breakfastTime];
    self->_nextBreakfastTime = v10;

    double v11 = [v4 demoPerson];
    [v11 lunchTime];
    self->_nextLunchTime = v12;

    v13 = [v4 demoPerson];
    [v13 snackTime];
    self->_nextSnackTime = v14;

    uint64_t v15 = [v4 demoPerson];
    [v15 dinnerTime];
    self->_nextDinnerTime = v16;

    double v17 = [v4 demoPerson];
    [v17 breakfastTime];
    self->_nextBloodGlucoseMealTime = v18;
  }
}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)HDDemoDataFoodSampleGenerator;
  id v8 = a5;
  [(HDDemoDataBaseSampleGenerator *)&v27 generateFirstRunObjectsForDemoPerson:a3 firstDate:a4 objectCollection:v8];
  id v9 = v8;
  if (self)
  {
    double v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    double v11 = +[HDDemoDataGeneratorConfiguration configurationFromDefaults:v10];

    if ([v11 shouldGenerateRecentLiquidsIntake])
    {
      double v25 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A798]];
      v26 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A678]];
      double v12 = (void *)MEMORY[0x1E4F2B370];
      v13 = [MEMORY[0x1E4F2B618] fluidOunceUSUnit];
      double v14 = [v12 quantityWithUnit:v13 doubleValue:8.0];

      uint64_t v15 = (void *)MEMORY[0x1E4F2B370];
      double v16 = [MEMORY[0x1E4F2B618] gramUnit];
      double v17 = [v15 quantityWithUnit:v16 doubleValue:0.12];

      id v18 = objc_alloc(MEMORY[0x1E4F1C9A8]);
      objc_super v19 = (void *)[v18 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
      double v20 = [MEMORY[0x1E4F1C9C8] date];
      double v21 = [v19 dateBySettingHour:8 minute:0 second:0 ofDate:v20 options:0];

      double v22 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v25 quantity:v14 startDate:v21 endDate:v21];
      double v23 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v26 quantity:v17 startDate:v21 endDate:v21];
      v28[0] = v22;
      v28[1] = v23;
      double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
      [v9 addObjectsFromPhone:v24];
    }
  }
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  uint64_t v193 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  double v14 = self;
  id v15 = v13;
  v179.receiver = v14;
  v179.super_class = (Class)HDDemoDataFoodSampleGenerator;
  id v164 = a7;
  v165 = v15;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v179, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v12, v15, a5, a5);
  if (qword_1EBA18B00 != -1) {
    dispatch_once(&qword_1EBA18B00, &__block_literal_global_26);
  }
  v166 = (double *)v14;
  v158 = v12;
  if (!v14)
  {
    id v156 = v12;
    double v23 = 0.0;
    goto LABEL_8;
  }
  id v16 = v12;
  double v17 = [(HDDemoDataBaseSampleGenerator *)v14 demoDataGenerator];
  id v18 = [v17 bodySampleGenerator];
  [v18 lastWeightInKg];
  double v20 = v19 * 0.55;

  [v16 insulinProduction];
  double v22 = v21;

  double v23 = v20 * fmax(1.0 - v22, 0.0);
  uint64_t v24 = -[HDDemoDataFoodSampleGenerator mealTypeForTime:]((uint64_t)v14, a5);
  id v25 = v16;
  uint64_t v157 = v24;
  if (v14->_nextDinnerTime <= a5)
  {
    objc_super v27 = v14->_foodDatabase;
    v28 = [(HDDemoDataFoodDatabase *)v27 randomFoodForType:4];

    v29 = v14->_foodDatabase;
    v30 = [(HDDemoDataFoodDatabase *)v29 randomFoodForType:5];

    v14->_nextDinnerTime = -[HDDemoDataFoodSampleGenerator _nextMealTimeForDemoPerson:atTime:]((double *)v14, v25, a5);
    v14->_nextMealTime = v14->_nextBreakfastTime;
    v188[0] = v28;
    v31 = (void **)v188;
  }
  else if (v14->_nextSnackTime <= a5)
  {
    v32 = v14->_foodDatabase;
    v28 = [(HDDemoDataFoodDatabase *)v32 randomFoodForType:3];

    v33 = v14->_foodDatabase;
    v30 = [(HDDemoDataFoodDatabase *)v33 randomFoodForType:5];

    [v28 recommendedNumServings];
    [v28 setRecommendedNumServings:v34 * 0.5];
    v14->_nextSnackTime = -[HDDemoDataFoodSampleGenerator _nextMealTimeForDemoPerson:atTime:]((double *)v14, v25, a5);
    v14->_nextMealTime = v14->_nextDinnerTime;
    *(void *)&long long v189 = v28;
    v31 = (void **)&v189;
  }
  else if (v14->_nextLunchTime <= a5)
  {
    v35 = v14->_foodDatabase;
    v28 = [(HDDemoDataFoodDatabase *)v35 randomFoodForType:2];

    v36 = v14->_foodDatabase;
    v30 = [(HDDemoDataFoodDatabase *)v36 randomFoodForType:5];

    v14->_nextLunchTime = -[HDDemoDataFoodSampleGenerator _nextMealTimeForDemoPerson:atTime:]((double *)v14, v25, a5);
    v14->_nextMealTime = v14->_nextSnackTime;
    v187 = v28;
    v31 = &v187;
  }
  else
  {
    if (v14->_nextBreakfastTime > a5)
    {
LABEL_8:
      v26 = v158;

      id obj = 0;
      goto LABEL_60;
    }
    v37 = v14->_foodDatabase;
    v28 = [(HDDemoDataFoodDatabase *)v37 randomFoodForType:1];

    v38 = v14->_foodDatabase;
    v30 = [(HDDemoDataFoodDatabase *)v38 randomFoodForType:5];

    v14->_nextBreakfastTime = -[HDDemoDataFoodSampleGenerator _nextMealTimeForDemoPerson:atTime:]((double *)v14, v25, a5);
    v14->_nextMealTime = v14->_nextLunchTime;
    v186 = v28;
    v31 = &v186;
  }
  v31[1] = v30;
  v39 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");

  if (!v39)
  {
    id obj = 0;
    goto LABEL_59;
  }
  objc_storeStrong((id *)&v14->_lastMeal, v39);
  long long v177 = 0u;
  long long v178 = 0u;
  long long v176 = 0u;
  long long v175 = 0u;
  id obj = v39;
  uint64_t v162 = [obj countByEnumeratingWithState:&v175 objects:v185 count:16];
  if (v162)
  {
    uint64_t v161 = *(void *)v176;
    uint64_t v159 = *MEMORY[0x1E4F2A128];
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v176 != v161) {
          objc_enumerationMutation(obj);
        }
        uint64_t v163 = v40;
        v41 = *(void **)(*((void *)&v175 + 1) + 8 * v40);
        id v167 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v171 = 0u;
        long long v172 = 0u;
        long long v173 = 0u;
        long long v174 = 0u;
        v42 = [v41 nutritionFacts];
        uint64_t v43 = [v42 countByEnumeratingWithState:&v171 objects:v184 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v172;
          do
          {
            uint64_t v46 = 0;
            do
            {
              if (*(void *)v172 != v45) {
                objc_enumerationMutation(v42);
              }
              v47 = *(void **)(*((void *)&v171 + 1) + 8 * v46);
              if ([v25 nutritionTrackingType] == 2) {
                goto LABEL_28;
              }
              id v48 = v47;
              if (qword_1EBA18B10 != -1) {
                dispatch_once(&qword_1EBA18B10, &__block_literal_global_361_0);
              }
              int v49 = [(id)qword_1EBA18B08 containsObject:v48];

              if (v49)
              {
LABEL_28:
                double v50 = -[HDDemoDataFoodSampleGenerator _computeNutrientForDemoPerson:atTime:mealItem:quantityType:]((id *)&v14->super.super.isa, v25, v41, v47, a5)* 1.3;
                if (v50 != 0.0 && v50 != -2147483650.0)
                {
                  v52 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:v47];
                  v53 = [(HDDemoDataFoodDatabase *)v14->_foodDatabase canonicalDietaryUnitForQuantityTypeIdentifier:v47];
                  v54 = [MEMORY[0x1E4F2B370] quantityWithUnit:v53 doubleValue:v50];
                  v55 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v52 quantity:v54 startDate:v165 endDate:v165];
                  [v164 addObjectFromPhone:v55];
                  [v167 addObject:v55];

                  double v14 = (HDDemoDataFoodSampleGenerator *)v166;
                }
              }
              ++v46;
            }
            while (v44 != v46);
            uint64_t v44 = [v42 countByEnumeratingWithState:&v171 objects:v184 count:16];
          }
          while (v44);
        }

        if ([v167 count])
        {
          uint64_t v182 = v159;
          v56 = [v41 brandName];
          v183 = v56;
          v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v183 forKeys:&v182 count:1];

          v58 = [MEMORY[0x1E4F2AE50] correlationWithType:_MergedGlobals_9 startDate:v165 endDate:v165 objects:v167 metadata:v57];
          [v164 addObjectFromPhone:v58];

          double v14 = (HDDemoDataFoodSampleGenerator *)v166;
        }

        uint64_t v40 = v163 + 1;
      }
      while (v163 + 1 != v162);
      uint64_t v162 = [obj countByEnumeratingWithState:&v175 objects:v185 count:16];
    }
    while (v162);
  }
  v59 = obj;

  if ((unint64_t)(v157 - 2) < 3) {
    goto LABEL_47;
  }
  if (v157 != 1)
  {
LABEL_59:
    v26 = v158;
    goto LABEL_60;
  }
  v60 = (void *)qword_1EBA18AF0;
  id v61 = v25;
  id v62 = v60;
  id v63 = v165;
  if (v23 == 0.0 || [v61 insulinTherapy])
  {
    v64 = 0;
  }
  else
  {
    v151 = (void *)MEMORY[0x1E4F2B370];
    v152 = [MEMORY[0x1E4F2B618] internationalUnit];
    v153 = [v151 quantityWithUnit:v152 doubleValue:floor(v23 * 0.5)];

    v154 = (void *)MEMORY[0x1E4F2B388];
    *(void *)&long long v189 = *MEMORY[0x1E4F2A180];
    v188[0] = &unk_1F17EB028;
    v155 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v188 forKeys:&v189 count:1];
    v64 = [v154 quantitySampleWithType:v62 quantity:v153 startDate:v63 endDate:v63 metadata:v155];

    double v14 = (HDDemoDataFoodSampleGenerator *)v166;
  }

  if (v64) {
    [v164 addObjectFromPhone:v64];
  }

  v59 = obj;
LABEL_47:
  id v65 = v59;
  id obj = v65;
  if (v23 == 0.0) {
    goto LABEL_56;
  }
  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  uint64_t v66 = [v65 countByEnumeratingWithState:&v189 objects:v188 count:16];
  id v65 = obj;
  if (!v66) {
    goto LABEL_56;
  }
  uint64_t v67 = *(void *)v190;
  uint64_t v68 = *MEMORY[0x1E4F2A688];
  double v69 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v66; ++i)
    {
      if (*(void *)v190 != v67) {
        objc_enumerationMutation(obj);
      }
      v71 = [*(id *)(*((void *)&v189 + 1) + 8 * i) nutritionFacts];
      v72 = [v71 objectForKeyedSubscript:v68];
      [v72 doubleValue];
      double v69 = v69 + v73;
    }
    uint64_t v66 = [obj countByEnumeratingWithState:&v189 objects:v188 count:16];
  }
  while (v66);
  double v14 = (HDDemoDataFoodSampleGenerator *)v166;
  id v65 = obj;
  if (v69 == 0.0)
  {
LABEL_56:

    v74 = 0;
  }
  else
  {
    v145 = (void *)MEMORY[0x1E4F2B370];
    v146 = [MEMORY[0x1E4F2B618] internationalUnit];
    v74 = [v145 quantityWithUnit:v146 doubleValue:floor(v69 / (500.0 / v23))];

    if (v74)
    {
      v147 = (void *)MEMORY[0x1E4F2B388];
      uint64_t v148 = qword_1EBA18AF0;
      uint64_t v180 = *MEMORY[0x1E4F2A180];
      v181 = &unk_1F17EB010;
      v149 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v181 forKeys:&v180 count:1];
      v150 = [v147 quantitySampleWithType:v148 quantity:v74 startDate:v165 endDate:v165 metadata:v149];

      [v164 addObjectFromPhone:v150];
    }
    double v14 = (HDDemoDataFoodSampleGenerator *)v166;
  }
  v26 = v158;

LABEL_60:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __107__HDDemoDataFoodSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke_355;
  aBlock[3] = &unk_1E62F5F68;
  aBlock[4] = v14;
  id v75 = v26;
  id v169 = v75;
  id v76 = v164;
  id v170 = v76;
  v77 = (void (**)(void, double))_Block_copy(aBlock);
  if ([v75 useContinuousGlucoseMonitoring])
  {
    for (; a4 <= a5; a4 = a4 + v78)
    {
      v77[2](v77, a4);
      [v75 continuousGlucoseMonitoringSampleFrequency];
    }
  }
  else
  {
    v77[2](v77, a5);
  }
  v79 = (void *)qword_1EBA18AF0;
  id v80 = v75;
  id v81 = v79;
  id v82 = v165;
  v83 = 0;
  if (v166 && v23 != 0.0)
  {
    if ([v80 insulinTherapy] == 1 && v166[11] <= a5)
    {
      [v80 timeIncrement];
      v166[11] = v84 + a5;
      [v80 timeIncrement];
      double v86 = floor(v23 * 0.5 * v85 * 40.0) / 40.0;
      v87 = (void *)MEMORY[0x1E4F2B370];
      v88 = [MEMORY[0x1E4F2B618] internationalUnit];
      v89 = [v87 quantityWithUnit:v88 doubleValue:v86];

      [v80 timeIncrement];
      v91 = [v82 dateByAddingTimeInterval:v90 * -86400.0];
      v92 = (void *)MEMORY[0x1E4F2B388];
      *(void *)&long long v189 = *MEMORY[0x1E4F2A180];
      v188[0] = &unk_1F17EB028;
      v93 = (void *)MEMORY[0x1E4F1C9E8];
      id v94 = v82;
      v95 = [v93 dictionaryWithObjects:v188 forKeys:&v189 count:1];
      v83 = [v92 quantitySampleWithType:v81 quantity:v89 startDate:v91 endDate:v94 metadata:v95];
    }
    else
    {
      v83 = 0;
    }
  }

  if (v83) {
    [v76 addObjectFromPhone:v83];
  }
  id v96 = v80;
  v97 = v96;
  if (!v166) {
    goto LABEL_76;
  }
  if (v166[15] > a5) {
    goto LABEL_76;
  }
  [v96 waterConsumedSampleFrequency];
  v166[15] = v98 + a5;
  v99 = [v166 demoDataGenerator];
  v100 = [v99 sleepSampleGenerator];
  char v101 = [v100 isDemoPersonSleeping:v97 atTime:a5];

  if (v101)
  {
LABEL_76:
    v102 = 0;
    v103 = v97;
LABEL_77:

    goto LABEL_78;
  }
  v104 = [v166 demoDataGenerator];
  v105 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  char v106 = [v104 isDemoDataTimeInWeekend:v105 calendar:a5];

  if (v106) {
    [v97 weekendSleepParameters];
  }
  else {
  v107 = [v97 weekdaySleepParameters];
  }
  v108 = [v166 demoDataGenerator];
  v109 = [v108 sleepSampleGenerator];
  [v107 bedtime];
  double v111 = v110;
  [v97 bedtimeNoiseStdDev];
  [v109 computeSleepTimeFromCurrentTime:a5 mean:v111 stdDev:v112];
  double v114 = v113;

  v115 = [v166 demoDataGenerator];
  v116 = [v115 sleepSampleGenerator];
  [v107 wakeUpTime];
  double v118 = v117;
  [v97 wakeUpTimeNoiseStdDev];
  [v116 computeSleepTimeFromCurrentTime:a5 mean:v118 stdDev:v119];
  double v121 = v120;

  [v97 waterConsumedSampleFrequency];
  uint64_t v123 = (uint64_t)((v114 - v121) / v122);
  [v97 waterConsumedDailyMean];
  double v125 = v124;
  [v97 waterConsumedIntervalMean];
  double v127 = (double)((uint64_t)(v125 / v126) / v123);
  v128 = [v166 demoDataGenerator];
  v129 = [v128 statisticsSampleGenerator];
  [v129 pseudoRandomDoubleFromTime:a5];
  double v131 = v130;

  if (v131 >= v127)
  {
    v102 = 0;
  }
  else
  {
    [v97 waterConsumedIntervalMean];
    double v133 = v132;
    v134 = [v166 demoDataGenerator];
    v135 = [v134 statisticsSampleGenerator];
    [v97 waterConsumedIntervalStdDev];
    [v135 computeNoiseFromTime:a5 stdDev:v136];
    double v138 = v133 + v137;

    uint64_t v139 = 100 * (uint64_t)(v138 / 100.0);
    if (v139 < 0) {
      uint64_t v139 = -100 * (uint64_t)(v138 / 100.0);
    }
    double v140 = (double)v139;
    if ((double)v139 < 200.0) {
      double v140 = 200.0;
    }
    v102 = [NSNumber numberWithDouble:v140];
  }

  if (v102)
  {
    v141 = (void *)MEMORY[0x1E4F2B370];
    uint64_t v142 = qword_1EBA18AE0;
    [v102 doubleValue];
    v103 = [v141 quantityWithUnit:v142 doubleValue:v143 / 1000.0];
    v144 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1EBA18AF8 quantity:v103 startDate:v82 endDate:v82];
    [v76 addObjectFromPhone:v144];

    goto LABEL_77;
  }
LABEL_78:
}

void __107__HDDemoDataFoodSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F2AE60] correlationTypeForIdentifier:*MEMORY[0x1E4F29940]];
  v1 = (void *)_MergedGlobals_9;
  _MergedGlobals_9 = v0;

  uint64_t v2 = [MEMORY[0x1E4F2B618] unitFromString:@"mg/dL"];
  v3 = (void *)qword_1EBA18AD8;
  qword_1EBA18AD8 = v2;

  uint64_t v4 = [MEMORY[0x1E4F2B618] literUnit];
  objc_super v5 = (void *)qword_1EBA18AE0;
  qword_1EBA18AE0 = v4;

  uint64_t v6 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A610]];
  double v7 = (void *)qword_1EBA18AE8;
  qword_1EBA18AE8 = v6;

  uint64_t v8 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A848]];
  id v9 = (void *)qword_1EBA18AF0;
  qword_1EBA18AF0 = v8;

  uint64_t v10 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A798]];
  double v11 = (void *)qword_1EBA18AF8;
  qword_1EBA18AF8 = v10;
}

- (uint64_t)mealTypeForTime:(uint64_t)result
{
  if (result)
  {
    if (*(double *)(result + 152) <= a2)
    {
      return 4;
    }
    else if (*(double *)(result + 144) <= a2)
    {
      return 3;
    }
    else if (*(double *)(result + 136) <= a2)
    {
      return 2;
    }
    else if (*(double *)(result + 128) <= a2)
    {
      return 1;
    }
    else
    {
      return 5;
    }
  }
  return result;
}

- (double)_computeNutrientForDemoPerson:(void *)a3 atTime:(void *)a4 mealItem:(double)a5 quantityType:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  double v12 = 0.0;
  if (a1)
  {
    double v13 = a5 - (double)(uint64_t)a5;
    double v14 = 1.0;
    if ([v9 biologicalSex] == 2) {
      double v15 = 1.2;
    }
    else {
      double v15 = 1.0;
    }
    [v9 numCupsOfCoffeeDailyMean];
    double v17 = v16;
    id v18 = [a1 demoDataGenerator];
    double v19 = [v18 statisticsSampleGenerator];
    [v9 numCupsOfCoffeeStdDev];
    [v19 computeNoiseFromTime:a5 stdDev:v20];
    double v22 = v21;

    [v9 dinnerTime];
    if (v13 >= v23)
    {
      uint64_t v27 = 4;
    }
    else
    {
      [v9 snackTime];
      if (v13 >= v24)
      {
        double v14 = 0.5;
        uint64_t v27 = 3;
      }
      else
      {
        [v9 lunchTime];
        if (v13 >= v25)
        {
          uint64_t v27 = 2;
        }
        else
        {
          [v9 breakfastTime];
          if (v13 < v26) {
            goto LABEL_24;
          }
          uint64_t v27 = 1;
        }
      }
    }
    v28 = [v10 nutritionFacts];
    v29 = [v28 objectForKeyedSubscript:v11];
    [v29 doubleValue];
    double v31 = v14 * v30;
    [v10 recommendedNumServings];
    double v33 = v31 * v32;

    if (v33 != 0.0)
    {
      if (v27 <= (uint64_t)(v17 + v22) && [v10 foodType] != 5)
      {
        double v34 = [a1[4] coffee];
        v35 = [v34 nutritionFacts];
        v36 = [v35 objectForKeyedSubscript:v11];
        [v36 doubleValue];
        double v33 = v33 + v37;
      }
      [v9 weightLossStartDay];
      if (v38 > a5)
      {
        [v9 preDietIntakeMultiplier];
        double v33 = v33 * v39;
      }
      uint64_t v40 = [a1 demoDataGenerator];
      v41 = [v40 statisticsSampleGenerator];
      [v41 pseudoRandomDoubleFromTime:a5];
      double v43 = v15 * v33 * (v42 * 0.07 + 0.95);

      int v44 = [v11 isEqualToString:*MEMORY[0x1E4F2A798]];
      double v45 = 10.0;
      if (v43 >= 10.0) {
        double v45 = v43;
      }
      double v46 = (double)(uint64_t)v45;
      if (v44) {
        double v12 = v46;
      }
      else {
        double v12 = v43;
      }
    }
  }
LABEL_24:

  return v12;
}

void __107__HDDemoDataFoodSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke_355(id *a1, double a2)
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v4 = a1[4];
  id v5 = a1[5];
  uint64_t v6 = v5;
  if (!v4 || *((double *)v4 + 7) > a2) {
    goto LABEL_77;
  }
  if ([v5 useContinuousGlucoseMonitoring])
  {
    [v6 continuousGlucoseMonitoringSampleFrequency];
    *((double *)v4 + 7) = v7 + a2;
    BOOL v8 = 1;
  }
  else if (*((double *)v4 + 8) <= a2)
  {
    uint64_t v9 = (uint64_t)a2;
    id v10 = [v4 demoDataGenerator];
    id v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    char v12 = [v10 isDemoDataTimeInWeekend:v11 calendar:a2];

    if (v12) {
      [v6 weekendSleepParameters];
    }
    else {
    double v13 = [v6 weekdaySleepParameters];
    }
    double v14 = [v4 demoDataGenerator];
    double v15 = [v14 activitySampleGenerator];
    [v6 exerciseStartTime];
    double v17 = v16;
    [v6 exerciseStartTimeStdDev];
    [v15 _computeExerciseTimeFromCurrentTime:a2 mean:v17 stdDev:v18];
    id v154 = v19;

    double v20 = [v4 demoDataGenerator];
    double v21 = [v20 activitySampleGenerator];
    [v6 exerciseStopTime];
    double v23 = v22;
    [v6 exerciseStopTimeStdDev];
    [v21 _computeExerciseTimeFromCurrentTime:a2 mean:v23 stdDev:v24];
    double v26 = v25;

    double v27 = (double)v9;
    [v6 breakfastTime];
    double v29 = v28;
    [v6 breakfastTimeSampleNoiseStdDev];
    [v4 _computeMealTimeForDemoPerson:v6 fromTime:1 mealTimeType:a2 timeMean:v29 stdDev:v30];
    double v32 = v31 + (double)v9;
    [v6 breakfastTime];
    double v34 = v33;
    [v6 mealTimeSampleNoiseStdDev];
    [v4 _computeMealTimeForDemoPerson:v6 fromTime:2 mealTimeType:a2 timeMean:v34 stdDev:v35];
    double v37 = v36;
    [v6 breakfastTime];
    double v39 = v38;
    [v6 mealTimeSampleNoiseStdDev];
    [v4 _computeMealTimeForDemoPerson:v6 fromTime:3 mealTimeType:a2 timeMean:v39 stdDev:v40];
    double v152 = v41;
    [v6 breakfastTime];
    double v43 = v42;
    [v6 mealTimeSampleNoiseStdDev];
    [v4 _computeMealTimeForDemoPerson:v6 fromTime:4 mealTimeType:a2 timeMean:v43 stdDev:v44];
    double v151 = v45;
    double v46 = [v4 demoDataGenerator];
    v47 = [v46 sleepSampleGenerator];
    [v13 bedtime];
    double v49 = v48;
    [v6 bedtimeNoiseStdDev];
    [v47 computeSleepTimeFromCurrentTime:a2 mean:v49 stdDev:v50];
    double v150 = v51;

    v52 = [v4 demoDataGenerator];
    v53 = [v52 sleepSampleGenerator];
    [v13 wakeUpTime];
    double v55 = v54;
    [v6 wakeUpTimeNoiseStdDev];
    [v53 computeSleepTimeFromCurrentTime:a2 + 1.0 mean:v55 stdDev:v56];
    double v58 = v57;

    v59 = [v4 demoDataGenerator];
    v60 = [v59 activitySampleGenerator];
    [v6 exerciseStartTime];
    double v62 = v61;
    [v6 exerciseStartTimeStdDev];
    [v60 _computeExerciseTimeFromCurrentTime:a2 + 1.0 mean:v62 stdDev:v63];
    double v65 = v64;

    if (*(double *)&v154 <= a2)
    {
      double v67 = v37 + v27;
      if (v32 <= a2)
      {
        double v68 = v152 + v27;
        if (v67 <= a2)
        {
          double v69 = v151 + v27;
          if (v68 <= a2)
          {
            if (v69 <= a2) {
              double v66 = v58 + (double)(v9 + 1) + (v65 + (double)(v9 + 1) - (v58 + (double)(v9 + 1))) * 0.5;
            }
            else {
              double v66 = v69 + (v150 + v27 - v69) * 0.5;
            }
          }
          else
          {
            double v66 = v68 + (v69 - v68) * 0.5;
          }
        }
        else
        {
          double v66 = v67 + (v68 - v67) * 0.5;
        }
      }
      else
      {
        double v66 = v32 + (v67 - v32) / 3.0;
      }
    }
    else
    {
      double v66 = v26 + (v32 - v26) * 0.5;
    }
    *((double *)v4 + 8) = v66;
    v70 = objc_msgSend(v4, "demoDataGenerator", *(void *)&v150);
    v71 = [v70 statisticsSampleGenerator];
    [v71 pseudoRandomDoubleFromTime:a2];
    double v73 = v72;
    [v6 numDailyFingerSticksAdherence];
    BOOL v8 = v73 < v74;
  }
  else
  {
    BOOL v8 = 0;
  }
  id v155 = [v4 demoDataGenerator];
  v153 = [v155 bodySampleGenerator];
  [v153 lastWeightInKg];
  double v76 = v75;
  id v77 = v6;
  if (*((double *)v4 + 9) < a2)
  {
    long long v159 = 0u;
    long long v160 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    id v78 = *((id *)v4 + 6);
    uint64_t v79 = [v78 countByEnumeratingWithState:&v157 objects:v161 count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v158;
      id v82 = (void *)*MEMORY[0x1E4F2A688];
      double v83 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v80; ++i)
        {
          if (*(void *)v158 != v81) {
            objc_enumerationMutation(v78);
          }
          double v83 = v83
              + -[HDDemoDataFoodSampleGenerator _computeNutrientForDemoPerson:atTime:mealItem:quantityType:]((id *)v4, v77, *(void **)(*((void *)&v157 + 1) + 8 * i), v82, a2);
        }
        uint64_t v80 = [v78 countByEnumeratingWithState:&v157 objects:v161 count:16];
      }
      while (v80);

      if (v83 > 0.0)
      {
        double v85 = [v4 demoDataGenerator];
        double v86 = [v85 statisticsSampleGenerator];
        [v86 computeNoiseFromTime:a2 + 4.0 stdDev:0.58];
        double v88 = fabs(v87) + 1.0;

        double v89 = *((double *)v4 + 12);
        if (v89 > 0.0) {
          double v88 = (v83 * v88 + v89 * *((double *)v4 + 13)) / (v83 + v89);
        }
        *((double *)v4 + 13) = v88;
        *((double *)v4 + 12) = v83 + *((double *)v4 + 12);
      }
    }
    else
    {
    }
  }
  double v90 = [v4 demoDataGenerator];
  v91 = [v90 sleepSampleGenerator];
  int v92 = [v91 isDemoPersonAwake:v77 atTime:a2];

  if (v92)
  {
    v93 = [v4 demoDataGenerator];
    id v94 = [v93 generatorState];
    char v95 = [v94 isExercising];

    if (v95)
    {
      double v96 = 5.233;
    }
    else
    {
      char v101 = [v4 demoDataGenerator];
      v102 = [v101 activitySampleGenerator];
      [v77 continuousGlucoseMonitoringSampleFrequency];
      int v104 = [v102 _isDemoPersonWalking:v77 atTime:a2 samplePeriod:v103];

      if (v104)
      {
        v105 = [v4 demoDataGenerator];
        char v106 = [v105 activitySampleGenerator];
        v107 = [v106 _computeFlightsClimbedForDemoPerson:v77 atTime:a2];

        double v96 = dbl_1BD325E50[v107 == 0];
      }
      else
      {
        double v96 = 0.443;
      }
    }
  }
  else
  {
    double v96 = 0.233;
  }
  if ([v77 biologicalSex] == 2) {
    double v96 = v96 * 1.1;
  }
  [v77 continuousGlucoseMonitoringSampleFrequency];
  double v98 = v96 * (v97 / 0.000694444444);
  double v99 = *((double *)v4 + 10);
  if (v99 <= 185.0)
  {
    if (v99 <= 180.0)
    {
      if (v99 <= 170.0)
      {
        if (v99 <= 160.0)
        {
          if (v99 <= 150.0)
          {
            if (v99 <= 140.0) {
              double v100 = dbl_1BD325E60[v99 > 130.0];
            }
            else {
              double v100 = 0.10019;
            }
          }
          else
          {
            double v100 = 0.20038;
          }
        }
        else
        {
          double v100 = 0.39377;
        }
      }
      else
      {
        double v100 = 0.8155;
      }
    }
    else
    {
      double v100 = 1.6543;
    }
  }
  else
  {
    double v100 = 2.4698;
  }
  if ([v77 biologicalSex] == 2) {
    double v108 = v100 * 1.08;
  }
  else {
    double v108 = v100;
  }
  [v77 insulinProduction];
  double v110 = v109;
  [v77 insulinProduction];
  double v112 = 1.0 - v111;
  [v77 insulinAdherence];
  double v114 = *((double *)v4 + 14) + v108 * (v110 + v112 * v113);
  *((double *)v4 + 14) = v114;
  [v77 insulinSensitivity];
  double v116 = v114 * v115;
  [v77 continuousGlucoseMonitoringSampleFrequency];
  double v118 = v98 + v116 * (v117 / 0.000694444444);
  [v77 continuousGlucoseMonitoringSampleFrequency];
  *((long double *)v4 + 14) = *((double *)v4 + 14) * exp2(v119 / -0.00347222222);
  double v120 = 0.0;
  if (*((double *)v4 + 12) > 0.0)
  {
    double v121 = fmax(v76 * 2.20461988 * -0.02 + 7.0, 2.0);
    if (v121 <= 5.5) {
      double v122 = v121;
    }
    else {
      double v122 = 5.5;
    }
    double v123 = *((double *)v4 + 13) / v122;
    [v77 continuousGlucoseMonitoringSampleFrequency];
    double v125 = v123 * (v124 / 0.000694444444);
    double v126 = *((double *)v4 + 12);
    if (v125 >= v126) {
      double v125 = *((double *)v4 + 12);
    }
    double v127 = v126 - v125;
    *((double *)v4 + 12) = v127;
    if (v127 < 0.0)
    {
      *((void *)v4 + 12) = 0;
      *((void *)v4 + 13) = 0;
    }
    double v120 = v125 * v122 + 0.0;
  }
  double v128 = v120 + *((double *)v4 + 10) - v118;
  if (v128 < 80.0)
  {
    double v129 = (80.0 - v128) * 4.0 / 5.0;
    double v130 = [v4 demoDataGenerator];
    double v131 = [v130 statisticsSampleGenerator];
    [v131 computeNoiseFromTime:a2 stdDev:v129 / 5.0];
    double v133 = v129 * fabs(v132);

    double v120 = v120 + v133;
  }
  v134 = [v4 demoDataGenerator];
  v135 = [v134 statisticsSampleGenerator];
  [v135 computeNoiseFromTime:a2 stdDev:2.0];
  double v137 = v136;

  uint64_t v138 = (uint64_t)(v137 + sin((a2 + -0.375) * 6.28318531) * 0.08 + v120 - v118 + *((double *)v4 + 10));
  if (*((double *)v4 + 9) <= a2) {
    *((void *)v4 + 9) = *((void *)v4 + 5);
  }
  double v139 = (double)v138;
  if (*((double *)v4 + 7) - a2 < 0.0173611111) {
    double v139 = *((double *)v4 + 10) * 0.13 + v139 * 0.87;
  }
  if (v8)
  {
    double v140 = [v4 demoDataGenerator];
    v141 = [v140 statisticsSampleGenerator];
    [v141 computeNoiseFromTime:a2 + 4.0 stdDev:10.0];
    double v143 = v139 + v142;

    *((double *)v4 + 10) = floor(v143);
    objc_msgSend(NSNumber, "numberWithDouble:");
    id v156 = (id)objc_claimAutoreleasedReturnValue();

    v144 = v156;
    if (!v156) {
      goto LABEL_79;
    }
    v145 = [a1[4] demoDataGenerator];
    uint64_t v6 = [v145 currentDateFromCurrentTime:a2];

    v146 = (void *)MEMORY[0x1E4F2B370];
    uint64_t v147 = qword_1EBA18AD8;
    [v156 doubleValue];
    uint64_t v148 = objc_msgSend(v146, "quantityWithUnit:doubleValue:", v147);
    v149 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1EBA18AE8 quantity:v148 startDate:v6 endDate:v6];
    [a1[6] addObjectFromPhone:v149];
  }
  else
  {
LABEL_77:
    id v156 = 0;
  }

  v144 = v156;
LABEL_79:
}

void __73__HDDemoDataFoodSampleGenerator__isTypicalNutritionTrackingQuantityType___block_invoke()
{
  v7[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F2A678];
  v7[0] = *MEMORY[0x1E4F2A688];
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F2A750];
  v7[2] = *MEMORY[0x1E4F2A6D0];
  v7[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F2A6B0];
  v7[4] = *MEMORY[0x1E4F2A730];
  v7[5] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:6];
  uint64_t v5 = [v0 setWithArray:v4];
  uint64_t v6 = (void *)qword_1EBA18B08;
  qword_1EBA18B08 = v5;
}

- (BOOL)_isDemoPersonConsumingCaffeine:(id)a3 atTime:(double)a4
{
  id v6 = a3;
  double v7 = (double)(uint64_t)a4;
  double v8 = a4 - v7;
  [v6 numCupsOfCoffeeDailyMean];
  double v10 = v9;
  id v11 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  char v12 = [v11 statisticsSampleGenerator];
  [v6 numCupsOfCoffeeStdDev];
  double v14 = v13;

  [v12 computeNoiseFromTime:v7 stdDev:v14];
  double v16 = v15;

  uint64_t v17 = -[HDDemoDataFoodSampleGenerator mealTypeForTime:]((uint64_t)self, v8) - 1;
  BOOL result = 0;
  double v19 = fabs(v10 + v16);
  switch(v17)
  {
    case 0:
      double nextBreakfastTime = self->_nextBreakfastTime;
      self->_lastMealTime = nextBreakfastTime;
      double v21 = 1.0;
      goto LABEL_7;
    case 1:
      double nextBreakfastTime = self->_nextLunchTime;
      self->_lastMealTime = nextBreakfastTime;
      double v21 = 2.0;
      goto LABEL_7;
    case 2:
      double nextBreakfastTime = self->_nextSnackTime;
      self->_lastMealTime = nextBreakfastTime;
      double v21 = 3.0;
      goto LABEL_7;
    case 3:
      double nextBreakfastTime = self->_nextDinnerTime;
      self->_lastMealTime = nextBreakfastTime;
      double v21 = 4.0;
LABEL_7:
      if (v19 < v21) {
        goto LABEL_8;
      }
      char v22 = 0;
      break;
    case 4:
      return result;
    default:
      double nextBreakfastTime = self->_lastMealTime;
LABEL_8:
      char v22 = 1;
      break;
  }
  double v23 = nextBreakfastTime + 0.0163541667;
  self->_lastMealTime = v23;
  BOOL v24 = v8 <= v23;
  if (v8 >= v23 + 0.0486111111) {
    BOOL v24 = 1;
  }
  return (v22 | v24) ^ 1;
}

- (double)_computeMealTimeForDemoPerson:(id)a3 fromTime:(double)a4 mealTimeType:(int64_t)a5 timeMean:(double)a6 stdDev:(double)a7
{
  int v9 = a5;
  double v10 = (double)(uint64_t)a4;
  id v11 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  char v12 = [v11 statisticsSampleGenerator];
  [v12 computeStatisticalTimeFromCurrentTime:(double)v9 + v10 * 4.0 mean:a6 stdDev:a7];
  double v14 = v13;

  return v14;
}

- (double)_nextMealTimeForDemoPerson:(double)a3 atTime:
{
  id v5 = a2;
  id v6 = v5;
  uint64_t v7 = (uint64_t)a3;
  uint64_t v8 = (uint64_t)a3 + 1;
  if (a1[19] <= a3)
  {
    double v10 = (double)v7;
    [v5 dinnerTime];
    double v12 = v11;
    [v6 mealTimeSampleNoiseStdDev];
    double v14 = v13;
    double v15 = a1;
    double v16 = v6;
    double v17 = v10;
    uint64_t v18 = 4;
LABEL_9:
    [v15 _computeMealTimeForDemoPerson:v16 fromTime:v18 mealTimeType:v17 timeMean:v12 stdDev:v14];
    double v9 = v25 + (double)v8;
    goto LABEL_10;
  }
  if (a1[18] <= a3)
  {
    double v19 = (double)v7;
    [v5 snackTime];
    double v12 = v20;
    [v6 mealTimeSampleNoiseStdDev];
    double v14 = v21;
    double v15 = a1;
    double v16 = v6;
    double v17 = v19;
    uint64_t v18 = 3;
    goto LABEL_9;
  }
  if (a1[17] <= a3)
  {
    double v22 = (double)v7;
    [v5 lunchTime];
    double v12 = v23;
    [v6 mealTimeSampleNoiseStdDev];
    double v14 = v24;
    double v15 = a1;
    double v16 = v6;
    double v17 = v22;
    uint64_t v18 = 2;
    goto LABEL_9;
  }
  if (a1[16] <= a3)
  {
    [v5 breakfastTime];
    double v28 = v27;
    [v6 breakfastTimeSampleNoiseStdDev];
    [a1 _computeMealTimeForDemoPerson:v6 fromTime:1 mealTimeType:(double)v8 timeMean:v28 stdDev:v29];
    double v9 = v30 + (double)v8;
  }
  else
  {
    double v9 = a1[5];
  }
LABEL_10:

  return v9;
}

- (void)_generateRandomLastMeal
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (self) {
    foodDatabase = self->_foodDatabase;
  }
  else {
    foodDatabase = 0;
  }
  id v4 = foodDatabase;
  id v5 = [(HDDemoDataFoodDatabase *)v4 randomFoodForType:4];

  if (self) {
    id v6 = self->_foodDatabase;
  }
  else {
    id v6 = 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = [(HDDemoDataFoodDatabase *)v7 randomFoodForType:5];

  v11[0] = v5;
  v11[1] = v8;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  lastMeal = self->_lastMeal;
  self->_lastMeal = v9;
}

- (id)_lastMeal
{
  return self->_lastMeal;
}

- (double)nextBreakfastTime
{
  return self->_nextBreakfastTime;
}

- (double)nextLunchTime
{
  return self->_nextLunchTime;
}

- (double)nextSnackTime
{
  return self->_nextSnackTime;
}

- (double)nextDinnerTime
{
  return self->_nextDinnerTime;
}

- (double)lastMealTime
{
  return self->_lastMealTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMeal, 0);

  objc_storeStrong((id *)&self->_foodDatabase, 0);
}

@end