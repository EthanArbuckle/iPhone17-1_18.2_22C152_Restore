@interface HDQuantityDistributionQueryServer
+ (Class)queryClass;
- (BOOL)_walkSampleValuesWithPredicate:(uint64_t)a3 errorOut:(void *)a4 handler:;
- (HDQuantityDistributionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)_categoryPredicateWithTypeCode:(void *)a3 matchingValue:(uint64_t)a4 errorOut:;
- (id)_sqlitePredicateForObjectType:(uint64_t)a3 errorOut:;
- (id)_walkSampleDatesWithPredicate:(uint64_t)a3 entityClass:(char)a4 includeUUID:(uint64_t)a5 errorOut:;
- (id)_walkSampleDatesWithPredicate:(uint64_t)a3 entityClass:(uint64_t)a4 errorOut:;
- (void)_addAttenuatedSamplesUsingAttenuateSamples:(uint64_t)a3 sampleCount:(void *)a4 distributionCalculator:(int)a5 computeAverageAndDuration:(void *)a6 calculatorForAverageAndDuration:(void *)a7 attenuationEngine:;
- (void)_addSampleIntoDistributionCalculatorAndAverageAndDurationCalculator:(void *)a3 distributionCalculator:(int)a4 computeAverageAndDuration:(void *)a5 calculatorForAverageAndDuration:(double)a6 dataFactor:;
- (void)_queue_start;
@end

@implementation HDQuantityDistributionQueryServer

- (HDQuantityDistributionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDQuantityDistributionQueryServer;
  v11 = [(HDQueryServer *)&v17 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    v12 = [[HDQuantitySampleOverlapProcessor alloc] initWithOverlapFunction:1];
    overlapProcessor = v11->_overlapProcessor;
    v11->_overlapProcessor = v12;

    uint64_t v14 = [v10 copy];
    quantityDistributionQueryServerConfiguration = v11->_quantityDistributionQueryServerConfiguration;
    v11->_quantityDistributionQueryServerConfiguration = (_HKQuantityDistributionQueryServerConfiguration *)v14;
  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  p_isa = (id *)&self->super.super.isa;
  uint64_t v252 = *MEMORY[0x1E4F143B8];
  v230.receiver = self;
  v230.super_class = (Class)HDQuantityDistributionQueryServer;
  [(HDQueryServer *)&v230 _queue_start];
  v3 = [p_isa clientProxy];
  v4 = [p_isa sampleType];
  id v229 = 0;
  v5 = [p_isa readAuthorizationStatusForType:v4 error:&v229];
  v204 = (uint64_t (**)(void *, id *))v229;
  if (!v5)
  {
    v6 = [p_isa queryUUID];
    objc_msgSend(v3, "client_deliverError:forQuery:", v204, v6);
  }
  v205 = p_isa;
  v203 = v5;
  if (![v5 canRead])
  {
    p_isa = (id *)MEMORY[0x1E4F1CBF0];
    v15 = v204;
    goto LABEL_121;
  }
  v200 = v4;
  if (p_isa)
  {
    v7 = [p_isa[25] histogramBucketSize];
    v8 = [v7 _unit];

    v198 = [p_isa quantityType];
    v197 = [v198 canonicalUnit];
    [v197 _valueByConvertingValue:v8 toUnit:1.0];
    id v10 = v9;
    v11 = [p_isa[25] histogramAnchor];

    if (v11)
    {
      v12 = [p_isa[25] histogramAnchor];
      [v12 doubleValueForUnit:v8];
      double v14 = v13;
    }
    else
    {
      double v14 = 0.0;
    }
    v16 = [p_isa[25] histogramBucketSize];
    [v16 doubleValueForUnit:v8];
    double v18 = v17;

    v19 = [HDQuantityDistributionCalculator alloc];
    v20 = [p_isa[25] startDate];
    v21 = [p_isa[25] endDate];
    v22 = [p_isa[25] anchorDate];
    v23 = [p_isa[25] intervalComponents];
    v202 = [(HDQuantityDistributionCalculator *)v19 initWithStartDate:v20 endDate:v21 anchorDate:v22 intervalComponents:v23 histogramBucketAnchor:v14 histogramBucketSize:v18];

    v24 = v205;
    char v25 = [v205[25] options];
    if (v25)
    {
      v26 = [v205[25] intervalComponents];
      v27 = (void *)[v26 copy];

      v28 = [v27 calendar];

      if (!v28)
      {
        v29 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        [v27 setCalendar:v29];
      }
      id v30 = objc_alloc(MEMORY[0x1E4F2B8A8]);
      v31 = [v205[25] anchorDate];
      v32 = (void *)[v30 initWithAnchorDate:v31 intervalComponents:v27];

      v33 = [HDStatisticsCollectionCalculatorDefaultSourceOrderProvider alloc];
      v34 = [v205 profile];
      v35 = [v205 quantityType];
      v36 = [(HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *)v33 initWithProfile:v34 quantityType:v35];

      v37 = [v205 quantityType];
      v38 = +[HDStatisticsCollectionCalculator calculatorForQuantityType:v37 intervalCollection:v32 options:66 mergeStrategy:0];

      v24 = v205;
      [v38 setSourceOrderProvider:v36];

      id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v234[0] = MEMORY[0x1E4F143A8];
      v234[1] = 3221225472;
      v234[2] = __72__HDQuantityDistributionQueryServer__queue_fetchHistogramDataWithError___block_invoke;
      v234[3] = &unk_1E62F4648;
      id v199 = v39;
      id v235 = v199;
      [v38 setStatisticsHandler:v234];
      v201 = v38;
      [v38 reset];
    }
    else
    {
      id v199 = 0;
      v201 = 0;
    }
    unint64_t v40 = [v24[25] options];
    uint64_t v41 = [v24[25] contextStyle];
    v233 = 0;
    v206 = v8;
    char v226 = v25;
    switch(v41)
    {
      case 1:
        v42 = [MEMORY[0x1E4F2B2C0] categoryTypeForIdentifier:*MEMORY[0x1E4F29818]];
        v222 = -[HDQuantityDistributionQueryServer _sqlitePredicateForObjectType:errorOut:](v24, v42, (uint64_t)&v233);

        v219 = HDDataEntityPredicateForObjectsFromAppleWatchSources(1);
        v43 = [v24 profile];
        v44 = [v43 metadataManager];
        uint64_t v45 = *MEMORY[0x1E4F2BB60];
        v46 = [v44 predicateWithMetadataKey:*MEMORY[0x1E4F2BB60] exists:0];

        v47 = (void *)MEMORY[0x1E4F65D08];
        aBlock = v219;
        uint64_t v237 = (uint64_t)v46;
        [MEMORY[0x1E4F1C978] arrayWithObjects:&aBlock count:2];
        v49 = char v48 = v40;
        v50 = [v47 predicateMatchingAllPredicates:v49];

        v51 = [v205 profile];
        v52 = [v51 metadataManager];
        [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F17EEEE0];
        v54 = v53 = v3;
        v55 = [v52 predicateWithMetadataKey:v45 allowedValues:v54];

        v3 = v53;
        v56 = (void *)MEMORY[0x1E4F65D08];
        *(void *)&long long v248 = v50;
        *((void *)&v248 + 1) = v55;
        v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v248 count:2];
        unint64_t v40 = [v56 predicateMatchingAnyPredicates:v57];

        id v58 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v222 otherPredicate:v40];

        LOBYTE(v40) = v48;
        v8 = v206;

        v24 = v205;
        goto LABEL_22;
      case 2:
        v65 = [MEMORY[0x1E4F2B2C0] workoutType];
        -[HDQuantityDistributionQueryServer _sqlitePredicateForObjectType:errorOut:](v24, v65, (uint64_t)&v233);
        id v58 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
        uint64_t v66 = objc_opt_class();
        uint64_t v67 = -[HDQuantityDistributionQueryServer _walkSampleDatesWithPredicate:entityClass:errorOut:](v24, v58, v66, (uint64_t)&v233);
        goto LABEL_28;
      case 3:
        uint64_t v59 = (v40 >> 1) & 1;
        v60 = v24;
        uint64_t v61 = 140;
        goto LABEL_19;
      case 4:
        uint64_t v59 = (v40 >> 1) & 1;
        v60 = v24;
        uint64_t v61 = 147;
        goto LABEL_19;
      case 5:
        uint64_t v59 = (v40 >> 1) & 1;
        v60 = v24;
        uint64_t v61 = 178;
LABEL_19:
        v62 = 0;
        goto LABEL_27;
      case 6:
        _HKCategoryValueSleepAnalysisAsleepValues();
        id v58 = (id)objc_claimAutoreleasedReturnValue();
        v68 = [MEMORY[0x1E4F2ACB8] dataTypeWithCode:63];
        v69 = -[HDQuantityDistributionQueryServer _sqlitePredicateForObjectType:errorOut:](v24, v68, (uint64_t)&v233);

        if (v58)
        {
          v70 = HDCategorySampleEntityPredicateEqualToValues((uint64_t)v58);
          uint64_t v71 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v69 otherPredicate:v70];

          v69 = (void *)v71;
        }

        uint64_t v72 = objc_opt_class();
        v64 = -[HDQuantityDistributionQueryServer _walkSampleDatesWithPredicate:entityClass:errorOut:](v24, v69, v72, (uint64_t)&v233);

        goto LABEL_29;
      case 7:
        uint64_t v59 = (v40 >> 1) & 1;
        v62 = &unk_1F17EEEC8;
        v60 = v24;
        uint64_t v61 = 199;
LABEL_27:
        -[HDQuantityDistributionQueryServer _categoryPredicateWithTypeCode:matchingValue:errorOut:](v60, v61, v62, (uint64_t)&v233);
        id v58 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v73 = objc_opt_class();
        uint64_t v67 = -[HDQuantityDistributionQueryServer _walkSampleDatesWithPredicate:entityClass:includeUUID:errorOut:](v24, v58, v73, v59, (uint64_t)&v233);
LABEL_28:
        v64 = (void *)v67;
LABEL_29:

        v63 = v233;
        break;
      default:
        v63 = 0;
        v64 = 0;
        break;
    }
    id v74 = v63;
    id v75 = v74;
    if (!v64 && v74)
    {
      v76 = v74;
      v77 = (uint64_t (**)(void *, id *))v74;
      p_isa = 0;
LABEL_119:

      goto LABEL_120;
    }
    v196 = v64;
    v78 = [v24[25] objectType];
    id v232 = 0;
    uint64_t v79 = -[HDQuantityDistributionQueryServer _sqlitePredicateForObjectType:errorOut:](v24, v78, (uint64_t)&v232);
    id v80 = v232;
    v194 = v75;
    v195 = (void *)v79;
    v193 = v80;
    if (!v79)
    {
      id v102 = v80;
      if (v102)
      {
        v77 = (uint64_t (**)(void *, id *))v102;
        p_isa = 0;
        v103 = v77;
      }
      else
      {
        v103 = 0;
        p_isa = 0;
        v77 = v204;
      }
      goto LABEL_118;
    }
    uint64_t v220 = v226 & 1;
    char v223 = v40;
    uint64_t v81 = *MEMORY[0x1E4F2A7F0];
    v82 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7F0]];
    v214 = v78;
    int v83 = [v78 isEqual:v82];

    char v84 = [v24[25] options];
    uint64_t v85 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:272];
    v86 = [HDQuantitySampleAttenuationProvider alloc];
    v87 = [v24 profile];
    v191 = (void *)v85;
    uint64_t v88 = [(HDQuantitySampleAttenuationProvider *)v86 initWithQuantityType:v85 profile:v87];

    v190 = (void *)v88;
    v89 = [[HDQuantitySampleAttenuationEngine alloc] initWithAttenuationEngineDelegate:v88];
    v189 = v89;
    if (v83 && (v84 & 4) != 0)
    {
      v90 = v89;
      id v91 = v196;
      id v92 = v195;
      v93 = v202;
      id v94 = v201;
      v95 = v90;
      aBlock = (void *)MEMORY[0x1E4F143A8];
      uint64_t v237 = 3221225472;
      v238 = __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke;
      v239 = &unk_1E630AA98;
      v240 = v205;
      id v96 = v92;
      id v241 = v96;
      id v97 = v91;
      id v242 = v97;
      v246 = v10;
      v98 = v93;
      v243 = v98;
      uint64_t v99 = v226 & 1;
      char v247 = v226 & 1;
      id v100 = v94;
      id v244 = v100;
      v101 = v95;
      v245 = v101;
      v192 = (uint64_t (**)(void *, id *))_Block_copy(&aBlock);
    }
    else
    {
      v104 = [v205 quantityType];
      v105 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:v81];
      char v106 = [v104 isEqual:v105];

      if (v106)
      {
        char v107 = 1;
      }
      else
      {
        v108 = [v205 quantityType];
        v109 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A820]];
        char v107 = [v108 isEqual:v109];
      }
      id v110 = v196;
      id v111 = v195;
      v112 = v202;
      id v113 = v201;
      aBlock = (void *)MEMORY[0x1E4F143A8];
      uint64_t v237 = 3221225472;
      v238 = __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke;
      v239 = &unk_1E630AA20;
      v240 = v205;
      id v114 = v111;
      id v241 = v114;
      id v115 = v110;
      id v242 = v115;
      v245 = v10;
      LOBYTE(v246) = v107;
      v116 = v112;
      v243 = v116;
      uint64_t v99 = v226 & 1;
      BYTE1(v246) = v226 & 1;
      id v117 = v113;
      id v244 = v117;
      v192 = (uint64_t (**)(void *, id *))_Block_copy(&aBlock);
    }
    id v231 = 0;
    if (v99) {
      char v118 = [v201 performInitialStatisticsTransaction:v192 error:&v231];
    }
    else {
      char v118 = v192[2](v192, &v231);
    }
    char v119 = v118;
    v120 = (uint64_t (**)(void *, id *))v231;
    if (v119)
    {
      v184 = v120;
      id v217 = [(HDQuantityDistributionCalculator *)v202 quantityDistributionsWithUnit:v8];
      v185 = v3;
      if ((v223 & 2) != 0 && v196)
      {
        id v121 = v217;
        id v122 = v196;
        v123 = (void *)*((void *)v122 + 5);
        if (v123 && [v123 count])
        {
          v124 = [*((id *)v122 + 5) objectAtIndexedSubscript:0];
          uint64_t v125 = 0;
          uint64_t v126 = 0;
          if (v124) {
            uint64_t v126 = v124[1];
          }
          *((void *)v122 + 1) = v126;

          v127 = [*((id *)v122 + 5) objectAtIndexedSubscript:0];
          if (v127) {
            uint64_t v125 = v127[2];
          }
          *((void *)v122 + 2) = v125;

          *((void *)v122 + 3) = 0;
        }
        id v217 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v248 = 0u;
        long long v249 = 0u;
        long long v250 = 0u;
        long long v251 = 0u;
        id obj = v121;
        uint64_t v224 = [obj countByEnumeratingWithState:&v248 objects:&aBlock count:16];
        if (v224)
        {
          uint64_t v215 = *(void *)v249;
          do
          {
            uint64_t v128 = 0;
            do
            {
              if (*(void *)v249 != v215) {
                objc_enumerationMutation(obj);
              }
              v129 = *(void **)(*((void *)&v248 + 1) + 8 * v128);
              v130 = [v129 startDate];
              [v130 timeIntervalSinceReferenceDate];
              double v132 = v131;
              v133 = [v129 endDate];
              [v133 timeIntervalSinceReferenceDate];
              v135 = (void *)*((void *)v122 + 5);
              if (!v135) {
                goto LABEL_89;
              }
              if (!*((unsigned char *)v122 + 32)) {
                goto LABEL_89;
              }
              double v136 = v134;
              if (*((double *)v122 + 1) > v134) {
                goto LABEL_89;
              }
              unint64_t v137 = *((void *)v122 + 3);
              if (v137 >= [v135 count]) {
                goto LABEL_89;
              }
              while (*((double *)v122 + 2) < v132)
              {
                unint64_t v138 = *((void *)v122 + 3);
                if (v138 >= [*((id *)v122 + 5) count] - 1) {
                  break;
                }
                ++*((void *)v122 + 3);
                v139 = objc_msgSend(*((id *)v122 + 5), "objectAtIndexedSubscript:");
                uint64_t v140 = 0;
                uint64_t v141 = 0;
                if (v139) {
                  uint64_t v141 = v139[1];
                }
                *((void *)v122 + 1) = v141;

                v142 = [*((id *)v122 + 5) objectAtIndexedSubscript:*((void *)v122 + 3)];
                if (v142) {
                  uint64_t v140 = v142[2];
                }
                *((void *)v122 + 2) = v140;
              }
              if (*((double *)v122 + 1) < v136)
              {
                id v143 = 0;
                while (1)
                {
                  uint64_t v144 = [*((id *)v122 + 5) objectAtIndexedSubscript:*((void *)v122 + 3)];
                  v145 = (void *)v144;
                  if (v144) {
                    v146 = *(void **)(v144 + 24);
                  }
                  else {
                    v146 = 0;
                  }
                  id v147 = v146;

                  if (v147)
                  {
                    if (!v143) {
                      id v143 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    }
                    [v143 addObject:v147];
                  }
                  if (*((double *)v122 + 2) > v136) {
                    break;
                  }
                  unint64_t v148 = *((void *)v122 + 3) + 1;
                  *((void *)v122 + 3) = v148;
                  if (v148 >= [*((id *)v122 + 5) count]) {
                    break;
                  }
                  v149 = [*((id *)v122 + 5) objectAtIndexedSubscript:*((void *)v122 + 3)];
                  uint64_t v150 = 0;
                  uint64_t v151 = 0;
                  if (v149) {
                    uint64_t v151 = v149[1];
                  }
                  *((void *)v122 + 1) = v151;

                  v152 = [*((id *)v122 + 5) objectAtIndexedSubscript:*((void *)v122 + 3)];
                  if (v152) {
                    uint64_t v150 = v152[2];
                  }
                  *((void *)v122 + 2) = v150;

                  v78 = v214;
                  if (*((double *)v122 + 1) >= v136) {
                    goto LABEL_90;
                  }
                }

                v78 = v214;
              }
              else
              {
LABEL_89:
                id v143 = 0;
              }
LABEL_90:

              if (v143 && [v143 count])
              {
                id v212 = objc_alloc(MEMORY[0x1E4F2B948]);
                v209 = [v129 startDate];
                v153 = [v129 endDate];
                v154 = [v129 minimumBucketValue];
                [v129 minimumValue];
                v155 = id v227 = v143;
                v156 = [v129 maximumValue];
                v157 = [v129 averageValue];
                v158 = [v129 duration];
                v159 = [v129 histogramCounts];
                v160 = (void *)[v212 initWithStartDate:v209 endDate:v153 minimumBucketValue:v154 minimumValue:v155 maximumValue:v156 averageValue:v157 duration:v158 histogramCounts:v159 contextIdentifiers:v227];

                v8 = v206;
                id v143 = v227;

                v78 = v214;
                [v217 addObject:v160];
              }
              else
              {
                [v217 addObject:v129];
              }

              ++v128;
              uint64_t v99 = v220;
            }
            while (v128 != v224);
            uint64_t v161 = [obj countByEnumeratingWithState:&v248 objects:&aBlock count:16];
            uint64_t v224 = v161;
          }
          while (v161);
        }

        v3 = v185;
        v4 = v200;
      }
      id v221 = v217;
      if (v99)
      {
        id v164 = v199;
        id v188 = v8;
        p_isa = (id *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ([v221 count])
        {
          unint64_t v225 = 0;
          unint64_t v228 = 0;
          v186 = p_isa;
          id v187 = v164;
          do
          {
            if (v228 >= [v164 count]) {
              break;
            }
            v165 = [v221 objectAtIndexedSubscript:v225];
            v166 = [v164 objectAtIndexedSubscript:v228];
            v167 = [v165 startDate];
            uint64_t v216 = [v166 startDate];
            v218 = v167;
            if (objc_msgSend(v167, "isEqual:"))
            {
              v168 = [v166 averageQuantity];
              [v168 doubleValueForUnit:v188];
              double v170 = v169;

              v213 = [MEMORY[0x1E4F2B370] quantityWithUnit:v188 doubleValue:v170];
              id v210 = objc_alloc(MEMORY[0x1E4F2B948]);
              id obja = [v165 startDate];
              uint64_t v171 = [v165 endDate];
              v172 = [v165 minimumBucketValue];
              v173 = [v165 minimumValue];
              v174 = [v165 maximumValue];
              v175 = [v166 duration];
              v176 = [v165 histogramCounts];
              v177 = [v165 contextIdentifiers];
              v178 = (void *)v171;
              uint64_t v179 = [v210 initWithStartDate:obja endDate:v171 minimumBucketValue:v172 minimumValue:v173 maximumValue:v174 averageValue:v213 duration:v175 histogramCounts:v176 contextIdentifiers:v177];
              v211 = v166;
              v180 = (void *)v179;

              v78 = v214;
              id v164 = v187;

              p_isa = v186;
              v4 = v200;

              [v186 addObject:v180];
              ++v225;
              ++v228;

              v166 = v211;
              v181 = (void *)v216;
            }
            else
            {
              v182 = v167;
              v181 = (void *)v216;
              if (objc_msgSend(v182, "hk_isBeforeDate:", v216))
              {
                [p_isa addObject:v165];
                ++v225;
              }
              else
              {
                ++v228;
              }
            }
          }
          while (v225 < [v221 count]);
        }

        v77 = v204;
        v3 = v185;
        v8 = v206;
      }
      else
      {
        v77 = v204;
        p_isa = (id *)v221;
      }
      v163 = v184;
    }
    else
    {
      v162 = v120;
      if (v162)
      {
        v77 = v162;
        p_isa = 0;
        v163 = v77;

LABEL_117:
        v103 = v192;
LABEL_118:

        v76 = v194;
        v64 = v196;
        goto LABEL_119;
      }
      id v221 = 0;
      v163 = 0;
      p_isa = 0;
      v77 = v204;
    }

    goto LABEL_117;
  }
  v77 = v204;
LABEL_120:
  v15 = v77;

  if (!p_isa)
  {
    p_isa = [v205 queryUUID];
    objc_msgSend(v3, "client_deliverError:forQuery:", v15, p_isa);
    goto LABEL_122;
  }
LABEL_121:
  v183 = [v205 queryUUID];
  objc_msgSend(v3, "client_deliverDistributionCollection:forQuery:", p_isa, v183);

LABEL_122:
}

uint64_t __72__HDQuantityDistributionQueryServer__queue_fetchHistogramDataWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (id)_sqlitePredicateForObjectType:(uint64_t)a3 errorOut:
{
  id v5 = a2;
  v6 = HDSampleEntityPredicateForDataType(v5);
  v7 = [a1 filter];

  if (!v7)
  {
    id v15 = v6;
LABEL_8:
    id v16 = v15;
    goto LABEL_10;
  }
  v8 = [a1 filter];
  char v9 = objc_opt_respondsToSelector();

  id v10 = [a1 filter];
  if (v9)
  {
    v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
    v12 = objc_msgSend(v10, "builder_filterWithDataTypes:", v11);

    double v13 = [a1 profile];
    double v14 = [v12 predicateWithProfile:v13];
    id v10 = v12;
  }
  else
  {
    double v13 = [a1 profile];
    double v14 = [v10 predicateWithProfile:v13];
  }

  if (v14)
  {
    id v15 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v14 otherPredicate:v6];

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"Error building predicate for query");
  id v16 = 0;
LABEL_10:

  return v16;
}

uint64_t __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke(uint64_t a1, void *a2)
{
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 1;
  v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v33 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke_2;
  v24[3] = &unk_1E630A9F8;
  id v6 = *(id *)(a1 + 48);
  uint64_t v30 = *(void *)(a1 + 72);
  char v31 = *(unsigned char *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 32);
  id v25 = v6;
  uint64_t v26 = v7;
  v29 = v34;
  id v27 = *(id *)(a1 + 56);
  char v32 = *(unsigned char *)(a1 + 81);
  id v28 = *(id *)(a1 + 64);
  LOBYTE(v4) = -[HDQuantityDistributionQueryServer _walkSampleValuesWithPredicate:errorOut:handler:](v4, v5, (uint64_t)&v33, v24);
  id v8 = v33;
  char v9 = v8;
  if (v4)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      v11 = *(void **)(v10 + 208);
      id v23 = v8;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke_4;
      v18[3] = &unk_1E630A9D0;
      v18[4] = v10;
      id v19 = *(id *)(a1 + 56);
      char v22 = *(unsigned char *)(a1 + 81);
      id v20 = *(id *)(a1 + 64);
      uint64_t v21 = *(void *)(a1 + 72);
      uint64_t v12 = [v11 fetchFinalOverlapSamplesWithErrorOut:&v23 handler:v18];
      id v13 = v23;

      if ((v12 & 1) == 0)
      {
        id v14 = v13;
        id v15 = v14;
        if (v14)
        {
          if (a2) {
            *a2 = v14;
          }
          else {
            _HKLogDroppedError();
          }
        }
      }
    }
    else
    {
      uint64_t v12 = 1;
      id v13 = v8;
    }
  }
  else
  {
    id v16 = v8;
    id v13 = v16;
    if (v16)
    {
      if (a2) {
        *a2 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v12 = 0;
  }

  _Block_object_dispose(v34, 8);
  return v12;
}

uint64_t __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12
    && (-[_HDQuantityDateIntervals insideRanges:](v12, a5) & 1) == 0
    && !-[_HDQuantityDateIntervals insideRanges:](*(void *)(a1 + 32), a6))
  {
    return 1;
  }
  double v13 = *(double *)(a1 + 72);
  double v14 = v13 * a4;
  uint64_t v15 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 80))
  {
    id v16 = *(void **)(v15 + 208);
    uint64_t v17 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke_3;
    v30[3] = &unk_1E630A9D0;
    v30[4] = v15;
    id v31 = *(id *)(a1 + 48);
    char v34 = *(unsigned char *)(a1 + 81);
    id v32 = *(id *)(a1 + 56);
    uint64_t v33 = *(void *)(a1 + 72);
    double v24 = a5;
    double v25 = a6;
    double v26 = v14;
    char v27 = 1;
    memset(v28, 0, sizeof(v28));
    uint64_t v29 = a2;
    uint64_t v18 = [v16 fetchOverlapProcessSamplesFrom:&v24 setAnchorTime:v17 errorOut:a3 handler:v30];
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    if (*(unsigned char *)(v19 + 24)) {
      *(unsigned char *)(v19 + 24) = 0;
    }
  }
  else
  {
    int v20 = *(unsigned __int8 *)(a1 + 81);
    uint64_t v21 = *(void **)(a1 + 48);
    char v22 = *(void **)(a1 + 56);
    double v24 = a5;
    double v25 = a6;
    double v26 = v14;
    uint64_t v18 = 1;
    char v27 = 1;
    memset(v28, 0, sizeof(v28));
    uint64_t v29 = a2;
    -[HDQuantityDistributionQueryServer _addSampleIntoDistributionCalculatorAndAverageAndDurationCalculator:distributionCalculator:computeAverageAndDuration:calculatorForAverageAndDuration:dataFactor:](v15, &v24, v21, v20, v22, v13);
  }
  return v18;
}

uint64_t __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 >= 1)
  {
    uint64_t v12 = v3;
    uint64_t v13 = v4;
    uint64_t v6 = a2;
    do
    {
      long long v8 = *(_OWORD *)(a3 + 16);
      v10[0] = *(_OWORD *)a3;
      v10[1] = v8;
      uint64_t v11 = *(void *)(a3 + 32);
      -[HDQuantityDistributionQueryServer _addSampleIntoDistributionCalculatorAndAverageAndDurationCalculator:distributionCalculator:computeAverageAndDuration:calculatorForAverageAndDuration:dataFactor:](*(void *)(a1 + 32), (double *)v10, *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void **)(a1 + 48), *(double *)(a1 + 56));
      a3 += 40;
      --v6;
    }
    while (v6);
  }
  return 1;
}

- (void)_addSampleIntoDistributionCalculatorAndAverageAndDurationCalculator:(void *)a3 distributionCalculator:(int)a4 computeAverageAndDuration:(void *)a5 calculatorForAverageAndDuration:(double)a6 dataFactor:
{
  id v12 = a3;
  id v11 = a5;
  if (a1)
  {
    [v12 addDataPoint:a2[2] startTime:*a2 endTime:a2[1]];
    if (a4) {
      [v11 addSampleValue:*((void *)a2 + 4) startTime:0 endTime:a2[2] / a6 sourceID:*a2 error:a2[1]];
    }
  }
}

- (BOOL)_walkSampleValuesWithPredicate:(uint64_t)a3 errorOut:(void *)a4 handler:
{
  id v7 = a4;
  if (a1)
  {
    id v8 = a2;
    char v9 = [a1 profile];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__HDQuantityDistributionQueryServer__walkSampleValuesWithPredicate_errorOut_handler___block_invoke;
    v12[3] = &unk_1E630AAC0;
    id v13 = v7;
    BOOL v10 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:v8 profile:v9 options:4 error:a3 handler:v12];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __214__HDQuantityDistributionQueryServer__standardSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_resolveOverlappingSamples___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 >= 1)
  {
    uint64_t v12 = v3;
    uint64_t v13 = v4;
    uint64_t v6 = a2;
    do
    {
      long long v8 = *(_OWORD *)(a3 + 16);
      v10[0] = *(_OWORD *)a3;
      v10[1] = v8;
      uint64_t v11 = *(void *)(a3 + 32);
      -[HDQuantityDistributionQueryServer _addSampleIntoDistributionCalculatorAndAverageAndDurationCalculator:distributionCalculator:computeAverageAndDuration:calculatorForAverageAndDuration:dataFactor:](*(void *)(a1 + 32), (double *)v10, *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void **)(a1 + 48), *(double *)(a1 + 56));
      a3 += 40;
      --v6;
    }
    while (v6);
  }
  return 1;
}

uint64_t __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 1;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v41 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke_2;
  v32[3] = &unk_1E630AA70;
  id v6 = *(id *)(a1 + 48);
  uint64_t v39 = *(void *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 32);
  id v33 = v6;
  uint64_t v34 = v7;
  v38 = v42;
  id v35 = *(id *)(a1 + 56);
  char v40 = *(unsigned char *)(a1 + 88);
  id v36 = *(id *)(a1 + 64);
  id v37 = *(id *)(a1 + 72);
  LOBYTE(v4) = -[HDQuantityDistributionQueryServer _walkSampleValuesWithPredicate:errorOut:handler:](v4, v5, (uint64_t)&v41, v32);
  id v8 = v41;
  char v9 = v8;
  if (v4)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 208);
    id v31 = v8;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke_4;
    v26[3] = &unk_1E630AA48;
    v26[4] = v10;
    id v27 = *(id *)(a1 + 56);
    char v30 = *(unsigned char *)(a1 + 88);
    id v28 = *(id *)(a1 + 64);
    id v29 = *(id *)(a1 + 72);
    char v12 = [v11 fetchFinalOverlapSamplesWithErrorOut:&v31 handler:v26];
    id v13 = v31;

    if (v12)
    {
      double v14 = *(void **)(a1 + 72);
      id v25 = 0;
      uint64_t v15 = [v14 delegateLoadingWasSuccessful:&v25];
      id v16 = v25;
      uint64_t v17 = v16;
      if ((v15 & 1) == 0)
      {
        id v18 = v16;
        uint64_t v19 = v18;
        if (v18)
        {
          if (a2) {
            *a2 = v18;
          }
          else {
            _HKLogDroppedError();
          }
        }
      }
    }
    else
    {
      id v21 = v13;
      char v22 = v21;
      if (v21)
      {
        if (a2) {
          *a2 = v21;
        }
        else {
          _HKLogDroppedError();
        }
      }

      _HKInitializeLogging();
      id v23 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v45 = v22;
        _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "Unable to fetch hearing protection samples: %{public}@", buf, 0xCu);
      }
      uint64_t v15 = 0;
    }
  }
  else
  {
    id v20 = v8;
    id v13 = v20;
    if (v20)
    {
      if (a2) {
        *a2 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v15 = 0;
  }

  _Block_object_dispose(v42, 8);
  return v15;
}

uint64_t __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12
    && (-[_HDQuantityDateIntervals insideRanges:](v12, a5) & 1) == 0
    && !-[_HDQuantityDateIntervals insideRanges:](*(void *)(a1 + 32), a6))
  {
    return 1;
  }
  double v13 = *(double *)(a1 + 80) * a4;
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void **)(v14 + 208);
  uint64_t v16 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke_3;
  v24[3] = &unk_1E630AA48;
  void v24[4] = v14;
  id v25 = *(id *)(a1 + 48);
  char v28 = *(unsigned char *)(a1 + 88);
  id v26 = *(id *)(a1 + 56);
  id v27 = *(id *)(a1 + 64);
  *(double *)id v20 = a5;
  *(double *)&v20[1] = a6;
  *(double *)&v20[2] = v13;
  char v21 = 1;
  memset(v22, 0, sizeof(v22));
  uint64_t v23 = a2;
  uint64_t v17 = [v15 fetchOverlapProcessSamplesFrom:v20 setAnchorTime:v16 errorOut:a3 handler:v24];
  uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
  if (*(unsigned char *)(v18 + 24)) {
    *(unsigned char *)(v18 + 24) = 0;
  }

  return v17;
}

uint64_t __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

- (void)_addAttenuatedSamplesUsingAttenuateSamples:(uint64_t)a3 sampleCount:(void *)a4 distributionCalculator:(int)a5 computeAverageAndDuration:(void *)a6 calculatorForAverageAndDuration:(void *)a7 attenuationEngine:
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (a1 && a3 >= 1)
  {
    uint64_t v16 = 0;
    do
    {
      uint64_t v30 = 0;
      long long v28 = 0u;
      long long v29 = 0u;
      if (v15)
      {
        uint64_t v17 = (long long *)(a2 + 40 * v16);
        long long v18 = v17[1];
        long long v25 = *v17;
        long long v26 = v18;
        uint64_t v27 = *((void *)v17 + 4);
        [v15 attenuateSample:&v25];
        while (*((double *)&v28 + 1) - *(double *)&v28 > 0.000001)
        {
          long long v25 = v28;
          long long v26 = v29;
          uint64_t v27 = v30;
          -[HDQuantityDistributionQueryServer _addSampleIntoDistributionCalculatorAndAverageAndDurationCalculator:distributionCalculator:computeAverageAndDuration:calculatorForAverageAndDuration:dataFactor:](a1, (double *)&v25, v13, a5, v14, 1.0);
          long long v19 = *(long long *)((char *)v17 + 8);
          if (*(double *)&v19 - *((double *)&v28 + 1) <= 0.000001) {
            break;
          }
          uint64_t v20 = *((unsigned __int8 *)v17 + 24);
          uint64_t v21 = *((void *)&v28 + 1);
          long long v22 = v19;
          uint64_t v23 = v20;
          uint64_t v24 = 0;
          [v15 attenuateSample:&v21];
          long long v28 = v25;
          long long v29 = v26;
          uint64_t v30 = v27;
        }
      }
      ++v16;
    }
    while (v16 != a3);
  }
}

uint64_t __208__HDQuantityDistributionQueryServer__attenuatedSampleWalkBlockUsingDateIntervals_sqlitePredicate_dataFactor_distributionCalculator_computeAverageAndDuration_calculatorForAverageAndDuration_attenuationEngine___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

uint64_t __85__HDQuantityDistributionQueryServer__walkSampleValuesWithPredicate_errorOut_handler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  return (*(uint64_t (**)(double, double, double))(*(void *)(a1 + 32) + 16))(a4, a5, a6);
}

- (id)_walkSampleDatesWithPredicate:(uint64_t)a3 entityClass:(uint64_t)a4 errorOut:
{
  uint64_t v4 = -[HDQuantityDistributionQueryServer _walkSampleDatesWithPredicate:entityClass:includeUUID:errorOut:](a1, a2, a3, 0, a4);

  return v4;
}

- (id)_categoryPredicateWithTypeCode:(void *)a3 matchingValue:(uint64_t)a4 errorOut:
{
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F2ACB8] dataTypeWithCode:a2];
  char v9 = -[HDQuantityDistributionQueryServer _sqlitePredicateForObjectType:errorOut:](a1, v8, a4);

  if (v7)
  {
    uint64_t v10 = HDCategorySampleEntityPredicateForValue(1);
    uint64_t v11 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v9 otherPredicate:v10];

    char v9 = (void *)v11;
  }

  return v9;
}

- (id)_walkSampleDatesWithPredicate:(uint64_t)a3 entityClass:(char)a4 includeUUID:(uint64_t)a5 errorOut:
{
  id v9 = a2;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__174;
  uint64_t v24 = __Block_byref_object_dispose__174;
  long long v25 = objc_alloc_init(_HDQuantityDateIntervals);
  uint64_t v10 = [a1 profile];
  uint64_t v11 = [v10 database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__HDQuantityDistributionQueryServer__walkSampleDatesWithPredicate_entityClass_includeUUID_errorOut___block_invoke;
  v15[3] = &unk_1E630AB10;
  uint64_t v18 = a3;
  id v12 = v9;
  char v19 = a4;
  id v16 = v12;
  uint64_t v17 = &v20;
  LODWORD(a5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v11 error:a5 block:v15];

  if (a5) {
    id v13 = (id)v21[5];
  }
  else {
    id v13 = 0;
  }

  _Block_object_dispose(&v20, 8);

  return v13;
}

uint64_t __100__HDQuantityDistributionQueryServer__walkSampleDatesWithPredicate_entityClass_includeUUID_errorOut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F65D68];
  id v6 = a2;
  id v7 = objc_alloc_init(v5);
  [v7 setEntityClass:*(void *)(a1 + 48)];
  id v8 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"start_date" entityClass:objc_opt_class() ascending:1];
  v26[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v7 setOrderingTerms:v9];

  [v7 setPredicate:*(void *)(a1 + 32)];
  id v10 = objc_alloc(MEMORY[0x1E4F65D60]);
  uint64_t v11 = [v6 databaseForEntityClass:objc_opt_class()];

  id v12 = (void *)[v10 initWithDatabase:v11 descriptor:v7];
  id v13 = (void *)MEMORY[0x1E4F1CA48];
  v25[0] = @"start_date";
  v25[1] = @"end_date";
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  id v15 = [v13 arrayWithArray:v14];

  char v16 = *(unsigned char *)(a1 + 56);
  if (v16)
  {
    [v15 addObject:@"uuid"];
    char v16 = *(unsigned char *)(a1 + 56);
  }
  id v24 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __100__HDQuantityDistributionQueryServer__walkSampleDatesWithPredicate_entityClass_includeUUID_errorOut___block_invoke_2;
  v22[3] = &unk_1E630AAE8;
  char v23 = v16;
  v22[4] = *(void *)(a1 + 40);
  uint64_t v17 = [v12 enumerateProperties:v15 error:&v24 enumerationHandler:v22];
  id v18 = v24;
  char v19 = v18;
  if ((v17 & 1) == 0)
  {
    id v20 = v18;
    if (v20)
    {
      if (a3) {
        *a3 = v20;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v17;
}

uint64_t __100__HDQuantityDistributionQueryServer__walkSampleDatesWithPredicate_entityClass_includeUUID_errorOut___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5 = MEMORY[0x1C1879F40](a3, 0);
  double v6 = MEMORY[0x1C1879F40](a3, 1);
  if (*(unsigned char *)(a1 + 40))
  {
    id v7 = MEMORY[0x1C1879F90](a3, 2);
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v9 = v7;
  if (v8)
  {
    uint64_t v10 = *(void *)(v8 + 40);
    if (!v10)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v12 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v11;
    }
    id v13 = [_HDQuantityIntervalPair alloc];
    id v14 = v9;
    if (v13)
    {
      v17.receiver = v13;
      v17.super_class = (Class)_HDQuantityIntervalPair;
      id v15 = (_HDQuantityIntervalPair *)objc_msgSendSuper2(&v17, sel_init);
      id v13 = v15;
      if (v15)
      {
        v15->_startInterval = v5;
        v15->_endInterval = v6;
        objc_storeStrong((id *)&v15->_uuid, v7);
      }
    }

    [*(id *)(v8 + 40) addObject:v13];
    if (v10)
    {
      if (!v14) {
        goto LABEL_16;
      }
    }
    else
    {
      *(double *)(v8 + 8) = v5;
      *(double *)(v8 + 16) = v6;
      *(void *)(v8 + 24) = 0;
      if (!v14)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    if (!*(unsigned char *)(v8 + 32)) {
      *(unsigned char *)(v8 + 32) = 1;
    }
    goto LABEL_16;
  }
LABEL_17:

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlapProcessor, 0);

  objc_storeStrong((id *)&self->_quantityDistributionQueryServerConfiguration, 0);
}

@end