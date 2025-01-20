@interface EKTTLEventTracker
+ (id)_valueForAlertType:(unint64_t)a3;
+ (id)_valueForETAType:(unint64_t)a3;
+ (id)_valueForTransportType:(unint64_t)a3;
+ (id)_valueForTravelState:(unint64_t)a3;
+ (void)trackDirectionsEngagedForTTLAlertWithTransportType:(unint64_t)a3 etaType:(unint64_t)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6;
+ (void)trackEmailEngagedForTTLAlertWithTransportType:(unint64_t)a3 etaType:(unint64_t)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6;
+ (void)trackEventFiredTTLAlertWithAlertType:(unint64_t)a3 transportType:(unint64_t)a4 etaType:(unint64_t)a5 travelState:(unint64_t)a6 hasSuggestedLocation:(BOOL)a7 isOnSharedCalendar:(BOOL)a8;
+ (void)trackTTLCandidateEventHasSuggestedLocation:(BOOL)a3 isOnSharedCalendar:(BOOL)a4;
@end

@implementation EKTTLEventTracker

+ (void)trackTTLCandidateEventHasSuggestedLocation:(BOOL)a3 isOnSharedCalendar:(BOOL)a4
{
  BOOL v4 = a4;
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"hasSuggestedLocation";
  v5 = [NSNumber numberWithBool:a3];
  v8[1] = @"isOnSharedCalendar";
  v9[0] = v5;
  v6 = [NSNumber numberWithBool:v4];
  v9[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  CalAnalyticsSendEvent(@"CalendarEventTTL.ttlCandidateEvent", v7);
}

+ (void)trackEventFiredTTLAlertWithAlertType:(unint64_t)a3 transportType:(unint64_t)a4 etaType:(unint64_t)a5 travelState:(unint64_t)a6 hasSuggestedLocation:(BOOL)a7 isOnSharedCalendar:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  v22[6] = *MEMORY[0x1E4F143B8];
  v21[0] = @"alertType";
  v14 = [a1 _valueForAlertType:a3];
  v22[0] = v14;
  v21[1] = @"transportType";
  v15 = [a1 _valueForTransportType:a4];
  v22[1] = v15;
  v21[2] = @"etaType";
  v16 = [a1 _valueForETAType:a5];
  v22[2] = v16;
  v21[3] = @"travelState";
  v17 = [a1 _valueForTravelState:a6];
  v22[3] = v17;
  v21[4] = @"hasSuggestedLocation";
  v18 = [NSNumber numberWithBool:v9];
  v22[4] = v18;
  v21[5] = @"isOnSharedCalendar";
  v19 = [NSNumber numberWithBool:v8];
  v22[5] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:6];

  CalAnalyticsSendEvent(@"CalendarEventTTL.eventFiredTTLAlert", v20);
}

+ (void)trackDirectionsEngagedForTTLAlertWithTransportType:(unint64_t)a3 etaType:(unint64_t)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v16[4] = *MEMORY[0x1E4F143B8];
  v15[0] = @"transportType";
  v10 = [a1 _valueForTransportType:a3];
  v16[0] = v10;
  v15[1] = @"etaType";
  v11 = [a1 _valueForETAType:a4];
  v16[1] = v11;
  v15[2] = @"hasSuggestedLocation";
  v12 = [NSNumber numberWithBool:v7];
  v16[2] = v12;
  v15[3] = @"isOnSharedCalendar";
  v13 = [NSNumber numberWithBool:v6];
  v16[3] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  CalAnalyticsSendEvent(@"CalendarEventTTL.directionsEngaged", v14);
}

+ (void)trackEmailEngagedForTTLAlertWithTransportType:(unint64_t)a3 etaType:(unint64_t)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v16[4] = *MEMORY[0x1E4F143B8];
  v15[0] = @"transportType";
  v10 = [a1 _valueForTransportType:a3];
  v16[0] = v10;
  v15[1] = @"etaType";
  v11 = [a1 _valueForETAType:a4];
  v16[1] = v11;
  v15[2] = @"hasSuggestedLocation";
  v12 = [NSNumber numberWithBool:v7];
  v16[2] = v12;
  v15[3] = @"isOnSharedCalendar";
  v13 = [NSNumber numberWithBool:v6];
  v16[3] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  CalAnalyticsSendEvent(@"CalendarEventTTL.emailEngaged", v14);
}

+ (id)_valueForAlertType:(unint64_t)a3
{
  v3 = @"Approaching Departure";
  if (a3 == 1) {
    v3 = @"Leave Now";
  }
  if (a3 == 2) {
    return @"Late";
  }
  else {
    return v3;
  }
}

+ (id)_valueForTransportType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return (id)*((void *)&off_1E56CD6D0 + a3 - 1);
  }
}

+ (id)_valueForETAType:(unint64_t)a3
{
  v3 = @"Short";
  if (a3 == 1) {
    v3 = @"Medium";
  }
  if (a3 == 2) {
    return @"Long";
  }
  else {
    return v3;
  }
}

+ (id)_valueForTravelState:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return (id)*((void *)&off_1E56CD6E8 + a3 - 1);
  }
}

@end