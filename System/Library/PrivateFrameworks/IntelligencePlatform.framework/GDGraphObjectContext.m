@interface GDGraphObjectContext
- (id)graphActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphActivityEventTypeFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphAttendingAPerformanceActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphBehaviorActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphBicyclingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphCalendarEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphCommunicatingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphCommuteActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphDiningActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphDrivingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphEatingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphExercisingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphFacetimeActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphGamingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphGoingToBedActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphHikingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphLocationFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphLocationVisitActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphMeetingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphMindfulnessActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphModeOfTransportationFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphObjectFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphOnThePhoneActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphOrganizationFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphPersonFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphReadingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphRunningActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphShoppingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphSleepingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphSocializingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphSoftwareFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphSongEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphSongFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphSportsGameEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphSportsTeamFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphStationaryActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphTopicFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphTransportationActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphTravelingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphVacationingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphWakingUpActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphWalkingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphWatchingTVActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
- (id)graphWorkingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4;
@end

@implementation GDGraphObjectContext

- (id)graphObjectFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphObjectFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphSoftwareFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphSoftwareFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphModeOfTransportationFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphModeOfTransportationFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphActivityEventTypeFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphActivityEventTypeFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphSongFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphSongFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphTopicFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphTopicFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphPersonFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphPersonFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphSportsTeamFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphSportsTeamFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphOrganizationFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphOrganizationFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphLocationFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphLocationFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphSongEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphSongEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphCalendarEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphCalendarEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphBehaviorActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphBehaviorActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphDrivingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphDrivingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphFacetimeActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphFacetimeActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphOnThePhoneActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphOnThePhoneActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphHikingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphHikingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphBicyclingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphBicyclingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphRunningActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphRunningActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphWalkingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphWalkingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphLocationVisitActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphLocationVisitActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphStationaryActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphStationaryActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphAttendingAPerformanceActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphAttendingAPerformanceActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphDiningActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphDiningActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphCommuteActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphCommuteActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphExercisingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphExercisingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphGoingToBedActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphGoingToBedActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphWakingUpActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphWakingUpActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphSocializingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphSocializingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphGamingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphGamingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphVacationingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphVacationingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphReadingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphReadingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphTravelingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphTravelingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphSleepingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphSleepingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphMindfulnessActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphMindfulnessActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphShoppingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphShoppingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphCommunicatingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphCommunicatingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphWatchingTVActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphWatchingTVActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphEatingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphEatingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphMeetingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphMeetingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphWorkingActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphWorkingActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphTransportationActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphTransportationActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphSportsGameEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphSportsGameEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphActivityEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphActivityEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

- (id)graphEventFromEntityIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_context(self, v7, v8, v9, v10);
  v14 = objc_msgSend_graphEventFrom_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  return v14;
}

@end