@interface FCAlmostThereEvent
- (BOOL)_userWillCompleteGoalByEndOfDay:(int64_t)a3 model:(id)a4;
- (BOOL)shouldFireWithTypicalDayModel:(id)a3 evaluationDelegate:(id)a4;
- (FCAlmostThereEvent)initWithConfiguration:(id)a3;
- (double)minimumDayDuration;
- (id)eventIdentifier;
- (id)goalProgressContentForModel:(id)a3;
- (id)nextFireDateWithModel:(id)a3;
@end

@implementation FCAlmostThereEvent

- (FCAlmostThereEvent)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCAlmostThereEvent;
  v6 = [(FCAlmostThereEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (id)eventIdentifier
{
  return (id)[(FCCAlmostThereConfiguration *)self->_configuration identifier];
}

- (double)minimumDayDuration
{
  v2 = [(FCCAlmostThereConfiguration *)self->_configuration timeOfDayRule];
  [v2 minimumDayDuration];
  double v4 = v3;

  return v4;
}

- (BOOL)shouldFireWithTypicalDayModel:(id)a3 evaluationDelegate:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 currentExperienceType] != 1)
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E4F29F08];
    LOBYTE(v13) = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v21) = 0;
    _os_log_impl(&dword_1D3B3E000, v12, OS_LOG_TYPE_DEFAULT, "Almost there event should not fire, fitness junior user", (uint8_t *)&v21, 2u);
LABEL_7:
    LOBYTE(v13) = 0;
    goto LABEL_14;
  }
  v8 = [(FCCAlmostThereConfiguration *)self->_configuration coalescingRules];
  char v9 = FCEventCoalescedWithRules(v8, v7);

  if (v9) {
    goto LABEL_7;
  }
  int v10 = ![(FCAlmostThereEvent *)self _userWillCompleteGoalByEndOfDay:[(FCCAlmostThereConfiguration *)self->_configuration goalType] model:v6];
  if ([(FCCAlmostThereConfiguration *)self->_configuration goalType] == 1) {
    [v6 currentMoveGoalPercentage];
  }
  else {
    [v6 currentExerciseGoalPercentage];
  }
  double v14 = v11;
  [(FCCAlmostThereConfiguration *)self->_configuration minimumPercentageComplete];
  double v16 = v15;
  if (v14 >= v15) {
    BOOL v13 = v10;
  }
  else {
    BOOL v13 = 0;
  }
  _HKInitializeLogging();
  v17 = (void *)*MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    v19 = v17;
    int v21 = 134218752;
    uint64_t v22 = [(FCCAlmostThereConfiguration *)configuration goalType];
    __int16 v23 = 1024;
    int v24 = v10;
    __int16 v25 = 1024;
    BOOL v26 = v14 >= v16;
    __int16 v27 = 1024;
    BOOL v28 = v13;
    _os_log_impl(&dword_1D3B3E000, v19, OS_LOG_TYPE_DEFAULT, "AlmostThere reason evaluating whether to fire for goal type %lu, willEndDayWithGoalIncomplete: %{BOOL}d, hasCrossedAlmostThereGoalThreshold: %{BOOL}d, result: %{BOOL}d", (uint8_t *)&v21, 0x1Eu);
  }
LABEL_14:

  return v13;
}

- (id)nextFireDateWithModel:(id)a3
{
  configuration = self->_configuration;
  id v4 = a3;
  id v5 = [(FCCAlmostThereConfiguration *)configuration timeOfDayRule];
  id v6 = FCFireDateForTimeOfDayRule(v5, v4);

  return v6;
}

- (id)goalProgressContentForModel:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F620E8]);
  id v5 = [(FCAlmostThereEvent *)self eventIdentifier];
  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[FCCAlmostThereConfiguration goalType](self->_configuration, "goalType"));
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v8 = objc_msgSend(v4, "initWithEventIdentifier:goalTypesToDisplay:goalTypeToHighlight:expectedGoalValue:", v5, v7, -[FCCAlmostThereConfiguration goalType](self->_configuration, "goalType"), 0.0);

  return v8;
}

- (BOOL)_userWillCompleteGoalByEndOfDay:(int64_t)a3 model:(id)a4
{
  id v6 = a4;
  [(FCCAlmostThereConfiguration *)self->_configuration goalBufferPercentage];
  double v8 = v7;
  if (a3 == 2)
  {
    [v6 currentExerciseGoalPercentage];
    if (v11 < 1.0)
    {
      char v10 = [v6 willCompleteExerciseGoalWithBufferPercentage:v8];
      goto LABEL_7;
    }
LABEL_8:
    BOOL v12 = 1;
    goto LABEL_10;
  }
  if (a3 != 1)
  {
    BOOL v12 = 0;
    goto LABEL_10;
  }
  [v6 currentMoveGoalPercentage];
  if (v9 >= 1.0) {
    goto LABEL_8;
  }
  char v10 = [v6 willCompleteMoveGoalWithBufferPercentage:v8];
LABEL_7:
  BOOL v12 = v10;
LABEL_10:

  return v12;
}

- (void).cxx_destruct
{
}

@end