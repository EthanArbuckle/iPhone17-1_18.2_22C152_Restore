@interface IKCSSMediaQuery
+ (id)buildMediaQuery:(id)a3 offset:(unint64_t)a4 consumed:(unint64_t *)a5;
+ (id)buildMediaQueryExpression:(id)a3;
+ (id)buildMediaQueryList:(id)a3 offset:(unint64_t)a4 consumed:(unint64_t *)a5;
+ (id)mediaQueryFromTokenList:(id)a3;
- (BOOL)evaluate;
- (BOOL)evaluated;
- (BOOL)evaluationResult;
- (IKCSSMediaQuery)initWithQueryList:(id)a3;
- (IKCSSMediaQueryList)queryList;
- (id)description;
- (id)queryExpression;
- (void)setNeedsReEvaluation;
@end

@implementation IKCSSMediaQuery

- (IKCSSMediaQuery)initWithQueryList:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKCSSMediaQuery;
  v6 = [(IKCSSMediaQuery *)&v9 init];
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->_evaluated = 0;
    objc_storeStrong((id *)&v6->_queryList, a3);
  }

  return v7;
}

- (id)queryExpression
{
  v2 = [(IKCSSMediaQuery *)self queryList];
  v3 = [v2 expressionAsString];

  return v3;
}

- (BOOL)evaluate
{
  if (self->_evaluated) {
    return self->_evaluationResult;
  }
  BOOL result = [(IKCSSMediaQueryList *)self->_queryList evaluate];
  self->_evaluationResult = result;
  self->_evaluated = 1;
  return result;
}

- (void)setNeedsReEvaluation
{
  self->_evaluated = 0;
}

- (id)description
{
  return (id)[(IKCSSMediaQueryList *)self->_queryList description];
}

+ (id)mediaQueryFromTokenList:(id)a3
{
  uint64_t v8 = 0;
  id v3 = a3;
  v4 = [IKCSSMediaQuery alloc];
  id v5 = +[IKCSSMediaQuery buildMediaQueryList:v3 offset:0 consumed:&v8];

  v6 = [(IKCSSMediaQuery *)v4 initWithQueryList:v5];
  return v6;
}

+ (id)buildMediaQueryList:(id)a3 offset:(unint64_t)a4 consumed:(unint64_t *)a5
{
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(IKCSSMediaQueryOrList);
  if ([v7 count] <= a4)
  {
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v13 = 0;
      v10 = +[IKCSSMediaQuery buildMediaQuery:v7 offset:a4 consumed:&v13];
      [(IKCSSMediaQueryOrList *)v8 addSubQueryList:v10];
      uint64_t v11 = v13;

      a4 += v11 + 1;
      v9 += v11 + 1;
    }
    while (a4 < [v7 count]);
  }
  *a5 = v9;

  return v8;
}

+ (id)buildMediaQuery:(id)a3 offset:(unint64_t)a4 consumed:(unint64_t *)a5
{
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(IKCSSMediaQueryAndList);
  uint64_t v9 = 0;
  if ([v7 count] > a4)
  {
    char v10 = 0;
    while (1)
    {
      uint64_t v11 = [v7 objectAtIndex:a4 + v9];
      if ([v11 type] == 1) {
        break;
      }
      if ([v11 type] == 6)
      {
        if ((v10 & 1) == 0) {
          [(IKCSSMediaQueryAndList *)v8 setType:@"all"];
        }
        v12 = +[IKCSSMediaQuery buildMediaQueryExpression:v11];
        v15 = [(IKCSSMediaQueryAndList *)v8 type];
        [v12 setMediaType:v15];

        [(IKCSSMediaQueryAndList *)v8 addQuery:v12];
LABEL_13:
        char v10 = 1;
        goto LABEL_14;
      }
LABEL_15:

      ++v9;
      if (a4 + v9 >= [v7 count]) {
        goto LABEL_19;
      }
    }
    v12 = [v11 token];
    if ([v12 type] != 1)
    {
      if ([v12 type] == 14)
      {

        goto LABEL_19;
      }
      if (!(([v12 type] != 18) | v10 & 1))
      {
        uint64_t v13 = [v12 stringValue];
        int v14 = [v13 isEqualToString:@"not"];

        if (!v14)
        {
          v16 = [v12 stringValue];
          [(IKCSSMediaQueryAndList *)v8 setType:v16];

          goto LABEL_13;
        }
        [(IKCSSMediaQueryAndList *)v8 setNegated:1];
        char v10 = 0;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_19:
  *a5 = v9;

  return v8;
}

+ (id)buildMediaQueryExpression:(id)a3
{
  id v3 = a3;
  v4 = [v3 cssValue];
  if (![v4 count])
  {
    v6 = 0;
    v27 = 0;
    uint64_t v9 = 0;
    v26 = 0;
    goto LABEL_51;
  }
  BOOL v5 = 0;
  v6 = 0;
  v32 = 0;
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  double v10 = 0.0;
  do
  {
    uint64_t v11 = [v4 objectAtIndex:v7];
    if ([v11 type] != 1)
    {
      BOOL v13 = 0;
      goto LABEL_17;
    }
    v12 = [v11 token];
    if ([v12 type] == 1) {
      goto LABEL_5;
    }
    uint64_t v14 = [v12 type];
    if (!v6)
    {
      if (v14 == 18)
      {
        v6 = [v12 stringValue];
        BOOL v13 = 0;
        uint64_t v8 = 4;
        goto LABEL_16;
      }
      v6 = 0;
LABEL_5:
      BOOL v13 = 0;
      goto LABEL_16;
    }
    if (!v5)
    {
      BOOL v13 = 0;
      BOOL v5 = v14 == 21;
      goto LABEL_16;
    }
    if (v14 == 18 || [v12 type] == 3)
    {
      uint64_t v15 = [v12 stringValue];

      uint64_t v8 = 1;
      uint64_t v9 = (void *)v15;
      BOOL v13 = 1;
LABEL_12:
      BOOL v5 = 1;
      goto LABEL_16;
    }
    if ([v12 type] == 11)
    {
      [v12 doubleValue];
      double v10 = v16;
      v17 = [v12 properties];
      v18 = v17;
      BOOL v13 = v17 != 0;
      if (v17)
      {
        [v17 objectForKey:@"unit"];
        uint64_t v19 = v29 = v3;

        uint64_t v8 = 3;
        v32 = (void *)v19;
        id v3 = v29;
      }

      goto LABEL_12;
    }
    if ([v12 type] != 13)
    {
      BOOL v13 = 0;
      goto LABEL_12;
    }
    [v12 doubleValue];
    double v10 = v20;
    unint64_t v21 = v7 + 1;
    if (v7 + 1 >= [v4 count])
    {
      BOOL v13 = 0;
      BOOL v5 = 1;
      uint64_t v8 = 2;
      goto LABEL_16;
    }
    id v30 = v3;
    BOOL v13 = 0;
    char v31 = 0;
    while (1)
    {
      v22 = [v4 objectAtIndex:v21];
      if ([v22 type] == 1) {
        break;
      }
LABEL_37:

      ++v21;
      BOOL v5 = 1;
      if (v21 >= [v4 count]) {
        goto LABEL_42;
      }
    }
    v23 = [v22 token];
    if ([v23 type] == 1) {
      goto LABEL_36;
    }
    uint64_t v24 = [v23 type];
    if (v31)
    {
      if (v24 == 13)
      {
        [v23 doubleValue];
        BOOL v13 = 1;
        char v31 = 1;
        double v10 = v10 / v25;
      }
      else
      {
LABEL_35:
        char v31 = 1;
      }
LABEL_36:

      goto LABEL_37;
    }
    if (v24 == 5 && [v23 charValue] == 47) {
      goto LABEL_35;
    }

    BOOL v5 = 1;
LABEL_42:
    uint64_t v8 = 2;
    id v3 = v30;
LABEL_16:

LABEL_17:
    ++v7;
  }
  while (v7 < [v4 count] && !v13);
  if (v8)
  {
    v26 = objc_alloc_init(IKCSSMediaQueryExpression);
    [(IKCSSMediaQueryExpression *)v26 setType:v8];
    [(IKCSSMediaQueryExpression *)v26 setKey:v6];
    if (v8 == 1)
    {
      [(IKCSSMediaQueryExpression *)v26 setStringValue:v9];
      goto LABEL_50;
    }
    [(IKCSSMediaQueryExpression *)v26 setDoubleValue:v10];
    if (v8 == 3)
    {
      v27 = v32;
      [(IKCSSMediaQueryExpression *)v26 setDimension:v32];
      goto LABEL_51;
    }
  }
  else
  {
    v26 = 0;
  }
LABEL_50:
  v27 = v32;
LABEL_51:

  return v26;
}

- (BOOL)evaluated
{
  return self->_evaluated;
}

- (BOOL)evaluationResult
{
  return self->_evaluationResult;
}

- (IKCSSMediaQueryList)queryList
{
  return self->_queryList;
}

- (void).cxx_destruct
{
}

@end