@interface NSSQLUpdateIntermediate
- (BOOL)isUpdateScoped;
- (NSSQLUpdateIntermediate)initWithEntity:(id)a3 alias:(id)a4 inScope:(id)a5;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
- (void)setUpdateColumnsIntermediate:(uint64_t)a1;
@end

@implementation NSSQLUpdateIntermediate

- (void)setUpdateColumnsIntermediate:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 64) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 64) = a2;
    }
  }
}

- (NSSQLUpdateIntermediate)initWithEntity:(id)a3 alias:(id)a4 inScope:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NSSQLUpdateIntermediate;
  return [(NSSQLStatementIntermediate *)&v6 initWithEntity:a3 alias:a4 inScope:a5];
}

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  if ([(NSSQLStatementIntermediate *)self governingAlias]) {
    v5 = (__CFString *)[NSString stringWithFormat:@" AS %@", -[NSSQLStatementIntermediate governingAlias](self, "governingAlias")];
  }
  else {
    v5 = &stru_1ED787880;
  }
  objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"UPDATE OR FAIL %@%@ SET ", objc_msgSend(-[NSSQLStatementIntermediate governingEntity](self, "governingEntity"), "tableName"), v5];
  id v7 = [(NSSQLUpdateColumnsIntermediate *)self->_updateColumns generateSQLStringInContext:a3];
  if (!v7)
  {
LABEL_19:

    return 0;
  }
  v8 = v7;
  [v6 appendString:v7];
  whereClause = self->super._whereClause;
  if (whereClause)
  {
    id v10 = [(NSSQLIntermediate *)whereClause generateSQLStringInContext:a3];
    if (!v10) {
      goto LABEL_18;
    }
  }
  else
  {
    id v10 = 0;
  }
  orderIntermediate = self->super._orderIntermediate;
  if (orderIntermediate)
  {
    id v12 = [(NSSQLOrderIntermediate *)orderIntermediate generateSQLStringInContext:a3];
    if (!v12) {
      goto LABEL_17;
    }
  }
  else
  {
    id v12 = 0;
  }
  limitClause = self->super._limitClause;
  if (limitClause)
  {
    id v14 = [(NSSQLLimitIntermediate *)limitClause generateSQLStringInContext:a3];
    if (!v14)
    {

LABEL_17:
LABEL_18:

      goto LABEL_19;
    }
  }
  else
  {
    id v14 = 0;
  }
  if (v10)
  {
    [v6 appendString:@"WHERE "];
    [v6 appendString:v10];
    [v6 appendString:@" "];
  }
  if (v12) {
    [v6 appendString:v12];
  }
  if (v14) {
    [v6 appendString:v14];
  }

  return v6;
}

- (void)dealloc
{
  self->_updateColumns = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLUpdateIntermediate;
  [(NSSQLStatementIntermediate *)&v3 dealloc];
}

- (BOOL)isUpdateScoped
{
  return 1;
}

@end