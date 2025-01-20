@interface CALNTimeToLeaveEventTrackerUtilities
+ (id)ttlEventTrackerAlertTypeForTravelAdvisoryTimelinessPeriod:(unint64_t)a3;
+ (unint64_t)ttlEventTrackerAlertTypeForDate:(id)a3 hypothesis:(id)a4;
+ (unint64_t)ttlEventTrackerETATypeForHypothesis:(id)a3;
+ (unint64_t)ttlEventTrackerTransportTypeForGEOTransportType:(int)a3;
+ (unint64_t)ttlEventTrackerTravelStateForHypothesisTravelState:(int64_t)a3;
+ (void)trackDirectionsEngagedForNotificationUsingTTLEventTracker:(id)a3 hypothesis:(id)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6;
+ (void)trackEmailEngagedForNotificationUsingTTLEventTracker:(id)a3 hypothesis:(id)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6;
@end

@implementation CALNTimeToLeaveEventTrackerUtilities

+ (unint64_t)ttlEventTrackerAlertTypeForDate:(id)a3 hypothesis:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([MEMORY[0x263F04C18] date:v5 representsLatenessForHypothesis:v6]) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = [MEMORY[0x263F04C18] date:v5 representsApproachingDepartureDateForHypothesis:v6] ^ 1;
  }

  return v7;
}

+ (unint64_t)ttlEventTrackerTransportTypeForGEOTransportType:(int)a3
{
  if (a3 < 3) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (unint64_t)ttlEventTrackerETATypeForHypothesis:(id)a3
{
  [a3 estimatedTravelTime];
  double v4 = v3 / 60.0;
  unint64_t v5 = 2;
  if (v4 < 45.0) {
    unint64_t v5 = 1;
  }
  if (v4 >= 10.0) {
    return v5;
  }
  else {
    return 0;
  }
}

+ (unint64_t)ttlEventTrackerTravelStateForHypothesisTravelState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 1;
  }
  else {
    return qword_221719CC0[a3 - 1];
  }
}

+ (id)ttlEventTrackerAlertTypeForTravelAdvisoryTimelinessPeriod:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return *(&off_2645C0CA8 + a3 - 1);
  }
}

+ (void)trackDirectionsEngagedForNotificationUsingTTLEventTracker:(id)a3 hypothesis:(id)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a4;
  id v12 = a3;
  unint64_t v10 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerTransportTypeForGEOTransportType:](CALNTimeToLeaveEventTrackerUtilities, "ttlEventTrackerTransportTypeForGEOTransportType:", [v9 transportType]);
  unint64_t v11 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerETATypeForHypothesis:v9];

  [v12 trackDirectionsEngagedForTTLAlertWithTransportType:v10 etaType:v11 hasSuggestedLocation:v7 isOnSharedCalendar:v6];
}

+ (void)trackEmailEngagedForNotificationUsingTTLEventTracker:(id)a3 hypothesis:(id)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a4;
  id v12 = a3;
  unint64_t v10 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerTransportTypeForGEOTransportType:](CALNTimeToLeaveEventTrackerUtilities, "ttlEventTrackerTransportTypeForGEOTransportType:", [v9 transportType]);
  unint64_t v11 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerETATypeForHypothesis:v9];

  [v12 trackEmailEngagedForTTLAlertWithTransportType:v10 etaType:v11 hasSuggestedLocation:v7 isOnSharedCalendar:v6];
}

@end