@interface HDDemoDataSymptomsSampleGenerator
+ (BOOL)supportsSecureCoding;
- (HDDemoDataSymptomsSampleGenerator)init;
- (HDDemoDataSymptomsSampleGenerator)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)generateSymptomSamplesForDemoPerson:(void *)a3 atTime:(uint64_t)a4 sampleDate:(void *)a5 nextTime:(void *)a6 condition:(double)a7 sampleTypes:(double)a8 frequency:(double)a9 objectCollection:;
- (void)setupWithDemoDataGenerator:(id)a3;
@end

@implementation HDDemoDataSymptomsSampleGenerator

- (HDDemoDataSymptomsSampleGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataSymptomsSampleGenerator;
  result = [(HDDemoDataBaseSampleGenerator *)&v3 init];
  if (result)
  {
    result->_nextCommonColdSymptomsTime = 0.0;
    result->_nextFoodPoisoningSymptomsTime = 0.0;
    result->_nextSingleRandomSymptomTime = 0.0;
  }
  return result;
}

- (HDDemoDataSymptomsSampleGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDDemoDataSymptomsSampleGenerator;
  v5 = [(HDDemoDataBaseSampleGenerator *)&v10 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"NextCommonColdSymptomsTimeKey"];
    v5->_nextCommonColdSymptomsTime = v6;
    [v4 decodeDoubleForKey:@"NextFoodPoisoningSymptomsTimeKey"];
    v5->_nextFoodPoisoningSymptomsTime = v7;
    [v4 decodeDoubleForKey:@"NextSingleRandomSymptomTimeKey"];
    v5->_nextSingleRandomSymptomTime = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataSymptomsSampleGenerator;
  id v4 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v6 encodeWithCoder:v4];
  if (self)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", @"NextCommonColdSymptomsTimeKey", self->_nextCommonColdSymptomsTime, v6.receiver, v6.super_class);
    [v4 encodeDouble:@"NextFoodPoisoningSymptomsTimeKey" forKey:self->_nextFoodPoisoningSymptomsTime];
    double nextSingleRandomSymptomTime = self->_nextSingleRandomSymptomTime;
  }
  else
  {
    objc_msgSend(v4, "encodeDouble:forKey:", @"NextCommonColdSymptomsTimeKey", 0.0, v6.receiver, v6.super_class);
    [v4 encodeDouble:@"NextFoodPoisoningSymptomsTimeKey" forKey:0.0];
    double nextSingleRandomSymptomTime = 0.0;
  }
  [v4 encodeDouble:@"NextSingleRandomSymptomTimeKey" forKey:nextSingleRandomSymptomTime];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataSymptomsSampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v3 setupWithDemoDataGenerator:a3];
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  v42[5] = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)HDDemoDataSymptomsSampleGenerator;
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v39 generateObjectsForDemoPerson:v13 fromTime:v12 toTime:v11 currentDate:a5 objectCollection:a5];
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  unint64_t v17 = 0x1E4F1C000;
  if (self)
  {
    if (self->_nextSingleRandomSymptomTime <= a5)
    {
      v18 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v19 = [v18 sleepSampleGenerator];
      char v20 = [v19 isDemoPersonSleeping:v14 atTime:a5];

      if ((v20 & 1) == 0)
      {
        v21 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v22 = [v21 statisticsSampleGenerator];
        [v22 computeNoiseFromTime:a5 stdDev:3.0];
        double v24 = v23 + 10.0;

        self->_double nextSingleRandomSymptomTime = v24 + self->_nextSingleRandomSymptomTime;
        uint64_t v38 = arc4random_uniform(3u) + 2;
        v25 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29768]];
        v42[0] = v25;
        v26 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297A0]];
        v42[1] = v26;
        v27 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29808]];
        v42[2] = v27;
        v28 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29828]];
        v42[3] = v28;
        v29 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29898]];
        v42[4] = v29;
        v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:5];

        unint64_t v17 = 0x1E4F1C000uLL;
        v31 = objc_msgSend(v30, "objectAtIndex:", arc4random_uniform(objc_msgSend(v30, "count")));
        v32 = [MEMORY[0x1E4F2ACB0] categorySampleWithType:v31 value:v38 startDate:v15 endDate:v15];
        [v16 addObjectFromPhone:v32];
      }
    }
  }

  uint64_t v33 = *MEMORY[0x1E4F29880];
  v41[0] = *MEMORY[0x1E4F29790];
  v41[1] = v33;
  uint64_t v34 = *MEMORY[0x1E4F29868];
  v41[2] = *MEMORY[0x1E4F29858];
  v41[3] = v34;
  v35 = [*(id *)(v17 + 2424) arrayWithObjects:v41 count:4];
  -[HDDemoDataSymptomsSampleGenerator generateSymptomSamplesForDemoPerson:atTime:sampleDate:nextTime:condition:sampleTypes:frequency:objectCollection:]((double *)self, v14, v15, 0, v35, v16, a5, self->_nextCommonColdSymptomsTime, 60.0);
  uint64_t v36 = *MEMORY[0x1E4F29820];
  v40[0] = *MEMORY[0x1E4F29890];
  v40[1] = v36;
  v40[2] = *MEMORY[0x1E4F29798];
  v37 = [*(id *)(v17 + 2424) arrayWithObjects:v40 count:3];
  -[HDDemoDataSymptomsSampleGenerator generateSymptomSamplesForDemoPerson:atTime:sampleDate:nextTime:condition:sampleTypes:frequency:objectCollection:]((double *)self, v14, v15, 1, v37, v16, a5, self->_nextFoodPoisoningSymptomsTime, 90.0);
}

- (void)generateSymptomSamplesForDemoPerson:(void *)a3 atTime:(uint64_t)a4 sampleDate:(void *)a5 nextTime:(void *)a6 condition:(double)a7 sampleTypes:(double)a8 frequency:(double)a9 objectCollection:
{
  id v17 = a2;
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  if (a1)
  {
    if (a7 >= a8)
    {
      v21 = [a1 demoDataGenerator];
      v22 = [v21 sleepSampleGenerator];
      char v23 = [v22 isDemoPersonSleeping:v17 atTime:a7];

      if ((v23 & 1) == 0)
      {
        double v24 = [a1 demoDataGenerator];
        v25 = [v24 statisticsSampleGenerator];
        [v25 computeNoiseFromTime:a7 stdDev:15.0];
        double v27 = v26 + a9;

        if (a4 != 1)
        {
          if (a4)
          {
LABEL_8:
            uint32_t v28 = arc4random_uniform(3u);
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __149__HDDemoDataSymptomsSampleGenerator_generateSymptomSamplesForDemoPerson_atTime_sampleDate_nextTime_condition_sampleTypes_frequency_objectCollection___block_invoke;
            v29[3] = &unk_1E6308C30;
            uint64_t v32 = v28 + 2;
            id v30 = v18;
            id v31 = v20;
            [v19 enumerateObjectsUsingBlock:v29];

            goto LABEL_9;
          }
          a1[4] = v27 + a1[4];
        }
        a1[5] = v27 + a1[5];
        goto LABEL_8;
      }
    }
  }
LABEL_9:
}

void __149__HDDemoDataSymptomsSampleGenerator_generateSymptomSamplesForDemoPerson_atTime_sampleDate_nextTime_condition_sampleTypes_frequency_objectCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:a2];
  objc_super v3 = [MEMORY[0x1E4F2ACB0] categorySampleWithType:v4 value:*(void *)(a1 + 48) startDate:*(void *)(a1 + 32) endDate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addObjectFromPhone:v3];
}

@end