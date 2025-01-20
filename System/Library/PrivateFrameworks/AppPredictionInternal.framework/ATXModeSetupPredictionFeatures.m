@interface ATXModeSetupPredictionFeatures
- (ATXModeSetupPredictionFeatures)init;
- (BOOL)isDigestCurrentlyEnabled;
- (NSNumber)globalAllPagesFolderCount;
- (NSNumber)globalAllPagesWidgetCount;
- (NSNumber)globalAppLaunchCountWithinLast1Day;
- (NSNumber)globalAppLaunchCountWithinLastNDays;
- (NSNumber)globalCountOfNotificationsClearedWithinLast1Day;
- (NSNumber)globalCountOfNotificationsClearedWithinLastNDays;
- (NSNumber)globalCountOfNotificationsReceivedWithinLast1Day;
- (NSNumber)globalCountOfNotificationsReceivedWithinLastNDays;
- (NSNumber)globalInterruptedAppSessionsCountWithinLast1Day;
- (NSNumber)globalInterruptedAppSessionsCountWithinLastNDays;
- (NSNumber)globalPosterConfigurationsCount;
- (NSNumber)homePageFolderCountBucket;
- (NSNumber)homePageWidgetCountBucket;
- (NSNumber)modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode;
- (NSNumber)modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode;
- (NSNumber)modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode;
- (NSNumber)modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode;
- (NSNumber)modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day;
- (NSNumber)modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays;
- (NSNumber)modeCountOfNotificationsClearedWithinLast1Day;
- (NSNumber)modeCountOfNotificationsClearedWithinLastNDays;
- (NSNumber)modeCountOfNotificationsReceivedWithinLast1Day;
- (NSNumber)modeCountOfNotificationsReceivedWithinLastNDays;
- (NSNumber)modeInferredCountInLast1Day;
- (NSNumber)modeInferredCountInLastNDays;
- (NSNumber)modeInferredDurationInLast1Day;
- (NSNumber)modeInferredDurationInLastNDays;
- (NSNumber)modeInterruptedAppSessionsCountWithinLast1Day;
- (NSNumber)modeInterruptedAppSessionsCountWithinLastNDays;
- (NSNumber)modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day;
- (NSNumber)modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (void)setGlobalAllPagesFolderCount:(id)a3;
- (void)setGlobalAllPagesWidgetCount:(id)a3;
- (void)setGlobalAppLaunchCountWithinLast1Day:(id)a3;
- (void)setGlobalAppLaunchCountWithinLastNDays:(id)a3;
- (void)setGlobalCountOfNotificationsClearedWithinLast1Day:(id)a3;
- (void)setGlobalCountOfNotificationsClearedWithinLastNDays:(id)a3;
- (void)setGlobalCountOfNotificationsReceivedWithinLast1Day:(id)a3;
- (void)setGlobalCountOfNotificationsReceivedWithinLastNDays:(id)a3;
- (void)setGlobalInterruptedAppSessionsCountWithinLast1Day:(id)a3;
- (void)setGlobalInterruptedAppSessionsCountWithinLastNDays:(id)a3;
- (void)setGlobalPosterConfigurationsCount:(id)a3;
- (void)setHomePageFolderCountBucket:(id)a3;
- (void)setHomePageWidgetCountBucket:(id)a3;
- (void)setIsDigestCurrentlyEnabled:(BOOL)a3;
- (void)setModeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode:(id)a3;
- (void)setModeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode:(id)a3;
- (void)setModeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode:(id)a3;
- (void)setModeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode:(id)a3;
- (void)setModeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day:(id)a3;
- (void)setModeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays:(id)a3;
- (void)setModeCountOfNotificationsClearedWithinLast1Day:(id)a3;
- (void)setModeCountOfNotificationsClearedWithinLastNDays:(id)a3;
- (void)setModeCountOfNotificationsReceivedWithinLast1Day:(id)a3;
- (void)setModeCountOfNotificationsReceivedWithinLastNDays:(id)a3;
- (void)setModeInferredCountInLast1Day:(id)a3;
- (void)setModeInferredCountInLastNDays:(id)a3;
- (void)setModeInferredDurationInLast1Day:(id)a3;
- (void)setModeInferredDurationInLastNDays:(id)a3;
- (void)setModeInterruptedAppSessionsCountWithinLast1Day:(id)a3;
- (void)setModeInterruptedAppSessionsCountWithinLastNDays:(id)a3;
- (void)setModeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day:(id)a3;
- (void)setModeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays:(id)a3;
@end

@implementation ATXModeSetupPredictionFeatures

- (ATXModeSetupPredictionFeatures)init
{
  v36.receiver = self;
  v36.super_class = (Class)ATXModeSetupPredictionFeatures;
  v2 = [(ATXModeSetupPredictionFeatures *)&v36 init];
  v3 = v2;
  if (v2)
  {
    v2->_isDigestCurrentlyEnabled = 0;
    globalAllPagesFolderCount = v2->_globalAllPagesFolderCount;
    v2->_globalAllPagesFolderCount = (NSNumber *)&unk_1F27F0498;

    globalAllPagesWidgetCount = v3->_globalAllPagesWidgetCount;
    v3->_globalAllPagesWidgetCount = (NSNumber *)&unk_1F27F0498;

    homePageFolderCountBucket = v3->_homePageFolderCountBucket;
    v3->_homePageFolderCountBucket = (NSNumber *)&unk_1F27F0498;

    homePageWidgetCountBucket = v3->_homePageWidgetCountBucket;
    v3->_homePageWidgetCountBucket = (NSNumber *)&unk_1F27F0498;

    globalAppLaunchCountWithinLastNDays = v3->_globalAppLaunchCountWithinLastNDays;
    v3->_globalAppLaunchCountWithinLastNDays = (NSNumber *)&unk_1F27F0498;

    globalAppLaunchCountWithinLast1Day = v3->_globalAppLaunchCountWithinLast1Day;
    v3->_globalAppLaunchCountWithinLast1Day = (NSNumber *)&unk_1F27F0498;

    modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays = v3->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays;
    v3->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays = (NSNumber *)&unk_1F27F0498;

    modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day = v3->_modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day;
    v3->_modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day = (NSNumber *)&unk_1F27F0498;

    modeInferredDurationInLastNDays = v3->_modeInferredDurationInLastNDays;
    v3->_modeInferredDurationInLastNDays = (NSNumber *)&unk_1F27F0498;

    modeInferredDurationInLast1Day = v3->_modeInferredDurationInLast1Day;
    v3->_modeInferredDurationInLast1Day = (NSNumber *)&unk_1F27F0498;

    modeInferredCountInLastNDays = v3->_modeInferredCountInLastNDays;
    v3->_modeInferredCountInLastNDays = (NSNumber *)&unk_1F27F0498;

    modeInferredCountInLast1Day = v3->_modeInferredCountInLast1Day;
    v3->_modeInferredCountInLast1Day = (NSNumber *)&unk_1F27F0498;

    modeCountOfNotificationsClearedWithinLastNDays = v3->_modeCountOfNotificationsClearedWithinLastNDays;
    v3->_modeCountOfNotificationsClearedWithinLastNDays = (NSNumber *)&unk_1F27F0498;

    modeCountOfNotificationsClearedWithinLast1Day = v3->_modeCountOfNotificationsClearedWithinLast1Day;
    v3->_modeCountOfNotificationsClearedWithinLast1Day = (NSNumber *)&unk_1F27F0498;

    globalCountOfNotificationsClearedWithinLastNDays = v3->_globalCountOfNotificationsClearedWithinLastNDays;
    v3->_globalCountOfNotificationsClearedWithinLastNDays = (NSNumber *)&unk_1F27F0498;

    globalCountOfNotificationsClearedWithinLast1Day = v3->_globalCountOfNotificationsClearedWithinLast1Day;
    v3->_globalCountOfNotificationsClearedWithinLast1Day = (NSNumber *)&unk_1F27F0498;

    modeCountOfNotificationsReceivedWithinLastNDays = v3->_modeCountOfNotificationsReceivedWithinLastNDays;
    v3->_modeCountOfNotificationsReceivedWithinLastNDays = (NSNumber *)&unk_1F27F0498;

    modeCountOfNotificationsReceivedWithinLast1Day = v3->_modeCountOfNotificationsReceivedWithinLast1Day;
    v3->_modeCountOfNotificationsReceivedWithinLast1Day = (NSNumber *)&unk_1F27F0498;

    globalCountOfNotificationsReceivedWithinLastNDays = v3->_globalCountOfNotificationsReceivedWithinLastNDays;
    v3->_globalCountOfNotificationsReceivedWithinLastNDays = (NSNumber *)&unk_1F27F0498;

    globalCountOfNotificationsReceivedWithinLast1Day = v3->_globalCountOfNotificationsReceivedWithinLast1Day;
    v3->_globalCountOfNotificationsReceivedWithinLast1Day = (NSNumber *)&unk_1F27F0498;

    modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays = v3->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays;
    v3->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays = (NSNumber *)&unk_1F27F0498;

    modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day = v3->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day;
    v3->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day = (NSNumber *)&unk_1F27F0498;

    globalPosterConfigurationsCount = v3->_globalPosterConfigurationsCount;
    v3->_globalPosterConfigurationsCount = (NSNumber *)&unk_1F27F0498;

    globalInterruptedAppSessionsCountWithinLastNDays = v3->_globalInterruptedAppSessionsCountWithinLastNDays;
    v3->_globalInterruptedAppSessionsCountWithinLastNDays = (NSNumber *)&unk_1F27F0498;

    globalInterruptedAppSessionsCountWithinLast1Day = v3->_globalInterruptedAppSessionsCountWithinLast1Day;
    v3->_globalInterruptedAppSessionsCountWithinLast1Day = (NSNumber *)&unk_1F27F0498;

    modeInterruptedAppSessionsCountWithinLastNDays = v3->_modeInterruptedAppSessionsCountWithinLastNDays;
    v3->_modeInterruptedAppSessionsCountWithinLastNDays = (NSNumber *)&unk_1F27F0498;

    modeInterruptedAppSessionsCountWithinLast1Day = v3->_modeInterruptedAppSessionsCountWithinLast1Day;
    v3->_modeInterruptedAppSessionsCountWithinLast1Day = (NSNumber *)&unk_1F27F0498;

    modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode = v3->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode;
    v3->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode = (NSNumber *)&unk_1F27F0498;

    modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode = v3->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode;
    v3->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode = (NSNumber *)&unk_1F27F0498;

    modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode = v3->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode;
    v3->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode = (NSNumber *)&unk_1F27F0498;

    modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode = v3->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode;
    v3->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode = (NSNumber *)&unk_1F27F0498;
  }
  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)ATXModeSetupPredictionFeatures;
  v5 = [(ATXModeSetupPredictionFeatures *)&v70 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isDigestCurrentlyEnabled"];
    v5->_isDigestCurrentlyEnabled = [v6 BOOLValue];

    uint64_t v7 = [v4 objectForKeyedSubscript:@"globalAllPagesFolderCount"];
    globalAllPagesFolderCount = v5->_globalAllPagesFolderCount;
    v5->_globalAllPagesFolderCount = (NSNumber *)v7;

    uint64_t v9 = [v4 objectForKeyedSubscript:@"globalAllPagesWidgetCount"];
    globalAllPagesWidgetCount = v5->_globalAllPagesWidgetCount;
    v5->_globalAllPagesWidgetCount = (NSNumber *)v9;

    uint64_t v11 = [v4 objectForKeyedSubscript:@"homePageFolderCountBucket"];
    homePageFolderCountBucket = v5->_homePageFolderCountBucket;
    v5->_homePageFolderCountBucket = (NSNumber *)v11;

    uint64_t v13 = [v4 objectForKeyedSubscript:@"homePageWidgetCountBucket"];
    homePageWidgetCountBucket = v5->_homePageWidgetCountBucket;
    v5->_homePageWidgetCountBucket = (NSNumber *)v13;

    uint64_t v15 = [v4 objectForKeyedSubscript:@"globalAppLaunchCountWithinLastNDays"];
    globalAppLaunchCountWithinLastNDays = v5->_globalAppLaunchCountWithinLastNDays;
    v5->_globalAppLaunchCountWithinLastNDays = (NSNumber *)v15;

    uint64_t v17 = [v4 objectForKeyedSubscript:@"globalAppLaunchCountWithinLast1Day"];
    globalAppLaunchCountWithinLast1Day = v5->_globalAppLaunchCountWithinLast1Day;
    v5->_globalAppLaunchCountWithinLast1Day = (NSNumber *)v17;

    uint64_t v19 = [v4 objectForKeyedSubscript:@"modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays"];
    modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays = v5->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays;
    v5->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays = (NSNumber *)v19;

    uint64_t v21 = [v4 objectForKeyedSubscript:@"modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day"];
    modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day = v5->_modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day;
    v5->_modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day = (NSNumber *)v21;

    uint64_t v23 = [v4 objectForKeyedSubscript:@"modeInferredDurationInLastNDays"];
    modeInferredDurationInLastNDays = v5->_modeInferredDurationInLastNDays;
    v5->_modeInferredDurationInLastNDays = (NSNumber *)v23;

    uint64_t v25 = [v4 objectForKeyedSubscript:@"modeInferredDurationInLast1Day"];
    modeInferredDurationInLast1Day = v5->_modeInferredDurationInLast1Day;
    v5->_modeInferredDurationInLast1Day = (NSNumber *)v25;

    uint64_t v27 = [v4 objectForKeyedSubscript:@"modeInferredCountInLastNDays"];
    modeInferredCountInLastNDays = v5->_modeInferredCountInLastNDays;
    v5->_modeInferredCountInLastNDays = (NSNumber *)v27;

    uint64_t v29 = [v4 objectForKeyedSubscript:@"modeInferredCountInLast1Day"];
    modeInferredCountInLast1Day = v5->_modeInferredCountInLast1Day;
    v5->_modeInferredCountInLast1Day = (NSNumber *)v29;

    uint64_t v31 = [v4 objectForKeyedSubscript:@"modeCountOfNotificationsClearedWithinLastNDays"];
    modeCountOfNotificationsClearedWithinLastNDays = v5->_modeCountOfNotificationsClearedWithinLastNDays;
    v5->_modeCountOfNotificationsClearedWithinLastNDays = (NSNumber *)v31;

    uint64_t v33 = [v4 objectForKeyedSubscript:@"modeCountOfNotificationsClearedWithinLast1Day"];
    modeCountOfNotificationsClearedWithinLast1Day = v5->_modeCountOfNotificationsClearedWithinLast1Day;
    v5->_modeCountOfNotificationsClearedWithinLast1Day = (NSNumber *)v33;

    uint64_t v35 = [v4 objectForKeyedSubscript:@"globalCountOfNotificationsClearedWithinLastNDays"];
    globalCountOfNotificationsClearedWithinLastNDays = v5->_globalCountOfNotificationsClearedWithinLastNDays;
    v5->_globalCountOfNotificationsClearedWithinLastNDays = (NSNumber *)v35;

    uint64_t v37 = [v4 objectForKeyedSubscript:@"globalCountOfNotificationsClearedWithinLast1Day"];
    globalCountOfNotificationsClearedWithinLast1Day = v5->_globalCountOfNotificationsClearedWithinLast1Day;
    v5->_globalCountOfNotificationsClearedWithinLast1Day = (NSNumber *)v37;

    uint64_t v39 = [v4 objectForKeyedSubscript:@"modeCountOfNotificationsReceivedWithinLastNDays"];
    modeCountOfNotificationsReceivedWithinLastNDays = v5->_modeCountOfNotificationsReceivedWithinLastNDays;
    v5->_modeCountOfNotificationsReceivedWithinLastNDays = (NSNumber *)v39;

    uint64_t v41 = [v4 objectForKeyedSubscript:@"modeCountOfNotificationsReceivedWithinLast1Day"];
    modeCountOfNotificationsReceivedWithinLast1Day = v5->_modeCountOfNotificationsReceivedWithinLast1Day;
    v5->_modeCountOfNotificationsReceivedWithinLast1Day = (NSNumber *)v41;

    uint64_t v43 = [v4 objectForKeyedSubscript:@"globalCountOfNotificationsReceivedWithinLastNDays"];
    globalCountOfNotificationsReceivedWithinLastNDays = v5->_globalCountOfNotificationsReceivedWithinLastNDays;
    v5->_globalCountOfNotificationsReceivedWithinLastNDays = (NSNumber *)v43;

    uint64_t v45 = [v4 objectForKeyedSubscript:@"globalCountOfNotificationsReceivedWithinLast1Day"];
    globalCountOfNotificationsReceivedWithinLast1Day = v5->_globalCountOfNotificationsReceivedWithinLast1Day;
    v5->_globalCountOfNotificationsReceivedWithinLast1Day = (NSNumber *)v45;

    uint64_t v47 = [v4 objectForKeyedSubscript:@"modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays"];
    modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays = v5->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays;
    v5->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays = (NSNumber *)v47;

    uint64_t v49 = [v4 objectForKeyedSubscript:@"modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day"];
    modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day = v5->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day;
    v5->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day = (NSNumber *)v49;

    uint64_t v51 = [v4 objectForKeyedSubscript:@"globalPosterConfigurationsCount"];
    globalPosterConfigurationsCount = v5->_globalPosterConfigurationsCount;
    v5->_globalPosterConfigurationsCount = (NSNumber *)v51;

    uint64_t v53 = [v4 objectForKeyedSubscript:@"globalInterruptedAppSessionsCountWithinLastNDays"];
    globalInterruptedAppSessionsCountWithinLastNDays = v5->_globalInterruptedAppSessionsCountWithinLastNDays;
    v5->_globalInterruptedAppSessionsCountWithinLastNDays = (NSNumber *)v53;

    uint64_t v55 = [v4 objectForKeyedSubscript:@"globalInterruptedAppSessionsCountWithinLast1Day"];
    globalInterruptedAppSessionsCountWithinLast1Day = v5->_globalInterruptedAppSessionsCountWithinLast1Day;
    v5->_globalInterruptedAppSessionsCountWithinLast1Day = (NSNumber *)v55;

    uint64_t v57 = [v4 objectForKeyedSubscript:@"modeInterruptedAppSessionsCountWithinLastNDays"];
    modeInterruptedAppSessionsCountWithinLastNDays = v5->_modeInterruptedAppSessionsCountWithinLastNDays;
    v5->_modeInterruptedAppSessionsCountWithinLastNDays = (NSNumber *)v57;

    uint64_t v59 = [v4 objectForKeyedSubscript:@"modeInterruptedAppSessionsCountWithinLast1Day"];
    modeInterruptedAppSessionsCountWithinLast1Day = v5->_modeInterruptedAppSessionsCountWithinLast1Day;
    v5->_modeInterruptedAppSessionsCountWithinLast1Day = (NSNumber *)v59;

    uint64_t v61 = [v4 objectForKeyedSubscript:@"modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode"];
    modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode = v5->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode;
    v5->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode = (NSNumber *)v61;

    uint64_t v63 = [v4 objectForKeyedSubscript:@"modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode"];
    modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode = v5->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode;
    v5->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode = (NSNumber *)v63;

    uint64_t v65 = [v4 objectForKeyedSubscript:@"modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode"];
    modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode = v5->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode;
    v5->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode = (NSNumber *)v65;

    uint64_t v67 = [v4 objectForKeyedSubscript:@"modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode"];
    modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode = v5->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode;
    v5->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode = (NSNumber *)v67;
  }
  return v5;
}

- (id)jsonRepresentation
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v21[0] = @"isDigestCurrentlyEnabled";
  v3 = [NSNumber numberWithBool:self->_isDigestCurrentlyEnabled];
  globalAllPagesFolderCount = self->_globalAllPagesFolderCount;
  globalAllPagesWidgetCount = self->_globalAllPagesWidgetCount;
  v22[0] = v3;
  v22[1] = globalAllPagesFolderCount;
  v21[1] = @"globalAllPagesFolderCount";
  v21[2] = @"globalAllPagesWidgetCount";
  long long v23 = *(_OWORD *)&self->_homePageFolderCountBucket;
  v21[3] = @"homePageFolderCountBucket";
  v21[4] = @"homePageWidgetCountBucket";
  globalAppLaunchCountWithinLastNDays = self->_globalAppLaunchCountWithinLastNDays;
  globalAppLaunchCountWithinLast1Day = self->_globalAppLaunchCountWithinLast1Day;
  v22[2] = globalAllPagesWidgetCount;
  v24 = globalAppLaunchCountWithinLastNDays;
  uint64_t v25 = globalAppLaunchCountWithinLast1Day;
  v21[5] = @"globalAppLaunchCountWithinLastNDays";
  v21[6] = @"globalAppLaunchCountWithinLast1Day";
  long long v26 = *(_OWORD *)&self->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays;
  v21[7] = @"modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays";
  v21[8] = @"modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day";
  modeInferredDurationInLastNDays = self->_modeInferredDurationInLastNDays;
  v21[9] = @"modeInferredDurationInLastNDays";
  v21[10] = @"modeInferredDurationInLast1Day";
  long long v8 = *(_OWORD *)&self->_modeInferredDurationInLast1Day;
  v21[11] = @"modeInferredCountInLastNDays";
  v21[12] = @"modeInferredCountInLast1Day";
  modeCountOfNotificationsClearedWithinLastNDays = self->_modeCountOfNotificationsClearedWithinLastNDays;
  modeInferredCountInLast1Day = self->_modeInferredCountInLast1Day;
  v30 = modeCountOfNotificationsClearedWithinLastNDays;
  v21[13] = @"modeCountOfNotificationsClearedWithinLastNDays";
  v21[14] = @"modeCountOfNotificationsClearedWithinLast1Day";
  globalCountOfNotificationsClearedWithinLastNDays = self->_globalCountOfNotificationsClearedWithinLastNDays;
  modeCountOfNotificationsClearedWithinLast1Day = self->_modeCountOfNotificationsClearedWithinLast1Day;
  v32 = globalCountOfNotificationsClearedWithinLastNDays;
  v21[15] = @"globalCountOfNotificationsClearedWithinLastNDays";
  v21[16] = @"globalCountOfNotificationsClearedWithinLast1Day";
  modeCountOfNotificationsReceivedWithinLastNDays = self->_modeCountOfNotificationsReceivedWithinLastNDays;
  globalCountOfNotificationsClearedWithinLast1Day = self->_globalCountOfNotificationsClearedWithinLast1Day;
  v34 = modeCountOfNotificationsReceivedWithinLastNDays;
  v21[17] = @"modeCountOfNotificationsReceivedWithinLastNDays";
  v21[18] = @"modeCountOfNotificationsReceivedWithinLast1Day";
  globalCountOfNotificationsReceivedWithinLastNDays = self->_globalCountOfNotificationsReceivedWithinLastNDays;
  modeCountOfNotificationsReceivedWithinLast1Day = self->_modeCountOfNotificationsReceivedWithinLast1Day;
  objc_super v36 = globalCountOfNotificationsReceivedWithinLastNDays;
  v21[19] = @"globalCountOfNotificationsReceivedWithinLastNDays";
  v21[20] = @"globalCountOfNotificationsReceivedWithinLast1Day";
  modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays = self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays;
  globalCountOfNotificationsReceivedWithinLast1Day = self->_globalCountOfNotificationsReceivedWithinLast1Day;
  v38 = modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays;
  v21[21] = @"modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays";
  v21[22] = @"modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day";
  globalPosterConfigurationsCount = self->_globalPosterConfigurationsCount;
  modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day = self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day;
  v40 = globalPosterConfigurationsCount;
  v21[23] = @"globalPosterConfigurationsCount";
  v21[24] = @"globalInterruptedAppSessionsCountWithinLastNDays";
  globalInterruptedAppSessionsCountWithinLast1Day = self->_globalInterruptedAppSessionsCountWithinLast1Day;
  globalInterruptedAppSessionsCountWithinLastNDays = self->_globalInterruptedAppSessionsCountWithinLastNDays;
  v42 = globalInterruptedAppSessionsCountWithinLast1Day;
  v21[25] = @"globalInterruptedAppSessionsCountWithinLast1Day";
  v21[26] = @"modeInterruptedAppSessionsCountWithinLastNDays";
  modeInterruptedAppSessionsCountWithinLast1Day = self->_modeInterruptedAppSessionsCountWithinLast1Day;
  modeInterruptedAppSessionsCountWithinLastNDays = self->_modeInterruptedAppSessionsCountWithinLastNDays;
  v44 = modeInterruptedAppSessionsCountWithinLast1Day;
  v21[27] = @"modeInterruptedAppSessionsCountWithinLast1Day";
  v21[28] = @"modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode";
  modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode = self->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode;
  modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode = self->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode;
  v46 = modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode;
  long long v28 = v8;
  v21[29] = @"modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode";
  v21[30] = @"modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode";
  v21[31] = @"modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode";
  modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode = self->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode;
  modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode = self->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode;
  v48 = modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:32];

  return v19;
}

- (BOOL)isDigestCurrentlyEnabled
{
  return self->_isDigestCurrentlyEnabled;
}

- (void)setIsDigestCurrentlyEnabled:(BOOL)a3
{
  self->_isDigestCurrentlyEnabled = a3;
}

- (NSNumber)globalAllPagesFolderCount
{
  return self->_globalAllPagesFolderCount;
}

- (void)setGlobalAllPagesFolderCount:(id)a3
{
}

- (NSNumber)globalAllPagesWidgetCount
{
  return self->_globalAllPagesWidgetCount;
}

- (void)setGlobalAllPagesWidgetCount:(id)a3
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

- (NSNumber)globalAppLaunchCountWithinLastNDays
{
  return self->_globalAppLaunchCountWithinLastNDays;
}

- (void)setGlobalAppLaunchCountWithinLastNDays:(id)a3
{
}

- (NSNumber)globalAppLaunchCountWithinLast1Day
{
  return self->_globalAppLaunchCountWithinLast1Day;
}

- (void)setGlobalAppLaunchCountWithinLast1Day:(id)a3
{
}

- (NSNumber)modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays
{
  return self->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays;
}

- (void)setModeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays:(id)a3
{
}

- (NSNumber)modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day
{
  return self->_modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day;
}

- (void)setModeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day:(id)a3
{
}

- (NSNumber)modeInferredDurationInLastNDays
{
  return self->_modeInferredDurationInLastNDays;
}

- (void)setModeInferredDurationInLastNDays:(id)a3
{
}

- (NSNumber)modeInferredDurationInLast1Day
{
  return self->_modeInferredDurationInLast1Day;
}

- (void)setModeInferredDurationInLast1Day:(id)a3
{
}

- (NSNumber)modeInferredCountInLastNDays
{
  return self->_modeInferredCountInLastNDays;
}

- (void)setModeInferredCountInLastNDays:(id)a3
{
}

- (NSNumber)modeInferredCountInLast1Day
{
  return self->_modeInferredCountInLast1Day;
}

- (void)setModeInferredCountInLast1Day:(id)a3
{
}

- (NSNumber)modeCountOfNotificationsClearedWithinLastNDays
{
  return self->_modeCountOfNotificationsClearedWithinLastNDays;
}

- (void)setModeCountOfNotificationsClearedWithinLastNDays:(id)a3
{
}

- (NSNumber)modeCountOfNotificationsClearedWithinLast1Day
{
  return self->_modeCountOfNotificationsClearedWithinLast1Day;
}

- (void)setModeCountOfNotificationsClearedWithinLast1Day:(id)a3
{
}

- (NSNumber)globalCountOfNotificationsClearedWithinLastNDays
{
  return self->_globalCountOfNotificationsClearedWithinLastNDays;
}

- (void)setGlobalCountOfNotificationsClearedWithinLastNDays:(id)a3
{
}

- (NSNumber)globalCountOfNotificationsClearedWithinLast1Day
{
  return self->_globalCountOfNotificationsClearedWithinLast1Day;
}

- (void)setGlobalCountOfNotificationsClearedWithinLast1Day:(id)a3
{
}

- (NSNumber)modeCountOfNotificationsReceivedWithinLastNDays
{
  return self->_modeCountOfNotificationsReceivedWithinLastNDays;
}

- (void)setModeCountOfNotificationsReceivedWithinLastNDays:(id)a3
{
}

- (NSNumber)modeCountOfNotificationsReceivedWithinLast1Day
{
  return self->_modeCountOfNotificationsReceivedWithinLast1Day;
}

- (void)setModeCountOfNotificationsReceivedWithinLast1Day:(id)a3
{
}

- (NSNumber)globalCountOfNotificationsReceivedWithinLastNDays
{
  return self->_globalCountOfNotificationsReceivedWithinLastNDays;
}

- (void)setGlobalCountOfNotificationsReceivedWithinLastNDays:(id)a3
{
}

- (NSNumber)globalCountOfNotificationsReceivedWithinLast1Day
{
  return self->_globalCountOfNotificationsReceivedWithinLast1Day;
}

- (void)setGlobalCountOfNotificationsReceivedWithinLast1Day:(id)a3
{
}

- (NSNumber)modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays
{
  return self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays;
}

- (void)setModeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays:(id)a3
{
}

- (NSNumber)modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day
{
  return self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day;
}

- (void)setModeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day:(id)a3
{
}

- (NSNumber)globalPosterConfigurationsCount
{
  return self->_globalPosterConfigurationsCount;
}

- (void)setGlobalPosterConfigurationsCount:(id)a3
{
}

- (NSNumber)globalInterruptedAppSessionsCountWithinLastNDays
{
  return self->_globalInterruptedAppSessionsCountWithinLastNDays;
}

- (void)setGlobalInterruptedAppSessionsCountWithinLastNDays:(id)a3
{
}

- (NSNumber)globalInterruptedAppSessionsCountWithinLast1Day
{
  return self->_globalInterruptedAppSessionsCountWithinLast1Day;
}

- (void)setGlobalInterruptedAppSessionsCountWithinLast1Day:(id)a3
{
}

- (NSNumber)modeInterruptedAppSessionsCountWithinLastNDays
{
  return self->_modeInterruptedAppSessionsCountWithinLastNDays;
}

- (void)setModeInterruptedAppSessionsCountWithinLastNDays:(id)a3
{
}

- (NSNumber)modeInterruptedAppSessionsCountWithinLast1Day
{
  return self->_modeInterruptedAppSessionsCountWithinLast1Day;
}

- (void)setModeInterruptedAppSessionsCountWithinLast1Day:(id)a3
{
}

- (NSNumber)modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode
{
  return self->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode;
}

- (void)setModeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode:(id)a3
{
}

- (NSNumber)modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode
{
  return self->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode;
}

- (void)setModeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode:(id)a3
{
}

- (NSNumber)modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode
{
  return self->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode;
}

- (void)setModeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode:(id)a3
{
}

- (NSNumber)modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode
{
  return self->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode;
}

- (void)setModeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountWithinLast1DayBasedOnDenyListOfMode, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountWithinLast1DayBasedOnAllowListOfMode, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountWithinLastNDaysBasedOnDenyListOfMode, 0);
  objc_storeStrong((id *)&self->_modeAppInterruptionsCountWithinLastNDaysBasedOnAllowListOfMode, 0);
  objc_storeStrong((id *)&self->_modeInterruptedAppSessionsCountWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_modeInterruptedAppSessionsCountWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_globalInterruptedAppSessionsCountWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_globalInterruptedAppSessionsCountWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_globalPosterConfigurationsCount, 0);
  objc_storeStrong((id *)&self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_modeWeightedAppLaunchPriorsBasedOnGlobalPriorsWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsReceivedWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsReceivedWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsReceivedWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsReceivedWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsClearedWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_globalCountOfNotificationsClearedWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsClearedWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_modeCountOfNotificationsClearedWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_modeInferredCountInLast1Day, 0);
  objc_storeStrong((id *)&self->_modeInferredCountInLastNDays, 0);
  objc_storeStrong((id *)&self->_modeInferredDurationInLast1Day, 0);
  objc_storeStrong((id *)&self->_modeInferredDurationInLastNDays, 0);
  objc_storeStrong((id *)&self->_modeAppLaunchCountBasedOnGlobalPriorsWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_modeAppLaunchCountBasedOnGlobalPriorsWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_globalAppLaunchCountWithinLast1Day, 0);
  objc_storeStrong((id *)&self->_globalAppLaunchCountWithinLastNDays, 0);
  objc_storeStrong((id *)&self->_homePageWidgetCountBucket, 0);
  objc_storeStrong((id *)&self->_homePageFolderCountBucket, 0);
  objc_storeStrong((id *)&self->_globalAllPagesWidgetCount, 0);
  objc_storeStrong((id *)&self->_globalAllPagesFolderCount, 0);
}

@end