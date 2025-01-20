@interface HDDemoDataHeartSampleGenerator
+ (BOOL)supportsSecureCoding;
- (HDDemoDataHeartSampleGenerator)init;
- (HDDemoDataHeartSampleGenerator)initWithCoder:(id)a3;
- (void)_computeRestingHeartRateForDemoPerson:(void *)a1 atTime:(void *)a2;
- (void)encodeWithCoder:(id)a3;
- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)setProfile:(id)a3 provenance:(id)a4;
- (void)setupWithDemoDataGenerator:(id)a3;
@end

@implementation HDDemoDataHeartSampleGenerator

- (HDDemoDataHeartSampleGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataHeartSampleGenerator;
  result = [(HDDemoDataBaseSampleGenerator *)&v3 init];
  if (result)
  {
    result->_nextRestingHeartRateSampleTime = 0.0;
    result->_nextWalkingHeartRateAverageSampleTime = 0.341666667;
    result->_nextElectrocardiogramSampleTime = 0.375;
    result->_nextElectrocardiogramClassification = 3;
    result->_lastRestingHeartRate = 0.0;
    result->_lastWalkingHeartRateAverage = 0.0;
    result->_nextVO2MaxSampleTime = 0.486805556;
    result->_lastVO2MaxValue = 0.0;
    result->_meanVO2MaxValue = 0.0;
    result->_lastVO2MaxWorkoutWasActive = 0;
    result->_lastHeartRateRecoveryValue = 0.0;
    result->_lastHeartRateRecoveryWorkoutWasActive = 0;
  }
  return result;
}

- (HDDemoDataHeartSampleGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDDemoDataHeartSampleGenerator;
  v5 = [(HDDemoDataBaseSampleGenerator *)&v15 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"HDDemoDataHeartSampleGeneratorNextRestingHeartRateSampleTimeKey"];
    v5->_nextRestingHeartRateSampleTime = v6;
    [v4 decodeDoubleForKey:@"HDDemoDataHeartSampleGeneratorNextWalkingHeartRateAverageSampleTimeKey"];
    v5->_nextWalkingHeartRateAverageSampleTime = v7;
    [v4 decodeDoubleForKey:@"HDDemoDataHeartSampleGeneratorNextElectrocardiogramSampleTimeKey"];
    v5->_nextElectrocardiogramSampleTime = v8;
    v5->_nextElectrocardiogramClassification = [v4 decodeIntegerForKey:@"HDDemoDataHeartSampleGeneratorNextElectrocardiogramClassificationKey"];
    [v4 decodeDoubleForKey:@"HDDemoDataHeartSampleGeneratorLastRestingHeartRateSampleKey"];
    v5->_lastRestingHeartRate = v9;
    [v4 decodeDoubleForKey:@"HDDemoDataHeartSampleGeneratorLastWalkingHeartRateAverageSampleKey"];
    v5->_lastWalkingHeartRateAverage = v10;
    [v4 decodeDoubleForKey:@"HDDemoDataHeartSampleGeneratorNextVO2MaxSampleTimeKey"];
    v5->_nextVO2MaxSampleTime = v11;
    [v4 decodeDoubleForKey:@"HDDemoDataHeartSampleGeneratorLastVO2MaxSampleKey"];
    v5->_lastVO2MaxValue = v12;
    v5->_lastVO2MaxWorkoutWasActive = [v4 decodeBoolForKey:@"HDDemoDataHeartSampleGeneratorLastVO2MaxWorkoutWasActiveKey"];
    [v4 decodeDoubleForKey:@"HDDemoDataHeartSampleGeneratorLastHeartRateRecoverySampleKey"];
    v5->_lastHeartRateRecoveryValue = v13;
    v5->_lastHeartRateRecoveryWorkoutWasActive = [v4 decodeBoolForKey:@"HDDemoDataHeartSampleGeneratorLastHeartRateRecoveryWorkoutWasActiveKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataHeartSampleGenerator;
  id v4 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HDDemoDataHeartSampleGeneratorNextRestingHeartRateSampleTimeKey", self->_nextRestingHeartRateSampleTime, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"HDDemoDataHeartSampleGeneratorNextWalkingHeartRateAverageSampleTimeKey" forKey:self->_nextWalkingHeartRateAverageSampleTime];
  [v4 encodeDouble:@"HDDemoDataHeartSampleGeneratorNextElectrocardiogramSampleTimeKey" forKey:self->_nextElectrocardiogramSampleTime];
  [v4 encodeInteger:self->_nextElectrocardiogramClassification forKey:@"HDDemoDataHeartSampleGeneratorNextElectrocardiogramClassificationKey"];
  [v4 encodeDouble:@"HDDemoDataHeartSampleGeneratorLastRestingHeartRateSampleKey" forKey:self->_lastRestingHeartRate];
  [v4 encodeDouble:@"HDDemoDataHeartSampleGeneratorLastWalkingHeartRateAverageSampleKey" forKey:self->_lastWalkingHeartRateAverage];
  [v4 encodeDouble:@"HDDemoDataHeartSampleGeneratorNextVO2MaxSampleTimeKey" forKey:self->_nextVO2MaxSampleTime];
  [v4 encodeDouble:@"HDDemoDataHeartSampleGeneratorLastVO2MaxSampleKey" forKey:self->_lastVO2MaxValue];
  [v4 encodeBool:self->_lastVO2MaxWorkoutWasActive forKey:@"HDDemoDataHeartSampleGeneratorLastVO2MaxWorkoutWasActiveKey"];
  [v4 encodeDouble:@"HDDemoDataHeartSampleGeneratorLastHeartRateRecoverySampleKey" forKey:self->_lastHeartRateRecoveryValue];
  [v4 encodeBool:self->_lastHeartRateRecoveryWorkoutWasActive forKey:@"HDDemoDataHeartSampleGeneratorLastHeartRateRecoveryWorkoutWasActiveKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setProfile:(id)a3 provenance:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)HDDemoDataHeartSampleGenerator;
  -[HDDemoDataBaseSampleGenerator setProfile:](&v4, sel_setProfile_, a3, a4);
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)HDDemoDataHeartSampleGenerator;
  id v4 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v18 setupWithDemoDataGenerator:v4];
  objc_super v5 = objc_msgSend(v4, "demoPerson", v18.receiver, v18.super_class);
  double v6 = [v4 generatorState];

  double v7 = [v6 currentDate];
  id v8 = v5;
  id v9 = v7;
  if (self)
  {
    double v10 = [v8 birthDateComponents];
    uint64_t v11 = HDDemoData_ageBetweenNSDateComponentsAndDate(v10, v9);

    uint64_t v12 = [v8 biologicalSex];
    if (v12 == 2)
    {
      double v13 = 20.0;
      if (v11 > 86) {
        goto LABEL_12;
      }
      double v14 = (double)v11;
      double v15 = 68.0;
      double v16 = -0.55;
    }
    else
    {
      if (v12 == 1)
      {
        double v13 = 18.0;
        if (v11 > 73) {
          goto LABEL_12;
        }
        double v14 = (double)v11;
        double v15 = 52.0;
      }
      else
      {
        double v13 = 20.0;
        if (v11 > 79) {
          goto LABEL_12;
        }
        double v14 = (double)v11;
        double v15 = 57.0;
      }
      double v16 = -0.46;
    }
    double v13 = v15 + v14 * v16;
  }
  else
  {
    double v13 = 0.0;
  }
LABEL_12:

  self->_meanVO2MaxValue = v13;
  if (![(HDDemoDataBaseSampleGenerator *)self createdFromNSKeyedUnarchiver])
  {
    self->_lastRestingHeartRate = (double)[v8 restingHeartRate];
    self->_lastWalkingHeartRateAverage = (double)[v8 walkingHeartRateAverage];
    self->_lastVO2MaxValue = self->_meanVO2MaxValue;
    [v8 heartRateRecovery];
    self->_lastHeartRateRecoveryValue = v17;
  }
}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (self)
  {
    id v9 = [v7 birthDateComponents];
    uint64_t v10 = HDDemoData_ageBetweenNSDateComponentsAndDate(v9, v8);

    if (v10 >= *MEMORY[0x1E4F2BCF8])
    {
      uint64_t v11 = [(HDDemoDataBaseSampleGenerator *)self profile];
      uint64_t v12 = [v11 profileExtensionsConformingToProtocol:&unk_1F180B2D8];

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v47;
        uint64_t v17 = *MEMORY[0x1E4F29D18];
LABEL_5:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v47 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = [*(id *)(*((void *)&v46 + 1) + 8 * v18) featureAvailabilityExtensionForFeatureIdentifier:v17];
          if (v19) {
            break;
          }
          if (v15 == ++v18)
          {
            uint64_t v15 = [v13 countByEnumeratingWithState:&v46 objects:v54 count:16];
            if (v15) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        v21 = (void *)v19;

        v22 = [MEMORY[0x1E4F1CA20] currentLocale];
        v23 = [v22 countryCode];

        id v45 = 0;
        v24 = [v21 onboardingEligibilityForCountryCode:v23 error:&v45];
        id v25 = v45;
        if (v25
          && (_HKInitializeLogging(),
              v26 = *MEMORY[0x1E4F29F30],
              os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)))
        {
          *(_DWORD *)buf = 138543618;
          v51 = self;
          __int16 v52 = 2114;
          id v53 = v25;
          _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "[%{public}@] Error while determining onboarding eligibility for Cardio Fitness %{public}@", buf, 0x16u);
          if (!v24) {
            goto LABEL_24;
          }
        }
        else if (!v24)
        {
          goto LABEL_24;
        }
        if (([v24 ineligibilityReasons] & 8) == 0)
        {
          id v27 = objc_alloc(MEMORY[0x1E4F2B2D8]);
          uint64_t v28 = [MEMORY[0x1E4F1C9C8] date];
          v29 = v23;
          v30 = (void *)v28;
          v43 = v29;
          uint64_t v31 = objc_msgSend(v27, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:", v17, 1, v28);

          v32 = [(HDDemoDataBaseSampleGenerator *)self profile];
          v33 = [v32 onboardingCompletionManager];
          id v44 = 0;
          v42 = (void *)v31;
          char v34 = [v33 insertOnboardingCompletion:v31 error:&v44];
          v35 = (HDDemoDataHeartSampleGenerator *)v44;

          _HKInitializeLogging();
          v36 = *MEMORY[0x1E4F29F30];
          v37 = *MEMORY[0x1E4F29F30];
          if (v34)
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v38 = "Completed Cardio Fitness onboarding";
              v39 = v36;
              os_log_type_t v40 = OS_LOG_TYPE_INFO;
              uint32_t v41 = 2;
LABEL_22:
              _os_log_impl(&dword_1BCB7D000, v39, v40, v38, buf, v41);
            }
          }
          else if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v51 = v35;
            v38 = "Failed to insert Cardio Fitness onboarding completion: %{public}@";
            v39 = v36;
            os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
            uint32_t v41 = 12;
            goto LABEL_22;
          }

          v23 = v43;
        }
LABEL_24:

        goto LABEL_25;
      }
LABEL_11:

      _HKInitializeLogging();
      v20 = *MEMORY[0x1E4F29F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Unable to find Cardio Fitness Feature Availability Provider", buf, 2u);
      }
LABEL_25:
    }
  }
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  v196[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  v191.receiver = self;
  v191.super_class = (Class)HDDemoDataHeartSampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v191 generateObjectsForDemoPerson:v11 fromTime:v12 toTime:v13 currentDate:a5 objectCollection:a5];
  if (qword_1EBA18CE8 != -1) {
    dispatch_once(&qword_1EBA18CE8, &__block_literal_global_141);
  }
  id v14 = v11;
  uint64_t v15 = v14;
  uint64_t v16 = (void *)MEMORY[0x1E4F2BAF8];
  if (!self)
  {

    id v176 = v15;
    v181 = 0;
LABEL_10:

    id v27 = v15;
    id v28 = v12;
    v29 = 0;
    v30 = 0;
    if (!self) {
      goto LABEL_36;
    }
    goto LABEL_23;
  }
  if (self->_nextRestingHeartRateSampleTime <= a5)
  {
    uint64_t v18 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    uint64_t v19 = [v18 statisticsSampleGenerator];
    [v15 genericSampleTimeNoiseStdDev];
    [v19 computeNoiseFromTime:a5 stdDev:v20];
    self->_nextRestingHeartRateSampleTime = v21 + a5 + 1.0;

    v22 = NSNumber;
    -[HDDemoDataHeartSampleGenerator _computeRestingHeartRateForDemoPerson:atTime:](self, v15);
    v23 = objc_msgSend(v22, "numberWithDouble:");

    v181 = v23;
    if (!v23) {
      goto LABEL_9;
    }
    [v23 doubleValue];
    self->_lastRestingHeartRate = v24;
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F2B370], "quantityWithUnit:doubleValue:", _MergedGlobals_5_0);
    id v25 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1EBA18CC0 quantity:v17 startDate:v12 endDate:v12];
    [v13 addObjectFromPhone:v25];
  }
  else
  {
    v181 = 0;
    uint64_t v17 = v14;
  }

LABEL_9:
  id v26 = v15;
  if (self->_nextWalkingHeartRateAverageSampleTime > a5) {
    goto LABEL_10;
  }
  uint64_t v31 = v26;
  v32 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v33 = [v32 statisticsSampleGenerator];
  [v31 genericSampleTimeNoiseStdDev];
  [v33 computeNoiseFromTime:a5 stdDev:v34];
  self->_nextWalkingHeartRateAverageSampleTime = v35 + a5 + 1.0;

  v36 = NSNumber;
  double lastWalkingHeartRateAverage = self->_lastWalkingHeartRateAverage;
  id v38 = v31;
  v39 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  os_log_type_t v40 = [v39 statisticsSampleGenerator];
  [v40 randomDoubleFromGenerator];
  double v42 = v41;
  [v38 heartRateSampleNoiseStdDev];
  double v44 = v43;

  double v45 = self->_lastWalkingHeartRateAverage;
  uint64_t v46 = [v38 walkingHeartRateAverage];
  uint64_t v47 = [v38 walkingHeartRateAverageMaxDailyDifference];
  uint64_t v48 = [v38 walkingHeartRateAverageMaxTotalDifference];

  double v49 = (double)v46 + (double)v48;
  double v50 = v45 + (double)v47;
  if (v50 >= lastWalkingHeartRateAverage + (v42 + -0.5) * v44) {
    double v50 = lastWalkingHeartRateAverage + (v42 + -0.5) * v44;
  }
  if (v45 - (double)v47 >= v50) {
    double v50 = v45 - (double)v47;
  }
  if (v49 >= v50) {
    double v49 = v50;
  }
  if ((double)v46 - (double)v48 >= v49) {
    double v49 = (double)v46 - (double)v48;
  }
  v29 = [v36 numberWithDouble:v49];

  if (v29)
  {
    [v29 doubleValue];
    self->_double lastWalkingHeartRateAverage = v51;
    objc_msgSend(MEMORY[0x1E4F2B370], "quantityWithUnit:doubleValue:", _MergedGlobals_5_0);
    __int16 v52 = v184 = v29;
    id v53 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1EBA18CC8 quantity:v52 startDate:v12 endDate:v12];
    [v13 addObjectFromPhone:v53];
    uint64_t v193 = *MEMORY[0x1E4F2BB28];
    v194 = &unk_1F17EEA00;
    v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v194 forKeys:&v193 count:1];
    uint64_t v55 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1EBA18CB8 quantity:v52 startDate:v12 endDate:v12 metadata:v54];
    [v13 addObjectFromPhone:v55];

    v29 = v184;
  }
  id v56 = v38;
  id v57 = v12;
  uint64_t v16 = (void *)MEMORY[0x1E4F2BAF8];
LABEL_23:
  if (self->_nextElectrocardiogramSampleTime <= a5)
  {
    v185 = v29;
    v58 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v59 = [v58 statisticsSampleGenerator];
    [v15 genericSampleTimeNoiseStdDev];
    [v59 computeNoiseFromTime:a5 stdDev:v60];
    self->_nextElectrocardiogramSampleTime = v61 + a5 + 60.0;

    unint64_t nextElectrocardiogramClassification = self->_nextElectrocardiogramClassification;
    id v63 = v15;
    if (nextElectrocardiogramClassification > 0xA) {
      v64 = 0;
    }
    else {
      v64 = *off_1E6303BB0[nextElectrocardiogramClassification];
    }
    id v179 = v12;
    v65 = [MEMORY[0x1E4F2AF98] builderFromDemoDataFile:v64 startDate:v12];
    v182 = v63;
    if (nextElectrocardiogramClassification - 2 >= 9 && nextElectrocardiogramClassification)
    {
      v67 = 0;
    }
    else
    {
      -[HDDemoDataHeartSampleGenerator _computeRestingHeartRateForDemoPerson:atTime:](self, v63);
      v67 = [MEMORY[0x1E4F2B370] _quantityWithBeatsPerMinute:v66 + 2.0 + (double)arc4random_uniform(9u)];
    }
    unint64_t v68 = nextElectrocardiogramClassification - 4;
    v178 = v15;
    if (nextElectrocardiogramClassification - 4 > 5)
    {
      uint64_t v69 = 1;
      uint64_t v70 = 1;
    }
    else
    {
      uint64_t v69 = qword_1BD32D158[v68];
      uint64_t v70 = qword_1BD32D188[v68];
    }
    v71 = v16;
    uint64_t v195 = *v16;
    v72 = [NSNumber numberWithUnsignedInteger:v70];
    v196[0] = v72;
    v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v196 forKeys:&v195 count:1];

    [v65 addClassification:nextElectrocardiogramClassification];
    if (v67) {
      [v65 addAverageHeartRate:v67];
    }
    v30 = [v65 finishWithDevice:0 metadata:v73];
    [v30 _setSymptomsStatus:v69];

    self->_unint64_t nextElectrocardiogramClassification = (self->_nextElectrocardiogramClassification | 0xFFFFFFFFFFFFFFFELL) + 5;
    v29 = v185;
    uint64_t v16 = v71;
    uint64_t v15 = v178;
    id v12 = v179;
  }
  else
  {
    v30 = 0;
  }
LABEL_36:
  v186 = v29;

  v183 = v30;
  if (v30)
  {
    [v13 addObjectFromWatch:v30];
    v74 = [v30 metadata];
    v75 = [v74 objectForKey:*v16];
    uint64_t v76 = [v75 integerValue];

    if (v76 != 1)
    {
      id v180 = v12;
      if (self)
      {
        v77 = (void *)MEMORY[0x1E4F2ACB0];
        v78 = (void *)MEMORY[0x1E4F2ACB8];
        uint64_t v79 = *MEMORY[0x1E4F29850];
        id v80 = v30;
        v81 = [v78 categoryTypeForIdentifier:v79];
        v82 = [v80 startDate];
        v83 = [v80 endDate];
        v84 = [v80 device];
        v85 = [v80 metadata];
        v177 = [v77 categorySampleWithType:v81 value:0 startDate:v82 endDate:v83 device:v84 metadata:v85];

        v86 = (void *)MEMORY[0x1E4F2ACB0];
        v87 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297B0]];
        v88 = [v80 startDate];
        v89 = [v80 endDate];
        v90 = [v80 device];
        v91 = [v80 metadata];

        v92 = [v86 categorySampleWithType:v87 value:0 startDate:v88 endDate:v89 device:v90 metadata:v91];

        v196[0] = v177;
        v196[1] = v92;
        v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:2];
      }
      else
      {
        v93 = 0;
      }
      id v94 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
      long long v187 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      long long v190 = 0u;
      id v95 = v93;
      uint64_t v96 = [v95 countByEnumeratingWithState:&v187 objects:v192 count:16];
      id v12 = v180;
      if (v96)
      {
        uint64_t v97 = v96;
        uint64_t v98 = *(void *)v188;
        do
        {
          for (uint64_t i = 0; i != v97; ++i)
          {
            if (*(void *)v188 != v98) {
              objc_enumerationMutation(v95);
            }
            v100 = *(void **)(*((void *)&v187 + 1) + 8 * i);
            objc_msgSend(v13, "addObjectFromWatch:", v100, v177);
            v101 = [v100 UUID];
            objc_msgSend(v94, "hk_appendBytesWithUUID:", v101);
          }
          uint64_t v97 = [v95 countByEnumeratingWithState:&v187 objects:v192 count:16];
        }
        while (v97);
      }

      v102 = [v183 UUID];
      [v13 setAssociatedObjectUUIDs:v94 forObjectUUID:v102];
    }
  }
  id v103 = v15;
  id v104 = v12;
  if (!self) {
    goto LABEL_57;
  }
  v105 = [v103 birthDateComponents];
  uint64_t v106 = HDDemoData_ageBetweenNSDateComponentsAndDate(v105, v104);

  if (v106 < *MEMORY[0x1E4F2BCF8]) {
    goto LABEL_57;
  }
  v107 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v108 = [v107 generatorState];

  if ([v108 isRunning] & 1) != 0 || (objc_msgSend(v108, "isWalking")) {
    int v109 = 1;
  }
  else {
    int v109 = [v108 isHiking];
  }
  if ((v108,
        BOOL lastVO2MaxWorkoutWasActive = self->_lastVO2MaxWorkoutWasActive,
        self->_BOOL lastVO2MaxWorkoutWasActive = v109,
        lastVO2MaxWorkoutWasActive)
    && !v109
    || self->_nextVO2MaxSampleTime <= a5)
  {
    v112 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v113 = [v112 statisticsSampleGenerator];
    [v103 vo2MaxSampleTimeNoiseStdDev];
    [v113 computeNoiseFromTime:a5 stdDev:v114];
    self->_nextVO2MaxSampleTime = v115 + a5 + 7.0;

    v116 = NSNumber;
    double lastVO2MaxValue = self->_lastVO2MaxValue;
    id v118 = v103;
    v119 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v120 = [v119 statisticsSampleGenerator];
    [v120 randomDoubleFromGenerator];
    double v122 = v121;
    [v118 vo2MaxValueStdDev];
    double v124 = v123;

    double v125 = self->_lastVO2MaxValue;
    double meanVO2MaxValue = self->_meanVO2MaxValue;
    [v118 vo2MaxValueMaxConsecutiveDifference];
    double v128 = v127;
    [v118 vo2MaxValueMaxTotalDifference];
    double v130 = v129;

    double v131 = meanVO2MaxValue - v130;
    double v132 = meanVO2MaxValue + v130;
    double v133 = v125 - v128;
    double v134 = v125 + v128;
    if (v125 + v128 >= lastVO2MaxValue + (v122 + -0.5) * v124) {
      double v134 = lastVO2MaxValue + (v122 + -0.5) * v124;
    }
    if (v133 < v134) {
      double v133 = v134;
    }
    if (v132 >= v133) {
      double v132 = v133;
    }
    if (v131 < v132) {
      double v131 = v132;
    }
    v111 = [v116 numberWithDouble:v131];
  }
  else
  {
LABEL_57:
    v111 = 0;
  }

  if (v111)
  {
    [v111 doubleValue];
    self->_double lastVO2MaxValue = v135;
    v136 = objc_msgSend(MEMORY[0x1E4F2B370], "quantityWithUnit:doubleValue:", qword_1EBA18CD0);
    v137 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1EBA18CD8 quantity:v136 startDate:v104 endDate:v104];
    [v13 addObjectFromWatch:v137];

    id v138 = v103;
    id v139 = v104;
  }
  else
  {
    id v140 = v103;
    id v141 = v104;
    if (!self)
    {
LABEL_73:
      v148 = 0;
      goto LABEL_88;
    }
  }
  v142 = objc_msgSend(v103, "birthDateComponents", v177);

  if (!v142) {
    goto LABEL_73;
  }
  v143 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v144 = [v143 generatorState];

  v145 = [v144 workoutConfiguration];
  char v146 = [v145 indoor];

  if (v146)
  {
    char v147 = 0;
  }
  else if ([v144 isRunning])
  {
    char v147 = 1;
  }
  else
  {
    char v147 = [v144 isWalking];
  }

  v148 = 0;
  BOOL lastHeartRateRecoveryWorkoutWasActive = self->_lastHeartRateRecoveryWorkoutWasActive;
  self->_BOOL lastHeartRateRecoveryWorkoutWasActive = v147;
  if (lastHeartRateRecoveryWorkoutWasActive && (v147 & 1) == 0)
  {
    v150 = NSNumber;
    double lastHeartRateRecoveryValue = self->_lastHeartRateRecoveryValue;
    id v152 = v103;
    v153 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v154 = [v153 statisticsSampleGenerator];
    [v154 randomDoubleFromGenerator];
    double v156 = v155;
    [v152 heartRateRecoveryValueStdDev];
    double v158 = v157;

    double v159 = self->_lastHeartRateRecoveryValue;
    [v152 heartRateRecovery];
    double v161 = v160;
    [v152 heartRateRecoveryValueMaxConsecutiveDifference];
    double v163 = v162;
    [v152 heartRateRecoveryValueMaxTotalDifference];
    double v165 = v164;

    double v166 = v161 - v165;
    double v167 = v161 + v165;
    double v168 = v159 - v163;
    double v169 = v159 + v163;
    double v170 = round(lastHeartRateRecoveryValue + (v156 + -0.5) * v158);
    if (v159 + v163 >= v170) {
      double v169 = v170;
    }
    if (v168 < v169) {
      double v168 = v169;
    }
    if (v167 >= v168) {
      double v167 = v168;
    }
    if (v166 < v167) {
      double v166 = v167;
    }
    v148 = [v150 numberWithDouble:v166];
  }
LABEL_88:

  if (v148)
  {
    [v148 doubleValue];
    self->_double lastHeartRateRecoveryValue = v171;
    id v172 = v104;
    v173 = [v172 dateByAddingTimeInterval:60.0];
    v174 = [MEMORY[0x1E4F2B370] quantityWithUnit:_MergedGlobals_5_0 doubleValue:self->_lastHeartRateRecoveryValue];
    v175 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1EBA18CE0 quantity:v174 startDate:v172 endDate:v173 metadata:0];

    [v13 addObjectFromWatch:v175];
  }
}

void __108__HDDemoDataHeartSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F2B618] unitFromString:@"count/min"];
  v1 = (void *)_MergedGlobals_5_0;
  _MergedGlobals_5_0 = v0;

  uint64_t v2 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  objc_super v3 = (void *)qword_1EBA18CB8;
  qword_1EBA18CB8 = v2;

  uint64_t v4 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8A0]];
  objc_super v5 = (void *)qword_1EBA18CC0;
  qword_1EBA18CC0 = v4;

  uint64_t v6 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A930]];
  id v7 = (void *)qword_1EBA18CC8;
  qword_1EBA18CC8 = v6;

  uint64_t v8 = [MEMORY[0x1E4F2B618] unitFromString:@"ml/kg*min"];
  id v9 = (void *)qword_1EBA18CD0;
  qword_1EBA18CD0 = v8;

  uint64_t v10 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A918]];
  id v11 = (void *)qword_1EBA18CD8;
  qword_1EBA18CD8 = v10;

  uint64_t v12 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A830]];
  id v13 = (void *)qword_1EBA18CE0;
  qword_1EBA18CE0 = v12;
}

- (void)_computeRestingHeartRateForDemoPerson:(void *)a1 atTime:(void *)a2
{
  id v3 = a2;
  uint64_t v4 = [a1 demoDataGenerator];
  objc_super v5 = [v4 statisticsSampleGenerator];
  [v5 randomDoubleFromGenerator];
  [v3 heartRateSampleNoiseStdDev];

  [v3 restingHeartRate];
  [v3 restingHeartRateMaxDailyDifference];
  [v3 restingHeartRateMaxTotalDifference];
}

@end