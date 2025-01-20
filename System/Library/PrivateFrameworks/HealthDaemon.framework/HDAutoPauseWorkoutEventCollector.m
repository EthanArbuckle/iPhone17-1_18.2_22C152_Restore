@interface HDAutoPauseWorkoutEventCollector
- (HDAutoPauseWorkoutEventCollector)initWithProfile:(id)a3 delegate:(id)a4;
- (void)_deliverWorkoutEvent:(void *)a3 sessionId:(void *)a4 eventDate:;
- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4;
- (void)stop;
- (void)unitTest_setCMWorkoutManager:(id)a3;
- (void)workoutManager:(id)a3 detectedChangeInWorkoutType:(id)a4 withOverview:(id)a5;
- (void)workoutManager:(id)a3 didBeginWorkoutSessionWithWorkout:(id)a4 withOverview:(id)a5;
- (void)workoutManager:(id)a3 didEndWorkoutSessionWithWorkout:(id)a4 withOverview:(id)a5;
- (void)workoutManager:(id)a3 didFailWorkout:(id)a4 withError:(id)a5;
- (void)workoutManager:(id)a3 didPauseWorkout:(id)a4 withOverview:(id)a5;
- (void)workoutManager:(id)a3 didResumeWorkout:(id)a4 withOverview:(id)a5;
- (void)workoutManager:(id)a3 didSetCurrentWorkoutType:(id)a4 withOverview:(id)a5;
- (void)workoutManager:(id)a3 didStartWorkout:(id)a4 atDate:(id)a5;
- (void)workoutManager:(id)a3 didStopWorkout:(id)a4 atDate:(id)a5;
- (void)workoutManager:(id)a3 suggestedStopWorkout:(id)a4 atDate:(id)a5;
- (void)workoutManager:(id)a3 willPauseWorkout:(id)a4 atDate:(id)a5;
- (void)workoutManager:(id)a3 willResumeWorkout:(id)a4 atDate:(id)a5;
- (void)workoutManager:(id)a3 workoutLocationEventUpdate:(id)a4;
@end

@implementation HDAutoPauseWorkoutEventCollector

- (HDAutoPauseWorkoutEventCollector)initWithProfile:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDAutoPauseWorkoutEventCollector;
  v7 = [(HDWorkoutEventCollector *)&v15 initWithProfile:v6 delegate:a4];
  if (v7)
  {
    v8 = [v6 daemon];
    v9 = [v8 workoutPluginExtension];
    v10 = [v9 coreMotionWorkoutInterface];
    uint64_t v11 = [v10 cmWorkoutManager];
    cmWorkoutManager = v7->_cmWorkoutManager;
    v7->_cmWorkoutManager = (CMWorkoutManager *)v11;

    [(CMWorkoutManager *)v7->_cmWorkoutManager setDelegate:v7];
    if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
    {
      objc_initWeak(&location, v7);
      v13 = dispatch_get_global_queue(0, 0);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __75__HDAutoPauseWorkoutEventCollector__listenForCatFlexingFakingNotifications__block_invoke;
      handler[3] = &unk_1E62F3490;
      objc_copyWeak(&v17, &location);
      notify_register_dispatch("HDWorkoutManagerTriggerCatFlexingEvent", &v7->_catFlexingNotifyToken, v13, handler);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

  return v7;
}

- (void)_deliverWorkoutEvent:(void *)a3 sessionId:(void *)a4 eventDate:
{
  if (a1)
  {
    v7 = (objc_class *)MEMORY[0x1E4F28C18];
    id v8 = a4;
    id v9 = a3;
    id v12 = (id)[[v7 alloc] initWithStartDate:v8 duration:0.0];

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F2B990]) initWithEventType:a2 sessionId:v9 dateInterval:v12 metadata:0];
    uint64_t v11 = [a1 delegate];
    [v11 receivedWorkoutEvent:v10];
  }
}

- (void)stop
{
  v7.receiver = self;
  v7.super_class = (Class)HDAutoPauseWorkoutEventCollector;
  [(HDWorkoutEventCollector *)&v7 stop];
  int v3 = [MEMORY[0x1E4F2B860] isAppleInternalInstall];
  if (self)
  {
    if (v3)
    {
      int catFlexingNotifyToken = self->_catFlexingNotifyToken;
      if (catFlexingNotifyToken != -1)
      {
        notify_cancel(catFlexingNotifyToken);
        self->_int catFlexingNotifyToken = -1;
      }
    }
  }
  v5 = [(CMWorkoutManager *)self->_cmWorkoutManager delegate];

  if (v5 == self) {
    [(CMWorkoutManager *)self->_cmWorkoutManager setDelegate:0];
  }
  cmWorkoutManager = self->_cmWorkoutManager;
  self->_cmWorkoutManager = 0;
}

- (void)workoutManager:(id)a3 didStartWorkout:(id)a4 atDate:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = self;
    _os_log_debug_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerDidStartWorkout event", (uint8_t *)&v11, 0xCu);
  }
  v10 = [v7 sessionId];
  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 0, v10, v8);
}

- (void)workoutManager:(id)a3 didStopWorkout:(id)a4 atDate:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = self;
    _os_log_debug_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerDidStopWorkout event", (uint8_t *)&v11, 0xCu);
  }
  v10 = [v7 sessionId];
  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 1, v10, v8);
}

- (void)workoutManager:(id)a3 willPauseWorkout:(id)a4 atDate:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = self;
    _os_log_debug_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerWillPauseWorkout event", (uint8_t *)&v11, 0xCu);
  }
  v10 = [v7 sessionId];
  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 7, v10, v8);
}

- (void)workoutManager:(id)a3 willResumeWorkout:(id)a4 atDate:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    id v12 = self;
    _os_log_debug_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerWillResumeWorkout event", (uint8_t *)&v11, 0xCu);
  }
  v10 = [v7 sessionId];
  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 8, v10, v8);
}

- (void)workoutManager:(id)a3 didFailWorkout:(id)a4 withError:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412290;
    objc_super v15 = self;
    _os_log_debug_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerDidFail event", (uint8_t *)&v14, 0xCu);
  }
  id v10 = objc_alloc(MEMORY[0x1E4F2B990]);
  int v11 = [v8 sessionId];

  id v12 = (void *)[v10 initWithSessionId:v11 error:v7];
  uint64_t v13 = [(HDWorkoutEventCollector *)self delegate];
  [v13 receivedWorkoutEvent:v12];
}

- (void)workoutManager:(id)a3 suggestedStopWorkout:(id)a4 atDate:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v10 = [v9 valueForKey:@"HDEnableCatflexing"];
  int v11 = v10;
  if (!v10 || [v10 BOOLValue])
  {
    _HKInitializeLogging();
    id v12 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      objc_super v15 = self;
      _os_log_debug_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEBUG, "%@: Received catflexing event", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v13 = [v7 sessionId];
    -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 11, v13, v8);
  }
}

- (void)workoutManager:(id)a3 workoutLocationEventUpdate:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%@:Received workout configuration update", buf, 0xCu);
  }
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v8 = [v5 locationType] == 1;
  id v9 = objc_alloc(MEMORY[0x1E4F2B990]);
  id v10 = [v5 sessionId];

  int v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 duration:0.0];
  id v12 = objc_msgSend(NSNumber, "numberWithBool:", v8, *MEMORY[0x1E4F2A178]);
  id v17 = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  int v14 = (void *)[v9 initWithWorkoutEventType:12 sessionUUID:v10 dateInterval:v11 metadata:v13 error:0];

  objc_super v15 = [(HDWorkoutEventCollector *)self delegate];
  [v15 receivedWorkoutEvent:v14];
}

- (void)workoutManager:(id)a3 didBeginWorkoutSessionWithWorkout:(id)a4 withOverview:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    uint64_t v13 = self;
    _os_log_debug_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerdidBeginWorkoutSession event", (uint8_t *)&v12, 0xCu);
  }
  id v10 = [v7 overviewId];
  int v11 = [v8 startDate];

  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 0, v10, v11);
}

- (void)workoutManager:(id)a3 didEndWorkoutSessionWithWorkout:(id)a4 withOverview:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    uint64_t v13 = self;
    _os_log_debug_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerdidEndWorkoutSession event", (uint8_t *)&v12, 0xCu);
  }
  id v10 = [v7 overviewId];
  int v11 = [v8 endDate];

  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 1, v10, v11);
}

- (void)workoutManager:(id)a3 didPauseWorkout:(id)a4 withOverview:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    int v11 = self;
    _os_log_debug_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerdidPauseWorkout event", (uint8_t *)&v10, 0xCu);
  }
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [v6 overviewId];

  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 2, v9, v8);
}

- (void)workoutManager:(id)a3 didResumeWorkout:(id)a4 withOverview:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    int v11 = self;
    _os_log_debug_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerdidResumeWorkout event", (uint8_t *)&v10, 0xCu);
  }
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [v6 overviewId];

  -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](self, 3, v9, v8);
}

- (void)workoutManager:(id)a3 didSetCurrentWorkoutType:(id)a4 withOverview:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  _HKInitializeLogging();
  id v7 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412290;
    uint64_t v16 = self;
    _os_log_debug_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerdidSetCurrentWorkoutType event", (uint8_t *)&v15, 0xCu);
  }
  id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v9 = [v6 startDate];
  int v10 = (void *)[v8 initWithStartDate:v9 duration:0.0];

  id v11 = objc_alloc(MEMORY[0x1E4F2B990]);
  uint64_t v12 = [v6 sessionId];

  uint64_t v13 = (void *)[v11 initWithWorkoutEventType:13 sessionUUID:v12 dateInterval:v10 metadata:0 error:0];
  uint64_t v14 = [(HDWorkoutEventCollector *)self delegate];
  [v14 receivedWorkoutEvent:v13];
}

- (void)workoutManager:(id)a3 detectedChangeInWorkoutType:(id)a4 withOverview:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  _HKInitializeLogging();
  id v7 = (NSObject **)MEMORY[0x1E4F29FB8];
  id v8 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v40 = self;
    _os_log_debug_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEBUG, "%@: Received workoutManagerdidDetectChangeInWorkoutType event", buf, 0xCu);
  }
  id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
  int v10 = [v6 startDate];
  id v11 = (void *)[v9 initWithStartDate:v10 duration:0.0];

  id v12 = objc_alloc(MEMORY[0x1E4F2B990]);
  uint64_t v13 = [v6 sessionId];
  uint64_t v14 = (void *)[v12 initWithWorkoutEventType:14 sessionUUID:v13 dateInterval:v11 metadata:0 error:0];

  id v15 = v6;
  if (self)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F2B768]);
    uint64_t v17 = [v15 type];
    int v18 = v17;
    uint64_t v19 = 52;
    switch(v17)
    {
      case 0:
      case 8:
      case 10:
      case 13:
      case 14:
      case 25:
      case 26:
      case 66:
        goto LABEL_5;
      case 1:
      case 15:
      case 16:
        break;
      case 2:
      case 17:
      case 18:
        uint64_t v19 = 37;
        break;
      case 3:
      case 4:
      case 5:
        uint64_t v19 = 13;
        break;
      case 6:
        uint64_t v19 = 57;
        break;
      case 7:
        uint64_t v19 = 77;
        break;
      case 9:
        uint64_t v19 = 16;
        break;
      case 11:
        uint64_t v19 = 44;
        break;
      case 12:
      case 35:
        uint64_t v19 = 35;
        break;
      case 19:
        uint64_t v19 = 46;
        break;
      case 20:
        uint64_t v19 = 70;
        break;
      case 21:
        uint64_t v19 = 71;
        break;
      case 22:
        uint64_t v19 = 63;
        break;
      case 23:
        uint64_t v19 = 61;
        break;
      case 24:
        uint64_t v19 = 24;
        break;
      case 27:
        uint64_t v19 = 21;
        break;
      case 28:
        uint64_t v19 = 20;
        break;
      case 29:
        uint64_t v19 = 80;
        break;
      case 30:
        uint64_t v19 = 59;
        break;
      case 31:
        uint64_t v19 = 72;
        break;
      case 32:
        uint64_t v19 = 66;
        break;
      case 33:
        uint64_t v19 = 83;
        break;
      case 34:
        uint64_t v19 = 65;
        break;
      case 36:
        uint64_t v19 = 60;
        break;
      case 37:
        uint64_t v19 = 67;
        break;
      case 38:
        uint64_t v19 = 31;
        break;
      case 39:
      case 40:
        uint64_t v19 = 41;
        break;
      case 41:
        uint64_t v19 = 3;
        break;
      case 42:
        uint64_t v19 = 1;
        break;
      case 43:
        uint64_t v19 = 75;
        break;
      case 44:
        uint64_t v19 = 36;
        break;
      case 45:
        uint64_t v19 = 27;
        break;
      case 46:
      case 47:
        uint64_t v19 = 39;
        break;
      case 48:
      case 49:
        uint64_t v19 = 25;
        break;
      case 50:
        uint64_t v19 = 6;
        break;
      case 51:
        uint64_t v19 = 48;
        break;
      case 52:
        uint64_t v19 = 4;
        break;
      case 53:
        uint64_t v19 = 34;
        break;
      case 54:
        uint64_t v19 = 79;
        break;
      case 55:
        uint64_t v19 = 51;
        break;
      case 56:
        uint64_t v19 = 43;
        break;
      case 57:
        uint64_t v19 = 23;
        break;
      case 58:
        uint64_t v19 = 49;
        break;
      case 59:
        uint64_t v19 = 42;
        break;
      case 60:
        uint64_t v19 = 5;
        break;
      case 61:
        uint64_t v19 = 10;
        break;
      case 62:
        uint64_t v19 = 47;
        break;
      case 63:
        uint64_t v19 = 64;
        break;
      case 64:
        uint64_t v19 = 8;
        break;
      default:
        _HKInitializeLogging();
        v38 = *v7;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v40) = v18;
          _os_log_fault_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_FAULT, "Unknown CMWorkoutType %d", buf, 8u);
        }
LABEL_5:
        uint64_t v19 = 3000;
        break;
    }
    [v16 setActivityType:v19];
    unint64_t v20 = [v15 locationType];
    if (v20 > 4) {
      uint64_t v21 = 3;
    }
    else {
      uint64_t v21 = qword_1BD340B10[v20];
    }
    [v16 setLocationType:v21];
    if ([v15 type] == 19)
    {
      id v22 = v15;
      uint64_t v23 = [v22 location];
      if (v23) {
        uint64_t v24 = 2 * (v23 == 1);
      }
      else {
        uint64_t v24 = 1;
      }
      [v16 setSwimmingLocationType:v24];
      [v16 setLocationType:3];
      if ([v16 swimmingLocationType] == 2)
      {
        [v16 setLapLength:0];
      }
      else
      {
        v25 = (void *)MEMORY[0x1E4F2B370];
        v26 = [MEMORY[0x1E4F2B618] meterUnit];
        [v22 poolLength];
        v27 = objc_msgSend(v25, "quantityWithUnit:doubleValue:", v26);
        [v16 setLapLength:v27];
      }
    }
    v28 = [v15 startDate];
    v29 = [v15 endDate];
    v30 = [MEMORY[0x1E4F1C9C8] distantFuture];
    char v31 = [v29 isEqualToDate:v30];

    if (v31)
    {
      v32 = 0;
    }
    else
    {
      v32 = [v15 endDate];
    }
    v33 = [v15 sessionId];
    [v16 setSuggestedActivityUUID:v33];

    id v34 = objc_alloc(MEMORY[0x1E4F2B720]);
    v35 = [v15 sessionId];
    v36 = (void *)[v34 _initWithUUID:v35 workoutConfiguration:v16 startDate:v28 endDate:v32 workoutEvents:MEMORY[0x1E4F1CBF0] startsPaused:0 duration:0.0 metadata:0 statisticsPerType:0];
  }
  else
  {
    v36 = 0;
  }

  v37 = [(HDWorkoutEventCollector *)self delegate];
  [v37 receivedWorkoutEvent:v14 forWorkoutActivity:v36];
}

void __75__HDAutoPauseWorkoutEventCollector__listenForCatFlexingFakingNotifications__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    v1 = (os_log_t *)MEMORY[0x1E4F29FB8];
    v2 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "CatFlexing: Triggering cat flexing event", buf, 2u);
    }
    _HKInitializeLogging();
    int v3 = *v1;
    if (os_log_type_enabled(*v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v8 = 0x4014000000000000;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "CatFlexing: setting setSuggestedStopTimeout to %f seconds", buf, 0xCu);
    }
    v4 = [WeakRetained sessionId];
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    -[HDAutoPauseWorkoutEventCollector _deliverWorkoutEvent:sessionId:eventDate:](WeakRetained, 11, v4, v5);
  }
}

- (void)unitTest_setCMWorkoutManager:(id)a3
{
  p_cmWorkoutManager = &self->_cmWorkoutManager;
  objc_storeStrong((id *)&self->_cmWorkoutManager, a3);
  id v6 = a3;
  [(CMWorkoutManager *)*p_cmWorkoutManager setDelegate:self];
}

- (void)fakeActivityDetection:(id)a3 workoutActivity:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F2B990];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v11 = [v7 startDate];
  id v12 = (void *)[v10 initWithStartDate:v11 duration:0.0];
  id v14 = (id)[v9 initWithWorkoutEventType:14 sessionUUID:v8 dateInterval:v12 metadata:0 error:0];

  uint64_t v13 = [(HDWorkoutEventCollector *)self delegate];
  [v13 receivedWorkoutEvent:v14 forWorkoutActivity:v7];
}

- (void).cxx_destruct
{
}

@end