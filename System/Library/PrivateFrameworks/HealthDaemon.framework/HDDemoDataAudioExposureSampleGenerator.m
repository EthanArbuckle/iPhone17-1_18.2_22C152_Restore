@interface HDDemoDataAudioExposureSampleGenerator
+ (BOOL)supportsSecureCoding;
- (HDDemoDataAudioExposureSampleGenerator)init;
- (HDDemoDataAudioExposureSampleGenerator)initWithCoder:(id)a3;
- (id)_headphoneAudioExposureMetadata;
- (id)_headphoneProvenanceWithPerson:(void *)a1;
- (id)_makeNormallyDistributedAudioExposureLevelsWithCount:(unint64_t)a1 audioLevelType:(unint64_t)a2 loudData:;
- (id)_makeQuantitySampleWithType:(void *)a1 value:(void *)a2 unit:(void *)a3 startDate:(void *)a4 endDate:(void *)a5 metadata:(void *)a6;
- (void)encodeWithCoder:(id)a3;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
@end

@implementation HDDemoDataAudioExposureSampleGenerator

- (HDDemoDataAudioExposureSampleGenerator)init
{
  v7.receiver = self;
  v7.super_class = (Class)HDDemoDataAudioExposureSampleGenerator;
  v2 = [(HDDemoDataBaseSampleGenerator *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_nextEnvironmentalAudioExposureSampleTime = 0.0;
    v2->_didGenerateEnvironmentalAudioExposureSamples = 0;
    v2->_nextHeadphoneAudioExposureSampleTime = 0.0;
    v2->_didGenerateHeadphoneAudioExposureSamples = 0;
    lastHeadphoneSampleEndDate = v2->_lastHeadphoneSampleEndDate;
    v2->_lastHeadphoneSampleEndDate = 0;

    lastEnvironmentalSampleEndDate = v3->_lastEnvironmentalSampleEndDate;
    v3->_lastEnvironmentalSampleEndDate = 0;
  }
  return v3;
}

- (HDDemoDataAudioExposureSampleGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDDemoDataAudioExposureSampleGenerator;
  v5 = [(HDDemoDataBaseSampleGenerator *)&v13 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"NextEnvironmentalAudioExposureSampleTimeKey"];
    v5->_nextEnvironmentalAudioExposureSampleTime = v6;
    v5->_didGenerateEnvironmentalAudioExposureSamples = [v4 decodeBoolForKey:@"DidGenerateEnvironmentalAudioExposureSamplesKey"];
    [v4 decodeDoubleForKey:@"NextHeadphoneAudioExposureSampleTimeKey"];
    v5->_nextHeadphoneAudioExposureSampleTime = v7;
    v5->_didGenerateHeadphoneAudioExposureSamples = [v4 decodeBoolForKey:@"DidGenerateHeadphoneAudioExposureSamplesKey"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastEnvironmentalSampleEndDateKey"];
    lastEnvironmentalSampleEndDate = v5->_lastEnvironmentalSampleEndDate;
    v5->_lastEnvironmentalSampleEndDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastHeadphoneSampleEndDateKey"];
    lastHeadphoneSampleEndDate = v5->_lastHeadphoneSampleEndDate;
    v5->_lastHeadphoneSampleEndDate = (NSDate *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataAudioExposureSampleGenerator;
  [(HDDemoDataBaseSampleGenerator *)&v6 encodeWithCoder:v4];
  if (self)
  {
    [v4 encodeDouble:@"NextEnvironmentalAudioExposureSampleTimeKey" forKey:self->_nextEnvironmentalAudioExposureSampleTime];
    [v4 encodeBool:self->_didGenerateEnvironmentalAudioExposureSamples forKey:@"DidGenerateEnvironmentalAudioExposureSamplesKey"];
    [v4 encodeDouble:@"NextHeadphoneAudioExposureSampleTimeKey" forKey:self->_nextHeadphoneAudioExposureSampleTime];
    [v4 encodeBool:self->_didGenerateHeadphoneAudioExposureSamples forKey:@"DidGenerateHeadphoneAudioExposureSamplesKey"];
    [v4 encodeObject:self->_lastHeadphoneSampleEndDate forKey:@"LastHeadphoneSampleEndDateKey"];
    lastEnvironmentalSampleEndDate = self->_lastEnvironmentalSampleEndDate;
  }
  else
  {
    [v4 encodeDouble:@"NextEnvironmentalAudioExposureSampleTimeKey" forKey:0.0];
    [v4 encodeBool:0 forKey:@"DidGenerateEnvironmentalAudioExposureSamplesKey"];
    [v4 encodeDouble:@"NextHeadphoneAudioExposureSampleTimeKey" forKey:0.0];
    [v4 encodeBool:0 forKey:@"DidGenerateHeadphoneAudioExposureSamplesKey"];
    [v4 encodeObject:0 forKey:@"LastHeadphoneSampleEndDateKey"];
    lastEnvironmentalSampleEndDate = 0;
  }
  [v4 encodeObject:lastEnvironmentalSampleEndDate forKey:@"LastEnvironmentalSampleEndDateKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  uint64_t v10 = self;
  uint64_t v209 = *MEMORY[0x1E4F143B8];
  v195.receiver = self;
  v195.super_class = (Class)HDDemoDataAudioExposureSampleGenerator;
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v195 generateObjectsForDemoPerson:v13 fromTime:v12 toTime:v11 currentDate:a5 objectCollection:a5];
  id v14 = v13;
  id v160 = v12;
  id v167 = v11;
  if (!v10)
  {

    v15 = v160;
    id v150 = v14;
    id v151 = v160;
    id v152 = v167;
    goto LABEL_70;
  }
  v166 = v10;
  if (v10->_nextEnvironmentalAudioExposureSampleTime > a5)
  {
    v10->_didGenerateEnvironmentalAudioExposureSamples = 0;
    v15 = v160;
    goto LABEL_30;
  }
  v15 = v160;
  if (v10->_lastEnvironmentalSampleEndDate)
  {
    v16 = [MEMORY[0x1E4F2B618] decibelAWeightedSoundPressureLevelUnit];
    v17 = v10->_lastEnvironmentalSampleEndDate;
    id v18 = v160;
    v19 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v20 = [v19 component:32 fromDate:v18];

    if (v20 >= 22)
    {
      v21 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v22 = [v21 dateBySettingHour:22 minute:0 second:0 ofDate:v18 options:2];

      id v18 = (id)v22;
    }
    [v18 timeIntervalSinceDate:v17];
    if ((uint64_t)v23 >= 120)
    {
      id v154 = v18;
      v156 = v16;
      id v157 = v14;
      unint64_t v24 = (uint64_t)v23 / 0x78uLL;
      id v186 = v16;
      v155 = v17;
      v25 = v17;
      v178 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7F0]];
      v184 = -[HDDemoDataAudioExposureSampleGenerator _makeNormallyDistributedAudioExposureLevelsWithCount:audioLevelType:loudData:](v24, 1uLL);
      v159 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7F8]];
      v181 = -[HDDemoDataAudioExposureSampleGenerator _makeNormallyDistributedAudioExposureLevelsWithCount:audioLevelType:loudData:](v24, 2uLL);
      v26 = v25;
      v27 = [(NSDate *)v26 dateByAddingTimeInterval:120.0];
      unint64_t v177 = v24;
      v189 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2 * v24];
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      v168 = 0;
      uint64_t v164 = *MEMORY[0x1E4F2A0C8];
      uint64_t v162 = *MEMORY[0x1E4F2BAB8];
      uint64_t v161 = *MEMORY[0x1E4F297A8];
      v153 = v26;
      unint64_t v30 = 0x1E4F1C000uLL;
      while (1)
      {
        v31 = (void *)MEMORY[0x1C187C0E0]();
        v32 = [v184 objectAtIndex:v28];
        v33 = [v181 objectAtIndex:v28];
        [v32 doubleValue];
        if (v34 >= 80.0)
        {
          if (!v29)
          {
            v35 = v26;

            v168 = v35;
          }
          ++v29;
        }
        else
        {
          uint64_t v29 = 0;
        }
        context = -[HDDemoDataAudioExposureSampleGenerator _makeQuantitySampleWithType:value:unit:startDate:endDate:metadata:](v178, v32, v186, v26, v27, 0);
        objc_msgSend(v189, "addObject:");
        v36 = [*(id *)(v30 + 2472) currentCalendar];
        if ([v36 component:32 fromDate:v26] >= 11)
        {
          v37 = [*(id *)(v30 + 2472) currentCalendar];
          uint64_t v174 = v28;
          uint64_t v38 = v29;
          v39 = v33;
          unint64_t v40 = v30;
          v41 = v32;
          v42 = v31;
          uint64_t v43 = [v37 component:32 fromDate:v27];

          BOOL v44 = v43 <= 11;
          v31 = v42;
          v32 = v41;
          unint64_t v30 = v40;
          v33 = v39;
          uint64_t v29 = v38;
          uint64_t v28 = v174;
          if (!v44) {
            goto LABEL_19;
          }
          v36 = -[HDDemoDataAudioExposureSampleGenerator _makeQuantitySampleWithType:value:unit:startDate:endDate:metadata:](v159, v33, v186, v26, v27, 0);
          [v189 addObject:v36];
        }

LABEL_19:
        v45 = [v27 dateByAddingTimeInterval:0.0];

        v46 = [(NSDate *)v45 dateByAddingTimeInterval:120.0];

        if (v29 >= 6)
        {
          v47 = (void *)MEMORY[0x1E4F2B370];
          [v32 doubleValue];
          objc_msgSend(v47, "quantityWithUnit:doubleValue:", v186);
          v48 = v175 = v31;
          v49 = [MEMORY[0x1E4F2B370] quantityWithUnit:v186 doubleValue:80.0];
          *(void *)&long long buf = v164;
          *((void *)&buf + 1) = v162;
          *(void *)v198 = v48;
          uint64_t v199 = (uint64_t)v49;
          v50 = (void *)MEMORY[0x1E4F1C9E8];
          id v51 = v49;
          id v170 = v48;
          v52 = v45;
          v53 = v168;
          v54 = [v50 dictionaryWithObjects:v198 forKeys:&buf count:2];
          id v173 = v46;
          v55 = (void *)MEMORY[0x1E4F2ACB0];
          [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:v161];
          v56 = v32;
          v58 = v57 = v33;
          v59 = [v55 categorySampleWithType:v58 value:1 startDate:v53 endDate:v52 metadata:v54];

          v31 = v175;
          v33 = v57;
          v32 = v56;

          unint64_t v30 = 0x1E4F1C000uLL;
          [v189 addObject:v59];

          v46 = v173;
          uint64_t v29 = 0;
        }

        ++v28;
        v26 = v45;
        v27 = v46;
        if (v177 == v28)
        {
          v60 = [MEMORY[0x1E4F1C978] arrayWithArray:v189];

          if ([v60 count]) {
            [v167 addObjectsFromWatch:v60];
          }
          v61 = [v60 lastObject];
          uint64_t v62 = [v61 endDate];
          uint64_t v10 = v166;
          lastEnvironmentalSampleEndDate = v166->_lastEnvironmentalSampleEndDate;
          v166->_lastEnvironmentalSampleEndDate = (NSDate *)v62;

          v64 = [*(id *)(v30 + 2472) currentCalendar];
          v65 = [v64 dateByAddingUnit:32 value:1 toDate:v166->_lastEnvironmentalSampleEndDate options:2];

          v66 = [*(id *)(v30 + 2472) currentCalendar];
          v67 = [v66 dateBySettingHour:22 minute:0 second:0 ofDate:v166->_lastEnvironmentalSampleEndDate options:2];

          if (objc_msgSend(v65, "hk_isAfterDate:", v67))
          {
            v166->_nextEnvironmentalAudioExposureSampleTime = ceil(a5) + 0.25;
            v68 = v166->_lastEnvironmentalSampleEndDate;
            v166->_lastEnvironmentalSampleEndDate = 0;
          }
          else
          {
            v166->_nextEnvironmentalAudioExposureSampleTime = a5 + 0.0416666667;
          }
          v15 = v160;
          v17 = v155;
          v16 = v156;
          id v18 = v154;
          v166->_didGenerateEnvironmentalAudioExposureSamples = 1;

          id v14 = v157;
          break;
        }
      }
    }
  }
  else
  {
    v69 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v70 = [v69 dateBySettingHour:6 minute:0 second:0 ofDate:v160 options:2];
    v71 = v10->_lastEnvironmentalSampleEndDate;
    v10->_lastEnvironmentalSampleEndDate = (NSDate *)v70;

    v10->_nextEnvironmentalAudioExposureSampleTime = 0.291666667;
    v10->_didGenerateEnvironmentalAudioExposureSamples = 0;
  }
LABEL_30:

  id v72 = v14;
  id v73 = v15;
  id v74 = v167;
  if (v10->_nextHeadphoneAudioExposureSampleTime > a5)
  {
LABEL_35:
    v10->_didGenerateHeadphoneAudioExposureSamples = 0;
    goto LABEL_70;
  }
  if (!v10->_lastHeadphoneSampleEndDate)
  {
    v84 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v85 = [v84 dateBySettingHour:6 minute:30 second:0 ofDate:v73 options:2];
    lastHeadphoneSampleEndDate = v10->_lastHeadphoneSampleEndDate;
    v10->_lastHeadphoneSampleEndDate = (NSDate *)v85;

    v10->_nextHeadphoneAudioExposureSampleTime = 0.3125;
    goto LABEL_35;
  }
  id v158 = v14;
  uint64_t v75 = *MEMORY[0x1E4F2A820];
  v76 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A820]];
  v77 = [MEMORY[0x1E4F2B618] decibelAWeightedSoundPressureLevelUnit];
  v176 = v10->_lastHeadphoneSampleEndDate;
  id v78 = v73;
  unint64_t v79 = 0x1E4F1C000uLL;
  v80 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v81 = [v80 component:32 fromDate:v78];

  if (v81 < 23)
  {
    v83 = v78;
  }
  else
  {
    v82 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v83 = [v82 dateBySettingHour:22 minute:0 second:0 ofDate:v78 options:2];
  }
  int v87 = [v72 createHighFidelityData];
  v169 = v83;
  [v83 timeIntervalSinceDate:v176];
  v88 = [(HDDemoDataBaseSampleGenerator *)v10 demoDataGenerator];
  v89 = [v88 configuration];
  [v89 shouldGenerateLoudHeadphoneData];
  v171 = v77;
  v172 = v76;
  if (v87)
  {
    v90 = -[HDDemoDataAudioExposureSampleGenerator _makeNormallyDistributedAudioExposureLevelsWithCount:audioLevelType:loudData:](0x384uLL, 0);

    id v91 = v76;
    id v92 = v90;
    id v93 = v77;
    v94 = v176;
    id v95 = v72;
    contexta = v93;
    if ([v92 count])
    {
      v96 = (void *)MEMORY[0x1E4F2B370];
      v190 = v92;
      v97 = [v92 objectAtIndexedSubscript:0];
      [v97 doubleValue];
      uint64_t v98 = objc_msgSend(v96, "quantityWithUnit:doubleValue:", v93);

      v179 = (void *)v98;
      v187 = [MEMORY[0x1E4F2B388] _unfrozenQuantitySampleWithQuantityType:v91 quantity:v98 startDate:v94 device:0];
      v99 = [v91 identifier];
      LODWORD(v97) = [v99 isEqualToString:v75];

      if (v97)
      {
        v100 = -[HDDemoDataAudioExposureSampleGenerator _headphoneAudioExposureMetadata]();
        [v187 _setMetadata:v100];
      }
      v101 = [(HDDemoDataBaseSampleGenerator *)v10 demoDataGenerator];
      v102 = [v101 profile];
      v103 = [v102 dataManager];

      id v182 = v95;
      v104 = -[HDDemoDataAudioExposureSampleGenerator _headphoneProvenanceWithPerson:](v10, v95);
      if (v104)
      {
        v105 = [(HDDemoDataBaseSampleGenerator *)v10 demoDataGenerator];
        v106 = [v105 profile];
        v107 = [v106 database];
        id v196 = 0;
        *(void *)v198 = MEMORY[0x1E4F143A8];
        uint64_t v199 = 3221225472;
        v200 = __171__HDDemoDataAudioExposureSampleGenerator__makeQuantitySeriesSamplesWithType_rawSampleValues_sampleUnit_initialSampleDate_sampleDuration_distanceBetweenSamples_demoPerson___block_invoke;
        v201 = &unk_1E62F40E8;
        v202 = v94;
        uint64_t v207 = 0x4008000000000000;
        id v203 = v103;
        id v108 = v187;
        id v204 = v108;
        id v205 = v104;
        id v206 = v190;
        uint64_t v208 = 0;
        BOOL v109 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v107 error:&v196 block:v198];
        id v110 = v196;

        if (!v109)
        {
          _HKInitializeLogging();
          v111 = *MEMORY[0x1E4F29F30];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v110;
            _os_log_error_impl(&dword_1BCB7D000, v111, OS_LOG_TYPE_ERROR, "Failed to generate audio series: %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
        *(void *)&long long buf = v108;
        v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:1];

        uint64_t v10 = v166;
        unint64_t v113 = 0x1EBA09000;
        unint64_t v79 = 0x1E4F1C000;
        id v92 = v190;
        v114 = v179;
      }
      else
      {
        _HKInitializeLogging();
        v137 = *MEMORY[0x1E4F29F30];
        unint64_t v113 = 0x1EBA09000uLL;
        v114 = v179;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v198 = 0;
          _os_log_error_impl(&dword_1BCB7D000, v137, OS_LOG_TYPE_ERROR, "Failed to get demo data provenance; skipping sample insert.",
            v198,
            2u);
        }
        v112 = (void *)MEMORY[0x1E4F1CBF0];
        id v92 = v190;
      }

      id v95 = v182;
    }
    else
    {
      v112 = (void *)MEMORY[0x1E4F1CBF0];
      unint64_t v113 = 0x1EBA09000;
    }
  }
  else
  {
    v115 = -[HDDemoDataAudioExposureSampleGenerator _makeNormallyDistributedAudioExposureLevelsWithCount:audioLevelType:loudData:](0x16uLL, 0);

    id v188 = v76;
    id v92 = v115;
    id v185 = v77;
    v116 = v176;
    id v117 = v72;
    v118 = v116;
    v119 = [(NSDate *)v118 dateByAddingTimeInterval:120.0];
    v120 = [(HDDemoDataBaseSampleGenerator *)v10 demoDataGenerator];
    v121 = [v120 profile];
    v183 = [v121 dataManager];

    v180 = -[HDDemoDataAudioExposureSampleGenerator _headphoneProvenanceWithPerson:](v10, v117);
    if (v180)
    {
      id v165 = v117;
      v122 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v92, "count"));
      v163 = v118;
      v123 = v118;
      id v191 = v92;
      while (1)
      {
        unint64_t v124 = [v122 count];
        if (v124 >= [v92 count]) {
          break;
        }
        contextb = (void *)MEMORY[0x1C187C0E0]();
        v125 = objc_msgSend(v92, "objectAtIndex:", objc_msgSend(v122, "count"));
        v126 = -[HDDemoDataAudioExposureSampleGenerator _headphoneAudioExposureMetadata]();
        v127 = -[HDDemoDataAudioExposureSampleGenerator _makeQuantitySampleWithType:value:unit:startDate:endDate:metadata:](v188, v125, v185, v123, v119, v126);

        [v122 addObject:v127];
        v128 = [(HDDemoDataBaseSampleGenerator *)v10 demoDataGenerator];
        v129 = [v128 profile];
        [v129 database];
        v131 = v130 = v119;
        id v196 = 0;
        *(void *)v198 = MEMORY[0x1E4F143A8];
        uint64_t v199 = 3221225472;
        v200 = __166__HDDemoDataAudioExposureSampleGenerator__makeHeadphoneSamplesWithType_rawSampleValues_sampleUnit_initialSampleDate_sampleDuration_distanceBetweenSamples_demoPerson___block_invoke;
        v201 = &unk_1E62F5A88;
        v202 = v183;
        id v132 = v127;
        id v203 = v132;
        id v204 = v180;
        BOOL v133 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v131 error:&v196 block:v198];
        id v134 = v196;

        if (v133)
        {
          v135 = [v130 dateByAddingTimeInterval:0.0];

          v119 = [(NSDate *)v135 dateByAddingTimeInterval:120.0];

          v123 = v135;
        }
        else
        {
          _HKInitializeLogging();
          v136 = *MEMORY[0x1E4F29F30];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v134;
            _os_log_error_impl(&dword_1BCB7D000, v136, OS_LOG_TYPE_ERROR, "Failed to generate audio series: %{public}@", (uint8_t *)&buf, 0xCu);
          }
          id v173 = v122;
          v119 = v130;
        }

        uint64_t v10 = v166;
        unint64_t v79 = 0x1E4F1C000;
        id v92 = v191;
        if (!v133) {
          goto LABEL_59;
        }
      }
      id v173 = [MEMORY[0x1E4F1C978] arrayWithArray:v122];
LABEL_59:

      v112 = v173;
      v118 = v163;
      id v117 = v165;
    }
    else
    {
      v112 = (void *)MEMORY[0x1E4F1CBF0];
      v123 = v118;
    }

    unint64_t v113 = 0x1EBA09000;
  }

  v138 = v112;
  v139 = [v112 lastObject];
  uint64_t v140 = [v139 endDate];
  uint64_t v141 = *(int *)(v113 + 3508);
  v142 = *(Class *)((char *)&v10->super.super.isa + v141);
  *(Class *)((char *)&v10->super.super.isa + v141) = (Class)v140;

  signed int v143 = arc4random_uniform(5u) + 1;
  v144 = [*(id *)(v79 + 2472) currentCalendar];
  v145 = [v144 dateByAddingUnit:32 value:v143 toDate:*(Class *)((char *)&v10->super.super.isa + *(int *)(v113 + 3508)) options:2];

  v146 = [*(id *)(v79 + 2472) currentCalendar];
  v147 = [v146 dateBySettingHour:22 minute:0 second:0 ofDate:*(Class *)((char *)&v10->super.super.isa + *(int *)(v113 + 3508)) options:2];

  if (objc_msgSend(v145, "hk_isAfterDate:", v147))
  {
    v148 = 0;
    double v149 = ceil(a5);
    a5 = 0.25;
  }
  else
  {
    double v149 = ((double)v143 * 3600.0 + 0.0 + 0.0) * 0.0000115740741;
    v148 = v145;
  }
  v15 = v160;
  v10->_nextHeadphoneAudioExposureSampleTime = a5 + v149;
  objc_storeStrong((id *)&v10->_lastHeadphoneSampleEndDate, v148);
  v10->_didGenerateHeadphoneAudioExposureSamples = 1;

  id v14 = v158;
LABEL_70:
}

- (id)_makeNormallyDistributedAudioExposureLevelsWithCount:(unint64_t)a1 audioLevelType:(unint64_t)a2 loudData:
{
  if (a2 == 2)
  {
    double v4 = 25.0;
LABEL_5:
    v5 = objc_msgSend(&unk_1F17E9BB8, "hk_filter:");
    goto LABEL_7;
  }
  double v4 = 105.0;
  if (a2 <= 1) {
    goto LABEL_5;
  }
  v5 = &unk_1F17E9BB8;
LABEL_7:
  objc_super v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a1];
  id v7 = v5;
  uint64_t v8 = objc_msgSend(v7, "objectAtIndex:", arc4random_uniform(objc_msgSend(v7, "count")));

  [v8 doubleValue];
  double v10 = v9;

  if (!a2)
  {
    uint32_t v11 = arc4random_uniform(0x28u);
    if (!v11) {
      double v10 = 96.0;
    }
    a1 >>= v11 == 0;
  }
  while ([v6 count] < a1)
  {
    id v12 = (void *)MEMORY[0x1C187C0E0]();
    long double v13 = (double)arc4random() / 4294967300.0;
    double v14 = (double)arc4random() / 4294967300.0;
    double v15 = sqrt(log(v13) * -2.0);
    double v16 = v10 + v15 * cos(v14 * 6.28318531) * 4.0;
    if (v16 < 1.0) {
      double v16 = 1.0;
    }
    if (v16 >= v4) {
      double v16 = v4;
    }
    v17 = [NSNumber numberWithDouble:v16];
    [v6 addObject:v17];
  }
  id v18 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];

  return v18;
}

BOOL __119__HDDemoDataAudioExposureSampleGenerator__makeNormallyDistributedAudioExposureLevelsWithCount_audioLevelType_loudData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(a1 + 32);
  double v5 = dbl_1BD32C550[v4 == 0];
  [v3 doubleValue];
  if (v6 >= v5)
  {
    if (v4) {
      double v8 = 92.0;
    }
    else {
      double v8 = 80.0;
    }
    [v3 doubleValue];
    BOOL v7 = v9 <= v8;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

BOOL __119__HDDemoDataAudioExposureSampleGenerator__makeNormallyDistributedAudioExposureLevelsWithCount_audioLevelType_loudData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 doubleValue];
  if (v3 >= 45.0)
  {
    [v2 doubleValue];
    BOOL v4 = v5 <= 83.0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

BOOL __119__HDDemoDataAudioExposureSampleGenerator__makeNormallyDistributedAudioExposureLevelsWithCount_audioLevelType_loudData___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 doubleValue];
  if (v3 >= 1.0)
  {
    [v2 doubleValue];
    BOOL v4 = v5 <= 25.0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_headphoneProvenanceWithPerson:(void *)a1
{
  v72[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F2AEF8]);
  double v5 = [MEMORY[0x1E4F29128] UUID];
  double v6 = [v5 UUIDString];
  BOOL v7 = (void *)[v4 initWithName:@"AirPods", @"Apple, Inc.", @"AirPods 1,1", 0, 0, 0, v6, 0 manufacturer model hardwareVersion firmwareVersion softwareVersion localIdentifier UDIDeviceIdentifier];

  v72[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F2AEF8]);
  double v9 = [MEMORY[0x1E4F29128] UUID];
  double v10 = [v9 UUIDString];
  uint32_t v11 = (void *)[v8 initWithName:@"EarPods", @"Apple, Inc.", @"EarPods 1,1", 0, 0, 0, v10, 0 manufacturer model hardwareVersion firmwareVersion softwareVersion localIdentifier UDIDeviceIdentifier];

  v72[1] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F2AEF8]);
  long double v13 = [MEMORY[0x1E4F29128] UUID];
  double v14 = [v13 UUIDString];
  double v15 = (void *)[v12 initWithName:@"Powerbeats Pro" manufacturer:@"Beats By Dre" model:@"Powerbeats Pro 1,1" hardwareVersion:0 firmwareVersion:0 softwareVersion:0 localIdentifier:v14 UDIDeviceIdentifier:0];

  v72[2] = v15;
  id v16 = objc_alloc(MEMORY[0x1E4F2AEF8]);
  v17 = [MEMORY[0x1E4F29128] UUID];
  id v18 = [v17 UUIDString];
  v19 = (void *)[v16 initWithName:0, @"Foo, Inc.", @"FooPods 1,1", 0, 0, 0, v18, 0 manufacturer model hardwareVersion firmwareVersion softwareVersion localIdentifier UDIDeviceIdentifier];

  v72[3] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:4];

  v21 = NSString;
  uint64_t v22 = [v3 firstName];

  double v23 = [v21 stringWithFormat:@"%@'s Watch", v22];

  unint64_t v24 = [a1 demoDataGenerator];
  v25 = [v24 profile];
  v26 = [v25 sourceManager];

  if (v26)
  {
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA"];
    id v67 = 0;
    uint64_t v28 = [v26 sourceForAppleDeviceWithUUID:v27 identifier:@"com.apple.health.demo_watch" name:v23 productType:@"Watch1,2" createIfNecessary:1 error:&v67];
    id v29 = v67;

    if (v28)
    {
      v63 = v28;
      unint64_t v30 = [a1 demoDataGenerator];
      v31 = [v30 profile];
      v32 = [v31 deviceManager];
      v33 = objc_msgSend(v20, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v20, "count")));
      id v66 = v29;
      double v34 = [v32 deviceEntityForDevice:v33 error:&v66];
      id v64 = v66;

      if (v34)
      {
        v61 = v23;
        v35 = [a1 demoDataGenerator];
        v36 = [v35 profile];
        v37 = [v36 daemon];
        uint64_t v38 = [v37 behavior];

        v59 = [a1 demoDataGenerator];
        v58 = [v59 profile];
        uint64_t v57 = [v58 currentSyncIdentityPersistentID];
        uint64_t v39 = [v38 currentOSBuild];
        unint64_t v40 = (void *)v39;
        v41 = @"UnknownBuild";
        if (v39) {
          v41 = (__CFString *)v39;
        }
        v56 = v41;
        uint64_t v62 = v20;
        v60 = v26;
        if (v38) {
          [v38 currentOSVersionStruct];
        }
        else {
          memset(v65, 0, sizeof(v65));
        }
        v46 = [v38 currentOSVersion];
        v47 = [v38 localTimeZone];
        v48 = [v47 name];
        uint64_t v28 = v63;
        v49 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v63, "persistentID"));
        v50 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v34, "persistentID"));
        uint64_t v43 = +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:0 syncIdentity:v57 productType:@"Watch1,2" systemBuild:v56 operatingSystemVersion:v65 sourceVersion:v46 timeZoneName:v48 sourceID:v49 deviceID:v50 contributorReference:0];

        double v23 = v61;
        uint64_t v20 = v62;
        id v29 = v64;
        v26 = v60;
      }
      else
      {
        _HKInitializeLogging();
        v45 = *MEMORY[0x1E4F29F30];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          id v29 = v64;
          id v69 = v64;
          _os_log_error_impl(&dword_1BCB7D000, v45, OS_LOG_TYPE_ERROR, "Error creating headphone device entity %{public}@", buf, 0xCu);
          uint64_t v43 = 0;
        }
        else
        {
          uint64_t v43 = 0;
          id v29 = v64;
        }
        uint64_t v28 = v63;
        double v34 = 0;
      }
    }
    else
    {
      _HKInitializeLogging();
      BOOL v44 = *MEMORY[0x1E4F29F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v69 = v29;
        _os_log_error_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_ERROR, "Error creating watch source entity %{public}@", buf, 0xCu);
      }
      uint64_t v43 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    v42 = (void *)*MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
    {
      v52 = v42;
      v53 = [a1 demoDataGenerator];
      v54 = [a1 demoDataGenerator];
      v55 = [v54 profile];
      *(_DWORD *)long long buf = 138543618;
      id v69 = v53;
      __int16 v70 = 2114;
      v71 = v55;
      _os_log_error_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_ERROR, "No source manager found on generator %{public}@ for profile %{public}@", buf, 0x16u);
    }
    uint64_t v43 = 0;
  }

  return v43;
}

- (id)_headphoneAudioExposureMetadata
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F2BAA0];
  v3[0] = @"com.apple.Music,com.apple.mobilesafari";
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];

  return v0;
}

- (id)_makeQuantitySampleWithType:(void *)a1 value:(void *)a2 unit:(void *)a3 startDate:(void *)a4 endDate:(void *)a5 metadata:(void *)a6
{
  uint32_t v11 = (void *)MEMORY[0x1E4F2B370];
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = a1;
  [a2 doubleValue];
  v17 = objc_msgSend(v11, "quantityWithUnit:doubleValue:", v15);

  id v18 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v16 quantity:v17 startDate:v14 endDate:v13];

  [v18 _setMetadata:v12];

  return v18;
}

uint64_t __166__HDDemoDataAudioExposureSampleGenerator__makeHeadphoneSamplesWithType_rawSampleValues_sampleUnit_initialSampleDate_sampleDuration_distanceBetweenSamples_demoPerson___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  double v5 = *(void **)(a1 + 32);
  v13[0] = *(void *)(a1 + 40);
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  BOOL v7 = [*(id *)(a1 + 48) sourceID];
  id v8 = +[HDSQLiteEntity entityWithPersistentID:v7];
  double v9 = [*(id *)(a1 + 48) deviceID];
  double v10 = +[HDSQLiteEntity entityWithPersistentID:v9];
  uint64_t v11 = [v5 insertDataObjects:v6 sourceEntity:v8 deviceEntity:v10 sourceVersion:0 creationDate:a3 error:CFAbsoluteTimeGetCurrent()];

  return v11;
}

BOOL __171__HDDemoDataAudioExposureSampleGenerator__makeQuantitySeriesSamplesWithType_rawSampleValues_sampleUnit_initialSampleDate_sampleDuration_distanceBetweenSamples_demoPerson___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v33 = a2;
  id v5 = *(id *)(a1 + 32);
  double v6 = [*(id *)(a1 + 32) dateByAddingTimeInterval:*(double *)(a1 + 72)];
  BOOL v7 = *(void **)(a1 + 40);
  v34[0] = *(void *)(a1 + 48);
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  double v9 = [*(id *)(a1 + 56) sourceID];
  double v10 = +[HDSQLiteEntity entityWithPersistentID:v9];
  uint64_t v11 = [*(id *)(a1 + 56) deviceID];
  id v12 = +[HDSQLiteEntity entityWithPersistentID:v11];
  LODWORD(v7) = [v7 insertDataObjects:v8 sourceEntity:v10 deviceEntity:v12 sourceVersion:0 creationDate:a3 error:CFAbsoluteTimeGetCurrent()];

  if (v7)
  {
    uint64_t v31 = a3;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([*(id *)(a1 + 64) count])
    {
      unint64_t v14 = 0;
      id v15 = v5;
      id v16 = v6;
      do
      {
        v17 = (void *)MEMORY[0x1C187C0E0]();
        id v18 = [*(id *)(a1 + 64) objectAtIndex:v14];
        v19 = (void *)MEMORY[0x1E4F2ADB0];
        [v16 timeIntervalSinceReferenceDate];
        double v21 = v20;
        [v18 doubleValue];
        *(float *)&double v22 = *(double *)(a1 + 72);
        unint64_t v24 = [v19 datumWithTimestamp:v21 value:v23 duration:v22];
        [v13 addObject:v24];
        id v5 = [v16 dateByAddingTimeInterval:*(double *)(a1 + 80)];

        double v6 = [v5 dateByAddingTimeInterval:*(double *)(a1 + 72)];

        ++v14;
        id v15 = v5;
        id v16 = v6;
      }
      while ([*(id *)(a1 + 64) count] > v14);
    }
    v25 = objc_msgSend(*(id *)(a1 + 40), "quantitySeriesManager", v31, v33);
    char v26 = [v25 insertValues:v13 series:*(void *)(a1 + 48) error:v32];

    if (v26)
    {
      v27 = [*(id *)(a1 + 40) quantitySeriesManager];
      uint64_t v28 = [v27 freezeSeries:*(void *)(a1 + 48) metadata:0 endDate:v6 error:v32];
      BOOL v29 = [v28 status] == 1;
    }
    else
    {
      BOOL v29 = 0;
    }
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastHeadphoneSampleEndDate, 0);

  objc_storeStrong((id *)&self->_lastEnvironmentalSampleEndDate, 0);
}

@end