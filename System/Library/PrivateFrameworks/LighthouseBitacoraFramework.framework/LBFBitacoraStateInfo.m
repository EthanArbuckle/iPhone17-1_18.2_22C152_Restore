@interface LBFBitacoraStateInfo
+ (id)getCAEventDictionaryFromBiomeEvent:(id)a3;
- (BMLighthouseLedgerTrialIdentifiers)trialIdentifiers;
- (BOOL)isActivated_implicit;
- (BOOL)isAllocated_implicit;
- (BOOL)uploadRawEventsToCoreAnalytics;
- (BOOL)uploadToCoreAnalytics;
- (BOOL)uploadToDedisco;
- (LBFBitacoraStateInfo)initWithBitcoraState:(id)a3 bucketStartTime:(id)a4 bucketEndTime:(id)a5 observedTrialStatus:(id)a6 bitacoraStateTransitions:(id)a7 bitacoraEvents:(id)a8;
- (LBFBitacoraStateInfo)initWithBitcoraStateMLHost:(id)a3 bucketStartTime:(id)a4 bucketEndTime:(id)a5 observedTrialStatus:(id)a6 bitacoraStateTransitions:(id)a7 bitacoraEvents:(id)a8;
- (NSArray)bitacoraEvents;
- (NSArray)bitacoraStateTransitions;
- (NSDate)bucketEndTime;
- (NSDate)bucketStartTime;
- (NSDate)timestamp_Activated_Failed;
- (NSDate)timestamp_Activated_Succeeded;
- (NSDate)timestamp_Allocated_Failed;
- (NSDate)timestamp_Allocated_Succeeded;
- (NSDate)timestamp_Deactivated_Failed;
- (NSDate)timestamp_Deactivated_Succeeded;
- (NSDate)timestamp_DprivacydBudgetCheck_Failed;
- (NSDate)timestamp_DprivacydBudgetCheck_Succeeded;
- (NSDate)timestamp_DprivacydDonationReceived_Failed;
- (NSDate)timestamp_DprivacydDonationReceived_Succeeded;
- (NSDate)timestamp_DprivacydPayloadCreation_Failed;
- (NSDate)timestamp_DprivacydPayloadCreation_Succeeded;
- (NSDate)timestamp_DprivacydRandomization_Failed;
- (NSDate)timestamp_DprivacydRandomization_Succeeded;
- (NSDate)timestamp_DprivacydUpload_Failed;
- (NSDate)timestamp_DprivacydUpload_Succeeded;
- (NSDate)timestamp_PerformTask_Failed;
- (NSDate)timestamp_PerformTask_Succeeded;
- (NSDate)timestamp_Stop_Failed;
- (NSDate)timestamp_Stop_Succeeded;
- (NSDate)timestamp_TaskCompleted_Failed;
- (NSDate)timestamp_TaskCompleted_Succeeded;
- (NSDate)timestamp_TaskFetched_Failed;
- (NSDate)timestamp_TaskFetched_Succeeded;
- (NSDate)timestamp_TaskScheduled_Failed;
- (NSDate)timestamp_TaskScheduled_Succeeded;
- (NSMutableArray)timedeltas_To_State_Activated;
- (NSMutableArray)timedeltas_To_State_ActivatedFailed;
- (NSMutableArray)timedeltas_To_State_Allocated;
- (NSMutableArray)timedeltas_To_State_AllocatedFailed;
- (NSMutableArray)timedeltas_To_State_Deactivated;
- (NSMutableArray)timedeltas_To_State_DeactivatedFailed;
- (NSMutableArray)timedeltas_To_State_DprivacydBudgetCheck;
- (NSMutableArray)timedeltas_To_State_DprivacydBudgetCheckFailed;
- (NSMutableArray)timedeltas_To_State_DprivacydDonationReceived;
- (NSMutableArray)timedeltas_To_State_DprivacydDonationReceivedFailed;
- (NSMutableArray)timedeltas_To_State_DprivacydPayloadCreation;
- (NSMutableArray)timedeltas_To_State_DprivacydPayloadCreationFailed;
- (NSMutableArray)timedeltas_To_State_DprivacydRandomization;
- (NSMutableArray)timedeltas_To_State_DprivacydRandomizationFailed;
- (NSMutableArray)timedeltas_To_State_DprivacydUpload;
- (NSMutableArray)timedeltas_To_State_DprivacydUploadFailed;
- (NSMutableArray)timedeltas_To_State_PerformTask;
- (NSMutableArray)timedeltas_To_State_PerformTaskFailed;
- (NSMutableArray)timedeltas_To_State_PluginStop;
- (NSMutableArray)timedeltas_To_State_PluginStopFailed;
- (NSMutableArray)timedeltas_To_State_TaskCompleted;
- (NSMutableArray)timedeltas_To_State_TaskCompletedFailed;
- (NSMutableArray)timedeltas_To_State_TaskFetched;
- (NSMutableArray)timedeltas_To_State_TaskFetchedFailed;
- (NSMutableArray)timedeltas_To_State_TaskScheduled;
- (NSMutableArray)timedeltas_To_State_TaskScheduledFailed;
- (NSMutableArray)timedeltas_To_State_Unexpeted;
- (NSNumber)count_Activated_Failed;
- (NSNumber)count_Activated_Succeeded;
- (NSNumber)count_Allocated_Failed;
- (NSNumber)count_Allocated_Succeeded;
- (NSNumber)count_Deactivated_Failed;
- (NSNumber)count_Deactivated_Succeeded;
- (NSNumber)count_DprivacydBudgetCheck_Failed;
- (NSNumber)count_DprivacydBudgetCheck_Succeeded;
- (NSNumber)count_DprivacydDonationReceived_Failed;
- (NSNumber)count_DprivacydDonationReceived_Succeeded;
- (NSNumber)count_DprivacydPayloadCreation_Failed;
- (NSNumber)count_DprivacydPayloadCreation_Succeeded;
- (NSNumber)count_DprivacydRandomization_Failed;
- (NSNumber)count_DprivacydRandomization_Succeeded;
- (NSNumber)count_DprivacydUpload_Failed;
- (NSNumber)count_DprivacydUpload_Succeeded;
- (NSNumber)count_PerformTask_Failed;
- (NSNumber)count_PerformTask_Succeeded;
- (NSNumber)count_Stop_Failed;
- (NSNumber)count_Stop_Succeeded;
- (NSNumber)count_TaskCompleted_Failed;
- (NSNumber)count_TaskCompleted_Succeeded;
- (NSNumber)count_TaskFetched_Failed;
- (NSNumber)count_TaskFetched_Succeeded;
- (NSNumber)count_TaskScheduled_Failed;
- (NSNumber)count_TaskScheduled_Succeeded;
- (NSNumber)isActivated;
- (NSNumber)isAllocated;
- (NSString)stateId;
- (NSUUID)contextId;
- (id)addMLHostMarkerToString:(id)a3;
- (id)getDictionaryRepresentation;
- (id)getPETState;
- (id)maxTimedelta_To_State_Activated;
- (id)maxTimedelta_To_State_ActivatedFailed;
- (id)maxTimedelta_To_State_Allocated;
- (id)maxTimedelta_To_State_AllocatedFailed;
- (id)maxTimedelta_To_State_Deativated;
- (id)maxTimedelta_To_State_DeativatedFailed;
- (id)maxTimedelta_To_State_DprivacydBudgetCheck;
- (id)maxTimedelta_To_State_DprivacydBudgetCheckFailed;
- (id)maxTimedelta_To_State_DprivacydDonationReceived;
- (id)maxTimedelta_To_State_DprivacydDonationReceivedFailed;
- (id)maxTimedelta_To_State_DprivacydPayloadCreation;
- (id)maxTimedelta_To_State_DprivacydPayloadCreationFailed;
- (id)maxTimedelta_To_State_DprivacydRandomization;
- (id)maxTimedelta_To_State_DprivacydRandomizationFailed;
- (id)maxTimedelta_To_State_DprivacydUpload;
- (id)maxTimedelta_To_State_DprivacydUploadFailed;
- (id)maxTimedelta_To_State_PerformTask;
- (id)maxTimedelta_To_State_PerformTaskFailed;
- (id)maxTimedelta_To_State_TaskCompleted;
- (id)maxTimedelta_To_State_TaskCompletedFailed;
- (id)maxTimedelta_To_State_TaskFetched;
- (id)maxTimedelta_To_State_TaskFetchedFailed;
- (id)maxTimedelta_To_State_TaskScheduled;
- (id)maxTimedelta_To_State_TaskScheduledFailed;
- (id)maxTimedelta_To_State_Unexpeted;
- (int64_t)latestState;
- (void)iterateEvents;
- (void)iterateTransitions;
- (void)setIsActivated_implicit:(BOOL)a3;
- (void)setIsAllocated_implicit:(BOOL)a3;
- (void)setLatestState:(int64_t)a3;
@end

@implementation LBFBitacoraStateInfo

- (LBFBitacoraStateInfo)initWithBitcoraState:(id)a3 bucketStartTime:(id)a4 bucketEndTime:(id)a5 observedTrialStatus:(id)a6 bitacoraStateTransitions:(id)a7 bitacoraEvents:(id)a8
{
  id v15 = a3;
  id v77 = a4;
  id v76 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v79.receiver = self;
  v79.super_class = (Class)LBFBitacoraStateInfo;
  v19 = [(LBFBitacoraStateInfo *)&v79 init];
  if (v19)
  {
    LBFLoggingUtilsInit();
    objc_storeStrong((id *)&v19->_bitacoraStateTransitions, a7);
    objc_storeStrong((id *)&v19->_bitacoraEvents, a8);
    v24 = objc_msgSend_UUID(MEMORY[0x263F08C38], v20, v21, v22, v23, v76, v77);
    uint64_t v29 = objc_msgSend_UUIDString(v24, v25, v26, v27, v28);
    stateId = v19->_stateId;
    v19->_stateId = (NSString *)v29;

    objc_storeStrong((id *)&v19->_trialIdentifiers, a3);
    uint64_t v35 = objc_msgSend_getContextId(LBFContextId, v31, v32, v33, v34);
    contextId = v19->_contextId;
    v19->_contextId = (NSUUID *)v35;

    uint64_t v41 = objc_msgSend_isActivated(v16, v37, v38, v39, v40);
    isActivated = v19->_isActivated;
    v19->_isActivated = (NSNumber *)v41;

    uint64_t v47 = objc_msgSend_isAllocated(v16, v43, v44, v45, v46);
    isAllocated = v19->_isAllocated;
    v19->_isAllocated = (NSNumber *)v47;

    v19->_isActivated_implicit = objc_msgSend_isActivated_implicit(v16, v49, v50, v51, v52);
    v19->_isAllocated_implicit = objc_msgSend_isAllocated_implicit(v16, v53, v54, v55, v56);
    objc_storeStrong((id *)&v19->_bucketStartTime, a4);
    objc_storeStrong((id *)&v19->_bucketEndTime, a5);
    if (objc_msgSend_count(v17, v57, v58, v59, v60))
    {
      v65 = objc_msgSend_lastObject(v17, v61, v62, v63, v64);
      v19->_latestState = objc_msgSend_state(v65, v66, v67, v68, v69);

      if (v19->_latestState == 8)
      {
        v70 = LBFLogContextBitacoraStateInfo;
        if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_254547000, v70, OS_LOG_TYPE_INFO, "LBFBitacoraState_Unexpected state", buf, 2u);
        }
      }
    }
    else
    {
      v19->_latestState = 0;
    }
    if (v15) {
      objc_msgSend_IsEmptyTrialIdentifiers_(LBFUtils, v61, (uint64_t)v15, v63, v64);
    }
    objc_msgSend_iterateEvents(v19, v61, v62, v63, v64);
    objc_msgSend_iterateTransitions(v19, v71, v72, v73, v74);
  }

  return v19;
}

- (LBFBitacoraStateInfo)initWithBitcoraStateMLHost:(id)a3 bucketStartTime:(id)a4 bucketEndTime:(id)a5 observedTrialStatus:(id)a6 bitacoraStateTransitions:(id)a7 bitacoraEvents:(id)a8
{
  started = (uint64_t *)objc_msgSend_initWithBitcoraState_bucketStartTime_bucketEndTime_observedTrialStatus_bitacoraStateTransitions_bitacoraEvents_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
  v12 = (LBFBitacoraStateInfo *)started;
  if (started)
  {
    uint64_t v13 = objc_msgSend_addMLHostMarkerToString_(started, v9, started[2], v10, v11);
    stateId = v12->_stateId;
    v12->_stateId = (NSString *)v13;
  }
  return v12;
}

- (void)iterateEvents
{
  uint64_t v551 = *MEMORY[0x263EF8340];
  long long v544 = 0u;
  long long v545 = 0u;
  long long v546 = 0u;
  long long v547 = 0u;
  v3 = self->_bitacoraEvents;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v544, (uint64_t)v550, 16);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v545;
    v535 = v541;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v545 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v544 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          id v15 = objc_msgSend_timestamp(v10, v11, v12, v13, v14);
          uint64_t v19 = objc_msgSend_compare_(v15, v16, (uint64_t)self->_bucketStartTime, v17, v18);

          if (v19 == -1)
          {
            if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR)) {
              sub_254585190(&v542, v543);
            }
            goto LABEL_82;
          }
          v24 = objc_msgSend_taskFetched(v10, v20, v21, v22, v23);

          if (v24)
          {
            uint64_t v29 = objc_msgSend_taskFetched(v10, v25, v26, v27, v28);
            int v34 = objc_msgSend_succeeded(v29, v30, v31, v32, v33);

            uint64_t v39 = NSNumber;
            if (v34)
            {
              int v40 = objc_msgSend_intValue(self->_count_TaskFetched_Succeeded, v35, v36, v37, v38);
              objc_msgSend_numberWithInt_(v39, v41, (v40 + 1), v42, v43);
              uint64_t v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              count_TaskFetched_Succeeded = self->_count_TaskFetched_Succeeded;
              self->_count_TaskFetched_Succeeded = v44;

              objc_msgSend_timestamp(v10, v46, v47, v48, v49);
              uint64_t v50 = (NSDate *)objc_claimAutoreleasedReturnValue();
              timestamp_TaskFetched_Succeeded = self->_timestamp_TaskFetched_Succeeded;
              self->_timestamp_TaskFetched_Succeeded = v50;
            }
            else
            {
              int v79 = objc_msgSend_intValue(self->_count_TaskFetched_Failed, v35, v36, v37, v38);
              objc_msgSend_numberWithInt_(v39, v80, (v79 + 1), v81, v82);
              v83 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              count_TaskFetched_Failed = self->_count_TaskFetched_Failed;
              self->_count_TaskFetched_Failed = v83;

              objc_msgSend_timestamp(v10, v85, v86, v87, v88);
              v89 = (NSDate *)objc_claimAutoreleasedReturnValue();
              timestamp_TaskFetched_Succeeded = self->_timestamp_TaskFetched_Failed;
              self->_timestamp_TaskFetched_Failed = v89;
            }
            goto LABEL_25;
          }
          uint64_t v52 = objc_msgSend_taskCompleted(v10, v25, v26, v27, v28);

          if (v52)
          {
            v57 = objc_msgSend_taskCompleted(v10, v53, v54, v55, v56);
            int v62 = objc_msgSend_succeeded(v57, v58, v59, v60, v61);

            uint64_t v67 = NSNumber;
            if (v62)
            {
              int v68 = objc_msgSend_intValue(self->_count_TaskCompleted_Succeeded, v63, v64, v65, v66);
              objc_msgSend_numberWithInt_(v67, v69, (v68 + 1), v70, v71);
              uint64_t v72 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              count_TaskCompleted_Succeeded = self->_count_TaskCompleted_Succeeded;
              self->_count_TaskCompleted_Succeeded = v72;

              objc_msgSend_timestamp(v10, v74, v75, v76, v77);
              v78 = (NSDate *)objc_claimAutoreleasedReturnValue();
              timestamp_TaskFetched_Succeeded = self->_timestamp_TaskCompleted_Succeeded;
              self->_timestamp_TaskCompleted_Succeeded = v78;
            }
            else
            {
              int v117 = objc_msgSend_intValue(self->_count_TaskCompleted_Failed, v63, v64, v65, v66);
              objc_msgSend_numberWithInt_(v67, v118, (v117 + 1), v119, v120);
              v121 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              count_TaskCompleted_Failed = self->_count_TaskCompleted_Failed;
              self->_count_TaskCompleted_Failed = v121;

              objc_msgSend_timestamp(v10, v123, v124, v125, v126);
              v127 = (NSDate *)objc_claimAutoreleasedReturnValue();
              timestamp_TaskFetched_Succeeded = self->_timestamp_TaskCompleted_Failed;
              self->_timestamp_TaskCompleted_Failed = v127;
            }
            goto LABEL_25;
          }
          v90 = objc_msgSend_taskScheduled(v10, v53, v54, v55, v56);

          if (v90)
          {
            v95 = objc_msgSend_taskScheduled(v10, v91, v92, v93, v94);
            int v100 = objc_msgSend_succeeded(v95, v96, v97, v98, v99);

            v105 = NSNumber;
            if (v100)
            {
              int v106 = objc_msgSend_intValue(self->_count_TaskScheduled_Succeeded, v101, v102, v103, v104);
              objc_msgSend_numberWithInt_(v105, v107, (v106 + 1), v108, v109);
              v110 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              count_TaskScheduled_Succeeded = self->_count_TaskScheduled_Succeeded;
              self->_count_TaskScheduled_Succeeded = v110;

              objc_msgSend_timestamp(v10, v112, v113, v114, v115);
              v116 = (NSDate *)objc_claimAutoreleasedReturnValue();
              timestamp_TaskFetched_Succeeded = self->_timestamp_TaskScheduled_Succeeded;
              self->_timestamp_TaskScheduled_Succeeded = v116;
            }
            else
            {
              int v129 = objc_msgSend_intValue(self->_count_TaskScheduled_Failed, v101, v102, v103, v104);
              objc_msgSend_numberWithInt_(v105, v130, (v129 + 1), v131, v132);
              v133 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              count_TaskScheduled_Failed = self->_count_TaskScheduled_Failed;
              self->_count_TaskScheduled_Failed = v133;

              objc_msgSend_timestamp(v10, v135, v136, v137, v138);
              v139 = (NSDate *)objc_claimAutoreleasedReturnValue();
              timestamp_TaskFetched_Succeeded = self->_timestamp_TaskScheduled_Failed;
              self->_timestamp_TaskScheduled_Failed = v139;
            }
LABEL_25:
          }
          else
          {
            v128 = objc_msgSend_activityScheduleStatus(v10, v91, v92, v93, v94);

            if (!v128 && os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR)) {
              sub_2545852DC(&v540, v535);
            }
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_40;
        }
        id v140 = v9;
        v145 = objc_msgSend_timestamp(v140, v141, v142, v143, v144);
        uint64_t v149 = objc_msgSend_compare_(v145, v146, (uint64_t)self->_bucketStartTime, v147, v148);

        if (v149 == -1)
        {
          if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR)) {
            sub_2545851BC(&v538, v539);
          }
          goto LABEL_82;
        }
        v154 = objc_msgSend_performTaskStatus(v140, v150, v151, v152, v153);

        if (v154)
        {
          v159 = objc_msgSend_performTaskStatus(v140, v155, v156, v157, v158);
          goto LABEL_35;
        }
        v164 = objc_msgSend_performTrialTaskStatus(v140, v155, v156, v157, v158);

        if (v164)
        {
          v159 = objc_msgSend_performTrialTaskStatus(v140, v165, v166, v167, v168);
LABEL_35:
          v169 = v159;
          int v170 = objc_msgSend_succeeded(v159, v160, v161, v162, v163, v535);

          v175 = NSNumber;
          if (v170)
          {
            int v176 = objc_msgSend_intValue(self->_count_PerformTask_Succeeded, v171, v172, v173, v174);
            objc_msgSend_numberWithInt_(v175, v177, (v176 + 1), v178, v179);
            v180 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            count_PerformTask_Succeeded = self->_count_PerformTask_Succeeded;
            self->_count_PerformTask_Succeeded = v180;

            objc_msgSend_timestamp(v140, v182, v183, v184, v185);
            v186 = (NSDate *)objc_claimAutoreleasedReturnValue();
            timestamp_PerformTask_Succeeded = self->_timestamp_PerformTask_Succeeded;
            self->_timestamp_PerformTask_Succeeded = v186;
          }
          else
          {
            int v188 = objc_msgSend_intValue(self->_count_PerformTask_Failed, v171, v172, v173, v174);
            objc_msgSend_numberWithInt_(v175, v189, (v188 + 1), v190, v191);
            v192 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            count_PerformTask_Failed = self->_count_PerformTask_Failed;
            self->_count_PerformTask_Failed = v192;

            objc_msgSend_timestamp(v140, v194, v195, v196, v197);
            v198 = (NSDate *)objc_claimAutoreleasedReturnValue();
            timestamp_PerformTask_Succeeded = self->_timestamp_PerformTask_Failed;
            self->_timestamp_PerformTask_Failed = v198;
          }
          goto LABEL_38;
        }
        v271 = objc_msgSend_stop(v140, v165, v166, v167, v168);

        if (!v271)
        {
          if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR)) {
            sub_2545852B0(&v536, v537);
          }
          goto LABEL_39;
        }
        v276 = objc_msgSend_stop(v140, v272, v273, v274, v275);
        int v281 = objc_msgSend_succeeded(v276, v277, v278, v279, v280);

        v286 = NSNumber;
        if (v281)
        {
          int v287 = objc_msgSend_intValue(self->_count_Stop_Succeeded, v282, v283, v284, v285);
          objc_msgSend_numberWithInt_(v286, v288, (v287 + 1), v289, v290);
          v291 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          count_Stop_Succeeded = self->_count_Stop_Succeeded;
          self->_count_Stop_Succeeded = v291;

          objc_msgSend_timestamp(v140, v293, v294, v295, v296);
          v297 = (NSDate *)objc_claimAutoreleasedReturnValue();
          timestamp_PerformTask_Succeeded = self->_timestamp_Stop_Succeeded;
          self->_timestamp_Stop_Succeeded = v297;
        }
        else
        {
          int v523 = objc_msgSend_intValue(self->_count_Stop_Failed, v282, v283, v284, v285);
          objc_msgSend_numberWithInt_(v286, v524, (v523 + 1), v525, v526);
          v527 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          count_Stop_Failed = self->_count_Stop_Failed;
          self->_count_Stop_Failed = v527;

          objc_msgSend_timestamp(v140, v529, v530, v531, v532);
          v533 = (NSDate *)objc_claimAutoreleasedReturnValue();
          timestamp_PerformTask_Succeeded = self->_timestamp_Stop_Failed;
          self->_timestamp_Stop_Failed = v533;
        }
LABEL_38:

LABEL_39:
LABEL_40:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v199 = v9;
          v204 = objc_msgSend_timestamp(v199, v200, v201, v202, v203);
          uint64_t v208 = objc_msgSend_compare_(v204, v205, (uint64_t)self->_bucketStartTime, v206, v207);

          if (v208 == -1) {
            goto LABEL_82;
          }
          int v213 = objc_msgSend_eventType(v199, v209, v210, v211, v212);
          switch(v213)
          {
            case 1:
              int v253 = objc_msgSend_eventSucceeded(v199, v214, v215, v216, v217);
              v258 = NSNumber;
              if (v253)
              {
                int v259 = objc_msgSend_intValue(self->_count_Allocated_Succeeded, v254, v255, v256, v257);
                objc_msgSend_numberWithInt_(v258, v260, (v259 + 1), v261, v262);
                v263 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_Allocated_Succeeded = self->_count_Allocated_Succeeded;
                self->_count_Allocated_Succeeded = v263;

                objc_msgSend_timestamp(v199, v265, v266, v267, v268);
                v269 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_Allocated_Succeeded = self->_timestamp_Allocated_Succeeded;
                self->_timestamp_Allocated_Succeeded = v269;
              }
              else
              {
                int v320 = objc_msgSend_intValue(self->_count_Allocated_Failed, v254, v255, v256, v257);
                objc_msgSend_numberWithInt_(v258, v321, (v320 + 1), v322, v323);
                v324 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_Allocated_Failed = self->_count_Allocated_Failed;
                self->_count_Allocated_Failed = v324;

                objc_msgSend_timestamp(v199, v326, v327, v328, v329);
                v330 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_Allocated_Succeeded = self->_timestamp_Allocated_Failed;
                self->_timestamp_Allocated_Failed = v330;
              }
              break;
            case 3:
              int v236 = objc_msgSend_eventSucceeded(v199, v214, v215, v216, v217);
              v241 = NSNumber;
              if (v236)
              {
                int v242 = objc_msgSend_intValue(self->_count_Deactivated_Succeeded, v237, v238, v239, v240);
                objc_msgSend_numberWithInt_(v241, v243, (v242 + 1), v244, v245);
                v246 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_Deactivated_Succeeded = self->_count_Deactivated_Succeeded;
                self->_count_Deactivated_Succeeded = v246;

                objc_msgSend_timestamp(v199, v248, v249, v250, v251);
                v252 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_Allocated_Succeeded = self->_timestamp_Deactivated_Succeeded;
                self->_timestamp_Deactivated_Succeeded = v252;
              }
              else
              {
                int v298 = objc_msgSend_intValue(self->_count_Deactivated_Failed, v237, v238, v239, v240);
                objc_msgSend_numberWithInt_(v241, v299, (v298 + 1), v300, v301);
                v302 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_Deactivated_Failed = self->_count_Deactivated_Failed;
                self->_count_Deactivated_Failed = v302;

                objc_msgSend_timestamp(v199, v304, v305, v306, v307);
                v308 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_Allocated_Succeeded = self->_timestamp_Deactivated_Failed;
                self->_timestamp_Deactivated_Failed = v308;
              }
              break;
            case 2:
              int v218 = objc_msgSend_eventSucceeded(v199, v214, v215, v216, v217);
              v223 = NSNumber;
              if (v218)
              {
                int v224 = objc_msgSend_intValue(self->_count_Activated_Succeeded, v219, v220, v221, v222);
                objc_msgSend_numberWithInt_(v223, v225, (v224 + 1), v226, v227);
                v228 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_Activated_Succeeded = self->_count_Activated_Succeeded;
                self->_count_Activated_Succeeded = v228;

                objc_msgSend_timestamp(v199, v230, v231, v232, v233);
                v234 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_Allocated_Succeeded = self->_timestamp_Activated_Succeeded;
                self->_timestamp_Activated_Succeeded = v234;
              }
              else
              {
                int v309 = objc_msgSend_intValue(self->_count_Activated_Failed, v219, v220, v221, v222);
                objc_msgSend_numberWithInt_(v223, v310, (v309 + 1), v311, v312);
                v313 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_Activated_Failed = self->_count_Activated_Failed;
                self->_count_Activated_Failed = v313;

                objc_msgSend_timestamp(v199, v315, v316, v317, v318);
                v319 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_Allocated_Succeeded = self->_timestamp_Activated_Failed;
                self->_timestamp_Activated_Failed = v319;
              }
              break;
            default:
              v270 = (void *)LBFLogContextBitacoraStateInfo;
              if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR)) {
                sub_254585254((uint64_t)v549, v270);
              }
LABEL_60:

              goto LABEL_61;
          }

          goto LABEL_60;
        }
LABEL_61:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_83;
        }
        id v332 = v9;
        v337 = objc_msgSend_timestamp(v332, v333, v334, v335, v336);
        uint64_t v341 = objc_msgSend_compare_(v337, v338, (uint64_t)self->_bucketStartTime, v339, v340);

        if (v341 != -1)
        {
          v346 = objc_msgSend_event(v332, v342, v343, v344, v345);
          int v351 = objc_msgSend_phase(v346, v347, v348, v349, v350);

          switch(v351)
          {
            case 1:
              v356 = objc_msgSend_event(v332, v352, v353, v354, v355);
              int v361 = objc_msgSend_succeeded(v356, v357, v358, v359, v360);

              v366 = NSNumber;
              if (v361)
              {
                int v367 = objc_msgSend_intValue(self->_count_DprivacydDonationReceived_Succeeded, v362, v363, v364, v365);
                objc_msgSend_numberWithInt_(v366, v368, (v367 + 1), v369, v370);
                v371 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydDonationReceived_Succeeded = self->_count_DprivacydDonationReceived_Succeeded;
                self->_count_DprivacydDonationReceived_Succeeded = v371;

                objc_msgSend_timestamp(v332, v373, v374, v375, v376);
                v377 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydDonationReceived_Succeeded;
                self->_timestamp_DprivacydDonationReceived_Succeeded = v377;
              }
              else
              {
                int v468 = objc_msgSend_intValue(self->_count_DprivacydDonationReceived_Failed, v362, v363, v364, v365);
                objc_msgSend_numberWithInt_(v366, v469, (v468 + 1), v470, v471);
                v472 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydDonationReceived_Failed = self->_count_DprivacydDonationReceived_Failed;
                self->_count_DprivacydDonationReceived_Failed = v472;

                objc_msgSend_timestamp(v332, v474, v475, v476, v477);
                v478 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydDonationReceived_Failed;
                self->_timestamp_DprivacydDonationReceived_Failed = v478;
              }
              goto LABEL_81;
            case 2:
              v380 = objc_msgSend_event(v332, v352, v353, v354, v355);
              int v385 = objc_msgSend_succeeded(v380, v381, v382, v383, v384);

              v390 = NSNumber;
              if (v385)
              {
                int v391 = objc_msgSend_intValue(self->_count_DprivacydRandomization_Succeeded, v386, v387, v388, v389);
                objc_msgSend_numberWithInt_(v390, v392, (v391 + 1), v393, v394);
                v395 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydRandomization_Succeeded = self->_count_DprivacydRandomization_Succeeded;
                self->_count_DprivacydRandomization_Succeeded = v395;

                objc_msgSend_timestamp(v332, v397, v398, v399, v400);
                v401 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydRandomization_Succeeded;
                self->_timestamp_DprivacydRandomization_Succeeded = v401;
              }
              else
              {
                int v479 = objc_msgSend_intValue(self->_count_DprivacydRandomization_Failed, v386, v387, v388, v389);
                objc_msgSend_numberWithInt_(v390, v480, (v479 + 1), v481, v482);
                v483 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydRandomization_Failed = self->_count_DprivacydRandomization_Failed;
                self->_count_DprivacydRandomization_Failed = v483;

                objc_msgSend_timestamp(v332, v485, v486, v487, v488);
                v489 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydRandomization_Failed;
                self->_timestamp_DprivacydRandomization_Failed = v489;
              }
              goto LABEL_81;
            case 3:
              v402 = objc_msgSend_event(v332, v352, v353, v354, v355);
              int v407 = objc_msgSend_succeeded(v402, v403, v404, v405, v406);

              v412 = NSNumber;
              if (v407)
              {
                int v413 = objc_msgSend_intValue(self->_count_DprivacydBudgetCheck_Succeeded, v408, v409, v410, v411);
                objc_msgSend_numberWithInt_(v412, v414, (v413 + 1), v415, v416);
                v417 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydBudgetCheck_Succeeded = self->_count_DprivacydBudgetCheck_Succeeded;
                self->_count_DprivacydBudgetCheck_Succeeded = v417;

                objc_msgSend_timestamp(v332, v419, v420, v421, v422);
                v423 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydBudgetCheck_Succeeded;
                self->_timestamp_DprivacydBudgetCheck_Succeeded = v423;
              }
              else
              {
                int v490 = objc_msgSend_intValue(self->_count_DprivacydBudgetCheck_Failed, v408, v409, v410, v411);
                objc_msgSend_numberWithInt_(v412, v491, (v490 + 1), v492, v493);
                v494 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydBudgetCheck_Failed = self->_count_DprivacydBudgetCheck_Failed;
                self->_count_DprivacydBudgetCheck_Failed = v494;

                objc_msgSend_timestamp(v332, v496, v497, v498, v499);
                v500 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydBudgetCheck_Failed;
                self->_timestamp_DprivacydBudgetCheck_Failed = v500;
              }
              goto LABEL_81;
            case 4:
              v424 = objc_msgSend_event(v332, v352, v353, v354, v355);
              int v429 = objc_msgSend_succeeded(v424, v425, v426, v427, v428);

              v434 = NSNumber;
              if (v429)
              {
                int v435 = objc_msgSend_intValue(self->_count_DprivacydPayloadCreation_Succeeded, v430, v431, v432, v433);
                objc_msgSend_numberWithInt_(v434, v436, (v435 + 1), v437, v438);
                v439 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydPayloadCreation_Succeeded = self->_count_DprivacydPayloadCreation_Succeeded;
                self->_count_DprivacydPayloadCreation_Succeeded = v439;

                objc_msgSend_timestamp(v332, v441, v442, v443, v444);
                v445 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydPayloadCreation_Succeeded;
                self->_timestamp_DprivacydPayloadCreation_Succeeded = v445;
              }
              else
              {
                int v501 = objc_msgSend_intValue(self->_count_DprivacydPayloadCreation_Failed, v430, v431, v432, v433);
                objc_msgSend_numberWithInt_(v434, v502, (v501 + 1), v503, v504);
                v505 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydPayloadCreation_Failed = self->_count_DprivacydPayloadCreation_Failed;
                self->_count_DprivacydPayloadCreation_Failed = v505;

                objc_msgSend_timestamp(v332, v507, v508, v509, v510);
                v511 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydPayloadCreation_Failed;
                self->_timestamp_DprivacydPayloadCreation_Failed = v511;
              }
              goto LABEL_81;
            case 5:
              v446 = objc_msgSend_event(v332, v352, v353, v354, v355);
              int v451 = objc_msgSend_succeeded(v446, v447, v448, v449, v450);

              v456 = NSNumber;
              if (v451)
              {
                int v457 = objc_msgSend_intValue(self->_count_DprivacydUpload_Succeeded, v452, v453, v454, v455);
                objc_msgSend_numberWithInt_(v456, v458, (v457 + 1), v459, v460);
                v461 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydUpload_Succeeded = self->_count_DprivacydUpload_Succeeded;
                self->_count_DprivacydUpload_Succeeded = v461;

                objc_msgSend_timestamp(v332, v463, v464, v465, v466);
                v467 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydUpload_Succeeded;
                self->_timestamp_DprivacydUpload_Succeeded = v467;
              }
              else
              {
                int v512 = objc_msgSend_intValue(self->_count_DprivacydUpload_Failed, v452, v453, v454, v455);
                objc_msgSend_numberWithInt_(v456, v513, (v512 + 1), v514, v515);
                v516 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydUpload_Failed = self->_count_DprivacydUpload_Failed;
                self->_count_DprivacydUpload_Failed = v516;

                objc_msgSend_timestamp(v332, v518, v519, v520, v521);
                v522 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydUpload_Failed;
                self->_timestamp_DprivacydUpload_Failed = v522;
              }
LABEL_81:

              break;
            default:
              v379 = (void *)LBFLogContextBitacoraStateInfo;
              if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR)) {
                sub_2545851E8((uint64_t)v548, v379);
              }
              break;
          }
        }
LABEL_82:

LABEL_83:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v534 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v331, (uint64_t)&v544, (uint64_t)v550, 16);
      uint64_t v6 = v534;
    }
    while (v534);
  }
}

- (void)iterateTransitions
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v3 = self->_bitacoraStateTransitions;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v79, (uint64_t)v84, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    uint64_t v11 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v80 != v11) {
          objc_enumerationMutation(v3);
        }
        uint64_t v13 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        switch(objc_msgSend_state(v13, v6, v7, v8, v9, (void)v79))
        {
          case 0:
          case 18:
          case 19:
            continue;
          case 1:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_Allocated;
            if (!timedeltas_To_State_Allocated)
            {
              id v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              id v16 = self->_timedeltas_To_State_Allocated;
              self->_timedeltas_To_State_Allocated = v15;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_Allocated;
            }
            goto LABEL_63;
          case 2:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_Activated;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v54 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_Activated = self->_timedeltas_To_State_Activated;
              self->_timedeltas_To_State_Activated = v54;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_Activated;
            }
            goto LABEL_63;
          case 3:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_Deactivated;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_Deactivated = self->_timedeltas_To_State_Deactivated;
              self->_timedeltas_To_State_Deactivated = v17;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_Deactivated;
            }
            goto LABEL_63;
          case 4:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskFetched;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_TaskFetched = self->_timedeltas_To_State_TaskFetched;
              self->_timedeltas_To_State_TaskFetched = v19;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskFetched;
            }
            goto LABEL_63;
          case 5:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskScheduled;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_TaskScheduled = self->_timedeltas_To_State_TaskScheduled;
              self->_timedeltas_To_State_TaskScheduled = v21;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskScheduled;
            }
            goto LABEL_63;
          case 6:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskCompleted;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v56 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_TaskCompleted = self->_timedeltas_To_State_TaskCompleted;
              self->_timedeltas_To_State_TaskCompleted = v56;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskCompleted;
            }
            goto LABEL_63;
          case 7:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_PerformTask;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v58 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_PerformTask = self->_timedeltas_To_State_PerformTask;
              self->_timedeltas_To_State_PerformTask = v58;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_PerformTask;
            }
            goto LABEL_63;
          case 8:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_Unexpeted;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_Unexpeted = self->_timedeltas_To_State_Unexpeted;
              self->_timedeltas_To_State_Unexpeted = v23;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_Unexpeted;
            }
            goto LABEL_63;
          case 9:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_AllocatedFailed;
            if (!timedeltas_To_State_Allocated)
            {
              v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_AllocatedFailed = self->_timedeltas_To_State_AllocatedFailed;
              self->_timedeltas_To_State_AllocatedFailed = v25;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_AllocatedFailed;
            }
            goto LABEL_63;
          case 10:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_ActivatedFailed;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_ActivatedFailed = self->_timedeltas_To_State_ActivatedFailed;
              self->_timedeltas_To_State_ActivatedFailed = v27;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_ActivatedFailed;
            }
            goto LABEL_63;
          case 11:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DeactivatedFailed;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_DeactivatedFailed = self->_timedeltas_To_State_DeactivatedFailed;
              self->_timedeltas_To_State_DeactivatedFailed = v29;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DeactivatedFailed;
            }
            goto LABEL_63;
          case 12:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskFetchedFailed;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_TaskFetchedFailed = self->_timedeltas_To_State_TaskFetchedFailed;
              self->_timedeltas_To_State_TaskFetchedFailed = v31;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskFetchedFailed;
            }
            goto LABEL_63;
          case 13:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskScheduledFailed;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_TaskScheduledFailed = self->_timedeltas_To_State_TaskScheduledFailed;
              self->_timedeltas_To_State_TaskScheduledFailed = v33;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskScheduledFailed;
            }
            goto LABEL_63;
          case 14:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskCompletedFailed;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v60 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_TaskCompletedFailed = self->_timedeltas_To_State_TaskCompletedFailed;
              self->_timedeltas_To_State_TaskCompletedFailed = v60;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskCompletedFailed;
            }
            goto LABEL_63;
          case 15:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_PerformTaskFailed;
            if (!timedeltas_To_State_Allocated)
            {
              int v62 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_PerformTaskFailed = self->_timedeltas_To_State_PerformTaskFailed;
              self->_timedeltas_To_State_PerformTaskFailed = v62;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_PerformTaskFailed;
            }
            goto LABEL_63;
          case 16:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_PluginStop;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_PluginStop = self->_timedeltas_To_State_PluginStop;
              self->_timedeltas_To_State_PluginStop = v35;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_PluginStop;
            }
            goto LABEL_63;
          case 17:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_PluginStopFailed;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_PluginStopFailed = self->_timedeltas_To_State_PluginStopFailed;
              self->_timedeltas_To_State_PluginStopFailed = v37;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_PluginStopFailed;
            }
            goto LABEL_63;
          case 21:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydDonationReceived;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v64 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_DprivacydDonationReceived = self->_timedeltas_To_State_DprivacydDonationReceived;
              self->_timedeltas_To_State_DprivacydDonationReceived = v64;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydDonationReceived;
            }
            goto LABEL_63;
          case 22:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydRandomization;
            if (!timedeltas_To_State_Allocated)
            {
              int v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_DprivacydRandomization = self->_timedeltas_To_State_DprivacydRandomization;
              self->_timedeltas_To_State_DprivacydRandomization = v40;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydRandomization;
            }
            goto LABEL_63;
          case 23:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydBudgetCheck;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v42 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_DprivacydBudgetCheck = self->_timedeltas_To_State_DprivacydBudgetCheck;
              self->_timedeltas_To_State_DprivacydBudgetCheck = v42;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydBudgetCheck;
            }
            goto LABEL_63;
          case 24:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydPayloadCreation;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v44 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_DprivacydPayloadCreation = self->_timedeltas_To_State_DprivacydPayloadCreation;
              self->_timedeltas_To_State_DprivacydPayloadCreation = v44;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydPayloadCreation;
            }
            goto LABEL_63;
          case 25:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydUpload;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v46 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_DprivacydUpload = self->_timedeltas_To_State_DprivacydUpload;
              self->_timedeltas_To_State_DprivacydUpload = v46;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydUpload;
            }
            goto LABEL_63;
          case 26:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydDonationReceivedFailed;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v48 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_DprivacydDonationReceivedFailed = self->_timedeltas_To_State_DprivacydDonationReceivedFailed;
              self->_timedeltas_To_State_DprivacydDonationReceivedFailed = v48;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydDonationReceivedFailed;
            }
            goto LABEL_63;
          case 27:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydRandomizationFailed;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v66 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_DprivacydRandomizationFailed = self->_timedeltas_To_State_DprivacydRandomizationFailed;
              self->_timedeltas_To_State_DprivacydRandomizationFailed = v66;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydRandomizationFailed;
            }
            goto LABEL_63;
          case 28:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydBudgetCheckFailed;
            if (!timedeltas_To_State_Allocated)
            {
              int v68 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_DprivacydBudgetCheckFailed = self->_timedeltas_To_State_DprivacydBudgetCheckFailed;
              self->_timedeltas_To_State_DprivacydBudgetCheckFailed = v68;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydBudgetCheckFailed;
            }
            goto LABEL_63;
          case 29:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydPayloadCreationFailed;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v50 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_DprivacydPayloadCreationFailed = self->_timedeltas_To_State_DprivacydPayloadCreationFailed;
              self->_timedeltas_To_State_DprivacydPayloadCreationFailed = v50;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydPayloadCreationFailed;
            }
            goto LABEL_63;
          case 30:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydUploadFailed;
            if (!timedeltas_To_State_Allocated)
            {
              uint64_t v52 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
              timedeltas_To_State_DprivacydUploadFailed = self->_timedeltas_To_State_DprivacydUploadFailed;
              self->_timedeltas_To_State_DprivacydUploadFailed = v52;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydUploadFailed;
            }
LABEL_63:
            uint64_t v70 = NSNumber;
            objc_msgSend_timedelta(v13, v6, v7, v8, v9);
            uint64_t v75 = objc_msgSend_numberWithDouble_(v70, v71, v72, v73, v74);
            objc_msgSend_addObject_(timedeltas_To_State_Allocated, v76, (uint64_t)v75, v77, v78);

            break;
          default:
            uint64_t v39 = (void *)LBFLogContextBitacoraStateInfo;
            if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR)) {
              sub_254585308((uint64_t)v83, v39);
            }
            break;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v79, (uint64_t)v84, 16);
    }
    while (v10);
  }
}

- (id)getDictionaryRepresentation
{
  v443[30] = *MEMORY[0x263EF8340];
  v442[0] = &unk_2703E3E00;
  v442[1] = &unk_2703E3E18;
  v443[0] = @"state_Unknown";
  v443[1] = @"state_Allocated";
  v442[2] = &unk_2703E3E30;
  v442[3] = &unk_2703E3E48;
  v443[2] = @"state_Activated";
  v443[3] = @"state_Deativated";
  v442[4] = &unk_2703E3E60;
  v442[5] = &unk_2703E3E78;
  v443[4] = @"state_TaskFetched";
  v443[5] = @"state_TaskScheduled";
  v442[6] = &unk_2703E3E90;
  v442[7] = &unk_2703E3EA8;
  v443[6] = @"state_TaskCompleted";
  v443[7] = @"state_PerformTaskSucceeded";
  v442[8] = &unk_2703E3EC0;
  v442[9] = &unk_2703E3ED8;
  v443[8] = @"state_Unexpected";
  v443[9] = @"state_AllocateFailed";
  v442[10] = &unk_2703E3EF0;
  v442[11] = &unk_2703E3F08;
  v443[10] = @"state_ActivateFailed";
  v443[11] = @"state_DeativateFailed";
  v442[12] = &unk_2703E3F20;
  v442[13] = &unk_2703E3F38;
  v443[12] = @"state_TaskFetcheFailed";
  v443[13] = @"state_TaskScheduleFailed";
  v442[14] = &unk_2703E3F50;
  v442[15] = &unk_2703E3F68;
  v443[14] = @"state_TaskCompleteFailed";
  v443[15] = @"state_PerformTaskFailed";
  v442[16] = &unk_2703E3F80;
  v442[17] = &unk_2703E3F98;
  v443[16] = @"state_PluginStop";
  v443[17] = @"state_PluginStopFailed";
  v442[18] = &unk_2703E3FB0;
  v442[19] = &unk_2703E3FC8;
  v443[18] = @"state_AllocatedIdle";
  v443[19] = @"state_ActivatedIdle";
  v442[20] = &unk_2703E3FE0;
  v442[21] = &unk_2703E3FF8;
  v443[20] = @"state_DonationReceived";
  v443[21] = @"state_Randomization";
  v442[22] = &unk_2703E4010;
  v442[23] = &unk_2703E4028;
  v443[22] = @"state_BudgetCheck";
  v443[23] = @"state_PayloadCreation";
  v442[24] = &unk_2703E4040;
  v442[25] = &unk_2703E4058;
  v443[24] = @"state_Upload";
  v443[25] = @"state_DonationReceivedFailed";
  v442[26] = &unk_2703E4070;
  v442[27] = &unk_2703E4088;
  v443[26] = @"state_RandomizationFailed";
  v443[27] = @"state_BudgetCheckFailed";
  v442[28] = &unk_2703E40A0;
  v442[29] = &unk_2703E40B8;
  v443[28] = @"state_PayloadCreationFailed";
  v443[29] = @"state_UploadFailed";
  uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v443, (uint64_t)v442, 30);
  unint64_t latestState = self->_latestState;
  if (latestState >= 0x1F)
  {
    uint64_t v10 = (id)LBFLogContextBitacoraStateInfo;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_254585364(&self->_latestState, v10);
    }

    uint64_t v9 = &unk_2703E3EC0;
  }
  else
  {
    uint64_t v9 = (void *)qword_2653ADBC0[latestState];
  }
  v440[0] = @"contextId";
  uint64_t v11 = objc_msgSend_UUIDString(self->_contextId, v3, v4, v5, v6);
  count_Activated_Succeeded = self->_count_Activated_Succeeded;
  if (!count_Activated_Succeeded) {
    count_Activated_Succeeded = (NSNumber *)&unk_2703E3E00;
  }
  v423 = (void *)v11;
  v441[0] = v11;
  v441[1] = count_Activated_Succeeded;
  v440[1] = @"count_Activated";
  v440[2] = @"count_Allocated";
  isActivated = self->_isActivated;
  count_Allocated_Succeeded = self->_count_Allocated_Succeeded;
  if (!count_Allocated_Succeeded) {
    count_Allocated_Succeeded = (NSNumber *)&unk_2703E3E00;
  }
  count_Deactivated_Succeeded = self->_count_Deactivated_Succeeded;
  if (!count_Deactivated_Succeeded) {
    count_Deactivated_Succeeded = (NSNumber *)&unk_2703E3E00;
  }
  v441[2] = count_Allocated_Succeeded;
  v441[3] = count_Deactivated_Succeeded;
  v440[3] = @"count_Deactivated";
  v440[4] = @"count_PerformTask_Failed";
  count_PerformTask_Succeeded = self->_count_PerformTask_Succeeded;
  count_PerformTask_Failed = self->_count_PerformTask_Failed;
  if (!count_PerformTask_Failed) {
    count_PerformTask_Failed = (NSNumber *)&unk_2703E3E00;
  }
  if (!count_PerformTask_Succeeded) {
    count_PerformTask_Succeeded = (NSNumber *)&unk_2703E3E00;
  }
  v441[4] = count_PerformTask_Failed;
  v441[5] = count_PerformTask_Succeeded;
  v440[5] = @"count_PerformTask_Succeeded";
  v440[6] = @"count_Stop_Failed";
  count_Stop_Succeeded = self->_count_Stop_Succeeded;
  count_Stop_Failed = self->_count_Stop_Failed;
  if (!count_Stop_Failed) {
    count_Stop_Failed = (NSNumber *)&unk_2703E3E00;
  }
  if (!count_Stop_Succeeded) {
    count_Stop_Succeeded = (NSNumber *)&unk_2703E3E00;
  }
  v441[6] = count_Stop_Failed;
  v441[7] = count_Stop_Succeeded;
  v440[7] = @"count_Stop_Succeeded";
  v440[8] = @"count_TaskCompleted_Failed";
  count_TaskCompleted_Succeeded = self->_count_TaskCompleted_Succeeded;
  count_TaskCompleted_Failed = self->_count_TaskCompleted_Failed;
  if (!count_TaskCompleted_Failed) {
    count_TaskCompleted_Failed = (NSNumber *)&unk_2703E3E00;
  }
  if (!count_TaskCompleted_Succeeded) {
    count_TaskCompleted_Succeeded = (NSNumber *)&unk_2703E3E00;
  }
  v441[8] = count_TaskCompleted_Failed;
  v441[9] = count_TaskCompleted_Succeeded;
  v440[9] = @"count_TaskCompleted_Succeeded";
  v440[10] = @"count_TaskFetched_Failed";
  count_TaskFetched_Succeeded = self->_count_TaskFetched_Succeeded;
  count_TaskFetched_Failed = self->_count_TaskFetched_Failed;
  if (!count_TaskFetched_Failed) {
    count_TaskFetched_Failed = (NSNumber *)&unk_2703E3E00;
  }
  if (!count_TaskFetched_Succeeded) {
    count_TaskFetched_Succeeded = (NSNumber *)&unk_2703E3E00;
  }
  v441[10] = count_TaskFetched_Failed;
  v441[11] = count_TaskFetched_Succeeded;
  v440[11] = @"count_TaskFetched_Succeeded";
  v440[12] = @"count_TaskScheduled_Failed";
  count_TaskScheduled_Succeeded = self->_count_TaskScheduled_Succeeded;
  count_TaskScheduled_Failed = self->_count_TaskScheduled_Failed;
  if (!count_TaskScheduled_Failed) {
    count_TaskScheduled_Failed = (NSNumber *)&unk_2703E3E00;
  }
  if (!count_TaskScheduled_Succeeded) {
    count_TaskScheduled_Succeeded = (NSNumber *)&unk_2703E3E00;
  }
  v441[12] = count_TaskScheduled_Failed;
  v441[13] = count_TaskScheduled_Succeeded;
  v440[13] = @"count_TaskScheduled_Succeeded";
  v440[14] = @"count_DprivacydDonationReceived_Failed";
  count_DprivacydDonationReceived_Succeeded = self->_count_DprivacydDonationReceived_Succeeded;
  count_DprivacydDonationReceived_Failed = self->_count_DprivacydDonationReceived_Failed;
  if (!count_DprivacydDonationReceived_Failed) {
    count_DprivacydDonationReceived_Failed = (NSNumber *)&unk_2703E3E00;
  }
  if (!count_DprivacydDonationReceived_Succeeded) {
    count_DprivacydDonationReceived_Succeeded = (NSNumber *)&unk_2703E3E00;
  }
  v441[14] = count_DprivacydDonationReceived_Failed;
  v441[15] = count_DprivacydDonationReceived_Succeeded;
  v440[15] = @"count_DprivacydDonationReceived_Succeeded";
  v440[16] = @"count_DprivacydRandomization_Failed";
  count_DprivacydRandomization_Succeeded = self->_count_DprivacydRandomization_Succeeded;
  count_DprivacydRandomization_Failed = self->_count_DprivacydRandomization_Failed;
  if (!count_DprivacydRandomization_Failed) {
    count_DprivacydRandomization_Failed = (NSNumber *)&unk_2703E3E00;
  }
  if (!count_DprivacydRandomization_Succeeded) {
    count_DprivacydRandomization_Succeeded = (NSNumber *)&unk_2703E3E00;
  }
  v441[16] = count_DprivacydRandomization_Failed;
  v441[17] = count_DprivacydRandomization_Succeeded;
  v440[17] = @"count_DprivacydRandomization_Succeeded";
  v440[18] = @"count_DprivacydBudgetCheck_Failed";
  count_DprivacydBudgetCheck_Succeeded = self->_count_DprivacydBudgetCheck_Succeeded;
  count_DprivacydBudgetCheck_Failed = self->_count_DprivacydBudgetCheck_Failed;
  if (!count_DprivacydBudgetCheck_Failed) {
    count_DprivacydBudgetCheck_Failed = (NSNumber *)&unk_2703E3E00;
  }
  if (!count_DprivacydBudgetCheck_Succeeded) {
    count_DprivacydBudgetCheck_Succeeded = (NSNumber *)&unk_2703E3E00;
  }
  v441[18] = count_DprivacydBudgetCheck_Failed;
  v441[19] = count_DprivacydBudgetCheck_Succeeded;
  v440[19] = @"count_DprivacydBudgetCheck_Succeeded";
  v440[20] = @"count_DprivacydPayloadCreation_Failed";
  count_DprivacydPayloadCreation_Succeeded = self->_count_DprivacydPayloadCreation_Succeeded;
  count_DprivacydPayloadCreation_Failed = self->_count_DprivacydPayloadCreation_Failed;
  if (!count_DprivacydPayloadCreation_Failed) {
    count_DprivacydPayloadCreation_Failed = (NSNumber *)&unk_2703E3E00;
  }
  if (!count_DprivacydPayloadCreation_Succeeded) {
    count_DprivacydPayloadCreation_Succeeded = (NSNumber *)&unk_2703E3E00;
  }
  v441[20] = count_DprivacydPayloadCreation_Failed;
  v441[21] = count_DprivacydPayloadCreation_Succeeded;
  v440[21] = @"count_DprivacydPayloadCreation_Succeeded";
  v440[22] = @"count_DprivacydUpload_Failed";
  count_DprivacydUpload_Succeeded = self->_count_DprivacydUpload_Succeeded;
  count_DprivacydUpload_Failed = self->_count_DprivacydUpload_Failed;
  if (!count_DprivacydUpload_Failed) {
    count_DprivacydUpload_Failed = (NSNumber *)&unk_2703E3E00;
  }
  if (!count_DprivacydUpload_Succeeded) {
    count_DprivacydUpload_Succeeded = (NSNumber *)&unk_2703E3E00;
  }
  v441[22] = count_DprivacydUpload_Failed;
  v441[23] = count_DprivacydUpload_Succeeded;
  v440[23] = @"count_DprivacydUpload_Succeeded";
  v440[24] = @"isActivated";
  uint64_t v40 = (uint64_t)isActivated;
  uint64_t v422 = isActivated;
  if (!isActivated)
  {
    uint64_t v40 = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v13, v14, v15);
  }
  v379 = (void *)v40;
  v441[24] = v40;
  v440[25] = @"isAllocated";
  uint64_t isAllocated = (uint64_t)self->_isAllocated;
  uint64_t v421 = isAllocated;
  if (!isAllocated)
  {
    uint64_t isAllocated = objc_msgSend_null(MEMORY[0x263EFF9D0], v12, v13, v14, v15);
  }
  v378 = (void *)isAllocated;
  v441[25] = isAllocated;
  v440[26] = @"isActivated_implicit";
  uint64_t v420 = objc_msgSend_numberWithBool_(NSNumber, v12, self->_isActivated_implicit, v14, v15);
  v441[26] = v420;
  v440[27] = @"isAllocated_implicit";
  v419 = objc_msgSend_numberWithBool_(NSNumber, v42, self->_isAllocated_implicit, v43, v44);
  v441[27] = v419;
  v440[28] = @"maxTimedelta_To_State_Activated";
  uint64_t v49 = objc_msgSend_maxTimedelta_To_State_Activated(self, v45, v46, v47, v48);
  uint64_t v54 = (void *)v49;
  if (!v49)
  {
    uint64_t v49 = objc_msgSend_null(MEMORY[0x263EFF9D0], v50, v51, v52, v53);
  }
  v377 = (void *)v49;
  v441[28] = v49;
  v440[29] = @"maxTimedelta_To_State_ActivatedFailed";
  uint64_t v55 = objc_msgSend_maxTimedelta_To_State_ActivatedFailed(self, v50, v51, v52, v53);
  uint64_t v60 = (void *)v55;
  if (!v55)
  {
    uint64_t v55 = objc_msgSend_null(MEMORY[0x263EFF9D0], v56, v57, v58, v59);
  }
  uint64_t v376 = (void *)v55;
  v441[29] = v55;
  v440[30] = @"maxTimedelta_To_State_Allocated";
  uint64_t v65 = objc_msgSend_maxTimedelta_To_State_Allocated(self, v56, v57, v58, v59);
  uint64_t v416 = (void *)v65;
  if (!v65)
  {
    uint64_t v65 = objc_msgSend_null(MEMORY[0x263EFF9D0], v61, v62, v63, v64);
  }
  uint64_t v375 = (void *)v65;
  v441[30] = v65;
  v440[31] = @"maxTimedelta_To_State_AllocatedFailed";
  uint64_t v70 = objc_msgSend_maxTimedelta_To_State_AllocatedFailed(self, v61, v62, v63, v64);
  uint64_t v415 = (void *)v70;
  if (!v70)
  {
    uint64_t v70 = objc_msgSend_null(MEMORY[0x263EFF9D0], v66, v67, v68, v69);
  }
  uint64_t v374 = (void *)v70;
  v441[31] = v70;
  v440[32] = @"maxTimedelta_To_State_Deativated";
  uint64_t v71 = objc_msgSend_maxTimedelta_To_State_Deativated(self, v66, v67, v68, v69);
  uint64_t v76 = (void *)v71;
  if (!v71)
  {
    uint64_t v71 = objc_msgSend_null(MEMORY[0x263EFF9D0], v72, v73, v74, v75);
  }
  v373 = (void *)v71;
  v441[32] = v71;
  v440[33] = @"maxTimedelta_To_State_DeativatedFailed";
  uint64_t v77 = objc_msgSend_maxTimedelta_To_State_DeativatedFailed(self, v72, v73, v74, v75);
  long long v82 = (void *)v77;
  if (!v77)
  {
    uint64_t v77 = objc_msgSend_null(MEMORY[0x263EFF9D0], v78, v79, v80, v81);
  }
  v372 = (void *)v77;
  v441[33] = v77;
  v440[34] = @"maxTimedelta_To_State_PerformTaskFailed";
  uint64_t v83 = objc_msgSend_maxTimedelta_To_State_PerformTaskFailed(self, v78, v79, v80, v81);
  uint64_t v88 = (void *)v83;
  if (!v83)
  {
    uint64_t v83 = objc_msgSend_null(MEMORY[0x263EFF9D0], v84, v85, v86, v87);
  }
  v371 = (void *)v83;
  v441[34] = v83;
  v440[35] = @"maxTimedelta_To_State_PerformTaskSucceeded";
  uint64_t v89 = objc_msgSend_maxTimedelta_To_State_PerformTask(self, v84, v85, v86, v87);
  uint64_t v94 = (void *)v89;
  if (!v89)
  {
    uint64_t v89 = objc_msgSend_null(MEMORY[0x263EFF9D0], v90, v91, v92, v93);
  }
  uint64_t v370 = (void *)v89;
  v441[35] = v89;
  v440[36] = @"maxTimedelta_To_State_TaskCompleted";
  uint64_t v95 = objc_msgSend_maxTimedelta_To_State_TaskCompleted(self, v90, v91, v92, v93);
  int v100 = (void *)v95;
  if (!v95)
  {
    uint64_t v95 = objc_msgSend_null(MEMORY[0x263EFF9D0], v96, v97, v98, v99);
  }
  uint64_t v369 = (void *)v95;
  v441[36] = v95;
  v440[37] = @"maxTimedelta_To_State_TaskCompletedFailed";
  uint64_t v105 = objc_msgSend_maxTimedelta_To_State_TaskCompletedFailed(self, v96, v97, v98, v99);
  v439 = (void *)v105;
  if (!v105)
  {
    uint64_t v105 = objc_msgSend_null(MEMORY[0x263EFF9D0], v101, v102, v103, v104);
  }
  v368 = (void *)v105;
  v441[37] = v105;
  v440[38] = @"maxTimedelta_To_State_TaskFetched";
  uint64_t v110 = objc_msgSend_maxTimedelta_To_State_TaskFetched(self, v101, v102, v103, v104);
  uint64_t v438 = (void *)v110;
  if (!v110)
  {
    uint64_t v110 = objc_msgSend_null(MEMORY[0x263EFF9D0], v106, v107, v108, v109);
  }
  int v367 = (void *)v110;
  v441[38] = v110;
  v440[39] = @"maxTimedelta_To_State_TaskFetchedFailed";
  uint64_t v115 = objc_msgSend_maxTimedelta_To_State_TaskFetchedFailed(self, v106, v107, v108, v109);
  uint64_t v437 = (void *)v115;
  if (!v115)
  {
    uint64_t v115 = objc_msgSend_null(MEMORY[0x263EFF9D0], v111, v112, v113, v114);
  }
  v366 = (void *)v115;
  v441[39] = v115;
  v440[40] = @"maxTimedelta_To_State_TaskScheduled";
  uint64_t v120 = objc_msgSend_maxTimedelta_To_State_TaskScheduled(self, v111, v112, v113, v114);
  v436 = (void *)v120;
  if (!v120)
  {
    uint64_t v120 = objc_msgSend_null(MEMORY[0x263EFF9D0], v116, v117, v118, v119);
  }
  uint64_t v365 = (void *)v120;
  v441[40] = v120;
  v440[41] = @"maxTimedelta_To_State_TaskScheduledFailed";
  uint64_t v125 = objc_msgSend_maxTimedelta_To_State_TaskScheduledFailed(self, v116, v117, v118, v119);
  int v435 = (void *)v125;
  if (!v125)
  {
    uint64_t v125 = objc_msgSend_null(MEMORY[0x263EFF9D0], v121, v122, v123, v124);
  }
  uint64_t v364 = (void *)v125;
  v441[41] = v125;
  v440[42] = @"maxTimedelta_To_State_DprivacydDonationReceived";
  uint64_t v130 = objc_msgSend_maxTimedelta_To_State_DprivacydDonationReceived(self, v121, v122, v123, v124);
  v434 = (void *)v130;
  if (!v130)
  {
    uint64_t v130 = objc_msgSend_null(MEMORY[0x263EFF9D0], v126, v127, v128, v129);
  }
  uint64_t v363 = (void *)v130;
  v441[42] = v130;
  v440[43] = @"maxTimedelta_To_State_DprivacydDonationReceivedFailed";
  uint64_t v135 = objc_msgSend_maxTimedelta_To_State_DprivacydDonationReceivedFailed(self, v126, v127, v128, v129);
  uint64_t v433 = (void *)v135;
  if (!v135)
  {
    uint64_t v135 = objc_msgSend_null(MEMORY[0x263EFF9D0], v131, v132, v133, v134);
  }
  v362 = (void *)v135;
  v441[43] = v135;
  v440[44] = @"maxTimedelta_To_State_DprivacydRandomization";
  uint64_t v140 = objc_msgSend_maxTimedelta_To_State_DprivacydRandomization(self, v131, v132, v133, v134);
  uint64_t v432 = (void *)v140;
  if (!v140)
  {
    uint64_t v140 = objc_msgSend_null(MEMORY[0x263EFF9D0], v136, v137, v138, v139);
  }
  int v361 = (void *)v140;
  v441[44] = v140;
  v440[45] = @"maxTimedelta_To_State_DprivacydRandomizationFailed";
  uint64_t v145 = objc_msgSend_maxTimedelta_To_State_DprivacydRandomizationFailed(self, v136, v137, v138, v139);
  uint64_t v431 = (void *)v145;
  if (!v145)
  {
    uint64_t v145 = objc_msgSend_null(MEMORY[0x263EFF9D0], v141, v142, v143, v144);
  }
  uint64_t v360 = (void *)v145;
  v441[45] = v145;
  v440[46] = @"maxTimedelta_To_State_DprivacydBudgetCheck";
  uint64_t v150 = objc_msgSend_maxTimedelta_To_State_DprivacydBudgetCheck(self, v141, v142, v143, v144);
  v430 = (void *)v150;
  if (!v150)
  {
    uint64_t v150 = objc_msgSend_null(MEMORY[0x263EFF9D0], v146, v147, v148, v149);
  }
  uint64_t v359 = (void *)v150;
  v441[46] = v150;
  v440[47] = @"maxTimedelta_To_State_DprivacydBudgetCheckFailed";
  uint64_t v155 = objc_msgSend_maxTimedelta_To_State_DprivacydBudgetCheckFailed(self, v146, v147, v148, v149);
  int v429 = (void *)v155;
  if (!v155)
  {
    uint64_t v155 = objc_msgSend_null(MEMORY[0x263EFF9D0], v151, v152, v153, v154);
  }
  uint64_t v358 = (void *)v155;
  v441[47] = v155;
  v440[48] = @"maxTimedelta_To_State_DprivacydPayloadCreation";
  uint64_t v160 = objc_msgSend_maxTimedelta_To_State_DprivacydPayloadCreation(self, v151, v152, v153, v154);
  uint64_t v428 = (void *)v160;
  if (!v160)
  {
    uint64_t v160 = objc_msgSend_null(MEMORY[0x263EFF9D0], v156, v157, v158, v159);
  }
  v357 = (void *)v160;
  v441[48] = v160;
  v440[49] = @"maxTimedelta_To_State_DprivacydPayloadCreationFailed";
  uint64_t v165 = objc_msgSend_maxTimedelta_To_State_DprivacydPayloadCreationFailed(self, v156, v157, v158, v159);
  uint64_t v427 = (void *)v165;
  if (!v165)
  {
    uint64_t v165 = objc_msgSend_null(MEMORY[0x263EFF9D0], v161, v162, v163, v164);
  }
  v356 = (void *)v165;
  v441[49] = v165;
  v440[50] = @"maxTimedelta_To_State_DprivacydUpload";
  uint64_t v170 = objc_msgSend_maxTimedelta_To_State_DprivacydUpload(self, v161, v162, v163, v164);
  uint64_t v426 = (void *)v170;
  if (!v170)
  {
    uint64_t v170 = objc_msgSend_null(MEMORY[0x263EFF9D0], v166, v167, v168, v169);
  }
  uint64_t v355 = (void *)v170;
  v441[50] = v170;
  v440[51] = @"maxTimedelta_To_State_DprivacydUploadFailed";
  uint64_t v175 = objc_msgSend_maxTimedelta_To_State_DprivacydUploadFailed(self, v166, v167, v168, v169);
  v425 = (void *)v175;
  if (!v175)
  {
    uint64_t v175 = objc_msgSend_null(MEMORY[0x263EFF9D0], v171, v172, v173, v174);
  }
  v418 = v54;
  uint64_t v354 = (void *)v175;
  v441[51] = v175;
  v440[52] = @"maxTimedelta_To_State_Unexpeted";
  uint64_t v180 = objc_msgSend_maxTimedelta_To_State_Unexpeted(self, v171, v172, v173, v174);
  uint64_t v409 = (void *)v180;
  if (!v180)
  {
    uint64_t v180 = objc_msgSend_null(MEMORY[0x263EFF9D0], v176, v177, v178, v179);
  }
  uint64_t v353 = (void *)v180;
  v441[52] = v180;
  v441[53] = v9;
  v440[53] = @"state";
  v440[54] = @"stateString";
  uint64_t v181 = objc_msgSend_objectForKey_(v7, v176, (uint64_t)v9, v178, v179);
  stateId = self->_stateId;
  v408 = (void *)v181;
  v441[54] = v181;
  v441[55] = stateId;
  v440[55] = @"stateID";
  v440[56] = @"timestamp";
  int v407 = objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v183, (uint64_t)self->_bucketEndTime, v184, v185);
  v441[56] = v407;
  v440[57] = @"timestamp_Activated";
  timestamp_Activated_Succeeded = self->_timestamp_Activated_Succeeded;
  if (timestamp_Activated_Succeeded) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v186, (uint64_t)timestamp_Activated_Succeeded, v187, v188);
  }
  else {
  uint64_t v406 = objc_msgSend_null(MEMORY[0x263EFF9D0], v186, 0, v187, v188);
  }
  v441[57] = v406;
  v440[58] = @"timestamp_Allocated";
  timestamp_Allocated_Succeeded = self->_timestamp_Allocated_Succeeded;
  if (timestamp_Allocated_Succeeded) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v190, (uint64_t)timestamp_Allocated_Succeeded, v191, v192);
  }
  else {
  uint64_t v405 = objc_msgSend_null(MEMORY[0x263EFF9D0], v190, 0, v191, v192);
  }
  v441[58] = v405;
  v440[59] = @"timestamp_Deactivated";
  timestamp_Deactivated_Succeeded = self->_timestamp_Deactivated_Succeeded;
  if (timestamp_Deactivated_Succeeded) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v194, (uint64_t)timestamp_Deactivated_Succeeded, v195, v196);
  }
  else {
  uint64_t v404 = objc_msgSend_null(MEMORY[0x263EFF9D0], v194, 0, v195, v196);
  }
  v441[59] = v404;
  v440[60] = @"timestamp_PerformTask_Failed";
  timestamp_PerformTask_Failed = self->_timestamp_PerformTask_Failed;
  if (timestamp_PerformTask_Failed) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v198, (uint64_t)timestamp_PerformTask_Failed, v199, v200);
  }
  else {
  v403 = objc_msgSend_null(MEMORY[0x263EFF9D0], v198, 0, v199, v200);
  }
  v441[60] = v403;
  v440[61] = @"timestamp_PerformTask_Succeeded";
  timestamp_PerformTask_Succeeded = self->_timestamp_PerformTask_Succeeded;
  if (timestamp_PerformTask_Succeeded) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v202, (uint64_t)timestamp_PerformTask_Succeeded, v203, v204);
  }
  else {
  v402 = objc_msgSend_null(MEMORY[0x263EFF9D0], v202, 0, v203, v204);
  }
  v441[61] = v402;
  v440[62] = @"timestamp_Stop_Failed";
  timestamp_Stop_Failed = self->_timestamp_Stop_Failed;
  if (timestamp_Stop_Failed) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v206, (uint64_t)timestamp_Stop_Failed, v207, v208);
  }
  else {
  v401 = objc_msgSend_null(MEMORY[0x263EFF9D0], v206, 0, v207, v208);
  }
  v441[62] = v401;
  v440[63] = @"timestamp_Stop_Succeeded";
  timestamp_Stop_Succeeded = self->_timestamp_Stop_Succeeded;
  if (timestamp_Stop_Succeeded) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v210, (uint64_t)timestamp_Stop_Succeeded, v211, v212);
  }
  else {
  uint64_t v400 = objc_msgSend_null(MEMORY[0x263EFF9D0], v210, 0, v211, v212);
  }
  v441[63] = v400;
  v440[64] = @"timestamp_TaskCompleted_Failed";
  timestamp_TaskCompleted_Failed = self->_timestamp_TaskCompleted_Failed;
  if (timestamp_TaskCompleted_Failed) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v214, (uint64_t)timestamp_TaskCompleted_Failed, v215, v216);
  }
  else {
  uint64_t v399 = objc_msgSend_null(MEMORY[0x263EFF9D0], v214, 0, v215, v216);
  }
  v441[64] = v399;
  v440[65] = @"timestamp_TaskCompleted_Succeeded";
  timestamp_TaskCompleted_Succeeded = self->_timestamp_TaskCompleted_Succeeded;
  if (timestamp_TaskCompleted_Succeeded) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v218, (uint64_t)timestamp_TaskCompleted_Succeeded, v219, v220);
  }
  else {
  uint64_t v398 = objc_msgSend_null(MEMORY[0x263EFF9D0], v218, 0, v219, v220);
  }
  v441[65] = v398;
  v440[66] = @"timestamp_TaskFetched_Failed";
  timestamp_TaskFetched_Failed = self->_timestamp_TaskFetched_Failed;
  if (timestamp_TaskFetched_Failed) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v222, (uint64_t)timestamp_TaskFetched_Failed, v223, v224);
  }
  else {
  v397 = objc_msgSend_null(MEMORY[0x263EFF9D0], v222, 0, v223, v224);
  }
  v441[66] = v397;
  v440[67] = @"timestamp_TaskFetched_Succeeded";
  timestamp_TaskFetched_Succeeded = self->_timestamp_TaskFetched_Succeeded;
  if (timestamp_TaskFetched_Succeeded) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v226, (uint64_t)timestamp_TaskFetched_Succeeded, v227, v228);
  }
  else {
  v396 = objc_msgSend_null(MEMORY[0x263EFF9D0], v226, 0, v227, v228);
  }
  v441[67] = v396;
  v440[68] = @"timestamp_TaskScheduled_Failed";
  timestamp_TaskScheduled_Failed = self->_timestamp_TaskScheduled_Failed;
  if (timestamp_TaskScheduled_Failed) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v230, (uint64_t)timestamp_TaskScheduled_Failed, v231, v232);
  }
  else {
  v395 = objc_msgSend_null(MEMORY[0x263EFF9D0], v230, 0, v231, v232);
  }
  v441[68] = v395;
  v440[69] = @"timestamp_TaskScheduled_Succeeded";
  timestamp_TaskScheduled_Succeeded = self->_timestamp_TaskScheduled_Succeeded;
  if (timestamp_TaskScheduled_Succeeded) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v234, (uint64_t)timestamp_TaskScheduled_Succeeded, v235, v236);
  }
  else {
  uint64_t v394 = objc_msgSend_null(MEMORY[0x263EFF9D0], v234, 0, v235, v236);
  }
  v441[69] = v394;
  v440[70] = @"timestamp_DprivacydDonationReceived_Failed";
  timestamp_DprivacydDonationReceived_Failed = self->_timestamp_DprivacydDonationReceived_Failed;
  if (timestamp_DprivacydDonationReceived_Failed) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v238, (uint64_t)timestamp_DprivacydDonationReceived_Failed, v239, v240);
  }
  else {
  uint64_t v393 = objc_msgSend_null(MEMORY[0x263EFF9D0], v238, 0, v239, v240);
  }
  v441[70] = v393;
  v440[71] = @"timestamp_DprivacydDonationReceived_Succeeded";
  timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydDonationReceived_Succeeded;
  if (timestamp_DprivacydDonationReceived_Succeeded) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v242, (uint64_t)timestamp_DprivacydDonationReceived_Succeeded, v243, v244);
  }
  else {
  v392 = objc_msgSend_null(MEMORY[0x263EFF9D0], v242, 0, v243, v244);
  }
  v441[71] = v392;
  v440[72] = @"timestamp_DprivacydRandomization_Failed";
  timestamp_DprivacydRandomization_Failed = self->_timestamp_DprivacydRandomization_Failed;
  if (timestamp_DprivacydRandomization_Failed) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v246, (uint64_t)timestamp_DprivacydRandomization_Failed, v247, v248);
  }
  else {
  v390 = objc_msgSend_null(MEMORY[0x263EFF9D0], v246, 0, v247, v248);
  }
  v441[72] = v390;
  v440[73] = @"timestamp_DprivacydRandomization_Succeeded";
  timestamp_DprivacydRandomization_Succeeded = self->_timestamp_DprivacydRandomization_Succeeded;
  if (timestamp_DprivacydRandomization_Succeeded) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v250, (uint64_t)timestamp_DprivacydRandomization_Succeeded, v251, v252);
  }
  else {
  uint64_t v389 = objc_msgSend_null(MEMORY[0x263EFF9D0], v250, 0, v251, v252);
  }
  v441[73] = v389;
  v440[74] = @"timestamp_DprivacydBudgetCheck_Failed";
  timestamp_DprivacydBudgetCheck_Failed = self->_timestamp_DprivacydBudgetCheck_Failed;
  if (timestamp_DprivacydBudgetCheck_Failed) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v254, (uint64_t)timestamp_DprivacydBudgetCheck_Failed, v255, v256);
  }
  else {
  uint64_t v388 = objc_msgSend_null(MEMORY[0x263EFF9D0], v254, 0, v255, v256);
  }
  v441[74] = v388;
  v440[75] = @"timestamp_DprivacydBudgetCheck_Succeeded";
  timestamp_DprivacydBudgetCheck_Succeeded = self->_timestamp_DprivacydBudgetCheck_Succeeded;
  if (timestamp_DprivacydBudgetCheck_Succeeded) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v258, (uint64_t)timestamp_DprivacydBudgetCheck_Succeeded, v259, v260);
  }
  else {
  uint64_t v387 = objc_msgSend_null(MEMORY[0x263EFF9D0], v258, 0, v259, v260);
  }
  v441[75] = v387;
  v440[76] = @"timestamp_DprivacydPayloadCreation_Failed";
  timestamp_DprivacydPayloadCreation_Failed = self->_timestamp_DprivacydPayloadCreation_Failed;
  if (timestamp_DprivacydPayloadCreation_Failed) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v262, (uint64_t)timestamp_DprivacydPayloadCreation_Failed, v263, v264);
  }
  else {
  v386 = objc_msgSend_null(MEMORY[0x263EFF9D0], v262, 0, v263, v264);
  }
  v441[76] = v386;
  v440[77] = @"timestamp_DprivacydPayloadCreation_Succeeded";
  timestamp_DprivacydPayloadCreation_Succeeded = self->_timestamp_DprivacydPayloadCreation_Succeeded;
  if (timestamp_DprivacydPayloadCreation_Succeeded) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v266, (uint64_t)timestamp_DprivacydPayloadCreation_Succeeded, v267, v268);
  }
  else {
  int v385 = objc_msgSend_null(MEMORY[0x263EFF9D0], v266, 0, v267, v268);
  }
  v441[77] = v385;
  v440[78] = @"timestamp_DprivacydUpload_Failed";
  timestamp_DprivacydUpload_Failed = self->_timestamp_DprivacydUpload_Failed;
  if (timestamp_DprivacydUpload_Failed) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v270, (uint64_t)timestamp_DprivacydUpload_Failed, v271, v272);
  }
  else {
  uint64_t v384 = objc_msgSend_null(MEMORY[0x263EFF9D0], v270, 0, v271, v272);
  }
  v441[78] = v384;
  v440[79] = @"timestamp_DprivacydUpload_Succeeded";
  timestamp_DprivacydUpload_Succeeded = self->_timestamp_DprivacydUpload_Succeeded;
  int v413 = v82;
  if (timestamp_DprivacydUpload_Succeeded) {
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v274, (uint64_t)timestamp_DprivacydUpload_Succeeded, v275, v276);
  }
  else {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v274, 0, v275, v276);
  }
  uint64_t v383 = v412 = v88;
  v441[79] = v383;
  v440[80] = @"trialIdentifiers_BMLTIdentifiers_trialDeploymentID";
  uint64_t v382 = objc_msgSend_bmltIdentifiers(self->_trialIdentifiers, v278, v279, v280, v281);
  uint64_t v286 = objc_msgSend_trialDeploymentID(v382, v282, v283, v284, v285);
  v291 = (void *)v286;
  if (!v286)
  {
    uint64_t v286 = objc_msgSend_null(MEMORY[0x263EFF9D0], v287, v288, v289, v290);
  }
  v417 = v60;
  v352 = (void *)v286;
  v441[80] = v286;
  v440[81] = @"trialIdentifiers_BMLTIdentifiers_trialTaskID";
  v381 = objc_msgSend_bmltIdentifiers(self->_trialIdentifiers, v287, v288, v289, v290);
  uint64_t v296 = objc_msgSend_trialTaskID(v381, v292, v293, v294, v295);
  uint64_t v301 = (void *)v296;
  if (!v296)
  {
    uint64_t v296 = objc_msgSend_null(MEMORY[0x263EFF9D0], v297, v298, v299, v300);
  }
  uint64_t v410 = v100;
  v414 = v76;
  int v351 = (void *)v296;
  v441[81] = v296;
  v440[82] = @"trialIdentifiers_experimentIdentifiers_trialDeploymentID";
  v380 = objc_msgSend_experimentIdentifiers(self->_trialIdentifiers, v297, v298, v299, v300);
  v310 = objc_msgSend_trialDeploymentID(v380, v302, v303, v304, v305);
  uint64_t v311 = v310;
  if (!v310)
  {
    uint64_t v311 = objc_msgSend_null(MEMORY[0x263EFF9D0], v306, v307, v308, v309);
  }
  uint64_t v411 = v94;
  v424 = v7;
  v441[82] = v311;
  v440[83] = @"trialIdentifiers_experimentIdentifiers_trialExperimentID";
  uint64_t v312 = objc_msgSend_experimentIdentifiers(self->_trialIdentifiers, v306, v307, v308, v309);
  v321 = objc_msgSend_trialExperimentID(v312, v313, v314, v315, v316);
  uint64_t v322 = v321;
  if (!v321)
  {
    uint64_t v322 = objc_msgSend_null(MEMORY[0x263EFF9D0], v317, v318, v319, v320);
  }
  v441[83] = v322;
  v440[84] = @"trialIdentifiers_experimentIdentifiers_trialTreatmentID";
  uint64_t v323 = objc_msgSend_experimentIdentifiers(self->_trialIdentifiers, v317, v318, v319, v320);
  id v332 = objc_msgSend_trialTreatmentID(v323, v324, v325, v326, v327);
  v333 = v332;
  if (!v332)
  {
    v333 = objc_msgSend_null(MEMORY[0x263EFF9D0], v328, v329, v330, v331);
  }
  v441[84] = v333;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v328, (uint64_t)v441, (uint64_t)v440, 85);
  id v391 = (id)objc_claimAutoreleasedReturnValue();
  if (!v332) {

  }
  if (!v321) {
  if (!v310)
  }

  if (!v301) {
  if (!v291)
  }

  if (!v409) {
  uint64_t v334 = v425;
  }
  if (!v425)
  {

    uint64_t v334 = 0;
  }

  uint64_t v335 = v426;
  if (!v426)
  {

    uint64_t v335 = 0;
  }

  uint64_t v336 = v427;
  if (!v427)
  {

    uint64_t v336 = 0;
  }

  v337 = v428;
  if (!v428)
  {

    v337 = 0;
  }

  v338 = v429;
  if (!v429)
  {

    v338 = 0;
  }

  uint64_t v339 = v430;
  if (!v430)
  {

    uint64_t v339 = 0;
  }

  uint64_t v340 = v431;
  if (!v431)
  {

    uint64_t v340 = 0;
  }

  uint64_t v341 = v432;
  if (!v432)
  {

    uint64_t v341 = 0;
  }

  v342 = v433;
  if (!v433)
  {

    v342 = 0;
  }

  uint64_t v343 = v434;
  if (!v434)
  {

    uint64_t v343 = 0;
  }

  uint64_t v344 = v435;
  if (!v435)
  {

    uint64_t v344 = 0;
  }

  uint64_t v345 = v436;
  if (!v436)
  {

    uint64_t v345 = 0;
  }

  v346 = v437;
  if (!v437)
  {

    v346 = 0;
  }

  v347 = v438;
  if (!v438)
  {

    v347 = 0;
  }

  uint64_t v348 = v439;
  if (!v439)
  {

    uint64_t v348 = 0;
  }

  if (!v410) {
  if (!v411)
  }

  if (!v412) {
  if (!v413)
  }

  if (!v414) {
  if (!v415)
  }

  if (!v416) {
  if (!v417)
  }

  if (!v418) {
  if (!v421)
  }

  if (!v422) {
  id v349 = v391;
  }

  return v349;
}

- (BOOL)uploadToCoreAnalytics
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_getDictionaryRepresentation(self, a2, v2, v3, v4);
  uint64_t v6 = LBFLogContextBitacoraStateInfo;
  if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v5;
    _os_log_impl(&dword_254547000, v6, OS_LOG_TYPE_INFO, "Emit CA Message %@", buf, 0xCu);
  }
  uint64_t v10 = v5;
  id v7 = v5;
  char v8 = AnalyticsSendEventLazy();

  return v8;
}

- (id)maxTimedelta_To_State_Activated
{
  timedeltas_To_State_Activated = self->_timedeltas_To_State_Activated;
  if (timedeltas_To_State_Activated)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_Activated, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_ActivatedFailed
{
  timedeltas_To_State_ActivatedFailed = self->_timedeltas_To_State_ActivatedFailed;
  if (timedeltas_To_State_ActivatedFailed)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_ActivatedFailed, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_Allocated
{
  timedeltas_To_State_Allocated = self->_timedeltas_To_State_Allocated;
  if (timedeltas_To_State_Allocated)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_Allocated, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_AllocatedFailed
{
  timedeltas_To_State_AllocatedFailed = self->_timedeltas_To_State_AllocatedFailed;
  if (timedeltas_To_State_AllocatedFailed)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_AllocatedFailed, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_Deativated
{
  timedeltas_To_State_Deactivated = self->_timedeltas_To_State_Deactivated;
  if (timedeltas_To_State_Deactivated)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_Deactivated, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DeativatedFailed
{
  timedeltas_To_State_DeactivatedFailed = self->_timedeltas_To_State_DeactivatedFailed;
  if (timedeltas_To_State_DeactivatedFailed)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_DeactivatedFailed, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_PerformTaskFailed
{
  timedeltas_To_State_PerformTaskFailed = self->_timedeltas_To_State_PerformTaskFailed;
  if (timedeltas_To_State_PerformTaskFailed)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_PerformTaskFailed, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_PerformTask
{
  timedeltas_To_State_PerformTask = self->_timedeltas_To_State_PerformTask;
  if (timedeltas_To_State_PerformTask)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_PerformTask, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_TaskCompleted
{
  timedeltas_To_State_TaskCompleted = self->_timedeltas_To_State_TaskCompleted;
  if (timedeltas_To_State_TaskCompleted)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_TaskCompleted, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_TaskCompletedFailed
{
  timedeltas_To_State_TaskCompletedFailed = self->_timedeltas_To_State_TaskCompletedFailed;
  if (timedeltas_To_State_TaskCompletedFailed)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_TaskCompletedFailed, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_TaskFetched
{
  timedeltas_To_State_TaskFetched = self->_timedeltas_To_State_TaskFetched;
  if (timedeltas_To_State_TaskFetched)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_TaskFetched, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_TaskFetchedFailed
{
  timedeltas_To_State_TaskFetchedFailed = self->_timedeltas_To_State_TaskFetchedFailed;
  if (timedeltas_To_State_TaskFetchedFailed)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_TaskFetchedFailed, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_TaskScheduled
{
  timedeltas_To_State_TaskScheduled = self->_timedeltas_To_State_TaskScheduled;
  if (timedeltas_To_State_TaskScheduled)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_TaskScheduled, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_TaskScheduledFailed
{
  timedeltas_To_State_TaskScheduledFailed = self->_timedeltas_To_State_TaskScheduledFailed;
  if (timedeltas_To_State_TaskScheduledFailed)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_TaskScheduledFailed, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_Unexpeted
{
  timedeltas_To_State_Unexpeted = self->_timedeltas_To_State_Unexpeted;
  if (timedeltas_To_State_Unexpeted)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_Unexpeted, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydDonationReceived
{
  timedeltas_To_State_DprivacydDonationReceived = self->_timedeltas_To_State_DprivacydDonationReceived;
  if (timedeltas_To_State_DprivacydDonationReceived)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydDonationReceived, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydDonationReceivedFailed
{
  timedeltas_To_State_DprivacydDonationReceivedFailed = self->_timedeltas_To_State_DprivacydDonationReceivedFailed;
  if (timedeltas_To_State_DprivacydDonationReceivedFailed)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydDonationReceivedFailed, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydRandomization
{
  timedeltas_To_State_DprivacydRandomization = self->_timedeltas_To_State_DprivacydRandomization;
  if (timedeltas_To_State_DprivacydRandomization)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydRandomization, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydRandomizationFailed
{
  timedeltas_To_State_DprivacydRandomizationFailed = self->_timedeltas_To_State_DprivacydRandomizationFailed;
  if (timedeltas_To_State_DprivacydRandomizationFailed)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydRandomizationFailed, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydBudgetCheck
{
  timedeltas_To_State_DprivacydBudgetCheck = self->_timedeltas_To_State_DprivacydBudgetCheck;
  if (timedeltas_To_State_DprivacydBudgetCheck)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydBudgetCheck, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydBudgetCheckFailed
{
  timedeltas_To_State_DprivacydBudgetCheckFailed = self->_timedeltas_To_State_DprivacydBudgetCheckFailed;
  if (timedeltas_To_State_DprivacydBudgetCheckFailed)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydBudgetCheckFailed, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydPayloadCreation
{
  timedeltas_To_State_DprivacydPayloadCreation = self->_timedeltas_To_State_DprivacydPayloadCreation;
  if (timedeltas_To_State_DprivacydPayloadCreation)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydPayloadCreation, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydPayloadCreationFailed
{
  timedeltas_To_State_DprivacydPayloadCreationFailed = self->_timedeltas_To_State_DprivacydPayloadCreationFailed;
  if (timedeltas_To_State_DprivacydPayloadCreationFailed)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydPayloadCreationFailed, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydUpload
{
  timedeltas_To_State_DprivacydUpload = self->_timedeltas_To_State_DprivacydUpload;
  if (timedeltas_To_State_DprivacydUpload)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydUpload, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydUploadFailed
{
  timedeltas_To_State_DprivacydUploadFailed = self->_timedeltas_To_State_DprivacydUploadFailed;
  if (timedeltas_To_State_DprivacydUploadFailed)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydUploadFailed, a2, @"@max.self", v2, v3);
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)getPETState
{
  uint64_t v478 = *MEMORY[0x263EF8340];
  uint64_t v471 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers);
  uint64_t v3 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOBitacoraState);
  uint64_t v4 = NSNumber;
  objc_msgSend_timeIntervalSince1970(self->_bucketEndTime, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_numberWithDouble_(v4, v9, v10, v11, v12);
  uint64_t v470 = objc_msgSend_longValue(v13, v14, v15, v16, v17);

  objc_msgSend_setCountTaskFetchedFailed_(v3, v18, 0, v19, v20);
  objc_msgSend_setCountTaskFetchedSucceeded_(v3, v21, 0, v22, v23);
  objc_msgSend_setCountTaskScheduledFailed_(v3, v24, 0, v25, v26);
  objc_msgSend_setCountTaskScheduledSucceeded_(v3, v27, 0, v28, v29);
  objc_msgSend_setCountTaskCompletedFailed_(v3, v30, 0, v31, v32);
  objc_msgSend_setCountTaskCompletedSucceeded_(v3, v33, 0, v34, v35);
  objc_msgSend_setCountPerformTaskFailed_(v3, v36, 0, v37, v38);
  objc_msgSend_setCountPerformTaskSucceeded_(v3, v39, 0, v40, v41);
  objc_msgSend_setCountStopFailed_(v3, v42, 0, v43, v44);
  objc_msgSend_setCountStopSucceeded_(v3, v45, 0, v46, v47);
  long long v475 = 0u;
  long long v476 = 0u;
  long long v473 = 0u;
  long long v474 = 0u;
  v469 = self;
  uint64_t v48 = self->_bitacoraEvents;
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v473, (uint64_t)v477, 16);
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = 0;
    uint64_t v53 = *(void *)v474;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v474 != v53) {
          objc_enumerationMutation(v48);
        }
        uint64_t v55 = *(void **)(*((void *)&v473 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v56 = v55;
          uint64_t v57 = LBFLogContextEventsHolder;
          if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_254547000, v57, OS_LOG_TYPE_INFO, "Lighthouse Plugin Event.", buf, 2u);
          }
          uint64_t v62 = objc_msgSend_performTrialTaskStatus(v56, v58, v59, v60, v61);

          if (v62)
          {
            uint64_t v67 = objc_msgSend_performTrialTaskStatus(v56, v63, v64, v65, v66);
            int v72 = objc_msgSend_succeeded(v67, v68, v69, v70, v71);

            if (v72)
            {
              int v77 = objc_msgSend_countPerformTaskSucceeded(v3, v73, v74, v75, v76);
              objc_msgSend_setCountPerformTaskSucceeded_(v3, v78, (v77 + 1), v79, v80);
            }
            else
            {
              int v81 = objc_msgSend_countPerformTaskFailed(v3, v73, v74, v75, v76);
              objc_msgSend_setCountPerformTaskFailed_(v3, v82, (v81 + 1), v83, v84);
            }
          }
          uint64_t v85 = objc_msgSend_performTaskStatus(v56, v63, v64, v65, v66);

          if (v85)
          {
            v90 = objc_msgSend_performTaskStatus(v56, v86, v87, v88, v89);
            int v95 = objc_msgSend_succeeded(v90, v91, v92, v93, v94);

            if (v95)
            {
              int v100 = objc_msgSend_countPerformTaskSucceeded(v3, v96, v97, v98, v99);
              objc_msgSend_setCountPerformTaskSucceeded_(v3, v101, (v100 + 1), v102, v103);
            }
            else
            {
              int v104 = objc_msgSend_countPerformTaskFailed(v3, v96, v97, v98, v99);
              objc_msgSend_setCountPerformTaskFailed_(v3, v105, (v104 + 1), v106, v107);
            }
          }
          uint64_t v108 = objc_msgSend_stop(v56, v86, v87, v88, v89);

          if (v108)
          {
            uint64_t v113 = objc_msgSend_stop(v56, v109, v110, v111, v112);
            int v118 = objc_msgSend_succeeded(v113, v114, v115, v116, v117);

            if (v118)
            {
              int v123 = objc_msgSend_countStopSucceeded(v3, v119, v120, v121, v122);
              objc_msgSend_setCountStopSucceeded_(v3, v124, (v123 + 1), v125, v126);
            }
            else
            {
              int v127 = objc_msgSend_countStopFailed(v3, v119, v120, v121, v122);
              objc_msgSend_setCountStopFailed_(v3, v128, (v127 + 1), v129, v130);
            }
          }
          uint64_t v131 = objc_msgSend_trialIdentifiers(v56, v109, v110, v111, v112);

          uint64_t v52 = (void *)v131;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v132 = v55;
          uint64_t v137 = objc_msgSend_taskFetched(v132, v133, v134, v135, v136);

          if (v137)
          {
            uint64_t v142 = objc_msgSend_taskFetched(v132, v138, v139, v140, v141);
            int v147 = objc_msgSend_succeeded(v142, v143, v144, v145, v146);

            if (v147)
            {
              int v152 = objc_msgSend_countTaskFetchedSucceeded(v3, v148, v149, v150, v151);
              objc_msgSend_setCountTaskFetchedSucceeded_(v3, v153, (v152 + 1), v154, v155);
            }
            else
            {
              int v156 = objc_msgSend_countTaskFetchedFailed(v3, v148, v149, v150, v151);
              objc_msgSend_setCountTaskFetchedFailed_(v3, v157, (v156 + 1), v158, v159);
            }
          }
          uint64_t v160 = objc_msgSend_taskCompleted(v132, v138, v139, v140, v141);

          if (v160)
          {
            uint64_t v165 = objc_msgSend_taskCompleted(v132, v161, v162, v163, v164);
            int v170 = objc_msgSend_succeeded(v165, v166, v167, v168, v169);

            if (v170)
            {
              int v175 = objc_msgSend_countTaskCompletedSucceeded(v3, v171, v172, v173, v174);
              objc_msgSend_setCountTaskCompletedSucceeded_(v3, v176, (v175 + 1), v177, v178);
            }
            else
            {
              int v179 = objc_msgSend_countTaskCompletedFailed(v3, v171, v172, v173, v174);
              objc_msgSend_setCountTaskCompletedFailed_(v3, v180, (v179 + 1), v181, v182);
            }
          }
          uint64_t v183 = objc_msgSend_taskScheduled(v132, v161, v162, v163, v164);

          if (v183)
          {
            uint64_t v188 = objc_msgSend_taskScheduled(v132, v184, v185, v186, v187);
            int v193 = objc_msgSend_succeeded(v188, v189, v190, v191, v192);

            if (v193)
            {
              int v198 = objc_msgSend_countTaskScheduledSucceeded(v3, v194, v195, v196, v197);
              objc_msgSend_setCountTaskScheduledSucceeded_(v3, v199, (v198 + 1), v200, v201);
            }
            else
            {
              int v202 = objc_msgSend_countTaskScheduledFailed(v3, v194, v195, v196, v197);
              objc_msgSend_setCountTaskScheduledFailed_(v3, v203, (v202 + 1), v204, v205);
            }
          }
          uint64_t v206 = objc_msgSend_activityScheduleStatus(v132, v184, v185, v186, v187);

          if (v206)
          {
            uint64_t v211 = objc_msgSend_activityScheduleStatus(v132, v207, v208, v209, v210);
            int v216 = objc_msgSend_scheduled(v211, v212, v213, v214, v215);

            if (v216)
            {
              int v221 = objc_msgSend_countTaskScheduledSucceeded(v3, v217, v218, v219, v220);
              objc_msgSend_setCountTaskScheduledSucceeded_(v3, v222, (v221 + 1), v223, v224);
            }
            else
            {
              int v225 = objc_msgSend_countTaskScheduledFailed(v3, v217, v218, v219, v220);
              objc_msgSend_setCountTaskScheduledFailed_(v3, v226, (v225 + 1), v227, v228);
            }
          }
          uint64_t v229 = objc_msgSend_trialIdentifiers(v132, v207, v208, v209, v210);

          uint64_t v52 = (void *)v229;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v231 = v55;
          uint64_t v232 = LBFLogContextEventsHolder;
          if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_254547000, v232, OS_LOG_TYPE_INFO, "Triald Event.", buf, 2u);
          }
          if (objc_msgSend_eventType(v231, v233, v234, v235, v236))
          {
            if (objc_msgSend_eventType(v231, v237, v238, v239, v240) == 2) {
              objc_msgSend_setIsActivated_(v3, v241, 1, v243, v244);
            }
            if (objc_msgSend_eventType(v231, v241, v242, v243, v244) == 1) {
              objc_msgSend_setIsAllocated_(v3, v245, 1, v247, v248);
            }
            if (objc_msgSend_eventType(v231, v245, v246, v247, v248) == 3) {
              objc_msgSend_setIsActivated_(v3, v237, 0, v239, v240);
            }
          }
          if (!v52)
          {
            uint64_t v52 = objc_msgSend_trialIdentifiers(v231, v237, v238, v239, v240);
          }
        }
      }
      uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v230, (uint64_t)&v473, (uint64_t)v477, 16);
    }
    while (v51);
  }
  else
  {
    uint64_t v52 = 0;
  }

  if ((objc_msgSend_isActivated(v3, v249, v250, v251, v252) & 1) == 0) {
    objc_msgSend_setIsActivated_(v3, v253, v469->_isActivated_implicit, v255, v256);
  }
  if ((objc_msgSend_isAllocated(v3, v253, v254, v255, v256) & 1) == 0) {
    objc_msgSend_setIsAllocated_(v3, v257, v469->_isAllocated_implicit, v259, v260);
  }
  uint64_t v261 = objc_msgSend_experimentIdentifiers(v52, v257, v258, v259, v260);

  if (v261)
  {
    uint64_t v266 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers);
    objc_msgSend_setExperimentIdentifiers_(v471, v267, (uint64_t)v266, v268, v269);

    uint64_t v274 = objc_msgSend_experimentIdentifiers(v52, v270, v271, v272, v273);
    uint64_t v279 = objc_msgSend_trialTreatmentID(v274, v275, v276, v277, v278);
    uint64_t v284 = objc_msgSend_experimentIdentifiers(v471, v280, v281, v282, v283);
    objc_msgSend_setTrialTreatmentID_(v284, v285, (uint64_t)v279, v286, v287);

    v292 = objc_msgSend_experimentIdentifiers(v52, v288, v289, v290, v291);
    v297 = objc_msgSend_trialDeploymentID(v292, v293, v294, v295, v296);
    v302 = objc_msgSend_experimentIdentifiers(v471, v298, v299, v300, v301);
    objc_msgSend_setTrialDeploymentID_(v302, v303, (uint64_t)v297, v304, v305);

    v310 = objc_msgSend_experimentIdentifiers(v52, v306, v307, v308, v309);
    uint64_t v315 = objc_msgSend_trialExperimentID(v310, v311, v312, v313, v314);
    uint64_t v320 = objc_msgSend_experimentIdentifiers(v471, v316, v317, v318, v319);
    objc_msgSend_setTrialExperimentID_(v320, v321, (uint64_t)v315, v322, v323);

    objc_msgSend_setTrialIdentifierType_(v3, v324, 1, v325, v326);
    uint64_t v331 = objc_msgSend_experimentIdentifiers(v52, v327, v328, v329, v330);
    uint64_t v336 = objc_msgSend_trialTreatmentID(v331, v332, v333, v334, v335);
    objc_msgSend_setTrialTreatmentID_(v3, v337, (uint64_t)v336, v338, v339);

    uint64_t v344 = objc_msgSend_experimentIdentifiers(v52, v340, v341, v342, v343);
    id v349 = objc_msgSend_trialDeploymentID(v344, v345, v346, v347, v348);
    objc_msgSend_setTrialDeploymentID_(v3, v350, (uint64_t)v349, v351, v352);

    v357 = objc_msgSend_experimentIdentifiers(v52, v353, v354, v355, v356);
    v362 = objc_msgSend_trialExperimentID(v357, v358, v359, v360, v361);
    objc_msgSend_setTrialExperimentID_(v3, v363, (uint64_t)v362, v364, v365);
  }
  v366 = objc_msgSend_bmltIdentifiers(v52, v262, v263, v264, v265);

  if (v366)
  {
    uint64_t v370 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers);
    objc_msgSend_setBmltIdentifiers_(v471, v371, (uint64_t)v370, v372, v373);

    v378 = objc_msgSend_bmltIdentifiers(v52, v374, v375, v376, v377);
    uint64_t v383 = objc_msgSend_trialDeploymentID(v378, v379, v380, v381, v382);
    uint64_t v388 = objc_msgSend_bmltIdentifiers(v471, v384, v385, v386, v387);
    objc_msgSend_setTrialDeploymentID_(v388, v389, (uint64_t)v383, v390, v391);

    v396 = objc_msgSend_bmltIdentifiers(v52, v392, v393, v394, v395);
    v401 = objc_msgSend_trialTaskID(v396, v397, v398, v399, v400);
    uint64_t v406 = objc_msgSend_bmltIdentifiers(v471, v402, v403, v404, v405);
    objc_msgSend_setTrialTaskID_(v406, v407, (uint64_t)v401, v408, v409);

    objc_msgSend_setTrialIdentifierType_(v3, v410, 2, v411, v412);
    v417 = objc_msgSend_bmltIdentifiers(v52, v413, v414, v415, v416);
    uint64_t v422 = objc_msgSend_trialDeploymentID(v417, v418, v419, v420, v421);
    objc_msgSend_setTrialDeploymentID_(v3, v423, (uint64_t)v422, v424, v425);

    v430 = objc_msgSend_bmltIdentifiers(v52, v426, v427, v428, v429);
    int v435 = objc_msgSend_trialTaskID(v430, v431, v432, v433, v434);
    objc_msgSend_setTrialTaskID_(v3, v436, (uint64_t)v435, v437, v438);
  }
  objc_msgSend_setTrialIdentifiers_(v3, v367, (uint64_t)v471, v368, v369);
  objc_msgSend_setTimestamp_(v3, v439, v470, v440, v441);
  v446 = objc_msgSend_UUID(MEMORY[0x263F08C38], v442, v443, v444, v445);
  int v451 = objc_msgSend_UUIDString(v446, v447, v448, v449, v450);
  objc_msgSend_setTelemetryID_(v3, v452, (uint64_t)v451, v453, v454);

  uint64_t v459 = objc_msgSend_getContextId(LBFContextId, v455, v456, v457, v458);
  uint64_t v464 = objc_msgSend_UUIDString(v459, v460, v461, v462, v463);
  objc_msgSend_setContextID_(v3, v465, (uint64_t)v464, v466, v467);

  return v3;
}

+ (id)getCAEventDictionaryFromBiomeEvent:(id)a3
{
  v987[42] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v8 = objc_msgSend_getContextId(LBFContextId, v4, v5, v6, v7);
  v955 = objc_msgSend_UUIDString(v8, v9, v10, v11, v12);

  uint64_t v17 = objc_msgSend_UUID(MEMORY[0x263F08C38], v13, v14, v15, v16);
  v954 = objc_msgSend_UUIDString(v17, v18, v19, v20, v21);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v977 = 0;
    v978 = 0;
    v979 = 0;
    v980 = 0;
    v972 = 0;
    v973 = 0;
    v974 = 0;
    v975 = 0;
    uint64_t v42 = 0;
    v983 = 0;
    v984 = 0;
    v985 = 0;
    uint64_t v99 = 0;
    v976 = 0;
    v971 = 0;
    uint64_t v27 = 0;
    uint64_t v128 = &unk_2703E3E00;
    goto LABEL_22;
  }
  id v22 = v3;
  uint64_t v27 = objc_msgSend_timestamp(v22, v23, v24, v25, v26);
  uint64_t v32 = objc_msgSend_trialIdentifiers(v22, v28, v29, v30, v31);
  uint64_t v37 = objc_msgSend_bmltIdentifiers(v32, v33, v34, v35, v36);
  uint64_t v42 = objc_msgSend_trialDeploymentID(v37, v38, v39, v40, v41);

  uint64_t v47 = objc_msgSend_trialIdentifiers(v22, v43, v44, v45, v46);
  uint64_t v52 = objc_msgSend_bmltIdentifiers(v47, v48, v49, v50, v51);
  v983 = objc_msgSend_trialTaskID(v52, v53, v54, v55, v56);

  uint64_t v61 = objc_msgSend_trialIdentifiers(v22, v57, v58, v59, v60);
  uint64_t v66 = objc_msgSend_experimentIdentifiers(v61, v62, v63, v64, v65);
  v984 = objc_msgSend_trialDeploymentID(v66, v67, v68, v69, v70);

  uint64_t v75 = objc_msgSend_trialIdentifiers(v22, v71, v72, v73, v74);
  uint64_t v80 = objc_msgSend_experimentIdentifiers(v75, v76, v77, v78, v79);
  v985 = objc_msgSend_trialExperimentID(v80, v81, v82, v83, v84);

  uint64_t v89 = objc_msgSend_trialIdentifiers(v22, v85, v86, v87, v88);
  uint64_t v94 = objc_msgSend_experimentIdentifiers(v89, v90, v91, v92, v93);
  uint64_t v99 = objc_msgSend_trialTreatmentID(v94, v95, v96, v97, v98);

  int v104 = objc_msgSend_taskFetched(v22, v100, v101, v102, v103);

  if (v104)
  {
    uint64_t v109 = NSNumber;
    uint64_t v110 = objc_msgSend_taskFetched(v22, v105, v106, v107, v108);
    uint64_t v115 = objc_msgSend_succeeded((void *)v110, v111, v112, v113, v114);
    v980 = objc_msgSend_numberWithBool_(v109, v116, v115, v117, v118);

    int v123 = objc_msgSend_taskFetched(v22, v119, v120, v121, v122);
    LOBYTE(v110) = objc_msgSend_succeeded(v123, v124, v125, v126, v127);

    if (v110)
    {
      v978 = 0;
      v979 = 0;
    }
    else
    {
      uint64_t v129 = objc_msgSend_taskFetched(v22, v105, v106, v107, v108);
      v979 = objc_msgSend_errorDomain(v129, v130, v131, v132, v133);

      uint64_t v134 = NSString;
      uint64_t v139 = objc_msgSend_taskFetched(v22, v135, v136, v137, v138);
      uint64_t v144 = objc_msgSend_errorCode(v139, v140, v141, v142, v143);
      v978 = objc_msgSend_stringWithFormat_(v134, v145, @"%d", v146, v147, v144);
    }
  }
  else
  {
    v978 = 0;
    v979 = 0;
    v980 = 0;
  }
  uint64_t v148 = objc_msgSend_taskCompleted(v22, v105, v106, v107, v108);

  if (!v148)
  {
    v977 = 0;
    goto LABEL_12;
  }
  uint64_t v153 = NSNumber;
  uint64_t v154 = objc_msgSend_taskCompleted(v22, v149, v150, v151, v152);
  uint64_t v159 = objc_msgSend_succeeded((void *)v154, v155, v156, v157, v158);
  v977 = objc_msgSend_numberWithBool_(v153, v160, v159, v161, v162);

  uint64_t v167 = objc_msgSend_taskCompleted(v22, v163, v164, v165, v166);
  LOBYTE(v154) = objc_msgSend_succeeded(v167, v168, v169, v170, v171);

  if (v154)
  {
LABEL_12:
    v975 = 0;
    v976 = 0;
    goto LABEL_13;
  }
  uint64_t v172 = objc_msgSend_taskCompleted(v22, v149, v150, v151, v152);
  v976 = objc_msgSend_errorDomain(v172, v173, v174, v175, v176);

  uint64_t v177 = NSString;
  uint64_t v182 = objc_msgSend_taskCompleted(v22, v178, v179, v180, v181);
  uint64_t v187 = objc_msgSend_errorCode(v182, v183, v184, v185, v186);
  v975 = objc_msgSend_stringWithFormat_(v177, v188, @"%d", v189, v190, v187);

LABEL_13:
  uint64_t v191 = objc_msgSend_taskScheduled(v22, v149, v150, v151, v152);

  if (v191)
  {
    uint64_t v196 = NSNumber;
    uint64_t v197 = objc_msgSend_taskScheduled(v22, v192, v193, v194, v195);
    uint64_t v202 = objc_msgSend_succeeded((void *)v197, v198, v199, v200, v201);
    v974 = objc_msgSend_numberWithBool_(v196, v203, v202, v204, v205);

    uint64_t v210 = objc_msgSend_taskScheduled(v22, v206, v207, v208, v209);
    LOBYTE(v197) = objc_msgSend_succeeded(v210, v211, v212, v213, v214);

    if (v197)
    {
      v972 = 0;
      v973 = 0;
    }
    else
    {
      uint64_t v215 = objc_msgSend_taskScheduled(v22, v192, v193, v194, v195);
      v973 = objc_msgSend_errorDomain(v215, v216, v217, v218, v219);

      uint64_t v220 = NSString;
      int v225 = objc_msgSend_taskScheduled(v22, v221, v222, v223, v224);
      uint64_t v230 = objc_msgSend_errorCode(v225, v226, v227, v228, v229);
      v972 = objc_msgSend_stringWithFormat_(v220, v231, @"%d", v232, v233, v230);
    }
  }
  else
  {
    v972 = 0;
    v973 = 0;
    v974 = 0;
  }
  uint64_t v234 = objc_msgSend_activityScheduleStatus(v22, v192, v193, v194, v195);

  if (v234)
  {
    uint64_t v239 = NSNumber;
    uint64_t v240 = objc_msgSend_activityScheduleStatus(v22, v235, v236, v237, v238);
    uint64_t v245 = objc_msgSend_scheduled(v240, v241, v242, v243, v244);
    v971 = objc_msgSend_numberWithBool_(v239, v246, v245, v247, v248);
  }
  else
  {
    v971 = 0;
  }

  uint64_t v128 = &unk_2703E3E30;
LABEL_22:
  objc_opt_class();
  v956 = v3;
  if (objc_opt_isKindOfClass())
  {
    id v249 = v3;
    uint64_t v965 = objc_msgSend_timestamp(v249, v250, v251, v252, v253);

    uint64_t v258 = objc_msgSend_trialIdentifiers(v249, v254, v255, v256, v257);
    uint64_t v263 = objc_msgSend_bmltIdentifiers(v258, v259, v260, v261, v262);
    uint64_t v268 = objc_msgSend_trialDeploymentID(v263, v264, v265, v266, v267);

    uint64_t v273 = objc_msgSend_trialIdentifiers(v249, v269, v270, v271, v272);
    uint64_t v278 = objc_msgSend_bmltIdentifiers(v273, v274, v275, v276, v277);
    uint64_t v283 = objc_msgSend_trialTaskID(v278, v279, v280, v281, v282);

    uint64_t v288 = objc_msgSend_trialIdentifiers(v249, v284, v285, v286, v287);
    uint64_t v293 = objc_msgSend_experimentIdentifiers(v288, v289, v290, v291, v292);
    uint64_t v298 = objc_msgSend_trialDeploymentID(v293, v294, v295, v296, v297);

    uint64_t v303 = objc_msgSend_trialIdentifiers(v249, v299, v300, v301, v302);
    objc_msgSend_experimentIdentifiers(v303, v304, v305, v306, v307);
    uint64_t v309 = v308 = v99;
    uint64_t v314 = objc_msgSend_trialExperimentID(v309, v310, v311, v312, v313);

    uint64_t v319 = objc_msgSend_trialIdentifiers(v249, v315, v316, v317, v318);
    v324 = objc_msgSend_experimentIdentifiers(v319, v320, v321, v322, v323);
    uint64_t v329 = objc_msgSend_trialTreatmentID(v324, v325, v326, v327, v328);

    uint64_t v334 = objc_msgSend_performTaskStatus(v249, v330, v331, v332, v333);

    if (!v334) {
      goto LABEL_25;
    }
    uint64_t v339 = NSNumber;
    uint64_t v340 = objc_msgSend_performTaskStatus(v249, v335, v336, v337, v338);
    uint64_t v345 = objc_msgSend_succeeded(v340, v341, v342, v343, v344);
    uint64_t v334 = objc_msgSend_numberWithBool_(v339, v346, v345, v347, v348);

    uint64_t v353 = objc_msgSend_performTaskStatus(v249, v349, v350, v351, v352);
    char v358 = objc_msgSend_succeeded(v353, v354, v355, v356, v357);

    if ((v358 & 1) == 0)
    {
      uint64_t v361 = objc_msgSend_performTaskStatus(v249, v335, v336, v337, v338);
      v981 = objc_msgSend_errorDomain(v361, v362, v363, v364, v365);

      v366 = NSString;
      v371 = objc_msgSend_performTaskStatus(v249, v367, v368, v369, v370);
      uint64_t v376 = objc_msgSend_errorCode(v371, v372, v373, v374, v375);
      uint64_t v380 = objc_msgSend_stringWithFormat_(v366, v377, @"%d", v378, v379, v376);

      uint64_t v359 = (void *)v380;
    }
    else
    {
LABEL_25:
      uint64_t v359 = 0;
      v981 = 0;
    }
    uint64_t v381 = objc_msgSend_performTrialTaskStatus(v249, v335, v336, v337, v338);

    if (v381)
    {
      uint64_t v386 = v359;
      uint64_t v387 = NSNumber;
      uint64_t v388 = objc_msgSend_performTrialTaskStatus(v249, v382, v383, v384, v385);
      uint64_t v393 = objc_msgSend_succeeded(v388, v389, v390, v391, v392);
      v970 = objc_msgSend_numberWithBool_(v387, v394, v393, v395, v396);

      v401 = objc_msgSend_performTrialTaskStatus(v249, v397, v398, v399, v400);
      LOBYTE(v387) = objc_msgSend_succeeded(v401, v402, v403, v404, v405);

      if (v387)
      {
        uint64_t v359 = v386;
      }
      else
      {
        uint64_t v406 = objc_msgSend_performTrialTaskStatus(v249, v382, v383, v384, v385);
        uint64_t v411 = objc_msgSend_errorDomain(v406, v407, v408, v409, v410);

        uint64_t v412 = NSString;
        v417 = objc_msgSend_performTrialTaskStatus(v249, v413, v414, v415, v416);
        uint64_t v422 = objc_msgSend_errorCode(v417, v418, v419, v420, v421);
        uint64_t v426 = objc_msgSend_stringWithFormat_(v412, v423, @"%d", v424, v425, v422);

        uint64_t v359 = (void *)v426;
        v981 = (void *)v411;
      }
    }
    else
    {
      v970 = v334;
    }
    uint64_t v427 = objc_msgSend_stop(v249, v382, v383, v384, v385);

    if (v427)
    {
      uint64_t v432 = NSNumber;
      uint64_t v433 = objc_msgSend_stop(v249, v428, v429, v430, v431);
      uint64_t v438 = objc_msgSend_succeeded((void *)v433, v434, v435, v436, v437);
      uint64_t v442 = objc_msgSend_numberWithBool_(v432, v439, v438, v440, v441);

      v447 = objc_msgSend_stop(v249, v443, v444, v445, v446);
      LOBYTE(v433) = objc_msgSend_succeeded(v447, v448, v449, v450, v451);

      if (v433)
      {
        v968 = 0;
        v969 = 0;
      }
      else
      {
        uint64_t v456 = objc_msgSend_stop(v249, v452, v453, v454, v455);
        v969 = objc_msgSend_errorDomain(v456, v457, v458, v459, v460);

        uint64_t v461 = NSString;
        uint64_t v466 = objc_msgSend_stop(v249, v462, v463, v464, v465);
        uint64_t v471 = objc_msgSend_errorCode(v466, v467, v468, v469, v470);
        v968 = objc_msgSend_stringWithFormat_(v461, v472, @"%d", v473, v474, v471);
      }
      uint64_t v360 = (void *)v442;
    }
    else
    {
      v968 = 0;
      v969 = 0;
      uint64_t v360 = 0;
    }

    v982 = (void *)v268;
    v983 = (void *)v283;
    v984 = (void *)v298;
    v985 = (void *)v314;
    uint64_t v99 = (void *)v329;
    uint64_t v27 = (void *)v965;
    uint64_t v128 = &unk_2703E3E48;
    id v3 = v956;
  }
  else
  {
    v982 = v42;
    uint64_t v359 = 0;
    v981 = 0;
    v969 = 0;
    v970 = 0;
    v968 = 0;
    uint64_t v360 = 0;
  }
  objc_opt_class();
  v944 = v360;
  if (objc_opt_isKindOfClass())
  {
    id v475 = v3;
    uint64_t v966 = objc_msgSend_timestamp(v475, v476, v477, v478, v479);

    v484 = objc_msgSend_trialIdentifiers(v475, v480, v481, v482, v483);
    v489 = objc_msgSend_bmltIdentifiers(v484, v485, v486, v487, v488);
    uint64_t v494 = objc_msgSend_trialDeploymentID(v489, v490, v491, v492, v493);

    uint64_t v499 = objc_msgSend_trialIdentifiers(v475, v495, v496, v497, v498);
    uint64_t v504 = objc_msgSend_bmltIdentifiers(v499, v500, v501, v502, v503);
    uint64_t v509 = objc_msgSend_trialTaskID(v504, v505, v506, v507, v508);

    uint64_t v514 = objc_msgSend_trialIdentifiers(v475, v510, v511, v512, v513);
    uint64_t v519 = objc_msgSend_experimentIdentifiers(v514, v515, v516, v517, v518);
    uint64_t v524 = objc_msgSend_trialDeploymentID(v519, v520, v521, v522, v523);

    v529 = objc_msgSend_trialIdentifiers(v475, v525, v526, v527, v528);
    objc_msgSend_experimentIdentifiers(v529, v530, v531, v532, v533);
    v535 = uint64_t v534 = v99;
    uint64_t v540 = objc_msgSend_trialExperimentID(v535, v536, v537, v538, v539);

    long long v545 = objc_msgSend_trialIdentifiers(v475, v541, v542, v543, v544);
    v550 = objc_msgSend_experimentIdentifiers(v545, v546, v547, v548, v549);
    uint64_t v555 = objc_msgSend_trialTreatmentID(v550, v551, v552, v553, v554);

    unsigned int v560 = objc_msgSend_eventType(v475, v556, v557, v558, v559) - 1;
    if (v560 >= 3)
    {
      v562 = (char *)(id)LBFLogContextBitacoraStateInfo;
      if (os_log_type_enabled((os_log_t)v562, OS_LOG_TYPE_ERROR)) {
        sub_25458546C(v475, v562, v563, v564, v565);
      }

      v561 = &unk_2703E3E00;
    }
    else
    {
      v561 = (void *)qword_2653ADCB8[v560];
    }
    v953 = v561;
    uint64_t v360 = v944;

    v982 = (void *)v494;
    v983 = (void *)v509;
    v984 = (void *)v524;
    v985 = (void *)v540;
    uint64_t v99 = (void *)v555;
    uint64_t v27 = (void *)v966;
    uint64_t v128 = &unk_2703E3E18;
    id v3 = v956;
  }
  else
  {
    v953 = 0;
  }
  objc_opt_class();
  v945 = v359;
  if (objc_opt_isKindOfClass())
  {
    id v570 = v3;
    uint64_t v575 = objc_msgSend_timestamp(v570, v571, v572, v573, v574);

    v580 = objc_msgSend_trialIdentifiers(v570, v576, v577, v578, v579);
    v585 = objc_msgSend_bmltIdentifiers(v580, v581, v582, v583, v584);
    uint64_t v590 = objc_msgSend_trialDeploymentID(v585, v586, v587, v588, v589);

    v595 = objc_msgSend_trialIdentifiers(v570, v591, v592, v593, v594);
    v600 = objc_msgSend_bmltIdentifiers(v595, v596, v597, v598, v599);
    uint64_t v605 = objc_msgSend_trialTaskID(v600, v601, v602, v603, v604);

    v610 = objc_msgSend_trialIdentifiers(v570, v606, v607, v608, v609);
    v615 = objc_msgSend_experimentIdentifiers(v610, v611, v612, v613, v614);
    uint64_t v620 = objc_msgSend_trialDeploymentID(v615, v616, v617, v618, v619);

    v625 = objc_msgSend_trialIdentifiers(v570, v621, v622, v623, v624);
    v630 = objc_msgSend_experimentIdentifiers(v625, v626, v627, v628, v629);
    uint64_t v635 = objc_msgSend_trialExperimentID(v630, v631, v632, v633, v634);

    v640 = objc_msgSend_trialIdentifiers(v570, v636, v637, v638, v639);
    v645 = objc_msgSend_experimentIdentifiers(v640, v641, v642, v643, v644);
    uint64_t v942 = objc_msgSend_trialTreatmentID(v645, v646, v647, v648, v649);

    v654 = objc_msgSend_event(v570, v650, v651, v652, v653);
    LODWORD(v645) = objc_msgSend_phase(v654, v655, v656, v657, v658);

    v949 = (void *)v620;
    v951 = (void *)v605;
    v947 = (void *)v635;
    switch((int)v645)
    {
      case 1:
        uint64_t v27 = (void *)v575;
        v663 = NSNumber;
        uint64_t v664 = objc_msgSend_event(v570, v659, v660, v661, v662);
        uint64_t v669 = objc_msgSend_succeeded((void *)v664, v665, v666, v667, v668);
        uint64_t v673 = objc_msgSend_numberWithBool_(v663, v670, v669, v671, v672);

        v678 = objc_msgSend_event(v570, v674, v675, v676, v677);
        LOBYTE(v664) = objc_msgSend_succeeded(v678, v679, v680, v681, v682);

        v687 = (void *)v590;
        if (v664)
        {
          v688 = 0;
        }
        else
        {
          v789 = objc_msgSend_event(v570, v683, v684, v685, v686);
          v688 = objc_msgSend_errorMessage(v789, v790, v791, v792, v793);

          if (objc_msgSend_localizedCaseInsensitiveContainsString_(v688, v794, @";",
                               v795,
                               v796))
          {
            v693 = objc_msgSend_componentsSeparatedByString_(v688, v797, @"", v798, v799);;
            v964 = objc_msgSend_objectAtIndexedSubscript_(v693, v800, 0, v801, v802);
            goto LABEL_56;
          }
        }
        v964 = 0;
        v967 = 0;
        goto LABEL_72;
      case 2:
        v687 = (void *)v590;
        v697 = NSNumber;
        uint64_t v698 = objc_msgSend_event(v570, v659, v660, v661, v662);
        uint64_t v703 = objc_msgSend_succeeded((void *)v698, v699, v700, v701, v702);
        v967 = objc_msgSend_numberWithBool_(v697, v704, v703, v705, v706);

        v711 = objc_msgSend_event(v570, v707, v708, v709, v710);
        LOBYTE(v698) = objc_msgSend_succeeded(v711, v712, v713, v714, v715);

        uint64_t v27 = (void *)v575;
        if (v698)
        {
          uint64_t v673 = 0;
          v688 = 0;
          v964 = 0;
LABEL_72:
          v690 = 0;
          goto LABEL_73;
        }
        v852 = objc_msgSend_event(v570, v716, v717, v718, v719);
        v690 = objc_msgSend_errorMessage(v852, v853, v854, v855, v856);

        if (!objc_msgSend_localizedCaseInsensitiveContainsString_(v690, v857, @";",
                              v858,
                              v859))
        {
          uint64_t v673 = 0;
          v688 = 0;
          v964 = 0;
LABEL_73:
          v961 = 0;
          v963 = 0;
          goto LABEL_74;
        }
        v693 = objc_msgSend_componentsSeparatedByString_(v690, v860, @"", v861, v862);;
        v961 = objc_msgSend_objectAtIndexedSubscript_(v693, v863, 0, v864, v865);
        uint64_t v673 = 0;
        v688 = 0;
        v964 = 0;
LABEL_57:
        v963 = 0;
        v691 = 0;
        v959 = 0;
        goto LABEL_58;
      case 3:
        v720 = NSNumber;
        uint64_t v721 = objc_msgSend_event(v570, v659, v660, v661, v662);
        uint64_t v726 = objc_msgSend_succeeded((void *)v721, v722, v723, v724, v725);
        v963 = objc_msgSend_numberWithBool_(v720, v727, v726, v728, v729);

        v734 = objc_msgSend_event(v570, v730, v731, v732, v733);
        LOBYTE(v721) = objc_msgSend_succeeded(v734, v735, v736, v737, v738);

        v687 = (void *)v590;
        uint64_t v27 = (void *)v575;
        if (v721)
        {
          uint64_t v673 = 0;
          v688 = 0;
          v964 = 0;
          v967 = 0;
          v690 = 0;
          v961 = 0;
LABEL_74:
          v691 = 0;
          goto LABEL_75;
        }
        v866 = objc_msgSend_event(v570, v739, v740, v741, v742);
        v691 = objc_msgSend_errorMessage(v866, v867, v868, v869, v870);

        if (!objc_msgSend_localizedCaseInsensitiveContainsString_(v691, v871, @";",
                              v872,
                              v873))
        {
          uint64_t v673 = 0;
          v688 = 0;
          v964 = 0;
          v967 = 0;
          v690 = 0;
          v961 = 0;
LABEL_75:
          v959 = 0;
          v962 = 0;
          goto LABEL_76;
        }
        v693 = objc_msgSend_componentsSeparatedByString_(v691, v874, @"", v875, v876);;
        v959 = objc_msgSend_objectAtIndexedSubscript_(v693, v877, 0, v878, v879);
        uint64_t v673 = 0;
        v688 = 0;
        v964 = 0;
        v967 = 0;
        v690 = 0;
        v961 = 0;
LABEL_58:
        v962 = 0;
        v692 = 0;
        v958 = 0;
        goto LABEL_59;
      case 4:
        v743 = NSNumber;
        uint64_t v744 = objc_msgSend_event(v570, v659, v660, v661, v662);
        uint64_t v749 = objc_msgSend_succeeded((void *)v744, v745, v746, v747, v748);
        v962 = objc_msgSend_numberWithBool_(v743, v750, v749, v751, v752);

        v757 = objc_msgSend_event(v570, v753, v754, v755, v756);
        LOBYTE(v744) = objc_msgSend_succeeded(v757, v758, v759, v760, v761);

        v687 = (void *)v590;
        uint64_t v27 = (void *)v575;
        if (v744)
        {
          uint64_t v673 = 0;
          v688 = 0;
          v964 = 0;
          v967 = 0;
          v690 = 0;
          v961 = 0;
          v963 = 0;
          v691 = 0;
          v959 = 0;
LABEL_76:
          v692 = 0;
          goto LABEL_77;
        }
        v880 = objc_msgSend_event(v570, v762, v763, v764, v765);
        v692 = objc_msgSend_errorMessage(v880, v881, v882, v883, v884);

        if (!objc_msgSend_localizedCaseInsensitiveContainsString_(v692, v885, @";",
                              v886,
                              v887))
        {
          uint64_t v673 = 0;
          v688 = 0;
          v964 = 0;
          v967 = 0;
          v690 = 0;
          v961 = 0;
          v963 = 0;
          v691 = 0;
          v959 = 0;
LABEL_77:
          v958 = 0;
          v960 = 0;
          goto LABEL_78;
        }
        v693 = objc_msgSend_componentsSeparatedByString_(v692, v888, @"", v889, v890);;
        v958 = objc_msgSend_objectAtIndexedSubscript_(v693, v891, 0, v892, v893);
        v959 = 0;
        uint64_t v673 = 0;
        v688 = 0;
        v964 = 0;
        v967 = 0;
        v690 = 0;
        v961 = 0;
        v963 = 0;
        v691 = 0;
LABEL_59:
        v960 = 0;
        v946 = 0;
        v957 = 0;
        goto LABEL_60;
      case 5:
        v766 = NSNumber;
        uint64_t v767 = objc_msgSend_event(v570, v659, v660, v661, v662);
        uint64_t v772 = objc_msgSend_succeeded((void *)v767, v768, v769, v770, v771);
        v960 = objc_msgSend_numberWithBool_(v766, v773, v772, v774, v775);

        v780 = objc_msgSend_event(v570, v776, v777, v778, v779);
        LOBYTE(v767) = objc_msgSend_succeeded(v780, v781, v782, v783, v784);

        v687 = (void *)v590;
        uint64_t v27 = (void *)v575;
        if (v767)
        {
          uint64_t v673 = 0;
          v688 = 0;
          v964 = 0;
          v967 = 0;
          v690 = 0;
          v961 = 0;
          v962 = 0;
          v963 = 0;
          v691 = 0;
          v958 = 0;
          v959 = 0;
          v692 = 0;
LABEL_78:
          v946 = 0;
          goto LABEL_79;
        }
        v894 = objc_msgSend_event(v570, v785, v786, v787, v788);
        v899 = objc_msgSend_errorMessage(v894, v895, v896, v897, v898);

        v946 = v899;
        if (!objc_msgSend_localizedCaseInsensitiveContainsString_(v899, v900, @";",
                              v901,
                              v902))
        {
          uint64_t v673 = 0;
          v688 = 0;
          v964 = 0;
          v967 = 0;
          v690 = 0;
          v961 = 0;
          v962 = 0;
          v963 = 0;
          v691 = 0;
          v958 = 0;
          v959 = 0;
          v692 = 0;
LABEL_79:
          v957 = 0;
          goto LABEL_80;
        }
        v693 = objc_msgSend_componentsSeparatedByString_(v899, v903, @"", v904, v905);;
        v957 = objc_msgSend_objectAtIndexedSubscript_(v693, v906, 0, v907, v908);
        v958 = 0;
        uint64_t v673 = 0;
        v688 = 0;
        v964 = 0;
        v967 = 0;
        v690 = 0;
        v961 = 0;
        v962 = 0;
        v963 = 0;
        v691 = 0;
        v959 = 0;
        v692 = 0;
LABEL_60:

LABEL_80:
        v982 = v687;
        v983 = v951;
        v984 = v949;
        v985 = v947;
        v689 = (void *)v942;
        uint64_t v128 = &unk_2703E3E60;
        uint64_t v359 = v945;
        break;
      default:
        v687 = (void *)v590;
        uint64_t v27 = (void *)v575;
        v693 = (id)LBFLogContextBitacoraStateInfo;
        if (os_log_type_enabled(v693, OS_LOG_TYPE_ERROR)) {
          sub_2545853E0(v570, (const char *)v693, v694, v695, v696);
        }
        uint64_t v673 = 0;
        v688 = 0;
        v964 = 0;
LABEL_56:
        v967 = 0;
        v690 = 0;
        v961 = 0;
        goto LABEL_57;
    }
  }
  else
  {
    v689 = v99;
    uint64_t v673 = 0;
    v688 = 0;
    v964 = 0;
    v967 = 0;
    v690 = 0;
    v961 = 0;
    v962 = 0;
    v963 = 0;
    v691 = 0;
    v958 = 0;
    v959 = 0;
    v692 = 0;
    v960 = 0;
    v946 = 0;
    v957 = 0;
  }
  v986[0] = @"contextId";
  v986[1] = @"event_donator";
  v987[0] = v955;
  v987[1] = v128;
  v987[2] = v954;
  uint64_t v803 = (uint64_t)v359;
  v986[2] = @"eventId";
  v986[3] = @"lighthouseplugin_performTaskStatus_errorCode";
  if (!v359)
  {
    uint64_t v803 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v938 = (void *)v803;
  v987[3] = v803;
  v986[4] = @"lighthouseplugin_performTaskStatus_errorDomain";
  uint64_t v804 = (uint64_t)v981;
  if (!v981)
  {
    uint64_t v804 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v937 = (void *)v804;
  v987[4] = v804;
  v986[5] = @"lighthouseplugin_performTaskStatus_succeeded";
  uint64_t v805 = (uint64_t)v970;
  if (!v970)
  {
    uint64_t v805 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v936 = (void *)v805;
  v987[5] = v805;
  v986[6] = @"lighthouseplugin_stop_errorCode";
  uint64_t v806 = (uint64_t)v968;
  if (!v968)
  {
    uint64_t v806 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v935 = (void *)v806;
  v987[6] = v806;
  v986[7] = @"lighthouseplugin_stop_errorDomain";
  uint64_t v807 = (uint64_t)v969;
  if (!v969)
  {
    uint64_t v807 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v934 = (void *)v807;
  v987[7] = v807;
  v986[8] = @"lighthouseplugin_stop_succeeded";
  uint64_t v808 = (uint64_t)v360;
  if (!v360)
  {
    uint64_t v808 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v933 = (void *)v808;
  v987[8] = v808;
  v986[9] = @"mlruntimed_activityScheduleStatus_scheduled";
  uint64_t v809 = (uint64_t)v971;
  if (!v971)
  {
    uint64_t v809 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v932 = (void *)v809;
  v987[9] = v809;
  v986[10] = @"mlruntimed_taskCompleted_errorCode";
  uint64_t v810 = (uint64_t)v975;
  if (!v975)
  {
    uint64_t v810 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v931 = (void *)v810;
  v987[10] = v810;
  v986[11] = @"mlruntimed_taskCompleted_errorDomain";
  uint64_t v811 = (uint64_t)v976;
  if (!v976)
  {
    uint64_t v811 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v930 = (void *)v811;
  v987[11] = v811;
  v986[12] = @"mlruntimed_taskCompleted_succeeded";
  uint64_t v812 = (uint64_t)v977;
  if (!v977)
  {
    uint64_t v812 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v929 = (void *)v812;
  v987[12] = v812;
  v986[13] = @"mlruntimed_taskFetched_errorCode";
  uint64_t v813 = (uint64_t)v978;
  if (!v978)
  {
    uint64_t v813 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v928 = (void *)v813;
  v987[13] = v813;
  v986[14] = @"mlruntimed_taskFetched_errorDomain";
  uint64_t v814 = (uint64_t)v979;
  if (!v979)
  {
    uint64_t v814 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v927 = (void *)v814;
  v987[14] = v814;
  v986[15] = @"mlruntimed_taskFetched_succeeded";
  uint64_t v815 = (uint64_t)v980;
  if (!v980)
  {
    uint64_t v815 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v926 = (void *)v815;
  v987[15] = v815;
  v986[16] = @"mlruntimed_taskScheduled_errorCode";
  uint64_t v816 = (uint64_t)v972;
  if (!v972)
  {
    uint64_t v816 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v925 = (void *)v816;
  v987[16] = v816;
  v986[17] = @"mlruntimed_taskScheduled_errorDomain";
  uint64_t v817 = (uint64_t)v973;
  if (!v973)
  {
    uint64_t v817 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v924 = (void *)v817;
  v987[17] = v817;
  v986[18] = @"mlruntimed_taskScheduled_succeeded";
  uint64_t v818 = (uint64_t)v974;
  if (!v974)
  {
    uint64_t v818 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v923 = (void *)v818;
  v987[18] = v818;
  v986[19] = @"dprivacyd_donationReceived_succeeded";
  uint64_t v819 = v673;
  if (!v673)
  {
    uint64_t v819 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v922 = (void *)v819;
  v987[19] = v819;
  v986[20] = @"dprivacyd_donationReceived_errorMessage";
  uint64_t v820 = (uint64_t)v688;
  if (!v688)
  {
    uint64_t v820 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v921 = (void *)v820;
  v987[20] = v820;
  v986[21] = @"dprivacyd_donationReceived_errorCode";
  uint64_t v821 = (uint64_t)v964;
  if (!v964)
  {
    uint64_t v821 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v920 = (void *)v821;
  v987[21] = v821;
  v986[22] = @"dprivacyd_randomization_succeeded";
  uint64_t v822 = (uint64_t)v967;
  if (!v967)
  {
    uint64_t v822 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v919 = (void *)v822;
  v987[22] = v822;
  v986[23] = @"dprivacyd_randomization_errorMessage";
  uint64_t v823 = (uint64_t)v690;
  if (!v690)
  {
    uint64_t v823 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v918 = (void *)v823;
  v987[23] = v823;
  v986[24] = @"dprivacyd_randomization_errorCode";
  uint64_t v824 = (uint64_t)v961;
  if (!v961)
  {
    uint64_t v824 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v917 = (void *)v824;
  v987[24] = v824;
  v986[25] = @"dprivacyd_budgetCheck_succeeded";
  uint64_t v825 = (uint64_t)v963;
  if (!v963)
  {
    uint64_t v825 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v916 = (void *)v825;
  v987[25] = v825;
  v986[26] = @"dprivacyd_budgetCheck_errorMessage";
  uint64_t v826 = (uint64_t)v691;
  if (!v691)
  {
    uint64_t v826 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v915 = (void *)v826;
  v987[26] = v826;
  v986[27] = @"dprivacyd_budgetCheck_errorCode";
  uint64_t v827 = (uint64_t)v959;
  if (!v959)
  {
    uint64_t v827 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v914 = (void *)v827;
  v987[27] = v827;
  v986[28] = @"dprivacyd_payloadCreation_succeeded";
  uint64_t v828 = (uint64_t)v962;
  if (!v962)
  {
    uint64_t v828 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v913 = (void *)v828;
  v987[28] = v828;
  v986[29] = @"dprivacyd_payloadCreation_errorMessage";
  uint64_t v829 = (uint64_t)v692;
  if (!v692)
  {
    uint64_t v829 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v912 = (void *)v829;
  v987[29] = v829;
  v986[30] = @"dprivacyd_payloadCreation_errorCode";
  uint64_t v830 = (uint64_t)v958;
  if (!v958)
  {
    uint64_t v830 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v911 = (void *)v830;
  v987[30] = v830;
  v986[31] = @"dprivacyd_upload_succeeded";
  uint64_t v831 = (uint64_t)v960;
  if (!v960)
  {
    uint64_t v831 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v950 = v691;
  v940 = v688;
  v910 = (void *)v831;
  v987[31] = v831;
  v986[32] = @"dprivacyd_upload_errorMessage";
  uint64_t v832 = (uint64_t)v946;
  if (!v946)
  {
    uint64_t v832 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v952 = v690;
  v941 = (void *)v673;
  v909 = (void *)v832;
  v987[32] = v832;
  v986[33] = @"dprivacyd_upload_errorCode";
  v833 = v957;
  if (!v957)
  {
    v833 = objc_msgSend_null(MEMORY[0x263EFF9D0], v566, v567, v568, v569);
  }
  v987[33] = v833;
  v986[34] = @"timestamp";
  v943 = v27;
  v834 = objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v566, (uint64_t)v27, v568, v569);
  v987[34] = v834;
  v986[35] = @"triald_eventSucceeded";
  v843 = objc_msgSend_null(MEMORY[0x263EFF9D0], v835, v836, v837, v838);
  v987[35] = v843;
  v986[36] = @"triald_eventType";
  v844 = v953;
  if (!v953)
  {
    v844 = objc_msgSend_null(MEMORY[0x263EFF9D0], v839, v840, v841, v842);
  }
  v987[36] = v844;
  v986[37] = @"trialIdentifiers_BMLTIdentifiers_trialDeploymentID";
  v845 = v982;
  if (!v982)
  {
    v845 = objc_msgSend_null(MEMORY[0x263EFF9D0], v839, v840, v841, v842);
  }
  v987[37] = v845;
  v986[38] = @"trialIdentifiers_BMLTIdentifiers_trialTaskID";
  v846 = v983;
  if (!v983)
  {
    v846 = objc_msgSend_null(MEMORY[0x263EFF9D0], v839, v840, v841, v842);
  }
  v987[38] = v846;
  v986[39] = @"trialIdentifiers_experimentIdentifiers_trialDeploymentID";
  v847 = v984;
  if (!v984)
  {
    v847 = objc_msgSend_null(MEMORY[0x263EFF9D0], v839, v840, v841, v842);
  }
  v948 = v692;
  v987[39] = v847;
  v986[40] = @"trialIdentifiers_experimentIdentifiers_trialExperimentID";
  v848 = v985;
  if (!v985)
  {
    v848 = objc_msgSend_null(MEMORY[0x263EFF9D0], v839, v840, v841, v842);
  }
  v987[40] = v848;
  v986[41] = @"trialIdentifiers_experimentIdentifiers_trialTreatmentID";
  v849 = v689;
  if (!v689)
  {
    v849 = objc_msgSend_null(MEMORY[0x263EFF9D0], v839, v840, v841, v842);
  }
  v987[41] = v849;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v839, (uint64_t)v987, (uint64_t)v986, 42);
  id v939 = (id)objc_claimAutoreleasedReturnValue();
  if (!v689) {

  }
  if (!v985) {
  if (!v984)
  }

  if (!v983) {
  if (!v982)
  }

  if (!v953) {
  if (!v957)
  }

  if (!v946) {
  if (!v960)
  }

  if (!v958) {
  if (!v948)
  }

  if (!v962) {
  if (!v959)
  }

  if (!v950) {
  if (!v963)
  }

  if (!v961) {
  if (!v952)
  }

  if (!v967) {
  if (v964)
  }
  {
    if (v940) {
      goto LABEL_193;
    }
LABEL_224:

    if (v941) {
      goto LABEL_194;
    }
    goto LABEL_225;
  }

  if (!v940) {
    goto LABEL_224;
  }
LABEL_193:
  if (v941) {
    goto LABEL_194;
  }
LABEL_225:

LABEL_194:
  if (!v974) {

  }
  if (!v973) {
  if (!v972)
  }

  if (!v980) {
  if (!v979)
  }

  if (!v978) {
  if (!v977)
  }

  if (!v976) {
  if (!v975)
  }

  if (v971)
  {
    if (v944) {
      goto LABEL_214;
    }
  }
  else
  {

    if (v944) {
      goto LABEL_214;
    }
  }

LABEL_214:
  if (!v969) {

  }
  if (!v968) {
  if (!v970)
  }

  if (!v981)
  {

    if (v945) {
      goto LABEL_222;
    }
LABEL_229:

    goto LABEL_222;
  }
  if (!v945) {
    goto LABEL_229;
  }
LABEL_222:
  id v850 = v939;

  return v850;
}

- (BOOL)uploadRawEventsToCoreAnalytics
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = self->_bitacoraEvents;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v4)
  {
    uint64_t v8 = v4;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v2);
        }
        uint64_t v13 = objc_msgSend_getCAEventDictionaryFromBiomeEvent_(LBFBitacoraStateInfo, v5, *(void *)(*((void *)&v14 + 1) + 8 * i), v6, v7);
        id v11 = v13;
        AnalyticsSendEventLazy();
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v14, (uint64_t)v18, 16);
    }
    while (v8);
  }

  return 1;
}

- (BOOL)uploadToDedisco
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_getDictionaryRepresentation(self, a2, v2, v3, v4);
  id v11 = objc_msgSend_trialIdentifiers(self, v7, v8, v9, v10);
  long long v16 = objc_msgSend_experimentIdentifiers(v11, v12, v13, v14, v15);

  long long v17 = LBFLogContextBitacoraStateInfo;
  if (v16)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_254547000, v17, OS_LOG_TYPE_INFO, "Dedisco CA Input Dictionary: %@", (uint8_t *)&buf, 0xCu);
    }
    id v22 = objc_msgSend_trialIdentifiers(self, v18, v19, v20, v21);
    uint64_t v27 = objc_msgSend_experimentIdentifiers(v22, v23, v24, v25, v26);
    uint64_t v32 = objc_msgSend_trialExperimentID(v27, v28, v29, v30, v31);

    uint64_t v37 = objc_msgSend_trialIdentifiers(self, v33, v34, v35, v36);
    uint64_t v42 = objc_msgSend_experimentIdentifiers(v37, v38, v39, v40, v41);
    uint64_t v47 = objc_msgSend_trialDeploymentID(v42, v43, v44, v45, v46);

    uint64_t v52 = objc_msgSend_trialIdentifiers(self, v48, v49, v50, v51);
    uint64_t v57 = objc_msgSend_experimentIdentifiers(v52, v53, v54, v55, v56);
    uint64_t v62 = objc_msgSend_trialTreatmentID(v57, v58, v59, v60, v61);

    uint64_t v114 = objc_msgSend_stringWithFormat_(NSString, v63, @"fedstats:com.apple.insights.telemetry:dprivacyd:%@:%@:%@", v64, v65, v32, v47, v62);
    uint64_t v113 = objc_msgSend_stringWithFormat_(NSString, v66, @"fedstats:com.apple.insights.telemetry:plugin_success:%@:%@:%@", v67, v68, v32, v47, v62);
    uint64_t v72 = objc_msgSend_stringWithFormat_(NSString, v69, @"fedstats:com.apple.insights.telemetry:plugin_success_time_deltas:%@:%@:%@", v70, v71, v32, v47, v62);
    uint64_t v73 = LBFLogContextBitacoraStateInfo;
    if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_254547000, v73, OS_LOG_TYPE_INFO, "Uploading to Fedstats.", (uint8_t *)&buf, 2u);
    }
    uint64_t v118 = 0;
    uint64_t v119 = &v118;
    uint64_t v120 = 0x2050000000;
    uint64_t v74 = (void *)qword_269E08580;
    uint64_t v121 = qword_269E08580;
    if (!qword_269E08580)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      int v123 = sub_25455A54C;
      uint64_t v124 = &unk_2653ADB68;
      uint64_t v125 = &v118;
      sub_25455A54C((uint64_t)&buf);
      uint64_t v74 = (void *)v119[3];
    }
    id v75 = v74;
    _Block_object_dispose(&v118, 8);
    if (!v75)
    {
      uint64_t v77 = LBFLogContextBitacoraStateInfo;
      if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_DEBUG)) {
        sub_254585900(v77);
      }
    }
    id v117 = 0;
    uint64_t v78 = objc_msgSend_encodeDataAndRecord_dataTypeContent_baseKey_errorOut_(v75, v76, (uint64_t)v6, (uint64_t)&unk_2703E4260, (uint64_t)v114, &v117);
    id v79 = v117;
    uint64_t v80 = LBFLogContextBitacoraStateInfo;
    if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_DEBUG)) {
      sub_25458587C(v78, v80, v82, v83, v84, v85, v86, v87);
    }
    if (v79)
    {
      uint64_t v88 = (void *)LBFLogContextBitacoraStateInfo;
      if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR)) {
        sub_2545857D0(v88, v79);
      }
    }
    id v116 = v79;
    uint64_t v89 = objc_msgSend_encodeDataAndRecord_dataTypeContent_baseKey_errorOut_(v75, v81, (uint64_t)v6, (uint64_t)&unk_2703E4440, (uint64_t)v113, &v116);
    id v90 = v116;

    uint64_t v91 = LBFLogContextBitacoraStateInfo;
    if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_DEBUG)) {
      sub_25458574C(v89, v91, v93, v94, v95, v96, v97, v98);
    }
    if (v90)
    {
      uint64_t v99 = (void *)LBFLogContextBitacoraStateInfo;
      if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR)) {
        sub_2545856A0(v99, v90);
      }
    }
    id v115 = v90;
    uint64_t v100 = objc_msgSend_encodeDataAndRecord_dataTypeContent_baseKey_errorOut_(v75, v92, (uint64_t)v6, (uint64_t)&unk_2703E4620, (uint64_t)v72, &v115);
    id v101 = v115;

    uint64_t v102 = LBFLogContextBitacoraStateInfo;
    if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_DEBUG)) {
      sub_25458561C(v100, v102, v103, v104, v105, v106, v107, v108);
    }
    BOOL v109 = v101 == 0;
    if (v101)
    {
      uint64_t v110 = (void *)LBFLogContextBitacoraStateInfo;
      if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR)) {
        sub_254585570(v110, v101);
      }
      uint64_t v111 = LBFLogContextBitacoraStateInfo;
      if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_DEBUG)) {
        sub_25458552C(v111);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR)) {
      sub_2545854E8(v17);
    }
    BOOL v109 = 0;
  }

  return v109;
}

- (id)addMLHostMarkerToString:(id)a3
{
  return (id)((uint64_t (*)(id, char *, __CFString *))MEMORY[0x270F9A6D0])(a3, sel_stringByAppendingString_, @"_MLHost");
}

- (NSString)stateId
{
  return self->_stateId;
}

- (BMLighthouseLedgerTrialIdentifiers)trialIdentifiers
{
  return self->_trialIdentifiers;
}

- (NSUUID)contextId
{
  return self->_contextId;
}

- (NSDate)bucketStartTime
{
  return self->_bucketStartTime;
}

- (NSDate)bucketEndTime
{
  return self->_bucketEndTime;
}

- (int64_t)latestState
{
  return self->_latestState;
}

- (void)setLatestState:(int64_t)a3
{
  self->_unint64_t latestState = a3;
}

- (NSMutableArray)timedeltas_To_State_Allocated
{
  return self->_timedeltas_To_State_Allocated;
}

- (NSMutableArray)timedeltas_To_State_Activated
{
  return self->_timedeltas_To_State_Activated;
}

- (NSMutableArray)timedeltas_To_State_Deactivated
{
  return self->_timedeltas_To_State_Deactivated;
}

- (NSMutableArray)timedeltas_To_State_TaskFetched
{
  return self->_timedeltas_To_State_TaskFetched;
}

- (NSMutableArray)timedeltas_To_State_TaskScheduled
{
  return self->_timedeltas_To_State_TaskScheduled;
}

- (NSMutableArray)timedeltas_To_State_TaskCompleted
{
  return self->_timedeltas_To_State_TaskCompleted;
}

- (NSMutableArray)timedeltas_To_State_PerformTask
{
  return self->_timedeltas_To_State_PerformTask;
}

- (NSMutableArray)timedeltas_To_State_PluginStop
{
  return self->_timedeltas_To_State_PluginStop;
}

- (NSMutableArray)timedeltas_To_State_Unexpeted
{
  return self->_timedeltas_To_State_Unexpeted;
}

- (NSMutableArray)timedeltas_To_State_DprivacydDonationReceived
{
  return self->_timedeltas_To_State_DprivacydDonationReceived;
}

- (NSMutableArray)timedeltas_To_State_DprivacydRandomization
{
  return self->_timedeltas_To_State_DprivacydRandomization;
}

- (NSMutableArray)timedeltas_To_State_DprivacydBudgetCheck
{
  return self->_timedeltas_To_State_DprivacydBudgetCheck;
}

- (NSMutableArray)timedeltas_To_State_DprivacydPayloadCreation
{
  return self->_timedeltas_To_State_DprivacydPayloadCreation;
}

- (NSMutableArray)timedeltas_To_State_DprivacydUpload
{
  return self->_timedeltas_To_State_DprivacydUpload;
}

- (NSMutableArray)timedeltas_To_State_AllocatedFailed
{
  return self->_timedeltas_To_State_AllocatedFailed;
}

- (NSMutableArray)timedeltas_To_State_ActivatedFailed
{
  return self->_timedeltas_To_State_ActivatedFailed;
}

- (NSMutableArray)timedeltas_To_State_DeactivatedFailed
{
  return self->_timedeltas_To_State_DeactivatedFailed;
}

- (NSMutableArray)timedeltas_To_State_TaskFetchedFailed
{
  return self->_timedeltas_To_State_TaskFetchedFailed;
}

- (NSMutableArray)timedeltas_To_State_TaskScheduledFailed
{
  return self->_timedeltas_To_State_TaskScheduledFailed;
}

- (NSMutableArray)timedeltas_To_State_TaskCompletedFailed
{
  return self->_timedeltas_To_State_TaskCompletedFailed;
}

- (NSMutableArray)timedeltas_To_State_PerformTaskFailed
{
  return self->_timedeltas_To_State_PerformTaskFailed;
}

- (NSMutableArray)timedeltas_To_State_PluginStopFailed
{
  return self->_timedeltas_To_State_PluginStopFailed;
}

- (NSMutableArray)timedeltas_To_State_DprivacydDonationReceivedFailed
{
  return self->_timedeltas_To_State_DprivacydDonationReceivedFailed;
}

- (NSMutableArray)timedeltas_To_State_DprivacydRandomizationFailed
{
  return self->_timedeltas_To_State_DprivacydRandomizationFailed;
}

- (NSMutableArray)timedeltas_To_State_DprivacydBudgetCheckFailed
{
  return self->_timedeltas_To_State_DprivacydBudgetCheckFailed;
}

- (NSMutableArray)timedeltas_To_State_DprivacydPayloadCreationFailed
{
  return self->_timedeltas_To_State_DprivacydPayloadCreationFailed;
}

- (NSMutableArray)timedeltas_To_State_DprivacydUploadFailed
{
  return self->_timedeltas_To_State_DprivacydUploadFailed;
}

- (NSNumber)isAllocated
{
  return self->_isAllocated;
}

- (NSNumber)isActivated
{
  return self->_isActivated;
}

- (BOOL)isAllocated_implicit
{
  return self->_isAllocated_implicit;
}

- (void)setIsAllocated_implicit:(BOOL)a3
{
  self->_isAllocated_implicit = a3;
}

- (BOOL)isActivated_implicit
{
  return self->_isActivated_implicit;
}

- (void)setIsActivated_implicit:(BOOL)a3
{
  self->_isActivated_implicit = a3;
}

- (NSNumber)count_Allocated_Succeeded
{
  return self->_count_Allocated_Succeeded;
}

- (NSNumber)count_Allocated_Failed
{
  return self->_count_Allocated_Failed;
}

- (NSNumber)count_Activated_Succeeded
{
  return self->_count_Activated_Succeeded;
}

- (NSNumber)count_Activated_Failed
{
  return self->_count_Activated_Failed;
}

- (NSNumber)count_Deactivated_Succeeded
{
  return self->_count_Deactivated_Succeeded;
}

- (NSNumber)count_Deactivated_Failed
{
  return self->_count_Deactivated_Failed;
}

- (NSNumber)count_TaskFetched_Succeeded
{
  return self->_count_TaskFetched_Succeeded;
}

- (NSNumber)count_TaskFetched_Failed
{
  return self->_count_TaskFetched_Failed;
}

- (NSNumber)count_TaskScheduled_Succeeded
{
  return self->_count_TaskScheduled_Succeeded;
}

- (NSNumber)count_TaskScheduled_Failed
{
  return self->_count_TaskScheduled_Failed;
}

- (NSNumber)count_TaskCompleted_Succeeded
{
  return self->_count_TaskCompleted_Succeeded;
}

- (NSNumber)count_TaskCompleted_Failed
{
  return self->_count_TaskCompleted_Failed;
}

- (NSNumber)count_PerformTask_Succeeded
{
  return self->_count_PerformTask_Succeeded;
}

- (NSNumber)count_PerformTask_Failed
{
  return self->_count_PerformTask_Failed;
}

- (NSNumber)count_Stop_Succeeded
{
  return self->_count_Stop_Succeeded;
}

- (NSNumber)count_Stop_Failed
{
  return self->_count_Stop_Failed;
}

- (NSNumber)count_DprivacydDonationReceived_Succeeded
{
  return self->_count_DprivacydDonationReceived_Succeeded;
}

- (NSNumber)count_DprivacydDonationReceived_Failed
{
  return self->_count_DprivacydDonationReceived_Failed;
}

- (NSNumber)count_DprivacydRandomization_Succeeded
{
  return self->_count_DprivacydRandomization_Succeeded;
}

- (NSNumber)count_DprivacydRandomization_Failed
{
  return self->_count_DprivacydRandomization_Failed;
}

- (NSNumber)count_DprivacydBudgetCheck_Succeeded
{
  return self->_count_DprivacydBudgetCheck_Succeeded;
}

- (NSNumber)count_DprivacydBudgetCheck_Failed
{
  return self->_count_DprivacydBudgetCheck_Failed;
}

- (NSNumber)count_DprivacydPayloadCreation_Succeeded
{
  return self->_count_DprivacydPayloadCreation_Succeeded;
}

- (NSNumber)count_DprivacydPayloadCreation_Failed
{
  return self->_count_DprivacydPayloadCreation_Failed;
}

- (NSNumber)count_DprivacydUpload_Succeeded
{
  return self->_count_DprivacydUpload_Succeeded;
}

- (NSNumber)count_DprivacydUpload_Failed
{
  return self->_count_DprivacydUpload_Failed;
}

- (NSDate)timestamp_Allocated_Succeeded
{
  return self->_timestamp_Allocated_Succeeded;
}

- (NSDate)timestamp_Allocated_Failed
{
  return self->_timestamp_Allocated_Failed;
}

- (NSDate)timestamp_Activated_Succeeded
{
  return self->_timestamp_Activated_Succeeded;
}

- (NSDate)timestamp_Activated_Failed
{
  return self->_timestamp_Activated_Failed;
}

- (NSDate)timestamp_Deactivated_Succeeded
{
  return self->_timestamp_Deactivated_Succeeded;
}

- (NSDate)timestamp_Deactivated_Failed
{
  return self->_timestamp_Deactivated_Failed;
}

- (NSDate)timestamp_TaskFetched_Succeeded
{
  return self->_timestamp_TaskFetched_Succeeded;
}

- (NSDate)timestamp_TaskFetched_Failed
{
  return self->_timestamp_TaskFetched_Failed;
}

- (NSDate)timestamp_TaskScheduled_Succeeded
{
  return self->_timestamp_TaskScheduled_Succeeded;
}

- (NSDate)timestamp_TaskScheduled_Failed
{
  return self->_timestamp_TaskScheduled_Failed;
}

- (NSDate)timestamp_TaskCompleted_Succeeded
{
  return self->_timestamp_TaskCompleted_Succeeded;
}

- (NSDate)timestamp_TaskCompleted_Failed
{
  return self->_timestamp_TaskCompleted_Failed;
}

- (NSDate)timestamp_PerformTask_Succeeded
{
  return self->_timestamp_PerformTask_Succeeded;
}

- (NSDate)timestamp_PerformTask_Failed
{
  return self->_timestamp_PerformTask_Failed;
}

- (NSDate)timestamp_Stop_Succeeded
{
  return self->_timestamp_Stop_Succeeded;
}

- (NSDate)timestamp_Stop_Failed
{
  return self->_timestamp_Stop_Failed;
}

- (NSDate)timestamp_DprivacydDonationReceived_Succeeded
{
  return self->_timestamp_DprivacydDonationReceived_Succeeded;
}

- (NSDate)timestamp_DprivacydDonationReceived_Failed
{
  return self->_timestamp_DprivacydDonationReceived_Failed;
}

- (NSDate)timestamp_DprivacydRandomization_Succeeded
{
  return self->_timestamp_DprivacydRandomization_Succeeded;
}

- (NSDate)timestamp_DprivacydRandomization_Failed
{
  return self->_timestamp_DprivacydRandomization_Failed;
}

- (NSDate)timestamp_DprivacydBudgetCheck_Succeeded
{
  return self->_timestamp_DprivacydBudgetCheck_Succeeded;
}

- (NSDate)timestamp_DprivacydBudgetCheck_Failed
{
  return self->_timestamp_DprivacydBudgetCheck_Failed;
}

- (NSDate)timestamp_DprivacydPayloadCreation_Succeeded
{
  return self->_timestamp_DprivacydPayloadCreation_Succeeded;
}

- (NSDate)timestamp_DprivacydPayloadCreation_Failed
{
  return self->_timestamp_DprivacydPayloadCreation_Failed;
}

- (NSDate)timestamp_DprivacydUpload_Succeeded
{
  return self->_timestamp_DprivacydUpload_Succeeded;
}

- (NSDate)timestamp_DprivacydUpload_Failed
{
  return self->_timestamp_DprivacydUpload_Failed;
}

- (NSArray)bitacoraStateTransitions
{
  return self->_bitacoraStateTransitions;
}

- (NSArray)bitacoraEvents
{
  return self->_bitacoraEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitacoraEvents, 0);
  objc_storeStrong((id *)&self->_bitacoraStateTransitions, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydUpload_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydUpload_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydPayloadCreation_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydPayloadCreation_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydBudgetCheck_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydBudgetCheck_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydRandomization_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydRandomization_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydDonationReceived_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydDonationReceived_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_Stop_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_Stop_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_PerformTask_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_PerformTask_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_TaskCompleted_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_TaskCompleted_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_TaskScheduled_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_TaskScheduled_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_TaskFetched_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_TaskFetched_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_Deactivated_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_Deactivated_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_Activated_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_Activated_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_Allocated_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_Allocated_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_DprivacydUpload_Failed, 0);
  objc_storeStrong((id *)&self->_count_DprivacydUpload_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_DprivacydPayloadCreation_Failed, 0);
  objc_storeStrong((id *)&self->_count_DprivacydPayloadCreation_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_DprivacydBudgetCheck_Failed, 0);
  objc_storeStrong((id *)&self->_count_DprivacydBudgetCheck_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_DprivacydRandomization_Failed, 0);
  objc_storeStrong((id *)&self->_count_DprivacydRandomization_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_DprivacydDonationReceived_Failed, 0);
  objc_storeStrong((id *)&self->_count_DprivacydDonationReceived_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_Stop_Failed, 0);
  objc_storeStrong((id *)&self->_count_Stop_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_PerformTask_Failed, 0);
  objc_storeStrong((id *)&self->_count_PerformTask_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_TaskCompleted_Failed, 0);
  objc_storeStrong((id *)&self->_count_TaskCompleted_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_TaskScheduled_Failed, 0);
  objc_storeStrong((id *)&self->_count_TaskScheduled_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_TaskFetched_Failed, 0);
  objc_storeStrong((id *)&self->_count_TaskFetched_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_Deactivated_Failed, 0);
  objc_storeStrong((id *)&self->_count_Deactivated_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_Activated_Failed, 0);
  objc_storeStrong((id *)&self->_count_Activated_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_Allocated_Failed, 0);
  objc_storeStrong((id *)&self->_count_Allocated_Succeeded, 0);
  objc_storeStrong((id *)&self->_isActivated, 0);
  objc_storeStrong((id *)&self->_isAllocated, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydUploadFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydPayloadCreationFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydBudgetCheckFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydRandomizationFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydDonationReceivedFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_PluginStopFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_PerformTaskFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_TaskCompletedFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_TaskScheduledFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_TaskFetchedFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DeactivatedFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_ActivatedFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_AllocatedFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydUpload, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydPayloadCreation, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydBudgetCheck, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydRandomization, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydDonationReceived, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_Unexpeted, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_PluginStop, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_PerformTask, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_TaskCompleted, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_TaskScheduled, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_TaskFetched, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_Deactivated, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_Activated, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_Allocated, 0);
  objc_storeStrong((id *)&self->_bucketEndTime, 0);
  objc_storeStrong((id *)&self->_bucketStartTime, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
  objc_storeStrong((id *)&self->_stateId, 0);
}

@end