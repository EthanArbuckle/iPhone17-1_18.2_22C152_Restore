@interface CPLPrequeliteTodoVar
+ (id)todoVariableWithName:(id)a3;
+ (id)todoVariableWithName:(id)a3 defaultExpirationInterval:(double)a4;
- (CPLPrequeliteTodoVar)initWithName:(id)a3 defaultExpirationInterval:(double)a4;
- (CPLPrequeliteVariable)currentGenerationVar;
- (CPLPrequeliteVariable)expirationIntervalVar;
- (CPLPrequeliteVariable)lastCompletionDateVar;
- (CPLPrequeliteVariable)targetGenerationVar;
- (PQLInjecting)hasSomethingTodo;
- (PQLInjecting)setHasSomethingTodo;
- (id)hasSomethingTodoNow:(id)a3;
- (id)setHasCompletedGeneration:(int64_t)a3;
- (id)setHasCompletedGeneration:(int64_t)a3 now:(id)a4;
@end

@implementation CPLPrequeliteTodoVar

+ (id)todoVariableWithName:(id)a3
{
  return [a1 todoVariableWithName:a3 defaultExpirationInterval:0.0];
}

+ (id)todoVariableWithName:(id)a3 defaultExpirationInterval:(double)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithName:v6 defaultExpirationInterval:a4];

  return v7;
}

- (CPLPrequeliteTodoVar)initWithName:(id)a3 defaultExpirationInterval:(double)a4
{
  id v7 = a3;
  if (a4 != 0.0 && a4 < 60.0) {
    sub_1001D4778((uint64_t)a2, (uint64_t)self);
  }
  v9 = v7;
  uint64_t v10 = [v7 stringByAppendingString:@"CurrentGeneration"];
  v11 = +[CPLPrequeliteType integerType];
  v12 = +[CPLPrequeliteVariable variableWithName:v10 defaultValue:&off_1002921D8 type:v11];

  uint64_t v13 = [v9 stringByAppendingString:@"TargetGeneration"];
  v14 = +[CPLPrequeliteType integerType];
  v15 = +[CPLPrequeliteVariable variableWithName:v13 defaultValue:&off_1002921D8 type:v14];

  v51 = (void *)v13;
  v52 = (void *)v10;
  v50 = v9;
  if (a4 <= 0.0)
  {
    v54[0] = v12;
    v54[1] = v15;
    v25 = +[NSArray arrayWithObjects:v54 count:2];
    v24 = 0;
    v20 = 0;
  }
  else
  {
    v16 = [v9 stringByAppendingString:@"LastCompletionDate"];
    +[CPLPrequeliteType dateType];
    v18 = v17 = v15;
    +[CPLPrequeliteVariable variableWithName:v16 defaultValue:0 type:v18];
    v20 = v19 = v9;

    v21 = [v19 stringByAppendingString:@"ExpirationInterval"];
    v22 = +[NSNumber numberWithDouble:a4];
    v23 = +[CPLPrequeliteType integerType];
    v15 = v17;
    v24 = +[CPLPrequeliteVariable variableWithName:v21 defaultValue:v22 type:v23];

    v55[0] = v12;
    v55[1] = v17;
    v55[2] = v20;
    v55[3] = v24;
    v25 = +[NSArray arrayWithObjects:v55 count:4];
  }
  v53.receiver = self;
  v53.super_class = (Class)CPLPrequeliteTodoVar;
  v26 = [(CPLPrequeliteVariableGroup *)&v53 initWithVariables:v25];
  v27 = v26;
  if (v26)
  {
    [(CPLPrequeliteVariableGroup *)v26 setShouldNotCacheValue:1];
    v49 = v12;
    objc_storeStrong((id *)&v27->_currentGenerationVar, v12);
    v48 = v15;
    objc_storeStrong((id *)&v27->_targetGenerationVar, v15);
    p_lastCompletionDateVar = (id *)&v27->_lastCompletionDateVar;
    objc_storeStrong((id *)&v27->_lastCompletionDateVar, v20);
    objc_storeStrong((id *)&v27->_expirationIntervalVar, v24);
    id v29 = objc_alloc_init((Class)NSMutableData);
    v30 = [(CPLPrequeliteVariable *)v27->_targetGenerationVar sql];
    [v29 appendData:v30];

    [v29 appendBytes:" = " length:3];
    v31 = [(CPLPrequeliteVariable *)v27->_targetGenerationVar sql];
    [v29 appendData:v31];

    [v29 appendBytes:" + 1" length:4];
    v32 = (PQLInjecting *)[objc_alloc((Class)PQLRawInjection) initWithData:v29];
    setHasSomethingTodo = v27->_setHasSomethingTodo;
    v27->_setHasSomethingTodo = v32;

    v34 = (NSData *)objc_alloc_init((Class)NSMutableData);
    v35 = [(CPLPrequeliteVariable *)v27->_currentGenerationVar sql];
    [(NSData *)v34 appendData:v35];

    [(NSData *)v34 appendBytes:" = ?" length:4];
    id v36 = objc_alloc_init((Class)NSMutableData);
    objc_msgSend(v36, "appendBytes:length:", "(", 1);
    v37 = [(CPLPrequeliteVariable *)v27->_currentGenerationVar sql];
    [v36 appendData:v37];

    [v36 appendBytes:" != " length:4];
    v38 = [(CPLPrequeliteVariable *)v27->_targetGenerationVar sql];
    [v36 appendData:v38];

    if (v27->_lastCompletionDateVar)
    {
      [v36 appendBytes:" OR " length:4];
      v39 = [*p_lastCompletionDateVar sql];
      [v36 appendData:v39];

      [v36 appendBytes:" IS NULL OR " length:12];
      v40 = [*p_lastCompletionDateVar sql];
      [v36 appendData:v40];

      [v36 appendBytes:" > ? OR " length:8];
      v41 = [*p_lastCompletionDateVar sql];
      [v36 appendData:v41];

      [v36 appendBytes:" + " length:3];
      v42 = [(CPLPrequeliteVariable *)v27->_expirationIntervalVar sql];
      [v36 appendData:v42];

      [v36 appendBytes:" < ?" length:4];
      objc_msgSend(v36, "appendBytes:length:", ")", 1);
      objc_storeStrong((id *)&v27->_hasSomethingTodoSQL, v36);
      -[NSData appendBytes:length:](v34, "appendBytes:length:", ", ", 2);
      v43 = [*p_lastCompletionDateVar sql];
      [(NSData *)v34 appendData:v43];

      [(NSData *)v34 appendBytes:" = ?" length:4];
    }
    else
    {
      objc_msgSend(v36, "appendBytes:length:", ")", 1);
      v44 = (PQLInjecting *)[objc_alloc((Class)PQLRawInjection) initWithData:v36];
      hasSomethingTodoConstantInjection = v27->_hasSomethingTodoConstantInjection;
      v27->_hasSomethingTodoConstantInjection = v44;
    }
    setHasCompletedGenerationSQL = v27->_setHasCompletedGenerationSQL;
    v27->_setHasCompletedGenerationSQL = v34;

    v15 = v48;
    v12 = v49;
  }

  return v27;
}

- (PQLInjecting)hasSomethingTodo
{
  v3 = +[NSDate date];
  v4 = [(CPLPrequeliteTodoVar *)self hasSomethingTodoNow:v3];

  return (PQLInjecting *)v4;
}

- (id)setHasCompletedGeneration:(int64_t)a3
{
  v5 = +[NSDate date];
  id v6 = [(CPLPrequeliteTodoVar *)self setHasCompletedGeneration:a3 now:v5];

  return v6;
}

- (id)hasSomethingTodoNow:(id)a3
{
  lastCompletionDateVar = self->_lastCompletionDateVar;
  if (lastCompletionDateVar)
  {
    v5 = [(CPLPrequeliteVariable *)lastCompletionDateVar bindableValueForValue:a3];
    id v6 = [[_CPLPrequeliteHasSomethingTodoNow alloc] initWithSQL:self->_hasSomethingTodoSQL now:v5];
  }
  else
  {
    id v6 = self->_hasSomethingTodoConstantInjection;
  }
  return v6;
}

- (id)setHasCompletedGeneration:(int64_t)a3 now:(id)a4
{
  lastCompletionDateVar = self->_lastCompletionDateVar;
  if (lastCompletionDateVar)
  {
    id v7 = [(CPLPrequeliteVariable *)lastCompletionDateVar bindableValueForValue:a4];
    v8 = [[_CPLPrequeliteHasCompletedGeneration alloc] initWithSQL:self->_setHasCompletedGenerationSQL generation:a3 now:v7];
  }
  else
  {
    v8 = [[_CPLPrequeliteHasCompletedGeneration alloc] initWithSQL:self->_setHasCompletedGenerationSQL generation:a3 now:0];
  }
  return v8;
}

- (PQLInjecting)setHasSomethingTodo
{
  return self->_setHasSomethingTodo;
}

- (CPLPrequeliteVariable)currentGenerationVar
{
  return self->_currentGenerationVar;
}

- (CPLPrequeliteVariable)targetGenerationVar
{
  return self->_targetGenerationVar;
}

- (CPLPrequeliteVariable)lastCompletionDateVar
{
  return self->_lastCompletionDateVar;
}

- (CPLPrequeliteVariable)expirationIntervalVar
{
  return self->_expirationIntervalVar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationIntervalVar, 0);
  objc_storeStrong((id *)&self->_lastCompletionDateVar, 0);
  objc_storeStrong((id *)&self->_targetGenerationVar, 0);
  objc_storeStrong((id *)&self->_currentGenerationVar, 0);
  objc_storeStrong((id *)&self->_setHasSomethingTodo, 0);
  objc_storeStrong((id *)&self->_hasSomethingTodoSQL, 0);
  objc_storeStrong((id *)&self->_hasSomethingTodoConstantInjection, 0);
  objc_storeStrong((id *)&self->_setHasCompletedGenerationSQL, 0);
}

@end