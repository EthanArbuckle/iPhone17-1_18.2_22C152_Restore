@interface ATXActionStatistics
- (ATXActionStatistics)init;
- (void)updateActionStatisticsForSlotResolutionStatistics:(id)a3 candidateActionPredictions:(id)a4;
@end

@implementation ATXActionStatistics

- (ATXActionStatistics)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXActionStatistics;
  v2 = [(ATXActionStatistics *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    *((void *)v2 + 8) = 0;
    *((_OWORD *)v2 + 2) = 0u;
    *((_OWORD *)v2 + 3) = 0u;
    *((_OWORD *)v2 + 1) = 0u;
    *((_OWORD *)v2 + 5) = 0u;
    *((_OWORD *)v2 + 6) = 0u;
    *((_OWORD *)v2 + 7) = 0u;
    *((_OWORD *)v2 + 8) = 0u;
    *((_OWORD *)v2 + 9) = 0u;
    *((_OWORD *)v2 + 10) = 0u;
    *((_OWORD *)v2 + 11) = 0u;
    *((_OWORD *)v2 + 12) = 0u;
    *((_OWORD *)v2 + 13) = 0u;
    *((_OWORD *)v2 + 14) = 0u;
    *((_OWORD *)v2 + 15) = 0u;
    *((_OWORD *)v2 + 16) = 0u;
    *((_OWORD *)v2 + 17) = 0u;
    *((_OWORD *)v2 + 18) = 0u;
    *((_OWORD *)v2 + 19) = 0u;
    *((void *)v2 + 40) = 0;
    *((_OWORD *)v2 + 21) = 0u;
    *((_OWORD *)v2 + 22) = 0u;
    *(_OWORD *)(v2 + 664) = 0u;
    *(_OWORD *)(v2 + 680) = 0u;
    *(_OWORD *)(v2 + 632) = 0u;
    *(_OWORD *)(v2 + 648) = 0u;
    *(_OWORD *)(v2 + 600) = 0u;
    *(_OWORD *)(v2 + 616) = 0u;
    *(_OWORD *)(v2 + 568) = 0u;
    *(_OWORD *)(v2 + 584) = 0u;
    *(_OWORD *)(v2 + 536) = 0u;
    *(_OWORD *)(v2 + 552) = 0u;
    *(_OWORD *)(v2 + 504) = 0u;
    *(_OWORD *)(v2 + 520) = 0u;
    *(_OWORD *)(v2 + 472) = 0u;
    *(_OWORD *)(v2 + 488) = 0u;
    *(_OWORD *)(v2 + 440) = 0u;
    *(_OWORD *)(v2 + 456) = 0u;
    *(_OWORD *)(v2 + 408) = 0u;
    *(_OWORD *)(v2 + 424) = 0u;
    uint64_t v5 = objc_opt_new();
    v6 = (void *)*((void *)v2 + 46);
    *((void *)v2 + 46) = v5;

    *(_OWORD *)(v2 + 376) = 0u;
    *(_OWORD *)(v2 + 392) = 0u;
    v7 = v2;
  }

  return (ATXActionStatistics *)v2;
}

- (void)updateActionStatisticsForSlotResolutionStatistics:(id)a3 candidateActionPredictions:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v6 = (id *)a3;
  id v7 = a4;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v13 = [v12 scoredAction];
        v14 = [v13 predictedItem];

        if (v14)
        {
          v15 = [ATXMinimalSlotResolutionParameters alloc];
          v16 = [v12 slotSet];
          v17 = [(ATXMinimalSlotResolutionParameters *)v15 initWithAction:v14 slots:v16];

          v18 = [v6[2] objectForKeyedSubscript:v17];
          [(NSMutableDictionary *)self->_statisticsForParameters setObject:v18 forKeyedSubscript:v17];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v9);
  }
  double totalTimeOfDayCount = self->_totalTimeOfDayCount;
  self->_totalLaunches = *((double *)v6 + 4) + self->_totalLaunches;
  self->_double totalTimeOfDayCount = *((double *)v6 + 6) + totalTimeOfDayCount;
  double totalHourWindowCount = self->_totalHourWindowCount;
  self->_totalThirtyMinuteWindowCount = *((double *)v6 + 7) + self->_totalThirtyMinuteWindowCount;
  self->_double totalHourWindowCount = *((double *)v6 + 8) + totalHourWindowCount;
  double totalCoarseTimeOfDayCount = self->_totalCoarseTimeOfDayCount;
  self->_totalEightHourWindowCount = *((double *)v6 + 9) + self->_totalEightHourWindowCount;
  double totalPartOfWeekCount = self->_totalPartOfWeekCount;
  self->_totalDayOfWeekCount = *((double *)v6 + 11) + self->_totalDayOfWeekCount;
  self->_double totalPartOfWeekCount = *((double *)v6 + 12) + totalPartOfWeekCount;
  double totalDayAndPrevLocationCount = self->_totalDayAndPrevLocationCount;
  self->_totalPartOfWeekAndLocationCount = *((double *)v6 + 37) + self->_totalPartOfWeekAndLocationCount;
  double totalTimeOfDayOccurrences = self->_totalTimeOfDayOccurrences;
  self->_totalPartOfWeekAndTimeCount = *((double *)v6 + 38) + self->_totalPartOfWeekAndTimeCount;
  double totalMotionTypeCount = self->_totalMotionTypeCount;
  self->_totalLocationCount = *((double *)v6 + 13) + self->_totalLocationCount;
  self->_double totalCoarseTimeOfDayCount = *((double *)v6 + 10) + totalCoarseTimeOfDayCount;
  self->_double totalMotionTypeCount = *((double *)v6 + 14) + totalMotionTypeCount;
  double totalTimeAndLocationCount = self->_totalTimeAndLocationCount;
  self->_totalPrevLocationCount = *((double *)v6 + 15) + self->_totalPrevLocationCount;
  self->_double totalTimeAndLocationCount = *((double *)v6 + 29) + totalTimeAndLocationCount;
  double totalDayAndLocationCount = self->_totalDayAndLocationCount;
  self->_totalTimeAndDayCount = *((double *)v6 + 30) + self->_totalTimeAndDayCount;
  self->_double totalDayAndLocationCount = *((double *)v6 + 31) + totalDayAndLocationCount;
  double totalPrevLocationAndMotionTypeCount = self->_totalPrevLocationAndMotionTypeCount;
  self->_totalTimeAndDayAndLocationCount = *((double *)v6 + 32) + self->_totalTimeAndDayAndLocationCount;
  self->_double totalPrevLocationAndMotionTypeCount = *((double *)v6 + 33) + totalPrevLocationAndMotionTypeCount;
  double totalTimeAndPrevLocationCount = self->_totalTimeAndPrevLocationCount;
  self->_totalPrevLocationAndLocationCount = *((double *)v6 + 34) + self->_totalPrevLocationAndLocationCount;
  self->_double totalTimeAndPrevLocationCount = *((double *)v6 + 35) + totalTimeAndPrevLocationCount;
  self->_double totalDayAndPrevLocationCount = *((double *)v6 + 36) + totalDayAndPrevLocationCount;
  self->_double totalTimeOfDayOccurrences = *((double *)v6 + 39) + totalTimeOfDayOccurrences;
  double totalLocationOccurrences = self->_totalLocationOccurrences;
  self->_totalDayOfWeekOccurrences = *((double *)v6 + 40) + self->_totalDayOfWeekOccurrences;
  self->_double totalLocationOccurrences = *((double *)v6 + 41) + totalLocationOccurrences;
  double totalPreviousLocationOccurrences = self->_totalPreviousLocationOccurrences;
  self->_totalMotionTypeOccurrences = *((double *)v6 + 42) + self->_totalMotionTypeOccurrences;
  self->_double totalPreviousLocationOccurrences = *((double *)v6 + 43) + totalPreviousLocationOccurrences;
  double totalTimeAndDayOccurrences = self->_totalTimeAndDayOccurrences;
  self->_totalPartOfWeekOccurrences = *((double *)v6 + 44) + self->_totalPartOfWeekOccurrences;
  self->_double totalTimeAndDayOccurrences = *((double *)v6 + 45) + totalTimeAndDayOccurrences;
  double totalDayAndLocationOccurrences = self->_totalDayAndLocationOccurrences;
  self->_totalTimeAndLocationOccurrences = *((double *)v6 + 46) + self->_totalTimeAndLocationOccurrences;
  self->_double totalDayAndLocationOccurrences = *((double *)v6 + 47) + totalDayAndLocationOccurrences;
  double totalPrevLocationAndLocationOccurrences = self->_totalPrevLocationAndLocationOccurrences;
  self->_totalTimeAndDayAndLocationOccurrences = *((double *)v6 + 48) + self->_totalTimeAndDayAndLocationOccurrences;
  self->_double totalPrevLocationAndLocationOccurrences = *((double *)v6 + 49) + totalPrevLocationAndLocationOccurrences;
  double totalTimeAndPrevLocationOccurrences = self->_totalTimeAndPrevLocationOccurrences;
  self->_totalPrevLocationAndMotionTypeOccurrences = *((double *)v6 + 50)
                                                   + self->_totalPrevLocationAndMotionTypeOccurrences;
  self->_double totalTimeAndPrevLocationOccurrences = *((double *)v6 + 51) + totalTimeAndPrevLocationOccurrences;
  double totalPartOfWeekAndLocationOccurrences = self->_totalPartOfWeekAndLocationOccurrences;
  self->_totalDayAndPrevLocationOccurrences = *((double *)v6 + 52) + self->_totalDayAndPrevLocationOccurrences;
  self->_double totalPartOfWeekAndLocationOccurrences = *((double *)v6 + 53) + totalPartOfWeekAndLocationOccurrences;
  double totalConfirms = self->_totalConfirms;
  self->_totalPartOfWeekAndTimeOccurrences = *((double *)v6 + 54) + self->_totalPartOfWeekAndTimeOccurrences;
  self->_double totalConfirms = *((double *)v6 + 17) + totalConfirms;
  double totalExplicitRejectsNoDecay = self->_totalExplicitRejectsNoDecay;
  self->_totalRejects = *((double *)v6 + 18) + self->_totalRejects;
  self->_double totalExplicitRejectsNoDecay = *((double *)v6 + 19) + totalExplicitRejectsNoDecay;
  double totalRejectsInSpotlight = self->_totalRejectsInSpotlight;
  self->_totalConfirmsInSpotlight = *((double *)v6 + 20) + self->_totalConfirmsInSpotlight;
  self->_double totalRejectsInSpotlight = *((double *)v6 + 21) + totalRejectsInSpotlight;
  double totalRejectsInSpotlightWithinMeanWindow = self->_totalRejectsInSpotlightWithinMeanWindow;
  self->_totalConfirmsInSpotlightWithinMeanWindow = *((double *)v6 + 22)
                                                  + self->_totalConfirmsInSpotlightWithinMeanWindow;
  self->_double totalRejectsInSpotlightWithinMeanWindow = *((double *)v6 + 23) + totalRejectsInSpotlightWithinMeanWindow;
  [(NSMutableSet *)self->_totalUniqueDaysConfirmedOrRejectedInSpotlightWithinMeanWindow unionSet:v6[24]];
  double totalRejectsTodayInLockscreen = self->_totalRejectsTodayInLockscreen;
  self->_totalConfirmsTodayInLockscreen = *((double *)v6 + 25) + self->_totalConfirmsTodayInLockscreen;
  self->_double totalRejectsTodayInLockscreen = *((double *)v6 + 26) + totalRejectsTodayInLockscreen;
  double totalRejectsInLockscreen = self->_totalRejectsInLockscreen;
  self->_totalConfirmsInLockscreen = *((double *)v6 + 27) + self->_totalConfirmsInLockscreen;
  self->_double totalRejectsInLockscreen = *((double *)v6 + 28) + totalRejectsInLockscreen;
  double totalCoarseTimePOWLocationOccurrences = self->_totalCoarseTimePOWLocationOccurrences;
  self->_totalCoarseTimePOWLocationCount = *((double *)v6 + 55) + self->_totalCoarseTimePOWLocationCount;
  self->_double totalCoarseTimePOWLocationOccurrences = *((double *)v6 + 56) + totalCoarseTimePOWLocationOccurrences;
  double totalConfirmsCoarseTimePOWLocationOccurrences = self->_totalConfirmsCoarseTimePOWLocationOccurrences;
  self->_totalConfirmsCoarseTimePOWLocationCount = *((double *)v6 + 57) + self->_totalConfirmsCoarseTimePOWLocationCount;
  self->_double totalConfirmsCoarseTimePOWLocationOccurrences = *((double *)v6 + 58)
                                                       + totalConfirmsCoarseTimePOWLocationOccurrences;
  double totalRejectsCoarseTimePOWLocationOccurrences = self->_totalRejectsCoarseTimePOWLocationOccurrences;
  self->_totalRejectsCoarseTimePOWLocationCount = *((double *)v6 + 59) + self->_totalRejectsCoarseTimePOWLocationCount;
  self->_double totalRejectsCoarseTimePOWLocationOccurrences = *((double *)v6 + 60)
                                                      + totalRejectsCoarseTimePOWLocationOccurrences;
  double totalSpecificTimeDOWLocationOccurrences = self->_totalSpecificTimeDOWLocationOccurrences;
  self->_totalSpecificTimeDOWLocationCount = *((double *)v6 + 61) + self->_totalSpecificTimeDOWLocationCount;
  self->_double totalSpecificTimeDOWLocationOccurrences = *((double *)v6 + 62) + totalSpecificTimeDOWLocationOccurrences;
  double totalConfirmsSpecificTimeDOWLocationOccurrences = self->_totalConfirmsSpecificTimeDOWLocationOccurrences;
  self->_totalConfirmsSpecificTimeDOWLocationCount = *((double *)v6 + 63)
                                                   + self->_totalConfirmsSpecificTimeDOWLocationCount;
  self->_double totalConfirmsSpecificTimeDOWLocationOccurrences = *((double *)v6 + 64)
                                                         + totalConfirmsSpecificTimeDOWLocationOccurrences;
  double totalRejectsSpecificTimeDOWLocationOccurrences = self->_totalRejectsSpecificTimeDOWLocationOccurrences;
  self->_totalRejectsSpecificTimeDOWLocationCount = *((double *)v6 + 65)
                                                  + self->_totalRejectsSpecificTimeDOWLocationCount;
  self->_double totalRejectsSpecificTimeDOWLocationOccurrences = *((double *)v6 + 66)
                                                        + totalRejectsSpecificTimeDOWLocationOccurrences;
  double launchesCoarseGeoHashInContext = self->_launchesCoarseGeoHashInContext;
  self->_launchesDayOfWeekInContext = *((double *)v6 + 67) + self->_launchesDayOfWeekInContext;
  self->_double launchesCoarseGeoHashInContext = *((double *)v6 + 68) + launchesCoarseGeoHashInContext;
  self->_launchesSpecificGeoHashInContext = *((double *)v6 + 69) + self->_launchesSpecificGeoHashInContext;
  self->_launchesTimeOfDayInContext = *((double *)v6 + 70) + self->_launchesTimeOfDayInContext;
  self->_confirmsTimeOfDayInContext = *((double *)v6 + 71) + self->_confirmsTimeOfDayInContext;
  self->_rejectsTimeOfDayInContext = *((double *)v6 + 72) + self->_rejectsTimeOfDayInContext;
  self->_confirmsDayOfWeekInContext = *((double *)v6 + 73) + self->_confirmsDayOfWeekInContext;
  self->_rejectsDayOfWeekInContext = *((double *)v6 + 74) + self->_rejectsDayOfWeekInContext;
  self->_confirmsCoarseGeoHashInContext = *((double *)v6 + 75) + self->_confirmsCoarseGeoHashInContext;
  self->_rejectsCoarseGeoHashInContext = *((double *)v6 + 76) + self->_rejectsCoarseGeoHashInContext;
  self->_confirmsSpecificGeoHashInContext = *((double *)v6 + 77) + self->_confirmsSpecificGeoHashInContext;
  self->_rejectsSpecificGeoHashInContext = *((double *)v6 + 78) + self->_rejectsSpecificGeoHashInContext;
  self->_homeScreenActionConfirmsOnDayOfWeekInContext = *((double *)v6 + 79)
                                                      + self->_homeScreenActionConfirmsOnDayOfWeekInContext;
  self->_homeScreenActionRejectsOnDayOfWeekInContext = *((double *)v6 + 80)
                                                     + self->_homeScreenActionRejectsOnDayOfWeekInContext;
  self->_homeScreenActionConfirmsAtTimeOfDayInContext = *((double *)v6 + 81)
                                                      + self->_homeScreenActionConfirmsAtTimeOfDayInContext;
  self->_homeScreenActionRejectsAtTimeOfDayInContext = *((double *)v6 + 82)
                                                     + self->_homeScreenActionRejectsAtTimeOfDayInContext;
  self->_homeScreenActionConfirmsAtCoarseGeohashInContext = *((double *)v6 + 83)
                                                          + self->_homeScreenActionConfirmsAtCoarseGeohashInContext;
  self->_homeScreenActionRejectsAtCoarseGeohashInContext = *((double *)v6 + 84)
                                                         + self->_homeScreenActionRejectsAtCoarseGeohashInContext;
  self->_homeScreenActionConfirmsAtSpecificGeohashInContext = *((double *)v6 + 85)
                                                            + self->_homeScreenActionConfirmsAtSpecificGeohashInContext;
  self->_homeScreenActionRejectsAtSpecificGeohashInContext = *((double *)v6 + 86)
                                                           + self->_homeScreenActionRejectsAtSpecificGeohashInContext;
  self->_homeScreenActionConfirmsAtCoarseTimePOWLocationInContext = *((double *)v6 + 87)
                                                                  + self->_homeScreenActionConfirmsAtCoarseTimePOWLocationInContext;
  self->_homeScreenActionRejectsAtCoarseTimePOWLocationInContext = *((double *)v6 + 88)
                                                                 + self->_homeScreenActionRejectsAtCoarseTimePOWLocationInContext;
  self->_homeScreenActionConfirmsAtSpecificTimeDOWLocationInContext = *((double *)v6 + 89)
                                                                    + self->_homeScreenActionConfirmsAtSpecificTimeDOWLocationInContext;
  self->_homeScreenActionRejectsAtSpecificTimeDOWLocationInContext = *((double *)v6 + 90)
                                                                   + self->_homeScreenActionRejectsAtSpecificTimeDOWLocationInContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalUniqueDaysConfirmedOrRejectedInSpotlightWithinMeanWindow, 0);
  objc_storeStrong((id *)&self->_statisticsForParameters, 0);
}

@end