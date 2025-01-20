@interface ACHPredicateExpressionValidator
- (id)validateExpressionString:(id)a3;
- (id)validateTemplate:(id)a3;
- (void)_addIssue:(id)a3;
- (void)visitPredicate:(id)a3;
- (void)visitPredicateExpression:(id)a3;
- (void)visitPredicateExpression:(id)a3 keyPathScope:(id)a4 key:(id)a5;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation ACHPredicateExpressionValidator

- (void).cxx_destruct
{
}

- (void)visitPredicateOperator:(id)a3
{
  id v4 = a3;
  v5 = ACHLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACHPredicateExpressionValidator visitPredicateOperator:]();
  }

  unint64_t v6 = [v4 operatorType];
  if (v6 >= 6)
  {
    if (v6 - 99 >= 2) {
      v7 = @"Unknown operator type: %lu";
    }
    else {
      v7 = @"Invalid operator type: %lu";
    }
    if (v6 - 6 >= 6) {
      v8 = v7;
    }
    else {
      v8 = @"Invalid operator type: %lu";
    }
    v9 = objc_msgSend(NSString, "stringWithFormat:", v8, objc_msgSend(v4, "operatorType"));
    [(ACHPredicateExpressionValidator *)self _addIssue:v9];
    self->_operatorsValid = 0;
  }
}

- (id)validateTemplate:(id)a3
{
  id v4 = a3;
  *(_WORD *)&self->_operatorsValid = 257;
  issues = self->_issues;
  self->_issues = 0;

  unint64_t v6 = ACHLogAssets();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACHPredicateExpressionValidator validateTemplate:](v4, v6);
  }

  v7 = [v4 predicate];

  if (v7)
  {
    v8 = [v4 predicate];
    v9 = [v4 sourceName];
    int v10 = [v9 isEqualToString:@"ActivitySharingCompetitions"];

    if (v10)
    {
      uint64_t v11 = [NSString stringWithFormat:@"\"%@\" == 1", v8];

      v8 = (void *)v11;
    }
    v12 = [MEMORY[0x263F08A98] predicateWithFormat:v8];
    [v12 acceptVisitor:self flags:31];
  }
  v13 = [v4 gracePredicate];

  if (v13)
  {
    v14 = (void *)MEMORY[0x263F08A98];
    v15 = [v4 gracePredicate];
    v16 = [v14 predicateWithFormat:v15];

    [v16 acceptVisitor:self flags:31];
  }
  uint64_t v17 = [v4 valueExpression];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [v4 valueExpression];
    uint64_t v20 = [v19 length];

    if (v20)
    {
      v21 = (void *)MEMORY[0x263F087F0];
      v22 = [v4 valueExpression];
      v23 = [v21 expressionWithFormat:v22];

      [v23 acceptVisitor:self flags:31];
    }
  }
  uint64_t v24 = [v4 graceValueExpression];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [v4 graceValueExpression];
    uint64_t v27 = [v26 length];

    if (v27)
    {
      v28 = (void *)MEMORY[0x263F087F0];
      v29 = [v4 graceValueExpression];
      v30 = [v28 expressionWithFormat:v29];

      [v30 acceptVisitor:self flags:31];
    }
  }
  uint64_t v31 = [v4 progressExpression];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [v4 progressExpression];
    uint64_t v34 = [v33 length];

    if (v34)
    {
      v35 = (void *)MEMORY[0x263F087F0];
      v36 = [v4 progressExpression];
      v37 = [v35 expressionWithFormat:v36];

      [v37 acceptVisitor:self flags:31];
    }
  }
  uint64_t v38 = [v4 graceProgressExpression];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [v4 graceProgressExpression];
    uint64_t v41 = [v40 length];

    if (v41)
    {
      v42 = (void *)MEMORY[0x263F087F0];
      v43 = [v4 graceProgressExpression];
      v44 = [v42 expressionWithFormat:v43];

      [v44 acceptVisitor:self flags:31];
    }
  }
  uint64_t v45 = [v4 goalExpression];
  if (v45)
  {
    v46 = (void *)v45;
    v47 = [v4 goalExpression];
    uint64_t v48 = [v47 length];

    if (v48)
    {
      v49 = (void *)MEMORY[0x263F087F0];
      v50 = [v4 goalExpression];
      v51 = [v49 expressionWithFormat:v50];

      [v51 acceptVisitor:self flags:31];
    }
  }
  uint64_t v52 = [v4 graceGoalExpression];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [v4 graceGoalExpression];
    uint64_t v55 = [v54 length];

    if (v55)
    {
      v56 = (void *)MEMORY[0x263F087F0];
      v57 = [v4 graceGoalExpression];
      v58 = [v56 expressionWithFormat:v57];

      [v58 acceptVisitor:self flags:31];
    }
  }
  v59 = [v4 visibilityPredicate];

  if (v59)
  {
    v60 = (void *)MEMORY[0x263F08A98];
    v61 = [v4 visibilityPredicate];
    v62 = [v60 predicateWithFormat:v61];

    [v62 acceptVisitor:self flags:31];
  }
  v63 = [v4 graceVisibilityPredicate];

  if (v63)
  {
    v64 = (void *)MEMORY[0x263F08A98];
    v65 = [v4 graceVisibilityPredicate];
    v66 = [v64 predicateWithFormat:v65];

    [v66 acceptVisitor:self flags:31];
  }
  v67 = [v4 availabilityPredicate];

  if (v67)
  {
    v68 = (void *)MEMORY[0x263F08A98];
    v69 = [v4 availabilityPredicate];
    v70 = [v68 predicateWithFormat:v69];

    [v70 acceptVisitor:self flags:31];
  }
  v71 = [v4 alertabilityPredicate];

  if (v71)
  {
    v72 = (void *)MEMORY[0x263F08A98];
    v73 = [v4 alertabilityPredicate];
    v74 = [v72 predicateWithFormat:v73];

    [v74 acceptVisitor:self flags:31];
  }
  v75 = ACHLogDefault();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
    -[ACHPredicateExpressionValidator validateTemplate:]();
  }

  if (self->_operatorsValid && self->_predicateExpressionValid)
  {
    uint64_t v76 = 1;
  }
  else
  {
    v77 = ACHLogDefault();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
      -[ACHPredicateExpressionValidator validateTemplate:](v4, v77);
    }

    uint64_t v76 = 0;
  }
  v78 = [[ACHPredicateExpressionValidationResult alloc] initWithValid:v76 issues:self->_issues];

  return v78;
}

- (void)visitPredicate:(id)a3
{
  id v3 = a3;
  id v4 = ACHLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ACHPredicateExpressionValidator visitPredicate:]();
  }
}

- (void)visitPredicateExpression:(id)a3 keyPathScope:(id)a4 key:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (__CFString *)a4;
  id v10 = a5;
  uint64_t v11 = ACHLogDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v15 = @"nil";
    *(_DWORD *)buf = 138543874;
    if (v9) {
      v15 = v9;
    }
    *(void *)&buf[4] = v8;
    __int16 v18 = 2114;
    v19 = v15;
    __int16 v20 = 2114;
    id v21 = v10;
    _os_log_debug_impl(&dword_21F582000, v11, OS_LOG_TYPE_DEBUG, "visitPredicateExpression:%{public}@ keyPathScope:%{public}@ key:%{public}@", buf, 0x20u);
  }

  if (visitPredicateExpression_keyPathScope_key__onceToken != -1) {
    dispatch_once(&visitPredicateExpression_keyPathScope_key__onceToken, &__block_literal_global_335);
  }
  if (([(__CFString *)v9 isEqualToString:&stru_26D0EC7B0] & 1) == 0)
  {
    v13 = [(id)visitPredicateExpression_keyPathScope_key__allowedKeysByScope objectForKeyedSubscript:v9];
    v12 = v13;
    if (v13)
    {
      if ([v13 containsObject:v10]) {
        goto LABEL_12;
      }
      [NSString stringWithFormat:@"Invalid scoped key \"%@\" for scope \"%@\"", v10, v9, *(void *)buf];
    }
    else
    {
      [NSString stringWithFormat:@"Invalid scope: %@", v9, v16, *(void *)buf];
    v14 = };
    [(ACHPredicateExpressionValidator *)self _addIssue:v14];
    self->_predicateExpressionValid = 0;

    goto LABEL_12;
  }
  if (([(id)visitPredicateExpression_keyPathScope_key__allowedScopelessKeys containsObject:v10] & 1) == 0)
  {
    v12 = [NSString stringWithFormat:@"Invalid scopeless key \"%@\"", v10];
    [(ACHPredicateExpressionValidator *)self _addIssue:v12];
    self->_predicateExpressionValid = 0;
LABEL_12:
  }
}

- (void)visitPredicateExpression:(id)a3
{
  id v4 = a3;
  v5 = ACHLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ACHPredicateExpressionValidator visitPredicateExpression:](v4, v5);
  }

  if ([v4 expressionType] == 4)
  {
    if (visitPredicateExpression__onceToken != -1) {
      dispatch_once(&visitPredicateExpression__onceToken, &__block_literal_global_3);
    }
    unint64_t v6 = [v4 function];
    v7 = ACHLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ACHPredicateExpressionValidator visitPredicateExpression:]();
    }

    if (([(id)visitPredicateExpression__allowedFunctionNames containsObject:v6] & 1) == 0)
    {
      id v8 = [NSString stringWithFormat:@"Invalid function \"%@\"", v6];
      [(ACHPredicateExpressionValidator *)self _addIssue:v8];
      self->_predicateExpressionValid = 0;
    }
  }
}

uint64_t __60__ACHPredicateExpressionValidator_visitPredicateExpression___block_invoke()
{
  visitPredicateExpression__allowedFunctionNames = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26D0FB050];

  return MEMORY[0x270F9A758]();
}

void __77__ACHPredicateExpressionValidator_visitPredicateExpression_keyPathScope_key___block_invoke()
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D0FB068];
  v1 = (void *)visitPredicateExpression_keyPathScope_key__allowedScopelessKeys;
  visitPredicateExpression_keyPathScope_key__allowedScopelessKeys = v0;

  v5 = @"workout";
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D0FB080];
  v6[0] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = (void *)visitPredicateExpression_keyPathScope_key__allowedKeysByScope;
  visitPredicateExpression_keyPathScope_key__allowedKeysByScope = v3;
}

- (id)validateExpressionString:(id)a3
{
  id v4 = a3;
  *(_WORD *)&self->_operatorsValid = 257;
  issues = self->_issues;
  self->_issues = 0;

  unint64_t v6 = [MEMORY[0x263F087F0] expressionWithFormat:v4];
  [v6 acceptVisitor:self flags:31];
  v7 = ACHLogDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACHPredicateExpressionValidator validateExpressionString:]();
  }

  if (self->_operatorsValid && self->_predicateExpressionValid)
  {
    uint64_t v8 = 1;
  }
  else
  {
    v9 = ACHLogDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ACHPredicateExpressionValidator validateExpressionString:]();
    }

    uint64_t v8 = 0;
  }
  id v10 = [[ACHPredicateExpressionValidationResult alloc] initWithValid:v8 issues:self->_issues];

  return v10;
}

- (void)_addIssue:(id)a3
{
  id v4 = a3;
  if (!self->_issues)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    issues = self->_issues;
    self->_issues = v5;
  }
  v7 = ACHLogDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[ACHPredicateExpressionValidator _addIssue:]();
  }

  [(NSMutableArray *)self->_issues addObject:v4];
}

- (void)validateTemplate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 uniqueName];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_21F582000, a2, OS_LOG_TYPE_FAULT, "Template contains invalid predicate/expression: %{public}@", v4, 0xCu);
}

- (void)validateTemplate:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_21F582000, v0, v1, "validateTemplate result _operatorsValid: %{public}@, _predicateExpressionValid: %{public}@");
}

- (void)validateTemplate:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 uniqueName];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_21F582000, a2, OS_LOG_TYPE_DEBUG, "[ACHPredicateExpressionValidator] validating %@", v4, 0xCu);
}

- (void)validateExpressionString:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_21F582000, v0, OS_LOG_TYPE_FAULT, "Invalid expression string: %{public}@", v1, 0xCu);
}

- (void)validateExpressionString:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_21F582000, v0, v1, "validateExpressionString result _operatorsValid: %{public}@, _predicateExpressionValid: %{public}@");
}

- (void)_addIssue:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21F582000, v0, OS_LOG_TYPE_ERROR, "Adding predicate validation issue: %{public}@", v1, 0xCu);
}

- (void)visitPredicate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21F582000, v0, v1, "visitPredicate: %{public}@", v2, v3, v4, v5, v6);
}

- (void)visitPredicateExpression:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21F582000, v0, v1, "function name \"%{public}@\"", v2, v3, v4, v5, v6);
}

- (void)visitPredicateExpression:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = [a1 expressionType];
  _os_log_debug_impl(&dword_21F582000, a2, OS_LOG_TYPE_DEBUG, "visitPredicateExpression \"%{public}@\", type \"%lu\" ", (uint8_t *)&v3, 0x16u);
}

- (void)visitPredicateOperator:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21F582000, v0, v1, "visitPredicateOperator: %{public}@", v2, v3, v4, v5, v6);
}

@end