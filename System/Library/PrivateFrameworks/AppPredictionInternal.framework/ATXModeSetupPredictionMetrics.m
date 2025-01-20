@interface ATXModeSetupPredictionMetrics
- (BOOL)hasSetupDigestThroughOnboardingSuggestion;
- (BOOL)isDigestCurrentlyEnabled;
- (BOOL)modeHasActivatedToday;
- (BOOL)modeHasActivatedWithin7Days;
- (BOOL)modeHasLinkedPoster;
- (BOOL)modeHasSmartActivationEnabled;
- (BOOL)modeIsCreated;
- (BOOL)modeWasCreatedToday;
- (BOOL)modeWasCreatedWithin7Days;
- (BOOL)wasOfferedDigestOnboardingSuggestion;
- (NSNumber)globalAllPagesFolderCountBucket;
- (NSNumber)globalAllPagesWidgetCountBucket;
- (NSNumber)globalAppInterruptionsCount7Days;
- (NSNumber)globalAppInterruptionsCountToday;
- (NSNumber)globalAppLaunchCount7Days;
- (NSNumber)globalAppLaunchCountToday;
- (NSNumber)globalNotificationsClearedCount7Days;
- (NSNumber)globalNotificationsClearedCountToday;
- (NSNumber)globalNotificationsCount7Days;
- (NSNumber)globalNotificationsCountToday;
- (NSNumber)globalPosterConfigurationsCount;
- (NSNumber)homePageFolderCountBucket;
- (NSNumber)homePageWidgetCountBucket;
- (NSNumber)modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days;
- (NSNumber)modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday;
- (NSNumber)modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days;
- (NSNumber)modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday;
- (NSNumber)modeAppInterruptionsCountInModeInferred7Days;
- (NSNumber)modeAppInterruptionsCountInModeInferredToday;
- (NSNumber)modeAppLaunchCountBasedOnGlobalPriors7Days;
- (NSNumber)modeAppLaunchCountBasedOnGlobalPriorsToday;
- (NSNumber)modeInferredCount7Days;
- (NSNumber)modeInferredCountToday;
- (NSNumber)modeInferredDuration7Days;
- (NSNumber)modeInferredDurationToday;
- (NSNumber)modeNotificationsClearedCount7Days;
- (NSNumber)modeNotificationsClearedCountToday;
- (NSNumber)modeNotificationsCount7Days;
- (NSNumber)modeNotificationsCountToday;
- (NSNumber)modeTurnedOnCount7Days;
- (NSNumber)modeTurnedOnCountToday;
- (NSNumber)modeTurnedOnDuration7Days;
- (NSNumber)modeTurnedOnDurationToday;
- (NSNumber)modeWeightedAppLaunchCountBasedOnGlobalPriors7Days;
- (NSNumber)modeWeightedAppLaunchCountBasedOnGlobalPriorsToday;
- (NSNumber)trialDeploymentId;
- (NSString)modeName;
- (NSString)trialExperimentId;
- (NSString)trialTreatmentId;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)metricName;
- (void)setGlobalAllPagesFolderCountBucket:(id)a3;
- (void)setGlobalAllPagesWidgetCountBucket:(id)a3;
- (void)setGlobalAppInterruptionsCount7Days:(id)a3;
- (void)setGlobalAppInterruptionsCountToday:(id)a3;
- (void)setGlobalAppLaunchCount7Days:(id)a3;
- (void)setGlobalAppLaunchCountToday:(id)a3;
- (void)setGlobalNotificationsClearedCount7Days:(id)a3;
- (void)setGlobalNotificationsClearedCountToday:(id)a3;
- (void)setGlobalNotificationsCount7Days:(id)a3;
- (void)setGlobalNotificationsCountToday:(id)a3;
- (void)setGlobalPosterConfigurationsCount:(id)a3;
- (void)setHasSetupDigestThroughOnboardingSuggestion:(BOOL)a3;
- (void)setHomePageFolderCountBucket:(id)a3;
- (void)setHomePageWidgetCountBucket:(id)a3;
- (void)setIsDigestCurrentlyEnabled:(BOOL)a3;
- (void)setModeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days:(id)a3;
- (void)setModeAppInterruptionsCountBasedOnAllowListOfInferredModeToday:(id)a3;
- (void)setModeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days:(id)a3;
- (void)setModeAppInterruptionsCountBasedOnDenyListOfInferredModeToday:(id)a3;
- (void)setModeAppInterruptionsCountInModeInferred7Days:(id)a3;
- (void)setModeAppInterruptionsCountInModeInferredToday:(id)a3;
- (void)setModeAppLaunchCountBasedOnGlobalPriors7Days:(id)a3;
- (void)setModeAppLaunchCountBasedOnGlobalPriorsToday:(id)a3;
- (void)setModeHasActivatedToday:(BOOL)a3;
- (void)setModeHasActivatedWithin7Days:(BOOL)a3;
- (void)setModeHasLinkedPoster:(BOOL)a3;
- (void)setModeHasSmartActivationEnabled:(BOOL)a3;
- (void)setModeInferredCount7Days:(id)a3;
- (void)setModeInferredCountToday:(id)a3;
- (void)setModeInferredDuration7Days:(id)a3;
- (void)setModeInferredDurationToday:(id)a3;
- (void)setModeIsCreated:(BOOL)a3;
- (void)setModeName:(id)a3;
- (void)setModeNotificationsClearedCount7Days:(id)a3;
- (void)setModeNotificationsClearedCountToday:(id)a3;
- (void)setModeNotificationsCount7Days:(id)a3;
- (void)setModeNotificationsCountToday:(id)a3;
- (void)setModeTurnedOnCount7Days:(id)a3;
- (void)setModeTurnedOnCountToday:(id)a3;
- (void)setModeTurnedOnDuration7Days:(id)a3;
- (void)setModeTurnedOnDurationToday:(id)a3;
- (void)setModeWasCreatedToday:(BOOL)a3;
- (void)setModeWasCreatedWithin7Days:(BOOL)a3;
- (void)setModeWeightedAppLaunchCountBasedOnGlobalPriors7Days:(id)a3;
- (void)setModeWeightedAppLaunchCountBasedOnGlobalPriorsToday:(id)a3;
- (void)setTrialDeploymentId:(id)a3;
- (void)setTrialExperimentId:(id)a3;
- (void)setTrialTreatmentId:(id)a3;
- (void)setWasOfferedDigestOnboardingSuggestion:(BOOL)a3;
@end

@implementation ATXModeSetupPredictionMetrics

- (id)metricName
{
  return @"com.apple.FocusModeSetupPredictionV2";
}

- (id)coreAnalyticsDictionary
{
  v130[49] = *MEMORY[0x1E4F143B8];
  v129[0] = @"ModeName";
  uint64_t v3 = [(ATXModeSetupPredictionMetrics *)self modeName];
  v128 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v130[0] = v3;
  v129[1] = @"ModeIsCreated";
  v127 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeSetupPredictionMetrics modeIsCreated](self, "modeIsCreated", v3));
  v130[1] = v127;
  v129[2] = @"ModeWasCreatedWithin7Days";
  v126 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeSetupPredictionMetrics modeWasCreatedWithin7Days](self, "modeWasCreatedWithin7Days"));
  v130[2] = v126;
  v129[3] = @"ModeWasCreatedToday";
  v125 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeSetupPredictionMetrics modeWasCreatedToday](self, "modeWasCreatedToday"));
  v130[3] = v125;
  v129[4] = @"ModeHasActivatedWithin7Days";
  v124 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeSetupPredictionMetrics modeHasActivatedWithin7Days](self, "modeHasActivatedWithin7Days"));
  v130[4] = v124;
  v129[5] = @"ModeHasActivatedToday";
  v123 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeSetupPredictionMetrics modeHasActivatedToday](self, "modeHasActivatedToday"));
  v130[5] = v123;
  v129[6] = @"WasOfferedDigestOnboardingSuggestion";
  v122 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeSetupPredictionMetrics wasOfferedDigestOnboardingSuggestion](self, "wasOfferedDigestOnboardingSuggestion"));
  v130[6] = v122;
  v129[7] = @"HasSetupDigestThroughOnboardingSuggestion";
  v121 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeSetupPredictionMetrics hasSetupDigestThroughOnboardingSuggestion](self, "hasSetupDigestThroughOnboardingSuggestion"));
  v130[7] = v121;
  v129[8] = @"IsDigestCurrentlyEnabled";
  v120 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeSetupPredictionMetrics isDigestCurrentlyEnabled](self, "isDigestCurrentlyEnabled"));
  v130[8] = v120;
  v129[9] = @"ModeHasLinkedPoster";
  v119 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeSetupPredictionMetrics modeHasLinkedPoster](self, "modeHasLinkedPoster"));
  v130[9] = v119;
  v129[10] = @"ModeHasSmartActivationEnabled";
  v118 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeSetupPredictionMetrics modeHasSmartActivationEnabled](self, "modeHasSmartActivationEnabled"));
  v130[10] = v118;
  v129[11] = @"GlobalAllPagesFolderCountBucket";
  uint64_t v4 = [(ATXModeSetupPredictionMetrics *)self globalAllPagesFolderCountBucket];
  v117 = (void *)v4;
  if (v4) {
    v5 = (void *)v4;
  }
  else {
    v5 = &unk_1F27F0D08;
  }
  v130[11] = v5;
  v129[12] = @"GlobalAllPagesWidgetCountBucket";
  uint64_t v6 = [(ATXModeSetupPredictionMetrics *)self globalAllPagesWidgetCountBucket];
  v116 = (void *)v6;
  if (v6) {
    v7 = (void *)v6;
  }
  else {
    v7 = &unk_1F27F0D08;
  }
  v130[12] = v7;
  v129[13] = @"HomePageFolderCountBucket";
  uint64_t v8 = [(ATXModeSetupPredictionMetrics *)self homePageFolderCountBucket];
  v115 = (void *)v8;
  if (v8) {
    v9 = (void *)v8;
  }
  else {
    v9 = &unk_1F27F0D08;
  }
  v130[13] = v9;
  v129[14] = @"HomePageWidgetCountBucket";
  uint64_t v10 = [(ATXModeSetupPredictionMetrics *)self homePageWidgetCountBucket];
  v114 = (void *)v10;
  if (v10) {
    v11 = (void *)v10;
  }
  else {
    v11 = &unk_1F27F0D08;
  }
  v130[14] = v11;
  v129[15] = @"GlobalAppLaunchCount7Days";
  uint64_t v12 = [(ATXModeSetupPredictionMetrics *)self globalAppLaunchCount7Days];
  v113 = (void *)v12;
  if (v12) {
    v13 = (void *)v12;
  }
  else {
    v13 = &unk_1F27F0D08;
  }
  v130[15] = v13;
  v129[16] = @"GlobalAppLaunchCountToday";
  uint64_t v14 = [(ATXModeSetupPredictionMetrics *)self globalAppLaunchCountToday];
  v112 = (void *)v14;
  if (v14) {
    v15 = (void *)v14;
  }
  else {
    v15 = &unk_1F27F0D08;
  }
  v130[16] = v15;
  v129[17] = @"ModeAppLaunchCountBasedOnGlobalPriors7Days";
  uint64_t v16 = [(ATXModeSetupPredictionMetrics *)self modeAppLaunchCountBasedOnGlobalPriors7Days];
  v111 = (void *)v16;
  if (v16) {
    v17 = (void *)v16;
  }
  else {
    v17 = &unk_1F27F0D08;
  }
  v130[17] = v17;
  v129[18] = @"ModeAppLaunchCountBasedOnGlobalPriorsToday";
  uint64_t v18 = [(ATXModeSetupPredictionMetrics *)self modeAppLaunchCountBasedOnGlobalPriorsToday];
  v110 = (void *)v18;
  if (v18) {
    v19 = (void *)v18;
  }
  else {
    v19 = &unk_1F27F0D08;
  }
  v130[18] = v19;
  v129[19] = @"ModeInferredDuration7Days";
  uint64_t v20 = [(ATXModeSetupPredictionMetrics *)self modeInferredDuration7Days];
  v109 = (void *)v20;
  if (v20) {
    v21 = (void *)v20;
  }
  else {
    v21 = &unk_1F27F0D08;
  }
  v130[19] = v21;
  v129[20] = @"ModeInferredDurationToday";
  uint64_t v22 = [(ATXModeSetupPredictionMetrics *)self modeInferredDurationToday];
  v108 = (void *)v22;
  if (v22) {
    v23 = (void *)v22;
  }
  else {
    v23 = &unk_1F27F0D08;
  }
  v130[20] = v23;
  v129[21] = @"ModeInferredCount7Days";
  uint64_t v24 = [(ATXModeSetupPredictionMetrics *)self modeInferredCount7Days];
  v107 = (void *)v24;
  if (v24) {
    v25 = (void *)v24;
  }
  else {
    v25 = &unk_1F27F0D08;
  }
  v130[21] = v25;
  v129[22] = @"ModeInferredCountToday";
  uint64_t v26 = [(ATXModeSetupPredictionMetrics *)self modeInferredCountToday];
  v106 = (void *)v26;
  if (v26) {
    v27 = (void *)v26;
  }
  else {
    v27 = &unk_1F27F0D08;
  }
  v130[22] = v27;
  v129[23] = @"ModeTurnedOnCount7Days";
  uint64_t v28 = [(ATXModeSetupPredictionMetrics *)self modeTurnedOnCount7Days];
  v105 = (void *)v28;
  if (v28) {
    v29 = (void *)v28;
  }
  else {
    v29 = &unk_1F27F0D08;
  }
  v130[23] = v29;
  v129[24] = @"ModeTurnedOnCountToday";
  uint64_t v30 = [(ATXModeSetupPredictionMetrics *)self modeTurnedOnCountToday];
  v104 = (void *)v30;
  if (v30) {
    v31 = (void *)v30;
  }
  else {
    v31 = &unk_1F27F0D08;
  }
  v130[24] = v31;
  v129[25] = @"ModeTurnedOnDuration7Days";
  uint64_t v32 = [(ATXModeSetupPredictionMetrics *)self modeTurnedOnDuration7Days];
  v103 = (void *)v32;
  if (v32) {
    v33 = (void *)v32;
  }
  else {
    v33 = &unk_1F27F0D08;
  }
  v130[25] = v33;
  v129[26] = @"ModeTurnedOnDurationToday";
  uint64_t v34 = [(ATXModeSetupPredictionMetrics *)self modeTurnedOnDurationToday];
  v102 = (void *)v34;
  if (v34) {
    v35 = (void *)v34;
  }
  else {
    v35 = &unk_1F27F0D08;
  }
  v130[26] = v35;
  v129[27] = @"ModeNotificationsClearedCount7Days";
  uint64_t v36 = [(ATXModeSetupPredictionMetrics *)self modeNotificationsClearedCount7Days];
  v101 = (void *)v36;
  if (v36) {
    v37 = (void *)v36;
  }
  else {
    v37 = &unk_1F27F0D08;
  }
  v130[27] = v37;
  v129[28] = @"ModeNotificationsClearedCountToday";
  uint64_t v38 = [(ATXModeSetupPredictionMetrics *)self modeNotificationsClearedCountToday];
  v100 = (void *)v38;
  if (v38) {
    v39 = (void *)v38;
  }
  else {
    v39 = &unk_1F27F0D08;
  }
  v130[28] = v39;
  v129[29] = @"GlobalNotificationsClearedCount7Days";
  uint64_t v40 = [(ATXModeSetupPredictionMetrics *)self globalNotificationsClearedCount7Days];
  v99 = (void *)v40;
  if (v40) {
    v41 = (void *)v40;
  }
  else {
    v41 = &unk_1F27F0D08;
  }
  v130[29] = v41;
  v129[30] = @"GlobalNotificationsClearedCountToday";
  uint64_t v42 = [(ATXModeSetupPredictionMetrics *)self globalNotificationsClearedCountToday];
  v98 = (void *)v42;
  if (v42) {
    v43 = (void *)v42;
  }
  else {
    v43 = &unk_1F27F0D08;
  }
  v130[30] = v43;
  v129[31] = @"ModeNotificationsCount7Days";
  uint64_t v44 = [(ATXModeSetupPredictionMetrics *)self modeNotificationsCount7Days];
  v97 = (void *)v44;
  if (v44) {
    v45 = (void *)v44;
  }
  else {
    v45 = &unk_1F27F0D08;
  }
  v130[31] = v45;
  v129[32] = @"ModeNotificationsCountToday";
  uint64_t v46 = [(ATXModeSetupPredictionMetrics *)self modeNotificationsCountToday];
  v96 = (void *)v46;
  if (v46) {
    v47 = (void *)v46;
  }
  else {
    v47 = &unk_1F27F0D08;
  }
  v130[32] = v47;
  v129[33] = @"GlobalNotificationsCount7Days";
  uint64_t v48 = [(ATXModeSetupPredictionMetrics *)self globalNotificationsCount7Days];
  v95 = (void *)v48;
  if (v48) {
    v49 = (void *)v48;
  }
  else {
    v49 = &unk_1F27F0D08;
  }
  v130[33] = v49;
  v129[34] = @"GlobalNotificationsCountToday";
  uint64_t v50 = [(ATXModeSetupPredictionMetrics *)self globalNotificationsCountToday];
  v94 = (void *)v50;
  if (v50) {
    v51 = (void *)v50;
  }
  else {
    v51 = &unk_1F27F0D08;
  }
  v130[34] = v51;
  v129[35] = @"ModeWeightedAppLaunchCountBasedOnGlobalPriors7Days";
  uint64_t v52 = [(ATXModeSetupPredictionMetrics *)self modeWeightedAppLaunchCountBasedOnGlobalPriors7Days];
  v93 = (void *)v52;
  if (v52) {
    v53 = (void *)v52;
  }
  else {
    v53 = &unk_1F27F0D08;
  }
  v130[35] = v53;
  v129[36] = @"ModeWeightedAppLaunchCountBasedOnGlobalPriorsToday";
  uint64_t v54 = [(ATXModeSetupPredictionMetrics *)self modeWeightedAppLaunchCountBasedOnGlobalPriorsToday];
  v92 = (void *)v54;
  if (v54) {
    v55 = (void *)v54;
  }
  else {
    v55 = &unk_1F27F0D08;
  }
  v130[36] = v55;
  v129[37] = @"GlobalPosterConfigurationsCount";
  uint64_t v56 = [(ATXModeSetupPredictionMetrics *)self globalPosterConfigurationsCount];
  v91 = (void *)v56;
  if (v56) {
    v57 = (void *)v56;
  }
  else {
    v57 = &unk_1F27F0D08;
  }
  v130[37] = v57;
  v129[38] = @"GlobalAppInterruptionsCount7Days";
  uint64_t v58 = [(ATXModeSetupPredictionMetrics *)self globalAppInterruptionsCount7Days];
  v90 = (void *)v58;
  if (v58) {
    v59 = (void *)v58;
  }
  else {
    v59 = &unk_1F27F0D08;
  }
  v130[38] = v59;
  v129[39] = @"GlobalAppInterruptionsCountToday";
  uint64_t v60 = [(ATXModeSetupPredictionMetrics *)self globalAppInterruptionsCountToday];
  v89 = (void *)v60;
  if (v60) {
    v61 = (void *)v60;
  }
  else {
    v61 = &unk_1F27F0D08;
  }
  v130[39] = v61;
  v129[40] = @"ModeAppInterruptionsCountInModeInferred7Days";
  uint64_t v62 = [(ATXModeSetupPredictionMetrics *)self modeAppInterruptionsCountInModeInferred7Days];
  v88 = (void *)v62;
  if (v62) {
    v63 = (void *)v62;
  }
  else {
    v63 = &unk_1F27F0D08;
  }
  v130[40] = v63;
  v129[41] = @"ModeAppInterruptionsCountInModeInferredToday";
  uint64_t v64 = [(ATXModeSetupPredictionMetrics *)self modeAppInterruptionsCountInModeInferredToday];
  v87 = (void *)v64;
  if (v64) {
    v65 = (void *)v64;
  }
  else {
    v65 = &unk_1F27F0D08;
  }
  v130[41] = v65;
  v129[42] = @"ModeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days";
  uint64_t v66 = [(ATXModeSetupPredictionMetrics *)self modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days];
  v67 = (void *)v66;
  if (v66) {
    v68 = (void *)v66;
  }
  else {
    v68 = &unk_1F27F0D08;
  }
  v130[42] = v68;
  v129[43] = @"ModeAppInterruptionsCountBasedOnAllowListOfInferredModeToday";
  uint64_t v69 = [(ATXModeSetupPredictionMetrics *)self modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday];
  v70 = (void *)v69;
  if (v69) {
    v71 = (void *)v69;
  }
  else {
    v71 = &unk_1F27F0D08;
  }
  v130[43] = v71;
  v129[44] = @"ModeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days";
  uint64_t v72 = [(ATXModeSetupPredictionMetrics *)self modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days];
  v73 = (void *)v72;
  if (v72) {
    v74 = (void *)v72;
  }
  else {
    v74 = &unk_1F27F0D08;
  }
  v130[44] = v74;
  v129[45] = @"ModeAppInterruptionsCountBasedOnDenyListOfInferredModeToday";
  uint64_t v75 = [(ATXModeSetupPredictionMetrics *)self modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday];
  v76 = (void *)v75;
  if (v75) {
    v77 = (void *)v75;
  }
  else {
    v77 = &unk_1F27F0D08;
  }
  v130[45] = v77;
  v129[46] = @"TrialTreatmentId";
  v78 = [(ATXModeSetupPredictionMetrics *)self trialTreatmentId];
  v79 = v78;
  if (!v78)
  {
    v79 = [MEMORY[0x1E4F1CA98] null];
  }
  v130[46] = v79;
  v129[47] = @"TrialExperimentId";
  v80 = [(ATXModeSetupPredictionMetrics *)self trialExperimentId];
  v81 = v80;
  if (!v80)
  {
    v81 = [MEMORY[0x1E4F1CA98] null];
  }
  v130[47] = v81;
  v129[48] = @"TrialDeploymentId";
  v82 = [(ATXModeSetupPredictionMetrics *)self trialDeploymentId];
  v83 = v82;
  if (!v82)
  {
    v83 = [MEMORY[0x1E4F1CA98] null];
  }
  v130[48] = v83;
  id v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v130 forKeys:v129 count:49];
  if (!v82) {

  }
  if (!v80) {
  if (!v78)
  }

  if (!v128) {
  return v86;
  }
}

- (id)description
{
  id v40 = (id)NSString;
  uint64_t v64 = [(ATXModeSetupPredictionMetrics *)self modeName];
  if ([(ATXModeSetupPredictionMetrics *)self modeIsCreated]) {
    uint64_t v3 = @"YES";
  }
  else {
    uint64_t v3 = @"NO";
  }
  v39 = v3;
  if ([(ATXModeSetupPredictionMetrics *)self modeWasCreatedWithin7Days]) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  uint64_t v38 = v4;
  if ([(ATXModeSetupPredictionMetrics *)self modeWasCreatedToday]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  v37 = v5;
  if ([(ATXModeSetupPredictionMetrics *)self modeHasActivatedWithin7Days]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  uint64_t v36 = v6;
  if ([(ATXModeSetupPredictionMetrics *)self modeHasActivatedToday]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v35 = v7;
  if ([(ATXModeSetupPredictionMetrics *)self wasOfferedDigestOnboardingSuggestion])
  {
    uint64_t v8 = @"YES";
  }
  else
  {
    uint64_t v8 = @"NO";
  }
  uint64_t v34 = v8;
  if ([(ATXModeSetupPredictionMetrics *)self hasSetupDigestThroughOnboardingSuggestion])
  {
    v9 = @"YES";
  }
  else
  {
    v9 = @"NO";
  }
  v33 = v9;
  if ([(ATXModeSetupPredictionMetrics *)self isDigestCurrentlyEnabled]) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  uint64_t v32 = v10;
  if ([(ATXModeSetupPredictionMetrics *)self modeHasLinkedPoster]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v31 = v11;
  if ([(ATXModeSetupPredictionMetrics *)self modeHasSmartActivationEnabled]) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  uint64_t v30 = v12;
  v63 = [(ATXModeSetupPredictionMetrics *)self globalAllPagesFolderCountBucket];
  v61 = [(ATXModeSetupPredictionMetrics *)self globalAllPagesWidgetCountBucket];
  uint64_t v62 = [(ATXModeSetupPredictionMetrics *)self homePageFolderCountBucket];
  v59 = [(ATXModeSetupPredictionMetrics *)self homePageWidgetCountBucket];
  uint64_t v60 = [(ATXModeSetupPredictionMetrics *)self globalAppLaunchCount7Days];
  v57 = [(ATXModeSetupPredictionMetrics *)self globalAppLaunchCountToday];
  uint64_t v58 = [(ATXModeSetupPredictionMetrics *)self modeAppLaunchCountBasedOnGlobalPriors7Days];
  v55 = [(ATXModeSetupPredictionMetrics *)self modeAppLaunchCountBasedOnGlobalPriorsToday];
  uint64_t v56 = [(ATXModeSetupPredictionMetrics *)self modeInferredDuration7Days];
  v53 = [(ATXModeSetupPredictionMetrics *)self modeInferredDurationToday];
  uint64_t v54 = [(ATXModeSetupPredictionMetrics *)self modeInferredCount7Days];
  uint64_t v52 = [(ATXModeSetupPredictionMetrics *)self modeInferredCountToday];
  v51 = [(ATXModeSetupPredictionMetrics *)self modeTurnedOnCount7Days];
  uint64_t v50 = [(ATXModeSetupPredictionMetrics *)self modeTurnedOnCountToday];
  uint64_t v48 = [(ATXModeSetupPredictionMetrics *)self modeTurnedOnDuration7Days];
  v49 = [(ATXModeSetupPredictionMetrics *)self modeTurnedOnDurationToday];
  v47 = [(ATXModeSetupPredictionMetrics *)self modeNotificationsClearedCount7Days];
  v29 = [(ATXModeSetupPredictionMetrics *)self modeNotificationsClearedCountToday];
  uint64_t v46 = [(ATXModeSetupPredictionMetrics *)self globalNotificationsClearedCount7Days];
  uint64_t v28 = [(ATXModeSetupPredictionMetrics *)self globalNotificationsClearedCountToday];
  v45 = [(ATXModeSetupPredictionMetrics *)self modeNotificationsCount7Days];
  v27 = [(ATXModeSetupPredictionMetrics *)self modeNotificationsCountToday];
  uint64_t v44 = [(ATXModeSetupPredictionMetrics *)self globalNotificationsCount7Days];
  uint64_t v26 = [(ATXModeSetupPredictionMetrics *)self globalNotificationsCountToday];
  v43 = [(ATXModeSetupPredictionMetrics *)self modeWeightedAppLaunchCountBasedOnGlobalPriors7Days];
  v25 = [(ATXModeSetupPredictionMetrics *)self modeWeightedAppLaunchCountBasedOnGlobalPriorsToday];
  uint64_t v42 = [(ATXModeSetupPredictionMetrics *)self globalPosterConfigurationsCount];
  uint64_t v24 = [(ATXModeSetupPredictionMetrics *)self globalAppInterruptionsCount7Days];
  v23 = [(ATXModeSetupPredictionMetrics *)self globalAppInterruptionsCountToday];
  uint64_t v22 = [(ATXModeSetupPredictionMetrics *)self modeAppInterruptionsCountInModeInferred7Days];
  v21 = [(ATXModeSetupPredictionMetrics *)self modeAppInterruptionsCountInModeInferredToday];
  uint64_t v20 = [(ATXModeSetupPredictionMetrics *)self modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days];
  v19 = [(ATXModeSetupPredictionMetrics *)self modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday];
  uint64_t v18 = [(ATXModeSetupPredictionMetrics *)self modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days];
  v17 = [(ATXModeSetupPredictionMetrics *)self modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday];
  v13 = [(ATXModeSetupPredictionMetrics *)self trialTreatmentId];
  uint64_t v14 = [(ATXModeSetupPredictionMetrics *)self trialExperimentId];
  v15 = [(ATXModeSetupPredictionMetrics *)self trialDeploymentId];
  objc_msgSend(v40, "stringWithFormat:", @"ATXModeSetupPredictionMetrics\nModeName:%@ \nModeIsCreated:%@ \nModeWasCreatedWithin7Days:%@ \nModeWasCreatedToday:%@ \nModeHasActivatedWithin7Days:%@ \nModeHasActivatedToday:%@ \nWasOfferedDigestOnboardingSuggestion:%@ \nHasSetupDigestThroughOnboardingSuggestion:%@ \nIsDigestCurrentlyEnabled:%@ \nModeHasLinkedPoster:%@ \nModeHasSmartActivationEnabled:%@ \nGlobalAllPagesFolderCountBucket:%@ \nGlobalAllPagesWidgetCountBucket:%@ \nHomePageFolderCountBucket:%@ \nHomePageWidgetCountBucket:%@ \nGlobalAppLaunchCount7Days:%@ \nGlobalAppLaunchCountToday:%@ \nModeAppLaunchCountBasedOnGlobalPriors7Days:%@ \nModeAppLaunchCountBasedOnGlobalPriorsToday:%@ \nModeInferredDuration7Days:%@ \nModeInferredDurationToday:%@ \nModeInferredCount7Days:%@ \nModeInferredCountToday:%@ \nModeTurnedOnCount7Days:%@ \nModeTurnedOnCountToday:%@ \nModeTurnedOnDuration7Days:%@ \nModeTurnedOnDurationToday:%@ \nModeNotificationsClearedCount7Days:%@ \nModeNotificationsClearedCountToday:%@ \nGlobalNotificationsClearedCount7Days:%@ \nGlobalNotificationsClearedCountToday:%@ \nModeNotificationsCount7Days:%@ \nModeNotificationsCountToday:%@ \nGlobalNotificationsCount7Days:%@ \nGlobalNotificationsCountToday:%@ \nModeWeightedAppLaunchCountBasedOnGlobalPriors7Days:%@ \nModeWeightedAppLaunchCountBasedOnGlobalPriorsToday:%@ \nGlobalPosterConfigurationsCount:%@ \nGlobalAppInterruptionsCount7Days:%@ \nGlobalAppInterruptionsCountToday:%@ \nModeAppInterruptionsCountInModeInferred7Days:%@ \nModeAppInterruptionsCountInModeInferredToday:%@ \nModeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days:%@ \nModeAppInterruptionsCountBasedOnAllowListOfInferredModeToday:%@ \nModeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days:%@ \nModeAppInterruptionsCountBasedOnDenyListOfInferredModeToday:%@ \nTrialTreatmentId:%@ \nTrialExperimentId:%@ \nTrialDeploymentId:%@ \n", v64, v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v63, v61, v62, v59, v60,
    v57,
    v58,
    v55,
    v56,
    v53,
    v54,
    v52,
    v51,
    v50,
    v48,
    v49,
    v47,
    v29,
    v46,
    v28,
    v45,
    v27,
    v44,
    v26,
    v43,
    v25,
    v42,
    v24,
    v23,
    v22,
    v21,
    v20,
    v19,
    v18,
    v17,
    v13,
    v14,
    v15);
  id v41 = (id)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (NSString)modeName
{
  return self->_modeName;
}

- (void)setModeName:(id)a3
{
}

- (BOOL)modeIsCreated
{
  return self->_modeIsCreated;
}

- (void)setModeIsCreated:(BOOL)a3
{
  self->_modeIsCreated = a3;
}

- (BOOL)modeWasCreatedWithin7Days
{
  return self->_modeWasCreatedWithin7Days;
}

- (void)setModeWasCreatedWithin7Days:(BOOL)a3
{
  self->_modeWasCreatedWithin7Days = a3;
}

- (BOOL)modeWasCreatedToday
{
  return self->_modeWasCreatedToday;
}

- (void)setModeWasCreatedToday:(BOOL)a3
{
  self->_modeWasCreatedToday = a3;
}

- (BOOL)modeHasActivatedWithin7Days
{
  return self->_modeHasActivatedWithin7Days;
}

- (void)setModeHasActivatedWithin7Days:(BOOL)a3
{
  self->_modeHasActivatedWithin7Days = a3;
}

- (BOOL)modeHasActivatedToday
{
  return self->_modeHasActivatedToday;
}

- (void)setModeHasActivatedToday:(BOOL)a3
{
  self->_modeHasActivatedToday = a3;
}

- (BOOL)wasOfferedDigestOnboardingSuggestion
{
  return self->_wasOfferedDigestOnboardingSuggestion;
}

- (void)setWasOfferedDigestOnboardingSuggestion:(BOOL)a3
{
  self->_wasOfferedDigestOnboardingSuggestion = a3;
}

- (BOOL)hasSetupDigestThroughOnboardingSuggestion
{
  return self->_hasSetupDigestThroughOnboardingSuggestion;
}

- (void)setHasSetupDigestThroughOnboardingSuggestion:(BOOL)a3
{
  self->_hasSetupDigestThroughOnboardingSuggestion = a3;
}

- (BOOL)isDigestCurrentlyEnabled
{
  return self->_isDigestCurrentlyEnabled;
}

- (void)setIsDigestCurrentlyEnabled:(BOOL)a3
{
  self->_isDigestCurrentlyEnabled = a3;
}

- (BOOL)modeHasLinkedPoster
{
  return self->_modeHasLinkedPoster;
}

- (void)setModeHasLinkedPoster:(BOOL)a3
{
  self->_modeHasLinkedPoster = a3;
}

- (BOOL)modeHasSmartActivationEnabled
{
  return self->_modeHasSmartActivationEnabled;
}

- (void)setModeHasSmartActivationEnabled:(BOOL)a3
{
  self->_modeHasSmartActivationEnabled = a3;
}

- (NSNumber)globalAllPagesFolderCountBucket
{
  return self->_globalAllPagesFolderCountBucket;
}

- (void)setGlobalAllPagesFolderCountBucket:(id)a3
{
}

- (NSNumber)globalAllPagesWidgetCountBucket
{
  return self->_globalAllPagesWidgetCountBucket;
}

- (void)setGlobalAllPagesWidgetCountBucket:(id)a3
{
}

- (NSNumber)homePageFolderCountBucket
{
  return self->_homePageFolderCountBucket;
}

- (void)setHomePageFolderCountBucket:(id)a3
{
}

- (NSNumber)homePageWidgetCountBucket
{
  return self->_homePageWidgetCountBucket;
}

- (void)setHomePageWidgetCountBucket:(id)a3
{
}

- (NSNumber)globalAppLaunchCount7Days
{
  return self->_globalAppLaunchCount7Days;
}

- (void)setGlobalAppLaunchCount7Days:(id)a3
{
}

- (NSNumber)globalAppLaunchCountToday
{
  return self->_globalAppLaunchCountToday;
}

- (void)setGlobalAppLaunchCountToday:(id)a3
{
}

- (NSNumber)modeAppLaunchCountBasedOnGlobalPriors7Days
{
  return self->_modeAppLaunchCountBasedOnGlobalPriors7Days;
}

- (void)setModeAppLaunchCountBasedOnGlobalPriors7Days:(id)a3
{
}

- (NSNumber)modeAppLaunchCountBasedOnGlobalPriorsToday
{
  return self->_modeAppLaunchCountBasedOnGlobalPriorsToday;
}

- (void)setModeAppLaunchCountBasedOnGlobalPriorsToday:(id)a3
{
}

- (NSNumber)modeInferredDuration7Days
{
  return self->_modeInferredDuration7Days;
}

- (void)setModeInferredDuration7Days:(id)a3
{
}

- (NSNumber)modeInferredDurationToday
{
  return self->_modeInferredDurationToday;
}

- (void)setModeInferredDurationToday:(id)a3
{
}

- (NSNumber)modeInferredCount7Days
{
  return self->_modeInferredCount7Days;
}

- (void)setModeInferredCount7Days:(id)a3
{
}

- (NSNumber)modeInferredCountToday
{
  return self->_modeInferredCountToday;
}

- (void)setModeInferredCountToday:(id)a3
{
}

- (NSNumber)modeTurnedOnCount7Days
{
  return self->_modeTurnedOnCount7Days;
}

- (void)setModeTurnedOnCount7Days:(id)a3
{
}

- (NSNumber)modeTurnedOnCountToday
{
  return self->_modeTurnedOnCountToday;
}

- (void)setModeTurnedOnCountToday:(id)a3
{
}

- (NSNumber)modeTurnedOnDuration7Days
{
  return self->_modeTurnedOnDuration7Days;
}

- (void)setModeTurnedOnDuration7Days:(id)a3
{
}

- (NSNumber)modeTurnedOnDurationToday
{
  return self->_modeTurnedOnDurationToday;
}

- (void)setModeTurnedOnDurationToday:(id)a3
{
}

- (NSNumber)modeNotificationsClearedCount7Days
{
  return self->_modeNotificationsClearedCount7Days;
}

- (void)setModeNotificationsClearedCount7Days:(id)a3
{
}

- (NSNumber)modeNotificationsClearedCountToday
{
  return self->_modeNotificationsClearedCountToday;
}

- (void)setModeNotificationsClearedCountToday:(id)a3
{
}

- (NSNumber)globalNotificationsClearedCount7Days
{
  return self->_globalNotificationsClearedCount7Days;
}

- (void)setGlobalNotificationsClearedCount7Days:(id)a3
{
}

- (NSNumber)globalNotificationsClearedCountToday
{
  return self->_globalNotificationsClearedCountToday;
}

- (void)setGlobalNotificationsClearedCountToday:(id)a3
{
}

- (NSNumber)modeNotificationsCount7Days
{
  return self->_modeNotificationsCount7Days;
}

- (void)setModeNotificationsCount7Days:(id)a3
{
}

- (NSNumber)modeNotificationsCountToday
{
  return self->_modeNotificationsCountToday;
}

- (void)setModeNotificationsCountToday:(id)a3
{
}

- (NSNumber)globalNotificationsCount7Days
{
  return self->_globalNotificationsCount7Days;
}

- (void)setGlobalNotificationsCount7Days:(id)a3
{
}

- (NSNumber)globalNotificationsCountToday
{
  return self->_globalNotificationsCountToday;
}

- (void)setGlobalNotificationsCountToday:(id)a3
{
}

- (NSNumber)modeWeightedAppLaunchCountBasedOnGlobalPriors7Days
{
  return self->_modeWeightedAppLaunchCountBasedOnGlobalPriors7Days;
}

- (void)setModeWeightedAppLaunchCountBasedOnGlobalPriors7Days:(id)a3
{
}

- (NSNumber)modeWeightedAppLaunchCountBasedOnGlobalPriorsToday
{
  return self->_modeWeightedAppLaunchCountBasedOnGlobalPriorsToday;
}

- (void)setModeWeightedAppLaunchCountBasedOnGlobalPriorsToday:(id)a3
{
}

- (NSNumber)globalPosterConfigurationsCount
{
  return self->_globalPosterConfigurationsCount;
}

- (void)setGlobalPosterConfigurationsCount:(id)a3
{
}

- (NSNumber)globalAppInterruptionsCount7Days
{
  return self->_globalAppInterruptionsCount7Days;
}

- (void)setGlobalAppInterruptionsCount7Days:(id)a3
{
}

- (NSNumber)globalAppInterruptionsCountToday
{
  return self->_globalAppInterruptionsCountToday;
}

- (void)setGlobalAppInterruptionsCountToday:(id)a3
{
}

- (NSNumber)modeAppInterruptionsCountInModeInferred7Days
{
  return self->_modeAppInterruptionsCountInModeInferred7Days;
}

- (void)setModeAppInterruptionsCountInModeInferred7Days:(id)a3
{
}

- (NSNumber)modeAppInterruptionsCountInModeInferredToday
{
  return self->_modeAppInterruptionsCountInModeInferredToday;
}

- (void)setModeAppInterruptionsCountInModeInferredToday:(id)a3
{
}

- (NSNumber)modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days
{
  return self->_modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days;
}

- (void)setModeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days:(id)a3
{
}

- (NSNumber)modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday
{
  return self->_modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday;
}

- (void)setModeAppInterruptionsCountBasedOnAllowListOfInferredModeToday:(id)a3
{
}

- (NSNumber)modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days
{
  return self->_modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days;
}

- (void)setModeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days:(id)a3
{
}

- (NSNumber)modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday
{
  return self->_modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday;
}

- (void)setModeAppInterruptionsCountBasedOnDenyListOfInferredModeToday:(id)a3
{
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setTrialExperimentId:(id)a3
{
}

- (NSNumber)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setTrialDeploymentId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountBasedOnDenyListOfInferredModeToday, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountBasedOnDenyListOfInferredMode7Days, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountBasedOnAllowListOfInferredModeToday, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountBasedOnAllowListOfInferredMode7Days, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountInModeInferredToday, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountInModeInferred7Days, 0);
  objc_storeStrong((id *)&self->_globalAppInterruptionsCountToday, 0);
  objc_storeStrong((id *)&self->_globalAppInterruptionsCount7Days, 0);
  objc_storeStrong((id *)&self->_globalPosterConfigurationsCount, 0);
  objc_storeStrong((id *)&self->_modeWeightedAppLaunchCountBasedOnGlobalPriorsToday, 0);
  objc_storeStrong((id *)&self->_modeWeightedAppLaunchCountBasedOnGlobalPriors7Days, 0);
  objc_storeStrong((id *)&self->_globalNotificationsCountToday, 0);
  objc_storeStrong((id *)&self->_globalNotificationsCount7Days, 0);
  objc_storeStrong((id *)&self->_modeNotificationsCountToday, 0);
  objc_storeStrong((id *)&self->_modeNotificationsCount7Days, 0);
  objc_storeStrong((id *)&self->_globalNotificationsClearedCountToday, 0);
  objc_storeStrong((id *)&self->_globalNotificationsClearedCount7Days, 0);
  objc_storeStrong((id *)&self->_modeNotificationsClearedCountToday, 0);
  objc_storeStrong((id *)&self->_modeNotificationsClearedCount7Days, 0);
  objc_storeStrong((id *)&self->_modeTurnedOnDurationToday, 0);
  objc_storeStrong((id *)&self->_modeTurnedOnDuration7Days, 0);
  objc_storeStrong((id *)&self->_modeTurnedOnCountToday, 0);
  objc_storeStrong((id *)&self->_modeTurnedOnCount7Days, 0);
  objc_storeStrong((id *)&self->_modeInferredCountToday, 0);
  objc_storeStrong((id *)&self->_modeInferredCount7Days, 0);
  objc_storeStrong((id *)&self->_modeInferredDurationToday, 0);
  objc_storeStrong((id *)&self->_modeInferredDuration7Days, 0);
  objc_storeStrong((id *)&self->_modeAppLaunchCountBasedOnGlobalPriorsToday, 0);
  objc_storeStrong((id *)&self->_modeAppLaunchCountBasedOnGlobalPriors7Days, 0);
  objc_storeStrong((id *)&self->_globalAppLaunchCountToday, 0);
  objc_storeStrong((id *)&self->_globalAppLaunchCount7Days, 0);
  objc_storeStrong((id *)&self->_homePageWidgetCountBucket, 0);
  objc_storeStrong((id *)&self->_homePageFolderCountBucket, 0);
  objc_storeStrong((id *)&self->_globalAllPagesWidgetCountBucket, 0);
  objc_storeStrong((id *)&self->_globalAllPagesFolderCountBucket, 0);
  objc_storeStrong((id *)&self->_modeName, 0);
}

@end