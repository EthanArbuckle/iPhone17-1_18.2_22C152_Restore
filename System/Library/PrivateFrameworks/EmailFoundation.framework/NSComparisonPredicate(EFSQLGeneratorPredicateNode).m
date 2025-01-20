@interface NSComparisonPredicate(EFSQLGeneratorPredicateNode)
+ (id)log;
- (EFSQLGeneratorComparisonPredicateNode)predicateNodeFromPropertyMapper:()EFSQLGeneratorPredicateNode addingTablesUsed:;
@end

@implementation NSComparisonPredicate(EFSQLGeneratorPredicateNode)

- (EFSQLGeneratorComparisonPredicateNode)predicateNodeFromPropertyMapper:()EFSQLGeneratorPredicateNode addingTablesUsed:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [a1 leftExpression];
  v10 = [v9 keyPath];

  v11 = [v7 keyPathMappers];
  v12 = [v11 objectForKeyedSubscript:v10];

  if (!v12)
  {
    v13 = [MEMORY[0x1E4F28B98] log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(a1, "ef_publicDescription");
      [(NSComparisonPredicate(EFSQLGeneratorPredicateNode) *)(uint64_t)v10 predicateNodeFromPropertyMapper:buf addingTablesUsed:v13];
    }

    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"EFSQLGeneratorPredicateNode.m", 131, @"Couldn't map keypath %@ from predicate", v10 object file lineNumber description];
  }
  v16 = [v12 tableName];
  objc_msgSend(v8, "ef_addOptionalObject:", v16);
  v17 = [a1 rightExpression];
  if ([v17 expressionType])
  {
    if ([v17 expressionType] != 3)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"EFSQLGeneratorPredicateNode.m", 142, @"Comparison expression to an invalid type: %lu", objc_msgSend(v17, "expressionType"));
    }
    v18 = [a1 rightExpression];
    v19 = [v18 keyPath];

    v20 = [v7 keyPathMappers];
    v21 = [v20 objectForKeyedSubscript:v19];

    v22 = [v21 tableName];
    [v8 addObject:v22];

    v23 = -[EFSQLGeneratorComparisonPredicateNode initWithValueSource:predicateOperator:comparisonSource:]([EFSQLGeneratorComparisonPredicateNode alloc], "initWithValueSource:predicateOperator:comparisonSource:", v12, [a1 predicateOperatorType], v21);
  }
  else
  {
    v24 = [a1 rightExpression];
    v25 = [v24 constantValue];
    v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      id v27 = [MEMORY[0x1E4F1CA98] null];
    }
    v19 = v27;

    v23 = -[EFSQLGeneratorComparisonPredicateNode initWithValueSource:predicateOperator:constantValue:]([EFSQLGeneratorComparisonPredicateNode alloc], "initWithValueSource:predicateOperator:constantValue:", v12, [a1 predicateOperatorType], v19);
  }

  return v23;
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__NSComparisonPredicate_EFSQLGeneratorPredicateNode__log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_7 != -1) {
    dispatch_once(&log_onceToken_7, block);
  }
  v1 = (void *)log_log_7;
  return v1;
}

- (void)predicateNodeFromPropertyMapper:()EFSQLGeneratorPredicateNode addingTablesUsed:.cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B5A59000, log, OS_LOG_TYPE_ERROR, "Couldn't map keypath %{public}@ from predicate: %{public}@", buf, 0x16u);
}

@end