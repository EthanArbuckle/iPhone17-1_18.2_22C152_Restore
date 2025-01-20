@interface ELSWhitelist
+ (id)findEntryForBundleIdentifier:(id)a3;
+ (id)findEntryForDEDIdentifier:(id)a3;
+ (id)findEntryForParameterName:(id)a3;
+ (id)whitelist;
@end

@implementation ELSWhitelist

+ (id)whitelist
{
  if (whitelist_onceToken != -1) {
    dispatch_once(&whitelist_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)whitelist_whitelist;
  return v2;
}

void __25__ELSWhitelist_whitelist__block_invoke()
{
  v138[6] = *MEMORY[0x263EF8340];
  v0 = [ELSWhitelistEntry alloc];
  v138[0] = @"macos";
  v138[1] = @"ios";
  v138[2] = @"watchos";
  v138[3] = @"visionos";
  v138[4] = @"tvos";
  v138[5] = @"homepod";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:6];
  v102 = [(ELSWhitelistEntry *)v0 initWithBundleIdentifier:@"com.apple.DiagnosticExtensions.sysdiagnose" parameterName:@"sysdiagnose" baseLocalizationKey:@"ENHANCED_LOGGING_SYSDIAGNOSE" needsWAPIKeys:0 requiresFollowup:0 retry:0 platforms:v1];

  v2 = [ELSWhitelistEntry alloc];
  v137 = @"ios";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v137 count:1];
  v103 = [(ELSWhitelistEntry *)v2 initWithBundleIdentifier:@"com.apple.DiagnosticExtensions.sysdiagnose" parameterName:@"coSysdiagnose" baseLocalizationKey:@"ENHANCED_LOGGING_COSYSDIAGNOSE" needsWAPIKeys:0 requiresFollowup:0 retry:0 platforms:v3];

  v4 = [ELSWhitelistEntry alloc];
  v136 = @"ios";
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v136 count:1];
  v98 = [(ELSWhitelistEntry *)v4 initWithBundleIdentifier:@"com.apple.HangTracer.PerformanceLoggingDiagnosticExtension" parameterName:@"performance" baseLocalizationKey:@"ENHANCED_LOGGING_PERFORMANCE" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v5];

  v6 = [ELSWhitelistEntry alloc];
  v135 = @"ios";
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v135 count:1];
  v101 = [(ELSWhitelistEntry *)v6 initWithBundleIdentifier:@"com.apple.PowerlogCore.DEPowerlogEPL" parameterName:@"power" baseLocalizationKey:@"ENHANCED_LOGGING_POWER" needsWAPIKeys:1 requiresFollowup:0 retry:0 platforms:v7];

  v8 = [ELSWhitelistEntry alloc];
  v134 = @"ios";
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v134 count:1];
  v100 = [(ELSWhitelistEntry *)v8 initWithBundleIdentifier:@"com.apple.DiagnosticExtensions.Cellular" parameterName:@"cellular" baseLocalizationKey:@"ENHANCED_LOGGING_CELLULAR" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v9];

  v10 = [ELSWhitelistEntry alloc];
  v133 = @"ios";
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v133 count:1];
  v99 = [(ELSWhitelistEntry *)v10 initWithBundleIdentifier:@"com.apple.Diagnostics.diagnosticextension" parameterName:@"diagnostics" baseLocalizationKey:@"ENHANCED_LOGGING_DIAGNOSTICS" needsWAPIKeys:0 requiresFollowup:0 retry:0 platforms:v11];

  v12 = [ELSWhitelistEntry alloc];
  v132[0] = @"ios";
  v132[1] = @"visionos";
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v132 count:2];
  v97 = [(ELSWhitelistEntry *)v12 initWithBundleIdentifier:@"com.apple.CFNetwork.DiagnosticExtension" parameterName:@"cfnetwork" baseLocalizationKey:@"ENHANCED_LOGGING_CFNETWORK" needsWAPIKeys:0 requiresFollowup:0 retry:0 platforms:v13];

  v14 = [ELSWhitelistEntry alloc];
  v131 = @"ios";
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v131 count:1];
  v96 = [(ELSWhitelistEntry *)v14 initWithBundleIdentifier:@"com.apple.DiagnosticExtensions.CoreLocation" parameterName:@"coreMotionAndLocation" baseLocalizationKey:@"ENHANCED_LOGGING_LOCATION_AND_MOTION" needsWAPIKeys:1 requiresFollowup:1 retry:1 platforms:v15];

  v16 = [ELSWhitelistEntry alloc];
  v130[0] = @"ios";
  v130[1] = @"watchos";
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v130 count:2];
  v92 = [(ELSWhitelistEntry *)v16 initWithBundleIdentifier:@"com.apple.HealthLite.KaliDiagnosticExtension" parameterName:@"hid_kali" baseLocalizationKey:@"ENHANCED_LOGGING_HID_KALI" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v17];

  v18 = [ELSWhitelistEntry alloc];
  v129[0] = @"ios";
  v129[1] = @"watchos";
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v129 count:2];
  v95 = [(ELSWhitelistEntry *)v18 initWithBundleIdentifier:@"com.apple.HealthAlgorithms.CycleTrackingDiagnosticExtension" parameterName:@"hid_cycle_tracking" baseLocalizationKey:@"ENHANCED_LOGGING_HID_CYCLE" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v19];

  v20 = [ELSWhitelistEntry alloc];
  v128[0] = @"ios";
  v128[1] = @"watchos";
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v128 count:2];
  v94 = [(ELSWhitelistEntry *)v20 initWithBundleIdentifier:@"com.apple.AppleElementsSupport.AppleElementsSleepDiagnostic" parameterName:@"hid-sleep-respiration_rate" baseLocalizationKey:@"ENHANCED_LOGGING_HID_ACACIA" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v21];

  v22 = [ELSWhitelistEntry alloc];
  v127[0] = @"ios";
  v127[1] = @"watchos";
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v127 count:2];
  v93 = [(ELSWhitelistEntry *)v22 initWithBundleIdentifier:@"com.apple.AfibBurden.AfibBurdenDiagnosticExtension" parameterName:@"hid_beryllium" baseLocalizationKey:@"ENHANCED_LOGGING_HID_BERYLLIUM" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v23];

  v24 = [ELSWhitelistEntry alloc];
  v126[0] = @"ios";
  v126[1] = @"watchos";
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v126 count:2];
  v91 = [(ELSWhitelistEntry *)v24 initWithBundleIdentifier:@"com.apple.AppleElementsSupport.AppleElementsDiagnostic" parameterName:@"optical" baseLocalizationKey:@"ENHANCED_LOGGING_HID_OPTICAL" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v25];

  v26 = [ELSWhitelistEntry alloc];
  v125[0] = @"ios";
  v125[1] = @"watchos";
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v125 count:2];
  v90 = [(ELSWhitelistEntry *)v26 initWithBundleIdentifier:@"com.apple.HeartRhythmAlgorithms.IRNDiagnosticExtension" parameterName:@"irn" baseLocalizationKey:@"ENHANCED_LOGGING_HID_IRN" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v27];

  v28 = [ELSWhitelistEntry alloc];
  v124[0] = @"ios";
  v124[1] = @"watchos";
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v124 count:2];
  v89 = [(ELSWhitelistEntry *)v28 initWithBundleIdentifier:@"com.apple.DiagnosticExtensions.Cinnamon" parameterName:@"ecg" baseLocalizationKey:@"ENHANCED_LOGGING_HID_ECG" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v29];

  v30 = [ELSWhitelistEntry alloc];
  v123 = @"ios";
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v123 count:1];
  v88 = [(ELSWhitelistEntry *)v30 initWithBundleIdentifier:@"com.apple.DiagnosticExtensions.TypologyDiagnosticExtension" parameterName:@"typology" baseLocalizationKey:@"ENHANCED_LOGGING_TYPOLOGY" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v31];

  v32 = [ELSWhitelistEntry alloc];
  v122 = @"ios";
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v122 count:1];
  v87 = [(ELSWhitelistEntry *)v32 initWithBundleIdentifier:@"com.apple.AuthKit.AKDiagnosticExtension" parameterName:@"authkit" baseLocalizationKey:@"ENHANCED_LOGGING_AUTHKIT" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v33];

  v34 = [ELSWhitelistEntry alloc];
  v121 = @"ios";
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v121 count:1];
  v81 = [(ELSWhitelistEntry *)v34 initWithBundleIdentifier:@"com.apple.mobilemail.DiagnosticExtension" parameterName:@"mobilemail" baseLocalizationKey:@"ENHANCED_LOGGING_MOBILEMAIL" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v35];

  v36 = [ELSWhitelistEntry alloc];
  v120[0] = @"ios";
  v120[1] = @"watchos";
  v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v120 count:2];
  v86 = [(ELSWhitelistEntry *)v36 initWithBundleIdentifier:@"com.apple.CoreGesture.CoreGestureDiagnosticExtension" parameterName:@"gediagnose" baseLocalizationKey:@"ENHANCED_LOGGING_GEDIAGNOSE" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v37];

  v38 = [ELSWhitelistEntry alloc];
  v119[0] = @"ios";
  v119[1] = @"watchos";
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v119 count:2];
  v85 = [(ELSWhitelistEntry *)v38 initWithBundleIdentifier:@"com.apple.HealthKit.HealthCustomerDiagnosticExtension" parameterName:@"healthkit" baseLocalizationKey:@"ENHANCED_LOGGING_HEALTHKIT" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v39];

  v40 = [ELSWhitelistEntry alloc];
  v118[0] = @"ios";
  v118[1] = @"watchos";
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v118 count:2];
  v84 = [(ELSWhitelistEntry *)v40 initWithBundleIdentifier:@"com.apple.HealthKit.HealthResearchLogsDiagnosticExtension" parameterName:@"research_logs" baseLocalizationKey:@"ENHANCED_LOGGING_HEALTHRESEARCH" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v41];

  v42 = [ELSWhitelistEntry alloc];
  v117[0] = @"ios";
  v117[1] = @"watchos";
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:2];
  v83 = [(ELSWhitelistEntry *)v42 initWithBundleIdentifier:@"com.apple.HealthKit.HealthRegulatoryCustomerDiagnosticExtension" parameterName:@"healthregulatory" baseLocalizationKey:@"ENHANCED_LOGGING_HEALTHREGULATORY" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v43];

  v44 = [ELSWhitelistEntry alloc];
  v116[0] = @"ios";
  v116[1] = @"macos";
  v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v116 count:2];
  v82 = [(ELSWhitelistEntry *)v44 initWithBundleIdentifier:@"com.apple.CloudDocsDaemon.diagnostic" parameterName:@"iclouddriveextradebug" baseLocalizationKey:@"ENHANCED_LOGGING_ICLOUDDRIVE" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v45];

  v46 = [ELSWhitelistEntry alloc];
  v115 = @"ios";
  v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v115 count:1];
  v80 = [(ELSWhitelistEntry *)v46 initWithBundleIdentifier:@"com.apple.PassKit.applepay.diagnosticextension" parameterName:@"wallet" baseLocalizationKey:@"ENHANCED_LOGGING_WALLET" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v47];

  v48 = [ELSWhitelistEntry alloc];
  v114 = @"ios";
  v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v114 count:1];
  v79 = [(ELSWhitelistEntry *)v48 initWithBundleIdentifier:@"com.apple.BreathingAlgorithms.BDADiagnosticExtension" parameterName:@"hid_nebula_phone" baseLocalizationKey:@"ENHANCED_LOGGING_NEBULA_PHONE" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v49];

  v50 = [ELSWhitelistEntry alloc];
  v113 = @"watchos";
  v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v113 count:1];
  v78 = [(ELSWhitelistEntry *)v50 initWithBundleIdentifier:@"com.apple.HealthLite.BreathingDisturbanceDiagnosticExtension" parameterName:@"hid_nebula_watch" baseLocalizationKey:@"ENHANCED_LOGGING_NEBULA_WATCH" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v51];

  v52 = [ELSWhitelistEntry alloc];
  v112 = @"watchos";
  v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v112 count:1];
  v77 = [(ELSWhitelistEntry *)v52 initWithBundleIdentifier:@"com.apple.HealthLite.SleepAlgorithmsDiagnosticExtension" parameterName:@"hid_sleep_algorithms" baseLocalizationKey:@"ENHANCED_LOGGING_SLEEP_ALGORITHMS" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v53];

  v54 = [ELSWhitelistEntry alloc];
  v111 = @"watchos";
  v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v111 count:1];
  v56 = [(ELSWhitelistEntry *)v54 initWithBundleIdentifier:@"com.apple.HealthLite.AccelArchiveDiagnosticExtension" parameterName:@"hid_accel_archive" baseLocalizationKey:@"ENHANCED_LOGGING_ACCEL_ARCHIVE" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v55];

  v57 = [ELSWhitelistEntry alloc];
  v110 = @"watchos";
  v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v110 count:1];
  v76 = [(ELSWhitelistEntry *)v57 initWithBundleIdentifier:@"com.apple.HealthLite.WristDetectStateArchiveDE" parameterName:@"hid_wrist_detect_state_archive" baseLocalizationKey:@"ENHANCED_LOGGING_WRIST_DETECT_STATE_ARCHIVE" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v58];

  v59 = [ELSWhitelistEntry alloc];
  v109 = @"ios";
  v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v109 count:1];
  v75 = [(ELSWhitelistEntry *)v59 initWithBundleIdentifier:@"com.apple.exchangesync.framework.SyncDiagnosticsExtension" parameterName:@"eas_de" baseLocalizationKey:@"ENHANCED_LOGGING_EXCHANGE_SYNC" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v60];

  v61 = [ELSWhitelistEntry alloc];
  v108 = @"visionos";
  v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v108 count:1];
  v74 = [(ELSWhitelistEntry *)v61 initWithBundleIdentifier:@"com.apple.Mind.MindfulnessDiagnosticExtension" parameterName:@"mindfulness" baseLocalizationKey:@"ENHANCED_LOGGING_MINDFULNESS" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v62];

  v63 = [ELSWhitelistEntry alloc];
  v107 = @"visionos";
  v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v107 count:1];
  v73 = [(ELSWhitelistEntry *)v63 initWithBundleIdentifier:@"com.apple.RespirationTracking.DiagnosticExtension" parameterName:@"respiration_tracking" baseLocalizationKey:@"ENHANCED_LOGGING_RESPIRATION_TRACKING" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v64];

  v65 = [ELSWhitelistEntry alloc];
  v106 = @"ios";
  v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v106 count:1];
  v67 = [(ELSWhitelistEntry *)v65 initWithBundleIdentifier:@"com.apple.DiagnosticExtensions.IMDiagnosticExtension" parameterName:@"messages" baseLocalizationKey:@"ENHANCED_LOGGING_MESSAGES" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v66];

  v68 = [ELSWhitelistEntry alloc];
  v105 = @"ios";
  v69 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v105 count:1];
  v70 = [(ELSWhitelistEntry *)v68 initWithBundleIdentifier:@"com.apple.DiagnosticExtensions.TUDiagnosticExtension" parameterName:@"facetime" baseLocalizationKey:@"ENHANCED_LOGGING_FACETIME" needsWAPIKeys:0 requiresFollowup:1 retry:1 platforms:v69];

  v104[0] = v102;
  v104[1] = v103;
  v104[2] = v98;
  v104[3] = v101;
  v104[4] = v100;
  v104[5] = v99;
  v104[6] = v97;
  v104[7] = v96;
  v104[8] = v94;
  v104[9] = v92;
  v104[10] = v95;
  v104[11] = v93;
  v104[12] = v91;
  v104[13] = v90;
  v104[14] = v89;
  v104[15] = v88;
  v104[16] = v87;
  v104[17] = v81;
  v104[18] = v86;
  v104[19] = v85;
  v104[20] = v84;
  v104[21] = v83;
  v104[22] = v82;
  v104[23] = v80;
  v104[24] = v79;
  v104[25] = v78;
  v104[26] = v77;
  v104[27] = v56;
  v104[28] = v76;
  v104[29] = v75;
  v104[30] = v74;
  v104[31] = v73;
  v104[32] = v67;
  v104[33] = v70;
  uint64_t v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:34];
  v72 = (void *)whitelist_whitelist;
  whitelist_whitelist = v71;
}

+ (id)findEntryForParameterName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(a1, "whitelist", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 parameterName];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)findEntryForBundleIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(a1, "whitelist", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 bundleIdentifier];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)findEntryForDEDIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(a1, "whitelist", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 bundleIdentifier];
        int v11 = [v4 containsString:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

@end