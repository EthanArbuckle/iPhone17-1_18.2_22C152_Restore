@interface HDBiomeInterface
- (BOOL)sleepFocusOn;
- (id)_createBiomeEventWithType:(uint64_t)a3 isUpdate:;
- (void)_sendBiomeEvent:(id)a3 toSource:(id)a4;
- (void)stopSessionWithIdentifier:(id)a3 recoveredWorkoutConfiguration:(id)a4;
- (void)unitTesting_workoutConfigurationUpdated:(id)a3 recentEventType:(int)a4;
- (void)workoutConfigurationUpdated:(id)a3;
- (void)workoutSessionWithConfiguration:(id)a3 transitionedToState:(int64_t)a4 fromState:(int64_t)a5;
@end

@implementation HDBiomeInterface

- (void)workoutSessionWithConfiguration:(id)a3 transitionedToState:(int64_t)a4 fromState:(int64_t)a5
{
  objc_storeStrong((id *)&self->_sessionConfiguration, a3);
  v8 = 0;
  uint64_t v9 = 4;
  switch(a4)
  {
    case 4:
    case 5:
      if (a5 == 4) {
        goto LABEL_10;
      }
      uint64_t v9 = 1;
      goto LABEL_8;
    case 7:
      uint64_t v9 = 3;
      if (a5 == 8 || a5 == 17) {
        goto LABEL_8;
      }
      goto LABEL_10;
    case 8:
    case 17:
      goto LABEL_8;
    case 15:
    case 16:
      if (a5 == 15)
      {
LABEL_10:
        v8 = 0;
      }
      else
      {
        uint64_t v9 = 2;
LABEL_8:
        v8 = -[HDBiomeInterface _createBiomeEventWithType:isUpdate:]((uint64_t)self, v9, 0);
        if (v8)
        {
          v14 = v8;
          v10 = BiomeLibrary();
          v11 = [v10 Health];
          v12 = [v11 Workout];

          v13 = [v12 source];
          [(HDBiomeInterface *)self _sendBiomeEvent:v14 toSource:v13];

          v8 = v14;
        }
      }
      break;
    default:
      break;
  }
}

- (void)workoutConfigurationUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_sessionConfiguration, a3);
  -[HDBiomeInterface _createBiomeEventWithType:isUpdate:]((uint64_t)self, self->_mostRecentBiomeEventType, 1);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v4 = BiomeLibrary();
    v5 = [v4 Health];
    v6 = [v5 Workout];

    v7 = [v6 source];
    [(HDBiomeInterface *)self _sendBiomeEvent:v8 toSource:v7];
  }
}

- (id)_createBiomeEventWithType:(uint64_t)a3 isUpdate:
{
  if (a1)
  {
    v6 = [*(id *)(a1 + 8) workoutConfiguration];
    BOOL v7 = [v6 locationType] == 2;

    id v8 = [*(id *)(a1 + 8) clientApplicationIdentifier];
    uint64_t v9 = [v8 hasPrefix:@"com.apple.SessionTrackerApp"];

    v10 = [*(id *)(a1 + 8) workoutConfiguration];
    [v10 activityType];

    v11 = [*(id *)(a1 + 8) sessionIdentifier];
    v12 = [v11 UUIDString];

    id v13 = objc_alloc(MEMORY[0x1E4F4FE38]);
    v14 = [NSNumber numberWithBool:v9];
    v15 = [NSNumber numberWithBool:v7];
    v16 = _HKWorkoutActivityNameForActivityType();
    v17 = [NSNumber numberWithBool:a3];
    v18 = (void *)[v13 initWithIsFirstPartyDonation:v14 isIndoor:v15 activityType:v16 eventType:a2 activityUUID:v12 isUpdate:v17];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)stopSessionWithIdentifier:(id)a3 recoveredWorkoutConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [v6 locationType] == 2;
  [v6 activityType];

  _HKWorkoutActivityNameForActivityType();
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v9 = objc_alloc(MEMORY[0x1E4F4FE38]);
  v10 = [NSNumber numberWithBool:v8];
  if (v18) {
    v11 = v18;
  }
  else {
    v11 = @"N/A";
  }
  v12 = [v7 UUIDString];

  id v13 = (void *)[v9 initWithIsFirstPartyDonation:MEMORY[0x1E4F1CC28] isIndoor:v10 activityType:v11 eventType:2 activityUUID:v12 isUpdate:MEMORY[0x1E4F1CC28]];
  v14 = BiomeLibrary();
  v15 = [v14 Health];
  v16 = [v15 Workout];

  v17 = [v16 source];
  [(HDBiomeInterface *)self _sendBiomeEvent:v13 toSource:v17];
}

- (void)_sendBiomeEvent:(id)a3 toSource:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  self->_mostRecentBiomeEventType = [v6 eventType];
  _HKInitializeLogging();
  BOOL v8 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    *(_DWORD *)v11 = 138543874;
    *(void *)&v11[4] = objc_opt_class();
    *(_WORD *)&v11[12] = 2048;
    *(void *)&v11[14] = self;
    *(_WORD *)&v11[22] = 2114;
    id v12 = v6;
    id v10 = *(id *)&v11[4];
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] sending workout event %{public}@ to biome", v11, 0x20u);
  }
  objc_msgSend(v7, "sendEvent:", v6, *(_OWORD *)v11, *(void *)&v11[16], v12);
}

- (BOOL)sleepFocusOn
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v3 = BiomeLibrary();
  v4 = [v3 UserFocus];
  v5 = [v4 ComputedMode];
  id v6 = [v5 publisher];
  id v7 = [v6 last];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__HDBiomeInterface_sleepFocusOn__block_invoke;
  v11[3] = &unk_1E63090A8;
  v11[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__HDBiomeInterface_sleepFocusOn__block_invoke_285;
  v10[3] = &unk_1E63090D0;
  v10[4] = self;
  v10[5] = &v12;
  id v8 = (id)[v7 sinkWithCompletion:v11 receiveInput:v10];

  LOBYTE(v3) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v3;
}

void __32__HDBiomeInterface_sleepFocusOn__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = objc_opt_class();
    id v6 = v5;
    id v7 = [v2 error];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] User focus computed mode publisher finished with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void __32__HDBiomeInterface_sleepFocusOn__block_invoke_285(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 eventBody];

  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E4F29F28];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = v5;
      int v8 = objc_opt_class();
      id v9 = v8;
      __int16 v10 = [v3 eventBody];
      int v18 = 138543618;
      v19 = v8;
      __int16 v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received event: %{public}@", (uint8_t *)&v18, 0x16u);
    }
    v11 = [v3 eventBody];
    if ([v11 semanticType] == 3)
    {
      uint64_t v12 = [v3 eventBody];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v12 starting];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  else if (v6)
  {
    uint64_t v13 = v5;
    uint64_t v14 = objc_opt_class();
    char v15 = NSNumber;
    id v16 = v14;
    v17 = objc_msgSend(v15, "numberWithUnsignedChar:", objc_msgSend(v3, "error"));
    int v18 = 138543618;
    v19 = v14;
    __int16 v20 = 2114;
    v21 = v17;
    _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received nil user focus computed mode with reason: %{public}@", (uint8_t *)&v18, 0x16u);
  }
}

- (void)unitTesting_workoutConfigurationUpdated:(id)a3 recentEventType:(int)a4
{
  self->_mostRecentBiomeEventType = a4;
  [(HDBiomeInterface *)self workoutConfigurationUpdated:a3];
}

- (void).cxx_destruct
{
}

@end