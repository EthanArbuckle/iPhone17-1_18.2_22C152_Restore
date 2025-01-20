@interface NSSQLSelectIntermediate
- (BOOL)isTargetColumnsScoped;
- (BOOL)onlyFetchesAggregates;
- (NSSQLSelectIntermediate)initWithEntity:(id)a3 alias:(id)a4 fetchColumns:(id)a5 inScope:(id)a6;
- (id)generateSQLStringInContext:(id)a3;
- (id)initForCorrelationTarget:(id)a3 alias:(id)a4 fetchColumns:(id)a5 inScope:(id)a6;
- (id)resolveVariableExpression:(id)a3 inContext:(id)a4;
- (void)dealloc;
- (void)setColumnAlias:(uint64_t)a1;
- (void)setFetchColumns:(uint64_t)a1;
@end

@implementation NSSQLSelectIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  NSUInteger v4 = [(NSArray *)self->_fetchColumns count];
  if (self->_isCount && v4 > 1) {
    return 0;
  }
  NSUInteger v6 = v4;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT "];
  v8 = v7;
  if (!self->_isCount)
  {
    if (!self->_useDistinct) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  objc_msgSend(v7, "appendString:", @"COUNT( ");
  if ((objc_msgSend((id)objc_msgSend(-[NSArray lastObject](self->_fetchColumns, "lastObject"), "columnName"), "isEqual:", @"*") & 1) == 0)LABEL_8:objc_msgSend(v8, "appendString:", @"DISTINCT "); {
LABEL_9:
  }
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      v10 = [(NSArray *)self->_fetchColumns objectAtIndex:i];
      if (i) {
        [v8 appendString:@", "];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || v10 && (v10[16])
      {
        [v8 appendString:self->_columnAlias];
        [v8 appendString:@"."];
      }
      objc_msgSend(v8, "appendString:", objc_msgSend(v10, "columnName"));
    }
  }
  if (self->_isCount) {
    [v8 appendString:@""]);
  }
  [v8 appendString:@" FROM "];
  entity = self->_entity;
  if (entity)
  {
    objc_msgSend(v8, "appendString:", -[NSSQLEntity tableName](entity, "tableName"));
    [v8 appendString:@" "];
    v12 = &OBJC_IVAR___NSSQLSelectIntermediate__entityAlias;
  }
  else
  {
    v12 = &OBJC_IVAR___NSSQLSelectIntermediate__correlationTarget;
  }
  [v8 appendString:*(Class *)((char *)&self->super.super.isa + *v12)];
  [v8 appendString:@" "];
  return v8;
}

- (NSSQLSelectIntermediate)initWithEntity:(id)a3 alias:(id)a4 fetchColumns:(id)a5 inScope:(id)a6
{
  v9 = [(NSSQLIntermediate *)self initWithScope:a6];
  v10 = v9;
  if (v9)
  {
    v9->_entity = (NSSQLEntity *)a3;
    v9->_entityAlias = (NSString *)[a4 copy];
    v10->_columnAlias = (NSString *)[a4 copy];
    v10->_fetchColumns = (NSArray *)a5;
    v10->_useDistinct = 0;
    v10->_isCount = 0;
  }
  return v10;
}

- (BOOL)isTargetColumnsScoped
{
  return 1;
}

- (void)setFetchColumns:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 40) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 40) = a2;
    }
  }
}

- (void)setColumnAlias:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 56) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 56) = a2;
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSSQLSelectIntermediate;
  [(NSSQLSelectIntermediate *)&v3 dealloc];
}

- (id)initForCorrelationTarget:(id)a3 alias:(id)a4 fetchColumns:(id)a5 inScope:(id)a6
{
  v9 = [(NSSQLIntermediate *)self initWithScope:a6];
  if (v9)
  {
    v9->_correlationTarget = (NSString *)[a3 copy];
    v9->_columnAlias = (NSString *)[a4 copy];
    v9->_fetchColumns = (NSArray *)a5;
    v9->_useDistinct = 0;
    v9->_isCount = 0;
  }
  return v9;
}

- (id)resolveVariableExpression:(id)a3 inContext:(id)a4
{
  return 0;
}

- (BOOL)onlyFetchesAggregates
{
  return 0;
}

@end