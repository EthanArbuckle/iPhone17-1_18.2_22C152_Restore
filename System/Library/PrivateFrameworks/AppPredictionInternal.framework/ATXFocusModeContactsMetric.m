@interface ATXFocusModeContactsMetric
- (BOOL)contactEngagedGloballyOverLastNDays;
- (BOOL)contactEngagedInModeOverLastNDays;
- (BOOL)contactIsEmergency;
- (BOOL)contactIsFavorite;
- (BOOL)contactIsPinned;
- (BOOL)contactIsVIP;
- (BOOL)contactIsiCloudFamilyMember;
- (BOOL)contactMessageHideAlerts;
- (BOOL)isContactCandidateSuggestion;
- (BOOL)isContactRecommendedSuggestion;
- (BOOL)wasContactSuggestedDuringModeSetup;
- (BOOL)wasContactSuggestionDuringModeSetupAccepted;
- (NSNumber)classConditionalOfNotificationsClearedForEntity;
- (NSNumber)classConditionalOfNotificationsReceivedForEntity;
- (NSNumber)classConditionalProbability;
- (NSNumber)contactMuted;
- (NSNumber)deploymentId;
- (NSNumber)entityModeEntityScore;
- (NSNumber)globalNotificationsClearedRateForEntity;
- (NSNumber)globalPopularity;
- (NSNumber)globalPopularityOfNotificationsReceivedForEntity;
- (NSNumber)localNotificationsClearedRateForEntity;
- (NSNumber)localPopularityOfNotificationsReceivedForEntity;
- (NSNumber)modePopularity;
- (NSNumber)notificationsClearedGlobally;
- (NSNumber)notificationsClearedInMode;
- (NSNumber)notificationsReceivedGlobally;
- (NSNumber)notificationsReceivedInMode;
- (NSNumber)posteriorProbability;
- (NSNumber)ratioOfLocalToGlobalNotificationsClearedRateForEntity;
- (NSNumber)ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity;
- (NSNumber)ratioOfModePopularityToGlobalPopularityOfEntity;
- (NSString)activeConfigurationType;
- (NSString)experimentId;
- (NSString)treatmentId;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)focusMode;
- (void)setActiveConfigurationType:(id)a3;
- (void)setClassConditionalOfNotificationsClearedForEntity:(id)a3;
- (void)setClassConditionalOfNotificationsReceivedForEntity:(id)a3;
- (void)setClassConditionalProbability:(id)a3;
- (void)setContactEngagedGloballyOverLastNDays:(BOOL)a3;
- (void)setContactEngagedInModeOverLastNDays:(BOOL)a3;
- (void)setContactIsEmergency:(BOOL)a3;
- (void)setContactIsFavorite:(BOOL)a3;
- (void)setContactIsPinned:(BOOL)a3;
- (void)setContactIsVIP:(BOOL)a3;
- (void)setContactIsiCloudFamilyMember:(BOOL)a3;
- (void)setContactMessageHideAlerts:(BOOL)a3;
- (void)setContactMuted:(id)a3;
- (void)setDeploymentId:(id)a3;
- (void)setEntityModeEntityScore:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setFocusMode:(unint64_t)a3;
- (void)setGlobalNotificationsClearedRateForEntity:(id)a3;
- (void)setGlobalPopularity:(id)a3;
- (void)setGlobalPopularityOfNotificationsReceivedForEntity:(id)a3;
- (void)setIsContactCandidateSuggestion:(BOOL)a3;
- (void)setIsContactRecommendedSuggestion:(BOOL)a3;
- (void)setLocalNotificationsClearedRateForEntity:(id)a3;
- (void)setLocalPopularityOfNotificationsReceivedForEntity:(id)a3;
- (void)setModePopularity:(id)a3;
- (void)setNotificationsClearedGlobally:(id)a3;
- (void)setNotificationsClearedInMode:(id)a3;
- (void)setNotificationsReceivedGlobally:(id)a3;
- (void)setNotificationsReceivedInMode:(id)a3;
- (void)setPosteriorProbability:(id)a3;
- (void)setRatioOfLocalToGlobalNotificationsClearedRateForEntity:(id)a3;
- (void)setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:(id)a3;
- (void)setRatioOfModePopularityToGlobalPopularityOfEntity:(id)a3;
- (void)setTreatmentId:(id)a3;
- (void)setWasContactSuggestedDuringModeSetup:(BOOL)a3;
- (void)setWasContactSuggestionDuringModeSetupAccepted:(BOOL)a3;
@end

@implementation ATXFocusModeContactsMetric

- (id)metricName
{
  return @"com.apple.FocusModeContact";
}

- (id)coreAnalyticsDictionary
{
  v106[36] = *MEMORY[0x1E4F143B8];
  v105[0] = @"FocusMode";
  [(ATXFocusModeContactsMetric *)self focusMode];
  uint64_t v3 = ATXModeToString();
  v94 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v74 = (void *)v3;
  v106[0] = v3;
  v105[1] = @"ActiveConfigurationType";
  uint64_t v4 = [(ATXFocusModeContactsMetric *)self activeConfigurationType];
  v5 = (void *)v4;
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v73 = (void *)v4;
  v106[1] = v4;
  v105[2] = @"EntityModeEntityScore";
  uint64_t v6 = [(ATXFocusModeContactsMetric *)self entityModeEntityScore];
  v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v72 = (void *)v6;
  v106[2] = v6;
  v105[3] = @"ClassConditionalProbability";
  uint64_t v8 = [(ATXFocusModeContactsMetric *)self classConditionalProbability];
  v9 = (void *)v8;
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v71 = (void *)v8;
  v106[3] = v8;
  v105[4] = @"ContactMuted";
  uint64_t v10 = [(ATXFocusModeContactsMetric *)self contactMuted];
  v11 = (void *)v10;
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v70 = (void *)v10;
  v106[4] = v10;
  v105[5] = @"GlobalPopularity";
  uint64_t v12 = [(ATXFocusModeContactsMetric *)self globalPopularity];
  v13 = (void *)v12;
  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v69 = (void *)v12;
  v106[5] = v12;
  v105[6] = @"ModePopularity";
  uint64_t v14 = [(ATXFocusModeContactsMetric *)self modePopularity];
  v15 = (void *)v14;
  if (!v14)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v68 = (void *)v14;
  v106[6] = v14;
  v105[7] = @"RatioOfModePopularityToGlobalPopularityOfEntity";
  uint64_t v16 = [(ATXFocusModeContactsMetric *)self ratioOfModePopularityToGlobalPopularityOfEntity];
  v17 = (void *)v16;
  if (!v16)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v67 = (void *)v16;
  v106[7] = v16;
  v105[8] = @"LocalNotificationsClearanceRateForEntity";
  uint64_t v18 = [(ATXFocusModeContactsMetric *)self localNotificationsClearedRateForEntity];
  v19 = (void *)v18;
  if (!v18)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v66 = (void *)v18;
  v106[8] = v18;
  v105[9] = @"GlobalNotificationsClearanceRateForEntity";
  uint64_t v20 = [(ATXFocusModeContactsMetric *)self globalNotificationsClearedRateForEntity];
  v21 = (void *)v20;
  if (!v20)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v65 = (void *)v20;
  v106[9] = v20;
  v105[10] = @"NotificationsClearedInMode";
  uint64_t v22 = [(ATXFocusModeContactsMetric *)self notificationsClearedInMode];
  v104 = (void *)v22;
  if (!v22)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v64 = (void *)v22;
  v106[10] = v22;
  v105[11] = @"NotificationsClearedGlobally";
  uint64_t v23 = [(ATXFocusModeContactsMetric *)self notificationsClearedGlobally];
  v103 = (void *)v23;
  if (!v23)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v63 = (void *)v23;
  v106[11] = v23;
  v105[12] = @"PosteriorProbability";
  uint64_t v24 = [(ATXFocusModeContactsMetric *)self posteriorProbability];
  v102 = (void *)v24;
  if (!v24)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v62 = (void *)v24;
  v106[12] = v24;
  v105[13] = @"RatioOfLocalToGlobalNotificationsClearedRateForEntity";
  uint64_t v25 = [(ATXFocusModeContactsMetric *)self ratioOfLocalToGlobalNotificationsClearedRateForEntity];
  v101 = (void *)v25;
  if (!v25)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v61 = (void *)v25;
  v106[13] = v25;
  v105[14] = @"ClassConditionalOfNotificationsClearedForEntity";
  uint64_t v26 = [(ATXFocusModeContactsMetric *)self classConditionalOfNotificationsClearedForEntity];
  v100 = (void *)v26;
  if (!v26)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v60 = (void *)v26;
  v106[14] = v26;
  v105[15] = @"NotificationsReceivedGlobally";
  uint64_t v27 = [(ATXFocusModeContactsMetric *)self notificationsReceivedGlobally];
  v99 = (void *)v27;
  if (!v27)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v59 = (void *)v27;
  v106[15] = v27;
  v105[16] = @"NotificationsReceivedInMode";
  uint64_t v28 = [(ATXFocusModeContactsMetric *)self notificationsReceivedInMode];
  v98 = (void *)v28;
  if (!v28)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v58 = (void *)v28;
  v106[16] = v28;
  v105[17] = @"LocalPopularityOfNotificationsReceivedForEntity";
  uint64_t v29 = [(ATXFocusModeContactsMetric *)self localPopularityOfNotificationsReceivedForEntity];
  v97 = (void *)v29;
  if (!v29)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v57 = (void *)v29;
  v106[17] = v29;
  v105[18] = @"GlobalPopularityOfNotificationsReceivedForEntity";
  uint64_t v30 = [(ATXFocusModeContactsMetric *)self globalPopularityOfNotificationsReceivedForEntity];
  v96 = (void *)v30;
  if (!v30)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v56 = (void *)v30;
  v106[18] = v30;
  v105[19] = @"RatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity";
  uint64_t v31 = [(ATXFocusModeContactsMetric *)self ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity];
  v95 = (void *)v31;
  if (!v31)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v86 = v19;
  v87 = v17;
  v88 = v15;
  v89 = v13;
  v91 = v9;
  v92 = v7;
  v93 = v5;
  v55 = (void *)v31;
  v106[19] = v31;
  v105[20] = @"ClassConditionalOfNotificationsReceivedForEntity";
  uint64_t v32 = [(ATXFocusModeContactsMetric *)self classConditionalOfNotificationsReceivedForEntity];
  v84 = (void *)v32;
  if (!v32)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v85 = v21;
  v90 = v11;
  v54 = (void *)v32;
  v106[20] = v32;
  v105[21] = @"ContactEngagedGloballyOverLastNDays";
  v83 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeContactsMetric contactEngagedGloballyOverLastNDays](self, "contactEngagedGloballyOverLastNDays"));
  v106[21] = v83;
  v105[22] = @"ContactEngagedInModeOverLastNDays";
  v82 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeContactsMetric contactEngagedInModeOverLastNDays](self, "contactEngagedInModeOverLastNDays"));
  v106[22] = v82;
  v105[23] = @"ContactIsEmergency";
  v81 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeContactsMetric contactIsEmergency](self, "contactIsEmergency"));
  v106[23] = v81;
  v105[24] = @"ContactIsFavorite";
  v80 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeContactsMetric contactIsFavorite](self, "contactIsFavorite"));
  v106[24] = v80;
  v105[25] = @"ContactIsiCloudFamilyMember";
  v79 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeContactsMetric contactIsiCloudFamilyMember](self, "contactIsiCloudFamilyMember"));
  v106[25] = v79;
  v105[26] = @"ContactIsPinned";
  v78 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeContactsMetric contactIsPinned](self, "contactIsPinned"));
  v106[26] = v78;
  v105[27] = @"ContactIsVIP";
  v77 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeContactsMetric contactIsVIP](self, "contactIsVIP"));
  v106[27] = v77;
  v105[28] = @"ContactMessageHideAlerts";
  v76 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeContactsMetric contactMessageHideAlerts](self, "contactMessageHideAlerts"));
  v106[28] = v76;
  v105[29] = @"IsContactCandidateSuggestion";
  v33 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeContactsMetric isContactCandidateSuggestion](self, "isContactCandidateSuggestion"));
  v106[29] = v33;
  v105[30] = @"IsContactRecommendedSuggestion";
  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeContactsMetric isContactRecommendedSuggestion](self, "isContactRecommendedSuggestion"));
  v106[30] = v34;
  v105[31] = @"wasContactSuggestedDuringModeSetup";
  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeContactsMetric wasContactSuggestedDuringModeSetup](self, "wasContactSuggestedDuringModeSetup"));
  v106[31] = v35;
  v105[32] = @"wasContactSuggestionDuringModeSetupAccepted";
  v36 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXFocusModeContactsMetric wasContactSuggestionDuringModeSetupAccepted](self, "wasContactSuggestionDuringModeSetupAccepted"));
  v106[32] = v36;
  v105[33] = @"TreatmentId";
  v37 = [(ATXFocusModeContactsMetric *)self treatmentId];
  v38 = v37;
  if (!v37)
  {
    v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v106[33] = v38;
  v105[34] = @"ExperimentId";
  v39 = [(ATXFocusModeContactsMetric *)self experimentId];
  v40 = v39;
  if (!v39)
  {
    v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v106[34] = v40;
  v105[35] = @"DeploymentId";
  v41 = [(ATXFocusModeContactsMetric *)self deploymentId];
  v42 = v41;
  if (!v41)
  {
    v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v106[35] = v42;
  id v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:36];
  if (!v41) {

  }
  if (!v39) {
  if (!v37)
  }

  if (!v84) {
  v43 = v95;
  }
  if (!v95)
  {

    v43 = 0;
  }

  v44 = v96;
  if (!v96)
  {

    v44 = 0;
  }

  v45 = v97;
  if (!v97)
  {

    v45 = 0;
  }

  v46 = v98;
  if (!v98)
  {

    v46 = 0;
  }

  v47 = v99;
  if (!v99)
  {

    v47 = 0;
  }

  v48 = v100;
  if (!v100)
  {

    v48 = 0;
  }

  v49 = v101;
  if (!v101)
  {

    v49 = 0;
  }

  v50 = v102;
  if (!v102)
  {

    v50 = 0;
  }

  v51 = v103;
  if (!v103)
  {

    v51 = 0;
  }

  v52 = v104;
  if (!v104)
  {

    v52 = 0;
  }

  if (!v85) {
  if (!v86)
  }

  if (!v87) {
  if (!v88)
  }

  if (!v89) {
  if (!v90)
  }

  if (!v91) {
  if (!v92)
  }

  if (!v93) {
  if (!v94)
  }

  return v75;
}

- (unint64_t)focusMode
{
  return self->_focusMode;
}

- (void)setFocusMode:(unint64_t)a3
{
  self->_focusMode = a3;
}

- (NSString)activeConfigurationType
{
  return self->_activeConfigurationType;
}

- (void)setActiveConfigurationType:(id)a3
{
}

- (NSNumber)entityModeEntityScore
{
  return self->_entityModeEntityScore;
}

- (void)setEntityModeEntityScore:(id)a3
{
}

- (NSNumber)classConditionalProbability
{
  return self->_classConditionalProbability;
}

- (void)setClassConditionalProbability:(id)a3
{
}

- (NSNumber)contactMuted
{
  return self->_contactMuted;
}

- (void)setContactMuted:(id)a3
{
}

- (NSNumber)globalPopularity
{
  return self->_globalPopularity;
}

- (void)setGlobalPopularity:(id)a3
{
}

- (NSNumber)modePopularity
{
  return self->_modePopularity;
}

- (void)setModePopularity:(id)a3
{
}

- (NSNumber)ratioOfModePopularityToGlobalPopularityOfEntity
{
  return self->_ratioOfModePopularityToGlobalPopularityOfEntity;
}

- (void)setRatioOfModePopularityToGlobalPopularityOfEntity:(id)a3
{
}

- (NSNumber)localNotificationsClearedRateForEntity
{
  return self->_localNotificationsClearedRateForEntity;
}

- (void)setLocalNotificationsClearedRateForEntity:(id)a3
{
}

- (NSNumber)globalNotificationsClearedRateForEntity
{
  return self->_globalNotificationsClearedRateForEntity;
}

- (void)setGlobalNotificationsClearedRateForEntity:(id)a3
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

- (NSNumber)posteriorProbability
{
  return self->_posteriorProbability;
}

- (void)setPosteriorProbability:(id)a3
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

- (BOOL)contactEngagedGloballyOverLastNDays
{
  return self->_contactEngagedGloballyOverLastNDays;
}

- (void)setContactEngagedGloballyOverLastNDays:(BOOL)a3
{
  self->_contactEngagedGloballyOverLastNDays = a3;
}

- (BOOL)contactEngagedInModeOverLastNDays
{
  return self->_contactEngagedInModeOverLastNDays;
}

- (void)setContactEngagedInModeOverLastNDays:(BOOL)a3
{
  self->_contactEngagedInModeOverLastNDays = a3;
}

- (BOOL)contactIsEmergency
{
  return self->_contactIsEmergency;
}

- (void)setContactIsEmergency:(BOOL)a3
{
  self->_contactIsEmergency = a3;
}

- (BOOL)contactIsFavorite
{
  return self->_contactIsFavorite;
}

- (void)setContactIsFavorite:(BOOL)a3
{
  self->_contactIsFavorite = a3;
}

- (BOOL)contactIsiCloudFamilyMember
{
  return self->_contactIsiCloudFamilyMember;
}

- (void)setContactIsiCloudFamilyMember:(BOOL)a3
{
  self->_contactIsiCloudFamilyMember = a3;
}

- (BOOL)contactIsPinned
{
  return self->_contactIsPinned;
}

- (void)setContactIsPinned:(BOOL)a3
{
  self->_contactIsPinned = a3;
}

- (BOOL)contactIsVIP
{
  return self->_contactIsVIP;
}

- (void)setContactIsVIP:(BOOL)a3
{
  self->_contactIsVIP = a3;
}

- (BOOL)contactMessageHideAlerts
{
  return self->_contactMessageHideAlerts;
}

- (void)setContactMessageHideAlerts:(BOOL)a3
{
  self->_contactMessageHideAlerts = a3;
}

- (BOOL)isContactCandidateSuggestion
{
  return self->_isContactCandidateSuggestion;
}

- (void)setIsContactCandidateSuggestion:(BOOL)a3
{
  self->_isContactCandidateSuggestion = a3;
}

- (BOOL)isContactRecommendedSuggestion
{
  return self->_isContactRecommendedSuggestion;
}

- (void)setIsContactRecommendedSuggestion:(BOOL)a3
{
  self->_isContactRecommendedSuggestion = a3;
}

- (BOOL)wasContactSuggestedDuringModeSetup
{
  return self->_wasContactSuggestedDuringModeSetup;
}

- (void)setWasContactSuggestedDuringModeSetup:(BOOL)a3
{
  self->_wasContactSuggestedDuringModeSetup = a3;
}

- (BOOL)wasContactSuggestionDuringModeSetupAccepted
{
  return self->_wasContactSuggestionDuringModeSetupAccepted;
}

- (void)setWasContactSuggestionDuringModeSetupAccepted:(BOOL)a3
{
  self->_wasContactSuggestionDuringModeSetupAccepted = a3;
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

- (void).cxx_destruct
{
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
  objc_storeStrong((id *)&self->_posteriorProbability, 0);
  objc_storeStrong((id *)&self->_notificationsClearedGlobally, 0);
  objc_storeStrong((id *)&self->_notificationsClearedInMode, 0);
  objc_storeStrong((id *)&self->_globalNotificationsClearedRateForEntity, 0);
  objc_storeStrong((id *)&self->_localNotificationsClearedRateForEntity, 0);
  objc_storeStrong((id *)&self->_ratioOfModePopularityToGlobalPopularityOfEntity, 0);
  objc_storeStrong((id *)&self->_modePopularity, 0);
  objc_storeStrong((id *)&self->_globalPopularity, 0);
  objc_storeStrong((id *)&self->_contactMuted, 0);
  objc_storeStrong((id *)&self->_classConditionalProbability, 0);
  objc_storeStrong((id *)&self->_entityModeEntityScore, 0);
  objc_storeStrong((id *)&self->_activeConfigurationType, 0);
}

@end