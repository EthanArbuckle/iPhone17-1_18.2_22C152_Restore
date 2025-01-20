@interface ATXFocusModeSignalsMetric
- (BOOL)entityOccurredGloballyOverLastNDays;
- (BOOL)entityOccurredInModeOverLastNDays;
- (BOOL)isAppCandidateSuggestion;
- (BOOL)isAppRecommendedSuggestion;
- (BOOL)wasAppSuggestedDuringModeSetup;
- (BOOL)wasAppSuggestionDuringModeSetupAccepted;
- (NSNumber)categoryScore;
- (NSNumber)classConditionalOfNotificationsClearedForEntity;
- (NSNumber)classConditionalOfNotificationsReceivedForEntity;
- (NSNumber)classConditionalProbabilityOfModeGivenEntity;
- (NSNumber)deploymentId;
- (NSNumber)entityModeEntityScore;
- (NSNumber)globalAppInterruptionsCountByEntity;
- (NSNumber)globalClearanceRateForEntity;
- (NSNumber)globalInterruptingPrior;
- (NSNumber)globalModeAffinityPrior;
- (NSNumber)globalOccurrencesOfEntity;
- (NSNumber)globalPopularityForEntity;
- (NSNumber)globalPopularityOfInterruptingEntity;
- (NSNumber)globalPopularityOfNotificationsReceivedForEntity;
- (NSNumber)localClearanceRateForEntity;
- (NSNumber)localOccurrencesOfEntityInMode;
- (NSNumber)localPopularityOfNotificationsReceivedForEntity;
- (NSNumber)modeAppInterruptionsClassConditionalProbabilityByEntity;
- (NSNumber)modeAppInterruptionsCountByEntity;
- (NSNumber)modePopularityForEntity;
- (NSNumber)modePopularityOfInterruptingEntity;
- (NSNumber)notificationsClearedGlobally;
- (NSNumber)notificationsClearedInMode;
- (NSNumber)notificationsMuted;
- (NSNumber)notificationsReceivedGlobally;
- (NSNumber)notificationsReceivedInMode;
- (NSNumber)posteriorProbabilityOfEntityGivenMode;
- (NSNumber)ratioOfLocalToGlobalNotificationsClearedRateForEntity;
- (NSNumber)ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
- (NSNumber)ratioOfModePopularityToGlobalPopularityOfEntity;
- (NSNumber)ratioOfModePopularityToGlobalPopularityOfInterruptingEntity;
- (NSNumber)uniqueOccurrencesOfEntityInMode;
- (NSString)abGroup;
- (NSString)activeConfigurationType;
- (NSString)appBundleId;
- (NSString)experimentId;
- (NSString)intentHash;
- (NSString)treatmentId;
- (NSString)widgetBundleIdAndKind;
- (NSString)widgetSize;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)focusMode;
- (void)setAbGroup:(id)a3;
- (void)setActiveConfigurationType:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setCategoryScore:(id)a3;
- (void)setClassConditionalOfNotificationsClearedForEntity:(id)a3;
- (void)setClassConditionalOfNotificationsReceivedForEntity:(id)a3;
- (void)setClassConditionalProbabilityOfModeGivenEntity:(id)a3;
- (void)setDeploymentId:(id)a3;
- (void)setEntityModeEntityScore:(id)a3;
- (void)setEntityOccurredGloballyOverLastNDays:(BOOL)a3;
- (void)setEntityOccurredInModeOverLastNDays:(BOOL)a3;
- (void)setExperimentId:(id)a3;
- (void)setFocusMode:(unint64_t)a3;
- (void)setGlobalAppInterruptionsCountByEntity:(id)a3;
- (void)setGlobalClearanceRateForEntity:(id)a3;
- (void)setGlobalInterruptingPrior:(id)a3;
- (void)setGlobalModeAffinityPrior:(id)a3;
- (void)setGlobalOccurrencesOfEntity:(id)a3;
- (void)setGlobalPopularityForEntity:(id)a3;
- (void)setGlobalPopularityOfInterruptingEntity:(id)a3;
- (void)setGlobalPopularityOfNotificationsReceivedForEntity:(id)a3;
- (void)setIntentHash:(id)a3;
- (void)setIsAppCandidateSuggestion:(BOOL)a3;
- (void)setIsAppRecommendedSuggestion:(BOOL)a3;
- (void)setLocalClearanceRateForEntity:(id)a3;
- (void)setLocalOccurrencesOfEntityInMode:(id)a3;
- (void)setLocalPopularityOfNotificationsReceivedForEntity:(id)a3;
- (void)setModeAppInterruptionsClassConditionalProbabilityByEntity:(id)a3;
- (void)setModeAppInterruptionsCountByEntity:(id)a3;
- (void)setModePopularityForEntity:(id)a3;
- (void)setModePopularityOfInterruptingEntity:(id)a3;
- (void)setNotificationsClearedGlobally:(id)a3;
- (void)setNotificationsClearedInMode:(id)a3;
- (void)setNotificationsMuted:(id)a3;
- (void)setNotificationsReceivedGlobally:(id)a3;
- (void)setNotificationsReceivedInMode:(id)a3;
- (void)setPosteriorProbabilityOfEntityGivenMode:(id)a3;
- (void)setRatioOfLocalToGlobalNotificationsClearedRateForEntity:(id)a3;
- (void)setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:(id)a3;
- (void)setRatioOfModePopularityToGlobalPopularityOfEntity:(id)a3;
- (void)setRatioOfModePopularityToGlobalPopularityOfInterruptingEntity:(id)a3;
- (void)setTreatmentId:(id)a3;
- (void)setUniqueOccurrencesOfEntityInMode:(id)a3;
- (void)setWasAppSuggestedDuringModeSetup:(BOOL)a3;
- (void)setWasAppSuggestionDuringModeSetupAccepted:(BOOL)a3;
- (void)setWidgetBundleIdAndKind:(id)a3;
- (void)setWidgetSize:(id)a3;
@end

@implementation ATXFocusModeSignalsMetric

- (id)metricName
{
  return @"com.apple.FocusModeWidget";
}

- (id)coreAnalyticsDictionary
{
  v164[47] = *MEMORY[0x1E4F143B8];
  v163[0] = @"FocusMode";
  [(ATXFocusModeSignalsMetric *)self focusMode];
  uint64_t v3 = ATXModeToString();
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v121 = (void *)v3;
  v164[0] = v3;
  v163[1] = @"AppBundleId";
  uint64_t v5 = [(ATXFocusModeSignalsMetric *)self appBundleId];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v138 = v6;
  v139 = v4;
  v120 = (void *)v5;
  v164[1] = v5;
  v163[2] = @"ActiveConfigurationType";
  uint64_t v7 = [(ATXFocusModeSignalsMetric *)self activeConfigurationType];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v119 = (void *)v7;
  v164[2] = v7;
  v163[3] = @"wasAppSuggestedDuringModeSetup";
  v136 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeSignalsMetric wasAppSuggestedDuringModeSetup](self, "wasAppSuggestedDuringModeSetup"));
  v164[3] = v136;
  v163[4] = @"wasAppSuggestionDuringModeSetupAccepted";
  v135 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeSignalsMetric wasAppSuggestionDuringModeSetupAccepted](self, "wasAppSuggestionDuringModeSetupAccepted"));
  v164[4] = v135;
  v163[5] = @"CategoryScore";
  uint64_t v9 = [(ATXFocusModeSignalsMetric *)self categoryScore];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v118 = (void *)v9;
  v164[5] = v9;
  v163[6] = @"ClassConditionalProbabilityOfModeGivenEntity";
  uint64_t v11 = [(ATXFocusModeSignalsMetric *)self classConditionalProbabilityOfModeGivenEntity];
  v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v117 = (void *)v11;
  v164[6] = v11;
  v163[7] = @"EntityModeEntityScore";
  uint64_t v13 = [(ATXFocusModeSignalsMetric *)self entityModeEntityScore];
  v14 = (void *)v13;
  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v116 = (void *)v13;
  v164[7] = v13;
  v163[8] = @"GlobalPopularityForEntity";
  uint64_t v15 = [(ATXFocusModeSignalsMetric *)self globalPopularityForEntity];
  v16 = (void *)v15;
  if (!v15)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v115 = (void *)v15;
  v164[8] = v15;
  v163[9] = @"ModePopularityForEntity";
  uint64_t v17 = [(ATXFocusModeSignalsMetric *)self modePopularityForEntity];
  v18 = (void *)v17;
  if (!v17)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v114 = (void *)v17;
  v164[9] = v17;
  v163[10] = @"RatioOfModePopularityToGlobalPopularityOfEntity";
  uint64_t v19 = [(ATXFocusModeSignalsMetric *)self ratioOfModePopularityToGlobalPopularityOfEntity];
  v129 = (void *)v19;
  if (!v19)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v113 = (void *)v19;
  v164[10] = v19;
  v163[11] = @"PosteriorProbabilityOfEntityGivenMode";
  uint64_t v20 = [(ATXFocusModeSignalsMetric *)self posteriorProbabilityOfEntityGivenMode];
  v21 = (void *)v20;
  if (!v20)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v112 = (void *)v20;
  v164[11] = v20;
  v163[12] = @"GlobalOccurrencesOfEntity";
  uint64_t v22 = [(ATXFocusModeSignalsMetric *)self globalOccurrencesOfEntity];
  v162 = (void *)v22;
  if (!v22)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v111 = (void *)v22;
  v164[12] = v22;
  v163[13] = @"LocalOccurrencesOfEntityInMode";
  uint64_t v23 = [(ATXFocusModeSignalsMetric *)self localOccurrencesOfEntityInMode];
  v161 = (void *)v23;
  if (!v23)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v110 = (void *)v23;
  v164[13] = v23;
  v163[14] = @"UniqueOccurrencesOfEntityInMode";
  uint64_t v24 = [(ATXFocusModeSignalsMetric *)self uniqueOccurrencesOfEntityInMode];
  v160 = (void *)v24;
  if (!v24)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v109 = (void *)v24;
  v164[14] = v24;
  v163[15] = @"EntityOccurredGloballyOverTheLastNDays";
  v127 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeSignalsMetric entityOccurredGloballyOverLastNDays](self, "entityOccurredGloballyOverLastNDays"));
  v164[15] = v127;
  v163[16] = @"EntityOccurredInModeOverLastNDays";
  v126 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeSignalsMetric entityOccurredInModeOverLastNDays](self, "entityOccurredInModeOverLastNDays"));
  v164[16] = v126;
  v163[17] = @"WidgetBundleIdAndKind";
  uint64_t v25 = [(ATXFocusModeSignalsMetric *)self widgetBundleIdAndKind];
  v159 = (void *)v25;
  if (!v25)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v108 = (void *)v25;
  v164[17] = v25;
  v163[18] = @"WidgetSize";
  uint64_t v26 = [(ATXFocusModeSignalsMetric *)self widgetSize];
  v158 = (void *)v26;
  if (!v26)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v107 = (void *)v26;
  v164[18] = v26;
  v163[19] = @"IntentHash";
  uint64_t v27 = [(ATXFocusModeSignalsMetric *)self intentHash];
  v157 = (void *)v27;
  if (!v27)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v106 = (void *)v27;
  v164[19] = v27;
  v163[20] = @"ABGroup";
  uint64_t v28 = [(ATXFocusModeSignalsMetric *)self abGroup];
  v156 = (void *)v28;
  if (!v28)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v105 = (void *)v28;
  v164[20] = v28;
  v163[21] = @"GlobalClearanceRateForEntity";
  uint64_t v29 = [(ATXFocusModeSignalsMetric *)self globalClearanceRateForEntity];
  v155 = (void *)v29;
  if (!v29)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v104 = (void *)v29;
  v164[21] = v29;
  v163[22] = @"LocalClearanceRateForEntity";
  uint64_t v30 = [(ATXFocusModeSignalsMetric *)self localClearanceRateForEntity];
  v154 = (void *)v30;
  if (!v30)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v103 = (void *)v30;
  v164[22] = v30;
  v163[23] = @"NotificationsClearedInMode";
  uint64_t v31 = [(ATXFocusModeSignalsMetric *)self notificationsClearedInMode];
  v153 = (void *)v31;
  if (!v31)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v102 = (void *)v31;
  v164[23] = v31;
  v163[24] = @"NotificationsClearedGlobally";
  uint64_t v32 = [(ATXFocusModeSignalsMetric *)self notificationsClearedGlobally];
  v152 = (void *)v32;
  if (!v32)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v101 = (void *)v32;
  v164[24] = v32;
  v163[25] = @"NotificationsMuted";
  uint64_t v33 = [(ATXFocusModeSignalsMetric *)self notificationsMuted];
  v151 = (void *)v33;
  if (!v33)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v100 = (void *)v33;
  v164[25] = v33;
  v163[26] = @"RatioOfLocalToGlobalNotificationsClearedRateForEntity";
  uint64_t v34 = [(ATXFocusModeSignalsMetric *)self ratioOfLocalToGlobalNotificationsClearedRateForEntity];
  v150 = (void *)v34;
  if (!v34)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v99 = (void *)v34;
  v164[26] = v34;
  v163[27] = @"ClassConditionalOfNotificationsClearedForEntity";
  uint64_t v35 = [(ATXFocusModeSignalsMetric *)self classConditionalOfNotificationsClearedForEntity];
  v149 = (void *)v35;
  if (!v35)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v98 = (void *)v35;
  v164[27] = v35;
  v163[28] = @"NotificationsReceivedGlobally";
  uint64_t v36 = [(ATXFocusModeSignalsMetric *)self notificationsReceivedGlobally];
  v148 = (void *)v36;
  if (!v36)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v97 = (void *)v36;
  v164[28] = v36;
  v163[29] = @"NotificationsReceivedInMode";
  uint64_t v37 = [(ATXFocusModeSignalsMetric *)self notificationsReceivedInMode];
  v147 = (void *)v37;
  if (!v37)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v96 = (void *)v37;
  v164[29] = v37;
  v163[30] = @"LocalPopularityOfNotificationsReceivedForEntity";
  uint64_t v38 = [(ATXFocusModeSignalsMetric *)self localPopularityOfNotificationsReceivedForEntity];
  v146 = (void *)v38;
  if (!v38)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v95 = (void *)v38;
  v164[30] = v38;
  v163[31] = @"GlobalPopularityOfNotificationsReceivedForEntity";
  uint64_t v39 = [(ATXFocusModeSignalsMetric *)self globalPopularityOfNotificationsReceivedForEntity];
  v145 = (void *)v39;
  if (!v39)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v94 = (void *)v39;
  v164[31] = v39;
  v163[32] = @"RatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity";
  uint64_t v40 = [(ATXFocusModeSignalsMetric *)self ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity];
  v144 = (void *)v40;
  if (!v40)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v93 = (void *)v40;
  v164[32] = v40;
  v163[33] = @"ClassConditionalOfNotificationsReceivedForEntity";
  uint64_t v41 = [(ATXFocusModeSignalsMetric *)self classConditionalOfNotificationsReceivedForEntity];
  v143 = (void *)v41;
  if (!v41)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v92 = (void *)v41;
  v164[33] = v41;
  v163[34] = @"IsAppCandidateSuggestion";
  v125 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeSignalsMetric isAppCandidateSuggestion](self, "isAppCandidateSuggestion"));
  v164[34] = v125;
  v163[35] = @"IsAppRecommendedSuggestion";
  v124 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeSignalsMetric isAppRecommendedSuggestion](self, "isAppRecommendedSuggestion"));
  v164[35] = v124;
  v163[36] = @"TreatmentId";
  uint64_t v42 = [(ATXFocusModeSignalsMetric *)self treatmentId];
  v142 = (void *)v42;
  if (!v42)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v91 = (void *)v42;
  v164[36] = v42;
  v163[37] = @"ExperimentId";
  uint64_t v43 = [(ATXFocusModeSignalsMetric *)self experimentId];
  v141 = (void *)v43;
  if (!v43)
  {
    uint64_t v43 = [MEMORY[0x1E4F1CA98] null];
  }
  v90 = (void *)v43;
  v164[37] = v43;
  v163[38] = @"DeploymentId";
  uint64_t v44 = [(ATXFocusModeSignalsMetric *)self deploymentId];
  v140 = (void *)v44;
  if (!v44)
  {
    uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
  }
  v128 = v21;
  v89 = (void *)v44;
  v164[38] = v44;
  v163[39] = @"GlobalModeAffinityPrior";
  uint64_t v45 = [(ATXFocusModeSignalsMetric *)self globalModeAffinityPrior];
  v123 = (void *)v45;
  if (!v45)
  {
    uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v134 = v10;
  v88 = (void *)v45;
  v164[39] = v45;
  v163[40] = @"GlobalInterruptingPrior";
  uint64_t v46 = [(ATXFocusModeSignalsMetric *)self globalInterruptingPrior];
  v47 = (void *)v46;
  if (!v46)
  {
    uint64_t v46 = [MEMORY[0x1E4F1CA98] null];
  }
  v137 = v8;
  v87 = (void *)v46;
  v164[40] = v46;
  v163[41] = @"ModeAppInterruptionsCountByEntity";
  uint64_t v48 = [(ATXFocusModeSignalsMetric *)self modeAppInterruptionsCountByEntity];
  v49 = (void *)v48;
  if (!v48)
  {
    uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
  }
  v86 = (void *)v48;
  v164[41] = v48;
  v163[42] = @"ModeAppInterruptionsClassConditionalProbabilityByEntity";
  uint64_t v50 = [(ATXFocusModeSignalsMetric *)self modeAppInterruptionsClassConditionalProbabilityByEntity];
  v51 = (void *)v50;
  if (!v50)
  {
    uint64_t v50 = [MEMORY[0x1E4F1CA98] null];
  }
  v130 = v18;
  v133 = v12;
  v85 = (void *)v50;
  v164[42] = v50;
  v163[43] = @"GlobalAppInterruptionsCountByEntity";
  uint64_t v52 = [(ATXFocusModeSignalsMetric *)self globalAppInterruptionsCountByEntity];
  v53 = (void *)v52;
  if (!v52)
  {
    uint64_t v52 = [MEMORY[0x1E4F1CA98] null];
  }
  v131 = v16;
  v132 = v14;
  v84 = (void *)v52;
  v164[43] = v52;
  v163[44] = @"GlobalPopularityOfInterruptingEntity";
  v54 = [(ATXFocusModeSignalsMetric *)self globalPopularityOfInterruptingEntity];
  v55 = v54;
  if (!v54)
  {
    v55 = [MEMORY[0x1E4F1CA98] null];
  }
  v164[44] = v55;
  v163[45] = @"ModePopularityOfInterruptingEntity";
  v56 = [(ATXFocusModeSignalsMetric *)self modePopularityOfInterruptingEntity];
  v57 = v56;
  if (!v56)
  {
    v57 = [MEMORY[0x1E4F1CA98] null];
  }
  v164[45] = v57;
  v163[46] = @"RatioOfModePopularityToGlobalPopularityOfInterruptingEntity";
  v58 = [(ATXFocusModeSignalsMetric *)self ratioOfModePopularityToGlobalPopularityOfInterruptingEntity];
  v59 = v58;
  if (!v58)
  {
    v59 = [MEMORY[0x1E4F1CA98] null];
  }
  v164[46] = v59;
  id v122 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v164 forKeys:v163 count:47];
  if (!v58) {

  }
  if (!v56) {
  if (!v54)
  }

  if (!v53) {
  if (!v51)
  }

  if (!v49) {
  if (!v47)
  }

  if (!v123) {
  v60 = v140;
  }
  if (!v140)
  {

    v60 = 0;
  }

  v61 = v141;
  if (!v141)
  {

    v61 = 0;
  }

  v62 = v142;
  if (!v142)
  {

    v62 = 0;
  }

  v63 = v143;
  if (!v143)
  {

    v63 = 0;
  }

  v64 = v144;
  if (!v144)
  {

    v64 = 0;
  }

  v65 = v145;
  if (!v145)
  {

    v65 = 0;
  }

  v66 = v146;
  if (!v146)
  {

    v66 = 0;
  }

  v67 = v147;
  if (!v147)
  {

    v67 = 0;
  }

  v68 = v148;
  if (!v148)
  {

    v68 = 0;
  }

  v69 = v149;
  if (!v149)
  {

    v69 = 0;
  }

  v70 = v150;
  if (!v150)
  {

    v70 = 0;
  }

  v71 = v151;
  if (!v151)
  {

    v71 = 0;
  }

  v72 = v152;
  if (!v152)
  {

    v72 = 0;
  }

  v73 = v153;
  if (!v153)
  {

    v73 = 0;
  }

  v74 = v154;
  if (!v154)
  {

    v74 = 0;
  }

  v75 = v155;
  if (!v155)
  {

    v75 = 0;
  }

  v76 = v156;
  if (!v156)
  {

    v76 = 0;
  }

  v77 = v157;
  if (!v157)
  {

    v77 = 0;
  }

  v78 = v158;
  if (!v158)
  {

    v78 = 0;
  }

  v79 = v159;
  if (!v159)
  {

    v79 = 0;
  }

  v80 = v160;
  if (!v160)
  {

    v80 = 0;
  }

  v81 = v161;
  if (!v161)
  {

    v81 = 0;
  }

  v82 = v162;
  if (!v162)
  {

    v82 = 0;
  }

  if (!v128) {
  if (!v129)
  }

  if (!v130) {
  if (!v131)
  }

  if (!v132) {
  if (!v133)
  }

  if (!v134) {
  if (!v137)
  }

  if (!v138) {
  if (!v139)
  }

  return v122;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (unint64_t)focusMode
{
  return self->_focusMode;
}

- (void)setFocusMode:(unint64_t)a3
{
  self->_focusMode = a3;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)activeConfigurationType
{
  return self->_activeConfigurationType;
}

- (void)setActiveConfigurationType:(id)a3
{
}

- (BOOL)wasAppSuggestedDuringModeSetup
{
  return self->_wasAppSuggestedDuringModeSetup;
}

- (void)setWasAppSuggestedDuringModeSetup:(BOOL)a3
{
  self->_wasAppSuggestedDuringModeSetup = a3;
}

- (BOOL)wasAppSuggestionDuringModeSetupAccepted
{
  return self->_wasAppSuggestionDuringModeSetupAccepted;
}

- (void)setWasAppSuggestionDuringModeSetupAccepted:(BOOL)a3
{
  self->_wasAppSuggestionDuringModeSetupAccepted = a3;
}

- (NSString)widgetBundleIdAndKind
{
  return self->_widgetBundleIdAndKind;
}

- (void)setWidgetBundleIdAndKind:(id)a3
{
}

- (NSString)widgetSize
{
  return self->_widgetSize;
}

- (void)setWidgetSize:(id)a3
{
}

- (NSString)intentHash
{
  return self->_intentHash;
}

- (void)setIntentHash:(id)a3
{
}

- (NSNumber)classConditionalProbabilityOfModeGivenEntity
{
  return self->_classConditionalProbabilityOfModeGivenEntity;
}

- (void)setClassConditionalProbabilityOfModeGivenEntity:(id)a3
{
}

- (NSNumber)entityModeEntityScore
{
  return self->_entityModeEntityScore;
}

- (void)setEntityModeEntityScore:(id)a3
{
}

- (NSNumber)globalPopularityForEntity
{
  return self->_globalPopularityForEntity;
}

- (void)setGlobalPopularityForEntity:(id)a3
{
}

- (NSNumber)modePopularityForEntity
{
  return self->_modePopularityForEntity;
}

- (void)setModePopularityForEntity:(id)a3
{
}

- (NSNumber)ratioOfModePopularityToGlobalPopularityOfEntity
{
  return self->_ratioOfModePopularityToGlobalPopularityOfEntity;
}

- (void)setRatioOfModePopularityToGlobalPopularityOfEntity:(id)a3
{
}

- (NSNumber)posteriorProbabilityOfEntityGivenMode
{
  return self->_posteriorProbabilityOfEntityGivenMode;
}

- (void)setPosteriorProbabilityOfEntityGivenMode:(id)a3
{
}

- (NSNumber)categoryScore
{
  return self->_categoryScore;
}

- (void)setCategoryScore:(id)a3
{
}

- (NSNumber)globalOccurrencesOfEntity
{
  return self->_globalOccurrencesOfEntity;
}

- (void)setGlobalOccurrencesOfEntity:(id)a3
{
}

- (NSNumber)localOccurrencesOfEntityInMode
{
  return self->_localOccurrencesOfEntityInMode;
}

- (void)setLocalOccurrencesOfEntityInMode:(id)a3
{
}

- (NSNumber)uniqueOccurrencesOfEntityInMode
{
  return self->_uniqueOccurrencesOfEntityInMode;
}

- (void)setUniqueOccurrencesOfEntityInMode:(id)a3
{
}

- (BOOL)entityOccurredGloballyOverLastNDays
{
  return self->_entityOccurredGloballyOverLastNDays;
}

- (void)setEntityOccurredGloballyOverLastNDays:(BOOL)a3
{
  self->_entityOccurredGloballyOverLastNDays = a3;
}

- (BOOL)entityOccurredInModeOverLastNDays
{
  return self->_entityOccurredInModeOverLastNDays;
}

- (void)setEntityOccurredInModeOverLastNDays:(BOOL)a3
{
  self->_entityOccurredInModeOverLastNDays = a3;
}

- (NSNumber)notificationsMuted
{
  return self->_notificationsMuted;
}

- (void)setNotificationsMuted:(id)a3
{
}

- (NSNumber)notificationsClearedInMode
{
  return self->_notificationsClearedInMode;
}

- (void)setNotificationsClearedInMode:(id)a3
{
}

- (NSNumber)notificationsClearedGlobally
{
  return self->_notificationsClearedGlobally;
}

- (void)setNotificationsClearedGlobally:(id)a3
{
}

- (NSNumber)localClearanceRateForEntity
{
  return self->_localClearanceRateForEntity;
}

- (void)setLocalClearanceRateForEntity:(id)a3
{
}

- (NSNumber)globalClearanceRateForEntity
{
  return self->_globalClearanceRateForEntity;
}

- (void)setGlobalClearanceRateForEntity:(id)a3
{
}

- (NSNumber)ratioOfLocalToGlobalNotificationsClearedRateForEntity
{
  return self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity;
}

- (void)setRatioOfLocalToGlobalNotificationsClearedRateForEntity:(id)a3
{
}

- (NSNumber)classConditionalOfNotificationsClearedForEntity
{
  return self->_classConditionalOfNotificationsClearedForEntity;
}

- (void)setClassConditionalOfNotificationsClearedForEntity:(id)a3
{
}

- (NSNumber)notificationsReceivedGlobally
{
  return self->_notificationsReceivedGlobally;
}

- (void)setNotificationsReceivedGlobally:(id)a3
{
}

- (NSNumber)notificationsReceivedInMode
{
  return self->_notificationsReceivedInMode;
}

- (void)setNotificationsReceivedInMode:(id)a3
{
}

- (NSNumber)localPopularityOfNotificationsReceivedForEntity
{
  return self->_localPopularityOfNotificationsReceivedForEntity;
}

- (void)setLocalPopularityOfNotificationsReceivedForEntity:(id)a3
{
}

- (NSNumber)globalPopularityOfNotificationsReceivedForEntity
{
  return self->_globalPopularityOfNotificationsReceivedForEntity;
}

- (void)setGlobalPopularityOfNotificationsReceivedForEntity:(id)a3
{
}

- (NSNumber)ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity
{
  return self->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
}

- (void)setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:(id)a3
{
}

- (NSNumber)classConditionalOfNotificationsReceivedForEntity
{
  return self->_classConditionalOfNotificationsReceivedForEntity;
}

- (void)setClassConditionalOfNotificationsReceivedForEntity:(id)a3
{
}

- (BOOL)isAppCandidateSuggestion
{
  return self->_isAppCandidateSuggestion;
}

- (void)setIsAppCandidateSuggestion:(BOOL)a3
{
  self->_isAppCandidateSuggestion = a3;
}

- (BOOL)isAppRecommendedSuggestion
{
  return self->_isAppRecommendedSuggestion;
}

- (void)setIsAppRecommendedSuggestion:(BOOL)a3
{
  self->_isAppRecommendedSuggestion = a3;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSNumber)deploymentId
{
  return self->_deploymentId;
}

- (void)setDeploymentId:(id)a3
{
}

- (NSNumber)globalModeAffinityPrior
{
  return self->_globalModeAffinityPrior;
}

- (void)setGlobalModeAffinityPrior:(id)a3
{
}

- (NSNumber)globalInterruptingPrior
{
  return self->_globalInterruptingPrior;
}

- (void)setGlobalInterruptingPrior:(id)a3
{
}

- (NSNumber)modeAppInterruptionsCountByEntity
{
  return self->_modeAppInterruptionsCountByEntity;
}

- (void)setModeAppInterruptionsCountByEntity:(id)a3
{
}

- (NSNumber)modeAppInterruptionsClassConditionalProbabilityByEntity
{
  return self->_modeAppInterruptionsClassConditionalProbabilityByEntity;
}

- (void)setModeAppInterruptionsClassConditionalProbabilityByEntity:(id)a3
{
}

- (NSNumber)globalAppInterruptionsCountByEntity
{
  return self->_globalAppInterruptionsCountByEntity;
}

- (void)setGlobalAppInterruptionsCountByEntity:(id)a3
{
}

- (NSNumber)globalPopularityOfInterruptingEntity
{
  return self->_globalPopularityOfInterruptingEntity;
}

- (void)setGlobalPopularityOfInterruptingEntity:(id)a3
{
}

- (NSNumber)modePopularityOfInterruptingEntity
{
  return self->_modePopularityOfInterruptingEntity;
}

- (void)setModePopularityOfInterruptingEntity:(id)a3
{
}

- (NSNumber)ratioOfModePopularityToGlobalPopularityOfInterruptingEntity
{
  return self->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity;
}

- (void)setRatioOfModePopularityToGlobalPopularityOfInterruptingEntity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratioOfModePopularityToGlobalPopularityOfInterruptingEntity, 0);
  objc_storeStrong((id *)&self->_modePopularityOfInterruptingEntity, 0);
  objc_storeStrong((id *)&self->_globalPopularityOfInterruptingEntity, 0);
  objc_storeStrong((id *)&self->_globalAppInterruptionsCountByEntity, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsClassConditionalProbabilityByEntity, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountByEntity, 0);
  objc_storeStrong((id *)&self->_globalInterruptingPrior, 0);
  objc_storeStrong((id *)&self->_globalModeAffinityPrior, 0);
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_classConditionalOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_globalPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_localPopularityOfNotificationsReceivedForEntity, 0);
  objc_storeStrong((id *)&self->_notificationsReceivedInMode, 0);
  objc_storeStrong((id *)&self->_notificationsReceivedGlobally, 0);
  objc_storeStrong((id *)&self->_classConditionalOfNotificationsClearedForEntity, 0);
  objc_storeStrong((id *)&self->_ratioOfLocalToGlobalNotificationsClearedRateForEntity, 0);
  objc_storeStrong((id *)&self->_globalClearanceRateForEntity, 0);
  objc_storeStrong((id *)&self->_localClearanceRateForEntity, 0);
  objc_storeStrong((id *)&self->_notificationsClearedGlobally, 0);
  objc_storeStrong((id *)&self->_notificationsClearedInMode, 0);
  objc_storeStrong((id *)&self->_notificationsMuted, 0);
  objc_storeStrong((id *)&self->_uniqueOccurrencesOfEntityInMode, 0);
  objc_storeStrong((id *)&self->_localOccurrencesOfEntityInMode, 0);
  objc_storeStrong((id *)&self->_globalOccurrencesOfEntity, 0);
  objc_storeStrong((id *)&self->_categoryScore, 0);
  objc_storeStrong((id *)&self->_posteriorProbabilityOfEntityGivenMode, 0);
  objc_storeStrong((id *)&self->_ratioOfModePopularityToGlobalPopularityOfEntity, 0);
  objc_storeStrong((id *)&self->_modePopularityForEntity, 0);
  objc_storeStrong((id *)&self->_globalPopularityForEntity, 0);
  objc_storeStrong((id *)&self->_entityModeEntityScore, 0);
  objc_storeStrong((id *)&self->_classConditionalProbabilityOfModeGivenEntity, 0);
  objc_storeStrong((id *)&self->_intentHash, 0);
  objc_storeStrong((id *)&self->_widgetSize, 0);
  objc_storeStrong((id *)&self->_widgetBundleIdAndKind, 0);
  objc_storeStrong((id *)&self->_activeConfigurationType, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end