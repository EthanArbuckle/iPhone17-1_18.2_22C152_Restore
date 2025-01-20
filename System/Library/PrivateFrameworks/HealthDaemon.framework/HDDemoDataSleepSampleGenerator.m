@interface HDDemoDataSleepSampleGenerator
+ (BOOL)supportsSecureCoding;
- (BOOL)isDemoPersonAwake:(id)a3 atTime:(double)a4;
- (BOOL)isDemoPersonSleeping:(id)a3 atTime:(double)a4;
- (HDDemoDataSleepSampleGenerator)init;
- (HDDemoDataSleepSampleGenerator)initWithCoder:(id)a3;
- (double)computeAwakeTimeForDemoPerson:(id)a3 atTime:(double)a4;
- (double)computeSleepTimeFromCurrentTime:(double)a3 mean:(double)a4 stdDev:(double)a5;
- (id)createSleepSamplesFromSleepGraph:(id)a3 sleepCategoryType:(id)a4 startDate:(id)a5 endDate:(id)a6;
- (id)loadGraphsFromFileNamed:(uint64_t)a1;
- (id)randomGraphFromArray:(unint64_t)a1;
- (id)sleepGraphsFileName;
- (void)encodeWithCoder:(id)a3;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)setupWithDemoDataGenerator:(id)a3;
@end

@implementation HDDemoDataSleepSampleGenerator

- (HDDemoDataSleepSampleGenerator)init
{
  v10.receiver = self;
  v10.super_class = (Class)HDDemoDataSleepSampleGenerator;
  v2 = [(HDDemoDataBaseSampleGenerator *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_nextSleepDurationSampleTime = 0.0;
    v4 = [(HDDemoDataSleepSampleGenerator *)v2 sleepGraphsFileName];
    uint64_t v5 = -[HDDemoDataSleepSampleGenerator loadGraphsFromFileNamed:]((uint64_t)v3, v4);
    sleepGraphsArray = v3->_sleepGraphsArray;
    v3->_sleepGraphsArray = (NSArray *)v5;

    uint64_t v7 = -[HDDemoDataSleepSampleGenerator loadGraphsFromFileNamed:]((uint64_t)v3, @"BreathingDisturbancesData");
    breathingDisturbancesGraphsArray = v3->_breathingDisturbancesGraphsArray;
    v3->_breathingDisturbancesGraphsArray = (NSArray *)v7;
  }
  return v3;
}

- (id)loadGraphsFromFileNamed:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28B50];
  id v3 = a2;
  v4 = [v2 bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 pathForResource:v3 ofType:@"json"];

  v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5];
  if (v6)
  {
    id v18 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:4 error:&v18];
    id v8 = v18;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x1E4F29F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
      {
        v15 = v11;
        v16 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v20 = v16;
        __int16 v21 = 2114;
        v22 = v5;
        id v17 = v16;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Could not serialize from JSON data at file path: %{public}@", buf, 0x16u);
      }
      id v9 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    _HKInitializeLogging();
    objc_super v10 = (void *)*MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
    {
      v13 = v10;
      *(_DWORD *)buf = 138543618;
      id v20 = (id)objc_opt_class();
      __int16 v21 = 2114;
      v22 = v5;
      id v14 = v20;
      _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Could not get data from file path: %{public}@", buf, 0x16u);
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (HDDemoDataSleepSampleGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDDemoDataSleepSampleGenerator;
  uint64_t v5 = [(HDDemoDataBaseSampleGenerator *)&v13 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"HDDemoDataSleepSampleGeneratorNextSleepDurationSampleTimeKey"];
    v5->_nextSleepDurationSampleTime = v6;
    uint64_t v7 = [(HDDemoDataSleepSampleGenerator *)v5 sleepGraphsFileName];
    uint64_t v8 = -[HDDemoDataSleepSampleGenerator loadGraphsFromFileNamed:]((uint64_t)v5, v7);
    sleepGraphsArray = v5->_sleepGraphsArray;
    v5->_sleepGraphsArray = (NSArray *)v8;

    uint64_t v10 = -[HDDemoDataSleepSampleGenerator loadGraphsFromFileNamed:]((uint64_t)v5, @"BreathingDisturbancesData");
    breathingDisturbancesGraphsArray = v5->_breathingDisturbancesGraphsArray;
    v5->_breathingDisturbancesGraphsArray = (NSArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataSleepSampleGenerator;
  id v4 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HDDemoDataSleepSampleGeneratorNextSleepDurationSampleTimeKey", self->_nextSleepDurationSampleTime, v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)sleepGraphsFileName
{
  return @"SleepData-Stages";
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataSleepSampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v3 setupWithDemoDataGenerator:a3];
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  v234[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  v221.receiver = self;
  v221.super_class = (Class)HDDemoDataSleepSampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v221 generateObjectsForDemoPerson:v11 fromTime:a6 toTime:v12 currentDate:a5 objectCollection:a5];
  if (self->_nextSleepDurationSampleTime > a5) {
    goto LABEL_64;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v213 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v15 = [v14 firstSampleDate];

  unint64_t v16 = 0x1E4F2B000uLL;
  unint64_t v17 = 0x1E4F2B000uLL;
  v206 = v11;
  v207 = v13;
  v204 = v15;
  id v205 = v12;
  v209 = self;
  if (self->_nextSleepDurationSampleTime == 0.0)
  {
    id v18 = (void *)MEMORY[0x1E4F2B370];
    v19 = [MEMORY[0x1E4F2B618] hourUnit];
    uint64_t v20 = [v18 quantityWithUnit:v19 doubleValue:7.0];

    __int16 v21 = (void *)MEMORY[0x1E4F2B388];
    v22 = [MEMORY[0x1E4F2B3B8] dataTypeWithCode:197];
    v210 = (void *)v20;
    uint64_t v23 = [v21 quantitySampleWithType:v22 quantity:v20 startDate:v15 endDate:v15];

    v208 = (void *)v23;
    [v13 addObject:v23];
    v24 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v215 = objc_msgSend(v24, "hk_weekendDays");

    long long v219 = 0u;
    long long v220 = 0u;
    long long v217 = 0u;
    long long v218 = 0u;
    v25 = HKSleepScheduleWeekdayArrayFromWeekdays();
    uint64_t v26 = [v25 countByEnumeratingWithState:&v217 objects:v226 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = *(void *)v218;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v218 != v30) {
            objc_enumerationMutation(v25);
          }
          uint64_t v32 = [*(id *)(*((void *)&v217 + 1) + 8 * i) unsignedIntegerValue];
          v33 = [NSNumber numberWithInteger:NSWeekdayComponentFromHKSleepScheduleWeekday()];
          int v34 = [v215 containsObject:v33];

          if (v34) {
            uint64_t v35 = v32;
          }
          else {
            uint64_t v35 = 0;
          }
          v28 |= v35;
          if (v34) {
            uint64_t v36 = 0;
          }
          else {
            uint64_t v36 = v32;
          }
          v29 |= v36;
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v217 objects:v226 count:16];
      }
      while (v27);
    }
    else
    {
      uint64_t v28 = 0;
      uint64_t v29 = 0;
    }

    id v11 = v206;
    v37 = [v206 weekdaySleepParameters];
    v38 = (void *)MEMORY[0x1E4F2B550];
    v39 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_componentsWithHour:minute:", objc_msgSend(v37, "wakeUpTimeGoalHour"), 0);
    v40 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_componentsWithHour:minute:", objc_msgSend(v37, "bedtimeGoalHour"), 0);
    v41 = [v38 sleepScheduleWithDate:v15 weekdays:v29 wakeTimeComponents:v39 bedTimeComponents:v40 overrideDayIndex:0 device:0 metadata:0];
    [v207 addObject:v41];

    v42 = [v206 weekendSleepParameters];

    v43 = (void *)MEMORY[0x1E4F2B550];
    v44 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_componentsWithHour:minute:", objc_msgSend(v42, "wakeUpTimeGoalHour"), 0);
    v45 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_componentsWithHour:minute:", objc_msgSend(v42, "bedtimeGoalHour"), 0);
    v46 = [v43 sleepScheduleWithDate:v15 weekdays:v28 wakeTimeComponents:v44 bedTimeComponents:v45 overrideDayIndex:0 device:0 metadata:0];
    [v207 addObject:v46];

    id v12 = v205;
    self = v209;
    unint64_t v16 = 0x1E4F2B000uLL;
    unint64_t v17 = 0x1E4F2B000uLL;
  }
  if (qword_1E9FC5198 != -1) {
    dispatch_once(&qword_1E9FC5198, &__block_literal_global_40);
  }
  double v47 = (double)(uint64_t)a5;
  v48 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v49 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  char v50 = [v48 isDemoDataTimeInWeekend:v49 calendar:a5];

  if (v50) {
    [v11 weekendSleepParameters];
  }
  else {
  v51 = [v11 weekdaySleepParameters];
  }
  [v51 wakeUpTime];
  double v53 = v52;
  [v11 wakeUpTimeNoiseStdDev];
  [(HDDemoDataSleepSampleGenerator *)self computeSleepTimeFromCurrentTime:a5 mean:v53 stdDev:v54];
  self->_nextSleepDurationSampleTime = v47 + 1.0 + v55;
  [v51 wakeUpTime];
  double v57 = v56;
  [v11 wakeUpTimeNoiseStdDev];
  [(HDDemoDataSleepSampleGenerator *)self computeSleepTimeFromCurrentTime:a5 mean:v57 stdDev:v58];
  double v60 = v59;
  [v51 bedtime];
  double v62 = v61;
  [v51 wakeUpTime];
  if (v62 <= v63) {
    double v64 = 0.0;
  }
  else {
    double v64 = 1.0;
  }
  v203 = v51;
  [v51 bedtime];
  double v66 = v65;
  [v11 bedtimeNoiseStdDev];
  [(HDDemoDataSleepSampleGenerator *)self computeSleepTimeFromCurrentTime:a5 - v64 mean:v66 stdDev:v67];
  double v69 = v68;
  [v15 timeIntervalSinceReferenceDate];
  double v71 = v70 + (v69 - v64 + v47) * 86400.0;
  [v15 timeIntervalSinceReferenceDate];
  double v73 = v72 + (v60 + v47) * 86400.0;
  v74 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v75 = [v74 features];
  int v76 = [v75 timeInBedTracking];

  if (v76)
  {
    v77 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v78 = [v77 statisticsSampleGenerator];
    [v11 inBedTimeStdDev];
    [v78 computeNoiseFromTime:a5 stdDev:v79];
    double v81 = v80 * 86400.0;

    v82 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v83 = [v82 statisticsSampleGenerator];
    [v11 inBedTimeStdDev];
    [v83 computeNoiseFromTime:a5 stdDev:v84];
    double v86 = v85 * 86400.0;

    v87 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v71 - fabs(v81)];
    v88 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v73 + fabs(v86 * 0.5)];
    if (objc_msgSend(v87, "hk_isAfterDate:", v88))
    {
      _HKInitializeLogging();
      v89 = (void *)*MEMORY[0x1E4F29F30];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
      {
LABEL_33:

        goto LABEL_34;
      }
      id v90 = v12;
      id v91 = v11;
      v92 = v89;
      v93 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v228 = v93;
      __int16 v229 = 2114;
      v230 = v87;
      __int16 v231 = 2114;
      v232 = v88;
      id v94 = v93;
      _os_log_error_impl(&dword_1BCB7D000, v92, OS_LOG_TYPE_ERROR, "[%{public}@] In Bed: Bedtime date cannot be after wake up date! %{public}@ - %{public}@", buf, 0x20u);

      id v11 = v91;
      id v12 = v90;
      unint64_t v17 = 0x1E4F2B000;
    }
    else
    {
      v92 = [MEMORY[0x1E4F2ACB0] categorySampleWithType:_MergedGlobals_13 value:0 startDate:v87 endDate:v88 metadata:0];
      [v207 addObject:v92];
    }

    goto LABEL_33;
  }
LABEL_34:
  uint64_t v95 = -[HDDemoDataSleepSampleGenerator randomGraphFromArray:]((unint64_t)self, self->_sleepGraphsArray);
  uint64_t v96 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v71];
  v97 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v73];
  v201 = (void *)v96;
  v202 = (void *)v95;
  v98 = [(HDDemoDataSleepSampleGenerator *)self createSleepSamplesFromSleepGraph:v95 sleepCategoryType:_MergedGlobals_13 startDate:v96 endDate:v97];
  [v213 addObjectsFromArray:v98];

  id v99 = v213;
  id v100 = v12;
  id v101 = v11;
  v216 = v99;
  if ([v99 count])
  {
    v198 = v100;
    v199 = v97;
    double v200 = a5;
    v214 = [*(id *)(v17 + 952) quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
    id v102 = objc_alloc(MEMORY[0x1E4F28C18]);
    v103 = [v99 firstObject];
    v104 = [v103 startDate];
    v105 = [v99 lastObject];
    v106 = [v105 endDate];
    v107 = (void *)[v102 initWithStartDate:v104 endDate:v106];

    v108 = [v107 startDate];
    id v212 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v233 = *MEMORY[0x1E4F2BB28];
    v234[0] = &unk_1F17EB370;
    v211 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v234 forKeys:&v233 count:1];
    v109 = [v107 endDate];
    LODWORD(v103) = objc_msgSend(v108, "hk_isBeforeDate:", v109);

    if (v103)
    {
      unint64_t v110 = 0x1E4F2B000uLL;
      do
      {
        long long v224 = 0u;
        long long v225 = 0u;
        long long v222 = 0u;
        long long v223 = 0u;
        id v111 = v216;
        uint64_t v112 = [v111 countByEnumeratingWithState:&v222 objects:buf count:16];
        if (v112)
        {
          uint64_t v113 = v112;
          uint64_t v114 = *(void *)v223;
          do
          {
            for (uint64_t j = 0; j != v113; ++j)
            {
              if (*(void *)v223 != v114) {
                objc_enumerationMutation(v111);
              }
              v116 = *(void **)(*((void *)&v222 + 1) + 8 * j);
              v117 = [v116 startDate];
              if (objc_msgSend(v108, "hk_isAfterDate:", v117))
              {
                v118 = [v116 endDate];
                char v119 = objc_msgSend(v108, "hk_isBeforeDate:", v118);

                if (v119)
                {
                  int v120 = 1;
                  goto LABEL_49;
                }
              }
              else
              {
              }
            }
            uint64_t v113 = [v111 countByEnumeratingWithState:&v222 objects:buf count:16];
          }
          while (v113);
          int v120 = 0;
LABEL_49:
          self = v209;
          unint64_t v16 = 0x1E4F2B000;
          unint64_t v110 = 0x1E4F2B000;
        }
        else
        {
          int v120 = 0;
        }

        [v108 timeIntervalSinceReferenceDate];
        double v122 = v121 * 0.0000115740741;
        v123 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v124 = [v123 statisticsSampleGenerator];
        [v101 heartRateSampleNoiseStdDev];
        [v124 computeNoiseFromTime:v122 stdDev:v125];
        double v127 = v126;

        [v108 timeIntervalSinceReferenceDate];
        double v129 = v128;
        v130 = [v107 startDate];
        [v130 timeIntervalSinceReferenceDate];
        double v132 = v131;
        [v107 duration];
        double v134 = v133;

        if (v120) {
          double v135 = v127 * 0.5 + (double)[v101 restingHeartRate] * ((v129 - v132) / v134 * -0.1 + 1.0);
        }
        else {
          double v135 = v127 + (double)[v101 restingHeartRate];
        }
        v136 = *(void **)(v16 + 904);
        v137 = *(void **)(v110 + 880);
        v138 = [MEMORY[0x1E4F2B618] _countPerMinuteUnit];
        v139 = [v137 quantityWithUnit:v138 doubleValue:v135];
        v140 = [v136 quantitySampleWithType:v214 quantity:v139 startDate:v108 endDate:v108 metadata:v211];
        [v212 addObject:v140];

        v141 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        v142 = [v141 statisticsSampleGenerator];
        [v101 heartRateSampleFrequency];
        double v144 = v143;
        [v101 heartRateSampleFrequencyStdDev];
        [v142 computeStatisticalTimeFromCurrentTime:v122 mean:v144 stdDev:v145 * 0.5];
        double v147 = v146;

        v148 = [v108 dateByAddingTimeInterval:v147 * 86400.0];

        v149 = [v107 endDate];
        LOBYTE(v136) = objc_msgSend(v148, "hk_isBeforeDate:", v149);

        v108 = v148;
      }
      while ((v136 & 1) != 0);
    }
    else
    {
      v148 = v108;
    }
    id v100 = v198;
    [v198 addObjectsFromWatch:v212];

    unint64_t v17 = 0x1E4F2B000;
    a5 = v200;
    id v99 = v216;
    v97 = v199;
  }

  id v150 = v101;
  id v151 = v100;
  id v152 = v97;
  id v153 = v201;
  v154 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v155 = [v154 currentDateFromCurrentTime:a5];

  v156 = [v150 birthDateComponents];
  uint64_t v157 = HDDemoData_ageBetweenNSDateComponentsAndDate(v156, v155);

  double v158 = 1.0;
  if ([v150 biologicalSex] == 1 && v157 >= 12)
  {
    v159 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v160 = [v159 reproductiveHealthSampleGenerator];
    uint64_t v161 = [v160 cycleDayIndexAtTime:v150 demoPerson:a5];

    v162 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    v163 = [v162 reproductiveHealthSampleGenerator];
    v164 = [v163 _basalBodyTempMultiplier];
    v165 = [v164 objectAtIndexedSubscript:v161];
    [v165 doubleValue];
    double v158 = v166;

    unint64_t v17 = 0x1E4F2B000uLL;
    unint64_t v16 = 0x1E4F2B000uLL;
  }
  [v150 baseCorrectedWristSkinTemperatureInCelsius];
  double v168 = v158 * v167;
  v169 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v170 = [v169 statisticsSampleGenerator];
  [v150 dayToDayCorrectedWristSkinTemperatureNoiseStdDevInCelsius];
  [v170 randomSampleFromNormalDistributionWithMean:0.0 stdDev:v171];
  double v173 = v172;

  double v174 = __exp10(2.0);
  double v175 = (double)(uint64_t)((v168 + v173) * v174) / v174;
  v176 = (void *)MEMORY[0x1E4F2B370];
  v177 = [MEMORY[0x1E4F2B618] degreeCelsiusUnit];
  v178 = [v176 quantityWithUnit:v177 doubleValue:v175];

  v179 = *(void **)(v16 + 904);
  v180 = [*(id *)(v17 + 952) quantityTypeForIdentifier:*MEMORY[0x1E4F2A5E0]];
  v181 = [v179 quantitySampleWithType:v180 quantity:v178 startDate:v153 endDate:v152];

  [v151 addObjectFromWatch:v181];
  id v182 = v153;
  id v183 = v152;
  id v184 = v151;
  id v185 = v150;
  v186 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v187 = [v186 features];
  int v188 = [v187 nebula];

  if (v188)
  {
    v189 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5D8]];
    v190 = -[HDDemoDataSleepSampleGenerator randomGraphFromArray:]((unint64_t)self, self->_breathingDisturbancesGraphsArray);
    v191 = objc_msgSend(v190, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v190, "count"));
    [v191 doubleValue];
    double v193 = v192;

    v194 = (void *)MEMORY[0x1E4F2B370];
    v195 = [MEMORY[0x1E4F2B618] countUnit];
    v196 = [v194 quantityWithUnit:v195 doubleValue:v193];

    v197 = [*(id *)(v16 + 904) quantitySampleWithType:v189 quantity:v196 startDate:v182 endDate:v183];
    [v184 addObjectFromWatch:v197];
  }
  [v184 addObjectsFromPhone:v207];
  [v184 addObjectsFromWatch:v216];

  id v12 = v205;
  id v11 = v206;
LABEL_64:
}

void __108__HDDemoDataSleepSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F2B2C0] categoryTypeForIdentifier:*MEMORY[0x1E4F29870]];
  v1 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v0;
}

- (id)randomGraphFromArray:(unint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    a1 = [v3 count];
    if (a1)
    {
      a1 = [v4 objectAtIndexedSubscript:arc4random() % a1];
    }
  }

  return (id)a1;
}

- (double)computeAwakeTimeForDemoPerson:(id)a3 atTime:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  uint64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  char v9 = [v7 isDemoDataTimeInWeekend:v8 calendar:a4];

  if (v9) {
    [v6 weekendSleepParameters];
  }
  else {
  uint64_t v10 = [v6 weekdaySleepParameters];
  }
  [v10 bedtime];
  double v12 = v11;
  [v6 bedtimeNoiseStdDev];
  [(HDDemoDataSleepSampleGenerator *)self computeSleepTimeFromCurrentTime:a4 mean:v12 stdDev:v13];
  double v15 = v14;
  [v10 wakeUpTime];
  double v17 = v16;
  [v6 wakeUpTimeNoiseStdDev];
  [(HDDemoDataSleepSampleGenerator *)self computeSleepTimeFromCurrentTime:a4 mean:v17 stdDev:v18];
  double v20 = v15 - v19;

  return v20;
}

- (double)computeSleepTimeFromCurrentTime:(double)a3 mean:(double)a4 stdDev:(double)a5
{
  uint64_t v8 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  char v9 = [v8 statisticsSampleGenerator];
  [v9 computeStatisticalTimeFromCurrentTime:(double)(uint64_t)a3 mean:a4 stdDev:a5];
  double v11 = v10;

  if (v11 > 1.0 || v11 < 0.0) {
    return a4;
  }
  else {
    return v11;
  }
}

- (BOOL)isDemoPersonAwake:(id)a3 atTime:(double)a4
{
  return ![(HDDemoDataSleepSampleGenerator *)self isDemoPersonSleeping:a3 atTime:a4];
}

- (BOOL)isDemoPersonSleeping:(id)a3 atTime:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  uint64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  char v9 = [v7 isDemoDataTimeInWeekend:v8 calendar:a4];

  if (v9) {
    [v6 weekendSleepParameters];
  }
  else {
  double v10 = [v6 weekdaySleepParameters];
  }
  double v11 = a4 - (double)(uint64_t)a4;
  [v10 bedtime];
  double v13 = v12;
  [v6 bedtimeNoiseStdDev];
  [(HDDemoDataSleepSampleGenerator *)self computeSleepTimeFromCurrentTime:a4 mean:v13 stdDev:v14];
  double v16 = v15;
  [v10 wakeUpTime];
  double v18 = v17;
  [v6 wakeUpTimeNoiseStdDev];
  [(HDDemoDataSleepSampleGenerator *)self computeSleepTimeFromCurrentTime:a4 mean:v18 stdDev:v19];
  BOOL v21 = v11 != v20;
  if (v20 != v16) {
    BOOL v21 = 0;
  }
  BOOL v22 = v11 <= v20;
  if (v11 >= v16) {
    BOOL v22 = 1;
  }
  if (v16 > v20) {
    BOOL v21 = v22;
  }
  BOOL v23 = v11 < v20;
  if (v11 <= v16) {
    BOOL v23 = 0;
  }
  if (v20 > v16) {
    BOOL v24 = v23;
  }
  else {
    BOOL v24 = v21;
  }

  return v24;
}

- (id)createSleepSamplesFromSleepGraph:(id)a3 sleepCategoryType:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 count] && !objc_msgSend(v11, "hk_isAfterDate:", v12))
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__34;
    double v52 = __Block_byref_object_dispose__34;
    id v53 = (id)[v11 copy];
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__34;
    double v47 = __Block_byref_object_dispose__34;
    id v48 = (id)[v11 copy];
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__34;
    v41 = __Block_byref_object_dispose__34;
    id v42 = [v9 firstObject];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    uint64_t v29 = __103__HDDemoDataSleepSampleGenerator_createSleepSamplesFromSleepGraph_sleepCategoryType_startDate_endDate___block_invoke;
    uint64_t v30 = &unk_1E62F80C8;
    int v34 = &v37;
    uint64_t v35 = &v43;
    id v16 = v12;
    id v31 = v16;
    id v17 = v15;
    id v32 = v17;
    id v18 = v10;
    id v33 = v18;
    p_long long buf = &buf;
    [v9 enumerateObjectsUsingBlock:&v27];
    if (objc_msgSend((id)v38[5], "integerValue", v27, v28, v29, v30) != 2)
    {
      double v19 = (void *)MEMORY[0x1E4F2ACB0];
      uint64_t v20 = [(id)v38[5] integerValue];
      uint64_t v21 = *(void *)(*((void *)&buf + 1) + 40);
      if ((objc_msgSend(v16, "hk_isAfterDate:", v21) & 1) == 0) {
        id v16 = (id)v44[5];
      }
      BOOL v22 = [v19 categorySampleWithType:v18 value:v20 startDate:v21 endDate:v16];
      [v17 addObject:v22];
    }
    BOOL v23 = v33;
    id v14 = v17;

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v43, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    _HKInitializeLogging();
    double v13 = (void *)*MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
    {
      v25 = v13;
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = objc_opt_class();
      id v26 = *(id *)((char *)&buf + 4);
      _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "[%{public}@] Asked to make sleep samples with invalid input, returning empty", (uint8_t *)&buf, 0xCu);
    }
    id v14 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

void __103__HDDemoDataSleepSampleGenerator_createSleepSamplesFromSleepGraph_sleepCategoryType_startDate_endDate___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v20 = a2;
  if (objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "isEqualToNumber:"))
  {
    uint64_t v7 = [*(id *)(*(void *)(a1[8] + 8) + 40) dateByAddingTimeInterval:30.0];
    uint64_t v8 = *(void *)(a1[8] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    int v10 = objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "hk_isAfterDate:", a1[4]);
    id v11 = v20;
    if (v10) {
      *a4 = 1;
    }
  }
  else
  {
    id v12 = (void *)a1[5];
    double v13 = objc_msgSend(MEMORY[0x1E4F2ACB0], "categorySampleWithType:value:startDate:endDate:", a1[6], objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "integerValue"), *(void *)(*(void *)(a1[9] + 8) + 40), *(void *)(*(void *)(a1[8] + 8) + 40));
    [v12 addObject:v13];

    uint64_t v14 = [*(id *)(*(void *)(a1[8] + 8) + 40) copy];
    uint64_t v15 = *(void *)(a1[9] + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    uint64_t v17 = [*(id *)(*(void *)(a1[8] + 8) + 40) dateByAddingTimeInterval:30.0];
    uint64_t v18 = *(void *)(a1[8] + 8);
    double v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
    id v11 = v20;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_breathingDisturbancesGraphsArray, 0);

  objc_storeStrong((id *)&self->_sleepGraphsArray, 0);
}

@end