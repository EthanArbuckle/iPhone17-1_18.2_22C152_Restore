@interface LBFAggregator
- (BOOL)dumpFetchedEvents;
- (BOOL)fetchBucket:(int64_t)a3;
- (BOOL)fetchBuckets:(id)a3;
- (BOOL)fetchEvents;
- (BOOL)isInternal;
- (BOOL)setMLHostMarkerInStateID;
- (BOOL)setUpBuckets;
- (BOOL)strictDictChecks;
- (BOOL)upload;
- (BOOL)upload:(BOOL)a3 uploadRawEvents:(BOOL)a4 skipNullIdentifiers:(BOOL)a5;
- (LBFAggregator)init;
- (LBFTrialStatusDetector)trialStatusDetector;
- (NSMutableArray)buckets;
- (NSMutableDictionary)stateDict;
- (NSSet)usePrivateUpload;
- (NSString)lastAggregationDateKey;
- (double)getRandomCoinFlip;
- (id)dateToStringInUTCAndLocal:(id)a3;
- (id)dumpAggregate;
- (id)ensureDeploymentEventsHolderInBucket:(id)a3 bucketIndex:(unint64_t)a4;
- (id)ensureExperimentEventsHolderInBucket:(id)a3 bucketIndex:(unint64_t)a4;
- (id)fetchedEventsInDictionaries;
- (id)getAggregatedStatesUpdateTimestamp:(BOOL)a3 skipNullIdentifiers:(BOOL)a4;
- (id)getBucketEndDate;
- (id)getBucketsNotAggregated;
- (id)getTransitionProcessingEventArray:(id)a3 mlRuntimeInCurrentBucket:(BOOL)a4 mlRuntimeInPreviousBucket:(BOOL)a5;
- (id)getTrialIdentifierFromBMEvent:(id)a3;
- (id)initForMLHost;
- (void)dumpTimestamps;
- (void)enumerateAggregation:(id)a3;
- (void)setStrictDictChecks:(BOOL)a3;
@end

@implementation LBFAggregator

- (LBFAggregator)init
{
  v15.receiver = self;
  v15.super_class = (Class)LBFAggregator;
  v2 = [(LBFAggregator *)&v15 init];
  if (v2)
  {
    LBFLoggingUtilsInit();
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    stateDict = v2->_stateDict;
    v2->_stateDict = v3;

    v5 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    usePrivateUpload = v2->_usePrivateUpload;
    v2->_usePrivateUpload = v5;

    objc_msgSend_fetchEvents(v2, v7, v8, v9, v10);
    v11 = objc_alloc_init(LBFTrialStatusDetector);
    trialStatusDetector = v2->_trialStatusDetector;
    v2->_trialStatusDetector = v11;

    v2->_strictDictChecks = 0;
    lastAggregationDateKey = v2->_lastAggregationDateKey;
    v2->_lastAggregationDateKey = (NSString *)@"lastAggregationDate";

    v2->_setMLHostMarkerInStateID = 0;
  }
  return v2;
}

- (id)initForMLHost
{
  uint64_t v5 = objc_msgSend_init(self, a2, v2, v3, v4);
  v6 = (unsigned char *)v5;
  if (v5)
  {
    v7 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = @"lastAggregationDate_MLHost";

    v6[9] = 1;
  }
  return v6;
}

- (id)getBucketEndDate
{
  uint64_t v5 = objc_msgSend_now(MEMORY[0x263EFF910], a2, v2, v3, v4);
  objc_msgSend_timeIntervalSince1970(v5, v6, v7, v8, v9);
  objc_super v15 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x263EFF910], v11, v12, v13, v14, (double)(86400 * (uint64_t)(v10 / 86400.0)));

  return v15;
}

- (BOOL)setUpBuckets
{
  uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  buckets = self->_buckets;
  self->_buckets = v3;

  uint64_t v9 = objc_msgSend_getBucketEndDate(self, v5, v6, v7, v8);
  v17 = objc_msgSend_copy(v9, v10, v11, v12, v13);
  for (uint64_t i = 0; i != 30; ++i)
  {
    v19 = v17;
    v17 = objc_msgSend_dateWithTimeInterval_sinceDate_(MEMORY[0x263EFF910], v14, (uint64_t)v17, v15, v16, -86400.0);
    v20 = self->_buckets;
    v21 = [LBFBucket alloc];
    v23 = objc_msgSend_initWithInterval_endTimestamp_index_(v21, v22, (uint64_t)v17, (uint64_t)v19, i);
    objc_msgSend_addObject_(v20, v24, (uint64_t)v23, v25, v26);
  }
  return 1;
}

- (id)getBucketsNotAggregated
{
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v7 = objc_msgSend_initWithSuiteName_(v3, v4, @"LighthouseBitacoraFramework", v5, v6);
  uint64_t v11 = objc_msgSend_objectForKey_(v7, v8, (uint64_t)self->_lastAggregationDateKey, v9, v10);
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (objc_msgSend_count(self->_buckets, v13, v14, v15, v16))
  {
    unint64_t v21 = 0;
    do
    {
      v22 = objc_msgSend_objectAtIndex_(self->_buckets, v17, v21, v19, v20);
      v27 = objc_msgSend_startTime(v22, v23, v24, v25, v26);

      if ((unint64_t)(objc_msgSend_compare_(v11, v28, (uint64_t)v27, v29, v30) + 1) <= 1)
      {
        v34 = objc_msgSend_numberWithInt_(NSNumber, v31, v21, v32, v33);
        objc_msgSend_addObject_(v12, v35, (uint64_t)v34, v36, v37);
      }
      ++v21;
    }
    while (objc_msgSend_count(self->_buckets, v38, v39, v40, v41) > v21);
  }
  v42 = objc_msgSend_copy(v12, v17, v18, v19, v20);

  return v42;
}

- (BOOL)fetchBuckets:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v6)
  {
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v4);
        }
        int v14 = objc_msgSend_intValue(*(void **)(*((void *)&v19 + 1) + 8 * v13), v7, v8, v9, v10);
        objc_msgSend_fetchBucket_(self, v15, v14, v16, v17);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v11);
  }

  return 1;
}

- (id)ensureExperimentEventsHolderInBucket:(id)a3 bucketIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_objectAtIndex_(self->_buckets, v7, a4, v8, v9);
  uint64_t v15 = objc_msgSend_eventTree(v10, v11, v12, v13, v14);

  long long v19 = objc_msgSend_objectForKey_(v15, v16, (uint64_t)v6, v17, v18);
  if (v19)
  {
    id v23 = v19;
  }
  else
  {
    uint64_t v24 = objc_msgSend_objectForKey_(self->_stateDict, v20, (uint64_t)v6, v21, v22);
    if (!v24)
    {
      stateDict = self->_stateDict;
      id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      objc_msgSend_setObject_forKey_(stateDict, v27, (uint64_t)v26, (uint64_t)v6, v28);
    }
    uint64_t v29 = [LBFExperimentEventsHolder alloc];
    uint64_t v33 = objc_msgSend_initWithExperimentOrTaskId_(v29, v30, (uint64_t)v6, v31, v32);
    objc_msgSend_setValue_forKey_(v15, v34, (uint64_t)v33, (uint64_t)v6, v35);
    id v23 = v33;
  }
  return v23;
}

- (id)ensureDeploymentEventsHolderInBucket:(id)a3 bucketIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v11 = objc_msgSend_experimentIdentifiers(v6, v7, v8, v9, v10);

  if (!v11) {
    goto LABEL_5;
  }
  uint64_t v16 = objc_msgSend_experimentIdentifiers(v6, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_trialExperimentID(v16, v17, v18, v19, v20);
  if (!v21)
  {
    v43 = @"null_experiment";
    v52 = @"null_deployment";
    goto LABEL_7;
  }
  id v26 = (void *)v21;
  v27 = objc_msgSend_experimentIdentifiers(v6, v22, v23, v24, v25);
  uint64_t v32 = objc_msgSend_trialExperimentID(v27, v28, v29, v30, v31);
  uint64_t v37 = objc_msgSend_null(MEMORY[0x263EFF9D0], v33, v34, v35, v36);

  if (v32 == v37)
  {
LABEL_5:
    v43 = @"null_experiment";
    v52 = @"null_deployment";
    goto LABEL_8;
  }
  v38 = objc_msgSend_experimentIdentifiers(v6, v12, v13, v14, v15);
  objc_msgSend_trialExperimentID(v38, v39, v40, v41, v42);
  v43 = (__CFString *)objc_claimAutoreleasedReturnValue();

  uint64_t v16 = objc_msgSend_experimentIdentifiers(v6, v44, v45, v46, v47);
  objc_msgSend_trialDeploymentID(v16, v48, v49, v50, v51);
  v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:

LABEL_8:
  v53 = objc_msgSend_bmltIdentifiers(v6, v12, v13, v14, v15);

  if (!v53) {
    goto LABEL_13;
  }
  v58 = objc_msgSend_bmltIdentifiers(v6, v54, v55, v56, v57);
  uint64_t v63 = objc_msgSend_trialTaskID(v58, v59, v60, v61, v62);
  if (v63)
  {
    v68 = (void *)v63;
    v69 = objc_msgSend_bmltIdentifiers(v6, v64, v65, v66, v67);
    v74 = objc_msgSend_trialTaskID(v69, v70, v71, v72, v73);
    v79 = objc_msgSend_null(MEMORY[0x263EFF9D0], v75, v76, v77, v78);

    if (v74 == v79) {
      goto LABEL_13;
    }
    v82 = objc_msgSend_bmltIdentifiers(v6, v54, v80, v81, v57);
    uint64_t v87 = objc_msgSend_trialTaskID(v82, v83, v84, v85, v86);

    v58 = objc_msgSend_bmltIdentifiers(v6, v88, v89, v90, v91);
    uint64_t v96 = objc_msgSend_trialDeploymentID(v58, v92, v93, v94, v95);

    v52 = (__CFString *)v96;
    v43 = (__CFString *)v87;
  }

LABEL_13:
  v97 = objc_msgSend_ensureExperimentEventsHolderInBucket_bucketIndex_(self, v54, (uint64_t)v43, a4, v57);
  v101 = objc_msgSend_objectForKey_(self->_stateDict, v98, (uint64_t)v43, v99, v100);
  v105 = objc_msgSend_objectForKey_(v101, v102, (uint64_t)v52, v103, v104);

  if (!v105)
  {
    id v109 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_msgSend_setObject_forKey_(v101, v110, (uint64_t)v109, (uint64_t)v52, v111);

    objc_msgSend_setObject_forKey_(self->_stateDict, v112, (uint64_t)v101, (uint64_t)v43, v113);
  }
  v114 = objc_msgSend_ensureDeploymentEventsHolder_(v97, v106, (uint64_t)v52, v107, v108);

  return v114;
}

- (BOOL)fetchBucket:(int64_t)a3
{
  uint64_t v252 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_objectAtIndex_(self->_buckets, a2, a3, v3, v4);
  uint64_t v11 = objc_msgSend_objectAtIndex_(self->_buckets, v8, 0, v9, v10);
  uint64_t v16 = objc_msgSend_endTime(v11, v12, v13, v14, v15);

  uint64_t v21 = objc_msgSend_startTime(v7, v17, v18, v19, v20);
  v219 = v7;
  uint64_t v26 = objc_msgSend_endTime(v7, v22, v23, v24, v25);
  v218 = (void *)v16;
  uint64_t v30 = objc_msgSend_dateWithTimeInterval_sinceDate_(MEMORY[0x263EFF910], v27, v16, v28, v29, -2419200.0);
  id v31 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v35 = objc_msgSend_timeZoneWithAbbreviation_(MEMORY[0x263EFFA18], v32, @"UTC", v33, v34);
  objc_msgSend_setTimeZone_(v31, v36, (uint64_t)v35, v37, v38);

  v220 = v31;
  objc_msgSend_setDateFormat_(v31, v39, @"YYYY-MM-dd HH:mm:ss", v40, v41);
  uint64_t v42 = (void *)LBFLogContextAggregator;
  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
  {
    uint64_t v47 = v42;
    uint64_t v51 = objc_msgSend_stringFromDate_(v31, v48, v21, v49, v50);
    uint64_t v55 = objc_msgSend_stringFromDate_(v220, v52, v26, v53, v54);
    v59 = objc_msgSend_numberWithInteger_(NSNumber, v56, a3, v57, v58);
    uint64_t v63 = objc_msgSend_stringFromDate_(v220, v60, v30, v61, v62);
    *(_DWORD *)buf = 138413058;
    v245 = v51;
    __int16 v246 = 2112;
    v247 = v55;
    __int16 v248 = 2112;
    v249 = v59;
    __int16 v250 = 2112;
    v251 = v63;
    _os_log_impl(&dword_254547000, v47, OS_LOG_TYPE_INFO, "Finding objects between %@ and %@ for Bucket #%@. Trial Start: %@", buf, 0x2Au);
  }
  v64 = objc_msgSend_sharedInstance(LBFEventManager, v43, v44, v45, v46);
  v69 = objc_msgSend_ensureBiomeManagerMLRuntimed(v64, v65, v66, v67, v68);
  uint64_t v72 = objc_msgSend_readData_endDate_(v69, v70, v21, v26, v71);

  uint64_t v77 = objc_msgSend_sharedInstance(LBFEventManager, v73, v74, v75, v76);
  v82 = objc_msgSend_ensureBiomeManagerLighthouse(v77, v78, v79, v80, v81);
  v217 = (void *)v21;
  uint64_t v85 = objc_msgSend_readData_endDate_(v82, v83, v21, v26, v84);

  uint64_t v90 = objc_msgSend_sharedInstance(LBFEventManager, v86, v87, v88, v89);
  uint64_t v95 = objc_msgSend_ensureBiomeManagerTrial(v90, v91, v92, v93, v94);
  v213 = objc_msgSend_readData_endDate_(v95, v96, v30, v26, v97);

  v102 = objc_msgSend_sharedInstance(LBFEventManager, v98, v99, v100, v101);
  uint64_t v107 = objc_msgSend_ensureBiomeManagerDprivacyd(v102, v103, v104, v105, v106);
  v215 = (void *)v30;
  v216 = (void *)v26;
  v214 = objc_msgSend_readData_endDate_(v107, v108, v30, v26, v109);

  long long v238 = 0u;
  long long v239 = 0u;
  long long v236 = 0u;
  long long v237 = 0u;
  obuint64_t j = v72;
  uint64_t v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v110, (uint64_t)&v236, (uint64_t)v243, 16);
  if (v111)
  {
    uint64_t v112 = v111;
    uint64_t v113 = *(void *)v237;
    do
    {
      for (uint64_t i = 0; i != v112; ++i)
      {
        if (*(void *)v237 != v113) {
          objc_enumerationMutation(obj);
        }
        v115 = *(void **)(*((void *)&v236 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v120 = objc_msgSend_trialIdentifiers(v115, v116, v117, v118, v119, v213, v214);
          v123 = objc_msgSend_ensureDeploymentEventsHolderInBucket_bucketIndex_(self, v121, (uint64_t)v120, a3, v122);

          objc_msgSend_appendMlruntimedEvent_(v123, v124, (uint64_t)v115, v125, v126);
        }
      }
      uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v116, (uint64_t)&v236, (uint64_t)v243, 16);
    }
    while (v112);
  }

  long long v234 = 0u;
  long long v235 = 0u;
  long long v232 = 0u;
  long long v233 = 0u;
  id v222 = v85;
  uint64_t v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(v222, v127, (uint64_t)&v232, (uint64_t)v242, 16);
  if (v128)
  {
    uint64_t v129 = v128;
    uint64_t v130 = *(void *)v233;
    do
    {
      for (uint64_t j = 0; j != v129; ++j)
      {
        if (*(void *)v233 != v130) {
          objc_enumerationMutation(v222);
        }
        v132 = *(void **)(*((void *)&v232 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v137 = objc_msgSend_trialIdentifiers(v132, v133, v134, v135, v136);
          v140 = objc_msgSend_ensureDeploymentEventsHolderInBucket_bucketIndex_(self, v138, (uint64_t)v137, a3, v139);

          v141 = (void *)LBFLogContextAggregator;
          if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
          {
            v145 = v141;
            v150 = objc_msgSend_description(v132, v146, v147, v148, v149);
            *(_DWORD *)buf = 138412290;
            v245 = v150;
            _os_log_impl(&dword_254547000, v145, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
          }
          objc_msgSend_appendLighthousePluginEvent_(v140, v142, (uint64_t)v132, v143, v144, v213);
          if (objc_msgSend_usePrivateUpload(v132, v151, v152, v153, v154))
          {
            v159 = objc_msgSend_trialIdentifiers(v132, v155, v156, v157, v158);
            v164 = objc_msgSend_experimentIdentifiers(v159, v160, v161, v162, v163);
            v169 = objc_msgSend_trialExperimentID(v164, v165, v166, v167, v168);

            v170 = LBFLogContextAggregator;
            if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v245 = v169;
              _os_log_impl(&dword_254547000, v170, OS_LOG_TYPE_INFO, "Adding %@ to usePrivateUpload.", buf, 0xCu);
            }
            objc_msgSend_setByAddingObject_(self->_usePrivateUpload, v171, (uint64_t)v169, v172, v173);
            v174 = (NSSet *)objc_claimAutoreleasedReturnValue();
            usePrivateUpload = self->_usePrivateUpload;
            self->_usePrivateUpload = v174;
          }
        }
      }
      uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v222, v133, (uint64_t)&v232, (uint64_t)v242, 16);
    }
    while (v129);
  }

  long long v230 = 0u;
  long long v231 = 0u;
  long long v228 = 0u;
  long long v229 = 0u;
  id v176 = v213;
  uint64_t v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v176, v177, (uint64_t)&v228, (uint64_t)v241, 16);
  if (v178)
  {
    uint64_t v179 = v178;
    uint64_t v180 = *(void *)v229;
    do
    {
      for (uint64_t k = 0; k != v179; ++k)
      {
        if (*(void *)v229 != v180) {
          objc_enumerationMutation(v176);
        }
        v182 = *(void **)(*((void *)&v228 + 1) + 8 * k);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v187 = objc_msgSend_trialIdentifiers(v182, v183, v184, v185, v186);
          v190 = objc_msgSend_ensureDeploymentEventsHolderInBucket_bucketIndex_(self, v188, (uint64_t)v187, a3, v189);

          objc_msgSend_appendTrialEvent_(v190, v191, (uint64_t)v182, v192, v193);
        }
      }
      uint64_t v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(v176, v183, (uint64_t)&v228, (uint64_t)v241, 16);
    }
    while (v179);
  }
  v221 = v176;

  long long v226 = 0u;
  long long v227 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  id v194 = v214;
  uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v195, (uint64_t)&v224, (uint64_t)v240, 16);
  if (v196)
  {
    uint64_t v197 = v196;
    uint64_t v198 = *(void *)v225;
    do
    {
      for (uint64_t m = 0; m != v197; ++m)
      {
        if (*(void *)v225 != v198) {
          objc_enumerationMutation(v194);
        }
        v200 = *(void **)(*((void *)&v224 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v205 = objc_msgSend_trialIdentifiers(v200, v201, v202, v203, v204);
          v208 = objc_msgSend_ensureDeploymentEventsHolderInBucket_bucketIndex_(self, v206, (uint64_t)v205, a3, v207);

          objc_msgSend_appendDprivacydEvent_(v208, v209, (uint64_t)v200, v210, v211);
        }
      }
      uint64_t v197 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v201, (uint64_t)&v224, (uint64_t)v240, 16);
    }
    while (v197);
  }

  return 1;
}

- (BOOL)fetchEvents
{
  objc_msgSend_setUpBuckets(self, a2, v2, v3, v4);
  if (objc_msgSend_count(self->_buckets, v6, v7, v8, v9))
  {
    unint64_t v13 = 0;
    do
      objc_msgSend_fetchBucket_(self, v10, v13++, v11, v12);
    while (objc_msgSend_count(self->_buckets, v14, v15, v16, v17) > v13);
  }
  return 1;
}

- (id)getTrialIdentifierFromBMEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = objc_msgSend_trialIdentifiers(v3, v4, v5, v6, v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)getTransitionProcessingEventArray:(id)a3 mlRuntimeInCurrentBucket:(BOOL)a4 mlRuntimeInPreviousBucket:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v150 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  v131 = v7;
  if (v6 && v5)
  {
    uint64_t v9 = LBFLogContextAggregator;
    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_254547000, v9, OS_LOG_TYPE_INFO, "MLRuntime in current, and previous bucket.", buf, 2u);
    }
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    id v10 = v7;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v141, (uint64_t)v149, 16);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v142;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v142 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void **)(*((void *)&v141 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = v16;
            if (objc_msgSend_eventType(v20, v21, v22, v23, v24) == 3) {
              objc_msgSend_addObject_(v8, v25, (uint64_t)v20, v26, v27);
            }
          }
          else
          {
            objc_msgSend_addObject_(v8, v17, (uint64_t)v16, v18, v19);
          }
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v28, (uint64_t)&v141, (uint64_t)v149, 16);
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v29 = LBFLogContextAggregator;
    BOOL v30 = os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO);
    if (!v6 || v5)
    {
      if (v30)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_254547000, v29, OS_LOG_TYPE_INFO, "No MLRuntime events in current or previous buckets.", buf, 2u);
      }
      long long v135 = 0u;
      long long v136 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      obuint64_t j = v7;
      uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v133, (uint64_t)v147, 16);
      if (v71)
      {
        uint64_t v72 = v71;
        char v73 = 0;
        char v74 = 0;
        uint64_t v75 = *(void *)v134;
        do
        {
          for (uint64_t j = 0; j != v72; ++j)
          {
            if (*(void *)v134 != v75) {
              objc_enumerationMutation(obj);
            }
            uint64_t v77 = *(void **)(*((void *)&v133 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v78 = v77;
              if (!((objc_msgSend_eventType(v78, v79, v80, v81, v82) != 1) | v73 & 1))
              {
                uint64_t v87 = LBFLogContextEventFiltering;
                if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_254547000, v87, OS_LOG_TYPE_INFO, "Saw first Allocation before MlRuntime, filtering future Allocated events.", buf, 2u);
                }
                objc_msgSend_addObject_(v8, v88, (uint64_t)v78, v89, v90, v131);
                char v73 = 1;
              }
              if (!((objc_msgSend_eventType(v78, v83, v84, v85, v86, v131) != 2) | v74 & 1))
              {
                uint64_t v95 = LBFLogContextEventFiltering;
                if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_254547000, v95, OS_LOG_TYPE_INFO, "Saw first Activation before MlRuntime, filtering future Activation events.", buf, 2u);
                }
                objc_msgSend_addObject_(v8, v96, (uint64_t)v78, v97, v98);
                char v74 = 1;
              }
              if (objc_msgSend_eventType(v78, v91, v92, v93, v94) == 3) {
                objc_msgSend_addObject_(v8, v99, (uint64_t)v78, v100, v101);
              }
            }
            else
            {
              uint64_t v103 = LBFLogContextEventFiltering;
              if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_254547000, v103, OS_LOG_TYPE_INFO, "Incorrect detection - updating filtering.", buf, 2u);
              }
              uint64_t v104 = (void *)LBFLogContextEventFiltering;
              if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
              {
                uint64_t v105 = v104;
                uint64_t v106 = objc_opt_class();
                *(_DWORD *)buf = 138412290;
                v146 = v106;
                id v107 = v106;
                _os_log_impl(&dword_254547000, v105, OS_LOG_TYPE_INFO, "Event Type: %@", buf, 0xCu);
              }
              uint64_t v108 = (void *)LBFLogContextEventFiltering;
              if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
              {
                uint64_t v109 = v108;
                v114 = objc_msgSend_trialIdentifiers(v77, v110, v111, v112, v113);
                *(_DWORD *)buf = 138412290;
                v146 = v114;
                _os_log_impl(&dword_254547000, v109, OS_LOG_TYPE_INFO, "Event Identifiers: %@", buf, 0xCu);
              }
              v115 = (void *)LBFLogContextEventFiltering;
              if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
              {
                uint64_t v119 = v115;
                v124 = objc_msgSend_timestamp(v77, v120, v121, v122, v123);
                *(_DWORD *)buf = 138412290;
                v146 = v124;
                _os_log_impl(&dword_254547000, v119, OS_LOG_TYPE_INFO, "Event Timestamp: %@", buf, 0xCu);
              }
              objc_msgSend_addObject_(v8, v116, (uint64_t)v77, v117, v118, v131);
              char v73 = 1;
              char v74 = 1;
            }
          }
          uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v102, (uint64_t)&v133, (uint64_t)v147, 16);
        }
        while (v72);
      }
    }
    else
    {
      if (v30)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_254547000, v29, OS_LOG_TYPE_INFO, "MLRuntime in current bucket only.", buf, 2u);
      }
      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      id v31 = v7;
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v137, (uint64_t)v148, 16);
      if (v33)
      {
        uint64_t v34 = v33;
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
        uint64_t v38 = *(void *)v138;
        do
        {
          for (uint64_t k = 0; k != v34; ++k)
          {
            if (*(void *)v138 != v38) {
              objc_enumerationMutation(v31);
            }
            uint64_t v40 = *(void **)(*((void *)&v137 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v44 = v40;
              if (!((objc_msgSend_eventType(v44, v45, v46, v47, v48) != 1) | (v37 | v35) & 1))
              {
                uint64_t v53 = LBFLogContextEventFiltering;
                if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_254547000, v53, OS_LOG_TYPE_INFO, "Saw first Allocation before MlRuntime, filtering future Allocated events.", buf, 2u);
                }
                objc_msgSend_addObject_(v8, v54, (uint64_t)v44, v55, v56, v131);
                int v37 = 1;
              }
              if (!((objc_msgSend_eventType(v44, v49, v50, v51, v52, v131) != 2) | (v36 | v35) & 1))
              {
                uint64_t v61 = LBFLogContextEventFiltering;
                if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_254547000, v61, OS_LOG_TYPE_INFO, "Saw first Activation before MlRuntime, filtering future Activation events.", buf, 2u);
                }
                objc_msgSend_addObject_(v8, v62, (uint64_t)v44, v63, v64);
                int v36 = 1;
              }
              if (objc_msgSend_eventType(v44, v57, v58, v59, v60) == 3) {
                objc_msgSend_addObject_(v8, v65, (uint64_t)v44, v66, v67);
              }
            }
            else
            {
              objc_msgSend_addObject_(v8, v41, (uint64_t)v40, v42, v43);
              if (v35)
              {
                int v35 = 1;
              }
              else
              {
                v69 = LBFLogContextEventFiltering;
                int v35 = 1;
                if (os_log_type_enabled((os_log_t)LBFLogContextEventFiltering, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_254547000, v69, OS_LOG_TYPE_INFO, "Saw first MLRuntime, filtering future Trial events.", buf, 2u);
                }
              }
            }
          }
          uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v68, (uint64_t)&v137, (uint64_t)v148, 16);
        }
        while (v34);
      }
    }
  }

  uint64_t v129 = objc_msgSend_copy(v8, v125, v126, v127, v128);
  return v129;
}

- (id)getAggregatedStatesUpdateTimestamp:(BOOL)a3 skipNullIdentifiers:(BOOL)a4
{
  BOOL v382 = a4;
  BOOL v367 = a3;
  uint64_t v458 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v440 = 0u;
  long long v441 = 0u;
  long long v442 = 0u;
  long long v443 = 0u;
  obuint64_t j = self->_stateDict;
  uint64_t v399 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v440, (uint64_t)v457, 16);
  v401 = v5;
  v386 = self;
  if (v399)
  {
    uint64_t v397 = *(void *)v441;
    do
    {
      for (uint64_t i = 0; i != v399; ++i)
      {
        if (*(void *)v441 != v397) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v440 + 1) + 8 * i);
        id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v402 = v8;
        uint64_t v13 = objc_msgSend_objectForKey_(self->_stateDict, v10, v8, v11, v12);
        uint64_t v18 = objc_msgSend_allKeys(v13, v14, v15, v16, v17);
        long long v436 = 0u;
        long long v437 = 0u;
        long long v438 = 0u;
        long long v439 = 0u;
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v436, (uint64_t)v456, 16);
        if (v20)
        {
          uint64_t v23 = v20;
          uint64_t v24 = *(void *)v437;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v437 != v24) {
                objc_enumerationMutation(v18);
              }
              uint64_t v26 = *(void *)(*((void *)&v436 + 1) + 8 * j);
              objc_msgSend_setObject_forKey_(v9, v21, (uint64_t)&unk_2703E3DD0, v26, v22);
              BOOL v30 = objc_msgSend_numberWithInt_(NSNumber, v27, 0, v28, v29);
              objc_msgSend_setObject_forKey_(v13, v31, (uint64_t)v30, v26, v32);
            }
            uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v436, (uint64_t)v456, 16);
          }
          while (v23);
        }
        id v5 = v401;
        objc_msgSend_setObject_forKey_(v401, v21, (uint64_t)v9, v402, v22);

        self = v386;
      }
      uint64_t v399 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v440, (uint64_t)v457, 16);
    }
    while (v399);
  }

  v371 = objc_msgSend_getBucketsNotAggregated(self, v34, v35, v36, v37);
  uint64_t v38 = (void *)LBFLogContextAggregator;
  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
  {
    uint64_t v39 = v38;
    id v44 = objc_msgSend_description(v371, v40, v41, v42, v43);
    *(_DWORD *)buf = 138412290;
    uint64_t v450 = (uint64_t)v44;
    _os_log_impl(&dword_254547000, v39, OS_LOG_TYPE_INFO, "To aggregate: %@", buf, 0xCu);
  }
  id v368 = objc_alloc_init(MEMORY[0x263EFF980]);
  v380 = objc_alloc_init(LBFStateDetector);
  long long v432 = 0u;
  long long v433 = 0u;
  long long v434 = 0u;
  long long v435 = 0u;
  uint64_t v49 = objc_msgSend_reverseObjectEnumerator(self->_buckets, v45, v46, v47, v48);
  uint64_t v54 = objc_msgSend_allObjects(v49, v50, v51, v52, v53);

  id v369 = v54;
  BOOL v56 = v382;
  uint64_t v372 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v432, (uint64_t)v455, 16);
  if (v372)
  {
    uint64_t v370 = *(void *)v433;
    do
    {
      uint64_t v61 = 0;
      do
      {
        if (*(void *)v433 != v370) {
          objc_enumerationMutation(v369);
        }
        uint64_t v373 = v61;
        uint64_t v62 = *(void **)(*((void *)&v432 + 1) + 8 * v61);
        uint64_t v63 = objc_msgSend_flattenEvents(v62, v57, v58, v59, v60);
        id v374 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        long long v428 = 0u;
        long long v429 = 0u;
        long long v430 = 0u;
        long long v431 = 0u;
        id v377 = v63;
        uint64_t v376 = objc_msgSend_countByEnumeratingWithState_objects_count_(v377, v64, (uint64_t)&v428, (uint64_t)v454, 16);
        if (v376)
        {
          uint64_t v375 = *(void *)v429;
          do
          {
            uint64_t v68 = 0;
            do
            {
              if (*(void *)v429 != v375) {
                objc_enumerationMutation(v377);
              }
              uint64_t v378 = v68;
              v69 = *(void **)(*((void *)&v428 + 1) + 8 * v68);
              if (!objc_msgSend_isEqualToString_(v69, v65, @"null_experiment", v66, v67)) {
                goto LABEL_33;
              }
              v70 = LBFLogContextAggregator;
              BOOL v71 = os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO);
              if (!v56)
              {
                if (v71)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_254547000, v70, OS_LOG_TYPE_INFO, "Including null exp in aggregation.", buf, 2u);
                }
LABEL_33:
                uint64_t v72 = objc_msgSend_objectForKey_(v377, v65, (uint64_t)v69, v66, v67);
                id v379 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                v388 = objc_msgSend_objectForKey_(self->_stateDict, v73, (uint64_t)v69, v74, v75);
                uint64_t v79 = objc_msgSend_objectForKey_(self->_stateDict, v76, (uint64_t)v69, v77, v78);

                if (!v79)
                {
                  uint64_t v80 = LBFLogContextAggregator;
                  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v450 = (uint64_t)v69;
                    _os_log_impl(&dword_254547000, v80, OS_LOG_TYPE_INFO, "%@ not in state dict.", buf, 0xCu);
                  }
                }
                long long v426 = 0u;
                long long v427 = 0u;
                long long v424 = 0u;
                long long v425 = 0u;
                id obja = v72;
                uint64_t v391 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v81, (uint64_t)&v424, (uint64_t)v453, 16);
                if (!v391)
                {
LABEL_142:

                  objc_msgSend_setObject_forKey_(self->_stateDict, v316, (uint64_t)v388, (uint64_t)v69, v317);
                  v322 = objc_msgSend_copy(v379, v318, v319, v320, v321);
                  objc_msgSend_setObject_forKey_(v374, v323, (uint64_t)v322, (uint64_t)v69, v324);

                  goto LABEL_143;
                }
                uint64_t v390 = *(void *)v425;
                uint64_t v394 = (uint64_t)v69;
                while (2)
                {
                  uint64_t v85 = 0;
LABEL_39:
                  if (*(void *)v425 != v390) {
                    objc_enumerationMutation(obja);
                  }
                  uint64_t v86 = *(void *)(*((void *)&v424 + 1) + 8 * v85);
                  if (v56
                    && objc_msgSend_isEqualToString_(v69, v82, @"null_deployment", v83, v84))
                  {
                    uint64_t v87 = LBFLogContextAggregator;
                    id v5 = v401;
                    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_254547000, v87, OS_LOG_TYPE_INFO, "Skipping aggregation for null deployment.", buf, 2u);
                    }
LABEL_140:
                    if (++v85 == v391)
                    {
                      uint64_t v391 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v82, (uint64_t)&v424, (uint64_t)v453, 16);
                      if (!v391) {
                        goto LABEL_142;
                      }
                      continue;
                    }
                    goto LABEL_39;
                  }
                  break;
                }
                uint64_t v400 = v85;
                uint64_t v88 = objc_msgSend_objectForKey_(v388, v82, v86, v83, v84);

                if (!v88)
                {
                  uint64_t v92 = LBFLogContextAggregator;
                  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v450 = v86;
                    __int16 v451 = 2112;
                    v452 = v69;
                    _os_log_impl(&dword_254547000, v92, OS_LOG_TYPE_INFO, "%@ not in Experiment '%@' State Dict.", buf, 0x16u);
                  }
                }
                uint64_t v93 = objc_msgSend_objectForKey_(self->_stateDict, v89, (uint64_t)v69, v90, v91);
                uint64_t v97 = objc_msgSend_objectForKey_(v93, v94, v86, v95, v96);
                int v392 = objc_msgSend_intValue(v97, v98, v99, v100, v101);

                uint64_t v105 = objc_msgSend_objectForKey_(obja, v102, v86, v103, v104);
                if (!objc_msgSend_count(v105, v106, v107, v108, v109))
                {
                  uint64_t v85 = v400;
                  id v5 = v401;
                  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_ERROR)) {
                    sub_254584F60(&v404, v405);
                  }
                  goto LABEL_139;
                }
                uint64_t v113 = v86;
                v398 = v105;
                v114 = objc_msgSend_objectAtIndex_(v105, v110, 0, v111, v112);
                uint64_t v118 = objc_msgSend_getTrialIdentifierFromBMEvent_(self, v115, (uint64_t)v114, v116, v117);

                uint64_t v122 = v401;
                if (!v118 && os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_ERROR)) {
                  sub_254584FE4(&v422, v423);
                }
                v403 = (void *)v118;
                uint64_t v123 = objc_msgSend_objectForKey_(v401, v119, (uint64_t)v69, v120, v121);

                if (v123)
                {
                  uint64_t v127 = objc_msgSend_objectForKey_(v401, v124, (uint64_t)v69, v125, v126);
                  v131 = objc_msgSend_objectForKey_(v127, v128, v113, v129, v130);

                  if (!v131)
                  {
                    uint64_t v135 = LBFLogContextAggregator;
                    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v450 = v113;
                      __int16 v451 = 2112;
                      v452 = v69;
                      long long v136 = v135;
                      long long v137 = "%@ not in MLRuntime Status '%@' Dict.";
                      uint32_t v138 = 22;
                      goto LABEL_60;
                    }
                  }
                }
                else
                {
                  uint64_t v139 = LBFLogContextAggregator;
                  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v450 = (uint64_t)v69;
                    long long v136 = v139;
                    long long v137 = "%@ not in MLRuntime status dict.";
                    uint32_t v138 = 12;
LABEL_60:
                    _os_log_impl(&dword_254547000, v136, OS_LOG_TYPE_INFO, v137, buf, v138);
                  }
                }
                long long v140 = objc_msgSend_objectForKey_(v401, v132, (uint64_t)v69, v133, v134);
                long long v144 = objc_msgSend_objectForKey_(v140, v141, v113, v142, v143);
                int isEqual = objc_msgSend_isEqual_(v144, v145, (uint64_t)&unk_2703E3DD0, v146, v147);

                if (isEqual)
                {
                  long long v420 = 0u;
                  long long v421 = 0u;
                  long long v418 = 0u;
                  long long v419 = 0u;
                  id v152 = v398;
                  uint64_t v154 = objc_msgSend_countByEnumeratingWithState_objects_count_(v152, v153, (uint64_t)&v418, (uint64_t)v448, 16);
                  if (v154)
                  {
                    uint64_t v155 = v154;
                    uint64_t v156 = v113;
                    char v157 = 0;
                    uint64_t v158 = *(void *)v419;
                    do
                    {
                      for (uint64_t k = 0; k != v155; ++k)
                      {
                        if (*(void *)v419 != v158) {
                          objc_enumerationMutation(v152);
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            continue;
                          }
                        }
                        char v157 = 1;
                      }
                      uint64_t v155 = objc_msgSend_countByEnumeratingWithState_objects_count_(v152, v160, (uint64_t)&v418, (uint64_t)v448, 16);
                    }
                    while (v155);

                    self = v386;
                    BOOL v56 = v382;
                    v69 = (void *)v394;
                    uint64_t v113 = v156;
                    uint64_t v122 = v401;
                    if (v157)
                    {
                      objc_msgSend_objectForKey_(v401, v149, v394, v150, v151);
                      id v152 = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_setObject_forKey_(v152, v161, (uint64_t)&unk_2703E3DE8, v113, v162);
                      objc_msgSend_setObject_forKey_(v401, v163, (uint64_t)v152, v394, v164);
                      goto LABEL_75;
                    }
                  }
                  else
                  {
                    v69 = (void *)v394;
LABEL_75:
                  }
                }
                v165 = v122;
                BOOL v166 = v56;
                uint64_t v167 = isEqual ^ 1u;
                uint64_t v168 = objc_msgSend_objectForKey_(v165, v149, (uint64_t)v69, v150, v151);
                uint64_t v172 = objc_msgSend_objectForKey_(v168, v169, v113, v170, v171);
                uint64_t v176 = objc_msgSend_isEqual_(v172, v173, (uint64_t)&unk_2703E3DE8, v174, v175);

                uint64_t v105 = v398;
                int v384 = v176;
                uint64_t v178 = objc_msgSend_getTransitionProcessingEventArray_mlRuntimeInCurrentBucket_mlRuntimeInPreviousBucket_(self, v177, (uint64_t)v398, v176, v167);
                v389 = (void *)v178;
                if (!v403)
                {
                  v69 = (void *)v394;
                  BOOL v56 = v166;
                  self = v386;
                  uint64_t v85 = v400;
                  id v5 = v401;
                  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_ERROR)) {
                    sub_254584F8C(&v406, v407);
                  }
                  goto LABEL_138;
                }
                v182 = (void *)v178;
                uint64_t v387 = v113;
                objc_msgSend_IsEmptyTrialIdentifiers_(LBFUtils, v179, (uint64_t)v403, v180, v181);
                int v381 = v392;
                if (objc_msgSend_count(v182, v183, v184, v185, v186))
                {
                  v191 = objc_msgSend_startTime(v62, v187, v188, v189, v190);
                  uint64_t v193 = objc_msgSend_processEventsStartingFromState_bucketStartTime_events_(v380, v192, v392, (uint64_t)v191, (uint64_t)v182);

                  uint64_t v197 = objc_msgSend_objectAtIndex_(v193, v194, 0, v195, v196);
                  uint64_t v202 = (int)objc_msgSend_intValue(v197, v198, v199, v200, v201);

                  v393 = objc_msgSend_objectAtIndex_(v193, v203, 1, v204, v205);
                  v206 = v386;
                }
                else
                {
                  uint64_t v207 = [LBFBitacoraStateTransition alloc];
                  uint64_t v193 = objc_msgSend_startTime(v62, v208, v209, v210, v211);
                  v206 = v386;
                  if (v176)
                  {
                    v213 = objc_msgSend_initWithBitcoraState_previousState_timestamp_timedelta_(v207, v212, 19, v392, (uint64_t)v193, 0.0);
                    v447 = v213;
                    v393 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v214, (uint64_t)&v447, 1, v215);

                    uint64_t v202 = 19;
                  }
                  else
                  {
                    v216 = objc_msgSend_initWithBitcoraState_previousState_timestamp_timedelta_(v207, v212, 18, v392, (uint64_t)v193, 0.0);
                    v446 = v216;
                    v393 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v217, (uint64_t)&v446, 1, v218);

                    uint64_t v202 = 18;
                  }
                }

                uint64_t v221 = objc_msgSend_getTrialStatus_deploymentId_(v206->_trialStatusDetector, v219, v394, v387, v220);
                BOOL setMLHostMarkerInStateID = v206->_setMLHostMarkerInStateID;
                v223 = [LBFBitacoraStateInfo alloc];
                long long v228 = objc_msgSend_startTime(v62, v224, v225, v226, v227);
                long long v234 = objc_msgSend_endTime(v62, v229, v230, v231, v232);
                v383 = (void *)v221;
                if (setMLHostMarkerInStateID)
                {
                  uint64_t v105 = v398;
                  uint64_t started = objc_msgSend_initWithBitcoraStateMLHost_bucketStartTime_bucketEndTime_observedTrialStatus_bitacoraStateTransitions_bitacoraEvents_(v223, v233, (uint64_t)v403, (uint64_t)v228, (uint64_t)v234, v221, v393, v398);
                }
                else
                {
                  uint64_t v105 = v398;
                  uint64_t started = objc_msgSend_initWithBitcoraState_bucketStartTime_bucketEndTime_observedTrialStatus_bitacoraStateTransitions_bitacoraEvents_(v223, v233, (uint64_t)v403, (uint64_t)v228, (uint64_t)v234, v221, v393, v398);
                }
                long long v236 = (void *)started;

                uint64_t v85 = v400;
                long long v239 = v206;
                v385 = v236;
                if (v236)
                {
                  v69 = (void *)v394;
                  if (v202 == 2)
                  {
                    long long v410 = 0u;
                    long long v411 = 0u;
                    long long v408 = 0u;
                    long long v409 = 0u;
                    id v275 = v105;
                    uint64_t v277 = objc_msgSend_countByEnumeratingWithState_objects_count_(v275, v276, (uint64_t)&v408, (uint64_t)v444, 16);
                    if (v277)
                    {
                      uint64_t v282 = v277;
                      uint64_t v283 = *(void *)v409;
                      char v284 = 1;
                      do
                      {
                        for (uint64_t m = 0; m != v282; ++m)
                        {
                          if (*(void *)v409 != v283) {
                            objc_enumerationMutation(v275);
                          }
                          v286 = objc_msgSend_timestamp(*(void **)(*((void *)&v408 + 1) + 8 * m), v278, v279, v280, v281);
                          objc_msgSend_timeIntervalSince1970(v286, v287, v288, v289, v290);
                          double v292 = v291;
                          v297 = objc_msgSend_startTime(v62, v293, v294, v295, v296);
                          objc_msgSend_timeIntervalSince1970(v297, v298, v299, v300, v301);
                          BOOL v303 = v292 <= v302;

                          v284 &= v303;
                        }
                        uint64_t v282 = objc_msgSend_countByEnumeratingWithState_objects_count_(v275, v278, (uint64_t)&v408, (uint64_t)v444, 16);
                      }
                      while (v282);

                      if ((v284 & 1) == 0)
                      {
                        uint64_t v202 = 2;
                        long long v239 = v386;
                        v69 = (void *)v394;
                        uint64_t v105 = v398;
                        uint64_t v85 = v400;
                        goto LABEL_135;
                      }
                      uint64_t v202 = 19;
                      long long v239 = v386;
                      v69 = (void *)v394;
                      uint64_t v85 = v400;
                    }
                    else
                    {

                      uint64_t v202 = 19;
                    }
                    uint64_t v105 = v398;
                    goto LABEL_132;
                  }
                  if (v202 == 1)
                  {
                    v240 = LBFLogContextAggregator;
                    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_254547000, v240, OS_LOG_TYPE_INFO, "Emitting allocated.", buf, 2u);
                    }
                    long long v414 = 0u;
                    long long v415 = 0u;
                    long long v412 = 0u;
                    long long v413 = 0u;
                    id v241 = v105;
                    uint64_t v243 = objc_msgSend_countByEnumeratingWithState_objects_count_(v241, v242, (uint64_t)&v412, (uint64_t)v445, 16);
                    if (v243)
                    {
                      uint64_t v248 = v243;
                      uint64_t v249 = *(void *)v413;
                      char v250 = 1;
                      do
                      {
                        for (uint64_t n = 0; n != v248; ++n)
                        {
                          if (*(void *)v413 != v249) {
                            objc_enumerationMutation(v241);
                          }
                          uint64_t v252 = objc_msgSend_timestamp(*(void **)(*((void *)&v412 + 1) + 8 * n), v244, v245, v246, v247);
                          objc_msgSend_timeIntervalSince1970(v252, v253, v254, v255, v256);
                          double v258 = v257;
                          v263 = objc_msgSend_startTime(v62, v259, v260, v261, v262);
                          objc_msgSend_timeIntervalSince1970(v263, v264, v265, v266, v267);
                          BOOL v269 = v258 <= v268;

                          v250 &= v269;
                        }
                        uint64_t v248 = objc_msgSend_countByEnumeratingWithState_objects_count_(v241, v244, (uint64_t)&v412, (uint64_t)v445, 16);
                      }
                      while (v248);

                      long long v239 = v386;
                      uint64_t v105 = v398;
                      uint64_t v85 = v400;
                      if ((v250 & 1) == 0)
                      {
                        v270 = LBFLogContextAggregator;
                        if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_254547000, v270, OS_LOG_TYPE_INFO, "Events in question from current bucket.", buf, 2u);
                        }
                        v69 = (void *)v394;
                        if (v384)
                        {
                          uint64_t v271 = LBFLogContextAggregator;
                          if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                          {
                            *(_WORD *)buf = 0;
                            v273 = v271;
                            v274 = "Allocated in current bucket, but seen MLRuntime - Activated Idle State.";
                            goto LABEL_125;
                          }
                          goto LABEL_126;
                        }
                        uint64_t v202 = 1;
LABEL_135:
                        uint64_t v304 = v387;
LABEL_136:
                        objc_msgSend_setObject_forKey_(v379, v237, (uint64_t)v385, v304, v238);
                        uint64_t v311 = objc_msgSend_numberWithInteger_(NSNumber, v308, v202, v309, v310);
                        uint64_t v312 = v304;
                        v313 = (void *)v311;
                        objc_msgSend_setObject_forKey_(v388, v314, v311, v312, v315);

LABEL_137:
                        BOOL v56 = v382;
                        self = v239;
                        id v5 = v401;
LABEL_138:

LABEL_139:
                        goto LABEL_140;
                      }
                    }
                    else
                    {
                    }
                    v305 = LBFLogContextAggregator;
                    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_254547000, v305, OS_LOG_TYPE_INFO, "All events from previous bucket.", buf, 2u);
                    }
                    v306 = LBFLogContextAggregator;
                    BOOL v307 = os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO);
                    v69 = (void *)v394;
                    if (v384)
                    {
                      if (v307)
                      {
                        *(_WORD *)buf = 0;
                        v273 = v306;
                        v274 = "Seen MLRuntime - must be Activated Idle.";
LABEL_125:
                        _os_log_impl(&dword_254547000, v273, OS_LOG_TYPE_INFO, v274, buf, 2u);
                      }
LABEL_126:
                      uint64_t v202 = 19;
                    }
                    else
                    {
                      if (v307)
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_254547000, v306, OS_LOG_TYPE_INFO, "No MLRuntime - must be Allocated Idle.", buf, 2u);
                      }
                      uint64_t v202 = 18;
                    }
LABEL_132:
                    uint64_t v304 = v387;
                    objc_msgSend_setLatestState_(v385, v237, v202, v272, v238);
                    goto LABEL_136;
                  }
                  if (v202 != 3) {
                    goto LABEL_135;
                  }
                  uint64_t v304 = v387;
                  if (v381 != 3) {
                    goto LABEL_136;
                  }
                }
                else
                {
                  v69 = (void *)v394;
                  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_ERROR)) {
                    sub_254584FB8(&v416, v417);
                  }
                }

                goto LABEL_137;
              }
              if (v71)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_254547000, v70, OS_LOG_TYPE_INFO, "Skipping aggregation for null experiment.", buf, 2u);
              }
LABEL_143:
              uint64_t v68 = v378 + 1;
            }
            while (v378 + 1 != v376);
            uint64_t v376 = objc_msgSend_countByEnumeratingWithState_objects_count_(v377, v65, (uint64_t)&v428, (uint64_t)v454, 16);
          }
          while (v376);
        }

        v325 = NSNumber;
        uint64_t v330 = objc_msgSend_bucketIndex(v62, v326, v327, v328, v329);
        v334 = objc_msgSend_numberWithUnsignedInteger_(v325, v331, v330, v332, v333);
        int v338 = objc_msgSend_containsObject_(v371, v335, (uint64_t)v334, v336, v337);

        if (v338)
        {
          v343 = objc_msgSend_copy(v374, v339, v340, v341, v342);
          objc_msgSend_addObject_(v368, v344, (uint64_t)v343, v345, v346);
        }
        uint64_t v61 = v373 + 1;
      }
      while (v373 + 1 != v372);
      uint64_t v372 = objc_msgSend_countByEnumeratingWithState_objects_count_(v369, v57, (uint64_t)&v432, (uint64_t)v455, 16);
    }
    while (v372);
  }

  id v347 = objc_alloc(MEMORY[0x263EFFA40]);
  v355 = objc_msgSend_initWithSuiteName_(v347, v348, @"LighthouseBitacoraFramework", v349, v350);
  if (v367)
  {
    v356 = objc_msgSend_objectAtIndex_(self->_buckets, v351, 0, v353, v354);
    v361 = objc_msgSend_endTime(v356, v357, v358, v359, v360);

    v362 = LBFLogContextAggregator;
    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v450 = (uint64_t)v361;
      _os_log_impl(&dword_254547000, v362, OS_LOG_TYPE_INFO, "Setting aggregation timestamp to: %@", buf, 0xCu);
    }
    objc_msgSend_setObject_forKey_(v355, v363, (uint64_t)v361, (uint64_t)self->_lastAggregationDateKey, v364);
  }
  v365 = objc_msgSend_copy(v368, v351, v352, v353, v354);

  return v365;
}

- (BOOL)dumpFetchedEvents
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  if (objc_msgSend_count(self->_buckets, a2, v2, v3, v4))
  {
    unint64_t v10 = 0;
    *(void *)&long long v9 = 138412546;
    long long v58 = v9;
    do
    {
      uint64_t v11 = objc_msgSend_objectAtIndex_(self->_buckets, v6, v10, v7, v8, v58);
      uint64_t v16 = objc_msgSend_eventTree(v11, v12, v13, v14, v15);
      uint64_t v21 = objc_msgSend_count(v16, v17, v18, v19, v20);

      if (v21)
      {
        uint64_t v22 = (void *)LBFLogContextEventsHolder;
        if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
        {
          uint64_t v27 = v22;
          uint64_t v32 = objc_msgSend_startTime(v11, v28, v29, v30, v31);
          uint64_t v37 = objc_msgSend_endTime(v11, v33, v34, v35, v36);
          *(_DWORD *)buf = v58;
          uint64_t v65 = v32;
          __int16 v66 = 2112;
          uint64_t v67 = v37;
          _os_log_impl(&dword_254547000, v27, OS_LOG_TYPE_INFO, "Bucket from %@ to %@", buf, 0x16u);
        }
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        uint64_t v38 = objc_msgSend_eventTree(v11, v23, v24, v25, v26);
        uint64_t v43 = objc_msgSend_allValues(v38, v39, v40, v41, v42);

        uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v59, (uint64_t)v63, 16);
        if (v45)
        {
          uint64_t v50 = v45;
          uint64_t v51 = *(void *)v60;
          do
          {
            uint64_t v52 = 0;
            do
            {
              if (*(void *)v60 != v51) {
                objc_enumerationMutation(v43);
              }
              objc_msgSend_dumpFetchedEvents(*(void **)(*((void *)&v59 + 1) + 8 * v52++), v46, v47, v48, v49);
            }
            while (v50 != v52);
            uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v59, (uint64_t)v63, 16);
          }
          while (v50);
        }
      }
      ++v10;
    }
    while (objc_msgSend_count(self->_buckets, v53, v54, v55, v56) > v10);
  }
  return 1;
}

- (id)fetchedEventsInDictionaries
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (objc_msgSend_count(self->_buckets, v4, v5, v6, v7))
  {
    unint64_t v12 = 0;
    *(void *)&long long v11 = 138412546;
    long long v64 = v11;
    do
    {
      uint64_t v13 = objc_msgSend_objectAtIndex_(self->_buckets, v8, v12, v9, v10, v64);
      uint64_t v18 = objc_msgSend_eventTree(v13, v14, v15, v16, v17);
      uint64_t v23 = objc_msgSend_count(v18, v19, v20, v21, v22);

      if (v23)
      {
        uint64_t v24 = (void *)LBFLogContextEventsHolder;
        if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
        {
          uint64_t v29 = v24;
          uint64_t v34 = objc_msgSend_startTime(v13, v30, v31, v32, v33);
          uint64_t v39 = objc_msgSend_endTime(v13, v35, v36, v37, v38);
          *(_DWORD *)buf = v64;
          BOOL v71 = v34;
          __int16 v72 = 2112;
          char v73 = v39;
          _os_log_impl(&dword_254547000, v29, OS_LOG_TYPE_INFO, "Bucket from %@ to %@", buf, 0x16u);
        }
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        uint64_t v40 = objc_msgSend_eventTree(v13, v25, v26, v27, v28);
        uint64_t v45 = objc_msgSend_allValues(v40, v41, v42, v43, v44);

        uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v65, (uint64_t)v69, 16);
        if (v47)
        {
          uint64_t v52 = v47;
          uint64_t v53 = *(void *)v66;
          do
          {
            for (uint64_t i = 0; i != v52; ++i)
            {
              if (*(void *)v66 != v53) {
                objc_enumerationMutation(v45);
              }
              uint64_t v55 = objc_msgSend_fetchedEventsInDictionaries(*(void **)(*((void *)&v65 + 1) + 8 * i), v48, v49, v50, v51);
              objc_msgSend_addObjectsFromArray_(v3, v56, (uint64_t)v55, v57, v58);
            }
            uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v65, (uint64_t)v69, 16);
          }
          while (v52);
        }
      }
      ++v12;
    }
    while (objc_msgSend_count(self->_buckets, v59, v60, v61, v62) > v12);
  }
  return v3;
}

- (BOOL)upload
{
  return MEMORY[0x270F9A6D0](self, sel_upload_uploadRawEvents_skipNullIdentifiers_, 1, 0, 0);
}

- (BOOL)isInternal
{
  return MEMORY[0x270EDAB30]("", a2);
}

- (double)getRandomCoinFlip
{
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x263EFF910], a2, v2, v3, v4);
  srand48(v5);
  return drand48();
}

- (BOOL)upload:(BOOL)a3 uploadRawEvents:(BOOL)a4 skipNullIdentifiers:(BOOL)a5
{
  BOOL v70 = a4;
  BOOL v5 = a3;
  uint64_t v88 = *MEMORY[0x263EF8340];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  objc_msgSend_getAggregatedStatesUpdateTimestamp_skipNullIdentifiers_(self, a2, a3, a5, a5);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v79, (uint64_t)v87, 16);
  if (v64)
  {
    uint64_t v63 = *(void *)v80;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v80 != v63) {
          objc_enumerationMutation(obj);
        }
        uint64_t v65 = v12;
        uint64_t v13 = *(void **)(*((void *)&v79 + 1) + 8 * v12);
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        objc_msgSend_allValues(v13, v8, v9, v10, v11);
        id v66 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v14, (uint64_t)&v75, (uint64_t)v86, 16);
        if (v68)
        {
          uint64_t v67 = *(void *)v76;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v76 != v67) {
                objc_enumerationMutation(v66);
              }
              uint64_t v69 = v19;
              uint64_t v20 = *(void **)(*((void *)&v75 + 1) + 8 * v19);
              long long v71 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              long long v74 = 0u;
              uint64_t v21 = objc_msgSend_allValues(v20, v15, v16, v17, v18);
              uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v71, (uint64_t)v85, 16);
              if (v23)
              {
                uint64_t v28 = v23;
                uint64_t v29 = *(void *)v72;
                do
                {
                  for (uint64_t i = 0; i != v28; ++i)
                  {
                    if (*(void *)v72 != v29) {
                      objc_enumerationMutation(v21);
                    }
                    uint64_t v31 = *(void **)(*((void *)&v71 + 1) + 8 * i);
                    uint64_t v32 = objc_msgSend_trialIdentifiers(v31, v24, v25, v26, v27);
                    uint64_t v37 = objc_msgSend_experimentIdentifiers(v32, v33, v34, v35, v36);
                    uint64_t v42 = objc_msgSend_trialExperimentID(v37, v38, v39, v40, v41);

                    if (!objc_msgSend_containsObject_(self->_usePrivateUpload, v43, (uint64_t)v42, v44, v45))goto LABEL_19; {
                    if (objc_msgSend_isInternal(self, v46, v47, v48, v49))
                    }
                    {
                      objc_msgSend_uploadToDedisco(v31, v50, v51, v52, v53);
LABEL_19:
                      if (v5) {
                        objc_msgSend_uploadToCoreAnalytics(v31, v46, v47, v48, v49);
                      }
                      if (v70) {
                        objc_msgSend_uploadRawEventsToCoreAnalytics(v31, v46, v47, v48, v49);
                      }
                      goto LABEL_27;
                    }
                    objc_msgSend_getRandomCoinFlip(self, v50, v51, v52, v53);
                    double v55 = v54;
                    printf("DeDisco Upload Coin Flip: %f \n", v54);
                    uint64_t v56 = LBFLogContextAggregator;
                    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 134217984;
                      double v84 = v55;
                      _os_log_impl(&dword_254547000, v56, OS_LOG_TYPE_INFO, "DeDisco Upload Coin Flip: %f \n", buf, 0xCu);
                    }
                    if (v55 <= 0.1) {
                      objc_msgSend_uploadToDedisco(v31, v57, v58, v59, v60);
                    }
LABEL_27:
                  }
                  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v71, (uint64_t)v85, 16);
                }
                while (v28);
              }

              uint64_t v19 = v69 + 1;
            }
            while (v69 + 1 != v68);
            uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v15, (uint64_t)&v75, (uint64_t)v86, 16);
          }
          while (v68);
        }

        uint64_t v12 = v65 + 1;
      }
      while (v65 + 1 != v64);
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v79, (uint64_t)v87, 16);
    }
    while (v64);
  }

  return 1;
}

- (id)dumpAggregate
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend_getAggregatedStatesUpdateTimestamp_skipNullIdentifiers_(self, a2, 0, 0, v2);
  uint64_t v4 = (void *)LBFLogContextAggregator;
  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = v4;
    *(_DWORD *)buf = 134217984;
    uint64_t v104 = objc_msgSend_count(v3, v6, v7, v8, v9);
    _os_log_impl(&dword_254547000, v5, OS_LOG_TYPE_INFO, "%lu Buckets", buf, 0xCu);
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  obuint64_t j = v3;
  uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v96, (uint64_t)v102, 16);
  if (v80)
  {
    uint64_t v79 = *(void *)v97;
    long long v82 = v10;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v97 != v79) {
          objc_enumerationMutation(obj);
        }
        uint64_t v81 = v12;
        uint64_t v13 = *(void **)(*((void *)&v96 + 1) + 8 * v12);
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v85 = v13;
        uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v14, (uint64_t)&v92, (uint64_t)v101, 16);
        if (v84)
        {
          uint64_t v83 = *(void *)v93;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v93 != v83) {
                objc_enumerationMutation(v85);
              }
              uint64_t v19 = *(void *)(*((void *)&v92 + 1) + 8 * v18);
              uint64_t v20 = objc_msgSend_objectForKey_(v85, v15, v19, v16, v17);
              id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              uint64_t v25 = objc_msgSend_objectForKey_(v10, v22, v19, v23, v24);

              uint64_t v86 = v19;
              uint64_t v87 = v18;
              if (v25)
              {
                uint64_t v29 = objc_msgSend_objectForKey_(v10, v26, v19, v27, v28);

                id v21 = (id)v29;
              }
              long long v90 = 0u;
              long long v91 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              id v30 = v20;
              uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v88, (uint64_t)v100, 16);
              if (v32)
              {
                uint64_t v36 = v32;
                uint64_t v37 = *(void *)v89;
                do
                {
                  for (uint64_t i = 0; i != v36; ++i)
                  {
                    if (*(void *)v89 != v37) {
                      objc_enumerationMutation(v30);
                    }
                    uint64_t v39 = *(void *)(*((void *)&v88 + 1) + 8 * i);
                    uint64_t v40 = objc_msgSend_objectForKey_(v30, v33, v39, v34, v35);
                    uint64_t v41 = (void *)LBFLogContextAggregator;
                    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                    {
                      uint64_t v42 = v41;
                      uint64_t v47 = objc_msgSend_latestState(v40, v43, v44, v45, v46);
                      *(_DWORD *)buf = 134217984;
                      uint64_t v104 = v47;
                      _os_log_impl(&dword_254547000, v42, OS_LOG_TYPE_INFO, "State: %lu", buf, 0xCu);
                    }
                    uint64_t v48 = (void *)LBFLogContextAggregator;
                    if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
                    {
                      uint64_t v49 = v48;
                      double v54 = objc_msgSend_getDictionaryRepresentation(v40, v50, v51, v52, v53);
                      *(_DWORD *)buf = 138412290;
                      uint64_t v104 = (uint64_t)v54;
                      _os_log_impl(&dword_254547000, v49, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
                    }
                    id v55 = objc_alloc_init(MEMORY[0x263EFF980]);
                    uint64_t v59 = objc_msgSend_objectForKey_(v21, v56, v39, v57, v58);

                    if (v59)
                    {
                      uint64_t v64 = objc_msgSend_objectForKey_(v21, v60, v39, v62, v63);
                      objc_msgSend_addObjectsFromArray_(v55, v65, (uint64_t)v64, v66, v67);
                    }
                    uint64_t v68 = objc_msgSend_getDictionaryRepresentation(v40, v60, v61, v62, v63);
                    objc_msgSend_addObject_(v55, v69, (uint64_t)v68, v70, v71);

                    objc_msgSend_setObject_forKey_(v21, v72, (uint64_t)v55, v39, v73);
                  }
                  uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v88, (uint64_t)v100, 16);
                }
                while (v36);
              }

              id v10 = v82;
              objc_msgSend_setObject_forKey_(v82, v74, (uint64_t)v21, v86, v75);

              uint64_t v18 = v87 + 1;
            }
            while (v87 + 1 != v84);
            uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v15, (uint64_t)&v92, (uint64_t)v101, 16);
          }
          while (v84);
        }

        uint64_t v12 = v81 + 1;
      }
      while (v81 + 1 != v80);
      uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v76, (uint64_t)&v96, (uint64_t)v102, 16);
    }
    while (v80);
  }

  return v10;
}

- (void)enumerateAggregation:(id)a3
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *, void *, void *))a3;
  uint64_t v9 = objc_msgSend_getBucketsNotAggregated(self, v5, v6, v7, v8);
  id v10 = (void *)LBFLogContextAggregator;
  if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v10;
    uint64_t v20 = objc_msgSend_description(v9, v16, v17, v18, v19);
    *(_DWORD *)buf = 138412290;
    long long v89 = v20;
    _os_log_impl(&dword_254547000, v15, OS_LOG_TYPE_INFO, "To aggregate: %@", buf, 0xCu);
  }
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v21 = objc_msgSend_reverseObjectEnumerator(self->_buckets, v11, v12, v13, v14, v9);
  uint64_t v26 = objc_msgSend_allObjects(v21, v22, v23, v24, v25);

  obuint64_t j = v26;
  uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v81, (uint64_t)v87, 16);
  if (v65)
  {
    uint64_t v64 = *(void *)v82;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v82 != v64) {
          objc_enumerationMutation(obj);
        }
        uint64_t v66 = v32;
        uint64_t v33 = *(void **)(*((void *)&v81 + 1) + 8 * v32);
        uint64_t v34 = objc_msgSend_flattenEvents(v33, v28, v29, v30, v31);
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v69 = v34;
        uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v77, (uint64_t)v86, 16);
        if (v68)
        {
          uint64_t v67 = *(void *)v78;
          do
          {
            uint64_t v39 = 0;
            do
            {
              if (*(void *)v78 != v67) {
                objc_enumerationMutation(v69);
              }
              uint64_t v70 = v39;
              uint64_t v40 = objc_msgSend_objectForKey_(v69, v36, *(void *)(*((void *)&v77 + 1) + 8 * v39), v37, v38);
              long long v73 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              long long v76 = 0u;
              uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v73, (uint64_t)v85, 16);
              if (v42)
              {
                uint64_t v46 = v42;
                uint64_t v47 = *(void *)v74;
                do
                {
                  for (uint64_t i = 0; i != v46; ++i)
                  {
                    if (*(void *)v74 != v47) {
                      objc_enumerationMutation(v40);
                    }
                    uint64_t v49 = objc_msgSend_objectForKey_(v40, v43, *(void *)(*((void *)&v73 + 1) + 8 * i), v44, v45);
                    if (objc_msgSend_count(v49, v50, v51, v52, v53))
                    {
                      uint64_t v57 = objc_msgSend_objectAtIndex_(v49, v54, 0, v55, v56);
                      uint64_t v61 = objc_msgSend_getTrialIdentifierFromBMEvent_(self, v58, (uint64_t)v57, v59, v60);

                      if (v61)
                      {
                        v4[2](v4, v33, v61, v49);
                      }
                      else if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_ERROR))
                      {
                        sub_254584F8C(buf, &buf[1]);
                      }
                    }
                    else if (os_log_type_enabled((os_log_t)LBFLogContextAggregator, OS_LOG_TYPE_ERROR))
                    {
                      sub_254584F60(&v71, v72);
                    }
                  }
                  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v73, (uint64_t)v85, 16);
                }
                while (v46);
              }

              uint64_t v39 = v70 + 1;
            }
            while (v70 + 1 != v68);
            uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v36, (uint64_t)&v77, (uint64_t)v86, 16);
          }
          while (v68);
        }

        uint64_t v32 = v66 + 1;
      }
      while (v66 + 1 != v65);
      uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v81, (uint64_t)v87, 16);
    }
    while (v65);
  }
}

- (id)dateToStringInUTCAndLocal:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  objc_msgSend_setDateFormat_(v5, v6, @"yyyy-MM-dd HH:mm:ss zzz", v7, v8);
  uint64_t v13 = objc_msgSend_localTimeZone(MEMORY[0x263EFFA18], v9, v10, v11, v12);
  objc_msgSend_setTimeZone_(v5, v14, (uint64_t)v13, v15, v16);

  uint64_t v20 = objc_msgSend_stringFromDate_(v5, v17, (uint64_t)v4, v18, v19);
  uint64_t v24 = objc_msgSend_timeZoneWithName_(MEMORY[0x263EFFA18], v21, @"UTC", v22, v23);
  objc_msgSend_setTimeZone_(v5, v25, (uint64_t)v24, v26, v27);

  uint64_t v31 = objc_msgSend_stringFromDate_(v5, v28, (uint64_t)v4, v29, v30);

  uint64_t v35 = objc_msgSend_stringWithFormat_(NSString, v32, @"%@ %@", v33, v34, v31, v20);

  return v35;
}

- (void)dumpTimestamps
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_2545516F4;
  v4[3] = &unk_2653ADB18;
  v4[4] = self;
  objc_msgSend_enumerateAggregation_(self, a2, (uint64_t)v4, v2, v3);
}

- (NSMutableArray)buckets
{
  return self->_buckets;
}

- (NSSet)usePrivateUpload
{
  return self->_usePrivateUpload;
}

- (NSMutableDictionary)stateDict
{
  return self->_stateDict;
}

- (NSString)lastAggregationDateKey
{
  return self->_lastAggregationDateKey;
}

- (BOOL)strictDictChecks
{
  return self->_strictDictChecks;
}

- (void)setStrictDictChecks:(BOOL)a3
{
  self->_strictDictChecks = a3;
}

- (LBFTrialStatusDetector)trialStatusDetector
{
  return self->_trialStatusDetector;
}

- (BOOL)setMLHostMarkerInStateID
{
  return self->_setMLHostMarkerInStateID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialStatusDetector, 0);
  objc_storeStrong((id *)&self->_lastAggregationDateKey, 0);
  objc_storeStrong((id *)&self->_stateDict, 0);
  objc_storeStrong((id *)&self->_usePrivateUpload, 0);
  objc_storeStrong((id *)&self->_buckets, 0);
}

@end