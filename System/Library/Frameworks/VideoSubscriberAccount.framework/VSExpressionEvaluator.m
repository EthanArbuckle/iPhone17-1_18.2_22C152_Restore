@interface VSExpressionEvaluator
+ (BOOL)automaticallyNotifiesObserversOfValue;
- (BOOL)hasDeterminedValue;
- (BOOL)isMonitoringForChanges;
- (NSArray)observers;
- (NSDictionary)substitutionVariables;
- (NSExpression)expression;
- (id)_observersForExpression:(id)a3;
- (id)_observersForPredicate:(id)a3;
- (id)object;
- (id)value;
- (void)_startMonitoringForChanges;
- (void)_stopMonitoringForChanges;
- (void)_updateComputedResult:(id)a3;
- (void)_updateComputedResultIfNeeded;
- (void)dealloc;
- (void)setExpression:(id)a3;
- (void)setHasDeterminedValue:(BOOL)a3;
- (void)setMonitoringForChanges:(BOOL)a3;
- (void)setObject:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSubstitutionVariables:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation VSExpressionEvaluator

- (void)dealloc
{
  if ([(VSExpressionEvaluator *)self isMonitoringForChanges]) {
    [(VSExpressionEvaluator *)self _stopMonitoringForChanges];
  }
  v3.receiver = self;
  v3.super_class = (Class)VSExpressionEvaluator;
  [(VSExpressionEvaluator *)&v3 dealloc];
}

- (id)_observersForExpression:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [v4 expressionType];
  switch(v6)
  {
    case 0:
    case 1:
      goto LABEL_55;
    case 2:
      id v7 = [v4 variable];
      v8 = [(VSExpressionEvaluator *)self substitutionVariables];
      v9 = [v8 objectForKey:v7];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!v9) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The variableValueOrNil parameter must not be nil."];
        }
        id v10 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v11 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v12 = *MEMORY[0x1E4F1C3C8];
          v13 = (objc_class *)objc_opt_class();
          v14 = NSStringFromClass(v13);
          [v11 raise:v12, @"Unexpectedly, variableValue was %@, instead of NSExpression.", v14 format];
        }
        v15 = [(VSExpressionEvaluator *)self _observersForExpression:v10];
        [v5 addObjectsFromArray:v15];
      }
      goto LABEL_50;
    case 3:
      v26 = [(VSExpressionEvaluator *)self object];
      if (v26)
      {
        v27 = [VSObservance alloc];
        v28 = [v4 keyPath];
        v29 = [(VSObservance *)v27 initWithObject:v26 keyPath:v28 options:0];

        [v5 addObject:v29];
      }

      goto LABEL_55;
    case 4:
      id v7 = [v4 function];
      if (([v7 isEqual:@"sum:"] & 1) != 0
        || ([v7 isEqual:@"count:"] & 1) != 0
        || ([v7 isEqual:@"min:"] & 1) != 0
        || ([v7 isEqual:@"max:"] & 1) != 0
        || ([v7 isEqual:@"average:"] & 1) != 0
        || ([v7 isEqual:@"median:"] & 1) != 0
        || ([v7 isEqual:@"mode:"] & 1) != 0
        || ([v7 isEqual:@"stddev:"] & 1) != 0
        || ([v7 isEqual:@"add:to:"] & 1) != 0
        || ([v7 isEqual:@"from:subtract:"] & 1) != 0
        || ([v7 isEqual:@"multiply:by:"] & 1) != 0
        || ([v7 isEqual:@"divide:by:"] & 1) != 0
        || ([v7 isEqual:@"modulus:by:"] & 1) != 0
        || ([v7 isEqual:@"sqrt:"] & 1) != 0
        || ([v7 isEqual:@"log:"] & 1) != 0
        || ([v7 isEqual:@"ln:"] & 1) != 0
        || ([v7 isEqual:@"raise:toPower:"] & 1) != 0
        || ([v7 isEqual:@"exp:"] & 1) != 0
        || ([v7 isEqual:@"floor:"] & 1) != 0
        || ([v7 isEqual:@"ceiling:"] & 1) != 0
        || ([v7 isEqual:@"abs:"] & 1) != 0
        || ([v7 isEqual:@"trunc:"] & 1) != 0
        || ([v7 isEqual:@"uppercase:"] & 1) != 0
        || ([v7 isEqual:@"lowercase:"] & 1) != 0
        || ([v7 isEqual:@"bitwiseAnd:with:"] & 1) != 0
        || ([v7 isEqual:@"bitwiseOr:with:"] & 1) != 0
        || ([v7 isEqual:@"bitwiseXor:with:"] & 1) != 0
        || ([v7 isEqual:@"leftshift:by:"] & 1) != 0
        || ([v7 isEqual:@"rightshift:by:"] & 1) != 0
        || ([v7 isEqual:@"onesCompliment:"] & 1) != 0
        || ([v7 isEqual:@"distanceToLocation:fromLocation:"] & 1) != 0
        || [v7 isEqual:@"length:"])
      {

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v9 = [v4 arguments];
        uint64_t v21 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v32 != v23) {
                objc_enumerationMutation(v9);
              }
              v25 = [(VSExpressionEvaluator *)self _observersForExpression:*(void *)(*((void *)&v31 + 1) + 8 * i)];
              [v5 addObjectsFromArray:v25];
            }
            uint64_t v22 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
          }
          while (v22);
        }
LABEL_50:
      }
      else
      {

        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported expression: %@", v4 format];
      }
      goto LABEL_51;
    default:
      if (v6 == 20)
      {
        v16 = [v4 predicate];
        v17 = [(VSExpressionEvaluator *)self _observersForPredicate:v16];
        [v5 addObjectsFromArray:v17];

        v18 = [v4 trueExpression];
        v19 = [(VSExpressionEvaluator *)self _observersForExpression:v18];
        [v5 addObjectsFromArray:v19];

        id v7 = [v4 falseExpression];
        v20 = [(VSExpressionEvaluator *)self _observersForExpression:v7];
        [v5 addObjectsFromArray:v20];

LABEL_51:
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported expression: %@", v4 format];
      }
LABEL_55:

      return v5;
  }
}

- (id)_observersForPredicate:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v7 = *MEMORY[0x1E4F1C3C8];
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      [v6 raise:v7, @"Unexpectedly, predicate was %@, instead of NSCompoundPredicate.", v9 format];
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = [v4 subpredicates];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [(VSExpressionEvaluator *)self _observersForPredicate:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          [v5 addObjectsFromArray:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported predicate: %@", v4 format];
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3C8];
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      [v16 raise:v17, @"Unexpectedly, predicate was %@, instead of NSComparisonPredicate.", v19 format];
    }
    id v10 = v4;
    if ([v10 predicateOperatorType] == 11)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported comparison predicate: %@", v10 format];
    }
    else
    {
      v20 = [v10 leftExpression];
      uint64_t v21 = [(VSExpressionEvaluator *)self _observersForExpression:v20];
      [v5 addObjectsFromArray:v21];

      uint64_t v22 = [v10 rightExpression];
      uint64_t v23 = [(VSExpressionEvaluator *)self _observersForExpression:v22];
      [v5 addObjectsFromArray:v23];
    }
  }

LABEL_20:

  return v5;
}

- (void)_startMonitoringForChanges
{
  if (![(VSExpressionEvaluator *)self isMonitoringForChanges])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_super v3 = [(VSExpressionEvaluator *)self expression];
    if (v3)
    {
      id v4 = [(VSExpressionEvaluator *)self _observersForExpression:v3];
      [v5 addObjectsFromArray:v4];
    }
    [v5 makeObjectsPerformSelector:sel_setDelegate_ withObject:self];
    [v5 makeObjectsPerformSelector:sel_startObserving];
    [(VSExpressionEvaluator *)self setObservers:v5];
    [(VSExpressionEvaluator *)self setMonitoringForChanges:1];
  }
}

- (void)_stopMonitoringForChanges
{
  if ([(VSExpressionEvaluator *)self isMonitoringForChanges])
  {
    objc_super v3 = [(VSExpressionEvaluator *)self observers];
    [v3 makeObjectsPerformSelector:sel_stopObserving];

    [(VSExpressionEvaluator *)self setObservers:MEMORY[0x1E4F1CBF0]];
    [(VSExpressionEvaluator *)self setMonitoringForChanges:0];
  }
}

- (void)_updateComputedResult:(id)a3
{
  id v4 = a3;
  id v5 = [(VSExpressionEvaluator *)self expression];
  uint64_t v6 = [(VSExpressionEvaluator *)self object];
  uint64_t v7 = [(VSExpressionEvaluator *)self substitutionVariables];
  v8 = (void *)[v7 mutableCopy];
  id v9 = [v5 expressionValueWithObject:v6 context:v8];

  LODWORD(v5) = [(VSExpressionEvaluator *)self hasDeterminedValue];
  if (!v5 || v9 == v4)
  {
    [(VSExpressionEvaluator *)self setHasDeterminedValue:1];
    [(VSExpressionEvaluator *)self setValue:v9];
  }
  else
  {
    [(VSExpressionEvaluator *)self willChangeValueForKey:@"value"];
    [(VSExpressionEvaluator *)self setHasDeterminedValue:1];
    [(VSExpressionEvaluator *)self setValue:v9];
    [(VSExpressionEvaluator *)self didChangeValueForKey:@"value"];
  }
}

- (void)_updateComputedResultIfNeeded
{
  if ([(VSExpressionEvaluator *)self hasDeterminedValue])
  {
    id v3 = [(VSExpressionEvaluator *)self value];
    [(VSExpressionEvaluator *)self _updateComputedResult:v3];
  }
}

- (NSDictionary)substitutionVariables
{
  v2 = self->_substitutionVariables;
  if (!v2) {
    v2 = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }

  return v2;
}

- (void)setSubstitutionVariables:(id)a3
{
  id v4 = (NSDictionary *)a3;
  if (self->_substitutionVariables != v4)
  {
    id v9 = v4;
    if ([(VSExpressionEvaluator *)self isMonitoringForChanges])
    {
      [(VSExpressionEvaluator *)self _startMonitoringForChanges];
      id v5 = (NSDictionary *)[(NSDictionary *)v9 copy];
      substitutionVariables = self->_substitutionVariables;
      self->_substitutionVariables = v5;

      [(VSExpressionEvaluator *)self _startMonitoringForChanges];
    }
    else
    {
      uint64_t v7 = (NSDictionary *)[(NSDictionary *)v9 copy];
      v8 = self->_substitutionVariables;
      self->_substitutionVariables = v7;
    }
    [(VSExpressionEvaluator *)self _updateComputedResultIfNeeded];
    id v4 = v9;
  }
}

- (void)setObject:(id)a3
{
  if (self->_object != a3)
  {
    if ([(VSExpressionEvaluator *)self isMonitoringForChanges])
    {
      [(VSExpressionEvaluator *)self _stopMonitoringForChanges];
      self->_object = a3;
      [(VSExpressionEvaluator *)self _startMonitoringForChanges];
    }
    else
    {
      self->_object = a3;
    }
    [(VSExpressionEvaluator *)self _updateComputedResultIfNeeded];
  }
}

+ (BOOL)automaticallyNotifiesObserversOfValue
{
  return 0;
}

- (id)value
{
  if ([(VSExpressionEvaluator *)self hasDeterminedValue])
  {
    id v3 = self->_value;
  }
  else
  {
    [(VSExpressionEvaluator *)self _updateComputedResult:0];
    [(VSExpressionEvaluator *)self _startMonitoringForChanges];
    id v3 = [(VSExpressionEvaluator *)self value];
  }

  return v3;
}

- (NSExpression)expression
{
  return self->_expression;
}

- (void)setExpression:(id)a3
{
}

- (id)object
{
  return self->_object;
}

- (void)setValue:(id)a3
{
}

- (BOOL)isMonitoringForChanges
{
  return self->_monitoringForChanges;
}

- (void)setMonitoringForChanges:(BOOL)a3
{
  self->_monitoringForChanges = a3;
}

- (NSArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)hasDeterminedValue
{
  return self->_hasDeterminedValue;
}

- (void)setHasDeterminedValue:(BOOL)a3
{
  self->_hasDeterminedValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_expression, 0);

  objc_storeStrong((id *)&self->_substitutionVariables, 0);
}

@end