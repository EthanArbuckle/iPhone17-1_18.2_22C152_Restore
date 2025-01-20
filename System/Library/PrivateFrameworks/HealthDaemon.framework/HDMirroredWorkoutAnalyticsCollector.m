@interface HDMirroredWorkoutAnalyticsCollector
- (HDMirroredWorkoutAnalyticEvent)mirroredWorkoutEvent;
- (HDMirroredWorkoutAnalyticsCollector)init;
- (uint64_t)_reset;
- (void)sendData;
- (void)sentData;
- (void)setMirroredWorkoutEvent:(id)a3;
- (void)startMirroring;
- (void)startedMirroring;
- (void)stopMirroring;
- (void)stoppedMirroring;
- (void)submitHeartBeatFailuresWithCoordinator:(id)a3 numOfHeartbeatFailures:(int64_t)a4 workoutDuration:(double)a5 isFirstParty:(BOOL)a6;
- (void)submitMirroringMetricsWithCoordinator:(id)a3 isFirstParty:(BOOL)a4;
@end

@implementation HDMirroredWorkoutAnalyticsCollector

- (HDMirroredWorkoutAnalyticsCollector)init
{
  v5.receiver = self;
  v5.super_class = (Class)HDMirroredWorkoutAnalyticsCollector;
  v2 = [(HDMirroredWorkoutAnalyticsCollector *)&v5 init];
  v3 = v2;
  if (v2) {
    -[HDMirroredWorkoutAnalyticsCollector _reset]((uint64_t)v2);
  }
  return v3;
}

- (uint64_t)_reset
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = objc_alloc_init(HDMirroredWorkoutAnalyticEvent);
    v3 = *(void **)(v1 + 40);
    *(void *)(v1 + 40) = v2;

    uint64_t v4 = [MEMORY[0x1E4F2B328] timerWithKey:@"StartMirroringTimerKey"];
    objc_super v5 = *(void **)(v1 + 8);
    *(void *)(v1 + 8) = v4;

    uint64_t v6 = [MEMORY[0x1E4F2B328] timerWithKey:@"StopMirroringTimerKey"];
    v7 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = v6;

    uint64_t v8 = [MEMORY[0x1E4F2B328] timerWithKey:@"SendDataTimerKey"];
    v9 = *(void **)(v1 + 24);
    *(void *)(v1 + 24) = v8;

    [*(id *)(v1 + 8) clear];
    [*(id *)(v1 + 16) clear];
    v10 = *(void **)(v1 + 24);
    return [v10 clear];
  }
  return result;
}

- (void)startMirroring
{
  self->_startTime = CFAbsoluteTimeGetCurrent();
  startMirroringTimer = self->_startMirroringTimer;

  [(HKPersistentTimer *)startMirroringTimer start];
}

- (void)startedMirroring
{
  v3 = [(HKPersistentTimer *)self->_startMirroringTimer timerValue];

  if (v3)
  {
    [(HDMirroredWorkoutAnalyticEvent *)self->_mirroredWorkoutEvent setTimeTakenToStartMirroring:[(HKPersistentTimer *)self->_startMirroringTimer elapsedMilliSeconds]];
    startMirroringTimer = self->_startMirroringTimer;
    [(HKPersistentTimer *)startMirroringTimer clear];
  }
  else
  {
    _HKInitializeLogging();
    objc_super v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Failed to track successful start of mirrored workout: timer does not exist.", v6, 2u);
    }
  }
}

- (void)stopMirroring
{
}

- (void)stoppedMirroring
{
  v3 = [(HKPersistentTimer *)self->_stopMirroringTimer timerValue];

  if (v3)
  {
    [(HDMirroredWorkoutAnalyticEvent *)self->_mirroredWorkoutEvent setMirroringDuration:(uint64_t)(CFAbsoluteTimeGetCurrent() - self->_startTime)];
    [(HDMirroredWorkoutAnalyticEvent *)self->_mirroredWorkoutEvent setTimeTakenToStopMirroring:[(HKPersistentTimer *)self->_stopMirroringTimer elapsedMilliSeconds]];
    stopMirroringTimer = self->_stopMirroringTimer;
    [(HKPersistentTimer *)stopMirroringTimer clear];
  }
  else
  {
    _HKInitializeLogging();
    objc_super v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Failed to track successful stop of mirrored workout: timer does not exist.", v6, 2u);
    }
  }
}

- (void)sendData
{
}

- (void)sentData
{
  v3 = [(HKPersistentTimer *)self->_sendDataTimer timerValue];

  if (v3)
  {
    double v4 = (double)(unint64_t)[(HKPersistentTimer *)self->_sendDataTimer elapsedMilliSeconds];
    if (v4 <= (double)[(HDMirroredWorkoutAnalyticEvent *)self->_mirroredWorkoutEvent maxTimeTakenToSendData])
    {
      if (v4 < (double)[(HDMirroredWorkoutAnalyticEvent *)self->_mirroredWorkoutEvent minTimeTakenToSendData])[(HDMirroredWorkoutAnalyticEvent *)self->_mirroredWorkoutEvent setMinTimeTakenToSendData:(uint64_t)v4]; {
    }
      }
    else
    {
      [(HDMirroredWorkoutAnalyticEvent *)self->_mirroredWorkoutEvent setMaxTimeTakenToSendData:(uint64_t)v4];
    }
    [(HDMirroredWorkoutAnalyticEvent *)self->_mirroredWorkoutEvent setTimeTakenToSendData:(uint64_t)(v4+ (double)[(HDMirroredWorkoutAnalyticEvent *)self->_mirroredWorkoutEvent timeTakenToSendData])];
    [(HDMirroredWorkoutAnalyticEvent *)self->_mirroredWorkoutEvent setNumberOfSendRequests:[(HDMirroredWorkoutAnalyticEvent *)self->_mirroredWorkoutEvent numberOfSendRequests] + 1];
    sendDataTimer = self->_sendDataTimer;
    [(HKPersistentTimer *)sendDataTimer clear];
  }
  else
  {
    _HKInitializeLogging();
    objc_super v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Failed to track successful stop of mirrored workout: timer does not exist.", v7, 2u);
    }
  }
}

- (void)submitMirroringMetricsWithCoordinator:(id)a3 isFirstParty:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "Sending mirroring metrics to Analytics collector", v8, 2u);
  }
  objc_msgSend(v6, "workout_reportMirroringEventWithStartDuration:stopDuration:mirroringDuration:numOfSendDataRequests:maxTimeToSendData:minTimeToSendData:avgTimeToSendData:isFirstParty:", -[HDMirroredWorkoutAnalyticEvent numberOfSendRequests](self->_mirroredWorkoutEvent, "numberOfSendRequests"), v4, (double)-[HDMirroredWorkoutAnalyticEvent timeTakenToStartMirroring](self->_mirroredWorkoutEvent, "timeTakenToStartMirroring"), (double)-[HDMirroredWorkoutAnalyticEvent timeTakenToStopMirroring](self->_mirroredWorkoutEvent, "timeTakenToStopMirroring"), (double)-[HDMirroredWorkoutAnalyticEvent mirroringDuration](self->_mirroredWorkoutEvent, "mirroringDuration"), (double)-[HDMirroredWorkoutAnalyticEvent maxTimeTakenToSendData](self->_mirroredWorkoutEvent, "maxTimeTakenToSendData"), (double)-[HDMirroredWorkoutAnalyticEvent minTimeTakenToSendData](self->_mirroredWorkoutEvent, "minTimeTakenToSendData"), (double)(-[HDMirroredWorkoutAnalyticEvent timeTakenToSendData](self->_mirroredWorkoutEvent, "timeTakenToSendData")
           / [(HDMirroredWorkoutAnalyticEvent *)self->_mirroredWorkoutEvent numberOfSendRequests]));

  -[HDMirroredWorkoutAnalyticsCollector _reset]((uint64_t)self);
}

- (void)submitHeartBeatFailuresWithCoordinator:(id)a3 numOfHeartbeatFailures:(int64_t)a4 workoutDuration:(double)a5 isFirstParty:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  _HKInitializeLogging();
  v10 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "Sending heartbeat failure metrics to Analytics collector", v11, 2u);
  }
  objc_msgSend(v9, "workout_reportWorkoutEventWithHeartBeatFailures:workoutDuration:isFirstParty:", a4, v6, a5);
}

- (HDMirroredWorkoutAnalyticEvent)mirroredWorkoutEvent
{
  return self->_mirroredWorkoutEvent;
}

- (void)setMirroredWorkoutEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroredWorkoutEvent, 0);
  objc_storeStrong((id *)&self->_sendDataTimer, 0);
  objc_storeStrong((id *)&self->_stopMirroringTimer, 0);

  objc_storeStrong((id *)&self->_startMirroringTimer, 0);
}

@end