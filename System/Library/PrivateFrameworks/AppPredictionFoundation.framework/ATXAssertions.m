@interface ATXAssertions
+ (void)assert:(BOOL)a3 conditionName:(id)a4;
+ (void)assert:(BOOL)a3 conditionName:(id)a4 withDescriptionString:(id)a5;
+ (void)parameterAssert:(id)a3 parameterName:(id)a4;
+ (void)parameterAssert:(id)a3 parameterName:(id)a4 descriptionString:(id)a5;
@end

@implementation ATXAssertions

+ (void)parameterAssert:(id)a3 parameterName:(id)a4
{
}

+ (void)parameterAssert:(id)a3 parameterName:(id)a4 descriptionString:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    if (!a3)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, a1, @"ATXAssertions.m", 28, @"Invalid parameter not satisfying: %@", @"parameter" object file lineNumber description];
    }
  }
  else
  {
    if (v10)
    {
      v12 = [[NSString alloc] initWithFormat:v10 arguments:&v14];
      v13 = __atxlog_handle_default();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        +[ATXAssertions parameterAssert:parameterName:descriptionString:]();
      }
    }
    else
    {
      v12 = __atxlog_handle_default();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        +[ATXAssertions parameterAssert:parameterName:descriptionString:]((uint64_t)v9, v12);
      }
    }
  }
}

+ (void)assert:(BOOL)a3 conditionName:(id)a4
{
}

+ (void)assert:(BOOL)a3 conditionName:(id)a4 withDescriptionString:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    if ([MEMORY[0x1E4F93B08] isInternalBuild]) {
      goto LABEL_7;
    }
LABEL_12:
    v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      +[ATXAssertions assert:conditionName:withDescriptionString:]((uint64_t)v9, v12);
    }
    goto LABEL_14;
  }
  v11 = (void *)[[NSString alloc] initWithFormat:v10 arguments:&v13];
  if (([MEMORY[0x1E4F93B08] isInternalBuild] & 1) == 0)
  {
    if (v11)
    {
      v12 = __atxlog_handle_default();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        +[ATXAssertions assert:conditionName:withDescriptionString:]();
      }
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if (!v11)
  {
LABEL_7:
    if (a3)
    {
      v11 = 0;
      goto LABEL_16;
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"ATXAssertions.m", 72, @"Condition %@ is unexpectedly false.", v9 object file lineNumber description];
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  if (!a3)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"ATXAssertions.m", 70, @"Condition %@ is unexpectedly false - %@", v9, v11 object file lineNumber description];
LABEL_15:
  }
LABEL_16:
}

+ (void)parameterAssert:(uint64_t)a1 parameterName:(NSObject *)a2 descriptionString:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0F2B000, a2, OS_LOG_TYPE_FAULT, "%@ parameter is unexpectedly nil", (uint8_t *)&v2, 0xCu);
}

+ (void)parameterAssert:parameterName:descriptionString:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D0F2B000, v0, v1, "%@ parameter is unexpectedly nil - %@");
}

+ (void)assert:(uint64_t)a1 conditionName:(NSObject *)a2 withDescriptionString:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0F2B000, a2, OS_LOG_TYPE_FAULT, "Condition %@ is unexpectedly false.", (uint8_t *)&v2, 0xCu);
}

+ (void)assert:conditionName:withDescriptionString:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D0F2B000, v0, v1, "Condition %@ is unexpectedly false - %@");
}

@end