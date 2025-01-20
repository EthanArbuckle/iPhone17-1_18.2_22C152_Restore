@interface GEORouteHypothesizerAnalyticsStore
+ (BOOL)supportsSecureCoding;
- (BOOL)etaUpdatesWereReported;
- (GEORouteHypothesizerAnalyticsStore)init;
- (GEORouteHypothesizerAnalyticsStore)initWithCoder:(id)a3;
- (unint64_t)etaUpdatesAfterEventStart;
- (void)dealloc;
- (void)didArriveWithExpectedArrivalTime:(id)a3;
- (void)didGenerateHypothesis;
- (void)didReroute;
- (void)didShowUI:(unint64_t)a3;
- (void)didStartMovingWithExpectedDepartureTime:(id)a3;
- (void)didStopHypothesizing;
- (void)didStopMoving;
- (void)encodeWithCoder:(id)a3;
- (void)setEtaUpdatesAfterEventStart:(unint64_t)a3;
- (void)setEtaUpdatesWereReported:(BOOL)a3;
@end

@implementation GEORouteHypothesizerAnalyticsStore

- (GEORouteHypothesizerAnalyticsStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)GEORouteHypothesizerAnalyticsStore;
  v2 = [(GEORouteHypothesizerAnalyticsStore *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v3 timeIntervalSinceReferenceDate];
    v2->_observedEarlyDeltaFromRequiredTimeToLeave = v4;

    v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v5 timeIntervalSinceReferenceDate];
    v2->_observedLateDeltaFromRequiredTimeToLeave = v6;

    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  lastGenerationDate = self->_lastGenerationDate;
  self->_lastGenerationDate = 0;

  v4.receiver = self;
  v4.super_class = (Class)GEORouteHypothesizerAnalyticsStore;
  [(GEORouteHypothesizerAnalyticsStore *)&v4 dealloc];
}

- (void)didReroute
{
  if (!self->_stopped) {
    ++self->_hypothesizerRerouteCount;
  }
}

- (void)didStartMovingWithExpectedDepartureTime:(id)a3
{
  id v4 = a3;
  if (!self->_stopped)
  {
    id v9 = v4;
    if (self->_lastGenerationDate)
    {
      objc_msgSend(v4, "timeIntervalSinceDate:");
      self->_observedEarlyDeltaFromRequiredTimeToLeave = -v5;
    }
    else
    {
      double v6 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v6 timeIntervalSinceReferenceDate];
      self->_observedEarlyDeltaFromRequiredTimeToLeave = v7;
    }
    [v9 timeIntervalSinceNow];
    self->_observedLateDeltaFromRequiredTimeToLeave = -v8;
    id v4 = v9;
  }
}

- (void)didStopMoving
{
  if (!self->_stopped)
  {
    v3 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v3 timeIntervalSinceReferenceDate];
    self->_observedEarlyDeltaFromRequiredTimeToLeave = v4;

    id v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v6 timeIntervalSinceReferenceDate];
    self->_observedLateDeltaFromRequiredTimeToLeave = v5;
  }
}

- (void)didArriveWithExpectedArrivalTime:(id)a3
{
  id v4 = a3;
  if (!self->_stopped)
  {
    id v20 = v4;
    if (self->_lastGenerationDate)
    {
      objc_msgSend(v4, "timeIntervalSinceDate:");
      double v6 = -v5;
    }
    else
    {
      double v7 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v7 timeIntervalSinceReferenceDate];
      double v6 = v8;
    }
    [v20 timeIntervalSinceNow];
    double v10 = -v9;
    double observedLateDeltaFromRequiredTimeToLeave = self->_observedLateDeltaFromRequiredTimeToLeave;
    v12 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v12 timeIntervalSinceReferenceDate];
    double v14 = v13;

    BOOL v15 = observedLateDeltaFromRequiredTimeToLeave == v14;
    double observedEarlyDeltaFromRequiredTimeToLeave = v6;
    double v17 = v10;
    if (!v15)
    {
      double observedEarlyDeltaFromRequiredTimeToLeave = self->_observedEarlyDeltaFromRequiredTimeToLeave;
      double v17 = self->_observedLateDeltaFromRequiredTimeToLeave;
    }
    v18 = +[GEONavdAnalyticsManager sharedManager];
    v19 = [v18 analyticsReporter];
    [v19 recordEarlyDepartureDelta:self->_hypothesizerRerouteCount lateDepartureDelta:self->_uiNotificationType earlyArrivalDelta:observedEarlyDeltaFromRequiredTimeToLeave lateArrivalDelta:v17 rerouteCount:v6 uiNotification:v10];

    id v4 = v20;
  }
}

- (void)didGenerateHypothesis
{
  if (!self->_stopped)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    lastGenerationDate = self->_lastGenerationDate;
    self->_lastGenerationDate = v3;

    double v5 = +[GEONavdAnalyticsManager sharedManager];
    double v6 = [v5 analyticsReporter];
    [v6 recordUniqueHypothesis];

    ++self->_hypothesisCount;
  }
}

- (void)didStopHypothesizing
{
  if (!self->_stopped)
  {
    v3 = +[GEONavdAnalyticsManager sharedManager];
    id v4 = [v3 analyticsReporter];

    [v4 recordHypothesisReroutes:self->_hypothesizerRerouteCount];
    [v4 recordHypothesisCountPerHypothesizer:self->_hypothesisCount];
    self->_stopped = 1;
  }
}

- (void)didShowUI:(unint64_t)a3
{
  self->_uiNotificationType = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  double observedEarlyDeltaFromRequiredTimeToLeave = self->_observedEarlyDeltaFromRequiredTimeToLeave;
  id v13 = a3;
  double v6 = [v4 numberWithDouble:observedEarlyDeltaFromRequiredTimeToLeave];
  [v13 encodeObject:v6 forKey:@"observedEarlyDeltaFromRequiredTimeToLeave"];

  double v7 = [NSNumber numberWithDouble:self->_observedLateDeltaFromRequiredTimeToLeave];
  [v13 encodeObject:v7 forKey:@"observedDeltaFromRequiredTimeToLeave"];

  double v8 = [NSNumber numberWithUnsignedInteger:self->_hypothesizerRerouteCount];
  [v13 encodeObject:v8 forKey:@"hypothesizerRerouteCount"];

  double v9 = [NSNumber numberWithUnsignedInteger:self->_etaUpdatesAfterEventStart];
  [v13 encodeObject:v9 forKey:@"etaUpdatesAfterEventStart"];

  double v10 = [NSNumber numberWithBool:self->_etaUpdatesWereReported];
  [v13 encodeObject:v10 forKey:@"etaUpdatesWereReported"];

  v11 = [NSNumber numberWithUnsignedInteger:self->_hypothesisCount];
  [v13 encodeObject:v11 forKey:@"hypothesisCount"];

  v12 = [NSNumber numberWithUnsignedInteger:self->_uiNotificationType];
  [v13 encodeObject:v12 forKey:@"uiNotificationType"];

  [v13 encodeObject:self->_lastGenerationDate forKey:@"lastGenerationDate"];
}

- (GEORouteHypothesizerAnalyticsStore)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GEORouteHypothesizerAnalyticsStore;
  double v5 = [(GEORouteHypothesizerAnalyticsStore *)&v23 init];
  if (v5)
  {
    double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"observedEarlyDeltaFromRequiredTimeToLeave"];
    double v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      v5->_double observedEarlyDeltaFromRequiredTimeToLeave = v8;
    }
    else
    {
      double v9 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v9 timeIntervalSinceReferenceDate];
      v5->_double observedEarlyDeltaFromRequiredTimeToLeave = v10;
    }
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"observedDeltaFromRequiredTimeToLeave"];

    if (v11)
    {
      [v11 doubleValue];
      v5->_double observedLateDeltaFromRequiredTimeToLeave = v12;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F1C9C8] distantFuture];
      [v13 timeIntervalSinceReferenceDate];
      v5->_double observedLateDeltaFromRequiredTimeToLeave = v14;
    }
    BOOL v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hypothesizerRerouteCount"];
    v5->_hypothesizerRerouteCount = [v15 unsignedIntegerValue];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"etaUpdatesAfterEventStart"];
    v5->_etaUpdatesAfterEventStart = [v16 unsignedIntegerValue];

    double v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"etaUpdatesWereReported"];
    v5->_etaUpdatesWereReported = [v17 BOOLValue];

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hypothesisCount"];
    v5->_hypothesisCount = [v18 unsignedIntegerValue];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uiNotificationType"];
    v5->_uiNotificationType = [v19 unsignedIntegerValue];

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastGenerationDate"];
    lastGenerationDate = v5->_lastGenerationDate;
    v5->_lastGenerationDate = (NSDate *)v20;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)etaUpdatesAfterEventStart
{
  return self->_etaUpdatesAfterEventStart;
}

- (void)setEtaUpdatesAfterEventStart:(unint64_t)a3
{
  self->_etaUpdatesAfterEventStart = a3;
}

- (BOOL)etaUpdatesWereReported
{
  return self->_etaUpdatesWereReported;
}

- (void)setEtaUpdatesWereReported:(BOOL)a3
{
  self->_etaUpdatesWereReported = a3;
}

- (void).cxx_destruct
{
}

@end