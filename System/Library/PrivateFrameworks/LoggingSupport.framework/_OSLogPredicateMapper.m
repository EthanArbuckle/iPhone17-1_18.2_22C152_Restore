@interface _OSLogPredicateMapper
- (NSArray)validationErrors;
- (NSMutableArray)stack;
- (NSMutableSet)validKeyPaths;
- (NSPredicate)mappedPredicate;
- (_OSLogPredicateMapper)initWithPredicate:(id)a3;
- (_OSLogPredicateMapper)initWithPredicate:(id)a3 andValidate:(BOOL)a4;
- (id)mapEventTypeExpression:(id)a3;
- (id)mapKeywordToConstantExpression:(id)a3 keywordMap:(id)a4;
- (id)mapMessageTypeExpression:(id)a3;
- (id)mapSignpostScopeExpression:(id)a3;
- (id)mapSignpostTypeExpression:(id)a3;
- (unint64_t)flags;
- (void)mapLeftExpression:(id *)a3 andRightExpression:(id *)a4;
- (void)processComparisonPredicate:(id)a3;
- (void)processCompoundPredicate:(id)a3;
- (void)setStack:(id)a3;
- (void)validateExpression:(id)a3;
- (void)visitPredicate:(id)a3;
- (void)visitPredicateExpression:(id)a3;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation _OSLogPredicateMapper

- (void)processCompoundPredicate:(id)a3
{
  stack = self->_stack;
  id v5 = a3;
  uint64_t v6 = [(NSMutableArray *)stack count];
  v7 = [v5 subpredicates];
  uint64_t v8 = v6 - [v7 count];
  v9 = [v5 subpredicates];
  uint64_t v10 = [v9 count];

  -[NSMutableArray subarrayWithRange:](self->_stack, "subarrayWithRange:", v8, v10);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInRange:](self->_stack, "removeObjectsInRange:", v8, v10);
  id v11 = objc_alloc(MEMORY[0x1E4F28BA0]);
  uint64_t v12 = [v5 compoundPredicateType];

  v13 = (void *)[v11 initWithType:v12 subpredicates:v14];
  [(NSMutableArray *)self->_stack addObject:v13];
}

- (void)visitPredicate:(id)a3
{
  id v4 = a3;
  if (!self->_pass)
  {
    id v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(_OSLogPredicateMapper *)self processComparisonPredicate:v5];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(_OSLogPredicateMapper *)self processCompoundPredicate:v5];
      }
      else {
        [(NSMutableArray *)self->_stack addObject:v5];
      }
    }
    id v4 = v5;
  }
}

- (void)processComparisonPredicate:(id)a3
{
  id v4 = a3;
  id v13 = [v4 leftExpression];
  id v12 = [v4 rightExpression];
  [(_OSLogPredicateMapper *)self mapLeftExpression:&v13 andRightExpression:&v12];
  [(_OSLogPredicateMapper *)self mapLeftExpression:&v12 andRightExpression:&v13];
  id v5 = objc_alloc(MEMORY[0x1E4F28B98]);
  id v7 = v12;
  id v6 = v13;
  uint64_t v8 = [v4 comparisonPredicateModifier];
  uint64_t v9 = [v4 predicateOperatorType];
  uint64_t v10 = [v4 options];

  id v11 = (void *)[v5 initWithLeftExpression:v6 rightExpression:v7 modifier:v8 type:v9 options:v10];
  [(NSMutableArray *)self->_stack addObject:v11];
}

- (void)mapLeftExpression:(id *)a3 andRightExpression:(id *)a4
{
  if (mapLeftExpression_andRightExpression__once != -1) {
    dispatch_once(&mapLeftExpression_andRightExpression__once, &__block_literal_global_241);
  }
  if ([*a3 expressionType] == 3)
  {
    id v23 = [*a3 keyPath];
    id v7 = objc_msgSend((id)mapLeftExpression_andRightExpression__keypathMaps, "objectForKeyedSubscript:");

    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28C68];
      uint64_t v9 = [(id)mapLeftExpression_andRightExpression__keypathMaps objectForKeyedSubscript:v23];
      uint64_t v10 = [v8 expressionForKeyPath:v9];
      id v11 = *a3;
      *a3 = v10;
    }
    else
    {
      if (([v23 isEqualToString:@"type"] & 1) != 0
        || [v23 isEqualToString:@"eventType"])
      {
        id v12 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"type"];
        id v13 = *a3;
        *a3 = v12;

        id v14 = [(_OSLogPredicateMapper *)self mapEventTypeExpression:*a4];
      }
      else if ([v23 isEqualToString:@"signpostScope"])
      {
        id v14 = [(_OSLogPredicateMapper *)self mapSignpostScopeExpression:*a4];
      }
      else
      {
        if (![v23 isEqualToString:@"signpostType"])
        {
          if (([v23 isEqualToString:@"messageType"] & 1) == 0
            && ![v23 isEqualToString:@"logType"])
          {
            goto LABEL_12;
          }
          v15 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"logType"];
          id v16 = *a3;
          *a3 = v15;

          v17 = [(_OSLogPredicateMapper *)self mapMessageTypeExpression:*a4];
          id v18 = *a4;
          *a4 = v17;

          if ([*a4 expressionType]) {
            goto LABEL_12;
          }
          v19 = [*a4 constantValue];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            goto LABEL_12;
          }
          uint64_t v9 = [*a4 constantValue];
          uint64_t v21 = [v9 integerValue];
          if (v21 == 2)
          {
            uint64_t v22 = 1;
          }
          else
          {
            if (v21 != 1) {
              goto LABEL_11;
            }
            uint64_t v22 = 2;
          }
          self->_flags |= v22;
          goto LABEL_11;
        }
        id v14 = [(_OSLogPredicateMapper *)self mapSignpostTypeExpression:*a4];
      }
      uint64_t v9 = *a4;
      *a4 = v14;
    }
LABEL_11:

LABEL_12:
  }
}

- (void)visitPredicateExpression:(id)a3
{
  id v4 = a3;
  if (self->_pass == 1)
  {
    id v5 = v4;
    [(_OSLogPredicateMapper *)self validateExpression:v4];
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
}

- (void)validateExpression:(id)a3
{
  id v17 = a3;
  unint64_t v4 = [v17 expressionType];
  if (v4 > 0xE) {
    goto LABEL_8;
  }
  if (((1 << v4) & 0x4403) != 0) {
    goto LABEL_10;
  }
  if (v4 != 3)
  {
LABEL_8:
    validationErrors = self->_validationErrors;
    id v14 = [NSString stringWithFormat:@"invalid expression: %@", v17];
    [(NSMutableArray *)validationErrors addObject:v14];
    goto LABEL_9;
  }
  id v5 = [v17 operand];
  uint64_t v6 = [v5 expressionType];

  if (v6 != 1)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_14;
  }
  id v7 = [v17 arguments];
  uint64_t v8 = [v7 count];

  if (v8 != 1)
  {
LABEL_14:
    _os_assert_log();
    _os_crash();
    __break(1u);
    return;
  }
  uint64_t v9 = [(_OSLogPredicateMapper *)self validKeyPaths];
  uint64_t v10 = [v17 keyPath];
  char v11 = [v9 containsObject:v10];

  if ((v11 & 1) == 0)
  {
    id v12 = self->_validationErrors;
    id v13 = NSString;
    id v14 = [v17 keyPath];
    v15 = [v13 stringWithFormat:@"no such field: %@", v14];
    [(NSMutableArray *)v12 addObject:v15];

LABEL_9:
  }
LABEL_10:
}

- (NSMutableSet)validKeyPaths
{
  if (validKeyPaths_once != -1) {
    dispatch_once(&validKeyPaths_once, &__block_literal_global_665);
  }
  v2 = (void *)validKeyPaths__validKeyPaths;
  return (NSMutableSet *)v2;
}

- (_OSLogPredicateMapper)initWithPredicate:(id)a3 andValidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_OSLogPredicateMapper *)self init];
  if (v7)
  {
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stack = v7->_stack;
    v7->_stack = v8;

    v7->_pass = 0;
    [v6 acceptVisitor:v7 flags:0];
    uint64_t v10 = [(NSMutableArray *)v7->_stack lastObject];
    char v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    validationErrors = v7->_validationErrors;
    v7->_validationErrors = v11;

    if (v4)
    {
      v7->_pass = 1;
      [v10 acceptVisitor:v7 flags:1];
    }
    if (![(NSMutableArray *)v7->_validationErrors count]) {
      objc_storeStrong((id *)&v7->_predicate, v10);
    }
  }
  return v7;
}

- (NSPredicate)mappedPredicate
{
  return self->_predicate;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (_OSLogPredicateMapper)initWithPredicate:(id)a3
{
  return [(_OSLogPredicateMapper *)self initWithPredicate:a3 andValidate:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_validationErrors, 0);
}

- (NSArray)validationErrors
{
  return &self->_validationErrors->super;
}

- (void)setStack:(id)a3
{
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (void)visitPredicateOperator:(id)a3
{
  id v3 = a3;
  _os_crash();
  __break(1u);
}

- (id)mapSignpostTypeExpression:(id)a3
{
  uint64_t v4 = mapSignpostTypeExpression__once;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&mapSignpostTypeExpression__once, &__block_literal_global_226);
  }
  id v6 = [(_OSLogPredicateMapper *)self mapKeywordToConstantExpression:v5 keywordMap:mapSignpostTypeExpression__types];

  return v6;
}

- (id)mapSignpostScopeExpression:(id)a3
{
  uint64_t v4 = mapSignpostScopeExpression__once;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&mapSignpostScopeExpression__once, &__block_literal_global_205);
  }
  id v6 = [(_OSLogPredicateMapper *)self mapKeywordToConstantExpression:v5 keywordMap:mapSignpostScopeExpression__scopes];

  return v6;
}

- (id)mapMessageTypeExpression:(id)a3
{
  uint64_t v4 = mapMessageTypeExpression__once;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&mapMessageTypeExpression__once, &__block_literal_global_171);
  }
  id v6 = [(_OSLogPredicateMapper *)self mapKeywordToConstantExpression:v5 keywordMap:mapMessageTypeExpression__messageTypes];

  return v6;
}

- (id)mapEventTypeExpression:(id)a3
{
  uint64_t v4 = mapEventTypeExpression__once;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&mapEventTypeExpression__once, &__block_literal_global_126);
  }
  id v6 = [(_OSLogPredicateMapper *)self mapKeywordToConstantExpression:v5 keywordMap:mapEventTypeExpression__eventTypes];

  return v6;
}

- (id)mapKeywordToConstantExpression:(id)a3 keywordMap:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 expressionType] == 3)
  {
    id v7 = [v5 keyPath];
    uint64_t v8 = [v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C68];
      uint64_t v10 = [v5 keyPath];
LABEL_8:
      id v14 = (void *)v10;
      v15 = [v6 objectForKeyedSubscript:v10];
      id v16 = [v9 expressionForConstantValue:v15];

      goto LABEL_11;
    }
  }
  if (![v5 expressionType])
  {
    char v11 = [v5 constantValue];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v5 constantValue];
      id v13 = [v6 objectForKeyedSubscript:v12];

      if (v13)
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F28C68];
        uint64_t v10 = [v5 constantValue];
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  id v16 = v5;
LABEL_11:

  return v16;
}

@end