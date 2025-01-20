@interface HDDemoDataReproductiveHealthSampleGenerator
+ (BOOL)supportsSecureCoding;
- (HDDemoDataReproductiveHealthSampleGenerator)init;
- (HDDemoDataReproductiveHealthSampleGenerator)initWithCoder:(id)a3;
- (id)_basalBodyTempMultiplier;
- (id)_computeFirstRunCycleFactorSamplesForDemoPerson:(void *)a1 targetDate:(void *)a2;
- (int64_t)_computeNextLuteinizingHormoneSurgeForDemoPerson:(id)a3 atTime:(double)a4;
- (int64_t)cycleDayIndexAtTime:(double)a3 demoPerson:(id)a4;
- (uint64_t)menstrualFlowForDemoPerson:(void *)a3 withSampleDate:;
- (void)addMenstruationSampleForDemoPersonFromWatch:(void *)a1 date:(uint64_t)a2 flow:(uint64_t)a3 objectCollection:(void *)a4;
- (void)addSymptomSampleForDemoPersonFromWatch:(void *)a3 date:categoryType:objectCollection:;
- (void)completeOnboardingForDemoPerson:(void *)a1;
- (void)encodeWithCoder:(id)a3;
- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)setupWithDemoDataGenerator:(id)a3;
@end

@implementation HDDemoDataReproductiveHealthSampleGenerator

- (HDDemoDataReproductiveHealthSampleGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataReproductiveHealthSampleGenerator;
  result = [(HDDemoDataBaseSampleGenerator *)&v3 init];
  if (result)
  {
    result->_nextSexualActivitySampleTime = 0.0;
    result->_nextCycleDaySampleTime = 0.0;
  }
  return result;
}

- (HDDemoDataReproductiveHealthSampleGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDemoDataReproductiveHealthSampleGenerator;
  v5 = [(HDDemoDataBaseSampleGenerator *)&v9 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"HDDemoDataReproductiveHealthSampleHelperNextSexualActivitySampleTimeKey"];
    v5->_nextSexualActivitySampleTime = v6;
    [v4 decodeDoubleForKey:@"HDDemoDataReproductiveHealthSampleHelperNextCycleDaySampleTimeKey"];
    v5->_nextCycleDaySampleTime = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataReproductiveHealthSampleGenerator;
  id v4 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"HDDemoDataReproductiveHealthSampleHelperNextSexualActivitySampleTimeKey", self->_nextSexualActivitySampleTime, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"HDDemoDataReproductiveHealthSampleHelperNextCycleDaySampleTimeKey" forKey:self->_nextCycleDaySampleTime];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  v116[16] = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1E4F2B860];
  id v9 = a5;
  id v10 = a4;
  id v88 = a3;
  v11 = [v8 sharedBehavior];
  LODWORD(a3) = [v11 isAppleWatch];

  if (!a3)
  {
    id v61 = v88;
    id v62 = v10;
    id obja = v9;
    if (!self) {
      goto LABEL_69;
    }
    v63 = [(HDDemoDataBaseSampleGenerator *)self profile];

    if (!v63)
    {
      v78 = [MEMORY[0x1E4F28B00] currentHandler];
      [v78 handleFailureInMethod:sel_generatePhoneFirstRunSampleForDemoPerson_firstDate_objectCollection_ object:self file:@"HDDemoDataReproductiveHealthSampleGenerator.m" lineNumber:99 description:@"HDProfile must be set"];
    }
    v64 = [v61 birthDateComponents];
    uint64_t v65 = HDDemoData_ageBetweenNSDateComponentsAndDate(v64, v62);

    if (v65 < 11) {
      goto LABEL_69;
    }
    id v85 = v9;
    -[HDDemoDataReproductiveHealthSampleGenerator completeOnboardingForDemoPerson:](self);
    v66 = [v62 dateByAddingTimeInterval:-7776000.0];
    if (qword_1E9FC5140 != -1) {
      dispatch_once(&qword_1E9FC5140, &__block_literal_global_36);
    }
    if ([v66 compare:v62] == -1)
    {
      id v87 = v10;
      id v68 = 0;
      uint64_t v69 = *MEMORY[0x1E4F2A1A8];
      do
      {
        uint64_t v70 = -[HDDemoDataReproductiveHealthSampleGenerator menstrualFlowForDemoPerson:withSampleDate:]((uint64_t)self, v61, v66);
        if (v71 != 0xFFFFFFFF80000000)
        {
          uint64_t v72 = v70;
          uint64_t v73 = v71;
          v115[0] = v69;
          v74 = [NSNumber numberWithBool:v70 == 1];
          v116[0] = v74;
          v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:1];

          v76 = [MEMORY[0x1E4F2ACB0] categorySampleWithType:_MergedGlobals_15 value:v73 startDate:v66 endDate:v66 metadata:v75];
          [obja addObjectFromPhone:v76];
          if (!v68 && v72 == 1) {
            id v68 = v66;
          }
        }
        v67 = [v66 dateByAddingTimeInterval:86400.0];

        v66 = v67;
      }
      while ([v67 compare:v62] == -1);
      id v10 = v87;
      if (v68)
      {
        v77 = -[HDDemoDataReproductiveHealthSampleGenerator _computeFirstRunCycleFactorSamplesForDemoPerson:targetDate:](v61, v68);
        id v9 = v85;
        if (v77) {
          [obja addObjectsFromPhone:v77];
        }

        goto LABEL_68;
      }
    }
    else
    {
      v67 = v66;
    }
    id v9 = v85;
LABEL_68:

LABEL_69:
    goto LABEL_70;
  }
  id v12 = v88;
  id v86 = v10;
  id v13 = v10;
  id v14 = v9;
  if (self && [v12 biologicalSex] != 2)
  {
    v82 = v12;
    id v84 = v9;
    -[HDDemoDataReproductiveHealthSampleGenerator completeOnboardingForDemoPerson:](self);
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F17E9120];
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F17E9138];
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F17E9150];
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id obj = v15;
    uint64_t v18 = [obj countByEnumeratingWithState:&v108 objects:v116 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      id v20 = 0;
      uint64_t v21 = *(void *)v109;
      do
      {
        uint64_t v22 = 0;
        v23 = v20;
        do
        {
          if (*(void *)v109 != v21) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(id *)(*((void *)&v108 + 1) + 8 * v22);

          v24 = objc_msgSend(v13, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(v20, "intValue")));
          -[HDDemoDataReproductiveHealthSampleGenerator addMenstruationSampleForDemoPersonFromWatch:date:flow:objectCollection:](v24, 0, 4, v14);

          ++v22;
          v23 = v20;
        }
        while (v19 != v22);
        uint64_t v19 = [obj countByEnumeratingWithState:&v108 objects:v116 count:16];
      }
      while (v19);
    }
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v25 = v16;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v104 objects:v115 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      id v28 = 0;
      uint64_t v29 = *(void *)v105;
      do
      {
        uint64_t v30 = 0;
        v31 = v28;
        do
        {
          if (*(void *)v105 != v29) {
            objc_enumerationMutation(v25);
          }
          id v28 = *(id *)(*((void *)&v104 + 1) + 8 * v30);

          v32 = objc_msgSend(v13, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(v28, "intValue")));
          -[HDDemoDataReproductiveHealthSampleGenerator addMenstruationSampleForDemoPersonFromWatch:date:flow:objectCollection:](v32, 1, 3, v14);

          ++v30;
          v31 = v28;
        }
        while (v27 != v30);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v104 objects:v115 count:16];
      }
      while (v27);
    }
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v33 = v17;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v100 objects:v114 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      id v36 = 0;
      uint64_t v37 = *(void *)v101;
      do
      {
        uint64_t v38 = 0;
        v39 = v36;
        do
        {
          if (*(void *)v101 != v37) {
            objc_enumerationMutation(v33);
          }
          id v36 = *(id *)(*((void *)&v100 + 1) + 8 * v38);

          v40 = objc_msgSend(v13, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(v36, "intValue")));
          -[HDDemoDataReproductiveHealthSampleGenerator addMenstruationSampleForDemoPersonFromWatch:date:flow:objectCollection:](v40, 2, 2, v14);

          ++v38;
          v39 = v36;
        }
        while (v35 != v38);
        uint64_t v35 = [v33 countByEnumeratingWithState:&v100 objects:v114 count:16];
      }
      while (v35);
    }
    v81 = v33;

    v41 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F17E9168];
    v42 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F17E9180];
    uint64_t v43 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29760]];
    v44 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297C0]];
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v89 = v41;
    uint64_t v45 = [v89 countByEnumeratingWithState:&v96 objects:v113 count:16];
    id v83 = v25;
    if (v45)
    {
      uint64_t v46 = v45;
      v79 = v42;
      id v47 = 0;
      uint64_t v48 = *(void *)v97;
      do
      {
        uint64_t v49 = 0;
        v50 = v47;
        do
        {
          if (*(void *)v97 != v48) {
            objc_enumerationMutation(v89);
          }
          id v47 = *(id *)(*((void *)&v96 + 1) + 8 * v49);

          v51 = objc_msgSend(v13, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(v47, "intValue")));
          -[HDDemoDataReproductiveHealthSampleGenerator addSymptomSampleForDemoPersonFromWatch:date:categoryType:objectCollection:]((uint64_t)v51, v43, v14);

          ++v49;
          v50 = v47;
        }
        while (v46 != v49);
        uint64_t v46 = [v89 countByEnumeratingWithState:&v96 objects:v113 count:16];
      }
      while (v46);

      id v25 = v83;
      v42 = v79;
    }
    v80 = (void *)v43;

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v52 = v42;
    uint64_t v53 = [v52 countByEnumeratingWithState:&v92 objects:v112 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      id v55 = 0;
      uint64_t v56 = *(void *)v93;
      do
      {
        uint64_t v57 = 0;
        v58 = v55;
        do
        {
          if (*(void *)v93 != v56) {
            objc_enumerationMutation(v52);
          }
          id v55 = *(id *)(*((void *)&v92 + 1) + 8 * v57);

          v59 = objc_msgSend(v13, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(v55, "intValue")));
          -[HDDemoDataReproductiveHealthSampleGenerator addSymptomSampleForDemoPersonFromWatch:date:categoryType:objectCollection:]((uint64_t)v59, (uint64_t)v44, v14);

          ++v57;
          v58 = v55;
        }
        while (v54 != v57);
        uint64_t v54 = [v52 countByEnumeratingWithState:&v92 objects:v112 count:16];
      }
      while (v54);

      id v25 = v83;
    }

    id v12 = v82;
    v60 = -[HDDemoDataReproductiveHealthSampleGenerator _computeFirstRunCycleFactorSamplesForDemoPerson:targetDate:](v82, v13);
    if (v60) {
      [v14 addObjectsFromWatch:v60];
    }

    id v9 = v84;
  }

  id v10 = v86;
LABEL_70:
}

- (void)completeOnboardingForDemoPerson:(void *)a1
{
  v48[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F2B2D8]);
  uint64_t v3 = *MEMORY[0x1E4F29D80];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  objc_super v5 = (void *)[v2 initWithFeatureIdentifier:v3 version:2 completionDate:v4 countryCode:0 countryCodeProvenance:0];

  uint64_t v34 = a1;
  double v6 = [a1 profile];
  double v7 = [v6 onboardingCompletionManager];
  id v40 = 0;
  LOBYTE(v4) = [v7 insertOnboardingCompletion:v5 error:&v40];
  id v8 = v40;

  if (v4)
  {
    id v30 = v8;
    v31 = v5;
    id v9 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v33 = [v9 countryCode];

    id v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v11 = *MEMORY[0x1E4F29D88];
    v48[0] = *MEMORY[0x1E4F29D90];
    v48[1] = v11;
    uint64_t v12 = *MEMORY[0x1E4F29D98];
    v48[2] = *MEMORY[0x1E4F29DD0];
    v48[3] = v12;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * v16);
          uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F2B2D8]) initWithFeatureIdentifier:v17 version:1 completionDate:v10 countryCode:v33 countryCodeProvenance:102];
          uint64_t v19 = [v34 profile];
          id v20 = [v19 onboardingCompletionManager];
          id v35 = 0;
          char v21 = [v20 insertOnboardingCompletion:v18 error:&v35];
          id v22 = v35;

          if ((v21 & 1) == 0)
          {
            _HKInitializeLogging();
            v23 = (void *)*MEMORY[0x1E4F29F30];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
            {
              v24 = v23;
              id v25 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              id v42 = v25;
              __int16 v43 = 2114;
              uint64_t v44 = v17;
              __int16 v45 = 2114;
              id v46 = v22;
              id v26 = v25;
              _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to insert onboarding record for %{public}@: %{public}@", buf, 0x20u);
            }
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
      }
      while (v14);
    }

    id v8 = v30;
    objc_super v5 = v31;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v27 = *MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v42 = v8;
      _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "Failed to insert Cycle Tracking onboarding completion: %{public}@", buf, 0xCu);
    }
  }
  id v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.private.health.menstrual-cycles"];
  [v28 setBool:1 forKey:@"MenstruationNotificationsEnabled"];
  [v28 setBool:1 forKey:@"MenstruationProjectionsEnabled"];
  [v28 setBool:1 forKey:@"FertileWindowProjectionsEnabled"];
  [v28 setBool:1 forKey:@"FertileWindowNotificationsEnabled"];
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v28 setObject:v29 forKey:@"ShouldHideByDisplayTypeIdentifier"];
}

void __115__HDDemoDataReproductiveHealthSampleGenerator_generatePhoneFirstRunSampleForDemoPerson_firstDate_objectCollection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29810]];
  v1 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = v0;
}

- (uint64_t)menstrualFlowForDemoPerson:(void *)a3 withSampleDate:
{
  id v5 = a3;
  if (a1)
  {
    double v6 = (void *)MEMORY[0x1E4F1C9A8];
    id v7 = a2;
    id v8 = [v6 currentCalendar];
    id v9 = [v8 components:16 fromDate:v5];

    uint64_t v10 = [v7 biologicalSex];
    if (v10 == 2)
    {
      uint64_t v11 = [v9 day];
    }
    else
    {
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F17E91F8];
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F17E9210];
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F17E9228];
      uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "day"));
      int v16 = [v12 containsObject:v15];

      if (v16
        || (objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "day")),
            uint64_t v17 = objc_claimAutoreleasedReturnValue(),
            int v18 = [v13 containsObject:v17],
            v17,
            v18))
      {
        uint64_t v11 = [v9 day];
      }
      else
      {
        uint64_t v19 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        id v20 = [v19 components:8 fromDate:v5];

        if (([v20 month] & 1) == 0)
        {
          char v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "day"));
          [v14 containsObject:v21];
        }
        uint64_t v11 = [v9 day];
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_computeFirstRunCycleFactorSamplesForDemoPerson:(void *)a1 targetDate:(void *)a2
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 biologicalSex] == 2)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    double v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(&unk_1F17EB088, "intValue") - 280);
    id v7 = objc_msgSend(v4, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(v6, "intValue")));
    id v8 = objc_msgSend(v4, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(&unk_1F17EB088, "intValue")));
    id v9 = [v3 birthDateComponents];
    uint64_t v10 = HDDemoData_ageBetweenNSDateComponentsAndDate(v9, v7);

    if (v10 >= 21)
    {
      uint64_t v11 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29840]];
      uint64_t v12 = [MEMORY[0x1E4F2ACB0] categorySampleWithType:v11 value:0 startDate:v7 endDate:v8];
      [v5 addObject:v12];
    }
    uint64_t v13 = objc_msgSend(v4, "dateByAddingTimeInterval:", (double)(int)(86400 * objc_msgSend(&unk_1F17EB0A0, "intValue")));
    uint64_t v14 = [v3 birthDateComponents];
    uint64_t v15 = HDDemoData_ageBetweenNSDateComponentsAndDate(v14, v13);

    if (v15 >= 18)
    {
      int v16 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29788]];
      uint64_t v17 = (void *)MEMORY[0x1E4F2ACB0];
      int v18 = [MEMORY[0x1E4F1C9C8] distantFuture];
      uint64_t v19 = [v17 categorySampleWithType:v16 value:1 startDate:v13 endDate:v18];

      [v5 addObject:v19];
    }
  }

  return v5;
}

- (void)addMenstruationSampleForDemoPersonFromWatch:(void *)a1 date:(uint64_t)a2 flow:(uint64_t)a3 objectCollection:(void *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F2ACB8];
  uint64_t v8 = *MEMORY[0x1E4F29810];
  id v9 = a4;
  id v10 = a1;
  uint64_t v11 = [v7 categoryTypeForIdentifier:v8];
  uint64_t v15 = *MEMORY[0x1E4F2A1A8];
  uint64_t v12 = [NSNumber numberWithBool:a2 == 0];
  v16[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  uint64_t v14 = [MEMORY[0x1E4F2ACB0] categorySampleWithType:v11 value:a3 startDate:v10 endDate:v10 metadata:v13];

  [v9 addObjectFromWatch:v14];
}

- (void)addSymptomSampleForDemoPersonFromWatch:(void *)a3 date:categoryType:objectCollection:
{
  id v5 = (void *)MEMORY[0x1E4F2ACB0];
  id v6 = a3;
  id v7 = [v5 categorySampleWithType:a2 value:0 startDate:a1 endDate:a1];
  [v6 addObjectFromWatch:v7];
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDDemoDataReproductiveHealthSampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v11 setupWithDemoDataGenerator:v4];
  basalBodyTempMultiplierTable = self->_basalBodyTempMultiplierTable;
  self->_basalBodyTempMultiplierTable = (NSArray *)&unk_1F17E9198;

  cervicalMucusTable = self->_cervicalMucusTable;
  self->_cervicalMucusTable = (NSArray *)&unk_1F17E91B0;

  if (![(HDDemoDataBaseSampleGenerator *)self createdFromNSKeyedUnarchiver])
  {
    id v7 = [v4 statisticsSampleGenerator];
    uint64_t v8 = [v4 demoPerson];
    [v8 genericSampleTimeNoiseStdDev];
    [v7 computeNoiseFromTime:0.0 stdDev:v9];
    self->_nextSexualActivitySampleTime = v10 + 0.923611111;
  }
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  v201[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  v197.receiver = self;
  v197.super_class = (Class)HDDemoDataReproductiveHealthSampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v197 generateObjectsForDemoPerson:v11 fromTime:v12 toTime:v13 currentDate:a5 objectCollection:a5];
  if (qword_1E9FC5188 != -1) {
    dispatch_once(&qword_1E9FC5188, &__block_literal_global_354);
  }
  uint64_t v14 = [v12 dateByAddingTimeInterval:-86400.0];
  id v15 = v11;
  if (self)
  {
    int v16 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    uint64_t v17 = [v16 currentDateFromCurrentTime:a5];

    int v18 = [v15 birthDateComponents];
    uint64_t v19 = HDDemoData_ageBetweenNSDateComponentsAndDate(v18, v17);

    if (v19 < 18 || self->_nextSexualActivitySampleTime > a5) {
      goto LABEL_20;
    }
    id v20 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    char v21 = [v20 statisticsSampleGenerator];
    [v21 computeNoiseFromTime:a5 stdDev:0.00694444444];
    self->_nextSexualActivitySampleTime = v22 + 1.0 + self->_nextSexualActivitySampleTime;

    [v15 sexualActivityProbabilityPercentage];
    double v24 = v23;
    [v15 sexualActivityProtectionProbabilityPercentage];
    double v26 = v25;
    [v15 sexualActivityProtectionDocumentationProbabilityPercentage];
    double v28 = v27;
    if ([v15 sexualActivityIsTryingToConceive])
    {
      [v15 sexualActivityProbabilityPercentage];
      double v24 = v29 * 1.5;
      double v26 = 0.0;
    }
    if ([v15 biologicalSex] == 1)
    {
      id v30 = v15;
      if ([v30 biologicalSex] == 2)
      {
LABEL_12:

        goto LABEL_13;
      }
      v195 = v14;
      id v31 = v13;
      id v32 = v12;
      id v33 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      uint64_t v34 = [v33 currentDateFromCurrentTime:a5];

      id v35 = [v30 birthDateComponents];
      uint64_t v36 = HDDemoData_ageBetweenNSDateComponentsAndDate(v35, v34);

      if (v36 <= 10)
      {

        id v12 = v32;
        id v13 = v31;
        uint64_t v14 = v195;
        goto LABEL_12;
      }
      double v128 = (double)[(HDDemoDataReproductiveHealthSampleGenerator *)self _computeNextLuteinizingHormoneSurgeForDemoPerson:v30 atTime:a5];

      id v12 = v32;
      id v13 = v31;
      uint64_t v14 = v195;
      if (double)(uint64_t)a5 == v128 && ([v30 sexualActivityIsTryingToConceive]) {
        goto LABEL_14;
      }
    }
LABEL_13:
    long long v37 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
    long long v38 = [v37 statisticsSampleGenerator];
    [v38 pseudoRandomDoubleFromTime:a5 * 5.0];
    double v40 = v39;

    if (v40 < v24)
    {
LABEL_14:
      v41 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      id v42 = [v41 statisticsSampleGenerator];
      [v42 pseudoRandomDoubleFromTime:a5 * 6.0];
      double v44 = v43;

      if (v44 < 0.1)
      {
        __int16 v45 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        id v46 = [v45 statisticsSampleGenerator];
        [v46 computeNoiseFromTime:a5 stdDev:0.0104166667];
        self->_nextSexualActivitySampleTime = self->_nextSexualActivitySampleTime - (v47 + 0.958333333);
      }
      uint64_t v48 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      uint64_t v49 = [v48 statisticsSampleGenerator];
      [v49 pseudoRandomDoubleFromTime:a5 * 7.0];
      double v51 = v50;

      if (v51 >= v28)
      {
        uint64_t v56 = &unk_1F17EB1F0;
      }
      else
      {
        id v52 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        uint64_t v53 = [v52 statisticsSampleGenerator];
        [v53 pseudoRandomDoubleFromTime:a5 * 3.0];
        double v55 = v54;

        if (v55 >= v26) {
          uint64_t v56 = &unk_1F17EB1D8;
        }
        else {
          uint64_t v56 = &unk_1F17EB1C0;
        }
      }
      goto LABEL_21;
    }
LABEL_20:
    uint64_t v56 = 0;
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v56 = 0;
LABEL_22:

  id v57 = v56;
  v58 = v57;
  if (v57)
  {
    int v59 = [v57 intValue];
    if ([v58 intValue] == 1)
    {
      v60 = 0;
    }
    else
    {
      uint64_t v200 = *MEMORY[0x1E4F2A1D8];
      id v61 = [NSNumber numberWithBool:v59 == 3];
      v201[0] = v61;
      v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v201 forKeys:&v200 count:1];
    }
    id v62 = [MEMORY[0x1E4F2ACB0] categorySampleWithType:qword_1E9FC5150 value:0 startDate:v14 endDate:v14 metadata:v60];
    [v13 addObjectFromPhone:v62];
  }
  v63 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
  v64 = [v63 currentDateFromCurrentTime:a5];

  uint64_t v65 = [v15 birthDateComponents];
  uint64_t v66 = HDDemoData_ageBetweenNSDateComponentsAndDate(v65, v64);

  if ([v15 biologicalSex] == 1 && v66 >= 12)
  {
    v194 = v64;
    v196 = v14;
    id v67 = v15;
    id v68 = v67;
    if (self)
    {
      uint64_t v69 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      uint64_t v70 = [v69 currentDateFromCurrentTime:a5];

      uint64_t v71 = [v68 birthDateComponents];
      uint64_t v72 = HDDemoData_ageBetweenNSDateComponentsAndDate(v71, v70);

      if (v72 < 21) {
        goto LABEL_35;
      }
      double v73 = a5 - (double)(uint64_t)a5;
      v74 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
      v75 = [v74 statisticsSampleGenerator];
      [v75 pseudoRandomDoubleFromTime:(double)(uint64_t)a5];
      double v77 = v76 * 3.0 + 4.0;

      double v78 = v77 / 24.0;
      [v68 timeIncrement];
      double v80 = v73 - v79;
      if (v73 >= v78 && v80 < v78)
      {
        id v83 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        id v84 = [v83 vitalsSampleGenerator];
        [v84 _computeBodyTempInCelsiusForDemoPerson:v68 atTime:0 addNoise:a5];
        double v86 = v85;

        id v87 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        id v88 = [v87 statisticsSampleGenerator];
        [v68 bodyTempSampleNoiseStdDev];
        [v88 computeNoiseFromTime:a5 stdDev:v89];
        double v91 = v90;

        long long v92 = NSNumber;
        double v93 = __exp10(2.0);
        v82 = [v92 numberWithDouble:(double)(uint64_t)((v86 + v91) * v93) / v93];
      }
      else
      {
LABEL_35:
        v82 = 0;
      }

      if (v82)
      {
        long long v94 = (void *)MEMORY[0x1E4F2B370];
        uint64_t v95 = qword_1E9FC5148;
        [v82 doubleValue];
        long long v96 = objc_msgSend(v94, "quantityWithUnit:doubleValue:", v95);
        long long v97 = [MEMORY[0x1E4F2B388] quantitySampleWithType:qword_1E9FC5158 quantity:v96 startDate:v12 endDate:v12];
        [v13 addObjectFromPhone:v97];
      }
      v193 = v82;
      id v98 = v68;
      if ([v98 biologicalSex] != 2
        && ([v98 biologicalSex] != 1
         || [v98 sexualActivityIsTryingToConceive]))
      {
        long long v99 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
        long long v100 = [v99 currentDateFromCurrentTime:a5];

        long long v101 = [v98 birthDateComponents];
        v190 = v100;
        uint64_t v102 = HDDemoData_ageBetweenNSDateComponentsAndDate(v101, v100);

        if (v102 >= 11)
        {
          id v186 = v12;
          double v105 = a5 - (double)(uint64_t)a5;
          long long v106 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
          long long v107 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          char v108 = [v106 isDemoDataTimeInWeekend:v107 calendar:a5];

          if (v108) {
            [v98 weekendSleepParameters];
          }
          else {
          v189 = [v98 weekdaySleepParameters];
          }
          [v189 wakeUpTime];
          double v110 = v109 + 0.00763888889;
          long long v111 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
          v112 = [v111 statisticsSampleGenerator];
          [v98 genericSampleTimeNoiseStdDev];
          [v112 computeNoiseFromTime:a5 stdDev:v113 * 0.5];
          double v115 = v110 + v114;

          [v98 timeIncrement];
          long long v103 = 0;
          id v12 = v186;
          if (v105 >= v115 && v105 - v116 < v115)
          {
            v182 = v58;
            id v117 = v13;
            [v98 menstrualPeriodFrequency];
            uint64_t v119 = (uint64_t)v118;
            v120 = [(NSArray *)self->_cervicalMucusTable objectAtIndexedSubscript:[(HDDemoDataReproductiveHealthSampleGenerator *)self cycleDayIndexAtTime:v98 demoPerson:a5]];
            int v121 = [v120 intValue];
            unint64_t v122 = v121;

            if ((v121 & 0xFFFFFFFE) == 2)
            {
              v123 = [(HDDemoDataBaseSampleGenerator *)self demoDataGenerator];
              v124 = [v123 statisticsSampleGenerator];
              [v124 pseudoRandomDoubleFromTime:a5];
              unint64_t v122 = vcvtpd_s64_f64((double)(int)v122 - v125);
            }
            uint64_t v126 = (uint64_t)a5 % v119;
            if (v119 >= 0) {
              uint64_t v127 = v119;
            }
            else {
              uint64_t v127 = v119 + 1;
            }
            id v12 = v186;
            id v13 = v117;
            if (v126 > (v127 >> 1) + 3)
            {
              v58 = v182;
              long long v103 = 0;
            }
            else
            {
              v58 = v182;
              long long v103 = 0;
              if (v122)
              {
                long long v103 = [NSNumber numberWithInteger:v122];
              }
            }
          }
        }
        else
        {
          long long v103 = 0;
        }

        if (!v103)
        {
          uint64_t v14 = v196;
          goto LABEL_68;
        }
        uint64_t v14 = v196;
        long long v104 = objc_msgSend(MEMORY[0x1E4F2ACB0], "categorySampleWithType:value:startDate:endDate:", qword_1E9FC5160, (int)objc_msgSend(v103, "intValue"), v196, v196);
        [v13 addObjectFromPhone:v104];
LABEL_67:

LABEL_68:
        if (self->_nextCycleDaySampleTime <= a5)
        {
          uint64_t v129 = -[HDDemoDataReproductiveHealthSampleGenerator menstrualFlowForDemoPerson:withSampleDate:]((uint64_t)self, v68, v14);
          if (v130 != 0xFFFFFFFF80000000)
          {
            uint64_t v131 = v130;
            uint64_t v198 = *MEMORY[0x1E4F2A1A8];
            v132 = [NSNumber numberWithBool:v129 == 0];
            v199 = v132;
            v133 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v199 forKeys:&v198 count:1];

            v134 = [MEMORY[0x1E4F2ACB0] categorySampleWithType:qword_1E9FC5168 value:v131 startDate:v196 endDate:v196 metadata:v133];
            [v13 addObjectFromPhone:v134];

            uint64_t v14 = v196;
          }
          v191 = v103;
          id v135 = v68;
          id v136 = v14;
          id v185 = v135;
          if ([v135 biologicalSex] == 2)
          {
            v137 = 0;
          }
          else
          {
            v183 = v58;
            id v138 = v13;
            id v187 = v12;
            v139 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F17E91C8];
            v140 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F17E91E0];
            v141 = [MEMORY[0x1E4F1C9A8] currentCalendar];
            v142 = [v141 components:16 fromDate:v136];

            v143 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v142, "day"));
            char v144 = [v139 containsObject:v143];

            if (v144)
            {
              v137 = &unk_1F17EB1D8;
            }
            else
            {
              v145 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v142, "day"));
              int v146 = [v140 containsObject:v145];

              if (v146) {
                v137 = &unk_1F17EB1F0;
              }
              else {
                v137 = 0;
              }
            }

            id v135 = v185;
            id v12 = v187;
            id v13 = v138;
            v58 = v183;
          }
          v192 = v13;

          id v147 = v137;
          id v148 = v147;
          if (v147)
          {
            v149 = objc_msgSend(MEMORY[0x1E4F2ACB0], "categorySampleWithType:value:startDate:endDate:", qword_1E9FC5170, (int)objc_msgSend(v147, "intValue"), v136, v136);
            [v13 addObjectFromPhone:v149];
          }
          v188 = v148;
          v150 = [MEMORY[0x1E4F2B860] sharedBehavior];
          char v151 = [v150 isAppleWatch];

          if ((v151 & 1) == 0)
          {
            v152 = (void *)MEMORY[0x1E4F1C9A8];
            id v153 = v136;
            id v154 = v135;
            v155 = [v152 currentCalendar];
            v156 = [v155 components:16 fromDate:v153];

            uint64_t v157 = [v154 biologicalSex];
            v158 = &unk_1F17EB268;
            if (v157 != 2)
            {
              v184 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F17E9240];
              v159 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v156, "day"));
              id v160 = v153;
              v161 = v156;
              v162 = v58;
              id v163 = v12;
              int v164 = [v184 containsObject:v159];

              BOOL v165 = v164 == 0;
              id v12 = v163;
              v58 = v162;
              v156 = v161;
              id v153 = v160;
              if (!v165) {
                v158 = &unk_1F17EB148;
              }
            }
            id v166 = v158;
            if ([v166 isEqualToNumber:&unk_1F17EB148])
            {
              v167 = [MEMORY[0x1E4F2ACB0] categorySampleWithType:qword_1E9FC5178 value:0 startDate:v153 endDate:v153];
              [v192 addObjectFromPhone:v167];
            }
            id v135 = v185;
          }
          id v168 = v12;
          v169 = (void *)MEMORY[0x1E4F1C9A8];
          id v170 = v136;
          id v171 = v135;
          v172 = [v169 currentCalendar];
          v173 = [v172 components:16 fromDate:v170];

          uint64_t v174 = [v171 biologicalSex];
          v175 = &unk_1F17EB268;
          if (v174 != 2)
          {
            v176 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F17E9258];
            v177 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v173, "day"));
            int v178 = [v176 containsObject:v177];

            if (v178) {
              v175 = &unk_1F17EB148;
            }
          }
          id v179 = v175;
          id v13 = v192;
          if ([v179 isEqualToNumber:&unk_1F17EB148])
          {
            v180 = [MEMORY[0x1E4F2ACB0] categorySampleWithType:qword_1E9FC5180 value:0 startDate:v170 endDate:v170];
            [v192 addObjectFromPhone:v180];
          }
          self->_nextCycleDaySampleTime = a5 + 1.0;

          id v12 = v168;
          uint64_t v14 = v196;
          long long v103 = v191;
        }

        v64 = v194;
        goto LABEL_98;
      }
      long long v103 = 0;
    }
    else
    {

      id v181 = v68;
      long long v103 = 0;
      v193 = 0;
    }
    long long v104 = v68;
    uint64_t v14 = v196;
    goto LABEL_67;
  }
LABEL_98:
}

void __121__HDDemoDataReproductiveHealthSampleGenerator_generateObjectsForDemoPerson_fromTime_toTime_currentDate_objectCollection___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F2B618] degreeCelsiusUnit];
  v1 = (void *)qword_1E9FC5148;
  qword_1E9FC5148 = v0;

  uint64_t v2 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29860]];
  id v3 = (void *)qword_1E9FC5150;
  qword_1E9FC5150 = v2;

  uint64_t v4 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5F8]];
  id v5 = (void *)qword_1E9FC5158;
  qword_1E9FC5158 = v4;

  uint64_t v6 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29780]];
  id v7 = (void *)qword_1E9FC5160;
  qword_1E9FC5160 = v6;

  uint64_t v8 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29810]];
  double v9 = (void *)qword_1E9FC5168;
  qword_1E9FC5168 = v8;

  uint64_t v10 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29830]];
  id v11 = (void *)qword_1E9FC5170;
  qword_1E9FC5170 = v10;

  uint64_t v12 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29760]];
  id v13 = (void *)qword_1E9FC5178;
  qword_1E9FC5178 = v12;

  uint64_t v14 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F297C0]];
  id v15 = (void *)qword_1E9FC5180;
  qword_1E9FC5180 = v14;
}

- (int64_t)cycleDayIndexAtTime:(double)a3 demoPerson:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(HDDemoDataReproductiveHealthSampleGenerator *)self _computeNextLuteinizingHormoneSurgeForDemoPerson:v6 atTime:a3]+ 1;
  [v6 menstrualPeriodFrequency];
  double v9 = v8;

  return (uint64_t)a3 % (uint64_t)v9 + v7 / (uint64_t)v9 * (uint64_t)v9 - v7 + 15;
}

- (id)_basalBodyTempMultiplier
{
  return self->_basalBodyTempMultiplierTable;
}

- (int64_t)_computeNextLuteinizingHormoneSurgeForDemoPerson:(id)a3 atTime:(double)a4
{
  id v5 = a3;
  [v5 menstrualPeriodFrequency];
  uint64_t v7 = (uint64_t)(v6 * 0.5 + -1.0);
  [v5 menstrualPeriodFrequency];
  double v9 = (double)(uint64_t)((double)(uint64_t)a4 / v8);
  [v5 menstrualPeriodFrequency];
  double v11 = v10;

  return (uint64_t)(v11 * v9) + v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cervicalMucusTable, 0);

  objc_storeStrong((id *)&self->_basalBodyTempMultiplierTable, 0);
}

@end