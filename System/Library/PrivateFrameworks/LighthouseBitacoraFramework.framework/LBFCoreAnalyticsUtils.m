@interface LBFCoreAnalyticsUtils
+ (void)upload:(id)a3;
@end

@implementation LBFCoreAnalyticsUtils

+ (void)upload:(id)a3
{
  v242[20] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v241[0] = @"lighthouseplugin_count_PerformTask_Failed";
  if (objc_msgSend_hasCountPerformTaskFailed(v3, v4, v5, v6, v7))
  {
    v12 = NSNumber;
    uint64_t v13 = objc_msgSend_countPerformTaskFailed(v3, v8, v9, v10, v11);
    objc_msgSend_numberWithUnsignedInt_(v12, v14, v13, v15, v16);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v8, v9, v10, v11);
  v239 = };
  v242[0] = v239;
  v241[1] = @"lighthouseplugin_count_PerformTask_Succeeded";
  if (objc_msgSend_hasCountPerformTaskSucceeded(v3, v17, v18, v19, v20))
  {
    v25 = NSNumber;
    uint64_t v26 = objc_msgSend_countPerformTaskSucceeded(v3, v21, v22, v23, v24);
    objc_msgSend_numberWithUnsignedInt_(v25, v27, v26, v28, v29);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v21, v22, v23, v24);
  v238 = };
  v242[1] = v238;
  v241[2] = @"lighthouseplugin_count_Stop_Failed";
  if (objc_msgSend_hasCountStopFailed(v3, v30, v31, v32, v33))
  {
    v38 = NSNumber;
    uint64_t v39 = objc_msgSend_countStopFailed(v3, v34, v35, v36, v37);
    objc_msgSend_numberWithUnsignedInt_(v38, v40, v39, v41, v42);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v34, v35, v36, v37);
  v237 = };
  v242[2] = v237;
  v241[3] = @"lighthouseplugin_count_Stop_Succeeded";
  if (objc_msgSend_hasCountStopSucceeded(v3, v43, v44, v45, v46))
  {
    v51 = NSNumber;
    uint64_t v52 = objc_msgSend_countStopSucceeded(v3, v47, v48, v49, v50);
    objc_msgSend_numberWithUnsignedInt_(v51, v53, v52, v54, v55);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v47, v48, v49, v50);
  v236 = };
  v242[3] = v236;
  v241[4] = @"mlruntimedevent_count_TaskCompleted_Failed";
  if (objc_msgSend_hasCountTaskCompletedFailed(v3, v56, v57, v58, v59))
  {
    v64 = NSNumber;
    uint64_t v65 = objc_msgSend_countTaskCompletedFailed(v3, v60, v61, v62, v63);
    objc_msgSend_numberWithUnsignedInt_(v64, v66, v65, v67, v68);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v60, v61, v62, v63);
  v235 = };
  v242[4] = v235;
  v241[5] = @"mlruntimedevent_count_TaskCompleted_Succeeded";
  if (objc_msgSend_hasCountTaskCompletedSucceeded(v3, v69, v70, v71, v72))
  {
    v77 = NSNumber;
    uint64_t v78 = objc_msgSend_countTaskCompletedSucceeded(v3, v73, v74, v75, v76);
    objc_msgSend_numberWithUnsignedInt_(v77, v79, v78, v80, v81);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v73, v74, v75, v76);
  v234 = };
  v242[5] = v234;
  v241[6] = @"mlruntimedevent_count_TaskFetched_Failed";
  if (objc_msgSend_hasCountTaskFetchedFailed(v3, v82, v83, v84, v85))
  {
    v90 = NSNumber;
    uint64_t v91 = objc_msgSend_countTaskFetchedFailed(v3, v86, v87, v88, v89);
    objc_msgSend_numberWithUnsignedInt_(v90, v92, v91, v93, v94);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v86, v87, v88, v89);
  v233 = };
  v242[6] = v233;
  v241[7] = @"mlruntimedevent_count_TaskFetched_Succeeded";
  if (objc_msgSend_hasCountTaskFetchedSucceeded(v3, v95, v96, v97, v98))
  {
    v103 = NSNumber;
    uint64_t v104 = objc_msgSend_countTaskFetchedSucceeded(v3, v99, v100, v101, v102);
    objc_msgSend_numberWithUnsignedInt_(v103, v105, v104, v106, v107);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v99, v100, v101, v102);
  v232 = };
  v242[7] = v232;
  v241[8] = @"mlruntimedevent_count_TaskScheduled_Failed";
  if (objc_msgSend_hasCountTaskScheduledFailed(v3, v108, v109, v110, v111))
  {
    v116 = NSNumber;
    uint64_t v117 = objc_msgSend_countTaskScheduledFailed(v3, v112, v113, v114, v115);
    objc_msgSend_numberWithUnsignedInt_(v116, v118, v117, v119, v120);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v112, v113, v114, v115);
  v231 = };
  v242[8] = v231;
  v241[9] = @"mlruntimedevent_count_TaskScheduled_Succeeded";
  if (objc_msgSend_hasCountTaskScheduledSucceeded(v3, v121, v122, v123, v124))
  {
    v129 = NSNumber;
    uint64_t v130 = objc_msgSend_countTaskScheduledSucceeded(v3, v125, v126, v127, v128);
    objc_msgSend_numberWithUnsignedInt_(v129, v131, v130, v132, v133);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v125, v126, v127, v128);
  v230 = };
  v242[9] = v230;
  v241[10] = @"trialdevent_is_activated";
  if (objc_msgSend_hasIsActivated(v3, v134, v135, v136, v137))
  {
    v142 = NSNumber;
    uint64_t isActivated = objc_msgSend_isActivated(v3, v138, v139, v140, v141);
    objc_msgSend_numberWithBool_(v142, v144, isActivated, v145, v146);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v138, v139, v140, v141);
  v229 = };
  v242[10] = v229;
  v241[11] = @"trialdevent_is_allocated";
  if (objc_msgSend_hasIsAllocated(v3, v147, v148, v149, v150))
  {
    v155 = NSNumber;
    uint64_t isAllocated = objc_msgSend_isAllocated(v3, v151, v152, v153, v154);
    objc_msgSend_numberWithBool_(v155, v157, isAllocated, v158, v159);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v151, v152, v153, v154);
  v228 = };
  v242[11] = v228;
  v241[12] = @"trial_BMLTTaskId";
  if (objc_msgSend_hasTrialTaskID(v3, v160, v161, v162, v163)) {
    objc_msgSend_trialTaskID(v3, v164, v165, v166, v167);
  }
  else {
  v168 = objc_msgSend_null(MEMORY[0x263EFF9D0], v164, v165, v166, v167);
  }
  v242[12] = v168;
  v241[13] = @"trial_deploymentId";
  if (objc_msgSend_hasTrialDeploymentID(v3, v169, v170, v171, v172)) {
    objc_msgSend_trialDeploymentID(v3, v173, v174, v175, v176);
  }
  else {
  v177 = objc_msgSend_null(MEMORY[0x263EFF9D0], v173, v174, v175, v176);
  }
  v242[13] = v177;
  v241[14] = @"trial_experimentId";
  if (objc_msgSend_hasTrialExperimentID(v3, v178, v179, v180, v181)) {
    objc_msgSend_trialExperimentID(v3, v182, v183, v184, v185);
  }
  else {
  v186 = objc_msgSend_null(MEMORY[0x263EFF9D0], v182, v183, v184, v185);
  }
  v242[14] = v186;
  v241[15] = @"trial_treatmentId";
  if (objc_msgSend_hasTrialTreatmentID(v3, v187, v188, v189, v190)) {
    objc_msgSend_trialTreatmentID(v3, v191, v192, v193, v194);
  }
  else {
  v195 = objc_msgSend_null(MEMORY[0x263EFF9D0], v191, v192, v193, v194);
  }
  v242[15] = v195;
  v241[16] = @"timestamp";
  v196 = NSNumber;
  uint64_t v201 = objc_msgSend_timestamp(v3, v197, v198, v199, v200);
  v205 = objc_msgSend_numberWithUnsignedLongLong_(v196, v202, v201, v203, v204);
  v242[16] = v205;
  v241[17] = @"timestamp_str";
  v206 = NSString;
  uint64_t v211 = objc_msgSend_timestamp(v3, v207, v208, v209, v210);
  v215 = objc_msgSend_stringWithFormat_(v206, v212, @"%llu", v213, v214, v211);
  v242[17] = v215;
  v241[18] = @"telemetryID";
  v220 = objc_msgSend_telemetryID(v3, v216, v217, v218, v219);
  v242[18] = v220;
  v241[19] = @"contextID";
  v225 = objc_msgSend_contextID(v3, v221, v222, v223, v224);
  v242[19] = v225;
  v227 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v226, (uint64_t)v242, (uint64_t)v241, 20);

  id v240 = v227;
  AnalyticsSendEventLazy();
}

@end