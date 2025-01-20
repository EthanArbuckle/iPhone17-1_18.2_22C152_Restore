@interface FCCompletionOffTrackEvent
- (BOOL)shouldFireWithTypicalDayModel:(id)a3 evaluationDelegate:(id)a4;
- (FCCompletionOffTrackEvent)initWithConfiguration:(id)a3;
- (double)minimumDayDuration;
- (id)eventIdentifier;
- (id)goalProgressContentForModel:(id)a3;
- (id)nextFireDateWithModel:(id)a3;
@end

@implementation FCCompletionOffTrackEvent

- (FCCompletionOffTrackEvent)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCompletionOffTrackEvent;
  v6 = [(FCCompletionOffTrackEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (id)eventIdentifier
{
  return (id)[(FCCCompletionOffTrackConfiguration *)self->_configuration identifier];
}

- (double)minimumDayDuration
{
  v2 = [(FCCCompletionOffTrackConfiguration *)self->_configuration percentageOfDayRule];
  [v2 minimumDayDuration];
  double v4 = v3;

  return v4;
}

- (BOOL)shouldFireWithTypicalDayModel:(id)a3 evaluationDelegate:(id)a4
{
  id v6 = a3;
  configuration = self->_configuration;
  id v8 = a4;
  objc_super v9 = [(FCCCompletionOffTrackConfiguration *)configuration coalescingRules];
  char v10 = FCEventCoalescedWithRules(v9, v8);

  if (v10) {
    goto LABEL_2;
  }
  [(FCCCompletionOffTrackConfiguration *)self->_configuration goalBufferPercentage];
  double v13 = v12;
  v14 = [(FCCCompletionOffTrackConfiguration *)self->_configuration allowedGoalTypes];
  int v15 = [v14 containsObject:&unk_1F2B479C8];

  if (v15)
  {
    [v6 valueOfTypicalDayMoveEarnedByNow];
    BOOL v17 = v16 > 0.0;
    int v18 = [v6 willCompleteMoveGoalWithBufferPercentage:v13];
  }
  else
  {
    BOOL v17 = 0;
    int v18 = 1;
  }
  v19 = [(FCCCompletionOffTrackConfiguration *)self->_configuration allowedGoalTypes];
  int v20 = [v19 containsObject:&unk_1F2B479E0];

  if (v20)
  {
    [v6 valueOfTypicalDayBriskMinutesEarnedByNow];
    BOOL v22 = v21 > 0.0;
    int v23 = [v6 willCompleteExerciseGoalWithBufferPercentage:v13];
  }
  else
  {
    BOOL v22 = 0;
    int v23 = 1;
  }
  v24 = [(FCCCompletionOffTrackConfiguration *)self->_configuration allowedGoalTypes];
  int v25 = [v24 containsObject:&unk_1F2B479F8];

  int v26 = v25 ? [v6 willCompleteStandGoalOrItIsTooLateWithBufferPercentage:v13] : 1;
  if (!v17 | v18) == 1 && !v22 | v23 && (((!v17 && !v22) | v26))
  {
LABEL_2:
    BOOL v11 = 0;
  }
  else
  {
    _HKInitializeLogging();
    v27 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1D3B3E000, v27, OS_LOG_TYPE_DEFAULT, "Unlikely to complete a goal today; showing evening update",
        v29,
        2u);
    }
    BOOL v11 = 1;
  }

  return v11;
}

- (id)nextFireDateWithModel:(id)a3
{
  configuration = self->_configuration;
  id v4 = a3;
  id v5 = [(FCCCompletionOffTrackConfiguration *)configuration percentageOfDayRule];
  id v6 = FCFireDateForPercentOfDayRule(v5, v4);

  return v6;
}

- (id)goalProgressContentForModel:(id)a3
{
  id v4 = a3;
  [(FCCCompletionOffTrackConfiguration *)self->_configuration goalBufferPercentage];
  double v6 = v5;
  v7 = [(FCCCompletionOffTrackConfiguration *)self->_configuration allowedGoalTypes];
  int v8 = [v7 containsObject:&unk_1F2B479C8];

  if (v8) {
    char v9 = [v4 willCompleteMoveGoalWithBufferPercentage:v6];
  }
  else {
    char v9 = 1;
  }
  char v10 = [(FCCCompletionOffTrackConfiguration *)self->_configuration allowedGoalTypes];
  int v11 = [v10 containsObject:&unk_1F2B479E0];

  if (v11) {
    char v12 = [v4 willCompleteExerciseGoalWithBufferPercentage:v6];
  }
  else {
    char v12 = 1;
  }
  double v13 = [(FCCCompletionOffTrackConfiguration *)self->_configuration allowedGoalTypes];
  int v14 = [v13 containsObject:&unk_1F2B479F8];

  if (v14)
  {
    char v15 = [v4 willCompleteStandGoalOrItIsTooLateWithBufferPercentage:v6];
    if ((v9 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_12:
    double v16 = (void *)MEMORY[0x1E4F1CBF0];
    if (v12) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  char v15 = 1;
  if (v9) {
    goto LABEL_12;
  }
LABEL_9:
  double v16 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:&unk_1F2B479C8];
  if ((v12 & 1) == 0)
  {
LABEL_13:
    uint64_t v17 = [v16 arrayByAddingObject:&unk_1F2B479E0];

    double v16 = (void *)v17;
  }
LABEL_14:
  if ((v15 & 1) == 0)
  {
    uint64_t v18 = [v16 arrayByAddingObject:&unk_1F2B479F8];

    double v16 = (void *)v18;
  }
  id v19 = objc_alloc(MEMORY[0x1E4F620E8]);
  int v20 = [(FCCompletionOffTrackEvent *)self eventIdentifier];
  double v21 = (void *)[v19 initWithEventIdentifier:v20 goalTypesToDisplay:v16 goalTypeToHighlight:0 expectedGoalValue:0.0];

  return v21;
}

- (void).cxx_destruct
{
}

@end