@interface BKUIFaceIDEnrollGlassesOperationsHandler
- (BOOL)showAddGlassesButton;
- (void)matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction:(id)a3;
@end

@implementation BKUIFaceIDEnrollGlassesOperationsHandler

- (void)matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction:(id)a3
{
  id v4 = a3;
  [(BKUIFaceIDEnrollOperationsHandler *)self setMatchUserThenDoSingleEnrollmentCompletion:v4];
  v5 = objc_alloc_init(BKUIMatchVerifyPearlOperation);
  [(BKUIFaceIDEnrollOperationsHandler *)self setMatchOperation:v5];

  v6 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  uint64_t v7 = [(BKUIFaceIDEnrollOperationsHandler *)self matchOperation];
  [(id)v7 setOperationsDelegate:v6];

  id v19 = 0;
  LOBYTE(v7) = [(BKUIFaceIDEnrollOperationsHandler *)self _matchOperationPreflightCheck:&v19];
  id v8 = v19;
  if (v7)
  {
    if ([(BKUIFaceIDEnrollOperationsHandler *)self enrollmentConfiguration] == 4)
    {
      v9 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
      [v9 setState:3 animated:1];
    }
    objc_initWeak(&location, self);
    v10 = [(BKUIFaceIDEnrollOperationsHandler *)self matchOperation];
    v11 = [(BKUIFaceIDEnrollOperationsHandler *)self device];
    v12 = [(BKUIFaceIDEnrollOperationsHandler *)self identity];
    unint64_t v13 = [(BKUIFaceIDEnrollOperationsHandler *)self enrollmentConfiguration];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke;
    v15[3] = &unk_1E6EA2158;
    objc_copyWeak(&v17, &location);
    id v16 = v4;
    [v10 startMatchOperationWithDevice:v11 identity:v12 credential:v8 withConfiguration:v13 matchOperationActionBlock:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v14 = _BKUILoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[BKUIFaceIDEnrollGlassesOperationsHandler matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction:]();
    }
  }
}

void __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!v3)
  {
    v6 = [WeakRetained matchOperation];
    uint64_t v7 = [v5 matchOperation];
    objc_msgSend(v5, "matchOperation:failedToMatchWithUserPositionSubstate:operationCompleteAction:", v6, objc_msgSend(v7, "lastErrorousSubState"), *(void *)(a1 + 32));

LABEL_13:
    goto LABEL_18;
  }
  if (([WeakRetained supportsPeriocularEnrollment] & 1) == 0)
  {
    id v8 = _BKUILoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_cold_3();
    }

    v9 = [v5 operationsDelegate];
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = -4;
    goto LABEL_17;
  }
  if (([v3 hasPeriocularEnrollment] & 1) == 0)
  {
    v12 = _BKUILoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_cold_2();
    }

    v6 = [v5 matchOperation];
    [v5 matchOperation:v6 failedToMatchWithUserPositionSubstate:11 operationCompleteAction:*(void *)(a1 + 32)];
    goto LABEL_13;
  }
  if (([v3 canAddPeriocularEnrollment] & 1) == 0)
  {
    unint64_t v13 = _BKUILoggingFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_cold_1();
    }

    v9 = [v5 operationsDelegate];
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = -6;
LABEL_17:
    v14 = [v10 errorWithDomain:@"com.apple.biometrickitui.pearl_enroll" code:v11 userInfo:0];
    [v9 endEnrollFlowWithError:v14];

    goto LABEL_18;
  }
  objc_msgSend(v5, "startEnrollForEnrollmentType:glassesRequirement:identity:operationStartedActionBlock:", objc_msgSend(v5, "enrollmentType"), objc_msgSend(v5, "glassesRequirement"), v3, *(void *)(a1 + 32));
LABEL_18:
}

- (BOOL)showAddGlassesButton
{
  if (![(BKUIFaceIDEnrollOperationsHandler *)self supportsPeriocularEnrollment]) {
    return 0;
  }
  id v3 = [(BKUIFaceIDEnrollOperationsHandler *)self identity];
  if ([v3 canAddPeriocularEnrollment])
  {
    id v4 = [(BKUIFaceIDEnrollOperationsHandler *)self identity];
    if ([v4 hasPeriocularEnrollment]) {
      BOOL v5 = [(BKUIFaceIDEnrollOperationsHandler *)self glassesFound];
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4B6C000, v0, v1, "Mathc Operation preflight check failed:", v2, v3, v4, v5, v6);
}

void __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4B6C000, v0, v1, "Periocular enrollment canAddPeriocularEnrollment was NO, slots are prob full.", v2, v3, v4, v5, v6);
}

void __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4B6C000, v0, v1, "Periocular enrollment needed as a prerequisite prior to adding glasses.", v2, v3, v4, v5, v6);
}

void __121__BKUIFaceIDEnrollGlassesOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4B6C000, v0, v1, "This device does not support periocular enrollment", v2, v3, v4, v5, v6);
}

@end