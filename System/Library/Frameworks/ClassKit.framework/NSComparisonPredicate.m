@interface NSComparisonPredicate
- (BOOL)getRightKeyPath:(id *)a3 orRightContstantValue:(id *)a4 error:(id *)a5;
- (BOOL)pd_containsKeyPath:(id)a3;
- (id)leftKeyPath:(id *)a3;
- (id)pd_filterSubpredicatesForKeyPath:(id)a3;
- (void)_populateKeypathValueMap:(id)a3;
@end

@implementation NSComparisonPredicate

- (id)leftKeyPath:(id *)a3
{
  v5 = [(NSComparisonPredicate *)self leftExpression];
  v6 = [v5 keyPath];
  v7 = v6;
  if (!v6 || [v6 containsString:@"."]) {
    +[NSError cls_assignError:a3, 2, @"Expected simple key in left side of comparison expression: %@", self code format];
  }

  return v7;
}

- (BOOL)getRightKeyPath:(id *)a3 orRightContstantValue:(id *)a4 error:(id *)a5
{
  v9 = [(NSComparisonPredicate *)self rightExpression];
  id v10 = [v9 expressionType];
  if (v10)
  {
    if (v10 == (id)3)
    {
      v11 = [v9 keyPath];
      unsigned int v12 = [v11 containsString:@"."];
      if (v12)
      {
        +[NSError cls_assignError:a5, 2, @"Expected constant values or simple keys in right side of comparison expression: %@", self code format];
      }
      else if (a3)
      {
        *a3 = v11;
      }
      char v15 = v12 ^ 1;
    }
    else
    {
      +[NSError cls_assignError:a5, 2, @"Expected constant values or simple keys in right side of comparison expression: %@", self code format];
      char v15 = 0;
    }
  }
  else
  {
    v13 = [v9 constantValue];
    v14 = v13;
    if (a4)
    {
      if (v13)
      {
        *a4 = v13;
      }
      else
      {
        id v16 = +[NSNull null];
        *a4 = v16;
      }
    }

    char v15 = 1;
  }

  return v15;
}

- (void)_populateKeypathValueMap:(id)a3
{
  id v8 = a3;
  v4 = [(NSComparisonPredicate *)self leftExpression];
  v5 = [(NSComparisonPredicate *)self rightExpression];
  if (![v5 expressionType] || objc_msgSend(v4, "expressionType") == (id)3)
  {
    v6 = [v5 constantValue];
    v7 = [v4 keyPath];
    [v8 setObject:v6 forKey:v7];
  }
}

- (id)pd_filterSubpredicatesForKeyPath:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  v5 = [(NSComparisonPredicate *)self leftExpression];
  if ([v5 expressionType] == (id)3)
  {
    uint64_t v6 = [v5 keyPath];
    if (!(v4 | v6))
    {
LABEL_3:
      v7 = 0;
      id v8 = v5;
      goto LABEL_17;
    }
    v9 = (void *)v6;
    id v10 = [v5 keyPath];
    v11 = v10;
    if (v4 && v10)
    {
      unsigned int v12 = [v5 keyPath];
      unsigned __int8 v13 = [v12 isEqualToString:v4];

      if (v13) {
        goto LABEL_3;
      }
    }
    else
    {
    }
  }
  id v8 = [(NSComparisonPredicate *)self rightExpression];

  if ([v8 expressionType] == (id)3)
  {
    uint64_t v14 = [v8 keyPath];
    if (!(v4 | v14))
    {
LABEL_14:
      v7 = 0;
      goto LABEL_17;
    }
    char v15 = (void *)v14;
    id v16 = [v8 keyPath];
    v17 = v16;
    if (v4 && v16)
    {
      v18 = [v8 keyPath];
      unsigned __int8 v19 = [v18 isEqualToString:v4];

      if (v19) {
        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  v7 = self;
LABEL_17:

  return v7;
}

- (BOOL)pd_containsKeyPath:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  v5 = [(NSComparisonPredicate *)self leftExpression];
  if ([v5 expressionType] == (id)3)
  {
    uint64_t v6 = [v5 keyPath];
    if (!(v4 | v6))
    {
LABEL_3:
      unsigned __int8 v7 = 1;
      id v8 = v5;
      goto LABEL_18;
    }
    v9 = (void *)v6;
    id v10 = [v5 keyPath];
    v11 = v10;
    if (v4 && v10)
    {
      unsigned int v12 = [v5 keyPath];
      unsigned __int8 v13 = [v12 isEqualToString:v4];

      if (v13) {
        goto LABEL_3;
      }
    }
    else
    {
    }
  }
  id v8 = [(NSComparisonPredicate *)self rightExpression];

  if ([v8 expressionType] == (id)3)
  {
    uint64_t v14 = [v8 keyPath];
    if (v4 | v14)
    {
      uint64_t v15 = [v8 keyPath];
      id v16 = (void *)v15;
      unsigned __int8 v7 = 0;
      if (v4 && v15)
      {
        v17 = [v8 keyPath];
        unsigned __int8 v7 = [v17 isEqualToString:v4];
      }
    }
    else
    {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
LABEL_18:

  return v7;
}

@end