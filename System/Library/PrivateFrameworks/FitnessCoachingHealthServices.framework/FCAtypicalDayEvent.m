@interface FCAtypicalDayEvent
- (BOOL)_isProgressSignificantlyBetter:(double)a3;
- (BOOL)_isProgressSignificantlyWorse:(double)a3;
- (BOOL)shouldFireWithTypicalDayModel:(id)a3 evaluationDelegate:(id)a4;
- (FCAtypicalDayEvent)initWithConfiguration:(id)a3;
- (double)minimumDayDuration;
- (id)eventIdentifier;
- (id)goalProgressContentForModel:(id)a3;
- (id)nextFireDateWithModel:(id)a3;
@end

@implementation FCAtypicalDayEvent

- (FCAtypicalDayEvent)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCAtypicalDayEvent;
  v6 = [(FCAtypicalDayEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (id)eventIdentifier
{
  return (id)[(FCCAtypicalDayConfiguration *)self->_configuration identifier];
}

- (double)minimumDayDuration
{
  v2 = [(FCCAtypicalDayConfiguration *)self->_configuration percentageOfDayRule];
  [v2 minimumDayDuration];
  double v4 = v3;

  return v4;
}

- (BOOL)shouldFireWithTypicalDayModel:(id)a3 evaluationDelegate:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([a4 currentExperienceType] == 1)
  {
    [v6 valueOfTypicalDayMoveEarnedByNow];
    double v8 = v7;
    [v6 valueOfTypicalDayBriskMinutesEarnedByNow];
    double v10 = v9;
    if (v8 <= 0.0 && v9 <= 0.0)
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E4F29F08];
      BOOL v12 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36[0]) = 0;
        v13 = "Morning update can't use move or exercise to determine relative progress!";
LABEL_8:
        _os_log_impl(&dword_1D3B3E000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)v36, 2u);
LABEL_9:
        BOOL v12 = 0;
        goto LABEL_32;
      }
      goto LABEL_32;
    }
    [v6 currentMoveGoalPercentage];
    double v15 = v14;
    [v6 percentageOfTypicalDayMoveComparedToNow];
    double v17 = v16;
    v18 = [(FCCAtypicalDayConfiguration *)self->_configuration allowedGoalTypes];
    int v19 = [v18 containsObject:&unk_1F2B47980];

    BOOL v20 = 0;
    if (v19)
    {
      BOOL v21 = 0;
      if (v8 > 0.0)
      {
        BOOL v20 = [(FCAtypicalDayEvent *)self _isProgressSignificantlyBetter:v17];
        BOOL v22 = [(FCAtypicalDayEvent *)self _isProgressSignificantlyWorse:v17];
        BOOL v21 = v15 < 1.0 && v22;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
    [v6 currentExerciseGoalPercentage];
    double v24 = v23;
    [v6 percentageOfTypicalDayBriskMinutesEarnedComparedToNow];
    double v26 = v25;
    v27 = [(FCCAtypicalDayConfiguration *)self->_configuration allowedGoalTypes];
    int v28 = [v27 containsObject:&unk_1F2B47998];

    BOOL v29 = 0;
    if (v28)
    {
      BOOL v30 = 0;
      if (v10 > 0.0)
      {
        BOOL v29 = [(FCAtypicalDayEvent *)self _isProgressSignificantlyBetter:v26];
        BOOL v31 = [(FCAtypicalDayEvent *)self _isProgressSignificantlyWorse:v26];
        BOOL v30 = v24 < 1.0 && v31;
      }
    }
    else
    {
      BOOL v30 = 0;
    }
    if (v20 || v29)
    {
      _HKInitializeLogging();
      v32 = *MEMORY[0x1E4F29F08];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
      {
LABEL_29:
        _HKInitializeLogging();
        v34 = *MEMORY[0x1E4F29F08];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
        {
          v36[0] = 67110400;
          v36[1] = v8 > 0.0;
          __int16 v37 = 1024;
          BOOL v38 = v10 > 0.0;
          __int16 v39 = 2048;
          double v40 = v17;
          __int16 v41 = 2048;
          double v42 = v26;
          __int16 v43 = 1024;
          BOOL v44 = v15 >= 1.0;
          __int16 v45 = 1024;
          BOOL v46 = v24 >= 1.0;
          _os_log_impl(&dword_1D3B3E000, v34, OS_LOG_TYPE_DEFAULT, "Morning update trigger determined from: canUseMoveForPrediction=%{BOOL}d, canUseExerciseForPrediction=%{BOOL}d, percentageOfTypicalMove=%f, percentageOfTypicalExercise=%f, moveRingClosedToday=%{BOOL}d, exerciseRingClosedToday=%{BOOL}d", (uint8_t *)v36, 0x2Eu);
        }
        BOOL v12 = 1;
        goto LABEL_32;
      }
      LOWORD(v36[0]) = 0;
      v33 = "Today was significantly better than normal; showing morning update";
    }
    else
    {
      if (!v21 && !v30) {
        goto LABEL_9;
      }
      _HKInitializeLogging();
      v32 = *MEMORY[0x1E4F29F08];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      LOWORD(v36[0]) = 0;
      v33 = "Today was significantly worse than normal; showing morning update";
    }
    _os_log_impl(&dword_1D3B3E000, v32, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)v36, 2u);
    goto LABEL_29;
  }
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E4F29F08];
  BOOL v12 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v36[0]) = 0;
    v13 = "Morning update should not fire, fitness junior user";
    goto LABEL_8;
  }
LABEL_32:

  return v12;
}

- (id)nextFireDateWithModel:(id)a3
{
  configuration = self->_configuration;
  id v4 = a3;
  id v5 = [(FCCAtypicalDayConfiguration *)configuration percentageOfDayRule];
  id v6 = FCFireDateForPercentOfDayRule(v5, v4);

  return v6;
}

- (id)goalProgressContentForModel:(id)a3
{
  id v4 = a3;
  id v5 = [(FCCAtypicalDayConfiguration *)self->_configuration allowedGoalTypes];
  int v6 = [v5 containsObject:&unk_1F2B47980];

  if (v6)
  {
    [v4 percentageOfTypicalDayMoveComparedToNow];
    double v8 = v7;
    BOOL v9 = -[FCAtypicalDayEvent _isProgressSignificantlyWorse:](self, "_isProgressSignificantlyWorse:");
    int v6 = [(FCAtypicalDayEvent *)self _isProgressSignificantlyBetter:v8];
  }
  else
  {
    BOOL v9 = 0;
  }
  double v10 = [(FCCAtypicalDayConfiguration *)self->_configuration allowedGoalTypes];
  int v11 = [v10 containsObject:&unk_1F2B47998];

  if (v11)
  {
    [v4 percentageOfTypicalDayBriskMinutesEarnedComparedToNow];
    double v13 = v12;
    int v11 = -[FCAtypicalDayEvent _isProgressSignificantlyWorse:](self, "_isProgressSignificantlyWorse:");
    BOOL v14 = [(FCAtypicalDayEvent *)self _isProgressSignificantlyBetter:v13];
  }
  else
  {
    BOOL v14 = 0;
  }
  if ((v9 | v11) == 1)
  {
    if (v9)
    {
      [v4 valueOfTypicalDayMoveEarnedByNow];
      double v16 = v15;
      uint64_t v17 = 1;
    }
    else if (v11)
    {
      [v4 valueOfTypicalDayBriskMinutesEarnedByNow];
      double v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v17 = 0;
      double v16 = 0.0;
    }
    BOOL v20 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:&unk_1F2B479B0];
    goto LABEL_22;
  }
  if ((v6 | v14) == 1)
  {
    if (v6)
    {
      v18 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:&unk_1F2B47980];
      [v4 valueOfTypicalDayMoveEarnedByNow];
      double v16 = v19;
      uint64_t v17 = 1;
      if (!v14)
      {
LABEL_13:
        BOOL v20 = v18;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v17 = 0;
      double v16 = 0.0;
      v18 = (void *)MEMORY[0x1E4F1CBF0];
      if (!v14) {
        goto LABEL_13;
      }
    }
    BOOL v20 = [v18 arrayByAddingObject:&unk_1F2B47998];

    if (v16 == 0.0)
    {
      [v4 valueOfTypicalDayBriskMinutesEarnedByNow];
      double v16 = v22;
      uint64_t v17 = 2;
    }
  }
  else
  {
    uint64_t v17 = 0;
    double v16 = 0.0;
    BOOL v20 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_22:
  id v23 = objc_alloc(MEMORY[0x1E4F620E8]);
  double v24 = [(FCAtypicalDayEvent *)self eventIdentifier];
  double v25 = (void *)[v23 initWithEventIdentifier:v24 goalTypesToDisplay:v20 goalTypeToHighlight:v17 expectedGoalValue:v16];

  return v25;
}

- (BOOL)_isProgressSignificantlyBetter:(double)a3
{
  [(FCCAtypicalDayConfiguration *)self->_configuration minimumAheadPercentage];
  return v4 + 1.0 <= a3;
}

- (BOOL)_isProgressSignificantlyWorse:(double)a3
{
  [(FCCAtypicalDayConfiguration *)self->_configuration minimumBehindPercentage];
  return 1.0 - v4 >= a3;
}

- (void).cxx_destruct
{
}

@end