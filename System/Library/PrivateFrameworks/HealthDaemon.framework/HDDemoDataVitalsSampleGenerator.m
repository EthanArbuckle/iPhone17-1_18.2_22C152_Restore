@interface HDDemoDataVitalsSampleGenerator
+ (BOOL)supportsSecureCoding;
- (HDDemoDataVitalsSampleGenerator)init;
- (HDDemoDataVitalsSampleGenerator)initWithCoder:(id)a3;
- (double)_computeBodyTempInCelsiusForDemoPerson:(id)a3 atTime:(double)a4 addNoise:(BOOL)a5;
- (uint64_t)_computeBloodPressureForDemoPerson:(double)a3 atTime:(double)a4 baseBloodPressure:(double)a5 stdDev:;
- (uint64_t)_computeMaxHRForDemoPerson:(double)a3 atTime:;
- (void)encodeWithCoder:(id)a3;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)setupWithDemoDataGenerator:(id)a3;
@end

@implementation HDDemoDataVitalsSampleGenerator

- (HDDemoDataVitalsSampleGenerator)init
{
  v7.receiver = self;
  v7.super_class = (Class)HDDemoDataVitalsSampleGenerator;
  v2 = [(HDDemoDataBaseSampleGenerator *)&v7 init];
  v3 = v2;
  if (v2)
  {
    diurnalBPVariationTable = v2->_diurnalBPVariationTable;
    v2->_diurnalBPVariationTable = 0;

    diurnalTempVariationTable = v3->_diurnalTempVariationTable;
    v3->_diurnalTempVariationTable = 0;

    v3->_nextHeartRateSampleTime = 0.0;
    v3->_nextRespirationRateSampleTime = 0.0;
    v3->_lastRespirationRateGenerationTime = 0.0;
    v3->_nextBloodPressureSampleTime = 0.0;
    v3->_nextBodyTempSampleTime = 0.0;
    v3->_nextOxygenSaturationSampleTime = 0.0;
    v3->_nextPeripheralPerfusionIndexSampleTime = 0.0;
    v3->_lastPeripheralPerfusionIndexValue = 0.0;
  }
  return v3;
}

- (HDDemoDataVitalsSampleGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDDemoDataVitalsSampleGenerator;
  v5 = [(HDDemoDataBaseSampleGenerator *)&v15 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"HDDemoDataVitalsSampleHelperNextHeartRateSampleTimeKey"];
    v5->_nextHeartRateSampleTime = v6;
    [v4 decodeDoubleForKey:@"HDDemoDataVitalsSampleHelperNextRespirationRateSampleTimeKey"];
    v5->_nextRespirationRateSampleTime = v7;
    [v4 decodeDoubleForKey:@"HDDemoDataVitalsSampleHelperLastRespirationRateGenerationTimeKey"];
    v5->_lastRespirationRateGenerationTime = v8;
    [v4 decodeDoubleForKey:@"HDDemoDataVitalsSampleHelperNextBloodPressureSampleTimeKey"];
    v5->_nextBloodPressureSampleTime = v9;
    [v4 decodeDoubleForKey:@"HDDemoDataVitalsSampleHelperNextBodyTempSampleTimeKey"];
    v5->_nextBodyTempSampleTime = v10;
    [v4 decodeDoubleForKey:@"HDDemoDataVitalsSampleHelperNextOxygenSaturationSampleTimeKey"];
    v5->_nextOxygenSaturationSampleTime = v11;
    [v4 decodeDoubleForKey:@"HDDemoDataVitalsSampleHelperNextPeripheralPerfusionIndexSampleTimeKey"];
    v5->_nextPeripheralPerfusionIndexSampleTime = v12;
    [v4 decodeDoubleForKey:@"HDDemoDataVitalsSampleHelperLastPeripheralPerfusionIndexValueKey"];
    v5->_lastPeripheralPerfusionIndexValue = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataVitalsSampleGenerator;
  id v4 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HDDemoDataVitalsSampleHelperNextHeartRateSampleTimeKey", self->_nextHeartRateSampleTime, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"HDDemoDataVitalsSampleHelperNextRespirationRateSampleTimeKey" forKey:self->_nextRespirationRateSampleTime];
  [v4 encodeDouble:@"HDDemoDataVitalsSampleHelperLastRespirationRateGenerationTimeKey" forKey:self->_lastRespirationRateGenerationTime];
  [v4 encodeDouble:@"HDDemoDataVitalsSampleHelperNextBloodPressureSampleTimeKey" forKey:self->_nextBloodPressureSampleTime];
  [v4 encodeDouble:@"HDDemoDataVitalsSampleHelperNextBodyTempSampleTimeKey" forKey:self->_nextBodyTempSampleTime];
  [v4 encodeDouble:@"HDDemoDataVitalsSampleHelperNextOxygenSaturationSampleTimeKey" forKey:self->_nextOxygenSaturationSampleTime];
  [v4 encodeDouble:@"HDDemoDataVitalsSampleHelperNextPeripheralPerfusionIndexSampleTimeKey" forKey:self->_nextPeripheralPerfusionIndexSampleTime];
  [v4 encodeDouble:@"HDDemoDataVitalsSampleHelperLastPeripheralPerfusionIndexValueKey" forKey:self->_lastPeripheralPerfusionIndexValue];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataVitalsSampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v6 setupWithDemoDataGenerator:a3];
  diurnalBPVariationTable = self->_diurnalBPVariationTable;
  self->_diurnalBPVariationTable = (NSArray *)&unk_1F17EAE90;

  diurnalTempVariationTable = self->_diurnalTempVariationTable;
  self->_diurnalTempVariationTable = (NSArray *)&unk_1F17EAEA8;
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  v360[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  v354.receiver = self;
  v354.super_class = (Class)HDDemoDataVitalsSampleGenerator;
  id v349 = a7;
  -[HDDemoDataBaseSampleGenerator generateObjectsForDemoPerson:fromTime:toTime:currentDate:objectCollection:](&v354, sel_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection_, v11, v12, a5, a5);
  if (qword_1E9FC52E0 != -1) {
    dispatch_once(&qword_1E9FC52E0, &__block_literal_global_247);
  }
  double v13 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v14 = [v13 generatorState];
  v344 = self;
  if ([v14 isDoingHIIT])
  {
    char v15 = 1;
  }
  else
  {
    v16 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v17 = [v16 generatorState];
    if ([v17 isDoingYoga])
    {
      char v15 = 1;
    }
    else
    {
      v18 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      [v18 generatorState];
      v20 = v19 = self;
      if ([v20 isDoingElliptical])
      {
        char v15 = 1;
      }
      else
      {
        v21 = [(HDDemoDataBaseSampleGenerator *)v19 demoDataGenerator];
        id obj = [v21 generatorState];
        if ([obj isWalking])
        {
          char v15 = 1;
        }
        else
        {
          v341 = [(HDDemoDataBaseSampleGenerator *)v19 demoDataGenerator];
          v339 = [v341 generatorState];
          if ([v339 isHiking])
          {
            char v15 = 1;
          }
          else
          {
            v336 = [(HDDemoDataBaseSampleGenerator *)v19 demoDataGenerator];
            v334 = [v336 generatorState];
            if ([v334 isRunning])
            {
              char v15 = 1;
            }
            else
            {
              v332 = [(HDDemoDataBaseSampleGenerator *)v19 demoDataGenerator];
              v330 = [v332 generatorState];
              if ([v330 isSwimming])
              {
                char v15 = 1;
              }
              else
              {
                v329 = [(HDDemoDataBaseSampleGenerator *)v19 demoDataGenerator];
                v328 = [v329 generatorState];
                if ([v328 isCoreTraining])
                {
                  char v15 = 1;
                }
                else
                {
                  v327 = [(HDDemoDataBaseSampleGenerator *)v19 demoDataGenerator];
                  v326 = [v327 generatorState];
                  if ([v326 isDancing])
                  {
                    char v15 = 1;
                  }
                  else
                  {
                    v325 = [(HDDemoDataBaseSampleGenerator *)v19 demoDataGenerator];
                    v324 = [v325 generatorState];
                    if ([v324 isFunctionalStrengthTraining])
                    {
                      char v15 = 1;
                    }
                    else
                    {
                      v323 = [(HDDemoDataBaseSampleGenerator *)v19 demoDataGenerator];
                      v322 = [v323 generatorState];
                      if ([v322 isCoolingDown])
                      {
                        char v15 = 1;
                      }
                      else
                      {
                        v321 = [(HDDemoDataBaseSampleGenerator *)v19 demoDataGenerator];
                        v320 = [v321 generatorState];
                        char v15 = [v320 isUnderwaterDiving];
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      self = v344;
    }
  }
  v22 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v23 = [v22 activitySampleGenerator];
  char v24 = [v23 _isDemoPersonInWorkoutRecovery:v11 atTime:a5];

  v25 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v26 = [v25 mindfulnessSampleGenerator];
  char v27 = [v26 didGenerateMindfulnessMinute];

  v28 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v29 = [v28 sleepSampleGenerator];
  char v30 = [v29 isDemoPersonSleeping:v11 atTime:a5];

  id v343 = v12;
  if ((v30 & 1) == 0 && (v27 & 1) == 0 && (v24 & 1) == 0 && (v15 & 1) == 0)
  {
    id v31 = v11;
    v32 = v31;
    if (self && self->_nextHeartRateSampleTime <= a5)
    {
      [v31 heartRateSampleFrequency];
      double v38 = v37;
      v39 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v40 = [v39 statisticsSampleGenerator];
      [v32 heartRateSampleFrequencyStdDev];
      [v40 computeNoiseFromTime:a5 stdDev:v41];
      self->_nextHeartRateSampleTime = v38 + v42 + self->_nextHeartRateSampleTime;

      id v43 = v32;
      v44 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v45 = [v44 statisticsSampleGenerator];
      [v43 heartRateSampleNoiseStdDev];
      [v45 computeNoiseFromTime:a5 stdDev:v46];
      double v48 = v47;

      double v49 = (double)-[HDDemoDataVitalsSampleGenerator _computeMaxHRForDemoPerson:atTime:](self, v43, a5);
      v50 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v51 = [v50 generatorState];
      int v52 = [v51 isExercising];

      if (v52)
      {
        double v53 = (double)-[HDDemoDataVitalsSampleGenerator _computeMaxHRForDemoPerson:atTime:](self, v43, a5);
        [v43 exerciseIntensityPercentage];
        double v55 = v54;
        v56 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v57 = [v56 statisticsSampleGenerator];
        [v57 computeNoiseFromTime:a5 stdDev:0.05];
        double v59 = v48 + v58 + v53 * v55;

        uint64_t v60 = 6;
      }
      else
      {
        v61 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v62 = [v61 activitySampleGenerator];
        [v43 heartRateSampleFrequency];
        int v64 = [v62 _isDemoPersonWalking:v43 atTime:a5 samplePeriod:v63];

        v65 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v66 = [v65 activitySampleGenerator];
        v67 = v66;
        if (v64)
        {
          v68 = [v66 _computeFlightsClimbedForDemoPerson:v43 atTime:a5];

          double v69 = (double)[v43 restingHeartRate];
          v70 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
          v71 = [v70 statisticsSampleGenerator];
          [v71 randomDoubleFromGenerator];
          double v73 = v72;

          uint64_t v60 = 0;
          if (v68) {
            double v74 = 1.4;
          }
          else {
            double v74 = 1.3;
          }
          double v59 = v48 + v69 * (v74 + v73 * 0.2);
        }
        else
        {
          int v75 = [v66 _isDemoPersonCoolingDown:v43 atTime:a5];

          if (v75)
          {
            v76 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
            v77 = [v76 activitySampleGenerator];
            [v77 _computePercentCooledForDemoPerson:v43 atTime:a5];
            double v79 = v78;

            double v80 = (double)[v43 restingHeartRate];
            double v81 = v49 - (double)[v43 restingHeartRate];
            [v43 exerciseIntensityPercentage];
            double v59 = v80 + v82 * v81 * (1.0 - v79);
            uint64_t v60 = 2;
          }
          else
          {
            double v59 = v48 + (double)[v43 restingHeartRate];
            v83 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
            v84 = [v83 statisticsSampleGenerator];
            [v84 pseudoRandomDoubleFromTime:a5];
            double v86 = v85;

            if (v86 >= 20.0) {
              uint64_t v60 = 0;
            }
            else {
              uint64_t v60 = 3;
            }
          }
        }
      }
      v87 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v88 = [v87 foodSampleGenerator];
      int v89 = [v88 _isDemoPersonConsumingCaffeine:v43 atTime:a5];

      if (v89)
      {
        v90 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v91 = [v90 statisticsSampleGenerator];
        [v91 computeNoiseFromTime:a5 stdDev:3.0];
        double v59 = v59 + fabs(v92) + 4.0;
      }
      if (v59 <= v49) {
        double v93 = v59;
      }
      else {
        double v93 = v49;
      }
      if (v93 <= 55.0) {
        double v93 = (double)(arc4random_uniform(0xFu) + 45);
      }
      double v94 = floor(v93);

      if (v94 > 0.0)
      {
        v95 = [MEMORY[0x1E4F2B370] quantityWithUnit:_MergedGlobals_15_0 doubleValue:v94];
        v96 = (void *)MEMORY[0x1E4F2B388];
        uint64_t v97 = qword_1E9FC52A0;
        uint64_t v359 = *MEMORY[0x1E4F2BB28];
        v98 = [NSNumber numberWithInteger:v60];
        v360[0] = v98;
        v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v360 forKeys:&v359 count:1];
        v100 = [v96 quantitySampleWithType:v97 quantity:v95 startDate:v12 endDate:v12 metadata:v99];

        [v349 addObjectFromWatch:v100];
      }
      id v101 = v43;
      goto LABEL_67;
    }
  }
  id v33 = v11;
  if (!self)
  {
    double v34 = 0.0;
    char v35 = 1;
    double v36 = 0.0;
    goto LABEL_70;
  }
LABEL_67:
  if (self->_nextBloodPressureSampleTime > a5)
  {

    id v102 = v11;
    goto LABEL_75;
  }
  v103 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v104 = [v103 statisticsSampleGenerator];
  [v11 bloodPressureSampleFrequency];
  double v106 = v105;
  [v11 genericSampleTimeNoiseStdDev];
  [v104 computeStatisticalTimeFromCurrentTime:a5 mean:v106 stdDev:v107];
  self->_nextBloodPressureSampleTime = v108 + self->_nextBloodPressureSampleTime;

  double v109 = (double)[v11 restingSystolicBloodPressure];
  [v11 restingSystolicBloodPressureSampleNoiseStdDev];
  double v36 = (double)-[HDDemoDataVitalsSampleGenerator _computeBloodPressureForDemoPerson:atTime:baseBloodPressure:stdDev:]((id *)&self->super.super.isa, v11, a5, v109, v110);
  double v111 = (double)[v11 restingDiastolicBloodPressure];
  [v11 restingDiastolicBloodPressureSampleNoiseStdDev];
  char v35 = 0;
  double v34 = (double)-[HDDemoDataVitalsSampleGenerator _computeBloodPressureForDemoPerson:atTime:baseBloodPressure:stdDev:]((id *)&self->super.super.isa, v11, a5, v111, v112);
LABEL_70:

  if (v36 == -2147483650.0 || v34 == -2147483650.0)
  {
    id v122 = v11;
    if (v35) {
      goto LABEL_73;
    }
  }
  else
  {
    [MEMORY[0x1E4F2B370] quantityWithUnit:qword_1E9FC5288 doubleValue:v36];
    v113 = char objc = v35;
    v114 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1E9FC52B0 quantity:v113 startDate:v12 endDate:v12];
    [v349 addObjectFromPhone:v114];
    v115 = [MEMORY[0x1E4F2B370] quantityWithUnit:qword_1E9FC5288 doubleValue:v34];
    v116 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1E9FC52B8 quantity:v115 startDate:v12 endDate:v12];
    [v349 addObjectFromPhone:v116];
    v117 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v114, v116, 0);
    v118 = [MEMORY[0x1E4F2AE50] correlationWithType:qword_1E9FC52C0 startDate:v12 endDate:v12 objects:v117];
    self = v344;
    [v349 addObjectFromPhone:v118];

    id v119 = v11;
    if (objc)
    {
LABEL_73:
      v120 = 0;
      char v121 = 1;
      goto LABEL_105;
    }
  }
LABEL_75:
  id v123 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_nextRespirationRateSampleTime <= a5)
  {
    v124 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v125 = [v124 sleepSampleGenerator];
    int v126 = [v125 isDemoPersonSleeping:v11 atTime:a5];

    if (!v126
      || (double lastRespirationRateGenerationTime = self->_lastRespirationRateGenerationTime,
          lastRespirationRateGenerationTime == 0.0)
      || (uint64_t v128 = (uint64_t)(lastRespirationRateGenerationTime * 86400.0 / 60.0),
          uint64_t v129 = (uint64_t)(a5 * 86400.0 / 60.0),
          v128 >= v129))
    {
LABEL_100:
      v179 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v180 = [v179 sleepSampleGenerator];
      if ([v180 isDemoPersonSleeping:v11 atTime:a5]) {
        [v11 restingRespirationRateSampleFrequencyDuringSleep];
      }
      else {
        [v11 restingRespirationRateSampleFrequency];
      }
      double v182 = v181;

      self->_nextRespirationRateSampleTime = v182 + self->_nextRespirationRateSampleTime;
      self->_double lastRespirationRateGenerationTime = a5;
      v120 = (void *)[v123 copy];
      goto LABEL_104;
    }
    double v130 = 0.5;
    while (1)
    {
      id v131 = v11;
      v132 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v133 = [v132 statisticsSampleGenerator];
      [v131 restingRespirationRateSampleNoiseStdDev];
      [v133 computeNoiseFromTime:(double)v128 * 60.0 * 0.0000115740741 stdDev:v134];
      double v136 = v135;

      v137 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v138 = [v137 sleepSampleGenerator];
      int v139 = [v138 isDemoPersonSleeping:v131 atTime:(double)v128 * 60.0 * 0.0000115740741];

      v140 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v141 = v140;
      if (v139)
      {
        v142 = [v140 statisticsSampleGenerator];
        [v131 restingRespirationRateSampleNoiseStdDev];
        objc_msgSend(v142, "computeNoiseFromTime:stdDev:", (double)v128 * 60.0 * 0.0000115740741, vabdd_f64(v143, (double)(arc4random() & 0x7FFFFFFF) / 2147483650.0 * (v143 + v143) + 0.0));
        double v136 = v144;

        uint64_t v145 = [v131 restingRespirationRate];
        double v146 = (double)(arc4random() & 0x7FFFFFFF) / 2147483650.0 * 2.0 + -1.0 + (double)v145;
        double v147 = 1.15;
      }
      else
      {
        v148 = [v140 generatorState];
        int v149 = [v148 isExercising];

        if (v149)
        {
          double v146 = (double)[v131 restingRespirationRate];
          double v147 = 1.5;
        }
        else
        {
          v150 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
          v151 = [v150 activitySampleGenerator];
          [v131 restingRespirationRateSampleFrequency];
          int v153 = [v151 _isDemoPersonWalking:v131 atTime:(double)v128 * 60.0 * 0.0000115740741 samplePeriod:v152];

          v154 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
          v155 = [v154 activitySampleGenerator];
          v156 = v155;
          double v157 = (double)v128 * 60.0 * 0.0000115740741;
          if (!v153)
          {
            int v159 = [v155 _isDemoPersonCoolingDown:v131 atTime:v157];

            if (v159)
            {
              v160 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
              v161 = [v160 activitySampleGenerator];
              [v161 _computePercentCooledForDemoPerson:v131 atTime:(double)v128 * 60.0 * 0.0000115740741];
              double v163 = v162;

              double v130 = 0.5;
              double v164 = (1.0 - v163) * ((double)[v131 restingRespirationRate] * 0.5) * 0.5;
              double v165 = v164 + (double)[v131 restingRespirationRate];
            }
            else
            {
              double v165 = (double)[v131 restingRespirationRate];
            }
            double v166 = v136 + v165;
            goto LABEL_94;
          }
          v158 = [v155 _computeFlightsClimbedForDemoPerson:v131 atTime:v157];

          double v146 = (double)[v131 restingRespirationRate];
          if (v158) {
            double v147 = 1.3;
          }
          else {
            double v147 = 1.2;
          }
        }
      }
      double v166 = v136 + v146 * v147;
LABEL_94:

      v167 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v168 = [v167 sleepSampleGenerator];
      int v169 = [v168 isDemoPersonSleeping:v131 atTime:(double)v128 * 60.0 * 0.0000115740741];

      if (v169)
      {
        v170 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v171 = [v170 generatorState];
        v172 = [v171 firstSampleDate];
        v173 = [v172 dateByAddingTimeInterval:(double)v128 * 60.0 * 0.0000115740741 * 86400.0];

        v174 = [HDDemoDataRespirationRate alloc];
        v175 = [NSNumber numberWithDouble:floor(v166 + v166) * v130];
        id v176 = v173;
        id v177 = v175;
        if (v174)
        {
          v355.receiver = v174;
          v355.super_class = (Class)HDDemoDataRespirationRate;
          id v178 = [(HDDemoDataBaseSampleGenerator *)&v355 init];
          v174 = (HDDemoDataRespirationRate *)v178;
          if (v178)
          {
            objc_storeStrong((id *)v178 + 1, v173);
            objc_storeStrong((id *)&v174->_rate, v175);
          }
        }

        [v123 addObject:v174];
        self = v344;
      }
      v128 += 10;
      if (v128 >= v129) {
        goto LABEL_100;
      }
    }
  }
  v120 = 0;
LABEL_104:

  char v121 = 0;
LABEL_105:

  v340 = v120;
  char v342 = v121;
  if ([v120 count])
  {
    id v337 = v11;
    long long v352 = 0u;
    long long v353 = 0u;
    long long v350 = 0u;
    long long v351 = 0u;
    id obja = v120;
    uint64_t v183 = [obja countByEnumeratingWithState:&v350 objects:v358 count:16];
    if (v183)
    {
      uint64_t v184 = v183;
      uint64_t v185 = *(void *)v351;
      do
      {
        for (uint64_t i = 0; i != v184; ++i)
        {
          if (*(void *)v351 != v185) {
            objc_enumerationMutation(obja);
          }
          v187 = *(void **)(*((void *)&v350 + 1) + 8 * i);
          v188 = (void *)MEMORY[0x1E4F2B370];
          uint64_t v189 = _MergedGlobals_15_0;
          v190 = [v187 rate];
          [v190 doubleValue];
          v191 = objc_msgSend(v188, "quantityWithUnit:doubleValue:", v189);

          v192 = (void *)MEMORY[0x1E4F2B388];
          uint64_t v193 = qword_1E9FC52A8;
          v194 = [v187 date];
          v195 = [v187 date];
          v196 = [v192 quantitySampleWithType:v193 quantity:v191 startDate:v194 endDate:v195];

          [v349 addObjectFromWatch:v196];
        }
        uint64_t v184 = [obja countByEnumeratingWithState:&v350 objects:v358 count:16];
      }
      while (v184);
    }

    id v12 = v343;
    self = v344;
    id v11 = v337;
    v120 = v340;
    char v121 = v342;
  }
  id v197 = v11;
  v198 = v197;
  if (v121) {
    goto LABEL_117;
  }
  if (self->_nextBodyTempSampleTime > a5) {
    goto LABEL_117;
  }
  [v197 bodyTempSampleFrequency];
  double v200 = v199;
  v201 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v202 = [v201 statisticsSampleGenerator];
  [v202 computeNoiseFromTime:a5 stdDev:0.0416666667];
  self->_nextBodyTempSampleTime = v200 + v203 + self->_nextBodyTempSampleTime;

  [(HDDemoDataVitalsSampleGenerator *)self _computeBodyTempInCelsiusForDemoPerson:v198 atTime:1 addNoise:a5];
  if (v204 == -2147483650.0)
  {
LABEL_117:
    v205 = 0;
    v206 = v198;
  }
  else
  {
    v205 = objc_msgSend(NSNumber, "numberWithDouble:");

    if (!v205) {
      goto LABEL_119;
    }
    v216 = (void *)MEMORY[0x1E4F2B370];
    uint64_t v217 = qword_1E9FC5290;
    [v205 doubleValue];
    v206 = objc_msgSend(v216, "quantityWithUnit:doubleValue:", v217);
    v218 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1E9FC52C8 quantity:v206 startDate:v12 endDate:v12];
    [v349 addObjectFromPhone:v218];
  }
LABEL_119:
  id objb = v205;
  if ([v198 resultsTrackingType] == 2 || HKFeatureFlagBloodOxygenSaturationEnabled())
  {
    id v207 = v198;
    id v338 = v12;
    if ((v121 & 1) != 0 || self->_nextOxygenSaturationSampleTime > a5) {
      goto LABEL_129;
    }
    v208 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v209 = [v208 sleepSampleGenerator];
    int v210 = [v209 isDemoPersonSleeping:v207 atTime:a5];

    v211 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v212 = [v211 statisticsSampleGenerator];
    [v212 pseudoRandomDoubleFromTime:a5];
    double v214 = v213;
    if (v210) {
      [v207 oxygenSaturationMeasuringSuccessRateDuringSleep];
    }
    else {
      [v207 oxygenSaturationMeasuringSuccessRate];
    }
    double v219 = v215;

    if (v214 > v219)
    {
LABEL_129:
      v220 = 0;
      v221 = v338;
    }
    else
    {
      [v207 oxygenSaturationSampleFrequency];
      double v223 = v222 + a5;
      v224 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v225 = [v224 statisticsSampleGenerator];
      [v225 computeNoiseFromTime:a5 stdDev:0.00208333333];
      self->_nextOxygenSaturationSampleTime = v223 + v226;

      [v207 oxygenSaturationMean];
      double v228 = v227;
      [v207 oxygenSaturationStdDev];
      double v230 = v229;
      v231 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v232 = [v231 generatorState];
      uint64_t v233 = [v232 calendarDay];

      if (v233 == 7)
      {
        v234 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        v235 = [MEMORY[0x1E4F1C9C8] date];
        v236 = [v234 dateByAddingUnit:16 value:-14 toDate:v235 options:0];

        v221 = v338;
        if (objc_msgSend(v338, "hk_isAfterDate:", v236))
        {
          [v207 oxygenSaturationMeanAtElevation];
          double v228 = v237;
          [v207 oxygenSaturationStdDevAtElevation];
          double v230 = v238;
        }
      }
      else
      {
        v221 = v338;
      }
      v239 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v240 = [v239 statisticsSampleGenerator];
      [v240 computeNoiseFromTime:a5 stdDev:v230];
      double v242 = v241;

      v243 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v244 = [v243 generatorState];
      int v245 = [v244 isExercising];

      double v246 = v228 + -1.0;
      if (!v245) {
        double v246 = v228;
      }
      double v247 = v242 + v246;
      v248 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v249 = [v248 sleepSampleGenerator];
      int v250 = [v249 isDemoPersonSleeping:v207 atTime:a5];

      double v251 = 2.0;
      if (v250) {
        double v251 = -3.0;
      }
      double v252 = ceil(v247 + v251);
      if (v252 > 100.0) {
        double v252 = 100.0;
      }
      double v253 = v252 / 100.0;
      BOOL v254 = v252 <= 90.0;
      double v255 = 0.9;
      if (!v254) {
        double v255 = v253;
      }
      v220 = [NSNumber numberWithDouble:v255];
    }

    if (v220)
    {
      v256 = (void *)MEMORY[0x1E4F2B370];
      uint64_t v257 = qword_1E9FC5298;
      [v220 doubleValue];
      uint64_t v335 = objc_msgSend(v256, "quantityWithUnit:doubleValue:", v257);
      [v220 doubleValue];
      double v259 = v258 * 100.0;
      [v207 oxygenSaturationMeanAtElevation];
      if (v259 >= v260)
      {
        v262 = (void *)MEMORY[0x1E4F2B370];
        v263 = [MEMORY[0x1E4F2B618] pascalUnitWithMetricPrefix:9];
        v261 = [v262 quantityWithUnit:v263 doubleValue:101.0];
      }
      else
      {
        v261 = HKOxygenSaturationLowBarometricPressureThresholdQuantity();
      }
      uint64_t v356 = *MEMORY[0x1E4F2A0E0];
      v357 = v261;
      uint64_t v264 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v357 forKeys:&v356 count:1];
      v265 = (void *)MEMORY[0x1E4F2B388];
      uint64_t v266 = qword_1E9FC52D0;
      v267 = [MEMORY[0x1E4F2AEF8] localDevice];
      v268 = v265;
      v269 = (void *)v335;
      v333 = (void *)v264;
      v270 = [v268 quantitySampleWithType:v266 quantity:v335 startDate:v221 endDate:v221 device:v267 metadata:v264];

      if (HKFeatureFlagBloodOxygenSaturationEnabled())
      {
        [v349 addObjectFromWatch:v270];
        v331 = v261;
        if (v342)
        {
          v279 = 0;
        }
        else
        {
          [v220 doubleValue];
          double v272 = v271 * 100.0;
          double v273 = 90.0;
          if (v272 <= 90.0)
          {
            double v274 = 10.0;
            if (v272 <= 85.0)
            {
              if (v272 <= 80.0) {
                double v273 = 120.0;
              }
              else {
                double v273 = 110.0;
              }
              if (v272 <= 80.0) {
                double v274 = 15.0;
              }
              else {
                double v274 = 10.0;
              }
            }
          }
          else
          {
            double v274 = 5.0;
            double v273 = 70.0;
          }
          v275 = [(HDDemoDataBaseSampleGenerator *)v344 demoDataGenerator];
          v276 = [v275 statisticsSampleGenerator];
          [v276 pseudoRandomDoubleFromTime:a5];
          double v278 = v273 + v277 * v274;

          v279 = [NSNumber numberWithDouble:v278];
        }
        v280 = (void *)MEMORY[0x1E4F2B370];
        uint64_t v281 = _MergedGlobals_15_0;
        [v279 doubleValue];
        v282 = objc_msgSend(v280, "quantityWithUnit:doubleValue:", v281);
        v283 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1E9FC52A0 quantity:v282 startDate:v338 endDate:v338];
        [v349 addObjectFromWatch:v283];
        id v284 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
        v285 = [v283 UUID];
        objc_msgSend(v284, "hk_appendBytesWithUUID:", v285);

        v286 = [v270 UUID];
        [v349 setAssociatedObjectUUIDs:v284 forObjectUUID:v286];

        v269 = (void *)v335;
        v261 = v331;
      }
      else
      {
        [v349 addObjectFromPhone:v270];
      }

      v205 = objb;
    }

    v120 = v340;
    id v12 = v343;
    char v121 = v342;
  }
  if ([v198 resultsTrackingType] == 2)
  {
    id v287 = v198;
    if ((v121 & 1) != 0 || v344->_nextPeripheralPerfusionIndexSampleTime > a5)
    {
      v288 = 0;
LABEL_180:

LABEL_181:
      id v12 = v343;
      v205 = objb;
      goto LABEL_182;
    }
    v289 = [(HDDemoDataBaseSampleGenerator *)v344 demoDataGenerator];
    v290 = [v289 generatorState];
    if ([v290 isExercising])
    {
    }
    else
    {
      v291 = [(HDDemoDataBaseSampleGenerator *)v344 demoDataGenerator];
      [v291 activitySampleGenerator];
      v293 = v292 = v120;
      char v294 = [v293 _isDemoPersonCoolingDown:v287 atTime:a5];

      v120 = v292;
      if ((v294 & 1) == 0)
      {
        v308 = [(HDDemoDataBaseSampleGenerator *)v344 demoDataGenerator];
        v309 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        char v310 = [v308 isDemoDataTimeInWeekend:v309 calendar:a5];

        if (v310) {
          [v287 weekendSleepParameters];
        }
        else {
        v307 = [v287 weekdaySleepParameters];
        }
        double v311 = (double)((uint64_t)a5 + 1);
        v312 = [(HDDemoDataBaseSampleGenerator *)v344 demoDataGenerator];
        v313 = [v312 activitySampleGenerator];
        [v307 wakeUpTime];
        double v315 = v314 + v311;
        [v287 exerciseStartTime];
        double v317 = v316;
        [v287 exerciseStartTimeStdDev];
        [v313 _computeExerciseTimeFromCurrentTime:v315 mean:v317 stdDev:v318];
        v344->_nextPeripheralPerfusionIndexSampleTime = v319 + v311;

        v288 = 0;
LABEL_179:

        goto LABEL_180;
      }
    }
    [v287 peripheralPerfusionIndexSampleFrequency];
    v344->_nextPeripheralPerfusionIndexSampleTime = v295 + v344->_nextPeripheralPerfusionIndexSampleTime;
    [v287 peripheralPerfusionIndexMean];
    double v297 = v296;
    v298 = [(HDDemoDataBaseSampleGenerator *)v344 demoDataGenerator];
    v299 = [v298 statisticsSampleGenerator];
    [v287 peripheralPerfusionIndexStdDev];
    [v299 computeNoiseFromTime:a5 stdDev:v300];
    double v302 = v297 + v301;

    [v287 peripheralPerfusionIndexSampleFrequency];
    if (v303 < 0.000694444444)
    {
      double v302 = v344->_lastPeripheralPerfusionIndexValue * 0.6 + v302 * 0.4;
      v344->_lastPeripheralPerfusionIndexValue = v302;
    }
    double v304 = __exp10(2.0);
    v288 = [NSNumber numberWithDouble:(double)(uint64_t)(v302 * v304) / v304 / 100.0];

    if (!v288) {
      goto LABEL_181;
    }
    v305 = (void *)MEMORY[0x1E4F2B370];
    uint64_t v306 = qword_1E9FC5298;
    [v288 doubleValue];
    objc_msgSend(v305, "quantityWithUnit:doubleValue:", v306);
    id v287 = (id)objc_claimAutoreleasedReturnValue();
    v307 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1E9FC52D8 quantity:v287 startDate:v343 endDate:v343];
    [v349 addObjectFromPhone:v307];
    goto LABEL_179;
  }
LABEL_182:
}

void __109__HDDemoDataVitalsSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F2B618] unitFromString:@"count/min"];
  v1 = (void *)_MergedGlobals_15_0;
  _MergedGlobals_15_0 = v0;

  uint64_t v2 = [MEMORY[0x1E4F2B618] millimeterOfMercuryUnit];
  v3 = (void *)qword_1E9FC5288;
  qword_1E9FC5288 = v2;

  uint64_t v4 = [MEMORY[0x1E4F2B618] degreeCelsiusUnit];
  objc_super v5 = (void *)qword_1E9FC5290;
  qword_1E9FC5290 = v4;

  uint64_t v6 = [MEMORY[0x1E4F2B618] percentUnit];
  double v7 = (void *)qword_1E9FC5298;
  qword_1E9FC5298 = v6;

  uint64_t v8 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  double v9 = (void *)qword_1E9FC52A0;
  qword_1E9FC52A0 = v8;

  uint64_t v10 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A898]];
  id v11 = (void *)qword_1E9FC52A8;
  qword_1E9FC52A8 = v10;

  uint64_t v12 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A620]];
  double v13 = (void *)qword_1E9FC52B0;
  qword_1E9FC52B0 = v12;

  uint64_t v14 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A618]];
  char v15 = (void *)qword_1E9FC52B8;
  qword_1E9FC52B8 = v14;

  uint64_t v16 = [MEMORY[0x1E4F2AE60] correlationTypeForIdentifier:*MEMORY[0x1E4F29938]];
  v17 = (void *)qword_1E9FC52C0;
  qword_1E9FC52C0 = v16;

  uint64_t v18 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A640]];
  v19 = (void *)qword_1E9FC52C8;
  qword_1E9FC52C8 = v18;

  uint64_t v20 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A868]];
  v21 = (void *)qword_1E9FC52D0;
  qword_1E9FC52D0 = v20;

  uint64_t v22 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A880]];
  v23 = (void *)qword_1E9FC52D8;
  qword_1E9FC52D8 = v22;
}

- (uint64_t)_computeBloodPressureForDemoPerson:(double)a3 atTime:(double)a4 baseBloodPressure:(double)a5 stdDev:
{
  id v9 = a2;
  uint64_t v10 = [a1 demoDataGenerator];
  id v11 = [v10 sleepSampleGenerator];
  char v12 = [v11 isDemoPersonSleeping:v9 atTime:a3];

  if (v12)
  {
    uint64_t v13 = 0xFFFFFFFF80000000;
  }
  else
  {
    uint64_t v14 = [a1[4] objectAtIndexedSubscript:(uint64_t)((a3 - (double)(uint64_t)a3) * 24.0)];
    [v14 doubleValue];
    double v16 = v15 * a4;

    if ([v9 biologicalSex] != 2) {
      double v16 = v16 * 0.9;
    }
    v17 = [a1 demoDataGenerator];
    uint64_t v18 = [v17 generatorState];
    int v19 = [v18 isExercising];

    double v20 = 0.0;
    if (v19) {
      double v21 = a4 * 0.07 + 4.0;
    }
    else {
      double v21 = 0.0;
    }
    uint64_t v22 = [a1 demoDataGenerator];
    v23 = [v22 foodSampleGenerator];
    int v24 = [v23 _isDemoPersonConsumingCaffeine:v9 atTime:a3];

    if (v24)
    {
      v25 = [a1 demoDataGenerator];
      v26 = [v25 statisticsSampleGenerator];
      [v26 computeNoiseFromTime:a3 stdDev:2.25];
      double v20 = fabs(v27) + 2.5;
    }
    v28 = [a1 demoDataGenerator];
    v29 = [v28 statisticsSampleGenerator];
    [v29 computeNoiseFromTime:a3 stdDev:a5];
    double v31 = v30;

    uint64_t v13 = (uint64_t)(v16 + v21 + v20 + v31);
  }

  return v13;
}

- (uint64_t)_computeMaxHRForDemoPerson:(double)a3 atTime:
{
  id v5 = a2;
  uint64_t v6 = [a1 demoDataGenerator];
  double v7 = [v6 currentDateFromCurrentTime:a3];

  uint64_t v8 = [v5 birthDateComponents];

  uint64_t v9 = HDDemoData_ageBetweenNSDateComponentsAndDate(v8, v7);
  return 220 - v9;
}

- (double)_computeBodyTempInCelsiusForDemoPerson:(id)a3 atTime:(double)a4 addNoise:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  uint64_t v10 = [v9 reproductiveHealthSampleGenerator];
  uint64_t v11 = [v10 _computeNextLuteinizingHormoneSurgeForDemoPerson:v8 atTime:a4] + 1;

  [v8 menstrualPeriodFrequency];
  uint64_t v13 = (uint64_t)v12;
  uint64_t v14 = v11 / (uint64_t)v12;
  [v8 menstrualPeriodFrequency];
  uint64_t v16 = (uint64_t)a4 % (uint64_t)v15 + v14 * v13 - v11 + 15;
  if (self) {
    diurnalTempVariationTable = self->_diurnalTempVariationTable;
  }
  else {
    diurnalTempVariationTable = 0;
  }
  uint64_t v18 = [(NSArray *)diurnalTempVariationTable objectAtIndexedSubscript:(uint64_t)((a4 - (double)(uint64_t)a4) * 24.0) % 24];
  [v18 doubleValue];
  double v20 = v19;

  double v21 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  uint64_t v22 = [v21 reproductiveHealthSampleGenerator];
  v23 = [v22 _basalBodyTempMultiplier];
  int v24 = [v23 objectAtIndexedSubscript:v16 % 28];
  [v24 doubleValue];
  double v26 = v25;

  double v27 = v20 * v26;
  [v8 bodyTempFeverMultiplier];
  double v29 = v27 * v28;
  double v30 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  double v31 = [v30 generatorState];
  LODWORD(v23) = [v31 isExercising];

  double v32 = 0.0;
  double v33 = v27 + v29;
  double v34 = 0.0;
  if (v23)
  {
    [v8 bodyTempExerciseMultiplier];
    double v34 = v33 * v35;
  }
  if (v5)
  {
    double v36 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    double v37 = [v36 statisticsSampleGenerator];
    [v8 bodyTempSampleNoiseStdDev];
    [v37 computeNoiseFromTime:a4 stdDev:v38];
    double v32 = v39;
  }
  return v33 + v34 + v32 + -1.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diurnalTempVariationTable, 0);

  objc_storeStrong((id *)&self->_diurnalBPVariationTable, 0);
}

@end