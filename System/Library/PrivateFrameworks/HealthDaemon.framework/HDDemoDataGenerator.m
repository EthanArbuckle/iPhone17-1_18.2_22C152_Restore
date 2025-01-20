@interface HDDemoDataGenerator
- (BOOL)isDemoDataTimeInWeekend:(double)a3 calendar:(id)a4;
- (HDDemoDataActivitySampleGenerator)activitySampleGenerator;
- (HDDemoDataAlcoholSampleGenerator)alcoholSampleGenerator;
- (HDDemoDataAudioExposureSampleGenerator)audioExposureSampleGenerator;
- (HDDemoDataAudiogramSampleGenerator)audiogramSampleGenerator;
- (HDDemoDataBodySampleGenerator)bodySampleGenerator;
- (HDDemoDataFoodSampleGenerator)foodSampleGenerator;
- (HDDemoDataGenerator)init;
- (HDDemoDataGenerator)initWithProfile:(id)a3 configuration:(id)a4 queue:(id)a5;
- (HDDemoDataGenerator)initWithProfile:(id)a3 queue:(id)a4;
- (HDDemoDataGeneratorConfiguration)configuration;
- (HDDemoDataGeneratorState)generatorState;
- (HDDemoDataHealthDocumentSampleGenerator)healthDocumentSampleGenerator;
- (HDDemoDataHeartSampleGenerator)heartSampleGenerator;
- (HDDemoDataMindfulnessSampleGenerator)mindfulnessSampleGenerator;
- (HDDemoDataMobilitySampleGenerator)mobilitySampleGenerator;
- (HDDemoDataOtherAndAdditionalSampleGenerator)otherAndAdditionalSampleGenerator;
- (HDDemoDataPathologySampleGenerator)pathologySampleGenerator;
- (HDDemoDataPerson)demoPerson;
- (HDDemoDataReproductiveHealthSampleGenerator)reproductiveHealthSampleGenerator;
- (HDDemoDataSleepSampleGenerator)sleepSampleGenerator;
- (HDDemoDataStatisticsSampleGenerator)statisticsSampleGenerator;
- (HDDemoDataSymptomsSampleGenerator)symptomsSampleGenerator;
- (HDDemoDataVitalsSampleGenerator)vitalsSampleGenerator;
- (HDKeyValueDomain)_keyValueDomain;
- (HDProfile)profile;
- (double)_timeIntervalFromInitialGenerationPeriod:(void *)a3 currentDate:;
- (id)_phoneProveance;
- (id)_unarchiveDataWithClass:(uint64_t)a3 error:;
- (id)currentDateFromCurrentTime:(double)a3;
- (id)firstSampleDate;
- (id)gregorianCalendar;
- (int64_t)firstSampleDayOfYear;
- (uint64_t)_archiveObject:(uint64_t)a3 error:;
- (uint64_t)_queue_unarchivePluginGenerators;
- (void)_insertIntoDatabaseObjectCollection:(void *)a3 fromPerson:;
- (void)_queue_generateDataForDemoPerson:(void *)a3 startDate:(void *)a4 endDate:(uint64_t)a5 firstRun:(void *)a6 completionHandler:;
- (void)_queue_runDemoDataGeneratorForDemoPerson:(void *)a3 endDate:(void *)a4 completion:;
- (void)generateThroughEndDate:(id)a3 completion:(id)a4;
- (void)setActivitySampleGenerator:(id)a3;
- (void)setAlcoholSampleGenerator:(id)a3;
- (void)setAudioExposureSampleGenerator:(id)a3;
- (void)setAudiogramSampleGenerator:(id)a3;
- (void)setBodySampleGenerator:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDemoPerson:(id)a3;
- (void)setFoodSampleGenerator:(id)a3;
- (void)setHealthDocumentSampleGenerator:(id)a3;
- (void)setHeartSampleGenerator:(id)a3;
- (void)setMindfulnessSampleGenerator:(id)a3;
- (void)setMobilitySampleGenerator:(id)a3;
- (void)setOtherAndAdditionalSampleGenerator:(id)a3;
- (void)setPathologySampleGenerator:(id)a3;
- (void)setReproductiveHealthSampleGenerator:(id)a3;
- (void)setSleepSampleGenerator:(id)a3;
- (void)setStatisticsSampleGenerator:(id)a3;
- (void)setSymptomsSampleGenerator:(id)a3;
- (void)setVitalsSampleGenerator:(id)a3;
@end

@implementation HDDemoDataGenerator

- (HDDemoDataGenerator)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDDemoDataGenerator)initWithProfile:(id)a3 queue:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CB18];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 standardUserDefaults];
  v10 = +[HDDemoDataGeneratorConfiguration configurationFromDefaults:v9];
  v11 = [(HDDemoDataGenerator *)self initWithProfile:v8 configuration:v10 queue:v7];

  return v11;
}

- (HDDemoDataGenerator)initWithProfile:(id)a3 configuration:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HDDemoDataGenerator;
  v11 = [(HDDemoDataGenerator *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_queue, a5);
    id v13 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v14 = [v13 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    gregorianCalendar = v12->_gregorianCalendar;
    v12->_gregorianCalendar = (NSCalendar *)v14;

    v16 = v12->_gregorianCalendar;
    v17 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    [(NSCalendar *)v16 setTimeZone:v17];

    v12->_isGeneratingDemoData = 0;
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    appProvenances = v12->_appProvenances;
    v12->_appProvenances = v18;

    objc_storeStrong((id *)&v12->_configuration, a4);
  }

  return v12;
}

- (void)generateThroughEndDate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[HKDaemonTransaction transactionWithOwner:self activityName:@"demo-data-generation"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HDDemoDataGenerator_generateThroughEndDate_completion___block_invoke;
  aBlock[3] = &unk_1E6306D30;
  id v20 = v9;
  id v21 = v8;
  id v10 = v9;
  v11 = _Block_copy(aBlock);
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__HDDemoDataGenerator_generateThroughEndDate_completion___block_invoke_2;
  v15[3] = &unk_1E63031B0;
  id v17 = v11;
  SEL v18 = a2;
  v15[4] = self;
  id v16 = v7;
  id v13 = v7;
  id v14 = v11;
  dispatch_async(queue, v15);
}

void __57__HDDemoDataGenerator_generateThroughEndDate_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a4;
  [v5 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__HDDemoDataGenerator_generateThroughEndDate_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  v3 = *(void **)(v2 + 88);
  if (v3)
  {
    uint64_t v4 = (void *)a1[5];
    v5 = (void *)a1[6];
    -[HDDemoDataGenerator _queue_runDemoDataGeneratorForDemoPerson:endDate:completion:](v2, v3, v4, v5);
  }
  else
  {
    uint64_t v6 = a1[6];
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a1[7], @"Unable to generate demo data bbefore a person has been set."");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, id))(v6 + 16))(v6, 0, 0, v7);
  }
}

- (void)_queue_runDemoDataGeneratorForDemoPerson:(void *)a3 endDate:(void *)a4 completion:
{
  uint64_t v251 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    int v10 = [*(id *)(a1 + 96) shouldGenerateMedicalID];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__HDDemoDataGenerator__queue_runDemoDataGeneratorForDemoPerson_endDate_completion___block_invoke;
    aBlock[3] = &unk_1E6306D58;
    void aBlock[4] = a1;
    id v225 = v9;
    v11 = _Block_copy(aBlock);
    v12 = v11;
    if (*(unsigned char *)(a1 + 72))
    {
LABEL_108:

      goto LABEL_109;
    }
    int v213 = v10;
    v214 = v11;
    id v215 = v9;
    v216 = v8;
    *(unsigned char *)(a1 + 72) = 1;
    id v13 = (objc_class *)objc_opt_class();
    v249[0] = 0;
    uint64_t v14 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v13, (uint64_t)v249);
    id v15 = v249[0];
    id v16 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v14;

    id v17 = off_1E62EF000;
    SEL v18 = (NSObject **)MEMORY[0x1E4F29F30];
    v217 = v7;
    if (!*(void *)(a1 + 48))
    {
      _HKInitializeLogging();
      v87 = *v18;
      if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
LABEL_69:

        goto LABEL_70;
      }
      LODWORD(buf[0]) = 138543362;
      *(void *)((char *)buf + 4) = v15;
      v88 = "Failed to unarchive data for HDDemoDataGeneratorState: %{public}@";
LABEL_32:
      _os_log_error_impl(&dword_1BCB7D000, v87, OS_LOG_TYPE_ERROR, v88, (uint8_t *)buf, 0xCu);
      goto LABEL_69;
    }
    v19 = (objc_class *)objc_opt_class();
    *(void *)&long long v245 = v15;
    uint64_t v20 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v19, (uint64_t)&v245);
    id v21 = (id)v245;

    v22 = *(void **)(a1 + 216);
    *(void *)(a1 + 216) = v20;

    if (!*(void *)(a1 + 216))
    {
      _HKInitializeLogging();
      v89 = *MEMORY[0x1E4F29F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf[0]) = 138543362;
        *(void *)((char *)buf + 4) = v21;
        v94 = "Failed to unarchive data for HDDemoDataStatisticsSampleGenerator: %{public}@";
LABEL_48:
        _os_log_error_impl(&dword_1BCB7D000, v89, OS_LOG_TYPE_ERROR, v94, (uint8_t *)buf, 0xCu);
      }
LABEL_34:
      id v15 = v21;
      goto LABEL_69;
    }
    v23 = (objc_class *)objc_opt_class();
    *(void *)&long long v241 = v21;
    uint64_t v24 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v23, (uint64_t)&v241);
    id v15 = (id)v241;

    v25 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = v24;

    v26 = *(void **)(a1 + 104);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v28 = -[HDDemoDataGenerator _phoneProveance](a1);
    [v26 setProfile:WeakRetained provenance:v28];

    if (*(void *)(a1 + 104))
    {
      v29 = (objc_class *)objc_opt_class();
      id v240 = v15;
      uint64_t v30 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v29, (uint64_t)&v240);
      id v31 = v240;

      v32 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v30;

      if (*(void *)(a1 + 112))
      {
        v33 = (objc_class *)objc_opt_class();
        id v239 = v31;
        uint64_t v34 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v33, (uint64_t)&v239);
        id v15 = v239;

        v35 = *(void **)(a1 + 120);
        *(void *)(a1 + 120) = v34;

        if (!*(void *)(a1 + 120))
        {
          _HKInitializeLogging();
          v90 = *MEMORY[0x1E4F29F30];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)) {
            goto LABEL_68;
          }
          LODWORD(buf[0]) = 138543362;
          *(void *)((char *)buf + 4) = v15;
          v91 = "Failed to unarchive data for HDDemoDataAudioExposureSampleGenerator: %{public}@";
          goto LABEL_63;
        }
        v36 = (objc_class *)objc_opt_class();
        id v238 = v15;
        uint64_t v37 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v36, (uint64_t)&v238);
        id v31 = v238;

        v38 = *(void **)(a1 + 128);
        *(void *)(a1 + 128) = v37;

        if (*(void *)(a1 + 128))
        {
          v39 = (objc_class *)objc_opt_class();
          id v237 = v31;
          uint64_t v40 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v39, (uint64_t)&v237);
          id v15 = v237;

          v41 = *(void **)(a1 + 136);
          *(void *)(a1 + 136) = v40;

          if (!*(void *)(a1 + 136))
          {
            _HKInitializeLogging();
            v90 = *MEMORY[0x1E4F29F30];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)) {
              goto LABEL_68;
            }
            LODWORD(buf[0]) = 138543362;
            *(void *)((char *)buf + 4) = v15;
            v91 = "Failed to unarchive data for HDDemoDataBodySampleGenerator: %{public}@";
            goto LABEL_63;
          }
          v42 = (objc_class *)objc_opt_class();
          id v236 = v15;
          uint64_t v43 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v42, (uint64_t)&v236);
          id v31 = v236;

          v44 = *(void **)(a1 + 144);
          *(void *)(a1 + 144) = v43;

          if (*(void *)(a1 + 144))
          {
            v45 = (objc_class *)objc_opt_class();
            id v235 = v31;
            uint64_t v46 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v45, (uint64_t)&v235);
            id v15 = v235;

            v47 = *(void **)(a1 + 152);
            *(void *)(a1 + 152) = v46;

            if (!*(void *)(a1 + 152))
            {
              _HKInitializeLogging();
              v90 = *MEMORY[0x1E4F29F30];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)) {
                goto LABEL_68;
              }
              LODWORD(buf[0]) = 138543362;
              *(void *)((char *)buf + 4) = v15;
              v91 = "Failed to unarchive data for HDDemoDataHealthDocumentSampleGenerator: %{public}@";
              goto LABEL_63;
            }
            v48 = (objc_class *)objc_opt_class();
            id v234 = v15;
            uint64_t v49 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v48, (uint64_t)&v234);
            id v31 = v234;

            v50 = *(void **)(a1 + 160);
            *(void *)(a1 + 160) = v49;

            if (*(void *)(a1 + 160))
            {
              v51 = (objc_class *)objc_opt_class();
              id v233 = v31;
              uint64_t v52 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v51, (uint64_t)&v233);
              id v15 = v233;

              v53 = *(void **)(a1 + 168);
              *(void *)(a1 + 168) = v52;

              if (!*(void *)(a1 + 168))
              {
                _HKInitializeLogging();
                v90 = *MEMORY[0x1E4F29F30];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)) {
                  goto LABEL_68;
                }
                LODWORD(buf[0]) = 138543362;
                *(void *)((char *)buf + 4) = v15;
                v91 = "Failed to unarchive data for HDDemoDataMindfulnessSampleGenerator: %{public}@";
                goto LABEL_63;
              }
              v54 = (objc_class *)objc_opt_class();
              id v232 = v15;
              uint64_t v55 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v54, (uint64_t)&v232);
              id v31 = v232;

              v56 = *(void **)(a1 + 176);
              *(void *)(a1 + 176) = v55;

              if (*(void *)(a1 + 176))
              {
                v57 = (objc_class *)objc_opt_class();
                id v231 = v31;
                uint64_t v58 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v57, (uint64_t)&v231);
                id v15 = v231;

                v59 = *(void **)(a1 + 184);
                *(void *)(a1 + 184) = v58;

                if (*(void *)(a1 + 184))
                {
                  v60 = (objc_class *)objc_opt_class();
                  id v230 = v15;
                  uint64_t v61 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v60, (uint64_t)&v230);
                  id v31 = v230;

                  v62 = *(void **)(a1 + 192);
                  *(void *)(a1 + 192) = v61;

                  if (*(void *)(a1 + 192))
                  {
                    v63 = (objc_class *)objc_opt_class();
                    id v229 = v31;
                    uint64_t v64 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v63, (uint64_t)&v229);
                    id v15 = v229;

                    v65 = *(void **)(a1 + 200);
                    *(void *)(a1 + 200) = v64;

                    if (*(void *)(a1 + 200))
                    {
                      id v66 = objc_loadWeakRetained((id *)(a1 + 80));
                      [*(id *)(a1 + 200) setProfile:v66];

                      v67 = (objc_class *)objc_opt_class();
                      id v228 = v15;
                      uint64_t v68 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v67, (uint64_t)&v228);
                      id v31 = v228;

                      v69 = *(void **)(a1 + 208);
                      *(void *)(a1 + 208) = v68;

                      if (*(void *)(a1 + 208))
                      {
                        id v17 = off_1E62EF000;
                        v70 = (objc_class *)objc_opt_class();
                        id v227 = v31;
                        uint64_t v71 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v70, (uint64_t)&v227);
                        id v15 = v227;

                        v72 = *(void **)(a1 + 224);
                        *(void *)(a1 + 224) = v71;

                        if (*(void *)(a1 + 224))
                        {
                          v73 = (objc_class *)objc_opt_class();
                          id v226 = v15;
                          uint64_t v74 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v73, (uint64_t)&v226);
                          id v21 = v226;

                          v75 = *(void **)(a1 + 232);
                          *(void *)(a1 + 232) = v74;

                          if (*(void *)(a1 + 232))
                          {
                            if (-[HDDemoDataGenerator _queue_unarchivePluginGenerators](a1))
                            {
                              _HKInitializeLogging();
                              v76 = *MEMORY[0x1E4F29F30];
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
                              {
                                LOWORD(buf[0]) = 0;
                                _os_log_impl(&dword_1BCB7D000, v76, OS_LOG_TYPE_DEFAULT, "Successfully restored state from last demo data generation", (uint8_t *)buf, 2u);
                              }

                              v77 = [*(id *)(a1 + 48) lastRunDate];

                              if (v77)
                              {
                                v78 = [*(id *)(a1 + 48) lastRunDate];
                                [v8 timeIntervalSinceDate:v78];
                                double v80 = v79;

                                _HKInitializeLogging();
                                v81 = (void *)*MEMORY[0x1E4F29F30];
                                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
                                {
                                  v82 = *(void **)(a1 + 48);
                                  v83 = v81;
                                  v84 = [v82 lastSampleDate];
                                  LODWORD(buf[0]) = 138412290;
                                  *(void *)((char *)buf + 4) = v84;
                                  _os_log_impl(&dword_1BCB7D000, v83, OS_LOG_TYPE_DEFAULT, "Last sample date: %@", (uint8_t *)buf, 0xCu);
                                }
                                _HKInitializeLogging();
                                v85 = *MEMORY[0x1E4F29F30];
                                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
                                {
                                  LODWORD(buf[0]) = 134217984;
                                  *(double *)((char *)buf + 4) = v80 * 0.000277777778;
                                  _os_log_impl(&dword_1BCB7D000, v85, OS_LOG_TYPE_DEFAULT, "Elapsed time since last run date: %.2f hr", (uint8_t *)buf, 0xCu);
                                }
                                v86 = [*(id *)(a1 + 48) lastSampleDate];
                                id v7 = v217;
                                v12 = v214;
                                -[HDDemoDataGenerator _queue_generateDataForDemoPerson:startDate:endDate:firstRun:completionHandler:](a1, v217, v86, v8, 0, v214);
LABEL_107:
                                id v9 = v215;

                                goto LABEL_108;
                              }
LABEL_70:
                              v95 = objc_alloc_init(HDDemoDataGeneratorState);
                              v96 = *(void **)(a1 + 48);
                              *(void *)(a1 + 48) = v95;

                              v97 = objc_alloc_init(HDDemoDataStatisticsSampleGenerator);
                              v98 = *(void **)(a1 + 216);
                              *(void *)(a1 + 216) = v97;

                              v99 = objc_alloc_init(HDDemoDataActivitySampleGenerator);
                              v100 = *(void **)(a1 + 104);
                              *(void *)(a1 + 104) = v99;

                              v101 = *(void **)(a1 + 104);
                              id v102 = objc_loadWeakRetained((id *)(a1 + 80));
                              v103 = -[HDDemoDataGenerator _phoneProveance](a1);
                              [v101 setProfile:v102 provenance:v103];

                              v104 = objc_alloc_init(HDDemoDataAudioExposureSampleGenerator);
                              v105 = *(void **)(a1 + 120);
                              *(void *)(a1 + 120) = v104;

                              v106 = objc_alloc_init(HDDemoDataAudiogramSampleGenerator);
                              v107 = *(void **)(a1 + 128);
                              *(void *)(a1 + 128) = v106;

                              v108 = objc_alloc_init(HDDemoDataAlcoholSampleGenerator);
                              v109 = *(void **)(a1 + 112);
                              *(void *)(a1 + 112) = v108;

                              v110 = objc_alloc_init(HDDemoDataBodySampleGenerator);
                              v111 = *(void **)(a1 + 136);
                              *(void *)(a1 + 136) = v110;

                              v112 = objc_alloc_init(HDDemoDataFoodSampleGenerator);
                              v113 = *(void **)(a1 + 144);
                              *(void *)(a1 + 144) = v112;

                              v114 = objc_alloc_init(HDDemoDataHealthDocumentSampleGenerator);
                              v115 = *(void **)(a1 + 152);
                              *(void *)(a1 + 152) = v114;

                              v116 = objc_alloc_init(HDDemoDataHeartSampleGenerator);
                              v117 = *(void **)(a1 + 160);
                              *(void *)(a1 + 160) = v116;

                              v118 = *(void **)(a1 + 160);
                              id v119 = objc_loadWeakRetained((id *)(a1 + 80));
                              v120 = -[HDDemoDataGenerator _phoneProveance](a1);
                              [v118 setProfile:v119 provenance:v120];

                              v121 = objc_alloc_init(HDDemoDataMindfulnessSampleGenerator);
                              v122 = *(void **)(a1 + 168);
                              *(void *)(a1 + 168) = v121;

                              v123 = objc_alloc_init(HDDemoDataMobilitySampleGenerator);
                              v124 = *(void **)(a1 + 176);
                              *(void *)(a1 + 176) = v123;

                              id v125 = objc_loadWeakRetained((id *)(a1 + 80));
                              [*(id *)(a1 + 176) setProfile:v125];

                              v126 = objc_alloc_init(HDDemoDataOtherAndAdditionalSampleGenerator);
                              v127 = *(void **)(a1 + 184);
                              *(void *)(a1 + 184) = v126;

                              v128 = objc_alloc_init(HDDemoDataPathologySampleGenerator);
                              v129 = *(void **)(a1 + 192);
                              *(void *)(a1 + 192) = v128;

                              v130 = objc_alloc_init(HDDemoDataReproductiveHealthSampleGenerator);
                              v131 = *(void **)(a1 + 200);
                              *(void *)(a1 + 200) = v130;

                              id v132 = objc_loadWeakRetained((id *)(a1 + 80));
                              [*(id *)(a1 + 200) setProfile:v132];

                              v133 = objc_alloc_init(HDDemoDataSleepSampleGenerator);
                              v134 = *(void **)(a1 + 208);
                              *(void *)(a1 + 208) = v133;

                              id v135 = objc_alloc_init(v17[457]);
                              v136 = *(void **)(a1 + 224);
                              *(void *)(a1 + 224) = v135;

                              v137 = objc_alloc_init(HDDemoDataVitalsSampleGenerator);
                              v138 = *(void **)(a1 + 232);
                              *(void *)(a1 + 232) = v137;

                              id v139 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                              id v220 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                              id v140 = objc_loadWeakRetained((id *)(a1 + 80));
                              v141 = [v140 daemon];
                              v142 = [v141 pluginManager];
                              v143 = [v142 pluginsConformingToProtocol:&unk_1F18A8828];
                              v144 = [v143 allValues];

                              long long v247 = 0u;
                              long long v248 = 0u;
                              long long v245 = 0u;
                              long long v246 = 0u;
                              obuint64_t j = v144;
                              uint64_t v222 = [obj countByEnumeratingWithState:&v245 objects:buf count:16];
                              if (v222)
                              {
                                uint64_t v219 = *(void *)v246;
                                do
                                {
                                  for (uint64_t i = 0; i != v222; ++i)
                                  {
                                    if (*(void *)v246 != v219) {
                                      objc_enumerationMutation(obj);
                                    }
                                    v146 = [*(id *)(*((void *)&v245 + 1) + 8 * i) demoDataGeneratorClasses];
                                    long long v241 = 0u;
                                    long long v242 = 0u;
                                    long long v243 = 0u;
                                    long long v244 = 0u;
                                    uint64_t v147 = [v146 countByEnumeratingWithState:&v241 objects:v249 count:16];
                                    if (v147)
                                    {
                                      uint64_t v148 = v147;
                                      uint64_t v149 = *(void *)v242;
                                      do
                                      {
                                        for (uint64_t j = 0; j != v148; ++j)
                                        {
                                          if (*(void *)v242 != v149) {
                                            objc_enumerationMutation(v146);
                                          }
                                          id v151 = objc_alloc_init(*(Class *)(*((void *)&v241 + 1) + 8 * j));
                                          id v152 = objc_loadWeakRetained((id *)(a1 + 80));
                                          [v151 setDemoDataGenerationContextWithProfile:v152 generatorState:*(void *)(a1 + 48)];

                                          [v139 addObject:v151];
                                        }
                                        uint64_t v148 = [v146 countByEnumeratingWithState:&v241 objects:v249 count:16];
                                      }
                                      while (v148);
                                    }
                                    [v220 addObjectsFromArray:v146];
                                  }
                                  uint64_t v222 = [obj countByEnumeratingWithState:&v245 objects:buf count:16];
                                }
                                while (v222);
                              }

                              v153 = *(void **)(a1 + 32);
                              *(void *)(a1 + 32) = v220;
                              id v154 = v220;

                              v155 = *(void **)(a1 + 24);
                              *(void *)(a1 + 24) = v139;

                              v249[0] = *(id *)MEMORY[0x1E4F2BF98];
                              id v156 = v217;
                              uint64_t v157 = [v156 firstName];
                              v158 = (void *)v157;
                              if (v157) {
                                v159 = (__CFString *)v157;
                              }
                              else {
                                v159 = &stru_1F1728D60;
                              }
                              *(void *)&buf[0] = v159;
                              v249[1] = *(id *)MEMORY[0x1E4F2BFA0];
                              uint64_t v160 = [v156 lastName];
                              v161 = (void *)v160;
                              if (v160) {
                                v162 = (__CFString *)v160;
                              }
                              else {
                                v162 = &stru_1F1728D60;
                              }
                              *((void *)&buf[0] + 1) = v162;
                              v223 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v249 count:2];

                              id v163 = objc_loadWeakRetained((id *)(a1 + 80));
                              v221 = +[HDKeyValueDomain healthAppUserDefaultsDomainWithProfile:v163];

                              [v221 setPropertyListValue:v223 forKey:*MEMORY[0x1E4F2BFB0] error:0];
                              v164 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298A8]];
                              id v165 = objc_loadWeakRetained((id *)(a1 + 80));
                              v166 = [v165 userCharacteristicsManager];
                              v167 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v156, "biologicalSex"));
                              [v166 setUserCharacteristic:v167 forType:v164 error:0];

                              v168 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298B0]];
                              id v169 = objc_loadWeakRetained((id *)(a1 + 80));
                              v170 = [v169 userCharacteristicsManager];
                              v171 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v156, "bloodType"));
                              [v170 setUserCharacteristic:v171 forType:v168 error:0];

                              v172 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298C0]];
                              id v173 = objc_loadWeakRetained((id *)(a1 + 80));
                              v174 = [v173 userCharacteristicsManager];
                              v175 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v156, "fitzpatrickSkinType"));
                              [v174 setUserCharacteristic:v175 forType:v172 error:0];

                              v176 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298B8]];
                              id v177 = objc_loadWeakRetained((id *)(a1 + 80));
                              v178 = [v177 userCharacteristicsManager];
                              v179 = [v156 birthDateComponents];

                              [v178 setUserCharacteristic:v179 forType:v176 error:0];
                              v180 = (os_log_t *)MEMORY[0x1E4F29F30];
                              if (v213)
                              {
                                [v156 updateMedicalIDData];
                                id v181 = v156;
                                id v182 = objc_loadWeakRetained((id *)(a1 + 80));
                                v183 = [v182 medicalIDDataManager];
                                v184 = [v181 medicalIDData];

                                v249[0] = 0;
                                char v185 = [v183 updateMedicalIDWithLocalData:v184 error:v249];
                                id v186 = v249[0];

                                if ((v185 & 1) == 0)
                                {
                                  _HKInitializeLogging();
                                  v187 = *v180;
                                  if (os_log_type_enabled(*v180, OS_LOG_TYPE_ERROR))
                                  {
                                    LODWORD(buf[0]) = 138543362;
                                    *(void *)((char *)buf + 4) = v186;
                                    _os_log_error_impl(&dword_1BCB7D000, v187, OS_LOG_TYPE_ERROR, "Error updating medical ID: %{public}@", (uint8_t *)buf, 0xCu);
                                  }
                                }
                              }
                              id v8 = v216;
                              uint64_t v188 = [*(id *)(a1 + 96) generationPeriodInDays];
                              v189 = [*(id *)(a1 + 56) startOfDayForDate:v8];
                              [v8 timeIntervalSinceDate:v189];
                              double v191 = v190;

                              if (v191 < 0.0) {
                                double v191 = 0.0;
                              }
                              _HKInitializeLogging();
                              v192 = *v180;
                              if (os_log_type_enabled(*v180, OS_LOG_TYPE_DEFAULT))
                              {
                                LODWORD(buf[0]) = 134217984;
                                *(double *)((char *)buf + 4) = v191;
                                _os_log_impl(&dword_1BCB7D000, v192, OS_LOG_TYPE_DEFAULT, "Seconds elapsed today: %f", (uint8_t *)buf, 0xCu);
                              }
                              double v193 = v191
                                   + -[HDDemoDataGenerator _timeIntervalFromInitialGenerationPeriod:currentDate:](a1, v188, v8);

                              v194 = *(void **)(a1 + 56);
                              v195 = [v8 dateByAddingTimeInterval:-v193];
                              v196 = [v194 startOfDayForDate:v195];
                              [*(id *)(a1 + 48) setFirstSampleDate:v196];

                              v86 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1442102400.0];
                              v197 = [*(id *)(a1 + 48) firstSampleDate];
                              LODWORD(v195) = objc_msgSend(v197, "hk_isBeforeDate:", v86);

                              if (v195)
                              {
                                _HKInitializeLogging();
                                os_log_t v198 = *v180;
                                id v7 = v217;
                                if (os_log_type_enabled(*v180, OS_LOG_TYPE_DEFAULT))
                                {
                                  v199 = *(void **)(a1 + 48);
                                  v200 = v198;
                                  v201 = [v199 firstSampleDate];
                                  LODWORD(buf[0]) = 138412290;
                                  *(void *)((char *)buf + 4) = v201;
                                  _os_log_impl(&dword_1BCB7D000, v200, OS_LOG_TYPE_DEFAULT, "We have a pre-historic current date (%@), setting to something sane.", (uint8_t *)buf, 0xCu);
                                }
                                v202 = [*(id *)(a1 + 56) startOfDayForDate:v86];
                                [*(id *)(a1 + 48) setFirstSampleDate:v202];

                                uint64_t v203 = [*(id *)(a1 + 96) generationPeriodInDays];
                                v204 = [*(id *)(a1 + 48) firstSampleDate];
                                double v205 = -[HDDemoDataGenerator _timeIntervalFromInitialGenerationPeriod:currentDate:](a1, v203, v204);

                                v206 = [*(id *)(a1 + 48) firstSampleDate];
                                uint64_t v207 = [v206 dateByAddingTimeInterval:v205];

                                id v8 = (id)v207;
                              }
                              else
                              {
                                id v7 = v217;
                              }
                              _HKInitializeLogging();
                              os_log_t v208 = *v180;
                              if (os_log_type_enabled(*v180, OS_LOG_TYPE_DEFAULT))
                              {
                                v209 = *(void **)(a1 + 48);
                                v210 = v208;
                                v211 = [v209 firstSampleDate];
                                LODWORD(buf[0]) = 138412290;
                                *(void *)((char *)buf + 4) = v211;
                                _os_log_impl(&dword_1BCB7D000, v210, OS_LOG_TYPE_DEFAULT, "First sample date: %@", (uint8_t *)buf, 0xCu);
                              }
                              v212 = [*(id *)(a1 + 48) firstSampleDate];
                              v12 = v214;
                              -[HDDemoDataGenerator _queue_generateDataForDemoPerson:startDate:endDate:firstRun:completionHandler:](a1, v156, v212, v8, 1, v214);

                              goto LABEL_107;
                            }
                            goto LABEL_34;
                          }
                          _HKInitializeLogging();
                          v89 = *MEMORY[0x1E4F29F30];
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
                          {
                            LODWORD(buf[0]) = 138543362;
                            *(void *)((char *)buf + 4) = v21;
                            v94 = "Failed to unarchive data for HDDemoDataVitalsSampleGenerator: %{public}@";
                            goto LABEL_48;
                          }
                          goto LABEL_34;
                        }
                        _HKInitializeLogging();
                        v87 = *MEMORY[0x1E4F29F30];
                        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)) {
                          goto LABEL_69;
                        }
                        LODWORD(buf[0]) = 138543362;
                        *(void *)((char *)buf + 4) = v15;
                        v88 = "Failed to unarchive data for HDDemoDataSymptomsSampleGenerator: %{public}@";
                        goto LABEL_32;
                      }
                      _HKInitializeLogging();
                      v92 = *MEMORY[0x1E4F29F30];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)) {
                        goto LABEL_67;
                      }
                      LODWORD(buf[0]) = 138543362;
                      *(void *)((char *)buf + 4) = v31;
                      v93 = "Failed to unarchive data for HDDemoDataSleepSampleGenerator: %{public}@";
                      goto LABEL_66;
                    }
                    _HKInitializeLogging();
                    v90 = *MEMORY[0x1E4F29F30];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
                    {
                      LODWORD(buf[0]) = 138543362;
                      *(void *)((char *)buf + 4) = v15;
                      v91 = "Failed to unarchive data for HDDemoDataReproductiveHealthSampleGenerator: %{public}@";
                      goto LABEL_63;
                    }
LABEL_68:
                    id v17 = off_1E62EF000;
                    goto LABEL_69;
                  }
                  _HKInitializeLogging();
                  v92 = *MEMORY[0x1E4F29F30];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(buf[0]) = 138543362;
                    *(void *)((char *)buf + 4) = v31;
                    v93 = "Failed to unarchive data for HDDemoDataPathologySampleGenerator: %{public}@";
                    goto LABEL_66;
                  }
LABEL_67:
                  id v15 = v31;
                  goto LABEL_68;
                }
                _HKInitializeLogging();
                v90 = *MEMORY[0x1E4F29F30];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)) {
                  goto LABEL_68;
                }
                LODWORD(buf[0]) = 138543362;
                *(void *)((char *)buf + 4) = v15;
                v91 = "Failed to unarchive data for HDDemoDataOtherAndAdditionalSampleGenerator: %{public}@";
LABEL_63:
                _os_log_error_impl(&dword_1BCB7D000, v90, OS_LOG_TYPE_ERROR, v91, (uint8_t *)buf, 0xCu);
                goto LABEL_68;
              }
              _HKInitializeLogging();
              v92 = *MEMORY[0x1E4F29F30];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)) {
                goto LABEL_67;
              }
              LODWORD(buf[0]) = 138543362;
              *(void *)((char *)buf + 4) = v31;
              v93 = "Failed to unarchive data for HDDemoDataMobilitySampleGenerator: %{public}@";
            }
            else
            {
              _HKInitializeLogging();
              v92 = *MEMORY[0x1E4F29F30];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)) {
                goto LABEL_67;
              }
              LODWORD(buf[0]) = 138543362;
              *(void *)((char *)buf + 4) = v31;
              v93 = "Failed to unarchive data for HDDemoDataHeartSampleGenerator: %{public}@";
            }
          }
          else
          {
            _HKInitializeLogging();
            v92 = *MEMORY[0x1E4F29F30];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)) {
              goto LABEL_67;
            }
            LODWORD(buf[0]) = 138543362;
            *(void *)((char *)buf + 4) = v31;
            v93 = "Failed to unarchive data for HDDemoDataFoodSampleGenerator: %{public}@";
          }
        }
        else
        {
          _HKInitializeLogging();
          v92 = *MEMORY[0x1E4F29F30];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)) {
            goto LABEL_67;
          }
          LODWORD(buf[0]) = 138543362;
          *(void *)((char *)buf + 4) = v31;
          v93 = "Failed to unarchive data for HDDemoDataAudiogramSampleGenerator: %{public}@";
        }
      }
      else
      {
        _HKInitializeLogging();
        v92 = *MEMORY[0x1E4F29F30];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)) {
          goto LABEL_67;
        }
        LODWORD(buf[0]) = 138543362;
        *(void *)((char *)buf + 4) = v31;
        v93 = "Failed to unarchive data for HDDemoDataAlcoholSampleGenerator: %{public}@";
      }
LABEL_66:
      _os_log_error_impl(&dword_1BCB7D000, v92, OS_LOG_TYPE_ERROR, v93, (uint8_t *)buf, 0xCu);
      goto LABEL_67;
    }
    _HKInitializeLogging();
    v90 = *MEMORY[0x1E4F29F30];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)) {
      goto LABEL_68;
    }
    LODWORD(buf[0]) = 138543362;
    *(void *)((char *)buf + 4) = v15;
    v91 = "Failed to unarchive data for HDDemoDataActivitySampleGenerator: %{public}@";
    goto LABEL_63;
  }
LABEL_109:
}

uint64_t __83__HDDemoDataGenerator__queue_runDemoDataGeneratorForDemoPerson_endDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 48) isFirstRun])
  {
    uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [v2 setValue:v3 forKey:@"HealthDemoDataFirstRunDateKey"];
  }
  uint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [*(id *)(*(void *)(a1 + 32) + 48) firstSampleDate];
  [v4 setValue:v5 forKey:@"HealthDemoDataFirstSampleDateKey"];

  uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v7 = [*(id *)(*(void *)(a1 + 32) + 48) lastSampleDate];
  [v6 setValue:v7 forKey:@"HealthDemoDataLastSampleDateKey"];

  id v8 = [MEMORY[0x1E4F1C9C8] date];
  [*(id *)(*(void *)(a1 + 32) + 48) setLastRunDate:v8];

  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v10 = [*(id *)(*(void *)(a1 + 32) + 48) lastRunDate];
  [v9 setValue:v10 forKey:@"HealthDemoDataLastRunDateKey"];

  _HKInitializeLogging();
  v11 = (os_log_t *)MEMORY[0x1E4F29F30];
  v12 = (void *)*MEMORY[0x1E4F29F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
  {
    id v13 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v14 = v12;
    id v15 = [v13 lastRunDate];
    *(_DWORD *)buf = 138412290;
    uint64_t v49 = v15;
    _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "Last run date: %@", buf, 0xCu);
  }
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(void **)(v16 + 48);
  id v43 = 0;
  char v18 = -[HDDemoDataGenerator _archiveObject:error:](v16, v17, (uint64_t)&v43);
  id v19 = v43;
  if (v18)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v20 = *(id *)(v16 + 16);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:buf count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v40;
      while (2)
      {
        uint64_t v24 = 0;
        v25 = v19;
        do
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v20);
          }
          v26 = *(void **)(*((void *)&v39 + 1) + 8 * v24);
          id v38 = v25;
          char v27 = -[HDDemoDataGenerator _archiveObject:error:](v16, v26, (uint64_t)&v38);
          id v19 = v38;

          if ((v27 & 1) == 0)
          {
            _HKInitializeLogging();
            v33 = (void *)*MEMORY[0x1E4F29F30];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
            {
              v35 = v33;
              v36 = (objc_class *)objc_opt_class();
              uint64_t v37 = NSStringFromClass(v36);
              *(_DWORD *)v44 = 138543618;
              v45 = v37;
              __int16 v46 = 2114;
              id v47 = v19;
              _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "Failed to archive %{public}@ data: %{public}@", v44, 0x16u);
            }
            goto LABEL_21;
          }
          ++v24;
          v25 = v19;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:buf count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    _HKInitializeLogging();
    v28 = *MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_DEFAULT, "Successfully saved state from demo data generation", v44, 2u);
    }
  }
  else
  {
    _HKInitializeLogging();
    os_log_t v29 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = v29;
      id v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      *(_DWORD *)buf = 138543618;
      uint64_t v49 = v32;
      __int16 v50 = 2114;
      id v51 = v19;
      _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "Failed to archive %{public}@ data: %{public}@", buf, 0x16u);
    }
  }
LABEL_21:

  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (double)_timeIntervalFromInitialGenerationPeriod:(void *)a3 currentDate:
{
  id v5 = a3;
  if (a2 == -1) {
    double v6 = (double)(unint64_t)([*(id *)(a1 + 56) ordinalityOfUnit:16 inUnit:4 forDate:v5] - 1);
  }
  else {
    double v6 = (double)(int)a2;
  }
  double v7 = v6 * 86400.0;

  return v7;
}

- (void)_queue_generateDataForDemoPerson:(void *)a3 startDate:(void *)a4 endDate:(uint64_t)a5 firstRun:(void *)a6 completionHandler:
{
  uint64_t v257 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v220 = a6;
  *(void *)(a1 + 64) = 0;
  uint64_t v14 = DisplayNameForHDDemoDataProfileType([*(id *)(a1 + 96) profileType]);
  v223 = v11;
  id v15 = NSStringFromHKBiologicalSex([v11 biologicalSex]);
  v221 = v13;
  uint64_t v222 = v12;
  [v13 timeIntervalSinceDate:v12];
  double v17 = v16;
  [*(id *)(a1 + 48) setFirstRun:a5];
  [*(id *)(a1 + 48) setFinished:0];
  [*(id *)(a1 + 48) startTime];
  objc_msgSend(*(id *)(a1 + 48), "setCurrentTime:");
  [*(id *)(a1 + 48) startTime];
  [*(id *)(a1 + 48) setEndTime:v18 + v17 * 0.0000115740741];
  _HKInitializeLogging();
  id v19 = (os_log_t *)MEMORY[0x1E4F29F30];
  id v20 = (void *)*MEMORY[0x1E4F29F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = v20;
    uint64_t v22 = [v14 lowercaseString];
    uint64_t v23 = [v15 lowercaseString];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v22;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2048;
    *(double *)&long long v243 = v17 * 0.0000115740741;
    _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "Generating %@ %@ (gender) demo data for %.2f days", buf, 0x20u);

    id v19 = (os_log_t *)MEMORY[0x1E4F29F30];
  }
  _HKInitializeLogging();
  uint64_t v24 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)&uint8_t buf[4] = v17;
    _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "Generation time: %f", buf, 0xCu);
  }
  _HKInitializeLogging();
  os_log_t v25 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
  {
    v26 = *(void **)(a1 + 48);
    char v27 = v25;
    [v26 startTime];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v28;
    _os_log_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEFAULT, "When started Start time: %f", buf, 0xCu);
  }
  _HKInitializeLogging();
  os_log_t v29 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = *(void **)(a1 + 48);
    id v31 = v29;
    [v30 startTime];
    v32 = objc_msgSend((id)a1, "currentDateFromCurrentTime:");
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v32;
    _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEFAULT, "When started Start date: %@", buf, 0xCu);
  }
  _HKInitializeLogging();
  os_log_t v33 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = *(void **)(a1 + 48);
    v35 = v33;
    [v34 currentTime];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v36;
    _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEFAULT, "When started Current time: %f", buf, 0xCu);
  }
  _HKInitializeLogging();
  os_log_t v37 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
  {
    id v38 = *(void **)(a1 + 48);
    long long v39 = v37;
    [v38 currentTime];
    long long v40 = objc_msgSend((id)a1, "currentDateFromCurrentTime:");
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v40;
    _os_log_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_DEFAULT, "When started Current date: %@", buf, 0xCu);
  }
  _HKInitializeLogging();
  os_log_t v41 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
  {
    long long v42 = *(void **)(a1 + 48);
    id v43 = v41;
    [v42 endTime];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v44;
    _os_log_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_DEFAULT, "When started End time: %f", buf, 0xCu);
  }
  v218 = v15;
  uint64_t v219 = v14;
  _HKInitializeLogging();
  os_log_t v45 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v46 = *(void **)(a1 + 48);
    id v47 = v45;
    [v46 endTime];
    v48 = objc_msgSend((id)a1, "currentDateFromCurrentTime:");
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v48;
    _os_log_impl(&dword_1BCB7D000, v47, OS_LOG_TYPE_DEFAULT, "When started End date: %@", buf, 0xCu);
  }
  uint64_t v49 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v50 = *(void *)(a1 + 104);
  uint64_t v51 = *(void *)(a1 + 112);
  uint64_t v52 = *(void *)(a1 + 224);
  *(void *)buf = *(void *)(a1 + 216);
  *(void *)&_OWORD buf[8] = v50;
  long long v243 = *(_OWORD *)(a1 + 120);
  uint64_t v53 = *(void *)(a1 + 136);
  *(void *)&buf[16] = v51;
  uint64_t v244 = v53;
  long long v54 = *(_OWORD *)(a1 + 160);
  long long v245 = *(_OWORD *)(a1 + 144);
  long long v246 = v54;
  uint64_t v55 = *(void *)(a1 + 184);
  uint64_t v247 = *(void *)(a1 + 176);
  uint64_t v248 = v55;
  uint64_t v56 = *(void *)(a1 + 192);
  long long v250 = *(_OWORD *)(a1 + 200);
  uint64_t v249 = v56;
  uint64_t v57 = *(void *)(a1 + 232);
  uint64_t v251 = v52;
  uint64_t v252 = v57;
  uint64_t v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:17];
  [v49 addObjectsFromArray:v58];

  [v49 addObjectsFromArray:*(void *)(a1 + 24)];
  v59 = (id *)(a1 + 16);
  objc_storeStrong((id *)(a1 + 16), v49);
  long long v240 = 0u;
  long long v241 = 0u;
  long long v238 = 0u;
  long long v239 = 0u;
  id v60 = *(id *)(a1 + 16);
  uint64_t v61 = [v60 countByEnumeratingWithState:&v238 objects:&v253 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v239;
    do
    {
      for (uint64_t i = 0; i != v62; ++i)
      {
        if (*(void *)v239 != v63) {
          objc_enumerationMutation(v60);
        }
        v65 = *(void **)(*((void *)&v238 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v65 setupWithDemoDataGenerator:a1];
        }
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v238 objects:&v253 count:16];
    }
    while (v62);
  }

  id v66 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(v66, "setObject:forKey:", &unk_1F17EECB8);

  double Current = CFAbsoluteTimeGetCurrent();
  char v67 = [*(id *)(a1 + 48) isFinished];
  uint64_t v68 = (os_log_t *)MEMORY[0x1E4F29F30];
  if (v67) {
    goto LABEL_27;
  }
  location = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v103 = [WeakRetained dataManager];
  [v103 openObserverTransaction];

  id v228 = (id *)(a1 + 16);
  if (a5)
  {
    id v104 = *(id *)(a1 + 88);
    v105 = (void *)MEMORY[0x1C187C0E0]();
    v106 = objc_alloc_init(HDDemoDataBaseSampleGeneratorObjectCollection);
    long long v253 = 0u;
    long long v254 = 0u;
    long long v255 = 0u;
    long long v256 = 0u;
    id v107 = *(id *)(a1 + 16);
    uint64_t v108 = [v107 countByEnumeratingWithState:&v253 objects:buf count:16];
    if (v108)
    {
      uint64_t v109 = v108;
      uint64_t v110 = *(void *)v254;
      do
      {
        for (uint64_t j = 0; j != v109; ++j)
        {
          if (*(void *)v254 != v110) {
            objc_enumerationMutation(v107);
          }
          v112 = *(void **)(*((void *)&v253 + 1) + 8 * j);
          v113 = [*(id *)(a1 + 48) firstSampleDate];
          [v112 generateFirstRunObjectsForDemoPerson:v104 firstDate:v113 objectCollection:v106];
        }
        uint64_t v109 = [v107 countByEnumeratingWithState:&v253 objects:buf count:16];
      }
      while (v109);
    }

    -[HDDemoDataGenerator _insertIntoDatabaseObjectCollection:fromPerson:](a1, v106, v104);

    v59 = (id *)(a1 + 16);
  }
  uint64_t v226 = *MEMORY[0x1E4F1C318];
  id v231 = (void *)a1;
  while (2)
  {
    id v229 = *(id *)(a1 + 88);
    context = (void *)MEMORY[0x1C187C0E0]();
    v114 = objc_alloc_init(HDDemoDataBaseSampleGeneratorObjectCollection);
    unint64_t v115 = 0;
    id v116 = 0;
    while (1)
    {
      v117 = (void *)MEMORY[0x1C187C0E0]();
      v118 = [(id)a1 generatorState];
      int v119 = [v118 isExercising];

      if (v119) {
        [v229 timeIncrementDuringExercise];
      }
      else {
        [v229 timeIncrement];
      }
      double v121 = v120;
      [*(id *)(a1 + 48) currentTime];
      double v123 = v121 + v122;
      [*(id *)(a1 + 48) endTime];
      v124 = *(void **)(a1 + 48);
      if (v123 > v125) {
        break;
      }
      [v124 currentTime];
      double v127 = v126;
      v128 = *(void **)(a1 + 48);
      [v128 currentTime];
      [v128 setCurrentTime:v121 + v129];
      v130 = [*(id *)(a1 + 48) firstSampleDate];
      [*(id *)(a1 + 48) currentTime];
      id v132 = [v130 dateByAddingTimeInterval:v131 * 86400.0];

      id v116 = v132;
      v133 = [(id)a1 generatorState];
      v134 = [v133 workoutConfiguration];

      unint64_t v230 = v115;
      if (v134)
      {
        id v135 = [(id)a1 generatorState];
        [v135 currentTime];
        double v137 = v136;
        [v134 endTime];
        double v139 = v138;

        if (v137 <= v139) {
          goto LABEL_94;
        }
        id v140 = [(id)a1 generatorState];
        [v140 setWorkoutConfiguration:0];
      }
      else
      {
        v141 = NSNumber;
        v142 = [(id)a1 generatorState];
        uint64_t v143 = objc_msgSend(v141, "numberWithInteger:", objc_msgSend(v142, "calendarDay"));

        v144 = [(id)a1 demoPerson];
        v145 = [v144 workoutPrototypesByCalendarDay];
        id v232 = (void *)v143;
        v146 = [v145 objectForKeyedSubscript:v143];

        uint64_t v147 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        uint64_t v148 = +[HDDemoDataGeneratorConfiguration configurationFromDefaults:v147];

        id v227 = v117;
        if ([v148 shouldEnsureRecentWorkoutHasRoute])
        {
          uint64_t v149 = [(id)a1 generatorState];
          v150 = [v149 currentDate];

          id v151 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v226];
          if ([v151 isDateInYesterday:v150])
          {
            id v152 = +[HDDemoDataWorkoutPrototype yogaAndRunningPrototypes];
          }
          else if ([v151 isDateInToday:v150])
          {
            id v152 = (void *)MEMORY[0x1E4F1CBF0];
          }
          else
          {
            id v152 = 0;
          }
        }
        else
        {
          id v152 = 0;
        }

        if (v152) {
          v153 = v152;
        }
        else {
          v153 = v146;
        }
        id v154 = v153;

        v155 = [(id)a1 generatorState];
        [v155 currentTime];
        double v157 = v156;

        v158 = [(id)a1 generatorState];
        uint64_t v159 = [v158 currentDay];

        long long v240 = 0u;
        long long v241 = 0u;
        long long v238 = 0u;
        long long v239 = 0u;
        obuint64_t j = v154;
        uint64_t v160 = [obj countByEnumeratingWithState:&v238 objects:buf count:16];
        if (v160)
        {
          uint64_t v161 = v160;
          uint64_t v162 = *(void *)v239;
          double v163 = (double)v159;
          do
          {
            for (uint64_t k = 0; k != v161; ++k)
            {
              if (*(void *)v239 != v162) {
                objc_enumerationMutation(obj);
              }
              id v165 = *(void **)(*((void *)&v238 + 1) + 8 * k);
              [v165 startTimeOffsetInDay];
              double v167 = v166;
              [v165 duration];
              double v169 = v168;
              v170 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F17EA608];
              v171 = [MEMORY[0x1E4F1C9A8] currentCalendar];
              v172 = [MEMORY[0x1E4F1C9C8] date];
              id v173 = [v171 dateByAddingUnit:16 value:-90 toDate:v172 options:0];

              v174 = [MEMORY[0x1E4F2B860] sharedBehavior];
              if (([v174 isAppleWatch] & 1) != 0
                || ([v170 containsObject:v232] & 1) != 0)
              {
                int v175 = 1;
              }
              else
              {
                int v175 = objc_msgSend(v116, "hk_isAfterDate:", v173);
              }
              double v176 = v167 + v163;
              double v177 = v176 + v169 * 0.0000115740741;

              if (v157 > v176 && v157 < v177 && v175 != 0)
              {
                v180 = [[HDDemoDataGeneratorWorkoutConfiguration alloc] initWithPrototype:v165 currentDemoDataTime:v157];
                id v181 = [v231 generatorState];
                [v181 setWorkoutConfiguration:v180];
              }
            }
            uint64_t v161 = [obj countByEnumeratingWithState:&v238 objects:buf count:16];
          }
          while (v161);
        }

        unint64_t v115 = v230;
        a1 = (uint64_t)v231;
        v117 = v227;
        v59 = v228;
        v134 = 0;
        id v140 = v232;
      }

LABEL_94:
      [*(id *)(a1 + 48) currentTime];
      uint64_t v183 = (uint64_t)v182;
      if ([*(id *)(a1 + 48) currentDay] != (uint64_t)v182)
      {
        [*(id *)(a1 + 48) setCurrentDay:v183];
        [*(id *)(a1 + 216) randomDoubleFromGenerator];
        [v229 setRestingHeartRate:(uint64_t)(v184 * 10.0) + 50];
        [*(id *)(a1 + 216) randomDoubleFromGenerator];
        [v229 setExerciseIntensityPercentage:fabs(v185 * 0.2) + 0.6];
      }
      long long v236 = 0u;
      long long v237 = 0u;
      long long v234 = 0u;
      long long v235 = 0u;
      id v186 = *v59;
      uint64_t v187 = [v186 countByEnumeratingWithState:&v234 objects:&v253 count:16];
      if (v187)
      {
        uint64_t v188 = v187;
        v189 = v117;
        uint64_t v190 = *(void *)v235;
        do
        {
          for (uint64_t m = 0; m != v188; ++m)
          {
            if (*(void *)v235 != v190) {
              objc_enumerationMutation(v186);
            }
            v192 = *(void **)(*((void *)&v234 + 1) + 8 * m);
            uint64_t v193 = *(void *)(a1 + 88);
            [*(id *)(a1 + 48) currentTime];
            [v192 generateObjectsForDemoPerson:v193 fromTime:v116 toTime:v114 currentDate:v127 objectCollection:v194];
          }
          uint64_t v188 = [v186 countByEnumeratingWithState:&v234 objects:&v253 count:16];
        }
        while (v188);

        unint64_t v115 = v230;
        v59 = v228;
        if (v230 >= 0x63) {
          goto LABEL_108;
        }
      }
      else
      {

        if (v115 > 0x62) {
          goto LABEL_108;
        }
      }
      ++v115;
    }
    [v124 setFinished:1];
    v195 = [*(id *)(a1 + 48) firstSampleDate];
    [*(id *)(a1 + 48) currentTime];
    v197 = [v195 dateByAddingTimeInterval:v196 * 86400.0];
    [*(id *)(a1 + 48) setLastSampleDate:v197];

LABEL_108:
    _HKInitializeLogging();
    uint64_t v68 = (os_log_t *)MEMORY[0x1E4F29F30];
    os_log_t v198 = *MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v116;
      _os_log_impl(&dword_1BCB7D000, v198, OS_LOG_TYPE_DEFAULT, "Last sample date for iteration: %@", buf, 0xCu);
    }
    -[HDDemoDataGenerator _insertIntoDatabaseObjectCollection:fromPerson:](a1, v114, v229);

    id v199 = objc_loadWeakRetained(location);
    v200 = [v199 dataManager];
    [v200 closeObserverTransaction];

    [*(id *)(a1 + 48) currentTime];
    double v202 = v201;
    [*(id *)(a1 + 48) startTime];
    double v204 = v202 - v203;
    [*(id *)(a1 + 48) endTime];
    double v206 = v205;
    [*(id *)(a1 + 48) startTime];
    double v208 = v204 / (v206 - v207) * 100.0;
    v209 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v210 = [NSNumber numberWithDouble:v208];
    [v209 setObject:v210 forKey:@"HealthDemoDataProgressKey"];

    _HKInitializeLogging();
    v211 = *v68;
    if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = v208;
      _os_log_impl(&dword_1BCB7D000, v211, OS_LOG_TYPE_DEFAULT, "Current demo data generation progress: %.1f%%", buf, 0xCu);
    }
    if (![*(id *)(a1 + 48) isFinished])
    {
      id v212 = objc_loadWeakRetained(location);
      int v213 = [v212 dataManager];
      [v213 openObserverTransaction];

      continue;
    }
    break;
  }
LABEL_27:
  double v69 = CFAbsoluteTimeGetCurrent();
  _HKInitializeLogging();
  os_log_t v70 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v71 = *(void **)(a1 + 48);
    v72 = v70;
    v73 = [v71 lastSampleDate];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v73;
    _os_log_impl(&dword_1BCB7D000, v72, OS_LOG_TYPE_DEFAULT, "When ended Last sample date: %@", buf, 0xCu);
  }
  _HKInitializeLogging();
  os_log_t v74 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    v75 = *(void **)(a1 + 48);
    v76 = v74;
    [v75 startTime];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v77;
    _os_log_impl(&dword_1BCB7D000, v76, OS_LOG_TYPE_DEFAULT, "When ended Start time: %f", buf, 0xCu);
  }
  _HKInitializeLogging();
  os_log_t v78 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    double v79 = *(void **)(a1 + 48);
    double v80 = v78;
    [v79 startTime];
    v81 = objc_msgSend((id)a1, "currentDateFromCurrentTime:");
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v81;
    _os_log_impl(&dword_1BCB7D000, v80, OS_LOG_TYPE_DEFAULT, "When ended Start date: %@", buf, 0xCu);
  }
  _HKInitializeLogging();
  os_log_t v82 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    v83 = *(void **)(a1 + 48);
    v84 = v82;
    [v83 currentTime];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v85;
    _os_log_impl(&dword_1BCB7D000, v84, OS_LOG_TYPE_DEFAULT, "When ended Current time: %f", buf, 0xCu);
  }
  _HKInitializeLogging();
  os_log_t v86 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    v87 = *(void **)(a1 + 48);
    v88 = v86;
    [v87 currentTime];
    v89 = objc_msgSend((id)a1, "currentDateFromCurrentTime:");
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v89;
    _os_log_impl(&dword_1BCB7D000, v88, OS_LOG_TYPE_DEFAULT, "When ended Current date: %@", buf, 0xCu);
  }
  _HKInitializeLogging();
  os_log_t v90 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    v91 = *(void **)(a1 + 48);
    v92 = v90;
    [v91 endTime];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v93;
    _os_log_impl(&dword_1BCB7D000, v92, OS_LOG_TYPE_DEFAULT, "When ended End time: %f", buf, 0xCu);
  }
  double v94 = v69 - Current;
  _HKInitializeLogging();
  os_log_t v95 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    v96 = *(void **)(a1 + 48);
    v97 = v95;
    [v96 endTime];
    v98 = objc_msgSend((id)a1, "currentDateFromCurrentTime:");
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v98;
    _os_log_impl(&dword_1BCB7D000, v97, OS_LOG_TYPE_DEFAULT, "When ended End date: %@", buf, 0xCu);
  }
  _HKInitializeLogging();
  v99 = *v68;
  BOOL v100 = os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT);
  if (v94 <= 1.0)
  {
    if (v100)
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = (uint64_t)(v94 * 1000.0);
      v101 = "Total runtime to generate: %ld ms";
LABEL_116:
      _os_log_impl(&dword_1BCB7D000, v99, OS_LOG_TYPE_DEFAULT, v101, buf, 0xCu);
    }
  }
  else if (v100)
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = (uint64_t)v94;
    v101 = "Total runtime to generate: %ld s";
    goto LABEL_116;
  }
  _HKInitializeLogging();
  v214 = *v68;
  if (os_log_type_enabled(*v68, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v215 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v215;
    _os_log_impl(&dword_1BCB7D000, v214, OS_LOG_TYPE_DEFAULT, "Total samples written: %ld", buf, 0xCu);
  }
  v216 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v216 setObject:&unk_1F17EF3F0 forKey:@"HealthDemoDataProgressKey"];

  [*(id *)(a1 + 48) currentTime];
  objc_msgSend(*(id *)(a1 + 48), "setStartTime:");
  if (v220) {
    v220[2](v220, *(void *)(a1 + 64), v94);
  }
}

- (id)_phoneProveance
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = [WeakRetained sourceManager];
  id v35 = 0;
  uint64_t v4 = [v3 localDeviceSourceWithError:&v35];
  id v5 = v35;

  if (v4)
  {
    id v6 = objc_loadWeakRetained(v1);
    double v7 = [v6 deviceManager];
    id v34 = v5;
    id v8 = [v7 deviceEntityForNoDeviceWithError:&v34];
    id v9 = v34;

    if (v8)
    {
      id v10 = objc_loadWeakRetained(v1);
      id v11 = [v10 daemon];
      id v12 = [v11 behavior];

      id v31 = objc_loadWeakRetained(v1);
      uint64_t v29 = [v31 currentSyncIdentityPersistentID];
      uint64_t v13 = [v12 currentDeviceProductType];
      uint64_t v14 = @"UnknownDevice";
      uint64_t v30 = (void *)v13;
      if (v13) {
        uint64_t v14 = (__CFString *)v13;
      }
      uint64_t v28 = v14;
      uint64_t v15 = [v12 currentOSBuild];
      double v16 = (void *)v15;
      double v17 = @"UnknownBuild";
      if (v15) {
        double v17 = (__CFString *)v15;
      }
      char v27 = v17;
      id v32 = v9;
      if (v12) {
        [v12 currentOSVersionStruct];
      }
      else {
        memset(v33, 0, sizeof(v33));
      }
      uint64_t v21 = [v12 currentOSVersion];
      uint64_t v22 = [v12 localTimeZone];
      uint64_t v23 = [v22 name];
      uint64_t v24 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "persistentID"));
      os_log_t v25 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
      id v19 = +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:0 syncIdentity:v29 productType:v28 systemBuild:v27 operatingSystemVersion:v33 sourceVersion:v21 timeZoneName:v23 sourceID:v24 deviceID:v25 contributorReference:0];

      id v9 = v32;
    }
    else
    {
      _HKInitializeLogging();
      id v20 = *MEMORY[0x1E4F29F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v37 = v9;
        _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Error creating local phone device entity %{public}@", buf, 0xCu);
      }
      id v19 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    double v18 = *MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v37 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "Error creating local phone source entity %{public}@", buf, 0xCu);
    }
    id v19 = 0;
    id v9 = v5;
  }

  return v19;
}

- (void)_insertIntoDatabaseObjectCollection:(void *)a3 fromPerson:
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = [v5 objectsFromPhone];
  uint64_t v58 = [v5 objectsFromWatch];
  v59 = [v5 objectsFromPhoneApps];
  id v8 = -[HDDemoDataGenerator _phoneProveance](a1);
  id v9 = NSString;
  id v10 = [v6 firstName];
  uint64_t v11 = [v9 stringWithFormat:@"%@'s Watch", v10];

  uint64_t v57 = a1;
  id v12 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v14 = [WeakRetained sourceManager];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA"];
  id v66 = 0;
  uint64_t v56 = (void *)v11;
  double v16 = [v14 sourceForAppleDeviceWithUUID:v15 identifier:@"com.apple.health.demo_watch" name:v11 productType:@"Watch1,2" createIfNecessary:1 error:&v66];
  id v17 = v66;

  if (v16)
  {
    id v18 = objc_loadWeakRetained(v12);
    id v19 = [v18 deviceManager];
    id v65 = v17;
    id v20 = [v19 deviceEntityForNoDeviceWithError:&v65];
    id v55 = v65;

    if (v20)
    {
      uint64_t v52 = v8;
      id v21 = objc_loadWeakRetained(v12);
      uint64_t v22 = [v21 daemon];
      uint64_t v23 = [v22 behavior];

      id v49 = objc_loadWeakRetained(v12);
      uint64_t v48 = [v49 currentSyncIdentityPersistentID];
      uint64_t v24 = [v23 currentOSBuild];
      os_log_t v25 = (void *)v24;
      v26 = @"UnknownBuild";
      if (v24) {
        v26 = (__CFString *)v24;
      }
      id v47 = v26;
      uint64_t v53 = v7;
      id v54 = v5;
      id v50 = v6;
      uint64_t v51 = v12;
      if (v23)
      {
        [v23 currentOSVersionStruct];
      }
      else
      {
        long long buf = 0uLL;
        uint64_t v68 = 0;
      }
      id v32 = [v23 currentOSVersion];
      os_log_t v33 = [v23 localTimeZone];
      id v34 = [v33 name];
      id v35 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
      uint64_t v36 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v20, "persistentID"));
      uint64_t v28 = +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:0 syncIdentity:v48 productType:@"Watch1,2" systemBuild:v47 operatingSystemVersion:&buf sourceVersion:v32 timeZoneName:v34 sourceID:v35 deviceID:v36 contributorReference:0];

      double v7 = v53;
      id v5 = v54;
      id v12 = v51;
      id v8 = v52;
      id v6 = v50;
    }
    else
    {
      _HKInitializeLogging();
      id v31 = *MEMORY[0x1E4F29F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        id v17 = v55;
        *(void *)((char *)&buf + 4) = v55;
        _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "Error creating watch device entity %{public}@", (uint8_t *)&buf, 0xCu);
        uint64_t v28 = 0;
        uint64_t v29 = v56;
        goto LABEL_15;
      }
      uint64_t v28 = 0;
    }
    id v17 = v55;
    uint64_t v29 = v56;
LABEL_15:

    uint64_t v30 = v57;
    goto LABEL_16;
  }
  _HKInitializeLogging();
  char v27 = *MEMORY[0x1E4F29F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "Error creating watch source entity %{public}@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v28 = 0;
  uint64_t v29 = v56;
  uint64_t v30 = v57;
LABEL_16:

  if (v28 && v8)
  {
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __70__HDDemoDataGenerator__insertIntoDatabaseObjectCollection_fromPerson___block_invoke;
    v64[3] = &unk_1E6306D80;
    v64[4] = v30;
    [v59 enumerateKeysAndObjectsWithOptions:0 usingBlock:v64];
    *(void *)(v30 + 64) += [v7 count];
    id v37 = objc_loadWeakRetained(v12);
    uint64_t v38 = [v37 dataManager];
    id v63 = 0;
    long long v39 = v8;
    char v40 = [v38 insertDataObjects:v7 withProvenance:v8 creationDate:1 skipInsertionFilter:&v63 error:CFAbsoluteTimeGetCurrent()];
    uint64_t v41 = v30;
    id v42 = v63;

    if (v40)
    {
      *(void *)(v41 + 64) += [v58 count];
      id v43 = objc_loadWeakRetained(v12);
      uint64_t v44 = [v43 dataManager];
      id v62 = v42;
      [v44 insertDataObjects:v58 withProvenance:v28 creationDate:1 skipInsertionFilter:&v62 error:CFAbsoluteTimeGetCurrent()];
      id v45 = v62;

      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __70__HDDemoDataGenerator__insertIntoDatabaseObjectCollection_fromPerson___block_invoke_374;
      v61[3] = &unk_1E6306DA8;
      v61[4] = v41;
      [v5 enumerateObjectAssociations:v61];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __70__HDDemoDataGenerator__insertIntoDatabaseObjectCollection_fromPerson___block_invoke_377;
      v60[3] = &unk_1E6306DA8;
      v60[4] = v41;
      [v5 enumerateLooseObjectAssociations:v60];
      id v42 = v45;
    }
    else
    {
      _HKInitializeLogging();
      __int16 v46 = *MEMORY[0x1E4F29F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v42;
        _os_log_error_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_ERROR, "Error inserting phone samples: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v8 = v39;
  }
}

void __70__HDDemoDataGenerator__insertIntoDatabaseObjectCollection_fromPerson___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v59[2] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  if (v5)
  {
    id v8 = [*(id *)(v5 + 40) objectForKeyedSubscript:v7];
    if (!v8)
    {
      id v52 = v6;
      id v9 = v7;
      uint64_t v10 = *MEMORY[0x1E4F29728];
      v58[0] = *MEMORY[0x1E4F29E48];
      v58[1] = v10;
      v59[0] = (id)MEMORY[0x1E4F1CC38];
      v59[1] = (id)MEMORY[0x1E4F1CC38];
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
      id WeakRetained = objc_loadWeakRetained((id *)(v5 + 80));
      uint64_t v13 = [WeakRetained sourceManager];
      uint64_t v14 = [MEMORY[0x1E4F2B8D8] entitlementsWithDictionary:v11];
      id v56 = 0;
      id v54 = v9;
      uint64_t v15 = [v13 sourceForApplicationIdentifier:v9 createOrUpdateIfNecessary:1 entitlements:v14 name:0 error:&v56];
      id v16 = v56;

      id v17 = v15;
      if (v15)
      {
        id v18 = v15;
      }
      else
      {
        _HKInitializeLogging();
        id v19 = *MEMORY[0x1E4F29F30];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          *(void *)&uint8_t buf[4] = v54;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v16;
          _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "Error creating local phone app source entity with bundle id %{public}@ %{public}@", buf, 0x16u);
        }
      }

      id v20 = objc_loadWeakRetained((id *)(v5 + 80));
      id v21 = [v20 deviceManager];
      v59[0] = 0;
      uint64_t v22 = [v21 deviceEntityForNoDeviceWithError:v59];
      id v23 = v59[0];

      if (v22)
      {
        id v24 = objc_loadWeakRetained((id *)(v5 + 80));
        os_log_t v25 = [v24 daemon];
        v26 = [v25 behavior];

        id v27 = objc_loadWeakRetained((id *)(v5 + 80));
        uint64_t v45 = [v27 currentSyncIdentityPersistentID];
        uint64_t v28 = [v26 currentDeviceProductType];
        uint64_t v29 = @"UnknownDevice";
        id v47 = (void *)v28;
        if (v28) {
          uint64_t v29 = (__CFString *)v28;
        }
        uint64_t v44 = v29;
        uint64_t v30 = [v26 currentOSBuild];
        id v31 = @"UnknownBuild";
        __int16 v46 = (void *)v30;
        if (v30) {
          id v31 = (__CFString *)v30;
        }
        id v43 = v31;
        id v49 = v23;
        id v50 = v7;
        uint64_t v51 = v22;
        uint64_t v48 = v27;
        id v32 = v17;
        if (v26) {
          [v26 currentOSVersionStruct];
        }
        else {
          memset(buf, 0, 24);
        }
        id v6 = v52;
        id v34 = [v26 currentOSVersion];
        uint64_t v53 = [v26 localTimeZone];
        id v35 = [v53 name];
        uint64_t v36 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v32, "persistentID"));
        id v37 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v22, "persistentID"));
        id v8 = +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:0 syncIdentity:v45 productType:v44 systemBuild:v43 operatingSystemVersion:buf sourceVersion:v34 timeZoneName:v35 sourceID:v36 deviceID:v37 contributorReference:0];

        id v17 = v32;
        [*(id *)(v5 + 40) setObject:v8 forKeyedSubscript:v54];

        id v23 = v49;
        id v7 = v50;
      }
      else
      {
        _HKInitializeLogging();
        os_log_t v33 = *MEMORY[0x1E4F29F30];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          *(void *)&uint8_t buf[4] = v23;
          _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "Error creating local phone device entity for app provenance %{public}@", buf, 0xCu);
        }
        id v8 = 0;
        id v6 = v52;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  *(void *)(*(void *)(a1 + 32) + 64) += [v6 count];
  id v38 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  long long v39 = [v38 dataManager];
  id v55 = 0;
  char v40 = [v39 insertDataObjects:v6 withProvenance:v8 creationDate:1 skipInsertionFilter:&v55 error:CFAbsoluteTimeGetCurrent()];

  id v41 = v55;
  if ((v40 & 1) == 0)
  {
    _HKInitializeLogging();
    id v42 = *MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v41;
      _os_log_error_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_ERROR, "Error inserting phone app samples: %{public}@", buf, 0xCu);
    }
  }
}

void __70__HDDemoDataGenerator__insertIntoDatabaseObjectCollection_fromPerson___block_invoke_374(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)(*(void *)(a1 + 32) + 80);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v11 = 0;
  BOOL v8 = +[HDAssociationEntity insertEntriesWithAssociationUUID:v6 objectUUIDsData:v5 type:0 destinationSubObjectReference:0 profile:WeakRetained error:&v11];

  id v9 = v11;
  if (!v8)
  {
    _HKInitializeLogging();
    uint64_t v10 = *MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v13 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "Error associating objects with object: %{public}@", buf, 0xCu);
    }
  }
}

void __70__HDDemoDataGenerator__insertIntoDatabaseObjectCollection_fromPerson___block_invoke_377(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)(*(void *)(a1 + 32) + 80);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v11 = 0;
  BOOL v8 = +[HDAssociationEntity insertEntriesWithAssociationUUID:v6 objectUUIDsData:v5 type:1 destinationSubObjectReference:0 profile:WeakRetained error:&v11];

  id v9 = v11;
  if (!v8)
  {
    _HKInitializeLogging();
    uint64_t v10 = *MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v13 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "Error loose associating objects with object: %{public}@", buf, 0xCu);
    }
  }
}

- (HDKeyValueDomain)_keyValueDomain
{
  uint64_t v2 = [HDKeyValueDomain alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v4 = [(HDKeyValueDomain *)v2 initWithCategory:3 domainName:@"DemoData" profile:WeakRetained];

  return v4;
}

- (uint64_t)_archiveObject:(uint64_t)a3 error:
{
  id v5 = a2;
  id v6 = -[HDDemoDataGenerator _keyValueDomain](a1);
  id v7 = (objc_class *)objc_opt_class();
  BOOL v8 = NSStringFromClass(v7);
  id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:a3];

  if (v9) {
    uint64_t v10 = [v6 setData:v9 forKey:v8 error:a3];
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_unarchiveDataWithClass:(uint64_t)a3 error:
{
  id v5 = -[HDDemoDataGenerator _keyValueDomain](a1);
  id v6 = NSStringFromClass(a2);
  id v7 = [v5 dataForKey:v6 error:a3];
  if (v7)
  {
    BOOL v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a2 fromData:v7 error:a3];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (uint64_t)_queue_unarchivePluginGenerators
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      uint64_t v7 = 0;
      BOOL v8 = v5;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(objc_class **)(*((void *)&v18 + 1) + 8 * v7);
        id v17 = v8;
        uint64_t v10 = -[HDDemoDataGenerator _unarchiveDataWithClass:error:](a1, v9, (uint64_t)&v17);
        id v5 = v17;

        if (!v10)
        {
          _HKInitializeLogging();
          id v12 = (void *)*MEMORY[0x1E4F29F30];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
          {
            uint64_t v14 = v12;
            uint64_t v15 = NSStringFromClass(v9);
            *(_DWORD *)long long buf = 138543618;
            id v24 = v15;
            __int16 v25 = 2114;
            id v26 = v5;
            _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "Failed to unarchive data for %{public}@: %{public}@", buf, 0x16u);
          }
          unsigned __int8 v22 = 0;

          goto LABEL_15;
        }
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
        [v10 setDemoDataGenerationContextWithProfile:WeakRetained generatorState:*(void *)(a1 + 48)];

        [v2 addObject:v10];
        ++v7;
        BOOL v8 = v5;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v27 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v5 = 0;
  }

  objc_storeStrong((id *)(a1 + 24), v2);
  unsigned __int8 v22 = 1;
LABEL_15:

  return v22;
}

- (id)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (id)firstSampleDate
{
  return [(HDDemoDataGeneratorState *)self->_generatorState firstSampleDate];
}

- (int64_t)firstSampleDayOfYear
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__HDDemoDataGenerator_firstSampleDayOfYear__block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  if (qword_1EBA18DF0 != -1) {
    dispatch_once(&qword_1EBA18DF0, block);
  }
  return _MergedGlobals_219;
}

void __43__HDDemoDataGenerator_firstSampleDayOfYear__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 56);
  id v3 = [*(id *)(v1 + 48) firstSampleDate];
  _MergedGlobals_219 = [v2 ordinalityOfUnit:16 inUnit:4 forDate:v3];
}

- (id)currentDateFromCurrentTime:(double)a3
{
  uint64_t v4 = [(HDDemoDataGeneratorState *)self->_generatorState firstSampleDate];
  id v5 = [v4 dateByAddingTimeInterval:a3 * 86400.0];

  return v5;
}

- (BOOL)isDemoDataTimeInWeekend:(double)a3 calendar:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(HDDemoDataGenerator *)self currentDateFromCurrentTime:a3];
  BOOL v8 = [v6 components:512 fromDate:v7];

  if (v8 && [v8 weekday] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = objc_msgSend(v6, "hk_weekendDays");
    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "weekday"));
    char v10 = [v11 containsObject:v12];
  }
  else
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = v9;
      uint64_t v15 = objc_opt_class();
      id v16 = NSNumber;
      id v17 = v15;
      long long v18 = [v16 numberWithDouble:a3];
      int v19 = 138543618;
      long long v20 = v15;
      __int16 v21 = 2114;
      unsigned __int8 v22 = v18;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to determine weekday components from time %{public}@", (uint8_t *)&v19, 0x16u);
    }
    char v10 = 0;
  }

  return v10;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDDemoDataPerson)demoPerson
{
  return self->_demoPerson;
}

- (void)setDemoPerson:(id)a3
{
}

- (HDDemoDataGeneratorConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (HDDemoDataActivitySampleGenerator)activitySampleGenerator
{
  return self->_activitySampleGenerator;
}

- (void)setActivitySampleGenerator:(id)a3
{
}

- (HDDemoDataAlcoholSampleGenerator)alcoholSampleGenerator
{
  return self->_alcoholSampleGenerator;
}

- (void)setAlcoholSampleGenerator:(id)a3
{
}

- (HDDemoDataAudioExposureSampleGenerator)audioExposureSampleGenerator
{
  return self->_audioExposureSampleGenerator;
}

- (void)setAudioExposureSampleGenerator:(id)a3
{
}

- (HDDemoDataAudiogramSampleGenerator)audiogramSampleGenerator
{
  return self->_audiogramSampleGenerator;
}

- (void)setAudiogramSampleGenerator:(id)a3
{
}

- (HDDemoDataBodySampleGenerator)bodySampleGenerator
{
  return self->_bodySampleGenerator;
}

- (void)setBodySampleGenerator:(id)a3
{
}

- (HDDemoDataFoodSampleGenerator)foodSampleGenerator
{
  return self->_foodSampleGenerator;
}

- (void)setFoodSampleGenerator:(id)a3
{
}

- (HDDemoDataHealthDocumentSampleGenerator)healthDocumentSampleGenerator
{
  return self->_healthDocumentSampleGenerator;
}

- (void)setHealthDocumentSampleGenerator:(id)a3
{
}

- (HDDemoDataHeartSampleGenerator)heartSampleGenerator
{
  return self->_heartSampleGenerator;
}

- (void)setHeartSampleGenerator:(id)a3
{
}

- (HDDemoDataMindfulnessSampleGenerator)mindfulnessSampleGenerator
{
  return self->_mindfulnessSampleGenerator;
}

- (void)setMindfulnessSampleGenerator:(id)a3
{
}

- (HDDemoDataMobilitySampleGenerator)mobilitySampleGenerator
{
  return self->_mobilitySampleGenerator;
}

- (void)setMobilitySampleGenerator:(id)a3
{
}

- (HDDemoDataOtherAndAdditionalSampleGenerator)otherAndAdditionalSampleGenerator
{
  return self->_otherAndAdditionalSampleGenerator;
}

- (void)setOtherAndAdditionalSampleGenerator:(id)a3
{
}

- (HDDemoDataPathologySampleGenerator)pathologySampleGenerator
{
  return self->_pathologySampleGenerator;
}

- (void)setPathologySampleGenerator:(id)a3
{
}

- (HDDemoDataReproductiveHealthSampleGenerator)reproductiveHealthSampleGenerator
{
  return self->_reproductiveHealthSampleGenerator;
}

- (void)setReproductiveHealthSampleGenerator:(id)a3
{
}

- (HDDemoDataSleepSampleGenerator)sleepSampleGenerator
{
  return self->_sleepSampleGenerator;
}

- (void)setSleepSampleGenerator:(id)a3
{
}

- (HDDemoDataStatisticsSampleGenerator)statisticsSampleGenerator
{
  return self->_statisticsSampleGenerator;
}

- (void)setStatisticsSampleGenerator:(id)a3
{
}

- (HDDemoDataSymptomsSampleGenerator)symptomsSampleGenerator
{
  return self->_symptomsSampleGenerator;
}

- (void)setSymptomsSampleGenerator:(id)a3
{
}

- (HDDemoDataVitalsSampleGenerator)vitalsSampleGenerator
{
  return self->_vitalsSampleGenerator;
}

- (void)setVitalsSampleGenerator:(id)a3
{
}

- (HDDemoDataGeneratorState)generatorState
{
  return self->_generatorState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vitalsSampleGenerator, 0);
  objc_storeStrong((id *)&self->_symptomsSampleGenerator, 0);
  objc_storeStrong((id *)&self->_statisticsSampleGenerator, 0);
  objc_storeStrong((id *)&self->_sleepSampleGenerator, 0);
  objc_storeStrong((id *)&self->_reproductiveHealthSampleGenerator, 0);
  objc_storeStrong((id *)&self->_pathologySampleGenerator, 0);
  objc_storeStrong((id *)&self->_otherAndAdditionalSampleGenerator, 0);
  objc_storeStrong((id *)&self->_mobilitySampleGenerator, 0);
  objc_storeStrong((id *)&self->_mindfulnessSampleGenerator, 0);
  objc_storeStrong((id *)&self->_heartSampleGenerator, 0);
  objc_storeStrong((id *)&self->_healthDocumentSampleGenerator, 0);
  objc_storeStrong((id *)&self->_foodSampleGenerator, 0);
  objc_storeStrong((id *)&self->_bodySampleGenerator, 0);
  objc_storeStrong((id *)&self->_audiogramSampleGenerator, 0);
  objc_storeStrong((id *)&self->_audioExposureSampleGenerator, 0);
  objc_storeStrong((id *)&self->_alcoholSampleGenerator, 0);
  objc_storeStrong((id *)&self->_activitySampleGenerator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_demoPerson, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_generatorState, 0);
  objc_storeStrong((id *)&self->_appProvenances, 0);
  objc_storeStrong((id *)&self->_dataGeneratorClassesFromPlugins, 0);
  objc_storeStrong((id *)&self->_dataGeneratorsFromPlugins, 0);
  objc_storeStrong((id *)&self->_demoDataGenerators, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end