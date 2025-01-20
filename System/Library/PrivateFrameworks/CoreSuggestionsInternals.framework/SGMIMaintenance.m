@interface SGMIMaintenance
+ (void)executeDailyTasksWithShouldContinue:(id)a3;
@end

@implementation SGMIMaintenance

+ (void)executeDailyTasksWithShouldContinue:(id)a3
{
  v3 = (unsigned int (**)(void))a3;
  v4 = +[SGMITrialClientWrapper sharedInstance];
  [v4 refresh];
  if (v3[2](v3))
  {
    v5 = +[SGSqlEntityStore defaultStore];
    +[SGMIFollowUpAnalyzer logFollowUpStatsAndSetting];
    if (v3[2](v3))
    {
      BOOL v6 = +[SGMIEnablementConfig logWarningSignatureStats];
      v7 = sgMailIntelligenceLogHandle();
      v8 = v7;
      if (v6)
      {
        os_signpost_id_t v9 = os_signpost_id_generate(v7);

        v10 = sgMailIntelligenceLogHandle();
        v11 = v10;
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA650000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "DailyTasks.LogSignature", " enableTelemetry=YES ", buf, 2u);
        }

        v12 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Starting Task #1 for Signature Stats logging: -[SGMIFeatureStore warningStatsForLogging:]", buf, 2u);
        }

        v13 = [v5 sgmiFeatureStore];
        v8 = [v13 warningStatsForLogging:1];

        if (v8)
        {
          v14 = [v4 trialMetadata];
          [v8 setTrialMetadata:v14];

          v15 = [MEMORY[0x1E4F1CA20] currentLocale];
          v16 = [v15 localeIdentifier];
          [v8 setLocale:v16];

          v17 = [MEMORY[0x1E4F93728] sharedInstance];
          [v17 logMessage:v8];
        }
        else
        {
          v17 = sgMailIntelligenceLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Signature Stats logging do not have enough new data point to submit new logs.", buf, 2u);
          }
        }

        v18 = sgMailIntelligenceLogHandle();
        v19 = v18;
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA650000, v19, OS_SIGNPOST_INTERVAL_END, v9, "DailyTasks.LogSignature", " enableTelemetry=YES ", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance will not run signature stats logging (logWarningSignatureStats is disabled)", buf, 2u);
      }

      if (v3[2](v3))
      {
        v20 = sgMailIntelligenceLogHandle();
        os_signpost_id_t v21 = os_signpost_id_generate(v20);

        v22 = sgMailIntelligenceLogHandle();
        v23 = v22;
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA650000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "DailyTasks.NicknameMappingLookup", " enableTelemetry=YES ", buf, 2u);
        }

        v24 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Starting Task NicknameMappingLookup", buf, 2u);
        }

        +[SGMINicknameManager lookForNicknamesInSentMailsAndStore:v5 shouldContinue:v3];
        v25 = sgMailIntelligenceLogHandle();
        v26 = v25;
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA650000, v26, OS_SIGNPOST_INTERVAL_END, v21, "DailyTasks.NicknameMappingLookup", " enableTelemetry=YES ", buf, 2u);
        }

        if (v3[2](v3))
        {
          if (+[SGMIEnablementConfig detectSalientMails])
          {
            v27 = objc_opt_new();
            v28 = [v4 trialMetadata];
            [v27 setTrialMetadata:v28];

            v29 = objc_opt_new();
            [v29 timeIntervalSinceReferenceDate];
            [v27 setHoursSinceReference:(v30 / 3600.0)];

            if (v3[2](v3))
            {
              v31 = sgMailIntelligenceLogHandle();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CA650000, v31, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Starting Task #1: SGMISubmodelsManager checkForAndProcessVersionChange", buf, 2u);
              }

              v32 = sgMailIntelligenceLogHandle();
              os_signpost_id_t v33 = os_signpost_id_generate(v32);

              v34 = sgMailIntelligenceLogHandle();
              v35 = v34;
              if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1CA650000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "DailyTasks.ModelVersionChange", " enableTelemetry=YES ", buf, 2u);
              }

              +[SGMISubmodelsManager checkForAndProcessVersionChange];
              v36 = sgMailIntelligenceLogHandle();
              v37 = v36;
              if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_1CA650000, v37, OS_SIGNPOST_INTERVAL_END, v33, "DailyTasks.ModelVersionChange", " enableTelemetry=YES ", buf, 2u);
              }

              v38 = sgMailIntelligenceLogHandle();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CA650000, v38, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Finished Task #1: SGMISubmodelsManager checkForAndProcessVersionChange", buf, 2u);
              }

              if (v3[2](v3))
              {
                v39 = sgMailIntelligenceLogHandle();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1CA650000, v39, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Starting Task #2: SGMISubmodelsManager incrementalSubmodelUpdate", buf, 2u);
                }

                v40 = sgMailIntelligenceLogHandle();
                os_signpost_id_t v41 = os_signpost_id_generate(v40);

                v42 = sgMailIntelligenceLogHandle();
                v43 = v42;
                if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1CA650000, v43, OS_SIGNPOST_INTERVAL_BEGIN, v41, "DailyTasks.SubmodelUpdate", " enableTelemetry=YES ", buf, 2u);
                }

                uint64_t v44 = mach_absolute_time();
                +[SGMISubmodelsManager incrementalSubmodelUpdateWithStore:v5 shouldContinue:v3 limit:1000 log:v27];
                uint64_t v45 = mach_absolute_time();
                unint64_t v46 = SGMachTimeToNanoseconds(v45 - v44);
                v47 = sgMailIntelligenceLogHandle();
                v48 = v47;
                if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1CA650000, v48, OS_SIGNPOST_INTERVAL_END, v41, "DailyTasks.SubmodelUpdate", " enableTelemetry=YES ", buf, 2u);
                }

                v49 = sgMailIntelligenceLogHandle();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1CA650000, v49, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Finished Task #2: SGMISubmodelsManager incrementalSubmodelUpdate", buf, 2u);
                }

                if (v3[2](v3))
                {
                  v50 = sgMailIntelligenceLogHandle();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1CA650000, v50, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Starting Task #3: SGMISubmodelsManager pruneDB", buf, 2u);
                  }

                  v51 = sgMailIntelligenceLogHandle();
                  os_signpost_id_t v52 = os_signpost_id_generate(v51);

                  v53 = sgMailIntelligenceLogHandle();
                  v54 = v53;
                  if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1CA650000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v52, "DailyTasks.PruneSubmodels", " enableTelemetry=YES ", buf, 2u);
                  }

                  uint64_t v55 = mach_absolute_time();
                  +[SGMISubmodelsManager pruneDB];
                  uint64_t v56 = mach_absolute_time();
                  unint64_t v57 = SGMachTimeToNanoseconds(v56 - v55);
                  v58 = sgMailIntelligenceLogHandle();
                  v59 = v58;
                  if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_1CA650000, v59, OS_SIGNPOST_INTERVAL_END, v52, "DailyTasks.PruneSubmodels", " enableTelemetry=YES ", buf, 2u);
                  }

                  v60 = sgMailIntelligenceLogHandle();
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1CA650000, v60, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Finished Task #3: SGMISubmodelsManager pruneDB", buf, 2u);
                  }

                  if (v3[2](v3))
                  {
                    unint64_t v61 = v46 / 0xF4240;
                    unint64_t v62 = v57 / 0xF4240;
                    v63 = sgMailIntelligenceLogHandle();
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1CA650000, v63, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Starting Task #4: Logging", buf, 2u);
                    }

                    v64 = sgMailIntelligenceLogHandle();
                    os_signpost_id_t v65 = os_signpost_id_generate(v64);

                    v66 = sgMailIntelligenceLogHandle();
                    v67 = v66;
                    unint64_t v93 = v65 - 1;
                    if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl(&dword_1CA650000, v67, OS_SIGNPOST_INTERVAL_BEGIN, v65, "DailyTasks.LogMetrics", " enableTelemetry=YES ", buf, 2u);
                    }
                    os_signpost_id_t spid = v65;

                    +[SGMISubmodelsManager addSubmodelStatsToLog:v27];
                    [v27 setSubmodelsUpdatePerformanceInMilliSeconds:v61];
                    [v27 setSubmodelsPruningForCappingPolicyPerformanceInMilliSeconds:v62];
                    v68 = objc_opt_new();
                    v69 = [v5 getInt64NSNumberForKey:@"kTotalSGMITruePositivePredictions"];
                    [v69 doubleValue];
                    +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2);
                    [v68 setSalientPredictedAsSalient:v70];
                    v97 = [v5 getInt64NSNumberForKey:@"kTotalSGMIFalsePositivePredictions"];
                    [v97 doubleValue];
                    +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2);
                    [v68 setIgnorablePredictedAsSalient:v71];
                    v96 = [v5 getInt64NSNumberForKey:@"kTotalSGMITrueNegativePredictions"];
                    [v96 doubleValue];
                    +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2);
                    [v68 setIgnorablePredictedAsIgnorable:v72];
                    v95 = [v5 getInt64NSNumberForKey:@"kTotalSGMIFalseNegativePredictions"];
                    [v95 doubleValue];
                    +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 2);
                    [v68 setSalientPredictedAsIgnorable:v73];
                    v74 = objc_opt_new();
                    v75 = [v4 trialMetadata];
                    [v74 setActiveTrialMetadata:v75];

                    [v74 setActiveAggregatedAccuracyLogSinceModelInitialization:v68];
                    v76 = [MEMORY[0x1E4F93728] sharedInstance];
                    v94 = v74;
                    [v76 logMessage:v74];

                    v77 = [MEMORY[0x1E4F93728] sharedInstance];
                    [v77 logMessage:v27];

                    v78 = sgMailIntelligenceLogHandle();
                    v79 = v78;
                    if (v93 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl(&dword_1CA650000, v79, OS_SIGNPOST_INTERVAL_END, spid, "DailyTasks.LogMetrics", " enableTelemetry=YES ", buf, 2u);
                    }

                    v80 = sgMailIntelligenceLogHandle();
                    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1CA650000, v80, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Finished Task #4: Logging", buf, 2u);
                    }

                    if (v3[2](v3))
                    {
                      v81 = sgMailIntelligenceLogHandle();
                      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1CA650000, v81, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Starting Task #5: Performing DB maintenance", buf, 2u);
                      }

                      v82 = sgMailIntelligenceLogHandle();
                      os_signpost_id_t v83 = os_signpost_id_generate(v82);

                      v84 = sgMailIntelligenceLogHandle();
                      v85 = v84;
                      if (v83 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1CA650000, v85, OS_SIGNPOST_INTERVAL_BEGIN, v83, "DailyTasks.PerformDBMaintenance", " enableTelemetry=YES ", buf, 2u);
                      }

                      v86 = +[SGSqlEntityStore defaultStore];
                      v87 = [v86 sgmiFeatureStore];
                      [v87 performMaintenanceWithShouldContinueBlock:v3];

                      v88 = sgMailIntelligenceLogHandle();
                      v89 = v88;
                      if (v83 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_1CA650000, v89, OS_SIGNPOST_INTERVAL_END, v83, "DailyTasks.PerformDBMaintenance", " enableTelemetry=YES ", buf, 2u);
                      }

                      v90 = sgMailIntelligenceLogHandle();
                      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1CA650000, v90, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance Finished Task #5: Performing DB maintenance", buf, 2u);
                      }
                    }
                  }
                }
              }
            }
          }
          else
          {
            v91 = sgMailIntelligenceLogHandle();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA650000, v91, OS_LOG_TYPE_DEFAULT, "SGMIMaintenance: Mail saliency detection is off. Will not proceed with daily activity tasks.", buf, 2u);
            }

            [v5 clearMailIntelligenceSaliencyDetection];
          }
        }
      }
    }
  }
}

@end