@interface DNDNotificationFilterPredicateValidator
- (BOOL)validatePredicate:(id)a3 compileTimeIssues:(id *)a4 runTimeIssues:(id *)a5;
- (void)visitPredicateExpression:(id)a3;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation DNDNotificationFilterPredicateValidator

- (BOOL)validatePredicate:(id)a3 compileTimeIssues:(id *)a4 runTimeIssues:(id *)a5
{
  id v8 = a3;
  compileTimeIssues = self->_compileTimeIssues;
  self->_compileTimeIssues = 0;

  [v8 acceptVisitor:self flags:3];
  if (a4) {
    *a4 = self->_compileTimeIssues;
  }
  if (self->_compileTimeIssues)
  {
    BOOL v10 = 0;
    unint64_t v11 = 0;
  }
  else
  {
    id v16 = 0;
    v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v16];
    id v13 = v16;
    unint64_t v11 = 0;
    if ((unint64_t)[v12 length] >= 0x186A1)
    {
      v14 = [NSString stringWithFormat:@"predicate will be ignored because it is too large"];
      unint64_t v11 = (unint64_t)v14;
      if (a5)
      {
        unint64_t v11 = v14;
        *a5 = (id)v11;
      }
    }

    if ((unint64_t)self->_compileTimeIssues | v11)
    {
      BOOL v10 = 0;
    }
    else
    {
      [v8 allowEvaluation];
      unint64_t v11 = 0;
      BOOL v10 = 1;
    }
  }

  return v10;
}

- (void)visitPredicateOperator:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 operatorType];
  if (v4 > 98)
  {
    if (v4 > 1099)
    {
      if ((unint64_t)(v4 - 1100) < 2 || v4 == 2000) {
        goto LABEL_4;
      }
    }
    else if ((unint64_t)(v4 - 99) < 2 || v4 == 1000)
    {
      goto LABEL_4;
    }
  }
  else if ((unint64_t)v4 <= 0xB)
  {
    if (((1 << v4) & 0x7BF) != 0) {
      goto LABEL_4;
    }
    id v8 = NSString;
    v7 = [v11 symbol];
    [v8 stringWithFormat:@"operator '%@' is not allowed", v7];
    goto LABEL_18;
  }
  uint64_t v5 = [v11 operatorType];
  if ((unint64_t)(v5 - 1100) >= 2 && v5 != 1000 && v5 != 2000)
  {
    v6 = NSString;
    v7 = [v11 symbol];
    [v6 stringWithFormat:@"operator '%@' is not recognized", v7];
LABEL_18:
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    compileTimeIssues = self->_compileTimeIssues;
    self->_compileTimeIssues = v9;
  }
LABEL_4:
}

- (void)visitPredicateExpression:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [v7 expressionType];
  if (v4 > 0x14) {
    goto LABEL_5;
  }
  if (((1 << v4) & 0x10E0E3) != 0) {
    goto LABEL_7;
  }
  if (((1 << v4) & 0x8001C) != 0) {
    [NSString stringWithFormat:@"expression '%@' is not allowed", v7];
  }
  else {
LABEL_5:
  }
  uint64_t v5 = [NSString stringWithFormat:@"expression '%@' is not recognized", v7];
  compileTimeIssues = self->_compileTimeIssues;
  self->_compileTimeIssues = v5;

LABEL_7:
}

- (void).cxx_destruct
{
}

@end