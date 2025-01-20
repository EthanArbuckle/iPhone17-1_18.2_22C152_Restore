@interface LBFTestEventManager
+ (id)sharedInstance;
- (BOOL)generateEventStore;
- (BOOL)loadSyntheticData:(id)a3;
- (BOOL)loadSyntheticJSON:(id)a3 datasetName:(id)a4;
- (BOOL)validateOutcomes:(id)a3 withAggregatedStates:(id)a4;
- (LBFTestEventManager)init;
- (NSDateFormatter)dateFormatter;
- (NSDictionary)eventStore;
- (NSDictionary)syntheticData;
- (NSString)datasetName;
- (NSString)readCategory;
- (id)dprivacydEventFromDict:(id)a3;
- (id)ensureBiomeManagerDprivacyd;
- (id)ensureBiomeManagerLighthouse;
- (id)ensureBiomeManagerMLRuntimed;
- (id)ensureBiomeManagerTrial;
- (id)generateOutcomeDict;
- (id)lighthouseEventFromDict:(id)a3;
- (id)mlRuntimedEventFromDict:(id)a3;
- (id)readData:(id)a3 endDate:(id)a4;
- (id)trialEventFromDict:(id)a3;
- (id)trialIdentifiersFromJSON:(id)a3;
- (void)setSyntheticData:(id)a3;
@end

@implementation LBFTestEventManager

- (LBFTestEventManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)LBFTestEventManager;
  v2 = [(LBFTestEventManager *)&v20 init];
  if (v2)
  {
    LBFLoggingUtilsInit();
    v3 = (NSDictionary *)objc_alloc_init(NSDictionary);
    syntheticData = v2->_syntheticData;
    v2->_syntheticData = v3;

    readCategory = v2->_readCategory;
    v2->_readCategory = (NSString *)@"Unknown";

    v6 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v6;

    v8 = v2->_dateFormatter;
    v12 = objc_msgSend_timeZoneWithAbbreviation_(MEMORY[0x263EFFA18], v9, @"UTC", v10, v11);
    objc_msgSend_setTimeZone_(v8, v13, (uint64_t)v12, v14, v15);

    objc_msgSend_setDateFormat_(v2->_dateFormatter, v16, @"YYYY-MM-dd", v17, v18);
  }
  return v2;
}

+ (id)sharedInstance
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)loadSyntheticJSON:(id)a3 datasetName:(id)a4
{
  v6 = (NSString *)a4;
  uint64_t v10 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v7, (uint64_t)a3, v8, v9);
  v12 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v11, (uint64_t)v10, 0, 0);
  char SyntheticData = objc_msgSend_loadSyntheticData_(self, v13, (uint64_t)v12, v14, v15);
  datasetName = self->_datasetName;
  self->_datasetName = v6;

  return SyntheticData;
}

- (BOOL)loadSyntheticData:(id)a3
{
  return 1;
}

- (id)ensureBiomeManagerTrial
{
  readCategory = self->_readCategory;
  self->_readCategory = (NSString *)@"Trial";

  return self;
}

- (id)ensureBiomeManagerLighthouse
{
  readCategory = self->_readCategory;
  self->_readCategory = (NSString *)@"Lighthouse";

  return self;
}

- (id)ensureBiomeManagerMLRuntimed
{
  readCategory = self->_readCategory;
  self->_readCategory = (NSString *)@"MLRuntimed";

  return self;
}

- (id)ensureBiomeManagerDprivacyd
{
  readCategory = self->_readCategory;
  self->_readCategory = (NSString *)@"Dprivacyd";

  return self;
}

- (id)trialIdentifiersFromJSON:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_objectForKey_(v3, v4, @"bmltIdentifiers", v5, v6);
  uint64_t v11 = v7;
  if (v7)
  {
    v12 = objc_msgSend_objectForKey_(v7, v8, @"trialDeploymentID", v9, v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      v12 = 0;
    }
    v13 = [LBFTrialIdentifiers alloc];
    uint64_t v17 = objc_msgSend_objectForKey_(v11, v14, @"trialTaskID", v15, v16);
    uint64_t v22 = objc_msgSend_intValue(v12, v18, v19, v20, v21);
    v25 = objc_msgSend_initWithBMLTTaskID_deploymentID_(v13, v23, (uint64_t)v17, v22, v24);
  }
  else
  {
    v25 = 0;
  }
  v26 = objc_msgSend_objectForKey_(v3, v8, @"experimentIdentifiers", v9, v10);
  v30 = v26;
  if (v26)
  {
    v31 = objc_msgSend_objectForKey_(v26, v27, @"trialDeploymentID", v28, v29);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      v31 = 0;
    }
    v32 = [LBFTrialIdentifiers alloc];
    v36 = objc_msgSend_objectForKey_(v30, v33, @"trialExperimentID", v34, v35);
    uint64_t v41 = objc_msgSend_intValue(v31, v37, v38, v39, v40);
    v45 = objc_msgSend_objectForKey_(v30, v42, @"trialTreatmentID", v43, v44);
    uint64_t v47 = objc_msgSend_initWithExperimentID_deploymentID_treatmentID_(v32, v46, (uint64_t)v36, v41, (uint64_t)v45);

    v25 = (void *)v47;
  }

  return v25;
}

- (id)lighthouseEventFromDict:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_objectForKey_(v3, v4, @"performTrialTaskStatus", v5, v6);
  uint64_t v11 = v7;
  if (v7)
  {
    v12 = objc_msgSend_objectForKey_(v7, v8, @"succeeded", v9, v10);
    uint64_t v17 = objc_msgSend_BOOLValue(v12, v13, v14, v15, v16);

    uint64_t v21 = objc_msgSend_objectForKey_(v11, v18, @"usePrivateUpload", v19, v20);

    uint64_t v22 = [LBFLighthouseEvent alloc];
    uint64_t v24 = objc_msgSend_initWithPerformTrialTaskStatus_error_usePrivateUpload_(v22, v23, v17, 0, v21 != 0);
  }
  else
  {
    uint64_t v24 = 0;
  }
  v25 = objc_msgSend_objectForKey_(v3, v8, @"performTaskStatus", v9, v10);
  uint64_t v29 = v25;
  if (v25)
  {
    v30 = objc_msgSend_objectForKey_(v25, v26, @"succeeded", v27, v28);
    uint64_t v35 = objc_msgSend_BOOLValue(v30, v31, v32, v33, v34);

    v36 = [LBFLighthouseEvent alloc];
    uint64_t v39 = objc_msgSend_initWithPerformTaskStatus_error_(v36, v37, v35, 0, v38);

    uint64_t v24 = (void *)v39;
  }
  uint64_t v40 = objc_msgSend_objectForKey_(v3, v26, @"stop", v27, v28);
  uint64_t v44 = v40;
  if (v40)
  {
    v45 = objc_msgSend_objectForKey_(v40, v41, @"succeeded", v42, v43);
    uint64_t v50 = objc_msgSend_BOOLValue(v45, v46, v47, v48, v49);

    v51 = [LBFLighthouseEvent alloc];
    uint64_t v54 = objc_msgSend_initWithStop_error_(v51, v52, v50, 0, v53);

    uint64_t v24 = (void *)v54;
  }

  return v24;
}

- (id)mlRuntimedEventFromDict:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_objectForKey_(v3, v4, @"taskCompleted", v5, v6);
  uint64_t v11 = v7;
  if (v7)
  {
    v12 = objc_msgSend_objectForKey_(v7, v8, @"succeeded", v9, v10);
    uint64_t v17 = objc_msgSend_BOOLValue(v12, v13, v14, v15, v16);

    uint64_t v18 = [LBFMLRuntimedEvent alloc];
    uint64_t v21 = objc_msgSend_initWithTaskCompleted_error_(v18, v19, v17, 0, v20);
  }
  else
  {
    uint64_t v21 = 0;
  }
  uint64_t v22 = objc_msgSend_objectForKey_(v3, v8, @"taskFetched", v9, v10);
  v26 = v22;
  if (v22)
  {
    uint64_t v27 = objc_msgSend_objectForKey_(v22, v23, @"succeeded", v24, v25);
    uint64_t v32 = objc_msgSend_BOOLValue(v27, v28, v29, v30, v31);

    uint64_t v33 = [LBFMLRuntimedEvent alloc];
    uint64_t v36 = objc_msgSend_initWithTaskFetched_error_(v33, v34, v32, 0, v35);

    uint64_t v21 = (void *)v36;
  }
  v37 = objc_msgSend_objectForKey_(v3, v23, @"taskScheduled", v24, v25);
  uint64_t v41 = v37;
  if (v37)
  {
    uint64_t v42 = objc_msgSend_objectForKey_(v37, v38, @"succeeded", v39, v40);
    uint64_t v47 = objc_msgSend_BOOLValue(v42, v43, v44, v45, v46);

    uint64_t v48 = [LBFMLRuntimedEvent alloc];
    uint64_t v51 = objc_msgSend_initWithTaskScheduled_error_(v48, v49, v47, 0, v50);

    uint64_t v21 = (void *)v51;
  }
  v52 = objc_msgSend_objectForKey_(v3, v38, @"activityScheduleStatus", v39, v40);
  v56 = v52;
  if (v52)
  {
    v57 = objc_msgSend_objectForKey_(v52, v53, @"scheduled", v54, v55);
    uint64_t v62 = objc_msgSend_BOOLValue(v57, v58, v59, v60, v61);

    v63 = [LBFMLRuntimedEvent alloc];
    uint64_t v67 = objc_msgSend_initWithScheduleStatus_(v63, v64, v62, v65, v66);

    uint64_t v21 = (void *)v67;
  }

  return v21;
}

- (id)dprivacydEventFromDict:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"event", v5, v6);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v7, v8, @"phase", v9, v10);

  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(&unk_2703E40D0, v12, (uint64_t)v11, v13, v14);
  uint64_t v20 = objc_msgSend_intValue(v15, v16, v17, v18, v19);

  uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v3, v21, @"event", v22, v23);

  uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v24, v25, @"succeeded", v26, v27);
  BOOL v29 = v28 != 0;

  uint64_t v30 = [LBFDprivacydEvent alloc];
  uint64_t v32 = objc_msgSend_initWithEventPhase_eventUUID_succeeded_error_(v30, v31, v20, 0, v29, 0);

  return v32;
}

- (id)trialEventFromDict:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_objectForKey_(v3, v4, @"eventType", v5, v6);
  uint64_t v11 = objc_msgSend_objectForKey_(v3, v8, @"eventSucceeded", v9, v10);

  uint64_t v16 = objc_msgSend_BOOLValue(v11, v12, v13, v14, v15);
  if (objc_msgSend_isEqualToString_(v7, v17, @"Allocation", v18, v19))
  {
    uint64_t v23 = [LBFTrialEvent alloc];
    uint64_t v27 = objc_msgSend_initWithAllocation_(v23, v24, v16, v25, v26);
  }
  else
  {
    uint64_t v27 = 0;
  }
  if (objc_msgSend_isEqualToString_(v7, v20, @"Activation", v21, v22))
  {
    uint64_t v31 = [LBFTrialEvent alloc];
    uint64_t v35 = objc_msgSend_initWithActivation_(v31, v32, v16, v33, v34);

    uint64_t v27 = (void *)v35;
  }
  if (objc_msgSend_isEqualToString_(v7, v28, @"Deactivation", v29, v30))
  {
    uint64_t v36 = [LBFTrialEvent alloc];
    uint64_t v40 = objc_msgSend_initWithDeactivation_(v36, v37, v16, v38, v39);

    uint64_t v27 = (void *)v40;
  }

  return v27;
}

- (id)generateOutcomeDict
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v4 = self->_syntheticData;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_objectForKey_(self->_syntheticData, v7, v13, v8, v9, (void)v31);
        uint64_t v18 = objc_msgSend_objectForKey_(v14, v15, @"outcome", v16, v17);
        if (objc_msgSend_count(v18, v19, v20, v21, v22)) {
          objc_msgSend_setObject_forKey_(v3, v23, (uint64_t)v18, v13, v24);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v10);
  }

  uint64_t v29 = objc_msgSend_copy(v3, v25, v26, v27, v28);
  return v29;
}

- (BOOL)generateEventStore
{
  uint64_t v228 = *MEMORY[0x263EF8340];
  id v214 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v213 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v212 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v211 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = objc_alloc(MEMORY[0x263EFF8F0]);
  uint64_t v7 = objc_msgSend_initWithCalendarIdentifier_(v3, v4, *MEMORY[0x263EFF3F8], v5, v6);
  id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
  v203 = (void *)v7;
  objc_msgSend_setCalendar_(v8, v9, v7, v10, v11);
  objc_msgSend_setHour_(v8, v12, 0, v13, v14);
  objc_msgSend_setMinute_(v8, v15, 0, v16, v17);
  objc_msgSend_setSecond_(v8, v18, 0, v19, v20);
  uint64_t v24 = objc_msgSend_timeZoneWithName_(MEMORY[0x263EFFA18], v21, @"GMT", v22, v23);
  v202 = v8;
  objc_msgSend_setTimeZone_(v8, v25, (uint64_t)v24, v26, v27);

  long long v222 = 0u;
  long long v223 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  obuint64_t j = self->_syntheticData;
  uint64_t v205 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v220, (uint64_t)v227, 16);
  if (v205)
  {
    uint64_t v204 = *(void *)v221;
    do
    {
      for (uint64_t i = 0; i != v205; ++i)
      {
        if (*(void *)v221 != v204) {
          objc_enumerationMutation(obj);
        }
        long long v33 = *(void **)(*((void *)&v220 + 1) + 8 * i);
        long long v34 = objc_msgSend_objectForKey_(self->_syntheticData, v29, (uint64_t)v33, v30, v31);
        uint64_t v41 = objc_msgSend_objectForKey_(v34, v35, @"events", v36, v37);
        if (v41)
        {
          v209 = v34;
          uint64_t v210 = i;
          uint64_t v42 = objc_msgSend_componentsSeparatedByString_(v33, v38, @"-", v39, v40);
          uint64_t v46 = objc_msgSend_objectAtIndex_(v42, v43, 0, v44, v45);
          int v51 = objc_msgSend_intValue(v46, v47, v48, v49, v50);
          objc_msgSend_setYear_(v202, v52, v51, v53, v54);

          v58 = objc_msgSend_objectAtIndex_(v42, v55, 1, v56, v57);
          int v63 = objc_msgSend_intValue(v58, v59, v60, v61, v62);
          objc_msgSend_setMonth_(v202, v64, v63, v65, v66);

          v207 = v42;
          v70 = objc_msgSend_objectAtIndex_(v42, v67, 2, v68, v69);
          int v75 = objc_msgSend_intValue(v70, v71, v72, v73, v74);
          objc_msgSend_setDay_(v202, v76, v75, v77, v78);

          v206 = objc_msgSend_dateFromComponents_(v203, v79, (uint64_t)v202, v80, v81);
          objc_msgSend_timeIntervalSince1970(v206, v82, v83, v84, v85);
          double v87 = v86;
          long long v216 = 0u;
          long long v217 = 0u;
          long long v218 = 0u;
          long long v219 = 0u;
          v208 = v41;
          id v215 = v41;
          uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v215, v88, (uint64_t)&v216, (uint64_t)v226, 16);
          if (v89)
          {
            uint64_t v93 = v89;
            uint64_t v94 = *(void *)v217;
            do
            {
              for (uint64_t j = 0; j != v93; ++j)
              {
                if (*(void *)v217 != v94) {
                  objc_enumerationMutation(v215);
                }
                v96 = *(void **)(*((void *)&v216 + 1) + 8 * j);
                double v87 = v87 + 2.0;
                v97 = objc_msgSend_objectForKey_(v96, v90, @"trialIdentifiers", v91, v92);
                v101 = objc_msgSend_trialIdentifiersFromJSON_(self, v98, (uint64_t)v97, v99, v100);

                v105 = objc_msgSend_objectForKey_(v96, v102, @"category", v103, v104);
                int isEqualToString = objc_msgSend_isEqualToString_(v105, v106, @"Trial", v107, v108);

                if (isEqualToString)
                {
                  v113 = objc_msgSend_trialEventFromDict_(self, v110, (uint64_t)v96, v111, v112);
                  v117 = objc_msgSend_numberWithInt_(NSNumber, v114, (int)v87, v115, v116);
                  v119 = objc_msgSend_createTrialdEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, v118, (uint64_t)v113, (uint64_t)v101, (uint64_t)v117);

                  objc_msgSend_addObject_(v214, v120, (uint64_t)v119, v121, v122);
                }
                v123 = objc_msgSend_objectForKey_(v96, v110, @"category", v111, v112);
                int v127 = objc_msgSend_isEqualToString_(v123, v124, @"MLRuntimed", v125, v126);

                if (v127)
                {
                  v131 = objc_msgSend_mlRuntimedEventFromDict_(self, v128, (uint64_t)v96, v129, v130);
                  v135 = objc_msgSend_numberWithInt_(NSNumber, v132, (int)v87, v133, v134);
                  v137 = objc_msgSend_createMLRuntimedEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, v136, (uint64_t)v131, (uint64_t)v101, (uint64_t)v135);

                  objc_msgSend_addObject_(v213, v138, (uint64_t)v137, v139, v140);
                }
                v141 = objc_msgSend_objectForKey_(v96, v128, @"category", v129, v130);
                int v145 = objc_msgSend_isEqualToString_(v141, v142, @"Lighthouse", v143, v144);

                if (v145)
                {
                  v149 = objc_msgSend_lighthouseEventFromDict_(self, v146, (uint64_t)v96, v147, v148);
                  v153 = objc_msgSend_numberWithInt_(NSNumber, v150, (int)v87, v151, v152);
                  v155 = objc_msgSend_createLighthousePluginEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, v154, (uint64_t)v149, (uint64_t)v101, (uint64_t)v153);

                  objc_msgSend_addObject_(v212, v156, (uint64_t)v155, v157, v158);
                }
                v159 = objc_msgSend_objectForKey_(v96, v146, @"category", v147, v148);
                int v163 = objc_msgSend_isEqualToString_(v159, v160, @"Dprivacyd", v161, v162);

                if (v163)
                {
                  v167 = objc_msgSend_dprivacydEventFromDict_(self, v164, (uint64_t)v96, v165, v166);
                  v171 = objc_msgSend_numberWithInt_(NSNumber, v168, (int)v87, v169, v170);
                  v173 = objc_msgSend_createDprivacydEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, v172, (uint64_t)v167, (uint64_t)v101, (uint64_t)v171);

                  objc_msgSend_addObject_(v211, v174, (uint64_t)v173, v175, v176);
                }
              }
              uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v215, v90, (uint64_t)&v216, (uint64_t)v226, 16);
            }
            while (v93);
          }

          long long v34 = v209;
          uint64_t i = v210;
          uint64_t v41 = v208;
        }
      }
      uint64_t v205 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v220, (uint64_t)v227, 16);
    }
    while (v205);
  }

  v224[0] = @"Trial";
  v181 = objc_msgSend_copy(v214, v177, v178, v179, v180);
  v225[0] = v181;
  v224[1] = @"MLRuntimed";
  v186 = objc_msgSend_copy(v213, v182, v183, v184, v185);
  v225[1] = v186;
  v224[2] = @"Lighthouse";
  v191 = objc_msgSend_copy(v212, v187, v188, v189, v190);
  v225[2] = v191;
  v224[3] = @"Dprivacyd";
  v196 = objc_msgSend_copy(v211, v192, v193, v194, v195);
  v225[3] = v196;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v197, (uint64_t)v225, (uint64_t)v224, 4);
  v198 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  eventStore = self->_eventStore;
  self->_eventStore = v198;

  return 1;
}

- (id)readData:(id)a3 endDate:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_msgSend_timeIntervalSince1970(v6, v9, v10, v11, v12);
  double v14 = v13;
  objc_msgSend_timeIntervalSince1970(v7, v15, v16, v17, v18);
  double v20 = v19;
  uint64_t v24 = objc_msgSend_objectForKey_(self->_eventStore, v21, (uint64_t)self->_readCategory, v22, v23);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v45, (uint64_t)v49, 16);
  if (v26)
  {
    uint64_t v31 = v26;
    uint64_t v32 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(v24);
        }
        long long v34 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v35 = objc_msgSend_timestamp(v34, v27, v28, v29, v30);
        objc_msgSend_timeIntervalSince1970(v35, v36, v37, v38, v39);
        double v41 = v40;

        if (v41 > v14 && v41 < v20) {
          objc_msgSend_addObject_(v8, v27, (uint64_t)v34, v29, v30);
        }
      }
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v45, (uint64_t)v49, 16);
    }
    while (v31);
  }
  uint64_t v43 = objc_msgSend_copy(v8, v27, v28, v29, v30);

  return v43;
}

- (BOOL)validateOutcomes:(id)a3 withAggregatedStates:(id)a4
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v101 = a3;
  id v5 = a4;
  NSLog(&cfstr_StartingOutcom.isa);
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v6 = v5;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v122, (uint64_t)v129, 16);
  if (v8)
  {
    uint64_t v9 = 1;
    uint64_t v10 = *(void *)v123;
    id v96 = v6;
    uint64_t v91 = *(void *)v123;
    do
    {
      uint64_t v11 = 0;
      uint64_t v90 = v8;
      do
      {
        if (*(void *)v123 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v122 + 1) + 8 * v11);
        long long v118 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        obuint64_t j = v12;
        uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v118, (uint64_t)v128, 16);
        if (v94)
        {
          uint64_t v17 = *(void *)v119;
          uint64_t v92 = *(void *)v119;
          uint64_t v93 = v11;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v119 != v17) {
                objc_enumerationMutation(obj);
              }
              uint64_t v95 = v18;
              uint64_t v108 = *(void *)(*((void *)&v118 + 1) + 8 * v18);
              double v19 = objc_msgSend_objectForKey_(obj, v14, v108, v15, v16);
              long long v114 = 0u;
              long long v115 = 0u;
              long long v116 = 0u;
              long long v117 = 0u;
              id v20 = v19;
              uint64_t v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v114, (uint64_t)v127, 16);
              if (v100)
              {
                id v98 = v20;
                uint64_t v99 = *(void *)v115;
                while (2)
                {
                  for (uint64_t i = 0; i != v100; ++i)
                  {
                    if (*(void *)v115 != v99) {
                      objc_enumerationMutation(v20);
                    }
                    uint64_t v26 = *(void *)(*((void *)&v114 + 1) + 8 * i);
                    uint64_t v27 = objc_msgSend_objectForKey_(v20, v22, v26, v23, v24);
                    v109 = objc_msgSend_getDictionaryRepresentation(v27, v28, v29, v30, v31);
                    uint64_t v35 = objc_msgSend_objectForKey_(v109, v32, @"timestamp", v33, v34);
                    uint64_t v40 = objc_msgSend_longLongValue(v35, v36, v37, v38, v39);
                    v106 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x263EFF910], v41, v42, v43, v44, (double)(v40 / 1000 - 86400));
                    v105 = objc_msgSend_stringFromDate_(self->_dateFormatter, v45, (uint64_t)v106, v46, v47);
                    int v51 = objc_msgSend_objectForKey_(v101, v48, (uint64_t)v105, v49, v50);
                    uint64_t v55 = objc_msgSend_objectForKey_(v51, v52, v108, v53, v54);
                    uint64_t v59 = objc_msgSend_objectForKey_(v55, v56, v26, v57, v58);

                    long long v112 = 0u;
                    long long v113 = 0u;
                    long long v110 = 0u;
                    long long v111 = 0u;
                    id v60 = v59;
                    uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v110, (uint64_t)v126, 16);
                    if (v62)
                    {
                      uint64_t v66 = v62;
                      v102 = v35;
                      uint64_t v103 = v27;
                      uint64_t v104 = i;
                      uint64_t v67 = *(void *)v111;
                      while (2)
                      {
                        uint64_t v68 = 0;
                        uint64_t v69 = v9;
                        do
                        {
                          if (*(void *)v111 != v67) {
                            objc_enumerationMutation(v60);
                          }
                          uint64_t v70 = *(void *)(*((void *)&v110 + 1) + 8 * v68);
                          v71 = objc_msgSend_objectForKey_(v60, v63, v70, v64, v65);
                          int v75 = objc_msgSend_objectForKey_(v109, v72, v70, v73, v74);
                          NSLog(&stru_2703DD8B8.isa);
                          NSLog(&cfstr_TestCaseDExpId.isa, self->_datasetName, v69 + v68, v108, v26);
                          NSLog(&cfstr_KeyExpected.isa, v70, v71);
                          NSLog(&cfstr_ActualValue.isa, v75);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0
                            && !objc_msgSend_isEqualToString_(v71, v76, (uint64_t)v75, v78, v79)
                            || (objc_msgSend_null(MEMORY[0x263EFF9D0], v76, v77, v78, v79),
                                uint64_t v80 = objc_claimAutoreleasedReturnValue(),
                                v80,
                                v71 == v80)
                            && (objc_msgSend_null(MEMORY[0x263EFF9D0], v81, v82, v83, v84),
                                uint64_t v85 = objc_claimAutoreleasedReturnValue(),
                                v85,
                                v75 != v85))
                          {

                            int v86 = 0;
                            uint64_t v9 = (v69 + v68);
                            goto LABEL_29;
                          }

                          ++v68;
                        }
                        while (v66 != v68);
                        uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v63, (uint64_t)&v110, (uint64_t)v126, 16);
                        uint64_t v9 = (v69 + v68);
                        if (v66) {
                          continue;
                        }
                        break;
                      }
                      uint64_t v9 = (v69 + v68);
                      int v86 = 1;
LABEL_29:
                      id v20 = v98;
                      uint64_t v27 = v103;
                      uint64_t i = v104;
                      uint64_t v35 = v102;
                    }
                    else
                    {
                      int v86 = 1;
                    }

                    if (!v86)
                    {

                      BOOL v88 = 0;
                      id v6 = v96;
                      goto LABEL_41;
                    }
                  }
                  uint64_t v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v114, (uint64_t)v127, 16);
                  if (v100) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v18 = v95 + 1;
              id v6 = v96;
              uint64_t v17 = v92;
              uint64_t v11 = v93;
            }
            while (v95 + 1 != v94);
            uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v118, (uint64_t)v128, 16);
          }
          while (v94);
        }

        ++v11;
        uint64_t v10 = v91;
      }
      while (v11 != v90);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v87, (uint64_t)&v122, (uint64_t)v129, 16);
      uint64_t v10 = v91;
      BOOL v88 = 1;
    }
    while (v8);
  }
  else
  {
    BOOL v88 = 1;
  }
LABEL_41:

  return v88;
}

- (NSDictionary)syntheticData
{
  return self->_syntheticData;
}

- (void)setSyntheticData:(id)a3
{
}

- (NSString)readCategory
{
  return self->_readCategory;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (NSDictionary)eventStore
{
  return self->_eventStore;
}

- (NSString)datasetName
{
  return self->_datasetName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasetName, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_readCategory, 0);
  objc_storeStrong((id *)&self->_syntheticData, 0);
}

@end