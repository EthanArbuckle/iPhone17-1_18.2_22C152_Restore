@interface NavdAnalytics
- (void)addValueForKey:(const char *)a3 value:(unint64_t)a4;
- (void)recordETAUpdatesAfterEventStart:(unint64_t)a3;
- (void)recordEarlyDepartureDelta:(double)a3 lateDepartureDelta:(double)a4 earlyArrivalDelta:(double)a5 lateArrivalDelta:(double)a6 rerouteCount:(unint64_t)a7 uiNotification:(unint64_t)a8;
- (void)recordHypothesisCount:(unint64_t)a3 forClient:(id)a4;
- (void)recordHypothesisCountPerHypothesizer:(unint64_t)a3;
- (void)recordHypothesisReroutes:(unint64_t)a3;
- (void)recordInitialTravelTime:(double)a3;
- (void)recordUniqueHypothesis;
@end

@implementation NavdAnalytics

- (void)addValueForKey:(const char *)a3 value:(unint64_t)a4
{
  id v4 = [objc_alloc((Class)NSString) initWithUTF8String:a3];
  AnalyticsSendEventLazy();
}

- (void)recordEarlyDepartureDelta:(double)a3 lateDepartureDelta:(double)a4 earlyArrivalDelta:(double)a5 lateArrivalDelta:(double)a6 rerouteCount:(unint64_t)a7 uiNotification:(unint64_t)a8
{
  if ((~(_BYTE)a8 & 3) != 0) {
    unsigned int v8 = 1;
  }
  else {
    unsigned int v8 = 3;
  }
  if (a8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = a8 & 2;
  }
  +[GEOAPPortal captureTimeToLeaveHypothesisEventWithEarlyDepartureDelta:a7 lateDepartureDelta:v9 earlyArrivalDelta:a3 lateArrivalDelta:a4 rerouteCount:a5 uiNotification:a6];
}

- (void)recordHypothesisCount:(unint64_t)a3 forClient:(id)a4
{
  id v7 = a4;
  if ([v7 isCalendarClientInfo])
  {
    v6 = "com.apple.navd.hypothesisSentToCal";
  }
  else
  {
    if (![v7 isNavdClientInfo]) {
      goto LABEL_6;
    }
    v6 = "com.apple.navd.hypothesisSentToRoutine";
  }
  [(NavdAnalytics *)self addValueForKey:v6 value:a3];
LABEL_6:
}

- (void)recordUniqueHypothesis
{
}

- (void)recordHypothesisReroutes:(unint64_t)a3
{
}

- (void)recordETAUpdatesAfterEventStart:(unint64_t)a3
{
}

- (void)recordInitialTravelTime:(double)a3
{
}

- (void)recordHypothesisCountPerHypothesizer:(unint64_t)a3
{
}

@end