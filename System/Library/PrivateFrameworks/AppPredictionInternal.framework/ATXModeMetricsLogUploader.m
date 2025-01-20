@interface ATXModeMetricsLogUploader
- (void)uploadFocusLogsToCoreAnalyticsWithActivity:(id)a3 contactStore:(id)a4;
@end

@implementation ATXModeMetricsLogUploader

- (void)uploadFocusLogsToCoreAnalyticsWithActivity:(id)a3 contactStore:(id)a4
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 didDefer];
  v8 = __atxlog_handle_metrics();
  v9 = v8;
  if (!v7)
  {
    os_signpost_id_t v12 = os_signpost_id_generate(v8);

    v13 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v15;
      _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_INFO, "%@ - Logging app session metrics", (uint8_t *)&v171, 0xCu);
    }
    v16 = __atxlog_handle_metrics();
    v17 = v16;
    unint64_t v18 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.SessionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v19 = (void *)MEMORY[0x1D25F6CC0]();
    v20 = objc_opt_new();
    [v20 logAppSessionMetricsWithXPCActivity:v5];

    v21 = __atxlog_handle_metrics();
    v22 = v21;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v22, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.SessionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    int v23 = [v5 didDefer];
    v9 = __atxlog_handle_metrics();
    BOOL v24 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v23)
    {
      if (!v24) {
        goto LABEL_79;
      }
LABEL_76:
      v83 = (objc_class *)objc_opt_class();
      NSStringFromClass(v83);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v11;
      goto LABEL_77;
    }
    if (v24)
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v26;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "%@ - Logging mode transition metrics", (uint8_t *)&v171, 0xCu);
    }
    v27 = __atxlog_handle_metrics();
    v28 = v27;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.TransitionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v29 = (void *)MEMORY[0x1D25F6CC0]();
    v30 = objc_opt_new();
    [v30 uploadLogsToCoreAnalyticsWithXPCActivity:v5];

    v31 = __atxlog_handle_metrics();
    v32 = v31;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v32, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.TransitionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    int v33 = [v5 didDefer];
    v9 = __atxlog_handle_metrics();
    BOOL v34 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v33)
    {
      if (!v34) {
        goto LABEL_79;
      }
      goto LABEL_76;
    }
    if (v34)
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v36;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "%@ - Logging mode configuration metrics", (uint8_t *)&v171, 0xCu);
    }
    v37 = __atxlog_handle_metrics();
    v38 = v37;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.ModeConfigurations", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v39 = (void *)MEMORY[0x1D25F6CC0]();
    v40 = objc_opt_new();
    [v40 logModeConfigurationsWithXPCActivity:v5];

    v41 = __atxlog_handle_metrics();
    v42 = v41;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v42, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.ModeConfigurations", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    int v43 = [v5 didDefer];
    v9 = __atxlog_handle_metrics();
    BOOL v44 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v43)
    {
      if (!v44) {
        goto LABEL_79;
      }
      goto LABEL_76;
    }
    if (v44)
    {
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v46;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "%@ - Logging notification setting metrics", (uint8_t *)&v171, 0xCu);
    }
    v47 = __atxlog_handle_metrics();
    v48 = v47;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.NotificationSettings", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v49 = (void *)MEMORY[0x1D25F6CC0]();
    v50 = objc_opt_new();
    [v50 logNotificationSettingsMetricsWithXPCActivity:v5];

    v51 = __atxlog_handle_metrics();
    v52 = v51;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v52, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.NotificationSettings", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    int v53 = [v5 didDefer];
    v9 = __atxlog_handle_metrics();
    BOOL v54 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v53)
    {
      if (!v54) {
        goto LABEL_79;
      }
      goto LABEL_76;
    }
    if (v54)
    {
      v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      id v56 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v56;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "%@ - Logging notification adjacent suggestion metrics", (uint8_t *)&v171, 0xCu);
    }
    v57 = __atxlog_handle_metrics();
    v58 = v57;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.NotificationAdjacentSuggestions", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v59 = (void *)MEMORY[0x1D25F6CC0]();
    v60 = objc_opt_new();
    [v60 logNotificationAdjacentSuggestionMetricsWithXPCActivity:v5];

    v61 = __atxlog_handle_metrics();
    v62 = v61;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v62, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.NotificationAdjacentSuggestions", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v63 = __atxlog_handle_metrics();
    v64 = v63;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v64, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.OnboardingSuggestions", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v65 = (void *)MEMORY[0x1D25F6CC0]();
    v66 = objc_opt_new();
    [v66 logDigestOnboardingSuggestionMetricsWithXPCActivity:v5];

    v67 = __atxlog_handle_metrics();
    v68 = v67;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v68, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.OnboardingSuggestions", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v69 = __atxlog_handle_metrics();
    v70 = v69;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v70, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.OnboardingMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v71 = (void *)MEMORY[0x1D25F6CC0]();
    v72 = objc_opt_new();
    [v72 logDigestOnboardingMetricsWithXPCActivity:v5];

    v73 = __atxlog_handle_metrics();
    v74 = v73;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v74, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.OnboardingMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v75 = __atxlog_handle_metrics();
    v76 = v75;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v76, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.OnboardingAppSelectionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v77 = (void *)MEMORY[0x1D25F6CC0]();
    v78 = objc_opt_new();
    [v78 logDigestOnboardingAppSelectionMetricsWithXPCActivity:v5];

    v79 = __atxlog_handle_metrics();
    v80 = v79;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v80, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.OnboardingAppSelectionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    int v81 = [v5 didDefer];
    v9 = __atxlog_handle_metrics();
    BOOL v82 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v81)
    {
      if (!v82) {
        goto LABEL_79;
      }
      goto LABEL_76;
    }
    if (v82)
    {
      v84 = (objc_class *)objc_opt_class();
      NSStringFromClass(v84);
      id v85 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v85;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "%@ - Logging device usage metrics", (uint8_t *)&v171, 0xCu);
    }
    v86 = __atxlog_handle_metrics();
    v87 = v86;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v87, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.DeviceUsage", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v88 = (void *)MEMORY[0x1D25F6CC0]();
    v89 = objc_opt_new();
    [v89 logDeviceUsageWithXPCActivity:v5];

    v90 = __atxlog_handle_metrics();
    v91 = v90;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v90))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v91, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.DeviceUsage", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    int v92 = [v5 didDefer];
    v9 = __atxlog_handle_metrics();
    BOOL v93 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v92)
    {
      if (!v93) {
        goto LABEL_79;
      }
      goto LABEL_144;
    }
    if (v93)
    {
      v94 = (objc_class *)objc_opt_class();
      NSStringFromClass(v94);
      id v95 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v95;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "%@ - Logging notification metrics", (uint8_t *)&v171, 0xCu);
    }
    v96 = __atxlog_handle_metrics();
    v97 = v96;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v97, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.NotificationTelemetry", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v98 = (void *)MEMORY[0x1D25F6CC0]();
    v99 = [[ATXNotificationTelemetryLogger alloc] initWithContactStore:v6];
    [(ATXNotificationTelemetryLogger *)v99 logNotificationMetricsWithXPCActivity:v5];

    v100 = __atxlog_handle_metrics();
    v101 = v100;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v100))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v101, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.NotificationTelemetry", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    int v102 = [v5 didDefer];
    v9 = __atxlog_handle_metrics();
    BOOL v103 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v102)
    {
      if (!v103) {
        goto LABEL_79;
      }
      goto LABEL_144;
    }
    if (v103)
    {
      v104 = (objc_class *)objc_opt_class();
      NSStringFromClass(v104);
      id v105 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v105;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "%@ - Logging missed notification ranking metrics", (uint8_t *)&v171, 0xCu);
    }
    v106 = __atxlog_handle_metrics();
    v107 = v106;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v107, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.MissedNotificationRanking", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v108 = (void *)MEMORY[0x1D25F6CC0]();
    v109 = objc_opt_new();
    [v109 logMetricsWithXPCActivity:v5];

    v110 = __atxlog_handle_metrics();
    v111 = v110;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v110))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v111, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.MissedNotificationRanking", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v112 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
    {
      v113 = (objc_class *)objc_opt_class();
      NSStringFromClass(v113);
      id v114 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v114;
      _os_log_impl(&dword_1D0FA3000, v112, OS_LOG_TYPE_INFO, "%@ - Logging AppConfiguration metrics", (uint8_t *)&v171, 0xCu);
    }
    v115 = __atxlog_handle_metrics();
    v116 = v115;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v115))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v116, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.AppConfigurationMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v117 = (void *)MEMORY[0x1D25F6CC0]();
    v118 = objc_opt_new();
    [v118 logMetricsWithXPCActivity:v5];

    v119 = __atxlog_handle_metrics();
    v120 = v119;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v119))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v120, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.AppConfigurationMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v121 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
    {
      v122 = (objc_class *)objc_opt_class();
      NSStringFromClass(v122);
      id v123 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v123;
      _os_log_impl(&dword_1D0FA3000, v121, OS_LOG_TYPE_INFO, "%@ - Logging Home Screen Focus Suggestion metrics", (uint8_t *)&v171, 0xCu);
    }
    v124 = __atxlog_handle_metrics();
    v125 = v124;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v124))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v125, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.HomeScreenFocusSuggestionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v126 = (void *)MEMORY[0x1D25F6CC0]();
    v127 = objc_opt_new();
    [v127 logHomeScreenFocusSuggestionMetrics];

    v128 = __atxlog_handle_metrics();
    v129 = v128;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v128))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v129, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.HomeScreenFocusSuggestionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v130 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
    {
      v131 = (objc_class *)objc_opt_class();
      NSStringFromClass(v131);
      id v132 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v132;
      _os_log_impl(&dword_1D0FA3000, v130, OS_LOG_TYPE_INFO, "%@ - Logging Mode Setup Experience metrics", (uint8_t *)&v171, 0xCu);
    }
    v133 = __atxlog_handle_metrics();
    v134 = v133;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v133))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v134, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.ModeSetupExperienceMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v135 = (void *)MEMORY[0x1D25F6CC0]();
    v136 = objc_opt_new();
    [v136 logMetrics];

    v137 = __atxlog_handle_metrics();
    v138 = v137;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v138, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.ModeSetupExperienceMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v139 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
    {
      v140 = (objc_class *)objc_opt_class();
      NSStringFromClass(v140);
      id v141 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v141;
      _os_log_impl(&dword_1D0FA3000, v139, OS_LOG_TYPE_INFO, "%@ - Logging Focus Mode Setup Prediction metrics", (uint8_t *)&v171, 0xCu);
    }
    v142 = __atxlog_handle_metrics();
    v143 = v142;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v142))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v143, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.ModeSetupPredictionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v144 = (void *)MEMORY[0x1D25F6CC0]();
    v145 = objc_opt_new();
    [v145 logMetrics];

    v146 = __atxlog_handle_metrics();
    v147 = v146;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v146))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v147, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.ModeSetupPredictionMetrics", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    int v148 = [v5 didDefer];
    v9 = __atxlog_handle_metrics();
    BOOL v149 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v148)
    {
      if (!v149) {
        goto LABEL_79;
      }
LABEL_144:
      v150 = (objc_class *)objc_opt_class();
      NSStringFromClass(v150);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v11;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", (uint8_t *)&v171, 0xCu);

      goto LABEL_78;
    }
    if (v149)
    {
      v151 = (objc_class *)objc_opt_class();
      NSStringFromClass(v151);
      id v152 = (id)objc_claimAutoreleasedReturnValue();
      int v171 = 138412290;
      id v172 = v152;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "%@ - Logging mode configuration UI flow metrics and signals for apps and contacts", (uint8_t *)&v171, 0xCu);
    }
    v153 = __atxlog_handle_metrics();
    v154 = v153;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v153))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v154, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.UIFlow", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    v9 = objc_opt_new();
    v155 = (void *)MEMORY[0x1D25F6CC0]();
    v156 = [[ATXModeConfigurationUIFlowMetricLogger alloc] initWithFocusModeSignalsLogger:v9 contactStore:v6];
    [(ATXModeConfigurationUIFlowMetricLogger *)v156 logModeConfigurationUIFlowMetricWithXPCActivity:v5];

    v157 = __atxlog_handle_metrics();
    v158 = v157;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v157))
    {
      LOWORD(v171) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v158, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.UIFlow", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
    }

    int v159 = [v5 didDefer];
    v160 = __atxlog_handle_metrics();
    BOOL v161 = os_log_type_enabled(v160, OS_LOG_TYPE_INFO);
    if (v159)
    {
      if (v161)
      {
LABEL_166:
        v169 = (objc_class *)objc_opt_class();
        NSStringFromClass(v169);
        id v170 = (id)objc_claimAutoreleasedReturnValue();
        int v171 = 138412290;
        id v172 = v170;
        _os_log_impl(&dword_1D0FA3000, v160, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", (uint8_t *)&v171, 0xCu);
      }
    }
    else
    {
      if (v161)
      {
        v162 = (objc_class *)objc_opt_class();
        NSStringFromClass(v162);
        id v163 = (id)objc_claimAutoreleasedReturnValue();
        int v171 = 138412290;
        id v172 = v163;
        _os_log_impl(&dword_1D0FA3000, v160, OS_LOG_TYPE_INFO, "%@ - Logging focus mode signals for Wigets", (uint8_t *)&v171, 0xCu);
      }
      v164 = __atxlog_handle_metrics();
      v165 = v164;
      if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v164))
      {
        LOWORD(v171) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v165, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FocusMetricsLogging.WidgetSignals", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
      }

      v166 = (void *)MEMORY[0x1D25F6CC0]();
      [v9 logFocusModeWidgetSignalsWithXPCActivity:v5];
      v167 = __atxlog_handle_metrics();
      v168 = v167;
      if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v167))
      {
        LOWORD(v171) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v168, OS_SIGNPOST_INTERVAL_END, v12, "FocusMetricsLogging.WidgetSignals", " enableTelemetry=YES ", (uint8_t *)&v171, 2u);
      }

      if (![v5 didDefer]) {
        goto LABEL_79;
      }
      v160 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO)) {
        goto LABEL_166;
      }
    }

    goto LABEL_79;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    int v171 = 138412290;
    id v172 = v11;
LABEL_77:
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "%@ - Terminating due to XPC deferral", (uint8_t *)&v171, 0xCu);
LABEL_78:
  }
LABEL_79:
}

@end