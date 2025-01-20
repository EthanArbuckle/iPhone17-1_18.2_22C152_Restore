@interface HDDemoDataPathologySampleGenerator
+ (BOOL)supportsSecureCoding;
- (HDDemoDataPathologySampleGenerator)init;
- (HDDemoDataPathologySampleGenerator)initWithCoder:(id)a3;
- (id)spirometryForDemoPerson:(uint64_t)a3 atTime:(double)a4 type:;
- (uint64_t)_isAsthmaAttackAllowedForDemoPerson:(double)a3 atTime:;
- (void)_computeSpirometryForDemoPerson:(double)a3 atTime:type:computeLowerLimitOfNormality:height:;
- (void)encodeWithCoder:(id)a3;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)setupWithDemoDataGenerator:(id)a3;
@end

@implementation HDDemoDataPathologySampleGenerator

- (HDDemoDataPathologySampleGenerator)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataPathologySampleGenerator;
  v2 = [(HDDemoDataBaseSampleGenerator *)&v6 init];
  v3 = v2;
  if (v2)
  {
    nextSpirometrySampleTimes = v2->_nextSpirometrySampleTimes;
    v2->_nextSpirometrySampleTimes = 0;

    v3->_nextAsthmaAttackSampleTime = 0.0;
    v3->_nextAsthmaAttackEndTime = 0.0;
    v3->_forcePEFR = 0;
  }
  return v3;
}

- (HDDemoDataPathologySampleGenerator)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDDemoDataPathologySampleGenerator;
  v5 = [(HDDemoDataBaseSampleGenerator *)&v15 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v8 = [v6 setWithArray:v7];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HDDemoDataPathologySampleHelperNextSpirometrySampleTimesKey"];
    uint64_t v10 = [v9 mutableCopy];
    nextSpirometrySampleTimes = v5->_nextSpirometrySampleTimes;
    v5->_nextSpirometrySampleTimes = (NSMutableDictionary *)v10;

    [v4 decodeDoubleForKey:@"HDDemoDataPathologySampleHelperNextAsthmaAttackSampleTimeKey"];
    v5->_nextAsthmaAttackSampleTime = v12;
    [v4 decodeDoubleForKey:@"HDDemoDataPathologySampleHelperNextAsthmaAttackEndTimeKey"];
    v5->_nextAsthmaAttackEndTime = v13;
    v5->_forcePEFR = [v4 decodeBoolForKey:@"HDDemoDataPathologySampleHelperForcePEFRKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataPathologySampleGenerator;
  id v4 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_nextSpirometrySampleTimes, @"HDDemoDataPathologySampleHelperNextSpirometrySampleTimesKey", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"HDDemoDataPathologySampleHelperNextAsthmaAttackSampleTimeKey" forKey:self->_nextAsthmaAttackSampleTime];
  [v4 encodeDouble:@"HDDemoDataPathologySampleHelperNextAsthmaAttackEndTimeKey" forKey:self->_nextAsthmaAttackEndTime];
  [v4 encodeBool:self->_forcePEFR forKey:@"HDDemoDataPathologySampleHelperForcePEFRKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  void v16[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDDemoDataPathologySampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v14 setupWithDemoDataGenerator:v4];
  if (![(HDDemoDataBaseSampleGenerator *)self createdFromNSKeyedUnarchiver])
  {
    v15[0] = &unk_1F17EF030;
    v15[1] = &unk_1F17EF060;
    v16[0] = &unk_1F17EF048;
    v16[1] = &unk_1F17EF048;
    v15[2] = &unk_1F17EF078;
    v16[2] = &unk_1F17EF048;
    objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    objc_super v6 = (NSMutableDictionary *)[v5 mutableCopy];
    nextSpirometrySampleTimes = self->_nextSpirometrySampleTimes;
    self->_nextSpirometrySampleTimes = v6;

    v8 = [v4 demoPerson];
    [v8 lunchTime];
    self->_nextAsthmaAttackSampleTime = v9;

    double v10 = self->_nextAsthmaAttackSampleTime + 0.107638889;
    v11 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    double v12 = [v11 statisticsSampleGenerator];
    [v12 computeNoiseFromTime:0.0 stdDev:0.0243055556];
    self->_nextAsthmaAttackEndTime = v10 + v13;

    self->_forcePEFR = 0;
  }
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  v62.receiver = self;
  v62.super_class = (Class)HDDemoDataPathologySampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v62 generateObjectsForDemoPerson:v11 fromTime:v12 toTime:v13 currentDate:a5 objectCollection:a5];
  if ([v11 resultsTrackingType] == 2)
  {
    if (qword_1E9FC5278 != -1) {
      dispatch_once(&qword_1E9FC5278, &__block_literal_global_236);
    }
    objc_super v14 = -[HDDemoDataPathologySampleGenerator spirometryForDemoPerson:atTime:type:]((uint64_t)self, v11, 0, a5);
    objc_super v15 = v14;
    if (v14)
    {
      v16 = (void *)MEMORY[0x1E4F2B370];
      uint64_t v17 = qword_1E9FC5248;
      [v14 doubleValue];
      v18 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", v17);
      v19 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1E9FC5258 quantity:v18 startDate:v12 endDate:v12];
      [v13 addObjectFromPhone:v19];
    }
    v20 = -[HDDemoDataPathologySampleGenerator spirometryForDemoPerson:atTime:type:]((uint64_t)self, v11, 1, a5);
    v21 = v20;
    if (v20)
    {
      v22 = (void *)MEMORY[0x1E4F2B370];
      uint64_t v23 = qword_1E9FC5248;
      [v20 doubleValue];
      v24 = objc_msgSend(v22, "quantityWithUnit:doubleValue:", v23);
      v25 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1E9FC5260 quantity:v24 startDate:v12 endDate:v12];
      [v13 addObjectFromPhone:v25];
    }
    v26 = -[HDDemoDataPathologySampleGenerator spirometryForDemoPerson:atTime:type:]((uint64_t)self, v11, 2, a5);
    v27 = v26;
    if (v26)
    {
      v28 = (void *)MEMORY[0x1E4F2B370];
      uint64_t v29 = qword_1E9FC5250;
      [v26 doubleValue];
      v30 = objc_msgSend(v28, "quantityWithUnit:doubleValue:", v29);
      v31 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1E9FC5268 quantity:v30 startDate:v12 endDate:v12];
      [v13 addObjectFromPhone:v31];
    }
    id v32 = v11;
    v33 = v32;
    if (!self || [v32 asthmaSeverity] < 1 || self->_nextAsthmaAttackSampleTime >= a5) {
      goto LABEL_16;
    }
    [v33 timeIncrement];
    if (a5 - v34 <= self->_nextAsthmaAttackSampleTime) {
      self->_forcePEFR = 1;
    }
    if (self->_nextAsthmaAttackEndTime > a5)
    {
LABEL_16:

      v35 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v61 = v15;
    switch([v33 asthmaSeverity])
    {
      case 2:
        v36 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v37 = [v36 statisticsSampleGenerator];
        [v37 computeNoiseFromTime:a5 stdDev:0.7];
        double v39 = v38 + 4.66666667;
        double v40 = 0.1;
        goto LABEL_25;
      case 3:
        v36 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v37 = [v36 statisticsSampleGenerator];
        [v37 computeNoiseFromTime:a5 stdDev:0.7];
        double v39 = v41 + 2.33333333;
        double v40 = 0.2;
        goto LABEL_25;
      case 4:
        v36 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v37 = [v36 statisticsSampleGenerator];
        [v37 computeNoiseFromTime:a5 stdDev:0.3];
        double v39 = v42 + 1.2;
        double v40 = 0.35;
        goto LABEL_25;
      case 5:
        v36 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v37 = [v36 statisticsSampleGenerator];
        [v37 computeNoiseFromTime:a5 stdDev:0.3];
        double v39 = v43 + 0.0520833333;
        double v40 = 0.5;
LABEL_25:

        break;
      default:
        double v40 = 0.0;
        double v39 = 0.0;
        break;
    }
    v44 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v45 = [v44 statisticsSampleGenerator];
    [v45 computeNoiseFromTime:a5 stdDev:0.03125];
    self->_nextAsthmaAttackEndTime = fabs(v46) + a5;

    v47 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v48 = [v47 statisticsSampleGenerator];
    [v48 pseudoRandomDoubleFromTime:a5];
    if (v49 >= v40)
    {
    }
    else
    {
      v60 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v50 = [v60 sleepSampleGenerator];
      char v59 = [v50 isDemoPersonSleeping:v33 atTime:self->_nextAsthmaAttackEndTime];

      if ((v59 & 1) == 0)
      {
        self->_forcePEFR = 1;
LABEL_33:

        v35 = &unk_1F17EF090;
        id v54 = &unk_1F17EF090;
        v55 = (void *)MEMORY[0x1E4F2B370];
        v56 = [MEMORY[0x1E4F2B618] countUnit];
        v57 = objc_msgSend(v55, "quantityWithUnit:doubleValue:", v56, (double)(int)objc_msgSend(&unk_1F17EF090, "intValue"));

        v58 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1E9FC5270 quantity:v57 startDate:v12 endDate:v12];
        [v13 addObjectFromPhone:v58];

        objc_super v15 = v61;
        goto LABEL_17;
      }
    }
    self->_forcePEFR = 1;
    self->_nextAsthmaAttackSampleTime = v39 + a5;
    v51 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v52 = [v51 statisticsSampleGenerator];
    [v52 computeNoiseFromTime:a5 stdDev:0.0243055556];
    self->_nextAsthmaAttackEndTime = v39 + a5 + 0.107638889 + v53;

    for (;
          (-[HDDemoDataPathologySampleGenerator _isAsthmaAttackAllowedForDemoPerson:atTime:](self, v33, self->_nextAsthmaAttackSampleTime) & 1) == 0;
          self->_nextAsthmaAttackEndTime = self->_nextAsthmaAttackEndTime + 0.0104166667)
    {
      if (!-[HDDemoDataPathologySampleGenerator _isAsthmaAttackAllowedForDemoPerson:atTime:](self, v33, self->_nextAsthmaAttackEndTime))break; {
      self->_nextAsthmaAttackSampleTime = self->_nextAsthmaAttackSampleTime + 0.0104166667;
      }
    }
    goto LABEL_33;
  }
LABEL_18:
}

void __112__HDDemoDataPathologySampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F2B618] countUnit];
  v1 = (void *)_MergedGlobals_22;
  _MergedGlobals_22 = v0;

  uint64_t v2 = [MEMORY[0x1E4F2B618] literUnit];
  v3 = (void *)qword_1E9FC5248;
  qword_1E9FC5248 = v2;

  uint64_t v4 = [MEMORY[0x1E4F2B618] unitFromString:@"L/min"];
  objc_super v5 = (void *)qword_1E9FC5250;
  qword_1E9FC5250 = v4;

  uint64_t v6 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A810]];
  v7 = (void *)qword_1E9FC5258;
  qword_1E9FC5258 = v6;

  uint64_t v8 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A818]];
  double v9 = (void *)qword_1E9FC5260;
  qword_1E9FC5260 = v8;

  uint64_t v10 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A878]];
  id v11 = (void *)qword_1E9FC5268;
  qword_1E9FC5268 = v10;

  uint64_t v12 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A840]];
  id v13 = (void *)qword_1E9FC5270;
  qword_1E9FC5270 = v12;
}

- (id)spirometryForDemoPerson:(uint64_t)a3 atTime:(double)a4 type:
{
  id v7 = a2;
  if (a1)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    double v9 = [NSNumber numberWithInteger:a3];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];
    [v10 doubleValue];
    double v12 = v11;

    if (v12 >= a4)
    {
      if (a3 != 2 || !*(unsigned char *)(a1 + 32))
      {
        a1 = 0;
        goto LABEL_17;
      }
    }
    else if (a3 != 2 || !*(unsigned char *)(a1 + 32))
    {
      [v7 spirometrySampleTime];
      double v14 = v13 + a4;
      objc_super v15 = [(id)a1 demoDataGenerator];
      v16 = [v15 statisticsSampleGenerator];
      [v7 genericSampleTimeNoiseStdDev];
      [v16 computeNoiseFromTime:a4 stdDev:v17];
      double v19 = v14 + v18;

      v20 = [NSNumber numberWithDouble:v19];
      v21 = *(void **)(a1 + 40);
      v22 = [NSNumber numberWithInteger:a3];
      [v21 setObject:v20 forKeyedSubscript:v22];
    }
    uint64_t v23 = [(id)a1 demoDataGenerator];
    v24 = [v23 bodySampleGenerator];
    [v24 lastHeightInCm];
    -[HDDemoDataPathologySampleGenerator _computeSpirometryForDemoPerson:atTime:type:computeLowerLimitOfNormality:height:]((void *)a1, v7, a4);
    double v26 = v25;

    v27 = [(id)a1 demoDataGenerator];
    v28 = [v27 bodySampleGenerator];
    [v28 lastHeightInCm];
    -[HDDemoDataPathologySampleGenerator _computeSpirometryForDemoPerson:atTime:type:computeLowerLimitOfNormality:height:]((void *)a1, v7, a4);
    double v30 = v29;

    double v31 = (v26 - v30) / 2.3;
    id v32 = [(id)a1 demoDataGenerator];
    v33 = [v32 statisticsSampleGenerator];
    [v33 computeNoiseFromTime:0.0 stdDev:v31];
    double v35 = v26 - fabs(v34);

    v36 = [(id)a1 demoDataGenerator];
    v37 = [v36 statisticsSampleGenerator];
    [v37 computeNoiseFromTime:a4 stdDev:v31 * 0.2];
    double v39 = v38;

    double v40 = v35 + v39;
    if (a3 == 2)
    {
      if ([v7 asthmaSeverity] >= 2 && *(double *)(a1 + 48) <= a4 && *(double *)(a1 + 56) >= a4)
      {
        double v41 = [(id)a1 demoDataGenerator];
        double v42 = [v41 statisticsSampleGenerator];
        [v42 pseudoRandomDoubleFromTime:a4];
        double v40 = v40 * (v43 * 0.25 + 0.55);
      }
      if (*(unsigned char *)(a1 + 32)) {
        *(unsigned char *)(a1 + 32) = 0;
      }
    }
    a1 = [NSNumber numberWithDouble:v40];
  }
LABEL_17:

  return (id)a1;
}

- (void)_computeSpirometryForDemoPerson:(double)a3 atTime:type:computeLowerLimitOfNormality:height:
{
  id v5 = a2;
  uint64_t v6 = [a1 demoDataGenerator];
  id v7 = [v6 currentDateFromCurrentTime:a3];

  uint64_t v8 = [v5 birthDateComponents];
  HDDemoData_ageBetweenNSDateComponentsAndDate(v8, v7);

  [v5 biologicalSex];
}

- (uint64_t)_isAsthmaAttackAllowedForDemoPerson:(double)a3 atTime:
{
  id v5 = a2;
  uint64_t v6 = [a1 demoDataGenerator];
  id v7 = [v6 generatorState];
  if (([v7 isExercising] & 1) == 0)
  {
    uint64_t v8 = [a1 demoDataGenerator];
    double v9 = [v8 activitySampleGenerator];
    if (([v9 _isDemoPersonCoolingDown:v5 atTime:a3] & 1) == 0)
    {
      double v11 = [a1 demoDataGenerator];
      double v12 = [v11 sleepSampleGenerator];
      int v13 = [v12 isDemoPersonSleeping:v5 atTime:a3];

      uint64_t v10 = v13 ^ 1u;
      goto LABEL_6;
    }
  }
  uint64_t v10 = 0;
LABEL_6:

  return v10;
}

- (void).cxx_destruct
{
}

@end