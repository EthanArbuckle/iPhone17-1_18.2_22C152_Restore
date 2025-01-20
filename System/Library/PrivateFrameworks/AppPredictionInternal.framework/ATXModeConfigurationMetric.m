@interface ATXModeConfigurationMetric
- (ATXModeConfigurationMetric)init;
- (BOOL)didRemoveSuggestedPage;
- (BOOL)doesImpactAvailability;
- (BOOL)hasAppTrigger;
- (BOOL)hasAreaTrigger;
- (BOOL)hasCustomHomeScreen;
- (BOOL)hasCustomHomeScreenUsedInOtherModes;
- (BOOL)hasDrivingTrigger;
- (BOOL)hasScreenActivityTrigger;
- (BOOL)hasSleepTrigger;
- (BOOL)hasSmartTrigger;
- (BOOL)hasTimeTrigger;
- (BOOL)hasWorkoutTrigger;
- (BOOL)isAutomaticallyGenerated;
- (BOOL)isIntelligentBreakthroughEnabled;
- (BOOL)isSharingAcrossDevices;
- (BOOL)isSleepMigrated;
- (BOOL)wasColoringBookSeen;
- (BOOL)wasQuickStartPlatterShown;
- (NSNumber)deploymentId;
- (NSString)appConfigurationType;
- (NSString)contactConfigurationType;
- (NSString)experimentId;
- (NSString)modeIdentifier;
- (NSString)modeSemanticType;
- (NSString)treatmentId;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)metricName;
- (unint64_t)cappedForPrivacyWithValue:(int64_t)a3;
- (unint64_t)numAcceptedSuggestedApps;
- (unint64_t)numAcceptedSuggestedContacts;
- (unint64_t)numAcceptedSuggestedHomePages;
- (unint64_t)numAcceptedSuggestedLockScreens;
- (unint64_t)numAllowedApps;
- (unint64_t)numAllowedContacts;
- (unint64_t)numAppConfigurations;
- (unint64_t)numCustomHomeScreens;
- (unint64_t)numDeniedApps;
- (unint64_t)numDeniedContacts;
- (unint64_t)numLockScreenPosters;
- (void)setAppConfigurationType:(id)a3;
- (void)setContactConfigurationType:(id)a3;
- (void)setDeploymentId:(id)a3;
- (void)setDidRemoveSuggestedPage:(BOOL)a3;
- (void)setDoesImpactAvailability:(BOOL)a3;
- (void)setExperimentId:(id)a3;
- (void)setHasAppTrigger:(BOOL)a3;
- (void)setHasAreaTrigger:(BOOL)a3;
- (void)setHasCustomHomeScreen:(BOOL)a3;
- (void)setHasCustomHomeScreenUsedInOtherModes:(BOOL)a3;
- (void)setHasDrivingTrigger:(BOOL)a3;
- (void)setHasScreenActivityTrigger:(BOOL)a3;
- (void)setHasSleepTrigger:(BOOL)a3;
- (void)setHasSmartTrigger:(BOOL)a3;
- (void)setHasTimeTrigger:(BOOL)a3;
- (void)setHasWorkoutTrigger:(BOOL)a3;
- (void)setIsAutomaticallyGenerated:(BOOL)a3;
- (void)setIsIntelligentBreakthroughEnabled:(BOOL)a3;
- (void)setIsSharingAcrossDevices:(BOOL)a3;
- (void)setIsSleepMigrated:(BOOL)a3;
- (void)setModeIdentifier:(id)a3;
- (void)setModeSemanticType:(id)a3;
- (void)setNumAcceptedSuggestedApps:(unint64_t)a3;
- (void)setNumAcceptedSuggestedContacts:(unint64_t)a3;
- (void)setNumAcceptedSuggestedHomePages:(unint64_t)a3;
- (void)setNumAcceptedSuggestedLockScreens:(unint64_t)a3;
- (void)setNumAllowedApps:(unint64_t)a3;
- (void)setNumAllowedContacts:(unint64_t)a3;
- (void)setNumAppConfigurations:(unint64_t)a3;
- (void)setNumCustomHomeScreens:(unint64_t)a3;
- (void)setNumDeniedApps:(unint64_t)a3;
- (void)setNumDeniedContacts:(unint64_t)a3;
- (void)setNumLockScreenPosters:(unint64_t)a3;
- (void)setTreatmentId:(id)a3;
- (void)setWasColoringBookSeen:(BOOL)a3;
- (void)setWasQuickStartPlatterShown:(BOOL)a3;
@end

@implementation ATXModeConfigurationMetric

- (ATXModeConfigurationMetric)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXModeConfigurationMetric;
  result = [(_ATXCoreAnalyticsMetric *)&v3 init];
  if (result) {
    result->_numCustomHomeScreens = 0;
  }
  return result;
}

- (id)metricName
{
  return @"com.apple.ModeConfiguration.DailyModeConfiguration";
}

- (id)coreAnalyticsDictionary
{
  v57[36] = *MEMORY[0x1E4F143B8];
  v56[0] = @"modeIdentifier";
  v55 = [(ATXModeConfigurationMetric *)self modeIdentifier];
  if (v55)
  {
    v54 = [(ATXModeConfigurationMetric *)self modeIdentifier];
    uint64_t v3 = +[ATXCoreAnalyticsFieldUtilities hashBoundString:](ATXCoreAnalyticsFieldUtilities, "hashBoundString:");
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
    v54 = (void *)v3;
  }
  v25 = (void *)v3;
  v57[0] = v3;
  v56[1] = @"modeSemanticType";
  uint64_t v4 = [(ATXModeConfigurationMetric *)self modeSemanticType];
  v5 = (void *)v4;
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v4;
  v57[1] = v4;
  v56[2] = @"hasSmartTrigger";
  v52 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric hasSmartTrigger](self, "hasSmartTrigger"));
  v57[2] = v52;
  v56[3] = @"hasAreaTrigger";
  v51 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric hasAreaTrigger](self, "hasAreaTrigger"));
  v57[3] = v51;
  v56[4] = @"hasTimeTrigger";
  v50 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric hasTimeTrigger](self, "hasTimeTrigger"));
  v57[4] = v50;
  v56[5] = @"hasAppTrigger";
  v49 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric hasAppTrigger](self, "hasAppTrigger"));
  v57[5] = v49;
  v56[6] = @"hasScreenActivityTrigger";
  v48 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric hasScreenActivityTrigger](self, "hasScreenActivityTrigger"));
  v57[6] = v48;
  v56[7] = @"hasWorkoutTrigger";
  v47 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric hasWorkoutTrigger](self, "hasWorkoutTrigger"));
  v57[7] = v47;
  v56[8] = @"hasSleepTrigger";
  v46 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric hasSleepTrigger](self, "hasSleepTrigger"));
  v57[8] = v46;
  v56[9] = @"hasDrivingTrigger";
  v45 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric hasDrivingTrigger](self, "hasDrivingTrigger"));
  v57[9] = v45;
  v56[10] = @"numAllowedApps";
  v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numAllowedApps](self, "numAllowedApps")));
  v57[10] = v44;
  v56[11] = @"numAllowedContacts";
  v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numAllowedContacts](self, "numAllowedContacts")));
  v57[11] = v43;
  v56[12] = @"isAutomaticallyGenerated";
  v42 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric isAutomaticallyGenerated](self, "isAutomaticallyGenerated"));
  v57[12] = v42;
  v56[13] = @"doesImpactAvailability";
  v41 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric doesImpactAvailability](self, "doesImpactAvailability"));
  v57[13] = v41;
  v56[14] = @"hasCustomHomeScreen";
  v40 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric hasCustomHomeScreen](self, "hasCustomHomeScreen"));
  v57[14] = v40;
  v56[15] = @"numCustomHomeScreens";
  v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric numCustomHomeScreens](self, "numCustomHomeScreens"));
  v57[15] = v39;
  v56[16] = @"hasCustomHomeScreenUsedInOtherModes";
  v38 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric hasCustomHomeScreenUsedInOtherModes](self, "hasCustomHomeScreenUsedInOtherModes"));
  v57[16] = v38;
  v56[17] = @"numLockScreenPosters";
  v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numLockScreenPosters](self, "numLockScreenPosters")));
  v57[17] = v37;
  v56[18] = @"numDeniedApps";
  v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numDeniedApps](self, "numDeniedApps")));
  v57[18] = v36;
  v56[19] = @"numDeniedContacts";
  v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numDeniedContacts](self, "numDeniedContacts")));
  v57[19] = v35;
  v56[20] = @"appConfigurationType";
  uint64_t v6 = [(ATXModeConfigurationMetric *)self appConfigurationType];
  v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v6;
  v57[20] = v6;
  v56[21] = @"contactConfigurationType";
  uint64_t v8 = [(ATXModeConfigurationMetric *)self contactConfigurationType];
  v33 = (void *)v8;
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = v7;
  v22 = (void *)v8;
  v57[21] = v8;
  v56[22] = @"numAcceptedSuggestedHomePages";
  v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numAcceptedSuggestedHomePages](self, "numAcceptedSuggestedHomePages")));
  v57[22] = v32;
  v56[23] = @"numAcceptedSuggestedLockScreens";
  v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numAcceptedSuggestedLockScreens](self, "numAcceptedSuggestedLockScreens")));
  v57[23] = v31;
  v56[24] = @"numAcceptedSuggestedApps";
  v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numAcceptedSuggestedApps](self, "numAcceptedSuggestedApps")));
  v57[24] = v30;
  v56[25] = @"numAcceptedSuggestedContacts";
  v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numAcceptedSuggestedContacts](self, "numAcceptedSuggestedContacts")));
  v57[25] = v29;
  v56[26] = @"didRemoveSuggestedPage";
  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric didRemoveSuggestedPage](self, "didRemoveSuggestedPage"));
  v57[26] = v28;
  v56[27] = @"numAppConfigurations";
  v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numAppConfigurations](self, "numAppConfigurations")));
  v57[27] = v27;
  v56[28] = @"isSharingAcrossDevices";
  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric isSharingAcrossDevices](self, "isSharingAcrossDevices"));
  v57[28] = v26;
  v56[29] = @"treatmentId";
  uint64_t v9 = [(ATXModeConfigurationMetric *)self treatmentId];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v9;
  v57[29] = v9;
  v56[30] = @"experimentId";
  v11 = [(ATXModeConfigurationMetric *)self experimentId];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v53 = v5;
  v57[30] = v12;
  v56[31] = @"deploymentId";
  v13 = [(ATXModeConfigurationMetric *)self deploymentId];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v57[31] = v14;
  v56[32] = @"isSleepMigrated";
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric isSleepMigrated](self, "isSleepMigrated"));
  v57[32] = v15;
  v56[33] = @"wasQuickStartPlatterShown";
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric wasQuickStartPlatterShown](self, "wasQuickStartPlatterShown"));
  v57[33] = v16;
  v56[34] = @"wasColoringBookSeen";
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric wasColoringBookSeen](self, "wasColoringBookSeen"));
  v57[34] = v17;
  v56[35] = @"intelligentBreakthroughEnabled";
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXModeConfigurationMetric isIntelligentBreakthroughEnabled](self, "isIntelligentBreakthroughEnabled"));
  v57[35] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:36];

  if (!v13) {
  if (!v11)
  }

  if (!v10) {
  if (!v33)
  }

  if (!v34) {
  if (!v53)
  }

  if (v55) {
  return v19;
  }
}

- (id)description
{
  v37 = NSString;
  v36 = [(ATXModeConfigurationMetric *)self modeIdentifier];
  v35 = [(ATXModeConfigurationMetric *)self modeSemanticType];
  BOOL v34 = [(ATXModeConfigurationMetric *)self hasSmartTrigger];
  BOOL v33 = [(ATXModeConfigurationMetric *)self hasAreaTrigger];
  BOOL v32 = [(ATXModeConfigurationMetric *)self hasTimeTrigger];
  BOOL v31 = [(ATXModeConfigurationMetric *)self hasAppTrigger];
  BOOL v30 = [(ATXModeConfigurationMetric *)self hasScreenActivityTrigger];
  BOOL v29 = [(ATXModeConfigurationMetric *)self hasWorkoutTrigger];
  BOOL v28 = [(ATXModeConfigurationMetric *)self hasSleepTrigger];
  BOOL v27 = [(ATXModeConfigurationMetric *)self hasDrivingTrigger];
  unint64_t v26 = [(ATXModeConfigurationMetric *)self numAllowedApps];
  unint64_t v25 = [(ATXModeConfigurationMetric *)self numAllowedContacts];
  BOOL v24 = [(ATXModeConfigurationMetric *)self isAutomaticallyGenerated];
  BOOL v23 = [(ATXModeConfigurationMetric *)self doesImpactAvailability];
  BOOL v20 = [(ATXModeConfigurationMetric *)self hasCustomHomeScreen];
  unint64_t v19 = [(ATXModeConfigurationMetric *)self numCustomHomeScreens];
  BOOL v18 = [(ATXModeConfigurationMetric *)self hasCustomHomeScreenUsedInOtherModes];
  unint64_t v17 = [(ATXModeConfigurationMetric *)self numDeniedApps];
  unint64_t v16 = [(ATXModeConfigurationMetric *)self numDeniedContacts];
  v22 = [(ATXModeConfigurationMetric *)self appConfigurationType];
  v21 = [(ATXModeConfigurationMetric *)self contactConfigurationType];
  unint64_t v15 = [(ATXModeConfigurationMetric *)self numAcceptedSuggestedHomePages];
  unint64_t v14 = [(ATXModeConfigurationMetric *)self numAcceptedSuggestedLockScreens];
  unint64_t v13 = [(ATXModeConfigurationMetric *)self numAcceptedSuggestedApps];
  unint64_t v12 = [(ATXModeConfigurationMetric *)self numAcceptedSuggestedContacts];
  BOOL v11 = [(ATXModeConfigurationMetric *)self didRemoveSuggestedPage];
  unint64_t v3 = [(ATXModeConfigurationMetric *)self numAppConfigurations];
  BOOL v4 = [(ATXModeConfigurationMetric *)self isSharingAcrossDevices];
  unint64_t v5 = [(ATXModeConfigurationMetric *)self numLockScreenPosters];
  uint64_t v6 = [(ATXModeConfigurationMetric *)self treatmentId];
  v7 = [(ATXModeConfigurationMetric *)self experimentId];
  uint64_t v8 = [(ATXModeConfigurationMetric *)self deploymentId];
  objc_msgSend(v37, "stringWithFormat:", @"ATXModeConfigurationMetric modeIdentifier:%@\nmodeSemanticType:%@\nhasSmartTrigger:%d\nhasAreaTrigger:%d\nhasTimeTrigger:%d\nhasAppTrigger:%d\nhasScreenActivityTrigger:%d\nhasWorkoutTrigger:%d\nhasSleepTrigger:%d\nhasDrivingTrigger:%d\nnumAllowedApps:%lu\nnumAllowedContacts:%lu\nisAutomaticallyGenerated:%d\ndoesImpactAvailability:%d\nhasCustomHomeScreen:%d\nnumCustomHomeScreens:%lu\nhasCustomHomeScreenUsedInOtherModes:%d\nnumDeniedApps:%lu\nnumDeniedContacts:%lu\nappConfigurationType:%@\ncontactConfigurationType:%@\nnumAcceptedSuggestedHomePages:%lu\nnumAcceptedSuggestedLockScreens:%lu\nnumAcceptedSuggestedApps:%lu\nnumAcceptedSuggestedContacts:%lu\ndidRemoveSuggestedPage:%d\nnumAppConfigurations:%lu\nisSharingAcrossDevices:%d\nnumLockScreenPosters:%lu\ntreatmentId:%@\nexperimentId:%@\ndeploymentId:%@\nisSleepMigrated:%d\nwasQuickStartPlatterShown:%d\nwasColoringBookSeen:%d\nintelligentBreakthroughEnabled:%d\n", v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v24, v23, v20, v19,
    v18,
    v17,
    v16,
    v22,
    v21,
    v15,
    v14,
    v13,
    v12,
    v11,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    [(ATXModeConfigurationMetric *)self isSleepMigrated],
    [(ATXModeConfigurationMetric *)self wasQuickStartPlatterShown],
    [(ATXModeConfigurationMetric *)self wasColoringBookSeen],
  uint64_t v9 = [(ATXModeConfigurationMetric *)self isIntelligentBreakthroughEnabled]);

  return v9;
}

- (unint64_t)cappedForPrivacyWithValue:(int64_t)a3
{
  if ((unint64_t)a3 >= 0x14) {
    return 20;
  }
  else {
    return a3;
  }
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (void)setModeIdentifier:(id)a3
{
}

- (NSString)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)setModeSemanticType:(id)a3
{
}

- (BOOL)hasSmartTrigger
{
  return self->_hasSmartTrigger;
}

- (void)setHasSmartTrigger:(BOOL)a3
{
  self->_hasSmartTrigger = a3;
}

- (BOOL)hasAreaTrigger
{
  return self->_hasAreaTrigger;
}

- (void)setHasAreaTrigger:(BOOL)a3
{
  self->_hasAreaTrigger = a3;
}

- (BOOL)hasTimeTrigger
{
  return self->_hasTimeTrigger;
}

- (void)setHasTimeTrigger:(BOOL)a3
{
  self->_hasTimeTrigger = a3;
}

- (BOOL)hasAppTrigger
{
  return self->_hasAppTrigger;
}

- (void)setHasAppTrigger:(BOOL)a3
{
  self->_hasAppTrigger = a3;
}

- (BOOL)hasScreenActivityTrigger
{
  return self->_hasScreenActivityTrigger;
}

- (void)setHasScreenActivityTrigger:(BOOL)a3
{
  self->_hasScreenActivityTrigger = a3;
}

- (BOOL)hasWorkoutTrigger
{
  return self->_hasWorkoutTrigger;
}

- (void)setHasWorkoutTrigger:(BOOL)a3
{
  self->_hasWorkoutTrigger = a3;
}

- (BOOL)hasSleepTrigger
{
  return self->_hasSleepTrigger;
}

- (void)setHasSleepTrigger:(BOOL)a3
{
  self->_hasSleepTrigger = a3;
}

- (BOOL)hasDrivingTrigger
{
  return self->_hasDrivingTrigger;
}

- (void)setHasDrivingTrigger:(BOOL)a3
{
  self->_hasDrivingTrigger = a3;
}

- (unint64_t)numAllowedApps
{
  return self->_numAllowedApps;
}

- (void)setNumAllowedApps:(unint64_t)a3
{
  self->_numAllowedApps = a3;
}

- (unint64_t)numAllowedContacts
{
  return self->_numAllowedContacts;
}

- (void)setNumAllowedContacts:(unint64_t)a3
{
  self->_numAllowedContacts = a3;
}

- (unint64_t)numDeniedApps
{
  return self->_numDeniedApps;
}

- (void)setNumDeniedApps:(unint64_t)a3
{
  self->_numDeniedApps = a3;
}

- (unint64_t)numDeniedContacts
{
  return self->_numDeniedContacts;
}

- (void)setNumDeniedContacts:(unint64_t)a3
{
  self->_numDeniedContacts = a3;
}

- (BOOL)isAutomaticallyGenerated
{
  return self->_isAutomaticallyGenerated;
}

- (void)setIsAutomaticallyGenerated:(BOOL)a3
{
  self->_isAutomaticallyGenerated = a3;
}

- (BOOL)doesImpactAvailability
{
  return self->_doesImpactAvailability;
}

- (void)setDoesImpactAvailability:(BOOL)a3
{
  self->_doesImpactAvailability = a3;
}

- (BOOL)hasCustomHomeScreen
{
  return self->_hasCustomHomeScreen;
}

- (void)setHasCustomHomeScreen:(BOOL)a3
{
  self->_hasCustomHomeScreen = a3;
}

- (unint64_t)numCustomHomeScreens
{
  return self->_numCustomHomeScreens;
}

- (void)setNumCustomHomeScreens:(unint64_t)a3
{
  self->_numCustomHomeScreens = a3;
}

- (BOOL)hasCustomHomeScreenUsedInOtherModes
{
  return self->_hasCustomHomeScreenUsedInOtherModes;
}

- (void)setHasCustomHomeScreenUsedInOtherModes:(BOOL)a3
{
  self->_hasCustomHomeScreenUsedInOtherModes = a3;
}

- (unint64_t)numLockScreenPosters
{
  return self->_numLockScreenPosters;
}

- (void)setNumLockScreenPosters:(unint64_t)a3
{
  self->_numLockScreenPosters = a3;
}

- (NSString)appConfigurationType
{
  return self->_appConfigurationType;
}

- (void)setAppConfigurationType:(id)a3
{
}

- (NSString)contactConfigurationType
{
  return self->_contactConfigurationType;
}

- (void)setContactConfigurationType:(id)a3
{
}

- (unint64_t)numAcceptedSuggestedHomePages
{
  return self->_numAcceptedSuggestedHomePages;
}

- (void)setNumAcceptedSuggestedHomePages:(unint64_t)a3
{
  self->_numAcceptedSuggestedHomePages = a3;
}

- (unint64_t)numAcceptedSuggestedLockScreens
{
  return self->_numAcceptedSuggestedLockScreens;
}

- (void)setNumAcceptedSuggestedLockScreens:(unint64_t)a3
{
  self->_numAcceptedSuggestedLockScreens = a3;
}

- (unint64_t)numAcceptedSuggestedApps
{
  return self->_numAcceptedSuggestedApps;
}

- (void)setNumAcceptedSuggestedApps:(unint64_t)a3
{
  self->_numAcceptedSuggestedApps = a3;
}

- (unint64_t)numAcceptedSuggestedContacts
{
  return self->_numAcceptedSuggestedContacts;
}

- (void)setNumAcceptedSuggestedContacts:(unint64_t)a3
{
  self->_numAcceptedSuggestedContacts = a3;
}

- (BOOL)didRemoveSuggestedPage
{
  return self->_didRemoveSuggestedPage;
}

- (void)setDidRemoveSuggestedPage:(BOOL)a3
{
  self->_didRemoveSuggestedPage = a3;
}

- (BOOL)isSleepMigrated
{
  return self->_isSleepMigrated;
}

- (void)setIsSleepMigrated:(BOOL)a3
{
  self->_isSleepMigrated = a3;
}

- (unint64_t)numAppConfigurations
{
  return self->_numAppConfigurations;
}

- (void)setNumAppConfigurations:(unint64_t)a3
{
  self->_numAppConfigurations = a3;
}

- (BOOL)isSharingAcrossDevices
{
  return self->_isSharingAcrossDevices;
}

- (void)setIsSharingAcrossDevices:(BOOL)a3
{
  self->_isSharingAcrossDevices = a3;
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

- (BOOL)wasQuickStartPlatterShown
{
  return self->_wasQuickStartPlatterShown;
}

- (void)setWasQuickStartPlatterShown:(BOOL)a3
{
  self->_wasQuickStartPlatterShown = a3;
}

- (BOOL)wasColoringBookSeen
{
  return self->_wasColoringBookSeen;
}

- (void)setWasColoringBookSeen:(BOOL)a3
{
  self->_wasColoringBookSeen = a3;
}

- (BOOL)isIntelligentBreakthroughEnabled
{
  return self->_isIntelligentBreakthroughEnabled;
}

- (void)setIsIntelligentBreakthroughEnabled:(BOOL)a3
{
  self->_isIntelligentBreakthroughEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_contactConfigurationType, 0);
  objc_storeStrong((id *)&self->_appConfigurationType, 0);
  objc_storeStrong((id *)&self->_modeSemanticType, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
}

@end