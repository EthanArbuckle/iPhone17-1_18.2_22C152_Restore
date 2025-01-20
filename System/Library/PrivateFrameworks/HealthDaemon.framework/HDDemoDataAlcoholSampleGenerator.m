@interface HDDemoDataAlcoholSampleGenerator
+ (BOOL)supportsSecureCoding;
- (BOOL)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 foodSampleGenerator:(id)a7 statisticsSampleGenerator:(id)a8 bodySampleGenerator:(id)a9 objectCollection:(id)a10;
- (HDDemoDataAlcoholSampleGenerator)init;
- (HDDemoDataAlcoholSampleGenerator)initWithCoder:(id)a3;
- (double)_computeNumDrinksTodayForDemoPerson:(void *)a3 atTime:(double)a4 statisticsSampleGenerator:;
- (double)bloodAlcoholContentForDemoPerson:(void *)a3 atTime:(double)a4 numberOfDrinks:(double)a5 drinkTime:(double)a6 bodySampleGenerator:;
- (double)nextCheckInTime;
- (void)_saveBAC:(void *)a3 toObjectCollection:(double)a4 sampleDate:;
- (void)encodeWithCoder:(id)a3;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)setNextCheckInTime:(double)a3;
- (void)setupWithDemoDataGenerator:(id)a3;
@end

@implementation HDDemoDataAlcoholSampleGenerator

- (HDDemoDataAlcoholSampleGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataAlcoholSampleGenerator;
  result = [(HDDemoDataBaseSampleGenerator *)&v3 init];
  if (result) {
    result->_nextCheckInTime = 0.0;
  }
  return result;
}

- (HDDemoDataAlcoholSampleGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDDemoDataAlcoholSampleGenerator;
  v5 = [(HDDemoDataBaseSampleGenerator *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"HDDemoDataAlcoholSampleGeneratorNextCheckInTimeKey"];
    v5->_nextCheckInTime = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataAlcoholSampleGenerator;
  id v4 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HDDemoDataAlcoholSampleGeneratorNextCheckInTimeKey", self->_nextCheckInTime, v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDDemoDataAlcoholSampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v10 setupWithDemoDataGenerator:v4];
  if (![(HDDemoDataBaseSampleGenerator *)self createdFromNSKeyedUnarchiver])
  {
    objc_super v5 = [v4 foodSampleGenerator];
    double v6 = [v4 demoPerson];
    v7 = [v4 demoPerson];
    [v7 dinnerTime];
    [v5 _computeMealTimeForDemoPerson:v6 fromTime:4 mealTimeType:0.0 timeMean:v8 stdDev:0.0243055556];
    self->_nextCheckInTime = v9;
  }
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  v21.receiver = self;
  v21.super_class = (Class)HDDemoDataAlcoholSampleGenerator;
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v21 generateObjectsForDemoPerson:v14 fromTime:v13 toTime:v12 currentDate:a5 objectCollection:a5];
  v15 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v16 = [v15 foodSampleGenerator];
  v17 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v18 = [v17 statisticsSampleGenerator];
  v19 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v20 = [v19 bodySampleGenerator];
  [(HDDemoDataAlcoholSampleGenerator *)self generateObjectsForDemoPerson:v14 fromTime:v13 toTime:v16 currentDate:v18 foodSampleGenerator:v20 statisticsSampleGenerator:v12 bodySampleGenerator:a4 objectCollection:a5];
}

- (BOOL)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 foodSampleGenerator:(id)a7 statisticsSampleGenerator:(id)a8 bodySampleGenerator:(id)a9 objectCollection:(id)a10
{
  id v18 = a3;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  if (([v18 resultsTrackingType] == 2 || objc_msgSend(v18, "profileType") == 4)
    && self->_nextCheckInTime <= a5)
  {
    if (qword_1EBA18C40 != -1) {
      dispatch_once(&qword_1EBA18C40, &__block_literal_global_115);
    }
    uint64_t v25 = (uint64_t)a5;
    [v18 dinnerTime];
    double v27 = v26;
    [v18 mealTimeSampleNoiseStdDev];
    [v20 _computeMealTimeForDemoPerson:v18 fromTime:4 mealTimeType:a5 timeMean:v27 stdDev:v28];
    double v30 = v29 + (double)(uint64_t)a5;
    if (v30 <= a5)
    {
      double v42 = -[HDDemoDataAlcoholSampleGenerator _computeNumDrinksTodayForDemoPerson:atTime:statisticsSampleGenerator:]((uint64_t)self, v18, v21, a5);
      double v43 = v42;
      if (v30 > a4)
      {
        v44 = [MEMORY[0x1E4F2B370] quantityWithUnit:qword_1EBA18C30 doubleValue:v42];
        v45 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1EBA18C38 quantity:v44 startDate:v19 endDate:v19];
        [v23 addObjectFromPhone:v45];

        uint64_t v25 = (uint64_t)a5;
      }
      v38 = self;
      v39 = v18;
      double v40 = a5;
      double v41 = v43;
      double v37 = v30;
    }
    else
    {
      double v31 = -[HDDemoDataAlcoholSampleGenerator _computeNumDrinksTodayForDemoPerson:atTime:statisticsSampleGenerator:]((uint64_t)self, v18, v21, a5 + -1.0);
      if (v31 <= 0.0) {
        goto LABEL_15;
      }
      double v32 = v31;
      [v18 dinnerTime];
      double v34 = v33;
      [v18 mealTimeSampleNoiseStdDev];
      [v20 _computeMealTimeForDemoPerson:v18 fromTime:4 mealTimeType:a5 + -1.0 timeMean:v34 stdDev:v35];
      double v37 = v36 + (double)(v25 - 1);
      v38 = self;
      v39 = v18;
      double v40 = a5;
      double v41 = v32;
    }
    double v46 = -[HDDemoDataAlcoholSampleGenerator bloodAlcoholContentForDemoPerson:atTime:numberOfDrinks:drinkTime:bodySampleGenerator:]((uint64_t)v38, v39, v22, v40, v41, v37);
    -[HDDemoDataAlcoholSampleGenerator _saveBAC:toObjectCollection:sampleDate:]((uint64_t)self, v23, v19, v46);
    if (v46 > 0.03)
    {
      v47 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v48 = [v47 statisticsSampleGenerator];
      [v18 genericSampleTimeNoiseStdDev];
      [v48 computeNoiseFromTime:a5 stdDev:v49];
      double v51 = v50 + 0.03125;

      double v52 = v51 + a5;
LABEL_16:
      self->_nextCheckInTime = v52;
      BOOL v24 = 1;
      goto LABEL_17;
    }
LABEL_15:
    [v18 dinnerTime];
    double v54 = v53;
    [v18 mealTimeSampleNoiseStdDev];
    [v20 _computeMealTimeForDemoPerson:v18 fromTime:4 mealTimeType:(double)(v25 + 1) timeMean:v54 stdDev:v55];
    double v52 = v56 + (double)(v25 + 1);
    goto LABEL_16;
  }
  BOOL v24 = 0;
LABEL_17:

  return v24;
}

void __176__HDDemoDataAlcoholSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_foodSampleGenerator_statisticsSampleGenerator_bodySampleGenerator_objectCollection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F2B618] percentUnit];
  v1 = (void *)_MergedGlobals_207;
  _MergedGlobals_207 = v0;

  uint64_t v2 = [MEMORY[0x1E4F2B618] countUnit];
  objc_super v3 = (void *)qword_1EBA18C30;
  qword_1EBA18C30 = v2;

  uint64_t v4 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A608]];
  objc_super v5 = (void *)qword_1EBA18C28;
  qword_1EBA18C28 = v4;

  uint64_t v6 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A858]];
  v7 = (void *)qword_1EBA18C38;
  qword_1EBA18C38 = v6;
}

- (double)_computeNumDrinksTodayForDemoPerson:(void *)a3 atTime:(double)a4 statisticsSampleGenerator:
{
  id v7 = a2;
  id v8 = a3;
  double v9 = v8;
  double v10 = 0.0;
  if (a1)
  {
    double v11 = (double)(uint64_t)a4;
    [v8 pseudoRandomDoubleFromTime:v11 + 0.1];
    if (v12 < 0.33)
    {
      [v9 pseudoRandomDoubleFromTime:v11];
      double v10 = floor(v13 * 3.0) + 1.0;
    }
  }

  return v10;
}

- (double)bloodAlcoholContentForDemoPerson:(void *)a3 atTime:(double)a4 numberOfDrinks:(double)a5 drinkTime:(double)a6 bodySampleGenerator:
{
  if (!a1) {
    return 0.0;
  }
  double v8 = (a4 - a6) * 86400.0;
  id v9 = a2;
  [a3 lastWeightInKg];
  double v11 = v10;
  uint64_t v12 = [v9 biologicalSex];

  +[HDDemoDataFormula computeBloodAlcoholContentForNumDrinks:v12 elapsedTime:a5 weight:v8 sex:v11];
  double v14 = v13;
  double v15 = __exp10(2.0);
  return (double)(uint64_t)(v14 * v15) / v15;
}

- (void)_saveBAC:(void *)a3 toObjectCollection:(double)a4 sampleDate:
{
  id v10 = a2;
  id v7 = a3;
  if (a1)
  {
    if (qword_1EBA18C58 != -1) {
      dispatch_once(&qword_1EBA18C58, &__block_literal_global_294);
    }
    double v8 = [MEMORY[0x1E4F2B370] quantityWithUnit:qword_1EBA18C48 doubleValue:a4 / 100.0];
    id v9 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1EBA18C50 quantity:v8 startDate:v7 endDate:v7];
    [v10 addObjectFromPhone:v9];
  }
}

void __75__HDDemoDataAlcoholSampleGenerator__saveBAC_toObjectCollection_sampleDate___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F2B618] percentUnit];
  v1 = (void *)qword_1EBA18C48;
  qword_1EBA18C48 = v0;

  uint64_t v2 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A608]];
  objc_super v3 = (void *)qword_1EBA18C50;
  qword_1EBA18C50 = v2;
}

- (double)nextCheckInTime
{
  return self->_nextCheckInTime;
}

- (void)setNextCheckInTime:(double)a3
{
  self->_nextCheckInTime = a3;
}

@end