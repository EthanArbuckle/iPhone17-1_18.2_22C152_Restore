@interface HMDUserActivityType6CoreLocationTracker
- (BOOL)_shouldHandleVisitEntryOrScheduleShortStopTimerForVisit:(id)a3;
- (BOOL)estimateInProgress;
- (BOOL)stateRequiresLongerVisitDuration;
- (HMDHomeActivityStateManagerDataSource)dataSource;
- (HMDLocation)locationManager;
- (HMDUserActivityType6CoreLocationTracker)initWithDataSource:(id)a3 locationManager:(id)a4;
- (HMDUserActivityType6ListenerDelegate)delegate;
- (HMDUserActivityType6StateEvent)currentStateEvent;
- (HMDUserType6Prediction)prediction;
- (NSDate)changedTimestamp;
- (NSDate)closestDistanceTimestamp;
- (NSDate)stateEnd;
- (NSString)ignoreShortStopTimerIdentifier;
- (double)closestDistance;
- (int64_t)locationAuthorization;
- (unint64_t)lastReason;
- (unint64_t)state;
- (void)_completeVisitEntryProcessing;
- (void)_handleLocationAuthorization:(int64_t)a3;
- (void)_processSignificantLocationChange:(id)a3;
- (void)_registerForNotifications;
- (void)_registerForRegionUpdatesForDelayFence:(id)a3;
- (void)_requestEstimatedStateEndForUpdateLocation:(id)a3;
- (void)_startComingHomeTrackingWithLocation:(id)a3;
- (void)_stateUpdated;
- (void)_stopComingHomeTracking;
- (void)_unregisterForRegionUpdatesForDelayFence:(id)a3;
- (void)_updateStateEnd:(id)a3;
- (void)configureWithDelegate:(id)a3;
- (void)didDetermineState:(int64_t)a3 forRegion:(id)a4;
- (void)handleBackgroundTaskTimerFired:(id)a3;
- (void)handleDidArriveNotification:(id)a3;
- (void)handleLocationAuthorizationChangedNotification:(id)a3;
- (void)handleLocationChangedNotification:(id)a3;
- (void)setChangedTimestamp:(id)a3;
- (void)setClosestDistance:(double)a3;
- (void)setClosestDistanceTimestamp:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEstimateInProgress:(BOOL)a3;
- (void)setIgnoreShortStopTimerIdentifier:(id)a3;
- (void)setLastReason:(unint64_t)a3;
- (void)setLocationAuthorization:(int64_t)a3;
- (void)setPrediction:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateEnd:(id)a3;
- (void)updatedSignificantLocation:(id)a3;
- (void)visitEntry:(id)a3;
- (void)visitExit:(id)a3 nextPredictedLocations:(id)a4 error:(id)a5;
@end

@implementation HMDUserActivityType6CoreLocationTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreShortStopTimerIdentifier, 0);
  objc_storeStrong((id *)&self->_closestDistanceTimestamp, 0);
  objc_storeStrong((id *)&self->_prediction, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_changedTimestamp, 0);
  objc_storeStrong((id *)&self->_stateEnd, 0);
}

- (void)setIgnoreShortStopTimerIdentifier:(id)a3
{
}

- (NSString)ignoreShortStopTimerIdentifier
{
  return self->_ignoreShortStopTimerIdentifier;
}

- (void)setEstimateInProgress:(BOOL)a3
{
  self->_estimateInProgress = a3;
}

- (BOOL)estimateInProgress
{
  return self->_estimateInProgress;
}

- (void)setClosestDistanceTimestamp:(id)a3
{
}

- (NSDate)closestDistanceTimestamp
{
  return self->_closestDistanceTimestamp;
}

- (void)setClosestDistance:(double)a3
{
  self->_closestDistance = a3;
}

- (double)closestDistance
{
  return self->_closestDistance;
}

- (void)setPrediction:(id)a3
{
}

- (HMDUserType6Prediction)prediction
{
  return self->_prediction;
}

- (void)setLocationAuthorization:(int64_t)a3
{
  self->_locationAuthorization = a3;
}

- (int64_t)locationAuthorization
{
  return self->_locationAuthorization;
}

- (HMDLocation)locationManager
{
  return self->_locationManager;
}

- (HMDHomeActivityStateManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDelegate:(id)a3
{
}

- (HMDUserActivityType6ListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDUserActivityType6ListenerDelegate *)WeakRetained;
}

- (void)handleBackgroundTaskTimerFired:(id)a3
{
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"HMD.BGTM.NK"];

  v6 = [(HMDUserActivityType6CoreLocationTracker *)self ignoreShortStopTimerIdentifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    v8 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
    v9 = [v8 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__HMDUserActivityType6CoreLocationTracker_handleBackgroundTaskTimerFired___block_invoke;
    block[3] = &unk_264A2F7F8;
    block[4] = self;
    dispatch_async(v9, block);
  }
}

uint64_t __74__HMDUserActivityType6CoreLocationTracker_handleBackgroundTaskTimerFired___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeVisitEntryProcessing];
}

- (void)_requestEstimatedStateEndForUpdateLocation:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  if (![(HMDUserActivityType6CoreLocationTracker *)self estimateInProgress])
  {
    int v7 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
    v8 = [v7 home];
    v9 = [v8 homeLocationHandler];
    v10 = [v9 location];

    if (v10)
    {
      [(HMDUserActivityType6CoreLocationTracker *)self setEstimateInProgress:1];
      objc_initWeak(&location, self);
      v11 = [(HMDUserActivityType6CoreLocationTracker *)self locationManager];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __86__HMDUserActivityType6CoreLocationTracker__requestEstimatedStateEndForUpdateLocation___block_invoke;
      v12[3] = &unk_264A2E480;
      objc_copyWeak(&v13, &location);
      [v11 requestETAFromCurrentLocation:v4 destination:v10 completionHandler:v12];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __86__HMDUserActivityType6CoreLocationTracker__requestEstimatedStateEndForUpdateLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = [WeakRetained dataSource];
    v10 = [v9 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__HMDUserActivityType6CoreLocationTracker__requestEstimatedStateEndForUpdateLocation___block_invoke_2;
    block[3] = &unk_264A2F2F8;
    block[4] = v8;
    id v12 = v6;
    id v13 = v5;
    dispatch_async(v10, block);
  }
}

uint64_t __86__HMDUserActivityType6CoreLocationTracker__requestEstimatedStateEndForUpdateLocation___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setEstimateInProgress:0];
  if (!*(void *)(a1 + 40) && *(void *)(a1 + 48))
  {
    v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_updateStateEnd:");
  }
  return result;
}

- (void)_updateStateEnd:(id)a3
{
  id v17 = a3;
  id v4 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  id v5 = [v4 queue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDUserActivityType6CoreLocationTracker *)self state] == 2)
  {
    id v6 = [(HMDUserActivityType6CoreLocationTracker *)self stateEnd];

    if (!v6) {
      goto LABEL_9;
    }
    int v7 = [(HMDUserActivityType6CoreLocationTracker *)self prediction];
    uint64_t v8 = [v7 nextEntryTime];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(HMDUserActivityType6CoreLocationTracker *)self prediction];
      v11 = [v10 nextEntryTime];
      uint64_t v12 = [v11 compare:v17];

      if (v12 == 1) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    id v13 = [(HMDUserActivityType6CoreLocationTracker *)self stateEnd];
    [v13 timeIntervalSinceDate:v17];
    double v15 = v14;

    double v16 = fabs(v15);
    if (v16 >= 600.0 || fabs(v16 + -600.0) < 2.22044605e-16)
    {
LABEL_9:
      [(HMDUserActivityType6CoreLocationTracker *)self setStateEnd:v17];
      [(HMDUserActivityType6CoreLocationTracker *)self setLastReason:11];
      [(HMDUserActivityType6CoreLocationTracker *)self _stateUpdated];
    }
  }
LABEL_10:
}

- (void)updatedSignificantLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  id v6 = [v5 queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__HMDUserActivityType6CoreLocationTracker_updatedSignificantLocation___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __70__HMDUserActivityType6CoreLocationTracker_updatedSignificantLocation___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2)
  {
    v2 = [*(id *)(a1 + 40) lastObject];
    if (v2)
    {
      v3 = v2;
      [*(id *)(a1 + 32) _processSignificantLocationChange:v2];
      v2 = v3;
    }
  }
}

- (void)_processSignificantLocationChange:(id)a3
{
  id v18 = a3;
  id v4 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  id v5 = [v4 queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v18 timestamp];
  id v7 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  uint64_t v8 = [v7 home];
  id v9 = [v8 homeLocationHandler];
  v10 = [v9 location];

  [v10 distanceFromLocation:v18];
  double v12 = v11;
  if (v11 <= 0.0 && fabs(v11) >= 2.22044605e-16
    || ([(HMDUserActivityType6CoreLocationTracker *)self closestDistance], v12 >= v13)
    || vabdd_f64(v12, v13) < 2.22044605e-16)
  {
    [(HMDUserActivityType6CoreLocationTracker *)self closestDistance];
    if (v12 > v14 && vabdd_f64(v12, v14) >= 2.22044605e-16)
    {
      [(HMDUserActivityType6CoreLocationTracker *)self closestDistance];
      double v16 = v15 * 1.4;
      if (v12 <= v16 || vabdd_f64(v12, v16) < 2.22044605e-16)
      {
        id v17 = [(HMDUserActivityType6CoreLocationTracker *)self closestDistanceTimestamp];
        [v6 timeIntervalSinceDate:v17];
      }
    }
  }
  else
  {
    [(HMDUserActivityType6CoreLocationTracker *)self setClosestDistance:v12];
    [(HMDUserActivityType6CoreLocationTracker *)self setClosestDistanceTimestamp:v6];
  }
  [(HMDUserActivityType6CoreLocationTracker *)self _requestEstimatedStateEndForUpdateLocation:v18];
}

- (void)visitEntry:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  id v6 = [v5 queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__HMDUserActivityType6CoreLocationTracker_visitEntry___block_invoke;
  v8[3] = &unk_264A2F820;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __54__HMDUserActivityType6CoreLocationTracker_visitEntry___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _shouldHandleVisitEntryOrScheduleShortStopTimerForVisit:*(void *)(a1 + 40)];
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 _completeVisitEntryProcessing];
  }
  return result;
}

- (void)_completeVisitEntryProcessing
{
  v3 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  unint64_t v5 = [(HMDUserActivityType6CoreLocationTracker *)self state];
  id v6 = [HMDUserActivityStateType6DetectorTransitionLogEvent alloc];
  if (v5 == 2) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 10;
  }
  double v11 = [(HMDUserActivityStateType6DetectorTransitionLogEvent *)v6 initWithTrackerType:2 reason:v7];
  uint64_t v8 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  id v9 = [v8 logEventSubmitter];
  [v9 submitLogEvent:v11];

  v10 = [(HMDUserActivityType6CoreLocationTracker *)self prediction];
  [(HMDUserActivityType6CoreLocationTracker *)self _unregisterForRegionUpdatesForDelayFence:v10];

  [(HMDUserActivityType6CoreLocationTracker *)self setPrediction:0];
  [(HMDUserActivityType6CoreLocationTracker *)self _stopComingHomeTracking];
}

- (BOOL)_shouldHandleVisitEntryOrScheduleShortStopTimerForVisit:(id)a3
{
  id v4 = a3;
  if ([(HMDUserActivityType6CoreLocationTracker *)self stateRequiresLongerVisitDuration])
  {
    unint64_t v5 = [v4 arrivalDate];
    if (!v5) {
      goto LABEL_5;
    }
    id v6 = [MEMORY[0x263EFF910] distantPast];
    char v7 = [v5 isEqualToDate:v6];

    if (v7) {
      goto LABEL_5;
    }
    uint64_t v8 = [(HMDUserActivityType6CoreLocationTracker *)self prediction];
    [v8 maxVisitDurationDuringComingHomeForVisit:v4];
    double v10 = v9;

    if (fabs(v10) >= 2.22044605e-16)
    {
      double v13 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
      double v14 = [v13 currentDate];

      double v15 = [v5 dateByAddingTimeInterval:v10];
      if ([v14 compare:v15] == -1)
      {
        double v16 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
        id v17 = [v16 backgroundTaskManager];
        id v18 = [(HMDUserActivityType6CoreLocationTracker *)self ignoreShortStopTimerIdentifier];
        uint64_t v20 = 0;
        char v19 = [v17 scheduleTaskWithIdentifier:v18 fireDate:v15 onObserver:self selector:sel_handleBackgroundTaskTimerFired_ error:&v20];

        char v11 = v19 ^ 1;
      }
      else
      {
        char v11 = 1;
      }
    }
    else
    {
LABEL_5:
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (BOOL)stateRequiresLongerVisitDuration
{
  v3 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  if ([(HMDUserActivityType6CoreLocationTracker *)self state] == 2) {
    return 1;
  }
  id v6 = [(HMDUserActivityType6CoreLocationTracker *)self prediction];
  if (v6)
  {
    char v7 = [(HMDUserActivityType6CoreLocationTracker *)self prediction];
    char v5 = [v7 hasDelayAction];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)visitExit:(id)a3 nextPredictedLocations:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    double v10 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
    char v11 = [v10 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__HMDUserActivityType6CoreLocationTracker_visitExit_nextPredictedLocations_error___block_invoke;
    block[3] = &unk_264A2F2F8;
    block[4] = self;
    id v13 = v8;
    id v14 = v9;
    dispatch_async(v11, block);
  }
}

void __82__HMDUserActivityType6CoreLocationTracker_visitExit_nextPredictedLocations_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataSource];
  v3 = [v2 home];
  id v4 = [v3 homeLocationHandler];
  id v26 = [v4 location];

  if (v26)
  {
    char v5 = [*(id *)(a1 + 32) dataSource];
    id v6 = [v5 backgroundTaskManager];
    char v7 = [*(id *)(a1 + 32) ignoreShortStopTimerIdentifier];
    int v8 = [v6 hasOutstandingTaskWithIdentifier:v7];

    id v9 = *(void **)(a1 + 32);
    if (v8)
    {
      double v10 = [*(id *)(a1 + 32) dataSource];
      char v11 = [(HMDUserActivityStateType6DetectorTransitionLogEvent *)v10 backgroundTaskManager];
      double v12 = [*(id *)(a1 + 32) ignoreShortStopTimerIdentifier];
      [v11 cancelTaskWithIdentifier:v12 onObserver:*(void *)(a1 + 32)];
    }
    else
    {
      id v13 = [*(id *)(a1 + 32) prediction];
      [v9 _unregisterForRegionUpdatesForDelayFence:v13];

      id v14 = +[HMDUserType6Prediction predictionToHomeLocation:v26 visitExit:*(void *)(a1 + 40) predictedLocations:*(void *)(a1 + 48)];
      [*(id *)(a1 + 32) setPrediction:v14];

      double v15 = [*(id *)(a1 + 32) prediction];
      uint64_t v16 = [v15 action];

      if (v16 != 3)
      {
        uint64_t v20 = [*(id *)(a1 + 32) state];
        v21 = [HMDUserActivityStateType6DetectorTransitionLogEvent alloc];
        if (v20 == 2) {
          uint64_t v22 = 3;
        }
        else {
          uint64_t v22 = 9;
        }
        double v10 = [(HMDUserActivityStateType6DetectorTransitionLogEvent *)v21 initWithTrackerType:2 reason:v22];
        v23 = [*(id *)(a1 + 32) dataSource];
        v24 = [v23 logEventSubmitter];
        [v24 submitLogEvent:v10];

        [*(id *)(a1 + 32) _stopComingHomeTracking];
        v25 = *(void **)(a1 + 32);
        char v11 = [v25 prediction];
        [v25 _registerForRegionUpdatesForDelayFence:v11];
        goto LABEL_11;
      }
      double v10 = [[HMDUserActivityStateType6DetectorTransitionLogEvent alloc] initWithTrackerType:2 reason:1];
      id v17 = [*(id *)(a1 + 32) dataSource];
      id v18 = [v17 logEventSubmitter];
      [v18 submitLogEvent:v10];

      char v19 = *(void **)(a1 + 32);
      char v11 = [v19 prediction];
      double v12 = [v11 visitExitLocation];
      [v19 _startComingHomeTrackingWithLocation:v12];
    }

LABEL_11:
  }
}

- (void)_stopComingHomeTracking
{
  v3 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  char v5 = [(HMDUserActivityType6CoreLocationTracker *)self locationManager];
  LODWORD(v4) = [v5 isVisitMonitoringAllowed];

  unint64_t v6 = [(HMDUserActivityType6CoreLocationTracker *)self state];
  if (v4)
  {
    if (v6 == 3) {
      return;
    }
    uint64_t v7 = 3;
  }
  else
  {
    if (v6 == 1) {
      return;
    }
    uint64_t v7 = 1;
  }
  [(HMDUserActivityType6CoreLocationTracker *)self setState:v7];
  [(HMDUserActivityType6CoreLocationTracker *)self setStateEnd:0];
  [(HMDUserActivityType6CoreLocationTracker *)self setChangedTimestamp:0];
  [(HMDUserActivityType6CoreLocationTracker *)self setLastReason:11];
  [(HMDUserActivityType6CoreLocationTracker *)self setClosestDistance:-1.0];
  [(HMDUserActivityType6CoreLocationTracker *)self setClosestDistanceTimestamp:0];
  int v8 = [(HMDUserActivityType6CoreLocationTracker *)self locationManager];
  [v8 unregisterForSignificantLocationChangeMonitoring:self];

  [(HMDUserActivityType6CoreLocationTracker *)self _stateUpdated];
}

- (void)_startComingHomeTrackingWithLocation:(id)a3
{
  id v18 = a3;
  id v4 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  char v5 = [v4 queue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDUserActivityType6CoreLocationTracker *)self state] != 2)
  {
    unint64_t v6 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
    uint64_t v7 = [v6 currentDate];
    [(HMDUserActivityType6CoreLocationTracker *)self setChangedTimestamp:v7];
  }
  [(HMDUserActivityType6CoreLocationTracker *)self setState:2];
  int v8 = [(HMDUserActivityType6CoreLocationTracker *)self prediction];
  id v9 = [v8 predictedLocationOfInterest];
  double v10 = [v9 nextEntryTime];
  [(HMDUserActivityType6CoreLocationTracker *)self setStateEnd:v10];

  [(HMDUserActivityType6CoreLocationTracker *)self setLastReason:11];
  char v11 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  double v12 = [v11 home];
  id v13 = [v12 homeLocationHandler];
  id v14 = [v13 location];

  [v14 distanceFromLocation:v18];
  -[HMDUserActivityType6CoreLocationTracker setClosestDistance:](self, "setClosestDistance:");
  double v15 = [v18 timestamp];
  [(HMDUserActivityType6CoreLocationTracker *)self setClosestDistanceTimestamp:v15];

  uint64_t v16 = [(HMDUserActivityType6CoreLocationTracker *)self stateEnd];

  if (v16) {
    [(HMDUserActivityType6CoreLocationTracker *)self _stateUpdated];
  }
  else {
    [(HMDUserActivityType6CoreLocationTracker *)self _requestEstimatedStateEndForUpdateLocation:v18];
  }
  id v17 = [(HMDUserActivityType6CoreLocationTracker *)self locationManager];
  [v17 registerForSignificantLocationChangeMonitoring:self];
}

- (void)didDetermineState:(int64_t)a3 forRegion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  int v8 = [v7 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HMDUserActivityType6CoreLocationTracker_didDetermineState_forRegion___block_invoke;
  block[3] = &unk_264A2E458;
  block[4] = self;
  id v11 = v6;
  int64_t v12 = a3;
  id v9 = v6;
  dispatch_async(v8, block);
}

void __71__HMDUserActivityType6CoreLocationTracker_didDetermineState_forRegion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) prediction];
  id v10 = [v2 geofenceRegionForDelayAction];

  if (v10)
  {
    v3 = [*(id *)(a1 + 40) identifier];
    id v4 = [v10 identifier];
    int v5 = [v3 isEqualToString:v4];

    if (v5)
    {
      if (objc_msgSend(MEMORY[0x263F00A60], "hm_hmdRegionStateFromCLRegionState:", *(void *)(a1 + 48)) == 1)
      {
        id v6 = [*(id *)(a1 + 32) locationManager];
        uint64_t v7 = [v6 getCurrentLocation];

        int v8 = *(void **)(a1 + 32);
        id v9 = [v8 prediction];
        [v8 _unregisterForRegionUpdatesForDelayFence:v9];

        [*(id *)(a1 + 32) _startComingHomeTrackingWithLocation:v7];
      }
    }
  }
}

- (void)_unregisterForRegionUpdatesForDelayFence:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  id v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    uint64_t v7 = [v4 geofenceRegionForDelayAction];
    if (v7)
    {
      int v8 = [(HMDUserActivityType6CoreLocationTracker *)self locationManager];
      v11[0] = v7;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __84__HMDUserActivityType6CoreLocationTracker__unregisterForRegionUpdatesForDelayFence___block_invoke;
      v10[3] = &unk_264A2F3E8;
      v10[4] = self;
      [v8 deregisterForRegionUpdate:v9 completionHandler:v10];
    }
  }
}

- (void)_registerForRegionUpdatesForDelayFence:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  id v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    uint64_t v7 = [v4 geofenceRegionForDelayAction];
    if (v7)
    {
      int v8 = [(HMDUserActivityType6CoreLocationTracker *)self locationManager];
      v11[0] = v7;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __82__HMDUserActivityType6CoreLocationTracker__registerForRegionUpdatesForDelayFence___block_invoke;
      v10[3] = &unk_264A2F3E8;
      v10[4] = self;
      [v8 registerForRegionUpdate:v9 withDelegate:self completionHandler:v10];
    }
  }
}

- (void)handleDidArriveNotification:(id)a3
{
  id v4 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  int v5 = [v4 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__HMDUserActivityType6CoreLocationTracker_handleDidArriveNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v5, block);
}

void __71__HMDUserActivityType6CoreLocationTracker_handleDidArriveNotification___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2)
  {
    v2 = [*(id *)(a1 + 32) dataSource];
    v3 = [v2 currentDate];
    id v4 = [*(id *)(a1 + 32) stateEnd];
    [v3 timeIntervalSinceDate:v4];
    double v6 = fabs(v5);

    uint64_t v7 = [[HMDUserActivityStateType6DetectorTransitionLogEvent alloc] initWithTrackerType:2 reason:2 stateEndOffset:(uint64_t)v6];
  }
  else
  {
    uint64_t v7 = [[HMDUserActivityStateType6DetectorTransitionLogEvent alloc] initWithTrackerType:1 reason:2];
  }
  int64_t v12 = v7;
  int v8 = [*(id *)(a1 + 32) dataSource];
  id v9 = [v8 logEventSubmitter];
  [v9 submitLogEvent:v12];

  id v10 = *(void **)(a1 + 32);
  id v11 = [v10 prediction];
  [v10 _unregisterForRegionUpdatesForDelayFence:v11];

  [*(id *)(a1 + 32) setPrediction:0];
  [*(id *)(a1 + 32) _stopComingHomeTracking];
}

- (void)handleLocationChangedNotification:(id)a3
{
  id v4 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  double v5 = [v4 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__HMDUserActivityType6CoreLocationTracker_handleLocationChangedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v5, block);
}

void __77__HMDUserActivityType6CoreLocationTracker_handleLocationChangedNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataSource];
  v3 = [v2 home];
  id v4 = [v3 homeLocationHandler];
  id v13 = [v4 location];

  double v5 = [*(id *)(a1 + 32) prediction];

  if (v5)
  {
    double v6 = [*(id *)(a1 + 32) prediction];
    uint64_t v7 = (void *)[v6 copyPredictionWithNewHomeLocation:v13];

    if (v7)
    {
      int v8 = [*(id *)(a1 + 32) prediction];
      [*(id *)(a1 + 32) setPrediction:v7];
      if ([*(id *)(a1 + 32) state] == 3)
      {
        [*(id *)(a1 + 32) _unregisterForRegionUpdatesForDelayFence:v8];
        [*(id *)(a1 + 32) _registerForRegionUpdatesForDelayFence:v7];
      }
    }
    else
    {
      int v8 = [[HMDUserActivityStateType6DetectorTransitionLogEvent alloc] initWithTrackerType:1 reason:3];
      id v9 = [*(id *)(a1 + 32) dataSource];
      id v10 = [v9 logEventSubmitter];
      [v10 submitLogEvent:v8];

      id v11 = *(void **)(a1 + 32);
      int64_t v12 = [v11 prediction];
      [v11 _unregisterForRegionUpdatesForDelayFence:v12];

      [*(id *)(a1 + 32) setPrediction:0];
      [*(id *)(a1 + 32) _stopComingHomeTracking];
    }
  }
}

- (void)_handleLocationAuthorization:(int64_t)a3
{
  double v5 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  double v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  if ([(HMDUserActivityType6CoreLocationTracker *)self locationAuthorization] != a3)
  {
    [(HMDUserActivityType6CoreLocationTracker *)self setLocationAuthorization:a3];
    if (a3 == 1)
    {
      id v8 = [(HMDUserActivityType6CoreLocationTracker *)self locationManager];
      [v8 registerForVisitMonitoring:self];
    }
    else if (a3 == 2)
    {
      uint64_t v7 = [(HMDUserActivityType6CoreLocationTracker *)self locationManager];
      [v7 unregisterForVisitMonitoring:self];

      [(HMDUserActivityType6CoreLocationTracker *)self setState:1];
      [(HMDUserActivityType6CoreLocationTracker *)self setStateEnd:0];
      [(HMDUserActivityType6CoreLocationTracker *)self setChangedTimestamp:0];
      [(HMDUserActivityType6CoreLocationTracker *)self setLastReason:4];
      [(HMDUserActivityType6CoreLocationTracker *)self _stateUpdated];
    }
  }
}

- (void)handleLocationAuthorizationChangedNotification:(id)a3
{
  id v4 = a3;
  double v5 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  double v6 = [v5 queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__HMDUserActivityType6CoreLocationTracker_handleLocationAuthorizationChangedNotification___block_invoke;
  v8[3] = &unk_264A2F820;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __90__HMDUserActivityType6CoreLocationTracker_handleLocationAuthorizationChangedNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  objc_msgSend(v2, "hmf_numberForKey:", @"HMDLocationAuthorizationKey");
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleLocationAuthorization:", objc_msgSend(v4, "integerValue"));
    v3 = v4;
  }
}

- (void)_registerForNotifications
{
  v3 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  double v5 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  id v13 = [v5 home];

  if (v13)
  {
    double v6 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
    id v7 = [v6 notificationCenter];
    [v7 addObserver:self selector:sel_handleLocationAuthorizationChangedNotification_ name:@"HMDLocationAuthorizationChangedNotification" object:0];

    id v8 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
    id v9 = [v8 notificationCenter];
    id v10 = [v13 homeLocationHandler];
    [v9 addObserver:self selector:sel_handleLocationChangedNotification_ name:@"HMDLocationForHomeChanged" object:v10];

    id v11 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
    int64_t v12 = [v11 notificationCenter];
    [v12 addObserver:self selector:sel_handleDidArriveNotification_ name:@"HMDHomeDidArriveHomeNotificationKey" object:v13];
  }
}

- (void)_stateUpdated
{
  v3 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  double v5 = [(HMDUserActivityType6CoreLocationTracker *)self delegate];
  if (v5)
  {
    id v6 = v5;
    [v5 stateUpdated];
    double v5 = v6;
  }
}

- (HMDUserActivityType6StateEvent)currentStateEvent
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [[HMDUserActivityType6StateEvent alloc] initWithState:self->_state stateEnd:self->_stateEnd changedTimestamp:self->_changedTimestamp withReason:self->_lastReason];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLastReason:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_lastReason = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)lastReason
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t lastReason = self->_lastReason;
  os_unfair_lock_unlock(p_lock);
  return lastReason;
}

- (void)setChangedTimestamp:(id)a3
{
  id v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  changedTimestamp = self->_changedTimestamp;
  self->_changedTimestamp = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)changedTimestamp
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_changedTimestamp;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setStateEnd:(id)a3
{
  id v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  stateEnd = self->_stateEnd;
  self->_stateEnd = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)stateEnd
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_stateEnd;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setState:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_state = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)configureWithDelegate:(id)a3
{
  id v4 = a3;
  double v5 = [(HMDUserActivityType6CoreLocationTracker *)self dataSource];
  id v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  objc_storeWeak((id *)&self->_delegate, v4);
  [(HMDUserActivityType6CoreLocationTracker *)self _registerForNotifications];
  id v7 = [(HMDUserActivityType6CoreLocationTracker *)self locationManager];
  -[HMDUserActivityType6CoreLocationTracker _handleLocationAuthorization:](self, "_handleLocationAuthorization:", [v7 locationAuthorized]);
}

- (HMDUserActivityType6CoreLocationTracker)initWithDataSource:(id)a3 locationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMDUserActivityType6CoreLocationTracker;
  id v9 = [(HMDUserActivityType6CoreLocationTracker *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_locationManager, a4);
    v10->_locationAuthorization = 0;
    v10->_unint64_t state = 1;
    v10->_unint64_t lastReason = 0;
    v10->_closestDistance = -1.0;
    id v11 = NSString;
    int64_t v12 = [v7 home];
    id v13 = [v12 uuid];
    id v14 = [v13 UUIDString];
    uint64_t v15 = [v11 stringWithFormat:@"HMDUserActivityType6Detector.IgnoreShortStopTimer.%@", v14];
    ignoreShortStopTimerIdentifier = v10->_ignoreShortStopTimerIdentifier;
    v10->_ignoreShortStopTimerIdentifier = (NSString *)v15;
  }
  return v10;
}

@end