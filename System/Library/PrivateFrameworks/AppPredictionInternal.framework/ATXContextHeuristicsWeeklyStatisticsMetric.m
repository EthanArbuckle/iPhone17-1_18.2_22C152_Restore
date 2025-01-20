@interface ATXContextHeuristicsWeeklyStatisticsMetric
- (BOOL)areSpotlightRecentsEnabled;
- (BOOL)areSpotlightSuggestionsEnabled;
- (NSString)atxTrialDeploymentId;
- (NSString)atxTrialExperimentId;
- (NSString)atxTrialTreatmentId;
- (NSString)trialDeploymentId;
- (NSString)trialExperimentId;
- (NSString)trialTreatmentId;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)numAppLibraryAppSuggestionTaps;
- (unint64_t)numAppLibraryAppTaps;
- (unint64_t)numAppSuggestionsVisibleInSpotlight;
- (unint64_t)numCalendarEvents;
- (unint64_t)numCalendarEventsWithLink;
- (unint64_t)numCalendarEventsWithLocation;
- (unint64_t)numHomescreenAppSuggestionTaps;
- (unint64_t)numHomescreenAppTaps;
- (unint64_t)numLeftOfHomeAppSuggestionTaps;
- (unint64_t)numRecentsTaps;
- (unint64_t)numSpotlightActionSuggestionTaps;
- (unint64_t)numSpotlightAppSuggestionTaps;
- (unint64_t)numSpotlightSearchAppTaps;
- (unint64_t)numSpotlightSearches;
- (unint64_t)numSpotlightUniqueDayVisits;
- (unint64_t)numSpotlightViews;
- (unint64_t)percentageOfTimeSpotlightActionSuggestionAvailable;
- (void)setAreSpotlightRecentsEnabled:(BOOL)a3;
- (void)setAreSpotlightSuggestionsEnabled:(BOOL)a3;
- (void)setAtxTrialDeploymentId:(id)a3;
- (void)setAtxTrialExperimentId:(id)a3;
- (void)setAtxTrialTreatmentId:(id)a3;
- (void)setNumAppLibraryAppSuggestionTaps:(unint64_t)a3;
- (void)setNumAppLibraryAppTaps:(unint64_t)a3;
- (void)setNumAppSuggestionsVisibleInSpotlight:(unint64_t)a3;
- (void)setNumCalendarEvents:(unint64_t)a3;
- (void)setNumCalendarEventsWithLink:(unint64_t)a3;
- (void)setNumCalendarEventsWithLocation:(unint64_t)a3;
- (void)setNumHomescreenAppSuggestionTaps:(unint64_t)a3;
- (void)setNumHomescreenAppTaps:(unint64_t)a3;
- (void)setNumLeftOfHomeAppSuggestionTaps:(unint64_t)a3;
- (void)setNumRecentsTaps:(unint64_t)a3;
- (void)setNumSpotlightActionSuggestionTaps:(unint64_t)a3;
- (void)setNumSpotlightAppSuggestionTaps:(unint64_t)a3;
- (void)setNumSpotlightSearchAppTaps:(unint64_t)a3;
- (void)setNumSpotlightSearches:(unint64_t)a3;
- (void)setNumSpotlightUniqueDayVisits:(unint64_t)a3;
- (void)setNumSpotlightViews:(unint64_t)a3;
- (void)setPercentageOfTimeSpotlightActionSuggestionAvailable:(unint64_t)a3;
- (void)setTrialDeploymentId:(id)a3;
- (void)setTrialExperimentId:(id)a3;
- (void)setTrialTreatmentId:(id)a3;
@end

@implementation ATXContextHeuristicsWeeklyStatisticsMetric

- (id)metricName
{
  return @"com.apple.zkw.weeklyStatistics";
}

- (id)coreAnalyticsDictionary
{
  v39[25] = *MEMORY[0x1E4F143B8];
  v38[0] = @"areSpotlightRecentsEnabled";
  v37 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXContextHeuristicsWeeklyStatisticsMetric areSpotlightRecentsEnabled](self, "areSpotlightRecentsEnabled"));
  v39[0] = v37;
  v38[1] = @"areSpotlightSuggestionsEnabled";
  v36 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXContextHeuristicsWeeklyStatisticsMetric areSpotlightSuggestionsEnabled](self, "areSpotlightSuggestionsEnabled"));
  v39[1] = v36;
  v38[2] = @"numAppSuggestionsVisibleInSpotlight";
  v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numAppSuggestionsVisibleInSpotlight](self, "numAppSuggestionsVisibleInSpotlight"));
  v39[2] = v35;
  v38[3] = @"numAppLibraryAppSuggestionTaps";
  v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numAppLibraryAppSuggestionTaps](self, "numAppLibraryAppSuggestionTaps"));
  v39[3] = v34;
  v38[4] = @"numAppLibraryAppTaps";
  v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numAppLibraryAppTaps](self, "numAppLibraryAppTaps"));
  v39[4] = v33;
  v38[5] = @"numHomescreenAppSuggestionTaps";
  v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numHomescreenAppSuggestionTaps](self, "numHomescreenAppSuggestionTaps"));
  v39[5] = v32;
  v38[6] = @"numHomescreenAppTaps";
  v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numHomescreenAppTaps](self, "numHomescreenAppTaps"));
  v39[6] = v31;
  v38[7] = @"numLeftOfHomeAppSuggestionTaps";
  v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numLeftOfHomeAppSuggestionTaps](self, "numLeftOfHomeAppSuggestionTaps"));
  v39[7] = v30;
  v38[8] = @"numSpotlightAppSuggestionTaps";
  v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numSpotlightAppSuggestionTaps](self, "numSpotlightAppSuggestionTaps"));
  v39[8] = v29;
  v38[9] = @"numSpotlightSearchAppTaps";
  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numSpotlightSearchAppTaps](self, "numSpotlightSearchAppTaps"));
  v39[9] = v28;
  v38[10] = @"numSpotlightActionSuggestionTaps";
  v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numSpotlightActionSuggestionTaps](self, "numSpotlightActionSuggestionTaps"));
  v39[10] = v27;
  v38[11] = @"numRecentsTaps";
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numRecentsTaps](self, "numRecentsTaps"));
  v39[11] = v26;
  v38[12] = @"numSpotlightSearches";
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numSpotlightSearches](self, "numSpotlightSearches"));
  v39[12] = v25;
  v38[13] = @"numSpotlightViews";
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numSpotlightViews](self, "numSpotlightViews"));
  v39[13] = v24;
  v38[14] = @"numSpotlightUniqueDayVisits";
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numSpotlightUniqueDayVisits](self, "numSpotlightUniqueDayVisits"));
  v39[14] = v23;
  v38[15] = @"percentageOfTimeSpotlightActionSuggestionAvailable";
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric percentageOfTimeSpotlightActionSuggestionAvailable](self, "percentageOfTimeSpotlightActionSuggestionAvailable"));
  v39[15] = v22;
  v38[16] = @"numCalendarEvents";
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numCalendarEvents](self, "numCalendarEvents"));
  v39[16] = v21;
  v38[17] = @"numCalendarEventsWithLink";
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numCalendarEventsWithLink](self, "numCalendarEventsWithLink"));
  v39[17] = v20;
  v38[18] = @"numCalendarEventsWithLocation";
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numCalendarEventsWithLocation](self, "numCalendarEventsWithLocation"));
  v39[18] = v19;
  v38[19] = @"trialDeploymentId";
  uint64_t v3 = [(ATXContextHeuristicsWeeklyStatisticsMetric *)self trialDeploymentId];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v17 = (void *)v3;
  v39[19] = v3;
  v38[20] = @"trialExperimentId";
  uint64_t v5 = [(ATXContextHeuristicsWeeklyStatisticsMetric *)self trialExperimentId];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v39[20] = v5;
  v38[21] = @"trialTreatmentId";
  v7 = [(ATXContextHeuristicsWeeklyStatisticsMetric *)self trialTreatmentId];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v39[21] = v8;
  v38[22] = @"atxTrialDeploymentId";
  v9 = [(ATXContextHeuristicsWeeklyStatisticsMetric *)self atxTrialDeploymentId];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v39[22] = v10;
  v38[23] = @"atxTrialExperimentId";
  v11 = [(ATXContextHeuristicsWeeklyStatisticsMetric *)self atxTrialExperimentId];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v39[23] = v12;
  v38[24] = @"atxTrialTreatmentId";
  v13 = [(ATXContextHeuristicsWeeklyStatisticsMetric *)self atxTrialTreatmentId];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v39[24] = v14;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:25];
  if (!v13) {

  }
  if (!v11) {
  if (!v9)
  }

  if (!v7) {
  if (!v6)
  }

  if (!v4) {
  return v18;
  }
}

- (BOOL)areSpotlightRecentsEnabled
{
  return self->_areSpotlightRecentsEnabled;
}

- (void)setAreSpotlightRecentsEnabled:(BOOL)a3
{
  self->_areSpotlightRecentsEnabled = a3;
}

- (BOOL)areSpotlightSuggestionsEnabled
{
  return self->_areSpotlightSuggestionsEnabled;
}

- (void)setAreSpotlightSuggestionsEnabled:(BOOL)a3
{
  self->_areSpotlightSuggestionsEnabled = a3;
}

- (unint64_t)numAppSuggestionsVisibleInSpotlight
{
  return self->_numAppSuggestionsVisibleInSpotlight;
}

- (void)setNumAppSuggestionsVisibleInSpotlight:(unint64_t)a3
{
  self->_numAppSuggestionsVisibleInSpotlight = a3;
}

- (unint64_t)numAppLibraryAppSuggestionTaps
{
  return self->_numAppLibraryAppSuggestionTaps;
}

- (void)setNumAppLibraryAppSuggestionTaps:(unint64_t)a3
{
  self->_numAppLibraryAppSuggestionTaps = a3;
}

- (unint64_t)numAppLibraryAppTaps
{
  return self->_numAppLibraryAppTaps;
}

- (void)setNumAppLibraryAppTaps:(unint64_t)a3
{
  self->_numAppLibraryAppTaps = a3;
}

- (unint64_t)numHomescreenAppSuggestionTaps
{
  return self->_numHomescreenAppSuggestionTaps;
}

- (void)setNumHomescreenAppSuggestionTaps:(unint64_t)a3
{
  self->_numHomescreenAppSuggestionTaps = a3;
}

- (unint64_t)numHomescreenAppTaps
{
  return self->_numHomescreenAppTaps;
}

- (void)setNumHomescreenAppTaps:(unint64_t)a3
{
  self->_numHomescreenAppTaps = a3;
}

- (unint64_t)numLeftOfHomeAppSuggestionTaps
{
  return self->_numLeftOfHomeAppSuggestionTaps;
}

- (void)setNumLeftOfHomeAppSuggestionTaps:(unint64_t)a3
{
  self->_numLeftOfHomeAppSuggestionTaps = a3;
}

- (unint64_t)numSpotlightAppSuggestionTaps
{
  return self->_numSpotlightAppSuggestionTaps;
}

- (void)setNumSpotlightAppSuggestionTaps:(unint64_t)a3
{
  self->_numSpotlightAppSuggestionTaps = a3;
}

- (unint64_t)numSpotlightSearchAppTaps
{
  return self->_numSpotlightSearchAppTaps;
}

- (void)setNumSpotlightSearchAppTaps:(unint64_t)a3
{
  self->_numSpotlightSearchAppTaps = a3;
}

- (unint64_t)numSpotlightActionSuggestionTaps
{
  return self->_numSpotlightActionSuggestionTaps;
}

- (void)setNumSpotlightActionSuggestionTaps:(unint64_t)a3
{
  self->_numSpotlightActionSuggestionTaps = a3;
}

- (unint64_t)numRecentsTaps
{
  return self->_numRecentsTaps;
}

- (void)setNumRecentsTaps:(unint64_t)a3
{
  self->_numRecentsTaps = a3;
}

- (unint64_t)numSpotlightSearches
{
  return self->_numSpotlightSearches;
}

- (void)setNumSpotlightSearches:(unint64_t)a3
{
  self->_numSpotlightSearches = a3;
}

- (unint64_t)numSpotlightViews
{
  return self->_numSpotlightViews;
}

- (void)setNumSpotlightViews:(unint64_t)a3
{
  self->_numSpotlightViews = a3;
}

- (unint64_t)numSpotlightUniqueDayVisits
{
  return self->_numSpotlightUniqueDayVisits;
}

- (void)setNumSpotlightUniqueDayVisits:(unint64_t)a3
{
  self->_numSpotlightUniqueDayVisits = a3;
}

- (unint64_t)percentageOfTimeSpotlightActionSuggestionAvailable
{
  return self->_percentageOfTimeSpotlightActionSuggestionAvailable;
}

- (void)setPercentageOfTimeSpotlightActionSuggestionAvailable:(unint64_t)a3
{
  self->_percentageOfTimeSpotlightActionSuggestionAvailable = a3;
}

- (unint64_t)numCalendarEvents
{
  return self->_numCalendarEvents;
}

- (void)setNumCalendarEvents:(unint64_t)a3
{
  self->_numCalendarEvents = a3;
}

- (unint64_t)numCalendarEventsWithLink
{
  return self->_numCalendarEventsWithLink;
}

- (void)setNumCalendarEventsWithLink:(unint64_t)a3
{
  self->_numCalendarEventsWithLink = a3;
}

- (unint64_t)numCalendarEventsWithLocation
{
  return self->_numCalendarEventsWithLocation;
}

- (void)setNumCalendarEventsWithLocation:(unint64_t)a3
{
  self->_numCalendarEventsWithLocation = a3;
}

- (NSString)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setTrialDeploymentId:(id)a3
{
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setTrialExperimentId:(id)a3
{
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
}

- (NSString)atxTrialDeploymentId
{
  return self->_atxTrialDeploymentId;
}

- (void)setAtxTrialDeploymentId:(id)a3
{
}

- (NSString)atxTrialExperimentId
{
  return self->_atxTrialExperimentId;
}

- (void)setAtxTrialExperimentId:(id)a3
{
}

- (NSString)atxTrialTreatmentId
{
  return self->_atxTrialTreatmentId;
}

- (void)setAtxTrialTreatmentId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atxTrialTreatmentId, 0);
  objc_storeStrong((id *)&self->_atxTrialExperimentId, 0);
  objc_storeStrong((id *)&self->_atxTrialDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
}

@end