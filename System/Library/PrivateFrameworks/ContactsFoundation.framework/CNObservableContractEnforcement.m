@interface CNObservableContractEnforcement
+ (BOOL)shouldEnforceRxProtocols;
+ (BOOL)shouldSwizzleNilResults;
+ (id)os_log;
- (void)observerDidComplete;
- (void)observerDidFailWithError:(id)a3;
- (void)observerDidReceiveResult:(id)a3;
@end

@implementation CNObservableContractEnforcement

- (void).cxx_destruct
{
}

+ (BOOL)shouldSwizzleNilResults
{
  return +[CNObservableContractEnforcementPreferences shouldSwizzleNilResults];
}

- (void)observerDidReceiveResult:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v4 = (__CFString *)a3;
  if (self->_state)
  {
    v5 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(CNObservableContractEnforcement *)&self->_state observerDidReceiveResult:v6];
    }

    v7 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CNObservableContractEnforcement observerDidReceiveResult:]();
    }

    v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CNObservableContractEnforcement observerDidReceiveResult:]((uint64_t)self);
    }

    v9 = CNObserverProtocolExceptionNullMarker[0];
    if (v4) {
      v9 = v4;
    }
    v15[0] = v9;
    v14[0] = CNObserverProtocolExceptionResultKey[0];
    v14[1] = CNObserverProtocolExceptionStateKey;
    v10 = [NSNumber numberWithUnsignedInteger:self->_state];
    v15[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    CNObserverThrowProtocolExceptionWithReason(@"Result after termination", v11);
  }
  if (!v4)
  {
    v12 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CNObservableContractEnforcement observerDidReceiveResult:](v12);
    }

    v13 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CNObservableContractEnforcement observerDidReceiveResult:]();
    }

    CNObserverThrowProtocolExceptionWithReason(@"Result cannot be nil", 0);
  }
}

- (void)observerDidFailWithError:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v4 = (__CFString *)a3;
  if (self->_state)
  {
    v5 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(CNObservableContractEnforcement *)&self->_state observerDidFailWithError:v6];
    }

    v7 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CNObservableContractEnforcement observerDidFailWithError:].cold.5();
    }

    v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CNObservableContractEnforcement observerDidReceiveResult:]();
    }

    v9 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CNObservableContractEnforcement observerDidReceiveResult:]((uint64_t)self);
    }

    v10 = CNObserverProtocolExceptionNullMarker[0];
    if (v4) {
      v10 = v4;
    }
    v18[0] = v10;
    v17[0] = CNObserverProtocolExceptionErrorKey[0];
    v17[1] = CNObserverProtocolExceptionStateKey;
    v11 = [NSNumber numberWithUnsignedInteger:self->_state];
    v18[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    CNObserverThrowProtocolExceptionWithReason(@"Failing after termination", v12);
  }
  self->_state = 2;
  v13 = +[CNObservableContractTerminationContext currentContext];
  terminationContext = self->_terminationContext;
  self->_terminationContext = v13;

  if (!v4)
  {
    v15 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CNObservableContractEnforcement observerDidFailWithError:](v15);
    }

    v16 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CNObservableContractEnforcement observerDidReceiveResult:]();
    }

    CNObserverThrowProtocolExceptionWithReason(@"Error cannot be nil", 0);
  }
}

- (void)observerDidComplete
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*a1 == 1) {
    v3 = @"completed";
  }
  else {
    v3 = @"failed";
  }
  int v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_3_1(&dword_19091D000, a2, a3, "An observer was completed after being %@", (uint8_t *)&v4);
}

+ (BOOL)shouldEnforceRxProtocols
{
  return +[CNObservableContractEnforcementPreferences shouldEnforceRxProtocols];
}

+ (id)os_log
{
  if (os_log_cn_once_token_15 != -1) {
    dispatch_once(&os_log_cn_once_token_15, &__block_literal_global_41);
  }
  v2 = (void *)os_log_cn_once_object_15;

  return v2;
}

uint64_t __41__CNObservableContractEnforcement_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.reactive-extensions", "contract-enforcement");
  uint64_t v1 = os_log_cn_once_object_15;
  os_log_cn_once_object_15 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)observerDidReceiveResult:.cold.1()
{
  os_log_t v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_19091D000, v1, v2, "Call stack: %@", v3, v4, v5, v6, v7);
}

- (void)observerDidReceiveResult:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19091D000, log, OS_LOG_TYPE_ERROR, "An observer was sent a nil result", v1, 2u);
}

- (void)observerDidReceiveResult:(uint64_t)a1 .cold.3(uint64_t a1)
{
  [*(id *)(a1 + 16) threadId];
  [*(id *)(a1 + 16) threadId];
  uint64_t v2 = [*(id *)(a1 + 16) callStack];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_2(&dword_19091D000, v3, v4, "Termination call stack (thread 0x%llx (%llu)): %@", v5, v6, v7, v8, v9);
}

- (void)observerDidReceiveResult:(uint64_t)a3 .cold.5(void *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*a1 == 1) {
    uint64_t v3 = @"completed";
  }
  else {
    uint64_t v3 = @"failed";
  }
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_3_1(&dword_19091D000, a2, a3, "An observer was sent result after being %@", (uint8_t *)&v4);
}

- (void)observerDidFailWithError:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19091D000, log, OS_LOG_TYPE_ERROR, "[Rx] An observer was failed with a nil error", v1, 2u);
}

- (void)observerDidFailWithError:.cold.5()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_19091D000, v0, v1, "Error: %@", v2);
}

- (void)observerDidFailWithError:(uint64_t)a3 .cold.6(void *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*a1 == 1) {
    uint64_t v3 = @"completed";
  }
  else {
    uint64_t v3 = @"failed";
  }
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_3_1(&dword_19091D000, a2, a3, "An observer was failed after being %@", (uint8_t *)&v4);
}

@end